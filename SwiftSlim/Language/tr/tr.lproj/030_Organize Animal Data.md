# Hayvan Verilerini Düzenleme

Önceki derste basit bir hayvan ansiklopedisi örneğini tamamladık.

![view](../../../Resource/029_view.png)

Kullanıcı bir hayvana dokunduğunda, sayfa hayvan ayrıntılarını bir `Sheet` aracılığıyla gösterir.

Ancak önceki dersin kodunda bir sorun vardı: hayvan verileri doğrudan `ContentView` içinde yazılmıştı.

Örneğin:

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
            // Hayvan listesini göster
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Bu kod normal şekilde çalışabilir, ancak hayvan verisi arttıkça `ContentView` çok uzun hale gelir.

`ContentView` aslında temel olarak arayüzü göstermekten sorumlu olmalıdır, fakat şimdi çok miktarda hayvan verisini de saklıyor. Bu durum kodun okunabilirliğini etkiler ve sonraki bakım çalışmalarını zorlaştırır.

Bu yüzden bu derste tek bir şey yapacağız:

Hayvan verilerini `ContentView` dışına taşıyacağız.

## Veriler neden ayrılmalı?

SwiftUI'da görünüm kodu genellikle arayüzü göstermekten sorumludur.

Örneğin:

```swift
Text("Dolphin")
Image("dolphin")
```

Bu kodların hepsi arayüz gösterimiyle ilgilidir.

Hayvan verisinin kendisi, örneğin hayvan adı, görsel adı, dağılım alanı, yaşam alanı ve açıklama metni, arayüz yapısı değildir.

Bunlar daha çok sabit bir bilgi kümesine benzer:

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

Arayüz kodu ve veri kodu tamamen birlikte yazılırsa, kod gittikçe daha karmaşık hale gelir.

Bu nedenle hayvan verilerini `Animal` türünün içine koyabiliriz.

## Sabit verileri saklamak için static kullanma

Önce düzenlenmiş yazım biçimine bakalım:

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

Burada yeni bir kod satırı ekledik:

```swift
static let animals: [Animal] = [
    
]
```

`static`, statik özellik anlamına gelir.

Statik özellik türün kendisine aittir. Belirli bir örneğe ait değildir.

Bu cümle biraz soyut olabilir. Bunu basit bir örnekle anlayabiliriz.

## Normal özellikler ve statik özellikler

Örneğin bir `Student` tanımlayalım:

```swift
struct Student {
    let name: String
}
```

Buradaki `name` normal bir özelliktir. Normal özellik belirli bir örneğe aittir.

`name` değerine erişmek istiyorsak, önce belirli bir öğrenci oluşturmamız gerekir:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Buradaki `student` bir örnektir. Şimdilik bunu belirli bir öğrenci verisi olarak anlayabilirsiniz.

Her öğrencinin adı farklı olabileceği için `name` belirli bir öğrencinin üzerinde bulunmalıdır.

Ancak bazı veriler belirli bir örneğe ait değildir.

Örneğin önizlemeler için bir grup örnek veri hazırlamak istiyoruz:

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

Burada `previewStudents` önünde `static` bulunduğu için statik bir özelliktir.

Statik özellik belirli bir öğrenciye ait değildir. Bunun yerine `Student` türünün kendisine aittir.

Bu nedenle önce bir öğrenci oluşturmamız gerekmez. Doğrudan tür adı üzerinden erişebiliriz:

```swift
print(Student.previewStudents.count)    // 3
```

Buradaki erişim biçimi şudur:

```swift
TürAdı.statikÖzellikAdı
```

Yani:

```swift
Student.previewStudents
```

Aynı şekilde hayvan ansiklopedisinde hayvan verilerine şöyle erişebiliriz:

```swift
Animal.animals
```

## ContentView'e geri dönelim

Artık hayvan verileri `Animal` türünde saklandı.

Bu yüzden `ContentView` içinde çok uzun bir hayvan dizisi yazmamıza gerek kalmaz.

Bunu şu şekilde değiştirebiliriz:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Hayvan listesini göster
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Bu kod satırı şu anlama gelir:

```swift
let animals = Animal.animals
```

`Animal` türünden `animals` adlı hayvan verisi alınır ve ardından mevcut görünümün `animals` sabitine kaydedilir.

Böyle yazdıktan sonra `ContentView` daha sade hale gelir.

`ContentView` arayüzü göstermekten sorumludur, `Animal.animals` ise hayvan verilerini sağlamaktan sorumludur.

## Animal'ı ayrı bir dosyaya taşıma

Önceki derste örneği daha kolay anlaşılır yapmak için `Animal` ve `ContentView` kodlarını aynı dosyada yazmıştık.

Çünkü o sırada kod hâlâ görece azdı ve bu şekilde yazmak sorun oluşturmuyordu.

Ancak şimdi hayvan verileri gittikçe artıyor. Tüm kodu `ContentView.swift` içine koymaya devam edersek, dosya çok uzun hale gelir ve okunması zorlaşır.

Bu nedenle `Animal` türünü ayrı bir yeni Swift dosyasına koyabiliriz.

Xcode'da örneğin şu adla yeni bir Swift dosyası oluşturabilirsiniz:

```swift
Animal.swift
```

Ardından `Animal` yapısını bu dosyaya taşıyın:

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

Bu şekilde düzenledikten sonra:

`ContentView.swift` arayüzü göstermekten sorumludur.

`Animal.swift` hayvan verisinin yapısını tanımlamaktan sorumludur.

Farklı dosyalara yerleştirilmiş olsalar da aynı proje içinde oldukları sürece `ContentView` hâlâ `Animal` türünü doğrudan kullanabilir.

