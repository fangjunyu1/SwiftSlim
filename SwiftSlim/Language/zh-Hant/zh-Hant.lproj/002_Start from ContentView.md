# 從 ContentView 開始

## 課前準備

本節課，我們將從 ContentView.swift 文件開始，系統性的認識 SwiftUI 基本結構，包括：

- 注釋
- View 結構
- VStack / HStack / ZStack 佈局
- SF Symbols 圖示
- 視圖修飾符（modifier）
- 預覽程式碼 #Preview

首先，找到之前創建的 Xcode 項目，雙擊 .xcodeproj 文件。

在左側 Navigator 導航區域選擇 ContentView.swift 文件。

注意：每次打開項目時，Canvas 可能顯示 "Preview paused"。點擊刷新按鈕即可恢復預覽。

![Swift](../../RESOURCE/002_view7.png)

## 認識 ContentView

ContentView 程式碼：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

雖然程式碼比較少，但是包含了 SwiftUI 的核心結構。

### 1. 注釋

文件頂部：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

這是文件注釋，用於記錄文件資訊，其中包含文件名稱、項目名稱、創建人和創建時間。

Swift 中使用 // 進行單行注釋：

```swift
// 這是注釋
```

注釋可以提高程式碼可讀性，幫助開發者理解程式碼邏輯。

在實際開發中，程式碼可能晦澀難懂。如果不寫注釋，就會遇到三天後，看不懂自己程式碼的情況。

因此，在編寫程式碼的過程中主動添加註釋，是一個良好的開發習慣。利用注釋記錄程式碼邏輯，方便後續的程式碼維護。

**臨時屏蔽程式碼**

注釋還可以臨時屏蔽程式碼，幫助我們排查問題。

例如：

```
A
B
C
```

A、B、C 是三段程式碼，其中有一段程式碼出錯了，我們可以臨時注釋程式碼進行排查。

先給 A 添加註釋：

```
// A
B
C
```

如果注釋掉 A 後，程式碼恢復正常，說明 A 程式碼存在問題。

如果 A 注釋掉後，仍然存在問題，我們可以再把 B 注釋掉，以此類推，直到找出問題程式碼。

在開發過程中會遇到很多問題，我們大多需要通過注釋程式碼排查問題原因，這可以幫助我們定位問題程式碼，找到 BUG。

在 Xcode 中，可以使用快捷鍵：

```
Command ⌘ + /
```

快速添加或者刪除注釋。

### 2. 導入 SwiftUI 框架

```swift
import SwiftUI
```

這段程式碼表示導入 SwiftUI 框架。

SwiftUI 中的 View、 Text、 Image、 VStack 等類型，都來自該框架。

如果不導入 SwiftUI 框架，Xcode 就會報錯：

```
Cannot find type 'View' in scope
```

說明編譯器無法識別 View 類型。

### 3. View 結構

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

第一次見到這個 View 結構，可能會感到陌生，因為它包含了 struct、View、var、body、some 等關鍵字。

我們現在還沒有學習這些關鍵字，只需要知道這段程式碼的含義是，創建了一個名為 ContentView 的 View 視圖。

你可以把 View 理解為一個畫板，我們可以在上面進行繪畫，繪畫的工具就是 SwiftUI。

例如：

![Swift](../../RESOURCE/002_view.png)

上圖顯示的是三個頁面，實際上就是三個 View。

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

當我們使用 SwiftUI 開發的 App 時，每個頁面都是一個 View。

### 4. SwiftUI 程式碼

在 View 視圖內，顯示 SwiftUI 程式碼：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

這段 SwiftUI 程式碼表示，這是一個垂直佈局，顯示一個圖示和一個文本。

![Swift](../../RESOURCE/002_view1.png)

#### VStack 佈局

```swift
VStack { }  // 垂直佈局
```

VStack 表示垂直佈局容器。內部視圖從上到下排列。

![Swift](../../RESOURCE/002_view8.png)

SwiftUI 常見三種佈局：

- VStack —— 垂直排序
- HStack —— 水平排序
- ZStack —— 疊加排序（Z軸）

```swift
HStack { }  // 水平排序
ZStack { }  // 疊加排序
```

各佈局的排序示意圖：

![Swift](../../RESOURCE/002_view2.png)

例如：使用 HStack 進行水平排序。

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

可以看到，地球圖示和文字被橫向展示。

![Swift](../../RESOURCE/002_view3.png)

當我們想要橫向排序時，使用 HStack。當需要疊加排序時，使用 ZStack。

#### Image 與 SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

這段程式碼顯示一個地球圖示，地球圖示來自 Apple 的 SF Symbols 圖示系統。

![Swift](../../RESOURCE/002_view9.png)

程式碼的含義為顯示一個地球圖示，大尺寸，顏色為強調色。

我們除了可以顯示地球圖示，還可以顯示其他圖示。

例如，顯示一個背包：

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**如何顯示其他圖示呢？**

我們需要使用 Apple 官方提供的系統圖示庫 SF Symbols。

