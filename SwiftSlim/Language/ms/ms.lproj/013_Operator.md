# Operator

Dalam pelajaran ini, kita akan mempelajari operator Swift（Operators）。

Apabila kita melakukan pengiraan, perbandingan atau pertimbangan logik, kita perlu menggunakan operator. Operasi ini merentasi setiap peringkat pelaksanaan program dan merupakan salah satu kebolehan paling asas dalam pengaturcaraan.

```swift
let a = 100 * 8
```

Semasa mempelajari pengaturcaraan, ramai orang akan mendapati bahawa mereka yang mempunyai sedikit pemikiran matematik biasanya lebih mudah memahami logik program. Ini kerana pengaturcaraan pada asasnya tidak dapat dipisahkan daripada “pengiraan” dan “peraturan penentuan”, dan inilah tepatnya peranan teras operator.

Dalam pembangunan sebenar, operator bukan sahaja digunakan untuk pengiraan nombor yang mudah, malah juga digunakan secara meluas dalam pelbagai situasi yang khusus.

Contohnya, dalam permainan blok, apabila pengguna menyeret satu blok ke kedudukan tertentu, kita perlu mengira:

- Kedudukan koordinat blok
- Kedudukan yang boleh diisi oleh blok
- Menentukan sama ada kedudukan sasaran boleh digunakan

Proses “pengiraan + penentuan” ini pada asasnya semuanya bergantung pada operator untuk diselesaikan.

![Block](../../Resource/013_block.png)

Mempelajari operator bukan sekadar mempelajari pengiraan angka, tetapi juga meletakkan asas untuk susun atur antara muka, pemprosesan data dan logik interaksi yang akan datang.

## Cara pengiraan dilaksanakan dalam SwiftUI

Dalam SwiftUI, biasanya kita menggunakan `Button` untuk mencetuskan fungsi, kemudian melaksanakan logik pengiraan di dalam fungsi itu.

Contohnya:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Apabila butang ditekan, Console akan memaparkan:

```
c: 20
```

Dalam pelajaran ini, kita akan menulis logik pengiraan di dalam `func` secara konsisten, mencetuskannya melalui butang, dan menggunakan `print` untuk memaparkan hasil.

Dalam contoh-contoh seterusnya, untuk memudahkan paparan kod, kita akan terus menandakan hasil pengiraan di dalam kod dan tidak lagi berulang kali menggunakan `print` untuk output.

## Pengurusan output Console

Oleh sebab setiap klik akan menghasilkan maklumat output, anda boleh menekan butang pembersihan di sudut kanan bawah kawasan Console untuk membersihkan log sejarah dan memudahkan pemerhatian hasil semasa.

![Console](../../Resource/013_console.png)

## Satu lagi cara menulis Button

Apabila butang hanya melaksanakan satu fungsi, kita boleh menggunakan cara penulisan yang lebih ringkas:

```swift
Button(action: ) {
    // View
}
```

Dalam penulisan ini, `action` menentukan fungsi yang perlu dilaksanakan apabila butang ditekan（fungsi tanpa parameter）, dan kurungan keriting `{}` digunakan untuk mentakrifkan view butang.

Digabungkan dengan fungsi `calculate` tadi, ia boleh ditulis seperti ini:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Apabila butang ditekan, fungsi `calculate` akan dilaksanakan secara terus.

Oleh itu, apabila logik butang adalah ringkas dan hanya memanggil satu fungsi, cara penulisan `action` adalah lebih jelas dan lebih selaras dengan gaya kod yang baik.

## Operator aritmetik

Operator aritmetik（Arithmetic Operators）digunakan untuk pengiraan nilai:

- `+` tambah
- `-` tolak
- `*` darab
- `/` bahagi
- `%` baki（remainder）

Contoh:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Perlu diperhatikan bahawa Swift ialah bahasa bertipe kuat dan tidak akan mencampurkan jenis data yang berbeza secara automatik:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Apabila dua jenis tidak sama, kita perlu menukar jenisnya secara manual.

## Operator perbandingan

Operator perbandingan（Comparison Operators）digunakan untuk menentukan hubungan antara dua nilai, dan hasilnya ialah `Bool`：

- `==` sama dengan
- `!=` tidak sama dengan
- `>` lebih besar daripada
- `<` lebih kecil daripada
- `>=` lebih besar atau sama dengan
- `<=` lebih kecil atau sama dengan

