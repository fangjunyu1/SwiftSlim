# Adaptasi Tampilan

Dalam pelajaran ini, kita akan mempelajari adaptasi tampilan untuk mode terang dan mode gelap.

Di iPhone, iPad, dan Mac, pengguna dapat memilih mode terang atau mode gelap.

Saat sistem beralih ke mode gelap, warna latar belakang, teks, dan ikon di banyak App juga akan ikut berubah.

Misalnya, antarmuka pada siang hari mungkin menggunakan latar belakang terang, lalu pada malam hari berubah menjadi latar belakang gelap.

![view](../../../Resource/025_view9.png)

Kemampuan untuk menyesuaikan tampilan antarmuka secara otomatis berdasarkan tampilan sistem ini disebut adaptasi tampilan.

## Mempratinjau Adaptasi Tampilan di Xcode

Sebelum mempelajari adaptasi tampilan, kita pahami dulu cara mempratinjau mode terang dan mode gelap di Xcode.

Di bagian bawah area `Canvas`, klik tombol `Device Settings` untuk membuka pop-up `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Di pop-up tersebut, kamu dapat melihat pengaturan `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Artinya:

- `Light Appearance` berarti mode terang.
- `Dark Appearance` berarti mode gelap.

Kita dapat beralih tampilan pratinjau dari sini dan melihat efek tampilan antarmuka saat berada dalam mode terang dan mode gelap.

## Menampilkan Dua Tampilan Berdampingan

Jika ingin melihat mode terang dan mode gelap secara bersamaan, kamu dapat menggunakan fitur `Variants`.

Di bagian bawah area `Canvas`, klik tombol `Variants`, lalu pilih `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Setelah dipilih, `Canvas` akan menampilkan efek pratinjau mode terang dan mode gelap secara bersamaan.

![canvas3](../../../Resource/025_view3.png)

Dengan begitu, kita dapat membandingkan perbedaan antarmuka pada dua tampilan dengan lebih mudah.

Secara sederhana:

Jika hanya ingin beralih sementara antara mode terang dan mode gelap, gunakan `Canvas Device Settings`.

Jika ingin melihat kedua tampilan secara bersamaan, gunakan `Color Scheme Variants`.

## View Secara Default Akan Beradaptasi dengan Tampilan

Dalam SwiftUI, banyak view sistem secara default akan otomatis beradaptasi dengan mode terang dan mode gelap.

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Terang")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("teks teks teks")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Efek tampilan:

![canvas](../../../Resource/025_view4.png)

Dapat dilihat bahwa dalam mode terang, ikon dan judul biasanya tampil dengan warna gelap.

Dalam mode gelap, ikon dan judul akan otomatis berubah menjadi warna terang.

Ini karena view SwiftUI seperti `Text` dan `Image` secara default menyesuaikan warna berdasarkan tampilan sistem.

Dengan kata lain, jika kita tidak menentukan warna tetap secara manual, SwiftUI akan membantu menangani sebagian adaptasi tampilan.

## Warna Tetap Tidak Otomatis Bertukar

Perlu diperhatikan bahwa jika kita menentukan warna tetap secara manual, warna tersebut tidak akan otomatis bertukar antara mode terang dan mode gelap.

Contohnya:

```swift
Text("teks teks teks")
	.foregroundStyle(Color.gray)
```

Teks di sini ditentukan sebagai `Color.gray`, sehingga akan selalu ditampilkan sebagai abu-abu.

Contoh lainnya:

```swift
Text("Judul")
    .foregroundStyle(Color.white)
```

Kode ini akan menampilkan teks putih baik dalam mode terang maupun mode gelap.

Jika latar belakangnya juga terang, teks putih mungkin menjadi sulit dilihat.

Jadi saat melakukan adaptasi tampilan, usahakan menghindari penulisan warna tetap seperti `Color.white` dan `Color.black` secara sembarangan.

Dalam banyak kasus, kamu dapat lebih dulu menggunakan gaya semantik sistem, misalnya:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Artinya:

- `.primary` biasanya digunakan untuk konten utama.
- `.secondary` biasanya digunakan untuk konten sekunder.

Keduanya akan otomatis menyesuaikan efek tampilan berdasarkan mode terang dan mode gelap.

## Menampilkan Konten Berbeda Berdasarkan Tampilan

Terkadang, kita tidak hanya ingin warna berubah, tetapi juga ingin menampilkan konten yang berbeda dalam tampilan yang berbeda.

Contohnya:

- Dalam mode terang, tampilkan ikon bohlam biasa.
- Dalam mode gelap, tampilkan ikon bohlam yang menyala.
- Dalam mode terang, judul menampilkan `Terang`.
- Dalam mode gelap, judul menampilkan `Gelap`.

Pada saat ini, kita perlu menentukan apakah sistem saat ini berada dalam mode terang atau mode gelap.

Dalam SwiftUI, kita dapat memperoleh mode tampilan saat ini melalui nilai environment `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Kode lengkap:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Terang" : "Gelap"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("teks teks teks")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Efek tampilan:

![view](../../../Resource/025_view5.png)

Dari efek pratinjau, terlihat bahwa view yang sama tidak menampilkan konten yang sepenuhnya sama dalam mode tampilan yang berbeda.

Dalam mode terang, `Image` menampilkan ikon bohlam biasa, dan judul menampilkan `Terang`.

Dalam mode gelap, `Image` menampilkan ikon bohlam yang menyala, dan judul menampilkan `Gelap`.

Dengan kata lain, perubahan di sini bukan hanya perubahan warna, tetapi nama ikon dan teks judul itu sendiri juga berubah.

Ini karena kita tidak menuliskan ikon dan judul secara tetap langsung di dalam `body`, melainkan menghitung konten yang berbeda berdasarkan `colorScheme`.

Dalam kode ini, kita menggunakan dua computed property:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Terang" : "Gelap"
}
```

Saat `colorScheme` adalah `.light`, artinya mode saat ini adalah mode terang.

Saat `colorScheme` adalah `.dark`, artinya mode saat ini adalah mode gelap.

Jadi kita dapat mengembalikan nama ikon dan teks judul yang berbeda berdasarkan mode tampilan yang berbeda.

Ini juga merupakan salah satu penggunaan umum computed property: menghitung konten yang perlu ditampilkan oleh view berdasarkan status saat ini.

## Memahami @Environment

Ini adalah pertama kalinya kita mengenal `@Environment`.

`@Environment` dapat dipahami sebagai: membaca sebuah nilai dari environment SwiftUI.

Saat App berjalan, sistem menyediakan banyak informasi environment, misalnya:

- Bahasa saat ini
- Mode tampilan saat ini
- Arah tata letak saat ini
- Pengaturan ukuran font saat ini

Saat kita perlu mendapatkan mode tampilan saat ini, kita dapat membaca `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Di sini:

```swift
\.colorScheme
```

berarti membaca nilai `colorScheme` dari environment.

```swift
private var colorScheme
```

berarti menyimpan nilai yang dibaca ke dalam variabel `colorScheme`.

Nama variabel dapat ditentukan sendiri. Misalnya, kamu juga dapat menulis:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Selama `\.colorScheme` di depan tidak berubah, artinya nilai yang dibaca adalah mode tampilan saat ini.

## Dua Nilai Umum colorScheme

`colorScheme` umumnya memiliki dua nilai:

```swift
.light
.dark
```

Artinya:

- `.light`: mode terang
- `.dark`: mode gelap

Contohnya:

```swift
private var titleName: String {
    colorScheme == .light ? "Terang" : "Gelap"
}
```

Maksud kode ini adalah:

Jika saat ini adalah mode terang, `colorScheme == .light` bernilai benar, sehingga mengembalikan `"Terang"`.

Jika tidak, mengembalikan `"Gelap"`.

Jadi, dalam mode terang:

```swift
Text(titleName)
```

Yang ditampilkan adalah:

```swift
Terang
```

Dalam mode gelap, yang ditampilkan adalah:

```swift
Gelap
```

Dengan cara ini, kita dapat menampilkan konten yang berbeda berdasarkan tampilan yang berbeda.

## Contoh Adaptasi Warna

Selain teks dan ikon, terkadang kita juga perlu menangani adaptasi warna sendiri.

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Teks")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Efek tampilan:

![view](../../../Resource/025_view6.png)

Dalam kode ini, teks berwarna putih dan latar belakang berwarna hitam.

Dalam mode terang, latar belakang hitam terlihat cukup jelas.

Namun, dalam mode gelap, jika seluruh latar belakang antarmuka juga hitam, latar belakang hitam ini akan menyatu dengan latar belakang sistem dan terlihat kurang jelas.

Pada saat ini, kita dapat mengganti warna teks dan warna latar belakang berdasarkan mode tampilan:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Teks")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Efek tampilan:

![view](../../../Resource/025_view7.png)

Sekarang, mode terang menggunakan latar belakang hitam dan teks putih.

Mode gelap menggunakan latar belakang putih dan teks hitam.

Dengan begitu, dalam tampilan apa pun, teks dan latar belakang memiliki kontras yang jelas, sehingga pengguna dapat melihat konten dengan jelas.

## Menggunakan Assets untuk Mengadaptasi Warna

Selain menggunakan `colorScheme` untuk menentukan secara manual, kita juga dapat menggunakan warna resource `Assets` untuk beradaptasi dengan mode terang dan mode gelap.

Cara ini lebih cocok untuk mengelola warna umum dalam App.

Di proyek Xcode, temukan folder resource `Assets`.

![assets](../../../Resource/025_color.png)

Buka folder `Assets`, klik kanan area kosong, lalu pilih `New Color Set` untuk membuat resource warna baru.

![assets](../../../Resource/025_color1.png)

Di sini kita membuat sebuah warna dan menamainya `redText`.

![assets](../../../Resource/025_color2.png)

Resource warna dapat mengatur warna untuk mode terang dan mode gelap secara terpisah.

![assets](../../../Resource/025_color3.png)

