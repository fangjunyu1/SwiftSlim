# Simpan amaun tabung duit syiling

Dalam pelajaran sebelum ini, kita telah membina satu “tabung duit syiling” yang mudah. Dalam pelajaran ini, kita akan mempelajari cara membolehkan amaun dalam “tabung duit syiling” disimpan secara berterusan.

Pelajaran ini terutamanya memperkenalkan `UserDefaults` dan pembungkus sifat `@AppStorage`，serta melanjutkan penjelasan tentang fungsi `onAppear` dan cara menggunakan jenis opsyenal（`nil`）。

Perlu diperhatikan bahawa pelajaran ini perlu meneruskan kod “tabung duit syiling” yang dibangunkan dalam pelajaran sebelumnya.

## Masalah simpanan berterusan

Sekarang, antara muka “tabung duit syiling” ini sangat ringkas dan juga mudah digunakan.

![Piggy Bank](../../Resource/014_view.png)

Namun, terdapat satu masalah yang ketara: setiap kali view dimuat semula atau aplikasi ditutup, jumlah keseluruhan dalam “tabung duit syiling” akan kembali menjadi `0`，dan semua amaun sebelumnya akan hilang.

Ini bermaksud data itu sebenarnya tidak benar-benar disimpan. Dengan kata lain, “tabung duit syiling” sekarang hanya boleh menyimpan data sementara.

### Mengapa ia tidak boleh disimpan secara berterusan

Ini kerana kita menggunakan pembolehubah yang diisytiharkan dengan `@State`：

```swift
@State private var amount = 0
```

Pembolehubah yang diisytiharkan dengan `@State` mempunyai kitar hayat yang bergantung sepenuhnya pada view.

Apabila view dicipta, `amount` akan diinisialisasi sebagai `0`；apabila view dimusnahkan, `amount` juga akan dimusnahkan.

Data yang disimpan dalam `amount` hanya wujud di dalam memori dan tidak disimpan ke dalam peranti.

Jika kita tidak mahu `amount` terikat dengan kitar hayat view, maka kita perlu melaksanakan simpanan data berterusan. Dalam kata lain, kita perlu menyimpan data ke dalam peranti.

### Apakah itu “penyimpanan data berterusan”

Penyimpanan data berterusan boleh difahami sebagai menyimpan data daripada “memori sementara” ke “stor peranti”.

Apabila view ditutup atau aplikasi ditutup, data itu tidak akan hilang.

Dalam pembangunan Swift, simpanan berterusan yang ringkas boleh dilaksanakan dengan `UserDefaults`，manakala data yang lebih kompleks memerlukan `SwiftData` atau `CoreData`。

Dalam pelajaran ini, kita akan mempelajari `UserDefaults` yang paling mudah terlebih dahulu.

## `UserDefaults`

`UserDefaults` digunakan untuk menyimpan data pasangan kunci-nilai yang ringan, dan sering digunakan untuk menyimpan jenis asas seperti `String`、`Int`、`Double`、`Bool` dan sebagainya.

### Simpan data

`UserDefaults` menggunakan kaedah `set` untuk menyimpan data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Parameter pertama `UserDefaults` ialah data yang hendak disimpan, dan di sini kita memasukkan data seperti `String` dan `Int`。

Parameter kedua `forKey` seakan-akan nama pembolehubah dan digunakan untuk mengenal pasti data yang disimpan oleh `UserDefaults`。

### Baca data

`UserDefaults` menggunakan kaedah yang sepadan untuk membaca:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Semasa membaca, kita mesti menggunakan kaedah bagi jenis yang sepadan, jika tidak ralat atau data yang tidak tepat mungkin berlaku.

### Perkara yang perlu diberi perhatian tentang `UserDefaults`

#### 1. Mengembalikan jenis opsyenal

Apabila kita membaca data menggunakan `UserDefaults`，sesetengah kaedah akan mengembalikan jenis opsyenal（Optional）。

