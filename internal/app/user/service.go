package user

import (
	"context"
	"fmt"
	"time"

	"github.com/go-resty/resty/v2"

	"pratikshakuldeep456/campaign-manager/internal/config"
)

type User struct {
	ID                string    `json:"id"`
	Username          string    `json:"username"`
	Email             string    `json:"email"`
	UserType          []string  `json:"user_type"`
	AverageOrderValue float64   `json:"average_order_value"`
	CreatedAt         time.Time `json:"created_at"`
	UpdatedAt         time.Time `json:"updated_at"`
}
type UserClient struct {
	httpclient *resty.Client
	config     *config.UserService
}

func NewUserClient(cfg *config.UserService, h *resty.Client) *UserClient {
	return &UserClient{
		httpclient: h,
		config:     cfg,
	}
}

func (c *UserClient) GetUser(ctx context.Context, userID string) (*User, error) {

	url := fmt.Sprintf("%s/user/%s", c.config.BaseURL, userID)

	resp, err := c.httpclient.R().
		SetContext(ctx).
		SetResult(&User{}).
		SetError(&ErrorResponse{}).
		Get(url)

	if err != nil {
		return nil, fmt.Errorf("failed to execute request to %s: %w", url, err)
	}

	if resp.IsError() {
		if errResp, ok := resp.Error().(*ErrorResponse); ok && errResp.Message != "" {
			return nil, fmt.Errorf("user service returned error: %s (status code: %d)", errResp.Message, resp.StatusCode())
		}
		return nil, fmt.Errorf("user service request failed with status code: %d", resp.StatusCode())
	}

	userResult, ok := resp.Result().(*User)
	if !ok {
		return nil, fmt.Errorf("failed to unmarshal successful response into User struct, body: %s", resp.String())
	}
	return userResult, nil
}

type ErrorResponse struct {
	Message string `json:"message"`
}
