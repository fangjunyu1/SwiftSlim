# Memahami tampilan

Di pelajaran ini, kita kembali lagi ke `ContentView` yang paling awal.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Saat pertama kali mengenal SwiftUI, ada banyak kata kunci di dalam `ContentView` yang belum kita pahami.

Misalnya kata kunci seperti `struct`, `View`, `var`, `body`, `some View`, dan sebagainya.

Saat itu mungkin kita hanya tahu: **jika kode ditulis di dalam `body`, maka konten akan tampil di antarmuka.**

Sekarang, kita sudah mempelajari `struct`, variabel, metode, dan protokol. Kita bisa memahami ulang kode ini untuk membantu memahami hubungan antar-view di SwiftUI.

## Meninjau kembali ContentView

Setelah membuat project SwiftUI, Xcode secara default akan menghasilkan sebuah file `ContentView`.

Contoh kodenya sebagai berikut:

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

Kode ini bisa dipahami dengan membaginya menjadi beberapa bagian.

Pertama adalah:

```swift
import SwiftUI
```

Baris kode ini berarti mengimpor framework SwiftUI.

Setelah mengimpor SwiftUI, barulah kita bisa menggunakan view SwiftUI seperti `View`, `Text`, `Image`, `VStack`, `Button`, dan lainnya.

## Struktur ContentView

Baris kode ini berarti membuat sebuah struktur:

```swift
struct ContentView: View
```

Di antaranya:

```swift
struct ContentView
```

berarti `ContentView` adalah sebuah struktur.

Pada pelajaran sebelumnya, kita sudah memahami struktur `struct`. Ia dapat menggabungkan berbagai field menjadi satu, dan dapat berisi properti serta metode.

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

Dalam contoh ini, `ContentView` berisi tiga hal: `name`, `printName`, dan `body`.

Dengan kata lain, `struct` dapat menggabungkan properti, metode, dan konten view yang saling berkaitan.

![contentView](../../Resource/023_contentVIew.png)

## View adalah sebuah protokol

Lanjutkan melihat baris kode ini:

```swift
struct ContentView: View 
```

`View` setelah tanda titik dua berarti: `ContentView` mengikuti protokol `View`.

Kita bisa memahaminya begini: jika `ContentView` ingin menjadi sebuah SwiftUI view, maka ia harus memenuhi persyaratan protokol `View`.

### Protokol Identifiable

Saat sebelumnya mempelajari daftar film, kita sudah bersentuhan dengan protokol `Identifiable`.

Saat itu, kita perlu melakukan traversal pada array `Movie` di dalam `ForEach`, tetapi struktur `Movie` tidak memiliki identitas unik, sehingga tidak mendukung traversal `ForEach`.

Pada saat itu, kita perlu membuat struktur `Movie` mengikuti protokol `Identifiable`, agar sesuai dengan persyaratan `ForEach` terhadap identitas unik.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Persyaratan protokol `Identifiable` adalah: **tipe ini memiliki sebuah field `id` untuk mengidentifikasi dirinya sendiri.**

Setelah `Movie` menyediakan field `id`, ia dapat memenuhi persyaratan `Identifiable`.

Dengan begitu, saat kita menggunakannya di `ForEach`, SwiftUI bisa mengenali setiap data.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protokol View

Protokol `View` juga seperti itu.

Jika sebuah tipe ingin menjadi SwiftUI view, maka ia perlu mengikuti protokol `View`.

