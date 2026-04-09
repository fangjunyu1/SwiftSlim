# struct og class

I sidste lektion begyndte vi netop at stifte bekendtskab med `struct`, definerede en struktur og lærte også mere om protokoller, `UUID` og andre videnpunkter.

Nu har vi allerede en indledende forståelse af nøgleordet `struct`, men det kan endnu ikke siges at være en egentlig forståelse.

I denne lektion fortsætter vi med `struct` som hovedindhold og lærer samtidig lidt om `class`. Gennem denne lektion vil du få en klarere forståelse af: hvad en instans er, hvad en konstruktør er, og hvorfor vi kan bruge `struct` og `class` til at organisere data.

## System til elevadministration

For eksempel vil vi nu udvikle et system til elevadministration. Hver elev har oplysninger som navn, køn, telefonnummer, alder, hjemmeadresse og så videre.

På dette tidspunkt kan vi samle disse oplysninger og definere dem som en `Student`-struktur:

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

Her bruger vi `struct` til at definere en elevtype.

Denne `Student`-struktur indeholder flere egenskaber:

- `id`: elevens unikke identifikator
- `name`: elevens navn
- `sex`: elevens køn
- `phone`: elevens telefonnummer
- `age`: elevens alder
- `address`: hjemmeadresse

På den måde bliver flere oprindeligt spredte data samlet til en komplet "elev".

Her følger `Student` også protokollen `Identifiable` og definerer et `id`-felt, så det senere er nemt at vise data sammen med `ForEach`-løkken.

Derefter kan vi oprette en elevinstans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Denne kode betyder, at man ud fra strukturen `Student` kan oprette konkrete elevdata.

Her er `Student` typen, og `Student(...)` repræsenterer en oprettet instans.

I SwiftUI kan vi tildele denne instans til en variabel og derefter vise den.

For eksempel:

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

På den måde kan vi i visningen se denne elevs navn: `Fang Junyu`.

Her oprettede vi først en `Student`-instans, derefter tildelte vi den til variablen `student`, og til sidst læste vi egenskaben via `student.name`.

## Hvad er en instans

Når vi lige er begyndt at lære `struct`, kan ordet "instans" virke meget fremmed.

Men i virkeligheden har vi brugt instanser lige fra begyndelsen, vi har bare ikke lagt særligt mærke til det før.

For eksempel:

```swift
let name = "Fang Junyu"
```

Her er `"Fang Junyu"` en strengværdi, og i sin essens er det en instans af typen `String`.

Vi kan også skrive det sådan:

```swift
let name = String("Fang Junyu")
```

Disse to skrivemåder udtrykker det samme: at oprette en instans af typen `String` og tildele den til variablen `name`.

På samme måde gælder det også for `Int`:

```swift
let num = 3
```

Her er `3` i sin essens en værdi af typen `Int`, og det kan også forstås som en `Int`-instans.

Derfor er en instans ikke et særligt begreb, som kun optræder i `struct`.

Uanset om det er `String`, `Int`, `Double`, `Bool` eller den brugerdefinerede `Student`, kan de alle oprette instanser.

Derfor, når vi skriver:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

er det i bund og grund det samme som at oprette en instans af `String` eller `Int`, bortset fra at `Student` er en type, vi selv har defineret.

## Konstruktør

Når vi opretter en instans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

så kalder vi i virkeligheden `Student`'s initialiseringsmetode, nemlig `init`.

Du kan forstå konstruktøren som: **indgangen, der ved oprettelse af en instans er ansvarlig for at tildele værdier til egenskaberne.**

Det vil sige, at før en instans reelt er færdigoprettet, skal den normalt først gennem `init`.

For eksempel skrev vi tidligere, da vi lærte om SwiftUI-visningers livscyklus, kode som denne:

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

Her bliver `init()` udført, når `ContentView`-instansen oprettes, mens `onAppear` først bliver udført, når visningen faktisk bliver vist på skærmen. Det vil sige, at oprettelsen og visningen af visningen ikke sker på samme tidspunkt.

På samme måde, når vi opretter `Student(...)`, kalder vi også `Student`'s konstruktør.

### Konstruktør automatisk genereret af systemet

Da vi definerede `Student`, skrev vi ikke `init` manuelt:

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

Men vi kan stadig oprette en instans direkte:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Hvorfor kan man oprette en instans, når der ikke er skrevet nogen konstruktør?

