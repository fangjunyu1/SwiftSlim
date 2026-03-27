# Typesysteem

In de vorige lessen hebben we al variabelen geleerd en gezien dat een variabele gegevens van verschillende typen kan opslaan.

Bijvoorbeeld:

```swift
var hello = "Hello, World"
```

Hier bewaart `hello` een stuk tekst, dus het type is `String`.

Vervolgens gaan we systematisch het concept type (`Type`) leren, samen met expliciete typedeclaratie en type-inferentie, zodat we de aard van variabelen beter begrijpen.

## Wat is een type

In Swift heeft elke waarde een duidelijk type. Het type bepaalt wat die waarde is en wat je ermee kunt doen.

Bijvoorbeeld:

- `42` is een `Int` (geheel getal)
- `"Hello"` is een `String` (tekenreeks)
- `true` is een `Bool` (booleaanse waarde)

Ze behoren tot verschillende typen en hebben ook verschillende toepassingen.

## Veelvoorkomende basistypen in Swift

Voor beginners zijn de meest voorkomende typen:

- `String`: tekst
- `Int`: geheel getal
- `Double`: getal met decimalen, met relatief hoge precisie
- `Bool`: booleaanse waarde (`true/false`)

Daarnaast zijn er ook `Float` (kommagetal met lagere precisie dan `Double`, meestal minder gebruikt) en `Character` (een enkel teken), zoals `"A"` of `"!"`.

### Typedeclaratie (expliciet type)

In Swift kun je bij het declareren van een variabele handmatig het type opgeven:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Na de variabelenaam voeg je `: Type` toe om het type van de variabele te declareren.

