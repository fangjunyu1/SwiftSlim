# Siklus hidup view SwiftUI

Di pelajaran sebelumnya, kita sudah memahami bahwa variabel `@State` akan mengikuti siklus hidup view, dan kita juga sudah mempelajari penggunaan dasar `onAppear`.

Di pelajaran ini, kita akan lebih jauh memahami siklus hidup view SwiftUI: bagaimana view dibuat dan ditampilkan, bagaimana variabel di dalam view dibuat dan dibangun ulang, serta mempelajari `onAppear`, `onDisappear`, dan konstruktor `init`.

Berdasarkan pengetahuan ini, kita akan membangun pemahaman menyeluruh tentang seluruh proses pembentukan view di SwiftUI.

## Urutan startup aplikasi

Saat membuat proyek iOS, Xcode secara default akan menghasilkan dua file:

```
ContentView.swift
<NamaProyek> + App.swift
```

Di antaranya, `<NamaProyek> + App.swift` adalah file entry point dari seluruh aplikasi.

Misalnya:

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

### Alur eksekusi kode

Ketika kita menjalankan aplikasi, baik di simulator maupun perangkat fisik, sistem akan mencari kata kunci `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Setelah mengonfirmasi file entry point, sistem mulai mengeksekusi kode.

Pertama, ia masuk ke struktur `App`, mengeksekusi kode di dalam `body`, lalu membuat `WindowGroup` dan memuat `ContentView` di dalamnya.

### Fungsi WindowGroup

`WindowGroup` digunakan untuk mengelola jendela:

```swift
WindowGroup {
    ContentView()
}
```

Pada sistem iPad / macOS, multi-window didukung, sedangkan iPhone biasanya hanya memiliki satu jendela.

Karena itu, di iPhone, `WindowGroup` terutama bertugas mengelola antarmuka pertama yang ditampilkan.

### Proses pemuatan view

Setelah sistem menemukan `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI akan mengeksekusi kode di dalam `body`, lalu membangun antarmuka berdasarkan struktur view yang dikembalikan, seperti `VStack`, `Text`, dan lainnya, lalu menampilkannya di layar.

Setelah langkah-langkah ini selesai, kita akan bisa melihat `ContentView` di dalam tampilan.

![ContentView](../../Resource/016_view1.png)

Perlu diperhatikan bahwa fungsi `body` adalah menghasilkan view, bukan menyimpan view.

Artinya, setiap kali view di-refresh, SwiftUI akan menghitung ulang `body`, lalu menghasilkan struktur view yang baru.

### Logika preview view

Preview Xcode (`Canvas`) dan proses menjalankan aplikasi secara nyata adalah dua mekanisme yang berbeda.

Misalnya, jika kita menambahkan output debug di file entry point:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Saat mem-preview `ContentView` di Xcode, eksekusi tidak dimulai dari entry point `@main`, sehingga `onAppear` di file entry point tidak akan dipicu.

Namun, jika aplikasi dijalankan di simulator atau perangkat fisik, sistem akan mulai mengeksekusi dari `@main`, lalu menjalankan seluruh alur aplikasi secara lengkap, sehingga `onAppear` di entry point akan terpanggil dan menampilkan informasi debug.

Intinya, preview Xcode hanyalah “rendering parsial”, dan hanya digunakan untuk menampilkan view saat ini. Simulator dan perangkat fisik memberikan “lingkungan eksekusi penuh”, dan akan menjalankan seluruh aplikasi.

Karena itu, saat menguji fungsi aplikasi, acuan yang benar seharusnya adalah simulator atau perangkat fisik. Preview Xcode tidak bisa menyediakan lingkungan berjalan yang lengkap.

## Siklus hidup view

Pada tahap saat ini, semua kode kita masih terkonsentrasi di `ContentView`. Namun dalam aplikasi nyata, sebuah app biasanya berisi banyak view yang berpindah-pindah dalam berbagai skenario.

Misalnya, di dalam “celengan”:

![PiggyBank](../../Resource/016_view.png)

Ketika menekan “menabung”, view `SaveView` akan ditampilkan. Ketika proses menabung selesai atau ditutup, `SaveView` akan dihapus.

Proses ini adalah siklus hidup sebuah view: mulai dari pembuatan view, menampilkan view, lalu akhirnya menghapus view.

### Menutup aplikasi

Ketika aplikasi ditutup, semua view akan dihapus dan state yang terkait juga akan ikut hilang.

Karena itu, `ContentView` dan view lainnya akan dihapus dari memori, dan seluruh status berjalan aplikasi juga akan dibersihkan.

## Siklus hidup variabel di dalam view

Di SwiftUI, siklus hidup variabel biasanya terikat pada view.

Misalnya:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variabel @State

Variabel yang dideklarasikan dengan `@State` terikat pada siklus hidup view.

```swift
@State private var name = "FangJunyu"
```

Saat view dibuat, `name` juga akan dibuat; saat view dihapus, `name` juga akan dihancurkan.

