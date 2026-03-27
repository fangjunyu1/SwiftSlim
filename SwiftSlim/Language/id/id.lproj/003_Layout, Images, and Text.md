# Tata letak, gambar, dan teks

Di pelajaran sebelumnya, kita mempelajari kode `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Di pelajaran ini, kita akan mempelajari mekanisme tata letak default SwiftUI, serta cara menggunakan gambar dan teks. Dengan dasar dari pelajaran sebelumnya, kita akan semakin memahami struktur dan cara tampilan view. Pengetahuan ini akan mendukung kita dalam membangun tata letak antarmuka dasar.

## Mekanisme tata letak default SwiftUI

Saat meninjau pratinjau `ContentView`, kita akan melihat bahwa ikon dan teks ditampilkan di tengah, bukan disusun mulai dari bagian atas.

![Swift](../../RESOURCE/003_view.png)

Secara default, mode alignment dari kontainer `Stack` adalah `.center`, sehingga child view biasanya tampil dalam posisi tengah.

### Alignment

Jelas bahwa perataan tengah hanyalah salah satu bentuk alignment. Jika kita ingin rata kiri atau rata kanan, kita perlu menggunakan `alignment` untuk mengontrol perataan view.

```swift
alignment
```

Di SwiftUI, alignment biasanya muncul dalam dua skenario:

**1. Parameter alignment pada kontainer Stack**

Misalnya, membuat ikon dan teks di `ContentView` menjadi rata kiri:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`alignment` pada `VStack` mengontrol perataan di arah horizontal.

Pilihan alignment:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` adalah susunan horizontal, jadi `alignment` mengontrol perataan vertikal:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` adalah susunan bertumpuk, sehingga `alignment` dapat mengontrol perataan horizontal maupun vertikal:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Jika `alignment` tidak ditentukan secara eksplisit, `VStack`, `HStack`, dan `ZStack` semuanya menggunakan `.center` secara default.

**2. Alignment di dalam frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Ketika ukuran `frame` lebih besar daripada ukuran view itu sendiri, `alignment` menentukan posisi view di dalam `frame`. Penggunaan `frame` akan dibahas lebih lanjut nanti, di sini cukup dipahami secara singkat terlebih dahulu.

### Spacer dan mekanisme pembagian ruang

`alignment` dapat membuat view tersusun secara horizontal atau vertikal. Namun, ketika kita ingin teks dan gambar tampil di dua sisi, alignment saja tidak cukup.

Misalnya, kita ingin membuat tampilan header seperti di situs [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), dengan ikon situs NHK di kiri dan ikon menu di kanan.

![Swift](../../RESOURCE/003_alignment3.png)

Jika hanya menggunakan `alignment`, ikon NHK dan ikon menu akan tetap berada di satu sisi saja. Keduanya tidak bisa tersebar ke kiri dan kanan, sehingga kita membutuhkan `Spacer` untuk membagikan sisa ruang.

`Spacer` adalah view fleksibel untuk tata letak yang dapat secara otomatis mengisi ruang yang tersisa.

Cara penggunaan:

```swift
Spacer()
```

Misalnya:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Setelah kita menambahkan `Spacer` di antara `Image` dan `Text`, `Spacer` akan mengisi sisa ruang dan mendorong `Image` dan `Text` ke ujung atas dan bawah.

![Swift](../../RESOURCE/003_view1.png)

Jika ada beberapa `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Sisa ruang akan dibagi rata oleh semua `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Menampilkan Image dan mengontrol ukurannya

View `Image` terutama digunakan untuk menampilkan gambar. Ikon `SF Symbols` yang dipelajari di pelajaran sebelumnya hanyalah salah satu penggunaan `Image`.

Cara penggunaan:

```swift
Image("imageName")
```

Isi di dalam tanda kutip ganda adalah nama gambar, tanpa perlu menuliskan ekstensi file.

### Menampilkan gambar

Pertama, kita siapkan sebuah gambar.

![Swift](../../RESOURCE/003_img.jpg)

Di Xcode, pilih folder resource `Assets`, lalu seret gambar ke dalam `Assets`.

![Swift](../../RESOURCE/003_img1.png)

Di `ContentView`, gunakan `Image` untuk menampilkan gambar:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Catatan: `Image` di SwiftUI tidak mendukung pemutaran animasi GIF, hanya dapat menampilkan frame statis.

### Mengontrol ukuran gambar

Di SwiftUI, `Image` secara default ditampilkan dengan ukuran asli gambar. Jika ingin mengubah ukuran tampilan, pertama-tama gunakan `resizable` agar gambar dapat diskalakan, lalu gunakan `frame` untuk menentukan ukuran tata letaknya.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifier resizable

Modifier `resizable` memungkinkan gambar ikut serta dalam proses scaling di layout, dan tidak lagi selalu memakai ukuran aslinya.

```swift
.resizable()
```

Hanya setelah menambahkan `resizable()`, `frame` benar-benar dapat mengubah ukuran tampilan gambar.

Jika `resizable` dihilangkan:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` hanya akan menyediakan ruang layout untuk gambar, tetapi ukuran gambar itu sendiri tidak berubah.

