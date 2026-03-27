# Mengenali Xcode

## Apakah itu Xcode

Xcode ialah persekitaran pembangunan bersepadu rasmi (IDE, Integrated Development Environment) yang disediakan oleh Apple untuk membangunkan aplikasi pada platform Apple seperti iOS, macOS, watchOS dan tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Sepanjang keseluruhan proses pembelajaran ini, kita akan menggunakan Xcode untuk menulis kod dan menjalankan program.

Dalam pelajaran ini, kita akan belajar cara memuat turun Xcode, mencipta aplikasi iOS pertama, dan mengenali secara awal struktur antara muka Xcode.

## Memuat turun Xcode

Pada masa ini, terdapat dua cara untuk memasang Xcode:

1、Muat turun melalui [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Muat turun melalui [laman web rasmi Apple Developer](https://developer.apple.com/xcode/)

Kedua-dua cara ini boleh digunakan untuk memuat turun Xcode. Perbezaannya ialah laman web rasmi Apple Developer bukan sahaja menyediakan versi rasmi, malah juga versi [Beta](https://developer.apple.com/download/all/?q=Xcode) dan versi sejarah.

Jika tujuan anda hanyalah untuk belajar pembangunan, disarankan menggunakan versi rasmi. Versi Beta terutamanya digunakan untuk menguji ciri baharu, dan mungkin mempunyai keadaan yang tidak stabil.

## Mencipta projek pertama

Selepas membuka Xcode, anda akan melihat skrin permulaan.

![Swift](../../RESOURCE/001_xcode1.png)

Di sebelah kiri terdapat tiga pilihan yang biasa digunakan:

- Create New Project —— cipta projek baharu  
- Clone Git Repository —— klon repositori Git  
- Open Existing Project —— buka projek sedia ada

Di sebelah kanan akan dipaparkan projek Xcode yang baru-baru ini dibuka.

Kita pilih pilihan "Create New Project".

### Memilih templat projek

![Swift](../../RESOURCE/001_xcode2.png)

Masuk ke skrin pemilihan templat projek, di sini akan dipaparkan pelbagai platform (iOS, macOS dan lain-lain) serta pelbagai jenis templat projek.

Penerangan templat yang biasa:
- App —— jenis aplikasi paling asas (disyorkan)
- Document App —— aplikasi berasaskan mod dokumen
- Game —— untuk pembangunan permainan
- Framework —— modul yang boleh diguna semula

Pada peringkat permulaan, kita hanya memilih templat "iOS" - "App", kerana ini ialah jenis aplikasi antara muka.

Klik "Next".

### Mengisi maklumat projek

Masuk ke skrin pengisian maklumat projek, kita perlu mengisi medan mengikut jenisnya.

![Swift](../../RESOURCE/001_xcode3.png)

Maksud setiap medan:

- Product Name —— nama projek, contohnya: SwiftSlimTest
- Team —— pasukan pembangun, jika tiada akaun Apple Developer berbayar, boleh dibiarkan kosong
- Organization Identifier —— pengenal organisasi, biasanya menggunakan format nama domain terbalik, contohnya:
  - com.yourname
  - com.yourcompany
  - jika tiada domain, anda boleh menggunakan nama Inggeris anda sendiri sebagai pengenal
- Bundle Identifier —— pengenal unik aplikasi, ia akan dijana secara automatik berdasarkan Organization Identifier dan Product Name
- Interface —— teknologi antara muka, pilih SwiftUI
- Language —— bahasa pembangunan, pilih Swift
- Testing System —— secara lalai akan mencipta sasaran ujian (Unit Tests), boleh diabaikan pada peringkat awal
- Storage —— rangka kerja persistensi data tempatan, boleh mengintegrasikan SwiftData atau Core Data secara automatik, boleh diabaikan pada peringkat awal

Selepas selesai mengisi, klik "Next".

### Menyimpan projek

![Swift](../../RESOURCE/001_xcode4.png)

Pilih folder yang sesuai untuk menyimpan projek.

Klik butang "Create", dan Xcode akan menjana struktur projek secara automatik.

## Struktur projek Xcode

Selepas projek Xcode disimpan, dalam Finder anda boleh melihat folder projek yang dijana.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— folder untuk menyimpan sumber seperti gambar dan ikon App

- ContentView.swift —— fail SwiftUI view yang dijana secara lalai, dan selepas ini kita akan menulis kod antara muka di sini

- SwiftSlimTestApp.swift —— fail masuk aplikasi (App Entry Point), yang bertanggungjawab melancarkan aplikasi. Buat masa ini kita tidak perlu memahaminya

- SwiftSlimTest.xcodeproj —— fail projek Xcode. Klik dua kali fail ini untuk membuka projek

## Mengenali antara muka Xcode

Klik dua kali fail `.xcodeproj` untuk membuka projek, dan pilih fail `ContentView.swift` di kawasan Navigator sebelah kiri.

Antara muka Xcode terutamanya terdiri daripada lima kawasan:

- Navigator —— kawasan navigasi, digunakan untuk melihat struktur fail dan melakukan carian
- Editor —— kawasan editor, digunakan untuk menulis kod Swift atau SwiftUI
- Canvas —— kawasan kanvas, digunakan untuk pratonton SwiftUI
- Inspector —— kawasan pemeriksaan atribut, digunakan untuk melihat dan mengubah atribut fail
- Debug Area —— kawasan nyahpepijat, untuk melihat output log

![Swift](../../RESOURCE/001_xcode6.png)

Perhatian: Canvas digunakan terutamanya untuk pratonton SwiftUI view. Dari sudut seni bina rasmi Xcode, ia ialah panel pratonton bantuan kepada Editor (Preview Pane). Hanya apabila fail SwiftUI view dibuka, Canvas boleh diaktifkan; fail jenis lain tidak akan memaparkan fungsi pratonton.

Dalam pelajaran seterusnya, kita akan banyak menulis kod Swift dan SwiftUI di kawasan Editor.

Apabila pertama kali membuka projek Xcode, Inspector dan Debug Area mungkin tersembunyi secara lalai. Anda boleh klik butang di penjuru kanan atas dan kanan bawah untuk memaparkannya.

![Swift](../../RESOURCE/001_xcode7.png)

Petua: Kawasan Inspector terutamanya digunakan untuk melihat dan mengubah atribut fail. Dalam pembangunan sebenar, kawasan ini biasanya akan disembunyikan untuk mendapatkan ruang penyuntingan yang lebih besar.

## Ringkasan

Dalam pelajaran ini, kita telah belajar cara memuat turun Xcode, mencipta projek Xcode pertama, serta susun atur asas antara muka Xcode.

Kini tiba masa untuk anda meneroka sendiri:
- Anda boleh cuba mencipta dan memadam fail di kawasan Navigator.  
- Lihat kod di kawasan Editor, dan perhatikan struktur kodnya.
- Lihat butang di kawasan Canvas, dan cuba besarkan atau kecilkan paparan pratonton.

Dalam pelajaran seterusnya, kita akan mula menulis beberapa kod mudah dan membantu kita memahami Xcode dengan lebih lanjut。  
