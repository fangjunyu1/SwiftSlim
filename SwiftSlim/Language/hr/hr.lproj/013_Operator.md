# Operatori

U ovoj ćemo lekciji učiti Swift operatore (`Operators`).

Kada izvodimo izračune, usporedbe ili logičke procjene, moramo koristiti operatore. Te se operacije pojavljuju kroz sve faze izvođenja programa i predstavljaju jednu od najosnovnijih sposobnosti u programiranju.

```swift
let a = 100 * 8
```

Tijekom učenja programiranja mnogi primijete da ljudi s određenim matematičkim načinom razmišljanja često lakše razumiju programsku logiku. To je zato što se programiranje u svojoj suštini ne može odvojiti od “izračuna” i “procjene pravila”, a upravo su to osnovne uloge koje operatori preuzimaju.

U stvarnom razvoju operatori se ne koriste samo za jednostavne numeričke izračune, nego se široko primjenjuju i u raznim konkretnim scenarijima.

Na primjer, u igri sa slaganjem blokova, kada korisnik povuče jedan blok na određeno mjesto, potrebno je izračunati:

- koordinatni položaj bloka
- mjesta koja blok može popuniti
- je li ciljna pozicija dostupna

Ti procesi “izračun + procjena” u svojoj biti ovise upravo o operatorima.

![Block](../../Resource/013_block.png)

Učenje operatora nije samo učenje računanja s brojevima, nego i postavljanje temelja za kasniji raspored sučelja, obradu podataka i logiku interakcije.

## Način izvršavanja izračuna u SwiftUI-ju

U SwiftUI-ju se izračuni obično izvode tako da `Button` pokrene funkciju, a zatim se unutar te funkcije izvrši logika izračuna.

Na primjer:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Kada kliknemo gumb, `Console` će ispisati:

```
c: 20
```

U ovoj ćemo lekciji logiku izračuna dosljedno pisati unutar `func`, pokretati je pomoću gumba i koristiti `print` za ispis rezultata.

U kasnijim primjerima, radi pojednostavljenja prikaza koda, izravno ćemo označavati rezultate izračuna u kodu i više nećemo stalno ponavljati ispis preko `print`.

## Upravljanje ispisom u `Console`

Budući da svaki klik proizvodi informacije u izlazu, možete kliknuti gumb za čišćenje u donjem desnom kutu područja `Console` kako biste obrisali povijest zapisa i lakše vidjeli trenutačni rezultat.

![Console](../../Resource/013_console.png)

## Drugi način pisanja `Button`

Kada gumb izvršava samo jednu funkciju, može se koristiti sažetiji zapis:

```swift
Button(action: ) {
    // View
}
```

U ovom zapisu `action` određuje funkciju koju treba izvršiti kada se gumb klikne (funkcija bez parametara), a vitičaste zagrade `{}` definiraju prikaz gumba.

U kombinaciji s ranijom funkcijom `calculate`, to se može napisati ovako:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Kada kliknemo gumb, funkcija `calculate` izvršit će se izravno.

Zato je, kada je logika gumba jednostavna i poziva samo jednu funkciju, zapis pomoću `action` jasniji i više odgovara pravilima pisanja koda.

## Aritmetički operatori

Aritmetički operatori (`Arithmetic Operators`) koriste se za numeričke izračune:

- `+` zbrajanje
- `-` oduzimanje
- `*` množenje
- `/` dijeljenje
- `%` ostatak pri dijeljenju

Primjeri:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Važno je napomenuti da je Swift snažno tipiziran jezik i neće automatski miješati različite tipove podataka:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Kada su tipovi različiti, potrebno ih je ručno pretvoriti.

## Usporedbeni operatori

Usporedbeni operatori (`Comparison Operators`) koriste se za procjenu odnosa između dviju vrijednosti, a rezultat je `Bool`:

- `==` jednako
- `!=` nije jednako
- `>` veće od
- `<` manje od
- `>=` veće ili jednako
- `<=` manje ili jednako

