# Susun atur, imej dan teks

Dalam pelajaran sebelumnya, kita telah mempelajari kod `ContentView` berikut:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Dalam pelajaran ini, kita akan mempelajari mekanisme susun atur lalai SwiftUI, serta cara menggunakan imej dan teks. Berdasarkan pelajaran sebelumnya, kita akan memahami dengan lebih mendalam struktur dan cara paparan sesuatu view. Pengetahuan ini akan menyokong kita dalam membina susun atur antara muka asas.

## Mekanisme susun atur lalai SwiftUI

Apabila mempratonton view `ContentView`, kita akan mendapati bahawa ikon dan teks dipaparkan di tengah, bukannya disusun bermula dari bahagian atas.

![Swift](../../RESOURCE/003_view.png)

Secara lalai, penjajaran bekas `Stack` ialah `.center`, jadi subview biasanya akan kelihatan dipaparkan di tengah.

### Alignment penjajaran

Jelas sekali penjajaran tengah hanyalah salah satu bentuk penjajaran. Jika kita ingin penjajaran ke kiri atau ke kanan, kita perlu menggunakan `alignment` untuk mengawal penjajaran view.

```swift
alignment
```

Dalam SwiftUI, penjajaran biasanya muncul dalam dua situasi:

**1. Parameter alignment bagi bekas Stack**

Contohnya, menjajarkan ikon dan teks ke kiri dalam `ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`alignment` bagi `VStack` mengawal penjajaran pada arah mendatar.

Kaedah penjajaran:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` ialah susunan mendatar, maka `alignment` mengawal penjajaran pada arah menegak:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` ialah susunan bertindih, dan `alignment` boleh mengawal penjajaran arah mendatar atau menegak:

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

Jika `alignment` tidak dinyatakan secara jelas, `VStack`、`HStack` dan `ZStack` semuanya menggunakan `.center` secara lalai.

**2. alignment di dalam frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Apabila saiz yang diberikan oleh `frame` lebih besar daripada saiz sebenar view itu sendiri, `alignment` akan menentukan kedudukan view di dalam `frame`. Cara penggunaan `frame` akan diterangkan lagi kemudian, buat masa ini cukup sekadar memahaminya secara ringkas.

### Spacer dan mekanisme pengagihan ruang

`alignment` membolehkan view disusun secara mendatar atau menegak. Tetapi apabila kita mahu teks dan imej dipaparkan di dua hujung, satu bentuk penjajaran sahaja tidak mencukupi.

Contohnya, jika kita mahu menghasilkan view bahagian atas laman [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), dengan ikon laman NHK di sebelah kiri dan ikon menu direktori di sebelah kanan.

![Swift](../../RESOURCE/003_alignment3.png)

Jika kita hanya menggunakan `alignment`, ikon laman NHK dan ikon direktori akan tetap dipaparkan di satu sisi sahaja. Kita tidak dapat meletakkan kedua-dua ikon di kiri dan kanan. Jadi, kita memerlukan `Spacer` untuk mengagihkan ruang yang tinggal.

`Spacer` ialah satu view fleksibel untuk susun atur, yang boleh mengisi ruang kosong yang tinggal secara automatik.

Cara penggunaan:

```swift
Spacer()
```

Contohnya:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Apabila kita menambah `Spacer` di antara `Image` dan `Text`, `Spacer` akan mengisi ruang yang tinggal dan menolak `Image` serta `Text` ke hujung atas dan bawah masing-masing.

![Swift](../../RESOURCE/003_view1.png)

Jika terdapat beberapa `Spacer`:

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

Ruang yang tinggal akan dibahagikan secara sama rata antara `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Paparan Image dan kawalan saiz

View `Image` digunakan terutamanya untuk memaparkan gambar. Ikon SF Symbols yang dipelajari dalam pelajaran sebelumnya hanyalah salah satu penggunaan `Image`.

Cara penggunaan:

```swift
Image("imageName")
```

Nama di dalam tanda petik bagi `Image` ialah nama gambar, dan tidak perlu menulis sambungan fail.

### Memaparkan gambar

Mula-mula, kita sediakan satu gambar.

![Swift](../../RESOURCE/003_img.jpg)

Dalam Xcode, pilih folder sumber `Assets` dan seret gambar tersebut ke dalam `Assets`.

![Swift](../../RESOURCE/003_img1.png)

Di dalam `ContentView`, gunakan `Image` untuk memaparkan gambar:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Perhatian: `Image` dalam SwiftUI tidak menyokong memainkan animasi GIF（hanya memaparkan bingkai statik）。

### Mengawal saiz gambar

Dalam SwiftUI, `Image` secara lalai dipaparkan pada saiz asal gambar. Jika anda mahu melaraskan saiz paparan gambar, anda perlu terlebih dahulu menggunakan `resizable` supaya kandungan gambar boleh diskalakan, kemudian gunakan `frame` untuk menentukan saiz susun atur.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifier resizable

Modifier `resizable` membenarkan gambar mengambil bahagian dalam penskalaan semasa susun atur, bukannya sentiasa menggunakan saiz asal.

```swift
.resizable()
```

