# 類型系統

在前面的課程中，我們已經學習了變數，並知道變數可以保存不同類型的資料。

例如：

```swift
var hello = "Hello, World"
```

這裡的 hello 保存的是一段文本，因此它的類型是 String。

接下來，我們將系統學習類型（Type）的概念，以及顯式聲明類型和類型推斷，以便更深入的理解變數的本質。

## 什麼是類型

在 Swift 中，每一個值都有一個明確的類型。類型決定這個值是什麼、能做什麼。

例如：

- 42 是一個 Int（整數）
- "Hello" 是 String（字串）
- true 是 Bool（布爾值）

它們屬於不同的類型，用途也不同。

## Swift 常見基礎類型

在初學階段，最常見的類型如下：

- String：字串（文本）
- Int：整數
- Double：浮點數（帶小數，精度較高）
- Bool：布爾值（true/false）

此外，還有 Float（浮點數），但精度低於 Double，一般較少使用；Character（單個字符），例如 "A"、"!" 等單字符。

### 類型聲明（顯式類型）

在 Swift 中，可以在變數聲明時，手動指定類型：

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

在變數名後加 ": 類型" 來聲明變數的類型。

數組的類型寫法是 ": [類型]"：

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

在這段程式碼中，scores 數組只能保存 Int 類型的元素，tags 只能保存 String 類型的元素。

顯式聲明類型可以讓程式碼的意圖更加清晰，並在某些情況下避免類型推斷錯誤。

## 類型推斷

在很多情況下，可以不去顯式聲明類型：

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

這是因為，Swift 編譯器會根據"初始值"自動推斷類型。

## 顯式聲明和類型推斷

在前面的課程中，我們沒有引入顯式聲明，例如：

```swift
var age: Int = 18
```

而是優先使用類型推斷：

```swift
var age = 18
```

在這個例子中，這兩種寫法是等價的，age 都會被確定為 Int 類型。相比之下，類型推斷的寫法更加簡潔。

之所以在前期不強調顯式聲明，是因為類型推斷可以減少程式碼中的額外資訊，從而降低初學階段的理解成本。

## 為什麼需要類型

Swift 是一門強類型語言（Strongly Typed Language）。

這意味著：一旦變數的類型確定，就不能隨意改變。

例如：

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

第一個 20 是 Int 類型，可以賦值給 age；第二個 "20" 是 String 類型，與 Int 類型不一致，因此會報錯。

nums 是 [Int] 類型數組，只能存儲整數，不能混入字串。

類型可以約束資料的使用，在編譯階段發現類型不匹配的問題，從而減少類型混亂帶來的 BUG，提高程式碼的穩定性和可維護性。

## 什麼時候必須顯式聲明類型

雖然 Swift 可以自動推斷類型，但有些情況編譯器推斷不出來，或者會推斷錯，這時就需要手動聲明。

**1. 空數組**

在創建空數組時，必須顯式聲明類型：

```swift
var nums: [Int] = []
```

如果不寫類型：

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

編譯器無法根據空數組推斷出數組的元素類型，因此會產生編譯錯誤。

**2. 避免推斷錯誤**

```swift
var value = 10   // Int
```

在這個例子中，雖然 10 也可以表示浮點數（Double），但由於沒有小數點，編譯器會將其預設推斷為 Int 類型。

如果希望 value 表示浮點數，則需要顯式聲明類型：

```swift
var value: Double = 10   // Double
```

當類型推斷結果不符合預期時，應通過顯式聲明類型或調整字面量形式來確保類型正確。

**3. 自定義類型**

我們後面還會學習自定義類型，使用自定義類型時，通常也需要顯式聲明：

```swift
var info: GameInfo
var users: [User] = []
```

這和空數組的原因相同，編譯器無法從空值中自動推斷類型。

## 類型轉換

在 Swift 中，不同類型之間不能自動轉換，必須手動轉換。

例如，兩個不同類型的數字相加：

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

在這段程式碼中，a 是 Int 類型，b 是 Double 類型，類型不同，無法直接進行運算。

在進行運算之前，需要先將其中一個值轉換為相同類型：

```swift
var result = Double(a) + b
```

這段程式碼表示將 Int 類型的 a 轉換為 Double 類型，再和 b 相加運算，計算結果賦值給 result。

需要注意的是，類型轉換不會修改原變數類型。例如，Double(a) 不會改變 a 的 Int 類型，而是創建了一個新的 Double 值用於參與運算。

其他類型也可以使用類似的方式進行轉換，即使用目標類型 + () 的形式，將需要轉換的值傳入。例如：

```
Int()、Double()、String()
```

示例：

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

需要注意的是，不是所有類型都可以轉換成功，比如 Double → Int 時，會直接截斷小數部分，不會四捨五入。

## 類型別名

在 Swift 中，也可以給已有類型起一個別名，讓程式碼語義更清晰：

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

這裡的 UserId 本質上還是 Int，類型沒有改變，只是名字更有意義。

在程式碼量大、類型複雜的項目中，類型別名能讓程式碼更易讀。

## 類型示例

下面通過一個簡單示例，演示類型在實際開發中的作用。

### 創建變數

首先，我們創建一個 age 變數：

```swift
var age = 20
```

因為需要在 SwiftUI 中顯示和修改這個變數，因此需要使用 @State 進行聲明：

