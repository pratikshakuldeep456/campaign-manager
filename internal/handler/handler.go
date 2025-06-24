package handler

import (
	"context"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	cmv1 "pratikshakuldeep456/campaign-manager/gen/go/cm/v1"
	"pratikshakuldeep456/campaign-manager/internal/service"
)

type Handler struct {
	cmv1.UnimplementedCampaignEvaluationServiceServer
	service service.Service
	logger  *zap.Logger
}

func NewHandler(svc service.Service, log *zap.Logger) cmv1.CampaignEvaluationServiceServer {
	if log == nil {
		log = zap.NewNop()
	}
	return &Handler{
		service: svc,
		logger:  log,
	}
}

func (h *Handler) Evaluate(ctx context.Context, req *cmv1.EvaluateRequest) (*cmv1.EvaluateResponse, error) {

	reqID := req.GetRequestId()
	if reqID == "" {
		reqID = uuid.New().String()
		h.logger.Debug("Generated new reqID", zap.String("reqID", reqID))
	}

	l := h.logger.With(zap.String("reqID", reqID))

	internalReq, err := MapProtoRequestToInternal(req)
	if err != nil {
		l.Error("Invalid request mapping", zap.Error(err))
		return nil, status.Errorf(codes.InvalidArgument, "invalid request: %v", err)
	}

	internalReq.RequestID = reqID

	l.Info("Processing Evaluate request",
		zap.String("storeID", internalReq.StoreID),
		zap.String("userID", internalReq.UserID),
		zap.Int("itemCount", len(internalReq.Items)),
	)

	internalResp, err := h.service.Evaluate(ctx, internalReq)
	if err != nil {
		l.Error("Service evaluation failed", zap.Error(err))
		return nil, status.Error(codes.Internal, "evaluation failed due to an internal error")
	}

	protoResp := MapInternalResponseToProto(internalResp)

	l.Info("Successfully processed Evaluate request")
	return protoResp, nil
}
