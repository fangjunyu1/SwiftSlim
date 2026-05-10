# Penyesuaian Penampilan

Dalam pelajaran ini, kita akan mempelajari penyesuaian penampilan untuk mod cerah dan mod gelap.

Pada iPhone, iPad dan Mac, pengguna boleh memilih mod cerah atau mod gelap.

Apabila sistem bertukar kepada mod gelap, warna latar belakang, teks dan ikon dalam banyak App juga akan berubah mengikutnya.

Contohnya, antara muka pada waktu siang mungkin menggunakan latar belakang cerah, manakala pada waktu malam ia mungkin bertukar kepada latar belakang gelap.

![view](../../../Resource/025_view9.png)

Keupayaan untuk melaraskan paparan antara muka secara automatik mengikut penampilan sistem ini dipanggil penyesuaian penampilan.

## Pratonton Penyesuaian Penampilan dalam Xcode

Sebelum mempelajari penyesuaian penampilan, kita lihat dahulu cara membuat pratonton mod cerah dan mod gelap dalam Xcode.

Di bahagian bawah kawasan `Canvas`, klik butang `Device Settings` untuk membuka tetingkap timbul `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Dalam tetingkap timbul itu, anda boleh melihat tetapan `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Maksudnya:

- `Light Appearance` bermaksud mod cerah.
- `Dark Appearance` bermaksud mod gelap.

Kita boleh menukar penampilan pratonton di sini dan menyemak rupa antara muka semasa dalam mod cerah dan mod gelap.

## Paparkan Dua Penampilan Secara Bersebelahan

Jika anda mahu melihat mod cerah dan mod gelap pada masa yang sama, anda boleh menggunakan fungsi `Variants`.

Di bahagian bawah kawasan `Canvas`, klik butang `Variants` dan pilih `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Selepas dipilih, `Canvas` akan memaparkan pratonton mod cerah dan mod gelap pada masa yang sama.

![canvas3](../../../Resource/025_view3.png)

Ini memudahkan kita membandingkan perbezaan antara muka di bawah dua penampilan tersebut.

Secara ringkas:

Jika anda hanya mahu menukar mod cerah/gelap buat sementara waktu, anda boleh menggunakan `Canvas Device Settings`.

Jika anda mahu melihat kedua-dua penampilan pada masa yang sama, anda boleh menggunakan `Color Scheme Variants`.

## View Menyesuaikan Penampilan Secara Lalai

Dalam SwiftUI, banyak view sistem akan menyesuaikan diri dengan mod cerah dan mod gelap secara automatik secara lalai.

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Cerah")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("contoh contoh contoh")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Kesan paparan:

![canvas](../../../Resource/025_view4.png)

Anda boleh lihat, dalam mod cerah, ikon dan tajuk biasanya dipaparkan dalam warna gelap.

Dalam mod gelap, ikon dan tajuk akan bertukar menjadi warna cerah secara automatik.

Ini kerana view SwiftUI seperti `Text` dan `Image` secara lalai akan melaraskan warna mengikut penampilan sistem.

Dengan kata lain, jika kita tidak menetapkan warna tetap secara manual, SwiftUI akan membantu kita mengendalikan sebahagian penyesuaian penampilan.

## Warna Tetap Tidak Bertukar Secara Automatik

Perlu diperhatikan bahawa jika kita menetapkan warna tetap secara manual, warna itu tidak akan bertukar secara automatik antara mod cerah dan mod gelap.

Contohnya:

```swift
Text("contoh contoh contoh")
	.foregroundStyle(Color.gray)
```

Teks di sini ditetapkan kepada `Color.gray`, jadi ia akan sentiasa dipaparkan sebagai kelabu.

Contoh lain:

```swift
Text("Tajuk")
    .foregroundStyle(Color.white)
