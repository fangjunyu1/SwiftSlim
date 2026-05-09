# Computed Property

Dalam pelajaran ini, kita akan mempelajari computed property.

Computed property digunakan untuk mengira hasil baharu berdasarkan data yang sudah ada. Ia boleh digunakan untuk mengira nilai angka, dan juga kandungan yang perlu dipaparkan dalam view SwiftUI.

Contohnya:

```swift
let a = 10
let b = 20
let c = a + b
```

Di sini, `c` mewakili hasil selepas `a` dan `b` dijumlahkan.

Dalam kod biasa, cara penulisan seperti ini sangat umum.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Petua: Kod Swift biasa boleh dijalankan dalam event klik `Button`.

Tetapi, jika kod yang serupa ditulis terus dalam property view SwiftUI, masalah akan berlaku.

Contohnya:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Kod ini akan menghasilkan ralat.

Sekilas pandang, `a` dan `b` sudah ditulis sebelum `c`, jadi nampaknya nilai `c` sepatutnya boleh dikira.

Namun, apabila mendeklarasikan property dalam struct, cara penulisan ini tidak boleh digunakan secara langsung.

## Mengapa c tidak boleh dikira terus sebagai a + b?

Ini kerana `a`, `b`, dan `c` bukan constant sementara dalam event klik button, tetapi property dalam view `ContentView`.

Dalam event klik button, kod ini boleh dijalankan dengan normal:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Ini kerana selepas button diklik, kod akan dijalankan mengikut urutan. Mula-mula `a` dibuat, kemudian `b` dibuat, dan akhirnya `c` dikira menggunakan `a + b`.

Tetapi apabila property dideklarasikan dalam view, situasinya berbeza:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Di sini, `a`, `b`, dan `c` semuanya ialah property dalam view `ContentView`.

Apabila view `ContentView` dibuat, Swift perlu menyediakan property-property ini terlebih dahulu. Untuk memastikan proses penciptaan selamat, Swift tidak membenarkan default value bagi satu instance stored property membaca instance property lain dalam instance yang sama secara langsung.

Jadi baris kod ini akan menghasilkan ralat:

```swift
let c = a + b
```

Secara ringkas, boleh difahami begini: **apabila mendeklarasikan property dalam view, satu property biasa tidak boleh digunakan secara langsung untuk mengira property biasa yang lain.**

Property yang menyimpan nilai secara langsung seperti ini dipanggil “stored property”. Untuk memudahkan pemahaman, buat sementara waktu kita boleh menganggapnya sebagai property biasa.

Contohnya:

```swift
let a = 10
```

`a` menyimpan `10`.

```swift
let b = 20
```

`b` menyimpan `20`.

Tetapi:

```swift
let c = a + b
```

Di sini, `c` bukan nilai tetap yang ditulis terus. Ia diharapkan dikira melalui `a + b`.

Untuk situasi seperti “mendapatkan hasil berdasarkan data yang sudah ada”, computed property lebih sesuai digunakan.

Kod boleh diubah seperti ini:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Di sini, `c` ialah computed property.

```swift
var c: Int {
    return a + b
}
```

Maksudnya: **apabila `c` perlu digunakan, barulah `a` dan `b` dibaca, kemudian hasil `a + b` dikembalikan.**

Contohnya:

```swift
Text("c: \(c)")
```

Apabila `Text` memaparkan `c`, barulah pengiraan `c` dicetuskan.

## Apakah computed property?

Computed property kelihatan seperti variable, tetapi ia sendiri tidak menyimpan data.

Contohnya:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Di sini, `c` ialah computed property.

Ia tidak menyimpan nilai tetap seperti property biasa. Setiap kali `c` dibaca, kod dalam `{}` akan dijalankan semula, lalu hasil pengiraan dikembalikan.

Boleh difahami seperti ini:

```swift
var c: Int {
    return a + b
}
```

Apabila `c` diperlukan, `a + b` akan dikira.

Jadi computed property sesuai untuk situasi ini: **sesuatu hasil tidak perlu disimpan secara berasingan, kerana ia boleh dikira berdasarkan data yang sudah ada.**

