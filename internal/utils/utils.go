package utils

import (
	"time"

	"github.com/google/uuid"
)

func ParseTime(timeStr string) time.Time {
	parsedTime, err := time.Parse(time.RFC3339, timeStr)
	if err != nil {
		return time.Time{} // Return zero value of time.Time on error
	}
	return parsedTime
}

func GenerateUUID() string {
	return uuid.New().String()
}
