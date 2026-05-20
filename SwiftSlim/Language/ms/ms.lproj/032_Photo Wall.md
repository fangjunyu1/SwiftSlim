# Dinding Foto

Dalam pelajaran ini, kita akan membina sebuah halaman dinding foto.

![view](../../../Resource/032_view13.png)

Dalam contoh ini, kita akan mengulang kaji pengetahuan tentang `extension`, `self`, dan instance, serta mempelajari bentuk grafik `Shape` yang lazim digunakan di SwiftUI.

Dengan pengetahuan ini, kita boleh memotong imej biasa menjadi pelbagai gaya seperti bulatan, segi empat tepat bersudut bulat, bentuk kapsul, dan elips, serta menambahkan kesan bingkai pada foto.

Pelajaran ini akan menggunakan beberapa konsep baharu: `Shape`, `clipShape`, `strokeBorder`, dan `overlay`.

Antaranya, `clipShape` digunakan untuk memotong bentuk view, `strokeBorder` digunakan untuk melukis bingkai bentuk, dan `overlay` digunakan untuk menindihkan view baharu di atas view.

## Bahan Imej

Sebelum bermula, kita perlu menyediakan beberapa imej.

Anda boleh menggunakan foto sendiri, atau menggunakan imej contoh yang disediakan dalam pelajaran ini.

