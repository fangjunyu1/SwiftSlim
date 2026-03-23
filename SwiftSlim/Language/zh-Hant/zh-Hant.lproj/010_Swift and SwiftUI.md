# Swift 和 SwiftUI

在學習 Apple 平台開發時，許多教程傾向於將 Swift 和 SwiftUI 分開講解，這容易讓初學者產生割裂感，誤以為它們是兩門完全獨立的技術。

實際上，Swift 和 SwiftUI 是深度融合的整體：Swift 是程式語言，負責提供邏輯和資料；SwiftUI 則是基於 Swift 構建的使用者界面框架，負責視圖的渲染和互動。

本節課將幫助你建立一個清晰的認知框架：什麼是 Swift，什麼是 SwiftUI，以及它們如何在程式碼中相互協作。

## 什麼是 Swift?

Swift 是蘋果公司推出的一種現代化的程式語言，它用於開發 iOS、macOS、watchOS 和 tvOS 等平台上的應用程式。

![swift](../../RESOURCE/010_swift.png)

Swift 是一種強類型、靜態語言，設計上更注重安全性，減少了很多常見的程式設計錯誤（比如空指標、越界等），支持與 C 和 Objective-C 進行無縫集成。

在實際開發中，Swift 更多的是負責應用的邏輯部分，比如資料處理、網路請求、存儲操作等。

## 什麼是 SwiftUI？

SwiftUI 是蘋果公司於 2019 年推出的一種新的界面構建框架。SwiftUI 採用了聲明式程式設計模式，允許開發者用更簡潔的程式碼來描述界面結構和互動行為。

![swiftui](../../RESOURCE/010_swiftui.png)

聲明式程式設計意味著開發者只需告訴系統希望顯示什麼，系統會根據資料的變化自動刷新視圖。而不再需要手動更新界面狀態，這大大簡化了 UI 開發的複雜性。

SwiftUI 的核心是視圖組件（如 Text、Image、Button 等）和佈局容器（如 VStack、HStack、ZStack）。這些組件通過資料綁定和狀態管理來進行互動，使得界面能夠響應資料變化並自動刷新。

## Swift 和 SwiftUI 如何協作？

Swift 和 SwiftUI 的職責可以總結為以下幾點：

**1. Swift：處理邏輯和資料**

Swift 主要用於管理資料、存儲狀態和執行邏輯，這些程式碼通常不直接影響界面的渲染，而是負責資料和行為的處理。

例如，在 Swift 中處理資料：

```swift
let markdown = try? String(contentsOf: url)
```

這些程式碼涉及到變數聲明、常量定義、函式、控制流等，不直接影響視圖的展示。

**2. SwiftUI：聲明和渲染界面**

SwiftUI 則用於構建使用者界面的佈局和內容，主要負責渲染界面和視圖互動。

例如，使用 SwiftUI 創建一個文本視圖：

```swift
Text("SwiftSlim")
```

這些都是用於構建和控制界面元素的程式碼，直接與使用者界面互動。

### 基礎示例

下面是一個簡單的 SwiftUI 示例：

```swift
// ContentView.swift

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

在這個示例中：

**SwiftUI 程式碼**：VStack、Image、Text、padding 都屬於 SwiftUI，負責界面的展示和佈局。

**Swift 程式碼**：文件頂部的 // 注釋和 import SwiftUI 屬於 Swift 程式碼結構；底部的 #Preview 是用於 Xcode 預覽的宏，不參與實際界面渲染。

### 進階示例

在實際項目中，Swift 和 SwiftUI 經常混合使用，以完成各自擅長的任務：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

在這個例子中：

**SwiftUI 程式碼**：@State 是 SwiftUI 特有的屬性包裝器，用於聲明視圖的可變狀態；Button 和 Text 是 SwiftUI 視圖組件，負責界面顯示和使用者互動。

**Swift 程式碼**：private var name 和 func printName() 是 Swift 程式碼，用於存儲資料和執行邏輯，不直接影響視圖渲染。

當使用者點擊按鈕時，SwiftUI 會觸發按鈕中的操作程式碼：

```swift
Button("Print") {
    printName()
}
```

其中，Button 是 SwiftUI 組件，而執行的 printName() 函式則是 Swift 程式碼，負責具體的邏輯處理。

這種協作使得 Swift 和 SwiftUI 可以無縫結合，Swift 負責資料和邏輯處理，SwiftUI 負責使用者界面的展示。

## Swift 和 SwiftUI 程式碼通常寫在什麼位置？

在 SwiftUI 中，界面是通過 body 屬性返回的視圖構建的。因此，所有用於描述界面的程式碼通常都寫在 body 中。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

在這個例子中，Text 是 SwiftUI 視圖組件，因此必須寫在 body 中，因為 SwiftUI 會通過 body 讀取並生成界面。

與界面無關的程式碼，例如變數、函式或資料處理邏輯，通常寫在 body 外。例如：

```swift
struct ContentView: View {