Contoh:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Operator perbandingan sering digunakan dalam kenyataan penentuan. Contohnya, dalam “karusel kata-kata hikmah”, kita perlu mengawal supaya indeks tidak melebihi julat array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jika `index` lebih kecil daripada `sayings.count - 1`，hasil perbandingan ialah `true`，maka kod dalam kenyataan `if` akan dilaksanakan；jika hasil perbandingan ialah `false`，kod selepas itu tidak akan dilaksanakan.

## Operator logik

Operator logik（Logical Operators）digunakan untuk menggabungkan beberapa syarat:

- `&&` dan（AND）
- `||` atau（OR）
- `!` bukan（NOT）

### `&&` dan

Apabila beberapa syarat mesti dipenuhi serentak, gunakan `&&`。

Contohnya:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Dalam kod ini, terdapat dua syarat: `age >= 18` dan `age <= 100`。

Hanya apabila kedua-dua syarat ini sama-sama bernilai `true`，barulah `legalAge` menjadi `true`；selagi satu syarat tidak dipenuhi, hasilnya ialah `false`。

### `||` atau

Apabila beberapa syarat hanya perlu memenuhi salah satu daripadanya, gunakan `||`。

Contohnya:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Kod ini menunjukkan bahawa selagi `money >= 50` atau `creditCard >= 50` dipenuhi, maka `payAllowed` ialah `true`。

Hanya apabila kedua-dua syarat tidak dipenuhi, hasilnya barulah `false`。

Sebagai contoh, dalam senario pembayaran, kita boleh menggunakan wang tunai atau kad kredit untuk membayar. Jika kedua-duanya tidak boleh digunakan untuk membayar, maka pembayaran akan gagal.

### `!` bukan

`!` ialah operator logik bukan（NOT），digunakan untuk membalikkan nilai `Bool`。

Ia boleh difahami secara ringkas sebagai menukar `true` menjadi `false`，dan `false` menjadi `true`。

Contohnya:

```swift
let allowed = true
let result = !allowed   // false
```

Di sini, `!allowed` bermaksud membalikkan nilai `allowed`。

Perlu diperhatikan bahawa `!` dan `!=` ialah dua operator yang berbeza: `!` membalikkan nilai `Bool`，manakala `!=` ialah operator perbandingan yang mengembalikan nilai `Bool`。

## Operator penugasan

Operator penugasan（Assignment Operators）digunakan untuk memberikan nilai atau mengemas kini pembolehubah:

- `=` penugasan

Sama ada ketika mengisytiharkan pembolehubah atau semasa proses pengiraan, operasi penugasan akan terlibat:

```swift
let a = 5
```

Kod ini bermaksud menetapkan nilai `5` kepada pembolehubah `a`。

### Operator penugasan gabungan

Dalam pembangunan sebenar, selain operator penugasan asas, kita juga sering menggunakan “operator penugasan gabungan” untuk terus mengira berdasarkan nilai sedia ada dan mengemas kininya:

- `+=`
- `-=`
- `*=`
- `/=`

Dalam pelajaran “kaunter” sebelum ini, kita sudah mengenali operator penugasan gabungan secara ringkas.

Contohnya, apabila butang ditekan dan kita mahu pembolehubah bertambah secara automatik:

```swift
var num = 10
num += 5   // num = 15
```

Kod ini menunjukkan bahawa `num` ditambah dengan `5`，kemudian hasilnya ditugaskan semula kepada `num`。

Oleh itu, ia setara dengan:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operator ternari

Operator ternari（Ternary Operator）dalam Swift akan membuat penentuan berdasarkan satu syarat dan mengembalikan salah satu daripada dua hasil:

```swift
syarat ? nilai1 : nilai2
```

Logik pelaksanaannya ialah: jika syarat ialah `true`，kembalikan “nilai1”；jika syarat ialah `false`，kembalikan “nilai2”。

Contohnya:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Kod ini akan menentukan nilai `showColor`：jika `true`，ia mengembalikan `Color.blue` dan latar belakang akan berwarna biru；jika `false`，ia mengembalikan `Color.clear` dan tiada warna latar dipaparkan.

Petua: `Color.clear` bermaksud warna lutsinar（tidak memaparkan kandungan）。

### Perbezaannya dengan `if-else`

Secara logik, operator ternari adalah setara dengan kenyataan `if-else`。

Contohnya, kod di atas boleh ditulis seperti ini:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logik pelaksanaan kedua-duanya adalah sama sepenuhnya: apabila syarat ialah `true`，hasil pertama akan digunakan；apabila syarat ialah `false`，hasil kedua akan digunakan.

Dalam penggunaan sebenar, operator ternari lebih ringkas dan lebih sesuai untuk menyatakan penentuan mudah “pilih satu daripada dua”, serta sering digunakan untuk terus mengembalikan satu nilai.

