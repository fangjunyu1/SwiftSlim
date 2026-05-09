# 計算屬性

這節課，我們主要學習計算屬性。

計算屬性用於根據已有資料計算新的結果。它可以計算數值，也可以計算 SwiftUI 檢視中需要顯示的內容。

例如：

```swift
let a = 10
let b = 20
let c = a + b
```

這裡的 `c` 表示 `a` 和 `b` 相加後的結果。

在一般程式碼中，這種寫法很常見。

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

提示：在 `Button` 的點擊事件中，可以執行一般 Swift 程式碼。

但是，如果把類似的程式碼直接寫在 SwiftUI 檢視的屬性中，就會出現問題。

例如：

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

這段程式碼會報錯。

表面上看，`a` 和 `b` 已經寫在 `c` 前面，所以似乎可以計算出 `c` 的值。

但是，在宣告 struct 的屬性時，不能直接使用這種寫法。

## 為什麼 c 不能直接用 a + b 計算？

原因是 `a`、`b`、`c` 不是按鈕點擊事件中的臨時常數，而是 `ContentView` 這個檢視的屬性。

在按鈕點擊事件中，下面的程式碼可以正常執行：

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

因為按鈕點擊後，程式碼會按順序執行。先建立 `a`，再建立 `b`，最後使用 `a + b` 計算出 `c`。

但是，在檢視內部宣告屬性時，情況不同。

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

這裡的 `a`、`b`、`c` 都是 `ContentView` 這個檢視中的屬性。

當 `ContentView` 檢視被建立時，Swift 需要先準備這些屬性。為了保證建立過程的安全性，Swift 不允許在一個實例儲存屬性的預設值中，直接讀取同一個實例中的其他實例屬性。

所以這一行會報錯：

```swift
let c = a + b
```

簡單理解就是：**在檢視內部宣告屬性時，不能用一個一般屬性直接計算另一個一般屬性。**

這種直接儲存值的屬性，稱為「儲存屬性」。為了便於理解，現在可以先把它理解為一般屬性。

例如：

```swift
let a = 10
```

`a` 儲存了 `10`。

```swift
let b = 20
```

`b` 儲存了 `20`。

但是：

```swift
let c = a + b
```

這裡的 `c` 不是直接儲存一個固定值，而是希望透過 `a + b` 計算出來。

像這種「根據已有資料得到結果」的情況，更適合使用計算屬性。

可以改成這樣：

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

這裡的 `c` 就是計算屬性。

```swift
var c: Int {
    return a + b
}
```

這段程式碼的意思是：**當需要使用 `c` 時，才讀取 `a` 和 `b`，並回傳 `a + b` 的結果。**

例如：

```swift
Text("c: \(c)")
```

當 `Text` 顯示 `c` 時，才會執行 `c` 的計算。

## 什麼是計算屬性？

計算屬性看起來像變數，但它本身不儲存資料。

例如：

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

這裡的 `c` 就是計算屬性。

計算屬性不像一般屬性那樣儲存一個固定值。每次讀取 `c` 時，`{}` 裡面的程式碼都會重新執行，並回傳計算後的結果。

可以這樣理解：

```swift
var c: Int {
    return a + b
}
```

需要 `c` 時，就計算 `a + b`。

因此，計算屬性適合這種情況：**某個結果不需要單獨儲存，而是可以根據已有資料計算出來。**

## 基本寫法

計算屬性通常由三個部分組成：

```swift
var c: Int {
    return a + b
}
```

### 1. 使用 `var` 宣告

```swift
var c
```

計算屬性必須使用 `var` 宣告，不能使用 `let`。

因為計算屬性不是固定儲存的值，而是每次讀取時動態計算出來的結果。

### 2. 標明回傳型別

```swift
var c: Int
```

計算屬性需要標明回傳型別。

這裡的 `c` 最終會回傳一個整數，所以型別是 `Int`。

### 3. 在 {} 裡寫計算邏輯

```swift
{
    return a + b
}
```

`{}` 裡面寫計算邏輯。這裡回傳的是 `a + b`。

## return 關鍵字

計算屬性需要回傳一個結果。

例如：

```swift
var c: Int {
    return a + b
}
```

這裡的 `return` 表示把 `a + b` 的計算結果回傳出去。

如果計算屬性裡只有一個直接產生結果的表達式，可以省略 `return`。

