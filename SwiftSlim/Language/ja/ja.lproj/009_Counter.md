# カウンター

前の 2 レッスンでは、変数、定数、ボタン、メソッドを学びました。

このレッスンでは、それらの知識を組み合わせて、シンプルなカウンターアプリを作ります。

この例を通して、変数を保存し変更する方法、そして `@State` を使って変数を管理する方法を学びます。

## カウンターを実装する

カウンターは、継続的に増えていく数量を記録するためによく使われます。たとえば、縄跳びの回数やランニングの周回数などです。

ここでは簡単なカウンターを実装します。数字とボタンを表示し、ボタンを押すと数字が増えるようにします。

![Num](../../RESOURCE/009_num.png)

### 数字を表示する

まず、`Text` を使って数字を表示します。

```swift
Text("0")
```

しかし、数字が変化する必要があるなら、`"0"` を固定で書くのではなく、変数を使って数字を保存すべきです。

```swift
var num = 0
```

その後、`Text` の中でその変数を表示します：

```swift
Text("\(num)")
```

ここでは文字列補間 `\()` を使って、数字を文字列に変換して表示しています。

### ボタンで数字を増やす

次に、ボタンを追加します。

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

ボタンが押されたとき、数字を増やしたいと考えます。

そのため、ボタンの中で変数を変更できます：

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

このコードの意味は、ボタンをクリックしたときに `num + 1` を計算し、その結果を `num` に代入するということです。

### より簡潔な書き方

Swift にはもっと簡潔な書き方があります：

```swift
num += 1
```

これは次と同じ意味です：

```swift
num = num + 1
```

この書き方は「複合代入演算子」と呼ばれます。

Swift でよく使われる複合代入演算子は次の通りです：

```
+=   加算代入
-=   減算代入
*=   乗算代入
/=   除算代入
%=   剰余代入
```

たとえば：

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### 完全コード

ここまでで、シンプルなカウンターは次のように書けます：

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

しかし、この時点ではコードは正常に動きません。

### エラーが出る

Xcode は次のように表示します：

```
Cannot assign to property: 'self' is immutable
```

これは、ビューが不変であるため、プロパティを変更できないという意味です。

なぜこうなるのでしょうか？

## SwiftUI の動作原理

SwiftUI では：**UI はデータによって駆動される** という考え方を採用しています。つまり、データが変化すると、画面も自動的に更新されます。

ただし注意すべきなのは、状態（たとえば `@State`、`@Binding`）が変化したときにだけ、SwiftUI はその変化を監視し、ビューを更新するということです。

普通の変数を使っている場合、SwiftUI はビュー作成時に一度だけその変数の値を読み取ります。その後で変数が変わっても、UI は更新されません。

たとえば：

```swift
var num = 0   // 0
num = 1   // 0
```

上の例では、`num` は普通の変数です。値が変化しても、SwiftUI はビューを更新しないため、画面には最初の 0 のまま表示されます。

![Num](../../RESOURCE/009_state.png)

そのため、データが状態としてマークされている場合（たとえば `@State`、`@Binding` などの property wrapper を使っている場合）にのみ、SwiftUI は自動的にその変化を監視してビューを更新します。

## @State プロパティラッパー

SwiftUI では、変数を変更しつつビューも更新したい場合、必ず `@State` を使う必要があります。

```swift
@State var num = 0
```

`@State` を付けると、SwiftUI はこの変数を監視するようになります。

変数が変化すると、SwiftUI はビューを再計算し、ビューを更新します。

完全コード：

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

これで、ボタンをクリックしたとき：

```swift
num += 1
```

SwiftUI は `num` の変化を検知し、自動的にビューを更新します。

![Num](../../RESOURCE/009_state1.png)

## @State の使用ルール

実際の開発では、`@State` は通常 2 つのルールに従います。

### 1. @State には通常 private を使う

