package config

import (
	"os"

	"github.com/joho/godotenv"
	"go.uber.org/zap"
)

func LoadConfig(logger *zap.Logger) (*Config, error) {

	err := godotenv.Load("configs/.env")
	if err != nil {
		logger.Fatal("Error loading .env file")
	}

	config := &Config{
		AppConfig: &App{
			Port: os.Getenv("SERVER_PORT"),
		},
		DBConfig: &DBConfig{
			Host:     os.Getenv("DB_HOST"),
			Port:     os.Getenv("DB_PORT"),
			UserName: os.Getenv("DB_USERNAME"),
			Password: os.Getenv("DB_PASSWORD"),
			DBName:   os.Getenv("DB_NAME"),
		},
		UserService: &UserService{
			BaseURL: os.Getenv("USER_SERVICE_BASE_URL"),
			Timeout: os.Getenv("USER_SERVICE_TIMEOUT"),
		},
	}

	logger.Info("Loaded configuration")
	return config, nil
}
