# Aangepaste kleuren

In deze les leren we hoe je in SwiftUI aangepaste kleuren maakt.

In eerdere lessen hebben we al standaardkleuren van SwiftUI gebruikt, bijvoorbeeld:

```swift
Color.blue
Color.red
Color.green
```

Deze kleuren zijn handig in gebruik, maar bij echte appontwikkeling zijn standaardkleuren meestal niet precies genoeg.

Een ontwerp kan bijvoorbeeld kleuren zoals deze gebruiken:

```text
#2c54c2
#4875ed
#213e8d
```

Dit soort kleur heet een Hex-kleur.

In deze les zorgen we er eerst voor dat SwiftUI Hex-kleuren ondersteunt. Daarna gebruiken we `static` om veelgebruikte kleuren overzichtelijk te ordenen.

Tot slot passen we aangepaste kleuren toe op de dierenencyclopedie-weergave en gebruiken we daarnaast een verloopachtergrond, zodat de knop meer diepte krijgt.

## Waarom zijn aangepaste kleuren nodig?

In SwiftUI kunnen we systeemkleuren direct gebruiken.

Bijvoorbeeld:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

De `.blue` hier betekent blauw. Het is eigenlijk een verkorte schrijfwijze van `Color.blue`.

Het voordeel van standaardkleuren is dat ze eenvoudig en handig zijn, maar de kleurkeuze is vrij beperkt.

Bijvoorbeeld:

```swift
Color.blue
```

Dit kan alleen de standaardblauwe kleur van SwiftUI weergeven.

![Color.blue](../../../Resource/031_color6.png)

Maar in echte ontwikkeling hebben we vaak specifiekere kleuren nodig.

Bijvoorbeeld: ook als kleuren allemaal blauw zijn, kunnen ze lichtblauw, donkerblauw, grijsblauw, helderblauw en andere effecten hebben.

![More Blue](../../../Resource/031_color5.png)

Als we dan alleen `Color.blue` gebruiken, is het moeilijk om het ontwerpeffect nauwkeurig te reproduceren.

Daarom moeten we SwiftUI aangepaste kleuren laten ondersteunen.

## Wat is een Hex-kleur?

Kleuren op een scherm bestaan meestal uit drie kanalen: rood, groen en blauw. Dat noemen we RGB.

RGB betekent respectievelijk:

```text
Red     // Rood
Green   // Groen
Blue    // Blauw
```

Een Hex-kleur is een manier om RGB-kleuren weer te geven.

Bijvoorbeeld:

```swift
#5479FF
```

Deze kleurwaarde kun je eenvoudig zien als drie delen:

```text
54  // Geeft het rode kanaal aan
79  // Geeft het groene kanaal aan
FF  // Geeft het blauwe kanaal aan
```

In deze les hoeven we deze waarden niet te berekenen en hoeven we de regels van het hexadecimale stelsel niet diepgaand te begrijpen.

Je hoeft nu alleen te weten: `#5479FF` staat voor een specifieke kleur.

Wanneer we later schrijfwijzen zoals `#2c54c2` en `#4875ed` zien, kunnen we die eerst begrijpen als een kleurwaarde.

In ontwerptools zoals Sketch, Figma en Photoshop zie je ook vaak vergelijkbare kleurwaarden.

![color](../../../Resource/031_color.png)

Maar SwiftUI kan standaard niet direct zo geschreven worden:

```swift
Color(hex: "#5479FF")
```

Daarom moeten we het type `Color` zelf uitbreiden, zodat het kleuren kan maken via een Hex-string.

## Het bestand Color+Hex.swift maken

Eerst maken we een nieuw Swift-bestand.

De bestandsnaam kan zijn:

```text
Color.swift
```

Je kunt ook een duidelijkere naam gebruiken:

```text
Color+Hex.swift
```

Hier raden we aan om te gebruiken:

```text
Color+Hex.swift
```

In Swift-projecten komen bestandsnamen zoals `Color+Hex.swift` vaak voor.

Dit betekent dat dit bestand een extensiebestand is dat Hex-functionaliteit aan `Color` toevoegt.

De bestandsnaam heeft geen directe invloed op het uitvoeren van de code. Hij is alleen bedoeld om het doel van dit bestand gemakkelijker te begrijpen.

