# Aplikasi Fill Light

Dalam pelajaran ini, kita akan membina sebuah aplikasi fill light yang sangat menarik. Apabila malam tiba, kita boleh memaparkan pelbagai warna pada skrin telefon dan menggunakannya sebagai fill light yang ringkas.

Aplikasi fill light ini boleh menukar warna dengan mengetik skrin, dan juga boleh melaraskan kecerahan dengan menggunakan slider.

Dalam contoh ini, kita akan mempelajari cara menggunakan `brightness` untuk melaraskan kecerahan paparan, `onTapGesture` untuk menambah gerak isyarat ketik pada paparan, serta kawalan `Slider`.

Hasil:

![Color](../../Resource/018_color.png)

## Memaparkan Warna

Mula-mula, mari kita biarkan paparan menunjukkan satu warna.

Dalam SwiftUI, `Color` bukan sahaja mewakili warna, malah ia juga boleh dipaparkan sebagai satu paparan:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Di sini, `Color.red` mewakili paparan berwarna merah. `.ignoresSafeArea()` menjadikan paparan warna memenuhi keseluruhan skrin, jadi ia lebih menyerupai kesan fill light sebenar.

Hasil:

![Color](../../Resource/018_color1.png)

### Tatasusunan Warna dan Indeks

Sekarang hanya satu warna sahaja dipaparkan. Tetapi fill light biasanya tidak terhad kepada satu warna sahaja. Ia juga boleh memaparkan biru, kuning, ungu, putih dan warna-warna lain.

Kita mahu menukar antara warna-warna yang berbeza apabila skrin diketuk. Kita boleh meletakkan warna-warna ini ke dalam satu tatasusunan untuk diuruskan bersama:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Tatasusunan sesuai untuk menyimpan "sekumpulan data dengan jenis yang sama". Di sini, setiap elemen dalam tatasusunan ialah `Color`.

Jika kita mahu memaparkan satu warna tertentu, kita boleh menggunakan indeks:

```swift
colors[0]
```

Ini bermaksud membaca warna pada indeks `0` dalam tatasusunan, iaitu warna pertama.

Sekarang kod boleh ditulis seperti ini:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Dengan cara ini, skrin akan memaparkan warna pertama dalam tatasusunan, iaitu merah.

### Menggunakan Indeks untuk Mengawal Warna

Jika kita perlu bertukar antara warna-warna yang berbeza, kita memerlukan satu pemboleh ubah untuk mengurus indeks dan bukannya menulis indeks secara tetap.

Kita boleh menggunakan `@State` untuk mengisytiharkan pemboleh ubah yang menyimpan indeks:

```swift
@State private var index = 0
```

Di sini, `index` mewakili indeks warna semasa.

Apabila `index` berubah, SwiftUI akan mengira semula antara muka dan mengemas kini kandungan yang dipaparkan.

Kemudian tukar `colors[0]` asal kepada:

```swift
colors[index]
```

Dengan cara ini, warna yang dipaparkan dalam paparan ditentukan oleh `index`.

Sekarang kod menjadi:

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

Apabila `index` berubah, `colors[index]` juga akan memaparkan warna yang berbeza.

Contohnya:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Perlu diingat bahawa `index` tidak boleh melebihi indeks maksimum dalam tatasusunan, jika tidak ralat keluar julat akan berlaku.

## Gerak Isyarat Ketik

Sekarang kita boleh memaparkan warna yang berbeza berdasarkan `index`, tetapi kita masih belum boleh menukar warna dengan mengetik.

Dalam pelajaran “Quote Carousel” sebelum ini, kita menggunakan `Button` untuk mengawal pertukaran quote.

Namun kali ini, kita mahu “mengetik keseluruhan kawasan warna” untuk menukar warna, jadi `onTapGesture` lebih sesuai digunakan.

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

Apabila kita mengetik paparan warna, kod ini akan dijalankan:

```swift
index += 1
```

Ini bermaksud menambah `index` sebanyak `1`. Selepas indeks bertambah, `colors[index]` akan memaparkan warna seterusnya dalam tatasusunan.

### `onTapGesture`

`onTapGesture` ialah modifier gerak isyarat yang menambah tindakan ketik pada sesuatu paparan.

Penggunaan asas:

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

