# Carousel kutipan

Di pelajaran ini, kita akan mewujudkan fitur “carousel kutipan”, sekaligus mempelajari lebih dalam pengetahuan dasar Swift seperti array (`Array`) dan pernyataan percabangan kondisi (`if-else`).

Kita akan menunjukkan cara menyimpan banyak kutipan, lalu menggunakan interaksi tombol untuk mewujudkan carousel kutipan yang berputar.

![alt text](../../RESOURCE/011_word.png)

## Menampilkan kutipan

Pertama, kita perlu menampilkan satu kutipan di SwiftUI.

Cara paling sederhana adalah menggunakan view `Text`:

```swift
Text("Slow progress is still progress.")
```

Kode ini hanya bisa menampilkan satu kutipan tetap. Jika ingin menampilkan banyak kutipan dan mewujudkan fungsi pergantian, kita perlu menyimpan kutipan-kutipan tersebut.

Namun, variabel string biasa hanya bisa menyimpan satu kutipan:

```swift
let sayings = "Slow progress is still progress."
```

Jika ingin menyimpan banyak kutipan, kita harus mendeklarasikan satu variabel untuk setiap kutipan:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Namun dalam pengembangan nyata, cara ini tidak hanya merepotkan, tetapi juga tidak fleksibel. Karena setiap variabel berdiri sendiri, kita tidak bisa mewujudkan pergantian carousel dengan mudah.

Agar lebih mudah mengelola banyak kutipan, kita perlu memakai sebuah struktur data untuk menyimpannya bersama-sama. Inilah yang disebut array (`Array`).

Setelah menggunakan array, kode di atas bisa disimpan seperti ini:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tips: dalam konvensi pemrograman, nama variabel array yang menyimpan banyak elemen biasanya menggunakan bentuk jamak, seperti `sayings`, untuk mencerminkan sifatnya sebagai kumpulan.**

## Array

Di Swift, array adalah kumpulan elemen berurutan, dan ditulis menggunakan tanda kurung siku `[]`.

```swift
[]
```

Di dalam array bisa terdapat banyak elemen dengan tipe yang sama, dan elemen-elemen tersebut dipisahkan dengan koma `,`.

Misalnya:

```swift
[101, 102, 103, 104, 105]
```

Kita bisa memahami array secara sederhana seperti sebuah rangkaian kereta:

![Array](../../RESOURCE/011_array1.png)

Seluruh rangkaian kereta mewakili objek array ini, sedangkan setiap gerbong tersusun berurutan satu demi satu.

### Index dan akses elemen

Karena array bersifat berurutan, sistem dapat menentukan elemen tertentu berdasarkan urutan ini. Mekanisme penentuan posisi ini disebut index (`Index`).

Di Swift, dan juga di sebagian besar bahasa pemrograman lainnya, index array dihitung mulai dari 0, bukan 1. Artinya elemen pertama di dalam array memiliki index 0, elemen kedua memiliki index 1, dan seterusnya.

![Array](../../RESOURCE/011_array2.png)

Jika ingin mengakses elemen tertentu di dalam array, cukup tambahkan tanda kurung siku setelah nama array, lalu isi dengan nilai index elemen yang dituju.

Misalnya:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Jika mencoba mengakses index yang berada di luar jangkauan valid array, maka akan terjadi masalah “index out of range”. Karena itu, saat mengakses array kita harus berhati-hati dan memastikan index berada dalam rentang yang valid.

**Index out of range**

Misalnya, jika array hanya memiliki 5 elemen, maka rentang index yang sah adalah 0 sampai 4. Jika kita mencoba mengakses `sayings[5]`, program tidak akan menemukan “gerbong” yang sesuai, sehingga memicu error “index out of range” dan menyebabkan aplikasi crash.

![Array](../../RESOURCE/011_array3.png)

### Mengoperasikan array

Array tidak hanya mendukung definisi statis, tetapi juga mendukung operasi seperti menambah, menghapus, dan mengubah elemen, serta dapat menghitung panjang array.

Tips: jika ingin memodifikasi array, kita harus mendeklarasikannya dengan `var`, bukan `let`.

**1. Menambahkan elemen**

Kita bisa menggunakan metode `append` untuk menambahkan elemen di akhir array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Menghapus elemen**

Melalui metode `remove(at:)`, kita bisa menghapus elemen tertentu di dalam array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Mengubah elemen**

