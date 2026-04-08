# Daftar Film

Dalam pelajaran ini, kita akan membuat sebuah daftar film.

![movie](../../Resource/021_movie.png)

Di dalam daftar, akan ditampilkan poster, nama, sutradara, dan rating dari setiap film.

Dalam contoh ini, kita akan mempelajari satu poin pengetahuan yang sangat penting: struktur `struct`. Struktur ini dapat membantu kita menggabungkan beberapa informasi tentang satu film menjadi satu kesatuan. Selain itu, kita juga akan mengenal `UUID()`, `ForEach`, garis pemisah `Divider`, serta cara menggunakan objek kustom untuk mengelola data.

Pengetahuan ini sangat umum dalam pengembangan SwiftUI berikutnya. Setelah menyelesaikan pelajaran ini, kamu bukan hanya bisa membuat daftar film, tetapi juga mulai memahami "bagaimana menampilkan sekumpulan data sebagai antarmuka."

## Satu Film

Kita bisa mulai terlebih dahulu dari antarmuka untuk satu film.

![movie](../../Resource/021_movie1.png)

Tata letak antarmuka ini terutama terdiri dari dua bagian: di sebelah kiri adalah poster film, dan di sebelah kanan adalah pengenalan film.

### Poster Film

Di sisi kiri ditampilkan poster film, dan kita bisa menggunakan `Image` untuk menampilkan gambar.

Misalnya:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Kode ini berarti menampilkan sebuah gambar bernama `"The Shawshank Redemption"`.

Yang perlu diperhatikan di sini adalah bahwa nama gambar harus benar-benar ada di folder resource `Assets`, jika tidak antarmuka tidak akan bisa menampilkan gambar ini dengan benar.

![movie](../../Resource/021_movie2.png)

Fungsi dari modifier-modifier ini masing-masing adalah:

- `resizable()` berarti ukuran gambar bisa diubah.
- `scaledToFit()` berarti proporsi asli dipertahankan saat diskalakan, agar gambar tidak tertarik dan berubah bentuk.
- `frame(height: 180)` berarti tinggi gambar diatur menjadi 180.
- `cornerRadius(10)` berarti memberi gambar sudut membulat dengan radius 10.

Dengan cara ini, kita bisa mendapatkan gambar poster film dengan ukuran yang sesuai dan sudut membulat.

![movie](../../Resource/021_movie3.png)

### Pengenalan Film

Di sisi kanan ditampilkan pengenalan film, termasuk nama film, sutradara, dan rating.

![movie](../../Resource/021_movie4.png)

Kita bisa menggunakan `Text` untuk menampilkan bagian ini:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Di dalam kode ini, `.font` menunjukkan ukuran font, sedangkan `.fontWeight` menunjukkan ketebalan font.

Agar jarak antara "nama film", "informasi sutradara", dan "informasi rating" lebih jelas, di sini kita menggunakan `VStack` pada lapisan paling luar, lalu mengatur:

```swift
spacing: 10
```

Ini berarti jarak antara setiap kelompok konten di dalam `VStack` ini adalah 10.

Alasan mengapa bagian sutradara dan rating masing-masing dibungkus lagi dengan `VStack` adalah karena keduanya termasuk dalam struktur "judul + konten". Oleh karena itu, lapisan antarmuka akan menjadi lebih jelas, dan kita juga akan lebih mudah melanjutkan penyesuaian gaya di tahap berikutnya.

Selain itu, `VStack` secara default rata tengah. Agar keseluruhan teks rata kiri, kita mengatur:

```swift
alignment: .leading
```

Dengan begitu, bagian pengenalan film terlihat lebih rapi.

### Garis Pemisah

Sekarang, meskipun isi di dalam pengenalan film sudah diberi jarak melalui `spacing`, batas antara isi yang berbeda masih belum cukup jelas.

Pada saat ini, kita bisa menambahkan garis pemisah:

```swift
Divider()
```

Misalnya:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Dengan cara ini, bagian pengenalan film akan memiliki efek pemisahan yang lebih jelas.

![movie](../../Resource/021_movie4.png)