Setelah memilih area warna yang sesuai, kamu dapat mengubah warna di inspector sebelah kanan.

Klik tombol `Hide or show the Inspectors` di sudut kanan atas untuk membuka area inspector.

Lalu pilih `Show the Attributes inspector`, temukan `Show Color Panel` di bagian bawah, dan buka panel warna.

![assets](../../../Resource/025_color4.png)

Klik warna di panel warna, maka area warna yang sesuai untuk `redText` akan berubah secara bersamaan.

Di sini kita mengatur `redText` menjadi:

- Mode terang menampilkan warna merah
- Mode gelap menampilkan warna hijau

![assets](../../../Resource/025_color5.png)

Kembali ke kode SwiftUI, kamu dapat menggunakan warna ini seperti berikut:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Di sini:

```swift
Color("redText")
```

berarti membaca resource warna bernama `redText` dari `Assets`.

Efek tampilan:

![assets](../../../Resource/025_view8.png)

Dapat dilihat bahwa `Color("redText")` yang sama akan menampilkan warna berbeda dalam mode terang dan mode gelap.

Ini menunjukkan bahwa warna `Assets` itu sendiri juga mendukung adaptasi tampilan.

## Perbedaan Antara colorScheme dan Assets

`colorScheme` dan `Assets` sama-sama dapat menerapkan adaptasi tampilan, tetapi keduanya cocok untuk skenario yang berbeda.

Jika hanya ingin mengganti konten teks, nama gambar, atau nama `SF Symbols` berdasarkan mode terang dan mode gelap, kamu dapat menggunakan `colorScheme`.

Contohnya:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Jika warna tersebut sering digunakan dalam App, misalnya warna tema, warna latar belakang kartu, atau warna teks, lebih disarankan menggunakan warna `Assets`.

Sebab warna `Assets` dapat digunakan ulang di banyak view, dan lebih mudah diubah di kemudian hari.

Contohnya:

```swift
Color("redText")
```

Dengan begitu, kamu hanya perlu mengubah warna di `Assets`, dan semua tempat yang menggunakan warna tersebut akan ikut berubah.

## Ringkasan

Dalam pelajaran ini, kita mempelajari adaptasi tampilan untuk mode terang dan mode gelap.

Pertama, kita mempelajari cara mempratinjau tampilan yang berbeda di `Canvas` Xcode, dan juga mempelajari cara menggunakan `Color Scheme Variants` untuk melihat mode terang dan mode gelap secara bersamaan.

Kemudian, kita memahami bahwa view SwiftUI seperti `Text` dan `Image` secara default akan otomatis mengadaptasi warna berdasarkan tampilan sistem.

Namun, jika kita menentukan warna tetap secara manual, misalnya `Color.white` atau `Color.black`, warna-warna ini tidak akan otomatis bertukar.

Selanjutnya, kita mempelajari `@Environment` dan `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Melalui `colorScheme`, kita dapat menentukan apakah mode saat ini adalah mode terang atau mode gelap, lalu menampilkan ikon, teks, atau warna yang berbeda berdasarkan tampilan yang berbeda.

Terakhir, kita mempelajari warna `Assets`.

Warna `Assets` dapat mengatur warna untuk mode terang dan mode gelap secara terpisah, sehingga cocok untuk mengelola resource warna umum dalam App.

Adaptasi tampilan dapat membuat App memiliki efek tampilan yang lebih baik baik pada siang maupun malam hari, dan juga dapat menghindari masalah seperti teks sulit dibaca atau latar belakang kurang jelas.

Dalam pengembangan nyata, disarankan untuk lebih dulu menggunakan kemampuan adaptasi default SwiftUI dan warna `Assets`.

Saat perlu mengganti teks, ikon, gambar, atau menangani sedikit efek tampilan khusus dalam tampilan yang berbeda, barulah gunakan `colorScheme` untuk melakukan pemeriksaan.

## Pengetahuan Tambahan: Menentukan Ukuran Font

Saat sebelumnya mempelajari `font`, kita pernah menggunakan beberapa gaya font sistem:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Selain menggunakan gaya font sistem seperti `.largeTitle` dan `.callout`, kamu juga dapat menentukan ukuran font secara manual.

Contohnya:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Di sini:

```swift
.font(.system(size: 100))
```

berarti mengatur ukuran font menjadi `100 pt`.

Untuk ikon `SF Symbols`, `font` juga akan memengaruhi ukuran ikon.

Jadi, jika ingin ikon tampil lebih besar, kamu dapat menentukan ukuran melalui `.font(.system(size:))`.

Contohnya:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Perlu diperhatikan bahwa meskipun menentukan ukuran font secara manual lebih fleksibel, teks biasa tidak disarankan banyak menggunakan ukuran font tetap.

Untuk teks biasa, prioritaskan gaya font sistem seperti `.title`, `.headline`, `.body`, dan `.caption`.

Dengan begitu, teks dapat lebih baik beradaptasi dengan perangkat yang berbeda dan pengaturan ukuran font pengguna.
