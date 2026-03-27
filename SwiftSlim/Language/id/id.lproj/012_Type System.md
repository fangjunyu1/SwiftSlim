# Sistem tipe

Di pelajaran sebelumnya, kita sudah mempelajari variabel, dan tahu bahwa variabel dapat menyimpan data dengan tipe yang berbeda.

Misalnya:

```swift
var hello = "Hello, World"
```

Di sini `hello` menyimpan sebuah teks, sehingga tipenya adalah `String`.

Selanjutnya, kita akan mempelajari konsep tipe (`Type`) secara sistematis, termasuk deklarasi tipe eksplisit dan inferensi tipe, agar bisa memahami hakikat variabel dengan lebih dalam.

## Apa itu tipe

Di Swift, setiap nilai memiliki tipe yang jelas. Tipe menentukan nilai itu apa, dan apa yang bisa dilakukan dengannya.

Misalnya:

- `42` adalah sebuah `Int` (bilangan bulat)
- `"Hello"` adalah `String` (teks)
- `true` adalah `Bool` (nilai boolean)

Mereka termasuk tipe yang berbeda, sehingga kegunaannya juga berbeda.

## Tipe dasar umum di Swift

Pada tahap awal belajar, tipe yang paling umum adalah sebagai berikut:

- `String`: string (teks)
- `Int`: bilangan bulat
- `Double`: bilangan pecahan / floating-point (berisi desimal, dengan presisi lebih tinggi)
- `Bool`: nilai boolean (`true` / `false`)

Selain itu, ada juga `Float` (bilangan pecahan), tetapi presisinya lebih rendah daripada `Double`, sehingga umumnya lebih jarang digunakan; lalu `Character` (satu karakter), misalnya `"A"` atau `"!"`.

### Deklarasi tipe (tipe eksplisit)

Di Swift, kita bisa menentukan tipe secara manual saat mendeklarasikan variabel:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Kita menambahkan `: tipe` setelah nama variabel untuk mendeklarasikan tipenya.