Apabila paparan merah ini diketuk, kod di dalam kurungan akan dijalankan, dan ini akan dipaparkan dalam konsol:

```swift
Click color
```

Melalui `onTapGesture`, kita boleh menentukan apa yang akan berlaku selepas sesuatu paparan diketuk.

### Perbezaan dengan `Button`

Sebelum ini kita telah mempelajari paparan `Button`. Kedua-dua `Button` dan `onTapGesture` boleh mengendalikan tindakan ketik, tetapi situasi penggunaannya tidak sepenuhnya sama.

`onTapGesture` lebih sesuai untuk “menambah fungsi ketik pada paparan yang sedia ada”, seperti `Color`, `Image`, `Text`, atau paparan biasa yang lain.

Sebaliknya, `Button` lebih sesuai apabila kita mahu mewakili butang yang jelas, seperti “Sahkan”, “Hantar”, atau “Padam”.

Dalam aplikasi fill light ini, kita mahu fungsi pertukaran warna menjadi lebih ringkas. Mengetik seluruh kawasan warna untuk menukar warna menjadikan `onTapGesture` pilihan yang baik di sini.

## Masalah Indeks

Sekarang kita boleh mengetik skrin untuk bertukar antara warna-warna yang berbeza.

Tetapi ada satu masalah penting di sini: **indeks boleh melepasi julat tatasusunan**.

Contohnya:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Jika kita terus mengetik skrin, `index` akhirnya akan menjadi `4`, dan pada ketika itu ralat “index out of range” akan berlaku.

Ini kerana tatasusunan `colors` mempunyai `4` elemen, tetapi pengindeksan bermula dari `0`, jadi julat indeks yang sah ialah `0 - 3`, bukannya `4`.

Jika kita mengakses `colors[4]`, ralat “index out of range” akan berlaku.

Dalam kod semasa, setiap ketikan akan menambah `index` sebanyak `1`. Jika kita tidak mengendalikannya, akhirnya ia pasti akan keluar dari julat yang sah.

Oleh itu, semasa skrin diketuk, kita perlu memeriksa indeks: jika ia sudah berada pada warna terakhir, kembali ke warna pertama; jika tidak, terus tambah `1`.

Kita boleh melakukannya dengan pernyataan `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Dalam kod ini, `colors.count` bermaksud bilangan elemen dalam tatasusunan.

Dalam tatasusunan semasa terdapat 4 warna, jadi:

```swift
colors.count // 4
```

Tetapi indeks maksimum bukan `4`, sebaliknya `3`, kerana pengindeksan bermula dari `0`.

Jadi indeks terakhir perlu ditulis seperti ini:

```swift
colors.count - 1
```

Iaitu:

```swift
4 - 1 = 3
```

Logik ini bermaksud: jika indeks semasa sudah merujuk kepada warna terakhir, tetapkan semula indeks kepada `0`; jika tidak, tambahkannya sebanyak `1`.

Dengan cara ini, warna boleh bertukar secara berulang.

### Mengoptimumkan Logik Indeks

Jika kita mahu menjadikan kod lebih ringkas, kita juga boleh menggunakan operator ternary:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Kod ini bermaksud: jika `index == colors.count - 1` adalah benar, pulangkan `0`. Jika tidak, pulangkan `index + 1`.

Akhir sekali, hasil itu diberikan semula kepada `index`.

Sekarang kita boleh menghasilkan kesan pertukaran warna.

Kod lengkap:

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

Sekarang kita boleh mengetik skrin dan bertukar antara warna-warna yang berbeza. Sebuah aplikasi fill light asas telah siap.

## Memaparkan Nama Warna

Kita boleh menambah satu lagi kumpulan teks yang sepadan dengan warna-warna tersebut, supaya apabila warna berubah, nama warna semasa juga akan dipaparkan pada skrin.

Contohnya:

- Merah memaparkan `Red`
- Biru memaparkan `Blue`
- Kuning memaparkan `Yellow`
- Ungu memaparkan `Purple`

Di sini juga kita boleh menggunakan tatasusunan untuk menyimpan nama-nama warna:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Susunan teks dalam tatasusunan ini mesti sepadan sepenuhnya dengan susunan warna dalam tatasusunan warna.

Kemudian kita boleh menggunakan `Text` untuk memaparkan nama warna mengikut indeks semasa:

```swift
Text(colorsName[index])
```

`Text` memaparkan nama warna semasa berdasarkan `index`.

Gunakan modifier untuk menambah baik penampilan `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Ini akan menjadikan `Text` dipaparkan dalam warna putih, bersaiz tajuk, dan dalam fon tebal.