Voor arrays schrijf je het type als `: [Type]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

In dit codefragment kan de array `scores` alleen elementen van het type `Int` opslaan, en `tags` alleen `String`.

Een expliciete typedeclaratie maakt de bedoeling van de code duidelijker en kan in sommige gevallen fouten door verkeerde type-inferentie voorkomen.

## Type-inferentie

In veel gevallen hoef je het type niet expliciet te declareren:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Dat komt doordat de Swift-compiler op basis van de beginwaarde automatisch het type kan afleiden.

## Expliciete declaratie en type-inferentie

In eerdere lessen hebben we geen expliciete declaraties gebruikt, zoals:

```swift
var age: Int = 18
```

In plaats daarvan gaven we voorrang aan type-inferentie:

```swift
var age = 18
```

In dit voorbeeld zijn beide schrijfwijzen equivalent: `age` wordt in beide gevallen bepaald als het type `Int`. Vergeleken daarmee is de versie met type-inferentie korter en eenvoudiger.

We hebben in het begin niet de nadruk gelegd op expliciete declaratie, omdat type-inferentie extra code-informatie weglaat en zo de leerdrempel voor beginners verlaagt.

## Waarom hebben we typen nodig

Swift is een sterk getypeerde taal (`Strongly Typed Language`).

Dat betekent: zodra het type van een variabele vastligt, kun je het niet zomaar veranderen.

Bijvoorbeeld:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

De eerste `20` is van het type `Int` en kan dus aan `age` worden toegewezen. De tweede `"20"` is van het type `String`, wat niet overeenkomt met `Int`, dus dat geeft een fout.

`nums` is een array van het type `[Int]` en kan alleen gehele getallen opslaan, niet ineens een string ertussen.

Typen begrenzen hoe gegevens gebruikt mogen worden. Daardoor kunnen problemen met niet-overeenkomende typen al tijdens het compileren worden gevonden, wat minder typeverwarring, minder bugs en stabielere, beter onderhoudbare code oplevert.

## Wanneer moet je expliciet een type declareren

Hoewel Swift typen automatisch kan afleiden, zijn er situaties waarin de compiler dat niet kan of het verkeerde type kiest. Dan moet je handmatig declareren.

**1. Lege arrays**

Bij het maken van een lege array moet je het type expliciet opgeven:

```swift
var nums: [Int] = []
```

Als je het type niet schrijft:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

De compiler kan uit een lege array niet afleiden welk type elementen erin horen, dus ontstaat er een compileerfout.

**2. Verkeerde inferentie voorkomen**

```swift
var value = 10   // Int
```

In dit voorbeeld zou `10` ook een kommagetal (`Double`) kunnen voorstellen, maar omdat er geen decimaal punt staat, leidt de compiler standaard `Int` af.

Als je wilt dat `value` een kommagetal is, moet je het type expliciet declareren:

```swift
var value: Double = 10   // Double
```

Als de uitkomst van type-inferentie niet overeenkomt met je bedoeling, kun je dat corrigeren door expliciet een type op te geven of de letterlijke waarde anders te schrijven.

**3. Zelfgedefinieerde typen**

Later leren we ook zelfgedefinieerde typen. Bij het gebruik daarvan is expliciete declaratie meestal ook nodig:

```swift
var info: GameInfo
var users: [User] = []
```

De reden is vergelijkbaar met die van een lege array: de compiler kan uit een lege waarde niet automatisch het juiste type afleiden.

## Typeconversie

In Swift worden verschillende typen niet automatisch naar elkaar omgezet. Je moet dat handmatig doen.

Bijvoorbeeld twee getallen van verschillend type optellen:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Hier is `a` van het type `Int` en `b` van het type `Double`. Omdat de typen verschillend zijn, kun je ze niet direct samen gebruiken in een berekening.

Voor de berekening moet je eerst een van de twee waarden omzetten naar hetzelfde type:

```swift
var result = Double(a) + b
```

Deze code zet `a` van `Int` om naar `Double` en telt het daarna op bij `b`. Het resultaat wordt aan `result` toegewezen.

Belangrijk: typeconversie verandert het type van de oorspronkelijke variabele niet. `Double(a)` maakt geen `Double` van `a`, maar creëert alleen tijdelijk een nieuwe `Double`-waarde voor de berekening.

Andere typen kunnen op vergelijkbare wijze worden omgezet, door de doelsoort te schrijven gevolgd door `()`, met daarin de waarde die je wilt omzetten. Bijvoorbeeld:

```
Int()、Double()、String()
```

Voorbeeld:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Let op: niet elke conversie slaagt op dezelfde manier. Bij `Double → Int` wordt het decimale gedeelte bijvoorbeeld direct afgeknipt en niet afgerond.

## Typealias

In Swift kun je een bestaand type ook een alias geven om de code semantisch duidelijker te maken:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Hier blijft `UserID` in wezen nog steeds `Int`. Het type verandert niet, alleen de naam wordt betekenisvoller.

In grotere projecten met complexere typen kan een typealias de leesbaarheid flink verbeteren.

## Voorbeeld van typen

Hieronder gebruiken we een eenvoudig voorbeeld om te laten zien welke rol typen spelen in echte ontwikkeling.

### Een variabele maken

Eerst maken we een variabele `age`:

```swift
var age = 20
```

Omdat we deze variabele in SwiftUI willen tonen en aanpassen, moeten we haar declareren met `@State`:

```swift
@State private var age = 20
```

`private` is eerder al genoemd. Het betekent dat deze variabele alleen binnen de huidige view gebruikt kan worden. Later komen we daar uitgebreider op terug.

### Gegevens in SwiftUI weergeven

Toon de variabele `age` in SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

De view toont dan:

```swift
age: 20
```

### Gegevens wijzigen

Daarna voegen we twee knoppen toe om `age` te wijzigen:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Uitvoering

Wanneer je op `changeAge1` klikt, krijgt `age` de waarde `18`:

```swift
age = 18
```

Omdat `18` van het type `Int` is en overeenkomt met het type van `age`, lukt deze toewijzing.

`changeAge2` geeft een fout:

```swift
age = "18"
```

Foutmelding:

```
Cannot assign value of type 'String' to type 'Int'
```

Dat komt doordat `"18"` een `String` is, want strings staan tussen dubbele aanhalingstekens, terwijl `age` een `Int` is. De typen komen dus niet overeen.

### Waarom ontstaat deze fout?

De kern zit in deze regel code:

```swift
@State private var age = 20   // Int
```

Hoewel het type niet expliciet is opgegeven, leidt de compiler uit de beginwaarde `20` af dat `age` van het type `Int` is.

Zodra het type vastligt, kun je er geen waarde van een ander type meer aan toekennen.

Bovendien faalt de knop `changeAge2` niet pas tijdens de uitvoering, maar al tijdens het compileren. De code komt dus niet eens door de compiler heen.

Dat is ook een van de voordelen van Swift als sterk getypeerde taal: typeproblemen kunnen al tijdens het schrijven van de code worden gevonden.

### Correcte schrijfwijze

Na het verwijderen van de foutieve code:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Wanneer je op de knop `changeAge1` klikt, wordt de view bijgewerkt naar:

```
age: 18
```

### Expliciet een type declareren (optioneel)

Je kunt bij de definitie ook expliciet het type opgeven:

```swift
@State private var age: Int = 20
```

Deze schrijfwijze maakt het type duidelijker, maar is in eenvoudige scenario's niet per se noodzakelijk.

## Samenvatting

Deze les ging vooral over het typesysteem van Swift en de rol ervan in echte ontwikkeling.

In Swift heeft elke waarde een duidelijk type. Het type bepaalt de betekenis van de data en welke bewerkingen ermee mogelijk zijn.

Swift is sterk getypeerd: zodra een variabele een type heeft, kun je er geen waarde van een ander type meer aan toekennen. Dankzij deze beperking kunnen fouten al tijdens het compileren worden gevonden, wat runtime-problemen vermindert en de veiligheid van de code vergroot.

Het type van een variabele kan automatisch uit de beginwaarde worden afgeleid of expliciet worden gedeclareerd. In sommige gevallen, zoals bij lege arrays, verkeerde inferentie of zelfgedefinieerde typen, kan de compiler het type niet correct afleiden en moet je het expliciet aangeven.

Verschillende typen worden niet automatisch naar elkaar omgezet; je moet daarvoor expliciet `Int()`, `Double()` of `String()` gebruiken.

Typen ondersteunen ook aliassen. Vooral in grotere projecten kunnen typealiassen de leesbaarheid verbeteren.

Een type is niet alleen een label op data, maar ook een vorm van beperking die ervoor zorgt dat data veilig, duidelijk en gecontroleerd wordt gebruikt.

## Uitbreidingskennis - optionals

Bij typeconversie kunnen sommige bewerkingen mislukken.

Bijvoorbeeld een `String` omzetten naar een `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Hier retourneert `Double(input)` geen `Double`, maar:

```
Double?
```

Dat is een optional.

### Waarom wordt een optional teruggegeven?

Omdat de inhoud van een string onzeker is. `"3.14"` kan worden omgezet naar een `Double`, maar `"Hello"` niet.

Dat betekent dat deze bewerking kan slagen, maar ook kan mislukken.

Daarom gebruikt Swift een optional om deze onzekerheid weer te geven.

### Wat is een optional?

Een optional betekent: een waarde kan bestaan, maar ook ontbreken.

Bijvoorbeeld:

```
Double?
```

Dit type betekent dat er, als er een waarde is, bij het afdrukken `Optional(...)` wordt getoond, en als er geen waarde is, `nil`.

Let op: `nil` betekent "geen waarde", niet `0` en ook niet een lege string.

### Voorbeeld

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Uitvoer:

```
pi:Optional(3.14)
```

Dit betekent dat de string met succes naar een `Double` is omgezet en `3.14` opleverde, maar omdat het type `Double?` is, wordt de waarde verpakt in `Optional`.

Als de conversie mislukt:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Uitvoer:

```
pi: nil
```

Omdat `"Hello"` niet kan worden omgezet naar een `Double`, mislukt de conversie en wordt `nil` teruggegeven.

### Wat is `Optional(...)`?

Wanneer we een optional direct afdrukken:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Toont Swift de debugbeschrijving:

```
Optional(3.14)
```

Dit is geen deel van de werkelijke data, maar een aanduiding dat de huidige waarde een optional is en intern een waarde bevat.

### Een optional uitpakken

In echte ontwikkeling moeten we meestal de werkelijke waarde uit een optional halen. Dat proces heet unwrappen (`Unwrapping`).

Een veelgebruikte manier is om met `??` een standaardwaarde te geven:

```
??
```

Dit heet de nil-coalescing operator.

Bijvoorbeeld:

```swift
name ?? "FangJunyu"
```

Deze code betekent: als `name` een waarde heeft, geef die waarde terug; als het `nil` is, gebruik dan de standaardwaarde `"FangJunyu"`.

Let erop dat het type van de standaardwaarde moet overeenkomen met het type in de optional.

### Een standaardwaarde geven met `??`

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Uitvoer:

```
pi: 30
```

Wanneer `input` naar een `Double` wordt omgezet, slaagt de conversie en wordt die waarde uitgevoerd. Als de conversie mislukt, wordt de standaardwaarde gebruikt die na `??` staat.

Als de conversie mislukt:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Uitvoer:

```
pi: 10
```

Hier mislukt de omzetting van `input` naar `Double` en geeft die `nil` terug. `??` levert dan een standaardwaarde voor `nil`.

Optionals worden gebruikt om situaties weer te geven waarin een waarde mogelijk bestaat, maar ook kan ontbreken.

Bij bewerkingen die kunnen mislukken, zoals typeconversie, retourneert Swift een optional om de veiligheid van het programma te garanderen.

Wanneer we die waarde echt nodig hebben, kunnen we met `??` een standaardwaarde geven, zodat we ook bij `nil` nog steeds een bruikbaar resultaat krijgen.
