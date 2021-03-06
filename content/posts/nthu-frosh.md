---
aliases: [nthu-freshman]
author: nevikw39
categories: []
date: 2022-06-25T21:04:16+08:00
description: ""
images: []
key_words: [清大, 資工, 程設, 助教]
series: [大學]
tags: []
title: 大一心得小結
# featured: true
# toc: false
---

在清大的第一年，由於疫情的攪局，結束得十分突然。承[上學期](/posts/nthu-frosh-semester/), 一如過往慣例寫寫這學期的生活．

## 助教

上學期導聚的時候跟導師聊到我是 APCS 組的、考過免修測試在修程設二，恰好導師下學期要開程設二而他缺一名負責出題的助教。當時其實我很訝異，因此也沒有馬上答應。我曾聽說過有些台大資工的大一也會擔任助教，但我不認為我能夠跟他們相比。上學期末的時候導師發 email 再次詢問我的意願，我問惹一下去年出題的情形。這畢竟是個很難得的經驗，猶豫惹一下我還是答應惹。

導師其實去年才進入清大服務，很年輕長得高高帥帥的，專長是機器學習，下一個學期開設的機器學習好像是一選系上待亂數人數最多的課程。寒假初程設二助教群第一次開會，但我出門前被系上同學找去問程設一期末專案的一些問題結果遲到惹。事後有再特別傳訊息給教授，畢竟不能第一次就留下不好的印象啊。這學期事務組的助教都是學姊，可能是導師的專題生，叢集競賽的學長姐組員好像也將進入導師的實驗室。

擔任助教的消息一開始只有告訴修隔壁程設的室友，可能的修課同學我也只知道一個高中社團朋朋，後來他還是加簽去隔壁班。不過開學後跟一群班上朋朋們去惹東門市場對面的居酒屋，我就順口說溜惹嘴，席間剛好有兩位修課同學。如果有個助教朋朋，他或許可能幫你快速 Debug, 回答問題 ~~，甚至偷看成績跟可能抄襲你的同學的名字~~。不過基本該有的職業道德，我肯定恪遵不渝。後來看惹一下名單，也有再認出幾個名字。

程設二 Online Judge 出題的範圍主要是 linked list, 樹與圖的基礎、C++ 的新特性與 STL 的應用⋯⋯等等。負責出題的助教還有目前學校 ICPC 第二名那隊的李學長。我們出的題目被用於作業、小考與段考的部分，其餘則是事務組的學姊們選自 NTHU OJ 上的舊題庫或作業、小考。

### 瑕疵

高二擔任電研社教學時是曾有出些習題與舉辦兩次社內賽的經驗。但我這學期初的第一題就出包惹，一個 partial judge 題，原本期望以 \\(O(1)\\) 的空間判斷 linked list 是否為回文，許多同學開一個額外的陣列把 linked list 記錄下來就算惹，竟然有人只判斷頭尾是否相等的假解，測資亂數產生的技巧太糟被唬爛惹。發現之後我有補上 hacking 假解的測資，但我也想不到怎麼卡空間。更糟的是這題還被選為 lab 1, 我只能儘快告訴學姊這個狀況。

另外一個致命的錯誤發生在某個物件導向的題目，我原本是在建構子與解構子分別 `new[]`, `delete[]` 動態配置記憶體，但這引發一些奇怪麻煩事，後來改成 `std::array<,>` 並以 `std::fill()` 初始化，但考前幾天學姊說不要用 `std::array<,>`, 因此臨時再改成傳統的陣列，但我把 `std::fill()` 換成 `memset()` 時誤把後兩個參數給搞錯惹，其實學姊在 Windows 上的 Code::Blocks 就有發現 _Segmentation Fault_, 前一天晚上跑去電腦教室確實重現這個錯誤，但我因為自己電腦與 OJ 上都看似沒有問題而採用比較唬爛的假解，最後還是修課的朋朋告訴我才知道這題送分。

---

