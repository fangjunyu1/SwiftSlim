# Karusel kata-kata hikmah

Dalam pelajaran ini, kita akan melaksanakan fungsi “karusel kata-kata hikmah”, dan pada masa yang sama mendalami pengetahuan asas Swift seperti array（`Array`）dan kenyataan penghakiman bersyarat（`if-else`）。

Kita akan menunjukkan cara menyimpan beberapa kata-kata hikmah, dan merealisasikan putaran berulang kata-kata hikmah melalui interaksi butang.

![alt text](../../RESOURCE/011_word.png)

## Memaparkan kata-kata hikmah

Mula-mula, kita perlu memaparkan satu kata-kata hikmah dalam SwiftUI.

Cara yang paling mudah ialah menggunakan view `Text`：

```swift
Text("Slow progress is still progress.")
```

Kod ini hanya dapat memaparkan satu kata-kata hikmah yang tetap. Jika kita mahu memaparkan beberapa kata-kata hikmah dan membolehkan pertukaran, kita perlu menyimpan kata-kata hikmah tersebut.

Tetapi pembolehubah rentetan biasa hanya boleh menyimpan satu kata-kata hikmah:

```swift
let sayings = "Slow progress is still progress."
```

Jika kita mahu menyimpan beberapa kata-kata hikmah, kita perlu mengisytiharkan satu pembolehubah bagi setiap kata-kata hikmah:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Namun dalam pembangunan sebenar, cara ini bukan sahaja rumit, malah kerana setiap pembolehubah adalah bebas, kita tidak dapat melaksanakan pertukaran karusel secara fleksibel.

Untuk memudahkan pengurusan beberapa kata-kata hikmah, kita perlu menggunakan satu struktur data untuk menyimpannya bersama-sama, iaitu array（`Array`）。

Selepas menggunakan array, kod di atas boleh ditulis sebagai:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Petua: Dalam konvensyen pengaturcaraan, nama pembolehubah array yang menyimpan beberapa elemen biasanya menggunakan bentuk jamak, contohnya `sayings`, supaya mencerminkan ciri himpunannya.**

## Array

Dalam Swift, array ialah koleksi elemen yang tersusun, dan ia diwakili menggunakan kurungan siku `[]`。

```swift
[]
```

Di dalam array boleh mengandungi beberapa elemen daripada jenis yang sama, dan elemen-elemen tersebut dipisahkan dengan koma Inggeris `,`。

Contohnya:

```swift
[101, 102, 103, 104, 105]
```

Array boleh difahami secara ringkas sebagai satu rangkaian gerabak kereta api:

![Array](../../RESOURCE/011_array1.png)

Keseluruhan kereta api mewakili objek array ini, dan setiap gerabak disusun mengikut turutan.

### Indeks dan akses elemen

Disebabkan array tersusun, sistem boleh menentukan elemen tertentu dalam array mengikut urutan. Mekanisme penentuan ini dipanggil indeks（Index）。

Dalam Swift（dan kebanyakan bahasa pengaturcaraan）, indeks array bermula dari `0`，bukan `1`。Ini bermaksud elemen pertama dalam array mempunyai indeks `0`，elemen kedua mempunyai indeks `1`，dan seterusnya.

![Array](../../RESOURCE/011_array2.png)

Jika anda mahu mengakses elemen tertentu dalam array, anda hanya perlu menambah kurungan siku selepas nama array, dan isikan nilai indeks elemen sasaran di dalamnya.

Contohnya:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Jika anda cuba mengakses indeks yang melebihi julat sah array, akan berlaku masalah “Index Out of Range”。Oleh itu, semasa mengakses array, kita perlu berhati-hati dan memastikan indeks berada dalam julat yang sah.

**Indeks melebihi julat**

Contohnya, apabila array hanya mempunyai 5 elemen, julat indeks sah ialah 0 hingga 4. Jika kita cuba mengakses `sayings[5]`，program tidak akan dapat mencari “gerabak” yang sepadan, lalu menyebabkan ralat “Index Out of Range” dan mengakibatkan aplikasi terhenti.

![Array](../../RESOURCE/011_array3.png)

### Mengendalikan array

Array bukan sahaja menyokong definisi statik, malah juga menyokong operasi seperti menambah, memadam, mengubah elemen dan mendapatkan panjang array.

Petua: Jika anda perlu mengubah array, anda mesti menggunakan `var` untuk mengisytiharkan pembolehubah, bukannya pemalar `let`。

**1. Menambah elemen**

Anda boleh menggunakan kaedah `append` untuk menambah elemen di hujung array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Memadam elemen**

Melalui kaedah `remove(at:)`，kita boleh memadam elemen tertentu dalam array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Mengubah elemen**

