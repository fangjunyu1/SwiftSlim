# Simulator dan peranti fizikal

Setakat ini, kita telah menyiapkan pembinaan view asas. Kandungan utama pelajaran ini ialah mempelajari cara menjalankan App pada simulator dan peranti fizikal（Physical Device）。

Saya masih ingat ketika kali pertama memasang App ke iPhone, saya sangat gembira kerana dapat melihat hasil pembangunan saya dengan lebih intuitif. Ini ialah satu maklum balas positif. Apabila kita dapat menggunakan App yang kita bangunkan sendiri, minat akan mendorong kita untuk belajar lebih banyak perkara secara sukarela.

Sekarang, sila buka projek resume peribadi yang telah disiapkan dalam pelajaran sebelumnya, dan bersedia untuk menjalankannya pada simulator serta peranti fizikal.

## Simulator

Xcode mempunyai pelbagai simulator terbina dalam, meliputi pelbagai model iPhone、iPad serta Apple Watch. Simulator boleh digunakan untuk mengesahkan perbezaan susun atur App pada model atau versi yang berbeza.

### Memilih simulator

Dalam senarai peranti pada bar alat di bahagian atas Xcode, pilih satu simulator（contohnya iPhone 16）。

![Swift](../../RESOURCE/005_xcode.png)

### Menjalankan simulator

Kemudian klik butang jalankan di sudut kiri atas.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode akan membina projek secara automatik dan melancarkan simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Menutup simulator

Jika anda perlu menutup simulator, klik butang berhenti pada bar alat Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Anda juga boleh terus menutup simulator:

![Swift](../../RESOURCE/005_xcode17.png)

Jika simulator ditutup secara terus, Xcode mungkin akan memaparkan:

```
Thread 1: signal SIGTERM
```

Ini biasanya bukan ralat logik program, sebaliknya berlaku kerana proses debug ditamatkan dari luar. Biasanya ini boleh diabaikan dan tidak dianggap sebagai ralat logik aplikasi.

Berbanding pratonton Xcode, simulator lebih hampir kepada persekitaran operasi sebenar. Namun ia masih bukan persekitaran peranti yang lengkap. Ia sesuai untuk pengesahan susun atur dan ujian penyesuaian untuk pelbagai model.

## Tentang keutamaan persekitaran ujian

Dalam aliran pembangunan sebenar, urutan ujian yang sepatutnya diikuti ialah:

Peranti fizikal > Simulator > pratonton Xcode

Pratonton sesuai untuk melaras UI dengan cepat; simulator sesuai untuk ujian struktur; dan pengesahan akhir mesti dilakukan pada peranti fizikal, terutamanya untuk operasi berkaitan iCloud.

## Peranti fizikal

Pratonton Xcode dan simulator kedua-duanya mungkin mempunyai paparan yang kurang tepat, maka peranti fizikal mempunyai kepentingan yang menentukan. Tingkah laku seperti keizinan sistem, prestasi dan mekanisme notifikasi hanya boleh disahkan sepenuhnya pada peranti fizikal.

### Menghidupkan mod pembangun

Dalam iPhone:

Tetapan → Privasi & Keselamatan → Mod Pembangun → Hidupkan

![Swift](../../RESOURCE/005_xcode4.png)

Sistem akan memaksa peranti untuk dimulakan semula. Jika mod pembangun tidak dihidupkan, proses debug dan run tidak akan dapat dilakukan.

### Mengkonfigurasi pasukan pembangun

Xcode mesti dikonfigurasikan dengan pasukan pembangun, jika tidak aplikasi tidak boleh ditandatangani dan dipasang.

Aliran konfigurasi:

Nama projek → TARGETS → Signing & Capabilities → Team

Jika terpapar "Add Account...", ini bermakna akaun Apple belum ditambahkan.

![Swift](../../RESOURCE/005_xcode5.png)

Klik butang tambah dan log masuk dengan Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Selepas log masuk Apple ID, pilih akaun yang sepadan untuk menyiapkan konfigurasi pasukan pembangun.

![Swift](../../RESOURCE/005_xcode7.png)

### Menyambungkan peranti

