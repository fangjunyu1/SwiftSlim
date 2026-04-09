# struct dan class

Pada pelajaran sebelumnya, kita baru mulai mengenal `struct`, mendefinisikan sebuah struktur, dan juga memperluas pembelajaran ke topik seperti protokol, `UUID`, dan poin pengetahuan lainnya.

Sekarang, kita sudah memiliki pemahaman awal tentang kata kunci `struct`, tetapi itu masih belum bisa dianggap sebagai pemahaman yang benar-benar mendalam.

Di pelajaran ini, kita akan terus menjadikan `struct` sebagai inti pembahasan, dan sambil jalan kita juga akan mengenal `class`. Melalui pelajaran ini, kamu akan memahami dengan lebih jelas: apa itu instance, apa itu konstruktor, dan mengapa kita bisa menggunakan `struct` dan `class` untuk mengatur data.

## Sistem Manajemen Siswa

Sebagai contoh, sekarang kita ingin mengembangkan sebuah sistem manajemen siswa. Setiap siswa memiliki informasi seperti nama, jenis kelamin, telepon, usia, alamat rumah, dan sebagainya.

Pada saat ini, kita bisa menggabungkan informasi-informasi tersebut dan mendefinisikannya sebagai sebuah struktur `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Di sini kita menggunakan `struct` untuk mendefinisikan sebuah tipe siswa.

Struktur `Student` ini mencakup beberapa properti:

- `id`: identitas unik siswa
- `name`: nama siswa
- `sex`: jenis kelamin siswa
- `phone`: telepon siswa
- `age`: usia siswa
- `address`: alamat rumah

Dengan cara ini, beberapa data yang awalnya tersebar digabungkan menjadi satu "siswa" yang utuh.

Di sini, `Student` juga mengikuti protokol `Identifiable` dan mendefinisikan field `id`, agar nantinya mudah menampilkan data bersama loop `ForEach`.

Lalu, kita bisa membuat sebuah instance siswa:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Kode ini berarti bahwa berdasarkan struktur `Student`, kita bisa membuat data siswa yang konkret.

Di sini, `Student` adalah tipenya, dan `Student(...)` mewakili sebuah instance yang dibuat.

Di SwiftUI, kita bisa memberikan instance ini ke sebuah variabel, lalu menampilkannya.

Sebagai contoh:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Dengan begitu, kita bisa melihat nama siswa ini di dalam tampilan: `Fang Junyu`.

Di sini, pertama-tama kita membuat sebuah instance `Student`, lalu memberikannya ke variabel `student`, dan terakhir membaca propertinya melalui `student.name`.

## Apa itu instance

Saat kita baru mulai belajar `struct`, kata "instance" mungkin terasa sangat asing.

Namun sebenarnya, sejak awal kita sudah menggunakan instance, hanya saja sebelumnya kita tidak terlalu memperhatikannya.

Sebagai contoh:

```swift
let name = "Fang Junyu"
```

Di sini, `"Fang Junyu"` adalah sebuah nilai string, dan pada dasarnya itu adalah instance dari tipe `String`.

Kita juga bisa menuliskannya seperti ini:

```swift
let name = String("Fang Junyu")
```

Kedua cara penulisan ini menyatakan hal yang sama: membuat sebuah instance bertipe `String` dan memberikannya ke variabel `name`.

Begitu juga dengan `Int`:

```swift
let num = 3
```

Di sini, `3` pada dasarnya adalah sebuah nilai bertipe `Int`, dan juga bisa dipahami sebagai instance `Int`.

Jadi, instance bukanlah konsep khusus yang hanya muncul di dalam `struct`.

Baik `String`, `Int`, `Double`, `Bool`, maupun `Student` yang kita buat sendiri, semuanya bisa membuat instance.

Karena itu, ketika kita menulis:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

secara esensial itu sama dengan membuat instance dari `String` atau `Int`, hanya saja `Student` adalah tipe yang kita definisikan sendiri.

## Konstruktor

Saat kita membuat sebuah instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

sebenarnya kita sedang memanggil metode inisialisasi milik `Student`, yaitu `init`.

Kamu bisa memahami konstruktor sebagai: **pintu masuk yang bertanggung jawab memberi nilai pada properti saat sebuah instance dibuat.**

Artinya, sebelum sebuah instance benar-benar selesai dibuat, biasanya ia harus melewati `init` terlebih dahulu.

Sebagai contoh, saat sebelumnya kita mempelajari siklus hidup view di SwiftUI, kita pernah menulis kode seperti ini:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Di sini, `init()` dijalankan saat instance `ContentView` dibuat, sedangkan `onAppear` baru dijalankan saat view benar-benar ditampilkan di layar. Artinya, pembuatan view dan penampilan view bukanlah momen yang sama.

Demikian juga, ketika kita membuat `Student(...)`, kita juga sedang memanggil konstruktor dari `Student`.

### Konstruktor yang dibuat otomatis oleh sistem

Saat kita mendefinisikan `Student`, kita tidak menulis `init` secara manual:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Namun, kita tetap bisa langsung membuat instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Mengapa instance bisa dibuat tanpa menulis konstruktor?

Karena untuk `struct`, jika kita tidak menulis konstruktor secara manual, sistem biasanya akan otomatis membantu membuatkan konstruktor yang sesuai.

Pada tahap awal belajar, ini bisa dipahami secara sederhana seperti ini: Swift membantu melengkapi kode inisialisasi untuk kita secara otomatis.

Kurang lebih bisa dipahami bahwa sistem membantu melengkapi kode berikut:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Di sini ada satu detail yang perlu diperhatikan:

```swift
let id = UUID()
```

`id` sudah memiliki nilai default, jadi saat membuat instance, kita tidak perlu lagi memasukkan `id` secara manual.

Artinya, properti yang tidak memiliki nilai default biasanya perlu dimasukkan lewat konstruktor; sedangkan properti yang sudah punya nilai default biasanya bisa langsung menggunakan nilai default tersebut.

Karena itu, saat kita membuat instance `Student`, kita hanya perlu memasukkan `name`, `sex`, `phone`, `age`, dan `address`.

### Petunjuk dari compiler

Selain itu, ketika kita mengetik `Student(...)` di Xcode, kita juga bisa melihat petunjuk parameter yang diberikan oleh sistem.

![student](../../Resource/022_student.png)

Ini juga menunjukkan bahwa tipe saat ini memang benar-benar memiliki konstruktor yang dibuat otomatis oleh sistem.

### Menulis konstruktor sendiri

Walaupun sistem bisa membuat konstruktor secara otomatis, kadang-kadang cara inisialisasi default ini tidak sepenuhnya sesuai dengan kebutuhan kita.

Sebagai contoh, kita punya sebuah struktur `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Menurut konstruktor yang dibuat otomatis oleh sistem, saat membuat instance kita harus memasukkan ketiga parameter ini sekaligus:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Tetapi, jika sekarang kita ingin memasukkan sekumpulan film lama dan hanya mengetahui nama filmnya saja, tanpa mengetahui sutradara dan rating-nya, hal itu akan agak merepotkan.

