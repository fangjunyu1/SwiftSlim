# 映画リスト

このレッスンでは、映画リストを作成します。

![movie](../../Resource/021_movie.png)

リストには、各映画のポスター、名前、監督、評価が表示されます。

この例では、とても重要な知識ポイントである `struct` 構造体を学びます。これは、1本の映画に関する複数の情報をひとつのまとまりとして組み合わせるのに役立ちます。それに加えて、`UUID()`、`ForEach`、区切り線 `Divider`、そしてカスタムオブジェクトを使ってデータを管理する方法にも触れていきます。

これらの知識は、今後の SwiftUI 開発でとてもよく使われます。このレッスンを学び終えると、映画リストを作れるようになるだけでなく、「データの集まりをどのように画面として表示するのか」も理解し始められるようになります。

## 単一の映画

まずは1本の映画の画面から作り始めてみましょう。

![movie](../../Resource/021_movie1.png)

この画面のレイアウトは主に2つの部分で構成されています。左側は映画のポスター、右側は映画の紹介です。

### 映画ポスター

左側には映画のポスターを表示し、画像の表示には `Image` を使えます。

例えば:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

このコードは、`"The Shawshank Redemption"` という名前の画像を表示することを意味します。

ここで注意すべきなのは、画像名が `Assets` リソースフォルダ内に実際に存在していなければならないということです。そうでないと、画面にその画像を正しく表示できません。

![movie](../../Resource/021_movie2.png)

これらの修飾子の役割はそれぞれ次の通りです:

- `resizable()` は、画像のサイズを変更できることを表します。
- `scaledToFit()` は、拡大縮小時に元の比率を保ち、画像が引き伸ばされて変形しないようにすることを表します。
- `frame(height: 180)` は、画像の高さを 180 に設定することを表します。
- `cornerRadius(10)` は、画像に 10 の角丸を設定することを表します。

このようにして、適切なサイズで角が丸い映画ポスター画像を得ることができます。

![movie](../../Resource/021_movie3.png)

### 映画の紹介

右側には映画の紹介が表示され、映画名、監督、評価が含まれます。

![movie](../../Resource/021_movie4.png)

この部分は `Text` を使って表示できます:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

このコードでは、`.font` は文字サイズを表し、`.fontWeight` は文字の太さを表します。

「映画名」「監督情報」「評価情報」の間隔をよりはっきりさせるために、ここでは最も外側に `VStack` を使い、次のように設定しています:

```swift
spacing: 10
```

これは、この `VStack` の中にある各コンテンツグループの間隔がすべて 10 であることを意味します。

監督と評価がそれぞれさらに `VStack` で包まれているのは、どちらも「見出し + 内容」という構造に属しているからです。そのため、画面の階層がより明確になり、その後のスタイル調整もしやすくなります。

また、`VStack` はデフォルトでは中央揃えです。文字全体を左揃えにするために、次のように設定します:

```swift
alignment: .leading
```

こうすることで、映画紹介部分がより整って見えるようになります。

### 区切り線

ここまでで、映画紹介の内容は `spacing` によって間隔が空けられていますが、異なる内容同士の区切りはまだ十分に明確ではありません。

このとき、区切り線を追加できます:

```swift
Divider()
```

例えば:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

こうすることで、映画紹介部分によりはっきりした区切り効果が生まれます。

![movie](../../Resource/021_movie4.png)

`Divider` はとてもシンプルですが非常によく使われるビューで、その役割は異なる内容を区切ることです。

`VStack` の中では、`Divider()` は横線として表示されます。

`HStack` の中では、`Divider()` は縦線として表示されます。

さらに、`.frame`、`.background`、`.padding` などの方法で `Divider` のスタイルを変更することもできます。

例えば:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

これにより、青色で太さが 2、左右に余白を持つ区切り線が作られます。

![divider](../../Resource/021_divider.png)

### 完全な画面

最後に、`HStack` を使って映画ポスターと映画紹介を左右に並べることができます。

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

ここでの `HStack(spacing: 20)` は、左右2つの部分の間に 20 の間隔を保つことを意味します。

