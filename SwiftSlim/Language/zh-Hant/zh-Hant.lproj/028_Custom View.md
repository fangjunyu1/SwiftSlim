# 自訂視圖

這節課，我們學習一種非常重要的 SwiftUI 寫法：**自訂視圖**。

自訂視圖可以將一段重複的視圖程式碼封裝起來，變成一個可以反覆使用的視圖。

在實際開發 App 時，我們經常會遇到這種情況：很多介面的結構是一樣的，只是顯示的內容不同。

比如論壇網站的貼文列表，每一則貼文可能都有標題、圖片、按讚數量等資訊。

![Reddit](../../../Resource/028_view1.png)

購物網站的商品列表，每一個商品可能都有圖片、名稱和價格等資訊。

![Amazon](../../../Resource/028_view2.png)

這些內容的結構是類似的，差別只是顯示的資料不同。

如果每一項都手動寫一遍程式碼，程式碼會變得很長，也不方便後續修改。

所以，我們可以將相同的結構封裝成一個自訂視圖，然後將不同的內容作為參數傳入。

這樣，同一個視圖就可以顯示不同的內容。

## 需求場景

例如，我們現在要製作一個設定列表。

顯示效果：

![view](../../../Resource/028_view.png)

這個設定列表中，有三個不同的設定項目，分別是 `設定`、`資料夾`、`音樂`。

雖然它們的圖示、顏色和標題不同，但是整體結構是一樣的：

- 左側圖示
- 圖示背景顏色
- 中間標題
- 右側箭頭

如果不使用自訂視圖，我們可能會這樣寫：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("設定")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("資料夾")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("音樂")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

這段程式碼可以正常顯示，但是問題也很明顯：三個設定項目的程式碼幾乎完全一樣。

不同的地方只有圖示、顏色和標題：

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("設定")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("資料夾")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("音樂")
```

也就是說，每個設定項目的結構是固定的，只有圖示、顏色和標題不同。

這種情況就非常適合使用自訂視圖。

### 陰影 shadow

這裡使用了一個新的修飾符 `.shadow(radius:)`：

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` 可以給視圖添加陰影。

`radius` 表示陰影的模糊半徑，數值越大，陰影擴散範圍通常越大，看起來也會更柔和。

在這裡設定為 `1`，表示只添加一個很輕微的陰影效果。

## 封裝設定項目視圖

接下來，我們將每一個設定項目封裝成一個新的視圖。

可以建立一個 `SettingItemView`：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

在這個視圖中，我們定義了三個屬性：

```swift
let icon: String
let color: Color
let title: String
```

其中：

- `icon` 表示圖示名稱
- `color` 表示圖示背景顏色
- `title` 表示設定項目標題

因為這三個內容在不同設定項目中是不一樣的，所以我們將它們做成可以從外部傳入的參數。

## 使用自訂視圖

有了 `SettingItemView` 之後，我們就不需要重複寫一大段 `HStack` 程式碼了。

現在可以這樣使用：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

這行程式碼表示建立一個設定項目視圖，並傳入三個參數：

```swift
icon: "gear"
color: Color.blue
title: "設定"
```

傳入後，`SettingItemView` 內部的屬性會取得對應的值：

- `icon` 的值是 `gear`
- `color` 的值是 `Color.blue`
- `title` 的值是 `"設定"`

因此，視圖內部的 `Image(systemName: icon)` 會顯示齒輪圖示，`.background(color)` 會使用藍色背景，`Text(title)` 會顯示 `設定`。

完整程式碼：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "設定")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "資料夾")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "音樂")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

顯示效果：

![view](../../../Resource/028_view.png)

可以看到，封裝之後的顯示效果和之前一樣，但是程式碼變得更清楚了。

原來每個設定項目都要寫一整段 `HStack`，現在只需要一行程式碼：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

這就是自訂視圖的作用：**將重複的視圖結構封裝起來，只將不同的內容作為參數傳入。**

## 為什麼可以傳遞參數

接下來，我們簡單理解一下，為什麼自訂視圖可以傳遞參數。

在 SwiftUI 中，視圖本質上是一個結構體。

例如：

```swift
struct ContentView: View {
    var body: some View {
        Text("你好，世界！")
    }
}
```

這裡的 `ContentView` 是一個結構體。

當我們寫：

```swift
ContentView()
```

其實就是在建立一個 `ContentView` 視圖。

後面的 `()` 表示呼叫它的初始化方法，也可以理解為建立這個視圖。

因為這個 `ContentView` 沒有需要從外部傳入的屬性，所以可以直接寫：

```swift
ContentView()
```

但是，如果視圖中有尚未賦值的屬性，就需要在建立視圖時傳入對應的值。

