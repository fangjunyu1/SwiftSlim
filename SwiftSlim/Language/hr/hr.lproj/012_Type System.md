# Sustav tipova

U prethodnim smo lekcijama već učili o varijablama i znamo da one mogu spremati podatke različitih tipova.

Na primjer:

```swift
var hello = "Hello, World"
```

Ovdje `hello` sprema jedan tekst, pa je njegov tip `String`.

U nastavku ćemo sustavno učiti pojam tipa (`Type`), eksplicitnu deklaraciju tipa i zaključivanje tipa, kako bismo dublje razumjeli prirodu varijabli.

## Što je tip

U Swiftu svaka vrijednost ima jasan tip. Tip određuje što ta vrijednost jest i što može raditi.

Na primjer:

- `42` je `Int` (cijeli broj)
- `"Hello"` je `String` (niz znakova)
- `true` je `Bool` (Booleova vrijednost)

One pripadaju različitim tipovima i imaju različite namjene.

## Uobičajeni osnovni tipovi u Swiftu

U početnoj fazi najčešći su sljedeći tipovi:

- `String`: niz znakova (tekst)
- `Int`: cijeli broj
- `Double`: broj s pomičnim zarezom (s decimalama, veća preciznost)
- `Bool`: Booleova vrijednost (`true/false`)

Osim toga postoji i `Float` (broj s pomičnim zarezom), ali s manjom preciznošću od `Double`, pa se obično koristi rjeđe; te `Character` (pojedinačni znak), na primjer `"A"`、`"!"` i drugi pojedinačni znakovi.

### Deklaracija tipa (eksplicitni tip)

U Swiftu pri deklaraciji varijable možemo ručno navesti tip:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Nakon naziva varijable dodajemo `: tip` kako bismo deklarirali tip varijable.

Zapis tipa za polja je `: [tip]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

U ovom kodu polje `scores` može spremati samo elemente tipa `Int`, a `tags` samo `String`.

Eksplicitna deklaracija tipa može učiniti namjeru koda jasnijom i u nekim situacijama spriječiti greške u zaključivanju tipa.

## Zaključivanje tipa

U mnogim slučajevima tip se ne mora eksplicitno deklarirati:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"] // [String]
```

To je zato što Swift prevoditelj automatski zaključuje tip na temelju “početne vrijednosti”.

## Eksplicitna deklaracija i zaključivanje tipa

U prethodnim lekcijama nismo uvodili eksplicitne deklaracije, na primjer:

```swift
var age: Int = 18
```

Nego smo prednost dali zaključivanju tipa:

```swift
var age = 18
```

U ovom su primjeru ta dva zapisa ekvivalentna: `age` će u oba slučaja biti određena kao tip `Int`. U usporedbi s tim, zaključivanje tipa je sažetiji zapis.

Razlog zašto se u ranijoj fazi nije naglašavala eksplicitna deklaracija jest taj što zaključivanje tipa smanjuje količinu dodatnih informacija u kodu, pa je početnicima lakše razumjeti sadržaj.

## Zašto su tipovi potrebni

Swift je snažno tipiziran jezik (`Strongly Typed Language`).

To znači: kada se tip varijable jednom odredi, više se ne može proizvoljno mijenjati.

Na primjer:

```swift
var age: Int = 18

age = 20    // Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Prvi `20` je tipa `Int`, pa se može dodijeliti varijabli `age`; drugi `"20"` je tipa `String` i ne odgovara tipu `Int`, pa će prijaviti grešku.

`nums` je polje tipa `[Int]` i može spremati samo cijele brojeve, ne i stringove.

Tipovi mogu ograničiti način upotrebe podataka i otkriti neusklađenost tipova još u fazi prevođenja, čime se smanjuju bugovi nastali zbog zabune oko tipova te povećavaju stabilnost i održivost koda.

## Kada se tip mora eksplicitno deklarirati

Iako Swift može automatski zaključiti tipove, u nekim ih situacijama prevoditelj ne može zaključiti ili ih zaključi pogrešno. Tada tip moramo deklarirati ručno.

**1. Prazno polje**

Prilikom stvaranja praznog polja tip se mora eksplicitno deklarirati:

```swift
var nums: [Int] = []
```

Ako se tip ne napiše:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Prevoditelj ne može iz praznog polja zaključiti tip elemenata, pa nastaje greška pri prevođenju.

**2. Izbjegavanje pogrešnog zaključivanja**

```swift
var value = 10   // Int
```

U ovom primjeru, iako `10` može predstavljati i decimalni broj (`Double`), budući da nema decimalne točke, prevoditelj će ga prema zadanim postavkama zaključiti kao `Int`.

Ako želimo da `value` predstavlja decimalni broj, moramo eksplicitno deklarirati tip:

```swift
var value: Double = 10   // Double
```

Kada rezultat zaključivanja tipa nije u skladu s očekivanjima, treba koristiti eksplicitnu deklaraciju tipa ili prilagoditi oblik literala kako bi tip bio ispravan.

**3. Prilagođeni tipovi**

Kasnije ćemo učiti i prilagođene tipove. Kada koristimo prilagođene tipove, tip se također obično mora eksplicitno deklarirati:

```swift
var info: GameInfo
var users: [User] = []
```

Razlog je isti kao kod praznog polja: prevoditelj ne može automatski zaključiti tip iz prazne vrijednosti.

## Pretvorba tipova

U Swiftu se različiti tipovi ne mogu automatski pretvarati jedan u drugi, nego se pretvorba mora obaviti ručno.

Na primjer, zbrajanje dvaju brojeva različitih tipova:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b    // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

U ovom kodu `a` je tipa `Int`, a `b` tipa `Double`. Budući da su tipovi različiti, ne mogu se izravno koristiti u istoj operaciji.

Prije izvođenja računa jedan od njih treba pretvoriti u isti tip:

```swift
var result = Double(a) + b
```

Ovaj kod znači da se `a` tipa `Int` pretvara u `Double`, a zatim zbraja s `b`, a rezultat se dodjeljuje `result`.

Važno je primijetiti da pretvorba tipa ne mijenja izvorni tip varijable. Na primjer, `Double(a)` neće promijeniti tip `a` iz `Int`, nego će stvoriti novu vrijednost tipa `Double` koja sudjeluje u izračunu.

I drugi tipovi mogu se pretvarati na sličan način, odnosno korištenjem ciljnog tipa + `()` i prosljeđivanjem vrijednosti koja se pretvara. Na primjer:

```
Int()、Double()、String()
```

Primjer:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Važno je primijetiti da se ne mogu sve pretvorbe izvesti bez posljedica. Na primjer, pri pretvorbi `Double → Int` decimalni dio se jednostavno odbacuje, bez zaokruživanja.

## Alias tipa

U Swiftu postojećem tipu možemo dati i novo ime, kako bi značenje koda bilo jasnije:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Ovdje je `UserID` u biti i dalje `Int`; tip se nije promijenio, samo je naziv postao smisleniji.

U projektima s puno koda i složenijim tipovima alias tipa može poboljšati čitljivost.

## Primjer tipova

U nastavku ćemo kroz jednostavan primjer pokazati kakvu ulogu tipovi imaju u stvarnom razvoju.

### Stvaranje varijable

Najprije stvaramo varijablu `age`:

```swift
var age = 20
```

Budući da tu varijablu trebamo prikazivati i mijenjati u SwiftUI-ju, moramo je deklarirati pomoću `@State`:

```swift
@State private var age = 20
```

`private` smo spomenuli ranije; znači da se ova varijabla može koristiti samo u trenutačnom prikazu, a kasnije ćemo to detaljnije učiti.

### Prikaz podataka u SwiftUI-ju

Prikaz varijable `age` u SwiftUI-ju:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Sada će prikaz pokazivati:

```swift
age: 20
```

### Mijenjanje podataka

Zatim dodajemo dva gumba za promjenu `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Rezultat pokretanja

Kada kliknemo `changeAge1`, `age` će dobiti vrijednost `18`:

```swift
age = 18
```

Budući da je `18` tipa `Int`, što odgovara tipu `age`, dodjela uspijeva.

Kod `changeAge2` pojavit će se greška:

```swift
age = "18"
```

Poruka o grešci:

```
Cannot assign value of type 'String' to type 'Int'
```

To je zato što je `"18"` tipa `String` (stringovi moraju biti okruženi `""`), dok je `age` tipa `Int`, pa zbog neusklađenosti tipova dodjela nije moguća.

### Zašto dolazi do greške?

Ključ je u ovoj liniji koda:

```swift
@State private var age = 20   // Int
```

Iako tip nije eksplicitno deklariran, budući da je početna vrijednost `20` tipa `Int`, prevoditelj će `age` automatski zaključiti kao tip `Int`.

Jednom kada je tip određen, više mu se ne može dodijeliti drugačiji tip.

Štoviše, gumb `changeAge2` ne “pada pri izvođenju”, nego prijavljuje grešku već u fazi prevođenja, pa kod uopće ne može proći kompilaciju.

To je također jedna od prednosti snažno tipiziranog Swifta: problemi s tipovima mogu se otkriti unaprijed, već tijekom pisanja koda.

### Ispravan zapis

Nakon uklanjanja pogrešnog koda:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Klikom na gumb `changeAge1`, prikaz će se ažurirati na:

```
age: 18
```

### Eksplicitna deklaracija tipa (opcionalno)

Tip se može jasno navesti i pri definiranju:

```swift
@State private var age: Int = 20
```

Takav zapis čini tip još jasnijim, ali u jednostavnijim situacijama nije nužan.

