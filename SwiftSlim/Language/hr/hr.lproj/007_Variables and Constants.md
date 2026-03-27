# Varijable i konstante

U ovoj lekciji uglavnom učimo varijable i konstante u Swiftu te upoznajemo neke uobičajene tipove podataka i osnovne operatore.

Ovaj je sadržaj najosnovnije znanje u programiranju i važan temelj za kasnije učenje SwiftUI-ja.

## Varijable i konstante u svakodnevnom životu

Varijable i konstante možemo razumjeti kroz stvari iz svakodnevnog života.

Varijable u svakodnevnom životu:

- sadržaj svake emisije na televiziji je različit
- vrijeme je svaki dan drugačije
- sat se mijenja svake sekunde

Zajednička osobina tih stvari je da se mijenjaju.

Ako bi televizor zauvijek prikazivao samo jednu sliku, vrijeme uvijek bilo sunčano, a kazaljke sata se nikad ne bi pomicale, tada bi te stvari bile konstante.

Jedno se može promijeniti, drugo ne.

## Razumijevanje varijabli i konstanti

U razvoju aplikacija često je potrebno da korisnik ispuni ili spremi neke informacije.

Na primjer:

- naziv računa
- datum rođenja
- kontakt podaci
- adresa

Te informacije bit će spremljene i prikazane.

Na primjer, korisnik unese naziv u aplikaciju:

```
FangJunyu
```

Taj naziv trebamo spremiti kako bismo ga mogli prikazati u aplikaciji.

Proces spremanja možemo jednostavno razumjeti kao stavljanje stvari u ladicu.

Kada spremamo naziv, to je kao da ga stavljamo u jednu ladicu.

Stvari koje treba spremiti mogu biti brojne, pa će i ladica biti mnogo. Da bismo znali što je u kojoj ladici, moramo svakoj ladici dati ime.

Na primjer:

```
name
```

U ovom primjeru `name` je naziv, a `FangJunyu` je spremljena informacija.

![Var](../../RESOURCE/007_var.png)

**U Swiftu, ako trebamo spremiti podatke, to moramo deklarirati pomoću varijable (`var`) ili konstante (`let`).**

Budući da se ime obično može mijenjati, trebali bismo koristiti varijablu.

```swift
var name = "FangJunyu"
```

Ovdje deklariramo varijablu nazvanu `name`, čiji je tip `String`, a vrijednost `"FangJunyu"`.

### Razlika između varijabli i konstanti

Varijable se deklariraju pomoću `var`:

```swift
var
```

Konstante se deklariraju pomoću `let`:

```swift
let
```

Na primjer:

```swift
var name = "FangJunyu"
let id = 123456
```

Ako je nešto deklarirano kao varijabla, vrijednost se može mijenjati; ako je deklarirano kao konstanta, kasnije se više ne može promijeniti.

Zato je glavna razlika između varijabli i konstanti sljedeća: dopušta li se promjena vrijednosti.

### Mijenjanje konstante

Ako kod pokuša promijeniti vrijednost konstante:

```swift
let name = "Sam"
name = "Bob"
```

Swift će prijaviti da nije moguće dovršiti pridruživanje jer je to konstanta.

```
Cannot assign to property: 'name' is a 'let' constant
```

Ovaj mehanizam može pomoći programerima da spriječe slučajnu izmjenu nekih važnih podataka.

### Prikaz u SwiftUI-ju

Otvorite datoteku `ContentView.swift` i deklarirajte varijablu unutar `View`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Ovdje je deklarirana varijabla naziva `name`, a preko `Text` se prikazuje na sučelju.

Ako promijenimo sadržaj varijable:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Tekst prikazan u `Text` također će se promijeniti.

Na taj način možemo koristiti varijable za upravljanje sadržajem prikazanim na sučelju, bez potrebe da svaki put izravno mijenjamo tekst unutar `Text`.

Ako je tu informaciju potrebno dohvatiti negdje drugdje, možemo i proslijediti varijablu, što je isto kao da sadržaj iz “ladice” predamo na uporabu drugom mjestu.

### Položaj varijabli i konstanti u SwiftUI-ju

U SwiftUI-ju se varijable i konstante obično pišu izvan `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Naravno, mogu se pisati i unutar `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Međutim, između ta dva načina postoji važna razlika:

- Ako se varijable i konstante pišu unutar `body`, ponovno će se stvarati svaki put kada se prikaz ponovno izračuna.
- Ako se pišu izvan `body`, tada postoje kao svojstva strukture prikaza i struktura koda je jasnija.

