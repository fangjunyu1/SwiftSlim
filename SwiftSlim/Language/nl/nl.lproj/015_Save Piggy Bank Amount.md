# Het bedrag van de spaarpot opslaan

In de vorige les hebben we een eenvoudige "spaarpot" gemaakt. In deze les leren we hoe we het bedrag van die "spaarpot" blijvend kunnen opslaan.

Deze les behandelt vooral `UserDefaults` en de property wrapper `@AppStorage`. Daarnaast leggen we ook de werking van `onAppear` verder uit en kijken we naar het gebruik van optional-typen (`nil`).

Let op: in deze les bouwen we verder op de code van de "spaarpot" uit de vorige les.

## Het probleem van blijvende opslag

De interface van de "spaarpot" is nu heel eenvoudig en prettig in gebruik.

![Piggy Bank](../../Resource/014_view.png)

Maar er is een duidelijk probleem: telkens wanneer de view wordt ververst of de app wordt gesloten, verandert het totaalbedrag van de "spaarpot" weer in `0`, en het eerder opgeslagen bedrag gaat verloren.

Dat betekent dat de gegevens niet echt zijn opgeslagen. Met andere woorden: de huidige "spaarpot" kan alleen tijdelijke data bewaren.

### Waarom kan dit niet blijvend worden opgeslagen?

Dat komt doordat we een variabele hebben gedeclareerd met `@State`:

```swift
@State private var amount = 0
```

Een variabele die met `@State` is gedeclareerd, hangt volledig af van de levenscyclus van de view.

Wanneer de view wordt aangemaakt, wordt `amount` geïnitialiseerd als `0`; wanneer de view wordt vernietigd, wordt `amount` ook vernietigd.

De gegevens in `amount` bestaan hier alleen in het geheugen en zijn niet op het apparaat opgeslagen.

Omdat we niet willen dat `amount` vastzit aan de levensduur van de view, moeten we blijvende opslag realiseren. Of anders gezegd: we moeten de data op het apparaat opslaan.

### Wat is "gegevenspersistentie"

Gegevenspersistentie kun je zien als het verplaatsen van data uit "tijdelijk geheugen" naar "opslag op het apparaat".

Wanneer de view of de app wordt gesloten, gaan de gegevens dan niet verloren.

In Swift-ontwikkeling kun je voor eenvoudige gegevenspersistentie `UserDefaults` gebruiken. Voor complexere gegevens zijn `SwiftData` of `CoreData` nodig.

In deze les leren we eerst de eenvoudigste optie: `UserDefaults`.

## `UserDefaults`

`UserDefaults` wordt gebruikt om lichte sleutel-waardegegevens op te slaan en is geschikt voor basistypen zoals `String`, `Int`, `Double` en `Bool`.

### Gegevens opslaan

Met de methode `set` kun je data opslaan in `UserDefaults`:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

De eerste parameter van `UserDefaults` is de data die moet worden opgeslagen, hier bijvoorbeeld van het type `String` of `Int`.

De tweede parameter `forKey` lijkt op een variabelenaam en wordt gebruikt om de opgeslagen data in `UserDefaults` te identificeren.

### Gegevens lezen

`UserDefaults` gebruikt bijpassende methoden om gegevens op te halen:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Bij het uitlezen moet je de methode gebruiken die overeenkomt met het type, anders kunnen fouten of onjuiste gegevens ontstaan.

### Belangrijke punten bij `UserDefaults`

#### 1. Geeft een optional terug

Bij het lezen van gegevens uit `UserDefaults` geven sommige methoden een optional terug.

Bijvoorbeeld:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Het type van `name` is dan:

```swift
String?
```

Dat betekent dat er mogelijk een waarde is, maar ook mogelijk niet.

**Waarom wordt er een optional teruggegeven?**

Dat komt doordat in `UserDefaults` niet zeker is dat er voor een bepaalde sleutel al gegevens bestaan.

Bijvoorbeeld:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Als de sleutel `"City"` nog nooit is opgeslagen, is het resultaat:

```swift
nil
```

Het is belangrijk te benadrukken dat `nil` betekent dat er geen gegevens zijn, en niet dat het om een lege string gaat.

In de les "Typesysteem" zijn we al iets vergelijkbaars tegengekomen: wanneer een typeconversie mislukt, wordt ook een optional teruggegeven.

Op dat moment gebruiken we `??` om een standaardwaarde te geven en de optional uit te pakken:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Als `UserDefaults` gegevens leest, wordt die waarde gebruikt. Als er niets wordt gevonden (`nil`), wordt de standaardwaarde gebruikt.

#### 2. Geeft een niet-optional terug

Bij het uitlezen van `Int`, `Double` en `Bool` geeft `UserDefaults` geen optional terug.

Bijvoorbeeld:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Zelfs als er nog nooit gegevens onder die sleutel zijn opgeslagen, is de teruggegeven waarde niet `nil`.

