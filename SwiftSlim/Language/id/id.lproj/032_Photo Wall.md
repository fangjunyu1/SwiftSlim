# Dinding Foto

Pada pelajaran ini, kita akan membuat sebuah halaman dinding foto.

![view](../../../Resource/032_view13.png)

Dalam contoh ini, kita akan meninjau kembali pengetahuan tentang `extension`, `self`, dan instance, sekaligus mempelajari grafik `Shape` yang umum digunakan di SwiftUI.

Dengan pengetahuan ini, kita dapat memotong gambar biasa menjadi berbagai gaya seperti lingkaran, persegi panjang bersudut membulat, bentuk kapsul, dan elips, serta menambahkan efek bingkai pada foto.

Pelajaran ini akan menggunakan beberapa konsep baru: `Shape`, `clipShape`, `strokeBorder`, dan `overlay`.

Di antaranya, `clipShape` digunakan untuk memotong bentuk view, `strokeBorder` digunakan untuk menggambar bingkai bentuk, dan `overlay` digunakan untuk menumpuk view baru di atas view.

## Materi Gambar

Sebelum mulai, kita perlu menyiapkan beberapa gambar.

Kamu dapat menggunakan fotomu sendiri, atau menggunakan gambar contoh yang disediakan dalam pelajaran ini.

