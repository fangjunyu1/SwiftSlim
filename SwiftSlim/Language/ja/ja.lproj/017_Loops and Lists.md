# ループとリスト

このレッスンでは、Swift の `for` ループと、SwiftUI の `ForEach` を学びます。

この 2 つはどちらも、配列の中にある要素を順番に 1 つずつ読み取るのに役立ちます。実際の開発では、ひとまとまりのデータを 1 件ずつ取り出して処理したり表示したりすることがよくありますが、ループはまさにその作業を行うための重要な仕組みです。

私たちが Web ページを見たり App を使ったりすると、たくさんのリストや項目をよく目にします。このような内容は、通常まず `配列` に保存され、その後 `ループ` によって 1 つずつ読み取られ、最後に画面へ表示されます。

たとえば、Google の検索結果リストです。

![Google](../../Resource/017_google.png)

検索結果リストのそれぞれの項目は、通常 1 つのデータに対応しており、ループによって順番に表示されます。

そのため、`配列` と `ループ` はよく一緒に登場します。`配列` はひとまとまりのデータを保存する役割を持ち、`ループ` はそのデータを順番に取り出して、同じ処理を繰り返し実行する役割を持っています。

それでは、まず最も基本的な `for` ループから見ていきましょう。

## カウントダウン

たとえば、カウントダウンの機能をまねして、`「5、4、3、2、1」` を順番に出力したいとします。

もっとも直接的な書き方は次のようになります。

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

この書き方でもカウントダウンを再現することはできますが、内容が多くなるととても重複が多くなり、あとで修正するのも不便です。

そこで、まずデータを配列に入れてから、`for` ループを使って順番に出力できます。

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

この書き方はより簡潔で、あとから拡張しやすいです。カウントダウンの数字がたくさんあっても、`print` を 1 行ずつ何度も書く必要はなく、ループに配列の各要素を自動で処理させればよいからです。

このコードは、ボタンの中に入れてテストすることもできます。

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

ボタンをタップすると、`for` ループは配列の順番どおりに `countDown` の各整数を 1 つずつ取り出し、コンソールに出力します。

続いて、`for` ループがどのように動くのかを見ていきましょう。

## for ループ

`for` ループは、ひとまとまりのデータを順番に処理するために使います。もっともよく使われる対象は、配列と範囲です。

基本的な書き方は次のとおりです。

```swift
for 要素 in 配列または範囲 {
    実行するコード
}
```

たとえば、先ほどのカウントダウンのコードです。

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

ここでの `i` は、そのとき取り出された要素を表しています。`in` の後ろには、繰り返し対象となるデータ、つまり `countDown` 配列が続きます。

このコードの意味は、プログラムが `countDown` 配列の中から各要素を順番に取り出し、取り出すたびに一時的に `i` という名前で表し、そのあと波かっこの中のコードを実行する、ということです。

実行の流れは次のように考えられます。

* 最初に取り出されるのは `5` なので、このとき `i` の値は `5`
* `print(i)` を実行して `5` を出力する
* 次に `4` を取り出す
* もう一度 `print(i)` を実行して `4` を出力する

その後の `3`、`2`、`1` も同じように順番に実行されます。

![for](../../Resource/017_for.png)

配列の中のすべての要素を処理し終えると、`for` ループは自動的に終了します。

このように、`for` ループを使うことで、配列の各要素を 1 つずつ取り出し、カウントダウンのような処理を実現できます。

**補足**：`i` は for ループでよく使われる名前で、現在取り出している要素を表しますが、これは決まった書き方ではありません。ほかの英単語を使ってもかまいません。

たとえば、取り出した要素を `num` で表すこともできます。

```swift
for num in countDown {
    print(num)
}
```

この場合、波かっこの中でも、現在取り出している要素を表す名前として `num` を使う必要があります。

### 範囲を繰り返す

`for` ループは配列だけでなく、範囲に対しても使えます。

たとえば、`50` までの正の整数の合計を求めたいときは、`1` から `50` までのすべての整数を順番に足していく必要があります。

もっとも直接的な書き方は、たとえば次のようなものです。

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

しかし、この書き方ではすべての数字を手で書かなければならず、とても面倒です。実際の開発にも向いていません。