注意が必要なのは、`Divider()` は前に説明した `TextField` や `Slider` と同じように、デフォルトで利用可能なスペースをできるだけ占有しようとすることです。

そのため、右側の紹介部分の外側 `VStack` に固定幅を設定します:

```swift
.frame(width: 200)
```

こうすることで、区切り線と文字領域の幅を一致させることができ、全体がより整って見えるようになります。

ここまでで、「単一の映画」の表示画面が完成しました。

![movie](../../Resource/021_movie1.png)

## 配列で映画を保存する

もし複数の映画を同じスタイルで順番に表示したいなら、それは各映画ごとに似たようなコードを毎回書かなければならないということです。

例えば:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

このように書いたコードでも目的の表示はできますが、コード量はどんどん増え、保守もとても面倒になります。

例えば、すべての映画の間隔を `20` から `15` に変えたい場合や、右側の幅を `200` から
`220` に変えたい場合には、繰り返されているコードを一つ一つ手作業で修正する必要があります。

これは明らかに効率的な方法ではありません。

私たちは以前に配列を学び、また `ForEach` を使って配列に基づいてビューを繰り返し表示する方法も学びました。

例えば:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

この方法は、「データがひとつだけ」のケース、たとえば画像名のグループのような場合にとても適しています。

しかし、1本の映画には1つの値しかないわけではありません。少なくとも次のものが含まれます:

1. 映画ポスター
2. 映画名
3. 監督
4. 評価

つまり、1本の映画は実際には関連したデータの集まりであり、単独の文字列ではありません。

もし配列だけを使うなら、これらの情報を分けて保存するしかありません:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

表示するときには、同じインデックスに頼って一つずつ対応させる必要があります:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

この書き方の問題は、保守コストがとても高いことです。

1本の映画のデータが複数の配列に分散してしまうため、どれか1つの配列で項目が1つ多い、1つ少ない、あるいは順番が違うだけで、表示結果が間違ってしまいます。

特に映画を追加したり削除したりする際には、複数の配列を同時に修正しなければならず、何かを見落としやすくなります。

では、「映画名・監督・評価」といった情報をどのようにひとつのまとまりにできるのでしょうか。

ここで `struct` を使う必要があります。

## struct 構造体の定義

Swift において、`struct` は「構造体」です。

これは「カスタムデータ型」と考えることができ、複数の関連するフィールドをひとつにまとめてひとつのまとまりにできます。

基本的な使い方:

```swift
struct StructName {
	let name: String
}
```

このコードでは、`struct` は構造体を定義していることを表すキーワードです。`StructName` は構造体の名前です。

波括弧の中の内容が、この構造体に含まれるフィールドであり、各フィールドには名前と型を明確に書く必要があります。

通常、`struct` の名前は `Movie`、`Student`、`UserInfo` のように大文字で始めます。これは Swift でよく使われる命名習慣です。

`struct` は、ひとつひとつのフィールドがあらかじめ用意された空きスペースになっている空の箱のようなものだと、簡単に理解できます。

これらのスペースにまだ何も入っていない状態では、ただの空箱です。すべてのフィールドに適切な値が入って初めて、完全なギフトボックスになります。

### struct のインスタンス

先ほどは構造体そのものを定義しただけで、これは箱の形を用意したのと同じです。

実際に使える「インスタンス」を得るには、その中に具体的な内容を入れる必要があります。

インスタンスを作成するときは、通常、構造体名の後ろに `()` を付けます:

```swift
StructName(...)
```

括弧の中に入れるものが、この構造体が必要とするフィールドの内容です。

例えば:

```swift
StructName(name: "Fang Junyu")
```

このコードは、`StructName` という構造体の形式に従って新しいインスタンスを作成し、`name` フィールドに `"Fang Junyu"` を代入する、という意味です。

必要なフィールド内容をすべて埋めると、この箱をいっぱいに満たしたのと同じになります。

そのとき、完全な構造体インスタンスが得られます。

### struct のプロパティにアクセスする

インスタンスを作成したあと、その内部のプロパティには「ドット記法」でアクセスできます。

基本的な書き方:

```swift
インスタンス.プロパティ名
```

