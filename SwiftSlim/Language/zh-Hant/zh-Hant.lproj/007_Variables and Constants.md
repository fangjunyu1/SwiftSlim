# 變數和常量

本節課主要學習 Swift 中的變數和常量，並認識一些常用的資料類型以及基礎運算符。

這些內容是程式設計中最基礎的知識，也是後續學習 SwiftUI 的重要基礎。

## 生活中的變數和常量

我們可以通過生活中的事物來理解變數和常量。

生活中的變數：

- 電視中每個節目播放的內容不同
- 每天的天氣都不一樣
- 時鐘每一秒都會變化

這些事物的共同特點是：它們會發生改變。

如果電視永遠只有一個畫面，天氣永遠是晴朗的，時鐘的指針永遠不動，那麼這些事物就是常量。

一個可能會發生變化，另一個不會發生變化。

## 理解變數和常量

在 App 開發中，通常需要使用者填寫或保存一些資訊。

例如：

- 賬號名稱
- 生日
- 聯繫方式
- 住址

這些資訊會被保存並顯示出來。

例如，使用者在 App 中輸入一個名稱：

```
FangJunyu
```

我們需要把這個名稱保存起來，以便在 App 中顯示。

可以把保存過程簡單的理解為：在一個抽屜中存放東西。

當我們保存名稱時，就像把名稱放進一個抽屜里。

需要保存的東西可能有很多，抽屜也會有很多。為了知道每個抽屜里裝的是什麼，我們需要給抽屜起一個名字。

例如：

```
name
```

在這個例子中，name 是名稱，FangJunyu 是保存的資訊。

![Var](../../RESOURCE/007_var.png)

**在 Swift 中，如果需要保存資料，就必須使用變數（var）或常量（let）進行聲明。**

由於名稱通常是可以修改的，因此我們應該使用變數。

```swift
var name = "FangJunyu"
```

這裡聲明瞭一個名為 name 的變數，變數類型為 String，值為 "FangJunyu"。

### 變數和常量的區別

變數使用 var 聲明：

```swift
var
```

常量使用 let 聲明：

```swift
let
```

例如：

```swift
var name = "FangJunyu"
let id = 123456
```

如果聲明為變數，表示這個值可以被修改；如果聲明為常量，則無法再修改。

因此，變數和常量的主要區別在於：值是否允許改變。

### 修改常量

如果程式碼嘗試修改常量的值：

```swift
let name = "Sam"
name = "Bob"
```

Swift 會提示無法完成賦值，因為它是一個常量。

```
Cannot assign to property: 'name' is a 'let' constant
```

這種機制可以幫助開發者避免某些重要資料被意外修改。

### 在 SwiftUI 中顯示

打開 ContentView.swift 文件，在 View 內部聲明變數：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

在這裡聲明瞭一個名為 name 的變數，並通過 Text 將它顯示在界面上。

如果我們修改變數的內容：

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Text 顯示的文本內容也會發生改變。

通過這種方式，我們可以使用變數來控制界面顯示的內容，而不需要每次直接修改 Text 中的文本。

如果其他地方需要獲取這個資訊，我們也可以把變數傳遞過去，相當於把“抽屜”里的內容交給其他地方使用。

### SwiftUI 中變數和常量的位置

在 SwiftUI 中，變數和常量通常寫在 body 外部：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

當然，也可以把變數和常量寫在 body 內部：

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

不過兩者存在一個重要區別：

- 如果變數和常量寫在 body 內部，每次視圖重新計算時都會重新創建這個變數。
- 如果寫在 body 外部，變數會作為視圖結構題的屬性存在，程式碼結構更清晰。

因此，在實際開發中，通常會把變數和常量寫在 body 外部。

## 資料類型

變數可以保存很多不同類型的資料，這些類型被稱為資料類型。

例如，我們之前使用 Text 顯示文本：

```swift
Text("Hello, World")
```

這裡的 "Hello, World" 屬於字串（String）類型。

字串用於表示文本內容，在 Swift 中需要使用雙引號 "" 包裹。

例如：

```swift
var hello = "Hello, World"
```

除了字串以外，Swift 中還有許多資料類型。

初學階段最常見的四種類型是：

- String
- Int
- Double
- Bool

這四種類型可以完成大部分基礎的資料處理。

**String**

String 表示文本內容，例如：

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

字串通常用於表示：使用者名、標題、文字內容。

**Int**

Int 表示整數，也就是沒有小數的整數。

例如：

```swift
var age = 26
var count = 100
```

整數通常用於表示：年齡、數量、計數。

**Double**

Double 表示帶有小數的數字。

例如：

```swift
var weight = 74.5
var height = 185.0
```

在 Swift 中，小數通常預設使用 Double 類型。

還有一個類似的類型叫 Float，但它能表示的數值範圍更小，因此在實際開發中 Double 更常用。

**Bool**

Bool 類型用於表示兩種狀態：true 和 false。

例如：

```swift
var isShowAlert = true
var isLogin = false
```

Bool 類型常用於條件判斷。例如，是否顯示提示框。

對於只有兩種結果的情況，非常適合使用 Bool 類型表示。

### SwiftUI 中顯示

當我們顯示 String 類型時，可以直接使用 Text：

```swift
Text(name)
```

但是 Int、Double 等類型不是字串，因此不能直接作為文本內容的一部分。

如果需要在 Text 中顯示這些資料，可以使用字串插值（String Interpolation）：

```swift
\()
```

字串插值需要寫在字串內容，並使用 \\() 包裹變數或常量。

例如：

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

在上面的程式碼中，"" 表示字串，\\() 用於把變數或常量插入到字串中。

例如：

```swift
"DoubleNum: \(num * 2)"
```

顯示的內容為：

```swift
DoubleNum: 2
```

通過這種方式，我們可以在字串中插入變數或常量，然後使用 Text 將它們顯示在界面上。

提示：\\() 只能在字串 "" 內部使用。

## 運算符

在聲明變數或者常量的時候，我們可以看到下面的寫法：

```swift
var num = 1
```

這裡的 = 叫做賦值運算符。

它的作用是：把右側的值賦給左側的變數。

在這個例子中，1 被賦值給變數 num。

除了賦值運算符以外，還有一些常見的數字運算符：

- \+
- \-
- \*
- \/

當我們對數字進行計算時，例如 Int 或 Double 類型的資料，就會用到這些運算符。

例如：

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

運算完成後，結果會被保存到變數中。

## 總結

變數、常量以及運算符是程式設計中最基礎的概念。

通過變數和常量，我們可以在程式中保存各種資料；通過資料類型，可以明確資料的種類；通過運算符，可以對資料進行計算和處理。

這些知識就像是程式設計世界的基礎工具。掌握這些內容，可以為後續學習 Swift 和 SwiftUI 打下堅實的基礎。