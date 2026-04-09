# struct și class

În lecția anterioară, abia am început să luăm contact cu `struct`, am definit o structură și ne-am extins învățarea și către concepte precum protocoalele și `UUID`.

Acum avem deja o înțelegere preliminară a cuvântului-cheie `struct`, dar încă nu putem spune că îl înțelegem cu adevărat.

În această lecție, vom continua să avem `struct` ca subiect principal și, în treacăt, vom face cunoștință și cu `class`. Prin această lecție, vei înțelege mai clar: ce este o instanță, ce este un constructor și de ce putem folosi `struct` și `class` pentru a organiza datele.

## Sistem de gestionare a elevilor

De exemplu, acum vrem să dezvoltăm un sistem de gestionare a elevilor. Fiecare elev are informații precum nume, sex, telefon, vârstă, adresă de acasă și așa mai departe.

În acest moment, putem combina aceste informații și le putem defini ca o structură `Student`:

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

Aici folosim `struct` pentru a defini un tip de elev.

Această structură `Student` conține mai multe proprietăți:

- `id`: identificatorul unic al elevului
- `name`: numele elevului
- `sex`: sexul elevului
- `phone`: telefonul elevului
- `age`: vârsta elevului
- `address`: adresa de acasă

Astfel, mai multe date care înainte erau separate sunt acum combinate într-un „elev” complet.

`Student` de aici respectă și protocolul `Identifiable` și definește un câmp `id`, pentru a facilita afișarea ulterioară a datelor împreună cu bucla `ForEach`.

Apoi, putem crea o instanță de elev:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Acest cod înseamnă că, pe baza acestei structuri `Student`, se poate crea o informație concretă despre un elev.

Aici, `Student` este tipul, iar `Student(...)` reprezintă o instanță creată.

În SwiftUI, putem atribui această instanță unei variabile și apoi să o afișăm.

De exemplu:

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

Astfel, în vizualizare putem vedea numele acestui elev: `Fang Junyu`.

Aici, mai întâi am creat o instanță `Student`, apoi am atribuit-o variabilei `student`, iar la final am citit proprietatea din ea prin `student.name`.

## Ce este o instanță

Când începem să învățăm `struct`, este posibil să simțim că termenul „instanță” este ceva foarte necunoscut.

Dar, de fapt, folosim instanțe încă de la început, doar că înainte nu le-am observat în mod special.

De exemplu:

```swift
let name = "Fang Junyu"
```

Aici, `"Fang Junyu"` este o valoare de tip șir de caractere, iar în esență este o instanță a tipului `String`.

Putem scrie și astfel:

```swift
let name = String("Fang Junyu")
```

Aceste două moduri de scriere exprimă același lucru: creăm o instanță a tipului `String` și o atribuim variabilei `name`.

La fel este și pentru `Int`:

```swift
let num = 3
```

Aici, `3` este în esență o valoare de tip `Int` și poate fi înțeleasă și ca o instanță `Int`.

Prin urmare, instanța nu este un concept special care apare doar în `struct`.

Fie că este vorba despre `String`, `Int`, `Double`, `Bool` sau despre `Student` definit de noi, toate pot crea instanțe.

Prin urmare, atunci când scriem:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

În esență, este la fel ca atunci când creăm instanțe de `String` sau `Int`, doar că `Student` este un tip definit chiar de noi.

## Constructor

Atunci când creăm o instanță:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

De fapt, apelăm metoda de inițializare a lui `Student`, adică `init`.

Poți înțelege constructorul ca fiind: **punctul de intrare responsabil de atribuirea valorilor proprietăților atunci când se creează o instanță.**

Adică, înainte ca o instanță să fie creată cu adevărat, de obicei trebuie mai întâi să treacă prin `init`.

De exemplu, când am învățat anterior ciclul de viață al vizualizărilor SwiftUI, am scris un astfel de cod:

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

Aici, `init()` se execută atunci când este creată instanța `ContentView`, iar `onAppear` se execută numai atunci când vizualizarea este afișată cu adevărat pe ecran. Cu alte cuvinte, crearea și afișarea vizualizării nu au loc în același moment.

În mod similar, atunci când creăm `Student(...)`, apelăm constructorul lui `Student`.

### Constructor generat automat de sistem

Atunci când am definit `Student`, nu am scris manual `init`:

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

Totuși, putem crea direct o instanță:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

De ce putem crea o instanță fără să existe un constructor scris de noi?

