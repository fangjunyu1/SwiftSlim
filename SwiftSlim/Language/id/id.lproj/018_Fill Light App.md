# Aplikasi Fill Light

Dalam pelajaran ini, kita akan membuat aplikasi fill light yang sangat menarik. Saat malam tiba, kita bisa membuat layar ponsel menampilkan berbagai warna dan menggunakannya sebagai fill light sederhana.

Aplikasi fill light ini dapat mengganti warna dengan mengetuk layar, dan juga dapat menyesuaikan kecerahan menggunakan slider.

Dalam contoh ini, kita akan mempelajari cara menggunakan `brightness` untuk menyesuaikan kecerahan tampilan, `onTapGesture` untuk menambahkan gesture ketuk ke tampilan, serta kontrol `Slider`.

Hasil:

![Color](../../Resource/018_color.png)

## Menampilkan Warna

Pertama, mari kita buat tampilan menampilkan satu warna.

Di SwiftUI, `Color` tidak hanya mewakili warna, tetapi juga bisa ditampilkan sebagai sebuah tampilan:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Di sini, `Color.red` mewakili tampilan berwarna merah. `.ignoresSafeArea()` membuat tampilan warna memenuhi seluruh layar, sehingga terlihat lebih seperti efek fill light yang nyata.

Hasil:

![Color](../../Resource/018_color1.png)

### Array Warna dan Indeks

Saat ini hanya satu warna yang ditampilkan. Tetapi fill light biasanya tidak hanya memiliki satu warna. Fill light juga bisa menampilkan biru, kuning, ungu, putih, dan warna lainnya.

Kita ingin berpindah di antara warna-warna yang berbeda saat layar diketuk. Kita bisa menaruh warna-warna ini ke dalam sebuah array agar mudah dikelola bersama:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Array cocok untuk menyimpan "sekumpulan data dengan tipe yang sama". Di sini, setiap elemen di dalam array adalah `Color`.

Jika kita ingin menampilkan warna tertentu, kita bisa menggunakan indeks:

```swift
colors[0]
```

Ini berarti mengambil warna pada indeks `0` di dalam array, yaitu warna pertama.

Sekarang kodenya bisa ditulis seperti ini:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Dengan cara ini, layar akan menampilkan warna pertama di dalam array, yaitu merah.

### Menggunakan Indeks untuk Mengontrol Warna

Jika kita perlu berpindah di antara warna-warna yang berbeda, kita memerlukan sebuah variabel untuk mengelola indeks, bukan menuliskan indeks secara tetap.

Kita bisa menggunakan `@State` untuk mendeklarasikan sebuah variabel yang menyimpan indeks:

```swift
@State private var index = 0
```

Di sini, `index` menunjukkan indeks warna saat ini.

Ketika `index` berubah, SwiftUI akan menghitung ulang antarmuka dan memperbarui konten yang ditampilkan.

Lalu ubah `colors[0]` yang sebelumnya menjadi:

```swift
colors[index]
```

Dengan begitu, warna yang ditampilkan di dalam tampilan akan ditentukan oleh `index`.

Sekarang kodenya menjadi:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Ketika `index` berubah, `colors[index]` juga akan menampilkan warna yang berbeda.

Contohnya:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Perlu diperhatikan bahwa `index` tidak boleh melebihi indeks maksimum array, jika tidak akan terjadi error indeks di luar batas.

## Gesture Ketuk

Sekarang kita bisa menampilkan warna yang berbeda berdasarkan `index`, tetapi kita masih belum bisa mengetuk untuk mengganti warna.

Pada pelajaran "Quote Carousel" sebelumnya, kita menggunakan `Button` untuk mengontrol pergantian quote.

Namun kali ini, kita ingin "mengetuk seluruh area warna" untuk mengganti warna, jadi `onTapGesture` lebih cocok digunakan.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Ketika kita mengetuk tampilan warna, kode ini akan dijalankan:

```swift
index += 1
```

Artinya nilai `index` ditambah `1`. Setelah indeks bertambah, `colors[index]` akan menampilkan warna berikutnya di dalam array.

### `onTapGesture`

`onTapGesture` adalah modifier gesture yang menambahkan aksi ketuk ke sebuah tampilan.

Penggunaan dasar:

