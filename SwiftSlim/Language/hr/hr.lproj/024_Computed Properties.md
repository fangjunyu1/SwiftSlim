# Izračunata svojstva

U ovoj lekciji uglavnom učimo izračunata svojstva.

Izračunata svojstva koriste se za izračun novog rezultata na temelju postojećih podataka. Mogu izračunavati brojčane vrijednosti, a mogu izračunavati i sadržaj koji treba prikazati u SwiftUI prikazima.

Na primjer:

```swift
let a = 10
let b = 20
let c = a + b
```

Ovdje `c` predstavlja rezultat zbrajanja `a` i `b`.

U običnom kodu ovakav način pisanja vrlo je čest.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Savjet: unutar događaja dodira za `Button` može se izvršavati običan Swift kod.

Međutim, ako sličan kod napišemo izravno u svojstvima SwiftUI prikaza, naići ćemo na problem.

Na primjer:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Ovaj kod će izazvati grešku.

Čini se da su `a` i `b` već napisani prije `c`, pa izgleda kao da se vrijednost `c` može izračunati.

Ali u deklaracijama svojstava strukture ovakav se zapis ne može izravno koristiti.

## Zašto c ne može izravno izračunati a + b

Zato što `a`, `b` i `c` nisu privremene konstante unutar događaja dodira gumba, nego svojstva unutar prikaza `ContentView`.

Unutar događaja dodira gumba ovaj kod može raditi normalno:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Zato što se nakon dodira gumba kod izvršava redom. Najprije se stvara `a`, zatim se stvara `b`, a na kraju se `c` izračunava pomoću `a + b`.

No pri deklariranju svojstava unutar prikaza situacija je drukčija:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Ovdje su `a`, `b` i `c` sva svojstva unutar prikaza `ContentView`.

Kada se stvara prikaz `ContentView`, Swift najprije mora pripremiti ta svojstva. Da bi postupak stvaranja bio siguran, Swift ne dopušta da zadana vrijednost jednog pohranjenog svojstva instance izravno čita druga svojstva iste instance.

Zato će ova linija izazvati grešku:

```swift
let c = a + b
```

Jednostavno to možemo razumjeti ovako: **pri deklariranju svojstava unutar prikaza ne možemo izravno koristiti jedno obično svojstvo za izračun drugog običnog svojstva.**

Svojstvo koje izravno pohranjuje vrijednost naziva se "pohranjeno svojstvo". Radi lakšeg razumijevanja, privremeno ga možemo shvatiti i kao obično svojstvo.

Na primjer:

```swift
let a = 10
```

`a` pohranjuje `10`.

```swift
let b = 20
```

`b` pohranjuje `20`.

Ali:

```swift
let c = a + b
```

Ovdje `c` nije izravno zapisana vrijednost, nego vrijednost koju želimo izračunati pomoću `a + b`.

Za takvu situaciju, kada "dobivamo rezultat iz postojećih podataka", prikladnije je koristiti izračunato svojstvo.

Možemo promijeniti ovako:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Ovdje je `c` izračunato svojstvo.

```swift
var c: Int {
    return a + b
}
```

To znači: **kada trebamo koristiti `c`, tada pročitaj `a` i `b` te vrati rezultat `a + b`.**

Na primjer:

```swift
Text("c: \(c)")
```

Kada `Text` prikazuje `c`, tek tada se pokreće izračun `c`.

## Što je izračunato svojstvo?

Izračunato svojstvo izgleda kao varijabla, ali samo ne pohranjuje podatke.

Na primjer:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Ovdje je `c` izračunato svojstvo.

Ono ne pohranjuje fiksnu vrijednost kao obično svojstvo, nego svaki put kada se `c` pročita, ponovno izvršava kod unutar `{}` i vraća rezultat izračuna.

Možemo ga razumjeti ovako:

```swift
var c: Int {
    return a + b
}
```

Kada trebamo koristiti `c`, izračuna se `a + b`.

Zato je izračunato svojstvo prikladno za ovu situaciju: **rezultat nije potrebno zasebno pohraniti jer se može izračunati iz postojećih podataka.**

