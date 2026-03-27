# Counter

Di dua pelajaran sebelumnya, kita sudah mempelajari variabel, konstanta, tombol, dan fungsi.

Di pelajaran ini, kita akan menggabungkan pengetahuan tersebut untuk membuat sebuah aplikasi counter sederhana.

Dalam contoh ini, kita akan belajar cara menyimpan dan mengubah variabel, serta menggunakan `@State` untuk mengelola variabel.

## Mewujudkan counter

Counter biasanya digunakan untuk mencatat jumlah yang perlu terus bertambah. Misalnya, jumlah lompat tali, jumlah putaran lari, dan skenario perhitungan lain.

Sekarang mari kita buat sebuah counter sederhana: menampilkan sebuah angka dan tombol, lalu ketika tombol ditekan, angkanya akan bertambah.

![Num](../../RESOURCE/009_num.png)

### Menampilkan angka

Pertama, kita gunakan `Text` untuk menampilkan angka.

```swift
Text("0")
```

Namun, jika angka perlu berubah, kita tidak bisa langsung menuliskan `"0"` secara tetap, melainkan harus menggunakan variabel untuk menyimpannya.

```swift
var num = 0
```

Lalu tampilkan variabel itu di dalam `Text`:

```swift
Text("\(num)")
```

Di sini digunakan interpolasi string `\\()` untuk mengubah angka menjadi string sebelum ditampilkan.

### Tombol untuk menambah angka

Selanjutnya, tambahkan sebuah tombol.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Saat tombol ditekan, kita ingin angkanya bertambah.

Karena itu, kita bisa mengubah variabel di dalam tombol:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Potongan kode ini berarti: ketika tombol ditekan, sistem akan menghitung `num + 1`, lalu hasilnya diberikan kembali ke `num`.

### Penulisan yang lebih ringkas

Swift menyediakan penulisan yang lebih ringkas:

```swift
num += 1
```

Ini setara dengan:

```swift
num = num + 1
```

Penulisan ini disebut “operator assignment gabungan”.

Operator assignment gabungan yang umum di Swift meliputi:

```
+=   assignment penjumlahan
-=   assignment pengurangan
*=   assignment perkalian
/=   assignment pembagian
%=   assignment sisa bagi
```

Misalnya:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Kode lengkap

Sekarang, kita bisa menulis sebuah counter sederhana:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Namun, pada tahap ini kode tersebut tidak akan berjalan dengan benar.

### Muncul error

Xcode akan menampilkan:

```
Cannot assign to property: 'self' is immutable
```

Artinya properti tidak bisa diubah, karena view bersifat immutable.

Mengapa bisa demikian?

## Cara kerja SwiftUI

Di SwiftUI: **antarmuka didorong oleh data**, artinya ketika data berubah, antarmuka akan otomatis diperbarui.

Namun perlu diperhatikan, hanya ketika state seperti `@State` atau `@Binding` berubah, SwiftUI akan memantau perubahan tersebut dan memperbarui view.

Jika menggunakan variabel biasa, SwiftUI hanya membaca nilainya sekali saat view dibuat. Setelah itu, meskipun variabel berubah, antarmuka tidak akan ikut diperbarui.

Misalnya:

```swift
var num = 0   // 0
num = 1   // 0
```

Dalam contoh di atas, `num` adalah variabel biasa. Walaupun nilainya berubah, SwiftUI tidak akan memperbarui view, sehingga antarmuka tetap menampilkan angka awal `0`.

![Num](../../RESOURCE/009_state.png)

Karena itu, hanya ketika data ditandai sebagai state, misalnya menggunakan property wrapper seperti `@State` atau `@Binding`, SwiftUI akan memantau perubahannya dan memperbarui view secara otomatis.

## Property wrapper @State

Di SwiftUI, jika ingin mengubah variabel dan memperbarui view, kita harus menggunakan `@State`.

```swift
@State var num = 0
```

`@State` akan membuat SwiftUI memantau variabel ini.

Ketika variabel berubah, SwiftUI akan menghitung ulang view dan memperbaruinya.

Kode lengkap:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Sekarang, ketika tombol ditekan:

```swift
num += 1
```

SwiftUI akan mendeteksi bahwa `num` berubah, lalu otomatis memperbarui view.

![Num](../../RESOURCE/009_state1.png)

## Aturan penggunaan @State

Dalam pengembangan nyata, `@State` biasanya mengikuti dua aturan.

### 1. @State biasanya menggunakan private

Variabel `@State` biasanya hanya digunakan di dalam tipe saat ini, misalnya di struktur `View` saat ini, sehingga umumnya ditulis seperti ini:

```swift
@State private var num = 0
```

Dengan begitu, view lain tidak bisa langsung mengakses atau mengubah variabel ini.

Kita belum mempelajari `private`, jadi untuk sementara bisa dipahami secara sederhana seperti ini:

**Konten yang diberi `private` hanya bisa digunakan di view saat ini, dan tidak bisa digunakan oleh view di luar.**

### 2. @State hanya digunakan untuk state view saat ini

`@State` cocok untuk data yang dikelola oleh `View` itu sendiri.

Misalnya isi kotak input atau status sebuah switch.

```swift
@State private var isOn = false
@State private var text = ""
```

Jika data perlu dibagikan ke beberapa view, maka kita perlu menggunakan tipe state lain, misalnya `@Binding` atau `@Observable`.

Semua ini akan dipelajari di pelajaran berikutnya.

### Tombol pengurangan

Counter tidak hanya bisa bertambah, tetapi juga bisa berkurang.

Kita bisa menambahkan tombol `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Lalu gunakan `HStack` untuk menyusun tombol secara horizontal:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Hasilnya:

![Num](../../RESOURCE/009_num1.png)

Saat tombol `+` ditekan, angka akan bertambah 1; saat tombol `-` ditekan, angka akan berkurang 1.

### Tombol reset

Kita juga bisa menambahkan tombol reset untuk mengubah angka menjadi 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Saat tombol reset ditekan, `num` diberi nilai `0`.

Hasilnya:

![Num](../../RESOURCE/009_num2.png)

Ketika tombol `0` ditekan, angka akan menjadi `0`.

### Tombol kustom

Saat ini tombol kita masih hanya bisa menampilkan teks:

```swift
Button("+") {

}
```

Penulisan seperti ini hanya bisa menampilkan isi teks, misalnya `+` atau `-`.

Dalam pengembangan nyata, kita biasanya ingin tampilan tombol lebih kaya, misalnya menggunakan ikon atau view lain.

SwiftUI memungkinkan kita menyesuaikan isi tampilan tombol. Dalam kasus ini, kita bisa menggunakan bentuk penulisan tombol yang lain:

```swift
Button(action: {

}, label: {

})
```

Dalam bentuk ini, `action` berarti kode yang dijalankan saat tombol ditekan, dan `label` adalah view yang ditampilkan pada tombol.

Misalnya, kita bisa menampilkan sebuah ikon `SF Symbols` pada tombol:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Dengan demikian, tombol tidak lagi menampilkan teks, tetapi sebuah ikon.

### Mengoptimalkan tampilan counter

Agar antarmuka counter lebih jelas, kita juga bisa menyesuaikan tampilan angka. Misalnya, memperbesar angka:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Selanjutnya, kita ubah isi tombol menjadi ikon dan sedikit memperbesar ukuran ikon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Begitu juga, tombol pengurangan dan tombol reset juga bisa diubah menjadi ikon:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Sekarang tombol menampilkan ikon `SF Symbols`, sehingga antarmuka juga menjadi lebih intuitif.

![Num](../../RESOURCE/009_num3.png)

## Ringkasan

Di pelajaran ini, melalui pembuatan counter sederhana, kita telah berlatih secara terpadu menggunakan variabel, `Text`, dan `Button`. Kita menggunakan variabel untuk menyimpan angka, lalu mengontrol penambahan atau pengurangannya dengan tombol, sambil juga mempelajari operator assignment gabungan seperti `num += 1` dan `num -= 1`.

Selama proses implementasi, kita juga memahami cara kerja SwiftUI: antarmuka didorong oleh data. Ketika data berubah, antarmuka akan diperbarui. Karena itu, kita perlu menggunakan `@State` untuk menyimpan state yang bisa berubah. Ketika variabel `@State` berubah, SwiftUI akan otomatis memperbarui view.

Terakhir, kita melakukan optimasi sederhana pada antarmuka: menyesuaikan gaya font `Text`, dan menggunakan `Button(action:label:)` untuk menyesuaikan isi tombol, sehingga tombol bisa menampilkan ikon. Dengan begitu, tampilan counter menjadi lebih jelas dan lebih menarik.

Sekarang kita sudah mulai mengenal cara dasar menggunakan view SwiftUI. Di SwiftUI, sebagian besar antarmuka digerakkan oleh variabel. Ketika variabel berubah, SwiftUI akan otomatis memperbarui view. Karena itu, saat mengembangkan aplikasi SwiftUI, biasanya kita perlu terlebih dahulu merancang data apa yang perlu disimpan, lalu menggunakan data-data itu untuk membangun antarmuka dan logika interaksi.

## Kode lengkap

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
