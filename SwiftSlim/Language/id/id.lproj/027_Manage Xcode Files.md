# Mengelola File Xcode

Dalam pelajaran ini, kita akan mempelajari operasi file yang umum di Xcode.

Dalam pelajaran sebelumnya, sebagian besar kode kita ditulis di dalam `ContentView`. Ini memudahkan kita mengamati kode dan hasil tampilannya.

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Namun, dalam App nyata, biasanya kita tidak menulis semua kode di satu file.

Ketika halaman, komponen, dan fitur semakin banyak, kita perlu memisahkan View yang berbeda ke dalam file SwiftUI yang berbeda.

Contohnya:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Ini membuat struktur kode lebih jelas, dan juga memudahkan pemeliharaan serta perubahan berikutnya.

## Mengapa perlu mengelola file

Di SwiftUI, sebuah halaman atau sebuah komponen biasanya dapat ditulis sebagai satu file View tersendiri.

Contohnya:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

`CardView` di sini adalah sebuah View SwiftUI.

Jika semua View ditulis di dalam `ContentView`, kode akan semakin panjang dan semakin sulit dibaca.

Karena itu, kita perlu belajar membuat, mengganti nama, menghapus file, serta menggunakan folder untuk mengelola file kode yang berbeda.

## Membuat file SwiftUI

Di Xcode, ada dua cara umum untuk membuat file SwiftUI:

Cara pertama adalah membuat file kosong, lalu menulis kode sendiri.

Cara kedua adalah membuat file template SwiftUI, lalu Xcode akan membuat kode dasar secara otomatis.

Untuk pemula, lebih disarankan menggunakan file template SwiftUI, karena file tersebut akan membuat struktur dasar secara otomatis.

### Membuat file kosong

Di area Navigator di sisi kiri Xcode, klik kanan pada area kosong atau folder, lalu pilih `New Empty File`.

Posisi operasinya seperti berikut:

![xcode](../../../Resource/027_view1.png)

Setelah membuat file kosong, Xcode biasanya akan menghasilkan file Swift tanpa nama, misalnya `Untitled.swift`.

Kita dapat mengganti namanya menjadi `TestView.swift`.

Dalam proyek SwiftUI, jika file ini digunakan untuk menampilkan sebuah View, biasanya disarankan menambahkan `View` di akhir nama.

Contohnya:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Ini bukan aturan wajib, tetapi dapat membuat kita langsung melihat bahwa ini adalah file View.

Setelah membuat file kosong, file mungkin hanya berisi komentar default, atau mungkin kosong, tergantung versi Xcode dan cara pembuatannya.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Saat ini, kita perlu menulis kode SwiftUI secara manual:

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

Dengan demikian, sebuah file View SwiftUI sederhana sudah selesai dibuat.

### Mengganti nama file

Jika setelah membuat file kamu ingin mengubah nama file, kamu dapat memilih file di area Navigator sisi kiri Xcode, lalu menekan tombol Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Dengan begitu, nama file dapat diubah.

Perlu diperhatikan bahwa mengubah nama file tidak akan otomatis mengubah nama View di dalam kode.

Misalnya, setelah nama file diubah menjadi `ProfileView.swift`, di dalam kode mungkin masih tertulis `struct TestView: View`.

Meskipun hal ini belum tentu menyebabkan error, ini mudah membuat orang bingung.

Jadi, disarankan agar nama file dan nama View tetap konsisten. Misalnya, jika nama file adalah `ProfileView.swift`, nama View juga menggunakan `ProfileView`.

## Membuat file template SwiftUI

Selain membuat file kosong, kita juga dapat langsung membuat file template SwiftUI.

Di area Navigator di sisi kiri Xcode, klik kanan pada area kosong atau folder, lalu pilih `New File from Template...`.

Posisi operasinya seperti berikut:

![xcode](../../../Resource/027_view3.png)

Di jendela yang muncul, bagian atas dapat digunakan untuk memilih platform yang berbeda, misalnya `iOS`, `macOS`, dan lainnya.

Di sini, cukup pertahankan platform yang sesuai dengan proyek saat ini. Misalnya, jika kita sedang membuat iOS App, pilih `iOS`.

![xcode](../../../Resource/027_view4.png)

Lalu pilih `SwiftUI View` di bagian bawah.

![xcode](../../../Resource/027_view12.png)

Kemudian klik `Next`, masukkan nama file, lalu simpan.

Misalnya, kita membuat sebuah `Test2View.swift`.

Xcode akan otomatis menghasilkan kode yang mirip seperti berikut:

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

Dibandingkan dengan file kosong, file template akan otomatis menyertakan `import SwiftUI`, `struct`, `body`, dan `#Preview`.

