# Beräknade egenskaper

I den här lektionen lär vi oss främst om beräknade egenskaper.

En beräknad egenskap används för att beräkna ett nytt resultat utifrån data som redan finns. Den kan beräkna numeriska värden, men också innehåll som behöver visas i en SwiftUI-vy.

Till exempel:

```swift
let a = 10
let b = 20
let c = a + b
```

Här betyder `c` resultatet efter att `a` och `b` har adderats.

I vanlig kod är det här sättet att skriva mycket vanligt.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tips: I klickhändelsen för `Button` kan vi köra vanlig Swift-kod.

Men om vi skriver liknande kod direkt i egenskaperna för en SwiftUI-vy uppstår ett problem.

Till exempel:

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

Den här koden ger ett fel.

Vid första anblick verkar `a` och `b` redan vara skrivna före `c`, så det kan se ut som att värdet för `c` borde kunna beräknas.

Men när vi deklarerar egenskaper i en struktur kan det här skrivsättet inte användas direkt.

## Varför kan c inte beräknas direkt som a + b?

Det beror på att `a`, `b` och `c` inte är tillfälliga konstanter i en knapphändelse. De är egenskaper i vyn `ContentView`.

I klickhändelsen för en knapp kan den här koden köras normalt:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Det beror på att koden körs i ordning efter att knappen har klickats. Först skapas `a`, sedan skapas `b`, och till sist beräknas `c` med `a + b`.

Men när egenskaper deklareras inuti en vy är situationen annorlunda:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Här är `a`, `b` och `c` alla egenskaper i vyn `ContentView`.

När vyn `ContentView` skapas måste Swift först förbereda dessa egenskaper. För att skapandeprocessen ska vara säker tillåter Swift inte att standardvärdet för en lagrad instansegenskap direkt läser andra instansegenskaper i samma instans.

Därför ger den här raden ett fel:

```swift
let c = a + b
```

Enkelt uttryckt kan vi förstå det så här: **när vi deklarerar egenskaper inuti en vy kan vi inte direkt använda en vanlig egenskap för att beräkna en annan vanlig egenskap.**

En egenskap som lagrar ett värde direkt kallas en “lagrad egenskap”. För att göra det lättare att förstå kan vi tillfälligt se den som en vanlig egenskap.

Till exempel:

```swift
let a = 10
```

`a` lagrar `10`.

```swift
let b = 20
```

`b` lagrar `20`.

Men:

```swift
let c = a + b
```

Här är `c` inte ett fast värde som skrivs direkt. Det är tänkt att beräknas genom `a + b`.

I en sådan situation, där vi “får ett resultat utifrån befintliga data”, passar en beräknad egenskap bättre.

Koden kan ändras så här:

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

Här är `c` en beräknad egenskap.

```swift
var c: Int {
    return a + b
}
```

Det betyder: **när `c` behöver användas läses `a` och `b`, och resultatet av `a + b` returneras.**

Till exempel:

```swift
Text("c: \(c)")
```

När `Text` visar `c` utlöses beräkningen av `c`.

## Vad är en beräknad egenskap?

En beräknad egenskap ser ut som en variabel, men den lagrar inte själv data.

Till exempel:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Här är `c` en beräknad egenskap.

Den lagrar inte ett fast värde som en vanlig egenskap. Varje gång `c` läses körs koden i `{}` igen, och det beräknade resultatet returneras.

Det kan förstås så här:

```swift
var c: Int {
    return a + b
}
```

När `c` behövs beräknas `a + b`.

Därför passar en beräknad egenskap i den här situationen: **ett resultat behöver inte lagras separat, eftersom det kan beräknas utifrån data som redan finns.**

## Grundläggande skrivsätt

En beräknad egenskap består vanligtvis av tre delar:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklarera med `var`

```swift
var c
```

En beräknad egenskap måste deklareras med `var`; `let` kan inte användas.

Det beror på att en beräknad egenskap inte är ett fast lagrat värde, utan ett resultat som beräknas dynamiskt varje gång egenskapen läses.

### 2. Ange returtyp

```swift
var c: Int
```

En beräknad egenskap behöver ange returtyp.

Här returnerar `c` till slut ett heltal, så typen är `Int`.

### 3. Skriv beräkningslogiken i {}

```swift
{
    return a + b
}
```

I `{}` skriver vi beräkningslogiken. Här returneras `a + b`.

## Nyckelordet return

En beräknad egenskap måste returnera ett resultat.

Till exempel:

```swift
var c: Int {
    return a + b
}
```

Här betyder `return`: returnera resultatet av beräkningen `a + b`.

Om en beräknad egenskap bara har ett uttryck som direkt skapar resultatet kan `return` utelämnas:

```swift
var c: Int {
    a + b
}
```

