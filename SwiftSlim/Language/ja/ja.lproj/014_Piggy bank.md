# 貯金箱

このレッスンでは、シンプルな「貯金箱」プロジェクトを作成します。機能は簡単ですが、完全なインタラクションロジックが含まれており、初心者の入門にとても適しています。

このプロジェクトを通して、TextField（入力欄）と border 境界線を学び、データバインディング（$）について理解します。

最終目標は、金額を入力し、ボタンをタップして保存し、合計金額を累積できる「貯金箱」プロジェクトを実現することです。

完成イメージ：

![Piggy Bank](../../RESOURCE/014_view.png)

## 合計金額を表示する

まず、ビューの中に「貯金箱」の合計金額を表示する必要があります。

ContentView の中で、「貯金箱」の合計金額を保存する変数を宣言します。

```swift
@State private var amount = 0
```

続いて、Text を使ってこの金額を表示します。

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

ここでは、`.font` と `.fontWeight` を使って文字の大きさと太さを設定しています。

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

amount が変化すると、Text に表示される合計金額も自動的に更新されます。

## 金額を入力する

「貯金箱」は合計金額を表示するだけでなく、ユーザーが入出金の金額を「入力」できる必要があります。そのために SwiftUI のビューコントロールである TextField を使います。

### TextField

TextField は SwiftUI で内容を入力するためのビューコントロールで、通常は 1 行入力に使われます。

TextField には主に 2 種類のバインディング形式があります。

**1. 文字列型（String）をバインドする**

```swift
TextField("Placeholder", text: $text)
```

名前やタイトルなど、テキストを入力する内容に適しています。

**2. 数値型（Int/Double）をバインドする**

```swift
TextField("Amount", value: $number, format: .number)
```

年齢、給与、金額などの数字入力に適しています。

`format: .number` は、この入力欄が「数値形式」で解析・表示されることを意味します。

#### プレースホルダー

TextField の最初の引数はプレースホルダー（Placeholder）で、ユーザーに入力内容を案内するために使われます。

```swift
TextField("input your name", text: $text)
```

入力欄が空のときは、灰色の案内テキストが表示されます。

![textfield](../../RESOURCE/014_textfield.png)

#### データバインディング

TextField 自体は入力内容を永続保存しません。データはバインドした変数を通して管理する必要があります。

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

ユーザーが入力した内容は直接 `text` 変数に保存され、TextField は入力インターフェースだけを担当します。

`$` はバインディング（Binding）を表します。

```swift
$text
```

これは普通の変数ではなく、Binding 型です。

その役割は、ビューとデータの間に接続を作ることです。

ユーザーが TextField に入力すると `text` が自動更新され、`text` が変化すると TextField も同期して更新されます。

例えば：

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

TextField に内容を入力すると、上の Text にリアルタイムで同期表示されます。

![textField](../../RESOURCE/014_textfield1.png)

### 数値型をバインドする

数字を入力する必要がある場合は、対応する型の変数をバインドする必要があります。

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

ユーザーが金額を入力すると、TextField は入力内容を数値として解析し、自動的に `number` の値を更新します。

## 入力欄を追加する

TextField の基本的な使い方を理解したので、これを「貯金箱」プロジェクトに適用します。

「貯金箱」では「金額」を入力する必要があるため、「数値型をバインドする」方式を使い、ユーザー入力の金額を保存する `number` 変数を追加します。

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
		}
    }
}
```

これで、TextField にはデフォルトで `number` の値（初期値は 0）が表示されます。

入力内容を空にすると、プレースホルダーの `Amount` が表示されます。

ここでも、TextField が表示しているのはバインドされた変数の値であり、自分自身で内容を保存しているわけではないことが分かります。

### 入力欄のサイズの問題

現在のビューでは、TextField には境界線がなく、ただ 0 が表示されているだけで、内容も左寄せに見えます。

表示は次のとおりです。

![textfield](../../RESOURCE/014_textfield2.png)

これは、TextField がデフォルトで親ビューの幅いっぱいを使うためです。

背景色を追加して確認できます。

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

表示は次のようになります。

![textfield](../../RESOURCE/014_textfield3.png)

このように、TextField は実際には 1 行分の幅をすべて埋めています。

### 固定幅を設定する

入力欄をもう少しコンパクトにしたい場合は、`frame` を使って幅を制限できます。

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

表示は次のとおりです。

![textfield](../../RESOURCE/014_textfield4.png)

### 境界線と内側の余白を追加する

TextField にはデフォルトで境界線がないため、手動でスタイルを追加できます。

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

これで、この入力欄はより「標準的な入力欄」に見えるようになります。

![textfield](../../RESOURCE/014_textfield5.png)

## 境界線

SwiftUI では、`border` を使ってビューに境界線を追加します。

基本的な使い方：

```swift
border(Color.black, width: 1)
```

ここで、`Color.black` は境界線の色、`width` は境界線の太さを表します。

TextField では、次のように使っています。

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

これは、入力欄に黒色・太さ 1 pt の境界線を追加することを意味します。

`Color.blue` や `Color.green` に変えてみたり、`width: 2` で線を太くすることもできます。

## 貯金ボタン

これで、合計金額を表示する `amount` 変数、金額を入力する TextField、そして入力欄にバインドされた `number` 変数がそろいました。

現在のコードは次のとおりです。

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
		}
    }
}
```

### ボタンを追加する

次に、貯金処理を実行するためのボタンを追加する必要があります。

```swift
Button("Save") {
    
}
```

### 貯金ロジックを実装する

ユーザーが金額を入力してボタンをタップすると、その金額が合計金額に自動的に加算されるようにしたいです。


```swift
Button("Save") {
    amount += number
}
```

ここでは「複合代入演算子」を使って、ユーザーが入力した金額 `number` を合計金額 `amount` に加算しています。

### 入力金額をリセットする

ここでひとつ問題があります。ボタンをタップしても、入力欄の金額が空になりません。

ユーザーが 10 を入力して保存しても、入力欄には依然として 10 が残り、次回の入力に影響してしまいます。

これは、TextField が `number` にバインドされている一方で、ボタンをタップしたときに `amount` だけを変更し、`number` は変更していないためです。そのため入力欄には古い値が残ります。

そこで、ボタンをタップしたあとに金額を加算し、その後入力値をリセットするロジックを追加します。

```swift
Button("Save") {
    amount += number
	number = 0
}
```

これで、ユーザーが金額を入力してボタンをタップすると、入力金額が合計金額に加算されます。そして `number` は 0 にリセットされ、次の入力に備えられます。

これで「貯金箱」の貯金ロジックはすべて実装できました。

## ビューを改善する

機能が完成したあと、背景画像やボタンスタイルを追加して画面を簡単に整えます。

ボタンスタイルを追加する：

```swift
.buttonStyle(.borderedProminent)
```

背景画像を追加する：

```swift
.background {
    Image("1")
}
```

これで「貯金箱」の開発は完成です。

## 完全なコード

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

完成イメージ：

![Piggy Bank](../../RESOURCE/014_view.png)

これで、100 やそれ以上の金額を入れて「貯金箱」のロジックに問題がないか試せます。

また、「貯金箱」をシミュレータや実機で実行して、実際の動作を体験することもできます。

### デバッグ出力

ロジックが正しいか確認するために、ボタンにデバッグ出力を追加して、入力金額が正しいか検証することもできます。

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

貯金してボタンをタップするたびに、対応するデバッグ出力が表示され、コードロジックに問題がないか確認できます。

```
---Saving---
amount:11
number:0
```
