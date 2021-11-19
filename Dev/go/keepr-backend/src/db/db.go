package db

import (
	"context"
	"os"
	"strconv"

	"github.com/joho/godotenv"
	"github.com/xavierhazzardadmin/keepr-backend/src/models"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type DBColl struct {
	Name           string
	CollectionName string
	DatabaseName   string
	Collection     *mongo.Collection
	Client         *mongo.Client
}

type item struct {
	Type string
}

func (c *DBColl) Connect() {
	err := godotenv.Load()

	if err != nil {
		panic(err)
	}

	URI := os.Getenv("MONGO_URI")

	clientOptions := options.Client().ApplyURI(URI)

	client, err := mongo.Connect(context.TODO(), clientOptions)

	c.Client = client

	err = client.Ping(context.TODO(), nil)
	if err != nil {
		panic(err)
	}

	c.Collection = client.Database(c.DatabaseName).Collection(c.CollectionName)
}

func (c *DBColl) Close() {
	if err := c.Client.Disconnect(context.TODO()); err != nil {
		panic(err)
	}
}

func (c *DBColl) GetLessons() (error, []models.Lesson) {
	var lessons []models.Lesson

	cursor, err := c.Collection.Find(context.TODO(), bson.M{})

	defer cursor.Close(context.TODO())

	if err != nil {
		return err, nil
	}

	for cursor.Next(context.TODO()) {

		var lesson models.Lesson

		err := cursor.Decode(&lesson)
		if err != nil {
			return err, nil
		}
		lessons = append(lessons, lesson)
	}
	return nil, lessons

}

func (c *DBColl) AddLesson(l models.Lesson) error {
	_, err := c.Collection.InsertOne(context.TODO(), l)

	if err != nil {
		return err
	}
	return nil
}

func (c *DBColl) DeleteLesson(i string) error {
	id, err := primitive.ObjectIDFromHex(i)

	if err != nil {
		return err
	}

	filter := bson.M{"_id": id}

	_, err = c.Collection.DeleteOne(context.TODO(), filter)

	if err != nil {
		return err
	}

	return err
}

func (c *DBColl) GetLesson(number string) (error, models.Lesson) {
	var lesson models.Lesson

	i, err := strconv.Atoi(number)

	if err != nil {
		panic(err)
	}

	filter := bson.M{"number": i}

	err = c.Collection.FindOne(context.TODO(), filter).Decode(&lesson)

	if err != nil {
		return err, lesson
	}

	return nil, lesson

}

func (c *DBColl) UpdateLesson(i string, l models.Lesson) (error, models.Lesson) {
	var lesson models.Lesson

	id, err := primitive.ObjectIDFromHex(i)

	if err != nil {
		return err, lesson
	}

	filter := bson.M{"_id": id}

	update := bson.D{
		{
			"$set", bson.D{

				{"number", l.Number},
				{"title", l.Title},
				{"description", l.Description},
			},
		},
	}

	err = c.Collection.FindOneAndUpdate(context.TODO(), filter, update).Decode(&lesson)

	if err != nil {
		return err, lesson
	}

	lesson.ID = l.ID

	return err, lesson
}
