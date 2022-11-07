---
aliases: []
author: nevikw39
categories: [競賽🏁]
date: 2022-09-18T16:07:08+08:00
description: ""
images: ["/images/ncpc-pre-111.jpeg"]
key_words: [National Collegiate Programming Contest]
series: []
tags: []
title: 111 學年度大專電腦軟體設計競賽 (NCPC) 校內預賽
# featured: true
# toc: false
---

去年 NCPC 校內預賽與免修考撞期，但我仍然誤打誤撞晉級[決賽](/posts/ncpc-final-110)。今年當然就是乖乖腳踏實地地準備，暑假團練的時候去年隊友之一的楊學長被拉入其他隊伍，因此我找惹從大一剛入學就被我推坑競賽的室友，組成惹 NTHU **DeBugCat Capoo** Team. 預賽前一晚，我跟室友把那支[紅酒](/posts/wolf-blass-hod)喝完。

## A - Kuchiguse

開賽就讓我開到一題水題，但我起初只單純地用 `std::equal()` 直接判斷 \\(K\\) 跟去除尾端標點的 \\(S\\) 的後綴是否相等，還好 submit 前有多想惹一下才發現，在 \\(K\\) 的前面補上空格才是正解。以一個水題而言，我的表現實在不太好。

> _1 try_, 20 min

## K - Sierpiński carpet

有點煩的碎形圖，是室友寫掉的。

> _1 try_, 32 min

## D - Candies

一開賽我就有注意到這題，顯然是個很裸的中國剩餘定理。雖然高中有練習過推導解法，但當時試一下發現實在沒什麼印象就先跳過。後來發現我們的 Codebook 雖然目錄沒有列出但其實有 CRT, 不過他的模逆元跟我習慣的推廣歐幾里得演算法不同，是用歐拉函數求的。照著刻一下模板之後就順利 AC 惹。

> _1 try_, 66 min

## G - Free Sushi?

這一題是學長做的，好像是機率題，就沒有什麼印象。

> _1 try_, 76 min

## H - Yet Another Alice and Bob

這題是個很瑣碎的實作題，是室友寫的，WA 幾次之後我跟他一起 debug, 最終終於過惹。後來這題變成競程一的作業，但我們都沒有想寫的意思。

> _5 tries_, 212 min

## B - Robot

接下來學長忙著研究 E, 室友跟我則尋找其他可做的題目，B 這題做出的隊伍並不多，所以被認為可能是難題。室友後來想到一個解法，但我抱持著懷疑的態度，沒想到丟上去之後真的 AC 惹！！這件事情告訴我們，一定要相信自己跟隊友。

> _1 try_, 220 min

## 賽後小結

這次的餐盒不錯，整場比賽我們表現地應該也還行，當然還有一些可以改進的地方。開場開地算是漂亮，D, G 做完曾經一度佔據一陣子的第二名。最終，我們有點驚險地守住第六名，即使 B 沒做出來比較 penalty 我們還是可以順利晉級決賽。

{{< figure src="/images/ncpc-pre-111.jpeg" width="69%" >}}
