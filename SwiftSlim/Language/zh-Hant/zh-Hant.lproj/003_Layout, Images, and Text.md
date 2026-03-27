# 佈局、圖片和文字

上一節課，我們學習了 ContentView 程式碼：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

我們這節課，我們將學習 SwiftUI 的預設佈局機制，以及圖片和文字的使用方法。在上一節課的基礎上，我們將進一步理解視圖的結構和顯示方式，這些知識可以支持我們構建基本的界面佈局。

## SwiftUI 的預設佈局機制

預覽 ContentView 視圖時，我們會發現圖示和文字居中顯示，而不是從頂部開始排列。

![Swift](../../RESOURCE/003_view.png)

在預設情況下，Stack 容器的對齊方式是 .center，因此子視圖通常呈現為居中效果。

### Alignment 對齊方式

很明顯居中對齊只是對齊方式的一種，如果我們想要左對齊或者右對齊，就需要使用 alignment 控制視圖的對齊方式。

```swift
alignment
```

在 SwiftUI 中，對齊通常出現在兩種場景中：

**1. Stack 容器的對齊參數**

例如，ContentView 中的圖示和文字左對齊：

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

VStack 的 alignment 控制水平方向的對齊方式。

對齊方式：

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack 是水平排序，alignment 控制垂直方向的對齊方式：

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack 是疊加排序，alignment 可以控制水平或垂直方向的對齊方式：

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

如果不顯式指定 alignment，VStack、HStack 和 ZStack 預設為 .center。

**2. frame 內部的 alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

當 frame 提供的尺寸大於視圖的自身尺寸時，alignment 決定視圖在 frame 內部的定位。frame 的具體用法將在後面繼續講解，這裡先簡單瞭解一下。

### Spacer 與空間分配機制

alignment 可以讓視圖按照水平或垂直方向排序顯示。但是，當我們想要文字和圖片顯示在兩端，單一的對齊方式則不能滿足我們的需求。

例如，當我們想要實現一個 [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) 網站的頂部視圖，左側為 NHK 網站圖示，右側為站內目錄圖示。

![Swift](../../RESOURCE/003_alignment3.png)

如果我們只使用 alignment，NHK 網站圖示和站內目錄圖示都只會顯示在一側。無法將兩個圖示分布在左右兩側，因此需要 Spacer 分配剩餘空間。

Spacer 是一個用於佈局的彈性視圖，可以自動填充剩餘空間。

使用方法：

```swift
Spacer()
```

例如：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

當我們在 Image 和 Text 之間添加 Spacer 後，Spacer 會填充剩餘空間，將 Image 和 Text 分別推向上下兩端。

![Swift](../../RESOURCE/003_view1.png)

如果存在多個 Spacer：

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

剩餘空間會被 Spacer 平均分配。

![Swift](../../RESOURCE/003_spacer.png)

## Image 的顯示和尺寸控制

Image 視圖主要用於顯示圖片，上節課學習的 SF Symbols 圖示只是 Image 的一個用法。

使用方法：

```swift
Image("imageName")
```

Image 雙引號內是圖片名稱，不需要寫後綴。

### 顯示圖片

首先，我們準備一張圖片。

![Swift](../../RESOURCE/003_img.jpg)

Xcode 選擇 Assets 資源文件夾，將圖片拖入到 Assets 中。

![Swift](../../RESOURCE/003_img1.png)

在 ContentView 中，使用 Image 顯示圖片：

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

注意：SwiftUI 的 Image 不支持播放 GIF 動畫（只能顯示靜態幀）。

### 控製圖片尺寸

在 SwiftUI 中，Image 預設以圖片的原始尺寸顯示，如果想要調整圖片的顯示大小，需要先使用 resizable 使圖片內容可縮放，再使用 frame 指定佈局尺寸。

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable 修飾符

resizable 修飾符允許圖片在佈局中參與縮放，而不是固定使用原始尺寸。

```swift
.resizable()
```

只有添加 resizable()，frame 才能真正改變圖片顯示尺寸。

如果省略 resizable：

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame 僅會為圖片提供佈局空間，但圖片本身大小不會變化。

### frame 修飾符

frame(width:height) 用於指定視圖的寬度和高度。

基本用法：

```swift
.frame(width: 10,height: 10)
```

例如，將圖片設置為 width 為 300，height 為 100 的長方形。


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

也可以單獨設置寬度或高度：

```swift
.frame(width: 200)
.frame(height: 100)
```

resizable + frame 的組合可以靈活控製圖片在界面中的顯示尺寸，同時保持可縮放能力。

### 縮放比例: scaledToFit 和 scaledToFill

當我們使用 frame 設置的寬高比例不一致時，圖片可能會被拉伸變形。

如果我們希望在保持圖片比例的情況下，使圖片適用可用佈局空間，可以使用 scaledToFit 或 scaledToFill。

**scaledToFit**

scaledToFit 會保持圖片的原始寬高比例，將圖片縮放以完全適應可用空間，不會裁剪圖片：

```swift
.scaledToFit()
```

或者

```swift
.aspectRatio(contentMode: .fit)
```

這種方式適合需要完整顯示圖片且不希望變形的場景。

如果每張圖片都設置相同的寬高，難免出現圖片拉伸的情況。

例如：

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

在未設置縮放比例的時候，圖片無法以原始尺寸顯示。

![Swift](../../RESOURCE/003_img4.png)

設置 scaledToFit 可以讓圖片保持原始比例。

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill 也可以保持圖片比例，但是會填充整個可用空間，如果比例不一致，超出部分會被裁剪：

```swift
.scaledToFill()
```

或者

```swift
.aspectRatio(contentMode: .fill)
```

這種方式適合需要圖片覆蓋整個區域的場景，例如作為背景圖或 banner。適用於圖片作為背景的場景。

**兩者的區別**

![Swift](../../RESOURCE/003_img6.png)

## 文字

在 SwiftUI 中，Text 用於顯示文字。

基本用法：

```swift
Text("FangJunyu")
```

我們在上一節課中學習了 Text，這節課我們將進一步學習如何控制字體大小和粗細，讓文字在視圖中更有表現力。

### 字體大小

使用 font 修飾符可以控制文字大小：

```swift
.font(.title)
```

例如：

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

常用字體大小（從大到小）：

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### 字體粗細

如果想要讓文字加粗，可以使用 fontWeight 修飾符：

```swift
.fontWeight(.bold)
```

例如：

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

常用字體粗細（從細到粗）：

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font 控制字體大小，fontWeight 控制字體粗細，兩者可以組合使用，豐富文字的表現力。

## 總結與實踐

到目前為止，我們學習了 SwiftUI 的預設佈局、Spacer、Image 和 Text 等基礎知識，這些內容已經足夠用來開發一些簡單的視圖。

例如：[Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google 界面非常乾淨，它包含了圖片和文字，我們可以嘗試從 SwiftUI 的角度分析 Google 的界面結構：

1. 整體分為三個部分：Google 圖示、搜索框和提示文字。可以使用 VStack 垂直排序。
2. Google 圖示是一張圖片，可以使用 Image 顯示。
3. 搜索框包含輸入框和圖示，在忽略輸入框的情況下，可以使用 Image 顯示搜索圖示。
4. 提示文本使用 Text 顯示，文字的水平排序可以使用 HStack，字體顏色可用 foregroundStyle 控制。

通過練習這些知識，我們可以製作一些簡單的視圖，加深對 Image 和 Text 視圖及其修飾符的理解和運用。
