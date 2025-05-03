package store

import (
	"context"

	"pratikshakuldeep456/grpc-server/internal/model"
)

type CampaignStore struct{}

func NewCampaignStore() *CampaignStore {
	return &CampaignStore{}
}

func (s *CampaignStore) GetByID(ctx context.Context, id string) (*model.Campaign, error) {
	row := DB.QueryRow(ctx, `
		SELECT id, name, description, start_time, end_time, active, priority, condition_json,
		       created_at, updated_at
		FROM campaigns WHERE id = $1
	`, id)

	var c model.Campaign
	err := row.Scan(
		&c.ID, &c.Name, &c.Description, &c.StartTime, &c.EndTime, &c.Active,
		&c.Priority, &c.ConditionJSON, &c.CreatedAt, &c.UpdatedAt,
	)

	if err != nil {
		return nil, err
	}
	return &c, nil
}

func (s *CampaignStore) Create(ctx context.Context, c *model.Campaign) error {
	data, err := DB.Exec(ctx, `
		INSERT INTO campaigns (id, name, description, start_time, end_time, active, priority, condition_json)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	`, c.ID, c.Name, c.Description, c.StartTime, c.EndTime, c.Active,
		c.Priority, c.ConditionJSON)
	print(data.RowsAffected())
	return err
}

func (s *CampaignStore) Update(ctx context.Context, c *model.Campaign) error {
	_, err := DB.Exec(ctx, `
		UPDATE campaigns
		SET name = $1, description = $2, start_time = $3, end_time = $4,
		    active = $5, priority = $6, condition_json = $7,
		    updated_at = NOW()
		WHERE id = $8
	`, c.Name, c.Description, c.StartTime, c.EndTime, c.Active,
		c.Priority, c.ConditionJSON, c.ID)

	return err
}

func (s *CampaignStore) Delete(ctx context.Context, id string) error {
	_, err := DB.Exec(ctx, `
		DELETE FROM campaigns WHERE id = $1
	`, id)
	return err
}

func (s *CampaignStore) List(ctx context.Context, limit, offset int) ([]*model.Campaign, error) {
	rows, err := DB.Query(ctx, `
		SELECT id, name, description, start_time, end_time, active, priority, condition_json,
		       created_at, updated_at
		FROM campaigns
		ORDER BY created_at DESC
		LIMIT $1 OFFSET $2
	`, limit, offset)

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var campaigns []*model.Campaign
	for rows.Next() {
		var c model.Campaign
		if err := rows.Scan(
			&c.ID, &c.Name, &c.Description, &c.StartTime, &c.EndTime,
			&c.Active, &c.Priority, &c.ConditionJSON,
			&c.CreatedAt, &c.UpdatedAt,
		); err != nil {
			return nil, err
		}
		campaigns = append(campaigns, &c)
	}
	return campaigns, nil
}
