# struct en class

In de vorige les zijn we net begonnen kennis te maken met `struct`, hebben we een structuur gedefinieerd en daarnaast ook kennis uitgebreid over protocollen, `UUID` en andere onderwerpen.

Nu hebben we al een eerste begrip van het trefwoord `struct`, maar we kunnen nog niet zeggen dat we het echt volledig begrijpen.

In deze les blijven we `struct` als kernonderwerp nemen, en maken we intussen ook kennis met `class`. Door deze les zul je duidelijker begrijpen: wat een instance is, wat een constructor is, en waarom we `struct` en `class` kunnen gebruiken om data te organiseren.

## Studentenbeheersysteem

Stel bijvoorbeeld dat we nu een studentenbeheersysteem willen ontwikkelen. Elke student heeft informatie zoals naam, geslacht, telefoon, leeftijd, huisadres enzovoort.

Op dat moment kunnen we deze informatie samenvoegen en definiëren als een `Student`-structuur:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Hier gebruiken we `struct` om een studenttype te definiëren.

Deze `Student`-structuur bevat meerdere eigenschappen:

- `id`: de unieke identificatie van de student
- `name`: de naam van de student
- `sex`: het geslacht van de student
- `phone`: het telefoonnummer van de student
- `age`: de leeftijd van de student
- `address`: het huisadres

Op die manier worden meerdere gegevens die oorspronkelijk verspreid waren, gecombineerd tot één volledige "student".

Hier volgt `Student` ook het protocol `Identifiable` en definieert het een `id`-veld, zodat het later handig is om data weer te geven samen met de `ForEach`-lus.

Daarna kunnen we een studentinstance maken:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Deze code betekent dat we op basis van de structuur `Student` concrete studentgegevens kunnen maken.

Hier is `Student` het type, en `Student(...)` vertegenwoordigt een gemaakte instance.

In SwiftUI kunnen we deze instance toewijzen aan een variabele en vervolgens weergeven.

Bijvoorbeeld:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Op deze manier kunnen we in de view de naam van deze student zien: `Fang Junyu`.

Hier hebben we eerst een `Student`-instance gemaakt, die vervolgens toegewezen aan de variabele `student`, en tenslotte de eigenschap gelezen via `student.name`.

## Wat is een instance

Wanneer we net beginnen met het leren van `struct`, kan het woord "instance" heel onbekend aanvoelen.

Maar in werkelijkheid gebruiken we instances al vanaf het begin, alleen hebben we daar eerder niet speciaal op gelet.

Bijvoorbeeld:

```swift
let name = "Fang Junyu"
```

Hier is `"Fang Junyu"` een stringwaarde, en in wezen is het een instance van het type `String`.

We kunnen het ook zo schrijven:

```swift
let name = String("Fang Junyu")
```

Deze twee schrijfwijzen drukken hetzelfde uit: een instance van het type `String` maken en die toewijzen aan de variabele `name`.

Hetzelfde geldt ook voor `Int`:

```swift
let num = 3
```

Hier is `3` in wezen een waarde van het type `Int`, en je kunt het ook begrijpen als een `Int`-instance.

Dus een instance is geen speciaal concept dat alleen in `struct` voorkomt.

Of het nu `String`, `Int`, `Double`, `Bool` of de zelfgemaakte `Student` is, ze kunnen allemaal instances maken.

Daarom geldt: wanneer we schrijven:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

dan is dat in wezen hetzelfde als het maken van een instance van `String` of `Int`; alleen is `Student` een type dat we zelf hebben gedefinieerd.

## Constructor

Wanneer we een instance maken:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

roepen we in feite de initialisatiemethode van `Student` aan, namelijk `init`.

Je kunt een constructor zo begrijpen: **het is het ingangspunt dat verantwoordelijk is voor het toekennen van waarden aan eigenschappen wanneer een instance wordt gemaakt.**

Dat wil zeggen: voordat een instance echt volledig gemaakt is, moet die meestal eerst door `init` heen.

Toen we bijvoorbeeld eerder de lifecycle van SwiftUI-views leerden, schreven we code als deze:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Hier wordt `init()` uitgevoerd wanneer de `ContentView`-instance wordt gemaakt, terwijl `onAppear` pas wordt uitgevoerd wanneer de view echt op het scherm verschijnt. Met andere woorden: het maken van een view en het weergeven ervan zijn niet hetzelfde moment.

Op dezelfde manier roepen we, wanneer we `Student(...)` maken, ook de constructor van `Student` aan.

### Constructor die automatisch door het systeem wordt gegenereerd

Toen we `Student` definieerden, hebben we `init` niet handmatig geschreven:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Toch kunnen we nog steeds direct een instance maken:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Waarom kunnen we een instance maken zonder een constructor te schrijven?

