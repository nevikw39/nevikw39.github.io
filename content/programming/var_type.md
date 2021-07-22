---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-17T17:08:50+08:00
description: ""
images: [images/float.jpg]
key_words: []
series: [C++ 入門]
tags: [C++, variable]
title: "[C++ 入門] 1.2 基本變數型別"
# featured: true
# toc: false
---

接下來的兩篇分別介紹變數型別及運算子，初學者只需大略了解相關概念，必要時再查詢相關資料即可。

前面我們介紹如何宣告整數型別的變數，但其實變數不只有整數，其實整數也有不少種。C++ 中的基本資料型別可以分為整數、浮點數、字元及布林等等，其中因為 C++ 算是弱型別語言，字元及布林是能直接和整數轉換的。

## 整數

標準中的整數關鍵字計有：`short`, `int`, `long`, `long long`, ... 為何要有那麼種多整數呢？？以 [ZeroJudge a002](https://zerojudge.tw/ShowProblem?problemid=a002) 為例，這題要求兩整數的和，相信對各位十分容易，肯定能輕易地寫出以下的程式：

{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "1.2-0_add.cpp" >}}

現在請 <kbd>F5</kbd> 執行這個程式。輸入 \\(87\ 69\\), \\(9487\ 666\\), \\(92\ 89\\) 之類的顯然不會有問題，但現在試著輸入很大很大的數字。要多大呢？？\\(1000000000\ 1000000000\\) 還是正確的，但 \\(10000000000\ 10000000000\\) 就出事惹阿伯！！怎麼跑出一個奇怪的負數，是電腦壞惹嗎？？

~~對的沒錯你的電腦壞惹 50 收~~ 先別急著砸爛電腦。事實上，每種基本型別都有其上下限。以 `int` 為例，在現代電腦中通常佔據 4 個位元組 _(bytes)_, 即 32 位元 _(bits)_, 而其中一個位元用來表達正負，因此 `int` 的值域為 \\([-2^{31}, 2^{31})\\), 請注意這是一個左閉右開的區間，並不包含 \\(2^{31}\\), 原因是區間中含有 \\(0\\).

`long`, 長整數，顧名思義值域應該要比 `int` 長吧？？如果你這麼想很正確但是錯的，這就是 C/C++ 中一些因為歷史的沉痾而肇致的討人厭共業。現今我們的電腦多數為 32-bit 或 64-bit (mostly x86_64), 然而在 C 出生的年代主流是 8-bit 或 16-bit, 因此實際上標準中對 `int`, `long` 的定義分別是至少 2 bytes (16 bits), 4 bytes (32 bits). 也就是說，夠古老的 C 教材會告訴你 `int` 的值域為 \\([-2^{15}, 2^{15})\\). 而在 32-bit OS `int` 通常是 4 bytes (32 bits), 64-bit 為惹相容性也是蕭規曹隨沿襲下去。

麻煩的就在這個 `long` 喇。上面說道標準中 `long` **至少** 4 bytes (32 bits), 對於 64-bit OS 主要有兩種 data model, _LLP64_ 與 _LP64_, 其中 `long` 分別為 4 bytes (32 bits), 8 bytes (64 bits). 大部分的 OS 如 Linux, macOS, BSD 等等都是採取 _LP64_, 就微軟搞怪用 _LLP64_, 也就是說 64-bit Windows 上 `long` 的值域相當於 `int` 只有 \\([-2^{31}, 2^{31})\\).

因此，標準才改版新增惹 `long long` 這個整數型別，保證其至少為 8 bytes (64 bits).

回過頭來看這題說輸入的數字 \\(a, b \Rightarrow |a| < 10^6, |b| < 10^6\\), 因此我們用 `int` 是沒有問題的。程式競賽與日常生活中的問題一樣，首先我們必須定義問題，問題一定有條件、範圍，然後我們據此選擇解決問題的方法。

{{<alert "結論是如果 int 不夠用就用 long long 吧" success>}}

至於 `short` 就是短整數，除非要壓空間不然應該很少用。題外話是在 32-bit OS 同樣有 LP32, ILP32 之爭，真的很討厭不要理它吧。

另外上面有提到整數型別需要使用 1 bit 來記錄正負，而如果不需要管負數的話可以在整數前面加個 `unsigned`, 比如說 `unsigned int`, 則值域會變為 \\([0, 2^{32})\\). 現在電腦儲存負數的方式為 2-補數，以後有機會結合位元運算再加以說明。

### 類題演練

這兩題都會用到 `if-else`, 晚點記得回過頭來看看！！