## Cara penulisan asas

Computed property biasanya mengandungi tiga bahagian:

```swift
var c: Int {
    return a + b
}
```

### 1. Dideklarasikan menggunakan `var`

```swift
var c
```

Computed property mesti dideklarasikan menggunakan `var`, bukan `let`.

Ini kerana computed property bukan nilai tetap yang disimpan, tetapi hasil yang dikira secara dinamik setiap kali ia dibaca.

### 2. Menandakan return type

```swift
var c: Int
```

Computed property perlu menandakan return type.

Di sini, `c` akhirnya akan mengembalikan integer, jadi jenisnya ialah `Int`.

### 3. Menulis logik pengiraan dalam {}

```swift
{
    return a + b
}
```

Logik pengiraan ditulis dalam `{}`. Di sini, hasil yang dikembalikan ialah `a + b`.

## Kata kunci return

Computed property perlu mengembalikan satu hasil.

Contohnya:

```swift
var c: Int {
    return a + b
}
```

Di sini, `return` bermaksud: kembalikan hasil pengiraan `a + b`.

Jika dalam computed property hanya ada satu expression yang terus menghasilkan keputusan, `return` boleh ditinggalkan:

```swift
var c: Int {
    a + b
}
```

Tetapi jika computed property mengandungi beberapa baris kod, `return` perlu digunakan untuk menyatakan hasil yang dikembalikan dengan jelas.

Contohnya:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Di sini, proses pengiraan dibahagikan kepada dua langkah.

Langkah pertama, kira jumlah harga:

```swift
let total = count * price
```

Langkah kedua, gabungkan jumlah harga menjadi teks, kemudian kembalikan:

```swift
return "Total：\(total) $"
```

Jika `return` dibuang:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Kod ini akan menghasilkan ralat.

Sebabnya: **computed property ini sudah mempunyai beberapa baris kod, jadi Swift tidak dapat menentukan secara automatik baris mana yang merupakan hasil akhir untuk dikembalikan.**

Jadi, jika computed property hanya mempunyai satu expression yang terus menghasilkan keputusan, `return` boleh ditinggalkan.

```swift
var c: Int {
    a + b
}
```

Jika computed property mempunyai beberapa baris kod, lebih baik tulis `return` dengan jelas.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Perbezaan antara computed property dan property biasa

Property biasa menyimpan data.

```swift
var c = 30
```

Di sini, `c` menyimpan satu nilai tertentu: `30`.

Computed property tidak menyimpan data.

```swift
var c: Int {
    a + b
}
```

Di sini, `c` tidak menyimpan `30`. Ia hanya menyediakan cara pengiraan.

Apabila `c` dibaca, Swift akan menjalankan:

```swift
a + b
```

Kemudian Swift mengembalikan hasil pengiraan.

Jadi computed property sesuai untuk situasi yang memerlukan hasil dikira berdasarkan data lain.

## body juga ialah computed property

Selepas mempelajari computed property, kita boleh memahami semula kod yang paling kerap dilihat dalam SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Di sini, `body` juga ialah computed property.

Ia dideklarasikan menggunakan `var`:

```swift
var body
```

Ia mempunyai return type:

```swift
some View
```

Kandungan yang dikembalikan dalam `{}` ialah kandungan view SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Jadi `body` boleh difahami begini: apabila SwiftUI perlu memaparkan view ini, SwiftUI akan membaca `body`, kemudian membina interface berdasarkan kandungan yang dikembalikan oleh `body`.

Jika menulis `return`, ia boleh difahami seperti ini:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tetapi dalam SwiftUI, kita biasanya meninggalkan `return` dan menulis terus seperti ini:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Apabila data `@State` berubah, SwiftUI akan membaca semula `body` dan mengemas kini interface berdasarkan data baharu.

Contohnya:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Selepas button diklik, `count` akan berubah.

```swift
count += 1
```

Selepas `count` berubah, SwiftUI akan mengira semula `body`, jadi teks dalam interface juga akan dikemas kini.

```swift
Text("count: \(count)")
```

