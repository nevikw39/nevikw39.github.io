---
aliases: []
author: nevikw39
categories: [ç¨å¼ð»]
date: 2021-07-19T16:33:55+08:00
description: ""
images: []
key_words: []
series: [C++ å¥é]
tags: [C++, control flow, while, for, debugger]
title: "[C++ å¥é] 2.1 ç¨åºæµç¨ï¼while & for è¿´åæ§å¶"
# featured: true
# toc: false
---

æåç¾å¨æè¼¸åºä¸è¡å­ä¸²ï¼å°å§ï¼ï¼å¦æè¦è¼¸åºå©è¡å¢ï¼ï¼è¤è£½è²¼ä¸ï¼æå®ãå¯æ¯è¦æ¯æ¯ \\(100, 1000\\), çè³æ¯ \\(n\\) æ¬¡å¢ï¼ï¼é»è¦çå°é·é¤æ¹è¨ç®ï¼éæåéè¤çäºï¼éææåå¯ä»¥éç¨è¿´åã

## while

`while` çèªæ³æé»å `if`:
```cpp
while (condition)
{
    // ...
}
```
è `if` çä¸åå¨æ¼ `while` æéè¤å·è¡å¤§æ¬å¼§å§çé³è¿°ï¼ç´å° `condition` çºé¶ãä¾çåç¯ä¾å§
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-0_while_rand.cpp" >}}
éåç¨å¼é¦åæ¨¡æ¬ä¸æ²ä¸é¡éª°å­ï¼ç¢çéåé \\([1, 6]\\) å§çå½é¨æ©æ¸çº `val`, ä¹å¾è®ä½¿ç¨èè¼¸å¥ `n`, ç¶ `n != val` å°±è®ä½¿ç¨èç¹¼çºçãç¬¬äºãå«ãä¹ååè¡ååæ¯ç¢çäºæ¸çæ¹æ³ï¼å¯ä»¥åä¸çå®ãèç¬¬åè¡å¾åç `n = 0` å¾éè¦ï¼å®æ¯ä¸åè®æ¸åå§åçä½ç¨ï¼ç¶æåå®£åä¸åè®æ¸å»æªè³¦äºå®å¼ï¼å­å¨ä¸åæ¥µä½çæ©çå®çå¼åå¥½ææ¯ `val`.
{{<alert "åææè©¦ççï¼æååæ¨£å¨ç¬¬åä¸è¡åæ¹é»ä¸ä¸è¨­ç½®ä¸­æ·é»ï¼å·å·è§å¯æåéª°å­æ²å°ç val, æ F10 Step Over éæ­¥å·è¡ï¼ççä¸ä¸è¡æè·³è³ä½èã" info>}}

åå°æ¬æéé ­çå¼å­ï¼å¦ä½å¯«åºè¼¸åº `n` æ¬¡å­ä¸²çç¨å¼ï¼ï¼
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-1_while.cpp" >}}
éè¨å¾éæ¸éç®å­åï¼ï¼éè£¡æåæç¨ä¸åå°å°æå·§ï¼å°æ¼ä¸åæ­£æ´æ¸ `n`, ç¶é `n` æ¬¡ `--`, å¶å¼æè®çº \\(0\\). ä½æ³¨æ `n` æçµçå¼ææ¯ `-1` åå æ¯ç¶ `n` çºé¶æéæé²å¥ `while()`, å¤æ·çæååæ `--`. å¦æä½ ç¾å¨ä¸é ­é§æ°´ï¼é¡¯ç¶éæ²æ¯æ²æå­¸å¥½éæ¸éç®å­ï¼ä¸éä¹æ²éä¿ï¼ç­ä¸ç¨ `for` è¿´åæ¹å¯«æ¯è¼ç´è§ææã

### do-while

