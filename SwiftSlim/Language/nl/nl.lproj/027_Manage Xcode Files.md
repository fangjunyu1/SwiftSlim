# Xcode-bestanden beheren

In deze les leren we veelvoorkomende bestandsbewerkingen in Xcode.

In de vorige lessen schreven we de meeste code in `ContentView`. Dat maakt het gemakkelijk om de code en het weergaveresultaat te bekijken.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Maar in een echte App zetten we meestal niet alle code in één bestand.

Wanneer er steeds meer pagina’s, componenten en functies komen, moeten we verschillende views opsplitsen in verschillende SwiftUI-bestanden.

Bijvoorbeeld:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Zo wordt de codestructuur duidelijker en wordt later onderhoud en wijziging eenvoudiger.

## Waarom bestanden beheren

In SwiftUI kan een pagina of component meestal als een afzonderlijk viewbestand worden geschreven.

Bijvoorbeeld:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

De `CardView` hier is een SwiftUI-view.

Als alle views in `ContentView` worden geschreven, wordt de code steeds langer en ook steeds moeilijker te lezen.

Daarom moeten we leren hoe we bestanden maken, hernoemen en verwijderen, en hoe we mappen gebruiken om verschillende codebestanden te beheren.

## Een SwiftUI-bestand maken

In Xcode zijn er meestal twee veelvoorkomende manieren om een SwiftUI-bestand te maken:

De ene manier is een leeg bestand maken en daarna zelf code schrijven.

De andere manier is een SwiftUI-sjabloonbestand maken, waarbij Xcode automatisch basiscode genereert.

Voor beginners is het meer aan te raden om een SwiftUI-sjabloonbestand te gebruiken, omdat het automatisch de basisstructuur genereert.

### Een leeg bestand maken

Klik in het Navigator-gebied aan de linkerkant van Xcode met de rechtermuisknop op een lege plek of op een map, en kies `New Empty File`.

De plaats van deze handeling is als volgt:

![xcode](../../../Resource/027_view1.png)

Nadat een leeg bestand is gemaakt, genereert Xcode meestal een naamloos Swift-bestand, bijvoorbeeld `Untitled.swift`.

We kunnen het hernoemen naar `TestView.swift`.

In een SwiftUI-project is het, als dit bestand wordt gebruikt om een view weer te geven, meestal aan te raden om `View` achter de naam toe te voegen.

Bijvoorbeeld:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Dit is geen verplichte regel, maar het maakt in één oogopslag duidelijk dat dit een viewbestand is.

Nadat een leeg bestand is gemaakt, bevat het bestand mogelijk alleen standaardopmerkingen, of is het helemaal leeg. Dit hangt af van de Xcode-versie en de manier van maken.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Op dit moment moeten we handmatig SwiftUI-code schrijven:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Zo is een eenvoudig SwiftUI-viewbestand gemaakt.

### Bestand hernoemen

Als je na het maken van een bestand de bestandsnaam wilt wijzigen, kun je het bestand selecteren in het Navigator-gebied aan de linkerkant van Xcode en vervolgens op de enter-toets `⏎` drukken.

![xcode](../../../Resource/027_view2.png)

Daarmee kun je de bestandsnaam wijzigen.

Let erop dat het wijzigen van de bestandsnaam niet automatisch de viewnaam in de code wijzigt.

Als de bestandsnaam bijvoorbeeld is gewijzigd naar `ProfileView.swift`, kan de code nog steeds `struct TestView: View` bevatten.

Dit veroorzaakt niet per se een fout, maar kan gemakkelijk verwarring veroorzaken.

Daarom is het aan te raden om de bestandsnaam en de viewnaam consistent te houden. Als de bestandsnaam bijvoorbeeld `ProfileView.swift` is, gebruik dan ook `ProfileView` als viewnaam.

## Een SwiftUI-sjabloonbestand maken

Naast het maken van een leeg bestand kunnen we ook direct een SwiftUI-sjabloonbestand maken.

Klik in het Navigator-gebied aan de linkerkant van Xcode met de rechtermuisknop op een lege plek of op een map, en kies `New File from Template...`.

De plaats van deze handeling is als volgt:

![xcode](../../../Resource/027_view3.png)

In het pop-upvenster kun je bovenaan verschillende platforms kiezen, zoals `iOS`, `macOS` enzovoort.

Hier laten we het platform geselecteerd dat bij het huidige project hoort. Als we bijvoorbeeld een iOS App maken, kiezen we `iOS`.

![xcode](../../../Resource/027_view4.png)

Kies daarna onderaan `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Klik daarna op `Next`, voer de bestandsnaam in en sla het bestand op.

We maken bijvoorbeeld een `Test2View.swift`.

Xcode genereert automatisch code die lijkt op het volgende:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Vergeleken met een leeg bestand bevat een sjabloonbestand automatisch `import SwiftUI`, `struct`, `body` en `#Preview`.

