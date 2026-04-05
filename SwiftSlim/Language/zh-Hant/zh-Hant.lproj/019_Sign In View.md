# 登入視圖

這節課，我們來學習一個非常實用的場景 —— 登入視圖。

無論是網站還是 App，在使用過程中，很多時候都需要使用者登入帳號並輸入密碼。

例如，GitHub 登入頁面：

![WordPress](../../Resource/019_github.png)

這節課中，我們會製作一個類似的登入視圖，讓使用者手動輸入帳號和密碼，並檢查輸入內容是否有問題。

## 頂部佈局

我們將在 `ContentView` 檔案中編寫登入視圖的程式碼。

首先，我們來編寫登入視圖頂部的標識區域，你可以先準備一張合適的圖示圖片，並把它放到 `Assets` 資料夾中。

![icon](../../Resource/019_icon1.png)

然後，使用 `Image` 和修飾符顯示圖片：

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

這裡的幾個修飾符表示：

- `resizable()`：讓圖片可以調整大小。
- `scaledToFit()`：保持圖片原本的比例進行縮放。
- `frame(width: 100)`：設定圖片顯示寬度為 `100`。

接下來，使用 `Text` 和修飾符顯示登入標題：

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

然後，使用 `VStack` 把圖片和文字上下排列起來：

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

實現效果：

![view](../../Resource/019_view.png)

到這裡，我們就完成了登入視圖頂部的標題區域。

### 優化佈局

現在，圖片和標題預設處於整體佈局的中間區域。

如果我們希望它們更像一個「頁面頂部的登入標識」，就可以使用 `Spacer()` 把剩餘空間撐開，讓內容靠近頂部顯示。

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

實現效果：

![view](../../Resource/019_view1.png)

不過現在，`Image` 和 `Text` 又離螢幕頂部太近，看起來有些擁擠。

這時，我們可以使用 `padding` 給整個 `VStack` 增加頂部間距。

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

實現效果：

![view](../../Resource/019_view2.png)

這樣，頁面頂部的標題區域看上去更合適一些。

## 使用者名稱和密碼

登入頁面通常需要使用者輸入使用者名稱和密碼。

在 SwiftUI 中，我們可以使用 `TextField` 來接收使用者輸入的內容。

但是要注意：`TextField` 自己不會長期保存輸入的資料，它只是一個輸入控制項。真正保存這些輸入內容的，是我們綁定給它的變數。

因此，我們需要先建立兩個 `@State` 變數，用來保存使用者名稱和密碼：

```swift
@State private var user = ""
@State private var password = ""
```

當 `@State` 變數的值發生變化時，SwiftUI 會自動重新整理相關視圖。

接下來，使用 `TextField` 綁定這兩個變數：

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

這裡的 `$user` 和 `$password` 表示「綁定」。

也就是說，當使用者在輸入框輸入文字時，變數會同步發生變化；當變數發生變化時，輸入框顯示的內容也會同步改變。

這個「視圖和資料互相同步」的關係，就是綁定。

注意，這裡要使用的是帶 `$` 的寫法：

```swift
$user
```

因為 `TextField` 需要的不是普通的字串，而是一個「可以雙向修改資料」的綁定值。

### 顯示輸入框

把它們放到 `ContentView` 中：

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

顯示效果：

![view](../../Resource/019_view3.png)

因為現在 `user` 和 `password` 預設都是空字串：

```swift
""
```

所以輸入框中會先顯示預留文字，例如：

```swift
input user
```

這段文字只是提示使用者「這裡應該輸入什麼」，並不是真正的輸入內容。

### 優化輸入框

現在，輸入框已經可以使用了，但預設樣式比較簡單。

為了讓介面更清楚，我們可以在輸入框前面新增標題，並對輸入框本身做一點簡單的樣式優化。

例如，先新增一個標題：

```swift
Text("Username")
    .fontWeight(.bold)
```

然後，使用 `HStack` 把標題和輸入框放到同一行中：

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

這裡使用 `HStack`，是因為我們希望「左邊顯示標題，右邊顯示輸入框」。

需要注意的是，`TextField` 預設會佔用剩餘的可用空間。

![color](../../Resource/019_view6.png)

為了讓兩個輸入框的大小更統一，我們可以使用 `frame(width:)` 為它設定一個寬度，讓輸入框看起來更整齊。

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

再新增一個邊框，讓輸入框更明顯一些：

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

現在，我們把使用者名稱和密碼都加到 `ContentView` 視圖上：

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

顯示效果：

![view](../../Resource/019_view4.png)

到這裡，使用者就可以輸入使用者名稱和密碼了。

## 登入按鈕

下面，我們在輸入框底部新增一個登入按鈕。

```swift
Button("Sign in") {

}
```

然後，使用 `buttonStyle` 給按鈕新增更明顯的系統樣式：

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

顯示效果：

![view](../../Resource/019_view5.png)

為了確認按鈕是否真的能回應點擊，我們可以先在按鈕中寫一個 `print` 來測試：

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

當點擊按鈕時，控制台會輸出：

```swift
click Sign in
```

這說明按鈕已經成功回應了點擊操作。

## 登入邏輯

現在，我們給登入按鈕新增一個最基礎的檢查邏輯：**檢測使用者是否輸入了使用者名稱和密碼**。

我們希望實現下面幾種情況：

