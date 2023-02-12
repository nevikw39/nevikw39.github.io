---
aliases: []
author: nevikw39
categories: [競賽🏁]
date: 2022-10-15T17:35:14+08:00
description: ""
images: ["/images/ncpc-final-111.jpeg"]
key_words: [NCPC, National Collegiate Programming Contest]
series: []
tags: []
title: 111 學年度大專電腦軟體設計競賽 (NCPC) 決賽
# featured: true
# toc: false
---

一早醒來覺得喉嚨有點怪怪的頭還有點痛，應該是確診剛復原而不是前一天晚上[喝太多](posts/gekkeikan-jumai-daiginjo)吧。室友跟我出門時間抓得有點緊，台北又下雨因此不能騎 YouBike 要從古亭走到師大圖書館校區，我們還跑錯大樓結果好像是最後報到的。說實在今年動線真的偏亂，也沒有像去年一樣發行前通知。進入賽場之後，我們那間教室有夠擁擠，不知道別間情形如何。中午用完餐跟一些高中同學們打招呼後真的感覺扛不住，冒著雨在正式開賽前趕去師大夜市中的屈臣氏買普拿疼。

> 由於題目尚未公佈而紙本已經散佚，這邊就先簡單寫寫日後再補吧
> > Updated on Feb. 12, 2023.

## B - Traveling Number

這題是個水題，但 sample output 跟題目所說格式不同導致學長吃惹一個 penalty, 比賽後段我們有 request clarification 要求特判那個 submission 卻只有得到 no comment 的回應。假使不計這個 penalty 我們排名有可能往前，但其他隊伍也是同樣，最終我們就是認了。

> _2 tries_, 12 min

## A - Looping Cycle

應該也是學長做的，一個有趣的數學題。事實上，循環節的長度不是 \\[8\\] 就是 \\[1\\].

> _1 try_, 26 min

## D - Maximum Profit Interval

看起來只是輸入比較奇怪而已，應該就是對差分數列求最大區間和。

> _1 try_, 78 min

## C - Invest in Stocks

這題像是高中 AP325 中的例題**一次買賣**，但賽中我一直想寫出 DP 轉移式。後來室友想出貪心法，我就乖乖刻貪心掃描線。

> _1 try_, 83 min

## N - Cluster PK Cluster

這一題的敘述頗難懂，我跟學長討論一陣子才想通，後來學長就順利做掉。

> _2 tries_, 131 min

## L - River

雖然手邊暫時沒有 L 的題目但我仍然印象深刻，這題可以作為團隊精神的最佳例證。首先隊友想到可以對值域枚舉，我想到每次可以用 DP 判斷，學長發現應該要用單調佇列。經過多次嘗試之後，我們終於憑藉著不放棄的精神才終於 AC!!

在等待的過程我一度想說 AC 就吃掉題目還是後來是說撕掉，綠色 AC 出現那刻真的是太激動惹。

> _3 tries_, 277 min

## 賽後

最終我們做出六題，感覺算是不錯，晚上清大的選手們去吃佬 Pizza. 隔兩天後在計網概上課時我才發現正式計分版出爐，我們竟然排在第 \\(23\\) 名，也從預賽的清大第六進步到清大第四！！雖然跟去年一樣是佳作，但差四名就會有第四名的頭銜，倒是感覺有點可惜。

{{< gallery images="images/ncpc-final-111-ballons.jpeg,images/ncpc-final-111.jpeg" >}}