In plaats daarvan worden standaardwaarden teruggegeven:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Beperking van de hoeveelheid data

`UserDefaults` is alleen geschikt voor een kleine hoeveelheid gegevens, zoals app-instellingen of eenvoudige statussen.

In de praktijk is het niet geschikt voor grote hoeveelheden data of gegevens die heel vaak gelezen en geschreven worden.

## Het bedrag van de "spaarpot" opslaan

Nu kunnen we met `UserDefaults` de logica bouwen om het totaalbedrag van de "spaarpot" op te slaan.

Wanneer de gebruiker op de knop klikt, wordt het ingevoerde bedrag opgeteld bij het totaalbedrag, en daarna wordt dat totaal opgeslagen in `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nu hebben we de logica voor het schrijven van gegevens gerealiseerd.

## Uitleg van de logica voor blijvende opslag

Hoewel we nu de schrijflogica voor blijvende opslag hebben toegevoegd, zul je in de praktijk zien dat de variabele `amount` nog steeds `0` is wanneer de view wordt ververst of de app opnieuw wordt geopend.

Dat komt doordat:

```swift
@State private var amount = 0
```

In SwiftUI worden `@State`-variabelen opnieuw geïnitialiseerd wanneer de view wordt aangemaakt.

Ook al heeft `UserDefaults` de waarde van `amount` opgeslagen, wanneer de view opnieuw wordt geladen, wordt `amount` nog steeds teruggezet naar `0`.

Dat laat zien dat de data op dit moment alleen naar `UserDefaults` wordt geschreven, maar nog niet wordt teruggelezen in de view.

Daarom moeten we bij het laden van de view handmatig de gegevens uit `UserDefaults` ophalen en opnieuw toewijzen aan `amount`, zodat de volledige logica voor gegevenspersistentie werkt.

### Een logische vergelijking

Je kunt dit proces zien als een "schoolbord in een klaslokaal":

Tijdens de les schrijft de docent informatie op het bord. Die inhoud lijkt op de huidige status in de view (`@State`).

Wanneer de les voorbij is, wordt het bord uitgeveegd om plaats te maken voor de volgende les. Dat is vergelijkbaar met het vernietigen van de view, waarna de data in `@State` ook wordt gewist.

Om te voorkomen dat de lesinhoud verloren gaat, bewaart de docent de inhoud eerst in lesmateriaal. Dat lesmateriaal komt overeen met de gegevens die in `UserDefaults` zijn opgeslagen.

Wanneer de volgende les begint, is het bord opnieuw leeg (`@State` wordt opnieuw geïnitialiseerd), en moet de docent op basis van het lesmateriaal de oude kennis weer op het bord schrijven, oftewel: de gegevens uit `UserDefaults` opnieuw inlezen.

Belangrijk is dat het schoolbord de vorige inhoud niet automatisch terugkrijgt; dat kan alleen door "het lesmateriaal te lezen", dus door `UserDefaults` opnieuw uit te lezen.

## Gegevens lezen met `onAppear`

Wanneer de view verschijnt, moeten we handmatig de waarde uit `UserDefaults` ophalen en toewijzen aan de `@State`-variabele `amount`, zodat de gegevens echt blijvend beschikbaar zijn.

In SwiftUI kun je `onAppear` gebruiken om initialisatielogica uit te voeren wanneer de view verschijnt:

```swift
.onAppear {}
```

Plaats de code voor het uitlezen van `UserDefaults` in `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Wanneer de view wordt aangemaakt, wordt `amount` eerst geïnitialiseerd naar `0`; wanneer de view verschijnt, wordt `onAppear` geactiveerd en wordt de waarde uit `UserDefaults` opgehaald en aan `amount` toegewezen. Zo kan de view het laatst opgeslagen totaalbedrag tonen.

Nu is de volledige logica voor het blijvend opslaan van gegevens in de "spaarpot" klaar.

## Volledige code

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage` property wrapper

SwiftUI biedt de property wrapper `@AppStorage`, waarmee de opslaglogica van `UserDefaults` eenvoudiger wordt.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` is een omhulsel rond `UserDefaults`, waarbij `"amount"` overeenkomt met de sleutel in `UserDefaults`.

Wanneer de view wordt aangemaakt, worden gegevens uit `UserDefaults` ingelezen; wanneer de variabele verandert, wordt die automatisch teruggeschreven naar `UserDefaults`.

Het ondersteunt ook het statusupdatesysteem van SwiftUI en werkt net als `@State`: wanneer de waarde verandert, wordt de SwiftUI-view vernieuwd.

Met andere woorden: `@AppStorage` kan zowel de lees- als de schrijflogica van gegevens afhandelen. Je hoeft `UserDefaults` dan niet meer handmatig aan te roepen, en je hoeft `onAppear` ook niet meer te gebruiken om gegevens handmatig in te lezen.

