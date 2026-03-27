# Swift dan SwiftUI

Saat mempelajari pengembangan di platform Apple, banyak tutorial cenderung menjelaskan Swift dan SwiftUI secara terpisah. Hal ini mudah membuat pemula merasa keduanya terpisah, bahkan salah mengira bahwa Swift dan SwiftUI adalah dua teknologi yang sepenuhnya berdiri sendiri.

Padahal, Swift dan SwiftUI merupakan satu kesatuan yang terintegrasi erat: Swift adalah bahasa pemrograman yang bertanggung jawab menyediakan logika dan data; sedangkan SwiftUI adalah framework antarmuka pengguna yang dibangun di atas Swift, dan bertugas merender view serta menangani interaksi.

Pelajaran ini akan membantumu membangun kerangka pemahaman yang jelas: apa itu Swift, apa itu SwiftUI, dan bagaimana keduanya bekerja sama di dalam kode.

## Apa itu Swift?

Swift adalah bahasa pemrograman modern yang diluncurkan oleh Apple, dan digunakan untuk mengembangkan aplikasi di platform seperti iOS, macOS, watchOS, dan tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift adalah bahasa yang bertipe kuat dan statis, dengan desain yang lebih menekankan keamanan, sehingga mengurangi banyak kesalahan pemrograman umum seperti null pointer atau out of bounds. Swift juga mendukung integrasi yang mulus dengan C dan Objective-C.

Dalam pengembangan nyata, Swift lebih banyak bertanggung jawab pada bagian logika aplikasi, misalnya pemrosesan data, permintaan jaringan, operasi penyimpanan, dan lain-lain.

## Apa itu SwiftUI?

SwiftUI adalah framework baru untuk membangun antarmuka yang diluncurkan Apple pada tahun 2019. SwiftUI menggunakan model pemrograman deklaratif, yang memungkinkan developer mendeskripsikan struktur antarmuka dan perilaku interaksi dengan kode yang lebih ringkas.

![swiftui](../../RESOURCE/010_swiftui.png)

Pemrograman deklaratif berarti developer hanya perlu memberi tahu sistem apa yang ingin ditampilkan, lalu sistem akan secara otomatis memperbarui view berdasarkan perubahan data. Kita tidak lagi perlu memperbarui status antarmuka secara manual, sehingga kompleksitas pengembangan UI jauh berkurang.

Inti SwiftUI adalah komponen view seperti `Text`, `Image`, `Button`, dan kontainer layout seperti `VStack`, `HStack`, `ZStack`. Komponen-komponen ini berinteraksi melalui data binding dan state management, sehingga antarmuka dapat merespons perubahan data dan menyegarkan diri secara otomatis.

## Bagaimana Swift dan SwiftUI bekerja sama?

Tugas Swift dan SwiftUI dapat diringkas sebagai berikut:

**1. Swift: menangani logika dan data**

Swift terutama digunakan untuk mengelola data, menyimpan state, dan menjalankan logika. Kode-kode ini biasanya tidak secara langsung memengaruhi rendering antarmuka, melainkan bertanggung jawab atas pemrosesan data dan perilaku.

Misalnya, memproses data di Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Kode seperti ini melibatkan deklarasi variabel, konstanta, fungsi, kontrol alur, dan sebagainya, tetapi tidak langsung memengaruhi tampilan view.

**2. SwiftUI: mendeklarasikan dan merender antarmuka**

SwiftUI digunakan untuk membangun tata letak dan isi antarmuka pengguna, dan terutama bertanggung jawab merender antarmuka serta interaksi view.

Misalnya, membuat sebuah view teks dengan SwiftUI:

```swift
Text("SwiftSlim")
```

Semua ini adalah kode yang digunakan untuk membangun dan mengontrol elemen antarmuka, dan berinteraksi langsung dengan UI.

### Contoh dasar

Berikut adalah contoh SwiftUI sederhana:

```swift
// ContentView.swift

import SwiftUI

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

#Preview {
    ContentView()
}
```

Di dalam contoh ini:

**Kode SwiftUI**: `VStack`, `Image`, `Text`, dan `padding` semuanya termasuk SwiftUI, bertanggung jawab atas tampilan dan tata letak antarmuka.

