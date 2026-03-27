# Sistem jenis

Dalam pelajaran sebelum ini, kita telah mempelajari pembolehubah dan mengetahui bahawa pembolehubah boleh menyimpan data daripada jenis yang berbeza.

Contohnya:

```swift
var hello = "Hello, World"
```

Di sini `hello` menyimpan satu bahagian teks, maka jenisnya ialah `String`。

Seterusnya, kita akan mempelajari konsep jenis（Type）secara sistematik, serta deklarasi jenis secara eksplisit dan inferens jenis, supaya dapat memahami sifat sebenar pembolehubah dengan lebih mendalam.

## Apakah itu jenis

Dalam Swift, setiap nilai mempunyai satu jenis yang jelas. Jenis menentukan apakah nilai itu, dan apa yang boleh dilakukannya.

Contohnya:

- 42 ialah `Int`（integer）
- "Hello" ialah `String`（rentetan）
- true ialah `Bool`（boolean）

Semua ini tergolong dalam jenis yang berbeza, dan kegunaannya juga berbeza.

## Jenis asas yang biasa dalam Swift

Pada peringkat permulaan, jenis yang paling biasa adalah seperti berikut:

- `String`：rentetan（teks）
- `Int`：integer
- `Double`：nombor titik terapung（mempunyai perpuluhan, ketepatan lebih tinggi）
- `Bool`：nilai boolean（true/false）

Selain itu, terdapat juga `Float`（nombor titik terapung），tetapi ketepatannya lebih rendah daripada `Double` dan biasanya kurang digunakan; `Character`（aksara tunggal）juga ada, seperti `"A"`、`"!"` dan aksara tunggal yang lain.

### Deklarasi jenis（jenis eksplisit）

Dalam Swift, kita boleh menentukan jenis secara manual semasa mendeklarasikan pembolehubah:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Tambahkan `: jenis` selepas nama pembolehubah untuk mengisytiharkan jenis pembolehubah.

Penulisan jenis bagi array ialah `: [jenis]`：

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Dalam kod ini, array `scores` hanya boleh menyimpan elemen jenis `Int`，dan `tags` hanya boleh menyimpan elemen jenis `String`。

Mengisytiharkan jenis secara eksplisit boleh menjadikan niat kod lebih jelas, dan dalam keadaan tertentu boleh mengelakkan kesilapan inferens jenis.

## Inferens jenis

Dalam banyak keadaan, kita tidak perlu mengisytiharkan jenis secara eksplisit:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Ini kerana penyusun Swift akan membuat inferens jenis secara automatik berdasarkan “nilai awal”.

## Deklarasi eksplisit dan inferens jenis

Dalam pelajaran sebelum ini, kita tidak memperkenalkan deklarasi eksplisit. Contohnya:

```swift
var age: Int = 18
```

Sebaliknya, kita lebih mengutamakan inferens jenis:

```swift
var age = 18
```

Dalam contoh ini, kedua-dua penulisan adalah setara, kerana `age` akhirnya akan ditentukan sebagai jenis `Int`。Berbanding itu, penulisan inferens jenis lebih ringkas.

Sebab kita tidak menekankan deklarasi eksplisit pada peringkat awal ialah kerana inferens jenis boleh mengurangkan maklumat tambahan dalam kod, lalu mengurangkan kos pemahaman bagi pemula.

## Mengapa jenis diperlukan

Swift ialah satu bahasa bertipe kuat（Strongly Typed Language）。

Ini bermaksud: sebaik sahaja jenis sesuatu pembolehubah ditentukan, ia tidak boleh diubah sesuka hati.

Contohnya:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

`20` yang pertama ialah jenis `Int`，jadi ia boleh ditugaskan kepada `age`；`"20"` yang kedua ialah jenis `String`，tidak sepadan dengan `Int`，maka ralat akan berlaku.

`nums` ialah array jenis `[Int]`，jadi ia hanya boleh menyimpan integer dan tidak boleh mencampurkan rentetan.

