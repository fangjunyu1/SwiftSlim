# 計算プロパティ

このレッスンでは、主に計算プロパティについて学びます。

計算プロパティは、既存のデータをもとに新しい結果を計算するために使います。数値を計算することも、SwiftUI のビューに表示する内容を計算することもできます。

たとえば:

```swift
let a = 10
let b = 20
let c = a + b
```

ここで `c` は、`a` と `b` を足した結果を表します。

通常のコードでは、このような書き方はよく使われます。

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

ヒント: `Button` のタップイベントの中では、通常の Swift コードを実行できます。

しかし、同じようなコードを SwiftUI ビューのプロパティに直接書くと、問題が起こります。

たとえば:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

このコードはエラーになります。

`a` と `b` は `c` より前に書かれているので、`c` の値を計算できそうに見えます。

しかし、構造体のプロパティ宣言では、この書き方を直接使うことはできません。

## c が a + b を直接計算できない理由

`a`、`b`、`c` はボタンのタップイベント内の一時的な定数ではなく、`ContentView` ビューのプロパティだからです。

ボタンのタップイベント内では、このコードは普通に実行できます:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

ボタンをタップしたあと、コードは順番に実行されます。最初に `a` が作られ、次に `b` が作られ、最後に `a + b` で `c` が計算されます。

しかし、ビューの中でプロパティを宣言するときは状況が異なります:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

ここでは `a`、`b`、`c` はすべて `ContentView` ビューのプロパティです。

`ContentView` ビューを作るとき、Swift はまずこれらのプロパティを準備する必要があります。生成処理を安全にするため、Swift はあるインスタンスの stored property のデフォルト値が、同じインスタンス内の別の instance property を直接読むことを許可していません。

そのため、この行はエラーになります:

```swift
let c = a + b
```

簡単に言うと、**ビューの中でプロパティを宣言するとき、普通のプロパティを使って別の普通のプロパティを直接計算することはできません。**

値を直接保存するプロパティは「stored property」と呼ばれます。理解しやすくするため、ここでは一時的に普通のプロパティと考えてもかまいません。

たとえば:

```swift
let a = 10
```

`a` は `10` を保存しています。

```swift
let b = 20
```

`b` は `20` を保存しています。

しかし:

```swift
let c = a + b
```

ここで `c` は直接書かれた値ではなく、`a + b` によって計算したい値です。

このように「既存のデータから結果を得る」場合は、計算プロパティを使う方が適しています。

次のように変更できます:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

ここで `c` は計算プロパティです。

```swift
var c: Int {
    return a + b
}
```

これは、**`c` が必要になったときに `a` と `b` を読み取り、`a + b` の結果を返す**という意味です。

たとえば:

```swift
Text("c: \(c)")
```

`Text` が `c` を表示するときに、はじめて `c` の計算が行われます。

## 計算プロパティとは?

計算プロパティは変数のように見えますが、それ自体はデータを保存しません。

たとえば:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

ここで `c` は計算プロパティです。

普通のプロパティのように固定された値を保存するのではなく、`c` が読み取られるたびに `{}` の中のコードを実行し、計算結果を返します。

次のように理解できます:

```swift
var c: Int {
    return a + b
}
```

`c` を使う必要があるとき、`a + b` を計算します。

そのため、計算プロパティはこのような場合に向いています。**結果を別に保存する必要がなく、既存のデータから計算できる場合です。**

## 基本的な書き方

計算プロパティは通常、3 つの部分で構成されます:

```swift
var c: Int {
    return a + b
}
```

### 1. `var` で宣言する

```swift
var c
```

計算プロパティは必ず `var` で宣言します。`let` は使えません。

計算プロパティは固定して保存された値ではなく、読み取られるたびに動的に計算される結果だからです。

### 2. 戻り値の型を書く

```swift
var c: Int
```

計算プロパティには戻り値の型を書く必要があります。

ここでは `c` は最終的に整数を返すので、型は `Int` です。

### 3. {} を使って計算ロジックを書く

```swift
{
    return a + b
}
```

`{}` の中に計算ロジックを書きます。ここでは `a + b` を返しています。

## return キーワード

計算プロパティは結果を返す必要があります。

たとえば:

```swift
var c: Int {
    return a + b
}
```

ここで `return` は、`a + b` の計算結果を外に返すという意味です。

計算プロパティの中に、結果を直接生み出す式が 1 つだけある場合、`return` は省略できます:

```swift
var c: Int {
    a + b
}
```

しかし、計算プロパティに複数行のコードがある場合は、`return` を使って返す結果を明確にする必要があります。

たとえば:

