# Kartu Kursus

Pelajaran ini adalah pelajaran tinjauan tahap. Kita akan membuat sebuah “kartu kursus”.

Melalui latihan ini, kita dapat meninjau kembali materi yang sudah dipelajari sebelumnya, seperti `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, dan lainnya, serta mempelajari cara menggabungkan beberapa tampilan kecil menjadi satu modul tampilan yang lengkap.

Efek kartu kursus:

![view](../../../Resource/026_view.png)

Kartu kursus ini terutama terdiri dari beberapa bagian:

- Tingkat kursus: `Pemula`
- Isi kursus: `20+ Pelajaran`
- Judul kursus: `Tutorial Pemula SwiftUI`
- Deskripsi kursus
- Tombol: `Mulai Belajar`
- Latar belakang kursus: ikon Swift dan latar belakang warna indigo

Kita dapat menyelesaikan tampilan ini di dalam `ContentView`.

## Area Atas

Pertama, buat area atas kartu kursus.

![view](../../../Resource/026_view1.png)

Sisi kiri area atas menampilkan tingkat kursus, dan sisi kanan menampilkan isi kursus.

Karena kedua konten ini disusun secara horizontal, kita dapat menggunakan `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Pemula")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ Pelajaran")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Di sini kita memecah area atas menjadi sebuah properti terhitung:

```swift
var topView: some View
```

Keuntungannya adalah membuat `body` lebih jelas.

Area atas terutama menggunakan beberapa hal berikut:

- `HStack`: membuat dua teks tersusun secara horizontal.
- `Text`: menampilkan konten teks.
- `Spacer()`: mendorong teks kiri ke sisi kiri dan teks kanan ke sisi kanan.
- `.font(.footnote)`: mengatur gaya teks yang lebih kecil.
- `.fontWeight(.bold)`: mengatur teks menjadi tebal.
- `.foregroundStyle(Color.white)`: mengatur warna latar depan menjadi putih.
- `.padding(.vertical, 10)`: mengatur padding atas dan bawah.
- `.padding(.horizontal, 16)`: mengatur padding kiri dan kanan.
- `.background(Color.white.opacity(0.15))`: mengatur latar belakang putih semi-transparan.
- `.cornerRadius(20)`: mengatur sudut membulat.

Di sini `Pemula` menggunakan `.padding()` pada dua arah:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Dengan begitu, teks memiliki ruang di atas, bawah, kiri, dan kanan, sehingga terlihat lebih seperti sebuah label.

`Color.white.opacity(0.15)` berarti warna putih dengan opasitas `15%`, yaitu warna putih yang sangat tipis.

### Menambahkan Latar Belakang Kartu

Sebelumnya kita telah membuat `topView`, tetapi membuat tampilan saja tidak akan otomatis menampilkannya.

Di SwiftUI, konten yang benar-benar tampil di antarmuka perlu ditulis di dalam `body`.

Jadi, kita dapat terlebih dahulu meletakkan `topView` di dalam `body` untuk ditampilkan:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Saat ini, area atas sudah terlihat:

![view](../../../Resource/026_view2.png)

Namun, karena teks di dalam `topView` berwarna putih, sedangkan latar belakang default juga terang, teks mungkin tidak terlalu mudah terlihat dalam mode terang.

Karena itu, kita dapat menambahkan sebuah `VStack` di lapisan luar, lalu memberi seluruh area padding, warna latar belakang, dan sudut membulat:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Efek tampilan:

![view](../../../Resource/026_view3.png)

Saat ini `VStack` ini hanya berisi satu `topView`, sehingga terlihat seolah-olah tidak wajib.

Namun nanti kita akan terus menambahkan judul kursus, deskripsi kursus, dan area tombol. Semua konten itu disusun dari atas ke bawah, jadi menggunakan `VStack` lebih awal akan memudahkan penggabungan tampilan berikutnya.

Di sini ada dua `.padding()`, dan perannya berbeda.

`.padding(20)` pertama ditulis sebelum `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Itu mengontrol jarak bagian dalam kartu, yaitu jarak antara konten dan tepi latar belakang.

`.padding(30)` kedua ditulis setelah `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Itu mengontrol jarak bagian luar kartu, yaitu jarak antara seluruh kartu dan tepi layar.

![view](../../../Resource/026_view4.png)

Jadi, meskipun sama-sama `.padding()`, jika ditulis di posisi yang berbeda, efeknya juga berbeda.

## Area Konten

Selanjutnya, buat area konten kartu kursus.

Efek tampilan:

![view](../../../Resource/026_view5.png)

