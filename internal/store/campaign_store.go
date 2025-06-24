package store

import (
	"context"
	"fmt"
	"time"

	"go.uber.org/zap"

	"pratikshakuldeep456/campaign-manager/internal/model"
)

type CampaignStore struct {
	Store
	logger *zap.Logger
}

func NewCampaignStore(store Store, logger *zap.Logger) *CampaignStore {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &CampaignStore{
		Store:  store,
		logger: logger,
	}
}

const getActiveCampaignsSQL = `
SELECT
    c.id AS campaign_id,
    c.name AS campaign_name,
    c.active AS campaign_active,
    c.priority AS campaign_priority,
    c.modification_type AS modification_type,
    c.modification_value AS modification_value,

    tr.id AS rule_id,
    tr.name AS rule_name,
    tr.target_all_skus,
    tr.target_skus,
    tr.rule_expression
FROM
    campaigns c
JOIN
    targeting_rules tr ON c.targeting_rule_id = tr.id
WHERE
    c.active = TRUE
    AND $3::date >= c.start_date
    AND $3::date <= c.end_date
    
    AND (
        (c.start_time < c.end_time AND $4::time BETWEEN c.start_time AND c.end_time)
        OR
        (c.start_time > c.end_time AND ($4::time >= c.start_time OR $4::time <= c.end_time))
    )

    AND (tr.target_all_stores = TRUE OR tr.target_stores IS NULL OR tr.target_stores = '{}' OR tr.target_stores && ARRAY[$1]) -- $1 = storeID

    AND (tr.target_all_users = TRUE OR tr.target_user_groups IS NULL OR tr.target_user_groups = '{}' OR tr.target_user_groups && $2) -- $2 = userGroups

ORDER BY
    c.priority ASC;
`

func (s *CampaignStore) GetActiveCampaignsForContext(ctx context.Context, storeID string, userGroups []string, currentTime time.Time) ([]*model.Campaign, error) {
	l := s.logger.With(
		zap.String("storeID", storeID),
		zap.Strings("userGroups", userGroups),
		zap.Time("timestamp", currentTime),
	)
	l.Debug("Executing GetActiveCampaignsForContext query")

	startTime := time.Now()

	formatedCurrentDate := currentTime.Format("2006-01-02")
	formatedCurrentTime := currentTime.Format("15:04:05")

	l.Debug("Current date and time", zap.String("date", formatedCurrentDate), zap.String("time", formatedCurrentTime))

	rows, err := s.DB().Query(ctx, getActiveCampaignsSQL, storeID, userGroups, formatedCurrentDate, formatedCurrentTime)
	if err != nil {
		l.Error("Database query failed", zap.Error(err))
		return nil, fmt.Errorf("database query error: %w", err)
	}
	defer rows.Close()

	endtime := time.Since(startTime)
	l.Info("fetch query time", zap.Duration("duration", endtime))

	campaigns := []*model.Campaign{}
	for rows.Next() {
		var c model.Campaign
		var tr model.TargetingRule

		err := rows.Scan(
			&c.ID, &c.Name,
			&c.Active, &c.Priority,
			&c.ModificationType, &c.ModificationValue,

			&tr.ID, &tr.Name,
			&tr.TargetAllSkus, &tr.TargetSkus,
			&tr.RuleExpression,
		)
		if err != nil {
			l.Error("Failed to scan row", zap.Error(err))
			return nil, fmt.Errorf("database scan error: %w", err)
		}

		c.TargetingRule = &tr
		campaigns = append(campaigns, &c)
	}

	if err := rows.Err(); err != nil {
		l.Error("Error iterating query results", zap.Error(err))
		return nil, fmt.Errorf("database iteration error: %w", err)
	}

	l.Debug("Successfully fetched active campaigns", zap.Int("count", len(campaigns)))
	return campaigns, nil
}
