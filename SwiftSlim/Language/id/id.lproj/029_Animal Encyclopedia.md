# Ensiklopedia Hewan 

Dalam pelajaran ini, kita akan terus berlatih membuat tampilan kustom dan meneruskan data.

Kita akan membuat sebuah tampilan ensiklopedia hewan yang sederhana. Halaman ini akan menampilkan lima hewan. Saat pengguna mengklik salah satu hewan, sebuah tampilan detail akan muncul untuk menampilkan gambar, area persebaran, habitat, dan deskripsi hewan tersebut.

Hasil akhir:

![tampilan](../../../Resource/029_view.png)

Melalui contoh ini, kita bisa berlatih bagaimana struktur data, tampilan daftar, interaksi klik, dan tampilan pop-up Sheet bekerja sama.

## Siapkan bahan gambar

Pertama, kita perlu menyiapkan lima gambar hewan:

- Lumba-lumba: `dolphin.jpg`
- Jerapah: `giraffe.jpg`
- Singa: `lion.jpg`
- Panda: `panda.jpg`
- Beruang kutub: `polarBear.jpg`

Anda bisa menggunakan bahan gambar berikut:

[Lumba-lumba](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Jerapah](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Singa](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Beruang kutub](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Setelah mengunduh gambar, seret gambar tersebut ke folder resource `Assets` di proyek Xcode.

![assets](../../../Resource/029_assets.png)

Perlu diperhatikan bahwa saat menggunakan gambar dalam kode, biasanya kita tidak perlu menulis ekstensi `.jpg`.

Misalnya, jika nama resource gambar adalah `dolphin`, tulis seperti ini dalam kode:

```swift
Image("dolphin")
```

Jika nama gambar salah ditulis, gambar tidak dapat ditampilkan dengan benar.

Catatan: Bahan gambar di atas berasal dari proyek Wikimedia. Saat digunakan, disarankan untuk tetap menyertakan tautan asli dan informasi sumber.

## Buat struktur hewan

Dalam halaman ini, setiap hewan memiliki beberapa informasi:

- Nama hewan
- Gambar hewan
- Emoji hewan
- Area persebaran
- Habitat
- Deskripsi hewan

Jika kita memecah informasi ini menjadi banyak variabel terpisah, kode akan menjadi cukup berantakan. Oleh karena itu, kita bisa membuat struktur `Animal` untuk menyatukan informasi seekor hewan.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Dalam kode ini:

- `id`: pengenal unik hewan.
- `name`: nama hewan.
- `imageName`: nama gambar hewan.
- `avatarEmoji`: emoji hewan.
- `distributionArea`: area persebaran.
- `habitat`: habitat.
- `animalDescription`: deskripsi hewan.

Di antaranya:

```swift
let id = UUID()
```

`id` digunakan untuk mengidentifikasi setiap hewan. Karena nanti kita akan menggunakan `ForEach` untuk menampilkan daftar hewan, dan juga menggunakan `.sheet(item:)` untuk menampilkan detail berdasarkan hewan yang dipilih, `Animal` perlu mengikuti protokol `Identifiable`.

Peran `Identifiable` adalah untuk memberi tahu SwiftUI: setiap hewan memiliki `id` yang bisa membedakan identitasnya.

## Buat data hewan

Selanjutnya, kita membuat sebuah array hewan di `ContentView`.

Array ini menyimpan lima `Animal`, dan setiap `Animal` mewakili seekor hewan.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Lumba-lumba
        Animal(
            name: "Lumba-lumba",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lautan panas dan sederhana di seluruh dunia.",
            habitat: "Lautan, perairan pantai, dan beberapa sungai besar.",
            animalDescription: "Lumba-lumba adalah mamalia laut yang cerdas. Mereka hidup berkelompok, berkomunikasi menggunakan suara, dan dikenal karena perilakunya yang suka bermain."
        ),
        // Jerapah
        Animal(
            name: "Jerapah",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savana dan hutan terbuka di Afrika.",
            habitat: "Padang rumput, savana, dan hutan terbuka.",
            animalDescription: "Jerapah adalah hewan darat tertinggi. Mereka memiliki leher panjang, kaki panjang, dan biasanya memakan daun dari pohon yang tinggi."
        ),
        // Singa
        Animal(
            name: "Singa",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Terutama ditemukan di Afrika sub-Sahara, dengan populasi kecil di India barat.",
            habitat: "Padang rumput, savana, dan hutan terbuka.",
            animalDescription: "Singa adalah kucing besar yang kuat. Mereka biasanya hidup dalam kelompok yang disebut kawanan dan sering dikenal sebagai raja dunia hewan."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hutan pegunungan di Tiongkok tengah.",
            habitat: "Hutan bambu di area pegunungan yang dingin dan lembap.",
            animalDescription: "Panda adalah beruang yang dikenal dengan bulu hitam-putihnya. Mereka terutama memakan bambu dan merupakan salah satu hewan yang paling mudah dikenal di dunia."
        ),
        // Beruang kutub
        Animal(
            name: "Beruang Kutub",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Wilayah Arktik di sekitar Kutub Utara.",
            habitat: "Es laut, area pantai, dan lingkungan Arktik yang dingin.",
            animalDescription: "Beruang kutub adalah beruang besar yang beradaptasi dengan lingkungan dingin. Mereka perenang yang kuat dan terutama bergantung pada es laut untuk berburu anjing laut."
        )
    ]

    var body: some View {
        Text("Ensiklopedia Hewan")
    }
}
```

Di sini, `animals` adalah sebuah array:

```swift
let animals: [Animal]
```

`[Animal]` berarti array ini menyimpan beberapa `Animal`.

Dengan kata lain, `animals` bukan satu ekor hewan, tetapi sekelompok hewan.

## Tampilkan daftar hewan

Sekarang, kita bisa menggunakan `ForEach` untuk menampilkan daftar hewan.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Hasil tampilan:

![tampilan](../../../Resource/029_view1.png)

Dalam kode ini:

```swift
ForEach(animals) { animal in
    ...
}
```

Ini berarti mengiterasi array `animals`.

Setiap kali perulangan dijalankan, `animal` mewakili hewan yang sedang ditampilkan.

Misalnya, pada perulangan pertama, `animal` adalah lumba-lumba; pada perulangan kedua, `animal` adalah jerapah.

Jadi, kita bisa menampilkan informasi hewan saat ini dengan cara berikut:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Dengan cara ini, lima hewan bisa ditampilkan.

## Buat daftar hewan bisa diklik

Sekarang daftar sudah ditampilkan, tetapi masih belum bisa diklik.

Jika kita ingin detail muncul setelah pengguna mengklik seekor hewan, kita perlu mencatat “hewan yang sedang dipilih” terlebih dahulu.

Oleh karena itu, tambahkan satu variabel status dalam `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Di sini, `selectedAnimal` adalah tipe nilai opsional `Animal?`.

