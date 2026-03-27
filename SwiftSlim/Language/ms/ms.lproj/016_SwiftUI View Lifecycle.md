# Kitar hayat view SwiftUI

Dalam pelajaran sebelum ini, kita telah mengetahui bahawa pembolehubah `@State` akan mengikuti kitar hayat view, dan kita juga telah mempelajari penggunaan asas `onAppear`。

Dalam pelajaran ini, kita akan terus memahami kitar hayat view SwiftUI, melihat bagaimana view dicipta dan dipaparkan, bagaimana pembolehubah dalam view dicipta dan dibina semula, dan pada masa yang sama mempelajari `onAppear`、`onDisappear` dan pembina `init`。

Berdasarkan pengetahuan ini, kita akan membina pemahaman menyeluruh tentang keseluruhan proses pembinaan view dalam SwiftUI.

## Urutan permulaan aplikasi

Apabila projek iOS dicipta, Xcode secara lalai akan menghasilkan dua fail:

```
ContentView.swift
ProjectName + App.swift
```

Antaranya, `"ProjectName + App".swift` ialah fail kemasukan untuk keseluruhan aplikasi.

Contohnya:

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

### Aliran pelaksanaan kod

Apabila kita menjalankan App（simulator atau peranti sebenar）, sistem akan mencari kata kunci `@main`：

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Selepas fail kemasukan disahkan, sistem mula melaksanakan kod.

Ia terlebih dahulu masuk ke dalam struktur `App`，melaksanakan kod dalam `body`，kemudian mencipta `WindowGroup` dan memuatkan `ContentView` di dalamnya.

### Fungsi `WindowGroup`

`WindowGroup` digunakan untuk mengurus tetingkap:

```swift
WindowGroup {
    ContentView()
}
```

Dalam sistem iPad / macOS, berbilang tetingkap disokong, manakala iPhone biasanya hanya mempunyai satu tetingkap.

Oleh itu, pada iPhone, `WindowGroup` terutamanya mengurus antara muka pertama yang dipaparkan.

### Proses pemuatan view

Selepas sistem menemui `ContentView`：

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

SwiftUI akan melaksanakan kod dalam `body`，kemudian membina antara muka berdasarkan struktur view yang dikembalikan（seperti `VStack`、`Text` dan sebagainya）, lalu memaparkannya pada skrin.

Selepas langkah-langkah ini selesai, kita akan dapat melihat `ContentView` dalam view.

![ContentView](../../Resource/016_view1.png)

Perlu diperhatikan bahawa fungsi `body` ialah menjana view, bukannya menyimpan view.

Ini bermaksud setiap kali view disegarkan, SwiftUI akan mengira semula `body` dan menghasilkan struktur view yang baharu.

### Logik view pratonton

Pratonton Xcode（Canvas）dan aplikasi yang benar-benar dijalankan ialah dua mekanisme yang berbeza.

Contohnya, tambah satu output nyahpepijat pada fail kemasukan:

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

Apabila kita mempratonton view `ContentView` dalam Xcode, pelaksanaan tidak bermula daripada kemasukan `@main`，jadi `onAppear` dalam fail kemasukan tidak akan dicetuskan.

Namun, jika dijalankan pada simulator atau peranti sebenar, sistem akan bermula daripada `@main`，menjalankan keseluruhan App mengikut aliran penuh, lalu mencetuskan `onAppear` pada kemasukan dan memaparkan maklumat nyahpepijat.

Kuncinya ialah pratonton Xcode hanyalah “rendering separa” yang digunakan untuk memaparkan view semasa；simulator dan peranti sebenar pula menyediakan “persekitaran pelaksanaan penuh” dan akan menjalankan keseluruhan App.

Oleh itu, apabila menguji fungsi App, kita patut menjadikan simulator atau peranti sebenar sebagai rujukan utama, kerana pratonton Xcode tidak dapat menyediakan persekitaran pelaksanaan yang lengkap.

## Kitar hayat view

Pada peringkat ini, semua kod kita masih tertumpu dalam `ContentView`。Namun dalam aplikasi sebenar, satu App biasanya mengandungi banyak view, dan view-view itu akan bertukar dalam situasi yang berbeza.

Contohnya, dalam “tabung duit syiling”：

![PiggyBank](../../Resource/016_view.png)

Apabila butang “Simpan wang” ditekan, view `SaveView` akan dipaparkan；apabila proses simpan wang selesai atau view ditutup, `SaveView` akan dibuang.

Proses ini ialah kitar hayat satu view, iaitu daripada penciptaan view, kepada paparan view, dan akhirnya pembuangan view.

### Tutup aplikasi

Apabila App ditutup, semua view akan dibuang, dan keadaan yang berkaitan juga akan hilang.

Oleh itu, `ContentView` dan view-view lain akan dikeluarkan daripada memori, dan keseluruhan keadaan pelaksanaan App juga akan dikosongkan.

## Kitar hayat pembolehubah dalam view

Dalam SwiftUI, kitar hayat pembolehubah biasanya terikat pada view.

Contohnya:

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

### Pembolehubah `@State`

Pembolehubah yang diisytiharkan dengan `@State` terikat pada kitar hayat view.

```swift
@State private var name = "FangJunyu"
```

Apabila view dicipta, `name` juga akan dicipta；apabila view dibuang, `name` juga akan dimusnahkan.

