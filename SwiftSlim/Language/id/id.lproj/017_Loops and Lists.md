# Perulangan dan daftar

Dalam pelajaran ini, kita akan mempelajari perulangan `for` di Swift, serta `ForEach` di SwiftUI.

Keduanya dapat membantu kita membaca elemen-elemen di dalam array secara berurutan, satu per satu. Dalam pengembangan aplikasi yang sebenarnya, kita sering perlu mengambil sekumpulan data satu per satu, lalu memproses atau menampilkannya, dan perulangan adalah alat penting untuk menyelesaikan tugas ini.

Saat kita menjelajahi halaman web atau menggunakan aplikasi, kita sering melihat banyak daftar atau item. Konten seperti ini biasanya disimpan terlebih dahulu di dalam `array`, lalu dibaca satu per satu melalui `perulangan`, dan akhirnya ditampilkan di antarmuka.

Sebagai contoh, daftar hasil pencarian Google:

![Google](../../Resource/017_google.png)

Setiap item dalam daftar hasil pencarian biasanya sesuai dengan satu data, lalu ditampilkan satu per satu melalui perulangan.

Karena itu, `array` dan `perulangan` sering muncul bersama. `Array` bertugas menyimpan sekumpulan data, sedangkan `perulangan` bertugas mengambil data tersebut secara berurutan dan menjalankan operasi yang sama pada setiap data.

Berikutnya, mari kita mulai dari perulangan `for` yang paling dasar.

## Hitung mundur

Misalkan kita ingin mensimulasikan fungsi hitung mundur, dan menampilkan `“5, 4, 3, 2, 1”` secara berurutan.

Cara paling langsung untuk menuliskannya adalah:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Cara ini memang bisa mensimulasikan hitung mundur, tetapi jika isinya banyak, penulisannya akan terlihat sangat berulang, dan nantinya juga tidak mudah untuk diubah.

Pada saat ini, kita bisa terlebih dahulu memasukkan data ke dalam array, lalu menggunakan perulangan `for` untuk menampilkannya satu per satu:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Cara penulisan ini lebih ringkas dan juga lebih mudah diperluas. Walaupun angka dalam hitung mundur ada banyak, kita tidak perlu menulis `print` baris demi baris, cukup biarkan perulangan memproses setiap elemen di dalam array secara otomatis.

Kita juga bisa memasukkan kode ini ke dalam tombol untuk mengujinya:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Ketika tombol ditekan, perulangan `for` akan mengambil setiap bilangan bulat di dalam `countDown` sesuai urutan array, lalu mencetaknya ke konsol.

Berikutnya, mari kita lihat bagaimana perulangan `for` bekerja.

## Perulangan for

Perulangan `for` digunakan untuk memproses sekumpulan data secara berurutan. Objek yang paling umum adalah array dan rentang.

Bentuk dasar:

```swift
for elemen in arrayAtauRentang {
    kodeYangDijalankan
}
```

Sebagai contoh, kode hitung mundur tadi:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Di sini, `i` mewakili elemen yang sedang diambil saat ini, sedangkan setelah `in` adalah data yang akan diulang, yaitu array `countDown`.

Arti dari kode ini adalah: program akan mengambil setiap elemen dari array `countDown` secara berurutan. Setiap kali mengambil satu elemen, program akan sementara menggunakan `i` untuk mewakilinya, lalu menjalankan kode di dalam kurung kurawal.

Proses eksekusinya dapat dipahami seperti ini:

* Elemen pertama yang diambil adalah `5`, jadi pada saat ini nilai `i` adalah `5`
* Jalankan `print(i)`, lalu keluarkan `5`
* Kemudian lanjut mengambil elemen berikutnya, yaitu `4`
* Jalankan lagi `print(i)`, lalu keluarkan `4`

Angka `3`, `2`, dan `1` setelahnya juga akan dieksekusi satu per satu dengan cara yang sama.

![for](../../Resource/017_for.png)

Setelah semua elemen di dalam array selesai diproses, perulangan `for` akan berakhir secara otomatis.

