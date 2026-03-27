# Mulai dari ContentView

## Persiapan sebelum pelajaran

Di pelajaran ini, kita akan mulai dari file `ContentView.swift` untuk mengenal struktur dasar SwiftUI secara sistematis, termasuk:

- komentar
- struktur `View`
- tata letak `VStack` / `HStack` / `ZStack`
- ikon `SF Symbols`
- modifier view
- kode pratinjau `#Preview`

Pertama, temukan proyek Xcode yang sebelumnya sudah dibuat, lalu klik dua kali file `.xcodeproj`.

Di area navigasi `Navigator` sebelah kiri, pilih file `ContentView.swift`.

Catatan: setiap kali proyek dibuka, `Canvas` mungkin menampilkan `"Preview paused"`. Klik tombol refresh untuk memulihkan pratinjau.

![Swift](../../RESOURCE/002_view7.png)

## Mengenal ContentView

Kode `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
```

Meskipun jumlah kodenya sedikit, di dalamnya sudah terdapat struktur inti SwiftUI.

### 1. Komentar

Bagian atas file:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Ini adalah komentar file, yang digunakan untuk mencatat informasi file, termasuk nama file, nama proyek, pembuat, dan waktu pembuatan.

Di Swift, `//` digunakan untuk komentar satu baris:

```swift
// Ini adalah komentar
```

Komentar dapat meningkatkan keterbacaan kode dan membantu developer memahami logika program.

Dalam pengembangan nyata, kode bisa saja sulit dipahami. Jika tidak menulis komentar, kamu mungkin akan mengalami situasi tiga hari kemudian tidak lagi mengerti kode buatanmu sendiri.

Karena itu, secara aktif menambahkan komentar selama menulis kode adalah kebiasaan pengembangan yang baik. Gunakan komentar untuk mencatat logika kode agar memudahkan pemeliharaan di kemudian hari.

**Menonaktifkan kode sementara**

Komentar juga bisa digunakan untuk menonaktifkan kode sementara, sehingga membantu kita menelusuri masalah.

Misalnya:

```
A
B
C
```

`A`, `B`, dan `C` adalah tiga potongan kode. Salah satunya mengandung kesalahan, maka kita bisa memberi komentar sementara untuk menelusurinya.

Pertama, beri komentar pada `A`:

```
// A
B
C
```

Jika setelah `A` dinonaktifkan kode kembali normal, berarti masalah ada di kode `A`.

Jika setelah `A` diberi komentar masalah masih ada, kita bisa lanjut memberi komentar pada `B`, dan seterusnya, sampai menemukan potongan kode yang bermasalah.

Dalam proses pengembangan kita akan menemui banyak masalah, dan sering kali kita menelusurinya dengan cara memberi komentar pada kode. Ini membantu kita menemukan lokasi masalah dan bug.

Di Xcode, kamu bisa memakai shortcut:

```
Command ⌘ + /
```

untuk menambahkan atau menghapus komentar dengan cepat.

### 2. Mengimpor framework SwiftUI

```swift
import SwiftUI
```

Kode ini berarti kita mengimpor framework SwiftUI.

Tipe-tipe seperti `View`, `Text`, `Image`, `VStack`, dan lainnya di SwiftUI semuanya berasal dari framework ini.

Jika tidak mengimpor framework SwiftUI, Xcode akan menampilkan error:

```
Cannot find type 'View' in scope
```

Artinya compiler tidak bisa mengenali tipe `View`.

### 3. Struktur View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Saat pertama kali melihat struktur `View` ini, mungkin terasa asing, karena di dalamnya ada kata kunci seperti `struct`, `View`, `var`, `body`, dan `some`.

Kita belum mempelajari kata-kata kunci itu sekarang. Untuk sementara, cukup pahami bahwa potongan kode ini berarti membuat sebuah view bernama `ContentView`.

Kamu bisa menganggap `View` sebagai sebuah papan gambar, tempat kita bisa menggambar. Alat menggambarnya adalah SwiftUI.

Misalnya:

![Swift](../../RESOURCE/002_view.png)

