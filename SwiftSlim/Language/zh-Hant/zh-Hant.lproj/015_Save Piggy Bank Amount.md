# 保存存錢罐金額

在上一節課中，我們實現了一個簡單的“存錢罐”。本節課，我們將學習如何讓“存錢罐”的金額持久化保存。

本節課主要學習 UserDefaults 以及 @AppStorage 屬性包裝器，同時會延伸講解 onAppear 的作用，以及可選類型（nil）的使用方式。

需要注意的是，本課需要沿用上一節課開發的“存錢罐”程式碼。

## 持久化保存問題

現在，“存錢罐”的界面非常簡潔，使用也很方便。

![Piggy Bank](../../Resource/014_view.png)

但是，有一個明顯的問題：每次刷新視圖或者關閉應用時，“存錢罐”總金額總會變成 0，之前的總金額也會全部丟失。

這意味著資料並沒有真正的保存，換句話說，現在的“存錢罐”，只能保存臨時資料。

### 為什麼不能持久化保存？

這是因為我們使用 @State 聲明的變數：

```swift
@State private var amount = 0
```

@State 聲明的變數，其生命週期完全依賴於視圖。

當視圖創建時，amount 初始化為 0，視圖銷毀時，amount 被銷毀。

這裡的 amount 保存的資料只存在於內存中，沒有被保存到設備上。

我們並不希望 amount 和視圖的生命週期綁定，就需要實現資料持久化保存。或者說，將資料保存到設備上。

### 什麼是“資料持久化”

資料持久化可以理解為，把資料從“臨時內存”保存到“設備存儲”。

當關閉視圖，或者關閉應用時，資料不會丟失。

在 Swift 開發中，簡單的“資料持久化”可以使用 UserDefaults 保存，複雜的資料，則需要使用 SwiftData 或 CoreData 實現。

本節課，我們先學習最簡單的 UserDefaults。

## UserDefaults

UserDefaults 用於保存輕量級鍵值對資料，常用於存儲 String、Int、Double、Bool 等基礎類型。

### 保存資料

UserDefaults 使用 set 方法保存資料：

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults 的第一個參數表示保存的資料，這裡傳入 String、Int 等類型的資料。

第二個參數 forKey 類似於變數名稱，用於標識 UserDefaults 保存的資料。

### 讀取資料

UserDefaults 使用對應方法讀取：

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

讀取時必須使用對應類型的方法，否則會出現錯誤或資料不正確。

### UserDefaults 注意事項

#### 1. 返回可選類型

在使用 UserDefaults 讀取資料時，部分方法返回可選類型（Optional）。

例如：

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

返回的 name 類型為：

```swift
String?
```

這表示可能有值，也可能沒有值。

**為什麼返回可選類型？**

這是因為，UserDefaults 中的某個 Key，不一定存在對應的資料。

例如：

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

如果之前從未保存過 "City" 這個 Key，那麼讀取結果就是：

```swift
nil
```

需要強調的是，nil 表示沒有資料，而不是空字串。

在“類型系統”一節中，我們遇到過類似的問題，當資料類型轉換失敗時，會返回可選類型。

這時，我們就需要使用 ?? 提供預設值，進行解包：

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

如果 UserDefaults 讀取到資料，使用讀取的值；如果讀取不到（nil），使用預設值。

#### 2. 返回非可選類型

UserDefaults 在讀取 Int、Double、Bool 類型時，返回非可選類型。

例如：

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

即使這些 Key 從未被保存過資料，返回值也不會是 nil。

而是返回預設值：

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. 資料量限制

UserDefaults 只適合保存少量資料，比如應用配置、簡單狀態等資料。

在實際中，不適合保存大量資料或頻繁讀寫的資料。

## 保存“存錢罐”金額

現在，我們可以使用 UserDefaults，實現保存“存錢罐”總金額的程式碼邏輯。

當使用者點擊按鈕時，輸入的金額疊加到總金額中，將總金額保存到 UserDefaults。

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

現在，我們實現了資料寫入的邏輯。

## 資料持久化邏輯說明

雖然，我們已經完成了資料持久化的寫入邏輯，但在實際運行時會發現：每次刷新視圖或者重新打開應用時，amount 變數仍然是 0。

這是因為：

```swift
@State private var amount = 0
```

在 SwiftUI 中，@State 變數在視圖創建時，會被重新初始化。

雖然 UserDefaults 中保存了 amount 的值，視圖重新載入時，amount 仍然會被重置為 0。

這說明，當前只是將資料保存到了 UserDefaults，並沒有在視圖中恢複資料。

因此，在視圖載入時，還需要手動從 UserDefaults 中讀取資料，並重新賦值給 amount，才能實現整個資料持久化的程式碼邏輯。

### 邏輯類比

可以將這個過程理解為“教室中的黑板”：

在上課時，老師會把內容寫在黑板上，這些內容就像當前視圖中的狀態（@State）。

當課程結束後，黑板會被擦乾淨，為下一節課做準備。這相當於視圖被銷毀，@State 中的資料也會被清空。

為了避免教學內容丟失，老師會提前把內容保存到課件中。這個課件，就相當於 UserDefaults 中保存的資料。

