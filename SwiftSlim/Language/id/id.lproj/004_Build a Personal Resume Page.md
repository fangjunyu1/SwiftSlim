# Membangun halaman resume pribadi

Di pelajaran ini, kita akan membuat sebuah view resume pribadi sederhana, sekaligus mempelajari pengetahuan berikut:

- cornerRadius
- spacing
- ScrollView

Selama proses pembuatan, kita akan meninjau ulang layout, `Text`, `Image`, dan konsep lainnya, serta mewujudkan pengaturan jarak dan efek scroll pada konten.

## Resume pribadi

Hasil yang ingin dicapai:

![Swift](../../RESOURCE/004_img.png)

**Silakan coba selesaikan sendiri terlebih dahulu, lalu lanjutkan membaca penjelasan di bawah.**

### Membuat proyek

Buat proyek iOS baru, atau lanjutkan memakai proyek sebelumnya.

Kode `ContentView` default:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Sekarang kosongkan kodenya dan mulai menulis isi milikmu sendiri:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Struktur keseluruhan

Dalam pengembangan nyata, biasanya kita akan merancang struktur keseluruhan terlebih dahulu.

Halaman kita berisi:

1. judul
2. informasi pribadi
3. perkenalan pribadi

Tambahkan sebuah `VStack` di lapisan paling luar:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` memastikan view tersusun secara vertikal, sekaligus dapat mengatur susunan dan jarak antar view.

### Judul

Pertama, kita buat `Text` untuk menampilkan judul.

Di sini saya menampilkan judul menggunakan nama Inggris saya sendiri:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Biasanya judul dibuat lebih besar dan tebal, di sini kita menggunakan modifier `font` dan `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Tata letak

Secara default, alignment SwiftUI adalah `center`, sehingga judul sekarang tampil di tengah `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Kita perlu menampilkan judul di bagian atas view. Ini bisa dilakukan dengan `Spacer` untuk menyesuaikan tata letak:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` akan mengambil ruang yang tersisa, lalu mendorong `Text` ke bagian atas kontainer.

![Swift](../../RESOURCE/004_img4.png)

### Ruang kosong

Jika menurutmu bagian teks terlalu dekat dengan atas, kamu bisa memakai `padding` atau `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Ini mengatur `padding` atas `VStack` menjadi 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Kita juga bisa memakai `Spacer`, lalu mengatur tinggi `frame`-nya untuk mendapatkan ruang kosong dengan tinggi tertentu.

Hasil yang dicapai:

![Swift](../../RESOURCE/004_img5.png)

### Gambar

Siapkan sebuah foto diri, lalu masukkan ke folder resource `Assets`.

![Swift](../../RESOURCE/004_img6.png)

Di `ContentView`, gunakan `Image` untuk menampilkan gambar:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Karena ukuran asli gambar cukup besar, kita perlu memakai `frame` untuk mengontrol ukuran tampilannya.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Di sini kita akan menemukan sebuah masalah:

Jika rasio lebar dan tinggi `frame` tidak sama dengan rasio asli gambar, gambar akan terdistorsi.

Misalnya:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Agar gambar tidak terdistorsi, kita perlu menggunakan `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Fungsi `scaledToFit` adalah:

Menskalakan gambar di dalam batas `frame` yang diberikan berdasarkan proporsi asli gambar, dan menampilkan seluruh isi gambar secara utuh.

Ia tidak akan memaksa gambar meregang untuk memenuhi seluruh `frame`, tetapi menjaga rasio lebar dan tingginya tetap sama, lalu menskalakan secara proporsional sampai salah satu sisi tepat menyentuh batas.

Ini berarti:

- Jika lebar `frame` lebih kecil, gambar akan diskalakan berdasarkan lebar.
- Jika tinggi `frame` lebih kecil, gambar akan diskalakan berdasarkan tinggi.
- Gambar selalu mempertahankan proporsi aslinya dan tidak akan berubah bentuk.

Biasanya kita cukup mengatur ukuran di satu arah saja. Misalnya:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Dengan begitu, sistem akan otomatis menghitung tinggi yang sesuai berdasarkan lebar 140, sambil tetap menjaga proporsi gambar.

Jika perlu menjaga proporsi visual tertentu atau menghindari gambar terjepit dalam layout yang lebih kompleks, kita bisa membatasi lebar dan tingginya sekaligus.

### Sudut membulat

Jika ingin gambar tampil dengan sudut membulat, kita bisa menggunakan modifier `cornerRadius`:

```swift
.cornerRadius(10)
```

Misalnya:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Tambahkan `cornerRadius(20)` di bagian akhir modifier `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` berarti memotong batas view dan menerapkan radius sudut sebesar 20.

Setelah sudut dibulatkan, keempat sudut gambar akan menjadi berbentuk lengkung, sehingga tampilannya terlihat lebih lembut dan modern.

Gaya desain seperti ini sangat umum dalam desain antarmuka saat ini. Misalnya, ikon aplikasi iOS juga memakai bentuk persegi panjang dengan sudut membulat, walaupun ikon sistem sebenarnya menggunakan superellipse dengan kurva kontinu, bukan sudut bulat sederhana.

### Informasi pribadi

