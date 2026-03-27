# Swift dan SwiftUI

Semasa mempelajari pembangunan untuk platform Apple, banyak tutorial cenderung menerangkan Swift dan SwiftUI secara berasingan. Ini mudah membuatkan pemula berasa terpisah, dan menyangka bahawa kedua-duanya ialah dua teknologi yang sama sekali berasingan.

Sebenarnya, Swift dan SwiftUI ialah satu keseluruhan yang bergabung rapat: Swift ialah bahasa pengaturcaraan yang bertanggungjawab menyediakan logik dan data; manakala SwiftUI ialah rangka kerja antara muka pengguna yang dibina berasaskan Swift, dan bertanggungjawab terhadap perenderan serta interaksi view.

Pelajaran ini akan membantu anda membina satu rangka pemahaman yang jelas: apakah itu Swift, apakah itu SwiftUI, dan bagaimana kedua-duanya bekerjasama dalam kod.

## Apakah itu Swift?

Swift ialah satu bahasa pengaturcaraan moden yang diperkenalkan oleh Apple, dan digunakan untuk membangunkan aplikasi pada platform seperti iOS、macOS、watchOS dan tvOS。

![swift](../../RESOURCE/010_swift.png)

Swift ialah bahasa yang bertipe kuat dan statik. Dari segi reka bentuk, ia lebih menekankan keselamatan, mengurangkan banyak ralat pengaturcaraan yang biasa（seperti penuding kosong, akses melebihi sempadan dan sebagainya）, dan menyokong integrasi tanpa cela dengan C serta Objective-C。

Dalam pembangunan sebenar, Swift lebih banyak bertanggungjawab terhadap bahagian logik aplikasi, seperti pemprosesan data, permintaan rangkaian, operasi penyimpanan dan sebagainya.

## Apakah itu SwiftUI？

SwiftUI ialah satu rangka kerja baharu untuk membina antara muka yang diperkenalkan oleh Apple pada tahun 2019. SwiftUI menggunakan model pengaturcaraan deklaratif, membolehkan pembangun menerangkan struktur antara muka dan tingkah laku interaksi dengan kod yang lebih ringkas.

![swiftui](../../RESOURCE/010_swiftui.png)

Pengaturcaraan deklaratif bermaksud pembangun hanya perlu memberitahu sistem apa yang ingin dipaparkan, dan sistem akan menyegarkan view secara automatik berdasarkan perubahan data. Ia tidak lagi memerlukan pengemaskinian keadaan antara muka secara manual, lalu sangat memudahkan kerumitan pembangunan UI.

Teras SwiftUI ialah komponen view（seperti `Text`、`Image`、`Button` dan lain-lain）serta bekas susun atur（seperti `VStack`、`HStack`、`ZStack`）。Komponen-komponen ini berinteraksi melalui pengikatan data dan pengurusan state, membolehkan antara muka bertindak balas terhadap perubahan data dan menyegarkan secara automatik.

## Bagaimana Swift dan SwiftUI bekerjasama?

Tanggungjawab Swift dan SwiftUI boleh diringkaskan seperti berikut:

**1. Swift：memproses logik dan data**

Swift terutamanya digunakan untuk mengurus data, menyimpan state dan melaksanakan logik. Kod-kod ini biasanya tidak memberi kesan secara langsung kepada perenderan antara muka, sebaliknya bertanggungjawab terhadap pemprosesan data dan tingkah laku.

Contohnya, memproses data dalam Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Kod-kod ini melibatkan deklarasi pembolehubah, definisi pemalar, fungsi, aliran kawalan dan sebagainya, dan tidak mempengaruhi paparan view secara langsung.

**2. SwiftUI：mengisytiharkan dan merender antara muka**

SwiftUI pula digunakan untuk membina susun atur dan kandungan antara muka pengguna, dan bertanggungjawab terutamanya untuk merender antara muka serta interaksi view.

Contohnya, menggunakan SwiftUI untuk mencipta satu text view:

```swift
Text("SwiftSlim")
```

Semua ini ialah kod yang digunakan untuk membina dan mengawal elemen antara muka, dan ia berinteraksi secara langsung dengan antara muka pengguna.

### Contoh asas

Berikut ialah satu contoh SwiftUI yang mudah:

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

Dalam contoh ini:

**Kod SwiftUI**：`VStack`、`Image`、`Text` dan `padding` semuanya tergolong dalam SwiftUI, dan bertanggungjawab untuk paparan serta susun atur antara muka.

**Kod Swift**：komen `//` di bahagian atas fail dan `import SwiftUI` tergolong dalam struktur kod Swift; `#Preview` di bahagian bawah ialah makro yang digunakan untuk pratonton Xcode, dan tidak mengambil bahagian dalam perenderan antara muka sebenar.

### Contoh lanjutan

Dalam projek sebenar, Swift dan SwiftUI kerap digunakan secara bercampur untuk menyelesaikan tugas yang masing-masing mahir:

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

Dalam contoh ini:

**Kod SwiftUI**：`@State` ialah pembungkus sifat khas milik SwiftUI, digunakan untuk mengisytiharkan state yang boleh berubah bagi view; `Button` dan `Text` ialah komponen view SwiftUI yang bertanggungjawab terhadap paparan antara muka dan interaksi pengguna.

**Kod Swift**：`private var name` dan `func printName()` ialah kod Swift yang digunakan untuk menyimpan data dan melaksanakan logik, dan tidak mempengaruhi perenderan view secara langsung.

Apabila pengguna menekan butang, SwiftUI akan mencetuskan kod operasi dalam butang:

```swift
Button("Print") {
    printName()
}
```

Di sini, `Button` ialah komponen SwiftUI, manakala fungsi `printName()` yang dilaksanakan ialah kod Swift yang bertanggungjawab terhadap pemprosesan logik khusus.

Kerjasama seperti ini membolehkan Swift dan SwiftUI digabungkan dengan lancar: Swift mengurus data dan logik, manakala SwiftUI mengendalikan paparan antara muka pengguna.

## Kod Swift dan SwiftUI biasanya ditulis di mana?

Dalam SwiftUI, antara muka dibina melalui view yang dipulangkan oleh sifat `body`。Oleh itu, semua kod yang digunakan untuk menerangkan antara muka biasanya ditulis di dalam `body`。

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Dalam contoh ini, `Text` ialah komponen view SwiftUI, jadi ia mesti ditulis di dalam `body`，kerana SwiftUI akan membaca `body` untuk menjana antara muka.

Kod yang tidak berkaitan dengan antara muka, seperti pembolehubah, fungsi atau logik pemprosesan data, biasanya ditulis di luar `body`。Contohnya:

```swift
struct ContentView: View {

    // Swift：data atau logik
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI：antara muka
    var body: some View {
        Text(name)
    }
}
```

Perlu diperhatikan bahawa sintaks Swift masih boleh digunakan di dalam `body`，seperti `if`、`for` dan kenyataan kawalan aliran yang lain. Ia hanya digunakan untuk mengawal penjanaan SwiftUI view:

```
if isLogin {
    Text("Welcome")
}
```

Oleh itu, dalam pembangunan SwiftUI, kita boleh fahami secara ringkas: kod view（`Text`、`Image`、`Button` dan sebagainya）biasanya ditulis di dalam `body`；kod data dan logik（pembolehubah, fungsi dan sebagainya）biasanya ditulis di luar `body`。

## Fail Swift

Apabila pembelajaran semakin mendalam, kita juga akan menyentuh seni bina MVVM. Dalam seni bina ini, lapisan ViewModel dan Model biasanya terdiri daripada kod Swift tulen, dan dipisahkan sepenuhnya daripada lapisan view（SwiftUI）。

Contohnya, kelas yang digunakan untuk mengurus status aplikasi:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Atau struktur yang menerangkan struktur data:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Tanggungjawab fail-fail seperti ini ialah mengurus dan mengekalkan data, dan ia tidak dipaparkan terus dalam view. Oleh itu, ia sepenuhnya tergolong dalam Swift.

## Latar belakang sejarah

Untuk memahami hubungan antara Swift dan SwiftUI, kita juga perlu memahami evolusi teknologi pembangunan Apple. Sehingga tahun 2026, timbunan teknologi ini telah melalui beberapa iterasi.

### Sejarah Swift

Sebelum Swift muncul, Objective-C ialah bahasa pengaturcaraan utama pada platform Apple, dan ia menyokong campuran dengan bahasa C. Sintaksnya agak panjang dan lebih sukar bagi pemula:

```Obj-c
// Penulisan Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Pada tahun 2014, Apple melancarkan bahasa Swift di WWDC. Sintaks Swift lebih moden dan mempunyai keselamatan jenis yang lebih tinggi, lalu secara beransur-ansur menggantikan Objective-C sebagai bahasa pembangunan arus perdana:

```swift
// Penulisan Swift
let name = "Fang"
print("Hello, \(name)")
```

Namun begitu, Objective-C tidak terus hilang daripada dunia pembangunan. Ia masih digunakan secara meluas dalam banyak projek sedia ada dan rangka kerja aras bawah. Memahami sintaks asasnya masih bernilai untuk menyelenggara projek lama dan memahami sistem pada aras bawah.

### Sejarah SwiftUI

Sebelum SwiftUI muncul, iOS menggunakan **UIKit**，manakala macOS menggunakan **AppKit**。Dua rangka kerja ini menggunakan cara pengaturcaraan “imperatif”. Pembangun perlu menggunakan Storyboard untuk menyeret komponen atau menulis kod secara manual bagi mengawal status view. Ini menghasilkan banyak kod dan kos penyelenggaraan yang tinggi, terutamanya apabila logik antara muka menjadi kompleks.

![storyboard](../../RESOURCE/010_xcode.png)

Pada tahun 2019, Apple secara rasmi melancarkan SwiftUI di WWDC. SwiftUI memperkenalkan paradigma pengaturcaraan “deklaratif”, lalu sangat memudahkan aliran pembangunan UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Perlu diperhatikan bahawa SwiftUI bukanlah pelaksanaan aras bawah yang benar-benar bebas. Pada setiap platform, pada asasnya ia merupakan lapisan yang menjambatani dan bekerjasama dengan UIKit（iOS）atau AppKit（macOS），dan pada aras bawah ia masih bergantung pada kedua-dua rangka kerja ini untuk beroperasi.

### Hubungan Swift dengan UIKit/AppKit

Walaupun Swift ialah bahasa pengaturcaraan serba guna yang boleh berjalan pada pelbagai platform Apple, ia tidak dapat menggantikan UIKit atau AppKit sepenuhnya. Untuk sesetengah keperluan antara muka yang lebih kompleks, atau ciri yang masih belum diliputi oleh SwiftUI, kita masih perlu bergantung kepada UIKit atau AppKit untuk melaksanakannya.

Contohnya, UIKit sudah sangat matang dalam pengurusan view controller yang kompleks, kesan animasi, pengecaman gerak isyarat dan sebagainya, serta telah terkumpul dengan banyak pengesahan amalan pengeluaran. Walaupun kemampuan SwiftUI terus dipertingkatkan, ia masih mempunyai had dalam sesetengah situasi pinggiran.

Oleh itu, ramai pembangun akan menggunakan SwiftUI bersama UIKit（atau AppKit）dalam projek mereka, untuk memanfaatkan sepenuhnya kelebihan masing-masing.

Dari sudut ini, kita boleh memahami SwiftUI sebagai satu pembungkusan peringkat lebih tinggi terhadap UIKit / AppKit. Semasa mempelajari SwiftUI, memahami konsep asas UIKit dan AppKit dengan sewajarnya boleh membantu membuat keputusan teknikal yang lebih munasabah ketika menyelenggara projek lama atau melaksanakan ciri kompleks.

## Ringkasan

**Swift**：digunakan terutamanya untuk menulis logik, pemprosesan data, aliran kawalan dan sebagainya, dan tidak berkaitan secara langsung dengan susun atur view.

**SwiftUI**：digunakan untuk membina antara muka pengguna secara deklaratif. Kod yang berkaitan dengan kandungan view dan susun atur tergolong dalam SwiftUI。

Dalam pembangunan sebenar, Swift dan SwiftUI biasanya digunakan bersama: Swift mengendalikan logik, dan SwiftUI mengendalikan antara muka.

Daripada Objective-C dan UIKit kepada Swift dan SwiftUI, persekitaran pembangunan Apple secara beransur-ansur bergerak ke arah gaya pengaturcaraan yang lebih moden dan ringkas, tetapi UIKit dan AppKit masih tidak boleh diabaikan dalam banyak projek tradisional.

Dengan memahami hubungan antara Swift dan SwiftUI, kita boleh menjalankan pembangunan iOS/macOS dengan lebih cekap, dan juga membuat pilihan teknikal yang lebih munasabah ketika menyelenggara projek lama.