`Divider` adalah view yang sangat sederhana tetapi sangat sering digunakan, yang fungsinya adalah memisahkan konten yang berbeda.

Di dalam `VStack`, `Divider()` ditampilkan sebagai garis horizontal.

Di dalam `HStack`, `Divider()` ditampilkan sebagai garis vertikal.

Selain itu, gaya `Divider` juga bisa diubah melalui `.frame`, `.background`, `.padding`, dan cara lainnya.

Misalnya:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Ini akan menghasilkan garis pemisah berwarna biru, dengan ketebalan 2, dan padding horizontal di kiri dan kanan.

![divider](../../Resource/021_divider.png)

### Antarmuka Lengkap

Terakhir, kita bisa menggunakan `HStack` untuk menyusun poster film dan pengenalan film secara berdampingan.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Di sini, `HStack(spacing: 20)` berarti menjaga jarak 20 di antara bagian kiri dan kanan.

Yang perlu diperhatikan adalah bahwa `Divider()`, sama seperti `TextField` dan `Slider` yang telah dibahas sebelumnya, secara default akan berusaha mengambil ruang yang tersedia sebanyak mungkin.

Karena itu, kita menetapkan lebar tetap untuk `VStack` luar pada bagian pengenalan di sebelah kanan:

```swift
.frame(width: 200)
```

Dengan begitu, lebar garis pemisah dan area teks dapat tetap sama, sehingga keseluruhan tampilan terlihat lebih rapi.

Sampai di sini, kita telah menyelesaikan antarmuka tampilan untuk "satu film."

![movie](../../Resource/021_movie1.png)

## Menyimpan Film dalam Array

Jika kita ingin menampilkan beberapa film satu per satu dengan gaya yang sama, itu berarti kita harus menulis kode serupa untuk setiap film.

Misalnya:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Meskipun kode yang ditulis dengan cara ini bisa menghasilkan efek yang diinginkan, kodenya akan semakin banyak, dan perawatannya akan sangat merepotkan.

Misalnya, jika kita perlu mengubah jarak semua film dari `20` menjadi `15`, atau mengubah lebar bagian kanan dari `200` menjadi
`220`, maka setiap blok kode yang berulang harus diubah secara manual.

Jelas ini bukan cara yang efisien.

Sebelumnya kita telah mempelajari array, dan kita juga telah mempelajari cara menggunakan `ForEach` untuk menampilkan view secara berulang berdasarkan array.

Misalnya:

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

Cara ini sangat cocok untuk menangani situasi yang "hanya memiliki satu data", misalnya sekelompok nama gambar.

Namun, satu film tidak hanya memiliki satu nilai. Setidaknya ia mencakup:

1. poster film
2. nama film
3. sutradara
4. rating

Artinya, satu film sebenarnya adalah sekumpulan data yang saling terkait, bukan hanya sebuah string tunggal.

Jika kita hanya menggunakan array, kita hanya bisa menyimpan informasi ini secara terpisah:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Saat menampilkannya, kita harus mengandalkan indeks yang sama untuk mencocokkan satu per satu:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Masalah dari cara penulisan ini adalah biaya perawatannya sangat tinggi.

Karena data satu film tersebar ke beberapa array, selama ada satu array yang memiliki satu item lebih banyak, satu item lebih sedikit, atau urutannya berbeda, hasil tampilannya akan salah.

Terutama saat menambah atau menghapus film, kamu harus mengubah beberapa array sekaligus, dan sangat mudah untuk melewatkan sesuatu.

Jadi, bagaimana kita bisa menggabungkan informasi seperti "nama film, sutradara, dan rating" menjadi satu kesatuan?

Untuk itu, kita perlu menggunakan `struct`.

## Mendefinisikan Struktur struct

Dalam Swift, `struct` berarti "struktur."

Kamu bisa memahaminya sebagai "tipe data kustom" yang bisa menggabungkan beberapa field yang saling berhubungan menjadi satu kesatuan.

Penggunaan dasar:

```swift
struct StructName {
	let name: String
}
```

Dalam kode ini, `struct` adalah kata kunci yang menunjukkan bahwa kita sedang mendefinisikan sebuah struktur. `StructName` adalah nama dari struktur tersebut.

