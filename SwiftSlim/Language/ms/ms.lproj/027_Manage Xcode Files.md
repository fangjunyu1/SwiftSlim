# Mengurus Fail Xcode

Dalam pelajaran ini, kita akan belajar operasi fail yang biasa digunakan dalam Xcode.

Dalam pelajaran sebelum ini, kebanyakan kod kita ditulis di dalam `ContentView`. Ini memudahkan kita melihat kod dan kesan paparan.

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Namun, dalam App sebenar, biasanya kita tidak meletakkan semua kod di dalam satu fail.

Apabila halaman, komponen dan fungsi semakin banyak, kita perlu memisahkan view yang berbeza ke dalam fail SwiftUI yang berbeza.

Contohnya:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Dengan cara ini, struktur kod menjadi lebih jelas, dan lebih mudah untuk diselenggara serta diubah kemudian.

## Mengapa perlu mengurus fail

Dalam SwiftUI, satu halaman atau satu komponen biasanya boleh ditulis sebagai satu fail view yang berasingan.

Contohnya:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Di sini, `CardView` ialah satu view SwiftUI.

Jika semua view ditulis di dalam `ContentView`, kod akan menjadi semakin panjang dan semakin sukar dibaca.

Oleh itu, kita perlu belajar cara mencipta fail, menamakan semula fail, memadam fail, serta menggunakan folder untuk mengurus fail kod yang berbeza.

## Mencipta fail SwiftUI

Dalam Xcode, terdapat dua cara yang biasa digunakan untuk mencipta fail SwiftUI:

Satu cara ialah mencipta fail kosong, kemudian menulis kod sendiri.

Cara lain ialah mencipta fail templat SwiftUI, dan Xcode akan menjana kod asas secara automatik.

Untuk pemula, lebih disarankan menggunakan fail templat SwiftUI, kerana ia akan menjana struktur asas secara automatik.

### Mencipta fail kosong

Di kawasan Navigator di sebelah kiri Xcode, klik kanan pada ruang kosong atau folder, kemudian pilih `New Empty File`.

Lokasi operasi adalah seperti berikut:

![xcode](../../../Resource/027_view1.png)

Selepas mencipta fail kosong, Xcode biasanya akan menjana fail Swift tanpa nama, contohnya `Untitled.swift`.

Kita boleh menamakannya semula kepada `TestView.swift`.

Dalam projek SwiftUI, jika fail ini digunakan untuk memaparkan satu view, biasanya disarankan menambah `View` di bahagian akhir nama.

Contohnya:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Ini bukan peraturan wajib, tetapi ia membolehkan kita melihat dengan cepat bahawa ini ialah fail view.

Selepas mencipta fail kosong, fail itu mungkin hanya mengandungi komen lalai, atau mungkin kosong, bergantung pada versi Xcode dan cara penciptaan.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Pada masa ini, kita perlu menulis kod SwiftUI secara manual:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Dengan ini, satu fail view SwiftUI yang ringkas telah berjaya dicipta.

### Menamakan semula fail

Jika selepas mencipta fail anda mahu mengubah nama fail, anda boleh memilih fail di kawasan Navigator di sebelah kiri Xcode, kemudian tekan kekunci Enter `⏎`.

![xcode](../../../Resource/027_view2.png)

Dengan cara ini, nama fail boleh diubah.

Perlu diberi perhatian bahawa menukar nama fail tidak akan menukar nama view di dalam kod secara automatik.

Contohnya, selepas nama fail ditukar kepada `ProfileView.swift`, kod di dalamnya mungkin masih `struct TestView: View`.

Walaupun ini tidak semestinya menyebabkan ralat, ia mudah menimbulkan kekeliruan.

Oleh itu, disarankan agar nama fail dan nama view dikekalkan selaras. Contohnya, jika nama fail ialah `ProfileView.swift`, nama view juga menggunakan `ProfileView`.

## Mencipta fail templat SwiftUI

Selain mencipta fail kosong, kita juga boleh terus mencipta fail templat SwiftUI.

Di kawasan Navigator di sebelah kiri Xcode, klik kanan pada ruang kosong atau folder, kemudian pilih `New File from Template...`.

Lokasi operasi adalah seperti berikut:

![xcode](../../../Resource/027_view3.png)

Dalam tetingkap yang muncul, bahagian atas membolehkan anda memilih platform yang berbeza, contohnya `iOS`, `macOS` dan sebagainya.

Di sini, kekalkan pilihan pada platform yang sepadan dengan projek semasa. Contohnya, jika kita sedang mencipta iOS App, pilih `iOS`.

![xcode](../../../Resource/027_view4.png)

Kemudian pilih `SwiftUI View` di bahagian bawah.

![xcode](../../../Resource/027_view12.png)

Kemudian klik `Next`, masukkan nama fail dan simpan.

Contohnya, kita mencipta satu fail bernama `Test2View.swift`.

Xcode akan menjana kod yang serupa dengan berikut secara automatik:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Berbanding dengan fail kosong, fail templat akan mengandungi `import SwiftUI`, `struct`, `body` dan `#Preview` secara automatik.

