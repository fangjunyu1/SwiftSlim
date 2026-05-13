# View を理解する

この授業では、最初に出てきた `ContentView` にもう一度戻ります。

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

私たちが初めて SwiftUI に触れたとき、`ContentView` の中には、まだ理解できないキーワードがたくさんありました。

たとえば `struct`、`View`、`var`、`body`、`some View` などのキーワードです。

当時はおそらく、**コードを `body` の中に書くと、画面上に内容が表示される**、ということだけを知っていたかもしれません。

今では、`struct`、変数、メソッド、プロトコルを学んできました。そこで、このコードをもう一度理解し直すことで、SwiftUI の view 同士の関係を理解しやすくなります。

## ContentView を振り返る

SwiftUI プロジェクトを作成すると、Xcode はデフォルトで `ContentView` ファイルを生成します。

サンプルコードは次のとおりです。

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

このコードはいくつかの部分に分けて理解できます。

まずは：

```swift
import SwiftUI
```

このコード行は、SwiftUI フレームワークをインポートすることを表しています。

SwiftUI をインポートしたあと、`View`、`Text`、`Image`、`VStack`、`Button` などの SwiftUI view を使えるようになります。

## ContentView 構造体

このコード行は、1つの構造体を作成することを表しています。

```swift
struct ContentView: View
```

そのうち：

```swift
struct ContentView
```

は、`ContentView` が1つの構造体であることを表します。

前回の授業では `struct` 構造について学びました。これは異なるフィールド構造を1つにまとめることができ、プロパティやメソッドを含めることができます。

たとえば：

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

この例では、`ContentView` の中に `name`、`printName`、`body` の3つの内容が含まれています。

つまり、`struct` は関連するプロパティ、メソッド、view の内容をまとめて整理できます。

![contentView](../../Resource/023_contentVIew.png)

## View はプロトコル

このコード行を続けて見てみます。

```swift
struct ContentView: View 
```

コロンの後ろにある `View` は、`ContentView` が `View` プロトコルに準拠していることを表します。

これは、`ContentView` が SwiftUI view になりたいなら、`View` プロトコルの要求を満たす必要がある、ということです。

### Identifiable プロトコル

以前、映画リストを学んだとき、私たちは `Identifiable` プロトコルに触れました。

そのとき、`ForEach` の中で `Movie` 配列を走査する必要がありましたが、`Movie` 構造には一意な識別子がなかったため、`ForEach` での走査をサポートしていませんでした。

