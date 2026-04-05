# Tampilan Sign In

Dalam pelajaran ini, kita akan mempelajari skenario yang sangat praktis, yaitu tampilan sign in.

Baik itu situs web maupun aplikasi, dalam banyak situasi saat digunakan, pengguna perlu sign in ke akun mereka dan memasukkan kata sandi.

Sebagai contoh, halaman sign in GitHub:

![WordPress](../../Resource/019_github.png)

Dalam pelajaran ini, kita akan membuat tampilan sign in yang serupa, sehingga pengguna dapat memasukkan akun dan kata sandi secara manual, lalu kita akan memeriksa apakah ada masalah pada konten yang dimasukkan.

## Tata letak atas

Kita akan menulis kode untuk tampilan sign in di file `ContentView`.

Pertama, mari kita tulis area identitas di bagian atas tampilan sign in. Kamu bisa menyiapkan gambar ikon yang sesuai terlebih dahulu, lalu meletakkannya ke dalam folder `Assets`.

![icon](../../Resource/019_icon1.png)

Setelah itu, gunakan `Image` dan modifier untuk menampilkan gambar:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Beberapa modifier ini berarti:

- `resizable()`: memungkinkan ukuran gambar diubah.
- `scaledToFit()`: menskalakan gambar sambil mempertahankan proporsi aslinya.
- `frame(width: 100)`: mengatur lebar tampilan gambar menjadi `100`.

Selanjutnya, gunakan `Text` dan modifier untuk menampilkan judul sign in:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Lalu, gunakan `VStack` untuk menyusun gambar dan teks secara vertikal:

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

Sampai di sini, kita telah menyelesaikan area judul di bagian atas tampilan sign in.

### Mengoptimalkan tata letak

Sekarang, gambar dan judul secara default berada di area tengah dari keseluruhan tata letak.

Jika kita ingin tampilannya lebih seperti "penanda sign in di bagian atas halaman", kita bisa menggunakan `Spacer()` untuk memperluas ruang yang tersisa, sehingga konten ditampilkan lebih dekat ke bagian atas.

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

Namun sekarang, `Image` dan `Text` menjadi terlalu dekat ke bagian atas layar, sehingga terlihat agak padat.

Pada saat ini, kita bisa menggunakan `padding` untuk menambahkan jarak di bagian atas ke seluruh `VStack`.

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

Dengan begitu, area judul di bagian atas halaman terlihat lebih sesuai.

## Username dan kata sandi

Halaman sign in biasanya memerlukan pengguna untuk memasukkan username dan kata sandi.

Di SwiftUI, kita bisa menggunakan `TextField` untuk menerima konten yang dimasukkan pengguna.

Namun perlu diperhatikan: `TextField` sendiri tidak menyimpan data input dalam jangka panjang, ia hanya sebuah kontrol input. Yang benar-benar menyimpan konten input tersebut adalah variabel yang kita bind kepadanya.

Karena itu, pertama-tama kita perlu membuat dua variabel `@State` untuk menyimpan username dan kata sandi:

```swift
@State private var user = ""
@State private var password = ""
```

Ketika nilai variabel `@State` berubah, SwiftUI akan otomatis menyegarkan tampilan yang terkait.

Selanjutnya, gunakan `TextField` untuk membind kedua variabel ini:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Di sini, `$user` dan `$password` berarti "binding".

Artinya, ketika pengguna mengetik teks di kotak input, nilai variabel akan berubah pada saat yang sama; dan ketika nilai variabel berubah, konten yang ditampilkan di kotak input juga akan berubah secara sinkron.

Hubungan ketika "tampilan dan data saling tersinkronisasi" inilah yang disebut binding.

Perhatikan bahwa di sini kita harus menggunakan penulisan dengan `$`:

```swift
$user
```

Karena `TextField` tidak membutuhkan string biasa, tetapi sebuah nilai binding yang "dapat mengubah data secara dua arah".

### Menampilkan kotak input

Mari kita letakkan semuanya di dalam `ContentView`:

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

Hasil tampilan:

![view](../../Resource/019_view3.png)

Karena saat ini `user` dan `password` keduanya adalah string kosong secara default:

```swift
""
```

maka kotak input akan terlebih dahulu menampilkan teks placeholder, misalnya:

```swift
input user
```

Teks ini hanya memberi tahu pengguna "apa yang harus dimasukkan di sini", dan bukan konten input yang sebenarnya.

### Mengoptimalkan kotak input

Sekarang kotak input sudah bisa digunakan, tetapi gaya default-nya relatif sederhana.

