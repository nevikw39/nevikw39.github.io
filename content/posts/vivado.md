---
aliases: []
author: nevikw39
categories: []
date: 2023-01-19T19:38:58+08:00
description: ""
images: [images/vivado-on-m1.png]
key_words: [清大, 資工, 邏輯設計實驗, 邏設實驗, 邏實, Xilinx, FPGA, Basys 3]
series: [大學]
tags: []
title: Vivado on Mac
# featured: true
# toc: false
---

大二上的必修課邏輯設計實驗需要寫 Verilog codes 實際燒錄至 FPGA 板 Basys 3 上，以 switches, buttons 等輸入、LEDs, 7-segment displays 等輸出。這其實還滿酷的，但需要使用 Xilinx 的 Vivado 這套臃腫肥大 (\\(40\text{ GiB}\\) :arrow_up:) 的 IDE (? 來 synthesis, implement 我們的 Verilog modules 並 generate bitstream.

不幸的是，Vivado 只有 Linux 以及 Windows 版。據我觀察，系上使用 Mac 的同學與教授其實不在少數。我不太曉得其他同學是怎麼處理這個問題的，似乎有些人是直接多準備一台 Windows 電腦，但我手邊已經兩台 Mac 惹。我是從暑假就開始煩惱，但直到快開學才開始請教學長、動手研究。現在的 Mac 還有分 Intel 與 Apple Silicon (M-Series CPUs), 讓問題更進一步複雜化。我自己是有一台 Intel MacBook Pro 與一部 M1 Mac mini.

Xilinx 已經被 AMD 併購，下載安裝檔必須註冊 AMD 帳號並同意一些規範，比如不能把軟體提供給被美國、聯合國制裁的實體像是北韓、伊朗等。但是我一直不能下載，只好跟學長拿 \\(20\text{ GiB}\\) 的 Univesal Installer. 要注意的是通常建議不要安裝最新的，可能會有一些奇奇怪怪的問題。

以下就簡單分享幾個不同的解決方案：

## PC Rooms

這是來亂的，每週作業都去資電三樓奮鬥肯定是不可能，而且三間電腦教室的 Vivado 版本都不太一樣，project 是不能互通的。

## Dual Boot

以 Mac 來說，雙系統並不是很好的選擇，不論 Apple Silicon 是否能裝 Arm 的 Linux 或 Windows, Vivado 本身都不支援 Arm. 而 Intel 同樣不容易，Touch Bar 的 T2 晶片非常棘手。我對硬體不守也不敢冒險，所以最終是沒有嘗試這個選項。

## Virtual Machine

這應該是最簡單的方法，不過依然只適用於 Intel, 因為 Arm 虛擬化技術並不成熟更不太能 x86. 基本上網路上都同意 Vivado 在 Linux 普遍比 Windows 快一些，而且 Linux 本身通常也比 Windows 順，~~總之我們 Mac users 就是應該有骨氣拒絕萬惡微軟 Windows.~~

一開始我是在 Intel MBP 裝 Ubuntu 22.04 minimal, 要再 `apt install libtinfo5` 才能執行。但第二次作業 synthesis 一次超過十分鐘真的受不了，而且 4 cores 8 threads 的 MBP 風扇轉不停的慘叫聲真的令我於心不忍。

> 對於 Apple Silicon, Parallels Desktop 可以執行 Windows for Arm. 雖然 Windows for Arm 宣稱可以支援大部分 x86 程式，Google 後看起來 Vivado 還是會有許多問題……

## Docker (*)

這個也是在暑假末試的。新版 Docker for Apple Silicon 支援以 QEMU 模擬 x86, 但安裝檔實在太大，導致製作 image 失敗非常多次。利用設定 `DISPLAY` 環境變數，我們可以再搭配 X11 Forwarding 在 macOS 打開 GUI. 注意 XQuartz 的 Preference 中 Security 必須 Allow connections from network clients.

{{< figure src="/images/vivado-on-m1.png" width="100%" title="Vivado on M1 Mac mini via Docker" >}}

但實際上模擬的效能實在是偏悲劇，最後還是沒有採用。我沒有試 Docker on Intel Mac 原因是我的 MBP 的硬碟已經都是 VM 的形狀惹＝＝我想 Docker 應該不會比 VM 差，但不想冒險賭就是惹。此外，Docker 還會有另個問題，就是如何。一般正常的情況下可以直接以 USB 線 program, VM 通常可以把 host 的 USB port 分享進去。Docker 就麻煩惹，我本來想利用 USB-over-IP, 但 Alpine 似乎缺惹一些關鍵的 kernel modules, 若有興趣可以自行深入研究。

當然這個問題下一個方案 [Remote](#remote) 也會遇到，我們可以用別的方法迴避掉，將 bitstream 複製到 host 跟隨身碟，然後將 FPGA 板改為由隨身碟 program 即可。

如果有需要的話 Dockerfile 放在 [Gist](https://gist.github.com/nevikw39/68f4567b48ba24fe3363d47b178b0417), Docker Hub [repo](https://hub.docker.com/r/nevikw39/vivado-patched) 在此，可以執行 `docker pull nevikw39/vivado-patched` 來獲得 image.

## Remote

我自己最後都是採用這個方法，不論 Intel 或 Apple Silicon 都行，前提是須要有一台遠端的電腦（工作站／伺服器）。在遠端安裝完 Vivado 後，Linux 就是 `ssh` 進去搭配 X11 Forwarding; 如果是 Windows 則以 Microsoft Remote Desktop 連線。

原本我是想將 Docker image 轉成 Singularity 在國網的台灣杉三號上面跑 Vivado, 但可能是由於 image 太大 SIF 一直 build 不出來，我把 `/tmp` 解壓縮出來的檔案直接複製出來竟然能夠順利執行 Vivado!!

將 bitstream 燒到板子上的問題，如果有權限也許可以研究 USB-over-IP, 我也有試過 USB-over-SSH, 以 `socat` 將 USB port 轉為 local 的 IP port, 再以 `ssh` forward local port, 最後再次以 `socat` 在 remote 將 IP port 轉為 Unix file, 但還是失敗惹。因此最終我都是 generate bitstream 完乖乖 `scp` 到隨身碟再插上板子。

其實 Vivado 的 Linux 版設計上是有考量超級電腦的，synthesis, implement & generate 時都可以選擇將 jobs 藉由 PBS, Slurm 等排程系統 submit, 只是我們的作業也沒有到那麼複雜喇，但剛好我們國網盃獲獎的時數不知道怎麼用，[線代](https://github.com/nevikw39/LinAlg)、[計網概作業](https://github.com/nevikw39/Intro2CompNetworks)也都拿到台灣杉三號上面跑。

{{< alert " 實際上有時 Vivado for Linux 會突然 crashed 掉，雖然我不確定到底是誰的什麼問題，但建議每次 simulate 完都要右鍵 reset simulation!!" warning >}}

我還有試過其他毒瘤且極不推薦的做法。Vivado 本身的 hardware server 是可以跨 hosts 的，所以我把板子接到 MBP 並在 VM 開啟 Vivado 及 HW server, `ssh` 至台灣杉三號並 forward port, 接著再遠端開啟台灣杉三號的 Vivado（此時使用另一台電腦非必要）synthesis, implement & generate 後，就可以藉由 SSH tunnel 將 bitstream 在 VM 上 program 到板子。 

{{< figure src="/images/vivado.JPG" width="100%" title="" >}}

---

其實，李濬屹教授的作業都是分組，而且每次都只有一兩個必須真的燒到板子上，其餘就像[邏設作業](https://github.com/nevikw39/LogicDesign)在 CAD server 上面以 Cadence 的 tools 跑即可。因此，假若能與隊友協調好的話，也許整學期都不用 Vivado 也不是不可能，但最後兩次作業 FPGA 板就佔比較重，而且期中、期末考還是逃不掉。隔壁班黃稚存教授前幾次都是個人作業，而且幾乎都是要燒板子。

希望我這篇文章能對需要跑 Vivado 的 Mac users 有幫助，如果有問題也歡迎跟我聊聊。
