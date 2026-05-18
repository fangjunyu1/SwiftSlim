# Eläindatan järjestäminen

Edellisessä oppitunnissa toteutimme yksinkertaisen eläintietosanakirja-esimerkin.

![view](../../../Resource/029_view.png)

Kun käyttäjä napauttaa tiettyä eläintä, sivu näyttää eläimen yksityiskohdat `Sheet`-näkymän avulla.

Edellisen oppitunnin koodissa on kuitenkin yksi ongelma: eläindata on kirjoitettu suoraan `ContentView`-näkymän sisään.

Esimerkiksi:

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
            // Näytä eläinluettelo
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tämä koodi toimii normaalisti, mutta kun eläindataa tulee enemmän, `ContentView` muuttuu hyvin pitkäksi.

`ContentView`-näkymän pitäisi ensisijaisesti vastata käyttöliittymän näyttämisestä, mutta nyt se tallentaa myös suuren määrän eläindataa. Tämä heikentää koodin luettavuutta ja vaikeuttaa myöhempää ylläpitoa.

Siksi tällä oppitunnilla teemme yhden asian:

Siirrämme eläindatan pois `ContentView`-näkymästä.

## Miksi data kannattaa erottaa?

SwiftUI:ssa näkymäkoodi vastaa yleensä käyttöliittymän näyttämisestä.

Esimerkiksi:

```swift
Text("Dolphin")
Image("dolphin")
```

Nämä koodirivit liittyvät käyttöliittymän näyttämiseen.

Eläindata itsessään, kuten eläimen nimi, kuvan nimi, levinneisyysalue, elinympäristö ja kuvausteksti, ei ole käyttöliittymän rakenne.

Se muistuttaa enemmän joukkoa kiinteitä tietoja:

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

Jos käyttöliittymäkoodi ja datakoodi kirjoitetaan samaan paikkaan, koodi muuttuu yhä sekavammaksi.

Siksi voimme sijoittaa eläindatan `Animal`-tyyppiin.

## Kiinteän datan tallentaminen static-avainsanalla

Katsotaan ensin järjesteltyä kirjoitustapaa:

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

Tässä lisättiin uusi koodirivi:

```swift
static let animals: [Animal] = [
    
]
```

`static` tarkoittaa staattista ominaisuutta.

Staattinen ominaisuus kuuluu itse tyyppiin. Se ei kuulu mihinkään tiettyyn instanssiin.

Tämä lause on melko abstrakti, joten voimme ymmärtää sen yksinkertaisen esimerkin avulla.

## Tavalliset ominaisuudet ja staattiset ominaisuudet

Määritellään esimerkiksi `Student`:

```swift
struct Student {
    let name: String
}
```

Tässä `name` on tavallinen ominaisuus. Tavallinen ominaisuus kuuluu tiettyyn instanssiin.

Jos haluamme käyttää `name`-ominaisuutta, meidän on ensin luotava tietty opiskelija:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Tässä `student` on instanssi. Aluksi voit ymmärtää sen yhdeksi konkreettiseksi opiskelijadataksi.

Koska jokaisella opiskelijalla voi olla eri nimi, `name` täytyy sijoittaa tietyn opiskelijan yhteyteen.

Mutta jotkin tiedot eivät kuulu mihinkään tiettyyn instanssiin.

Esimerkiksi haluamme valmistella joukon esimerkkidataa esikatselua varten:

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

Tässä `previewStudents`-ominaisuuden edessä on `static`, joten se on staattinen ominaisuus.

Staattinen ominaisuus ei kuulu yhteen opiskelijaan, vaan se kuuluu itse `Student`-tyyppiin.

Siksi meidän ei tarvitse ensin luoda opiskelijaa. Voimme käyttää sitä suoraan tyypin nimen kautta:

```swift
print(Student.previewStudents.count)    // 3
```

Tässä käyttötapa on:

```swift
TyypinNimi.staattisenOminaisuudenNimi
```

Eli:

```swift
Student.previewStudents
```

