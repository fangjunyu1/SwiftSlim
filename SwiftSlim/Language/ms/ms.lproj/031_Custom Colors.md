# Warna Tersuai

Dalam pelajaran ini, kita akan belajar cara menyesuaikan warna dalam SwiftUI.

Dalam pelajaran sebelumnya, kita sudah menggunakan warna lalai yang disediakan oleh SwiftUI, contohnya:

```swift
Color.blue
Color.red
Color.green
```

Warna-warna ini mudah digunakan, tetapi dalam pembangunan App sebenar, warna lalai biasanya tidak cukup tepat.

Contohnya, reka bentuk mungkin menggunakan warna seperti ini:

```text
#2c54c2
#4875ed
#213e8d
```

Warna seperti ini dipanggil warna Hex.

Dalam pelajaran ini, kita akan terlebih dahulu menjadikan SwiftUI menyokong warna Hex, kemudian menggunakan `static` untuk menyusun warna yang kerap digunakan.

Akhir sekali, kita akan menggunakan warna tersuai dalam paparan ensiklopedia haiwan, dan seterusnya menggunakan latar belakang gradasi supaya butang kelihatan lebih berlapis.

## Mengapa Perlu Menggunakan Warna Tersuai?

Dalam SwiftUI, kita boleh menggunakan warna sistem secara langsung.

Contohnya:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Di sini, `.blue` bermaksud warna biru. Sebenarnya, ia ialah bentuk ringkas bagi `Color.blue`.

Kelebihan warna lalai ialah mudah dan senang digunakan, tetapi pilihan warna yang tersedia agak terhad.

Contohnya:

```swift
Color.blue
```

Ini hanya boleh mewakili warna biru lalai yang disediakan oleh SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Namun, dalam pembangunan sebenar, kita sering memerlukan warna yang lebih khusus.

Contohnya, walaupun semuanya biru, mungkin terdapat kesan yang berbeza seperti biru muda, biru gelap, biru kelabu dan biru terang.

![More Blue](../../../Resource/031_color5.png)

Pada masa ini, jika kita hanya menggunakan `Color.blue`, agak sukar untuk menghasilkan semula kesan reka bentuk.

Jadi, kita perlu menjadikan SwiftUI menyokong warna tersuai.

## Apakah Warna Hex?

Warna pada skrin biasanya terdiri daripada tiga saluran: merah, hijau dan biru. Ini ialah RGB.

RGB masing-masing bermaksud:

```text
Red     // Merah
Green   // Hijau
Blue    // Biru
```

Warna Hex ialah salah satu cara untuk mewakili warna RGB.

Contohnya:

```swift
#5479FF
```

Nilai warna ini boleh difahami secara ringkas sebagai tiga bahagian:

```text
54  // Mewakili saluran merah
79  // Mewakili saluran hijau
FF  // Mewakili saluran biru
```

Dalam pelajaran ini, kita tidak perlu mengira nilai ini, dan tidak perlu memahami peraturan heksadesimal secara mendalam.

Buat masa ini, kita hanya perlu tahu bahawa `#5479FF` mewakili satu warna khusus.

Selepas ini, apabila kita melihat penulisan seperti `#2c54c2` dan `#4875ed`, kita boleh memahaminya terlebih dahulu sebagai nilai warna.

Dalam alat reka bentuk seperti Sketch, Figma dan Photoshop, kita juga sering melihat nilai warna yang serupa.

![color](../../../Resource/031_color.png)

Namun, secara lalai SwiftUI tidak boleh menulisnya secara langsung seperti ini:

```swift
Color(hex: "#5479FF")
```

Jadi, kita perlu mengembangkan jenis `Color` sendiri supaya ia menyokong penciptaan warna melalui rentetan Hex.

## Cipta Fail Color+Hex.swift

Mula-mula, cipta satu fail Swift baharu.

Nama fail boleh ditulis sebagai:

```text
Color.swift
```

Ia juga boleh ditulis dengan lebih jelas sebagai:

```text
Color+Hex.swift
```

Di sini, lebih disarankan untuk menggunakan:

```text
Color+Hex.swift
```

Dalam projek Swift, nama fail seperti `Color+Hex.swift` sangat biasa digunakan.

Ia menunjukkan bahawa fail ini ialah fail sambungan yang menambahkan keupayaan Hex kepada `Color`.

Nama fail tidak mempengaruhi pelaksanaan kod secara langsung. Ia hanya digunakan untuk membantu kita memahami kegunaan fail ini dengan lebih mudah.

## Tambah Kod Color(hex:)

Dalam fail `Color+Hex.swift`, tulis kod berikut:

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

