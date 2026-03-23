# 存錢罐

本節課，我們將開發一個簡單的“存錢罐”項目，功能簡單，包含完整的互動邏輯，非常適合初學者入門。

通過這個項目，我們將學習 TextField（輸入框）和 border 邊框，並瞭解資料綁定（$）。

最終目標是實現一個可以輸入金額，點擊按鈕保存並累計總金額的“存錢罐”項目。

實現效果：

![Piggy Bank](../../RESOURCE/014_view.png)

## 顯示總金額

首先，我們需要在視圖中顯示“存錢罐”的總金額。

在 ContentView 中，聲明一個變數來保存“存錢罐”的總金額。

```swift
@State private var amount = 0
```

接著，使用 Text 顯示這個金額：

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

這裡，使用 .font 和 .fontWeight 設置字體的大小和粗細。

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

當 amount 改變時，Text 顯示的總金額也會自動刷新。

## 輸入金額

“存錢罐”除了顯示總金額，還需要讓使用者可以“輸入”存取的金額，這就需要使用 SwiftUI 的視圖控件 TextField。

### TextField

TextField 是 SwiftUI 中用於輸入內容的視圖控件，通常用於單行輸入。

TextField 主要提供了兩種綁定格式：

**1. 綁定字串類型（String）**

```swift
TextField("Placeholder", text: $text)
```

適合名字、標題等文本輸入內容。

**2. 綁定數值類型（Int/Double）**

```swift
TextField("Amount", value: $number, format: .number)
```

適合年齡、薪資、金額等數字輸入內容。

format: .number 表示這個輸入框會按照“數字格式”進行解析和顯示。

#### 文本佔位符

TextField 的第一個參數是佔位符（Placeholder），用於提示使用者輸入內容：

```swift
TextField("input your name", text: $text)
```

當輸入框為空時，會顯示一段灰色的提示文字。

![textfield](../../RESOURCE/014_textfield.png)

#### 資料綁定

TextField 不負責持久化保存輸入內容，需要通過綁定變數來管理資料。

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

使用者輸入的內容會直接保存到 text 變數中，TextField 只負責輸入界面。

$ 表示綁定（Binding）：

```swift
$text
```

這不是普通變數，而是一個 Binding 類型。

它的作用是建立視圖和資料之間的連接：

當使用者在 TextField 中輸入內容時，text 會自動更新；當 text 發生變化時，TextField 也會同步更新。

例如：

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

在 TextField 中輸入內容，上方的 Text 會實時同步顯示。

![textField](../../RESOURCE/014_textfield1.png)

### 綁定數字類型

當需要輸入數字時，需要綁定對應類型的變數：

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

當使用者輸入金額時，TextField 會將輸入內容解析輸入內容，並自動更新 number 的值。

## 添加輸入框

在瞭解 TextField 的基本用法後，我們將它應用到“存錢罐”項目中。

“存錢罐”需要輸入“金額”，所以我們使用“綁定數值類型（Int/Double）”的方式，並新增一個 number 變數來保存使用者輸入的金額：

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

現在，TextField 預設顯示 number 的值（預設是 0）。

當清空輸入內容時，會顯示佔位符“Amount”。

這也再次說明，TextField 顯示的是綁定變數的值，而不是自己保存內容。

### 輸入框尺寸問題

在當前視圖中，我們會發現 TextField 沒有邊框，只顯示一個 0，內容看上去是左對齊的。

效果如下：

![textfield](../../RESOURCE/014_textfield2.png)

這是因為，TextField 預設會佔據父視圖的全部寬度。

我們可以通過添加背景色來驗證這一點：

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

效果如下：

![textfield](../../RESOURCE/014_textfield3.png)

可以看到 TextField 實際上填充了整行寬度。

### 設置固定寬度

如果我們希望輸入框更緊湊，可以使用 frame 限制其寬度：

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

效果如下：

![textfield](../../RESOURCE/014_textfield4.png)

### 添加邊框和內邊距

由於 TextField 預設沒有邊框，我們可以手動添加樣式：

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

現在，這個輸入框看上去更像一個“標準輸入框”。

![textfield](../../RESOURCE/014_textfield5.png)

## 邊框

在 SwiftUI 中，border 用於為視圖添加邊框。

基本用法：

```swift
border(Color.black, width: 1)
```

其中，Color.black 表示邊框的顏色，width 表示邊框的粗細。

在 TextField 中，我們使用：

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

這表示為輸入框添加一個黑色，寬度為 1 pt 的邊框。

也可以嘗試更換其他顏色，比如 Color.blue、Color.green，或者加粗邊框 width:2。

## 存錢按鈕

現在，我們有一個用於顯示總金額的 amount 變數，一個用於輸入金額的 TextField，以及與輸入框綁定的 number 變數。

當前程式碼如下：

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### 添加按鈕

下面，我們需要添加一個按鈕，來觸發存錢操作。

```swift
Button("Save") {
    
}
```

### 實現存錢邏輯

我們想要實現使用者輸入金額，點擊按鈕，金額會自動累計到總金額。


```swift
Button("Save") {
    amount += number
}
```

這裡使用“復合賦值運算符”，將使用者輸入的金額 number 疊加到 amount 總金額中。

### 重置輸入金額

現在有一個問題，每次點擊按鈕，輸入框中的金額不會清空。

當使用者輸入 10，點擊保存，輸入框中仍然保存 10，會影響到下次輸入的存錢金額。

這是因為 TextField 綁定的是 number，我們點擊按鈕時，只修改了 amount，number 沒有發生改變，所以輸入框仍然顯示舊值。

我們需要添加一個清除邏輯，當點擊按鈕後，先疊加存錢金額，再重置輸入的金額：

```swift
Button("Save") {
    amount += number
	number = 0
}
```

現在，使用者輸入金額並點擊按鈕時，輸入金額累加到總金額。number 重置為 0，以便使用者的下一次輸入。

我們就實現了“存錢罐”的所有存錢邏輯。

## 優化視圖

在功能完成之後，我們可以對界面進行簡單優化，添加背景圖片和按鈕樣式。

添加按鈕樣式：

```swift
.buttonStyle(.borderedProminent)
```

添加背景圖片：

```swift
.background {
    Image("1")
}
```

現在，我們完成了整個“存錢罐”的開發工作。

## 完整程式碼

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

實現效果：

![Piggy Bank](../../RESOURCE/014_view.png)

現在，我們可以嘗試存入 100 或者更多的錢，來檢測“存錢罐”邏輯是否存在問題。

或者把“存錢罐”運行在模擬器或實體設備中，來體驗我們開發的“存錢罐”應用。

### 調試輸出

為了驗證邏輯是否正確，我們還可以在按鈕中加入調試邏輯，以驗證輸入的金額是否正確：

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

每次存錢並點擊按鈕時，我們可以看到對應的調試輸出，以檢查程式碼邏輯是否存在問題。

```
---Saving---
amount:11
number:0
```