Primjeri:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Usporedbeni operatori često se koriste u uvjetnim izrazima. Na primjer, u “vrtuljku citata” moramo kontrolirati da indeks ne prijeđe raspon polja:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Ako je `index` manji od `sayings.count - 1`, rezultat usporedbe je `true` i kod unutar `if` izraza će se izvršiti; ako je rezultat `false`, kod nakon toga neće se izvršiti.

## Logički operatori

Logički operatori (`Logical Operators`) koriste se za kombiniranje više uvjeta:

- `&&` i (`AND`)
- `||` ili (`OR`)
- `!` ne (`NOT`)

### `&&` i

Kada više uvjeta mora istodobno biti zadovoljeno, koristi se `&&`.

Na primjer:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

U ovom kodu postoje dva uvjeta: `age >= 18` i `age <= 100`.

Samo ako su oba uvjeta `true`, i `legalAge` će biti `true`; ako samo jedan uvjet nije zadovoljen, rezultat je `false`.

### `||` ili

Kada je dovoljno da bude zadovoljen samo jedan od više uvjeta, koristi se `||`.

Na primjer:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Ovaj kod znači da je dovoljno da vrijedi ili `money >= 50` ili `creditCard >= 50`, pa će `payAllowed` biti `true`.

Samo kada nijedan od uvjeta nije ispunjen, rezultat će biti `false`.

Na primjer, u scenariju plaćanja može se platiti gotovinom ili kreditnom karticom. Ako nijedno ne može pokriti plaćanje, tada plaćanje ne uspijeva.

### `!` ne

`!` je logički operator negacije (`NOT`) i koristi se za obrtanje `Bool` vrijednosti.

Možemo ga jednostavno razumjeti ovako: `!` pretvara `true` u `false`, a `false` u `true`.

Na primjer:

```swift
let allowed = true
let result = !allowed   // false
```

Ovdje `!allowed` znači da se vrijednost `allowed` obrće.

Važno je primijetiti da su `!` i `!=` dva različita operatora: `!` negira `Bool` vrijednost, dok je `!=` usporedbeni operator koji vraća `Bool`.

## Operator pridruživanja

Operatori pridruživanja (`Assignment Operators`) koriste se za dodjeljivanje vrijednosti ili ažuriranje varijabli:

- `=` pridruživanje

I u deklaraciji varijable i tijekom izračuna sudjeluje pridruživanje:

```swift
let a = 5
```

Ovaj kod znači da je vrijednost `5` pridružena varijabli `a`.

### Složeni operatori pridruživanja

U stvarnom razvoju, osim osnovnih operatora pridruživanja, često se koriste i “složeni operatori pridruživanja”, koji izravno izračunavaju novu vrijednost na temelju postojeće i zatim je ažuriraju:

- `+=`
- `-=`
- `*=`
- `/=`

U prethodnoj lekciji “brojač” već smo se ukratko upoznali sa složenim operatorima pridruživanja.

Na primjer, kada kliknemo gumb i želimo da se varijabla automatski poveća:

```swift
var num = 10
num += 5   // num = 15
```

Ovaj kod znači da se `num` zbroji s `5`, a zatim se rezultat ponovno dodijeli varijabli `num`.

Dakle, to je ekvivalentno ovome:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternarni operator

Ternarni operator (`Ternary Operator`) u Swiftu procjenjuje uvjet i vraća jedan od dvaju rezultata:

```swift
uvjet ? vrijednost1 : vrijednost2
```

Njegova je logika sljedeća: ako je uvjet `true`, vraća “vrijednost1”; ako je uvjet `false`, vraća “vrijednost2”.

Na primjer:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Ovaj kod će provjeriti vrijednost `showColor`: ako je `true`, vratit će `Color.blue` i pozadina će biti plava; ako je `false`, vratit će `Color.clear` i pozadina neće biti prikazana.

Savjet: `Color.clear` znači prozirnu boju (bez vidljivog sadržaja).

### Razlika u odnosu na `if-else`

Ternarni operator logički je ekvivalentan izrazu `if-else`.

Na primjer, gornji kod možemo zapisati i ovako:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logika izvršavanja potpuno je ista: kada je uvjet `true`, izvršava se prvi rezultat; kada je `false`, drugi rezultat.

U praksi je zapis ternarnog operatora sažetiji i prikladniji za izražavanje jednostavnih odluka tipa “jedno od dva”, osobito kada trebamo izravno vratiti neku vrijednost.

