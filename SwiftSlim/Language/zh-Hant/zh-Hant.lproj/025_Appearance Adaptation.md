# 外觀適配

這一節課，我們學習淺色模式和深色模式的外觀適配。

在 iPhone、iPad 和 Mac 上，用戶可以選擇淺色模式，也可以選擇深色模式。

當系統切換爲深色模式時，很多 App 的背景、文字和圖標顏色也會跟着變化。

例如，白天界面可能是淺色背景，夜晚界面可能變成深色背景。

![view](../../../Resource/025_view9.png)

這種根據系統外觀自動調整界面顯示的能力，就叫做外觀適配。

## Xcode 預覽外觀適配

在學習外觀適配之前，我們先了解如何在 Xcode 中預覽淺色模式和深色模式。

在 `Canvas` 區域底部，點擊 `Device Settings` 按鈕，可以打開 `Canvas Device Settings` 彈窗。

![canvas](../../../Resource/025_view.png)

在彈窗中可以看到 `Color Scheme` 設置。

![canvas1](../../../Resource/025_view1.png)

其中：

- `Light Appearance` 表示淺色模式。
- `Dark Appearance` 表示深色模式。

我們可以通過這裏切換預覽外觀，查看當前界面在淺色模式和深色模式下的顯示效果。

## 並列顯示兩種外觀

如果想要同時查看淺色模式和深色模式，可以使用 `Variants` 功能。

在 `Canvas` 區域底部，點擊 `Variants` 按鈕，選擇 `Color Scheme Variants`。

![canvas2](../../../Resource/025_view2.png)

選擇後，`Canvas` 會同時顯示淺色模式和深色模式的預覽效果。

![canvas3](../../../Resource/025_view3.png)

這樣可以更方便地對比兩種外觀下的界面差異。

簡單來說：

如果只想臨時切換淺色/深色模式，可以使用 `Canvas Device Settings`。

如果想同時查看兩種外觀，可以使用 `Color Scheme Variants`。

## 視圖默認會適配外觀

在 SwiftUI 中，很多系統視圖默認會自動適配淺色模式和深色模式。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Light")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

顯示效果：

![canvas](../../../Resource/025_view4.png)

可以看到，在淺色模式中，圖標和標題通常顯示爲深色。

在深色模式中，圖標和標題會自動變成淺色。

這是因爲 `Text`、`Image` 等 SwiftUI 視圖默認會根據系統外觀調整顏色。

也就是說，如果我們不手動指定固定顏色，SwiftUI 會幫我們處理一部分外觀適配。

## 固定顏色不會自動互換

需要注意的是，如果我們手動指定了固定顏色，它就不會根據淺色/深色模式自動互換。

例如：

```swift
Text("some some some")
	.foregroundStyle(Color.gray)
```

這裏的文字被指定爲 `Color.gray`，所以它會一直顯示爲灰色。

再比如：

```swift
Text("Title")
    .foregroundStyle(Color.white)
```

這段代碼無論在淺色模式還是深色模式中，都會顯示白色文字。

如果背景也是淺色，白色文字就可能看不清楚。

所以在做外觀適配時，要儘量避免隨意寫死 `Color.white`、`Color.black` 這類固定顏色。

在很多情況下，可以優先使用系統語義樣式，例如：

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

其中：

- `.primary` 通常用於主要內容。
- `.secondary` 通常用於次要內容。

它們會根據淺色/深色模式自動調整顯示效果。

## 根據外觀顯示不同內容

有時，我們不僅希望顏色發生變化，還希望不同外觀下顯示不同的內容。

例如：

- 淺色模式中顯示普通燈泡圖標。
- 深色模式中顯示發亮的燈泡圖標。
- 淺色模式中標題顯示 `Light`。
- 深色模式中標題顯示 `Dark`。

這時，就需要判斷當前系統處於淺色模式還是深色模式。

在 SwiftUI 中，可以通過 `colorScheme` 環境值獲取當前外觀模式：

