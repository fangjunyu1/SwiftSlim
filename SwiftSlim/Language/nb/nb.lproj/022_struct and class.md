# struct og class

I forrige leksjon begynte vi så vidt å bli kjent med `struct`, definerte en struktur, og utvidet også læringen med emner som protokoller, `UUID` og andre kunnskapspunkter.

Nå har vi allerede en innledende forståelse av nøkkelordet `struct`, men vi kan fortsatt ikke si at vi virkelig forstår det fullt ut.

I denne leksjonen skal vi fortsette å ha `struct` som hovedinnhold, og samtidig bli kjent med `class`. Gjennom denne leksjonen vil du forstå tydeligere: hva en instans er, hva en konstruktør er, og hvorfor vi kan bruke `struct` og `class` til å organisere data.

## Studentadministrasjonssystem

For eksempel ønsker vi nå å utvikle et studentadministrasjonssystem. Hver student har informasjon som navn, kjønn, telefon, alder, hjemmeadresse og så videre.

På dette tidspunktet kan vi samle denne informasjonen og definere den som en `Student`-struktur:

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

Her bruker vi `struct` til å definere en studenttype.

Denne `Student`-strukturen inneholder flere egenskaper:

- `id`: studentens unike identifikator
- `name`: studentens navn
- `sex`: studentens kjønn
- `phone`: studentens telefon
- `age`: studentens alder
- `address`: hjemmeadresse

På denne måten blir flere data som opprinnelig var spredt, samlet til én komplett "student".

Her følger `Student` også `Identifiable`-protokollen, og definerer et `id`-felt, slik at det senere blir praktisk å vise data sammen med `ForEach`-løkken.

Deretter kan vi opprette en studentinstans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Denne koden betyr at vi, basert på strukturen `Student`, kan opprette konkrete studentdata.

Her er `Student` typen, og `Student(...)` representerer en opprettet instans.

I SwiftUI kan vi tildele denne instansen til en variabel og deretter vise den.

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

På denne måten kan vi se navnet til denne studenten i visningen: `Fang Junyu`.

Her opprettet vi først en `Student`-instans, deretter tildelte vi den til variabelen `student`, og til slutt leste vi egenskapen via `student.name`.

## Hva er en instans

Når vi nettopp begynner å lære `struct`, kan ordet "instans" virke veldig ukjent.

Men i virkeligheten har vi brukt instanser helt fra starten av, vi har bare ikke lagt spesielt merke til det før.

For eksempel:

```swift
let name = "Fang Junyu"
```

Her er `"Fang Junyu"` en strengverdi, og i sin essens er det en instans av typen `String`.

Vi kan også skrive det slik:

```swift
let name = String("Fang Junyu")
```

Disse to skrivemåtene uttrykker det samme: å opprette en instans av typen `String` og tildele den til variabelen `name`.

På samme måte gjelder dette også for `Int`:

```swift
let num = 3
```

Her er `3` i sin essens en verdi av typen `Int`, og den kan også forstås som en `Int`-instans.

Derfor er ikke en instans et spesielt begrep som bare dukker opp i `struct`.

Enten det er `String`, `Int`, `Double`, `Bool` eller den egendefinerte `Student`, kan alle opprette instanser.

Derfor, når vi skriver:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

er det i bunn og grunn det samme som å opprette en instans av `String` eller `Int`, bortsett fra at `Student` er en type vi har definert selv.

## Konstruktør

Når vi oppretter en instans:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

så kaller vi i virkeligheten initialiseringsmetoden til `Student`, altså `init`.

Du kan forstå konstruktøren som: **inngangspunktet som er ansvarlig for å tildele verdier til egenskapene når en instans opprettes.**

Det vil si at før en instans faktisk er ferdig opprettet, må den vanligvis først gå gjennom `init`.

For eksempel, da vi tidligere lærte om livssyklusen til SwiftUI-visninger, skrev vi kode som dette:

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

Her kjøres `init()` når `ContentView`-instansen opprettes, mens `onAppear` først kjøres når visningen faktisk vises på skjermen. Det vil si at opprettelsen av en visning og visningen av den ikke skjer på samme tidspunkt.

På samme måte, når vi oppretter `Student(...)`, kaller vi også konstruktøren til `Student`.

### Konstruktør som systemet genererer automatisk

Da vi definerte `Student`, skrev vi ikke `init` manuelt:

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

Likevel kan vi fortsatt opprette en instans direkte:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Hvorfor kan vi opprette en instans uten å ha skrevet en konstruktør?