Jadi bagi pemula, menggunakan file template SwiftUI lebih sederhana dan lebih kecil kemungkinannya ada kode yang terlewat.

**Tips**: Selain membuat file dengan klik kanan, kamu juga dapat mengklik tombol plus di bagian bawah Navigator sisi kiri Xcode untuk membuat file atau folder.

![xcode](../../../Resource/027_view5.png)

## Membuat folder

Ketika file semakin banyak, kita dapat menggunakan folder untuk mengelolanya.

Di area Navigator di sisi kiri Xcode, klik kanan pada area kosong atau folder, lalu pilih `New Folder`.

Setelah folder dibuat, kamu dapat menyeret file terkait ke dalam folder tersebut.

![xcode](../../../Resource/027_view7.png)

Folder terutama digunakan untuk merapikan struktur proyek, dan tidak mengubah cara penggunaan View itu sendiri.

Selama nama View benar, di file lain View tersebut tetap dapat digunakan dengan cara seperti `TestView()` dan `Test2View()`.

## Menghapus file atau folder

Jika ingin menghapus file atau folder, kamu dapat memilih file yang sesuai di area Navigator sisi kiri Xcode, lalu klik kanan dan pilih `Delete`.

Kamu juga dapat memilih file, lalu menekan tombol delete `⌫`.

Xcode akan menampilkan jendela konfirmasi penghapusan.

![xcode](../../../Resource/027_view10.png)

Memilih `Move to Trash` berarti memindahkan file ke Sampah.

Jika kamu melihat `Remove Reference`, itu berarti hanya menghapus referensi dari proyek Xcode, tetapi tidak menghapus file asli di disk.

Untuk pemula, jika hanya menghapus file biasa yang baru dibuat sendiri, biasanya pilih `Move to Trash` sudah cukup.

## Menampilkan beberapa View SwiftUI

Setelah belajar membuat file, kita dapat memisahkan View yang berbeda ke dalam file yang berbeda.

Misalnya, kita membuat dua file SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` digunakan untuk menampilkan nama penulis:

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

`CardView` digunakan untuk menampilkan latar belakang kartu:

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

Kemudian, kita dapat menggunakan kedua View ini di dalam `ContentView`:

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

Setelah dijalankan, kita dapat melihat `CardView` dan `AuthorView` digabungkan dan ditampilkan bersama:

![xcode](../../../Resource/027_view11.png)

Dalam hasil ini, `CardView` menjadi latar belakang, dan `AuthorView` ditampilkan di atasnya, karena keduanya diletakkan di dalam `ZStack`.

Di `ContentView`, kita menggunakan kedua View ini melalui `CardView()` dan `AuthorView()`. Tanda `()` setelah nama berarti membuat dan menggunakan View tersebut.

Inilah nesting View yang umum di SwiftUI: di dalam satu View, kita dapat terus menggunakan View lainnya.

## File masuk

Terakhir, kita tinjau kembali dari mana App mulai menampilkan antarmuka.

Dalam proyek SwiftUI, biasanya ada sebuah file masuk:

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

`@main` di sini berarti ini adalah posisi masuk App.

Di dalam `WindowGroup`, kita melihat:

```swift
ContentView()
```

Ini berarti setelah App dijalankan, yang pertama ditampilkan adalah `ContentView`.

Lalu di dalam `ContentView`, ditampilkan lagi:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Jadi hierarki View dapat dipahami seperti berikut:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Jika kita mengubah View yang ditampilkan di file masuk menjadi `CardView`:

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

Maka setelah App dijalankan, yang akan ditampilkan hanya `CardView`.

Dengan kata lain, `WindowGroup` di dalam kode masuk menentukan View mana yang pertama kali ditampilkan setelah App dijalankan.

Sementara itu, di dalam View tersebut, View lain masih dapat terus ditampilkan.

## Ringkasan

Dalam pelajaran ini, kita mempelajari operasi pengelolaan file yang umum di Xcode.

Kita memahami cara membuat file SwiftUI, cara mengganti nama file, cara membuat folder, serta cara menghapus file.

Pada saat yang sama, kita juga mempelajari sebuah konsep penting: View SwiftUI dapat dipisahkan ke dalam file yang berbeda, lalu digunakan di View lain.

Contohnya:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Di sini, `CardView()` dan `AuthorView()` adalah penggunaan View lain di dalam `ContentView`.

Terakhir, kita juga meninjau kembali logika tampilan file masuk.

Saat App dijalankan, App akan terlebih dahulu masuk ke kode masuk yang ditandai dengan `@main`, lalu menampilkan View di dalam `WindowGroup`.

Ini membantu kita memahami bahwa file SwiftUI yang berbeda bukanlah file yang terpisah sepenuhnya. Mereka dapat saling digabungkan dan akhirnya membentuk antarmuka App yang utuh.
