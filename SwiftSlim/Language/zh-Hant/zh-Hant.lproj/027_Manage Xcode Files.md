# 管理 Xcode 文件

這節課，我們來學習 Xcode 中常見的文件操作。

在前面的課程中，我們大部分代碼都寫在 `ContentView` 中。這樣方便觀察代碼和顯示效果。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

但是，在真實 App 中，通常不會把所有代碼都寫在一個文件裏。

當頁面、組件和功能越來越多時，我們需要把不同的視圖拆分到不同的 SwiftUI 文件中。

例如：

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

這樣可以讓代碼結構更清晰，也方便後續維護和修改。

## 爲什麼要管理文件

在 SwiftUI 中，一個頁面或一個組件，通常都可以單獨寫成一個視圖文件。

例如：

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

這裏的 `CardView` 就是一個 SwiftUI 視圖。

如果所有視圖都寫在 `ContentView` 中，代碼會越來越長，也越來越難閱讀。

所以，我們需要學會創建、重命名、刪除文件，以及使用文件夾管理不同的代碼文件。

## 創建 SwiftUI 文件

在 Xcode 中，創建 SwiftUI 文件常見有兩種方式：

一種是創建空文件，然後自己寫代碼。

另一種是創建 SwiftUI 模板文件，由 Xcode 自動生成基礎代碼。

對於初學者，更推薦使用 SwiftUI 模板文件，因爲它會自動生成基本結構。

### 創建空文件

在 Xcode 左側的 Navigator 區域，右擊空白位置或文件夾，選擇 `New Empty File`。

操作位置如下：

![xcode](../../../Resource/027_view1.png)

創建空文件後，Xcode 通常會生成一個未命名的 Swift 文件，例如 `Untitled.swift`。

我們可以把它重命名爲 `TestView.swift`。

在 SwiftUI 項目中，如果這個文件用來顯示一個視圖，通常建議在名稱後面添加 `View`。

例如：

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

這不是強制規則，但可以讓我們一眼看出這是一個視圖文件。

創建空文件後，文件中可能只有默認註釋，也可能是空白內容，具體取決於 Xcode 版本和創建方式。

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

這時，我們需要手動寫入 SwiftUI 代碼：

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

這樣，一個簡單的 SwiftUI 視圖文件就創建完成了。

### 重命名文件

如果創建文件後，想要修改文件名，可以在 Xcode 左側 Navigator 區域選擇文件，然後按回車鍵 `⏎`。

![xcode](../../../Resource/027_view2.png)

這樣就可以修改文件名。

需要注意的是，修改文件名不會自動修改代碼中的視圖名稱。

例如，文件名改成 `ProfileView.swift` 後，代碼中可能仍然是 `struct TestView: View`。

雖然這樣不一定會導致報錯，但容易讓人混淆。

所以，建議讓文件名和視圖名稱保持一致，例如文件名是 `ProfileView.swift`，視圖名稱也使用 `ProfileView`。

## 創建 SwiftUI 模板文件

除了創建空文件，我們也可以直接創建 SwiftUI 模板文件。

在 Xcode 左側 Navigator 區域，右擊空白位置或文件夾，選擇 `New File from Template...`。

操作位置如下：

![xcode](../../../Resource/027_view3.png)

在彈出的窗口中，頂部可以選擇不同平臺，例如 `iOS`、`macOS` 等。

這裏保持選擇當前項目對應的平臺即可。例如，我們正在創建 iOS App，就選擇 `iOS`。

![xcode](../../../Resource/027_view4.png)

然後在下方選擇 `SwiftUI View`。

![xcode](../../../Resource/027_view12.png)

然後點擊 `Next`，輸入文件名並保存。

例如，我們創建一個 `Test2View.swift`。

Xcode 會自動生成類似下面的代碼：

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

和空文件相比，模板文件會自動包含 `import SwiftUI`、`struct`、`body` 和 `#Preview`。

