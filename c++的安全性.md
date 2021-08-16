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



因此，C++的`vector`相比于C的数组，更灵活，使用更方便，无需程序员处理数组容量扩展的问题，也就无需面对动态数组的内存分配以及重新分配的问题，那也就更安全了。

### 其它问题

 



## 2.智能指针管理资源

