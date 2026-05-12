# Xcode ファイルの管理

このレッスンでは、Xcode でよく使うファイル操作を学びます。

これまでのレッスンでは、ほとんどのコードを `ContentView` の中に書いていました。こうすると、コードと表示結果を確認しやすくなります。

例：

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

しかし、実際の App では、通常すべてのコードを 1 つのファイルに書くことはありません。

画面、コンポーネント、機能が増えてくると、異なるビューを別々の SwiftUI ファイルに分ける必要があります。

例：

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

こうすることでコード構造がより明確になり、後からの保守や修正もしやすくなります。

## なぜファイルを管理するのか

SwiftUI では、1 つの画面や 1 つのコンポーネントを、通常は 1 つのビュー用ファイルとして独立して書くことができます。

例：

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

ここでの `CardView` は、SwiftUI のビューです。

すべてのビューを `ContentView` の中に書くと、コードはどんどん長くなり、読むのも難しくなります。

そのため、ファイルの作成、名前変更、削除、そしてフォルダを使って異なるコードファイルを管理する方法を学ぶ必要があります。

## SwiftUI ファイルを作成する

Xcode で SwiftUI ファイルを作成する方法は、主に 2 つあります。

1 つは空のファイルを作成し、自分でコードを書く方法です。

もう 1 つは SwiftUI テンプレートファイルを作成し、Xcode に基本コードを自動生成してもらう方法です。

初心者には、SwiftUI テンプレートファイルの使用をよりおすすめします。基本構造が自動で生成されるためです。

### 空のファイルを作成する

Xcode 左側の Navigator 領域で、空白部分またはフォルダを右クリックし、`New Empty File` を選択します。

操作する場所は次のとおりです：

![xcode](../../../Resource/027_view1.png)

空のファイルを作成すると、Xcode は通常、`Untitled.swift` のような名前のない Swift ファイルを生成します。

これを `TestView.swift` に名前変更できます。

SwiftUI プロジェクトでは、このファイルをビューの表示に使う場合、通常は名前の末尾に `View` を付けることをおすすめします。

例：

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

これは強制的なルールではありませんが、一目でビュー用ファイルだと分かりやすくなります。

空のファイルを作成した後、ファイル内にはデフォルトのコメントだけがある場合もあれば、空白の場合もあります。これは Xcode のバージョンや作成方法によって異なります。

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

このとき、SwiftUI のコードを手動で書く必要があります：

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

これで、シンプルな SwiftUI ビューファイルの作成が完了します。

### ファイル名を変更する

ファイルを作成した後にファイル名を変更したい場合は、Xcode 左側の Navigator 領域でファイルを選択し、Return キー `⏎` を押します。

![xcode](../../../Resource/027_view2.png)

これでファイル名を変更できます。

注意が必要なのは、ファイル名を変更しても、コード内のビュー名は自動では変更されないという点です。

たとえば、ファイル名を `ProfileView.swift` に変更した後も、コード内では `struct TestView: View` のままになっている可能性があります。

これで必ずエラーになるとは限りませんが、混乱しやすくなります。

そのため、ファイル名とビュー名は一致させることをおすすめします。たとえば、ファイル名が `ProfileView.swift` なら、ビュー名にも `ProfileView` を使います。

## SwiftUI テンプレートファイルを作成する

空のファイルを作成する以外に、SwiftUI テンプレートファイルを直接作成することもできます。

Xcode 左側の Navigator 領域で、空白部分またはフォルダを右クリックし、`New File from Template...` を選択します。

操作する場所は次のとおりです：

![xcode](../../../Resource/027_view3.png)

表示されたウィンドウの上部で、`iOS`、`macOS` など、異なるプラットフォームを選択できます。

ここでは、現在のプロジェクトに対応するプラットフォームを選んだままで構いません。たとえば、iOS App を作成している場合は、`iOS` を選択します。

![xcode](../../../Resource/027_view4.png)

次に、下の一覧から `SwiftUI View` を選択します。

![xcode](../../../Resource/027_view12.png)

その後、`Next` をクリックし、ファイル名を入力して保存します。

たとえば、`Test2View.swift` を作成します。

Xcode は、次のようなコードを自動生成します：

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

空のファイルと比べると、テンプレートファイルには `import SwiftUI`、`struct`、`body`、`#Preview` が自動で含まれます。