例えば:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

ここで `st` は構造体インスタンスであり、`st.name` はそのインスタンスの `name` の値を読み取ることを意味します。

この読み取り方は、`st.name` と書くことで、その箱のある位置に入っている内容を読むようなものだと理解できます。

この書き方は、その後の SwiftUI の画面でもとてもよく使われます。

例えば、名前・年齢・クラスを含む生徒の構造体があるなら、画面表示のときにそれぞれ次のように読めます:

```swift
student.name
student.age
student.className
```

こうする利点は、データがより明確になり、管理もしやすくなることです。

### struct の位置

初心者の場合、通常は構造体を `ContentView` の外側に書いても問題ありません。

例えば:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

このようにすると、構造がよりはっきりして読みやすくなります。

`ContentView` 自体も実は `struct` であることに気づくでしょう。

### Movie 構造体

ここまでの基礎をもとに、映画の構造体を定義できます:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

これは `Movie` という名前の構造体で、`name`、`director`、`rating` の3つのフィールドで構成されており、それぞれ映画名、監督、評価を表します。

こうすることで、1本の映画に関連する情報を複数の配列に分けて保存する必要がなくなり、直接ひとつのまとまりとして扱えるようになります。

例えば、次のような映画インスタンスを作れます:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

このインスタンスは「1本分の完全な映画データ」を表しています。

### 配列で構造体を保存する

以前、配列は同じ型しか保存できないと説明しました。

今は `Movie` という構造体があるので、配列には複数の `Movie` を保存できます。

```swift
let lists: [Movie] = []
```

例えば:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

この `lists` 配列に保存されているのは文字列ではなく、複数の `Movie` インスタンスです。

つまり、配列内の各要素が1本の完全な映画です。

こうして、映画リストを表示したいときには `ForEach` を通して1本ずつ映画を読み取れます。

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

ここでの `movie in` は、ループのたびに配列から1本の映画を取り出し、一時的に `movie` という名前を付けていることを意味します。

その後、次のように使えます:

```swift
movie.name
movie.director
movie.rating
```

これによって、その映画の名前、監督、評価をそれぞれ読み取り、画面に表示できます。

## ForEach のエラー

ここまでで、映画配列と `ForEach` の基本的な書き方は完成しました。

しかし、次のコードをそのまま実行すると:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

エラーが表示されます:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

このエラーの意味は、`id: \.self` と書いたとき、SwiftUI は配列内の各要素そのものを「一意の識別子」として扱う必要がある、ということです。

この書き方は `String` や `Int` のような単純な型には適しています。なぜなら、それらは比較的区別しやすいからです。

しかし `Movie` は私たちが定義したカスタム構造体であり、`ForEach` はそれ自体を一意の識別子としてどう扱えばよいかわからないため、エラーになります。

この問題を解決する最も一般的な方法は、`Movie` に `Identifiable` プロトコルを準拠させることです。

## プロトコル

Swift では、プロトコルは一種の「ルール」や「要件」として理解できます。

国際組織の協定のようなものだと考えることもできます。ある国が特定の国際組織に加盟したい場合、通常はその組織が提示するいくつかのルールを満たし、いくつかのデータを公開し、共通のルールに従う必要があります。それらの条件を満たして初めて、加盟したり特定の事項に参加したりできます。

プロトコルも似たような考え方です。

ある型が特定のプロトコルに準拠したい場合、そのプロトコルが定める内容を満たす必要があります。そうして初めて、その型は対応する機能を使えるようになります。

基本的な書き方:

```swift
struct Movie: Identifiable {
    // ...
}
```

ここで `: Identifiable` は、`Movie` が `Identifiable` プロトコルに準拠していることを表します。