```swift
var c: Int {
    a + b
}
```

但是，如果計算屬性裡有多行程式碼，就需要使用 `return` 明確回傳結果。

例如：

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

這裡的計算過程分成兩步。

第一步，先計算總價：

```swift
let total = count * price
```

第二步，把總價拼接成文字後回傳：

```swift
return "Total：\(total) $"
```

如果移除 `return`：

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

這段程式碼會報錯。

原因是：**這個計算屬性裡已經有多行程式碼，Swift 無法自動判斷哪一行是最終要回傳的結果。**

因此，計算屬性裡如果只有一個產生結果的表達式，可以省略 `return`。

```swift
var c: Int {
    a + b
}
```

計算屬性裡如果有多行程式碼，建議明確寫出 `return`。

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## 計算屬性和一般屬性的差異

一般屬性會儲存資料。

```swift
var c = 30
```

這裡的 `c` 儲存了一個具體的值：`30`。

計算屬性不儲存資料。

```swift
var c: Int {
    a + b
}
```

這裡的 `c` 不會儲存 `30`，而是只提供一種計算方式。

當讀取 `c` 時，Swift 會執行：

```swift
a + b
```

然後回傳計算結果。

因此，當結果需要根據其他資料計算時，就適合使用計算屬性。

## body 也是計算屬性

學習計算屬性後，我們可以重新理解 SwiftUI 中最常見的這段程式碼：

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

這裡的 `body` 也是計算屬性。

它使用 `var` 宣告：

```swift
var body
```

它也有回傳型別：

```swift
some View
```

而 `{}` 裡面回傳的是 SwiftUI 檢視內容：

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

因此，`body` 可以這樣理解：當 SwiftUI 需要顯示這個檢視時，會讀取 `body`，並根據 `body` 回傳的內容建立介面。

如果寫上 `return`，可以這樣理解：

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

但是在 SwiftUI 中，我們通常會省略 `return`，直接這樣寫：

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

當 `@State` 資料發生變化時，SwiftUI 會重新讀取 `body`，並根據新的資料更新介面。

例如：

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

點擊按鈕後，`count` 會發生變化。

```swift
count += 1
```

`count` 發生變化後，SwiftUI 會重新計算 `body`，所以介面中的文字也會一起更新。

```swift
Text("count: \(count)")
```

這也是 SwiftUI 中資料變化後，介面能夠自動重新整理的原因。

### 不建議在 body 中寫複雜計算

`body` 是計算屬性，所以它可能會被多次讀取和重新計算。

例如：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

當 `name` 發生變化時，SwiftUI 會重新計算 `body`。

這時 `body` 裡面的程式碼也會重新執行，`num` 也會重新建立。

```swift
let num = 10
```

在這個例子中，`num` 非常簡單，所以影響不大。

但是，如果在 `body` 中執行複雜計算，例如大量資料篩選、排序、圖片處理等操作，就可能影響介面的流暢度。

因此，在 SwiftUI 中，`body` 主要應該負責描述介面結構。

簡單的臨時資料可以寫在 `body` 中。

複雜計算可以考慮移到 `body` 外面的計算屬性、方法，或獨立的資料處理邏輯中。

## 範例：數量和總價

接下來，我們透過一個簡單範例來理解計算屬性。

假設一根胡蘿蔔的單價是 2 美元。使用者可以點擊按鈕改變購買數量，介面中需要顯示總價。

總價的計算方式是：

```text
數量 * 單價
```

如果使用一般變數儲存總價，會比較麻煩。

因為每次數量變化時，都需要手動更新總價。

更好的方式是使用計算屬性。

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

顯示效果：

![view](../../Resource/024_view.png)

在這個範例中：

```swift
@State private var count = 1
```

`count` 表示胡蘿蔔的數量。點擊按鈕時，`count` 會發生變化。

```swift
private let price = 2
```

