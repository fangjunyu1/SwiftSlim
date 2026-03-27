# Simulator dan perangkat fisik

Sampai sejauh ini, kita sudah menyelesaikan pembuatan view dasar. Isi utama pelajaran ini adalah mempelajari cara menjalankan aplikasi di simulator dan perangkat fisik (`Physical Device`).

Saya masih ingat ketika pertama kali menginstal aplikasi ke iPhone, saya sangat senang karena bisa melihat hasil pengembangan saya dengan lebih langsung. Ini adalah umpan balik positif. Ketika kita bisa memakai aplikasi yang kita buat sendiri, rasa tertarik akan mendorong kita untuk belajar lebih banyak secara alami.

Sekarang, buka proyek resume pribadi yang telah diselesaikan di pelajaran sebelumnya, lalu bersiaplah untuk menjalankannya di simulator dan perangkat fisik.

## Simulator

Xcode menyediakan berbagai macam simulator bawaan, mencakup berbagai model iPhone, iPad, dan Apple Watch. Simulator dapat digunakan untuk memverifikasi perbedaan tata letak antarmuka aplikasi pada model atau versi sistem yang berbeda.

### Memilih simulator

Di daftar perangkat pada toolbar bagian atas Xcode, pilih satu simulator, misalnya `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Menjalankan simulator

Lalu klik tombol run di kiri atas.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode akan otomatis membangun proyek dan menjalankan simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Menutup simulator

Jika ingin menutup simulator, klik tombol stop di toolbar Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Kita juga bisa langsung menutup simulator:

![Swift](../../RESOURCE/005_xcode17.png)

Jika simulator ditutup secara langsung, Xcode mungkin akan menampilkan:

```
Thread 1: signal SIGTERM
```

Biasanya ini bukan kesalahan logika program, melainkan karena proses debugging dihentikan dari luar. Umumnya bisa diabaikan dan tidak termasuk kesalahan logika aplikasi.

Dibandingkan dengan pratinjau Xcode, simulator lebih dekat ke lingkungan berjalan yang nyata. Namun, tetap belum sepenuhnya sama dengan perangkat asli. Simulator cocok untuk verifikasi layout dan pengujian adaptasi pada berbagai model perangkat.

## Prioritas lingkungan pengujian

Dalam alur pengembangan yang nyata, urutan pengujian sebaiknya mengikuti prioritas berikut:

perangkat fisik > simulator > pratinjau Xcode

Pratinjau cocok untuk menyesuaikan UI dengan cepat; simulator cocok untuk pengujian struktural; sedangkan verifikasi akhir harus dilakukan di perangkat fisik, terutama untuk operasi yang berkaitan dengan iCloud.

## Perangkat fisik

Pratinjau Xcode dan simulator sama-sama bisa menampilkan hasil yang kurang akurat, sehingga perangkat fisik memiliki arti yang menentukan. Perilaku seperti izin sistem, performa, dan mekanisme notifikasi hanya bisa diverifikasi sepenuhnya di perangkat fisik.

### Mengaktifkan mode developer

Di iPhone:

Pengaturan → Privasi & Keamanan → Mode Pengembang → Aktifkan

![Swift](../../RESOURCE/005_xcode4.png)

Sistem akan memaksa perangkat untuk restart. Jika mode pengembang tidak diaktifkan, aplikasi tidak bisa dijalankan untuk debugging.

### Mengonfigurasi tim developer

Xcode harus dikonfigurasi dengan tim developer. Jika tidak, aplikasi tidak dapat ditandatangani dan diinstal.

Alur konfigurasi:

Nama proyek → TARGETS → Signing & Capabilities → Team

Jika muncul `"Add Account..."`, artinya akun Apple belum ditambahkan.

![Swift](../../RESOURCE/005_xcode5.png)

Klik tombol tambah, lalu login dengan Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Setelah login dengan Apple ID, pilih akun yang sesuai untuk menyelesaikan konfigurasi tim developer.

![Swift](../../RESOURCE/005_xcode7.png)

### Menghubungkan perangkat

Gunakan kabel untuk menghubungkan iPhone dan Mac.

Saat pertama kali terhubung:

- Mac akan menanyakan apakah iPhone boleh dihubungkan ke Mac ini
- iPhone akan menanyakan apakah komputer ini dipercaya

Di iPhone, kamu harus menekan “Trust” dan memasukkan kode kunci layar. Setelah itu, pilih iPhone milikmu di daftar perangkat Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Klik tombol run di kiri atas.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode akan membangun proyek dan menginstal aplikasi ke iPhone.

![Swift](../../RESOURCE/005_view.png)

**Debug nirkabel**

Di iOS 11 dan versi setelahnya, Xcode mendukung debugging nirkabel.

![Swift](../../RESOURCE/005_xcode18.png)

Syaratnya:

1. iPhone dan Mac harus pertama kali dipasangkan menggunakan kabel data
2. iPhone dan Mac berada di jaringan Wi-Fi yang sama
3. Kedua perangkat tetap dalam keadaan tidak terkunci

Setelah proses pairing pertama selesai lewat kabel, berikutnya meskipun kabel dicabut, selama keduanya berada di jaringan yang sama, aplikasi tetap bisa dijalankan langsung.

Hal-hal yang perlu diperhatikan:

- Jika perangkat tidak muncul di daftar perangkat, kamu bisa mencolokkan kembali kabel data untuk menghubungkannya
- Debugging melalui Wi-Fi terkadang tidak stabil. Jika ada masalah koneksi, cukup sambungkan ulang kabel
- Di jaringan kantor atau jaringan yang terisolasi, fitur ini mungkin dibatasi

## Kesalahan umum dan solusi

Saat menggunakan Xcode untuk menghubungkan iPhone dan melakukan debugging, kita mungkin menemui berbagai jenis pesan kesalahan. Di bawah ini adalah beberapa masalah umum dan cara menanganinya, agar lebih cepat menemukan dan menyelesaikan kendala koneksi.

**1. Pairing belum selesai**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Ini berarti pairing debugging antara Xcode dan iPhone belum selesai.

Solusi: pastikan iPhone sudah menekan `"Trust"`. Jika masih error, restart Xcode lalu sambungkan kembali.

**2. Tim developer belum dikonfigurasi**

```
Signing for "SwiftSlimTest" requires a development team.
```

Kemungkinan besar tim developer belum diatur.

Solusi: pilih akun yang sudah login di bagian `Signing & Capabilities`.

**3. Developer Disk Image tidak dapat dipasang**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Biasanya muncul ketika proses instalasi terputus, misalnya kabel tercabut atau dihentikan paksa, sehingga saat pemasangan ulang terjadi pembatasan dan muncullah error.

Solusi: restart iPhone, lalu sambungkan kembali dengan kabel.

**4. Koneksi tunnel debugging gagal**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Kesalahan ini sering terjadi karena gangguan VPN atau proxy jaringan.

Solusi: matikan VPN atau proxy jaringan, lalu coba lagi.

**5. Perangkat belum dibuka kuncinya**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Perangkat sedang dalam keadaan terkunci. Cukup buka kunci iPhone.

**6. Perangkat belum terdaftar**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Ini berarti perangkat tersebut belum ditambahkan ke daftar perangkat di akun developer, sehingga Xcode tidak dapat membuat provisioning profile yang sah untuk menandatangani dan menginstal aplikasi.

Solusi: klik `"Register Device"` agar perangkat didaftarkan secara otomatis.

**7. Versi deployment tidak cocok**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Artinya versi sistem perangkat lebih rendah daripada versi deployment minimum proyek.

Jalur pengaturan:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Sesuaikan versinya agar tidak lebih tinggi dari versi sistem perangkat.

Setelah diubah, bersihkan folder build:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Setelah pembersihan selesai, jalankan ulang proyek.
