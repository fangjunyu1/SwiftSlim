# struct dan class

Dalam pelajaran sebelum ini, kita baru mula berkenalan dengan `struct`, mentakrifkan satu struktur, dan pada masa yang sama memperluas pembelajaran kepada topik seperti protokol, `UUID`, dan beberapa pengetahuan lain.

Sekarang, kita sudah mempunyai pemahaman awal tentang kata kunci `struct`, tetapi itu masih belum boleh dianggap sebagai benar-benar faham.

Dalam pelajaran ini, kita akan terus menjadikan `struct` sebagai kandungan utama, dan pada masa yang sama kita juga akan mengenali `class`. Melalui pelajaran ini, kamu akan lebih jelas memahami: apakah itu instance, apakah itu constructor, dan mengapa kita boleh menggunakan `struct` dan `class` untuk menyusun data.

## Sistem Pengurusan Pelajar

Sebagai contoh, sekarang kita ingin membangunkan satu sistem pengurusan pelajar. Setiap pelajar mempunyai maklumat seperti nama, jantina, telefon, umur, alamat rumah dan sebagainya.

Pada masa ini, kita boleh menggabungkan maklumat-maklumat ini bersama-sama dan mentakrifkannya sebagai satu struktur `Student`:

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

Di sini kita menggunakan `struct` untuk mentakrifkan satu type pelajar.

Struktur `Student` ini mengandungi beberapa property:

- `id`: pengecam unik pelajar
- `name`: nama pelajar
- `sex`: jantina pelajar
- `phone`: telefon pelajar
- `age`: umur pelajar
- `address`: alamat rumah

Dengan cara ini, beberapa data yang asalnya berasingan digabungkan menjadi seorang "pelajar" yang lengkap.

Di sini, `Student` juga mematuhi protokol `Identifiable` dan mentakrifkan field `id`, supaya pada masa akan datang lebih mudah untuk memaparkan data bersama loop `ForEach`.

Kemudian, kita boleh mencipta satu instance pelajar:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Kod ini bermaksud bahawa berdasarkan struktur `Student`, kita boleh mencipta data pelajar yang khusus.

Di sini, `Student` ialah type, dan `Student(...)` mewakili satu instance yang telah dicipta.

Dalam SwiftUI, kita boleh memberikan instance ini kepada satu variable, kemudian memaparkannya.

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

Dengan cara ini, kita boleh melihat nama pelajar ini dalam view: `Fang Junyu`.

Di sini, mula-mula kita mencipta satu instance `Student`, kemudian memberikannya kepada variable `student`, dan akhirnya membaca property-nya melalui `student.name`.

## Apakah itu instance

Apabila kita baru mula mempelajari `struct`, perkataan "instance" mungkin terasa sangat asing.

Namun sebenarnya, kita telah menggunakan instance sejak dari awal lagi, cuma sebelum ini kita tidak memberi perhatian khusus kepadanya.

Sebagai contoh:

```swift
let name = "Fang Junyu"
```

Di sini, `"Fang Junyu"` ialah satu nilai string, dan pada asasnya ia ialah satu instance bagi type `String`.

Kita juga boleh menulisnya seperti ini:

```swift
let name = String("Fang Junyu")
```

Dua cara penulisan ini membawa maksud yang sama: mencipta satu instance daripada type `String` dan memberikannya kepada variable `name`.

Begitu juga dengan `Int`:

```swift
let num = 3
```

Di sini, `3` pada asasnya ialah satu nilai bagi type `Int`, dan ia juga boleh difahami sebagai satu instance `Int`.

Jadi, instance bukanlah satu konsep khas yang hanya muncul dalam `struct`.

Sama ada `String`, `Int`, `Double`, `Bool`, atau `Student` yang kita cipta sendiri, semuanya boleh mencipta instance.

Oleh itu, apabila kita menulis:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ia pada asasnya sama seperti mencipta instance `String` atau `Int`, cuma bezanya `Student` ialah type yang kita takrifkan sendiri.

## Constructor

Apabila kita mencipta satu instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

sebenarnya kita sedang memanggil kaedah inisialisasi milik `Student`, iaitu `init`.

Kamu boleh memahami constructor seperti ini: **ia ialah pintu masuk yang bertanggungjawab memberikan nilai kepada property semasa instance dicipta.**

Maksudnya, sebelum satu instance benar-benar siap dicipta, biasanya ia perlu melalui `init` terlebih dahulu.

Sebagai contoh, ketika sebelum ini kita mempelajari lifecycle view SwiftUI, kita pernah menulis kod seperti ini:

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

Di sini, `init()` dijalankan apabila instance `ContentView` dicipta, manakala `onAppear` hanya dijalankan apabila view benar-benar dipaparkan pada skrin. Ini bermaksud penciptaan view dan paparan view bukanlah masa yang sama.

Begitu juga, apabila kita mencipta `Student(...)`, kita juga sedang memanggil constructor milik `Student`.

### Constructor yang dijana secara automatik oleh sistem

Semasa kita mentakrifkan `Student`, kita tidak menulis `init` secara manual:

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

