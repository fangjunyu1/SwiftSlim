# 外観への対応

このレッスンでは、ライトモードとダークモードの外観対応を学びます。

iPhone、iPad、Mac では、ユーザーはライトモードを選ぶことも、ダークモードを選ぶこともできます。

システムがダークモードに切り替わると、多くの App の背景、文字、アイコンの色もそれに合わせて変わります。

たとえば、昼間の画面は明るい背景で、夜の画面は暗い背景になることがあります。

![view](../../../Resource/025_view9.png)

このように、システムの外観に応じて画面表示を自動的に調整する機能を、外観への対応と呼びます。

## Xcode で外観対応をプレビューする

外観対応を学ぶ前に、まず Xcode でライトモードとダークモードをプレビューする方法を確認します。

`Canvas` 領域の下部にある `Device Settings` ボタンをクリックすると、`Canvas Device Settings` ポップアップを開けます。

![canvas](../../../Resource/025_view.png)

ポップアップでは、`Color Scheme` 設定を確認できます。

![canvas1](../../../Resource/025_view1.png)

内容は次のとおりです。

- `Light Appearance` はライトモードを表します。
- `Dark Appearance` はダークモードを表します。

ここでプレビューの外観を切り替え、現在の画面がライトモードとダークモードでどのように表示されるかを確認できます。

## 2 種類の外観を並べて表示する

ライトモードとダークモードを同時に確認したい場合は、`Variants` 機能を使用できます。

`Canvas` 領域の下部にある `Variants` ボタンをクリックし、`Color Scheme Variants` を選択します。

![canvas2](../../../Resource/025_view2.png)

選択すると、`Canvas` にライトモードとダークモードのプレビューが同時に表示されます。

![canvas3](../../../Resource/025_view3.png)

これにより、2 種類の外観での画面の違いをより簡単に比較できます。

簡単に言うと、次のようになります。

ライトモード/ダークモードを一時的に切り替えたいだけなら、`Canvas Device Settings` を使用できます。

2 種類の外観を同時に確認したいなら、`Color Scheme Variants` を使用できます。

## ビューは既定で外観に対応する

SwiftUI では、多くのシステムビューが既定でライトモードとダークモードに自動対応します。

例：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Light")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

表示結果：

![canvas](../../../Resource/025_view4.png)

ライトモードでは、アイコンとタイトルは通常、暗い色で表示されます。

ダークモードでは、アイコンとタイトルは自動的に明るい色に変わります。

これは、`Text` や `Image` などの SwiftUI ビューが、既定でシステムの外観に応じて色を調整するためです。

つまり、固定色を手動で指定しなければ、SwiftUI が外観対応の一部を処理してくれます。

## 固定色は自動的に入れ替わらない

注意が必要なのは、固定色を手動で指定した場合、その色はライト/ダークモードに応じて自動的に入れ替わらないことです。

例：

```swift
Text("some some some")
	.foregroundStyle(Color.gray)
```

ここでは文字色を `Color.gray` に指定しているため、常にグレーで表示されます。

さらに例を見ます。

```swift
Text("Title")
    .foregroundStyle(Color.white)
```

このコードは、ライトモードでもダークモードでも白い文字を表示します。

背景も明るい色の場合、白い文字は見えにくくなる可能性があります。

そのため、外観対応を行うときは、`Color.white` や `Color.black` のような固定色を安易に書き込むことはできるだけ避けます。

多くの場合は、次のようなシステムのセマンティックスタイルを優先して使えます。

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

内容は次のとおりです。

- `.primary` は通常、主要な内容に使います。
- `.secondary` は通常、補助的な内容に使います。

これらはライト/ダークモードに応じて表示を自動的に調整します。

## 外観に応じて異なる内容を表示する

場合によっては、色だけでなく、外観ごとに異なる内容を表示したいこともあります。

例：

- ライトモードでは通常の電球アイコンを表示する。
- ダークモードでは光っている電球アイコンを表示する。
- ライトモードではタイトルに `Light` を表示する。
- ダークモードではタイトルに `Dark` を表示する。

この場合、現在のシステムがライトモードなのかダークモードなのかを判断する必要があります。

SwiftUI では、`colorScheme` 環境値を使って現在の外観モードを取得できます。