```swift
.onTapGesture {
    // code
}
```

Contohnya:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Ketika tampilan merah ini diketuk, kode di dalam kurung kurawal akan dijalankan, lalu di konsol akan muncul:

```swift
Click color
```

Melalui `onTapGesture`, kita bisa menentukan apa yang terjadi setelah sebuah tampilan diketuk.

### Perbedaan dengan `Button`

Sebelumnya kita sudah mempelajari tampilan `Button`. `Button` dan `onTapGesture` sama-sama dapat menangani aksi ketuk, tetapi skenario penggunaannya tidak sepenuhnya sama.

`onTapGesture` lebih cocok untuk "menambahkan fungsi ketuk ke tampilan yang sudah ada", seperti `Color`, `Image`, `Text`, atau tampilan biasa lainnya.

Sedangkan `Button` lebih cocok ketika kita ingin mewakili tombol yang jelas, seperti "Konfirmasi", "Kirim", atau "Hapus".

Dalam aplikasi fill light ini, kita ingin fungsi pergantian warna menjadi lebih sederhana. Mengetuk seluruh area warna langsung mengganti warna, sehingga `onTapGesture` adalah pilihan yang tepat di sini.

## Masalah Indeks

Sekarang kita bisa mengetuk layar untuk berpindah di antara warna yang berbeda.

Tetapi ada satu masalah penting di sini: **indeks bisa melebihi batas array**.

Contohnya:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Jika kita terus mengetuk layar, `index` pada akhirnya akan menjadi `4`, dan saat itu error "index out of range" akan terjadi.

Hal ini terjadi karena array `colors` memiliki `4` elemen, tetapi pengindeksan dimulai dari `0`, sehingga rentang indeks yang valid adalah `0 - 3`, bukan `4`.

Jika kita mengakses `colors[4]`, maka akan terjadi error "index out of range".

Di kode saat ini, setiap ketukan akan otomatis menambah `index` sebesar `1`. Jika kita tidak menanganinya, pada akhirnya indeks pasti akan keluar dari batas.

Karena itu, saat layar diketuk, kita perlu memeriksa indeks: jika sudah berada di warna terakhir, kembali ke warna pertama; jika belum, lanjutkan dengan menambah `1`.

Kita bisa melakukannya dengan pernyataan `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Di dalam kode ini, `colors.count` berarti jumlah elemen di dalam array.

Pada array saat ini ada 4 warna, jadi:

```swift
colors.count // 4
```

Tetapi indeks terbesar bukan `4`, melainkan `3`, karena pengindeksan dimulai dari `0`.

Jadi indeks terakhir harus ditulis seperti ini:

```swift
colors.count - 1
```

Yaitu:

```swift
4 - 1 = 3
```

Logika ini berarti: jika indeks saat ini sudah sesuai dengan warna terakhir, maka setel ulang indeks menjadi `0`; jika tidak, tambahkan `1`.

Dengan cara ini, warna dapat terus berganti secara berulang.

### Mengoptimalkan Logika Indeks

Jika kita ingin membuat kodenya lebih singkat, kita juga bisa menggunakan operator ternary:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Kode ini berarti: jika `index == colors.count - 1` bernilai benar, hasilnya `0`. Jika tidak, hasilnya `index + 1`.

Lalu, hasil itu kita tetapkan kembali ke `index`.

Sekarang kita bisa mendapatkan efek pergantian warna.

Kode lengkap:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Sekarang kita bisa mengetuk layar dan berpindah di antara warna yang berbeda. Sebuah aplikasi fill light dasar telah selesai.

## Menampilkan Nama Warna

Kita bisa menambahkan satu kelompok teks lain yang sesuai dengan warna-warna tersebut, sehingga ketika warna berubah, nama warna saat ini juga ikut ditampilkan di layar.

Contohnya:

- Merah menampilkan `Red`
- Biru menampilkan `Blue`
- Kuning menampilkan `Yellow`
- Ungu menampilkan `Purple`

Di sini kita juga bisa menggunakan array untuk menyimpan nama-nama warna:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Urutan teks di dalam array ini harus sama persis dengan urutan warna di dalam array warna.

Kemudian kita bisa menggunakan `Text` untuk menampilkan nama warna sesuai indeks saat ini:

```swift
Text(colorsName[index])
```

`Text` akan menampilkan nama warna saat ini sesuai dengan `index`.

Gunakan modifier untuk memperbaiki tampilan `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Dengan ini, `Text` akan tampil berwarna putih, berukuran judul, dan dengan font tebal.

