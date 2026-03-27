# Spremanje iznosa kasice-prasice

U prošloj smo lekciji izradili jednostavnu “kasicu-prasicu”. U ovoj ćemo lekciji naučiti kako omogućiti trajno spremanje iznosa te “kasice-prasice”.

Glavni sadržaj ove lekcije su `UserDefaults` i property wrapper `@AppStorage`, a usput ćemo dodatno objasniti ulogu `onAppear` i način korištenja opcionalnog tipa (`nil`).

Važno je napomenuti da ova lekcija treba nastaviti kod “kasice-prasice” razvijen u prethodnoj lekciji.

## Problem trajne pohrane

Sada je sučelje “kasice-prasice” vrlo jednostavno i praktično za korištenje.

![Piggy Bank](../../Resource/014_view.png)

Ali postoji jedan očit problem: svaki put kada se prikaz osvježi ili se aplikacija zatvori, ukupan iznos “kasice-prasice” ponovno postane `0`, a sav prethodni iznos se izgubi.

To znači da podaci zapravo nisu trajno spremljeni. Drugim riječima, trenutačna “kasica-prasica” može spremati samo privremene podatke.

### Zašto se podaci ne mogu trajno spremiti?

To je zato što koristimo varijablu deklariranu pomoću `@State`:

```swift
@State private var amount = 0
```

Životni ciklus varijable deklarirane pomoću `@State` u potpunosti ovisi o prikazu.

Kada se prikaz stvori, `amount` se inicijalizira na `0`; kada se prikaz uništi, `amount` se također uništava.

Podaci pohranjeni u `amount` postoje samo u memoriji i nisu spremljeni na uređaj.

Ako ne želimo da `amount` bude vezan uz životni ciklus prikaza, moramo ostvariti trajno spremanje podataka. Drugim riječima, podatke moramo spremiti na uređaj.

### Što je “trajna pohrana podataka”

Trajna pohrana podataka može se razumjeti kao premještanje podataka iz “privremene memorije” u “pohranu uređaja”.

Kada se prikaz ili aplikacija zatvore, podaci se neće izgubiti.

U Swift razvoju, jednostavna “trajna pohrana” može se ostvariti pomoću `UserDefaults`, dok se za složenije podatke koriste `SwiftData` ili `CoreData`.

U ovoj ćemo lekciji najprije učiti najjednostavniji `UserDefaults`.

## `UserDefaults`

`UserDefaults` koristi se za spremanje laganih podataka u obliku parova ključ-vrijednost, često za osnovne tipove poput `String`、`Int`、`Double`、`Bool`.

### Spremanje podataka

`UserDefaults` koristi metodu `set` za spremanje podataka:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Prvi parametar `UserDefaults` označava podatke koje spremamo; ovdje su to tipovi poput `String` i `Int`.

Drugi parametar `forKey` sličan je nazivu varijable i služi za označavanje podataka spremljenih u `UserDefaults`.

### Čitanje podataka

`UserDefaults` koristi odgovarajuće metode za čitanje:

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")    // true
```

Pri čitanju se mora koristiti metoda odgovarajućeg tipa, inače može doći do greške ili pogrešnih podataka.

### Napomene za `UserDefaults`

#### 1. Vraćanje opcionalnog tipa

Pri korištenju `UserDefaults` za čitanje podataka, neke metode vraćaju opcionalni tip (`Optional`).

Na primjer:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Povratni tip varijable `name` je:

```swift
String?
```

To znači da vrijednost može postojati, ali može i ne postojati.

**Zašto se vraća opcionalni tip?**

To je zato što u `UserDefaults` za neki ključ možda ne postoji spremljeni podatak.

Na primjer:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Ako ključ `"City"` nikada prije nije bio spremljen, rezultat čitanja bit će:

```swift
nil
```

Važno je naglasiti da `nil` znači da nema podataka, a ne da je to prazan string.

U lekciji “sustav tipova” susreli smo se sa sličnim problemom: kada pretvorba tipa ne uspije, vraća se opcionalni tip.

Tada trebamo koristiti `??` kako bismo dali zadanu vrijednost i raspakirali vrijednost:

```swift
let name = UserDefaults.standard.string(forKey: "City")    ?? "Rizhao"
```

Ako `UserDefaults` može pročitati podatke, koristi se pročitana vrijednost; ako ne može (`nil`), koristi se zadana vrijednost.

#### 2. Vraćanje ne-opcionalnog tipa

`UserDefaults` pri čitanju tipova `Int`、`Double` i `Bool` vraća ne-opcionalne tipove.

Na primjer:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")    // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")    // false
```

