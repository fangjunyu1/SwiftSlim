# Properti Terhitung

Dalam pelajaran ini, kita terutama akan mempelajari properti terhitung.

Properti terhitung digunakan untuk menghitung hasil baru berdasarkan data yang sudah ada. Properti ini dapat menghitung nilai numerik, dan juga dapat menghitung konten yang perlu ditampilkan dalam view SwiftUI.

Contohnya:

```swift
let a = 10
let b = 20
let c = a + b
```

Di sini, `c` menunjukkan hasil setelah `a` dan `b` dijumlahkan.

Dalam kode biasa, cara penulisan seperti ini sangat umum.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: Di dalam event tap milik `Button`, kita dapat menjalankan kode Swift biasa.

Namun, jika kode serupa ditulis langsung di dalam properti sebuah view SwiftUI, kita akan menemui masalah.

Contohnya:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Kode ini akan menghasilkan error.

Terlihat seolah-olah `a` dan `b` sudah ditulis sebelum `c`, jadi nilai `c` sepertinya bisa dihitung.

Namun dalam deklarasi properti sebuah struktur, cara penulisan ini tidak dapat digunakan secara langsung.

## Mengapa c tidak bisa langsung menghitung a + b

Karena `a`, `b`, dan `c` bukan konstanta sementara di dalam event tap tombol, melainkan properti di dalam view `ContentView`.

Di dalam event tap tombol, kode ini dapat berjalan normal:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Karena setelah tombol ditap, kode berjalan secara berurutan. Pertama `a` dibuat, lalu `b` dibuat, dan terakhir `c` dihitung dengan `a + b`.

Namun saat mendeklarasikan properti di dalam view, situasinya berbeda:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Di sini, `a`, `b`, dan `c` semuanya adalah properti di dalam view `ContentView`.

Saat view `ContentView` dibuat, Swift perlu menyiapkan properti-properti ini terlebih dahulu. Agar proses pembuatan tetap aman, Swift tidak mengizinkan nilai default sebuah properti tersimpan instance membaca langsung properti instance lain dalam instance yang sama.

Jadi baris ini akan menghasilkan error:

```swift
let c = a + b
```

Secara sederhana, kita bisa memahaminya seperti ini: **saat mendeklarasikan properti di dalam view, kita tidak bisa langsung menggunakan satu properti biasa untuk menghitung properti biasa lainnya.**

Properti yang menyimpan nilai secara langsung disebut "properti tersimpan". Untuk mempermudah pemahaman, sementara ini kita juga dapat menganggapnya sebagai properti biasa.

Contohnya:

```swift
let a = 10
```

`a` menyimpan `10`.

```swift
let b = 20
```

`b` menyimpan `20`.

Namun:

```swift
let c = a + b
```

Di sini, `c` bukan nilai yang ditulis langsung, melainkan nilai yang ingin kita hitung melalui `a + b`.

Untuk situasi seperti "mendapatkan hasil berdasarkan data yang sudah ada", properti terhitung lebih cocok digunakan.

Dapat diubah menjadi:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Di sini, `c` adalah properti terhitung.

```swift
var c: Int {
    return a + b
}
```

Artinya: **ketika `c` perlu digunakan, baca `a` dan `b` pada saat itu, lalu kembalikan hasil `a + b`.**

Contohnya:

```swift
Text("c: \(c)")
```

Saat `Text` menampilkan `c`, barulah perhitungan `c` dipicu.

## Apa itu properti terhitung?

Properti terhitung terlihat seperti variabel, tetapi tidak menyimpan data sendiri.

Contohnya:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Di sini, `c` adalah properti terhitung.

Ia tidak menyimpan nilai tetap seperti properti biasa. Sebaliknya, setiap kali `c` dibaca, kode di dalam `{}` dijalankan kembali dan hasil perhitungan dikembalikan.

Dapat dipahami seperti ini:

```swift
var c: Int {
    return a + b
}
```

Saat kita perlu menggunakan `c`, kita menghitung `a + b`.

Jadi properti terhitung cocok untuk situasi ini: **sebuah hasil tidak perlu disimpan secara terpisah, karena dapat dihitung dari data yang sudah ada.**