Gunakan index secara langsung untuk mengubah elemen di dalam array:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Menghitung panjang array**

Gunakan properti `count` untuk mendapatkan jumlah elemen di dalam array:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Menampilkan kutipan dengan array

Untuk menampilkan banyak kutipan, kita bisa menyimpan kutipan-kutipan tersebut ke dalam array, lalu mengakses dan menampilkannya berdasarkan index.

Pertama, buat array `sayings` di dalam `ContentView` untuk menyimpan kutipan, lalu baca dan tampilkan kutipan yang sesuai melalui index di view `Text`:

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

Di sini, `sayings[0]` berarti kutipan pertama di dalam array.

Jika ingin menampilkan kutipan yang berbeda, cukup ubah nilai index di dalam tanda kurung siku:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Mendefinisikan index kutipan

Untuk mewujudkan efek pergantian kutipan secara dinamis, kita tidak bisa “menulis mati” index di dalam view `Text`.

Kita perlu membuat satu variabel tersendiri untuk menyimpan nilai index yang sedang ditampilkan.

Di SwiftUI, kita bisa memakai `@State` untuk mendeklarasikan index yang dapat berubah:

```swift
@State private var index = 0
```

SwiftUI akan memantau variabel yang dibungkus dengan `@State`. Ketika `index` berubah, SwiftUI akan merender ulang view dan menampilkan kutipan yang sesuai.

Selanjutnya, kita menggunakan `sayings[index]` untuk mengambil kutipan di dalam array secara dinamis:

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

Ketika nilai `index` berubah, `Text` akan menampilkan kutipan yang berbeda.

### Mengontrol index dengan tombol

Untuk mengontrol pergantian kutipan, kita bisa menggunakan `Button` untuk mengubah nilai `index`. Setiap kali tombol ditekan, `index` akan otomatis bertambah 1:

```swift
Button("Next") {
    index += 1
}
```

Ketika kita menekan tombol, nilai `index` berubah dari 0 menjadi 1, memicu refresh view, lalu `Text(sayings[index])` akan membaca kutipan berikutnya.

Namun, di sini ada sebuah masalah potensial: jika tombol ditekan terus-menerus, `index` akan terus bertambah sampai melebihi jangkauan array. Ini akan menyebabkan error index array di luar batas. Misalnya, ketika `index` mencapai 5, padahal rentang index array hanya 0 sampai 4, program akan crash.

Untuk mencegah index array keluar dari batas, kita perlu menambahkan kontrol kondisi, agar `index` tidak melampaui jangkauan array. Kita bisa menggunakan pernyataan `if-else` untuk memeriksa apakah `index` lebih kecil daripada panjang array.

## Kontrol kondisi: pernyataan if-else

Pernyataan `if-else` adalah pernyataan percabangan kondisi yang paling umum digunakan di Swift. Fungsinya adalah memeriksa apakah suatu kondisi terpenuhi, lalu mengeksekusi blok kode yang berbeda berdasarkan benar atau salahnya kondisi tersebut.

Struktur dasarnya:

```swift
if condition {
    // Kode yang dijalankan saat condition bernilai true
} else {
    // Kode yang dijalankan saat condition bernilai false
}
```

Dalam pernyataan `if`, `condition` adalah sebuah nilai boolean (`Bool`), yang bisa berupa `true` atau `false`. Jika kondisinya `true`, maka bagian `if` akan dijalankan; jika tidak, maka bagian `else` akan dijalankan.

Misalnya:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Dalam contoh ini, nilai `age` adalah 25. Pernyataan `if` memeriksa apakah `age > 18` terpenuhi. Karena kondisinya benar, maka akan mencetak `"Big Boy"`.

Jika tidak membutuhkan bagian `else`, bagian tersebut bisa dihilangkan:

```swift
if condition {
    // Kode yang dijalankan saat condition bernilai true
}
```

### Menggunakan kondisi untuk mengontrol jangkauan index

Untuk mencegah index array keluar dari batas, kita bisa menggunakan pernyataan `if` agar `index` tetap berada di dalam jangkauan array:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analisis logikanya: nilai `sayings.count` adalah 5, karena ada 5 kutipan. Maka `sayings.count - 1` bernilai 4, yang juga merupakan index valid terakhir dari array.

