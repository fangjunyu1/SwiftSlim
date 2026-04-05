# Paparan Sign In

Dalam pelajaran ini, kita akan mempelajari satu situasi yang sangat praktikal, iaitu paparan sign in.

Sama ada laman web atau aplikasi, dalam proses penggunaan, pengguna selalunya perlu sign in ke akaun mereka dan memasukkan kata laluan.

Sebagai contoh, halaman sign in GitHub:

![WordPress](../../Resource/019_github.png)

Dalam pelajaran ini, kita akan membuat paparan sign in yang serupa, supaya pengguna boleh memasukkan akaun dan kata laluan secara manual, dan kita akan memeriksa sama ada terdapat masalah pada kandungan yang dimasukkan.

## Susun atur atas

Kita akan menulis kod paparan sign in dalam fail `ContentView`.

Pertama, mari kita tulis kawasan penanda di bahagian atas paparan sign in. Anda boleh menyediakan imej ikon yang sesuai terlebih dahulu dan meletakkannya dalam folder `Assets`.

![icon](../../Resource/019_icon1.png)

Selepas itu, gunakan `Image` dan modifier untuk memaparkan imej:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Modifier ini bermaksud:

- `resizable()`: membolehkan saiz imej diubah.
- `scaledToFit()`: menskalakan imej sambil mengekalkan nisbah asalnya.
- `frame(width: 100)`: menetapkan lebar paparan imej kepada `100`.

Seterusnya, gunakan `Text` dan modifier untuk memaparkan tajuk sign in:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Kemudian, gunakan `VStack` untuk menyusun imej dan teks secara menegak:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Hasil:

![view](../../Resource/019_view.png)

Setakat ini, kita telah menyiapkan kawasan tajuk di bahagian atas paparan sign in.

### Mengoptimumkan susun atur

Buat masa ini, imej dan tajuk secara lalai berada di kawasan tengah keseluruhan susun atur.

Jika kita mahu ia kelihatan lebih seperti “penanda sign in di bahagian atas halaman”, kita boleh menggunakan `Spacer()` untuk meluaskan ruang yang tinggal supaya kandungan dipaparkan lebih dekat ke bahagian atas.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Hasil:

![view](../../Resource/019_view1.png)

Tetapi sekarang, `Image` dan `Text` menjadi terlalu dekat dengan bahagian atas skrin, jadi ia kelihatan agak padat.

Pada masa ini, kita boleh menggunakan `padding` untuk menambah jarak di bahagian atas kepada keseluruhan `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Hasil:

![view](../../Resource/019_view2.png)

Dengan cara ini, kawasan tajuk di bahagian atas halaman kelihatan lebih sesuai.

## Nama pengguna dan kata laluan

Halaman sign in biasanya memerlukan pengguna memasukkan nama pengguna dan kata laluan.

Dalam SwiftUI, kita boleh menggunakan `TextField` untuk menerima kandungan yang dimasukkan oleh pengguna.

Tetapi ada perkara yang perlu diberi perhatian: `TextField` sendiri tidak menyimpan data input untuk jangka masa panjang, ia hanyalah kawalan input. Yang benar-benar menyimpan kandungan input ini ialah pemboleh ubah yang kita bind kepadanya.

Oleh itu, kita perlu terlebih dahulu mencipta dua pemboleh ubah `@State` untuk menyimpan nama pengguna dan kata laluan:

```swift
@State private var user = ""
@State private var password = ""
```

Apabila nilai pemboleh ubah `@State` berubah, SwiftUI akan menyegarkan paparan yang berkaitan secara automatik.

Seterusnya, gunakan `TextField` untuk membind kedua-dua pemboleh ubah ini:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Di sini, `$user` dan `$password` mewakili “binding”.

Ini bermaksud, apabila pengguna menaip teks dalam kotak input, nilai pemboleh ubah akan berubah pada masa yang sama; dan apabila pemboleh ubah berubah, kandungan yang dipaparkan dalam kotak input juga akan berubah secara serentak.

Hubungan apabila “paparan dan data saling diselaraskan” inilah yang dipanggil binding.

Perhatikan bahawa di sini kita perlu menggunakan penulisan dengan `$`:

```swift
$user
```

Ini kerana `TextField` tidak memerlukan string biasa, tetapi satu nilai binding yang “boleh mengubah data secara dua hala”.

### Memaparkan kotak input

Mari kita letakkannya ke dalam `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Hasil paparan:

![view](../../Resource/019_view3.png)

Oleh sebab `user` dan `password` kini kedua-duanya ialah string kosong secara lalai:

```swift
""
```

kotak input akan terlebih dahulu memaparkan teks placeholder, contohnya:

```swift
input user
```

Teks ini hanya memberitahu pengguna “apa yang patut dimasukkan di sini”, dan bukan kandungan input yang sebenar.

### Mengoptimumkan kotak input

Kini kotak input sudah boleh digunakan, tetapi gaya lalainya agak ringkas.