`@State` 変数は通常、現在の型（たとえば現在の View 構造体）の中でのみ使われるため、一般的には次のように書きます：

```swift
@State private var num = 0
```

こうすることで、他のビューがこの変数に直接アクセスしたり変更したりするのを防げます。

まだ `private` は学んでいませんが、今は次のように簡単に理解すれば大丈夫です：

**`private` で修飾された内容は、現在のビューの中でしか使えず、外側のビューからは使えません。**

### 2. @State は現在のビュー自身の状態にだけ使う

`@State` は、現在の View 自身が管理するデータに適しています。

たとえば、入力欄の内容やスイッチの状態です。

```swift
@State private var isOn = false
@State private var text = ""
```

もしデータを複数のビュー間で共有する必要があるなら、`@Binding` や `@Observable` など別の状態型を使う必要があります。

これらの内容は後続のレッスンで学びます。

### 減らすボタン

カウンターは増やすだけでなく、減らすこともできます。

`-` ボタンを追加できます。

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

その後、`HStack` を使ってボタンを横並びにします：

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

効果：

![Num](../../RESOURCE/009_num1.png)

`+` ボタンを押すと数字が 1 増え、`-` ボタンを押すと数字が 1 減ります。

### リセットボタン

さらに、数字を 0 に戻すリセットボタンを追加することもできます。

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

リセットボタンを押すと、`num` に 0 が代入されます。

効果：

![Num](../../RESOURCE/009_num2.png)

`0` ボタンを押すと、数字は 0 に戻ります。

### カスタムボタン

今のところ、私たちのボタンはまだテキストしか表示できません：

```swift
Button("+") {

}
```

この書き方のボタンは、`+` や `-` のようなテキストしか表示できません。

実際の開発では、ボタンの見た目をもっと豊かにしたいことが多く、たとえばアイコンや他のビューを使いたい場合があります。

SwiftUI ではボタンの表示内容をカスタマイズできます。その場合はボタンのもう一つの書き方を使います：

```swift
Button(action: {

}, label: {

})
```

この書き方では、`action` がボタンクリック時に実行されるコード、`label` がボタンに表示されるビューを表します。

たとえば、ボタンに SF Symbols アイコンを表示できます：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

これで、ボタンはテキストではなくアイコンを表示するようになります。

### カウンター画面を最適化する

カウンター画面をより見やすくするために、数字の表示スタイルを調整することもできます。たとえば数字を大きくする：

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

次に、ボタンの表示内容もアイコンに変更し、アイコンサイズも適切に大きくします：

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

同様に、減少ボタンとリセットボタンもアイコン形式に変更できます：

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

これでボタンには SF Symbols アイコンが表示され、画面もより直感的になります。

![Num](../../RESOURCE/009_num3.png)

## まとめ

このレッスンでは、シンプルなカウンターを実装することで、変数、`Text`、`Button` の使い方を総合的に練習しました。変数を使って数字を保存し、ボタンによって数字を増減させると同時に、`num += 1` や `num -= 1` のような複合代入演算子も学びました。

実装の過程では、SwiftUI の動作方法も理解しました。UI はデータによって駆動されます。データが変化したときにだけ、UI が更新されます。そのため、変化可能な状態を保存するには `@State` を使う必要があり、`@State` 変数が変化すると SwiftUI は自動的にビューを更新します。

最後に、画面を少し最適化し、`Text` のフォントスタイルを調整し、`Button(action:label:)` を使ってボタン内容をカスタマイズしました。これにより、ボタンがアイコンを表示できるようになり、カウンター画面がより分かりやすく美しくなりました。

これで私たちは、SwiftUI ビューの基本的な使い方に触れました。SwiftUI では、多くの UI は変数によって駆動されます。変数が変化すると、SwiftUI は自動的にビューを更新します。そのため、SwiftUI アプリを開発するときは、通常まず保存したいデータを設計し、そのデータを使って UI とインタラクションロジックを構築していきます。

## 完全コード

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