Det er fordi, at for `struct`, hvis vi ikke selv skriver en konstruktør manuelt, vil systemet normalt automatisk generere en passende konstruktør for os.

I begyndelsesfasen kan det enkelt forstås som: Swift hjælper os automatisk med at udfylde initialiseringskoden.

Man kan groft sagt forstå det sådan, at systemet hjælper os med at udfylde nedenstående kode:

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

Her skal man lægge mærke til en detalje:

```swift
let id = UUID()
```

`id` har allerede en standardværdi, så når vi opretter instansen, behøver vi ikke manuelt at sende `id` med igen.

Det vil sige, at egenskaber uden standardværdi normalt skal gives gennem konstruktøren; egenskaber, der allerede har en standardværdi, kan normalt direkte bruge den oprindelige standardværdi.

Derfor behøver vi, når vi opretter en `Student`-instans, kun at sende `name`, `sex`, `phone`, `age` og `address`.

### Kompilatorhint

Derudover kan vi, når vi skriver `Student(...)` i Xcode, også se de parameterhint, som systemet giver.

![student](../../Resource/022_student.png)

Det viser faktisk også, at den nuværende type virkelig har en konstruktør, som systemet automatisk har genereret.

### Skrive konstruktøren selv

Selvom systemet automatisk kan generere en konstruktør, passer denne standardinitialisering nogle gange ikke helt til vores behov.

For eksempel har vi en `Movie`-struktur:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ifølge den automatisk genererede konstruktør skal vi, når vi opretter en instans, samtidig give disse tre parametre:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Men hvis vi nu vil indtaste en række gamle film og kun kender filmenes navne, men ikke kender instruktør og vurdering, bliver det ret besværligt.

For så kan vi kun skrive sådan her:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Selvom det virker, er det ikke særligt praktisk at skulle skrive `--` hver gang.

På dette tidspunkt kan vi skrive en konstruktør:

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

På den måde skal vi, når vi opretter gamle film, kun sende `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Det er en af betydningerne af selv at skrive en konstruktør: **at få måden, instanser oprettes på, til bedre at passe til de faktiske behov.**

### Gennemgang af en brugerdefineret konstruktør

Lad os se på den håndskrevne konstruktør fra før:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Denne kode betyder, at når en `Movie`-instans oprettes, kræves det kun, at man sender én parameter, nemlig `name`.

Derefter vil konstruktøren internt tildele det sendte `name` til instansens eget `name` og give `director` og `rating` standardværdien `--`.

Her betyder `self` "selve den nuværende instans".

For eksempel:

```swift
self.name = name
```

`self.name` på venstre side betyder egenskaben i instansen; `name` på højre side betyder den parameter, vi sendte ind.

Det kan enkelt forstås som, at værdien udefra gemmes i instansens egen egenskab.

Når alle egenskaber har fået tildelt værdier, er oprettelsen af instansen fuldført.

### Konstruktørmekanismen

Når vi eksplicit erklærer en konstruktør, medfører det også en anden ændring:

den konstruktør, som systemet oprindeligt genererede automatisk, kan normalt ikke længere bruges direkte.

For eksempel:

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

Hvis vi nu igen skriver sådan her:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

vil kompilatoren give en fejl:

```swift
Extra arguments at positions #2, #3 in call
```

Det betyder: Du har givet ekstra parametre.

Hvorfor opstår denne fejl?

Fordi der i den nuværende `Movie`-struktur kun findes denne ene type konstruktør, som du selv har erklæret:

```swift
init(name: String)
```

Den accepterer kun én parameter, `name`, og accepterer ikke `director` og `rating`.

Det vil sige, at når du manuelt tilføjer din egen konstruktør, kan den automatisk genererede initialiseringsmåde ikke længere bruges direkte.

Hvis vi både vil understøtte "kun at sende navnet" og "at sende alle oplysninger", skal vi selv tilføje endnu en fuld konstruktør:

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

På den måde har vi to forskellige konstruktører.

Når vi opretter en gammel film, kan vi skrive sådan her:

```swift
Movie(name: "The Night of the Hunter")
```

Når vi opretter en ny film med fulde oplysninger, kan vi skrive sådan her:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Denne skrivemåde viser også, at den samme type kan have flere konstruktører, så længe deres parameterformer er forskellige.

## Hvad er overloading

Her vil vi supplere med endnu et nødvendigt videnpunkt.

Vi skrev lige to `init` til `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Denne måde at skrive på, "samme funktionsnavn, men forskellige parametre", kaldes "overloading".

