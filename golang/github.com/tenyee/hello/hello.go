package main

import (
    "fmt"
	"log"
    "github.com/tenyee/greeting"
)

func main() {
    // Get a greeting message and print it.
    names := []string{"tenyee", "czw", "小六子"}
    message, err := greeting.Hellos(names)
	if err != nil {
		log.Fatal(err)
	}

    fmt.Println(message)
}
