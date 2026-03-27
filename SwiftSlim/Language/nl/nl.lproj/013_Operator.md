# Operatoren

In deze les leren we over Swift-operatoren (`Operators`).

Wanneer we berekeningen uitvoeren, waarden vergelijken of logische controles doen, hebben we operatoren nodig. Zulke handelingen lopen door elk deel van een programma heen en vormen een van de meest fundamentele vaardigheden in programmeren.

```swift
let a = 100 * 8
```

Tijdens het leren programmeren merken veel mensen dat wie een zekere wiskundige denkwijze heeft, de logica van programma's vaak makkelijker begrijpt. Dat komt doordat programmeren in wezen niet zonder "berekenen" en "regels beoordelen" kan, en precies daarbij spelen operatoren hun kernrol.

In echte ontwikkeling worden operatoren niet alleen gebruikt voor eenvoudige getalberekeningen, maar ook breed toegepast in allerlei concrete scenario's.

Bijvoorbeeld in een blokspel, wanneer een gebruiker een blok naar een bepaalde positie sleept, moet het programma berekenen:

- de coördinaten van het blok
- de positie waar het blok geplaatst kan worden
- of de doelpositie beschikbaar is

Deze processen van "berekenen + beoordelen" zijn in essentie allemaal afhankelijk van operatoren.

![Block](../../Resource/013_block.png)

Operatoren leren is dus niet alleen leren rekenen met getallen, maar ook een basis leggen voor latere interface-opmaak, gegevensverwerking en interactielogica.

## Hoe berekeningen in SwiftUI worden uitgevoerd

In SwiftUI worden berekeningen meestal getriggerd door een `Button`, waarna de rekenlogica in een functie wordt uitgevoerd.

Bijvoorbeeld:

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

Wanneer op de knop wordt geklikt, toont de Console:

```
c: 20
```

In deze les schrijven we de berekeningslogica steeds in een `func`, laten we die door een knop uitvoeren en gebruiken we `print` om het resultaat weer te geven.

In de voorbeelden die volgen, laten we om de code korter te houden de uitkomst direct in de code zien, in plaats van telkens opnieuw `print` te gebruiken.

## Console-uitvoer beheren

Omdat elke klik uitvoer oplevert, kun je op de knop rechtsonder in het Console-gebied klikken om oude logs te wissen. Zo kun je de huidige resultaten makkelijker bekijken.

![Console](../../Resource/013_console.png)

## Een andere schrijfwijze van `Button`

Wanneer een knop maar één functie uitvoert, kun je een kortere schrijfwijze gebruiken:

```swift
Button(action: ) {
    // View
}
```

In deze schrijfwijze bepaalt `action` welke functie zonder parameters wordt uitgevoerd wanneer op de knop wordt geklikt, en worden met accolades `{}` de visuele elementen van de knop gedefinieerd.

Gecombineerd met de functie `calculate` van hierboven wordt dat:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Wanneer op de knop wordt geklikt, wordt de functie `calculate` direct uitgevoerd.

Daarom is de schrijfwijze met `action` duidelijker en beter volgens conventie wanneer de knoplogica simpel is en alleen één functie aanroept.

## Rekenkundige operatoren

Rekenkundige operatoren (`Arithmetic Operators`) worden gebruikt voor numerieke berekeningen:

- `+` optellen
- `-` aftrekken
- `*` vermenigvuldigen
- `/` delen
- `%` modulo (rest)

Voorbeeld:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Let op dat Swift een sterk getypeerde taal is en verschillende gegevenstypen niet automatisch mengt:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Wanneer twee waarden verschillende typen hebben, moet je het type eerst handmatig omzetten.

## Vergelijkingsoperatoren

Vergelijkingsoperatoren (`Comparison Operators`) worden gebruikt om de relatie tussen twee waarden te bepalen. Het resultaat is een `Bool`:

- `==` gelijk aan
- `!=` niet gelijk aan
- `>` groter dan
- `<` kleiner dan
- `>=` groter dan of gelijk aan
- `<=` kleiner dan of gelijk aan

