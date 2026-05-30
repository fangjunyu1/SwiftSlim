# Memahami paparan

Dalam pelajaran ini, kita kembali semula ke `ContentView` yang paling awal.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Pada masa pertama kali mengenal SwiftUI, ada banyak kata kunci dalam `ContentView` yang belum kita fahami.

Sebagai contoh kata kunci seperti `struct`, `View`, `var`, `body`, `some View`, dan sebagainya.

Pada masa itu mungkin kita hanya tahu: **jika kod ditulis dalam `body`, maka kandungan akan dipaparkan di antara muka.**

Sekarang, kita sudah mempelajari `struct`, pemboleh ubah, kaedah, dan protokol. Kita boleh memahami semula kod ini untuk membantu memahami hubungan antara view di SwiftUI.

## Meninjau kembali ContentView

Selepas mencipta projek SwiftUI, Xcode secara lalai akan menjana satu fail `ContentView`.

Contoh kodnya seperti berikut:

```swift
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
```

Kod ini boleh difahami dengan membahagikannya menjadi beberapa bahagian.

Pertama ialah:

```swift
import SwiftUI
```

Baris kod ini bermaksud mengimport framework SwiftUI.

Selepas mengimport SwiftUI, barulah kita boleh menggunakan view SwiftUI seperti `View`, `Text`, `Image`, `VStack`, `Button`, dan lain-lain.

## Struktur ContentView

Baris kod ini bermaksud mencipta satu struktur:

```swift
struct ContentView: View
```

Di antaranya:

```swift
struct ContentView
```

bermaksud `ContentView` ialah satu struktur.

Pada pelajaran sebelum ini, kita sudah memahami struktur `struct`. Ia boleh menggabungkan pelbagai field menjadi satu, dan boleh mengandungi property serta kaedah.

Sebagai contoh:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

Dalam contoh ini, `ContentView` mengandungi tiga hal: `name`, `printName`, dan `body`.

Dengan kata lain, `struct` boleh menggabungkan property, kaedah, dan kandungan view yang saling berkaitan.

![contentView](../../Resource/023_contentVIew.png)

## View ialah satu protokol

Lanjutkan melihat baris kod ini:

```swift
struct ContentView: View 
```

`View` setelah tanda titik dua bermaksud: `ContentView` mengikuti protokol `View`.

Kita boleh memahaminya begini: jika `ContentView` ingin menjadi satu SwiftUI view, maka ia harus memenuhi persyaratan protokol `View`.

### Protokol Identifiable

Pada masa sebelum ini mempelajari daftar film, kita sudah bersentuhan dengan protokol `Identifiable`.

Pada masa itu, kita perlu melakukan traversal pada array `Movie` dalam `ForEach`, tetapi struktur `Movie` tidak memiliki identitas unik, sehingga tidak mendukung traversal `ForEach`.

Pada saat itu, kita perlu mencipta struktur `Movie` mengikuti protokol `Identifiable`, agar sesuai dengan persyaratan `ForEach` terhadap identitas unik.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Persyaratan protokol `Identifiable` ialah: **tipe ini memiliki satu field `id` untuk mengidentifikasi dirinya sendiri.**

Selepas `Movie` menyediakan field `id`, ia boleh memenuhi persyaratan `Identifiable`.

Dengan begitu, saat kita menggunakannya di `ForEach`, SwiftUI boleh mengenali setiap data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protokol View

Protokol `View` juga seperti itu.

Jika satu tipe ingin menjadi SwiftUI view, maka ia perlu mengikuti protokol `View`.

