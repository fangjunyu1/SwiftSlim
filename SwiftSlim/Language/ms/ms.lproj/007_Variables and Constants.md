# Pembolehubah dan pemalar

Pelajaran ini terutamanya mempelajari pembolehubah dan pemalar dalam Swift, serta mengenali beberapa jenis data yang biasa digunakan dan operator asas.

Kandungan ini ialah pengetahuan yang paling asas dalam pengaturcaraan, dan juga asas yang sangat penting untuk pembelajaran SwiftUI seterusnya.

## Pembolehubah dan pemalar dalam kehidupan

Kita boleh memahami pembolehubah dan pemalar melalui benda-benda dalam kehidupan seharian.

Pembolehubah dalam kehidupan:

- Kandungan yang dimainkan oleh setiap rancangan di televisyen adalah berbeza
- Cuaca setiap hari tidak sama
- Jam berubah setiap saat

Ciri bersama bagi semua perkara ini ialah: semuanya boleh berubah.

Jika televisyen sentiasa hanya memaparkan satu gambar, cuaca sentiasa cerah, dan jarum jam tidak pernah bergerak, maka perkara-perkara ini akan menjadi pemalar.

Satu mungkin berubah, satu lagi tidak akan berubah.

## Memahami pembolehubah dan pemalar

Dalam pembangunan App, biasanya pengguna perlu mengisi atau menyimpan beberapa maklumat.

Contohnya:

- nama akaun
- tarikh lahir
- maklumat hubungan
- alamat

Maklumat ini akan disimpan dan dipaparkan.

Contohnya, apabila pengguna memasukkan satu nama dalam App:

```
FangJunyu
```

Kita perlu menyimpan nama ini supaya ia dapat dipaparkan dalam App.

Proses penyimpanan ini boleh difahami secara ringkas seperti meletakkan sesuatu ke dalam sebuah laci.

Apabila kita menyimpan nama, ia seolah-olah meletakkan nama itu ke dalam laci.

Perkara yang perlu disimpan mungkin banyak, dan lacinya juga mungkin banyak. Untuk mengetahui apa yang terdapat dalam setiap laci, kita perlu memberikan satu nama kepada laci tersebut.

Contohnya:

```
name
```

Dalam contoh ini, `name` ialah nama, dan `FangJunyu` ialah maklumat yang disimpan.

![Var](../../RESOURCE/007_var.png)

**Dalam Swift, jika anda perlu menyimpan data, anda mesti menggunakan pembolehubah（var）atau pemalar（let）untuk mendeklarasikannya.**

Disebabkan nama biasanya boleh diubah, maka kita sepatutnya menggunakan pembolehubah.

```swift
var name = "FangJunyu"
```

Di sini satu pembolehubah bernama `name` telah diisytiharkan. Jenisnya ialah `String`, dan nilainya ialah `"FangJunyu"`。

### Perbezaan antara pembolehubah dan pemalar

Pembolehubah diisytiharkan dengan `var`:

```swift
var
```

Pemalar diisytiharkan dengan `let`:

```swift
let
```

Contohnya:

```swift
var name = "FangJunyu"
let id = 123456
```

Jika ia diisytiharkan sebagai pembolehubah, ini bermakna nilainya boleh diubah; jika diisytiharkan sebagai pemalar, nilainya tidak boleh diubah lagi.

Oleh itu, perbezaan utama antara pembolehubah dan pemalar ialah: sama ada nilainya dibenarkan berubah atau tidak.

### Mengubah pemalar

Jika kod cuba mengubah nilai pemalar:

```swift
let name = "Sam"
name = "Bob"
```

Swift akan memberi petunjuk bahawa tugasan tidak dapat dilakukan kerana ia ialah satu pemalar.

```
Cannot assign to property: 'name' is a 'let' constant
```

Mekanisme ini boleh membantu pembangun mengelakkan sesetengah data penting daripada diubah secara tidak sengaja.

### Memaparkan dalam SwiftUI

Buka fail `ContentView.swift`, dan isytiharkan pembolehubah di dalam View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Di sini kita mengisytiharkan pembolehubah bernama `name`, lalu memaparkannya pada antara muka melalui `Text`。

Jika kita mengubah kandungan pembolehubah:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Kandungan teks yang dipaparkan oleh `Text` juga akan berubah.

Dengan cara ini, kita boleh menggunakan pembolehubah untuk mengawal kandungan yang dipaparkan pada antara muka, tanpa perlu mengubah teks secara terus setiap kali di dalam `Text`.

Jika maklumat ini diperlukan di tempat lain, kita juga boleh menghantar pembolehubah itu ke sana, seolah-olah mengambil kandungan dalam “laci” dan memberikannya untuk digunakan di tempat lain.

### Kedudukan pembolehubah dan pemalar dalam SwiftUI

Dalam SwiftUI, pembolehubah dan pemalar biasanya ditulis di luar `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Sudah tentu, pembolehubah dan pemalar juga boleh ditulis di dalam `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Namun begitu, terdapat satu perbezaan penting antara kedua-duanya:

