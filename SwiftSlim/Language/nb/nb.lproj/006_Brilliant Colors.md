# Strålende farger

I denne leksjonen skal vi lære vanlige visuelle modifikatorer i SwiftUI, inkludert:

- farger
- forgrunnsfarge
- bakgrunnsfarge
- forskyvning
- gjennomsiktighet
- uskarphet

Vi skal også lære om `Safe Area`（sikkerhetsområde）。

Disse modifikatorene brukes til å kontrollere hvordan visninger ser ut, slik at grensesnittet blir tydeligere og mer lagdelt.

## Farger

I SwiftUI kan vi angi fargen på tekst.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` betyr blå, og er egentlig en forkortet skrivemåte for `Color.blue`（typeinferens）。

Vanlige farger inkluderer:

```
.black
.green
.yellow
.pink
.gray
...
```

Disse er alle statiske egenskaper på `Color`。

![Color](../../RESOURCE/006_color.png)

Du kan forstå `Color` som en fargetype, mens `.blue` og `.red` er konkrete farger innen den typen.

### `Color`-visning

I SwiftUI kan `Color` også vises som en egen visning.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Denne koden lager en rød firkant på `100×100`。

Du kan også la hele skjermen vise én bestemt farge:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Etter kjøring vil du se at det røde ikke dekker hele skjermen. Topp og bunn på iPhone er fortsatt hvite. Her kommer `Safe Area` inn.

## `Safe Area`（sikkerhetsområde）

`Safe Area` er området systemet reserverer for å unngå at innhold blir dekket, inkludert:

1. statuslinjen øverst（tid, batteri）
2. Home-indikatoren nederst
3. området med notch eller Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI begrenser som standard innhold til sikkerhetsområdet, så visninger strekker seg ikke helt ut til skjermkanten.

### Ignorer `Safe Area`

Hvis vi vil at fargen skal fylle hele skjermen, kan vi bruke `ignoresSafeArea`：

```swift
Color.red
    .ignoresSafeArea()
```

Eller `edgesIgnoringSafeArea`：

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Da vil visningen strekke seg over hele skjermen.

Merk at `edgesIgnoringSafeArea` er en eldre skrivemåte. Fra iOS 14 anbefales det å bruke `ignoresSafeArea`。

## Forgrunnsfarge

### Modifikatoren `foregroundStyle`

I tidligere leksjoner lærte vi å bruke `foregroundStyle` for å angi farge.

For eksempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` er et nyere stylesystem som støtter farger, gradienter, materialer og mer.

![Color](../../RESOURCE/006_color2.png)

### Modifikatoren `foregroundColor`

`foregroundColor` kan også brukes til å angi farge:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Bruken ligner på `foregroundStyle`。

I de nyeste versjonene av Xcode vil Xcode antyde at `foregroundColor` kan bli faset ut i fremtidige iOS-versjoner, så det anbefales å bruke `foregroundStyle` først.

## Bakgrunn

Hvis vi vil gi en visning en bakgrunnsfarge, kan vi bruke `background`：

```swift
background(.red)
```

For eksempel, gi tekst en bakgrunnsfarge:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Når vi markerer tekst i apper som Word eller Chrome, kan vi se lignende bakgrunnseffekter.

![Color](../../RESOURCE/006_color16.png)

Hvis vi vil gjøre bakgrunnen større, må vi kombinere den med `padding`：

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Her må vi være oppmerksomme på en viktig regel:

SwiftUI-modifikatorer bygger visninger fra topp til bunn. Modifikatorer som står senere, virker på resultatet av det som står før.

Så:

```swift
.padding()
.background()
```

betyr at bakgrunnen omslutter visningen etter at innvendig marg er lagt til.

Hvis rekkefølgen snus:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

vil ikke bakgrunnen bli større, fordi den ikke omslutter `padding` som kommer etterpå.

## Eksempel - firkantmutter med fire hjørner

Nå lager vi en enkel visning av en firkantmutter med fire hjørner.

![Color](../../RESOURCE/006_color8.png)

Lag først en hvit firkant på `50 × 50`：

