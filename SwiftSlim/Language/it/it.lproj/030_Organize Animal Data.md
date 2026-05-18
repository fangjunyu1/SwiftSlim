# Organizzare i dati degli animali

Nella lezione precedente, abbiamo completato un semplice caso di enciclopedia degli animali.

![view](../../../Resource/029_view.png)

Quando l'utente tocca un animale, la pagina mostra i dettagli dell'animale tramite uno `Sheet`.

Tuttavia, nel codice della lezione precedente c'è un problema: i dati degli animali sono stati scritti direttamente dentro `ContentView`.

Per esempio:

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
            // Mostra l'elenco degli animali
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Questo codice può essere eseguito normalmente, ma quando i dati degli animali diventano sempre più numerosi, `ContentView` diventerà molto lungo.

`ContentView` dovrebbe essere responsabile principalmente della visualizzazione dell'interfaccia, ma ora conserva anche una grande quantità di dati sugli animali. Questo rende il codice più difficile da leggere e meno comodo da mantenere in seguito.

Quindi, in questa lezione dobbiamo fare una cosa:

spostare i dati degli animali fuori da `ContentView`.

## Perché separare i dati?

In SwiftUI, il codice delle viste di solito è responsabile della visualizzazione dell'interfaccia.

Per esempio:

```swift
Text("Dolphin")
Image("dolphin")
```

Questi codici sono tutti legati alla visualizzazione dell'interfaccia.

I dati degli animali in sé, per esempio il nome dell'animale, il nome dell'immagine, l'area di distribuzione, l'habitat e il testo descrittivo, non sono la struttura dell'interfaccia.

Sono più simili a un insieme di informazioni fisse:

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

Se scriviamo insieme tutto il codice dell'interfaccia e il codice dei dati, il codice diventerà sempre più disordinato.

Quindi possiamo mettere i dati degli animali nel tipo `Animal`.

## Usare static per salvare dati fissi

Prima guardiamo la scrittura dopo l'organizzazione:

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

Qui è stata aggiunta una riga di codice:

```swift
static let animals: [Animal] = [
    
]
```

`static` indica una proprietà statica.

Una proprietà statica appartiene al tipo stesso, non a una specifica istanza concreta.

Questa frase è piuttosto astratta; possiamo capirla con un esempio semplice.

## Proprietà normali e proprietà statiche

Per esempio, definiamo uno `Student`:

```swift
struct Student {
    let name: String
}
```

Qui `name` è una proprietà normale. Una proprietà normale appartiene a una specifica istanza concreta.

Se vogliamo accedere a `name`, dobbiamo prima creare uno studente concreto:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Qui `student` è un'istanza. Per il momento, possiamo anche capirlo come una specifica porzione di dati di uno studente.

Poiché il nome di ogni studente può essere diverso, `name` deve trovarsi su uno studente concreto.

Tuttavia, alcuni dati non appartengono a una specifica istanza concreta.

Per esempio, vogliamo preparare un insieme di dati di esempio per l'anteprima:

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

Qui `previewStudents` ha davanti `static`, quindi è una proprietà statica.

Una proprietà statica non appartiene a un singolo studente, ma al tipo `Student` stesso.

Quindi non dobbiamo prima creare un certo studente; possiamo accedervi direttamente tramite il nome del tipo:

```swift
print(Student.previewStudents.count)    // 3
```

Il modo di accesso qui è:

```swift
NomeTipo.nomeProprietàStatica
```

cioè:

```swift
Student.previewStudents
```

Allo stesso modo, nell'enciclopedia degli animali possiamo accedere ai dati degli animali così:

```swift
Animal.animals
```

## Tornare a ContentView

Ora, i dati degli animali sono già stati salvati nel tipo `Animal`.

Quindi dentro `ContentView` non serve più scrivere un lungo array di animali.

Possiamo modificarlo così:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Mostra l'elenco degli animali
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Questa riga di codice significa:

```swift
let animals = Animal.animals
```

Prendere dal tipo `Animal` il gruppo di dati `animals`, e poi salvarlo nella costante `animals` della vista corrente.

Dopo questa modifica, `ContentView` sarà più conciso.

`ContentView` è responsabile della visualizzazione dell'interfaccia, mentre `Animal.animals` è responsabile di fornire i dati degli animali.

## Spostare Animal in un file separato

Nella lezione precedente, per rendere il caso più facile da capire, abbiamo scritto `Animal` e `ContentView` nello stesso file.

Poiché allora il codice era ancora poco, scrivere così non era un problema.

Ma ora i dati degli animali sono sempre più numerosi. Se continuiamo a scrivere tutto il codice dentro `ContentView.swift`, il file diventerà molto lungo e sarà anche poco comodo da leggere.

Quindi possiamo mettere `Animal` separatamente in un nuovo file Swift.

In Xcode, possiamo creare un nuovo file Swift, per esempio:

```swift
Animal.swift
```

Poi spostiamo la struttura `Animal` in questo file:

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

Dopo questa organizzazione:

`ContentView.swift` è responsabile della visualizzazione dell'interfaccia.

`Animal.swift` è responsabile della descrizione della struttura dei dati degli animali.

