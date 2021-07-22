---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-19T16:33:55+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, control flow, while, for, debugger]
title: "[C++ 入門] 2.1 程序流程：while & for 迴圈控制"
# featured: true
# toc: false
---

我們現在會輸出一行字串，對吧？？如果要輸出兩行呢？？複製貼上，搞定。可是要是是 \\(100, 1000\\), 甚至是 \\(n\\) 次呢？？電腦的專長除惹計算，還有做重複的事，這時我們可以運用迴圈。

## while

`while` 的語法有點像 `if`:
```cpp
while (condition)
{
    // ...
}
```
與 `if` 的不同在於 `while` 會重複執行大括弧內的陳述，直到 `condition` 為零。來看個範例吧
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-0_while_rand.cpp" >}}
這個程式首先模擬丟擲一顆骰子，產生閉區間 \\([1, 6]\\) 內的偽隨機數為 `val`, 之後讓使用者輸入 `n`, 當 `n != val` 就讓使用者繼續猜。第二、八、九及十行前半是產生亂數的方法，可以先不理它。而第十行後半的 `n = 0` 很重要，它是一個變數初始化的作用，當我們宣告一個變數卻未賦予它值，存在一個極低的機率它的值剛好會是 `val`.
{{<alert "動手手試看看，我們同樣在第十一行前方點一下設置中斷點，偷偷觀察我們骰子擲到的 val, 按 F10 Step Over 逐步執行，看看下一行會跳至何處。" info>}}

回到本文開頭的引子，如何寫出輸出 `n` 次字串的程式？？
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-1_while.cpp" >}}
還記得遞減運算子嗎？？這裡我們應用一個小小技巧，對於一個正整數 `n`, 經過 `n` 次 `--`, 其值會變為 \\(0\\). 但注意 `n` 最終的值會是 `-1` 原因是當 `n` 為零時還會進入 `while()`, 判斷的時候又會 `--`. 如果你現在一頭霧水，顯然還沒是沒有學好遞減運算子，不過也沒關係，等下用 `for` 迴圈改寫比較直觀易懂。

### do-while

`do-while` 的語法如下：
```cpp
do
{
    // ...
} while (condition);
```
與 `while` 的不同在於 `do-while` 會至少執行一次大括弧的內容。我們的擲骰子程式可以這樣改寫：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-2_do_while_rand.cpp" >}}
注意到因為我們在取 `n` 的值判斷 `n != val` 前必定執行過 `cin >> n` 賦值，因此第十行不予初始化也是安全的。

### 例題解析

- [GreenJudge c046](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c046)
    + 這題要求小數點後前 `n` 位，就用迴圈模擬我們的長除法
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-7_g_c046.cpp" >}}
- [GreenJudge c040](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c040)
    + 一樣是模擬題，即使沒聽過輾轉相除法也沒關係，照題目說的就對惹
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-8_g_c040.cpp" >}}

### 類題演練

- [GreenJudge a021](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a021)
- [GreenJudge a022](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a022)
- [GreenJudge a023](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a023)
- [GreenJudge a024](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a024)
- [GreenJudge a025](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a025)
- [GreenJudge a041](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a041)
- [GreenJudge a043](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a043)

## for

`for` 也是迴圈流程，它做得到的事其實 `while` 也都做得到，某方面而言算是一種語法糖。
```cpp
for (initial; condition; afterthought)
{
    // ...
}
```
其中，`initial` 是初始化的陳述，C++ 跟現代的 C 允許在此宣告變數；`condition` 跟 `while` 一樣，變成 \\(0\\) 就會離開迴圈；而 `afterthought` 是每次執行完大括弧內陳述之後會做的運算。我們的輸出 `n` 次字串的程式 `for` ver.:
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-3_for.cpp" >}}
我們外加一個小功能，就是輸出這是第幾遍，順帶一提， `for` 中的 `i` 是 _index_ 編號的意思。
{{<alert "動手手試看看，你能不能寫出 while 版本而且帶有編號的程式？？" info>}}
{{<alert "動手手試看看，我們於第九行前方點一下設置中斷點，按 F10 Step Over 逐步執行，看看下一行會跳至何處。" info>}}

### 0-indexed numbering

到這裡裡可能很納悶，我們的 `for` 怎麼不寫成 `for (int i = 1; i <= n; i++)`?? 其實這樣當然也對，但在程式設計中我們傾向使用 _0-indexed numbering_, 包括先前我們看過 `int`, `long long` 的值域的表達，往往都是用一個左閉右開的區間 \\([a, b)\\)，是因為有這些好處：
- 區間長度即為 \\(b - a\\), 沒有討人厭的國小植樹問題
- 將區間一分為二時可以輕易地得到 \\([a, \frac{a+b}{2})\\), \\([\frac{a+b}{2}, b)\\), 不用再 \\(+1\\)
- 還記得國二數學等差數列與級數嗎？？ \\(a_n = a_1 + (n - 1)d,\ S_n = \frac{n}{2}(2a_1 + (n - 1)d)\\), 如果我們改用 _0-indexed numbering_, 公式變成 \\(a_n = a_0 + nd,\ S_n = \frac{n+1}{2}(2a_0 + nd)\\), 是不是漂亮許多？？

