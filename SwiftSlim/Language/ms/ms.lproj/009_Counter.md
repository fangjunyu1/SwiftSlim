# Kaunter

Dalam dua pelajaran sebelumnya, kita telah mempelajari pembolehubah, pemalar, butang dan kaedah.

Dalam pelajaran ini, kita akan menggabungkan pengetahuan tersebut untuk membuat satu aplikasi kaunter yang ringkas.

Dalam contoh ini, kita akan mempelajari cara menyimpan dan mengubah pembolehubah, serta menggunakan `@State` untuk mengurus pembolehubah.

## Melaksanakan kaunter

Kaunter biasanya digunakan untuk merekod kuantiti yang perlu terus bertambah. Contohnya, bilangan lompat tali, bilangan pusingan larian dan situasi pengiraan yang lain.

Sekarang mari kita laksanakan satu kaunter ringkas: paparkan satu nombor dan satu butang, dan apabila butang ditekan, nombor itu akan bertambah.

![Num](../../RESOURCE/009_num.png)

### Memaparkan nombor

Mula-mula, kita gunakan `Text` untuk memaparkan nombor.

```swift
Text("0")
```

Tetapi jika nombor itu perlu berubah, kita tidak boleh menulis `"0"` secara tetap. Sebaliknya, kita perlu menggunakan pembolehubah untuk menyimpan nombor.

```swift
var num = 0
```

Kemudian paparkan pembolehubah itu dalam `Text`:

```swift
Text("\(num)")
```

Di sini kita menggunakan interpolasi rentetan `\\()` untuk menukar nombor kepada rentetan dan memaparkannya.

### Butang untuk menambah nombor

Seterusnya, kita tambahkan satu butang.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Apabila butang ditekan, kita mahu nombor bertambah.

Oleh itu, kita boleh mengubah pembolehubah di dalam butang:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Kod ini bermaksud: apabila butang ditekan, `num + 1` akan dikira, dan hasilnya ditugaskan semula kepada `num`。

### Cara penulisan yang lebih ringkas

Swift menyediakan satu bentuk penulisan yang lebih ringkas:

```swift
num += 1
```

Ia bersamaan dengan:

```swift
num = num + 1
```

Cara penulisan ini dipanggil “operator tugasan gabungan”.

Operator tugasan gabungan yang biasa dalam Swift ialah:

```
+=   tugasan tambah
-=   tugasan tolak
*=   tugasan darab
/=   tugasan bahagi
%=   tugasan baki
```

Contohnya:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Kod lengkap

Sekarang, kita boleh menulis satu kaunter ringkas:

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

Tetapi pada ketika ini, kod tidak dapat berjalan dengan betul.

### Ralat muncul

Xcode akan memberi petunjuk:

```
Cannot assign to property: 'self' is immutable
```

Ini bermaksud atribut tidak dapat diubah, kerana view adalah tidak boleh diubah.

Mengapa perkara ini berlaku?

## Cara SwiftUI berfungsi

Dalam SwiftUI: **antara muka dipacu oleh data**, ini bermaksud apabila data berubah, antara muka akan dikemas kini secara automatik.

Namun perlu diperhatikan bahawa hanya apabila state（seperti `@State`、`@Binding`）berubah, barulah SwiftUI akan memantau perubahan itu dan menyegarkan view.

Jika menggunakan pembolehubah biasa, SwiftUI hanya akan membaca nilainya sekali ketika view dicipta. Selepas itu, walaupun pembolehubah berubah, antara muka tidak akan dikemas kini.

Contohnya:

```swift
var num = 0   // 0
num = 1   // 0
```

Dalam contoh di atas, `num` ialah pembolehubah biasa. Walaupun nilainya telah berubah, SwiftUI tidak akan mengemas kini view, dan antara muka masih akan memaparkan nilai awal `0`。

![Num](../../RESOURCE/009_state.png)

Oleh itu, hanya apabila data ditandakan sebagai state（contohnya menggunakan pembungkus sifat seperti `@State`、`@Binding`）barulah SwiftUI akan memantau perubahan dan mengemas kini view secara automatik.

## Pembungkus sifat @State

Dalam SwiftUI, jika kita perlu mengubah pembolehubah dan mengemas kini view, kita mesti menggunakan `@State`。

```swift
@State var num = 0
```

`@State` akan membuat SwiftUI memantau pembolehubah ini.

Apabila pembolehubah berubah, SwiftUI akan mengira semula view dan mengemas kini view.

Kod lengkap:

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

Sekarang, apabila butang ditekan:

```swift
num += 1
```

SwiftUI akan mengesan bahawa `num` telah berubah, lalu mengemas kini view secara automatik.

![Num](../../RESOURCE/009_state1.png)

## Peraturan penggunaan @State

Dalam pembangunan sebenar, `@State` biasanya mengikuti dua peraturan.

### 1. @State biasanya menggunakan private

