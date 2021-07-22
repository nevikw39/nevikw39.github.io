---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-16T12:51:53+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, "hello, world", IO]
title: "[C++ 入門] 1 hello, world 與輸出"
# featured: true
# toc: false
---

各位準備好發環境惹嗎？？準備好惹！！那就讓我們打開 VS Code, 開啟一個你喜歡的資料夾然後創建新檔，正式開始寫程式喇！！

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1-0_hello_world.cpp" >}}

不免俗地來個 `hello, world`. 建議自己手打一次比較有印象，不要直接複製貼上。按下 F5, 這時 Linux, Windows 使用者點選下方的 Terminal 就會看到你的程式輸出一行 `hello, world`, 而 macOS 則是會彈出一個 Terminal.

接著就讓我們來細細品味、欣賞這個程式。這是 C++ 程式碼最基本的架構，雖然不必強求立刻完全理解每個細節，畢竟就跟數學、物理一樣，總是有一些基本的性質是需要背起來的，也許當下無法馬上理解也無妨，但相信多打幾次很快就可以記起來，而且未來就會逐漸體會。

為表負責，我還是簡單說說一些目前無關緊要的細節給有興趣的人參考。首行的 `#include <iostream>` 代表我們引入惹 C++ 標準中 `<iostream>` 這個表頭檔 _(header file)_, 裡面有稍後我們會用到的 `cout`. `using namespace std;` 表示我們要使用 `std` 即 standard 這個命名空間 _(namespace)_, `cout` 也被定義在那裡。而 `int main() { /* ... */ }` 則是我們宣告惹一個函式名為 main, 它是我們程式的進入點 _(entry point)_, 也就是我們的程式執行時作業系統會去呼叫它，然後我們用 ` return 0;` 回傳 0 代表我們的程式正確結束。

{{<alert "有些人的 main() 函式會省略 int 或改為 signed，或不 return, 這是不符合規範的。" warning>}}

請把焦點投注在我們的 `cout`, 它才是我們今天的重頭戲。`cout` 是個物件，我們可以透過 `<<` 這個重載的運算子把我們想輸出的內容傳遞給它，就可以輸出到 Terminal. 而用雙引號包起來的的稱作字串 _(string)_, 它就是我們要說的話。

{{<alert "動動手手試試看：修改雙引號內的內容，按下 F5 觀察有什麼不同？？" info>}}

### 類題演練

- [ZeroJudge d483](https://zerojudge.tw/ShowProblem?problemid=d483)
- [GreenJudge a001](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a001)

### 錯誤訊息

有個值得留意的小地方，就是 `cout << "hello, world";`, `return 0;` 後面都有個分號，這是 C++ 語法的規定。

{{<alert "動動手手試試看：故意刪掉分號，再按下 F5 觀察會有什麼反應？？" info>}}

這時理論上 `g++` 會發生編譯錯誤，VS Code 會告訴你相關錯誤訊息。往後遇到如此情況不必驚慌，畢竟你犯的錯通常別人早就犯過，即使讀不懂也沒關係，上網 Google 一下很快就找的到解答。

## Escape Sequence

先別被這個小標給嚇著惹。我們回到 `cout`, 今天如果想要輸出的內容需要換行，比如說：

> hello, world
>
> hi, nevikw39

那要怎麼辦？？直接在 `"hello, world` 後面按 <kbd>Enter</kbd> 然後輸入 `hi, nevikw39`?? 如果真的這麼做且按下 F5, 就會得到錯誤訊息，趁現在來觀察一下，我這邊的錯誤訊息會說 `cout << "hello, world` _missing terminating " character_, `hi, ";` _‘hi’ was not declared in this scope;_ 簡單來說就是 C++ 中雙引號必須在同一行，所以直接在 `"hello, world` 後面按 <kbd>Enter</kbd> 就會導致編譯器找不到結尾的雙引號，而下一行的 `hi` 不在雙引號內也讓編譯器不認識它。

所以究竟該怎麼辦喇？？這時我們就需要跳脫序列 _(Escape Sequence)_ 的幫忙。所謂跳脫序列，指的是我們用一個特殊字元 `\` 來跳脫下一個字元，使之表現出特定功能。比如當我們要換行時，就可以使用 `\n`. 下表列出一些常用的跳脫字元：

跳脫字元 | 功能描述
:-:|-
 `\n` | _new line_, 換行
 `\t` | _tab_, 定位字元
 `\b` | _backspace_, 游標會倒退一格
 `\a` | _alert_, 電腦的蜂鳴器應該會叫一聲
 `\"` | 就是 `"`
 `\\` | 就是 `\`

{{<alert "找的到 \ 嗎？？它在 ⌫ Backspace 底下，稱作 back slash, 反過來的斜槓" success>}}

[程式碼](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-1-1_newline-cpp)很簡單就不列出惹。可以注意到跳脫字元在 VS Code 中與一般的字串字元有不同的顏色。

### 類題演練

- [ZeroJudge e926](https://zerojudge.tw/ShowProblem?problemid=e926)
- [TCIRC Judge c001](https://judge.tcirc.tw/ShowProblem?problemid=c001)
- [GreenJudge a002](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a002)
- [GreenJudge a003](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a003)

---

{{<alert "有些教材會要你使用 endl, 其實可以不必管它。事實上，endl 的作用就是 put 一個 \n 之後再 flush cout 的 buffer, 以現今的終端機而言是雞肋，在 OJ, 競賽場合更是畫蛇添足。" warning>}}

## 輸出其他內容

每次都只輸出字串未免有些無聊，電腦的強項不是運算嗎？？試著輸出一些運算結果吧！！

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1-2_output.cpp" >}}

一樣按下 F5, 看看是不是得到答案惹？？不過這樣還是好單調喔，只能輸出固定的運算。因此，敬請期待下一篇介紹如何宣告變數、允許使用者輸入！！