Untuk menjadikan antaramuka lebih jelas, kita boleh menambah tajuk di hadapan kotak input, dan melakukan sedikit pengoptimuman gaya pada kotak input itu sendiri.

Sebagai contoh, mula-mula tambahkan satu tajuk:

```swift
Text("Username")
    .fontWeight(.bold)
```

Kemudian, gunakan `HStack` untuk meletakkan tajuk dan kotak input pada baris yang sama:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Di sini kita menggunakan `HStack` kerana kita mahu “memaparkan tajuk di sebelah kiri dan kotak input di sebelah kanan”.

Perlu diberi perhatian bahawa `TextField` secara lalai akan memenuhi ruang kosong yang tinggal.

![color](../../Resource/019_view6.png)

Untuk menjadikan saiz kedua-dua kotak input lebih seragam, kita boleh menggunakan `frame(width:)` untuk menetapkan lebarnya supaya kotak input kelihatan lebih kemas.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Selepas itu, tambahkan juga border supaya kotak input lebih jelas kelihatan:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Sekarang, mari kita tambahkan kedua-dua nama pengguna dan kata laluan ke dalam paparan `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Hasil paparan:

![view](../../Resource/019_view4.png)

Sampai di sini, pengguna sudah boleh memasukkan nama pengguna dan kata laluan.

## Butang sign in

Seterusnya, kita akan menambah satu butang sign in di bawah kotak input.

```swift
Button("Sign in") {

}
```

Kemudian, gunakan `buttonStyle` untuk memberikan butang gaya sistem yang lebih jelas:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Hasil paparan:

![view](../../Resource/019_view5.png)

Untuk mengesahkan bahawa butang benar-benar bertindak balas terhadap ketikan, kita boleh terlebih dahulu menulis `print` di dalam butang untuk mengujinya:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Apabila butang diketuk, konsol akan memaparkan:

```swift
click Sign in
```

Ini menunjukkan bahawa butang sudah berjaya bertindak balas terhadap tindakan ketik.

## Logik sign in

Sekarang, kita akan menambah logik pengesahan yang paling asas pada butang sign in: **memeriksa sama ada pengguna telah memasukkan nama pengguna dan kata laluan**.

Kita mahu mencapai situasi berikut:

- Jika pengguna tidak memasukkan apa-apa, keluarkan `Empty`
- Jika pengguna hanya memasukkan salah satu daripadanya, beritahu apa yang masih kurang
- Jika nama pengguna dan kata laluan kedua-duanya telah dimasukkan, keluarkan `Success`

### Tiada maklumat dimasukkan

Oleh sebab `user` dan `password` kedua-duanya ialah string kosong secara lalai:

```swift
@State private var user = ""
@State private var password = ""
```

maka apabila pengguna tidak memasukkan apa-apa, nilainya akan kekal kosong.

Dalam Swift, jenis seperti `String` boleh menggunakan `isEmpty` untuk menentukan sama ada kandungannya kosong.

### Sifat isEmpty

`isEmpty` sering digunakan untuk memeriksa sama ada string, tatasusunan, dan kandungan lain kosong.

Contohnya:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Jika kandungannya kosong, `isEmpty` akan memulangkan `true`; jika kandungannya tidak kosong, ia akan memulangkan `false`.

Oleh itu, kita boleh menggunakannya untuk menentukan sama ada nama pengguna dan kata laluan mempunyai kandungan input.

### Menggunakan isEmpty untuk memeriksa pemboleh ubah

Jika pengguna tidak memasukkan sebarang maklumat, maka:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Pada masa ini, kita boleh menulis syarat seperti ini:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Kod ini bermaksud: jika `user` kosong, dan `password` juga kosong, maka keluarkan:

```swift
Empty
```

Di sini, `&&` ialah operator logik dan bermaksud “dan”.

Maksudnya, seluruh syarat hanya benar apabila syarat di sebelah kiri benar dan syarat di sebelah kanan juga benar.

Oleh itu, kod ini hanya akan dijalankan apabila nama pengguna dan kata laluan kedua-duanya kosong.

## Pengguna hanya mengisi sebahagian

Seterusnya, mari kita pertimbangkan satu lagi situasi: pengguna hanya mengisi nama pengguna, atau hanya mengisi kata laluan.

Contohnya:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Pada masa ini, nama pengguna tidak kosong, tetapi kata laluan kosong.

Kita boleh terus menggunakan `isEmpty` untuk memeriksanya:

### Situasi apabila pengguna mengisi akaun atau kata laluan

Jika pengguna hanya mengisi nama pengguna atau kata laluan, kita perlu memberikan peringatan yang sesuai tentang apa yang kurang.

Contohnya, jika pengguna hanya mengisi nama pengguna:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logik kod ini ialah: jika nama pengguna kosong, minta pengguna memasukkan nama pengguna. Jika tidak, periksa sama ada kata laluan kosong, dan jika kosong, minta pengguna memasukkan kata laluan.

### Pengguna mengisi semua maklumat

Jika nama pengguna dan kata laluan kedua-duanya sudah dimasukkan, maka `isEmpty` akan memulangkan `false` untuk kedua-duanya.

Pada masa ini, kita boleh menulisnya seperti ini:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Di sini, `!` bermaksud “penafian”.

Contohnya:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Maksudnya, `user.isEmpty` digunakan untuk menentukan “adakah nama pengguna kosong”, manakala `!user.isEmpty` digunakan untuk menentukan “adakah nama pengguna tidak kosong”.

Kata laluan juga mengikut logik yang sama.

Jadi, maksud kod ini ialah: nama pengguna tidak kosong, dan kata laluan juga tidak kosong.

Apabila kedua-dua syarat ini benar, hasilnya ialah:

```swift
Success
```

## Logik pengesahan lengkap

Sekarang, mari kita gabungkan ketiga-tiga situasi ini dan tuliskannya ke dalam `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Urutan pelaksanaan kod ini boleh difahami seperti ini:

Langkah pertama, kita periksa dahulu:

```swift
if user.isEmpty && password.isEmpty
```

Jika nama pengguna dan kata laluan kedua-duanya kosong, ia akan terus mengeluarkan `Empty`.

Jika kedua-duanya tidak sama-sama kosong, kita teruskan memeriksa baris ini:

```swift
else if user.isEmpty || password.isEmpty
```

Di sini, `||` bermaksud “atau”.

Maksudnya, selagi salah satu syarat benar, seluruh syarat adalah benar.

Oleh itu, selagi nama pengguna kosong, atau kata laluan kosong, blok kod `else if` akan dijalankan.

Selepas masuk ke dalam blok kod, kita periksa dengan lebih lanjut kotak input mana yang belum diisi:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Jika kedua-dua syarat sebelumnya tidak benar, itu bermaksud nama pengguna tidak kosong, dan kata laluan juga tidak kosong.

Maka program akan masuk ke `else` terakhir:

```swift
print("Success")
```

Dengan cara ini, kita melengkapkan logik pengesahan input sign in yang paling asas.

## Pengesahan nama pengguna dan kata laluan

Logik di atas hanya memeriksa “sama ada ada kandungan yang dimasukkan atau tidak”.

Tetapi dalam aplikasi sebenar, hanya memasukkan kandungan sahaja tidak mencukupi. Biasanya kita juga perlu menghantar nama pengguna dan kata laluan ke pelayan untuk disahkan.

Jika pelayan mengesahkan bahawa nama pengguna wujud dan kata laluan adalah betul, ia akan membenarkan sign in; jika tidak, ia akan memberitahu bahawa sign in telah gagal.

Untuk berlatih proses ini, kita boleh terlebih dahulu menetapkan satu akaun dan kata laluan sementara dalam kod untuk mensimulasikan “maklumat sign in yang betul”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Apabila nama pengguna dan kata laluan kedua-duanya tidak kosong, kita kemudian membandingkan sama ada kedua-duanya betul:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Di sini, `==` bermaksud “adakah ia sama”.

Contohnya:

```swift
user == userID
```

Ini bermaksud, adakah nama pengguna yang dimasukkan oleh pengguna benar-benar sama dengan nama pengguna yang betul yang telah kita tetapkan? Pemeriksaan kata laluan juga mengikut logik yang sama.

Oleh itu, apabila nama pengguna dan kata laluan yang dimasukkan adalah sama dengan nilai yang ditetapkan, hasilnya ialah `Success`; selagi salah satu daripadanya tidak sama, hasilnya ialah `Input error`.

Dengan cara ini, kita telah melengkapkan satu “pengesahan sign in simulasi” yang mudah.

Walaupun ini masih belum menjadi ciri sign in sebenar yang disambungkan ke pelayan, ia sudah cukup untuk membantu kita memahami: **selepas butang diketuk, kod yang berbeza boleh dijalankan berdasarkan syarat yang berbeza**.

## Ringkasan

Dalam pelajaran ini, kita telah melengkapkan satu paparan sign in asas, dan secara khusus mempelajari “logik untuk menilai kandungan input berdasarkan syarat”.

Isi utama pelajaran ini ialah: menggunakan `isEmpty` untuk menentukan sama ada sesuatu string kosong, dan menggunakan pernyataan `if` bersama operator logik untuk mengendalikan situasi yang berbeza.

Antara operator tersebut, terdapat dua operator logik yang sangat penting:

- `&&`: bermaksud “dan”, kedua-dua syarat mesti dipenuhi
- `||`: bermaksud “atau”, memadai jika satu syarat dipenuhi

Apabila syarat-syarat ini akhirnya menghasilkan `true` atau `false`, pernyataan `if` akan menjalankan kod yang berbeza berdasarkan hasilnya.

Melalui paparan sign in ini, kita sudah mula mengenali kaedah pembangunan yang menggabungkan “antara muka + data + penilaian logik”.

## Kod lengkap

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