そこで、`Movie` 構造を `Identifiable` プロトコルに準拠させ、`ForEach` が求める一意な識別子の条件を満たす必要がありました。

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` プロトコルの要求は、**この型が自分自身を識別する `id` フィールドを持っていること**です。

`Movie` が `id` フィールドを提供すると、`Identifiable` の要求を満たせます。

こうして `ForEach` の中で使うとき、SwiftUI は各データを識別できます。

```swift
ForEach(lists) { movie in
    // ...
}
```

### View プロトコル

`View` プロトコルも同じです。

ある型が SwiftUI view になりたいなら、`View` プロトコルに準拠する必要があります。

そして `View` プロトコルの最も重要な要求は、`body` を提供することです。

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

これは、`View` プロトコルが **`body` によって返される SwiftUI view だけを受け取り、`ContentView` は `body` を通して SwiftUI view を表示する**、と理解できます。

### View に準拠しないとどうなる？

もしこのように書いた場合：

```swift
struct ContentView {
}
```

これはただの普通の構造体であり、SwiftUI view ではありません。

普通の構造体自体は有効な Swift コードなので、直接エラーにはなりません。

しかし、これを preview に置くと：

```swift
#Preview {
    ContentView()
}
```

この時点でエラーになります。

理由は、**preview は SwiftUI view を表示する必要があるのに、この `ContentView` は `View` プロトコルに準拠していないから**です。

そのため、`ContentView` を画面上に表示したいなら、`View` プロトコルに準拠させる必要があります。

```swift
struct ContentView: View {
}
```

同時に、`View` プロトコルの要求に従って `body` を提供します。`body` がなければ、compiler はやはりエラーを出します。

正しい書き方：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

このとき、`ContentView` は本当に表示できる SwiftUI view になります。

## body は view 表示の入口

SwiftUI では、`body` は view 内容の入口です。

```swift
var body: some View {
    Text("Hello, world!")
}
```

ここは3つの部分に分けられます。

**1、var body**

```swift
var body
```

これは `body` という名前の変数を定義していることを表します。

**2、some View**

```swift
: some View
```

これは、この `body` が1つの view を返すことを表します。

**3、{ ... }**

```swift
{
    Text("Hello, world!")
}
```

これは表示される view の内容を表します。このコードでは `Text` view が表示されます。

つまり、`body` の中に何を書くかによって、画面上に何が表示されるかが決まります。

たとえば：

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

このコードは、**画面上に縦方向に並んだ内容が表示され、その中に2つのテキストがある**ことを表しています。

### body の名前は自由に変更できない

注意が必要なのは、`body` という名前は勝手に変更できないということです。

もし次のように書くと：

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

この `content` も view プロパティではありますが、`body` の代わりにはなりません。

なぜなら、`View` プロトコルが要求する名前はまさに `body` だからです。

## some View とは？

SwiftUI では、`some View` は具体的な view を返すことを表します。ただし、その view の完全な型を書く必要はありません。

```swift
var body: some View
```

つまり、`some View` は型がないという意味ではありません。実際の型は依然として存在し、compiler はその型を知っています。ただし、その型が非常に複雑になることがあるため、Swift は `some View` を使ってそれを隠せるようにしています。

### some とは？

Swift では、`some` は不透明型、つまり opaque type を宣言するためのキーワードです。

不透明型とは、**戻り値には具体的な型があり、compiler はその具体的な型を知っているが、私たちはその型を直接書かない**という意味です。

たとえば：

```swift
func makeView() -> some View {
    Text("Hello")
}
```

これは、`makeView` が `View` プロトコルに準拠した具体的な型を返すことを表します。

### なぜ some が必要なのか？

変数を学んだとき、私たちは **Swift の値には明示的な型注釈が必要であるか、または compiler が自動的に型を推論する必要がある**ことを学びました。

たとえば：

```swift
let a: Int = 10
```

ここで定数 `a` は `Int` 型です。

SwiftUI view も例外ではありません。`body` を使って SwiftUI view を表示するとき、`body` は対応する SwiftUI 型を返す必要があります。

たとえば、`body` で `Text` というテキスト view を表示するなら、`body` は対応する `Text` 型を返す必要があります。

```swift
var body: Text {
    Text("Fang Junyu")
}
```

この例では、`body` の内部で表示されているのは `Text` view であり、戻り値の型も `Text` です。

内部の型と宣言した型が一致しているときだけ、compiler の型一致に関する要求を満たします。

**型が一致しない問題**

もし `body` の型を `Color` に設定したのに、表示しているのが `Text` なら：

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` の型と内部コードの型が一致しないため、型不一致のエラーが発生します。

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

このときは、`body` の戻り値の型を手動で変更する必要があります。

**複雑な view 型**

実際の開発では、画面には通常 `Text` だけがあるわけではありません。

より複雑な `VStack` を表示する必要がある場合、複雑な戻り値の型を手動で注釈する必要があります。

たとえば：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

このコードは、`VStack` を返し、その内部に `Image` と `Text` 型の view があることを表しています。

`body` の戻り値の型は：

```swift
VStack<TupleView<(Image,Text)>>
```

見て分かるように、この戻り値の型は非常に複雑です。さらに、以前見たことのない `TupleView` も新しく出てきました。

ここでの `TupleView` は、**複数の child view を1つの view として包むもの**と理解できます。

**さらに複雑な view 型**

もし view に修飾子を追加すると：

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

すると、この view の戻り値の型は非常に複雑になり、ここで具体的に説明することはできません。

既存の戻り値の型 `VStack<TupleView<(Image,Text)>>` では修飾子を表現できないため、エラーが発生します。

**some View は戻り値の型を簡略化する**

このような場合に、SwiftUI は簡潔な解決方法を提供しています。それが `some View` を使って書き方を簡単にすることです。

`body` を `some View` 型に変えると：

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

view のコードを変更するたびに、完全な戻り値の型を再び書く必要がなくなります。

これは、`some View` が `View` プロトコルに準拠した具体的な view を返すことを表しているからです。

言い換えると、`VStack`、`Image` などの SwiftUI view はすべて `View` プロトコルに準拠しています。修飾子を追加した後に返される view の型も、依然として `View` プロトコルに準拠しています。

そのため、それらはすべて `some View` として返せます。

### some View は任意の view を自由に返せるわけではない

`some View` は複雑な型を隠せますが、「型がない」という意味ではありません。