Karena kita hanya bisa menulisnya seperti ini:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Walaupun bisa berjalan, menulis `--` berulang kali setiap saat bukanlah hal yang nyaman.

Pada saat ini, kita bisa menulis sebuah konstruktor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Dengan begitu, saat membuat film lama, kita hanya perlu memasukkan `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Ini adalah salah satu arti dari menulis konstruktor sendiri: **membuat cara pembuatan instance lebih sesuai dengan kebutuhan nyata.**

### Menganalisis konstruktor kustom

Mari kita lihat konstruktor yang tadi kita tulis sendiri:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Makna kode ini adalah, saat membuat instance `Movie`, kita hanya diminta memasukkan satu parameter, yaitu `name`.

Lalu, di dalam konstruktor, `name` yang dimasukkan akan diberikan ke `name` milik instance itu sendiri, dan `director` serta `rating` akan diberi nilai default `--`.

Di sini `self` berarti "instance yang sedang dibahas ini sendiri".

Sebagai contoh:

```swift
self.name = name
```

`self.name` di sebelah kiri menunjukkan properti di dalam instance; sedangkan `name` di sebelah kanan menunjukkan parameter yang kita masukkan.

Ini bisa dipahami secara sederhana sebagai menyimpan nilai dari luar ke properti milik instance itu sendiri.

Saat semua properti sudah mendapat nilai, maka pembuatan instance ini selesai.

### Mekanisme konstruktor

Saat kita mendeklarasikan konstruktor secara eksplisit, ada satu perubahan lain yang juga terjadi:

konstruktor yang sebelumnya dibuat otomatis oleh sistem biasanya tidak bisa lagi dipakai secara langsung.

Sebagai contoh:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Sekarang jika kita menulis lagi seperti ini:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

compiler akan melaporkan error:

```swift
Extra arguments at positions #2, #3 in call
```

Artinya: kamu memasukkan parameter yang berlebihan.

Mengapa error ini muncul?

Karena di dalam struktur `Movie` saat ini, hanya ada satu jenis konstruktor yang kamu deklarasikan secara manual:

```swift
init(name: String)
```

Ia hanya menerima satu parameter `name`, dan tidak menerima `director` maupun `rating`.

Artinya, ketika kamu menambahkan konstruktor sendiri secara manual, cara inisialisasi yang tadinya dibuat otomatis oleh sistem tidak lagi bisa digunakan secara langsung.

Jika kita ingin mendukung baik "hanya memasukkan nama" maupun "memasukkan informasi lengkap", maka kita perlu menambahkan sendiri satu konstruktor lengkap lagi:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Dengan begitu, kita memiliki dua konstruktor yang berbeda.

Saat membuat film lama, kita bisa menulis seperti ini:

```swift
Movie(name: "The Night of the Hunter")
```

Saat membuat film baru dengan informasi lengkap, kita bisa menulis seperti ini:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Cara penulisan ini juga menunjukkan bahwa tipe yang sama bisa memiliki beberapa konstruktor, selama bentuk parameternya berbeda.

## Apa itu overload

Di sini kita tambahkan satu poin pengetahuan penting lagi.

Baru saja kita menulis dua `init` untuk `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Cara penulisan seperti ini, "nama fungsi sama tetapi parameternya berbeda", disebut "overload".

