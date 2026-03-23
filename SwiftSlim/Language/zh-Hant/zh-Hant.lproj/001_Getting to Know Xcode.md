# 認識 Xcode

## 什麼是 Xcode

Xcode 是 Apple 官方提供的集成開發環境（IDE, Integrated Development Environment），用於開發 iOS、macOS、watchOS、tvOS 等 Apple 平台應用。

![Swift](../../RESOURCE/001_xcode.png)

在整個教學過程中，我們都將使用 Xcode 編寫程式碼、運行程式。

本節課，我們將學習如何下載 Xcode，創建第一個 iOS 應用，以及初步認識 Xcode 界面結構。

## 下載 Xcode

Xcode 目前有兩種安裝方式：

1、通過 [Mac App Store](../../RESOURCE/https://apps.apple.com/cn/app/xcode/id497799835?mt=12) 下載

2、通過 [Apple Developer 官方網站](../../RESOURCE/https://developer.apple.com/xcode/)下載

兩種方式都可以下載 Xcode。區別在於 Apple Developer 官方網站除了正式版，還可以下載 [Beta](../../RESOURCE/https://developer.apple.com/download/all/?q=Xcode) 版或歷史版本。

如果只是學習開發，建議使用正式版。Beta 版本主要用於測試新功能，可能存在不穩定情況。

## 創建第一個項目

打開 Xcode 後，會看到啓動界面。

![Swift](../../RESOURCE/001_xcode1.png)

左側包含三個常用選項：

- Create New Project —— 創建新項目  
- Clone Git Repository —— 克隆 Git 倉庫  
- Open Existing Project —— 打開已有項目

右側顯示最近打開的 Xcode 項目。

我們選擇 "Create New Project" 選項。

### 選擇項目模板

![Swift](../../RESOURCE/001_xcode2.png)

進入項目模板選擇界面，這裡顯示多個平台（iOS、macOS等）以及不同類型的項目模板。

常見模板說明：
- App —— 最基礎的應用類型（推薦）
- Document App —— 基於文件模式的應用
- Game —— 用於遊戲開發
- Framework —— 可復用模塊

在入門階段，我們只選擇 "iOS" - "App" 模板，因為這是界面應用類型。

點擊 "Next"。

### 填寫項目資訊

進入項目資訊填寫界面，我們需要根據字段類型進行填寫。

![Swift](../../RESOURCE/001_xcode3.png)

各字段的含義：

- Product Name —— 項目名稱，例如：SwiftSlimTest
- Team —— 開發者團隊，如果沒有付費 Apple Developer 賬號，可以不選
- Organization Identifier —— 組織標識符，通常採用反向域名格式，例如：
  - com.yourname
  - com.yourcompany
  - 如果沒有域名，可以使用自己的英文名作為標識
- Bundle Identifier —— 應用的唯一標識符，它會根據 Organization Identifier 和 Product Name 自動生成
- Interface —— 界面技術，選擇 SwiftUI
- Language —— 開發語言，選擇 Swift
- Testing System —— 預設會創建測試目標（Unit Tests），初學階段忽略
- Storage —— 本地資料持久化框架，可自動集成 SwiftData 或 Core Data，初學階段忽略

填寫完成後，點擊 "Next"。

### 保存項目

![Swift](../../RESOURCE/001_xcode4.png)

選擇一個合適的文件夾保存。

點擊 "Create" 按鈕，Xcode 會自動生成項目結構。

## Xcode 項目結構

保存 Xcode 項目後，在 Finder 中可以看到生成的項目文件夾。

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— 用於存放圖片、App 圖示等資源的文件夾

- ContentView.swift —— 預設生成的 SwiftUI 視圖文件，我們後續將在這裡編寫界面程式碼。

- SwiftSlimTestApp.swift —— 應用入口文件（App Entry Point），負責啓動應用，我們暫時不需要瞭解它。

- SwiftSlimTest.xcodeproj —— Xcode 項目文件，雙擊該文件即可打開項目。

## 認識 Xcode 界面

雙擊 .xcodeproj 文件打開項目，在左側 Navigator 區域選擇 ContentView.swift 文件。

Xcode 界面主要由五個區域組成：

- Navigator —— 導航區域，用於查看文件結構、搜索
- Editor —— 編輯區域，用於編寫 Swift 或 SwiftUI 程式碼
- Canvas —— 畫布區域，用於 SwiftUI 預覽
- Inspector —— 屬性檢查區域，用於查看和修改文件的屬性
- Debug Area —— 調試區域，查看日誌輸出

![Swift](../../RESOURCE/001_xcode6.png)

注意：Canvas 主要用於 SwiftUI 視圖預覽，從 Xcode 官方架構來講，它是 Editor 的輔助預覽面板（Preview Pane）。只有在打開 SwiftUI 視圖文件時，才可以啓用 Canvas，其他類型文件不會顯示預覽功能。

在後面的課程中，我們主要在 Editor 區域編寫 Swift 和 SwiftUI 程式碼。

第一次打開 Xcode 項目時，Inspector 和 Debug Area 預設可能是隱藏狀態，可以點擊右上角和右下角按鈕顯示。

![Swift](../../RESOURCE/001_xcode7.png)

提示：Inspector 區域主要用於查看和修改文件屬性。在實際開發中，通常會隱藏該區域，以獲得更大的編輯空間。

## 總結

本節課，我們學習了如何下載 Xcode，創建第一個 Xcode 項目，以及基本的 Xcode 界面佈局。

下面是自由活動時間：
- 你可以嘗試在 Navigator 區域創建、刪除文件。  
- 查看 Editor 區域的程式碼，觀察程式碼結構。
- 查看 Canvas 區域的按鈕，嘗試放大、縮小預覽視圖。

下一節課，我們將開始寫一些簡單的程式碼，並幫助我們進一步瞭解 Xcode。  