Dan persyaratan terpenting dari protokol `View` ialah menyediakan satu `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Kita boleh memahaminya begini: protokol `View` mengharuskan **hanya menerima SwiftUI view yang dikembalikan oleh `body`, sedangkan `ContentView` memaparkan SwiftUI view melalui `body`.**

### Apa yang terjadi jika tidak mengikuti View?

Jika kita menulis seperti ini:

```swift
struct ContentView {
}
```

Ini hanya satu struktur biasa, bukan SwiftUI view.

Ia tidak akan langsung error, karena struktur biasa itu sendiri ialah kod Swift yang valid.

Namun, jika kita menaruhnya di preview:

```swift
#Preview {
    ContentView()
}
```

Pada masa itu akan muncul error.

Alasannya ialah: **preview perlu memaparkan satu SwiftUI view, sedangkan `ContentView` ini tidak mengikuti protokol `View`.**

Karena itu, jika kita ingin `ContentView` boleh dipaparkan di antara muka, kita perlu menciptanya mengikuti protokol `View`:

```swift
struct ContentView: View {
}
```

Pada saat yang sama, sesuai persyaratan protokol `View`, kita harus menyediakan `body`. Jika tidak ada `body`, compiler tetap akan melaporkan error.

Cara penulisan yang benar:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Pada saat ini, `ContentView` barulah menjadi SwiftUI view yang benar-benar boleh didipaparkankan.

## body ialah pintu masuk dipaparkanan view

Di SwiftUI, `body` ialah pintu masuk untuk kandungan view.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Ini boleh dibagi menjadi tiga bahagian:

**1. var body**

```swift
var body
```

Berarti mendefinisikan satu pemboleh ubah bernama `body`.

**2. some View**

```swift
: some View
```

Berarti `body` ini akan mengembalikan satu view.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Menunjukkan kandungan view yang didipaparkankan. Dalam kod ini yang didipaparkankan ialah satu view `Text`.

Dengan kata lain, apa pun yang ditulis dalam `body`, itulah yang dipaparkan di antara muka.

Sebagai contoh:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Kod ini bermaksud: **di antara muka didipaparkankan kandungan yang tersusun vertikal, dan dalamnya ada dua teks.**

### Nama body tidak boleh diubah sesuka hati

Perlu diperhatikan bahwa nama `body` tidak boleh diubah begitu saja.

Jika ditulis menjadi:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

`content` ini memang juga satu property view, tetapi ia tidak boleh menggantikan `body`.

Karena nama yang diminta oleh protokol `View` memang `body`.

## Apa itu some View?

Di SwiftUI, `some View` bermaksud mengembalikan satu view konkret, hanya saja kita tidak perlu menuliskan tipe lengkap dari view tersebut.

```swift
var body: some View
```

Dengan kata lain, `some View` bukan bermaksud tidak memiliki tipe. Tipe aslinya tetap ada, compiler mengetahui tipe tersebut, tetapi tipe itu mungkin sangat kompleks, sehingga Swift mengizinkan kita menyembunyikannya dengan `some View`.

### Apa itu some?

Di Swift, `some` ialah kata kunci untuk mendeklarasikan opaque type, atau tipe buram.

Arti opaque type ialah: **nilai return memiliki satu tipe konkret, compiler tahu tipe konkret itu apa, tetapi kita tidak menuliskan tipe konkret tersebut secara langsung.**

Sebagai contoh:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Ini bermaksud `makeView` akan mengembalikan satu tipe konkret yang mengikuti protokol `View`.

### Mengapa membutuhkan some?

Pada masa mempelajari pemboleh ubah, kita sudah mengetahui: **nilai di Swift perlu diberi anotasi tipe secara eksplisit, atau tipenya disimpulkan otomatis oleh compiler.**

Sebagai contoh:

```swift
let a: Int = 10
```

Di sini konstanta `a` bertipe `Int`.

SwiftUI view juga tidak terkecuali. Pada masa kita menggunakan `body` untuk memaparkan SwiftUI view, kita perlu mencipta `body` mengembalikan tipe SwiftUI yang sesuai.

Sebagai contoh, jika kita menggunakan `body` untuk memaparkan satu text view `Text`, maka kita perlu mencipta `body` mengembalikan tipe `Text` yang sesuai.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Dalam contoh ini, yang didipaparkankan dalam `body` ialah satu view `Text`, dan tipe return-nya juga `Text`.

Hanya ketika tipe dalamnya dan tipe yang diisytiharkan sama, barulah memenuhi persyaratan compiler tentang konsistensi tipe.

**Masalah tipe tidak konsisten**

Jika kita mengatur tipe `body` menjadi `Color`, tetapi yang didipaparkankan ialah `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

Tipe `body` dan tipe kod dalamnya tidak konsisten, sehingga akan memicu error tipe tidak cocok.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Pada saat ini, kita perlu mengubah tipe return `body` secara manual.

