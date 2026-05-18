# Warna Kustom

Dalam pelajaran ini, kita akan mempelajari cara membuat warna kustom di SwiftUI.

Pada pelajaran sebelumnya, kita sudah pernah menggunakan warna bawaan yang disediakan SwiftUI, misalnya:

```swift
Color.blue
Color.red
Color.green
```

Warna-warna ini sangat mudah digunakan, tetapi dalam pengembangan App yang sebenarnya, warna bawaan biasanya kurang presisi.

Misalnya, dalam desain mungkin digunakan warna seperti ini:

```text
#2c54c2
#4875ed
#213e8d
```

Warna seperti ini disebut warna Hex.

Dalam pelajaran ini, kita akan terlebih dahulu membuat SwiftUI mendukung warna Hex, lalu menggunakan `static` untuk mengelola warna yang sering digunakan.

Terakhir, kita akan menerapkan warna kustom ke tampilan ensiklopedia hewan, dan menggunakan latar belakang gradien lebih lanjut agar tombol terlihat lebih berlapis.

## Mengapa Perlu Warna Kustom?

Di SwiftUI, kita dapat langsung menggunakan warna sistem.

Misalnya:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Di sini, `.blue` berarti warna biru. Sebenarnya ini adalah bentuk singkat dari `Color.blue`.

Kelebihan warna bawaan adalah sederhana dan mudah digunakan, tetapi pilihan warnanya relatif terbatas.

Misalnya:

```swift
Color.blue
```

Ini hanya dapat mewakili warna biru bawaan yang disediakan SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Namun, dalam pengembangan nyata, kita sering membutuhkan warna yang lebih spesifik.

Misalnya, meskipun sama-sama biru, efeknya bisa berupa biru muda, biru tua, biru keabu-abuan, biru terang, dan variasi lainnya.

![More Blue](../../../Resource/031_color5.png)

Pada saat seperti ini, jika hanya menggunakan `Color.blue`, akan sulit mengembalikan efek desain dengan akurat.

Karena itu, kita perlu membuat SwiftUI mendukung warna kustom.

## Apa Itu Warna Hex?

Warna pada layar biasanya terdiri dari tiga kanal: merah, hijau, dan biru, yaitu RGB.

RGB masing-masing berarti:

```text
Red     // Merah
Green   // Hijau
Blue    // Biru
```

Warna Hex adalah salah satu cara untuk merepresentasikan warna RGB.

Misalnya:

```swift
#5479FF
```

Nilai warna ini dapat dipahami secara sederhana sebagai tiga bagian:

```text
54  // Menunjukkan kanal merah
79  // Menunjukkan kanal hijau
FF  // Menunjukkan kanal biru
```

Dalam pelajaran ini, kita tidak perlu menghitung nilai-nilai tersebut, dan juga tidak perlu memahami aturan heksadesimal secara mendalam.

Sekarang cukup ketahui bahwa: `#5479FF` mewakili sebuah warna tertentu.

Nantinya, ketika melihat penulisan seperti `#2c54c2` atau `#4875ed`, kita dapat terlebih dahulu memahaminya sebagai sebuah nilai warna.

Di alat desain seperti Sketch, Figma, dan Photoshop, nilai warna seperti ini juga sering terlihat.

![color](../../../Resource/031_color.png)

Namun, SwiftUI secara bawaan tidak dapat langsung ditulis seperti ini:

```swift
Color(hex: "#5479FF")
```

Karena itu, kita perlu memperluas tipe `Color` sendiri agar mendukung pembuatan warna melalui string Hex.

## Membuat File Color+Hex.swift

Pertama, kita buat sebuah file Swift baru.

Nama file dapat ditulis sebagai:

```text
Color.swift
```

Bisa juga ditulis lebih jelas sebagai:

```text
Color+Hex.swift
```

Di sini lebih disarankan menggunakan:

```text
Color+Hex.swift
```

Dalam proyek Swift, nama file seperti `Color+Hex.swift` sangat umum.

Ini menunjukkan bahwa file tersebut adalah file ekstensi yang menambahkan kemampuan Hex untuk `Color`.

Nama file tidak langsung memengaruhi jalannya kode, tetapi membantu kita lebih mudah memahami kegunaan file tersebut.

## Menambahkan Kode Color(hex:)

Di dalam file `Color+Hex.swift`, tulis kode berikut:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Kode ini menggunakan `extension` untuk memperluas tipe `Color`, dan menambahkan sebuah metode inisialisasi baru untuk `Color`:

```swift
init(hex: String)
```

Setelah memiliki metode inisialisasi ini, kita dapat memberikan string Hex ke `Color`, sehingga membuat warna kustom:

```swift
Color(hex: "#5479FF")
```

Di dalam kode ekstensi ini, string Hex akan dikonversi menjadi warna RGB yang dapat dikenali SwiftUI.

Pada tahap ini, tidak perlu memahami setiap baris logika konversi secara mendalam. Cukup pahami bahwa metode `Color(hex:)` yang ditambahkan dapat membuat warna kustom melalui nilai warna Hex.

## Menggunakan Warna Kustom

Sekarang, kita dapat menguji warna kustom di `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Efek tampilan:

![color](../../../Resource/031_color1.png)

Dalam contoh ini, baris pertama menggunakan warna sistem:

```swift
.foregroundStyle(Color.blue)
```

Tiga baris berikutnya menggunakan warna Hex kustom:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Dengan membandingkannya, kita dapat menemukan bahwa warna biru sistem hanya memiliki satu efek bawaan.

Sedangkan warna Hex dapat mewakili perubahan biru yang lebih detail.

Inilah nilai dari warna kustom: warna kustom dapat membuat warna antarmuka lebih mendekati desain asli, dan juga membuat kita lebih mudah mengontrol gaya visual App.

## Menggunakan static untuk Mengelola Warna

Sekarang, kita sudah dapat membuat warna melalui string Hex:

```swift
Color(hex: "#2c54c2")
```

Penulisan seperti ini dapat digunakan dengan normal, tetapi jika warna yang sama muncul berulang kali di banyak tempat, pemeliharaan selanjutnya menjadi kurang praktis.

Jika nilai warna ini ditulis di 10 tempat, saat ingin mengubah warna biru tersebut nanti, kita harus mengubahnya satu per satu.

Pada saat ini, kita dapat menggunakan `static` untuk mengelola warna yang sering digunakan secara terpusat.

Di bagian bawah file `Color+Hex.swift`, lanjutkan dengan menambahkan kode berikut:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Di sini, kita menambahkan tiga properti statis untuk `Color`: `animalBlue`, `animalLightBlue`, dan `animalDarkBlue`. Ketiganya masing-masing mewakili warna biru dengan tingkat terang-gelap yang berbeda.

Karena properti-properti ini menggunakan `static`, maka properti tersebut milik tipe `Color` itu sendiri.

Saat digunakan, kita dapat langsung mengaksesnya melalui `Color.`:

```swift
Color.animalBlue
```

Penulisan seperti ini lebih jelas daripada langsung menulis string Hex.

Ketika melihat `Color.animalBlue`, kita dapat mengetahui bahwa itu mewakili warna biru yang digunakan dalam ensiklopedia hewan.

Sedangkan ketika melihat `Color(hex: "#2c54c2")`, kita hanya tahu bahwa itu adalah sebuah nilai warna, tetapi tidak mudah melihat kegunaan spesifiknya.

Mengelola warna secara terpusat juga memiliki kelebihan lain: perubahan di kemudian hari menjadi lebih mudah.

Jika ingin menyesuaikan warna utama ensiklopedia hewan, kita hanya perlu mengubah lokasi definisinya:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Semua tempat yang menggunakan warna ini akan ikut diperbarui.

Inilah makna penggunaan `static` untuk mengelola warna: membuat nama warna lebih jelas, dan membuat pemeliharaan selanjutnya lebih mudah.

## Menerapkan ke Ensiklopedia Hewan

Sekarang, kita dapat menerapkan warna kustom ke tampilan ensiklopedia hewan sebelumnya.

Sebelumnya, latar belakang tombol hewan berwarna putih:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Sekarang, kita dapat mengubahnya menjadi warna kustom:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

`Color.animalBlue` di sini adalah warna statis yang baru saja kita definisikan di `Color+Hex.swift`.

Teks tombol menggunakan warna putih:

```swift
.foregroundStyle(Color.white)
```

Latar belakang emoji hewan menggunakan warna putih semi-transparan:

```swift
.background(Color.white.opacity(0.15))
```

Dengan begitu, tombol akan membentuk gaya visual biru yang terpadu.

Fokus langkah ini bukan menambah kode yang kompleks, melainkan benar-benar menerapkan warna kustom yang telah dipelajari sebelumnya ke dalam antarmuka.

## Menggunakan Latar Belakang Gradien

Selain menggunakan satu warna, kita juga dapat menggabungkan beberapa warna menjadi efek gradien.

Misalnya, sebelumnya kita telah mendefinisikan warna-warna berikut:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Warna-warna ini tidak hanya dapat digunakan sendiri-sendiri, tetapi juga dapat digabungkan menjadi latar belakang gradien.

Di SwiftUI, kita dapat menggunakan `LinearGradient` untuk membuat gradien linear.

Misalnya:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Kode ini akan membuat latar belakang gradien dari kiri ke kanan, dengan warna yang bertransisi secara bertahap dari `Color.animalBlue` ke `Color.animalLightBlue`.

Di antaranya, `colors` digunakan untuk mengatur warna yang ikut dalam gradien, sedangkan `startPoint` dan `endPoint` digunakan untuk mengontrol arah gradien.

### Menguji Efek Gradien

Kita dapat menggunakan sebuah Text sederhana untuk menguji latar belakang gradien.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Efek tampilan:

![color](../../../Resource/031_color3.png)

Dalam contoh ini, latar belakang `Text` tidak lagi berupa satu warna, tetapi berupa warna gradien yang berubah bertahap dari kiri ke kanan.

Dibandingkan dengan warna latar biasa, latar belakang gradien akan terlihat lebih berlapis, dan juga lebih mudah membuat antarmuka memiliki fokus visual.

## Menggunakan Latar Belakang Gradien di Ensiklopedia Hewan

Sekarang, kita dapat mengubah warna latar belakang tombol hewan:

```swift
.background(Color.animalBlue)
```

Menjadi latar belakang gradien:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Kode lengkapnya sebagai berikut:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Efek tampilan:

![color](../../../Resource/031_color4.png)

Sekarang, tombol hewan tidak lagi hanya memiliki satu warna latar, tetapi memiliki efek gradien dari kiri ke kanan.

Dibandingkan dengan latar satu warna, latar belakang gradien dapat membuat antarmuka terlihat lebih berlapis, dan juga lebih mendekati desain visual dalam App yang sebenarnya.

## Perbedaan antara Latar Belakang Satu Warna dan Gradien

Latar belakang satu warna hanya menggunakan satu warna.

Misalnya:

```swift
.background(Color.animalBlue)
```

Penulisan seperti ini sederhana dan jelas, cocok untuk sebagian besar antarmuka dasar.

Latar belakang gradien menggunakan beberapa warna.

Misalnya:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Penulisan seperti ini dapat membuat antarmuka lebih berlapis, tetapi juga lebih mudah menambah kompleksitas visual.

Karena itu, dalam pengembangan nyata, kita dapat memahaminya seperti ini:

Latar belakang satu warna cocok untuk teks biasa, tombol biasa, kartu biasa, dan latar halaman biasa.

Latar belakang gradien cocok untuk tombol utama, area bagian atas, kartu sampul, pintu masuk fitur, dan posisi lain yang perlu ditekankan.

## Ringkasan

Dalam pelajaran ini, kita mempelajari cara menggunakan warna kustom di SwiftUI.

Pertama, kita memahami warna Hex.

Misalnya:

```text
#2c54c2
```

Ini mewakili sebuah warna tertentu.

Kemudian, kita menggunakan `extension Color` untuk memperluas tipe `Color`.

Agar SwiftUI dapat membuat warna dengan cara berikut:

```swift
Color(hex: "#2c54c2")
```

Selanjutnya, kita menggunakan `static` untuk mengelola warna yang sering digunakan:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Dengan begitu, di tampilan lain kita dapat langsung menggunakan:

```swift
Color.animalBlue
```

Dibandingkan dengan menulis string Hex setiap kali, cara ini lebih jelas dan juga lebih mudah untuk mengubah warna secara terpusat di kemudian hari.

Terakhir, kita mempelajari `LinearGradient`, dan menggabungkan warna kustom menjadi latar belakang gradien:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Melalui pelajaran ini, kita menyelesaikan proses dari “membuat warna kustom” hingga “menggunakan warna dalam antarmuka nyata”.

Nantinya, ketika sebuah warna perlu digunakan berulang kali di banyak tempat, kita dapat mempertimbangkan terlebih dahulu untuk mengelolanya di ekstensi `Color`.

Dengan begitu, kode akan lebih jelas, dan gaya antarmuka juga lebih mudah disatukan.