## Sažetak

Ova je lekcija uglavnom govorila o Swift sustavu tipova i njegovoj ulozi u stvarnom razvoju.

U Swiftu svaka vrijednost ima jasan tip. Tip određuje značenje podataka i operacije u kojima mogu sudjelovati.

Swift je snažno tipiziran. Kada se tip varijable jednom odredi, više joj se ne može dodijeliti drugačiji tip. Ovo ograničenje omogućuje otkrivanje grešaka već u fazi kompilacije, čime se smanjuju problemi u izvođenju i povećava sigurnost koda.

Tip varijable može se automatski zaključiti iz početne vrijednosti ili se može eksplicitno deklarirati. U nekim situacijama (kao što su prazna polja, pogrešno zaključivanje tipa ili prilagođeni tipovi) prevoditelj ne može ispravno zaključiti tip, pa ga tada moramo eksplicitno navesti.

Različiti se tipovi ne mogu automatski pretvarati jedan u drugi, nego se mora koristiti eksplicitna pretvorba poput `Int()`、`Double()`、`String()`.

Tipovi također podržavaju alijase, a posebno u složenijim projektima aliasi mogu poboljšati čitljivost.

Tip nije samo oznaka podataka, nego i mehanizam ograničenja koji osigurava da se podaci koriste sigurno, jasno i kontrolirano.

## Dodatno znanje - opcionalni tip

Pri pretvorbi tipova neke operacije mogu zakazati.

Na primjer, pretvaranje `String` u `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Ovdje `Double(input)` ne vraća `Double`, nego:

```
Double?
```

To je opcionalni tip (`Optional`).

### Zašto se vraća opcionalni tip?

Zato što sadržaj stringa nije siguran. `"3.14"` se može pretvoriti u `Double`, ali `"Hello"` ne može.

Drugim riječima, ta operacija može uspjeti, ali može i zakazati.

Zato Swift koristi opcionalni tip kako bi predstavio tu nesigurnost.

### Što je opcionalni tip?

Opcionalni tip znači: vrijednost može postojati, ali i ne mora.

Na primjer:

```
Double?
```

Ovaj tip znači da će se, ako vrijednost postoji, pri ispisu prikazati `Optional(...)`, a ako ne postoji, rezultat će biti `nil`.

Važno je napomenuti da `nil` znači "nema vrijednosti", a ne `0` ili prazan string.

### Primjer

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Izlaz:

```
pi:Optional(3.14)
```

To znači da je string uspješno pretvoren u `Double` i dobivena je vrijednost `3.14`, ali budući da je tip `Double?`, vrijednost je omotana u `Optional`.

Ako pretvorba ne uspije:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Izlaz:

```
pi: nil
```

Budući da se `"Hello"` ne može pretvoriti u tip `Double`, pretvorba ne uspijeva i vraća `nil`.

### Što je `Optional(...)`?

Kada opcionalni tip ispisujemo izravno:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift će prikazati njegov “opis za debug”:

```
Optional(3.14)
```

To nije stvarni dio podataka, nego samo pokazuje da je trenutačna vrijednost “opcionalni tip” i da unutar sebe sadrži stvarnu vrijednost.

### Raspakiravanje opcionalnog tipa

U stvarnom razvoju obično trebamo iz opcionalnog tipa izvući stvarnu vrijednost. Taj se proces naziva raspakiravanje (`Unwrapping`).

Jedan čest način je korištenje `??` za pružanje zadane vrijednosti:

```
??
```

To se naziva operator spajanja s `nil` (`Nil-Coalescing Operator`).

Na primjer:

```swift
name ?? "FangJunyu"
```

Ovaj kod znači: ako `name` ima vrijednost, vrati je; ako je `nil`, koristi zadanu vrijednost `"FangJunyu"`.

Važno je napomenuti da tip zadane vrijednosti mora odgovarati tipu opcionalne vrijednosti.

### Korištenje `??` za zadanu vrijednost

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

Izlaz:

```
pi: 30
```

Kada se `input` pretvori u `Double`, pretvorba uspijeva i ispisuje se vrijednost. Ako pretvorba ne uspije, ispisuje se zadana vrijednost iza `??`.

Ako pretvorba ne uspije:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Izlaz:

```
pi: 10
```

Ovdje se `input` ne može pretvoriti u `Double`, pa pretvorba vraća `nil`, a `??` daje zadanu vrijednost.

Opcionalni tip koristi se za predstavljanje situacija u kojima “vrijednost može postojati, ali i ne mora”.

U operacijama koje mogu zakazati, kao što je pretvorba tipa, Swift vraća opcionalni tip kako bi osigurao sigurnost programa.

Kada trebamo koristiti sadržanu vrijednost, možemo pomoću `??` pružiti zadanu vrijednost, tako da i u slučaju `nil` i dalje dobijemo razuman rezultat.
