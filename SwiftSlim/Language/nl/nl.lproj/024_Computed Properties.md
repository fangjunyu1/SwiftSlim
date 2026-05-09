# Berekende eigenschap

In deze les leren we vooral over berekende eigenschappen.

Een berekende eigenschap wordt gebruikt om op basis van bestaande gegevens een nieuw resultaat te berekenen. Ze kan numerieke waarden berekenen, maar ook inhoud die in een SwiftUI-view moet worden weergegeven.

Bijvoorbeeld:

```swift
let a = 10
let b = 20
let c = a + b
```

Hier betekent `c` het resultaat nadat `a` en `b` bij elkaar zijn opgeteld.

In gewone code komt deze manier van schrijven vaak voor.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Tip: In de klikactie van `Button` kun je gewone Swift-code uitvoeren.

Maar als je vergelijkbare code rechtstreeks in de eigenschappen van een SwiftUI-view schrijft, ontstaat er een probleem.

Bijvoorbeeld:

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

Deze code geeft een foutmelding.

Op het eerste gezicht lijken `a` en `b` al vóór `c` te zijn geschreven, dus het lijkt alsof de waarde van `c` berekend kan worden.

Maar bij het declareren van eigenschappen in een struct kan deze schrijfwijze niet rechtstreeks worden gebruikt.

## Waarom kan c niet direct als a + b worden berekend?

Omdat `a`, `b` en `c` geen tijdelijke constanten zijn binnen de klikactie van een knop. Het zijn eigenschappen van de view `ContentView`.

Binnen de klikactie van een knop kan deze code normaal worden uitgevoerd:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Dat komt doordat de code na het klikken op de knop in volgorde wordt uitgevoerd. Eerst wordt `a` aangemaakt, daarna `b`, en tot slot wordt `c` berekend met `a + b`.

Maar wanneer je eigenschappen binnen een view declareert, is de situatie anders:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Hier zijn `a`, `b` en `c` allemaal eigenschappen van de view `ContentView`.

Wanneer de view `ContentView` wordt aangemaakt, moet Swift eerst deze eigenschappen voorbereiden. Om het aanmaakproces veilig te houden, staat Swift niet toe dat de standaardwaarde van een opgeslagen instantie-eigenschap rechtstreeks andere instantie-eigenschappen van dezelfde instantie leest.

Daarom geeft deze regel een foutmelding:

```swift
let c = a + b
```

Je kunt het eenvoudig zo begrijpen: **wanneer je eigenschappen binnen een view declareert, kun je niet rechtstreeks één gewone eigenschap gebruiken om een andere gewone eigenschap te berekenen.**

Een eigenschap die een waarde rechtstreeks opslaat, wordt een “opgeslagen eigenschap” genoemd. Om het gemakkelijker te begrijpen, kun je dit voorlopig zien als een gewone eigenschap.

Bijvoorbeeld:

```swift
let a = 10
```

`a` slaat `10` op.

```swift
let b = 20
```

`b` slaat `20` op.

Maar:

```swift
let c = a + b
```

Hier is `c` geen vaste waarde die rechtstreeks is geschreven. Het is bedoeld om via `a + b` te worden berekend.

Voor zo’n situatie, waarin je “op basis van bestaande gegevens een resultaat krijgt”, is een berekende eigenschap geschikter.

Je kunt het zo aanpassen:

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

Hier is `c` een berekende eigenschap.

```swift
var c: Int {
    return a + b
}
```

De betekenis is: **wanneer `c` nodig is, worden `a` en `b` gelezen, en wordt het resultaat van `a + b` teruggegeven.**

Bijvoorbeeld:

```swift
Text("c: \(c)")
```

Wanneer `Text` `c` weergeeft, wordt de berekening van `c` uitgevoerd.

## Wat is een berekende eigenschap?

Een berekende eigenschap lijkt op een variabele, maar slaat zelf geen gegevens op.

Bijvoorbeeld:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Hier is `c` een berekende eigenschap.

Ze slaat geen vaste waarde op zoals een gewone eigenschap. Elke keer dat `c` wordt gelezen, wordt de code binnen `{}` opnieuw uitgevoerd en wordt het berekende resultaat teruggegeven.

Je kunt het zo begrijpen:

```swift
var c: Int {
    return a + b
}
```