- 如果使用者什麼都沒有輸入，輸出 `Empty`
- 如果使用者只輸入了其中一項，提示缺少哪一項
- 如果使用者名稱和密碼都輸入了，輸出 `Success`

### 沒有輸入任何資訊

因為 `user` 和 `password` 預設都是空字串：

```swift
@State private var user = ""
@State private var password = ""
```

所以當使用者什麼都沒輸入時，它們仍然是空的。

在 Swift 中，像 `String` 這樣的型別可以使用 `isEmpty` 來判斷內容是否為空。

### isEmpty 屬性

`isEmpty` 常用於檢查字串、陣列等內容是否為空。

例如：

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

如果內容為空，`isEmpty` 會回傳 `true`；如果內容不為空，`isEmpty` 會回傳 `false`。

因此，我們可以利用它來判斷使用者名稱和密碼有沒有輸入內容。

### 使用 isEmpty 檢測變數

如果使用者沒有輸入任何資訊，那麼：

```swift
user.isEmpty // true
password.isEmpty    // true
```

這時，我們可以這樣寫判斷：

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

這段程式碼表示：如果 `user` 是空的，並且 `password` 也是空的，就輸出：

```swift
Empty
```

這裡的 `&&` 是邏輯運算子，表示「而且」。

也就是說，左邊條件成立，右邊條件也成立時，整個判斷才成立。

所以，只有當使用者名稱和密碼都為空時，這段程式碼才會執行。

## 使用者只填寫了一部分

接下來，我們考慮另一種情況：使用者只填寫了使用者名稱，或者只填寫了密碼。

例如：

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

這時，使用者名稱不為空，但密碼為空。

我們可以繼續使用 `isEmpty` 來判斷：

### 使用者填寫帳戶或密碼的情況

如果使用者只填寫了使用者名稱或者密碼，我們需要給出對應的缺失提示。

例如，使用者只填寫了使用者名稱：

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

這段程式碼的邏輯是：如果使用者名稱為空，提示填寫使用者名稱。否則，檢查密碼是否為空，如果密碼為空，提示填寫密碼。

### 使用者填寫了全部資訊

如果使用者名稱和密碼都已經輸入，那麼它們的 `isEmpty` 都會回傳 `false`。

這時，我們可以寫成：

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

這裡的 `!` 表示「取反」。

例如：

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

也就是說，`user.isEmpty` 用來判斷「使用者名稱是否為空」，`!user.isEmpty` 用來判斷「使用者名稱是否不為空」。

密碼也是同樣的邏輯。

所以，這段程式碼的含義是：使用者名稱不為空，並且密碼也不為空。

當這兩個條件都成立時，輸出：

```swift
Success
```

## 完整檢查邏輯

現在，我們把這三種情況組合起來，寫進 `Button` 中：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

這段程式碼的執行順序可以這樣理解：

第一步，先判斷：

```swift
if user.isEmpty && password.isEmpty
```

如果使用者名稱和密碼都為空，就直接輸出 `Empty`。

如果都不為空，就繼續判斷下面這一句：

```swift
else if user.isEmpty || password.isEmpty
```

這裡的 `||` 表示「或者」。

也就是說，只要有一個條件成立，整體就成立。

因此，只要使用者名稱為空，或者密碼為空，就會執行 `else if` 的程式碼區塊。

進入程式碼區塊後，再進一步判斷到底是哪個輸入框沒有填：

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

如果前面兩個條件都不成立，就說明使用者名稱不為空，密碼也不為空。

那麼程式就會進入最後的 `else`：

```swift
print("Success")
```

這樣，我們就完成了最基礎的登入輸入檢查邏輯。

## 使用者名稱和密碼檢查

上面的邏輯只是檢查「有沒有輸入內容」。

但在真實的 App 中，僅僅輸入內容還不夠。通常還需要把使用者名稱和密碼傳送到伺服器進行驗證。

如果伺服器確認使用者名稱存在，並且密碼正確，就允許登入；否則，提示登入失敗。

為了練習這個過程，我們可以先在程式碼裡設定一個臨時帳號和密碼，模擬「正確的登入資訊」：

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

當使用者名稱和密碼都不為空時，再比較它們是否正確：

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

這裡的 `==` 表示「是否相等」。

例如：

```swift
user == userID
```

意思是，使用者輸入的使用者名稱，是否和我們設定的正確使用者名稱完全一致，密碼判斷也是這個邏輯。

因此，當輸入的使用者名稱和密碼和設定值相等時，輸出 `Success`；只要有一個不相等，就輸出 `Input error`。

這樣，我們就完成了一個簡單的「模擬登入驗證」。

雖然它還不是真正連接伺服器的登入功能，但已經足夠幫助我們理解：**按鈕點擊後，可以根據不同條件，執行不同的程式碼**。

## 總結

這節課，我們完成了一個基礎的登入視圖，並重點學習了「根據條件判斷輸入內容的邏輯」。

這節課的核心內容是：使用 `isEmpty` 判斷字串是否為空，以及 `if` 語句配合邏輯運算子來處理不同情況。

其中兩個很重要的邏輯運算子是：

- `&&`：表示「而且」，兩個條件都要滿足
- `||`：表示「或者」，只要有一個條件滿足即可

當這些條件最終得到 `true` 或 `false` 後，`if` 語句就會根據結果執行不同的程式碼。

透過這個登入視圖，我們已經開始接觸「介面 + 資料 + 邏輯判斷」三者結合的開發方式。

## 完整程式碼

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