```swift
var totalPriceText: String {
    let total = count * price
    return "合計: \(total) $"
}
```

ここでは計算処理が 2 つの手順に分かれています。

1 つ目の手順では、まず合計金額を計算します:

```swift
let total = count * price
```

2 つ目の手順では、合計金額を文字列にして返します:

```swift
return "合計: \(total) $"
```

もし `return` を消すと:

```swift
var totalPriceText: String {
    let total = count * price
    "合計: \(total) $"
}
```

このコードはエラーになります。

理由は、**この計算プロパティにはすでに複数行のコードがあり、Swift がどの行を最終的な戻り値として返すべきか自動で判断できないためです。**

そのため、計算プロパティが 1 行の結果だけを持つ場合は、`return` を省略できます。

```swift
var c: Int {
    a + b
}
```

計算プロパティに複数行のコードがある場合は、`return` を明確に書くことをおすすめします。

```swift
var totalPriceText: String {
    let total = count * price
    return "合計: \(total) $"
}
```

## 計算プロパティと普通のプロパティの違い

普通のプロパティはデータを保存します。

```swift
var c = 30
```

ここで `c` は具体的な値 `30` を保存しています。

計算プロパティはデータを保存しません。

```swift
var c: Int {
    a + b
}
```

ここで `c` は `30` を保存していません。計算方法を提供しているだけです。

`c` が読み取られると、Swift は次を実行します:

```swift
a + b
```

そして計算結果を返します。

そのため、計算プロパティは、ほかのデータから結果を計算する場面に向いています。

## body も計算プロパティ

計算プロパティを学ぶと、SwiftUI で最もよく見るコードをもう一度理解できます:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ここで `body` も計算プロパティです。

`var` で宣言されています:

```swift
var body
```

戻り値の型があります:

```swift
some View
```

`{}` の中では SwiftUI のビュー内容を返しています:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

つまり `body` は、SwiftUI がこのビューを表示する必要があるときに読み取られ、`body` が返した内容に基づいて画面を作るものだと理解できます。

`return` を書くと、次のように考えられます:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

ただし SwiftUI では通常、`return` を省略して直接書きます:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

`@State` のデータが変わると、SwiftUI は `body` を再び読み取り、新しいデータに合わせて画面を更新します。

たとえば:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("数: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

ボタンをタップすると、`count` が変わります。

```swift
count += 1
```

`count` が変わると、SwiftUI は `body` を再計算するため、画面上の文字も更新されます。

```swift
Text("数: \(count)")
```

これが、SwiftUI でデータが変わると画面が自動的に更新される理由でもあります。

### body に複雑な計算を書くのはおすすめしない

`body` は計算プロパティなので、何度も読み取られ、再計算される可能性があります。

たとえば:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("数字: \(num)")
            Text("名前: \(name)")
        }
    }
}
```

`name` が変わると、SwiftUI は `body` を再計算します。

そのとき、`body` の中のコードも再実行され、`num` も再び作られます。

```swift
let num = 10
```

この例の `num` はとても単純なので、影響は大きくありません。

しかし `body` の中で、大量のデータのフィルタリング、並べ替え、画像処理などの複雑な計算を行うと、画面の滑らかさに影響する可能性があります。

そのため SwiftUI では、`body` は主に画面構造を説明する役割にするべきです。

簡単な一時データは `body` の中に書けます。

複雑な計算は、`body` の外にある計算プロパティ、メソッド、または別のデータ処理に置くことを検討できます。

## 例: 数量と合計金額

次に、簡単な例で計算プロパティを理解しましょう。

にんじん 1 本の単価が 2 $ で、ユーザーがボタンをタップして購入数量を変更でき、画面に合計金額を表示する必要があるとします。

合計金額の計算方法:

```
数量 * 単価
```

普通の変数で合計金額を保存すると、少し面倒になります。

数量が変わるたびに、合計金額を手動で更新する必要があるからです。

よりよい方法は、計算プロパティを使うことです:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("単価: \(price) $")
                Text("数量: \(count)")
                Text("合計金額: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

表示結果:

![view](../../Resource/024_view.png)

この例では:

```swift
@State private var count = 1
```

`count` はにんじんの数量を表します。ボタンをタップすると `count` が変わります。

```swift
private let price = 2
```

`price` はにんじんの単価を表します。ここでは固定値なので `let` を使っています。

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` は合計金額を表します。

合計金額は常に `count * price` で計算できるので、別に保存する必要はありません。

`count` が `1` のとき:

```swift
totalPrice = 1 * 2
```

表示結果は:

```swift
合計金額: 2 $
```

