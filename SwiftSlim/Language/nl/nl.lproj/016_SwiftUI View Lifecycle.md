# De levenscyclus van een SwiftUI-view

In de vorige les hebben we geleerd dat `@State`-variabelen meebewegen met de levenscyclus van een view, en we hebben ook het basisgebruik van `onAppear` geleerd.

In deze les verdiepen we ons verder in de levenscyclus van SwiftUI-views. We bekijken hoe views worden aangemaakt en weergegeven, hoe variabelen in een view worden aangemaakt en opnieuw opgebouwd, en we leren `onAppear`, `onDisappear` en de constructor `init`.

Met deze kennis bouwen we een totaalbeeld op van het volledige opbouwproces van SwiftUI-views.

## Opstartvolgorde van de app

Wanneer je een iOS-project maakt, genereert Xcode standaard twee bestanden:

```
ContentView.swift
ProjectName + App.swift
```

Daarvan is `"ProjectName + App".swift` het ingangspunt van de hele app.

Bijvoorbeeld:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Uitvoeringsstroom van de code

Wanneer we de app uitvoeren op de simulator of op een echt apparaat, zoekt het systeem eerst naar het sleutelwoord `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Na bevestiging van het ingangspunt begint de code-uitvoering.

Eerst gaat de app de `App`-struct binnen en voert de code in `body` uit. Daarna maakt het systeem een `WindowGroup` aan en laadt het de `ContentView` daarin.

### De rol van `WindowGroup`

`WindowGroup` wordt gebruikt om vensters te beheren:

```swift
WindowGroup {
    ContentView()
}
```

Op iPad en macOS ondersteunen systemen meerdere vensters; op iPhone is er meestal maar één venster.

Daarom beheert `WindowGroup` op de iPhone vooral het eerste scherm dat wordt weergegeven.

### Het laadproces van een view

Wanneer het systeem `ContentView` heeft gevonden:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

zal SwiftUI de code in `body` uitvoeren, vervolgens op basis van de teruggegeven viewstructuur, zoals `VStack` en `Text`, de interface opbouwen en die op het scherm tonen.

Na deze stappen kunnen we `ContentView` in de view zien.

![ContentView](../../Resource/016_view1.png)

Het is belangrijk om te weten dat `body` dient om een view te genereren, niet om een view op te slaan.

Dat betekent dat SwiftUI bij elke verversing van de view `body` opnieuw berekent en een nieuwe viewstructuur genereert.

### De logica van preview-views

De preview van Xcode (`Canvas`) en het echte uitvoeren van de app zijn twee verschillende mechanismen.

Voeg bijvoorbeeld een debug-uitvoer toe in het ingangspuntbestand:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Wanneer je de `ContentView`-view in Xcode previewt, start de code niet bij de `@main`-ingang, dus wordt `onAppear` in het ingangspuntbestand niet geactiveerd.

Maar wanneer je de app op een simulator of echt apparaat uitvoert, begint het systeem bij `@main`, doorloopt de volledige stroom van de app, activeert het `onAppear` bij het ingangspunt en zie je de debug-uitvoer.

De kern is dat Xcode-preview alleen een "lokale rendering" is om de huidige view te tonen; simulatoren en echte apparaten bieden een "volledige uitvoeromgeving" en draaien de hele app.

Daarom moet je voor het testen van app-functionaliteit uitgaan van simulator of echt apparaat. Xcode-preview kan geen volledige uitvoeromgeving bieden.

## De levenscyclus van een view

In deze fase staat al onze code nog in `ContentView`. In een echte app bevat een app meestal echter meerdere views, die in verschillende scenario's worden omgeschakeld.

Bijvoorbeeld in de "spaarpot":

![PiggyBank](../../Resource/016_view.png)

Wanneer op "Geld opslaan" wordt geklikt, verschijnt de `SaveView`; wanneer het opslaan klaar is of de view wordt gesloten, wordt `SaveView` weer verwijderd.

Dit proces vormt de levenscyclus van een view: de view wordt aangemaakt, weergegeven en uiteindelijk verwijderd.

### De app sluiten

Wanneer de app wordt gesloten, worden alle views verwijderd en verdwijnen ook de bijbehorende toestanden.

Daarom worden `ContentView` en andere views uit het geheugen verwijderd en wordt ook de volledige uitvoeringsstatus van de app gewist.

## De levenscyclus van variabelen in een view

In SwiftUI is de levensduur van variabelen meestal gekoppeld aan de view.

Bijvoorbeeld:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State`-variabele

Een variabele die met `@State` is gedeclareerd, is gebonden aan de levenscyclus van de view.

```swift
@State private var name = "FangJunyu"
```

Wanneer de view wordt aangemaakt, wordt `name` ook aangemaakt; wanneer de view wordt verwijderd, wordt `name` ook vernietigd.

Daarom hebben we methoden zoals `UserDefaults` nodig voor blijvende opslag van data.

### Variabelen binnen `body`

Een variabele die in `body` wordt gedefinieerd:

```swift
var num = 10
```

