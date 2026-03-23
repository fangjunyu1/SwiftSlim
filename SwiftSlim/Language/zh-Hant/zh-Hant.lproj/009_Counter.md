# 計數器

在前兩節課中，我們學習了變數、常量、按鈕和方法。

這一節課，我們將把這些知識結合起來，製作一個簡單的計數器應用。

在這個例子中，我們將學習如何保存和改變變數，以及使用 @State 管理變數。

## 實現計數器

計數器通常用於記錄需要不斷累加的數量。例如，跳繩次數、跑步圈數等計數場景。

下面我們來實現一個簡單的計數器：顯示一個數字和按鈕，點擊按鈕讓數字增加。

![Num](../../RESOURCE/009_num.png)

### 顯示數字

首先，我們使用 Text 顯示數字。

```swift
Text("0")
```

但是，如果數字需要變化，就不能直接寫死"0"，而應該使用變數保存數字。

```swift
var num = 0
```

然後在 Text 中顯示變數：

```swift
Text("\(num)")
```

這裡使用了字串插值 \\()，將數字轉換成字串進行顯示。

### 按鈕增加數字

接下來，我們添加一個按鈕。

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

按鈕被點擊時，我們希望數字增加。

因此可以在按鈕中修改變數：

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

這段程式碼表示：當點擊按鈕時，會計算 num + 1，並將結果賦值給 num。

### 更簡潔的寫法

Swift 提供了一種更簡潔的寫法：

```swift
num += 1
```

它等價於:

```swift
num = num + 1
```

這種寫法叫做“復合賦值運算符”。

Swift 中常見的復合賦值運算符有：

```
+=   加法賦值
-=   減法賦值
*=   乘法賦值
/=   除法賦值
%=   取余賦值
```

例如：

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### 完整程式碼

現在，我們可以寫出一個簡單的計數器：

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

但是，此時程式碼無法正常運行。

### 出現錯誤

Xcode 會提示：

```
Cannot assign to property: 'self' is immutable
```

表示無法修改屬性，因為視圖是不可修改的。

為什麼會這樣？

## SwiftUI 的工作原理

在 SwiftUI 中：**界面是由資料驅動的**，這意味著當資料變化時，界面會自動刷新。

但需要注意的是，只有在狀態（如 @State、 @Binding）發生變化時，SwiftUI 才會監控變化並刷新視圖。

如果使用普通變數，SwiftUI 只會在視圖創建時讀取一次變數的值，之後即使變數發生改變，界面也不會更新。

例如：

```swift
var num = 0   // 0
num = 1   // 0
```

在上面的例子中，num 是普通變數，雖然它的值發生了變化，但 SwiftUI 不會更新視圖，界面依然會顯示初始的 0。

![Num](../../RESOURCE/009_state.png)

因此，只有當資料被標記為狀態（如使用 @State、@Binding 等屬性包裝器）時，SwiftUI 才會自動監控它的變化並更新視圖。

## @State 屬性包裝器

在 SwiftUI 中，如果需要修改變數並更新視圖，就必須使用 @State。

```swift
@State var num = 0
```

@State 會讓 SwiftUI 監聽這個變數。

當變數發生變化時，SwiftUI 會重新計算視圖，並更新視圖。

完整程式碼：

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

現在，當點擊按鈕時：

```swift
num += 1
```

SwiftUI 會檢測到 num 發生變化，然後自動更新視圖。

![Num](../../RESOURCE/009_state1.png)

## @State 的使用規則

在實際開發中，@State 通常遵循兩個規則。

### 1. @State 通常使用 private

@State 變數通常只在當前類型（如當前 View 結構體）中使用，因此一般會寫成：

```swift
@State private var num = 0
```

這樣可以避免其他視圖直接訪問或修改這個變數。

現在還沒有學習 private，可以簡單的理解為：

**private 修飾的內容只能在當前視圖中使用，外面的視圖無法使用。**

### 2. @State 只用於當前視圖的狀態

@State 適用於當前 View 自己管理的資料。

例如，輸入框內容、開關狀態。

```swift
@State private var isOn = false
@State private var text = ""
```

如果資料需要在多個視圖之間共享，就需要使用其他狀態類型，例如 @Binding 或 @Observable。

這些內容會在後面的課程中學習。

### 減少按鈕

計數器除了增加，還可以減少。

我們可以添加一個 - 按鈕。

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

然後使用 HStack 水平排列按鈕：

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

效果：

![Num](../../RESOURCE/009_num1.png)

點擊 + 按鈕時，數字會加 1；點擊 - 按鈕時，數字會減 1。

### 重置按鈕

我們還可以添加一個重置按鈕，將數字變為 0。

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

當點擊重置按鈕時，num 被賦值為 0。

效果：

![Num](../../RESOURCE/009_num2.png)

點擊 0 按鈕時，數字變為 0。

### 自定義按鈕

目前我們的按鈕還只能顯示文本：

```swift
Button("+") {

}
```

這種寫法的按鈕只能顯示文本內容，例如 + 或 -。

在實際開發中，我們通常希望按鈕的外觀更加豐富，例如使用圖示或其他視圖。

SwiftUI 允許我們自定義按鈕的顯示內容，這時可以使用按鈕的另一種寫法：

```swift
Button(action: {

}, label: {

})
```

在這個寫法中，action 表示按鈕點擊執行的程式碼，label 顯示按鈕的視圖。

例如，我們可以讓按鈕顯示一個 SF Symbols 圖示：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

這樣按鈕顯示的就不再是文本，而是一個圖示。

### 優化計數器界面

為了讓計數器的界面更清晰，我們還可以調整數字的顯示樣式。例如放大數字：

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

接下來，我們把按鈕的顯示內容也改為圖示，並適當放大圖示尺寸：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

同樣地，我們也可以把減少按鈕和重置按鈕改為圖示形式：

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

現在按鈕顯示的是 SF Symbols 圖示，界面也會更加直觀。

![Num](../../RESOURCE/009_num3.png)

## 總結

本節課通過實現一個簡單的計數器，綜合練習了變數、Text 和 Button 的使用。我們使用變數保存數字，並通過按鈕控制數字增加或減少，同時學習了復合賦值運算符，例如 num += 1 和 num -= 1。

在實現過程中，我們瞭解了 SwiftUI 的工作方式：界面由資料驅動。當資料發生變化時，界面才會刷新。因此需要使用 @State 保存可變化的狀態，當 @State 變數改變時，SwiftUI 會自動更新視圖。

最後，我們對界面進行了簡單優化，調整了 Text 的字體樣式，並使用 Button(action:label:) 自定義按鈕內容，使按鈕可以顯示圖示，從而讓計數器界面更加清晰和美觀。

現在，我們已經接觸到了 SwiftUI 視圖的基本使用方式。在 SwiftUI 中，大部分界面都是通過變數驅動的。當變數發生變化時，SwiftUI 會自動更新視圖。因此，在開發 SwiftUI 應用時，我們通常需要先設計好需要保存的資料，再通過這些資料來構建界面和互動邏輯。

## 完整程式碼

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```