Gunakan kabel sambungan untuk menyambungkan iPhone dan Mac.

Ketika sambungan kali pertama:

- Mac akan bertanya sama ada mahu menyambungkan iPhone ke Mac ini
- iPhone akan bertanya sama ada mahu mempercayai komputer ini

Anda mesti klik “Trust” pada iPhone dan memasukkan kata laluan skrin kunci. Selepas itu, pilih iPhone anda dalam senarai peranti Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Klik butang jalankan di sudut kiri atas.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode akan membina dan memasang App ke dalam iPhone.

![Swift](../../RESOURCE/005_view.png)

**Debug tanpa wayar**

Dalam iOS 11 dan versi yang lebih baharu, Xcode menyokong debug tanpa wayar.

![Swift](../../RESOURCE/005_xcode18.png)

Syarat awal:

1. Kali pertama iPhone dan Mac mesti dipasangkan menggunakan kabel data
2. iPhone dan Mac mesti berada dalam rangkaian Wi-Fi yang sama
3. Kedua-dua peranti mesti berada dalam keadaan dibuka kunci

Selepas pemasangan pertama menggunakan kabel data selesai, walaupun kabel dicabut selepas itu, App masih boleh dijalankan secara terus selagi kedua-duanya berada dalam rangkaian yang sama.

Perkara yang perlu diperhatikan:

- Jika peranti tidak muncul dalam senarai peranti, anda boleh memasukkan semula kabel data untuk menyambungkannya
- Debug Wi-Fi kadangkala tidak stabil, jika berlaku masalah sambungan, sambungkan semula kabel sahaja
- Dalam rangkaian syarikat atau persekitaran rangkaian terasing, ia mungkin dihadkan

## Ralat lazim dan penyelesaiannya

Apabila menggunakan Xcode untuk menyambung dan debug iPhone, anda mungkin akan menemui pelbagai jenis mesej ralat. Di bawah disenaraikan beberapa masalah lazim dan cara menanganinya, supaya anda boleh mengenal pasti dan menyelesaikan masalah sambungan dengan lebih cepat.

**1. Pemasangan pasangan belum selesai**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Ini bermaksud pemasangan pasangan debug antara Xcode dan iPhone masih belum selesai.

Penyelesaian: pastikan anda telah menekan “Trust” pada iPhone. Jika ralat masih berlaku, mulakan semula Xcode dan sambung semula.

**2. Pasukan pembangun belum dikonfigurasi**

```
Signing for "SwiftSlimTest" requires a development team.
```

Ini mungkin kerana pasukan pembangun belum dikonfigurasikan.

Penyelesaian: pilih akaun yang telah log masuk di bahagian Signing & Capabilities.

**3. Developer Disk Image tidak dapat dipasang**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Ini biasanya muncul apabila proses pemasangan terganggu（contohnya kabel dicabut atau proses dihentikan secara paksa）, lalu menyebabkan sekatan semasa percubaan pemasangan semula dan menghasilkan ralat.

Penyelesaian: mulakan semula iPhone, kemudian sambungkan semula kabel.

**4. Sambungan terowong debug gagal**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ralat ini biasanya berlaku apabila VPN atau proksi rangkaian mengganggu sambungan.

Penyelesaian: tutup VPN atau proksi rangkaian, kemudian cuba semula.

**5. Peranti belum dibuka kunci**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Peranti berada dalam keadaan skrin terkunci. Buka kunci iPhone untuk menyelesaikannya.

**6. Peranti belum didaftarkan**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Ini bermaksud peranti tersebut belum ditambahkan ke senarai peranti dalam akaun pembangun, maka Xcode tidak dapat menjana provisioning profile yang sah untuk menandatangani dan memasang app.

Penyelesaian: klik "Register Device" untuk mendaftarkannya secara automatik.

**7. Versi deployment tidak sepadan**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Ini bermaksud versi sistem pada peranti lebih rendah daripada versi deployment minimum projek.

Laluan untuk mengubahnya:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Laraskan versinya supaya tidak lebih tinggi daripada versi sistem peranti.

Selepas itu, bersihkan folder binaan:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Selepas pembersihan selesai, jalankan semula。