打開 Apple Developer 官方網站，下載 [SF Symbols](https://developer.apple.com/sf-symbols/)。

![Swift](../../RESOURCE/002_sf.png)

打開 SF Symbols App。

![Swift](../../RESOURCE/002_sf1.png)

左側為符號分類，右側為對應的圖示。

右擊圖示選擇"拷貝1個名稱"，名稱為對應的字串內容。

例如：

```
"globe"
"backpack"
"heart"
```

將拷貝的圖示名稱，放入 Image(systemName:) 中，就可以顯示不同的圖示。

注意：每個 SF Symbols 圖示都有最低支持系統版本。如果系統版本過低，圖示可能無法顯示。需在 SF Symbols App 中查看其兼容性資訊。

#### 修飾符

在 SwiftUI 中，修飾符（modifier）是一種用於改變視圖外觀或行為的方法。

可以將修飾符理解為衣服，穿著不同的衣服，展示的樣貌也就不同。

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale 和 foregroundStyle 就是 Image 視圖的修飾符，在不改變 Image 內容的情況下，修飾 Image 視圖。

**1. imageScale**

```swift
.imageScale(.large)
```

它可以控制 SF Symbols 圖示大小：

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

我們可以修改不同的選項，讓 SF Symbols 符號顯示不同的大小。

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle 可以控制前景色。

.tint 表示當前環境的強調色（accent color），預設情況下 iOS 為藍色。

如果我們想要修改前景色為紅色：

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text 視圖

Text 是文本視圖，用於顯示字串。

```swift
Text("Hello, world!")
```

例如，顯示我的名字：

```swift
Text("FangJunyu")
```

注意：字串必須使用 "" 雙引號包裹。

你可以嘗試顯示你的名字、電話號碼等內容。

#### padding 邊距

在 SwiftUI 中，padding 用於在視圖內容與邊界之間增加空白區域，它屬於“內邊距（padding / content inset）”。

```swift
HStack {
    ...
}
.padding()
```

上述程式碼表示為 HStack 視圖添加系統預設邊距。

**什麼是 padding？**

padding 表示"視圖內容與其邊界之間的留白區域"。

在下圖中，藍色的 HStack 設置 padding 後，藍色區域會向內收縮，看上去會"變小一圈"。

![Swift](../../RESOURCE/002_view6.png)

**預設邊距**

padding() 修飾符預設使用系統推薦的標準間距。

```swift
.padding()
```

在不同的平台和上下文中，這個值會有所不同，例如：

- iOS 通常約為 16 pt。
- 在 macOS 或 watchOS 上，系統的標準間距可能會不同，通常會更大或更小，具體取決於各平台的設計規範。

**自定義邊距**

還可以為視圖設置單獨的邊距。

1. 設置單個方向

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

方向說明：

- .top:上邊距
- .bottom:下邊距
- .leading: 前側邊距
- .trailing: 後側邊距

![Swift](../../RESOURCE/002_view12.png)

注意：leading 和 trailing 會根據語言方向自動適配。例如在阿拉伯語（RTL）環境中會自動翻轉。

2. 設置多個方向

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

可以通過數組同時指定多個方向。數組的具體用法會在後續教程中詳細講解，這裡只需瞭解這種寫法即可。

3. 設置水平方向或垂直方向

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

等價於：

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**移除邊距**

如果不想要任何邊距，可以使用 .padding(0) 來移除：

```swift
.padding(0)
```

或者直接刪除 padding 修飾符：

```swift
// .padding()
```

### 6. Preview 預覽程式碼

```swift
#Preview {
    ContentView()
}
```

這段程式碼表示在 Canvas 中生成 ContentView 視圖預覽。

注意：#Preview 是 Swift 5.9 / Xcode 15 引入的新語法，在此之前，使用的是 PreviewProvider 結構。

**注釋掉 Preview 會發生什麼？**

如果注釋掉 Preview：

```swift
// #Preview {
//    ContentView()
// }
```

Canvas 將不再顯示可渲染內容。

![Swift](../../RESOURCE/002_xcode.png)

這是 #Preview 控制 Canvas 顯示預覽視圖。

當我們需要在 Xcode 中預覽 SwiftUI 視圖時，添加 #Preview 預覽程式碼。如果不需要預覽視圖，可以將 #Preview 預覽程式碼注釋或刪除掉。

## 總結

雖然 ContentView.swift 文件程式碼不多，但實際上涵蓋了 SwiftUI 的多個核心概念。對於初學者來講，這段程式碼可能顯得陌生，但通過拆解程式碼結構，可以建立起 SwiftUI 的初步認識。

回顧本節課的內容，我們首先學習了注釋 //，可以使用注釋說明程式碼邏輯或者臨時屏蔽程式碼。

接著，我們瞭解到 SwiftUI 文件必須導入 SwiftUI 框架：

```swift
import SwiftUI
```

如果不導入框架，編譯器將無法識別 View 等類型。

然後，我們認識了 SwiftUI 視圖的基本結構：

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

其中 ContentView 是視圖名稱。

我們還學習了三種常見佈局容器：VStack（垂直排序）、HStack（水平排序） 和 ZStack（疊加排序）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

在這段程式碼中表示，顯示一個垂直排序容器，容器內部顯示一個圖示和一個文本。

Image 可以顯示 SF Symbols 圖示，通過修飾符控製圖示的大小和顏色。

Text 視圖可以顯示文本內容。

padding 是邊距，在視圖的周圍增加一個透明空間。

最後是 #Preview 預覽視圖，可以在 Canvas 中顯示預覽視圖。

### 課後練習

對於初學者來講，本節課的內容可能比較複雜。我們可以通過進一步的練習，加深本節課學習知識的理解：

- 修改 SF Symbols 圖示名稱
- 修改圖示的前景色為黑色
- 將 VStack 改為 HStack
- 注釋 Image 或 Text，觀察預覽視圖變化

### 彩蛋：程式碼補全（Code Completion）

在輸入程式碼時，細心的你可能已經注意到，Xcode 會自動顯示可用選項列表。

例如，當我們修改 imageScale 修飾符時：

```swift
.imageScale(.)
```

Xcode 就會顯示可用的選項：

![Swift](../../RESOURCE/002_view10.png)

這屬於程式碼補全機制（Code Completion），它是基於類型推斷和枚舉成員提示，可以提高輸入效率並減少錯誤。

在後續課程中，我們會正式介紹枚舉（enum），現在僅作一個簡單的瞭解。
