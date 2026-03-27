# Warna yang menarik

Dalam pelajaran ini, kita akan mempelajari modifier visual yang biasa digunakan dalam SwiftUI, termasuk:

- warna
- warna hadapan
- warna latar belakang
- anjakan
- ketelusan
- kabur

Kita juga akan mempelajari Safe Area（kawasan selamat）。

Modifier ini digunakan untuk mengawal penampilan view, menjadikan antara muka lebih jelas dan lebih berlapis.

## Warna

Dalam SwiftUI, kita boleh menetapkan warna teks.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` bermaksud warna biru, dan sebenarnya ialah penulisan ringkas bagi `Color.blue`（inferens jenis）。

Warna biasa termasuk:

```
.black
.green
.yellow
.pink
.gray
...
```

Kesemuanya ialah sifat statik bagi `Color`.

![Color](../../RESOURCE/006_color.png)

Anda boleh menganggap `Color` sebagai jenis warna, dan `.blue`、`.red` ialah warna khusus di bawahnya.

### View Color

Dalam SwiftUI, `Color` juga boleh dipaparkan sebagai satu view.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Kod ini akan menghasilkan satu blok merah bersaiz 100×100.

Kita juga boleh membiarkan keseluruhan antara muka dipaparkan dengan warna tertentu:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Selepas dijalankan, anda akan mendapati warna merah tidak memenuhi keseluruhan skrin. Bahagian atas dan bawah iPhone masih putih. Ini melibatkan kewujudan Safe Area（kawasan selamat）。

## Safe Area（kawasan selamat）

Safe Area ialah kawasan yang dikhaskan oleh sistem untuk mengelakkan kandungan daripada dilindungi, termasuk:

1. Bar status di bahagian atas（masa, bateri）

2. Jalur penunjuk Home di bahagian bawah

3. Kawasan notch atau Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Secara lalai, SwiftUI akan mengehadkan kandungan di dalam kawasan selamat, jadi view tidak akan melanjut hingga ke tepi skrin.

### Mengabaikan Safe Area（kawasan selamat）

Jika anda mahu warna memenuhi keseluruhan skrin, anda boleh menggunakan `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Atau gunakan `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Dengan cara ini, view akan melanjut ke seluruh skrin.

Perlu diingat bahawa `edgesIgnoringSafeArea` ialah penulisan yang lebih lama. Sejak iOS 14, penggunaan `ignoresSafeArea` lebih digalakkan.

## Warna hadapan

### Modifier foregroundStyle

Dalam pelajaran terdahulu, kita telah mempelajari penggunaan `foregroundStyle` untuk menetapkan warna.

Contohnya:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ialah sistem gaya yang lebih baharu, dan ia menyokong warna, gradient, material dan lain-lain.

![Color](../../RESOURCE/006_color2.png)

### Modifier foregroundColor

`foregroundColor` juga boleh digunakan untuk menetapkan warna:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Cara penggunaannya sama seperti `foregroundStyle`.

Dalam versi Xcode terbaharu, Xcode akan memberi petunjuk bahawa `foregroundColor` mungkin akan ditamatkan pada masa hadapan dalam versi iOS akan datang, dan disarankan untuk mengutamakan penggunaan `foregroundStyle`.

## Latar belakang

Jika anda mahu menambah warna latar belakang pada view, anda boleh menggunakan `background`:

```swift
background(.red)
```

Contohnya, tambahkan warna latar belakang pada teks:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Apabila kita memilih teks dalam App seperti Word dan Chrome, kita boleh melihat kesan warna latar belakang yang serupa.

![Color](../../RESOURCE/006_color16.png)

Jika anda mahu memperbesar kawasan latar belakang, anda perlu menggunakannya bersama `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Di sini ada satu peraturan penting yang perlu diperhatikan:

Modifier SwiftUI membina view dari atas ke bawah. Modifier yang ditulis kemudian akan bertindak ke atas hasil yang sebelumnya.

Jadi:

```swift
.padding()
.background()
```

Ini bermaksud latar belakang akan membungkus view selepas jarak dalaman ditambah.

Jika susunannya ditulis terbalik:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Latar belakang tidak akan menjadi lebih besar, kerana latar belakang tidak membungkus `padding` yang datang selepasnya.

## Contoh - Nat empat sudut

Sekarang, kita buat satu view nat empat sudut yang ringkas.

![Color](../../RESOURCE/006_color8.png)