Anche se si trovano in file diversi, finché sono nello stesso progetto, `ContentView` può comunque usare direttamente `Animal`.

Per esempio:

```swift
let animals = Animal.animals
```

Qui non serve importare ulteriormente `Animal.swift` dentro `ContentView.swift`.

Swift riconosce automaticamente i file Swift nello stesso progetto.

## Usare extension per continuare a organizzare il codice

Ora abbiamo già spostato i dati degli animali da `ContentView` dentro `Animal`.

Tuttavia, nella struttura `Animal` ci sono ancora due tipi di codice insieme:

Il primo tipo sono le proprietà del modello animale stesso:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Il secondo tipo sono i dati fissi degli animali:

```swift
static let animals: [Animal] = [
    // ...
]
```

Per rendere la struttura del codice più chiara, possiamo usare `extension` per separare queste due parti.

`extension` significa estensione.

Può aggiungere nuovo codice sulla base di un tipo esistente.

Per esempio:

```swift
extension Animal {
    
}
```

Questo significa che stiamo estendendo il tipo `Animal`.

## Mettere i dati degli animali in extension

Possiamo modificare `Animal` così:

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

Dopo questa organizzazione, la struttura del codice sarà più chiara.

`struct Animal` è responsabile di descrivere quali proprietà dovrebbe avere un animale.

`extension Animal` è responsabile di salvare un insieme di dati fissi degli animali.

Nota che, anche se `animals` è stato spostato in `extension Animal`, il modo di usarlo non cambia.

Possiamo ancora usarlo così:

```swift
let animals = Animal.animals
```

Questa è anche una caratteristica di `extension`: aiuta solo a organizzare il codice e non cambia il modo in cui viene chiamato dall'esterno.

## Quando i dati sono molti, si può creare anche un file AnimalData

Ora abbiamo già messo `Animal` in un file `Animal.swift` separato.

Se i dati degli animali sono pochi, possiamo scrivere direttamente anche `extension Animal` dentro `Animal.swift`.

Ma se i dati degli animali diventano sempre più numerosi, possiamo anche creare un altro file, per esempio:

```swift
AnimalData.swift
```

Poi inseriamo i dati fissi degli animali:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Dati degli animali
    ]
}
```

Dopo averlo fatto, la divisione delle responsabilità del codice sarà più chiara:

`Animal.swift` è responsabile solo della definizione del modello animale.

`AnimalData.swift` è responsabile solo del salvataggio dei dati degli animali.

`ContentView.swift` è responsabile solo della visualizzazione dell'interfaccia.

Le responsabilità di ogni file sono più chiare.

Nota che `AnimalData.swift` è solo il nome del file, non un nuovo tipo Swift. In questo file si continua comunque a usare `extension Animal` per aggiungere dati fissi ad `Animal`.

## Codice completo

Di seguito trovi il codice `Animal.swift` dopo l'organizzazione:

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

Codice `AnimalData.swift` dopo l'organizzazione:

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

In `ContentView.swift`, possiamo usarlo così:

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

Suggerimento: nei file `Animal.swift` e `AnimalData.swift`, la prima riga è:

```swift
import Foundation
```

Prima, quando scrivevamo interfacce SwiftUI, usavamo spesso:

```swift
import SwiftUI
```

Questo perché `ContentView`, `Text`, `Button`, `Color` e questi elementi sono tutti legati all'interfaccia, quindi quando si scrive un file di interfaccia di solito bisogna importare SwiftUI.

Ma qui `Animal.swift` e `AnimalData.swift` non sono file di interfaccia. Sono usati principalmente per definire il modello animale e salvare i dati degli animali.

In questo codice, `UUID()` richiede l'uso di `Foundation`, quindi basta importare `Foundation`.

## Riepilogo

In questa lezione abbiamo fatto principalmente una cosa: abbiamo spostato i dati degli animali fuori da `ContentView`.

La scrittura originale consisteva nel mettere direttamente i dati degli animali dentro `ContentView`. Così il codice può funzionare, ma quando i dati aumentano, il file della vista diventerà sempre più lungo.

Dopo l'organizzazione, `ContentView` è responsabile solo della visualizzazione dell'interfaccia, mentre `Animal.animals` è responsabile di fornire i dati degli animali.

In questa lezione abbiamo anche imparato due nuove conoscenze.

La prima è `static`.

`static` indica una proprietà statica. Una proprietà statica appartiene al tipo stesso e può essere accessibile direttamente tramite il formato “NomeTipo.nomeProprietà”.

Per esempio:

```swift
Animal.animals
```

La seconda è `extension`.

`extension` indica un'estensione. Può dividere il codice dello stesso tipo in parti separate, rendendo la struttura del codice più chiara.

In questo caso, abbiamo usato `extension Animal` per salvare i dati degli animali, rendendo la struttura `Animal` stessa più concisa.

Inoltre, `Animal` salva principalmente un modello di dati e non scrive direttamente interfacce SwiftUI, quindi qui si usa `import Foundation`.

Il punto di questa lezione non è rendere il codice più complesso, ma rendere il codice più facile da leggere e mantenere.