Area konten berisi judul kursus dan deskripsi kursus. Keduanya disusun dari atas ke bawah, jadi gunakan `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial Pemula SwiftUI")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Mulai dari nol dengan SwiftUI dan pelajari pengembangan UI deklaratif Apple secara sistematis. Melalui penjelasan yang jelas dan contoh praktis, Anda akan secara bertahap menguasai layout, interaksi, dan manajemen state untuk membangun antarmuka app yang indah dan berguna.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efek tampilan:

![view](../../../Resource/026_view6.png)

`VStack` di sini menggunakan dua parameter:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` berarti membuat tampilan di dalam `VStack` rata kiri.

`spacing: 10` berarti menjaga jarak `10 pt` antar tampilan di dalam `VStack`.

Jadi, judul kursus dan deskripsi kursus akan mulai tersusun dari sisi kiri, dan ada jarak tertentu di antara keduanya.

Deskripsi kursus cukup panjang. Jika semuanya ditampilkan, kartu akan menjadi sangat tinggi, jadi di sini kita menggunakan `.lineLimit()` untuk membatasi jumlah baris yang ditampilkan:

```swift
.lineLimit(3)
```

Itu berarti paling banyak menampilkan `3` baris. Jika konten melebihi jumlah baris tersebut, bagian yang berlebih akan disingkat.

### Meratakan Tampilan ke Kiri

Di sini masih ada satu hal yang perlu diperhatikan.

`VStack(alignment: .leading)` hanya dapat mengontrol cara tampilan di dalam `VStack` disejajarkan. Ia tidak langsung mengontrol posisi `VStack` itu sendiri di dalam kontainer luar.

Misalnya, jika deskripsi kursus cukup pendek:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial Pemula SwiftUI")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Hanya beberapa konten.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efek tampilan:

![view](../../../Resource/026_view7.png)

Kita dapat melihat bahwa judul kursus dan deskripsi kursus memang rata kiri di dalam `VStack`, tetapi keseluruhan `VStack` tidak menempel ke sisi paling kiri kartu.

Ini karena ketika kontennya pendek, lebar `VStack` juga menjadi lebih sempit. Saat kontainer luar melakukan layout, ia mungkin menempatkan `VStack` yang sempit ini di tengah.

Bisa dipahami seperti ini: `VStack(alignment: .leading)` bertanggung jawab untuk perataan kiri di bagian dalam.
Tetapi ia tidak bertanggung jawab untuk mendorong seluruh area konten ke sisi paling kiri.

Jika ingin seluruh area konten benar-benar berada di kiri, kita dapat membungkusnya lagi dengan `HStack`, lalu menambahkan `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial Pemula SwiftUI")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Hanya beberapa konten.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efek tampilan:

![view](../../../Resource/026_view8.png)

`HStack` di sini adalah layout horizontal.

`Spacer()` akan mengambil ruang kosong di sisi kanan, sehingga mendorong `VStack` di sisi kiri ke paling kiri.

Karena itu, `HStack + Spacer()` dapat digunakan untuk mengontrol posisi seluruh area konten.

Dalam kartu kursus yang sebenarnya, deskripsi kursus cukup panjang dan biasanya akan menempati lebar yang lebih besar, jadi masalah ini belum tentu terlihat jelas. Namun, memahami perbedaannya penting, karena saat membuat layout teks pendek nanti, situasi serupa sering ditemui.

### Mengontrol Jarak Antar Tampilan Internal

Sebelumnya kita menulis `spacing: 10` di dalam `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` digunakan untuk mengontrol jarak antar tampilan internal.

Jika `spacing` tidak diatur, `VStack` juga memiliki jarak default, tetapi jarak default itu belum tentu sesuai dengan efek yang kita inginkan.

Di sini, jika judul kursus dan deskripsi kursus terlalu dekat, tampilannya akan terasa padat, jadi gunakan:

```swift
spacing: 10
```

agar ada sedikit ruang di antara keduanya.

Efek tampilan:

![view](../../../Resource/026_view9.png)

Demikian juga, area atas dan area konten juga disusun dari atas ke bawah, sehingga `spacing` juga dapat digunakan untuk mengontrol jarak di antara keduanya.

Sekarang, letakkan `topView` dan `contentView` ke dalam `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efek tampilan:

![view](../../../Resource/026_view10.png)

`VStack(spacing: 20)` di sini mengontrol jarak antara `topView` dan `contentView`.

Dengan kata lain:

```swift
VStack(alignment: .leading, spacing: 10)
```

mengontrol jarak antara judul kursus dan deskripsi kursus.

```swift
VStack(spacing: 20)
```

mengontrol jarak antara area atas dan area konten.

Keduanya sama-sama `spacing`, tetapi bekerja pada `VStack` yang berbeda, sehingga cakupan pengaruhnya juga berbeda.

