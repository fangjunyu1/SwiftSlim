# Swift と SwiftUI

Apple プラットフォーム向け開発を学ぶとき、多くのチュートリアルは Swift と SwiftUI を分けて説明しがちです。そのため初心者は、これらがまったく独立した 2 つの技術なのだと誤解しやすく、理解が分断されてしまうことがあります。

しかし実際には、Swift と SwiftUI は深く統合されたひとつの全体です。Swift はプログラミング言語としてロジックとデータを担い、SwiftUI は Swift を基盤に構築されたユーザーインターフェースフレームワークとして、ビューの描画とインタラクションを担当します。

このレッスンでは、「Swift とは何か」「SwiftUI とは何か」、そしてそれらがコードの中でどのように協力するのかを、はっきりと理解できる枠組みを作ります。

## Swift とは？

Swift は Apple が公開した現代的なプログラミング言語で、iOS、macOS、watchOS、tvOS などのプラットフォーム向けアプリの開発に使われます。

![swift](../../RESOURCE/010_swift.png)

Swift は強い型付けを持つ静的言語であり、設計上は安全性を重視しているため、よくあるプログラミングミス（たとえばヌルポインタ、範囲外アクセスなど）を大きく減らしています。また、C や Objective-C とのシームレスな統合もサポートしています。

実際の開発では、Swift は主にアプリのロジック部分、たとえばデータ処理、ネットワークリクエスト、保存操作などを担当します。

## SwiftUI とは？

SwiftUI は、Apple が 2019 年に公開した新しい UI 構築フレームワークです。SwiftUI は宣言型プログラミングの方式を採用しており、開発者はより簡潔なコードで UI 構造とインタラクションを記述できます。

![swiftui](../../RESOURCE/010_swiftui.png)

宣言型プログラミングとは、開発者が「何を表示したいか」だけをシステムに伝えれば、システムがデータの変化に応じて自動的にビューを更新してくれるという考え方です。もはや手動で UI 状態を更新する必要がなくなり、UI 開発の複雑さが大きく簡略化されます。

SwiftUI の中心は、ビューコンポーネント（`Text`、`Image`、`Button` など）と、レイアウトコンテナ（`VStack`、`HStack`、`ZStack` など）です。これらのコンポーネントは、データバインディングと状態管理を通して連携し、データ変化に応じて UI を自動更新できるようにします。

## Swift と SwiftUI はどう協力するのか？

Swift と SwiftUI の役割は、次のようにまとめられます：

**1. Swift：ロジックとデータを処理する**

Swift は主に、データの管理、状態の保存、ロジックの実行に使われます。こうしたコードは通常、UI の描画に直接影響するのではなく、データと振る舞いの処理を担当します。

たとえば Swift でデータを処理する場合：

```swift
let markdown = try? String(contentsOf: url)
```

このようなコードには、変数宣言、定数定義、関数、制御フローなどが含まれますが、ビューの表示には直接関与しません。

**2. SwiftUI：UI を宣言し描画する**

一方 SwiftUI は、ユーザーインターフェースのレイアウトと内容を構築するために使われ、主に UI の描画とビューのインタラクションを担当します。

たとえば、SwiftUI を使ってテキストビューを作る場合：

```swift
Text("SwiftSlim")
```

これらはすべて UI 要素を構築し制御するためのコードであり、ユーザーインターフェースと直接関わります。

### 基本例

以下はシンプルな SwiftUI の例です：

```swift
// ContentView.swift

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

この例では：

**SwiftUI コード**：`VStack`、`Image`、`Text`、`padding` はすべて SwiftUI に属し、UI の表示とレイアウトを担当します。

**Swift コード**：ファイル上部の `//` コメントと `import SwiftUI` は Swift のコード構造に属します。下部の `#Preview` は Xcode プレビュー用のマクロであり、実際の UI 描画には参加しません。

### 進んだ例

実際のプロジェクトでは、Swift と SwiftUI はそれぞれ得意な役割を果たすためによく混在して使われます：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

この例では：

**SwiftUI コード**：`@State` は SwiftUI 特有のプロパティラッパーで、ビューの可変状態を宣言するために使われます。`Button` と `Text` は SwiftUI のビューコンポーネントであり、画面表示とユーザーインタラクションを担当します。

**Swift コード**：`private var name` と `func printName()` は Swift のコードであり、データ保存とロジック実行に使われ、ビュー描画そのものには直接関与しません。

ユーザーがボタンを押すと、SwiftUI はボタン内の操作コードを発火します：

```swift
Button("Print") {
    printName()
}
```

ここで `Button` は SwiftUI コンポーネントですが、実行される `printName()` 関数は Swift コードであり、具体的なロジック処理を担当しています。

このような協力によって、Swift と SwiftUI はシームレスに結びつき、Swift がデータとロジックを、SwiftUI がユーザーインターフェースの表示を担当するのです。

## Swift と SwiftUI のコードは通常どこに書くのか？

SwiftUI では、UI は `body` プロパティが返すビューによって構築されます。そのため、UI を記述するすべてのコードは通常 `body` の中に書きます。

たとえば：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

この例では、`Text` は SwiftUI のビューコンポーネントなので、必ず `body` の中に書く必要があります。SwiftUI は `body` を通じて UI を読み取り生成するからです。