Sekarang kita mempunyai paparan `Color` skrin penuh. Jika kita mahu `Text` dipaparkan di atas paparan `Color`, kita perlu menggunakan bekas susun atur `ZStack` untuk menyusunnya secara bertindan.

```swift
ZStack {
    Color
    Text
}
```

Jadi kodnya menjadi:

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

Dengan cara ini, latar belakang ialah paparan warna, dan di atasnya ditindankan paparan teks.

Hasil:

![Color](../../Resource/018_color2.png)

Perlu diperhatikan bahawa dalam `ZStack`, paparan yang ditulis kemudian biasanya akan muncul di hadapan. Jika `Text` ditulis sebelum `Color`, paparan `Color` yang ditulis kemudian boleh menutupi `Text`.

## Mengawal Kecerahan

Sekarang kita boleh menukar antara warna-warna yang berbeza, tetapi fill light mempunyai satu lagi fungsi penting: **melaraskan kecerahan**.

Dalam SwiftUI, kita boleh menggunakan modifier `brightness` untuk melaraskan kecerahan sesuatu paparan.

Contohnya:

```swift
.brightness(1)
```

Kita boleh menulis:

```swift
colors[index]
    .brightness(0.5)
```

Ini menjadikan warna semasa lebih terang dan lebih hampir kepada kesan fill light.

Julat kecerahan ialah `0 - 1`. `0` bermaksud mengekalkan warna asal, dan semakin hampir nilainya kepada `1`, semakin terang warna tersebut. `1` bermaksud hasil putih yang paling terang.

Walaupun kita boleh mengawal `brightness` melalui kod, pengguna masih belum boleh melaraskannya sendiri secara terus.

Oleh itu, kita perlu menambah satu kawalan yang boleh digerakkan: `Slider`.

## Paparan `Slider`

Dalam SwiftUI, `Slider` ialah satu kawalan yang digunakan untuk memilih nilai dalam satu julat. Apple menerangkannya sebagai “kawalan untuk memilih nilai daripada julat linear yang terhad”.

Penggunaan asas:

```swift
Slider(value: $value, in: 0...1)
```

Penjelasan parameter:

1. `value: $value`: `Slider` perlu diikat kepada satu pemboleh ubah.

    Apabila slider digerakkan, nilai pemboleh ubah juga berubah pada masa yang sama. Sebaliknya, jika pemboleh ubah berubah, slider juga akan dikemas kini.

    Ini sangat serupa dengan `TextField` yang kita pelajari sebelum ini. Kedua-duanya “mengikat kawalan kepada pemboleh ubah”.

    Pemboleh ubah yang diikat memerlukan simbol `$` di hadapannya untuk mewakili binding.

2. `in: 0...1`: parameter ini mewakili julat nilai slider.

    Di sini, `0...1` bermaksud nilai minimum ialah `0` dan nilai maksimum ialah `1`.

    Apabila slider digerakkan sepenuhnya ke kiri, pemboleh ubah yang diikat hampir kepada `0`; apabila digerakkan sepenuhnya ke kanan, ia hampir kepada `1`.

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

`Slider` diikat kepada pemboleh ubah `value`. Apabila slider digerakkan, nilai `value` juga berubah pada masa yang sama.

Paparan:

![Slider](../../Resource/018_slider.png)

Apabila `Slider` digerakkan ke kiri, nilai terikat `value` menjadi `0`. Apabila digerakkan ke kanan, nilainya menjadi `1`.

### Julat Nilai

Julat nilai `Slider` tidak tetap. Ia juga boleh ditulis seperti ini:

```swift
0...100
```

atau julat yang lain.

Tetapi dalam aplikasi fill light ini, kita perlu mengawal kecerahan, jadi `0...1` ialah pilihan yang paling sesuai.

## Menggunakan `Slider` untuk Mengawal Kecerahan

Sekarang kita perlu menghubungkan `Slider` dengan `brightness`.

Pertama, cipta pemboleh ubah untuk menyimpan nilai kecerahan:

```swift
@State private var slider = 0.0
```

