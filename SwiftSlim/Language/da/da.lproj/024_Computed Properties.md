# Beregnede egenskaber

I denne lektion lærer vi primært om beregnede egenskaber.

Beregnede egenskaber bruges til at beregne et nyt resultat ud fra eksisterende data. De kan beregne talværdier, og de kan også beregne indhold, som skal vises i SwiftUI-visninger.

For eksempel:

```swift
let a = 10
let b = 20
let c = a + b
```

Her repræsenterer `c` resultatet af at lægge `a` og `b` sammen.

I almindelig kode er denne måde at skrive på meget almindelig.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: I trykhændelsen for `Button` kan der udføres almindelig Swift-kode.

Men hvis vi skriver lignende kode direkte i egenskaberne i en SwiftUI-visning, støder vi på et problem.

For eksempel:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Denne kode giver en fejl.

Det ser ud, som om `a` og `b` allerede står før `c`, så værdien af `c` tilsyneladende kan beregnes.

Men i en strukturs egenskabserklæringer kan denne skrivemåde ikke bruges direkte.

## Hvorfor c ikke direkte kan beregne a + b

Fordi `a`, `b` og `c` ikke er midlertidige konstanter inde i en knaps trykhændelse, men egenskaber i visningen `ContentView`.

Inde i knappens trykhændelse kan denne kode udføres normalt:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Fordi efter at knappen er trykket, udføres koden i rækkefølge. Først oprettes `a`, så oprettes `b`, og til sidst beregnes `c` med `a + b`.

Men når egenskaber erklæres inde i en visning, er situationen anderledes:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Her er `a`, `b` og `c` alle egenskaber i visningen `ContentView`.

Når visningen `ContentView` oprettes, skal Swift først forberede disse egenskaber. For at sikre at oprettelsesprocessen er sikker, tillader Swift ikke, at standardværdien for en instanslagret egenskab direkte læser andre instansegenskaber i den samme instans.

Derfor giver denne linje en fejl:

```swift
let c = a + b
```

Det kan forstås enkelt sådan: **når egenskaber erklæres inde i en visning, kan man ikke direkte bruge én almindelig egenskab til at beregne en anden almindelig egenskab.**

En egenskab, der direkte gemmer en værdi, kaldes en "lagret egenskab". For at gøre det lettere at forstå kan vi midlertidigt tænke på den som en almindelig egenskab.

For eksempel:

```swift
let a = 10
```

`a` gemmer `10`.

```swift
let b = 20
```

`b` gemmer `20`.

Men:

```swift
let c = a + b
```

Her er `c` ikke en værdi, der er skrevet direkte, men noget vi ønsker at beregne gennem `a + b`.

I denne type situation, hvor vi "får et resultat ud fra eksisterende data", er en beregnet egenskab mere passende.

Det kan ændres til:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Her er `c` en beregnet egenskab.

```swift
var c: Int {
    return a + b
}
```

Det betyder: **når `c` skal bruges, læses `a` og `b` først da, og resultatet af `a + b` returneres.**

For eksempel:

```swift
Text("c: \(c)")
```

Når `Text` viser `c`, aktiveres beregningen af `c` først der.

## Hvad er en beregnet egenskab?

En beregnet egenskab ligner en variabel, men den gemmer ikke selv data.

For eksempel:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Her er `c` en beregnet egenskab.

Den gemmer ikke en fast værdi som en almindelig egenskab, men hver gang `c` læses, udfører den koden i `{}` igen og returnerer beregningsresultatet.

Det kan forstås sådan:

```swift
var c: Int {
    return a + b
}
```

Når `c` skal bruges, beregnes `a + b`.

Derfor passer beregnede egenskaber til denne situation: **et resultat behøver ikke at blive gemt separat, men kan beregnes ud fra eksisterende data.**

## Grundlæggende skrivemåde

En beregnet egenskab indeholder normalt tre dele:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarer med `var`

```swift
var c
```

En beregnet egenskab skal deklareres med `var`; `let` kan ikke bruges.

Fordi en beregnet egenskab ikke er en fast gemt værdi, men et resultat der beregnes dynamisk, hver gang den læses.

### 2. Angiv returtypen

```swift
var c: Int
```

En beregnet egenskab skal angive den type, den returnerer.

Her returnerer `c` til sidst et heltal, så typen er `Int`.

### 3. Brug {} til at skrive beregningslogikken

```swift
{
    return a + b
}
```

Inde i `{}` står beregningslogikken; her returneres `a + b`.

## Nøgleordet return

En beregnet egenskab skal returnere et resultat.

For eksempel:

```swift
var c: Int {
    return a + b
}
```

Her betyder `return`: returnér resultatet af beregningen `a + b`.

Hvis den beregnede egenskab kun indeholder ét udtryk, der direkte producerer resultatet, kan `return` udelades:

```swift
var c: Int {
    a + b
}
```

Men hvis den beregnede egenskab indeholder flere linjer kode, skal `return` bruges til tydeligt at returnere resultatet.

For eksempel:

```swift
var totalPriceText: String {
    let total = count * price
    return "I alt: \(total) $"
}
```

Her er beregningsprocessen delt i to trin.

Første trin, beregn først den samlede pris:

```swift
let total = count * price
```

Andet trin, sæt den samlede pris sammen som tekst og returnér den:

```swift
return "I alt: \(total) $"
```

Hvis vi fjerner `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "I alt: \(total) $"
}
```

Denne kode giver en fejl.

Årsagen er: **denne beregnede egenskab indeholder allerede flere linjer kode, og Swift kan ikke længere automatisk afgøre, hvilken linje der er det endelige resultat, der skal returneres.**

Derfor kan `return` udelades, når en beregnet egenskab kun har én resultatlinje.

```swift
var c: Int {
    a + b
}
```

Når en beregnet egenskab har flere linjer kode, anbefales det at skrive `return` tydeligt.

```swift
var totalPriceText: String {
    let total = count * price
    return "I alt: \(total) $"
}
```

## Forskellen mellem beregnede og almindelige egenskaber

Almindelige egenskaber gemmer data.

```swift
var c = 30
```

Her gemmer `c` en konkret værdi: `30`.

Beregnede egenskaber gemmer ikke data.

```swift
var c: Int {
    a + b
}
```

Her gemmer `c` ikke `30`. Den giver kun en beregningsmåde.

Når `c` læses, udfører Swift:

```swift
a + b
```

og returnerer derefter beregningsresultatet.

Derfor passer beregnede egenskaber til situationer, hvor et resultat beregnes ud fra andre data.

## body er også en beregnet egenskab

Efter at have lært om beregnede egenskaber kan vi igen forstå et af de mest almindelige kodestykker i SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Her er `body` også en beregnet egenskab.

Den deklareres med `var`:

```swift
var body
```

Den har en returtype:

```swift
some View
```

Inde i dens `{}` returneres indholdet af en SwiftUI-visning:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Derfor kan `body` forstås sådan: når SwiftUI skal vise denne visning, læser det `body` og opretter brugerfladen ud fra det indhold, som `body` returnerer.

Hvis vi skriver `return`, kan det forstås sådan:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Men i SwiftUI udelader vi normalt `return` og skriver direkte:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Når `@State`-data ændrer sig, læser SwiftUI `body` igen og opdaterer brugerfladen efter de nye data.