Contoh foto dalam pelajaran ini berasal dari situs [Pixabay](https://pixabay.com/):

[Lanskap](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Rubah](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Bangunan](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Bunga](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Angsa](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Setelah gambar diunduh, tambahkan semuanya ke folder resource `Assets`, lalu beri nama secara berurutan sebagai `1`, `2`, `3`, `4`, dan `5`.

![assets](../../../Resource/032_view17.png)

Dengan demikian, kita dapat menampilkan gambar di SwiftUI menggunakan cara seperti `Image("1")` dan `Image("2")`.

## Menampilkan Foto

Pertama, kita menampilkan 5 foto di dalam `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hasil tampilan:

![view](../../../Resource/032_view.png)

Dalam potongan kode ini, kita menggunakan `ScrollView` untuk membuat daftar foto dapat digulir, dan menggunakan `VStack` agar beberapa gambar tersusun dari atas ke bawah.

Setiap gambar diatur melalui `.resizable()`, `.scaledToFit()`, dan `.frame(width: 300)` untuk menentukan efek tampilan gambar, sehingga gambar dapat diskalakan, tetap ditampilkan secara utuh sesuai rasio, dan dibatasi lebarnya.

`.padding(.vertical, 100)` pada `VStack` digunakan untuk menambah jarak atas dan bawah, agar foto pertama dan foto terakhir tidak terlalu menempel pada tepi layar.

Terakhir, `.ignoresSafeArea()` berarti membuat scroll view mengabaikan safe area, sehingga saat foto digulir, tampilannya dapat memanjang hingga bagian atas dan bawah layar, dan halaman terlihat lebih utuh.

Namun, saat ini 5 gambar semuanya menggunakan modifier yang sama:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Ketika kita melihat kode yang berulang, kita dapat mempertimbangkan untuk menggunakan `extension` guna merapikannya.

## Menggunakan extension untuk Merapikan Gaya Gambar

Kita dapat memperluas `Image` dengan sebuah method khusus untuk dinding foto:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Di sini, kita memperluas tipe `Image` dengan sebuah method `photoGalleryStyle`.

Di dalam method ini terdapat `.resizable()`, `.scaledToFit()`, dan `.frame(width: 300)` yang sebelumnya digunakan berulang. Dengan kata lain, method ini menggabungkan kode untuk penskalaan gambar, tampilan sesuai rasio, dan pengaturan lebar.

Setelah menggunakan extension ini, kode gambar yang semula:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

dapat disederhanakan menjadi:

```swift
Image("1")
    .photoGalleryStyle()
```

Dengan begitu, setiap gambar hanya perlu memanggil `.photoGalleryStyle()` untuk menerapkan gaya dinding foto yang sama. Kode menjadi lebih ringkas, dan perubahan seragam di kemudian hari juga lebih mudah dilakukan.

## Memahami self

Di dalam method extension, kita menulis `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

`self` di sini berarti instance gambar saat ini yang memanggil method ini.

Contohnya:

```swift
Image("1")
    .photoGalleryStyle()
```

Dalam potongan kode ini, `photoGalleryStyle()` dipanggil oleh `Image("1")`, sehingga `self` di dalam method berarti gambar `Image("1")` tersebut.

Secara sederhana, dapat dipahami sebagai: siapa yang memanggil method ini, maka `self` mewakili siapa itu.

Perlu diperhatikan bahwa modifier SwiftUI akan terus mengembalikan hasil view baru. Karena itu, `photoGalleryStyle()` mengembalikan view yang sudah dimodifikasi, bukan sekadar mengembalikan `Image` asli itu sendiri.

## Bentuk Foto

Sekarang, foto sudah dapat ditampilkan dengan normal. Namun, foto-foto ini secara default berbentuk persegi panjang, sehingga terlihat cukup biasa.

Jika hanya ingin membuat foto memiliki sudut membulat, kita dapat langsung menggunakan `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Hasil tampilan:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` berarti menambahkan sudut membulat sebesar `20 pt` pada gambar. Untuk gambar bersudut membulat biasa, cara penulisan ini sudah cukup.

Namun, `.cornerRadius()` hanya dapat menangani efek sudut membulat, sehingga cocok untuk membuat gambar bersudut membulat biasa. Jika kita ingin mengubah foto menjadi lebih banyak bentuk berbeda, modifier ini saja tidak cukup.

Pada saat ini, kita perlu menggunakan `Shape` di SwiftUI. `Shape` dapat mewakili berbagai bentuk, lalu jika dikombinasikan dengan `clipShape`, gambar dapat dipotong menjadi bentuk yang sesuai.

## Mengenal Shape

Di SwiftUI, `Shape` berarti bentuk grafis. Sama seperti `View`, `Shape` juga merupakan tipe yang sangat umum digunakan di SwiftUI.

`Shape` yang umum meliputi lingkaran, persegi panjang, persegi panjang bersudut membulat, bentuk kapsul, dan elips. Agar tampilan berbagai bentuk lebih mudah diamati, contoh berikut akan memberikan warna dan ukuran yang berbeda untuk setiap bentuk.

Dalam contoh-contoh ini, `.fill()` digunakan untuk mengisi bentuk dengan warna, dan `.frame()` digunakan untuk mengatur ukuran tampilan bentuk. Warna hanya digunakan untuk membedakan berbagai bentuk, bukan warna tetap dari bentuk itu sendiri.

### Circle Lingkaran

`Circle` berarti lingkaran. Bentuk ini sering digunakan untuk avatar, tombol lingkaran, gambar lingkaran, dan efek antarmuka lainnya.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle Persegi Panjang

`Rectangle` berarti persegi panjang. Ini adalah salah satu bentuk paling dasar, dan juga dapat digunakan untuk membuat latar belakang, area pemisah, atau bingkai biasa.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle Persegi Panjang Bersudut Membulat

`RoundedRectangle` berarti persegi panjang bersudut membulat. `cornerRadius` digunakan untuk mengatur besar sudut membulat.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule Bentuk Kapsul

`Capsule` berarti bentuk kapsul. Kedua ujungnya berbentuk lengkungan, dan sering digunakan untuk tombol kapsul, latar belakang label, dan efek antarmuka lainnya.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse Elips

`Ellipse` berarti elips. Bentuk ini mirip dengan `Circle`, tetapi ketika lebar dan tingginya tidak sama, bentuk yang ditampilkan adalah elips.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Melalui contoh-contoh ini, dapat dilihat bahwa `Shape` sendiri dapat langsung ditampilkan sebagai bentuk grafis. Berikutnya, kita akan menggunakan `Shape` bersama `clipShape` untuk memotong foto, sehingga foto ditampilkan dalam berbagai bentuk.

## Menggunakan clipShape untuk Memotong Foto

Sekarang, kita dapat menggunakan `clipShape` untuk memotong foto menjadi berbagai bentuk.

Misalnya, memotong foto pertama menjadi lingkaran:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Potongan kode ini berarti: pertama menampilkan sebuah gambar, lalu menggunakan `Circle()` untuk memotongnya menjadi lingkaran.

![view](../../../Resource/032_view2.png)

Penulisan dasar `clipShape` adalah:

```swift
.clipShape(bentuk)
```

Tambahkan `.clipShape(...)` setelah view, lalu isi tanda kurung dengan bentuk yang ingin digunakan untuk memotong.

Contohnya:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Sekarang, kita memotong 5 foto menjadi bentuk yang berbeda:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hasil tampilan:

![view](../../../Resource/032_view8.png)

Di antaranya, efek setelah dipotong dengan `Rectangle()` hampir sama dengan foto persegi panjang biasa, sehingga perubahan visualnya tidak terlalu jelas. Ini terutama digunakan sebagai perbandingan dengan bentuk lain.

Sekarang, foto tidak lagi hanya berupa persegi panjang biasa, melainkan sudah memiliki bentuk yang berbeda-beda.

## Menambahkan Bingkai Foto

Jika kita ingin menambahkan bingkai pada foto berbentuk lingkaran, mungkin kita akan terpikir untuk menggunakan `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Namun, hasil yang biasanya diperoleh bukan bingkai lingkaran, melainkan bingkai persegi panjang.

![view](../../../Resource/032_view9.png)

Ini karena `border` menambahkan bingkai berdasarkan area persegi panjang view, bukan berdasarkan bentuk setelah dipotong oleh `clipShape`.

Jadi, jika kita ingin membuat bingkai lingkaran, kita tidak dapat langsung menggunakan `border`.

## Menggunakan strokeBorder untuk Menggambar Bingkai Bentuk

Di SwiftUI, `strokeBorder` dapat menggambar bingkai bagian dalam untuk `Shape` umum ini.

Misalnya, menggambar sebuah bingkai lingkaran:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Potongan kode ini berarti: menggambar bingkai berwarna cokelat untuk `Circle`, dengan lebar bingkai `10 pt`.

![view](../../../Resource/032_view12.png)

Perlu diperhatikan bahwa `strokeBorder` tidak secara langsung menambahkan bingkai pada foto, melainkan menggambar bingkai untuk bentuk `Circle()` ini.

Dengan kata lain, hasil dari kode ini hanyalah sebuah bingkai lingkaran mandiri, dan belum memiliki hubungan dengan foto.

Jika ingin membuat bingkai lingkaran ini muncul di atas foto, kita perlu terus menggunakan `overlay` untuk menumpuk bingkai tersebut di atas foto.

## Menggunakan overlay untuk Menumpuk Bingkai

`overlay` adalah modifier view yang dapat menumpuk view baru di atas view saat ini.

Struktur dasarnya dapat dipahami sebagai:

```swift
View saat ini
    .overlay {
        View yang ditumpuk
    }
```

Dalam contoh ini, view saat ini adalah foto yang sudah dipotong menjadi lingkaran:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

View baru yang ingin kita tumpuk di atasnya adalah sebuah bingkai lingkaran:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Jadi, foto dan bingkai dapat digabungkan seperti ini:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Di sini, `overlay` berarti menumpuk sebuah view baru di atas view saat ini.

Di dalam `overlay`, bingkai akan mengikuti area tampilan foto saat ini untuk ditumpuk, sehingga kita tidak perlu mengatur `frame` secara terpisah. Selama bentuk bingkai sama dengan bentuk pemotongan, bingkai dapat menempel pada foto.

![view](../../../Resource/032_view10.png)

Hasil akhirnya adalah, sebuah bingkai lingkaran menutupi bagian atas foto berbentuk lingkaran.

Dibandingkan dengan `ZStack`, `overlay` lebih cocok untuk skenario seperti “menambahkan dekorasi pada view saat ini”. Foto adalah subjek utama, sedangkan bingkai hanya efek tambahan, sehingga penggunaan `overlay` membuat maksud kode lebih jelas.

## Menyelesaikan Dinding Foto

Sekarang, kita menambahkan bentuk dan bingkai yang sesuai untuk setiap foto:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Hasil tampilan:

![view](../../../Resource/032_view13.png)

Dengan demikian, sebuah halaman dinding foto dasar telah selesai.

Di halaman ini, kita menggunakan `ScrollView` untuk membuat tampilan dapat digulir, menggunakan `Image` untuk menampilkan foto, menggunakan `clipShape` untuk memotong bentuk foto, serta menambahkan bingkai melalui `overlay` dan `strokeBorder`.

## Kode Lengkap

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Ringkasan

Pada pelajaran ini, kita telah menyelesaikan sebuah halaman dinding foto.

![view](../../../Resource/032_view13.png)

Dalam contoh ini, kita terlebih dahulu menggunakan `Image` untuk menampilkan foto, lalu memperluas `Image` melalui `extension` dengan sebuah method `photoGalleryStyle`, yang digunakan untuk merapikan kode gaya gambar yang berulang.

Setelah itu, kita mempelajari `Shape` yang umum digunakan di SwiftUI, seperti `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule`, dan `Ellipse`. Bentuk-bentuk ini tidak hanya dapat ditampilkan secara langsung, tetapi juga dapat digunakan bersama `clipShape` untuk memotong view.

Contohnya:

```swift
.clipShape(Circle())
```

berarti memotong view menjadi bentuk lingkaran.

Terakhir, kita menggunakan `overlay` dan `strokeBorder` untuk menambahkan bingkai dengan bentuk yang sesuai pada foto. Perlu diperhatikan bahwa `border` biasanya menggambar bingkai berdasarkan area persegi panjang view. Jika ingin membuat bingkai mengikuti lingkaran, bentuk kapsul, atau elips, lebih cocok menggunakan `Shape` yang sama untuk ditumpuk.

Melalui pelajaran ini, kita tidak hanya menyelesaikan efek dinding foto, tetapi juga memahami cara kombinasi umum `Shape`, `clipShape`, `strokeBorder`, dan `overlay` digunakan dalam antarmuka.

## Latihan Setelah Pelajaran

### 1、Menambahkan Latar Belakang Dinding Foto

Tambahkan sebuah gambar latar belakang layar penuh pada halaman dinding foto.

Syarat: gambar latar belakang dapat memenuhi seluruh layar dan mengabaikan safe area.

### 2、Bingkai Gradien

Ubah bingkai satu warna yang ada menjadi bingkai gradien linear.

Kamu dapat mencoba menggunakan `LinearGradient` untuk membuat efek bingkai yang lebih kaya.

### 3、Bingkai Foto Simulasi

Cari beberapa gaya bingkai foto asli di internet, lalu coba gunakan `overlay` untuk menumpuk gambar bingkai, agar foto terlihat lebih mendekati efek bingkai foto nyata.

Hasil tampilan latihan:

![button](../../../Resource/032_view15.jpeg)

### 4、Membuat Bingkai Tombol Bersudut Membulat

Dalam pengembangan nyata, tombol sering menggunakan bingkai persegi panjang bersudut membulat.

Cobalah membuat sebuah tombol bersudut membulat, lalu gunakan `RoundedRectangle` dan `strokeBorder` untuk menambahkan bingkai bersudut membulat pada tombol.

Hasil tampilan latihan:

![button](../../../Resource/032_view14.png)

### Pertanyaan Pemikiran

Jika tidak ingin menggunakan bingkai satu warna, dan juga tidak ingin menggunakan bingkai gradien, tetapi ingin membuat bingkai menampilkan pola tertentu, bagaimana cara mewujudkannya?

Kamu dapat mencoba mencari referensi dan memahami penggunaan terkait seperti `overlay`, `mask`, atau `ImagePaint`.

Hasil tampilan latihan:

![button](../../../Resource/032_view16.png)
