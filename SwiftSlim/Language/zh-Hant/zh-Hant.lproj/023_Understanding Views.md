# 理解視圖

這節課，我們重新回到最開始的 `ContentView`。

```swift
struct ContentView: View {
    var body: some View {
        Text("你好，世界！")
    }
}
```

我們第一次接觸 SwiftUI 時，`ContentView` 中有很多我們不理解的關鍵字。

例如 `struct`、`View`、`var`、`body`、`some View` 等等關鍵字。

當時我們可能只知道：**把程式碼寫到 `body` 裡面，介面上就會顯示內容。**

現在，我們已經學過 `struct`、變數、方法和協議，我們可以重新理解這段程式碼，幫助我們理解 SwiftUI 視圖之間的關係。

## 重溫 ContentView

建立 SwiftUI 專案後，Xcode 預設會產生一個 `ContentView` 檔案。

範例程式碼如下：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("你好，世界！")
        }
        .padding()
    }
}
```

這段程式碼可以拆成幾個部分理解。

首先是：

```swift
import SwiftUI
```

這行程式碼表示匯入 SwiftUI 框架。

匯入 SwiftUI 後，我們才能使用 `View`、`Text`、`Image`、`VStack`、`Button` 等 SwiftUI 視圖。

## ContentView 結構體

這一行程式碼表示建立一個結構體：

```swift
struct ContentView: View
```

其中：

```swift
struct ContentView
```

表示 `ContentView` 是一個結構體。

我們在上一節課瞭解過 `struct` 結構，它可以將不同的欄位結構組合在一起，它可以包含屬性、方法。

例如：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("你好，世界！")
    }
}
```

在這個範例中，`ContentView` 裡面包含了三個內容：`name`、`printName` 和 `body`。

也就是說，`struct` 可以把相關的屬性、方法和視圖內容組合在一起。

![contentView](../../Resource/023_contentVIew.png)

## View 是一個協議

繼續看這一行程式碼：

```swift
struct ContentView: View 
```

冒號後面的 `View` 表示：`ContentView` 遵循 `View` 協議。

可以理解為，`ContentView` 如果想要成為一個 SwiftUI 視圖，就必須滿足 `View` 協議的要求。

### Identifiable 協議

前面學習電影清單時，我們接觸過 `Identifiable` 協議。

當時，我們需要在 `ForEach` 中走訪 `Movie` 陣列，但是 `Movie` 結構沒有唯一識別，因此不支援 `ForEach` 走訪。

