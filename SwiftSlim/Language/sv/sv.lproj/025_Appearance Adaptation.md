# Utseendeanpassning

I den här lektionen lär vi oss hur ett gränssnitt kan anpassas till ljust läge och mörkt läge.

På iPhone, iPad och Mac kan användaren välja ljust läge eller mörkt läge.

När systemet växlar till mörkt läge ändras ofta även bakgrund, text och ikonfärger i många appar.

Till exempel kan gränssnittet använda en ljus bakgrund på dagen och växla till en mörk bakgrund på natten.

![view](../../../Resource/025_view9.png)

Den här förmågan att automatiskt justera gränssnittets visning efter systemets utseende kallas utseendeanpassning.

## Förhandsvisa utseendeanpassning i Xcode

Innan vi lär oss utseendeanpassning ska vi först se hur man förhandsvisar ljust läge och mörkt läge i Xcode.

Längst ned i området `Canvas` klickar du på knappen `Device Settings` för att öppna popup-fönstret `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

I popup-fönstret kan du se inställningen `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Det betyder:

- `Light Appearance` betyder ljust läge.
- `Dark Appearance` betyder mörkt läge.

Här kan vi växla förhandsvisningens utseende och kontrollera hur det aktuella gränssnittet ser ut i ljust läge och mörkt läge.

## Visa två utseenden sida vid sida

Om du vill visa ljust läge och mörkt läge samtidigt kan du använda funktionen `Variants`.

Längst ned i området `Canvas` klickar du på knappen `Variants` och väljer `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

När du har valt det visar `Canvas` förhandsvisningar av ljust läge och mörkt läge samtidigt.

![canvas3](../../../Resource/025_view3.png)

Det gör det enklare att jämföra gränssnittsskillnaderna mellan de två utseendena.

Enkelt uttryckt:

Om du bara vill växla tillfälligt mellan ljust läge och mörkt läge kan du använda `Canvas Device Settings`.

Om du vill visa båda utseendena samtidigt kan du använda `Color Scheme Variants`.

## Vyer anpassas som standard efter utseendet

I SwiftUI anpassas många systemvyer automatiskt till ljust läge och mörkt läge som standard.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Ljust")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("något något något")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![canvas](../../../Resource/025_view4.png)

Som du kan se visas ikoner och rubriker vanligtvis mörkt i ljust läge.

I mörkt läge blir ikoner och rubriker automatiskt ljusa.

Det beror på att SwiftUI-vyer som `Text` och `Image` som standard justerar sina färger efter systemets utseende.

Med andra ord: om vi inte manuellt anger en fast färg hanterar SwiftUI en del av utseendeanpassningen åt oss.

## Fasta färger växlar inte automatiskt

Det är viktigt att notera att om vi manuellt anger en fast färg växlar den inte automatiskt mellan ljust läge och mörkt läge.

Till exempel:

```swift
Text("något något något")
	.foregroundStyle(Color.gray)
```

Texten här är inställd på `Color.gray`, så den visas alltid som grå.

Ett annat exempel:

```swift
Text("Rubrik")
    .foregroundStyle(Color.white)
```

Den här koden visar vit text i både ljust läge och mörkt läge.

Om bakgrunden också är ljus kan den vita texten bli svår att läsa.

När du anpassar ett gränssnitt till olika utseenden bör du därför försöka undvika att slentrianmässigt hårdkoda fasta färger som `Color.white` och `Color.black`.

I många fall kan du i första hand använda systemets semantiska stilar, till exempel:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Det betyder:

- `.primary` används vanligtvis för primärt innehåll.
- `.secondary` används vanligtvis för sekundärt innehåll.

De justerar automatiskt sin visning baserat på ljust läge och mörkt läge.

## Visa olika innehåll baserat på utseende

Ibland vill vi inte bara att färgerna ska ändras, utan också att olika innehåll ska visas i olika utseenden.

Till exempel:

- Visa en vanlig glödlampaikon i ljust läge.
- Visa en lysande glödlampaikon i mörkt läge.
- Visa `Ljust` som rubrik i ljust läge.
- Visa `Mörkt` som rubrik i mörkt läge.

I det här fallet behöver vi avgöra om det aktuella systemet är i ljust läge eller mörkt läge.

I SwiftUI kan vi hämta det aktuella utseendeläget genom miljövärdet `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Fullständig kod:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Ljust" : "Mörkt"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("något något något")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view5.png)