**Kode Swift**: komentar `//` di bagian atas file dan `import SwiftUI` termasuk struktur kode Swift; sedangkan `#Preview` di bagian bawah adalah macro untuk pratinjau Xcode, dan tidak ikut serta dalam rendering antarmuka sebenarnya.

### Contoh lanjutan

Dalam proyek nyata, Swift dan SwiftUI sering digunakan bersama untuk menyelesaikan tugas yang paling cocok untuk masing-masing:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Di dalam contoh ini:

**Kode SwiftUI**: `@State` adalah property wrapper khas SwiftUI yang digunakan untuk mendeklarasikan state view yang bisa berubah; `Button` dan `Text` adalah komponen view SwiftUI yang bertanggung jawab atas tampilan dan interaksi antarmuka.

**Kode Swift**: `private var name` dan `func printName()` adalah kode Swift yang digunakan untuk menyimpan data dan menjalankan logika, bukan untuk langsung merender view.

Ketika pengguna menekan tombol, SwiftUI akan memicu kode aksi di dalam tombol:

```swift
Button("Print") {
    printName()
}
```

Di sini, `Button` adalah komponen SwiftUI, sedangkan fungsi `printName()` yang dijalankannya adalah kode Swift yang bertanggung jawab atas logika spesifik.

Kolaborasi seperti ini membuat Swift dan SwiftUI dapat menyatu dengan mulus: Swift menangani data dan logika, sedangkan SwiftUI menangani tampilan antarmuka pengguna.

## Di mana biasanya kode Swift dan SwiftUI ditulis?

Di SwiftUI, antarmuka dibangun melalui view yang dikembalikan oleh properti `body`. Karena itu, semua kode yang digunakan untuk mendeskripsikan antarmuka biasanya ditulis di dalam `body`.

Misalnya:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Dalam contoh ini, `Text` adalah komponen view SwiftUI, sehingga harus ditulis di dalam `body`, karena SwiftUI membaca `body` untuk membangun antarmuka.

Kode yang tidak berhubungan langsung dengan antarmuka, seperti variabel, fungsi, atau logika pemrosesan data, biasanya ditulis di luar `body`. Misalnya:

```swift
struct ContentView: View {

    // Swift: data atau logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: antarmuka
    var body: some View {
        Text(name)
    }
}
```

Perlu diperhatikan bahwa kita tetap bisa menggunakan sintaks Swift di dalam `body`, misalnya `if`, `for`, dan kontrol alur lainnya, tetapi perannya adalah untuk mengontrol pembentukan view SwiftUI:

```
if isLogin {
    Text("Welcome")
}
```

Karena itu, dalam pengembangan SwiftUI kita bisa memahami secara sederhana bahwa: kode view seperti `Text`, `Image`, `Button`, dan sejenisnya biasanya ditulis di dalam `body`; sedangkan kode data dan logika seperti variabel dan fungsi biasanya ditulis di luar `body`.

## File Swift

Seiring pembelajaran semakin dalam, kita nanti juga akan mengenal arsitektur `MVVM`, di mana lapisan `ViewModel` dan `Model` biasanya terdiri dari kode Swift murni, yang sepenuhnya terpisah dari lapisan view (`SwiftUI`).

Misalnya, kelas untuk mengelola state aplikasi:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Atau struktur yang menggambarkan struktur data:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Tugas file-file seperti ini adalah mengelola dan mempersistenkan data, bukan langsung menampilkan sesuatu di view. Karena itu, file seperti ini sepenuhnya termasuk ranah Swift.

## Latar belakang sejarah

Untuk memahami hubungan antara Swift dan SwiftUI, kita juga perlu melihat perkembangan teknologi pengembangan Apple. Hingga tahun 2026, tumpukan teknologi ini telah mengalami beberapa iterasi besar.

### Sejarah Swift

Sebelum Swift muncul, bahasa pemrograman utama di platform Apple adalah Objective-C, yang mendukung penggunaan campuran dengan bahasa C. Sintaksnya relatif panjang dan bagi pemula memiliki hambatan masuk yang cukup tinggi:

