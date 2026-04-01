# Gelung dan senarai

Dalam pelajaran ini, kita akan mempelajari gelung `for` dalam Swift, serta `ForEach` dalam SwiftUI.

Kedua-duanya boleh membantu kita membaca elemen dalam tatasusunan mengikut urutan. Dalam pembangunan sebenar, kita sering perlu mengambil sekumpulan data satu demi satu, kemudian memproses atau memaparkannya, dan gelung ialah alat penting untuk menyelesaikan kerja ini.

Apabila kita melayari laman web atau menggunakan App, kita sering melihat banyak senarai atau item. Kandungan seperti ini biasanya akan disimpan dahulu dalam `tatasusunan`, kemudian dibaca satu demi satu melalui `gelung`, dan akhirnya dipaparkan pada antara muka.

Contohnya, senarai hasil carian Google:

![Google](../../Resource/017_google.png)

Setiap item dalam senarai hasil carian biasanya sepadan dengan satu data, dan dipaparkan satu demi satu melalui gelung.

Oleh itu, `tatasusunan` dan `gelung` sering muncul bersama. `Tatasusunan` bertanggungjawab untuk menyimpan sekumpulan data, manakala `gelung` bertanggungjawab untuk mengambil data ini mengikut urutan dan menjalankan operasi yang sama.

Sekarang, mari kita mulakan dengan gelung `for` yang paling asas.

## Kiraan detik

Katakan kita mahu mensimulasikan satu fungsi kiraan detik, dan mengeluarkan `“5、4、3、2、1”` satu demi satu.

Cara penulisan yang paling langsung ialah:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Walaupun cara ini boleh mensimulasikan fungsi kiraan detik, jika kandungannya banyak, ia akan kelihatan sangat berulang, dan juga tidak begitu mudah untuk diubah kemudian.

Pada masa ini, kita boleh letakkan data terlebih dahulu ke dalam tatasusunan, kemudian gunakan gelung `for` untuk mencetaknya satu demi satu:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Cara ini lebih ringkas, dan juga lebih mudah untuk dikembangkan. Walaupun terdapat banyak nombor dalam kiraan detik, kita tidak perlu menulis `print` berulang kali baris demi baris, kita hanya perlu membiarkan gelung mengendalikan setiap elemen dalam tatasusunan secara automatik.

Kita boleh letakkan kod ini ke dalam butang untuk diuji:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Apabila butang ditekan, gelung `for` akan mengambil setiap integer dalam `countDown` satu demi satu mengikut urutan tatasusunan, lalu mencetaknya ke konsol.

Seterusnya, mari kita lihat bagaimana gelung `for` berfungsi.

## gelung for

Gelung `for` digunakan untuk memproses sekumpulan data mengikut urutan. Objek yang paling biasa ialah tatasusunan dan julat.

Bentuk asas:

```swift
for elemen in tatasusunan atau julat {
    kod yang dijalankan
}
```

Contohnya, kod kiraan detik tadi:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Di sini, `i` mewakili elemen yang sedang diambil, dan selepas `in` ialah data yang hendak digelungkan, iaitu tatasusunan `countDown`.

Maksud kod ini ialah: program akan mengambil setiap elemen daripada tatasusunan `countDown` mengikut urutan. Setiap kali satu elemen diambil, ia akan diwakili sementara oleh `i`, kemudian kod dalam kurungan keriting akan dijalankan.

Proses pelaksanaannya boleh difahami seperti ini:

* Kali pertama yang diambil ialah `5`, jadi nilai `i` pada masa itu ialah `5`
* Jalankan `print(i)`, lalu keluarkan `5`
* Kemudian terus ambil elemen seterusnya `4`
* Jalankan `print(i)` sekali lagi, lalu keluarkan `4`

`3`、`2`、`1` selepas itu juga akan dijalankan satu demi satu dengan cara yang sama.

![for](../../Resource/017_for.png)

Apabila semua elemen dalam tatasusunan selesai diproses, gelung `for` akan tamat secara automatik.