Från förhandsvisningsresultatet kan du se att samma vy inte visar exakt samma innehåll i olika utseendelägen.

I ljust läge visar `Image` den vanliga glödlampaikonen, och rubriken visar `Ljust`.

I mörkt läge visar `Image` den lysande glödlampaikonen, och rubriken visar `Mörkt`.

Med andra ord är ändringen här inte bara en färgändring. Själva ikonnamnet och rubriktexten har också ändrats.

Det beror på att vi inte hårdkodade ikonen och rubriken direkt i `body`. I stället beräknar vi olika innehåll baserat på `colorScheme`.

I den här koden använder vi två beräknade egenskaper:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Ljust" : "Mörkt"
}
```

När `colorScheme` är `.light` betyder det att det aktuella läget är ljust läge.

När `colorScheme` är `.dark` betyder det att det aktuella läget är mörkt läge.

Därför kan vi returnera olika ikonnamn och rubriktexter enligt olika utseendelägen.

Detta är också en vanlig användning av beräknade egenskaper: att beräkna vilket innehåll en vy behöver visa baserat på det aktuella tillståndet.

## Förstå @Environment

Det här är första gången vi stöter på `@Environment`.

`@Environment` kan förstås som att läsa ett värde från SwiftUI:s miljö.

När en app körs tillhandahåller systemet många typer av miljöinformation, till exempel:

- Aktuellt språk
- Aktuellt utseendeläge
- Aktuell layoutriktning
- Aktuell inställning för teckenstorlek

När vi behöver hämta det aktuella utseendeläget kan vi läsa `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Här:

```swift
\.colorScheme
```

betyder att värdet `colorScheme` läses från miljön.

```swift
private var colorScheme
```

betyder att det lästa värdet sparas i variabeln `colorScheme`.

Du kan själv bestämma variabelnamnet. Du kan till exempel också skriva:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Så länge det föregående `\.colorScheme` inte ändras betyder det att du läser det aktuella utseendeläget.

## Två vanliga värden för colorScheme

`colorScheme` har vanligtvis två värden:

```swift
.light
.dark
```

De betyder:

- `.light`: ljust läge
- `.dark`: mörkt läge

Till exempel:

```swift
private var titleName: String {
    colorScheme == .light ? "Ljust" : "Mörkt"
}
```

Den här koden betyder:

Om det aktuella läget är ljust läge är `colorScheme == .light` sant, och då returneras `"Ljust"`.

Annars returneras `"Mörkt"`.

Så i ljust läge:

```swift
Text(titleName)
```

Den visade texten är:

```swift
Ljust
```

I mörkt läge är den visade texten:

```swift
Mörkt
```

På det här sättet kan vi visa olika innehåll baserat på olika utseenden.

## Exempel på färganpassning

Förutom text och ikoner behöver vi ibland också hantera färganpassning själva.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view6.png)

I den här koden är texten vit och bakgrunden svart.

I ljust läge är den svarta bakgrunden ganska tydlig.

Men i mörkt läge, om hela gränssnittets bakgrund också är svart, kommer den svarta bakgrunden att smälta ihop med systembakgrunden och se mindre tydlig ut.

Vid det här läget kan vi växla textfärg och bakgrundsfärg enligt utseendeläget:

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
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view7.png)

Nu använder ljust läge en svart bakgrund med vit text.

Mörkt läge använder en vit bakgrund med svart text.

På det här sättet har text och bakgrund tydlig kontrast oavsett vilket utseende som används, och användarna kan se innehållet tydligt.

## Använd Assets för att anpassa färger

Förutom att manuellt kontrollera med `colorScheme` kan vi också använda resursfärger i `Assets` för att anpassa till ljust läge och mörkt läge.

Den här metoden passar bättre för att hantera gemensamma färger i en app.

I Xcode-projektet hittar du resursmappen `Assets`.

![assets](../../../Resource/025_color.png)

Öppna mappen `Assets`, högerklicka på ett tomt område och välj `New Color Set` för att skapa en ny färgresurs.

![assets](../../../Resource/025_color1.png)

Här skapar vi en färg och ger den namnet `redText`.

![assets](../../../Resource/025_color2.png)

En färgresurs kan ställa in färger separat för ljust läge och mörkt läge.