Omdat bij `struct`, als we niet handmatig een constructor schrijven, het systeem meestal automatisch een geschikte constructor voor ons genereert.

In de beginfase van het leren kun je dit eenvoudig zo begrijpen: Swift vult de initialisatiecode automatisch voor ons aan.

Ruwweg kun je het zien alsof het systeem de volgende code voor ons aanvult:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Hier moeten we op een klein detail letten:

```swift
let id = UUID()
```

`id` heeft al een standaardwaarde, dus wanneer we een instance maken, hoeven we `id` niet opnieuw handmatig door te geven.

Dat wil zeggen dat eigenschappen zonder standaardwaarde meestal in de constructor moeten worden meegegeven; eigenschappen die al een standaardwaarde hebben, kunnen meestal direct die oorspronkelijke standaardwaarde gebruiken.

Daarom hoeven we bij het maken van een `Student`-instance alleen `name`, `sex`, `phone`, `age` en `address` door te geven.

### Hints van de compiler

Bovendien kunnen we, wanneer we `Student(...)` in Xcode typen, ook de parameterhints zien die door het systeem worden gegeven.

![student](../../Resource/022_student.png)

Dit laat in feite ook zien dat het huidige type echt een door het systeem automatisch gegenereerde constructor heeft.

### Zelf een constructor schrijven

Hoewel het systeem automatisch een constructor kan genereren, past deze standaardmanier van initialiseren soms niet volledig bij onze behoeften.

Bijvoorbeeld, we hebben een `Movie`-structuur:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Volgens de automatisch gegenereerde constructor van het systeem moeten we bij het maken van een instance deze drie parameters tegelijk meegeven:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Maar als we nu een reeks oude films willen invoeren en alleen de filmnaam weten, maar de regisseur en beoordeling niet, dan is dat wat onhandig.

Want dan kunnen we het alleen zo schrijven:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Hoewel dit werkt, is het niet handig om elke keer opnieuw `--` te schrijven.

Dan kunnen we een constructor schrijven:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Op die manier hoeven we bij het maken van oude films alleen `name` door te geven:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Dit is een van de betekenissen van zelf een constructor schrijven: **de manier waarop instances worden gemaakt beter laten aansluiten op de werkelijke behoeften.**

### Een custom constructor analyseren

Laten we kijken naar deze handgeschreven constructor van zojuist:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

De betekenis van deze code is dat we bij het maken van een `Movie`-instance slechts één parameter hoeven door te geven: `name`.

Daarna zal de constructor intern de doorgegeven `name` toewijzen aan de eigen `name` van de instance, en `director` en `rating` de standaardwaarde `--` geven.

Hier betekent `self`: "deze huidige instance zelf".

Bijvoorbeeld:

```swift
self.name = name
```

De `self.name` aan de linkerkant verwijst naar de eigenschap van de instance; de `name` aan de rechterkant verwijst naar de parameter die we hebben doorgegeven.

Je kunt dit eenvoudig begrijpen als het opslaan van de van buitenaf doorgegeven waarde in de eigenschap van de instance zelf.

Wanneer alle eigenschappen een waarde hebben gekregen, is het maken van deze instance voltooid.

### Het mechanisme van de constructor

Wanneer we expliciet een constructor declareren, verandert er ook nog iets anders:

de constructor die oorspronkelijk automatisch door het systeem werd gegenereerd, kan meestal niet meer direct worden gebruikt.

Bijvoorbeeld:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Als we nu opnieuw zo schrijven:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

dan zal de compiler een fout geven:

```swift
Extra arguments at positions #2, #3 in call
```

Dat betekent: je hebt extra parameters doorgegeven.

Waarom verschijnt deze fout?

Omdat er in de huidige `Movie`-structuur alleen nog deze ene constructor bestaat, die je handmatig hebt gedeclareerd:

```swift
init(name: String)
```

Die accepteert alleen één parameter, `name`, en accepteert `director` en `rating` niet.

Met andere woorden, zodra je handmatig je eigen constructor toevoegt, kan de oorspronkelijk automatisch gegenereerde initialisatiestijl niet meer direct worden gebruikt.

Als we zowel "alleen een naam doorgeven" als "volledige informatie doorgeven" willen ondersteunen, moeten we zelf nog een volledige constructor toevoegen:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Zo hebben we twee verschillende constructors.

Bij het maken van een oude film kunnen we zo schrijven:

```swift
Movie(name: "The Night of the Hunter")
```

Bij het maken van een nieuwe film met volledige informatie kunnen we zo schrijven:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Deze manier van schrijven laat ook zien dat hetzelfde type meerdere constructors kan hebben, zolang de vorm van hun parameters verschillend is.

## Wat is overloading

Hier vullen we nog een noodzakelijk kennis punt aan.