Kita boleh menggunakan gelung `for` untuk mendapatkan setiap elemen dalam tatasusunan, dan melaksanakan fungsi seperti kiraan detik.

**Petua**: `i` ialah cara penamaan yang sangat biasa dalam gelung for, digunakan untuk mewakili elemen yang sedang diambil, tetapi ia bukanlah penulisan yang tetap, dan kita juga boleh menggunakan nama Inggeris yang lain.

Contohnya, gunakan `num` untuk mewakili setiap elemen yang diambil:

```swift
for num in countDown {
    print(num)
}
```

Di dalam kurungan keriting, kita juga perlu menggunakan `num` untuk mewakili elemen yang sedang diambil.

### Julat gelung

Gelung `for` bukan sahaja boleh menggelungkan tatasusunan, tetapi juga boleh menggelungkan julat.

Contohnya, apabila kita perlu mengira jumlah integer positif dalam lingkungan `50`, kita perlu menambah semua integer dari `1` hingga `50` satu demi satu.

Cara penulisan yang paling langsung mungkin ialah:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Masalah dengan penulisan ini ialah kita perlu menulis setiap nombor secara manual, yang bukan sahaja menyusahkan, tetapi juga tidak sesuai untuk senario pembangunan sebenar.

Pada masa ini, kita boleh menggunakan operator julat bersama gelung `for` untuk menyelesaikannya.

Dalam bab “operator” sebelum ini, kita telah mempelajari operator julat:

```swift
1...3   // 1, 2, 3
```

Di sini, `...` mewakili julat tertutup, iaitu termasuk titik permulaan dan titik akhir.

Oleh itu, di sini kita boleh menggunakan gelung `for` untuk julat integer dari `1` hingga `50`:

```swift
for i in 1...50 {
    
}
```

Kita perlu menambah integer ini, jadi kita juga memerlukan satu pemboleh ubah untuk menyimpan jumlah:

```swift
var count = 0
```

Kemudian, setiap kali gelung dijalankan, tambahkan nombor semasa yang diambil ke dalam `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Kod ini bermaksud:

* `count` digunakan untuk menyimpan jumlah semasa
* Gelung `for` akan mengambil integer dari `1` hingga `50` satu demi satu
* Setiap kali satu integer diambil, `count += i` akan dijalankan sekali
* Selepas gelung tamat, `count` akan menyimpan jumlah akhir

Dengan cara ini, kita boleh mendapatkan jumlah semua integer positif dalam lingkungan `50`.

Begitu juga, jika kita perlu mengira jumlah integer dari `1` hingga `100`, kita hanya perlu menukar julat:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Gelung `for` bukan sahaja boleh menggelungkan tatasusunan, tetapi juga satu julat. Keupayaan untuk memproses data berulang kali mengikut urutan ini sangat biasa dalam pembangunan.

Ia boleh membantu kita mengendalikan banyak kerja berulang secara automatik, tanpa perlu menulis sendiri proses menambah setiap nombor satu demi satu, atau operasi berulang lain yang serupa.

## Gelung dalam SwiftUI

Gelung `for` yang dibincangkan tadi ialah sebahagian daripada bahasa Swift.

Tetapi dalam SwiftUI, kita tidak boleh terus menggunakan `for` di dalam struktur paparan untuk menjana view:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Ini kerana `VStack` memerlukan view SwiftUI di dalamnya, manakala gelung `for` biasa itu sendiri bukanlah satu view.

Jika kita mahu menjana antara muka secara berulang dalam SwiftUI berdasarkan kandungan tatasusunan, kita perlu menggunakan `ForEach`.

Contohnya, jika kita mahu memaparkan nama semua ahli dalam satu kumpulan, kita boleh menulis seperti ini:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Kesan paparan:

![for1](../../Resource/017_for1.png)

Kemudian, kita tambah modifier yang sama pada setiap `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Sekarang, setiap `Text` akan dipaparkan dengan fon yang lebih kecil dan lebih tebal.

Kesan paparan:

![](../../Resource/017_for2.png)

