# 貯金箱の金額を保存する

前のレッスンでは、シンプルな「貯金箱」を実装しました。このレッスンでは、「貯金箱」の金額を永続化して保存する方法を学びます。

このレッスンでは主に UserDefaults と `@AppStorage` プロパティラッパーを学び、あわせて `onAppear` の役割と Optional 型（nil）の使い方も拡張して説明します。

注意点として、このレッスンでは前のレッスンで作成した「貯金箱」のコードを引き続き使います。

## 永続保存の問題

今の「貯金箱」の画面はとてもシンプルで、使い方も分かりやすいです。

![Piggy Bank](../../Resource/014_view.png)

しかし、明らかな問題があります。ビューを更新したりアプリを閉じたりするたびに、「貯金箱」の合計金額は 0 に戻り、それまでの合計金額がすべて失われてしまいます。

つまり、データは本当に保存されていません。言い換えると、今の「貯金箱」は一時的なデータしか保持できません。

### なぜ永続保存できないのか？

その理由は、`@State` で宣言した変数を使っているからです。

```swift
@State private var amount = 0
```

`@State` で宣言した変数のライフサイクルは、完全にビューに依存しています。

ビューが作成されるときに `amount` は 0 で初期化され、ビューが破棄されると `amount` も破棄されます。

ここで `amount` が保持しているデータはメモリ内にしか存在せず、デバイスには保存されていません。

私たちは `amount` をビューのライフサイクルに縛り付けたくないので、データの永続保存を実装する必要があります。つまり、データをデバイスに保存する必要があります。

### 「データ永続化」とは何か

データ永続化は、「一時メモリ」にあるデータを「デバイスの保存領域」に保存することだと考えられます。

ビューやアプリを閉じても、データは失われません。

Swift 開発では、簡単な「データ永続化」には UserDefaults を使えます。より複雑なデータは SwiftData や CoreData を使って実現します。

このレッスンでは、まず最も簡単な UserDefaults を学びます。

## UserDefaults

UserDefaults は軽量なキーと値のデータを保存するために使われ、String、Int、Double、Bool などの基本型を保存するのによく使われます。

### データを保存する

UserDefaults は `set` メソッドでデータを保存します。

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

UserDefaults の最初の引数は保存するデータで、ここでは String や Int などの型のデータを渡しています。

2 番目の引数 `forKey` は変数名のようなもので、UserDefaults に保存したデータを識別するために使われます。

### データを読み取る

UserDefaults は対応するメソッドで読み取ります。

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

読み取るときは対応する型のメソッドを使う必要があります。そうしないとエラーになったり、正しいデータが得られなかったりします。

### UserDefaults の注意点

#### 1. Optional 型を返す

UserDefaults でデータを読み取るとき、一部のメソッドは Optional 型を返します。

例えば：

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

この `name` の型は次のとおりです。

```swift
String?
```

これは、値があるかもしれないし、ないかもしれないという意味です。

**なぜ Optional 型を返すのか？**

それは、UserDefaults 内のある Key に対応するデータが必ず存在するとは限らないからです。

例えば：

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

もし以前に `"City"` という Key を一度も保存していなければ、読み取り結果は次のようになります。

```swift
nil
```

強調しておきたいのは、`nil` はデータがないことを表しており、空文字列ではないということです。

「型システム」のレッスンでも似た状況がありました。型変換が失敗すると Optional 型が返されます。

このときは、`??` を使ってデフォルト値を与え、アンラップします。

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

UserDefaults からデータを読めたときはその値を使い、読めなかったとき（nil）はデフォルト値を使います。

#### 2. Optional ではない型を返す

UserDefaults は Int、Double、Bool 型を読むとき、Optional ではない型を返します。

例えば：

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

これらの Key が一度も保存されていなくても、返り値は nil にはなりません。

代わりに、次のデフォルト値が返ります。

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. データ量の制限

UserDefaults は、アプリ設定や簡単な状態のような少量データの保存にのみ適しています。

実際の開発では、大量のデータや頻繁に読み書きするデータの保存には向いていません。

## 「貯金箱」の金額を保存する

これで UserDefaults を使って、「貯金箱」の合計金額を保存するコードロジックを実装できます。

ユーザーがボタンをタップしたとき、入力した金額を合計金額に加算し、その合計金額を UserDefaults に保存します。

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

これで、データを書き込むロジックは実装できました。

## データ永続化ロジックの説明

ここまででデータ永続化の書き込みロジックは完成していますが、実際に動かしてみると、ビューを更新したりアプリを再度開いたりするたびに `amount` 変数は依然として 0 のままです。

その理由は次のとおりです。

```swift
@State private var amount = 0
```

SwiftUI では、`@State` 変数はビュー作成時に再初期化されます。

UserDefaults に `amount` の値が保存されていても、ビューが再ロードされると `amount` は 0 にリセットされます。

これは、今の状態ではデータを UserDefaults に保存しただけで、ビュー側でデータを復元していないことを意味します。

そのため、ビューが読み込まれたときに UserDefaults からデータを読み取り、`amount` に再代入する必要があります。そうして初めて、データ永続化のロジック全体が完成します。

### ロジックのたとえ

この流れは「教室の黒板」にたとえることができます。

授業中、先生は内容を黒板に書きます。この内容は現在のビューの状態（`@State`）のようなものです。

授業が終わると黒板は消され、次の授業の準備をします。これはビューが破棄され、`@State` のデータも消えることに相当します。

内容が失われないように、先生は事前に教材へ保存します。この教材が、UserDefaults に保存したデータに相当します。

