package utils

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"time"
)

func assertAnswer(question string, answer string, countVar *int) {

	var input string

	time.Sleep(1 * time.Second)

	fmt.Println(question)

	scanner := bufio.NewScanner(os.Stdin)

	fmt.Print("\nAnswer: ")

	if scanner.Scan() {
		input = scanner.Text()
	}

	if strings.EqualFold(input, answer) {
		time.Sleep(1 * time.Second)
		fmt.Println("\nCorrect!")
		*countVar++
	} else {
		fmt.Println("\nOh close")
	}
}

func EndQuiz(correctQuestions int) {

	time.Sleep(2 * time.Second)

	fmt.Println("\nYou got ", correctQuestions, "questions correct. Well done!")

	time.Sleep(2 * time.Second)
}

func CreateQuiz(questions []string, answers []string, correctQuestions *int) {
	for i := 0; i < len(questions); i++ {
		time.Sleep(1 * time.Second)

		fmt.Printf("\nQuestion %d%s\n", i+1, ":")

		assertAnswer(questions[i], answers[i], correctQuestions)
	}
}
