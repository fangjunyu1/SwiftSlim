# Utseendetilpasning

I denne leksjonen skal vi lære hvordan vi tilpasser et grensesnitt til lys modus og mørk modus.

På iPhone, iPad og Mac kan brukere velge lys modus eller mørk modus.

Når systemet bytter til mørk modus, endres ofte bakgrunn, tekst og ikonfarger i mange apper tilsvarende.

For eksempel kan grensesnittet ha lys bakgrunn om dagen og bytte til mørk bakgrunn om natten.

![view](../../../Resource/025_view9.png)

Denne evnen til automatisk å justere grensesnittets visning etter systemets utseende kalles utseendetilpasning.

## Forhåndsvis utseendetilpasning i Xcode

Før vi lærer utseendetilpasning, ser vi først hvordan vi kan forhåndsvise lys modus og mørk modus i Xcode.

Nederst i `Canvas`-området klikker du på `Device Settings`-knappen for å åpne popup-vinduet `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

I popup-vinduet kan du se innstillingen `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Dette betyr:

- `Light Appearance` betyr lys modus.
- `Dark Appearance` betyr mørk modus.

Vi kan bytte forhåndsvisningsutseende her og se hvordan det gjeldende grensesnittet vises i lys modus og mørk modus.

## Vis to utseender side om side

Hvis du vil se lys modus og mørk modus samtidig, kan du bruke funksjonen `Variants`.

Nederst i `Canvas`-området klikker du på `Variants`-knappen og velger `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Etter at du har valgt dette, viser `Canvas` forhåndsvisninger av lys modus og mørk modus samtidig.

![canvas3](../../../Resource/025_view3.png)

Dette gjør det enklere å sammenligne forskjellene i grensesnittet mellom de to utseendene.

Enkelt sagt:

Hvis du bare vil bytte midlertidig mellom lys modus og mørk modus, kan du bruke `Canvas Device Settings`.

Hvis du vil se begge utseendene samtidig, kan du bruke `Color Scheme Variants`.

## Visninger tilpasser seg utseendet som standard

I SwiftUI tilpasser mange systemvisninger seg automatisk til lys modus og mørk modus som standard.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Lys")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("noe noe noe")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![canvas](../../../Resource/025_view4.png)

Som du kan se, vises ikoner og titler vanligvis mørke i lys modus.

I mørk modus blir ikoner og titler automatisk lyse.

Dette er fordi SwiftUI-visninger som `Text` og `Image` som standard justerer fargene sine etter systemets utseende.

Med andre ord: Hvis vi ikke manuelt angir en fast farge, håndterer SwiftUI en del av utseendetilpasningen for oss.

## Faste farger byttes ikke automatisk

Det er viktig å merke seg at hvis vi manuelt angir en fast farge, byttes den ikke automatisk mellom lys modus og mørk modus.

For eksempel:

```swift
Text("noe noe noe")
	.foregroundStyle(Color.gray)
```

Teksten her er satt til `Color.gray`, så den vises alltid i grått.

Et annet eksempel:

```swift
Text("Tittel")
    .foregroundStyle(Color.white)
```

Denne koden viser hvit tekst i både lys modus og mørk modus.

Hvis bakgrunnen også er lys, kan den hvite teksten bli vanskelig å lese.

Når du gjør utseendetilpasning, bør du derfor prøve å unngå å hardkode faste farger som `Color.white` og `Color.black` uten videre.

I mange tilfeller kan du først bruke systemets semantiske stiler, for eksempel:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Dette betyr:

- `.primary` brukes vanligvis til hovedinnhold.
- `.secondary` brukes vanligvis til sekundært innhold.

De justerer visningen automatisk basert på lys modus og mørk modus.

## Vis forskjellig innhold basert på utseende

Noen ganger vil vi ikke bare at fargene skal endre seg, men også at forskjellig innhold skal vises under forskjellige utseender.

For eksempel:

- Vis et vanlig lyspæreikon i lys modus.
- Vis et lysende lyspæreikon i mørk modus.
- Vis `Lys` som tittel i lys modus.
- Vis `Mørk` som tittel i mørk modus.

Da må vi avgjøre om det gjeldende systemet er i lys modus eller mørk modus.

I SwiftUI kan vi hente gjeldende utseendemodus via miljøverdien `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Fullstendig kode:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Lys" : "Mørk"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("noe noe noe")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/025_view5.png)