```swift
@State private var age = 20
```

private 在之前提到過，表示這個變數只能在當前視圖中使用，以後會進一步學習。

### 在 SwiftUI 中顯示資料

在 SwiftUI 中顯示 age 變數：

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

現在視圖會顯示：

```swift
age: 20
```

### 修改資料

接下來，我們添加兩個按鈕來修改 age：

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### 運行結果

當點擊 changeAge1 時，age 會被賦值為 18：

```swift
age = 18
```

因為 18 是 Int 類型，與 age 類型一致，因此賦值成功。

changeAge2 會出現錯誤：

```swift
age = "18"
```

錯誤資訊：

```
Cannot assign value of type 'String' to type 'Int'
```

這是因為 "18" 是 String 類型（字串需要使用 "" 包裹），而 age 是 Int 類型，類型不一致，無法賦值。

### 為什麼會報錯？

關鍵在於這行程式碼：

```swift
@State private var age = 20   // Int
```

雖然沒有顯式聲明類型，但由於初始值 20 是 Int 類型，所以編譯器會將 age 自動推斷為 Int 類型。

一旦類型確定，就不能再賦值為其他類型。

而且，changeAge2 按鈕並不是在“運行時失敗”，而是在編譯階段就會報錯，程式碼無法通過編譯。

這也是 Swift 強類型的優勢之一：可以在編寫程式碼時，提前發現類型問題。

### 正確寫法

刪除錯誤程式碼後：

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

點擊 changeAge1 按鈕，視圖會更新為：

```
age: 18
```

### 顯式聲明類型（可選）

也可以在定義時，明確指定類型：

```swift
@State private var age: Int = 20
```

這種寫法可以讓類型更加清晰，但在簡單場景下並不是必須的。

## 總結

這節課主要講了 Swift 的類型系統及其在實際開發中的作用。

在 Swift 中，每個值都有明確的類型，類型決定資料的含義，以及它可以參與的操作。

Swift 是強類型，變數一旦確定類型，就不能再賦值為其他類型。這個約束可以在編譯階段發現錯誤，從而減少運行時問題，提高程式碼安全性。

變數的類型可以根據初始值自動推斷，也可以顯式聲明。在某些情況下（如空數組、類型判斷錯誤、自定義類型），編譯器無法正確推斷類型，這時必須顯式聲明。

不同類型之間不能自動轉換，必須通過 Int()、Double()、String() 等方式顯式轉換。

類型也支持別名，特別是在複雜的項目中，類型別名可以提高可閱讀性。

類型不僅是資料標記，還是一種約束機制，可以確保資料的使用是安全、明確且可控的。

## 擴展知識 - 可選類型

在進行類型轉換時，有些操作可能會失敗。

例如，將 String 轉換為 Double：

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

這裡的 Double(input) 返回的不是 Double，而是：

```
Double?
```

這就是可選類型（Optional）。

### 為什麼會返回可選類型？

因為字串的內容是不確定的，"3.14" 可以轉換為 Double，"Hello" 無法轉換為 Double。

也就是說，這個操作可能成功，也可能失敗。

因此，Swift 使用可選類型來表示這種不確定性。

### 什麼是可選類型？

可選類型表示：一個值可能存在，也可能不存在。

例如：

```
Double?
```

這個類型表示，如果有值，打印時會顯示 Optional(...)，如果沒有值，則返回 nil。

需要注意的是，nil 表示 "沒有值"，而不是 0 或空字串。

### 示例

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

輸出：

```
pi:Optional(3.14)
```

這表示，字串成功轉換為 Double，得到 3.14，但由於類型是 Double?，所以被包裹在 Optional 中。

如果轉換失敗：

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

輸出：

```
pi: nil
```

因為 "Hello" 無法轉換為 Double 類型，所以轉換失敗，並返回 nil。

### Optional(...)是什麼？

當我們直接打印可選類型時：

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift 會顯示其“調試描述”：

```
Optional(3.14)
```

這並不是實際資料的一部分，而是提示當前值是一個"可選類型"，並且內部包含一個值。

### 解包可選類型

在實際開發中，我們通常需要從可選類型中取出真實的值，這個過程稱為解包（Unwrapping）。

一種常見方式是使用 ?? 提供預設值：

```
??
```

這叫做：空合併運算符（Nil-Coalescing Operator）。

例如：

```swift
name ?? "FangJunyu"
```

這段程式碼表示，如果 name 有值，返回對應的值；如果是 nil，就使用預設值 "FangJunyu"。

需要注意的是，預設值的類型必須與可選類型一致。

### 使用 ?? 提供預設值

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

輸出：

```
pi: 30
```

input 被轉換為 Double 類型時，轉換成功並輸出值。如果轉換失敗，就會輸出 ?? 提供的預設值。

如果轉換失敗：

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

輸出：

```
pi: 10
```

在這裡，input 被轉換為 Double 類型時，轉換失敗並返回 nil，?? 會為 nil 提供一個預設值。

可選類型用於表示“可能有值，也可能沒有值”的情況。

在類型轉換等可能失敗的操作中，Swift 會返回可選類型，以保證程式的安全性。

當我們需要使用其中的值時，可以通過 ?? 提供預設值，從而在 nil 出現時依然能夠得到一個合理的結果。