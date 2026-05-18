# Menyusun Data Haiwan

Dalam pelajaran sebelumnya, kita telah menyiapkan contoh ensiklopedia haiwan yang ringkas.

![view](../../../Resource/029_view.png)

Apabila pengguna mengetik haiwan tertentu, halaman akan memaparkan butiran haiwan melalui `Sheet`.

Namun, terdapat satu masalah dalam kod pelajaran sebelumnya: data haiwan ditulis terus di dalam `ContentView`.

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
            // Paparkan senarai haiwan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Kod ini boleh berjalan dengan baik, tetapi apabila data haiwan semakin banyak, `ContentView` akan menjadi sangat panjang.

`ContentView` sepatutnya terutamanya bertanggungjawab untuk memaparkan antara muka, tetapi sekarang ia juga menyimpan banyak data haiwan. Ini akan menjejaskan pembacaan kod dan menyukarkan penyelenggaraan kemudian.

Oleh itu, dalam pelajaran ini kita akan melakukan satu perkara:

Menyusun data haiwan keluar daripada `ContentView`.

## Mengapa perlu memisahkan data?

Dalam SwiftUI, kod view biasanya bertanggungjawab untuk memaparkan antara muka.

Contohnya:

```swift
Text("Dolphin")
Image("dolphin")
```

Kod-kod ini berkaitan dengan paparan antara muka.

Tetapi data haiwan itu sendiri, seperti nama haiwan, nama imej, kawasan taburan, habitat dan teks penerangan, bukanlah struktur antara muka.

Data tersebut lebih seperti sekumpulan maklumat tetap:

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

Jika kod antara muka dan kod data semuanya ditulis bersama, kod akan menjadi semakin berserabut.

Jadi, kita boleh meletakkan data haiwan di dalam jenis `Animal`.

## Menggunakan static untuk menyimpan data tetap

Mula-mula, mari kita lihat cara penulisan selepas disusun:

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

Di sini, satu baris kod baharu ditambah:

```swift
static let animals: [Animal] = [
    
]
```

`static` bermaksud sifat statik.

Sifat statik tergolong kepada jenis itu sendiri, bukan kepada satu instance tertentu.

Ayat ini agak abstrak, jadi kita boleh memahaminya melalui contoh ringkas.

## Sifat biasa dan sifat statik

Contohnya, kita mentakrifkan satu `Student`:

```swift
struct Student {
    let name: String
}
```

Di sini, `name` ialah sifat biasa. Sifat biasa tergolong kepada satu instance tertentu.

Jika kita mahu mengakses `name`, kita mesti mencipta seorang pelajar tertentu terlebih dahulu:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Di sini, `student` ialah satu instance. Buat sementara waktu, ia juga boleh difahami sebagai satu set data pelajar yang konkrit.

Kerana nama setiap pelajar mungkin berbeza, `name` mesti diletakkan pada pelajar tertentu itu.

Namun, terdapat sesetengah data yang tidak tergolong kepada satu instance tertentu.

Contohnya, kita mahu menyediakan sekumpulan data contoh yang boleh digunakan untuk pratonton:

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

Di sini, `previewStudents` mempunyai `static` di hadapannya, jadi ia ialah sifat statik.

Sifat statik tidak tergolong kepada seorang pelajar tertentu, tetapi tergolong kepada jenis `Student` itu sendiri.

Oleh itu, kita tidak perlu mencipta seorang pelajar terlebih dahulu. Kita boleh mengaksesnya terus melalui nama jenis:

```swift
print(Student.previewStudents.count)    // 3
```

Cara akses di sini ialah:

```swift
NamaJenis.namaSifatStatik
```

Iaitu:

```swift
Student.previewStudents
```

Begitu juga, dalam ensiklopedia haiwan, kita boleh mengakses data haiwan seperti ini:

```swift
Animal.animals
```

## Kembali ke ContentView

Sekarang, data haiwan telah disimpan di dalam jenis `Animal`.

Jadi, kita tidak perlu lagi menulis array haiwan yang panjang di dalam `ContentView`.

Kita boleh menukarnya kepada:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Paparkan senarai haiwan
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Baris kod ini bermaksud:

```swift
let animals = Animal.animals
```

Mengambil sekumpulan data haiwan `animals` daripada jenis `Animal`, kemudian menyimpannya ke dalam pemalar `animals` pada view semasa.

Selepas ditulis begini, `ContentView` akan menjadi lebih ringkas.

`ContentView` bertanggungjawab untuk memaparkan antara muka, manakala `Animal.animals` bertanggungjawab untuk menyediakan data haiwan.

## Memisahkan Animal ke dalam fail berasingan

Dalam pelajaran sebelumnya, untuk menjadikan contoh lebih mudah difahami, kita menulis `Animal` dan `ContentView` dalam fail yang sama.

Kerana kod pada masa itu masih sedikit, cara penulisan tersebut tidak menjadi masalah.

Tetapi sekarang data haiwan semakin banyak. Jika kita terus menulis semua kod di dalam `ContentView.swift`, fail akan menjadi sangat panjang dan tidak mudah dibaca.

Jadi, kita boleh meletakkan `Animal` secara berasingan dalam fail Swift baharu.

Dalam Xcode, kita boleh mencipta fail Swift baharu, contohnya:

```swift
Animal.swift
```

Kemudian pindahkan struktur `Animal` ke dalam fail ini:

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

Selepas disusun begini:

`ContentView.swift` bertanggungjawab untuk memaparkan antara muka.

`Animal.swift` bertanggungjawab untuk menerangkan struktur data haiwan.

Walaupun kedua-duanya diletakkan dalam fail yang berbeza, selagi kedua-duanya berada dalam projek yang sama, `ContentView` masih boleh menggunakan `Animal` secara terus.