Sekarang kita memiliki tampilan `Color` layar penuh. Jika kita ingin `Text` muncul di atas tampilan `Color`, kita perlu menggunakan wadah tata letak `ZStack` untuk menumpuk keduanya.

```swift
ZStack {
    Color
    Text
}
```

Jadi kodenya menjadi:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Dengan demikian, latar belakangnya adalah tampilan warna, dan di atasnya ditumpuk tampilan teks.

Hasil:

![Color](../../Resource/018_color2.png)

Perlu diperhatikan bahwa di dalam `ZStack`, tampilan yang ditulis belakangan biasanya akan tampil di depan. Jika `Text` ditulis sebelum `Color`, tampilan `Color` yang ditulis setelahnya bisa menutupi `Text`.

## Mengontrol Kecerahan

Sekarang kita bisa mengganti warna yang berbeda, tetapi fill light memiliki satu fungsi penting lain: **menyesuaikan kecerahan**.

Di SwiftUI, kita bisa menggunakan modifier `brightness` untuk menyesuaikan kecerahan tampilan.

Contohnya:

```swift
.brightness(1)
```

Kita bisa menulis:

```swift
colors[index]
    .brightness(0.5)
```

Ini membuat warna saat ini menjadi lebih terang dan lebih mendekati efek fill light.

Rentang kecerahan adalah `0 - 1`. `0` berarti mempertahankan warna aslinya, dan semakin dekat nilainya ke `1`, semakin terang warnanya. `1` berarti hasil putih paling terang.

Walaupun kita bisa mengontrol `brightness` di dalam kode, pengguna masih belum bisa menyesuaikannya sendiri secara langsung.

Karena itu, kita perlu menambahkan kontrol yang bisa digeser: `Slider`.

## Tampilan `Slider`

Di SwiftUI, `Slider` adalah kontrol yang digunakan untuk memilih nilai dalam sebuah rentang. Apple menjelaskannya sebagai "kontrol untuk memilih nilai dari rentang linear terbatas".

Penggunaan dasar:

```swift
Slider(value: $value, in: 0...1)
```

Penjelasan parameter:

1. `value: $value`: `Slider` perlu diikat ke sebuah variabel.

    Saat slider digeser, nilai variabel juga berubah pada saat yang sama. Sebaliknya, jika variabel berubah, slider juga ikut diperbarui.

    Ini sangat mirip dengan `TextField` yang kita pelajari sebelumnya. Keduanya "mengikat kontrol ke variabel".

    Variabel yang terikat perlu diberi simbol `$` di depannya untuk menunjukkan binding.

2. `in: 0...1`: parameter ini mewakili rentang nilai slider.

    Di sini, `0...1` berarti nilai minimum adalah `0` dan nilai maksimum adalah `1`.

    Saat slider digeser sepenuhnya ke kiri, variabel yang terikat akan mendekati `0`; saat digeser sepenuhnya ke kanan, nilainya mendekati `1`.

Contohnya:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` terikat ke variabel `value`. Saat slider digeser, nilai dari variabel `value` juga berubah pada saat yang sama.

Tampilan:

![Slider](../../Resource/018_slider.png)

Ketika `Slider` dipindahkan ke sisi kiri, nilai terikat `value` menjadi `0`. Ketika dipindahkan ke sisi kanan, nilainya menjadi `1`.

### Rentang Nilai

Rentang nilai `Slider` tidak tetap. Bisa juga ditulis seperti ini:

```swift
0...100
```

atau rentang lainnya.

Tetapi dalam aplikasi fill light ini, kita perlu mengontrol kecerahan, jadi `0...1` adalah pilihan yang paling sesuai.

## Menggunakan `Slider` untuk Mengontrol Kecerahan

Sekarang kita perlu menghubungkan `Slider` dengan `brightness`.

Pertama, buat variabel untuk menyimpan nilai kecerahan:

```swift
@State private var slider = 0.0
```

Di sini, `0.0` adalah nilai bertipe `Double`.

Karena `Slider` biasanya terikat ke tipe numerik, dan di sini kita ingin nilainya berubah secara kontinu, maka `Double` lebih cocok. Selain itu, `brightness` hanya menerima nilai bertipe `Double`.

Lalu berikan nilai ini ke `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Ketika `slider == 0`, warna tetap dalam keadaan default. Semakin dekat `slider` ke `1`, warna akan terlihat semakin terang.

