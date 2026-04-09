# struct i class

U prošloj lekciji tek smo se počeli upoznavati sa `struct`, definirali smo jednu strukturu i usput proširili znanje o protokolima, `UUID`-u i drugim pojmovima.

Sada već imamo početno razumijevanje ključne riječi `struct`, ali to se još ne može smatrati pravim razumijevanjem.

U ovoj lekciji nastavit ćemo sa `struct` kao glavnim sadržajem, a usput ćemo upoznati i `class`. Kroz ovu lekciju jasnije ćeš razumjeti: što je instanca, što je konstruktor i zašto možemo koristiti `struct` i `class` za organiziranje podataka.

## Sustav za upravljanje studentima

Na primjer, sada želimo razviti sustav za upravljanje studentima. Svaki student ima informacije kao što su ime, spol, telefon, dob, kućna adresa i slično.

U ovom trenutku možemo te informacije spojiti zajedno i definirati ih kao strukturu `Student`:

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

Ovdje koristimo `struct` za definiranje tipa studenta.

Ova struktura `Student` sadrži više svojstava:

- `id`: jedinstveni identifikator studenta
- `name`: ime studenta
- `sex`: spol studenta
- `phone`: telefon studenta
- `age`: dob studenta
- `address`: kućna adresa

Na taj način, više podataka koji su izvorno bili raspršeni, kombinira se u jednog cjelovitog "studenta".

Ovdje `Student` također slijedi protokol `Identifiable` i definira polje `id`, kako bi kasnije bilo zgodno prikazivati podatke uz `ForEach` petlju.

Zatim možemo stvoriti instancu studenta:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Ovaj kod znači da se prema strukturi `Student` mogu stvoriti konkretni podaci o studentu.

Ovdje je `Student` tip, a `Student(...)` predstavlja stvorenu instancu.

U SwiftUI-ju ovu instancu možemo dodijeliti varijabli, a zatim je prikazati.

Na primjer:

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

Tako u prikazu možemo vidjeti ime ovog studenta: `Fang Junyu`.

Ovdje smo najprije stvorili instancu `Student`, zatim je dodijelili varijabli `student`, i na kraju čitali njezino svojstvo preko `student.name`.

## Što je instanca

Kada tek počnemo učiti `struct`, riječ "instanca" može nam zvučati vrlo nepoznato.

Ali zapravo, instance koristimo od samog početka, samo prije na to nismo posebno obraćali pažnju.

Na primjer:

```swift
let name = "Fang Junyu"
```

Ovdje je `"Fang Junyu"` vrijednost niza znakova, i u svojoj biti to je instanca tipa `String`.

Možemo to napisati i ovako:

```swift
let name = String("Fang Junyu")
```

Ova dva načina pisanja izražavaju istu stvar: stvaranje instance tipa `String` i njezino dodjeljivanje varijabli `name`.

Isto vrijedi i za `Int`:

```swift
let num = 3
```

Ovdje je `3` u svojoj biti vrijednost tipa `Int`, a može se razumjeti i kao instanca `Int`.

Dakle, instanca nije neki poseban pojam koji se pojavljuje samo u `struct`.

Bilo da je riječ o `String`, `Int`, `Double`, `Bool` ili prilagođenom `Student`, svi oni mogu stvarati instance.

Zato, kada napišemo:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

to je u svojoj biti isto kao stvaranje instance `String` ili `Int`, samo što je `Student` tip koji smo sami definirali.

## Konstruktor

Kada stvaramo instancu:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

zapravo pozivamo metodu inicijalizacije od `Student`, odnosno `init`.

Konstruktor možeš razumjeti ovako: **to je ulazna točka koja je odgovorna za dodjeljivanje vrijednosti svojstvima prilikom stvaranja instance.**

Drugim riječima, prije nego što instanca zaista bude potpuno stvorena, obično najprije mora proći kroz `init`.

Na primjer, kada smo ranije učili životni ciklus SwiftUI prikaza, pisali smo ovakav kod:

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

Ovdje se `init()` izvršava kada se stvara instanca `ContentView`, dok se `onAppear` izvršava tek kada se prikaz stvarno pojavi na zaslonu. To znači da stvaranje prikaza i njegovo prikazivanje nisu isti trenutak.

Slično tome, kada stvaramo `Student(...)`, također pozivamo konstruktor od `Student`.

### Konstruktor koji sustav automatski generira

Kada smo definirali `Student`, nismo ručno napisali `init`:

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

