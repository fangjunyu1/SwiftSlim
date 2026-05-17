# Organizarea datelor despre animale

În lecția anterioară, am finalizat un exemplu simplu de enciclopedie a animalelor.

![view](../../../Resource/029_view.png)

Când utilizatorul atinge un animal, pagina afișează detaliile animalului printr-un `Sheet`.

Totuși, în codul din lecția anterioară exista o problemă: datele despre animale erau scrise direct în `ContentView`.

De exemplu:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Afișează lista de animale
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Acest cod poate rula normal, dar atunci când datele despre animale devin tot mai multe, `ContentView` va deveni foarte lung.

`ContentView` ar trebui, în principal, să fie responsabil pentru afișarea interfeței, însă acum păstrează și o cantitate mare de date despre animale. Acest lucru afectează citirea codului și face mai dificilă întreținerea ulterioară.

Prin urmare, în această lecție vom face un singur lucru:

vom organiza datele despre animale în afara lui `ContentView`.

## De ce trebuie separate datele?

În SwiftUI, codul unei vizualizări este, de obicei, responsabil pentru afișarea interfeței.

De exemplu:

```swift
Text("Delfin")
Image("dolphin")
```

Aceste fragmente de cod au legătură cu afișarea interfeței.

Însă datele despre animale în sine, cum ar fi numele animalului, numele imaginii, aria de distribuție, habitatul și textul descriptiv, nu reprezintă structura interfeței.

Ele seamănă mai degrabă cu un set de informații fixe:

```swift
Animal(
    name: "Delfin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Oceane calde și temperate din întreaga lume.",
    habitat: "Oceane, ape de coastă și unele râuri mari.",
    animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
),
// ...
```

Dacă scriem codul interfeței și codul datelor toate la un loc, codul va deveni tot mai dezordonat.

De aceea, putem pune datele despre animale în tipul `Animal`.

## Folosirea lui static pentru salvarea datelor fixe

Să vedem mai întâi forma organizată:

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
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // ...
    ]
}
```

Aici a fost adăugată o nouă linie de cod:

```swift
static let animals: [Animal] = [
    
]
```

`static` înseamnă proprietate statică.

O proprietate statică aparține tipului însuși, nu unei anumite instanțe concrete.

Această formulare este destul de abstractă, așa că o putem înțelege printr-un exemplu simplu.

## Proprietăți obișnuite și proprietăți statice

De exemplu, definim un `Student`:

```swift
struct Student {
    let name: String
}
```

Aici, `name` este o proprietate obișnuită, iar o proprietate obișnuită aparține unei anumite instanțe concrete.

Dacă vrem să accesăm `name`, trebuie mai întâi să creăm un student concret:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Aici, `student` este o instanță; o putem înțelege mai întâi ca pe o anumită bucată concretă de date despre un student.

Deoarece numele fiecărui student poate fi diferit, `name` trebuie să se afle pe studentul concret.

Dar unele date nu aparțin unei anumite instanțe concrete.

De exemplu, vrem să pregătim un set de date exemplu care pot fi folosite în previzualizare:

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

Aici, `previewStudents` are `static` în față, deci este o proprietate statică.

O proprietate statică nu aparține unui anumit student, ci aparține tipului `Student` însuși.

Prin urmare, nu trebuie să creăm mai întâi un anumit student; putem accesa direct prin numele tipului:

```swift
print(Student.previewStudents.count)    // 3
```

Modul de acces de aici este:

```swift
NumeleTipului.numeleProprietățiiStatice
```

adică:

```swift
Student.previewStudents
```

În mod similar, în enciclopedia animalelor putem accesa datele despre animale astfel:

```swift
Animal.animals
```

## Revenind la ContentView

Acum, datele despre animale au fost salvate în tipul `Animal`.

Prin urmare, în `ContentView` nu mai trebuie să scriem un array lung de animale.

Îl putem modifica astfel:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Afișează lista de animale
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Această linie de cod înseamnă:

```swift
let animals = Animal.animals
```

Preluăm din tipul `Animal` acest set de date despre animale, `animals`, apoi îl salvăm în constanta `animals` a vizualizării curente.

După ce scriem astfel, `ContentView` devine mai simplu.

`ContentView` este responsabil pentru afișarea interfeței, iar `Animal.animals` este responsabil pentru furnizarea datelor despre animale.

## Separarea lui Animal într-un fișier separat

În lecția anterioară, pentru ca exemplul să fie mai ușor de înțeles, am scris `Animal` și `ContentView` în același fișier.

Deoarece atunci codul era încă relativ puțin, această abordare nu avea nicio problemă.

Însă acum datele despre animale devin tot mai multe. Dacă vom continua să scriem tot codul în `ContentView.swift`, fișierul va deveni foarte lung și nu va mai fi ușor de citit.

De aceea, putem pune `Animal` separat într-un nou fișier Swift.

În Xcode, putem crea un nou fișier Swift, de exemplu:

```swift
Animal.swift
```

Apoi mutăm structura `Animal` în acest fișier:

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
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // ...
    ]
}
```

După această organizare:

`ContentView.swift` este responsabil pentru afișarea interfeței.

`Animal.swift` este responsabil pentru descrierea structurii datelor despre animale.

Deși ele sunt puse în fișiere diferite, atâta timp cât sunt în același proiect, `ContentView` poate folosi în continuare direct `Animal`.

De exemplu:

```swift
let animals = Animal.animals
```

Aici nu trebuie să importăm suplimentar `Animal.swift` în `ContentView.swift`.

Swift va recunoaște automat fișierele Swift din același proiect.

## Folosirea lui extension pentru a organiza în continuare codul

Acum, am mutat deja datele despre animale din `ContentView` în `Animal`.

