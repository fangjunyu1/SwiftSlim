# Swift en SwiftUI

Bij het leren ontwikkelen voor Apple-platformen leggen veel tutorials Swift en SwiftUI apart uit. Dat zorgt er gemakkelijk voor dat beginners een versnipperd beeld krijgen en denken dat het twee volledig onafhankelijke technologieën zijn.

In werkelijkheid vormen Swift en SwiftUI een diep geïntegreerd geheel: Swift is de programmeertaal en is verantwoordelijk voor logica en gegevens；SwiftUI is een gebruikersinterfaceframework dat op Swift is gebouwd en is verantwoordelijk voor de rendering en interactie van views.

Deze les helpt je een helder begripskader op te bouwen: wat Swift is, wat SwiftUI is en hoe ze in code met elkaar samenwerken.

## Wat is Swift?

Swift is een moderne programmeertaal die door Apple is uitgebracht en wordt gebruikt om applicaties te ontwikkelen voor platformen zoals iOS, macOS, watchOS en tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift is een sterk getypeerde, statische taal. In het ontwerp wordt meer nadruk gelegd op veiligheid, waardoor veel veelvoorkomende programmeerfouten worden verminderd（zoals null pointers en indexoverschrijdingen）, en er is naadloze integratie met C en Objective-C mogelijk.

In echte ontwikkeling is Swift vooral verantwoordelijk voor de logische kant van een applicatie, zoals gegevensverwerking, netwerkverzoeken en opslagbewerkingen.

## Wat is SwiftUI?

SwiftUI is een nieuw framework voor het bouwen van interfaces dat Apple in 2019 heeft uitgebracht. SwiftUI gebruikt een declaratief programmeermodel, waardoor ontwikkelaars met eenvoudigere code de structuur van interfaces en interactiegedrag kunnen beschrijven.

![swiftui](../../RESOURCE/010_swiftui.png)

Declaratief programmeren betekent dat de ontwikkelaar alleen aan het systeem hoeft te vertellen wat er moet worden weergegeven, waarna het systeem op basis van gegevensveranderingen automatisch de view ververst. Daardoor hoeven we de toestanden van de interface niet meer handmatig bij te werken, wat de complexiteit van UI-ontwikkeling sterk vereenvoudigt.

De kern van SwiftUI bestaat uit viewcomponenten（zoals `Text`、`Image`、`Button` enzovoort）en layoutcontainers（zoals `VStack`、`HStack`、`ZStack`）。Deze componenten werken samen via databinding en state management, zodat de interface kan reageren op gegevensveranderingen en zichzelf automatisch kan vernieuwen.

## Hoe werken Swift en SwiftUI samen?

De verantwoordelijkheden van Swift en SwiftUI kunnen als volgt worden samengevat:

**1. Swift: logica en gegevens verwerken**

Swift wordt voornamelijk gebruikt om gegevens te beheren, toestanden op te slaan en logica uit te voeren. Deze code beïnvloedt meestal niet direct de rendering van de interface, maar is verantwoordelijk voor de verwerking van gegevens en gedrag.

Bijvoorbeeld, gegevensverwerking in Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Deze code omvat variabele declaraties, constante definities, functies, control flow enzovoort, maar heeft geen directe invloed op de weergave van de view.

**2. SwiftUI: de interface declareren en renderen**

SwiftUI wordt gebruikt om de layout en inhoud van de gebruikersinterface op te bouwen, en is vooral verantwoordelijk voor de rendering van de interface en de interactie met views.

Bijvoorbeeld, een tekstview maken met SwiftUI:

```swift
Text("SwiftSlim")
```

Dit soort code wordt gebruikt om interface-elementen te bouwen en te controleren, en werkt direct samen met de gebruikersinterface.

### Eenvoudig voorbeeld

Hieronder staat een eenvoudig SwiftUI-voorbeeld:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

In dit voorbeeld:

**SwiftUI-code**：`VStack`、`Image`、`Text` en `padding` behoren allemaal tot SwiftUI en zijn verantwoordelijk voor de weergave en layout van de interface.