Dan persyaratan terpenting dari protokol `View` adalah menyediakan sebuah `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Kita bisa memahaminya begini: protokol `View` mengharuskan **hanya menerima SwiftUI view yang dikembalikan oleh `body`, sedangkan `ContentView` menampilkan SwiftUI view melalui `body`.**

### Apa yang terjadi jika tidak mengikuti View?

Jika kita menulis seperti ini:

```swift
struct ContentView {
}
```

Ini hanya sebuah struktur biasa, bukan SwiftUI view.

Ia tidak akan langsung error, karena struktur biasa itu sendiri adalah kode Swift yang valid.

Namun, jika kita menaruhnya di preview:

```swift
#Preview {
    ContentView()
}
```

Saat itu akan muncul error.

Alasannya adalah: **preview perlu menampilkan sebuah SwiftUI view, sedangkan `ContentView` ini tidak mengikuti protokol `View`.**

Karena itu, jika kita ingin `ContentView` bisa tampil di antarmuka, kita perlu membuatnya mengikuti protokol `View`:

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

Pada saat ini, `ContentView` barulah menjadi SwiftUI view yang benar-benar bisa ditampilkan.

## body adalah pintu masuk tampilan view

Di SwiftUI, `body` adalah pintu masuk untuk konten view.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Ini bisa dibagi menjadi tiga bagian:

**1. var body**

```swift
var body
```

Berarti mendefinisikan sebuah variabel bernama `body`.

**2. some View**

```swift
: some View
```

Berarti `body` ini akan mengembalikan sebuah view.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Menunjukkan konten view yang ditampilkan. Dalam kode ini yang ditampilkan adalah sebuah view `Text`.

Dengan kata lain, apa pun yang ditulis di dalam `body`, itulah yang tampil di antarmuka.

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

Kode ini berarti: **di antarmuka ditampilkan konten yang tersusun vertikal, dan di dalamnya ada dua teks.**

### Nama body tidak bisa diubah sesuka hati

Perlu diperhatikan bahwa nama `body` tidak bisa diubah begitu saja.

Jika ditulis menjadi:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

`content` ini memang juga sebuah properti view, tetapi ia tidak bisa menggantikan `body`.

Karena nama yang diminta oleh protokol `View` memang `body`.

## Apa itu some View?

Di SwiftUI, `some View` berarti mengembalikan sebuah view konkret, hanya saja kita tidak perlu menuliskan tipe lengkap dari view tersebut.

```swift
var body: some View
```

Dengan kata lain, `some View` bukan berarti tidak memiliki tipe. Tipe aslinya tetap ada, compiler mengetahui tipe tersebut, tetapi tipe itu mungkin sangat kompleks, sehingga Swift mengizinkan kita menyembunyikannya dengan `some View`.

### Apa itu some?

Di Swift, `some` adalah kata kunci untuk mendeklarasikan opaque type, atau tipe buram.

Arti opaque type adalah: **nilai return memiliki satu tipe konkret, compiler tahu tipe konkret itu apa, tetapi kita tidak menuliskan tipe konkret tersebut secara langsung.**

Sebagai contoh:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Ini berarti `makeView` akan mengembalikan sebuah tipe konkret yang mengikuti protokol `View`.

### Mengapa membutuhkan some?

Saat mempelajari variabel, kita sudah mengetahui: **nilai di Swift perlu diberi anotasi tipe secara eksplisit, atau tipenya disimpulkan otomatis oleh compiler.**

Sebagai contoh:

```swift
let a: Int = 10
```

Di sini konstanta `a` bertipe `Int`.

SwiftUI view juga tidak terkecuali. Saat kita menggunakan `body` untuk menampilkan SwiftUI view, kita perlu membuat `body` mengembalikan tipe SwiftUI yang sesuai.

Misalnya, jika kita menggunakan `body` untuk menampilkan sebuah text view `Text`, maka kita perlu membuat `body` mengembalikan tipe `Text` yang sesuai.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Dalam contoh ini, yang ditampilkan di dalam `body` adalah sebuah view `Text`, dan tipe return-nya juga `Text`.

Hanya ketika tipe di dalamnya dan tipe yang dideklarasikan sama, barulah memenuhi persyaratan compiler tentang konsistensi tipe.

**Masalah tipe tidak konsisten**

Jika kita mengatur tipe `body` menjadi `Color`, tetapi yang ditampilkan adalah `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

