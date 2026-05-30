# Aangepaste weergave

In deze les leren we een zeer belangrijke SwiftUI-schrijfwijze: **aangepaste View**.

Een aangepaste View kan een stuk herhaalde View-code inkapselen en er een View van maken die telkens opnieuw kan worden gebruikt.

Bij echte App-ontwikkeling komen we vaak deze situatie tegen: de structuur van veel schermen is hetzelfde, maar de weergegeven inhoud is anders.

Bijvoorbeeld, in de berichtenlijst van een forumwebsite kan elk bericht informatie hebben zoals een titel, afbeelding en aantal likes.

![Reddit](../../../Resource/028_view1.png)

In de productlijst van een winkelwebsite kan elk product informatie hebben zoals een afbeelding, naam en prijs.

![Amazon](../../../Resource/028_view2.png)

De structuur van deze inhoud is vergelijkbaar; het verschil zit alleen in de gegevens die worden weergegeven.

Als we voor elk item handmatig code schrijven, wordt de code erg lang en is deze later ook niet handig om aan te passen.

Daarom kunnen we de gemeenschappelijke structuur inkapselen in een aangepaste View en de verschillende inhoud als parameters naar binnen doorgeven.

Zo kan dezelfde View verschillende inhoud weergeven.

## Vereist scenario

We willen bijvoorbeeld nu een instellingenlijst maken.

Weergaveresultaat:

![view](../../../Resource/028_view.png)

In deze instellingenlijst staan drie verschillende instellingenitems: `Instellingen`, `Map` en `Muziek`.

Hoewel hun pictogrammen, kleuren en titels verschillen, is de algemene structuur hetzelfde:

- Pictogram aan de linkerkant
- Achtergrondkleur van het pictogram
- Titel in het midden
- Pijl aan de rechterkant

Als we geen aangepaste View gebruiken, zouden we misschien zo schrijven:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Instellingen")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Map")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Muziek")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Deze code kan normaal worden weergegeven, maar het probleem is ook heel duidelijk: de code van de drie instellingenitems is bijna volledig hetzelfde.

Alleen het pictogram, de kleur en de titel zijn anders:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Instellingen")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Map")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Muziek")
```

Dat wil zeggen: de structuur van elk instellingenitem is vast, alleen het pictogram, de kleur en de titel verschillen.

Deze situatie is dus zeer geschikt voor het gebruik van een aangepaste View.

### Schaduw shadow

Hier gebruiken we een nieuwe modifier `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` kan een schaduw aan een View toevoegen.

`radius` geeft de vervagingsstraal van de schaduw aan. Hoe groter de waarde, hoe groter meestal het verspreidingsgebied van de schaduw en hoe zachter deze eruitziet.

Hier is deze ingesteld op `1`, wat betekent dat er alleen een heel licht schaduweffect wordt toegevoegd.

## De View van het instellingenitem inkapselen

Vervolgens kapselen we elk instellingenitem in als een nieuwe View.

We kunnen een `SettingItemView` maken:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

In deze View definiëren we drie properties:

```swift
let icon: String
let color: Color
let title: String
```

Daarbij geldt:

- `icon` staat voor de naam van het pictogram
- `color` staat voor de achtergrondkleur van het pictogram
- `title` staat voor de titel van het instellingenitem

Omdat deze drie onderdelen bij verschillende instellingenitems verschillend zijn, maken we ze parameters die van buitenaf kunnen worden doorgegeven.

## Een aangepaste View gebruiken

Nu we `SettingItemView` hebben, hoeven we niet langer herhaaldelijk een groot stuk `HStack`-code te schrijven.

Nu kunnen we het zo gebruiken:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")
```

Deze regel code betekent dat we een View voor een instellingenitem maken en drie parameters doorgeven:

```swift
icon: "gear"
color: Color.blue
title: "Instellingen"
```

Na het doorgeven krijgen de properties binnen `SettingItemView` de overeenkomstige waarden:

- de waarde van `icon` is `gear`
- de waarde van `color` is `Color.blue`
- de waarde van `title` is `"Instellingen"`