## Color(hex:)-code toevoegen

Schrijf in het bestand `Color+Hex.swift` de volgende code:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
```

Deze code gebruikt `extension` om het type `Color` uit te breiden en voegt een nieuwe initializer toe aan `Color`:

```swift
init(hex: String)
```

Nadat we deze initializer hebben toegevoegd, kunnen we een Hex-string aan `Color` doorgeven om een aangepaste kleur te maken:

```swift
Color(hex: "#5479FF")
```

Binnen deze extensiecode wordt de Hex-string omgezet naar een RGB-kleur die SwiftUI kan herkennen.

In deze fase hoef je de conversielogica van elke regel niet diep te begrijpen. Je hoeft alleen te weten dat de toegevoegde methode `Color(hex:)` ons kleuren laat maken via Hex-kleurwaarden.

## Aangepaste kleuren gebruiken

Nu kunnen we aangepaste kleuren testen in `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)

            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))

            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))

            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Weergave-effect:

![color](../../../Resource/031_color1.png)

In dit voorbeeld gebruikt de eerste regel een systeemkleur:

```swift
.foregroundStyle(Color.blue)
```

De volgende drie regels gebruiken aangepaste Hex-kleuren:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Door ze te vergelijken, zie je dat systeemblauw slechts één standaardeffect heeft.

Hex-kleuren kunnen daarentegen subtielere variaties van blauw weergeven.

Dit is de waarde van aangepaste kleuren: ze kunnen de kleuren van de interface dichter bij het echte ontwerp brengen en maken het gemakkelijker om de visuele stijl van de app te beheren.

## Kleuren ordenen met static

Nu kunnen we al kleuren maken via Hex-strings:

```swift
Color(hex: "#2c54c2")
```

Deze schrijfwijze werkt prima, maar als dezelfde kleur op meerdere plaatsen terugkomt, wordt onderhoud later minder handig.

Als deze kleurwaarde op 10 plaatsen staat en je later dit blauw wilt aanpassen, moet je elke plaats één voor één wijzigen.

Op dat moment kunnen we `static` gebruiken om veelgebruikte kleuren centraal te ordenen.

Voeg onderaan het bestand `Color+Hex.swift` de volgende code toe:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Hier voegen we drie statische eigenschappen toe aan `Color`: `animalBlue`, `animalLightBlue` en `animalDarkBlue`. Ze staan voor blauwe kleuren met verschillende licht- en donkerwaarden.

Omdat deze eigenschappen `static` gebruiken, behoren ze tot het type `Color` zelf.

Bij gebruik kun je ze direct via `Color.` openen:

```swift
Color.animalBlue
```

Deze schrijfwijze is duidelijker dan direct een Hex-string schrijven.

Wanneer we `Color.animalBlue` zien, weten we dat dit de blauwe kleur is die in de dierenencyclopedie wordt gebruikt.

Wanneer we `Color(hex: "#2c54c2")` zien, weten we alleen dat het een kleurwaarde is, maar het doel ervan is minder gemakkelijk te herkennen.

Centraal kleurbeheer heeft nog een voordeel: latere wijzigingen zijn gemakkelijker.

Als je de hoofdkleur van de dierenencyclopedie wilt aanpassen, hoef je alleen de definitie te wijzigen:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Alle plaatsen die deze kleur gebruiken, worden dan samen bijgewerkt.

Dit is de betekenis van kleuren ordenen met `static`: kleurnamen worden duidelijker en later onderhoud wordt gemakkelijker.

## Toepassen op de dierenencyclopedie

Nu kunnen we aangepaste kleuren toepassen op de vorige dierenencyclopedie-weergave.

De achtergrond van de dierenknop was eerder wit:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nu kunnen we die wijzigen naar een aangepaste kleur:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

De `Color.animalBlue` hier is de statische kleur die we zojuist in `Color+Hex.swift` hebben gedefinieerd.

De knoptekst gebruikt wit:

```swift
.foregroundStyle(Color.white)
```

De achtergrond van de dieren-emoji gebruikt halftransparant wit:

```swift
.background(Color.white.opacity(0.15))
```

Zo krijgt de knop een uniforme blauwe visuele stijl.

Het belangrijkste in deze stap is niet het toevoegen van complexe code, maar het echt toepassen van de aangepaste kleuren die we net hebben geleerd op de interface.