Samalla tavalla eläintietosanakirjassa voimme käyttää eläindataa näin:

```swift
Animal.animals
```

## Takaisin ContentView-näkymään

Nyt eläindata on tallennettu `Animal`-tyyppiin.

Siksi meidän ei enää tarvitse kirjoittaa hyvin pitkää eläintaulukkoa `ContentView`-näkymän sisään.

Voimme muuttaa sen muotoon:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Näytä eläinluettelo
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tämä koodirivi tarkoittaa:

```swift
let animals = Animal.animals
```

Otetaan `animals`-eläindata `Animal`-tyypistä ja tallennetaan se nykyisen näkymän `animals`-vakioon.

Kun se kirjoitetaan näin, `ContentView` on selkeämpi.

`ContentView` vastaa käyttöliittymän näyttämisestä, ja `Animal.animals` vastaa eläindatan tarjoamisesta.

## Animalin siirtäminen erilliseen tiedostoon

Edellisessä oppitunnissa kirjoitimme `Animal`-tyypin ja `ContentView`-näkymän samaan tiedostoon, jotta esimerkki olisi helpompi ymmärtää.

Koska koodia oli silloin vielä melko vähän, tämä kirjoitustapa oli hyväksyttävä.

Mutta nyt eläindataa on yhä enemmän. Jos jatkamme kaiken koodin kirjoittamista `ContentView.swift`-tiedostoon, tiedostosta tulee hyvin pitkä ja vaikeampi lukea.

Siksi voimme sijoittaa `Animal`-tyypin omaan uuteen Swift-tiedostoon.

Xcodessa voit luoda uuden Swift-tiedoston, esimerkiksi:

```swift
Animal.swift
```

Siirrä sitten `Animal`-rakenne tähän tiedostoon:

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

Kun koodi järjestetään näin:

`ContentView.swift` vastaa käyttöliittymän näyttämisestä.

`Animal.swift` vastaa eläindatan rakenteen kuvaamisesta.

Vaikka ne ovat eri tiedostoissa, kunhan ne ovat samassa projektissa, `ContentView` voi edelleen käyttää `Animal`-tyyppiä suoraan.

Esimerkiksi:

```swift
let animals = Animal.animals
```

Tässä `ContentView.swift`-tiedostossa ei tarvitse erikseen tuoda `Animal.swift`-tiedostoa.

Swift tunnistaa automaattisesti saman projektin Swift-tiedostot.

## Koodin järjestämisen jatkaminen extension-laajennuksella

Nyt olemme siirtäneet eläindatan `ContentView`-näkymästä `Animal`-tyyppiin.

`Animal`-rakenne sisältää kuitenkin edelleen samanaikaisesti kahdenlaista koodia:

Ensimmäinen tyyppi on eläinmallin omat ominaisuudet:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Toinen tyyppi on kiinteä eläindata:

```swift
static let animals: [Animal] = [
    // ...
]
```

Jotta koodin rakenne olisi selkeämpi, voimme käyttää `extension`-laajennusta näiden kahden osan erottamiseen.

`extension` tarkoittaa laajennusta.

Se voi lisätä uutta koodia olemassa olevan tyypin pohjalta.

Esimerkiksi:

```swift
extension Animal {
    
}
```

Tämä tarkoittaa, että laajennamme `Animal`-tyyppiä.

## Eläindatan sijoittaminen extension-laajennukseen

Voimme muuttaa `Animal`-tyypin tällaiseksi:

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

Kun koodi järjestetään näin, koodin rakenne on selkeämpi.

`struct Animal` vastaa siitä, millaisia ominaisuuksia eläimellä pitäisi olla.

`extension Animal` vastaa kiinteän eläindatajoukon tallentamisesta.

Huomaa, että vaikka `animals` on siirretty `extension Animal`-laajennukseen, käyttötapa ei muutu.

Voimme edelleen käyttää sitä näin:

```swift
let animals = Animal.animals
```

Tämä on myös yksi `extension`-laajennuksen ominaisuus: se vain auttaa järjestämään koodia eikä muuta ulkoista kutsutapaa.

