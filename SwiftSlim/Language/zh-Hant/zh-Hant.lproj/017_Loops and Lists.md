# 迴圈與列表

這一課，我們要學習 Swift 裡的 `for` 迴圈，以及 SwiftUI 裡的 `ForEach`。

它們都能幫助我們依照順序讀取陣列中的元素。在實際開發時，我們常常需要把一組資料一筆一筆取出來，再進一步處理或顯示，而迴圈正是完成這件事的重要工具。

當我們瀏覽網頁或使用 App 時，常常會看到許多列表或一筆筆的項目。這類內容通常會先存放在`陣列`中，再透過`迴圈`依序取出，最後顯示在畫面上。

例如，Google 的搜尋結果列表：

![Google](../../Resource/017_google.png)

搜尋結果中的每一筆資料，通常都對應到一個項目，並透過迴圈依序顯示出來。

因此，`陣列`和`迴圈`常常會一起出現。`陣列`負責儲存一組資料，`迴圈`則負責依序取出這些資料，並執行相同的操作。

接下來，我們先從最基本的 `for` 迴圈開始。

## 倒數計時

假設我們要模擬一個倒數計時功能，依序輸出 `「5、4、3、2、1」`。

最直接的寫法是：

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

這樣雖然能做出倒數計時的效果，但如果內容很多，程式碼就會顯得很重複，而且之後也不容易修改。

這時候，我們可以先把資料放進陣列裡，再用 `for` 迴圈依序輸出：

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

這種寫法更精簡，也比較容易擴充。就算倒數的數字很多，我們也不需要一行一行重複寫 `print`，只要讓迴圈自動處理陣列中的每個元素就可以了。

我們可以把這段程式碼放進按鈕裡來測試：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

當按下按鈕時，`for` 迴圈就會依照陣列中的順序，逐一取出 `countDown` 裡的整數，並把它們印到控制台。

接著，我們來看看 `for` 迴圈是怎麼運作的。

## for 迴圈

`for` 迴圈用來依序處理一組資料，最常見的對象就是陣列和範圍。

基本寫法：

```swift
for 元素 in 陣列或範圍 {
    要執行的程式碼
}
```

例如，剛才的倒數計時程式碼：

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

這裡的 `i` 代表目前取出的元素，而 `in` 後面接的是要迴圈處理的資料，也就是 `countDown` 陣列。

這段程式碼的意思是：程式會從 `countDown` 陣列中依序取出每個元素。每取出一個元素，就暫時用 `i` 代表它，然後執行大括號中的程式碼。

執行流程可以這樣理解：

- 第一次取出的是 `5`，所以這時候 `i` 的值是 `5`
- 執行 `print(i)`，輸出 `5`
- 接著繼續取出下一個元素 `4`
- 再執行一次 `print(i)`，輸出 `4`

後面的 `3`、`2`、`1` 也會用相同的方式依序執行。

![for](../../Resource/017_for.png)

當陣列中的所有元素都處理完之後，`for` 迴圈就會自動結束。

我們可以透過 `for` 迴圈取得陣列中的每一個元素，並完成像倒數計時這樣的功能。

**提示**：`i` 是 for 迴圈裡很常見的命名方式，用來表示目前取出的元素，但這不是固定規則，你也可以改用其他英文名稱。

例如，用 `num` 來表示每一次取出的元素：

```swift
for num in countDown {
    print(num)
}
```

在大括號內，也要使用 `num` 來代表目前取出的元素。

### 迴圈範圍

`for` 迴圈不只能用在陣列上，也能用在範圍上。

例如，當我們要計算 `50` 以內正整數的總和時，就必須把 `1` 到 `50` 之間的所有整數依序加總起來。

最直接的寫法可能會是：

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

這種寫法的問題是，我們得把每個數字都手動寫出來，不但麻煩，也不適合真正的開發情境。

這時候，就可以搭配範圍運算子與 `for` 迴圈來完成。

在前面的「運算子」章節中，我們已經學過範圍運算子：

```swift
1...3   // 1, 2, 3
```

