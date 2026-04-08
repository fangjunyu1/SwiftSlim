# Senarai Filem

Dalam pelajaran ini, kita akan membuat satu senarai filem.

![movie](../../Resource/021_movie.png)

Dalam senarai ini akan dipaparkan poster, nama, pengarah dan penilaian bagi setiap filem.

Dalam contoh ini, kita akan mempelajari satu konsep yang sangat penting: struktur `struct`. Ia boleh membantu kita menggabungkan pelbagai maklumat bagi satu filem menjadi satu keseluruhan. Selain itu, kita juga akan berkenalan dengan `UUID()`, `ForEach`, garis pemisah `Divider`, serta cara menggunakan objek tersuai untuk mengurus data.

Pengetahuan ini sangat biasa digunakan dalam pembangunan SwiftUI seterusnya. Selepas menamatkan pelajaran ini, anda bukan sahaja boleh menghasilkan satu senarai filem, malah juga mula memahami “bagaimana memaparkan satu kumpulan data sebagai antara muka”.

## Satu filem

Kita boleh mulakan dengan antara muka bagi satu filem terlebih dahulu.

![movie](../../Resource/021_movie1.png)

Susun atur antara muka ini terutamanya terdiri daripada dua bahagian: di sebelah kiri ialah poster filem, dan di sebelah kanan ialah pengenalan filem.

### Poster filem

Di sebelah kiri dipaparkan poster filem, dan kita boleh menggunakan `Image` untuk memaparkan imej.

Contohnya:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Kod ini bermaksud memaparkan satu imej yang bernama `"The Shawshank Redemption"`.

Perlu diberi perhatian di sini bahawa nama imej mesti benar-benar wujud dalam folder sumber `Assets`, jika tidak antara muka tidak dapat memaparkan imej itu dengan betul.

![movie](../../Resource/021_movie2.png)

Fungsi beberapa pengubah suai ini adalah seperti berikut:

- `resizable()` bermaksud saiz imej boleh diubah.
- `scaledToFit()` bermaksud nisbah asal dikekalkan semasa penskalaan supaya imej tidak diregang dan berubah bentuk.
- `frame(height: 180)` bermaksud menetapkan ketinggian imej kepada 180.
- `cornerRadius(10)` bermaksud menetapkan penjuru bulat bernilai 10 pada imej.

Dengan itu, kita boleh mendapatkan satu imej poster filem yang bersaiz sesuai dan mempunyai penjuru bulat.

![movie](../../Resource/021_movie3.png)

### Pengenalan filem

Di sebelah kanan dipaparkan pengenalan filem, termasuk nama filem, pengarah dan penilaian.

![movie](../../Resource/021_movie4.png)

Kita boleh menggunakan `Text` untuk memaparkan kandungan bahagian ini:

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

Dalam kod ini, `.font` mewakili saiz fon, manakala `.fontWeight` mewakili ketebalan fon.

Untuk menjadikan jarak antara “nama filem”, “maklumat pengarah” dan “maklumat penilaian” lebih jelas, di sini kita menggunakan `VStack` pada lapisan paling luar, dan menetapkan:

```swift
spacing: 10
```

Ini bermaksud setiap kumpulan kandungan di dalam `VStack` ini mempunyai jarak 10 antara satu sama lain.

Sebab pengarah dan penilaian masing-masing dibungkus semula dengan satu `VStack` adalah kerana kedua-duanya termasuk dalam struktur seperti “tajuk + kandungan”. Oleh itu, hierarki antara muka akan menjadi lebih jelas, dan juga memudahkan kita untuk terus melaras gaya kemudian.

Selain itu, `VStack` secara lalai disusun tengah. Untuk menjadikan keseluruhan teks sejajar ke kiri, kita menetapkan:

```swift
alignment: .leading
```

Dengan ini, bahagian pengenalan filem kelihatan lebih kemas.

### Garis pemisah

Sekarang, walaupun kandungan dalam pengenalan filem telah dijarakkan melalui `spacing`, sempadan antara kandungan yang berlainan masih belum cukup jelas.

Pada masa ini, kita boleh menambah garis pemisah:

```swift
Divider()
```

Contohnya:

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

Dengan itu, bahagian pengenalan filem akan mempunyai kesan pemisahan yang lebih ketara.

![movie](../../Resource/021_movie4.png)