Pentru că, în cazul lui `struct`, dacă nu scriem manual un constructor, sistemul generează de obicei automat un constructor potrivit pentru noi.

În faza de început, poți înțelege simplu astfel: Swift completează automat codul de inițializare pentru noi.

Poți înțelege aproximativ că sistemul completează pentru noi codul de mai jos:

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

Aici trebuie observat un detaliu:

```swift
let id = UUID()
```

`id` are deja o valoare implicită, deci atunci când creăm instanța nu este nevoie să transmitem manual `id`.

Cu alte cuvinte, proprietățile fără valoare implicită trebuie de obicei transmise în constructor; proprietățile care au deja o valoare implicită pot folosi direct acea valoare.

Prin urmare, atunci când creăm o instanță `Student`, trebuie să transmitem doar `name`, `sex`, `phone`, `age` și `address`.

### Sugestii ale compilatorului

În plus, atunci când introducem `Student(...)` în Xcode, putem vedea și sugestiile de parametri oferite de sistem.

![student](../../Resource/022_student.png)

Acest lucru demonstrează de fapt și că tipul curent chiar are un constructor generat automat de sistem.

### Scrierea propriului constructor

Deși sistemul poate genera automat un constructor, uneori această modalitate implicită de inițializare nu corespunde pe deplin nevoilor noastre.

De exemplu, avem o structură `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Conform constructorului generat automat de sistem, atunci când creăm o instanță trebuie să transmitem în același timp acești trei parametri:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Dar dacă acum vrem să introducem un lot de filme vechi și cunoaștem doar titlul filmului, nu și regizorul sau ratingul, acest lucru devine mai incomod.

Pentru că nu putem decât să scriem astfel:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Deși funcționează, nu este convenabil să scriem de fiecare dată `--`.

În acest moment, putem scrie un constructor:

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

Astfel, atunci când creăm filme vechi, trebuie doar să transmitem `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Acesta este unul dintre sensurile scrierii propriului constructor: **a face modul de creare a instanței mai potrivit pentru nevoile reale.**

### Analiza constructorului personalizat

Să privim acest constructor scris manual:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Semnificația acestui cod este că, atunci când se creează o instanță `Movie`, se cere doar transmiterea unui parametru `name`.

Apoi, în interiorul constructorului, `name` primit este atribuit valorii `name` a instanței, iar pentru `director` și `rating` este dată o valoare implicită `--`.

`self` de aici înseamnă „această instanță însăși”.

De exemplu:

```swift
self.name = name
```

`self.name` din stânga reprezintă proprietatea din instanță; `name` din dreapta reprezintă parametrul pe care l-am transmis.

Poți înțelege simplu acest lucru ca pe salvarea valorii primite din exterior în proprietatea proprie a instanței.

După ce toate proprietățile au primit valori, instanța este creată.

### Mecanismul constructorilor

Atunci când declarăm explicit un constructor, apare și o schimbare:

Constructorul generat automat inițial de sistem, de obicei, nu mai poate fi folosit direct.

De exemplu:

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

Acum, dacă scriem din nou astfel:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Compilatorul va raporta o eroare:

```swift
Extra arguments at positions #2, #3 in call
```

Înseamnă: ai transmis argumente suplimentare.

De ce apare această eroare?

Pentru că în structura `Movie` curentă există doar acest singur constructor declarat manual:

```swift
init(name: String)
```

Acesta acceptă doar un parametru `name` și nu acceptă `director` și `rating`.

Cu alte cuvinte, după ce adaugi propriul constructor, metoda de inițializare generată automat inițial nu mai poate fi folosită direct.

Dacă vrem să suportăm atât „transmit doar numele”, cât și „transmit informațiile complete”, atunci trebuie să adăugăm noi înșine încă un constructor complet:

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

Astfel, avem două constructoare diferite.

Atunci când creăm filme vechi, putem scrie astfel:

```swift
Movie(name: "The Night of the Hunter")
```

Atunci când creăm filme noi cu informații complete, putem scrie astfel:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Acest mod de scriere arată și faptul că același tip poate avea mai multe constructoare, atât timp cât forma parametrilor lor este diferită.

## Ce este supraîncărcarea

Aici mai completăm încă un punct de cunoștințe necesar.

