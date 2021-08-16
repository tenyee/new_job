package main

import (
	"fmt"
)

func main() {
	var a = "czw"
	var b string = "陈志威"
	c := "中国"
	d := '哈'
	e := `abcd
		efge
		adfadfa
	`
	
	fmt.Printf("%s,%s,%s,%s, %s\n", a, b, c, d, e)

	for a,b := range a {
		fmt.Printf("%d-%c\n", a, b)
	}

	f := []rune(a)
	fmt.Printf("%T-%T\n", f, f)

	if a == "ab" {
		fmt.Printf("abcd\n")
	} else if a == "czw" {
		fmt.Printf("哈哈")
	}
}