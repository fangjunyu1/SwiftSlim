# Kad Kursus

Pelajaran ini ialah pelajaran ulang kaji peringkat. Kita akan menyiapkan satu “kad kursus”.

Melalui latihan ini, kita boleh mengulang kaji `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` dan kandungan lain yang telah dipelajari sebelum ini, serta belajar cara menggabungkan beberapa pandangan kecil menjadi satu modul pandangan yang lengkap.

Kesan kad kursus:

![view](../../../Resource/026_view.png)

Kad kursus ini terutamanya mengandungi beberapa bahagian:

- Tahap kursus: `Beginner`
- Kandungan kursus: `20+ Lessons`
- Tajuk kursus: `SwiftUI Beginner Tutorial`
- Penerangan kursus
- Butang: `Start Learning`
- Latar belakang kursus: ikon Swift dan latar belakang indigo

Kita boleh menyiapkan pandangan ini dalam `ContentView`.

## Kawasan Atas

Mula-mula, bina kawasan atas kad kursus.

![view](../../../Resource/026_view1.png)

Bahagian kiri kawasan atas memaparkan tahap kursus, manakala bahagian kanan memaparkan kandungan kursus.

Oleh sebab kedua-dua kandungan ini disusun secara mendatar, kita boleh menggunakan `HStack`.

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

Di sini, kita memisahkan kawasan atas menjadi satu computed property:

```swift
var topView: some View
```

Kelebihan cara ini ialah ia menjadikan `body` lebih jelas.

Kawasan atas terutamanya menggunakan kandungan berikut:

- `HStack`: menyusun dua teks secara mendatar.
- `Text`: memaparkan kandungan teks.
- `Spacer()`: menolak teks kiri ke kiri dan teks kanan ke kanan.
- `.font(.footnote)`: menetapkan gaya teks yang lebih kecil.
- `.fontWeight(.bold)`: menjadikan teks tebal.
- `.foregroundStyle(Color.white)`: menetapkan warna hadapan kepada putih.
- `.padding(.vertical, 10)`: menetapkan padding menegak.
- `.padding(.horizontal, 16)`: menetapkan padding mendatar.
- `.background(Color.white.opacity(0.15))`: menetapkan latar belakang putih lut sinar.
- `.cornerRadius(20)`: menetapkan jejari bucu.

Di sini, `Beginner` menggunakan `.padding()` dalam dua arah:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Ini memberikan ruang kepada teks pada arah atas bawah dan kiri kanan, supaya kelihatan lebih seperti satu tag.

`Color.white.opacity(0.15)` bermaksud putih dengan kelegapan `15%`, iaitu putih yang sangat lembut.

### Tambah Latar Belakang Kad

Sebelum ini, kita telah mencipta `topView`, tetapi hanya mencipta pandangan tidak akan memaparkannya secara automatik.

Dalam SwiftUI, kandungan yang benar-benar dipaparkan pada skrin perlu ditulis dalam `body`.

Jadi, kita boleh meletakkan `topView` ke dalam `body` terlebih dahulu untuk memaparkannya:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Pada ketika ini, kawasan atas sudah dipaparkan:

![view](../../../Resource/026_view2.png)

Namun, kerana teks dalam `topView` berwarna putih dan latar belakang lalai juga cerah, ia mungkin tidak begitu jelas dalam mod cerah.

Oleh itu, kita boleh menambah satu `VStack` di luar, kemudian menetapkan padding, warna latar belakang dan jejari bucu untuk keseluruhan kawasan:

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

Kesan paparan:

![view](../../../Resource/026_view3.png)

`VStack` di sini buat masa ini hanya mengandungi satu `topView`, jadi ia mungkin kelihatan seperti tidak diperlukan.

Tetapi selepas ini, kita masih akan menambah tajuk kursus, penerangan kursus dan kawasan butang. Semua kandungan ini disusun secara menegak, jadi menggunakan `VStack` lebih awal di sini akan memudahkan kita terus menggabungkan pandangan kemudian.

Di sini terdapat dua `.padding()`, dan fungsinya berbeza.

`.padding(20)` yang pertama ditulis sebelum `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Ia mengawal padding dalaman kad, iaitu jarak antara kandungan dengan tepi latar belakang.

`.padding(30)` yang kedua ditulis selepas `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ia mengawal padding luaran kad, iaitu jarak antara seluruh kad dengan tepi skrin.

![view](../../../Resource/026_view4.png)

Jadi, walaupun kedua-duanya ialah `.padding()`, meletakkannya pada posisi yang berbeza akan menghasilkan kesan yang berbeza.

## Kawasan Kandungan

Seterusnya, bina kawasan kandungan kad kursus.

Kesan paparan:

![view](../../../Resource/026_view5.png)