Ali usprkos tome, još uvijek možemo izravno stvoriti instancu:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Zašto možemo stvoriti instancu bez pisanog konstruktora?

Zato što za `struct`, ako ručno ne napišemo konstruktor, sustav nam obično automatski generira odgovarajući konstruktor.

U početnoj fazi učenja, to možeš jednostavno razumjeti ovako: Swift automatski dopuni inicijalizacijski kod za nas.

Otprilike se može razumjeti da sustav za nas dopuni sljedeći kod:

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

Ovdje treba obratiti pažnju na jedan detalj:

```swift
let id = UUID()
```

`id` već ima zadanu vrijednost, pa pri stvaranju instance ne moramo ponovno ručno prosljeđivati `id`.

To znači da se svojstva bez zadane vrijednosti obično moraju proslijediti u konstruktoru; svojstva koja već imaju zadanu vrijednost obično mogu izravno koristiti tu izvornu zadanu vrijednost.

Zato pri stvaranju instance `Student` trebamo proslijediti samo `name`, `sex`, `phone`, `age` i `address`.

### Natuknice prevoditelja

Osim toga, kada u Xcodeu upisujemo `Student(...)`, možemo vidjeti i natuknice za parametre koje daje sustav.

![student](../../Resource/022_student.png)

To zapravo također pokazuje da ovaj trenutni tip zaista ima konstruktor koji je sustav automatski generirao.

### Pisanje konstruktora vlastoručno

Iako sustav može automatski generirati konstruktor, ponekad ovaj zadani način inicijalizacije ne odgovara u potpunosti našim potrebama.

Na primjer, imamo strukturu `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Prema konstruktoru koji sustav automatski generira, pri stvaranju instance moramo istovremeno proslijediti ova tri parametra:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ali ako sada želimo unijeti skup starih filmova i znamo samo naziv filma, a ne znamo redatelja ni ocjenu, to postaje pomalo nezgodno.

Jer tada to možemo napisati samo ovako:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Iako to radi, nije praktično svaki put ponavljati `--`.

Tada možemo napisati vlastiti konstruktor:

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

Na taj način, pri stvaranju starih filmova trebamo proslijediti samo `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

To je jedno od značenja vlastoručnog pisanja konstruktora: **učiniti način stvaranja instanci prikladnijim stvarnim potrebama.**

### Analiza prilagođenog konstruktora

Pogledajmo ovaj ručno napisani konstruktor od maloprije:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Značenje ovog koda je da se pri stvaranju instance `Movie` traži samo jedan parametar `name`.

Zatim će konstruktor unutar sebe proslijeđeni `name` dodijeliti vlastitom `name` svojstvu instance, a `director` i `rating` dobivaju zadanu vrijednost `--`.

Ovdje `self` znači "ova trenutna instanca sama".

Na primjer:

```swift
self.name = name
```

Lijevo `self.name` označava svojstvo instance; desno `name` označava parametar koji smo proslijedili.

To se jednostavno može razumjeti kao spremanje vrijednosti izvana u vlastito svojstvo instance.

Kada su svim svojstvima dodijeljene vrijednosti, stvaranje te instance je završeno.

### Mehanizam konstruktora

Kada eksplicitno deklariramo konstruktor, događa se još jedna promjena:

konstruktor koji je sustav izvorno automatski generirao obično se više ne može izravno koristiti.

Na primjer:

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

Ako sada ponovno napišemo ovako:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

prevoditelj će prijaviti pogrešku:

```swift
Extra arguments at positions #2, #3 in call
```

To znači: proslijedio si suvišne parametre.

Zašto se pojavljuje ova pogreška?

Zato što u trenutnoj strukturi `Movie` postoji samo ovaj jedan konstruktor koji si ručno deklarirao:

```swift
init(name: String)
```

On prima samo jedan parametar `name`, a ne prima `director` ni `rating`.

Drugim riječima, kada ručno dodaš vlastiti konstruktor, izvorni automatski generirani način inicijalizacije više se ne može izravno koristiti.

Ako želimo podržati i "proslijediti samo naziv" i "proslijediti potpune informacije", moramo sami dopisati još jedan puni konstruktor:

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

Tako dobivamo dva različita konstruktora.

Pri stvaranju starog filma možemo pisati ovako:

```swift
Movie(name: "The Night of the Hunter")
```

Pri stvaranju novog filma s potpunim informacijama možemo pisati ovako:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ovakav način pisanja također pokazuje da isti tip može imati više konstruktora, sve dok su oblici njihovih parametara različiti.

## Što je overload

Ovdje ćemo dodati još jednu potrebnu točku znanja.