Ini berarti nilainya mungkin berisi seekor hewan, dan mungkin juga tidak berisi hewan.

Nilai default-nya adalah `nil`, yang berarti tidak ada hewan yang dipilih di awal.

Kemudian, kita ubah setiap baris hewan menjadi `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Poin pentingnya adalah baris kode ini:

```swift
selectedAnimal = animal
```

Saat pengguna mengklik seekor hewan, kita menyimpan hewan tersebut ke dalam `selectedAnimal`.

Misalnya, jika pengguna mengklik lumba-lumba, `selectedAnimal` akan menyimpan lumba-lumba.

Jika pengguna mengklik panda, `selectedAnimal` akan menyimpan panda.

Dengan kata lain, `selectedAnimal` digunakan untuk mencatat hewan yang sedang diklik oleh pengguna.

## Tampilan pop-up Sheet

Sekarang kita sudah bisa menggunakan tombol untuk mencatat “hewan yang sedang diklik”.

Selanjutnya, kita perlu mengimplementasikan satu tampilan pop-up untuk menampilkan detail hewan.

![tampilan](../../../Resource/029_view2.png)

Dalam SwiftUI, kita bisa menggunakan `Sheet` untuk mengimplementasikan efek pop-up ini.

`Sheet` bisa dipahami sebagai halaman sementara yang muncul. Sheet ditampilkan di atas halaman saat ini, dan setelah pengguna selesai melihat konten, pengguna bisa menggeser ke bawah untuk menutupnya.

## Contoh Sheet

Sebelum benar-benar menampilkan detail hewan, kita gunakan sebuah contoh sederhana untuk memahami cara `Sheet` muncul.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Tampilkan Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Tampilan Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Hasil tampilan:

![tampilan](../../../Resource/029_view3.png)

Dalam kode ini, kita membuat sebuah nilai Boolean:

```swift
@State private var showSheet = false
```

`showSheet` secara default bernilai `false`, yang berarti `Sheet` tidak ditampilkan di awal.

Ketika tombol diklik:

```swift
showSheet.toggle()
```

`toggle()` berarti mengganti nilai Boolean.

Jika awalnya `false`, setelah memanggil `toggle()`, nilainya akan menjadi `true`.

Jika awalnya `true`, setelah memanggil `toggle()`, nilainya akan menjadi `false`.

Jadi, setelah tombol diklik, `showSheet` akan berubah dari `false` menjadi `true`.

Ketika `showSheet` menjadi `true`, kode berikut akan memunculkan `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Tampilan Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kode ini berarti: ketika `showSheet` bernilai `true`, munculkan sebuah `Sheet`, dan tampilkan `Text("Tampilan Sheet")` di dalam `Sheet` tersebut.

