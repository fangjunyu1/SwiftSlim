# struct と class

前回の授業では、私たちは `struct` に触れ始めたばかりで、1つの構造体を定義し、さらにプロトコルや `UUID` などの知識も広げて学びました。

今では、`struct` というキーワードについて大まかな理解はできていますが、まだ本当に理解したとは言えません。

この授業では、引き続き `struct` を中心内容として学びながら、あわせて `class` にも触れていきます。この授業を通して、インスタンスとは何か、コンストラクタとは何か、そしてなぜ `struct` と `class` を使ってデータを整理できるのかが、よりはっきり分かるようになります。

## 学生管理システム

たとえば、今私たちは学生管理システムを開発したいとします。各学生には、名前、性別、電話、年齢、住所などの情報があります。

このとき、これらの情報をまとめて、`Student` という構造体として定義できます。

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

ここでは `struct` を使って、学生という型を定義しています。

この `Student` 構造体には、複数のプロパティが含まれています。

- `id`：学生の一意な識別子
- `name`：学生の名前
- `sex`：学生の性別
- `phone`：学生の電話番号
- `age`：学生の年齢
- `address`：住所

このようにして、もともとバラバラだった複数のデータが、1人の完全な「学生」としてまとめられます。

ここでの `Student` は `Identifiable` プロトコルにも準拠しており、`id` フィールドを定義しているので、後で `ForEach` ループと組み合わせてデータを表示しやすくなります。

次に、学生のインスタンスを作ることができます。

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

このコードは、`Student` という構造に従って、具体的な学生データを作成できることを表しています。

ここで、`Student` は型であり、`Student(...)` は作成された1つのインスタンスを表します。

SwiftUI では、このインスタンスを変数に代入してから表示できます。

たとえば：

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

こうすると、ビューの中でこの学生の名前 `Fang Junyu` を見ることができます。

ここでは、まず `Student` のインスタンスを作成し、それを `student` 変数に代入し、最後に `student.name` を通してそのプロパティを読み取っています。

## インスタンスとは何か

`struct` を学び始めたばかりのとき、「インスタンス」という言葉はとても聞き慣れないものに感じるかもしれません。

しかし実際には、私たちは最初からずっとインスタンスを使っています。ただ、以前はそれを特別に意識していなかっただけです。

たとえば：

```swift
let name = "Fang Junyu"
```

ここでの `"Fang Junyu"` は文字列の値であり、本質的には `String` 型のインスタンスです。

これを次のように書くこともできます。

```swift
let name = String("Fang Junyu")
```

この2つの書き方は同じことを表しています。つまり、`String` 型のインスタンスを作り、それを変数 `name` に代入しているのです。

同じように、`Int` についても同じです。

```swift
let num = 3
```

ここでの `3` も、本質的には `Int` 型の値であり、`Int` のインスタンスとして理解することもできます。

つまり、インスタンスは `struct` の中にだけ現れる特別な概念ではありません。

`String`、`Int`、`Double`、`Bool`、あるいは自作の `Student` であっても、どれもインスタンスを作ることができます。

そのため、次のように書くとき：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

本質的には `String` や `Int` のインスタンスを作るのと同じで、ただ `Student` が私たち自身で定義した型であるという違いだけです。

## コンストラクタ

私たちがインスタンスを作るとき：

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

実際には `Student` の初期化メソッド、つまり `init` を呼び出しています。

コンストラクタは次のように理解できます。**インスタンスを作成するときに、プロパティへ値を設定するための入口です。**

つまり、1つのインスタンスが本当に完成する前には、通常まず `init` を通る必要があります。

