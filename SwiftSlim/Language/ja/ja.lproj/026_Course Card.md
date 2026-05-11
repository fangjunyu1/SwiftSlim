# コースカード

このレッスンは段階的な復習レッスンです。「コースカード」を完成させます。

この練習を通して、これまで学んだ `Text`、`Image`、`VStack`、`HStack`、`Spacer()`、`.padding()`、`.background()`、`.cornerRadius()` などの内容を復習し、複数の小さなビューを 1 つの完全なビューモジュールに組み合わせる方法を学びます。

コースカードの表示効果：

![view](../../../Resource/026_view.png)

このコースカードには、主にいくつかの部分が含まれています：

- コースレベル：`初級`
- コース内容：`20+ レッスン`
- コースタイトル：`SwiftUI 初心者向けチュートリアル`
- コース説明
- ボタン：`学習を始める`
- コース背景：Swift アイコンとインディゴ色の背景

このビューは `ContentView` の中で完成できます。

## 上部エリア

まず、コースカードの上部エリアを作成します。

![view](../../../Resource/026_view1.png)

上部エリアの左側にはコースレベルを表示し、右側にはコース内容を表示します。

この 2 つの内容は横方向に並ぶため、`HStack` を使用できます。

```swift
var topView: some View {
    HStack {
        Text("初級")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ レッスン")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

ここでは、上部エリアを 1 つの計算プロパティに分けています：

```swift
var topView: some View
```

こうすることで、`body` をより見やすくできます。

上部エリアでは、主に次の内容を使用しています：

- `HStack`：2 つのテキストを横方向に並べます。
- `Text`：文字内容を表示します。
- `Spacer()`：左側のテキストを左へ、右側のテキストを右へ押し出します。
- `.font(.footnote)`：小さめの文字スタイルを設定します。
- `.fontWeight(.bold)`：文字を太字にします。
- `.foregroundStyle(Color.white)`：前景色を白に設定します。
- `.padding(.vertical, 10)`：上下の内側余白を設定します。
- `.padding(.horizontal, 16)`：左右の内側余白を設定します。
- `.background(Color.white.opacity(0.15))`：半透明の白い背景を設定します。
- `.cornerRadius(20)`：角丸を設定します。

ここでの `初級` には、2 方向の `.padding()` を使用しています：

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

これにより、文字の上下左右に余白ができ、よりラベルらしく見えます。

`Color.white.opacity(0.15)` は、不透明度が `15%` の白を表します。つまり、とても薄い白です。

### カード背景を追加する

前の手順で `topView` を作成しましたが、ビューを作成しただけでは自動的に表示されません。

SwiftUI では、画面に実際に表示したい内容を `body` の中に書く必要があります。

そのため、まず `topView` を `body` に入れて表示できます：

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

この時点で、上部エリアがすでに表示されていることが確認できます：

![view](../../../Resource/026_view2.png)

ただし、`topView` の中の文字は白で、デフォルトの背景も明るいため、ライトモードでは少し見づらい場合があります。

そのため、外側に `VStack` を追加し、全体に内側余白、背景色、角丸を設定できます：

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

表示効果：

![view](../../../Resource/026_view3.png)

ここでの `VStack` には、現在 `topView` だけが入っています。一見すると必須ではないように見えます。

しかし、このあとコースタイトル、コース説明、ボタンエリアを続けて追加します。これらはすべて上下に並ぶ内容なので、ここで先に `VStack` を使っておくと、後続のビューを組み合わせやすくなります。

ここには 2 つの `.padding()` があり、それぞれ役割が異なります。

1 つ目の `.padding(20)` は `.background()` の前に書かれています：

```swift
.padding(20)
.background(Color.indigo)
```

これはカード内部の余白、つまり内容と背景の端との距離を制御します。

2 つ目の `.padding(30)` は `.background()` の後に書かれています：

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

これはカード外部の余白、つまりカード全体と画面端との距離を制御します。

![view](../../../Resource/026_view4.png)

つまり、同じ `.padding()` でも、書く位置が違うと効果も変わります。

## コンテンツエリア

次に、コースカードのコンテンツエリアを作成します。

表示効果：

![view](../../../Resource/026_view5.png)

コンテンツエリアには、コースタイトルとコース説明が含まれています。これらは上下に並ぶため、`VStack` を使用します。

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI 初心者向けチュートリアル")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("ゼロから SwiftUI を始め、Apple の宣言的 UI 開発を体系的に学びます。わかりやすい解説と実践的な例を通して、レイアウト、インタラクション、状態管理を少しずつ身につけ、美しく実用的なアプリ画面を作れるようになります。")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

表示効果：

![view](../../../Resource/026_view6.png)

ここでの `VStack` には 2 つの引数を使用しています：

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` は、`VStack` 内部のビューを左揃えにすることを表します。