`price` 表示胡蘿蔔的單價。這裡是固定值，所以使用 `let`。

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` 表示總價。

總價不需要單獨儲存，因為總價永遠可以透過 `count * price` 計算出來。

當 `count` 是 `1` 時：

```swift
totalPrice = 1 * 2
```

顯示結果是：

```swift
totalPrice: 2 $
```

點擊 `+` 按鈕後，`count` 變成 `2`。

這時再次讀取 `totalPrice`，它會重新計算：

```swift
totalPrice = 2 * 2
```

顯示結果是：

```swift
totalPrice: 4 $
```

這就是計算屬性的作用：根據已有資料，動態計算出新的結果。

## 計算屬性可以用於判斷

計算屬性不只可以計算數字，也可以回傳判斷結果。

例如，當我們希望數量最低是 1。

當數量已經是 1 時，`-` 按鈕不應該繼續減少。

可以新增一個計算屬性：

```swift
private var canDecrease: Bool {
    count > 1
}
```

完整程式碼：

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

顯示效果：

![view](../../Resource/024_view1.png)

這裡：

```swift
private var canDecrease: Bool {
    count > 1
}
```

這段程式碼表示目前是否還可以繼續減少。

當 `count` 大於 `1` 時：

```swift
canDecrease == true
```

表示可以減少。

當 `count` 等於 `1` 時：

```swift
canDecrease == false
```

表示不能再減少。

### 按鈕中的條件判斷

按鈕中使用了下面的程式碼：

```swift
if canDecrease {
    count -= 1
}
```

只有當 `canDecrease` 為 `true` 時，才會減少 `count`。

### 控制檢視的前景色

也可以使用 `canDecrease` 控制按鈕的前景色：

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

這裡使用了三元運算子：

```swift
canDecrease ? Color.primary : Color.gray
```

這段程式碼的意思是：如果 `canDecrease` 為 `true`，前景色使用 `Color.primary`；如果 `canDecrease` 為 `false`，前景色使用 `Color.gray`。

`Color.primary` 是 SwiftUI 提供的系統語義色。它表示目前介面中的主要文字顏色。

在淺色模式下，`Color.primary` 通常接近黑色；在深色模式下，通常接近白色。

因此，使用 `Color.primary` 的好處是可以自動適配淺色模式和深色模式。

### 控制檢視的停用狀態

`disabled` 用於控制檢視是否處於停用狀態：

```swift
.disabled(!canDecrease)
```

當 `disabled` 為 `false` 時，檢視可以點擊。

當 `disabled` 為 `true` 時，檢視處於停用狀態，不可以點擊。

這裡使用 `canDecrease` 作為判斷條件，可以讓程式碼更容易理解。

看到 `canDecrease` 時，就能知道它表示「目前是否可以繼續減少」。

### 補充說明：為什麼要判斷兩次？

`-` 按鈕中使用了：

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

這裡既使用了 `.disabled(!canDecrease)`，也在按鈕內部使用了 `if canDecrease`。

`.disabled(!canDecrease)` 負責在介面層面停用按鈕，讓使用者不能點擊。

`if canDecrease` 則是在程式碼執行前再判斷一次，只有可以減少時，才執行 `count -= 1`。

這屬於雙重保護。實際開發中，如果按鈕已經被停用，內部判斷可以省略；但在教學範例中保留它，可以更清楚地展示 `canDecrease` 的作用。

## 總結

這節課主要學習了計算屬性。

計算屬性不直接儲存值，而是在被讀取時，根據已有資料計算出結果。

例如：

```swift
var c: Int {
    a + b
}
```

這裡的 `c` 不需要單獨儲存，因為它可以透過 `a + b` 計算出來。

計算屬性必須使用 `var` 宣告，並且需要標明回傳型別。

```swift
var canDecrease: Bool {
    count > 1
}
```

計算屬性不只可以回傳數值，也可以回傳判斷結果、文字內容，甚至 SwiftUI 檢視內容。

這節課也學習了 `return`。

`return` 表示回傳結果。

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

如果計算屬性裡只有一個直接產生結果的表達式，可以省略 `return`。

```swift
var totalPrice: Int {
    count * price
}
```

此外，我們也認識了 `Color.primary` 和 `disabled`。

`Color.primary` 是 SwiftUI 的系統語義色，會根據淺色模式和深色模式自動調整顯示效果。

```swift
.foregroundStyle(Color.primary)
```

`disabled` 用於控制檢視是否停用。

```swift
.disabled(true)
```

表示已停用，不能點擊。

```swift
.disabled(false)
```

表示可用，可以點擊。

因此，計算屬性在 SwiftUI 中非常常見。它可以幫助我們更清楚地整理計算結果、判斷條件和顯示內容。