`Divider` ialah satu view yang sangat ringkas tetapi sangat kerap digunakan, dan fungsinya adalah untuk memisahkan kandungan yang berbeza.

Dalam `VStack`, `Divider()` dipaparkan sebagai satu garis mendatar.

Dalam `HStack`, `Divider()` dipaparkan sebagai satu garis menegak.

Selain itu, gaya `Divider` juga boleh diubah melalui `.frame`, `.background`, `.padding` dan cara lain.

Contohnya:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Ini akan menghasilkan satu garis pemisah berwarna biru, setebal 2, dan mempunyai padding di kiri dan kanan.

![divider](../../Resource/021_divider.png)

### Antara muka lengkap

Akhir sekali, kita boleh menggunakan `HStack` untuk menyusun poster filem dan pengenalan filem secara kiri dan kanan.

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

`HStack(spacing: 20)` di sini bermaksud mengekalkan jarak 20 antara dua bahagian kiri dan kanan.

Perlu diperhatikan bahawa `Divider()` sama seperti `TextField` dan `Slider` yang kita pelajari sebelum ini, secara lalai akan cuba menggunakan sebanyak mungkin ruang yang tersedia.

Oleh itu, kita menetapkan satu lebar tetap pada `VStack` paling luar bagi bahagian pengenalan di sebelah kanan:

```swift
.frame(width: 200)
```

Dengan itu, lebar garis pemisah dan kawasan teks dapat dikekalkan konsisten, dan keseluruhannya akan kelihatan lebih kemas.

Sampai di sini, kita telah menyiapkan antara muka paparan bagi “satu filem”.

![movie](../../Resource/021_movie1.png)

## Menyimpan filem dalam array

Jika kita mahu memaparkan banyak filem satu demi satu dengan gaya yang sama, ini bermaksud setiap filem perlu ditulis sekali lagi dengan kod yang serupa.

Contohnya:

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

Walaupun kod yang ditulis begini boleh mencapai hasil yang dikehendaki, kod akan menjadi semakin banyak, dan penyelenggaraannya juga akan menjadi sangat menyusahkan.

Sebagai contoh, jika kita perlu menukar jarak semua filem daripada `20` kepada `15`, atau menukar lebar di sebelah kanan daripada `200` kepada
`220`, kita perlu mengubah setiap bahagian kod berulang itu secara manual.

Ini jelas bukan satu kaedah yang cekap.

Sebelum ini kita telah mempelajari array, dan juga mempelajari penggunaan `ForEach` untuk memaparkan view secara berulang berdasarkan array.

Contohnya:

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

Kaedah ini sangat sesuai untuk mengendalikan keadaan yang “hanya mempunyai satu jenis data”, contohnya sekumpulan nama imej.

Tetapi, satu filem bukan hanya mempunyai satu nilai. Sekurang-kurangnya ia mengandungi:

1. Poster filem
2. Nama filem
3. Pengarah
4. Penilaian

Dengan kata lain, satu filem sebenarnya ialah sekumpulan data yang saling berkaitan, bukannya satu rentetan tunggal.

Jika kita hanya menggunakan array, kita hanya boleh menyimpan maklumat ini secara berasingan:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Semasa memaparkannya, kita perlu bergantung pada indeks yang sama untuk memadankan satu demi satu:

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

Masalah dengan cara penulisan ini ialah kos penyelenggaraannya sangat tinggi.

Ini kerana data bagi satu filem dipecahkan ke dalam beberapa array. Selagi ada satu array yang mempunyai satu item lebih, satu item kurang, atau susunannya tidak sama, hasil paparan akan menjadi salah.

Terutamanya apabila menambah atau memadam filem, anda perlu mengubah beberapa array pada masa yang sama, dan sangat mudah untuk tertinggal sesuatu.

Jadi, bagaimana kita boleh menggabungkan maklumat seperti “nama filem, pengarah, penilaian” ini menjadi satu keseluruhan?

Di sinilah kita perlu menggunakan `struct`.

## Mendefinisikan struktur `struct`

Dalam Swift, `struct` bermaksud “struktur”.

Anda boleh memahaminya sebagai satu “jenis data tersuai”, yang boleh menggabungkan beberapa medan berkaitan menjadi satu keseluruhan.

Penggunaan asas:

```swift
struct StructName {
	let name: String
}
```

Dalam kod ini, `struct` ialah kata kunci yang menunjukkan kita sedang mendefinisikan satu struktur. `StructName` ialah nama struktur tersebut.

