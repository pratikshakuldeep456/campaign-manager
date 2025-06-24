package store

import (
	"context"
	"errors"
	"fmt"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	"go.uber.org/zap"

	"pratikshakuldeep456/campaign-manager/internal/config"
)

var (
	ErrNotFound     = errors.New("record not found")
	ErrDBConnection = errors.New("database connection error")
	ErrDBQuery      = errors.New("database query error")
)

type Store interface {
	Close()
	DB() *pgxpool.Pool
}

type SQLStore struct {
	pool *pgxpool.Pool
}

func NewDBConnection(ctx context.Context, cfg *config.DBConfig, logger *zap.Logger) (*SQLStore, error) {
	if logger == nil {
		logger = zap.NewNop()
	}

	// Create a configuration object for more control
	poolConfig, err := pgxpool.ParseConfig(buildConnectionString(cfg))
	if err != nil {
		return nil, fmt.Errorf("%w: invalid configuration: %v", ErrDBConnection, err)
	}

	// Configure connection pool settings
	poolConfig.MaxConns = 100
	poolConfig.MinConns = 5
	poolConfig.MaxConnLifetime = 30 * time.Minute
	poolConfig.MaxConnIdleTime = 15 * time.Minute
	poolConfig.HealthCheckPeriod = 1 * time.Minute

	// Set reasonable timeouts
	poolConfig.ConnConfig.ConnectTimeout = 5 * time.Second

	// Create the connection pool with the configured settings
	pool, err := pgxpool.NewWithConfig(ctx, poolConfig)
	if err != nil {
		return nil, fmt.Errorf("%w: unable to create connection pool: %v", ErrDBConnection, err)
	}

	// Verify the connection works
	ctx, cancel := context.WithTimeout(ctx, 5*time.Second)
	defer cancel()

	if err := pool.Ping(ctx); err != nil {
		pool.Close()
		return nil, fmt.Errorf("%w: unable to ping database: %v", ErrDBConnection, err)
	}

	logger.Info("Database connection established successfully",
		zap.String("host", cfg.Host),
		zap.String("database", cfg.DBName),
		zap.Int32("max_connections", int32(poolConfig.MaxConns)))

	return &SQLStore{
		pool: pool,
	}, nil
}

func buildConnectionString(cfg *config.DBConfig) string {
	// Using URL format for better handling of special characters in credentials
	return fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=prefer",
		cfg.UserName, cfg.Password, cfg.Host, cfg.Port, cfg.DBName)
}

func (s *SQLStore) DB() *pgxpool.Pool {
	return s.pool
}

func (s *SQLStore) Close() {
	s.pool.Close()
}
