---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-24T17:52:56+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, C, array, pointer, for, vector]
title: "[C++ 入門] 3.1 C-style array & vector"
# featured: true
# toc: false
---

## C-style array

有時我們會需要紀錄大量同樣型別的變數，比如 [GreenJudge c041](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c041), 題目輸入 \\(N\\) 及 \\(N\\) 個人的現金，那我們要怎麼儲存呢？？我們可以使用陣列 _(array)_:
```cpp
#include <iostream>

using namespace std;

int main()
{
    int n;
    cin >> n;
    int arr[n];
    // ...
    return 0;
}
```
第九行的 `int arr[n];` 宣告整數型別的陣列，其長度為 `n`. 之後，我們就能以 `arr[0]`, `arr[1]`, ..., `arr[n - 1]` 陣列中的元素 _(element)_ 來存取陣列中的元素。回頭看看 GreenJudge c041, 我們容易知道最小的現金流動會是 \\(\frac{1}{2}\sum{|a_i - \bar{a}|}\\), 其中 \\(a_i\\) 是第 \\(i\\) 個人的現金：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-0_g_c041.cpp" >}}
現在讓我們稍微深入一點的討論。所謂的陣列，就是一塊連續的記憶體空間。那我們要怎麼存取一塊連續的記憶體呢？？
```cpp
#include <iostream>

using namespace std;

int main()
{
    int arr[5] = {4, 3, 2, 1, 0}; // int arr[] = {4, 3, 2, 1, 0};
    cout << arr << '\n';
    return 0;
}
```
我們先宣告一個長度為 \\(5\\) 的 `int` 陣列，並用 `{...}` 初始化，然後直接輸出 `arr`, 有沒有發現結果跟輸出指標類似？？其實它根本就是指標啊！！
{{<alert "本質上，C 風格的陣列就是指標。" success>}}
前面我們介紹過指標可以用 `*` 運算子來解析，其實指標本身還可以做 `+`, `-` 運算，代表指向後一個或前一個單位的地址。指標也可用關係運算子來比較所指向記憶體位址的前後。
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-1_array.cpp" >}}
上面的程式碼中，我們先以典型的方式賦值予陣列，接著故意以指標的方式輸出其值。事實上，對於編譯器而言，`arr[i]` 會被視為 `*(arr + i)`, 更進一步說，我們知道加法有交換律，也就是說，`arr + i` 等價於 `i + arr`, `arr[i]` 亦與 `i[arr]` 完全等價。

### 遍歷陣列

陣列的用途為紀錄大量同樣型別的變數，我們自然往往會需要對他們進行類似的操作，這時迴圈就是絕佳的拍檔。以下我們用讀入十個數字在依序寫出這個例子來示範常見的遍歷方法。

#### `for` & array index
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-2_traversal.cpp" >}}
最典型的存取方式，就不多做說明。

#### `for` & pointer
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-3_traversal_pointer.cpp" >}}
稍微進階一點的方式，也是指標的應用。注意到我們在輸出時特別用的是 `const` 的指標，由於第二個 `for` 我們沒有修改值的必要，因此我們告訴編譯器，避免不小心修改。當然，不加 `const` 其實也無所謂，但第一個 `for` 輸入時加上 `const` 編譯就會報錯，可以自行試試。

---

以上兩者是 C 當中皆有的基本方法。
#### C++11: range-based `for`
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-4_traversal_ranged_for.cpp" >}}
_Range-based `for` loop_ 是 C++11 的新功能，很類似 Python 的那種 `for`. 其實作的方式相當於以 _iterator_（算是包裝過的 _pointer_）迭代遍歷過容器，在 C++ **STL** 中十分方便。注意到有 `for (int i : arr)`, `for (int &i : arr)` 等形式，前者的 `i` 為 `arr` 當中元素的複製，即修改該 `i` 並不會修改到 `arr` 內的元素；後者之 `i` 則為 `arr` 當中元素的參考，即修改該 `i` 會修改到 `arr` 內的元素。此外，加上 `const`修飾的作用就如同以指標遍歷。