Hasil tampilan:

![tampilan](../../../Resource/029_view4.png)

Bentuk penulisan seperti ini cocok untuk memunculkan konten tetap.

Misalnya, setelah tombol diklik, munculkan halaman pengaturan, halaman penjelasan, halaman petunjuk, dan sebagainya.

### Posisi tampilan Sheet

Meskipun `Sheet` adalah sebuah tampilan pop-up, di SwiftUI `Sheet` tidak ditulis langsung sebagai tampilan independen seperti `Text()` atau `Image()`, tetapi digunakan sebagai modifier tampilan.

Dengan kata lain, `.sheet(...)` mirip dengan modifier seperti `.font()`, `.padding()`, dan `.shadow()`, dan perlu ditambahkan setelah suatu tampilan.

Misalnya:

```swift
Button("Tampilkan Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Tampilan Sheet")
}
```

Dalam contoh ini, `.sheet` ditambahkan setelah `Button`.

Ketika `showSheet` menjadi `true`, SwiftUI akan memunculkan `Sheet` dan menampilkan konten di dalam kurung kurawal:

```swift
Text("Tampilan Sheet")
```

Namun, dalam pengembangan sebenarnya, jika sebuah halaman memiliki beberapa tombol, biasanya kita tidak menambahkan sebuah `.sheet` pada setiap tombol.

Cara yang lebih umum adalah: tambahkan `.sheet` setelah tampilan luar.

Misalnya:

```swift
VStack {
    Button("Tampilkan Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Tampilan Sheet")
}
```

Tombol bertanggung jawab mengubah `showSheet`, sedangkan tampilan luar bertanggung jawab memunculkan `Sheet` berdasarkan apakah `showSheet` bernilai `true`.

## Sheet yang mengikat nilai opsional

Bentuk penulisan yang kita pelajari sebelumnya adalah:

```swift
.sheet(isPresented: $showSheet) {
    Text("Tampilan Sheet")
}
```

Bentuk penulisan ini cocok untuk mengontrol tampil dan sembunyinya sebuah halaman tetap.

Namun, dalam contoh ensiklopedia hewan, kita tidak hanya perlu tahu “apakah `Sheet` muncul”, tetapi juga perlu tahu “hewan mana yang diklik”.

Misalnya:

Jika pengguna mengklik lumba-lumba, detail lumba-lumba seharusnya ditampilkan di dalam `Sheet`.

Jika pengguna mengklik panda, detail panda seharusnya ditampilkan di dalam `Sheet`.

Jadi, di sini lebih cocok menggunakan bentuk penulisan Sheet lainnya:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Konten yang ditampilkan di Sheet
}
```

Dalam kode ini, `Sheet` mengikat sebuah nilai opsional `selectedAnimal`.

Perlu diperhatikan bahwa setelah `item:` kita menulis `$selectedAnimal`, bukan `selectedAnimal`.

Ini karena `Sheet` tidak hanya membaca nilai `selectedAnimal`, tetapi juga perlu menentukan apakah perlu muncul berdasarkan perubahannya.

Kode ini bisa dipahami seperti berikut:

- Ketika `selectedAnimal` adalah `nil`, `Sheet` tidak ditampilkan.
- Ketika `selectedAnimal` memiliki nilai, `Sheet` ditampilkan.
- Ketika `Sheet` ditutup, SwiftUI akan mengembalikan `selectedAnimal` menjadi `nil`.

SwiftUI akan meneruskan hewan yang disimpan di dalam `selectedAnimal` ke `animal` di dalam kurung kurawal.

Dengan kata lain, `.sheet(item:)` tidak hanya mengontrol pop-up, tetapi juga meneruskan data yang dipilih ke dalam `Sheet`.

## Gunakan Sheet untuk menampilkan nama hewan

Sekarang, kita jangan terburu-buru membuat tampilan detail yang kompleks.

Agar kode lebih mudah dipahami, kita tampilkan terlebih dahulu nama hewan saat ini di dalam `Sheet`.

Tambahkan `.sheet(item:)` di luar `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Bagian paling penting di sini adalah kode berikut:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ketika `selectedAnimal` memiliki nilai, `Sheet` akan muncul.