```

Kod ini akan memaparkan teks putih dalam mod cerah dan juga mod gelap.

Jika latar belakang juga cerah, teks putih mungkin menjadi sukar dibaca.

Jadi semasa membuat penyesuaian penampilan, cuba elakkan daripada menulis warna tetap seperti `Color.white` dan `Color.black` secara sembarangan.

Dalam banyak keadaan, anda boleh mengutamakan gaya semantik sistem, contohnya:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Maksudnya:

- `.primary` biasanya digunakan untuk kandungan utama.
- `.secondary` biasanya digunakan untuk kandungan sekunder.

Kedua-duanya akan melaraskan kesan paparan secara automatik berdasarkan mod cerah dan mod gelap.

## Paparkan Kandungan Berbeza Berdasarkan Penampilan

Kadangkala, kita bukan sahaja mahu warna berubah, tetapi juga mahu kandungan yang berbeza dipaparkan di bawah penampilan yang berbeza.

Contohnya:

- Paparkan ikon mentol biasa dalam mod cerah.
- Paparkan ikon mentol yang menyala dalam mod gelap.
- Paparkan `Cerah` sebagai tajuk dalam mod cerah.
- Paparkan `Gelap` sebagai tajuk dalam mod gelap.

Pada masa ini, kita perlu menentukan sama ada sistem semasa berada dalam mod cerah atau mod gelap.

Dalam SwiftUI, kita boleh mendapatkan mod penampilan semasa melalui nilai persekitaran `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Kod lengkap:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Cerah" : "Gelap"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("contoh contoh contoh")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Kesan paparan:

![view](../../../Resource/025_view5.png)

Daripada hasil pratonton, anda boleh lihat bahawa view yang sama tidak memaparkan kandungan yang sepenuhnya sama di bawah mod penampilan yang berbeza.

Dalam mod cerah, `Image` memaparkan ikon mentol biasa, dan tajuk memaparkan `Cerah`.

Dalam mod gelap, `Image` memaparkan ikon mentol yang menyala, dan tajuk memaparkan `Gelap`.

Dengan kata lain, perubahan di sini bukan sekadar perubahan warna. Nama ikon dan teks tajuk itu sendiri juga berubah.

Ini kerana kita tidak menulis ikon dan tajuk secara tetap terus di dalam `body`, tetapi mengira kandungan yang berbeza berdasarkan `colorScheme`.

Dalam kod ini, kita menggunakan dua computed property:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Cerah" : "Gelap"
}
```

Apabila `colorScheme` ialah `.light`, ini bermaksud mod semasa ialah mod cerah.

Apabila `colorScheme` ialah `.dark`, ini bermaksud mod semasa ialah mod gelap.

Jadi kita boleh mengembalikan nama ikon dan teks tajuk yang berbeza mengikut mod penampilan yang berbeza.

Ini juga merupakan penggunaan umum computed property: mengira kandungan yang perlu dipaparkan oleh view berdasarkan keadaan semasa.

## Memahami @Environment

Ini kali pertama kita mengenali `@Environment`.

`@Environment` boleh difahami sebagai membaca satu nilai daripada persekitaran SwiftUI.

Apabila App berjalan, sistem akan menyediakan pelbagai maklumat persekitaran, contohnya:

- Bahasa semasa
- Mod penampilan semasa
- Arah susun atur semasa
- Tetapan saiz fon semasa

Apabila kita perlu mendapatkan mod penampilan semasa, kita boleh membaca `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Di sini:

```swift
\.colorScheme
```

bermaksud membaca nilai `colorScheme` daripada persekitaran.

```swift
private var colorScheme
```

bermaksud menyimpan nilai yang dibaca ke dalam pemboleh ubah `colorScheme`.

Nama pemboleh ubah boleh anda tentukan sendiri. Contohnya, anda juga boleh menulis:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Selagi `\.colorScheme` di bahagian hadapan tidak berubah, ia bermaksud anda sedang membaca mod penampilan semasa.

## Dua Nilai Umum colorScheme

`colorScheme` biasanya mempunyai dua nilai:

```swift
.light
.dark
```

Maksudnya:

- `.light`: mod cerah
- `.dark`: mod gelap

Contohnya:

```swift
private var titleName: String {
    colorScheme == .light ? "Cerah" : "Gelap"
}
```

Maksud kod ini ialah:

Jika mod semasa ialah mod cerah, `colorScheme == .light` adalah benar, jadi ia mengembalikan `"Cerah"`.

Jika tidak, ia mengembalikan `"Gelap"`.

Jadi dalam mod cerah:

```swift
Text(titleName)
```

Teks yang dipaparkan ialah:

```swift
Cerah
```

Dalam mod gelap, teks yang dipaparkan ialah:

```swift
Gelap
```

Dengan cara ini, kita boleh memaparkan kandungan yang berbeza berdasarkan penampilan yang berbeza.

## Contoh Penyesuaian Warna

Selain teks dan ikon, kadangkala kita juga perlu mengendalikan penyesuaian warna sendiri.

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

Kesan paparan:

![view](../../../Resource/025_view6.png)

Dalam kod ini, teks berwarna putih dan latar belakang berwarna hitam.

Dalam mod cerah, latar belakang hitam agak jelas.

Namun dalam mod gelap, jika seluruh latar belakang antara muka juga hitam, latar belakang hitam ini akan bercampur dengan latar belakang sistem dan kelihatan kurang jelas.

Pada masa ini, kita boleh menukar warna teks dan warna latar belakang mengikut mod penampilan:

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

Kesan paparan:

![view](../../../Resource/025_view7.png)

Sekarang, dalam mod cerah terdapat latar belakang hitam dan teks putih.

Dalam mod gelap terdapat latar belakang putih dan teks hitam.

Dengan cara ini, tidak kira penampilan mana yang digunakan, teks dan latar belakang mempunyai kontras yang jelas, dan pengguna boleh melihat kandungan dengan jelas.

## Gunakan Assets untuk Menyesuaikan Warna

Selain membuat penentuan secara manual dengan `colorScheme`, kita juga boleh menggunakan warna sumber `Assets` untuk menyesuaikan mod cerah dan mod gelap.

Cara ini lebih sesuai untuk mengurus warna umum dalam App.

Dalam projek Xcode, cari folder sumber `Assets`.

![assets](../../../Resource/025_color.png)

Buka folder `Assets`, klik kanan pada kawasan kosong, kemudian pilih `New Color Set` untuk mencipta sumber warna baharu.

![assets](../../../Resource/025_color1.png)

Di sini, kita mencipta satu warna dan menamakannya `redText`.

![assets](../../../Resource/025_color2.png)

Sumber warna boleh menetapkan warna secara berasingan untuk mod cerah dan mod gelap.

![assets](../../../Resource/025_color3.png)

Selepas memilih kawasan warna yang berkaitan, anda boleh mengubah warna dalam inspector di sebelah kanan.

Klik butang `Hide or show the Inspectors` di penjuru kanan atas untuk membuka kawasan inspector.

Kemudian pilih `Show the Attributes inspector`, cari `Show Color Panel` di bahagian bawah, dan buka panel warna.

![assets](../../../Resource/025_color4.png)

Klik warna dalam panel warna, dan kawasan warna yang sepadan bagi `redText` akan berubah pada masa yang sama.

Di sini, kita menetapkan `redText` kepada:

- Paparkan merah dalam mod cerah
- Paparkan hijau dalam mod gelap

![assets](../../../Resource/025_color5.png)

Kembali ke kod SwiftUI, anda boleh menggunakan warna ini seperti berikut:

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

bermaksud membaca sumber warna bernama `redText` daripada `Assets`.

Kesan paparan:

![assets](../../../Resource/025_view8.png)

Anda boleh lihat bahawa `Color("redText")` yang sama memaparkan warna berbeza dalam mod cerah dan mod gelap.