`spacing: 10` は、`VStack` 内部のビュー同士の間隔を `10 pt` に保つことを表します。

そのため、コースタイトルとコース説明は左側から並び、それらの間には一定の距離が残ります。

コース説明は比較的長く、すべて表示するとカードが高くなりすぎるため、ここでは `.lineLimit()` を使って表示行数を制限しています：

```swift
.lineLimit(3)
```

これは最大で `3` 行まで表示することを表します。内容が行数制限を超えると、超えた部分は省略されます。

### ビューを左揃えにする

ここで、もう 1 つ注意したい点があります。

`VStack(alignment: .leading)` は、`VStack` 内部のビューの揃え方だけを制御します。外部コンテナ内での `VStack` 自身の位置を直接制御するわけではありません。

例えば、コース説明が短い場合：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI 初心者向けチュートリアル")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("短い内容です。")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

表示効果：

![view](../../../Resource/026_view7.png)

確認すると、コースタイトルとコース説明は `VStack` 内部では左揃えですが、`VStack` 全体はカードの最左側には寄っていません。

これは、内容が短い場合、`VStack` の幅も狭くなるためです。外側のコンテナがレイアウトするとき、この幅の狭い `VStack` を中央に配置することがあります。

次のように理解できます：`VStack(alignment: .leading)` は内部の左揃えを担当します。
しかし、コンテンツエリア全体を最左側へ押し出す役割はありません。

コンテンツエリア全体を本当に左側へ寄せたい場合は、外側にもう 1 層 `HStack` を包み、`Spacer()` を追加できます：

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI 初心者向けチュートリアル")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("短い内容です。")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

表示効果：

![view](../../../Resource/026_view8.png)

ここでの `HStack` は水平レイアウトです。

`Spacer()` は右側の残りスペースを占有し、左側の `VStack` を最左側へ押し出します。

そのため、`HStack + Spacer()` はコンテンツエリア全体の位置を制御するために使えます。

実際のコースカードでは、コース説明が比較的長く、通常は多くの幅を占めるため、この問題はあまり目立たないかもしれません。ただし、この違いを理解しておくことは重要です。後で短いテキストのレイアウトを作るときに、似た状況によく出会うためです。

### 内部ビュー同士の距離を制御する