```swift
Color.white
    .frame(width: 50, height: 50)
```

Hvis vi vil gjøre den rund, kan vi bruke `cornerRadius`：

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Når hjørneradiusen er halvparten av bredde og høyde, blir formen en sirkel.

Legg nå til en blå bakgrunn:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Den nye `padding` øker ytterområdet, og `background` tegner blått på det ytterområdet.

Dermed er effekten av en firkantmutter ferdig.

### En annen måte å tenke på

I tillegg til å bruke bakgrunnsfarge for å lage denne effekten, kan vi også bruke `ZStack`。

Vi lærte tidligere at `ZStack` kan brukes til overlappende sortering. En firkantmutter kan også forstås som en sirkel og et rektangel som overlapper hverandre.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` legger visningene oppå hverandre i rekkefølge, og visningen som legges til senere, vises øverst.

## Eksempel - to overlappende sirkler

Mange ikoner er bygd opp av enkle former som overlapper hverandre, for eksempel to sirkler.

![Color](../../RESOURCE/006_color14.png)

Lag først to sirkler:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Siden vi vil at de to sirklene skal overlappe, bruker vi `ZStack`：

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

På dette tidspunktet overlapper de to like store sirklene helt.

Vi vil at de bare skal overlappe delvis, ikke dekke hverandre helt. Da kan vi bruke `offset` for å lage en forskyvning.

## Forskyvning

`offset` endrer bare hvor visningen tegnes, og påvirker ikke layoutberegningen i overordnet visning.

Brukes slik:

```swift
.offset(x:y:)
```

`x` er forskyvning i horisontal retning, og `y` er forskyvning i vertikal retning.

Positive verdier betyr forskyvning mot høyre / ned, og negative verdier betyr forskyvning mot venstre / opp.

Bruk `offset` for å la de to sirklene overlappe delvis:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Den røde sirkelen har ikke flyttet seg i layouten, men tegneposisjonen er flyttet `25` punkter mot venstre. Derfor får de to sirklene en visuell effekt av delvis overlapping.

## Gjennomsiktighet

I SwiftUI brukes `opacity` til å angi gjennomsiktigheten til en visning.

Grunnleggende bruk:

```swift
.opacity(0.5)
```

Parameterområdet for `opacity` er `0.0` til `1.0`，der:

- `0` betyr helt gjennomsiktig
- `1` betyr ugjennomsiktig

Vi kan bruke `opacity` til å justere gjennomsiktigheten på den oransje sirkelen:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Når `opacity` for den oransje sirkelen settes til `0.8`，blir ugjennomsiktigheten `80%`。Når de to sirklene overlapper, oppstår det en blanding av fargene i overlappingsområdet.

## Uskarphet

I SwiftUI kan vi bruke `blur` for å lage en uskarp effekt:

```swift
.blur(radius:10)
```

`radius` definerer uskarphetsradiusen. Jo større verdien er, desto tydeligere blir uskarpheten.

Vi kan legge til uskarphet på de to sirklene:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Til slutt kan vi se to svært uskarpe sirkler.

## Oppsummering

Denne leksjonen dreide seg om vanlige visuelle modifikatorer i SwiftUI, og vi lærte hvordan man kan kontrollere farge, plassering og visuelle effekter i en visning med modifikatorer.

Gjennom konkrete eksempler så vi den faktiske effekten av ulike visuelle modifikatorer i grensesnittet, og fikk også en forståelse av sikkerhetsområdet.

Dette er svært grunnleggende modifikatorer. Hvis vi øver mer på dem og bruker dem oftere, blir det lettere å kontrollere grensesnitteffekter tydeligere i faktisk utvikling.

### Øvelse etter timen

- legg til gjennomsiktighet og uskarphet på et bilde
- lag tre sirkler med ulik gjennomsiktighet som overlapper hverandre
- opprett et bakgrunnsbilde som fyller hele skjermen og ignorerer sikkerhetsområdet
- bruk `offset` til å justere plasseringen til flere visninger

Målet med øvelsene er ikke å huske API-ene utenat, men å observere forholdet mellom visuelle endringer og layoutoppførsel.