## Osnovni zapis

Izračunato svojstvo obično sadrži tri dijela:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklariranje pomoću `var`

```swift
var c
```

Izračunato svojstvo mora se deklarirati pomoću `var`; ne može se koristiti `let`.

Zato što izračunato svojstvo nije fiksno pohranjena vrijednost, nego rezultat koji se dinamički izračunava svaki put kada se pročita.

### 2. Označavanje povratnog tipa

```swift
var c: Int
```

Izračunato svojstvo mora označiti svoj povratni tip.

Ovdje će `c` na kraju vratiti cijeli broj, pa je tip `Int`.

### 3. Korištenje {} za pisanje logike izračuna

```swift
{
    return a + b
}
```

Unutar `{}` piše se logika izračuna; ovdje se vraća `a + b`.

## Ključna riječ return

Izračunato svojstvo mora vratiti rezultat.

Na primjer:

```swift
var c: Int {
    return a + b
}
```

Ovdje `return` znači: vrati rezultat izračuna `a + b`.

Ako izračunato svojstvo sadrži samo jedan izraz koji izravno proizvodi rezultat, `return` se može izostaviti:

```swift
var c: Int {
    a + b
}
```

Međutim, ako izračunato svojstvo sadrži više linija koda, moramo koristiti `return` da jasno vratimo rezultat.

Na primjer:

```swift
var totalPriceText: String {
    let total = count * price
    return "Ukupno: \(total) $"
}
```

Ovdje je proces izračuna podijeljen u dva koraka.

Prvi korak, najprije izračunaj ukupnu cijenu:

```swift
let total = count * price
```

Drugi korak, spoji ukupnu cijenu u tekst i vrati je:

```swift
return "Ukupno: \(total) $"
```

Ako uklonimo `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Ukupno: \(total) $"
}
```

Ovaj kod će izazvati grešku.

Razlog je: **ovo izračunato svojstvo već sadrži više linija koda i Swift više ne može automatski odrediti koja je linija konačni rezultat za vraćanje.**

Zato, kada izračunato svojstvo ima samo jednu liniju rezultata, `return` se može izostaviti.

```swift
var c: Int {
    a + b
}
```

Kada izračunato svojstvo sadrži više linija koda, preporučuje se jasno napisati `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Ukupno: \(total) $"
}
```

## Razlika između izračunatog i običnog svojstva

Obično svojstvo pohranjuje podatke.

```swift
var c = 30
```

Ovdje `c` pohranjuje konkretnu vrijednost: `30`.

Izračunato svojstvo ne pohranjuje podatke.

```swift
var c: Int {
    a + b
}
```

Ovdje `c` ne pohranjuje `30`. Ono samo pruža način izračuna.

Kada se `c` pročita, Swift izvršava:

```swift
a + b
```

Zatim vraća rezultat izračuna.

Zato su izračunata svojstva prikladna za situacije u kojima se rezultat izračunava iz drugih podataka.

## body je također izračunato svojstvo

Nakon učenja izračunatih svojstava, možemo ponovno razumjeti jedan od najčešćih dijelova koda u SwiftUI-u:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ovdje je `body` također izračunato svojstvo.

Deklarirano je pomoću `var`:

```swift
var body
```

Ima povratni tip:

```swift
some View
```

Unutar njegovih `{}` vraća se sadržaj SwiftUI prikaza:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Zato `body` možemo razumjeti ovako: kada SwiftUI treba prikazati ovaj prikaz, pročita `body` i stvara sučelje prema sadržaju koji `body` vraća.

Ako napišemo `return`, možemo to razumjeti ovako:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Međutim, u SwiftUI-u obično izostavljamo `return` i pišemo izravno:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Kada se `@State` podaci promijene, SwiftUI ponovno čita `body` i ažurira sučelje prema novim podacima.

