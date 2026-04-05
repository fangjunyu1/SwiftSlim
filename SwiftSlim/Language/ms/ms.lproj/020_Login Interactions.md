# Interaksi log masuk

Dalam pelajaran sebelum ini, kita telah membuat satu paparan log masuk, dan melalui butang serta logik pertimbangan, kita telah melaksanakan pengesahan mudah terhadap kandungan input.

Dalam pelajaran ini, kita akan meneruskan berdasarkan kod daripada pelajaran sebelum ini untuk mempelajari kotak input kata laluan `SecureField`, kotak amaran `Alert`, serta cara mengawal paparan view yang berbeza mengikut pemboleh ubah.

Melalui pelajaran ini, anda boleh memahami dengan lebih mendalam aliran interaksi asas paparan log masuk, dan ini juga merupakan logik asas yang digunakan dalam banyak aplikasi.

## Kotak input kata laluan

Dalam pelajaran lepas, kita menggunakan `TextField` untuk memasukkan kata laluan.

Tetapi dalam antara muka log masuk sebenar, kata laluan biasanya tidak akan dipaparkan secara terus. Sebaliknya, ia akan ditunjukkan sebagai titik-titik atau kesan tersembunyi lain supaya privasi pengguna dapat dilindungi.

Dalam SwiftUI, kawalan yang khusus digunakan untuk memasukkan kata laluan ialah `SecureField`.

Contohnya:

```swift
SecureField("Password", text: $password)
```

Cara penulisannya sangat mirip dengan `TextField`, dan ia juga memerlukan teks petunjuk serta pemboleh ubah yang terikat.

Ia boleh difahami secara ringkas begini: `SecureField` juga merupakan kotak input, cuma ia menyembunyikan kandungan yang dimasukkan.