- [GreenJudge a031](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a031)
- [TCIRC Judge c019](https://judge.tcirc.tw/ShowProblem?problemid=c019)

## 浮點數

如果說程式語言中的 `int` 是對於數論中 \\(\mathbb{Z}\\) 的近似，那麼浮點數就是 \\(\mathbb{R}\\) 實數的近似。既然說是近似惹，那就一定存在誤差。因為我們目前還未學到 if-else 條件判斷所以就不示範，事實上在電腦中 \\(0.1 + 0.2 = 0.30000000000000004 \neq 0.3\\), 下面是個 meme 博君一笑。

{{< figure src="/images/float.jpg" width="50%" >}}

原因的話很容易理解：十進位制的有限小數轉到二進位制往往變成循環小數。目前主流關於浮點數的規範是 IEEE 754, 大一程設通常會教，這邊就不多說惹。

注意到現在編譯器預設字面常量都是 `double`, 不要再用 `float` 喇，當然還有 `long double` 更精準。

使用浮點數務必小心謹慎，分享幾個因為不察浮點數誤差造就的悲劇：

0. Intel Pentium FDIV bug​ (USD$ 470M)
1. Ariane 5 火箭發射意外​（2 人死亡​）
2. 愛國者防空飛彈意外​，攔不到伊拉克飛毛腿飛彈（28 人死亡、98 人受傷​）

### 型別轉換

看看這段程式會輸出什麼？？
```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << "87 / 69 = " << 87 / 69 << '\n';
    return 0;
}
```
結果是 \\(1\\) 而非 \\(1.26086...\\) 前面提到過 C/C++ 中，對於兩整數使用 `/` 是取其商，那如果要求有小數的結果呢？？我們可以使用以下語法來顯式地轉型：
```cpp
// 略 ...
cout << double(87) / 69 << '\n';
// 略 ...
```
而以下方法則是隱式地轉型：
```cpp
// 略 ...
cout << 87 * 1.0 / 69 << '\n';
// 略 ...
```
當兩個不同型別的變數運算時，預設會轉為比較廣泛的型別。而 C++ 還有  _static_cast_, _const_cast_, _reinterpret_cast_, _dynamic_cast_ 等轉型方式，有興趣可以自行深入了解。

### 類題演練

攝氏溫度 ℃ 與華氏溫度 ℉ 的轉換，剛好各一題。

- [ZeroJudge e343](https://zerojudge.tw/ShowProblem?problemid=e343)
- [ZeroJudge d051](https://zerojudge.tw/ShowProblem?problemid=d051)
- [GreenJudge a008](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a008)

## 字元

前面我們多次使用字面常量的字串 `"This is a string."` 事實上，字串的組成單元是字元；準確來說，字串其實是字元陣列，單個字元我們用單引號夾住。一個字元就代表一個西方語系符號，中日韓共同表意文字 _(CJK Ideograph)_ 則對應二或三個字元，一個跳脫序列也會對應到一個特殊字元。

電腦只懂二進位制，要記錄字元我們需要將之對瑩為數字，這個過程稱作編碼 _(encoding)_, 知名編碼表包括 ANSI, ASCII, Unicode, UTF-8, ... 舉例而言，`'0'` 的值是 \\(48\\), `'A'` 的值是 \\(65\\), `'a'` 的值是 \\(97\\), `'\n'` 的值是 \\(10\\), `' '` 的值是 \\(32\\). 有趣的是，大寫字母與小寫字母剛好差 \\(32\\), 就是第五位元，而 \\(32\\) 又是空白字元 `' '` 的值，因此在做大小寫轉換時可以應用位元運算。

關於字串及陣列，往後會詳盡解釋。這裡似乎寫得有點凌亂，總之：

{{<alert "字串由字元構成，字元其實是一種整數。" success>}}

## MISC

最後補一些雜七雜八的東西。

### const & constexpr

`const` 是 _constant_ 的縮寫，就是常數的意思，在宣告變數時於型別前面加上 `const` 修飾，就可以宣告常數，之後其值就無法更改。常數仍然儲存在堆疊或堆積等記憶體中，換言之它不能節省記憶體，但可以在執行時期決定。

`constexpr` 則是 C++ 11 的新關鍵字，可以修飾變數或函數，其值在編譯時期就必須決定，或可優化程式效能。

### sizeof()

上面談到 `int`, `long`, `long long` 的大小是否令你一頭霧水？？其實，我們可以使用 `sizeof()` 運算子得到各型別的大小：
```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << sizeof(short) << '\n'
         << sizeof(int) << '\n'
         << sizeof(long) << '\n'
         << sizeof(long long) << '\n'
         << sizeof(float) << '\n'
         << sizeof(double) << '\n'
         << sizeof(long double) << '\n'
         << sizeof(char) << '\n'
#ifdef __SIZEOF_INT128__
         << sizeof(__int128_t) << '\n'
#endif
        ;
    return 0;
}
```
上面的程式碼輸出八種基本型別的大小，單位是 byte. 而 `__int128_t` 是 gcc 提供的黑魔法，macOS 如果使用蘋果的 clang++ 則無法使用喔 o'_'o

最後補充 `<cstdint> _(<stdint.h>)_` 有提供 `int8_t`, `int16_t`, `int32_t`, `int64_t`, ... 這種定義。
