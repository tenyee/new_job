# 第一章 学习前言

## 1.1 参考

​	本手册参考《go语言圣经》，以及bilibilib学习视频：https://www.bilibili.com/video/BV16E411H7og?p=4

​	**目标：**

​		历时20天完成所有基础学习

​	**要求：**

​		要求做笔记，并刷新每天进度

## 1.2 进度刷新

​	

[学习之路规划进度]: D:\tenyee\work\学习之路规划.xls

`按住ctrl+点击`



# 第二章 Go语言基础

## 2.1 Go环境配置

	### 2.1.1 查看go环境变量

```shell
# 查看go环境变量
[tenyee@VM-0-4-centos ~]$ go env
GO111MODULE="auto"
GOARCH="amd64"
GOBIN=""
GOCACHE="/home/tenyee/.cache/go-build"
GOENV="/home/tenyee/.config/go/env"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOINSECURE=""
GOMODCACHE="/home/tenyee/go/pkg/mod"
GONOPROXY=""
GONOSUMDB=""
GOOS="linux"
GOPATH="/home/tenyee/go"    #  项目目录，通常会包括三个文件夹:bin,pkg,src
GOPRIVATE=""
GOPROXY="direct"
GOROOT="/usr/lib/golang"    #  go可执行程序的路径
GOSUMDB="off"
GOTMPDIR=""
GOTOOLDIR="/usr/lib/golang/pkg/tool/linux_amd64"
GCCGO="gccgo"
AR="ar"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build699542364=/tmp/go-build -gno-record-gcc-switches"
[tenyee@VM-0-4-centos ~]$ 
```

### 2.1.2 Go工程目录结构

![image-20210610204344600](C:\Users\tenyee\AppData\Roaming\Typora\typora-user-images\image-20210610204344600.png)



```shell
1、创建自己的github地址：
[tenyee@VM-0-4-centos study-go]$ pwd
/home/tenyee/go/src/github.com/tenyee/study-go
[tenyee@VM-0-4-centos study-go]$
2、以github地址创建工程路径
[tenyee@VM-0-4-centos study-go]$ pwd
/home/tenyee/go/src/github.com/tenyee/study-go
[tenyee@VM-0-4-centos study-go]$
```



 ## 2.2 hello world

```go
// 编写代码 main.go
package main

import (
	"fmt"
)

func main() {
	fmt.Println("hello go")
}
```

### 2.2.1 运行代码

```shell
go run main.go
```

### 2.2.2 生成可执行程序

```shell
# 默认生成可执行文件，会在当前目录中生成main可执行程序
go build main.go

# -o 指定生成的可执行程序的名称
[tenyee@VM-0-4-centos helloworld]$ go build -o hello main.go 
[tenyee@VM-0-4-centos helloworld]$ ll
total 3964
-rwxrwxr-x 1 tenyee tenyee 2026428 Jun 10 21:03 hello  
-rwxrwxr-x 1 tenyee tenyee 2026428 Jun 10 20:53 main   
-rw-rw-r-- 1 tenyee tenyee      81 Jun 10 20:56 main.go
```

### 2.2.3 go install

```shell
1、执行go build
2、把生成的可执行文件拷贝到${GOPATH}/bin中
```

### 2.2.4 main

​	1、如果package 指定是main，则表示这个文件会生成可执行程序

​	2、程序入口：func main()，没有入参，也没有返回值

​	3、main package是一个特殊包名



### 2.2.5 命令行参数

​	



## 2.3  Go程序结构

### 2.3.1 变量

零值初始化机制可以确保每个声明的变量总是有一个良好定义的值，因此在Go语言中不存在未初始化的变量

四种声明变量的方式

```shell
# 1、标准的变量声明格式
var 变量名字 类型 = 表达式
	eg:
	var name string
	var age  int
	var isOK bool

# 2、批量声明
	var (
		name string
		age int
		isOK bool
	)
	
 # 3、类型推导
 	var name = "czw"
 	
 # 4、短变量声明，用":"来声明，只能在函数内使用
    name := "czw"
    # 简短变量声明语句中必须至少要声明一个新的变量，下面的代码将不能编译通过：

	f, err := os.Open(infile)
	// ...
	f, err := os.Create(outfile) // compile error: no new variables
    
 # 5、匿名变量，因为函数可能返回多个值，但我如果不需要则可以用_占位
   name, _ = function(xx)
```

**注意：**

1、变量必须在声明后才能使用，通过var声明，或者短声明；

2、全局变量只能用var方式声明

3、声明的变量必须使用，否则报错

4、变量不能重复定义

5、go语言中不存在未初始化的变量，所有只声明不赋值的变量，都会初始化为零值

