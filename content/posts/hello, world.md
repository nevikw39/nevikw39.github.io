---
aliases: []
categories: [札記]
date: "2021-03-31T22:02:45+08:00"
description: ""
images: []
keywords: [hexo, Static Site Generator, 靜態網頁生成器, Blog, 部落格, hugo theme, hugo 主題]
series: []
tags: [hugo, hugo theme, Static Site Generator]
title: hello, world
# featured: true
# toc: false
---

> `hello, world`

撰寫 Blog 亦🈚️例外，仍以標準、傳統而熟悉的 `hello, world` 來開場吧。

## TL; DR

我們這個世代，撰寫 Blog 似乎已經成為🈶️些過於老氣之舉，畢竟時下新興多媒體之發達🉑️謂雨後春筍。

然而，我依舊深信文字的溫度與力量是🈚️🉑️抹滅的。

同時，不少優秀的競賽選手皆保🈶️筆耕不輟的習慣。不曉🉐多少次打開 Google 尋求🈯️引總是導向一位位電神的 Blog. 雖然我是個孤陋寡聞的井底之蛙，但還是希望能盡我所能，在網路的汪洋㊥留下些許波痕。

## 輕量級 Blog

現在主流透過 Static Site Generator 便捷地產生靜態網頁並放上託管服務如 GitHub Pages 來作為輕量級的 Blog.

### Static Site Generator

常見的工具包括：Jekyll, Hexo 與 **Hugo** 等，分別是以 `Ruby`, `Node.js` 及 `Go` 撰寫。其㊥，Jekyll 獲🉐 GitHub 較原生的支援，不過我不甚熟悉；而臺灣🈶️許多人採用 Hexo，因為其存在豐富的㊥文㊮訊、多樣的主題及插件。

然而，Hexo 的致命缺點在於 `Node.js` 作為動態語言其效能實在🈚️法恭維。在偵錯測試的過程當㊥，緩慢的編譯速度著實令人🈚️法忍受。

🉐益於毫秒級的速度，**Hugo** 提供近乎 _WYSIWYG_（所見即所🉐）的體驗。

因此，我們不難發現，網路上不少電神自 Hexo 搬遷或是直接選擇 **Hugo**，包括蛋餅、BB 等。

### Hugo 主題

Hugo 的主題感覺更強大一點，還能提供許多額外的功能。🈶️點選擇障礙的我，起初看上 _Iris_ 主題，不單由於簡潔的版面，也🈶️部分出自於對希臘神話㊥ _Iris_ 諸神的信使之遐想（[Iridescent](https://open.spotify.com/track/69ZEgPX0hxWXJIqkTlYz41?si=m67f1pkEQl2fZbp0w5e_Cw) --- 真是個美麗的詞彙）。而 GitHub 上獲🉐最多 Star 的 _Coder_ 主題卻看似單調且🈚️法修改顏色，另個 _m10c_ 又稍嫌簡陋。

最終，我找到 [Hugo Bootstrap Theme](https://github.com/razonyang/hugo-theme-bootstrap)，不但提供完整的暗色主題、美觀的佈局、多樣的功能，還補足 Hugo 的弱項－搜尋。

### GitHub Pages & GitHub Actions

[![github pages](https://github.com/nevikw39/nevikw39.github.io/actions/workflows/main.yml/badge.svg)](https://github.com/nevikw39/nevikw39.github.io/actions/workflows/main.yml)

GitHub Pages 🉑️以讓 GitHub 上的 repo 某個 branch 的某個㊮料夾當作靜態網頁託管服務。

而 GitHub Actions 的功能更為強大，比如🉑️以在 main branch 被 push 上後自動更新 submodule, 建置網站並發布。

如此，我們🉑️以優雅地分離原始碼如 markdown, config 與結果的 HTML 至不同 branch。

### 免費網域

GitHub Pages 預設🈶️提供 `{{username}}.github.io` 的網域，但這種 subdomain 並不方便進行 Google Analytics 與 SEO 等。

查惹一下 `*.ac`, `.code` 等的價格實在太🉑️怕，窮學生還是乖乖用免費 domain QQ. 我之前是🈶️🈸請過 `.tk` 的網址，但我突然想起 [念誠的 Blog](https://ncchen.cf)，`.cf` 看起來也是很程式嘛 (CodeForces !?)

但我用原本的 Freenom 帳號卻🈚️法註冊 `nevikw39.cf`，索性重辦一個把 `nevikw39.cf`, [nevikw39.tk](https://nevikw39.tk), [nevikw39.ml](https://nevikw39.ml) (Machine Learning !?), [nevikw39.gq](https://nevikw39.gq) （潮到出水欸💦）和 [nevikw39.ga](https://nevikw39.ga) 都註冊走ＸＤ。

---

那麼，我要開始寫 Blog 惹！！
