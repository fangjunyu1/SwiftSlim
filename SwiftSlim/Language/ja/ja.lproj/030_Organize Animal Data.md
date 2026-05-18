# 動物データを整理する

前回のレッスンでは、簡単な動物百科のケースを完成させました。

![view](../../../Resource/029_view.png)

ユーザーがある動物をタップすると、画面は `Sheet` を通じて動物の詳細を表示します。

ただし、前回のレッスンのコードには 1 つ問題があります。動物データが `ContentView` の中に直接書かれていました。

例：

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 動物リストを表示
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

このコードは正常に実行できますが、動物データが増えていくと、`ContentView` はとても長くなります。

`ContentView` は本来、主に画面表示を担当するべきですが、現在は大量の動物データも保存しています。これによりコードが読みづらくなり、後からのメンテナンスも不便になります。

そのため、このレッスンでは 1 つのことを行います：

動物データを `ContentView` から外へ整理します。

## なぜデータを分離するのか？

SwiftUI では、ビューコードは通常、画面表示を担当します。

例：

```swift
Text("Dolphin")
Image("dolphin")
```

これらのコードはどれも画面表示に関係しています。

一方、動物データそのもの、例えば動物名、画像名、分布地域、生息地、説明文は、画面構造ではありません。

それらは固定された資料のまとまりに近いものです：

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

画面コードとデータコードをすべて一緒に書くと、コードはだんだん乱雑になります。

そのため、動物データを `Animal` 型の中に置くことができます。

## static を使って固定データを保存する

まず、整理後の書き方を見てみましょう：

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

ここでは 1 行のコードが追加されています：

```swift
static let animals: [Animal] = [
    
]
```

`static` は静的プロパティを表します。

静的プロパティは型そのものに属し、特定のインスタンスには属しません。

この説明は少し抽象的なので、簡単な例で理解してみましょう。

## 通常のプロパティと静的プロパティ

例えば、`Student` を定義します：

```swift
struct Student {
    let name: String
}
```

ここでの `name` は通常のプロパティです。通常のプロパティは特定のインスタンスに属します。

`name` にアクセスしたい場合は、まず具体的な学生を作成する必要があります：

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

ここでの `student` はインスタンスです。まずは、具体的な学生データ 1 つとして理解できます。

学生ごとに名前が異なる可能性があるため、`name` は具体的な学生の上に置く必要があります。

しかし、あるデータは特定のインスタンスには属しません。

例えば、プレビュー用のサンプルデータを 1 組用意したいとします：

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

ここでは `previewStudents` の前に `static` があるため、これは静的プロパティです。

静的プロパティは、ある 1 人の学生に属するのではなく、`Student` という型そのものに属します。

そのため、先にどれか 1 人の学生を作成しなくても、型名から直接アクセスできます：

```swift
print(Student.previewStudents.count)    // 3
```

ここでのアクセス方法は：

```swift
型名.静的プロパティ名
```

つまり：

```swift
Student.previewStudents
```

同じように、動物百科では次のように動物データへアクセスできます：

```swift
Animal.animals
```

## ContentView に戻る

現在、動物データはすでに `Animal` 型の中に保存されています。

そのため、`ContentView` の中に長い動物配列を書く必要はありません。

次のように変更できます：

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 動物リストを表示
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

この行のコードは次の意味です：

```swift
let animals = Animal.animals
```

`Animal` 型から `animals` という動物データのまとまりを取り出し、現在のビューの `animals` 定数に保存します。

このように書くと、`ContentView` はより簡潔になります。

`ContentView` は画面表示を担当し、`Animal.animals` は動物データの提供を担当します。

## Animal を別ファイルに分ける

前回のレッスンでは、ケースを理解しやすくするために、`Animal` と `ContentView` を同じファイルに書きました。

その時点ではコードがまだ少なかったため、この書き方でも問題ありませんでした。

しかし、現在は動物データが増えてきています。すべてのコードを引き続き `ContentView.swift` の中に書くと、ファイルが長くなり、読みづらくなります。

そのため、`Animal` を新しい Swift ファイルに単独で置くことができます。

Xcode では、例えば次のような Swift ファイルを新規作成できます：

```swift
Animal.swift
```

そして、`Animal` 構造体をこのファイルに移動します：

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

このように整理すると：

`ContentView.swift` は画面表示を担当します。

`Animal.swift` は動物データの構造を説明することを担当します。

それらは別々のファイルに置かれていますが、同じプロジェクト内にある限り、`ContentView` は引き続き `Animal` を直接使用できます。

例：

```swift
let animals = Animal.animals
```

