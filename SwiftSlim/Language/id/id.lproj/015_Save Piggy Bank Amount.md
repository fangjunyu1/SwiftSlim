# Menyimpan jumlah celengan

Di pelajaran sebelumnya, kita telah mewujudkan sebuah “celengan” sederhana. Pada pelajaran ini, kita akan mempelajari cara membuat jumlah di “celengan” dapat disimpan secara persisten.

Fokus utama pelajaran ini adalah `UserDefaults` dan property wrapper `@AppStorage`. Pada saat yang sama, kita juga akan memperluas pembahasan ke fungsi `onAppear`, serta cara menggunakan tipe optional (`nil`).

Perlu diperhatikan bahwa pelajaran ini harus melanjutkan kode “celengan” yang dibuat di pelajaran sebelumnya.

## Masalah penyimpanan persisten

Sekarang antarmuka “celengan” terlihat sangat ringkas dan juga mudah digunakan.

![Piggy Bank](../../Resource/014_view.png)

Namun, ada satu masalah yang sangat jelas: setiap kali view di-refresh atau aplikasi ditutup, jumlah total di “celengan” selalu kembali menjadi 0, dan semua jumlah yang sebelumnya sudah disimpan juga ikut hilang.

Ini berarti data tersebut sebenarnya belum benar-benar disimpan. Dengan kata lain, “celengan” saat ini hanya bisa menyimpan data sementara.

### Mengapa tidak bisa disimpan secara persisten?

Ini karena kita menggunakan variabel yang dideklarasikan dengan `@State`:

```swift
@State private var amount = 0
```

Variabel yang dideklarasikan dengan `@State` memiliki siklus hidup yang sepenuhnya bergantung pada view.

Ketika view dibuat, `amount` diinisialisasi menjadi 0; ketika view dihancurkan, `amount` juga ikut dihancurkan.

Data yang disimpan di `amount` hanya berada di dalam memori, dan tidak disimpan ke perangkat.

Kalau kita tidak ingin `amount` terikat pada siklus hidup view, maka kita perlu mewujudkan penyimpanan data secara persisten. Dengan kata lain, kita perlu menyimpan data ke perangkat.

### Apa itu “persistensi data”

Persistensi data bisa dipahami sebagai memindahkan data dari “memori sementara” ke “penyimpanan perangkat”.

Ketika view ditutup atau aplikasi ditutup, data tidak akan hilang.

Dalam pengembangan Swift, persistensi data yang sederhana bisa menggunakan `UserDefaults`, sedangkan untuk data yang lebih kompleks biasanya memakai `SwiftData` atau `CoreData`.

Di pelajaran ini, kita akan mempelajari `UserDefaults` terlebih dahulu sebagai cara yang paling sederhana.

## UserDefaults

`UserDefaults` digunakan untuk menyimpan data ringan berbentuk pasangan key-value, dan biasanya dipakai untuk menyimpan tipe dasar seperti `String`, `Int`, `Double`, `Bool`, dan sebagainya.

### Menyimpan data

`UserDefaults` menggunakan metode `set` untuk menyimpan data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Parameter pertama `UserDefaults` menunjukkan data yang akan disimpan. Di sini kita memasukkan tipe seperti `String`, `Int`, dan sebagainya.

Parameter kedua `forKey` mirip seperti nama variabel, dan digunakan untuk menandai data yang disimpan di `UserDefaults`.

### Membaca data

`UserDefaults` menggunakan metode yang sesuai untuk membaca data:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Saat membaca, kita harus memakai metode yang sesuai dengan tipenya. Jika tidak, bisa muncul kesalahan atau data yang dibaca menjadi tidak tepat.

### Hal-hal yang perlu diperhatikan pada UserDefaults

#### 1. Mengembalikan tipe optional

Saat menggunakan `UserDefaults` untuk membaca data, sebagian metode akan mengembalikan tipe optional (`Optional`).

Misalnya:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Tipe dari `name` yang dikembalikan adalah:

```swift
String?
```

Ini berarti nilainya mungkin ada, dan mungkin juga tidak ada.

**Mengapa mengembalikan tipe optional?**

Ini karena key tertentu di `UserDefaults` belum tentu memiliki data yang sesuai.

Misalnya:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Jika key `"City"` belum pernah disimpan sebelumnya, maka hasil pembacaannya adalah:

```swift
nil
```

Perlu ditekankan bahwa `nil` berarti tidak ada data, bukan string kosong.

Di pelajaran “sistem tipe”, kita pernah menemui situasi serupa: ketika konversi tipe data gagal, hasilnya akan berupa tipe optional.

Pada saat itu, kita perlu menggunakan `??` untuk memberikan nilai default dan melakukan unwrapping:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Jika `UserDefaults` berhasil membaca data, gunakan nilai yang dibaca; jika tidak berhasil (`nil`), gunakan nilai default.

#### 2. Mengembalikan tipe non-optional

