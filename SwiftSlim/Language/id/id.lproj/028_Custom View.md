# View Kustom

Dalam pelajaran ini, kita akan mempelajari salah satu cara penulisan SwiftUI yang sangat penting: **View kustom**.

View kustom dapat membungkus bagian kode View yang berulang dan mengubahnya menjadi View yang bisa digunakan berulang kali.

Dalam pengembangan App yang sebenarnya, kita sering menemui situasi seperti ini: struktur banyak antarmuka sama, tetapi konten yang ditampilkan berbeda.

Misalnya, pada daftar posting di situs forum, setiap posting mungkin memiliki informasi seperti judul, gambar, dan jumlah suka.

![Reddit](../../../Resource/028_view1.png)

Pada daftar produk di situs belanja, setiap produk mungkin memiliki informasi seperti gambar, nama, dan harga.

![Amazon](../../../Resource/028_view2.png)

Struktur konten-konten ini serupa; perbedaannya hanya pada data yang ditampilkan.

Jika setiap item ditulis manual satu per satu, kode akan menjadi sangat panjang, dan tidak nyaman untuk diubah di kemudian hari.

Karena itu, kita dapat membungkus struktur yang sama menjadi sebuah View kustom, lalu mengirimkan konten yang berbeda sebagai parameter.

Dengan begitu, View yang sama dapat menampilkan konten yang berbeda.

## Skenario kebutuhan

Misalnya, sekarang kita ingin membuat sebuah daftar pengaturan.

Hasil tampilan:

![view](../../../Resource/028_view.png)

Dalam daftar pengaturan ini, terdapat tiga item pengaturan yang berbeda, yaitu `Pengaturan`, `Folder`, dan `Musik`.

Meskipun ikon, warna, dan judulnya berbeda, struktur keseluruhannya sama:

- Ikon di sisi kiri
- Warna latar belakang ikon
- Judul di tengah
- Panah di sisi kanan

Jika tidak menggunakan View kustom, kita mungkin akan menulis seperti ini:

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

                Text("Pengaturan")
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

                Text("Musik")
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

Kode ini dapat ditampilkan dengan normal, tetapi masalahnya juga sangat jelas: kode untuk tiga item pengaturan ini hampir sepenuhnya sama.

Bagian yang berbeda hanya ikon, warna, dan judul:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Pengaturan")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musik")
```

Dengan kata lain, struktur setiap item pengaturan bersifat tetap; yang berbeda hanya ikon, warna, dan judul.

Situasi seperti ini sangat cocok untuk menggunakan View kustom.

### Bayangan shadow

Di sini kita menggunakan modifier baru `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` dapat menambahkan bayangan pada View.

`radius` menunjukkan radius blur dari bayangan. Semakin besar nilainya, biasanya semakin besar area sebaran bayangan, dan tampilannya juga semakin lembut.

Di sini nilainya diatur menjadi `1`, yang berarti hanya menambahkan efek bayangan yang sangat ringan.

## Membungkus View item pengaturan

Selanjutnya, kita membungkus setiap item pengaturan menjadi sebuah View baru.

Kita dapat membuat `SettingItemView`:

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

Dalam View ini, kita mendefinisikan tiga property:

```swift
let icon: String
let color: Color
let title: String
```

Di antaranya:

- `icon` menunjukkan nama ikon
- `color` menunjukkan warna latar belakang ikon
- `title` menunjukkan judul item pengaturan

Karena tiga konten ini berbeda pada item pengaturan yang berbeda, kita menjadikannya parameter yang dapat dikirim dari luar.

## Menggunakan View kustom

Setelah memiliki `SettingItemView`, kita tidak perlu lagi menulis ulang blok kode `HStack` yang panjang.

Sekarang kita dapat menggunakannya seperti ini:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")
```

Baris kode ini berarti membuat sebuah View item pengaturan dan mengirimkan tiga parameter:

```swift
icon: "gear"
color: Color.blue
title: "Pengaturan"
```

Setelah dikirim, property di dalam `SettingItemView` akan mendapatkan nilai yang sesuai:

