# Organisere dyredata

I forrige leksjon fullførte vi et enkelt eksempel på et dyreleksikon.

![view](../../../Resource/029_view.png)

Når brukeren trykker på et dyr, viser siden dyredetaljene gjennom et `Sheet`.

Men det finnes et problem i koden fra forrige leksjon: dyredataene er skrevet direkte inne i `ContentView`.

For eksempel:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav rundt om i verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Vis dyrelisten
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Denne koden kan kjøre normalt, men når mengden dyredata øker, blir `ContentView` svært lang.

`ContentView` bør egentlig hovedsakelig være ansvarlig for å vise grensesnittet, men nå lagrer den også store mengder dyredata. Dette påvirker lesbarheten i koden og gjør senere vedlikehold mindre praktisk.

Derfor skal vi gjøre én ting i denne leksjonen:

Flytte dyredataene ut av `ContentView`.

## Hvorfor skille ut dataene?

I SwiftUI er visningskode vanligvis ansvarlig for å vise grensesnittet.

For eksempel:

```swift
Text("Delfin")
Image("dolphin")
```

Disse kodelinjene handler alle om visning av grensesnittet.

Selve dyredataene, for eksempel dyrenavn, bildenavn, utbredelsesområde, habitat og beskrivelsestekst, er ikke en del av grensesnittstrukturen.

De ligner mer på et sett med faste opplysninger:

```swift
Animal(
    name: "Delfin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Varme og tempererte hav rundt om i verden.",
    habitat: "Hav, kystfarvann og noen store elver.",
    animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
),
// ...
```

Hvis grensesnittkode og datakode skrives sammen, blir koden mer og mer rotete.

Derfor kan vi legge dyredataene inn i `Animal`-typen.

## Bruke static til å lagre faste data

La oss først se på den organiserte skrivemåten:

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
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav rundt om i verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
        ),
        // ...
    ]
}
```

Her er det lagt til én ny kodelinje:

```swift
static let animals: [Animal] = [
    
]
```

`static` betyr en statisk egenskap.

En statisk egenskap tilhører selve typen. Den tilhører ikke en bestemt instans.

Denne setningen er litt abstrakt, så vi kan forstå den gjennom et enkelt eksempel.

## Vanlige egenskaper og statiske egenskaper

For eksempel definerer vi en `Student`:

```swift
struct Student {
    let name: String
}
```

Her er `name` en vanlig egenskap. En vanlig egenskap tilhører en bestemt instans.

Hvis vi vil få tilgang til `name`, må vi først opprette en konkret student:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Her er `student` en instans. Foreløpig kan du forstå det som ett konkret stykke studentdata.

Fordi hver student kan ha et annet navn, må `name` plasseres på en bestemt student.

Men noen data tilhører ikke en bestemt instans.

For eksempel vil vi forberede en gruppe eksempeldata for forhåndsvisning:

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

Her har `previewStudents` `static` foran seg, så det er en statisk egenskap.

En statisk egenskap tilhører ikke én student. Den tilhører i stedet selve `Student`-typen.

Derfor trenger vi ikke først å opprette en student. Vi kan få direkte tilgang gjennom typenavnet:

```swift
print(Student.previewStudents.count)    // 3
```

Tilgangsmønsteret her er:

```swift
Typenavn.statiskEgenskapsnavn
```

Altså:

```swift
Student.previewStudents
```

På samme måte kan vi i dyreleksikonet få tilgang til dyredataene slik:

```swift
Animal.animals
```

## Tilbake til ContentView

Nå er dyredataene lagret i `Animal`-typen.

Derfor trenger vi ikke lenger å skrive en veldig lang dyre-array inne i `ContentView`.

Vi kan endre det til:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Vis dyrelisten
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Denne kodelinjen betyr:

```swift
let animals = Animal.animals
```

Hent dyredataene `animals` fra `Animal`-typen, og lagre dem deretter i `animals`-konstanten i den nåværende visningen.

Når vi skriver det på denne måten, blir `ContentView` mer konsis.

`ContentView` er ansvarlig for å vise grensesnittet, og `Animal.animals` er ansvarlig for å levere dyredataene.

## Flytte Animal til en egen fil

I forrige leksjon skrev vi `Animal` og `ContentView` i samme fil for å gjøre eksempelet enklere å forstå.

Fordi koden fortsatt var relativt kort på det tidspunktet, var dette helt greit.

Men nå blir det mer og mer dyredata. Hvis vi fortsetter å legge all koden i `ContentView.swift`, blir filen veldig lang og vanskeligere å lese.

Derfor kan vi legge `Animal` alene i en ny Swift-fil.

I Xcode kan du opprette en ny Swift-fil, for eksempel:

```swift
Animal.swift
```

Deretter flytter du `Animal`-strukturen inn i denne filen:

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
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav rundt om i verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
        ),
        // ...
    ]
}
```

