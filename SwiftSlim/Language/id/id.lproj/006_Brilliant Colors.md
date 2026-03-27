# Warna yang cemerlang

Di pelajaran ini, kita akan mempelajari modifier visual yang umum di SwiftUI, termasuk:

- warna
- warna foreground
- warna background
- offset
- opacity
- blur

Kita juga akan mempelajari `Safe Area` (area aman).

Modifier-modifier ini digunakan untuk mengontrol tampilan view, sehingga antarmuka menjadi lebih jelas dan lebih berlapis.

## Warna

Di SwiftUI, kita bisa mengatur warna teks.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` berarti warna biru. Sebenarnya ini adalah bentuk singkat dari `Color.blue` berkat inferensi tipe.

Warna yang umum antara lain:

```
.black
.green
.yellow
.pink
.gray
...
```

Semua itu adalah properti statis dari `Color`.

![Color](../../RESOURCE/006_color.png)

Kita bisa memahami `Color` sebagai tipe warna, sedangkan `.blue`, `.red`, dan lainnya adalah warna-warna konkret di dalamnya.

### View Color

Di SwiftUI, `Color` juga bisa ditampilkan sebagai sebuah view.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Potongan kode ini akan menghasilkan kotak merah berukuran `100 × 100`.

Kita juga bisa membuat seluruh antarmuka menampilkan suatu warna:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Setelah dijalankan, kita bisa melihat bahwa warna merah belum memenuhi seluruh layar. Di bagian atas dan bawah iPhone masih tampak putih. Di sini muncul konsep `Safe Area`.

## Safe Area

`Safe Area` adalah area yang disediakan sistem untuk mencegah konten tertutup, termasuk:

1. status bar di bagian atas seperti jam dan baterai

2. indikator Home di bagian bawah

3. area notch atau `Dynamic Island`

![Color](../../RESOURCE/006_color3.png)

Secara default, SwiftUI membatasi konten di dalam `Safe Area`, sehingga view tidak memanjang sampai ke tepi layar.

### Mengabaikan Safe Area

Jika ingin warna memenuhi seluruh layar, kita bisa memakai `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Atau menggunakan `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Dengan begitu, view akan memanjang ke seluruh layar.

Perlu diperhatikan bahwa `edgesIgnoringSafeArea` adalah penulisan yang lebih lama. Sejak iOS 14, penggunaan `ignoresSafeArea` lebih direkomendasikan.

## Foreground

### Modifier foregroundStyle

Di pelajaran sebelumnya, kita sudah belajar menggunakan `foregroundStyle` untuk mengatur warna.

Misalnya:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` adalah sistem gaya yang lebih baru, dan mendukung warna, gradien, material, dan lain sebagainya.

![Color](../../RESOURCE/006_color2.png)

### Modifier foregroundColor

`foregroundColor` juga bisa digunakan untuk mengatur warna:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Cara penggunaannya sama seperti `foregroundStyle`.

Di versi Xcode terbaru, Xcode akan memberi petunjuk bahwa `foregroundColor` mungkin akan ditinggalkan pada versi iOS mendatang, sehingga lebih disarankan memakai `foregroundStyle`.

## Background

Jika kita ingin menambahkan warna latar belakang pada view, kita bisa menggunakan `background`:

```swift
background(.red)
```

Misalnya, memberi warna latar belakang pada teks:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Saat memilih teks di aplikasi seperti Word atau Chrome, kita bisa melihat efek background serupa.

![Color](../../RESOURCE/006_color16.png)

