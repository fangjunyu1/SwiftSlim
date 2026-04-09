# struct in class

V prejšnji lekciji smo se šele začeli spoznavati z `struct`, definirali smo eno strukturo in dodatno razširili znanje o protokolih, `UUID` in drugih pojmih.

Zdaj že imamo osnovno predstavo o ključni besedi `struct`, vendar še ne moremo reči, da jo resnično razumemo.

V tej lekciji bomo še naprej imeli `struct` kot glavno temo, mimogrede pa bomo spoznali tudi `class`. S to lekcijo boš jasneje razumel: kaj je primerek, kaj je konstruktor in zakaj lahko z `struct` in `class` organiziramo podatke.

## Sistem za upravljanje študentov

Na primer, zdaj želimo razviti sistem za upravljanje študentov. Vsak študent ima ime, spol, telefon, starost, domači naslov in druge informacije.

V tem trenutku lahko te informacije združimo in jih definiramo kot strukturo `Student`:

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

Tukaj z `struct` definiramo tip študenta.

Ta struktura `Student` vsebuje več lastnosti:

- `id`: enolični identifikator študenta
- `name`: ime študenta
- `sex`: spol študenta
- `phone`: telefon študenta
- `age`: starost študenta
- `address`: domači naslov

Na ta način je več prvotno ločenih podatkov združenih v enega popolnega »študenta«.

`Student` tukaj upošteva tudi protokol `Identifiable` in definira polje `id`, da bo kasneje lažje prikazovati podatke skupaj z zanko `ForEach`.

Nato lahko ustvarimo primerek študenta:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Ta koda pomeni, da lahko glede na strukturo `Student` ustvarimo konkreten podatek o študentu.

Pri tem je `Student` tip, `Student(...)` pa predstavlja ustvarjen primerek.

V SwiftUI lahko ta primerek dodelimo spremenljivki in ga nato prikažemo.

Na primer:

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

Tako lahko v pogledu vidimo ime tega študenta: `Fang Junyu`.

Tukaj smo najprej ustvarili primerek `Student`, ga nato dodelili spremenljivki `student` in na koncu prek `student.name` prebrali njegovo lastnost.

## Kaj je primerek

Ko se šele začnemo učiti `struct`, se nam lahko zdi beseda »primerek« zelo neznana.

V resnici pa primerke uporabljamo že od začetka, le da prej temu nismo namenjali posebne pozornosti.

Na primer:

```swift
let name = "Fang Junyu"
```

Tukaj je `"Fang Junyu"` nizovna vrednost, v bistvu pa je to primerek tipa `String`.

Lahko pa zapišemo tudi tako:

```swift
let name = String("Fang Junyu")
```

Oba zapisa pomenita isto stvar: ustvariti primerek tipa `String` in ga dodeliti spremenljivki `name`.

Enako velja tudi za `Int`:

```swift
let num = 3
```

Tukaj je `3` v bistvu vrednost tipa `Int`, lahko pa jo razumemo tudi kot primerek `Int`.

Zato primerek ni poseben pojem, ki bi se pojavil samo pri `struct`.

Ne glede na to, ali gre za `String`, `Int`, `Double`, `Bool` ali naš prilagojeni `Student`, vsi lahko ustvarjajo primerke.

Zato, ko zapišemo:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Je to v bistvu enako kot ustvarjanje primerkov `String` ali `Int`, le da je `Student` tip, ki smo ga definirali sami.

## Konstruktor

Ko ustvarimo primerek:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Pravzaprav kličemo inicializacijsko metodo tipa `Student`, torej `init`.

Konstruktor lahko razumeš kot: **vstopno točko, ki je pri ustvarjanju primerka odgovorna za dodeljevanje vrednosti lastnostim.**

To pomeni, da mora primerek, preden je resnično ustvarjen, običajno najprej skozi `init`.

Na primer, ko smo prej spoznavali življenjski cikel pogledov v SwiftUI, smo napisali takšno kodo:

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

Tukaj se `init()` izvede, ko je ustvarjen primerek `ContentView`, medtem ko se `onAppear` izvede šele, ko je pogled dejansko prikazan na zaslonu. To pomeni, da ustvarjanje in prikaz pogleda nista isti trenutek.

Podobno, ko ustvarimo `Student(...)`, kličemo konstruktor tipa `Student`.

### Samodejno ustvarjen konstruktor

Ko smo definirali `Student`, `init` nismo zapisali ročno:

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

