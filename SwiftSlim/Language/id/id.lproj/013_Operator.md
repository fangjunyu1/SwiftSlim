# Operator

Di pelajaran ini, kita akan mempelajari operator di Swift (`Operators`).

Saat kita melakukan perhitungan, perbandingan, atau penilaian logika, kita perlu menggunakan operator. Operasi-operasi ini muncul di berbagai tahap jalannya program, dan merupakan salah satu kemampuan paling dasar dalam pemrograman.

```swift
let a = 100 * 8
```

Dalam proses belajar pemrograman, banyak orang menemukan bahwa orang yang memiliki pola pikir matematika tertentu sering kali lebih mudah memahami logika program. Ini karena hakikat pemrograman tidak lepas dari “perhitungan” dan “penilaian berdasarkan aturan”, dan justru operatorlah yang memegang peran inti tersebut.

Dalam pengembangan nyata, operator tidak hanya dipakai untuk perhitungan angka sederhana, tetapi juga digunakan secara luas dalam berbagai skenario konkret.

Misalnya, dalam permainan blok, ketika pengguna menyeret sebuah blok ke posisi tertentu, sistem perlu menghitung:

- koordinat posisi blok
- posisi yang bisa diisi oleh blok
- apakah posisi target tersedia

Seluruh proses “perhitungan + penilaian” seperti ini pada dasarnya bergantung pada operator.

![Block](../../Resource/013_block.png)

Mempelajari operator bukan sekadar mempelajari perhitungan angka, tetapi juga meletakkan dasar untuk tata letak antarmuka, pemrosesan data, dan logika interaksi di tahap berikutnya.

## Cara menjalankan perhitungan di SwiftUI

Di SwiftUI, biasanya kita memicu fungsi melalui `Button`, lalu menjalankan logika perhitungan di dalam fungsi tersebut.

Misalnya:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Saat tombol ditekan, `Console` akan menampilkan:

```
c: 20
```

Di pelajaran ini, kita akan menuliskan logika perhitungan di dalam `func`, lalu memicunya lewat tombol, dan memakai `print` untuk menampilkan hasilnya.

Dalam contoh-contoh berikutnya, agar penampilan kode lebih sederhana, kita akan langsung menandai hasil perhitungannya di dalam kode, dan tidak lagi mengulang penggunaan `print`.

## Mengelola output Console

Karena setiap kali menekan tombol akan menghasilkan output, kita bisa menekan tombol bersih di kanan bawah area `Console` untuk menghapus log historis, sehingga lebih mudah melihat hasil saat ini.

![Console](../../Resource/013_console.png)

## Bentuk lain dari penulisan Button

Ketika tombol hanya menjalankan satu fungsi, kita bisa menggunakan penulisan yang lebih ringkas:

```swift
Button(action: ) {
    // View
}
```

Dalam bentuk penulisan ini, `action` menentukan fungsi yang harus dijalankan saat tombol ditekan, sedangkan kurung kurawal `{}` dipakai untuk mendefinisikan view tombol.

Jika digabungkan dengan fungsi `calculate` sebelumnya, bisa ditulis seperti ini:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Saat tombol ditekan, fungsi `calculate` akan langsung dijalankan.

Karena itu, ketika logika tombol sederhana dan hanya memanggil satu fungsi, penulisan `action` menjadi lebih jelas dan juga lebih sesuai dengan gaya kode yang baik.

## Operator aritmetika

Operator aritmetika (`Arithmetic Operators`) digunakan untuk perhitungan angka:

- \+ penjumlahan
- \- pengurangan
- \* perkalian
- / pembagian
- % modulo (sisa bagi)

Contoh:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Perlu diperhatikan bahwa Swift adalah bahasa bertipe kuat, sehingga tidak akan mencampur tipe data yang berbeda secara otomatis:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Jika kedua tipe berbeda, kita harus mengonversi tipe secara manual.

## Operator perbandingan

Operator perbandingan (`Comparison Operators`) digunakan untuk menilai hubungan antara dua nilai, dan hasilnya berupa `Bool`:

- `==` sama dengan
- `!=` tidak sama dengan
- \> lebih besar dari
- < lebih kecil dari
- \>= lebih besar dari atau sama dengan
- <= lebih kecil dari atau sama dengan