其中，`...` 代表閉區間，也就是會包含起點和終點。

因此，這裡可以用 `for` 迴圈處理 `1` 到 `50` 的整數範圍：

```swift
for i in 1...50 {
    
}
```

因為我們要把這些整數加總起來，所以還需要一個變數來儲存總和：

```swift
var count = 0
```

接著在每一次迴圈時，把目前取出的數字加到 `count` 裡：

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)    // 1275
```

這段程式碼表示：

- `count` 用來記錄目前的總和
- `for` 迴圈會從 `1` 到 `50` 依序取出整數
- 每取出一個整數，就執行一次 `count += i`
- 當迴圈結束後，`count` 裡保存的就是最後的總和。

這樣一來，我們就能得到 `50` 以內所有正整數的總和。

同樣地，如果要計算 `1` 到 `100` 的整數總和，只要把範圍改掉就可以了：

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)    // 5050
```

`for` 迴圈不只能處理陣列，也能處理範圍。這種依照順序重複處理資料的能力，在開發中非常常見。

它可以幫助我們自動完成許多重複性的工作，而不需要手動把每一個數字的加總過程，或其他類似的重複動作，一次一次寫出來。

## SwiftUI 中的迴圈

前面介紹的 `for` 迴圈屬於 Swift 語言本身。

但是在 SwiftUI 中，我們不能直接在視圖結構裡用 `for` 來建立視圖：

```swift
VStack {
    for i in 1...100 {    // Error
        count += i
    }
}
```

原因是 `VStack` 裡面需要放的是 SwiftUI 視圖，而一般的 `for` 迴圈本身並不是一個視圖。

如果我們想在 SwiftUI 中根據陣列內容重複產生畫面，就需要使用 `ForEach`。

例如，我們想顯示小組裡所有成員的名字，可以寫成：

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

顯示效果：

![for1](../../Resource/017_for1.png)

接著，我們替每一個 `Text` 加上相同的修飾符：

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

現在，每一個 `Text` 都會顯示成更小、也更粗的字體。

顯示效果：

![](../../Resource/017_for2.png)

雖然修飾符能讓畫面更好看，但也會讓程式碼變得更長、更重複。

如果名字繼續增加，或之後還要統一修改字體、顏色等樣式，就得重複撰寫和調整很多相同的程式碼，這樣不但麻煩，也不利於維護。

這時候，我們就可以先把這些名字放進陣列，再使用 SwiftUI 中的 `ForEach`，根據陣列資料重複產生視圖：

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

這樣的寫法更精簡，`ForEach` 會依序讀取陣列中的每一個元素，並把對應的內容顯示在畫面上。

之後如果要新增名稱，只需要修改 `names` 陣列中的內容，不必每次都重複新增 `Text` 和那些修飾符。

## ForEach

`ForEach` 是 SwiftUI 中用來重複建立視圖的結構。你可以把它理解成 SwiftUI 裡一種類似 `for` 迴圈的寫法。

基本用法：

```swift
ForEach(陣列, id: \.self) { 元素 in
    SwiftUI 程式碼
}
```

例如，剛才的小組名稱：

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

這段程式碼表示：

`names` 是拿來迴圈的陣列，也就是要顯示的資料。

`id:\.self` 表示使用陣列中的元素本身，來區分每一個元素。

在這個例子中，陣列裡存放的是字串：

```swift
["Sam", "John", "Wathon", "Bob"]
```

所以 SwiftUI 會直接用 "Sam"、"John"、"Wathon"、"Bob" 這些字串本身，來辨識不同的內容。

對於初學階段常見的 String、Int 這類簡單陣列，我們通常都可以先寫成：

```swift
id: \.self
```

目前只要先記住這種寫法就可以了，不需要太早深入理解更多 id 的規則。

`item in` 裡的 `item`，代表目前取出的元素。

例如，第一次迴圈時，`item` 是 `"Sam"`，第二次迴圈時，`item` 就是 `"John"`。

因此：

```swift
Text(item)
```