## Penulisan dasar

Properti terhitung biasanya berisi tiga bagian:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarasikan dengan `var`

```swift
var c
```

Properti terhitung harus dideklarasikan dengan `var`; `let` tidak dapat digunakan.

Karena properti terhitung bukan nilai tersimpan yang tetap, melainkan hasil yang dihitung secara dinamis setiap kali dibaca.

### 2. Tandai tipe yang dikembalikan

```swift
var c: Int
```

Properti terhitung perlu menandai tipe yang dikembalikan.

Di sini, `c` akhirnya akan mengembalikan bilangan bulat, jadi tipenya adalah `Int`.

### 3. Gunakan {} untuk menulis logika perhitungan

```swift
{
    return a + b
}
```

Di dalam `{}` ditulis logika perhitungan; di sini yang dikembalikan adalah `a + b`.

## Kata kunci return

Properti terhitung perlu mengembalikan sebuah hasil.

Contohnya:

```swift
var c: Int {
    return a + b
}
```

Di sini, `return` berarti: kembalikan hasil perhitungan `a + b`.

Jika properti terhitung hanya berisi satu ekspresi yang langsung menghasilkan hasil, `return` dapat dihilangkan:

```swift
var c: Int {
    a + b
}
```

Namun, jika properti terhitung berisi beberapa baris kode, kita perlu menggunakan `return` untuk mengembalikan hasil dengan jelas.

Contohnya:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Di sini proses perhitungan dibagi menjadi dua langkah.

Langkah pertama, hitung total harga terlebih dahulu:

```swift
let total = count * price
```

Langkah kedua, gabungkan total harga menjadi teks lalu kembalikan:

```swift
return "Total: \(total) $"
```

Jika `return` dihapus:

```swift
var totalPriceText: String {
    let total = count * price
    "Total: \(total) $"
}
```

Kode ini akan menghasilkan error.

Alasannya: **properti terhitung ini sudah berisi beberapa baris kode, dan Swift tidak lagi dapat menentukan secara otomatis baris mana yang merupakan hasil akhir yang harus dikembalikan.**

Jadi, ketika properti terhitung hanya memiliki satu baris hasil, `return` dapat dihilangkan.

```swift
var c: Int {
    a + b
}
```

Ketika properti terhitung berisi beberapa baris kode, disarankan menulis `return` dengan jelas.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

## Perbedaan antara properti terhitung dan properti biasa

Properti biasa menyimpan data.

```swift
var c = 30
```

Di sini, `c` menyimpan nilai konkret: `30`.

Properti terhitung tidak menyimpan data.

```swift
var c: Int {
    a + b
}
```

Di sini, `c` tidak menyimpan `30`. Ia hanya menyediakan cara perhitungan.

Saat `c` dibaca, Swift menjalankan:

```swift
a + b
```

Lalu mengembalikan hasil perhitungan.

Jadi properti terhitung cocok untuk situasi ketika hasil dihitung dari data lain.

## body juga merupakan properti terhitung

Setelah mempelajari properti terhitung, kita dapat memahami kembali salah satu potongan kode paling umum di SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Di sini, `body` juga merupakan properti terhitung.

Ia dideklarasikan dengan `var`:

```swift
var body
```

Ia memiliki tipe yang dikembalikan:

```swift
some View
```

Di dalam `{}`-nya, ia mengembalikan konten view SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Jadi `body` dapat dipahami seperti ini: saat SwiftUI perlu menampilkan view ini, SwiftUI membaca `body` dan membuat antarmuka berdasarkan konten yang dikembalikan oleh `body`.

Jika kita menulis `return`, dapat dipahami seperti ini:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Namun di SwiftUI, biasanya kita menghilangkan `return` dan menulis langsung:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ketika data `@State` berubah, SwiftUI membaca `body` lagi dan memperbarui antarmuka sesuai data baru.