Tipe `body` dan tipe kode di dalamnya tidak konsisten, sehingga akan memicu error tipe tidak cocok.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Pada saat ini, kita perlu mengubah tipe return `body` secara manual.

**Tipe view yang kompleks**

Dalam pengembangan nyata, antarmuka biasanya tidak hanya memiliki satu `Text`.

Jika perlu menampilkan `VStack` yang lebih kompleks, kita perlu memberi anotasi tipe return yang kompleks secara manual.

Sebagai contoh:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Kode ini berarti mengembalikan sebuah `VStack`, dan di dalam `VStack` terdapat view bertipe `Image` dan `Text`.

Tipe return dari `body` adalah:

```swift
VStack<TupleView<(Image,Text)>>
```

Bisa dilihat, tipe return ini sangat kompleks, dan juga muncul `TupleView` baru yang belum pernah kita lihat sebelumnya.

`TupleView` di sini bisa dipahami sebagai: **membungkus beberapa child view menjadi satu view.**

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

Tipe return yang ada, `VStack<TupleView<(Image,Text)>>`, akan gagal karena tidak dapat menjelaskan modifier, sehingga terjadi error.

**some View menyederhanakan tipe return**

Untuk situasi seperti ini, SwiftUI menyediakan solusi yang ringkas, yaitu menggunakan `some View` untuk menyederhanakan penulisan.

Saat kita mengubah `body` menjadi tipe `some View`:

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

Setiap kali mengubah kode view, kita tidak perlu lagi menuliskan tipe return lengkapnya.

Ini karena `some View` berarti mengembalikan sebuah view konkret yang mengikuti protokol `View`.

Dengan kata lain, SwiftUI view seperti `VStack`, `Image`, dan lainnya semuanya mengikuti protokol `View`. Tipe view yang dikembalikan setelah menambahkan modifier juga tetap mengikuti protokol `View`.

Jadi semuanya bisa dikembalikan sebagai `some View`.

### some View tidak bisa sembarang mengembalikan view apa pun

Walaupun `some View` dapat menyembunyikan tipe yang kompleks, ia bukan berarti "tidak memiliki tipe".

Aturan intinya adalah: **compiler harus bisa menentukan satu tipe return konkret**.

Sebagai contoh:

```swift
var title: some View {
    Text("Hello")
}
```

Di sini yang dikembalikan adalah view `Text`.

Namun, jika mencoba mengembalikan dua view, akan terjadi error:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Karena `some View` pada akhirnya perlu mengembalikan satu struktur view, sedangkan di sini kita mencoba mengembalikan dua view yang terpisah.

### Solusi

Solusinya biasanya ada dua: container dan `@ViewBuilder`.

**1. Bungkus dengan container**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Dalam kode ini, `title` mengembalikan sebuah `VStack`, sedangkan `Text` dan `Image` adalah child view di dalam `VStack`.

Struktur view yang diterima oleh `some View` adalah sebuah `VStack<...>`, sehingga sesuai dengan persyaratan `some View` untuk mengembalikan satu struktur view. 

Inilah sebabnya sejak awal belajar SwiftUI, kita menyarankan menggunakan container `VStack` di lapisan paling luar untuk membungkus kode view.

**2. Menggunakan @ViewBuilder**

Kita juga bisa menambahkan modifier `@ViewBuilder` di depan `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` dapat menggabungkan beberapa view menjadi satu hasil return.

Pada dasarnya, ia tetap menggabungkan beberapa view menjadi satu view, agar memenuhi persyaratan `some View` untuk mengembalikan satu struktur view.

### Mengapa body bisa langsung menulis beberapa view?

Jika kita menulis beberapa view di dalam `var body`, misalnya:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

Dalam beberapa kondisi, `body` seperti ini tidak akan error.

