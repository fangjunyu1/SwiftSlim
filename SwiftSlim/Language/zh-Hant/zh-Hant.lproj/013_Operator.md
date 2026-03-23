# 運算符

這節課，我們將學習 Swift 運算符（Operators）。

當我們進行計算、比較或邏輯判斷時，都需要使用運算符。這些操作貫穿程式執行的各個環節，是程式設計中最基礎的能力之一。

```swift
let a = 100 * 8
```

在學習程式設計的過程中，很多人會發現：具備一定數學思維的人，往往更容易理解程式邏輯。這是因為程式設計本質上離不開“計算”和“規則判斷”，而這些正是運算符所承擔的核心作用。

在實際開發中，運算符不僅用於簡單的數字計算，還廣泛應用於各種具體場景。

例如，在方塊遊戲中，使用者拖到一個方塊到指定位置時，需要計算：

- 方塊的坐標位置
- 方塊可以填充的位置
- 判斷目標位置是否可用

這些“計算 + 判斷”的過程，本質上都依賴運算符來完成。

![Block](../../Resource/013_block.png)

學習運算符，不只是學習數字計算，更是為後續的界面佈局、資料處理和互動邏輯打下基礎。

## SwiftUI 中的計算執行方式

在 SwiftUI 中，通常通過 Button 觸發函式，再在函式中執行運算邏輯。

例如：

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

當點擊按鈕時，Console 輸出：

```
c: 20
```

在本節課中，我們統一將運算邏輯寫在 func 中，通過按鈕觸發執行，並使用 print 輸出結果。

在後續的示例中，為了簡化程式碼展示，我們將直接在程式碼中標注計算結果，而不再重復使用 print 輸出。

## Console 輸出管理

由於每次點擊都會產生輸出資訊，可以點擊 Console 區域右下角的清理按鈕，清理歷史日誌，方便查看當前結果。

![Console](../../Resource/013_console.png)

## Button 的另一種寫法

當按鈕只執行一個函式時，可以使用更簡潔的寫法：

```swift
Button(action: ) {
    // View
}
```

這個寫法中，action 指定按鈕點擊時需要執行的函式（無參數函式），花括號 {} 用於定義按鈕的視圖。

結合前面的 calculate 函式，可以寫為：

```swift
Button(action: calculate) {
    Text("Button")
}
```

當點擊按鈕時，會直接執行 calculate 函式。

因此，當按鈕邏輯簡單，且只調用一個函式時，使用 action 的寫法更清晰，也更符合程式碼規範。

## 算術運算符

算術運算符（Arithmetic Operators）用於數值計算：

- \+ 加法
- \- 減法
- \* 乘法
- / 除法
- % 取余（余數）

示例：

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

需要注意的是，Swift 是強類型語言，不會自動混合不同資料類型：

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

當兩個類型不同時，需要手動轉換類型。

## 比較運算符

比較運算符（Comparison Operators）用於判斷兩個值的關係，結果是 Bool：

- == 等於
- != 不等於
- \> 大於
- < 小於
- \>= 大於等於
- <= 小於等於

示例：

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

比較運算符常用於判斷語句。例如在“名言輪播”中，我們需要控制索引不超過數組範圍：

```swift
if index < sayings.count - 1 {
    index += 1
}
```

如果 index 小於 sayings.count - 1，比較結果為 true，if 語句中的程式碼會被執行；如果比較結果為 false，則不會執行後面的程式碼。

## 邏輯運算符

邏輯運算符（Logical Operators）用於組合多個條件：

- && 與（AND）
- || 或（OR）
- ! 非（NOT）

### && 與

當多個條件必須同時滿足時，使用 &&。

例如：

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

在這個程式碼中，包含兩個條件：age >= 18 和 age <= 100。

只有當這兩個條件同時為 true 時，legalAge 才為 true；只要有一個條件不成立，結果就是 false。

### || 或

當多個條件中只需要滿足一個時，使用 ||。

例如：

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

這段程式碼表示，只要 money >= 50 或者 creditCard >= 50 中任意一個成立，payAllowed 就為 true。

只有當兩個條件都不成立時，結果才為 false。

例如，在支付場景中，可以使用現金或者信用卡進行支付。如果兩者都不能支付，則支付失敗。

### ! 非

! 是邏輯非運算符（NOT），用於對 Bool 值取反。

可以理解為，! 把 true 變成 false，把 false 變成 true。

例如：

```swift
let allowed = true
let result = !allowed   // false
```

這裡的 !allowed 表示對 allowed 的值進行取反。

需要注意的是，! 和 != 是兩種不同的運算符，! 對 Bool 值取反，!= 是比較運算符，返回 Bool 值。