たとえば、以前 SwiftUI のビューのライフサイクルを学んだとき、私たちは次のようなコードを書きました。

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
    }
}
```

ここで `init()` は `ContentView` のインスタンスが作られるときに実行され、一方 `onAppear` はビューが実際に画面に表示されたときに初めて実行されます。つまり、ビューの作成と表示は同じタイミングではありません。

同じように、`Student(...)` を作るときも、`Student` のコンストラクタを呼び出していることになります。

### システムが自動生成するコンストラクタ

`Student` を定義したとき、私たちは `init` を手動では書いていませんでした。

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

それでも、私たちは直接インスタンスを作ることができます。

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

コンストラクタを書いていないのに、なぜインスタンスを作れるのでしょうか。

それは `struct` の場合、私たちが手動でコンストラクタを書かなければ、システムが通常自動的に適切なコンストラクタを生成してくれるからです。

学習の初期段階では、これは「Swift が初期化コードを自動で補ってくれる」と単純に理解して大丈夫です。

おおまかには、システムが次のようなコードを補ってくれていると考えられます。

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

ここで1つ注意したい細かい点があります。

```swift
let id = UUID()
```

`id` にはすでにデフォルト値があるので、インスタンスを作るときに `id` を改めて手動で渡す必要はありません。

つまり、デフォルト値を持たないプロパティは通常コンストラクタで渡す必要があり、すでにデフォルト値を持っているプロパティは、その元のデフォルト値をそのまま使うことができます。

そのため、`Student` のインスタンスを作るときは、`name`、`sex`、`phone`、`age`、`address` だけを渡せばよいのです。

### コンパイラのヒント

また、Xcode で `Student(...)` と入力すると、システムが出してくれる引数のヒントを見ることもできます。

![student](../../Resource/022_student.png)

これも、現在の型にシステムが自動生成したコンストラクタが本当に存在していることを示しています。

### 自分でコンストラクタを書く

システムはコンストラクタを自動生成できますが、このデフォルトの初期化方法が必ずしも私たちの要件に完全に合うとは限りません。

たとえば、次のような `Movie` 構造体があるとします。

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

システムが自動生成したコンストラクタに従うと、インスタンスを作るときには次の3つの引数を同時に渡さなければなりません。

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

しかし、もし今古い映画をまとめて登録したくて、映画の名前しか分からず、監督や評価が分からない場合は少し不便です。

なぜなら、その場合は次のようにしか書けないからです。

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

これは動きますが、毎回 `--` を繰り返し書くのは便利ではありません。

そこで、自分でコンストラクタを書くことができます。

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

こうすれば、古い映画を作るときには `name` だけを渡せばよくなります。

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

これが自分でコンストラクタを書く意味の1つです。**インスタンスの作り方を、実際の要件により合うようにできることです。**

### カスタムコンストラクタの読み解き

さきほど手書きしたこのコンストラクタを見てみましょう。

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

このコードの意味は、`Movie` のインスタンスを作るときには、`name` という1つの引数だけを渡せばよい、ということです。

そしてコンストラクタの中で、渡された `name` がインスタンス自身の `name` に代入され、`director` と `rating` にはデフォルト値 `--` が与えられます。

ここでの `self` は「この現在のインスタンス自身」を意味します。

たとえば：

```swift
self.name = name
```

左側の `self.name` はインスタンスの中のプロパティを表し、右側の `name` は私たちが渡した引数を表します。

これは、外から渡された値をインスタンス自身のプロパティに保存している、と単純に理解できます。

すべてのプロパティへの代入が完了すると、このインスタンスの作成は完了します。

### コンストラクタの仕組み

コンストラクタを明示的に宣言すると、もう1つ変化が起こります。

もともとシステムが自動生成していたコンストラクタは、通常そのままでは使えなくなります。

たとえば：

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

この状態で、再び次のように書くと：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

コンパイラは次のようなエラーを出します。

```swift
Extra arguments at positions #2, #3 in call
```

意味は「余分な引数を渡しました」ということです。

なぜこのエラーが出るのでしょうか。

それは、現在の `Movie` 構造体の中には、手動で宣言したこの1種類のコンストラクタしか存在しないからです。

```swift
init(name: String)
```

これは `name` という1つの引数だけを受け取り、`director` と `rating` は受け取りません。

つまり、自分で独自のコンストラクタを追加すると、もともと自動生成されていた初期化方法はそのままでは使えなくなるのです。

もし「名前だけを渡す」方法と「完全な情報を渡す」方法の両方をサポートしたいなら、自分でもう1つ完全版のコンストラクタを書き足す必要があります。

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

こうして、2つの異なるコンストラクタを持つことになります。

古い映画を作るときには、次のように書けます。

```swift
Movie(name: "The Night of the Hunter")
```

完全な情報を持つ新しい映画を作るときには、次のように書けます。

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

この書き方は、同じ型が引数の形さえ違えば複数のコンストラクタを持てることも示しています。

## オーバーロードとは何か

ここで、もう1つ必要な知識を補足します。

さきほど私たちは `Movie` のために2つの `init` を書きました。

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

このような「同じ関数名だが引数が異なる」書き方を「オーバーロード」と呼びます。

ここでは、どちらの関数も名前は `init` ですが、受け取る引数が違うので、Swift はどの関数を呼んでいるのかを区別できます。

たとえば：

```swift
Movie(name: "Days of Heaven")
```

これは次を呼び出します。

```swift
init(name: String)
```

一方で：

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

こちらはもう1つの完全版の初期化メソッドを呼び出します。

つまり、オーバーロードの役割は、同じ型に対して状況に応じた複数の作成方法を提供できるようにすることです。

## class を知る

次に、`class` についても簡単に見てみましょう。

Swift でよく使われる `struct` のほかに、多くのプログラミング言語では、Java、C#、Kotlin などのように、インスタンスを作るために `class` を使います。

Swift における `class` の書き方は `struct` にとてもよく似ています。

たとえば：

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

キーワードが `struct` から `class` に変わっている以外は、他の部分はほとんど同じに見えるはずです。

インスタンスの作り方もよく似ています。

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

そのため、構文レベルでは `struct` と `class` は確かにとてもよく似ています。

### Struct と Class の違い

`struct` と `class` はとても似ていますが、まったく同じではありません。

**1. 初期化の方法が異なる**

`struct` では、自分でコンストラクタを書かなければ、通常システムが適切な初期化メソッドを自動生成します。

しかし `class` では、まだデフォルト値を持っていないプロパティがある場合、通常は `init` を自分で書かなければエラーになります。

たとえば：

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

この `class` はコンストラクタを持たないため、プロパティが初期化されずエラーになります。

コンパイラは次のようなメッセージを出します。

```swift
Class 'Movie' has no initializers
```

したがって、この例では `class` に対して手動でコンストラクタを書く必要があります。

**2. `struct` は値型、`class` は参照型**

`struct` は値型で、`class` は参照型です。

学習の初期段階では、この2つの概念を完全に理解する必要はありません。簡単なイメージを持っていれば十分です。

たとえば、`struct` は「新しい値をコピーする」ことに近いです。

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

ここでは `user1` を `user2` に代入すると、新しいデータのコピーが作られるようなものなので、`user2` を変更しても `user1` には影響しません。

一方、`class` は「同じインスタンスを一緒に参照する」ことに近いです。

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

ここでは `user1` と `user2` は同じインスタンスを指しています。

今の段階では、値型と参照型の内部的な仕組みを完全に理解する必要はありません。`struct` は独立したデータの保存に向いており、`class` は複数の場所で同じインスタンスを共有したい場合に向いている、と知っておけば十分です。

## 初学段階ではどう選ぶか

現在の段階では、普通のデータモデルにはまず `struct` を優先して考え、共有や同期した変更が必要なデータには `class` を考えるとよいでしょう。

これは絶対的なルールではありませんが、初心者にとっては十分に実用的な判断方法です。

特に SwiftUI では、多くの場合 `struct` だけで大部分の仕事をこなせることに気づくはずです。

また、多くのプログラミング資料では、`class` から作られたものを「オブジェクト」と呼ぶこともあります。初学段階では、これもインスタンスとして理解しておけばよく、無理に区別する必要はありません。

## まとめ

この授業では、`struct` をより深く学び、あわせて `class` にも触れました。どちらも型を定義するために使えます。

型はインスタンスを作ることができます。インスタンスを作るときには、コンストラクタである `init` が呼ばれます。

`struct` では、自分でコンストラクタを書かなければ、通常システムが適切なコンストラクタを自動生成します。デフォルトのコンストラクタが要件に合わなければ、自分でコンストラクタを書くこともできます。

さらに、`struct` と `class` の違いについても初歩的に知りました。`struct` は値型であり、`class` は参照型です。SwiftUI では、初学段階でより多く触れることになるのは通常 `struct` のほうです。

今後、ビュー間での値渡し、データモデル、状態管理を学ぶときにも、これらの内容は引き続き使われていきます。