Kita boleh terus menukar `TextField` yang asalnya digunakan untuk memasukkan kata laluan kepada `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Apabila pengguna memasukkan kata laluan, kandungan kata laluan tidak akan dipaparkan secara terus pada antara muka.

Kesan paparan:

![password](../../Resource/020_password.png)

Sekarang, kita boleh memasukkan nama pengguna dan kata laluan, kemudian selepas menekan butang, menentukan sama ada input itu betul.

### Memaparkan mesej maklum balas

Sebelum ini kita sentiasa menggunakan `print` untuk mengeluarkan hasil.

Kandungan `print` hanya akan dipaparkan dalam konsol. Pembangun boleh melihatnya apabila menjalankan program dalam Xcode, tetapi pengguna biasa pada telefon tidak dapat melihat petunjuk ini.

Ini bermaksud walaupun program sudah selesai membuat penilaian, pengguna masih tidak tahu sama ada kandungan yang dimasukkan itu betul.

Pada waktu ini, kita memerlukan satu cara yang boleh memaparkan petunjuk secara terus pada antara muka.

## Kotak amaran Alert

Dalam SwiftUI, kita boleh menggunakan `Alert` untuk memaparkan kotak mesej timbul.

Penggunaan asas:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Kod ini kelihatan sedikit lebih rumit daripada kawalan sebelumnya, tetapi kita boleh memahaminya dengan memecahkannya.

`Alert` terutamanya mengandungi bahagian-bahagian berikut:

- `"Title"`: tajuk kotak amaran
- `isPresented`: nilai Boolean terikat yang digunakan untuk mengawal sama ada kotak amaran dipaparkan
- `Button(...)`: butang dalam kotak amaran
- `message:`: kandungan mesej yang dipaparkan dalam kotak amaran

Ia boleh difahami secara ringkas begini: apabila pemboleh ubah terikat bertukar menjadi `true`, sistem akan memaparkan kotak amaran ini.

Kesan paparan:

![alert](../../Resource/020_alert3.png)

Struktur yang sepadan:

![alert](../../Resource/020_alert.png)

### Alert ialah modifier

Seperti banyak modifier yang telah kita pelajari sebelum ini, `Alert` juga ditambah di belakang sesuatu view.

Contohnya, ia boleh dilekatkan di belakang butang:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Ia juga boleh dilekatkan di belakang `VStack` luar:

```swift
VStack {
    // ...
}
.alert() {...}
```

Ini bermaksud `Alert` bukanlah view yang berdiri sendiri dalam antara muka, tetapi modifier yang bergantung pada sesuatu view.

Ia boleh difahami secara ringkas seperti ini: `Alert` biasanya ditulis selepas butang atau susun atur luar untuk memunculkan petunjuk apabila sesuatu syarat dipenuhi.

### Memaparkan Alert

Jika kita mahu memaparkan `Alert`, kita memerlukan satu pemboleh ubah untuk mengawalnya.

Contohnya:

```swift
@State private var showAlert = false
```

Pemboleh ubah ini ialah jenis `Bool`, iaitu hanya mempunyai dua nilai: `true` atau `false`.

Kemudian kita ikatkannya kepada `isPresented` bagi `Alert`:

```swift
isPresented: $showAlert
```

Apabila `showAlert` ialah `false`, kotak amaran tidak akan dipaparkan; apabila `showAlert` ialah `true`, kotak amaran akan muncul.

### Memaparkan kotak amaran melalui butang

Sekarang, mari kita laksanakan dahulu situasi yang paling mudah:

Apabila pengguna tidak memasukkan apa-apa pun dan terus menekan butang `Sign in`, satu kotak mesej akan muncul untuk memberitahunya, “Anda masih belum memasukkan sebarang kandungan.”

Mula-mula, cipta satu pemboleh ubah untuk mengawal kotak mesej ini:

```swift
@State private var showEmpty = false
```

Kemudian, tambahkan satu `Alert` di belakang `Button`:

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

Seterusnya, jalankan pertimbangan dalam kod klik butang:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Jika `user` dan `password` kedua-duanya kosong, maka kita akan menukar `showEmpty` kepada `true`.

Dan kerana `Alert` terikat kepada pemboleh ubah ini, apabila ia menjadi `true`, sistem akan secara automatik memaparkan kotak amaran.

Kesan paparan:

![alert](../../Resource/020_alert1.png)

Dengan cara ini, selepas pengguna menekan butang, dia boleh terus melihat petunjuk itu serta-merta, dan pembangun tidak perlu memeriksa output `print` di konsol.

### Menambah baik butang dan kotak amaran

Sebelum ini, kita hanya mengendalikan keadaan “tidak mengisi apa-apa”.

Kita juga masih perlu mengendalikan beberapa keadaan berikut:

- nama pengguna tidak diisi
- kata laluan tidak diisi
- nama pengguna dan kata laluan kedua-duanya diisi, tetapi input salah

Oleh itu, kita juga perlu menyediakan petunjuk yang sesuai untuk keadaan-keadaan ini.

Mula-mula, tambah tiga pemboleh ubah baharu:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Kemudian teruskan menambah `Alert` yang sepadan di belakang butang:

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

Selepas itu, lengkapkan logik pertimbangan dalam butang:

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

Apabila butang menentukan bahawa pengguna tidak mengisi sebarang maklumat, tertinggal satu maklumat, atau pengesahan input gagal, ia akan menukar pemboleh ubah Boolean yang sepadan kepada `true`, kemudian `Alert` yang sepadan akan muncul.

Di sini saya cadangkan anda sendiri menguji beberapa situasi:

- jangan isi apa-apa
- hanya isi nama pengguna
- hanya isi kata laluan
- isi nama pengguna dan kata laluan, tetapi dengan kandungan yang salah
- isi nama pengguna dan kata laluan, dan kandungannya betul

Dengan ini kita boleh mengesahkan sama ada kod kita mempunyai masalah. Ini juga merupakan langkah “ujian” yang sangat penting dalam pembangunan aplikasi.

Jika dalam sesuatu senario program tidak berfungsi dengan betul, ini bermakna mungkin ada masalah dalam logik, dan `Bug` telah muncul dalam program.

Apa yang sering dipanggil `Bug` dalam pembangunan merujuk kepada ralat, kelemahan, atau tingkah laku yang tidak menepati jangkaan.

## Menyelesaikan paparan log masuk

`Alert` yang dibincangkan sebelum ini semuanya berkaitan dengan cara memberi petunjuk kepada pengguna apabila “input salah”.

Apabila pengguna memasukkan nama pengguna dan kata laluan yang betul, kita biasanya tidak akan memunculkan “kotak amaran”, sebaliknya terus masuk ke antara muka selepas log masuk.

Di sini terdapat satu konsep yang sangat penting: **memaparkan view yang berbeza berdasarkan nilai pemboleh ubah.**

Sebagai contoh:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Di sini, kita menggunakan jenis `Bool` untuk mengurus paparan view:

- jika `login` ialah `true`, ini bermaksud log masuk telah berjaya, dan kandungan selepas log masuk akan dipaparkan
- jika `login` ialah `false`, ini bermaksud log masuk tidak berjaya, dan antara muka log masuk akan terus dipaparkan.

Walaupun kenyataan `if` ialah kenyataan bersyarat dalam Swift, dalam `body` SwiftUI ia boleh digunakan untuk mengawal logik paparan view.

Ini bermaksud SwiftUI akan menentukan view mana yang perlu dipaparkan pada masa ini berdasarkan hasil syarat tersebut.

Kita boleh meletakkan logik paparan ini ke dalam `ContentView` semasa:

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

Di sini, kita menambah satu pemboleh ubah baharu, `login`, untuk menunjukkan sama ada pengguna sudah berjaya log masuk.

Kemudian, kita meletakkan kod paparan log masuk yang telah ditulis sebelum ini di belakang kenyataan `else`.

Logik paparan view:

- apabila `login` ialah `false`, ini bermaksud log masuk masih belum berjaya, maka paparan log masuk asal akan terus dipaparkan.
- apabila `login` ialah `true`, ini bermaksud log masuk berjaya; pada ketika ini paparan log masuk tidak lagi dipaparkan, sebaliknya `Login successful` dipaparkan.

Ini bermaksud `ContentView` akan memaparkan kandungan view yang berbeza mengikut nilai `login`.

Seterusnya, mari ubah logik kejayaan log masuk di dalam butang:

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

Apabila nama pengguna dan kata laluan yang dimasukkan oleh pengguna kedua-duanya betul, kita akan menukar `login` kepada `true`.

Sebaik sahaja nilai `login` berubah, hasil pertimbangan `if` di dalam `ContentView` juga akan berubah, dan antara muka akan bertukar daripada paparan log masuk asal kepada `Login successful`.

Kesan paparan adalah seperti berikut:

![view](../../Resource/020_view.png)

Sekarang, kita benar-benar telah menggunakan pengetahuan tentang “memaparkan view yang berbeza berdasarkan syarat” ke dalam halaman log masuk semasa ini.

Dalam aplikasi sebenar, biasanya memang cara inilah yang digunakan, iaitu memaparkan view yang berbeza berdasarkan satu nilai tertentu.

Contohnya, apabila pengguna belum log masuk, halaman log masuk dipaparkan; selepas pengguna berjaya log masuk, antara muka lain akan dipaparkan.

Idea terasnya ialah: **mengawal kandungan yang dipaparkan dalam antara muka melalui perubahan pemboleh ubah.**

## Ringkasan

Dalam pelajaran ini, kita mempelajari tiga perkara penting:

1. Menggunakan `SecureField` untuk memasukkan kata laluan, supaya kandungan kata laluan tidak dipaparkan secara terus pada antara muka.
2. Menggunakan `Alert` untuk menunjukkan mesej kepada pengguna, bukannya hanya mengeluarkannya ke konsol.
3. Menggunakan pemboleh ubah dan pertimbangan `if` untuk mengawal paparan view yang berbeza, sekali gus melaksanakan pertukaran antara antara muka sebelum dan selepas log masuk.

Melalui pembelajaran ini, kini kita sudah mampu menyiapkan satu paparan log masuk dengan kesan interaksi asas, dan memahami dengan lebih mendalam idea pembangunan SwiftUI bahawa “apabila state berubah, interface akan dikemas kini”.

## Kod lengkap

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

## Pengetahuan tambahan - Alert dengan banyak butang

Dalam bahagian awal pelajaran ini, kita menggunakan `Alert` yang paling asas, yang hanya mempunyai satu butang dan terutamanya digunakan untuk memberi petunjuk kepada pengguna.

Sebenarnya, `Alert` juga boleh mengandungi beberapa butang, supaya pengguna boleh membuat pilihan yang berbeza.

Contohnya:

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

Selepas menekan butang, satu kotak mesej dengan tiga pilihan akan muncul: `Ok`, `delete`, dan `cancel`.

Kesan paparan:

![alert](../../Resource/020_alert2.png)

Menekan butang yang berbeza akan melaksanakan kod yang sepadan.

### Sifat role pada Button

Di sini anda akan dapati bahawa `Button` dalam `Alert` sedikit berbeza daripada sintaks butang biasa yang kita pelajari sebelum ini:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Di sini terdapat parameter tambahan, iaitu `role`.

Dalam SwiftUI, `role` digunakan untuk memberitahu sistem jenis tindakan yang diwakili oleh butang ini.

Beberapa role yang biasa ialah:

- `.cancel`: tindakan batal
- `.destructive`: tindakan berbahaya, contohnya memadam
- `nil`: tindakan biasa

Nilai `role` yang berbeza biasanya juga membawa gaya visual yang berbeza dalam antara muka.

Sebagai contoh, tindakan berbahaya selalunya dipaparkan dengan gaya yang lebih menonjol untuk mengingatkan pengguna supaya menekan dengan berhati-hati.

Selain itu, `role` juga memberikan maklumat semantik tambahan kepada butang, yang memudahkan pembaca skrin (seperti VoiceOver pada peranti Apple) menerangkan fungsi butang kepada pengguna.

Oleh itu, menambah `role` pada butang dalam situasi yang sesuai ialah satu amalan yang sangat baik.
