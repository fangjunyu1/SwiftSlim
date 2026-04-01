# Operatorer

I den här lektionen ska vi lära oss om operatorer (Operators) i Swift.

När vi gör beräkningar, jämförelser eller logiska bedömningar behöver vi använda operatorer. Dessa operationer förekommer genom hela programmets körning och är en av de mest grundläggande färdigheterna i programmering.

```swift
let a = 100 * 8
```

När man lär sig programmera märker många att personer med viss matematisk förståelse ofta har lättare att förstå programlogik. Det beror på att programmering i grunden inte kan skiljas från “beräkning” och “regelbaserad bedömning”, och det är just detta som operatorer har som kärnuppgift.

I faktisk utveckling används operatorer inte bara för enkla sifferberäkningar, utan också i många konkreta scenarier.

Till exempel i ett blockspel: när användaren drar ett block till en bestämd position behöver man beräkna:

* blockets koordinatposition
* vilka positioner blocket kan fylla
* om målpositionen är tillgänglig

Dessa processer med “beräkning + bedömning” bygger i grunden alla på operatorer.

![Block](../../Resource/013_block.png)

Att lära sig operatorer handlar alltså inte bara om att lära sig räkna med tal, utan också om att lägga grunden för senare arbete med gränssnittslayout, databehandling och interaktionslogik.

## Hur beräkningar utförs i SwiftUI

I SwiftUI utför man vanligtvis beräkningslogik genom att låta en Button utlösa en funktion, och sedan skriva själva beräkningen i funktionen.

Till exempel:

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

När man trycker på knappen visas följande i Console:

```
c: 20
```

I den här lektionen kommer vi konsekvent att skriva beräkningslogik i `func`, utlösa den via knappar och använda `print` för att skriva ut resultat.

I de följande exemplen kommer vi, för att förenkla kodvisningen, att markera beräkningsresultaten direkt i koden och inte längre upprepa `print`-utskrifter.

## Hantering av Console-utskrift

Eftersom varje tryck genererar utskriftsinformation kan du klicka på rensningsknappen längst ned till höger i Console-området för att rensa historiken och göra det enklare att se det aktuella resultatet.

![Console](../../Resource/013_console.png)

## Ett annat sätt att skriva Button

När en knapp bara utför en enda funktion kan man använda ett mer kortfattat skrivsätt:

```swift
Button(action: ) {
    // View
}
```

I detta skrivsätt anger `action` vilken funktion som ska köras när knappen trycks (en funktion utan parametrar), medan klamrarna `{}` används för att definiera knappens vy.

Kombinerat med funktionen `calculate` ovan kan det skrivas så här:

```swift
Button(action: calculate) {
    Text("Button")
}
```

När man trycker på knappen körs `calculate` direkt.

Därför är `action`-skrivningen tydligare och mer kodmässigt korrekt när knappens logik är enkel och bara anropar en funktion.

## Aritmetiska operatorer

Aritmetiska operatorer (Arithmetic Operators) används för numeriska beräkningar:

* `+` addition
* `-` subtraktion
* `*` multiplikation
* `/` division
* `%` modulo (rest)

Exempel:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Det är viktigt att notera att Swift är ett starkt typat språk och inte automatiskt blandar olika datatyper:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

När två typer inte är samma måste man konvertera typen manuellt.

## Jämförelseoperatorer

Jämförelseoperatorer (Comparison Operators) används för att avgöra relationen mellan två värden, och resultatet blir en `Bool`:

* `==` lika med
* `!=` inte lika med
* `>` större än
* `<` mindre än
* `>=` större än eller lika med
* `<=` mindre än eller lika med

Exempel:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Jämförelseoperatorer används ofta i villkorssatser. Till exempel i “citatkarusellen” behöver vi kontrollera att index inte går utanför arrayens område:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Om `index` är mindre än `sayings.count - 1` blir jämförelseresultatet `true`, och koden i `if`-satsen körs. Om resultatet är `false` körs inte den efterföljande koden.

## Logiska operatorer

Logiska operatorer (Logical Operators) används för att kombinera flera villkor:

* `&&` och (AND)
* `||` eller (OR)
* `!` inte (NOT)

### && och

När flera villkor måste vara uppfyllda samtidigt används `&&`.

Till exempel:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

I denna kod finns två villkor: `age >= 18` och `age <= 100`.

Endast om båda villkoren är `true` blir `legalAge` `true`. Så fort ett av villkoren inte är uppfyllt blir resultatet `false`.

### || eller

När det räcker att ett av flera villkor är uppfyllt används `||`.

Till exempel:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Den här koden betyder att så länge antingen `money >= 50` eller `creditCard >= 50` är sant, så blir `payAllowed` `true`.

Endast när båda villkoren inte är uppfyllda blir resultatet `false`.

Till exempel i en betalningssituation kan man betala med kontanter eller kreditkort. Om inget av dem kan användas misslyckas betalningen.

### ! inte

`!` är den logiska negationsoperatorn (NOT), som används för att vända på ett `Bool`-värde.

Man kan förstå det som att `!` gör `true` till `false` och `false` till `true`.

Till exempel:

```swift
let allowed = true
let result = !allowed   // false
```

Här betyder `!allowed` att värdet av `allowed` inverteras.

Det är viktigt att notera att `!` och `!=` är två olika operatorer. `!` inverterar ett `Bool`-värde, medan `!=` är en jämförelseoperator som returnerar ett `Bool`-värde.

## Tilldelningsoperatorer

Tilldelningsoperatorer (Assignment Operators) används för att tilldela eller uppdatera variabler:

* `=` tilldelning

Både vid deklaration av variabler och i beräkningar förekommer tilldelning:

```swift
let a = 5
```

Den här koden betyder att talet `5` tilldelas variabeln `a`.

### Sammansatta tilldelningsoperatorer

I faktisk utveckling används, förutom den grundläggande tilldelningsoperatorn, ofta även “sammansatta tilldelningsoperatorer”, som gör att man direkt kan beräkna utifrån det nuvarande värdet och uppdatera det:

* `+=`
* `-=`
* `*=`
* `/=`

I lektionen om “räknaren” har vi redan kort lärt känna sammansatta tilldelningsoperatorer.

Till exempel, när en knapp trycks och en variabel ska öka automatiskt:

```swift
var num = 10
num += 5   // num = 15
```

Det betyder att `num` först adderas med `5`, och att resultatet sedan tilldelas tillbaka till `num`.

Därför är det likvärdigt med:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternär operator

I Swift används den ternära operatorn (Ternary Operator) för att avgöra ett villkor och returnera ett av två möjliga resultat:

```swift
villkor ? värde1 : värde2
```

Logiken är att om villkoret är `true` returneras “värde1”; om villkoret är `false` returneras “värde2”.

Till exempel:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Den här koden kontrollerar värdet av `showColor`: om det är `true` returneras `Color.blue`, och bakgrunden visas som blå. Om det är `false` returneras `Color.clear`, och ingen bakgrundsfärg visas.

Tips: `Color.clear` betyder en transparent färg (visar inget innehåll).

### Skillnaden mot if-else

Den ternära operatorn är logiskt likvärdig med en `if-else`-sats.

Till exempel kan koden ovan skrivas så här:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

De två skrivsätten har exakt samma körlogik: när villkoret är `true` används det första resultatet, och när villkoret är `false` används det andra resultatet.

I praktiken är den ternära operatorn mer kortfattad och passar bättre för enkla “ett av två”-bedömningar. Den används ofta när man direkt vill returnera ett värde.

Vid uppbyggnad av vyer i SwiftUI är den ternära operatorn mycket vanlig, till exempel:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Detta gör att man med en enda kodrad kan ändra vyers utseende dynamiskt beroende på ett villkor.

## Intervalloperatorer

Intervalloperatorer (Range Operators) används för att uttrycka ett intervall:

* `...` slutet intervall (inkluderar båda ändpunkterna)
* `..<` halvöppet intervall (inkluderar inte högra sidan)

Till exempel:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Man kan förstå det som att `1...3` betyder från 1 till 3, inklusive 3, medan `5..<8` betyder från 5 till 8, men utan att inkludera 8.

Utökade former (bara som introduktion):

```
5...    // >= 5
...5    // <= 5
```

Detta skrivsätt betyder “ensidigt intervall” och används ofta i villkorsbedömningar eller mönstermatchning.

Intervalloperatorer kommer att användas senare när vi lär oss `for`-loopar. För tillfället räcker det att förstå dem som ett sammanhängande numeriskt intervall.

## Öva på operatorer

Nu ska vi genom några enkla exempel öva på vilken roll operatorer spelar i vyer.

### 1. Beräkna totalt antal fordon

Till exempel passerar 500 bilar ett visst vägkors varje dag. Beräkna hur många fordon som passerar under 30 dagar.

Vi kan använda beräkningsoperatorer:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Beräkningen här är att 500 fordon per dag under 30 dagar ger 500 × 30, vilket till slut blir totalt 15000 fordon.

### 2. Bedöma medlemskap i köp i app

Vi kan avgöra om en person är medlem genom köp i app. Så länge personen har antingen livstidsmedlemskap eller prenumerationsmedlemskap räknas den som medlem.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

I den här koden används operatorn `||` (eller): `lifeTime = false` betyder att det inte finns något livstidsmedlemskap, medan `subscription = true` betyder att det finns ett prenumerationsmedlemskap.

Eftersom det räcker att ett av villkoren är uppfyllt blir `isMember` `true`. Därför är personen medlem.

## Sammanfattning

I Swift är operatorer grunden för databeräkning och logisk bedömning. Precis som `Text` används för att visa innehåll, används operatorer för att hantera själva datan.

Från de enklaste sifferberäkningarna, till mer komplexa logiska bedömningar, till tillståndsstyrning och layoutberäkningar i vyer — överallt spelar operatorer en viktig roll.

Genom att öva i olika scenarier kan man gradvis bli bekant med och bemästra de olika typer av operatorer som introduceras i den här lektionen. Det är en viktig grund för fortsatt lärande.

### Utökad kunskap - bitoperatorer

Utöver detta erbjuder Swift också en mer låg nivå-typ av operatorer — bitoperatorer (Bitwise Operators):

* `&` (bitvis och)
* `|` (bitvis eller)
* `^` (bitvis xor)
* `~` (bitvis negation)
* `>>` (högerskift)
* `<<` (vänsterskift)

Till exempel:

```swift
let a = 6  // binärt 110
let b = 3  // binärt 011

print(a & b) // 2 (binärt 010)
print(a | b) // 7 (binärt 111)
print(a ^ b) // 5 (binärt 101)
print(~a)    // -7 (negation)
```

I Swift lagras heltal med binär tvåkomplementsrepresentation, så efter negation får man ett motsvarande negativt resultat.

Bitoperatorer arbetar direkt med binära värden och används oftast i låg-nivå-databehandling och scenarier med prestandaoptimering.

För nybörjare är användningsområdena för denna typ av operatorer relativt få, och de är heller inte särskilt vanliga i vanlig iOS- eller SwiftUI-utveckling. Därför går vi inte djupare in på dem här.

Om vi senare kommer in på låg-nivå-logik eller prestandaoptimering kan vi studera och förstå dem vidare då.