```go
数值类型变量对应的零值是0，布尔类型变量对应的零值是false，字符串类型对应的零值是空字符串，接口或引用类型（包括slice、指针、map、chan和函数）变量对应的零值是nil。数组或结构体等聚合类型对应的零值是每个元素或字段都是对应该类型的零值。
```

6、简短变量声明语句只有对已经**在同级词法域声明过的变量才和赋值操作语句等价**，如果变量是在外部词法域声明的，那么简短变量声明语句将会在当前词法域重新声明一个新的变量。







### 2.3.2 常量

定义常用关键字:`const`

```shell
# 声明常量
const PI = 3.14

# 批量声明常量
const (
	PI = 3.14
	ONE = 1
	TWO = 2
)

# 批量声明同值常量
const (
	NUM = 1
	NUM2
	NUM3
	NUM4
)

所有值都是1

```



> Iota

Iota是go语言中的常量计数器，只能在常量表达式中使用。

（1）**iota在const关键字出现时被重置为0,**

（2）**const中每声明一行常量使得iota累加1**

```go
const (
	a1 = iota // 0
    a2        // 1，a2=iota
    a3        // 2, a3=iota
)

const (
	a1 = iota  // 0
    a2 = 10    // 10
    a3         // 10
    a4         // 10
    a5 = iota  // 4
    _
    a6 = iota  // 6
)

const (
	a1,b1 = iota + 1, iota +1 // 1,1
    a2,b2 = iota, iota        // 2，2
)

```

### 2.3.3 整型





### 2.3.4 字符串

1 、Go语言中字符串是用双引号包裹的，而字符是用单引号包裹的，和C一样

其中，单独的字母，汉字，符号表示一个字符，一个汉字占三个字节！

```go
func main() {
	var a = "czw"
	var b string = "陈志威"
	c := "中国"
	d := '哈'

	fmt.Printf("%T,%T,%T,%T\n", a, b, c, d)
}
----
[tenyee@VM-0-4-centos 02string]$ go run main.go 
string,string,string,int32
[tenyee@VM-0-4-centos 02string]$
```

2、多行字符串

```go
// 使用``来表示，原样输出
e := `abcd
		efge
		adfadfa
	`
```



### 2.3.5 for结构

```go
package main

import "fmt"
// for

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
}

// 乘法表
func cheng_fa_biao() {
	for i := 1; i < 10; i++ {
		for j := 1; j <= i; j++ {
			fmt.Printf("%dX%d=%d ", j, i, i * j)
		}
		fmt.Printf("\n")
	}
}
```



### 2..3.6 switch

```go
// 格式1
switch choice {
    case 1:
    	...
    case 2:
    	....
default:
    ...
}

// 格式2
switch choice {
	case 1,2,3:
    	...
    case 4,5,6:
    	...
    default:
    	...
}

// 格式3
var a
switch {
    case a > 10:
    	...
    case a < 10:
    	...
}

// 格式4
switch n:=1;n {
    case 1:
    	...
}

```

1、switch 不能和break使用

2、继续执行下一个case，用fallthrought



### 2.3.4 切片

​	切片是一个引用类型，相当于一个指针，有底层数组，因此，把一个切片赋值给另一个变量时，两个切片都指向同一个底层数组

```shell
a := make([]int, 0, 10)   // len(a)=0,cap(a)=10, a != nil
```

​	切片只能和nil做比较（类似C的指针），不能通过==来比较两个切片的元素是否一样

#### 初始化方式

1、直接初始化

```go
a := []int{}  //a != nil
var a []int   //a == nil
```

2、从数组初始化

```go
arr := [...]int{1,2,3,4}
sl := arr[:]
```

3、使用make

```go
a := make([]int, len, cap)
```

#### 切片是否为空

通过len来处理，不能通过nil来表示

#### 切片添加元素-append

```go
// 从s1后追加一个元素
s1 = append(s1, val)
// 追加多个元素
s1 = append(s1, v1, v2,v3)
// 把s2列表的所有元素追加到S1，s2要展开，用...
s1 = append(s1, s2...)
```

#### 切片的扩容策略

1、如果新申请的cap是原来旧的两倍以上，则只取2倍

2、如果原来cap是小于1024的，则两倍增长

3、如果原来cap是大于1024的，则25%增长

4、如果新申请的cap计数溢出了，最终容量就是新申请的容量

#### 切片的复制-copy





#### make与new的区别

1、make与new都是用来申请内存的，都是函数；

2、new 很少用，一般用来给基本数据类型申请内存

3、make是用来给slice,map,chan申请内存的，函数返回这三个类型的本身（原来就是引用类型，所以没必要返回指针类型）



new 并没有初始化内存，只是返回个值为全0的地址空间回来，new(T)返回*T，且内容为0

