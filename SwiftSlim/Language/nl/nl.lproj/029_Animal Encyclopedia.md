# Dierenencyclopedie 

In deze les blijven we oefenen met aangepaste views en gegevensoverdracht.

We gaan een eenvoudige dierenencyclopedie-view maken. Op de pagina worden vijf dieren weergegeven. Wanneer je op een dier tikt, verschijnt er een detailview met de afbeelding, het verspreidingsgebied, de leefomgeving en de beschrijving van dat dier.

Resultaat:

![view](../../../Resource/029_view.png)

Met dit voorbeeld kunnen we oefenen hoe gegevensstructuren, lijstweergave, klikinteractie en een Sheet-pop-upview samenwerken.

## Afbeeldingsmateriaal voorbereiden

Eerst moeten we vijf dierenafbeeldingen voorbereiden:

- Dolfijn: `dolphin.jpg`
- Giraffe: `giraffe.jpg`
- Leeuw: `lion.jpg`
- Panda: `panda.jpg`
- IJsbeer: `polarBear.jpg`

Je kunt de volgende afbeeldingen gebruiken:

[Dolfijn](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraffe](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Leeuw](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [IJsbeer](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Nadat je de afbeeldingen hebt gedownload, sleep je ze naar de map `Assets` van het Xcode-project.

![assets](../../../Resource/029_assets.png)

Let erop dat je bij het gebruiken van afbeeldingen in code meestal geen `.jpg`-achtervoegsel hoeft te schrijven.

Als de naam van de afbeeldingsbron bijvoorbeeld `dolphin` is, schrijf je in de code:

```swift
Image("dolphin")
```

Als de afbeeldingsnaam verkeerd is geschreven, kan de afbeelding niet normaal worden weergegeven.

Opmerking: de bovenstaande afbeeldingen komen uit Wikimedia-projecten. Het is aan te raden om bij gebruik de originele afbeeldingslinks en broninformatie te behouden.

## De dierenstructuur maken

Op deze pagina heeft elk dier meerdere gegevens:

- Diernaam
- Dierafbeelding
- Dierenemoji
- Verspreidingsgebied
- Leefomgeving
- Dierbeschrijving

Als we deze gegevens verspreiden over veel losse variabelen, wordt de code vrij rommelig. Daarom kunnen we een `Animal`-structuur maken en de informatie van één dier bij elkaar plaatsen.

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

In deze code:

- `id`: de unieke identificatie van het dier.
- `name`: de diernaam.
- `imageName`: de naam van de dierafbeelding.
- `avatarEmoji`: de dierenemoji.
- `distributionArea`: het verspreidingsgebied.
- `habitat`: de leefomgeving.
- `animalDescription`: de dierbeschrijving.

Daarin:

```swift
let id = UUID()
```

`id` wordt gebruikt om elk dier te identificeren. Omdat we later `ForEach` gebruiken om de dierenlijst weer te geven en ook `.sheet(item:)` gebruiken om op basis van het geselecteerde dier een detailview te tonen, moet `Animal` voldoen aan het `Identifiable`-protocol.

De functie van `Identifiable` is SwiftUI vertellen: elk dier heeft een `id` waarmee zijn identiteit kan worden onderscheiden.

## Diergegevens maken

Vervolgens maken we in `ContentView` een dierenarray.

De array bevat vijf `Animal`-waarden, waarbij elke `Animal` één dier vertegenwoordigt.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dolfijn
        Animal(
            name: "Dolfijn",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warme en gematigde oceanen over de hele wereld.",
            habitat: "Oceanen, kustwateren en enkele grote rivieren.",
            animalDescription: "Dolfijnen zijn intelligente zeezoogdieren. Ze leven in groepen, communiceren met geluiden en staan bekend om hun speelse gedrag."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannes en open bosgebieden in Afrika.",
            habitat: "Graslanden, savannes en open bossen.",
            animalDescription: "Giraffen zijn de hoogste landdieren. Ze hebben lange nekken, lange poten en eten meestal bladeren van hoge bomen."
        ),
        // Leeuw
        Animal(
            name: "Leeuw",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vooral te vinden in Afrika ten zuiden van de Sahara, met een kleine populatie in West-India.",
            habitat: "Graslanden, savannes en open bosgebieden.",
            animalDescription: "Leeuwen zijn krachtige grote katachtigen. Ze leven meestal in groepen die troepen worden genoemd en staan vaak bekend als de koningen van de dierenwereld."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergbossen in centraal China.",
            habitat: "Bamboebossen in koele en vochtige berggebieden.",
            animalDescription: "Panda's zijn beren die bekendstaan om hun zwart-witte vacht. Ze eten vooral bamboe en behoren tot de meest herkenbare dieren ter wereld."
        ),
        // IJsbeer
        Animal(
            name: "IJsbeer",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctische gebieden rond de Noordpool.",
            habitat: "Zee-ijs, kustgebieden en koude Arctische omgevingen.",
            animalDescription: "IJsberen zijn grote beren die zijn aangepast aan koude omgevingen. Ze zijn sterke zwemmers en zijn vooral afhankelijk van zee-ijs om op zeehonden te jagen."
        )
    ]

    var body: some View {
        Text("Dierenencyclopedie")
    }
}
```

Hier is `animals` een array:

```swift
let animals: [Animal]
```

`[Animal]` betekent dat deze array meerdere `Animal`-waarden bevat.

Met andere woorden: `animals` is niet één dier, maar een groep dieren.

## De dierenlijst weergeven

Nu kunnen we `ForEach` gebruiken om de dierenlijst weer te geven.

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

Resultaat:

![view](../../../Resource/029_view1.png)

In deze code:

```swift
ForEach(animals) { animal in
    ...
}
```

betekent dat we door de array `animals` lopen.

Bij elke herhaling staat `animal` voor het dier dat op dat moment wordt weergegeven.

Bijvoorbeeld: bij de eerste herhaling is `animal` de dolfijn; bij de tweede herhaling is `animal` de giraffe.

Daarom kunnen we de gegevens van het huidige dier op de volgende manier weergeven:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Zo kunnen we de vijf dieren weergeven.

## De dierenlijst klikbaar maken

De lijst wordt nu al weergegeven, maar je kunt er nog niet op klikken.

Als we na het tikken op een dier de details willen tonen, moeten we eerst het “momenteel geselecteerde dier” opslaan.

Daarom voegen we in `ContentView` een statusvariabele toe:

```swift
@State private var selectedAnimal: Animal? = nil
```

Hier is `selectedAnimal` een optioneel waardetype `Animal?`.

Dit betekent dat het een dier kan bevatten, maar ook geen dier kan bevatten.

De standaardwaarde is `nil`, wat betekent dat er in het begin geen dier is geselecteerd.

Daarna veranderen we elke dierenrij in een `Button`:

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

Het belangrijkste is deze regel code:

```swift
selectedAnimal = animal
```

Wanneer de gebruiker op een dier tikt, slaan we dat dier op in `selectedAnimal`.

Als de gebruiker bijvoorbeeld op de dolfijn tikt, bewaart `selectedAnimal` de dolfijn.

Als de gebruiker op de panda tikt, bewaart `selectedAnimal` de panda.

Met andere woorden: `selectedAnimal` wordt gebruikt om bij te houden op welk dier de gebruiker momenteel heeft getikt.

## Sheet-pop-upview

Nu kunnen we via de knop al het “momenteel aangeklikte dier” vastleggen.

Vervolgens moeten we een pop-upview maken om de dierdetails weer te geven.

![view](../../../Resource/029_view2.png)

In SwiftUI kun je `Sheet` gebruiken om dit soort pop-upeffect te maken.

Je kunt `Sheet` zien als een tijdelijk weergegeven pagina. Deze wordt boven de huidige pagina getoond en de gebruiker kan de pagina na het bekijken omlaag vegen om hem te sluiten.

## Sheet-voorbeeld

Voordat we echte dierdetails weergeven, gebruiken we eerst een eenvoudig voorbeeld om te begrijpen hoe `Sheet` verschijnt.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet tonen")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet-view")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Resultaat:

![view](../../../Resource/029_view3.png)

In deze code maken we een Booleaanse waarde:

```swift
@State private var showSheet = false
```

`showSheet` is standaard `false`, wat betekent dat `Sheet` in het begin niet wordt weergegeven.

Wanneer je op de knop tikt:

```swift
showSheet.toggle()
```

betekent `toggle()` dat de Booleaanse waarde wordt omgeschakeld.

Als de oorspronkelijke waarde `false` was, wordt deze na het aanroepen van `toggle()` `true`.

Als de oorspronkelijke waarde `true` was, wordt deze na het aanroepen van `toggle()` `false`.

Dus nadat je op de knop tikt, verandert `showSheet` van `false` naar `true`.

Wanneer `showSheet` `true` wordt, toont de volgende code een `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Deze code betekent: wanneer `showSheet` `true` is, wordt er een `Sheet` getoond en wordt in de `Sheet` `Text("Sheet-view")` weergegeven.