Namun begitu, kita masih boleh terus mencipta instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Mengapa kita boleh mencipta instance walaupun tidak menulis constructor?

Kerana bagi `struct`, jika kita tidak menulis constructor secara manual, sistem biasanya akan secara automatik menjana constructor yang sesuai untuk kita.

Pada peringkat awal pembelajaran, ini boleh difahami secara mudah begini: Swift secara automatik melengkapkan kod inisialisasi untuk kita.

Secara kasar, ia boleh difahami seperti sistem melengkapkan kod berikut untuk kita:

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

Di sini, ada satu perincian yang perlu diperhatikan:

```swift
let id = UUID()
```

`id` sudah mempunyai nilai default, jadi semasa mencipta instance, kita tidak perlu lagi memasukkan `id` secara manual.

Ini bermakna property yang tidak mempunyai nilai default biasanya perlu dimasukkan melalui constructor; manakala property yang sudah mempunyai nilai default biasanya boleh terus menggunakan nilai default asal itu.

Oleh itu, semasa mencipta instance `Student`, kita hanya perlu memasukkan `name`, `sex`, `phone`, `age`, dan `address`.

### Petunjuk compiler

Selain itu, apabila kita menaip `Student(...)` dalam Xcode, kita juga boleh melihat petunjuk parameter yang diberikan oleh sistem.

![student](../../Resource/022_student.png)

Ini juga sebenarnya menunjukkan bahawa type semasa ini memang mempunyai constructor yang dijana secara automatik oleh sistem.

### Menulis constructor sendiri

Walaupun sistem boleh menjana constructor secara automatik, kadang-kadang cara inisialisasi default ini tidak sepenuhnya sesuai dengan keperluan kita.

Sebagai contoh, kita mempunyai satu struktur `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Mengikut constructor yang dijana secara automatik oleh sistem, semasa mencipta instance kita mesti memasukkan ketiga-tiga parameter ini sekali gus:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Tetapi jika sekarang kita ingin memasukkan sekumpulan filem lama, dan kita hanya tahu nama filemnya tetapi tidak tahu pengarah dan rating, hal ini menjadi agak menyusahkan.

Kerana ketika itu kita hanya boleh menulis seperti ini:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Walaupun ini boleh berfungsi, menulis `--` berulang kali setiap kali bukanlah sesuatu yang mudah.

Pada waktu ini, kita boleh menulis satu constructor:

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

Dengan cara ini, semasa mencipta filem lama, kita hanya perlu memasukkan `name` sahaja:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Inilah salah satu makna menulis constructor sendiri: **menjadikan cara mencipta instance lebih sesuai dengan keperluan sebenar.**

### Menganalisis constructor tersuai

Mari kita lihat constructor yang baru kita tulis ini:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Maksud kod ini ialah, semasa mencipta instance `Movie`, kita hanya perlu memasukkan satu parameter, iaitu `name`.

Kemudian, di dalam constructor, `name` yang dimasukkan akan diberikan kepada `name` milik instance itu sendiri, dan `director` serta `rating` akan diberi nilai default `--`.

Di sini `self` bermaksud "instance semasa ini sendiri".

Sebagai contoh:

```swift
self.name = name
```

`self.name` di sebelah kiri menunjukkan property di dalam instance; manakala `name` di sebelah kanan menunjukkan parameter yang kita masukkan.

Ini boleh difahami secara ringkas sebagai menyimpan nilai dari luar ke dalam property milik instance itu sendiri.

Apabila semua property sudah diberi nilai, penciptaan instance ini selesai.

### Mekanisme constructor

Apabila kita mengisytiharkan constructor secara jelas, satu lagi perubahan juga akan berlaku:

constructor yang asalnya dijana secara automatik oleh sistem biasanya tidak lagi boleh digunakan secara langsung.

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

compiler akan memberikan error:

```swift
Extra arguments at positions #2, #3 in call
```

Ini bermaksud: kamu telah memasukkan parameter yang berlebihan.

Mengapa error ini muncul?

Kerana dalam struktur `Movie` semasa ini, hanya ada satu constructor yang kamu isytiharkan secara manual:

```swift
init(name: String)
```

Ia hanya menerima satu parameter `name`, dan tidak menerima `director` serta `rating`.

Ini bermakna, apabila kamu menambah constructor sendiri secara manual, cara inisialisasi yang asalnya dijana secara automatik tidak lagi boleh digunakan secara langsung.

Jika kita ingin menyokong kedua-dua cara, iaitu "hanya memasukkan nama" dan "memasukkan maklumat lengkap", maka kita perlu menambah sendiri satu constructor lengkap lagi:

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

Dengan cara ini, kita mempunyai dua constructor yang berbeza.

Semasa mencipta filem lama, kita boleh menulis seperti ini:

```swift
Movie(name: "The Night of the Hunter")
```

Semasa mencipta filem baharu dengan maklumat lengkap, kita boleh menulis seperti ini:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Cara penulisan ini juga menunjukkan bahawa type yang sama boleh mempunyai beberapa constructor, selagi bentuk parameternya berbeza.

## Apakah itu overload

Di sini, kita tambah satu lagi pengetahuan yang perlu.

Baru sebentar tadi, kita menulis dua `init` untuk `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Cara penulisan seperti ini, iaitu "nama fungsi yang sama tetapi parameter yang berbeza", dipanggil "overload".

