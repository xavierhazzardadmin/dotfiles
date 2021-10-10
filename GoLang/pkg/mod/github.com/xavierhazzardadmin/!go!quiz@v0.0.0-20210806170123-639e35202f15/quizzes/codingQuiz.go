package quizzes

import (
	"fmt"
	"time"
)

var correctQuestions int = 0

func StartCodingQuiz() int {

	time.Sleep(2 * time.Second)

	fmt.Println("The Quiz chosen is: Programming & Computer Science Trivia.")

	time.Sleep(2 * time.Second)

	for i := 5; i > 0; i-- {
		fmt.Println("Quiz Starting in: ", i)
		time.Sleep(1 * time.Second)
	}

	// utils.AssertAnswer("How many bits are there in a byte?", "8", &correctQuestions)

	// utils.AssertAnswer("What is the easiest programming language for full-stack web development?", "javascript", &correctQuestions)

	// utils.AssertAnswer("Which company first backed the development of the Go Language?", "google", &correctQuestions)

	// utils.AssertAnswer("What is the quickest programming language to learn for beginners?", "python", &correctQuestions)

	return correctQuestions
}
