# カスタムカラー

このレッスンでは、SwiftUI で色をカスタマイズする方法を学びます。

前のレッスンでは、SwiftUI が提供する標準カラーをすでに使いました。例えば：

```swift
Color.blue
Color.red
Color.green
```

これらの色は使いやすいですが、実際の App 開発では、標準カラーだけでは正確さが足りないことがよくあります。

例えば、デザインカンプでは次のような色が使われることがあります：

```text
#2c54c2
#4875ed
#213e8d
```

このような色を Hex カラーと呼びます。

このレッスンでは、まず SwiftUI で Hex カラーを使えるようにし、その後 `static` を使ってよく使う色を整理します。

最後に、カスタムカラーを動物百科ビューに適用し、さらにグラデーション背景を使って、ボタンにより立体感を持たせます。

## なぜカスタムカラーが必要なのか？

SwiftUI では、システムカラーを直接使用できます。

例えば：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

ここでの `.blue` は青色を表し、実際には `Color.blue` の省略形です。

標準カラーの利点は、シンプルで使いやすいことですが、選べる色は比較的限られています。

例えば：

```swift
Color.blue
```

これは SwiftUI が提供する標準の青色だけを表します。

![Color.blue](../../../Resource/031_color6.png)

しかし、実際の開発では、もっと具体的な色が必要になることがよくあります。

例えば、同じ青でも、ライトブルー、ダークブルー、グレイッシュブルー、鮮やかなブルーなど、異なる印象があります。

![More Blue](../../../Resource/031_color5.png)

このような場合、`Color.blue` だけではデザインの見た目を再現しにくくなります。

そのため、SwiftUI でカスタムカラーを使えるようにする必要があります。

## Hex カラーとは？

画面上の色は、通常、赤・緑・青の 3 つのチャンネルで構成されます。つまり RGB です。

RGB はそれぞれ次を表します：

```text
Red     // 赤色
Green   // 緑色
Blue    // 青色
```

Hex カラーは、RGB カラーを表す方法の一つです。

例えば：

```swift
#5479FF
```

この色の値は、簡単に 3 つの部分として理解できます：

```text
54  // 赤チャンネルを表す
79  // 緑チャンネルを表す
FF  // 青チャンネルを表す
```

このレッスンでは、これらの数値を計算する必要はなく、16 進数のルールを深く理解する必要もありません。

今は、`#5479FF` が具体的な色を表す、ということだけ分かれば十分です。

今後 `#2c54c2` や `#4875ed` のような書き方を見たときは、まず色の値として理解できます。

Sketch、Figma、Photoshop などのデザインツールでも、このような色の値をよく見かけます。

![color](../../../Resource/031_color.png)

ただし、SwiftUI では標準のままでは次のように直接書けません：

```swift
Color(hex: "#5479FF")
```

そのため、`Color` 型を自分で拡張し、Hex 文字列から色を作成できるようにします。

## Color+Hex.swift ファイルを作成する

まず、新しい Swift ファイルを作成します。

ファイル名は次のようにできます：

```text
Color.swift
```

より分かりやすく、次のようにしてもかまいません：

```text
Color+Hex.swift
```

ここでは、次の名前を使うことをおすすめします：

```text
Color+Hex.swift
```

Swift プロジェクトでは、`Color+Hex.swift` のようなファイル名はよく使われます。

これは、このファイルが `Color` に Hex の機能を追加する拡張ファイルであることを表しています。

ファイル名はコードの実行に直接影響しませんが、このファイルの用途を理解しやすくするためのものです。

## Color(hex:) のコードを追加する

`Color+Hex.swift` ファイルに、次のコードを書きます：

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

このコードは `extension` を使って `Color` 型を拡張し、`Color` に新しい初期化メソッドを追加しています：

```swift
init(hex: String)
```

この初期化メソッドがあると、Hex 文字列を `Color` に渡して、カスタムカラーを作成できます：

```swift
Color(hex: "#5479FF")
```

この拡張コードの内部では、Hex 文字列を SwiftUI が認識できる RGB カラーに変換しています。

現段階では、変換処理の各行を深く理解する必要はありません。追加した `Color(hex:)` メソッドによって、Hex の色値からカスタムカラーを作成できることを理解すれば十分です。

## カスタムカラーを使用する

これで、`ContentView` の中でカスタムカラーをテストできます。

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

表示結果：

![color](../../../Resource/031_color1.png)

この例では、1 行目はシステムカラーを使用しています：

```swift
.foregroundStyle(Color.blue)
```

後ろの 3 行では、カスタム Hex カラーを使用しています：

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

比較すると、システムの青色は 1 種類の標準的な見た目だけであることが分かります。

一方、Hex カラーは、より細かな青色の違いを表せます。

これがカスタムカラーの価値です。画面の色を実際のデザインに近づけられ、App の視覚スタイルもより制御しやすくなります。

## static を使って色を整理する

これで、Hex 文字列から色を作成できるようになりました：

```swift
Color(hex: "#2c54c2")
```

この書き方は問題なく使えますが、同じ色を複数の場所で繰り返し使う場合、あとで保守しにくくなります。

もし 10 か所にこの色の値を書いていた場合、あとでこの青色を変更したくなったら、一つずつ修正する必要があります。

