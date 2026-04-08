# 電影清單

這節課，我們將製作一個電影清單。

![movie](../../Resource/021_movie.png)

清單中會顯示每一部電影的海報、名稱、導演和評分。

在這個案例中，我們會學習一個非常重要的知識點：`struct` 結構體。它可以幫助我們把一部電影的多個資訊組合成一個整體。除此之外，我們還會接觸 `UUID()`、`ForEach`、`Divider` 分隔線，以及如何使用自訂物件來管理資料。

這些知識在後面的 SwiftUI 開發中非常常見。學完這節課後，你不僅可以做出一個電影清單，還能開始理解「如何把一組資料顯示成介面」。

## 單部電影

我們可以先從單個電影的介面開始製作。

![movie](../../Resource/021_movie1.png)

這個介面的佈局主要由兩部分組成：左側是電影海報，右側是電影介紹。

### 電影海報

左側顯示的是電影海報，我們可以使用 `Image` 來顯示圖片。

例如：

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

這段程式碼表示，顯示一張名稱為 `"The Shawshank Redemption"` 的圖片。

這裡需要注意，圖片名稱必須真實存在於 `Assets` 資源資料夾中，否則介面無法正確顯示這張圖片。

![movie](../../Resource/021_movie2.png)

這幾個修飾符的作用分別是：

- `resizable()` 表示圖片可以調整大小。
- `scaledToFit()` 表示在縮放時保持原始比例，避免圖片被拉伸變形。
- `frame(height: 180)` 表示把圖片的高度設定為 180。
- `cornerRadius(10)` 表示給圖片設定 10 的圓角。

這樣，我們就能得到一張大小合適、帶圓角的電影海報圖片。

![movie](../../Resource/021_movie3.png)

### 電影介紹

右側顯示的是電影介紹，包括電影名稱、導演和評分。

![movie](../../Resource/021_movie4.png)

我們可以使用 `Text` 顯示這部分內容：

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

這段程式碼中，`.font` 表示字體的大小，`.fontWeight` 表示字體的粗細。

為了讓「電影名稱」、「導演資訊」和「評分資訊」之間有更清晰的間距，這裡在最外層使用了 `VStack`，並設定了：

```swift
spacing: 10
```

這表示這個 `VStack` 內部的每一組內容之間，間距都是 10。

導演和評分之所以各自再使用一個 `VStack` 包裹，是因為它們都屬於「標題 + 內容」這樣的結構。因此，介面層次會更清楚，也更方便我們後續繼續調整樣式。

另外，`VStack` 預設是置中對齊。為了讓文字整體向左對齊，我們設定：

```swift
alignment: .leading
```

這樣電影介紹部分看起來更整齊。

### 分隔線

現在，電影介紹中的內容雖然透過 `spacing` 拉開了距離，但不同內容之間的分界仍然不夠明顯。

這時，我們可以加入分隔線：

```swift
Divider()
```

例如：

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

這樣，電影介紹部分就會多出明顯的分隔效果。

![movie](../../Resource/021_movie4.png)

`Divider` 是一個非常簡單但很常用的視圖，它的作用是把不同內容分隔開。

在 `VStack` 中，`Divider()` 顯示為一條橫線。

在 `HStack` 中，`Divider()` 顯示為一條豎線。

此外，還可以透過 `.frame`、`.background`、`.padding` 等方式，修改 `Divider` 的樣式。

例如：

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

這會產生一條藍色、厚度為 2、左右帶有內邊距的分隔線。

![divider](../../Resource/021_divider.png)

### 完整介面

最後，我們可以使用 `HStack`，把電影海報和電影介紹左右排列起來。

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

這裡的 `HStack(spacing: 20)` 表示左右兩個部分之間保留 20 的間距。

需要注意的是，`Divider()` 和前面講過的 `TextField`、`Slider` 一樣，預設會盡量占用可用空間。

因此，我們給右側介紹部分的外層 `VStack` 設定一個固定寬度：

```swift
.frame(width: 200)
```

這樣可以讓分隔線和文字區域的寬度保持一致，整體看起來會更整齊。

到這裡，我們就完成了「單部電影」的顯示介面。

![movie](../../Resource/021_movie1.png)

## 陣列儲存電影

如果我們要把多部電影按照同樣的樣式依次顯示出來，就意味著每一部電影都要寫一遍類似的程式碼。

例如：

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

雖然這樣寫的程式碼也可以達到效果，但程式碼會越來越多，而且維護起來會很不方便。

例如，如果需要把所有電影之間的間距從 `20` 改成 `15`，或者把右側部分的寬度從 `200` 改成
`220`，就得手動修改每一個重複的程式碼片段。

很明顯，這不是一種高效率的方法。

前面我們已經學過陣列，也學過如何透過 `ForEach` 根據陣列重複顯示 views。

例如：

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

這種方式非常適合處理「只有一種資料」的情況，例如一組圖片名稱。

但是，一部電影不只有一個值。它至少包含：

1. 電影海報
2. 電影名稱
3. 導演
4. 評分

換句話說，一部電影其實是一組相關資料，而不是單獨的一個字串。

