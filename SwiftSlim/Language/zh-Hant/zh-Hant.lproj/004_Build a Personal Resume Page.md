# 構建個人簡歷頁面

本節課我們將製作一個簡單的個人簡歷視圖，並學習以下知識：

- cornerRadius
- spacing
- ScrollView

在構建過程中，我們將復習佈局、Text 和 Image 等知識，並實現間距控制以及內容滾動的效果。

## 個人簡歷

目標效果：

![Swift](../../RESOURCE/004_img.png)

**請先嘗試獨立完成，再繼續閱讀下面的講解。**

### 創建項目

創建新的 iOS 項目，或者繼續使用之前的項目。

預設的 ContentView 程式碼：

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
    }
}
```

現在清空程式碼，開始編寫自己的內容：

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### 整體結構

在實際開發中，我們通常會先設計整體結構。

我們的頁面包含：

1. 標題
2. 個人資訊
3. 個人介紹

我們在最外層添加一個 VStack：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack 可以確保視圖垂直排序，並且可以控制視圖的排列和間距。

### 標題

首先，我們創建一個 Text 顯示標題。

在這裡，我將標題顯示為自己的英文名稱：

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

標題通常加大加粗，這裡使用 font 和 fontWeight 修飾符：

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### 排版

SwiftUI 預設的對齊方式為 center，現在標題顯示在 ContentView 的中間位置。

![Swift](../../RESOURCE/004_img3.png)

我們需要將標題顯示在視圖的頂部，可以使用 Spacer 實現佈局的調整：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer 會佔據剩餘空間，將 Text 推到容器的上方。

![Swift](../../RESOURCE/004_img4.png)

### 留白

如果認為文字部分距離頂部過近，可以使用 padding 或者 Spacer。

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

設置 VStack 的 padding 頂部邊距為 20。

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

也可以使用 Spacer，設置 frame 的高度，可以獲得一個指定高度的留白。

實現效果：

![Swift](../../RESOURCE/004_img5.png)

### 圖片

我們準備一張自己的大頭照，放入 Assets 資源文件夾中。

![Swift](../../RESOURCE/004_img6.png)

在 ContentView 中使用 Image 顯示圖片：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

因為圖片的原尺寸比較大，我們需要使用 frame 控制顯示大小。

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

這時我們會發現一個問題：

如果 frame 的寬高比例與圖片原始比例不一致，圖片就會發生變形。

例如：

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

為了避免圖片變形，我們需要使用 scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

scaledToFit 的作用是：

在給定的 frame 範圍內，按照圖片原始比例進行縮放，並完整顯示圖片內容。

它不會強行拉伸圖片去填滿整個 frame，而是保持寬高比例不變，等比例縮放，直到某一邊剛好貼合邊界。

這意味著：

- 如果 frame 的寬度較小，圖片會以寬度為參考進行縮放。
- 如果 frame 的高度較小，圖片會以高度為參考進行縮放。
- 圖片始終保持原始比例，不會變形。

通常可以設置一個方向的尺寸。例如：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

這樣系統會根據寬度 140 自動計算合適的高度，同時保持圖片比例。

如果需要固定視覺比例或避免在複雜佈局中被壓縮，可以同時約束寬高。

### 圓角

如果希望圖片以圓角形式顯示，可以使用 cornerRadius 修飾符：

```swift
.cornerRadius(10)
```

例如：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

在 Image 的修飾符後面添加 cornerRadius(20)。

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) 表示對視圖的邊界進行裁切，並應用 20 的圓角半徑。

添加圓角之後，圖片的四個角會變為圓弧形狀，使視覺效果更加柔和、現代。

這種設計風格在當前界面設計中非常常見，例如 iOS 的應用圖示就採用了圓角矩形的形態（不過系統圖示使用的是連續曲率的超橢圓形，而不是簡單的圓角）。

### 個人資訊

現在開始實現圖片左側的個人資訊區域。從界面結構可以看出，個人資訊與圖片是橫向排列，需要使用 HStack 排序。

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

個人資訊內容是垂直排列。

![Swift](../../RESOURCE/004_img11.png)

因此，外層使用 HStack，個人資訊使用 VStack，文本內容使用 Text。

基本結構：

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**加粗字段標題**

為了區分字段名與字段值，可以對字段名使用 fontWeight：

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**文本左對齊**

VStack 預設是居中對齊，如果希望所有文本左對齊，需要設置對齊方式：

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading 表示按照左側對齊（在從左到右語言環境下）。

![Swift](../../RESOURCE/004_img14.png)

### 間距

如果希望個人資訊與圖片之間保留固定間距，我們前面學習的是 Spacer 設置留白：

```swift
Spacer()
    .frame(width: 10)
