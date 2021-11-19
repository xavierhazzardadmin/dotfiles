package main

import (
	"fmt"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/xavierhazzardadmin/keepr-backend/src/handlers"
)

func handle() {
	r := gin.Default()

	r.Use(cors.New(cors.Config{
		AllowOrigins:  []string{"https://hazzard.uk", "http://localhost"},
		AllowMethods:  []string{"PUT", "POST", "GET", "DELETE", "OPTIONS"},
		AllowHeaders:  []string{"Origin"},
		ExposeHeaders: []string{"Content-Length"},
		MaxAge:        12 * time.Minute,
	}))

	r.GET("/lessons", handlers.GetLessons)

	r.GET("/lessons/:id", handlers.GetLesson)

	r.POST("/lessons", handlers.AddLesson)

	r.DELETE("/lessons/:id", handlers.DeleteLesson)

	r.PUT("/lessons/:id", handlers.UpdateLesson)

	r.Run(":8080")
}

func main() {
	fmt.Println("Server starting.....")

	handle()
}
