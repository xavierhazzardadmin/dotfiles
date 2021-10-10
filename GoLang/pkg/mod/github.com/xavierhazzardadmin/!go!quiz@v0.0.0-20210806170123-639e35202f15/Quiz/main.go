package Quiz

import (
	"fmt"
	"os"
	"os/exec"
	"time"

	"github.com/manifoldco/promptui"
	"github.com/xavierhazzardadmin/GoQuiz/quizzes"
	"github.com/xavierhazzardadmin/GoQuiz/utils"
)

func Start() {
	time.Sleep(1 * time.Second)

	fmt.Println("Welcome to Go Quiz!")

	time.Sleep(1 * time.Second)

	prompt := promptui.Select{
		Label: "Which Quiz would you like to do?",
		Items: []string{"Programming.", "Actors & Actresses.", "General Knowledge.", "Gaming.", "Tech."},
	}

	_, result, err := prompt.Run()

	if err != nil {
		fmt.Printf("Prompt failed %v", err)
		return
	}

	time.Sleep(2 * time.Second)

	switch result {
	case "Programming.":
		c := exec.Command("clear")
		c.Stdout = os.Stdout
		c.Run()

		correct := 0

		utils.CreateQuiz(quizzes.CodingQuestions, quizzes.CodingAnswers, &correct)
		utils.EndQuiz(correct)
	case "Actors & Actresses.":
		c := exec.Command("clear")
		c.Stdout = os.Stdout
		c.Run()

		correct := 0

		utils.CreateQuiz(quizzes.ActorQuestions, quizzes.ActorAnswers, &correct)
		utils.EndQuiz(correct)
	case "General Knowledge.":
		c := exec.Command("clear")
		c.Stdout = os.Stdout
		c.Run()

		correct := 0

		utils.CreateQuiz(quizzes.GKQuestions, quizzes.GKAnswers, &correct)
		utils.EndQuiz(correct)

	case "Gaming.":
		c := exec.Command("clear")
		c.Stdout = os.Stdout
		c.Run()

		correct := 0

		utils.CreateQuiz(quizzes.GamingQuestions, quizzes.GamingAnswers, &correct)
		utils.EndQuiz(correct)

	case "Tech.":
		c := exec.Command("clear")
		c.Stdout = os.Stdout
		c.Run()

		correct := 0

		utils.CreateQuiz(quizzes.TechQuestions, quizzes.TechAnswers, &correct)
		utils.EndQuiz(correct)
	}
}