## 賦值運算符

賦值運算符（Assignment Operators）用於賦值或更新變數：

- = 賦值

在變數聲明或計算過程中，都會涉及賦值操作：

```swift
let a = 5
```

這段程式碼表示，將數值 5 賦值給變數 a。

### 復合賦值運算符

在實際開發中，除了基礎的賦值運算符，還經常使用“復合賦值運算符”，用於在原有值的基礎上直接進行計算並更新：

- +=
- -=
- *=
- /=

在前面“計數器”一節課中，我們已經簡單瞭解過復合賦值運算符。

例如，當點擊按鈕時，讓變數自動增加：

```swift
var num = 10
num += 5   // num = 15
```

這段程式碼表示，num 與 5 進行加法運算，再將結果重新賦值給 num。

因此，它等價於：

```swift
var num = 10
num = num + 5   // num = 15
```

## 三元運算符

Swift 中的三元運算符（Ternary Operator）會根據條件進行判斷，並返回兩個結果中的一個：

```swift
條件 ? 值1 : 值2
```

其執行邏輯為，如果條件為 true，返回“值1”；如果條件為 false，返回“值2”。

例如：

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

這段程式碼會判斷 showColor 的值：如果為 true，返回 Color.blue，背景顯示為藍色；如果為 false，返回 Color.clear，不顯示背景色。

提示：Color.clear 表示透明顏色（不顯示內容）。

### 和 if-else 的區別

三元運算符在邏輯上等價於 if-else 語句。

例如，上面的程式碼可以寫成：

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

兩者的執行邏輯完全一致，條件為 true 時，執行第一種結果；條件為 false，執行第二種結果。

在實際使用上，三元運算符的寫法更簡潔，更適合表達“二選一”的簡單判斷，常用於直接返回一個值。

在 SwiftUI 的 View 構建中，三元運算符非常常見，例如：

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

這種寫法可以在一行程式碼中，根據條件動態改變視圖效果。

## 範圍運算符

範圍運算符（Range Operators）用於表示區間：

- ... 閉區間（包含兩端）
- ..< 半開區間（不包含右邊）

例如：

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

可以理解為，1...3 表示從 1 到 3，包含 3；5..<8 表示從 5 到 8，但不包含 8。

擴展形式（僅瞭解）：

```
5...    // >= 5
...5    // <= 5
```

這個寫法表示“單側範圍”，常用於條件判斷或模式匹配中。

範圍運算符在後續學習 for 循環時使用，目前可以先理解為，一段連續的數值範圍。

## 練習運算符

下面，我們通過幾個簡單的示例，在視圖中練習運算符的作用。

### 1. 計算車輛總數

例如，某一個路口每天行駛 500 輛車，計算 30 天內行駛的車輛總數。

我們可以使用計算運算符：

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

這裡的計算過程是，每天 500 輛車，30 天總量為 500 × 30，最終得到 15000 輛車的總數。

### 2. 判斷內購會員

我們可以判斷某個人是否為內購會員，只要它開通了永久會員或訂閱會員中的任意一種，就視為會員。

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

這段程式碼中使用了 ||（或）運算符：lifeTime = false，表示沒有永久會員；subscription = true，表示有訂閱會員。

因為只需要滿足其中一個條件，isMember 就為 true。因此，這個人是內購會員。

## 總結

在 Swift 中，運算符是資料計算與邏輯判斷的基礎，就像 Text 顯示內容一樣，運算符用於處理資料本身。

從最簡單的數值計算，到複雜的邏輯判斷，再到視圖中的狀態控制和佈局計算，都離不開運算符的參與。

通過不同場景的練習，可以逐步熟悉並掌握本節課中介紹的各類運算符，這時後續學習的重要基礎。

### 擴展知識 - 位運算符

此外，Swift 還提供了一類更底層的運算符 —— 位運算符（Bitwise Operators）：

- &（按位與）
- |（按位或）
- ^（按位異或）
- ~（按位取反）
- \>>（右移）
- <<（左移）

例如：

```swift
let a = 6  // 二進制 110
let b = 3  // 二進制 011

print(a & b) // 2 (二進制 010)
print(a | b) // 7 (二進制 111)
print(a ^ b) // 5 (二進制 101)
print(~a)    // -7 (取反)
```

在 Swift 中，整數採用二進制補碼表示，取反後會得到對應的負數結果。

位運算符直接對二進制進行操作，通常用於底層資料處理、性能優化場景。

對於初學者來說，這類運算符的使用場景較少，在一般的 iOS 或 SwiftUI 開發中也不常見，因此這裡不做深入講解。

如果後續涉及到底層邏輯或性能優化，可以再進一步學習和理解。