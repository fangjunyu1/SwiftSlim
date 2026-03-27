# Operatorer

I denne leksjonen skal vi lære om operatorer i Swift（Operators）。

Når vi regner, sammenligner eller gjør logiske vurderinger, trenger vi operatorer. Disse operasjonene går gjennom hele programkjøringen og er en av de mest grunnleggende ferdighetene i programmering.

```swift
let a = 100 * 8
```

Når man lærer programmering, oppdager mange at personer med litt matematisk tankegang ofte har lettere for å forstå programlogikk. Det er fordi programmering i bunn og grunn ikke kan skilles fra “beregning” og “regelbasert vurdering”, og dette er nettopp den sentrale rollen operatorer har.

I faktisk utvikling brukes operatorer ikke bare til enkel tallregning, men også bredt i mange konkrete situasjoner.

For eksempel, i et blokkspill, når brukeren drar en blokk til en bestemt posisjon, må vi beregne:

- koordinatposisjonen til blokken
- hvilke posisjoner blokken kan fylle
- om målposisjonen kan brukes

Disse prosessene med “beregning + vurdering” er i bunn og grunn avhengige av operatorer.

![Block](../../Resource/013_block.png)

Å lære operatorer handler ikke bare om tallregning, men om å legge grunnlaget for senere layout av grensesnitt, databehandling og interaksjonslogikk.

## Hvordan beregninger utføres i SwiftUI

I SwiftUI bruker vi vanligvis `Button` til å utløse en funksjon, og lar selve regnelogikken utføres i funksjonen.

For eksempel:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Når knappen trykkes, skriver Console ut:

```
c: 20
```

I denne leksjonen skal vi skrive regnelogikken i `func`，utløse den via knapper, og bruke `print` til å vise resultatene.

I de følgende eksemplene skal vi, for å gjøre koden enklere å lese, skrive inn beregningsresultatet direkte i koden i stedet for å bruke `print` hele tiden.

## Håndtering av Console-utskrift

Siden hvert klikk lager ny utskrift, kan du klikke på ryddeknappen nederst til høyre i Console-området for å tømme tidligere logger og gjøre det enklere å se resultatet du bryr deg om akkurat nå.

![Console](../../Resource/013_console.png)

## En annen skrivemåte for Button

Når en knapp bare utfører én funksjon, kan vi bruke en mer kortfattet skrivemåte:

```swift
Button(action: ) {
    // View
}
```

I denne skrivemåten angir `action` funksjonen som skal utføres når knappen trykkes（en funksjon uten parametere）, mens krøllparentesene `{}` brukes til å definere visningen til knappen.

Kombinert med `calculate`-funksjonen over, kan det skrives slik:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Når knappen trykkes, utføres `calculate` direkte.

Derfor er `action`-skrivemåten klarere og mer i tråd med god kodestil når knappelogikken er enkel og bare kaller én funksjon.

## Aritmetiske operatorer

Aritmetiske operatorer（Arithmetic Operators）brukes til tallberegninger:

- `+` addisjon
- `-` subtraksjon
- `*` multiplikasjon
- `/` divisjon
- `%` rest（modulo）

Eksempel:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Det er viktig å merke seg at Swift er et sterkt typet språk, og ikke automatisk blander ulike datatyper:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Når to typer er forskjellige, må vi konvertere typen manuelt.

## Sammenligningsoperatorer

Sammenligningsoperatorer（Comparison Operators）brukes til å avgjøre forholdet mellom to verdier, og resultatet er `Bool`：

- `==` lik
- `!=` ikke lik
- `>` større enn
- `<` mindre enn
- `>=` større enn eller lik
- `<=` mindre enn eller lik

Eksempel:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Sammenligningsoperatorer brukes ofte i betingelser. For eksempel må vi i “karusell med sitater” kontrollere at indeksen ikke går utenfor arrayens område:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Hvis `index` er mindre enn `sayings.count - 1`，blir sammenligningen `true` og koden i `if` blir utført；hvis resultatet er `false`，kjøres ikke koden etterpå.

