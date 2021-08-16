package main

import (
	"fmt"
)

var name string
var age int

const (
	a1 = iota // 0
    a2        // 1
    a3        // 2
)

// isOK := true   报错，短声明不能在函数外声明

func main() {
	name = "abc"
	age  = 20

	// 声明变量同时赋值
	var isOK bool = true
	
	fmt.Printf("%s, %d, %d\n",name, age, isOK)

	for a1 := 0; a1 < 5; a1++ {
		fmt.Print(a1)
	}

	fmt.Println("")
	fmt.Println(a1)
	fmt.Println(a2)
	fmt.Println(a3)

	


}
