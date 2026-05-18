# Menyusun Data Hewan

Pada pelajaran sebelumnya, kita telah menyelesaikan sebuah contoh ensiklopedia hewan sederhana.

![view](../../../Resource/029_view.png)

Saat pengguna mengetuk salah satu hewan, halaman akan menampilkan detail hewan melalui `Sheet`.

Namun, pada kode pelajaran sebelumnya terdapat satu masalah: data hewan ditulis langsung di dalam `ContentView`.

Contohnya:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Menampilkan daftar hewan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Kode ini dapat berjalan dengan normal, tetapi saat data hewan semakin banyak, `ContentView` akan menjadi sangat panjang.

`ContentView` seharusnya terutama bertanggung jawab untuk menampilkan antarmuka, tetapi sekarang ia juga menyimpan banyak data hewan. Hal ini akan memengaruhi keterbacaan kode dan juga menyulitkan pemeliharaan berikutnya.

Karena itu, pada pelajaran ini kita akan melakukan satu hal:

Memindahkan data hewan keluar dari `ContentView`.

## Mengapa data perlu dipisahkan?

Dalam SwiftUI, kode view biasanya bertanggung jawab untuk menampilkan antarmuka.

Contohnya:

```swift
Text("Dolphin")
Image("dolphin")
```

Kode-kode ini berhubungan dengan tampilan antarmuka.

Sedangkan data hewan itu sendiri, seperti nama hewan, nama gambar, wilayah persebaran, habitat, dan teks deskripsi, bukanlah struktur antarmuka.

Data tersebut lebih mirip dengan sekumpulan informasi tetap:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Jika kode antarmuka dan kode data semuanya ditulis bersama, kode akan menjadi semakin berantakan.

Jadi, kita dapat meletakkan data hewan ke dalam tipe `Animal`.

## Menggunakan static untuk menyimpan data tetap

Mari kita lihat terlebih dahulu cara penulisan setelah dirapikan:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Di sini kita menambahkan satu baris kode baru:

```swift
static let animals: [Animal] = [
    
]
```

`static` berarti properti statis.

Properti statis merupakan milik tipe itu sendiri, bukan milik salah satu instance tertentu.

Kalimat ini cukup abstrak, jadi kita dapat memahaminya melalui contoh sederhana.

## Properti biasa dan properti statis

Misalnya, kita mendefinisikan sebuah `Student`:

```swift
struct Student {
    let name: String
}
```

Di sini `name` adalah properti biasa. Properti biasa merupakan milik salah satu instance tertentu.

Jika kita ingin mengakses `name`, kita harus membuat seorang siswa tertentu terlebih dahulu:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Di sini `student` adalah sebuah instance, yang untuk sementara dapat dipahami sebagai satu data siswa yang konkret.

Karena nama setiap siswa mungkin berbeda, `name` harus diletakkan pada siswa tertentu.

Namun, ada beberapa data yang tidak termasuk pada salah satu instance tertentu.

Misalnya, kita ingin menyiapkan sekumpulan data contoh yang dapat digunakan untuk preview:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Di sini `previewStudents` memiliki `static` di depannya, sehingga ia adalah properti statis.

Properti statis tidak termasuk pada salah satu siswa, melainkan termasuk pada tipe `Student` itu sendiri.

Karena itu, kita tidak perlu membuat seorang siswa terlebih dahulu, dan dapat langsung mengaksesnya melalui nama tipe:

```swift
print(Student.previewStudents.count)    // 3
```

Cara aksesnya adalah:

```swift
NamaTipe.namaPropertiStatis
```

Yaitu:

```swift
Student.previewStudents
```

Dengan cara yang sama, dalam ensiklopedia hewan, kita dapat mengakses data hewan seperti ini:

```swift
Animal.animals
```

## Kembali ke ContentView

Sekarang, data hewan sudah disimpan di dalam tipe `Animal`.

Jadi di dalam `ContentView`, kita tidak perlu lagi menulis array hewan yang sangat panjang.

Kita dapat mengubahnya menjadi:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Menampilkan daftar hewan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Baris kode ini berarti:

```swift
let animals = Animal.animals
```

Mengambil kumpulan data hewan `animals` dari tipe `Animal`, lalu menyimpannya ke dalam konstanta `animals` pada view saat ini.

Setelah ditulis seperti ini, `ContentView` akan menjadi lebih ringkas.

`ContentView` bertanggung jawab untuk menampilkan antarmuka, sedangkan `Animal.animals` bertanggung jawab untuk menyediakan data hewan.

## Memisahkan Animal ke file terpisah

Pada pelajaran sebelumnya, agar contoh lebih mudah dipahami, kita menulis `Animal` dan `ContentView` di file yang sama.

Karena kode saat itu masih relatif sedikit, cara ini tidak bermasalah.

Namun sekarang data hewan semakin banyak. Jika semua kode tetap ditulis di dalam `ContentView.swift`, file akan menjadi sangat panjang dan tidak nyaman dibaca.

Jadi, kita dapat meletakkan `Animal` secara terpisah di file Swift baru.

Di Xcode, kita dapat membuat file Swift baru, misalnya:

```swift
Animal.swift
```

Lalu pindahkan struct `Animal` ke file ini:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Setelah dirapikan seperti ini:

`ContentView.swift` bertanggung jawab untuk menampilkan antarmuka.

`Animal.swift` bertanggung jawab untuk mendeskripsikan struktur data hewan.

Meskipun keduanya ditempatkan di file yang berbeda, selama keduanya berada di proyek yang sama, `ContentView` tetap dapat langsung menggunakan `Animal`.

