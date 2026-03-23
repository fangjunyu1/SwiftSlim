# 讓按鈕開始工作

本節課主要學習 Button 按鈕、print 輸出調試資訊，以及 Swift 函式。

這些內容是 SwiftUI 互動程式設計的基礎。

## 按鈕

按鈕是我們最常見的 UI 控件，當我們需要下載、打開或者退出等操作時，通常都會點擊按鈕。

例如在 App Store 中，點擊“獲取”按鈕下載 App。

![Button](../../RESOURCE/008_button.png)

在 SwiftUI 中，按鈕使用 Button 表示。

基本用法：

```swift
Button("") {
    
}
```

結構可以分為兩個部分：

```swift
Button("按鈕文字") {
    點擊按鈕時執行的程式碼
}
```

例如：

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

運行後會顯示一個 Start 按鈕。

![Button](../../RESOURCE/008_button1.png)

當使用者點擊按鈕時，{} 內的程式碼就會執行。

需要注意的是：Button 屬於 SwiftUI 的界面控件（View），因此必須寫在 body 中。

### buttonStyle 修飾符

在 SwiftUI 中，Button 提供了系統內置的按鈕樣式，可以通過 buttonStyle 修飾符使用。

例如：

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle 會使用系統提供的按鈕樣式。

常見的選項包括：

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

不同樣式的區別主要體現在，按鈕是否有邊框、背景和視覺強調程度。

## print 輸出

在程式設計中，經常需要查看程式是否運行到某一段程式碼。

Swift 提供了 print 函式用於輸出調試資訊。

基本寫法：

```swift
print("Hello")
```

這行程式碼會把文本輸出到 Console（主控台）。

### 測試按鈕可用性

我們可以把 print 寫在按鈕中，用來測試按鈕是否被點擊。

```swift
Button("Start") {
    print("Test 123")
}
```

當點擊按鈕時，Console 會輸出：

```
Test 123
```

這說明按鈕已經成功觸發。

![Button](../../RESOURCE/008_button3.png)

注意：print 是 Swift 程式碼，不是界面控件。它不能直接放在 body 中，否則會報錯。

例如，下面這樣寫就是錯誤的：

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // 錯誤：body 必須返回一個 View
    }
}
```

在 SwiftUI 中，body 用來描述界面結構，只能放界面控件（View），例如 Text、Button、Image 等。

普通程式碼（計算邏輯、print 等）必須放在按鈕、函式或其他事件處理器中。

### Console 主控台

print 輸出的內容會顯示在 Xcode 的 Console（主控台）中。

如果沒有看到 Console，可以點擊右下角的 Show the Debug Area 按鈕打開調試區域，再點擊 Show the Console 按鈕顯示主控台。

![](../../RESOURCE/008_button4.png)

在 Console 左下角有兩個標籤：Executable 和 Previews。

![](../../RESOURCE/008_button5.png)

這兩個標籤對應不同的運行環境：當在 Canvas 預覽視圖時，print 的輸出會顯示在 Previews 標籤下；如果在模擬器或真機運行應用，則輸出會顯示在 Executable 標籤下。

因此，當你發現 print 沒有輸出時，可以先確認自己選擇了正確的標籤。

## 案例 - ASCII 字符畫

在一些程式碼項目中，經常會看到 ASCII 字符畫。

字符畫是用普通字符拼成的圖案，例如：

![ASCII](../../RESOURCE/008_ascii.png)

我們可以使用按鈕 + print 輸出一個 ASCII 字符畫。

示例程式碼：

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

當點擊按鈕時，Console 會輸出：

```
 /\_/\
( o.o )
 > ^ <
```

注意：字串中的 \ 需要寫成 \\\，因為反斜槓在字串中是轉義字符。

## 函式

在按鈕中，我們可以直接編寫程式碼。

例如：

```swift
Button("Start") {
    print("Hello")
}
```

如果程式碼比較少，這樣寫沒有問題。但是在實際開發中，一個按鈕觸發的邏輯可能很多。

例如：

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // 可能還有很多程式碼
}
```