```swift
@Environment(\.colorScheme) private var colorScheme
```

完全なコード：

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Light" : "Dark"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("some some some")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

表示結果：

![view](../../../Resource/025_view5.png)

プレビュー結果から、同じビューでも外観モードによって表示内容が完全には同じでないことが分かります。

ライトモードでは、`Image` は通常の電球アイコンを表示し、タイトルは `Light` と表示されます。

ダークモードでは、`Image` は光っている電球アイコンを表示し、タイトルは `Dark` と表示されます。

つまり、ここで変わっているのは色だけではなく、アイコン名とタイトル文字そのものも変わっています。

これは、アイコンとタイトルを `body` に直接固定で書いていないためです。代わりに、`colorScheme` に応じて異なる内容を計算しています。

このコードでは、2 つの計算プロパティを使っています。

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

`colorScheme` が `.light` の場合、現在はライトモードであることを表します。

`colorScheme` が `.dark` の場合、現在はダークモードであることを表します。

そのため、異なる外観モードに応じて、異なるアイコン名とタイトル文字を返すことができます。

これも計算プロパティのよくある使い方です。現在の状態に応じて、ビューに表示する内容を計算します。

## @Environment を理解する

ここで初めて `@Environment` に触れます。

`@Environment` は、SwiftUI の環境から値を読み取るもの、と理解できます。

App の実行時、システムは多くの環境情報を提供します。たとえば次のようなものです。

- 現在の言語
- 現在の外観モード
- 現在のレイアウト方向
- 現在のフォントサイズ設定

現在の外観モードを取得したい場合は、`colorScheme` を読み取ります。

```swift
@Environment(\.colorScheme) private var colorScheme
```

このうち、

```swift
\.colorScheme
```

は、環境から `colorScheme` という値を読み取ることを表します。

```swift
private var colorScheme
```

は、読み取った値を `colorScheme` という変数に保存することを表します。

変数名は自分で決められます。たとえば、次のようにも書けます。

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

前の `\.colorScheme` が変わらなければ、現在の外観モードを読み取るという意味のままです。

## colorScheme の 2 つのよくある値

`colorScheme` には、よく使う値が 2 つあります。

```swift
.light
.dark
```

これらの意味は次のとおりです。

- `.light`：ライトモード
- `.dark`：ダークモード

例：

```swift
private var titleName: String {
    colorScheme == .light ? "Light" : "Dark"
}
```

このコードの意味は次のとおりです。

現在がライトモードで、`colorScheme == .light` が成立する場合は、`"Light"` を返します。

それ以外の場合は、`"Dark"` を返します。

そのため、ライトモードでは、

```swift
Text(titleName)
```

次のように表示されます。

```swift
Light
```

ダークモードでは、次のように表示されます。

```swift
Dark
```

この方法を使うと、外観に応じて異なる内容を表示できます。

## 色の対応例

文字やアイコン以外にも、色の対応を自分で処理したい場合があります。

例：

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

表示結果：

![view](../../../Resource/025_view6.png)

このコードでは、文字は白、背景は黒です。

ライトモードでは、黒い背景は比較的はっきり見えます。

しかしダークモードでは、画面全体の背景も黒に近い場合、この黒い背景がシステム背景に溶け込み、分かりにくく見えることがあります。

このとき、外観モードに応じて文字色と背景色を切り替えられます。

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

表示結果：

![view](../../../Resource/025_view7.png)

これで、ライトモードでは黒い背景と白い文字になります。

ダークモードでは白い背景と黒い文字になります。

このようにすれば、どの外観でも文字と背景のコントラストがはっきりし、ユーザーが内容を明確に確認できます。

## Assets を使って色に対応する

`colorScheme` を使って手動で判断する以外に、`Assets` のリソースカラーを使ってライト/ダークモードに対応することもできます。

この方法は、App 全体で共通して使う色の管理により適しています。

Xcode プロジェクトで、`Assets` リソースフォルダを見つけます。

![assets](../../../Resource/025_color.png)

`Assets` フォルダを開き、空白部分を右クリックして `New Color Set` を選択し、新しいカラーリソースを作成します。

![assets](../../../Resource/025_color1.png)