Resultaat:

![view](../../../Resource/029_view4.png)

Deze schrijfwijze is geschikt voor het tonen van vaste inhoud.

Bijvoorbeeld: na het tikken op een knop een instellingenpagina, uitlegpagina, meldingpagina enzovoort tonen.

### Waar Sheet wordt geplaatst

Hoewel `Sheet` een pop-upview is, schrijf je deze in SwiftUI niet rechtstreeks als een zelfstandige view zoals `Text()` of `Image()`, maar gebruik je hem als een view modifier.

Met andere woorden: `.sheet(...)` lijkt op modifiers zoals `.font()`, `.padding()` en `.shadow()`; ze moeten allemaal achter een bepaalde view worden toegevoegd.

Bijvoorbeeld:

```swift
Button("Sheet tonen") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

In dit voorbeeld wordt `.sheet` achter `Button` toegevoegd.

Wanneer `showSheet` `true` wordt, toont SwiftUI de `Sheet` en wordt de inhoud binnen de accolades weergegeven:

```swift
Text("Sheet-view")
```

In echte ontwikkeling voeg je echter meestal niet aan elke knop een `.sheet` toe wanneer er meerdere knoppen op één pagina staan.

Een gebruikelijkere aanpak is: voeg `.sheet` toe achter de buitenste view.

Bijvoorbeeld:

```swift
VStack {
    Button("Sheet tonen") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

De knop is verantwoordelijk voor het wijzigen van `showSheet`; de buitenste view is verantwoordelijk voor het tonen van de `Sheet` op basis van de vraag of `showSheet` `true` is.

## Sheet binden aan een optionele waarde

De schrijfwijze die we hiervoor hebben geleerd is:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

Deze schrijfwijze is geschikt om het weergeven en verbergen van één vaste pagina te regelen.

Maar in het voorbeeld van de dierenencyclopedie willen we niet alleen weten “of de `Sheet` wordt getoond”, maar ook “op welk dier is getikt”.

Bijvoorbeeld:

Als de gebruiker op de dolfijn tikt, moet de `Sheet` de details van de dolfijn tonen.

Als de gebruiker op de panda tikt, moet de `Sheet` de details van de panda tonen.

Daarom is hier een andere Sheet-schrijfwijze geschikter:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Inhoud die in de Sheet wordt weergegeven
}
```

In deze code bindt `Sheet` een optionele waarde `selectedAnimal`.

Let hier op: na `item:` schrijf je `$selectedAnimal`, niet `selectedAnimal`.

Dat komt doordat `Sheet` niet alleen de waarde van `selectedAnimal` leest, maar ook op basis van de verandering ervan moet bepalen of hij moet verschijnen.

Je kunt deze code zo begrijpen:

- Wanneer `selectedAnimal` `nil` is, wordt `Sheet` niet weergegeven.
- Wanneer `selectedAnimal` een waarde heeft, wordt `Sheet` weergegeven.
- Wanneer de `Sheet` wordt gesloten, zet SwiftUI `selectedAnimal` weer terug naar `nil`.

SwiftUI geeft het dier dat in `selectedAnimal` is opgeslagen door aan de `animal` binnen de accolades.

Met andere woorden: `.sheet(item:)` regelt niet alleen het verschijnen, maar geeft ook de geselecteerde gegevens door aan de `Sheet`.

## Sheet gebruiken om de diernaam weer te geven

Nu hoeven we nog niet meteen een complexe detailview te maken.

Om de code makkelijker te begrijpen, tonen we eerst in de `Sheet` de naam van het huidige dier.

Voeg buiten de `VStack` `.sheet(item:)` toe:

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

Het belangrijkste is deze code:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Wanneer `selectedAnimal` een waarde heeft, verschijnt de `Sheet`.

De `animal` binnen de accolades is het momenteel geselecteerde dier.

Dus:

```swift
Text(animal.name)
```

geeft de naam van het huidige aangeklikte dier weer.

Als je bijvoorbeeld op `Dolfijn` tikt, wordt in de Sheet `Dolfijn` weergegeven.

Als je op `Panda` tikt, wordt in de `Sheet` `Panda` weergegeven.

Zo hebben we het effect bereikt dat bij het tikken op verschillende dieren verschillende diernamen worden getoond.

Diernaam weergeven:

![view](../../../Resource/029_view5.png)

Maar de dierdetails zouden niet alleen een naam moeten tonen. Ze moeten ook de naam, het verspreidingsgebied, de leefomgeving en de beschrijving tonen.

Als we al deze code in `.sheet` schrijven, wordt de code erg lang en minder goed leesbaar.

Daarom maken we nu een nieuwe aangepaste view die speciaal verantwoordelijk is voor het weergeven van de dierdetails.

## De dierdetailview maken

Vervolgens maken we een nieuwe aangepaste view `AnimalDetailView`.

Deze view ontvangt een `Animal` en toont de dierdetails.

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
                    Text("**Verspreidingsgebied**: \(animal.distributionArea)")

                    Divider()

                    Text("**Leefomgeving**: \(animal.habitat)")

                    Divider()

                    Text("**Dierbeschrijving**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Resultaat:

![view](../../../Resource/029_view2.png)

Het belangrijkste hier is:

```swift
var animal: Animal
```

Dit betekent dat `AnimalDetailView` van buitenaf één dier moet ontvangen.

Nadat het dier is ontvangen, kan de detailview de verschillende gegevens van dit dier gebruiken:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Met andere woorden: `AnimalDetailView` is alleen verantwoordelijk voor het weergeven van het dier dat is doorgegeven.

### Vetgedrukte tekst met Markdown

In de detailview schreven we deze code:

```swift
Text("**Leefomgeving:** \(animal.habitat)")
```

Hier zitten twee kennispunten in.

Ten eerste gebruikt `**Leefomgeving:**` de `Markdown`-syntaxis. Tekst die door twee sterretjes wordt omsloten, wordt vet weergegeven.

Ten tweede is `\()` stringinterpolatie, waarmee je de waarde van een variabele in tekst kunt weergeven.

Deze code betekent dat eerst het vetgedrukte `Leefomgeving:` wordt weergegeven en daarna de leefomgeving van dit dier.

## De detailview in Sheet weergeven

Nadat `AnimalDetailView` is gemaakt, kunnen we teruggaan naar `ContentView` en de oorspronkelijke naamview in `Sheet` vervangen door de detailview.

Oorspronkelijk was het:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nu wijzigen we dit naar:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Hier is `animal:` de parameternaam van `AnimalDetailView`.

De `animal` erachter is het huidige dier dat door `.sheet(item:)` wordt doorgegeven.

Dit betekent dat het momenteel aangeklikte dier wordt doorgegeven aan `AnimalDetailView` om te worden weergegeven.

Volledige structuur:

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

Wanneer de gebruiker op een dier tikt:

```swift
selectedAnimal = animal
```

verandert `selectedAnimal` van `nil` naar een concreet dier. `Sheet` detecteert dat `selectedAnimal` een waarde heeft en toont daarna de view.

`Sheet` geeft het dier in `selectedAnimal` door aan de `AnimalDetailView`-view, en `AnimalDetailView` toont de dierdetails.

Zo hebben we de functie gerealiseerd waarbij je op de dierenlijst tikt en de bijbehorende dierdetails verschijnen.

## Het verschil tussen twee Sheet-schrijfwijzen

Nu hebben we `.sheet(item:)` gebruikt om de dierdetailview weer te geven.

Hier kunnen we kort de twee veelgebruikte schrijfwijzen van `Sheet` samenvatten.

### De eerste is binden aan een Booleaanse waarde

```swift
@State private var showSheet = false