所以對於初學者來說，使用 SwiftUI 模板文件更簡單，也更不容易漏寫代碼。

**提示**：除了右擊創建文件，也可以點擊 Xcode 左側 Navigator 底部的加號按鈕，創建文件或文件夾。

![xcode](../../../Resource/027_view5.png)

## 創建文件夾

當文件越來越多時，我們可以使用文件夾進行管理。

在 Xcode 左側 Navigator 區域，右擊空白位置或文件夾，選擇 `New Folder`。

創建文件夾後，可以把相關文件拖入文件夾中。

![xcode](../../../Resource/027_view7.png)

文件夾主要用於整理項目結構，不會改變視圖本身的使用方式。

只要視圖名稱正確，在其他文件中仍然可以通過 `TestView()`、`Test2View()` 這樣的方式使用。

## 刪除文件或文件夾

如果想刪除文件或文件夾，可以在 Xcode 左側 Navigator 區域選擇對應文件，然後右擊選擇 `Delete`。

也可以選擇文件後，按刪除鍵 `⌫`。

Xcode 會彈出刪除確認窗口。

![xcode](../../../Resource/027_view10.png)

選擇 `Move to Trash`，表示把文件移動到廢紙簍中。

如果看到 `Remove Reference`，表示只從 Xcode 項目中移除引用，但不會刪除磁盤上的原文件。

對於初學者，如果只是刪除自己剛創建的普通文件，通常選擇 `Move to Trash` 就可以。

## 顯示多個 SwiftUI 視圖

學會創建文件後，我們就可以把不同視圖拆分到不同文件中。

例如，我們創建兩個 SwiftUI 文件：

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` 用來顯示作者名稱：

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` 用來顯示卡片背景：

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

然後，我們可以在 `ContentView` 中使用這兩個視圖：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

運行後，可以看到 `CardView` 和 `AuthorView` 被組合顯示在一起：

![xcode](../../../Resource/027_view11.png)

在這個效果中，`CardView` 作爲背景，`AuthorView` 顯示在上方，這是因爲它們被放在了 `ZStack` 中。

在 `ContentView` 中，我們通過 `CardView()` 和 `AuthorView()` 使用這兩個視圖，名稱後面的 `()` 表示創建並使用這個視圖。

這就是 SwiftUI 中常見的視圖嵌套：一個視圖中，可以繼續使用其他視圖。

## 入口文件

最後，我們再回顧一下 App 是從哪裏開始顯示界面的。

在 SwiftUI 項目中，通常會有一個入口文件：

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

這裏的 `@main` 表示這是 App 的入口位置。

在 `WindowGroup` 中，我們看到：

```swift
ContentView()
```

這表示 App 啓動後，首先顯示 `ContentView`。

然後 `ContentView` 中又顯示了：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

所以視圖層級可以理解爲：

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

如果我們把入口文件中顯示的視圖改成 `CardView`：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

那麼 App 啓動後，就只會顯示 `CardView`。

也就是說，入口代碼中的 `WindowGroup` 決定 App 啓動後首先顯示哪個視圖。

而這個視圖內部，又可以繼續顯示其他視圖。

## 總結

這節課，我們學習了 Xcode 中常見的文件管理操作。

我們瞭解瞭如何創建 SwiftUI 文件、如何重命名文件、如何創建文件夾，以及如何刪除文件。

同時，我們也學習了一個重要概念：SwiftUI 視圖可以拆分到不同文件中，然後在其他視圖中使用。

例如：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

這裏的 `CardView()` 和 `AuthorView()`，就是在 `ContentView` 中使用其他視圖。

最後，我們還回顧了入口文件的顯示邏輯。

App 啓動時，會先進入帶有 `@main` 標記的入口代碼，然後顯示 `WindowGroup` 中的視圖。

這會幫助我們理解：不同 SwiftUI 文件並不是孤立的，它們可以互相組合，最終形成完整的 App 界面。