```

也可以使用 HStack 的 spacing 參數：

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 表示兩個子視圖之間的間距為 30 pt。

![Swift](../../RESOURCE/004_img15.png)

**spacing 是什麼？**

在 VStack、HStack、ZStack 中，spacing 可以控制子視圖之間的距離。

例如：

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

VStack 中的子視圖的間距會被設置為 10pt。

![Swift](../../RESOURCE/004_img16.png)

需要注意的是，spacing 只作用於"直接子視圖"，不會影響嵌套容器內部的佈局。

**控制列表內部間距**

如果希望字段之間增加間距，最直接的方式是 VStack 設置 spacing：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

這樣所有子視圖之間的間距都會變成 10 pt。

但是觀察界面會發現一個問題：

字段組之間有間距，同時字段名與字段值之間也出現了相同的間距。

這是因為 spacing 作用於當前容器的所有直接子視圖。

在這個結構中，每個 Text 都是外層 VStack 的直接子視圖，因此間距是統一的。

如果希望字段組之間有間距，字段名與字段值之間保持預設緊湊間距，可以將"字段名 + 字段值"視為一個邏輯整體，在外面用 VStack 包裹：

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

這時結構就變成外層 VStack 之間有間距，內層 VStack 之間為預設緊湊間距，因此字段名與字段值之間不會出現額外空隙。

![Swift](../../RESOURCE/004_img18.png)

### 個人介紹

接下來實現個人介紹區域。

從界面結構上看，介紹內容由多行文本組成，文本是縱向排列。

![Swift](../../RESOURCE/004_img19.png)

因此，可以使用 VStack 配合 Text：

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**增加間距**

現在個人資訊和個人介紹部分比較緊湊，樣式並不美觀。

![Swift](../../RESOURCE/004_img20.png)

因為它們都位於同一個外層容器中，可以在外層容器上控制整體間距：

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

實現效果：

![Swift](../../RESOURCE/004_img21.png)

**列表間距**

使用 spacing 設置個人介紹文本之間的間距：

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### 完成個人簡歷

現在，我們個人簡歷的基本框架已經完成。

![Swift](../../RESOURCE/004_img.png)

### 滾動視圖

現在頁面結構使用的是 VStack，介紹文本數量較少時沒有問題，但如果增加到 20 條、30 條甚至更多，內容高度就會超出屏幕。

例如：

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

這時就會出現兩個現象：

- 下方內容被截斷
- 頁面無法滾動

這不是 VStack 的問題，VStack 只是一個佈局容器，它不會自動提供滾動能力。

**什麼是 ScrollView**

ScrollView 是一個可滾動容器，適合大量超出屏幕大小的內容。例如垂直或水平列表。

基本結構：

```swift
ScrollView {
    ...
}
```

如果想要實現滾動效果，就需要將整個頁面內容包裹在 ScrollView 中：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

這樣，頁面整體成為一個可滾動區域，當內容超出屏幕高度時，可以自然滾動。

ScrollView 預設會顯示滾動條指示器，如果希望隱藏滾動條，可以設置：

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## 完整程式碼

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```