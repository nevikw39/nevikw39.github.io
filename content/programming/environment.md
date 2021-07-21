---
aliases: []
author: nevikw39
categories: [程式💻]
date: 2021-07-16T01:55:05+08:00
description: ""
images: []
key_words: []
series: [C++ 入門]
tags: [C++, VS Code]
title: "[C++ 入門] 0.2 準備開發環境"
# featured: true
# toc: false
---

俗諺云：｢工欲善其事，必先利其器。」在我們正式開始寫程式前，當然也必須先準備好開發的環境。所謂開發環境，指的就是我們撰寫程式中所依賴的一切。

我們開發的既然是命令列程式，自然可以在命令列上開發，比如使用 `vi` 作為編輯器，再手動下 `g++` 指令編譯，但那樣太電惹不適合我們。現代人一般使用整合式開發環境 _(IDE, Integrated Development Enviroment)_, 具備文字編輯、編譯鍵置、執行偵錯、版本控制等功能的圖形化介面。

市面上的 IDE 琳瑯滿目，像是 macOS 專用的 **Xcode**, 以 Java 為主但考 APCS 或 TOI 入營考拿來寫 C++ 也很舒服的 **Eclipse**, 在全國賽搞我的 **Code::Blocks**, LKK 老掉牙的 **Dev-C++**, 以及號稱地表最強 IDE 的 **Visual Studio**. 不過，我最推薦的是 **Visual Studio Code**.

## Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/), 常簡稱 VS Code, 雖然與 Visual Studio 一樣是微軟出品而名子只差惹一個詞，但兩者可謂風馬牛不相及。相比之下，VS Code 是個完全免費、開放原始碼而且輕巧許多的 IDE. 此外，VS Code 也有著活躍的社群與豐富的插件，比如在你的 Discord Status 顯示你正在寫什麼、寫惹多久。

我覺得最實用的功能包括但不限於反白某段 code 再按下各種括弧或引號即可把它包起來、強大的 IntelliSense 可以容易地 Go to Definition, 按下 <kbd>⇧ Shift</kbd> + <kbd>Alt (⌥ Opt)</kbd> + <kbd>F</kbd> 就能輕鬆自動排版得到美觀的程式碼、也可快速地重新命名變數等等，還有許多待你一一發掘，往後我們也會陸續介紹。

接下來就分別說明各平台的安裝流程。

## Linux

如果你用 Linux 應該很電⚡吧，就根據自己 distro 的 package manager 安裝好 `g++`, `gdb`; VS Code 的設定非常簡單，打開一個資料夾、新增一個 `.cpp`，它應該會問你要不要安裝 _C/C++_ 套件, 按下 F5 全部都用預設選項即可，記得 build task 選 `g++`。

## macOS

蘋果的話稍微麻煩一點，可以參考官方的這份[文件](https://code.visualstudio.com/docs/cpp/config-clang-mac)，茲節錄重點如下：

0. 檢查是否有安裝 `clang`, 可以打開 Terminal 並執行以下指令
    ```bash
    xcode-select --install
    ```
1. 在 VS Code 中打開一個資料夾、新增一個 `.cpp`，它應該會問你要不要安裝 _C/C++_ 套件
2. 按下 <kbd>⌘ Cmd</kbd> + <kbd>⇧ Shift</kbd> + <kbd>B</kbd> 進行建置（相當於編譯），選擇 **C/C++ clang++ build active file**. 如果你是 macOS 10.15 Catalina 或以上版本，請在這時開啟的 `tasks.json` 找到 **"tasks": [** 這行後面按下 Enter, 並貼上以下 code:
    ```json
    {
        "label": "Open Terminal",
        "type": "shell",
        "command": "osascript -e 'tell application \"Terminal\"\ndo script \"echo hello\"\nend tell'",
        "problemMatcher": []
    },
    ```
    貼完之後可以按下 <kbd>⇧ Shift</kbd> + <kbd>⌥ Opt</kbd> + <kbd>F</kbd> 自動排版美觀一下。然後點選 _Menu Bar_ 的 _Terminal_ > _Run Tasks..._, 選擇 **Open Terminal**, 這時應該會彈出視窗要求給予權限，允許之後會跳出一個 Terminal.
3. 按下 F5 （記得 Fn 鍵），選擇 **clang++ build and debug active file**, 請在這時開啟的 `launch.json` 找到 **"externalConsole": false,** 並把 _false_ 改為 _true_
4. 大功告成，以後只要按下 F5 即可編譯並偵錯！！

假若搞不太懂或遇到什麼困難，這裡分別是參考的 [tasks.json](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-0-2-0_macos_tasks-json), [launch.json](https://gist.github.com/nevikw39/7cd9f2d7f536e4f78d4d0fcddb0fbb80#file-0-2-1_macos_launch-json).

## Windows

因為 Windows 實在很不方便開發，還好從 Windows 10 開始微軟推出惹 _WSL (Windows Subsystem for Linux)_  這項技術，令 Windows 使用者可以享有以非常接近 native 的方式運行 Linux 的福音，假如你未來還想學習 Python, Go, Java, Node.JS 等語言或是 git 等等，那麼不要猶豫馬上安裝 WSL 吧。

這是微軟官方對於 WSL 安裝的[說明](https://docs.microsoft.com/zh-tw/windows/wsl/install-win10#manual-installation-steps)，因為有機翻中文就不特別說明，至於要選 WSL 1 或 WSL 2 其實都可以，怕麻煩就 WSL 1 簡易許多，反正以後還可以改，在 Microsoft Store 如果不知道要裝哪種 Linux Distro 就選 Ubuntu 吧。第一次開啟後輸入 Linux 專用的帳號與密碼，等待作業系統安裝完成首先執行以下指令：
```bash
sudo apt update
sudo apt upgrade
sudo apt install g++ gdb
```
會要你輸入剛才設定的 Linux 專用密碼。接著參照這篇[文章](https://code.visualstudio.com/docs/cpp/config-wsl)，之後就跟上面 Linux 的步驟差不多，打開 Windows 的 VS Code, 安裝 **Remote - WSL** 套件，開啟一個資料夾、新增一個 `.cpp`，它應該會問你要不要安裝 _C/C++_ 套件, 按下 F5 全部都用預設選項即可，記得 build task 選 `g++`。

---

如有遇到任何困難或問題，歡迎在底下留言或透過底下聯繫方式私訊喔 o'_'o
