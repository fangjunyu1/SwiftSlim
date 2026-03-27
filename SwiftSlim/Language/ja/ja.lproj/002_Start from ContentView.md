# ContentView から始める

## レッスン前の準備

このレッスンでは、`ContentView.swift` ファイルから始めて、SwiftUI の基本構造を体系的に理解していきます。内容は次の通りです。

- コメント
- View 構造
- VStack / HStack / ZStack レイアウト
- SF Symbols アイコン
- ビュー修飾子（modifier）
- プレビューコード `#Preview`

まず、前回作成した Xcode プロジェクトを見つけて、`.xcodeproj` ファイルをダブルクリックします。

左側の Navigator ナビゲーション領域で `ContentView.swift` ファイルを選択します。

注意：プロジェクトを開くたびに、Canvas に "Preview paused" と表示されることがあります。その場合は更新ボタンをクリックすればプレビューが復元されます。

![Swift](../../RESOURCE/002_view7.png)

## ContentView を知る

ContentView のコード：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
```

コード量は少ないですが、SwiftUI の中核となる構造が含まれています。

### 1. コメント

ファイル上部：

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//
```

これはファイルコメントで、ファイル情報を記録するために使います。ファイル名、プロジェクト名、作成者、作成日時が含まれています。

Swift では、単一行コメントに `//` を使います。

```swift
// これはコメントです
```

コメントはコードの可読性を高め、開発者がコードロジックを理解しやすくしてくれます。

実際の開発では、コードが分かりにくくなることがあります。コメントを書かなければ、3 日後には自分のコードが読めなくなる、ということも起こります。

そのため、コードを書く過程で積極的にコメントを追加するのは良い開発習慣です。コメントを使ってロジックを記録しておくと、後からのメンテナンスがしやすくなります。

**一時的にコードを無効化する**

コメントは、一時的にコードを無効化して問題を切り分けるためにも使えます。

たとえば：

```
A
B
C
```

A、B、C は 3 つのコード片で、そのうちのどれか 1 つにエラーがあるとします。コメントアウトしながら調査できます。

まず A にコメントを付けます：

```
// A
B
C
```

A をコメントアウトしたあとでコードが正常に戻れば、A に問題があると分かります。

もし A をコメントアウトしてもまだ問題があるなら、次に B をコメントアウトしていきます。このようにして問題のあるコードを見つけます。

開発中には多くの問題に出会いますが、多くの場合、コメントアウトしながら原因を調べます。これは問題のあるコードを特定し、バグを見つける助けになります。

Xcode では、次のショートカットが使えます：

```
Command ⌘ + /
```

これでコメントの追加・削除を素早く行えます。

### 2. SwiftUI フレームワークを読み込む

```swift
import SwiftUI
```

このコードは、SwiftUI フレームワークを読み込むことを意味します。

SwiftUI の `View`、`Text`、`Image`、`VStack` などの型は、すべてこのフレームワークから提供されています。

もし SwiftUI フレームワークを読み込まなければ、Xcode は次のようなエラーを出します：

```
Cannot find type 'View' in scope
```

つまり、コンパイラが `View` 型を認識できないということです。

### 3. View 構造

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

初めてこの View 構造を見ると、`struct`、`View`、`var`、`body`、`some` などのキーワードが含まれていて、少し見慣れないかもしれません。

今はまだこれらのキーワードを学んでいませんが、このコードの意味は、`ContentView` という名前の View を作成している、ということだけ分かれば十分です。

View は、絵を描くためのキャンバスだと考えることができます。そして、その描画ツールが SwiftUI です。

たとえば：

![Swift](../../RESOURCE/002_view.png)

上の画像には 3 つの画面が表示されていますが、実際には 3 つの View です。

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

SwiftUI を使ってアプリを開発するとき、各画面はそれぞれ 1 つの View になります。

### 4. SwiftUI コード

View の中には、次のような SwiftUI コードが表示されています：

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

この SwiftUI コードは、縦方向レイアウトで、1 つのアイコンと 1 つのテキストを表示していることを意味します。

![Swift](../../RESOURCE/002_view1.png)

#### VStack レイアウト

```swift
VStack { }  // 縦方向レイアウト
```