Walaupun modifier menjadikan antara muka lebih cantik, ia juga menjadikan kod lebih panjang dan lebih berulang.

Jika nama terus bertambah, atau jika kita mahu menukar gaya seperti fon dan warna secara serentak kemudian, kita perlu berulang kali menulis dan mengubah banyak kod yang sama. Ini akan menjadi agak menyusahkan dan juga tidak mudah untuk diselenggara.

Pada masa ini, kita boleh letakkan nama-nama ini dahulu ke dalam tatasusunan, kemudian gunakan `ForEach` dalam SwiftUI untuk menjana view secara berulang berdasarkan data dalam tatasusunan:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Kumpulan kod ini lebih ringkas. `ForEach` akan membaca setiap elemen dalam tatasusunan satu demi satu, dan memaparkan kandungan yang sepadan ke dalam antara muka.

Apabila kita menambah nama baharu kemudian, kita hanya perlu mengubah nama dalam tatasusunan `names`, tanpa perlu berulang kali menambah `Text` dan modifier yang kompleks setiap kali.

## ForEach

`ForEach` ialah struktur dalam SwiftUI yang digunakan untuk menjana view secara berulang. Ia boleh difahami sebagai satu struktur dalam SwiftUI yang serupa dengan gelung `for`.

Penggunaan asas:

```swift
ForEach(tatasusunan, id: \.self) { elemen in
    kod SwiftUI
}
```

Contohnya, nama kumpulan tadi:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Kod ini bermaksud:

`names` ialah tatasusunan yang digelungkan, iaitu data yang hendak dipaparkan.

`id:\.self` bermaksud menggunakan elemen dalam tatasusunan itu sendiri untuk membezakan setiap item.

Dalam contoh semasa, tatasusunan menyimpan string:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Oleh itu, SwiftUI akan terus menggunakan string seperti "Sam"、"John"、"Wathon"、"Bob" itu sendiri untuk membezakan kandungan yang berbeza.

Untuk tatasusunan mudah seperti String dan Int yang biasa pada peringkat awal, kita biasanya boleh terus menulis seperti ini:

```swift
id: \.self
```

Buat masa ini, kita hanya perlu ingat satu cara penulisan ini dahulu, dan tidak perlu memahami lebih mendalam tentang peraturan `id` yang lain.

`item in` di sini, `item` mewakili elemen yang sedang diambil.

Contohnya, dalam gelung pertama, `item` ialah `"Sam"`, dan dalam gelung kedua, `item` ialah `"John"`.

Oleh itu:

```swift
Text(item)
```

akan bertukar satu demi satu menjadi:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Jadi, fungsi kod ini ialah: mengambil setiap nama daripada tatasusunan `names` satu demi satu, dan menjana satu view `Text` untuk setiap nama.

### Proses pelaksanaan

Proses pelaksanaan boleh difahami seperti ini:

* `ForEach` mula-mula membaca elemen pertama `"Sam"` dalam tatasusunan `names`
* `item` mewakili `"Sam"` buat sementara waktu
* `Text(item)` memaparkan `"Sam"`
* Kemudian terus membaca elemen seterusnya `"John"`
* Lalu mengulangi kod view yang sama sekali lagi

Akhirnya, semua nama dalam tatasusunan akan dipaparkan.

Kelebihan penulisan ini ialah: apabila nama bertambah, kita tidak perlu berulang kali menulis banyak `Text`, kita hanya perlu mengubah kandungan tatasusunan.

### Menggelungkan gambar

`ForEach` bukan sahaja boleh memaparkan teks, tetapi juga gambar, warna, atau view SwiftUI yang lain.

Contohnya, kita menyediakan 4 gambar:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Seret keempat-empat gambar ini ke dalam folder Assets dalam Xcode.

![image](../../Resource/017_for3.png)

Jika kita tidak menggunakan `ForEach`, kita perlu menulis setiap gambar secara manual:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Kesan paparan:

![image](../../Resource/017_for4.png)