Upravo smo za `Movie` napisali dva `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Ovakav način pisanja, "isto ime funkcije, ali različiti parametri", naziva se "overload".

Ovdje se obje funkcije zovu `init`, ali budući da primaju različite parametre, Swift može razlikovati koju funkciju pozivaš.

Na primjer:

```swift
Movie(name: "Days of Heaven")
```

pozvat će:

```swift
init(name: String)
```

Dok će:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

pozvati drugu, potpunu verziju metode inicijalizacije.

Zato je uloga overloada: omogućiti istom tipu da pruža različite načine stvaranja prema različitim scenarijima.

## Upoznavanje s class

Zatim ćemo se ukratko upoznati i s `class`.

Osim uobičajenog `struct` u Swiftu, mnogi programski jezici koriste `class` za stvaranje instanci, poput Jave, C#-a, Kotlina i drugih.

U Swiftu je način pisanja `class` vrlo sličan `struct`.

Na primjer:

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

Primijetit ćeš da, osim što se ključna riječ mijenja iz `struct` u `class`, ostali dijelovi izgledaju gotovo isto.

I način stvaranja instance također je vrlo sličan:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Dakle, na razini sintakse, `struct` i `class` zaista su vrlo slični.

### Razlika između Struct i Class

Iako `struct` i `class` izgledaju vrlo slično, nisu potpuno isti.

**1. Način inicijalizacije je različit**

Za `struct`, ako ručno ne napišemo konstruktor, sustav obično automatski generira odgovarajuću metodu inicijalizacije.

Ali za `class`, ako postoje svojstva koja još nemaju zadanu vrijednost, obično moramo ručno napisati `init`, inače će se pojaviti pogreška.

Na primjer:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ova `class` uzrokuje pogrešku jer nema konstruktor, pa svojstva nisu inicijalizirana.

Prevoditelj će prikazati nešto poput:

```swift
Class 'Movie' has no initializers
```

Zato u ovom primjeru `class` mora imati ručno napisan konstruktor.

**2. `struct` je vrijednosni tip, `class` je referentni tip**

`struct` je vrijednosni tip, a `class` je referentni tip.

U početnoj fazi učenja nije potrebno potpuno savladati ova dva pojma; dovoljno je imati jednostavno početno razumijevanje.

Na primjer, `struct` je bliži ideji "kopiranja nove vrijednosti".

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

Ovdje, nakon što `user1` dodijelimo `user2`, to je kao da kopiramo novi skup podataka, pa promjena `user2` ne utječe na `user1`.

S druge strane, `class` je bliža ideji "zajedničkog pokazivanja na istu instancu".

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

Ovdje `user1` i `user2` pokazuju na istu instancu.

Trenutačno ne moramo potpuno razumjeti unutarnji mehanizam vrijednosnih i referentnih tipova; dovoljno je znati da je `struct` prikladniji za spremanje neovisnih podataka, a `class` prikladniji kada više mjesta treba dijeliti istu instancu.

## Kako birati u početnoj fazi

U trenutačnoj fazi, za obične modele podataka prvo razmisli o `struct`; kada su potrebni dijeljeni podaci i sinkronizirane izmjene, tada razmisli o `class`.

To nije apsolutno pravilo, ali za početnike je to dovoljno praktičan način procjene.

Posebno u SwiftUI-ju često ćeš otkriti da `struct` već može obaviti većinu posla.

Osim toga, u mnogim programerskim materijalima, ono što se stvara pomoću `class` naziva se i "objekt". U početnoj fazi to možeš jednostavno razumjeti kao instancu, bez potrebe da ih namjerno razlikuješ.

## Sažetak

U ovoj lekciji dublje smo naučili `struct`, a usput upoznali i `class`; oboje se mogu koristiti za definiranje tipova.

Tipovi mogu stvarati instance. Prilikom stvaranja instance poziva se konstruktor, odnosno `init`.

Za `struct`, ako ručno ne napišemo konstruktor, sustav obično automatski generira odgovarajući konstruktor. Ako zadani konstruktor ne zadovoljava potrebe, možemo i sami napisati konstruktor.

Osim toga, stekli smo i početno razumijevanje razlike između `struct` i `class`: `struct` je vrijednosni tip, dok je `class` referentni tip. U SwiftUI-ju se u početnoj fazi obično češće susreće upravo `struct`.

Kasnije, kada budemo učili prijenos vrijednosti između prikaza, modele podataka i upravljanje stanjem, sav ovaj sadržaj nastavit će se koristiti.