Etter at vi har organisert det slik:

`ContentView.swift` er ansvarlig for å vise grensesnittet.

`Animal.swift` er ansvarlig for å beskrive strukturen til dyredataene.

Selv om de ligger i forskjellige filer, kan `ContentView` fortsatt bruke `Animal` direkte så lenge de er i samme prosjekt.

For eksempel:

```swift
let animals = Animal.animals
```

Her trenger du ikke å importere `Animal.swift` ekstra i `ContentView.swift`.

Swift gjenkjenner automatisk Swift-filer i samme prosjekt.

## Bruke extension til å fortsette å organisere koden

Nå har vi flyttet dyredataene fra `ContentView` inn i `Animal`.

Men `Animal`-strukturen inneholder fortsatt to typer kode samtidig:

Den første typen er egenskapene til selve dyremodellen:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Den andre typen er de faste dyredataene:

```swift
static let animals: [Animal] = [
    // ...
]
```

For å gjøre kodestrukturen tydeligere kan vi bruke `extension` til å skille disse to delene.

`extension` betyr utvidelse.

Det kan legge til ny kode basert på en eksisterende type.

For eksempel:

```swift
extension Animal {
    
}
```

Dette betyr at vi utvider `Animal`-typen.

## Legge dyredata i en extension

Vi kan endre `Animal` til dette:

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
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav rundt om i verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
        ),
        // ...
    ]
}
```

Når vi organiserer det slik, blir kodestrukturen tydeligere.

`struct Animal` er ansvarlig for å beskrive hvilke egenskaper et dyr skal ha.

`extension Animal` er ansvarlig for å lagre et sett med faste dyredata.

Legg merke til at selv om `animals` er flyttet inn i `extension Animal`, endres ikke måten vi bruker det på.

Vi kan fortsatt bruke det slik:

```swift
let animals = Animal.animals
```

Dette er også en egenskap ved `extension`: det hjelper oss bare med å organisere koden og endrer ikke den eksterne kallmåten.

## Når det er mer data, kan du opprette en egen AnimalData-fil

Nå har vi lagt `Animal` i en separat `Animal.swift`-fil.

Hvis det ikke er mye dyredata, kan du skrive `extension Animal` direkte i `Animal.swift`.

Men hvis det blir mer og mer dyredata, kan du også opprette en ny fil, for eksempel:

```swift
AnimalData.swift
```

Deretter legger du de faste dyredataene inn der:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dyredata
    ]
}
```

Etter at vi gjør dette, blir kodeansvaret tydeligere:

`Animal.swift` er bare ansvarlig for å definere dyremodellen.

`AnimalData.swift` er bare ansvarlig for å lagre dyredataene.

`ContentView.swift` er bare ansvarlig for å vise grensesnittet.

Ansvarsområdet til hver fil blir tydeligere.

