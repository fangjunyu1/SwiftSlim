# 補光ライトアプリ

このレッスンでは、とても面白い補光ライトアプリを作ります。夜になったら、スマートフォンの画面にさまざまな色を表示し、簡単な補光ライトとして使うことができます。

この補光ライトアプリは、画面をタップして色を切り替えたり、スライダーで明るさを調整したりできます。

この例では、`brightness` を使ってビューの明るさを調整する方法、`onTapGesture` を使ってビューにタップジェスチャーを追加する方法、そして `Slider` コントロールについて学びます。

実行結果：

![Color](../../Resource/018_color.png)

## 色を表示する

まずは、ビューに 1 色を表示してみましょう。

SwiftUI では、`Color` は色を表すだけでなく、ビューとして表示することもできます。

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

ここで `Color.red` は赤いビューを表します。`.ignoresSafeArea()` は色のビューを画面全体に広げるので、実際の補光ライトのような見た目になります。

実行結果：

![Color](../../Resource/018_color1.png)

### 色の配列とインデックス

今は 1 色だけが表示されています。しかし、補光ライトは通常 1 色だけではありません。青、黄色、紫、白などの色を表示することもできます。

画面をタップしたときに、さまざまな色を切り替えたいです。これらの色を配列に入れて、まとめて管理できます。

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

配列は「同じ型のデータの集まり」を保存するのに向いています。ここでは、配列の各要素が `Color` です。

特定の色を表示したい場合は、インデックスを使えます。

```swift
colors[0]
```

これは、配列のインデックス `0` にある色、つまり最初の色を読み取ることを意味します。

これでコードは次のように書けます。

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

このようにすると、画面には配列の最初の色、つまり赤が表示されます。

### インデックスで色を制御する

異なる色に切り替えたい場合は、インデックスを固定で書くのではなく、インデックスを管理する変数が必要です。

`@State` を使って、インデックスを保存する変数を宣言できます。

```swift
@State private var index = 0
```

ここで `index` は現在の色のインデックスを表します。

`index` が変化すると、SwiftUI は画面を再計算して表示内容を更新します。

そして、元の `colors[0]` を次のように変更します。

```swift
colors[index]
```

こうすることで、ビューに表示される色は `index` によって決まります。

