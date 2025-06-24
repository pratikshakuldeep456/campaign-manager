package handler

import (
	"fmt"
	"time"

	cmV1 "pratikshakuldeep456/campaign-manager/gen/go/cm/v1"
	"pratikshakuldeep456/campaign-manager/internal/model"
)

func MapProtoRequestToInternal(req *cmV1.EvaluateRequest) (model.EvaluationRequest, error) {

	if req == nil {
		return model.EvaluationRequest{}, fmt.Errorf("gRPC request is nil")
	}
	if req.GetUserId() == "" {
		return model.EvaluationRequest{}, fmt.Errorf("missing required field: user_id")
	}
	if req.GetStoreId() == "" {
		return model.EvaluationRequest{}, fmt.Errorf("missing required field: store_id")
	}

	items := make([]model.ItemInput, 0, len(req.GetItems()))
	for i, protoItem := range req.GetItems() {
		if protoItem == nil {
			return model.EvaluationRequest{}, fmt.Errorf("invalid item input at index %d: item is nil", i)
		}
		if protoItem.GetSkuId() == "" {
			return model.EvaluationRequest{}, fmt.Errorf("invalid item input at index %d: missing sku_id", i)
		}
		items = append(items, model.ItemInput{
			SKUID:     protoItem.GetSkuId(),
			BasePrice: protoItem.GetBasePrice(),
		})
	}

	internalReq := model.EvaluationRequest{
		StoreID:   req.GetStoreId(),
		UserID:    req.GetUserId(),
		Items:     items,
		UserGroup: req.UserGroups,
		Timestamp: time.Now().UTC().In(time.FixedZone("IST", 5*60*60+30*60)),
	}
	return internalReq, nil
}

func MapInternalResponseToProto(resp *model.EvaluationResponse) *cmV1.EvaluateResponse {
	if resp == nil {
		return &cmV1.EvaluateResponse{}
	}

	protoResults := make([]*cmV1.EvaluationResult, 0, len(resp.Results))
	for _, internalResult := range resp.Results {
		appliedID := ""

		if internalResult.EvaluationError == nil && internalResult.AppliedCampaignID != nil {
			appliedID = *internalResult.AppliedCampaignID
		}

		protoResults = append(protoResults, &cmV1.EvaluationResult{
			SkuId:             internalResult.SKUID,
			OriginalPrice:     internalResult.OriginalPrice,
			FinalPrice:        internalResult.FinalPrice,
			AppliedCampaignId: appliedID,
		})
	}

	return &cmV1.EvaluateResponse{
		RequestId: resp.RequestID,
		Results:   protoResults,
	}
}