Inilah sebabnya mengapa kita perlu menggunakan `UserDefaults` dan cara lain untuk menyimpan data secara berterusan.

### Pembolehubah di dalam `body`

Pembolehubah yang ditakrifkan dalam `body`：

```swift
var num = 10
```

Kitar hayatnya terikat pada proses pelaksanaan `body`。

Apabila keadaan SwiftUI berubah, contohnya:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Apabila `name` berubah, `@State` akan mengesan perubahan data lalu memberitahu SwiftUI supaya mengira semula view, dan `body` akan dikira semula.

Apabila `body` dikira semula, semua kod di dalam `body` akan dilaksanakan semula, dan pembolehubah di dalam `body`（seperti `num`）juga akan dicipta semula.

Inilah sebabnya mengapa kita tidak digalakkan mentakrifkan pembolehubah yang kompleks dalam `body`。

Ini kerana setiap kali view disegarkan, pembolehubah di dalam `body` akan dicipta semula, lalu meningkatkan kos pengiraan dan menjejaskan prestasi.

Dalam SwiftUI, jenis data yang berbeza sepatutnya diurus dengan cara yang berbeza: data yang perlu mengikuti kitar hayat view boleh disimpan menggunakan `@State`；data pengiraan sementara pula boleh diletakkan di dalam `body`。

## `onAppear` dan `onDisappear`

Dalam pelajaran sebelum ini, kita telah mempelajari `onAppear`，iaitu kaedah yang akan dipanggil apabila view dipaparkan.

```swift
.onAppear {}
```

Contohnya:

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

Dalam pratonton Xcode atau semasa aplikasi dijalankan, kita boleh melihat output nyahpepijat dalam `onAppear`。

### `onDisappear`

Yang sepadan dengan `onAppear` ialah `onDisappear`：

```swift
.onDisappear {}
```

Apabila view ditutup, `onDisappear` akan dipanggil.

Contohnya:

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

Apabila view dibuang, kod dalam `onDisappear` akan dilaksanakan.

Petua: Pada peringkat ini, `ContentView` yang kita gunakan ialah view akar aplikasi, maka ia tidak boleh ditutup atau dibuang secara terus. Oleh itu, pada tahap ini kita tidak dapat memerhatikan kesan pelaksanaan `onDisappear` secara langsung.

Apabila kita kemudian mempelajari lompat halaman atau membuka view baharu, kita barulah dapat melihat `onDisappear` dipanggil.

## Logik penciptaan dan paparan

Perlu diperhatikan bahawa penciptaan view dan paparan view ialah dua peringkat yang berbeza.

Apabila view dicipta, pembina struktur akan dipanggil:

```swift
init() {}
```

Ini kerana view SwiftUI ialah struktur `struct`：

```swift
struct ContentView: View { ... }
```

Oleh itu, apabila contoh view dicipta, pembina `init` akan dilaksanakan；apabila view dipaparkan, kaedah `onAppear` barulah dipanggil.

Contohnya:

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

Dalam pratonton Xcode, kita boleh melihat output nyahpepijat:

```swift
Create ContentView
Show ContentView
```

Ini menunjukkan bahawa `init` dilaksanakan dahulu untuk mencipta view, kemudian kod dalam `body` dikira, dan akhirnya view dipaparkan sambil melaksanakan `onAppear`。

Oleh itu, kita perlu memahami bahawa peringkat penciptaan dan peringkat paparan view adalah terpisah.

### Pembina `init`

`init` ialah sintaks asas Swift. Kedua-dua `struct` dan `class` boleh mentakrifkannya untuk menginisialisasi objek.

```swift
init() {}
```

Dalam SwiftUI, apabila view dicipta, sistem akan memanggil kaedah `init` bagi view. Ia boleh digunakan untuk menerima parameter atau menginisialisasi data.

Jika kita tidak menulis `init` secara manual, Swift akan menjana satu pembina lalai untuk `struct` secara automatik.

Bagi view SwiftUI seperti `ContentView`，semasa view dicipta, `init` akan dilaksanakan；semasa view dipaparkan, `onAppear` akan dilaksanakan.

Oleh itu, `init` ialah pembina yang dilaksanakan ketika view dicipta, dan ia akan digunakan kemudian apabila kita memindahkan parameter atau menginisialisasi data.

## Ringkasan

Dalam pelajaran ini, kita telah mempelajari urutan permulaan aplikasi, iaitu aliran pelaksanaan daripada fail kemasukan kepada fail `ContentView`。

Kita juga telah memahami kitar hayat view SwiftUI: apabila view dicipta, `init` akan dilaksanakan；apabila view dipaparkan pada skrin, `onAppear` akan dilaksanakan；apabila view dibuang atau ditutup, `onDisappear` akan dilaksanakan.

Kita turut mempelajari mekanisme kemas kini view: view dipacu oleh keadaan. Apabila keadaan seperti `@State` berubah, SwiftUI akan menyegarkan view, mengira semula `body`，dan pembolehubah dalam `body` juga akan dicipta semula.

Kitar hayat pembolehubah akan terikat pada kitar hayat view, manakala pembolehubah sementara di dalam `body` akan dicipta semula setiap kali view disegarkan.

Memahami kitar hayat ini dan tingkah laku pembolehubah akan membantu kita menyusun kod dengan lebih baik dan menjadikan logik aplikasi lebih jelas.
