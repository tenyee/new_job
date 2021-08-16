package main

import "fmt"

func main() {
	a1 := []int{1,2,3,4,5,6,7}
	a2 := []int{8,9,10}

	a3 := append(a1, a2...)
	fmt.Println(a1, a3, cap(a1), cap(a3))
	fmt.Printf("a1:%p, a1[3]:%p, a3:%p\n", a1, &(a1[0]), a3)

	//a3 := copy(a1)
	//fmt.Println(a3)

	fmt.Println("----------")
	b1 := make([]int, 3, 6)
	fmt.Println(b1, len(b1), cap(b1))

	b2 := append(b1[5:], 10,10)
	fmt.Println(b1, len(b1), cap(b1))
	fmt.Println(b2, len(b2), cap(b2))
	
}