Her hedder begge funktioner `init`, men fordi de modtager forskellige parametre, kan Swift skelne mellem, hvilken funktion du kalder.

For eksempel:

```swift
Movie(name: "Days of Heaven")
```

vil kalde:

```swift
init(name: String)
```

mens:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

vil kalde den anden fulde version af initialiseringsmetoden.

Så formålet med overloading er: at lade den samme type tilbyde forskellige måder at blive oprettet på afhængigt af situationen.

## Lær class at kende

Lad os derefter også kort lære `class` at kende.

Ud over den almindelige `struct` i Swift bruger mange programmeringssprog `class` til at oprette instanser, for eksempel Java, C#, Kotlin og så videre.

I Swift minder måden at skrive `class` meget om `struct`.

For eksempel:

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

Du vil opdage, at bortset fra at nøgleordet ændres fra `struct` til `class`, ser de øvrige dele næsten ens ud.

Måden at oprette instanser på er også meget lignende:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Så på syntaksniveau ligner `struct` og `class` faktisk hinanden meget.

### Forskellen mellem Struct og Class

Selvom `struct` og `class` ser meget ens ud, er de ikke helt det samme.

**1. Initialiseringsmåden er forskellig**

For `struct` gælder, at hvis vi ikke selv skriver en konstruktør, vil systemet normalt automatisk generere en passende initialiseringsmetode.

Men for `class` gælder, at hvis der er egenskaber uden standardværdi, skal man normalt selv skrive `init`, ellers vil der opstå en fejl.

For eksempel:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Denne `class` giver fejl, fordi den ikke har nogen konstruktør, og egenskaberne derfor ikke bliver initialiseret.

Kompilatoren vil vise noget i retning af:

```swift
Class 'Movie' has no initializers
```

Derfor skal `class` i dette eksempel have en håndskrevet konstruktør.

**2. `struct` er en værditype, `class` er en referencetype**

`struct` er en værditype, og `class` er en referencetype.

I begyndelsesfasen behøver du ikke at mestre disse to begreber fuldstændigt; det er nok bare at have en enkel forståelse af dem.

For eksempel minder `struct` mere om "at kopiere en ny værdi".

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

Her svarer det til, at der bliver kopieret nye data, når `user1` tildeles til `user2`, så det at ændre `user2` påvirker ikke `user1`.

Mens `class` mere minder om "i fællesskab at pege på den samme instans".

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

Her peger `user1` og `user2` på den samme instans.

Vi behøver ikke nu at forstå den underliggende mekanisme bag værdityper og referencetyper fuldstændigt; det er nok bare at vide, at `struct` er mere velegnet til at gemme uafhængige data, mens `class` er mere velegnet, når flere steder skal dele den samme instans.

## Hvordan man vælger i begyndelsesfasen

På det nuværende trin bør man for almindelige datamodeller først overveje `struct`, og når der er behov for delte data og synkroniserede ændringer, derefter overveje `class`.

Det er ikke en absolut regel, men for begyndere er det en tilstrækkeligt praktisk måde at vurdere på.

Især i SwiftUI vil du mange gange opdage, at `struct` allerede kan klare størstedelen af arbejdet.

Derudover kaldes det, som oprettes med `class`, i mange programmeringsmaterialer også for et "objekt". I begyndelsesfasen kan du bare forstå det som en instans, uden bevidst at skelne mellem dem.

## Opsummering

I denne lektion har vi lært `struct` mere i dybden at kende og samtidig også fået et første indtryk af `class`; begge kan bruges til at definere typer.

Typer kan oprette instanser. Når en instans oprettes, kaldes konstruktøren, altså `init`.

For `struct` gælder, at hvis vi ikke manuelt skriver en konstruktør, vil systemet normalt automatisk generere en passende konstruktør. Hvis standardkonstruktøren ikke opfylder behovene, kan vi også selv skrive en konstruktør.

Derudover har vi også fået en første forståelse af forskellen mellem `struct` og `class`: `struct` er en værditype, og `class` er en referencetype. I SwiftUI er det normalt `struct`, man oftest møder i begyndelsesfasen.

Senere, når vi lærer om at sende værdier mellem views, datamodeller og state management, vil alt dette indhold fortsat blive brugt.