`do-while` çèªæ³å¦ä¸ï¼
```cpp
do
{
    // ...
} while (condition);
```
è `while` çä¸åå¨æ¼ `do-while` æè³å°å·è¡ä¸æ¬¡å¤§æ¬å¼§çå§å®¹ãæåçæ²éª°å­ç¨å¼å¯ä»¥éæ¨£æ¹å¯«ï¼
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-2_do_while_rand.cpp" >}}
æ³¨æå°å çºæåå¨å `n` çå¼å¤æ· `n != val` åå¿å®å·è¡é `cin >> n` è³¦å¼ï¼å æ­¤ç¬¬åè¡ä¸äºåå§åä¹æ¯å®å¨çã

### ä¾é¡è§£æ

- [GreenJudge c046](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c046)
    + éé¡è¦æ±å°æ¸é»å¾å `n` ä½ï¼å°±ç¨è¿´åæ¨¡æ¬æåçé·é¤æ³
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-7_g_c046.cpp" >}}
- [GreenJudge c040](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c040)
    + ä¸æ¨£æ¯æ¨¡æ¬é¡ï¼å³ä½¿æ²è½éè¼¾è½ç¸é¤æ³ä¹æ²éä¿ï¼ç§é¡ç®èªªçå°±å°æ¹
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-8_g_c040.cpp" >}}

### é¡é¡æ¼ç·´

- [GreenJudge a021](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a021)
- [GreenJudge a022](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a022)
- [GreenJudge a023](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a023)
- [GreenJudge a024](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a024)
- [GreenJudge a025](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a025)
- [GreenJudge a041](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a041)
- [GreenJudge a043](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a043)

## for

`for` ä¹æ¯è¿´åæµç¨ï¼å®åå¾å°çäºå¶å¯¦ `while` ä¹é½åå¾å°ï¼ææ¹é¢èè¨ç®æ¯ä¸ç¨®èªæ³ç³ã
```cpp
for (initial; condition; afterthought)
{
    // ...
}
```
å¶ä¸­ï¼`initial` æ¯åå§åçé³è¿°ï¼C++ è·ç¾ä»£ç C åè¨±å¨æ­¤å®£åè®æ¸ï¼`condition` è· `while` ä¸æ¨£ï¼è®æ \\(0\\) å°±æé¢éè¿´åï¼è `afterthought` æ¯æ¯æ¬¡å·è¡å®å¤§æ¬å¼§å§é³è¿°ä¹å¾æåçéç®ãæåçè¼¸åº `n` æ¬¡å­ä¸²çç¨å¼ `for` ver.:
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-3_for.cpp" >}}
æåå¤å ä¸åå°åè½ï¼å°±æ¯è¼¸åºéæ¯ç¬¬å¹¾éï¼é å¸¶ä¸æï¼ `for` ä¸­ç `i` æ¯ _index_ ç·¨èçææã
{{<alert "åææè©¦ççï¼ä½ è½ä¸è½å¯«åº while çæ¬èä¸å¸¶æç·¨èçç¨å¼ï¼ï¼" info>}}
{{<alert "åææè©¦ççï¼æåæ¼ç¬¬ä¹è¡åæ¹é»ä¸ä¸è¨­ç½®ä¸­æ·é»ï¼æ F10 Step Over éæ­¥å·è¡ï¼ççä¸ä¸è¡æè·³è³ä½èã" info>}}

### 0-indexed numbering