Mula-mula buat satu blok putih bersaiz 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Jika anda mahu ia menjadi bulat, anda boleh menggunakan `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Apabila jejari sudut sama dengan separuh lebar dan tinggi, ia akan menjadi bulatan.

Sekarang, tambahkan latar belakang berwarna biru:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

`padding` yang baharu akan membesarkan kawasan luar, dan `background` akan melukis warna biru pada kawasan luar tersebut.

Kini kesan nat empat sudut telah siap.

### Satu lagi pendekatan

Selain menggunakan warna latar belakang untuk menghasilkan nat empat sudut, kita juga boleh menggunakan `ZStack`.

Sebelum ini kita sudah belajar bahawa `ZStack` boleh digunakan untuk susunan bertindih. Nat empat sudut juga boleh difahami sebagai satu bulatan dan satu segi empat tepat yang dipaparkan secara bertindih.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` akan menindihkan view mengikut urutan, dan view yang ditambah kemudian akan dipaparkan di lapisan atas.

## Contoh - Dua bulatan yang bertindih

Banyak ikon dibentuk daripada gabungan bentuk-bentuk mudah, contohnya dua bulatan yang bertindih.

![Color](../../RESOURCE/006_color14.png)

Mula-mula, cipta dua bulatan:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Disebabkan kita mahu kedua-dua bulatan dipaparkan secara bertindih, kita gunakan susun atur `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Pada masa ini, dua bulatan yang sama saiz akan bertindih sepenuhnya.

Kita perlukan kedua-dua bulatan bertindih sebahagian sahaja, bukannya menutup sepenuhnya. Untuk itu, kita boleh menggunakan `offset` bagi menghasilkan kesan anjakan.

## Anjakan

`offset` hanya mengubah kedudukan lukisan sesuatu view, dan tidak mempengaruhi pengiraan susun atur oleh view induk.

Cara penggunaan:

```swift
.offset(x:y:)
```

`x` ialah jumlah anjakan arah mendatar, `y` ialah jumlah anjakan arah menegak.

Nilai positif bermaksud menganjak ke kanan / ke bawah, manakala nilai negatif bermaksud menganjak ke kiri / ke atas.

Gunakan `offset` untuk menjadikan dua bulatan bertindih sebahagian:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Kedudukan bulatan merah dalam susun atur tidak berubah, tetapi kedudukan lukisannya beralih 25 poin ke kiri. Oleh itu, kedua-dua bulatan menghasilkan kesan visual bertindih sebahagian.

## Ketelusan

Dalam SwiftUI, `opacity` digunakan untuk menetapkan tahap ketelusan sesuatu view.

Cara asas:

```swift
.opacity(0.5)
```

Julat parameter bagi `opacity` ialah dari 0.0 hingga 1.0, di mana:

- 0 bermaksud telus sepenuhnya
- 1 bermaksud tidak telus

Kita boleh menggunakan `opacity` untuk menetapkan ketelusan bulatan oren:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Selepas menetapkan `opacity` bulatan oren kepada 0.8, tahap kelegapannya menjadi 80%. Apabila dua bulatan bertindih, kawasan bertindih akan menghasilkan kesan campuran warna.

## Kabur

Dalam SwiftUI, kita boleh menggunakan `blur` untuk menetapkan kesan kabur:

```swift
.blur(radius:10)
```

`radius` menentukan jejari kabur; semakin besar nilainya, semakin jelas kesan kabur.

Kita boleh menambah kesan kabur pada dua bulatan:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Akhirnya, kita boleh melihat dua bulatan yang sangat kabur.

## Ringkasan

Pelajaran ini tertumpu pada modifier visual yang biasa digunakan dalam SwiftUI, dan kita mempelajari cara mengawal warna, kedudukan serta kesan visual view melalui modifier.

Melalui contoh-contoh yang khusus, kita dapat melihat peranan sebenar modifier visual yang berbeza dalam antara muka, serta memahami pengetahuan berkaitan kawasan selamat.

Semua ini ialah modifier yang sangat asas. Kita boleh berlatih dan menggunakannya lebih kerap supaya dalam pembangunan sebenar kita dapat mengawal kesan antara muka dengan lebih jelas.

### Latihan selepas kelas

- Tambahkan kesan ketelusan dan kabur pada satu gambar
- Tetapkan tiga bulatan yang bertindih dengan tahap ketelusan yang berbeza
- Cipta satu gambar latar belakang yang memenuhi skrin dan abaikan kawasan selamat
- Gunakan `offset` untuk melaras kedudukan beberapa view

Tujuan latihan ini bukan untuk menghafal API, tetapi untuk memerhati hubungan antara perubahan visual dan tingkah laku susun atur.