Gunakan indeks secara terus untuk mengubah elemen array:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Mengira panjang array**

Gunakan sifat `count` untuk mendapatkan jumlah elemen dalam array:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Menggunakan array untuk memaparkan kata-kata hikmah

Untuk memaparkan beberapa kata-kata hikmah, kita boleh menyimpannya ke dalam array, kemudian mengakses dan memaparkannya melalui indeks.

Mula-mula, cipta satu array `sayings` dalam `ContentView` untuk menyimpan kata-kata hikmah, kemudian baca dan paparkan kata-kata hikmah yang sepadan melalui indeks dalam view `Text`：

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Di sini, `sayings[0]` mewakili kata-kata hikmah pertama dalam array.

Jika anda mahu memaparkan kata-kata hikmah yang berbeza, anda hanya perlu mengubah nilai indeks di dalam kurungan siku:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Mentakrifkan indeks kata-kata hikmah

Untuk merealisasikan kesan pertukaran kata-kata hikmah secara dinamik, kita tidak boleh “menulis tetap” indeks di dalam view `Text`。

Kita perlu mencipta satu pembolehubah untuk menyimpan nilai indeks yang sedang dipaparkan.

Dalam SwiftUI, kita boleh menggunakan `@State` untuk mengisytiharkan indeks yang boleh berubah:

```swift
@State private var index = 0
```

SwiftUI akan memantau pembolehubah yang dibungkus dengan `@State`。Apabila `index` berubah, SwiftUI akan merender semula view dan memaparkan kata-kata hikmah yang sepadan.

Seterusnya, kita gunakan `sayings[index]` untuk mendapatkan kata-kata hikmah dalam array secara dinamik:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Apabila nilai `index` berubah, `Text` akan memaparkan kata-kata hikmah yang berbeza.

### Menggunakan butang untuk mengawal indeks

Untuk mengawal pertukaran kata-kata hikmah, kita boleh menggunakan `Button` untuk mengubah nilai `index`。Setiap kali butang ditekan, `index` akan bertambah 1 secara automatik:

```swift
Button("Next") {
    index += 1
}
```

Apabila kita menekan butang, nilai `index` akan berubah daripada 0 kepada 1, lalu mencetuskan penyegaran view, dan `Text(sayings[index])` akan membaca kata-kata hikmah seterusnya.

Namun di sini terdapat satu masalah berpotensi: jika butang ditekan berterusan, `index` akan meningkat sehingga melebihi julat array, lalu menyebabkan ralat indeks array melebihi julat. Contohnya, apabila `index` mencapai 5（sedangkan julat indeks array ialah 0 hingga 4），program akan terhenti.

Untuk mengelakkan indeks array melebihi julat, kita perlu memperkenalkan kawalan bersyarat agar `index` tidak melepasi julat array. Kita boleh menggunakan kenyataan `if-else` untuk menentukan sama ada `index` lebih kecil daripada panjang array.

## Kawalan bersyarat: kenyataan if-else

Kenyataan `if-else` ialah kenyataan cabang bersyarat yang paling biasa digunakan dalam Swift. Ia digunakan untuk menentukan sama ada satu syarat dipenuhi atau tidak, lalu melaksanakan blok kod yang berbeza mengikut benar atau salahnya syarat tersebut.

Struktur asas:

```swift
if condition {
    // Kod yang dijalankan apabila condition bernilai true
} else {
    // Kod yang dijalankan apabila condition bernilai false
}
```

Dalam kenyataan `if`，syarat `condition` ialah nilai Boolean（jenis `Bool`），yang boleh berupa `true` atau `false`。Apabila syarat bernilai `true`，kod dalam bahagian `if` akan dijalankan; jika tidak, kod dalam bahagian `else` akan dijalankan.

Contohnya:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Dalam contoh ini, nilai `age` ialah 25. Kenyataan `if` menentukan sama ada `age > 18` dipenuhi. Disebabkan syarat dipenuhi, `"Big Boy"` akan dipaparkan.

Jika anda tidak memerlukan bahagian `else`，anda boleh menggugurkannya:

```swift
if condition {
    // Kod yang dijalankan apabila condition bernilai true
}
```

### Menggunakan syarat untuk mengawal julat indeks

Untuk mengelakkan indeks array melebihi julat, kita boleh menggunakan kenyataan `if` untuk memastikan `index` tidak melangkaui julat array:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analisis logik: nilai `sayings.count` ialah 5（terdapat 5 kata-kata hikmah）, maka nilai `sayings.count - 1` ialah 4, dan itu juga merupakan indeks sah terakhir dalam array.

