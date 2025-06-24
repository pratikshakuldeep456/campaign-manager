package main

import (
	"encoding/csv"
	"fmt"
	"github.com/google/uuid"
	"math/rand"
	"os"
	"time"
)

func main() {
	targetingRuleIDs := []string{
		"ecd78b2a-efb9-4fc2-a55d-01d956309043",
		"1304b4a8-d2e6-4f6f-8655-c5e52b942675",
		"f7e8a1b2-c3d4-4e5f-8a9b-0c1d2e3f4a5b",
		"a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d",
		"b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e",
		"c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f",
		"d4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a",
		"e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b",
		"f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c",
		"a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d",
		"b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e",
		"c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f",
		"d0e1f2a3-b4c5-4d6e-7f8a-9b0c1d2e3f4a",
		"e1f2a3b4-c5d6-4e7f-8a9b-0c1d2e3f4a5b",
		"f2a3b4c5-d6e7-4f8a-9b0c-1d2e3f4a5b6c",
		"a3b4c5d6-e7f8-4a9b-0c1d-2e3f4a5b6c7d",
		"b4c5d6e7-f8a9-4b0c-1d2e-3f4a5b6c7d8e",
		"c5d6e7f8-a9b0-4c1d-2e3f-4a5b6c7d8e9f",
		"d6e7f8a9-b0c1-4d2e-3f4a-5b6c7d8e9f0a",
		"e7f8a9b0-c1d2-4e3f-4a5b-6c7d8e9f0a1b",
		"f8a9b0c1-d2e3-4f4a-5b6c-7d8e9f0a1b2c",
		"a9b0c1d2-e3f4-4a5b-6c7d-8e9f0a1b2c3d",
		"b0c1d2e3-f4a5-4b6c-7d8e-9f0a1b2c3d4e",
		"c1d2e3f4-a5b6-4c7d-8e9f-0a1b2c3d4e5f",
		"d2e3f4a5-b6c7-4d8e-9f0a-1b2c3d4e5f6a",
		"e3f4a5b6-c7d8-4e9f-0a1b-2c3d4e5f6a7b",
		"f4a5b6c7-d8e9-4f0a-1b2c-3d4e5f6a7b8c",
		"a5b6c7d8-e9f0-4a1b-2c3d-4e5f6a7b8c9d",
		"b6c7d8e9-f0a1-4b2c-3d4e-5f6a7b8c9d0e",
		"c7d8e9f0-a1b2-4c3d-4e5f-6a7b8c9d0e1f",
		"d8e9f0a1-b2c3-4d4e-5f6a-7b8c9d0e1f2a",
		"e9f0a1b2-c3d4-4e5f-6a7b-8c9d0e1f2a3b",
		"f0a1b2c3-d4e5-4f6a-7b8c-9d0e1f2a3b4c",
	}

	// Modification types based on the CHECK constraint
	modificationTypes := []string{"FLAT", "INCREASE_ABS", "DECREASE_ABS", "PERCENTAGE_DISCOUNT"}

	file, err := os.Create("campaigns.csv")
	if err != nil {
		fmt.Println("Error creating file:", err)
		return
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Write CSV header with new fields
	headers := []string{"id", "name", "description", "start_date", "end_date", "start_time", "end_time", "active", "priority", "targeting_rule_id", "modification_type", "modification_value", "created_at", "updated_at"}
	writer.Write(headers)

	// Seed the random number generator
	rand.Seed(time.Now().UnixNano())

	// Generate sample data
	for i := 0; i < 50000; i++ {
		id := uuid.New().String()
		name := fmt.Sprintf("Campaign %d", i+1)
		description := fmt.Sprintf("Description for campaign %d", i+1)
		startDate := time.Now().AddDate(0, 0, i).Format("2006-01-02")
		endDate := time.Now().AddDate(0, 0, i+7).Format("2006-01-02")
		startTime := "09:00:00"
		endTime := "18:00:00"
		active := "false"
		priority := fmt.Sprintf("%d", i%5)
		targetingRuleID := targetingRuleIDs[i%len(targetingRuleIDs)]

		// New fields
		modificationType := modificationTypes[i%len(modificationTypes)]
		modificationValue := fmt.Sprintf("%.2f", 5.0+float64(i%20))

		createdAt := time.Now().Format(time.RFC3339)
		updatedAt := createdAt

		record := []string{id, name, description, startDate, endDate, startTime, endTime, active, priority, targetingRuleID, modificationType, modificationValue, createdAt, updatedAt}
		writer.Write(record)
	}

	fmt.Println("CSV file 'campaigns.csv' generated successfully.")
}
