# 個人履歴ページを作る

このレッスンでは、シンプルな個人履歴ビューを作成し、次の知識を学びます：

- `cornerRadius`
- `spacing`
- `ScrollView`

構築の過程で、レイアウト、`Text`、`Image` などの知識を復習しつつ、間隔の制御やコンテンツのスクロール効果を実現します。

## 個人履歴

完成イメージ：

![Swift](../../RESOURCE/004_img.png)

**まずは自分で完成を試みてから、その後に下の解説を読み進めてください。**

### プロジェクトを作成する

新しい iOS プロジェクトを作成するか、前のプロジェクトをそのまま使ってもかまいません。

デフォルトの ContentView コード：

```swift
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

ここでコードを空にして、自分の内容を書き始めます：

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### 全体構造

実際の開発では、まず全体構造を設計することが多いです。

今回のページには次の内容が含まれます：

1. タイトル
2. 個人情報
3. 自己紹介

最も外側に `VStack` を追加します：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` によってビューを縦方向に並べることができ、さらに配置や間隔も制御できます。

### タイトル

まず、タイトルを表示する `Text` を作成します。

ここでは、自分の英語名をタイトルとして表示します：

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

タイトルは通常、大きく太く表示します。ここでは `font` と `fontWeight` 修飾子を使います：

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### レイアウト

SwiftUI のデフォルト整列は `center` なので、今はタイトルが ContentView の中央に表示されています。

![Swift](../../RESOURCE/004_img3.png)

タイトルをビューの上部に表示したいので、`Spacer` を使ってレイアウトを調整できます：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` は余った空間を占有し、`Text` をコンテナの上へ押し上げます。

![Swift](../../RESOURCE/004_img4.png)

### 余白

もし文字が上端に近すぎると感じるなら、`padding` または `Spacer` を使えます。

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

`VStack` の上余白を 20 に設定します。

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` を使い、`frame` の高さを設定することで、指定した高さの余白を作ることもできます。

表示効果：

![Swift](../../RESOURCE/004_img5.png)

### 画像

自分の顔写真を 1 枚用意し、Assets リソースフォルダに入れます。

![Swift](../../RESOURCE/004_img6.png)

ContentView では `Image` を使って画像を表示します：

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

画像の元サイズがかなり大きいため、`frame` を使って表示サイズを制御する必要があります。

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

ここで一つ問題が見つかります：

`frame` の幅と高さの比率が元画像の比率と一致しない場合、画像は変形してしまいます。

たとえば：

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

画像の変形を避けるために、`scaledToFit` を使います：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` の役割は：

指定された `frame` の範囲内で、画像本来の比率に従って拡大縮小し、画像内容を完全に表示することです。

無理に画像を引き伸ばして `frame` 全体を埋めるのではなく、縦横比を維持したまま等比率でスケーリングし、どちらか一辺がちょうど境界に接するまで拡大縮小します。

つまり：

- `frame` の幅が小さい場合、画像は幅を基準に縮小されます。
- `frame` の高さが小さい場合、画像は高さを基準に縮小されます。
- 画像は常に元の比率を保ち、変形しません。

通常は片方の寸法だけを指定することもできます。たとえば：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

この場合、システムは幅 140 に応じて適切な高さを自動計算し、画像比率も維持してくれます。

視覚比率を固定したい場合や、複雑なレイアウトの中で圧縮されるのを避けたい場合は、幅と高さを同時に制約できます。

### 角丸

画像を角丸で表示したい場合は、`cornerRadius` 修飾子を使えます：

```swift
.cornerRadius(10)
```

たとえば：

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

`Image` の修飾子の後ろに `cornerRadius(20)` を追加します。

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` は、ビューの境界を切り取り、半径 20 の角丸を適用することを意味します。

角丸を追加すると、画像の四隅が円弧になり、より柔らかくモダンな印象になります。

このようなデザインスタイルは現在の UI デザインでとても一般的で、たとえば iOS のアプリアイコンも角丸長方形の形を採用しています（ただし、システムアイコンは単純な角丸ではなく、連続曲率の超楕円です）。

### 個人情報

次に、画像の左側にある個人情報エリアを実装します。画面構造を見ると、個人情報と画像は横方向に並んでいるため、`HStack` を使う必要があります。

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

個人情報の内容自体は縦方向に並んでいます。

![Swift](../../RESOURCE/004_img11.png)