するとコードは次のようになります。

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` が変わると、`colors[index]` もそれに応じて違う色を表示します。

例えば：

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

注意すべき点は、`index` が配列の最大インデックスを超えてはいけないということです。超えると配列範囲外エラーが発生します。

## タップジェスチャー

これで `index` に応じて違う色を表示できますが、まだタップで色を切り替えることはできません。

以前の「名言カルーセル」のレッスンでは、`Button` を使って名言の切り替えを制御しました。

しかし今回は、「色の領域全体をタップ」して色を切り替えたいので、`onTapGesture` のほうが適しています。

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

色のビューをタップすると、次のコードが実行されます。

```swift
index += 1
```

これは `index` を `1` 増やすという意味です。インデックスが増えると、`colors[index]` は配列の次の色を表示します。

### `onTapGesture`

`onTapGesture` は、ビューにタップ操作を追加するジェスチャーモディファイアです。

基本的な使い方：

```swift
.onTapGesture {
    // code
}
```

例えば：

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

この赤いビューをタップすると、中括弧の中のコードが実行され、コンソールに次のように表示されます。

```swift
Click color
```

`onTapGesture` を使うと、ビューがタップされた後の動作を設定できます。

### `Button` との違い

前に `Button` ビューを学びました。`Button` と `onTapGesture` はどちらもタップ操作を処理できますが、使いどころは完全には同じではありません。

`onTapGesture` は、`Color`、`Image`、`Text`、その他の通常のビューのような「既存のビューにタップ機能を追加する」場合により適しています。

一方で `Button` は、「確認」「送信」「削除」のような明確なボタンを表すときにより適しています。

この補光ライトアプリでは、色の切り替え機能をもっとシンプルにしたいです。色の領域全体をタップして色を切り替えるので、ここでは `onTapGesture` が適しています。

## インデックスの問題

これで画面をタップして、異なる色を切り替えられるようになりました。

しかし、ここには重要な問題があります。**インデックスが配列の範囲を超える可能性がある**ことです。

例えば：

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

画面を何度もタップし続けると、`index` は最終的に `4` になり、その時点で「index out of range」エラーが発生します。

これは、`colors` 配列には `4` つの要素がありますが、インデックスは `0` から始まるため、有効なインデックス範囲が `0 - 3` だからです。`4` ではありません。

`colors[4]` にアクセスすると、「index out of range」エラーが発生します。

現在のコードでは、画面をタップするたびに `index` が自動的に `1` 増えます。このまま処理しないと、必ず範囲を超えてしまいます。

そのため、画面をタップしたときにインデックスを判定する必要があります。最後の色なら最初の色に戻し、そうでなければ `1` 増やします。

これは `if` 文で実装できます。

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

このコードで `colors.count` は、配列の要素数を意味します。

今の配列には 4 色あるので：

```swift
colors.count // 4
```

しかし最大インデックスは `4` ではなく `3` です。なぜならインデックスは `0` から始まるからです。

したがって、最後のインデックスは次のように書きます。

```swift
colors.count - 1
```

つまり：

```swift
4 - 1 = 3
```

このロジックは、現在のインデックスがすでに最後の色なら `0` に戻し、そうでなければ `1` 増やす、という意味です。

このようにして、色を循環して切り替えられるようになります。

### インデックスロジックの簡略化

コードをもっと簡潔にしたい場合は、三項演算子も使えます。

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

このコードの意味は、`index == colors.count - 1` が真なら `0` を返し、そうでなければ `index + 1` を返す、ということです。

最後に、その結果を `index` に代入します。

これで色の切り替え効果を実現できます。

完全なコード：

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

これで、画面をタップして異なる色を切り替えられるようになりました。基本的な補光ライトアプリが完成です。

## 色の名前を表示する

色に対応するもう 1 組のテキストを追加すれば、色が切り替わったときに現在の色の名前も画面に表示できます。

例えば：

- 赤のときは `Red`
- 青のときは `Blue`
- 黄色のときは `Yellow`
- 紫のときは `Purple`

ここでも色の名前を保存するために配列を使えます。

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

この配列の文字列の順番は、色の配列の順番と正確に対応している必要があります。

そして現在のインデックスに対応する色の名前を `Text` で表示できます。

```swift
Text(colorsName[index])
```

`Text` は `index` に応じて現在の色名を表示します。

`Text` の見た目を整えるためにモディファイアを使います。

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

これにより、`Text` は白色・タイトルサイズ・太字で表示されます。

今は全画面の `Color` ビューがあります。もし `Text` を `Color` ビューの上に表示したいなら、`ZStack` レイアウトコンテナを使って重ねる必要があります。

```swift
ZStack {
    Color
    Text
}
```

するとコードは次のようになります。

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

このようにすると、背景が色のビューになり、その上にテキストビューが重なって表示されます。

実行結果：

![Color](../../Resource/018_color2.png)

注意点として、`ZStack` では後に書いたビューが通常は前面に表示されます。もし `Text` を `Color` より前に書くと、後から書かれた `Color` ビューが `Text` を覆ってしまうことがあります。

## 明るさを制御する

これで異なる色を切り替えられるようになりましたが、補光ライトにはもう 1 つ重要な機能があります。**明るさを調整すること**です。

SwiftUI では、`brightness` モディファイアを使ってビューの明るさを調整できます。

例えば：

```swift
.brightness(1)
```

次のように書けます。

```swift
colors[index]
    .brightness(0.5)
```

これにより現在の色がより明るくなり、補光ライトの効果に近づきます。

明るさの範囲は `0 - 1` です。`0` は元の色を保つことを意味し、値が `1` に近づくほど色は明るくなります。`1` は最も明るい白の結果を意味します。

ただし、コードで `brightness` を制御できても、ユーザー自身が直接調整することはまだできません。

そこで、ドラッグできるコントロール `Slider` を追加する必要があります。

## `Slider` ビュー

SwiftUI では、`Slider` は一定範囲の中から値を選ぶためのコントロールです。Apple はこれを「制限された線形範囲から値を選択するためのコントロール」と説明しています。

基本的な使い方：

```swift
Slider(value: $value, in: 0...1)
```

パラメータの説明：

1. `value: $value`：`Slider` は変数にバインドする必要があります。

    スライダーを動かすと、変数の値も同時に変わります。逆に変数が変われば、スライダーも更新されます。

    これは以前に学んだ `TextField` ととても似ています。どちらも「コントロールを変数にバインドする」ものです。

    バインドを表すために、変数の前に `$` 記号を付ける必要があります。

2. `in: 0...1`：このパラメータはスライダーの値の範囲を表します。

    ここで `0...1` は、最小値が `0`、最大値が `1` であることを意味します。

    スライダーを一番左まで動かすと、バインドされた変数は `0` に近づきます。右まで動かすと `1` に近づきます。

例えば：

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` は `value` 変数にバインドされています。スライダーを動かすと、`value` の値も同時に変化します。