Isi di dalam kurung kurawal adalah field-field yang dimiliki struktur ini, dan setiap field harus ditulis dengan jelas nama dan tipenya.

Biasanya, nama `struct` diawali dengan huruf besar, misalnya `Movie`, `Student`, atau `UserInfo`. Ini adalah kebiasaan penamaan yang umum di Swift.

Kamu bisa memahami `struct` secara sederhana sebagai sebuah kotak kosong, di mana setiap field seperti satu posisi kosong yang telah disediakan di dalam kotak.

Ketika posisi-posisi ini belum diisi, ia hanyalah kotak kosong. Hanya setelah semua field diisi dengan nilai yang sesuai, barulah ia menjadi kotak hadiah yang lengkap.

### Instance struct

Sebelumnya kita hanya mendefinisikan struktur itu sendiri, yang setara dengan menyiapkan bentuk sebuah kotak.

Kita masih perlu mengisi konten yang konkret ke dalamnya agar mendapatkan sebuah "instance" nyata yang bisa digunakan.

Saat membuat instance, biasanya kita menambahkan `()` setelah nama struktur:

```swift
StructName(...)
```

Apa yang diisi di dalam tanda kurung adalah isi field yang diperlukan struktur tersebut.

Misalnya:

```swift
StructName(name: "Fang Junyu")
```

Kode ini berarti: membuat instance baru sesuai format struktur `StructName`, lalu memberi nilai `"Fang Junyu"` pada field `name`.

Ketika kita telah mengisi semua isi field yang diperlukan, itu sama saja seperti mengisi penuh kotak tersebut.

Pada saat itu, kita mendapatkan instance struktur yang lengkap.

### Mengakses Properti struct

Setelah kita membuat instance, kita bisa menggunakan "dot syntax" untuk mengakses properti di dalamnya.

Penulisan dasar:

```swift
instance.propertyName
```

Misalnya:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Di sini, `st` adalah instance struktur, dan `st.name` berarti membaca nilai `name` dari instance tersebut.

Kamu bisa memahami cara membaca ini seperti ini: ketika kita menulis `st.name`, itu seperti membaca isi yang disimpan pada posisi tertentu di dalam kotak tersebut.

Cara penulisan ini akan sangat umum di antarmuka SwiftUI berikutnya.

Misalnya, jika kita memiliki struktur siswa yang berisi nama, usia, dan kelas, maka saat menampilkannya di antarmuka kita bisa membaca secara terpisah:

```swift
student.name
student.age
student.className
```

Keuntungan dari cara ini adalah data menjadi lebih jelas dan juga lebih mudah dikelola.

### Posisi struct

Bagi pemula, biasanya struktur bisa ditulis di luar `ContentView`.

Misalnya:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Dengan cara ini, strukturnya menjadi lebih jelas dan juga lebih mudah dibaca.

Kamu akan menemukan bahwa `ContentView` itu sendiri sebenarnya juga merupakan sebuah `struct`.

### Struktur Movie

Dengan dasar sebelumnya, sekarang kita bisa mendefinisikan struktur film:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ini adalah sebuah struktur bernama `Movie`, yang terdiri dari tiga field yaitu `name`, `director`, dan `rating`, yang masing-masing mewakili nama film, sutradara, dan rating.

Dengan begitu, informasi yang berkaitan dengan satu film tidak lagi perlu dipisah ke dalam beberapa array, melainkan bisa langsung digabungkan menjadi satu kesatuan.

Misalnya, kita bisa membuat instance film seperti ini:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Instance ini mewakili "satu set data film yang lengkap."

### Menyimpan Struktur dalam Array

Sebelumnya kita sudah mengatakan bahwa array hanya bisa menyimpan satu jenis tipe.

Sekarang kita sudah punya struktur `Movie`, jadi array bisa menyimpan banyak `Movie`.

```swift
let lists: [Movie] = []
```

Misalnya:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Di dalam array `lists` ini, yang disimpan bukan string, melainkan banyak instance `Movie`.

