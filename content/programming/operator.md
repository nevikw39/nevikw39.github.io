---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-18T15:38:05+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, operator]
title: "[C++ 入門] 1.3 運算子與表達式"
# featured: true
# toc: false
---

其實在正式介紹之前，其實前面我們就有偷偷用過運算子惹，沒錯就是熟悉的 `+`, `-`, `*`, `/` 喇。接下來趕快來看看還有哪些運算子！！

## 算術運算子

`+`, `-`, `*`, `/`, `%` 屬之，就不多說惹。

## 指派運算子

這對新手是比較需要注意部分。在多數程式語言中，`=` 的意義與數學中的等號不同，一個表達式 `a = b;` 的涵義為將 `a` 的值設定為 `b`. 請在心中默念十六遍，開始！！
{{<alert "程式語言中 a = b; 的涵義為將 a 的值設定為 b." success>}}
簡單舉個例子：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int a = 87, b = 69;
    cout << "a = " << a << ", b = " << b << '\n';
    a = b;
    cout << "a = " << a << ", b = " << b << '\n';
    return 0;
}
```
執行後的輸出應該是這樣：
> a = 87, b = 69
>
> a = 69, b = 69

### 複合指派運算子

既然 `a = b;` 的涵義為將 `a` 的值設定為 `b`, 那麼看看下面這個式子：

\\[n = n + 92;\\]

你可以接受嗎？？數學家馬上暴跳如雷，將 \\(n\\) 移項消去得到 \\(0 = 92\\), \\(n\\) 根本不存在！！如果這麼想，那麼你應該在唸十六次：
{{<alert "程式語言中 a = b; 的涵義為將 a 的值設定為 b." success>}}
事實上，`n = n + 92;` 在程式語言當中的涵義，就把 `n` 的值設為 `n` 原先的值再加 \\(92\\). 實際執行一次吧！！
```cpp
#include <iostream>

using namespace std;

int main()
{
    int n = 0;
    cout << "n = " << n << '\n';
    n = n + 92;
    cout << "n = " << n << '\n';
    return 0;
}
```
希望你搞懂惹。而由於這樣寫有點麻煩，所以我們有這些複合的指派運算子：
- `+=`
- `-=`
- `*=`
- `/=`
- `%=`
- `&=`
- `|=`
- `^=`
- `<<=`
- `>>=`

簡單來說 `a _= b` 相當於 `a = a _ b`, 其中 `_` 是某種二元運算子。

### 遞增、遞減運算子

複合的指派運算子是拿來偷懶的，可是這樣還不夠。程式執行的過程中變數往往需要 `+1`, `-1`; 一堆 `c += 1`, `c -= 1` 還是好煩喔，所以我們有遞增、遞減運算子分別是 `++`, `--`; 特別的是 `++`, `--` 可以放在變數前也可以在後，但作用會有些許不同：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int c = 0;
    cout << "c = " << c << '\n'
         << "c++ = " << c++ << '\n'
         << "c = " << c << '\n'
         << '\n';
    c = 0;
    cout << "c = " << c << '\n'
         << "++c = " << ++c << '\n'
         << "c = " << c << '\n';
    return 0;
}
```
注意到第九、十四行我們將運算式輸出，這是合乎語法的，你也可以試試 `cout << c += 92;`. 觀察上下兩者有何不同，細細品味一下。`++` 後置時，先回傳原本的值才將變數遞增；前置時則先遞增再回傳遞增後的值。`--` 同理，不多做說明，可以自己動手試試。

如果這樣你就很頭痛的話真是抱歉，但以後我們可是要寫出 `if (!--ht[*itr]) --k;` 之類的程式碼喔 o'_'o

## 關係運算子

