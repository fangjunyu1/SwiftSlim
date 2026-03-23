# 絢麗的顏色

本節課我們將學習 SwiftUI 中常見的視覺修飾符，包括：

- 顏色
- 前景色
- 背景色
- 偏移
- 透明度
- 模糊

還會學習 Safe Area（安全區域）。

這些修飾符用於控制視圖的外觀表現，使界面更加清晰、有層次。

## 顏色

在 SwiftUI 中，可以設置文字的顏色。

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue 表示藍色，實際上是 Color.blue 的簡化寫法（類型推斷）。

常見顏色包括：

```
.black
.green
.yellow
.pink
.gray
...
```

這些都是 Color 的靜態屬性。

![Color](../../RESOURCE/006_color.png)

可以把 Color 理解為顏色類型，.blue、.red 都是它的具體顏色。

### Color 視圖

在 SwiftUI 中，Color 也可以作為視圖顯示。

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

這段程式碼會生成一個 100×100 的紅色方塊。

也可以讓整個界面顯示為某種顏色：

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

運行後，可以看到紅色並沒有鋪滿整個屏幕，iPhone 頂部和底部仍然是白色，這裡涉及 Safe Area（安全區域）的存在。

## Safe Area（安全區域）

Safe Area 是系統為避免內容被遮擋而預留的區域，包括：

1. 頂部的狀態欄（時間、電量）

2. 底部的 Home 指示條

3. 劉海（notch）或靈動島（Dynamic Island）區域

![Color](../../RESOURCE/006_color3.png)

SwiftUI 預設會將內容限制在安全區域內，因此視圖不會延伸到屏幕邊緣。

### 忽略 Safe Area（安全區域）

如果想要顏色鋪滿整個屏幕，可以使用 ignoresSafeArea：

```swift
Color.red
    .ignoresSafeArea()
```

或者使用 edgesIgnoringSafeArea：

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

這樣視圖就會延伸到整塊屏幕。

需要注意的是，edgesIgnoringSafeArea 是較早的寫法，從 iOS 14 開始，推薦使用 ignoresSafeArea。

## 前景色

### foregroundStyle 修飾符

在之前的課程中，學習過 foregroundStyle 設置顏色。

例如：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle 是新的樣式系統，支持顏色、漸變、材質等。

![Color](../../RESOURCE/006_color2.png)

### foregroundColor 修飾符

foregroundColor 也可以設置顏色:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

和 foregroundStyle 的使用方式一樣。

在最新的 Xcode 版本中，Xcode 會提示 foregroundColor 可能會在未來的 iOS 版本中棄用，建議優先使用 foregroundStyle。

## 背景

如果想要給視圖添加背景色，可以使用 background：

```swift
background(.red)
```

例如，給文字添加背景色：

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

我們在 Word、Chrome 等 App 中選擇文字時，可以看到類似的背景色效果。

![Color](../../RESOURCE/006_color16.png)

如果想要擴大背景，需要配合 padding：

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

這裡要注意一個重要規則：

SwiftUI 修飾符是從上到下構建視圖的。寫在後面的修飾符，會作用在前面的結果上。

所以：

```swift
.padding()
.background()
```

這表示背景會包裹添加內邊距之後的視圖。

如果順序寫反：

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

背景不會擴大，因為背景沒有包裹後面的 padding。

## 示例 - 四角螺母

現在，我們製作一個簡單的四角螺母視圖。

![Color](../../RESOURCE/006_color8.png)

先製作一個 50 × 50 的白色方塊：

```swift
Color.white
    .frame(width: 50, height: 50)
```

如果想要變成圓形，可以使用 cornerRadius：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

當圓角半徑等於寬高的一半時，就會變成圓形。

現在，添加一個藍色的背景：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

新增的 padding 會擴大外層區域，background 會在外層區域上繪制藍色。

現在就完成了一個四角螺母的效果。

### 另一種思路

除了使用背景色完成四角螺母，也可以使用 ZStack 實現。

前面學過 ZStack 可以實現疊加排序，四角螺母也可以理解為一個圓形和一個矩形疊加顯示。

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack 會將視圖按順序疊加，後添加的視圖顯示在上層。

## 示例 - 兩個重疊的圓

很多圖示都是由簡單圖形疊加而成，例如兩個重疊的圓。

![Color](../../RESOURCE/006_color14.png)

首先，創建兩個圓：

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

因為需要讓兩個圓疊加顯示，所以使用 ZStack 佈局：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

此時，兩個大小相等的圓完全重疊。

我們需要讓兩個圓部分重疊，而不是完全覆蓋，可以使用 offset 製造偏移效果。

## 偏移

offset 只改變視圖的繪制位置，不影響父視圖的佈局計算。

使用方法：

```swift
.offset(x:y:)
```

x 為水平方向的偏移量，y 為垂直方向的偏移量。

正值表示向右/向下偏移，負值表示向左/向上偏移。

使用 offset 設置兩個圓部分重疊：

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

紅色圓在佈局中的位置沒有發生變化，但其繪制位置向左移動了 25 點。因此兩個圓產生了部分重疊的視覺效果。

## 透明度

在 SwiftUI 中，opacity 用於設置視圖的透明度。

基本用法：

```swift
.opacity(0.5)
```

opacity 的參數範圍為 0.0 到 1.0，其中：

- 0 表示完全透明
- 1 表示不透明

可以使用 opacity 設置橙色圓的透明度：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

將橙色圓的 opacity 設置為 0.8 後，其不透明度為 80%，當兩個圓發生重疊時，重疊區域會產生顏色混合效果。

## 模糊

在 SwiftUI 中，可以使用 blur 設置模糊效果：

```swift
.blur(radius:10)
```

radius 定義模糊的半徑，數值越大，模糊效果越明顯。

我們可以給兩個圓添加模糊效果：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

最終，我們可以看到兩個非常模糊的圓。

## 總結

本節課圍繞 SwiftUI 中常見的視覺修飾符展開，學習了如何通過修飾符控制視圖的顏色、位置以及視覺效果。

通過具體示例，可以看到不同視覺修飾符在界面中的實際作用，瞭解了安全區域的知識。

這些都是非常基礎的修飾符，我們可以多加練習和使用，有助於在實際開發中更清晰地控制界面的效果。

### 課後練習

- 給一張圖片添加透明和模糊效果
- 設置三個不同透明度疊加的圓形
- 創建一個鋪滿屏幕的背景圖片，並忽略安全區域
- 使用 offset 調整多個視圖的位置

練習的目的不是記住 API，而是觀察視覺變化與佈局行為之間的關係。