```Obj-c
// Penulisan Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Pada tahun 2014, Apple merilis bahasa Swift di WWDC. Sintaks Swift lebih modern, keamanan tipenya lebih tinggi, dan secara bertahap menggantikan Objective-C sebagai bahasa pengembangan utama:

```swift
// Penulisan Swift
let name = "Fang"
print("Hello, \(name)")
```

Namun, Objective-C tidak benar-benar meninggalkan panggung sejarah. Bahasa ini masih digunakan secara luas di banyak proyek lama dan framework lapisan bawah. Memahami sintaks dasarnya tetap bernilai untuk memelihara proyek lama dan memahami sisi internal sistem.

### Sejarah SwiftUI

Sebelum SwiftUI muncul, iOS menggunakan **UIKit**, sedangkan macOS menggunakan **AppKit**. Kedua framework ini memakai pendekatan pemrograman “imperatif”. Developer perlu menyeret kontrol melalui Storyboard atau menulis kode secara manual untuk mengontrol status view, sehingga jumlah kodenya besar dan biaya perawatannya tinggi, terutama ketika logika antarmukanya rumit.

![storyboard](../../RESOURCE/010_xcode.png)

Pada tahun 2019, Apple secara resmi merilis SwiftUI di WWDC. SwiftUI memperkenalkan paradigma pemrograman “deklaratif”, yang secara signifikan menyederhanakan alur pengembangan UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Perlu diperhatikan bahwa SwiftUI bukan implementasi lapisan bawah yang sepenuhnya berdiri sendiri. Di tiap platform, pada dasarnya ia melakukan bridging dan bekerja sama dengan UIKit (iOS) atau AppKit (macOS), dan lapisan bawahnya tetap bergantung pada dua framework tersebut.

### Hubungan Swift dengan UIKit/AppKit

Meskipun Swift adalah bahasa pemrograman umum yang bisa berjalan di berbagai platform Apple, ia tidak bisa sepenuhnya menggantikan UIKit atau AppKit. Untuk beberapa kebutuhan antarmuka yang kompleks, atau fungsi-fungsi yang belum sepenuhnya dicakup SwiftUI, kita tetap perlu mengandalkan UIKit atau AppKit.

Misalnya, UIKit sudah sangat matang dalam menangani manajemen view controller yang kompleks, efek animasi, pengenalan gesture, dan aspek lainnya, serta telah teruji luas dalam praktik produksi. Walaupun kemampuan SwiftUI terus meningkat, dalam beberapa skenario pinggiran tetap masih ada keterbatasan.

Karena itu, banyak developer mencampur penggunaan SwiftUI dan UIKit atau AppKit dalam satu proyek, agar bisa memanfaatkan keunggulan masing-masing.

Dari sudut pandang ini, SwiftUI dapat dipahami sebagai lapisan abstraksi tingkat tinggi di atas UIKit / AppKit. Sambil mempelajari SwiftUI, memahami konsep dasar UIKit dan AppKit secara tepat juga akan membantu kita membuat keputusan teknis yang lebih masuk akal saat memelihara proyek lama atau mewujudkan fitur yang kompleks.

## Ringkasan

**Swift**: terutama digunakan untuk menulis logika, pemrosesan data, dan kontrol alur, dan tidak berkaitan langsung dengan tata letak view.

**SwiftUI**: digunakan untuk membangun antarmuka pengguna secara deklaratif, dan kode untuk isi serta tata letak view termasuk ranah SwiftUI.

Dalam pengembangan nyata, Swift dan SwiftUI biasanya digunakan bersama: Swift menangani logika, sedangkan SwiftUI menangani antarmuka.

Dari Objective-C dan UIKit menuju Swift dan SwiftUI, lingkungan pengembangan Apple secara bertahap bergerak menuju cara pemrograman yang lebih modern dan lebih ringkas. Namun, UIKit dan AppKit tetap tidak bisa diabaikan dalam banyak proyek tradisional.

Dengan memahami hubungan antara Swift dan SwiftUI, kita bisa mengembangkan aplikasi iOS/macOS dengan lebih efisien, dan juga membuat pilihan teknis yang lebih tepat ketika memelihara proyek lama.
