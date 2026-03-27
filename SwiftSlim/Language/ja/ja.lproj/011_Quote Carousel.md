# 名言カルーセル

このレッスンでは、「名言カルーセル」機能を実装しながら、配列（Array）や条件分岐文（if-else）など、Swift の基礎知識をさらに深く学びます。

複数の名言をどのように保存し、ボタン操作によって名言を循環表示するかを見ていきます。

![alt text](../../RESOURCE/011_word.png)

## 名言を表示する

まず、SwiftUI で 1 つの名言を表示する必要があります。

もっとも簡単な方法は、`Text` ビューを使うことです：

```swift
Text("Slow progress is still progress.")
```

このコードでは、固定の名言を 1 つしか表示できません。複数の名言を表示し、切り替え機能を実現したい場合は、名言を保存しておく必要があります。

しかし、通常の文字列変数では 1 つの名言しか保存できません：

```swift
let sayings = "Slow progress is still progress."
```

複数の名言を保存したいなら、それぞれに対して個別の変数を宣言する必要があります：

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

しかし、実際の開発ではこの方法は面倒なだけでなく、各変数が独立しているため、柔軟なカルーセル切り替えを実現できません。

複数の名言を管理しやすくするためには、それらをまとめて保存できるデータ構造が必要です。それが配列（Array）です。

配列を使うと、上のコードは次のように保存できます：

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**ヒント：プログラミングの慣例では、複数の要素を保存する配列変数名には、集合であることが分かるように `sayings` のような複数形を使うのが一般的です。**

## 配列

Swift では、配列は順序付き要素を保存するコレクションで、角括弧 `[]` で表します。

```swift
[]
```

配列の中には、同じ型の複数要素を入れることができ、各要素は英語のカンマ `,` で区切ります。

たとえば：

```swift
[101, 102, 103, 104, 105]
```

配列は、簡単に言えば 1 本の列車のようなものだと考えられます：

![Array](../../RESOURCE/011_array1.png)

列車全体がこの配列オブジェクトを表し、各車両が順番に並んでいます。

### インデックスと要素アクセス

配列は順序付きなので、システムは順番に基づいて具体的な要素を特定できます。この特定の仕組みをインデックス（Index）と呼びます。

Swift（およびほとんどのプログラミング言語）では、配列のインデックスは 1 ではなく 0 から始まります。つまり、配列の最初の要素のインデックスは 0、2 番目は 1、その次は 2……という形です。

![Array](../../RESOURCE/011_array2.png)

配列内の特定要素にアクセスしたい場合は、配列名の後ろに角括弧を付け、その中に対象要素のインデックス値を入れます。

たとえば：

```swift
sayings[0]   // 101
sayings[1]   // 102
```

有効範囲を超えたインデックスにアクセスしようとすると、「インデックス範囲外（Index Out of Range）」の問題が発生します。そのため、配列にアクセスするときは、インデックスが有効範囲内にあることを確認する必要があります。

**インデックス範囲外**

たとえば、配列に要素が 5 個しかない場合、有効なインデックス範囲は 0 から 4 です。もし `sayings[5]` にアクセスしようとすると、対応する「車両」を見つけられず、「インデックス範囲外」エラーが発生し、アプリがクラッシュします。

![Array](../../RESOURCE/011_array3.png)

### 配列を操作する

配列は静的定義だけでなく、要素の追加、削除、変更、さらに長さの取得もできます。

ヒント：配列を変更したい場合は、`let` ではなく `var` で宣言しなければなりません。

**1. 要素を追加する**

`append` メソッドを使うと、配列の末尾に要素を追加できます：

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. 要素を削除する**

`remove(at:)` メソッドを使うと、配列内の指定要素を削除できます：

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. 要素を変更する**

インデックスを使って直接配列要素を変更できます：

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. 配列の長さを数える**

`count` プロパティを使うと、配列内の要素数を取得できます：

```swift
var num = [0, 1, 2]
num.count   // 3
```

### 配列を使って名言を表示する

複数の名言を表示するためには、それらを配列に保存し、インデックス経由でアクセスして表示できます。

まず、ContentView の中で `sayings` 配列を作り、名言を保存します。そして `Text` ビューでインデックスを使って対応する名言を読み取り表示します：

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

ここで `sayings[0]` は、配列内の最初の名言を表します。

違う名言を表示したい場合は、角括弧内のインデックス値を変更するだけです：

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### 名言のインデックスを定義する

名言を動的に切り替える効果を実現するためには、`Text` ビューの中にインデックスを「固定で書く」ことはできません。

現在表示しているインデックス値を個別に保存するための変数を作る必要があります。

SwiftUI では、`@State` を使って可変なインデックスを宣言できます：

```swift
@State private var index = 0
```

SwiftUI は `@State` でラップされた変数を監視します。`index` が変化すると、SwiftUI はビューを再描画し、対応する名言を表示します。

続いて、`sayings[index]` を使って配列内の名言を動的に取得します：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

`index` の値が変化すると、`Text` に表示される名言も変わります。

### ボタンでインデックスを制御する

名言の切り替えを制御するために、`Button` を使って `index` の値を変更できます。ボタンを押すたびに、`index` を自動で 1 増やします：