å°éè£¡è£¡å¯è½å¾ç´æ¶ï¼æåç `for` æéº¼ä¸å¯«æ `for (int i = 1; i <= n; i++)`?? å¶å¯¦éæ¨£ç¶ç¶ä¹å°ï¼ä½å¨ç¨å¼è¨­è¨ä¸­æåå¾åä½¿ç¨ _0-indexed numbering_, åæ¬ååæåçé `int`, `long long` çå¼åçè¡¨éï¼å¾å¾é½æ¯ç¨ä¸åå·¦éå³éçåé \\([a, b)\\)ï¼æ¯å çºæéäºå¥½èï¼
- åéé·åº¦å³çº \\(b - a\\), æ²æè¨äººå­çåå°æ¤æ¨¹åé¡
- å°åéä¸åçºäºæå¯ä»¥è¼æå°å¾å° \\([a, \frac{a+b}{2})\\), \\([\frac{a+b}{2}, b)\\), ä¸ç¨å \\(+1\\)
- éè¨å¾åäºæ¸å­¸ç­å·®æ¸åèç´æ¸åï¼ï¼ \\(a_n = a_1 + (n - 1)d,\ S_n = \frac{n}{2}(2a_1 + (n - 1)d)\\), å¦ææåæ¹ç¨ _0-indexed numbering_, å¬å¼è®æ \\(a_n = a_0 + nd,\ S_n = \frac{n+1}{2}(2a_0 + nd)\\), æ¯ä¸æ¯æ¼äº®è¨±å¤ï¼ï¼

æ­·å²ä¸ \\(0\\) éåæ¦å¿µæ¼äººé¡ææä¸­ç®æ¯æ¯è¼æççªç ´æ§åµæ°ï¼è³ä»æåçè³é½éä¸æ¯å¾ç¿æ£å®ãç­å°å¾é¢é²å¥é£åèææ¨ä¹å¾ï¼ç¸ä¿¡æå° _0-indexed numbering_ æ´ææè¦ºãç¼ææç­è·¯å¾æ¼ç®æ³ç Dijkstra å¯«éä¸ç¯[ç­æ](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)å¯ä»¥ççã

### ä¾é¡è§£æ