Penulisan tipe untuk array adalah `: [tipe]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Pada potongan kode ini, array `scores` hanya dapat menyimpan elemen bertipe `Int`, dan `tags` hanya dapat menyimpan elemen bertipe `String`.

Mendeklarasikan tipe secara eksplisit dapat membuat maksud kode menjadi lebih jelas, dan dalam beberapa situasi dapat menghindari kesalahan inferensi tipe.

## Inferensi tipe

Dalam banyak situasi, kita tidak perlu mendeklarasikan tipe secara eksplisit:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Hal ini karena compiler Swift akan secara otomatis menyimpulkan tipe berdasarkan “nilai awal”.

## Deklarasi eksplisit dan inferensi tipe

Di pelajaran sebelumnya, kita belum memperkenalkan deklarasi eksplisit seperti:

```swift
var age: Int = 18
```

Sebaliknya, kita lebih dulu menggunakan inferensi tipe:

```swift
var age = 18
```

Dalam contoh ini, kedua cara penulisan tersebut setara: `age` sama-sama akan ditentukan sebagai tipe `Int`. Dibandingkan itu, bentuk inferensi tipe lebih ringkas.

Alasan mengapa di tahap awal kita tidak menekankan deklarasi eksplisit adalah karena inferensi tipe dapat mengurangi informasi tambahan di dalam kode, sehingga menurunkan beban pemahaman bagi pemula.

## Mengapa tipe itu diperlukan

Swift adalah bahasa bertipe kuat (`Strongly Typed Language`).

Artinya: begitu tipe suatu variabel sudah ditentukan, tipe itu tidak bisa diubah sembarangan.

Misalnya:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Angka `20` yang pertama bertipe `Int`, sehingga bisa diberikan ke `age`; sedangkan `"20"` yang kedua bertipe `String`, tidak sesuai dengan tipe `Int`, sehingga akan muncul error.

`nums` adalah array bertipe `[Int]`, sehingga hanya bisa menyimpan bilangan bulat dan tidak bisa dicampur dengan string.

Tipe dapat membatasi cara data digunakan, menemukan masalah ketidakcocokan tipe saat tahap kompilasi, sehingga mengurangi bug akibat kekacauan tipe, serta meningkatkan stabilitas dan kemudahan perawatan kode.

## Kapan kita harus mendeklarasikan tipe secara eksplisit

Walaupun Swift dapat menyimpulkan tipe secara otomatis, ada beberapa situasi di mana compiler tidak bisa menyimpulkannya, atau malah menyimpulkannya dengan salah. Pada saat itu kita perlu mendeklarasikan tipe secara manual.

**1. Array kosong**

Saat membuat array kosong, tipe harus dideklarasikan secara eksplisit:

```swift
var nums: [Int] = []
```

Jika tipe tidak ditulis:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compiler tidak bisa menyimpulkan tipe elemen array dari array kosong, sehingga akan muncul error kompilasi.

**2. Menghindari inferensi yang salah**

```swift
var value = 10   // Int
```

Dalam contoh ini, walaupun `10` juga bisa merepresentasikan angka pecahan (`Double`), karena tidak memiliki titik desimal, compiler akan secara default menyimpulkannya sebagai `Int`.

Jika kita ingin `value` direpresentasikan sebagai bilangan pecahan, maka tipenya harus dideklarasikan secara eksplisit:

```swift
var value: Double = 10   // Double
```

Ketika hasil inferensi tipe tidak sesuai dengan yang diharapkan, kita harus memastikan kebenaran tipenya melalui deklarasi tipe eksplisit atau menyesuaikan bentuk literalnya.

**3. Tipe kustom**

Nanti kita juga akan mempelajari tipe kustom. Saat menggunakan tipe kustom, biasanya juga perlu deklarasi eksplisit:

```swift
var info: GameInfo
var users: [User] = []
```

Alasannya sama seperti array kosong: compiler tidak bisa menyimpulkan tipe secara otomatis dari nilai kosong.

## Konversi tipe

Di Swift, tipe yang berbeda tidak bisa dikonversi otomatis. Konversi harus dilakukan secara manual.

Misalnya, menjumlahkan dua angka dengan tipe berbeda:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Pada kode ini, `a` bertipe `Int`, `b` bertipe `Double`. Karena tipenya berbeda, keduanya tidak bisa langsung dioperasikan bersama.

Sebelum melakukan operasi, salah satu nilainya harus diubah menjadi tipe yang sama:

```swift
var result = Double(a) + b
```

Kode ini berarti mengubah `a` yang bertipe `Int` menjadi `Double`, lalu menjumlahkannya dengan `b`, dan hasilnya diberikan ke `result`.

Perlu diperhatikan bahwa konversi tipe tidak mengubah tipe variabel aslinya. Misalnya, `Double(a)` tidak mengubah `a` menjadi `Double`, melainkan membuat nilai `Double` baru untuk dipakai dalam perhitungan.

Tipe lain juga bisa dikonversi dengan cara serupa, yaitu menggunakan nama tipe tujuan + `()`, lalu memasukkan nilai yang ingin dikonversi. Misalnya:

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

Perlu diperhatikan bahwa tidak semua tipe dapat dikonversi dengan hasil sempurna. Misalnya, dari `Double` ke `Int`, bagian desimal akan langsung dipotong, bukan dibulatkan.

## Type alias

Di Swift, kita juga bisa memberikan nama alias untuk tipe yang sudah ada, sehingga makna kode menjadi lebih jelas:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Di sini `UserID` pada dasarnya tetap adalah `Int`, tipenya tidak berubah, hanya namanya menjadi lebih bermakna.

Dalam proyek dengan banyak kode dan tipe yang kompleks, type alias dapat membuat kode lebih mudah dibaca.

## Contoh tipe

Di bawah ini, kita akan memakai satu contoh sederhana untuk menunjukkan peran tipe dalam pengembangan nyata.

### Membuat variabel

Pertama, kita membuat sebuah variabel `age`:

```swift
var age = 20
```

Karena variabel ini perlu ditampilkan dan diubah di SwiftUI, maka kita harus mendeklarasikannya menggunakan `@State`:

```swift
@State private var age = 20
```

`private` sudah sempat disebut sebelumnya, artinya variabel ini hanya bisa digunakan di view saat ini. Nanti kita akan mempelajarinya lebih lanjut.

### Menampilkan data di SwiftUI

Menampilkan variabel `age` di SwiftUI:

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

Sekarang view akan menampilkan:

```swift
age: 20
```

### Mengubah data

Selanjutnya, kita tambahkan dua tombol untuk mengubah `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Hasil menjalankan

Saat menekan `changeAge1`, `age` akan diberi nilai 18:

```swift
age = 18
```

Karena 18 bertipe `Int`, sama dengan tipe `age`, maka assignment berhasil.

`changeAge2` akan menimbulkan error:

```swift
age = "18"
```

Pesan error:

```
Cannot assign value of type 'String' to type 'Int'
```

Ini karena `"18"` bertipe `String` (string harus dibungkus dengan `""`), sedangkan `age` bertipe `Int`, sehingga tipenya tidak cocok dan tidak bisa diassign.

### Mengapa muncul error?

Kuncinya ada pada baris ini:

```swift
@State private var age = 20   // Int
```

Walaupun tidak ada deklarasi tipe eksplisit, karena nilai awalnya `20` bertipe `Int`, compiler akan otomatis menyimpulkan `age` sebagai `Int`.

Setelah tipe ditentukan, nilainya tidak boleh lagi diassign dengan tipe lain.

Selain itu, tombol `changeAge2` bukan “gagal saat runtime”, tetapi sudah menimbulkan error saat tahap kompilasi, sehingga kodenya tidak akan lolos compile.

Inilah salah satu keunggulan Swift sebagai bahasa bertipe kuat: masalah tipe bisa ditemukan lebih awal saat menulis kode.

### Penulisan yang benar

Setelah menghapus kode yang salah:

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

Saat tombol `changeAge1` ditekan, view akan diperbarui menjadi:

```
age: 18
```

### Deklarasi tipe eksplisit (opsional)

Kita juga bisa menentukan tipenya secara jelas saat mendefinisikan:

```swift
@State private var age: Int = 20
```

