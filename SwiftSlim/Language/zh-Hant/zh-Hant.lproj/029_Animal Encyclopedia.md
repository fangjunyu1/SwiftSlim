# 動物百科 

這節課，我們繼續練習自定義視圖和資料傳遞。

我們要製作一個簡單的動物百科視圖。頁面中會顯示五個動物，當點擊某個動物時，會彈出一個詳情視圖，顯示這個動物的圖片、分布區域、棲息地和描述。

實現效果：

![view](../../../Resource/029_view.png)

通過這個案例，我們可以練習資料結構、列表顯示、點擊互動和 Sheet 彈出視圖之間的配合。

## 準備圖片素材

首先，我們需要準備五張動物圖片：

- 海豚：`dolphin.jpg`
- 長頸鹿：`giraffe.jpg`
- 獅子：`lion.jpg`
- 熊貓：`panda.jpg`
- 北極熊：`polarBear.jpg`

可以使用下面這些圖片素材：

[海豚](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[長頸鹿](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[獅子](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[熊貓](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[北極熊](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

下載圖片後，將圖片拖入 Xcode 專案的 `Assets` 資源資料夾中。

![assets](../../../Resource/029_assets.png)

需要注意的是，在程式碼中使用圖片時，通常不需要寫 `.jpg` 後綴。

例如，圖片資源名稱是 `dolphin`，程式碼中就寫：

```swift
Image("dolphin")
```

如果圖片名稱寫錯，圖片就無法正常顯示。

註：上述圖片素材來自維基媒體專案，使用時建議保留原圖連結和來源資訊。

## 建立動物結構

在這個頁面中，每一隻動物都有多項資訊：

- 動物名稱
- 動物圖片
- 動物表情符號
- 分布區域
- 棲息地
- 動物描述

如果我們把這些資訊分散成很多變數，程式碼會比較混亂。因此，我們可以建立一個 `Animal` 結構，把一隻動物的資訊放在一起。

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

在這段程式碼中：

- `id`：動物的唯一識別。
- `name`：動物名稱。
- `imageName`：動物圖片名稱。
- `avatarEmoji`：動物表情符號。
- `distributionArea`：分布區域。
- `habitat`：棲息地。
- `animalDescription`：動物描述。

其中：

```swift
let id = UUID()
```

`id` 用來識別每一隻動物。因為後面我們會使用 `ForEach` 顯示動物列表，並且還會使用 `.sheet(item:)` 根據選中的動物彈出詳情，所以需要讓 `Animal` 遵循 `Identifiable` 協議。

`Identifiable` 的作用是告訴 SwiftUI：每一隻動物都有一個可以區分身份的 `id`。

## 建立動物資料

接著，我們在 `ContentView` 中建立一個動物陣列。

陣列中儲存五個 `Animal`，每一個 `Animal` 都表示一隻動物。

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // 海豚
        Animal(
            name: "海豚",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "世界各地溫暖和溫帶海域。",
            habitat: "海洋、沿海水域和一些大型河流。",
            animalDescription: "海豚是聰明的海洋哺乳動物。牠們群居生活，會用聲音交流，並以活潑好玩的行為聞名。"
        ),
        // 長頸鹿
        Animal(
            name: "長頸鹿",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "非洲的稀樹草原和開闊林地。",
            habitat: "草原、稀樹草原和開闊森林。",
            animalDescription: "長頸鹿是最高的陸地動物。牠們有長長的脖子和腿，通常以高大樹木的葉子為食。"
        ),
        // 獅子
        Animal(
            name: "獅子",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "主要分布在撒哈拉以南非洲，印度西部也有少量族群。",
            habitat: "草原、稀樹草原和開闊林地。",
            animalDescription: "獅子是強大的大型貓科動物。牠們通常以獅群為單位生活，常被稱為動物世界之王。"
        ),
        // 熊貓
        Animal(
            name: "熊貓",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "中國中部的山地森林。",
            habitat: "涼爽潮濕山區中的竹林。",
            animalDescription: "熊貓是以黑白毛色聞名的熊科動物。牠們主要吃竹子，是世界上辨識度最高的動物之一。"
        ),
        // 北極熊
        Animal(
            name: "北極熊",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "北極點周圍的北極地區。",
            habitat: "海冰、沿海地區和寒冷的北極環境。",
            animalDescription: "北極熊是適應寒冷環境的大型熊類。牠們很擅長游泳，主要依靠海冰獵捕海豹。"
        )
    ]

    var body: some View {
        Text("動物百科")
    }
}
```

這裡的 `animals` 是一個陣列：

```swift
let animals: [Animal]
```

`[Animal]` 表示這個陣列中儲存的是多個 `Animal`。

也就是說，`animals` 不是一隻動物，而是一組動物。

## 顯示動物列表

現在，我們可以使用 `ForEach` 顯示動物列表。

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

顯示效果：

![view](../../../Resource/029_view1.png)

在這段程式碼中：

```swift
ForEach(animals) { animal in
    ...
}
```

表示遍歷 `animals` 陣列。

每次循環時，`animal` 表示目前正在顯示的那一隻動物。

例如，第一次循環時，`animal` 是海豚；第二次循環時，`animal` 是長頸鹿。

所以，我們可以通過下面的方式顯示目前動物的資訊：

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

這樣，就可以把五隻動物顯示出來。

## 讓動物列表可以點擊

現在列表已經顯示出來了，但是還不能點擊。

如果希望點擊某隻動物後彈出詳情，我們需要先記錄“目前選中的動物”。

因此，在 `ContentView` 中加入一個狀態變數：

```swift
@State private var selectedAnimal: Animal? = nil
```

這裡的 `selectedAnimal` 是一個可選值型別 `Animal?`。

表示它可能有一隻動物，也可能沒有動物。

預設值是 `nil`，表示一開始沒有選中任何動物。

然後，我們把每一行動物改成 `Button`：

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

重點是這一行程式碼：

```swift
selectedAnimal = animal
```

當使用者點擊某一隻動物時，我們就把這隻動物儲存到 `selectedAnimal` 中。

例如，使用者點擊海豚，`selectedAnimal` 儲存的就是海豚。

使用者點擊熊貓，`selectedAnimal` 儲存的就是熊貓。

也就是說，`selectedAnimal` 用來記錄使用者目前點擊的是哪一隻動物。

## Sheet 彈出視圖

現在我們已經可以通過按鈕記錄“目前點擊的動物”了。

接下來，我們需要實現一個彈出視圖，用來顯示動物詳情。

![view](../../../Resource/029_view2.png)

在 SwiftUI 中，可以使用 `Sheet` 實現這種彈出效果。

`Sheet` 可以理解為一個臨時彈出的頁面。它會顯示在目前頁面上方，使用者查看完內容後，可以向下滑動關閉。

## Sheet 示例

在真正顯示動物詳情之前，我們先用一個簡單的例子理解 `Sheet` 是如何彈出的。

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("顯示 Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet 視圖")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

顯示效果：

![view](../../../Resource/029_view3.png)

這段程式碼中，我們建立了一個布林值：

```swift
@State private var showSheet = false
```

`showSheet` 預設是 `false`，表示一開始不顯示 `Sheet`。

當點擊按鈕時：

```swift
showSheet.toggle()
```

`toggle()` 表示切換布林值。

如果原來是 `false`，呼叫 `toggle()` 後就會變成 `true`。

如果原來是 `true`，呼叫 `toggle()` 後就會變成 `false`。

所以，點擊按鈕後，`showSheet` 會從 `false` 變成 `true`。

當 `showSheet` 變成 `true` 時，下面這段程式碼就會彈出 `Sheet`：

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet 視圖")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

這段程式碼表示：當 `showSheet` 為 `true` 時，彈出一個 `Sheet`，並在 `Sheet` 中顯示 `Text("Sheet 視圖")`。

顯示效果：

![view](../../../Resource/029_view4.png)

這種寫法適合彈出固定內容。

例如，點擊按鈕後彈出設定頁面、說明頁面、提示頁面等。

### Sheet 顯示位置

雖然 `Sheet` 是一個彈出視圖，但在 SwiftUI 中，它不是像 `Text()`、`Image()` 那樣直接寫成一個獨立視圖，而是作為一個視圖修飾器使用。

也就是說，`.sheet(...)` 和 `.font()`、`.padding()`、`.shadow()` 這些修飾器類似，都需要加入到某個視圖後面。

例如：

```swift
Button("顯示 Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 視圖")
}
```

在這個例子中，`.sheet` 加入到了 `Button` 後面。

當 `showSheet` 變成 `true` 時，SwiftUI 就會彈出 `Sheet`，並顯示花括號中的內容：

```swift
Text("Sheet 視圖")
```

不過，在實際開發中，如果一個頁面中有多個按鈕，通常不會給每個按鈕都加入一個 `.sheet`。

更常見的做法是：把 `.sheet` 加入到外層視圖後面。

例如：

```swift
VStack {
    Button("顯示 Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 視圖")
}
```

按鈕負責修改 `showSheet`，外層視圖負責根據 `showSheet` 是否為 `true` 來彈出 `Sheet`。

## 可選值綁定 Sheet

前面我們學習的寫法是：

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet 視圖")
}
```

這種寫法適合控制一個固定頁面的顯示和隱藏。

但是在動物百科案例中，我們不只是要知道“是否彈出 `Sheet`”，還要知道“點擊的是哪一隻動物”。

例如：

使用者點擊海豚，`Sheet` 中應該顯示海豚詳情。

使用者點擊熊貓，`Sheet` 中應該顯示熊貓詳情。

所以，這裡更適合使用另一種 Sheet 寫法：

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet 中顯示的內容
}
```

在這段程式碼中，`Sheet` 綁定了一個可選值 `selectedAnimal`。

這裡要注意，`item:` 後面寫的是 `$selectedAnimal`，不是 `selectedAnimal`。

因為 `Sheet` 不只是讀取 `selectedAnimal` 的值，還需要根據它的變化來決定是否彈出。

這段程式碼可以這樣理解：

- 當 `selectedAnimal` 是 `nil` 時，不顯示 `Sheet`。
- 當 `selectedAnimal` 有值時，顯示 `Sheet`。
- 當 `Sheet` 被關閉時，SwiftUI 會把 `selectedAnimal` 重新變回 `nil`。

SwiftUI 會把 `selectedAnimal` 中儲存的動物傳給花括號中的 `animal`。

也就是說，`.sheet(item:)` 不只是控制彈出，還會把選中的資料傳進 `Sheet`。

## 使用 Sheet 顯示動物名稱

現在，我們先不要急著建立複雜的詳情視圖。

為了讓程式碼更容易理解，我們先在 `Sheet` 中顯示目前動物的名稱。

在 `VStack` 外面加入 `.sheet(item:)`：

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

這裡最重要的是這段程式碼：

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

當 `selectedAnimal` 有值時，`Sheet` 會彈出。

花括號中的 `animal`，就是目前選中的動物。

所以：

```swift
Text(animal.name)
```

會顯示目前點擊的動物名稱。

例如，點擊 `海豚`，Sheet 中顯示 `海豚`。

點擊 `熊貓`，`Sheet` 中顯示 `熊貓`。

這樣，我們就實現了點擊不同動物，彈出不同動物名稱的效果。

顯示動物名稱：

![view](../../../Resource/029_view5.png)

不過，動物詳情不應該只顯示一個名稱，還應該顯示名稱、分布區域、棲息地和描述。

如果把這些程式碼都寫在 `.sheet` 裡面，程式碼會變得很長，不方便閱讀。

所以，接下來我們建立一個新的自定義視圖，專門負責顯示動物詳情。

## 建立動物詳情視圖

接下來，我們建立一個新的自定義視圖 `AnimalDetailView`。

這個視圖接收一個 `Animal`，並顯示動物詳情。

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**分布區域** ：\(animal.distributionArea)")

                    Divider()

                    Text("**棲息地** ：\(animal.habitat)")

                    Divider()

                    Text("**動物描述** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

顯示效果：

![view](../../../Resource/029_view2.png)

這裡的重點是：

```swift
var animal: Animal
```

這表示 `AnimalDetailView` 需要從外部接收一隻動物。

接收到動物後，詳情視圖就可以使用這隻動物的各種資訊：

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

也就是說，`AnimalDetailView` 只負責顯示傳進來的動物。

### Markdown 加粗文字

在詳情視圖中，我們寫了這樣的程式碼：

```swift
Text("**棲息地:** \(animal.habitat)")
```

這裡有兩個知識點。

第一，`**棲息地:**` 使用了 `Markdown` 語法。兩個星號包住的文字會加粗顯示。

第二，`\()` 是字串插值，可以把變數的值顯示到文字中。

這段程式碼表示先顯示加粗的 `棲息地:`，然後顯示這隻動物的棲息地。

## 在 Sheet 中顯示詳情視圖

建立好 `AnimalDetailView` 後，我們就可以回到 `ContentView`，把 `Sheet` 中原來的名稱視圖替換成詳情視圖。

原來是：

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

現在改成：

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

這裡的 `animal:` 是 `AnimalDetailView` 的參數名稱。

後面的 `animal` 是 `.sheet(item:)` 傳進來的目前動物。

也就是把目前點擊的動物，傳給 `AnimalDetailView` 顯示。

完整結構：

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

當使用者點擊動物時：

```swift
selectedAnimal = animal
```

`selectedAnimal` 從 `nil` 變成具體動物，`Sheet` 檢測到 `selectedAnimal` 有值後彈出視圖。

`Sheet` 把 `selectedAnimal` 中的動物，傳給 `AnimalDetailView` 視圖，`AnimalDetailView` 顯示動物詳情。

這樣，我們就實現了點擊動物列表，彈出對應動物詳情的功能。

## Sheet 兩種寫法的區別

現在，我們已經使用 `.sheet(item:)` 完成了動物詳情視圖的顯示。

這裡可以簡單總結一下 `Sheet` 的兩種常見寫法。

### 第一種是綁定布林值

```swift
@State private var showSheet = false

Button("顯示 Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet 視圖")
}
```

這種寫法適合彈出固定內容，例如設定頁面、說明頁面、提示頁面等。

`showSheet` 是一個布林值，只有 `true` 和 `false` 兩種狀態。

當 `showSheet` 是 `true` 時，`Sheet` 顯示。

當 `showSheet` 是 `false` 時，`Sheet` 不顯示。

### 第二種是綁定可選值

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

這種寫法適合根據選中的資料彈出不同內容。

在本節課中，我們點擊不同動物，需要顯示不同動物的詳情，所以使用 `.sheet(item:)` 更合適。

## 完整程式碼

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // 動物名稱
    let name: String
    
    // 動物圖片
    let imageName: String
    
    // 動物標籤符號
    let avatarEmoji: String
    
    // 分布區域
    let distributionArea: String
    
    // 棲息地
    let habitat: String
    
    // 動物描述
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // 海豚
        Animal(
            name: "海豚",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "世界各地溫暖和溫帶海域。",
            habitat: "海洋、沿海水域和一些大型河流。",
            animalDescription: "海豚是聰明的海洋哺乳動物。牠們群居生活，會用聲音交流，並以活潑好玩的行為聞名。"
        ),
        // 長頸鹿
        Animal(
            name: "長頸鹿",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "非洲的稀樹草原和開闊林地。",
            habitat: "草原、稀樹草原和開闊森林。",
            animalDescription: "長頸鹿是最高的陸地動物。牠們有長長的脖子和腿，通常以高大樹木的葉子為食。"
        ),
        // 獅子
        Animal(
            name: "獅子",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "主要分布在撒哈拉以南非洲，印度西部也有少量族群。",
            habitat: "草原、稀樹草原和開闊林地。",
            animalDescription: "獅子是強大的大型貓科動物。牠們通常以獅群為單位生活，常被稱為動物世界之王。"
        ),
        // 熊貓
        Animal(
            name: "熊貓",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "中國中部的山地森林。",
            habitat: "涼爽潮濕山區中的竹林。",
            animalDescription: "熊貓是以黑白毛色聞名的熊科動物。牠們主要吃竹子，是世界上辨識度最高的動物之一。"
        ),
        // 北極熊
        Animal(
            name: "北極熊",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "北極點周圍的北極地區。",
            habitat: "海冰、沿海地區和寒冷的北極環境。",
            animalDescription: "北極熊是適應寒冷環境的大型熊類。牠們很擅長游泳，主要依靠海冰獵捕海豹。"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**分布區域** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**棲息地** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**動物描述** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## 總結

這節課完成了一個簡單的動物百科頁面。

我們先用 `Animal` 結構儲存動物資訊，再用陣列儲存五隻動物，然後使用 `ForEach` 顯示動物列表。

當使用者點擊某隻動物時，我們把這隻動物儲存到 `selectedAnimal` 中：

```swift
selectedAnimal = animal
```

當 `selectedAnimal` 有值時，`.sheet(item:)` 會彈出詳情視圖，並把選中的動物傳給 `AnimalDetailView`。

這節課最重要的不是界面樣式，而是理解這條資料傳遞路線：

```swift
點擊動物 → selectedAnimal 儲存動物 → Sheet 彈出 → AnimalDetailView 顯示詳情
```

理解這條路線後，以後就可以製作更多類似功能，例如商品詳情、課程詳情、文章詳情、联系人詳情等。
