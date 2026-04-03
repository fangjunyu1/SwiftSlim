# 名言輪播

本節課，我們將實現一個"名言輪播"的功能，並深入學習數組（Array）和條件判斷語句（if-else）等 Swift 基礎知識。

我們將展示如何保存多個名言，並通過按鈕互動實現名言的循環輪播。

![alt text](../../RESOURCE/011_word.png)

## 顯示名言

首先，我們需要在 SwiftUI 中顯示一條名言。

最簡單的方式是使用 Text 視圖：

```swift
Text("Slow progress is still progress.")
```

這個程式碼只能顯示一條固定的名言。如果想要展示多條名言並實現切換功能，我們需要將名言保存起來。

但是，常規的字串變數只能保存一條名言：

```swift
let sayings = "Slow progress is still progress."
```

如果需要保存多條名言，就需要為每一條名言聲明一個變數：

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

但在實際開發中，這種做法不僅繁瑣，而且由於每個變數都是獨立的，我們無法實現靈活的輪播切換。

為了方便管理多條名言，我們需要使用一個資料結構，將它們存儲在一起，這就是數組(Array)。

使用數組後，上述程式碼可以被保存為：

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**提示：在程式設計規範中，存儲多個元素的數組變數名通常使用複數形式，如 sayings，以體現其集合的特徵。**

## 數組

在 Swift 中，數組是存儲有序元素的集合，使用方括號 [] 表示。

```swift
[]
```

數組內部可以包含多個相同類型的元素，元素之間使用英文逗號 , 分隔。

例如：

```swift
[101, 102, 103, 104, 105]
```

可以把數組簡單的理解為一列火車：

![Array](../../RESOURCE/011_array1.png)

整列火車代表這個數組對象，每節車廂按照先後順序排列。

### 索引和元素訪問

因為數組是有序的，系統可以根據先後順序定位數組的具體元素。這種定位機制被稱為索引（Index）。

在 Swift（以及絕大多數程式語言）中，數組的索引是從 0 開始計算的，而不是 1。這意味著數組中的第一個元素對應的索引是 0，第二個元素是 1，以此類推。

![Array](../../RESOURCE/011_array2.png)

如果要訪問數組中的特定元素，只需在數組名稱後加上方括號，並在其中填入目標元素的索引值。

例如：

```swift
sayings[0]   // 101
sayings[1]   // 102
```

如果嘗試訪問一個超出數組有效範圍的索引，會發生“索引越界”（Index Out of Range）的問題。因此，在訪問數組時要小心，確保索引在有效範圍內。

**索引越界**

例如，當數組只有 5 個元素時，合法的索引範圍是 0 到 4。如果我們嘗試訪問 sayings[5]，程式將無法找到對應的“車廂”，從而引發“索引越界”錯誤，導致應用崩潰。

![Array](../../RESOURCE/011_array3.png)

### 操作數組

數組不僅支持靜態定義，還支持添加、刪除、修改元素等操作，還可以獲取數組的長度。

提示：如果需要修改數組，必須使用 var 聲明變數，而不是 let 常量。

**1. 新增元素**

可以使用 append 方法在數組末尾添加元素：

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. 刪除元素**

通過 remove(at:) 方法，可以刪除數組中的指定元素：

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. 修改元素**

直接使用索引對數組元素進行修改：

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. 統計數組長度**

使用 count 屬性獲取數組的元素個數：

```swift
var num = [0, 1, 2]
num.count   // 3
```

### 使用數組顯示名言

為了顯示多個名言，我們可以把名言保存到數組中，然後通過索引訪問並顯示。

首先，在 ContentView 中創建一個 sayings 數組來存儲名言，然後在 Text 視圖中通過索引讀取並顯示對應的名言：

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

在這裡，sayings[0] 表示數組中的第一個名言。

如果想要顯示不同的名言，只需要修改方括號內的索引值：

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### 定義名言的索引

為了實現名言的動態切換效果，我們不能在把索引“寫死”在 Text 視圖中。

我們需要創建一個變數，單獨保存當前顯示的索引值。

在 SwiftUI 中，我們可以使用 @State 聲明一個可變的索引：

```swift
@State private var index = 0
```

SwiftUI 會監聽 @State 包裝的變數，當 index 發生變化時，SwiftUI 會重新渲染視圖，並顯示對應的名言。

接著，我們使用 sayings[index] 動態獲取數組中的名言：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

當 index 值發生變化時，Text 會顯示不同的名言。

### 使用按鈕控制索引

為了控制名言的切換，我們可以使用 Button 來修改 index 值。每次點擊按鈕，index 自動加 1：

```swift
Button("Next") {
    index += 1
}
```