**Tipe view yang kompleks**

Dalam pengembangan nyata, antara muka biasanya tidak hanya memiliki satu `Text`.

Jika perlu memaparkan `VStack` yang lebih kompleks, kita perlu memberi anotasi tipe return yang kompleks secara manual.

Sebagai contoh:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Kod ini bermaksud mengembalikan satu `VStack`, dan dalam `VStack` terboleh view bertipe `Image` dan `Text`.

Tipe return dari `body` ialah:

```swift
VStack<TupleView<(Image,Text)>>
```

Bisa dilihat, tipe return ini sangat kompleks, dan juga muncul `TupleView` baru yang belum pernah kita lihat sebelum ini.

`TupleView` di sini boleh difahami sebagai: **membungkus beberapa child view menjadi satu view.**

**Tipe view yang lebih kompleks**

Jika kita menambahkan modifier ke view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Maka tipe return view ini menjadi sangat kompleks, dan tidak mungkin dijelaskan secara konkret di sini.

Tipe return yang ada, `VStack<TupleView<(Image,Text)>>`, akan gagal karena tidak boleh menjelaskan modifier, sehingga terjadi error.

**some View menyederhanakan tipe return**

Untuk situasi seperti ini, SwiftUI menyediakan solusi yang ringkas, yaitu menggunakan `some View` untuk menyederhanakan penulisan.

Pada masa kita mengubah `body` menjadi tipe `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Setiap kali mengubah kod view, kita tidak perlu lagi menuliskan tipe return lengkapnya.

Ini karena `some View` bermaksud mengembalikan satu view konkret yang mengikuti protokol `View`.

Dengan kata lain, SwiftUI view seperti `VStack`, `Image`, dan lain-lain semuanya mengikuti protokol `View`. Tipe view yang dikembalikan setelah menambahkan modifier juga tetap mengikuti protokol `View`.

Jadi semuanya boleh dikembalikan sebagai `some View`.

### some View tidak boleh sembarang mengembalikan view apa pun

Walaupun `some View` boleh menyembunyikan tipe yang kompleks, ia bukan bermaksud "tidak memiliki tipe".

Aturan intinya ialah: **compiler harus boleh menentukan satu tipe return konkret**.

Sebagai contoh:

```swift
var title: some View {
    Text("Hello")
}
```

Di sini yang dikembalikan ialah view `Text`.

Namun, jika mencoba mengembalikan dua view, akan terjadi error:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Karena `some View` pada akhirnya perlu mengembalikan satu struktur view, sedangkan di sini kita mencoba mengembalikan dua view yang terpisah.

### Penyelesaian

Penyelesaiannya biasanya ada dua: container dan `@ViewBuilder`.

**1. Bungkus dengan container**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Dalam kod ini, `title` mengembalikan satu `VStack`, sedangkan `Text` dan `Image` ialah child view dalam `VStack`.

Struktur view yang diterima oleh `some View` ialah satu `VStack<...>`, sehingga sesuai dengan persyaratan `some View` untuk mengembalikan satu struktur view. 

Inilah sebabnya sejak awal belajar SwiftUI, kita menyarankan menggunakan container `VStack` di lapisan paling luar untuk membungkus kod view.

**2. Menggunakan @ViewBuilder**

Kita juga boleh menambahkan modifier `@ViewBuilder` di depan `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` boleh menggabungkan beberapa view menjadi satu hasil return.

Pada dasarnya, ia tetap menggabungkan beberapa view menjadi satu view, agar memenuhi persyaratan `some View` untuk mengembalikan satu struktur view.

### Mengapa body boleh langsung menulis beberapa view?

Jika kita menulis beberapa view dalam `var body`, misalnya:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

Dalam beberapa kondisi, `body` seperti ini tidak akan error.

Alasannya ialah, `body` dalam protokol `View` secara lalai mendukung `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Di source code protokol `View`, kita boleh melihat bahwa `@ViewBuilder` sudah memodifikasi pemboleh ubah `body`.

Karena itu, dibandingkan `some View` biasa, `body` memiliki satu lapisan perlakuan khusus, sehingga SwiftUI akan otomatis membantu kita menggabungkan beberapa view menjadi satu view.

**Disarankan menggunakan container**

