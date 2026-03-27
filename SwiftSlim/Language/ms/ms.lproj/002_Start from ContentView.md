# Bermula dari ContentView

## Persediaan sebelum kelas

Dalam pelajaran ini, kita akan bermula dengan fail `ContentView.swift` dan mengenali secara sistematik struktur asas SwiftUI, termasuk:

- komen
- struktur View
- susun atur VStack / HStack / ZStack
- ikon SF Symbols
- pengubah view（modifier）
- kod pratonton `#Preview`

Mula-mula, cari projek Xcode yang telah dicipta sebelum ini dan klik dua kali fail `.xcodeproj`.

Di kawasan Navigator sebelah kiri, pilih fail `ContentView.swift`.

Perhatian: Setiap kali projek dibuka, Canvas mungkin memaparkan "Preview paused". Klik butang muat semula untuk memulihkan pratonton.

![Swift](../../RESOURCE/002_view7.png)

## Mengenali ContentView

Kod `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Walaupun kodnya tidak banyak, ia sudah mengandungi struktur teras SwiftUI.

### 1. Komen

Bahagian atas fail:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Ini ialah komen fail yang digunakan untuk merekod maklumat fail, termasuk nama fail, nama projek, pencipta dan masa penciptaan.

Dalam Swift, `//` digunakan untuk komen satu baris:

```swift
// Ini ialah komen
```

Komen boleh meningkatkan kebolehbacaan kod dan membantu pembangun memahami logik kod.

Dalam pembangunan sebenar, kod kadangkala boleh menjadi sukar difahami. Jika tiada komen, anda mungkin menghadapi situasi di mana tiga hari kemudian anda sendiri tidak lagi faham kod yang ditulis.

Oleh itu, membiasakan diri menambah komen semasa menulis kod ialah tabiat pembangunan yang baik. Menggunakan komen untuk merekod logik kod akan memudahkan penyelenggaraan kod pada masa hadapan.

**Menyekat kod buat sementara**

Komen juga boleh digunakan untuk menyekat kod buat sementara, bagi membantu kita menyiasat masalah.

Contohnya:

```
A
B
C
```

A、B、C ialah tiga bahagian kod. Jika salah satu daripadanya mempunyai ralat, kita boleh menambah komen buat sementara untuk menyiasat.

Mula-mula tambah komen pada A:

```
// A
B
C
```

Jika selepas A dikomen, kod kembali normal, ini bermaksud ada masalah pada kod A.

Jika selepas A dikomen masalah masih wujud, kita boleh mengomen B pula, dan seterusnya, sehingga kod bermasalah ditemui.

Dalam proses pembangunan, kita akan menghadapi banyak masalah. Kebanyakannya perlu disiasat dengan mengomen kod. Ini membantu kita mengenal pasti lokasi masalah dan mencari BUG.

Dalam Xcode, anda boleh menggunakan pintasan papan kekunci:

```
Command ⌘ + /
```

untuk menambah atau memadam komen dengan cepat.

### 2. Mengimport rangka kerja SwiftUI

```swift
import SwiftUI
```

Kod ini bermaksud mengimport rangka kerja SwiftUI.

Jenis seperti `View`、`Text`、`Image`、`VStack` dalam SwiftUI semuanya datang daripada rangka kerja ini.

Jika rangka kerja SwiftUI tidak diimport, Xcode akan memaparkan ralat:

```
Cannot find type 'View' in scope
```

Ini bermaksud penyusun tidak dapat mengenali jenis `View`.

### 3. Struktur View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Kali pertama melihat struktur `View` ini, anda mungkin berasa asing kerana ia mengandungi kata kunci seperti `struct`、`View`、`var`、`body`、`some`.

Buat masa ini kita belum mempelajari kata kunci ini. Anda hanya perlu tahu bahawa maksud kod ini ialah mencipta satu view bernama `ContentView`.

Anda boleh menganggap `View` sebagai satu papan lukisan, dan kita boleh melukis di atasnya menggunakan alat bernama SwiftUI.

Contohnya:

![Swift](../../RESOURCE/002_view.png)

