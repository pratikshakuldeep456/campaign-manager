package main

// import (
// 	"context"
// 	"log"
// 	"time"

// 	pb "pratikshakuldeep456/grpc-server/gen/pb"

// 	"google.golang.org/grpc"
// )

// func main() {
// 	conn, err := grpc.Dial("localhost:50051", grpc.WithInsecure())
// 	if err != nil {
// 		log.Fatalf("did not connect: %v", err)
// 	}
// 	defer conn.Close()

// 	client := pb.NewHelloServiceClient(conn)

// 	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
// 	defer cancel()

// 	res, err := client.SayHello(ctx, &pb.HelloRequest{Name: "Rahul"})
// 	if err != nil {
// 		log.Fatalf("could not greet: %v", err)
// 	}

// 	log.Printf("Response from server: %s", res.Message)
// }
