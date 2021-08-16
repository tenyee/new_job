# C++更安全

## 1.vector代替数组

### 名称

用vector代替数组

### 动机

在定义一个数组的时候，我们总免不了需要考虑下数组的大小问题，于是，需要提前声明一下数组的大小，如下：

```c++
#define LEN_MAX 1024
int bar[LEN_MAX] = {0}; // 全局变量，占用堆内存

void func()
{
    int bar[LEN_MAX] = {0}; // 普通局部变量，占用栈空间
}
```

当数组定义成全局变量或静态变量时，数组占用的就是堆上的空间，否则，像普通局部变量，则占用栈空间。

但是很多时候，我们可能都不知道这个数组需要定义多大才合适，于是，总是把数组的大小定得更大些。如果数组占用的空间不大，直接在函数内定义数组，占用的栈空间并不多，但是如果数组比较大时，直接占用栈空间就会有问题，毕竟，栈空间是比较有限的。此时，我们都需要通过`malloc`去堆中分配数组空间，如下：

```c++
void func()
{
	int* bar = (int*)malloc(sizeof(int) * LEN_MAX); // 占用堆内存
    ...
    ...
    free(bar);
    return;
}
```

这样做是没有问题的（只是别忘了释放内存哦）。



我们把场景再往复杂点想，由于业务的需要，这个数组可能会很大，那么，我们一开始申请的数组空间便不足了，此时我们需要重新分配一块更大的内存，如下：

```c++
void func()
{
	int* bar = (int*)malloc(sizeof(int) * LEN_MAX); // 占用堆内存
    ...
    if (数组空间不足) {
        // 重新分配空间
        bar = (int*)remalloc(bar, sizeof(int) * (LEN_MAX * 2)); // 申请空间是原来空间的2倍
    }
    ...
    free(bar);
    return;
}
```

以上便是动态数组的一些使用场景，在这个过程中需要程序员对动态申请的内存进行正确的释放处理，特别是`remalloc`，不能重复释放指针！

### 机制

对于C语言程序员来说，可以通过`malloc`，`remolloc`实现各种动态数组的需求，但是不得不面对动态内存的管理，而且对于大部分程序员来说，由于动态数组指针的管理不当而带来的内存泄漏以及程序崩溃问题实在让人担忧。对此，c++给出的动态数组方案就是：`vector`



`vector`是一个封装了动态大小数组的顺序容器，可自动扩展数组空间，无需程序员干涉。

```c++
vector<int> vec_1; // 定义一个vector，元素类型int，无初始化值
vector<int> vec_2(10, 0); // 定义一个vector，并初始化10个元素，且值为0
vector<int> vec_3 = {1,2,3,4}; // 像普通数组一样初始化
```

以上是`vector`的几种初始化方式。初始化完成后，如需要添加元素到数组中，只需要调用方法`push_back`，`vector`会自行扩展数组容量（**即当前数组可容纳的元素个数，并非是当前数组中的元素个数**）。

举个例子:

```c++
#include <iostream>
#include <vector>
using namespace std;

int main() {
    vector<int> vec_1;
    vector<int> vec_2(10, 0);
    vector<int> vec_3 = {1, 2, 3, 4};

    cout << "before push_back:" << endl;
    cout << vec_1.capacity() << endl;
    cout << vec_2.capacity() << endl;
    cout << vec_3.capacity() << endl;

    vec_1.push_back(1);
    vec_2.push_back(1);
    vec_3.push_back(1);
    cout << "after push_back:" << endl;
    cout << vec_1.capacity() << endl;
    cout << vec_2.capacity() << endl;
    cout << vec_3.capacity() << endl;

    return 0;
}

// 其打印结果为：
before push_back:
0
10
4
after push_back:
1
20
8
```

 从上可以知道，vector数组的容量，随着元素的插入，会自行扩展，而其扩展容量的方式也是有策略的。`vector`扩展容量时，并不是每`push_back`一个元素，其容量就添加一个。为了避免频繁进行内存的分配释放而导致的性能问题，`vector`在扩展内存时，并不是一个个地扩展，而是按照即定的分配策略进行容量的扩展。