Fra forhåndsvisningen kan du se at den samme visningen ikke viser nøyaktig samme innhold i forskjellige utseendemoduser.

I lys modus viser `Image` det vanlige lyspæreikonet, og tittelen viser `Lys`.

I mørk modus viser `Image` det lysende lyspæreikonet, og tittelen viser `Mørk`.

Med andre ord er endringen her ikke bare en fargeendring. Selve ikonnavnet og tittelteksten har også endret seg.

Dette er fordi vi ikke hardkodet ikonet og tittelen direkte i `body`, men beregnet forskjellig innhold basert på `colorScheme`.

I denne koden bruker vi to beregnede egenskaper:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Lys" : "Mørk"
}
```

Når `colorScheme` er `.light`, betyr det at gjeldende modus er lys modus.

Når `colorScheme` er `.dark`, betyr det at gjeldende modus er mørk modus.

Dermed kan vi returnere forskjellige ikonnavn og titteltekster etter forskjellige utseendemoduser.

Dette er også en vanlig bruk av beregnede egenskaper: å beregne innholdet en visning må vise, basert på gjeldende tilstand.

## Forstå @Environment

Dette er første gang vi møter `@Environment`.

`@Environment` kan forstås som å lese en verdi fra SwiftUI-miljøet.

Når en app kjører, gir systemet mye miljøinformasjon, for eksempel:

- Gjeldende språk
- Gjeldende utseendemodus
- Gjeldende layoutretning
- Gjeldende innstilling for skriftstørrelse

Når vi trenger å hente gjeldende utseendemodus, kan vi lese `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Her:

```swift
\.colorScheme
```

betyr å lese verdien `colorScheme` fra miljøet.

```swift
private var colorScheme
```

betyr å lagre verdien som ble lest, i variabelen `colorScheme`.

Du kan selv bestemme variabelnavnet. For eksempel kan du også skrive:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Så lenge den foregående `\.colorScheme` ikke endres, betyr det at du leser gjeldende utseendemodus.

## To vanlige verdier for colorScheme

`colorScheme` har vanligvis to verdier:

```swift
.light
.dark
```

De betyr:

- `.light`: lys modus
- `.dark`: mørk modus

For eksempel:

```swift
private var titleName: String {
    colorScheme == .light ? "Lys" : "Mørk"
}
```

Denne koden betyr:

Hvis gjeldende modus er lys modus, er `colorScheme == .light` sann, så den returnerer `"Lys"`.

Ellers returnerer den `"Mørk"`.

I lys modus:

```swift
Text(titleName)
```

vises teksten som:

```swift
Lys
```

I mørk modus vises teksten som:

```swift
Mørk
```

På denne måten kan vi vise forskjellig innhold basert på forskjellige utseender.

## Eksempel på fargetilpasning

I tillegg til tekst og ikoner må vi noen ganger også håndtere fargetilpasning selv.

For eksempel:

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

Visningsresultat:

![view](../../../Resource/025_view6.png)

I denne koden er teksten hvit, og bakgrunnen er svart.

I lys modus er den svarte bakgrunnen ganske tydelig.

Men i mørk modus, hvis hele grensesnittbakgrunnen også er svart, smelter denne svarte bakgrunnen sammen med systembakgrunnen og ser mindre tydelig ut.

Da kan vi bytte tekstfarge og bakgrunnsfarge etter utseendemodus:

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

Visningsresultat:

![view](../../../Resource/025_view7.png)

Nå bruker lys modus svart bakgrunn og hvit tekst.

Mørk modus bruker hvit bakgrunn og svart tekst.

På denne måten har tekst og bakgrunn tydelig kontrast uansett hvilket utseende som brukes, og brukerne kan se innholdet klart.

## Bruk Assets til å tilpasse farger

I tillegg til å sjekke manuelt med `colorScheme`, kan vi også bruke ressursfarger i `Assets` til å tilpasse oss lys modus og mørk modus.

Denne metoden passer bedre for å administrere vanlige farger i en app.

I Xcode-prosjektet finner du ressursmappen `Assets`.

![assets](../../../Resource/025_color.png)

Åpne `Assets`-mappen, høyreklikk på et tomt område, og velg `New Color Set` for å opprette en ny fargeressurs.

![assets](../../../Resource/025_color1.png)

Her oppretter vi en farge og gir den navnet `redText`.

![assets](../../../Resource/025_color2.png)

En fargeressurs kan angi separate farger for lys modus og mørk modus.

![assets](../../../Resource/025_color3.png)