For eksempel:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("antal: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Efter at knappen trykkes, ændres `count`.

```swift
count += 1
```

Efter at `count` ændres, beregner SwiftUI `body` igen, så teksten i brugerfladen opdateres også.

```swift
Text("antal: \(count)")
```

Det er også grunden til, at brugerfladen i SwiftUI automatisk kan opdateres efter dataændringer.

### Det anbefales ikke at skrive komplekse beregninger i body

Da `body` er en beregnet egenskab, kan den blive læst og beregnet igen mange gange.

For eksempel:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("tal: \(num)")
            Text("navn: \(name)")
        }
    }
}
```

Når `name` ændres, beregner SwiftUI `body` igen.

På det tidspunkt udføres koden inde i `body` også igen, og `num` oprettes også igen.

```swift
let num = 10
```

`num` i dette eksempel er meget enkel, så påvirkningen er ikke stor.

Men hvis der udføres komplekse beregninger i `body`, som filtrering af store datamængder, sortering, billedbehandling osv., kan det påvirke brugerfladens flydende oplevelse.

Derfor bør `body` i SwiftUI primært være ansvarlig for at beskrive brugerfladens struktur.

Enkle midlertidige data kan skrives inde i `body`.

Komplekse beregninger kan overvejes placeret i beregnede egenskaber uden for `body`, i metoder eller i separat databehandling.

## Eksempel: antal og samlet pris

Nedenfor forstår vi beregnede egenskaber gennem et enkelt eksempel.

Antag at en gulerod koster 2 $, brugeren kan trykke på knapper for at ændre købsantallet, og brugerfladen skal vise den samlede pris.

Måden at beregne den samlede pris på:

```
antal * enhedspris
```

Hvis vi bruger en almindelig variabel til at gemme den samlede pris, bliver det lidt besværligt.

Fordi hver gang antallet ændres, skal den samlede pris opdateres manuelt.

En bedre måde er at bruge en beregnet egenskab:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("pris: \(price) $")
                Text("antal: \(count)")
                Text("samlet pris: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../Resource/024_view.png)

I dette eksempel:

```swift
@State private var count = 1
```

`count` repræsenterer antallet af gulerødder. Når knappen trykkes, ændres `count`.

```swift
private let price = 2
```

`price` repræsenterer gulerodens enhedspris. Her er det en fast værdi, så vi bruger `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` repræsenterer den samlede pris.

Den behøver ikke at blive gemt separat, fordi den samlede pris altid kan beregnes med `count * price`.

Når `count` er `1`:

```swift
totalPrice = 1 * 2
```

Visningsresultatet er:

```swift
samlet pris: 2 $
```

Efter at trykke på knappen `+` bliver `count` til `2`.

Når `totalPrice` læses igen på dette tidspunkt, beregnes den igen:

```swift
totalPrice = 2 * 2
```

Visningsresultatet er:

```swift
samlet pris: 4 $
```

Det er formålet med beregnede egenskaber: dynamisk at beregne nye resultater ud fra eksisterende data.

## Beregnede egenskaber kan bruges til vurdering

Beregnede egenskaber kan ikke kun beregne talværdier, men også returnere vurderingsresultater.

For eksempel når vi ønsker, at det mindste antal skal være 1.

Når antallet allerede er 1, bør knappen `-` ikke fortsætte med at mindske.

Vi kan tilføje en beregnet egenskab:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Komplet kode:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("pris: \(price) $")
                Text("antal: \(count)")
                Text("samlet pris: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../Resource/024_view1.png)

Her:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Denne kode betyder, om der i øjeblikket kan mindskes.

Når `count` er større end `1`:

```swift
canDecrease == true
```

betyder det, at der kan mindskes.

Når `count` er lig med `1`:

```swift
canDecrease == false
```

betyder det, at der ikke kan mindskes yderligere.

### Betinget vurdering i knappen

I knappen bruges:

```swift
if canDecrease {
    count -= 1
}
```

Kun når `canDecrease` vurderes til `true`, kan `count` mindskes.

### Styring af visningens forgrundsfarve

Vi kan også bruge `canDecrease` til at styre knappens forgrundsfarve:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Her bruges den ternære operator:

```swift
canDecrease ? Color.primary : Color.gray
```

Betydningen af denne kode er: hvis `canDecrease` er `true`, bruges `Color.primary` som forgrundsfarve; hvis `canDecrease` er `false`, bruges `Color.gray` som forgrundsfarve.

`Color.primary` er en systemsemantisk farve, som SwiftUI leverer, og den repræsenterer hovedtekstfarven i den aktuelle brugerflade.

I lys tilstand er `Color.primary` normalt tæt på sort; i mørk tilstand er `Color.primary` normalt tæt på hvid.

Derfor er fordelen ved at bruge `Color.primary`, at den automatisk tilpasser sig lys og mørk tilstand.

### Styring af visningens deaktiverede tilstand

`disabled` bruges til at styre, om en visning er i deaktiveret tilstand:

```swift
.disabled(!canDecrease)
```

Når `disabled` er `false`, kan visningen trykkes.

Når `disabled` er `true`, er visningen deaktiveret og kan ikke trykkes.

Her gør brugen af `canDecrease` som betingelse koden lettere at forstå.

Når vi ser `canDecrease`, ved vi, at den betyder "om der i øjeblikket kan mindskes yderligere".

### Supplerende forklaring: hvorfor er der to vurderinger?

I knappen `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Her bruges både `.disabled(!canDecrease)` og `if canDecrease` inde i knappen.

`.disabled(!canDecrease)` har ansvaret for at deaktivere knappen i brugerfladen, så brugeren ikke kan trykke på den.

`if canDecrease` har ansvaret for at kontrollere igen, før koden udføres, og kun når der kan mindskes, udføres `count -= 1`.

Dette er dobbelt beskyttelse. I reel udvikling kan den indre vurdering udelades, hvis knappen allerede er deaktiveret; men i et undervisningseksempel bevarer vi den, så rollen for `canDecrease` bliver tydeligere.

## Opsummering

I denne lektion lærte vi primært om beregnede egenskaber.

En beregnet egenskab gemmer ikke værdien direkte, men beregner et resultat ud fra eksisterende data, når den læses.

For eksempel:

```swift
var c: Int {
    a + b
}
```

Her behøver `c` ikke at blive gemt separat, fordi den kan beregnes med `a + b`.

En beregnet egenskab skal deklareres med `var`, og returtypen skal angives.

```swift
var canDecrease: Bool {
    count > 1
}
```

Beregnede egenskaber kan ikke kun returnere talværdier, men også vurderingsresultater, tekstindhold og endda indhold fra SwiftUI-visninger.

I denne lektion lærte vi også om `return`.

`return` betyder at returnere et resultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "I alt: \(total) $"
}
```

Hvis en beregnet egenskab kun indeholder ét udtryk, der direkte producerer resultatet, kan `return` udelades.

```swift
var totalPrice: Int {
    count * price
}
```

Derudover lærte vi også om `Color.primary` og `disabled`.

`Color.primary` er en systemsemantisk farve i SwiftUI, og den justerer automatisk visningseffekten efter lys og mørk tilstand.

```swift
.foregroundStyle(Color.primary)
```

`disabled` bruges til at styre, om en visning er deaktiveret.

```swift
.disabled(true)
```

Betyder deaktiveret, kan ikke trykkes.

```swift
.disabled(false)
```

Betyder tilgængelig, kan trykkes.

Derfor er beregnede egenskaber meget almindelige i SwiftUI. De kan hjælpe os med at organisere beregningsresultater, vurderingsbetingelser og vist indhold mere klart.
