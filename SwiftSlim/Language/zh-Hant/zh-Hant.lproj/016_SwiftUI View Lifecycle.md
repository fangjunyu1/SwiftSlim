# SwiftUI 視圖生命週期

在上一節中，我們瞭解到 @State 變數會跟隨視圖的生命週期，我們還學習了 onAppear 的基本用法。

本節課，我們將進一步理解 SwiftUI 視圖的生命週期，瞭解視圖如何被創建和顯示、以及視圖中的變數如何被創建和重建，還將學習 onAppear、onDisappear 以及 init 構造函式。

根據這些知識，我們將建立對 SwiftUI 視圖整個構建過程的整體認知。

## 應用啓動順序

創建 iOS 項目時，Xcode 會預設生成兩個文件：

```
ContentView.swift
項目名 + App.swift
```

其中，“項目名 + App”.swift 是整個應用的入口文件。

例如：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 程式碼執行流程

當我們運行 App（模擬器或真機）時，系統會查找 @main 關鍵字：

```swift
@main
struct SwiftSlimTestApp: App {...}
```

確認入口文件後，開始執行程式碼。

首先進入 App 結構體，執行 body 內的程式碼，然後創建 WindowGroup 並載入其中的 ContentView。

### WindowGroup 的作用

WindowGroup 用於管理窗口：

```swift
WindowGroup {
    ContentView()
}
```

在 iPad / macOS 系統支持多窗口，iPhone 通常只有一個窗口。

所以，WindowGroup 在 iPhone 上主要管理顯示的第一個界面。

### 視圖載入過程

系統查找 ContentView 後：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI 會執行 body 中的程式碼，然後根據返回的視圖結構（如 VStack、Text 等）構建界面，並顯示在屏幕上。

這些步驟完成後，我們就可以在視圖中看到 ContentView。

![ContentView](../../Resource/016_view1.png)

需要注意的是，body 的作用是生成視圖，而不是存儲視圖。

這意味著，每次刷新視圖時，SwiftUI 都會重新計算 body，並生成新的視圖結構。

### 預覽視圖邏輯

Xcode 預覽（Canvas）和真實運行是兩種不同的機制。

例如，在入口文件中添加一個調試輸出：

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

在 Xcode 中預覽 ContentView 視圖，不會從 @main 入口開始執行，因此不會觸發入口文件中的 onAppear。

但是，如果在模擬器或實體設備上運行，系統會從 @main 開始執行，按照完整流程運行整個 App，會觸發入口中的 onAppear，並輸出調試資訊。

關鍵在於，Xcode 預覽只是“局部渲染”，只用於顯示當前視圖；模擬器和實體設備提供“完整運行環境”，會執行整個 App。

因此，在測試 App 功能時，應以模擬器或實體設備為準，Xcode 預覽無法提供完整的運行環境。

## 視圖的生命週期

在當前階段，我們的所有程式碼都集中在 ContentView 中。但在實際應用中，一個 App 通常會包含多個視圖，並在不同場景中進行切換。

例如，在“存錢罐”中：

![PiggyBank](../../Resource/016_view.png)

當點擊“存錢”時，顯示 SaveView 視圖；當存錢結束或關閉時，移除 SaveView 視圖。

這個過程就是一個視圖的生命週期，從創建視圖，顯示視圖，最後移除視圖。

### 關閉應用

當 App 被關閉時，所有視圖都會被移除，相關狀態也會消失。

因此，ContentView 及其他視圖都會從內存中移除，整個 App 的運行狀態也會被清空。

## 視圖中變數的生命週期

在 SwiftUI 中，變數的生命週期通常和視圖綁定。

例如：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State 變數

@State 聲明的變數，綁定視圖的生命週期。

```swift
@State private var name = "FangJunyu"
```

當創建視圖時，name 也會被創建；當視圖移除時，name 也會被銷毀。 

這就是為什麼需要使用 UserDefaults 等方式做資料持久化。

### body 內變數

在 body 中定義的變數：

```swift
var num = 10
```

它的生命週期與 body 的執行過程綁定。

當 SwiftUI 的狀態發生變化時，例如：

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

當 name 發生改變時，@State 監測到資料發生變化，會通知 SwiftUI 重新計算視圖，body 被重新計算。

body 重新計算時，body 內的所有程式碼都會重新執行，body 內的變數（如 num）會被重新創建。

這也是，為什麼不推薦在 body 中定義複雜變數。

因為，每次刷新視圖，body 內的變數都會被重新創建，這會增加計算成本，並影響性能。

在 SwiftUI 中，不同類型的資料應該使用不同的方式管理，需要跟隨視圖生命週期的資料，可以使用 @State 保存；臨時計算的資料，可以放在 body 中。

## onAppear 和 onDisappear

在上一節課，我們已經學習了 onAppear，當視圖顯示時會調用 onAppear。

```swift
.onAppear {}
```

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

在 Xcode 預覽或運行時，可以看到 onAppear 中的輸出調試。

### onDisappear

與 onAppear 對應的是 onDisappear：

```swift
.onDisappear {}
```

當視圖被關閉時，會調用 onDisappear。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

當視圖被移除時，會調用 onDisapper 中的程式碼。

提示：當前階段使用的 ContentView 是應用的根視圖，無法直接關閉或移除。因此，在這一階段無法觀察到 onDisappear 的執行效果。

在後續學習頁面跳轉、打開新視圖時，才能看到 onDisappear 被調用。

## 創建和顯示邏輯

需要注意的是，視圖的創建和顯示是兩個不同的階段。

當視圖創建時，會調用 struct 的構造方法：

```swift
init() {}
```

因為 SwiftUI 視圖是 struct 結構：

```swift
struct ContentView: View { ... }
```

所以，當視圖實例被創建時，會執行 init 構造方法。當視圖顯示時，才會調用 onAppear 方法。

例如：

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

在 Xcode 中預覽視圖時，可以看到調試輸出：

```swift
Create ContentView
Show ContentView
```

說明，先執行 init 創建視圖，再計算 body 中的程式碼，最後顯示視圖並執行 onAppear 方法。

因此，需要理解視圖的創建和顯示階段是分開的。

### init 構造方法

init 是 Swift 的基礎語法，struct 和 class 都可以定義，用於初始化對象。

```swift
init() {}
```

在 SwiftUI 中，當視圖被創建時，系統會調用視圖的 init 方法，可以用於接收參數、初始化資料。

如果沒有手動編寫 init，Swift 會為 struct 自動生成一個預設構造方法。

對於 ContentView 等 SwiftUI 視圖來說，創建視圖時，執行 init，顯示視圖時，執行 onAppear。

因此，init 是視圖被創建時執行的構造方法，在後續傳遞參數或初始化資料時會用到。

## 總結

本節課我們學習了應用啓動順序，從入口文件到 ContentView 文件的執行流程。

我們瞭解了 SwiftUI 視圖生命週期：視圖創建時會執行 init，顯示在屏幕上時會執行 onAppear，移除或關閉視圖時會執行 onDisappear。

學習了視圖更新機制：視圖由狀態驅動，當 @State 等狀態發生變化時，SwiftUI 會刷新視圖，重新計算 body，body 內的變數也會被重新創建。

變數的生命週期會綁定視圖的生命週期，而 body 內的臨時在每次刷新時，都會重新創建。

理解這些生命週期和變數的行為，有助於我們更好地組織程式碼，讓應用邏輯更清晰。