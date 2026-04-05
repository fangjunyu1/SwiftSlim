# Interaksi login

Pada pelajaran sebelumnya, kita membuat sebuah tampilan login, dan melalui tombol serta logika pengecekan, kita menerapkan validasi sederhana terhadap konten masukan.

Pada pelajaran ini, kita akan melanjutkan berdasarkan kode dari pelajaran sebelumnya untuk mempelajari kolom input kata sandi `SecureField`, kotak peringatan `Alert`, serta cara mengontrol tampilan view yang berbeda berdasarkan variabel.

Melalui pelajaran ini, kamu dapat lebih memahami alur interaksi dasar dari tampilan login, yang juga merupakan logika dasar yang digunakan di banyak aplikasi.

## Kolom input kata sandi

Pada pelajaran sebelumnya, kita menggunakan `TextField` untuk memasukkan kata sandi.

Namun, pada antarmuka login yang nyata, kata sandi biasanya tidak ditampilkan secara langsung, melainkan ditampilkan sebagai titik-titik atau efek tersembunyi lainnya, agar privasi pengguna terlindungi.

Di SwiftUI, kontrol yang khusus digunakan untuk memasukkan kata sandi adalah `SecureField`.

Sebagai contoh:

```swift
SecureField("Password", text: $password)
```

Cara penulisannya sangat mirip dengan `TextField`, dan juga membutuhkan teks petunjuk serta sebuah variabel yang terikat.

Kita bisa memahaminya secara sederhana seperti ini: `SecureField` juga merupakan sebuah kolom input, hanya saja ia menyembunyikan isi yang dimasukkan.

Kita bisa langsung mengganti `TextField` yang sebelumnya digunakan untuk memasukkan kata sandi menjadi `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ketika pengguna memasukkan kata sandi, isi kata sandi tidak akan ditampilkan langsung di antarmuka.

Efek tampilan:

![password](../../Resource/020_password.png)

Sekarang, kita bisa memasukkan nama pengguna dan kata sandi, lalu setelah menekan tombol, menentukan apakah input tersebut benar.

### Menampilkan pesan umpan balik

Sebelumnya kita terus menggunakan `print` untuk menampilkan hasil.

Isi dari `print` hanya akan muncul di konsol. Pengembang dapat melihatnya ketika menjalankan program di Xcode, tetapi pengguna biasa di ponsel tidak dapat melihat pesan-pesan ini.

Artinya, walaupun program sudah menyelesaikan pengecekan, pengguna tetap tidak mengetahui apakah konten yang dimasukkan sudah benar.

Pada saat ini, kita membutuhkan cara untuk menampilkan pesan secara langsung di antarmuka.

## Kotak peringatan Alert

Di SwiftUI, kita dapat menggunakan `Alert` untuk memunculkan kotak pesan.

Penggunaan dasar:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Bagian kode ini terlihat sedikit lebih rumit daripada kontrol sebelumnya, tetapi kita bisa memahaminya dengan memecahnya.

`Alert` terutama berisi bagian-bagian berikut:

- `"Title"`: judul kotak peringatan
- `isPresented`: nilai Boolean terikat yang digunakan untuk mengontrol apakah kotak peringatan ditampilkan
- `Button(...)`: tombol di dalam kotak peringatan
- `message:`: isi pesan yang ditampilkan di dalam kotak peringatan

Kita bisa memahaminya secara sederhana seperti ini: ketika variabel yang terikat berubah menjadi `true`, sistem akan memunculkan kotak pesan ini.

Efek tampilan:

![alert](../../Resource/020_alert3.png)

Struktur yang sesuai:

![alert](../../Resource/020_alert.png)

### Alert adalah modifier

Seperti banyak modifier yang telah kita pelajari sebelumnya, `Alert` juga ditambahkan setelah view tertentu.

Misalnya, ia bisa ditempelkan setelah tombol:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Ia juga bisa ditempelkan setelah `VStack` bagian luar:

```swift
VStack {
    // ...
}
.alert() {...}
```

Artinya, `Alert` bukanlah sebuah view mandiri yang diletakkan sendiri di antarmuka, melainkan modifier yang menempel pada view tertentu.

Kita bisa memahaminya secara sederhana bahwa `Alert` biasanya ditulis setelah tombol atau layout luar, untuk memunculkan pesan ketika kondisi tertentu terpenuhi.

### Menampilkan Alert

Jika kita ingin menampilkan `Alert`, kita memerlukan sebuah variabel untuk mengontrolnya.

Sebagai contoh:

```swift
@State private var showAlert = false
```

Variabel ini bertipe `Bool`, artinya hanya memiliki dua nilai: `true` atau `false`.

Lalu kita mengikatkannya ke `isPresented` milik `Alert`:

```swift
isPresented: $showAlert
```

Ketika `showAlert` bernilai `false`, kotak peringatan tidak akan ditampilkan; ketika `showAlert` bernilai `true`, kotak peringatan akan muncul.

### Menampilkan kotak peringatan melalui tombol

Sekarang, mari kita terlebih dahulu menerapkan skenario yang paling sederhana:

Ketika pengguna tidak memasukkan apa pun sama sekali dan langsung menekan tombol `Sign in`, munculkan sebuah kotak pesan yang memberitahunya: "Anda belum memasukkan konten apa pun."

Pertama, buat sebuah variabel untuk mengontrol kotak pesan ini:

```swift
@State private var showEmpty = false
```

Kemudian, tambahkan `Alert` di belakang `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Selanjutnya, lakukan pengecekan di dalam kode klik tombol:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Jika `user` dan `password` keduanya kosong, maka kita akan mengubah `showEmpty` menjadi `true`.

