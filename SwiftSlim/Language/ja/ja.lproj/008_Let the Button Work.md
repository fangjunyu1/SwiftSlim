# ボタンを動かしてみよう

このレッスンでは、主に `Button` ボタン、`print` によるデバッグ出力、そして Swift の関数を学びます。

これらは SwiftUI のインタラクティブプログラミングの基礎です。

## ボタン

ボタンは、私たちが最もよく目にする UI コントロールです。ダウンロード、開く、終了するなどの操作が必要なとき、通常はボタンをクリックします。

たとえば App Store では、「入手」ボタンを押して App をダウンロードします。

![Button](../../RESOURCE/008_button.png)

SwiftUI では、ボタンは `Button` で表します。

基本的な使い方：

```swift
Button("") {
    
}
```

構造は 2 つの部分に分けられます：

```swift
Button("ボタンの文字") {
    ボタンを押したときに実行されるコード
}
```

たとえば：

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

実行すると Start ボタンが表示されます。

![Button](../../RESOURCE/008_button1.png)

ユーザーがボタンを押すと、`{}` 内のコードが実行されます。

注意すべき点は、`Button` は SwiftUI の UI コントロール（`View`）に属するため、必ず `body` の中に書かなければならないことです。

### buttonStyle 修飾子

SwiftUI では、`Button` にはシステム内蔵のボタンスタイルが用意されており、`buttonStyle` 修飾子で使用できます。

たとえば：

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` はシステム提供のボタンスタイルを適用します。

よく使われる選択肢：

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

スタイルごとの違いは主に、枠線の有無、背景の有無、そして視覚的な強調度に現れます。

## print 出力

プログラミングでは、プログラムがあるコード部分まで実行されたかどうかを確認したい場面がよくあります。

Swift は、デバッグ情報を出力するための `print` 関数を提供しています。

基本的な書き方：

```swift
print("Hello")
```

このコードはテキストを Console（コンソール）に出力します。

### ボタンが使えるか確認する

`print` をボタンの中に書けば、ボタンがクリックされたかどうかをテストできます。

```swift
Button("Start") {
    print("Test 123")
}
```

ボタンをクリックすると、Console には次のように出力されます：

```
Test 123
```

つまり、ボタンが正常に発火したことを意味します。

![Button](../../RESOURCE/008_button3.png)

注意：`print` は Swift のコードであり、UI コントロールではありません。そのため、`body` の中に直接置くことはできず、そうするとエラーになります。

たとえば、次のような書き方は誤りです：

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // エラー：body は View を返さなければならない
    }
}
```

SwiftUI では、`body` は UI 構造を記述する場所なので、`Text`、`Button`、`Image` などの UI コントロール（`View`）しか置けません。

通常のコード（計算ロジック、`print` など）は、ボタン、関数、その他のイベントハンドラの中に置く必要があります。

### Console コンソール

`print` の出力内容は、Xcode の Console（コンソール）に表示されます。

もし Console が見えない場合は、右下の `Show the Debug Area` ボタンをクリックしてデバッグ領域を開き、その後 `Show the Console` ボタンをクリックしてコンソールを表示できます。

![](../../RESOURCE/008_button4.png)

Console 左下には 2 つのタブがあります：`Executable` と `Previews`。

![](../../RESOURCE/008_button5.png)

この 2 つのタブは異なる実行環境に対応しています。Canvas でプレビューしているときは、`print` の出力は `Previews` タブに表示されます。シミュレータまたは実機でアプリを実行している場合は、出力は `Executable` タブに表示されます。

そのため、`print` が出力されないと感じたときは、まず正しいタブを選んでいるか確認しましょう。

## 例 - ASCII アート

コードプロジェクトの中では、ASCII アートをよく見かけることがあります。

文字アートとは、普通の文字を組み合わせて作る図柄のことです。たとえば：

![ASCII](../../RESOURCE/008_ascii.png)

ボタン + `print` を使って ASCII アートを出力できます。

サンプルコード：

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

ボタンを押すと、Console には次のように出力されます：

```
 /\_/\
( o.o )
 > ^ <
```

注意：文字列中の `\` は `\\` と書く必要があります。バックスラッシュは文字列内でエスケープ文字だからです。

## 関数

ボタンの中には直接コードを書くことができます。

たとえば：

```swift
Button("Start") {
    print("Hello")
}
```

コード量が少ない場合は、これで問題ありません。しかし実際の開発では、1 つのボタンが発火するロジックはかなり多くなることがあります。

たとえば：

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // さらに多くのコードがあるかもしれない
}
```