Contohnya:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Jenis `name` yang dikembalikan ialah:

```swift
String?
```

Ini bermaksud ia mungkin mempunyai nilai, atau mungkin juga tiada nilai.

**Mengapa ia mengembalikan jenis opsyenal?**

Ini kerana bagi sesuatu `Key` dalam `UserDefaults`，tidak semestinya terdapat data yang sepadan.

Contohnya:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Jika `Key` bernama `"City"` tidak pernah disimpan sebelum ini, maka hasil bacaannya ialah:

```swift
nil
```

Perlu ditekankan bahawa `nil` bermaksud tiada data, bukannya rentetan kosong.

Dalam pelajaran “sistem jenis” sebelum ini, kita juga pernah berhadapan dengan masalah yang serupa: apabila penukaran jenis data gagal, ia akan mengembalikan jenis opsyenal.

Pada masa ini, kita perlu menggunakan `??` untuk memberikan nilai lalai dan melakukan unwrapping:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Jika `UserDefaults` berjaya membaca data, maka nilai yang dibaca akan digunakan；jika tiada data dibaca（`nil`），nilai lalai akan digunakan.

#### 2. Mengembalikan jenis bukan opsyenal

Apabila `UserDefaults` membaca jenis `Int`、`Double`、`Bool`，ia mengembalikan jenis bukan opsyenal.

Contohnya:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Walaupun `Key` ini tidak pernah disimpan dengan data sebelum ini, nilai yang dikembalikan tetap bukan `nil`。

Sebaliknya, ia akan mengembalikan nilai lalai:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Had jumlah data

`UserDefaults` hanya sesuai untuk menyimpan sedikit data, seperti konfigurasi aplikasi dan keadaan ringkas.

Dalam amalan sebenar, ia tidak sesuai untuk menyimpan data dalam jumlah besar atau data yang dibaca dan ditulis dengan sangat kerap.

## Simpan amaun “tabung duit syiling”

Sekarang, kita boleh menggunakan `UserDefaults` untuk melaksanakan logik menyimpan jumlah keseluruhan dalam “tabung duit syiling”.

Apabila pengguna menekan butang, amaun yang dimasukkan akan ditambah kepada jumlah keseluruhan, kemudian jumlah itu disimpan ke dalam `UserDefaults`。

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Sekarang, kita telah melengkapkan logik untuk menulis data.

## Penjelasan logik penyimpanan berterusan

Walaupun kita sudah melengkapkan logik penulisan bagi simpanan berterusan, apabila dijalankan kita akan mendapati bahawa setiap kali view dimuat semula atau aplikasi dibuka semula, pembolehubah `amount` masih bernilai `0`。

Ini kerana:

```swift
@State private var amount = 0
```

Dalam SwiftUI, pembolehubah `@State` akan diinisialisasi semula apabila view dicipta semula.

Walaupun nilai `amount` telah disimpan dalam `UserDefaults`，apabila view dimuat semula, `amount` tetap akan ditetapkan semula kepada `0`。

Ini menunjukkan bahawa kita setakat ini hanya menyimpan data ke dalam `UserDefaults`，tetapi belum memulihkan data tersebut ke dalam view.

Oleh itu, semasa view dimuatkan, kita juga perlu membaca data daripada `UserDefaults` secara manual dan menetapkannya semula kepada `amount`，barulah keseluruhan logik penyimpanan berterusan dapat dilaksanakan.

### Analogi logik

Proses ini boleh difahami seperti “papan hitam di dalam bilik darjah”:

Semasa mengajar, guru akan menulis kandungan di atas papan hitam. Kandungan ini sama seperti keadaan semasa dalam view（`@State`）。

Apabila kelas tamat, papan hitam akan dipadam bersih untuk persediaan kelas seterusnya. Ini bersamaan dengan view dimusnahkan dan data dalam `@State` juga dikosongkan.