`vector`和普通的数组一样，支持通过下标进行随机访问：

```c++
int a = vec_2[0]; // 通过下标访问元素
```



因此，C++的`vector`相比于C的数组，更灵活，使用更方便，无需程序员处理数组容量扩展的问题，也就无需面 对动态数组的内存分配以及重新分配的问题，那也就更安全了。

### 其它问题

 



## 2.智能指针管理资源

## 名称

使用智能指针管理资源

## 动机

​		 在C语言的世界里，内存管理是一个让大多数程序员都头痛的问题。内存管理对所有程序都很重要，主要包括：

​	（1）**隐式内存管理**：隐式内存管理主要是自动变量分配内存，变量主要分配在函数的栈帧上。若是静态变量或全局变量，主要分配在程序的数据段，能够被自动分配数值。

​	（2）**显式内存管理**：显式内存分配可以更加灵活高效的管理内存，可以有效避免空间浪费。C语言支持动态内存管理，对象从堆上分配内存，使用内存分配函数和内存释放函数实现内存的动态管理。显式内存管理通过malloc、calloc、realloc、alloca函数申请内存，通过free函数释放内存，将内存空间返还系统。



​		对于隐式内存管理，我们无需干涉，而显式内存管理需要我们清楚地知道，自己到底在做什么。下面是一段简单的例子：

```c++
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    int *var = (int *)malloc(sizeof(int)); // 申请内存
   	...
    // do something
    ...
    free(var); // 释放内存 

    return 0;
}
```

  	动态内存的使用很容易出问题，因为确保在正确的时间释放内存是极其困难的。有时，我们会忘记释放内存，在这种情况下就会产生内存泄漏；有时在尚有指针引用内存的情况下我们就释放了它，在这种情况下就此会产生引用非法内存的指针，导致程序崩溃。



### 机制

为了更容易（更加安全）的使用动态内存，C++引入了智能指针的概念，智能指针的行为类似常规指针，重要的区别是它负责释放所指向的对象。C++新的标准库提供了两种智能指针类型来管理动态对象:

`shared_ptr`以及`unique_ptr`，这两种智能指针的区别在于管理底层指针的方式。`shared_ptr`允许多个指针指向同一个对象； `unique_ptr`则独占所指向的对象。标准库还定义了一个名为`weak_ptr`的伴随类，它是一种弱引用，指向`shared_ptr`所管理的对象。

​		为什么要使用智能指针：我们知道c/c++的内存管理是让很多人头疼的事，当我们写一个new语句时，一般就会立即把delete语句直接也写了，但是我们不能避免程序还未执行到delete时就跳转了或者在函数中没有执行到最后的delete语句就返回了，如果我们不在每一个可能跳转或者返回的语句前释放资源，就会造成内存泄露。使用智能指针可以很大程度上的避免这个问题，因为智能指针就是一个类，当超出了类的作用域是，类会自动调用析构函数，析构函数会自动释放资源。

#### shared_ptr类

​		从名字share就可以看出了资源可以被多个指针共享，它使用计数机制来表明资源被几个指针共享。可以通过成员函数use_count()来查看资源的所有者个数。当我们调用release()时，当前指针会释放资源所有权，计数减一。当计数等于0时，资源就会被释放。

```c++
int main()
{
    shared_ptr<string> pstr1(new string("123"));
    shared_ptr<string> pstr2(new string("456"));
    cout<< *pstr1 <<endl;
    cout<< *pstr2 <<endl;
    cout<< pstr1.use_count() <<endl; // 1
    cout<< pstr2.use_count() <<endl; // 1
    pstr1 = pstr2;//"456"引用次数加1，“123”销毁
    cout<<pstr1.use_count() <<endl;// 2
    cout<< *pstr1 <<endl;
    pstr1.reset();
    pstr2.reset();//此时“456”销毁
    cout<<"done !" <<endl;
    return 0;
}
```



### 其它