Na primjer:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("broj: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Nakon dodira gumba, `count` se mijenja.

```swift
count += 1
```

Nakon što se `count` promijeni, SwiftUI ponovno izračunava `body`, pa se i tekst u sučelju ažurira.

```swift
Text("broj: \(count)")
```

To je i razlog zašto se u SwiftUI-u sučelje može automatski osvježiti nakon promjene podataka.

### Ne preporučuje se pisati složene izračune u body

Budući da je `body` izračunato svojstvo, može se mnogo puta čitati i ponovno izračunavati.

Na primjer:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("broj: \(num)")
            Text("ime: \(name)")
        }
    }
}
```

Kada se `name` promijeni, SwiftUI ponovno izračunava `body`.

Tada se ponovno izvršava i kod unutar `body`, a `num` se također ponovno stvara.

```swift
let num = 10
```

`num` u ovom primjeru vrlo je jednostavan, pa utjecaj nije velik.

Ali ako se u `body` izvode složeni izračuni, poput filtriranja velike količine podataka, sortiranja, obrade slika i slično, to može utjecati na glatkoću sučelja.

Zato bi u SwiftUI-u `body` uglavnom trebao biti odgovoran za opis strukture sučelja.

Jednostavni privremeni podaci mogu se pisati unutar `body`.

Složeni izračuni mogu se staviti u izračunata svojstva izvan `body`, u metode ili u zasebnu obradu podataka.

## Primjer: količina i ukupna cijena

U nastavku ćemo razumjeti izračunata svojstva kroz jednostavan primjer.

Pretpostavimo da je jedinična cijena jedne mrkve 2 $, korisnik može dodirivati gumbe za promjenu kupljene količine, a sučelje treba prikazati ukupnu cijenu.

Način izračuna ukupne cijene:

```
količina * jedinična cijena
```

Ako za pohranu ukupne cijene koristimo običnu varijablu, to će biti pomalo nezgodno.

Zato što svaki put kada se količina promijeni, ukupnu cijenu treba ručno ažurirati.

Bolji način je koristiti izračunato svojstvo:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("cijena: \(price) $")
                Text("količina: \(count)")
                Text("ukupna cijena: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Rezultat prikaza:

![view](../../Resource/024_view.png)

U ovom primjeru:

```swift
@State private var count = 1
```

`count` predstavlja količinu mrkvi. Kada se gumb dodirne, `count` se mijenja.

```swift
private let price = 2
```

`price` predstavlja jediničnu cijenu mrkve. Ovdje je to fiksna vrijednost, pa se koristi `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` predstavlja ukupnu cijenu.

Ne treba se zasebno pohranjivati jer se ukupna cijena uvijek može izračunati pomoću `count * price`.

Kada je `count` `1`:

```swift
totalPrice = 1 * 2
```

Prikazani rezultat je:

```swift
ukupna cijena: 2 $
```

Nakon dodira gumba `+`, `count` postaje `2`.

U tom trenutku, kada se `totalPrice` ponovno pročita, ponovno se izračunava:

```swift
totalPrice = 2 * 2
```

Prikazani rezultat je:

```swift
ukupna cijena: 4 $
```

To je uloga izračunatog svojstva: dinamički izračunati novi rezultat iz postojećih podataka.

## Izračunata svojstva mogu se koristiti za provjere

Izračunata svojstva ne mogu samo izračunavati brojčane vrijednosti, nego mogu vraćati i rezultate provjera.

Na primjer, kada želimo da najmanja količina bude 1.

Kada je količina već 1, gumb `-` ne bi trebao dalje smanjivati.

Možemo dodati izračunato svojstvo:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Cijeli kod:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("cijena: \(price) $")
                Text("količina: \(count)")
                Text("ukupna cijena: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Rezultat prikaza:

![view](../../Resource/024_view1.png)

Ovdje:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Ovaj kod označava može li se trenutno nastaviti smanjivati.

Kada je `count` veći od `1`:

```swift
canDecrease == true
```

to znači da se može smanjivati.

Kada je `count` jednak `1`:

```swift
canDecrease == false
```

to znači da se više ne može nastaviti smanjivati.

### Uvjetna provjera u gumbu

U gumbu se koristi:

```swift
if canDecrease {
    count -= 1
}
```

Samo kada se `canDecrease` procijeni kao `true`, `count` se može smanjiti.

### Upravljanje bojom prednjeg plana prikaza

`canDecrease` se može koristiti i za upravljanje bojom prednjeg plana gumba:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ovdje se koristi ternarni operator:

```swift
canDecrease ? Color.primary : Color.gray
```

Značenje ovog koda je: ako je `canDecrease` `true`, za boju prednjeg plana koristi se `Color.primary`; ako je `canDecrease` `false`, koristi se `Color.gray`.

`Color.primary` je sustavna semantička boja koju pruža SwiftUI. Ona predstavlja glavnu boju teksta u trenutnom sučelju.

U svijetlom načinu `Color.primary` obično je blizu crne; u tamnom načinu `Color.primary` obično je blizu bijele.

Zato je prednost korištenja `Color.primary` to što se automatski prilagođava svijetlom i tamnom načinu.

### Upravljanje onemogućenim stanjem prikaza

`disabled` se koristi za upravljanje time je li prikaz u onemogućenom stanju:

```swift
.disabled(!canDecrease)
```

Kada je `disabled` `false`, prikaz se može dodirnuti.

Kada je `disabled` `true`, prikaz je onemogućen i ne može se dodirnuti.

Korištenje `canDecrease` kao uvjeta ovdje čini kod lakšim za razumijevanje.

Kada vidimo `canDecrease`, znamo da znači "može li se trenutno nastaviti smanjivati".

### Dodatno objašnjenje: zašto postoje dvije provjere?

U gumbu `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ovdje se koristi i `.disabled(!canDecrease)` i `if canDecrease` unutar gumba.

