---
aliases: [nthu-freshman-cc]
author: nevikw39
categories: []
date: 2022-08-04T18:52:09+08:00
description: ""
images: []
key_words: [大一, 新生, 資源, 帳號, gapp, G Suite for Eduaction, Google Workspace for Education Plus, Office 365, TANet roaming, eduroam, TWAREN VPN]
series: [清大新生參考]
tags: [清大]
title: 清大新生參考：資源帳號篇
# featured: true
# toc: false
---

進入大學之後，有著許多豐富的資源提供給學生們，因此如何妥善的利用，也是一門值得研究的學問。以下主要介紹[計中](https://ccc.site.nthu.edu.tw/)的服務：

## Email 帳號

隨著科技發展，email 似乎也變得有些老氣，也許未來或現在的小朋友們甚至都不太認識呢。不過，在大學以及許多工作場合，Email 依然持續扮演著溝通的重要橋梁。教授的公布事項與學校的行政通知，往往都是藉由 email. 我自己覺得 email 比起通訊軟體，因為具備標題及內文等，結構更為具體完整。此外，在魚雁往返的過程中，脈絡也更為清晰。

可是大家入學前想必都有自己的私人 email 惹，為何還要再申請學校 email 呢？？首先，個人的 email 信箱或許可能疏於整理，不利搜尋資料，將私事抽離更有條理；再者，學校信箱的 domain 帶有學校名稱，在處理正事的場合顯得更專業，而且有些服務以學校 email 註冊可以驗證學生身分、享有額外好處；最後，這些帳號往往都有附加服務。以下將介紹計中、Google 及微軟的帳號：

### 計中 mail server (`mx`)

在 Email 普遍商業發展之前，各大學通常早就建置惹自己的 mail server. 時至今日，功能或許相對比較陽春一些，而且不同的協定跟年份導致種種疊層架屋的伺服器們，但還是更可靠有保證，即使畢業後仍然存在，用來申請其他服務比較安心。相關資訊可以參考網路系統組的[網頁](https://net.nthu.edu.tw/netsys/mail:student)。

計中 mail 還可以在申請[宿網](#宿舍網路)時作為驗證；附帶的空間還可以作為 `FTP` 與[個人網頁](https://m110.nthu.edu.tw/~s110062219)，只是現在應該都已經式微惹。剛才才發現 `FTP` 需要校內 IP address [(VPN)](#vpn) 才能登入，畢竟 `FTP` 是明文的，難怪之前都失敗。

#### 使用方式

平常 Webmail 就跟一般 email 差不多，如果要在 Mac / iOS Mail, Android Gmail 收發的話設定細節可以參考這篇[說明](https://net.nthu.edu.tw/netsys/mail:config)，收信應該都是使用 `IMAP` 應該沒什麼人再用 `POP3` 惹，發信的話則是 _SMTPAUTH_ 因為學校所稱的 `SMTP` 必須在校內才能使用。

如果是用 Office Outlook 的話微軟真的是笨到不行，新版 Outlook 一般情況下新增帳戶就算選擇進階選項手動設定還是會一直卡住。必須關掉 Outlook 之後執行 `outlook /manageprofiles` \\(\to\\) 電子郵件帳戶 \\(\to\\) 新增才有傳統完全手動的選項，或是到控制台 \\(\to\\) Mail (Microsoft Outlook) \\(\to\\) 電子郵件帳戶 \\(\to\\) 新增，這裡的手動才能真正的設定一切細節。

#### 設定別名

計中 mail 的地址預設為 `s<學號>@m<入學年度>.nthu.edu.tw`, 可以至校務系統 \\(\to\\) 計通中心相關服務 \\(\to\\) 網路系統組線上服務 \\(\to\\) 信箱服務選單 \\(\to\\) 設定信箱別名，就可以設定比較習慣好記的別名，發信的部分 _SMTPAUTH_ 的設定還是一樣，然後可以修改或新增 email 地址。

### G Suite for Eduaction (Google Apps for Eduaction, `gapp`)

從小，中小學提供的信箱，多半是託管給 Google Apps, 除惹 email 以外，更重要的是其他 Google 服務，比如曾經的Meet 錄影、無限雲端硬碟等等。不過，在 Google 狠狠地養套殺之後，這項服務的未來確實堪憂。我相信學校肯定不吝於編預算花在確切的需求上，關心的同學們記得在每年都會有校園軟體問卷上表達意見。

根據這篇[公告](https://net.nthu.edu.tw/netsys/mailing:announcement:20220609_01)，學校目前提供在校生的 Google 帳號是 **Education Plus**, 最重要的雲端硬碟容量將在兩年內從 \\(5\text{TB}\\) 調降至 \\(20\text{GB}\\).

申請帳號的[流程](https://net.nthu.edu.tw/netsys/gapp)是校務系統 \\(\to\\) 計通中心相關服務 \\(\to\\) 網路系統組線上服務 \\(\to\\) Google Apps 帳號申請，姓名與帳號名稱皆可自行決定，指示日後無法更改。

我最近才知道 `gapp` 還有一個網域別名 `cloud.nthu.edu.tw`, 亦即 `gapp` 皆可以藉由 `<同名>@cloud.nthu.edu.tw` 收發信，具體做法跟信箱別名非常類似。

### Office 365 (`office365`)

學校提供的 Office 365, 雖然也是一個 `<學號>@office365.nthu.edu.tw` 的帳號，但畢竟我真的沒以這個地址收發信過，性質上比較類似授權軟體，因此是由學習科技組負責。當初最早好像是因為需要 Teams 才去[申請](https://learning.site.nthu.edu.tw/p/412-1319-12292.php?Lang=zh-tw)，位置在校務系統 \\(\to\\) 計通中心相關服務 \\(\to\\) 校園授權軟體下載系統，需要校內 IP address [(VPN)](#vpn) \\(\to\\) Office 365 帳號申請，後來才發現原來還有附帶 \\(1\text{TB}\\) OneDrive 跟 [Office 授權](#office)，詳細細節就留待接下來的章節。

學校的 Office 365 帳號還有一個有點意想不到的用處 ---- 稽查別人，因為帳號都是學號跟姓名，而且大部分人因為 Teams 跟 Office 都會申請。以學校的帳號登入 [Outlook People](https://outlook.office.com/people) 之後，如果對方存在帳號的話，就可以學號與姓名雙向互查。

---

資工系計中也有自己的 mail server, 還可以作為工作站帳號，但線上申請的網頁似乎有點問題，聽學長是藉由紙本申請，如果我有空辦的話再作更新。

## 網路服務

接下來要介紹學校所提供的各式網路服務。雖然台灣的行動網路發展日臻成熟，許多同學家中甚至皆不裝設寬頻固網，但能夠使用 Wi-Fi 的場合我還是傾向於盡量使用 Wi-Fi, 畢竟手邊的裝置確實不少，包括手機、iPad 及 MacBook, 在宿舍還有 Mac mini, 行動網路在人潮聚集處免不了不穩定的問題，長期熱點分享也會造成手機過熱、傷害電池等。而清大作為國內頂尖大學之一，網路基礎設施相當發達，更是台灣學術網路 (TANet) 新竹區域網路中心之所在（隔壁交大是聽起來更威的新竹主節點），還可以屬於 \\(140.114.0.0/16\\) 的 `IP` address 上網。

### 校園 Wi-Fi

學校的 Wi-Fi 建置是很普及，但品質常為人詬病，在教育、圖書館與人社院就確實堪憂，台達、資電館一樓也不甚穩定，不過像小吃部就很順暢。

#### 申請方式

詳如[說明](https://www.wlan.nthu.edu.tw/)，在校務系統 \\(\to\\) 計通中心相關服務 \\(\to\\) 網路系統組線上服務 \\(\to\\) 無線區域網路帳號，雖然也會得到一個形如 `s<學號>@wlan.nthu.edu.tw` 的帳號，但應該真的沒有信箱功能，注意密碼比較嚴格，好像需要大小寫數字或符號。

#### Wi-Fi 名稱種類

學校 Wi-Fi 名稱種類個人覺得很複雜，特別是資工系有一堆 SSID 結果訊號還是常常很糟糕。大致的格式可以歸類如下：

> ```
> nthu-<dept>(-peap)(-<2.4|5>G)
> nthupeap
> TANetRoaming
> eduroam
> ```

基本上主要是由計中或負責的院系構成，有時會分成 \\(2.4\text{GHz}, 5\text{GHz}\\), 是否帶有 `peap` 則說明驗證的方式。一般的公共網路本身是沒有加密的，通常利用 captive portal 網頁讓使用者登入。而有惹 **PEAP**, 讓 WPA 也可以藉由帳號密碼等驗證。

我覺得 `nthupeap` 是最方便的 Wi-Fi, 因為既可以於全校園通行無阻，而且 **PEAP** 可以讓作業系統記住密碼自動登入。注意到不論是 Android 或 iOS, 可能在登入時 Certificate 需要選 Not Validate 之類的。

`TANetRoaming` 是台灣學術網路漫遊，讓國內學校師生可以藉由 captive portal 登入其他學校；`eduroam` 則是國際的漫遊，使用的是 **PEAP** 驗證。

### 宿舍網路

清大宿舍的每個床位都有一個網路埠，對映一個屬於 \\(140.114.0.0/16\\) 的固定 `IP` address. 如果有計中 mail 帳號就不必再額外申請宿網帳號，設定的部分比較麻煩，[申請](https://dormnet.nthu.edu.tw/)時就必須綁定 `MAC` _(Media Access Controll_) address, 完成後會得到 static `IP` address, subnet mask, gateway 等資訊。高中寒訓有住過隔壁交大九十舍，他們是用 captive portal 來驗證，好像還是 DHCP, 相對比較彈性跟容易。

雖然似乎有規定每人每日下載至多 \\(6\text{GB}\\), 但其實下載系統更新或遊戲超過好像都沒怎樣。速度的部分我就無法提供什麼心得，因為我的骨灰路由器的有線還是 \\(10/100\text{Mbps}\\).

### VPN

不少服務會限定僅有校內 `IP` address 可以使用，比如 FTP server, 校園授權軟體等等，但假若人在校外呢？？這時就可以連上學校的 VPN. 使用的軟體跟高中參加台大 NPSC 時一樣，是 Pulse Secure SSL VPN, 支援各種電腦與手機的系統。帳號不必額外申請，沿用[校園 Wi-Fi](#校園-wi-fi) 的，伺服器網域則是 `nthu.twaren.net`.

上學期 NTHU Online Judge 好像曾經因為流量不堪負載而一度僅允許來自校內 `IP` address 連線。

## 軟體授權

最後的壓軸就是由學習科技組負責、最具價值的授權軟體們惹，這邊的軟體大部分在下載或驗證時都需要學校的 `IP` address, 如果在校外就需要剛才提到的 [VPN](#vpn).

### Office

學校提供的 Office 有兩種，一種是類似訂閱制的 Office 365, 另一種則是比較像傳統單機版的 KMS. 如果不曉得該選擇哪個的話，我覺得 Office 365 比較簡單一些。

#### Office 365 版

申請的方式如[前揭](#office-365-office365)，事實上學校提供的是 Office 365 教育版 A3 方案，每個使用者可以在五部 PC / Mac 上安裝桌面版 Office 及五部行動裝置上安裝 Office. 安裝的方式建議先解除安裝任何 Office, 特別包括 Windows 內建的 Office 試用版，接著登入 [Office Portal](https://portal.office.com) 後，右方偏上即有安裝 Office 365 App 的選項，下載並執行安裝程式後，登入學校 Office 365 帳號即完成。

#### Office 專業增強版大量授權 (KMS)

這種是歷史比較悠久的授權方式，性質上比較接近一般買斷式的單機版，安裝後會顯示為 LTSC (Long Term Service Channel). 安裝前一樣建議先解除安裝任何 Office, 接著若在校外需要連上學校 [VPN](#vpn), 前往校務系統 \\(\to\\) 校園授權軟體下載系統，下載並執行 Office 2021 (or 2019 / 2016 / 2013 / 2010) 的安裝程式。

Mac 的話只要在安裝後執行一次 VL Serializer 即可。如果是 Windows, 需要再到學習科技組的[網頁](https://learning.site.nthu.edu.tw/p/412-1319-2137.php?Lang=zh-tw)下載版本所對應的 KMS 啟用批次檔，往後每 \\(180\\) 日需要以學校 `IP` address 啟用一次。

我在 Office 2019 LSTC for Mac 有遇到一個問題，就是他不讓我跟其他同學及時共同編輯放在學校 OneDrive 的文件，還要我改用網頁版 Office, 所以我才改安裝 365 版。不過 KMS (Key Management Server) 有個好處就是基本上數量是不限的。

### Windows

這個我目前沒有用過，驗證方法一樣是 KMS 大量授權，但學校特別說明授權只是升級版，需要有隨機版才能升級驗證成功。但據說其實只要安裝試用版就能升級？？如果下學期羅設實驗真的非得用 Windows 不可的話，我會再研究看看。

### Symantec Endpoint Protection

防毒軟體的部分學校有買 Kaspersky 跟 Symantec, 我是裝後者。基本上就是到校務系統 \\(\to\\) 校園授權軟體下載系統，下載並執行安裝程式即可。

---

學校還有其他軟體就部逐一介紹惹，簡單列舉包括一些輸入法、MATLAB, 以及只支援 Windows 的威力導演、華康字型、PhotoImpact, Visual Studio 等等。
