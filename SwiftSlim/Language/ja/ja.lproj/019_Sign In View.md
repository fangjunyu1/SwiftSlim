# サインインビュー

このレッスンでは、とても実用的な場面であるサインインビューについて学びます。

Web サイトでもアプリでも、利用中にはユーザーがアカウントにサインインしてパスワードを入力する必要がある場面がよくあります。

例えば、GitHub のサインインページです。

![WordPress](../../Resource/019_github.png)

このレッスンでは、ユーザーがアカウントとパスワードを手動で入力し、入力内容に問題があるかどうかを確認できる、これに似たサインインビューを作成します。

## 上部レイアウト

サインインビューのコードは `ContentView` ファイルに書いていきます。

まずは、サインインビュー上部の識別エリアを作成します。適切なアイコン画像をあらかじめ用意して、`Assets` フォルダに入れておいてください。

![icon](../../Resource/019_icon1.png)

次に、`Image` とモディファイアを使って画像を表示します。

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

これらのモディファイアの意味は次の通りです。

- `resizable()`: 画像のサイズを変更できるようにします。
- `scaledToFit()`: 画像の元の比率を保ったまま拡大縮小します。
- `frame(width: 100)`: 画像の表示幅を `100` に設定します。

続いて、`Text` とモディファイアを使ってサインインタイトルを表示します。

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

その後、`VStack` を使って画像と文字を縦方向に並べます。

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

実行結果：

![view](../../Resource/019_view.png)

ここまでで、サインインビュー上部のタイトルエリアが完成しました。

### レイアウトを最適化する

今のところ、画像とタイトルはデフォルトで全体レイアウトの中央付近にあります。

これらをより「ページ上部のサインイン目印」のように見せたい場合は、`Spacer()` を使って残りの空間を広げ、内容が上に近い位置に表示されるようにできます。

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

実行結果：

![view](../../Resource/019_view1.png)

ただし今度は、`Image` と `Text` が画面上部に近すぎて、少し窮屈に見えます。

このときは、`padding` を使って `VStack` 全体に上側の余白を追加できます。

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

実行結果：

![view](../../Resource/019_view2.png)

こうすると、ページ上部のタイトルエリアがより自然に見えるようになります。

## ユーザー名とパスワード

サインインページでは、通常ユーザーがユーザー名とパスワードを入力する必要があります。

SwiftUI では、ユーザーが入力した内容を受け取るために `TextField` を使えます。

ただし注意点があります。`TextField` 自体は入力データを長期的に保持するわけではなく、単なる入力コントロールです。実際に入力内容を保存するのは、それにバインドした変数です。

そのため、まずはユーザー名とパスワードを保存する 2 つの `@State` 変数を作成する必要があります。

```swift
@State private var user = ""
@State private var password = ""
```

`@State` 変数の値が変わると、SwiftUI は関連するビューを自動的に更新します。

続いて、`TextField` を使ってこの 2 つの変数をバインドします。

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

ここで `$user` と `$password` は「バインディング」を表します。

つまり、ユーザーが入力欄に文字を入力すると変数も同時に変化し、変数が変化すると入力欄に表示される内容も同時に変わります。

このように「ビューとデータが互いに同期する」関係をバインディングと呼びます。

ここでは `$` を付けた書き方を使う必要があることに注意してください。

```swift
$user
```

なぜなら `TextField` が必要としているのは普通の文字列ではなく、「双方向にデータを変更できる」バインディング値だからです。

### 入力欄を表示する

これらを `ContentView` に入れてみましょう。

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

表示結果：

![view](../../Resource/019_view3.png)

今の `user` と `password` はどちらもデフォルトで空文字列なので、

```swift
""
```

入力欄には最初にプレースホルダー文字列が表示されます。例えば：

```swift
input user
```

この文字列は「ここに何を入力すべきか」をユーザーに示すだけで、実際の入力内容ではありません。

### 入力欄を最適化する

これで入力欄は使えるようになりましたが、デフォルトの見た目は比較的シンプルです。

