# Membuat tombol mulai bekerja

Di pelajaran ini, kita terutama akan mempelajari tombol `Button`, output debug menggunakan `print`, serta fungsi di Swift.

Semua ini adalah dasar dari pemrograman interaktif di SwiftUI.

## Tombol

Tombol adalah kontrol UI yang paling sering kita jumpai. Ketika kita perlu mengunduh, membuka, atau keluar dari sesuatu, biasanya kita akan menekan tombol.

Misalnya, di App Store kita menekan tombol “Dapatkan” untuk mengunduh aplikasi.

![Button](../../RESOURCE/008_button.png)

Di SwiftUI, tombol direpresentasikan dengan `Button`.

Penggunaan dasar:

```swift
Button("") {
    
}
```

Strukturnya dapat dibagi menjadi dua bagian:

```swift
Button("Teks tombol") {
    Kode yang dijalankan saat tombol ditekan
}
```

Misalnya:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Setelah dijalankan, akan muncul tombol `Start`.

![Button](../../RESOURCE/008_button1.png)

Ketika pengguna menekan tombol, kode di dalam `{}` akan dijalankan.

Perlu diperhatikan: `Button` termasuk kontrol antarmuka (`View`) di SwiftUI, sehingga harus ditulis di dalam `body`.

### Modifier buttonStyle

Di SwiftUI, `Button` menyediakan gaya tombol bawaan sistem, yang bisa digunakan melalui modifier `buttonStyle`.

Misalnya:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` akan menggunakan gaya tombol yang disediakan sistem.

Pilihan umum meliputi:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Perbedaan di antara berbagai gaya ini terutama terlihat pada apakah tombol memiliki border, background, dan seberapa kuat penekanan visualnya.

## Output print

Dalam pemrograman, kita sering perlu memeriksa apakah program sudah berjalan sampai pada bagian kode tertentu.

Swift menyediakan fungsi `print` untuk mencetak informasi debugging.

Penulisan dasar:

```swift
print("Hello")
```

Baris kode ini akan mencetak teks ke `Console`.

### Menguji apakah tombol bekerja

Kita bisa menuliskan `print` di dalam tombol untuk menguji apakah tombol benar-benar ditekan.

```swift
Button("Start") {
    print("Test 123")
}
```

Saat tombol ditekan, `Console` akan menampilkan:

```
Test 123
```

Ini menunjukkan bahwa tombol berhasil dipicu.

![Button](../../RESOURCE/008_button3.png)

Catatan: `print` adalah kode Swift, bukan kontrol antarmuka. Ia tidak bisa langsung diletakkan di dalam `body`, kalau tidak maka akan muncul error.

Misalnya, penulisan berikut adalah salah:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Salah: body harus mengembalikan sebuah View
    }
}
```

Di SwiftUI, `body` digunakan untuk mendeskripsikan struktur antarmuka, jadi hanya boleh berisi kontrol UI (`View`) seperti `Text`, `Button`, `Image`, dan sebagainya.

Kode biasa seperti logika perhitungan, `print`, dan lainnya harus ditempatkan di dalam tombol, fungsi, atau event handler lain.

### Console

Isi yang dicetak oleh `print` akan muncul di `Console` milik Xcode.

Jika `Console` tidak terlihat, kamu bisa mengklik tombol `Show the Debug Area` di kanan bawah untuk membuka area debug, lalu klik tombol `Show the Console` untuk menampilkan konsol.

![](../../RESOURCE/008_button4.png)

Di kiri bawah `Console` ada dua tab: `Executable` dan `Previews`.

![](../../RESOURCE/008_button5.png)

Kedua tab ini mewakili lingkungan berjalan yang berbeda: saat view dijalankan di pratinjau `Canvas`, output `print` akan muncul di tab `Previews`; jika aplikasi dijalankan di simulator atau perangkat fisik, output akan muncul di tab `Executable`.

Karena itu, ketika kamu merasa `print` tidak menghasilkan output, pertama-tama periksa apakah kamu sedang memilih tab yang benar.

## Contoh - seni karakter ASCII

Di beberapa proyek kode, kita sering melihat seni karakter ASCII.

Seni karakter adalah gambar yang dibentuk dari karakter biasa, misalnya:

![ASCII](../../RESOURCE/008_ascii.png)

Kita bisa menggunakan tombol + `print` untuk menampilkan seni karakter ASCII.

Contoh kode:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Saat tombol ditekan, `Console` akan menampilkan:

```
 /\_/\
( o.o )
 > ^ <
```

Perlu diperhatikan: karakter `\` di dalam string harus ditulis sebagai `\\`, karena backslash adalah karakter escape di dalam string.

## Fungsi

Di dalam tombol, kita bisa langsung menulis kode.

Misalnya:

```swift
Button("Start") {
    print("Hello")
}
```

Jika jumlah kodenya sedikit, cara ini tidak masalah. Tetapi dalam pengembangan nyata, logika yang dipicu oleh sebuah tombol bisa jauh lebih banyak.

Misalnya:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Mungkin masih ada banyak kode lain
}
```

Jika jumlah kode semakin banyak, menuliskannya langsung di dalam tombol akan membuat kode antarmuka menjadi berantakan, dan sulit dibaca maupun dirawat.

