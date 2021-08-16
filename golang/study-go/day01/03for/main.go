package main

import "fmt"

func cheng_fa_biao() {
go_start:
	for i := 1; i < 10; i++ {
		if i % 2 == 0 {
			continue go_start
		}
		for j := 1; j <= i; j++ {
			fmt.Printf("%dX%d=%d ", j, i, i * j)
		}
		fmt.Printf("\n")
	}
}

func make_choice(choice int) {
	var str string

	switch n := 1; n {
	case 1, 3:
		str = "0000"
	case 4:
		str = "1111"
	default:
		str = "default"
	}

	fmt.Printf("%s, %d\n", str, choice)
}

func main() {
	// 基本格式
	for i := 0; i < 10; i++ {
		fmt.Printf("%d ", i)
	}
	fmt.Printf("\n")

	// 变种1：省下初始语句
	var i = 5
	for ; i < 10; i++ {
		fmt.Printf("%d ", i)
	}
	fmt.Printf("\n")

	// 变种2：只有判断条件，不常用
	i = 1
	for i < 4 {
		fmt.Printf("%d ", i)
		i++
	}
	fmt.Printf("\n")
	// 变种3：for range,遍历字符串，数组，切片，返回下标与值
	s := "abcd"
	for i, v := range s {
		fmt.Printf("%d:%c\n", i, v)
	}

	cheng_fa_biao()

	make_choice(1)
	make_choice(2)
}