Fordi for `struct`, hvis vi ikke skriver en konstruktør manuelt, vil systemet vanligvis automatisk generere en passende konstruktør for oss.

I den tidlige læringsfasen kan du enkelt forstå det slik: Swift fyller automatisk ut initialiseringskoden for oss.

Grovt sett kan dette forstås som at systemet fyller ut følgende kode for oss:

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

Her er det en liten detalj vi må være oppmerksomme på:

```swift
let id = UUID()
```

`id` har allerede en standardverdi, så når vi oppretter en instans, trenger vi ikke å sende inn `id` manuelt igjen.

Det vil si at egenskaper uten standardverdi vanligvis må sendes inn i konstruktøren; egenskaper som allerede har en standardverdi, kan vanligvis bruke den opprinnelige standardverdien direkte.

Derfor trenger vi bare å sende inn `name`, `sex`, `phone`, `age` og `address` når vi oppretter en `Student`-instans.

### Hint fra kompilatoren

I tillegg kan vi, når vi skriver `Student(...)` i Xcode, også se parameterhintene som systemet gir.

![student](../../Resource/022_student.png)

Dette viser også i praksis at den nåværende typen faktisk har en konstruktør som er generert automatisk av systemet.

### Å skrive konstruktøren selv

Selv om systemet kan generere konstruktøren automatisk, passer denne standardinitialiseringen noen ganger ikke helt til behovene våre.

For eksempel har vi en `Movie`-struktur:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

I henhold til konstruktøren som systemet genererer automatisk, må vi sende inn alle disse tre parameterne samtidig når vi oppretter en instans:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Men hvis vi nå vil legge inn en gruppe gamle filmer og bare kjenner filmnavnene, men ikke kjenner regissøren og vurderingen, blir det litt upraktisk.

For da kan vi bare skrive det slik:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Selv om dette fungerer, er det ikke praktisk å skrive `--` om og om igjen hver gang.

Da kan vi skrive en konstruktør:

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

På denne måten trenger vi bare å sende inn `name` når vi oppretter gamle filmer:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Dette er en av betydningene ved å skrive konstruktøren selv: **å gjøre måten instanser opprettes på mer i tråd med de faktiske behovene.**

### Analyse av en egendefinert konstruktør

La oss se på denne håndskrevne konstruktøren fra i sted:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Betydningen av denne koden er at når vi oppretter en `Movie`-instans, trenger vi bare å sende inn én parameter, `name`.

Deretter vil konstruktøren internt tilordne det innsendte `name` til instansens eget `name`, og gi `director` og `rating` standardverdien `--`.

Her betyr `self` "denne nåværende instansen selv".

For eksempel:

```swift
self.name = name
```

`self.name` på venstre side betyr egenskapen i instansen; `name` på høyre side betyr parameteren vi sendte inn.

Dette kan enkelt forstås som å lagre verdien som kommer utenfra i instansens egen egenskap.

Når alle egenskapene har fått verdier, er opprettelsen av denne instansen fullført.

### Hvordan konstruktøren fungerer

Når vi eksplisitt deklarerer en konstruktør, oppstår det også en annen endring:

konstruktøren som systemet opprinnelig genererte automatisk, kan vanligvis ikke lenger brukes direkte.

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

Hvis vi nå skriver dette igjen:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

vil kompilatoren gi en feil:

```swift
Extra arguments at positions #2, #3 in call
```

Det betyr: du sendte inn ekstra parametere.

Hvorfor oppstår denne feilen?

Fordi det i den nåværende `Movie`-strukturen bare finnes denne ene konstruktøren som du deklarerte manuelt:

```swift
init(name: String)
```

Den godtar bare én parameter, `name`, og godtar ikke `director` og `rating`.

Det vil si at når du legger til din egen konstruktør manuelt, kan den opprinnelige automatisk genererte initialiseringsmåten ikke lenger brukes direkte.

Hvis vi ønsker å støtte både "bare sende inn navnet" og "sende inn full informasjon", må vi selv legge til en fullstendig konstruktør til:

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

Slik får vi to forskjellige konstruktører.

Når vi oppretter en gammel film, kan vi skrive slik:

```swift
Movie(name: "The Night of the Hunter")
```

Når vi oppretter en ny film med full informasjon, kan vi skrive slik:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Denne skrivemåten viser også at samme type kan ha flere konstruktører, så lenge parameterformene deres er forskjellige.

## Hva er overloading