その中心的なルールは、**compiler が1つの具体的な戻り値の型を確定できなければならない**ということです。

たとえば：

```swift
var title: some View {
    Text("Hello")
}
```

ここで返されるのは `Text` view です。

しかし、2つの view を返そうとするとエラーになります。

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

なぜなら、`some View` は最終的に1つの view 構造を返す必要があるのに、ここでは2つの独立した view を返そうとしているからです。

### 解決方法

解決方法は通常2つあります。コンテナと `@ViewBuilder` です。

**1、コンテナで包む**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

このコードでは、`title` が返すのは1つの `VStack` であり、`Text` と `Image` は `VStack` の中の child view です。

`some View` が受け取る view 構造は1つの `VStack<...>` なので、`some View` が1つの view 構造を返すという要求を満たします。 

これが、SwiftUI を学び始めた最初から、最外層に `VStack` コンテナを使って view コードを包むことを勧めている理由でもあります。

**2、@ViewBuilder を使う**

`some View` の前に `@ViewBuilder` 修飾子を追加することもできます。

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` は複数の view を1つの戻り値に組み合わせることができます。

本質的には、複数の view を1つの view にまとめ、`some View` が1つの view 構造を返すという要求を満たしています。

### なぜ body には複数の view を直接書けるのか？

もし `var body` の中に複数の view を書いた場合、たとえば：

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

場合によっては、このような `body` はエラーになりません。

理由は、`View` プロトコルの中の `body` が、デフォルトで `@ViewBuilder` をサポートしているからです。

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` プロトコルのソースコードでは、`@ViewBuilder` がすでに `body` 変数を修飾していることが分かります。

そのため、`body` は普通の `some View` よりも特別な処理が1層多く、SwiftUI が自動的に複数の view を1つの view に組み合わせてくれます。

**コンテナの使用をおすすめする**

初学者がより理解しやすいように、複数の view を整理するときは、まず `VStack`、`HStack`、`ZStack`、`Group` などのコンテナを使うことをおすすめします。

たとえば：

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

このようにするとコードがより直感的です。**外側は1つの `VStack` で、その中に2つの child view が置かれています。**

## view を分割する

画面が比較的シンプルな場合、すべてのコードを `body` の中に書くことができます。