`.disabled(!canDecrease)` zadužen je za onemogućavanje gumba u sučelju, tako da ga korisnik ne može dodirnuti.

`if canDecrease` zadužen je za ponovnu provjeru prije izvršavanja koda. `count -= 1` izvršava se samo kada je smanjivanje dopušteno.

To je dvostruka zaštita. U stvarnom razvoju, ako je gumb već onemogućen, unutarnja provjera može se izostaviti. No u nastavnom primjeru ostaje kako bi uloga `canDecrease` bila jasnija.

## Sažetak

U ovoj lekciji uglavnom smo naučili izračunata svojstva.

Izračunato svojstvo ne pohranjuje vrijednost izravno. Umjesto toga, kada se pročita, izračunava rezultat iz postojećih podataka.

Na primjer:

```swift
var c: Int {
    a + b
}
```

Ovdje `c` nije potrebno zasebno pohraniti jer se može izračunati pomoću `a + b`.

Izračunato svojstvo mora se deklarirati pomoću `var` i mora označiti povratni tip.

```swift
var canDecrease: Bool {
    count > 1
}
```

Izračunata svojstva mogu vraćati ne samo brojčane vrijednosti, nego i rezultate provjera, tekstualni sadržaj, pa čak i sadržaj SwiftUI prikaza.

U ovoj lekciji naučili smo i `return`.

`return` znači vratiti rezultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Ukupno: \(total) $"
}
```

Ako izračunato svojstvo sadrži samo jedan izraz koji izravno proizvodi rezultat, `return` se može izostaviti.

```swift
var totalPrice: Int {
    count * price
}
```

Osim toga, upoznali smo i `Color.primary` i `disabled`.

`Color.primary` je sustavna semantička boja u SwiftUI-u. Automatski prilagođava izgled prema svijetlom i tamnom načinu.

```swift
.foregroundStyle(Color.primary)
```

`disabled` se koristi za upravljanje time je li prikaz onemogućen.

```swift
.disabled(true)
```

Znači onemogućeno, ne može se dodirnuti.

```swift
.disabled(false)
```

Znači dostupno, može se dodirnuti.

Zato su izračunata svojstva vrlo česta u SwiftUI-u. Mogu nam pomoći jasnije organizirati rezultate izračuna, uvjete provjere i prikazani sadržaj.