歷史上 \\(0\\) 這個概念於人類文明中算是比較晚的突破性創新，至今我們甚至都還不是很習慣它。等到後面進入陣列與指標之後，相信會對 _0-indexed numbering_ 更有感覺。發明最短路徑演算法的 Dijkstra 寫過一篇[短文](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)可以看看。

### 例題解析

- [GreenJudge c004](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c004)
    + 因為這題我們需要知道是迴圈第幾次，所以用 `for` 而非 `while`. 注意到這題的數字都擠在一起沒有空白，因此我們用讀入字元的方式，再減去 `0` 的字元值就可以轉回整數。
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-8_g_c004.cpp" >}}

### 類題演練

- [ZeroJudge a005](https://zerojudge.tw/ShowProblem?problemid=a005)
- [ZeroJudge b791](https://zerojudge.tw/ShowProblem?problemid=b971)
- [ZeroJudge c184](https://zerojudge.tw/ShowProblem?problemid=c184)
- [ZeroJudge d498](https://zerojudge.tw/ShowProblem?problemid=d498)
- [GreenJudge a026](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a026)
- [GreenJudge a027](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a027)
- [GreenJudge a028](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a028)
- [GreenJudge a029](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a029)
- [GreenJudge a030](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a030)
- [TCIRC Judge c003](https://judge.tcirc.tw/ShowProblem?problemid=c003)

## break & continue

考慮下面的問題：
> 給定一數列 \\(A\\) 及一整數 \\(K\\), 求 \\(K\\) 最早出現的下標，保證 \\(K \in A\\), 注意 \\(K\\) 可能重複出現多次。
>
> 輸入的第一行有兩個整數 \\(N, K\\), 其中 \\(N\\) 為 \\(A\\) 的長度，接著一行有 \\(N\\) 個數字，分別是 \\(A_0, A_1, ..., A_{N-1}\\). 試輸出一整數，為 \\(K\\) 最早出現的下標。

寫個迴圈讀 \\(N\\) 個數進來判斷是否等於 \\(K\\) 對我們而言不難，關鍵在於需要避免重複。我們可以使用 `break;` 語句跳離當前的迴圈：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-4_break.cpp" >}}
我們在 `switch-case` 就遇過 `break;` 惹，而它也可以用在 `while`, `for`.

接著考慮另一個問題。小時候大家都會數數，不過在某些地方某些數字很敏感，需要被屏蔽。示範一下從 \\(0\\) 數到 \\(99\\), 並用 `continue;` 跳過敏感數字：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-5_continue.cpp" >}}

## 巢狀迴圈

與 `if-else` 相同，我們當然可以結合多個迴圈。注意巢狀迴圈執行順序，是由外而內，再由內而外。底下示範印出九九乘法表：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-6_nested_loop.cpp" >}}
由於乘積有一位數也有兩位數，因此我們使用 `<iomanip>` 中的 `setw()` 來做排版。

### 類題演練

- [ZeroJudge c418](https://zerojudge.tw/ShowProblem?problemid=c418)
- [ZeroJudge c419](https://zerojudge.tw/ShowProblem?problemid=c419)
- [ZeroJudge c420](https://zerojudge.tw/ShowProblem?problemid=c420)
- [ZeroJudge d649](https://zerojudge.tw/ShowProblem?problemid=d649)
- [GreemJudge a046](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a046)
- [GreemJudge a047](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a047)
- [GreemJudge a048](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a048)
- [GreemJudge a049](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a049)
- [GreemJudge a050](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a050)

## Online Judge 的輸入

在此之前我們做 Online Judge 的題目大多是只有一筆測資，但有些題目可能有一次多筆測資，我們就需要應用迴圈。底下列出兩個系列題讓大家感受一下，之後做題都要看清楚題目敘述。

- 格瑞哥里的煩惱
    + [ZeroJudge d067](https://zerojudge.tw/ShowProblem?problemid=d067)
    + [ZeroJudge d069](https://zerojudge.tw/ShowProblem?problemid=d069)
    + [ZeroJudge d070](https://zerojudge.tw/ShowProblem?problemid=d070)
    + [ZeroJudge d071](https://zerojudge.tw/ShowProblem?problemid=d071)
    + [ZeroJudge d072](https://zerojudge.tw/ShowProblem?problemid=d072)
- 公平的戰役
    + [GreemJudge a036](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a036)
    + [GreemJudge a037](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a037)
    + [GreemJudge a038](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a038)
    + [GreemJudge a039](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a039)
    + [GreemJudge a040](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a040)