Apabila `index` kurang daripada 4, adalah selamat untuk melakukan operasi tambah 1 apabila butang ditekan; apabila `index` mencapai 4, syarat tidak lagi dipenuhi, dan menekan butang tidak akan memberi sebarang tindak balas.

Sekarang, kod ini telah merealisasikan fungsi pertukaran kata-kata hikmah:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Kitaran kata-kata hikmah

Jika kita mahu selepas memaparkan kata-kata hikmah terakhir, apabila butang ditekan sekali lagi ia kembali memaparkan kata-kata hikmah pertama, lalu merealisasikan paparan berulang kata-kata hikmah, kita boleh melakukannya melalui bahagian `else`：

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Apabila butang ditekan, jika `index` telah mencapai elemen terakhir array, `index` akan ditetapkan semula kepada 0, lalu mula memaparkan kata-kata hikmah secara berulang.

## Mengoptimumkan view kata-kata hikmah

Kini, logik karusel kata-kata hikmah kita telah siap, tetapi kita masih boleh mengoptimumkan antara muka supaya kelihatan lebih cantik.

Kod lengkap:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Dalam contoh ini, view `Text` telah ditambah dengan latar belakang putih separa telus dan sudut bulat, butang menggunakan gaya `.borderedProminent`，manakala `VStack` ditetapkan dengan gambar latar belakang.

Tambahan pengetahuan: apabila modifier `background()` digunakan untuk mengendalikan latar belakang imej, tingkah laku lalainya ialah cuba memenuhi kawasan susun atur view semasa sebanyak mungkin. Dalam banyak keadaan, ia secara semula jadi boleh melanjut sehingga meliputi Safe Area（kawasan selamat）。

Sekarang, kita telah berjaya melaksanakan view karusel kata-kata hikmah.

![SwiftUI View](../../RESOURCE/011_word.png)

## Ringkasan

Melalui pelajaran ini, kita telah menguasai cara menggunakan array untuk menyimpan beberapa kata-kata hikmah, serta menggunakan `if` dan `if-else` untuk merealisasikan karusel kata-kata hikmah.

Kita juga memahami operasi asas array, seperti menambah, memadam, mengubah elemen, serta cara mencegah indeks array daripada melebihi julat.

Pelajaran ini bukan sahaja menerangkan pelaksanaan fungsi karusel kata-kata hikmah, tetapi juga menggabungkan penggunaan asas array dan kenyataan bersyarat, membantu kita menguasai keupayaan memproses data dan mengawal aliran program.

## Pengetahuan lanjutan - Penghakiman berbilang syarat: kenyataan if-else if-else

Dalam pembangunan sebenar, kita sering perlu mengendalikan beberapa syarat. Sebagai contoh, dalam sesuatu permainan, apabila skor sama dengan 1, peristiwa A dicetuskan; sama dengan 2, peristiwa B dicetuskan; sama dengan 3, peristiwa C dicetuskan, dan seterusnya.

Apabila berdepan dengan situasi yang mempunyai lebih daripada dua cabang bersyarat, kita perlu menggunakan kenyataan `if-else if-else` untuk membuat penghakiman berbilang.

Sintaks asas:

```swift
if conditionA {
    // Kod yang dijalankan apabila conditionA bernilai true
} else if conditionB {
    // Kod yang dijalankan apabila conditionB bernilai true
} else if conditionC {
    // Kod yang dijalankan apabila conditionC bernilai true
} else {
    // Kod yang dijalankan apabila semua syarat tidak dipenuhi
}
```

Dalam keadaan ini, program akan memeriksa syarat mengikut turutan dan melaksanakan syarat pertama yang dipenuhi. Jika tiada syarat dipenuhi, maka kod selepas `else` akan dilaksanakan.

Dalam karusel kata-kata hikmah, kita juga boleh menggunakan kenyataan `if-else if-else` untuk membuat penghakiman berbilang:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Apabila `index` bernilai 0、1、2、3，setiap kali butang ditekan, `index += 1` akan dijalankan. Apabila `index` bernilai 4（elemen terakhir）, `index` akan ditetapkan semula kepada 0 untuk merealisasikan kitaran.

Cabang `else` digunakan sebagai perlindungan akhir, bagi mengelakkan nilai yang tidak sah muncul（contohnya `index` diubah secara salah）。

Perlu diperhatikan bahawa `==` di sini bermaksud menguji “sama atau tidak”。Jika kenyataan `if` menentukan bahawa `index` sama dengan nombor tertentu, ia akan mengembalikan `true` dan melaksanakan blok kod selepasnya. Jika tidak sama, maka penghakiman akan diteruskan ke kenyataan `if` seterusnya.

Penghakiman berbilang seperti ini bermanfaat untuk melaksanakan kod yang berbeza dalam situasi syarat yang berbeza.
