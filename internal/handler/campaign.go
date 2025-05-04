package handler

import (
	"context"

	pb "pratikshakuldeep456/grpc-server/gen/pb"
	"pratikshakuldeep456/grpc-server/internal/model"
	"pratikshakuldeep456/grpc-server/internal/service"
	"pratikshakuldeep456/grpc-server/internal/utils"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type CampaignHandler struct {
	pb.UnimplementedCampaignServiceServer
	Service *service.Service
}

func NewCampaignHandler(service *service.Service) *CampaignHandler {
	return &CampaignHandler{
		Service: service,
	}
}

func (h *CampaignHandler) GetCampaign(ctx context.Context, req *pb.GetCampaignRequest) (*pb.GetCampaignResponse, error) {

	if err := ValidateStruct(req); err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "validation failed: %v", err)
	}
	return h.Service.GetCampaign(ctx, req)
}

func (h *CampaignHandler) CreateCampaign(ctx context.Context, req *pb.CreateCampaignRequest) (*pb.CreateCampaignResponse, error) {
	if len(req.Campaign) == 0 {
		return nil, status.Error(codes.InvalidArgument, "at least one campaign must be provided")
	}

	var campaignModels []*model.Campaign
	for i, c := range req.Campaign {
		campaign := &model.Campaign{
			ID:            utils.GenerateUUID(),
			Name:          c.Name,
			Description:   c.Description,
			StartTime:     utils.ParseTime(c.StartTime),
			EndTime:       utils.ParseTime(c.EndTime),
			Active:        c.Active,
			Priority:      int(c.Priority),
			ConditionJSON: c.ConditionJson,
		}
		if err := ValidateStruct(campaign); err != nil {
			return nil, status.Errorf(codes.InvalidArgument, "campaign %d validation failed: %v", i+1, err)
		}

		campaignModels = append(campaignModels, campaign)
	}

	return h.Service.CreateCampaign(ctx, campaignModels)
}
