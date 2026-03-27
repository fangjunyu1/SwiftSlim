# Pendahuluan

## Apa itu Swift?

Sebelum mulai mempelajari Swift, mari kita berkenalan secara singkat dengan bahasa pemrograman Swift. Swift adalah bahasa pemrograman modern yang dikembangkan oleh Apple, dan terutama digunakan untuk membuat aplikasi di platform Apple seperti iOS, macOS, iPadOS, dan watchOS.

![Swift](../../RESOURCE/000_swift.png)

Dibandingkan dengan bahasa pemrograman lain, Swift memiliki sintaks yang ringkas dan lebih menekankan keamanan serta keterbacaan. Jika dipadukan dengan SwiftUI, bahasa ini juga lebih mudah dipelajari dan dipahami. Tentu saja, saya sendiri sebelumnya tidak pernah mempelajari bahasa pemrograman lain, jadi mungkin saja bahasa ini sedikit lebih sulit daripada HTML.

Swift tidak hanya dapat digunakan untuk mengembangkan aplikasi di platform Apple. Komunitas Swift juga sedang berupaya membawa Swift ke platform [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), bahkan menjalankannya di lingkungan [server](https://github.com/awslabs/swift-aws-lambda-runtime) dan bidang lainnya. Dari sudut pandang perkembangan jangka panjang, Swift memiliki ruang pertumbuhan yang lebih besar dan di masa depan berpeluang menjadi bahasa pemrograman lintas platform seperti Flutter atau React Native.

## Isi pembelajaran

Panduan ini terutama berfokus pada pengetahuan dasar Swift dan SwiftUI.

Kita akan mulai dari variabel dan tipe data sederhana, lalu membangun antarmuka dengan SwiftUI, memahami cara menyimpan dan membaca data, dan selanjutnya mungkin akan mempelajari topik yang lebih lanjut seperti SwiftData dan sinkronisasi iCloud.

Setiap bab akan dibangun berdasarkan contoh nyata, sehingga kita mempelajari Swift dalam konteks penggunaan praktis.

Beberapa panduan biasanya menjelaskan begitu banyak sintaks dan API secara rinci terlebih dahulu, lalu baru masuk ke praktik. Bagi pemula, ini terasa seperti anak kecil yang belajar kata-kata dari kamus: ketika tidak ada konteks penggunaan yang nyata, menghafal terlalu banyak materi pada akhirnya justru menurunkan minat belajar.

Dalam panduan ini, pengetahuan dipelajari di dalam skenario pengembangan yang nyata, di mana kebutuhan akan memunculkan topik dan konsep terkait.

Setelah menyelesaikan kursus ini, kamu akan bisa mengembangkan dan menjalankan aplikasi dasar secara mandiri, menginstalnya ke perangkat iOS / macOS milikmu sendiri, dan bahkan menerbitkannya ke App Store.

## Bagaimana belajar dari nol?

Saya juga memulai sepenuhnya dari nol. Pada awalnya saya hanya menonton beberapa [video tutorial Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) di Youtube, lalu menyadari bahwa mengembangkan aplikasi iOS ternyata tidak terlalu rumit, sehingga saya mulai tertarik. Setelah itu saya mencoba mempelajari lebih banyak materi Swift. Misalnya, mencoba permainan pemrograman di [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), membaca [dokumentasi resmi Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/), dan mempelajari [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Sekarang ketika melihat ke belakang, saya merasa bahwa yang paling memberi saya kerangka belajar justru adalah [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui), karena itu memungkinkan saya mempelajari SwiftUI secara sistematis. Namun karena tutorialnya berbahasa Inggris, ditambah saya sendiri tidak memiliki dasar pemrograman, proses memahaminya penuh dengan kesulitan. Dalam hal ini, saya menggunakan alat AI seperti [ChatGPT](https://chatgpt.com/) dan [Claude](https://claude.ai/?redirect=claude.com) untuk membantu memahami berbagai konsep.

Dalam proses belajar, pasti akan ada topik-topik yang sulit dipahami. Saya masih ingat saat mempelajari UserDefaults: saya hanya tahu cara menyimpan data, tetapi tidak tahu bahwa datanya juga harus dibaca kembali secara manual, sehingga saya sampai curiga ada bug di kode saya. Bahkan topik sesederhana itu membuat saya menghabiskan beberapa hari.

Contoh lain adalah closures, main thread, dan generics. Pada tahap awal belajar, saya tidak benar-benar bisa memahaminya secara mendalam. Akibatnya, ketika saya menemui lagi topik-topik itu dalam pengembangan nyata, saya harus kembali meluangkan tenaga dan waktu untuk mempelajarinya dari awal.

Karena itu, saran saya adalah:

**1. Lengkapi pengetahuan dasar**

Ada pepatah di Tiongkok: “Semua hal sulit di awal.” Bagi orang yang belajar Swift dari nol, selama proses belajar pasti akan menemui topik-topik yang sulit dipahami. Biasanya ini bukan karena topiknya sendiri sangat sulit, melainkan karena di bagian dasar “piramida pengetahuan” masih ada konsep-konsep yang lebih sederhana yang belum pernah ditemui oleh pemula.

Dalam situasi seperti ini, kamu bisa memanfaatkan alat AI seperti [ChatGPT](https://chatgpt.com/) dan [Claude](https://claude.ai/?redirect=claude.com) untuk segera melengkapi dasar-dasar yang masih kurang.

**2. Pahami setiap konsep**

Dalam proses belajar, hal terpenting adalah berusaha memahami setiap konsep, meskipun itu memerlukan beberapa hari.

Jika kamu melewati materi yang belum dipahami, kemungkinan besar kamu akan bertemu lagi dengannya dalam pengembangan berikutnya, dan itu akan mulai menghambat kemajuanmu. Pada akhirnya, kamu tetap harus menghabiskan waktu untuk mempelajarinya kembali. Karena itu, lebih baik benar-benar memahaminya sejak tahap belajar daripada nanti menambal kekurangan di tengah proses pengembangan.

Setiap konsep pada dasarnya adalah alat. Semakin banyak alat yang kamu kuasai, semakin kuat juga kemampuanmu untuk memecahkan masalah.

Ini seperti membangun rumah: jika di tanganmu hanya ada satu alat, mungkin kamu tetap bisa menyelesaikan sebagian besar pekerjaan, tetapi ketika membutuhkan kualitas yang lebih tinggi, alat itu tidak akan cukup. Hanya dengan menguasai lebih banyak alat, kita bisa membangun rumah yang benar-benar kokoh.

**3. Jaga kesinambungan belajar**

Belajar membutuhkan ketekunan jangka panjang. Sangat sedikit orang yang benar-benar mau meluangkan beberapa bulan untuk menuntaskan satu kursus dengan serius. Konsistensi belajar setiap hari jauh lebih penting daripada semangat sesaat dengan intensitas tinggi.

Bahkan jika setiap hari hanya menyelesaikan satu persen, dalam seratus hari kamu tetap bisa mencapai tujuan belajar sepenuhnya.

## Visi pendidikan

Kursus ini tidak bertujuan untuk menjelaskan terlalu banyak pengetahuan Swift dan SwiftUI sekaligus, melainkan untuk membantu pemula benar-benar memasuki jalur pemrograman Swift. Ini seperti merakit balok: panduan ini menjelaskan cara menyambungkan komponen-komponen tersebut, lalu selebihnya adalah waktumu sendiri untuk membangun sesuatu dari potongan-potongan itu.

Proyek ini sudah bersifat open source di [GitHub](https://github.com/fangjunyu1/SwiftSlim), dan bisa diunduh serta digunakan secara gratis. Tersedia juga versi App Store untuk dicoba.

Kami berharap dapat membantu lebih banyak orang yang tidak memiliki latar belakang teknis tetapi ingin mengubah arah karier mereka, agar memperoleh peluang baru melalui belajar pemrograman dan pengembangan aplikasi.

## Pembaruan konten

Panduan ini ditulis berdasarkan versi Swift dan SwiftUI saat ini.

Seiring pembaruan platform Apple dan alat pengembangannya, beberapa API mungkin berubah. Jika kamu menemukan masalah atau melihat bahwa sebagian materi perlu diperbarui, kamu bisa merujuk ke dokumentasi resmi atau ke versi terbaru dari repositori open source ini.

---

Fang Junyu

2026-02-14
