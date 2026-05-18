# Ensiklopedia Haiwan 

Dalam pelajaran ini, kita akan terus berlatih membuat view tersuai dan memindahkan data.

Kita akan membuat satu view ensiklopedia haiwan yang ringkas. Halaman ini akan memaparkan lima haiwan. Apabila pengguna mengetik seekor haiwan, satu view butiran akan muncul untuk memaparkan gambar, kawasan taburan, habitat dan penerangan haiwan tersebut.

Hasil akhir:

![view](../../../Resource/029_view.png)

Melalui contoh ini, kita boleh berlatih cara struktur data, paparan senarai, interaksi klik dan view pop timbul Sheet bekerjasama.

## Sediakan bahan gambar

Pertama, kita perlu menyediakan lima gambar haiwan:

- Dolfin: `dolphin.jpg`
- Zirafah: `giraffe.jpg`
- Singa: `lion.jpg`
- Panda: `panda.jpg`
- Beruang kutub: `polarBear.jpg`

Anda boleh menggunakan bahan gambar berikut:

[Dolfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Zirafah](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Singa](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Beruang kutub](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Selepas memuat turun gambar, seret gambar tersebut ke dalam folder sumber `Assets` dalam projek Xcode.

![assets](../../../Resource/029_assets.png)

Perlu diberi perhatian bahawa ketika menggunakan gambar dalam kod, biasanya kita tidak perlu menulis akhiran `.jpg`.

Contohnya, jika nama sumber gambar ialah `dolphin`, tulis seperti ini dalam kod:

```swift
Image("dolphin")
```

Jika nama gambar tersalah tulis, gambar tidak akan dapat dipaparkan dengan betul.

Nota: Bahan gambar di atas berasal daripada projek Wikimedia. Ketika digunakan, disarankan untuk mengekalkan pautan asal dan maklumat sumber.

## Cipta struktur haiwan

Dalam halaman ini, setiap haiwan mempunyai beberapa maklumat:

- Nama haiwan
- Gambar haiwan
- Emoji haiwan
- Kawasan taburan
- Habitat
- Penerangan haiwan

Jika kita memecahkan maklumat ini kepada banyak pemboleh ubah yang berasingan, kod akan menjadi agak bersepah. Oleh itu, kita boleh mencipta struktur `Animal` untuk meletakkan maklumat seekor haiwan bersama-sama.

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

Dalam kod ini:

- `id`: pengecam unik haiwan.
- `name`: nama haiwan.
- `imageName`: nama gambar haiwan.
- `avatarEmoji`: emoji haiwan.
- `distributionArea`: kawasan taburan.
- `habitat`: habitat.
- `animalDescription`: penerangan haiwan.

Antaranya:

```swift
let id = UUID()
```

`id` digunakan untuk mengenal pasti setiap haiwan. Oleh sebab kemudian kita akan menggunakan `ForEach` untuk memaparkan senarai haiwan, dan juga menggunakan `.sheet(item:)` untuk memunculkan butiran berdasarkan haiwan yang dipilih, `Animal` perlu mematuhi protokol `Identifiable`.

Peranan `Identifiable` adalah untuk memberitahu SwiftUI: setiap haiwan mempunyai `id` yang boleh membezakan identitinya.

## Cipta data haiwan

Seterusnya, kita mencipta satu tatasusunan haiwan dalam `ContentView`.

Tatasusunan ini menyimpan lima `Animal`, dan setiap `Animal` mewakili seekor haiwan.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dolfin
        Animal(
            name: "Dolfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lautan panas dan sederhana di seluruh dunia.",
            habitat: "Lautan, perairan pantai dan beberapa sungai besar.",
            animalDescription: "Dolfin ialah mamalia laut yang pintar. Mereka hidup secara berkumpulan, berkomunikasi menggunakan bunyi dan terkenal dengan tingkah laku yang suka bermain."
        ),
        // Zirafah
        Animal(
            name: "Zirafah",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savana dan kawasan hutan terbuka di Afrika.",
            habitat: "Padang rumput, savana dan hutan terbuka.",
            animalDescription: "Zirafah ialah haiwan darat yang paling tinggi. Mereka mempunyai leher panjang, kaki panjang dan biasanya memakan daun daripada pokok yang tinggi."
        ),
        // Singa
        Animal(
            name: "Singa",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Terutamanya ditemui di Afrika sub-Sahara, dengan populasi kecil di India barat.",
            habitat: "Padang rumput, savana dan kawasan hutan terbuka.",
            animalDescription: "Singa ialah kucing besar yang kuat. Mereka biasanya hidup dalam kumpulan yang dipanggil kawanan dan sering dikenali sebagai raja dunia haiwan."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hutan pergunungan di China tengah.",
            habitat: "Hutan buluh di kawasan pergunungan yang sejuk dan lembap.",
            animalDescription: "Panda ialah beruang yang terkenal dengan bulu hitam putihnya. Mereka terutamanya memakan buluh dan merupakan salah satu haiwan yang paling mudah dikenali di dunia."
        ),
        // Beruang kutub
        Animal(
            name: "Beruang Kutub",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Kawasan Artik di sekitar Kutub Utara.",
            habitat: "Ais laut, kawasan pantai dan persekitaran Artik yang sejuk.",
            animalDescription: "Beruang kutub ialah beruang besar yang menyesuaikan diri dengan persekitaran sejuk. Mereka perenang yang kuat dan terutama bergantung pada ais laut untuk memburu anjing laut."
        )
    ]

    var body: some View {
        Text("Ensiklopedia Haiwan")
    }
}
```

Di sini, `animals` ialah satu tatasusunan:

```swift
let animals: [Animal]
```

`[Animal]` bermaksud tatasusunan ini menyimpan beberapa `Animal`.

Dengan kata lain, `animals` bukan seekor haiwan, tetapi sekumpulan haiwan.

## Paparkan senarai haiwan

Sekarang, kita boleh menggunakan `ForEach` untuk memaparkan senarai haiwan.

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

Hasil paparan:

![view](../../../Resource/029_view1.png)

Dalam kod ini:

```swift
ForEach(animals) { animal in
    ...
}
```

Ini bermaksud menelusuri tatasusunan `animals`.

Setiap kali gelung dijalankan, `animal` mewakili haiwan yang sedang dipaparkan.

Contohnya, pada gelung pertama, `animal` ialah dolfin; pada gelung kedua, `animal` ialah zirafah.

Jadi, kita boleh memaparkan maklumat haiwan semasa dengan cara berikut:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Dengan cara ini, lima haiwan boleh dipaparkan.

## Jadikan senarai haiwan boleh diklik

Sekarang senarai sudah dipaparkan, tetapi masih belum boleh diklik.

Jika kita mahu butiran muncul selepas pengguna mengetik seekor haiwan, kita perlu merekodkan “haiwan yang sedang dipilih” terlebih dahulu.

Oleh itu, tambahkan satu pemboleh ubah keadaan dalam `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Di sini, `selectedAnimal` ialah jenis nilai pilihan `Animal?`.

