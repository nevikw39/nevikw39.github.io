---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-08-08T21:56:32+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, C, string, array, pointer, IO]
title: "[C++ 入門] 3.2 string"
# featured: true
# toc: false
---

字串是程式當中相當重要的議題，我們從 `hello, world` 就接觸到它，但我們始終用一種敷衍的態度點到為止。在變數型別中，提到字串其實就是字元陣列。如今我們學過陣列，終於可以好好的討論一下字串惹。

與陣列相似，C++ 的字喘也有傳統 C 風格與現代 C++ STL 兩種。雖然競賽實務上往往用 C++ STL 方便許多，但傳統 C-style string 的設計有許多巧思，值得了解。

## C-style string

既然字串是字元陣列，那就直接宣告來用看看吧：
```cpp
#include <iostream>

using namespace std;

int main()
{
    char str[] = "hello, world";
    cout << str << '\n'
         << sizeof(str) << '\n';
    return 0;
}
```
{{<alert "\"hello, world\" 這段字串明明只有 12 個字元，為何長度卻是 13 呢？？" warning>}}
這是 C-style string 的一個特殊規則：每個字串的結尾都必須是 `'\0'` 這個特殊字元。這樣有何好處？？我們在遍歷字串時就可以這麼寫：
```cpp
#include <iostream>

using namespace std;

int main()
{
    char str[] = "hello, world";
    for (int i = 0; str[i]; i++)
        cout << str[i];
    cout << '\n';
    return 0;
}
```
這在字串長度為之時尤其方便，我們很快就會遇到惹。現在考慮我們接受字串的輸入，那麼問題就出現喇：字元陣列要宣告多長？？如果是在解題，題目通常會說明最大長度，我們就宣告這麼長再加一（想一想為什麼），如果是在實務場合，可能就需要一些動態配置記憶體的技巧。

ptt 的 ID 長度上限為 \\(12\\), 我們可以寫出以下程式接受輸入：
```cpp
#include <iostream>

using namespace std;

int main()
{
    char id[12 + 1];
    cin >> id;
    for (int i = 0; i < sizeof(id); i++)
        cout << id[i];
    cout << '\n';
    return 0;
}
```
我們使用最常見的陣列遍歷方法遍歷字串。但這個程式有點問題，試著輸入 ID 越短越好，會發現輸出可能怪怪的，原因是 C/C++ 宣告基本型別變數及陣列時不會初始化，電腦給我們的記憶體可能還留有上個程式的資料。正確的寫法應該是這樣：
```cpp
#include <iostream>

using namespace std;

int main()
{
    char id[12 + 1];
    cin >> id;
    for (int i = 0; i < sizeof(id) && id[i]; i++)
        cout << id[i];
    cout << '\n';
    return 0;
}
```
現在你知道為什麼字串的結尾必須是 `'\0'` 惹。
{{<alert "由於程式執行過程中字串長度可能小於最大程度，因此我們用 '\0' 表示字串的結束。" success>}}
這個概念挺有意思的，對照先前所說陣列的左閉右開的特性，右端點就是 `'\0'`. 往後我們遇到 STL 容器的迭代器， `.end()` 扮演的角色就有異曲同工之妙。

### 字串的操作

由於字串就是字元陣列，而我們知道陣列不能直接複製、比較 ..., 因此有函式庫 `<cstring>` 幫我們寫好這些功能，比如 `strcpy()` 用以複製、`strcmp()` 用以比較、`strcat()` 用以串接等等，這些函式都離不開指標，有興趣請自行研究，這裡就姑且略過不提惹。

## std::string

看完上面半篇暈惹嗎？？還好 C++ STL 有提供 string 這玩意兒。基本上你可以把 `std::string` 之於 C-style string 對應到 `std::vector<>` 之於 C-style array. 也許有人好奇 `std::string` 為何少惹 `<>`?? 原因是 `std::string` 其實是 `std::basic_string<char>`. 實際用起來就是這麼簡單：
```cpp
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s;
    s = "QQ";
    cout << s << '\n';
    cin >> s;
    cout << s << '\n';
    return 0;
}
```
別管什麼最大長度或動態配置記憶體惹，C++ 幫我們處理得好好的。`std::string` 亦可使用 `[]` 取得某個字元，而我們可以用 `.lrngth()` 取得字串長度：
```cpp
#include <iostream>

using namespace std;

int main()
{
    string s;
    cin >> s;
    cout << s.length() << '\n';
    for (int i = 0; i < s.length(); i++)
        cout << s[i];
    cout << '\n';
    return 0;
}
```

### 字串的操作

與 `vector<>` 類似，我們可以直接用 `=` 來複製字串、用 `==` 來判斷兩字串是否相等，我們甚至可以用 `+` 來串接兩字串：
```cpp
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string a = "AAA", b = "BBB";
    char c = 'c';
    cout << a + b << '\n'
         << a + b + c << '\n'
         << a + "XXX" << '\n'
         << 'Y' + b << '\n';
    return 0;
}
```
注意在 C++ 中 `"..."` 仍是 C-style string, 因此 `"AAA" + "BBB"` 是錯誤的。

注意到平常 `cin` 以空白分割輸入，如果輸入的字串可能包含空白，必須使用 `getline(cin, s);`. 呼叫前須留意如果先前有使用過 `cin`, 必須 `cin.ignore();`.

## 類題演練

- [ZeroJudge a001](https://zerojudge.tw/ShowProblem?problemid=a001)
- [ZeroJudge b968](https://zerojudge.tw/ShowProblem?problemid=b968)
- [ZeroJudge c185](https://zerojudge.tw/ShowProblem?problemid=c185)
- [ZeroJudge c186](https://zerojudge.tw/ShowProblem?problemid=c186)
- [ZeroJudge c659](https://zerojudge.tw/ShowProblem?problemid=c659)
- [ZeroJudge c716](https://zerojudge.tw/ShowProblem?problemid=c716)
- [ZeroJudge c717](https://zerojudge.tw/ShowProblem?problemid=c717)
- [ZeroJudge c726](https://zerojudge.tw/ShowProblem?problemid=c726)
- [ZeroJudge e051](https://zerojudge.tw/ShowProblem?problemid=e051)
- [ZeroJudge e456](https://zerojudge.tw/ShowProblem?problemid=e456)
- [GreenJudge b006](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b006)
- [GreenJudge b007](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b007)
- [GreenJudge b008](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b008)
- [GreenJudge b009](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b009)
- [GreenJudge b010](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b010)
- [GreenJudge b011](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b011)
- [GreenJudge b012](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b012)
- [GreenJudge b013](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b013)
- [GreenJudge b014](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b014)