`animal` di dalam kurung kurawal adalah hewan yang sedang dipilih.

Jadi:

```swift
Text(animal.name)
```

akan menampilkan nama hewan yang sedang diklik.

Misalnya, ketika mengklik `Lumba-lumba`, Sheet akan menampilkan `Lumba-lumba`.

Ketika mengklik `Panda`, `Sheet` akan menampilkan `Panda`.

Dengan cara ini, kita sudah mengimplementasikan efek mengklik hewan yang berbeda dan memunculkan nama hewan yang berbeda.

Tampilkan nama hewan:

![tampilan](../../../Resource/029_view5.png)

Namun, detail hewan seharusnya tidak hanya menampilkan satu nama. Detail juga seharusnya menampilkan nama, area persebaran, habitat, dan deskripsi.

Jika semua kode ini ditulis dalam `.sheet`, kode akan menjadi sangat panjang dan tidak mudah dibaca.

Oleh karena itu, selanjutnya kita membuat tampilan kustom baru yang khusus untuk menampilkan detail hewan.

## Buat tampilan detail hewan

Selanjutnya, kita membuat tampilan kustom baru `AnimalDetailView`.

Tampilan ini menerima sebuah `Animal` dan menampilkan detail hewan.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Area Persebaran** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** ：\(animal.habitat)")

                    Divider()

                    Text("**Deskripsi Hewan** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Hasil tampilan:

![tampilan](../../../Resource/029_view2.png)

Fokus di sini adalah:

```swift
var animal: Animal
```

Ini berarti `AnimalDetailView` perlu menerima seekor hewan dari luar.

Setelah menerima hewan itu, tampilan detail bisa menggunakan berbagai informasi hewan tersebut:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Dengan kata lain, `AnimalDetailView` hanya bertanggung jawab menampilkan hewan yang diteruskan kepadanya.

### Teks tebal Markdown

Dalam tampilan detail, kita menulis kode seperti ini:

```swift
Text("**Habitat:** \(animal.habitat)")
```

Di sini terdapat dua poin penting.

Pertama, `**Habitat:**` menggunakan sintaks `Markdown`. Teks yang dibungkus oleh dua tanda bintang akan ditampilkan dalam bentuk tebal.

Kedua, `\()` adalah interpolasi string, yang bisa menampilkan nilai variabel di dalam teks.

Kode ini berarti menampilkan `Habitat:` dalam bentuk tebal terlebih dahulu, kemudian menampilkan habitat hewan tersebut.

## Tampilkan tampilan detail di Sheet

Setelah membuat `AnimalDetailView`, kita bisa kembali ke `ContentView` dan mengganti tampilan nama sebelumnya di `Sheet` dengan tampilan detail.

Awalnya:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Sekarang diubah menjadi:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Di sini, `animal:` adalah nama parameter `AnimalDetailView`.

`animal` setelahnya adalah hewan saat ini yang diteruskan masuk oleh `.sheet(item:)`.

Yaitu, hewan yang sedang diklik diteruskan ke `AnimalDetailView` untuk ditampilkan.

Struktur lengkap:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Saat pengguna mengklik hewan:

```swift
selectedAnimal = animal
```

`selectedAnimal` berubah dari `nil` menjadi hewan tertentu. Setelah `Sheet` mendeteksi bahwa `selectedAnimal` memiliki nilai, Sheet akan memunculkan tampilan.

`Sheet` meneruskan hewan di dalam `selectedAnimal` ke tampilan `AnimalDetailView`, lalu `AnimalDetailView` menampilkan detail hewan.

Dengan cara ini, kita sudah mengimplementasikan fungsi mengklik daftar hewan dan menampilkan detail hewan yang sesuai.

## Perbedaan antara dua bentuk penulisan Sheet

Sekarang, kita telah menggunakan `.sheet(item:)` untuk menyelesaikan tampilan detail hewan.

Di sini, kita bisa merangkum secara singkat dua bentuk penulisan `Sheet` yang umum digunakan.

### Jenis pertama adalah binding nilai Boolean

```swift
@State private var showSheet = false

Button("Tampilkan Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Tampilan Sheet")
}
```

Bentuk penulisan ini cocok untuk memunculkan konten tetap, misalnya halaman pengaturan, halaman penjelasan, halaman petunjuk, dan sebagainya.

`showSheet` adalah nilai Boolean yang hanya memiliki dua status: `true` dan `false`.

Ketika `showSheet` bernilai `true`, `Sheet` ditampilkan.

Ketika `showSheet` bernilai `false`, `Sheet` tidak ditampilkan.

### Jenis kedua adalah binding nilai opsional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Bentuk penulisan ini cocok untuk memunculkan konten berbeda berdasarkan data yang dipilih.

Dalam pelajaran ini, kita mengklik hewan yang berbeda dan perlu menampilkan detail hewan yang berbeda. Oleh karena itu, penggunaan `.sheet(item:)` lebih cocok.

## Kode lengkap

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nama hewan
    let name: String
    
    // Gambar hewan
    let imageName: String
    
    // Emoji hewan
    let avatarEmoji: String
    
    // Area persebaran
    let distributionArea: String
    
    // Habitat
    let habitat: String
    
    // Deskripsi hewan
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Lumba-lumba
        Animal(
            name: "Lumba-lumba",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lautan panas dan sederhana di seluruh dunia.",
            habitat: "Lautan, perairan pantai, dan beberapa sungai besar.",
            animalDescription: "Lumba-lumba adalah mamalia laut yang cerdas. Mereka hidup berkelompok, berkomunikasi menggunakan suara, dan dikenal karena perilakunya yang suka bermain."
        ),
        // Jerapah
        Animal(
            name: "Jerapah",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savana dan hutan terbuka di Afrika.",
            habitat: "Padang rumput, savana, dan hutan terbuka.",
            animalDescription: "Jerapah adalah hewan darat tertinggi. Mereka memiliki leher panjang, kaki panjang, dan biasanya memakan daun dari pohon yang tinggi."
        ),
        // Singa
        Animal(
            name: "Singa",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Terutama ditemukan di Afrika sub-Sahara, dengan populasi kecil di India barat.",
            habitat: "Padang rumput, savana, dan hutan terbuka.",
            animalDescription: "Singa adalah kucing besar yang kuat. Mereka biasanya hidup dalam kelompok yang disebut kawanan dan sering dikenal sebagai raja dunia hewan."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hutan pegunungan di Tiongkok tengah.",
            habitat: "Hutan bambu di area pegunungan yang dingin dan lembap.",
            animalDescription: "Panda adalah beruang yang dikenal dengan bulu hitam-putihnya. Mereka terutama memakan bambu dan merupakan salah satu hewan yang paling mudah dikenal di dunia."
        ),
        // Beruang kutub
        Animal(
            name: "Beruang Kutub",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Wilayah Arktik di sekitar Kutub Utara.",
            habitat: "Es laut, area pantai, dan lingkungan Arktik yang dingin.",
            animalDescription: "Beruang kutub adalah beruang besar yang beradaptasi dengan lingkungan dingin. Mereka perenang yang kuat dan terutama bergantung pada es laut untuk berburu anjing laut."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Area Persebaran** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Deskripsi Hewan** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Ringkasan

Dalam pelajaran ini, kita telah menyelesaikan sebuah halaman ensiklopedia hewan yang sederhana.

Pertama-tama, kita menggunakan struktur `Animal` untuk menyimpan informasi hewan, lalu menggunakan array untuk menyimpan lima hewan, lalu menggunakan `ForEach` untuk menampilkan daftar hewan.

Saat pengguna mengklik seekor hewan, kita menyimpan hewan tersebut ke dalam `selectedAnimal`:

```swift
selectedAnimal = animal
```

Ketika `selectedAnimal` memiliki nilai, `.sheet(item:)` akan memunculkan tampilan detail dan meneruskan hewan yang dipilih ke `AnimalDetailView`.

Hal paling penting dalam pelajaran ini bukan gaya antarmuka, tetapi memahami jalur penerusan data ini:

```swift
Klik hewan → selectedAnimal menyimpan hewan → Sheet muncul → AnimalDetailView menampilkan detail
```

Setelah memahami jalur ini, Anda bisa membuat lebih banyak fungsi serupa di masa mendatang, misalnya detail produk, detail kursus, detail artikel, detail kontak, dan sebagainya.
