# struct och class

I förra lektionen började vi precis komma i kontakt med `struct`, definierade en struktur och utökade samtidigt vår förståelse för protokoll, `UUID` och andra kunskapspunkter.

Nu har vi redan en grundläggande förståelse för nyckelordet `struct`, men vi kan fortfarande inte säga att vi verkligen förstår det.

I den här lektionen fortsätter vi att ha `struct` som huvudfokus och passar samtidigt på att lära känna `class`. Genom den här lektionen kommer du att förstå tydligare: vad en instans är, vad en konstruktor är och varför vi kan använda `struct` och `class` för att organisera data.

## System för studenthantering

Till exempel vill vi nu utveckla ett system för studenthantering. Varje student har information som namn, kön, telefon, ålder, hemadress och så vidare.

Vid det här tillfället kan vi kombinera den här informationen och definiera den som en `Student`-struktur:

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

Här använder vi `struct` för att definiera en studenttyp.

Den här `Student`-strukturen innehåller flera egenskaper:

- `id`: studentens unika identifierare
- `name`: studentens namn
- `sex`: studentens kön
- `phone`: studentens telefon
- `age`: studentens ålder
- `address`: hemadress

På så sätt kombineras flera tidigare spridda data till en komplett ”student”.

`Student` här följer också protokollet `Identifiable` och definierar ett `id`-fält, vilket gör det enklare att senare visa data tillsammans med `ForEach`-loopen.

Sedan kan vi skapa en studentinstans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Den här koden betyder att vi enligt strukturen `Student` kan skapa konkreta studentdata.

Här är `Student` typen, och `Student(...)` representerar en skapad instans.

I SwiftUI kan vi tilldela den här instansen till en variabel och sedan visa den.

Till exempel:

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

På så sätt kan vi i vyn se studentens namn: `Fang Junyu`.

Här skapade vi först en `Student`-instans, tilldelade den sedan till variabeln `student` och läste till sist en egenskap genom `student.name`.

## Vad är en instans

När vi precis börjar lära oss `struct` kan ordet ”instans” kännas väldigt obekant.

Men i själva verket har vi använt instanser ända från början, bara utan att särskilt lägga märke till det.

Till exempel:

```swift
let name = "Fang Junyu"
```

Här är `"Fang Junyu"` ett strängvärde, och i grunden är det en instans av typen `String`.

Vi kan också skriva så här:

```swift
let name = String("Fang Junyu")
```

De här två skrivsätten uttrycker samma sak: att skapa en instans av typen `String` och tilldela den till variabeln `name`.

På samma sätt fungerar det för `Int`:

```swift
let num = 3
```

Här är `3` i grunden ett värde av typen `Int`, och det kan också förstås som en `Int`-instans.

Därför är en instans inte något särskilt begrepp som bara förekommer i `struct`.

Oavsett om det är `String`, `Int`, `Double`, `Bool` eller vår egen `Student`, kan de alla skapa instanser.

Därför, när vi skriver:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Är det i grunden samma sak som att skapa instanser av `String` eller `Int`, bara att `Student` är en typ som vi själva har definierat.

## Konstruktor

När vi skapar en instans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Anropar vi i själva verket `Student`-typens initialiseringsmetod, alltså `init`.

Du kan förstå konstruktorn som: **ingången som ansvarar för att tilldela värden till egenskaper när en instans skapas.**

Det vill säga att innan en instans verkligen blir skapad måste den vanligtvis först gå igenom `init`.

Till exempel, när vi tidigare lärde oss SwiftUI-vyers livscykel, skrev vi sådan här kod:

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

Här körs `init()` när en `ContentView`-instans skapas, medan `onAppear` körs först när vyn faktiskt visas på skärmen. Med andra ord är skapandet och visningen av vyn inte samma tidpunkt.

På samma sätt, när vi skapar `Student(...)`, anropar vi konstruktorn för `Student`.

### Automatisk konstruktor som systemet skapar

När vi definierade `Student` skrev vi inte `init` manuellt:

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

Men vi kan ändå skapa en instans direkt:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Varför kan vi skapa en instans utan att ha skrivit en konstruktor?

Det beror på att för `struct`, om vi inte skriver en konstruktor manuellt, brukar systemet automatiskt skapa en lämplig konstruktor åt oss.

