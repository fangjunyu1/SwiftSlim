# 補光燈

這節課，我們將製作一個非常有趣的補光燈 App。當夜晚來臨時，我們可以讓手機螢幕顯示不同的顏色，並把它當作一個簡單的補光燈使用。

這個補光燈 App 可以實現點擊螢幕切換顏色，以及使用滑桿調節亮度。

在這個例子中，我們將學習 `brightness` 調整視圖亮度、`onTapGesture` 給視圖添加點擊手勢以及 `Slider` 視圖控制項等知識點。

實現效果：

![Color](../../Resource/018_color.png)

## 顯示顏色

首先，我們先讓視圖顯示一種顏色。

在 SwiftUI 中，`Color` 不僅表示顏色，還可以作為一個視圖顯示：

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

這裡的 `Color.red` 表示一個紅色視圖，`.ignoresSafeArea` 的作用是將顏色視圖鋪滿整個螢幕，這樣看起來更像一個真正的補光燈效果。

實現效果：

![Color](../../Resource/018_color1.png)

### 顏色陣列和索引

現在只顯示一種顏色，但補光燈通常不只一種顏色。還可能顯示藍色、黃色、紫色、白色等顏色。

我們希望點擊螢幕時，可以切換不同的顏色。可以把這些顏色放進陣列中統一管理：

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

陣列適合保存「一組同類型的資料」。這裡陣列中的每一個元素，都是一個 `Color`。

如果我們想顯示某一個顏色，就可以使用索引：

```swift
colors[0]
```

這表示讀取陣列中索引為 `0` 的顏色，也就是第一個顏色。

現在程式碼可以寫成：

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

這樣螢幕上就會顯示陣列中的第一個顏色，也就是紅色。

### 索引控制顏色

如果我們需要切換不同的顏色，就需要使用一個變數來管理索引，而不是把索引寫死。

可以使用 `@State` 宣告一個變數來保存索引：

```swift
@State private var index = 0
```

這裡的 `index` 表示目前顏色的索引。

當 `index` 發生變化時，SwiftUI 會重新計算介面，並更新顯示內容。

然後把原來的 `colors[0]` 改為：

```swift
colors[index]
```

這樣，視圖中顯示的顏色就由 `index` 決定。

現在的程式碼變成：

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

當 `index` 改變時，`colors[index]` 也會跟著顯示不同的顏色。

例如：

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

需要注意的是，`index` 不能超過陣列的最大索引，否則會發生索引越界錯誤。

## 點擊手勢

現在我們可以根據 `index` 顯示不同的顏色，但還不能點擊切換。

在之前的「名言輪播」中，我們使用 `Button` 控制名言的切換。

而這一次，我們希望「點擊整塊顏色區域」來切換顏色，所以更適合使用 `onTapGesture`。

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

當我們點擊顏色視圖時，就會執行：

```swift
index += 1
```

這表示讓 `index` 增加 `1`，索引增加後，`colors[index]` 就會顯示陣列中的下一個顏色。

### onTapGesture

`onTapGesture` 是一個手勢修飾符，可以給視圖添加點擊操作。

基本用法：

```swift
.onTapGesture {
    // code
}
```

例如：

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

當點擊這個紅色視圖時，就會執行大括號中的程式碼，並在控制台輸出：

```swift
Click color
```

透過 `onTapGesture`，我們可以為一個視圖設定點擊後的行為。

### 和 `Button` 的區別

在前面我們學習過 `Button` 視圖，`Button` 和 `onTapGesture` 都可以處理點擊操作，但它們的使用場景並不完全一樣。

`onTapGesture` 更適合「給已有視圖添加點擊功能」，例如 `Color`、`Image`、`Text` 或其他普通視圖。

而 `Button` 更適合表示一個明確的按鈕，例如「確認」、「提交」或者「刪除」等按鈕。

在這個補光燈 App 中，我們希望切換顏色功能更簡單，點擊整塊顏色區域實現顏色的切換，就可以使用 `onTapGesture`。

## 索引問題

現在，我們可以點擊螢幕切換不同的顏色。

但是這裡存在一個重要的問題：**索引可能會超出陣列範圍**。

例如：

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

當不斷點擊螢幕時，`index` 最終會變成 `4`，這時就會引發「索引越界」的報錯。