Stoga se u stvarnom razvoju varijable i konstante obično pišu izvan `body`.

## Tipovi podataka

Varijable mogu spremati mnogo različitih vrsta podataka, a te se vrste nazivaju tipovima podataka.

Na primjer, ranije smo koristili `Text` za prikaz teksta:

```swift
Text("Hello, World")
```

Ovdje `"Hello, World"` pripada tipu string (`String`).

Stringovi se koriste za predstavljanje tekstualnog sadržaja, a u Swiftu moraju biti okruženi dvostrukim navodnicima `""`.

Na primjer:

```swift
var hello = "Hello, World"
```

Osim stringova, Swift ima i mnoge druge tipove podataka.

Četiri najčešća tipa u početnoj fazi su:

- `String`
- `Int`
- `Double`
- `Bool`

Ta četiri tipa mogu pokriti većinu osnovne obrade podataka.

**`String`**

`String` predstavlja tekstualni sadržaj, na primjer:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Stringovi se obično koriste za predstavljanje korisničkog imena, naslova i tekstualnog sadržaja.

**`Int`**

`Int` predstavlja cijele brojeve, odnosno brojeve bez decimalnog dijela.

Na primjer:

```swift
var age = 26
var count = 100
```

Cijeli se brojevi obično koriste za predstavljanje dobi, količine i brojanja.

**`Double`**

`Double` predstavlja brojeve s decimalnim dijelom.

Na primjer:

```swift
var weight = 74.5
var height = 185.0
```

U Swiftu se decimalni brojevi prema zadanim postavkama obično koriste kao `Double`.

Postoji i sličan tip `Float`, ali on može prikazati manji raspon vrijednosti, pa se u stvarnom razvoju `Double` češće koristi.

**`Bool`**

Tip `Bool` koristi se za predstavljanje dvaju stanja: `true` i `false`.

Na primjer:

```swift
var isShowAlert = true
var isLogin = false
```

Tip `Bool` često se koristi za uvjetne provjere. Na primjer, treba li prikazati upozorenje.

U situacijama u kojima postoje samo dva moguća rezultata, `Bool` je vrlo prikladan način predstavljanja.

### Prikaz u SwiftUI-ju

Kada prikazujemo tip `String`, možemo izravno koristiti `Text`:

```swift
Text(name)
```

Ali `Int`、`Double` i slični tipovi nisu stringovi, pa se ne mogu izravno koristiti kao dio tekstualnog sadržaja.

Ako trebamo prikazati te podatke u `Text`, možemo koristiti interpolaciju stringa (`String Interpolation`):

```swift
\()
```

Interpolacija stringa mora se pisati unutar sadržaja stringa i koristi `\()` za omotavanje varijable ili konstante.

Na primjer:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

U gornjem kodu `""` predstavlja string, a `\()` služi za umetanje varijabli ili konstanti u string.

Na primjer:

```swift
"DoubleNum: \(num * 2)"
```

Prikazani sadržaj bit će:

```swift
DoubleNum: 2
```

Na taj način možemo umetnuti varijable ili konstante u string i zatim ih prikazati pomoću `Text`.

Savjet: `\()` se može koristiti samo unutar stringa `""`.

## Operatori

Prilikom deklaracije varijabli ili konstanti možemo vidjeti zapis poput ovoga:

```swift
var num = 1
```

Ovdje se `=` naziva operator pridruživanja.

Njegova je uloga sljedeća: dodijeliti vrijednost s desne strane varijabli s lijeve strane.

U ovom primjeru vrijednost `1` dodijeljena je varijabli `num`.

Osim operatora pridruživanja, postoje i neki česti numerički operatori:

- `+`
- `-`
- `*`
- `/`

Kada izvodimo izračune nad brojevima, na primjer nad podacima tipa `Int` ili `Double`, koristimo te operatore.

Na primjer:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Nakon dovršenog izračuna rezultat će biti spremljen u varijablu.

## Sažetak

Varijable, konstante i operatori najosnovniji su koncepti u programiranju.

Pomoću varijabli i konstanti možemo spremati različite vrste podataka u program; pomoću tipova podataka možemo jasno odrediti vrstu podataka; pomoću operatora možemo izvoditi izračune i obrađivati podatke.

To je poput osnovnih alata programerskog svijeta. Ovladavanje tim znanjem postavlja čvrst temelj za kasnije učenje Swifta i SwiftUI-ja.
