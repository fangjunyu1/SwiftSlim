# SwiftUI ビューのライフサイクル

前のレッスンでは、`@State` 変数がビューのライフサイクルに従うことを理解し、`onAppear` の基本的な使い方も学びました。

このレッスンでは、さらに SwiftUI ビューのライフサイクルを理解し、ビューがどのように作成・表示されるのか、ビュー内の変数がどのように作成・再作成されるのかを知り、さらに `onAppear`、`onDisappear`、そして `init` コンストラクタも学びます。

これらの知識をもとに、SwiftUI ビュー全体の構築プロセスに対する全体的な理解を築きます。

## アプリ起動の順序

iOS プロジェクトを作成すると、Xcode はデフォルトで 2 つのファイルを生成します。

```
ContentView.swift
プロジェクト名 + App.swift
```

このうち、「プロジェクト名 + App.swift」はアプリ全体のエントリーファイルです。

例えば：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### コード実行の流れ

App（シミュレータまたは実機）を実行すると、システムはまず `@main` キーワードを探します。

```swift
@main
struct SwiftSlimTestApp: App {...}
```

エントリーファイルを確認した後、コードの実行を開始します。

最初に App 構造体に入り、`body` 内のコードを実行し、その後 WindowGroup を作成して、その中の ContentView を読み込みます。

### WindowGroup の役割

WindowGroup はウィンドウを管理するために使われます。

```swift
WindowGroup {
    ContentView()
}
```

iPad や macOS ではマルチウィンドウに対応していますが、iPhone では通常 1 つのウィンドウしかありません。

したがって、WindowGroup は iPhone では主に最初に表示する画面を管理します。

### ビューの読み込みプロセス

システムが ContentView を見つけると：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI は `body` 内のコードを実行し、返されたビュー構造（VStack、Text など）に基づいて画面を構築し、スクリーン上に表示します。

これらのステップが終わると、ビュー内で ContentView を確認できます。

![ContentView](../../Resource/016_view1.png)

ここで注意すべきなのは、`body` の役割はビューを生成することであり、ビューを保存することではないという点です。

つまり、ビューが更新されるたびに、SwiftUI は `body` を再計算し、新しいビュー構造を生成します。

### プレビュービューのロジック

Xcode のプレビュー（Canvas）と実際の実行は、2 つの異なる仕組みです。

例えば、エントリーファイルにデバッグ出力を追加します。

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Xcode で ContentView をプレビューしても、`@main` のエントリーからは実行されないため、エントリーファイルの `onAppear` は発火しません。

しかし、シミュレータや実機で実行すると、システムは `@main` から完全な流れで App 全体を実行するため、エントリー側の `onAppear` が発火し、デバッグ情報が出力されます。

重要なのは、Xcode のプレビューは「部分レンダリング」であり、現在のビューを表示するためだけに使われることです。一方、シミュレータや実機は「完全な実行環境」を提供し、App 全体を実行します。

したがって、App の機能を検証するときは、シミュレータまたは実機を基準にするべきであり、Xcode プレビューでは完全な実行環境を提供できません。

## ビューのライフサイクル

現在の段階では、私たちのコードはすべて ContentView に集中しています。しかし、実際のアプリでは通常、1 つの App に複数のビューが含まれ、さまざまな場面で切り替わります。

例えば、「貯金箱」では：

![PiggyBank](../../Resource/016_view.png)

「貯金する」をタップすると SaveView が表示され、貯金が終わるか閉じると SaveView は取り除かれます。

この流れこそがビューのライフサイクルであり、ビューの作成、表示、そして最後に削除されるまでの過程です。

### アプリを閉じる

App を閉じると、すべてのビューが取り除かれ、関連する状態も消えます。

そのため、ContentView や他のビューもメモリから取り除かれ、App 全体の実行状態も消去されます。

## ビュー内の変数のライフサイクル

SwiftUI では、変数のライフサイクルは通常ビューに結び付いています。