`+` ボタンをタップすると、`count` は `2` になります。

このとき `totalPrice` を再び読むと、再計算されます:

```swift
totalPrice = 2 * 2
```

表示結果は:

```swift
合計金額: 4 $
```

これが計算プロパティの役割です。既存のデータに基づいて、新しい結果を動的に計算します。

## 計算プロパティは判定にも使える

計算プロパティは数値を計算するだけでなく、判定結果を返すこともできます。

たとえば、数量の最小値を 1 にしたい場合です。

数量がすでに 1 のとき、`-` ボタンでさらに減らすべきではありません。

計算プロパティを追加できます:

```swift
private var canDecrease: Bool {
    count > 1
}
```

完全なコード:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("単価: \(price) $")
                Text("数量: \(count)")
                Text("合計金額: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

表示結果:

![view](../../Resource/024_view1.png)

ここで:

```swift
private var canDecrease: Bool {
    count > 1
}
```

このコードは、現在さらに減らせるかどうかを表します。

`count` が `1` より大きいとき:

```swift
canDecrease == true
```

減らすことができます。

`count` が `1` に等しいとき:

```swift
canDecrease == false
```

それ以上減らすことはできません。

### ボタン内の条件判定

ボタンでは次を使います:

```swift
if canDecrease {
    count -= 1
}
```

`canDecrease` が `true` のときだけ、`count` を減らせます。

### ビューの前景色を制御する

`canDecrease` を使って、ボタンの前景色も制御できます:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ここでは三項演算子を使っています:

```swift
canDecrease ? Color.primary : Color.gray
```

このコードの意味は、`canDecrease` が `true` なら前景色に `Color.primary` を使い、`false` なら `Color.gray` を使う、ということです。

`Color.primary` は SwiftUI が提供するシステムのセマンティックカラーで、現在の画面における主要な文字色を表します。

ライトモードでは `Color.primary` は通常黒に近く、ダークモードでは通常白に近くなります。

そのため `Color.primary` を使う利点は、ライトモードとダークモードに自動で適応することです。

### ビューの無効状態を制御する

`disabled` は、ビューが無効状態かどうかを制御するために使います:

```swift
.disabled(!canDecrease)
```

`disabled` が `false` のとき、ビューはタップできます。

`disabled` が `true` のとき、ビューは無効になり、タップできません。

ここで `canDecrease` を条件として使うと、コードが理解しやすくなります。

`canDecrease` を見れば、「今さらに減らせるかどうか」を表していると分かります。

### 補足: なぜ 2 回判定するのか?

`-` ボタンでは:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

ここでは `.disabled(!canDecrease)` も使い、ボタン内部でも `if canDecrease` を使っています。

`.disabled(!canDecrease)` は、画面上でボタンを無効化し、ユーザーがタップできないようにします。

`if canDecrease` は、コードを実行する前にもう一度確認し、減らせるときだけ `count -= 1` を実行します。

これは二重の保護です。実際の開発では、ボタンがすでに無効なら内部の判定は省略できます。ただし学習用の例では残しておくことで、`canDecrease` の役割がより分かりやすくなります。

## まとめ

このレッスンでは、主に計算プロパティを学びました。

計算プロパティは値を直接保存しません。読み取られたときに、既存のデータから結果を計算します。

たとえば:

```swift
var c: Int {
    a + b
}
```

ここで `c` は別に保存する必要がありません。`a + b` で計算できるからです。

計算プロパティは `var` で宣言し、戻り値の型を書く必要があります。

```swift
var canDecrease: Bool {
    count > 1
}
```

計算プロパティは数値だけでなく、判定結果、文字列の内容、さらに SwiftUI のビュー内容も返せます。

このレッスンでは `return` も学びました。

`return` は結果を返すという意味です:

```swift
var totalPriceText: String {
    let total = count * price
    return "合計: \(total) $"
}
```

計算プロパティの中に、結果を直接生み出す式が 1 つだけある場合、`return` は省略できます。

```swift
var totalPrice: Int {
    count * price
}
```

また、`Color.primary` と `disabled` についても学びました。

`Color.primary` は SwiftUI のシステムセマンティックカラーで、ライトモードとダークモードに合わせて表示が自動調整されます。

```swift
.foregroundStyle(Color.primary)
```

`disabled` は、ビューを無効にするかどうかを制御します。

```swift
.disabled(true)
```

無効になり、タップできないことを意味します。

```swift
.disabled(false)
```

有効で、タップできることを意味します。

そのため計算プロパティは SwiftUI でとてもよく使われます。計算結果、判定条件、表示内容をより分かりやすく整理するのに役立ちます。
