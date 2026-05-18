# Uspořádání dat o zvířatech

V minulé lekci jsme dokončili jednoduchý příklad zvířecí encyklopedie.

![view](../../../Resource/029_view.png)

Když uživatel klepne na určité zvíře, stránka zobrazí detail zvířete pomocí `Sheet`.

V kódu z minulé lekce je však jeden problém: data o zvířatech jsou napsána přímo uvnitř `ContentView`.

Například:

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
            // Zobrazit seznam zvířat
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tento kód může normálně fungovat, ale když bude dat o zvířatech stále více, `ContentView` se velmi prodlouží.

`ContentView` by měl původně hlavně odpovídat za zobrazení rozhraní, ale nyní navíc uchovává velké množství dat o zvířatech. To zhoršuje čitelnost kódu a také komplikuje pozdější údržbu.

Proto v této lekci uděláme jednu věc:

přesuneme data o zvířatech pryč z `ContentView`.

## Proč oddělovat data?

Ve SwiftUI je kód pohledu obvykle zodpovědný za zobrazení rozhraní.

Například:

```swift
Text("Dolphin")
Image("dolphin")
```

Tento kód souvisí se zobrazením rozhraní.

Samotná data o zvířatech, například název zvířete, název obrázku, oblast výskytu, prostředí a popis, ale nejsou strukturou rozhraní.

Spíše se podobají skupině pevných údajů:

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

Pokud zapíšeme kód rozhraní a datový kód společně, kód bude stále nepřehlednější.

Proto můžeme data o zvířatech uložit do typu `Animal`.

## Použití static k uložení pevných dat

Nejprve se podívejme na upravený zápis:

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

Zde přibyl jeden řádek kódu:

```swift
static let animals: [Animal] = [
    
]
```

`static` označuje statickou vlastnost.

Statická vlastnost patří samotnému typu, nepatří žádné konkrétní instanci.

Tato věta je trochu abstraktní, proto ji můžeme pochopit na jednoduchém příkladu.

## Běžné vlastnosti a statické vlastnosti

Například definujeme `Student`:

```swift
struct Student {
    let name: String
}
```

Zde je `name` běžná vlastnost. Běžná vlastnost patří určité konkrétní instanci.

Pokud chceme přistoupit k `name`, musíme nejprve vytvořit konkrétního studenta:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Zde je `student` instance. Pro začátek ji můžeme chápat jako jednu konkrétní sadu dat o studentovi.

Protože jméno každého studenta může být jiné, musí být `name` uloženo u konkrétního studenta.

Některá data ale nepatří žádné konkrétní instanci.

Například chceme připravit skupinu ukázkových dat pro náhled:

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

Před `previewStudents` je zde `static`, takže jde o statickou vlastnost.

Statická vlastnost nepatří jednomu konkrétnímu studentovi, ale samotnému typu `Student`.

Proto nemusíme nejprve vytvářet konkrétního studenta a můžeme k ní přistoupit přímo přes název typu:

```swift
print(Student.previewStudents.count)    // 3
```

Způsob přístupu je zde:

```swift
NázevTypu.názevStatickéVlastnosti
```

Tedy:

```swift
Student.previewStudents
```

Stejně tak můžeme ve zvířecí encyklopedii přistupovat k datům o zvířatech takto:

```swift
Animal.animals
```

## Zpět k ContentView

Nyní jsou data o zvířatech uložena v typu `Animal`.

Proto už nemusíme do `ContentView` psát velmi dlouhé pole zvířat.

Můžeme to změnit takto:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Zobrazit seznam zvířat
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Tento řádek kódu znamená:

```swift
let animals = Animal.animals
```

Z typu `Animal` vezmeme skupinu dat o zvířatech `animals` a uložíme ji do konstanty `animals` v aktuálním pohledu.

Po této úpravě bude `ContentView` stručnější.

`ContentView` odpovídá za zobrazení rozhraní a `Animal.animals` odpovídá za poskytování dat o zvířatech.

## Rozdělení Animal do samostatného souboru

V minulé lekci jsme kvůli snazšímu pochopení příkladu napsali `Animal` a `ContentView` do stejného souboru.

Protože tehdy bylo kódu ještě málo, nebyl s tím problém.

Nyní však dat o zvířatech přibývá. Pokud bychom nadále psali veškerý kód do `ContentView.swift`, soubor by se prodloužil a hůře by se četl.

Proto můžeme `Animal` samostatně přesunout do nového souboru Swift.

V Xcode můžeme vytvořit nový soubor Swift, například:

```swift
Animal.swift
```

Potom přesuneme strukturu `Animal` do tohoto souboru:

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

Po takovém uspořádání:

`ContentView.swift` odpovídá za zobrazení rozhraní.

`Animal.swift` odpovídá za popis struktury dat o zvířeti.

I když jsou umístěny v různých souborech, pokud jsou ve stejném projektu, `ContentView` může stále přímo používat `Animal`.