例えば：

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` 変数

`@State` で宣言した変数は、ビューのライフサイクルに結び付いています。

```swift
@State private var name = "FangJunyu"
```

ビューが作成されると `name` も作られ、ビューが取り除かれると `name` も破棄されます。 

これが、UserDefaults などの方法でデータを永続化する必要がある理由です。

### body 内の変数

`body` の中で定義した変数：

```swift
var num = 10
```

そのライフサイクルは `body` の実行過程に結び付いています。

SwiftUI の状態が変化すると、例えば：

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

`name` が変わると、`@State` がデータの変化を検知し、SwiftUI にビューの再計算を通知します。その結果、`body` が再計算されます。

`body` が再計算されると、`body` 内のすべてのコードが再実行され、`body` 内の変数（たとえば `num`）も再作成されます。

このため、`body` の中で複雑な変数を定義することは推奨されません。

なぜなら、ビューが更新されるたびに `body` 内の変数が再作成され、計算コストが増え、パフォーマンスにも影響するからです。

SwiftUI では、異なる種類のデータを異なる方法で管理するべきです。ビューのライフサイクルに従うデータは `@State` で保存し、一時的な計算データは `body` の中に置けます。

## `onAppear` と `onDisappear`

前のレッスンで、ビューが表示されると `onAppear` が呼ばれることをすでに学びました。

```swift
.onAppear {}
```

例えば：

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode のプレビューでも実行時でも、`onAppear` 内のデバッグ出力を確認できます。

### `onDisappear`

`onAppear` に対応するのが `onDisappear` です。

```swift
.onDisappear {}
```

ビューが閉じられると、`onDisappear` が呼ばれます。

例えば：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

ビューが取り除かれると、`onDisapper` 内のコードが呼ばれます。

ヒント：現在の段階で使っている ContentView はアプリのルートビューであり、直接閉じたり取り除いたりすることはできません。そのため、この段階では `onDisappear` の実行効果を観察できません。

今後、ページ遷移や新しいビューを開く学習に進むと、`onDisappear` が呼ばれる場面を確認できるようになります。

## 作成と表示のロジック

注意すべき点として、ビューの作成と表示は 2 つの異なる段階です。

ビューが作成されるとき、struct のコンストラクタが呼ばれます。

```swift
init() {}
```

SwiftUI のビューは struct 構造なので：

```swift
struct ContentView: View { ... }
```

ビューインスタンスが作成されると `init` コンストラクタが実行され、ビューが表示されると `onAppear` が呼ばれます。

例えば：

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Xcode でビューをプレビューすると、次のデバッグ出力が見られます。

```swift
Create ContentView
Show ContentView
```

つまり、まず `init` が実行されてビューが作成され、その後 `body` 内のコードが計算され、最後にビューが表示されて `onAppear` が実行されます。

そのため、ビューの作成段階と表示段階は分かれていることを理解する必要があります。

### `init` コンストラクタ

`init` は Swift の基本構文で、struct と class のどちらにも定義でき、オブジェクトの初期化に使われます。

```swift
init() {}
```

SwiftUI では、ビューが作成されるときにシステムがビューの `init` メソッドを呼びます。これは、引数の受け取りやデータ初期化に使えます。

もし手動で `init` を書かなければ、Swift は struct に対してデフォルトコンストラクタを自動生成します。

ContentView などの SwiftUI ビューでは、ビュー作成時に `init` が実行され、ビュー表示時に `onAppear` が実行されます。

したがって、`init` はビュー作成時に実行されるコンストラクタであり、今後パラメータ受け渡しやデータ初期化を行う際に役立ちます。

## まとめ

このレッスンでは、エントリーファイルから ContentView ファイルまでの実行の流れを通して、アプリ起動の順序を学びました。

SwiftUI ビューのライフサイクルについても理解しました。ビュー作成時には `init` が実行され、画面に表示されると `onAppear` が実行され、ビューが削除または閉じられると `onDisappear` が実行されます。

また、ビュー更新の仕組みも学びました。ビューは状態に駆動されており、`@State` などの状態が変化すると、SwiftUI はビューを更新し、`body` を再計算します。その際、`body` 内の変数も再作成されます。

変数のライフサイクルはビューのライフサイクルに結び付いており、`body` 内の一時変数は更新のたびに再作成されます。

これらのライフサイクルや変数の振る舞いを理解することで、コードをより適切に整理し、アプリのロジックをより明確にできます。