Oleh itu, bagi pemula, menggunakan fail templat SwiftUI adalah lebih mudah dan lebih kurang berkemungkinan tertinggal kod penting.

**Petua**: Selain mencipta fail melalui klik kanan, anda juga boleh klik butang tambah di bahagian bawah Navigator sebelah kiri Xcode untuk mencipta fail atau folder.

![xcode](../../../Resource/027_view5.png)

## Mencipta folder

Apabila fail semakin banyak, kita boleh menggunakan folder untuk menguruskannya.

Di kawasan Navigator di sebelah kiri Xcode, klik kanan pada ruang kosong atau folder, kemudian pilih `New Folder`.

Selepas mencipta folder, anda boleh menyeret fail yang berkaitan ke dalam folder tersebut.

![xcode](../../../Resource/027_view7.png)

Folder terutamanya digunakan untuk menyusun struktur projek, dan tidak akan mengubah cara penggunaan view itu sendiri.

Selagi nama view betul, ia masih boleh digunakan dalam fail lain melalui cara seperti `TestView()` dan `Test2View()`.

## Memadam fail atau folder

Jika anda mahu memadam fail atau folder, anda boleh memilih fail yang sepadan di kawasan Navigator sebelah kiri Xcode, kemudian klik kanan dan pilih `Delete`.

Anda juga boleh memilih fail, kemudian tekan kekunci Delete `⌫`.

Xcode akan memaparkan tetingkap pengesahan pemadaman.

![xcode](../../../Resource/027_view10.png)

Memilih `Move to Trash` bermaksud memindahkan fail ke Sampah.

Jika anda melihat `Remove Reference`, ini bermaksud hanya membuang rujukan daripada projek Xcode, tetapi tidak memadam fail asal pada cakera.

Untuk pemula, jika anda hanya memadam fail biasa yang baru dicipta sendiri, biasanya memilih `Move to Trash` sudah mencukupi.

## Memaparkan beberapa view SwiftUI

Selepas belajar mencipta fail, kita boleh memisahkan view yang berbeza ke dalam fail yang berbeza.

Contohnya, kita mencipta dua fail SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` digunakan untuk memaparkan nama pengarang:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` digunakan untuk memaparkan latar belakang kad:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Kemudian, kita boleh menggunakan dua view ini di dalam `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Selepas dijalankan, kita dapat melihat `CardView` dan `AuthorView` digabungkan dan dipaparkan bersama:

![xcode](../../../Resource/027_view11.png)

Dalam kesan ini, `CardView` berfungsi sebagai latar belakang, dan `AuthorView` dipaparkan di atas, kerana kedua-duanya diletakkan di dalam `ZStack`.

Di dalam `ContentView`, kita menggunakan dua view ini melalui `CardView()` dan `AuthorView()`. Tanda `()` selepas nama bermaksud mencipta dan menggunakan view tersebut.

Inilah nesting view yang biasa dalam SwiftUI: dalam satu view, kita boleh terus menggunakan view lain.

## Fail titik masuk

Akhir sekali, mari kita semak semula dari mana App mula memaparkan antara muka.

Dalam projek SwiftUI, biasanya terdapat satu fail titik masuk:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Di sini, `@main` menunjukkan bahawa ini ialah lokasi titik masuk App.

Di dalam `WindowGroup`, kita melihat:

```swift
ContentView()
```

Ini bermaksud selepas App dilancarkan, ia akan memaparkan `ContentView` terlebih dahulu.

Kemudian di dalam `ContentView`, ia memaparkan lagi:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Jadi, hierarki view boleh difahami seperti berikut:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Jika kita menukar view yang dipaparkan dalam fail titik masuk kepada `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Maka selepas App dilancarkan, ia hanya akan memaparkan `CardView`.

Dengan kata lain, `WindowGroup` dalam kod titik masuk menentukan view mana yang akan dipaparkan terlebih dahulu selepas App dilancarkan.

Di dalam view tersebut pula, ia masih boleh terus memaparkan view lain.

## Ringkasan

Dalam pelajaran ini, kita belajar operasi pengurusan fail yang biasa digunakan dalam Xcode.

Kita telah memahami cara mencipta fail SwiftUI, cara menamakan semula fail, cara mencipta folder, serta cara memadam fail.

Pada masa yang sama, kita juga belajar satu konsep penting: view SwiftUI boleh dipisahkan ke dalam fail yang berbeza, kemudian digunakan dalam view lain.

Contohnya:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Di sini, `CardView()` dan `AuthorView()` ialah penggunaan view lain di dalam `ContentView`.

Akhir sekali, kita juga menyemak semula logik paparan fail titik masuk.

Apabila App dilancarkan, ia akan masuk dahulu ke dalam kod titik masuk yang ditandakan dengan `@main`, kemudian memaparkan view di dalam `WindowGroup`.

Ini membantu kita memahami bahawa fail SwiftUI yang berbeza bukanlah terasing antara satu sama lain. Ia boleh digabungkan bersama dan akhirnya membentuk antara muka App yang lengkap.
