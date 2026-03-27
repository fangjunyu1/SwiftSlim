# Membuat butang berfungsi

Dalam pelajaran ini, kita akan mempelajari butang `Button`、`print` untuk mengeluarkan maklumat nyahpepijat, serta fungsi dalam Swift.

Kandungan ini ialah asas pengaturcaraan interaktif dalam SwiftUI.

## Butang

Butang ialah kawalan UI yang paling biasa kita lihat. Apabila kita perlu memuat turun, membuka atau keluar, biasanya kita akan menekan butang.

Contohnya, dalam App Store, kita menekan butang “Dapatkan” untuk memuat turun App.

![Button](../../RESOURCE/008_button.png)

Dalam SwiftUI, butang diwakili menggunakan `Button`。

Cara asas:

```swift
Button("") {
    
}
```

Strukturnya boleh dibahagikan kepada dua bahagian:

```swift
Button("Teks butang") {
    Kod yang dijalankan apabila butang ditekan
}
```

Contohnya:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Selepas dijalankan, satu butang `Start` akan dipaparkan.

![Button](../../RESOURCE/008_button1.png)

Apabila pengguna menekan butang, kod di dalam `{}` akan dijalankan.

Perlu diperhatikan bahawa `Button` ialah kawalan antara muka（`View`）dalam SwiftUI, jadi ia mesti ditulis di dalam `body`。

### Modifier buttonStyle

Dalam SwiftUI, `Button` menyediakan gaya butang terbina dalam sistem, dan ia boleh digunakan melalui modifier `buttonStyle`。

Contohnya:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` akan menggunakan gaya butang yang disediakan oleh sistem.

Pilihan yang biasa termasuk:

- .automatic
- .plain
- .bordered
- .borderedProminent
- .borderless

![Button](../../RESOURCE/008_button7.png)

Perbezaan antara gaya-gaya ini terutamanya terletak pada sama ada butang mempunyai sempadan, latar belakang dan tahap penekanan visual.

## Output print

Dalam pengaturcaraan, kita sering perlu melihat sama ada program telah sampai ke bahagian kod tertentu.

Swift menyediakan fungsi `print` untuk mengeluarkan maklumat nyahpepijat.

Cara asas:

```swift
print("Hello")
```

Baris kod ini akan mengeluarkan teks ke `Console`（konsol）。

### Menguji sama ada butang boleh digunakan

Kita boleh menulis `print` di dalam butang untuk menguji sama ada butang benar-benar telah ditekan.

```swift
Button("Start") {
    print("Test 123")
}
```

Apabila butang ditekan, `Console` akan memaparkan:

```
Test 123
```

Ini menunjukkan bahawa butang telah berjaya dicetuskan.

![Button](../../RESOURCE/008_button3.png)

Perhatian: `print` ialah kod Swift, bukan kawalan antara muka. Ia tidak boleh diletakkan terus di dalam `body`, jika tidak ralat akan berlaku.

Contohnya, penulisan berikut adalah salah:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Ralat: body mesti memulangkan satu View
    }
}
```

Dalam SwiftUI, `body` digunakan untuk menerangkan struktur antara muka, jadi ia hanya boleh mengandungi kawalan antara muka（`View`）, seperti `Text`、`Button`、`Image` dan sebagainya.

Kod biasa（logik pengiraan, `print` dan lain-lain）mesti diletakkan dalam butang, fungsi atau pengendali peristiwa yang lain.

### Console

Kandungan yang dikeluarkan oleh `print` akan dipaparkan dalam `Console` Xcode.

Jika anda tidak nampak `Console`, anda boleh klik butang `Show the Debug Area` di penjuru kanan bawah untuk membuka kawasan nyahpepijat, kemudian klik butang `Show the Console` untuk memaparkan konsol.

![](../../RESOURCE/008_button4.png)

Di bahagian kiri bawah `Console` terdapat dua tab: `Executable` dan `Previews`。

![](../../RESOURCE/008_button5.png)

Dua tab ini sepadan dengan persekitaran pelaksanaan yang berbeza: apabila berada dalam paparan pratonton Canvas, output `print` akan dipaparkan di bawah tab `Previews`; jika aplikasi dijalankan dalam simulator atau peranti sebenar, output akan dipaparkan di bawah tab `Executable`。

Oleh itu, apabila anda mendapati `print` tidak mengeluarkan apa-apa, anda boleh terlebih dahulu memastikan sama ada anda telah memilih tab yang betul.

## Contoh - ASCII art

Dalam sesetengah projek kod, kita sering dapat melihat ASCII art.

ASCII art ialah corak yang dibentuk menggunakan aksara biasa. Contohnya:

![ASCII](../../RESOURCE/008_ascii.png)

Kita boleh menggunakan butang + `print` untuk mengeluarkan satu ASCII art.

Kod contoh:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Apabila butang ditekan, `Console` akan memaparkan:

```
 /\_/\
( o.o )
 > ^ <
```

Perhatian: tanda `\` dalam rentetan perlu ditulis sebagai `\\`，kerana garis condong terbalik ialah aksara escape dalam rentetan.

## Fungsi

Di dalam butang, kita boleh menulis kod secara terus.

Contohnya:

```swift
Button("Start") {
    print("Hello")
}
```

Jika kodnya sedikit, cara ini tidak menjadi masalah. Tetapi dalam pembangunan sebenar, logik yang dicetuskan oleh satu butang mungkin sangat banyak.

Contohnya:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Mungkin masih ada banyak lagi kod
}
```

Jika kod semakin banyak, menulisnya terus di dalam butang akan menjadikan kod antara muka menjadi serabut dan juga sukar dibaca serta diselenggara.