Agar antarmuka lebih jelas, kita bisa menambahkan judul di depan kotak input, lalu melakukan sedikit optimasi gaya pada kotak input itu sendiri.

Sebagai contoh, tambahkan judul terlebih dahulu:

```swift
Text("Username")
    .fontWeight(.bold)
```

Lalu, gunakan `HStack` untuk meletakkan judul dan kotak input di baris yang sama:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Di sini kita menggunakan `HStack` karena kita ingin "menampilkan judul di kiri dan kotak input di kanan".

Perlu diperhatikan bahwa `TextField` secara default akan menempati sisa ruang yang tersedia.

![color](../../Resource/019_view6.png)

Agar ukuran dua kotak input lebih seragam, kita bisa menggunakan `frame(width:)` untuk mengatur lebarnya, sehingga kotak input terlihat lebih rapi.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Lalu tambahkan juga border agar kotak input terlihat lebih jelas:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Sekarang, mari kita tambahkan username dan kata sandi ke dalam tampilan `ContentView`:

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

Hasil tampilan:

![view](../../Resource/019_view4.png)

Sampai di sini, pengguna sudah bisa memasukkan username dan kata sandi.

## Tombol sign in

Berikutnya, kita tambahkan tombol sign in di bawah kotak input.

```swift
Button("Sign in") {

}
```

Lalu, gunakan `buttonStyle` untuk memberi tombol gaya sistem yang lebih menonjol:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Hasil tampilan:

![view](../../Resource/019_view5.png)

Untuk memastikan bahwa tombol benar-benar merespons ketukan, kita bisa terlebih dahulu menulis `print` di dalam tombol untuk mengujinya:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Saat tombol diketuk, konsol akan menampilkan:

```swift
click Sign in
```

Ini menunjukkan bahwa tombol sudah berhasil merespons aksi ketuk.

## Logika sign in

Sekarang, kita tambahkan logika validasi paling dasar ke tombol sign in: **memeriksa apakah pengguna sudah memasukkan username dan kata sandi**.

Kita ingin mewujudkan situasi berikut:

- Jika pengguna tidak memasukkan apa pun, keluarkan `Empty`
- Jika pengguna hanya memasukkan salah satunya, beri tahu mana yang kurang
- Jika username dan kata sandi keduanya sudah dimasukkan, keluarkan `Success`

### Tidak ada informasi yang dimasukkan

Karena `user` dan `password` keduanya adalah string kosong secara default:

```swift
@State private var user = ""
@State private var password = ""
```

maka saat pengguna tidak memasukkan apa pun, nilainya tetap kosong.

Dalam Swift, tipe seperti `String` bisa menggunakan `isEmpty` untuk menentukan apakah isinya kosong.

### Properti isEmpty

`isEmpty` sering digunakan untuk memeriksa apakah string, array, dan konten lainnya kosong.

Contohnya:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Jika kontennya kosong, `isEmpty` akan mengembalikan `true`; jika kontennya tidak kosong, maka akan mengembalikan `false`.

Karena itu, kita bisa memanfaatkannya untuk menentukan apakah username dan kata sandi memiliki konten input.

### Menggunakan isEmpty untuk memeriksa variabel

Jika pengguna tidak memasukkan informasi apa pun, maka:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Pada saat ini, kita bisa menulis kondisinya seperti ini:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Kode ini berarti: jika `user` kosong, dan `password` juga kosong, maka tampilkan:

```swift
Empty
```

Di sini, `&&` adalah operator logika dan berarti "dan".

Artinya, seluruh kondisi hanya bernilai benar jika kondisi di sebelah kiri benar dan kondisi di sebelah kanan juga benar.

Karena itu, kode ini hanya akan dijalankan ketika username dan kata sandi sama-sama kosong.

## Pengguna hanya mengisi sebagian

Selanjutnya, mari kita pertimbangkan situasi lain: pengguna hanya mengisi username, atau hanya mengisi kata sandi.

Contohnya:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Pada saat ini, username tidak kosong, tetapi kata sandi kosong.

Kita bisa terus menggunakan `isEmpty` untuk memeriksanya:

### Situasi ketika pengguna mengisi akun atau kata sandi

Jika pengguna hanya mengisi username atau kata sandi, kita perlu memberikan pengingat yang sesuai tentang apa yang masih kurang.

Sebagai contoh, jika pengguna hanya mengisi username:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika dari kode ini adalah: jika username kosong, minta untuk memasukkan username. Jika tidak, periksa apakah kata sandi kosong, dan jika kosong, minta untuk memasukkan kata sandi.

### Pengguna mengisi semua informasi