**Swift-code**：de `//`-opmerkingen bovenaan het bestand en `import SwiftUI` behoren tot de Swift-codestructuur；`#Preview` onderaan is een macro voor voorvertoning in Xcode en doet niet mee aan de daadwerkelijke rendering van de interface.

### Geavanceerd voorbeeld

In echte projecten worden Swift en SwiftUI vaak gemengd gebruikt om elk hun sterke punten te benutten:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

In dit voorbeeld:

**SwiftUI-code**：`@State` is een property wrapper die specifiek is voor SwiftUI en wordt gebruikt om veranderlijke toestand van een view te declareren；`Button` en `Text` zijn SwiftUI-viewcomponenten en zijn verantwoordelijk voor de interfaceweergave en gebruikersinteractie.

**Swift-code**：`private var name` en `func printName()` zijn Swift-code en worden gebruikt om gegevens op te slaan en logica uit te voeren, zonder direct invloed te hebben op de rendering van de view.

Wanneer de gebruiker op de knop klikt, activeert SwiftUI de code in de knop:

```swift
Button("Print") {
    printName()
}
```

Hierin is `Button` een SwiftUI-component, terwijl de uitgevoerde functie `printName()` Swift-code is en verantwoordelijk voor de concrete logische verwerking.

Deze samenwerking maakt het mogelijk dat Swift en SwiftUI naadloos samenkomen: Swift behandelt gegevens en logica, SwiftUI behandelt de weergave van de gebruikersinterface.

## Waar worden Swift- en SwiftUI-code meestal geschreven?

In SwiftUI wordt de interface opgebouwd via de view die door de eigenschap `body` wordt teruggegeven. Daarom wordt alle code die de interface beschrijft meestal binnen `body` geschreven.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

In dit voorbeeld is `Text` een SwiftUI-viewcomponent en moet deze daarom binnen `body` worden geschreven, omdat SwiftUI via `body` de interface leest en genereert.

Code die niet direct met de interface te maken heeft, zoals variabelen, functies of dataverwerkingslogica, wordt meestal buiten `body` geschreven. Bijvoorbeeld:

```swift
struct ContentView: View {

    // Swift: gegevens of logica
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interface
    var body: some View {
        Text(name)
    }
}
```

Let op dat binnen `body` nog steeds Swift-syntaxis gebruikt kan worden, zoals `if`、`for` en andere control flow-constructies. Ze worden alleen gebruikt om de generatie van SwiftUI-views te sturen:

```
if isLogin {
    Text("Welcome")
}
```

Daarom kunnen we in SwiftUI-ontwikkeling eenvoudig zeggen: viewcode（zoals `Text`、`Image`、`Button`）wordt meestal binnen `body` geschreven；gegevens- en logicacode（zoals variabelen en functies）wordt meestal buiten `body` geschreven.

## Swift-bestanden

Naarmate we verder leren, zullen we ook kennis maken met de MVVM-architectuur, waarbij de ViewModel- en Model-lagen meestal uit pure Swift-code bestaan en volledig gescheiden zijn van de weergavelaag（SwiftUI）。

Bijvoorbeeld een klasse die de status van een applicatie beheert:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Of een structuur die een datastructuur beschrijft:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Dit soort bestanden heeft als taak gegevens te beheren en persistent op te slaan, en wordt niet direct in de interface weergegeven. Daarom behoort het volledig tot Swift.

## Historische achtergrond

Om de relatie tussen Swift en SwiftUI te begrijpen, is het ook nodig om de ontwikkeling van Apple-technologieën te kennen. Tot en met 2026 heeft deze technologiestack meerdere iteraties doorgemaakt.

### De geschiedenis van Swift

Voordat Swift verscheen, was Objective-C de belangrijkste programmeertaal op Apple-platformen, en het ondersteunde gemengde ontwikkeling met C. De syntaxis is vrij omslachtig en de instapdrempel voor beginners is relatief hoog:

```Obj-c
// Schrijfwijze van Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

In 2014 bracht Apple op WWDC de taal Swift uit. Swift heeft een modernere syntaxis en een hogere typeveiligheid, en verving Objective-C geleidelijk als de belangrijkste ontwikkeltaal:

```swift
// Schrijfwijze van Swift
let name = "Fang"
print("Hello, \(name)")
```

Maar Objective-C verdween niet zomaar van het toneel. In veel bestaande projecten en onderliggende frameworks wordt het nog steeds veel gebruikt. Een basisbegrip van de syntaxis heeft daarom nog steeds waarde voor het onderhouden van oude projecten en het begrijpen van systeemlagen.

### De geschiedenis van SwiftUI

Vóór SwiftUI gebruikte iOS **UIKit** en macOS **AppKit**。Deze frameworks gebruikten een “imperatief” programmeermodel. Ontwikkelaars moesten via Storyboard componenten slepen of handmatig code schrijven om de toestand van views te beheren. Dat betekende veel code en hoge onderhoudskosten, vooral wanneer de interfacelogica complex werd.

![storyboard](../../RESOURCE/010_xcode.png)

In 2019 bracht Apple SwiftUI officieel uit op WWDC. SwiftUI introduceerde een “declaratief” programmeerparadigma, wat het proces van UI-ontwikkeling aanzienlijk vereenvoudigde.

![storyboard](../../RESOURCE/010_xcode1.png)

Belangrijk om te weten is dat SwiftUI geen volledig onafhankelijke implementatie op laag niveau is. Op elk platform is het in wezen een brug en samenwerking met UIKit（iOS）of AppKit（macOS）, en onderliggend blijft het afhankelijk van deze twee frameworks.

### De relatie tussen Swift en UIKit / AppKit

Hoewel Swift een algemene programmeertaal is die op alle Apple-platformen kan draaien, kan het UIKit of AppKit niet volledig vervangen. Voor sommige complexe interfacebehoeften, of voor functies die SwiftUI nog niet afdekt, moeten we nog steeds UIKit of AppKit gebruiken.

Bijvoorbeeld, UIKit is zeer volwassen op het gebied van complexe viewcontroller-beheer, animatie-effecten en gesture-herkenning, en heeft veel praktijkervaring uit productie opgebouw﻿d. De mogelijkheden van SwiftUI worden weliswaar voortdurend sterker, maar in sommige randsituaties bestaan er nog steeds beperkingen.

Daarom gebruiken veel ontwikkelaars in projecten een combinatie van SwiftUI en UIKit（of AppKit）, zodat de voordelen van beide optimaal worden benut.

Vanuit dat perspectief kun je SwiftUI zien als een geavanceerde abstractielaag boven UIKit / AppKit. Terwijl we SwiftUI leren, helpt het daarom ook om de basisconcepten van UIKit en AppKit enigszins te begrijpen, zodat we bij het onderhouden van oudere projecten of het realiseren van complexere functies betere technische beslissingen kunnen nemen.

## Samenvatting

**Swift**：wordt vooral gebruikt voor het schrijven van logica, gegevensverwerking, control flow enzovoort, en staat los van de layout van views.

**SwiftUI**：wordt gebruikt om declaratief gebruikersinterfaces op te bouwen. Code voor view-inhoud en layout behoort tot SwiftUI.

In echte ontwikkeling worden Swift en SwiftUI meestal gecombineerd gebruikt: Swift voor logica, SwiftUI voor de interface.

Van Objective-C en UIKit tot Swift en SwiftUI is de ontwikkelomgeving van Apple geleidelijk verschoven naar modernere en eenvoudigere programmeerstijlen, maar UIKit en AppKit mogen in veel traditionele projecten nog steeds niet worden genegeerd.

Door de relatie tussen Swift en SwiftUI te begrijpen, kunnen we efficiënter iOS/macOS ontwikkelen en ook meer doordachte technische keuzes maken bij het onderhouden van oudere projecten.