這是因為 `colors` 陣列中有 `4` 個元素，但索引是從 `0` 開始計算的，所以合法索引範圍是 `0 - 3`，沒有 `4`。

如果存取 `colors[4]`，就會發生「索引越界」。

在目前程式碼中，每次點擊螢幕，`index` 都會自動加 `1`，如果我們不做處理，最後就一定會超出範圍。

所以，我們需要在點擊螢幕時，對索引進行判斷：如果是最後一個顏色，則回到第一個顏色，否則繼續加 `1`。

可以使用 `if` 語句實現：

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

這段程式碼中，`colors.count` 表示陣列元素的個數。

目前陣列中有 4 個顏色，所以：

```swift
colors.count // 4
```

但最大索引不是 `4`，而是 `3`，因為索引從 `0` 開始。

所以最後一個索引要寫成：

```swift
colors.count - 1
```

也就是：

```swift
4 - 1 = 3
```

這段邏輯表示，如果目前已經是最後一個顏色對應的索引，就把索引重設為 `0`，否則就讓索引加 `1`。

這樣，顏色就可以循環切換了。

### 優化索引

如果想讓程式碼更簡潔，還可以使用三元運算子：

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

這段程式碼表示，如果 `index == colors.count - 1` 成立，回傳 `0`。如果不成立，回傳 `index + 1`。

最後，再把這個結果賦值給 `index`。

現在，我們可以實現切換顏色的效果。

完整程式碼：

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

現在，我們可以點擊螢幕並切換不同的顏色，一個基礎的補光燈 App 就完成了。

## 顯示顏色名稱

我們可以再加一組與顏色對應的文字，這樣在切換顏色時，螢幕上也會同步顯示目前顏色的名稱。

例如：

- 紅色時顯示 `Red`
- 藍色時顯示 `Blue`
- 黃色時顯示 `Yellow`
- 紫色時顯示 `Purple`

這裡同樣可以使用陣列來保存顏色名稱：

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

這個陣列中的文字順序，要和顏色陣列的順序一一對應。

然後我們就可以使用 `Text` 顯示目前索引對應的顏色名稱：

```swift
Text(colorsName[index])
```

`Text` 會根據 `index` 顯示目前顏色名稱。

使用修飾符優化 `Text` 的顯示樣式：

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

這樣可以讓 `Text` 以白色、大標題、字體加粗的形式顯示。

現在，我們有一個全螢幕的 `Color` 視圖，如果我們想要 `Text` 顯示在 `Color` 視圖上面，就需要使用 `ZStack` 佈局容器疊加顯示。

```swift
ZStack {
    Color
    Text
}
```

於是程式碼改成：

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

這樣，背景是顏色視圖，前面疊加顯示一個文字視圖。

實現效果：

![Color](../../Resource/018_color2.png)

需要注意的是，因為 `ZStack` 中，後寫的視圖通常會顯示在前面。如果把 `Text` 寫在 `Color` 前面，後面的 `Color` 視圖就可能把 `Text` 覆蓋掉。

## 控制亮度

現在我們可以切換不同的顏色，但補光燈還有一個重要的功能：**調整亮度**。

在 SwiftUI 中，可以使用 `brightness` 修飾符調整視圖亮度。

例如：

```swift
.brightness(1)
```

我們可以這樣寫：

```swift
colors[index]
    .brightness(0.5)
```

這樣目前顏色會變亮，看起來更接近補光燈的效果。

`brightness` 亮度範圍為 `0 - 1`，`0` 表示保持原本顏色，越接近 `1` 顏色越亮，`1` 表示亮度最大的白色。

雖然，我們可以在程式碼中控制 `brightness` 的亮度，但是使用者不能自己調節。

我們需要加入一個可以拖動的控制項：`Slider`。

## 滑桿視圖 Slider

在 SwiftUI 中，`Slider` 是一個滑桿控制項，用來在一個範圍內選擇數值。Apple 文件將它描述為一個「在有界線性範圍中選擇值的控制項」。

基本用法：

```swift
Slider(value: $value, in: 0...1)
```

參數解析：

1. `value: $value`：`Slider` 需要綁定一個變數。

    當滑桿拖動時，變數值會同步修改。反過來，如果變數發生修改，滑桿也會同步修改。

    和之前學過的 `TextField` 很像，都是「把控制項和變數綁定起來」。
    
    綁定的變數前面需要添加 `$` 符號，以表示綁定。