就會依序變成：

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

所以這段程式碼的作用，就是從 `names` 陣列中依序取出每個名字，並替每個名字建立一個 `Text` 視圖。

### 執行過程

執行過程可以這樣理解：

- `ForEach` 先讀取 `names` 陣列中的第一個元素 `"Sam"`
- `item` 暫時代表 `"Sam"`
- `Text(item)` 顯示 `"Sam"`
- 然後再繼續讀取下一個元素 `"John"`
- 接著重複執行同樣的視圖程式碼

最後，陣列中的所有名字都會顯示出來。

這種寫法的好處是：當名稱變多時，我們不需要重複寫出很多個 `Text`，只要修改陣列內容就可以了。

### 迴圈顯示照片

`ForEach` 不只能顯示文字，也能顯示圖片、顏色，或其他 SwiftUI 視圖。

例如，我們準備 4 張圖片：

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

把這四張圖片拖進 Xcode 的 Assets 資料夾中。

![image](../../Resource/017_for3.png)

如果不使用 `ForEach`，我們就得把每一張圖片都手動寫出來：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

顯示效果：

![image](../../Resource/017_for4.png)

這樣雖然也能完成功能，但程式碼會比較長。

如果圖片越來越多，就得重複寫更多 `Image` 程式碼。

之後如果想統一調整圖片大小，也要一張一張去改。

這時候，就可以把圖片名稱放進陣列，再使用 `ForEach` 來重複產生圖片視圖：

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

這裡的 `images` 是一個字串陣列，陣列中的每一個元素都是圖片名稱。

`ForEach(images, id: \.self)` 的意思是：依序讀取 `images` 陣列中的每個元素，使用元素本身來區分每一項，再根據目前的元素建立對應的視圖。

例如，第一次讀到的是 `"430F9BEF"`，那麼：

```swift
Image(item)
```

就等同於：

```swift
Image("430F9BEF")
```

後面的圖片也會用同樣的方式依序顯示出來。

![image](../../Resource/017_for4.png)

這裡依然使用：

```swift
id: \.self
```

原因和前面一樣，因為 `images` 陣列中的元素也是簡單的字串型別，所以在初學階段，直接使用元素本身來區分就可以了。

你可以先把它記成一句固定公式：

**當 `ForEach` 迴圈的是 `String` 或 `Int` 這類簡單陣列時，通常寫成 `id: \.self`。**

### 新增圖片

如果之後需要新增圖片，只要修改陣列內容就可以了：

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

不需要再重複撰寫新的 `Image` 程式碼。

如果圖片很多，也可以搭配 `ScrollView` 一起使用；否則當內容超出螢幕後，就沒辦法完整預覽。

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### 修改圖片

當我們需要統一調整圖片樣式時，只要修改 `ForEach` 內部的程式碼就可以了。

例如，把寬度改成 `80`：

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

這樣所有圖片就會一起更新，不需要一張一張去修改。

這也是 `ForEach` 的一個重要用途：

**當多個視圖的結構相同、只有內容不同時，我們只需要寫一份視圖程式碼，再由陣列中的資料決定實際顯示的內容。**

## 總結

這一課，我們學習了 `for` 迴圈和 `ForEach`。

`for` 迴圈用來依序處理陣列或範圍中的元素，比較偏向資料處理。

`ForEach` 則用來在 SwiftUI 中依照陣列內容重複建立視圖，比較偏向畫面顯示。

對於目前的初學階段，`ForEach` 最常見的寫法就是：

```swift
ForEach(陣列, id: \.self) { 元素 in
    SwiftUI 程式碼
}
```

其中，`id: \.self` 表示用元素本身來區分每一個元素。

當陣列中的內容是 `String`、`Int` 這類簡單型別時，我們通常都可以先使用這種寫法。

以後在瀏覽網頁或使用 App 時，如果看到一整組重複的文字、圖片，或其他列表內容，就可以想到：在 SwiftUI 中，這些內容通常會先放進陣列，再透過 `ForEach` 依序顯示出來。