Tocmai am scris două `init` pentru `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Acest tip de scriere, în care „numele funcției este același, dar parametrii sunt diferiți”, se numește „supraîncărcare”.

În acest caz, ambele funcții se numesc `init`, dar parametrii pe care îi primesc sunt diferiți, astfel încât Swift poate distinge ce funcție ai apelat.

De exemplu:

```swift
Movie(name: "Days of Heaven")
```

Va apela:

```swift
init(name: String)
```

Iar:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Va apela cealaltă versiune completă a metodei de inițializare.

Prin urmare, rolul supraîncărcării este: să permită aceluiași tip să ofere moduri diferite de creare în funcție de scenarii diferite.

## Cunoașterea lui class

În continuare, să facem pe scurt cunoștință și cu `class`.

Pe lângă `struct`, comun în Swift, multe limbaje de programare folosesc și `class` pentru a crea instanțe, de exemplu Java, C#, Kotlin și altele.

În Swift, modul de scriere pentru `class` este foarte apropiat de cel pentru `struct`.

De exemplu:

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

Vei observa că, în afară de schimbarea cuvântului-cheie din `struct` în `class`, celelalte părți par aproape identice.

Și modul de creare a unei instanțe este foarte asemănător:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Prin urmare, la nivel de sintaxă, `struct` și `class` seamănă într-adevăr foarte mult.

### Diferența dintre Struct și Class

Deși `struct` și `class` seamănă foarte mult, ele nu sunt complet identice.

**1. Modul de inițializare este diferit**

Pentru `struct`, dacă nu scrii manual un constructor, sistemul generează de obicei automat o metodă de inițializare potrivită.

Dar pentru `class`, dacă există proprietăți care nu au încă valori implicite, de obicei trebuie să scrii manual `init`, altfel va apărea o eroare.

De exemplu:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Această `class`, pentru că nu are constructor, provoacă o eroare deoarece proprietățile nu au fost inițializate.

Compilatorul va afișa un mesaj asemănător cu:

```swift
Class 'Movie' has no initializers
```

Prin urmare, în acest exemplu, `class` trebuie să aibă constructor scris manual.

**2. `struct` este tip valoare, `class` este tip referință**

`struct` este tip valoare, iar `class` este tip referință.

În faza de început, nu este nevoie să stăpânești aceste două concepte, este suficient doar să ai o înțelegere simplă.

De exemplu, `struct` seamănă mai mult cu „a face o copie nouă a valorii”.

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

Aici, după ce `user1` este atribuit lui `user2`, este echivalent cu a face o copie a noilor date, astfel încât modificarea lui `user2` nu îl afectează pe `user1`.

Iar `class` seamănă mai mult cu „a indica împreună spre aceeași instanță”.

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

Aici, `user1` și `user2` indică aceeași instanță.

Acum nu este nevoie să înțelegem complet mecanismul de bază al tipurilor valoare și al tipurilor referință, trebuie doar să știm că `struct` este mai potrivit pentru a păstra date independente, iar `class` este mai potrivit atunci când mai multe locuri trebuie să partajeze aceeași instanță.

## Cum alegem la început

În etapa actuală, pentru modelele de date obișnuite se acordă prioritate lui `struct`, iar pentru datele care trebuie partajate și modificate sincron se ia în considerare `class`.

Aceasta nu este o regulă absolută, dar pentru începători este o modalitate de judecată suficient de practică.

Mai ales în SwiftUI, de multe ori vei descoperi că `struct` poate deja să îndeplinească cea mai mare parte a muncii.

În plus, în multe materiale de programare, conținutul creat de `class` este numit și „obiect”. În faza de început, îl poți înțelege mai întâi ca instanță, fără să fie nevoie să faci o distincție intenționată.

## Rezumat

În această lecție, am studiat în profunzime `struct` și, în treacăt, am făcut cunoștință și cu `class`; ambele pot fi folosite pentru a defini tipuri.

Tipurile pot crea instanțe. Când este creată o instanță, este apelat constructorul, adică `init`.

Pentru `struct`, dacă nu este scris manual un constructor, sistemul generează de obicei automat un constructor potrivit. Dacă constructorul implicit nu satisface cerințele, atunci putem scrie și noi manual un constructor.

În plus, am înțeles și pe scurt diferența dintre `struct` și `class`: `struct` este tip valoare, iar `class` este tip referință. În SwiftUI, la început, cel cu care intrăm mai des în contact este de obicei `struct`.

Mai târziu, când vom învăța transmiterea valorilor în vizualizări, modelele de date și gestionarea stării, aceste conținuturi vor continua să fie folosite.