Inilah alasan mengapa kita perlu menggunakan cara seperti `UserDefaults` untuk melakukan penyimpanan data secara persisten.

### Variabel di dalam body

Variabel yang didefinisikan di dalam `body`:

```swift
var num = 10
```

Siklus hidupnya terikat pada proses eksekusi `body`.

Ketika state SwiftUI berubah, misalnya:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Saat `name` berubah, `@State` mendeteksi perubahan data, lalu memberi tahu SwiftUI untuk menghitung ulang view, sehingga `body` dihitung kembali.

Ketika `body` dihitung ulang, semua kode di dalam `body` akan dieksekusi ulang, dan variabel-variabel di dalam `body` seperti `num` juga akan dibuat ulang.

Itulah sebabnya kita tidak disarankan mendefinisikan variabel yang kompleks di dalam `body`.

Karena setiap refresh view akan membuat ulang variabel di dalam `body`, hal ini akan menambah biaya komputasi dan memengaruhi performa.

Di SwiftUI, tipe data yang berbeda seharusnya dikelola dengan cara yang berbeda: data yang perlu mengikuti siklus hidup view bisa disimpan dengan `@State`, sedangkan data hasil perhitungan sementara bisa ditempatkan di dalam `body`.

## onAppear dan onDisappear

Di pelajaran sebelumnya, kita sudah mempelajari `onAppear`: saat view ditampilkan, `onAppear` akan dipanggil.

```swift
.onAppear {}
```

Misalnya:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Di preview Xcode atau saat aplikasi dijalankan, kita bisa melihat output debug dari `onAppear`.

### onDisappear

Pasangan dari `onAppear` adalah `onDisappear`:

```swift
.onDisappear {}
```

Saat view ditutup, `onDisappear` akan dipanggil.

Misalnya:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Saat view dihapus, kode di dalam `onDisappear` akan dipanggil.

Tips: pada tahap saat ini, `ContentView` yang digunakan adalah root view aplikasi, sehingga tidak bisa langsung ditutup atau dihapus. Karena itu, pada tahap ini kita belum bisa mengamati efek eksekusi `onDisappear`.

Nanti, ketika kita mempelajari perpindahan halaman dan membuka view baru, kita akan bisa melihat `onDisappear` dipanggil.

## Logika pembuatan dan penampilan

Perlu diperhatikan bahwa pembuatan view dan penampilan view adalah dua tahap yang berbeda.

Saat view dibuat, konstruktor dari `struct` akan dipanggil:

```swift
init() {}
```

Karena view SwiftUI adalah struktur `struct`:

```swift
struct ContentView: View { ... }
```

maka ketika instance view dibuat, metode konstruktor `init` akan dieksekusi. Baru ketika view ditampilkan, `onAppear` akan dipanggil.

Misalnya:

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
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Saat mem-preview view di Xcode, kita bisa melihat output debug:

```swift
Create ContentView
Show ContentView
```

Ini menunjukkan bahwa `init` dijalankan lebih dulu untuk membuat view, lalu kode di dalam `body` dihitung, dan akhirnya view ditampilkan serta menjalankan `onAppear`.

Karena itu, penting untuk memahami bahwa tahap pembuatan view dan tahap penampilan view adalah dua hal yang terpisah.

### Konstruktor init

`init` adalah sintaks dasar di Swift. `struct` dan `class` sama-sama bisa mendefinisikannya, dan fungsinya adalah untuk menginisialisasi objek.

```swift
init() {}
```

Di SwiftUI, saat view dibuat, sistem akan memanggil metode `init` milik view. Ini dapat digunakan untuk menerima parameter atau menyiapkan data awal.

Jika kita tidak menulis `init` secara manual, Swift akan otomatis membuat konstruktor default untuk `struct`.

Untuk view SwiftUI seperti `ContentView`, saat view dibuat, `init` dijalankan; saat view ditampilkan, `onAppear` dijalankan.

Karena itu, `init` adalah konstruktor yang dieksekusi saat view dibuat, dan nanti akan berguna ketika kita perlu meneruskan parameter atau menginisialisasi data.

## Ringkasan

Di pelajaran ini, kita telah mempelajari urutan startup aplikasi, yaitu alur eksekusi dari file entry point sampai ke file `ContentView`.

Kita juga memahami siklus hidup view SwiftUI: saat view dibuat, `init` akan dijalankan; saat view tampil di layar, `onAppear` akan dijalankan; dan saat view dihapus atau ditutup, `onDisappear` akan dijalankan.

Kita mempelajari mekanisme pembaruan view: view didorong oleh state. Saat state seperti `@State` berubah, SwiftUI akan me-refresh view, menghitung ulang `body`, dan variabel di dalam `body` juga akan dibuat ulang.

Siklus hidup variabel akan terikat pada siklus hidup view, sedangkan data sementara di dalam `body` akan dibuat ulang setiap kali refresh.

Memahami siklus hidup dan perilaku variabel ini akan membantu kita menyusun kode dengan lebih baik, sehingga logika aplikasi menjadi lebih jelas.