Kljub temu lahko primerek še vedno ustvarimo neposredno:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Zakaj lahko ustvarimo primerek, če nimamo konstruktorja?

Ker pri `struct`, če konstruktorja ne napišemo ročno, sistem običajno samodejno ustvari primeren konstruktor.

Na začetni stopnji si to lahko preprosto razlagaš tako: Swift nam samodejno dopolni inicializacijsko kodo.

Približno si lahko predstavljaš, da sistem dopolni naslednjo kodo:

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

Tukaj je treba opaziti eno podrobnost:

```swift
let id = UUID()
```

`id` že ima privzeto vrednost, zato nam ob ustvarjanju primerka ni treba ročno podati `id`.

Z drugimi besedami: lastnosti brez privzete vrednosti je običajno treba podati v konstruktor, lastnosti, ki privzeto vrednost že imajo, pa lahko navadno neposredno uporabijo to privzeto vrednost.

Zato moramo pri ustvarjanju primerka `Student` podati samo `name`, `sex`, `phone`, `age` in `address`.

### Namigi prevajalnika

Poleg tega lahko, ko v Xcode vnesemo `Student(...)`, vidimo tudi namige za parametre, ki jih poda sistem.

![student](../../Resource/022_student.png)

To pravzaprav tudi pokaže, da ima trenutni tip res sistemsko samodejno ustvarjen konstruktor.

### Pisanje lastnega konstruktorja

Čeprav lahko sistem samodejno ustvari konstruktor, včasih tak privzeti način inicializacije ne ustreza povsem našim potrebam.

Na primer, imamo strukturo `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Po sistemsko samodejno ustvarjenem konstruktorju moramo pri ustvarjanju primerka hkrati podati te tri parametre:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Če pa želimo zdaj vnesti serijo starih filmov in poznamo samo naslov filma, ne pa režiserja in ocene, je to nekoliko nerodno.

Ker lahko pišemo samo tako:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Čeprav deluje, ni priročno, da vsakič znova pišemo `--`.

Takrat lahko napišemo konstruktor:

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

Tako moramo pri ustvarjanju starih filmov podati samo `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

To je eden od pomenov lastnega konstruktorja: **da način ustvarjanja primerkov bolje ustreza dejanskim potrebam.**

### Razlaga prilagojenega konstruktorja

Poglejmo ta ročno napisan konstruktor:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Pomen te kode je, da moramo pri ustvarjanju primerka `Movie` podati samo parameter `name`.

Nato bo konstruktor znotraj sebe podani `name` dodelil lastni `name` primerka, za `director` in `rating` pa nastavil privzeto vrednost `--`.

`self` tukaj pomeni »ta trenutni primerek sam«.

Na primer:

```swift
self.name = name
```

Levi `self.name` predstavlja lastnost primerka, desni `name` pa parameter, ki ga podamo.

To si lahko preprosto razlagaš tako, da zunanjo podano vrednost shranimo v lastno lastnost primerka.

Ko so vse lastnosti dobile vrednosti, je primerek ustvarjen.

### Mehanizem konstruktorjev

Ko izrecno deklariramo konstruktor, se zgodi še ena sprememba:

Prvotni sistemsko samodejno ustvarjeni konstruktor običajno ni več neposredno uporaben.

Na primer:

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

Če zdaj spet zapišemo tako:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Bo prevajalnik javil napako:

```swift
Extra arguments at positions #2, #3 in call
```

To pomeni: podal si odvečne argumente.

Zakaj pride do te napake?

Ker ima trenutna struktura `Movie` samo ta en ročno deklariran konstruktor:

```swift
init(name: String)
```

Ta sprejme samo en parameter `name`, ne pa `director` in `rating`.

To pomeni, da po tem, ko ročno dodaš svoj konstruktor, prvotno samodejno ustvarjen način inicializacije ni več neposredno na voljo.

Če želimo podpirati tako »podaj samo naslov« kot tudi »podaj vse podatke«, moramo sami dopisati še en popoln konstruktor:

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

Tako imamo dva različna konstruktorja.

Ko ustvarjamo stare filme, lahko pišemo takole:

```swift
Movie(name: "The Night of the Hunter")
```

Ko ustvarjamo nove filme s popolnimi podatki, lahko pišemo takole:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ta zapis tudi pokaže: isti tip ima lahko več konstruktorjev, dokler se njihova oblika parametrov razlikuje.

## Kaj je preobremenitev

Tukaj dopolnimo še eno potrebno znanje.