make(T, args)，会创建相关数据空间，并返回其引用类型



#### array与slice的区别

**array**

1、arrary是值类型

2、把一个数组赋值给另一个变量，或者传参数，其实是创建了一个副本

3、数组的声明定义是包括了长度size的

**slice**

1、引用类型，指向一个底层数组

2、当赋给另一个slice或传参时，则两个引用指向底层数组

3、声明定义时不指定size

4、slice包括一个长度，容量以及指向底层数组的引用

5、len()，ca()对一个nil的slice是合法的

### 2.3.5函数

#### 定义

```go
func 函数名(参数列表) 返回类型 {
    ...
    
    return 返回类型
}
```

### 2.3.6 Go module

​	go语言代码组织在package中，而package又组织在module中，module中指定了运行你的代码的依赖，包括go的版本以及对其它module的依赖

​	下面做一个实验，定义两个模块，其中模块hello调用模块greeting的函数

#### 2.3.6.1 定义greeting模块

```shell
# 进入到一个目录
cd /home/tenyee/go-with-mod/github.com/tenyee/

# 创建greeting目录
mkdir greeting
cd greeting

# 使用go mod init path 去初始化你的模块，这里假定github.com/tenyee/greeting是以后上传代码的路径，这样别人能直接引用
go mod init github.com/tenyee/greeting

# 查看go.mod文件
[tenyee@VM-0-4-centos greeting]$ cat go.mod 
module github.com/tenyee/greeting

go 1.15

# 创建greeting.go文件
[tenyee@VM-0-4-centos greeting]$ cat greeting.go 
package greeting

import "fmt"

// Hello returns a greeting for the named person.
func Hello(name string) string {
    // Return a greeting that embeds the name in a message.
    message := fmt.Sprintf("Hi, %v. Welcome!", name)
    return message
}

到此，模块greeting已完成
```

#### 2.3.6.2 定义hello模块

​	hello模块将引用greeting中的Hello函数，以实现相关功能

```shell
# 在greeting的同级目录中创建hello，也可以在别的目录，你喜欢
mkdir hello

[tenyee@VM-0-4-centos tenyee]$ ll
total 8
drwxrwxr-x 2 tenyee tenyee 4096 Jun 14 11:52 greeting
drwxrwxr-x 2 tenyee tenyee 4096 Jun 14 11:51 hello

# 为hello目录初始化模块,添加依赖跟踪
cd hello
go mod init github.com/tenyee/hello

[tenyee@VM-0-4-centos tenyee]$ ll
total 8
drwxrwxr-x 2 tenyee tenyee 4096 Jun 14 11:52 greeting
drwxrwxr-x 2 tenyee tenyee 4096 Jun 14 11:51 hello

# 添加hello.go文件
[tenyee@VM-0-4-centos hello]$ cat hello.go 
package main

import (
    "fmt"
    "github.com/tenyee/greeting"
)

func main() {
    // Get a greeting message and print it.
    message := greeting.Hello("Gladys")
    fmt.Println(message)
}
[tenyee@VM-0-4-centos hello]$

```

到此，hello.go创建完成，但是因为我们的greeting文件并没上传到github.com/tenyee中，所以在调用`go mod tidy`时，会报错，找不到相关Package！这种情况下，我们可以改写mod文件，使其查找package的路径指向我们的本地路径！

```shell
# 通过使用go mod edit -replace xxx=xxx 来重定向查找依赖包的路径
git mod edit replace github.com/tenyee/greeting=../greeting

# 重新查看go.mod
[tenyee@VM-0-4-centos hello]$ cat go.mod 
module github.com/tenyee/hello

go 1.15

replace github.com/tenyee/greeting => ../greeting   # 多了一条记录

# 运行go mod tidy命令，同步hello模块需要的依赖
go mod tidy

[tenyee@VM-0-4-centos hello]$ cat go.mod 
module github.com/tenyee/hello

go 1.15

replace github.com/tenyee/greeting => ../greeting

require github.com/tenyee/greeting v0.0.0-00010101000000-000000000000  # 依赖添加到此
```

到此，我们可以运行hello.go了

```shell
[tenyee@VM-0-4-centos hello]$ go run hello.go 
Hi, Gladys. Welcome!
```



总结：

1、go mod init xxx：为模块建立一个依赖跟踪，会记录模块所依赖的包信息

2、go mod edit -replace xxx=xxx:修改依赖路径

3、go mod tidy：添加当前依赖的包，以及删除不使用的包



### 2.3.7 init函数

1、每个文件都可以一个或多个Init函数，定义顺序就是执行顺序

2、当导入的package初始化完，以及package的全局变量初始化完后执行



### 2.3.7 添加install

```shell
$ go env -w GOBIN=/path/to/your/bin
```