Contohnya:

```swift
let animals = Animal.animals
```

Di sini tidak perlu mengimpor `Animal.swift` secara tambahan di dalam `ContentView.swift`.

Swift akan otomatis mengenali file Swift yang berada di proyek yang sama.

## Menggunakan extension untuk terus merapikan kode

Sekarang, kita sudah memindahkan data hewan dari `ContentView` ke dalam `Animal`.

Namun, di dalam struct `Animal` masih terdapat dua jenis kode sekaligus:

Jenis pertama adalah properti milik model hewan itu sendiri:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Jenis kedua adalah data hewan tetap:

```swift
static let animals: [Animal] = [
    // ...
]
```

Agar struktur kode lebih jelas, kita dapat menggunakan `extension` untuk memisahkan kedua bagian ini.

`extension` berarti ekstensi.

Ia dapat menambahkan kode baru di atas dasar tipe yang sudah ada.

Contohnya:

```swift
extension Animal {
    
}
```

Ini berarti kita sedang memperluas tipe `Animal`.

## Meletakkan data hewan di dalam extension

Kita dapat mengubah `Animal` menjadi seperti ini:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Setelah dirapikan seperti ini, struktur kode akan menjadi lebih jelas.

`struct Animal` bertanggung jawab untuk mendeskripsikan properti apa saja yang seharusnya dimiliki seekor hewan.

`extension Animal` bertanggung jawab untuk menyimpan sekumpulan data hewan tetap.

Perhatikan bahwa meskipun `animals` dipindahkan ke dalam `extension Animal`, cara penggunaannya tidak berubah.

Kita tetap dapat menggunakannya seperti ini:

```swift
let animals = Animal.animals
```

Ini juga merupakan salah satu karakteristik `extension`: ia hanya membantu kita merapikan kode, dan tidak mengubah cara pemanggilan dari luar.

## Saat data banyak, kita dapat membuat file AnimalData lagi

Sekarang, kita sudah meletakkan `Animal` di file `Animal.swift` yang terpisah.

Jika data hewan masih sedikit, kita dapat langsung menulis `extension Animal` di dalam `Animal.swift` juga.

Namun, jika data hewan semakin banyak, kita juga dapat membuat file baru lagi, misalnya:

```swift
AnimalData.swift
```

Lalu letakkan data hewan tetap di sana:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Data hewan
    ]
}
```

Setelah melakukan ini, pembagian tanggung jawab kode akan lebih jelas:

`Animal.swift` hanya bertanggung jawab untuk mendefinisikan model hewan.

`AnimalData.swift` hanya bertanggung jawab untuk menyimpan data hewan.

`ContentView.swift` hanya bertanggung jawab untuk menampilkan antarmuka.

Tanggung jawab setiap file menjadi lebih jelas.

Perhatikan bahwa `AnimalData.swift` hanya nama file, bukan tipe Swift baru. Di dalam file ini, kita tetap menggunakan `extension Animal` untuk menambahkan data tetap ke `Animal`.

## Kode lengkap

Berikut adalah kode `Animal.swift` setelah dirapikan:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Kode `AnimalData.swift` setelah dirapikan:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

Di dalam `ContentView.swift`, kita dapat menggunakannya seperti ini:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Catatan: Pada file `Animal.swift` dan `AnimalData.swift`, baris pertama sama-sama menulis:

```swift
import Foundation
```

Sebelumnya, saat menulis antarmuka SwiftUI, kita sering menggunakan:

```swift
import SwiftUI
```

Ini karena `ContentView`, `Text`, `Button`, dan `Color` semuanya berhubungan dengan antarmuka, sehingga saat menulis file antarmuka biasanya perlu mengimpor SwiftUI.

Namun, `Animal.swift` dan `AnimalData.swift` di sini bukan file antarmuka. Keduanya terutama digunakan untuk mendefinisikan model hewan dan menyimpan data hewan.

Dalam kode ini, `UUID()` perlu menggunakan `Foundation`, jadi mengimpor `Foundation` saja sudah cukup.

## Ringkasan

Pada pelajaran ini, kita terutama melakukan satu hal: memindahkan data hewan keluar dari `ContentView`.

Cara penulisan sebelumnya adalah menulis data hewan langsung di dalam `ContentView`. Kode seperti itu dapat berjalan, tetapi saat data bertambah banyak, file view akan menjadi semakin panjang.

Setelah dirapikan, `ContentView` hanya bertanggung jawab untuk menampilkan antarmuka, sedangkan `Animal.animals` bertanggung jawab untuk menyediakan data hewan.

Pada pelajaran ini, kita juga mempelajari dua pengetahuan baru.

Yang pertama adalah `static`.

`static` berarti properti statis. Properti statis merupakan milik tipe itu sendiri, dan dapat langsung diakses dengan cara “nama tipe.nama properti”.

Contohnya:

```swift
Animal.animals
```

Yang kedua adalah `extension`.

`extension` berarti ekstensi. Ia dapat memisahkan kode dari tipe yang sama ke beberapa bagian, sehingga struktur kode menjadi lebih jelas.

Dalam contoh ini, kita menggunakan `extension Animal` untuk menyimpan data hewan, sehingga struct `Animal` itu sendiri menjadi lebih ringkas.

Selain itu, `Animal` terutama menyimpan model data dan tidak langsung menulis antarmuka SwiftUI, sehingga di sini kita menggunakan `import Foundation`.

Fokus pelajaran ini bukan membuat kode menjadi lebih kompleks, melainkan membuat kode lebih mudah dibaca dan dipelihara.
