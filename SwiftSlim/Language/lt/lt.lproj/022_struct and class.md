# struct ir class

Praeitoje pamokoje mes tik pradėjome susipažinti su `struct`, apibrėžėme vieną struktūrą ir papildomai praplėtėme žinias apie protokolus, `UUID` ir kitus žinių taškus.

Dabar jau turime pradinį supratimą apie raktažodį `struct`, tačiau dar negalime sakyti, kad jį tikrai suprantame.

Šioje pamokoje toliau laikysime `struct` pagrindine tema ir kartu susipažinsime ir su `class`. Po šios pamokos tau bus aiškiau: kas yra instance, kas yra konstruktorius ir kodėl galime naudoti `struct` bei `class` duomenims tvarkyti.

## Studentų valdymo sistema

Pavyzdžiui, dabar norime kurti studentų valdymo sistemą. Kiekvienas studentas turi tokią informaciją kaip vardas, lytis, telefonas, amžius, namų adresas ir panašiai.

Tokiu atveju šią informaciją galime sujungti ir apibrėžti kaip `Student` struktūrą:

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

Čia naudojame `struct`, kad apibrėžtume studento tipą.

Ši `Student` struktūra turi kelias savybes:

- `id`: unikalus studento identifikatorius
- `name`: studento vardas
- `sex`: studento lytis
- `phone`: studento telefonas
- `age`: studento amžius
- `address`: namų adresas

Tokiu būdu keli iš pradžių išsibarstę duomenys sujungiami į vieną pilną „studentą“.

Čia `Student` taip pat atitinka `Identifiable` protokolą ir apibrėžia `id` lauką, kad vėliau būtų patogu rodyti duomenis kartu su `ForEach` ciklu.

Toliau galime sukurti studento instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Šis kodas reiškia, kad pagal `Student` struktūrą galima sukurti konkretų studento įrašą.

Čia `Student` yra tipas, o `Student(...)` reiškia sukurtą instance.

SwiftUI aplinkoje šią instance galime priskirti kintamajam ir tada ją parodyti.

Pavyzdžiui:

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

Taip rodinyje galime pamatyti šio studento vardą: `Fang Junyu`.

Čia pirmiausia sukūrėme `Student` instance, tada priskyrėme ją kintamajam `student`, o galiausiai perskaitėme jo savybę per `student.name`.

## Kas yra instance

Kai tik pradedame mokytis `struct`, žodis „instance“ gali pasirodyti labai neįprastas.

Tačiau iš tikrųjų instance naudojame nuo pat pradžių, tiesiog anksčiau į tai specialiai nekreipėme dėmesio.

Pavyzdžiui:

```swift
let name = "Fang Junyu"
```

Čia `"Fang Junyu"` yra eilutės reikšmė, ir iš esmės tai yra `String` tipo instance.

Taip pat galime parašyti taip:

```swift
let name = String("Fang Junyu")
```

Šie du užrašymo būdai reiškia tą patį: sukurti `String` tipo instance ir priskirti ją kintamajam `name`.

Tas pats galioja ir `Int` atveju:

```swift
let num = 3
```

Čia `3` iš esmės yra `Int` tipo reikšmė, ir ją taip pat galima suprasti kaip `Int` instance.

Taigi instance nėra koks nors ypatingas terminas, pasitaikantis tik `struct`.

Nesvarbu, ar tai `String`, `Int`, `Double`, `Bool`, ar mūsų pačių sukurtas `Student`, visi jie gali kurti instance.

Todėl kai rašome:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

iš esmės tai yra tas pats, kas kurti `String` ar `Int` instance, tik `Student` yra tipas, kurį apibrėžėme patys.

## Konstruktorius

Kai kuriame instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

iš tikrųjų mes kviečiame `Student` inicializavimo metodą, tai yra `init`.

Konstruktorių galima suprasti taip: **tai įėjimo taškas, kuris atsakingas už reikšmių priskyrimą savybėms, kai kuriamas instance.**

Tai reiškia, kad prieš instance galutinai sukuriant, jis paprastai pirmiausia turi pereiti per `init`.

Pavyzdžiui, kai anksčiau mokėmės SwiftUI rodinių gyvavimo ciklo, rašėme tokį kodą:

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

Čia `init()` įvykdomas tada, kai sukuriamas `ContentView` instance, o `onAppear` įvykdomas tik tada, kai rodinys iš tikrųjų pasirodo ekrane. Tai reiškia, kad rodinio sukūrimas ir jo parodymas nėra tas pats momentas.

Lygiai taip pat, kai sukuriame `Student(...)`, mes taip pat kviečiame `Student` konstruktorių.

### Sistemos automatiškai sugeneruotas konstruktorius

Kai apibrėžėme `Student`, mes nerašėme `init` ranka:

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

Tačiau vis tiek galime tiesiogiai sukurti instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Kodėl galima sukurti instance net neparašius konstruktoriaus?

