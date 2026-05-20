# フォトギャラリー

このレッスンでは、フォトギャラリーページを作成します。

![view](../../../Resource/032_view13.png)

このケースでは、`extension`、`self`、インスタンスに関する知識を復習し、SwiftUI でよく使われる `Shape` 図形を学びます。

これらの知識を使うと、通常の画像を円形、角丸長方形、カプセル形、楕円形などの異なるスタイルに切り抜き、写真に枠線効果を追加できます。

このレッスンでは、`Shape`、`clipShape`、`strokeBorder`、`overlay` という新しい知識を使います。

そのうち、`clipShape` はビューの形状を切り抜くために使い、`strokeBorder` は図形の枠線を描画するために使い、`overlay` はビューの上に新しいビューを重ねるために使います。

## 画像素材

始める前に、いくつかの画像を用意する必要があります。

自分の写真を使ってもよいですし、このレッスンで提供しているサンプル画像を使ってもかまいません。

このレッスンの写真サンプルは、[Pixabay](https://pixabay.com/) サイトから取得しています：

[風景](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[キツネ](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[建物](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[花](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[白鳥](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

画像をダウンロードしたら、それらを `Assets` リソースフォルダに追加し、順番に `1`、`2`、`3`、`4`、`5` という名前を付けます。

![assets](../../../Resource/032_view17.png)

これで、SwiftUI では `Image("1")`、`Image("2")` のように画像を表示できます。

## 写真を表示する

まず、`ContentView` の中に 5 枚の写真を表示します：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

表示効果：

![view](../../../Resource/032_view.png)

このコードでは、`ScrollView` を使って写真リストをスクロール表示し、`VStack` を使って複数の画像を上から下へ並べています。

各画像は `.resizable()`、`.scaledToFit()`、`.frame(width: 300)` によって表示効果を設定しています。これにより、画像を拡大縮小でき、比率を保ったまま全体を表示し、画像の幅も制限できます。

`VStack` の `.padding(.vertical, 100)` は上下の余白を増やすために使います。これにより、最初の写真と最後の写真が画面端に近づきすぎるのを防げます。

最後の `.ignoresSafeArea()` は、スクロールビューに安全領域を無視させることを表します。写真をスクロールするときに画面の上端や下端まで伸ばせるため、ページ表示がより完全になります。

ただし、今は 5 枚の画像すべてで同じ修飾子を使っています：

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

重複コードを見つけたときは、`extension` を使って整理することを考えられます。

## extension を使って画像スタイルを整理する

`Image` にフォトギャラリー専用のメソッドを拡張できます：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ここでは、`Image` 型に `photoGalleryStyle` メソッドを拡張しています。

このメソッドの内部には、前で繰り返し使っていた `.resizable()`、`.scaledToFit()`、`.frame(width: 300)` が含まれています。つまり、画像の拡大縮小、比率を保った表示、幅の設定を 1 か所にまとめています。

この拡張を使うと、元の画像コード：

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

は、次のように簡略化できます：

```swift
Image("1")
    .photoGalleryStyle()
```

これで、各画像は `.photoGalleryStyle()` を呼び出すだけで同じフォトギャラリースタイルを適用できます。コードがより簡潔になり、後からまとめて変更するのも便利になります。

## self を理解する

拡張メソッドの中では、`self` を書きました：

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

ここでの `self` は、このメソッドを呼び出している現在の画像インスタンスを表します。

例えば：

```swift
Image("1")
    .photoGalleryStyle()
```

このコードでは、`photoGalleryStyle()` は `Image("1")` によって呼び出されているため、メソッド内部の `self` はこの `Image("1")` の画像を表します。

簡単に言えば、誰がこのメソッドを呼び出したかによって、`self` はその相手を表します。

注意が必要なのは、SwiftUI の修飾子は新しいビュー結果を次々に返すという点です。そのため、`photoGalleryStyle()` が返すのは修飾後のビューであり、単に元の `Image` 自体を返しているわけではありません。

## 写真の形状

ここまでで、写真は正常に表示できるようになりました。ただし、これらの写真はデフォルトではすべて長方形なので、見た目はやや普通です。

写真に角丸だけを付けたい場合は、`.cornerRadius()` を直接使えます：

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

表示効果：

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` は、画像に `20 pt` の角丸を追加することを表します。通常の角丸画像であれば、この書き方で十分です。

ただし、`.cornerRadius()` は角丸効果しか処理できず、普通の角丸画像を作るのに向いています。写真をより多くの異なる形状にしたい場合、この修飾子だけでは足りません。

このとき、SwiftUI の `Shape` を使う必要があります。`Shape` はさまざまな図形を表すことができ、`clipShape` と組み合わせることで、画像を対応する形状に切り抜けます。

## Shape を理解する

SwiftUI では、`Shape` は図形を表します。`View` と同じように、SwiftUI で非常によく使われる型です。

よく使われる `Shape` には、円形、長方形、角丸長方形、カプセル形、楕円形があります。異なる図形の外観をより直感的に観察できるように、以下の例ではそれぞれの図形に異なる色とサイズを設定します。

これらの例では、`.fill()` は図形を色で塗りつぶすために使い、`.frame()` は図形の表示サイズを設定するために使います。色は異なる図形を区別するためのもので、図形そのものに固定された色ではありません。

### Circle 円形

`Circle` は円形を表します。アバター、円形ボタン、円形画像などの UI 効果でよく使われます。

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle 長方形

`Rectangle` は長方形を表します。最も基本的な図形の 1 つであり、背景、区切り領域、通常の枠線の作成にも使えます。

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle 角丸長方形

`RoundedRectangle` は角丸長方形を表します。`cornerRadius` は角丸の大きさを設定するために使います。

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule カプセル形

`Capsule` はカプセル形を表します。両端が円弧状になっており、カプセルボタンやタグ背景などの UI 効果でよく使われます。

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse 楕円形

`Ellipse` は楕円形を表します。`Circle` に似ていますが、幅と高さが異なる場合は楕円として表示されます。

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

これらの例から、`Shape` 自体を直接図形として表示できることがわかります。次に、これらの `Shape` と `clipShape` を組み合わせて写真を切り抜き、写真を異なる形状で表示します。

## clipShape を使って写真を切り抜く

ここから、`clipShape` を使って写真を異なる形状に切り抜けます。

例えば、1 枚目の写真を円形に切り抜きます：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

このコードは、まず 1 枚の画像を表示し、その後 `Circle()` を使って円形に切り抜くことを表します。

![view](../../../Resource/032_view2.png)

`clipShape` の基本的な書き方は次のとおりです：

```swift
.clipShape(形状)
```

ビューの後ろに `.clipShape(...)` を追加し、括弧の中に切り抜きたい図形を入力します。

例えば：

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

今度は、5 枚の写真をそれぞれ異なる形状に切り抜きます：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

表示効果：

![view](../../../Resource/032_view8.png)

そのうち、`Rectangle()` で切り抜いた効果は通常の長方形写真に近いため、見た目の変化はあまり目立ちません。主にほかの形状と比較するために使っています。

これで、写真は単なる普通の長方形ではなく、異なる形状を持つようになりました。

## 写真に枠線を追加する

円形写真に枠線を追加したい場合、`border` を使うことを考えるかもしれません：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

しかし、この方法で得られるのは通常、円形の枠線ではなく、長方形の枠線です。

![view](../../../Resource/032_view9.png)

これは、`border` が `clipShape` で切り抜かれた後の形状ではなく、ビューの長方形領域に沿って枠線を追加するためです。

そのため、円形の枠線が必要な場合は、`border` を直接使うことはできません。

## strokeBorder を使って図形の枠線を描画する

SwiftUI では、`strokeBorder` を使って、これらのよく使われる `Shape` に内側の枠線を描画できます。

例えば、円形の枠線を描画します：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

このコードは、`Circle` に茶色の枠線を描画し、枠線の幅を `10 pt` にすることを表します。

![view](../../../Resource/032_view12.png)

ここで注意したいのは、`strokeBorder` は写真に直接枠線を追加するものではなく、`Circle()` という図形に枠線を描画するという点です。

つまり、このコードで得られるのは独立した円形の枠線だけであり、まだ写真とは関係がありません。

この円形の枠線を写真の上に表示したい場合は、さらに `overlay` を使い、枠線を写真の上に重ねる必要があります。

## overlay を使って枠線を重ねる

`overlay` はビュー修飾子で、現在のビューの上に新しいビューを重ねることができます。

基本構造は次のように理解できます：

```swift
現在のビュー
    .overlay {
        重ねるビュー
    }
```

このケースでは、現在のビューはすでに円形に切り抜かれた写真です：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

上に重ねたい新しいビューは、円形の枠線です：

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

そのため、写真と枠線を組み合わせることができます：

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

ここでの `overlay` は、現在のビューの上に新しいビューを重ねることを表します。

`overlay` の中では、枠線は現在の写真の表示範囲に追従して重なるため、別途 `frame` を設定する必要はありません。枠線の形状と切り抜き形状が一致していれば、枠線は写真にぴったり合います。

![view](../../../Resource/032_view10.png)

最終的な効果として、円形写真の上に円形の枠線が重なります。

`ZStack` と比べると、`overlay` は「現在のビューに装飾を追加する」場面により適しています。写真が主体で、枠線は付加効果にすぎないため、`overlay` を使うとより明確になります。

## フォトギャラリーを完成させる

ここでは、各写真に対応する形状と枠線を追加します：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

表示効果：

![view](../../../Resource/032_view13.png)

これで、基本的なフォトギャラリーページが完成しました。

このページでは、`ScrollView` を使ってスクロール表示を実現し、`Image` で写真を表示し、`clipShape` で写真の形状を切り抜き、`overlay` と `strokeBorder` で枠線を追加しています。

## 完全なコード

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## まとめ

このレッスンでは、フォトギャラリーページを完成させました。

![view](../../../Resource/032_view13.png)

このケースでは、まず `Image` を使って写真を表示し、次に `extension` で `Image` に `photoGalleryStyle` メソッドを拡張し、重複する画像スタイルコードを整理しました。

その後、SwiftUI でよく使われる `Shape` を学びました。例えば、`Circle`、`Rectangle`、`RoundedRectangle`、`Capsule`、`Ellipse` です。これらの図形は直接表示できるだけでなく、`clipShape` と組み合わせてビューを切り抜くこともできます。

例えば：

```swift
.clipShape(Circle())
```

これは、ビューを円形に切り抜くことを表します。

最後に、`overlay` と `strokeBorder` を使って、写真に対応する形状の枠線を追加しました。注意が必要なのは、`border` は通常、ビューの長方形領域に沿って枠線を描画するという点です。枠線を円形、カプセル形、楕円形に追従させたい場合は、同じ `Shape` を使って重ねる方法のほうが適しています。

このレッスンを通して、フォトギャラリー効果を完成させただけでなく、`Shape`、`clipShape`、`strokeBorder`、`overlay` が UI でよく組み合わせて使われる方法も理解しました。

## 課後練習

### 1、フォトギャラリーの背景を追加する

フォトギャラリーページに全画面の背景画像を追加します。

要件：背景画像は画面全体を覆うことができ、安全領域を無視します。

### 2、グラデーション枠線

既存の単色枠線を線形グラデーション枠線に変更します。

`LinearGradient` を使って、より豊かな枠線効果を実現してみてください。

### 3、リアルな写真フレーム

インターネットで実際の写真フレームのスタイルを検索し、`overlay` を使って画像フレームを重ね、写真をより本物の額縁に近い見た目にしてみてください。

練習の表示効果：

![button](../../../Resource/032_view15.jpeg)

### 4、角丸ボタン枠線を実装する

実際の開発では、ボタンに角丸長方形の枠線を使うことがよくあります。

角丸ボタンを作成し、`RoundedRectangle` と `strokeBorder` を使ってボタンに角丸枠線を追加してみてください。

練習の表示効果：

![button](../../../Resource/032_view14.png)

### 考察問題

単色枠線もグラデーション枠線も使わず、枠線に何らかの模様を表示したい場合は、どのように実装すればよいでしょうか？

資料を検索して、`overlay`、`mask`、`ImagePaint` などの関連する使い方を調べてみてください。

練習の表示効果：

![button](../../../Resource/032_view16.png)
