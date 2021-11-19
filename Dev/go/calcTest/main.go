package main

import "fmt"

func main() {
	num := 0
	for i := 1; i < 1000002; i++ {
		num = i / 2
	}
	fmt.Println(num)
}
