package model

import (
	"time"
)

type Campaign struct {
	ID            string    `json:"id" validate:"required,uuid4"`
	Name          string    `json:"name" validate:"required,min=3,max=100"`
	Description   string    `json:"description,omitempty"`
	StartTime     time.Time `json:"start_time" validate:"required"`
	EndTime       time.Time `json:"end_time" validate:"required,gtfield=StartTime"`
	Active        bool      `json:"active"`
	Priority      int       `json:"priority"`
	ConditionJSON string    `json:"condition_json" validate:"required,json"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}