## Een verloopachtergrond gebruiken

Naast één enkele kleur kunnen we ook meerdere kleuren combineren tot een verloopeffect.

We hebben bijvoorbeeld eerder deze kleuren gedefinieerd:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Deze kleuren kunnen niet alleen afzonderlijk worden gebruikt, maar ook worden gecombineerd tot een verloopachtergrond.

In SwiftUI kun je `LinearGradient` gebruiken om een lineair verloop te maken.

Bijvoorbeeld:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Deze code maakt een verloopachtergrond van links naar rechts, waarbij de kleur geleidelijk overgaat van `Color.animalBlue` naar `Color.animalLightBlue`.

Daarbij wordt `colors` gebruikt om de kleuren van het verloop in te stellen, en worden `startPoint` en `endPoint` gebruikt om de richting van het verloop te bepalen.

### Het verloopeffect testen

We kunnen een eenvoudige Text gebruiken om de verloopachtergrond te testen.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Weergave-effect:

![color](../../../Resource/031_color3.png)

In dit voorbeeld is de achtergrond van `Text` niet langer één enkele kleur, maar een verloopkleur die geleidelijk van links naar rechts verandert.

Vergeleken met een gewone achtergrondkleur heeft een verloopachtergrond meer diepte en kan hij gemakkelijker een visueel accent in de interface maken.

## Een verloopachtergrond gebruiken in de dierenencyclopedie

Nu kunnen we de achtergrondkleur van de dierenknop:

```swift
.background(Color.animalBlue)
```

wijzigen naar een verloopachtergrond:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

De volledige code is als volgt:

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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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

Weergave-effect:

![color](../../../Resource/031_color4.png)

Nu heeft de dierenknop niet langer alleen een effen achtergrondkleur, maar een verloopeffect van links naar rechts.

Vergeleken met een effen achtergrond kan een verloopachtergrond de interface meer diepte geven en deze dichter bij het visuele ontwerp van een echte app brengen.

## Het verschil tussen een effen achtergrond en een verloopachtergrond

Een effen achtergrond gebruikt slechts één kleur.

Bijvoorbeeld:

```swift
.background(Color.animalBlue)
```

Deze schrijfwijze is eenvoudig en duidelijk, en is geschikt voor de meeste basisinterfaces.

Een verloopachtergrond gebruikt meerdere kleuren.

Bijvoorbeeld:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Deze schrijfwijze kan de interface meer diepte geven, maar kan ook gemakkelijker visuele complexiteit toevoegen.

In echte ontwikkeling kun je het daarom zo begrijpen:

Een effen achtergrond is geschikt voor gewone tekst, gewone knoppen, gewone kaarten en gewone pagina-achtergronden.

Een verloopachtergrond is geschikt voor belangrijke knoppen, bovenste gebieden, omslagkaarten, functie-ingangen en andere posities die nadruk nodig hebben.

## Samenvatting

In deze les hebben we geleerd hoe je aangepaste kleuren in SwiftUI gebruikt.

Eerst hebben we Hex-kleuren leren kennen.

Bijvoorbeeld:

```text
#2c54c2
```

Dit geeft een specifieke kleur aan.

Daarna hebben we `extension Color` gebruikt om het type `Color` uit te breiden.

Zo kan SwiftUI kleuren maken op de volgende manier:

```swift
Color(hex: "#2c54c2")
```

Vervolgens hebben we `static` gebruikt om veelgebruikte kleuren te ordenen:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Zo kun je in andere views direct gebruiken:

```swift
Color.animalBlue
```

Vergeleken met telkens een Hex-string schrijven is deze manier duidelijker en maakt hij het gemakkelijker om kleuren later centraal te wijzigen.

Tot slot hebben we `LinearGradient` geleerd en aangepaste kleuren gecombineerd tot een verloopachtergrond:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Met deze les hebben we het proces voltooid van “aangepaste kleuren maken” tot “kleuren gebruiken in een echte interface”.

Wanneer een kleur later op meerdere plaatsen herhaald wordt gebruikt, kun je eerst overwegen om die in een `Color`-extensie te ordenen.

Zo wordt de code duidelijker en wordt de interfacestijl gemakkelijker consistent te houden.