Jenis boleh mengehadkan penggunaan data, dan mengesan masalah ketidakpadanan jenis pada peringkat kompilasi, lalu mengurangkan BUG yang disebabkan kekeliruan jenis, serta meningkatkan kestabilan dan kebolehselenggaraan kod.

## Bilakah jenis mesti diisytiharkan secara eksplisit

Walaupun Swift boleh membuat inferens jenis secara automatik, ada keadaan di mana penyusun tidak dapat membuat inferens, atau membuat inferens yang salah. Pada masa itu, kita perlu mengisytiharkannya secara manual.

**1. Array kosong**

Semasa mencipta array kosong, jenis mesti diisytiharkan secara eksplisit:

```swift
var nums: [Int] = []
```

Jika jenis tidak ditulis:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Penyusun tidak dapat membuat inferens jenis elemen berdasarkan array kosong, lalu menyebabkan ralat kompilasi.

**2. Mengelakkan inferens yang salah**

```swift
var value = 10   // Int
```

Dalam contoh ini, walaupun `10` juga boleh mewakili nombor titik terapung（`Double`），tetapi kerana tiada titik perpuluhan, penyusun akan membuat inferens lalai bahawa ia ialah jenis `Int`。

Jika kita berharap `value` mewakili nombor titik terapung, maka kita perlu mengisytiharkan jenis secara eksplisit:

```swift
var value: Double = 10   // Double
```

Apabila hasil inferens jenis tidak memenuhi jangkaan, kita sepatutnya menggunakan deklarasi eksplisit atau melaras bentuk literal bagi memastikan jenis adalah betul.

**3. Jenis tersuai**

Kemudian kita juga akan mempelajari jenis tersuai. Semasa menggunakan jenis tersuai, biasanya kita juga perlu mengisytiharkannya secara eksplisit:

```swift
var info: GameInfo
var users: [User] = []
```

Sebabnya sama seperti array kosong, kerana penyusun tidak dapat membuat inferens jenis secara automatik daripada nilai kosong.

## Penukaran jenis

Dalam Swift, jenis yang berbeza tidak boleh ditukar secara automatik; ia mesti ditukar secara manual.

Contohnya, menjumlahkan dua nombor daripada jenis yang berbeza:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Dalam kod ini, `a` ialah jenis `Int`，`b` ialah jenis `Double`。Jenisnya berbeza, jadi operasi tidak boleh dilakukan secara langsung.

Sebelum melakukan operasi, kita perlu menukar salah satu nilainya kepada jenis yang sama terlebih dahulu:

```swift
var result = Double(a) + b
```

Kod ini bermaksud menukar `a` yang bertipe `Int` kepada `Double` terlebih dahulu, kemudian menjumlahkannya dengan `b`，dan akhirnya menugaskan hasilnya kepada `result`。

Perlu diperhatikan bahawa penukaran jenis tidak akan mengubah jenis pembolehubah asal. Contohnya, `Double(a)` tidak akan menukar jenis `a` daripada `Int`，sebaliknya mencipta satu nilai `Double` baharu untuk mengambil bahagian dalam operasi.

Jenis lain juga boleh ditukar dengan cara yang serupa, iaitu menggunakan `jenis sasaran + ()`，dan memasukkan nilai yang perlu ditukar. Contohnya:

```
Int()、Double()、String()
```

Contoh:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Perlu diingat bahawa tidak semua penukaran jenis akan berjaya sepenuhnya. Contohnya, apabila `Double → Int`，bahagian perpuluhan akan dipotong secara langsung dan tidak akan dibundarkan.

## Alias jenis

Dalam Swift, kita juga boleh memberikan alias kepada jenis sedia ada supaya makna kod menjadi lebih jelas:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Di sini `UserID` pada asasnya masih ialah `Int`，jenisnya tidak berubah, cuma namanya menjadi lebih bermakna.

Dalam projek yang mempunyai banyak kod dan jenis yang kompleks, alias jenis boleh menjadikan kod lebih mudah dibaca.

## Contoh jenis

Di bawah ini, melalui satu contoh mudah, kita akan melihat peranan jenis dalam pembangunan sebenar.

