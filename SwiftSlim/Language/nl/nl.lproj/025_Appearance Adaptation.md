# Uiterlijk aanpassen

In deze les leren we hoe je een interface aanpast aan lichte modus en donkere modus.

Op iPhone, iPad en Mac kunnen gebruikers de lichte modus of de donkere modus kiezen.

Wanneer het systeem overschakelt naar de donkere modus, veranderen bij veel apps ook de achtergrond, tekst en pictogramkleuren mee.

Bijvoorbeeld: overdag kan de interface een lichte achtergrond gebruiken, terwijl die 's nachts verandert in een donkere achtergrond.

![view](../../../Resource/025_view9.png)

Dit vermogen om de weergave van de interface automatisch aan te passen aan het systeemuiterlijk noemen we uiterlijkaanpassing.

## Uiterlijkaanpassing bekijken in Xcode

Voordat we uiterlijkaanpassing leren, bekijken we eerst hoe je in Xcode de lichte modus en donkere modus kunt voorvertonen.

Klik onderaan het `Canvas`-gebied op de knop `Device Settings` om het venster `Canvas Device Settings` te openen.

![canvas](../../../Resource/025_view.png)

In het venster kun je de instelling `Color Scheme` zien.

![canvas1](../../../Resource/025_view1.png)

Dit betekent:

- `Light Appearance` betekent lichte modus.
- `Dark Appearance` betekent donkere modus.

Via deze plek kunnen we het voorvertoningsuiterlijk wisselen en bekijken hoe de huidige interface eruitziet in lichte modus en donkere modus.

## Twee uiterlijken naast elkaar tonen

Als je de lichte modus en donkere modus tegelijk wilt bekijken, kun je de functie `Variants` gebruiken.

Klik onderaan het `Canvas`-gebied op de knop `Variants` en kies `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Na het kiezen toont `Canvas` tegelijk de voorvertoningen van de lichte modus en de donkere modus.

![canvas3](../../../Resource/025_view3.png)

Zo kun je de verschillen tussen de twee uiterlijken gemakkelijker vergelijken.

Eenvoudig gezegd:

Als je alleen tijdelijk wilt wisselen tussen lichte en donkere modus, kun je `Canvas Device Settings` gebruiken.

Als je beide uiterlijken tegelijk wilt bekijken, kun je `Color Scheme Variants` gebruiken.

## Views passen zich standaard aan het uiterlijk aan

In SwiftUI passen veel systeemviews zich standaard automatisch aan de lichte modus en donkere modus aan.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Licht")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("iets iets iets")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Weergaveresultaat:

![canvas](../../../Resource/025_view4.png)

Je kunt zien dat pictogrammen en titels in de lichte modus meestal donker worden weergegeven.

In de donkere modus worden pictogrammen en titels automatisch licht.

Dit komt doordat SwiftUI-views zoals `Text` en `Image` hun kleuren standaard aanpassen aan het systeemuiterlijk.

Met andere woorden: als we niet handmatig een vaste kleur opgeven, handelt SwiftUI een deel van de uiterlijkaanpassing voor ons af.

## Vaste kleuren wisselen niet automatisch

Let op: als we handmatig een vaste kleur opgeven, wisselt die niet automatisch tussen lichte modus en donkere modus.

Bijvoorbeeld:

```swift
Text("iets iets iets")
	.foregroundStyle(Color.gray)
```

De tekst hier is ingesteld op `Color.gray`, dus hij wordt altijd grijs weergegeven.

Nog een voorbeeld:

```swift
Text("Titel")
    .foregroundStyle(Color.white)
```

Deze code toont witte tekst in zowel lichte modus als donkere modus.

Als de achtergrond ook licht is, kan de witte tekst moeilijk leesbaar worden.

Daarom moet je bij uiterlijkaanpassing proberen om vaste kleuren zoals `Color.white` en `Color.black` niet zomaar hard te coderen.

In veel gevallen kun je beter eerst systeemsemantische stijlen gebruiken, zoals:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Dit betekent:

- `.primary` wordt meestal gebruikt voor primaire inhoud.
- `.secondary` wordt meestal gebruikt voor secundaire inhoud.

Ze passen hun weergave automatisch aan op basis van lichte modus en donkere modus.

## Andere inhoud tonen op basis van het uiterlijk

Soms willen we niet alleen dat kleuren veranderen, maar ook dat onder verschillende uiterlijken andere inhoud wordt getoond.

Bijvoorbeeld:

- Toon in de lichte modus een normaal lamp-pictogram.
- Toon in de donkere modus een oplichtend lamp-pictogram.
- Toon in de lichte modus `Licht` als titel.
- Toon in de donkere modus `Donker` als titel.

In dat geval moeten we bepalen of het huidige systeem in lichte modus of donkere modus staat.

In SwiftUI kunnen we de huidige uiterlijkmodus ophalen via de omgevingswaarde `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Volledige code:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Licht" : "Donker"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("iets iets iets")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Weergaveresultaat:

![view](../../../Resource/025_view5.png)

