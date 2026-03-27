# Operatorer

I denne lektion skal vi lære om Swift-operatorer (`Operators`).

Når vi beregner, sammenligner eller foretager logiske vurderinger, har vi brug for operatorer. Disse handlinger gennemløber alle faser af programmets udførelse og er en af de mest grundlæggende evner i programmering.

```swift
let a = 100 * 8
```

Under indlæringen af programmering opdager mange, at personer med en vis matematisk tænkning ofte har lettere ved at forstå programlogik. Det skyldes, at programmering i bund og grund ikke kan adskilles fra "beregning" og "regelbaseret vurdering", og netop dette er operatorernes kernefunktion.

I reel udvikling bruges operatorer ikke kun til enkle talberegninger, men også i mange konkrete scenarier.

For eksempel i et blokspil: Når brugeren trækker en blok til en bestemt placering, skal man beregne:

- Blokkens koordinatposition
- Den position hvor blokken kan placeres
- Om målpositionen er tilgængelig

Disse processer med "beregning + vurdering" afhænger i bund og grund af operatorer.

![Block](../../Resource/013_block.png)

At lære operatorer handler derfor ikke kun om at regne med tal, men også om at lægge fundamentet for senere brugerfladelayout, databehandling og interaktionslogik.

## Hvordan beregninger udføres i SwiftUI

I SwiftUI udløses beregningslogik normalt af en `Button`, hvorefter selve logikken udføres i en funktion.

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

Når der trykkes på knappen, viser `Console`:

```
c: 20
```

I denne lektion skriver vi konsekvent beregningslogikken i `func`, lader knappen udløse den og bruger `print` til at vise resultatet.

I de efterfølgende eksempler vil vi forenkle kodevisningen ved direkte at markere beregningsresultatet i koden i stedet for hele tiden at bruge `print`.

## Håndtering af Console-output

Fordi hvert klik producerer output, kan du klikke på knappen til at rydde historikken nederst til højre i `Console`, så det er lettere at se de aktuelle resultater.

![Console](../../Resource/013_console.png)

## En anden måde at skrive Button på

Når en knap kun skal udføre én funktion, kan man bruge en mere kortfattet skrivemåde:

```swift
Button(action: ) {
    // View
}
```

I denne skrivemåde angiver `action` den funktion, som skal udføres, når der klikkes på knappen, og klammerne `{}` bruges til at definere knappens visning.

Sammen med funktionen `calculate` fra før kan det skrives sådan:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Når der klikkes på knappen, udføres funktionen `calculate` direkte.

Derfor er skrivemåden med `action` mere overskuelig og mere i tråd med kodekonventioner, når knaplogikken er enkel og kun kalder én funktion.

## Aritmetiske operatorer

Aritmetiske operatorer (`Arithmetic Operators`) bruges til talberegning:

- `+` addition
- `-` subtraktion
- `*` multiplikation
- `/` division
- `%` modulo (rest)

Eksempel:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Det er vigtigt at bemærke, at Swift er et stærkt typet sprog og ikke automatisk blander forskellige datatyper:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Når to værdier har forskellige typer, skal typen konverteres manuelt.

## Sammenligningsoperatorer

Sammenligningsoperatorer (`Comparison Operators`) bruges til at afgøre forholdet mellem to værdier, og resultatet er en `Bool`:

- `==` lig med
- `!=` forskellig fra
- `>` større end
- `<` mindre end
- `>=` større end eller lig med
- `<=` mindre end eller lig med

Eksempel:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Sammenligningsoperatorer bruges ofte i betingede udsagn. For eksempel i "citatkarussellen" skal vi sikre, at indekset ikke går ud over arrayets område:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Hvis `index` er mindre end `sayings.count - 1`, er sammenligningsresultatet `true`, og koden inde i `if` bliver udført. Hvis resultatet er `false`, bliver den efterfølgende kode ikke udført.

## Logiske operatorer

Logiske operatorer (`Logical Operators`) bruges til at kombinere flere betingelser:

- `&&` og (`AND`)
- `||` eller (`OR`)
- `!` ikke (`NOT`)

### && og

Når flere betingelser alle skal være opfyldt samtidig, bruger vi `&&`.

For eksempel:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

I denne kode indgår to betingelser: `age >= 18` og `age <= 100`.

Kun når begge betingelser er `true`, bliver `legalAge` også `true`. Så snart én af dem ikke er opfyldt, bliver resultatet `false`.

### || eller

Når det er nok, at én af flere betingelser er opfyldt, bruger vi `||`.

For eksempel:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Denne kode betyder, at så længe enten `money >= 50` eller `creditCard >= 50` er opfyldt, bliver `payAllowed` `true`.

Kun når ingen af de to betingelser er opfyldt, bliver resultatet `false`.

For eksempel i en betalingssituation kan man betale med kontanter eller kreditkort. Hvis ingen af delene er mulige, mislykkes betalingen.

### ! ikke

`!` er den logiske negationsoperator (`NOT`) og bruges til at vende en boolsk værdi om.

Man kan forstå det som, at `!` forvandler `true` til `false` og `false` til `true`.

For eksempel:

```swift
let allowed = true
let result = !allowed   // false
```

Her betyder `!allowed`, at værdien af `allowed` vendes om.

Det er vigtigt at bemærke, at `!` og `!=` er to forskellige operatorer: `!` vender en `Bool`-værdi om, mens `!=` er en sammenligningsoperator, der returnerer en `Bool`.

## Tildelingsoperatorer

Tildelingsoperatorer (`Assignment Operators`) bruges til at tildele eller opdatere variabler:

- `=` tildeling

Både når vi erklærer variabler og under beregninger, indgår der tildeling:

