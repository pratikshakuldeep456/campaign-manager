package config

type Config struct {
	AppConfig   *App
	DBConfig    *DBConfig
	UserService *UserService
}

type App struct {
	Port string
}

type UserService struct {
	BaseURL string
	Timeout string
}

type DBConfig struct {
	Host     string
	Port     string
	UserName string
	Password string
	DBName   string
}