### Mencipta pembolehubah

Mula-mula, kita cipta satu pembolehubah `age`：

```swift
var age = 20
```

Disebabkan pembolehubah ini perlu dipaparkan dan diubah dalam SwiftUI, maka ia perlu diisytiharkan menggunakan `@State`：

```swift
@State private var age = 20
```

`private` telah disebut sebelum ini, dan bermaksud pembolehubah ini hanya boleh digunakan dalam view semasa. Kita akan mempelajarinya dengan lebih mendalam kemudian.

### Memaparkan data dalam SwiftUI

Memaparkan pembolehubah `age` dalam SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Kini view akan memaparkan:

```swift
age: 20
```

### Mengubah data

Seterusnya, kita tambahkan dua butang untuk mengubah `age`：

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Hasil pelaksanaan

Apabila `changeAge1` ditekan, `age` akan ditugaskan menjadi `18`：

```swift
age = 18
```

Disebabkan `18` ialah jenis `Int` dan sepadan dengan jenis `age`，maka tugasan itu berjaya.

`changeAge2` pula akan menghasilkan ralat:

```swift
age = "18"
```

Mesej ralat:

```
Cannot assign value of type 'String' to type 'Int'
```

Ini kerana `"18"` ialah jenis `String`（rentetan perlu dibungkus dengan `""`），sedangkan `age` ialah jenis `Int`。Jenisnya tidak sepadan, maka tugasan tidak boleh dilakukan.

### Mengapa ralat berlaku?

Kuncinya terletak pada baris kod ini:

```swift
@State private var age = 20   // Int
```

Walaupun jenis tidak diisytiharkan secara eksplisit, oleh sebab nilai awal `20` ialah jenis `Int`，penyusun akan membuat inferens automatik bahawa `age` juga ialah `Int`。

Sebaik sahaja jenis ditentukan, ia tidak boleh lagi ditugaskan dengan jenis lain.

Tambahan pula, butang `changeAge2` tidak “gagal semasa runtime”，tetapi akan menghasilkan ralat terus pada peringkat kompilasi, dan kod tidak dapat melalui proses kompilasi.

Inilah salah satu kelebihan Swift sebagai bahasa bertipe kuat: ia boleh mengesan masalah jenis lebih awal semasa menulis kod.

### Penulisan yang betul

Selepas membuang kod yang salah:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Apabila butang `changeAge1` ditekan, view akan dikemas kini menjadi:

```
age: 18
```

### Deklarasi jenis eksplisit（pilihan）

Kita juga boleh menentukan jenis dengan jelas semasa mentakrifkannya:

```swift
@State private var age: Int = 20
```

Cara penulisan ini boleh menjadikan jenis lebih jelas, tetapi dalam senario mudah ia tidak semestinya diperlukan.

## Ringkasan

Pelajaran ini terutamanya menerangkan sistem jenis Swift serta peranannya dalam pembangunan sebenar.

Dalam Swift, setiap nilai mempunyai satu jenis yang jelas, dan jenis menentukan makna data tersebut serta operasi yang boleh dilakukan ke atasnya.

Swift ialah bahasa bertipe kuat. Sebaik sahaja jenis pembolehubah ditentukan, ia tidak lagi boleh ditugaskan dengan jenis yang lain. Kekangan ini boleh mengesan ralat pada peringkat kompilasi, sekali gus mengurangkan masalah semasa runtime dan meningkatkan keselamatan kod.

Jenis pembolehubah boleh dibuat inferens secara automatik berdasarkan nilai awal, atau diisytiharkan secara eksplisit. Dalam sesetengah keadaan（seperti array kosong, kesalahan inferens jenis, atau jenis tersuai）, penyusun tidak dapat membuat inferens dengan betul, maka deklarasi eksplisit menjadi wajib.

Jenis yang berbeza tidak boleh ditukar secara automatik. Ia mesti ditukar secara eksplisit melalui `Int()`、`Double()`、`String()` dan sebagainya.