Pri izgradnji `View` prikaza u SwiftUI-ju ternarni je operator vrlo čest. Na primjer:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Takav zapis omogućuje da u jednoj liniji dinamički mijenjamo efekt prikaza ovisno o uvjetu.

## Operator raspona

Operatori raspona (`Range Operators`) koriste se za predstavljanje intervala:

- `...` zatvoreni raspon (uključuje oba kraja)
- `..<` poluotvoreni raspon (ne uključuje desnu granicu)

Na primjer:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Možemo to razumjeti ovako: `1...3` znači od `1` do `3`, uključujući `3`; `5..<8` znači od `5` do `8`, ali bez uključivanja `8`.

Prošireni oblici (samo za upoznavanje):

```
5...    // >= 5
...5    // <= 5
```

Takav zapis predstavlja “jednostrani raspon” i često se koristi u uvjetnim provjerama ili u podudaranju uzoraka.

Operatori raspona koristit će se kasnije pri učenju `for` petlji. Za sada ih možemo razumjeti kao jedan neprekinuti raspon brojčanih vrijednosti.

## Vježbanje operatora

U nastavku ćemo kroz nekoliko jednostavnih primjera uvježbati ulogu operatora u prikazima.

### 1. Izračun ukupnog broja vozila

Na primjer, kroz jedno raskrižje svaki dan prođe 500 vozila. Izračunajmo ukupan broj vozila u 30 dana.

Možemo koristiti aritmetički operator:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Proces izračuna ovdje je: 500 vozila dnevno, tijekom 30 dana ukupno `500 × 30`, pa na kraju dobivamo ukupan broj od 15000 vozila.

### 2. Procjena članstva u kupnji unutar aplikacije

Možemo procijeniti je li neka osoba član s kupnjom unutar aplikacije: sve dok ima ili trajno članstvo ili pretplatničko članstvo, smatra se članom.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

U ovom se kodu koristi operator `||` (`ili`): `lifeTime = false` znači da nema trajno članstvo; `subscription = true` znači da ima pretplatničko članstvo.

Budući da je dovoljno ispuniti samo jedan uvjet, `isMember` je `true`. Dakle, ta je osoba član s kupnjom unutar aplikacije.

## Sažetak

U Swiftu su operatori temelj za izračun podataka i logičke procjene. Kao što `Text` služi za prikaz sadržaja, operatori služe za obradu samih podataka.

Od najjednostavnijih numeričkih izračuna, preko složenih logičkih provjera, pa sve do kontrole stanja prikaza i izračuna rasporeda, operatori su neizostavni.

Kroz vježbanje u različitim scenarijima možemo se postupno upoznati i ovladati raznim vrstama operatora predstavljenima u ovoj lekciji, a to je važan temelj za kasnije učenje.

### Dodatno znanje - bitovni operatori

Osim toga, Swift nudi i jednu nižu razinu operatora — bitovne operatore (`Bitwise Operators`):

- `&` (bitovno I)
- `|` (bitovno ILI)
- `^` (bitovno isključivo ILI)
- `~` (bitovna negacija)
- `>>` (pomak udesno)
- `<<` (pomak ulijevo)

Na primjer:

```swift
let a = 6  // binary 110
let b = 3  // binary 011

print(a & b) // 2 (binary 010)
print(a | b) // 7 (binary 111)
print(a ^ b) // 5 (binary 101)
print(~a)    // -7 (negacija)
```

U Swiftu se cijeli brojevi predstavljaju u binarnom obliku pomoću komplementa dvojke, pa će nakon negacije rezultat biti odgovarajući negativan broj.

Bitovni operatori rade izravno nad binarnim zapisom i obično se koriste za obradu podataka na niskoj razini ili u scenarijima optimizacije performansi.

Za početnike su scenariji korištenja takvih operatora relativno rijetki, a u uobičajenom iOS ili SwiftUI razvoju također nisu česti, pa ih ovdje nećemo dublje objašnjavati.

Ako kasnije budete radili s nižerazinskom logikom ili optimizacijom performansi, tada ih možete dodatno proučiti i razumjeti.