當我們點擊按鈕時，index 的值會從 0 變成 1，觸發視圖刷新，Text(sayings[index]) 就會讀取下一句名言。

然而，這裡有一個潛在的問題：如果連續點擊按鈕，index 會遞增到一個超出數組範圍的值，這會導致數組索引越界錯誤。例如，當 index 達到 5（數組索引範圍是 0 到 4）時，程式會崩潰。

為了防止數組索引越界，我們需要引入條件控制，確保 index 不會超出數組的範圍。可以通過 if-else 語句來判斷 index 是否小於數組的長度。

## 條件控制：if-else 語句

if-else 語句是 Swift 中最常用的條件分支語句，用於判斷條件是否成立，並根據條件的真假執行不同的程式碼塊。

基本結構：

```swift
if condition {
    // 當 condition 為 true 時執行的程式碼
} else {
    // 當 condition 為 false 時執行的程式碼
}
```

在 if 語句中，條件 condition 是一個布爾值（Bool 類型），可以是 true 或 false。當條件為 true 時，會執行 if 部分的程式碼，否則執行 else 部分的程式碼。

例如：

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

這個示例中，age 的值是 25，if 語句判斷 age > 18 是否成立，條件成立則輸出 "Big Boy"。

如果不需要 else 部分的程式碼，可以省略：

```swift
if condition {
    // 當 condition 為 true 時執行的程式碼
}
```

### 使用條件控制索引範圍

為防止數組索引越界，可以使用 if 語句來確保 index 不會超出數組的範圍：

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

邏輯分析：sayings.count 的值為 5（共有 5 條名言），所以 sayings.count - 1 的值為 4，這也是數組的最後一個有效索引。

當 index 小於 4 時，點擊按鈕執行加 1 的操作是安全的；一旦 index 達到 4，條件不再滿足，點擊按鈕就不會發生任何反應。

現在，程式碼已經實現了名言切換的功能：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### 循環名言

如果我們希望在顯示到最後一個名言後，點擊按鈕時重新顯示第一個名言，從而實現名言的循環顯示，可以通過 else 部分來實現：

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

當點擊按鈕時，如果 index 達到數組的最後一個元素，index 會重置為 0，開始循環顯示名言。

## 優化名言視圖

現在，我們的名言輪播邏輯已經實現，但我們還可以進一步優化界面，使其更美觀。

完整程式碼：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

在這個示例中，Text 視圖添加了一個白色半透明背景和圓角，Button 按鈕使用 .borderedProminent 樣式，VStack 設置了背景圖片。

知識點補充：在使用 background() 修飾符在處理圖像背景時，其預設行為是盡可能填滿當前視圖所在的佈局區域。在很多情況下，它能夠自然地延伸覆蓋至安全區域（Safe Area）。

現在，我們就實現了名言輪播的視圖。

![SwiftUI View](../../RESOURCE/011_word.png)

## 總結

通過本節課的學習，我們掌握了如何使用數組來存儲多個名言，並通過 if 和 if-else 語句來實現名言的輪播。

我們還瞭解了數組的基本操作，如新增、刪除、修改元素，以及如何防止數組索引越界。

這節課不僅講解了名言輪播的功能實現，還結合了數組和條件語句的基本用法，幫助我們掌握了處理資料和控制程式流程的能力。

## 擴展知識 - 多重條件判斷: if-else if-else 語句

在實際開發中，常常需要處理多個條件。比如，在某款遊戲中，當積分等於 1 時觸發事件 A，等於 2 時觸發事件 B，等於 3 時觸發事件 C，以此類推。

面對超過兩個條件分支的場景，我們就需要使用 if-else if-else 語句來進行多重判斷。

基本語法：

```swift
if conditionA {
    // 當 conditionA 為 true 時執行的程式碼
} else if conditionB {
    // 當 conditionB 為 true 時執行的程式碼
} else if conditionC {
    // 當 conditionC 為 true 時執行的程式碼
} else {
    // 所有條件均不滿足時執行的程式碼
}
```

在這種情況下，程式會按照順序檢查條件，並執行第一個滿足的條件。如果沒有條件滿足，就會執行 else 後面的程式碼。

在名言輪播中，我們也可以使用 if-else if-else 語句進行多重判斷：

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

當 index 為 0、1、2、3 時，每次點擊按鈕執行 index += 1，當 index 為 4（最後一個元素）時，將 index 重置為 0，實現循環。

else 分支用於兜底，防止出現非法值（例如 index 被錯誤修改）。

需要注意的是，這裡使用的 == 表示判斷"是否相等"，如果 if 語句判斷 index 和某個數字相等，則返回 true 並執行後面的程式碼塊。如果不相等，則繼續下一個 if 語句的判斷。

這種多重判斷有利於在不同的條件場景中，執行不同的程式碼。
