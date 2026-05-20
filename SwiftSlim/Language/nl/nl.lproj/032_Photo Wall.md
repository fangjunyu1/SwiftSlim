# Fotogalerij

In deze les maken we een fotogalerijpagina.

![view](../../../Resource/032_view13.png)

In dit voorbeeld herhalen we de kennis over `extension`, `self` en instanties, en leren we de veelgebruikte `Shape`-vormen in SwiftUI kennen.

Met deze kennis kunnen we gewone afbeeldingen bijsnijden tot verschillende stijlen, zoals cirkels, afgeronde rechthoeken, capsulevormen en ellipsen, en kunnen we rand-effecten aan foto's toevoegen.

In deze les gebruiken we enkele nieuwe kennispunten: `Shape`, `clipShape`, `strokeBorder` en `overlay`.

Daarbij wordt `clipShape` gebruikt om de vorm van een view bij te snijden, `strokeBorder` om een vormrand te tekenen, en `overlay` om een nieuwe view boven op de huidige view te plaatsen.

## Afbeeldingsmateriaal

Voordat we beginnen, moeten we enkele afbeeldingen voorbereiden.

Je kunt je eigen foto's gebruiken, of de voorbeeldafbeeldingen gebruiken die in deze les worden aangeboden.

De voorbeeldfoto's in deze les komen van de website [Pixabay](https://pixabay.com/):