## Logiske operatorer

Logiske operatorer（Logical Operators）brukes til å kombinere flere betingelser:

- `&&` og（AND）
- `||` eller（OR）
- `!` ikke（NOT）

### `&&` og

Når flere betingelser må være oppfylt samtidig, bruker vi `&&`。

For eksempel:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

I denne koden finnes det to betingelser: `age >= 18` og `age <= 100`。

Bare når begge er `true`，blir `legalAge` `true`；så snart én av dem ikke er oppfylt, blir resultatet `false`。

### `||` eller

Når det holder at én av flere betingelser er oppfylt, bruker vi `||`。

For eksempel:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Denne koden betyr at så lenge enten `money >= 50` eller `creditCard >= 50` er oppfylt, er `payAllowed` lik `true`。

Bare hvis begge betingelsene ikke er oppfylt, blir resultatet `false`。

For eksempel i en betalingssituasjon kan vi bruke kontanter eller kredittkort. Hvis ingen av dem kan brukes til å betale, mislykkes betalingen.

### `!` ikke

`!` er den logiske ikke-operatoren（NOT），og brukes til å negere en `Bool`-verdi.

Du kan forstå det som at `!` gjør `true` til `false`，og `false` til `true`。

For eksempel:

```swift
let allowed = true
let result = !allowed   // false
```

Her betyr `!allowed` at verdien til `allowed` blir negert.

Det er viktig å merke seg at `!` og `!=` er to forskjellige operatorer. `!` negérer en `Bool`-verdi, mens `!=` er en sammenligningsoperator og returnerer en `Bool`。

## Tilordningsoperatorer

Tilordningsoperatorer（Assignment Operators）brukes til å tilordne eller oppdatere variabler:

- `=` tilordning

Både i deklarasjon av variabler og i beregninger er tilordning en del av prosessen:

```swift
let a = 5
```

Denne koden betyr at verdien `5` tilordnes variabelen `a`。

### Sammensatte tilordningsoperatorer

I faktisk utvikling brukes ikke bare den grunnleggende tilordningsoperatoren, men også “sammensatte tilordningsoperatorer” for å regne videre på en eksisterende verdi og oppdatere den direkte:

- `+=`
- `-=`
- `*=`
- `/=`

I leksjonen om “teller” fikk vi allerede en enkel introduksjon til sammensatte tilordningsoperatorer.

For eksempel, hvis vi vil at en variabel automatisk skal øke når en knapp trykkes:

```swift
var num = 10
num += 5   // num = 15
```

Denne koden betyr at `num` adderes med `5`，og resultatet tilordnes deretter tilbake til `num`。

Derfor tilsvarer det:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternær operator

Den ternære operatoren（Ternary Operator）i Swift gjør en vurdering basert på en betingelse og returnerer ett av to resultater:

```swift
betingelse ? verdi1 : verdi2
```

Kjørelogikken er slik: hvis betingelsen er `true`，returneres “verdi1”；hvis betingelsen er `false`，returneres “verdi2”。

For eksempel:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Denne koden sjekker verdien til `showColor`：hvis den er `true`，returneres `Color.blue` og bakgrunnen vises blå；hvis den er `false`，returneres `Color.clear` og ingen bakgrunnsfarge vises.

Tips: `Color.clear` betyr gjennomsiktig farge（ingen synlig farge）。

### Forskjellen fra `if-else`

Den ternære operatoren er logisk ekvivalent med `if-else`。

For eksempel kan koden ovenfor skrives slik:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

De to har helt samme kjørelogikk: når betingelsen er `true`，brukes det første resultatet；når betingelsen er `false`，brukes det andre resultatet.

I praksis er den ternære operatoren mer kortfattet og passer bedre til enkle “velg mellom to”-situasjoner, og brukes ofte til å returnere en verdi direkte.