次の授業が始まると、黒板は最初空です（`@State` の初期化）。先生は教材の内容をもとに、以前の内容を再び黒板に書き戻す必要があります（UserDefaults の読み取り）。

大切なのは、黒板が自動的に以前の内容を復元するわけではなく、必ず「教材を読む」（UserDefaults を読む）ことで再度書き込む必要があるという点です。

## onAppear を使ってデータを読む

ビューが表示されるとき、UserDefaults の値を手動で読み取り、`@State` の `amount` に代入する必要があります。これによって本当のデータ永続化が実現します。

SwiftUI では、`onAppear` を使ってビュー表示時に初期化ロジックを実行できます。

```swift
.onAppear {}
```

UserDefaults を読むコードを `onAppear` の中に置きます。

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

ビューが作成されたとき、`amount` は 0 で初期化されます。ビューが表示されると `onAppear` が発火し、UserDefaults から値を読み取って `amount` に代入します。こうして、ビューに前回保存した合計金額を表示できます。

これで、「貯金箱」のデータ永続化ロジック全体が完成しました。

## 完全なコード

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage` プロパティラッパー

SwiftUI には `@AppStorage` プロパティラッパーがあり、UserDefaults の保存ロジックを簡潔にできます。

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` は UserDefaults のラッパーで、`"amount"` は UserDefaults の Key に対応します。

ビューが作成されるときに UserDefaults からデータを読み取り、変数の値が変化すると自動的に UserDefaults に書き込みます。

SwiftUI の状態更新の仕組みに対応しており、`@State` と同じように、値が変わると SwiftUI のビューも更新されます。

つまり、`@AppStorage` はデータの読み取りと保存を同時に実現できるので、手動で UserDefaults を呼び出す必要も、`onAppear` で手動読み込みを行う必要もありません。

そのため、コード中の UserDefaults を `@AppStorage` に置き換えることができます。

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## まとめ

このレッスンでは主に次の内容を学びました。

まず、UserDefaults は軽量なデータを保存するために使われます。私たちは UserDefaults を使って合計金額をデバイスに保存しました。UserDefaults には読み取り・書き込みメソッドがあり、Optional 型の扱いも必要になります。

次に、`@State` 変数はビュー内の一時的な状態を管理するだけで、そのライフサイクルはビューと一致します。ビューが再作成されると、`@State` も再初期化されます。

UserDefaults のデータを復元する際には、`onAppear` を使ってビュー表示時に UserDefaults を読み込み、データ復元を行う方法を学びました。

最後に、`@AppStorage` を使って UserDefaults を置き換え、ビュー読み込み時の自動読み取りと、データ変化時の自動書き込みを実現することで、手動で UserDefaults と `onAppear` を呼び出すロジックを置き換えました。

これらの知識によって、基本的な App のデータ保存機能を実装し、データを永続化できるようになります。

## 練習問題

現在、「貯金箱」は金額の保存に対応しましたが、機能としてはまだ不完全です。

1. ユーザーがお金を取り出したい場合は、それに対応する出金ロジックも設計する必要があります。
2. ユーザーが金額を空にしたい場合は、リセットロジックも実装する必要があります。
3. 貯金箱に名前を付けたい場合は、String 型のデータ保存も追加する必要があります。

既存の内容をもとにこれらの機能を改善し、「貯金箱」をより完成度の高いものにしてみてください。

## 拡張知識 - 入力欄のデフォルト値の問題

ここで、入力欄の操作性をさらに改善して、入力をより便利にすることもできます。

![textfield](../../Resource/015_view.png)

現在の実装では、入力欄のデフォルト値は 0 です。ユーザーは毎回 0 を削除してから新しい数値を入力する必要があり、この操作体験はあまり良くありません。

入力欄の初期値は 0 ではなく、空にするべきです。

その理由は、TextField と `number` が双方向にバインドされているからです。

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

`number` が 0 で初期化されると、入力欄にも 0 が表示されます。

そのため、`number` を空値、つまり `nil` にする必要があります。

```swift
@State private var number = nil
```

すると、次のエラーが発生します。

```
Generic parameter 'Value' could not be inferred
```

これは「型システム」で学んだケースです。変数の型を自動推論できない場合は、変数型を明示的に宣言する必要があります。

`number` を `nil` にしたため、`nil` 自体には型情報がなく、コンパイラはこの変数が String なのか Int なのか、あるいは別の型なのか判断できず、エラーになります。

そのため、`number` の型を明示的に宣言する必要があります。

```swift
@State private var number:Int? = nil
```

ここでの `Int?` は Optional 型を表し、`number` の値が Int である場合も `nil` である場合もあることを示します。

こうすると、初期値を `nil` に設定でき、入力欄は 0 ではなく空で表示されます。

### Optional 型をアンラップする

`number` を Optional 型に変更すると、元の計算コードはエラーになります。

```swift
amount += number
```

表示されるメッセージ：

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

これは、`number` が `nil` かもしれないためです。もしそのまま計算に使うと、次のようになります。

```swift
amount += nil
```

明らかに、`nil` は `amount` と加算できないため、不正な操作になります。

そのため、Optional 型を計算に使う前には、まずアンラップが必要です。

ここでは `??` を使ってデフォルト値を与えられます。

```swift
amount += number ?? 0
```

`number` が `nil` のときはデフォルト値 0 を使い、値があるときは実際に入力されたデータを使います。

これによって計算の正しさを保ちつつ、入力欄のデフォルト値を空にできるため、ユーザーは毎回 0 を削除する必要がなくなります。

## 拡張コード

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