Gambar di atas memaparkan tiga halaman, dan pada hakikatnya ia ialah tiga `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Apabila kita membangunkan App menggunakan SwiftUI, setiap halaman pada dasarnya ialah satu `View`.

### 4. Kod SwiftUI

Di dalam `View`, kita melihat kod SwiftUI berikut:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Kod SwiftUI ini bermaksud: ini ialah satu susun atur menegak yang memaparkan satu ikon dan satu teks.

![Swift](../../RESOURCE/002_view1.png)

#### Susun atur VStack

```swift
VStack { }  // Susun atur menegak
```

`VStack` bermaksud bekas susun atur menegak. View di dalamnya akan disusun dari atas ke bawah.

![Swift](../../RESOURCE/002_view8.png)

Tiga jenis susun atur yang biasa dalam SwiftUI:

- VStack —— susunan menegak
- HStack —— susunan mendatar
- ZStack —— susunan bertindih（paksi Z）

```swift
HStack { }  // Susunan mendatar
ZStack { }  // Susunan bertindih
```

Rajah susunan setiap susun atur:

![Swift](../../RESOURCE/002_view2.png)

Contohnya, gunakan `HStack` untuk susunan mendatar:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Anda boleh melihat ikon glob dan teks dipaparkan secara mendatar.

![Swift](../../RESOURCE/002_view3.png)

Apabila kita mahu menyusun secara mendatar, kita gunakan `HStack`. Apabila perlu susunan bertindih, kita gunakan `ZStack`.

#### Image dan SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Kod ini memaparkan satu ikon glob, dan ikon glob ini datang daripada sistem ikon SF Symbols milik Apple.

![Swift](../../RESOURCE/002_view9.png)

Maksud kod ini ialah memaparkan satu ikon glob, bersaiz besar, dengan warna aksen.

Selain ikon glob, kita juga boleh memaparkan ikon lain.

Contohnya, memaparkan sebuah beg galas:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Bagaimana memaparkan ikon lain?**

Kita perlu menggunakan perpustakaan ikon sistem rasmi Apple iaitu SF Symbols.

Buka laman web rasmi Apple Developer dan muat turun [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Buka aplikasi SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Bahagian kiri menunjukkan kategori simbol, dan bahagian kanan memaparkan ikon yang berkaitan.

Klik kanan pada ikon dan pilih “Salin 1 nama”, dan nama itu ialah kandungan rentetan yang sepadan.

Contohnya:

```
"globe"
"backpack"
"heart"
```

Masukkan nama ikon yang disalin ke dalam `Image(systemName:)`, maka ikon yang berbeza boleh dipaparkan.

Perhatian: Setiap ikon SF Symbols mempunyai versi sistem minimum yang disokong. Jika versi sistem terlalu rendah, ikon tersebut mungkin tidak dapat dipaparkan. Semak maklumat keserasian dalam aplikasi SF Symbols.

#### Modifier

Dalam SwiftUI, modifier ialah satu kaedah yang digunakan untuk mengubah penampilan atau tingkah laku sesuatu view.

Anda boleh menganggap modifier seperti pakaian. Dengan pakaian yang berbeza, rupa yang dipaparkan juga akan berbeza.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` dan `foregroundStyle` ialah modifier bagi view `Image`. Ia mengubah view `Image` tanpa mengubah kandungan asal `Image`.

**1. imageScale**

```swift
.imageScale(.large)
```

Ia boleh mengawal saiz ikon SF Symbols:

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

Kita boleh menukar pilihan yang berbeza untuk membuat simbol SF Symbols dipaparkan pada saiz yang berbeza.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` boleh mengawal warna hadapan.

`.tint` bermaksud warna aksen (accent color) bagi persekitaran semasa, dan secara lalai pada iOS ia berwarna biru.

Jika kita mahu menukar warna hadapan kepada merah:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view10.png)

#### View Text

`Text` ialah view teks, digunakan untuk memaparkan rentetan.

```swift
Text("Hello, world!")
```

Contohnya, memaparkan nama saya:

```swift
Text("FangJunyu")
```

Perhatian: Rentetan mesti dibungkus dengan tanda petik berganda `""`.

Anda boleh cuba memaparkan nama anda, nombor telefon dan kandungan lain.

#### padding jarak tepi

Dalam SwiftUI, `padding` digunakan untuk menambah ruang kosong di antara kandungan view dan sempadannya. Ia tergolong dalam “jarak dalaman（padding / content inset）”.

```swift
HStack {
    ...
}
.padding()
```

Kod di atas bermaksud menambah jarak tepi lalai sistem pada view `HStack`.

**Apakah itu padding?**

`padding` bermaksud “ruang kosong di antara kandungan view dan sempadannya”.

Dalam gambar di bawah, selepas `HStack` berwarna biru ditetapkan dengan `padding`, kawasan biru akan mengecil ke dalam, dan kelihatan seperti “menjadi lebih kecil satu lapisan”.

![Swift](../../RESOURCE/002_view6.png)

**Jarak tepi lalai**

Modifier `padding()` secara lalai menggunakan jarak standard yang disyorkan oleh sistem.

```swift
.padding()
```

Nilai ini boleh berbeza mengikut platform dan konteks, contohnya:

- pada iOS biasanya kira-kira 16 pt
- pada macOS atau watchOS, jarak standard sistem mungkin berbeza, sama ada lebih besar atau lebih kecil, bergantung pada garis panduan reka bentuk platform tersebut

**Jarak tepi tersuai**

Kita juga boleh menetapkan jarak tepi secara berasingan untuk sesuatu view.

1. Tetapkan satu arah

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Penerangan arah:

- .top: jarak atas
- .bottom: jarak bawah
- .leading: jarak bahagian hadapan
- .trailing: jarak bahagian belakang

![Swift](../../RESOURCE/002_view12.png)

Perhatian: `leading` dan `trailing` akan menyesuaikan diri secara automatik mengikut arah bahasa. Contohnya, dalam persekitaran bahasa Arab（RTL）, ia akan diterbalikkan secara automatik.

2. Tetapkan beberapa arah serentak

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Anda boleh menggunakan array untuk menetapkan beberapa arah serentak. Cara penggunaan array akan diterangkan secara terperinci dalam tutorial seterusnya. Buat masa ini, memadai sekadar mengetahui bentuk penulisan ini.

3. Tetapkan arah mendatar atau arah menegak

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Ini bersamaan dengan:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Membuang jarak tepi**

Jika anda tidak mahu sebarang jarak tepi, anda boleh menggunakan `.padding(0)` untuk membuangnya:

```swift
.padding(0)
```

Atau terus padam modifier `padding`:

```swift
// .padding()
```

### 6. Kod pratonton Preview

```swift
#Preview {
    ContentView()
}
```

Kod ini bermaksud menghasilkan pratonton view `ContentView` di Canvas.

Perhatian: `#Preview` ialah sintaks baharu yang diperkenalkan dalam Swift 5.9 / Xcode 15. Sebelum ini, struktur `PreviewProvider` digunakan.

