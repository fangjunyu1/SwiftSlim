# Enciclopedia animalelor 

În această lecție, vom continua să exersăm vizualizările personalizate și transmiterea datelor.

Vom crea o vizualizare simplă de tip enciclopedie a animalelor. Pagina va afișa cinci animale, iar când utilizatorul atinge un animal, va apărea o vizualizare de detaliu care arată imaginea, aria de distribuție, habitatul și descrierea acestuia.

Rezultatul obținut:

![view](../../../Resource/029_view.png)

Prin acest exemplu, putem exersa cooperarea dintre structurile de date, afișarea listelor, interacțiunea la atingere și vizualizările pop-up Sheet.

## Pregătirea imaginilor

Mai întâi, trebuie să pregătim cinci imagini cu animale:

- Delfin: `dolphin.jpg`
- Girafă: `giraffe.jpg`
- Leu: `lion.jpg`
- Panda: `panda.jpg`
- Urs polar: `polarBear.jpg`

Poți folosi următoarele imagini:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Girafă](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Leu](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Urs polar](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

După descărcarea imaginilor, trage-le în folderul de resurse `Assets` al proiectului Xcode.

![assets](../../../Resource/029_assets.png)

Trebuie remarcat că, atunci când folosești imagini în cod, de obicei nu trebuie să scrii extensia `.jpg`.

De exemplu, dacă numele resursei de imagine este `dolphin`, în cod scriem:

```swift
Image("dolphin")
```

Dacă numele imaginii este scris greșit, imaginea nu va fi afișată corect.

Notă: imaginile de mai sus provin din proiectele Wikimedia. La utilizare, se recomandă păstrarea linkului original și a informațiilor despre sursă.

## Crearea structurii Animal

În această pagină, fiecare animal are mai multe informații:

- Numele animalului
- Imaginea animalului
- Emoji-ul animalului
- Aria de distribuție
- Habitatul
- Descrierea animalului

Dacă împărțim aceste informații în multe variabile separate, codul va deveni mai dezordonat. De aceea, putem crea o structură `Animal` și putem pune împreună informațiile unui animal.

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
```

În acest cod:

- `id`: identificatorul unic al animalului.
- `name`: numele animalului.
- `imageName`: numele imaginii animalului.
- `avatarEmoji`: emoji-ul animalului.
- `distributionArea`: aria de distribuție.
- `habitat`: habitatul.
- `animalDescription`: descrierea animalului.

Dintre acestea:

```swift
let id = UUID()
```

`id` este folosit pentru a identifica fiecare animal. Deoarece mai târziu vom folosi `ForEach` pentru a afișa lista de animale și vom folosi `.sheet(item:)` pentru a afișa detaliile în funcție de animalul selectat, trebuie ca `Animal` să respecte protocolul `Identifiable`.

Rolul lui `Identifiable` este să îi spună lui SwiftUI că fiecare animal are un `id` prin care poate fi distins.

## Crearea datelor despre animale

Apoi, creăm un tablou de animale în `ContentView`.

Tabloul conține cinci valori `Animal`, iar fiecare `Animal` reprezintă un animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // Girafă
        Animal(
            name: "Girafă",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane și păduri deschise din Africa.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Girafele sunt cele mai înalte animale terestre. Au gâturi lungi, picioare lungi și de obicei se hrănesc cu frunze din copaci înalți."
        ),
        // Leu
        Animal(
            name: "Leu",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Se găsesc în principal în Africa subsahariană, cu o mică populație în vestul Indiei.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Leii sunt feline mari și puternice. De obicei trăiesc în grupuri numite haite și sunt adesea cunoscuți drept regii lumii animale."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Păduri montane din centrul Chinei.",
            habitat: "Păduri de bambus din zone montane răcoroase și umede.",
            animalDescription: "Urșii panda sunt cunoscuți pentru blana lor alb-negru. Se hrănesc în principal cu bambus și sunt printre cele mai ușor de recunoscut animale din lume."
        ),
        // Urs polar
        Animal(
            name: "Urs polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiunile arctice din jurul Polului Nord.",
            habitat: "Gheață marină, zone de coastă și medii arctice reci.",
            animalDescription: "Urșii polari sunt urși mari adaptați mediilor reci. Sunt înotători puternici și depind în principal de gheața marină pentru a vâna foci."
        )
    ]

    var body: some View {
        Text("Enciclopedia animalelor")
    }
}
```

Aici, `animals` este un tablou:

```swift
let animals: [Animal]
```

`[Animal]` înseamnă că acest tablou conține mai multe valori `Animal`.

Cu alte cuvinte, `animals` nu este un singur animal, ci un grup de animale.

## Afișarea listei de animale

Acum putem folosi `ForEach` pentru a afișa lista de animale.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
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
        }
    }
}
```

Rezultatul afișat:

![view](../../../Resource/029_view1.png)

În acest cod:

```swift
ForEach(animals) { animal in
    ...
}
```

Aceasta înseamnă parcurgerea tabloului `animals`.

La fiecare iterație, `animal` reprezintă animalul afișat în acel moment.

De exemplu, la prima iterație, `animal` este delfinul; la a doua iterație, `animal` este girafa.

De aceea, putem afișa informațiile animalului curent astfel:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Astfel, cele cinci animale pot fi afișate.

## Activarea atingerii în lista de animale

Acum lista este afișată, dar încă nu poate fi atinsă.

Dacă vrem să afișăm detalii după atingerea unui animal, trebuie mai întâi să înregistrăm „animalul selectat curent”.

Prin urmare, adăugăm o variabilă de stare în `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Aici, `selectedAnimal` este un tip opțional `Animal?`.