Inilah juga sebabnya interface dalam SwiftUI boleh refresh secara automatik selepas data berubah.

### Tidak digalakkan menulis pengiraan kompleks dalam body

Memandangkan `body` ialah computed property, ia mungkin dibaca dan dikira semula berkali-kali.

Contohnya:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Apabila `name` berubah, SwiftUI akan mengira semula `body`.

Pada masa ini, kod dalam `body` juga akan dijalankan semula, dan `num` juga akan dibuat semula.

```swift
let num = 10
```

Dalam contoh ini, `num` sangat ringkas, jadi kesannya tidak besar.

Tetapi jika pengiraan kompleks dilakukan dalam `body`, contohnya menapis data dalam jumlah besar, menyusun data, memproses imej dan sebagainya, ia mungkin menjejaskan kelancaran interface.

Jadi dalam SwiftUI, `body` sepatutnya bertanggungjawab terutamanya untuk menerangkan struktur interface.

Data sementara yang ringkas boleh ditulis dalam `body`.

Pengiraan kompleks boleh dipertimbangkan untuk diletakkan di luar `body`, seperti dalam computed property, method, atau bahagian pemprosesan data yang berasingan.

## Contoh: kuantiti dan jumlah harga

Seterusnya, kita gunakan contoh ringkas untuk memahami computed property.

Andaikan harga sebatang lobak merah ialah 2 $. Pengguna boleh klik button untuk mengubah kuantiti pembelian, dan interface perlu memaparkan jumlah harga.

Cara mengira jumlah harga:

```text
Kuantiti * Harga seunit
```

Jika jumlah harga disimpan menggunakan variable biasa, ia akan menjadi agak menyusahkan.

Ini kerana setiap kali kuantiti berubah, jumlah harga perlu dikemas kini secara manual.

Cara yang lebih baik ialah menggunakan computed property:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Paparan hasil:

![view](../../Resource/024_view.png)

Dalam contoh ini:

```swift
@State private var count = 1
```

`count` mewakili kuantiti lobak merah. Apabila button diklik, `count` akan berubah.

```swift
private let price = 2
```

`price` mewakili harga seunit lobak merah. Di sini nilainya tetap, jadi `let` digunakan.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` mewakili jumlah harga.

Ia tidak perlu disimpan secara berasingan, kerana jumlah harga sentiasa boleh dikira melalui `count * price`.

Apabila `count` ialah `1`:

```swift
totalPrice = 1 * 2
```

Hasil yang dipaparkan ialah:

```swift
totalPrice: 2 $
```

Selepas button `+` diklik, `count` menjadi `2`.

Pada masa ini, apabila `totalPrice` dibaca semula, ia akan dikira semula:

```swift
totalPrice = 2 * 2
```

Hasil yang dipaparkan ialah:

```swift
totalPrice: 4 $
```

Inilah fungsi computed property: mengira hasil baharu secara dinamik berdasarkan data yang sudah ada.

## Computed property juga boleh digunakan untuk membuat penilaian

Computed property bukan sahaja boleh mengira nilai angka, tetapi juga boleh mengembalikan hasil penilaian.

Contohnya, apabila kita mahu kuantiti minimum ialah 1.

Apabila kuantiti sudah menjadi 1, button `-` tidak sepatutnya terus mengurangkannya.

Kita boleh menambah computed property:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Kod lengkap:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Paparan hasil:

![view](../../Resource/024_view1.png)

Di sini:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Kod ini bermaksud sama ada kuantiti semasa masih boleh dikurangkan.

Apabila `count` lebih besar daripada `1`:

```swift
canDecrease == true
```

Ini bermaksud kuantiti boleh dikurangkan.

Apabila `count` sama dengan `1`:

```swift
canDecrease == false
```

Ini bermaksud kuantiti tidak boleh dikurangkan lagi.

### Penilaian syarat dalam button

Dalam button, kod ini digunakan:

```swift
if canDecrease {
    count -= 1
}
```

Hanya apabila `canDecrease` bernilai `true`, barulah `count` boleh dikurangkan.

### Mengawal warna foreground view

Kita juga boleh menggunakan `canDecrease` untuk mengawal warna foreground button:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Di sini ternary operator digunakan:

```swift
canDecrease ? Color.primary : Color.gray
```

Maksud kod ini ialah: jika `canDecrease` ialah `true`, warna foreground menggunakan `Color.primary`; jika `canDecrease` ialah `false`, warna foreground menggunakan `Color.gray`.

`Color.primary` ialah warna semantik sistem yang disediakan oleh SwiftUI. Ia mewakili warna teks utama dalam interface semasa.

Dalam Light Mode, `Color.primary` biasanya hampir kepada warna hitam; dalam Dark Mode, `Color.primary` biasanya hampir kepada warna putih.

Jadi kelebihan menggunakan `Color.primary` ialah: ia akan menyesuaikan diri secara automatik mengikut Light Mode dan Dark Mode.

### Mengawal keadaan disabled bagi view

`disabled` digunakan untuk mengawal sama ada view berada dalam keadaan disabled:

```swift
.disabled(!canDecrease)
```

Apabila `disabled` ialah `false`, view boleh diklik.

Apabila `disabled` ialah `true`, view berada dalam keadaan disabled dan tidak boleh diklik.

Di sini `canDecrease` digunakan sebagai syarat, jadi kod menjadi lebih mudah difahami.

Apabila melihat `canDecrease`, kita boleh terus tahu bahawa ia bermaksud “sama ada kuantiti semasa masih boleh dikurangkan”.

### Penjelasan tambahan: mengapa ada dua kali penilaian?

Dalam button `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Di sini, `.disabled(!canDecrease)` digunakan, dan `if canDecrease` juga digunakan dalam button.