- nilai `icon` adalah `gear`
- nilai `color` adalah `Color.blue`
- nilai `title` adalah `"Pengaturan"`

Karena itu, `Image(systemName: icon)` di dalam View akan menampilkan ikon roda gigi, `.background(color)` akan menggunakan latar belakang biru, dan `Text(title)` akan menampilkan `Pengaturan`.

Kode lengkap:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
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

Hasil tampilan:

![view](../../../Resource/028_view.png)

Dapat dilihat bahwa setelah dibungkus, hasil tampilannya tetap sama seperti sebelumnya, tetapi kodenya menjadi lebih jelas.

Sebelumnya, setiap item pengaturan harus menulis satu bagian `HStack` yang lengkap, sekarang hanya perlu satu baris kode:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")
```

Inilah fungsi View kustom: **membungkus struktur View yang berulang, dan hanya mengirimkan konten yang berbeda sebagai parameter.**

## Mengapa parameter bisa dikirim

Selanjutnya, kita pahami secara sederhana mengapa View kustom dapat menerima parameter.

Dalam SwiftUI, View pada dasarnya adalah sebuah structure.

Misalnya:

```swift
struct ContentView: View {
    var body: some View {
        Text("Halo, dunia!")
    }
}
```

Di sini `ContentView` adalah sebuah structure.

Saat kita menulis:

```swift
ContentView()
```

sebenarnya kita sedang membuat sebuah View `ContentView`.

Tanda `()` di belakang berarti memanggil initialization method-nya; ini juga dapat dipahami sebagai membuat View tersebut.

Karena `ContentView` ini tidak memiliki property yang perlu dikirim dari luar, kita dapat langsung menulis:

```swift
ContentView()
```

Namun, jika di dalam View terdapat property yang belum diberi nilai, maka saat membuat View kita harus mengirimkan nilai yang sesuai.

Misalnya:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Di sini `name` adalah sebuah property, dan tidak memiliki nilai default.

Jadi saat membuat `ContentView`, kita harus memberikan nilai konkret untuk `name`:

```swift
ContentView(name: "Fang Junyu")
```

Dengan begitu, View di dalamnya dapat menggunakan nilai ini:

```swift
Text("nama: \(name)")
```

Ini juga alasan mengapa saat membuat `SettingItemView`, kita perlu mengirimkan parameter:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")
```

Karena di dalam `SettingItemView` terdapat tiga property yang tidak memiliki nilai default:

```swift
let icon: String
let color: Color
let title: String
```

Jadi saat membuat View ini, kita perlu mengirimkannya ke dalam. Parameter yang dikirim akan digunakan Swift untuk memberikan nilai kepada property di dalam View.

## Initialization method

Selanjutnya, kita pahami initialization method lebih lanjut.

### Default initialization method

Saat kita mendefinisikan View biasa:

```swift
struct ContentView: View {
    var body: some View {
        Text("Halo, dunia!")
    }
}
```

Dalam kode ini, kita tidak menulis initialization method secara manual.

Namun saat menggunakan View ini, kita dapat menulis seperti ini:

```swift
ContentView()
```

Di sini `()` sebenarnya berarti membuat `ContentView`; ini juga dapat dipahami sebagai memanggil initialization method-nya.

### Mengapa tidak ada initialization method, tetapi tetap bisa dipanggil?

Karena Swift compiler secara otomatis membantu kita membuat initialization method.

Perlu diperhatikan bahwa: **initialization method ini dibuat secara otomatis, dan biasanya kita tidak melihatnya langsung di dalam kode.**

Dengan kata lain, meskipun kita tidak menulis secara manual di dalam `struct`:

```swift
init() {

}
```