Kod ini menggunakan `extension` untuk mengembangkan jenis `Color`, dan menambahkan satu kaedah pemula baharu kepada `Color`:

```swift
init(hex: String)
```

Selepas mempunyai kaedah pemula ini, kita boleh menghantar rentetan Hex kepada `Color` untuk mencipta warna tersuai:

```swift
Color(hex: "#5479FF")
```

Di dalam kod sambungan ini, rentetan Hex akan ditukar kepada warna RGB yang boleh dikenali oleh SwiftUI.

Pada peringkat ini, anda tidak perlu memahami secara mendalam logik penukaran setiap baris. Anda hanya perlu tahu bahawa kaedah `Color(hex:)` yang ditambahkan membolehkan kita mencipta warna tersuai melalui nilai warna Hex.

## Menggunakan Warna Tersuai

Sekarang, kita boleh menguji warna tersuai dalam `ContentView`.

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

Kesan paparan:

![color](../../../Resource/031_color1.png)

Dalam contoh ini, baris pertama menggunakan warna sistem:

```swift
.foregroundStyle(Color.blue)
```

Tiga baris selepas itu menggunakan warna Hex tersuai:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Melalui perbandingan, kita boleh mendapati bahawa biru sistem hanya mempunyai satu kesan lalai.

Manakala warna Hex boleh mewakili variasi biru yang lebih terperinci.

Inilah nilai warna tersuai: ia boleh menjadikan warna antara muka lebih hampir kepada reka bentuk sebenar, dan memudahkan kita mengawal gaya visual App.

## Menggunakan static untuk Menyusun Warna

Sekarang, kita sudah boleh mencipta warna melalui rentetan Hex:

```swift
Color(hex: "#2c54c2")
```

Cara penulisan ini boleh digunakan dengan normal, tetapi jika warna yang sama muncul berulang kali di banyak tempat, penyelenggaraan kemudian akan menjadi kurang mudah.

Jika nilai warna ini ditulis di 10 tempat berbeza, apabila kita mahu mengubah biru ini pada masa depan, kita perlu mengubahnya satu demi satu.

Pada masa ini, kita boleh menggunakan `static` untuk menyusun warna yang kerap digunakan di satu tempat.

Di bahagian bawah fail `Color+Hex.swift`, terus tambahkan kod berikut:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Di sini, kita telah menambahkan tiga sifat statik kepada `Color`: `animalBlue`, `animalLightBlue` dan `animalDarkBlue`. Sifat-sifat ini masing-masing mewakili warna biru dengan tahap gelap dan terang yang berbeza.

Kerana sifat-sifat ini menggunakan `static`, ia tergolong kepada jenis `Color` itu sendiri.

Semasa digunakan, kita boleh mengaksesnya terus melalui `Color.`:

```swift
Color.animalBlue
```

Cara penulisan ini lebih jelas berbanding menulis rentetan Hex secara langsung.

Apabila kita melihat `Color.animalBlue`, kita boleh tahu bahawa ia mewakili warna biru yang digunakan dalam ensiklopedia haiwan.

Tetapi apabila kita melihat `Color(hex: "#2c54c2")`, kita hanya tahu bahawa ia ialah satu nilai warna, dan tidak mudah untuk mengetahui kegunaan khususnya.

Mengurus warna secara berpusat juga mempunyai satu lagi kelebihan: perubahan kemudian menjadi lebih mudah.

Jika mahu melaraskan warna utama ensiklopedia haiwan, kita hanya perlu mengubah lokasi definisinya:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Semua tempat yang menggunakan warna ini akan dikemas kini bersama-sama.

Inilah maksud menggunakan `static` untuk menyusun warna: ia menjadikan nama warna lebih jelas dan penyelenggaraan kemudian lebih mudah.

## Aplikasikan pada Ensiklopedia Haiwan

Sekarang, kita boleh menggunakan warna tersuai dalam paparan ensiklopedia haiwan sebelum ini.

Sebelum ini, latar belakang butang haiwan berwarna putih:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Sekarang, kita boleh menukarnya kepada warna tersuai:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Di sini, `Color.animalBlue` ialah warna statik yang baru kita takrifkan dalam `Color+Hex.swift`.

Teks butang menggunakan warna putih:

```swift
.foregroundStyle(Color.white)
```

Latar belakang emoji haiwan menggunakan warna putih separa lut sinar:

```swift
.background(Color.white.opacity(0.15))
```

Dengan cara ini, butang akan membentuk gaya visual biru yang seragam.

Fokus langkah ini bukan untuk menambah kod yang kompleks, tetapi untuk benar-benar menggunakan warna tersuai yang dipelajari sebelum ini pada antara muka.