`VStack` は縦方向レイアウトのコンテナを表します。内部のビューは上から下へ並びます。

![Swift](../../RESOURCE/002_view8.png)

SwiftUI でよく使う 3 種類のレイアウト：

- `VStack` —— 縦並び
- `HStack` —— 横並び
- `ZStack` —— 重ね並び（Z 軸）

```swift
HStack { }  // 横並び
ZStack { }  // 重ね並び
```

各レイアウトの並び方のイメージ：

![Swift](../../RESOURCE/002_view2.png)

たとえば、`HStack` を使って横並びにする場合：

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

地球アイコンとテキストが横向きに表示されるのが分かります。

![Swift](../../RESOURCE/002_view3.png)

横並びにしたいときは `HStack`、重ねて表示したいときは `ZStack` を使います。

#### Image と SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

このコードは地球アイコンを表示しています。この地球アイコンは Apple の SF Symbols アイコンシステムから来ています。

![Swift](../../RESOURCE/002_view9.png)

このコードの意味は、地球アイコンを大きめのサイズで、アクセントカラーで表示するということです。

もちろん、地球アイコン以外のアイコンも表示できます。

たとえば、バックパックを表示するには：

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**他のアイコンを表示するには？**

Apple が公式に提供しているシステムアイコンライブラリ SF Symbols を使います。

