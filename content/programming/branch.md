---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-18T20:35:48+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++]
title: "[C++ 入門] 2. 程序流程：if-else 條件判斷 & switch-case 分支結構"
draft: true
# featured: true
# toc: false
---

先前我們的程式很單純，就是順順得執行下去。再來的幾篇文章要介紹的陳述能讓我們的程式多些變化，並解決更多問題。

## if-else 條件判斷

還記得1.1 的[範例](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-1-1-2_div_n_mod-cpp)嗎？？我們寫惹個程式，允許使用者輸入兩個整數，而我們輸出兩者相除之商與餘數。然而，如果今天有人很 87 輸入`87 0`, 那麼會發生什麼事？？
{{<alert "動手手試看看，讓電腦除以 0 會怎樣？？" info>}}
電腦會爆炸嗎？？顯然不會。如果你在 VS Code 按下 F5 偵錯，這時程式回停下來告訴你 **Exception has occurred.** _Arithmetic exception_. 如果直接在終端機執行，會輸出 _floating point exception_ 之類的。總之，程式不正常得提前結束惹。

這邊我們稍微補充一下，平常我們 `main()` 函式都 `return 0;` 代表正常結束，但這次會回傳 `136`, 確認的方法是在終端機輸入 `echo $?`. 原因是當我們的程式發生例外而不處理時，會觸發若干 _Signal_, 像是執行到一半按下 <kbd>⌃Ctrl</kbd> + <kbd>C</kbd> 會觸發 _SIGINT (2)_ 使程式中斷、程式被 **abort** （比如 **assert** 沒過）會觸發 _SIGABRT (6)_, 錯誤地存取記憶體會觸發 _SIGSEGV (11)_, 而本例致命的算術運算錯誤觸發 _SIGFPE (8)_. 這些都是日後我們常遇到的錯誤。發生例外回傳值就不為 `0`, 而會是 `128 + (n)`. 其它的 _exit code_ 包括 `126` 權限不足、`127` _command not found_, ...

回過頭來我們的問題。在設計程式時，必須盡可能考慮一竊狀況，畢竟使用者是沒有下限地 (? 因此，我們需要檢查除數不可為零。`if` **statement** 派上用場惹。首先看看它的語法：
```cpp
if (condition)
{
    // ...
}
```
其中 `condition` 是個表達式，如果表達式非零，就會執行大括弧的內容，否則直接跳過。因此我們可以改進我們的除法計算器：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2-0_if.cpp" >}}
如果大括弧內只有一個 statement (1 semicolon) 可以偷懶省略。其實在 C/C++ 中，非零就是 `true`, 因此也能寫成 `if (b) cout << ...`, 就是省略 `!= 0` 的部分。現在再執行一次，故意輸入 `87 0`, 程式不再發生錯誤，但直接結束好像有點怪怪的怪怪的欸？？所以我們可以應用 `else`:
```cpp
if (condition)
{
    // ...
}
else
{
    // ...
}
```
如果 `condition` 非零，就會執行 `if` 大括弧的內容，否則執行 `else` 大括弧的內容，最後繼續執行下去。我們再次改進我們的除法計算器：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2-1_if_else.cpp" >}}
這次再有 87 輸入 `87 0`, 就會告訴他除數不可為零惹。當然我們的 `condition` 不見得只是一個關係運算式，還可以結合前一篇介紹的邏輯運算子等等。

### 類題演練

- [ZeroJudge d064](https://zerojudge.tw/ShowProblem?problemid=d064)
- [GreenJudge a011](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a011)
- [GreenJudge a012](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a012)
- [GreenJudge a013](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a013)

### 多重與巢狀 if-else

你以為 **if-else** 就這樣？？不不不。我們的 **if-else** 還可以跟 **if-else** 自己結合，當然也可以跟下篇介紹的迴圈結合。自己結合的方式有並排的也有巢狀的：
```cpp
if (condition_0)
{
    // ...
}
else if (condition_1)
{
    // ...
}
else
{
    // ..
}
```
```cpp
if (condition_0)
{
    if (condition_1)
    {
        // ...
    }
    else
    {
        // ...
    }
}
else
{
    if (condition_2)
    {
        // ...
    }
    else
    {
        // ...
    }
}
```
這邊應該都還很好理解，就給各位自行體驗惹。做些例題可以確認自己是否真的了解惹。

#### 類提演練

- [GreenJudge a014](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a014)
- [GreenJudge a015](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a015)
- [GreenJudge a016](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a016)
- [GreenJudge a017](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a017)
- [GreenJudge a018](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a018)
- [GreenJudge a019](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a019)
- [GreenJudge a020](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a020)

## switch-case 分支結構

**switch-case** 感覺比較少用，但還是介紹一下。舉例來說高三上開始一週補習四天，每次想晚餐吃什麼這個大哉問實在太痛苦惹，於是我們決定週二吃 SUKIYA、週三吃那個那個飯、週四吃癡麵、週日吃 Burger King. 現在寫個程式，輸入一個整數代表是週幾，其中 `0`, `7` 皆表示週日，輸出晚餐要吃什麼。

我們現在會 **if-else**, 當然可以寫出以下程式：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int day;
    cin >> day;
    if (day == 2)
        cout << "SUKIYA\n";
    else if (day == 3)
        cout << "那個那個飯\n";
    else if (day == 4)
        cout << "癡麵\n";
    else if (day == 0 || day == 7)
        cout << "Burger King\n";
    else
        cout << "No cram school today.\n";
    return 0;
}
```
但這樣有點囉嗦，是吧。所以我們可以用 **switch-case** 改寫之：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2-2_switch.cpp" >}}
程式碼的可讀性好惹一些，只是注意每個 **case** 結束後如果沒有 `break;` 預設會進入下個 **case**. 另外，C/C++ 的 **switch-case** 僅支援整數包含字元。乍看之下用 **switch-case** 程式碼似乎比較冗長，但理論上執行時，**if-else** 在最糟情況下會遍歷 \\(n\\) 個判斷，時間複雜度是 \\(O(n)\\) 線性的，但 **switch-case** 編譯時可能使用 _jump table_, _lookup table_; 達到 \\(O(\log n)\\) 對數的甚至 \\(O(1)\\) 常數的時間複雜度。當然大部分情況下差異微乎其微，只是 **switch-case** 還有許多妙用。

另外 gcc 有提供 _case range_ 可以這樣用：
```cpp
switch (n)
{
// ...
case 69 ... 87:
    cout << "skr skr\n";
    break;
// ...
}
```
跟 `__int128_t` 一樣，macOS 如果用蘋果的 clang 應該無法使用。