Jika username dan kata sandi keduanya sudah dimasukkan, maka `isEmpty` akan mengembalikan `false` untuk keduanya.

Pada saat ini, kita bisa menuliskannya seperti ini:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Di sini, `!` berarti "negasi".

Contohnya:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Artinya, `user.isEmpty` digunakan untuk menentukan "apakah username kosong", sedangkan `!user.isEmpty` digunakan untuk menentukan "apakah username tidak kosong".

Kata sandi mengikuti logika yang sama.

Jadi, makna kode ini adalah: username tidak kosong, dan kata sandi juga tidak kosong.

Ketika kedua kondisi ini benar, hasilnya adalah:

```swift
Success
```

## Logika validasi lengkap

Sekarang, mari kita gabungkan ketiga situasi ini dan tuliskan ke dalam `Button`:

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

Urutan eksekusi kode ini bisa dipahami seperti ini:

Langkah pertama, kita periksa dulu:

```swift
if user.isEmpty && password.isEmpty
```

Jika username dan kata sandi sama-sama kosong, maka langsung mengeluarkan `Empty`.

Jika keduanya tidak sama-sama kosong, maka kita lanjut memeriksa baris ini:

```swift
else if user.isEmpty || password.isEmpty
```

Di sini, `||` berarti "atau".

Artinya, selama salah satu kondisi benar, maka seluruh kondisi bernilai benar.

Karena itu, selama username kosong, atau kata sandi kosong, blok kode `else if` akan dijalankan.

Setelah masuk ke dalam blok kode, kita periksa lebih lanjut kotak input mana yang belum diisi:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Jika tidak satu pun dari dua kondisi sebelumnya bernilai benar, itu berarti username tidak kosong, dan kata sandi juga tidak kosong.

Maka program akan masuk ke `else` terakhir:

```swift
print("Success")
```

Dengan begitu, kita telah menyelesaikan logika validasi input sign in yang paling dasar.

## Validasi username dan kata sandi

Logika di atas hanya memeriksa "apakah ada konten yang dimasukkan atau tidak".

Namun dalam aplikasi nyata, hanya memasukkan konten saja tidak cukup. Biasanya kita juga perlu mengirim username dan kata sandi ke server untuk diverifikasi.

Jika server memastikan bahwa username ada dan kata sandinya benar, maka server akan mengizinkan sign in; jika tidak, server akan memberi tahu bahwa sign in gagal.

Untuk berlatih proses ini, kita bisa terlebih dahulu menetapkan akun dan kata sandi sementara di dalam kode untuk mensimulasikan "informasi sign in yang benar":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Ketika username dan kata sandi sama-sama tidak kosong, kita kemudian membandingkan apakah keduanya benar:

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

Di sini, `==` berarti "apakah sama dengan".

Contohnya:

```swift
user == userID
```

Artinya, apakah username yang dimasukkan pengguna benar-benar sama dengan username yang benar yang kita tetapkan? Pemeriksaan kata sandi juga mengikuti logika yang sama.

Karena itu, ketika username dan kata sandi yang dimasukkan sama dengan nilai yang ditetapkan, hasilnya akan `Success`; selama salah satunya tidak sama, hasilnya akan `Input error`.

Dengan begitu, kita telah menyelesaikan sebuah "verifikasi sign in simulasi" yang sederhana.

Walaupun ini masih belum menjadi fitur sign in nyata yang terhubung ke server, ini sudah cukup untuk membantu kita memahami: **setelah tombol diketuk, kode yang berbeda dapat dijalankan berdasarkan kondisi yang berbeda**.

## Ringkasan

Dalam pelajaran ini, kita telah menyelesaikan tampilan sign in dasar, dan secara khusus mempelajari "logika untuk menilai konten input berdasarkan kondisi".

Isi inti dari pelajaran ini adalah: menggunakan `isEmpty` untuk menentukan apakah sebuah string kosong, dan menggunakan pernyataan `if` bersama operator logika untuk menangani berbagai situasi.

Di antaranya, ada dua operator logika yang sangat penting:

- `&&`: berarti "dan", kedua kondisi harus terpenuhi
- `||`: berarti "atau", cukup satu kondisi saja yang terpenuhi

Ketika kondisi-kondisi ini akhirnya menghasilkan `true` atau `false`, pernyataan `if` akan menjalankan kode yang berbeda sesuai hasilnya.

Melalui tampilan sign in ini, kita sudah mulai bersentuhan dengan cara pengembangan yang menggabungkan "antarmuka + data + penilaian logis".

## Kode lengkap

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