Apple Developer 公式サイトを開いて、[SF Symbols](https://developer.apple.com/sf-symbols/) をダウンロードします。

![Swift](../../RESOURCE/002_sf.png)

SF Symbols アプリを開きます。

![Swift](../../RESOURCE/002_sf1.png)

左側にはシンボルのカテゴリ、右側には対応するアイコンが表示されます。

アイコンを右クリックして「名前を 1 つコピー」を選ぶと、その文字列名が取得できます。

たとえば：

```
"globe"
"backpack"
"heart"
```

コピーしたアイコン名を `Image(systemName:)` の中に入れれば、別のアイコンを表示できます。

注意：各 SF Symbols アイコンには対応する最低システムバージョンがあります。システムバージョンが低すぎるとアイコンが表示されない場合があります。互換性情報は SF Symbols アプリ内で確認してください。

#### 修飾子

SwiftUI において、修飾子（modifier）はビューの見た目や動作を変更するためのメソッドです。

修飾子は服のようなものだと考えられます。違う服を着れば、見た目も変わります。

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` と `foregroundStyle` は `Image` ビューの修飾子で、`Image` の内容そのものは変えずに、`Image` ビューを装飾しています。

**1. imageScale**

```swift
.imageScale(.large)
```

これは SF Symbols アイコンのサイズを制御できます。

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

異なるオプションに変更することで、SF Symbols のアイコンサイズを変えられます。

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` は前景色を制御できます。

`.tint` は現在の環境のアクセントカラー（accent color）を表し、iOS ではデフォルトで青です。

前景色を赤に変更したい場合は：

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text ビュー

`Text` は文字列を表示するためのテキストビューです。

```swift
Text("Hello, world!")
```

たとえば、自分の名前を表示するなら：

```swift
Text("FangJunyu")
```

注意：文字列は必ず `""` のダブルクォーテーションで囲む必要があります。

自分の名前や電話番号などを表示してみることもできます。

#### padding 余白

SwiftUI では、`padding` はビューの内容と境界の間に余白を追加するために使います。これは「内側の余白（padding / content inset）」にあたります。

```swift
HStack {
    ...
}
.padding()
```

このコードは、`HStack` ビューにシステム標準の余白を追加することを意味します。

**padding とは？**

`padding` とは「ビューの内容とその境界との間にある余白領域」のことです。

下図では、青い `HStack` に padding を設定すると、青い領域が内側へ縮み、見た目には「ひと回り小さくなった」ように見えます。

![Swift](../../RESOURCE/002_view6.png)

**デフォルト余白**

`padding()` 修飾子は、デフォルトでシステム推奨の標準間隔を使います。

```swift
.padding()
```

この値はプラットフォームやコンテキストによって異なる場合があります。たとえば：

- iOS では通常およそ 16 pt 程度です。
- macOS や watchOS では、システム標準間隔は異なる場合があり、各プラットフォームのデザイン規範によって大きかったり小さかったりします。

**カスタム余白**

ビューごとに個別の余白を設定することもできます。

1. 単一方向を設定する

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

方向の説明：

- `.top`: 上余白
- `.bottom`: 下余白
- `.leading`: 前側余白
- `.trailing`: 後側余白

![Swift](../../RESOURCE/002_view12.png)

注意：`leading` と `trailing` は言語方向に応じて自動的に適応されます。たとえばアラビア語（RTL）環境では自動的に反転します。

2. 複数方向を設定する

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

配列を使って複数方向を同時に指定できます。配列の詳しい使い方は後続のチュートリアルで説明しますので、ここではこの書き方があることだけ知っておけば大丈夫です。

3. 水平方向または垂直方向を設定する

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

これは次と同等です：

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**余白を削除する**

余白が不要な場合は、`.padding(0)` を使って取り除けます。

```swift
.padding(0)
```

あるいは、padding 修飾子自体を削除してもかまいません：

```swift
// .padding()
```

### 6. Preview プレビューコード

```swift
#Preview {
    ContentView()
}
```

このコードは、Canvas 内で ContentView のプレビューを生成することを意味します。

注意：`#Preview` は Swift 5.9 / Xcode 15 で導入された新しい構文です。それ以前は `PreviewProvider` 構造体が使われていました。

**Preview をコメントアウトするとどうなる？**

もし Preview をコメントアウトすると：

```swift
// #Preview {
//    ContentView()
// }
```

Canvas にはレンダリング可能な内容が表示されなくなります。

![Swift](../../RESOURCE/002_xcode.png)

これが `#Preview` が Canvas のプレビュー表示を制御しているということです。

Xcode の中で SwiftUI ビューをプレビューしたいときは、`#Preview` コードを追加します。プレビューが不要なら、`#Preview` コードをコメントアウトまたは削除できます。

## まとめ

`ContentView.swift` ファイルのコード量は多くありませんが、実際には SwiftUI の複数の核心概念が含まれています。初心者にとっては見慣れない内容に感じるかもしれませんが、コード構造を分解して理解することで、SwiftUI への初歩的な理解を築くことができます。

このレッスンの内容を振り返ると、まず `//` コメントを学びました。コメントはコードロジックの説明や、一時的にコードを無効化するために使えます。

続いて、SwiftUI ファイルでは SwiftUI フレームワークを読み込む必要があることを知りました：

```swift
import SwiftUI
```

これを読み込まないと、コンパイラは `View` などの型を認識できません。

その後、SwiftUI ビューの基本構造を理解しました：

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ここで `ContentView` はビュー名です。

また、代表的な 3 種類のレイアウトコンテナ、`VStack`（縦並び）、`HStack`（横並び）、`ZStack`（重ね並び）も学びました。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

このコードは、縦並びのコンテナを表示し、その中に 1 つのアイコンと 1 つのテキストを表示していることを表しています。

`Image` は SF Symbols アイコンを表示でき、修飾子によってサイズや色を調整できます。

`Text` ビューは文字内容を表示できます。

`padding` は余白で、ビューの周囲に透明なスペースを追加します。

最後に `#Preview` プレビューも学びました。これにより Canvas の中でプレビューを表示できます。

### レッスン後の練習

初心者にとって、このレッスンの内容は少し複雑に感じるかもしれません。さらに練習することで理解を深められます。

- SF Symbols アイコン名を変更する
- アイコンの前景色を黒に変更する
- `VStack` を `HStack` に変更する
- `Image` または `Text` をコメントアウトして、プレビューの変化を観察する

### おまけ：コード補完（Code Completion）

コードを入力していると、Xcode が自動的に候補リストを表示することに気付いたかもしれません。

たとえば、`imageScale` 修飾子を変更するとき：

```swift
.imageScale(.)
```

Xcode は利用可能な候補を表示してくれます：

![Swift](../../RESOURCE/002_view10.png)

これはコード補完（Code Completion）の仕組みで、型推論や列挙型メンバーの候補提示に基づいています。入力効率を高め、エラーを減らすのに役立ちます。

後続のレッスンで列挙型（`enum`）を正式に紹介しますが、ここではまず簡単に触れるだけにしておきます。