Wanneer `c` nodig is, wordt `a + b` berekend.

Daarom is een berekende eigenschap geschikt voor deze situatie: **een resultaat hoeft niet apart te worden opgeslagen, omdat het op basis van bestaande gegevens kan worden berekend.**

## Basisnotatie

Een berekende eigenschap bestaat meestal uit drie delen:

```swift
var c: Int {
    return a + b
}
```

### 1. Declareren met `var`

```swift
var c
```

Een berekende eigenschap moet met `var` worden gedeclareerd. `let` kan niet worden gebruikt.

Dat komt doordat een berekende eigenschap geen vast opgeslagen waarde is, maar een resultaat dat telkens dynamisch wordt berekend wanneer het wordt gelezen.

### 2. Het retourtype aangeven

```swift
var c: Int
```

Een berekende eigenschap moet een retourtype aangeven.

Hier geeft `c` uiteindelijk een geheel getal terug, dus het type is `Int`.

### 3. De berekeningslogica schrijven binnen {}

```swift
{
    return a + b
}
```

Binnen `{}` schrijf je de berekeningslogica. Hier wordt `a + b` teruggegeven.

## Het sleutelwoord return

Een berekende eigenschap moet een resultaat teruggeven.

Bijvoorbeeld:

```swift
var c: Int {
    return a + b
}
```

Hier betekent `return`: geef het berekende resultaat van `a + b` terug.

Als een berekende eigenschap slechts één expressie bevat die direct een resultaat oplevert, kan `return` worden weggelaten:

```swift
var c: Int {
    a + b
}
```

Maar als een berekende eigenschap meerdere regels code bevat, moet je `return` gebruiken om duidelijk aan te geven welk resultaat wordt teruggegeven.

Bijvoorbeeld:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Hier is het berekeningsproces verdeeld in twee stappen.

De eerste stap is het berekenen van de totaalprijs:

```swift
let total = count * price
```

De tweede stap is het samenvoegen van de totaalprijs tot tekst en deze teruggeven:

```swift
return "Total：\(total) $"
```

Als je `return` verwijdert:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

dan geeft deze code een foutmelding.

De reden is: **deze berekende eigenschap bevat al meerdere regels code, waardoor Swift niet automatisch kan bepalen welke regel het uiteindelijke resultaat is dat moet worden teruggegeven.**

Dus wanneer een berekende eigenschap slechts één expressie bevat die direct een resultaat oplevert, kan `return` worden weggelaten.

```swift
var c: Int {
    a + b
}
```

Wanneer een berekende eigenschap meerdere regels code bevat, is het beter om `return` duidelijk te schrijven.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Het verschil tussen een berekende eigenschap en een gewone eigenschap

Een gewone eigenschap slaat gegevens op.

```swift
var c = 30
```

Hier slaat `c` een concrete waarde op: `30`.

Een berekende eigenschap slaat geen gegevens op.

```swift
var c: Int {
    a + b
}
```

Hier slaat `c` geen `30` op. Ze biedt alleen een manier om iets te berekenen.

Wanneer `c` wordt gelezen, voert Swift dit uit:

```swift
a + b
```

Daarna wordt het berekende resultaat teruggegeven.

Daarom is een berekende eigenschap geschikt voor situaties waarin een resultaat op basis van andere gegevens moet worden berekend.

## body is ook een berekende eigenschap

Nadat we berekende eigenschappen hebben geleerd, kunnen we deze veelvoorkomende SwiftUI-code opnieuw begrijpen:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Hier is `body` ook een berekende eigenschap.

Ze wordt gedeclareerd met `var`:

```swift
var body
```

Ze heeft een retourtype:

```swift
some View
```

Binnen `{}` wordt SwiftUI-viewinhoud teruggegeven:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Daarom kun je `body` zo begrijpen: wanneer SwiftUI deze view moet weergeven, leest SwiftUI `body` en maakt het de interface op basis van de inhoud die `body` teruggeeft.

Als je `return` schrijft, kun je het zo begrijpen:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Maar in SwiftUI laten we `return` meestal weg en schrijven we direct:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Wanneer `@State`-gegevens veranderen, leest SwiftUI `body` opnieuw en werkt het de interface bij op basis van de nieuwe gegevens.

Bijvoorbeeld:

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