I nybörjarfasen kan du enkelt förstå det så här: Swift fyller automatiskt i initialiseringskoden åt oss.

Man kan ungefär förstå det som att systemet fyller i följande kod:

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

Här behöver vi lägga märke till en detalj:

```swift
let id = UUID()
```

`id` har redan ett standardvärde, så när vi skapar instansen behöver vi inte manuellt skicka in `id`.

Det vill säga att egenskaper utan standardvärde vanligtvis behöver skickas in i konstruktorn, medan egenskaper som redan har ett standardvärde vanligtvis kan använda det direkt.

Därför behöver vi bara skicka in `name`, `sex`, `phone`, `age` och `address` när vi skapar en `Student`-instans.

### Kompilatorns tips

Dessutom kan vi, när vi skriver `Student(...)` i Xcode, se parameterförslag från systemet.

![student](../../Resource/022_student.png)

Det visar också att den här typen verkligen har en automatiskt skapad konstruktor från systemet.

### Skriva en egen konstruktor

Även om systemet kan skapa en konstruktor automatiskt, passar det här standardsättet att initiera ibland inte helt våra behov.

Till exempel har vi en struktur `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Enligt den automatiskt skapade konstruktorn måste vi, när vi skapar en instans, skicka in alla tre parametrarna samtidigt:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Men om vi nu vill registrera en grupp gamla filmer och bara känner till filmens namn, men inte regissören och betyget, blir det ganska besvärligt.

För då kan vi bara skriva så här:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Även om det fungerar är det inte bekvämt att upprepa `--` varje gång.

Då kan vi skriva en konstruktor:

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

På så sätt behöver vi bara skicka in `name` när vi skapar gamla filmer:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Det här är en av poängerna med att skriva en egen konstruktor: **att göra sättet att skapa instanser mer anpassat efter verkliga behov.**

### Förklaring av en anpassad konstruktor

Låt oss titta på den här handskrivna konstruktorn:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Betydelsen av den här koden är att vi vid skapandet av en `Movie`-instans bara behöver skicka in parametern `name`.

Sedan kommer konstruktorn internt att tilldela det inskickade `name` till instansens eget `name`, och ge `director` och `rating` standardvärdet `--`.

`self` här betyder ”den här aktuella instansen själv”.

Till exempel:

```swift
self.name = name
```

`self.name` till vänster representerar egenskapen i instansen, och `name` till höger representerar parametern som vi skickade in.

Det kan enkelt förstås som att värdet utifrån sparas i instansens egen egenskap.

När alla egenskaper har fått värden är instansen färdigskapad.

### Mekanismen för konstruktorer

När vi uttryckligen deklarerar en konstruktor, leder det också till en förändring:

Den konstruktor som systemet ursprungligen skapade automatiskt går vanligtvis inte längre att använda direkt.

Till exempel:

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

Om vi nu skriver så här igen:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Kommer kompilatorn att ge ett fel:

```swift
Extra arguments at positions #2, #3 in call
```

Det betyder: du skickade in extra argument.

Varför uppstår det här felet?

För att den aktuella strukturen `Movie` bara har den här manuellt deklarerade konstruktorn:

```swift
init(name: String)
```

Den accepterar bara en parameter, `name`, och accepterar inte `director` eller `rating`.

Det vill säga: när du manuellt lägger till din egen konstruktor, går det ursprungliga automatiskt skapade sättet att initiera vanligtvis inte längre att använda direkt.

Om vi både vill stödja ”bara skicka in namn” och ”skicka in fullständig information”, måste vi själva komplettera med en fullständig konstruktor:

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

På så sätt har vi två olika konstruktorer.

När vi skapar gamla filmer kan vi skriva så här:

```swift
Movie(name: "The Night of the Hunter")
```

När vi skapar nya filmer med fullständig information kan vi skriva så här:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Det här skrivsättet visar också att samma typ kan ha flera konstruktorer, så länge deras parameterformer skiljer sig åt.

## Vad är överlagring

Här kompletterar vi med ännu en nödvändig kunskapspunkt.

Vi skrev just två `init` för `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Ett sådant skrivsätt, där ”samma funktionsnamn används men parametrarna är olika”, kallas ”överlagring”.