Karena itu, biasanya kita akan merapikan kode tersebut ke dalam sebuah fungsi, lalu memanggil fungsi itu dari tombol.

### Apa itu fungsi

Fungsi adalah potongan kode yang bisa digunakan berulang kali.

Ketika ada kode tertentu yang perlu dijalankan, kita cukup memanggil fungsi itu, lalu kode di dalam fungsi akan dijalankan.

Dengan begitu, struktur kode menjadi lebih jelas dan juga lebih mudah digunakan ulang.

### Penulisan dasar

Di Swift, fungsi didefinisikan menggunakan kata kunci **func**:

```swift
func randomInt() {
    // code
}
```

Kode ini mendefinisikan sebuah fungsi.

`randomInt` adalah nama fungsi, yang digunakan untuk menandai potongan kode ini.

`()` menunjukkan posisi parameter, tempat kita bisa menerima data dari luar. Jika tidak membutuhkan data, bisa dibiarkan kosong.

Bagian `{}` adalah area kode fungsi, dan semua kode yang perlu dijalankan ditulis di sini.

Misalnya:

```swift
func getName() {
    print("FangJunyu")
}
```

Fungsi ini bertugas mencetak sebuah teks.

### Memanggil fungsi

Mendefinisikan fungsi hanya berarti membuat potongan kode tersebut. Jika ingin benar-benar menjalankannya, kita masih perlu memanggilnya.

Caranya adalah menambahkan `()` setelah nama fungsi:

```swift
getName()
```

Ketika program berjalan sampai ke baris ini, maka kode di dalam fungsi `getName` akan dieksekusi.

Contoh lengkap:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Setelah dijalankan, `Console` akan menampilkan:

```
FangJunyu
```

### Menggunakan fungsi di SwiftUI

Di dalam view SwiftUI, fungsi biasanya ditulis di luar `body`.

Misalnya:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Ketika tombol ditekan, fungsi `getName()` akan dipanggil.

Cara ini membuat kode antarmuka tetap ringkas, sementara logika detailnya ditangani di dalam fungsi.

### Parameter fungsi

Kadang-kadang, sebuah fungsi perlu melakukan operasi yang berbeda berdasarkan data yang berbeda.

Misalnya, kita berharap fungsi bisa mencetak nama yang berbeda-beda, bukan hanya `"FangJunyu"` yang tetap.

Dalam kasus ini, kita bisa menggunakan parameter. Parameter bisa dipahami sebagai data yang diberikan saat fungsi dipanggil.

Misalnya:

```swift
func getName(name: String) {
    print(name)
}
```

Fungsi ini menambahkan satu parameter baru. `name` adalah nama parameter, dan `String` adalah tipe parameternya. 

Artinya fungsi tersebut perlu menerima sebuah data bertipe `String`.

Karena sekarang fungsi membutuhkan data, saat memanggilnya kita harus memberikan data itu.

```swift
getName(name: "Sam")
```

Ketika dipanggil dengan `"Sam"`, fungsi akan menggunakan nilai itu untuk dicetak.

Hasil jalannya:

```
Sam
```

## Contoh - menampilkan seni karakter ASCII dengan fungsi

Pada contoh sebelumnya, kita menulis `print` langsung di dalam tombol.

Tetapi jika seni karakter menjadi lebih rumit, kodenya akan menjadi panjang. Saat itulah logikanya bisa dipindahkan ke fungsi agar kode antarmuka menjadi lebih jelas.

Contoh kode:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Setelah dijalankan dan tombol ditekan, `Console` akan menampilkan:

```
 /\_/\
( o.o )
 > ^ <
```

Ada dua hal yang terjadi di sini saat pengguna menekan tombol:

1. Tombol memanggil fungsi `printCat()`
2. Kode `print` di dalam fungsi dijalankan

Dengan begitu, kode antarmuka hanya bertanggung jawab memicu event, sedangkan logika spesifiknya diletakkan di fungsi.

Dalam pengembangan nyata, sebagian besar aksi tombol akan diwujudkan melalui fungsi.

## Ringkasan

Di pelajaran ini kita mempelajari tiga hal penting:

**1. Tombol Button**

`Button` adalah kontrol di SwiftUI yang digunakan untuk memicu suatu aksi.

```swift
Button("Start") {

}
```

Ketika pengguna menekan tombol, kode di dalam kurung kurawal akan dijalankan.

**2. Output print**

`print` digunakan untuk mencetak informasi debugging ke `Console`.

```swift
print("Hello")
```

Developer dapat menggunakan `Console` untuk memeriksa status jalannya program.

**3. Fungsi**

Fungsi adalah potongan kode yang dapat digunakan berulang kali.

```swift
func sayHello() {
    print("Hello")
}
```

Memanggil fungsi:

```swift
sayHello()
```

Jika fungsi membutuhkan data, kita bisa menggunakan parameter:

```swift
func sayHello(name: String) {
    print(name)
}
```

Di pelajaran berikutnya, kita akan terus mempelajari lebih banyak kontrol SwiftUI dan bagaimana data berinteraksi dengan antarmuka.

## Latihan

Coba selesaikan latihan berikut:

1. Buat sebuah tombol dengan teks `"Hello"`
2. Saat tombol ditekan, tampilkan `Hello Swift` di `Console`
3. Masukkan kode output ke dalam sebuah fungsi, lalu panggil fungsi itu dari tombol