當下一次重新上課時，黑板一開始是空的（@State 初始化），老師需要根據課件內容，把之前的知識重新寫到黑板上（讀取 UserDefaults）。

需要理解的是，黑板不會自動恢復之前的內容，必須通過“讀取課件”（讀取 UserDefaults）的方式重新寫入。

## 使用 onAppear 讀取資料

在視圖顯示時，需要手動讀取 UserDefaults 中的值，並賦值給 @State 的 amount 變數，從而實現真正的資料持久化。

在 SwiftUI 中，可以使用 onAppear 在視圖顯示時執行初始化邏輯：

```swift
.onAppear {}
```

將讀取 UserDefaults 的程式碼，放在 onAppear 中：

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

當視圖創建時，amount 初始化為 0；當視圖顯示時，觸發 onAppear，從 UserDefaults 中讀取並賦值給 amount。這樣，視圖就可以顯示上一次保存的總金額。

現在，整個“存錢罐”的資料持久化邏輯就完成了。

## 完整程式碼

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## @AppStorage 屬性包裝器

SwiftUI 提供了 @AppStorage 屬性包裝器，可以簡化 UserDefaults 的保存邏輯。

```
@AppStorage("amount") private var amount = 0
```

@AppStorage 是對 UserDefaults 的封裝，"amount" 對應 UserDefaults 的 Key。

當視圖創建時，會從 UserDefaults 中讀取資料；當變數發生變化時，自動寫入 UserDefaults 中。

支持 SwiftUI 的狀態更新機制，和 @State 一樣，在改變時會刷新 SwiftUI 視圖。

也就是說，@AppStorage 可以實現資料的讀取和保存邏輯，不再需要手動調用 UserDefaults，也不需要使用 onAppear 手動讀取資料。

因此，我們可以使用 @AppStorage 替換程式碼中的 UserDefaults：

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## 總結

本節課主要學習了以下知識點：

首先，UserDefaults 用於保存輕量級資料，我們使用 UserDefaults 將總金額保存到設備上。UserDefaults 提供讀取和寫入等方法，並且還需要處理可選類型等情況。

其次，@State 變數僅用於管理視圖中的臨時狀態，其生命週期與視圖一致。視圖重新創建時，@State 會重新初始化。

在恢復 UserDefaults 資料時，學習使用 onAppear 在視圖顯示時讀取 UserDefaults，並完成資料恢復。

最後，使用 @AppStorage 對 UserDefaults 進行替換，實現視圖載入時自動讀取資料，在資料變化時自動寫入，從而替代手動調用 UserDefaults 和 onAppear 的邏輯。

通過這些知識，我們可以實現一個基礎的 App 資料存儲功能，使資料能夠被持久化保存。

## 課後練習

現在，“存錢罐”支持金額的保存，但是功能仍不完整。

1. 當使用者需要取出金額時，需要設計對應的取出邏輯。
2. 當使用者希望將金額清空時，也需要實現重置邏輯。
3. 如果希望為存錢罐添加名字，還需要引入 String 類型的資料保存。

可以在現有基礎上完善這些功能，使“存錢罐”的功能更加完整。

## 擴展知識 - 輸入框預設值問題

現在，我們還可以對輸入框的互動進一步優化，讓輸入操作更便捷。

![textfield](../../Resource/015_view.png)

當前實現中，輸入框預設值為 0。使用者在每次輸入金額時，都需要先刪除 0，再輸入新的數值，這種互動體驗並不合理。

我們應該讓輸入框初始值為空，而不是 0。

這是因為，TextField 和 number 雙向綁定：

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

當 number 初始化為 0 時，輸入框也會顯示 0。

因此，我們需要將 number 改為空值，也就是 nil。

```swift
@State private var number = nil
```

此時會出現錯誤：

```
Generic parameter 'Value' could not be inferred
```

這就是我們在“類型系統”中講到的情況：當變數無法自動推測類型時，就需要顯式聲明變數類型。

因為我們將 number 設置為 nil，而 nil 本身不包含任何類型資訊，編譯器無法判斷該變數是 String、Int，還是其他類型，所以會報錯。

因此，我們需要為 number 顯式聲明類型：

```swift
@State private var number:Int? = nil
```

這裡的 Int? 表示可選類型（Optional），表示 number 的值可以是 Int，也可以是 nil。

這樣，在初始化時將其設為 nil，輸入框就會顯示為空，而不是 0。

### 解包可選類型

當我們將 number 修改為可選類型後，原有的計算程式碼會報錯：

```swift
amount += number
```

提示：

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

這是因為，number 現在可能為 nil。如果直接參與計算，就變成：

```swift
amount += nil
```

很明顯，nil 無法和 amount 相加，這是不合法的操作。

因此，在使用可選類型參與計算時，需要先進行解包。

這裡可以使用 ?? 提供預設值：

```swift
amount += number ?? 0
```

當 number 為 nil 時，使用預設值 0；當 number 有值時，使用輸入的實際資料。

這樣既保證計算的正確性，也實現了輸入框預設為空的效果，使用者不需要再手動刪除輸入框中的 0。

## 擴展程式碼

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```