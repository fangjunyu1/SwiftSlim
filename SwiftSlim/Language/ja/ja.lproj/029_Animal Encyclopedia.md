# 動物百科 

このレッスンでは、カスタムビューとデータ渡しを引き続き練習します。

ここでは、簡単な動物百科ビューを作成します。画面には5種類の動物が表示され、どれかの動物をクリックすると詳細ビューが表示され、その動物の画像、分布地域、生息地、説明が表示されます。

完成イメージ：

![view](../../../Resource/029_view.png)

この例を通して、データ構造、リスト表示、クリック操作、Sheet によるポップアップビューの連携を練習できます。

## 画像素材を準備する

まず、5枚の動物画像を準備します。

- イルカ：`dolphin.jpg`
- キリン：`giraffe.jpg`
- ライオン：`lion.jpg`
- パンダ：`panda.jpg`
- ホッキョクグマ：`polarBear.jpg`

次の画像素材を使用できます。

[イルカ](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[キリン](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[ライオン](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[パンダ](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[ホッキョクグマ](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

画像をダウンロードしたら、Xcode プロジェクトの `Assets` リソースフォルダにドラッグします。

![assets](../../../Resource/029_assets.png)

注意点として、コードで画像を使うときは、通常 `.jpg` 拡張子を書く必要はありません。

例えば、画像リソース名が `dolphin` の場合、コードでは次のように書きます。

```swift
Image("dolphin")
```

画像名を間違えると、画像は正常に表示されません。

注：上記の画像素材はウィキメディアプロジェクトからのものです。使用する際は、元画像のリンクと出典情報を残しておくことをおすすめします。

## 動物構造体を作成する

この画面では、1匹の動物が複数の情報を持っています。

- 動物名
- 動物画像
- 動物の絵文字
- 分布地域
- 生息地
- 動物の説明

これらの情報をたくさんの変数に分けて保存すると、コードが複雑になります。そのため、`Animal` 構造体を作成し、1匹の動物の情報をまとめておくことができます。

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

このコードでは：

- `id`：動物の一意な識別子。
- `name`：動物名。
- `imageName`：動物画像の名前。
- `avatarEmoji`：動物の絵文字。
- `distributionArea`：分布地域。
- `habitat`：生息地。
- `animalDescription`：動物の説明。

その中で：

```swift
let id = UUID()
```

`id` は、それぞれの動物を識別するために使います。あとで `ForEach` を使って動物リストを表示し、さらに `.sheet(item:)` を使って選択された動物に応じた詳細を表示するため、`Animal` を `Identifiable` プロトコルに準拠させる必要があります。

`Identifiable` の役割は、SwiftUI に「それぞれの動物には個体を区別できる `id` がある」と伝えることです。

## 動物データを作成する

次に、`ContentView` の中で動物配列を作成します。

配列には5つの `Animal` を保存し、それぞれの `Animal` が1匹の動物を表します。

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // イルカ
        Animal(
            name: "イルカ",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "世界中の温暖で温帯の海域。",
            habitat: "海、沿岸水域、一部の大きな川。",
            animalDescription: "イルカは知能の高い海生哺乳類です。群れで生活し、音でコミュニケーションを取り、遊び好きな行動で知られています。"
        ),
        // キリン
        Animal(
            name: "キリン",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "アフリカのサバンナと開けた森林地帯。",
            habitat: "草原、サバンナ、開けた森林。",
            animalDescription: "キリンは最も背の高い陸上動物です。長い首と長い脚を持ち、通常は高い木の葉を食べます。"
        ),
        // ライオン
        Animal(
            name: "ライオン",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "主にサハラ以南のアフリカに生息し、インド西部にも小さな個体群があります。",
            habitat: "草原、サバンナ、開けた森林地帯。",
            animalDescription: "ライオンは力強い大型ネコ科動物です。通常はプライドと呼ばれる群れで生活し、しばしば動物界の王として知られています。"
        ),
        // パンダ
        Animal(
            name: "パンダ",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "中国中部の山地の森林。",
            habitat: "涼しく湿った山地にある竹林。",
            animalDescription: "パンダは白黒の毛で知られるクマの仲間です。主に竹を食べ、世界で最もよく知られた動物の一つです。"
        ),
        // ホッキョクグマ
        Animal(
            name: "ホッキョクグマ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "北極点周辺の北極地域。",
            habitat: "海氷、沿岸地域、寒冷な北極環境。",
            animalDescription: "ホッキョクグマは寒冷な環境に適応した大型のクマです。泳ぎが得意で、主に海氷を利用してアザラシを狩ります。"
        )
    ]

    var body: some View {
        Text("動物百科")
    }
}
```

ここでの `animals` は配列です。

```swift
let animals: [Animal]
```

`[Animal]` は、この配列の中に複数の `Animal` が保存されていることを表します。

つまり、`animals` は1匹の動物ではなく、動物のグループです。

## 動物リストを表示する

これで、`ForEach` を使って動物リストを表示できます。

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

表示結果：

![view](../../../Resource/029_view1.png)

このコードでは：

```swift
ForEach(animals) { animal in
    ...
}
```

`animals` 配列を順番に処理することを表します。

ループするたびに、`animal` は現在表示しているその1匹の動物を表します。

例えば、1回目のループでは `animal` はイルカ、2回目のループでは `animal` はキリンです。

そのため、次の方法で現在の動物の情報を表示できます。

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

これで、5種類の動物を表示できます。

## 動物リストをクリックできるようにする

現在リストは表示されていますが、まだクリックできません。

ある動物をクリックしたあと詳細を表示したい場合は、まず「現在選択されている動物」を記録する必要があります。

そのため、`ContentView` に状態変数を追加します。

```swift
@State private var selectedAnimal: Animal? = nil
```

ここでの `selectedAnimal` は、オプショナル型 `Animal?` です。

これは、動物が入っている可能性もあれば、何も入っていない可能性もあることを表します。

デフォルト値は `nil` で、最初はどの動物も選択されていないことを意味します。

次に、それぞれの動物の行を `Button` に変更します。

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

重要なのは、この1行です。

```swift
selectedAnimal = animal
```

ユーザーがある動物をクリックすると、その動物を `selectedAnimal` に保存します。

例えば、ユーザーがイルカをクリックすると、`selectedAnimal` に保存されるのはイルカです。

ユーザーがパンダをクリックすると、`selectedAnimal` に保存されるのはパンダです。

つまり、`selectedAnimal` は、ユーザーが現在クリックした動物を記録するために使います。

## Sheet ポップアップビュー

これで、ボタンを使って「現在クリックした動物」を記録できるようになりました。

次に、動物の詳細を表示するためのポップアップビューを実装します。

![view](../../../Resource/029_view2.png)

SwiftUI では、このようなポップアップ効果を `Sheet` で実現できます。

`Sheet` は、一時的に表示されるページとして理解できます。現在のページの上に表示され、ユーザーは内容を確認したあと、下にスワイプして閉じることができます。

## Sheet の例

実際に動物の詳細を表示する前に、まず簡単な例で `Sheet` がどのように表示されるのかを理解します。

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet を表示")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet ビュー")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

表示結果：

![view](../../../Resource/029_view3.png)

このコードでは、真偽値を作成しています。

```swift
@State private var showSheet = false
```

`showSheet` のデフォルト値は `false` で、最初は `Sheet` を表示しないことを表します。

ボタンをクリックすると：

```swift
showSheet.toggle()
```

`toggle()` は真偽値を切り替えることを表します。

元が `false` の場合、`toggle()` を呼び出すと `true` になります。

元が `true` の場合、`toggle()` を呼び出すと `false` になります。

そのため、ボタンをクリックすると、`showSheet` は `false` から `true` に変わります。

`showSheet` が `true` になると、次のコードで `Sheet` が表示されます。

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ビュー")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

このコードは、`showSheet` が `true` のときに `Sheet` を表示し、`Sheet` の中に `Text("Sheet ビュー")` を表示することを意味します。

表示結果：

![view](../../../Resource/029_view4.png)

この書き方は、固定された内容を表示する場合に適しています。

例えば、ボタンをクリックしたあとに設定ページ、説明ページ、ヒントページなどを表示する場合です。

### Sheet の表示位置

`Sheet` はポップアップビューですが、SwiftUI では `Text()` や `Image()` のように独立したビューとして直接書くのではなく、ビュー修飾子として使用します。

つまり、`.sheet(...)` は `.font()`、`.padding()`、`.shadow()` などの修飾子と似ており、どこかのビューの後ろに追加する必要があります。

例：

```swift
Button("Sheet を表示") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ビュー")
}
```

この例では、`.sheet` は `Button` の後ろに追加されています。

`showSheet` が `true` になると、SwiftUI は `Sheet` を表示し、波括弧の中の内容を表示します。

```swift
Text("Sheet ビュー")
```

ただし、実際の開発では、1つのページに複数のボタンがある場合、通常はそれぞれのボタンに `.sheet` を追加することはありません。

より一般的なのは、`.sheet` を外側のビューの後ろに追加する方法です。

例：

```swift
VStack {
    Button("Sheet を表示") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ビュー")
}
```

ボタンは `showSheet` を変更し、外側のビューは `showSheet` が `true` かどうかに応じて `Sheet` を表示します。

## オプショナル値にバインドする Sheet

前に学んだ書き方は次のとおりです。

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet ビュー")
}
```

この書き方は、固定ページの表示と非表示を制御する場合に適しています。

しかし、動物百科の例では、「`Sheet` を表示するかどうか」だけでなく、「どの動物がクリックされたのか」も知る必要があります。

例えば：

ユーザーがイルカをクリックしたら、`Sheet` にはイルカの詳細を表示する必要があります。

ユーザーがパンダをクリックしたら、`Sheet` にはパンダの詳細を表示する必要があります。

そのため、ここでは別の Sheet の書き方を使う方が適しています。

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheet の中に表示する内容
}
```

このコードでは、`Sheet` はオプショナル値 `selectedAnimal` にバインドされています。

ここで注意する点は、`item:` の後ろに書くのは `selectedAnimal` ではなく `$selectedAnimal` だということです。

なぜなら、`Sheet` は `selectedAnimal` の値を読むだけでなく、その変化に応じて表示するかどうかも決める必要があるからです。

このコードは、次のように理解できます。

- `selectedAnimal` が `nil` のとき、`Sheet` は表示されません。
- `selectedAnimal` に値があるとき、`Sheet` が表示されます。
- `Sheet` が閉じられると、SwiftUI は `selectedAnimal` を再び `nil` に戻します。

SwiftUI は、`selectedAnimal` に保存されている動物を波括弧の中の `animal` に渡します。

つまり、`.sheet(item:)` はポップアップ表示を制御するだけでなく、選択されたデータを `Sheet` に渡すこともできます。

## Sheet で動物名を表示する

ここでは、まだ複雑な詳細ビューを急いで作成しません。

コードを理解しやすくするため、まず `Sheet` の中に現在の動物名を表示します。

`VStack` の外側に `.sheet(item:)` を追加します。

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

ここで最も重要なのは、次のコードです。

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

`selectedAnimal` に値があると、`Sheet` が表示されます。

波括弧の中の `animal` は、現在選択されている動物です。

そのため：

```swift
Text(animal.name)
```

現在クリックした動物名が表示されます。

例えば、`イルカ` をクリックすると、Sheet には `イルカ` が表示されます。

`パンダ` をクリックすると、`Sheet` には `パンダ` が表示されます。

これで、異なる動物をクリックすると、異なる動物名がポップアップ表示される効果を実現できました。

動物名を表示：

![view](../../../Resource/029_view5.png)

ただし、動物の詳細は名前だけでなく、名前、分布地域、生息地、説明も表示するべきです。

これらのコードをすべて `.sheet` の中に書くと、コードが長くなり、読みにくくなります。

そのため、次に新しいカスタムビューを作成し、動物の詳細表示だけを担当させます。

## 動物詳細ビューを作成する

次に、新しいカスタムビュー `AnimalDetailView` を作成します。

このビューは1つの `Animal` を受け取り、動物の詳細を表示します。

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**分布地域** ：\(animal.distributionArea)")

                    Divider()

                    Text("**生息地** ：\(animal.habitat)")

                    Divider()

                    Text("**動物の説明** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

表示結果：

![view](../../../Resource/029_view2.png)

ここでのポイントは：

```swift
var animal: Animal
```

これは、`AnimalDetailView` が外部から1匹の動物を受け取る必要があることを表します。

動物を受け取ると、詳細ビューではその動物のさまざまな情報を使えるようになります。

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

つまり、`AnimalDetailView` は渡された動物を表示することだけを担当します。

### Markdown の太字テキスト

詳細ビューでは、次のようなコードを書きました。

```swift
Text("**生息地:** \(animal.habitat)")
```

ここには2つの知識点があります。

1つ目は、`**生息地:**` が `Markdown` 構文を使っていることです。2つのアスタリスクで囲まれた文字は太字で表示されます。

2つ目は、`\()` が文字列補間であり、変数の値を文字列の中に表示できることです。

このコードは、まず太字の `生息地:` を表示し、そのあとにこの動物の生息地を表示することを意味します。

## Sheet で詳細ビューを表示する

`AnimalDetailView` を作成したら、`ContentView` に戻り、`Sheet` の中にあった元の名前ビューを詳細ビューに置き換えます。

元のコードは：

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

今度は次のように変更します。

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

ここでの `animal:` は、`AnimalDetailView` の引数名です。

後ろの `animal` は、`.sheet(item:)` から渡される現在の動物です。

つまり、現在クリックした動物を `AnimalDetailView` に渡して表示します。

全体構造：

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

ユーザーが動物をクリックすると：

```swift
selectedAnimal = animal
```

`selectedAnimal` は `nil` から具体的な動物に変わり、`Sheet` は `selectedAnimal` に値があることを検出してビューを表示します。

`Sheet` は `selectedAnimal` の中の動物を `AnimalDetailView` ビューに渡し、`AnimalDetailView` が動物の詳細を表示します。

これで、動物リストをクリックすると対応する動物詳細が表示される機能を実現できました。

## Sheet の2つの書き方の違い

ここまでで、`.sheet(item:)` を使って動物詳細ビューの表示を完成させました。

ここでは、`Sheet` のよく使う2つの書き方を簡単にまとめます。

### 1つ目は真偽値にバインドする方法

```swift
@State private var showSheet = false

Button("Sheet を表示") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet ビュー")
}
```

この書き方は、設定ページ、説明ページ、ヒントページなど、固定された内容を表示する場合に適しています。

`showSheet` は真偽値で、`true` と `false` の2つの状態だけがあります。

`showSheet` が `true` のとき、`Sheet` が表示されます。

`showSheet` が `false` のとき、`Sheet` は表示されません。

### 2つ目はオプショナル値にバインドする方法

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

この書き方は、選択されたデータに応じて異なる内容を表示する場合に適しています。

このレッスンでは、異なる動物をクリックすると異なる動物詳細を表示する必要があるため、`.sheet(item:)` を使う方が適しています。

## 完全なコード

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // 動物名
    let name: String
    
    // 動物画像
    let imageName: String
    
    // 動物のタグ記号
    let avatarEmoji: String
    
    // 分布地域
    let distributionArea: String
    
    // 生息地
    let habitat: String
    
    // 動物の説明
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // イルカ
        Animal(
            name: "イルカ",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "世界中の温暖で温帯の海域。",
            habitat: "海、沿岸水域、一部の大きな川。",
            animalDescription: "イルカは知能の高い海生哺乳類です。群れで生活し、音でコミュニケーションを取り、遊び好きな行動で知られています。"
        ),
        // キリン
        Animal(
            name: "キリン",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "アフリカのサバンナと開けた森林地帯。",
            habitat: "草原、サバンナ、開けた森林。",
            animalDescription: "キリンは最も背の高い陸上動物です。長い首と長い脚を持ち、通常は高い木の葉を食べます。"
        ),
        // ライオン
        Animal(
            name: "ライオン",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "主にサハラ以南のアフリカに生息し、インド西部にも小さな個体群があります。",
            habitat: "草原、サバンナ、開けた森林地帯。",
            animalDescription: "ライオンは力強い大型ネコ科動物です。通常はプライドと呼ばれる群れで生活し、しばしば動物界の王として知られています。"
        ),
        // パンダ
        Animal(
            name: "パンダ",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "中国中部の山地の森林。",
            habitat: "涼しく湿った山地にある竹林。",
            animalDescription: "パンダは白黒の毛で知られるクマの仲間です。主に竹を食べ、世界で最もよく知られた動物の一つです。"
        ),
        // ホッキョクグマ
        Animal(
            name: "ホッキョクグマ",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "北極点周辺の北極地域。",
            habitat: "海氷、沿岸地域、寒冷な北極環境。",
            animalDescription: "ホッキョクグマは寒冷な環境に適応した大型のクマです。泳ぎが得意で、主に海氷を利用してアザラシを狩ります。"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**分布地域** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**生息地** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**動物の説明** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## まとめ

このレッスンでは、簡単な動物百科ページを完成させました。

まず `Animal` 構造体で動物情報を保存し、次に配列で5種類の動物を保存し、そのあと `ForEach` を使って動物リストを表示しました。

ユーザーがある動物をクリックしたとき、この動物を `selectedAnimal` に保存します。

```swift
selectedAnimal = animal
```

`selectedAnimal` に値があると、`.sheet(item:)` が詳細ビューを表示し、選択された動物を `AnimalDetailView` に渡します。

このレッスンで最も重要なのは画面の見た目ではなく、次のデータ渡しの流れを理解することです。

```swift
動物をクリック → selectedAnimal に動物を保存 → Sheet が表示される → AnimalDetailView が詳細を表示する
```

この流れを理解できれば、今後は商品詳細、コース詳細、記事詳細、連絡先詳細など、似た機能をさらに作れるようになります。