    // Swift：資料或邏輯
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：界面
    var body: some View {
        Text(name)
    }
}
```

需要注意的是，body 中仍然可以使用 Swift 語法，例如 if、for 等控制流語句，它們只是用來控制 SwiftUI 視圖的生成：

```
if isLogin {
    Text("Welcome")
}
```

因此，在 SwiftUI 開發中可以簡單理解為：視圖程式碼（Text、Image、Button 等）通常寫在 body 中；資料和邏輯程式碼（變數、函式等）通常寫在 body 外。

## Swift 文件

隨著學習的深入，我們還會接觸到 MVVM 架構，其中 ViewModel 和 Model 層通常由純 Swift 程式碼構成，與視圖層（SwiftUI）完全分離。

例如，用於管理應用狀態的類：

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

或者描述資料結構的結構體：

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

這類文件的職責是管理和持久化資料，不直接顯示在視圖中，因此完全屬於 Swift。

## 歷史背景

理解 Swift 與 SwiftUI 的關係，還需要瞭解 Apple 開發技術的演變歷程。截至 2026 年，這一技術棧經歷了多次迭代。

### Swift 的歷史

在 Swift 出現之前，Objective-C 是 Apple 平台的主要程式語言，支持與 C 語言混編。其語法較為冗長，對初學者而言門檻較高：

```Obj-c
// Objective-C 的寫法
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 年，Apple 在 WWDC 上發佈了 Swift 語言。Swift 語法更現代、類型安全性更高，並逐步取代 Objective-C 成為主流開發語言：

```swift
// Swift 的寫法
let name = "Fang"
print("Hello, \(name)")
```

但是，Objective-C 並未就此退出歷史舞台，它在許多存量項目和底層框架中仍然被廣泛使用。瞭解其基本語法，對於維護老舊項目和理解系統底層仍有價值。

### SwiftUI 的歷史

在 SwiftUI 出現前，iOS 使用 **UIKit**，macOS 使用 **AppKit**。這兩套框架採用"命令式"程式設計方式。開發者需要通過 Storyboard 拖拽控件或手動編寫程式碼來控制視圖狀態，程式碼量大、維護成本高，在界面邏輯複雜時尤為突出。

![storyboard](../../RESOURCE/010_xcode.png)

2019 年，Apple 在 WWDC 上正式發佈 SwiftUI。SwiftUI 引入了"聲明式"程式設計範式，大幅簡化了 UI 開發流程。

![storyboard](../../RESOURCE/010_xcode1.png)

值得注意的是，SwiftUI 並非完全獨立的底層實現。在各平台上，它本質上是對 UIKit（iOS）或 AppKit（macOS）進行橋接和協作，底層仍然依賴這兩個框架運行。

### Swift 與 UIKit/AppKit 的關係

雖然 Swift 是一種通用程式語言，能在 Apple 各平台上運行，但它並不能完全替代 UIKit 或 AppKit。對於一些複雜的界面需求，或者 SwiftUI 尚未覆蓋的功能點，仍然需要借助 UIKit 或 AppKit 來實現。

例如，UIKit 在處理複雜的視圖控制器管理、動畫效果、手勢識別等方面已經非常成熟，積累了大量的生產實踐驗證。而 SwiftUI 在這些方面的能力雖然持續增強，但在某些邊緣場景中仍存在局限。

因此，許多開發者會在項目中混合使用 SwiftUI 與 UIKit（或 AppKit），充分發揮兩者各自的優勢。

從這個角度理解，可以將 SwiftUI 視為對 UIKit / AppKit 的一種高級封裝。學習 SwiftUI 的同時，適當瞭解 UIKit 和 AppKit 的基本概念，有助於在維護老舊項目或實現複雜功能時做出更合理的技術決策。

## 總結

**Swift**：主要用於編寫邏輯、資料處理、控制流等，與視圖佈局無關。

**SwiftUI**：用於聲明式地構建使用者界面，視圖內容和佈局的程式碼屬於 SwiftUI。

實際開發中，Swift 和 SwiftUI 通常是結合使用的，Swift 處理邏輯，SwiftUI 處理界面。

從 Objective-C 和 UIKit 到 Swift 和 SwiftUI，Apple 的開發環境逐漸轉向更現代、簡潔的程式設計方式，但 UIKit 和 AppKit 在許多傳統項目中依然不可忽視。

通過理解 Swift 和 SwiftUI 的關係，我們可以更加高效地進行 iOS/macOS 開發，也能在維護老舊項目時，做出更加合理的技術選擇。