package engine

import (
	"context"
	"encoding/json"
	"fmt"
	"pratikshakuldeep456/campaign-manager/internal/app/user"
	"pratikshakuldeep456/campaign-manager/internal/model"
	"sync"
	"time"

	"github.com/expr-lang/expr"
	"go.uber.org/zap"
)

const (
	userService = "user"
)

type Engine struct {
	userClient  *user.UserClient
	logger      *zap.Logger
	concurrency int
}

func NewEngine(userClient *user.UserClient, logger *zap.Logger, concurrency int) *Engine {
	return &Engine{
		userClient:  userClient,
		logger:      logger,
		concurrency: concurrency,
	}
}

func (e *Engine) EvaluateItems(ctx context.Context, items []model.ItemInput, candidateCampaigns []*model.Campaign, userID string, timestamp time.Time, response *model.EvaluationResponse) {
	itemCount := len(items)
	e.logger.Debug("Starting concurrent evaluation", zap.Int("itemCount", itemCount), zap.Int("concurrency", e.concurrency))

	env := make(map[string]interface{})

	semaphore := make(chan struct{}, e.concurrency)
	var wg sync.WaitGroup

	for idx, item := range items {
		wg.Add(1)
		semaphore <- struct{}{}

		go func(idx int, item model.ItemInput) {
			defer func() {
				<-semaphore
				wg.Done()
			}()

			result := e.evaluateSingleItem(ctx, item, userID, candidateCampaigns, env)

			response.Results[idx] = result
		}(idx, item)
	}

	wg.Wait()
	close(semaphore)
}

func (e *Engine) evaluateSingleItem(ctx context.Context, item model.ItemInput, userID string, candidateCampaigns []*model.Campaign, env map[string]interface{}) model.EvaluationResponseItem {
	l := e.logger.With(zap.String("sku", item.SKUID))

	resultItem := model.EvaluationResponseItem{
		SKUID:         item.SKUID,
		OriginalPrice: item.BasePrice,
		FinalPrice:    item.BasePrice,
	}
	var winningCampaign *model.Campaign = nil

	for _, campaign := range candidateCampaigns {
		tr := campaign.TargetingRule
		if tr == nil {
			l.Error("Internal error: TargetingRule not populated for campaign", zap.String("campaignID", campaign.ID))
			continue
		}

		if !isSkuApplicable(tr, item.SKUID) {
			continue
		}

		if len(tr.RuleExpression) != 0 {
			l.Debug("Evaluating rule expression", zap.Any("expression", tr.RuleExpression), zap.Any("metadata", env))
			rulesSatisfied := true
			for service, expressions := range tr.RuleExpression {
				env, err := e.enrichEnv(ctx, service, env, userID)
				if err != nil {
					l.Error("Failed to enrich environment", zap.String("service", service), zap.Error(err))
					rulesSatisfied = false
					break
				}
				for _, expression := range expressions {
					program, err := expr.Compile(expression, expr.Env(env))
					if err != nil {
						l.Debug("Expression compilation failed", zap.String("expression", expression), zap.Error(err))
						rulesSatisfied = false
						break
					}
					result, err := expr.Run(program, env)
					if err != nil {
						l.Debug("Expression evaluation failed", zap.String("expression", expression), zap.Error(err))
						rulesSatisfied = false
						break
					}
					l.Debug("Expression evaluation result", zap.String("expression", expression), zap.Any("result", result))
					if result == false {
						rulesSatisfied = false
						break
					}
				}
			}
			if rulesSatisfied == false {
				continue
			}
		}

		winningCampaign = campaign
		l.Debug("Found winning campaign for item", zap.String("campaignID", winningCampaign.ID), zap.Int("priority", winningCampaign.Priority))
		break
	}

	if winningCampaign != nil {
		modDetail := model.ModificationDetail{
			Type:  winningCampaign.ModificationType,
			Value: winningCampaign.ModificationValue,
		}

		finalPrice, err := applyModification(item.BasePrice, modDetail)
		if err != nil {
			l.Error("Error applying modification calculation",
				zap.String("campaignID", winningCampaign.ID),
				zap.Any("modification", modDetail),
				zap.Error(err))
			resultItem.EvaluationError = ptr(fmt.Sprintf("Error applying modification: %v", err))
		} else {
			resultItem.FinalPrice = finalPrice
			appliedID := winningCampaign.ID
			resultItem.AppliedCampaignID = &appliedID
		}
	} else {
		l.Debug("No applicable campaign found for item")
	}

	return resultItem
}

func (e *Engine) enrichEnv(ctx context.Context, service string, env map[string]interface{}, userID string) (map[string]interface{}, error) {
	if service == "" {
		return nil, fmt.Errorf("service name cannot be empty")
	}
	if _, ok := env[service]; ok {
		return env, nil
	}
	if service == userService {
		user, err := e.userClient.GetUser(ctx, userID)
		if err != nil {
			e.logger.Error("Failed to fetch user data", zap.Error(err))
			return nil, fmt.Errorf("failed to retrieve user data: %w", err)
		}
		userENV, err := CreateExprEnvFromStruct(user)
		if err != nil {
			return nil, fmt.Errorf("failed to create expression environment")
		}
		env[service] = userENV
		return env, nil
	}
	return nil, fmt.Errorf("unsupported service: %s", service)
}

func (e *Engine) buildBasePriceResponse(req model.EvaluationRequest) *model.EvaluationResponse {
	results := make([]model.EvaluationResponseItem, len(req.Items))
	for i, item := range req.Items {
		results[i] = model.EvaluationResponseItem{
			SKUID:         item.SKUID,
			OriginalPrice: item.BasePrice,
			FinalPrice:    item.BasePrice,
		}
	}
	return &model.EvaluationResponse{
		RequestID: req.RequestID,
		Results:   results,
	}
}

func isSkuApplicable(tr *model.TargetingRule, skuID string) bool {
	if tr.TargetAllSkus {
		return true
	}
	if len(tr.TargetSkus) == 0 {
		return true
	}
	for _, targetSku := range tr.TargetSkus {
		if targetSku == skuID {
			return true
		}
	}
	return false
}

func applyModification(basePrice float64, mod model.ModificationDetail) (float64, error) {
	finalPrice := basePrice

	switch mod.Type {
	case model.FlatPrice:
		finalPrice = mod.Value
	case model.IncreaseAbsolute:
		finalPrice = basePrice + mod.Value
	case model.DecreaseAbsolute:
		finalPrice = basePrice - mod.Value
	case model.PercentageDiscount:
		if mod.Value < 0 || mod.Value > 100 {
			return basePrice, fmt.Errorf("invalid percentage value: %.2f", mod.Value)
		}
		discountAmount := basePrice * (mod.Value / 100.0)
		finalPrice = basePrice - discountAmount
	default:
		return basePrice, fmt.Errorf("unknown modification type: %s", mod.Type)
	}

	if finalPrice < 0 {
		finalPrice = 0
	}

	return finalPrice, nil
}

func ptr(s string) *string {
	return &s
}

func CreateExprEnvFromStruct(data interface{}) (map[string]interface{}, error) {
	var dataMap map[string]interface{}

	jsonData, err := json.Marshal(data)
	if err != nil {
		return nil, fmt.Errorf("failed to marshal data to JSON: %w", err)
	}

	err = json.Unmarshal(jsonData, &dataMap)
	if err != nil {
		return nil, fmt.Errorf("failed to unmarshal JSON data to map: %w", err)
	}
	return dataMap, nil
}
