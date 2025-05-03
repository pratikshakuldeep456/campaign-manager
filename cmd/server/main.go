package main

import (
	"log"
	"net"

	pb "pratikshakuldeep456/grpc-server/gen/pb"
	"pratikshakuldeep456/grpc-server/internal/handler"
	"pratikshakuldeep456/grpc-server/internal/service"
	"pratikshakuldeep456/grpc-server/internal/store"

	"google.golang.org/grpc"
)

func main() {

	store.InitDB()

	campaignStore := store.NewCampaignStore()

	svc := service.NewService(campaignStore)

	campaignHandler := handler.NewCampaignHandler(svc)

	lis, err := net.Listen("tcp", ":50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterCampaignServiceServer(grpcServer, campaignHandler)

	log.Println("gRPC server for CampaignService running on :50051")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