Zojuist hebben we twee `init`-methoden voor `Movie` geschreven:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Deze manier van schrijven, "dezelfde functienaam maar verschillende parameters", heet "overloading".

Hier heten beide functies `init`, maar omdat ze verschillende parameters ontvangen, kan Swift onderscheiden welke functie je aanroept.

Bijvoorbeeld:

```swift
Movie(name: "Days of Heaven")
```

roept aan:

```swift
init(name: String)
```

Terwijl:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

de andere volledige versie van de initialisatiemethode aanroept.

De rol van overloading is dus: hetzelfde type verschillende manieren geven om zichzelf te maken in verschillende situaties.

## Kennismaken met class

Laten we daarna ook kort kennis maken met `class`.

Naast de gebruikelijke `struct` in Swift gebruiken veel programmeertalen `class` om instances te maken, zoals Java, C#, Kotlin enzovoort.

In Swift lijkt de schrijfwijze van `class` sterk op die van `struct`.

Bijvoorbeeld:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Je zult merken dat, behalve dat het trefwoord verandert van `struct` naar `class`, de overige delen er bijna hetzelfde uitzien.

Ook de manier om een instance te maken lijkt sterk op elkaar:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Dus op syntactisch niveau lijken `struct` en `class` inderdaad erg op elkaar.

### Het verschil tussen Struct en Class

Hoewel `struct` en `class` erg op elkaar lijken, zijn ze niet volledig hetzelfde.

**1. De manier van initialiseren is anders**

Voor `struct` geldt dat, als we niet handmatig een constructor schrijven, het systeem meestal automatisch een geschikte initialisatiemethode genereert.

Maar voor `class` geldt dat, als er eigenschappen zijn die nog geen standaardwaarde hebben, we meestal handmatig `init` moeten schrijven, anders ontstaat er een fout.

Bijvoorbeeld:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Deze `class` veroorzaakt een fout omdat er geen constructor is, waardoor de eigenschappen niet geïnitialiseerd worden.

De compiler zal iets tonen als:

```swift
Class 'Movie' has no initializers
```

Daarom moet `class` in dit voorbeeld handmatig een constructor hebben.

**2. `struct` is een waarde-type, `class` is een referentie-type**

`struct` is een waarde-type, en `class` is een referentie-type.

In de beginfase hoef je deze twee concepten nog niet volledig te beheersen; een eenvoudige eerste indruk is voldoende.

Bijvoorbeeld, `struct` lijkt meer op "een nieuwe waarde kopiëren".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Hier, nadat `user1` aan `user2` is toegewezen, is het alsof er een nieuwe kopie van de data is gemaakt, dus een wijziging van `user2` beïnvloedt `user1` niet.

Aan de andere kant lijkt `class` meer op "samen naar dezelfde instance verwijzen".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Hier verwijzen `user1` en `user2` naar dezelfde instance.

Op dit moment hoeven we het interne mechanisme van waarde- en referentie-types nog niet volledig te begrijpen; het is genoeg om te weten dat `struct` geschikter is om onafhankelijke data op te slaan, terwijl `class` geschikter is wanneer meerdere plekken dezelfde instance moeten delen.

## Hoe kies je in de beginfase

In de huidige fase kun je voor gewone datamodellen het beste eerst `struct` overwegen; wanneer gedeelde data en gesynchroniseerde wijzigingen nodig zijn, kun je `class` overwegen.

Dit is geen absolute regel, maar voor beginners is het een voldoende praktische manier van beoordelen.

Vooral in SwiftUI zul je vaak merken dat `struct` al het grootste deel van het werk aankan.

Bovendien wordt in veel programmeermateriaal wat met `class` is gemaakt ook een "object" genoemd. In de beginfase kun je dat eenvoudig als een instance begrijpen, zonder er bewust een strikt onderscheid in te maken.

## Samenvatting

In deze les hebben we `struct` dieper bestudeerd en tegelijkertijd ook kennisgemaakt met `class`; beide kunnen worden gebruikt om types te definiëren.

Types kunnen instances maken. Wanneer een instance wordt gemaakt, wordt de constructor, dus `init`, aangeroepen.

Voor `struct` geldt dat, als we niet handmatig een constructor schrijven, het systeem meestal automatisch een geschikte constructor genereert. Als de standaardconstructor niet aan de behoeften voldoet, kunnen we ook zelf een constructor schrijven.

Daarnaast hebben we ook een eerste begrip gekregen van het verschil tussen `struct` en `class`: `struct` is een waarde-type, terwijl `class` een referentie-type is. In SwiftUI kom je in de beginfase meestal vaker `struct` tegen.

Later, wanneer we leren over waarden doorgeven tussen views, datamodellen en statusbeheer, zal al deze inhoud opnieuw worden gebruikt.