Kita bisa menggunakan perulangan `for` untuk mendapatkan setiap elemen di dalam array, lalu menyelesaikan fungsi seperti hitung mundur ini.

**Catatan**: `i` adalah nama yang sangat umum dalam perulangan for, dan digunakan untuk mewakili elemen yang sedang diambil, tetapi ini bukan bentuk yang wajib. Kita juga bisa menggunakan nama bahasa Inggris lainnya.

Sebagai contoh, gunakan `num` untuk mewakili setiap elemen yang diambil:

```swift
for num in countDown {
    print(num)
}
```

Di dalam kurung kurawal, kita juga harus menggunakan `num` untuk mewakili elemen yang sedang diambil saat ini.

### Perulangan pada rentang

Perulangan `for` tidak hanya bisa digunakan pada array, tetapi juga pada rentang.

Sebagai contoh, ketika kita ingin menghitung jumlah semua bilangan bulat positif sampai `50`, kita perlu menjumlahkan semua bilangan bulat dari `1` sampai `50` satu per satu.

Cara paling langsung mungkin seperti ini:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Masalah dari cara ini adalah kita harus menulis setiap angka secara manual. Ini merepotkan, dan juga tidak cocok untuk skenario pengembangan yang sebenarnya.

Pada saat ini, kita bisa menggunakan operator rentang bersama perulangan `for` untuk menyelesaikannya.

Di pelajaran “Operator” sebelumnya, kita sudah mempelajari operator rentang:

```swift
1...3   // 1, 2, 3
```

Di sini, `...` berarti rentang tertutup, yaitu mencakup titik awal dan titik akhir.

Karena itu, di sini kita bisa menggunakan perulangan `for` pada rentang bilangan bulat dari `1` sampai `50`:

```swift
for i in 1...50 {
    
}
```

Kita perlu menjumlahkan bilangan-bilangan ini, jadi kita juga membutuhkan sebuah variabel untuk menyimpan totalnya:

```swift
var count = 0
```

Lalu di setiap putaran perulangan, tambahkan angka yang sedang diambil ke `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Kode ini berarti:

* `count` digunakan untuk menyimpan jumlah saat ini
* Perulangan `for` akan mengambil bilangan bulat dari `1` sampai `50` satu per satu
* Setiap kali satu bilangan bulat diambil, `count += i` akan dijalankan sekali
* Setelah perulangan selesai, `count` akan menyimpan jumlah akhirnya

Dengan cara ini, kita bisa mendapatkan jumlah semua bilangan bulat positif sampai `50`.

Demikian juga, jika kita ingin menghitung jumlah bilangan bulat dari `1` sampai `100`, kita hanya perlu mengubah rentangnya:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Perulangan `for` tidak hanya bisa digunakan pada array, tetapi juga pada sebuah rentang. Kemampuan untuk memproses data secara berulang dan berurutan seperti ini sangat umum dalam pengembangan.

Ini dapat membantu kita menangani banyak pekerjaan berulang secara otomatis, tanpa perlu menulis penjumlahan setiap angka atau operasi berulang lainnya secara manual.

## Perulangan di SwiftUI

Perulangan `for` sebelumnya adalah bagian dari bahasa Swift.

Tetapi di SwiftUI, kita tidak bisa langsung menggunakan `for` di dalam struktur view untuk menghasilkan view:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Ini karena yang dibutuhkan di dalam `VStack` adalah view SwiftUI, sedangkan perulangan `for` biasa itu sendiri bukanlah sebuah view.

Jika kita ingin menghasilkan antarmuka secara berulang di SwiftUI berdasarkan isi array, maka kita perlu menggunakan `ForEach`.

Sebagai contoh, jika kita ingin menampilkan nama semua anggota dalam sebuah kelompok, kita bisa menulis:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Hasil tampilannya:

![for1](../../Resource/017_for1.png)

Lalu, tambahkan modifier yang sama ke setiap `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Sekarang, setiap `Text` akan ditampilkan dengan font yang lebih kecil dan lebih tebal.