もし1つの型が複数のプロトコルに準拠する場合は、カンマで区切って書けます:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable` にとって最も重要な要件は、その型に自分を識別できる `id` が必要であることです。

例えば:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

ここでの `id` は身分証番号のようなもので、各映画を区別するために使われます。

各映画の `id` が異なっていれば、SwiftUI は配列内の各要素を正しく区別できます。

例えば:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

そして `ForEach` の中では次のように使います:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

こうすればエラーは出なくなります。

`Movie` はすでに `Identifiable` に準拠しているので、さらに一般的な書き方は `id:` を省略することです:

```swift
ForEach(lists) { movie in
    // ...
}
```

なぜなら、SwiftUI はすでに `movie.id` を使って各項目を区別すると分かっているからです。

## ForEach の識別子

次に、`ForEach` における `id` の役割をさらに深く理解していきます。

例えば:

```swift
ForEach(lists, id: \.self)
```

これは、要素そのものを識別子として使う、という意味です。

そして:

```swift
ForEach(lists, id: \.id)
```

これは、要素の `id` フィールドを識別子として使う、という意味です。

もしあるフィールド自体が一意性を保証できるなら、それを一時的に使うこともできます。

例えば各映画の名前がすべて異なるなら、現在のデータでは次の書き方でも正しく動くかもしれません:

```swift
ForEach(lists, id: \.name)
```

しかし、ここには隠れた問題があります。`name` が常に一意であるとは限りません。

将来、同じ名前の映画をもう1本追加したとすると、`name` では各要素を正確に区別できなくなります。

その場合、コード自体はコンパイルできても、ビューの更新、挿入、削除、再描画の際に SwiftUI が要素を誤認識し、表示異常が起こる可能性があります。

したがって、安定してデータを区別したい場合は、やはり本当に一意なフィールドである `id` を使うのが最善です。

## UUID

`id: 1`、`id: 2` のように手で書く方法でも問題は解決できますが、まだ1つリスクがあります。それは、うっかり重複した `id` を書いてしまい、一意識別子が無効になる可能性があることです。

例えば:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

このようにすると、同じ `id` が2つできてしまい、一意識別子が機能しなくなります。

手作業のミスを避けるために、通常は `UUID()` を使います。

Swift では、`UUID()` はランダムな 128 ビットの識別子を生成します。通常は文字と数字からなる長い文字列として表示されます。

例えば:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

ここでの `UUID()` は実際には `UUID` 型のインスタンスを作成しており、自動生成される「一意の番号」と考えられます。

そのため、毎回作られる値はほとんど重複せず、`id` として使うのに非常に適しています。

`Movie` を次のように変更できます:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

このコードは、`Movie` 構造体の `id` フィールドに、デフォルトで新しい `UUID` インスタンスが割り当てられることを意味します。

つまり、新しい `Movie` を作るたびに、システムが自動的に一意の `id` を生成してくれるということです。

`id` にはすでにデフォルト値があるので、その後 `Movie` インスタンスを作成するときには `id` を手動で記入する必要がなくなります。

例えば:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

ここでは `id` を書いていませんが、実際にはこの映画インスタンスにも固有の `id` があり、その値は `UUID()` によって自動生成されています。

この方法を使えば、各映画に対して `id` を手で埋める必要がなくなり、コード量が減るだけでなく、重複 id によるエラーも防げます。

最後に、上部に `Banner` 画像を追加し、`ScrollView` を使って内容をスクロール可能にすれば、映画リスト全体のビューが完成します。

## まとめ

このレッスンでは、とても重要な知識ポイントである `struct` を学びました。

`struct` を使うことで、1本の映画に関する複数の関連フィールドをひとつのまとまりとして整理でき、名前・監督・評価を複数の配列に分けて保存する必要がなくなります。

データを整理したあとで、`ForEach` を使えば、配列内の各映画を1本ずつビューに表示できます。

同時に、`ForEach` における「識別子」の役割についても理解しました。SwiftUI は配列内の各要素をどう区別するかを知っていなければ、ビューを正しく表示・更新できません。

そのため、`Movie` を `Identifiable` プロトコルに準拠させ、一意の `id` を持たせました。

さらに、手動で `id` を入力するときのミスを避けるために `UUID()` も学び、システムが自動的に一意識別子を生成するようにしました。

このレッスンを学び終えると、映画リストを完成できるだけでなく、SwiftUI における大切な考え方にも触れ始めることになります。それは **まずデータを整理し、そのあとデータに基づいてビューを生成する** という考え方です。

## 完全なコード

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