Nadat de knop is aangeklikt, verandert `count`.

```swift
count += 1
```

Wanneer `count` verandert, berekent SwiftUI `body` opnieuw. Daarom wordt de tekst in de interface ook bijgewerkt.

```swift
Text("count: \(count)")
```

Dit is ook de reden waarom de interface in SwiftUI automatisch kan worden vernieuwd nadat gegevens zijn veranderd.

### Het wordt niet aanbevolen om complexe berekeningen in body te schrijven

Omdat `body` een berekende eigenschap is, kan ze meerdere keren worden gelezen en opnieuw worden berekend.

Bijvoorbeeld:

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

Wanneer `name` verandert, berekent SwiftUI `body` opnieuw.

Op dat moment wordt de code binnen `body` opnieuw uitgevoerd, en wordt `num` ook opnieuw aangemaakt.

```swift
let num = 10
```

In dit voorbeeld is `num` erg eenvoudig, dus de invloed is klein.

Maar als je in `body` complexe berekeningen uitvoert, zoals het filteren of sorteren van grote hoeveelheden data, of beeldverwerking, dan kan dit invloed hebben op de vloeiendheid van de interface.

Daarom zou `body` in SwiftUI vooral verantwoordelijk moeten zijn voor het beschrijven van de interfacestructuur.

Eenvoudige tijdelijke gegevens kun je in `body` schrijven.

Complexe berekeningen kun je beter buiten `body` plaatsen, bijvoorbeeld in een berekende eigenschap, een methode of een aparte gegevensverwerkingslaag.

## Voorbeeld: aantal en totaalprijs

Hierna gebruiken we een eenvoudig voorbeeld om berekende eigenschappen te begrijpen.

Stel dat één wortel 2 $ kost. De gebruiker kan op knoppen klikken om het aantal te wijzigen, en de interface moet de totaalprijs tonen.

De totaalprijs wordt zo berekend:

```text
Aantal * Eenheidsprijs
```

Als je de totaalprijs in een gewone variabele opslaat, wordt dat wat omslachtig.

Want elke keer dat het aantal verandert, moet je de totaalprijs handmatig bijwerken.

Een betere manier is het gebruiken van een berekende eigenschap:

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

Weergaveresultaat:

![view](../../Resource/024_view.png)

In dit voorbeeld:

```swift
@State private var count = 1
```

`count` betekent het aantal wortels. Wanneer de knop wordt aangeklikt, verandert `count`.

```swift
private let price = 2
```

`price` betekent de eenheidsprijs van de wortel. Hier is het een vaste waarde, dus gebruiken we `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` betekent de totaalprijs.

Deze hoeft niet apart te worden opgeslagen, omdat de totaalprijs altijd kan worden berekend met `count * price`.

Wanneer `count` `1` is:

```swift
totalPrice = 1 * 2
```

is het weergegeven resultaat:

```swift
totalPrice: 2 $
```

Nadat op de knop `+` is geklikt, wordt `count` `2`.

Wanneer `totalPrice` dan opnieuw wordt gelezen, wordt deze opnieuw berekend:

```swift
totalPrice = 2 * 2
```

Het weergegeven resultaat is:

```swift
totalPrice: 4 $
```

Dit is de rol van een berekende eigenschap: op basis van bestaande gegevens dynamisch een nieuw resultaat berekenen.

## Een berekende eigenschap kan ook worden gebruikt voor een voorwaarde

Een berekende eigenschap kan niet alleen getallen berekenen, maar ook een beoordelingsresultaat teruggeven.

Bijvoorbeeld wanneer we willen dat het minimale aantal 1 is.

Wanneer het aantal al 1 is, zou de knop `-` het aantal niet verder moeten verlagen.

Daarvoor kunnen we een berekende eigenschap toevoegen:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Volledige code:

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

Weergaveresultaat:

![view](../../Resource/024_view1.png)

Hier betekent:

```swift
private var canDecrease: Bool {
    count > 1
}
```

of het huidige aantal nog verder kan worden verlaagd.

Wanneer `count` groter is dan `1`:

```swift
canDecrease == true
```

betekent dit dat het aantal kan worden verlaagd.

Wanneer `count` gelijk is aan `1`:

```swift
canDecrease == false
```

betekent dit dat het aantal niet verder kan worden verlaagd.