### Modifier frame

`frame(width:height:)` digunakan untuk menentukan lebar dan tinggi view.

Penggunaan dasar:

```swift
.frame(width: 10,height: 10)
```

Misalnya, mengatur gambar menjadi persegi panjang dengan `width` 300 dan `height` 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Kita juga bisa hanya mengatur lebar atau tingginya saja:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinasi `resizable + frame` memungkinkan kita mengontrol ukuran tampilan gambar di antarmuka dengan fleksibel, sekaligus mempertahankan kemampuan untuk diskalakan.

### Rasio skala: scaledToFit dan scaledToFill

Ketika rasio lebar dan tinggi yang kita atur lewat `frame` tidak sesuai, gambar mungkin akan tertarik dan tampak terdistorsi.

Jika kita ingin gambar menyesuaikan ruang yang tersedia sambil tetap mempertahankan proporsinya, kita bisa memakai `scaledToFit` atau `scaledToFill`.

**scaledToFit**

`scaledToFit` mempertahankan rasio asli gambar, lalu menyesuaikannya agar seluruh gambar muat di ruang yang tersedia tanpa terpotong:

```swift
.scaledToFit()
```

atau

```swift
.aspectRatio(contentMode: .fit)
```

Cara ini cocok ketika kita ingin gambar ditampilkan secara utuh tanpa distorsi.

Jika semua gambar diberi ukuran lebar dan tinggi yang sama, sangat mungkin terjadi peregangan gambar.

Misalnya:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Jika rasio skala tidak diatur, gambar tidak bisa tampil dengan proporsi aslinya.

![Swift](../../RESOURCE/003_img4.png)

Menambahkan `scaledToFit` akan membuat gambar mempertahankan rasio aslinya.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` juga mempertahankan proporsi gambar, tetapi akan mengisi seluruh ruang yang tersedia. Jika proporsinya tidak cocok, bagian yang melebihi ruang akan terpotong:

```swift
.scaledToFill()
```

atau

```swift
.aspectRatio(contentMode: .fill)
```

Cara ini cocok ketika gambar harus menutupi seluruh area, misalnya sebagai background atau banner. Sangat cocok jika gambar digunakan sebagai latar belakang.

**Perbedaan keduanya**

![Swift](../../RESOURCE/003_img6.png)

## Teks

Di SwiftUI, `Text` digunakan untuk menampilkan tulisan.

Penggunaan dasar:

```swift
Text("FangJunyu")
```

Kita sudah mempelajari `Text` di pelajaran sebelumnya. Di pelajaran ini, kita akan melanjutkan dengan mengatur ukuran dan ketebalan font agar teks memiliki ekspresi yang lebih kuat di dalam view.

### Ukuran font

Gunakan modifier `font` untuk mengontrol ukuran tulisan:

```swift
.font(.title)
```

Misalnya:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Ukuran font yang umum digunakan dari besar ke kecil:

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Ketebalan font

Jika ingin membuat teks menjadi tebal, kita bisa menggunakan modifier `fontWeight`:

```swift
.fontWeight(.bold)
```

Misalnya:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Ketebalan font yang umum digunakan dari tipis ke tebal:

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` mengontrol ukuran huruf, sedangkan `fontWeight` mengontrol ketebalan huruf. Keduanya bisa digunakan bersama untuk memperkaya tampilan teks.

## Ringkasan dan praktik

Sampai di sini, kita telah mempelajari tata letak default SwiftUI, `Spacer`, `Image`, `Text`, dan konsep-konsep dasar lainnya. Pengetahuan ini sudah cukup untuk mulai membuat beberapa view sederhana.

Misalnya: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Antarmuka Google sangat bersih. Di dalamnya ada gambar dan teks. Kita bisa mencoba menganalisis struktur antarmuka Google dari sudut pandang SwiftUI:

1. Secara keseluruhan terdiri dari tiga bagian: ikon Google, kotak pencarian, dan teks petunjuk. Ini bisa disusun secara vertikal menggunakan `VStack`.
2. Ikon Google adalah sebuah gambar, jadi bisa ditampilkan dengan `Image`.
3. Kotak pencarian berisi kolom input dan ikon. Jika kolom input diabaikan, ikon pencarian dapat ditampilkan dengan `Image`.
4. Teks petunjuk ditampilkan dengan `Text`, susunan horizontal teksnya dapat memakai `HStack`, dan warna font dapat diatur dengan `foregroundStyle`.

Dengan melatih konsep-konsep ini, kita sudah bisa membuat beberapa view sederhana, sekaligus memperdalam pemahaman dan penggunaan `Image`, `Text`, serta modifier-modifiernya.