Di sini, kedua-dua fungsi bernama `init`, tetapi kerana parameter yang diterima berbeza, Swift boleh membezakan fungsi mana yang sedang kamu panggil.

Sebagai contoh:

```swift
Movie(name: "Days of Heaven")
```

akan memanggil:

```swift
init(name: String)
```

Manakala:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

akan memanggil versi penuh lain bagi kaedah inisialisasi.

Jadi, fungsi overload ialah: membolehkan type yang sama menyediakan cara penciptaan yang berbeza mengikut situasi yang berbeza.

## Mengenali class

Seterusnya, mari kita kenali juga `class` secara ringkas.

Selain `struct` yang biasa dalam Swift, banyak bahasa pengaturcaraan menggunakan `class` untuk mencipta instance, seperti Java, C#, Kotlin dan lain-lain.

Dalam Swift, cara penulisan `class` sangat hampir dengan `struct`.

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

Kamu akan mendapati bahawa, selain keyword bertukar daripada `struct` kepada `class`, bahagian-bahagian lain kelihatan hampir sama.

Cara untuk mencipta instance juga sangat serupa:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Jadi, pada peringkat sintaks, `struct` dan `class` memang sangat mirip.

### Perbezaan antara Struct dan Class

Walaupun `struct` dan `class` kelihatan sangat serupa, keduanya tidak sepenuhnya sama.

**1. Cara inisialisasinya berbeza**

Bagi `struct`, jika kita tidak menulis constructor secara manual, sistem biasanya akan menjana kaedah inisialisasi yang sesuai secara automatik.

Tetapi bagi `class`, jika ada property yang belum mempunyai nilai default, biasanya kita perlu menulis `init` secara manual, jika tidak maka error akan berlaku.

Sebagai contoh:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

`class` ini akan menyebabkan error kerana tidak mempunyai constructor, jadi property-nya tidak diinisialisasikan.

Compiler akan memaparkan sesuatu seperti:

```swift
Class 'Movie' has no initializers
```

Oleh itu, dalam contoh ini, `class` mesti mempunyai constructor yang ditulis secara manual.

**2. `struct` ialah value type, `class` ialah reference type**

`struct` ialah value type, manakala `class` ialah reference type.

Pada peringkat awal belajar, kamu tidak perlu menguasai sepenuhnya kedua-dua konsep ini; memadai sekadar mempunyai pemahaman mudah.

Sebagai contoh, `struct` lebih dekat dengan idea "menyalin nilai baharu".

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

Di sini, selepas `user1` diberikan kepada `user2`, ia seolah-olah satu salinan data baharu telah dibuat, jadi mengubah `user2` tidak memengaruhi `user1`.

Sebaliknya, `class` lebih dekat dengan idea "sama-sama menunjuk kepada instance yang sama".

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

Di sini, `user1` dan `user2` menunjuk kepada instance yang sama.

Buat masa ini, kita belum perlu memahami sepenuhnya mekanisme dalaman value type dan reference type; cukup sekadar tahu bahawa `struct` lebih sesuai untuk menyimpan data yang berdiri sendiri, manakala `class` lebih sesuai apabila banyak tempat perlu berkongsi instance yang sama.

## Bagaimana memilih pada peringkat awal

Pada peringkat sekarang, untuk data model biasa, pertimbangkan `struct` terlebih dahulu; dan apabila data perlu dikongsi serta perubahan perlu diselaraskan, barulah pertimbangkan `class`.

Ini bukan peraturan mutlak, tetapi bagi pemula, ia merupakan cara penilaian yang cukup praktikal.

Terutama dalam SwiftUI, kamu akan sering mendapati bahawa `struct` sahaja sudah boleh menyelesaikan kebanyakan kerja.

Selain itu, dalam banyak bahan pengaturcaraan, sesuatu yang dicipta oleh `class` juga dipanggil "object". Pada peringkat awal, kamu boleh memahaminya dahulu sebagai instance, tanpa perlu sengaja membezakannya.

## Ringkasan

Dalam pelajaran ini, kita mempelajari `struct` dengan lebih mendalam, dan pada masa yang sama juga mengenali `class`; kedua-duanya boleh digunakan untuk mentakrifkan type.

Type boleh mencipta instance. Semasa satu instance dicipta, constructor, iaitu `init`, akan dipanggil.

Bagi `struct`, jika kita tidak menulis constructor secara manual, sistem biasanya akan secara automatik menjana constructor yang sesuai. Jika constructor default tidak memenuhi keperluan, kita juga boleh menulis constructor sendiri.

Selain itu, kita juga mendapat pemahaman awal tentang perbezaan antara `struct` dan `class`: `struct` ialah value type, manakala `class` ialah reference type. Dalam SwiftUI, pada peringkat awal, yang biasanya lebih kerap ditemui ialah `struct`.

Kemudian, apabila kita mempelajari penghantaran nilai antara views, data model dan state management, semua kandungan ini akan terus digunakan.