### Voorwaarde in de knop

In de knop wordt deze code gebruikt:

```swift
if canDecrease {
    count -= 1
}
```

Alleen wanneer `canDecrease` `true` is, wordt `count` verlaagd.

### De voorgrondkleur van de view regelen

Je kunt `canDecrease` ook gebruiken om de voorgrondkleur van de knop te regelen:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Hier wordt de ternaire operator gebruikt:

```swift
canDecrease ? Color.primary : Color.gray
```

De betekenis van deze code is: als `canDecrease` `true` is, gebruikt de voorgrondkleur `Color.primary`; als `canDecrease` `false` is, gebruikt de voorgrondkleur `Color.gray`.

`Color.primary` is een systeemsemantische kleur die door SwiftUI wordt aangeboden. Ze staat voor de primaire tekstkleur in de huidige interface.

In de lichte modus ligt `Color.primary` meestal dicht bij zwart; in de donkere modus meestal dicht bij wit.

Het voordeel van `Color.primary` is dus dat deze automatisch wordt aangepast aan de lichte en donkere modus.

### De uitgeschakelde status van een view regelen

`disabled` wordt gebruikt om te bepalen of een view is uitgeschakeld:

```swift
.disabled(!canDecrease)
```

Wanneer `disabled` `false` is, kan de view worden aangeklikt.

Wanneer `disabled` `true` is, is de view uitgeschakeld en kan deze niet worden aangeklikt.

Hier wordt `canDecrease` als voorwaarde gebruikt, waardoor de code gemakkelijker te begrijpen is.

Wanneer je `canDecrease` ziet, begrijp je meteen dat het betekent: “kan het op dit moment nog verder worden verlaagd?”

### Aanvullende uitleg: waarom wordt er twee keer gecontroleerd?

In de knop `-`:

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

Hier wordt zowel `.disabled(!canDecrease)` gebruikt als `if canDecrease` binnen de knop.

`.disabled(!canDecrease)` schakelt de knop uit op interfaceniveau, zodat de gebruiker er niet op kan klikken.

`if canDecrease` controleert nogmaals voordat de code wordt uitgevoerd. Alleen wanneer het aantal kan worden verlaagd, wordt `count -= 1` uitgevoerd.

Dit is dubbele bescherming. In echte ontwikkeling kun je de interne controle weglaten als de knop al is uitgeschakeld. Maar in een leervoorbeeld kan het behouden ervan de rol van `canDecrease` duidelijker maken.

## Samenvatting

In deze les hebben we vooral berekende eigenschappen geleerd.

Een berekende eigenschap slaat de waarde niet rechtstreeks op. Wanneer ze wordt gelezen, berekent ze een resultaat op basis van bestaande gegevens.

Bijvoorbeeld:

```swift
var c: Int {
    a + b
}
```

Hier hoeft `c` niet apart te worden opgeslagen, omdat ze via `a + b` kan worden berekend.

Een berekende eigenschap moet met `var` worden gedeclareerd, en het retourtype moet worden aangegeven.

```swift
var canDecrease: Bool {
    count > 1
}
```

Een berekende eigenschap kan niet alleen numerieke waarden teruggeven, maar ook beoordelingsresultaten, tekstinhoud en zelfs SwiftUI-viewinhoud.

In deze les hebben we ook `return` geleerd.

`return` betekent dat een resultaat wordt teruggegeven:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Als een berekende eigenschap slechts één expressie bevat die direct een resultaat oplevert, kan `return` worden weggelaten.

```swift
var totalPrice: Int {
    count * price
}
```

Daarnaast hebben we ook `Color.primary` en `disabled` leren kennen.

`Color.primary` is een systeemsemantische kleur van SwiftUI. Ze past het weergave-effect automatisch aan op basis van de lichte en donkere modus.

```swift
.foregroundStyle(Color.primary)
```

`disabled` wordt gebruikt om te bepalen of een view is uitgeschakeld.

```swift
.disabled(true)
```

Dit betekent uitgeschakeld en niet aanklikbaar.

```swift
.disabled(false)
```

Dit betekent beschikbaar en aanklikbaar.

Daarom komen berekende eigenschappen in SwiftUI zeer vaak voor. Ze helpen ons berekeningsresultaten, voorwaarden en weergegeven inhoud duidelijker te organiseren.