Aceasta înseamnă că poate conține un animal sau poate să nu conțină niciun animal.

Valoarea implicită este `nil`, ceea ce înseamnă că la început nu este selectat niciun animal.

Apoi transformăm fiecare rând de animal într-un `Button`:

```swift
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
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Punctul important este această linie de cod:

```swift
selectedAnimal = animal
```

Când utilizatorul atinge un animal, salvăm acel animal în `selectedAnimal`.

De exemplu, dacă utilizatorul atinge delfinul, `selectedAnimal` va salva delfinul.

Dacă utilizatorul atinge panda, `selectedAnimal` va salva panda.

Cu alte cuvinte, `selectedAnimal` este folosit pentru a înregistra animalul atins curent de utilizator.

## Vizualizarea pop-up Sheet

Acum putem deja înregistra prin buton „animalul atins curent”.

În continuare, trebuie să implementăm o vizualizare pop-up pentru a afișa detaliile animalului.

![view](../../../Resource/029_view2.png)

În SwiftUI, putem folosi `Sheet` pentru a realiza acest efect de afișare pop-up.

`Sheet` poate fi înțeles ca o pagină temporară care apare peste pagina curentă. După ce utilizatorul termină de vizualizat conținutul, o poate închide glisând în jos.

## Exemplu de Sheet

Înainte de a afișa efectiv detaliile animalului, folosim mai întâi un exemplu simplu pentru a înțelege cum apare un `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Afișează Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Vizualizare Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Rezultatul afișat:

![view](../../../Resource/029_view3.png)

În acest cod, am creat o valoare booleană:

```swift
@State private var showSheet = false
```

`showSheet` este implicit `false`, ceea ce înseamnă că la început nu se afișează `Sheet`.

Când butonul este atins:

```swift
showSheet.toggle()
```

`toggle()` înseamnă schimbarea valorii booleene.

Dacă inițial era `false`, după apelarea lui `toggle()` devine `true`.

Dacă inițial era `true`, după apelarea lui `toggle()` devine `false`.

Așadar, după atingerea butonului, `showSheet` se schimbă din `false` în `true`.

Când `showSheet` devine `true`, următorul cod va afișa un `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vizualizare Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Acest cod înseamnă: atunci când `showSheet` este `true`, se afișează un `Sheet`, iar în `Sheet` se afișează `Text("Vizualizare Sheet")`.

Rezultatul afișat:

![view](../../../Resource/029_view4.png)

Această scriere este potrivită pentru afișarea unui conținut fix.

De exemplu, după atingerea butonului se poate afișa o pagină de setări, o pagină de instrucțiuni, o pagină de sugestii etc.

### Poziția de afișare a Sheet

Deși `Sheet` este o vizualizare pop-up, în SwiftUI nu este scris direct ca o vizualizare independentă, precum `Text()` sau `Image()`, ci este folosit ca modificator de vizualizare.

Cu alte cuvinte, `.sheet(...)` este asemănător cu modificatori precum `.font()`, `.padding()` și `.shadow()`: trebuie adăugat după o anumită vizualizare.

De exemplu:

```swift
Button("Afișează Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vizualizare Sheet")
}
```

În acest exemplu, `.sheet` este adăugat după `Button`.

Când `showSheet` devine `true`, SwiftUI va afișa `Sheet` și va arăta conținutul dintre acolade:

```swift
Text("Vizualizare Sheet")
```

Totuși, în dezvoltarea reală, dacă o pagină are mai multe butoane, de obicei nu adăugăm câte un `.sheet` pentru fiecare buton.

O practică mai obișnuită este să adăugăm `.sheet` după vizualizarea exterioară.

De exemplu:

```swift
VStack {
    Button("Afișează Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Vizualizare Sheet")
}
```

Butonul este responsabil pentru modificarea lui `showSheet`, iar vizualizarea exterioară este responsabilă pentru afișarea lui `Sheet` în funcție de faptul că `showSheet` este `true`.

## Legarea Sheet la o valoare opțională

Scrierea pe care am învățat-o mai înainte este:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vizualizare Sheet")
}
```

