package service

import (
	"context"
	"fmt"
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
	ts, err := time.Parse(time.RFC3339, req.Timestamp)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid timestamp format: %v", err)
	}

	campaigns, err := s.CampaignStore.ListActiveCampaigns(ctx, ts)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to fetch campaigns: %v", err)
	}

	var pbCampaigns []*pb.CampaignData
	for _, c := range campaigns {
		pbCampaigns = append(pbCampaigns, &pb.CampaignData{
			CampaignId:    c.ID,
			Name:          c.Name,
			Description:   c.Description,
			StartTime:     c.StartTime.Format(time.RFC3339),
			EndTime:       c.EndTime.Format(time.RFC3339),
			Priority:      int32(c.Priority),
			ConditionJson: c.ConditionJSON,
			CreatedAt:     c.CreatedAt.Format(time.RFC3339),
			UpdatedAt:     c.UpdatedAt.Format(time.RFC3339),
		})
	}

	return &pb.GetCampaignResponse{Campaigns: pbCampaigns}, nil
}

func (s *Service) CreateCampaign(ctx context.Context, req []*model.Campaign) (*pb.CreateCampaignResponse, error) {
	if len(req) == 0 {
		return &pb.CreateCampaignResponse{
			Status:  "ERROR",
			Message: "No campaign data provided",
		}, nil
	}

	ids, err := s.CampaignStore.BulkCreate(ctx, req)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to insert campaigns: %v", err)
	}

	return &pb.CreateCampaignResponse{
		Status:  "SUCCESS",
		Message: fmt.Sprintf("%d campaigns created", len(ids)),
	}, nil
}