Voor beginners is het gebruik van een SwiftUI-sjabloonbestand daarom eenvoudiger en is de kans kleiner dat er code wordt vergeten.

**Tip**: Naast bestanden maken met de rechtermuisknop, kun je ook op de plusknop onderaan de Navigator aan de linkerkant van Xcode klikken om een bestand of map te maken.

![xcode](../../../Resource/027_view5.png)

## Een map maken

Wanneer er steeds meer bestanden zijn, kunnen we mappen gebruiken voor beheer.

Klik in het Navigator-gebied aan de linkerkant van Xcode met de rechtermuisknop op een lege plek of op een map, en kies `New Folder`.

Nadat de map is gemaakt, kun je gerelateerde bestanden naar de map slepen.

![xcode](../../../Resource/027_view7.png)

Mappen worden vooral gebruikt om de projectstructuur te ordenen. Ze veranderen niet hoe de view zelf wordt gebruikt.

Zolang de viewnaam correct is, kun je de view in andere bestanden nog steeds gebruiken via `TestView()`, `Test2View()` en vergelijkbare vormen.

## Bestand of map verwijderen

Als je een bestand of map wilt verwijderen, kun je in het Navigator-gebied aan de linkerkant van Xcode het bijbehorende bestand selecteren, vervolgens met de rechtermuisknop klikken en `Delete` kiezen.

Je kunt ook het bestand selecteren en daarna op de delete-toets `⌫` drukken.

Xcode toont dan een bevestigingsvenster voor het verwijderen.

![xcode](../../../Resource/027_view10.png)

Kies `Move to Trash`; dit betekent dat het bestand naar de prullenmand wordt verplaatst.

Als je `Remove Reference` ziet, betekent dit dat alleen de verwijzing uit het Xcode-project wordt verwijderd, maar dat het oorspronkelijke bestand op de schijf niet wordt verwijderd.

Voor beginners is, als je alleen een gewoon bestand verwijdert dat je net zelf hebt gemaakt, meestal `Move to Trash` voldoende.

## Meerdere SwiftUI-views weergeven

Nadat we hebben geleerd hoe we bestanden maken, kunnen we verschillende views opsplitsen in verschillende bestanden.

We maken bijvoorbeeld twee SwiftUI-bestanden:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` wordt gebruikt om de naam van de auteur weer te geven:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` wordt gebruikt om de achtergrond van de kaart weer te geven:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Daarna kunnen we deze twee views in `ContentView` gebruiken:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Na het uitvoeren kun je zien dat `CardView` en `AuthorView` samen gecombineerd worden weergegeven:

![xcode](../../../Resource/027_view11.png)

In dit resultaat fungeert `CardView` als achtergrond en wordt `AuthorView` erboven weergegeven. Dat komt doordat ze in `ZStack` zijn geplaatst.

In `ContentView` gebruiken we deze twee views via `CardView()` en `AuthorView()`. De `()` achter de naam betekent dat deze view wordt gemaakt en gebruikt.

Dit is veelvoorkomende view-nesting in SwiftUI: binnen één view kun je andere views blijven gebruiken.

## Ingangsbestand

Tot slot bekijken we nogmaals waar de App begint met het weergeven van de interface.

In een SwiftUI-project is er meestal een ingangsbestand:

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

De `@main` hier geeft aan dat dit de ingang van de App is.

In `WindowGroup` zien we:

```swift
ContentView()
```

Dit betekent dat de App na het starten eerst `ContentView` weergeeft.

Daarna geeft `ContentView` daarin weer:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

De viewhiërarchie kan dus als volgt worden begrepen:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Als we de weergegeven view in het ingangsbestand wijzigen naar `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Dan geeft de App na het starten alleen `CardView` weer.

Met andere woorden: de `WindowGroup` in de ingangscode bepaalt welke view als eerste wordt weergegeven nadat de App is gestart.

Binnen die view kunnen vervolgens weer andere views worden weergegeven.

## Samenvatting

In deze les hebben we veelvoorkomende bestandsbeheerbewerkingen in Xcode geleerd.

We hebben geleerd hoe we SwiftUI-bestanden maken, hoe we bestanden hernoemen, hoe we mappen maken en hoe we bestanden verwijderen.

Tegelijkertijd hebben we ook een belangrijk concept geleerd: SwiftUI-views kunnen in verschillende bestanden worden opgesplitst en daarna in andere views worden gebruikt.

Bijvoorbeeld:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Hier zijn `CardView()` en `AuthorView()` andere views die binnen `ContentView` worden gebruikt.

Tot slot hebben we ook de weergavelogica van het ingangsbestand herhaald.

Wanneer de App start, gaat hij eerst naar de ingangscode met de `@main`-markering en geeft daarna de view in `WindowGroup` weer.

Dit helpt ons te begrijpen dat verschillende SwiftUI-bestanden niet geïsoleerd zijn. Ze kunnen met elkaar worden gecombineerd en vormen uiteindelijk samen de volledige App-interface.