```swift
Button("Next") {
    index += 1
}
```

ボタンを押すと、`index` の値は 0 から 1 になり、ビュー更新が発火し、`Text(sayings[index])` は次の名言を読み取ります。

しかし、ここには潜在的な問題があります。ボタンを連続で押すと、`index` は配列範囲を超えた値まで増えてしまい、配列インデックス範囲外エラーを引き起こします。たとえば、`index` が 5 に達した場合（配列の有効インデックス範囲は 0 〜 4）、プログラムはクラッシュします。

配列インデックスが範囲外になるのを防ぐためには、条件制御を導入して、`index` が配列の範囲を超えないようにする必要があります。`if-else` 文を使って、`index` が配列の長さより小さいかどうかを判定できます。

## 条件制御：if-else 文

`if-else` 文は、Swift で最もよく使われる条件分岐文で、条件が成立するかどうかを判定し、その真偽によって異なるコードブロックを実行します。

基本構造：

```swift
if condition {
    // condition が true のときに実行されるコード
} else {
    // condition が false のときに実行されるコード
}
```

`if` 文の中の条件 `condition` はブール値（`Bool` 型）であり、`true` または `false` です。条件が `true` のときは `if` 部分のコードが実行され、そうでなければ `else` 部分のコードが実行されます。

たとえば：

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

この例では、`age` の値は 25 です。`if` 文は `age > 18` が成立するかどうかを判定し、条件が成立しているので `"Big Boy"` を出力します。

もし `else` 部分が不要なら、省略できます：

```swift
if condition {
    // condition が true のときに実行されるコード
}
```

### 条件を使ってインデックス範囲を制御する

配列インデックスが範囲外になるのを防ぐには、`if` 文を使って `index` が配列の範囲を超えないようにします：

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

ロジック分析：`sayings.count` の値は 5（名言が 5 つある）なので、`sayings.count - 1` は 4 になります。これが配列の最後の有効インデックスです。

`index` が 4 より小さいとき、ボタンを押して `+ 1` を実行するのは安全です。いったん `index` が 4 に達すると、条件は成立しなくなり、ボタンを押しても反応しなくなります。

これで、名言切り替え機能は実装できました：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### 名言を循環させる

最後の名言まで表示したあと、ボタンを押すと再び最初の名言に戻るようにしたい場合は、`else` 部分で実現できます：

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

ボタンを押したとき、もし `index` が配列最後の要素まで達していれば、`index` は 0 にリセットされ、名言表示が循環します。

## 名言ビューを最適化する

ここまでで名言カルーセルのロジックは実装できましたが、さらに UI をより美しく最適化することもできます。

完全コード：

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

この例では、`Text` ビューに白い半透明の背景と角丸を追加し、`Button` は `.borderedProminent` スタイルを使い、`VStack` には背景画像を設定しています。

補足知識：`background()` 修飾子で画像背景を扱う場合、そのデフォルト動作は、現在のビューが存在するレイアウト領域をできるだけ埋めることです。多くの場合、そのまま自然に安全領域（Safe Area）まで広がります。

これで、名言カルーセルのビューが完成しました。

![SwiftUI View](../../RESOURCE/011_word.png)

## まとめ

このレッスンを通して、複数の名言を保存するために配列を使い、`if` や `if-else` 文によって名言カルーセルを実現する方法を学びました。

また、配列の基本操作として、要素の追加、削除、変更、そして配列インデックス範囲外を防ぐ方法についても理解しました。

このレッスンは、名言カルーセルの機能実装を説明しただけでなく、配列と条件文の基本的な使い方を組み合わせることで、データ処理とプログラムフロー制御の能力を身につける助けにもなりました。

## 拡張知識 - 多条件分岐：if-else if-else 文

実際の開発では、複数の条件を処理する必要がよくあります。たとえば、あるゲームでスコアが 1 のときにイベント A、2 のときにイベント B、3 のときにイベント C を発火する、といったケースです。

2 つを超える条件分岐の場面では、`if-else if-else` 文を使って多重判定を行う必要があります。

基本構文：

```swift
if conditionA {
    // conditionA が true のときに実行されるコード
} else if conditionB {
    // conditionB が true のときに実行されるコード
} else if conditionC {
    // conditionC が true のときに実行されるコード
} else {
    // どの条件も満たさないときに実行されるコード
}
```

この場合、プログラムは順番に条件をチェックし、最初に成立した条件のコードを実行します。どの条件も成立しない場合は、`else` の後ろのコードを実行します。

名言カルーセルでも、`if-else if-else` 文を使って多重判定できます：

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

`index` が 0、1、2、3 のときは、ボタンを押すたびに `index += 1` が実行されます。`index` が 4（最後の要素）のときは、`index` を 0 にリセットして循環表示を実現します。

`else` 分岐は保険として使われ、想定外の値（たとえば `index` が誤って変更された場合）を防ぎます。

ここで使っている `==` は「等しいかどうか」を判定する演算子です。`if` 文で `index` とある数字が等しいかを判定し、等しければ `true` を返して後ろのコードブロックを実行します。等しくなければ次の `if` 判定へ進みます。

このような多重判定は、異なる条件場面ごとに異なるコードを実行したいときに役立ちます。
