package model

import (
	"time"
)

type PriceModificationType string

const (
	FlatPrice          PriceModificationType = "FLAT"
	IncreaseAbsolute   PriceModificationType = "INCREASE_ABS"
	DecreaseAbsolute   PriceModificationType = "DECREASE_ABS"
	PercentageDiscount PriceModificationType = "PERCENTAGE_DISCOUNT"
)

type TargetingRule struct {
	ID               string              `db:"id"`
	Name             string              `db:"name"`
	Description      string              `db:"description"`
	TargetAllStores  bool                `db:"target_all_stores"`
	TargetStores     []string            `db:"target_stores"`
	TargetAllUsers   bool                `db:"target_all_users"`
	TargetUserGroups []string            `db:"target_user_groups"`
	TargetAllSkus    bool                `db:"target_all_skus"`
	TargetSkus       []string            `db:"target_skus"`
	RuleExpression   map[string][]string `db:"rule_expression"`
	CreatedAt        time.Time           `db:"created_at"`
	UpdatedAt        time.Time           `db:"updated_at"`
}

type ModificationDetail struct {
	Type  PriceModificationType `json:"type"`
	Value float64               `json:"value"`
}

type Campaign struct {
	ID                string                `db:"id"`
	Name              string                `db:"name"`
	Description       string                `db:"description"`
	StartTime         time.Time             `db:"start_time"`
	EndTime           time.Time             `db:"end_time"`
	StartDate         time.Time             `db:"start_date"`
	EndDate           time.Time             `db:"end_date"`
	Active            bool                  `db:"active"`
	Priority          int                   `db:"priority"`
	TargetingRuleID   string                `db:"targeting_rule_id"`
	ModificationType  PriceModificationType `db:"modification_type"`
	ModificationValue float64               `db:"modification_value"`
	CreatedAt         time.Time             `db:"created_at"`
	UpdatedAt         time.Time             `db:"updated_at"`

	TargetingRule *TargetingRule
}

type User struct {
	ID         string
	Attributes map[string]interface{}
}

type ItemInput struct {
	SKUID     string
	BasePrice float64
}

type EvaluationRequest struct {
	RequestID string
	StoreID   string
	UserID    string
	UserGroup []string
	Items     []ItemInput
	Timestamp time.Time
}

type EvaluationResponseItem struct {
	SKUID             string
	OriginalPrice     float64
	FinalPrice        float64
	AppliedCampaignID *string
	EvaluationError   *string
}

type EvaluationResponse struct {
	RequestID string
	Results   []EvaluationResponseItem
}