我覺得自己出題都想不到有趣的敘述也沒搭配什麼梗圖，可能我真的是個無聊的人。題目的靈感不少也是來自網路，甚至是自己高中出的題目。第一次期中出惹一個偏難題，是從學長出的題目延伸並改編自高二參加的 TOI 入營考第二題，但我提示幾乎寫的跟敘述一樣長，最後只有一個人 **AC**, 教授還說這個難度不錯 (? 遠距的期末則是從去年 NCPC 決賽挑一題簽到題，這次有十多人 **AC**.

最後是關於待遇的部分，我當初也多少覺得這應該是個有給職，朋朋知道後也多少都會好奇，父親甚至說這樣一來我就要繳稅不能被歸為撫養之類的。不過由於我的臉皮實在很薄，我一直沒有去問教授這個問題，直到開學後一陣子寄信給我。這學期我總共出惹十三題，算起來平均每題大約是 \\(\\$1000\\), 應該算是很不錯的。

這學期的出題細節都在這個 [repo](https://github.com/nevikw39/I2P2), 我那時都還是自己寫 Python, shell script 生測資與檢查等等。未來假若還有機會，再試試看專業點的 `"testlib.h"`.

## 課業

這學期從選課開始就不太順利，第一次選課沒有選到系上中文的邏輯設計、核心通識，體育經過第二、三次選課依舊全部槓龜。後來直到線上加退選時，我有天驀然想起，首先填惹七個體育，包括跆拳道、空手道，甚至是一些水上活動的，最後很幸運的選上相對比較好的健走體適能，雖然在南大但也該滿足惹。隔幾天也亂數加選上評價好又熱門的核通 --- 論孟選讀。

起初雖然僅僅修惹 \\(18\\) 學分，但過起來遠沒有上學期輕鬆。微積分與物理超出高中範圍太多，準備起來需要花上不少時間。邏設大概是這學期最令我頭痛的科目惹，第二次選課我就乖乖選英文授課，但後來才知道很多人都有加簽到 QQ. 前面開頭的布林代數是離散數學的基本，K-Map 在古代的高中資訊能力競賽筆試也多少或許會出現，但第一次段考就燒雞惹。進入一些組合電路後就開始覺得吃力惹，更不用說循序電路，我在第二次段考前才想到應該要看 OCW 的，最後還是有點悽慘。但是寫 Verilog 的 lab assignment 我覺得還滿有趣的，可以 ssh 到系上的工作站，第三次 pattern matching 跟 KMP, Z algorithm 也很相關。

因為選上核通，開學後就因此把另一門英語授課的選修通識退掉。殊不知一切才沒有那麼順利。我確實在這門課不夠用功，以為會是像高中文化基本教材。期中考的題型是很開放的申論，只能說跟我頻率不合吧，而老師公佈成績的方式是下課時排隊問成績，其他的同學都是 \\(8, 90\\) 分，我卻只有 \\(60\\) 分，期中考又明文佔總成績的三成。那陣子接連在準備普物跟邏社的二段，還有叢集競賽的模擬賽，程設助教出包也是那時候的事。雖然我很不喜歡放棄的感覺，但最終還是選擇二退，這真的是個艱難的決定。有朋朋修同個老師的莊子，雖然期中考高達 \\(85\\), 但總成績只有 **B+**, GPA 跟 T 分數直接被送下去 QQ.

因為上學期修惹程設二，這學期不知道要修什麼，為惹避免低修只好修資結。教授的英文是講得很好，但個人真的覺得偏無聊。不論是作業抑或小考的 OJ 題目，頂多是囉嗦、繁瑣又惱人的實作題，沒有什麼存在技術成分的難度。Partial judge 的題型我個人覺得應該要像 IOI, TopCoder & LeetCode 那樣，要求實作一個參數們與回傳值有意義的完整函式，而不是制定大量瑣碎的輸出入格式。兩次紙筆段考沒有考好當然是我自己的問題，但是修到一門學不了東西又令人煩躁的課，還被成績刷 QQ.

上學期只有 \\(0\\) 學分的體育拿 **A-**, 結果這學期兩個 \\(3\\) 學分的必修拿 **A-**, 更只有 \\(2\\) 學分的英文 **A+**. GPA 如我所料，果真跌破 \\(4\\) 字頭大關，與上學期相比，幾乎退步惹將近一個等第。上大學後不管競賽、讀書或是生活好像都普普通通，暑假要乖乖看高等離散、線代跟計網概的 OCW.

---

To be [continued](/posts/nthu-frosh-cont)...
