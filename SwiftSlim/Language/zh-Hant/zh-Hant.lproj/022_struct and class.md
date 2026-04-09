# struct 和 class

上節課，我們剛開始接觸 `struct`，定義了一個結構體，還延伸學習了協議、`UUID` 等知識點。

現在，我們對 `struct` 關鍵字已經有了初步認識，但還不能算真正理解。

這節課，我們繼續以 `struct` 為核心內容，並順便認識一下 `class`。透過這節課的學習，你會更清楚地知道：什麼是實例、什麼是建構函式，以及為什麼我們可以用 `struct` 和 `class` 來組織資料。

## 學生管理系統

例如，我們現在要開發一個學生管理系統。每個學生都有名稱、性別、電話、年齡、家庭住址等資訊。

這時候，我們就可以把這些資訊組合在一起，定義成一個 `Student` 結構體：

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

這裡我們使用 `struct` 定義了一個學生型別。

這個 `Student` 結構體中，包含了多個屬性：

- `id`：學生的唯一識別
- `name`：學生名稱
- `sex`：學生性別
- `phone`：學生電話
- `age`：學生年齡
- `address`：家庭住址

這樣一來，原本分散的多個資料，就被組合成了一個完整的「學生」。

這裡的 `Student` 還遵循 `Identifiable` 協議，並定義了一個 `id` 欄位，方便後續配合 `ForEach` 迴圈顯示資料。

然後，我們可以建立一個學生實例：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

這段程式碼表示，按照 `Student` 這個結構，可以建立出一個具體的學生資料。

其中，`Student` 是型別，`Student(...)` 表示建立出來的一個實例。

在 SwiftUI 中，我們可以將這個實例賦值給一個變數，然後顯示出來。

例如：

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

這樣，我們就可以在視圖中看到這個學生的名字：`Fang Junyu`。

在這裡，我們先建立了一個 `Student` 實例，然後把它賦值給 `student` 變數，最後透過 `student.name` 讀取其中的屬性。

## 什麼是實例

當我們剛開始學習 `struct` 時，可能會覺得「實例」這個詞很陌生。

但實際上，我們從一開始就在使用實例，只是以前沒有特別注意。

例如：

```swift
let name = "Fang Junyu"
```

這裡的 `"Fang Junyu"` 是一個字串值，它本質上就是一個 `String` 型別的實例。

我們也可以寫成：

```swift
let name = String("Fang Junyu")
```

這兩種寫法表達的是同一件事：建立一個 `String` 型別的實例，並把它賦值給變數 `name`。

同樣地，`Int` 也是如此：

```swift
let num = 3
```

這裡的 `3`，本質上就是一個 `Int` 型別的值，也可以理解為一個 `Int` 實例。

所以，實例並不是只會在 `struct` 中出現的特殊概念。

不論是 `String`、`Int`、`Double`、`Bool`，還是自訂的 `Student`，它們都可以建立實例。

因此，當我們寫：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

本質上和建立 `String`、`Int` 的實例是一樣的，只不過 `Student` 是我們自己定義的型別而已。

## 建構函式

當我們建立一個實例時：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

實際上，就是在呼叫 `Student` 的初始化方法，也就是 `init`。

你可以把建構函式理解為：**在建立實例時，負責為屬性賦值的入口。**

也就是說，一個實例在真正建立完成之前，通常都要先經過 `init`。

例如，在前面學習 SwiftUI 視圖生命週期時，我們寫過這樣的程式碼：

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

這裡的 `init()` 會在 `ContentView` 實例被建立時執行，而 `onAppear` 則是在視圖真正顯示到畫面上時才執行。也就是說，視圖的建立與顯示並不是同一個時機。

同理，當我們建立 `Student(...)` 時，也就是在呼叫 `Student` 的建構函式。

### 系統自動產生的建構函式

我們在定義 `Student` 的時候，並沒有手動寫出 `init`：

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

但是，我們仍然可以直接建立實例：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

為什麼在沒有建構函式的情況下，也可以建立實例呢？

因為對於 `struct` 來說，如果我們沒有手動撰寫建構函式，系統通常會自動幫我們產生一個合適的建構函式。

在初學階段，可以簡單理解為：Swift 幫我們自動補上了初始化程式碼。

可以大致理解為，系統會幫我們補出下面的程式碼：

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

這裡要注意一個細節：

```swift
let id = UUID()
```

`id` 已經有預設值了，所以在建立實例時，不需要我們再手動傳入 `id`。

也就是說，沒有預設值的屬性，通常需要在建構函式中傳入；已經有預設值的屬性，通常可以直接使用原本的預設值。

因此，當我們建立 `Student` 實例時，只需要傳入 `name`、`sex`、`phone`、`age` 和 `address`。

### 編譯器提示

此外，當我們在 Xcode 中輸入 `Student(...)` 時，也能看到系統給出的參數提示。

![student](../../Resource/022_student.png)

這其實也說明了：目前這個型別確實存在一個系統自動產生的建構函式。

### 自己撰寫建構函式

雖然系統可以自動產生建構函式，但有時候，這個預設的初始化方式並不完全符合我們的需求。

例如，我們有一個 `Movie` 結構體：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

按照系統自動產生的建構函式，我們在建立實例時，必須同時傳入這三個參數：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

但是，如果我們現在要輸入一批老電影，只知道電影名稱，不知道導演和評分，就會比較麻煩。

因為我們只能這樣寫：

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

雖然可以運作，但每次都重複寫 `--`，並不方便。

這時候，我們就可以撰寫一個建構函式：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

這樣一來，我們在建立老電影時，只需要傳入 `name`：

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