- Jika pembolehubah dan pemalar ditulis di dalam `body`, ia akan dicipta semula setiap kali view dikira semula.
- Jika ditulis di luar `body`, pembolehubah akan wujud sebagai sifat struct view, dan struktur kod akan menjadi lebih jelas.

Oleh itu, dalam pembangunan sebenar, pembolehubah dan pemalar biasanya akan ditulis di luar `body`.

## Jenis data

Pembolehubah boleh menyimpan pelbagai jenis data yang berbeza. Jenis-jenis ini dipanggil jenis data.

Contohnya, sebelum ini kita menggunakan `Text` untuk memaparkan teks:

```swift
Text("Hello, World")
```

Di sini `"Hello, World"` tergolong dalam jenis rentetan（`String`）。

Rentetan digunakan untuk mewakili kandungan teks, dan dalam Swift ia perlu dibungkus dengan tanda petik berganda `""`。

Contohnya:

```swift
var hello = "Hello, World"
```

Selain rentetan, Swift juga mempunyai banyak lagi jenis data.

Empat jenis yang paling biasa pada peringkat awal pembelajaran ialah:

- String
- Int
- Double
- Bool

Empat jenis ini sudah cukup untuk menyelesaikan kebanyakan pemprosesan data asas.

**String**

`String` mewakili kandungan teks. Contohnya:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Rentetan biasanya digunakan untuk mewakili: nama pengguna, tajuk, kandungan teks.

**Int**

`Int` mewakili integer, iaitu nombor bulat tanpa tempat perpuluhan.

Contohnya:

```swift
var age = 26
var count = 100
```

Integer biasanya digunakan untuk mewakili: umur, kuantiti, kiraan.

**Double**

`Double` mewakili nombor yang mempunyai tempat perpuluhan.

Contohnya:

```swift
var weight = 74.5
var height = 185.0
```

Dalam Swift, nombor perpuluhan secara lalai biasanya menggunakan jenis `Double`。

Terdapat juga satu jenis yang serupa dipanggil `Float`, tetapi julat nilai yang dapat diwakilinya lebih kecil. Oleh itu, dalam pembangunan sebenar `Double` lebih kerap digunakan.

**Bool**

Jenis `Bool` digunakan untuk mewakili dua keadaan: `true` dan `false`。

Contohnya:

```swift
var isShowAlert = true
var isLogin = false
```

Jenis `Bool` biasanya digunakan dalam penghakiman bersyarat, contohnya sama ada mahu memaparkan kotak peringatan.

Untuk situasi yang hanya mempunyai dua kemungkinan keputusan, `Bool` sangat sesuai digunakan.

### Paparan dalam SwiftUI

Apabila kita memaparkan jenis `String`, kita boleh terus menggunakan `Text`:

```swift
Text(name)
```

Tetapi `Int`、`Double` dan jenis lain bukanlah rentetan, jadi ia tidak boleh terus digunakan sebagai sebahagian daripada kandungan teks.

Jika kita mahu memaparkan data ini dalam `Text`, kita boleh menggunakan interpolasi rentetan（String Interpolation）:

```swift
\()
```

Interpolasi rentetan perlu ditulis di dalam kandungan rentetan, dan membungkus pembolehubah atau pemalar dengan `\\()`。

Contohnya:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Dalam kod di atas, `""` mewakili rentetan, dan `\\()` digunakan untuk memasukkan pembolehubah atau pemalar ke dalam rentetan.

Contohnya:

```swift
"DoubleNum: \(num * 2)"
```

Kandungan yang dipaparkan ialah:

```swift
DoubleNum: 2
```

Melalui cara ini, kita boleh memasukkan pembolehubah atau pemalar ke dalam rentetan, kemudian menggunakan `Text` untuk memaparkannya pada antara muka.

Petua: `\\()` hanya boleh digunakan di dalam rentetan `""`。

## Operator

Semasa mendeklarasikan pembolehubah atau pemalar, kita boleh melihat penulisan seperti berikut:

```swift
var num = 1
```

Tanda `=` di sini dipanggil operator tugasan.

Fungsinya ialah: memberikan nilai di sebelah kanan kepada pembolehubah di sebelah kiri.

Dalam contoh ini, `1` telah ditugaskan kepada pembolehubah `num`。

Selain operator tugasan, terdapat juga beberapa operator nombor yang biasa:

- `+`
- `-`
- `*`
- `/`

Apabila kita melakukan pengiraan terhadap nombor, seperti data jenis `Int` atau `Double`, operator ini akan digunakan.

Contohnya:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Selepas pengiraan selesai, hasilnya akan disimpan ke dalam pembolehubah.

## Ringkasan

Pembolehubah, pemalar dan operator ialah konsep paling asas dalam pengaturcaraan.

Melalui pembolehubah dan pemalar, kita boleh menyimpan pelbagai data dalam program; melalui jenis data, kita dapat menentukan jenis data tersebut; dan melalui operator, kita boleh mengira serta memproses data.

Pengetahuan ini ibarat alat asas dalam dunia pengaturcaraan. Menguasainya akan meletakkan asas yang kukuh untuk pembelajaran Swift dan SwiftUI seterusnya.