Kandungan di dalam kurungan kurawal ialah medan yang terkandung dalam struktur ini, dan setiap medan mesti menyatakan nama serta jenisnya dengan jelas.

Dalam kebanyakan keadaan, nama `struct` ditulis dengan huruf besar pada awalnya, contohnya `Movie`, `Student`, `UserInfo`. Ini ialah konvensyen penamaan yang biasa dalam Swift.

Anda boleh memahami `struct` secara ringkas sebagai sebuah kotak pembungkusan kosong, dan setiap medan di dalamnya seperti satu ruang kosong yang disediakan dalam kotak itu.

Apabila ruang-ruang itu belum diisi, ia hanyalah sebuah kotak kosong. Hanya selepas semua medan diisi dengan nilai yang sesuai, barulah ia menjadi sebuah kotak hadiah yang lengkap.

### Instance `struct`

Sebelum ini kita hanya mendefinisikan struktur itu sendiri, seolah-olah menyediakan bentuk sebuah kotak pembungkusan.

Kita masih perlu mengisi kandungan yang sebenar ke dalamnya, barulah kita memperoleh satu “instance” yang benar-benar boleh digunakan.

Semasa mencipta instance, biasanya kita menambah `()` selepas nama struktur:

```swift
StructName(...)
```

Yang diisi dalam kurungan bulat ialah kandungan medan yang diperlukan oleh struktur tersebut.

Contohnya:

```swift
StructName(name: "Fang Junyu")
```

Kod ini bermaksud: mengikut format struktur `StructName`, cipta satu instance baharu, dan berikan nilai `"Fang Junyu"` kepada medan `name`.

Apabila kita mengisi semua kandungan medan yang diperlukan, ia seolah-olah kita telah memenuhi kotak pembungkusan itu.

Pada masa ini, kita memperoleh satu instance struktur yang lengkap.

### Mengakses sifat `struct`

Selepas kita mencipta satu instance, kita boleh menggunakan “sintaks titik” untuk mengakses sifat di dalamnya.

Penulisan asas:

```swift
instance.propertyName
```

Contohnya:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Di sini, `st` ialah satu instance struktur, dan `st.name` bermaksud membaca nilai `name` dalam instance ini.

Anda boleh memahami cara pembacaan ini seperti berikut: apabila kita menulis `st.name`, ia seolah-olah membaca kandungan yang disimpan pada satu kedudukan tertentu dalam kotak pembungkusan itu.

Penulisan seperti ini akan menjadi sangat biasa dalam antara muka SwiftUI seterusnya.

Sebagai contoh, jika kita mempunyai struktur pelajar yang mengandungi nama, umur dan kelas, maka apabila dipaparkan pada antara muka, kita boleh membaca satu demi satu:

```swift
student.name
student.age
student.className
```

Kelebihannya ialah data menjadi lebih jelas, dan juga lebih mudah diurus.

### Kedudukan `struct`

Bagi pemula, biasanya struktur boleh ditulis di luar `ContentView`.

Contohnya:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Dengan itu, strukturnya akan lebih jelas dan juga lebih mudah dibaca.

Anda akan mendapati bahawa `ContentView` itu sendiri sebenarnya juga sebuah `struct`.

### Struktur `Movie`

Dengan asas tadi, kita kini boleh mendefinisikan satu struktur filem:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ini ialah satu struktur bernama `Movie`, yang terdiri daripada tiga medan: `name`, `director` dan `rating`, yang masing-masing mewakili nama filem, pengarah dan penilaian.

Dengan itu, maklumat berkaitan satu filem tidak lagi perlu dipecahkan dan disimpan dalam beberapa array, sebaliknya boleh terus digabungkan menjadi satu keseluruhan.

Contohnya, kita boleh mencipta satu instance filem seperti ini:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Instance ini mewakili “satu data filem yang lengkap”.

### Menyimpan struktur dalam array

Sebelum ini kita telah menyatakan bahawa array hanya boleh menyimpan jenis yang sama.

Sekarang, kita sudah mempunyai struktur `Movie`, maka array boleh menyimpan beberapa `Movie`.

```swift
let lists: [Movie] = []
```

Contohnya:

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

Dalam array `lists` ini, yang disimpan bukan rentetan, tetapi beberapa instance `Movie`.