如果只使用陣列，那麼我們只能把這些資訊分開儲存：

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

顯示的時候，就得依賴相同的索引把它們一一對應起來：

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

這種寫法的問題在於，維護成本非常高。

因為一部電影的資料被分散在多個陣列裡，只要其中一個陣列多了一項、少了一項，或者順序不同，顯示結果就會出錯。

特別是在新增或刪除電影時，你必須同時修改多個陣列，而且很容易漏掉某一個。

那麼，像「電影名稱、導演、評分」這樣的資料，要如何組合成一個整體呢？

這就需要用到 `struct`。

## 定義 `struct`

在 Swift 中，`struct` 的意思是「結構體」。

你可以把它理解為一種「自訂資料型別」，它能把多個相關欄位組合成一個整體。

基本用法：

```swift
struct StructName {
	let name: String
}
```

這段程式碼中，`struct` 是關鍵字，表示我們正在定義一個結構體。`StructName` 是這個結構體的名稱。

大括號裡面的內容，就是這個結構體所包含的欄位，每個欄位都需要明確寫出名稱和型別。

通常 `struct` 的名稱會以大寫字母開頭，例如 `Movie`、`Student`、`UserInfo`。這是 Swift 中很常見的命名慣例。

你可以把 `struct` 想成一個空的包裝盒，而每個欄位就像盒子裡預先準備好的空位。

這些空位在還沒放入內容之前，它只是一個空盒子。只有當所有欄位都填入對應的值之後，它才會變成一個完整的禮盒。

### `struct` 實例

前面我們只是定義了結構體本身，也就是準備好盒子的形狀。

我們還需要把具體的內容放進去，才能得到真正可以使用的「實例」。

建立實例時，通常會在結構體名稱後面加上 `()`：

```swift
StructName(...)
```

括號裡面填入的，就是這個結構體所需要的欄位內容。

例如：

```swift
StructName(name: "Fang Junyu")
```

這段程式碼表示：按照 `StructName` 結構體的格式建立一個新的實例，並把 `"Fang Junyu"` 指定給 `name` 欄位。

當我們把所有需要的欄位內容都填好，就等於把盒子裝滿了。

這時，我們就得到了一個完整的結構體實例。

### 存取 `struct` 的屬性

當我們建立好實例後，就可以使用「點語法」去存取它內部的屬性。

基本寫法：

```swift
instance.propertyName
```

例如：

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

這裡的 `st` 是一個結構體實例，而 `st.name` 表示讀取這個實例中的 `name` 值。

這種讀取方式可以理解為：當我們寫 `st.name`，就像是在讀取盒子裡某個位置所放的內容。

這種寫法在後面的 SwiftUI 介面中會非常常見。

例如，如果我們有一個包含姓名、年齡、班級的學生結構體，在介面顯示時就可以分別讀取：

```swift
student.name
student.age
student.className
```

這樣做的好處是，資料會更清楚，也更容易管理。

### `struct` 的位置

對初學者來說，通常把結構體寫在 `ContentView` 外面會比較方便。

例如：

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

這樣一來，結構體會更清楚，也更容易閱讀。

你會發現，`ContentView` 本身其實也是一個 `struct`。

### `Movie` 結構體

有了前面的基礎後，我們就可以定義一個電影結構體：

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

這是一個名為 `Movie` 的結構體，包含 `name`、`director`、`rating` 三個欄位，分別表示電影名稱、導演和評分。

這樣一來，一部電影相關的資訊就不需要再拆散成多個陣列，而是可以直接組合成一個整體。

例如，我們可以建立這樣一個電影實例：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

這個實例就代表「一組完整的電影資料」。

### 在陣列中儲存結構體

前面我們提過，陣列只能儲存同一種類型的資料。

現在我們已經有了 `Movie` 結構體，因此陣列裡就可以儲存多個 `Movie`。

```swift
let lists: [Movie] = []
```

例如：

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

這個 `lists` 陣列裡儲存的已經不是字串，而是多個 `Movie` 實例。

也就是說，陣列中的每一個元素都是一部完整的電影。

這樣一來，當我們要顯示電影清單時，就可以使用 `ForEach` 依序讀取每一部電影。

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

這裡的 `movie in` 表示每次迴圈都會從陣列中取出一部電影，並暫時命名為 `movie`。

接著，我們就可以使用：

```swift
movie.name
movie.director
movie.rating
```

去分別讀取這部電影的名稱、導演和評分，並將它們顯示在介面上。

## `ForEach` 錯誤

到這裡，我們已經完成了電影陣列與 `ForEach` 的基本寫法。

但是如果直接執行下面這樣的程式碼：

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

就會出現一個錯誤：

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

這個錯誤的意思是，當你寫 `id: \.self` 時，SwiftUI 需要把陣列中的每一個元素本身當成「唯一識別值」來區分它們。

這種寫法適合 `String`、`Int` 這類簡單型別，因為它們本身比較容易被區分。

但 `Movie` 是我們自訂的結構體，`ForEach` 並不知道該如何把這個結構體本身當成唯一識別值，因此就會報錯。

