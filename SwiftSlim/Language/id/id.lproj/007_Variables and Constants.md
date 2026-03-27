# Variabel dan konstanta

Di pelajaran ini, kita terutama akan mempelajari variabel dan konstanta di Swift, serta mengenal beberapa tipe data umum dan operator dasar.

Isi ini merupakan pengetahuan paling dasar dalam pemrograman, dan juga fondasi penting untuk mempelajari SwiftUI selanjutnya.

## Variabel dan konstanta dalam kehidupan sehari-hari

Kita bisa memahami variabel dan konstanta melalui hal-hal di kehidupan sehari-hari.

Variabel dalam kehidupan sehari-hari:

- isi acara yang diputar di televisi berbeda-beda
- cuaca setiap hari tidak sama
- jarum jam berubah setiap detik

Ciri yang sama dari semua hal ini adalah: semuanya dapat berubah.

Jika televisi selamanya hanya menampilkan satu gambar, cuaca selalu cerah, dan jarum jam tidak pernah bergerak, maka hal-hal itu menjadi konstanta.

Yang satu mungkin berubah, sementara yang lain tidak.

## Memahami variabel dan konstanta

Dalam pengembangan aplikasi, biasanya pengguna perlu mengisi atau menyimpan beberapa informasi.

Misalnya:

- nama akun
- tanggal lahir
- informasi kontak
- alamat

Informasi-informasi ini akan disimpan dan ditampilkan.

Sebagai contoh, pengguna memasukkan sebuah nama di dalam aplikasi:

```
FangJunyu
```

Kita perlu menyimpan nama ini agar bisa ditampilkan di dalam aplikasi.

Proses penyimpanan ini bisa dipahami secara sederhana sebagai: menaruh sesuatu ke dalam sebuah laci.

Ketika kita menyimpan sebuah nama, itu seperti menaruh nama tersebut ke dalam sebuah laci.

Barang yang perlu disimpan mungkin ada banyak, dan jumlah lacinya juga akan banyak. Agar kita tahu isi setiap laci, kita perlu memberi nama pada laci tersebut.

Misalnya:

```
name
```

Dalam contoh ini, `name` adalah nama lacinya, dan `FangJunyu` adalah informasi yang disimpan.

![Var](../../RESOURCE/007_var.png)

**Di Swift, jika ingin menyimpan data, kita harus mendeklarasikannya menggunakan variabel (`var`) atau konstanta (`let`).**

Karena nama biasanya bisa diubah, maka di sini kita sebaiknya memakai variabel.

```swift
var name = "FangJunyu"
```

Di sini kita mendeklarasikan sebuah variabel bernama `name`, dengan tipe `String` dan nilai `"FangJunyu"`.

### Perbedaan variabel dan konstanta

Variabel dideklarasikan dengan `var`:

```swift
var
```

Konstanta dideklarasikan dengan `let`:

```swift
let
```

Misalnya:

```swift
var name = "FangJunyu"
let id = 123456
```

Jika dideklarasikan sebagai variabel, berarti nilainya bisa diubah. Jika dideklarasikan sebagai konstanta, maka nilainya tidak bisa diubah lagi.

Jadi, perbedaan utama antara variabel dan konstanta adalah: apakah nilainya boleh berubah atau tidak.

### Mengubah konstanta

Jika kode mencoba mengubah nilai sebuah konstanta:

```swift
let name = "Sam"
name = "Bob"
```

Swift akan memberi tahu bahwa assignment tidak bisa dilakukan, karena itu adalah konstanta.

```
Cannot assign to property: 'name' is a 'let' constant
```

Mekanisme ini membantu developer mencegah beberapa data penting diubah secara tidak sengaja.

### Menampilkan di SwiftUI

Buka file `ContentView.swift`, lalu deklarasikan sebuah variabel di dalam `View`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Di sini kita mendeklarasikan variabel bernama `name`, lalu menampilkannya di antarmuka melalui `Text`.

Jika kita mengubah isi variabel:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Isi teks yang ditampilkan oleh `Text` juga akan berubah.

Dengan cara ini, kita bisa memakai variabel untuk mengontrol isi yang ditampilkan di antarmuka, tanpa harus langsung mengubah teks di dalam `Text` setiap saat.

Jika tempat lain membutuhkan informasi ini, kita juga bisa meneruskan variabel tersebut ke sana. Ini seperti menyerahkan isi “laci” ke tempat lain untuk digunakan.

### Posisi variabel dan konstanta di SwiftUI

Di SwiftUI, variabel dan konstanta biasanya ditulis di luar `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tentu saja, variabel dan konstanta juga bisa ditulis di dalam `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Namun, ada perbedaan penting antara keduanya:

- Jika variabel dan konstanta ditulis di dalam `body`, maka setiap kali view dihitung ulang, variabel itu akan dibuat ulang.
- Jika ditulis di luar `body`, variabel akan menjadi properti dari struktur view, sehingga struktur kodenya lebih jelas.

Karena itu, dalam pengembangan nyata, biasanya variabel dan konstanta ditulis di luar `body`.

## Tipe data

Variabel dapat menyimpan banyak jenis data yang berbeda. Jenis-jenis ini disebut tipe data.

Misalnya, sebelumnya kita menggunakan `Text` untuk menampilkan teks:

```swift
Text("Hello, World")
```

Di sini `"Hello, World"` termasuk tipe string (`String`).

String digunakan untuk menyatakan isi teks. Di Swift, string harus dibungkus dengan tanda kutip ganda `""`.

Misalnya:

```swift
var hello = "Hello, World"
```

Selain string, Swift juga memiliki banyak tipe data lainnya.

Pada tahap awal belajar, empat tipe yang paling umum adalah:

- `String`
- `Int`
- `Double`
- `Bool`

Keempat tipe ini dapat menangani sebagian besar pemrosesan data dasar.

**String**

`String` berarti isi teks, misalnya:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

String biasanya digunakan untuk menyatakan: nama pengguna, judul, dan isi teks.

**Int**

`Int` berarti bilangan bulat, yaitu angka tanpa bagian desimal.

Misalnya:

```swift
var age = 26
var count = 100
```

Bilangan bulat biasanya digunakan untuk menyatakan: umur, jumlah, dan hitungan.

**Double**

`Double` berarti angka desimal.

Misalnya:

```swift
var weight = 74.5
var height = 185.0
```

Di Swift, angka desimal biasanya secara default menggunakan tipe `Double`.

Ada juga tipe serupa bernama `Float`, tetapi rentang nilainya lebih kecil, sehingga dalam pengembangan nyata `Double` lebih sering digunakan.

**Bool**

Tipe `Bool` digunakan untuk menyatakan dua kondisi: `true` dan `false`.

Misalnya:

```swift
var isShowAlert = true
var isLogin = false
```

Tipe `Bool` sering digunakan untuk penilaian kondisi. Misalnya, apakah sebuah dialog peringatan perlu ditampilkan.

Untuk situasi yang hanya memiliki dua hasil, `Bool` sangat cocok digunakan.

### Menampilkan di SwiftUI

Ketika kita menampilkan tipe `String`, kita bisa langsung menggunakan `Text`:

```swift
Text(name)
```

Namun `Int`, `Double`, dan tipe lainnya bukan string, sehingga tidak bisa langsung menjadi bagian dari isi teks.

Jika ingin menampilkan data-data ini di dalam `Text`, kita bisa menggunakan interpolasi string (`String Interpolation`):

```swift
\()
```

Interpolasi string harus ditulis di dalam isi string, dan menggunakan `\\()` untuk membungkus variabel atau konstanta.

Misalnya:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Di dalam kode di atas, `""` menunjukkan string, sedangkan `\\()` digunakan untuk menyisipkan variabel atau konstanta ke dalam string.

Misalnya:

```swift
"DoubleNum: \(num * 2)"
```

Isi yang ditampilkan adalah:

```swift
DoubleNum: 2
```

Dengan cara ini, kita bisa menyisipkan variabel atau konstanta ke dalam string, lalu menampilkannya di antarmuka melalui `Text`.

Catatan: `\\()` hanya bisa digunakan di dalam string `""`.

## Operator

Ketika mendeklarasikan variabel atau konstanta, kita bisa melihat penulisan seperti ini:

```swift
var num = 1
```

Di sini `=` disebut operator assignment.

Fungsinya adalah: memberikan nilai di sisi kanan ke variabel di sisi kiri.

Dalam contoh ini, angka `1` diberikan kepada variabel `num`.

Selain operator assignment, ada juga beberapa operator angka yang umum:

- \+
- \-
- \*
- \/

Ketika kita melakukan perhitungan angka, misalnya pada data tipe `Int` atau `Double`, kita akan menggunakan operator-operator ini.

Misalnya:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Setelah perhitungan selesai, hasilnya akan disimpan ke dalam variabel.

## Ringkasan

Variabel, konstanta, dan operator adalah konsep paling dasar dalam pemrograman.

Melalui variabel dan konstanta, kita dapat menyimpan berbagai macam data di dalam program. Melalui tipe data, kita bisa memperjelas jenis data tersebut. Melalui operator, kita bisa menghitung dan memproses data.

Pengetahuan ini ibarat alat dasar di dunia pemrograman. Menguasai semua ini akan memberi fondasi yang kokoh untuk mempelajari Swift dan SwiftUI selanjutnya.