```swift
@Environment(\.colorScheme) private var colorScheme
```

完整代碼：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Light" : "Dark"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

顯示效果：

![view](../../../Resource/025_view5.png)

從預覽效果可以看到，同一個視圖在不同外觀模式下，顯示的內容並不完全一樣。

在淺色模式中，`Image` 顯示的是普通燈泡圖標，標題顯示爲 `Light`。

在深色模式中，`Image` 顯示的是發亮的燈泡圖標，標題顯示爲 `Dark`。

也就是說，這裏的變化不只是顏色發生了變化，而是圖標名稱和標題文字本身也發生了變化。

這是因爲我們沒有把圖標和標題直接寫死在 `body` 中，而是根據 `colorScheme` 計算出不同的內容。

在這段代碼中，我們使用了兩個計算屬性：

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

當 `colorScheme` 是 `.light` 時，說明當前是淺色模式。

當 `colorScheme` 是 `.dark` 時，說明當前是深色模式。

所以我們可以根據不同的外觀模式，返回不同的圖標名稱和標題文字。

這也是計算屬性的一個常見用途：根據當前狀態，計算出視圖需要顯示的內容。

## 理解 @Environment

這是我們第一次接觸 `@Environment`。

`@Environment` 可以理解爲：從 SwiftUI 的環境中讀取一個值。

App 運行時，系統會提供很多環境信息，例如：

- 當前語言
- 當前外觀模式
- 當前佈局方向
- 當前字體大小設置

當我們需要獲取當前外觀模式時，就可以讀取 `colorScheme`：

```swift
@Environment(\.colorScheme) private var colorScheme
```

其中

```swift
\.colorScheme
```

表示從環境中讀取 `colorScheme` 這個值。

```swift
private var colorScheme
```

表示把讀取到的值保存到 `colorScheme` 這個變量中。

變量名稱可以自己決定，例如也可以寫成：

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

只要前面的 `\.colorScheme` 不變，就表示讀取的是當前外觀模式。

## colorScheme 的兩個常見值

`colorScheme` 常見有兩個值：

```swift
.light
.dark
```

它們表示：

- `.light`：淺色模式
- `.dark`：深色模式

例如：

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

這段代碼的意思是：

如果當前是淺色模式，`colorScheme == .light` 成立，就返回 `"Light"`。

否則，就返回 `"Dark"`。

所以，在淺色模式中：

```swift
Text(titleName)
```

顯示的是：

```swift
Light
```

在深色模式中，顯示的是：

```swift
Dark
```

通過這種方式，我們就可以根據不同外觀顯示不同的內容。

## 顏色適配示例

除了文字和圖標，有時候我們還需要自己處理顏色適配。

例如：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

顯示效果：

![view](../../../Resource/025_view6.png)

這段代碼中，文字是白色，背景是黑色。

在淺色模式中，黑色背景比較明顯。

但是在深色模式中，如果整個界面背景也是黑色，這個黑色背景就會融入到系統背景裏，看起來不夠清楚。

這時，我們可以根據外觀模式切換文字顏色和背景顏色：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

顯示效果：

![view](../../../Resource/025_view7.png)

現在，淺色模式中是黑色背景、白色文字。

深色模式中是白色背景、黑色文字。

這樣無論在哪種外觀下，文字和背景都有明顯對比，用戶都可以清楚地看到內容。

## 使用 Assets 適配顏色

除了使用 `colorScheme` 手動判斷，我們還可以使用 `Assets` 資源顏色來適配淺色/深色模式。

這種方式更適合管理 App 中通用的顏色。

在 Xcode 項目中，找到 `Assets` 資源文件夾。

![assets](../../../Resource/025_color.png)

打開 `Assets` 文件夾，右擊空白區域，選擇 `New Color Set`，創建一個新的顏色資源。

![assets](../../../Resource/025_color1.png)

這裏我們創建一個顏色，並命名爲 `redText`。

![assets](../../../Resource/025_color2.png)