2. `in: 0...1`：這個參數表示滑桿的取值範圍。

    這裡的 `0...1` 表示：最小值是 `0`，最大值是 `1`。

    當滑桿拖到最左邊時，綁定變數接近 `0`；拖到最右邊時，綁定變數接近 `1`。

例如：

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` 綁定 `value` 變數，當拖動滑桿時，`value` 變數會同步修改。

顯示樣式：

![Slider](../../Resource/018_slider.png)

當 `Slider` 滑到左側時，綁定的 `value` 值就會變為 `0`，滑到右側則變成 `1`。

### 取值範圍

`Slider` 的取值範圍並不是固定的，也可以寫成：

```swift
0...100
```

或者其他範圍。

但在這個補光燈中，我們需要控制亮度，所以使用 `0...1` 最合適。

## 使用 Slider 控制亮度

現在，我們要把 `Slider` 和 `brightness` 連接起來。

首先，建立一個變數來保存亮度值：

```swift
@State private var slider = 0.0
```

這裡的 `0.0` 是一個 `Double` 類型的值。

因為 `Slider` 綁定的通常是數值類型，而這裡我們希望它能連續變化，所以使用 `Double` 更合適，此外 `brightness` 也只能接受 `Double` 類型的值。

然後把這個值傳給 `brightness`：

```swift
colors[index]
    .brightness(slider)
```

當 `slider == 0` 時，顏色保持預設狀態；當 `slider` 越接近 `1` 時，顏色看起來越亮。

### 添加 Slider 控制項

接下來，添加一個 `Slider` 控制項來修改這個變數：

```swift
Slider(value: $slider, in: 0...1)
```

當滑桿發生變化時，`slider` 值也會發生變化，`brightness(slider)` 也會同步調整亮度。

這就是 SwiftUI 中非常典型的「變數驅動視圖」。

### 調整 Slider 外觀

預設情況下，`Slider` 會按可用空間顯示寬度。

我們可以給它設定一個固定寬度：

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

接著再加上一些修飾，讓它更容易看清：

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

這樣滑桿外面就有白色背景和圓角，可以在 `Color` 視圖中看上去更明顯。

最後，我們再把它放到螢幕底部。

因為前面已經使用了 `ZStack`，所以可以在其中再放一個 `VStack`，並透過 `Spacer()` 把 `Slider` 推到底部。

## 完整程式碼

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

實現效果：

![Color](../../Resource/018_color.png)

## 總結

我們運用之前學習的知識，以及顏色、陣列等基礎知識，製作了一個非常有趣的補光燈 App。

透過這個補光燈 App，我們學習了 `brightness` 調整亮度、`onTapGesure` 為視圖添加點擊操作，以及 `Slider` 視圖控制項。

我們為 `Color` 視圖添加 `onTapGesure` 點擊手勢，並實現切換顏色的功能。透過 `Slider` 控制項控制變數來管理 `brightness`，實現調整顏色亮度的功能，這也是「變數驅動視圖」。

我們重溫「三元運算子」、使用 `ZStack` 疊加顯示視圖，以及使用陣列管理一組同類型資料的用法，加深對陣列和索引的理解，在實際應用中考慮到索引越界的問題。

這個例子雖然不複雜，但是把我們前面掌握的很多基礎知識串聯起來，實現一個真實的小專案，就會更容易理解它們各自的作用。

### 真實使用場景

試想一下，拿一支舊的 iPhone 放在桌前，使用自己開發的補光燈 App 控制補光燈的顏色，這是非常好的使用體驗。

在 AppStore 中看到很多「補光燈」的 App，它們看上去也並不複雜。

![AppStore](../../Resource/018_appStore.PNG)

我們可以從簡單的應用開始開發，並嘗試上架到 AppStore，這不僅增加我們對開發的興趣，也會記錄我們的成長歷程。

### 課後練習

你可以繼續思考這個補光燈 App 的擴展方向，比如：

- 增加更多顏色
- 顯示目前亮度數值
- 美化底部滑桿區域

當你把這些基礎知識真正用起來時，就會發現：我們學的每一個知識點，其實都是開發 App 的工具。
