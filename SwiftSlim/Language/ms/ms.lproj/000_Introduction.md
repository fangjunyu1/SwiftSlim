# Pengenalan

## Apakah itu Swift?

Sebelum mempelajari Swift, mari kita kenali secara ringkas bahasa pengaturcaraan Swift. Swift ialah bahasa pengaturcaraan moden yang dibangunkan oleh Apple, dan ia digunakan terutamanya untuk membina aplikasi pada platform Apple seperti iOS, macOS, iPadOS, watchOS dan lain-lain.

![Swift](../../RESOURCE/000_swift.png)

Berbanding bahasa pengaturcaraan lain, bahasa Swift mempunyai sintaks yang ringkas serta lebih menekankan keselamatan dan kebolehbacaan. Apabila digabungkan dengan SwiftUI, ia menjadi lebih mudah untuk dipelajari dan difahami. Sudah tentu, saya sendiri sebelum ini tidak pernah mempelajari bahasa pengaturcaraan lain, jadi mungkin ia sedikit lebih sukar daripada HTML.

Swift bukan sahaja boleh digunakan untuk membangunkan aplikasi pada platform Apple. Komuniti Swift juga sedang berusaha membawa Swift ke platform [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), malah menjalankannya pada [pelayan](https://github.com/awslabs/swift-aws-lambda-runtime) dan persekitaran lain. Dari sudut perkembangan jangka panjang, ruang pertumbuhan Swift adalah lebih besar, dan pada masa depan ia berpeluang menjadi bahasa pengaturcaraan rentas platform seperti Flutter atau React Native.

## Kandungan pembelajaran

Tutorial ini memberi tumpuan kepada asas Swift dan SwiftUI.

Kita akan bermula dengan pembolehubah dan jenis data yang mudah, menggunakan SwiftUI untuk membina antara muka, memahami cara data disimpan dan dibaca, dan akhirnya mungkin akan mendalami kandungan lanjutan seperti SwiftData dan penyegerakan iCloud.

Setiap bab akan dibina berdasarkan satu kes praktikal, supaya kita belajar ilmu Swift dalam konteks aplikasi sebenar.

Sesetengah tutorial mungkin terlebih dahulu menerangkan sejumlah besar sintaks dan API, kemudian baru masuk ke latihan projek. Bagi pemula, ini seolah-olah seperti kanak-kanak yang cuba mengenal huruf melalui kamus. Menghafal banyak kandungan tanpa konteks penggunaan akhirnya hanya akan membuat pemula hilang minat.

Tutorial ini akan mempelajari ilmu berdasarkan senario pembangunan sebenar, menggunakan keperluan untuk membawa keluar titik pengetahuan yang berkaitan.

Selepas menamatkan tutorial ini, anda akan mampu membangunkan dan menjalankan sebuah aplikasi asas secara berdikari, memasangnya pada peranti iOS / macOS anda sendiri, malah menerbitkannya ke App Store.

## Bagaimana belajar dari sifar?

Pada mulanya saya juga benar-benar bermula dari sifar. Pada awalnya saya hanya menonton beberapa episod [video pengajaran Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) di Youtube, dan saya mendapati pembangunan aplikasi iOS tidaklah begitu rumit, lalu mula tertarik. Selepas itu, saya mula mencuba mempelajari lebih banyak ilmu Swift. Contohnya, mencuba permainan pengaturcaraan dalam [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), membaca [dokumentasi rasmi Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/), dan mengikuti [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Sekarang apabila dilihat semula, sebenarnya [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) yang paling banyak menyediakan rangka pembelajaran, membolehkan saya mempelajari SwiftUI secara sistematik. Namun, kerana tutorial tersebut dalam bahasa Inggeris, ditambah pula saya sendiri tidak mempunyai asas pengaturcaraan, saya menghadapi banyak kesukaran semasa memahaminya. Untuk itu, saya menggunakan alat AI seperti [ChatGPT](https://chatgpt.com/) dan [Claude](https://claude.ai/?redirect=claude.com) untuk membantu memahami titik-titik ilmu.

Sepanjang proses pembelajaran, memang tidak dapat dielakkan akan ada pengetahuan yang agak sukar difahami. Saya masih ingat ketika mempelajari UserDefaults, saya hanya tahu cara menyimpan data tetapi tidak tahu bahawa data perlu dibaca secara manual, sehingga saya sangka ada masalah pada kod saya. Walaupun itu hanyalah titik ilmu yang mudah, ia tetap membuat saya membuang beberapa hari.

Sebagai contoh lain, konsep seperti closure, main thread dan generic, pada peringkat awal pembelajaran saya tidak dapat benar-benar memahaminya. Apabila konsep-konsep itu muncul semula dalam pembangunan sebenar, saya terpaksa mengeluarkan tenaga sekali lagi untuk mempelajarinya semula.

Oleh itu, cadangan saya ialah:

**1. Lengkapkan pengetahuan asas**

Ada satu pepatah Cina yang berbunyi “semua permulaan itu sukar”. Bagi mereka yang baru belajar Swift dari sifar, jika dalam proses pembelajaran muncul beberapa pengetahuan yang sukar difahami, selalunya itu bukan kerana titik ilmu tersebut terlalu rumit, tetapi kerana di bahagian dasar piramid ilmu itu, masih ada beberapa konsep yang lebih asas yang belum disentuh oleh pemula.

Apabila berdepan dengan situasi seperti ini, anda boleh mempertimbangkan untuk menggunakan alat AI seperti [ChatGPT](https://chatgpt.com/) dan [Claude](https://claude.ai/?redirect=claude.com) untuk melengkapkan pengetahuan asas yang masih kurang tepat pada masanya.

**2. Fahami setiap titik ilmu**

Dalam proses pembelajaran, perkara paling penting ialah cuba sedaya upaya memahami setiap titik ilmu, walaupun perlu mengambil masa beberapa hari.

Jika anda memilih untuk melangkau kandungan yang tidak difahami, besar kemungkinan anda akan menemuinya semula dalam pembangunan seterusnya, lalu ia akan menghalang kemajuan pembangunan. Pada akhirnya, anda tetap perlu meluangkan masa untuk mempelajarinya semula. Daripada membaiki keadaan kemudian, lebih baik fahaminya dengan jelas ketika masih di peringkat belajar.

Setiap titik ilmu pada asasnya ialah satu alat. Semakin banyak alat yang anda kuasai, semakin kuat keupayaan anda untuk menyelesaikan masalah.

Sama seperti membina sebuah rumah, jika anda hanya mempunyai satu alat, anda mungkin masih boleh menyiapkan sebahagian besar kerja, tetapi apabila berdepan dengan keperluan kualiti yang lebih tinggi, anda akan terasa serba kekurangan. Hanya dengan menguasai lebih banyak alat, barulah anda dapat membina rumah yang lebih kukuh.

**3. Kekalkan pembelajaran berterusan**

Pembelajaran memerlukan ketekunan jangka panjang. Tidak ramai yang benar-benar sanggup meluangkan beberapa bulan untuk mempelajari satu tutorial dengan serius. Meluangkan masa secara konsisten adalah lebih penting daripada intensiti tinggi dalam jangka pendek.

Walaupun setiap hari anda hanya menyiapkan satu peratus, dalam seratus hari anda juga boleh menamatkan keseluruhan sasaran pembelajaran.

## Visi pendidikan

Kursus ini tidak akan mengajar terlalu banyak pengetahuan Swift dan SwiftUI sekaligus, tetapi bertujuan membawa pemula masuk ke jalan pengaturcaraan Swift. Ia seperti bermain blok binaan. Tutorial ini bertanggungjawab menerangkan cara menyusun, dan selebihnya ialah masa untuk anda sendiri membina blok binaan milik anda.

Projek ini telah pun dibuka sumber di [GitHub](https://github.com/fangjunyu1/SwiftSlim), dan boleh dimuat turun serta digunakan secara percuma. Pada masa yang sama, versi App Store juga disediakan untuk pengalaman penggunaan.

Kami berharap dapat membantu lebih ramai orang yang tidak mempunyai latar belakang teknikal tetapi ingin mengubah laluan kerjaya mereka, supaya melalui pembelajaran pengaturcaraan dan pembangunan aplikasi, mereka dapat memperoleh kemungkinan baharu.

## Kemas kini kandungan

Tutorial ini ditulis berdasarkan versi semasa Swift dan SwiftUI.

Seiring dengan kemas kini platform dan alat Apple, sebahagian API mungkin berubah. Jika anda menemui masalah atau kandungan yang perlu dikemas kini, anda boleh merujuk dokumentasi rasmi atau versi terkini repositori sumber terbuka.

---
Fang Junyu

2026-02-14  