- [GreenJudge c004](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=c004)
    + å çºéé¡æåéè¦ç¥éæ¯è¿´åç¬¬å¹¾æ¬¡ï¼æä»¥ç¨ `for` èé `while`. æ³¨æå°éé¡çæ¸å­é½æ å¨ä¸èµ·æ²æç©ºç½ï¼å æ­¤æåç¨è®å¥å­åçæ¹å¼ï¼åæ¸å» `0` çå­åå¼å°±å¯ä»¥è½åæ´æ¸ã
        * {{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-8_g_c004.cpp" >}}

### é¡é¡æ¼ç·´

- [ZeroJudge a005](https://zerojudge.tw/ShowProblem?problemid=a005)
- [ZeroJudge b791](https://zerojudge.tw/ShowProblem?problemid=b971)
- [ZeroJudge c184](https://zerojudge.tw/ShowProblem?problemid=c184)
- [ZeroJudge d010](https://zerojudge.tw/ShowProblem?problemid=d010)
- [ZeroJudge d498](https://zerojudge.tw/ShowProblem?problemid=d498)
- [GreenJudge a026](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a026)
- [GreenJudge a027](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a027)
- [GreenJudge a028](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a028)
- [GreenJudge a029](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a029)
- [GreenJudge a030](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a030)
- [TCIRC Judge c003](https://judge.tcirc.tw/ShowProblem?problemid=c003)

## break & continue

èæ®ä¸é¢çåé¡ï¼
> çµ¦å®ä¸æ¸å \\(A\\) åä¸æ´æ¸ \\(K\\), æ± \\(K\\) ææ©åºç¾çä¸æ¨ï¼ä¿è­ \\(K \in A\\), æ³¨æ \\(K\\) å¯è½éè¤åºç¾å¤æ¬¡ã
>
> è¼¸å¥çç¬¬ä¸è¡æå©åæ´æ¸ \\(N, K\\), å¶ä¸­ \\(N\\) çº \\(A\\) çé·åº¦ï¼æ¥èä¸è¡æ \\(N\\) åæ¸å­ï¼åå¥æ¯ \\(A_0, A_1, ..., A_{N-1}\\). è©¦è¼¸åºä¸æ´æ¸ï¼çº \\(K\\) ææ©åºç¾çä¸æ¨ã

å¯«åè¿´åè® \\(N\\) åæ¸é²ä¾å¤æ·æ¯å¦ç­æ¼ \\(K\\) å°æåèè¨ä¸é£ï¼ééµå¨æ¼éè¦é¿åéè¤ãæåå¯ä»¥ä½¿ç¨ `break;` èªå¥è·³é¢ç¶åçè¿´åï¼
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-4_break.cpp" >}}
æåå¨ `switch-case` å°±éé `break;` æ¹ï¼èå®ä¹å¯ä»¥ç¨å¨ `while`, `for`.

æ¥èèæ®å¦ä¸ååé¡ãå°æåå¤§å®¶é½ææ¸æ¸ï¼ä¸éå¨æäºå°æ¹æäºæ¸å­å¾ææï¼éè¦è¢«å±è½ãç¤ºç¯ä¸ä¸å¾ \\(0\\) æ¸å° \\(99\\), ä¸¦ç¨ `continue;` è·³éæææ¸å­ï¼
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-5_continue.cpp" >}}

## å·¢çè¿´å

è `if-else` ç¸åï¼æåç¶ç¶å¯ä»¥çµåå¤åè¿´åãæ³¨æå·¢çè¿´åå·è¡é åºï¼æ¯ç±å¤èå§ï¼åç±å§èå¤ãåºä¸ç¤ºç¯å°åºä¹ä¹ä¹æ³è¡¨ï¼
{{< gist nevikw39 7cd9f2d7f536e4f78d4d0fcddb0fbb80 "2.1-6_nested_loop.cpp" >}}
ç±æ¼ä¹ç©æä¸ä½æ¸ä¹æå©ä½æ¸ï¼å æ­¤æåä½¿ç¨ `<iomanip>` ä¸­ç `setw()` ä¾åæçã

### é¡é¡æ¼ç·´

- [ZeroJudge c418](https://zerojudge.tw/ShowProblem?problemid=c418)
- [ZeroJudge c419](https://zerojudge.tw/ShowProblem?problemid=c419)
- [ZeroJudge c420](https://zerojudge.tw/ShowProblem?problemid=c420)
- [ZeroJudge d649](https://zerojudge.tw/ShowProblem?problemid=d649)
- [GreemJudge a046](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a046)
- [GreemJudge a047](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a047)
- [GreemJudge a048](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a048)
- [GreemJudge a049](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a049)
- [GreemJudge a050](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a050)

## Online Judge çè¼¸å¥

å¨æ­¤ä¹åæåå Online Judge çé¡ç®å¤§å¤æ¯åªæä¸ç­æ¸¬è³ï¼ä½æäºé¡ç®å¯è½æä¸æ¬¡å¤ç­æ¸¬è³ï¼æåå°±éè¦æç¨è¿´åãåºä¸ååºå©åç³»åé¡è®å¤§å®¶æåä¸ä¸ï¼ä¹å¾åé¡é½è¦çæ¸æ¥é¡ç®æè¿°ã

- æ ¼çå¥éçç©æ±
    + [ZeroJudge d067](https://zerojudge.tw/ShowProblem?problemid=d067)
    + [ZeroJudge d069](https://zerojudge.tw/ShowProblem?problemid=d069)
    + [ZeroJudge d070](https://zerojudge.tw/ShowProblem?problemid=d070)
    + [ZeroJudge d071](https://zerojudge.tw/ShowProblem?problemid=d071)
    + [ZeroJudge d072](https://zerojudge.tw/ShowProblem?problemid=d072)
- å¬å¹³çæ°å½¹
    + [GreemJudge a036](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a036)
    + [GreemJudge a037](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a037)
    + [GreemJudge a038](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a038)
    + [GreemJudge a039](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a039)
    + [GreemJudge a040](http://www.tcgs.tc.edu.tw:1218/ShowProblem?problemid=a040)