Cara penulisan ini memang boleh melaksanakan fungsi, tetapi kodnya akan menjadi agak panjang.

Jika gambar semakin banyak, kita perlu menulis semakin banyak kod `Image` yang berulang.

Kemudian jika kita mahu menukar saiz semua gambar secara seragam, kita juga perlu mengubahnya satu demi satu.

Pada masa ini, kita boleh meletakkan nama gambar ke dalam tatasusunan, kemudian gunakan `ForEach` untuk menjana view gambar secara berulang:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Di sini, `images` ialah tatasusunan string, dan setiap elemen dalam tatasusunan ialah nama gambar.

`ForEach(images, id: \.self)` bermaksud membaca setiap elemen dalam tatasusunan `images` satu demi satu, menggunakan elemen itu sendiri untuk membezakan setiap item, kemudian menjana view yang sepadan berdasarkan elemen semasa.

Contohnya, jika elemen pertama yang dibaca ialah `"430F9BEF"`, maka:

```swift
Image(item)
```

adalah bersamaan dengan:

```swift
Image("430F9BEF")
```

Gambar-gambar seterusnya juga akan dipaparkan satu demi satu dengan cara yang sama.

![image](../../Resource/017_for4.png)

Di sini kita masih menggunakan:

```swift
id: \.self
```

Sebabnya sama seperti sebelum ini, kerana elemen dalam tatasusunan `images` juga merupakan jenis string yang mudah, jadi pada peringkat awal kita boleh terus menggunakan elemen itu sendiri sebagai cara pembezaan.

Ia boleh difahami secara ringkas sebagai satu formula tetap:

**Apabila `ForEach` menggelungkan tatasusunan mudah seperti `String` atau `Int`, kita biasanya menulis `id: \.self`.**

### Menambah gambar baharu

Jika kita perlu menambah gambar kemudian, kita hanya perlu mengubah kandungan tatasusunan:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Kita tidak perlu lagi berulang kali menulis kod `Image` yang baharu.

Jika gambar agak banyak, kita boleh menggunakannya bersama `ScrollView`, jika tidak, kandungan yang melebihi skrin tidak akan dapat dipratonton sepenuhnya.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Mengubah gambar

Apabila kita perlu mengubah gaya semua gambar secara seragam, kita hanya perlu mengubah kod di dalam `ForEach`.

Contohnya, tukar lebar kepada `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Dengan cara ini, semua gambar akan berubah bersama-sama, dan kita tidak perlu mengubahnya satu demi satu.

Inilah salah satu fungsi penting `ForEach`:

**Apabila banyak view mempunyai struktur yang sama, tetapi hanya kandungannya berbeza, kita boleh menulis satu set kod view sahaja, kemudian biarkan data dalam tatasusunan menentukan kandungan yang hendak dipaparkan.**

## Ringkasan

Dalam pelajaran ini, kita telah mempelajari gelung `for` dan `ForEach`.

Gelung `for` digunakan untuk memproses elemen dalam tatasusunan atau julat mengikut urutan, dan lebih cenderung kepada pemprosesan data.

`ForEach` digunakan dalam SwiftUI untuk menjana view secara berulang berdasarkan kandungan tatasusunan, dan lebih cenderung kepada paparan view.

Pada peringkat awal semasa, cara penulisan `ForEach` yang paling biasa ialah:

```swift
ForEach(tatasusunan, id: \.self) { elemen in
    kod SwiftUI
}
```

Di sini, `id: \.self` bermaksud menggunakan elemen itu sendiri untuk membezakan setiap item.

Apabila kandungan dalam tatasusunan ialah jenis mudah seperti `String`、`Int`, kita biasanya boleh menggunakan cara penulisan ini dahulu.

Pada masa akan datang, apabila kita melihat teks berulang, gambar, atau kandungan senarai lain semasa melayari laman web atau App, kita boleh teringat bahawa dalam SwiftUI, kandungan seperti ini biasanya akan disimpan dahulu dalam tatasusunan, kemudian dipaparkan satu demi satu melalui `ForEach`.
