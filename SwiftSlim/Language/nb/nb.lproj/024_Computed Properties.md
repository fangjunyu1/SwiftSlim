# Beregnet egenskap

I denne leksjonen skal vi hovedsakelig lære om beregnede egenskaper.

En beregnet egenskap brukes til å beregne et nytt resultat basert på data som allerede finnes. Den kan beregne tallverdier, men også innhold som skal vises i en SwiftUI-visning.

For eksempel:

```swift
let a = 10
let b = 20
let c = a + b
```

Her betyr `c` resultatet etter at `a` og `b` er lagt sammen.

I vanlig kode er denne måten å skrive på svært vanlig.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tips: I klikkhendelsen til `Button` kan man kjøre vanlig Swift-kode.

Men hvis lignende kode skrives direkte i egenskapene til en SwiftUI-visning, oppstår det et problem.

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

Denne koden vil gi en feil.

Ved første øyekast ser det ut som `a` og `b` allerede er skrevet før `c`, og at verdien til `c` derfor burde kunne beregnes.

Men når egenskaper deklareres i en struct, kan denne skrivemåten ikke brukes direkte.

## Hvorfor kan ikke c beregnes direkte som a + b?

Fordi `a`, `b` og `c` ikke er midlertidige konstanter i en klikkhendelse for en knapp. De er egenskaper i visningen `ContentView`.

I en klikkhendelse for en knapp kan denne koden kjøres normalt:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Det er fordi koden kjøres i rekkefølge etter at knappen er klikket. Først opprettes `a`, deretter opprettes `b`, og til slutt beregnes `c` med `a + b`.

Men når egenskaper deklareres inne i en visning, er situasjonen annerledes:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Her er `a`, `b` og `c` alle egenskaper i visningen `ContentView`.

Når `ContentView`-visningen opprettes, må Swift først klargjøre disse egenskapene. For å sikre at opprettelsesprosessen er trygg, tillater ikke Swift at standardverdien til en lagret instansegenskap direkte leser andre instansegenskaper i samme instans.

Derfor vil denne linjen gi en feil:

```swift
let c = a + b
```

Enkelt sagt: **Når egenskaper deklareres inne i en visning, kan man ikke bruke én vanlig egenskap direkte til å beregne en annen vanlig egenskap.**

Denne typen egenskap, som lagrer en verdi direkte, kalles en “lagret egenskap”. For å gjøre det enklere å forstå, kan vi foreløpig se på den som en vanlig egenskap.

For eksempel:

```swift
let a = 10
```

`a` lagrer `10`.

```swift
let b = 20
```

`b` lagrer `20`.

Men:

```swift
let c = a + b
```

Her er `c` ikke en fast verdi som er skrevet direkte. Den er ment å bli beregnet med `a + b`.

I slike tilfeller, der man “får et resultat basert på eksisterende data”, passer en beregnet egenskap bedre.

Koden kan endres slik:

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

Her er `c` en beregnet egenskap.

```swift
var c: Int {
    return a + b
}
```

Det betyr: **Når `c` skal brukes, leses `a` og `b`, og resultatet av `a + b` returneres.**

For eksempel:

```swift
Text("c: \(c)")
```

Når `Text` viser `c`, utløses beregningen av `c`.

## Hva er en beregnet egenskap?

En beregnet egenskap ser ut som en variabel, men den lagrer ikke data selv.

For eksempel:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Her er `c` en beregnet egenskap.

Den lagrer ikke en fast verdi slik en vanlig egenskap gjør. Hver gang `c` leses, kjøres koden i `{}` på nytt, og det beregnede resultatet returneres.

Det kan forstås slik:

```swift
var c: Int {
    return a + b
}
```

Når `c` trengs, beregnes `a + b`.

Derfor passer beregnede egenskaper i denne situasjonen: **Et resultat trenger ikke å lagres separat, fordi det kan beregnes fra data som allerede finnes.**

## Grunnleggende skrivemåte

En beregnet egenskap består vanligvis av tre deler:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklareres med `var`

```swift
var c
```

En beregnet egenskap må deklareres med `var`, ikke `let`.

Det er fordi en beregnet egenskap ikke er en fast lagret verdi, men et resultat som beregnes dynamisk hver gang den leses.

### 2. Angi returtype

```swift
var c: Int
```

En beregnet egenskap må angi returtype.

Her returnerer `c` til slutt et heltall, derfor er typen `Int`.

### 3. Skriv beregningslogikken i {}

```swift
{
    return a + b
}
```

I `{}` skrives beregningslogikken. Her returneres `a + b`.

## Nøkkelordet return

En beregnet egenskap må returnere et resultat.

For eksempel:

```swift
var c: Int {
    return a + b
}
```

Her betyr `return`: returner resultatet av beregningen `a + b`.

Hvis den beregnede egenskapen bare har ett uttrykk som direkte lager resultatet, kan `return` utelates:

```swift
var c: Int {
    a + b
}
```

Men hvis en beregnet egenskap inneholder flere linjer kode, må `return` brukes for tydelig å returnere resultatet.

For eksempel:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Her er beregningsprosessen delt i to trinn.

Første trinn er å beregne totalprisen:

```swift
let total = count * price
```

Andre trinn er å sette totalprisen inn i en tekst og returnere den:

```swift
return "Total：\(total) $"
```

Hvis `return` fjernes:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

vil denne koden gi en feil.

Årsaken er: **Denne beregnede egenskapen inneholder allerede flere linjer kode, og Swift kan ikke automatisk avgjøre hvilken linje som er det endelige resultatet som skal returneres.**

Så når en beregnet egenskap bare har ett uttrykk som lager resultatet, kan `return` utelates.

```swift
var c: Int {
    a + b
}
```

Når en beregnet egenskap inneholder flere linjer kode, anbefales det å skrive `return` tydelig.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Forskjellen mellom beregnede egenskaper og vanlige egenskaper

Vanlige egenskaper lagrer data.

```swift
var c = 30
```

Her lagrer `c` en konkret verdi: `30`.

Beregnede egenskaper lagrer ikke data.

```swift
var c: Int {
    a + b
}
```

Her lagrer ikke `c` `30`. Den gir bare en måte å beregne verdien på.

Når `c` leses, kjører Swift:

```swift
a + b
```

Deretter returneres det beregnede resultatet.

Derfor passer beregnede egenskaper når et resultat skal beregnes ut fra andre data.

## body er også en beregnet egenskap

Etter å ha lært om beregnede egenskaper kan vi forstå denne vanlige SwiftUI-koden på nytt:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Her er `body` også en beregnet egenskap.

Den deklareres med `var`:

```swift
var body
```

Den har en returtype:

```swift
some View
```

Innholdet som returneres i `{}` er SwiftUI-visningsinnhold:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Derfor kan `body` forstås slik: Når SwiftUI trenger å vise denne visningen, leser SwiftUI `body` og lager grensesnittet basert på innholdet som `body` returnerer.

Hvis vi skriver `return`, kan det forstås slik:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Men i SwiftUI utelater vi vanligvis `return` og skriver direkte slik:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Når `@State`-data endres, leser SwiftUI `body` på nytt og oppdaterer grensesnittet basert på de nye dataene.

For eksempel:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Etter at knappen klikkes, endres `count`.

```swift
count += 1
```

Når `count` endres, beregner SwiftUI `body` på nytt. Derfor oppdateres teksten i grensesnittet også.

```swift
Text("count: \(count)")
```

Dette er også grunnen til at grensesnittet i SwiftUI kan oppdateres automatisk når data endres.

### Det anbefales ikke å skrive kompliserte beregninger i body

Siden `body` er en beregnet egenskap, kan den leses og beregnes på nytt mange ganger.

For eksempel:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Når `name` endres, beregner SwiftUI `body` på nytt.

Da kjøres også koden inne i `body` på nytt, og `num` opprettes på nytt.

```swift
let num = 10
```

I dette eksemplet er `num` svært enkel, så påvirkningen er liten.

Men hvis man utfører kompliserte beregninger i `body`, for eksempel filtrering av store datamengder, sortering, bildebehandling og lignende, kan det påvirke hvor jevnt grensesnittet fungerer.

Derfor bør `body` i SwiftUI hovedsakelig ha ansvar for å beskrive grensesnittets struktur.

Enkle midlertidige data kan skrives i `body`.

Kompliserte beregninger kan flyttes til en beregnet egenskap, en metode eller en egen databehandlingsdel utenfor `body`.

## Eksempel: antall og totalpris

Nå skal vi bruke et enkelt eksempel for å forstå beregnede egenskaper.

Anta at prisen på én gulrot er 2 $. Brukeren kan klikke på knapper for å endre antallet som skal kjøpes, og grensesnittet må vise totalprisen.

Totalprisen beregnes slik:

```text
Antall * Enhetspris
```

Hvis totalprisen lagres i en vanlig variabel, blir det litt tungvint.

Hver gang antallet endres, må totalprisen oppdateres manuelt.

En bedre måte er å bruke en beregnet egenskap:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../Resource/024_view.png)

I dette eksemplet:

```swift
@State private var count = 1
```

`count` betyr antall gulrøtter. Når knappen klikkes, endres `count`.

```swift
private let price = 2
```

`price` betyr enhetsprisen for gulroten. Her er det en fast verdi, derfor brukes `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` betyr totalpris.

Den trenger ikke å lagres separat, fordi totalprisen alltid kan beregnes med `count * price`.

Når `count` er `1`:

```swift
totalPrice = 1 * 2
```

blir resultatet som vises:

```swift
totalPrice: 2 $
```

Etter at `+`-knappen klikkes, blir `count` `2`.

Når `totalPrice` leses igjen, beregnes den på nytt:

```swift
totalPrice = 2 * 2
```

Resultatet som vises blir:

```swift
totalPrice: 4 $
```

Dette er rollen til en beregnet egenskap: Den beregner dynamisk et nytt resultat basert på data som allerede finnes.

## Beregnede egenskaper kan brukes til vurderinger

En beregnet egenskap kan ikke bare beregne tall, men også returnere et vurderingsresultat.

For eksempel når vi ønsker at minste antall skal være 1.

Når antallet allerede er 1, bør `-`-knappen ikke redusere det videre.

Da kan vi legge til en beregnet egenskap:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Fullstendig kode:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Visningsresultat:

![view](../../Resource/024_view1.png)

Her betyr:

```swift
private var canDecrease: Bool {
    count > 1
}
```

om antallet for øyeblikket fortsatt kan reduseres.

Når `count` er større enn `1`:

```swift
canDecrease == true
```

betyr det at antallet kan reduseres.

Når `count` er lik `1`:

```swift
canDecrease == false
```

betyr det at antallet ikke kan reduseres mer.

### Betinget kontroll i knappen

I knappen brukes:

```swift
if canDecrease {
    count -= 1
}
```

Bare når `canDecrease` er `true`, kan `count` reduseres.

### Kontrollere forgrunnsfargen til visningen

Vi kan også bruke `canDecrease` til å kontrollere forgrunnsfargen til knappen:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Her brukes en ternær operator:

```swift
canDecrease ? Color.primary : Color.gray
```

Denne koden betyr: Hvis `canDecrease` er `true`, brukes `Color.primary` som forgrunnsfarge. Hvis `canDecrease` er `false`, brukes `Color.gray`.

`Color.primary` er en semantisk systemfarge fra SwiftUI. Den betyr den primære tekstfargen i det gjeldende grensesnittet.

I lys modus er `Color.primary` vanligvis nær svart. I mørk modus er `Color.primary` vanligvis nær hvit.

Fordelen med å bruke `Color.primary` er derfor at den automatisk tilpasser seg lys og mørk modus.

### Kontrollere deaktivert tilstand for en visning

`disabled` brukes til å kontrollere om en visning er deaktivert:

```swift
.disabled(!canDecrease)
```

Når `disabled` er `false`, kan visningen klikkes.

Når `disabled` er `true`, er visningen deaktivert og kan ikke klikkes.

Her brukes `canDecrease` som betingelse, noe som gjør koden lettere å forstå.

Når man ser `canDecrease`, kan man forstå at det betyr “om det fortsatt kan reduseres nå”.

### Tilleggsforklaring: Hvorfor kontrolleres det to ganger?

I `-`-knappen:

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

Her brukes både `.disabled(!canDecrease)` og `if canDecrease` inne i knappen.

`.disabled(!canDecrease)` deaktiverer knappen på grensesnittnivå, slik at brukeren ikke kan klikke på den.

`if canDecrease` kontrollerer én gang til før koden kjøres, og bare når antallet kan reduseres, kjøres `count -= 1`.

Dette er en dobbel beskyttelse. I faktisk utvikling kan den interne kontrollen utelates hvis knappen allerede er deaktivert. Men i et undervisningseksempel kan den beholdes for å gjøre rollen til `canDecrease` tydeligere.

## Oppsummering

I denne leksjonen lærte vi hovedsakelig om beregnede egenskaper.

En beregnet egenskap lagrer ikke verdien direkte. Når den leses, beregner den et resultat basert på data som allerede finnes.

For eksempel:

```swift
var c: Int {
    a + b
}
```

Her trenger ikke `c` å lagres separat, fordi den kan beregnes med `a + b`.

En beregnet egenskap må deklareres med `var`, og returtypen må angis.

```swift
var canDecrease: Bool {
    count > 1
}
```

En beregnet egenskap kan ikke bare returnere tallverdier, men også vurderingsresultater, tekstinnhold og til og med SwiftUI-visningsinnhold.

I denne leksjonen lærte vi også om `return`.

`return` betyr å returnere et resultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Hvis en beregnet egenskap bare har ett uttrykk som direkte lager resultatet, kan `return` utelates.

```swift
var totalPrice: Int {
    count * price
}
```

I tillegg lærte vi om `Color.primary` og `disabled`.

`Color.primary` er en semantisk systemfarge i SwiftUI. Den tilpasser visningen automatisk etter lys og mørk modus.

```swift
.foregroundStyle(Color.primary)
```

`disabled` brukes til å kontrollere om en visning er deaktivert.

```swift
.disabled(true)
```

Dette betyr deaktivert og kan ikke klikkes.

```swift
.disabled(false)
```

Dette betyr tilgjengelig og kan klikkes.

Derfor er beregnede egenskaper svært vanlige i SwiftUI. De hjelper oss med å organisere beregningsresultater, betingelser og vist innhold på en tydeligere måte.