Agar lebih mudah difahami pemula, disarankan terlebih dahulu menggunakan container seperti `VStack`, `HStack`, `ZStack`, `Group`, dan lain-lain untuk mengatur beberapa view.

Sebagai contoh:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Dengan begitu kod lebih intuitif: **lapisan luar ialah satu `VStack`, dan dalamnya ada dua child view.**

## Memecah view

Jika antara muka cukup sederhana, kita boleh menulis semua kod dalam `body`.

Sebagai contoh:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Selamat datang ke Qinote")
                Text("Selamat pagi")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("klik saya") {
                print("klik saya ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Gaya dipaparkanan view ini:

![view](../../Resource/023_view1.png)

Kod ini boleh berjalan normal, tetapi jika kod view sangat kompleks, kod dalam `body` akan semakin panjang, dan tingkat kesulitan untuk membaca serta mengubahnya akan terus meningkat.

Pada saat ini, kita boleh memecahkan area yang berbeza menjadi property view yang berdiri sendiri.

### Memecah view bahagian atas

Sebagai contoh, keluarkan area bahagian atas:

```swift
var topHome: some View {
    HStack {
        Text("Laman utama")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Di sini `topHome` ialah satu pemboleh ubah yang mengembalikan satu view.

Karena yang dikembalikan ialah view, maka tipenya boleh ditulis sebagai:

```swift
some View
```

Ini sebenarnya sama penggunaannya dengan `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Keduanya menggunakan pemboleh ubah untuk memaparkan view, dan tipe return-nya ialah `some View`.

### Memecah view lain-lain

Kemudian, lanjutkan memecahkan bahagian lain-lain:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Selamat datang ke Qinote")
        Text("Selamat pagi")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Klik saya") {
        print("klik saya")
    }
    .buttonStyle(.borderedProminent)
}
```

Selepas dipecah, pemboleh ubah view boleh diletakkan dalam `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Laman utama")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Selamat datang ke Qinote")
            Text("Selamat pagi")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Klik saya") {
            print("klik saya")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Sekarang `body` hanya bertanggung jawab menggambarkan struktur halaman:

```swift
topBar
welcomeText
colorList
clickButton
```

Implementasi konkret dari setiap bahagian diletakkan di property yang sesuai di bawahnya.

Cara memecahkan view seperti ini boleh mencipta struktur halaman lebih jelas. Setiap area view memiliki namanya sendiri, sehingga lebih intuitif saat dibaca.

Pada masa mengubah kod pada bahagian tertentu, kita boleh langsung menemukan area view yang sesuai, bukan mencari kod di antara tumpukan kod yang kompleks.

### some View mengembalikan satu view

Dalam view yang dipecah ini, jika kita mencoba mengembalikan beberapa view:

```swift
var topBar: some View {
    Text("Laman utama")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` hanya boleh mengembalikan satu struktur view, sehingga akan terjadi error.

Berbeda dari `body`, computed property biasa secara lalai tidak memiliki `@ViewBuilder`.

Karena itu, jika kita perlu mengembalikan beberapa view, kita boleh menggunakan container `VStack`, `HStack`, atau `Group` untuk menggabungkan beberapa view menjadi satu.

