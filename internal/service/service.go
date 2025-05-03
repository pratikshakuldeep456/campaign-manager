package service

import (
	"context"
	pb "pratikshakuldeep456/grpc-server/gen/pb"
	"pratikshakuldeep456/grpc-server/internal/model"
	"pratikshakuldeep456/grpc-server/internal/store"
	"time"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type Service struct {
	CampaignStore *store.CampaignStore
}

// Constructor with injection
func NewService(store *store.CampaignStore) *Service {
	return &Service{CampaignStore: store}
}

func (s *Service) GetCampaign(ctx context.Context, req *pb.GetCampaignRequest) (*pb.GetCampaignResponse, error) {
	campaign, err := s.CampaignStore.GetByID(ctx, req.GetCampaignId())
	if err != nil {
		return nil, err
	}

	return &pb.GetCampaignResponse{
		CampaignId: campaign.ID,
		Name:       campaign.Name,
		Budget:     float64(campaign.Priority),
		Status: func() string {
			if campaign.Active {
				return "ACTIVE"
			}
			return "INACTIVE"
		}(),
	}, nil
}

func (s *Service) CreateCampaign(ctx context.Context, req *pb.CreateCampaignRequest) (*pb.CreateCampaignResponse, error) {
	c := req.Campaign
	if c == nil {
		return &pb.CreateCampaignResponse{
			Status:  "ERROR",
			Message: "Campaign data missing",
		}, nil
	}

	startTime, err := time.Parse(time.RFC3339, c.StartTime)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "Invalid start_time: %v", err)
	}
	endTime, err := time.Parse(time.RFC3339, c.EndTime)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "Invalid end_time: %v", err)
	}

	campaign := &model.Campaign{
		ID:            c.Id,
		Name:          c.Name,
		Description:   c.Description,
		StartTime:     startTime,
		EndTime:       endTime,
		Active:        c.Active,
		Priority:      int(c.Priority),
		ConditionJSON: c.ConditionJson,
	}
	if err := s.CampaignStore.Create(ctx, campaign); err != nil {
		return nil, status.Errorf(codes.Internal, "Failed to create campaign: %v", err)
	}

	return &pb.CreateCampaignResponse{
		Status:  "SUCCESS",
		Message: "Campaign created successfully",
	}, nil
}