I SwiftUI er den ternære operatoren svært vanlig når Views bygges. For eksempel:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Denne skrivemåten gjør det mulig å endre effekten på visningen dynamisk ut fra en betingelse på én linje kode.

## Områdeoperatorer

Områdeoperatorer（Range Operators）brukes til å representere intervaller:

- `...` lukket intervall（inkluderer begge ender）
- `..<` halvt åpent intervall（inkluderer ikke høyre side）

For eksempel:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Dette kan forstås som at `1...3` betyr fra 1 til 3, inkludert 3；`5..<8` betyr fra 5 til 8, men ikke inkludert 8。

Utvidede former（bare til kjennskap）：

```
5...    // >= 5
...5    // <= 5
```

Denne skrivemåten betyr “ensidig område”, og brukes ofte i betingelser eller mønstermatching.

Områdeoperatorer brukes senere når vi lærer `for`-løkker. Foreløpig kan du forstå dem som et sammenhengende tallområde.

## Øv på operatorer

Nedenfor skal vi bruke noen enkle eksempler for å øve på hvordan operatorer virker i en visning.

### 1. Beregn totalt antall kjøretøy

For eksempel, hvis et veikryss har 500 biler som passerer hver dag, hvordan beregner vi totalt antall biler i løpet av 30 dager?

Vi kan bruke regneoperatorer:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Regnestykket her er at 500 biler per dag i 30 dager gir `500 × 30`，som til slutt blir totalt `15000` biler.

### 2. Vurder medlemskap for kjøp i app

Vi kan avgjøre om en person er medlem for kjøp i appen. Så lenge vedkommende enten har livstidsmedlemskap eller abonnementsmedlemskap, regnes personen som medlem.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Denne koden bruker operatoren `||`（eller）：`lifeTime = false` betyr at det ikke finnes livstidsmedlemskap；`subscription = true` betyr at det finnes abonnementsmedlemskap。

Siden bare én av betingelsene trenger å være oppfylt, blir `isMember` `true`。Derfor er denne personen medlem i appkjøpet.

## Oppsummering

I Swift er operatorer grunnlaget for databeregning og logisk vurdering. Akkurat som `Text` viser innhold, brukes operatorer til å behandle selve dataene.

Fra den enkleste tallberegningen, via mer komplekse logiske vurderinger, til tilstandskontroll og layoutberegning i visninger, er alt avhengig av operatorer.

Gjennom øving i ulike situasjoner kan vi gradvis bli kjent med og mestre de ulike operatorene som er introdusert i denne leksjonen. Dette er et viktig grunnlag for videre læring.

### Ekstra kunnskap - bitvise operatorer

I tillegg tilbyr Swift en mer lavnivå kategori operatorer, nemlig bitvise operatorer（Bitwise Operators）：

- `&`（bitvis AND）
- `|`（bitvis OR）
- `^`（bitvis XOR）
- `~`（bitvis negasjon）
- `>>`（høyreforskyvning）
- `<<`（venstreforskyvning）

For eksempel:

```swift
let a = 6  // binært 110
let b = 3  // binært 011

print(a & b) // 2 (binært 010)
print(a | b) // 7 (binært 111)
print(a ^ b) // 5 (binært 101)
print(~a)    // -7 (negasjon)
```

I Swift bruker heltall binær toerkomplementrepresentasjon, så når vi negérer bitene, får vi et tilsvarende negativt resultat.

Bitvise operatorer arbeider direkte på binære tall, og brukes vanligvis i lavnivå databehandling og ytelsesoptimalisering.

For nybegynnere brukes slike operatorer relativt sjelden, og i vanlig iOS- eller SwiftUI-utvikling er de heller ikke så vanlige. Derfor går vi ikke dypere inn i dem her.

Hvis vi senere kommer inn på lavnivålogikk eller ytelsesoptimalisering, kan vi lære og forstå dem nærmere da.