**Apa akan berlaku jika Preview dikomen?**

Jika `Preview` dikomen:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas tidak lagi akan memaparkan kandungan yang boleh dirender.

![Swift](../../RESOURCE/002_xcode.png)

Ini kerana `#Preview` mengawal paparan view pratonton di Canvas.

Apabila kita perlu mempratonton SwiftUI view dalam Xcode, kita menambah kod pratonton `#Preview`. Jika pratonton tidak diperlukan, kod pratonton `#Preview` boleh dikomen atau dipadamkan.

## Ringkasan

Dalam pelajaran ini, kita telah mengenali struktur asas `ContentView.swift`, termasuk komen, pengimportan rangka kerja, struktur `View`, susun atur asas SwiftUI, ikon SF Symbols, modifier dan kod pratonton `#Preview`.

Walaupun kod dalam fail `ContentView.swift` tidak banyak, sebenarnya ia merangkumi beberapa konsep teras SwiftUI. Bagi pemula, kod ini mungkin kelihatan asing, tetapi dengan memecahkan struktur kod, kita boleh membina pemahaman awal tentang SwiftUI.

Imbas kembali kandungan pelajaran ini: mula-mula kita mempelajari komen `//`, yang boleh digunakan untuk menerangkan logik kod atau menyekat kod buat sementara.

Seterusnya, kita memahami bahawa fail SwiftUI mesti mengimport rangka kerja SwiftUI:

```swift
import SwiftUI
```

Jika rangka kerja ini tidak diimport, penyusun tidak akan dapat mengenali jenis seperti `View`.

Kemudian, kita mengenali struktur asas SwiftUI view:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Di sini, `ContentView` ialah nama view.

Kita juga mempelajari tiga bekas susun atur yang biasa digunakan: `VStack`（susunan menegak）、`HStack`（susunan mendatar）dan `ZStack`（susunan bertindih）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Kod ini menunjukkan satu bekas susunan menegak yang memaparkan satu ikon dan satu teks.

`Image` boleh memaparkan ikon SF Symbols, dan saiz serta warna ikon boleh dikawal melalui modifier.

View `Text` boleh memaparkan kandungan teks.

`padding` ialah jarak tepi, yang menambah ruang telus di sekeliling view.

Akhir sekali ialah view pratonton `#Preview`, yang boleh memaparkan view pratonton di Canvas.

### Latihan selepas kelas

Bagi pemula, kandungan pelajaran ini mungkin agak kompleks. Kita boleh memperdalam pemahaman dengan latihan lanjut:

1. Tukar nama ikon SF Symbols
2. Tukar warna hadapan ikon kepada hitam
3. Tukar `VStack` kepada `HStack`
4. Komen `Image` atau `Text`, dan perhatikan perubahan view pratonton

### Telur Paskah: pelengkapan kod（Code Completion）

Semasa menaip kod, anda yang teliti mungkin sudah perasan bahawa Xcode akan memaparkan senarai pilihan yang tersedia secara automatik.

Contohnya, apabila kita mengubah modifier `imageScale`:

```swift
.imageScale(.)
```

Xcode akan memaparkan pilihan yang tersedia:

![Swift](../../RESOURCE/002_view10.png)

Ini ialah mekanisme pelengkapan kod（Code Completion）. Ia berdasarkan type inference dan petunjuk ahli enumerasi, dan boleh meningkatkan kecekapan menaip serta mengurangkan ralat.

Dalam pelajaran seterusnya, kita akan memperkenalkan enum secara rasmi. Buat masa ini, memadai sekadar mengenalinya secara ringkas.