Här heter båda funktionerna `init`, men de tar emot olika parametrar, så Swift kan skilja på vilken funktion du anropar.

Till exempel:

```swift
Movie(name: "Days of Heaven")
```

Kommer att anropa:

```swift
init(name: String)
```

Och:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Kommer att anropa den andra, fullständiga versionen av initialiseringsmetoden.

Alltså är överlagringens funktion att låta samma typ erbjuda olika sätt att skapa objekt beroende på olika situationer.

## Lär känna class

Nu ska vi också kort lära känna `class`.

Förutom den vanliga `struct` i Swift använder många programspråk `class` för att skapa instanser, till exempel Java, C#, Kotlin och andra.

I Swift liknar syntaxen för `class` väldigt mycket syntaxen för `struct`.

Till exempel:

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

Du kommer att märka att bortsett från att nyckelordet ändras från `struct` till `class`, ser allt annat nästan likadant ut.

Sättet att skapa en instans är också mycket likt:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Så på syntaxnivå är `struct` och `class` verkligen väldigt lika.

### Skillnaden mellan Struct och Class

Även om `struct` och `class` ser väldigt lika ut, är de inte helt samma sak.

**1. Sättet att initiera skiljer sig åt**

För `struct` gäller att om vi inte skriver en konstruktor manuellt, brukar systemet automatiskt skapa en lämplig initialiseringsmetod.

Men för `class` gäller att om det finns egenskaper som ännu inte har standardvärden, måste vi vanligtvis skriva `init` manuellt, annars uppstår ett fel.

Till exempel:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Den här `class` saknar konstruktor, vilket gör att egenskaperna inte initialiseras och ett fel uppstår.

Kompilatorn visar ungefär:

```swift
Class 'Movie' has no initializers
```

Därför måste `class` i det här exemplet ha en manuellt skriven konstruktor.

**2. `struct` är en värdetyp, `class` är en referenstyp**

`struct` är en värdetyp och `class` är en referenstyp.

I nybörjarfasen behöver du inte behärska dessa två begrepp fullt ut, det räcker att ha en enkel förståelse av dem.

Till exempel är `struct` mer som att ”kopiera ett nytt värde”.

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

Här, efter att `user1` har tilldelats till `user2`, är det som att en ny kopia av datan skapas, så att ändringar i `user2` inte påverkar `user1`.

Medan `class` är mer som att ”peka tillsammans på samma instans”.

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

Här pekar `user1` och `user2` på samma instans.

Vi behöver inte helt förstå den underliggande mekanismen för värdetyper och referenstyper just nu, det räcker att veta att `struct` passar bättre för att lagra självständiga data, medan `class` passar bättre när flera ställen ska dela samma instans.

## Hur man väljer i nybörjarfasen

I det här skedet bör man i första hand överväga `struct` för vanliga datamodeller, och använda `class` för data som behöver delas och uppdateras synkront.

Det här är inte en absolut regel, men för nybörjare är det ett tillräckligt praktiskt sätt att bedöma situationen.

Särskilt i SwiftUI kommer du ofta att upptäcka att `struct` redan kan göra det mesta av arbetet.

Dessutom kallas sådant som skapas med `class` i många programmeringsmaterial också för ”objekt”. I nybörjarfasen kan du tills vidare förstå det som en instans och behöver inte medvetet skilja dem åt.

## Sammanfattning

I den här lektionen gick vi djupare in i `struct` och lärde samtidigt känna `class`; båda kan användas för att definiera typer.

Typer kan skapa instanser. När en instans skapas anropas konstruktorn, alltså `init`.

För `struct` gäller att om vi inte skriver en konstruktor manuellt, brukar systemet automatiskt skapa en lämplig sådan. Om standardkonstruktorn inte uppfyller behoven kan vi också skriva en egen konstruktor manuellt.

Dessutom fick vi en första förståelse för skillnaden mellan `struct` och `class`: `struct` är en värdetyp och `class` är en referenstyp. I SwiftUI är det vanligtvis `struct` som man oftast stöter på i nybörjarfasen.

Senare, när vi lär oss värdeöverföring i vyer, datamodeller och tillståndshantering, kommer allt detta att fortsätta användas.
