# View tersuai

Dalam pelajaran ini, kita akan mempelajari satu cara penulisan SwiftUI yang sangat penting: **View tersuai**.

View tersuai boleh membungkus satu bahagian kod View yang berulang dan menjadikannya View yang boleh digunakan berulang kali.

Dalam pembangunan App sebenar, kita sering menemui situasi seperti ini: struktur banyak skrin adalah sama, cuma kandungan yang dipaparkan berbeza.

Sebagai contoh, dalam senarai siaran di laman web forum, setiap siaran mungkin mempunyai maklumat seperti tajuk, imej dan jumlah suka.

![Reddit](../../../Resource/028_view1.png)

Dalam senarai produk di laman web beli-belah, setiap produk mungkin mempunyai maklumat seperti imej, nama dan harga.

![Amazon](../../../Resource/028_view2.png)

Struktur kandungan ini adalah serupa; perbezaannya hanya pada data yang dipaparkan.

Jika kita menulis kod untuk setiap item secara manual, kod akan menjadi sangat panjang dan tidak mudah untuk diubah kemudian.

Oleh itu, kita boleh membungkus struktur yang sama ke dalam View tersuai, kemudian menghantar kandungan yang berbeza sebagai parameter.

Dengan cara ini, View yang sama boleh memaparkan kandungan yang berbeza.

## Senario keperluan

Sebagai contoh, sekarang kita mahu membuat satu senarai tetapan.

Hasil paparan:

![view](../../../Resource/028_view.png)

Dalam senarai tetapan ini, terdapat tiga item tetapan yang berbeza: `Tetapan`, `Folder` dan `Muzik`.

Walaupun ikon, warna dan tajuknya berbeza, struktur keseluruhannya adalah sama:

- Ikon di sebelah kiri
- Warna latar belakang ikon
- Tajuk di tengah
- Anak panah di sebelah kanan

Jika tidak menggunakan View tersuai, kita mungkin menulis seperti ini:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Tetapan")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Folder")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Muzik")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Kod ini boleh dipaparkan dengan normal, tetapi masalahnya juga sangat jelas: kod untuk tiga item tetapan ini hampir sepenuhnya sama.

Bahagian yang berbeza hanyalah ikon, warna dan tajuk:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Tetapan")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Muzik")
```

Dengan kata lain, struktur setiap item tetapan adalah tetap; hanya ikon, warna dan tajuk yang berbeza.

Situasi seperti ini sangat sesuai untuk menggunakan View tersuai.

### Bayang shadow

Di sini kita menggunakan modifier baharu `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` boleh menambah bayang pada View.

`radius` menunjukkan jejari kabur bayang. Semakin besar nilainya, biasanya semakin besar kawasan sebaran bayang, dan bayang juga kelihatan lebih lembut.

Di sini nilainya ditetapkan kepada `1`, yang bermaksud hanya menambah kesan bayang yang sangat ringan.

## Membungkus View item tetapan

Seterusnya, kita membungkus setiap item tetapan menjadi View baharu.

Kita boleh mencipta `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Dalam View ini, kita mentakrifkan tiga property:

```swift
let icon: String
let color: Color
let title: String
```

Antaranya:

- `icon` menunjukkan nama ikon
- `color` menunjukkan warna latar belakang ikon
- `title` menunjukkan tajuk item tetapan

Kerana ketiga-tiga kandungan ini berbeza dalam item tetapan yang berbeza, kita menjadikannya parameter yang boleh dihantar dari luar.

## Menggunakan View tersuai

Selepas mempunyai `SettingItemView`, kita tidak perlu lagi menulis semula sekeping besar kod `HStack`.