```swift
let a = 5
```

Denne kode betyder, at tallet `5` tildeles variablen `a`.

### Sammensatte tildelingsoperatorer

I reel udvikling bruger man ud over den grundlæggende tildelingsoperator også ofte "sammensatte tildelingsoperatorer", som gør det muligt at regne videre på den oprindelige værdi og straks opdatere den:

- `+=`
- `-=`
- `*=`
- `/=`

I den tidligere lektion om "tælleren" har vi allerede kort mødt sammensatte tildelingsoperatorer.

For eksempel, når man vil få en variabel til automatisk at stige ved klik på en knap:

```swift
var num = 10
num += 5   // num = 15
```

Denne kode betyder, at `num` lægges sammen med `5`, og resultatet derefter tildeles tilbage til `num`.

Derfor er den ækvivalent med:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternær operator

Den ternære operator (`Ternary Operator`) i Swift vurderer en betingelse og returnerer et af to mulige resultater:

```swift
condition ? value1 : value2
```

Dens logik er: hvis betingelsen er `true`, returneres `value1`; hvis betingelsen er `false`, returneres `value2`.

For eksempel:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Denne kode vurderer værdien af `showColor`: hvis den er `true`, returneres `Color.blue`, og baggrunden bliver blå; hvis den er `false`, returneres `Color.clear`, så der ikke vises nogen baggrundsfarve.

Tip: `Color.clear` betyder en gennemsigtig farve, altså at der ikke vises noget synligt indhold.

### Forskellen fra if-else

Den ternære operator er logisk ækvivalent med en `if-else`-sætning.

For eksempel kan koden ovenfor skrives sådan:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

De to har præcis samme udførelseslogik: Når betingelsen er `true`, vælges det første resultat; når betingelsen er `false`, vælges det andet.

I praksis er den ternære operator mere kortfattet og egner sig især til simple "enten-eller"-vurderinger, hvor man direkte vil returnere en værdi.

I konstruktionen af views i SwiftUI er den ternære operator meget almindelig. For eksempel:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Denne skrivemåde gør det muligt på én linje kode at ændre en visnings effekt dynamisk ud fra en betingelse.

## Range-operatorer

Range-operatorer (`Range Operators`) bruges til at repræsentere intervaller:

- `...` lukket interval (inkluderer begge ender)
- `..<` halvt åbent interval (inkluderer ikke højre side)

For eksempel:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Man kan forstå `1...3` som fra `1` til `3`, inklusive `3`; og `5..<8` som fra `5` til `8`, men uden at inkludere `8`.

Udvidede former, kun som introduktion:

```
5...    // >= 5
...5    // <= 5
```

Denne skrivemåde betyder et ensidigt interval og bruges ofte i betingede udsagn eller mønstermatching.

Range-operatorer bruges senere, når vi lærer `for`-løkker. Foreløbig kan du bare forstå dem som et sammenhængende talinterval.

## Øv operatorer

Nedenfor bruger vi nogle enkle eksempler til at øve operatorernes rolle i en visning.

### 1. Beregn det samlede antal køretøjer

For eksempel: Hvis der hver dag passerer `500` biler gennem et kryds, kan vi beregne det samlede antal biler på `30` dage.

Vi kan bruge aritmetiske operatorer:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Her er beregningen, at `500` biler om dagen i `30` dage giver `500 × 30`, og det endelige resultat bliver `15000` biler i alt.

### 2. Vurder medlemskab af køb i app

Vi kan vurdere, om en person er medlem af køb i appen. Så længe personen har enten livstidsmedlemskab eller abonnement, betragtes personen som medlem.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Denne kode bruger operatoren `||` (`eller`): `lifeTime = false` betyder, at personen ikke har livstidsmedlemskab, og `subscription = true` betyder, at personen har et abonnement.

Fordi det er nok, at én af betingelserne er opfyldt, bliver `isMember` `true`. Derfor er denne person medlem af køb i app.

## Opsummering

I Swift er operatorer grundlaget for databeregning og logisk vurdering. Ligesom `Text` bruges til at vise indhold, bruges operatorer til at behandle selve dataene.

Fra de enkleste talberegninger til komplekse logiske vurderinger og videre til tilstandskontrol og layoutberegninger i brugerfladen, alt dette er afhængigt af operatorer.

Ved at øve sig i forskellige scenarier kan man gradvist blive fortrolig med og mestre de forskellige operatorer, som denne lektion introducerer. Det er et vigtigt fundament for senere læring.

### Udvidet viden - Bitvise operatorer

Swift tilbyder også en mere lavniveau-type operatorer, nemlig bitvise operatorer (`Bitwise Operators`):

- `&` (bitvis AND)
- `|` (bitvis OR)
- `^` (bitvis XOR)
- `~` (bitvis negation)
- `>>` (højreforskydning)
- `<<` (venstreforskydning)

For eksempel:

```swift
let a = 6  // binær 110
let b = 3  // binær 011

print(a & b) // 2 (binær 010)
print(a | b) // 7 (binær 111)
print(a ^ b) // 5 (binær 101)
print(~a)    // -7 (negation)
```

I Swift repræsenteres heltal med to-komplement i binær form, og efter negation får man derfor det tilsvarende negative resultat.

Bitvise operatorer arbejder direkte på binære data og bruges typisk til lavniveau-databehandling eller ydeevneoptimering.

For begyndere er anvendelsesscenarierne for disse operatorer dog få, og de er heller ikke almindelige i almindelig iOS- eller SwiftUI-udvikling. Derfor går vi ikke mere i dybden med dem her.

Hvis vi senere kommer ind på lavniveau-logik eller performanceoptimering, kan vi studere dem nærmere.