Gambar di atas menunjukkan tiga halaman, yang sebenarnya adalah tiga `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Ketika kita membuat aplikasi dengan SwiftUI, setiap halaman pada dasarnya adalah sebuah `View`.

### 4. Kode SwiftUI

Di dalam view, terlihat kode SwiftUI berikut:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Potongan kode SwiftUI ini berarti ada sebuah tata letak vertikal yang menampilkan satu ikon dan satu teks.

![Swift](../../RESOURCE/002_view1.png)

#### Tata letak VStack

```swift
VStack { }  // Tata letak vertikal
```

`VStack` berarti kontainer tata letak vertikal. View-view di dalamnya disusun dari atas ke bawah.

![Swift](../../RESOURCE/002_view8.png)

Tiga tata letak yang paling umum di SwiftUI:

- `VStack` —— susunan vertikal
- `HStack` —— susunan horizontal
- `ZStack` —— susunan bertumpuk (`Z-axis`)

```swift
HStack { }  // Susunan horizontal
ZStack { }  // Susunan bertumpuk
```

Ilustrasi susunan masing-masing layout:

![Swift](../../RESOURCE/002_view2.png)

Misalnya menggunakan `HStack` untuk susunan horizontal:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Kita bisa melihat bahwa ikon globe dan teks ditampilkan secara horizontal.

![Swift](../../RESOURCE/002_view3.png)

Jika kita ingin menyusun elemen secara horizontal, gunakan `HStack`. Jika ingin menumpuk elemen, gunakan `ZStack`.

#### Image dan SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Kode ini menampilkan ikon globe. Ikon tersebut berasal dari sistem ikon `SF Symbols` milik Apple.

![Swift](../../RESOURCE/002_view9.png)

Artinya adalah menampilkan ikon globe, dalam ukuran besar, dengan warna aksen.

Selain ikon globe, kita juga bisa menampilkan ikon lain.

Misalnya menampilkan tas ransel:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Bagaimana cara menampilkan ikon lain?**

Kita perlu menggunakan pustaka ikon sistem resmi Apple, yaitu `SF Symbols`.

Buka situs resmi Apple Developer, lalu unduh [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Buka aplikasi `SF Symbols`.

![Swift](../../RESOURCE/002_sf1.png)

Di sebelah kiri terdapat kategori simbol, dan di sebelah kanan ditampilkan ikon-ikon yang sesuai.

Klik kanan ikon dan pilih `"Copy 1 Name"`, nama ini adalah isi string yang digunakan.

Misalnya:

```
"globe"
"backpack"
"heart"
```

Masukkan nama ikon yang disalin tersebut ke dalam `Image(systemName:)`, maka ikon yang berbeda akan ditampilkan.

Catatan: setiap ikon `SF Symbols` memiliki versi sistem minimum yang didukung. Jika versi sistem terlalu rendah, ikon mungkin tidak akan tampil. Periksa informasi kompatibilitasnya di aplikasi `SF Symbols`.

#### Modifier

Di SwiftUI, modifier adalah metode yang digunakan untuk mengubah tampilan atau perilaku sebuah view.

Kamu bisa menganggap modifier seperti pakaian. Jika mengenakan pakaian yang berbeda, tampilan akhirnya juga akan berbeda.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` dan `foregroundStyle` adalah modifier milik view `Image`. Keduanya memodifikasi tampilan `Image` tanpa mengubah isi aslinya.

**1. imageScale**

```swift
.imageScale(.large)
```

Modifier ini dapat mengatur ukuran ikon `SF Symbols`:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Kita bisa mengganti opsi yang berbeda untuk menampilkan ukuran simbol yang berbeda pula.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` digunakan untuk mengatur warna foreground.

`.tint` berarti warna aksen (`accent color`) dari lingkungan saat ini. Secara default di iOS biasanya berwarna biru.

Jika kita ingin mengubah warna foreground menjadi merah:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### View Text

`Text` adalah view teks, digunakan untuk menampilkan string.

```swift
Text("Hello, world!")
```

Misalnya menampilkan nama saya:

```swift
Text("FangJunyu")
```

Catatan: string harus dibungkus dengan tanda kutip ganda `""`.

Kamu bisa mencoba menampilkan nama, nomor telepon, dan konten lainnya.

#### Padding

Di SwiftUI, `padding` digunakan untuk menambahkan ruang kosong antara isi view dan batas view. Ini termasuk kategori inner spacing (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Kode di atas berarti menambahkan margin default sistem pada view `HStack`.

**Apa itu padding?**

`padding` berarti “ruang kosong antara isi view dan batas view itu sendiri”.

Pada gambar berikut, setelah `HStack` berwarna biru diberi `padding`, area birunya akan tampak menyusut ke dalam, seolah “menjadi sedikit lebih kecil”.

![Swift](../../RESOURCE/002_view6.png)

**Margin default**

Modifier `padding()` secara default menggunakan jarak standar yang direkomendasikan sistem.

```swift
.padding()
```

Nilai ini dapat berbeda tergantung platform dan konteks. Misalnya:

- Di iOS biasanya sekitar `16 pt`
- Di macOS atau watchOS, jarak standar sistem bisa berbeda, bisa lebih besar atau lebih kecil, tergantung panduan desain tiap platform

**Margin kustom**

Kita juga bisa menetapkan margin secara spesifik.

1. Mengatur satu arah

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Arti arah:

- `.top`: margin atas
- `.bottom`: margin bawah
- `.leading`: margin sisi depan
- `.trailing`: margin sisi belakang

![Swift](../../RESOURCE/002_view12.png)

Catatan: `leading` dan `trailing` akan menyesuaikan arah bahasa secara otomatis. Misalnya di lingkungan Arab (`RTL`), arahnya akan dibalik secara otomatis.

2. Mengatur beberapa arah sekaligus

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Kita bisa menentukan beberapa arah sekaligus menggunakan array. Cara kerja array akan dijelaskan lebih detail di tutorial berikutnya, untuk sementara cukup kenali bentuk penulisannya.

3. Mengatur arah horizontal atau vertikal

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Setara dengan:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Menghapus padding**

Jika tidak ingin ada margin sama sekali, kita bisa memakai `.padding(0)`:

```swift
.padding(0)
```

Atau langsung menghapus modifier `padding`:

```swift
// .padding()
```

### 6. Kode pratinjau Preview

```swift
#Preview {
    ContentView()
}
```

Potongan kode ini berarti menghasilkan pratinjau `ContentView` di `Canvas`.

Catatan: `#Preview` adalah sintaks baru yang diperkenalkan di Swift 5.9 / Xcode 15. Sebelum itu, yang digunakan adalah struktur `PreviewProvider`.