Swift compiler akan membuat initialization method yang kira-kira seperti ini di belakang layar:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Halo, dunia!")
    }
}
```

Itulah mengapa kita dapat langsung menulis:

```swift
ContentView()
```

Jadi dalam kode sebenarnya, biasanya kita tidak perlu menuliskan initialization method secara manual.

Kita hanya perlu memahami satu hal: **saat membuat SwiftUI View, initialization method milik View tersebut akan dipanggil. Meskipun kita tidak menulis initialization method secara manual, Swift mungkin akan membuatnya secara otomatis.**

### Initialization method dengan parameter

Jika di dalam View terdapat property yang tidak memiliki nilai default, misalnya:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Swift compiler akan secara otomatis membuat initialization method dengan parameter berdasarkan property.

Secara sederhana, ini dapat dipahami seperti ini:

```swift
init(name: String) {
    self.name = name
}
```

Di sini:

```swift
init(name: String)
```

berarti saat membuat `ContentView`, kita harus mengirimkan parameter `name` bertipe `String`.

Saat kita menulis:

```swift
ContentView(name: "Fang Junyu")
```

artinya: mengirim `"Fang Junyu"` sebagai parameter kepada initialization method.

Kemudian di dalam initialization method akan dijalankan:

```swift
self.name = name
```

Baris kode ini berarti: memberikan `name` yang dikirim dari luar kepada property `name` milik View saat ini.

Secara sederhana, ini dapat dipahami seperti ini:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nama: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Dengan begitu, View dapat menggunakan nilai yang dikirim di dalamnya.

Inilah alur initialization View dengan parameter: **ketika property di dalam View tidak memiliki nilai default, saat membuat View kita perlu mengirim parameter yang sesuai, agar initialization method menyelesaikan pemberian nilai kepada property.**

## Kondisi ketika property memiliki nilai default

Jika property sudah memiliki nilai default, maka saat membuat View kita boleh tidak mengirim parameter.

Misalnya:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nama: \(name)")
    }
}
```

Di sini `name` sudah memiliki nilai default:

```swift
"Fang Junyu"
```

Jadi saat membuat `ContentView`, kita dapat langsung menulis:

```swift
ContentView()
```

Saat ini, `name` akan menggunakan nilai default, dan antarmuka akan menampilkan:

```swift
nama: Fang Junyu
```

Tentu saja, kita juga dapat mengirimkan nilai baru saat membuat View:

```swift
ContentView(name: "Sam")
```

Saat ini, View akan menggunakan `"Sam"` yang dikirim dari luar, bukan nilai default, dan antarmuka akan menampilkan:

```swift
nama: Sam
```

Agar lebih mudah dipahami, initialization method yang dibuat secara otomatis oleh Swift compiler dapat dianggap secara sederhana seperti ini:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Di sini `name: String = "Fang Junyu"` berarti: jika saat membuat View tidak mengirim `name`, gunakan nilai default `"Fang Junyu"`; jika saat membuat View mengirim `name` baru, gunakan nilai yang dikirim.

Dengan kata lain: **jika dari luar tidak mengirim parameter, gunakan nilai default dari property; jika dari luar mengirim parameter, gunakan nilai yang dikirim.**

## Kembali ke SettingItemView

Sekarang kita lihat kembali SettingItemView:

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

Struktur View ini bersifat tetap.

Bagian yang tetap meliputi:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Bagian yang berbeda meliputi:

```swift
icon
color
title
```

Karena itu, kita menjadikan konten yang berbeda sebagai property, lalu mengirimkannya sebagai parameter saat membuat View.

Saat membuat item pengaturan yang berbeda, kita hanya perlu mengirim parameter yang berbeda:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
```

Dengan begitu, `SettingItemView` yang sama dapat menampilkan tiga item pengaturan yang berbeda.

Ini adalah cara paling umum untuk menggunakan View kustom.

## Ringkasan

Dalam pelajaran ini, kita mempelajari View kustom.

Fungsi utama View kustom adalah: **membungkus kode View yang berulang agar dapat digunakan kembali.**

Dalam contoh ini, struktur tiga item pengaturan sama, hanya ikon, warna, dan judul yang berbeda.

Karena itu, kita membuat `SettingItemView`:

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

Kemudian, saat menggunakan View ini, kita mengirim parameter yang berbeda:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Pengaturan")
```

Parameter di sini akan masuk ke dalam `SettingItemView`.

Dengan cara ini, kita dapat menggunakan lebih sedikit kode untuk membuat View dengan struktur yang sama tetapi konten yang berbeda.

Ini juga merupakan cara penulisan yang sangat umum dalam pengembangan SwiftUI.
