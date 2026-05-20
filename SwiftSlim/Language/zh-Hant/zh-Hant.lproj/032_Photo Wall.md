# 照片牆

這節課，我們將製作一个照片牆頁面。

![view](../../../Resource/032_view13.png)

在這個案例中，我們會複習 `extension`、`self` 和實例的知識，並學習 SwiftUI 中常用的 `Shape` 圖形。

通過這些知識，我們可以把普通圖片裁剪成圓形、圓角矩形、膠囊形、橢圓形等不同樣式，並給照片新增邊框效果。

本節課會用到幾个新的知識點：`Shape`、`clipShape`、`strokeBorder` 和 `overlay`。

其中，`clipShape` 用來裁剪視圖形狀，`strokeBorder` 用來繪製形狀邊框，`overlay` 用來在視圖上方疊加新的視圖。

## 圖片素材

在開始之前，我們需要準備幾張圖片。

你可以使用自己的照片，也可以使用本節課提供的範例圖片。

本節課的照片範例來自 [Pixabay](https://pixabay.com/) 網站：

[風景](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[狐狸](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[建築](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[花朵](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[天鵝](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

圖片下載後，將它們新增到 `Assets` 資源資料夾中，並依序命名為 `1`、`2`、`3`、`4`、`5`。

![assets](../../../Resource/032_view17.png)

這樣，我們就可以在 SwiftUI 中通過 `Image("1")`、`Image("2")` 的方式顯示圖片。

## 顯示照片

首先，我們在 `ContentView` 中顯示 5 張照片：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

顯示效果：

![view](../../../Resource/032_view.png)

在這段程式碼中，我們使用 `ScrollView` 實作照片列表的捲動顯示，並使用 `VStack` 讓多張圖片從上到下排列。

每張圖片都通過 `.resizable()`、`.scaledToFit()` 和 `.frame(width: 300)` 設定圖片的顯示效果，讓圖片可以縮放、保持比例完整顯示，並限製圖片寬度。

`VStack` 上的 `.padding(.vertical, 100)` 用來增加上下間距，避免第一張和最後一張照片過於貼近螢幕邊緣。

最後的 `.ignoresSafeArea()` 表示讓捲動視圖忽略安全區域，使照片捲動時可以延伸到螢幕頂部和底部，頁面顯示更完整。

不過，現在 5 張圖片都使用了相同的修飾符：

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

當我們看到重複程式碼時，就可以考慮使用 `extension` 進行整理。

## 使用 extension 整理圖片樣式

我們可以給 `Image` 擴充一个照片牆专用方法：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

這裡，我們給 `Image` 型別擴充了一个 `photoGalleryStyle` 方法。

這個方法內部包含了前面重複使用的 `.resizable()`、`.scaledToFit()` 和 `.frame(width: 300)`。也就是說，它把圖片縮放、比例顯示和寬度設定這些程式碼整理到了一起。

使用這個擴充後，原來的圖片程式碼：

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

就可以簡化為：

```swift
Image("1")
    .photoGalleryStyle()
```

這樣，每張圖片只需要呼叫 `.photoGalleryStyle()`，就可以應用相同的照片牆樣式，程式碼會更簡潔，也更方便後續統一修改。

## 理解 self

在擴充方法中，我們寫了 `self`：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

這裡的 `self`，表示呼叫這個方法的目前圖片實例。

例如：

```swift
Image("1")
    .photoGalleryStyle()
```

這段程式碼中，`photoGalleryStyle()` 是由 `Image("1")` 呼叫的，所以方法內部的 `self` 就表示這張 `Image("1")` 圖片。

可以簡單理解為：誰呼叫這個方法，`self` 就表示誰。

需要注意的是，SwiftUI 的修飾符會不斷回傳新的視圖結果。因此，`photoGalleryStyle()` 回傳的是一个被修飾後的視圖，而不是簡單地回傳原始的 `Image` 本身。

## 照片形狀

現在，照片已經可以正常顯示了。不過，這些照片預設都是矩形，看起來比較普通。

如果只是想讓照片擁有圓角，可以直接使用 `.cornerRadius()`：

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

顯示效果：

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` 表示給圖片新增 `20 pt` 的圓角。對於普通的圓角圖片來說，這種寫法已經足夠。

不過，`.cornerRadius()` 只能處理圓角效果，適合製作普通的圓角圖片。如果我們想讓照片變成更多不同的形狀，僅靠這個修飾符就不夠了。

這時，就需要使用 SwiftUI 中的 `Shape`。`Shape` 可以表示不同的圖形，再配合 `clipShape`，就可以把圖片裁剪成對應的形狀。

## 認識 Shape

在 SwiftUI 中，`Shape` 表示圖形。它和 `View` 一樣，都是 SwiftUI 中非常常用的型別。

常見的 `Shape` 有圓形、矩形、圓角矩形、膠囊形和橢圓形。為了更直觀地觀察不同圖形的外觀，下面的範例會給每个圖形設定不同的顏色和大小。

在這些範例中，`.fill()` 用來給圖形填入顏色，`.frame()` 用來設定圖形的顯示大小。顏色只是為了區分不同圖形，並不是圖形本身的固定顏色。

### Circle 圓形

`Circle` 表示圓形。它常用於頭像、圓形按鈕、圓形圖片等介面效果。

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle 矩形

`Rectangle` 表示矩形。它是最基礎的圖形之一，也可以用來製作背景、分割區域或普通邊框。

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle 圓角矩形

`RoundedRectangle` 表示圓角矩形。`cornerRadius` 用來設定圓角大小。

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule 膠囊形

`Capsule` 表示膠囊形。它的兩端是圓弧形，常用於膠囊按鈕、標籤背景等介面效果。

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse 橢圓形

`Ellipse` 表示橢圓形。它和 `Circle` 類似，但寬度和高度不相同時，會顯示為橢圓。

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

通過這些範例可以看到，`Shape` 本身可以直接顯示為圖形。接下來，我們會使用這些 `Shape` 配合 `clipShape` 裁剪照片，讓照片顯示成不同形狀。

## 使用 clipShape 裁剪照片

現在，我們可以使用 `clipShape` 把照片裁剪成不同形狀。

例如，把第一張照片裁剪成圓形：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

這段程式碼表示：先顯示一張圖片，然後使用 `Circle()` 把它裁剪成圓形。

![view](../../../Resource/032_view2.png)

`clipShape` 的基本寫法是：

```swift
.clipShape(形狀)
```

在視圖後面新增 `.clipShape(...)`，括號中填寫需要裁剪成的圖形。

例如：

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

現在，我們把 5 張照片分別裁剪成不同形狀：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

顯示效果：

![view](../../../Resource/032_view8.png)

其中，`Rectangle()` 裁剪後的效果和普通矩形照片接近，所以視覺變化不明顯，主要用於和其他形狀進行對比。

現在，照片不再只是普通矩形，而是擁有了不同的形狀。

## 新增照片邊框

如果我們想給圓形照片新增邊框，可能會想到使用 `border`：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

但是，這樣得到的通常不是圓形邊框，而是一个矩形邊框。

![view](../../../Resource/032_view9.png)

這是因為 `border` 是按照視圖的矩形區域新增邊框，而不是按照 `clipShape` 裁剪後的形狀新增邊框。

所以，如果我們想要圓形邊框，就不能直接使用 `border`。

## 使用 strokeBorder 繪製形狀邊框

在 SwiftUI 中，`strokeBorder` 可以給這些常見的 `Shape` 繪製內部邊框。

例如，繪製一个圓形邊框：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

這段程式碼表示：給 `Circle` 繪製一个棕色邊框，邊框寬度為 `10 pt`。

![view](../../../Resource/032_view12.png)

這裡需要注意，`strokeBorder` 不是直接給照片新增邊框，而是給 `Circle()` 這個圖形繪製邊框。

也就是說，這段程式碼得到的只是一个獨立的圓形邊框，它和照片還沒有關係。

如果想讓這個圓形邊框顯示在照片上方，就需要繼續使用 `overlay`，把邊框疊加到照片上。

## 使用 overlay 疊加邊框

`overlay` 是一个視圖修飾符，可以在目前視圖上方疊加新的視圖。

它的基本結構可以理解為：

```swift
目前視圖
    .overlay {
        疊加的視圖
    }
```

在這個案例中，目前視圖是已經裁剪成圓形的照片：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

我們要疊加上去的新視圖，是一个圓形邊框：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

所以，可以把照片和邊框組合起來：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

這裡的 `overlay` 表示在目前視圖上方疊加一个新的視圖。

在 `overlay` 中，邊框會跟隨目前照片的顯示範圍疊加，所以不需要再單獨設定 `frame`。只要邊框形狀和裁剪形狀一致，邊框就能貼合照片。

![view](../../../Resource/032_view10.png)

最終的效果是，圓形照片上方覆蓋了一个圓形邊框。

和 `ZStack` 相比，`overlay` 更適合這種“給目前視圖新增裝飾”的場景。照片是主體，邊框只是附加效果，因此使用 `overlay` 會更清楚。

## 完成照片牆

現在，我們給每張照片新增對應的形狀和邊框：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

顯示效果：

![view](../../../Resource/032_view13.png)

這樣，一个基礎照片牆頁面就完成了。

在這個頁面中，我們使用 `ScrollView` 實作捲動顯示，使用 `Image` 顯示照片，使用 `clipShape` 裁剪照片形狀，並通過 `overlay` 和 `strokeBorder` 新增邊框。

## 完整程式碼

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## 總結

這節課，我們完成了一个照片牆頁面。

![view](../../../Resource/032_view13.png)

在這個案例中，我們先使用 `Image` 顯示照片，再通過 `extension` 給 `Image` 擴充了一个 `photoGalleryStyle` 方法，用來整理重複的圖片樣式程式碼。

隨後，我們學習了 SwiftUI 中常見的 `Shape`，例如 `Circle`、`Rectangle`、`RoundedRectangle`、`Capsule` 和 `Ellipse`。這些圖形不仅可以直接顯示，也可以配合 `clipShape` 用來裁剪視圖。

例如：

```swift
.clipShape(Circle())
```

表示把視圖裁剪成圓形。

最後，我們使用 `overlay` 和 `strokeBorder` 給照片新增了對應形狀的邊框。需要注意的是，`border` 通常按照視圖的矩形區域繪製邊框，如果想讓邊框跟隨圓形、膠囊形或橢圓形，就更適合使用相同的 `Shape` 進行疊加。

通過這節課，我們不仅完成了照片牆效果，也理解了 `Shape`、`clipShape`、`strokeBorder` 和 `overlay` 在介面中的常見組合方式。

## 課後練習

### 1、新增照片牆背景

給照片牆頁面新增一个全螢幕背景圖片。

要求：背景圖片可以鋪滿整个螢幕，並忽略安全區域。

### 2、漸層邊框

將現有的單色邊框修改為線性漸層邊框。

可以嘗試使用 `LinearGradient` 實作更豐富的邊框效果。

### 3、擬真照片邊框

從網路上搜尋一些真實照片邊框樣式，嘗試使用 `overlay` 疊加圖片邊框，讓照片看起來更接近真實相框效果。

練習顯示效果：

![button](../../../Resource/032_view15.jpeg)

### 4、實作圓角按鈕邊框

在實際開發中，按鈕經常會使用圓角矩形邊框。

請嘗試製作一个圓角按鈕，並使用 `RoundedRectangle` 和 `strokeBorder` 給按鈕新增圓角邊框。

練習顯示效果：

![button](../../../Resource/032_view14.png)

### 思考題

如果不想使用單色邊框，也不想使用漸層邊框，而是想讓邊框呈現某種花紋效果，應該如何實作？

可以嘗試搜尋資料，瞭解 `overlay`、`mask` 或 `ImagePaint` 等相關用法。

練習顯示效果：

![button](../../../Resource/032_view16.png)