Pembolehubah `@State` biasanya hanya digunakan dalam jenis semasa（contohnya struct `View` semasa）, oleh itu ia biasanya ditulis seperti ini:

```swift
@State private var num = 0
```

Dengan cara ini, view lain tidak akan dapat mengakses atau mengubah pembolehubah ini secara langsung.

Buat masa ini kita belum mempelajari `private`，jadi ia boleh difahami secara ringkas sebagai:

**Kandungan yang diubah suai dengan `private` hanya boleh digunakan dalam view semasa, dan view di luar tidak boleh menggunakannya.**

### 2. @State hanya digunakan untuk state view semasa

`@State` sesuai untuk data yang diurus sendiri oleh `View` semasa.

Contohnya, kandungan medan input dan status suis.

```swift
@State private var isOn = false
@State private var text = ""
```

Jika data perlu dikongsi antara beberapa view, maka kita perlu menggunakan jenis state lain, seperti `@Binding` atau `@Observable`。

Kandungan ini akan dipelajari dalam pelajaran seterusnya.

### Butang untuk mengurangkan

Selain menambah, kaunter juga boleh dikurangkan.

Kita boleh menambah satu butang `-`。

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Kemudian gunakan `HStack` untuk menyusun butang secara mendatar:

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

Kesan:

![Num](../../RESOURCE/009_num1.png)

Apabila butang `+` ditekan, nombor akan bertambah 1; apabila butang `-` ditekan, nombor akan berkurang 1.

### Butang reset

Kita juga boleh menambah satu butang reset, untuk menukar nombor kembali menjadi `0`。

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Apabila butang reset ditekan, `num` akan ditugaskan kepada `0`。

Kesan:

![Num](../../RESOURCE/009_num2.png)

Apabila butang `0` ditekan, nombor akan menjadi `0`。

### Butang tersuai

Pada masa ini, butang kita hanya boleh memaparkan teks:

```swift
Button("+") {

}
```

Butang yang ditulis dengan cara ini hanya boleh memaparkan kandungan teks, contohnya `+` atau `-`。

Dalam pembangunan sebenar, kita biasanya berharap rupa butang lebih kaya, contohnya dengan menggunakan ikon atau view lain.

SwiftUI membenarkan kita menyesuaikan kandungan paparan butang. Dalam keadaan ini, kita boleh menggunakan satu lagi cara menulis butang:

```swift
Button(action: {

}, label: {

})
```

Dalam penulisan ini, `action` mewakili kod yang dijalankan apabila butang ditekan, manakala `label` memaparkan view bagi butang itu.

Contohnya, kita boleh membiarkan butang memaparkan ikon SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Dengan cara ini, apa yang dipaparkan oleh butang bukan lagi teks, tetapi sebuah ikon.

### Mengoptimumkan antara muka kaunter

Untuk menjadikan antara muka kaunter lebih jelas, kita juga boleh melaraskan gaya paparan nombor. Contohnya, membesarkan nombor:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Seterusnya, kita juga menukar kandungan paparan butang kepada ikon, dan membesarkan saiz ikon dengan sewajarnya:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Begitu juga, kita boleh menukar butang pengurangan dan butang reset kepada bentuk ikon:

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

Sekarang butang memaparkan ikon SF Symbols, dan antara muka juga menjadi lebih intuitif.

![Num](../../RESOURCE/009_num3.png)

## Ringkasan

Dalam pelajaran ini, melalui pelaksanaan satu kaunter ringkas, kita telah berlatih secara menyeluruh penggunaan pembolehubah, `Text` dan `Button`。Kita menggunakan pembolehubah untuk menyimpan nombor, mengawal penambahan dan pengurangan nombor melalui butang, dan pada masa yang sama mempelajari operator tugasan gabungan seperti `num += 1` dan `num -= 1`。

Dalam proses pelaksanaan, kita memahami bagaimana SwiftUI berfungsi: antara muka dipacu oleh data. Apabila data berubah, barulah antara muka akan dikemas kini. Oleh itu, kita perlu menggunakan `@State` untuk menyimpan state yang boleh berubah. Apabila pembolehubah `@State` berubah, SwiftUI akan mengemas kini view secara automatik.

Akhir sekali, kita telah melakukan sedikit pengoptimuman pada antara muka, melaraskan gaya fon `Text`, dan menggunakan `Button(action:label:)` untuk menyesuaikan kandungan butang, supaya butang dapat memaparkan ikon. Ini menjadikan antara muka kaunter lebih jelas dan lebih menarik.

Kini, kita sudah mula mengenali cara asas menggunakan SwiftUI view. Dalam SwiftUI, kebanyakan antara muka dipacu oleh pembolehubah. Apabila pembolehubah berubah, SwiftUI akan mengemas kini view secara automatik. Oleh itu, semasa membangunkan aplikasi SwiftUI, biasanya kita perlu terlebih dahulu mereka bentuk data yang perlu disimpan, dan kemudian menggunakan data tersebut untuk membina antara muka dan logik interaksi.

## Kod lengkap

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