Pravkar smo za `Movie` napisali dva `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Takšen zapis, kjer ima »ista funkcija enako ime, vendar različne parametre«, imenujemo »preobremenitev«.

Tukaj se obe funkciji imenujeta `init`, vendar sprejemata različne parametre, zato lahko Swift razlikuje, katero funkcijo kličeš.

Na primer:

```swift
Movie(name: "Days of Heaven")
```

Bo poklical:

```swift
init(name: String)
```

Medtem ko:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Pokliče drugo, popolno različico inicializacijske metode.

Naloga preobremenitve je torej ta, da lahko isti tip glede na različne scenarije ponudi različne načine ustvarjanja.

## Spoznajmo class

Nato se na kratko spoznajmo še s `class`.

Poleg pogosto uporabljenega `struct` v Swiftu veliko programskih jezikov uporablja `class` za ustvarjanje primerkov, na primer Java, C#, Kotlin in drugi.

V Swiftu je zapis `class` zelo podoben zapisu `struct`.

Na primer:

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

Opazil boš, da je poleg tega, da se ključna beseda spremeni iz `struct` v `class`, skoraj vse drugo videti enako.

Tudi način ustvarjanja primerka je zelo podoben:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Zato sta si `struct` in `class` na ravni sintakse res zelo podobna.

### Razlika med Struct in Class

Čeprav sta si `struct` in `class` videti zelo podobna, nista popolnoma enaka.

**1. Način inicializacije je drugačen**

Pri `struct` sistem običajno samodejno ustvari primerno inicializacijsko metodo, če konstruktorja ne napišemo ročno.

Pri `class` pa je navadno treba ročno napisati `init`, če nekatere lastnosti še nimajo privzete vrednosti, sicer pride do napake.

Na primer:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ta `class` zaradi manjkajočega konstruktorja javlja napako, ker lastnosti niso inicializirane.

Prevajalnik bo prikazal približno takšen namig:

```swift
Class 'Movie' has no initializers
```

Zato je v tem primeru za `class` treba ročno napisati konstruktor.

**2. `struct` je vrednostni tip, `class` pa referenčni tip**

`struct` je vrednostni tip, `class` pa referenčni tip.

Na začetni stopnji teh dveh pojmov ni treba obvladati, dovolj je, da imaš o njiju osnovno predstavo.

Na primer, `struct` je bolj podoben temu, da »naredimo novo kopijo vrednosti«.

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

Ko tukaj `user1` dodelimo `user2`, je to podobno, kot da kopiramo nove podatke, zato sprememba `user2` ne vpliva na `user1`.

Medtem ko je `class` bolj podobna temu, da »oba kažeta na isti primerek«.

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

Tukaj `user1` in `user2` kažeta na isti primerek.

Zdaj še ni treba popolnoma razumeti osnovnega mehanizma vrednostnih in referenčnih tipov, dovolj je, da veš, da je `struct` primernejši za shranjevanje neodvisnih podatkov, `class` pa za situacije, kjer več mest deli isti primerek.

## Kako izbirati na začetni stopnji

V trenutni fazi za običajne podatkovne modele najprej razmislimo o `struct`, za podatke, ki jih je treba deliti in sinhrono spreminjati, pa nato o `class`.

To ni absolutno pravilo, je pa za začetnike dovolj praktičen način presoje.

Še posebej v SwiftUI boš pogosto opazil, da lahko `struct` že opravi večino dela.

Poleg tega se v številnih programerskih gradivih vsebina, ustvarjena s `class`, imenuje tudi »objekt«. Na začetni stopnji si to lahko najprej razlagaš kot primerek in ni treba, da ju namenoma ločuješ.

## Povzetek

V tej lekciji smo podrobneje spoznali `struct` in mimogrede še `class`; oba se lahko uporabljata za definiranje tipov.

Tipi lahko ustvarjajo primerke. Ob ustvarjanju primerka se pokliče konstruktor, torej `init`.

Pri `struct` sistem običajno samodejno ustvari primeren konstruktor, če ga ne napišemo ročno. Če privzeti konstruktor ne ustreza potrebam, lahko konstruktor napišemo tudi sami.

Poleg tega smo tudi osnovno spoznali razliko med `struct` in `class`: `struct` je vrednostni tip, `class` pa referenčni tip. V SwiftUI se na začetni stopnji običajno pogosteje srečujemo z `struct`.

Ko bomo kasneje spoznavali prenos vrednosti v pogledih, podatkovne modele in upravljanje stanja, bomo to znanje še naprej uporabljali.
