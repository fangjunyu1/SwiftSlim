# 自訂顏色

這節課，我們將學習如何在 SwiftUI 中自訂顏色。

在前面的課程中，我們已經使用過 SwiftUI 提供的預設顏色，例如：

```swift
Color.blue
Color.red
Color.green
```

這些顏色使用起來很方便，但在真實 App 開發中，預設顏色通常不夠精確。

例如，設計圖中可能會使用這樣的顏色：

```text
#2c54c2
#4875ed
#213e8d
```

這種顏色稱為 Hex 顏色。

這節課，我們會先讓 SwiftUI 支援 Hex 顏色，然後使用 `static` 把常用顏色整理起來。

最後，我們會把自訂顏色套用到動物百科視圖中，並進一步使用漸層背景，讓按鈕看起來更有層次。

## 為什麼需要自訂顏色？

在 SwiftUI 中，我們可以直接使用系統顏色。

例如：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

這裡的 `.blue` 表示藍色，它其實是 `Color.blue` 的簡化寫法。

預設顏色的優點是簡單、方便，但是顏色選擇比較有限。

例如：

```swift
Color.blue
```

只能表示 SwiftUI 提供的預設藍色。

![Color.blue](../../../Resource/031_color6.png)

但是在實際開發中，我們經常需要更具體的顏色。

例如，同樣都是藍色，也可能有淺藍、深藍、灰藍、亮藍等不同效果。

![More Blue](../../../Resource/031_color5.png)

這時，如果只使用 `Color.blue`，就很難還原設計效果。

所以，我們需要讓 SwiftUI 支援自訂顏色。

## 什麼是 Hex 顏色？

螢幕上的顏色通常由紅、綠、藍三個通道組成，也就是 RGB。

RGB 分別表示：

```text
Red     // 紅色
Green   // 綠色
Blue    // 藍色
```

Hex 顏色是 RGB 顏色的一種表示方式。

例如：

```swift
#5479FF
```

這個顏色值可以簡單理解為三個部分：

```text
54  // 表示紅色通道
79  // 表示綠色通道
FF  // 表示藍色通道
```

在這節課中，我們不需要計算這些數值，也不需要深入理解十六進位規則。

現在只需要知道：`#5479FF` 表示一個具體顏色。

以後當我們看到類似 `#2c54c2`、`#4875ed` 這樣的寫法時，就可以先把它理解為一種顏色值。

在 Sketch、Figma、Photoshop 等設計工具中，也經常能看到類似的顏色值。

![color](../../../Resource/031_color.png)

但是，SwiftUI 預設不能直接這樣寫：

```swift
Color(hex: "#5479FF")
```

所以，我們需要自己擴充 `Color` 型別，讓它支援透過 Hex 字串建立顏色。

## 建立 Color+Hex.swift 檔案

首先，我們建立一個新的 Swift 檔案。

檔案名稱可以寫成：

```text
Color.swift
```

也可以寫成更清楚的：

```text
Color+Hex.swift
```

這裡更建議使用：

```text
Color+Hex.swift
```

在 Swift 專案中，類似 `Color+Hex.swift` 這樣的檔案名稱很常見。

它表示這個檔案是給 `Color` 新增 Hex 能力的擴充檔案。

檔案名稱不會直接影響程式碼執行，只是為了讓我們更容易理解這個檔案的用途。

## 新增 Color(hex:) 程式碼

在 `Color+Hex.swift` 檔案中，寫入下面程式碼：

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

這段程式碼使用 `extension` 擴充了 `Color` 型別，並為 `Color` 新增了一個新的初始化方法：

```swift
init(hex: String)
```

有了這個初始化方法之後，我們就可以把 Hex 字串傳給 `Color`，從而建立一個自訂顏色：

```swift
Color(hex: "#5479FF")
```

這段擴展程式碼內部會把 Hex 字串轉換成 SwiftUI 可以辨識的 RGB 顏色。

現階段不需要深入理解每一行轉換邏輯，只需要了解新增的 `Color(hex:)` 方法，可以讓我們透過 Hex 顏色值建立自訂顏色。

## 使用自訂顏色

現在，我們可以在 `ContentView` 中測試自訂顏色。

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

顯示效果：

![color](../../../Resource/031_color1.png)

在這個例子中，第一行使用的是系統顏色：

```swift
.foregroundStyle(Color.blue)
```

後面三行使用的是自訂 Hex 顏色：

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

透過對比可以發現，系統藍色只有一種預設效果。

而 Hex 顏色可以表示更細緻的藍色變化。

這就是自訂顏色的價值：它可以讓介面的顏色更接近真實設計，也更方便我們控制 App 的視覺風格。

## 使用 static 整理顏色

現在，我們已經可以透過 Hex 字串建立顏色：

```swift
Color(hex: "#2c54c2")
```

這種寫法可以正常使用，但如果同一個顏色會在多個地方重複出現，後期維護就不太方便。