画面をより分かりやすくするために、入力欄の前にタイトルを追加し、入力欄自体にも少しだけスタイル調整を加えることができます。

例えば、まずタイトルを追加します。

```swift
Text("Username")
    .fontWeight(.bold)
```

次に、`HStack` を使ってタイトルと入力欄を同じ行に配置します。

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

ここで `HStack` を使うのは、「左側にタイトル、右側に入力欄」を表示したいからです。

なお、`TextField` はデフォルトで残りの利用可能なスペースを占有します。

![color](../../Resource/019_view6.png)

2 つの入力欄の大きさをより揃えて見せるために、`frame(width:)` を使って幅を設定すると、入力欄がより整って見えます。

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

さらに、入力欄をより目立たせるために枠線も追加します。

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

では、ユーザー名とパスワードの両方を `ContentView` に追加してみましょう。

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

表示結果：

![view](../../Resource/019_view4.png)

ここまでで、ユーザーはユーザー名とパスワードを入力できるようになりました。

## サインインボタン

次に、入力欄の下にサインインボタンを追加します。

```swift
Button("Sign in") {

}
```

その後、`buttonStyle` を使ってボタンにより目立つシステムスタイルを追加します。

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

表示結果：

![view](../../Resource/019_view5.png)

ボタンが本当にタップに反応することを確認するために、まずはボタンの中に `print` を書いてテストできます。

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

ボタンをタップすると、コンソールに次のように表示されます。

```swift
click Sign in
```

これで、ボタンがタップ操作に正しく反応していることが分かります。

## サインインロジック

次に、サインインボタンに最も基本的な検証ロジックを追加します。**ユーザーがユーザー名とパスワードを入力したかどうかを確認する**というものです。

実現したいのは次のような状況です。

- ユーザーが何も入力していない場合は `Empty` を出力する
- どちらか一方だけ入力している場合は、何が足りないかを知らせる
- ユーザー名とパスワードの両方が入力されている場合は `Success` を出力する

### 何も入力されていない場合

`user` と `password` はどちらもデフォルトで空文字列なので、

```swift
@State private var user = ""
@State private var password = ""
```

ユーザーが何も入力しなければ、そのまま空のままです。

Swift では、`String` のような型は `isEmpty` を使って内容が空かどうかを判断できます。

### isEmpty プロパティ

`isEmpty` は、文字列や配列などの内容が空かどうかを確認するためによく使われます。

例えば：

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

内容が空なら `isEmpty` は `true` を返し、空でなければ `false` を返します。

そのため、ユーザー名やパスワードに入力内容があるかどうかを判断するのに使えます。

### isEmpty で変数を確認する

ユーザーが何の情報も入力していない場合は、

```swift
user.isEmpty // true
password.isEmpty    // true
```

このとき、条件は次のように書けます。

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

このコードは、「`user` が空で、かつ `password` も空なら、次を出力する」という意味です。

```swift
Empty
```

ここでの `&&` は論理演算子で、「かつ」を意味します。

つまり、左側の条件が成り立ち、さらに右側の条件も成り立つときにだけ、全体の条件が成り立ちます。

したがって、このコードはユーザー名とパスワードの両方が空のときだけ実行されます。

## ユーザーが一部だけ入力した場合

次に、別の状況を考えてみましょう。ユーザーがユーザー名だけを入力した、またはパスワードだけを入力した場合です。

例えば：

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

このとき、ユーザー名は空ではありませんが、パスワードは空です。

引き続き `isEmpty` を使って確認できます。

### ユーザーがアカウントまたはパスワードを入力した場合

ユーザーがユーザー名だけ、またはパスワードだけを入力した場合には、何が足りないかを対応するメッセージで知らせる必要があります。

例えば、ユーザー名だけを入力した場合は次のように書けます。

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

このコードのロジックは、「ユーザー名が空ならユーザー名の入力を促す。そうでなければ、パスワードが空かどうかを確認し、空ならパスワードの入力を促す」というものです。

