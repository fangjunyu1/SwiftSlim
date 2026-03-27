# Celengan

Di pelajaran ini, kita akan mengembangkan proyek “celengan” sederhana. Fungsinya sederhana, tetapi mencakup logika interaksi yang lengkap, sehingga sangat cocok untuk pemula.

Melalui proyek ini, kita akan mempelajari `TextField` (kotak input), `border`, dan memahami data binding (`$`).

Target akhirnya adalah mewujudkan proyek “celengan” yang dapat memasukkan nominal, lalu saat tombol ditekan nominal tersebut disimpan dan ditambahkan ke jumlah total.

Hasil yang dicapai:

![Piggy Bank](../../RESOURCE/014_view.png)

## Menampilkan jumlah total

Pertama, kita perlu menampilkan jumlah total di “celengan” pada view.

Di `ContentView`, deklarasikan sebuah variabel untuk menyimpan jumlah total di “celengan”.

```swift
@State private var amount = 0
```

Lalu gunakan `Text` untuk menampilkan jumlah tersebut:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Di sini, kita menggunakan `.font` dan `.fontWeight` untuk mengatur ukuran dan ketebalan font.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Ketika `amount` berubah, jumlah total yang ditampilkan oleh `Text` juga akan diperbarui secara otomatis.

## Memasukkan nominal

Selain menampilkan jumlah total, “celengan” juga perlu memungkinkan pengguna untuk “memasukkan” nominal uang yang ingin disimpan atau diambil. Untuk itu, kita perlu menggunakan kontrol view SwiftUI bernama `TextField`.

### TextField

`TextField` adalah kontrol view di SwiftUI yang digunakan untuk memasukkan konten, dan biasanya dipakai untuk input satu baris.

`TextField` terutama menyediakan dua format binding:

**1. Binding ke tipe string (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Cocok untuk input teks seperti nama, judul, dan sebagainya.

**2. Binding ke tipe numerik (`Int` / `Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Cocok untuk input angka seperti umur, gaji, atau nominal uang.

`format: .number` berarti kotak input ini akan mem-parsing dan menampilkan isi berdasarkan “format angka”.

#### Placeholder teks

Parameter pertama `TextField` adalah placeholder, yang digunakan untuk memberi petunjuk tentang isi yang harus dimasukkan:

```swift
TextField("input your name", text: $text)
```

Saat kotak input kosong, akan muncul teks petunjuk berwarna abu-abu.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

`TextField` tidak bertanggung jawab menyimpan isi input secara persisten. Data perlu dikelola melalui variabel yang dibinding.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Isi yang dimasukkan pengguna akan langsung disimpan ke variabel `text`, sedangkan `TextField` hanya bertanggung jawab pada antarmuka input.

`$` berarti binding:

```swift
$text
```

Ini bukan variabel biasa, melainkan sebuah tipe `Binding`.

Fungsinya adalah membangun koneksi antara view dan data:

Saat pengguna mengetik di `TextField`, nilai `text` akan otomatis diperbarui; dan ketika `text` berubah, `TextField` juga akan ikut diperbarui.

Misalnya:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Saat mengetik di `TextField`, `Text` di atasnya akan menampilkan isi secara sinkron dan real-time.

![textField](../../RESOURCE/014_textfield1.png)

### Binding ke tipe angka

Ketika perlu memasukkan angka, kita harus membinding variabel dengan tipe yang sesuai:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Saat pengguna memasukkan nominal, `TextField` akan mem-parsing isi input dan otomatis memperbarui nilai `number`.

## Menambahkan kotak input

Setelah memahami penggunaan dasar `TextField`, sekarang kita terapkan ke proyek “celengan”.

Karena “celengan” perlu memasukkan “nominal”, kita memakai cara “binding ke tipe numerik (`Int` / `Double`)”, dan menambahkan variabel `number` untuk menyimpan nominal yang dimasukkan pengguna:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Sekarang `TextField` secara default menampilkan nilai `number` (default-nya adalah 0).

Ketika isi input dihapus, placeholder “Amount” akan ditampilkan.

Ini juga sekali lagi menunjukkan bahwa `TextField` menampilkan nilai dari variabel yang dibinding, bukan menyimpan kontennya sendiri.

### Masalah ukuran kotak input

Di view saat ini, kita akan melihat bahwa `TextField` tidak memiliki border, hanya menampilkan angka 0, dan isinya tampak rata kiri.

Efeknya seperti berikut:

![textfield](../../RESOURCE/014_textfield2.png)

Ini karena secara default `TextField` akan mengambil seluruh lebar parent view.

Kita bisa memverifikasinya dengan menambahkan warna latar belakang:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efeknya seperti berikut:

![textfield](../../RESOURCE/014_textfield3.png)

Kita bisa melihat bahwa `TextField` sebenarnya memenuhi seluruh lebar satu baris.

### Mengatur lebar tetap

Jika kita ingin kotak input terlihat lebih ringkas, kita bisa menggunakan `frame` untuk membatasi lebarnya:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Efeknya seperti berikut:

![textfield](../../RESOURCE/014_textfield4.png)

### Menambahkan border dan padding internal

Karena secara default `TextField` tidak memiliki border, kita bisa menambahkan gaya secara manual:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Sekarang kotak input ini terlihat lebih seperti “input field standar”.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

Di SwiftUI, `border` digunakan untuk menambahkan garis tepi pada view.

Penggunaan dasar:

```swift
border(Color.black, width: 1)
```

Di sini, `Color.black` berarti warna border, dan `width` berarti ketebalannya.

Pada `TextField`, kita menggunakan:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Ini berarti menambahkan border hitam dengan ketebalan `1 pt` pada kotak input.

Kita juga bisa mencoba warna lain, misalnya `Color.blue`, `Color.green`, atau mempertebal border dengan `width: 2`.

## Tombol menabung

Sekarang kita sudah memiliki variabel `amount` untuk menampilkan jumlah total, `TextField` untuk memasukkan nominal, dan variabel `number` yang dibinding ke kotak input.

Kode saat ini adalah:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Menambahkan tombol

Sekarang kita perlu menambahkan sebuah tombol untuk memicu aksi menabung.

```swift
Button("Save") {
    
}
```

### Mewujudkan logika menabung

Kita ingin mewujudkan efek bahwa pengguna memasukkan nominal, lalu saat tombol ditekan, nominal tersebut otomatis ditambahkan ke jumlah total.

```swift
Button("Save") {
    amount += number
}
```

Di sini kita menggunakan “operator assignment gabungan”, untuk menambahkan nominal yang dimasukkan pengguna (`number`) ke jumlah total (`amount`).

### Mereset nominal input

Sekarang ada satu masalah: setiap kali tombol ditekan, nominal di dalam kotak input tidak akan kosong kembali.

Jika pengguna memasukkan 10 lalu menekan simpan, angka 10 masih tetap ada di kotak input, sehingga akan memengaruhi nominal tabungan berikutnya.

Ini karena `TextField` dibinding ke `number`. Saat tombol ditekan, kita hanya mengubah `amount`, sedangkan `number` tidak berubah, sehingga kotak input tetap menampilkan nilai lama.

Karena itu, kita perlu menambahkan logika pembersihan. Saat tombol ditekan, setelah nominal ditambahkan ke total tabungan, nominal input perlu direset:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Sekarang, saat pengguna memasukkan nominal dan menekan tombol, nominal tersebut akan ditambahkan ke total tabungan. `number` direset menjadi 0 agar siap untuk input berikutnya.

Dengan ini, seluruh logika menabung pada “celengan” telah selesai diwujudkan.

## Mengoptimalkan view

Setelah fungsinya selesai, kita bisa melakukan optimasi sederhana pada antarmuka, misalnya menambahkan gambar background dan gaya tombol.

Menambahkan gaya tombol:

```swift
.buttonStyle(.borderedProminent)
```

Menambahkan gambar background:

```swift
.background {
    Image("1")
}
```

Sekarang, kita telah menyelesaikan seluruh proses pengembangan “celengan”.

## Kode lengkap

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Hasil yang dicapai:

![Piggy Bank](../../RESOURCE/014_view.png)

Sekarang kita bisa mencoba menabung 100 atau lebih banyak, untuk memeriksa apakah logika “celengan” memiliki masalah.

Atau jalankan “celengan” ini di simulator atau perangkat fisik untuk merasakan aplikasi “celengan” yang kita kembangkan sendiri.

### Output debug

Untuk memverifikasi apakah logikanya benar, kita juga bisa menambahkan logika debug di dalam tombol, untuk mengecek apakah nominal input sudah benar:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Setiap kali menabung dan menekan tombol, kita akan melihat output debug yang sesuai, sehingga dapat memeriksa apakah ada masalah pada logika kode.

```
---Saving---
amount:11
number:0
```
