---
aliases: [func]
author: nevikw39
categories: [程式💻]
date: 2021-08-16T06:22:55+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, function]
title: "[C++ 入門] 4. 函式"
# featured: true
# toc: false
---

C++ 中的函式與數學中的函數有些類似，但也卻存在一些差異。事實上，先前我們的程式碼就包含惹 `main()` 這個最基本的函式。撰寫程式的過程中，如果有某些片段經常重複使用，或是有其他需求比如強調或是遞迴，就可以考慮宣告成函式。
```cpp
#include <iostream>

using namespace std;

long long foobar(int x)
{
    return 1LL * x * x;
}

int main()
{
    cout << foobar(87) << '\n'
         << foobar(69) << '\n';
    return 0;
}
```
上例中，我們宣告一個名為 `foobar()` 的函式，其回傳型別為 `long long`, 並接受一個 `int` 的參數。當然，實務上的函式往往複雜許多，可以包含輸出、條件分支、迴圈控制、呼叫其他函式，能做的事就跟以前我們在 `main()` 做的一樣，甚至還可以呼叫自己。比較特別的是，函式可以沒有參數，還可以沒有回傳值，即回傳型別為 `void`.

## 參數的傳遞

```cpp
#include <iostream>

using namespace std;

void foobar(int x)
{
   x = 69;
}

int main()
{
    int x = 87;
    foobar(x);
    cout << x << '\n';
    return 0;
}
```
{{<alert "猜猜看，上面的程式碼其輸出結果為何？？" warning>}}
如果你覺得是 \\(69\\), 恭喜答錯惹。原因是，C++ 在呼叫函式時，預設是將參數的值複製過去，也就是說，`foobar()` 中的 `x` 與 `main()` 的 `x` 可謂風馬牛不相及。那如果我們真的有需要在 `foobar()` 修改 `main()` 的 `x` 要怎麼辦呢？？還記得先前介紹的指標與參考嗎？？

### Call by Value

```cpp
#include <iostream>

using namespace std;

void foobar(int x)
{
    cout << &x << '\n';
    x = 69;
}

int main()
{
    int x = 87;
    cout << &x << '\n';
    foobar(x);
    cout << x << '\n';
    return 0;
}
```
就是預設情形，`foobar()` 的 `x` 是拷貝的副本。

### Call by Pointer

```cpp
#include <iostream>

using namespace std;

void foobar(int *ptr)
{
    cout << ptr << '\n';
    *ptr = 69;
}

int main()
{
    int x = 87;
    cout << &x << '\n';
    foobar(&x);
    cout << x << '\n';
    return 0;
}
```
如果使用指標，我們就可以在 `foobar()` 修改 `main()` 的 `x`, 但要留意 `&`, `*` 的語法。

### Call by Reference

```cpp
#include <iostream>

using namespace std;

void foobar(int &x)
{
    cout << &x << '\n';
    x = 69;
}

int main()
{
    int x = 87;
    cout << &x << '\n';
    foobar(x);
    cout << x << '\n';
    return 0;
}
```
參考的版本給你參考。

## 函式指標

什麼！？指標已經夠討厭惹，函式還有指標啊？？是的，依照 von Neumann 架構，函式在被執行前需要先被載入記憶體，有惹記憶體位址當然就有指標。詳細情形等以後提到函式物件在說個清楚吧。

```cpp
#include <iostream>

using namespace std;

void foo()
{
    cout << "foo\n";
}

void bar()
{
    cout << "bar\n";
}

int main()
{
    void (*func)() = foo;
    func();
    func = bar;
    func();
    return 0;
}
```