### ユーザーがすべての情報を入力した場合

ユーザー名とパスワードの両方がすでに入力されていれば、`isEmpty` は両方に対して `false` を返します。

このとき、次のように書けます。

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

ここでの `!` は「否定」を意味します。

例えば：

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

つまり、`user.isEmpty` は「ユーザー名が空かどうか」を判断するために使い、`!user.isEmpty` は「ユーザー名が空ではないかどうか」を判断するために使います。

パスワードも同じロジックです。

したがって、このコードの意味は「ユーザー名が空ではなく、パスワードも空ではない」ということです。

この 2 つの条件が両方とも成り立つと、出力は次のようになります。

```swift
Success
```

## 完全な検証ロジック

では、この 3 つの状況を組み合わせて `Button` の中に書いてみましょう。

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

このコードの実行順序は次のように考えられます。

まず最初に、次を確認します。

```swift
if user.isEmpty && password.isEmpty
```

ユーザー名とパスワードが両方とも空であれば、すぐに `Empty` を出力します。

両方とも空ではない場合は、次の行を確認します。

```swift
else if user.isEmpty || password.isEmpty
```

ここでの `||` は「または」を意味します。

つまり、条件のうちどれか 1 つでも成り立てば、全体の条件が成り立ちます。

そのため、ユーザー名が空、またはパスワードが空であれば、`else if` のコードブロックが実行されます。

コードブロックに入ったあとで、どの入力欄が埋まっていないのかをさらに確認します。

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

前の 2 つの条件がどちらも成り立たない場合は、ユーザー名が空ではなく、パスワードも空ではないことを意味します。

その場合、プログラムは最後の `else` に入ります。

```swift
print("Success")
```

これで、最も基本的なサインイン入力の検証ロジックが完成します。

## ユーザー名とパスワードの検証

上のロジックが確認しているのは、「入力内容があるかどうか」だけです。

しかし実際のアプリでは、内容を入力するだけでは十分ではありません。通常は、ユーザー名とパスワードをサーバーに送って検証する必要があります。

サーバーがユーザー名の存在とパスワードの正しさを確認できればサインインを許可し、そうでなければサインイン失敗を知らせます。

この流れを練習するために、まずコード内に一時的なアカウントとパスワードを設定して、「正しいサインイン情報」をシミュレートしてみましょう。

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

ユーザー名とパスワードの両方が空でないとき、次にそれらが正しいかどうかを比較します。

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

ここでの `==` は「等しいかどうか」を意味します。

例えば：

```swift
user == userID
```

これは、ユーザーが入力したユーザー名が、こちらで設定した正しいユーザー名と完全に一致しているかどうか、という意味です。パスワードの確認も同じロジックです。

そのため、入力したユーザー名とパスワードが設定値と一致していれば `Success` を出力し、どちらか 1 つでも一致しなければ `Input error` を出力します。

これで、簡単な「模擬サインイン検証」が完成しました。

まだ実際にサーバーへ接続する本物のサインイン機能ではありませんが、それでも十分に理解の助けになります。**ボタンがタップされたあと、条件に応じて異なるコードを実行できる**ということです。

## まとめ

このレッスンでは、基本的なサインインビューを完成させ、特に「条件に応じて入力内容を判断するロジック」について学びました。

このレッスンの中心となる内容は、`isEmpty` を使って文字列が空かどうかを判断すること、そして `if` 文を論理演算子と組み合わせてさまざまな状況を処理することです。

その中でも特に重要な論理演算子が 2 つあります。

- `&&`: 「かつ」を表し、両方の条件が満たされる必要があります
- `||`: 「または」を表し、どちらか 1 つの条件が満たされれば十分です

これらの条件が最終的に `true` または `false` を返すと、`if` 文はその結果に応じて異なるコードを実行します。

このサインインビューを通して、私たちはすでに「画面 + データ + 論理判断」を組み合わせた開発方法に触れ始めています。

## 完全なコード

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