Daarom zal `Image(systemName: icon)` binnen de View het tandwielpictogram weergeven, `.background(color)` een blauwe achtergrond gebruiken en `Text(title)` `Instellingen` weergeven.

Volledige code:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Map")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Muziek")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Weergaveresultaat:

![view](../../../Resource/028_view.png)

Je kunt zien dat het weergaveresultaat na het inkapselen hetzelfde is als eerder, maar de code is duidelijker geworden.

Eerst moest voor elk instellingenitem een heel stuk `HStack` worden geschreven; nu is één regel code genoeg:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")
```

Dit is de rol van een aangepaste View: **een herhaalde View-structuur inkapselen en alleen de verschillende inhoud als parameters doorgeven.**

## Waarom parameters kunnen worden doorgegeven

Laten we vervolgens eenvoudig begrijpen waarom een aangepaste View parameters kan ontvangen.

In SwiftUI is een View in wezen een structuur.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, wereld!")
    }
}
```

Hier is `ContentView` een structuur.

Wanneer we schrijven:

```swift
ContentView()
```

maken we in feite een `ContentView`-View.

De `()` erachter betekent dat de initialisatiemethode wordt aangeroepen; je kunt het ook begrijpen als het maken van deze View.

Omdat deze `ContentView` geen properties heeft die van buitenaf moeten worden doorgegeven, kunnen we direct schrijven:

```swift
ContentView()
```

Maar als er in de View een property zonder waarde is, moet bij het maken van de View de bijbehorende waarde worden doorgegeven.

Bijvoorbeeld:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("naam: \(name)")
    }
}
```

Hier is `name` een property, en deze heeft geen standaardwaarde.

Daarom moet bij het maken van `ContentView` een concrete waarde voor `name` worden gegeven:

```swift
ContentView(name: "Fang Junyu")
```

Zo kan de View deze waarde intern gebruiken:

```swift
Text("naam: \(name)")
```

Dit is ook de reden waarom we bij het maken van `SettingItemView` parameters moeten doorgeven:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")
```

Omdat `SettingItemView` drie properties zonder standaardwaarden heeft:

```swift
let icon: String
let color: Color
let title: String
```

Daarom moeten we ze bij het maken van deze View naar binnen doorgeven. De doorgegeven parameters worden door Swift gebruikt om waarden toe te kennen aan de properties binnen de View.

## Initialisatiemethode

Vervolgens gaan we de initialisatiemethode nog iets verder begrijpen.

### Standaard initialisatiemethode

Wanneer we een gewone View definiëren:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, wereld!")
    }
}
```

In deze code hebben we geen initialisatiemethode handmatig geschreven.

Maar wanneer we deze View gebruiken, kunnen we zo schrijven:

```swift
ContentView()
```

Hier betekent `()` eigenlijk dat we `ContentView` maken; je kunt het ook begrijpen als het aanroepen van de initialisatiemethode.

### Waarom kunnen we deze aanroepen, ook al is er geen initialisatiemethode zichtbaar?

Omdat de Swift-compiler automatisch een initialisatiemethode voor ons genereert.

Let op: **deze initialisatiemethode wordt automatisch gegenereerd, en meestal zien we die niet direct in de code.**

Dat wil zeggen, hoewel we niet handmatig in `struct` hebben geschreven:

```swift
init() {

}
```

zal de Swift-compiler achter de schermen ongeveer zo'n initialisatiemethode voor ons genereren:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hallo, wereld!")
    }
}
```

Daarom kunnen we direct schrijven:

```swift
ContentView()
```

In echte code hoeven we de initialisatiemethode daarom meestal niet handmatig uit te schrijven.

We hoeven alleen één punt te begrijpen: **wanneer een SwiftUI View wordt gemaakt, wordt de initialisatiemethode van die View aangeroepen. Zelfs als we geen initialisatiemethode handmatig schrijven, kan Swift die automatisch voor ons genereren.**

### Initialisatiemethode met parameters