Sekarang kita mulai membuat area informasi pribadi di sisi kiri gambar. Dari struktur antarmukanya terlihat bahwa informasi pribadi dan gambar tersusun secara horizontal, jadi kita perlu memakai `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Isi informasi pribadi sendiri tersusun secara vertikal.

![Swift](../../RESOURCE/004_img11.png)

Karena itu, lapisan luar memakai `HStack`, informasi pribadi memakai `VStack`, dan isi teks memakai `Text`.

Struktur dasar:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Menebalkan judul field**

Agar nama field dan nilai field dapat dibedakan, kita bisa memakai `fontWeight` pada nama field:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Teks rata kiri**

Secara default `VStack` memiliki alignment tengah. Jika ingin semua teks rata kiri, kita perlu mengatur alignment:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` berarti rata kiri dalam lingkungan bahasa yang membaca dari kiri ke kanan.

![Swift](../../RESOURCE/004_img14.png)

### Jarak

Jika kita ingin ada jarak tetap antara informasi pribadi dan gambar, sebelumnya kita sudah belajar memakai `Spacer` untuk membuat ruang kosong:

```swift
Spacer()
    .frame(width: 10)
```

Selain itu, kita juga bisa menggunakan parameter `spacing` milik `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` berarti jarak antara dua child view adalah `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Apa itu spacing?**

Di `VStack`, `HStack`, dan `ZStack`, `spacing` digunakan untuk mengontrol jarak antar child view.

Misalnya:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Jarak antar child view di dalam `VStack` akan menjadi `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Perlu diperhatikan bahwa `spacing` hanya memengaruhi “child view langsung”, dan tidak memengaruhi layout di dalam kontainer yang bersarang.

**Mengontrol jarak di dalam daftar**

Jika ingin menambah jarak antar field, cara paling langsung adalah memberi `spacing` pada `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Dengan begitu, jarak antar semua child view akan menjadi `10 pt`.

Namun, jika kita mengamati antarmukanya, akan terlihat sebuah masalah:

Di antara kelompok field ada jarak, tetapi antara nama field dan nilai field juga muncul jarak yang sama.

Hal ini terjadi karena `spacing` bekerja pada semua child view langsung di dalam kontainer saat ini.

Dalam struktur ini, setiap `Text` adalah child view langsung dari `VStack` luar, sehingga jaraknya menjadi seragam.

Jika kita ingin ada jarak antar kelompok field, tetapi nama field dan nilainya tetap berdekatan secara default, maka kita bisa menganggap “nama field + nilai field” sebagai satu kesatuan logis, lalu membungkusnya dengan `VStack` lagi:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Dengan begitu, yang memiliki jarak hanyalah `VStack` di lapisan luar, sedangkan `VStack` bagian dalam tetap memakai jarak rapat default. Karena itu, nama field dan nilai field tidak lagi memiliki celah tambahan.

![Swift](../../RESOURCE/004_img18.png)

### Perkenalan pribadi

Selanjutnya, kita membuat area perkenalan pribadi.

Dari struktur antarmukanya terlihat bahwa isi perkenalan terdiri dari beberapa baris teks, dan teksnya tersusun secara vertikal.

![Swift](../../RESOURCE/004_img19.png)

Karena itu, kita bisa memakai `VStack` bersama `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Menambah jarak**

Sekarang bagian informasi pribadi dan perkenalan masih terlihat cukup rapat, sehingga tampilannya belum terlalu indah.

![Swift](../../RESOURCE/004_img20.png)

Karena keduanya berada di dalam kontainer luar yang sama, kita bisa mengatur jarak keseluruhannya di kontainer luar:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Hasilnya:

![Swift](../../RESOURCE/004_img21.png)

**Jarak antar item daftar**

Gunakan `spacing` untuk mengatur jarak antar teks perkenalan:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Menyelesaikan resume pribadi

Sekarang, kerangka dasar resume pribadi kita sudah selesai.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

Saat ini struktur halaman memakai `VStack`. Jika jumlah teks perkenalan masih sedikit, tidak ada masalah. Namun jika ditambah menjadi 20, 30, atau bahkan lebih banyak, tinggi konten akan melebihi layar.

Misalnya:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Saat itu akan muncul dua fenomena:

- Konten di bawah terpotong
- Halaman tidak bisa di-scroll

Ini bukan masalah `VStack`, karena `VStack` hanyalah kontainer layout dan tidak secara otomatis menyediakan kemampuan scrolling.

**Apa itu ScrollView**

`ScrollView` adalah kontainer yang bisa di-scroll, cocok untuk konten dalam jumlah besar yang melebihi ukuran layar, misalnya daftar vertikal atau horizontal.

Struktur dasarnya:

```swift
ScrollView {
    ...
}
```

Jika ingin mewujudkan efek scrolling, kita harus membungkus seluruh isi halaman dengan `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Dengan begitu, seluruh halaman menjadi area yang bisa di-scroll. Saat konten melebihi tinggi layar, halaman akan bisa digulir secara alami.

Secara default, `ScrollView` menampilkan indikator scroll. Jika ingin menyembunyikannya, kita bisa menulis:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Kode lengkap

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