Button("Sheet tonen") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

Deze schrijfwijze is geschikt voor het tonen van vaste inhoud, zoals een instellingenpagina, uitlegpagina, meldingpagina enzovoort.

`showSheet` is een Booleaanse waarde met slechts twee toestanden: `true` en `false`.

Wanneer `showSheet` `true` is, wordt `Sheet` weergegeven.

Wanneer `showSheet` `false` is, wordt `Sheet` niet weergegeven.

### De tweede is binden aan een optionele waarde

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Deze schrijfwijze is geschikt om op basis van geselecteerde gegevens verschillende inhoud te tonen.

In deze les tikken we op verschillende dieren en moeten we verschillende dierdetails weergeven. Daarom is `.sheet(item:)` geschikter.

## Volledige code

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Diernaam
    let name: String
    
    // Dierafbeelding
    let imageName: String
    
    // Dierenemoji
    let avatarEmoji: String
    
    // Verspreidingsgebied
    let distributionArea: String
    
    // Leefomgeving
    let habitat: String
    
    // Dierbeschrijving
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dolfijn
        Animal(
            name: "Dolfijn",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warme en gematigde oceanen over de hele wereld.",
            habitat: "Oceanen, kustwateren en enkele grote rivieren.",
            animalDescription: "Dolfijnen zijn intelligente zeezoogdieren. Ze leven in groepen, communiceren met geluiden en staan bekend om hun speelse gedrag."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannes en open bosgebieden in Afrika.",
            habitat: "Graslanden, savannes en open bossen.",
            animalDescription: "Giraffen zijn de hoogste landdieren. Ze hebben lange nekken, lange poten en eten meestal bladeren van hoge bomen."
        ),
        // Leeuw
        Animal(
            name: "Leeuw",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vooral te vinden in Afrika ten zuiden van de Sahara, met een kleine populatie in West-India.",
            habitat: "Graslanden, savannes en open bosgebieden.",
            animalDescription: "Leeuwen zijn krachtige grote katachtigen. Ze leven meestal in groepen die troepen worden genoemd en staan vaak bekend als de koningen van de dierenwereld."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergbossen in centraal China.",
            habitat: "Bamboebossen in koele en vochtige berggebieden.",
            animalDescription: "Panda's zijn beren die bekendstaan om hun zwart-witte vacht. Ze eten vooral bamboe en behoren tot de meest herkenbare dieren ter wereld."
        ),
        // IJsbeer
        Animal(
            name: "IJsbeer",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctische gebieden rond de Noordpool.",
            habitat: "Zee-ijs, kustgebieden en koude Arctische omgevingen.",
            animalDescription: "IJsberen zijn grote beren die zijn aangepast aan koude omgevingen. Ze zijn sterke zwemmers en zijn vooral afhankelijk van zee-ijs om op zeehonden te jagen."
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
                    Text("**Verspreidingsgebied**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Leefomgeving**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Dierbeschrijving**: \(animal.animalDescription)")
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

## Samenvatting

In deze les hebben we een eenvoudige dierenencyclopediepagina gemaakt.

We gebruiken eerst de `Animal`-structuur om diergegevens op te slaan, daarna gebruiken we een array om vijf dieren op te slaan, en vervolgens gebruiken we `ForEach` om de dierenlijst weer te geven.

Wanneer de gebruiker op een dier tikt, slaan we dat dier op in `selectedAnimal`:

```swift
selectedAnimal = animal
```

Wanneer `selectedAnimal` een waarde heeft, toont `.sheet(item:)` de detailview en geeft het geselecteerde dier door aan `AnimalDetailView`.

Het belangrijkste van deze les is niet de stijl van de interface, maar het begrijpen van deze route van gegevensoverdracht:

```swift
Tik op dier → selectedAnimal bewaart dier → Sheet verschijnt → AnimalDetailView toont details
```

Nadat je deze route begrijpt, kun je later meer vergelijkbare functies maken, zoals productdetails, cursusdetails, artikeldetails en contactdetails.