Contohnya:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("jumlah: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Setelah tombol ditap, `count` berubah.

```swift
count += 1
```

Setelah `count` berubah, SwiftUI menghitung ulang `body`, sehingga teks di antarmuka juga diperbarui.

```swift
Text("jumlah: \(count)")
```

Inilah juga alasan mengapa di SwiftUI, setelah data berubah, antarmuka dapat diperbarui secara otomatis.

### Tidak disarankan menulis perhitungan kompleks di body

Karena `body` adalah properti terhitung, ia dapat dibaca dan dihitung ulang berkali-kali.

Contohnya:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("angka: \(num)")
            Text("nama: \(name)")
        }
    }
}
```

Ketika `name` berubah, SwiftUI menghitung ulang `body`.

Pada saat itu, kode di dalam `body` juga dijalankan lagi, dan `num` juga dibuat lagi.

```swift
let num = 10
```

`num` pada contoh ini sangat sederhana, jadi dampaknya tidak besar.

Namun jika di dalam `body` dijalankan perhitungan kompleks, seperti memfilter data dalam jumlah besar, mengurutkan, memproses gambar, dan sebagainya, hal itu dapat memengaruhi kelancaran antarmuka.

Jadi di SwiftUI, `body` sebaiknya terutama bertanggung jawab untuk mendeskripsikan struktur antarmuka.

Data sementara yang sederhana dapat ditulis di dalam `body`.

Perhitungan kompleks dapat diletakkan pada properti terhitung di luar `body`, pada metode, atau pada pemrosesan data terpisah.

## Contoh: jumlah dan total harga

Berikutnya, kita akan memahami properti terhitung melalui contoh sederhana.

Misalkan harga satu wortel adalah 2 $, pengguna dapat mengetuk tombol untuk mengubah jumlah pembelian, dan antarmuka perlu menampilkan total harga.

Cara menghitung total harga:

```
jumlah * harga satuan
```

Jika menggunakan variabel biasa untuk menyimpan total harga, hal itu akan sedikit merepotkan.

Karena setiap kali jumlah berubah, kita harus memperbarui total harga secara manual.

Cara yang lebih baik adalah menggunakan properti terhitung:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("harga: \(price) $")
                Text("jumlah: \(count)")
                Text("total harga: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Hasil tampilan:

![view](../../Resource/024_view.png)

Dalam contoh ini:

```swift
@State private var count = 1
```

`count` menunjukkan jumlah wortel. Saat tombol ditap, `count` berubah.

```swift
private let price = 2
```

`price` menunjukkan harga satuan wortel. Di sini nilainya tetap, jadi digunakan `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` menunjukkan total harga.

Nilai ini tidak perlu disimpan secara terpisah, karena total harga selalu dapat dihitung dengan `count * price`.

Ketika `count` adalah `1`:

```swift
totalPrice = 1 * 2
```

Hasil yang ditampilkan adalah:

```swift
total harga: 2 $
```

Setelah tombol `+` ditap, `count` menjadi `2`.

Pada saat ini, ketika `totalPrice` dibaca lagi, nilainya akan dihitung ulang:

```swift
totalPrice = 2 * 2
```

Hasil yang ditampilkan adalah:

```swift
total harga: 4 $
```

Inilah peran properti terhitung: menghitung hasil baru secara dinamis berdasarkan data yang sudah ada.

## Properti terhitung dapat digunakan untuk pemeriksaan

Properti terhitung tidak hanya dapat menghitung nilai numerik, tetapi juga dapat mengembalikan hasil pemeriksaan.

Contohnya, ketika kita ingin jumlah minimum adalah 1.

Ketika jumlah sudah 1, tombol `-` tidak boleh terus mengurangi.

Kita dapat menambahkan properti terhitung:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Kode lengkap:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("harga: \(price) $")
                Text("jumlah: \(count)")
                Text("total harga: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Hasil tampilan:

![view](../../Resource/024_view1.png)

Di sini:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Kode ini menunjukkan apakah saat ini masih bisa dikurangi.

Ketika `count` lebih besar dari `1`:

```swift
canDecrease == true
```

artinya pengurangan dapat dilakukan.

Ketika `count` sama dengan `1`:

```swift
canDecrease == false
```

artinya pengurangan tidak dapat dilanjutkan.

### Pemeriksaan kondisi di dalam tombol

Di dalam tombol digunakan:

```swift
if canDecrease {
    count -= 1
}
```

Hanya ketika `canDecrease` bernilai `true`, `count` dapat dikurangi.

### Mengontrol warna foreground view

Kita juga dapat menggunakan `canDecrease` untuk mengontrol warna foreground tombol:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Di sini digunakan operator ternary:

```swift
canDecrease ? Color.primary : Color.gray
```

Arti kode ini adalah: jika `canDecrease` bernilai `true`, gunakan `Color.primary` sebagai warna foreground; jika `canDecrease` bernilai `false`, gunakan `Color.gray`.

`Color.primary` adalah warna semantik sistem yang disediakan oleh SwiftUI. Warna ini menunjukkan warna teks utama pada antarmuka saat ini.

Dalam mode terang, `Color.primary` biasanya mendekati hitam; dalam mode gelap, `Color.primary` biasanya mendekati putih.

Jadi keuntungan menggunakan `Color.primary` adalah warnanya otomatis menyesuaikan mode terang dan mode gelap.

### Mengontrol status disabled view

`disabled` digunakan untuk mengontrol apakah view berada dalam status nonaktif:

```swift
.disabled(!canDecrease)
```

Ketika `disabled` bernilai `false`, view dapat ditap.

Ketika `disabled` bernilai `true`, view berada dalam status nonaktif dan tidak dapat ditap.

Menggunakan `canDecrease` sebagai kondisi di sini membuat kode lebih mudah dipahami.

Ketika melihat `canDecrease`, kita tahu bahwa artinya adalah "apakah saat ini masih bisa dikurangi".

### Catatan tambahan: mengapa ada dua pemeriksaan?

Di dalam tombol `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Di sini digunakan `.disabled(!canDecrease)`, dan juga digunakan `if canDecrease` di dalam tombol.