このようなときは、`static` を使って、よく使う色を一か所にまとめて整理できます。

`Color+Hex.swift` ファイルの下部に、次のコードを続けて追加します：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

ここでは、`Color` に 3 つの静的プロパティ、`animalBlue`、`animalLightBlue`、`animalDarkBlue` を追加しました。これらはそれぞれ、明るさの異なる青色を表します。

これらのプロパティには `static` が付いているため、`Color` 型そのものに属します。

使用するときは、`Color.` から直接アクセスできます：

```swift
Color.animalBlue
```

この書き方は、Hex 文字列を直接書くよりも分かりやすくなります。

`Color.animalBlue` を見れば、それが動物百科で使う青色だと分かります。

一方、`Color(hex: "#2c54c2")` を見ても、色の値であることは分かりますが、具体的な用途は分かりにくくなります。

色を一元管理することには、もう一つ利点があります。あとで変更しやすくなります。

動物百科のメインカラーを調整したい場合は、定義している場所だけを変更すればよいです：

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

この色を使っているすべての場所がまとめて更新されます。

これが `static` を使って色を整理する意味です。色の名前が分かりやすくなり、あとでの保守も楽になります。

## 動物百科に適用する

これで、カスタムカラーを前の動物百科ビューに適用できます。

以前、動物ボタンの背景は白色でした：

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

これを、カスタムカラーに変更できます：

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

ここでの `Color.animalBlue` は、先ほど `Color+Hex.swift` で定義した静的カラーです。

ボタンの文字には白色を使います：

```swift
.foregroundStyle(Color.white)
```

動物 emoji の背景には、半透明の白色を使います：

```swift
.background(Color.white.opacity(0.15))
```

こうすると、ボタン全体に統一された青色の視覚スタイルが作られます。

このステップの重点は、複雑なコードを増やすことではなく、前に学んだカスタムカラーを実際の画面に適用することです。

## グラデーション背景を使用する

単色だけでなく、複数の色を組み合わせてグラデーション効果を作ることもできます。

例えば、前に次の色を定義しました：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

これらの色は単独で使えるだけでなく、組み合わせてグラデーション背景にすることもできます。

SwiftUI では、`LinearGradient` を使って線形グラデーションを作成できます。

例えば：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

このコードは、左から右へ変化するグラデーション背景を作成します。色は `Color.animalBlue` から `Color.animalLightBlue` へ少しずつ移り変わります。

その中で、`colors` はグラデーションに参加する色を設定し、`startPoint` と `endPoint` はグラデーションの方向を制御します。

### グラデーション効果をテストする

簡単な Text を使って、グラデーション背景をテストできます。

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

表示結果：

![color](../../../Resource/031_color3.png)

この例では、`Text` の背景は単色ではなく、左から右へ少しずつ変化するグラデーションカラーになります。

通常の背景色と比べて、グラデーション背景はより奥行きがあり、画面上で視覚的な重点を作りやすくなります。

## 動物百科でグラデーション背景を使用する

これで、動物ボタンの背景色：

```swift
.background(Color.animalBlue)
```

を、グラデーション背景に変更できます：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

完全なコードは次のとおりです：

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

表示結果：

![color](../../../Resource/031_color4.png)

これで、動物ボタンは単色の背景ではなく、左から右へ変化するグラデーション効果を持つようになりました。

単色背景と比べて、グラデーション背景は画面により奥行きを与え、実際の App に近い視覚デザインになります。

## 単色背景とグラデーション背景の違い

単色背景は 1 つの色だけを使用します。

例えば：

```swift
.background(Color.animalBlue)
```

この書き方はシンプルで分かりやすく、多くの基本的な画面に適しています。

グラデーション背景は複数の色を使用します。

例えば：

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

この書き方は画面に奥行きを加えられますが、視覚的な複雑さも増えやすくなります。

そのため、実際の開発では次のように理解できます：

単色背景は、通常のテキスト、通常のボタン、通常のカード、通常のページ背景に適しています。

グラデーション背景は、重要なボタン、上部エリア、カバーカード、機能入口など、強調したい位置に適しています。

## まとめ

このレッスンでは、SwiftUI でカスタムカラーを使う方法を学びました。

まず、Hex カラーについて理解しました。

例えば：

```text
#2c54c2
```

これは具体的な色を表します。

次に、`extension Color` を使って `Color` 型を拡張しました。

SwiftUI で次のように色を作成できるようにしました：

```swift
Color(hex: "#2c54c2")
```

続いて、`static` を使ってよく使う色を整理しました：

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

これにより、他のビューでは次のように直接使用できます：

```swift
Color.animalBlue
```

毎回 Hex 文字列を書くよりも、この方法のほうが分かりやすく、あとで色をまとめて変更しやすくなります。

最後に、`LinearGradient` を学び、カスタムカラーを組み合わせてグラデーション背景を作成しました：

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

このレッスンを通して、「カスタムカラーを作成する」ことから「実際の画面で色を使用する」ことまでを完成させました。

今後、同じ色を複数の場所で繰り返し使う場合は、まず `Color` の拡張に整理することを検討できます。

そうすると、コードがより分かりやすくなり、画面全体のスタイルも統一しやすくなります。
