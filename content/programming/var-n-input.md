---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-17T16:31:27+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, variable, operator, IO, debugger]
title: "[C++ 入門] 1.1 變數與輸入"
# featured: true
# toc: false
---

## 概述變數與運算

程式在執行過程中，一如我們平時計算往往需要計算紙，總是會需要保存一下運算的過程與結果。當我們宣告一個變數，電腦就會在記憶體當中分配一個空間給予我們使用。今天我們的重點在輸入，因此先簡單介紹整數型別的變數。

還記得 [1_2](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-1-2_output-cpp) 的範例中，我們輸出 \\(87 \\times 69\\) 以及 \\(9487 \\times 426 - 89 \\times 64 + 87 \\times 69\\), 我們觀察到後者其實有用到前者的結果，因此我們可以宣告一個變數紀錄前者，如下所示：

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1.1-0_int.cpp" >}}

第七行的 `int n = 87 * 69;` 代表我們宣告一個名為 `n` 的變數，其形態為整數 _(`int`, integer)_, 同時我們將其值設為 \\(87 \\times 69\\). 按下 <kbd>F5</kbd> 執行它，你會發現結果應該與 [1_2](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-1-2_output-cpp) 相同。

## 輸入

目前為止，我們的城市仍然還是只能輸出固定的內容。接下來，我們看看下面這個程式：

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1.1-1_input.cpp" >}}

趕緊按下 <kbd>F5</kbd> 執行看看，你會發現你的程式停下來等待你輸入一個整數，按下 Enter 之後就會重複你輸入的整數。我們一樣在第七行宣告一個名為 `n` 的整數變數，只是這回我們沒有賦予它初始值。第八行的 `cout` 你現在應該頗熟悉惹，值得注意的是第九行的 `cin >> n;`, 就是這行程式碼讓我們可以輸入一個值傳遞給 `n`.

### 類題演練

- [GreenJudge a004](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a004)

---

剛才我們的範例都只有一個變數，那麼如果有多個呢？？比如今天我們想寫一個程式，令使用者輸入被除數及除數，而程式輸出商及餘數，可能有些人現在會這樣寫：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int a;
    int b;
    cout << "Please input two integers a and b: ";
    cin >> a;
    cin >> b;
    cout << "a/b = " << a / b << "\n";
    cout << "a%b = " << a % b << "\n";
    return 0;
}
```
這樣其實也沒有錯，只是我們可以合併起來：

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1.1-2_div_n_mod.cpp" >}}

注意到 `%` 是取模運算子，白話文就取餘數；而 C++ 中兩個整數 `/` 是取其商，且是向 0 取整。關於運算子們的細節，之後會再詳加說明，置紹你現在可以很直覺地使用 `+`, `-`, `*`, `/`, `%`。

當然你 `,`, `<<`, `>>`, `/`, `%` 前後的空格都可以省略，每行前面的縮牌也非必要，甚至你高興整個 `main()` 函式可以擠在同一行，只是有夠醜。寫程式排版的習慣風格有很多種，比較新的語言會有官方推薦的，而 C/C++ 就是百花爭放。我自己是偏愛 BSD/Allman Style, 就是大括弧下放，兩兩成對比較有美感喇，VS Code <kbd>⇧ Shift</kbd> + <kbd>Alt (⌥ Opt)</kbd> + <kbd>F</kbd> 的預設風格也衍生於此。

### 類題演練

除惹經典的 \\(A + B\\) 西元民國紀年轉換各一題，另外有幾題與時間相關可以善用 `%` 運算子。

- [ZeroJudge a002](https://zerojudge.tw/ShowProblem?problemid=a002)
- [ZeroJudge d049](https://zerojudge.tw/ShowProblem?problemid=d049)
- [ZeroJudge d050](https://zerojudge.tw/ShowProblem?problemid=d050)
- [ZeroJudge d060](https://zerojudge.tw/ShowProblem?problemid=d060)
- [ZeroJudge d073](https://zerojudge.tw/ShowProblem?problemid=d073)
- [ZeroJudge d827](https://zerojudge.tw/ShowProblem?problemid=d827)
- [GreenJudge a005](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a005)
- [GreenJudge a006](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a006)
- [GreenJudge a007](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a007)

## Debugger 的使用

我們每次按下 <kbd>F5</kbd> VS Code 底下的 status bar 都會變色，其實是執行所謂的 **Debugger**, 可是究竟要怎麼用？？試著在 VS Code 中對上面 `1.1-2_div_n_mod.cpp` 的第十行編號的前面按一下，前面應該會出現一個紅點 _(break point)_, 這時再按下 <kbd>F5</kbd> 輸入兩個整數並 Enter, 程式就會停下來惹。這時看到左上會有 VS Code 自動選取的一些變數 _Variables_, 雙擊可以直接修改其值；左中是 _Watch_ 雙擊可以輸入欲監看的表達式如 `a + b` 等，右下則是 _Call Stack_. 此時再按下 <kbd>F5</kbd> 程式又會繼徐執行下去。

{{<alert "動手手試看看，輸入 87 0 並在中斷點把除數的值改掉。" info>}}

當然我們不可能每次都手動檢查除數是否為零，至於如何讓程式自己檢查？？且待下下回分解。
