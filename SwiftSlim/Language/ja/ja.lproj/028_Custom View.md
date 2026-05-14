# カスタム View

このレッスンでは、SwiftUI で非常に重要な書き方である **カスタム View** を学びます。

カスタム View は、繰り返し使われる View コードをまとめて、何度も再利用できる View にすることができます。

実際に App を開発していると、よくこのような場面に出会います。多くの画面は構造が同じで、表示する内容だけが異なるという場面です。

たとえば、フォーラムサイトの投稿一覧では、それぞれの投稿にタイトル、画像、いいね数などの情報があるかもしれません。

![Reddit](../../../Resource/028_view1.png)

ショッピングサイトの商品一覧では、それぞれの商品に画像、名前、価格などの情報があるかもしれません。

![Amazon](../../../Resource/028_view2.png)

これらの内容は構造が似ていて、違うのは表示するデータだけです。

もし各項目をすべて手動で書くと、コードはとても長くなり、あとから修正するのも不便になります。

そこで、同じ構造をカスタム View としてまとめ、異なる内容をパラメータとして渡すことができます。

こうすることで、同じ View で異なる内容を表示できます。

## 必要な場面

たとえば、今から設定リストを作るとします。

表示結果：

![view](../../../Resource/028_view.png)

この設定リストには、`設定`、`フォルダ`、`音楽` という 3 つの異なる設定項目があります。

それぞれのアイコン、色、タイトルは異なりますが、全体の構造は同じです。

- 左側のアイコン
- アイコンの背景色
- 中央のタイトル
- 右側の矢印

カスタム View を使わない場合、次のように書くことになります。

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("設定")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("フォルダ")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("音楽")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

このコードは正常に表示できますが、問題もはっきりしています。3 つの設定項目のコードがほとんど同じです。

異なるのは、アイコン、色、タイトルだけです。

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("設定")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("フォルダ")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("音楽")
```

つまり、各設定項目の構造は固定されていて、アイコン、色、タイトルだけが異なります。

このような場面は、カスタム View を使うのにとても適しています。

### 影 shadow

ここでは、新しい modifier `.shadow(radius:)` を使っています。

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` は View に影を追加できます。

`radius` は影のぼかし半径を表します。値が大きいほど、通常は影の広がりが大きくなり、より柔らかく見えます。

ここでは `1` に設定しており、とても軽い影だけを追加するという意味です。

## 設定項目 View をまとめる

次に、それぞれの設定項目を新しい View としてまとめます。

`SettingItemView` を作成できます。

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

この View では、3 つのプロパティを定義しています。

```swift
let icon: String
let color: Color
let title: String
```

それぞれの意味は次のとおりです。

- `icon` はアイコン名を表します
- `color` はアイコンの背景色を表します
- `title` は設定項目のタイトルを表します

この 3 つの内容は設定項目ごとに異なるため、外部から渡せるパラメータにします。

## カスタム View を使う

`SettingItemView` ができると、長い `HStack` コードを何度も書く必要がなくなります。

これで次のように使えます。

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

この 1 行は、設定項目 View を作成し、3 つのパラメータを渡すことを表しています。

```swift
icon: "gear"
color: Color.blue
title: "設定"
```

渡したあと、`SettingItemView` 内部のプロパティには、それぞれ対応する値が入ります。

- `icon` の値は `gear` です
- `color` の値は `Color.blue` です
- `title` の値は `"設定"` です

そのため、View 内部の `Image(systemName: icon)` は歯車アイコンを表示し、`.background(color)` は青色の背景を使い、`Text(title)` は `設定` を表示します。

完全なコード：

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "設定")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "フォルダ")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "音楽")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

表示結果：

![view](../../../Resource/028_view.png)

まとめたあとも表示結果は以前と同じですが、コードはより分かりやすくなっています。

以前は、各設定項目ごとに `HStack` 全体を書く必要がありましたが、今は 1 行のコードだけで済みます。

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

これがカスタム View の役割です。**繰り返し使われる View 構造をまとめ、異なる内容だけをパラメータとして渡します。**

## なぜパラメータを渡せるのか

次に、なぜカスタム View にパラメータを渡せるのかを簡単に理解していきます。

SwiftUI では、View は本質的には構造体です。

たとえば：

```swift
struct ContentView: View {
    var body: some View {
        Text("こんにちは、世界！")
    }
}
```

ここでの `ContentView` は構造体です。

次のように書くと：

```swift
ContentView()
```

実際には `ContentView` という View を作成しています。

後ろの `()` は初期化メソッドを呼び出していることを表しており、この View を作成していると理解することもできます。

この `ContentView` には外部から渡す必要のあるプロパティがないため、直接次のように書けます。

```swift
ContentView()
```

しかし、View の中に値が設定されていないプロパティがある場合は、View を作成するときに対応する値を渡す必要があります。