如果程式碼越來越多，直接寫在按鈕內部會讓界面程式碼變得很亂，也不方便閱讀和維護。

因此，我們通常會把這些程式碼整理到一個函式中，然後在按鈕中調用這個函式。

### 什麼是函式

函式就是一段可以重復使用的程式碼。

當某些程式碼需要被執行時，我們只需要調用這個函式，就可以運行函式內部的程式碼。

這樣可以讓程式碼結構更加清晰，也方便重復使用。

### 基本寫法

在 Swift 中，函式使用 **func** 關鍵字定義：

```swift
func randomInt() {
    // code
}
```

這段程式碼定義了一個函式。

randomInt 是函式名稱，用來標識這段程式碼。

() 表示參數位置，可以在這裡接收外部傳入的資料。如果不需要資料，可以保持為空。

{} 內部就是函式的程式碼區域，所有需要執行的程式碼都寫在這裡。

例如：

```swift
func getName() {
    print("FangJunyu")
}
```

這個函式的作用是輸出一段文本。

### 調用函式

定義函式只是創建了這段程式碼，如果想要執行它，還需要調用函式。

調用方式是在函式名稱後面加上 ()：

```swift
getName()
```

當程式運行到這行程式碼時，就會執行 getName 函式中的程式碼。

完整示例：

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

運行後，Console 會輸出：

```
FangJunyu
```

### 在 SwiftUI 中使用函式

在 SwiftUI 視圖中，函式通常寫在 body 外部。

例如：

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

當點擊按鈕時，就會調用 getName() 函式。

這樣可以讓界面程式碼保持簡潔，而具體邏輯放在函式中處理。

### 函式參數

有時候，一個函式需要根據不同的資料執行不同的操作。

例如，我們希望函式可以輸出不同的名字，而不是只輸出固定的"FangJunyu"。

這時就可以使用參數，參數可以理解為：調用函式時傳入的資料。

例如：

```swift
func getName(name: String) {
    print(name)
}
```

這個函式新增了一個參數，name 是參數名稱，String 是參數類型。 

這表示函式需要接收一個 String 類型的資料。

因為函式現在需要資料，所以在調用時必須提供這個資料。

```swift
getName(name: "Sam")
```

當調用時傳入 "Sam"，函式內部就會使用這個值進行輸出。

運行結果：

```
Sam
```

## 案例 - 使用函式輸出 ASCII 字符畫

在前面的示例中，我們把 print 直接寫在按鈕內部。

但如果字符畫比較複雜，程式碼會變得很長。這時就可以把邏輯放到函式中，讓界面程式碼更加清晰。

示例程式碼：

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

運行後點擊按鈕，Console 會輸出：

```
 /\_/\
( o.o )
 > ^ <
```

這裡發生了兩件事情，當使用者點擊按鈕後：

1. 按鈕調用 printCat() 函式
2. 函式中的 print 程式碼被執行

這樣可以讓界面程式碼只負責觸發事件，而具體邏輯放在函式中處理。

在實際開發中，大部分按鈕的操作都會通過函式來實現。

## 總結

本節課學習了三個重要內容：

**1. Button 按鈕**

Button 是 SwiftUI 中用於觸發操作的控件。

```swift
Button("Start") {

}
```

當使用者點擊按鈕時，花括號中的程式碼會執行。

**2.print 輸出**

print 用於向 Console 輸出調試資訊。

```swift
print("Hello")
```

開發者可以通過 Console 查看程式運行狀態。

**3.函式**

函式是一段可以重復使用的程式碼。

```swift
func sayHello() {
    print("Hello")
}
```

調用函式：

```swift
sayHello()
```

如果函式需要資料，可以使用 參數：

```swift
func sayHello(name: String) {
    print(name)
}
```

在後面的課程中，我們會繼續學習更多 SwiftUI 控件以及資料如何與界面互動。

## 練習

嘗試完成下面的練習：

1. 創建一個按鈕，按鈕文字為 "Hello"
2. 點擊按鈕時，在 Console 輸出 Hello Swift
3. 把輸出程式碼寫到一個函式中，然後在按鈕中調用這個函式