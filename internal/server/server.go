package server

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net"
	"os"
	"os/signal"
	"pratikshakuldeep456/campaign-manager/internal/engine"
	"syscall"
	"time"

	"github.com/go-resty/resty/v2"
	"github.com/urfave/cli/v2"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"google.golang.org/grpc/health"
	"google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"

	cmv1 "pratikshakuldeep456/campaign-manager/gen/go/cm/v1"
	"pratikshakuldeep456/campaign-manager/internal/app/user"
	"pratikshakuldeep456/campaign-manager/internal/config"
	"pratikshakuldeep456/campaign-manager/internal/handler"
	"pratikshakuldeep456/campaign-manager/internal/service"
	"pratikshakuldeep456/campaign-manager/internal/store"
)

const (
	shutdownTimeout          = 15 * time.Second
	concurrencyForEvaluation = 10
)

func StartServer(cliCtx *cli.Context) error {

	ctx := context.Background()

	logger, err := zap.NewProduction()
	if err != nil {
		log.Printf("Failed to initialize logger: %v", err)
		return errors.New("failed to initialize logger")
	}
	defer func() { _ = logger.Sync() }()
	logger.Info("Logger initialized")

	cfg, err := config.LoadConfig(logger)
	if err != nil {
		log.Printf("could not load config: %v", err)
		return errors.New("could not load config")
	}

	db, err := store.NewDBConnection(ctx, cfg.DBConfig, logger)
	if err != nil {
		log.Printf("could not create store: %v", err)
		return errors.New("could not create store")
	}
	logger.Info("DB connection established", zap.String("host", cfg.DBConfig.Host), zap.String("port", cfg.DBConfig.Port))
	defer db.Close()

	campaignStore := store.NewCampaignStore(db, logger)

	resty := resty.New()
	userclient := user.NewUserClient(cfg.UserService, resty)

	ruleEngine := engine.NewEngine(userclient, logger, concurrencyForEvaluation)

	campaignService := service.NewCampaign(campaignStore, ruleEngine, logger, concurrencyForEvaluation)

	campaignHandler := handler.NewHandler(campaignService, logger)

	lis, err := net.Listen("tcp", cfg.AppConfig.Port)
	if err != nil {
		logger.Fatal("Failed to listen on address", zap.String("address", cfg.AppConfig.Port), zap.Error(err))
	}

	grpcServer := grpc.NewServer()

	cmv1.RegisterCampaignEvaluationServiceServer(grpcServer, campaignHandler)

	healthServer := health.NewServer()
	grpc_health_v1.RegisterHealthServer(grpcServer, healthServer)

	reflection.Register(grpcServer)

	errChan := make(chan error, 1)

	go func() {
		logger.Info("Starting gRPC server...")
		if err := grpcServer.Serve(lis); err != nil {
			errChan <- fmt.Errorf("gRPC server failed: %w", err)
		} else {
			logger.Info("gRPC server stopped serving.")
		}
	}()

	stopChan := make(chan os.Signal, 1)
	signal.Notify(stopChan, syscall.SIGINT, syscall.SIGTERM)

	select {
	case err := <-errChan:
		logger.Fatal("gRPC server error", zap.Error(err))

	case sig := <-stopChan:
		logger.Info("Received OS signal, initiating graceful shutdown...", zap.String("signal", sig.String()))

		shutdownCtx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
		defer cancel()

		healthServer.SetServingStatus("cm.v1.CampaignEvaluationService", grpc_health_v1.HealthCheckResponse_NOT_SERVING)
		healthServer.Shutdown() // Shutdown the health server.
		logger.Info("Health status set to NOT_SERVING")

		stopped := make(chan struct{})
		go func() {
			grpcServer.GracefulStop()
			close(stopped)
		}()

		// Wait for graceful stop to complete or timeout.
		select {
		case <-shutdownCtx.Done():
			logger.Warn("Graceful shutdown timed out. Forcing stop.", zap.Duration("timeout", shutdownTimeout))
			grpcServer.Stop()
			db.Close()
		case <-stopped:
			logger.Info("gRPC server gracefully stopped.")
		}
	}

	logger.Info("Server exiting.")

	return nil
}