Saat `UserDefaults` membaca tipe `Int`, `Double`, atau `Bool`, hasil yang dikembalikan bukan tipe optional.

Misalnya:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Meskipun key-key ini belum pernah disimpan sebelumnya, nilai yang dikembalikan juga tidak akan berupa `nil`.

Melainkan nilai default:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Batas jumlah data

`UserDefaults` hanya cocok untuk menyimpan sedikit data, misalnya konfigurasi aplikasi atau status sederhana.

Dalam praktiknya, `UserDefaults` tidak cocok untuk menyimpan data dalam jumlah besar atau data yang sering dibaca-tulis.

## Menyimpan jumlah “celengan”

Sekarang kita bisa menggunakan `UserDefaults` untuk mewujudkan logika penyimpanan jumlah total “celengan”.

Ketika pengguna menekan tombol, nominal yang dimasukkan akan ditambahkan ke jumlah total, lalu jumlah total tersebut disimpan ke `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Sekarang kita sudah mewujudkan logika penulisan data.

## Penjelasan logika persistensi data

Walaupun logika penulisan persistensi data sudah selesai, dalam penggunaan nyata kita akan mendapati bahwa setiap kali view di-refresh atau aplikasi dibuka kembali, variabel `amount` tetap bernilai 0.

Ini karena:

```swift
@State private var amount = 0
```

Di SwiftUI, variabel `@State` akan diinisialisasi ulang saat view dibuat.

Meskipun nilai `amount` sudah disimpan di `UserDefaults`, ketika view dimuat ulang, `amount` tetap akan direset menjadi 0.

Ini menunjukkan bahwa saat ini kita hanya menyimpan data ke `UserDefaults`, tetapi belum memulihkan data itu kembali ke view.

Karena itu, saat view dimuat, kita juga perlu membaca data secara manual dari `UserDefaults`, lalu memberikan nilainya kembali ke `amount`, agar keseluruhan logika persistensi data benar-benar lengkap.

### Analogi logika

Proses ini bisa dipahami seperti “papan tulis di kelas”:

Saat guru sedang mengajar, isi pelajaran ditulis di papan tulis. Isi di papan ini mirip dengan state (`@State`) di view saat ini.

Ketika pelajaran selesai, papan tulis akan dihapus untuk menyiapkan kelas berikutnya. Ini setara dengan view dihancurkan, dan data dalam `@State` juga ikut hilang.

Agar isi pelajaran tidak hilang, guru akan menyimpannya terlebih dahulu ke dalam bahan ajar. Bahan ajar ini setara dengan data yang disimpan di `UserDefaults`.

Ketika kelas berikutnya dimulai lagi, papan tulis awalnya kosong (`@State` diinisialisasi lagi), lalu guru perlu menulis ulang isi pelajaran lama dari bahan ajar itu ke papan tulis (membaca `UserDefaults`).

Yang perlu dipahami adalah: papan tulis tidak akan otomatis memulihkan isi sebelumnya. Isinya harus ditulis ulang dengan cara “membaca bahan ajar” (membaca `UserDefaults`).

## Menggunakan onAppear untuk membaca data

Saat view ditampilkan, kita perlu membaca nilai dari `UserDefaults` secara manual, lalu memberikan nilainya ke variabel `amount` milik `@State`, agar persistensi data benar-benar terwujud.

Di SwiftUI, kita bisa menggunakan `onAppear` untuk menjalankan logika inisialisasi saat view ditampilkan:

```swift
.onAppear {}
```

Letakkan kode pembacaan `UserDefaults` ke dalam `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Saat view dibuat, `amount` diinisialisasi menjadi 0; lalu saat view ditampilkan, `onAppear` dipicu, membaca data dari `UserDefaults`, dan memberikannya ke `amount`. Dengan begitu, view dapat menampilkan jumlah total terakhir yang pernah disimpan.

Sekarang, seluruh logika persistensi data untuk “celengan” sudah selesai.

## Kode lengkap

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

## Property wrapper @AppStorage

SwiftUI menyediakan property wrapper `@AppStorage`, yang dapat menyederhanakan logika penyimpanan `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` adalah pembungkus untuk `UserDefaults`, dan `"amount"` sesuai dengan key di `UserDefaults`.

Saat view dibuat, nilainya akan dibaca dari `UserDefaults`; ketika variabel berubah, nilainya akan otomatis ditulis kembali ke `UserDefaults`.

Ia juga mendukung mekanisme pembaruan state di SwiftUI, sehingga sama seperti `@State`, perubahan nilainya akan menyegarkan view SwiftUI.

Dengan kata lain, `@AppStorage` dapat mewujudkan logika pembacaan dan penyimpanan data, sehingga kita tidak perlu lagi memanggil `UserDefaults` secara manual, dan juga tidak perlu memakai `onAppear` untuk membaca data secara manual.

Karena itu, kita bisa mengganti `UserDefaults` di dalam kode dengan `@AppStorage`:

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