コードが増えていくと、ボタン内部に直接書く方法では UI コードが乱雑になり、読みやすさや保守性も下がります。

そのため、通常はこうしたコードを関数の中に整理し、ボタンの中からその関数を呼び出します。

### 関数とは

関数とは、繰り返し使えるコードのまとまりです。

あるコードを実行したいとき、その関数を呼び出すだけで、中に書かれたコードを実行できます。

これによりコード構造がより明確になり、再利用もしやすくなります。

### 基本的な書き方

Swift では、関数は **func** キーワードで定義します：

```swift
func randomInt() {
    // code
}
```

このコードは 1 つの関数を定義しています。

`randomInt` は関数名であり、このコードのまとまりを識別するための名前です。

`()` は引数の場所を表し、ここで外部からデータを受け取れます。データが不要なら空のままでかまいません。

`{}` の内部が関数のコード領域で、実行したいコードはすべてここに書きます。

たとえば：

```swift
func getName() {
    print("FangJunyu")
}
```

この関数の役割は、1 行のテキストを出力することです。

### 関数を呼び出す

関数を定義するだけでは、そのコードを作成しただけにすぎません。実際に実行するには、その関数を呼び出す必要があります。

呼び出し方は、関数名の後ろに `()` を付けます：

```swift
getName()
```

プログラムがこの行まで来ると、`getName` 関数内のコードが実行されます。

完全な例：

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

実行後、Console には次のように出力されます：

```
FangJunyu
```

### SwiftUI で関数を使う

SwiftUI ビューでは、関数は通常 `body` の外側に書きます。

たとえば：

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

ボタンをクリックすると、`getName()` 関数が呼び出されます。

こうすることで、UI コードは簡潔に保たれ、具体的なロジックは関数内で処理できます。

### 関数の引数

ときには、関数が異なるデータに応じて異なる処理を行う必要があります。

たとえば、関数に固定の `"FangJunyu"` だけを出力させるのではなく、異なる名前を出力できるようにしたい場合です。

このとき使うのが引数です。引数とは、関数を呼び出すときに渡すデータと考えることができます。

たとえば：

```swift
func getName(name: String) {
    print(name)
}
```

この関数には新しく 1 つの引数が追加されています。`name` は引数名、`String` は引数の型です。 

つまり、この関数は `String` 型のデータを受け取る必要があるということです。

今この関数はデータを必要とするため、呼び出すときには必ずそのデータを渡さなければなりません。

```swift
getName(name: "Sam")
```

呼び出し時に `"Sam"` を渡すと、関数内部ではその値を使って出力します。

実行結果：

```
Sam
```

## 例 - 関数を使って ASCII アートを出力する

先ほどの例では、`print` を直接ボタンの内部に書いていました。

しかし、文字アートが複雑になるとコードは長くなってしまいます。そんなときはロジックを関数にまとめることで、UI コードをより分かりやすくできます。

サンプルコード：

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

実行後にボタンを押すと、Console には次のように出力されます：

```
 /\_/\
( o.o )
 > ^ <
```

ここで起きていることは 2 つあります。ユーザーがボタンを押したあと：

1. ボタンが `printCat()` 関数を呼び出す
2. 関数内の `print` コードが実行される

これによって、UI コードはイベントの発火だけを担当し、具体的なロジックは関数側で処理できます。

実際の開発では、大部分のボタン操作は関数を通して実装されます。

## まとめ

このレッスンでは、3 つの重要な内容を学びました：

**1. Button ボタン**

`Button` は、SwiftUI で操作を発火するためのコントロールです。

```swift
Button("Start") {

}
```

ユーザーがボタンを押すと、中括弧内のコードが実行されます。

**2. print 出力**

`print` は、Console にデバッグ情報を出力するために使います。

```swift
print("Hello")
```

開発者は Console を通してプログラムの実行状態を確認できます。

**3. 関数**

関数は、繰り返し使えるコードのまとまりです。

```swift
func sayHello() {
    print("Hello")
}
```

関数の呼び出し：

```swift
sayHello()
```

関数にデータが必要な場合は、引数を使えます：

```swift
func sayHello(name: String) {
    print(name)
}
```

今後のレッスンでは、さらに多くの SwiftUI コントロールや、データと UI がどう連携するかを学んでいきます。

## 練習

次の練習を試してみてください：

1. ボタンの文字を "Hello" にしたボタンを作る
2. ボタンを押したときに、Console に `Hello Swift` を出力する
3. 出力コードを関数に書き、それをボタンの中から呼び出す
