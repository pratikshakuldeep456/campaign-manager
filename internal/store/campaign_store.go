package store

import (
	"context"
	"time"

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
func (s *CampaignStore) ListActiveCampaigns(ctx context.Context, ts time.Time) ([]*model.Campaign, error) {
	rows, err := DB.Query(ctx, `
		SELECT id, name, description, start_time, end_time, priority, condition_json, created_at, updated_at
		FROM campaigns
		WHERE active = true AND start_time <= $1 AND end_time >= $1
	`, ts)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var results []*model.Campaign
	for rows.Next() {
		var c model.Campaign
		err := rows.Scan(&c.ID, &c.Name, &c.Description, &c.StartTime, &c.EndTime,
			&c.Priority, &c.ConditionJSON, &c.CreatedAt, &c.UpdatedAt)
		if err != nil {
			return nil, err
		}
		results = append(results, &c)
	}

	return results, nil
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
func (s *CampaignStore) BulkCreate(ctx context.Context, campaigns []*model.Campaign) ([]string, error) {
	var ids []string

	for _, c := range campaigns {
		query := `
			INSERT INTO campaigns 
			(id, name, description, start_time, end_time, active, priority, condition_json)
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
		`

		_, err := DB.Exec(ctx, query,
			c.ID, c.Name, c.Description, c.StartTime, c.EndTime,
			c.Active, c.Priority, c.ConditionJSON,
		)
		if err != nil {
			return nil, err
		}

		ids = append(ids, c.ID)
	}

	return ids, nil
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