ここでは 1 つの色を作成し、`redText` という名前を付けます。

![assets](../../../Resource/025_color2.png)

カラーリソースでは、ライトモードとダークモードの色をそれぞれ設定できます。

![assets](../../../Resource/025_color3.png)

対応する色の領域を選択したあと、右側の属性インスペクタで色を変更できます。

右上の `Hide or show the Inspectors` ボタンをクリックして、インスペクタ領域を開きます。

次に `Show the Attributes inspector` を選択し、下部にある `Show Color Panel` を見つけて、カラーパネルを開きます。

![assets](../../../Resource/025_color4.png)

カラーパネル内の色をクリックすると、`redText` に対応する色の領域も同期して変化します。

ここでは `redText` を次のように設定します。

- ライトモードでは赤を表示
- ダークモードでは緑を表示

![assets](../../../Resource/025_color5.png)

SwiftUI のコードに戻ると、この色は次のように使用できます。

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

このうち、

```swift
Color("redText")
```

は、`Assets` から `redText` という名前のカラーリソースを読み取ることを表します。

表示結果：

![assets](../../../Resource/025_view8.png)

同じ `Color("redText")` でも、ライトモードとダークモードでは異なる色で表示されることが分かります。

これは、`Assets` の色自体も外観対応をサポートしていることを示しています。

## colorScheme と Assets の違い

`colorScheme` と `Assets` はどちらも外観対応を実現できますが、適した場面が異なります。

ライト/ダークモードに応じて文字内容、画像名、または `SF Symbols` 名を切り替えるだけなら、`colorScheme` を使用できます。

例：

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

App でよく使う色、たとえばテーマカラー、カード背景色、文字色などには、`Assets` の色を使うことをよりおすすめします。

`Assets` の色は複数のビューで再利用でき、あとから変更するのもより簡単だからです。

例：

```swift
Color("redText")
```

このようにすれば、`Assets` で色を変更するだけで、この色を使っている場所がすべて一緒に変わります。

## まとめ

このレッスンでは、ライトモードとダークモードの外観対応を学びました。

まず、Xcode の `Canvas` で異なる外観をプレビューする方法を学び、`Color Scheme Variants` を使ってライトモードとダークモードを同時に確認する方法も学びました。

次に、SwiftUI の `Text` や `Image` などのビューは、既定でシステムの外観に応じて色を自動調整することを理解しました。

ただし、`Color.white` や `Color.black` のような固定色を手動で指定すると、それらの色は自動的には入れ替わりません。

続いて、`@Environment` と `colorScheme` を学びました。

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme` を使うと、現在がライトモードなのかダークモードなのかを判断し、異なる外観に応じて異なるアイコン、文字、色を表示できます。

最後に、`Assets` の色について学びました。

`Assets` の色は、ライトモードとダークモードでそれぞれ色を設定でき、App で共通して使うカラーリソースの管理に適しています。

外観対応により、App は昼でも夜でもより見やすくなり、文字が見えにくい、背景がはっきりしない、といった問題も避けられます。

実際の開発では、SwiftUI の既定の対応機能と `Assets` の色を優先して使うことをおすすめします。

異なる外観で文字、アイコン、画像を切り替える必要がある場合、または少量の特殊な表示効果を処理する場合に、`colorScheme` を使って判断します。

## 補足知識：フォントサイズを指定する

以前 `font` を学んだとき、いくつかのシステムフォントスタイルを使いました。

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

`.largeTitle` や `.callout` のようなシステムフォントスタイルを使う以外に、フォントサイズを手動で指定することもできます。

例：

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

ここでの、

```swift
.font(.system(size: 100))
```

は、フォントサイズを `100 pt` に設定することを表します。

`SF Symbols` アイコンの場合、`font` もアイコンサイズに影響します。

そのため、アイコンをより大きく表示したい場合は、`.font(.system(size:))` でサイズを指定できます。

例：

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

注意点として、フォントサイズを手動で指定するとより柔軟ですが、通常の文字では固定サイズを大量に使うことはおすすめしません。

通常の文字には、`.title`、`.headline`、`.body`、`.caption` などのシステムフォントスタイルを優先して使います。

そうすることで、さまざまなデバイスやユーザーのフォント設定によりよく対応できます。
