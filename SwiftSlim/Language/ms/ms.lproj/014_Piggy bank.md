# Tabung duit syiling

Dalam pelajaran ini, kita akan membangunkan satu projek “tabung duit syiling” yang ringkas. Fungsinya mudah, tetapi mengandungi logik interaksi yang lengkap, maka ia sangat sesuai untuk pemula.

Melalui projek ini, kita akan mempelajari `TextField`（kotak input）dan `border`，serta memahami pengikatan data（`$`）。

Matlamat akhirnya ialah membina satu projek “tabung duit syiling” yang boleh memasukkan amaun, menekan butang untuk menyimpan, dan mengumpulkan jumlah keseluruhan.

Kesan akhir:

![Piggy Bank](../../RESOURCE/014_view.png)

## Paparkan jumlah keseluruhan

Mula-mula, kita perlu memaparkan jumlah keseluruhan dalam “tabung duit syiling” pada view.

Dalam `ContentView`，isytiharkan satu pembolehubah untuk menyimpan jumlah keseluruhan “tabung duit syiling”。

```swift
@State private var amount = 0
```

Seterusnya, gunakan `Text` untuk memaparkan amaun ini:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Di sini, kita menggunakan `.font` dan `.fontWeight` untuk menetapkan saiz dan ketebalan fon.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Apabila `amount` berubah, jumlah yang dipaparkan oleh `Text` juga akan dikemas kini secara automatik.

## Masukkan amaun

Selain memaparkan jumlah keseluruhan, “tabung duit syiling” juga perlu membenarkan pengguna “memasukkan” amaun simpanan atau pengeluaran, dan untuk itu kita perlu menggunakan kawalan view `TextField` dalam SwiftUI.

### `TextField`

`TextField` ialah kawalan view dalam SwiftUI yang digunakan untuk memasukkan kandungan, dan biasanya digunakan untuk input satu baris.

`TextField` terutamanya menyediakan dua bentuk pengikatan:

**1. Ikat jenis rentetan（`String`）**

```swift
TextField("Placeholder", text: $text)
```

Sesuai untuk kandungan teks seperti nama dan tajuk.

**2. Ikat jenis nombor（`Int/Double`）**

```swift
TextField("Amount", value: $number, format: .number)
```

Sesuai untuk umur, gaji, amaun dan kandungan angka yang lain.

`format: .number` menunjukkan bahawa kotak input ini akan dianalisis dan dipaparkan mengikut “format nombor”.

#### Teks pemegang tempat

Parameter pertama `TextField` ialah teks pemegang tempat（Placeholder），digunakan untuk mengingatkan pengguna agar memasukkan kandungan:

```swift
TextField("input your name", text: $text)
```

Apabila kotak input kosong, satu baris petunjuk berwarna kelabu akan dipaparkan.

![textfield](../../RESOURCE/014_textfield.png)

#### Pengikatan data

`TextField` tidak bertanggungjawab menyimpan kandungan input secara kekal. Data perlu diurus melalui pembolehubah yang diikat.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Kandungan yang dimasukkan oleh pengguna akan disimpan terus ke dalam pembolehubah `text`，manakala `TextField` hanya bertanggungjawab terhadap antara muka input.

`$` mewakili pengikatan（Binding）：

```swift
$text
```

Ini bukan pembolehubah biasa, sebaliknya satu jenis `Binding`。

Fungsinya ialah membina sambungan antara view dan data:

Apabila pengguna memasukkan kandungan ke dalam `TextField`，`text` akan dikemas kini secara automatik；apabila `text` berubah, `TextField` juga akan dikemas kini serentak.

Contohnya:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Apabila kandungan dimasukkan ke dalam `TextField`，`Text` di atas akan dipaparkan secara serentak dalam masa nyata.

![textField](../../RESOURCE/014_textfield1.png)

### Ikat jenis nombor

Apabila kita perlu memasukkan nombor, kita perlu mengikat pembolehubah daripada jenis yang sepadan:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Apabila pengguna memasukkan amaun, `TextField` akan menganalisis kandungan input dan mengemas kini nilai `number` secara automatik.

## Tambahkan kotak input

Selepas memahami penggunaan asas `TextField`，kita akan mengaplikasikannya ke dalam projek “tabung duit syiling”.

“Tabung duit syiling” perlu memasukkan “amaun”, jadi kita akan menggunakan cara “ikat jenis nombor（`Int/Double`）”, dan menambah satu lagi pembolehubah `number` untuk menyimpan amaun yang dimasukkan oleh pengguna:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Sekarang, `TextField` akan memaparkan nilai `number` secara lalai（nilai lalai ialah 0）。

Apabila kandungan input dipadamkan, teks pemegang tempat “Amount” akan dipaparkan.

Ini sekali lagi menunjukkan bahawa `TextField` memaparkan nilai pembolehubah yang diikat, bukannya menyimpan kandungan sendiri.

### Masalah saiz kotak input