例如：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("名稱： \(name)")
    }
}
```

這裡的 `name` 是一個屬性，而且沒有預設值。

所以建立 `ContentView` 時，必須給 `name` 一個具體的值：

```swift
ContentView(name: "Fang Junyu")
```

這樣，視圖內部才能使用這個值：

```swift
Text("名稱： \(name)")
```

這也是我們建立 `SettingItemView` 時需要傳入參數的原因：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

因為 `SettingItemView` 中有三個沒有預設值的屬性：

```swift
let icon: String
let color: Color
let title: String
```

所以建立這個視圖時，就需要將它們傳入。傳入的參數，會被 Swift 用來為視圖內部的屬性賦值。

## 初始化方法

接下來，我們再進一步理解初始化方法。

### 預設初始化方法

當我們定義一個普通視圖時：

```swift
struct ContentView: View {
    var body: some View {
        Text("你好，世界！")
    }
}
```

在這段程式碼中，我們沒有手動寫初始化方法。

但是，當我們使用這個視圖時，可以這樣寫：

```swift
ContentView()
```

這裡的 `()` 其實就表示在建立 `ContentView`，也可以理解為呼叫它的初始化方法。

### 為什麼沒有初始化方法，仍然可以呼叫？

因為 Swift 編譯器會自動幫我們產生一個初始化方法。

需要注意的是，**這個初始化方法是自動產生的，我們通常不會在程式碼中直接看到它。**

也就是說，雖然我們沒有在 `struct` 中手動寫：

```swift
init() {

}
```

但是 Swift 編譯器會在背後幫我們產生一個類似這樣的初始化方法：

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("你好，世界！")
    }
}
```

這就是為什麼我們可以直接寫：

```swift
ContentView()
```

因此，在實際程式碼中，我們通常不需要手動將初始化方法寫出來。

只需要理解一點：**建立 SwiftUI 視圖時，會呼叫視圖的初始化方法。即使我們沒有手動寫初始化方法，Swift 也可能會自動幫我們產生。**

### 帶參數的初始化方法

如果視圖中有一個沒有預設值的屬性，例如：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("名稱： \(name)")
    }
}
```

Swift 編譯器會根據屬性，自動產生一個帶參數的初始化方法。

可以簡單理解為：

```swift
init(name: String) {
    self.name = name
}
```

這裡的：

```swift
init(name: String)
```

表示建立 `ContentView` 時，需要傳入一個 `String` 類型的 `name` 參數。

當我們寫：

```swift
ContentView(name: "Fang Junyu")
```

意思是：將 `"Fang Junyu"` 作為參數傳給初始化方法。

然後初始化方法內部會執行：

```swift
self.name = name
```

這行程式碼的意思是：將外部傳入的 `name`，賦值給目前視圖自己的 `name` 屬性。

可以簡單理解為：

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("名稱： \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

這樣，視圖內部就可以使用傳入的值了。

這就是帶參數視圖的初始化流程：**當視圖內的屬性沒有預設值時，建立視圖時就需要傳入對應參數，讓初始化方法完成屬性賦值。**

## 屬性有預設值的情況

如果屬性已經有預設值，那麼建立視圖時可以不傳參數。

例如：

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("名稱： \(name)")
    }
}
```

這裡的 `name` 已經有一個預設值：

```swift
"Fang Junyu"
```

所以建立 `ContentView` 時，可以直接寫：

```swift
ContentView()
```

這時，`name` 會使用預設值，介面顯示：

```swift
名稱： Fang Junyu
```

當然，也可以在建立視圖時傳入一個新的值：

```swift
ContentView(name: "Sam")
```

這時，視圖會使用外部傳入的 `"Sam"`，而不是使用預設值，介面顯示：

```swift
名稱： Sam
```

為了方便理解，可以將 Swift 編譯器自動產生的初始化方法簡單看成這樣：

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

這裡的 `name: String = "Fang Junyu"` 表示：如果建立視圖時沒有傳入 `name`，就使用預設值 `"Fang Junyu"`；如果建立視圖時傳入了新的 `name`，就使用傳入的值。

也就是說：**如果外部沒有傳入參數，就使用屬性的預設值；如果外部傳入了參數，就使用傳入的值。**

## 回到 SettingItemView

現在我們再回來看 SettingItemView：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

這個視圖的結構是固定的。

固定的部分包括：

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

不同的部分包括：

```swift
icon
color
title
```

所以，我們將不同的內容做成屬性，並在建立視圖時透過參數傳入。

當我們建立不同的設定項目時，只需要傳入不同的參數：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
SettingItemView(icon: "folder", color: Color.brown, title: "資料夾")
SettingItemView(icon: "music.note", color: Color.purple, title: "音樂")
```

這樣，同一個 `SettingItemView` 就可以顯示三個不同的設定項目。

這就是自訂視圖最常見的使用方式。

## 總結

這節課，我們學習了自訂視圖。

自訂視圖的核心作用是：**將重複的視圖程式碼封裝起來，讓它可以重複使用。**

在這個案例中，三個設定項目的結構是相同的，只有圖示、顏色和標題不同。

所以我們建立了一個 `SettingItemView`：

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

然後，在使用這個視圖時傳入不同的參數：

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

這裡的參數會進入 `SettingItemView` 內部。

透過這種方式，我們就可以用更少的程式碼，建立結構相同但內容不同的視圖。

這也是 SwiftUI 開發中非常常見的一種寫法。