Her legger vi til enda et nødvendig kunnskapspunkt.

Akkurat nå skrev vi to `init` for `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Denne typen skrivemåte, "samme funksjonsnavn, men forskjellige parametere", kalles "overloading".

Her heter begge funksjonene `init`, men siden de mottar forskjellige parametere, kan Swift skille hvilken funksjon du kaller.

For eksempel:

```swift
Movie(name: "Days of Heaven")
```

vil kalle:

```swift
init(name: String)
```

Mens:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

vil kalle den andre fulle versjonen av initialiseringsmetoden.

Så rollen til overloading er: å la samme type tilby forskjellige måter å bli opprettet på ut fra ulike situasjoner.

## Bli kjent med class

Videre skal vi også kort bli kjent med `class`.

I tillegg til den vanlige `struct` i Swift, bruker mange programmeringsspråk `class` for å lage instanser, for eksempel Java, C#, Kotlin og andre.

I Swift er skrivemåten for `class` svært lik `struct`.

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

Du vil legge merke til at bortsett fra at nøkkelordet går fra `struct` til `class`, ser de andre delene nesten helt like ut.

Måten å opprette en instans på er også svært lik:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Dermed er `struct` og `class` faktisk veldig like på syntaksnivå.

### Forskjellen mellom Struct og Class

Selv om `struct` og `class` ser veldig like ut, er de ikke helt det samme.

**1. Måten å initialisere på er forskjellig**

For `struct`, hvis vi ikke skriver en konstruktør manuelt, vil systemet vanligvis automatisk generere en passende initialiseringsmetode.

Men for `class`, hvis det finnes egenskaper som ennå ikke har standardverdi, må vi vanligvis skrive `init` manuelt, ellers vil det oppstå en feil.

For eksempel:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Denne `class` vil gi feil fordi den ikke har noen konstruktør, og dermed blir egenskapene ikke initialisert.

Kompilatoren vil vise noe slikt som:

```swift
Class 'Movie' has no initializers
```

Derfor må `class` i dette eksemplet ha en manuelt skrevet konstruktør.

**2. `struct` er en verditype, `class` er en referansetype**

`struct` er en verditype, mens `class` er en referansetype.

I den tidlige læringsfasen trenger du ikke å mestre disse to begrepene fullt ut; det holder med en enkel grunnforståelse.

For eksempel ligner `struct` mer på "å kopiere en ny verdi".

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

Her, etter at `user1` er tilordnet til `user2`, er det som om et nytt datasett kopieres, så å endre `user2` påvirker ikke `user1`.

På den andre siden ligner `class` mer på "å peke sammen til den samme instansen".

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

Her peker `user1` og `user2` til den samme instansen.

Akkurat nå trenger vi ikke å forstå den indre mekanismen bak verdi- og referansetyper fullstendig; det er nok å vite at `struct` passer bedre til å lagre uavhengige data, mens `class` passer bedre når flere steder trenger å dele den samme instansen.

## Hvordan velge i begynnerfasen

På dette stadiet bør du for vanlige datamodeller først vurdere `struct`; når det trengs delte data og synkroniserte endringer, bør du vurdere `class`.

Dette er ikke en absolutt regel, men for nybegynnere er det en tilstrekkelig praktisk vurderingsmåte.

Spesielt i SwiftUI vil du ofte oppdage at `struct` allerede kan gjøre det meste av arbeidet.

I tillegg blir det som opprettes med `class`, i mange programmeringsmaterialer, også kalt et "objekt". I begynnerfasen kan du ganske enkelt forstå det som en instans, uten å måtte skille dem bevisst.

## Oppsummering

I denne leksjonen har vi studert `struct` dypere, og samtidig blitt kjent med `class`; begge kan brukes til å definere typer.

Typer kan opprette instanser. Når en instans opprettes, blir konstruktøren, altså `init`, kalt.

For `struct` gjelder det at hvis vi ikke skriver en konstruktør manuelt, vil systemet vanligvis automatisk generere en passende konstruktør. Hvis standardkonstruktøren ikke dekker behovene, kan vi også skrive en konstruktør selv.

I tillegg har vi også fått en innledende forståelse av forskjellen mellom `struct` og `class`: `struct` er en verditype, mens `class` er en referansetype. I SwiftUI er det vanligvis `struct` du oftest møter i begynnerfasen.

Senere, når vi lærer om å sende verdier mellom visninger, datamodeller og tilstandshåndtering, vil alt dette innholdet fortsatt bli brukt.
