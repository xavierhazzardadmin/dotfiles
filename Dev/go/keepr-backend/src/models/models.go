package models

import "go.mongodb.org/mongo-driver/bson/primitive"

type Lesson struct {
	ID          primitive.ObjectID `json:"id" bson:"_id,omitempty"`
	Number      int                `json:"number" bson:"number,omitempty"`
	Title       string             `json:"title" bson:"title,omitempty"`
	Description string             `json:"description" bson:"description,omitempty"`
}