表示例：

![Slider](../../Resource/018_slider.png)

`Slider` を左に動かすと、バインドされた `value` は `0` になります。右に動かすと `1` になります。

### 値の範囲

`Slider` の値の範囲は固定ではありません。例えば次のようにも書けます。

```swift
0...100
```

あるいは別の範囲でも構いません。

しかし、この補光ライトアプリでは明るさを制御する必要があるため、`0...1` が最も適しています。

## `Slider` を使って明るさを制御する

次に、`Slider` と `brightness` をつなげます。

まず、明るさの値を保存する変数を作成します。

```swift
@State private var slider = 0.0
```

ここで `0.0` は `Double` 型の値です。

`Slider` は通常数値型にバインドされ、ここでは連続的に変化してほしいので、`Double` が適しています。また `brightness` も `Double` 型の値しか受け取れません。

次に、この値を `brightness` に渡します。

```swift
colors[index]
    .brightness(slider)
```

`slider == 0` のとき、色は初期状態のままです。`slider` が `1` に近づくほど、色はより明るく見えます。

### `Slider` コントロールを追加する

次に、この変数を変更するための `Slider` コントロールを追加します。

```swift
Slider(value: $slider, in: 0...1)
```

スライダーが変わると `slider` の値も変わり、`brightness(slider)` が同時に明るさを更新します。

これは SwiftUI における「変数がビューを駆動する」典型的な例です。

### `Slider` の見た目を調整する

デフォルトでは、`Slider` は利用可能な横幅を使います。

固定の幅を与えることもできます。

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

さらに、見やすくするためにいくつかのモディファイアを追加します。

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

こうすることで、スライダーに白い背景と角丸が付き、`Color` ビューの上でもより見やすくなります。

最後に、これを画面の下部に配置します。

すでに `ZStack` を使っているので、その中に `VStack` を置き、`Spacer()` を使って `Slider` を下に押し下げることができます。

## 完全なコード

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

実行結果：

![Color](../../Resource/018_color.png)

## まとめ

これまでに学んだ知識と、色や配列のような基本概念を使って、とても面白い補光ライトアプリを作ることができました。

この補光ライトアプリを通して、`brightness` で明るさを調整する方法、`onTapGesture` でビューにタップ操作を追加する方法、そして `Slider` コントロールの使い方を学びました。

`Color` ビューに `onTapGesture` を追加して色を切り替えられるようにしました。また、`brightness` を管理する変数を `Slider` で変更することで、「変数がビューを駆動する」という考え方も確認できました。

さらに、三項演算子を復習し、`ZStack` でビューを重ね、配列で同じ型のデータを管理する方法も学びました。これにより、配列やインデックスへの理解が深まり、範囲外インデックスエラーを避けるという実践的な問題にも気づけます。

この例は複雑ではありませんが、これまで学んだ多くの基本知識をつなげています。小さくても実際のプロジェクトとしてまとめることで、それぞれの知識が何のためにあるのかがより理解しやすくなります。

### 実際の利用シーン

例えば、古い iPhone を机の上に置き、自分で作った補光ライトアプリで光の色をコントロールする場面を想像してみてください。とても良い体験になるはずです。

App Store には多くの「補光ライト」アプリがありますが、それらもそれほど複雑には見えません。

![AppStore](../../Resource/018_appStore.PNG)

私たちはシンプルなアプリから開発を始めて、App Store に公開することにも挑戦できます。それは開発への興味を高めるだけでなく、自分たちの成長の記録にもなります。

### 授業後の練習

この補光ライトアプリをさらに発展させる方向として、例えば次のようなものを考えられます。

- もっと多くの色を追加する
- 現在の明るさの値を表示する
- 下部のスライダー領域のデザインを改善する

この知識を本当に使い始めると、私たちが学ぶ一つ一つの概念が、実はアプリ開発のための道具なのだとわかります。

身につける道具が多いほど、実現できる機能も増えていきます。