Untuk mengelakkan kandungan pembelajaran hilang, guru akan menyimpannya terlebih dahulu dalam bahan pengajaran. Bahan pengajaran ini sama seperti data yang disimpan dalam `UserDefaults`。

Apabila kelas bermula semula pada masa lain, papan hitam pada awalnya kosong（`@State` diinisialisasi），dan guru perlu menyalin semula kandungan daripada bahan pengajaran ke papan hitam（membaca `UserDefaults`）。

Perlu difahami bahawa papan hitam tidak akan memulihkan kandungannya secara automatik. Ia mesti ditulis semula melalui “membaca bahan pengajaran”（membaca `UserDefaults`）。

## Gunakan `onAppear` untuk membaca data

Apabila view dipaparkan, kita perlu membaca nilai dalam `UserDefaults` secara manual dan menugaskannya kepada pembolehubah `amount` dalam `@State`，supaya simpanan berterusan benar-benar dapat direalisasikan.

Dalam SwiftUI, kita boleh menggunakan `onAppear` untuk melaksanakan logik inisialisasi apabila view dipaparkan:

```swift
.onAppear {}
```

Letakkan kod untuk membaca `UserDefaults` ke dalam `onAppear`：

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Apabila view dicipta, `amount` mula-mula diinisialisasi sebagai `0`；apabila view dipaparkan, `onAppear` akan dicetuskan dan nilai akan dibaca daripada `UserDefaults` lalu ditugaskan kepada `amount`。Dengan itu, view akan dapat memaparkan jumlah yang disimpan sebelum ini.

Kini, keseluruhan logik penyimpanan berterusan bagi “tabung duit syiling” telah lengkap.

## Kod lengkap

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Pembungkus sifat `@AppStorage`