ここでは `ContentView.swift` で追加で `Animal.swift` をインポートする必要はありません。

Swift は同じプロジェクト内の Swift ファイルを自動的に認識します。

## extension を使ってさらにコードを整理する

現在、動物データを `ContentView` から `Animal` の中へ移動しました。

ただし、`Animal` 構造体の中には、まだ 2 種類のコードが同時に含まれています：

1 つ目は、動物モデルそのもののプロパティです：

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

2 つ目は、固定された動物データです：

```swift
static let animals: [Animal] = [
    // ...
]
```

コード構造をより分かりやすくするために、`extension` を使ってこの 2 つの部分を分けることができます。

`extension` は拡張という意味です。

これは既存の型を基礎として、新しいコードをさらに追加できます。

例：

```swift
extension Animal {
    
}
```

これは、`Animal` という型を拡張していることを表します。

## 動物データを extension に置く

`Animal` を次のように変更できます：

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

このように整理すると、コード構造がより明確になります。

`struct Animal` は、1 つの動物がどのようなプロパティを持つべきかを説明します。

`extension Animal` は、固定された動物データのまとまりを保存することを担当します。

注意点として、`animals` は `extension Animal` の中へ移動しましたが、使用方法は変わりません。

引き続き次のように使用できます：

```swift
let animals = Animal.animals
```

これも `extension` の特徴の 1 つです。コード整理を助けるだけで、外部からの呼び出し方は変わりません。

## データが多い場合は、さらに AnimalData ファイルを新規作成できる

現在、`Animal` はすでに単独の `Animal.swift` ファイルに置かれています。

動物データが少ない場合は、`extension Animal` もそのまま `Animal.swift` に書いてかまいません。

しかし、動物データがさらに増える場合は、例えば次のようなファイルを新規作成することもできます：

```swift
AnimalData.swift
```

そして、固定された動物データをそこに置きます：

```swift
extension Animal {
    static let animals: [Animal] = [
        // 動物データ
    ]
}
```

このようにすると、コードの役割分担がより明確になります：

`Animal.swift` は動物モデルの定義だけを担当します。

`AnimalData.swift` は動物データの保存だけを担当します。

`ContentView.swift` は画面表示だけを担当します。

各ファイルの責任がより明確になります。

注意点として、`AnimalData.swift` はファイル名であり、新しい Swift 型ではありません。このファイルの中では、引き続き `extension Animal` を通じて `Animal` に固定データを追加しています。

## 完全なコード

以下は整理後の `Animal.swift` のコードです：

```swift
import Foundation

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

整理後の `AnimalData.swift` のコードです：

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

`ContentView.swift` では、次のように使用できます：

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
```

ヒント：`Animal.swift` と `AnimalData.swift` ファイルでは、どちらも 1 行目に次のように書いています：

```swift
import Foundation
```

以前 SwiftUI の画面を書いていた時は、よく次のように使用しました：

```swift
import SwiftUI
```

これは、`ContentView`、`Text`、`Button`、`Color` などの内容がすべて画面に関係しているため、画面ファイルを書く時は通常 SwiftUI をインポートする必要があるからです。

しかし、ここでの `Animal.swift` と `AnimalData.swift` はどちらも画面ファイルではありません。主に動物モデルを定義し、動物データを保存するために使います。

このコードでは、`UUID()` が `Foundation` を必要とするため、`Foundation` をインポートすれば十分です。

## まとめ

このレッスンでは主に 1 つのことを行いました。動物データを `ContentView` から外へ整理しました。

元の書き方では、動物データを `ContentView` の中に直接書いていました。この書き方でもコードは動作しますが、データが増えるとビューのファイルはどんどん長くなります。

整理後は、`ContentView` が画面表示だけを担当し、`Animal.animals` が動物データの提供を担当します。

このレッスンでは、さらに 2 つの新しい知識も学びました。

1 つ目は `static` です。

`static` は静的プロパティを表します。静的プロパティは型そのものに属し、「型名.プロパティ名」の形で直接アクセスできます。

例：

```swift
Animal.animals
```

2 つ目は `extension` です。

`extension` は拡張を表します。同じ型のコードを分けて書くことができ、コード構造をより明確にできます。

このケースでは、`extension Animal` を使って動物データを保存し、`Animal` 構造体そのものをより簡潔にしました。

また、`Animal` は主にデータモデルを保存し、SwiftUI の画面を直接書いていないため、ここでは `import Foundation` を使用しています。

このレッスンの重点は、コードをより複雑にすることではなく、コードを読みやすく、メンテナンスしやすくすることです。