Als een View een property zonder standaardwaarde heeft, bijvoorbeeld:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("naam: \(name)")
    }
}
```

zal de Swift-compiler op basis van de property automatisch een initialisatiemethode met parameter genereren.

Je kunt dit eenvoudig begrijpen als:

```swift
init(name: String) {
    self.name = name
}
```

Hier:

```swift
init(name: String)
```

betekent dat bij het maken van `ContentView` een `name`-parameter van het type `String` moet worden doorgegeven.

Wanneer we schrijven:

```swift
ContentView(name: "Fang Junyu")
```

betekent dit: `"Fang Junyu"` als parameter doorgeven aan de initialisatiemethode.

Vervolgens wordt binnen de initialisatiemethode uitgevoerd:

```swift
self.name = name
```

Deze regel code betekent: ken de van buitenaf doorgegeven `name` toe aan de eigen `name`-property van de huidige View.

Je kunt dit eenvoudig begrijpen als:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("naam: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Zo kan de View de doorgegeven waarde intern gebruiken.

Dit is het initialisatieproces van een View met parameters: **wanneer een property in de View geen standaardwaarde heeft, moet bij het maken van de View de bijbehorende parameter worden doorgegeven, zodat de initialisatiemethode de propertywaarde kan toekennen.**

## Situatie waarin een property een standaardwaarde heeft

Als een property al een standaardwaarde heeft, hoeft bij het maken van de View geen parameter te worden doorgegeven.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("naam: \(name)")
    }
}
```

Hier heeft `name` al een standaardwaarde:

```swift
"Fang Junyu"
```

Daarom kunnen we bij het maken van `ContentView` direct schrijven:

```swift
ContentView()
```

Op dat moment gebruikt `name` de standaardwaarde, en de interface toont:

```swift
naam: Fang Junyu
```

Natuurlijk kunnen we bij het maken van de View ook een nieuwe waarde doorgeven:

```swift
ContentView(name: "Sam")
```

Op dat moment gebruikt de View de van buitenaf doorgegeven `"Sam"` in plaats van de standaardwaarde, en de interface toont:

```swift
naam: Sam
```

Om dit makkelijker te begrijpen, kun je de initialisatiemethode die de Swift-compiler automatisch genereert eenvoudig zo zien:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Hier betekent `name: String = "Fang Junyu"`: als er bij het maken van de View geen `name` wordt doorgegeven, gebruik dan de standaardwaarde `"Fang Junyu"`; als er bij het maken van de View een nieuwe `name` wordt doorgegeven, gebruik dan de doorgegeven waarde.

Dat wil zeggen: **als er van buitenaf geen parameter wordt doorgegeven, wordt de standaardwaarde van de property gebruikt; als er van buitenaf een parameter wordt doorgegeven, wordt de doorgegeven waarde gebruikt.**

## Terug naar SettingItemView

Nu kijken we opnieuw naar SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

De structuur van deze View is vast.

De vaste onderdelen zijn onder andere:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

De verschillende onderdelen zijn onder andere:

```swift
icon
color
title
```

Daarom maken we van de verschillende inhoud properties en geven we die bij het maken van de View als parameters door.

Wanneer we verschillende instellingenitems maken, hoeven we alleen verschillende parameters door te geven:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")
SettingItemView(icon: "folder", color: Color.brown, title: "Map")
SettingItemView(icon: "music.note", color: Color.purple, title: "Muziek")
```

Zo kan dezelfde `SettingItemView` drie verschillende instellingenitems weergeven.

Dit is de meest voorkomende manier om een aangepaste View te gebruiken.

## Samenvatting

In deze les hebben we aangepaste View geleerd.

De kernrol van een aangepaste View is: **herhaalde View-code inkapselen, zodat deze opnieuw kan worden gebruikt.**

In dit voorbeeld is de structuur van de drie instellingenitems hetzelfde; alleen het pictogram, de kleur en de titel zijn verschillend.

Daarom hebben we een `SettingItemView` gemaakt:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Vervolgens geven we bij het gebruiken van deze View verschillende parameters door:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Instellingen")
```

Deze parameters gaan naar binnen in `SettingItemView`.

Op deze manier kunnen we met minder code Views maken die dezelfde structuur hebben, maar verschillende inhoud tonen.

Dit is ook een zeer gebruikelijke schrijfwijze in SwiftUI-ontwikkeling.