UI と直接関係のないコード、たとえば変数、関数、データ処理ロジックなどは通常 `body` の外側に書きます。たとえば：

```swift
struct ContentView: View {

    // Swift：データまたはロジック
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：UI
    var body: some View {
        Text(name)
    }
}
```

注意すべき点として、`body` の中でも `if` や `for` のような Swift 構文は使えます。これらは SwiftUI ビューの生成を制御するために使われるだけです：

```
if isLogin {
    Text("Welcome")
}
```

そのため、SwiftUI 開発では、ビューコード（`Text`、`Image`、`Button` など）は通常 `body` の中に、データとロジックのコード（変数、関数など）は通常 `body` の外に書く、とシンプルに理解できます。

## Swift ファイル

学習が進むと、MVVM アーキテクチャにも触れるようになります。その中で ViewModel 層や Model 層は、通常純粋な Swift コードで構成され、ビュー層（SwiftUI）とは完全に分離されています。

たとえば、アプリ状態を管理するクラス：

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

あるいは、データ構造を記述する構造体：

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

この種のファイルの役割は、データの管理と永続化であり、ビューの中に直接表示されるものではないため、完全に Swift に属します。

## 歴史的背景

Swift と SwiftUI の関係を理解するには、Apple 開発技術の変遷も知っておく必要があります。2026 年時点までに、この技術スタックは何度も反復進化してきました。

### Swift の歴史

Swift が登場する以前、Apple プラットフォームの主なプログラミング言語は Objective-C であり、C 言語との混在もサポートしていました。その文法は比較的冗長で、初心者にとっては学習ハードルが高かったです：

```Obj-c
// Objective-C の書き方
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 年、Apple は WWDC で Swift 言語を発表しました。Swift は文法がより現代的で、型安全性も高く、徐々に Objective-C に代わって主流の開発言語となっていきました：

```swift
// Swift の書き方
let name = "Fang"
print("Hello, \(name)")
```

しかし、Objective-C はそのまま歴史の舞台から消えたわけではありません。多くの既存プロジェクトや低レイヤーフレームワークの中で、今でも広く使われています。基本文法を理解しておくことは、古いプロジェクトの保守やシステム下層の理解にとって依然として価値があります。

### SwiftUI の歴史

SwiftUI が登場する前、iOS では **UIKit**、macOS では **AppKit** が使われていました。これら 2 つのフレームワークは「命令型」プログラミング方式を採用していました。開発者は Storyboard でコントロールをドラッグしたり、手動でコードを書いたりしてビュー状態を制御する必要があり、コード量が多く、保守コストも高く、特に UI ロジックが複雑な場合にその問題が顕著でした。

![storyboard](../../RESOURCE/010_xcode.png)

2019 年、Apple は WWDC で SwiftUI を正式に発表しました。SwiftUI は「宣言型」プログラミングパラダイムを導入し、UI 開発フローを大幅に簡略化しました。

![storyboard](../../RESOURCE/010_xcode1.png)

注意しておきたいのは、SwiftUI は完全に独立した下層実装ではないということです。各プラットフォームでは、本質的に UIKit（iOS）や AppKit（macOS）とブリッジ・連携しており、下層では依然としてこれら 2 つのフレームワークに依存しています。

### Swift と UIKit/AppKit の関係

Swift は汎用的なプログラミング言語であり、Apple の各プラットフォーム上で動作できますが、UIKit や AppKit を完全に置き換えられるわけではありません。複雑な UI 要件や、SwiftUI がまだカバーしていない機能については、依然として UIKit や AppKit の力を借りる必要があります。

たとえば UIKit は、複雑なビューコントローラ管理、アニメーション効果、ジェスチャ認識などの面で非常に成熟しており、大量の本番実績を積み重ねています。SwiftUI もこれらの能力を継続的に強化していますが、特定のエッジケースでは依然として制約があります。

そのため、多くの開発者はプロジェクトの中で SwiftUI と UIKit（あるいは AppKit）を混在させ、それぞれの強みを十分に活かしています。

この観点から見ると、SwiftUI は UIKit / AppKit を高レベルにラップしたものだと理解できます。SwiftUI を学ぶと同時に、UIKit や AppKit の基本概念を適度に理解しておくと、古いプロジェクトの保守や複雑な機能実装の際に、より妥当な技術判断がしやすくなります。

## まとめ

**Swift**：主にロジック、データ処理、制御フローなどを書くために使われ、ビューのレイアウトとは関係しません。

**SwiftUI**：宣言的に UI を構築するために使われ、ビュー内容やレイアウトに関するコードは SwiftUI に属します。

実際の開発では、Swift と SwiftUI は通常組み合わせて使われます。Swift がロジックを担当し、SwiftUI が UI を担当します。

Objective-C と UIKit から、Swift と SwiftUI へ。Apple の開発環境は徐々により現代的で簡潔なプログラミング方式へ移行していますが、UIKit と AppKit は多くの伝統的プロジェクトにおいて今なお無視できない存在です。

Swift と SwiftUI の関係を理解することで、私たちはより効率的に iOS/macOS 開発を進めることができ、古いプロジェクトを保守するときにも、より合理的な技術選択を行えるようになります。