介紹關係運算子與邏輯運算子是在為下一篇 **if-else 條件判斷** 鋪路。數學上我們有 \\(>, \geq , =, \leq , <, \neq\\) 等關係運算子，對於 \\(87 > 69\\) 這個式子我們會說它是真的，而 \\(92 \leq 64\\) 顯然是錯的。在程式語言中，我們也能寫出各式各樣的表達式，它們或真或假。C++ 關係運算子的結果是布林型別，即 `true` or `false`, 只是 `cout` 預設只會輸出 `1` or `0`, 所以我們可以丟給 `cout` `boolalpha` 這個 _manipulator_.
```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << boolalpha;
    cout << "87 > 69 is " << (87 > 69) << '\n'
         << "92 <= 64 is " << (92 <= 64) << '\n';
    return 0;
}
```

要特別注意的是，上面說過 `=` 是拿來賦值的，判斷 `a` 是否等於 `b` 要用 `a == b`，而不等於則是 `a != b`.
{{<alert "程式語言中 a = b; 的涵義為將 a 的值設定為 b." success>}}
{{<alert "程式語言中判斷兩數是否相等要用 a == b" success>}}
如果你怕會忘記，趕緊多唸幾遍。

### 類題演練

- [ZeroJudge d058](https://zerojudge.tw/ShowProblem?problemid=d058)
- [ZeroJudge d063](https://zerojudge.tw/ShowProblem?problemid=d063)
- [ZeroJudge d064](https://zerojudge.tw/ShowProblem?problemid=d064)
- [ZeroJudge d068](https://zerojudge.tw/ShowProblem?problemid=d068)

## 邏輯運算子

程式語言中，我們也有數學上的邏輯運算，像是一元的 \\(\neg\\) _(not)_ 為 `!`, 二元的 \\(\land\\) _(and)_, \\(\lor\\) _(or)_ 分別是 `&&`, `||`.
```cpp
#include <iostream>

using namespace std;

int main()
{
    cout << boolalpha;
    cout << "!true is " << !true << '\n'
         << "!false is " << !false << '\n'
         << "true && true is " << (true && true) << '\n'
         << "true && false is " << (true && false) << '\n'
         << "false && false is " << (false && false) << '\n'
         << "true || true is " << (true || true) << '\n'
         << "true || false is " << (true || false) << '\n'
         << "false || false is " << (false || false) << '\n';
    return 0;
}
```
出於 encoding 相容的緣故，C++ 也支援以 `not`, `and`, `or` 替代關鍵字，意外的好處是比較好閱讀。值得留意的是多數程式語言存在短路運算的功能，即對於 `a && b` 如果 a 已經是 `false` 則 b 的值完全不予計算，同理 `a || b` 如果如果 a 已經是 `true` 則 b 的值亦完全不予計算。

### 類題演練

- [ZeroJudge d460](https://zerojudge.tw/ShowProblem?problemid=d460)

## 位元運算子

位元運算與條件運算可能算是最鮮為人知的基本運算子。位元運算子與二進位制息息相關，共有六種：`~` _(bitwise not, 1's complement)_, `&` _(bitwise and)_, `|` _(bitwise or)_, `^` _(exclusive-or, xor)_, `<<`, `>>`. 其中前三種皆能與邏輯運算子對應，差別在於位元運算子的作用對象通常是兩個整數，而且是對於兩者的二進位制形式，逐位元去運算。

比如說 \\(87 = 1010111_2\\), \\(92 = 1011100_2\\); 則 \\(87 \\& 92 = 84 = 1010100_2\\), \\(87 | 92 = 95 = 10111110_2\\); \\(69 = 0000000001000101_2 \Rightarrow \sim 69 = -70 = 1111111110111010_2\\). 至於 XOR 大家可能稍微比較陌生，其真值表如下：
a | b | a ^ b
:-:|:-:|:-:
0 | 0 | 1
0 | 1 | 0
1 | 0 | 1
1 | 1 | 0

因此，\\(87 \verb|^| 92 = 11 = 0001011_2\\). 而 `<<`, `>>` 是左移與右移運算子，對於整數的二進位制形式往左或右位移幾個位元，比如 \\(69 \ll 1 = 138 = 10001010_2\\), \\(69 \gg 1 = 34 = 100010_2\\). 在十進位制中，如果我們把 \\(69\\) 左移一位並補零會得到 \\(690\\), 相當於乘以十；而將 \\(69\\) 右移一位並捨去會得到 \\(6\\), 相當於除以十的商。同理，在二進位制中我們可以使用位移運算子來實現 \\(* 2^n\\) 與 \\(/ 2^n\\).

此外，我們知道所有的偶數可以寫為 \\(2n, n \in \mathbb{Z}\\) 的形式、而奇數可以寫為 \\(2n + 1, n \in \mathbb{Z}\\) 的形式；因此，我們可以知道所有偶數最低位元必然是 \\(0\\), 所有奇數最低位元必然是 \\(1\\), 換言之我們可以用 `x & 1` 判斷 `x` 是否為奇數。再更進一步，我們知道 `x & 1 == x % 2`, 甚至可以導出 \\(x \pmod{2^n} \equiv x \\& (2^n - 1)\\).

注意到這裡的 `<<`, `>>` 與先前我們在 `cout`, `cin` 所用的毫無關聯，如果你是用 VS Code, 應該會觀察到 `cout`, `cin` 的 `<<`, `>>` 與整數的 `<<`, `>>` 顏色有所不同。技術上來說，`cout`, `cin` 是物件，他們重載惹 `<<`, `>>` 運算子，賦予其完全不同的意義。

位元運算還可以實現很多高效運算，比如取絕對值、取最大最小值等等，其他奇技淫巧就留給各位慢慢研究惹。當然上面舉的例子不少不用位元運算也可以達成，只是用位元運算理論上效率較高，而且顯得你很潮。

成大教授[好文](https://hackmd.io/@sysprog/c-prog/https%3A%2F%2Fhackmd.io%2F%40sysprog%2Fc-floating-point)推介。

## 條件運算子

條件運算子是唯一的三元運算子，因此也常常直接用以指代。其語法是這樣：`condition ? value_if_true : value_otherwise`. 其中，`condition` 是個表達式，如果它非零為真則回傳 `value_if_true` 的值，否則回傳 `value_otherwise`. 某種程度來說，它是我們下一篇要介紹的 **if-else 條件判斷** 的簡化特例版。

它還可以再簡化成 `a ?: b`, 這在處理指標時很有用，比如：
```cpp
treap *merge(treap *a, treap *b)
{
    if (!a || !b)
        return a ?: b;
    if (a->pri < b->pri)
    {
        a->tr = merge(a->tr, b);
        a->pull();
        return a;
    }
    else
    {
        b->tl = merge(a, b->tl);
        b->pull();
        return b;
    }
}
```

### 類題演練

- [ZeroJudge d066](https://zerojudge.tw/ShowProblem?problemid=d066)

## 運算子優先順序和結合性

數學上我們有先乘除、後加減，C++ 中的運算子亦有一定優先順序。如果我們用的有點問題，通常編譯器會提醒可能需要加個括弧。

Precedence | Operator | Associativity
:-:|:-|:-:
1 | `()` `[]` `.` `->` `++` `--` _suffix_ | ⤇
2 | `!` `~` `++` `--` _prefix_ `+` `-` _sign_ `*` _dereference_ `&` _address​_ | _**⤆**_
3 | `*` `/` `%` | ⤇
4 | `+` `-` | ⤇
5 | `>>` `<<`​ | ⤇
6 | `>` `>=` `<=` `<` | ⤇
7 | `==` `!=` | ⤇
8 | `&` | ⤇
9 | `^` | ⤇
10 | `\|` | ⤇
11 | `&&` | ⤇
12 | `\|\|` | ⤇
13 | `?:` | ⤇
14 | `=` `+=` `-=` `*=` `/=` `%=` `&=` `\|=` `^=` `>>=` `<<=` | _**⤆**_
15 | `,` | ⤇