Kawasan kandungan mengandungi tajuk kursus dan penerangan kursus. Kedua-duanya disusun secara menegak, jadi kita menggunakan `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial SwiftUI untuk Pemula")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Mula dari sifar dengan SwiftUI dan pelajari pembangunan UI deklaratif Apple secara sistematik. Melalui penerangan yang jelas dan contoh praktikal, anda akan menguasai reka letak, interaksi dan pengurusan keadaan secara beransur-ansur untuk membina antara muka app yang cantik dan berguna.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Kesan paparan:

![view](../../../Resource/026_view6.png)

Dua parameter digunakan dalam `VStack` ini:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` bermaksud pandangan di dalam `VStack` dijajarkan ke tepi leading.

`spacing: 10` bermaksud pandangan di dalam `VStack` mengekalkan jarak `10 pt` antara satu sama lain.

Jadi, tajuk kursus dan penerangan kursus akan bermula dari sebelah kiri, dan terdapat jarak tertentu antara kedua-duanya.

Penerangan kursus agak panjang. Jika semuanya dipaparkan, kad akan menjadi sangat tinggi, jadi di sini kita menggunakan `.lineLimit()` untuk mengehadkan bilangan baris yang dipaparkan:

```swift
.lineLimit(3)
```

Ini bermaksud paling banyak `3` baris akan dipaparkan. Apabila kandungan melebihi had baris, bahagian tambahan akan diabaikan.

### Jajarkan Pandangan ke Kiri

Di sini ada satu lagi perkara yang perlu diperhatikan.

`VStack(alignment: .leading)` hanya boleh mengawal penjajaran pandangan di dalam `VStack`. Ia tidak secara langsung mengawal posisi `VStack` itu sendiri dalam bekas luaran.

Sebagai contoh, jika penerangan kursus agak pendek:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial SwiftUI untuk Pemula")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Sedikit kandungan.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Kesan paparan:

![view](../../../Resource/026_view7.png)

Kita dapat melihat bahawa walaupun tajuk kursus dan penerangan kursus dijajarkan ke kiri di dalam `VStack`, keseluruhan `VStack` tidak melekat pada tepi paling kiri kad.

Ini kerana apabila kandungan pendek, lebar `VStack` juga menjadi agak sempit. Apabila bekas luar menyusun kandungannya, ia mungkin meletakkan `VStack` yang lebih sempit ini di tengah.

Kita boleh memahaminya begini: `VStack(alignment: .leading)` bertanggungjawab untuk penjajaran kiri dalaman.
Tetapi ia tidak bertanggungjawab untuk menolak keseluruhan kawasan kandungan ke paling kiri.

Jika kita mahu keseluruhan kawasan kandungan benar-benar dijajarkan ke kiri, kita boleh membungkusnya dengan satu lagi `HStack` dan menambah `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial SwiftUI untuk Pemula")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Sedikit kandungan.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Kesan paparan:

![view](../../../Resource/026_view8.png)

`HStack` di sini ialah susun atur mendatar.

`Spacer()` akan memenuhi ruang baki di sebelah kanan, lalu menolak `VStack` di sebelah kiri ke paling kiri.

Oleh itu, `HStack + Spacer()` boleh digunakan untuk mengawal posisi keseluruhan kawasan kandungan.

Dalam kad kursus sebenar, penerangan kursus agak panjang dan biasanya memenuhi lebar yang lebih besar, jadi masalah ini mungkin tidak begitu jelas. Tetapi memahami perbezaan ini penting, kerana situasi serupa sering muncul kemudian apabila membuat susun atur teks pendek.

### Kawal Jarak Antara Pandangan Dalaman

Sebelum ini, kita menulis `spacing: 10` dalam `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` digunakan untuk mengawal jarak antara pandangan dalaman.

Jika `spacing` tidak ditetapkan, `VStack` juga mempunyai jarak lalai, tetapi jarak lalai itu mungkin tidak sepadan dengan kesan yang kita mahu.

Di sini, jika tajuk kursus dan penerangan kursus terlalu rapat, susun atur akan kelihatan sesak, jadi kita menggunakan:

```swift
spacing: 10
```

Ini mengekalkan sedikit ruang antara kedua-duanya.

Kesan paparan:

![view](../../../Resource/026_view9.png)

Begitu juga, kawasan atas dan kawasan kandungan juga disusun secara menegak, jadi `spacing` juga boleh digunakan untuk mengawal jarak antara kedua-duanya.

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

Kesan paparan:

![view](../../../Resource/026_view10.png)

Di sini, `VStack(spacing: 20)` mengawal jarak antara `topView` dan `contentView`.

Dengan kata lain:

```swift
VStack(alignment: .leading, spacing: 10)
```

Mengawal jarak antara tajuk kursus dan penerangan kursus.

```swift
VStack(spacing: 20)
```

Mengawal jarak antara kawasan atas dan kawasan kandungan.

Kedua-duanya ialah `spacing`, tetapi ia bertindak pada bekas `VStack` yang berbeza, jadi julat yang terkesan juga berbeza.

Dengan ini, pandangan kawasan kandungan sudah siap.

## Kawasan Butang

Seterusnya, bina kawasan butang bawah.

Kesan paparan:

![view](../../../Resource/026_view11.png)

Kawasan butang terutamanya terdiri daripada satu ikon main dan satu teks.

Kita boleh menggunakan `Image` untuk memaparkan ikon main, dan menggunakan `Text` untuk memaparkan teks butang.

Di sini, mula-mula bina rupa butang:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("butang diklik")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Mula Belajar")
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

Kesan paparan:

![view](../../../Resource/026_view12.png)

Dua `HStack` digunakan di sini:

`HStack` di bahagian dalam digunakan untuk menyusun ikon dan teks secara mendatar:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Mula Belajar")
}
```