這時，我們需要讓 `Movie` 結構遵循 `Identifiable` 協議，從而符合 `ForEach` 對唯一識別的要求。

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` 協議要求：**這個型別有一個標識自己的 `id` 欄位。**

當 `Movie` 提供一個 `id` 欄位後，它就可以满足 `Identifiable` 的要求。

這样我們在 `ForEach` 中使用它時，SwiftUI 就能識别每一筆資料。

```swift
ForEach(lists) { movie in
    // ...
}
```

### View 協議

`View` 協議也是如此。

如果一個型別想要成為 SwiftUI 視圖，就需要遵循 `View` 協議。

而 `View` 協議最重要的要求，就是提供一個 `body`。

```swift
struct ContentView: View {
    var body: some View {
        Text("你好，世界！")
    }
}
```

可以理解為，`View` 協議要求：**只接受 `body` 返回的 SwiftUI 視圖，`ContentView` 則透過 `body` 顯示 SwiftUI 視圖。**

### 如果不遵循 View 會怎麼樣？

如果我們這样寫：

```swift
struct ContentView {
}
```

這只是一個普通結構體，不是 SwiftUI 視圖。

它不會直接報錯，因為普通結構體本身就是合法的 Swift 程式碼。

但是，如果我們把它放到預覽裡：

```swift
#Preview {
    ContentView()
}
```

這時就會報錯。

原因是：**預覽需要顯示一個 SwiftUI 視圖，而這個 `ContentView` 沒有遵循 `View` 協議。**

因此，如果我們希望 `ContentView` 能顯示在介面上，就需要讓它遵循 `View` 協議：

```swift
struct ContentView: View {
}
```

同時，按照 `View` 協議要求提供 `body`，如果沒有 `body`，編譯器仍然會報錯。

正確寫法：

```swift
struct ContentView: View {
    var body: some View {
        Text("你好，世界！")
    }
}
```

這時，`ContentView` 才是一個真正可以顯示的 SwiftUI 視圖。

## body 是視圖顯示的入口

在 SwiftUI 中，`body` 是視圖內容的入口。

```swift
var body: some View {
    Text("你好，世界！")
}
```

這裡可以拆成三部分：

**1、var body**

```swift
var body
```

表示定義了一個名為 `body` 的變數。

**2、some View**

```swift
: some View
```

表示這個 `body` 會回傳一個視圖。

**3、{ ... }**

```swift
{
    Text("你好，世界！")
}
```

表示顯示的視圖內容，這段程式碼中顯示的是一個 `Text` 視圖。

也就是說，`body` 裡面寫什麼，介面上就顯示什麼。

例如：

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("姓名：")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

這段程式碼表示：**介面上顯示一個垂直排列的內容，裡面有兩個文字。**

### body 命名不能隨意修改

需要注意的是，`body` 這個名字不能隨便修改。

如果寫成：

```swift
struct ContentView: View {
    var content: some View {
        Text("你好，世界！")
    }
}
```

這個 `content` 雖然也是一個視圖屬性，但它不能取代 `body`。

因為 `View` 協議要求的名稱就是 `body`。

## some View 是什麼？

在 SwiftUI 中，`some View` 表示返回一個具體的視圖，只是不需要把這個視圖的完整型別寫出來。

```swift
var body: some View
```

也就是說，`some View` 並不是沒有型別，而是真實型別仍然存在，編譯器知道這個型別，但是這個型別可能很複雜，所以 Swift 允許我們使用 `some View` 把它隱藏起來。

### 什麼是 some？

在 Swift 中，`some` 是用於宣告不透明型別（opaque type）的關鍵字。

不透明型別的意思是：**回傳值有一個具体型別，編譯器知道這個具体型別是什麼，但我們不把這個具体型別直接寫出來。**

例如：

```swift
func makeView() -> some View {
    Text("你好")
}
```

這表示，`makeView` 會回傳一個遵循 `View` 協議的具体型別。

### 為什麼需要 some？

在學習變數時，我們瞭解過：**Swift 中的值需要明確標註型別，或者由編譯器自動推斷出型別。**

例如：

```swift
let a: Int = 10
```

這裡的常數 `a` 是 `Int` 型別。

SwiftUI 視圖也不例外，當我們使用 `body` 顯示 SwiftUI 視圖時，需要讓 `body` 返回對應的 SwiftUI 型別。

例如，我們使用 `body` 顯示一個 `Text` 文字視圖，我們就需要讓 `body` 返回對應的 `Text` 型別。

```swift
var body: Text {
    Text("Fang Junyu")
}
```

在這個範例中，`body` 內部顯示的是一個 `Text` 視圖，返回的型別也是 `Text`。

只有內部的型別和宣告的型別一致時，才符合編譯器對型別一致的要求。

**型別不一致問題**

如果，我們將 `body` 的型別設定為 `Color`，但是顯示的是 `Text`：

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` 的型別和內部的程式碼型別不一致，就會觸發型別不一致報錯。

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

這時，就需要我們手動修改 `body` 的返回型別。

**複雜的視圖型別**

在實際開發中，介面通常不會只有一個 `Text`。

如果需要顯示更複雜的 `VStack`，我們需要手動標註複雜的返回型別。

例如：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("你好，世界！")
    }
}
```

這段程式碼表示返回一個 `VStack`，`VStack` 內部是 `Image` 和 `Text` 型別的視圖。

`body` 的返回型別是：

```swift
VStack<TupleView<(Image,Text)>>
```

可以看到，這個返回型別非常複雜，還新增了一個我們之前沒有見過的 `TupleView`。

`TupleView` 在這裡可以理解為：**表示封装多個子視圖為一個視圖。**

**更複雜的視圖型別**

如果，我們给視圖加入修飾符：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("你好，世界！")
    }
    .padding()
}
```

那么，這個視圖的返回型別變得非常複雜，無法在這裡進行具體的描述。

現有的返回型別 `VStack<TupleView<(Image,Text)>>` 就會因為無法描述修飾符，從而發生報錯。

**some View 簡化返回型別**

對于這種情况，SwiftUI 提供了一種簡洁的解決方案，那就是 `some View` 來簡化寫法。

