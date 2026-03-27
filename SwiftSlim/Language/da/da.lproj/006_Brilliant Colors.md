# Strålende farver

I denne lektion lærer vi almindelige visuelle modifiers i SwiftUI, herunder:

- Farver
- Forgrundsfarve
- Baggrundsfarve
- Forskydning
- Gennemsigtighed
- Sløring

Vi lærer også om `Safe Area`.

Disse modifiers bruges til at styre et views visuelle udtryk og gøre interfacet mere tydeligt og lagdelt.

## Farver

I SwiftUI kan man sætte tekstens farve.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` betyder blå. Det er i praksis en forkortet form af `Color.blue` gennem typeinferens.

Almindelige farver omfatter:

```
.black
.green
.yellow
.pink
.gray
...
```

Disse er alle statiske egenskaber på `Color`.

![Color](../../RESOURCE/006_color.png)

Du kan tænke på `Color` som en farvetype, og `.blue`, `.red` osv. som konkrete farver inden for den type.

### Color-visning

I SwiftUI kan `Color` også vises som en selvstændig visning.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Denne kode genererer en rød firkant på `100 × 100`.

Vi kan også lade hele interfacet blive vist i en bestemt farve:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Når den køres, kan vi se, at den røde farve ikke fylder hele skærmen. Toppen og bunden af iPhone er stadig hvide, og her kommer `Safe Area` ind i billedet.

## Safe Area

`Safe Area` er det område, som systemet reserverer for at undgå, at indhold bliver dækket. Det omfatter:

1. Statuslinjen øverst med tid og batteri

2. Home-indikatoren nederst

3. Området med notch eller Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI begrænser som standard indhold til det sikre område, så visninger ikke strækker sig helt ud til skærmens kant.

### Ignorér Safe Area

Hvis du vil have farven til at fylde hele skærmen, kan du bruge `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Eller `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Så vil visningen strække sig over hele skærmen.

Det er værd at bemærke, at `edgesIgnoringSafeArea` er en ældre skrivemåde. Siden iOS 14 anbefales `ignoresSafeArea`.

## Forgrundsfarve

### foregroundStyle-modifier

I tidligere lektioner har vi allerede lært at bruge `foregroundStyle` til at sætte farve.

For eksempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` er det nyere stil-system og understøtter farver, gradienter, materialer osv.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor-modifier

`foregroundColor` kan også bruges til at sætte farve:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Den bruges på samme måde som `foregroundStyle`.

I nyere versioner af Xcode vil Xcode ofte vise, at `foregroundColor` muligvis udfases i fremtidige iOS-versioner. Derfor anbefales det at prioritere `foregroundStyle`.

## Baggrund

Hvis du vil tilføje en baggrundsfarve til en visning, kan du bruge `background`:

```swift
background(.red)
```

For eksempel kan vi tilføje baggrundsfarve til tekst:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Når vi markerer tekst i apps som Word eller Chrome, kan vi se en lignende baggrundseffekt.

![Color](../../RESOURCE/006_color16.png)

Hvis vi vil gøre baggrunden større, skal vi kombinere den med `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Her skal man lægge mærke til en vigtig regel:

SwiftUI-modifiers bygger visninger op fra top til bund. En modifier, der skrives senere, virker på resultatet af det, der kom før.

Derfor betyder:

```swift
.padding()
.background()
```

at baggrunden omslutter visningen efter, at der er tilføjet indre afstand.

Hvis rækkefølgen vendes om:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

så bliver baggrunden ikke større, fordi baggrunden ikke omslutter den efterfølgende `padding`.

## Eksempel - firedobbelt møtrik

Nu laver vi en enkel visning, der ligner en firedobbelt møtrik.

![Color](../../RESOURCE/006_color8.png)

Lad os først lave en hvid firkant på `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Hvis vi vil gøre den rund, kan vi bruge `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Når radius er lig med halvdelen af bredde og højde, bliver formen en cirkel.

Tilføj nu en blå baggrund:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Den nye `padding` gør det ydre område større, og `background` tegner blå farve bag dette ydre område.

Nu har vi lavet effekten af en firedobbelt møtrik.

### En anden tilgang

Ud over at bruge baggrundsfarve til at opnå samme effekt kan vi også bruge `ZStack`.

Vi lærte tidligere, at `ZStack` bruges til overlejret sortering. En firedobbelt møtrik kan også forstås som en cirkel og et rektangel, der ligger oven på hinanden.

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

`ZStack` lægger visninger oven på hinanden i rækkefølge, og den sidst tilføjede visning ligger øverst.

## Eksempel - to overlappende cirkler

Mange ikoner består af simple former, der overlapper, for eksempel to overlappende cirkler.

![Color](../../RESOURCE/006_color14.png)

Lad os først oprette to cirkler:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Fordi vi vil lade de to cirkler overlappe, bruger vi et `ZStack`-layout:

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

På dette tidspunkt overlapper de to lige store cirkler fuldstændigt.

Vi vil have dem til kun at overlappe delvist i stedet for at dække hinanden helt. Derfor kan vi bruge `offset` til at skabe en forskydningseffekt.

## Forskydning

`offset` ændrer kun visningens tegnede position og påvirker ikke beregningen af layoutet i den overordnede container.

Brug:

```swift
.offset(x:y:)
```

`x` er forskydningen i vandret retning, og `y` er forskydningen i lodret retning.

Positive værdier betyder forskydning mod højre eller nedad, mens negative værdier betyder forskydning mod venstre eller opad.

Brug `offset` til at lade de to cirkler overlappe delvist:

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

Den røde cirkels position i layoutet ændres ikke, men dens tegnede position flyttes `25` punkter mod venstre. Derfor opstår en delvis overlapning.

## Gennemsigtighed

I SwiftUI bruges `opacity` til at sætte et views gennemsigtighed.

Grundlæggende brug:

```swift
.opacity(0.5)
```

Parameteren for `opacity` ligger fra `0.0` til `1.0`, hvor:

- `0` betyder helt gennemsigtig
- `1` betyder ikke-gennemsigtig

Vi kan bruge `opacity` til at sætte gennemsigtigheden på den orange cirkel:

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

Når den orange cirkel sættes til `opacity(0.8)`, betyder det en opacitet på `80 %`. Når de to cirkler overlapper, vil det overlappende område vise en blanding af farverne.

## Sløring

I SwiftUI kan man bruge `blur` til at tilføje sløring:

```swift
.blur(radius:10)
```

`radius` definerer sløringsradius, og jo større tallet er, desto tydeligere bliver sløringen.

Vi kan tilføje sløring til de to cirkler:

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

Til sidst kan vi se to meget slørede cirkler.

## Opsummering

Denne lektion handlede om almindelige visuelle modifiers i SwiftUI, og vi lærte, hvordan man styrer et views farve, position og visuelle effekt gennem modifiers.

Gennem konkrete eksempler kunne vi se, hvordan forskellige visuelle modifiers virker i et interface, og vi fik også en forståelse af `Safe Area`.

Det er alle meget grundlæggende modifiers. Hvis vi øver os mere med dem, bliver det lettere at styre effekten af interfacet mere præcist i reel udvikling.

### Øvelser efter lektionen

- Tilføj gennemsigtighed og sløring til et billede
- Lav tre cirkler med forskellig gennemsigtighed, som overlapper
- Opret et baggrundsbillede, der fylder hele skærmen og ignorerer `Safe Area`
- Brug `offset` til at justere positionen på flere visninger

Formålet med øvelserne er ikke blot at huske API'er, men at observere forholdet mellem visuelle ændringer og layoutadfærd.