Această scriere este potrivită pentru controlarea afișării și ascunderii unei pagini fixe.

Însă în exemplul enciclopediei animalelor, nu trebuie doar să știm „dacă se afișează `Sheet`”, ci și „care animal a fost atins”.

De exemplu:

Dacă utilizatorul atinge delfinul, în `Sheet` ar trebui să se afișeze detaliile delfinului.

Dacă utilizatorul atinge panda, în `Sheet` ar trebui să se afișeze detaliile panda.

De aceea, aici este mai potrivită o altă scriere pentru Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Conținutul afișat în Sheet
}
```

În acest cod, `Sheet` este legat la o valoare opțională `selectedAnimal`.

Aici trebuie observat că după `item:` scriem `$selectedAnimal`, nu `selectedAnimal`.

Deoarece `Sheet` nu doar citește valoarea lui `selectedAnimal`, ci trebuie să decidă dacă se afișează în funcție de schimbarea acesteia.

Acest cod poate fi înțeles astfel:

- Când `selectedAnimal` este `nil`, nu se afișează `Sheet`.
- Când `selectedAnimal` are o valoare, se afișează `Sheet`.
- Când `Sheet` este închis, SwiftUI va schimba din nou `selectedAnimal` în `nil`.

SwiftUI va transmite animalul salvat în `selectedAnimal` către `animal` din interiorul acoladelor.

Cu alte cuvinte, `.sheet(item:)` nu controlează doar afișarea, ci transmite și datele selectate în `Sheet`.

## Folosirea Sheet pentru afișarea numelui animalului

Acum nu ne grăbim să creăm o vizualizare de detaliu complexă.

Pentru ca acest cod să fie mai ușor de înțeles, mai întâi afișăm în `Sheet` numele animalului curent.

Adăugăm `.sheet(item:)` în afara lui `VStack`:

```swift
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
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Cea mai importantă parte este acest cod:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Când `selectedAnimal` are o valoare, `Sheet` va apărea.

`animal` din interiorul acoladelor este animalul selectat curent.

Prin urmare:

```swift
Text(animal.name)
```

Va afișa numele animalului atins curent.

De exemplu, dacă atingi `Delfin`, în Sheet se afișează `Delfin`.

Dacă atingi `Panda`, în `Sheet` se afișează `Panda`.

Astfel, am realizat efectul prin care atingerea unor animale diferite afișează nume diferite de animale.

Afișarea numelui animalului:

![view](../../../Resource/029_view5.png)

Totuși, detaliile animalului nu ar trebui să afișeze doar un nume, ci și numele, aria de distribuție, habitatul și descrierea.

Dacă scriem tot acest cod în interiorul lui `.sheet`, codul va deveni foarte lung și greu de citit.

De aceea, în continuare vom crea o nouă vizualizare personalizată, responsabilă special pentru afișarea detaliilor animalului.

## Crearea vizualizării de detaliu a animalului

În continuare, creăm o nouă vizualizare personalizată `AnimalDetailView`.

