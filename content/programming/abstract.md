---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-14T17:42:52+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++]
title: "[C++ 入門] 0. 序：何謂電腦？？程式可以幹嘛？？"
draft: true
# featured: true
# toc: false
---

最近想開始撰寫一些程式語言入門的教學。在這樣高度資訊化的社會，每個人都或多或少需要會點程式。可是網路上程式的教材多如牛毛、各種資源俯拾皆是，那麼為何我還要再寫一份呢？？原因是我覺得大部分的教材皆過於單一化，因此希望將我從小自學程式、高中社團擔任教學、解答同學常見問題以及參與一些競賽的經驗做點整理。

在這份教材中，我將自初學者角度從 0 出發，由關於電腦的小常識、開發環境的準備開始，一步一步建立對於程式語言的觀念。以下是本教材的目錄：

0. 序章
1. `hello, world`: 輸出入、變數與運算
2. 程式流程：條件判斷與迴圈控制
3. C-style 指標、陣列及字串
4. 函式與其他

而在序章中，我們會先介紹電腦與程式，接著帶各位準備好開發環境，最後說明一些其他事項。本文的介紹可以當故事看看即可，不必強求完全理解。

## 何謂電腦？？

你現在不必急著對著手機的 Google Assistant 問說：｢什麼是電腦？？」XD 如果你小時候與我相同是個好奇寶寶，就會知道維基百科上說：｢電腦，全稱電子計算機……」從英文來看 compute 意為計算，computer 當然是指計算的人或機器。

今天畢竟是入門，就跳過穿孔卡帶、差分機，直接切入主題：現代電腦惹。世上被認為第一部電子計算機，ENIAC, 在每次運算前，必須先手動調整電路配線，才能通電運作得到結果。也就是說，ENIAC 不能儲存 **｢程式」**，每次只能執行固定用途的一套 **｢程式」**。

直到馮·紐曼（馮諾伊曼，_von Neumann_, 你唸 IKEA 還 Costco??）基於圖靈機概念及二進位制提出同名架構，才正式奠定現今通用型電腦的根基。在馮·紐曼架構中，電腦被分為五大部門：

0. 控制單元 _Control Unit_
1. 運算邏輯單元 _Arithmetic Logic Unit_
2. 記憶體 _Memory_
3. 輸入 _Input_
4. 輸出 _Output_

其中，CU, ALU 合在一起就是我們的 CPU. 當然，我們的重點並不在此，本節核心觀念是：

{{<alert "程式接受輸入，將資料儲存在記憶體，經由 CPU 運算後，將結果輸出。" success>}}

## 程式可以幹嘛？？

Program, 原意為一套程序，看過上面電腦的簡史後，大概能體會如今我們可以透過撰寫一些指令替代原始的調整配線，使電腦進行某些運算。

電腦是二進位制的，自然也只懂二進位制，但應該不會有太多人覺得撰寫二進位制 Op Code 是很有趣的，因此組合語言出現惹。但是這樣仍然存在諸多不便，隨著程式日益複雜，高階程式語言應運而生。

典型的高階語言程式原始碼以較適合人類理解的語法撰寫，經過一系列預處理，編譯器、組譯器及連結器才得到電腦讀得懂的可執行檔。

Java, C# 這類語言會先編譯成位元組碼，等到執行前才由虛擬機 Just-In-Time 編譯為可執行檔。Python, JavaScript 這類直譯語言則是在每次執行時才被直接轉譯執行。

儘管我們日常生活中常見的都是具備圖形化介面的程式，但最早的程式是執行在命令列（終端機，_Command Line_, _Console_, _Terminal_），而這種程式開發起來也容易許多。

## 為何（不）要學 C++??

最後就是對於初學者，應該要學習何種程式語言？？參考 TIOBE, 可以發現 C 語言自 1970s 始終維持高超人氣而不墜，C++ 同樣也維持著不錯的成績。近年來，一些新興語言如 Python, Go, Rust 譯獲得不少關注。

我的觀點是，在可預見的未來內，當前的主流作業系統將繼續維持與 C 的羈絆而難以撼動，因此對於志於資工的學生 C/C++ 仍是首選。而 C++ 相較於 C 對初學者更為友善且具備更多功能。雖然本教材以 C++ 為主，仍會適時註明相關 C 語法。

假如你非本科生、資工不是你最主要的興趣，那麼 Python 就十分適合。