# Membina halaman resume peribadi

Dalam pelajaran ini, kita akan membuat satu view resume peribadi yang ringkas, dan mempelajari pengetahuan berikut:

- cornerRadius
- spacing
- ScrollView

Dalam proses pembinaan, kita akan mengulang kaji susun atur, `Text`, `Image` dan pengetahuan lain, serta merealisasikan kawalan jarak dan kesan kandungan boleh ditatal.

## Resume peribadi

Kesan sasaran:

![Swift](../../RESOURCE/004_img.png)

**Sila cuba selesaikan secara berdikari dahulu, kemudian barulah terus membaca penerangan di bawah.**

### Mencipta projek

Cipta projek iOS baharu, atau teruskan menggunakan projek sebelumnya.

Kod `ContentView` lalai:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Sekarang kosongkan kod tersebut, dan mula menulis kandungan anda sendiri:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Struktur keseluruhan

Dalam pembangunan sebenar, kita biasanya akan mereka bentuk struktur keseluruhan terlebih dahulu.

Halaman kita mengandungi:

1. Tajuk
2. Maklumat peribadi
3. Pengenalan peribadi

Kita tambahkan satu `VStack` pada lapisan paling luar:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` boleh memastikan view disusun secara menegak, dan pada masa yang sama membolehkan kita mengawal susunan serta jarak antara view.

### Tajuk

Mula-mula, kita cipta satu `Text` untuk memaparkan tajuk.

Di sini, saya memaparkan tajuk sebagai nama Inggeris saya sendiri:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Biasanya tajuk dibesarkan dan ditebalkan. Di sini kita gunakan modifier `font` dan `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Tata letak

Dalam SwiftUI, penjajaran lalai ialah `center`, jadi kini tajuk dipaparkan di bahagian tengah `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Kita perlu memaparkan tajuk di bahagian atas view. Kita boleh menggunakan `Spacer` untuk melaraskan susun atur:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` akan mengambil ruang yang tinggal, lalu menolak `Text` ke bahagian atas bekas.

![Swift](../../RESOURCE/004_img4.png)

### Ruang kosong

Jika anda merasakan bahagian teks terlalu dekat dengan bahagian atas, anda boleh menggunakan `padding` atau `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Ini menetapkan jarak tepi atas `VStack` kepada 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Anda juga boleh menggunakan `Spacer`, kemudian menetapkan ketinggian `frame`, untuk mendapatkan ruang kosong dengan ketinggian tertentu.

Kesan akhir:

![Swift](../../RESOURCE/004_img5.png)

### Gambar

Kita sediakan satu gambar potret diri, lalu masukkannya ke dalam folder sumber `Assets`.

![Swift](../../RESOURCE/004_img6.png)

Gunakan `Image` dalam `ContentView` untuk memaparkan gambar:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Disebabkan saiz asal gambar agak besar, kita perlu menggunakan `frame` untuk mengawal saiz paparan.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Pada ketika ini kita akan mendapati satu masalah:

Jika nisbah lebar-tinggi `frame` tidak sepadan dengan nisbah asal gambar, gambar akan berubah bentuk.

Contohnya:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Untuk mengelakkan gambar berubah bentuk, kita perlu menggunakan `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Fungsi `scaledToFit` ialah:

Dalam julat `frame` yang diberikan, gambar akan diskalakan mengikut nisbah asalnya, dan kandungan gambar dipaparkan sepenuhnya.

Ia tidak akan memaksa gambar diregangkan untuk memenuhi keseluruhan `frame`, sebaliknya mengekalkan nisbah lebar-tinggi asal dan menskalakannya secara berkadaran sehingga salah satu sisi tepat menyentuh sempadan.

Ini bermakna:

- Jika lebar `frame` lebih kecil, gambar akan diskalakan berdasarkan lebar.
- Jika tinggi `frame` lebih kecil, gambar akan diskalakan berdasarkan tinggi.
- Gambar sentiasa mengekalkan nisbah asal dan tidak akan berubah bentuk.

Biasanya kita hanya perlu menetapkan saiz pada satu arah. Contohnya:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Dengan cara ini, sistem akan mengira tinggi yang sesuai secara automatik berdasarkan lebar 140, sambil mengekalkan nisbah gambar.

Jika anda perlu menetapkan nisbah visual yang tetap, atau mengelakkan gambar daripada dimampatkan dalam susun atur yang kompleks, anda juga boleh mengehadkan lebar dan tinggi serentak.

### Sudut bulat

Jika anda mahu gambar dipaparkan dalam bentuk bersudut bulat, anda boleh menggunakan modifier `cornerRadius`:

```swift
.cornerRadius(10)
```

Contohnya:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Tambahkan `cornerRadius(20)` selepas modifier bagi `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` bermaksud memotong sempadan view dan menggunakan jejari sudut bulat sebanyak 20.

Selepas menambah sudut bulat, empat bucu gambar akan menjadi bentuk lengkung, menjadikan kesan visual lebih lembut dan moden.

Gaya reka bentuk seperti ini sangat biasa dalam reka bentuk antara muka semasa. Sebagai contoh, ikon aplikasi iOS juga menggunakan bentuk segi empat tepat bersudut bulat（walaupun ikon sistem menggunakan superelips dengan kelengkungan berterusan, bukannya sudut bulat biasa）。

### Maklumat peribadi