Dalam pembinaan View SwiftUI, operator ternari sangat lazim. Contohnya:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Cara penulisan ini membolehkan kita mengubah kesan view secara dinamik mengikut syarat dalam satu baris kod.

## Operator julat

Operator julat（Range Operators）digunakan untuk mewakili satu selang:

- `...` julat tertutup（merangkumi kedua-dua hujung）
- `..<` julat separa terbuka（tidak merangkumi hujung kanan）

Contohnya:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Ia boleh difahami sebagai berikut: `1...3` bermaksud dari 1 hingga 3 dan termasuk 3；`5..<8` bermaksud dari 5 hingga 8 tetapi tidak termasuk 8。

Bentuk lanjutan（sekadar tahu）：

```
5...    // >= 5
...5    // <= 5
```

Penulisan ini mewakili “julat satu hala” dan sering digunakan dalam pertimbangan syarat atau pemadanan corak.

Operator julat akan digunakan apabila kita mempelajari gelung `for` kemudian. Pada masa ini, anda boleh memahaminya sebagai satu julat nilai yang berterusan.

## Latihan operator

Seterusnya, kita gunakan beberapa contoh mudah untuk berlatih menggunakan operator dalam view.

### 1. Mengira jumlah kenderaan

Contohnya, satu persimpangan mempunyai 500 buah kenderaan yang melalui setiap hari. Kira jumlah keseluruhan kenderaan yang melalui dalam tempoh 30 hari.

Kita boleh menggunakan operator pengiraan:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Proses pengiraannya ialah: 500 buah kenderaan sehari, jadi jumlah untuk 30 hari ialah `500 × 30`，dan akhirnya mendapat jumlah `15000` buah kenderaan.

### 2. Menentukan ahli pembelian dalam aplikasi

Kita boleh menentukan sama ada seseorang ialah ahli pembelian dalam aplikasi. Selagi dia telah membuka salah satu daripada keahlian seumur hidup atau keahlian langganan, maka dia dianggap sebagai ahli.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Dalam kod ini digunakan operator `||`（atau）：`lifeTime = false` bermaksud tiada keahlian seumur hidup；`subscription = true` bermaksud ada keahlian langganan。

Disebabkan hanya satu syarat perlu dipenuhi, maka `isMember` ialah `true`。Oleh itu, orang ini ialah ahli pembelian dalam aplikasi.

## Ringkasan

Dalam Swift, operator ialah asas kepada pengiraan data dan pertimbangan logik. Sama seperti `Text` digunakan untuk memaparkan kandungan, operator pula digunakan untuk memproses data itu sendiri.

Daripada pengiraan angka yang paling ringkas, kepada pertimbangan logik yang lebih rumit, hinggalah kawalan keadaan dan pengiraan susun atur dalam view, semuanya tidak dapat dipisahkan daripada penggunaan operator.

Melalui latihan dalam pelbagai senario, kita boleh beransur-ansur membiasakan diri dan menguasai pelbagai operator yang diperkenalkan dalam pelajaran ini, dan ini merupakan asas penting untuk pembelajaran seterusnya.

### Pengetahuan lanjutan - operator bit

Selain itu, Swift juga menyediakan satu lagi kategori operator peringkat rendah, iaitu operator bit（Bitwise Operators）：

- `&`（AND bit demi bit）
- `|`（OR bit demi bit）
- `^`（XOR bit demi bit）
- `~`（songsang bit demi bit）
- `>>`（alih ke kanan）
- `<<`（alih ke kiri）

Contohnya:

```swift
let a = 6  // perduaan 110
let b = 3  // perduaan 011

print(a & b) // 2 (perduaan 010)
print(a | b) // 7 (perduaan 111)
print(a ^ b) // 5 (perduaan 101)
print(~a)    // -7 (songsangan)
```

Dalam Swift, integer diwakili menggunakan pelengkap dua perduaan, jadi selepas disongsangkan, kita akan mendapat hasil nombor negatif yang sepadan.

Operator bit beroperasi secara terus pada perduaan dan biasanya digunakan dalam pemprosesan data peringkat rendah serta senario pengoptimuman prestasi.

Bagi pemula, situasi penggunaan operator sebegini agak sedikit, dan dalam pembangunan iOS atau SwiftUI biasa ia juga tidak begitu lazim, jadi kita tidak akan menghuraikannya dengan lebih mendalam di sini.

Jika pada masa hadapan kita melibatkan logik peringkat rendah atau pengoptimuman prestasi, kita boleh mempelajarinya dan memahaminya dengan lebih lanjut.
