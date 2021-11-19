package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"

	"github.com/xavierhazzardadmin/keepr-backend/src/db"
	"github.com/xavierhazzardadmin/keepr-backend/src/models"
)

var lessonColl = db.DBColl{
	Name:           "Lessons",
	DatabaseName:   "academic",
	CollectionName: "lessons",
}

func ArrayToJSON(a interface{}) ([]byte, error) {
	return json.Marshal(a)
}

func GetLessons(c *gin.Context) {
	lessonColl.Connect()

	defer lessonColl.Close()

	err, lessons := lessonColl.GetLessons()

	if err != nil {
		log.Fatal(err)
	}

	jData, err := ArrayToJSON(lessons)

	if err != nil {
		log.Fatal(err)
	}

	c.Data(http.StatusOK, "application/json", jData)
}

func GetLesson(c *gin.Context) {
	//  id := lesson number
	number := c.Param("id")

	lessonColl.Connect()

	defer lessonColl.Close()

	err, lesson := lessonColl.GetLesson(number)

	if err != nil {
		log.Fatal(err)
	}

	c.JSON(http.StatusOK, lesson)
}

func AddLesson(c *gin.Context) {
	lessonColl.Connect()

	defer lessonColl.Close()

	var newLesson models.Lesson

	if err := c.BindJSON(&newLesson); err != nil {
		log.Fatal(err)
	}

	lessonColl.AddLesson(newLesson)

	c.Status(http.StatusOK)
}

func DeleteLesson(c *gin.Context) {
	//  id := lesson.ID
	id := c.Param("id")
	lessonColl.Connect()

	defer lessonColl.Close()

	lessonColl.DeleteLesson(id)
	c.Status(http.StatusOK)
}

func UpdateLesson(c *gin.Context) {
	id := c.Param("id")
	lessonColl.Connect()

	defer lessonColl.Close()

	var lesson models.Lesson

	if err := c.BindJSON(&lesson); err != nil {
		c.AbortWithError(http.StatusInternalServerError, err)
		log.Fatal(err)
	}

	err, UpdatedLesson := lessonColl.UpdateLesson(id, lesson)

	if err != nil {
		c.AbortWithError(http.StatusInternalServerError, err)
		log.Fatal(err)
	}

	c.JSON(http.StatusOK, UpdatedLesson)
}