Artinya, setiap elemen di dalam array adalah satu film yang lengkap.

Dengan begitu, ketika kita perlu menampilkan daftar film, kita bisa menggunakan `ForEach` untuk membaca setiap film satu per satu.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Di sini, `movie in` berarti pada setiap pengulangan, satu film akan diambil dari array dan sementara diberi nama `movie`.

Lalu, kita bisa menggunakan:

```swift
movie.name
movie.director
movie.rating
```

untuk membaca nama, sutradara, dan rating dari film tersebut masing-masing, lalu menampilkannya di antarmuka.

## Error ForEach

Sampai di sini, kita sudah menyelesaikan penulisan dasar untuk array film dan `ForEach`.

Namun, jika kamu langsung menjalankan kode berikut:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

akan muncul error:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Arti dari error ini adalah bahwa ketika kamu menulis `id: \.self`, SwiftUI perlu menganggap setiap elemen dalam array itu sendiri sebagai "identitas unik" untuk membedakannya.

Cara penulisan ini cocok untuk tipe sederhana seperti `String` dan `Int`, karena tipe-tipe itu sendiri relatif mudah dibedakan.

Tetapi `Movie` adalah struktur kustom yang kita definisikan sendiri, dan `ForEach` tidak tahu bagaimana menjadikan struktur itu sendiri sebagai identitas unik, sehingga muncullah error.

Cara yang paling umum untuk menyelesaikan masalah ini adalah membuat `Movie` mengikuti protokol `Identifiable`.

## Protokol

Dalam Swift, protokol bisa dipahami sebagai semacam "aturan" atau "persyaratan."

Kamu bisa memahaminya seperti perjanjian di organisasi internasional: jika suatu negara ingin bergabung dengan organisasi internasional tertentu, biasanya ia harus lebih dulu memenuhi beberapa aturan yang diajukan organisasi tersebut, membuka beberapa data, dan mematuhi beberapa aturan bersama. Hanya setelah syarat-syarat itu terpenuhi, negara tersebut dapat bergabung atau ikut berpartisipasi dalam urusan tertentu.

Protokol juga bekerja dengan logika yang serupa.

Ketika suatu tipe ingin mengikuti protokol tertentu, ia harus memenuhi isi yang disyaratkan oleh protokol tersebut. Hanya setelah persyaratan itu terpenuhi, tipe itu dapat menggunakan fungsi yang sesuai.

Penulisan dasar:

```swift
struct Movie: Identifiable {
    // ...
}
```

Di sini, `: Identifiable` berarti `Movie` mengikuti protokol `Identifiable`.

Jika suatu tipe mengikuti beberapa protokol, maka bisa dipisahkan dengan koma:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Untuk `Identifiable`, persyaratan terpentingnya adalah bahwa tipe tersebut harus memiliki `id` yang bisa digunakan untuk mengidentifikasi dirinya.

Misalnya:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Di sini, `id` itu seperti nomor identitas, dan digunakan untuk membedakan setiap film.

Selama `id` setiap film berbeda, SwiftUI dapat membedakan setiap elemen dalam array dengan benar.

Misalnya:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Lalu, kita gunakan dalam `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Dengan begitu, error tidak akan muncul.

Karena `Movie` sudah mengikuti `Identifiable`, cara penulisan yang lebih umum adalah langsung menghilangkan `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Karena SwiftUI sudah tahu bahwa ia harus menggunakan `movie.id` untuk membedakan setiap item.

## Identitas Pembeda di ForEach

Selanjutnya, kita akan memahami lebih dalam peran `id` di dalam `ForEach`.

Misalnya:

```swift
ForEach(lists, id: \.self)
```

Ini berarti: gunakan elemen itu sendiri sebagai identitas pembeda.

Sedangkan:

```swift
ForEach(lists, id: \.id)
```

berarti: gunakan field `id` dari elemen sebagai identitas pembeda.

Jika suatu field sendiri dapat menjamin keunikan, field tersebut juga bisa digunakan sementara.

Misalnya, jika nama setiap film berbeda, maka penulisan berikut mungkin juga bisa berjalan normal pada data saat ini:

```swift
ForEach(lists, id: \.name)
```

Tetapi ada satu masalah tersembunyi di sini: `name` belum tentu selalu unik.

Bayangkan jika nanti kamu menambahkan film lain dengan nama yang sama, maka `name` tidak lagi bisa membedakan setiap elemen dengan tepat.

Pada saat itu, meskipun kode masih bisa dikompilasi, SwiftUI mungkin akan salah mengenali elemen saat refresh view, update, insert, atau delete, sehingga menyebabkan tampilan yang tidak normal.

Karena itu, ketika kita memerlukan pembeda data yang stabil, tetap lebih baik menggunakan field yang benar-benar unik, yaitu `id`.

## UUID

Walaupun menulis manual seperti `id: 1`, `id: 2` bisa menyelesaikan masalah, tetap ada satu risiko: bisa saja kita tanpa sengaja menulis `id` yang sama, dan identitas unik pun menjadi tidak valid.

Misalnya:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Dengan begitu, akan muncul dua `id` yang sama, dan identitas unik pun kehilangan fungsinya.

Untuk menghindari kesalahan manual, biasanya kita menggunakan `UUID()`.

Di Swift, `UUID()` akan menghasilkan pengenal 128-bit secara acak. Biasanya ia ditampilkan sebagai rangkaian panjang huruf dan angka.

Misalnya:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Di sini, `UUID()` sebenarnya membuat instance dari tipe `UUID`; kamu bisa memahaminya sebagai "nomor unik" yang dibuat secara otomatis.

Karena itu, nilai yang dibuat setiap kali hampir tidak pernah sama, sehingga sangat cocok digunakan sebagai `id`.

Kita bisa mengubah `Movie` menjadi seperti ini:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Kode ini berarti bahwa field `id` dalam struktur `Movie` secara default akan diisi dengan instance `UUID` yang baru.

Artinya, setiap kali kita membuat `Movie` baru, sistem akan lebih dulu membantu kita membuatkan `id` yang unik secara otomatis.

Karena `id` sudah memiliki nilai default, maka nanti saat membuat instance `Movie`, kita tidak perlu lagi mengisi `id` secara manual.

Misalnya:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Walaupun di sini `id` tidak ditulis, sebenarnya instance film ini tetap memiliki `id` miliknya sendiri; hanya saja nilai itu sudah otomatis dibuat oleh `UUID()`.

Setelah menggunakan cara ini, kita tidak perlu lagi mengisi `id` secara manual untuk setiap film. Ini bukan hanya mengurangi jumlah kode, tetapi juga menghindari kesalahan akibat pengisian id yang berulang.

Terakhir, kita hanya perlu menambahkan gambar `Banner` di bagian atas dan menggunakan `ScrollView` agar kontennya bisa digulir, lalu seluruh tampilan daftar film pun selesai.

## Ringkasan

Dalam pelajaran ini, kita telah mempelajari satu poin pengetahuan yang sangat penting: `struct`.

Melalui `struct`, kita bisa menggabungkan beberapa field terkait dari sebuah film menjadi satu kesatuan, alih-alih memisahkan nama, sutradara, dan rating ke dalam beberapa array.

Setelah datanya digabungkan, kita bisa menggunakan `ForEach` untuk menampilkan setiap film dalam array satu per satu di view.

Pada saat yang sama, kita juga memahami peran "identitas pembeda" di dalam `ForEach`: SwiftUI harus tahu bagaimana membedakan setiap elemen dalam array agar bisa menampilkan dan memperbarui view dengan benar.

Karena itu, kita membuat `Movie` mengikuti protokol `Identifiable` dan memberinya `id` yang unik.

Agar terhindar dari kesalahan saat mengisi `id` secara manual, kita juga mempelajari `UUID()` supaya sistem dapat secara otomatis membuat identitas unik tersebut.

Setelah menyelesaikan pelajaran ini, kamu bukan hanya akan menyelesaikan daftar film, tetapi juga mulai menyentuh satu gagasan penting dalam SwiftUI: **atur data terlebih dahulu, lalu hasilkan view berdasarkan data tersebut.**

## Kode Lengkap

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