Dan karena `Alert` terikat ke variabel ini, ketika nilainya menjadi `true`, sistem akan secara otomatis memunculkan kotak peringatan.

Efek tampilan:

![alert](../../Resource/020_alert1.png)

Dengan cara ini, setelah pengguna menekan tombol, ia bisa langsung melihat pesannya, tanpa perlu pengembang pergi ke konsol untuk memeriksa output `print`.

### Menyempurnakan tombol dan kotak peringatan

Sebelumnya, kita hanya menangani situasi “tidak mengisi apa pun”.

Kita juga masih perlu menangani situasi berikut:

- nama pengguna belum diisi
- kata sandi belum diisi
- nama pengguna dan kata sandi sudah diisi, tetapi input salah

Karena itu, kita juga perlu menyiapkan pesan yang sesuai untuk situasi-situasi ini.

Pertama, tambahkan tiga variabel baru:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Lalu lanjutkan dengan menambahkan `Alert` yang sesuai di belakang tombol:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Selanjutnya, sempurnakan logika penilaian di dalam tombol:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Ketika tombol menentukan bahwa pengguna tidak mengisi informasi apa pun, melewatkan satu informasi, atau validasi input gagal, ia akan mengubah variabel Boolean yang sesuai menjadi `true`, lalu `Alert` yang sesuai akan muncul.

Di sini saya menyarankan agar kamu sendiri mencoba beberapa situasi:

- tidak mengisi apa pun
- hanya mengisi nama pengguna
- hanya mengisi kata sandi
- mengisi nama pengguna dan kata sandi, tetapi dengan isi yang salah
- mengisi nama pengguna dan kata sandi, dan isinya benar

Hal ini untuk memverifikasi apakah kode kita memiliki masalah. Ini juga merupakan tahap “pengujian” yang sangat penting dalam pengembangan aplikasi.

Jika pada suatu skenario program berperilaku tidak benar, itu berarti mungkin ada masalah dalam logika, dan sebuah `Bug` telah muncul di program.

Apa yang sering disebut `Bug` dalam pengembangan merujuk pada kesalahan, celah, atau perilaku yang tidak sesuai harapan.

## Menyelesaikan tampilan login

`Alert` yang dibahas sebelumnya semuanya berkaitan dengan bagaimana memberi tahu pengguna saat “input salah”.

Ketika pengguna memasukkan nama pengguna dan kata sandi yang benar, biasanya kita tidak akan memunculkan “kotak peringatan”, melainkan langsung masuk ke antarmuka setelah login.

Di sini ada konsep yang sangat penting: **menampilkan view yang berbeda berdasarkan nilai variabel.**

Sebagai contoh:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Di sini, kita menggunakan tipe `Bool` untuk mengelola tampilan view:

- jika `login` bernilai `true`, itu berarti login sudah berhasil, dan konten setelah login akan ditampilkan
- jika `login` bernilai `false`, itu berarti login belum berhasil, dan antarmuka login akan terus ditampilkan.

Walaupun pernyataan `if` adalah pernyataan kondisi dalam Swift, di dalam `body` SwiftUI ia dapat digunakan untuk mengontrol logika tampilan view.

Artinya, SwiftUI akan menentukan view mana yang seharusnya ditampilkan saat ini berdasarkan hasil dari kondisi tersebut.