`.disabled(!canDecrease)` bertanggungjawab mematikan button pada tahap interface, supaya pengguna tidak boleh mengkliknya.

`if canDecrease` pula membuat semakan sekali lagi sebelum kod dijalankan. Hanya apabila kuantiti boleh dikurangkan, `count -= 1` akan dijalankan.

Ini ialah perlindungan berganda. Dalam pembangunan sebenar, jika button sudah disabled, semakan dalaman boleh ditinggalkan. Tetapi dalam contoh pembelajaran, mengekalkannya boleh menjadikan fungsi `canDecrease` lebih jelas.

## Ringkasan

Dalam pelajaran ini, kita mempelajari computed property.

Computed property tidak menyimpan nilai secara langsung. Apabila ia dibaca, ia mengira hasil berdasarkan data yang sudah ada.

Contohnya:

```swift
var c: Int {
    a + b
}
```

Di sini, `c` tidak perlu disimpan secara berasingan, kerana ia boleh dikira melalui `a + b`.

Computed property mesti dideklarasikan menggunakan `var`, dan return type perlu ditandakan.

```swift
var canDecrease: Bool {
    count > 1
}
```

Computed property bukan sahaja boleh mengembalikan nilai angka, tetapi juga hasil penilaian, kandungan teks, malah kandungan view SwiftUI.

Dalam pelajaran ini, kita juga mempelajari `return`.

`return` bermaksud mengembalikan satu hasil:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Jika dalam computed property hanya ada satu expression yang terus menghasilkan keputusan, `return` boleh ditinggalkan.

```swift
var totalPrice: Int {
    count * price
}
```

Selain itu, kita juga memahami `Color.primary` dan `disabled`.

`Color.primary` ialah warna semantik sistem SwiftUI. Ia akan menyesuaikan kesan paparan secara automatik mengikut Light Mode dan Dark Mode.

```swift
.foregroundStyle(Color.primary)
```

`disabled` digunakan untuk mengawal sama ada view disabled.

```swift
.disabled(true)
```

Ini bermaksud disabled, tidak boleh diklik.

```swift
.disabled(false)
```

Ini bermaksud tersedia, boleh diklik.

Jadi computed property sangat biasa digunakan dalam SwiftUI. Ia membantu kita menyusun hasil pengiraan, syarat penilaian, dan kandungan paparan dengan lebih jelas.
