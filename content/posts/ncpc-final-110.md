---
aliases: [ncpc_final_110]
author: nevikw39
categories: [競賽🏁]
date: 2021-10-16T17:21:05+08:00
description: ""
images: [images/ncpc_final_110.JPG]
key_words: [National Collegiate Programming Contest]
series: []
tags: [NCPC]
title: 110 學年度大專電腦軟體設計競賽 (NCPC) 決賽
# featured: true
# toc: false
---

上惹大學後，似乎沒有理由不繼續參加競賽（？其實高中就有想寫一些心得，只是一直沒有付諸實行。因此，趁著還有點印象，趕緊留下一點紀錄並養成習慣。

大學競賽有兩條主線，分別是教育部主辦的大專電腦軟體設計競賽 _(National Collegiate Programming Contest, `NCPC`)_ 及 ICPC Foundation（古代為 ACM）主辦的 International Collegiate Programming Contest `(ICPC)`, 可以對應到高中的資訊學科能力競賽及 International Olympia in Informatics `（IOI)`. 其中，不一樣的是 NCPC 只有初賽及決賽，減少惹高中時期的地區複賽；此外，ICPC 的規模比 IOI 盛大許多。

NCPC 的初賽原則上是採網路形式統一舉行，但前一年度排名前三的學校（通常是臺、交、清）可以自行推選六隊代表逕入決賽。而今年清大校內初賽的日期與免修測試不巧撞期，由於已經繳費，我本來想說天意如此。沒想到，校內初賽告一個段落之後的某天，突然有位張學長私訊我，說他們那隊只有兩個人，雖然可以晉級但缺一個人。於是，我就非常幸運地加入 **Dkjistra**（關於隊名的八卦，是因為學長在寫 _Dijkstra_ 時常因為 `std::priority_queue` 搞混，很巧的是清大另一隊 Disixtra 也是不約而同），獲得參與 NCPC 決賽的機會。

NCPC 決賽像 TOI 入營考一樣，分為南北兩地同步舉行。因此，我再度前往師大圖書館校區。決賽賽程僅有一天而且沒有送 T-shirt, 感覺等級輸高中全國決賽一截。早上測完機之後，中午只有簡單的便當可以吃。由於疫情的緣故，也沒有提供下午茶點心。以下就簡單說說解題的過程：

### C - Distribution Distance

我們這隊開賽的速度都不快，直到將近一小時 -- 比賽經過五分之一 -- 才拿到第一個 `AC`. 現在事後看看這題，其實就是給兩個長度相等的陣列，選取某些元素使得前者減掉後者最大。

> _1 try_, 59 min

### A - Perfect Power

接下來的時間楊學長先寫 B 但 `WA`. 我看惹一下 A, 題目是對於一個 \\(n\\) 找到 \\(m, k\\) 使得 \\(n=m^k\\) 且 \\(k\\) 盡量大。我突然想到在高鐵上翻 IOICamp 的講義，剛好看到其中一段說區間開根號操作的 lazy propagation 可以記錄區間是否都是 \\(1\\), 因為任何數開很多次跟號很快就會變成 \\(1\\).

雖然沒有什麼關係，但我因此得到一個差不多 \\(O(1)\\) 的解：從 \\(i=63\\) 開始遞減，看看 \\(m_i=\left\lfloor\sqrt[i]{n}\right\rfloor,{m_i}^i\\) 是否等於 \\(n\\).

> _1 try_, 77 min

### B - Promenade Dance

其實這題就跟[今年 TOI 入營考 C](https://www.facebook.com/bangye.wu/posts/10158499012393241)一樣，是的沒錯，就是一個 **LIS** 的包裝題。但冥冥之中又出事惹，丟上去吃惹兩個 `WA`, 而且我們都找不出 bug. 後來換成張學長重寫一遍才終於 `AC`.

> _3 tries_, 134 min

### J - Shortest Paths with Unvisited Sightseeing Spots

這題也有不少隊伍做出，題目是要求無向圖上兩點最短路徑中，最多能經過幾個特定頂點。_Dijkstra_ 的過程中，同時記錄現在這個頂點經過多少特別的頂點，

> _1 try_, 147 min

### E - Archery at the Summer Opymlic Camp

這是一個偏噁心的幾何題，僅僅七隊做出。內容是給定 \\(n\\) 個凸多邊形及其分數，且 \\(\forall i < j, C_i\supset C_j\\), 對於 \\(m\\) 個點，根據其在多少個多邊形內計算得分。

我們的模板剛好有帶到判斷點是否在多邊形內，所以再配合二分搜即可求解。只是在二分搜的過程中出惹一點小問題，最終我改成跳躍式的並開 `long long` 終於 `AC`.

這題做出來時理應已經封版，但我們還是得到一顆氣球。

> _2 tries_, 256 min

## 賽後

{{< figure src="/images/ncpc_final_110.JPG" width="69%" >}}

我們最終以第 \\(28\\) 名（清大 3/6）做收，獲得惹佳作。拿到一之鄉的餐盒是有點空虛。離開賽場之後才知道原來當天下午開始下起大雷雨，清大的選手們一起去師大附近的瑪莉珍披薩聚餐。因為清大有一隊竟然棄賽沒參加，所以我們獲得加菜金。

### G - Assigning Frequencies

雖然這題只有八隊解出，但最後剩下半小時的時候我有想試試看這題，因為看起來就像是模擬著色的過程即可。但我寫爛掉惹，連範測都沒過。時隔一陣子我重寫然後丟上 [ITSA](https://e-tutor.itsa.org.tw/e-Tutor/Question_bank.php?id=14) 然後就 AC 惹 QQ.

### L - Majority Vote

賽後看到記分板上這題不少隊伍做出但我卻沒什麼印象，讀一下題目發現就是一個 \\(O(K\log K\times N)\\) 的排序題，丟上去之後卻吃惹一個 `WA`. 跟學長討論後才發現沒考慮到偶數個選民可能有兩個候選人排名相等的情況，改成 `stable_sort()` 就 AC 惹。

---

總而言之，我自評自己在這場比賽的表現還算可以喇。