そこで、範囲演算子と `for` ループを組み合わせて実現できます。

前の「演算子」の章で、私たちは範囲演算子を学びました。

```swift
1...3   // 1, 2, 3
```

ここでの `...` は閉区間を表し、開始値と終了値の両方を含みます。

そのため、ここでは `1` から `50` までの整数範囲に対して `for` ループを使えます。

```swift
for i in 1...50 {
    
}
```

これらの整数を合計したいので、合計を保存する変数も必要です。

```swift
var count = 0
```

そして、ループのたびに、現在取り出した数字を `count` に加えます。

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

このコードの意味は次のとおりです。

* `count` は現在の合計を保存するために使う
* `for` ループは `1` から `50` までの整数を 1 つずつ取り出す
* 整数を 1 つ取り出すたびに `count += i` を 1 回実行する
* ループが終わると、`count` には最終的な合計が入っている

このようにして、`50` までの正の整数の合計を求めることができます。

同じように、`1` から `100` までの整数の合計を求めたいなら、範囲を変えるだけで済みます。

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` ループは、配列だけでなく範囲も繰り返し処理できます。このように、データを順番に繰り返し処理する力は、開発の中でとてもよく使われます。

これによって、すべての数字の加算や、それに似た繰り返し作業を 1 つずつ手で書かなくても、自動で処理できるようになります。

## SwiftUI におけるループ

ここまでの `for` ループは、Swift 言語そのものの機能です。

しかし SwiftUI では、view の構造の中で、そのまま `for` を使って view を作ることはできません。

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

これは、`VStack` の中に必要なのは SwiftUI の view だからです。普通の `for` ループ自体は view ではありません。

SwiftUI で、配列の内容に応じて画面を繰り返し作りたい場合は、`ForEach` を使う必要があります。

たとえば、あるグループのメンバー全員の名前を表示したいときは、次のように書けます。

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

表示結果：

![for1](../../Resource/017_for1.png)

次に、それぞれの `Text` に同じ修飾子を追加します。

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

これで、すべての `Text` が小さく太いフォントで表示されるようになります。

表示結果：

![](../../Resource/017_for2.png)

修飾子を追加すると見た目はよくなりますが、そのぶんコードは長くなり、重複も増えます。

名前がさらに増えたり、あとでフォントや色などのスタイルをまとめて変更したくなったりすると、同じようなコードを何度も書き直す必要があり、面倒で保守もしにくくなります。

そこで、まず名前を配列に入れてから、SwiftUI の `ForEach` を使って、配列のデータに応じて view を繰り返し生成できます。

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

このコードのほうが簡潔です。`ForEach` は配列の各要素を 1 つずつ読み取り、それに対応する内容を画面に表示します。

あとで名前を追加するときも、`names` 配列の中身を変えるだけでよく、毎回 `Text` や複雑な修飾子を追加する必要はありません。

## ForEach

`ForEach` は、SwiftUI の中で view を繰り返し生成するための仕組みです。SwiftUI における `for` ループのようなものだと考えることができます。

基本的な使い方は次のとおりです。

```swift
ForEach(配列, id: \.self) { 要素 in
    SwiftUI のコード
}
```

たとえば、先ほどのグループ名の例です。

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

このコードの意味は次のとおりです。

`names` は繰り返し対象となる配列、つまり表示するデータです。

`id:\.self` は、配列の要素そのものを使って、それぞれの項目を区別するという意味です。

この例では、配列の中には文字列が入っています。

```swift
["Sam", "John", "Wathon", "Bob"]
```

そのため、SwiftUI は `"Sam"`、`"John"`、`"Wathon"`、`"Bob"` という文字列そのものを使って、異なる内容を区別します。

初学者の段階でよく使う `String` や `Int` のような単純な配列では、通常まず次の書き方を使えば大丈夫です。

```swift
id: \.self
```

今の段階では、この 1 つの書き方だけを覚えておけば十分です。`id` のほかのルールについては、まだ深く理解しなくてもかまいません。

`item in` の `item` は、そのとき取り出された要素を表しています。

たとえば、最初の繰り返しでは `item` は `"Sam"`、2 回目の繰り返しでは `"John"` です。

そのため、

```swift
Text(item)
```

は順番に次のようになります。

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

つまり、このコードの役割は、`names` 配列から名前を 1 つずつ取り出して、それぞれの名前に対して `Text` view を作ることです。

### 実行の流れ

実行の流れは次のように考えられます。

* `ForEach` はまず `names` 配列の最初の要素 `"Sam"` を読む
* `item` が一時的に `"Sam"` を表す
* `Text(item)` が `"Sam"` を表示する
* 次に次の要素 `"John"` を読む
* そして同じ view のコードをもう一度実行する

最後には、配列にあるすべての名前が表示されます。

この書き方の利点は、名前が増えたときにたくさんの `Text` を何度も書かなくてよいことです。配列の内容を変えるだけで済みます。

### 写真を繰り返す

`ForEach` は文字だけでなく、画像や色、その他の SwiftUI view を表示することもできます。

たとえば、4 枚の画像を用意します。

```text
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

