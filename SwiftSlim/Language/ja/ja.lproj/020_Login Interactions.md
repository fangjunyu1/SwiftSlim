# ログイン操作

前回のレッスンでは、ログインビューを作成し、ボタンと判定ロジックを使って入力内容の簡単な検証を実装しました。

このレッスンでは、前回のコードをベースにして、`SecureField` のパスワード入力欄、`Alert` の警告ボックス、そして変数に応じて異なるビューの表示を制御する方法を学びます。

このレッスンを通して、ログインビューの基本的なインタラクションの流れをさらに理解できるようになります。これは多くのアプリで使われる基本ロジックでもあります。

## パスワード入力欄

前回のレッスンでは、パスワードを入力するために `TextField` を使いました。

しかし実際のログイン画面では、パスワードは通常そのまま表示されず、ドットなどの隠された表示になります。これはユーザーのプライバシーを守るためです。

SwiftUI では、パスワード入力専用のコントロールが `SecureField` です。

たとえば：

```swift
SecureField("Password", text: $password)
```

書き方は `TextField` とよく似ていて、同じようにヒント文字列とバインドされた変数が必要です。

簡単に理解すると、`SecureField` も入力欄の一種ですが、入力された内容を隠して表示するだけです。

これまでパスワード入力に使っていた `TextField` を、直接 `SecureField` に変更できます：

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

ユーザーがパスワードを入力しても、画面上にはその内容が直接表示されなくなります。

表示効果：

![password](../../Resource/020_password.png)

これで、ユーザー名とパスワードを入力し、ボタンをタップしたあとに入力が正しいかどうかを判定できます。

### フィードバックメッセージを表示する

これまで、結果の出力にはずっと `print` を使ってきました。

`print` の内容はコンソールにしか表示されません。開発者は Xcode でプログラムを実行すると見ることができますが、一般のユーザーはスマートフォン上ではそれらのメッセージを見ることができません。

つまり、プログラム側では判定が終わっていても、ユーザーは入力内容が正しいのかどうかを知ることができません。

そこで、画面上に直接メッセージを表示する方法が必要になります。

## Alert 警告ボックス

SwiftUI では、`Alert` を使ってポップアップのメッセージボックスを表示できます。

基本的な使い方：

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

このコードは前に学んだコントロールより少し複雑に見えますが、分けて考えれば理解できます。

`Alert` は主に次の部分で構成されています：

- `"Title"`：警告ボックスのタイトル
- `isPresented`：警告ボックスを表示するかどうかを制御する、バインドされたブール値
- `Button(...)`：警告ボックスのボタン
- `message:`：警告ボックスの中に表示されるメッセージ内容

簡単に言えば、バインドされた変数が `true` になると、システムがこの警告ボックスを表示します。

表示効果：

![alert](../../Resource/020_alert3.png)

対応する構造：

![alert](../../Resource/020_alert.png)

### Alert は修飾子

`Alert` は、これまで学んだ多くの修飾子と同じように、あるビューの後ろに追加します。

たとえば、ボタンの後ろに付けることができます：

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

また、外側の `VStack` の後ろに付けることもできます：

```swift
VStack {
    // ...
}
.alert() {...}
```

つまり、`Alert` は画面の中に単独で置かれるビューではなく、特定のビューに付属する修飾子です。

簡単に理解すると、`Alert` は一般的にボタンや外側のレイアウトの後ろに書き、ある条件が満たされたときにメッセージをポップアップ表示するために使います。

### Alert を表示する

`Alert` を表示したい場合は、それを制御する変数が必要です。

たとえば：

```swift
@State private var showAlert = false
```

この変数は `Bool` 型、つまり値は `true` または `false` の2つだけです。

そしてこれを `Alert` の `isPresented` にバインドします：

```swift
isPresented: $showAlert
```

`showAlert` が `false` のときは警告ボックスは表示されません。`showAlert` が `true` のときに警告ボックスが表示されます。

### ボタンで警告ボックスを表示する

それではまず、最も簡単なケースを実装してみましょう：

ユーザーが何も入力せずに直接 `Sign in` ボタンをタップしたとき、「まだ何も入力していません」と伝えるメッセージボックスを表示します。

まず、このメッセージボックスを制御する変数を作成します：

```swift
@State private var showEmpty = false
```

次に、`Button` の後ろに `Alert` を追加します：

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

続いて、ボタンをタップしたときのコードで判定を行います：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

もし `user` と `password` がどちらも空なら、`showEmpty` を `true` に変更します。

そして `Alert` はこの変数にバインドされているため、それが `true` になるとシステムが自動的に警告ボックスを表示します。

表示効果：

![alert](../../Resource/020_alert1.png)

こうすることで、ユーザーはボタンを押した直後にメッセージを確認でき、開発者がコンソールで `print` の出力を確認する必要はなくなります。

### ボタンと警告ボックスを改善する

ここまでは、「何も入力していない」場合だけを処理していました。

さらに次の状況も処理する必要があります：

- ユーザー名が未入力
- パスワードが未入力
- ユーザー名とパスワードの両方が入力されているが、内容が間違っている

そのため、これらの状況に対応するメッセージも準備する必要があります。

まず、新しく3つの変数を追加します：

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

そして、ボタンの後ろに対応する `Alert` を追加していきます：

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

続いて、ボタン内の判定ロジックを完成させます：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

