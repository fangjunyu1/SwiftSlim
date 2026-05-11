# 課程卡片

這節課是一個階段複習課，我們將完成一個“課程卡片”。

透過這個練習，我們可以複習前面學過的 `Text`、`Image`、`VStack`、`HStack`、`Spacer()`、`.padding()`、`.background()`、`.cornerRadius()` 等內容，並學習如何把多個小視圖組合成一個完整的視圖模組。

課程卡片效果：

![view](../../../Resource/026_view.png)

這個課程卡片主要包含幾個部分：

- 課程等級：`入門`
- 課程內容：`20+ 節課`
- 課程標題：`SwiftUI 入門教學`
- 課程描述
- 按鈕：`開始學習`
- 課程背景：Swift 圖示和靛青色背景

我們可以在 `ContentView` 中完成這個視圖。

## 頂部區域

首先，製作課程卡片的頂部區域。

![view](../../../Resource/026_view1.png)

頂部區域左側顯示課程等級，右側顯示課程內容。

因為這兩個內容是橫向排列，所以可以使用 `HStack`。

```swift
var topView: some View {
    HStack {
        Text("入門")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ 節課")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

這裡我們把頂部區域拆成了一個計算屬性：

```swift
var topView: some View
```

這樣做的好處是可以讓 `body` 更清晰。

頂部區域主要用到了這些內容：

- `HStack`：讓兩個文本橫向排列。
- `Text`：顯示文字內容。
- `Spacer()`：把左側文本推到左邊，把右側文本推到右邊。
- `.font(.footnote)`：設置較小的文字樣式。
- `.fontWeight(.bold)`：設置文字加粗。
- `.foregroundStyle(Color.white)`：設置前景色為白色。
- `.padding(.vertical, 10)`：設置上下內邊距。
- `.padding(.horizontal, 16)`：設置左右內邊距。
- `.background(Color.white.opacity(0.15))`：設置半透明白色背景。
- `.cornerRadius(20)`：設置圓角。

這裡的 `入門` 使用了兩個方向的 `.padding()`：

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

這樣可以讓文字上下和左右都有空間，看起來更像一個標籤。

`Color.white.opacity(0.15)` 表示不透明度為 `15%` 的白色，也就是非常淡的白色。

### 添加卡片背景

前面我們創建了 `topView`，但只是創建視圖還不會自動顯示。

在 SwiftUI 中，真正顯示在界面上的內容，需要寫在 `body` 中。

所以，可以先把 `topView` 放到 `body` 中顯示：

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

此時會看到頂部區域已經顯示出來：

![view](../../../Resource/026_view2.png)

不過，因為 `topView` 中的文字是白色，而預設背景也是淺色，所以在淺色模式下可能不太容易看清。

因此，我們可以在外層添加一個 `VStack`，然後給整個區域設置內邊距、背景色和圓角：

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

顯示效果：

![view](../../../Resource/026_view3.png)

這裡的 `VStack` 目前只放了一個 `topView`，看起來好像不是必須的。

但後面我們還會繼續添加課程標題、課程描述和按鈕區域。它們都是上下排列的內容，所以這裡提前使用 `VStack`，可以方便後續繼續組合視圖。

這裡有兩個 `.padding()`，它們的作用不同。

第一個 `.padding(20)` 寫在 `.background()` 前面：

```swift
.padding(20)
.background(Color.indigo)
```

它控制的是卡片內部的邊距，也就是內容和背景邊緣之間的距離。

第二個 `.padding(30)` 寫在 `.background()` 後面：

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

它控制的是卡片外部的邊距，也就是整個卡片和螢幕邊緣之間的距離。

![view](../../../Resource/026_view4.png)

所以，同樣是 `.padding()`，寫在不同位置，效果也會不同。

## 內容區域

接著製作課程卡片的內容區域。

顯示效果：

![view](../../../Resource/026_view5.png)

內容區包含課程標題和課程描述，它們是上下排列的，所以使用 `VStack`。

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI 入門教學")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("從零開始學習 SwiftUI，系統掌握 Apple 的宣告式 UI 開發。透過清楚的講解和實用案例，你將逐步掌握佈局、互動和狀態管理，並建立美觀又實用的 App 介面。")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

顯示效果：

![view](../../../Resource/026_view6.png)

這裡的 `VStack` 中使用了兩個參數：

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` 表示讓 `VStack` 內部的視圖左對齊。

`spacing: 10` 表示讓 `VStack` 內部的視圖之間保持 `10 pt` 的間距。

所以，課程標題和課程描述會從左側開始排列，並且它們之間會保留一定距離。

課程描述比較長，如果全部顯示出來，卡片會變得很高，所以這裡使用 `.lineLimit()` 限制顯示行數：

```swift
.lineLimit(3)
```

它表示最多顯示 `3` 行，當內容超過限制行數時，超出的部分會被省略。

### 視圖左對齊

這裡還需要注意一點。

`VStack(alignment: .leading)` 只能控制 `VStack` 內部視圖的對齊方式，它不會直接控制 `VStack` 自己在外部容器中的位置。

例如，如果課程描述比較短：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI 入門教學")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("一些簡短內容。")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

顯示效果：

![view](../../../Resource/026_view7.png)

可以看到，課程標題和課程描述雖然在 `VStack` 內部是左對齊的，但整個 `VStack` 並沒有靠到卡片最左側。

這是因為，當內容比較短時，`VStack` 的寬度也會比較窄。外層容器在佈局時，可能會把這個較窄的 `VStack` 放在中間。