この 4 枚の画像を Xcode の Assets フォルダへドラッグします。

![image](../../Resource/017_for3.png)

`ForEach` を使わない場合は、すべての画像を手で書く必要があります。

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

表示結果：

![image](../../Resource/017_for4.png)

この方法でも実現はできますが、コードはかなり長くなります。

画像が増えるほど、`Image` のコードも何度も繰り返して書かなければなりません。

あとで画像サイズをまとめて変えたい場合も、1 枚ずつ修正する必要があります。

そこで、画像名を配列に入れてから、`ForEach` を使って画像 view を繰り返し生成できます。

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

ここでの `images` は文字列配列で、配列の各要素が画像名になっています。

`ForEach(images, id: \.self)` は、`images` 配列の各要素を順番に読み取り、その要素自体を使って項目を区別し、現在の要素に応じた view を作る、という意味です。

たとえば、最初に読み取られる要素が `"430F9BEF"` なら、

```swift
Image(item)
```

は次の意味になります。

```swift
Image("430F9BEF")
```

その後の画像も同じように順番に表示されます。

![image](../../Resource/017_for4.png)

ここでも引き続き、

```swift
id: \.self
```

を使っています。

理由は前と同じで、`images` 配列の要素も単純な文字列型だからです。初学者の段階では、要素そのものを区別のために使えば十分です。

これは、次のような固定のルールとして簡単に覚えておけます。

**`ForEach` が `String` や `Int` のような単純な配列を繰り返すときは、通常 `id: \.self` と書きます。**

### 画像を追加する

あとで画像を追加したい場合は、配列の内容を変えるだけで済みます。

```text
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

新しい `Image` のコードを何度も書き足す必要はありません。

画像が多い場合は、`ScrollView` と組み合わせて使うこともできます。そうしないと、内容が画面の外にはみ出したときに、全部を見ることができません。

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### 画像を変更する

画像のスタイルをまとめて変更したい場合も、`ForEach` の中のコードを直すだけで済みます。

たとえば、幅を `80` に変更します。

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

このようにすると、すべての画像が一度に変更され、1 枚ずつ直す必要がありません。

これが `ForEach` の重要な役割の 1 つです。

**複数の view が同じ構造を持ち、内容だけが異なるときは、view のコードを 1 回だけ書いて、何を表示するかは配列のデータに決めさせることができます。**

## まとめ

このレッスンでは、`for` ループと `ForEach` を学びました。

`for` ループは、配列や範囲の要素を順番に処理するために使われ、よりデータ処理に向いています。

`ForEach` は、SwiftUI で配列の内容に応じて view を繰り返し生成するために使われ、より画面表示に向いています。

今の初学者の段階では、`ForEach` のもっともよく使う形は次のとおりです。

```swift
ForEach(配列, id: \.self) { 要素 in
    SwiftUI のコード
}
```

ここで `id: \.self` は、要素そのものを使って各要素を区別する、という意味です。

配列の中身が `String` や `Int` のような単純な型であれば、通常はまずこの書き方を使えば大丈夫です。

今後、Web ページや App を見ていて、同じような文字列、画像、その他のリスト内容が繰り返し表示されているのを見たら、SwiftUI ではそうした内容は通常まず配列に入れられ、そのあと `ForEach` で 1 つずつ表示されているのだと考えることができます。