そのため、外側は `HStack`、個人情報の部分は `VStack`、テキスト内容は `Text` を使います。

基本構造：

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**項目名を太字にする**

項目名と項目値を区別するために、項目名には `fontWeight` を使えます：

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**テキストを左寄せにする**

`VStack` はデフォルトでは中央揃えです。すべてのテキストを左揃えにしたい場合は、整列方法を設定する必要があります：

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` は左側に揃えることを意味します（左から右へ読む言語環境の場合）。

![Swift](../../RESOURCE/004_img14.png)

### 間隔

個人情報と画像の間に固定の間隔を残したい場合、前に学んだのは `Spacer` で余白を作る方法でした：

```swift
Spacer()
    .frame(width: 10)
```

また、`HStack` の `spacing` パラメータを使うこともできます：

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` は、2 つの子ビューの間隔が 30 pt であることを意味します。

![Swift](../../RESOURCE/004_img15.png)

**spacing とは？**

`VStack`、`HStack`、`ZStack` では、`spacing` で子ビュー同士の距離を制御できます。

たとえば：

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack` 内の子ビューの間隔は 10pt に設定されます。

![Swift](../../RESOURCE/004_img16.png)

注意すべき点は、`spacing` は「直接の子ビュー」にしか作用せず、ネストしたコンテナ内部のレイアウトには影響しないということです。

**リスト内部の間隔を制御する**

各フィールド間の間隔を広げたい場合、最も直接的な方法は `VStack` に `spacing` を設定することです：

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

これで、すべての子ビューの間隔が 10 pt になります。

しかし画面を観察すると、一つ問題があります：

フィールドグループの間にも間隔があり、同時にフィールド名とフィールド値の間にも同じ間隔が入ってしまいます。

これは、`spacing` が現在のコンテナ内のすべての直接子ビューに作用するためです。

この構造では、各 `Text` はすべて外側の `VStack` の直接子ビューなので、間隔が一律になります。

もしフィールドグループの間には間隔を持たせつつ、フィールド名とフィールド値の間はデフォルトの詰まった間隔のままにしたい場合は、「フィールド名 + フィールド値」をひとつの論理的なまとまりとして扱い、外側を `VStack` で包めばよいです：

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

このとき構造は、外側の `VStack` 同士には間隔があり、内側の `VStack` 内ではデフォルトの詰まった間隔になるため、フィールド名とフィールド値の間に余計なすき間が入らなくなります。

![Swift](../../RESOURCE/004_img18.png)

### 自己紹介

次に、自己紹介エリアを実装します。

画面構造を見ると、紹介内容は複数行のテキストで構成されており、縦方向に並んでいます。

![Swift](../../RESOURCE/004_img19.png)

そのため、`VStack` と `Text` を組み合わせて使えます：

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**間隔を増やす**

今の個人情報と自己紹介の部分はやや詰まり気味で、見た目があまり美しくありません。

![Swift](../../RESOURCE/004_img20.png)

どちらも同じ外側コンテナの中にあるため、外側コンテナ全体で間隔を制御できます：

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

表示効果：

![Swift](../../RESOURCE/004_img21.png)

**リスト間隔**

`spacing` を使って、自己紹介テキスト同士の間隔を設定します：

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### 個人履歴の完成

これで、個人履歴の基本的なフレームは完成しました。

![Swift](../../RESOURCE/004_img.png)

### スクロールビュー

今のページ構造は `VStack` を使っています。紹介文が少ない場合は問題ありませんが、20 行、30 行、あるいはそれ以上に増えると、内容の高さが画面を超えてしまいます。

たとえば：

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

このとき 2 つの現象が起こります：

- 下側の内容が切れてしまう
- ページがスクロールできない

これは `VStack` の問題ではありません。`VStack` は単なるレイアウトコンテナであり、自動的にスクロール機能を提供するわけではありません。

**ScrollView とは**

`ScrollView` はスクロール可能なコンテナで、画面サイズを超える大量のコンテンツに適しています。たとえば縦や横のリストです。

基本構造：

```swift
ScrollView {
    ...
}
```

スクロール効果を実現したい場合は、ページ全体の内容を `ScrollView` で包む必要があります：

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

こうすることで、ページ全体がスクロール可能な領域になり、内容が画面の高さを超えたときに自然にスクロールできるようになります。

`ScrollView` はデフォルトでスクロールバーインジケータを表示します。スクロールバーを隠したい場合は、次のように設定できます：

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## 完全コード

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