たとえば：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("名前: \(name)")
    }
}
```

ここでの `name` はプロパティであり、デフォルト値がありません。

そのため、`ContentView` を作成するときには、`name` に具体的な値を渡す必要があります。

```swift
ContentView(name: "Fang Junyu")
```

こうすることで、View の内部でこの値を使えるようになります。

```swift
Text("名前: \(name)")
```

これが `SettingItemView` を作成するときにパラメータを渡す必要がある理由でもあります。

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

`SettingItemView` には、デフォルト値のない 3 つのプロパティがあるからです。

```swift
let icon: String
let color: Color
let title: String
```

そのため、この View を作成するときには、それらの値を渡す必要があります。渡されたパラメータは、Swift によって View 内部のプロパティへ代入されます。

## 初期化メソッド

次に、初期化メソッドについてもう少し理解していきます。

### デフォルトの初期化メソッド

通常の View を定義するとき：

```swift
struct ContentView: View {
    var body: some View {
        Text("こんにちは、世界！")
    }
}
```

このコードでは、初期化メソッドを手動で書いていません。

しかし、この View を使うときには、次のように書けます。

```swift
ContentView()
```

ここでの `()` は、実際には `ContentView` を作成していることを意味し、初期化メソッドを呼び出していると理解することもできます。

### 初期化メソッドが見えないのに呼び出せる理由

Swift コンパイラが自動的に初期化メソッドを生成してくれるからです。

注意したいのは、**この初期化メソッドは自動生成されるため、通常はコード内で直接見ることはありません。**

つまり、`struct` の中に手動で次のように書いていなくても：

```swift
init() {

}
```

Swift コンパイラは内部で、次のような初期化メソッドを自動的に生成してくれます。

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("こんにちは、世界！")
    }
}
```

だから次のように直接書けます。

```swift
ContentView()
```

そのため、実際のコードでは通常、初期化メソッドを手動で書く必要はありません。

理解しておきたいのは 1 点だけです。**SwiftUI View を作成するときは、その View の初期化メソッドが呼び出されます。初期化メソッドを手動で書いていなくても、Swift が自動生成してくれる場合があります。**

### パラメータ付きの初期化メソッド

View の中にデフォルト値のないプロパティがある場合、たとえば：

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("名前: \(name)")
    }
}
```

Swift コンパイラは、そのプロパティに基づいて、パラメータ付きの初期化メソッドを自動生成します。

簡単には、次のようなものだと理解できます。

```swift
init(name: String) {
    self.name = name
}
```

ここで：

```swift
init(name: String)
```

は、`ContentView` を作成するときに `String` 型の `name` パラメータを渡す必要がある、という意味です。

次のように書くと：

```swift
ContentView(name: "Fang Junyu")
```

これは `"Fang Junyu"` を初期化メソッドにパラメータとして渡すという意味です。

そして、初期化メソッドの内部では次の処理が実行されます。

```swift
self.name = name
```

このコードは、外部から渡された `name` を、現在の View 自身の `name` プロパティに代入するという意味です。

簡単には次のように理解できます。

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("名前: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

こうすることで、View の内部で渡された値を使えるようになります。

これが、パラメータ付き View の初期化の流れです。**View 内部のプロパティにデフォルト値がない場合、View を作成するときに対応するパラメータを渡し、初期化メソッドがプロパティへの代入を完了します。**

## プロパティにデフォルト値がある場合

プロパティにすでにデフォルト値がある場合は、View を作成するときにパラメータを渡さなくても構いません。

たとえば：

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("名前: \(name)")
    }
}
```

ここで `name` にはすでにデフォルト値があります。

```swift
"Fang Junyu"
```

そのため、`ContentView` を作成するときは、直接次のように書けます。

```swift
ContentView()
```

このとき、`name` はデフォルト値を使用し、画面には次のように表示されます。

```swift
名前: Fang Junyu
```

もちろん、View を作成するときに新しい値を渡すこともできます。

```swift
ContentView(name: "Sam")
```

このとき View はデフォルト値ではなく、外部から渡された `"Sam"` を使用し、画面には次のように表示されます。

```swift
名前: Sam
```

理解しやすいように、Swift コンパイラが自動生成する初期化メソッドを次のように考えることができます。

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

ここで `name: String = "Fang Junyu"` は、View を作成するときに `name` を渡さなければデフォルト値 `"Fang Junyu"` を使い、新しい `name` を渡した場合は渡された値を使う、という意味です。

つまり、**外部からパラメータを渡さなければプロパティのデフォルト値を使い、外部からパラメータを渡した場合は渡された値を使います。**

## SettingItemView に戻る

ここで、もう一度 SettingItemView を見てみましょう。

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

この View の構造は固定されています。

固定されている部分には、次のものがあります。

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

異なる部分には、次のものがあります。

```swift
icon
color
title
```

そのため、異なる内容をプロパティにして、View を作成するときにパラメータとして渡します。

異なる設定項目を作成するときは、異なるパラメータを渡すだけで済みます。

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
SettingItemView(icon: "folder", color: Color.brown, title: "フォルダ")
SettingItemView(icon: "music.note", color: Color.purple, title: "音楽")
```

こうすることで、同じ `SettingItemView` で 3 つの異なる設定項目を表示できます。

これはカスタム View のもっとも一般的な使い方です。

## まとめ

このレッスンでは、カスタム View について学びました。

カスタム View の主な役割は、**繰り返し使われる View コードをまとめて、再利用できるようにすること**です。

この例では、3 つの設定項目の構造は同じで、異なるのはアイコン、色、タイトルだけです。

そのため、`SettingItemView` を作成しました。

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

そして、この View を使うときに異なるパラメータを渡します。

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "設定")
```

ここでのパラメータは `SettingItemView` の内部に入ります。

この方法を使うと、より少ないコードで、構造は同じでも内容が異なる View を作成できます。

これは SwiftUI 開発で非常によく使われる書き方です。