如果在 10 個地方都寫了這個顏色值，以後想修改這個藍色，就需要逐一修改。

這時，我們可以使用 `static` 把常用顏色統一整理起來。

在 `Color+Hex.swift` 檔案底部，繼續新增下面程式碼：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

這裡，我們為 `Color` 新增了三個靜態屬性：`animalBlue`、`animalLightBlue` 和 `animalDarkBlue`，它們分別表示不同深淺的藍色。

因為這些屬性使用了 `static`，所以它們屬於 `Color` 型別本身。

使用時，可以直接透過 `Color.` 存取：

```swift
Color.animalBlue
```

這種寫法比直接寫 Hex 字串更清楚。

當我們看到 `Color.animalBlue` 時，我們可以知道它表示動物百科中使用的藍色。

而看到 `Color(hex: "#2c54c2")` 時，只能知道它是一個顏色值，但不容易看出它的具體用途。

統一管理顏色還有一個好處：後期修改更方便。

如果想調整動物百科的主色，只需要修改定義位置：

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

所有使用這個顏色的地方都會一起更新。

這就是使用 `static` 整理顏色的意義：讓顏色名稱更清楚，也讓後期維護更方便。

## 套用到動物百科

現在，我們可以把自訂顏色套用到前面的動物百科視圖中。

之前動物按鈕背景為白色：

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

現在，我們可以改成自訂顏色：

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

這裡的 `Color.animalBlue` 就是我們剛才在 `Color+Hex.swift` 中定義的靜態顏色。

按鈕文字使用白色：

```swift
.foregroundStyle(Color.white)
```

動物 emoji 的背景使用半透明白色：

```swift
.background(Color.white.opacity(0.15))
```

這樣按鈕會形成一個統一的藍色視覺風格。

這一步的重點不是增加複雜程式碼，而是把前面學到的自訂顏色真正套用到介面中。

## 使用漸層背景

除了使用單一顏色，我們還可以把多個顏色組合成漸層效果。

例如，我們前面定義了這些顏色：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

這些顏色不僅可以單獨使用，也可以組合成漸層背景。

在 SwiftUI 中，可以使用 `LinearGradient` 建立線性漸層。

例如：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

這段程式碼會建立一個從左到右的漸層背景，顏色從 `Color.animalBlue` 逐漸過渡到 `Color.animalLightBlue`。

其中，`colors` 用來設定參與漸層的顏色，`startPoint` 和 `endPoint` 用來控制漸層方向。

### 測試漸層效果

我們可以用一個簡單的 Text 測試漸層背景。

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

顯示效果：

![color](../../../Resource/031_color3.png)

在這個例子中，`Text` 的背景不再是單一顏色，而是從左到右逐漸層化的漸層色。

相比普通背景色，漸層背景會更有層次，也更容易讓介面產生視覺重點。

## 在動物百科中使用漸層背景

現在，我們可以把動物按鈕的背景顏色：

```swift
.background(Color.animalBlue)
```

修改為漸層背景：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

完整程式碼如下：

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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
```

顯示效果：

![color](../../../Resource/031_color4.png)

現在，動物按鈕不再只是單一背景色，而是擁有了從左到右的漸層效果。

相比單色背景，漸層背景可以讓介面看起來更有層次，也更接近真實 App 中的視覺設計。

## 單色背景和漸層背景的差異

單色背景只使用一個顏色。

例如：

```swift
.background(Color.animalBlue)
```

這種寫法簡單、清楚，適合大部分基礎介面。

漸層背景會使用多個顏色。

例如：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

這種寫法可以讓介面更有層次，但也更容易增加視覺複雜度。

所以，在實際開發中，可以這樣理解：

單色背景適合普通文字、普通按鈕、普通卡片、普通頁面背景。

漸層背景適合重點按鈕、頂部區域、封面卡片、功能入口等需要強調的位置。

## 總結

這節課，我們學習了如何在 SwiftUI 中使用自訂顏色。

首先，我們了解了 Hex 顏色。

例如：

```text
#2c54c2
```

它表示一個具體顏色。

然後，我們使用 `extension Color` 擴充了 `Color` 型別。

讓 SwiftUI 可以透過下面的方式建立顏色：

```swift
Color(hex: "#2c54c2")
```

接著，我們使用 `static` 整理常用顏色：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

這樣，在其他視圖中就可以直接使用：

```swift
Color.animalBlue
```

相比每次都寫 Hex 字串，這種方式更清楚，也更方便後期統一修改顏色。

最後，我們學習了 `LinearGradient`，並把自訂顏色組合成漸層背景：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

透過這節課，我們完成了從“建立自訂顏色”到“在真實介面中使用顏色”的過程。

以後，當一個顏色需要在多個地方重複使用時，可以優先考慮把它整理到 `Color` 擴充中。

這樣程式碼會更清楚，介面風格也更容易統一。