Hasil tampilannya:

![](../../Resource/017_for2.png)

Walaupun modifier membuat antarmuka terlihat lebih bagus, modifier juga membuat kode menjadi lebih panjang dan lebih berulang.

Jika jumlah nama terus bertambah, atau nantinya kita ingin mengubah font, warna, dan gaya lainnya secara seragam, kita perlu menulis dan mengubah banyak kode yang sama berulang kali. Ini cukup merepotkan dan juga tidak nyaman untuk dipelihara.

Pada saat ini, kita bisa terlebih dahulu memasukkan nama-nama ini ke dalam array, lalu menggunakan `ForEach` di SwiftUI untuk menghasilkan view secara berulang berdasarkan data di dalam array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Kode ini lebih ringkas. `ForEach` akan membaca setiap elemen di dalam array satu per satu, lalu menampilkan isi yang sesuai di antarmuka.

Ketika nanti kita menambahkan nama baru, kita hanya perlu mengubah nama di dalam array `names`. Kita tidak perlu menambahkan `Text` dan modifier yang rumit berulang kali setiap saat.

## ForEach

`ForEach` adalah struktur di SwiftUI yang digunakan untuk menghasilkan view secara berulang. Kamu bisa memahaminya sebagai struktur di SwiftUI yang mirip dengan perulangan `for`.

Penggunaan dasar:

```swift
ForEach(array, id: \.self) { elemen in
    kode SwiftUI
}
```

Sebagai contoh, nama kelompok tadi:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Kode ini berarti:

`names` adalah array yang sedang diulang, yaitu data yang akan ditampilkan.

`id:\.self` berarti menggunakan elemen itu sendiri di dalam array untuk membedakan setiap item.

Pada contoh saat ini, array menyimpan string:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Karena itu, SwiftUI akan langsung menggunakan string itu sendiri, seperti "Sam", "John", "Wathon", dan "Bob", untuk membedakan konten yang berbeda.

Untuk array sederhana yang umum pada tahap pemula, seperti `String` dan `Int`, biasanya kita bisa terlebih dahulu menulis:

```swift
id: \.self
```

Untuk saat ini, kamu hanya perlu mengingat bentuk ini terlebih dahulu. Tidak perlu mendalami lebih jauh aturan `id` yang lain.

`item` dalam `item in` mewakili elemen yang sedang diambil saat ini.

Sebagai contoh, pada perulangan pertama, `item` adalah `"Sam"`, dan pada perulangan kedua, `item` adalah `"John"`.

Karena itu:

```swift
Text(item)
```

akan berubah satu per satu menjadi:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Jadi, fungsi kode ini adalah: mengambil setiap nama dari array `names` satu per satu, lalu menghasilkan view `Text` untuk setiap nama.

### Proses eksekusi

Proses eksekusinya dapat dipahami seperti ini:

* `ForEach` terlebih dahulu membaca elemen pertama `"Sam"` di dalam array `names`
* `item` untuk sementara mewakili `"Sam"`
* `Text(item)` menampilkan `"Sam"`
* Lalu lanjut membaca elemen berikutnya `"John"`
* Kemudian mengulangi kode view yang sama lagi

Pada akhirnya, semua nama di dalam array akan ditampilkan.

Keuntungan dari cara penulisan ini adalah: ketika jumlah nama bertambah, kita tidak perlu menulis banyak `Text` berulang kali, kita hanya perlu mengubah isi array.

### Perulangan untuk foto

`ForEach` tidak hanya bisa menampilkan teks, tetapi juga bisa menampilkan gambar, warna, atau view SwiftUI lainnya.

Sebagai contoh, kita menyiapkan 4 gambar:

```text
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Seret keempat gambar ini ke folder Assets di Xcode.

![image](../../Resource/017_for3.png)

Jika kita tidak menggunakan `ForEach`, maka kita perlu menulis setiap gambar secara manual:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Hasil tampilannya:

![image](../../Resource/017_for4.png)

Cara ini memang bisa menghasilkan fungsi yang diinginkan, tetapi kodenya akan relatif panjang.

Jika gambar semakin banyak, kita perlu menulis semakin banyak kode `Image` secara berulang.

Jika nantinya kita ingin mengubah ukuran gambar secara seragam, kita juga harus mengubahnya satu per satu.

Pada saat ini, kita bisa memasukkan nama gambar ke dalam array, lalu menggunakan `ForEach` untuk menghasilkan view gambar secara berulang:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Di sini, `images` adalah array string, dan setiap elemen di dalam array adalah nama gambar.

`ForEach(images, id: \.self)` berarti membaca setiap elemen di dalam array `images` satu per satu, menggunakan elemen itu sendiri untuk membedakan setiap item, lalu menghasilkan view yang sesuai berdasarkan elemen saat ini.

Sebagai contoh, jika elemen pertama yang dibaca adalah `"430F9BEF"`, maka:

```swift
Image(item)
```

artinya sama dengan:

```swift
Image("430F9BEF")
```

Gambar-gambar setelahnya juga akan ditampilkan satu per satu dengan cara yang sama.

![image](../../Resource/017_for4.png)

Di sini kita tetap menggunakan:

```swift
id: \.self
```

Alasannya sama seperti sebelumnya: karena elemen di dalam array `images` juga merupakan tipe string sederhana, maka pada tahap pemula kita bisa langsung menggunakan elemen itu sendiri sebagai cara untuk membedakan setiap item.

Kita bisa memahaminya secara sederhana sebagai rumus tetap:

**Ketika `ForEach` mengulang array sederhana seperti `String` atau `Int`, biasanya kita menulis `id: \.self`.**

### Menambahkan gambar

Jika nanti kita perlu menambahkan gambar, kita hanya perlu mengubah isi array:

```text
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Kita tidak perlu lagi menulis kode `Image` baru berulang kali.

Jika gambarnya banyak, kita bisa menggunakannya bersama `ScrollView`. Jika tidak, ketika kontennya melebihi layar, semuanya tidak akan bisa ditampilkan sepenuhnya.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Mengubah gambar

Ketika kita perlu mengubah gaya gambar secara seragam, kita hanya perlu mengubah kode di dalam `ForEach`.

Sebagai contoh, ubah lebar menjadi `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Dengan cara ini, semua gambar akan berubah sekaligus, dan kita tidak perlu mengubahnya satu per satu.

Inilah salah satu fungsi penting dari `ForEach`:

**Ketika banyak view memiliki struktur yang sama dan hanya kontennya yang berbeda, kita cukup menulis kode view satu kali, lalu biarkan data di dalam array menentukan apa yang akan ditampilkan.**

## Ringkasan

Dalam pelajaran ini, kita mempelajari perulangan `for` dan `ForEach`.

Perulangan `for` digunakan untuk memproses elemen-elemen di dalam array atau rentang secara berurutan, dan lebih cenderung digunakan untuk pemrosesan data.

`ForEach` digunakan di SwiftUI untuk menghasilkan view secara berulang berdasarkan isi array, dan lebih berfokus pada tampilan view.

Pada tahap pemula saat ini, bentuk `ForEach` yang paling umum adalah:

```swift
ForEach(array, id: \.self) { elemen in
    kode SwiftUI
}
```

Di sini, `id: \.self` berarti menggunakan elemen itu sendiri untuk membedakan setiap elemen.

Ketika isi array adalah tipe sederhana seperti `String` dan `Int`, biasanya kita bisa mulai dengan bentuk penulisan ini terlebih dahulu.

Nanti, ketika kamu menjelajahi web atau aplikasi dan melihat sekelompok teks, gambar, atau konten daftar lain yang berulang, kamu bisa membayangkan bahwa di SwiftUI, konten seperti ini biasanya terlebih dahulu dimasukkan ke dalam array, lalu ditampilkan satu per satu melalui `ForEach`.