解決這個問題最常見的方法，就是讓 `Movie` 遵循 `Identifiable` 協定。

## 協定

在 Swift 中，協定可以理解為一種「規則」或「要求」。

你可以把它想像成國際組織中的協議：如果某個國家想加入一個國際組織，通常要先滿足這個組織提出的一些規則、公開一些資料，並遵守共同規範。只有達到這些條件後，它才可以加入，或參與某些事務。

協定的運作邏輯也很像。

當某個型別想遵循某個協定時，它就必須滿足這個協定所要求的內容。只有符合這些要求之後，這個型別才能使用對應的功能。

基本寫法：

```swift
struct Movie: Identifiable {
    // ...
}
```

這裡的 `: Identifiable` 表示 `Movie` 遵循了 `Identifiable` 協定。

如果一個型別同時遵循多個協定，可以用逗號分隔：

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

對於 `Identifiable` 來說，最重要的要求就是這個型別必須擁有一個可以識別自己的 `id`。

例如：

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

這裡的 `id` 就像身分證號碼，用來區分每一部電影。

只要每部電影的 `id` 都不同，SwiftUI 就能正確區分陣列中的每一個元素。

例如：

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

然後在 `ForEach` 中使用：

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

這樣就不會再報錯了。

由於 `Movie` 已經遵循了 `Identifiable`，更常見的寫法是直接省略 `id:`：

```swift
ForEach(lists) { movie in
    // ...
}
```

因為 SwiftUI 已經知道要使用 `movie.id` 來區分每一個項目。

## `ForEach` 中的識別 id

下面我們更深入理解 `id` 在 `ForEach` 裡的作用。

例如：

```swift
ForEach(lists, id: \.self)
```

這裡的意思是：把元素本身當成識別 id。

而：

```swift
ForEach(lists, id: \.id)
```

則表示：把元素的 `id` 欄位當成識別 id。

如果某個欄位本身就能保證唯一性，也可以暫時拿來使用。

例如，如果每部電影的名稱都不一樣，那麼下面這樣的寫法在目前資料下也能正常運作：

```swift
ForEach(lists, id: \.name)
```

但這裡有一個隱藏問題：`name` 並不一定永遠唯一。

假設之後你又加入了一部同名電影，那麼 `name` 就無法再準確區分每一個元素。

這時即使程式碼仍然可以編譯，但在 view 更新、插入、刪除或修改時，SwiftUI 可能會錯誤辨識元素，導致顯示異常。

因此，當我們需要穩定區分資料時，最好還是使用真正唯一的欄位，也就是 `id`。

## UUID

雖然手動寫 `id: 1`、`id: 2` 可以解決問題，但仍然存在一個風險：你可能不小心寫出重複的 `id`，這樣唯一識別就會失效。

例如：

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

這樣就會出現兩個相同的 `id`，唯一識別也就失效了。

為了避免手動出錯，我們通常會使用 `UUID()`。

在 Swift 中，`UUID()` 會隨機產生一個 128 位元的識別值。它通常顯示為一長串由字母和數字組成的字串。

例如：

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

這裡的 `UUID()` 其實是在建立一個 `UUID` 型別的實例；你可以把它理解為系統自動產生的一個「唯一號碼」。

因此，每次建立出來的值幾乎都不會重複，非常適合作為 `id` 使用。

我們可以把 `Movie` 改成這樣：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

這段程式碼表示，`Movie` 結構體中的 `id` 欄位預設會被賦予一個新的 `UUID` 實例。

換句話說，每當我們建立一個新的 `Movie`，系統都會自動先幫我們產生一個唯一的 `id`。

由於 `id` 已經有預設值，因此後續在建立 `Movie` 實例時，就不需要再手動填寫 `id`。

例如：

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

雖然這裡沒有寫 `id`，但實際上每個電影實例仍然擁有自己的 `id`；只是這個值已經由 `UUID()` 自動產生了。

使用這種方式後，我們不再需要手動替每一部電影填寫 `id`，不僅能減少程式碼量，也能避免重複 id 帶來的錯誤。

最後，我們只需要在上方加入一張 `Banner` 圖片，並使用 `ScrollView` 讓內容可以捲動，整個電影清單的畫面就完成了。

## 總結

這節課中，我們學習了一個非常重要的知識點：`struct`。

透過 `struct`，我們可以把一部電影的多個相關欄位組合成一個整體，而不是把名稱、導演和評分分散在多個陣列中。

當資料被組合起來後，我們就可以使用 `ForEach`，把陣列中的每一部電影依序顯示在 view 裡。

同時，我們也理解了 `ForEach` 中「識別 id」的作用。SwiftUI 必須知道如何區分陣列中的每一個元素，才能正確顯示與更新 view。

因此，我們讓 `Movie` 遵循 `Identifiable` 協定，並提供一個唯一的 `id`。

為了避免手動填寫 `id` 時出錯，我們進一步學習了 `UUID()`，讓系統能夠自動產生唯一識別值。

學完這節課後，你不僅完成了一個電影清單，也開始接觸 SwiftUI 中一個重要的觀念：**先整理資料，再根據資料生成 view。**

## 完整程式碼

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