Alasannya adalah, `body` di dalam protokol `View` secara default mendukung `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Di source code protokol `View`, kita bisa melihat bahwa `@ViewBuilder` sudah memodifikasi variabel `body`.

Karena itu, dibandingkan `some View` biasa, `body` memiliki satu lapisan perlakuan khusus, sehingga SwiftUI akan otomatis membantu kita menggabungkan beberapa view menjadi satu view.

**Disarankan menggunakan container**

Agar lebih mudah dipahami pemula, disarankan terlebih dahulu menggunakan container seperti `VStack`, `HStack`, `ZStack`, `Group`, dan lainnya untuk mengatur beberapa view.

Sebagai contoh:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Dengan begitu kode lebih intuitif: **lapisan luar adalah sebuah `VStack`, dan di dalamnya ada dua child view.**

## Memecah view

Jika antarmuka cukup sederhana, kita bisa menulis semua kode di dalam `body`.

Sebagai contoh:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Selamat datang di Qinote")
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

Gaya tampilan view ini:

![view](../../Resource/023_view1.png)

Kode ini bisa berjalan normal, tetapi jika kode view sangat kompleks, kode di dalam `body` akan semakin panjang, dan tingkat kesulitan untuk membaca serta mengubahnya akan terus meningkat.

Pada saat ini, kita bisa memecah area yang berbeda menjadi properti view yang berdiri sendiri.

### Memecah view bagian atas

Misalnya, keluarkan area bagian atas:

```swift
var topHome: some View {
    HStack {
        Text("Beranda")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Di sini `topHome` adalah sebuah variabel yang mengembalikan sebuah view.

Karena yang dikembalikan adalah view, maka tipenya bisa ditulis sebagai:

```swift
some View
```

Ini sebenarnya sama penggunaannya dengan `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Keduanya menggunakan variabel untuk menampilkan view, dan tipe return-nya adalah `some View`.

### Memecah view lainnya

Kemudian, lanjutkan memecah bagian lainnya:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Selamat datang di Qinote")
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

Setelah dipecah, variabel view dapat diletakkan di dalam `body`:

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
            Text("Beranda")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Selamat datang di Qinote")
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

Implementasi konkret dari setiap bagian diletakkan di properti yang sesuai di bawahnya.

Cara memecah view seperti ini dapat membuat struktur halaman lebih jelas. Setiap area view memiliki namanya sendiri, sehingga lebih intuitif saat dibaca.

Saat mengubah kode pada bagian tertentu, kita bisa langsung menemukan area view yang sesuai, bukan mencari kode di antara tumpukan kode yang kompleks.

### some View mengembalikan satu view

Dalam view yang dipecah ini, jika kita mencoba mengembalikan beberapa view:

```swift
var topBar: some View {
    Text("Beranda")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` hanya bisa mengembalikan satu struktur view, sehingga akan terjadi error.

Berbeda dari `body`, computed property biasa secara default tidak memiliki `@ViewBuilder`.

Karena itu, jika kita perlu mengembalikan beberapa view, kita bisa menggunakan container `VStack`, `HStack`, atau `Group` untuk menggabungkan beberapa view menjadi satu.

```swift
var topBar: some View {
    VStack {
        Text("Beranda")
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
    Text("Beranda")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Dengan begitu, kita bisa mengembalikan beberapa view.

### if mengembalikan beberapa view

Sebagai contoh:

```swift
var topHome: some View {
    if step == "Beranda" {
        HStack {
            Text("Beranda")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Kosong")
    }
}
```

Dalam kode ini, `topHome` akan mengembalikan dua tipe view yang berbeda, yaitu `HStack` atau `Text`, sesuai isi `step`.

Karena `some View` membutuhkan satu tipe return konkret yang pasti, dua cabang `if` di dalam computed property biasa tidak bisa langsung mengembalikan view dengan tipe yang berbeda, sehingga terjadi error.

**Solusinya tetap membungkus dengan container, atau menggunakan modifier `@ViewBuilder`.**

### Mengapa view yang dipecah tidak memakai tanda kurung

Saat menggunakan properti view yang sudah dipecah di dalam `body`, kita langsung menulis:

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

Karena `topBar`, `welcomeText`, `colorList`, `clickButton` adalah variabel. Variabel ini sebenarnya adalah computed property, bukan metode.

**Properti tidak perlu menggunakan tanda kurung.**

Jika kita menulisnya sebagai metode, efek serupa juga bisa dicapai:

```swift
func topBar() -> some View {
    HStack {
        Text("Beranda")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Kode ini juga bisa mencapai efek serupa. Memanggil metode ini akan mengembalikan sebuah view.

Saat digunakan, perlu ditulis sebagai:

```swift
topBar()
```

Di SwiftUI, jika hanya memecah sebuah view yang tidak perlu menerima parameter, cara menggunakan computed property lebih umum.

```swift
var topBar: some View { ... }
```

## View bertingkat

Selain memecah kode menjadi properti, kita juga bisa membuat struktur view baru.

Sebagai contoh:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

`PinkColorView` ini sama seperti `ContentView`, yaitu sebuah SwiftUI view yang berdiri sendiri.

Jika perlu menampilkannya di dalam `ContentView`, kita bisa menambahkan `()` setelah nama view.

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

berarti membuat sebuah instance `PinkColorView`.

Karena `PinkColorView` mengikuti protokol `View`, ia bisa diletakkan dan ditampilkan di dalam view lain seperti `Text`, `Image`, dan `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Inilah view bertingkat: satu view dapat ditampilkan di dalam view lainnya.

## Properti view atau membuat view baru?

Saat kode view cukup sederhana, biasanya tidak perlu memecah kode. Hanya ketika kode cukup kompleks, barulah disarankan memecah view.

### Situasi menggunakan properti view

Jika hanya sebuah area kecil dari konten di dalam view saat ini, kita bisa menggunakan properti view.

Sebagai contoh:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Konten seperti ini biasanya hanya digunakan di view saat ini.

### Situasi membuat view baru

Jika konten tersebut cukup independen, atau mungkin akan digunakan ulang di banyak halaman nantinya, maka lebih cocok membuat view baru.

Sebagai contoh:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Ini adalah sebuah title view. Jika kita ingin menjadikan view ini sebagai komponen umum untuk digunakan ulang di view lain.

Kita bisa membuat sebuah view baru:

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

Pada saat ini, view tersebut menjadi sebuah komponen independen yang dapat digunakan ulang.

Secara sederhana bisa diringkas menjadi:

- area konten view saat ini: bisa menggunakan `var xxx: some View`
- komponen independen yang dapat digunakan ulang: bisa membuat `struct XxxView: View` baru
- komponen yang perlu menerima data: biasanya lebih cocok membuat view baru.

## Ringkasan

Di pelajaran ini, kita memahami ulang struktur view yang paling dasar, tetapi juga paling penting, di SwiftUI.

`ContentView` adalah sebuah struktur. Ia didefinisikan dengan `struct`, dan digunakan untuk mengatur kode yang berkaitan dengan halaman.

`View` adalah sebuah protokol. Jika sebuah struktur ingin menjadi SwiftUI view, ia perlu mengikuti protokol `View`.

`body` adalah konten yang diminta oleh protokol `View` untuk kita sediakan. Ia menentukan konten apa yang ditampilkan oleh view ini.

`some View` berarti mengembalikan satu jenis view konkret, dan kita tidak perlu menuliskan tipe lengkapnya yang kompleks.

Ketika kode view menjadi panjang, kita bisa menggunakan `var xxx: some View` untuk memecah kode view menjadi beberapa area kecil.

Ketika sebuah bagian konten cukup independen, atau perlu digunakan ulang, kita bisa membuat struktur view baru dan menampilkannya di view lain melalui `XxxView()`.

Singkatnya, antarmuka SwiftUI dibangun dari gabungan view demi view. Satu halaman dapat berisi beberapa view kecil, dan satu view kecil juga dapat terus berisi view lainnya.