[Landschap](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Vos](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Gebouw](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Bloem](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Zwaan](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Nadat je de afbeeldingen hebt gedownload, voeg je ze toe aan de resource-map `Assets` en geef je ze achtereenvolgens de namen `1`, `2`, `3`, `4` en `5`.

![assets](../../../Resource/032_view17.png)

Zo kunnen we de afbeeldingen in SwiftUI weergeven met `Image("1")`, `Image("2")` enzovoort.

## Foto's weergeven

Eerst geven we in `ContentView` 5 foto's weer:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Weergave-effect:

![view](../../../Resource/032_view.png)

In deze code gebruiken we `ScrollView` om de fotolijst scrollbaar weer te geven, en gebruiken we `VStack` om meerdere afbeeldingen van boven naar beneden te rangschikken.

Elke afbeelding gebruikt `.resizable()`, `.scaledToFit()` en `.frame(width: 300)` om het weergave-effect van de afbeelding in te stellen, zodat de afbeelding kan schalen, de verhouding volledig behoudt en een beperkte breedte krijgt.

De `.padding(.vertical, 100)` op `VStack` wordt gebruikt om de boven- en onderruimte te vergroten, zodat de eerste en laatste foto niet te dicht tegen de schermranden staan.

De laatste `.ignoresSafeArea()` betekent dat de scrollweergave de veilige zone negeert, zodat de foto's tijdens het scrollen tot aan de boven- en onderkant van het scherm kunnen doorlopen en de pagina vollediger wordt weergegeven.

Op dit moment gebruiken de 5 afbeeldingen echter allemaal dezelfde modifiers:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Wanneer we herhaalde code zien, kunnen we overwegen om een `extension` te gebruiken om deze te organiseren.

## Afbeeldingsstijl organiseren met extension

We kunnen `Image` uitbreiden met een speciale methode voor de fotogalerij:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Hier breiden we het type `Image` uit met een methode `photoGalleryStyle`.

Deze methode bevat de eerder herhaald gebruikte `.resizable()`, `.scaledToFit()` en `.frame(width: 300)`. Met andere woorden: ze bundelt de code voor het schalen van de afbeelding, proportionele weergave en breedte-instelling.

Na het gebruik van deze uitbreiding kan de oorspronkelijke afbeeldingscode:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

worden vereenvoudigd tot:

```swift
Image("1")
    .photoGalleryStyle()
```

Zo hoeft elke afbeelding alleen `.photoGalleryStyle()` aan te roepen om dezelfde fotogalerijstijl toe te passen. De code wordt beknopter en is later ook eenvoudiger centraal aan te passen.

## self begrijpen

In de uitbreidingsmethode hebben we `self` geschreven:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Hier betekent `self` de huidige afbeeldingsinstantie die deze methode aanroept.

Bijvoorbeeld:

```swift
Image("1")
    .photoGalleryStyle()
```

In deze code wordt `photoGalleryStyle()` aangeroepen door `Image("1")`, dus de `self` binnen de methode betekent deze afbeelding `Image("1")`.

Je kunt het eenvoudig begrijpen als: wie deze methode aanroept, is wat `self` vertegenwoordigt.

Let erop dat SwiftUI-modifiers voortdurend nieuwe view-resultaten teruggeven. Daarom geeft `photoGalleryStyle()` een gewijzigde view terug, en niet simpelweg de oorspronkelijke `Image` zelf.

## Fotovormen

Nu kunnen de foto's al normaal worden weergegeven. Deze foto's zijn standaard echter rechthoekig, wat er vrij gewoon uitziet.

Als je de foto's alleen afgeronde hoeken wilt geven, kun je direct `.cornerRadius()` gebruiken:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Weergave-effect:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` betekent dat er een afgeronde hoek van `20 pt` aan de afbeelding wordt toegevoegd. Voor gewone afbeeldingen met afgeronde hoeken is deze schrijfwijze al voldoende.

Maar `.cornerRadius()` kan alleen afgeronde-hoek-effecten verwerken en is geschikt voor gewone afgeronde afbeeldingen. Als we foto's in meer verschillende vormen willen veranderen, is alleen deze modifier niet genoeg.

Op dat moment moeten we `Shape` in SwiftUI gebruiken. `Shape` kan verschillende grafische vormen voorstellen, en in combinatie met `clipShape` kunnen we een afbeelding bijsnijden tot de overeenkomstige vorm.

## Shape leren kennen

In SwiftUI betekent `Shape` een grafische vorm. Net als `View` is het een zeer veelgebruikt type in SwiftUI.

Veelgebruikte `Shape`-typen zijn cirkel, rechthoek, afgeronde rechthoek, capsulevorm en ellips. Om het uiterlijk van verschillende vormen intuïtiever te bekijken, krijgen de volgende voorbeelden voor elke vorm een andere kleur en grootte.

In deze voorbeelden wordt `.fill()` gebruikt om de vorm met kleur te vullen, en `.frame()` om de weergavegrootte van de vorm in te stellen. De kleuren worden alleen gebruikt om de verschillende vormen te onderscheiden en zijn niet de vaste kleuren van de vormen zelf.

### Circle cirkel

`Circle` betekent een cirkel. Het wordt vaak gebruikt voor avatars, ronde knoppen, ronde afbeeldingen en andere interface-effecten.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rechthoek

`Rectangle` betekent een rechthoek. Het is een van de meest basale vormen en kan ook worden gebruikt om achtergronden, verdeelde gebieden of gewone randen te maken.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle afgeronde rechthoek

`RoundedRectangle` betekent een afgeronde rechthoek. `cornerRadius` wordt gebruikt om de grootte van de afgeronde hoeken in te stellen.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule capsulevorm

`Capsule` betekent een capsulevorm. De twee uiteinden zijn boogvormig en het wordt vaak gebruikt voor capsuleknoppen, tag-achtergronden en andere interface-effecten.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellips

`Ellipse` betekent een ellips. Het lijkt op `Circle`, maar wanneer breedte en hoogte verschillend zijn, wordt het als een ellips weergegeven.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Uit deze voorbeelden blijkt dat `Shape` zelf direct als grafische vorm kan worden weergegeven. Hierna gebruiken we deze `Shape`-typen samen met `clipShape` om foto's bij te snijden, zodat ze in verschillende vormen worden weergegeven.

## Foto's bijsnijden met clipShape

Nu kunnen we `clipShape` gebruiken om foto's in verschillende vormen bij te snijden.

Bijvoorbeeld: de eerste foto bijsnijden tot een cirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Deze code betekent: eerst een afbeelding weergeven en vervolgens `Circle()` gebruiken om deze tot een cirkel bij te snijden.

![view](../../../Resource/032_view2.png)

De basisschrijfwijze van `clipShape` is:

```swift
.clipShape(vorm)
```

Voeg `.clipShape(...)` achter de view toe en vul tussen de haakjes de grafische vorm in waarin je wilt bijsnijden.

Bijvoorbeeld:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nu snijden we de 5 foto's elk bij tot een andere vorm:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Weergave-effect:

![view](../../../Resource/032_view8.png)

Daarbij ligt het effect na bijsnijden met `Rectangle()` dicht bij een gewone rechthoekige foto, dus de visuele verandering is niet duidelijk. Het wordt vooral gebruikt ter vergelijking met andere vormen.

Nu zijn de foto's niet langer alleen gewone rechthoeken, maar hebben ze verschillende vormen.

## Fotoranden toevoegen

Als we een rand aan een ronde foto willen toevoegen, denken we misschien aan het gebruik van `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Maar meestal krijgen we dan geen ronde rand, maar een rechthoekige rand.

![view](../../../Resource/032_view9.png)

Dit komt doordat `border` een rand toevoegt volgens het rechthoekige gebied van de view, en niet volgens de vorm die na `clipShape` is bijgesneden.

Daarom kunnen we `border` niet direct gebruiken als we een ronde rand willen.

## Vormranden tekenen met strokeBorder

In SwiftUI kan `strokeBorder` interne randen tekenen voor deze veelgebruikte `Shape`-typen.

Bijvoorbeeld: een ronde rand tekenen:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Deze code betekent: teken een bruine rand voor `Circle`, met een randbreedte van `10 pt`.

![view](../../../Resource/032_view12.png)

Hier moet je erop letten dat `strokeBorder` niet rechtstreeks een rand aan de foto toevoegt, maar een rand tekent voor de vorm `Circle()`.

Met andere woorden: deze code levert alleen een onafhankelijke ronde rand op, en heeft nog geen relatie met de foto.

Als we deze ronde rand boven op de foto willen weergeven, moeten we verder `overlay` gebruiken om de rand over de foto heen te leggen.

## Randen stapelen met overlay

`overlay` is een view-modifier waarmee je een nieuwe view boven op de huidige view kunt stapelen.

De basisstructuur kan zo worden begrepen:

```swift
Huidige view
    .overlay {
        Overlay-view
    }
```

In dit voorbeeld is de huidige view de foto die al tot een cirkel is bijgesneden:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

De nieuwe view die we erop willen stapelen, is een ronde rand:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Daarom kunnen we de foto en de rand combineren:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Hier betekent `overlay` dat er een nieuwe view boven op de huidige view wordt gelegd.

In `overlay` wordt de rand gestapeld volgens het weergavegebied van de huidige foto, dus het is niet nodig om apart een `frame` in te stellen. Zolang de randvorm overeenkomt met de bijsnijdvorm, kan de rand goed aansluiten op de foto.

![view](../../../Resource/032_view10.png)

Het uiteindelijke effect is dat er een ronde rand boven op de ronde foto ligt.

Vergeleken met `ZStack` is `overlay` geschikter voor dit soort scenario waarin je “een decoratie aan de huidige view toevoegt”. De foto is het hoofdonderwerp en de rand is slechts een extra effect, dus `overlay` gebruiken is duidelijker.

## Fotogalerij afronden

Nu voegen we aan elke foto de overeenkomstige vorm en rand toe:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Weergave-effect:

![view](../../../Resource/032_view13.png)

Zo is een eenvoudige fotogalerijpagina voltooid.

Op deze pagina gebruiken we `ScrollView` om scrollbare weergave te realiseren, `Image` om foto's weer te geven, `clipShape` om fotovormen bij te snijden, en `overlay` en `strokeBorder` om randen toe te voegen.

## Volledige code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Samenvatting

In deze les hebben we een fotogalerijpagina voltooid.

![view](../../../Resource/032_view13.png)

In dit voorbeeld gebruikten we eerst `Image` om foto's weer te geven. Daarna breidden we `Image` via `extension` uit met een methode `photoGalleryStyle`, waarmee we herhaalde afbeeldingsstijlcode konden organiseren.

Vervolgens leerden we veelgebruikte `Shape`-typen in SwiftUI kennen, zoals `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` en `Ellipse`. Deze vormen kunnen niet alleen direct worden weergegeven, maar ook samen met `clipShape` worden gebruikt om views bij te snijden.

Bijvoorbeeld:

```swift
.clipShape(Circle())
```

betekent dat de view tot een cirkel wordt bijgesneden.

Tot slot gebruikten we `overlay` en `strokeBorder` om randen met de overeenkomstige vorm aan foto's toe te voegen. Let erop dat `border` meestal een rand tekent volgens het rechthoekige gebied van de view. Als je wilt dat de rand een cirkel, capsulevorm of ellips volgt, is het geschikter om dezelfde `Shape` eroverheen te leggen.

Door deze les hebben we niet alleen het fotogalerij-effect voltooid, maar ook de veelgebruikte combinatie van `Shape`, `clipShape`, `strokeBorder` en `overlay` in interfaces begrepen.

## Oefeningen na de les

### 1. Een fotogalerij-achtergrond toevoegen

Voeg een achtergrondafbeelding op volledig scherm toe aan de fotogalerijpagina.

Vereiste: de achtergrondafbeelding kan het hele scherm vullen en de veilige zone negeren.

### 2. Verlooprand

Wijzig de bestaande eenkleurige randen in lineaire verloopranden.

Je kunt proberen `LinearGradient` te gebruiken om rijkere randeffecten te realiseren.

### 3. Gesimuleerde fotolijst

Zoek op internet naar enkele echte fotolijststijlen en probeer `overlay` te gebruiken om afbeeldingslijsten over de foto's heen te leggen, zodat de foto's meer lijken op echte fotolijsten.

Weergave-effect van de oefening:

![button](../../../Resource/032_view15.jpeg)

### 4. Een afgeronde knoprand realiseren

In echte ontwikkeling gebruiken knoppen vaak randen met afgeronde rechthoeken.

Probeer een afgeronde knop te maken en gebruik `RoundedRectangle` en `strokeBorder` om een afgeronde rand aan de knop toe te voegen.

Weergave-effect van de oefening:

![button](../../../Resource/032_view14.png)

### Denkvraag

Als je geen eenkleurige rand en ook geen verlooprand wilt gebruiken, maar wilt dat de rand een bepaald patroon-effect toont, hoe zou je dat dan kunnen realiseren?

Je kunt proberen informatie op te zoeken en meer te leren over gerelateerde toepassingen zoals `overlay`, `mask` of `ImagePaint`.

Weergave-effect van de oefening:

![button](../../../Resource/032_view16.png)
