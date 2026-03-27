# Mengenal Xcode

## Apa itu Xcode

Xcode adalah lingkungan pengembangan terintegrasi resmi Apple (`IDE`, `Integrated Development Environment`) yang digunakan untuk mengembangkan aplikasi di platform Apple seperti iOS, macOS, watchOS, dan tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Sepanjang proses pembelajaran ini, kita akan menggunakan Xcode untuk menulis kode dan menjalankan program.

Di pelajaran ini, kita akan belajar cara mengunduh Xcode, membuat aplikasi iOS pertama, dan mengenal struktur antarmuka Xcode secara awal.

## Mengunduh Xcode

Saat ini Xcode memiliki dua cara instalasi:

1、Unduh melalui [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Unduh melalui [situs resmi Apple Developer](https://developer.apple.com/xcode/)

Kedua cara ini sama-sama bisa digunakan untuk mengunduh Xcode. Perbedaannya adalah di situs Apple Developer, selain versi resmi, kamu juga bisa mengunduh versi [Beta](https://developer.apple.com/download/all/?q=Xcode) atau versi lama.

Jika tujuannya hanya untuk belajar pengembangan, disarankan menggunakan versi resmi. Versi Beta terutama digunakan untuk menguji fitur baru dan mungkin tidak stabil.

## Membuat proyek pertama

Setelah membuka Xcode, kamu akan melihat layar awal.

![Swift](../../RESOURCE/001_xcode1.png)

Di sisi kiri terdapat tiga opsi umum:

- `Create New Project` —— membuat proyek baru  
- `Clone Git Repository` —— mengkloning repositori Git  
- `Open Existing Project` —— membuka proyek yang sudah ada

Di sisi kanan ditampilkan proyek Xcode yang baru-baru ini dibuka.

Kita pilih opsi `"Create New Project"`.

### Memilih template proyek

![Swift](../../RESOURCE/001_xcode2.png)

Masuk ke layar pemilihan template proyek. Di sini ditampilkan beberapa platform seperti iOS, macOS, dan lainnya, beserta berbagai jenis template proyek.

Penjelasan template yang umum:
- `App` —— jenis aplikasi paling dasar (disarankan)
- `Document App` —— aplikasi berbasis dokumen
- `Game` —— digunakan untuk pengembangan game
- `Framework` —— modul yang dapat digunakan ulang

Pada tahap awal, kita hanya memilih template `"iOS" - "App"`, karena ini adalah jenis aplikasi antarmuka.

Klik `"Next"`.

### Mengisi informasi proyek

Masuk ke layar pengisian informasi proyek, di sini kita perlu mengisi sesuai jenis setiap kolom.

![Swift](../../RESOURCE/001_xcode3.png)

Arti dari masing-masing kolom:

- `Product Name` —— nama proyek, misalnya: `SwiftSlimTest`
- `Team` —— tim developer. Jika tidak memiliki akun Apple Developer berbayar, bagian ini bisa tidak dipilih
- `Organization Identifier` —— identitas organisasi, biasanya menggunakan format domain terbalik, misalnya:
  - `com.yourname`
  - `com.yourcompany`
  - jika tidak memiliki domain, kamu bisa memakai nama Inggris milikmu sendiri sebagai identitas
- `Bundle Identifier` —— identitas unik aplikasi, yang akan dibuat otomatis berdasarkan `Organization Identifier` dan `Product Name`
- `Interface` —— teknologi antarmuka, pilih `SwiftUI`
- `Language` —— bahasa pengembangan, pilih `Swift`
- `Testing System` —— secara default akan membuat target pengujian (`Unit Tests`), bisa diabaikan pada tahap pemula
- `Storage` —— framework persistensi data lokal, dapat mengintegrasikan SwiftData atau Core Data secara otomatis, bisa diabaikan pada tahap pemula

Setelah selesai mengisi, klik `"Next"`.

### Menyimpan proyek

![Swift](../../RESOURCE/001_xcode4.png)

Pilih folder yang sesuai untuk menyimpan proyek.

Klik tombol `"Create"`, lalu Xcode akan otomatis membuat struktur proyek.

## Struktur proyek Xcode

Setelah proyek Xcode disimpan, di Finder kamu akan melihat folder proyek yang dihasilkan.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` —— folder untuk menyimpan gambar, ikon aplikasi, dan resource lain

- `ContentView.swift` —— file view SwiftUI yang dibuat secara default, nanti kita akan menulis kode antarmuka di sini

- `SwiftSlimTestApp.swift` —— file pintu masuk aplikasi (`App Entry Point`) yang bertugas menjalankan aplikasi, untuk sementara kita belum perlu memahaminya

- `SwiftSlimTest.xcodeproj` —— file proyek Xcode, klik dua kali file ini untuk membuka proyek

## Mengenal antarmuka Xcode

Klik dua kali file `.xcodeproj` untuk membuka proyek, lalu di area `Navigator` sebelah kiri pilih file `ContentView.swift`.

Antarmuka Xcode terutama terdiri dari lima area:

- `Navigator` —— area navigasi, digunakan untuk melihat struktur file dan pencarian
- `Editor` —— area editor, digunakan untuk menulis kode Swift atau SwiftUI
- `Canvas` —— area kanvas, digunakan untuk pratinjau SwiftUI
- `Inspector` —— area pemeriksa properti, digunakan untuk melihat dan mengubah properti file
- `Debug Area` —— area debugging, digunakan untuk melihat output log

![Swift](../../RESOURCE/001_xcode6.png)

Catatan: `Canvas` terutama digunakan untuk pratinjau view SwiftUI. Dari sisi arsitektur resmi Xcode, ini adalah panel pratinjau bantu untuk `Editor` (`Preview Pane`). Hanya ketika file view SwiftUI dibuka, `Canvas` dapat diaktifkan. Jenis file lain tidak akan menampilkan fungsi pratinjau.

Di pelajaran-pelajaran berikutnya, kita akan lebih sering menulis kode Swift dan SwiftUI di area `Editor`.

Saat pertama kali membuka proyek Xcode, `Inspector` dan `Debug Area` mungkin tersembunyi secara default. Kamu bisa menampilkannya dengan tombol di kanan atas dan kanan bawah.

![Swift](../../RESOURCE/001_xcode7.png)

Tips: area `Inspector` terutama digunakan untuk melihat dan mengubah properti file. Dalam pengembangan nyata, area ini biasanya disembunyikan agar ruang editor menjadi lebih luas.

## Ringkasan

Di pelajaran ini, kita telah belajar cara mengunduh Xcode, membuat proyek Xcode pertama, dan memahami tata letak dasar antarmuka Xcode.

Berikut waktu eksplorasi bebas:
- Kamu bisa mencoba membuat dan menghapus file di area `Navigator`.  
- Lihat kode di area `Editor` dan amati strukturnya.
- Lihat tombol-tombol di area `Canvas`, lalu coba perbesar dan perkecil tampilan pratinjau.

Di pelajaran berikutnya, kita akan mulai menulis beberapa kode sederhana dan sekaligus memahami Xcode lebih jauh.  