Voorbeeld:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Vergelijkingsoperatoren worden vaak gebruikt in voorwaardelijke instructies. In de "citatencarrousel" moesten we bijvoorbeeld voorkomen dat de index buiten het bereik van de array komt:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Als `index` kleiner is dan `sayings.count - 1`, is het resultaat van de vergelijking `true` en wordt de code in `if` uitgevoerd. Als het resultaat `false` is, wordt de volgende code niet uitgevoerd.

## Logische operatoren

Logische operatoren (`Logical Operators`) worden gebruikt om meerdere voorwaarden te combineren:

- `&&` en (`AND`)
- `||` of (`OR`)
- `!` niet (`NOT`)

### `&&` en

Wanneer meerdere voorwaarden tegelijk waar moeten zijn, gebruik je `&&`.

Bijvoorbeeld:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Deze code bevat twee voorwaarden: `age >= 18` en `age <= 100`.

Alleen wanneer beide voorwaarden `true` zijn, is `legalAge` ook `true`. Zodra één van beide onwaar is, wordt het resultaat `false`.

### `||` of

Wanneer maar één van meerdere voorwaarden waar hoeft te zijn, gebruik je `||`.

Bijvoorbeeld:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Deze code betekent dat `payAllowed` waar is zolang `money >= 50` of `creditCard >= 50` waar is.

Alleen wanneer beide voorwaarden onwaar zijn, wordt het resultaat `false`.

Bijvoorbeeld in een betaalsituatie: je kunt betalen met contant geld of met een creditcard. Als beide niet kunnen betalen, mislukt de betaling.

### `!` niet

`!` is de logische negatie-operator (`NOT`) en keert een `Bool`-waarde om.

Je kunt het zien als: `!` maakt van `true` `false` en van `false` `true`.

Bijvoorbeeld:

```swift
let allowed = true
let result = !allowed   // false
```

Hier betekent `!allowed` dat de waarde van `allowed` wordt omgekeerd.

Let erop dat `!` en `!=` twee verschillende operatoren zijn. `!` keert een booleaanse waarde om, terwijl `!=` een vergelijkingsoperator is die een `Bool` teruggeeft.

## Toekenningsoperatoren

Toekenningsoperatoren (`Assignment Operators`) worden gebruikt om waarden toe te wijzen of variabelen bij te werken:

- `=` toekennen

Bij het declareren van variabelen of tijdens berekeningen komt toekenning steeds terug:

```swift
let a = 5
```

Deze code betekent dat de waarde `5` wordt toegewezen aan variabele `a`.

### Samengestelde toekenning

In echte ontwikkeling worden naast de gewone toekenningsoperator ook vaak "samengestelde toekenningsoperatoren" gebruikt. Die berekenen direct op basis van de huidige waarde en slaan het nieuwe resultaat meteen weer op:

- `+=`
- `-=`
- `*=`
- `/=`

In de les "Teller" hebben we samengestelde toekenningsoperatoren al kort leren kennen.

Bijvoorbeeld: als je op een knop klikt en de variabele automatisch wilt laten toenemen:

```swift
var num = 10
num += 5   // num = 15
```

Deze code betekent dat `num` eerst met `5` wordt opgeteld, waarna het resultaat opnieuw aan `num` wordt toegewezen.

Dat is dus equivalent aan:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternaire operator

In Swift gebruikt de ternaire operator (`Ternary Operator`) een voorwaarde om één van twee resultaten terug te geven:

```swift
voorwaarde ? waarde1 : waarde2
```

De uitvoeringslogica is: als de voorwaarde `true` is, retourneer `"waarde1"`; als de voorwaarde `false` is, retourneer `"waarde2"`.

Bijvoorbeeld:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Deze code controleert de waarde van `showColor`: als die `true` is, retourneert de uitdrukking `Color.blue` en wordt de achtergrond blauw; is die `false`, dan wordt `Color.clear` teruggegeven en is er geen zichtbare achtergrondkleur.

Tip: `Color.clear` betekent een transparante kleur.

### Verschil met `if-else`

De ternaire operator is logisch gezien equivalent aan een `if-else`-instructie.

De bovenstaande code kan bijvoorbeeld ook zo worden geschreven:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

De uitvoeringslogica is exact hetzelfde: als de voorwaarde `true` is, wordt het eerste resultaat gebruikt; als de voorwaarde `false` is, het tweede.