### Menambahkan Kontrol `Slider`

Selanjutnya, tambahkan kontrol `Slider` untuk mengubah variabel ini:

```swift
Slider(value: $slider, in: 0...1)
```

Saat slider berubah, nilai `slider` juga berubah, dan `brightness(slider)` akan memperbarui kecerahan pada saat yang sama.

Ini adalah contoh yang sangat umum dari konsep "variabel menggerakkan tampilan" di SwiftUI.

### Menyesuaikan Tampilan `Slider`

Secara default, `Slider` menggunakan lebar yang tersedia.

Kita bisa memberinya lebar tetap:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Lalu tambahkan beberapa modifier lagi agar lebih mudah terlihat:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Ini memberi slider latar belakang putih dan sudut membulat, sehingga lebih menonjol di atas tampilan `Color`.

Terakhir, letakkan di bagian bawah layar.

Karena kita sudah menggunakan `ZStack`, kita bisa menempatkan `VStack` di dalamnya dan menggunakan `Spacer()` untuk mendorong `Slider` ke bawah.

## Kode Lengkap

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Hasil:

![Color](../../Resource/018_color.png)

## Ringkasan

Dengan menggunakan pengetahuan yang telah kita pelajari sebelumnya, bersama dengan konsep dasar seperti warna dan array, kita telah membangun aplikasi fill light yang sangat menarik.

Melalui aplikasi fill light ini, kita mempelajari cara menggunakan `brightness` untuk menyesuaikan kecerahan, `onTapGesture` untuk menambahkan aksi ketuk ke tampilan, serta kontrol `Slider`.

Kita menambahkan `onTapGesture` ke tampilan `Color` untuk mengganti warna. Kita juga menggunakan kontrol `Slider` untuk mengubah variabel yang mengelola `brightness`, yang merupakan contoh lain dari "variabel menggerakkan tampilan".

Kita juga meninjau kembali operator ternary, menggunakan `ZStack` untuk menumpuk tampilan, dan menggunakan array untuk mengelola kelompok data dengan tipe yang sama. Ini membantu memperdalam pemahaman kita tentang array dan indeks, termasuk masalah praktis dalam menghindari error indeks di luar batas.

Walaupun contoh ini tidak rumit, contoh ini menghubungkan banyak konsep dasar yang telah kita pelajari sebelumnya. Ketika semuanya digabungkan dalam sebuah proyek kecil yang nyata, akan lebih mudah memahami fungsi masing-masing konsep.

### Skenario Penggunaan Nyata

Bayangkan meletakkan iPhone lama di atas meja, lalu menggunakan aplikasi fill light yang Anda kembangkan sendiri untuk mengontrol warna cahaya. Itu akan menjadi pengalaman yang sangat baik.

Ada banyak aplikasi "fill light" di App Store, dan aplikasi-aplikasi tersebut juga tidak terlihat terlalu rumit.

![AppStore](../../Resource/018_appStore.PNG)

Kita bisa mulai dari mengembangkan aplikasi sederhana dan mencoba menerbitkannya ke App Store. Ini tidak hanya meningkatkan minat kita terhadap pengembangan, tetapi juga merekam pertumbuhan kita.

### Latihan Setelah Kelas

Anda bisa terus memikirkan cara untuk mengembangkan aplikasi fill light ini lebih jauh, misalnya:

- Menambahkan lebih banyak warna
- Menampilkan nilai kecerahan saat ini
- Mempercantik desain area slider di bagian bawah

Ketika Anda benar-benar mulai menggunakan pengetahuan ini, Anda akan menemukan bahwa setiap konsep yang kita pelajari sebenarnya adalah alat untuk membangun aplikasi.

Semakin banyak alat yang kita kuasai, semakin banyak fitur yang bisa kita buat.