Contoh:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Operator perbandingan sering digunakan dalam pernyataan kondisi. Misalnya di “carousel kutipan”, kita perlu mengontrol agar index tidak melampaui jangkauan array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jika `index` lebih kecil daripada `sayings.count - 1`, maka hasil perbandingannya adalah `true`, dan kode di dalam pernyataan `if` akan dijalankan. Jika hasilnya `false`, maka kode setelahnya tidak akan dijalankan.

## Operator logika

Operator logika (`Logical Operators`) digunakan untuk menggabungkan beberapa kondisi:

- `&&` dan (`AND`)
- `||` atau (`OR`)
- `!` bukan (`NOT`)

### && dan

Ketika beberapa kondisi harus terpenuhi secara bersamaan, kita menggunakan `&&`.

Misalnya:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Di dalam kode ini ada dua kondisi: `age >= 18` dan `age <= 100`.

Hanya ketika kedua kondisi tersebut sama-sama `true`, maka `legalAge` akan bernilai `true`. Selama ada satu saja yang tidak terpenuhi, hasilnya akan menjadi `false`.

### || atau

Ketika dari beberapa kondisi cukup satu saja yang terpenuhi, kita menggunakan `||`.

Misalnya:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Potongan kode ini berarti: selama salah satu dari `money >= 50` atau `creditCard >= 50` terpenuhi, maka `payAllowed` akan bernilai `true`.

Hanya jika kedua kondisi sama-sama tidak terpenuhi, hasilnya akan menjadi `false`.

Misalnya dalam skenario pembayaran, kita bisa membayar dengan uang tunai atau kartu kredit. Jika keduanya tidak bisa digunakan, maka pembayaran gagal.

### ! bukan

`!` adalah operator logika NOT, yang digunakan untuk membalik nilai `Bool`.

Kita bisa memahaminya sebagai: `!` mengubah `true` menjadi `false`, dan `false` menjadi `true`.

Misalnya:

```swift
let allowed = true
let result = !allowed   // false
```

Di sini `!allowed` berarti membalik nilai `allowed`.

Perlu diperhatikan bahwa `!` dan `!=` adalah dua operator yang berbeda. `!` membalik nilai `Bool`, sedangkan `!=` adalah operator perbandingan yang menghasilkan nilai `Bool`.

## Operator assignment

Operator assignment (`Assignment Operators`) digunakan untuk memberikan atau memperbarui nilai variabel:

- `=` assignment

Dalam deklarasi variabel atau proses perhitungan, assignment selalu terlibat:

```swift
let a = 5
```

Kode ini berarti memberikan nilai 5 ke variabel `a`.

### Operator assignment gabungan

Dalam pengembangan nyata, selain operator assignment dasar, kita juga sering menggunakan “operator assignment gabungan”, yang memungkinkan kita langsung menghitung berdasarkan nilai yang ada lalu memperbaruinya:

- `+=`
- `-=`
- `*=`
- `/=`

Di pelajaran “counter” sebelumnya, kita sudah mengenal operator assignment gabungan secara singkat.

Misalnya, ketika tombol ditekan dan variabel bertambah otomatis:

```swift
var num = 10
num += 5   // num = 15
```

Potongan kode ini berarti: `num` dijumlahkan dengan 5, lalu hasilnya diberikan kembali ke `num`.

Karena itu, ini setara dengan:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operator ternary

Operator ternary (`Ternary Operator`) di Swift akan menilai sebuah kondisi, lalu mengembalikan salah satu dari dua hasil:

```swift
kondisi ? nilai1 : nilai2
```

Logika eksekusinya adalah: jika kondisi bernilai `true`, kembalikan `nilai1`; jika kondisi bernilai `false`, kembalikan `nilai2`.

Misalnya:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Potongan kode ini akan memeriksa nilai `showColor`: jika `true`, hasilnya `Color.blue`, sehingga background tampil biru; jika `false`, hasilnya `Color.clear`, sehingga tidak ada warna latar belakang yang ditampilkan.

Tips: `Color.clear` berarti warna transparan, yaitu tidak menampilkan isi apa pun.

### Perbedaan dengan if-else

Secara logika, operator ternary setara dengan pernyataan `if-else`.

Misalnya, kode di atas juga bisa ditulis seperti ini:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logika eksekusi keduanya sepenuhnya sama: ketika kondisinya `true`, hasil pertama dijalankan; ketika kondisinya `false`, hasil kedua dijalankan.

Dalam penggunaan nyata, penulisan ternary lebih ringkas dan lebih cocok untuk mengekspresikan penilaian sederhana “pilih salah satu dari dua opsi”, terutama saat kita ingin langsung mengembalikan sebuah nilai.