顏色資源可以分別設置淺色模式和深色模式下的顏色。

![assets](../../../Resource/025_color3.png)

選擇對應的顏色區域後，可以在右側屬性檢查器中修改顏色。

點擊右上角的 `Hide or show the Inspectors` 按鈕，打開檢查器區域。

然後選擇 `Show the Attributes inspector`，在底部找到 `Show Color Panel`，打開顏色面板。

![assets](../../../Resource/025_color4.png)

點擊顏色面板中的顏色，`redText` 對應的顏色區域同步發生變化。

這裏我們將 `redText` 設置爲：

- 淺色模式顯示紅色
- 深色模式顯示綠色

![assets](../../../Resource/025_color5.png)

回到 SwiftUI 代碼中，可以這樣使用這個顏色：

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

其中：

```swift
Color("redText")
```

表示從 `Assets` 中讀取名爲 `redText` 的顏色資源。

顯示效果：

![assets](../../../Resource/025_view8.png)

可以看到，同一個 `Color("redText")`，在淺色模式和深色模式中會顯示不同的顏色。

這說明 `Assets` 顏色本身也支持外觀適配。

## colorScheme 和 Assets 的區別

`colorScheme` 和 `Assets` 都可以實現外觀適配，但它們適合的場景不同。

如果只是根據淺色/深色模式切換文字內容、圖片名稱或 `SF Symbols` 名稱，可以使用 `colorScheme`。

例如：

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

如果是 App 中經常使用的顏色，例如主題色、卡片背景色、文字顏色，更推薦使用 `Assets` 顏色。

因爲 `Assets` 顏色可以在多個視圖中複用，後期修改也更方便。

例如：

```swift
Color("redText")
```

這樣只需要在 `Assets` 中修改顏色，使用這個顏色的地方都會一起變化。

## 總結

這一節課，我們學習了淺色模式和深色模式的外觀適配。

首先，我們學習瞭如何在 Xcode 的 `Canvas` 中預覽不同外觀，也學習瞭如何使用 `Color Scheme Variants` 同時查看淺色模式和深色模式。

然後，我們瞭解了 SwiftUI 中的 `Text`、`Image` 等視圖默認會根據系統外觀自動適配顏色。

但是，如果手動指定了固定顏色，例如 `Color.white` 或 `Color.black`，這些顏色就不會自動互換。

接着，我們學習了 `@Environment` 和 `colorScheme`：

```swift
@Environment(\.colorScheme) private var colorScheme
```

通過 `colorScheme`，我們可以判斷當前是淺色模式還是深色模式，並根據不同外觀顯示不同的圖標、文字或顏色。

最後，我們學習了 `Assets` 顏色。

`Assets` 顏色可以分別設置淺色模式和深色模式下的顏色，適合管理 App 中通用的顏色資源。

外觀適配可以讓 App 在白天和夜晚都有更好的顯示效果，也可以避免文字看不清、背景不明顯等問題。

在實際開發中，建議優先使用 SwiftUI 默認的適配能力和 `Assets` 顏色。

當不同外觀下需要切換文字、圖標、圖片，或者處理少量特殊顯示效果時，再使用 `colorScheme` 進行判斷。

## 擴展知識：指定字體大小

之前學習 `font` 時，我們使用過一些系統字體樣式：

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

除了使用 `.largeTitle`、`.callout` 這類系統字體樣式，也可以手動指定字體大小。

例如：

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

這裏的：

```swift
.font(.system(size: 100))
```

表示將字體大小設置爲 `100 pt`。

對於 `SF Symbols` 圖標來說，`font` 也會影響圖標大小。

所以，如果想讓圖標顯示得更大，可以通過 `.font(.system(size:))` 指定大小。

例如：

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

需要注意的是，手動指定字體大小雖然更靈活，但普通文字不建議大量使用固定字號。

普通文字優先使用 `.title`、`.headline`、`.body`、`.caption` 等系統字體樣式。

這樣可以更好地適配不同設備和用戶的字體設置。
