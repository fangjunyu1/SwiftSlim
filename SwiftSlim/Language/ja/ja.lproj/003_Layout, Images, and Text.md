# レイアウト、画像、文字

前回のレッスンでは、ContentView のコードを学びました：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

このレッスンでは、SwiftUI のデフォルトレイアウトの仕組みと、画像・文字の使い方を学びます。前回の内容を土台にして、ビューの構造や表示方法をさらに理解し、基本的な UI レイアウトを構築できるようにしていきます。

## SwiftUI のデフォルトレイアウトの仕組み

ContentView のプレビューを見ると、アイコンと文字は上から並ぶのではなく、中央に表示されていることが分かります。

![Swift](../../RESOURCE/003_view.png)

デフォルトでは、Stack コンテナの整列方法は `.center` なので、子ビューは通常中央寄せで表示されます。

### Alignment 整列方法

中央揃えが整列方法の一つにすぎないのは明らかです。左寄せや右寄せにしたい場合は、`alignment` を使ってビューの整列方法を制御する必要があります。

```swift
alignment
```

SwiftUI では、整列は通常 2 つの場面で使われます。

**1. Stack コンテナの整列パラメータ**

たとえば、ContentView のアイコンと文字を左揃えにする場合：

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` の `alignment` は、水平方向の整列を制御します。

整列方法：

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` は横並びなので、`alignment` は垂直方向の整列を制御します：

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` は重ね並びで、`alignment` によって水平方向または垂直方向の整列を制御できます：

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

`alignment` を明示的に指定しない場合、`VStack`、`HStack`、`ZStack` はすべて `.center` がデフォルトになります。

**2. frame の内部における alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame` がビュー自身より大きなサイズを提供する場合、`alignment` が frame 内部でのビューの位置を決定します。`frame` の具体的な使い方は後でさらに説明しますので、ここでは軽く理解しておけば大丈夫です。

### Spacer と空間配分の仕組み

`alignment` を使えば、ビューを横方向または縦方向に整列させて表示できます。しかし、文字と画像を両端に表示したい場合、単一の整列方法だけでは要件を満たせません。

たとえば、[NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) サイトの上部ビューのように、左側に NHK サイトのロゴ、右側にサイト内メニューアイコンを配置したい場合です。

![Swift](../../RESOURCE/003_alignment3.png)

もし `alignment` だけを使うと、NHK ロゴとメニューアイコンはどちらも片側にしか表示されません。左右両端に分けて配置することはできないため、残りスペースを配分する `Spacer` が必要になります。

`Spacer` はレイアウト用の柔軟なビューで、残りの空間を自動的に埋めてくれます。

使い方：

```swift
Spacer()
```

たとえば：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

`Image` と `Text` の間に `Spacer` を追加すると、`Spacer` が残りの空間を埋め、`Image` と `Text` をそれぞれ上下の端へ押し広げます。

![Swift](../../RESOURCE/003_view1.png)

複数の `Spacer` がある場合：

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

残りの空間は `Spacer` に均等に分配されます。

![Swift](../../RESOURCE/003_spacer.png)

## Image の表示とサイズ制御

`Image` ビューは主に画像を表示するために使われます。前回学んだ SF Symbols アイコンは、Image の使い方の一つにすぎません。

使い方：

```swift
Image("imageName")
```

`Image` のダブルクォーテーション内は画像名で、拡張子を書く必要はありません。

### 画像を表示する

まず、1 枚の画像を用意します。

![Swift](../../RESOURCE/003_img.jpg)

Xcode で Assets リソースフォルダを選び、画像を Assets にドラッグします。

![Swift](../../RESOURCE/003_img1.png)

ContentView で `Image` を使って画像を表示します：

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

注意：SwiftUI の `Image` は GIF アニメーションの再生には対応していません（静止フレームのみ表示できます）。

### 画像サイズを制御する

SwiftUI では、`Image` はデフォルトで元画像のサイズのまま表示されます。表示サイズを調整したい場合は、まず `resizable` を使って画像内容を拡大縮小可能にし、その後 `frame` でレイアウトサイズを指定します。

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable 修飾子

