---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-20T23:29:27+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, control flow]
title: "[C++ 入門] 2.2 程序流程：goto 跳轉與其他"
# featured: true
# toc: false
---

學完 `if-else`, `while`, `for` 之後我們已經可以解決許多問題惹。作為**程序流程**的最後一篇，今天介紹一個幾乎很少使用的語法：`goto`.

如果妳有寫過 batch 或 bash script 的經驗，應該不會對 `goto` 感到陌生。我們可以在程式碼當中的任意處加上 `label:`, 再用 `goto label;` 跳轉到該`label:`. 乍看之下很方便，但是在程式碼當中大量濫用 `goto` 將會照制許多麻煩，因此被多數人視為洪水猛獸，包括 _MISRA_ 等機構建議不要使用，有些人或許甚至沒學過。

事實上，`if-else`, `while`, `for` 等程序流程在編譯後，於組合語言當中，也都是各式各樣的跳轉指令 _(jxx)_, `goto` 就是太過於底層一些。然而，偶而使用 `goto` 還是可以帶來好處。比如先前我們介紹 `break;` 時舉的線性搜尋數列的例子，如果今天變成二為版本呢？？`break;` 一次只能跳離一個迴圈，因此我們需要多用一個變數：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int n, m, k;
    cin >> n >> m >> k;
    for (int i = 0; i < n; i++)
    {
        bool found = false;
        for (int j = 0; j < m; j++)
        {
            int a;
            cin >> a;
            if (a == k)
            {
                cout << i << ' ' << j << '\n';
                found = true;
                break;
            }
        }
        if (found)
            break;
    }
    return 0;
}
```
如果我們善用 `goto`:
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.2-0_goto.cpp" >}}
可以看到我們省掉一個變數 `found` 與 \\(O(n)\\) 次 `if`. 當然這兩個例子因為很單純，其實能直接 `return 0;`, 以後遇到更複雜的狀況，也可以另外寫個函式 `return`, 指示另外寫函式還要考慮傳直的問題。俗話說水能載舟亦能覆舟，`goto` 提供的方便與帶來的隱憂，這就是自己要取捨的部分惹。

成大教授[好文](https://hackmd.io/@sysprog/c-prog/%2Fs%2FB1e2AUZeM)推介。

## 變數作用域

在**程序流程**這章中，我們介紹許東用大括弧包起來的區塊陳述。我們看過在 `for` 中宣告變數：`for (int i = 0; i < n; i++)`, 那麼我們可以在迴圈外使用 `i` 這個變數嗎？？
{{<alert "動手手試看看，在迴圈外使用迴圈內宣告的變數。" info>}}
很遺憾的是，答案顯然為否。閱讀一下編譯器的錯誤訊息，看起來式編譯器並不認得它。原來，我們宣告的變數都有其作用域，簡單來說一個變數被宣告後原則上只活在它所在的大括弧中，離開後編譯器就不認得惹，我們也不該使用奇怪的方式嘗試去存取它。

那如果我們把變數宣告在大括弧之外呢？？沒錯，我們可以把變數宣告為與 `main()` 同一階層，是為全域變數。全域變數很方便沒錯，許多競賽選手都喜歡大量使用，但這在業界也是同樣不被歡迎的。當然有時我們非得用全域變數不可，比如宣告很大的陣列或是遞迴很深時，因為全域變數儲存在 _heap_ 而非 _stack_.

最後注意 C/C++ 可以在不同的區塊宣告同名的變數，這可能會導致麻煩，比如在 `main()` 宣告 `int x;` 再 `while` 中又宣告 `int x;`, 這時在 `while` 中的 `x` 都跟外面的 `x` 毫無關係，不可不慎。
```cpp
#include <iostream>

using namespace std;

int main()
{
    int x = 87;
    do
    {
       int x;
       x = 69;
    } while (false);
    cout << x << '\n';
    return 0;
}
```
{{<alert "動手手試看看，以上程式碼的輸出為何？？" info>}}