Dalam membangun view SwiftUI, operator ternary sangat umum, misalnya:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Penulisan seperti ini memungkinkan kita mengubah efek view secara dinamis berdasarkan kondisi, semuanya dalam satu baris kode.

## Operator rentang

Operator rentang (`Range Operators`) digunakan untuk merepresentasikan interval:

- `...` rentang tertutup (mencakup kedua ujung)
- `..<` rentang setengah terbuka (tidak mencakup sisi kanan)

Misalnya:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Ini bisa dipahami sebagai: `1...3` berarti dari 1 sampai 3, termasuk 3; sedangkan `5..<8` berarti dari 5 sampai 8, tetapi tidak termasuk 8.

Bentuk perluasan, sekadar pengenalan:

```
5...    // >= 5
...5    // <= 5
```

Penulisan ini berarti “rentang satu sisi”, dan sering digunakan dalam penilaian kondisi atau pencocokan pola.

Operator rentang akan digunakan lagi nanti saat mempelajari `for` loop. Untuk sekarang, kamu cukup memahaminya sebagai rentang angka yang berurutan.

## Latihan operator

Sekarang, mari kita berlatih melihat fungsi operator di dalam view melalui beberapa contoh sederhana.

### 1. Menghitung jumlah total kendaraan

Misalnya, sebuah persimpangan dilewati 500 kendaraan setiap hari. Kita ingin menghitung total kendaraan yang melintas dalam 30 hari.

Kita bisa menggunakan operator perhitungan:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Proses perhitungan di sini adalah: 500 kendaraan per hari, maka total selama 30 hari adalah `500 × 30`, dan hasil akhirnya 15000 kendaraan.

### 2. Menentukan keanggotaan pembelian dalam aplikasi

Kita bisa menentukan apakah seseorang adalah anggota pembelian dalam aplikasi. Selama orang itu memiliki keanggotaan seumur hidup atau berlangganan, maka ia dianggap anggota.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Potongan kode ini memakai operator `||` (atau): `lifeTime = false` berarti tidak punya keanggotaan permanen; `subscription = true` berarti punya keanggotaan berlangganan.

Karena cukup salah satu syarat terpenuhi, `isMember` akan bernilai `true`. Jadi orang ini adalah anggota pembelian dalam aplikasi.

## Ringkasan

Di Swift, operator adalah dasar dari perhitungan data dan penilaian logika. Sama seperti `Text` digunakan untuk menampilkan isi, operator digunakan untuk memproses data itu sendiri.

Dari perhitungan angka yang paling sederhana, hingga penilaian logika yang kompleks, sampai kontrol state view dan perhitungan layout, semuanya tidak lepas dari penggunaan operator.

Melalui latihan di berbagai skenario, kita dapat secara bertahap mengenal dan menguasai berbagai jenis operator yang diperkenalkan di pelajaran ini. Ini adalah fondasi penting untuk pembelajaran selanjutnya.

### Pengetahuan tambahan - Operator bitwise

Selain itu, Swift juga menyediakan jenis operator yang lebih dekat ke level bawah, yaitu operator bitwise (`Bitwise Operators`):

- `&` (AND per bit)
- `|` (OR per bit)
- `^` (XOR per bit)
- `~` (NOT per bit)
- `>>` (geser ke kanan)
- `<<` (geser ke kiri)

Misalnya:

```swift
let a = 6  // biner 110
let b = 3  // biner 011

print(a & b) // 2 (biner 010)
print(a | b) // 7 (biner 111)
print(a ^ b) // 5 (biner 101)
print(~a)    // -7 (negasi bitwise)
```

Di Swift, bilangan bulat direpresentasikan dalam bentuk komplemen dua biner, sehingga setelah dilakukan negasi akan menghasilkan bilangan negatif yang sesuai.

Operator bitwise langsung bekerja pada representasi biner, dan biasanya digunakan untuk pemrosesan data level bawah atau skenario optimasi performa.

Bagi pemula, skenario penggunaan operator semacam ini relatif sedikit, dan dalam pengembangan iOS atau SwiftUI umum operator ini juga tidak terlalu sering muncul, sehingga di sini kita tidak akan membahasnya secara mendalam.

Jika nanti bersentuhan dengan logika level bawah atau optimasi performa, kamu bisa mempelajarinya lebih lanjut secara khusus.