Legg merke til at `AnimalData.swift` bare er filnavnet. Det er ikke en ny Swift-type. Inne i denne filen bruker vi fortsatt `extension Animal` til å legge faste data til `Animal`.

## Komplett kode

Nedenfor er den organiserte `Animal.swift`-koden:

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

Den organiserte `AnimalData.swift`-koden:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav rundt om i verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for sin lekne atferd."
        ),
        Animal(
            name: "Sjiraff",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner og åpne skogområder i Afrika.",
            habitat: "Gressletter, savanner og åpne skoger.",
            animalDescription: "Sjiraffer er de høyeste landdyrene. De har lange halser, lange bein og spiser vanligvis blader fra høye trær."
        ),
        Animal(
            name: "Løve",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Finnes hovedsakelig i Afrika sør for Sahara, med en liten bestand i vestlige India.",
            habitat: "Gressletter, savanner og åpne skogområder.",
            animalDescription: "Løver er kraftige store kattedyr. De lever vanligvis i grupper kalt flokker og er ofte kjent som kongene i dyreverdenen."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Fjellskoger i det sentrale Kina.",
            habitat: "Bambusskoger i kjølige og fuktige fjellområder.",
            animalDescription: "Pandaer er bjørner kjent for sin svarte og hvite pels. De spiser hovedsakelig bambus og er blant de mest gjenkjennelige dyrene i verden."
        ),
        Animal(
            name: "Isbjørn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiske områder rundt Nordpolen.",
            habitat: "Sjøis, kystområder og kalde arktiske miljøer.",
            animalDescription: "Isbjørner er store bjørner tilpasset kalde miljøer. De er sterke svømmere og er hovedsakelig avhengige av sjøis for å jakte på sel."
        )
    ]
}
```

I `ContentView.swift` kan du bruke det slik:

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
                            .clipShape(Circle())
                        
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

Tips: I både `Animal.swift`- og `AnimalData.swift`-filen er den første linjen:

```swift
import Foundation
```

Tidligere, når vi skrev SwiftUI-grensesnitt, brukte vi ofte:

```swift
import SwiftUI
```

Dette er fordi `ContentView`, `Text`, `Button` og `Color` alle er knyttet til grensesnittet, så når vi skriver grensesnittfiler, må vi vanligvis importere SwiftUI.

Men her er ikke `Animal.swift` og `AnimalData.swift` grensesnittfiler. De brukes hovedsakelig til å definere dyremodellen og lagre dyredata.

I denne koden trenger `UUID()` `Foundation`, så det er nok å importere `Foundation`.

## Oppsummering

I denne leksjonen gjorde vi hovedsakelig én ting: vi flyttet dyredataene ut av `ContentView`.

Den opprinnelige måten var å skrive dyredataene direkte inne i `ContentView`. Denne koden kan kjøre, men når datamengden øker, blir visningsfilen lengre og lengre.

Etter organiseringen er `ContentView` bare ansvarlig for å vise grensesnittet, og `Animal.animals` er ansvarlig for å levere dyredataene.

Denne leksjonen introduserte også to nye kunnskapspunkter.

Det første er `static`.

`static` betyr en statisk egenskap. En statisk egenskap tilhører selve typen og kan hentes direkte med «Typenavn.egenskapsnavn».

For eksempel:

```swift
Animal.animals
```

Det andre er `extension`.

`extension` betyr utvidelse. Det kan dele koden til samme type inn i forskjellige deler, slik at kodestrukturen blir tydeligere.

I dette eksempelet bruker vi `extension Animal` til å lagre dyredataene, noe som gjør selve `Animal`-strukturen mer konsis.

I tillegg lagrer `Animal` hovedsakelig en datamodell og skriver ikke et SwiftUI-grensesnitt direkte, så her bruker vi `import Foundation`.

Fokuset i denne leksjonen er ikke å gjøre koden mer komplisert, men å gjøre koden lettere å lese og vedlikeholde.