Di sini, `0.0` ialah nilai bertipe `Double`.

Oleh kerana `Slider` biasanya diikat kepada jenis numerik, dan di sini kita mahu nilainya berubah secara berterusan, maka `Double` lebih sesuai. Selain itu, `brightness` hanya menerima nilai bertipe `Double`.

Kemudian, hantar nilai ini ke `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Apabila `slider == 0`, warna kekal dalam keadaan lalainya. Semakin dekat `slider` kepada `1`, semakin terang warna itu kelihatan.

### Menambah Kawalan `Slider`

Seterusnya, tambahkan kawalan `Slider` untuk mengubah pemboleh ubah ini:

```swift
Slider(value: $slider, in: 0...1)
```

Apabila slider berubah, nilai `slider` juga akan berubah, dan `brightness(slider)` akan mengemas kini kecerahan pada masa yang sama.

Ini ialah contoh yang sangat tipikal tentang bagaimana “pemboleh ubah memacu paparan” dalam SwiftUI.

### Melaraskan Penampilan `Slider`

Secara lalai, `Slider` menggunakan lebar yang tersedia.

Kita boleh memberinya lebar tetap:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Kemudian tambahkan beberapa modifier lagi supaya ia lebih mudah dilihat:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Ini memberikan slider latar belakang putih dan bucu membulat, menjadikannya lebih menonjol di atas paparan `Color`.

Akhir sekali, letakkannya di bahagian bawah skrin.

Memandangkan kita sudah menggunakan `ZStack`, kita boleh meletakkan `VStack` di dalamnya dan menggunakan `Spacer()` untuk menolak `Slider` ke bahagian bawah.

## Kod Lengkap

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

Dengan menggunakan pengetahuan yang telah kita pelajari sebelum ini bersama konsep asas seperti warna dan tatasusunan, kita telah membina sebuah aplikasi fill light yang sangat menarik.

Melalui aplikasi fill light ini, kita telah mempelajari cara menggunakan `brightness` untuk melaraskan kecerahan, `onTapGesture` untuk menambah tindakan ketik pada paparan, serta kawalan `Slider`.

Kita menambah `onTapGesture` pada paparan `Color` untuk menukar warna. Kita juga menggunakan kawalan `Slider` untuk mengubah pemboleh ubah yang mengurus `brightness`, yang merupakan satu lagi contoh bahawa “pemboleh ubah memacu paparan”.

Kita juga mengulang kaji operator ternary, menggunakan `ZStack` untuk menyusun paparan secara bertindih, dan menggunakan tatasusunan untuk mengurus kumpulan data dengan jenis yang sama. Ini membantu memperdalam pemahaman kita tentang tatasusunan dan indeks, termasuk masalah praktikal untuk mengelakkan ralat indeks di luar julat.

Walaupun contoh ini tidak rumit, ia menghubungkan banyak idea asas yang telah kita pelajari sebelum ini. Apabila semuanya digabungkan dalam satu projek kecil yang sebenar, menjadi lebih mudah untuk memahami kegunaan setiap konsep.

### Senario Penggunaan Sebenar

Bayangkan anda meletakkan iPhone lama di atas meja dan menggunakan aplikasi fill light yang anda bangunkan sendiri untuk mengawal warna cahaya. Itu akan menjadi pengalaman yang sangat baik.

Terdapat banyak aplikasi “fill light” di App Store, dan aplikasi-aplikasi itu juga tidak kelihatan begitu rumit.

![AppStore](../../Resource/018_appStore.PNG)

Kita boleh mula membangunkan aplikasi mudah dan cuba menerbitkannya di App Store. Ini bukan sahaja meningkatkan minat kita terhadap pembangunan, tetapi juga merekodkan perkembangan kita.

### Latihan Selepas Kelas

Anda boleh terus memikirkan cara untuk mengembangkan aplikasi fill light ini dengan lebih lanjut, contohnya:

- Menambah lebih banyak warna
- Memaparkan nilai kecerahan semasa
- Menambah baik reka bentuk kawasan slider di bahagian bawah

Apabila anda benar-benar mula menggunakan pengetahuan ini, anda akan mendapati bahawa setiap konsep yang kita pelajari sebenarnya ialah alat untuk membina aplikasi.

Semakin banyak alat yang kita kuasai, semakin banyak ciri yang boleh kita hasilkan.