Sekarang kita mula membina kawasan maklumat peribadi di sebelah kiri gambar. Daripada struktur antara muka, kita boleh lihat bahawa maklumat peribadi dan gambar disusun secara mendatar, jadi kita perlu menggunakan `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Kandungan maklumat peribadi pula disusun secara menegak.

![Swift](../../RESOURCE/004_img11.png)

Oleh itu, lapisan luar menggunakan `HStack`, maklumat peribadi menggunakan `VStack`, dan kandungan teks menggunakan `Text`.

Struktur asas:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Menebalkan tajuk medan**

Untuk membezakan nama medan dan nilai medan, kita boleh menggunakan `fontWeight` pada nama medan:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Penjajaran teks ke kiri**

Secara lalai `VStack` dijajarkan di tengah. Jika anda mahu semua teks dijajarkan ke kiri, anda perlu menetapkan penjajaran:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` bermaksud penjajaran mengikut sebelah kiri（dalam persekitaran bahasa dari kiri ke kanan）。

![Swift](../../RESOURCE/004_img14.png)

### Jarak

Jika anda mahu mengekalkan jarak tetap antara maklumat peribadi dan gambar, kaedah yang telah kita pelajari sebelum ini ialah menggunakan `Spacer` untuk mewujudkan ruang kosong:

```swift
Spacer()
    .frame(width: 10)
```

Kita juga boleh menggunakan parameter `spacing` bagi `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` bermaksud jarak antara dua subview ialah 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Apakah itu spacing?**

Dalam `VStack`、`HStack` dan `ZStack`, `spacing` boleh mengawal jarak antara subview.

Contohnya:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Jarak antara subview dalam `VStack` akan ditetapkan kepada 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Perlu diperhatikan bahawa `spacing` hanya berfungsi pada “subview langsung”, dan tidak akan mempengaruhi susun atur di dalam bekas bersarang.

**Mengawal jarak dalam senarai**

Jika anda mahu menambah jarak antara medan, cara yang paling langsung ialah menetapkan `spacing` pada `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Dengan ini, semua jarak antara subview akan menjadi 10 pt.

Namun apabila kita melihat antara muka, kita akan mendapati satu masalah:

Antara kumpulan medan memang ada jarak, tetapi antara nama medan dan nilai medan juga muncul jarak yang sama.

Ini kerana `spacing` berfungsi pada semua subview langsung dalam bekas semasa.

Dalam struktur ini, setiap `Text` ialah subview langsung bagi `VStack` luar, jadi jaraknya menjadi seragam.

Jika anda mahu ada jarak antara kumpulan medan, tetapi mengekalkan jarak rapat lalai antara nama medan dan nilai medan, anda boleh menganggap “nama medan + nilai medan” sebagai satu unit logik, lalu bungkusnya dengan `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Kini strukturnya menjadi: `VStack` luar mempunyai jarak antara kumpulan, manakala `VStack` dalam mengekalkan jarak rapat lalai. Oleh itu, tidak akan muncul jurang tambahan antara nama medan dan nilai medan.

![Swift](../../RESOURCE/004_img18.png)

### Pengenalan peribadi

Seterusnya kita membina kawasan pengenalan peribadi.

Daripada struktur antara muka, kandungan pengenalan terdiri daripada beberapa baris teks dan disusun secara menegak.

![Swift](../../RESOURCE/004_img19.png)

Oleh itu, kita boleh menggunakan `VStack` bersama `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Menambah jarak**

Sekarang bahagian maklumat peribadi dan pengenalan peribadi agak rapat, dan gaya paparan kelihatan kurang menarik.

![Swift](../../RESOURCE/004_img20.png)

Kerana kedua-duanya berada di dalam bekas luar yang sama, kita boleh mengawal jarak keseluruhan pada bekas luar:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Kesan akhir:

![Swift](../../RESOURCE/004_img21.png)

**Jarak senarai**

Gunakan `spacing` untuk menetapkan jarak antara teks-teks pengenalan peribadi:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Menyiapkan resume peribadi

Kini rangka asas resume peribadi kita telah siap.

![Swift](../../RESOURCE/004_img.png)

### Scroll view

Sekarang struktur halaman menggunakan `VStack`. Jika jumlah teks pengenalan sedikit, tiada masalah. Tetapi jika ditambah menjadi 20, 30 baris atau lebih, ketinggian kandungan akan melebihi skrin.

Contohnya:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Pada ketika ini, dua keadaan akan berlaku:

- kandungan di bahagian bawah dipotong
- halaman tidak boleh ditatal

Ini bukan masalah `VStack`. `VStack` hanyalah bekas susun atur, dan ia tidak menyediakan keupayaan menatal secara automatik.

**Apakah itu ScrollView**

`ScrollView` ialah bekas yang boleh ditatal, sesuai untuk kandungan dalam jumlah besar yang melebihi saiz skrin, seperti senarai menegak atau mendatar.

Struktur asas:

```swift
ScrollView {
    ...
}
```

Jika kita mahu mendapatkan kesan tatal, kita perlu membungkus keseluruhan kandungan halaman ke dalam `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Dengan cara ini, keseluruhan halaman menjadi kawasan yang boleh ditatal. Apabila kandungan melebihi tinggi skrin, ia boleh ditatal secara semula jadi.

Secara lalai `ScrollView` akan memaparkan penunjuk bar tatal. Jika anda mahu menyembunyikannya, anda boleh tetapkan:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Kod lengkap

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