Jenis juga menyokong alias, dan terutamanya dalam projek yang kompleks, alias jenis boleh meningkatkan kebolehbacaan.

Jenis bukan sekadar penanda data, tetapi juga satu mekanisme kekangan yang memastikan penggunaan data adalah selamat, jelas dan terkawal.

## Pengetahuan lanjutan - Jenis optional

Semasa melakukan penukaran jenis, ada sesetengah operasi yang mungkin gagal.

Contohnya, menukar `String` kepada `Double`：

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Di sini `Double(input)` tidak memulangkan `Double`，tetapi:

```
Double?
```

Inilah yang dipanggil jenis optional（Optional）。

### Mengapa ia memulangkan jenis optional?

Ini kerana kandungan rentetan tidak pasti. `"3.14"` boleh ditukar kepada `Double`，tetapi `"Hello"` tidak boleh ditukar kepada `Double`。

Dengan kata lain, operasi ini mungkin berjaya, atau mungkin gagal.

Oleh itu, Swift menggunakan jenis optional untuk mewakili ketidakpastian seperti ini.

### Apakah itu jenis optional?

Jenis optional bermaksud: sesuatu nilai mungkin wujud, atau mungkin tidak wujud.

Contohnya:

```
Double?
```

Jenis ini bermaksud, jika ada nilai, ia akan dipaparkan sebagai `Optional(...)` semasa dicetak；jika tiada nilai, maka `nil` akan dipulangkan.

Perlu diperhatikan bahawa `nil` bermaksud “tiada nilai”，bukannya `0` atau rentetan kosong.

### Contoh

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

Ini menunjukkan bahawa rentetan berjaya ditukar kepada `Double` dan memperoleh `3.14`，tetapi kerana jenisnya ialah `Double?`，maka ia dibungkus di dalam `Optional`。

Jika penukaran gagal:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

Ini kerana `"Hello"` tidak boleh ditukar kepada jenis `Double`，maka penukaran gagal dan `nil` dipulangkan.

### Apakah itu Optional(...)?

Apabila kita mencetak jenis optional secara terus:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift akan memaparkan “penerangan nyahpepijat”:

```
Optional(3.14)
```

Ini bukanlah sebahagian daripada data sebenar, tetapi hanya satu petunjuk bahawa nilai semasa ialah satu “jenis optional”，dan di dalamnya terkandung satu nilai.

### Membuka bungkusan jenis optional

Dalam pembangunan sebenar, kita biasanya perlu mengeluarkan nilai sebenar daripada jenis optional. Proses ini dipanggil membuka bungkusan（Unwrapping）。

Salah satu cara yang biasa ialah menggunakan `??` untuk menyediakan nilai lalai:

```
??
```

Ini dipanggil operator penggabungan kosong（Nil-Coalescing Operator）。

Contohnya:

```swift
name ?? "FangJunyu"
```

Kod ini bermaksud, jika `name` mempunyai nilai, pulangkan nilai tersebut; jika ia `nil`，gunakan nilai lalai `"FangJunyu"`。

Perlu diperhatikan bahawa jenis nilai lalai mesti sepadan dengan jenis optional.

### Menggunakan ?? untuk menyediakan nilai lalai

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

Apabila `input` ditukar kepada jenis `Double`，penukaran berjaya dan nilainya dipaparkan. Jika penukaran gagal, maka nilai lalai yang disediakan oleh `??` akan dipaparkan.

Jika penukaran gagal:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

Di sini, apabila `input` ditukar kepada jenis `Double`，penukaran gagal dan `nil` dipulangkan. `??` akan menyediakan satu nilai lalai untuk `nil`。

Jenis optional digunakan untuk mewakili situasi “mungkin ada nilai, atau mungkin tiada nilai”。

Dalam operasi yang mungkin gagal seperti penukaran jenis, Swift akan memulangkan jenis optional bagi menjamin keselamatan program.

Apabila kita perlu menggunakan nilai di dalamnya, kita boleh menyediakan nilai lalai melalui `??`，supaya walaupun `nil` muncul, kita masih boleh memperoleh hasil yang munasabah.