#### 同場加映：輸出入 stream iterator
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-5_traversal_stream_iterator.cpp" >}}
這邊示範以 C++ `<iterator>`, `<algorithm>` 當中的函式優雅的寫法跟你分享供你欣賞，有興趣可以自行深入研究。

### 可變長陣列

我們一開始舉的例子宣告長度為 `n` 此一變數的陣列，是所謂的可變長陣列 _(variable length array)_, 我認為翻譯成變數長度陣列比較好，在早期的 C 當中是不支援的，必須以 `malloc()` 等動態配置記憶體的手段。在 C99 及大部分編譯器實作的 C++, 我們是可以把陣列長度宣告為變數，但這其實還不是動態長度的陣列，更多現代的功能，改用 `vector<>` 會比較理想。

### 多維陣列

有時資料不只是一維的，會是二維會是更多維的，我們一樣可以宣告成陣列。比如說今天我們要處理 \\(2 \times 3 \\) 的矩陣：
```cpp
#include <iostream>

using namespace std;

int main()
{
    int matrix[2][3] = {{87, 69, 19}, {64, 89, 92}};
    return 0;
}
```
我們宣告惹 \\(2 \times 3 \\) 的二維陣列，也可以說是一個長度為 \\(2\\) 的「長度 \\(3\\) 陣列」陣列 (2-legnth array of 3-length array). 多維陣列還是陣列，只是它每個元素都也是陣列。大部分程式的多維陣列是 _row-major_ 的，也就是說與數學上類似，是先 _row_ 再 _column_. 操作的方法同樣離不開迴圈，有幾維就幾層迴圈。

### 類題演練

- [GreenJudge b001](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b001)
- [GreenJudge b002](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b002)
- [GreenJudge b003](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b003)
- [GreenJudge b004](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b004)
- [GreenJudge b005](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=b005)

## vector<>

C-style array 的本質是指標，相較於其他現代語言的陣列，許多方面麻煩不少，比如若要比較兩個陣列，`arr0 == arr1` 的意義是判斷兩者所指向的位址是否相等，而非元素是否一致；欲複製陣列中的元素，亦無法直接使用 `=`. 因此，在 C++ 我們有 **STL** 提供的容器 `vector`, 它的行為比較類似其他現代語言的陣列。**STL** 當中的容器都應用惹 C++ 物件導向及泛型這兩的特性，日後有機會再作說明。`vector` 的基本用法如下：
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "3.1-6_vector.cpp" >}}
首先第二行我們 `#include <vector>` 才能使用 `vector`. 接著第九行我們先只介紹四種初始化的方式：

0. `vector<int>` 的 `<int>` 代表我們這個 `vector` 是 `int` 的，此為泛型之語法
1. `v0(5)` 表示我們宣告的這個 `vector` 初始長度為 \\(5\\), 且值都為 \\(0\\). 有兩點值得注意：

    0. 這裡要用 `()` 而非 `[]`, 技術上來說我們是在呼叫 `vector` 的建構式，否則變成宣告 array of `vector`
    1. 其實 C-style array 不會初始化，也就是說 `int arr[5];` 一開始 `arr` 的值可能會是別的程式殘留的值，但 `vector` 會初始化為 \\(0\\)
2. `v1(5, 87)` 跟 `v0(5)` 不同之處，在於初始化的值改成我們指定的 \\(87\\)
3. `v2 = {4, 3, 2, 1, 0}` 類似於 `arr[] = {4, 3, 2, 1, 0}`, 稱為以 _initializer list_ 初始化，C++11 後才支援，編譯器會自己計算長度
4. `v3 = v2` 就是把 `v2` 的內容複製給 `v3`, 但注意 C-style array 是不能 `arr1 = arr0` 的，原因是 C-style array 並非可修改的 _lvalue_

然後，對應到先前介紹的四種遍歷方法，我們依序用 `for` 搭配 `vector` 的 index, `for` 搭配迭代器 _(iterator, 可以視作 **STL** 容器的 pointer)_, range-based `for` loop, 以及 output stream iterator 來遍歷四個 `vector`. 礙於篇幅限制，本文目前只教到將 `vector` 代替 C-style array 使用，未來在以專文介紹。
