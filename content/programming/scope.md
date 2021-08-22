---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-08-18T07:26:57+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, function, variable, scope]
title: "[C++ 入門] 4.1 變數作用範圍"
# featured: true
# toc: false
---

我們宣告的變數事實上皆有各自的生命週期，簡單來說原則上變數始於宣告、終於其宣告時最接近之 `{` 對應之 `}`. 當程式離開該大括弧的區塊以後，理論上我們就不應嘗試存取它。請留意，在不同的作用域宣告相同名稱的變數是會覆蓋的。以下將由小到大介紹各變數作用域。

## 區塊變數

宣告在條件分支與迴圈控制區塊中的變數是為區塊變數。如果我們在大括弧外使用區塊變數的名稱，編譯器會不認得它而說 _identifier is undefined._

然而，技術上來說，我們其實可以透過指標在區塊變數的生命週期外嘗試存取它，因為區塊變數與區域變數都位於函式的堆疊。
```cpp
#include <iostream>

using namespace std;

int main()
{
    int n, d;
    cin >> n;
    cout << &n << '\n';
    do
    {
        int m = n * 87 + 69;
        d = &m - &n;
        cout << &m << "\n&m = &n + " << d << '\n';
    } while (0);
    int *ptr = &n + d;
    // cout << m << '\n'; indentifier `m' is undefined
    cout << *ptr << '\n';
    return 0;
}
```

## 區域變數

一般我們宣告在函式中的變數及函式的參數屬之，與區塊變數同樣位於函式的堆疊。因為區域變數的生命週期只到函式結束，因此當我們有需要回傳指標時，不應回傳區域變數的指標，而應該透過動態配置記憶體取得在堆積的空間。

### static 變數

如果函式在每次執行過程中，需要共重複使用某一變數之職，可以宣告為 `static` 變數，將會儲存在堆積，且每次結束後其值將會被保留。
```cpp
#include <iostream>

using namespace std;

void foo()
{
    int n = 0;
    cout << "foo(): " << ++n << '\n';
}

void bar()
{
    static int n = 0;
    cout << "bar(): " << ++n << '\n';
}

int main()
{
    for (int i = 0; i < 10; i++)
    {
        foo();
        bar();
    }
    return 0;
}
```
{{<alert "由於程式執行過程中字串長度可能小於最大程度，因此我們用 '\0' 表示字串的結束。" warning>}}

## 全域變數

基本上變數只活在它所在大括弧中，那當我們將變數宣告在所有大括弧外呢？？可以這樣嗎？？當然可以。根據上述的法則，我們不難猜測，這種所謂的全域變數，其生命週期原則上就是整個程式的執行時期。全域變數儲存在比較彈性但比較慢的堆積。

雖然使用全域變數非常方便，許多競賽選手十分愛用，但濫用全域變數是很不好的行為，在業界是不被歡迎的，比如 MISRA-C 標準甚至強烈不建議。