`HStack` di bahagian luar, bersama-sama dengan `Spacer()`, digunakan untuk menjadikan rupa butang sejajar ke kiri:

```swift
HStack {
    ...
    Spacer()
}
```

Apabila butang diketuk, konsol akan mengeluarkan `butang diklik`.

## Kad Asas Selesai

Sekarang, gabungkan kawasan atas, kawasan kandungan dan kawasan butang:

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

Kesan paparan:

![view](../../../Resource/026_view13.png)

Setakat ini, satu kad kursus asas sudah selesai.

## Latar Belakang Ikon Swift

Akhir sekali, tambah latar belakang ikon Swift yang lut sinar pada kad.

![view](../../../Resource/026_view.png)

Sebelum ini, kita menggunakan `Color.indigo` sebagai warna latar belakang. Sebenarnya, selain menambah warna, `.background()` juga boleh menambah satu pandangan lengkap.

Jadi, kita boleh mencipta satu pandangan latar belakang khusus terlebih dahulu:

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

Dalam pandangan latar belakang ini, kita menggunakan `VStack`, `HStack` dan `Spacer()` untuk menolak ikon Swift ke sudut kanan bawah.

Kerana ikon Swift hanya digunakan sebagai latar belakang hiasan, putih lut sinar digunakan di sini:

```swift
Color.white.opacity(0.15)
```

Dengan cara ini, ikon tidak akan terlalu menonjol dan tidak akan mengganggu kandungan teks di hadapan.

Seterusnya, tambah `backgroundView` ke dalam kad:

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

Kesan akhir:

![view](../../../Resource/026_view14.png)

Di sini, dua `.background()` digunakan secara berturut-turut:

```swift
.background(backgroundView)
.background(Color.indigo)
```

`.background()` pertama digunakan untuk menambah latar belakang ikon Swift.
`.background()` kedua digunakan untuk menambah latar belakang indigo.

Dengan ini, ikon Swift akan dipaparkan di atas latar belakang indigo dan menjadi sebahagian daripada latar belakang kad.

Daripada sini, kita dapat melihat bahawa `.background()` bukan sahaja boleh menambah warna, tetapi juga boleh menambah pandangan tersuai. Beberapa `.background()` juga boleh digabungkan untuk menghasilkan kesan latar belakang yang lebih kaya.

Setakat ini, satu kad kursus yang lengkap sudah selesai.

## Ringkasan

Dalam pelajaran ini, kita mengulang kaji kaedah susun atur asas yang biasa digunakan dalam SwiftUI melalui satu kad kursus.

Kita menggunakan `Text` untuk memaparkan teks, `Image` untuk memaparkan ikon sistem, dan `VStack`, `HStack` serta `Spacer()` untuk mengawal susunan pandangan.

Kita mempelajari `.lineLimit()`, yang boleh mengehadkan bilangan maksimum baris yang dipaparkan oleh teks. Apabila kandungan melebihi had, bahagian tambahan akan diabaikan.

Pada masa yang sama, kita juga mengulang kaji modifier biasa seperti `.padding()`, `.background()`, `.cornerRadius()` dan `.foregroundStyle()`.

Selepas menyiapkan pelajaran ini, kita sudah boleh menggabungkan beberapa pandangan kecil menjadi satu modul kad yang lengkap.

Ini juga merupakan pendekatan yang sangat biasa dalam pembangunan SwiftUI: pisahkan pandangan kepada bahagian kecil dahulu, kemudian gabungkannya menjadi antara muka yang lengkap.

## Kod Lengkap

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
                Text("Tutorial SwiftUI untuk Pemula")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Mula dari sifar dengan SwiftUI dan pelajari pembangunan UI deklaratif Apple secara sistematik. Melalui penerangan yang jelas dan contoh praktikal, anda akan menguasai reka letak, interaksi dan pengurusan keadaan secara beransur-ansur untuk membina antara muka app yang cantik dan berguna.")
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
    	        print("butang diklik")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Mula Belajar")
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