當我們將 `body` 改為 `some View` 型別時：

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("你好，世界！")
    }
    .padding()
}
```

我們每次修改視圖程式碼，都不需要再寫出完整的返回型別。

這是因為，`some View` 表示返回一個遵循 `View` 協議的具体視圖。

換句話說，`VStack`、`Image` 等等 SwiftUI 視圖，都是遵循 `View` 協議的視圖。加入修飾符後返回的視圖型別，仍然遵循 `View` 協議。

所以它們都可以作為 `some View` 返回。

### some View 不能隨便返回任何視圖

`some View` 虽然可以隱藏複雜型別，但它並不是“沒有型別”。

它的核心規則是：**編譯器必須能確定一個具體的返回型別**。

例如：

```swift
var title: some View {
    Text("你好")
}
```

這裡回傳的是 `Text` 視圖。

但是，如果嘗試返回兩個視圖，就會發生報錯：

```swift
var title: some View {
    Text("你好")
    Image(systemName: "star")
}
```

因為 `some View` 最終需要返回一個視圖結構，而這裡嘗試返回兩個獨立的視圖。

### 解決方案

解決方案通常有兩種：容器和 `@ViewBuilder`。

**1、使用容器包起來**

```swift
var title: some View {
    VStack {
        Text("你好")
        Image(systemName: "star")
    }
}
```

在這段程式碼中，`title` 回傳的是一個 `VStack`，而 `Text` 和 `Image` 是 `VStack` 裡面的子視圖。

`some View` 接收的視圖結構是一個 `VStack<...>`，從而符合 `some View` 對于返回一個視圖結構的要求。 

這也就是為什麼，我們從一開始學習 SwiftUI，就建議在最外層使用 `VStack` 容器包裹視圖程式碼。

**2、使用 @ViewBuilder**

我們也可以在 `some View` 前面加入 `@ViewBuilder` 修飾符：

```swift
@ViewBuilder
var title: some View {
    Text("你好")
    Image(systemName: "star")
}
```

`@ViewBuilder` 可以把多個視圖組合成一個返回結果。

其本質還是將多個視圖合併為一個視圖，來满足 `some View` 對于返回一個視圖結構的要求。

### 為什麼 body 可以直接寫多個視圖？

如果我們在 `var body` 中編寫多個視圖，例如：

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("你好，世界！")
}
```

在一些情況下，這样的 `body` 不會報錯。

原因在于，`View` 協議中的 `body` 預設支援 `@ViewBuilder`：

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

在 `View` 協議的原始碼中，我們可以看到 `@ViewBuilder` 已經修飾了 `body` 變數。

因此，`body` 比普通的 `some View`，多了一層特殊處理，從而 SwiftUI 會自動幫我們把多個視圖組合成一個視圖。

**建議使用容器**

為了讓初學者更容易理解，建議優先使用 `VStack`、`HStack`、`ZStack`、`Group` 等容器來組織多個視圖。

例如：

```swift
var body: some View {
    VStack {
        Text("你好")
        Image(systemName: "star")
    }
}
```

這样程式碼更直觀：**外層是一個 `VStack`，裡面放了兩個子視圖。**

## 拆分視圖