Această vizualizare primește un `Animal` și afișează detaliile animalului.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Arie de distribuție**: \(animal.distributionArea)")

                    Divider()

                    Text("**Habitat**: \(animal.habitat)")

                    Divider()

                    Text("**Descrierea animalului**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Rezultatul afișat:

![view](../../../Resource/029_view2.png)

Aici punctul important este:

```swift
var animal: Animal
```

Aceasta înseamnă că `AnimalDetailView` trebuie să primească un animal din exterior.

După ce primește animalul, vizualizarea de detaliu poate folosi diferitele informații ale acestui animal:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Cu alte cuvinte, `AnimalDetailView` este responsabil doar pentru afișarea animalului transmis.

### Text îngroșat cu Markdown

În vizualizarea de detaliu, am scris acest cod:

```swift
Text("**Habitat:** \(animal.habitat)")
```

Aici există două puncte de învățat.

Primul: `**Habitat:**` folosește sintaxa `Markdown`. Textul încadrat de două asteriscuri va fi afișat îngroșat.

Al doilea: `\()` este interpolare de șiruri și poate afișa valoarea unei variabile în text.

Acest cod înseamnă că mai întâi se afișează `Habitat:` îngroșat, apoi se afișează habitatul acestui animal.

## Afișarea vizualizării de detaliu în Sheet

După ce creăm `AnimalDetailView`, putem reveni la `ContentView` și putem înlocui vizualizarea inițială cu numele din `Sheet` cu vizualizarea de detaliu.

Inițial era:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Acum o schimbăm în:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Aici, `animal:` este numele parametrului din `AnimalDetailView`.

`animal` de după acesta este animalul curent transmis de `.sheet(item:)`.

Adică transmitem animalul atins curent către `AnimalDetailView` pentru afișare.

Structura completă:

```swift
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
```

Când utilizatorul atinge un animal:

```swift
selectedAnimal = animal
```

`selectedAnimal` se schimbă din `nil` într-un animal concret, iar după ce `Sheet` detectează că `selectedAnimal` are o valoare, afișează vizualizarea.

`Sheet` transmite animalul din `selectedAnimal` către vizualizarea `AnimalDetailView`, iar `AnimalDetailView` afișează detaliile animalului.

Astfel, am realizat funcția prin care atingerea unui animal din listă afișează detaliile corespunzătoare.

## Diferența dintre cele două scrieri ale Sheet

Acum am folosit `.sheet(item:)` pentru a finaliza afișarea vizualizării de detaliu a animalului.

Aici putem rezuma pe scurt cele două scrieri obișnuite ale lui `Sheet`.

### Prima metodă: legarea la o valoare booleană

```swift
@State private var showSheet = false

Button("Afișează Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vizualizare Sheet")
}
```

Această scriere este potrivită pentru afișarea unui conținut fix, cum ar fi o pagină de setări, o pagină de instrucțiuni sau o pagină de sugestii.

`showSheet` este o valoare booleană și are doar două stări: `true` și `false`.

Când `showSheet` este `true`, `Sheet` se afișează.

Când `showSheet` este `false`, `Sheet` nu se afișează.

### A doua metodă: legarea la o valoare opțională

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Această scriere este potrivită pentru afișarea unui conținut diferit în funcție de datele selectate.

În această lecție, atingem animale diferite și trebuie să afișăm detalii diferite, deci folosirea lui `.sheet(item:)` este mai potrivită.

## Cod complet

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Numele animalului
    let name: String
    
    // Imaginea animalului
    let imageName: String
    
    // Emoji-ul animalului
    let avatarEmoji: String
    
    // Aria de distribuție
    let distributionArea: String
    
    // Habitatul
    let habitat: String
    
    // Descrierea animalului
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceane calde și temperate din întreaga lume.",
            habitat: "Oceane, ape de coastă și unele râuri mari.",
            animalDescription: "Delfinii sunt mamifere marine inteligente. Trăiesc în grupuri, comunică prin sunete și sunt cunoscuți pentru comportamentul lor jucăuș."
        ),
        // Girafă
        Animal(
            name: "Girafă",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane și păduri deschise din Africa.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Girafele sunt cele mai înalte animale terestre. Au gâturi lungi, picioare lungi și de obicei se hrănesc cu frunze din copaci înalți."
        ),
        // Leu
        Animal(
            name: "Leu",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Se găsesc în principal în Africa subsahariană, cu o mică populație în vestul Indiei.",
            habitat: "Pajiști, savane și păduri deschise.",
            animalDescription: "Leii sunt feline mari și puternice. De obicei trăiesc în grupuri numite haite și sunt adesea cunoscuți drept regii lumii animale."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Păduri montane din centrul Chinei.",
            habitat: "Păduri de bambus din zone montane răcoroase și umede.",
            animalDescription: "Urșii panda sunt cunoscuți pentru blana lor alb-negru. Se hrănesc în principal cu bambus și sunt printre cele mai ușor de recunoscut animale din lume."
        ),
        // Urs polar
        Animal(
            name: "Urs polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiunile arctice din jurul Polului Nord.",
            habitat: "Gheață marină, zone de coastă și medii arctice reci.",
            animalDescription: "Urșii polari sunt urși mari adaptați mediilor reci. Sunt înotători puternici și depind în principal de gheața marină pentru a vâna foci."
        )
    ]
    
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Arie de distribuție**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Descrierea animalului**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Rezumat

În această lecție am finalizat o pagină simplă de enciclopedie a animalelor.

Mai întâi folosim structura `Animal` pentru a salva informațiile animalelor, apoi folosim un tablou pentru a salva cinci animale și folosim `ForEach` pentru a afișa lista de animale.

Când utilizatorul atinge un animal, salvăm acel animal în `selectedAnimal`:

```swift
selectedAnimal = animal
```

Când `selectedAnimal` are o valoare, `.sheet(item:)` afișează vizualizarea de detaliu și transmite animalul selectat către `AnimalDetailView`.

Cel mai important lucru în această lecție nu este stilul interfeței, ci înțelegerea acestui traseu de transmitere a datelor:

```swift
Atinge animalul → selectedAnimal salvează animalul → Sheet apare → AnimalDetailView afișează detaliile
```

După ce înțelegi acest traseu, vei putea crea mai târziu mai multe funcții similare, cum ar fi detalii de produs, detalii de curs, detalii de articol sau detalii de contact.