In de praktijk is de ternaire operator korter en geschikter voor eenvoudige "kies één van twee"-logica, vooral wanneer je direct een waarde wilt teruggeven.

Bij het bouwen van SwiftUI-views komt de ternaire operator veel voor, bijvoorbeeld:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Met deze schrijfwijze kun je in één regel code het uiterlijk van een view dynamisch veranderen op basis van een voorwaarde.

## Bereikoperatoren

Bereikoperatoren (`Range Operators`) worden gebruikt om een interval aan te geven:

- `...` gesloten interval, beide uiteinden inbegrepen
- `..<` halfopen interval, het rechteruiteinde niet inbegrepen

Bijvoorbeeld:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Je kunt dit begrijpen als: `1...3` betekent van `1` tot `3`, inclusief `3`; `5..<8` betekent van `5` tot `8`, maar zonder `8`.

Uitgebreide vorm, alleen ter kennismaking:

```
5...    // >= 5
...5    // <= 5
```

Deze schrijfwijze betekent een eenzijdig bereik en wordt vaak gebruikt in voorwaarden of patroonmatching.

Bereikoperatoren komen later terug wanneer we `for`-lussen leren. Voor nu kun je ze zien als een aaneengesloten numeriek bereik.

## Oefenen met operatoren

Hieronder gebruiken we een paar eenvoudige voorbeelden om operatoren in de view te oefenen.

### 1. Het totaal aantal voertuigen berekenen

Stel dat er dagelijks 500 voertuigen door een kruispunt rijden. Bereken hoeveel voertuigen er in 30 dagen passeren.

Daarvoor kunnen we rekenkundige operatoren gebruiken:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

De berekening is hier: 500 voertuigen per dag, dus in 30 dagen is het totaal `500 × 30`, wat uitkomt op 15000 voertuigen.

### 2. Bepalen of iemand een in-app-aankooplid is

We kunnen bepalen of iemand een in-app-aankooplid is. Zolang die persoon een levenslang lidmaatschap of een abonnement heeft, beschouwen we die als lid.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

In deze code wordt de operator `||` gebruikt. `lifeTime = false` betekent dat er geen levenslang lidmaatschap is, en `subscription = true` betekent dat er wel een abonnement is.

Omdat slechts één van beide voorwaarden waar hoeft te zijn, is `isMember` gelijk aan `true`. Die persoon is dus een in-app-aankooplid.

## Samenvatting

In Swift vormen operatoren de basis van gegevensberekening en logische beoordeling. Net zoals `Text` wordt gebruikt om inhoud te tonen, worden operatoren gebruikt om de gegevens zelf te verwerken.

Van de eenvoudigste getalberekeningen tot complexere logische voorwaarden en zelfs toestandsbesturing en layoutberekeningen in views: overal zijn operatoren bij betrokken.

Door te oefenen in verschillende scenario's kun je stap voor stap vertrouwd raken met de verschillende operatoren uit deze les. Dat vormt een belangrijke basis voor de volgende leerstappen.

### Uitbreidingskennis - bitwise operatoren

Daarnaast biedt Swift ook een meer laag-niveau categorie operatoren: bitwise operatoren (`Bitwise Operators`):

- `&` (bitwise AND)
- `|` (bitwise OR)
- `^` (bitwise XOR)
- `~` (bitwise NOT)
- `>>` (naar rechts schuiven)
- `<<` (naar links schuiven)

Bijvoorbeeld:

```swift
let a = 6  // binair 110
let b = 3  // binair 011

print(a & b) // 2 (binair 010)
print(a | b) // 7 (binair 111)
print(a ^ b) // 5 (binair 101)
print(~a)    // -7 (negatie)
```

In Swift worden gehele getallen intern opgeslagen in binaire tweecomplementvorm, waardoor een bitwise negatie een overeenkomstig negatief resultaat oplevert.

Bitwise operatoren werken direct op binaire waarden en worden meestal gebruikt in laag-niveau gegevensverwerking of prestatie-optimalisatie.

Voor beginners komen deze operatoren minder vaak voor, en in gewone iOS- of SwiftUI-ontwikkeling zie je ze zelden. Daarom gaan we er hier niet dieper op in.

Als we later met laag-niveau logica of prestatie-optimalisatie te maken krijgen, kunnen we ze verder leren en begrijpen.