這就是自己撰寫建構函式的其中一個意義：**讓實例的建立方式更符合實際需求。**

### 解析自訂建構函式

我們來看一下剛才這個手寫的建構函式：

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

這段程式碼的含義是，在建立 `Movie` 實例時，只要求傳入一個 `name` 參數。

然後，建構函式內部會把傳入的 `name` 賦值給實例自己的 `name`，並且給 `director` 和 `rating` 一個預設值 `--`。

這裡的 `self` 表示「目前這個實例本身」。

例如：

```swift
self.name = name
```

左邊的 `self.name`，表示實例中的屬性；右邊的 `name`，表示我們傳入的參數。

可以簡單理解為，把外面傳入的值，儲存到實例自己的屬性中。

當所有屬性都完成賦值後，這個實例就建立完成了。

### 建構函式機制

當我們明確宣告了一個建構函式後，還會帶來一個變化：

系統原本自動產生的那個建構函式，通常就不能再直接使用了。

例如：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

現在我們再這樣寫：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

編譯器就會報錯：

```swift
Extra arguments at positions #2, #3 in call
```

意思是：你傳入了多餘的參數。

為什麼會出現這個錯誤呢？

因為目前這個 `Movie` 結構體裡，只有你手動宣告的這一種建構函式：

```swift
init(name: String)
```

它只接受一個參數 `name`，並不接受 `director` 和 `rating`。

也就是說，當你手動加入自己的建構函式後，原本自動產生的那種初始化方式，就不能再直接用了。

如果我們既希望支援「只傳入名稱」，又希望支援「傳入完整資訊」，就需要自己再補寫一個完整的建構函式：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

這樣，我們就有了兩個不同的建構函式。

建立老電影時，可以這樣寫：

```swift
Movie(name: "The Night of the Hunter")
```

建立資訊完整的新電影時，可以這樣寫：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

這種寫法也說明：同一個型別可以擁有多個建構函式，只要它們的參數形式不同即可。

## 什麼是多載

這裡再補充一個必要知識點。

剛才我們為 `Movie` 寫了兩個 `init`：

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

這種「同一個函式名稱，但參數不同」的寫法，叫做「多載」。

在這裡，兩個函式都叫 `init`，但是它們接收的參數不一樣，所以 Swift 可以分辨你呼叫的是哪一個函式。

例如：

```swift
Movie(name: "Days of Heaven")
```

會呼叫：

```swift
init(name: String)
```

而：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

則會呼叫另一個完整版本的初始化方法。

所以，多載的作用就是：讓同一個型別可以根據不同情境，提供不同的建立方式。

## 認識 class

接下來，我們再簡單認識一下 `class`。

除了 Swift 中常見的 `struct`，很多程式語言也會使用 `class` 來建立實例，例如 Java、C#、Kotlin 等。

在 Swift 中，`class` 的寫法和 `struct` 非常接近。

例如：

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

你會發現，除了關鍵字從 `struct` 變成了 `class`，其他部分看起來幾乎一樣。

建立實例的方式也很相似：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

所以，在語法層面，`struct` 和 `class` 的確很像。

### Struct 和 Class 的差異

雖然 `struct` 和 `class` 看起來很像，但它們並不完全相同。

**1. 初始化方式不同**

對於 `struct` 來說，如果沒有手動寫建構函式，系統通常會自動產生合適的初始化方法。

但對於 `class` 來說，如果還有屬性沒有預設值，那通常就需要手動撰寫 `init`，否則就會報錯。

例如：

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

這個 `class` 因為沒有建構函式，導致屬性沒有被初始化，因此會報錯。

編譯器會提示類似：

```swift
Class 'Movie' has no initializers
```

所以，在這個例子裡，`class` 必須手動撰寫建構函式。

**2. `struct` 是值型別，`class` 是參考型別**

`struct` 是值型別，`class` 是參考型別。

在初學階段，不需要完全掌握這兩個概念，只要先有一個簡單的理解即可。

例如，`struct` 更像是「複製一份新的值」。

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

這裡把 `user1` 賦值給 `user2` 之後，就相當於複製出一份新的資料，所以修改 `user2`，不會影響 `user1`。

而 `class` 更像是「共同指向同一個實例」。

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

這裡的 `user1` 和 `user2` 指向的是同一個實例。

現在我們不需要完全理解值型別與參考型別的底層機制，只需要知道 `struct` 更適合保存獨立資料，`class` 更適合多個地方共用同一個實例。

## 初學階段如何選擇

對於目前這個階段，普通的 data model 優先考慮 `struct`，需要共享、同步修改的資料，再考慮 `class`。

這並不是絕對規則，但對初學者來說，是一個足夠實用的判斷方式。

特別是在 SwiftUI 中，很多時候你會發現，`struct` 已經可以完成大部分工作。

此外，在很多程式設計資料中，也會把 `class` 建立出來的內容叫做「物件」。在初學階段，你可以先把它理解成實例，不必刻意區分。

## 總結

這節課，我們深入學習了 `struct`，也順便認識了 `class`；兩者都可以用來定義型別。

型別可以建立實例。建立實例時，會呼叫建構函式，也就是 `init`。

對於 `struct` 來說，如果沒有手動撰寫建構函式，系統通常會自動產生一個合適的建構函式。如果預設的建構函式不符合需求，我們也可以手動撰寫建構函式。

此外，我們也初步了解了 `struct` 和 `class` 的差異：`struct` 是值型別，`class` 是參考型別。在 SwiftUI 中，初學階段更常接觸到的通常是 `struct`。

之後當我們學習視圖傳值、資料模型和狀態管理時，這些內容都會持續用到。