Čak i ako ti ključevi nikada prije nisu imali spremljene podatke, povratna vrijednost neće biti `nil`.

Umjesto toga vratit će se zadana vrijednost:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Ograničenje količine podataka

`UserDefaults` je prikladan samo za spremanje male količine podataka, poput konfiguracija aplikacije i jednostavnih stanja.

U stvarnoj praksi nije prikladan za spremanje velikih količina podataka ili podataka koji se vrlo često čitaju i zapisuju.

## Spremanje iznosa “kasice-prasice”

Sada možemo koristiti `UserDefaults` kako bismo ostvarili logiku spremanja ukupnog iznosa “kasice-prasice”.

Kada korisnik klikne gumb, uneseni iznos pribroji se ukupnom iznosu, a zatim se taj ukupni iznos spremi u `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

Sada smo ostvarili logiku zapisivanja podataka.

## Objašnjenje logike trajne pohrane

Iako smo dovršili logiku zapisivanja trajne pohrane, u stvarnom radu primijetit ćemo da je svaki put nakon osvježavanja prikaza ili ponovnog otvaranja aplikacije varijabla `amount` i dalje `0`.

To je zato što:

```swift
@State private var amount = 0
```

U SwiftUI-ju se `@State` varijabla ponovno inicijalizira kada se prikaz stvori.

Iako je vrijednost `amount` spremljena u `UserDefaults`, kada se prikaz ponovno učita, `amount` će i dalje biti resetiran na `0`.

To pokazuje da smo trenutno samo spremili podatke u `UserDefaults`, ali ih nismo obnovili unutar prikaza.

Zato pri učitavanju prikaza moramo ručno pročitati podatke iz `UserDefaults` i ponovno ih dodijeliti varijabli `amount`, kako bismo dovršili cijelu logiku trajne pohrane.

### Usporedba s logikom

Ovaj proces možemo razumjeti kao “ploču u učionici”:

Tijekom nastave učitelj piše sadržaj na ploču, a taj sadržaj sličan je stanju trenutačnog prikaza (`@State`).

Kada nastava završi, ploča se briše kako bi bila spremna za sljedeći sat. To odgovara uništenju prikaza, pri čemu se i podaci u `@State` brišu.

Kako bi izbjegao gubitak nastavnog sadržaja, učitelj unaprijed spremi sadržaj u materijale za nastavu. Taj materijal odgovara podacima spremljenima u `UserDefaults`.

Kada sljedeći put ponovno započne nastava, ploča je isprva prazna (`@State` se inicijalizira), a učitelj prema materijalima ponovno upisuje prethodno znanje na ploču (čita `UserDefaults`).

Važno je razumjeti da ploča neće automatski vratiti prethodni sadržaj, nego ga treba ponovno upisati “čitanjem materijala” (`UserDefaults`).

## Korištenje `onAppear` za čitanje podataka

Kada se prikaz pojavi, trebamo ručno pročitati vrijednost iz `UserDefaults` i dodijeliti je `@State` varijabli `amount`, kako bismo ostvarili stvarnu trajnu pohranu podataka.

U SwiftUI-ju možemo koristiti `onAppear` za izvođenje inicijalizacijske logike kada se prikaz prikaže:

```swift
.onAppear {}
```

Kod za čitanje `UserDefaults` stavljamo unutar `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Kada se prikaz stvori, `amount` se inicijalizira na `0`; kada se prikaz prikaže, aktivira se `onAppear`, pročita vrijednost iz `UserDefaults` i dodijeli je varijabli `amount`. Na taj način prikaz može pokazati prethodno spremljeni ukupni iznos.

Sada je cijela logika trajne pohrane podataka “kasice-prasice” dovršena.

## Potpuni kod

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

## Property wrapper `@AppStorage`

SwiftUI nudi property wrapper `@AppStorage`, koji može pojednostaviti logiku spremanja pomoću `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` je omotač oko `UserDefaults`, a `"amount"` odgovara ključu u `UserDefaults`.

Kada se prikaz stvori, podaci se čitaju iz `UserDefaults`; kada se varijabla promijeni, automatski se upisuje u `UserDefaults`.

Podržava mehanizam ažuriranja stanja u SwiftUI-ju i, poput `@State`, osvježava prikaz kada se vrijednost promijeni.

Drugim riječima, `@AppStorage` može ostvariti logiku čitanja i spremanja podataka, pa više nije potrebno ručno pozivati `UserDefaults` niti koristiti `onAppear` za ručno čitanje podataka.

Stoga možemo koristiti `@AppStorage` kako bismo zamijenili `UserDefaults` u našem kodu:

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