Todėl, kad `struct` atveju, jei ranka neparašome konstruktoriaus, sistema paprastai automatiškai sugeneruoja tinkamą konstruktorių.

Pradiniame mokymosi etape tai galima paprastai suprasti taip: Swift automatiškai papildo už mus inicializavimo kodą.

Apytikriai galima suprasti, kad sistema už mus papildo tokį kodą:

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

Čia reikia atkreipti dėmesį į vieną smulkmeną:

```swift
let id = UUID()
```

`id` jau turi numatytąją reikšmę, todėl kuriant instance mums nebereikia ranka perduoti `id`.

Tai reiškia, kad savybes, kurios neturi numatytųjų reikšmių, paprastai reikia perduoti konstruktoriuje; o savybės, kurios jau turi numatytąsias reikšmes, paprastai gali tiesiog naudoti tas pradines reikšmes.

Todėl kurdami `Student` instance turime perduoti tik `name`, `sex`, `phone`, `age` ir `address`.

### Kompiliatoriaus užuominos

Be to, kai Xcode aplinkoje įvedame `Student(...)`, taip pat galime pamatyti sistemos pateikiamas parametrų užuominas.

![student](../../Resource/022_student.png)

Tai taip pat rodo, kad dabartinis tipas iš tikrųjų turi sistemos automatiškai sugeneruotą konstruktorių.

### Parašyti konstruktorių patiems

Nors sistema gali automatiškai sugeneruoti konstruktorių, kartais šis numatytasis inicializavimo būdas nevisiškai atitinka mūsų poreikius.

Pavyzdžiui, turime tokią `Movie` struktūrą:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Pagal sistemos automatiškai sugeneruotą konstruktorių, kurdami instance turime vienu metu perduoti šiuos tris parametrus:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Tačiau jei dabar norime įvesti senų filmų rinkinį ir žinome tik filmų pavadinimus, bet nežinome režisieriaus ir įvertinimo, tai tampa gana nepatogu.

Nes tuomet galime rašyti tik taip:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Nors tai veikia, kiekvieną kartą kartoti `--` nėra patogu.

Tokiu atveju galime parašyti konstruktorių:

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

Tokiu būdu, kuriant senus filmus, mums tereikia perduoti tik `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Tai yra viena iš prasmių rašyti konstruktorių pačiam: **padaryti instance kūrimo būdą labiau atitinkantį realius poreikius.**

### Custom konstruktoriaus analizė

Pažiūrėkime į šį ranka parašytą konstruktorių:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Šio kodo reikšmė yra tokia: kai kuriame `Movie` instance, reikia perduoti tik vieną parametrą `name`.

Tada konstruktoriaus viduje perduotas `name` bus priskirtas paties instance `name`, o `director` ir `rating` gaus numatytąją reikšmę `--`.

Čia `self` reiškia „šis dabartinis instance pats“.

Pavyzdžiui:

```swift
self.name = name
```

Kairėje pusėje esantis `self.name` reiškia instance savybę; dešinėje pusėje esantis `name` reiškia mūsų perduotą parametrą.

Tai galima paprastai suprasti kaip reikšmės, perduotos iš išorės, išsaugojimą paties instance savybėje.

Kai visoms savybėms priskiriamos reikšmės, šio instance sukūrimas yra baigtas.

### Konstruktoriaus veikimo mechanizmas

Kai aiškiai deklaruojame konstruktorių, įvyksta dar vienas pokytis:

tas konstruktorius, kurį sistema iš pradžių sugeneravo automatiškai, paprastai jau nebegali būti naudojamas tiesiogiai.

Pavyzdžiui:

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

Jei dabar vėl parašysime taip:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

kompiliatorius parodys klaidą:

```swift
Extra arguments at positions #2, #3 in call
```

Tai reiškia: perdavei perteklinius parametrus.

Kodėl atsiranda ši klaida?

Todėl, kad dabartinėje `Movie` struktūroje yra tik vienas konstruktorius, kurį deklaravai ranka:

```swift
init(name: String)
```

Jis priima tik vieną parametrą `name`, ir nepriima `director` bei `rating`.

Kitaip tariant, kai ranka pridedi savo konstruktorių, iš pradžių automatiškai sugeneruotas inicializavimo būdas tiesiogiai nebegali būti naudojamas.

Jei norime palaikyti ir „perduoti tik pavadinimą“, ir „perduoti visą informaciją“, turime patys papildomai parašyti dar vieną pilną konstruktorių:

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

Taip mes jau turime du skirtingus konstruktorius.

Kai kuriame seną filmą, galime rašyti taip:

```swift
Movie(name: "The Night of the Hunter")
```

Kai kuriame naują filmą su pilna informacija, galime rašyti taip:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Toks rašymo būdas taip pat rodo, kad tas pats tipas gali turėti kelis konstruktorius, jei tik jų parametrų formos skiriasi.

## Kas yra overload

Čia dar papildysime vieną reikalingą žinių tašką.

Ką tik `Movie` tipui parašėme du `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Toks rašymo būdas, kai „tas pats funkcijos pavadinimas, bet skirtingi parametrai“, vadinamas „overload“.