たとえば：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Qinote へようこそ")
                Text("おはようございます")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("タップしてください") {
                print("タップしてください ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

この view の表示スタイル：

![view](../../Resource/023_view1.png)

このコードは正常に実行できます。しかし、view コードが非常に複雑になると、`body` の中のコードはますます長くなり、読むことや変更することの難しさもどんどん増えていきます。

このとき、異なる領域を独立した view プロパティに分割できます。

### 上部 view を分割する

たとえば、上部領域を切り出します。

```swift
var topHome: some View {
    HStack {
        Text("ホーム")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

ここでの `topHome` は変数であり、1つの view を返します。

返すものが view なので、型は次のように書けます。

```swift
some View
```

これは実際には `body` と同じ使い方です。

```swift
var topHome: some View { }
var body: some View { }
```

どちらも変数を使って view を表示し、戻り値の型は `some View` です。

### ほかの view を分割する

次に、ほかの部分も続けて分割します。

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Qinote へようこそ")
        Text("おはようございます")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("タップしてください") {
        print("タップしてください")
    }
    .buttonStyle(.borderedProminent)
}
```

分割したあと、view 変数を `body` の中に置けます。

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("ホーム")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Qinote へようこそ")
            Text("おはようございます")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("タップしてください") {
            print("タップしてください")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

今の `body` は、ページ構造を説明することだけを担当しています。

```swift
topBar
welcomeText
colorList
clickButton
```

各部分の具体的な実装は、下にある対応するプロパティの中に置かれています。

このように view を分割すると、ページ構造がよりはっきりし、それぞれの view 領域に名前があるため、読むときにもより直感的です。

ある部分のコードを変更したいときも、複雑なコードの山から探すのではなく、対応する view 領域を直接見つけられます。

### some View は単一の view を返す

この分割された view の中で、もし複数の view を返そうとすると：

```swift
var topBar: some View {
    Text("ホーム")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` は1つの view 構造だけを返せるため、エラーが発生します。

`body` と違って、普通の計算プロパティにはデフォルトで `@ViewBuilder` がありません。

そのため、複数の view を返す必要がある場合は、`VStack`、`HStack`、または `Group` コンテナを使って、複数の view を1つにまとめることができます。

```swift
var topBar: some View {
    VStack {
        Text("ホーム")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

または `@ViewBuilder` を追加して view を組み合わせます。

```swift
@ViewBuilder
var topBar: some View {
    Text("ホーム")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

こうすることで、複数の view を返せます。

### if が複数の view を返す

たとえば：

```swift
var topHome: some View {
    if step == "ホーム" {
        HStack {
            Text("ホーム")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("なし")
    }
}
```

このコードでは、`topHome` は `step` の内容に応じて、`HStack` または `Text` という2種類の異なる view を返します。

`some View` は確定した具体的な戻り値の型を必要とするため、普通の計算プロパティの `if` の2つの分岐は、異なる型の view を直接返すことができず、エラーになります。

**解決方法はやはり、コンテナで包むか、`@ViewBuilder` 修飾子を使うことです。**

### 分割した view で括弧を使わない理由

`body` の中で分割した view プロパティを使うとき、私たちは直接こう書きます。

```swift
topBar
welcomeText
colorList
clickButton
```

次のようには書きません。

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

なぜなら、`topBar`、`welcomeText`、`colorList`、`clickButton` は変数だからです。この変数は実際には計算プロパティであり、メソッドではありません。

**プロパティには括弧は必要ありません。**

もしメソッドとして書くなら、似た効果を実現することもできます。

```swift
func topBar() -> some View {
    HStack {
        Text("ホーム")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

このコードも似た効果を実現できます。このメソッドを呼び出すと、1つの view が返されます。

使うときは次のように書く必要があります。

```swift
topBar()
```

SwiftUI では、引数を渡す必要のない view を分割するだけなら、計算プロパティを使う方法のほうが一般的です。

```swift
var topBar: some View { ... }
```

## ネストされた view

コードをプロパティに分けるほかに、新しい view 構造体を作成することもできます。

たとえば：

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

この `PinkColorView` は `ContentView` と同じく、独立した SwiftUI view です。

`ContentView` の中で表示したい場合は、view 名の後ろに `()` を付けます。

たとえば：

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

ここでの：

```swift
PinkColorView()
```

は、`PinkColorView` インスタンスを作成することを表します。

`PinkColorView` は `View` プロトコルに準拠しているため、`Text`、`Image`、`Button` と同じように、ほかの view の中に置いて表示できます。

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

これが view のネストです。1つの view は、別の view の中に表示できます。

## view プロパティか、新しい view を作るか？

view のコードが比較的シンプルなときは、通常コードを分割する必要はありません。コードが比較的複雑になったときだけ、view を分割することをおすすめします。

### view プロパティを使う場面

現在の view の中の小さな内容領域だけであれば、view プロパティを使えます。

たとえば：

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

これらの内容は通常、現在の view の中だけで使われます。

### 新しい view を作る場面

これらの内容が比較的独立している、または将来複数のページで再利用される可能性があるなら、新しい view を作るほうが適しています。

たとえば：

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

これはタイトル view です。この view を共通コンポーネントとして、ほかの view で再利用したい場合があります。

新しい view を作成できます。

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

そして、ほかの場所で使います。

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

このとき、この view は再利用可能な独立コンポーネントになります。

簡単にまとめると：

- 現在の view の内容領域：`var xxx: some View` を使える
- 再利用可能な独立コンポーネント：新しい `struct XxxView: View` を作れる
- データを渡す必要があるコンポーネント：通常は新しい view を作るほうが適している。

## まとめ

この授業では、SwiftUI の中で最も基本的でありながら最も重要な view 構造をもう一度理解しました。

`ContentView` は構造体です。`struct` で定義され、ページに関連するコードを整理するために使われます。

`View` はプロトコルです。ある構造体が SwiftUI view になりたいなら、`View` プロトコルに準拠する必要があります。

`body` は、`View` プロトコルが私たちに提供を要求する内容です。この view が何を表示するかを決めます。

`some View` は、ある具体的な view を返すことを表しており、その複雑な完全な型を書く必要はありません。

view コードが長くなったとき、`var xxx: some View` を使って、view コードを複数の小さな領域に分割できます。

ある内容が比較的独立している、または再利用する必要がある場合は、新しい view 構造体を作成し、ほかの view の中で `XxxView()` によって表示できます。

簡単に言えば、SwiftUI の画面は1つ1つの view を組み合わせて作られています。1つのページには複数の小さな view を含めることができ、小さな view もさらにほかの view を含めることができます。