Dengan begitu, tampilan area konten sudah selesai.

## Area Tombol

Selanjutnya, buat area tombol di bagian bawah.

Efek tampilan:

![view](../../../Resource/026_view11.png)

Area tombol terutama terdiri dari sebuah ikon putar dan satu teks.

Kita dapat menggunakan `Image` untuk menampilkan ikon putar, dan menggunakan `Text` untuk menampilkan teks tombol.

Di sini, buat terlebih dahulu tampilan tombol:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("klik tombol")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Mulai Belajar")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Efek tampilan:

![view](../../../Resource/026_view12.png)

Di sini digunakan dua `HStack`:

`HStack` bagian dalam digunakan untuk menyusun ikon dan teks secara horizontal:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Mulai Belajar")
}
```

`HStack` bagian luar bekerja bersama `Spacer()` untuk membuat tampilan tombol ini berada di kiri:

```swift
HStack {
    ...
    Spacer()
}
```

Saat tombol diklik, konsol akan menampilkan `klik tombol`.

## Kartu Dasar Selesai

Sekarang, gabungkan area atas, area konten, dan area tombol:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efek tampilan:

![view](../../../Resource/026_view13.png)

Sampai di sini, sebuah kartu kursus dasar sudah selesai.

## Latar Belakang Ikon Swift

Terakhir, kita tambahkan latar belakang ikon Swift semi-transparan ke kartu.

![view](../../../Resource/026_view.png)

Sebelumnya kita menggunakan `Color.indigo` sebagai warna latar belakang. Sebenarnya, selain menambahkan warna, `.background()` juga dapat menambahkan sebuah tampilan lengkap.

Jadi, kita dapat membuat terlebih dahulu tampilan latar belakang khusus:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Di dalam tampilan latar belakang ini, kita menggunakan `VStack`, `HStack`, dan `Spacer()` untuk mendorong ikon Swift ke sudut kanan bawah.

Karena ikon Swift hanya digunakan sebagai dekorasi latar belakang, di sini kita menggunakan warna putih semi-transparan:

```swift
Color.white.opacity(0.15)
```

Dengan begitu, ikon tidak terlalu menonjol dan tidak mengganggu konten teks di depan.

Selanjutnya, tambahkan `backgroundView` ke dalam kartu:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efek yang dihasilkan:

![view](../../../Resource/026_view14.png)

Di sini digunakan dua `.background()` secara berurutan:

```swift
.background(backgroundView)
.background(Color.indigo)
```

`.background()` pertama digunakan untuk menambahkan latar belakang ikon Swift.
`.background()` kedua digunakan untuk menambahkan latar belakang warna indigo.

Dengan begitu, ikon Swift akan tampil di atas latar belakang warna indigo, dan ditampilkan sebagai bagian dari latar belakang kartu.

Dari sini dapat dilihat bahwa selain menambahkan warna, `.background()` juga dapat menambahkan tampilan kustom. Beberapa `.background()` juga dapat digabungkan, sehingga menghasilkan efek latar belakang yang lebih kaya.

Sampai di sini, sebuah kartu kursus lengkap sudah selesai.

## Ringkasan

Dalam pelajaran ini, melalui sebuah kartu kursus, kita meninjau kembali beberapa cara layout dasar yang umum digunakan di SwiftUI.

Kita menggunakan `Text` untuk menampilkan teks, menggunakan `Image` untuk menampilkan ikon sistem, serta menggunakan `VStack`, `HStack`, dan `Spacer()` untuk mengontrol susunan tampilan.

Kita mempelajari `.lineLimit()`, yang dapat membatasi jumlah baris maksimum yang ditampilkan oleh teks. Saat konten melebihi batas, bagian yang berlebih akan disingkat.

Pada saat yang sama, kita juga meninjau kembali modifier umum seperti `.padding()`, `.background()`, `.cornerRadius()`, dan `.foregroundStyle()`.

Setelah menyelesaikan pelajaran ini, kita sudah dapat menggabungkan beberapa tampilan kecil menjadi sebuah modul kartu yang lengkap.

Ini juga merupakan pola pikir yang sangat umum dalam pengembangan SwiftUI: pertama memecah tampilan kecil, lalu menggabungkannya menjadi antarmuka yang lengkap.

## Kode Lengkap

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Pemula")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ Pelajaran")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial Pemula SwiftUI")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Mulai dari nol dengan SwiftUI dan pelajari pengembangan UI deklaratif Apple secara sistematis. Melalui penjelasan yang jelas dan contoh praktis, Anda akan secara bertahap menguasai layout, interaksi, dan manajemen state untuk membangun antarmuka app yang indah dan berguna.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("klik tombol")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Mulai Belajar")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