![assets](../../../Resource/025_color3.png)

När du har valt motsvarande färgområde kan du ändra färgen i inspektören till höger.

Klicka på knappen `Hide or show the Inspectors` i det övre högra hörnet för att öppna inspektörsområdet.

Välj sedan `Show the Attributes inspector`, hitta `Show Color Panel` längst ned och öppna färgpanelen.

![assets](../../../Resource/025_color4.png)

Klicka på en färg i färgpanelen, så ändras motsvarande färgområde för `redText` samtidigt.

Här ställer vi in `redText` till:

- Visa rött i ljust läge
- Visa grönt i mörkt läge

![assets](../../../Resource/025_color5.png)

Tillbaka i SwiftUI-koden kan du använda den här färgen så här:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Här:

```swift
Color("redText")
```

betyder att färgresursen med namnet `redText` läses från `Assets`.

Visningsresultat:

![assets](../../../Resource/025_view8.png)

Du kan se att samma `Color("redText")` visar olika färger i ljust läge och mörkt läge.

Detta visar att färger i `Assets` också själva stöder utseendeanpassning.

## Skillnaden mellan colorScheme och Assets

Både `colorScheme` och `Assets` kan implementera utseendeanpassning, men de passar för olika scenarier.

Om du bara behöver växla textinnehåll, bildnamn eller namn på `SF Symbols` enligt ljust läge och mörkt läge kan du använda `colorScheme`.

Till exempel:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Om färgen används ofta i appen, till exempel som temafärg, kortbakgrundsfärg eller textfärg, rekommenderas det mer att använda färger i `Assets`.

Det beror på att färger i `Assets` kan återanvändas i flera vyer och är enklare att ändra senare.

Till exempel:

```swift
Color("redText")
```

På det här sättet behöver du bara ändra färgen i `Assets`, så ändras alla platser som använder den här färgen samtidigt.

## Sammanfattning

I den här lektionen lärde vi oss utseendeanpassning för ljust läge och mörkt läge.

Först lärde vi oss hur man förhandsvisar olika utseenden i Xcodes `Canvas`, och hur man använder `Color Scheme Variants` för att visa ljust läge och mörkt läge samtidigt.

Sedan lärde vi oss att SwiftUI-vyer som `Text` och `Image` automatiskt anpassar sina färger efter systemets utseende som standard.

Men om vi manuellt anger fasta färger som `Color.white` eller `Color.black`, växlar dessa färger inte automatiskt.

Därefter lärde vi oss `@Environment` och `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Genom `colorScheme` kan vi avgöra om det aktuella läget är ljust läge eller mörkt läge, och visa olika ikoner, texter eller färger enligt olika utseenden.

Slutligen lärde vi oss om färger i `Assets`.

Färger i `Assets` kan ställa in färger separat för ljust läge och mörkt läge, vilket gör dem lämpliga för att hantera gemensamma färgresurser i en app.

Utseendeanpassning kan göra att en app ser bättre ut både på dagen och på natten, och kan också förhindra problem som oläsbar text eller otydliga bakgrunder.

I verklig utveckling rekommenderas det att i första hand använda SwiftUI:s standardanpassning och färger i `Assets`.

När du behöver växla text, ikoner, bilder eller hantera ett mindre antal särskilda visningseffekter i olika utseenden kan du sedan använda `colorScheme` för kontrollen.

## Fördjupning: ange teckenstorlek

När vi tidigare lärde oss `font` använde vi några systemtypsnittsstilar:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Förutom att använda systemtypsnittsstilar som `.largeTitle` och `.callout` kan du också ange teckenstorleken manuellt.

Till exempel:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Här:

```swift
.font(.system(size: 100))
```

betyder att teckenstorleken ställs in på `100 pt`.

För `SF Symbols`-ikoner påverkar `font` också ikonstorleken.

Så om du vill att en ikon ska visas större kan du ange storleken med `.font(.system(size:))`.

Till exempel:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Det är viktigt att notera att även om manuell teckenstorlek är mer flexibel rekommenderas det inte att använda fasta teckenstorlekar i stor utsträckning för vanlig text.

För vanlig text bör du i första hand använda systemtypsnittsstilar som `.title`, `.headline`, `.body` och `.caption`.

Det gör det lättare att anpassa till olika enheter och användarens teckenstorleksinställningar.