```swift
var topBar: some View {
    VStack {
        Text("Laman utama")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Atau menambahkan `@ViewBuilder` untuk menggabungkan view:

```swift
@ViewBuilder
var topBar: some View {
    Text("Laman utama")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Dengan begitu, kita boleh mengembalikan beberapa view.

### if mengembalikan beberapa view

Sebagai contoh:

```swift
var topHome: some View {
    if step == "Laman utama" {
        HStack {
            Text("Laman utama")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Tiada")
    }
}
```

Dalam kod ini, `topHome` akan mengembalikan dua tipe view yang berbeza, yaitu `HStack` atau `Text`, sesuai isi `step`.

Karena `some View` membutuhkan satu tipe return konkret yang pasti, dua cabang `if` dalam computed property biasa tidak boleh langsung mengembalikan view dengan tipe yang berbeza, sehingga terjadi error.

**Penyelesaiannya tetap membungkus dengan container, atau menggunakan modifier `@ViewBuilder`.**

### Mengapa view yang dipecah tidak memakai tanda kurung

Pada masa menggunakan property view yang sudah dipecah dalam `body`, kita langsung menulis:

```swift
topBar
welcomeText
colorList
clickButton
```

bukan menulis:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Karena `topBar`, `welcomeText`, `colorList`, `clickButton` ialah pemboleh ubah. Variabel ini sebenarnya ialah computed property, bukan kaedah.

**Properti tidak perlu menggunakan tanda kurung.**

Jika kita menulisnya sebagai kaedah, efek serupa juga boleh dicapai:

```swift
func topBar() -> some View {
    HStack {
        Text("Laman utama")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Kod ini juga boleh mencapai efek serupa. Memanggil kaedah ini akan mengembalikan satu view.

Pada masa digunakan, perlu ditulis sebagai:

```swift
topBar()
```

Di SwiftUI, jika hanya memecahkan satu view yang tidak perlu menerima parameter, cara menggunakan computed property lebih umum.

```swift
var topBar: some View { ... }
```

## View bertingkat

Selain memecahkan kod menjadi property, kita juga boleh mencipta struktur view baru.

Sebagai contoh:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

`PinkColorView` ini sama seperti `ContentView`, yaitu satu SwiftUI view yang berdiri sendiri.

Jika perlu memaparkannya dalam `ContentView`, kita boleh menambahkan `()` setelah nama view.

Sebagai contoh:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Di sini:

```swift
PinkColorView()
```

bermaksud mencipta satu instance `PinkColorView`.

Karena `PinkColorView` mengikuti protokol `View`, ia boleh diletakkan dan didipaparkankan dalam view lain seperti `Text`, `Image`, dan `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Inilah view bertingkat: satu view boleh didipaparkankan dalam view lain-lain.

## Properti view atau mencipta view baru?

Pada masa kod view cukup sederhana, biasanya tidak perlu memecahkan kod. Hanya ketika kod cukup kompleks, barulah disarankan memecahkan view.

### Situasi menggunakan property view

Jika hanya satu area kecil dari kandungan dalam view saat ini, kita boleh menggunakan property view.

Sebagai contoh:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Konten seperti ini biasanya hanya digunakan di view saat ini.

### Situasi mencipta view baru

Jika kandungan tersebut cukup independen, atau mungkin akan digunakan semula di banyak halaman nantinya, maka lebih cocok mencipta view baru.

Sebagai contoh:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Ini ialah satu title view. Jika kita ingin menjadikan view ini sebagai komponen umum untuk digunakan semula di view lain.

Kita boleh mencipta satu view baru:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Lalu menggunakannya di tempat lain:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Pada saat ini, view tersebut menjadi satu komponen independen yang boleh digunakan semula.

Secara sederhana boleh diringkas menjadi:

- area kandungan view saat ini: boleh menggunakan `var xxx: some View`
- komponen independen yang boleh digunakan semula: boleh mencipta `struct XxxView: View` baru
- komponen yang perlu menerima data: biasanya lebih cocok mencipta view baru.

## Ringkasan

Dalam pelajaran ini, kita memahami semula struktur view yang paling dasar, tetapi juga paling penting, di SwiftUI.

`ContentView` ialah satu struktur. Ia ditakrifkan dengan `struct`, dan digunakan untuk mengatur kod yang berkaitan dengan halaman.

`View` ialah satu protokol. Jika satu struktur ingin menjadi SwiftUI view, ia perlu mengikuti protokol `View`.

`body` ialah kandungan yang diminta oleh protokol `View` untuk kita sediakan. Ia menentukan kandungan apa yang didipaparkankan oleh view ini.

`some View` bermaksud mengembalikan satu jenis view konkret, dan kita tidak perlu menuliskan tipe lengkapnya yang kompleks.

Ketika kod view menjadi panjang, kita boleh menggunakan `var xxx: some View` untuk memecahkan kod view menjadi beberapa area kecil.

Ketika satu bahagian kandungan cukup independen, atau perlu digunakan semula, kita boleh mencipta struktur view baru dan memaparkannya di view lain melalui `XxxView()`.

Singkatnya, antara muka SwiftUI dibangun dari gabungan view demi view. Satu halaman boleh mengandungi beberapa view kecil, dan satu view kecil juga boleh terus mengandungi view lain-lain.