**Apa yang terjadi jika Preview diberi komentar?**

Jika `Preview` diberi komentar:

```swift
// #Preview {
//    ContentView()
// }
```

Maka `Canvas` tidak lagi memiliki konten yang bisa dirender.

![Swift](../../RESOURCE/002_xcode.png)

Ini menunjukkan bahwa `#Preview` mengontrol tampilan pratinjau di `Canvas`.

Saat kita perlu melihat pratinjau view SwiftUI di Xcode, tambahkan kode `#Preview`. Jika tidak membutuhkan pratinjau, kode `#Preview` bisa diberi komentar atau dihapus.

## Ringkasan

Walaupun file `ContentView.swift` tidak memiliki banyak kode, sebenarnya file ini sudah mencakup banyak konsep inti SwiftUI. Bagi pemula, potongan kode ini mungkin terasa asing, tetapi dengan membedah strukturnya, kita bisa mulai membangun pemahaman awal tentang SwiftUI.

Mari kita tinjau isi pelajaran ini. Pertama, kita mempelajari komentar `//`, yang bisa digunakan untuk menjelaskan logika kode atau menonaktifkan kode sementara.

Lalu kita memahami bahwa file SwiftUI harus mengimpor framework SwiftUI:

```swift
import SwiftUI
```

Jika framework tidak diimpor, compiler tidak akan bisa mengenali tipe seperti `View`.

Setelah itu, kita mengenal struktur dasar view SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Di sini `ContentView` adalah nama view.

Kita juga mempelajari tiga kontainer layout yang umum: `VStack` (susunan vertikal), `HStack` (susunan horizontal), dan `ZStack` (susunan bertumpuk).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Dalam potongan kode ini, ditampilkan sebuah kontainer susunan vertikal yang di dalamnya ada satu ikon dan satu teks.

`Image` dapat menampilkan ikon `SF Symbols`, dan ukuran serta warnanya dapat diatur dengan modifier.

View `Text` digunakan untuk menampilkan isi teks.

`padding` adalah jarak kosong yang menambahkan ruang transparan di sekitar view.

Terakhir, ada view pratinjau `#Preview`, yang menampilkan pratinjau di `Canvas`.

### Latihan setelah pelajaran

Bagi pemula, isi pelajaran ini mungkin terasa agak rumit. Kita bisa memperdalam pemahaman melalui latihan lanjutan:

- Mengubah nama ikon `SF Symbols`
- Mengubah warna foreground ikon menjadi hitam
- Mengganti `VStack` menjadi `HStack`
- Memberi komentar pada `Image` atau `Text`, lalu mengamati perubahan di view pratinjau

### Bonus: pelengkapan kode (Code Completion)

Saat mengetik kode, mungkin kamu sudah memperhatikan bahwa Xcode akan otomatis menampilkan daftar opsi yang tersedia.

Misalnya saat kita mengubah modifier `imageScale`:

```swift
.imageScale(.)
```

Xcode akan menampilkan opsi yang tersedia:

![Swift](../../RESOURCE/002_view10.png)

Ini adalah mekanisme pelengkapan kode (`Code Completion`). Mekanisme ini didasarkan pada inferensi tipe dan saran anggota enum, sehingga dapat meningkatkan efisiensi pengetikan dan mengurangi kesalahan.

Di pelajaran berikutnya, kita akan resmi mengenal enum (`enum`). Untuk sekarang, cukup dipahami secara singkat terlebih dahulu.