Maksudnya, setiap elemen dalam array ialah satu filem yang lengkap.

Dengan itu, apabila kita perlu memaparkan senarai filem, kita boleh menggunakan `ForEach` untuk membaca setiap filem satu demi satu.

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

`movie in` di sini bermaksud bahawa pada setiap pusingan, satu filem akan diambil daripada array dan dinamakan sementara sebagai `movie`.

Kemudian, kita boleh menggunakan:

```swift
movie.name
movie.director
movie.rating
```

untuk membaca nama, pengarah dan penilaian filem tersebut secara berasingan, lalu memaparkannya pada antara muka.

## Ralat `ForEach`

Sampai di sini, kita telah menyiapkan penulisan asas bagi array filem dan `ForEach`.

Walau bagaimanapun, jika kita terus menjalankan kod berikut:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

akan muncul ralat:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Maksud ralat ini ialah apabila anda menulis `id: \.self`, SwiftUI perlu menggunakan setiap elemen dalam array itu sendiri sebagai “pengenal unik” untuk membezakannya.

Cara penulisan ini sesuai untuk jenis mudah seperti `String` dan `Int`, kerana ia sendiri agak mudah dibezakan.

Tetapi `Movie` ialah struktur tersuai yang kita definisikan sendiri, dan `ForEach` tidak tahu bagaimana hendak menggunakan struktur itu sendiri sebagai pengenal unik, jadi ralat pun berlaku.

Untuk menyelesaikan masalah ini, kaedah yang paling biasa ialah membolehkan `Movie` mematuhi protokol `Identifiable`.

## Protokol

Dalam Swift, protokol boleh difahami sebagai sejenis “peraturan” atau “keperluan”.

Anda boleh memahaminya seperti perjanjian dalam organisasi antarabangsa: jika sesebuah negara ingin menyertai sesuatu organisasi antarabangsa, biasanya ia perlu terlebih dahulu memenuhi beberapa peraturan yang ditetapkan oleh organisasi itu, mendedahkan beberapa data, dan mematuhi beberapa peraturan bersama. Hanya selepas syarat-syarat ini dipenuhi, barulah ia boleh menyertainya atau mengambil bahagian dalam beberapa urusan.

Protokol juga berfungsi dengan logik yang serupa.

Apabila sesuatu jenis ingin mematuhi sesuatu protokol, ia perlu memenuhi kandungan yang ditetapkan oleh protokol tersebut. Hanya selepas memenuhi keperluan ini, jenis itu boleh menggunakan fungsi yang berkaitan.

Penulisan asas:

```swift
struct Movie: Identifiable {
    // ...
}
```

`: Identifiable` di sini bermaksud bahawa `Movie` mematuhi protokol `Identifiable`.

Jika sesuatu jenis mematuhi beberapa protokol, kita boleh memisahkannya dengan koma:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Bagi `Identifiable`, keperluan yang paling penting ialah: jenis tersebut perlu mempunyai `id` yang boleh mengenal pasti dirinya sendiri.

Contohnya:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

`id` di sini adalah seperti nombor kad pengenalan, yang digunakan untuk membezakan setiap filem.

Selagi `id` bagi setiap filem berbeza, SwiftUI boleh membezakan setiap elemen dalam array dengan betul.

Contohnya:

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

Kemudian dalam `ForEach`, gunakan:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Dengan itu, ralat tidak akan muncul lagi.