## Kun dataa on paljon, voit luoda vielä AnimalData-tiedoston

Nyt olemme sijoittaneet `Animal`-tyypin erilliseen `Animal.swift`-tiedostoon.

Jos eläindataa on vähän, voit kirjoittaa `extension Animal`-laajennuksen suoraan `Animal.swift`-tiedostoon.

Mutta jos eläindataa tulee yhä enemmän, voit myös luoda toisen tiedoston, esimerkiksi:

```swift
AnimalData.swift
```

Sijoita sitten kiinteä eläindata siihen:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Eläindata
    ]
}
```

Tämän jälkeen koodin vastuualueet ovat selkeämmät:

`Animal.swift` vastaa vain eläinmallin määrittelystä.

`AnimalData.swift` vastaa vain eläindatan tallentamisesta.

`ContentView.swift` vastaa vain käyttöliittymän näyttämisestä.

Jokaisen tiedoston vastuualue on selkeämpi.

Huomaa, että `AnimalData.swift` on vain tiedostonimi, ei uusi Swift-tyyppi. Tämän tiedoston sisällä käytämme edelleen `extension Animal`-laajennusta kiinteän datan lisäämiseen `Animal`-tyyppiin.

## Täydellinen koodi

Alla on järjestelty `Animal.swift`-koodi:

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

Järjestelty `AnimalData.swift`-koodi:

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

`ContentView.swift`-tiedostossa voit käyttää sitä näin:

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

Vinkki: `Animal.swift`- ja `AnimalData.swift`-tiedostoissa ensimmäinen rivi on:

```swift
import Foundation
```

Aiemmin SwiftUI-käyttöliittymiä kirjoittaessamme käytimme usein:

```swift
import SwiftUI
```

Tämä johtuu siitä, että `ContentView`, `Text`, `Button` ja `Color` liittyvät kaikki käyttöliittymään, joten käyttöliittymätiedostoja kirjoitettaessa täytyy yleensä tuoda SwiftUI.

Mutta tässä `Animal.swift` ja `AnimalData.swift` eivät ole käyttöliittymätiedostoja. Niitä käytetään pääasiassa eläinmallin määrittelyyn ja eläindatan tallentamiseen.

Tässä koodissa `UUID()` tarvitsee `Foundation`-kehyksen, joten `Foundation`-tuonti riittää.

## Yhteenveto

Tällä oppitunnilla teimme pääasiassa yhden asian: siirsimme eläindatan pois `ContentView`-näkymästä.

Alkuperäinen kirjoitustapa oli kirjoittaa eläindata suoraan `ContentView`-näkymään. Tämä koodi toimii, mutta kun dataa tulee enemmän, näkymätiedostosta tulee yhä pidempi.

Järjestelyn jälkeen `ContentView` vastaa vain käyttöliittymän näyttämisestä, ja `Animal.animals` vastaa eläindatan tarjoamisesta.

Tällä oppitunnilla opimme myös kaksi uutta asiaa.

Ensimmäinen on `static`.

`static` tarkoittaa staattista ominaisuutta. Staattinen ominaisuus kuuluu itse tyyppiin, ja sitä voidaan käyttää suoraan muodossa “TyypinNimi.ominaisuudenNimi”.

Esimerkiksi:

```swift
Animal.animals
```

Toinen on `extension`.

`extension` tarkoittaa laajennusta. Sen avulla saman tyypin koodi voidaan jakaa eri osiin, jolloin koodin rakenne on selkeämpi.

Tässä esimerkissä käytämme `extension Animal`-laajennusta eläindatan tallentamiseen, jolloin itse `Animal`-rakenne pysyy tiiviimpänä.

Lisäksi `Animal` tallentaa pääasiassa datamallia eikä kirjoita suoraan SwiftUI-käyttöliittymää, joten tässä käytämme `import Foundation`.

Tämän oppitunnin tarkoitus ei ole tehdä koodista monimutkaisempaa, vaan tehdä siitä helpommin luettavaa ja ylläpidettävää.