Ini bermaksud ia mungkin mempunyai seekor haiwan, dan mungkin juga tiada haiwan.

Nilai lalai ialah `nil`, yang bermaksud tiada haiwan dipilih pada permulaan.

Kemudian, kita ubah setiap baris haiwan menjadi `Button`:

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

Fokusnya ialah baris kod ini:

```swift
selectedAnimal = animal
```

Apabila pengguna mengetik seekor haiwan, kita menyimpan haiwan tersebut ke dalam `selectedAnimal`.

Contohnya, jika pengguna mengetik dolfin, `selectedAnimal` akan menyimpan dolfin.

Jika pengguna mengetik panda, `selectedAnimal` akan menyimpan panda.

Dengan kata lain, `selectedAnimal` digunakan untuk merekodkan haiwan yang sedang diklik oleh pengguna.

## View pop timbul Sheet

Sekarang kita sudah boleh menggunakan butang untuk merekodkan “haiwan yang sedang diklik”.

Seterusnya, kita perlu melaksanakan satu view pop timbul untuk memaparkan butiran haiwan.

![view](../../../Resource/029_view2.png)

Dalam SwiftUI, kita boleh menggunakan `Sheet` untuk melaksanakan kesan pop timbul ini.

`Sheet` boleh difahami sebagai halaman sementara yang muncul. Ia dipaparkan di atas halaman semasa, dan selepas pengguna selesai melihat kandungan, pengguna boleh meleret ke bawah untuk menutupnya.

## Contoh Sheet