可以理解為：`VStack(alignment: .leading)` 負責內部左對齊。
但它不負責把整個內容區域推到最左側。

如果希望整個內容區域真正靠左，可以在外面再包一層 `HStack`，並添加 `Spacer()`：

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI 入門教學")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("一些簡短內容。")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

顯示效果：

![view](../../../Resource/026_view8.png)

這裡的 `HStack` 是水平佈局。

`Spacer()` 會佔用右側剩餘空間，從而把左側的 `VStack` 推到最左邊。

因此，`HStack + Spacer()` 可以用來控制整個內容區域的位置。

在實際課程卡片中，課程描述比較長，通常會佔據較多寬度，所以這個問題不一定明顯。但理解這個區別很重要，因為後面製作短文本佈局時，經常會遇到類似情況。

### 控制內部視圖之間的距離

前面我們在 `VStack` 中寫了 `spacing: 10`：

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` 用來控制內部視圖之間的距離。

如果不設置 `spacing`，`VStack` 也會有預設間距，但預設間距不一定符合我們想要的效果。

在這裡，課程標題和課程描述距離太近會顯得擁擠，所以使用：

```swift
spacing: 10
```

讓它們之間保留一點空間。

顯示效果：

![view](../../../Resource/026_view9.png)

同樣，頂部區域和內容區域也是上下排列的，也可以使用 `spacing` 控制它們之間的距離。

現在，把 `topView` 和 `contentView` 放到 `body` 中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

顯示效果：

![view](../../../Resource/026_view10.png)

這裡的 `VStack(spacing: 20)` 控制的是 `topView` 和 `contentView` 之間的距離。

也就是說：

```swift
VStack(alignment: .leading, spacing: 10)
```

控制的是課程標題和課程描述之間的距離。

```swift
VStack(spacing: 20)
```

控制的是頂部區域和內容區域之間的距離。

它們都是 `spacing`，但作用在不同的 `VStack` 上，所以影響的範圍也不同。

這樣，內容區域的視圖就完成了。

## 按鈕區域

接著製作底部按鈕區域。

顯示效果：

![view](../../../Resource/026_view11.png)

按鈕區域主要由一個播放圖示和一段文字組成。

我們可以使用 `Image` 顯示播放圖示，使用 `Text` 顯示按鈕文字。

這裡先製作一個按鈕外觀：

```swift
var buttonView: some View {
    HStack {
        Button {
            print("點擊按鈕")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("開始學習")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

顯示效果：

![view](../../../Resource/026_view12.png)

這裡使用了兩個 `HStack`：

裡面的 `HStack` 用來橫向排列圖示和文字：

```swift
HStack {
    Image(systemName: "play.fill")
    Text("開始學習")
}
```

外面的 `HStack` 配合 `Spacer()`，用來讓這個按鈕外觀靠左顯示：

```swift
HStack {
    ...
    Spacer()
}
```

當點擊按鈕時，控制台會輸出 `點擊按鈕`。

## 基礎卡片完成

現在，把頂部區域、內容區域和按鈕區域組合起來：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

顯示效果：

![view](../../../Resource/026_view13.png)

到這裡，一個基礎的課程卡片已經完成。

## Swift 圖示背景

最後，我們給卡片添加一個半透明的 Swift 圖示背景。

![view](../../../Resource/026_view.png)

前面我們使用過 `Color.indigo` 作為背景色。實際上，`.background()` 除了可以添加顏色，也可以添加一個完整的視圖。

所以，我們可以先創建一個專門的背景視圖：

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

在這個背景視圖中，我們使用 `VStack`、`HStack` 和 `Spacer()`，把 Swift 圖示推到右下角。

因為 Swift 圖示只是作為裝飾背景，所以這裡使用了半透明的白色：

```swift
Color.white.opacity(0.15)
```

這樣圖示不會過於明顯，也不會影響前面的文字內容。

接著，把 `backgroundView` 添加到卡片中：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

實現效果：

![view](../../../Resource/026_view14.png)

這裡連續使用了兩個 `.background()`：

```swift
.background(backgroundView)
.background(Color.indigo)
```

第一個 `.background()` 用來添加 Swift 圖示背景。
第二個 `.background()` 用來添加靛青色背景。

這樣，Swift 圖示會顯示在靛青色背景上面，並且作為卡片背景的一部分顯示。

從這裡可以看出，`.background()` 除了可以添加顏色，也可以添加自定義視圖。多個 `.background()` 還可以組合使用，從而實現更豐富的背景效果。

到這裡，一個完整的課程卡片就完成了。

## 總結

這節課透過一個課程卡片，複習了 SwiftUI 中常見的基礎佈局方式。

我們使用 `Text` 顯示文字，使用 `Image` 顯示系統圖示，使用 `VStack`、`HStack` 和 `Spacer()` 控制視圖排列。

學習了 `.lineLimit()`，它可以限制文本最多顯示的行數。當內容超過限制時，超出的部分會被省略。

同時，我們也複習了 `.padding()`、`.background()`、`.cornerRadius()`、`.foregroundStyle()` 等常用修飾符。

完成這節課後，我們已經可以把多個小視圖組合成一個完整的卡片模組。

這也是 SwiftUI 開發中非常常見的思路：先拆分小視圖，再組合成完整界面。

## 完整代碼

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("入門")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ 節課")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI 入門教學")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("從零開始學習 SwiftUI，系統掌握 Apple 的宣告式 UI 開發。透過清楚的講解和實用案例，你將逐步掌握佈局、互動和狀態管理，並建立美觀又實用的 App 介面。")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("點擊按鈕")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("開始學習")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```