Uit de voorvertoning kun je zien dat dezelfde view onder verschillende uiterlijkmodi niet precies dezelfde inhoud weergeeft.

In de lichte modus toont `Image` het normale lamp-pictogram en toont de titel `Licht`.

In de donkere modus toont `Image` het oplichtende lamp-pictogram en toont de titel `Donker`.

Met andere woorden: de verandering hier is niet alleen een kleurverandering. Ook de pictogramnaam en de titeltekst zelf zijn veranderd.

Dit komt doordat we het pictogram en de titel niet rechtstreeks hard hebben gecodeerd in `body`. In plaats daarvan berekenen we andere inhoud op basis van `colorScheme`.

In deze code gebruiken we twee berekende eigenschappen:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Licht" : "Donker"
}
```

Wanneer `colorScheme` `.light` is, betekent dit dat de huidige modus de lichte modus is.

Wanneer `colorScheme` `.dark` is, betekent dit dat de huidige modus de donkere modus is.

Daarom kunnen we op basis van verschillende uiterlijkmodi verschillende pictogramnamen en titelteksten teruggeven.

Dit is ook een veelvoorkomend gebruik van berekende eigenschappen: op basis van de huidige toestand berekenen welke inhoud een view moet weergeven.

## @Environment begrijpen

Dit is de eerste keer dat we `@Environment` tegenkomen.

`@Environment` kun je begrijpen als: een waarde lezen uit de omgeving van SwiftUI.

Wanneer een app draait, levert het systeem allerlei omgevingsinformatie, zoals:

- Huidige taal
- Huidige uiterlijkmodus
- Huidige lay-outrichting
- Huidige instelling voor lettergrootte

Wanneer we de huidige uiterlijkmodus moeten ophalen, kunnen we `colorScheme` lezen:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Hier:

```swift
\.colorScheme
```

betekent dat de waarde `colorScheme` uit de omgeving wordt gelezen.

```swift
private var colorScheme
```

betekent dat de gelezen waarde wordt opgeslagen in de variabele `colorScheme`.

Je kunt de variabelenaam zelf kiezen. Je kunt bijvoorbeeld ook schrijven:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Zolang het voorafgaande `\.colorScheme` niet verandert, betekent dit dat je de huidige uiterlijkmodus leest.

## Twee veelvoorkomende waarden van colorScheme

`colorScheme` heeft meestal twee waarden:

```swift
.light
.dark
```

Ze betekenen:

- `.light`: lichte modus
- `.dark`: donkere modus

Bijvoorbeeld:

```swift
private var titleName: String {
    colorScheme == .light ? "Licht" : "Donker"
}
```

Deze code betekent:

Als de huidige modus de lichte modus is, is `colorScheme == .light` waar en wordt dus `"Licht"` teruggegeven.

Anders wordt `"Donker"` teruggegeven.

Dus in de lichte modus:

```swift
Text(titleName)
```

De weergegeven tekst is:

```swift
Licht
```

In de donkere modus is de weergegeven tekst:

```swift
Donker
```

Op deze manier kunnen we op basis van verschillende uiterlijken verschillende inhoud tonen.

## Voorbeeld van kleuraanpassing

Naast tekst en pictogrammen moeten we soms ook zelf kleuraanpassing verwerken.

Bijvoorbeeld:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Weergaveresultaat:

![view](../../../Resource/025_view6.png)

In deze code is de tekst wit en de achtergrond zwart.

In de lichte modus is de zwarte achtergrond duidelijk zichtbaar.

Maar in de donkere modus, als de hele interfaceachtergrond ook zwart is, gaat deze zwarte achtergrond op in de systeemachtergrond en lijkt hij minder duidelijk.

Op dat moment kunnen we de tekstkleur en achtergrondkleur wisselen op basis van de uiterlijkmodus:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Tekst")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Weergaveresultaat:

![view](../../../Resource/025_view7.png)

Nu gebruikt de lichte modus een zwarte achtergrond met witte tekst.

De donkere modus gebruikt een witte achtergrond met zwarte tekst.

Zo hebben tekst en achtergrond, ongeacht welk uiterlijk wordt gebruikt, een duidelijk contrast en kunnen gebruikers de inhoud goed zien.

## Assets gebruiken om kleuren aan te passen

Naast handmatig controleren met `colorScheme` kunnen we ook `Assets`-resourcekleuren gebruiken om ons aan te passen aan lichte modus en donkere modus.

Deze aanpak is geschikter voor het beheren van algemene kleuren in een app.

Zoek in het Xcode-project de resource-map `Assets`.

![assets](../../../Resource/025_color.png)

Open de map `Assets`, klik met de rechtermuisknop op een leeg gebied en kies `New Color Set` om een nieuwe kleurresource te maken.

![assets](../../../Resource/025_color1.png)

Hier maken we een kleur en noemen we die `redText`.

![assets](../../../Resource/025_color2.png)

Een kleurresource kan afzonderlijk kleuren instellen voor lichte modus en donkere modus.

![assets](../../../Resource/025_color3.png)

Nadat je het bijbehorende kleurgebied hebt geselecteerd, kun je de kleur wijzigen in de inspector aan de rechterkant.

Klik rechtsboven op de knop `Hide or show the Inspectors` om het inspectorgebied te openen.

Kies daarna `Show the Attributes inspector`, zoek onderaan `Show Color Panel` en open het kleurenpaneel.

![assets](../../../Resource/025_color4.png)

Klik op een kleur in het kleurenpaneel en het bijbehorende kleurgebied van `redText` verandert tegelijk mee.

Hier stellen we `redText` in op:

- Rood weergeven in lichte modus
- Groen weergeven in donkere modus

![assets](../../../Resource/025_color5.png)

Terug in SwiftUI-code kun je deze kleur zo gebruiken:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Hier:

```swift
Color("redText")
```

betekent dat de kleurresource met de naam `redText` uit `Assets` wordt gelezen.

Weergaveresultaat:

![assets](../../../Resource/025_view8.png)

Je kunt zien dat dezelfde `Color("redText")` in lichte modus en donkere modus verschillende kleuren weergeeft.

Dit laat zien dat `Assets`-kleuren zelf ook uiterlijkaanpassing ondersteunen.

## Verschil tussen colorScheme en Assets

Zowel `colorScheme` als `Assets` kunnen uiterlijkaanpassing realiseren, maar ze zijn geschikt voor verschillende scenario's.

Als je alleen tekstinhoud, afbeeldingsnamen of `SF Symbols`-namen wilt wisselen op basis van lichte modus en donkere modus, kun je `colorScheme` gebruiken.

Bijvoorbeeld:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Als een kleur vaak in de app wordt gebruikt, zoals een themakleur, kaartachtergrondkleur of tekstkleur, is het meer aan te raden om `Assets`-kleuren te gebruiken.

Dat komt doordat `Assets`-kleuren in meerdere views kunnen worden hergebruikt en later gemakkelijker te wijzigen zijn.

Bijvoorbeeld:

```swift
Color("redText")
```

Op deze manier hoef je alleen de kleur in `Assets` te wijzigen, en alle plekken die deze kleur gebruiken veranderen tegelijk mee.

## Samenvatting

In deze les hebben we uiterlijkaanpassing voor lichte modus en donkere modus geleerd.

Eerst hebben we geleerd hoe je verschillende uiterlijken kunt voorvertonen in Xcode's `Canvas`, en hoe je `Color Scheme Variants` kunt gebruiken om lichte modus en donkere modus tegelijk te bekijken.

Daarna hebben we geleerd dat SwiftUI-views zoals `Text` en `Image` hun kleuren standaard automatisch aanpassen aan het systeemuiterlijk.

Maar als we handmatig vaste kleuren opgeven, zoals `Color.white` of `Color.black`, wisselen deze kleuren niet automatisch.

Vervolgens hebben we `@Environment` en `colorScheme` geleerd:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Via `colorScheme` kunnen we bepalen of de huidige modus lichte modus of donkere modus is, en op basis van verschillende uiterlijken andere pictogrammen, tekst of kleuren tonen.

Tot slot hebben we `Assets`-kleuren geleerd.

`Assets`-kleuren kunnen afzonderlijk kleuren instellen voor lichte modus en donkere modus, waardoor ze geschikt zijn voor het beheren van algemene kleurresources in een app.

Uiterlijkaanpassing kan ervoor zorgen dat een app er zowel overdag als 's nachts beter uitziet, en kan ook problemen voorkomen zoals slecht leesbare tekst of onduidelijke achtergronden.

In echte ontwikkeling is het aan te raden om eerst SwiftUI's standaard aanpassingsgedrag en `Assets`-kleuren te gebruiken.

Wanneer je onder verschillende uiterlijken tekst, pictogrammen of afbeeldingen moet wisselen, of een klein aantal speciale weergave-effecten moet verwerken, gebruik dan pas `colorScheme` voor controle.

## Uitgebreide kennis: lettergrootte opgeven

Toen we eerder `font` leerden, gebruikten we enkele systeemlettertypestijlen:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Naast het gebruik van systeemlettertypestijlen zoals `.largeTitle` en `.callout`, kun je ook handmatig de lettergrootte opgeven.

Bijvoorbeeld:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Hier:

```swift
.font(.system(size: 100))
```

betekent dat de lettergrootte wordt ingesteld op `100 pt`.

Voor `SF Symbols`-pictogrammen beïnvloedt `font` ook de pictogramgrootte.

Dus als je een pictogram groter wilt weergeven, kun je de grootte opgeven met `.font(.system(size:))`.

Bijvoorbeeld:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Let op: hoewel het handmatig opgeven van een lettergrootte flexibeler is, wordt het voor gewone tekst niet aanbevolen om veel vaste lettergroottes te gebruiken.

Gebruik voor gewone tekst bij voorkeur systeemlettertypestijlen zoals `.title`, `.headline`, `.body` en `.caption`.

Zo past de interface zich beter aan verschillende apparaten en de lettergrootte-instellingen van de gebruiker aan.