Totuși, structura `Animal` încă include simultan două tipuri de cod:

Primul tip este reprezentat de proprietățile modelului de animal în sine:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Al doilea tip este reprezentat de datele fixe despre animale:

```swift
static let animals: [Animal] = [
    // ...
]
```

Pentru a face structura codului mai clară, putem folosi `extension` pentru a separa aceste două părți.

`extension` înseamnă extindere.

Poate adăuga cod nou pe baza unui tip existent.

De exemplu:

```swift
extension Animal {
    
}
```

Aceasta înseamnă că extindem tipul `Animal`.

## Punerea datelor despre animale în extension

Putem modifica `Animal` astfel:

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
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // ...
    ]
}
```

După această organizare, structura codului va fi mai clară.

`struct Animal` este responsabil pentru descrierea proprietăților pe care ar trebui să le aibă un animal.

`extension Animal` este responsabil pentru salvarea unui set de date fixe despre animale.

Atenție: deși `animals` a fost mutat în `extension Animal`, modul de utilizare nu se schimbă.

Încă îl putem folosi astfel:

```swift
let animals = Animal.animals
```

Aceasta este și una dintre caracteristicile lui `extension`: doar ne ajută să organizăm codul, fără să schimbe modul de apelare din exterior.

## Când sunt multe date, putem crea încă un fișier AnimalData

Acum, am pus deja `Animal` într-un fișier separat `Animal.swift`.

Dacă datele despre animale sunt puține, putem scrie direct și `extension Animal` în `Animal.swift`.

Dar, dacă datele despre animale devin tot mai multe, putem crea încă un fișier nou, de exemplu:

```swift
AnimalData.swift
```

Apoi punem datele fixe despre animale în el:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Date despre animale
    ]
}
```

După ce facem asta, împărțirea responsabilităților în cod devine mai clară:

`Animal.swift` este responsabil doar pentru definirea modelului de animal.

`AnimalData.swift` este responsabil doar pentru salvarea datelor despre animale.

`ContentView.swift` este responsabil doar pentru afișarea interfeței.

Responsabilitatea fiecărui fișier devine mai clară.

Atenție: `AnimalData.swift` este doar numele fișierului, nu un nou tip Swift. În acest fișier, folosim în continuare `extension Animal` pentru a adăuga date fixe la `Animal`.

## Cod complet

Mai jos este codul organizat pentru `Animal.swift`:

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

Codul organizat pentru `AnimalData.swift`:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Ei trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        Animal(
            name: "Girafă",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane și păduri deschise din Africa.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Girafele sunt cele mai înalte animale terestre. Au gâturi lungi, picioare lungi și, de obicei, se hrănesc cu frunze din copaci înalți."
        ),
        Animal(
            name: "Leu",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Se găsesc în principal în Africa subsahariană, cu o populație mică în vestul Indiei.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Leii sunt feline mari și puternice. De obicei trăiesc în grupuri numite haite și sunt adesea cunoscuți drept regii lumii animalelor."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Păduri montane din centrul Chinei.",
            habitat: "Păduri de bambus din zone montane răcoroase și umede.",
            animalDescription: "Panda sunt urși cunoscuți pentru blana lor alb-negru. Ei se hrănesc în principal cu bambus și sunt unele dintre cele mai ușor de recunoscut animale din lume."
        ),
        Animal(
            name: "Urs polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiuni arctice din jurul Polului Nord.",
            habitat: "Gheață marină, zone de coastă și medii arctice reci.",
            animalDescription: "Urșii polari sunt urși mari adaptați la medii reci. Sunt înotători puternici și depind în principal de gheața marină pentru a vâna foci."
        )
    ]
}
```

În `ContentView.swift`, îl putem folosi astfel:

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

Notă: în fișierele `Animal.swift` și `AnimalData.swift`, prima linie este:

```swift
import Foundation
```

Înainte, când scriam interfețe SwiftUI, foloseam des:

```swift
import SwiftUI
```

Acest lucru se întâmplă deoarece `ContentView`, `Text`, `Button`, `Color` și aceste elemente au legătură cu interfața, așa că atunci când scriem fișiere de interfață, de obicei trebuie să importăm SwiftUI.

Dar aici, `Animal.swift` și `AnimalData.swift` nu sunt fișiere de interfață. Ele sunt folosite în principal pentru a defini modelul de animal și pentru a salva datele despre animale.

În acest cod, `UUID()` are nevoie de `Foundation`, deci este suficient să importăm `Foundation`.

## Rezumat

În această lecție am făcut în principal un singur lucru: am organizat datele despre animale în afara lui `ContentView`.

Abordarea inițială era să scriem datele despre animale direct în `ContentView`. Codul putea rula astfel, dar atunci când datele se înmulțesc, fișierul vizualizării devine tot mai lung.

După organizare, `ContentView` este responsabil doar pentru afișarea interfeței, iar `Animal.animals` este responsabil pentru furnizarea datelor despre animale.

În această lecție am învățat și două concepte noi.

Primul este `static`.

`static` înseamnă proprietate statică. O proprietate statică aparține tipului însuși și poate fi accesată direct prin forma „numele tipului.numele proprietății”.

De exemplu:

```swift
Animal.animals
```

Al doilea este `extension`.

`extension` înseamnă extindere. Poate împărți codul aceluiași tip în mai multe locuri, astfel încât structura codului să fie mai clară.

În acest exemplu, folosim `extension Animal` pentru a salva datele despre animale, astfel încât structura `Animal` în sine să fie mai simplă.

În plus, `Animal` salvează în principal un model de date și nu scrie direct o interfață SwiftUI, așa că aici folosim `import Foundation`.

Ideea principală a acestei lecții nu este să facem codul mai complicat, ci să îl facem mai ușor de citit și de întreținut.