Contohnya:

```swift
let animals = Animal.animals
```

Di sini, kita tidak perlu mengimport `Animal.swift` tambahan di dalam `ContentView.swift`.

Swift akan mengenal pasti fail Swift dalam projek yang sama secara automatik.

## Menggunakan extension untuk terus menyusun kod

Sekarang, kita telah memindahkan data haiwan daripada `ContentView` ke dalam `Animal`.

Namun, struktur `Animal` masih mengandungi dua jenis kod pada masa yang sama:

Jenis pertama ialah sifat model haiwan itu sendiri:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Jenis kedua ialah data haiwan tetap:

```swift
static let animals: [Animal] = [
    // ...
]
```

Untuk menjadikan struktur kod lebih jelas, kita boleh menggunakan `extension` untuk memisahkan dua bahagian ini.

`extension` bermaksud sambungan atau perluasan.

Ia boleh menambah kod baharu pada asas jenis yang sedia ada.

Contohnya:

```swift
extension Animal {
    
}
```

Ini bermaksud kita sedang memperluas jenis `Animal`.

## Meletakkan data haiwan di dalam extension

Kita boleh menukar `Animal` menjadi seperti ini:

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

Selepas disusun begini, struktur kod akan menjadi lebih jelas.

`struct Animal` bertanggungjawab untuk menerangkan sifat yang perlu dimiliki oleh seekor haiwan.

`extension Animal` bertanggungjawab untuk menyimpan sekumpulan data haiwan tetap.

Perhatikan bahawa walaupun `animals` telah dipindahkan ke dalam `extension Animal`, cara penggunaannya tidak berubah.

Kita masih boleh menggunakannya seperti ini:

```swift
let animals = Animal.animals
```

Ini juga merupakan salah satu ciri `extension`: ia hanya membantu kita menyusun kod dan tidak mengubah cara panggilan dari luar.

## Apabila data lebih banyak, anda boleh mencipta fail AnimalData baharu

Sekarang, kita telah meletakkan `Animal` dalam fail `Animal.swift` yang berasingan.

Jika data haiwan tidak banyak, kita boleh terus menulis `extension Animal` di dalam `Animal.swift`.

Tetapi jika data haiwan semakin banyak, kita juga boleh mencipta satu fail baharu, contohnya:

```swift
AnimalData.swift
```

Kemudian letakkan data haiwan tetap di dalamnya:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Data haiwan
    ]
}
```

Selepas berbuat demikian, pembahagian tugas kod akan menjadi lebih jelas:

`Animal.swift` hanya bertanggungjawab untuk mentakrifkan model haiwan.

`AnimalData.swift` hanya bertanggungjawab untuk menyimpan data haiwan.

`ContentView.swift` hanya bertanggungjawab untuk memaparkan antara muka.

Tanggungjawab setiap fail menjadi lebih jelas.

Perhatikan bahawa `AnimalData.swift` hanyalah nama fail, bukan jenis Swift baharu. Di dalam fail ini, kita masih menggunakan `extension Animal` untuk menambahkan data tetap kepada `Animal`.

## Kod lengkap

Berikut ialah kod `Animal.swift` selepas disusun:

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

Kod `AnimalData.swift` selepas disusun:

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

Dalam `ContentView.swift`, kita boleh menggunakannya seperti ini:

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

Petua: dalam fail `Animal.swift` dan `AnimalData.swift`, baris pertama kedua-duanya menulis:

```swift
import Foundation
```

Sebelum ini, apabila kita menulis antara muka SwiftUI, kita sering menggunakan:

```swift
import SwiftUI
```

Ini kerana `ContentView`, `Text`, `Button`, `Color` dan kandungan lain semuanya berkaitan dengan antara muka. Jadi apabila menulis fail antara muka, biasanya kita perlu mengimport SwiftUI.

Tetapi `Animal.swift` dan `AnimalData.swift` di sini bukan fail antara muka. Ia terutamanya digunakan untuk mentakrifkan model haiwan dan menyimpan data haiwan.

Dalam kod ini, `UUID()` perlu menggunakan `Foundation`, jadi cukup untuk mengimport `Foundation`.

## Ringkasan

Dalam pelajaran ini, kita terutamanya melakukan satu perkara: menyusun data haiwan keluar daripada `ContentView`.

Cara penulisan asal ialah menulis data haiwan terus di dalam `ContentView`. Kod ini boleh berjalan, tetapi apabila data bertambah banyak, fail view akan menjadi semakin panjang.

Selepas disusun, `ContentView` hanya bertanggungjawab untuk memaparkan antara muka, manakala `Animal.animals` bertanggungjawab untuk menyediakan data haiwan.

Dalam pelajaran ini, kita juga mempelajari dua pengetahuan baharu.

Yang pertama ialah `static`.

`static` bermaksud sifat statik. Sifat statik tergolong kepada jenis itu sendiri dan boleh diakses terus melalui cara “nama jenis.nama sifat”.

Contohnya:

```swift
Animal.animals
```

Yang kedua ialah `extension`.

`extension` bermaksud sambungan atau perluasan. Ia boleh memisahkan kod bagi jenis yang sama supaya struktur kod menjadi lebih jelas.

Dalam contoh ini, kita menggunakan `extension Animal` untuk menyimpan data haiwan, supaya struktur `Animal` itu sendiri menjadi lebih ringkas.

Selain itu, `Animal` terutamanya menyimpan model data dan tidak menulis antara muka SwiftUI secara langsung, jadi di sini kita menggunakan `import Foundation`.

Fokus pelajaran ini bukan untuk menjadikan kod lebih kompleks, tetapi untuk menjadikan kod lebih mudah dibaca dan diselenggara.
