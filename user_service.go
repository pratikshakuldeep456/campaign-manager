package main

import (
	"context"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/jackc/pgx/v5/pgxpool"
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

type Server struct {
	db *pgxpool.Pool
}

func main() {
	ctx := context.Background()

	connString := "postgres://inventory_service:9PuiP41JMx1DbV57lJQ7@localhost:5432/inventory" // replace accordingly

	dbpool, err := pgxpool.New(ctx, connString)
	if err != nil {
		log.Fatalf("Unable to connect to database: %v", err)
	}
	defer dbpool.Close()

	server := &Server{db: dbpool}

	router := gin.Default()
	router.GET("/user/:id", server.getUserHandler)

	log.Println("Server running at http://localhost:8081")
	router.Run(":8083")
}

func (s *Server) getUserHandler(c *gin.Context) {
	ctx := context.Background()
	userID := c.Param("id")

	var user User
	query := `
		SELECT id, username, email, user_type, created_at, updated_at, average_order_value
		FROM users
		WHERE id = $1
	`

	err := s.db.QueryRow(ctx, query, userID).Scan(
		&user.ID, &user.Username, &user.Email, &user.UserType, &user.CreatedAt, &user.UpdatedAt, &user.AverageOrderValue,
	)

	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
		return
	}

	c.JSON(http.StatusOK, user)
}