Ketika `index` lebih kecil dari 4, menekan tombol untuk menambah 1 adalah aman. Begitu `index` mencapai 4, kondisi tidak lagi terpenuhi, dan tombol tidak akan menghasilkan perubahan apa pun.

Sekarang, kode tersebut sudah berhasil mewujudkan fungsi pergantian kutipan:

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

### Kutipan berulang

Jika kita ingin setelah sampai pada kutipan terakhir, penekanan tombol berikutnya kembali menampilkan kutipan pertama, sehingga carousel berputar terus, maka kita bisa mewujudkannya lewat bagian `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Saat tombol ditekan, jika `index` sudah mencapai elemen terakhir array, maka `index` akan diatur kembali menjadi 0, dan tampilan kutipan akan berulang dari awal.

## Mengoptimalkan view kutipan

Sekarang logika carousel kutipan sudah berhasil diwujudkan, tetapi kita masih bisa mengoptimalkan tampilannya agar lebih indah.

Kode lengkap:

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

Dalam contoh ini, view `Text` diberi background putih semi-transparan dan sudut membulat, tombol `Button` menggunakan gaya `.borderedProminent`, dan `VStack` diberi gambar latar belakang.

Tambahan pengetahuan: saat memakai modifier `background()` untuk menangani latar belakang gambar, perilaku default-nya adalah berusaha memenuhi area layout tempat view saat ini berada. Dalam banyak kasus, ia dapat memanjang secara alami hingga menutupi area aman (`Safe Area`).

Sekarang, kita sudah berhasil mewujudkan view carousel kutipan.

![SwiftUI View](../../RESOURCE/011_word.png)

## Ringkasan

Melalui pelajaran ini, kita telah menguasai cara menggunakan array untuk menyimpan banyak kutipan, serta menggunakan pernyataan `if` dan `if-else` untuk mewujudkan carousel kutipan.

Kita juga memahami operasi dasar array, seperti menambah, menghapus, dan mengubah elemen, serta cara mencegah index array keluar dari batas.

Pelajaran ini tidak hanya menjelaskan implementasi fungsi carousel kutipan, tetapi juga memadukannya dengan penggunaan dasar array dan pernyataan kondisi, sehingga membantu kita menguasai kemampuan memproses data dan mengontrol alur program.

## Pengetahuan tambahan - Percabangan kondisi majemuk: if-else if-else

Dalam pengembangan nyata, sering kali kita perlu menangani lebih dari satu kondisi. Misalnya, dalam sebuah game, saat skor sama dengan 1 memicu event A, sama dengan 2 memicu event B, sama dengan 3 memicu event C, dan seterusnya.

Untuk skenario dengan lebih dari dua cabang kondisi, kita perlu menggunakan pernyataan `if-else if-else` untuk melakukan penilaian majemuk.

Sintaks dasar:

```swift
if conditionA {
    // Kode yang dijalankan saat conditionA bernilai true
} else if conditionB {
    // Kode yang dijalankan saat conditionB bernilai true
} else if conditionC {
    // Kode yang dijalankan saat conditionC bernilai true
} else {
    // Kode yang dijalankan saat semua kondisi tidak terpenuhi
}
```

Dalam situasi ini, program akan memeriksa kondisi secara berurutan, lalu menjalankan kondisi pertama yang terpenuhi. Jika tidak ada kondisi yang terpenuhi, maka bagian `else` akan dijalankan.

Di carousel kutipan, kita juga bisa memakai `if-else if-else` untuk melakukan penilaian majemuk:

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

Ketika `index` bernilai 0, 1, 2, atau 3, setiap penekanan tombol akan menjalankan `index += 1`. Saat `index` bernilai 4, yaitu elemen terakhir, `index` akan diatur kembali menjadi 0 agar carousel berulang.

Cabang `else` digunakan sebagai pengaman, untuk mencegah nilai ilegal, misalnya ketika `index` berubah secara tidak semestinya.

Perlu diperhatikan bahwa `==` di sini berarti memeriksa “apakah sama”. Jika pernyataan `if` menilai `index` sama dengan suatu angka tertentu, hasilnya `true` dan blok kode berikutnya akan dijalankan. Jika tidak sama, maka akan lanjut memeriksa `if` berikutnya.

Penilaian majemuk seperti ini berguna ketika kita perlu menjalankan kode yang berbeda di bawah kondisi-kondisi yang berbeda.