Penulisan ini membuat tipe menjadi lebih jelas, tetapi dalam skenario yang sederhana tidak selalu wajib.

## Ringkasan

Pelajaran ini terutama menjelaskan sistem tipe Swift dan perannya dalam pengembangan nyata.

Di Swift, setiap nilai memiliki tipe yang jelas. Tipe menentukan makna data tersebut, serta operasi apa yang bisa dilakukan dengannya.

Swift adalah bahasa bertipe kuat, sehingga begitu tipe variabel ditentukan, ia tidak bisa lagi diberi nilai dari tipe lain. Pembatasan ini memungkinkan error ditemukan sejak tahap kompilasi, sehingga mengurangi masalah runtime dan meningkatkan keamanan kode.

Tipe variabel dapat disimpulkan otomatis dari nilai awalnya, atau juga bisa dideklarasikan secara eksplisit. Dalam beberapa kondisi, seperti array kosong, hasil inferensi tipe yang salah, atau tipe kustom, compiler tidak bisa menyimpulkan tipe dengan benar, sehingga deklarasi eksplisit menjadi wajib.

Antar tipe yang berbeda tidak bisa dikonversi secara otomatis. Konversi harus dilakukan secara eksplisit melalui bentuk seperti `Int()`, `Double()`, `String()`, dan sebagainya.

Tipe juga mendukung alias. Khususnya dalam proyek yang kompleks, type alias dapat meningkatkan keterbacaan.

Tipe bukan hanya penanda data, tetapi juga sebuah mekanisme pembatasan yang memastikan penggunaan data tetap aman, jelas, dan terkendali.

## Pengetahuan tambahan - Tipe optional

Dalam proses konversi tipe, ada beberapa operasi yang mungkin gagal.

Misalnya, mengubah `String` menjadi `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Di sini, `Double(input)` tidak mengembalikan `Double`, melainkan:

```
Double?
```

Inilah yang disebut tipe optional (`Optional`).

### Mengapa yang dikembalikan adalah optional?

Karena isi string bersifat tidak pasti. `"3.14"` bisa dikonversi menjadi `Double`, sedangkan `"Hello"` tidak bisa dikonversi menjadi `Double`.

Artinya, operasi ini bisa berhasil, dan juga bisa gagal.

Karena itu, Swift menggunakan tipe optional untuk mewakili ketidakpastian semacam ini.

### Apa itu tipe optional?

Tipe optional berarti: sebuah nilai bisa ada, dan juga bisa tidak ada.

Misalnya:

```
Double?
```

Tipe ini berarti jika ada nilai, saat dicetak akan tampil sebagai `Optional(...)`; jika tidak ada, maka hasilnya adalah `nil`.

Perlu diperhatikan bahwa `nil` berarti “tidak ada nilai”, bukan 0 atau string kosong.

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

Ini berarti string berhasil dikonversi menjadi `Double`, menghasilkan 3.14. Namun karena tipenya `Double?`, nilainya dibungkus di dalam `Optional`.

Jika konversi gagal:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

Karena `"Hello"` tidak bisa dikonversi ke tipe `Double`, konversinya gagal dan mengembalikan `nil`.

### Apa itu Optional(...)?

Ketika kita langsung mencetak tipe optional:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift akan menampilkan “deskripsi debug”-nya:

```
Optional(3.14)
```

Ini bukan bagian dari data yang sebenarnya, melainkan hanya petunjuk bahwa nilai saat ini adalah “tipe optional”, dan di dalamnya ada sebuah nilai.

### Unwrapping optional

Dalam pengembangan nyata, biasanya kita perlu mengambil nilai sebenarnya dari tipe optional. Proses ini disebut unwrapping.

Salah satu cara yang umum adalah menggunakan `??` untuk memberikan nilai default:

```
??
```

Ini disebut operator penggabungan `nil` (`Nil-Coalescing Operator`).

Misalnya:

```swift
name ?? "FangJunyu"
```

Potongan kode ini berarti: jika `name` punya nilai, kembalikan nilai tersebut; jika `nil`, gunakan nilai default `"FangJunyu"`.

Perlu diperhatikan bahwa tipe nilai default harus sama dengan tipe dasar dari optional tersebut.

### Menggunakan ?? untuk memberikan nilai default

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

Saat `input` dikonversi ke tipe `Double`, jika konversinya berhasil maka nilai hasilnya akan ditampilkan. Jika konversi gagal, maka akan menampilkan nilai default yang diberikan oleh `??`.

Jika konversi gagal:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

Di sini, saat `input` dikonversi ke `Double`, konversi gagal dan menghasilkan `nil`, lalu `??` akan memberikan nilai default untuk `nil`.

Tipe optional digunakan untuk menyatakan situasi “mungkin ada nilai, mungkin juga tidak ada nilai”.

Dalam operasi seperti konversi tipe yang berpotensi gagal, Swift akan mengembalikan tipe optional demi menjaga keamanan program.

Saat kita perlu menggunakan nilai di dalamnya, kita bisa memakai `??` untuk memberikan nilai default, sehingga meskipun muncul `nil`, kita tetap bisa memperoleh hasil yang masuk akal.
