package main
import (
	"fmt"
)

type PersonInfo struct {
	name string
	age int
	address string
	email string
}

func main() {
	p := new(PersonInfo)
	fmt.Println(*p)

	one := PersonInfo{email:"东莞",name:"czw", age:10, address:"abc"}
	fmt.Println(one)


	a := new([]int)
	fmt.Println(a == nil, *a == nil)

}