Men om en beräknad egenskap innehåller flera rader kod behöver `return` användas för att tydligt ange resultatet som ska returneras.

Till exempel:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Här delas beräkningen upp i två steg.

Det första steget är att beräkna totalpriset:

```swift
let total = count * price
```

Det andra steget är att sammanfoga totalpriset till en text och returnera den:

```swift
return "Total：\(total) $"
```

Om vi tar bort `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

ger den här koden ett fel.

Orsaken är: **den här beräknade egenskapen innehåller redan flera rader kod, så Swift kan inte automatiskt avgöra vilken rad som är det slutliga resultatet som ska returneras.**

När en beräknad egenskap bara har ett uttryck som skapar resultatet kan `return` alltså utelämnas.

```swift
var c: Int {
    a + b
}
```

När en beräknad egenskap innehåller flera rader kod rekommenderas det att skriva `return` tydligt.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Skillnaden mellan en beräknad egenskap och en vanlig egenskap

En vanlig egenskap lagrar data.

```swift
var c = 30
```

Här lagrar `c` ett konkret värde: `30`.

En beräknad egenskap lagrar inte data.

```swift
var c: Int {
    a + b
}
```

Här lagrar `c` inte `30`. Den ger bara ett sätt att beräkna värdet.

När `c` läses kör Swift:

```swift
a + b
```

Sedan returneras det beräknade resultatet.

Därför passar beräknade egenskaper i situationer där ett resultat behöver beräknas utifrån andra data.

## body är också en beräknad egenskap

Efter att ha lärt oss beräknade egenskaper kan vi förstå den vanligaste SwiftUI-koden på nytt:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Här är `body` också en beräknad egenskap.

Den deklareras med `var`:

```swift
var body
```

Den har en returtyp:

```swift
some View
```

Innehållet som returneras i `{}` är SwiftUI-vyns innehåll:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Därför kan `body` förstås så här: när SwiftUI behöver visa den här vyn läser SwiftUI `body` och skapar gränssnittet baserat på innehållet som `body` returnerar.

Om vi skriver `return` kan det förstås så här:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Men i SwiftUI utelämnar vi vanligtvis `return` och skriver direkt:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

När `@State`-data ändras läser SwiftUI `body` igen och uppdaterar gränssnittet utifrån de nya data.

Till exempel:

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

Efter att knappen klickas ändras `count`.

```swift
count += 1
```

När `count` ändras beräknar SwiftUI `body` igen, så texten i gränssnittet uppdateras också.

```swift
Text("count: \(count)")
```

Detta är också anledningen till att gränssnittet i SwiftUI kan uppdateras automatiskt när data ändras.

### Det rekommenderas inte att skriva komplexa beräkningar i body

Eftersom `body` är en beräknad egenskap kan den läsas och beräknas om många gånger.

Till exempel:

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

När `name` ändras beräknar SwiftUI `body` igen.

Då körs också koden inuti `body` igen, och `num` skapas på nytt.

```swift
let num = 10
```

I det här exemplet är `num` väldigt enkel, så påverkan är liten.

Men om komplexa beräkningar utförs i `body`, till exempel filtrering av stora datamängder, sortering, bildbearbetning och liknande, kan det påverka hur mjukt gränssnittet fungerar.

Därför bör `body` i SwiftUI främst ansvara för att beskriva gränssnittets struktur.

Enkla tillfälliga data kan skrivas i `body`.

Komplexa beräkningar kan flyttas utanför `body`, till exempel till en beräknad egenskap, en metod eller en separat del för databehandling.

## Exempel: antal och totalpris

Nu ska vi förstå beräknade egenskaper med ett enkelt exempel.

Anta att priset för en morot är 2 $. Användaren kan klicka på knappar för att ändra antalet som ska köpas, och gränssnittet behöver visa totalpriset.

Sättet att beräkna totalpriset är:

```text
Antal * Styckpris
```

Om totalpriset lagras i en vanlig variabel blir det ganska besvärligt.

Det beror på att totalpriset måste uppdateras manuellt varje gång antalet ändras.

Ett bättre sätt är att använda en beräknad egenskap:

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

Visat resultat:

![view](../../Resource/024_view.png)

I det här exemplet:

```swift
@State private var count = 1
```

`count` betyder antalet morötter. När knappen klickas ändras `count`.

```swift
private let price = 2
```

`price` betyder styckpriset för moroten. Här är det ett fast värde, så vi använder `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` betyder totalpriset.

Det behöver inte lagras separat, eftersom totalpriset alltid kan beräknas med `count * price`.

När `count` är `1`:

```swift
totalPrice = 1 * 2
```

blir resultatet som visas:

```swift
totalPrice: 2 $
```

Efter att knappen `+` klickas blir `count` `2`.

När `totalPrice` då läses igen beräknas det på nytt:

```swift
totalPrice = 2 * 2
```

Resultatet som visas blir:

```swift
totalPrice: 4 $
```

Detta är rollen för en beräknad egenskap: att dynamiskt beräkna ett nytt resultat utifrån data som redan finns.

## En beräknad egenskap kan också användas för villkor

En beräknad egenskap kan inte bara beräkna tal, utan även returnera ett resultat av en kontroll.

Till exempel när vi vill att det minsta antalet ska vara 1.

När antalet redan är 1 ska knappen `-` inte kunna minska värdet ytterligare.

Då kan vi lägga till en beräknad egenskap:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Fullständig kod:

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

Visat resultat:

![view](../../Resource/024_view1.png)

Här betyder:

```swift
private var canDecrease: Bool {
    count > 1
}
```

om det aktuella antalet fortfarande kan minskas.

När `count` är större än `1`:

```swift
canDecrease == true
```

betyder det att antalet kan minskas.

När `count` är lika med `1`:

```swift
canDecrease == false
```

betyder det att antalet inte längre kan minskas.

### Villkorskontroll i knappen

I knappen används:

```swift
if canDecrease {
    count -= 1
}
```

Endast när `canDecrease` är `true` kan `count` minskas.

### Styra vyernas förgrundsfärg

Vi kan också använda `canDecrease` för att styra knappens förgrundsfärg:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Här används den ternära operatorn:

```swift
canDecrease ? Color.primary : Color.gray
```

Betydelsen är: om `canDecrease` är `true` används `Color.primary` som förgrundsfärg; om `canDecrease` är `false` används `Color.gray`.

`Color.primary` är en systemsemantisk färg som SwiftUI tillhandahåller. Den representerar den huvudsakliga textfärgen i det aktuella gränssnittet.

I ljust läge är `Color.primary` vanligtvis nära svart; i mörkt läge är den vanligtvis nära vitt.

Fördelen med att använda `Color.primary` är därför att den automatiskt anpassar sig till ljust och mörkt läge.

### Styra vyernas inaktiverade tillstånd

`disabled` används för att styra om en vy är inaktiverad:

```swift
.disabled(!canDecrease)
```

När `disabled` är `false` kan vyn klickas.

När `disabled` är `true` är vyn inaktiverad och kan inte klickas.

Här används `canDecrease` som villkor, vilket gör koden lättare att förstå.

När vi ser `canDecrease` kan vi direkt förstå att det betyder “om det fortfarande går att minska just nu”.

### Extra förklaring: varför kontrolleras det två gånger?

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

Här används både `.disabled(!canDecrease)` och `if canDecrease` inuti knappen.

`.disabled(!canDecrease)` ansvarar för att inaktivera knappen på gränssnittsnivå, så att användaren inte kan klicka på den.

`if canDecrease` kontrollerar villkoret en gång till innan koden körs. Endast när antalet kan minskas körs `count -= 1`.

Detta är ett dubbelt skydd. I faktisk utveckling kan den interna kontrollen utelämnas om knappen redan är inaktiverad. Men i ett undervisningsexempel kan den behållas för att göra rollen för `canDecrease` tydligare.

## Sammanfattning

I den här lektionen lärde vi oss främst om beräknade egenskaper.

En beräknad egenskap lagrar inte värdet direkt. När den läses beräknar den ett resultat utifrån data som redan finns.

Till exempel:

```swift
var c: Int {
    a + b
}
```

Här behöver `c` inte lagras separat, eftersom det kan beräknas med `a + b`.

En beräknad egenskap måste deklareras med `var`, och returtypen behöver anges.

```swift
var canDecrease: Bool {
    count > 1
}
```

En beräknad egenskap kan inte bara returnera numeriska värden, utan även villkorsresultat, textinnehåll och till och med innehåll i en SwiftUI-vy.

I den här lektionen lärde vi oss också `return`.

`return` betyder att returnera ett resultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Om en beräknad egenskap bara har ett uttryck som direkt skapar resultatet kan `return` utelämnas.

```swift
var totalPrice: Int {
    count * price
}
```

Dessutom lärde vi oss också om `Color.primary` och `disabled`.

`Color.primary` är en systemsemantisk färg i SwiftUI. Den anpassar automatiskt visningen efter ljust och mörkt läge.

```swift
.foregroundStyle(Color.primary)
```

`disabled` används för att styra om en vy är inaktiverad.

```swift
.disabled(true)
```

Det betyder inaktiverad och kan inte klickas.

```swift
.disabled(false)
```

Det betyder tillgänglig och kan klickas.

Därför är beräknade egenskaper mycket vanliga i SwiftUI. De hjälper oss att organisera beräkningsresultat, villkor och visat innehåll på ett tydligare sätt.