Sekarang kita boleh menggunakannya seperti ini:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")
```

Baris kod ini bermaksud mencipta satu View item tetapan dan menghantar tiga parameter:

```swift
icon: "gear"
color: Color.blue
title: "Tetapan"
```

Selepas dihantar, property di dalam `SettingItemView` akan mendapat nilai yang sepadan:

- nilai `icon` ialah `gear`
- nilai `color` ialah `Color.blue`
- nilai `title` ialah `"Tetapan"`

Oleh itu, `Image(systemName: icon)` di dalam View akan memaparkan ikon gear, `.background(color)` akan menggunakan latar belakang biru, dan `Text(title)` akan memaparkan `Tetapan`.

Kod lengkap:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Muzik")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Hasil paparan:

![view](../../../Resource/028_view.png)

Kita boleh melihat bahawa selepas dibungkus, hasil paparan masih sama seperti sebelumnya, tetapi kod menjadi lebih jelas.

Sebelum ini, setiap item tetapan perlu menulis satu bahagian lengkap `HStack`; sekarang hanya satu baris kod diperlukan:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")
```

Inilah fungsi View tersuai: **membungkus struktur View yang berulang dan hanya menghantar kandungan yang berbeza sebagai parameter.**

## Mengapa parameter boleh dihantar

Seterusnya, kita fahami secara ringkas mengapa View tersuai boleh menerima parameter.

Dalam SwiftUI, View pada asasnya ialah sebuah structure.

Sebagai contoh:

```swift
struct ContentView: View {
    var body: some View {
        Text("Helo, dunia!")
    }
}
```

Di sini `ContentView` ialah sebuah structure.

Apabila kita menulis:

```swift
ContentView()
```

sebenarnya kita sedang mencipta satu View `ContentView`.

Tanda `()` di belakang menunjukkan bahawa initialization method dipanggil; ia juga boleh difahami sebagai mencipta View ini.

Kerana `ContentView` ini tidak mempunyai property yang perlu dihantar dari luar, kita boleh menulis secara terus:

```swift
ContentView()
```

Tetapi jika terdapat property yang belum diberi nilai di dalam View, kita perlu menghantar nilai yang sepadan ketika mencipta View.

Sebagai contoh:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Di sini `name` ialah sebuah property, dan ia tidak mempunyai nilai lalai.

Jadi ketika mencipta `ContentView`, kita mesti memberikan nilai khusus kepada `name`:

```swift
ContentView(name: "Fang Junyu")
```

Dengan cara ini, View boleh menggunakan nilai ini di dalamnya:

```swift
Text("nama: \(name)")
```

Ini juga sebab mengapa kita perlu menghantar parameter ketika mencipta `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")
```

Kerana terdapat tiga property tanpa nilai lalai dalam `SettingItemView`:

```swift
let icon: String
let color: Color
let title: String
```

Jadi ketika mencipta View ini, kita perlu menghantarnya masuk. Parameter yang dihantar akan digunakan oleh Swift untuk memberikan nilai kepada property di dalam View.

## Initialization method

Seterusnya, kita fahami initialization method dengan lebih lanjut.

### Default initialization method

Apabila kita mentakrifkan View biasa:

```swift
struct ContentView: View {
    var body: some View {
        Text("Helo, dunia!")
    }
}
```

Dalam kod ini, kita tidak menulis initialization method secara manual.

Tetapi apabila kita menggunakan View ini, kita boleh menulis seperti ini:

```swift
ContentView()
```

Di sini `()` sebenarnya bermaksud mencipta `ContentView`; ia juga boleh difahami sebagai memanggil initialization method-nya.

### Mengapa masih boleh dipanggil walaupun initialization method tidak kelihatan?

Kerana Swift compiler secara automatik menjana initialization method untuk kita.

Perlu diperhatikan bahawa: **initialization method ini dijana secara automatik, dan biasanya kita tidak melihatnya secara langsung dalam kod.**

Dengan kata lain, walaupun kita tidak menulis secara manual di dalam `struct`:

```swift
init() {

}
```