Oleh itu, biasanya kita akan menyusun kod tersebut ke dalam satu fungsi, kemudian memanggil fungsi itu di dalam butang.

### Apakah itu fungsi

Fungsi ialah satu bahagian kod yang boleh digunakan berulang kali.

Apabila kita perlu melaksanakan sesuatu kod, kita hanya perlu memanggil fungsi tersebut, dan kod di dalam fungsi itu akan dijalankan.

Ini boleh menjadikan struktur kod lebih jelas, dan juga lebih mudah digunakan semula.

### Penulisan asas

Dalam Swift, fungsi ditakrifkan menggunakan kata kunci **func**：

```swift
func randomInt() {
    // code
}
```

Kod ini mentakrifkan satu fungsi.

`randomInt` ialah nama fungsi, digunakan untuk mengenal pasti bahagian kod ini.

`()` menunjukkan kedudukan parameter, di mana kita boleh menerima data yang dihantar dari luar. Jika tiada data diperlukan, ia boleh dibiarkan kosong.

Bahagian `{}` ialah kawasan kod fungsi, dan semua kod yang perlu dilaksanakan akan ditulis di sini.

Contohnya:

```swift
func getName() {
    print("FangJunyu")
}
```

Fungsi ini bertujuan untuk mengeluarkan satu baris teks.

### Memanggil fungsi

Mentakrifkan fungsi hanya bermaksud mencipta bahagian kod tersebut. Jika anda mahu melaksanakannya, anda masih perlu memanggil fungsi itu.

Cara memanggilnya ialah dengan menambah `()` selepas nama fungsi:

```swift
getName()
```

Apabila program berjalan sampai ke baris ini, kod dalam fungsi `getName` akan dijalankan.

Contoh lengkap:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Selepas dijalankan, `Console` akan memaparkan:

```
FangJunyu
```

### Menggunakan fungsi dalam SwiftUI

Dalam SwiftUI view, fungsi biasanya ditulis di luar `body`。

Contohnya:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Apabila butang ditekan, fungsi `getName()` akan dipanggil.

Dengan cara ini, kod antara muka dapat dikekalkan ringkas, manakala logik khusus diproses di dalam fungsi.

### Parameter fungsi

Kadangkala sesuatu fungsi perlu melaksanakan operasi yang berbeza berdasarkan data yang berbeza.

Contohnya, kita mahu fungsi boleh mengeluarkan nama yang berbeza, bukannya hanya nama tetap `"FangJunyu"`。

Dalam keadaan ini, kita boleh menggunakan parameter. Parameter boleh difahami sebagai data yang dihantar ketika fungsi dipanggil.

Contohnya:

```swift
func getName(name: String) {
    print(name)
}
```

Fungsi ini menambah satu parameter baharu. `name` ialah nama parameter, dan `String` ialah jenis parameter.

Ini bermaksud fungsi tersebut perlu menerima data jenis `String`。

Disebabkan fungsi kini memerlukan data, maka data itu mesti disediakan ketika memanggilnya.

```swift
getName(name: "Sam")
```

Apabila `"Sam"` dihantar semasa panggilan, fungsi akan menggunakan nilai ini untuk dipaparkan.

Hasil pelaksanaan:

```
Sam
```

## Contoh - Menggunakan fungsi untuk mengeluarkan ASCII art

Dalam contoh sebelumnya, kita menulis `print` secara terus di dalam butang.

Tetapi jika ASCII art itu lebih kompleks, kod akan menjadi panjang. Dalam keadaan ini, kita boleh meletakkan logik itu ke dalam fungsi supaya kod antara muka menjadi lebih jelas.

Kod contoh:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Selepas dijalankan dan butang ditekan, `Console` akan memaparkan:

```
 /\_/\
( o.o )
 > ^ <
```

Di sini, dua perkara berlaku apabila pengguna menekan butang:

1. Butang memanggil fungsi `printCat()`
2. Kod `print` di dalam fungsi dilaksanakan

Dengan cara ini, kod antara muka hanya bertanggungjawab untuk mencetuskan peristiwa, manakala logik khusus diletakkan di dalam fungsi.

Dalam pembangunan sebenar, kebanyakan operasi butang akan dilaksanakan melalui fungsi.

## Ringkasan

Dalam pelajaran ini, kita mempelajari tiga kandungan penting:

**1. Butang Button**

`Button` ialah kawalan dalam SwiftUI yang digunakan untuk mencetuskan operasi.

```swift
Button("Start") {

}
```

Apabila pengguna menekan butang, kod di dalam pendakap kerinting akan dilaksanakan.

**2. Output print**

`print` digunakan untuk mengeluarkan maklumat nyahpepijat ke `Console`。

```swift
print("Hello")
```

Pembangun boleh melihat status pelaksanaan program melalui `Console`。

**3. Fungsi**

Fungsi ialah satu bahagian kod yang boleh digunakan berulang kali.

```swift
func sayHello() {
    print("Hello")
}
```

Memanggil fungsi:

```swift
sayHello()
```

Jika fungsi memerlukan data, anda boleh menggunakan parameter:

```swift
func sayHello(name: String) {
    print(name)
}
```

Dalam pelajaran seterusnya, kita akan terus mempelajari lebih banyak kawalan SwiftUI serta cara data berinteraksi dengan antara muka.

## Latihan

Cuba lengkapkan latihan berikut:

1. Cipta satu butang dengan teks `"Hello"`
2. Apabila butang ditekan, paparkan `Hello Swift` dalam `Console`
3. Tulis kod output itu ke dalam satu fungsi, kemudian panggil fungsi itu di dalam butang
