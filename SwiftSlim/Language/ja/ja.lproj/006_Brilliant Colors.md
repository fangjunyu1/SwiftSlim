# 鮮やかな色

このレッスンでは、SwiftUI でよく使われる視覚修飾子を学びます。内容は次の通りです：

- 色
- 前景色
- 背景色
- オフセット
- 透明度
- ぼかし

さらに Safe Area（安全領域）も学びます。

これらの修飾子は、ビューの見た目を制御し、画面をより分かりやすく、階層的に見せるために使われます。

## 色

SwiftUI では、文字の色を設定できます。

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` は青色を表し、実際には `Color.blue` の簡略表記です（型推論）。

よく使う色には次のようなものがあります：

```
.black
.green
.yellow
.pink
.gray
...
```

これらはすべて `Color` の静的プロパティです。

![Color](../../RESOURCE/006_color.png)

`Color` は色を表す型だと考えることができ、`.blue` や `.red` はその具体的な色です。

### Color ビュー

SwiftUI では、`Color` 自体もビューとして表示できます。

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

このコードは、100×100 の赤い四角を生成します。

また、画面全体をある色で表示することもできます：

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

実行すると、赤色は画面全体には広がらず、iPhone の上部と下部は白いままであることが分かります。ここには Safe Area（安全領域）の存在が関係しています。

## Safe Area（安全領域）

Safe Area は、コンテンツが隠れないようにシステムが確保している領域で、次のものを含みます：

1. 上部のステータスバー（時刻、電池）

2. 下部の Home インジケータ

3. ノッチ（notch）または Dynamic Island の領域

![Color](../../RESOURCE/006_color3.png)

SwiftUI はデフォルトでコンテンツを安全領域内に制限するため、ビューは画面の端まで広がりません。

### Safe Area（安全領域）を無視する

色を画面全体に広げたい場合は、`ignoresSafeArea` を使います：

```swift
Color.red
    .ignoresSafeArea()
```

または `edgesIgnoringSafeArea` を使う方法もあります：

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

こうすると、ビューが画面全体に広がります。

注意すべき点として、`edgesIgnoringSafeArea` はやや古い書き方であり、iOS 14 以降では `ignoresSafeArea` の使用が推奨されています。

## 前景色

### foregroundStyle 修飾子

以前のレッスンで、`foregroundStyle` を使った色の設定を学びました。

たとえば：

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` は新しいスタイルシステムで、色、グラデーション、マテリアルなどに対応しています。

![Color](../../RESOURCE/006_color2.png)

### foregroundColor 修飾子

`foregroundColor` でも色を設定できます：

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

使い方は `foregroundStyle` と同じです。

最新の Xcode では、`foregroundColor` は将来の iOS バージョンで廃止される可能性があると表示されることがあり、`foregroundStyle` を優先して使うことが推奨されています。

## 背景

ビューに背景色を追加したい場合は、`background` を使います：

```swift
background(.red)
```

たとえば、文字に背景色を付ける場合：

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word や Chrome などの App で文字を選択すると、似たような背景色の効果が見られます。

![Color](../../RESOURCE/006_color16.png)

背景を広げたい場合は、`padding` と組み合わせる必要があります：

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ここで一つ重要なルールに注意しましょう：

SwiftUI の修飾子は、上から下へビューを構築していきます。後ろに書かれた修飾子は、その前の結果に作用します。

つまり：

```swift
.padding()
.background()
```

これは、背景が内側余白を追加した後のビュー全体を包むことを意味します。

もし順番を逆にすると：

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

背景は広がりません。なぜなら、背景が後ろの `padding` を包んでいないからです。

## 例 - 四角ナット

ここで、シンプルな四角ナットのようなビューを作ってみましょう。

![Color](../../RESOURCE/006_color8.png)

まず、50 × 50 の白い四角を作ります：

```swift
Color.white
    .frame(width: 50, height: 50)
```

円形にしたい場合は、`cornerRadius` を使います：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

角丸半径が幅と高さの半分になると、円形になります。

次に、青い背景を追加します：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

追加された `padding` によって外側の領域が広がり、`background` はその外側領域に青色を描画します。

これで四角ナットのような効果が完成します。

### 別の考え方

背景色を使って四角ナットを作る以外に、`ZStack` を使って実現することもできます。

前に学んだように、`ZStack` は重ね並びを実現できます。四角ナットも、円形と長方形が重なって表示されているものと考えられます。

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` はビューを順番に重ね、後から追加したビューが上に表示されます。

## 例 - 2 つの重なった円

多くのアイコンは、単純な図形を重ねることで構成されています。たとえば、2 つの重なった円です。

![Color](../../RESOURCE/006_color14.png)

まず、2 つの円を作ります：

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

2 つの円を重ねて表示する必要があるため、`ZStack` レイアウトを使います：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

この時点では、同じ大きさの 2 つの円が完全に重なっています。

私たちは、完全に重ねるのではなく、部分的に重なるようにしたいので、`offset` を使ってずらし効果を作ります。

## オフセット

`offset` は、ビューの描画位置だけを変え、親ビューのレイアウト計算には影響しません。

使い方：

```swift
.offset(x:y:)
```

`x` は水平方向のオフセット量、`y` は垂直方向のオフセット量です。

正の値は右 / 下への移動、負の値は左 / 上への移動を意味します。

`offset` を使って 2 つの円を部分的に重ねる場合：

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

赤い円のレイアウト上の位置自体は変わっていませんが、描画位置が左へ 25 ポイント移動しています。そのため 2 つの円は部分的に重なった視覚効果になります。

## 透明度

SwiftUI では、`opacity` を使ってビューの透明度を設定します。

基本的な使い方：

```swift
.opacity(0.5)
```

`opacity` の値の範囲は 0.0 から 1.0 で、その意味は次の通りです：

- 0 は完全に透明
- 1 は不透明

`opacity` を使ってオレンジ色の円の透明度を設定できます：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

オレンジ色の円の `opacity` を 0.8 にすると、不透明度は 80% になります。2 つの円が重なったとき、重なり部分に色の混ざり効果が生まれます。

## ぼかし

SwiftUI では、`blur` を使ってぼかし効果を設定できます：

```swift
.blur(radius:10)
```

`radius` はぼかし半径を定義し、値が大きいほどぼかし効果は強くなります。

2 つの円にぼかし効果を追加してみましょう：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

最終的に、非常にぼやけた 2 つの円が見えるようになります。

## まとめ

このレッスンでは、SwiftUI でよく使われる視覚修飾子を中心に、修飾子を通してビューの色、位置、視覚効果を制御する方法を学びました。

具体的な例を通して、それぞれの視覚修飾子が UI の中でどのような役割を果たすかを確認し、安全領域に関する知識も理解できました。

これらはすべて非常に基礎的な修飾子ですが、たくさん練習して使うことで、実際の開発において UI の見え方をより明確にコントロールできるようになります。

### レッスン後の練習

- 1 枚の画像に透明効果とぼかし効果を追加する
- 透明度の異なる 3 つの円を重ねてみる
- 画面いっぱいに広がる背景画像を作り、安全領域を無視する
- `offset` を使って複数のビューの位置を調整する

練習の目的は API を暗記することではなく、視覚変化とレイアウト挙動の関係を観察することです。