## Menggunakan Latar Belakang Gradasi

Selain menggunakan satu warna, kita juga boleh menggabungkan beberapa warna menjadi kesan gradasi.

Contohnya, kita telah mentakrifkan warna-warna ini sebelum ini:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Warna-warna ini bukan sahaja boleh digunakan secara berasingan, tetapi juga boleh digabungkan menjadi latar belakang gradasi.

Dalam SwiftUI, kita boleh menggunakan `LinearGradient` untuk mencipta gradasi linear.

Contohnya:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Kod ini akan mencipta latar belakang gradasi dari kiri ke kanan, dengan warna beransur-ansur berubah daripada `Color.animalBlue` kepada `Color.animalLightBlue`.

Di sini, `colors` digunakan untuk menetapkan warna yang terlibat dalam gradasi, manakala `startPoint` dan `endPoint` digunakan untuk mengawal arah gradasi.

### Uji Kesan Gradasi

Kita boleh menggunakan Text yang ringkas untuk menguji latar belakang gradasi.

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

Kesan paparan:

![color](../../../Resource/031_color3.png)

Dalam contoh ini, latar belakang `Text` bukan lagi satu warna tunggal, tetapi warna gradasi yang berubah secara beransur-ansur dari kiri ke kanan.

Berbanding warna latar belakang biasa, latar belakang gradasi mempunyai lebih banyak lapisan, dan lebih mudah menghasilkan fokus visual dalam antara muka.

## Menggunakan Latar Belakang Gradasi dalam Ensiklopedia Haiwan

Sekarang, kita boleh menukar warna latar belakang butang haiwan:

```swift
.background(Color.animalBlue)
```

Menjadi latar belakang gradasi:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Kod lengkap adalah seperti berikut:

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

Kesan paparan:

![color](../../../Resource/031_color4.png)

Sekarang, butang haiwan bukan lagi hanya mempunyai satu warna latar belakang, tetapi mempunyai kesan gradasi dari kiri ke kanan.

Berbanding latar belakang satu warna, latar belakang gradasi boleh menjadikan antara muka kelihatan lebih berlapis dan lebih hampir kepada reka bentuk visual App sebenar.

## Perbezaan Antara Latar Belakang Satu Warna dan Latar Belakang Gradasi

Latar belakang satu warna hanya menggunakan satu warna.

Contohnya:

```swift
.background(Color.animalBlue)
```

Cara penulisan ini mudah dan jelas, sesuai untuk kebanyakan antara muka asas.

Latar belakang gradasi menggunakan beberapa warna.

Contohnya:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Cara penulisan ini boleh menjadikan antara muka lebih berlapis, tetapi juga lebih mudah menambah kerumitan visual.

Jadi, dalam pembangunan sebenar, kita boleh memahaminya begini:

Latar belakang satu warna sesuai untuk teks biasa, butang biasa, kad biasa dan latar belakang halaman biasa.

Latar belakang gradasi sesuai untuk butang utama, kawasan atas, kad muka depan, pintu masuk fungsi dan kedudukan lain yang perlu diberi penekanan.

## Ringkasan

Dalam pelajaran ini, kita belajar cara menggunakan warna tersuai dalam SwiftUI.

Pertama, kita memahami warna Hex.

Contohnya:

```text
#2c54c2
```

Ia mewakili satu warna khusus.

Kemudian, kita menggunakan `extension Color` untuk mengembangkan jenis `Color`.

Ini membolehkan SwiftUI mencipta warna dengan cara berikut:

```swift
Color(hex: "#2c54c2")
```

Seterusnya, kita menggunakan `static` untuk menyusun warna yang kerap digunakan:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Dengan cara ini, dalam paparan lain kita boleh menggunakannya secara langsung:

```swift
Color.animalBlue
```

Berbanding menulis rentetan Hex setiap kali, cara ini lebih jelas dan lebih memudahkan perubahan warna secara seragam pada masa depan.

Akhir sekali, kita belajar `LinearGradient`, dan menggabungkan warna tersuai menjadi latar belakang gradasi:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Melalui pelajaran ini, kita telah melengkapkan proses daripada “mencipta warna tersuai” kepada “menggunakan warna dalam antara muka sebenar”.

Selepas ini, apabila satu warna perlu digunakan berulang kali di beberapa tempat, kita boleh terlebih dahulu mempertimbangkan untuk menyusunnya dalam sambungan `Color`.

Dengan cara ini, kod akan menjadi lebih jelas dan gaya antara muka juga lebih mudah diseragamkan.
