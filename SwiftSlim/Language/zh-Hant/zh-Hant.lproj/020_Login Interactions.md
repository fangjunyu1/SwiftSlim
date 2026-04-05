# 登入互動

上一節課，我們製作了一個登入視圖，並透過按鈕和判斷邏輯，實現了對輸入內容的簡單檢查。

這節課，我們繼續以上一節課的程式碼為基礎，學習 `SecureField` 密碼輸入框、`Alert` 警告框，以及如何根據變數控制不同視圖的顯示。

透過這節課，你可以進一步理解登入視圖的基本互動流程，這也是很多 App 中都會用到的基礎邏輯。

## 密碼輸入框

上節課，我們使用 `TextField` 來輸入密碼。

但是在真實的登入介面裡，密碼通常不會直接顯示出來，而是會顯示成圓點或其他隱藏效果，這樣可以保護使用者的隱私。

在 SwiftUI 中，專門用於輸入密碼的控制項是 `SecureField`。

例如：

```swift
SecureField("Password", text: $password)
```

它的寫法和 `TextField` 很像，同樣需要一個提示文字，以及一個綁定的變數。

可以簡單理解為：`SecureField` 也是一個輸入框，只不過它會把輸入的內容隱藏起來。

我們可以直接把原來輸入密碼用的 `TextField` 改成 `SecureField`：

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

當使用者輸入密碼時，介面上就不會直接顯示密碼內容了。

顯示效果：

![password](../../Resource/020_password.png)

現在，我們可以輸入使用者名稱和密碼，點擊按鈕後判斷輸入是否正確。

### 顯示回饋提示

我們在前面一直使用 `print` 輸出結果。

`print` 的內容只會顯示在控制台中，開發者在 Xcode 裡執行程式時可以看到，但一般使用者在手機上是看不到這些提示的。

也就是說，雖然程式已經完成了判斷，但使用者並不知道輸入內容是否正確。

這時候，就需要一種能直接顯示在介面上的提示方式。

## Alert 警告框

在 SwiftUI 中，我們可以使用 `Alert` 來跳出提示框。

基本用法：

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

這段程式碼看起來比前面的控制項複雜一些，我們可以拆開來理解。

`Alert` 主要包含下面幾個部分：

- `"Title"`：警告框的標題
- `isPresented`：一個綁定的布林值，用來控制警告框是否顯示
- `Button(...)`：警告框的按鈕
- `message:`：警告框中顯示的提示內容

可以簡單理解為，當綁定的變數變成 `true` 時，系統就會跳出這個提示框。

顯示效果：

![alert](../../Resource/020_alert3.png)

對應結構：

![alert](../../Resource/020_alert.png)

### Alert 是修飾器

`Alert` 和我們前面學過的很多修飾器一樣，也是加在某個視圖後面。

例如，它可以修飾在按鈕後面：

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

也可以修飾在外層的 `VStack` 後面：

```swift
VStack {
    // ...
}
.alert() {...}
```

也就是說，`Alert` 不是單獨擺在介面裡的視圖，而是依附在某個視圖上的一個修飾器。

可以簡單理解為，`Alert` 一般寫在按鈕或者外層版面配置後面，用來在某個條件滿足時跳出提示。

### 顯示 Alert

如果想要顯示 `Alert`，就需要一個變數來控制它。

例如：

```swift
@State private var showAlert = false
```

這個變數是 `Bool` 類型，也就是只有兩個值：`true` 或 `false`。

然後把它綁定給 `Alert` 的 `isPresented`：

```swift
isPresented: $showAlert
```

當 `showAlert` 是 `false` 時，警告框不會顯示；當 `showAlert` 是 `true` 時，警告框就會跳出。

### 透過按鈕顯示警告框

現在，先來實作一個最簡單的情境：

當使用者什麼都沒有輸入，就直接點擊 `Sign in` 按鈕時，跳出一個提示框告訴他「你還沒有輸入內容」。

首先，建立一個變數來控制這個提示框：

```swift
@State private var showEmpty = false
```

然後，在 `Button` 後面加入一個 `Alert`：

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

接著，在按鈕點擊的程式碼裡進行判斷：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

如果 `user` 和 `password` 都是空的，就把 `showEmpty` 改成 `true`。

而 `Alert` 又綁定了這個變數，所以當它變成 `true` 時，系統就會自動跳出提示框。

顯示效果：

![alert](../../Resource/020_alert1.png)

這樣，使用者點擊按鈕後，就能立刻看到提示，而不需要開發者去控制台裡查看 `print` 輸出。

### 完善按鈕和警告框

前面，我們只處理了「什麼都沒填寫」的情況。

我們還需要處理下面幾種情況：

- 使用者名稱沒填
- 密碼沒填
- 使用者名稱和密碼都填寫了，但輸入錯誤

所以，我們還需要為這些情況準備對應的提示。

首先，新增三個變數：

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

然後繼續在按鈕後面加入對應的 `Alert`：

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

接著，完善按鈕中的判斷邏輯：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