Örneğin:

```swift
let animals = Animal.animals
```

Burada `ContentView.swift` içinde ayrıca `Animal.swift` dosyasını içe aktarmanız gerekmez.

Swift, aynı projedeki Swift dosyalarını otomatik olarak tanır.

## Kodu düzenlemeye devam etmek için extension kullanma

Şimdi hayvan verilerini `ContentView` içinden `Animal` içine taşıdık.

Ancak `Animal` yapısı hâlâ aynı anda iki tür kod içeriyor:

İlk tür, hayvan modelinin kendi özellikleridir:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

İkinci tür ise sabit hayvan verileridir:

```swift
static let animals: [Animal] = [
    // ...
]
```

Kod yapısını daha net hale getirmek için bu iki bölümü `extension` ile ayırabiliriz.

`extension`, genişletme anlamına gelir.

Mevcut bir türün üzerine yeni kod eklemeye devam edebilir.

Örneğin:

```swift
extension Animal {
    
}
```

Bu, `Animal` türünü genişlettiğimiz anlamına gelir.

## Hayvan verilerini extension içine koyma

`Animal` kodunu şu hale getirebiliriz:

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

Bu şekilde düzenledikten sonra kod yapısı daha açık hale gelir.

`struct Animal`, bir hayvanın hangi özelliklere sahip olması gerektiğini açıklamaktan sorumludur.

`extension Animal`, bir grup sabit hayvan verisini saklamaktan sorumludur.

Dikkat edin: `animals`, `extension Animal` içine taşınmış olsa da kullanım biçimi değişmez.

Hâlâ şu şekilde kullanabiliriz:

```swift
let animals = Animal.animals
```

Bu da `extension` özelliğinin bir yönüdür: yalnızca kodu düzenlememize yardımcı olur ve dışarıdan çağırma biçimini değiştirmez.

## Veri arttığında ayrıca AnimalData dosyası oluşturabilirsiniz

Şimdi `Animal` türünü ayrı bir `Animal.swift` dosyasına koyduk.

Hayvan verisi çok fazla değilse, `extension Animal` kodunu doğrudan `Animal.swift` içinde yazabilirsiniz.

Ancak hayvan verisi gittikçe artıyorsa, örneğin şu adla başka bir dosya da oluşturabilirsiniz:

```swift
AnimalData.swift
```

Ardından sabit hayvan verilerini içine koyun:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Hayvan verileri
    ]
}
```

Bunu yaptıktan sonra kodun sorumlulukları daha net olur:

`Animal.swift` yalnızca hayvan modelini tanımlamaktan sorumludur.

`AnimalData.swift` yalnızca hayvan verilerini saklamaktan sorumludur.

`ContentView.swift` yalnızca arayüzü göstermekten sorumludur.

Her dosyanın sorumluluğu daha net hale gelir.

Dikkat edin: `AnimalData.swift` yalnızca dosya adıdır. Yeni bir Swift türü değildir. Bu dosyanın içinde hâlâ `extension Animal` kullanarak `Animal` türüne sabit veri ekliyoruz.

## Tam kod

Aşağıda düzenlenmiş `Animal.swift` kodu yer alıyor:

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

Düzenlenmiş `AnimalData.swift` kodu:

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

`ContentView.swift` içinde şu şekilde kullanabilirsiniz:

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

İpucu: `Animal.swift` ve `AnimalData.swift` dosyalarının ikisinde de ilk satır şudur:

```swift
import Foundation
```

Daha önce SwiftUI arayüzleri yazarken genellikle şunu kullanıyorduk:

```swift
import SwiftUI
```

Bunun nedeni `ContentView`, `Text`, `Button` ve `Color` gibi içeriklerin arayüzle ilgili olmasıdır. Bu yüzden arayüz dosyaları yazarken genellikle SwiftUI'ı içe aktarmamız gerekir.

Ancak burada `Animal.swift` ve `AnimalData.swift` arayüz dosyaları değildir. Bunlar temel olarak hayvan modelini tanımlamak ve hayvan verilerini saklamak için kullanılır.

Bu kodda `UUID()` için `Foundation` gerekir, bu yüzden `Foundation` içe aktarmak yeterlidir.

## Özet

Bu derste temel olarak tek bir şey yaptık: hayvan verilerini `ContentView` dışına taşıdık.

Önceki yöntemde hayvan verileri doğrudan `ContentView` içine yazılıyordu. Bu kod çalışabilir, ancak veri miktarı arttığında görünüm dosyası gittikçe uzar.

Düzenledikten sonra `ContentView` yalnızca arayüzü göstermekten sorumludur, `Animal.animals` ise hayvan verilerini sağlamaktan sorumludur.

Bu derste ayrıca iki yeni bilgi öğrendik.

Birincisi `static`.

`static`, statik özellik anlamına gelir. Statik özellik türün kendisine aittir ve “TürAdı.özellikAdı” biçimiyle doğrudan erişilebilir.

Örneğin:

```swift
Animal.animals
```

İkincisi `extension`.

`extension`, genişletme anlamına gelir. Aynı türe ait kodları farklı parçalara ayırabilir ve kod yapısını daha net hale getirebilir.

Bu örnekte hayvan verilerini saklamak için `extension Animal` kullanıyoruz. Böylece `Animal` yapısının kendisi daha sade hale gelir.

Ayrıca `Animal` temel olarak bir veri modeli saklar ve doğrudan SwiftUI arayüzü yazmaz. Bu nedenle burada `import Foundation` kullanıyoruz.

Bu dersin amacı kodu daha karmaşık hale getirmek değil, kodu daha kolay okunur ve bakımı daha kolay hale getirmektir.