Pelajaran ini terutama mempelajari poin-poin berikut:

Pertama, `UserDefaults` digunakan untuk menyimpan data ringan. Kita menggunakan `UserDefaults` untuk menyimpan jumlah total ke perangkat. `UserDefaults` menyediakan metode baca dan tulis, dan dalam penggunaannya kita juga perlu menangani tipe optional dan situasi terkait lainnya.

Kedua, variabel `@State` hanya digunakan untuk mengelola state sementara di dalam view, dan siklus hidupnya sama dengan view. Saat view dibuat ulang, `@State` juga akan diinisialisasi ulang.

Saat memulihkan data dari `UserDefaults`, kita mempelajari cara menggunakan `onAppear` untuk membaca `UserDefaults` saat view ditampilkan, lalu menyelesaikan pemulihan data.

Terakhir, kita menggunakan `@AppStorage` untuk menggantikan `UserDefaults`, sehingga saat view dimuat data akan otomatis dibaca, dan saat data berubah akan otomatis ditulis, menggantikan logika manual menggunakan `UserDefaults` dan `onAppear`.

Melalui pengetahuan ini, kita dapat mewujudkan fitur penyimpanan data dasar di aplikasi, sehingga data bisa disimpan secara persisten.

## Latihan setelah pelajaran

Sekarang “celengan” sudah mendukung penyimpanan nominal, tetapi fungsinya masih belum lengkap.

1. Jika pengguna ingin mengambil uang, perlu dirancang logika pengambilan yang sesuai.
2. Jika pengguna ingin mengosongkan nominal sepenuhnya, perlu juga logika reset.
3. Jika ingin menambahkan nama pada celengan, kita juga perlu memperkenalkan penyimpanan data bertipe `String`.

Kamu bisa menyempurnakan fungsi-fungsi ini di atas dasar yang sudah ada, agar “celengan” menjadi lebih lengkap.

## Pengetahuan tambahan - Masalah nilai default pada kotak input

Sekarang kita juga bisa mengoptimalkan interaksi pada kotak input, agar proses memasukkan nominal menjadi lebih nyaman.

![textfield](../../Resource/015_view.png)

Dalam implementasi saat ini, nilai default kotak input adalah 0. Setiap kali pengguna ingin memasukkan nominal, mereka harus terlebih dahulu menghapus angka 0, lalu baru memasukkan angka baru. Pengalaman interaksi seperti ini tidak terlalu masuk akal.

Kita seharusnya membuat nilai awal kotak input kosong, bukan 0.

Ini karena `TextField` dan `number` terikat dua arah:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Ketika `number` diinisialisasi menjadi 0, kotak input juga akan menampilkan 0.

Karena itu, kita perlu mengubah `number` menjadi nilai kosong, yaitu `nil`.

```swift
@State private var number = nil
```

Pada saat ini akan muncul error:

```
Generic parameter 'Value' could not be inferred
```

Inilah situasi yang kita bahas di pelajaran “sistem tipe”: ketika compiler tidak bisa menyimpulkan tipe variabel secara otomatis, kita perlu mendeklarasikan tipenya secara eksplisit.

Karena kita mengatur `number` menjadi `nil`, sementara `nil` sendiri tidak membawa informasi tipe apa pun, compiler tidak bisa menentukan apakah variabel tersebut adalah `String`, `Int`, atau tipe lainnya. Karena itu muncullah error.

Maka dari itu, kita perlu mendeklarasikan tipe `number` secara eksplisit:

```swift
@State private var number:Int? = nil
```

Di sini `Int?` berarti tipe optional (`Optional`), yang berarti nilai `number` bisa berupa `Int`, dan juga bisa berupa `nil`.

Dengan begitu, saat diinisialisasi dengan `nil`, kotak input akan tampil kosong, bukan 0.

### Unwrapping tipe optional

Setelah kita mengubah `number` menjadi tipe optional, kode perhitungan yang lama akan menghasilkan error:

```swift
amount += number
```

Pesan yang ditampilkan:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Ini karena sekarang `number` mungkin saja bernilai `nil`. Jika langsung ikut dalam perhitungan, maka situasinya menjadi seperti:

```swift
amount += nil
```

Jelas bahwa `nil` tidak bisa dijumlahkan dengan `amount`. Ini adalah operasi yang tidak sah.

Karena itu, ketika tipe optional ikut terlibat dalam perhitungan, kita harus melakukan unwrapping terlebih dahulu.

Di sini kita bisa menggunakan `??` untuk memberikan nilai default:

```swift
amount += number ?? 0
```

Ketika `number` bernilai `nil`, gunakan nilai default 0; ketika `number` punya nilai, gunakan data input yang sebenarnya.

Dengan demikian, perhitungan tetap benar, sekaligus mewujudkan efek bahwa kotak input secara default tampil kosong, dan pengguna tidak perlu lagi menghapus angka 0 secara manual.

## Kode tambahan

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