當按鈕判斷使用者沒有填寫任何資訊、漏填了一項資訊，或者輸入驗證失敗時，就會把對應的布林變數改成 `true`，然後跳出對應的 `Alert`。

這裡建議你自己測試幾種情況：

- 什麼都不填
- 只填寫使用者名稱
- 只填寫密碼
- 使用者名稱和密碼都填寫，但內容錯誤
- 使用者名稱和密碼都填寫，而且內容正確

以驗證我們的程式碼是否存在問題，這也是 App 開發中非常重要的「測試」環節。

如果某個情境下程式表現不對，就說明邏輯中可能存在問題，程式中出現了 `Bug`。

開發中常說的 `Bug`，就是指程式中的錯誤、漏洞，或者不符合預期的行為。

## 完成登入視圖

前面講的 `Alert`，都是在處理「輸入錯誤」時如何給使用者提示。

當使用者輸入正確的使用者名稱和密碼，我們通常不會跳出「警告框」，而是直接進入登入後的介面。

這裡涉及到一個非常重要的知識點：**根據變數的值，顯示不同的視圖。**

例如：

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

在這裡，我們使用 `Bool` 類型管理視圖的顯示：

- 如果 `login` 是 `true`，表示已經登入成功，顯示登入後的內容
- 如果 `login` 是 `false`，表示尚未登入成功，繼續顯示登入介面。

雖然 `if` 語句是 Swift 的條件判斷語句，但在 SwiftUI 的 `body` 中，它可以用來控制視圖的顯示邏輯。

也就是說，SwiftUI 會根據條件的結果，判斷目前應該顯示哪一個視圖。

我們可以把這個顯示邏輯放到目前的 `ContentView` 中：

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// 原本登入視圖的程式碼
		}
	}
}
```

這裡，我們新增了一個 `login` 變數，用來表示使用者是否已經登入成功。

然後，把前面已經寫好的登入視圖程式碼，放到 `else` 語句後面。

視圖顯示邏輯：

- 當 `login` 為 `false` 時，表示還沒有登入成功，繼續顯示原本的登入視圖。
- 當 `login` 為 `true`，表示登入成功，此時不再顯示登入視圖，而是顯示 `Login successful`。

也就是說，`ContentView` 會根據 `login` 的值不同，顯示不同的視圖內容。

接下來，我們再修改按鈕中的登入成功邏輯：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

當使用者輸入的使用者名稱和密碼都正確時，我們就把 `login` 改成 `true`。

一旦 `login` 的值發生變化，`ContentView` 中的 `if` 判斷結果也會跟著改變，介面就會從原本的登入視圖切換成 `Login successful`。

顯示效果如下：

![view](../../Resource/020_view.png)

現在，我們就把「根據條件判斷顯示不同視圖」的知識，真正用到了目前這個登入頁面中。

在實際的 App 中，通常也是這種判斷方式，根據某一個值顯示不同的視圖。

例如，使用者沒有登入時，顯示登入頁；使用者登入成功後，就顯示另一個介面。

核心思路就是：**透過變數的變化，控制介面顯示什麼內容。**

## 總結

這節課，我們學習了三個重要內容：

1. 使用 `SecureField` 輸入密碼，讓密碼內容不會直接顯示在介面上。
2. 使用 `Alert` 向使用者顯示提示資訊，而不是只在控制台上輸出。
3. 使用變數和 `if` 判斷控制不同視圖的顯示，實現登入前和登入後的介面切換。

透過這些知識的學習，我們已經能夠完成一個具備基礎互動效果的登入視圖，並進一步理解 SwiftUI 中「狀態改變，介面更新」的開發思路。

## 完整程式碼

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## 延伸知識 - 多個按鈕的 Alert

前面這節課中，我們使用的是最基礎的 `Alert`，只有一個按鈕，主要用來提示使用者。

其實，`Alert` 還可以包含多個按鈕，讓使用者做出不同選擇。

例如：

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

當點擊按鈕後，會跳出一個帶有三個選項的提示框：`Ok`、`delete` 和 `cancel`。

顯示效果：

![alert](../../Resource/020_alert2.png)

點擊不同按鈕時，會執行對應的程式碼。

### Button 的 `role` 屬性

這裡你會發現，`Alert` 中的 `Button` 和我們前面學過的一般按鈕寫法有一點不同：

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

這裡多了一個 `role` 參數。

在 SwiftUI 中，`role` 用來告訴系統：這個按鈕屬於什麼類型的操作。

常見的幾種角色有：

- `.cancel`：取消操作
- `.destructive`：危險操作，例如刪除
- `nil`：一般操作

不同的 `role`，在介面上的樣式通常也會有差異。

例如，危險操作常常會顯示為更醒目的樣式，提醒使用者要謹慎點擊。

此外，`role` 還會為按鈕提供額外的語意資訊，方便螢幕閱讀器（例如 Apple 裝置上的 VoiceOver）提示使用者按鈕的作用。

所以，在合適的情境下，為按鈕加入 `role` 是一個很好的習慣。