ボタンが、ユーザーが何も入力していない、一部の情報を入力し忘れている、または入力チェックに失敗したと判断した場合、対応するブール変数を `true` に変更し、その後対応する `Alert` を表示します。

ここでは、いくつかの状況を自分でテストしてみることをおすすめします：

- 何も入力しない
- ユーザー名だけ入力する
- パスワードだけ入力する
- ユーザー名とパスワードの両方を入力するが、内容が間違っている
- ユーザー名とパスワードの両方を入力し、内容も正しい

こうすることで、コードに問題がないか確認できます。これはアプリ開発において非常に重要な「テスト」の工程でもあります。

あるシナリオでプログラムの動作がおかしい場合、それはロジックに問題がある可能性があり、プログラムに `Bug` が発生しているということです。

開発でよく言う `Bug` とは、プログラム中の誤りや欠陥、あるいは期待に合わない動作を指します。

## ログインビューを完成させる

これまで説明してきた `Alert` はすべて、「入力が間違っている」ときにどうやってユーザーにメッセージを伝えるかについてでした。

ユーザーが正しいユーザー名とパスワードを入力した場合、通常は「警告ボックス」を表示するのではなく、そのままログイン後の画面へ進みます。

ここでは非常に重要な知識が関わっています。**変数の値に応じて異なるビューを表示する**ということです。

たとえば：

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

ここでは、ビューの表示管理に `Bool` 型を使っています：

- `login` が `true` の場合は、すでにログイン成功を意味し、ログイン後の内容が表示されます
- `login` が `false` の場合は、ログイン成功していないことを意味し、ログイン画面が引き続き表示されます。

`if` 文は Swift の条件分岐文ですが、SwiftUI の `body` の中ではビューの表示ロジックを制御するために使えます。

つまり、SwiftUI は条件の結果に応じて、現在どのビューを表示すべきかを判断します。

この表示ロジックを、現在の `ContentView` の中に置くことができます：

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

ここでは、ユーザーがログイン成功したかどうかを表すために、新しく `login` という変数を追加しました。

そして、前に書いたログインビューのコードを `else` 文の後ろに置きました。

ビュー表示ロジック：

- `login` が `false` のときは、まだログイン成功していないことを意味するため、元のログインビューを引き続き表示します。
- `login` が `true` のときは、ログイン成功を意味するため、この時点ではログインビューは表示されず、代わりに `Login successful` が表示されます。

つまり、`ContentView` は `login` の値に応じて異なるビュー内容を表示します。

続いて、ボタン内のログイン成功ロジックを修正してみましょう：

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

ユーザーが入力したユーザー名とパスワードの両方が正しければ、`login` を `true` に変更します。

ひとたび `login` の値が変化すると、`ContentView` 内の `if` 判定結果も変わり、画面は元のログインビューから `Login successful` に切り替わります。

表示効果は次のとおりです：

![view](../../Resource/020_view.png)

これで、「条件に応じて異なるビューを表示する」という知識を、実際にこのログインページへ適用できました。

実際のアプリでも、通常はこのような判断方法が使われます。つまり、ある値に応じて異なるビューを表示するというやり方です。

たとえば、ユーザーがログインしていないときはログインページを表示し、ログイン成功後は別の画面を表示します。

中心となる考え方は、**変数の変化によって画面に何を表示するかを制御する**ことです。

## まとめ

このレッスンでは、3つの重要な内容を学びました：

1. `SecureField` を使ってパスワードを入力し、パスワード内容が画面に直接表示されないようにすること。
2. `Alert` を使って、コンソールに出力するだけでなくユーザーにメッセージを表示すること。
3. 変数と `if` 判定を使って異なるビューの表示を制御し、ログイン前後の画面切り替えを実現すること。

これらの知識を学ぶことで、基本的なインタラクション効果を持つログインビューを完成させることができ、さらに SwiftUI における「状態が変われば画面が更新される」という開発の考え方も理解できるようになります。

## 完全なコード

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## 発展知識 - 複数ボタンの Alert

このレッスンの前半では、最も基本的な `Alert` を使いました。ボタンは1つだけで、主にユーザーへ通知するために使われるものでした。

実際には、`Alert` には複数のボタンを含めることもでき、ユーザーに異なる選択をさせることができます。

たとえば：

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

ボタンをタップすると、`Ok`、`delete`、`cancel` の3つの選択肢を持つメッセージボックスが表示されます。

表示効果：

![alert](../../Resource/020_alert2.png)

異なるボタンをタップすると、それぞれ対応するコードが実行されます。

### Button の role プロパティ

ここで気づくと思いますが、`Alert` の中の `Button` は、前に学んだ通常のボタンの書き方と少し違います：

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

ここでは `role` という追加のパラメータがあります。

SwiftUI では、`role` はこのボタンがどの種類の操作に属するのかをシステムに伝えるために使われます。

一般的な role には次のようなものがあります：

- `.cancel`：キャンセル操作
- `.destructive`：削除などの危険な操作
- `nil`：通常の操作

異なる `role` は、通常インターフェース上の見た目にも違いをもたらします。

たとえば、危険な操作はより目立つスタイルで表示されることが多く、ユーザーに注意してタップするよう促します。

さらに、`role` はボタンに追加の意味情報も与えるため、スクリーンリーダー（たとえば Apple デバイスの VoiceOver）がユーザーにボタンの役割を伝えやすくなります。

そのため、適切な場面でボタンに `role` を付けるのはとても良い習慣です。