Sebelum benar-benar memaparkan butiran haiwan, kita gunakan satu contoh ringkas untuk memahami cara `Sheet` muncul.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Tunjukkan Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("View Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Hasil paparan:

![view](../../../Resource/029_view3.png)

Dalam kod ini, kita mencipta satu nilai Boolean:

```swift
@State private var showSheet = false
```

`showSheet` secara lalai ialah `false`, yang bermaksud `Sheet` tidak dipaparkan pada permulaan.

Apabila butang diklik:

```swift
showSheet.toggle()
```

`toggle()` bermaksud menukar nilai Boolean.

Jika asalnya `false`, selepas memanggil `toggle()`, nilainya akan menjadi `true`.

Jika asalnya `true`, selepas memanggil `toggle()`, nilainya akan menjadi `false`.

Jadi, selepas butang diklik, `showSheet` akan berubah daripada `false` kepada `true`.

Apabila `showSheet` menjadi `true`, kod berikut akan memunculkan `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("View Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kod ini bermaksud: apabila `showSheet` ialah `true`, munculkan satu `Sheet`, dan paparkan `Text("View Sheet")` dalam `Sheet` tersebut.

Hasil paparan:

![view](../../../Resource/029_view4.png)

Penulisan seperti ini sesuai untuk memunculkan kandungan tetap.

Contohnya, selepas mengetik butang, munculkan halaman tetapan, halaman penerangan, halaman peringatan dan sebagainya.

### Kedudukan paparan Sheet

Walaupun `Sheet` ialah satu view pop timbul, dalam SwiftUI ia tidak ditulis terus sebagai view berdiri sendiri seperti `Text()` atau `Image()`, tetapi digunakan sebagai pengubah suai view.

Dengan kata lain, `.sheet(...)` adalah serupa dengan pengubah suai seperti `.font()`, `.padding()` dan `.shadow()`, dan perlu ditambahkan selepas sesuatu view.

Contohnya:

```swift
Button("Tunjukkan Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("View Sheet")
}
```

Dalam contoh ini, `.sheet` ditambahkan selepas `Button`.

Apabila `showSheet` menjadi `true`, SwiftUI akan memunculkan `Sheet` dan memaparkan kandungan dalam kurungan kurawal:

```swift
Text("View Sheet")
```

Namun begitu, dalam pembangunan sebenar, jika satu halaman mempunyai beberapa butang, biasanya kita tidak menambahkan satu `.sheet` pada setiap butang.

Cara yang lebih lazim ialah: tambahkan `.sheet` selepas view luar.

Contohnya:

```swift
VStack {
    Button("Tunjukkan Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("View Sheet")
}
```

Butang bertanggungjawab mengubah `showSheet`, manakala view luar bertanggungjawab memunculkan `Sheet` berdasarkan sama ada `showSheet` ialah `true` atau tidak.

## Sheet yang mengikat nilai pilihan

Penulisan yang kita pelajari sebelum ini ialah:

```swift
.sheet(isPresented: $showSheet) {
    Text("View Sheet")
}
```

Penulisan ini sesuai untuk mengawal paparan dan penyembunyian satu halaman tetap.

Tetapi dalam contoh ensiklopedia haiwan, kita bukan sahaja perlu tahu “sama ada `Sheet` muncul”, malah juga perlu tahu “haiwan mana yang diklik”.

Contohnya:

Jika pengguna mengetik dolfin, butiran dolfin sepatutnya dipaparkan dalam `Sheet`.

Jika pengguna mengetik panda, butiran panda sepatutnya dipaparkan dalam `Sheet`.

Jadi, di sini lebih sesuai menggunakan satu lagi penulisan Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Kandungan yang dipaparkan dalam Sheet
}
```

Dalam kod ini, `Sheet` mengikat satu nilai pilihan `selectedAnimal`.

Perlu diberi perhatian bahawa selepas `item:` kita menulis `$selectedAnimal`, bukan `selectedAnimal`.

Ini kerana `Sheet` bukan sekadar membaca nilai `selectedAnimal`, tetapi juga perlu menentukan sama ada perlu muncul berdasarkan perubahannya.

Kod ini boleh difahami seperti berikut:

- Apabila `selectedAnimal` ialah `nil`, `Sheet` tidak dipaparkan.
- Apabila `selectedAnimal` mempunyai nilai, `Sheet` dipaparkan.
- Apabila `Sheet` ditutup, SwiftUI akan menukar `selectedAnimal` kembali kepada `nil`.

SwiftUI akan menghantar haiwan yang disimpan dalam `selectedAnimal` kepada `animal` dalam kurungan kurawal.

Dengan kata lain, `.sheet(item:)` bukan sahaja mengawal pop timbul, tetapi juga menghantar data yang dipilih ke dalam `Sheet`.

## Gunakan Sheet untuk memaparkan nama haiwan

Sekarang, kita jangan tergesa-gesa mencipta view butiran yang kompleks.

Untuk menjadikan kod lebih mudah difahami, kita paparkan dahulu nama haiwan semasa dalam `Sheet`.

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

Bahagian paling penting di sini ialah kod berikut:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Apabila `selectedAnimal` mempunyai nilai, `Sheet` akan muncul.

`animal` dalam kurungan kurawal ialah haiwan yang sedang dipilih.

Jadi:

```swift
Text(animal.name)
```

akan memaparkan nama haiwan yang sedang diklik.

Contohnya, apabila mengetik `Dolfin`, Sheet akan memaparkan `Dolfin`.

Apabila mengetik `Panda`, `Sheet` akan memaparkan `Panda`.

Dengan cara ini, kita telah melaksanakan kesan mengetik haiwan yang berbeza dan memunculkan nama haiwan yang berbeza.

Paparkan nama haiwan:

![view](../../../Resource/029_view5.png)

Namun, butiran haiwan tidak sepatutnya hanya memaparkan satu nama. Ia juga patut memaparkan nama, kawasan taburan, habitat dan penerangan.

Jika semua kod ini ditulis dalam `.sheet`, kod akan menjadi sangat panjang dan tidak mudah dibaca.

Oleh itu, seterusnya kita mencipta view tersuai baharu yang khusus untuk memaparkan butiran haiwan.

## Cipta view butiran haiwan

Seterusnya, kita mencipta view tersuai baharu `AnimalDetailView`.

View ini menerima satu `Animal` dan memaparkan butiran haiwan.

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
                    Text("**Kawasan Taburan** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** ：\(animal.habitat)")

                    Divider()

                    Text("**Penerangan Haiwan** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Hasil paparan:

![view](../../../Resource/029_view2.png)

Fokus di sini ialah:

```swift
var animal: Animal
```

Ini bermaksud `AnimalDetailView` perlu menerima seekor haiwan dari luar.

Selepas menerima haiwan itu, view butiran boleh menggunakan pelbagai maklumat haiwan tersebut:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Dengan kata lain, `AnimalDetailView` hanya bertanggungjawab memaparkan haiwan yang dihantar masuk.

### Teks tebal Markdown

Dalam view butiran, kita menulis kod seperti ini:

```swift
Text("**Habitat:** \(animal.habitat)")
```

Di sini terdapat dua perkara penting.

Pertama, `**Habitat:**` menggunakan sintaks `Markdown`. Teks yang dibalut oleh dua tanda bintang akan dipaparkan dalam bentuk tebal.

Kedua, `\()` ialah interpolasi rentetan, yang boleh memaparkan nilai pemboleh ubah ke dalam teks.

Kod ini bermaksud memaparkan dahulu `Habitat:` dalam bentuk tebal, kemudian memaparkan habitat haiwan tersebut.

## Paparkan view butiran dalam Sheet

Selepas mencipta `AnimalDetailView`, kita boleh kembali ke `ContentView` dan menggantikan view nama asal dalam `Sheet` dengan view butiran.

Asalnya:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kini ditukar kepada:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Di sini, `animal:` ialah nama parameter `AnimalDetailView`.

`animal` selepasnya ialah haiwan semasa yang dihantar masuk oleh `.sheet(item:)`.

Iaitu, haiwan yang sedang diklik dihantar kepada `AnimalDetailView` untuk dipaparkan.

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

Apabila pengguna mengetik haiwan:

```swift
selectedAnimal = animal
```

`selectedAnimal` berubah daripada `nil` kepada haiwan tertentu. Selepas `Sheet` mengesan bahawa `selectedAnimal` mempunyai nilai, ia akan memunculkan view.

`Sheet` menghantar haiwan dalam `selectedAnimal` kepada view `AnimalDetailView`, lalu `AnimalDetailView` memaparkan butiran haiwan.

Dengan cara ini, kita telah melaksanakan fungsi mengetik senarai haiwan dan memunculkan butiran haiwan yang sepadan.

## Perbezaan antara dua penulisan Sheet

Sekarang, kita telah menggunakan `.sheet(item:)` untuk melengkapkan paparan view butiran haiwan.

Di sini, kita boleh merumuskan secara ringkas dua penulisan `Sheet` yang biasa digunakan.

### Jenis pertama ialah mengikat nilai Boolean

```swift
@State private var showSheet = false

Button("Tunjukkan Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("View Sheet")
}
```

Penulisan ini sesuai untuk memunculkan kandungan tetap, contohnya halaman tetapan, halaman penerangan, halaman peringatan dan sebagainya.

`showSheet` ialah nilai Boolean yang hanya mempunyai dua keadaan: `true` dan `false`.

Apabila `showSheet` ialah `true`, `Sheet` dipaparkan.

Apabila `showSheet` ialah `false`, `Sheet` tidak dipaparkan.

### Jenis kedua ialah mengikat nilai pilihan

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Penulisan ini sesuai untuk memunculkan kandungan berbeza berdasarkan data yang dipilih.

Dalam pelajaran ini, kita mengetik haiwan yang berbeza dan perlu memaparkan butiran haiwan yang berbeza. Oleh itu, penggunaan `.sheet(item:)` lebih sesuai.

## Kod lengkap

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nama haiwan
    let name: String
    
    // Gambar haiwan
    let imageName: String
    
    // Emoji haiwan
    let avatarEmoji: String
    
    // Kawasan taburan
    let distributionArea: String
    
    // Habitat
    let habitat: String
    
    // Penerangan haiwan
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dolfin
        Animal(
            name: "Dolfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lautan panas dan sederhana di seluruh dunia.",
            habitat: "Lautan, perairan pantai dan beberapa sungai besar.",
            animalDescription: "Dolfin ialah mamalia laut yang pintar. Mereka hidup secara berkumpulan, berkomunikasi menggunakan bunyi dan terkenal dengan tingkah laku yang suka bermain."
        ),
        // Zirafah
        Animal(
            name: "Zirafah",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savana dan kawasan hutan terbuka di Afrika.",
            habitat: "Padang rumput, savana dan hutan terbuka.",
            animalDescription: "Zirafah ialah haiwan darat yang paling tinggi. Mereka mempunyai leher panjang, kaki panjang dan biasanya memakan daun daripada pokok yang tinggi."
        ),
        // Singa
        Animal(
            name: "Singa",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Terutamanya ditemui di Afrika sub-Sahara, dengan populasi kecil di India barat.",
            habitat: "Padang rumput, savana dan kawasan hutan terbuka.",
            animalDescription: "Singa ialah kucing besar yang kuat. Mereka biasanya hidup dalam kumpulan yang dipanggil kawanan dan sering dikenali sebagai raja dunia haiwan."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Hutan pergunungan di China tengah.",
            habitat: "Hutan buluh di kawasan pergunungan yang sejuk dan lembap.",
            animalDescription: "Panda ialah beruang yang terkenal dengan bulu hitam putihnya. Mereka terutamanya memakan buluh dan merupakan salah satu haiwan yang paling mudah dikenali di dunia."
        ),
        // Beruang kutub
        Animal(
            name: "Beruang Kutub",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Kawasan Artik di sekitar Kutub Utara.",
            habitat: "Ais laut, kawasan pantai dan persekitaran Artik yang sejuk.",
            animalDescription: "Beruang kutub ialah beruang besar yang menyesuaikan diri dengan persekitaran sejuk. Mereka perenang yang kuat dan terutama bergantung pada ais laut untuk memburu anjing laut."
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
                    Text("**Kawasan Taburan** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Penerangan Haiwan** ：\(animal.animalDescription)")
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

Dalam pelajaran ini, kita telah menyelesaikan satu halaman ensiklopedia haiwan yang ringkas.

Mula-mula, kita menggunakan struktur `Animal` untuk menyimpan maklumat haiwan, kemudian menggunakan tatasusunan untuk menyimpan lima haiwan, dan seterusnya menggunakan `ForEach` untuk memaparkan senarai haiwan.

Apabila pengguna mengetik seekor haiwan, kita menyimpan haiwan tersebut ke dalam `selectedAnimal`:

```swift
selectedAnimal = animal
```

Apabila `selectedAnimal` mempunyai nilai, `.sheet(item:)` akan memunculkan view butiran dan menghantar haiwan yang dipilih kepada `AnimalDetailView`.

Perkara paling penting dalam pelajaran ini bukanlah gaya antara muka, tetapi memahami laluan pemindahan data ini:

```swift
Ketik haiwan → selectedAnimal menyimpan haiwan → Sheet muncul → AnimalDetailView memaparkan butiran
```

Selepas memahami laluan ini, anda boleh membuat lebih banyak fungsi yang serupa pada masa hadapan, contohnya butiran produk, butiran kursus, butiran artikel, butiran kenalan dan sebagainya.