heeft een levensduur die gekoppeld is aan de uitvoering van `body`.

Wanneer de status van SwiftUI verandert, bijvoorbeeld:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Als `name` verandert, merkt `@State` dat de data is veranderd en meldt dat aan SwiftUI, waarna de view opnieuw wordt berekend en `body` opnieuw wordt uitgevoerd.

Bij die nieuwe berekening van `body` wordt alle code in `body` opnieuw uitgevoerd, en worden ook variabelen binnen `body`, zoals `num`, opnieuw aangemaakt.

Daarom wordt het niet aangeraden om complexe variabelen in `body` te definiëren.

Want telkens wanneer de view wordt vernieuwd, worden die variabelen opnieuw aangemaakt, wat extra rekenkosten met zich meebrengt en de prestaties beïnvloedt.

In SwiftUI moet je verschillende soorten data op verschillende manieren beheren: gegevens die met de levenscyclus van de view moeten meebewegen, kun je opslaan met `@State`; tijdelijke berekende gegevens kun je in `body` plaatsen.

## `onAppear` en `onDisappear`

In de vorige les hebben we al `onAppear` geleerd. Wanneer een view verschijnt, wordt `onAppear` aangeroepen.

```swift
.onAppear {}
```

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Tijdens preview in Xcode of bij het uitvoeren van de app kun je de debug-uitvoer uit `onAppear` zien.

### `onDisappear`

Tegenover `onAppear` staat `onDisappear`:

```swift
.onDisappear {}
```

Wanneer een view wordt gesloten, wordt `onDisappear` aangeroepen.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Wanneer de view wordt verwijderd, wordt de code in `onDisappear` uitgevoerd.

Tip: de `ContentView` die we op dit moment gebruiken is de root-view van de app en kan niet direct worden gesloten of verwijderd. Daarom kunnen we in dit stadium het effect van `onDisappear` nog niet direct observeren.

Pas later, wanneer we paginanavigatie of het openen van nieuwe views leren, zullen we echt kunnen zien dat `onDisappear` wordt aangeroepen.

## Logica van aanmaken en weergeven

Het is belangrijk om te weten dat het aanmaken van een view en het weergeven van een view twee verschillende fasen zijn.

Wanneer een view wordt aangemaakt, wordt de constructor van de `struct` aangeroepen:

```swift
init() {}
```

Dat komt doordat een SwiftUI-view een `struct` is:

```swift
struct ContentView: View { ... }
```

Dus wanneer een instantie van de view wordt aangemaakt, wordt de constructor `init` uitgevoerd. Pas wanneer de view wordt weergegeven, wordt `onAppear` aangeroepen.

Bijvoorbeeld:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Wanneer je de view in Xcode previewt, kun je de volgende debug-uitvoer zien:

```swift
Create ContentView
Show ContentView
```

Dat laat zien dat eerst `init` wordt uitgevoerd om de view aan te maken, daarna de code in `body` wordt berekend, en tenslotte de view wordt weergegeven en `onAppear` wordt uitgevoerd.

Daarom is het belangrijk te begrijpen dat het aanmaken en weergeven van een view gescheiden fasen zijn.

### Constructor `init`

`init` is basis-Swift-syntaxis. Zowel `struct` als `class` kunnen het definiëren, en het wordt gebruikt om objecten te initialiseren.

```swift
init() {}
```

In SwiftUI roept het systeem `init` van de view aan wanneer de view wordt aangemaakt. Dat kan worden gebruikt om parameters te ontvangen of data te initialiseren.

Als je `init` niet handmatig schrijft, genereert Swift automatisch een standaardconstructor voor een `struct`.

Voor SwiftUI-views zoals `ContentView` geldt dus: bij het aanmaken van de view wordt `init` uitgevoerd, en bij het tonen van de view wordt `onAppear` uitgevoerd.

Daarom is `init` de constructor die draait wanneer de view wordt aangemaakt. Later, wanneer we parameters gaan doorgeven of gegevens initialiseren, zal die van pas komen.

## Samenvatting

In deze les hebben we de opstartvolgorde van een app geleerd, van het ingangspuntbestand tot de uitvoeringsstroom naar `ContentView`.

We hebben de levenscyclus van een SwiftUI-view leren kennen: bij het aanmaken van een view wordt `init` uitgevoerd, wanneer de view op het scherm verschijnt wordt `onAppear` uitgevoerd, en wanneer de view wordt verwijderd of gesloten wordt `onDisappear` uitgevoerd.

We leerden ook het mechanisme van view-updates: views worden aangestuurd door status. Wanneer status zoals `@State` verandert, vernieuwt SwiftUI de view, berekent `body` opnieuw, en worden variabelen binnen `body` opnieuw aangemaakt.

De levensduur van variabelen is gekoppeld aan de levensduur van de view, terwijl tijdelijke waarden in `body` bij elke vernieuwing opnieuw worden gemaakt.

Door deze levenscycli en het gedrag van variabelen te begrijpen, kunnen we code beter organiseren en de logica van een app duidelijker maken.
