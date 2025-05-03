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
	if req.Campaign == nil || req.Campaign.Name == "" || req.Campaign.Id == "" {
		return nil, status.Error(codes.InvalidArgument, "ID and Name are required")
	}

	campaign := &model.Campaign{
		ID:            req.Campaign.Id,
		Name:          req.Campaign.Name,
		Description:   req.Campaign.Description,
		StartTime:     utils.ParseTime(req.Campaign.StartTime),
		EndTime:       utils.ParseTime(req.Campaign.EndTime),
		Active:        req.Campaign.Active,
		Priority:      int(req.Campaign.Priority),
		ConditionJSON: req.Campaign.ConditionJson,
	}

	if err := ValidateStruct(campaign); err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "validation failed: %v", err)
	}

	return h.Service.CreateCampaign(ctx, req)
}