前のコードでは、`VStack` に `spacing: 10` を書きました：

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` は内部ビュー同士の距離を制御するために使います。

`spacing` を設定しない場合でも、`VStack` にはデフォルトの間隔があります。ただし、デフォルトの間隔が必ずしも望む効果に合うとは限りません。

ここでは、コースタイトルとコース説明が近すぎると窮屈に見えるため、次のように指定しています：

```swift
spacing: 10
```

これにより、それらの間に少し余白を残せます。

表示効果：

![view](../../../Resource/026_view9.png)

同様に、上部エリアとコンテンツエリアも上下に並ぶため、`spacing` を使ってそれらの距離を制御できます。

では、`topView` と `contentView` を `body` に入れます：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

表示効果：

![view](../../../Resource/026_view10.png)

ここでの `VStack(spacing: 20)` は、`topView` と `contentView` の間の距離を制御します。

つまり：

```swift
VStack(alignment: .leading, spacing: 10)
```

これはコースタイトルとコース説明の間の距離を制御します。

```swift
VStack(spacing: 20)
```

これは上部エリアとコンテンツエリアの間の距離を制御します。

どちらも `spacing` ですが、作用する `VStack` が異なるため、影響する範囲も異なります。

これで、コンテンツエリアのビューは完成です。

## ボタンエリア

次に、下部のボタンエリアを作成します。

表示効果：

![view](../../../Resource/026_view11.png)

ボタンエリアは、主に再生アイコンと 1 行の文字で構成されています。

`Image` を使って再生アイコンを表示し、`Text` を使ってボタン文字を表示できます。

ここでは、まずボタンの見た目を作成します：

```swift
var buttonView: some View {
    HStack {
        Button {
            print("ボタンをクリック")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("学習を始める")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

表示効果：

![view](../../../Resource/026_view12.png)

ここでは 2 つの `HStack` を使用しています：

内側の `HStack` は、アイコンと文字を横方向に並べるために使います：

```swift
HStack {
    Image(systemName: "play.fill")
    Text("学習を始める")
}
```

外側の `HStack` は `Spacer()` と組み合わせ、このボタンの見た目を左寄せで表示するために使います：

```swift
HStack {
    ...
    Spacer()
}
```

ボタンをクリックすると、コンソールには `ボタンをクリック` と出力されます。

## 基本カードの完成

これで、上部エリア、コンテンツエリア、ボタンエリアを組み合わせます：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

表示効果：

![view](../../../Resource/026_view13.png)

ここまでで、基本的なコースカードは完成です。

## Swift アイコン背景

最後に、カードに半透明の Swift アイコン背景を追加します。

![view](../../../Resource/026_view.png)

前の手順では、背景色として `Color.indigo` を使用しました。実は、`.background()` には色だけでなく、完全なビューを追加することもできます。

そのため、まず専用の背景ビューを作成できます：

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

この背景ビューでは、`VStack`、`HStack`、`Spacer()` を使って、Swift アイコンを右下へ押し出しています。

Swift アイコンは装飾用の背景として使うだけなので、ここでは半透明の白を使用しています：

```swift
Color.white.opacity(0.15)
```

こうすると、アイコンが目立ちすぎず、前面の文字内容にも影響しません。

次に、`backgroundView` をカードに追加します：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

実装効果：

![view](../../../Resource/026_view14.png)

ここでは 2 つの `.background()` を連続して使用しています：

```swift
.background(backgroundView)
.background(Color.indigo)
```

1 つ目の `.background()` は、Swift アイコン背景を追加するために使います。
2 つ目の `.background()` は、インディゴ色の背景を追加するために使います。

このようにすると、Swift アイコンはインディゴ色の背景の上に表示され、カード背景の一部として見えます。

ここから、`.background()` には色だけでなく、カスタムビューも追加できることがわかります。複数の `.background()` を組み合わせることで、より豊かな背景効果を作ることもできます。

これで、完全なコースカードが完成しました。

## まとめ

このレッスンでは、コースカードを通して、SwiftUI でよく使う基本的なレイアウト方法を復習しました。

`Text` で文字を表示し、`Image` でシステムアイコンを表示し、`VStack`、`HStack`、`Spacer()` でビューの配置を制御しました。

`.lineLimit()` についても学びました。これはテキストを最大何行まで表示するかを制限できます。内容が制限を超えた場合、超えた部分は省略されます。

同時に、`.padding()`、`.background()`、`.cornerRadius()`、`.foregroundStyle()` などのよく使う修飾子も復習しました。

このレッスンを終えると、複数の小さなビューを 1 つの完全なカードモジュールに組み合わせられるようになります。

これは SwiftUI 開発で非常によく使われる考え方でもあります。まず小さなビューに分け、それから完全な画面へ組み合わせます。

## 完全なコード

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("初級")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ レッスン")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI 初心者向けチュートリアル")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("ゼロから SwiftUI を始め、Apple の宣言的 UI 開発を体系的に学びます。わかりやすい解説と実践的な例を通して、レイアウト、インタラクション、状態管理を少しずつ身につけ、美しく実用的なアプリ画面を作れるようになります。")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("ボタンをクリック")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("学習を始める")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