Kita bisa meletakkan logika tampilan ini ke dalam `ContentView` saat ini:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Di sini, kita menambahkan sebuah variabel baru, `login`, untuk menunjukkan apakah pengguna sudah berhasil login atau belum.

Kemudian, kita meletakkan kode tampilan login yang sudah kita tulis sebelumnya di belakang pernyataan `else`.

Logika tampilan view:

- ketika `login` bernilai `false`, itu berarti login masih belum berhasil, sehingga tampilan login asli akan terus ditampilkan.
- ketika `login` bernilai `true`, itu berarti login berhasil; pada saat ini tampilan login tidak lagi ditampilkan, melainkan `Login successful`.

Artinya, `ContentView` akan menampilkan isi view yang berbeda sesuai dengan nilai `login`.

Selanjutnya, mari kita ubah logika keberhasilan login di dalam tombol:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Ketika nama pengguna dan kata sandi yang dimasukkan pengguna keduanya benar, kita akan mengubah `login` menjadi `true`.

Begitu nilai `login` berubah, hasil pengecekan `if` di dalam `ContentView` juga akan berubah, dan antarmuka akan beralih dari tampilan login asli ke `Login successful`.

Efek tampilannya adalah sebagai berikut:

![view](../../Resource/020_view.png)

Sekarang, kita benar-benar telah menerapkan pengetahuan tentang “menampilkan view yang berbeda berdasarkan kondisi” ke dalam halaman login saat ini.

Dalam aplikasi nyata, umumnya memang seperti inilah caranya: view yang berbeda ditampilkan berdasarkan nilai tertentu.

Misalnya, ketika pengguna belum login, halaman login ditampilkan; setelah pengguna berhasil login, antarmuka lain akan ditampilkan.

Gagasan intinya adalah: **mengontrol konten apa yang ditampilkan di antarmuka melalui perubahan variabel.**

## Ringkasan

Dalam pelajaran ini, kita mempelajari tiga hal penting:

1. Menggunakan `SecureField` untuk memasukkan kata sandi, sehingga isi kata sandi tidak langsung ditampilkan di antarmuka.
2. Menggunakan `Alert` untuk menampilkan pesan kepada pengguna, bukan hanya mencetaknya di konsol.
3. Menggunakan variabel dan kondisi `if` untuk mengontrol tampilan view yang berbeda, serta mewujudkan peralihan antara antarmuka sebelum dan sesudah login.

Dengan mempelajari pengetahuan ini, sekarang kita sudah mampu menyelesaikan tampilan login dengan efek interaksi dasar, dan lebih memahami gagasan pengembangan SwiftUI bahwa “keadaan berubah, antarmuka diperbarui”.

## Kode lengkap

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Pengetahuan tambahan - Alert dengan banyak tombol

Pada bagian sebelumnya dari pelajaran ini, kita menggunakan `Alert` yang paling dasar, yang hanya memiliki satu tombol dan terutama digunakan untuk memberi tahu pengguna.

Sebenarnya, `Alert` juga bisa berisi beberapa tombol, sehingga pengguna dapat membuat pilihan yang berbeda.

Sebagai contoh:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Setelah tombol diklik, sebuah kotak pesan dengan tiga opsi akan muncul: `Ok`, `delete`, dan `cancel`.

Efek tampilan:

![alert](../../Resource/020_alert2.png)

Mengklik tombol yang berbeda akan menjalankan kode yang sesuai.

### Properti role pada Button

Di sini kamu akan melihat bahwa `Button` di dalam `Alert` sedikit berbeda dari sintaks tombol biasa yang kita pelajari sebelumnya:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Di sini ada parameter tambahan, yaitu `role`.

Di SwiftUI, `role` digunakan untuk memberi tahu sistem jenis tindakan apa yang diwakili oleh tombol ini.

Beberapa role yang umum adalah:

- `.cancel`: tindakan batal
- `.destructive`: tindakan berbahaya, misalnya menghapus
- `nil`: tindakan biasa

Nilai `role` yang berbeda biasanya juga menghasilkan gaya visual yang berbeda di antarmuka.

Sebagai contoh, tindakan berbahaya sering ditampilkan dengan gaya yang lebih mencolok untuk mengingatkan pengguna agar menekan dengan hati-hati.

Selain itu, `role` juga memberikan informasi semantik tambahan untuk tombol, sehingga memudahkan pembaca layar (seperti VoiceOver di perangkat Apple) menjelaskan fungsi tombol kepada pengguna.

Karena itu, menambahkan `role` pada tombol dalam situasi yang sesuai adalah kebiasaan yang sangat baik.