Di sini, kedua fungsi sama-sama bernama `init`, tetapi karena parameter yang diterimanya berbeda, Swift bisa membedakan fungsi mana yang sedang kamu panggil.

Sebagai contoh:

```swift
Movie(name: "Days of Heaven")
```

akan memanggil:

```swift
init(name: String)
```

Sedangkan:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

akan memanggil versi lengkap lainnya dari metode inisialisasi.

Jadi, fungsi dari overload adalah: memungkinkan tipe yang sama menyediakan cara pembuatan yang berbeda sesuai dengan situasi yang berbeda.

## Mengenal class

Selanjutnya, mari kita kenali juga `class` secara singkat.

Selain `struct` yang umum di Swift, banyak bahasa pemrograman menggunakan `class` untuk membuat instance, seperti Java, C#, Kotlin, dan lain-lain.

Di Swift, cara penulisan `class` sangat mirip dengan `struct`.

Sebagai contoh:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Kamu akan melihat bahwa, selain keyword yang berubah dari `struct` menjadi `class`, bagian lainnya hampir terlihat sama.

Cara membuat instance-nya juga sangat mirip:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Jadi, pada tingkat sintaks, `struct` dan `class` memang sangat mirip.

### Perbedaan antara Struct dan Class

Walaupun `struct` dan `class` terlihat sangat mirip, keduanya tidak sepenuhnya sama.

**1. Cara inisialisasinya berbeda**

Untuk `struct`, jika kita tidak menulis konstruktor secara manual, sistem biasanya akan otomatis membuat metode inisialisasi yang sesuai.

Namun untuk `class`, jika ada properti yang belum memiliki nilai default, biasanya kita perlu menulis `init` secara manual, kalau tidak maka akan muncul error.

Sebagai contoh:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

`class` ini akan menimbulkan error karena tidak memiliki konstruktor, sehingga propertinya tidak terinisialisasi.

Compiler akan menampilkan pesan seperti:

```swift
Class 'Movie' has no initializers
```

Jadi, dalam contoh ini, `class` harus memiliki konstruktor yang ditulis manual.

**2. `struct` adalah value type, `class` adalah reference type**

`struct` adalah value type, sedangkan `class` adalah reference type.

Pada tahap awal belajar, kamu tidak perlu menguasai kedua konsep ini sepenuhnya. Cukup memiliki pemahaman sederhana saja.

Sebagai contoh, `struct` lebih mirip dengan "menyalin nilai baru".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Di sini, setelah `user1` diberikan ke `user2`, itu seperti menyalin data baru, sehingga mengubah `user2` tidak memengaruhi `user1`.

Sebaliknya, `class` lebih mirip dengan "sama-sama menunjuk ke instance yang sama".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Di sini, `user1` dan `user2` menunjuk ke instance yang sama.

Sekarang kita belum perlu memahami sepenuhnya mekanisme dasar dari value type dan reference type; cukup tahu bahwa `struct` lebih cocok untuk menyimpan data yang berdiri sendiri, sedangkan `class` lebih cocok ketika banyak tempat perlu berbagi instance yang sama.

## Bagaimana memilih pada tahap awal

Pada tahap saat ini, untuk data model biasa, pertimbangkan `struct` terlebih dahulu; ketika perlu data yang dibagikan dan perubahan yang sinkron, baru pertimbangkan `class`.

Ini bukan aturan mutlak, tetapi bagi pemula, ini adalah cara menilai yang cukup praktis.

Terutama di SwiftUI, kamu akan sering menemukan bahwa `struct` sudah bisa menangani sebagian besar pekerjaan.

Selain itu, di banyak materi pemrograman, sesuatu yang dibuat dengan `class` juga disebut "object". Pada tahap awal, kamu bisa memahaminya dulu sebagai instance, tanpa perlu sengaja membedakannya.

## Ringkasan

Di pelajaran ini, kita mempelajari `struct` lebih dalam, dan sambil jalan juga mengenal `class`; keduanya bisa digunakan untuk mendefinisikan tipe.

Tipe dapat membuat instance. Saat sebuah instance dibuat, konstruktor, yaitu `init`, akan dipanggil.

Untuk `struct`, jika kita tidak menulis konstruktor secara manual, sistem biasanya akan otomatis membuat konstruktor yang sesuai. Jika konstruktor default tidak memenuhi kebutuhan, kita juga bisa menulis konstruktor sendiri.

Selain itu, kita juga mendapatkan pemahaman awal tentang perbedaan antara `struct` dan `class`: `struct` adalah value type, sedangkan `class` adalah reference type. Di SwiftUI, pada tahap awal, yang biasanya lebih sering kamu temui adalah `struct`.

Nanti, ketika kita mempelajari pengiriman nilai antartampilan, data model, dan state management, semua isi ini akan terus digunakan.