Například:

```swift
let animals = Animal.animals
```

Zde není nutné v `ContentView.swift` navíc importovat `Animal.swift`.

Swift automaticky rozpozná soubory Swift ve stejném projektu.

## Použití extension k dalšímu uspořádání kódu

Nyní jsme již přesunuli data o zvířatech z `ContentView` do `Animal`.

Ve struktuře `Animal` jsou však stále současně dvě skupiny kódu:

První skupinou jsou vlastnosti samotného modelu zvířete:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Druhou skupinou jsou pevná data o zvířatech:

```swift
static let animals: [Animal] = [
    // ...
]
```

Aby byla struktura kódu jasnější, můžeme tyto dvě části oddělit pomocí `extension`.

`extension` znamená rozšíření.

Umožňuje na základě existujícího typu dále přidávat nový kód.

Například:

```swift
extension Animal {
    
}
```

To znamená, že rozšiřujeme typ `Animal`.

## Umístění dat o zvířatech do extension

`Animal` můžeme upravit takto:

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

Po takovém uspořádání bude struktura kódu jasnější.

`struct Animal` odpovídá za popis toho, jaké vlastnosti by jedno zvíře mělo mít.

`extension Animal` odpovídá za uložení jedné skupiny pevných dat o zvířatech.

Všimněte si, že i když bylo `animals` přesunuto do `extension Animal`, způsob použití se nemění.

Stále jej můžeme používat takto:

```swift
let animals = Animal.animals
```

To je také jedna z vlastností `extension`: pouze nám pomáhá uspořádat kód a nemění způsob volání zvenčí.

## Když je dat více, můžeme znovu vytvořit soubor AnimalData

Nyní jsme již `Animal` umístili do samostatného souboru `Animal.swift`.

Pokud je dat o zvířatech málo, můžeme `extension Animal` napsat přímo také do `Animal.swift`.

Pokud však bude dat o zvířatech stále více, můžeme vytvořit další soubor, například:

```swift
AnimalData.swift
```

Potom do něj vložíme pevná data o zvířatech:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Data o zvířatech
    ]
}
```

Po této úpravě bude rozdělení odpovědností v kódu jasnější:

`Animal.swift` odpovídá pouze za definici modelu zvířete.

`AnimalData.swift` odpovídá pouze za uložení dat o zvířatech.

`ContentView.swift` odpovídá pouze za zobrazení rozhraní.

Odpovědnost každého souboru bude jasnější.

Všimněte si, že `AnimalData.swift` je pouze název souboru, ne nový typ Swift. V tomto souboru stále používáme `extension Animal` k přidání pevných dat do `Animal`.

## Kompletní kód

Níže je uspořádaný kód `Animal.swift`:

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

Uspořádaný kód `AnimalData.swift`:

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

V `ContentView.swift` jej můžeme používat takto:

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

Tip: V souborech `Animal.swift` a `AnimalData.swift` je na prvním řádku napsáno:

```swift
import Foundation
```

Když jsme dříve psali rozhraní SwiftUI, často jsme používali:

```swift
import SwiftUI
```

Je to proto, že `ContentView`, `Text`, `Button`, `Color` a tyto další části souvisejí s rozhraním, takže při psaní souboru rozhraní obvykle potřebujeme importovat SwiftUI.

Zde ale `Animal.swift` a `AnimalData.swift` nejsou soubory rozhraní. Slouží hlavně k definici modelu zvířete a uložení dat o zvířatech.

V tomto kódu `UUID()` vyžaduje `Foundation`, takže stačí importovat `Foundation`.

## Shrnutí

V této lekci jsme hlavně udělali jednu věc: přesunuli jsme data o zvířatech pryč z `ContentView`.

Původní zápis ukládal data o zvířatech přímo do `ContentView`. Tento kód může fungovat, ale když dat přibude, soubor pohledu se bude stále prodlužovat.

Po uspořádání `ContentView` odpovídá pouze za zobrazení rozhraní a `Animal.animals` odpovídá za poskytování dat o zvířatech.

V této lekci jsme se také naučili dva nové poznatky.

První je `static`.

`static` označuje statickou vlastnost. Statická vlastnost patří samotnému typu a lze k ní přistupovat přímo způsobem „název typu.název vlastnosti“.

Například:

```swift
Animal.animals
```

Druhý je `extension`.

`extension` znamená rozšíření. Umožňuje rozdělit kód stejného typu na více částí, aby byla struktura kódu jasnější.

V tomto příkladu používáme `extension Animal` k uložení dat o zvířatech, takže samotná struktura `Animal` je stručnější.

Kromě toho `Animal` hlavně ukládá datový model a nepíše přímo rozhraní SwiftUI, proto zde používáme `import Foundation`.

Těžištěm této lekce není udělat kód složitější, ale udělat jej čitelnější a snáze udržovatelný.