Oleh sebab `Movie` sudah mematuhi `Identifiable`, cara penulisan yang lebih biasa ialah terus mengabaikan `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Kerana SwiftUI sudah tahu bahawa ia perlu menggunakan `movie.id` untuk membezakan setiap item.

## Tanda pengenalan dalam `ForEach`

Seterusnya, kita akan memahami dengan lebih mendalam peranan `id` dalam `ForEach`.

Contohnya:

```swift
ForEach(lists, id: \.self)
```

Ini bermaksud: menggunakan elemen itu sendiri sebagai tanda pengenalan.

Manakala:

```swift
ForEach(lists, id: \.id)
```

bermaksud: menggunakan medan `id` bagi elemen sebagai tanda pengenalan.

Jika sesuatu medan itu sendiri boleh menjamin keunikan, ia juga boleh digunakan buat sementara waktu.

Sebagai contoh, jika nama setiap filem adalah berbeza, maka penulisan berikut juga mungkin berfungsi dengan betul dalam data semasa:

```swift
ForEach(lists, id: \.name)
```

Tetapi di sini terdapat satu masalah tersembunyi: `name` tidak semestinya sentiasa unik.

Andai kata kemudian anda menambah satu lagi filem yang mempunyai nama yang sama, maka `name` tidak lagi dapat membezakan setiap elemen dengan tepat.

Pada masa itu, walaupun kod masih boleh dikompilasi, semasa view disegarkan, dikemas kini, disisip atau dipadam, SwiftUI mungkin tersilap mengenal pasti elemen dan menyebabkan paparan menjadi tidak normal.

Oleh itu, apabila kita perlu membezakan data secara stabil, sebaiknya kita tetap menggunakan medan yang benar-benar unik, iaitu `id`.

## UUID

Walaupun menulis `id: 1`, `id: 2` secara manual boleh menyelesaikan masalah, masih ada satu risiko: kita mungkin secara tidak sengaja menulis `id` yang sama berulang kali, lalu pengenal unik itu menjadi tidak berkesan.

Contohnya:

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

Dengan itu akan muncul dua `id` yang sama, lalu pengenal unik itu menjadi tidak sah.

Untuk mengelakkan kesilapan manual, kita biasanya menggunakan `UUID()`.

Dalam Swift, `UUID()` akan menjana satu pengecam 128-bit secara rawak. Ia biasanya dipaparkan sebagai satu rentetan panjang yang terdiri daripada huruf dan nombor.

Contohnya:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

`UUID()` di sini sebenarnya mencipta satu instance jenis `UUID`, dan anda boleh memahaminya sebagai satu “nombor unik” yang dijana secara automatik.

Oleh itu, nilai yang dicipta setiap kali hampir tidak akan berulang, jadi ia sangat sesuai digunakan sebagai `id`.

Kita boleh mengubah `Movie` menjadi:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Kod ini bermaksud medan `id` dalam struktur `Movie` secara lalai akan diberikan satu instance `UUID` baharu.

Dalam erti kata lain, setiap kali kita mencipta satu `Movie` baharu, sistem akan terlebih dahulu membantu kita menjana satu `id` yang unik secara automatik.

Memandangkan `id` sudah mempunyai nilai lalai, maka apabila kita mencipta instance `Movie` kemudian, kita tidak perlu lagi mengisi `id` secara manual.

Contohnya:

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

Walaupun `id` tidak ditulis di sini, sebenarnya instance filem ini tetap mempunyai `id` sendiri, cuma nilainya sudah dijana secara automatik oleh `UUID()`.

Dengan menggunakan cara ini, kita tidak lagi perlu mengisi `id` secara manual bagi setiap filem. Ini bukan sahaja mengurangkan jumlah kod, malah juga mengelakkan ralat akibat mengisi `id` yang berulang.

Akhir sekali, kita hanya perlu menambah satu imej `Banner` di bahagian atas, dan menggunakan `ScrollView` supaya kandungan boleh dipaparkan secara tatal, lalu keseluruhan view senarai filem pun siap.

## Rumusan

Dalam pelajaran ini, kita telah mempelajari satu konsep yang sangat penting: `struct`.

Melalui `struct`, kita boleh menggabungkan pelbagai medan berkaitan bagi satu filem menjadi satu keseluruhan, dan bukannya memecahkan nama, pengarah dan penilaian ke dalam beberapa array yang berasingan.

Selepas data digabungkan, kita boleh menggunakan `ForEach` untuk memaparkan setiap filem dalam array ke dalam view satu demi satu.

Pada masa yang sama, kita juga memahami peranan “tanda pengenalan” dalam `ForEach`. SwiftUI mesti mengetahui cara membezakan setiap elemen dalam array supaya view dapat dipaparkan dan dikemas kini dengan betul.

Oleh itu, kita membolehkan `Movie` mematuhi protokol `Identifiable`, dan memberikan satu `id` yang unik kepadanya.

Untuk mengelakkan kesilapan semasa mengisi `id` secara manual, kita seterusnya mempelajari `UUID()`, yang membolehkan sistem menjana pengenal unik secara automatik.

Selepas menamatkan pelajaran ini, anda bukan sahaja telah menyiapkan satu senarai filem, malah juga mula menyentuh satu idea penting dalam SwiftUI: **susun data terlebih dahulu, kemudian jana view berdasarkan data tersebut.**

## Kod lengkap

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