そのため初心者にとって、SwiftUI テンプレートファイルを使う方が簡単で、コードの書き忘れも起こりにくくなります。

**ヒント**：右クリックでファイルを作成する以外にも、Xcode 左側の Navigator 下部にあるプラスボタンをクリックして、ファイルやフォルダを作成できます。

![xcode](../../../Resource/027_view5.png)

## フォルダを作成する

ファイルが増えてきたら、フォルダを使って管理できます。

Xcode 左側の Navigator 領域で、空白部分またはフォルダを右クリックし、`New Folder` を選択します。

フォルダを作成した後、関連するファイルをフォルダ内にドラッグできます。

![xcode](../../../Resource/027_view7.png)

フォルダは主にプロジェクト構造を整理するために使われ、ビュー自体の使い方は変わりません。

ビュー名が正しければ、他のファイルでも引き続き `TestView()`、`Test2View()` のように使用できます。

## ファイルまたはフォルダを削除する

ファイルまたはフォルダを削除したい場合は、Xcode 左側の Navigator 領域で対象のファイルを選択し、右クリックして `Delete` を選択します。

ファイルを選択した後、Delete キー `⌫` を押すこともできます。

Xcode は削除確認ウィンドウを表示します。

![xcode](../../../Resource/027_view10.png)

`Move to Trash` を選択すると、ファイルをゴミ箱に移動することを意味します。

`Remove Reference` が表示される場合、それは Xcode プロジェクトから参照だけを削除し、ディスク上の元のファイルは削除しないことを意味します。

初心者の場合、自分で作成したばかりの通常のファイルを削除するだけなら、通常は `Move to Trash` を選べば十分です。

## 複数の SwiftUI ビューを表示する

ファイルの作成方法を学んだ後は、異なるビューを別々のファイルに分けられます。

たとえば、2 つの SwiftUI ファイルを作成します：

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` は作者名を表示するために使います：

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` はカード背景を表示するために使います：

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

その後、`ContentView` の中でこの 2 つのビューを使用できます：

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

実行すると、`CardView` と `AuthorView` が組み合わされて一緒に表示されることが分かります：

![xcode](../../../Resource/027_view11.png)

この表示では、`CardView` が背景として使われ、`AuthorView` が上に表示されます。これは、これらが `ZStack` の中に配置されているためです。

`ContentView` の中では、`CardView()` と `AuthorView()` を通じてこの 2 つのビューを使用しています。名前の後ろにある `()` は、このビューを作成して使用することを表します。

これが SwiftUI でよく使われるビューのネストです。1 つのビューの中で、他のビューを続けて使用できます。

## エントリーファイル

最後に、App がどこから画面表示を開始するのかを振り返ります。

SwiftUI プロジェクトには、通常エントリーファイルがあります：

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

ここでの `@main` は、これが App の入口であることを表します。

`WindowGroup` の中を見ると：

```swift
ContentView()
```

これは、App 起動後に最初に `ContentView` を表示するという意味です。

そして `ContentView` の中では、さらに次の内容が表示されます：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

そのため、ビュー階層は次のように理解できます：

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

エントリーファイルで表示するビューを `CardView` に変更した場合：

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

すると、App 起動後は `CardView` だけが表示されます。

つまり、エントリーコード内の `WindowGroup` が、App 起動後に最初に表示するビューを決定します。

そして、そのビューの内部では、さらに他のビューを表示できます。

## まとめ

このレッスンでは、Xcode でよく使うファイル管理操作を学びました。

SwiftUI ファイルの作成方法、ファイル名の変更方法、フォルダの作成方法、そしてファイルの削除方法を確認しました。

同時に、重要な概念も学びました。SwiftUI のビューは異なるファイルに分け、その後ほかのビューの中で使用できます。

例：

```swift
ZStack {
    CardView()
    AuthorView()
}
```

ここでの `CardView()` と `AuthorView()` は、`ContentView` の中で他のビューを使用している例です。

最後に、エントリーファイルの表示ロジックも振り返りました。

App が起動すると、まず `@main` マークが付いたエントリーコードに入り、その後 `WindowGroup` の中のビューを表示します。

これにより、異なる SwiftUI ファイルは孤立しているのではなく、互いに組み合わせることができ、最終的に完全な App 画面を形成するのだと理解できます。