Contoh foto dalam pelajaran ini berasal dari laman web [Pixabay](https://pixabay.com/):

[Landskap](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Musang](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Bangunan](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Bunga](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Angsa](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Selepas imej dimuat turun, tambahkan semuanya ke folder sumber `Assets`, kemudian namakannya mengikut urutan sebagai `1`, `2`, `3`, `4`, dan `5`.

![assets](../../../Resource/032_view17.png)

Dengan itu, kita boleh memaparkan imej di SwiftUI menggunakan cara seperti `Image("1")` dan `Image("2")`.

## Memaparkan Foto

Pertama, kita memaparkan 5 foto di dalam `ContentView`:

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

Kesan paparan:

![view](../../../Resource/032_view.png)

Dalam potongan kod ini, kita menggunakan `ScrollView` untuk membolehkan senarai foto ditatal, dan menggunakan `VStack` supaya beberapa imej disusun dari atas ke bawah.

Setiap imej ditetapkan melalui `.resizable()`, `.scaledToFit()`, dan `.frame(width: 300)` untuk menentukan kesan paparan imej, supaya imej boleh diskalakan, kekal dipaparkan secara lengkap mengikut nisbah, serta lebarnya dihadkan.

`.padding(.vertical, 100)` pada `VStack` digunakan untuk menambah jarak atas dan bawah, supaya foto pertama dan foto terakhir tidak terlalu melekat pada tepi skrin.

Akhir sekali, `.ignoresSafeArea()` bermaksud membuat scroll view mengabaikan kawasan selamat, supaya semasa foto ditatal, paparannya boleh memanjang hingga bahagian atas dan bawah skrin, dan halaman kelihatan lebih utuh.

Namun, sekarang 5 imej semuanya menggunakan pengubah suai yang sama:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Apabila kita melihat kod yang berulang, kita boleh mempertimbangkan untuk menggunakan `extension` untuk menyusunnya.

## Menggunakan extension untuk Menyusun Gaya Imej

Kita boleh melanjutkan `Image` dengan sebuah kaedah khusus untuk dinding foto:

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

Di sini, kita melanjutkan jenis `Image` dengan sebuah kaedah `photoGalleryStyle`.

Di dalam kaedah ini terdapat `.resizable()`, `.scaledToFit()`, dan `.frame(width: 300)` yang sebelum ini digunakan berulang kali. Dengan kata lain, kaedah ini menggabungkan kod untuk penskalaan imej, paparan sesuai nisbah, dan tetapan lebar.

Selepas menggunakan extension ini, kod imej yang asal:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

boleh dipermudahkan menjadi:

```swift
Image("1")
    .photoGalleryStyle()
```

Dengan itu, setiap imej hanya perlu memanggil `.photoGalleryStyle()` untuk menggunakan gaya dinding foto yang sama. Kod menjadi lebih ringkas, dan perubahan seragam di kemudian hari juga lebih mudah dilakukan.

## Memahami self

Di dalam kaedah extension, kita menulis `self`:

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

`self` di sini bermaksud instance imej semasa yang memanggil kaedah ini.

Contohnya:

```swift
Image("1")
    .photoGalleryStyle()
```

Dalam potongan kod ini, `photoGalleryStyle()` dipanggil oleh `Image("1")`, jadi `self` di dalam kaedah bermaksud imej `Image("1")` tersebut.

Secara mudah, boleh difahami sebagai: siapa yang memanggil kaedah ini, maka `self` mewakili pihak itu.

Perlu diperhatikan bahawa pengubah suai SwiftUI akan terus mengembalikan hasil view baharu. Oleh itu, `photoGalleryStyle()` mengembalikan view yang sudah diubah suai, bukan sekadar mengembalikan `Image` asal itu sendiri.

## Bentuk Foto

Sekarang, foto sudah boleh dipaparkan seperti biasa. Namun, foto-foto ini secara lalai berbentuk segi empat tepat, jadi kelihatan agak biasa.

Jika hanya mahu foto mempunyai sudut bulat, kita boleh terus menggunakan `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Kesan paparan:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` bermaksud menambahkan sudut bulat sebesar `20 pt` pada imej. Untuk imej bersudut bulat biasa, cara penulisan ini sudah mencukupi.

Namun, `.cornerRadius()` hanya boleh menangani kesan sudut bulat, jadi sesuai untuk membuat imej bersudut bulat biasa. Jika kita mahu mengubah foto menjadi lebih banyak bentuk yang berbeza, pengubah suai ini saja tidak mencukupi.

Pada bahagian ini, kita perlu menggunakan `Shape` di SwiftUI. `Shape` boleh mewakili pelbagai bentuk. Jika digabungkan dengan `clipShape`, imej boleh dipotong menjadi bentuk yang sepadan.

## Mengenali Shape

Dalam SwiftUI, `Shape` bermaksud bentuk grafik. Sama seperti `View`, `Shape` juga merupakan jenis yang sangat lazim digunakan di SwiftUI.

`Shape` yang lazim termasuk bulatan, segi empat tepat, segi empat tepat bersudut bulat, bentuk kapsul, dan elips. Untuk memudahkan pemerhatian rupa pelbagai bentuk, contoh berikut akan menetapkan warna dan saiz yang berbeza untuk setiap bentuk.

Dalam contoh-contoh ini, `.fill()` digunakan untuk mengisi bentuk dengan warna, dan `.frame()` digunakan untuk menetapkan saiz paparan bentuk. Warna hanya digunakan untuk membezakan pelbagai bentuk, bukan warna tetap bagi bentuk itu sendiri.

### Circle Bulatan

`Circle` bermaksud bulatan. Bentuk ini sering digunakan untuk avatar, butang bulat, imej bulat, dan kesan antara muka lain.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle Segi Empat Tepat

`Rectangle` bermaksud segi empat tepat. Ini ialah salah satu bentuk paling asas, dan juga boleh digunakan untuk membuat latar belakang, kawasan pemisah, atau bingkai biasa.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle Segi Empat Tepat Bersudut Bulat

`RoundedRectangle` bermaksud segi empat tepat bersudut bulat. `cornerRadius` digunakan untuk menetapkan saiz sudut bulat.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule Bentuk Kapsul

`Capsule` bermaksud bentuk kapsul. Kedua-dua hujungnya berbentuk lengkungan, dan sering digunakan untuk butang kapsul, latar belakang label, dan kesan antara muka lain.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse Elips

`Ellipse` bermaksud elips. Bentuk ini mirip dengan `Circle`, tetapi apabila lebar dan tingginya tidak sama, bentuk yang dipaparkan ialah elips.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Melalui contoh-contoh ini, boleh dilihat bahawa `Shape` itu sendiri boleh terus dipaparkan sebagai bentuk grafik. Seterusnya, kita akan menggunakan `Shape` bersama `clipShape` untuk memotong foto, supaya foto dipaparkan dalam pelbagai bentuk.

## Menggunakan clipShape untuk Memotong Foto

Sekarang, kita boleh menggunakan `clipShape` untuk memotong foto menjadi pelbagai bentuk.

Contohnya, memotong foto pertama menjadi bulatan:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Potongan kod ini bermaksud: mula-mula memaparkan sebuah imej, kemudian menggunakan `Circle()` untuk memotongnya menjadi bulatan.

![view](../../../Resource/032_view2.png)

Penulisan asas `clipShape` ialah:

```swift
.clipShape(bentuk)
```

Tambahkan `.clipShape(...)` selepas view, kemudian isi tanda kurungan dengan bentuk yang mahu digunakan untuk memotong.

Contohnya:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Sekarang, kita memotong 5 foto menjadi bentuk yang berbeza:

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

Kesan paparan:

![view](../../../Resource/032_view8.png)

Antaranya, kesan selepas dipotong dengan `Rectangle()` hampir sama dengan foto segi empat tepat biasa, jadi perubahan visualnya tidak begitu jelas. Ini terutamanya digunakan sebagai perbandingan dengan bentuk lain.

Sekarang, foto tidak lagi hanya berupa segi empat tepat biasa, tetapi sudah mempunyai bentuk yang berbeza-beza.

## Menambahkan Bingkai Foto

Jika kita mahu menambahkan bingkai pada foto berbentuk bulatan, mungkin kita akan terfikir untuk menggunakan `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Namun, hasil yang biasanya diperoleh bukan bingkai bulatan, sebaliknya bingkai segi empat tepat.

![view](../../../Resource/032_view9.png)

Ini kerana `border` menambahkan bingkai berasaskan kawasan segi empat tepat view, bukan berasaskan bentuk selepas dipotong oleh `clipShape`.

Jadi, jika kita mahu membuat bingkai bulatan, kita tidak boleh terus menggunakan `border`.

## Menggunakan strokeBorder untuk Melukis Bingkai Bentuk

Dalam SwiftUI, `strokeBorder` boleh melukis bingkai bahagian dalam untuk `Shape` lazim ini.

Contohnya, melukis sebuah bingkai bulatan:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Potongan kod ini bermaksud: melukis bingkai berwarna perang untuk `Circle`, dengan lebar bingkai `10 pt`.

![view](../../../Resource/032_view12.png)

Perlu diperhatikan bahawa `strokeBorder` tidak menambahkan secara terus bingkai pada foto, tetapi melukis bingkai untuk bentuk `Circle()` ini.

Dengan kata lain, hasil daripada kod ini hanyalah sebuah bingkai bulatan berasingan, dan masih belum mempunyai hubungan dengan foto.

Jika mahu membuat bingkai bulatan ini muncul di atas foto, kita perlu terus menggunakan `overlay` untuk menindihkan bingkai tersebut di atas foto.

## Menggunakan overlay untuk Menindihkan Bingkai

`overlay` ialah pengubah suai view yang boleh menindihkan view baharu di atas view semasa.

Struktur asasnya boleh difahami sebagai:

```swift
View semasa
    .overlay {
        View yang ditindihkan
    }
```

Dalam contoh ini, view semasa ialah foto yang sudah dipotong menjadi bulatan:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

View baharu yang mahu kita tindihkan di atasnya ialah sebuah bingkai bulatan:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Jadi, foto dan bingkai boleh digabungkan seperti ini:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Di sini, `overlay` bermaksud menindihkan sebuah view baharu di atas view semasa.

Di dalam `overlay`, bingkai akan mengikuti kawasan paparan foto semasa, jadi kita tidak perlu menetapkan `frame` secara berasingan. Asalkan bentuk bingkai sama dengan bentuk potongan, bingkai boleh melekat pada foto.

![view](../../../Resource/032_view10.png)

Hasil akhirnya ialah foto berbentuk bulatan ditindih dengan sebuah bingkai bulatan.

Berbanding dengan `ZStack`, `overlay` lebih sesuai untuk senario seperti “menambahkan hiasan pada view semasa”. Foto ialah subjek utama, manakala bingkai hanya kesan tambahan, jadi penggunaan `overlay` membuat maksud kod lebih jelas.

## Menyiapkan Dinding Foto

Sekarang, kita menambahkan bentuk dan bingkai yang sepadan untuk setiap foto:

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

Kesan paparan:

![view](../../../Resource/032_view13.png)

Dengan itu, sebuah halaman dinding foto asas telah siap.

Di halaman ini, kita menggunakan `ScrollView` untuk membuat paparan boleh ditatal, menggunakan `Image` untuk memaparkan foto, menggunakan `clipShape` untuk memotong bentuk foto, serta menambahkan bingkai melalui `overlay` dan `strokeBorder`.

## Kod Lengkap

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

Dalam pelajaran ini, kita telah menyelesaikan sebuah halaman dinding foto.

![view](../../../Resource/032_view13.png)

Dalam contoh ini, kita mula-mula menggunakan `Image` untuk memaparkan foto, lalu melanjutkan `Image` melalui `extension` dengan sebuah kaedah `photoGalleryStyle`, yang digunakan untuk menyusun kod gaya imej yang berulang.

Selepas itu, kita mempelajari `Shape` yang lazim digunakan di SwiftUI, seperti `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule`, dan `Ellipse`. Bentuk-bentuk ini tidak hanya boleh dipaparkan secara terus, tetapi juga boleh digunakan bersama `clipShape` untuk memotong view.

Contohnya:

```swift
.clipShape(Circle())
```

bermaksud memotong view menjadi bentuk bulatan.

Akhir sekali, kita menggunakan `overlay` dan `strokeBorder` untuk menambahkan bingkai dengan bentuk yang sepadan pada foto. Perlu diperhatikan bahawa `border` biasanya melukis bingkai berasaskan kawasan segi empat tepat view. Jika mahu bingkai mengikuti bulatan, bentuk kapsul, atau elips, lebih sesuai menggunakan `Shape` yang sama untuk ditindihkan.

Melalui pelajaran ini, kita bukan sahaja menyediakan kesan dinding foto, tetapi juga memahami cara gabungan lazim `Shape`, `clipShape`, `strokeBorder`, dan `overlay` digunakan dalam antara muka.

## Latihan Selepas Pelajaran

### 1、Menambahkan Latar Belakang Dinding Foto

Tambahkan sebuah imej latar belakang skrin penuh pada halaman dinding foto.

Syarat: imej latar belakang boleh memenuhi seluruh skrin dan mengabaikan kawasan selamat.

### 2、Bingkai Kecerunan

Ubah bingkai satu warna yang ada menjadi bingkai kecerunan linear.

Anda boleh mencuba menggunakan `LinearGradient` untuk membuat kesan bingkai yang lebih kaya.

### 3、Bingkai Foto Simulasi

Cari beberapa gaya bingkai foto asal di internet, lalu cuba gunakan `overlay` untuk menindih imej bingkai, supaya foto kelihatan lebih hampir kepada kesan bingkai foto sebenar.

Kesan paparan latihan:

![button](../../../Resource/032_view15.jpeg)

### 4、Membuat Bingkai Butang Bersudut Bulat

Dalam pembangunan sebenar, butang sering menggunakan bingkai segi empat tepat bersudut bulat.

Cubalah membuat sebuah butang bersudut bulat, lalu gunakan `RoundedRectangle` dan `strokeBorder` untuk menambahkan bingkai bersudut bulat pada butang.

Kesan paparan latihan:

![button](../../../Resource/032_view14.png)

### Soalan Pemikiran

Jika tidak ingin menggunakan bingkai satu warna, dan juga tidak mahu menggunakan bingkai kecerunan, tetapi ingin membuat bingkai memaparkan corak tertentu, bagaimanakah cara melaksanakannya?

Anda boleh mencuba mencari rujukan dan memahami penggunaan berkaitan seperti `overlay`, `mask`, atau `ImagePaint`.

Kesan paparan latihan:

![button](../../../Resource/032_view16.png)
