package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"time"
)

type ItemInput struct {
	SkuID     string  `json:"sku_id"`
	BasePrice float64 `json:"base_price"`
}

type DynamicPayload struct {
	Items      []ItemInput `json:"items"`
	RequestID  string      `json:"request_id"`
	StoreID    string      `json:"store_id"`
	UserID     string      `json:"user_id"`
	UserGroups []string    `json:"user_groups"`
}

type GhzConfig struct {
	ServerAddress           string
	ProtoFile               string
	GrpcMethod              string
	ConcurrentWorkers       int
	Connections             int
	RequestTimeout          string
	UseInsecure             bool
	ReportNameBase          string
	AdditionalGhzFlags      []string
	PayloadFilePath         string
	NumUniquePayloadsInFile int
	TestDuration            string
	TargetRPS               int
}

const (
	numSKUs   = 100
	numStores = 50
	numUsers  = 100
	minItems  = 50
	maxItems  = 100
	minPrice  = 50.0
	maxPrice  = 1000.0
)

var userGroupOptions = [][]string{{"new_user"}, {"premium"}}

func generatePayloadsFile(filePath string, numPayloads int) error {
	payloads := make([]DynamicPayload, numPayloads)
	s := rand.NewSource(time.Now().UnixNano())
	r := rand.New(s)

	for i := 0; i < numPayloads; i++ {
		numItemsInRequest := r.Intn(maxItems-minItems+1) + minItems
		items := make([]ItemInput, numItemsInRequest)
		for j := 0; j < numItemsInRequest; j++ {
			skuNum := r.Intn(numSKUs) + 1
			price := minPrice + r.Float64()*(maxPrice-minPrice)
			items[j] = ItemInput{
				SkuID:     fmt.Sprintf("item_%03d", skuNum),
				BasePrice: price,
			}
		}
		storeNum := r.Intn(numStores) + 1
		userNum := r.Intn(numUsers) + 1
		selectedUserGroup := userGroupOptions[r.Intn(len(userGroupOptions))]
		payloads[i] = DynamicPayload{
			Items:      items,
			RequestID:  fmt.Sprintf("req_%d", i+1),
			StoreID:    fmt.Sprintf("store_%d", storeNum),
			UserID:     fmt.Sprintf("user_%d", userNum),
			UserGroups: selectedUserGroup,
		}
	}
	fileData, err := json.MarshalIndent(payloads, "", "  ")
	if err != nil {
		return fmt.Errorf("failed to marshal payloads to JSON: %w", err)
	}
	err = os.WriteFile(filePath, fileData, 0644)
	if err != nil {
		return fmt.Errorf("failed to write payload file: %w", err)
	}
	fmt.Printf("Successfully generated %d dynamic payloads to %s\n", numPayloads, filePath)
	return nil
}

func main() {
	config := GhzConfig{
		ServerAddress:           "10.160.0.2:8081",
		ProtoFile:               "./cm.proto",
		GrpcMethod:              "cm.v1.CampaignEvaluationService/Evaluate",
		TestDuration:            "1h",
		TargetRPS:               500,
		ConcurrentWorkers:       100,
		Connections:             100,
		RequestTimeout:          "5s",
		UseInsecure:             true,
		ReportNameBase:          "ghz_run_data",          // General base name, not for a specific JSON file anymore
		PayloadFilePath:         "dynamic_payloads.json", // Simplified payload file name
		NumUniquePayloadsInFile: 200,
	}

	if err := generatePayloadsFile(config.PayloadFilePath, config.NumUniquePayloadsInFile); err != nil {
		fmt.Printf("Error generating payload file: %v\n", err)
		os.Exit(1)
	}

	ghzPath, err := exec.LookPath("ghz")
	if err != nil {
		fmt.Println("ghz command not found. Please install it.")
		os.Exit(1)
	}
	fmt.Printf("\nFound ghz at: %s\n", ghzPath)

	fmt.Println("Starting gRPC load test (outputting ghz default HTML report)...")
	fmt.Printf("Configuration:\n")
	fmt.Printf("  Server: %s\n", config.ServerAddress)
	fmt.Printf("  Method: %s\n", config.GrpcMethod)
	fmt.Printf("  Duration: %s\n", config.TestDuration)
	fmt.Printf("  Target RPS: %d\n", config.TargetRPS)
	fmt.Printf("  Concurrent Workers: %d\n", config.ConcurrentWorkers)
	fmt.Printf("  Connections: %d\n", config.Connections)
	fmt.Printf("  Payload File: %s (%d unique payloads)\n", config.PayloadFilePath, config.NumUniquePayloadsInFile)

	timestamp := time.Now().Format("20060102_150405")
	htmlReportPath := fmt.Sprintf("ghz_default_report_%s_%s.html", strings.ReplaceAll(config.GrpcMethod, ".", "_"), timestamp)

	var args []string
	if config.UseInsecure {
		args = append(args, "--insecure")
	}
	if config.ProtoFile != "" {
		args = append(args, "--proto", config.ProtoFile)
	}
	if config.GrpcMethod != "" {
		args = append(args, "--call", config.GrpcMethod)
	}
	if config.PayloadFilePath != "" {
		args = append(args, "-D", config.PayloadFilePath)
	}
	if config.TestDuration != "" {
		args = append(args, "-z", config.TestDuration)
	}
	if config.TargetRPS > 0 {
		args = append(args, "--rps", strconv.Itoa(config.TargetRPS))
	}
	if config.ConcurrentWorkers > 0 {
		args = append(args, "-c", strconv.Itoa(config.ConcurrentWorkers))
	}
	if config.Connections > 0 {
		args = append(args, "--connections", strconv.Itoa(config.Connections))
	}
	if config.RequestTimeout != "" {
		args = append(args, "--timeout", config.RequestTimeout)
	}

	args = append(args, "--output", htmlReportPath, "--format", "html")
	if len(config.AdditionalGhzFlags) > 0 {
		args = append(args, config.AdditionalGhzFlags...)
	}
	args = append(args, config.ServerAddress)

	cmd := exec.Command(ghzPath, args...)
	fmt.Println("\nExecuting command:", strings.Join(cmd.Args, " "))
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		fmt.Printf("Load test command failed: %v\n", err)
		os.Exit(1)
	}

	fmt.Println("\nghz command completed.")
	fmt.Printf("ghz default HTML report generated at: %s\n", htmlReportPath)

	fmt.Println("\nScript finished.")
}