Ini menunjukkan bahawa warna `Assets` itu sendiri juga menyokong penyesuaian penampilan.

## Perbezaan Antara colorScheme dan Assets

`colorScheme` dan `Assets` kedua-duanya boleh melaksanakan penyesuaian penampilan, tetapi ia sesuai untuk senario yang berbeza.

Jika anda hanya perlu menukar kandungan teks, nama imej atau nama `SF Symbols` mengikut mod cerah dan mod gelap, anda boleh menggunakan `colorScheme`.

Contohnya:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Jika warna itu sering digunakan dalam App, seperti warna tema, warna latar belakang kad atau warna teks, lebih disarankan untuk menggunakan warna `Assets`.

Ini kerana warna `Assets` boleh digunakan semula dalam banyak view dan lebih mudah diubah kemudian.

Contohnya:

```swift
Color("redText")
```

Dengan cara ini, anda hanya perlu mengubah warna dalam `Assets`, dan semua tempat yang menggunakan warna ini akan berubah bersama-sama.

## Ringkasan

Dalam pelajaran ini, kita mempelajari penyesuaian penampilan untuk mod cerah dan mod gelap.

Pertama, kita mempelajari cara membuat pratonton penampilan berbeza dalam `Canvas` Xcode, dan cara menggunakan `Color Scheme Variants` untuk melihat mod cerah dan mod gelap pada masa yang sama.

Kemudian, kita mengetahui bahawa view SwiftUI seperti `Text` dan `Image` secara lalai akan menyesuaikan warna secara automatik mengikut penampilan sistem.

Namun, jika kita menetapkan warna tetap secara manual, seperti `Color.white` atau `Color.black`, warna ini tidak akan bertukar secara automatik.

Seterusnya, kita mempelajari `@Environment` dan `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Melalui `colorScheme`, kita boleh menentukan sama ada mod semasa ialah mod cerah atau mod gelap, lalu memaparkan ikon, teks atau warna yang berbeza mengikut penampilan yang berbeza.

Akhir sekali, kita mempelajari warna `Assets`.

Warna `Assets` boleh menetapkan warna secara berasingan untuk mod cerah dan mod gelap, jadi ia sesuai untuk mengurus sumber warna umum dalam App.

Penyesuaian penampilan boleh menjadikan App kelihatan lebih baik pada waktu siang dan malam, serta mengelakkan masalah seperti teks sukar dibaca atau latar belakang tidak jelas.

Dalam pembangunan sebenar, disarankan untuk mengutamakan keupayaan penyesuaian lalai SwiftUI dan warna `Assets`.

Apabila anda perlu menukar teks, ikon, imej, atau mengendalikan sejumlah kecil kesan paparan khas di bawah penampilan yang berbeza, barulah gunakan `colorScheme` untuk membuat penentuan.

## Pengetahuan Tambahan: Menetapkan Saiz Fon

Semasa mempelajari `font` sebelum ini, kita pernah menggunakan beberapa gaya fon sistem:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Selain menggunakan gaya fon sistem seperti `.largeTitle` dan `.callout`, anda juga boleh menetapkan saiz fon secara manual.

Contohnya:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Di sini:

```swift
.font(.system(size: 100))
```

bermaksud menetapkan saiz fon kepada `100 pt`.

Untuk ikon `SF Symbols`, `font` juga akan mempengaruhi saiz ikon.

Jadi, jika anda mahu ikon dipaparkan lebih besar, anda boleh menetapkan saiz melalui `.font(.system(size:))`.

Contohnya:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Perlu diperhatikan bahawa walaupun menetapkan saiz fon secara manual lebih fleksibel, teks biasa tidak disarankan menggunakan saiz fon tetap secara berlebihan.

Untuk teks biasa, utamakan gaya fon sistem seperti `.title`, `.headline`, `.body` dan `.caption`.

Ini membolehkan antara muka lebih mudah menyesuaikan diri dengan peranti yang berbeza dan tetapan fon pengguna.