Jika ingin memperbesar area background, kita perlu menggabungkannya dengan `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Di sini ada satu aturan penting yang perlu diperhatikan:

Modifier SwiftUI membangun view dari atas ke bawah. Modifier yang ditulis di belakang akan bekerja pada hasil modifier yang ada sebelumnya.

Jadi:

```swift
.padding()
.background()
```

Ini berarti background akan membungkus view yang sudah ditambahkan padding.

Jika urutannya dibalik:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Background tidak akan membesar, karena background tidak membungkus padding yang berada setelahnya.

## Contoh - mur empat sudut

Sekarang, mari kita buat sebuah view sederhana berbentuk mur empat sudut.

![Color](../../RESOURCE/006_color8.png)

Pertama, buat kotak putih berukuran `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Jika ingin mengubahnya menjadi lingkaran, kita bisa memakai `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Ketika radius sudut sama dengan setengah lebar dan tinggi, bentuknya akan menjadi lingkaran.

Sekarang tambahkan background biru:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

`padding` yang baru ditambahkan akan memperbesar area luar, dan `background` akan menggambar warna biru di area luar tersebut.

Sekarang efek mur empat sudut pun selesai dibuat.

### Cara berpikir lain

Selain memakai warna latar untuk membuat efek mur empat sudut, kita juga bisa memakai `ZStack`.

Sebelumnya kita sudah belajar bahwa `ZStack` bisa membuat susunan bertumpuk. Mur empat sudut juga bisa dipahami sebagai lingkaran dan persegi panjang yang ditumpuk bersama.

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

`ZStack` akan menumpuk view sesuai urutan, dan view yang ditambahkan terakhir akan tampil di lapisan atas.

## Contoh - dua lingkaran yang saling tumpang tindih

Banyak ikon dibentuk dari tumpukan bentuk sederhana, misalnya dua lingkaran yang saling tumpang tindih.

![Color](../../RESOURCE/006_color14.png)

Pertama, buat dua lingkaran:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Karena kita ingin kedua lingkaran ditampilkan secara bertumpuk, gunakan layout `ZStack`:

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

Pada saat ini, kedua lingkaran yang ukurannya sama akan saling menumpuk sepenuhnya.

Kita sebenarnya ingin kedua lingkaran itu hanya tumpang tindih sebagian, bukan sepenuhnya saling menutupi. Untuk itu, kita bisa memakai `offset` agar terjadi pergeseran.

## Offset

`offset` hanya mengubah posisi gambar saat dirender, dan tidak memengaruhi perhitungan layout di parent view.

Cara penggunaan:

```swift
.offset(x:y:)
```

`x` adalah jumlah pergeseran horizontal, sedangkan `y` adalah pergeseran vertikal.

Nilai positif berarti bergeser ke kanan atau ke bawah, sedangkan nilai negatif berarti bergeser ke kiri atau ke atas.

Gunakan `offset` untuk membuat kedua lingkaran saling tumpang tindih sebagian:

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

Posisi lingkaran merah dalam layout tidak berubah, tetapi posisi gambar yang dirender bergeser 25 poin ke kiri. Karena itu, kedua lingkaran menghasilkan efek tumpang tindih sebagian.

## Opacity

Di SwiftUI, `opacity` digunakan untuk mengatur tingkat transparansi sebuah view.

Penggunaan dasar:

```swift
.opacity(0.5)
```

Parameter `opacity` berada dalam rentang `0.0` sampai `1.0`, di mana:

- `0` berarti sepenuhnya transparan
- `1` berarti tidak transparan

Kita bisa menggunakan `opacity` untuk mengatur transparansi lingkaran oranye:

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

Setelah `opacity` lingkaran oranye diatur menjadi `0.8`, tingkat opasitasnya menjadi 80%. Ketika kedua lingkaran bertumpang tindih, area yang bertumpukan akan menghasilkan efek pencampuran warna.

## Blur

Di SwiftUI, kita bisa menggunakan `blur` untuk memberikan efek buram:

```swift
.blur(radius:10)
```

`radius` menentukan radius blur. Semakin besar nilainya, semakin kuat efek buramnya.

Kita bisa menambahkan efek blur ke dua lingkaran tersebut:

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

Pada akhirnya, kita akan melihat dua lingkaran yang sangat buram.

## Ringkasan

Pelajaran ini berfokus pada modifier visual yang umum di SwiftUI, dan mempelajari cara mengontrol warna, posisi, serta efek visual view melalui modifier.

Melalui contoh-contoh konkret, kita dapat melihat peran nyata masing-masing modifier visual di dalam antarmuka, sekaligus memahami konsep area aman (`Safe Area`).

Semua ini adalah modifier yang sangat dasar. Kita bisa lebih banyak berlatih dan menggunakannya, karena ini akan membantu kita mengontrol tampilan antarmuka dengan lebih jelas dalam pengembangan nyata.

### Latihan setelah pelajaran

- Tambahkan efek transparansi dan blur ke sebuah gambar
- Buat tiga lingkaran bertumpuk dengan tingkat opacity yang berbeda
- Buat gambar latar belakang yang memenuhi seluruh layar dan abaikan `Safe Area`
- Gunakan `offset` untuk menyesuaikan posisi beberapa view

Tujuan latihan bukanlah menghafal API, melainkan mengamati hubungan antara perubahan visual dan perilaku layout.