`resizable` 修飾子を付けると、画像は元のサイズに固定されず、レイアウトの中で拡大縮小に参加できるようになります。

```swift
.resizable()
```

`resizable()` を追加して初めて、`frame` で画像の表示サイズを本当に変えられるようになります。

もし `resizable` を省略すると：

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` は画像にレイアウト上の空間を与えるだけで、画像そのもののサイズは変わりません。

### frame 修飾子

`frame(width:height)` は、ビューの幅と高さを指定するために使います。

基本的な使い方：

```swift
.frame(width: 10,height: 10)
```

たとえば、画像を幅 300、高さ 100 の長方形に設定する場合：


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

幅または高さだけを単独で設定することもできます：

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` の組み合わせにより、UI 内での画像表示サイズを柔軟に制御しつつ、拡大縮小可能な特性も保てます。

### スケーリング比率：scaledToFit と scaledToFill

`frame` で設定した幅と高さの比率が元画像の比率と一致しない場合、画像が引き伸ばされて変形することがあります。

画像の比率を保ったまま利用可能なレイアウト空間に合わせたい場合は、`scaledToFit` または `scaledToFill` を使います。

**scaledToFit**

`scaledToFit` は、画像本来の縦横比を保ちながら、画像全体が利用可能な空間に完全に収まるように縮小・拡大し、画像を切り抜きません：

```swift
.scaledToFit()
```

または

```swift
.aspectRatio(contentMode: .fit)
```

この方法は、画像全体を表示したいが、変形は避けたい場面に適しています。

すべての画像に同じ幅と高さを設定すると、どうしても画像が引き伸ばされる場合があります。

たとえば：

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

スケーリング比率を設定しない場合、画像は元の比率で表示されません。

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` を設定すれば、画像の元の比率を保つことができます。

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` も画像の比率を保ちますが、利用可能な空間全体を埋めます。比率が一致しない場合、はみ出した部分は切り取られます：

```swift
.scaledToFill()
```

または

```swift
.aspectRatio(contentMode: .fill)
```

この方法は、背景画像やバナーのように、画像を領域全体に敷き詰めたい場面に適しています。特に画像を背景として使う場面に向いています。

**両者の違い**

![Swift](../../RESOURCE/003_img6.png)

## 文字

SwiftUI では、`Text` を使って文字を表示します。

基本的な使い方：

```swift
Text("FangJunyu")
```

前回のレッスンで `Text` は学びましたが、このレッスンではさらに一歩進んで、文字サイズや太さを制御し、ビューの中でより表現力のある文字表示を行う方法を学びます。

### フォントサイズ

`font` 修飾子を使うと、文字サイズを制御できます：

```swift
.font(.title)
```

たとえば：

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

よく使うフォントサイズ（大きい順）：

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### フォントの太さ

文字を太字にしたい場合は、`fontWeight` 修飾子を使います：

```swift
.fontWeight(.bold)
```

たとえば：

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

よく使うフォントの太さ（細い順）：

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` は文字サイズを、`fontWeight` は文字の太さを制御します。この 2 つを組み合わせることで、文字表現をより豊かにできます。

## まとめと実践

ここまでで、SwiftUI のデフォルトレイアウト、`Spacer`、`Image`、`Text` などの基礎知識を学びました。これらの内容だけでも、すでにいくつかの簡単なビューを開発するには十分です。

たとえば：[Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google の画面はとてもシンプルで、画像と文字が含まれています。SwiftUI の視点からその構造を分析してみることができます：

1. 全体は 3 つの部分に分けられます：Google ロゴ、検索ボックス、ヒントテキスト。これは `VStack` で縦並びにできます。
2. Google ロゴは 1 枚の画像なので、`Image` で表示できます。
3. 検索ボックスには入力欄とアイコンが含まれていますが、入力欄を無視すれば、検索アイコンは `Image` で表示できます。
4. ヒントテキストは `Text` で表示し、文字の横並びには `HStack`、文字色には `foregroundStyle` を使えます。

これらの知識を練習することで、いくつかの簡単なビューを作ることができ、`Image` と `Text` ビュー、およびそれらの修飾子に対する理解と使いこなしを深めることができます。