`.disabled(!canDecrease)` bertugas menonaktifkan tombol di antarmuka, sehingga pengguna tidak dapat mengetuknya.

`if canDecrease` bertugas memeriksa ulang sebelum kode dijalankan. `count -= 1` hanya dijalankan ketika pengurangan diizinkan.

Ini adalah perlindungan ganda. Dalam pengembangan nyata, jika tombol sudah dinonaktifkan, pemeriksaan internal dapat dihilangkan. Namun dalam contoh pembelajaran, mempertahankannya membuat peran `canDecrease` lebih jelas.

## Ringkasan

Dalam pelajaran ini, kita terutama mempelajari properti terhitung.

Properti terhitung tidak menyimpan nilai secara langsung. Sebaliknya, saat dibaca, properti ini menghitung hasil dari data yang sudah ada.

Contohnya:

```swift
var c: Int {
    a + b
}
```

Di sini, `c` tidak perlu disimpan secara terpisah, karena dapat dihitung melalui `a + b`.

Properti terhitung harus dideklarasikan dengan `var`, dan perlu menandai tipe yang dikembalikan.

```swift
var canDecrease: Bool {
    count > 1
}
```

Properti terhitung tidak hanya dapat mengembalikan nilai numerik, tetapi juga hasil pemeriksaan, konten teks, bahkan konten view SwiftUI.

Dalam pelajaran ini, kita juga mempelajari `return`.

`return` berarti mengembalikan sebuah hasil:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Jika properti terhitung hanya berisi satu ekspresi yang langsung menghasilkan hasil, `return` dapat dihilangkan.

```swift
var totalPrice: Int {
    count * price
}
```

Selain itu, kita juga mengenal `Color.primary` dan `disabled`.

`Color.primary` adalah warna semantik sistem SwiftUI. Warna ini otomatis menyesuaikan tampilan sesuai mode terang dan mode gelap.

```swift
.foregroundStyle(Color.primary)
```

`disabled` digunakan untuk mengontrol apakah sebuah view dinonaktifkan.

```swift
.disabled(true)
```

Artinya nonaktif, tidak dapat ditap.

```swift
.disabled(false)
```

Artinya tersedia, dapat ditap.

Jadi properti terhitung sangat umum di SwiftUI. Properti ini membantu kita menyusun hasil perhitungan, kondisi pemeriksaan, dan konten yang ditampilkan dengan lebih jelas.