Hanya selepas menambah `resizable()`, `frame` benar-benar boleh menukar saiz paparan gambar.

Jika `resizable` diabaikan:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` hanya akan menyediakan ruang susun atur untuk gambar, tetapi saiz gambar itu sendiri tidak akan berubah.

### Modifier frame

`frame(width:height)` digunakan untuk menentukan lebar dan tinggi sesuatu view.

Cara asas:

```swift
.frame(width: 10,height: 10)
```

Contohnya, tetapkan gambar menjadi segi empat tepat dengan lebar 300 dan tinggi 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Anda juga boleh menetapkan hanya lebar atau hanya tinggi:

```swift
.frame(width: 200)
.frame(height: 100)
```

Gabungan `resizable + frame` boleh mengawal saiz gambar yang dipaparkan dalam antara muka dengan fleksibel, sambil mengekalkan keupayaan untuk diskalakan.

### Nisbah skala: scaledToFit dan scaledToFill

Apabila nisbah lebar dan tinggi yang ditetapkan oleh `frame` tidak sepadan, gambar mungkin akan diregangkan dan berubah bentuk.

Jika kita mahu mengekalkan nisbah gambar sambil menjadikan gambar sesuai dengan ruang susun atur yang tersedia, kita boleh menggunakan `scaledToFit` atau `scaledToFill`.

**scaledToFit**

`scaledToFit` akan mengekalkan nisbah asal lebar-tinggi gambar dan menskalakan gambar supaya muat sepenuhnya dalam ruang yang tersedia, tanpa memotong gambar:

```swift
.scaledToFit()
```

atau

```swift
.aspectRatio(contentMode: .fit)
```

Cara ini sesuai untuk situasi yang memerlukan keseluruhan gambar dipaparkan tanpa berubah bentuk.

Jika semua gambar ditetapkan pada lebar dan tinggi yang sama, sukar dielakkan gambar akan diregangkan.

Contohnya:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Jika nisbah skala tidak ditetapkan, gambar tidak dapat dipaparkan pada nisbah asal.

![Swift](../../RESOURCE/003_img4.png)

Menetapkan `scaledToFit` boleh mengekalkan nisbah asal gambar.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` juga boleh mengekalkan nisbah gambar, tetapi ia akan mengisi keseluruhan ruang yang tersedia. Jika nisbah tidak sepadan, bahagian yang melebihi akan dipotong:

```swift
.scaledToFill()
```

atau

```swift
.aspectRatio(contentMode: .fill)
```

Cara ini sesuai untuk situasi di mana gambar perlu menutupi keseluruhan kawasan, contohnya sebagai gambar latar belakang atau banner. Ia sangat sesuai apabila gambar digunakan sebagai latar belakang.

**Perbezaan antara kedua-duanya**

![Swift](../../RESOURCE/003_img6.png)

## Teks

Dalam SwiftUI, `Text` digunakan untuk memaparkan teks.

Cara asas:

```swift
Text("FangJunyu")
```

Kita telah mempelajari `Text` dalam pelajaran sebelumnya. Dalam pelajaran ini, kita akan belajar lebih lanjut cara mengawal saiz dan ketebalan fon, supaya teks lebih ekspresif dalam view.

### Saiz fon

Gunakan modifier `font` untuk mengawal saiz teks:

```swift
.font(.title)
```

Contohnya:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Saiz fon yang biasa digunakan（dari besar ke kecil）:

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

### Ketebalan fon

Jika anda mahu teks menjadi lebih tebal, anda boleh menggunakan modifier `fontWeight`:

```swift
.fontWeight(.bold)
```

Contohnya:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Ketebalan fon yang biasa digunakan（dari nipis ke tebal）:

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

`font` mengawal saiz fon, dan `fontWeight` mengawal ketebalan fon. Kedua-duanya boleh digunakan bersama untuk memperkayakan ekspresi teks.

## Ringkasan dan latihan

Setakat ini, kita telah mempelajari susun atur lalai SwiftUI, `Spacer`, `Image` dan `Text` serta pengetahuan asas lain. Kandungan ini sudah mencukupi untuk membangunkan beberapa view yang mudah.

Contohnya: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Antara muka Google sangat bersih. Ia mengandungi gambar dan teks. Kita boleh cuba menganalisis struktur antara muka Google dari sudut SwiftUI:

1. Secara keseluruhannya ia terbahagi kepada tiga bahagian: ikon Google, kotak carian dan teks petunjuk. Ia boleh disusun menegak menggunakan `VStack`.
2. Ikon Google ialah satu gambar, maka boleh dipaparkan menggunakan `Image`.
3. Kotak carian mengandungi kotak input dan ikon. Jika kita abaikan kotak input, ikon carian boleh dipaparkan dengan `Image`.
4. Teks petunjuk dipaparkan menggunakan `Text`, susunan mendatar teks boleh menggunakan `HStack`, dan warna teks boleh dikawal dengan `foregroundStyle`.

Dengan berlatih menggunakan pengetahuan ini, kita boleh membina beberapa view yang mudah dan memperdalam pemahaman serta penggunaan terhadap view `Image` dan `Text` serta modifier yang berkaitan.
