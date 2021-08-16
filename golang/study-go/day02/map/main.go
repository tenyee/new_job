package main

import ("fmt")

func main() {
	m := make(map[string]int)

	m["czw"] = 1
	m["abac"] = 2
	fmt.Println(m)

	s := make([]int, 10, 10)
	fmt.Println(s)

	a := new(int)
	*a = 1
	fmt.Println(a, *a)
}