Etter at du har valgt det tilsvarende fargeområdet, kan du endre fargen i inspektøren til høyre.

Klikk på `Hide or show the Inspectors`-knappen øverst til høyre for å åpne inspektørområdet.

Velg deretter `Show the Attributes inspector`, finn `Show Color Panel` nederst, og åpne fargepanelet.

![assets](../../../Resource/025_color4.png)

Klikk på en farge i fargepanelet, så endres det tilsvarende fargeområdet for `redText` samtidig.

Her setter vi `redText` til:

- Vis rødt i lys modus
- Vis grønt i mørk modus

![assets](../../../Resource/025_color5.png)

Tilbake i SwiftUI-koden kan du bruke denne fargen slik:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Her:

```swift
Color("redText")
```

betyr å lese fargeressursen med navnet `redText` fra `Assets`.

Visningsresultat:

![assets](../../../Resource/025_view8.png)

Du kan se at den samme `Color("redText")` viser forskjellige farger i lys modus og mørk modus.

Dette viser at `Assets`-farger også støtter utseendetilpasning.

## Forskjellen mellom colorScheme og Assets

Både `colorScheme` og `Assets` kan implementere utseendetilpasning, men de passer til forskjellige scenarier.

Hvis du bare trenger å bytte tekstinnhold, bildenavn eller navn på `SF Symbols` etter lys modus og mørk modus, kan du bruke `colorScheme`.

For eksempel:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Hvis fargen brukes ofte i appen, for eksempel en temafarge, kortbakgrunnsfarge eller tekstfarge, anbefales det mer å bruke `Assets`-farger.

Dette er fordi `Assets`-farger kan gjenbrukes i flere visninger og er enklere å endre senere.

For eksempel:

```swift
Color("redText")
```

På denne måten trenger du bare å endre fargen i `Assets`, så endres alle steder som bruker denne fargen, samtidig.

## Oppsummering

I denne leksjonen lærte vi utseendetilpasning for lys modus og mørk modus.

Først lærte vi hvordan vi kan forhåndsvise forskjellige utseender i Xcodes `Canvas`, og hvordan vi kan bruke `Color Scheme Variants` til å se lys modus og mørk modus samtidig.

Deretter lærte vi at SwiftUI-visninger som `Text` og `Image` automatisk tilpasser fargene sine etter systemets utseende som standard.

Men hvis vi manuelt angir faste farger som `Color.white` eller `Color.black`, byttes ikke disse fargene automatisk.

Deretter lærte vi `@Environment` og `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Gjennom `colorScheme` kan vi avgjøre om gjeldende modus er lys modus eller mørk modus, og vise forskjellige ikoner, tekster eller farger etter forskjellige utseender.

Til slutt lærte vi om `Assets`-farger.

`Assets`-farger kan angi separate farger for lys modus og mørk modus, og passer derfor til å administrere vanlige fargeressurser i en app.

Utseendetilpasning kan gjøre at en app ser bedre ut både om dagen og om natten, og kan også forhindre problemer som tekst som er vanskelig å lese eller bakgrunner som er uklare.

I faktisk utvikling anbefales det å først bruke SwiftUIs standard tilpasningsatferd og `Assets`-farger.

Når du må bytte tekst, ikoner eller bilder, eller håndtere et lite antall spesielle visningseffekter under forskjellige utseender, kan du bruke `colorScheme` til å gjøre vurderingen.

## Utvidet kunnskap: Angi skriftstørrelse

Da vi tidligere lærte `font`, brukte vi noen systemskriftstiler:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

I tillegg til å bruke systemskriftstiler som `.largeTitle` og `.callout`, kan du også angi skriftstørrelsen manuelt.

For eksempel:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Her:

```swift
.font(.system(size: 100))
```

betyr å sette skriftstørrelsen til `100 pt`.

For `SF Symbols`-ikoner påvirker `font` også ikonstørrelsen.

Så hvis du vil at et ikon skal vises større, kan du angi størrelsen med `.font(.system(size:))`.

For eksempel:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Det er viktig å merke seg at selv om manuell angivelse av skriftstørrelse er mer fleksibel, anbefales det ikke å bruke faste skriftstørrelser mye for vanlig tekst.

For vanlig tekst bør du først bruke systemskriftstiler som `.title`, `.headline`, `.body` og `.caption`.

Dette gjør det enklere å tilpasse seg ulike enheter og brukerens skriftinnstillinger.