Čia abi funkcijos vadinasi `init`, tačiau kadangi jos priima skirtingus parametrus, Swift gali atskirti, kurią funkciją kvieti.

Pavyzdžiui:

```swift
Movie(name: "Days of Heaven")
```

bus iškviesta:

```swift
init(name: String)
```

O:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

iškvies kitą pilną inicializavimo metodo versiją.

Todėl overload vaidmuo yra toks: leisti tam pačiam tipui pateikti skirtingus kūrimo būdus skirtingoms situacijoms.

## Susipažinimas su class

Toliau trumpai susipažinkime ir su `class`.

Be dažnai Swift kalboje naudojamo `struct`, daugelis programavimo kalbų naudoja `class` instance kūrimui, pavyzdžiui, Java, C#, Kotlin ir kitos.

Swift kalboje `class` rašymo būdas yra labai panašus į `struct`.

Pavyzdžiui:

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

Pastebėsi, kad apart to, jog raktažodis pasikeičia iš `struct` į `class`, visos kitos dalys atrodo beveik taip pat.

Ir instance kūrimo būdas taip pat labai panašus:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Taigi sintaksės lygmeniu `struct` ir `class` iš tiesų labai panašūs.

### Skirtumas tarp Struct ir Class

Nors `struct` ir `class` atrodo labai panašiai, jie nėra visiškai vienodi.

**1. Inicializavimo būdas skiriasi**

`struct` atveju, jei ranka neparašome konstruktoriaus, sistema paprastai automatiškai sugeneruoja tinkamą inicializavimo metodą.

Tačiau `class` atveju, jei yra savybių, kurios dar neturi numatytųjų reikšmių, paprastai reikia ranka parašyti `init`, priešingu atveju atsiras klaida.

Pavyzdžiui:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ši `class` sukels klaidą, nes neturi konstruktoriaus, todėl savybės nebus inicializuotos.

Kompiliatorius parodys kažką panašaus į:

```swift
Class 'Movie' has no initializers
```

Todėl šiame pavyzdyje `class` privalo turėti ranka parašytą konstruktorių.

**2. `struct` yra value type, o `class` yra reference type**

`struct` yra value type, o `class` yra reference type.

Pradiniame mokymosi etape nereikia visiškai perprasti šių dviejų sąvokų; pakanka turėti paprastą pirminį supratimą.

Pavyzdžiui, `struct` labiau primena „naujos reikšmės kopijavimą“.

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

Čia, kai `user1` priskiriamas `user2`, tai tarsi sukuriama nauja duomenų kopija, todėl `user2` keitimas nepaveikia `user1`.

O `class` labiau primena „kartu rodyti į tą patį instance“.

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

Čia `user1` ir `user2` rodo į tą patį instance.

Dabar mums dar nereikia visiškai suprasti vidinio value type ir reference type mechanizmo; pakanka žinoti, kad `struct` labiau tinka saugoti nepriklausomus duomenis, o `class` labiau tinka tada, kai keliose vietose reikia dalintis tuo pačiu instance.

## Kaip rinktis pradiniame etape

Dabartiniame etape įprastiems duomenų modeliams pirmiausia verta rinktis `struct`; o tada, kai reikia bendrinamų duomenų ir sinchronizuotų pakeitimų, verta galvoti apie `class`.

Tai nėra absoliuti taisyklė, bet pradedantiesiems tai pakankamai praktiškas būdas spręsti.

Ypač SwiftUI aplinkoje dažnai pastebėsi, kad `struct` jau gali atlikti didžiąją dalį darbo.

Be to, daugelyje programavimo šaltinių tai, kas sukurta naudojant `class`, taip pat vadinama „objektu“. Pradiniame etape tai gali tiesiog suprasti kaip instance, nebūtina sąmoningai jų griežtai atskirti.

## Santrauka

Šioje pamokoje mes giliau išmokome `struct`, o kartu susipažinome ir su `class`; abu jie gali būti naudojami tipams apibrėžti.

Tipai gali kurti instance. Kai sukuriamas instance, iškviečiamas konstruktorius, tai yra `init`.

`struct` atveju, jei ranka neparašome konstruktoriaus, sistema paprastai automatiškai sugeneruoja tinkamą konstruktorių. Jei numatytasis konstruktorius neatitinka poreikių, konstruktorių galime parašyti ir patys.

Be to, mes taip pat įgijome pirminį supratimą apie skirtumą tarp `struct` ir `class`: `struct` yra value type, o `class` yra reference type. SwiftUI aplinkoje pradiniame etape dažniausiai dažniau susidursi būtent su `struct`.

Vėliau, kai mokysimės reikšmių perdavimo tarp rodinių, duomenų modelių ir būsenos valdymo, visas šis turinys ir toliau bus naudojamas.
