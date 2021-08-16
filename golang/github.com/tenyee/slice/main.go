package main

import (
	"fmt"
)

func main() {
	a := make([][]int, 10)
	fmt.Printf("a:%T, len=%d, cap=%d, a[0].Type=%T\n", a, len(a), cap(a), a[0])	


}