Dalam view semasa, kita akan mendapati bahawa `TextField` tiada sempadan, hanya memaparkan satu `0`，dan kandungannya kelihatan sejajar ke kiri.

Kesannya seperti berikut:

![textfield](../../RESOURCE/014_textfield2.png)

Ini kerana `TextField` secara lalai akan mengambil keseluruhan lebar view induk.

Kita boleh menambah warna latar belakang untuk mengesahkannya:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Kesannya seperti berikut:

![textfield](../../RESOURCE/014_textfield3.png)

Kita boleh melihat bahawa `TextField` sebenarnya memenuhi keseluruhan lebar satu baris.

### Tetapkan lebar tetap

Jika kita mahu kotak input lebih padat, kita boleh menggunakan `frame` untuk mengehadkan lebarnya:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Kesannya seperti berikut:

![textfield](../../RESOURCE/014_textfield4.png)

### Tambahkan sempadan dan padding dalaman

Oleh sebab `TextField` secara lalai tidak mempunyai sempadan, kita boleh menambah gaya secara manual:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Sekarang, kotak input ini akan kelihatan lebih seperti “kotak input standard”.

![textfield](../../RESOURCE/014_textfield5.png)

## `border`

Dalam SwiftUI, `border` digunakan untuk menambah sempadan pada view.

Penggunaan asas:

```swift
border(Color.black, width: 1)
```

Di sini, `Color.black` menunjukkan warna sempadan, dan `width` menunjukkan ketebalan sempadan.

Dalam `TextField`，kita menggunakan:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Ini bermaksud menambah satu sempadan hitam dengan lebar `1 pt` pada kotak input.

Anda juga boleh mencuba warna lain seperti `Color.blue`、`Color.green`，atau menebalkan sempadan dengan `width: 2`。

## Butang simpan

Sekarang, kita mempunyai pembolehubah `amount` untuk memaparkan jumlah keseluruhan, satu `TextField` untuk memasukkan amaun, dan pembolehubah `number` yang diikat dengan kotak input.

Kod semasa adalah seperti berikut:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Tambahkan butang

Seterusnya, kita perlu menambah satu butang untuk mencetuskan operasi simpan wang.

```swift
Button("Save") {
    
}
```

### Laksanakan logik simpan wang

Kita mahu apabila pengguna memasukkan amaun dan menekan butang, amaun itu akan ditambah secara automatik kepada jumlah keseluruhan.

```swift
Button("Save") {
    amount += number
}
```

Di sini kita menggunakan “operator penugasan gabungan” untuk menambah amaun yang dimasukkan oleh pengguna `number` ke dalam jumlah keseluruhan `amount`。

### Tetapkan semula amaun input

Sekarang ada satu masalah: setiap kali butang ditekan, amaun dalam kotak input tidak akan dikosongkan.

Jika pengguna memasukkan `10` dan menekan simpan, kotak input masih menyimpan `10`，yang akan menjejaskan input seterusnya.

Ini kerana `TextField` terikat pada `number`。Apabila kita menekan butang, kita hanya mengubah `amount`，manakala `number` tidak berubah, jadi kotak input masih memaparkan nilai lama.

Kita perlu menambah satu logik pembersihan: apabila butang ditekan, tambah dahulu amaun simpanan, kemudian tetapkan semula amaun input:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Sekarang, apabila pengguna memasukkan amaun dan menekan butang, amaun input akan ditambah kepada jumlah keseluruhan. `number` akan ditetapkan semula kepada `0` supaya pengguna boleh melakukan input seterusnya.

Dengan itu, kita telah melengkapkan semua logik simpan wang untuk “tabung duit syiling”.

## Optimumkan view

Selepas fungsi siap, kita boleh melakukan sedikit pengoptimuman pada antara muka dengan menambah imej latar belakang dan gaya butang.

Tambahkan gaya butang:

```swift
.buttonStyle(.borderedProminent)
```

Tambahkan imej latar belakang:

```swift
.background {
    Image("1")
}
```

Kini, kita telah menyiapkan keseluruhan pembangunan “tabung duit syiling”.

## Kod lengkap

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Kesan akhir:

![Piggy Bank](../../RESOURCE/014_view.png)

Sekarang, kita boleh cuba menyimpan `100` atau lebih banyak wang untuk memeriksa sama ada logik “tabung duit syiling” mempunyai masalah.

Atau jalankan “tabung duit syiling” ini pada simulator atau peranti sebenar untuk merasai aplikasi yang kita bangunkan.

### Output nyahpepijat

Untuk mengesahkan sama ada logiknya betul, kita juga boleh menambah logik nyahpepijat di dalam butang untuk menyemak sama ada amaun yang dimasukkan adalah tepat:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Setiap kali kita menyimpan wang dan menekan butang, kita boleh melihat output nyahpepijat yang sepadan untuk menyemak sama ada terdapat masalah dalam logik kod.

```
---Saving---
amount:11
number:0
```