如果介面比較簡單，我們可以把所有程式碼都寫在 `body` 中。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("歡迎使用 Qinote")
                Text("早安")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("點我") {
                print("點我 ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

這個視圖的顯示样式：

![view](../../Resource/023_view1.png)

這段程式碼可以正常執行，但是如果視圖程式碼非常複雜，`body` 中的程式碼就會越來越長，閱讀和修改的難度就會不斷增加。

這時，我們可以把不同區域拆分為獨立的視圖屬性。

### 拆分頂部視圖

例如，把頂部區域拆分出來：

```swift
var topHome: some View {
    HStack {
        Text("首頁")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

這裡的 `topHome` 是一個變數，它返回一個視圖。

因為回傳的是視圖，所以型別可以寫為：

```swift
some View
```

這裡實際上和 `body` 是一個用法：

```swift
var topHome: some View { }
var body: some View { }
```

都是使用變數顯示視圖，返回型別為 `some View`。

### 拆分其他視圖

然後，繼續拆分其他部分：

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("歡迎使用 Qinote")
        Text("早安")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("點我") {
        print("點我")
    }
    .buttonStyle(.borderedProminent)
}
```

拆分之後，可以將視圖變數放到 `body` 中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("首頁")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("歡迎使用 Qinote")
            Text("早安")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("點我") {
            print("點我")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

現在 `body` 只負責描述頁面結構：

```swift
topBar
welcomeText
colorList
clickButton
```

每一部分的具體實作，都放到了下面對應的屬性中。

這種拆分視圖的方式，可以讓頁面結構更清楚，每個視圖區域都有自己的名稱，阅讀更直觀。

當修改某一部分的程式碼時，可以直接找到對應的視圖區域，而不是在一堆複雜的程式碼中找尋程式碼。

### some View 返回單一視圖

在這個拆分視圖中，如果我們嘗試返回多個視圖：

```swift
var topBar: some View {
    Text("首頁")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` 因為只能返回一個視圖結構，從而發生報錯。

和 `body` 不同的是，一般的計算屬性預設沒有 `@ViewBuilder`。

因此，如果我們需要返回多個視圖，可以使用 `VStack`、`HStack` 或者 `Group` 容器將多個視圖組合成一個。

```swift
var topBar: some View {
    VStack {
        Text("首頁")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

或者加入 `@ViewBuilder` 組合視圖：

```swift
@ViewBuilder
var topBar: some View {
    Text("首頁")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

這样，我們就可以實現多個視圖的返回。

### if 返回多個視圖

例如：

```swift
var topHome: some View {
    if step == "首頁" {
        HStack {
            Text("首頁")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("無")
    }
}
```

在這個程式碼中，`topHome` 會根據 `step` 的內容，返回 `HStack` 或者 `Text` 兩種不同型別的視圖。

由於 `some View` 需要一個確定的具体返回型別，普通計算屬性中 `if` 的兩個分支不能直接返回不同型別的視圖，從而發生報錯。

**解決方案仍然是使用容器包裹，或者使用 `@ViewBuilder` 修飾。**

### 拆分視圖為什麼不用括號

在 `body` 中使用拆分出來的視圖屬性時，我們直接寫：

```swift
topBar
welcomeText
colorList
clickButton
```

而不是寫成：

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

這是因為 `topBar`、`welcomeText`、`colorList`、`clickButton` 是一個變數，這個變數實際上是計算屬性，不是方法。

**屬性不需要使用括號。**

如果我們寫成方法，也可以實現類似效果：

```swift
func topBar() -> some View {
    HStack {
        Text("首頁")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

這段程式碼也可以實現類似效果，呼叫這個方法會回傳一個視圖。

使用時需要寫為：

```swift
topBar()
```

在 SwiftUI 中，如果只是拆分一個不需要傳入參數的視圖，使用計算屬性的方式更常見。

```swift
var topBar: some View { ... }
```

## 巢狀視圖

除了把程式碼拆成屬性，我們還可以建立新的視圖結構體。

例如：

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

這個 `PinkColorView` 和 `ContentView` 一樣，都是一個獨立的 SwiftUI 視圖。

如果需要在 `ContentView` 中顯示它，可以在視圖名稱後面加入 `()`。

例如：

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

這裡的：

```swift
PinkColorView()
```

表示建立一個 `PinkColorView` 實例。

因為 `PinkColorView` 遵循了 `View` 協議，所以它可以和 `Text`、`Image`、`Button` 一樣放到其他視圖中顯示。

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

這就是視圖巢狀，一個視圖可以顯示在另一個視圖當中。

## 視圖屬性還是建立新視圖？

視圖程式碼比較簡單時，通常不需要拆分程式碼，只有程式碼比較複雜時，才建議拆分視圖。

### 使用視圖屬性的場景

如果只是目前視圖中的一小塊內容，可以使用視圖屬性。

例如：

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

這些內容通常只在目前視圖中使用。

### 建立新視圖的場景

如果這些內容比較獨立，或者以後可能在多個頁面中重複使用，就更适合建立新的視圖。

例如：

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

這是一個標題視圖，如果我們想要把這個視圖作為通用元件，在其他視圖中重複使用。

我們可以建立一個新的視圖：

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

然後，在其他地方使用：

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

這時，這個視圖就是一個可重複使用的獨立元件。

可以簡單歸納為：

- 目前視圖的內容區域，可以使用 `var xxx: some View`
- 可以重複使用的獨立元件：可以建立新的 `struct XxxView: View`
- 需要传入資料的元件：通常更适合建立新的視圖。

## 總結

這節課，我們重新理解了 SwiftUI 中最基礎、但也最重要的視圖結構。

`ContentView` 是一個結構體，它使用 `struct` 定義，用來組織頁面相關的程式碼。

`View` 是一個協議，一個結構體如果想要成為 SwiftUI 視圖，就需要遵循 `View` 協議。

`body` 是 `View` 協議要求我們提供的內容，它決定這個視圖顯示什麼內容。

`some View` 表示返回某一種具體的視圖，我們不需要寫出它複雜的完整型別。

當視圖程式碼變長時，我們可以使用 `var xxx: some View` 把視圖程式碼拆分成多個小區域。

當某一區塊內容比較獨立，或者需要重複使用時，我們可以建立新的視圖結構體，並在其他視圖中透過 `XxxView()` 顯示它。

簡單來说，SwiftUI 的介面就是由一個個視圖組合起來的，一個頁面可以包含多個小視圖，一個小視圖也可以繼續包含其他視圖。