## Sažetak

U ovoj lekciji uglavnom smo učili sljedeće:

Najprije, `UserDefaults` služi za spremanje laganih podataka, a mi smo pomoću `UserDefaults` spremili ukupni iznos na uređaj. `UserDefaults` pruža metode za čitanje i pisanje, a pritom treba obratiti pažnju i na opcionalne tipove te slične situacije.

Zatim, `@State` varijable služe samo za upravljanje privremenim stanjem unutar prikaza, a njihov je životni ciklus vezan uz prikaz. Kada se prikaz ponovno stvori, `@State` se ponovno inicijalizira.

Pri obnavljanju podataka iz `UserDefaults` naučili smo koristiti `onAppear` za čitanje podataka kada se prikaz prikaže i time dovršiti obnavljanje podataka.

Na kraju smo `UserDefaults` zamijenili s `@AppStorage`, čime se ostvaruje automatsko čitanje podataka pri učitavanju prikaza i automatski zapis pri promjeni podataka, čime se zamjenjuje ručna logika `UserDefaults` i `onAppear`.

Pomoću ovog znanja možemo ostvariti osnovnu funkcionalnost pohrane podataka u aplikaciji, tako da se podaci mogu trajno spremati.

## Vježba nakon lekcije

Sada “kasica-prasica” podržava spremanje iznosa, ali funkcionalnost još uvijek nije potpuna.

1. Ako korisnik želi podići novac, potrebno je osmisliti odgovarajuću logiku isplate.
2. Ako korisnik želi očistiti iznos, potrebno je također ostvariti logiku resetiranja.
3. Ako želimo dodati ime kasici-prasici, trebamo uključiti i spremanje podataka tipa `String`.

Možete nadograditi postojeću osnovu tim funkcijama kako bi “kasica-prasica” postala potpunija.

## Dodatno znanje - problem zadane vrijednosti u polju za unos

Sada također možemo dodatno optimizirati interakciju polja za unos kako bi unos bio praktičniji.

![textfield](../../Resource/015_view.png)

U trenutačnoj implementaciji zadana vrijednost polja za unos je `0`. Svaki put kada korisnik želi unijeti iznos, prvo mora izbrisati `0`, a zatim unijeti novi broj. Takvo korisničko iskustvo nije baš razumno.

Trebali bismo dopustiti da je početna vrijednost polja za unos prazna, a ne `0`.

To je zato što su `TextField` i `number` dvosmjerno povezani:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Kada se `number` inicijalizira s `0`, polje za unos će također prikazivati `0`.

Zato `number` trebamo promijeniti u praznu vrijednost, odnosno `nil`.

```swift
@State private var number = nil
```

Tada će se pojaviti greška:

```
Generic parameter 'Value' could not be inferred
```

To je upravo situacija o kojoj smo govorili u lekciji “sustav tipova”: kada se tip varijable ne može automatski zaključiti, moramo ga eksplicitno deklarirati.

Budući da smo `number` postavili na `nil`, a `nil` sam po sebi ne sadrži nikakvu informaciju o tipu, prevoditelj ne može zaključiti je li ta varijabla `String`、`Int` ili neki drugi tip, pa će prijaviti grešku.

Zato moramo eksplicitno deklarirati tip varijable `number`:

```swift
@State private var number:Int? = nil
```

Ovdje `Int?` znači opcionalni tip (`Optional`), što znači da vrijednost `number` može biti `Int`, ali može biti i `nil`.

Na taj način, kada je pri inicijalizaciji postavimo na `nil`, polje za unos bit će prazno, a ne `0`.

### Raspakiravanje opcionalnog tipa

Kada promijenimo `number` u opcionalni tip, izvorni kod za izračun prijavit će grešku:

```swift
amount += number
```

Upozorenje:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

To je zato što `number` sada može biti `nil`. Ako ga izravno uključimo u izračun, to postaje:

```swift
amount += nil
```

Očito je da se `nil` ne može zbrojiti s `amount`, što je neispravna operacija.

Zato pri korištenju opcionalnog tipa u izračunu najprije moramo izvršiti raspakiravanje.

Ovdje možemo koristiti `??` za pružanje zadane vrijednosti:

```swift
amount += number ?? 0
```

Kada je `number` `nil`, koristi se zadana vrijednost `0`; kada `number` ima vrijednost, koristi se stvarni uneseni podatak.

Na taj način osiguravamo ispravnost izračuna i ujedno ostvarujemo da je polje za unos prema zadanim postavkama prazno, pa korisnik više ne mora ručno brisati `0`.

## Prošireni kod

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