SwiftUI menyediakan pembungkus sifat `@AppStorage` yang boleh memudahkan logik penyimpanan `UserDefaults`。

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` ialah pembungkusan bagi `UserDefaults`，dan `"amount"` sepadan dengan `Key` dalam `UserDefaults`。

Apabila view dicipta, ia akan membaca data daripada `UserDefaults`；apabila pembolehubah berubah, ia akan menulis semula ke dalam `UserDefaults` secara automatik.

Ia juga menyokong mekanisme kemas kini keadaan SwiftUI. Sama seperti `@State`，apabila nilainya berubah, view SwiftUI akan turut dimuat semula.

Dengan kata lain, `@AppStorage` boleh melaksanakan logik membaca dan menyimpan data, jadi kita tidak lagi perlu memanggil `UserDefaults` secara manual, dan juga tidak perlu menggunakan `onAppear` untuk membaca data secara manual.

Oleh itu, kita boleh menggunakan `@AppStorage` untuk menggantikan `UserDefaults` dalam kod:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Ringkasan

Dalam pelajaran ini, kita terutamanya mempelajari pengetahuan berikut:

Pertama, `UserDefaults` digunakan untuk menyimpan data ringan. Kita menggunakan `UserDefaults` untuk menyimpan jumlah keseluruhan ke dalam peranti. `UserDefaults` menyediakan kaedah membaca dan menulis, dan pada masa yang sama kita juga perlu menangani situasi jenis opsyenal.

Kedua, pembolehubah `@State` hanya digunakan untuk mengurus keadaan sementara dalam view, dan kitar hayatnya adalah sama dengan view. Apabila view dicipta semula, `@State` juga akan diinisialisasi semula.

Semasa memulihkan data daripada `UserDefaults`，kita telah mempelajari cara menggunakan `onAppear` untuk membaca `UserDefaults` apabila view dipaparkan dan menyelesaikan pemulihan data.

Akhir sekali, kita menggunakan `@AppStorage` untuk menggantikan `UserDefaults`，supaya data dibaca secara automatik apabila view dimuat, dan ditulis secara automatik apabila data berubah, sekali gus menggantikan logik panggilan manual `UserDefaults` dan `onAppear`。

Melalui pengetahuan ini, kita boleh melaksanakan fungsi penyimpanan data App yang asas, supaya data dapat disimpan secara berterusan.

## Latihan selepas kelas

Sekarang, “tabung duit syiling” sudah menyokong penyimpanan amaun, tetapi fungsinya masih belum lengkap.

1. Apabila pengguna perlu mengeluarkan wang, kita perlu mereka bentuk logik pengeluaran yang sepadan.
2. Apabila pengguna mahu mengosongkan amaun, kita juga perlu melaksanakan logik tetapan semula.
3. Jika kita mahu menambah nama untuk tabung duit syiling, kita juga perlu memperkenalkan penyimpanan data jenis `String`。

Anda boleh menambah baik fungsi-fungsi ini berdasarkan kod sedia ada supaya “tabung duit syiling” menjadi lebih lengkap.

## Pengetahuan lanjutan - masalah nilai lalai kotak input

Sekarang, kita juga boleh mengoptimumkan lagi interaksi kotak input supaya operasi input menjadi lebih mudah.

![textfield](../../Resource/015_view.png)

Dalam pelaksanaan semasa, nilai lalai kotak input ialah `0`。Setiap kali pengguna memasukkan amaun, mereka perlu memadam `0` terlebih dahulu sebelum menaip nombor baharu, dan pengalaman interaksi seperti ini tidak begitu baik.

Kita sepatutnya membiarkan nilai awal kotak input kosong, bukannya `0`。

Ini kerana `TextField` dan `number` mempunyai pengikatan dua hala:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Apabila `number` diinisialisasi sebagai `0`，kotak input juga akan memaparkan `0`。

Oleh itu, kita perlu menukar `number` menjadi nilai kosong, iaitu `nil`。

```swift
@State private var number = nil
```

Pada masa ini, ralat akan muncul:

```
Generic parameter 'Value' could not be inferred
```

Inilah situasi yang telah kita pelajari dalam “sistem jenis”: apabila pembolehubah tidak dapat ditentukan jenisnya secara automatik, kita perlu mengisytiharkan jenisnya secara eksplisit.

Disebabkan kita menetapkan `number` kepada `nil`，dan `nil` sendiri tidak mengandungi sebarang maklumat jenis, penyusun tidak dapat menentukan sama ada pembolehubah ini ialah `String`、`Int` atau jenis lain, maka ralat akan berlaku.

Oleh itu, kita perlu mengisytiharkan jenis `number` secara eksplisit:

```swift
@State private var number:Int? = nil
```

Di sini `Int?` menunjukkan jenis opsyenal（Optional），iaitu nilai `number` boleh jadi `Int` atau `nil`。

Dengan cara ini, jika ia diinisialisasi sebagai `nil`，kotak input akan dipaparkan kosong dan bukannya `0`。

### Unwrap jenis opsyenal

Apabila kita menukar `number` kepada jenis opsyenal, kod pengiraan asal akan melaporkan ralat:

```swift
amount += number
```

Petunjuknya ialah:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Ini kerana `number` sekarang mungkin ialah `nil`。Jika terus mengambil bahagian dalam pengiraan, ia akan menjadi:

```swift
amount += nil
```

Jelas sekali, `nil` tidak boleh ditambah dengan `amount`。Ini ialah operasi yang tidak sah.

Oleh itu, apabila jenis opsyenal digunakan dalam pengiraan, ia perlu di-unwrapped terlebih dahulu.

Di sini kita boleh menggunakan `??` untuk memberikan nilai lalai:

```swift
amount += number ?? 0
```

Apabila `number` ialah `nil`，nilai lalai `0` akan digunakan；apabila `number` mempunyai nilai, data input sebenar akan digunakan.

Ini bukan sahaja menjamin ketepatan pengiraan, tetapi juga membolehkan kotak input dipaparkan kosong secara lalai, jadi pengguna tidak lagi perlu memadam `0` dalam kotak input secara manual.

## Kod lanjutan

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