Swift compiler akan menjana initialization method yang lebih kurang seperti ini di belakang tabir:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Helo, dunia!")
    }
}
```

Inilah sebabnya kita boleh menulis secara terus:

```swift
ContentView()
```

Oleh itu, dalam kod sebenar, biasanya kita tidak perlu menulis initialization method secara manual.

Kita hanya perlu memahami satu perkara: **ketika mencipta SwiftUI View, initialization method View tersebut akan dipanggil. Walaupun kita tidak menulis initialization method secara manual, Swift mungkin menjana method itu secara automatik untuk kita.**

### Initialization method dengan parameter

Jika terdapat property tanpa nilai lalai dalam View, contohnya:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Swift compiler akan menjana initialization method dengan parameter secara automatik berdasarkan property.

Ia boleh difahami secara mudah seperti ini:

```swift
init(name: String) {
    self.name = name
}
```

Di sini:

```swift
init(name: String)
```

bermaksud ketika mencipta `ContentView`, kita perlu menghantar parameter `name` berjenis `String`.

Apabila kita menulis:

```swift
ContentView(name: "Fang Junyu")
```

maksudnya ialah: menghantar `"Fang Junyu"` sebagai parameter kepada initialization method.

Kemudian di dalam initialization method akan dijalankan:

```swift
self.name = name
```

Baris kod ini bermaksud: memberikan `name` yang dihantar dari luar kepada property `name` milik View semasa.

Ia boleh difahami secara mudah seperti ini:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nama: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Dengan cara ini, View boleh menggunakan nilai yang dihantar di dalamnya.

Inilah aliran initialization bagi View dengan parameter: **apabila property di dalam View tidak mempunyai nilai lalai, ketika mencipta View kita perlu menghantar parameter yang sepadan supaya initialization method melengkapkan pemberian nilai kepada property.**

## Keadaan apabila property mempunyai nilai lalai

Jika property sudah mempunyai nilai lalai, maka ketika mencipta View kita boleh tidak menghantar parameter.

Sebagai contoh:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Di sini `name` sudah mempunyai nilai lalai:

```swift
"Fang Junyu"
```

Jadi ketika mencipta `ContentView`, kita boleh menulis secara terus:

```swift
ContentView()
```

Pada masa ini, `name` akan menggunakan nilai lalai, dan antara muka memaparkan:

```swift
nama: Fang Junyu
```

Sudah tentu, ketika mencipta View, kita juga boleh menghantar nilai baharu:

```swift
ContentView(name: "Sam")
```

Pada masa ini, View akan menggunakan `"Sam"` yang dihantar dari luar, bukan nilai lalai, dan antara muka memaparkan:

```swift
nama: Sam
```

Untuk memudahkan pemahaman, initialization method yang dijana secara automatik oleh Swift compiler boleh dianggap secara mudah seperti ini:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Di sini `name: String = "Fang Junyu"` bermaksud: jika `name` tidak dihantar ketika mencipta View, gunakan nilai lalai `"Fang Junyu"`; jika `name` baharu dihantar ketika mencipta View, gunakan nilai yang dihantar.

Dengan kata lain: **jika parameter tidak dihantar dari luar, nilai lalai property akan digunakan; jika parameter dihantar dari luar, nilai yang dihantar akan digunakan.**

## Kembali kepada SettingItemView

Sekarang kita lihat semula SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Struktur View ini adalah tetap.

Bahagian tetap termasuk:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Bahagian yang berbeza termasuk:

```swift
icon
color
title
```

Oleh itu, kita menjadikan kandungan yang berbeza sebagai property dan menghantarnya sebagai parameter ketika mencipta View.

Apabila kita mencipta item tetapan yang berbeza, kita hanya perlu menghantar parameter yang berbeza:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Muzik")
```

Dengan cara ini, `SettingItemView` yang sama boleh memaparkan tiga item tetapan yang berbeza.

Inilah cara penggunaan View tersuai yang paling biasa.

## Ringkasan

Dalam pelajaran ini, kita telah mempelajari View tersuai.

Fungsi utama View tersuai ialah: **membungkus kod View yang berulang supaya ia boleh digunakan semula.**

Dalam contoh ini, struktur tiga item tetapan adalah sama, hanya ikon, warna dan tajuk yang berbeza.

Jadi kita mencipta `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Kemudian, ketika menggunakan View ini, kita menghantar parameter yang berbeza:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Tetapan")
```

Parameter di sini akan masuk ke dalam `SettingItemView`.

Dengan cara ini, kita boleh menggunakan kod yang lebih sedikit untuk mencipta View yang mempunyai struktur sama tetapi kandungan berbeza.

Ini juga merupakan cara penulisan yang sangat biasa dalam pembangunan SwiftUI.
