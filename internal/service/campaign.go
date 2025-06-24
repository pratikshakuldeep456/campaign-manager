package service

import (
	"context"
	"fmt"
	"time"

	"go.uber.org/zap"

	"pratikshakuldeep456/campaign-manager/internal/engine"
	"pratikshakuldeep456/campaign-manager/internal/model"
	"pratikshakuldeep456/campaign-manager/internal/store"
)

type Service interface {
	Evaluate(ctx context.Context, req model.EvaluationRequest) (*model.EvaluationResponse, error)
}

type Campaign struct {
	campaignStore *store.CampaignStore
	ruleEngine    *engine.Engine
	logger        *zap.Logger
	concurrency   int
}

func NewCampaign(campaignStore *store.CampaignStore, ruleEngine *engine.Engine, logger *zap.Logger, concurrency int) *Campaign {
	return &Campaign{
		campaignStore: campaignStore,
		ruleEngine:    ruleEngine,
		logger:        logger,
		concurrency:   concurrency,
	}
}

func (s *Campaign) Evaluate(ctx context.Context, req model.EvaluationRequest) (*model.EvaluationResponse, error) {
	l := s.logger.With(
		zap.String("requestID", req.RequestID),
		zap.String("storeID", req.StoreID),
		zap.String("userID", req.UserID),
		zap.Int("itemCount", len(req.Items)),
	)
	start := time.Now()

	userGroups := req.UserGroup

	candidateCampaigns, err := s.campaignStore.GetActiveCampaignsForContext(ctx, req.StoreID, userGroups, req.Timestamp)
	if err != nil {
		l.Error("Failed to fetch campaigns from store", zap.Error(err))
		return nil, fmt.Errorf("failed to retrieve campaign data")
	}
	if len(candidateCampaigns) == 0 {
		l.Info("No candidate campaigns found for context, returning base prices")
		return s.buildBasePriceResponse(req), nil
	}
	l.Debug("Fetched and sorted candidate campaigns", zap.Any("count", candidateCampaigns))

	response := &model.EvaluationResponse{
		RequestID: req.RequestID,
		Results:   make([]model.EvaluationResponseItem, len(req.Items)),
	}

	s.ruleEngine.EvaluateItems(ctx, req.Items, candidateCampaigns, req.UserID, req.Timestamp, response)
	evaluationDuration := time.Since(start)
	l.Info("Campaign evaluation completed", zap.Duration("duration", evaluationDuration))
	return response, nil
}

func (s *Campaign) buildBasePriceResponse(req model.EvaluationRequest) *model.EvaluationResponse {
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