Daarom kunnen we in de code `UserDefaults` vervangen door `@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Samenvatting

In deze les hebben we vooral de volgende punten geleerd:

Ten eerste wordt `UserDefaults` gebruikt om lichte gegevens op te slaan. We gebruikten `UserDefaults` om het totaalbedrag op het apparaat op te slaan. `UserDefaults` biedt methoden om gegevens te lezen en te schrijven, en daarbij moet je ook rekening houden met zaken als optional-typen.

Ten tweede dient een `@State`-variabele alleen om tijdelijke status in een view te beheren. De levensduur ervan is gebonden aan de view. Wanneer de view opnieuw wordt aangemaakt, wordt `@State` ook opnieuw geïnitialiseerd.

Bij het herstellen van gegevens uit `UserDefaults` hebben we geleerd `onAppear` te gebruiken om de gegevens te lezen wanneer de view verschijnt en zo het herstel uit te voeren.

Ten slotte gebruiken we `@AppStorage` als vervanging voor `UserDefaults`, zodat gegevens bij het laden van de view automatisch worden gelezen en bij wijzigingen automatisch worden opgeslagen. Daarmee wordt de handmatige logica met `UserDefaults` en `onAppear` vervangen.

Met deze kennis kunnen we een basisvorm van app-opslag realiseren, zodat gegevens blijvend bewaard kunnen worden.

## Oefeningen na de les

Nu ondersteunt de "spaarpot" het opslaan van bedragen, maar de functionaliteit is nog niet volledig.

1. Wanneer de gebruiker geld wil opnemen, moet je ook bijbehorende logica voor opnemen ontwerpen.
2. Wanneer de gebruiker het bedrag volledig wil wissen, moet je ook een resetlogica implementeren.
3. Als je de spaarpot een naam wilt geven, moet je ook gegevens van het type `String` gebruiken om die op te slaan.

Je kunt deze functies op basis van de bestaande code verder uitwerken, zodat de "spaarpot" completer wordt.

## Uitbreidingskennis - probleem met de standaardwaarde van het invoerveld

Nu kunnen we de interactie van het invoerveld verder verbeteren, zodat invoeren handiger wordt.

![textfield](../../Resource/015_view.png)

In de huidige implementatie is de standaardwaarde van het invoerveld `0`. Daardoor moet de gebruiker bij elke invoer eerst die `0` verwijderen en pas daarna een nieuw getal typen. Dat is geen prettige interactie.

We willen liever dat het invoerveld in het begin leeg is, in plaats van `0`.

Dat komt doordat `TextField` tweerichtingsgebonden is aan `number`:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Wanneer `number` met `0` wordt geïnitialiseerd, toont het invoerveld ook `0`.

Daarom moeten we `number` veranderen naar een lege waarde, oftewel `nil`.

```swift
@State private var number = nil
```

Dan ontstaat er een fout:

```
Generic parameter 'Value' could not be inferred
```

Dit is precies de situatie die we in de les "Typesysteem" hebben genoemd: wanneer de compiler het type van een variabele niet automatisch kan afleiden, moet je het type expliciet declareren.

Omdat we `number` op `nil` zetten en `nil` zelf geen type-informatie bevat, kan de compiler niet bepalen of deze variabele een `String`, `Int` of iets anders moet zijn. Daarom ontstaat de fout.

Daarom moeten we het type van `number` expliciet declareren:

```swift
@State private var number:Int? = nil
```

Hier betekent `Int?` een optional-type (`Optional`): de waarde van `number` kan dus een `Int` zijn, maar ook `nil`.

Zo kunnen we het bij de initialisatie op `nil` zetten, waardoor het invoerveld leeg wordt weergegeven in plaats van `0`.

### Een optional uitpakken

Wanneer we `number` veranderen naar een optional-type, geeft de oorspronkelijke berekeningscode een fout:

```swift
amount += number
```

De melding is:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Dat komt doordat `number` nu `nil` kan zijn. Als het direct meedoet in een berekening, krijg je eigenlijk:

```swift
amount += nil
```

Het is duidelijk dat `nil` niet bij `amount` kan worden opgeteld; dat is geen geldige bewerking.

Daarom moet een optional eerst worden uitgepakt voordat hij in een berekening kan worden gebruikt.

Hier kunnen we `??` gebruiken om een standaardwaarde te geven:

```swift
amount += number ?? 0
```

Wanneer `number` `nil` is, wordt de standaardwaarde `0` gebruikt; wanneer `number` een waarde heeft, wordt de werkelijke invoer gebruikt.

Zo blijft de berekening correct en wordt tegelijk bereikt dat het invoerveld standaard leeg is, zodat de gebruiker niet telkens eerst de `0` hoeft te verwijderen.

## Uitgebreide code

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
