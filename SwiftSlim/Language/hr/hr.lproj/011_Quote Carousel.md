# Vrtuljak citata

U ovoj ćemo lekciji izraditi funkciju “vrtuljka citata” i dublje učiti osnovna Swift znanja poput polja (`Array`) i uvjetnih izraza (`if-else`).

Pokazat ćemo kako spremiti više citata i pomoću interakcije s gumbom ostvariti kružno prikazivanje citata.

![alt text](../../RESOURCE/011_word.png)

## Prikaz citata

Najprije trebamo u SwiftUI-ju prikazati jedan citat.

Najjednostavniji način je korištenje prikaza `Text`:

```swift
Text("Slow progress is still progress.")
```

Ovaj kod može prikazati samo jedan fiksni citat. Ako želimo prikazati više citata i omogućiti prebacivanje među njima, moramo ih spremiti.

Međutim, obična string varijabla može spremiti samo jedan citat:

```swift
let sayings = "Slow progress is still progress."
```

Ako trebamo spremiti više citata, moramo deklarirati jednu varijablu za svaki citat:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Ali u stvarnom razvoju ovakav pristup nije samo zamoran, nego zbog toga što je svaka varijabla neovisna ne možemo ostvariti fleksibilno prebacivanje vrtuljka.

Kako bismo lakše upravljali s više citata, trebamo koristiti podatkovnu strukturu koja ih sprema zajedno, a to je polje (`Array`).

Nakon korištenja polja, gornji kod može se zapisati ovako:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Savjet: u programskim pravilima imenovanja, naziv varijable polja koje pohranjuje više elemenata obično se piše u množini, kao što je `sayings`, kako bi se naglasilo da je riječ o zbirci.**

## Polje

U Swiftu je polje zbirka uređenih elemenata i označava se uglatim zagradama `[]`.

```swift
[]
```

Unutar polja može se nalaziti više elemenata istog tipa, a elementi su odvojeni engleskim zarezom `,`.

Na primjer:

```swift
[101, 102, 103, 104, 105]
```

Polje možemo jednostavno razumjeti kao kompoziciju vlaka:

![Array](../../RESOURCE/011_array1.png)

Cijeli vlak predstavlja objekt tog polja, a svaki je vagon poredan određenim redoslijedom.

### Indeks i pristup elementima

Budući da je polje uređeno, sustav može pronaći određeni element prema redoslijedu. Taj mehanizam pozicioniranja naziva se indeks (`Index`).

U Swiftu (kao i u većini programskih jezika) indeks polja počinje od `0`, a ne od `1`. To znači da prvi element u polju ima indeks `0`, drugi element `1` i tako dalje.

![Array](../../RESOURCE/011_array2.png)

Ako želimo pristupiti određenom elementu polja, dovoljno je iza naziva polja dodati uglate zagrade i u njih upisati indeks ciljanog elementa.

Na primjer:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Ako pokušamo pristupiti indeksu izvan valjanog raspona polja, pojavit će se problem “Index Out of Range”. Zato pri pristupu polju moramo paziti da je indeks unutar valjanog raspona.

**Izlazak izvan raspona indeksa**

Na primjer, kada polje ima samo 5 elemenata, valjani raspon indeksa je od `0` do `4`. Ako pokušamo pristupiti `sayings[5]`, program neće moći pronaći odgovarajući “vagon”, što će izazvati grešku “Index Out of Range” i rušenje aplikacije.

![Array](../../RESOURCE/011_array3.png)

### Operacije nad poljem

Polja ne podržavaju samo statičku definiciju, nego i dodavanje, brisanje i mijenjanje elemenata, kao i dobivanje duljine polja.

Savjet: ako trebamo mijenjati polje, moramo koristiti deklaraciju `var`, a ne konstantu `let`.

**1. Dodavanje elementa**

Metoda `append` može dodati element na kraj polja:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Brisanje elementa**

Pomoću metode `remove(at:)` možemo izbrisati određeni element iz polja:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Mijenjanje elementa**

Element polja možemo izravno promijeniti pomoću indeksa:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Brojanje elemenata**

Svojstvo `count` koristi se za dobivanje broja elemenata u polju:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Prikaz citata pomoću polja

Kako bismo prikazali više citata, možemo ih spremiti u polje, a zatim pristupati i prikazivati odgovarajući citat pomoću indeksa.

Najprije u `ContentView` stvorimo polje `sayings` za spremanje citata, a zatim u prikazu `Text` pomoću indeksa dohvatimo i prikažemo odgovarajući citat:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Ovdje `sayings[0]` označava prvi citat u polju.

Ako želimo prikazati drugi citat, dovoljno je promijeniti indeks unutar uglatih zagrada:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definiranje indeksa citata

Kako bismo postigli dinamičko prebacivanje citata, ne možemo indeks “zacementirati” izravno u `Text`.

Moramo stvoriti varijablu koja posebno sprema trenutačno prikazani indeks.

U SwiftUI-ju možemo koristiti `@State` za deklaraciju promjenjivog indeksa:

```swift
@State private var index = 0
```

SwiftUI će pratiti varijablu omotanu s `@State`, a kada se `index` promijeni, SwiftUI će ponovno iscrtati prikaz i prikazati odgovarajući citat.

Zatim koristimo `sayings[index]` za dinamičko dohvaćanje citata iz polja:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Kada se vrijednost `index` promijeni, `Text` će prikazati drugačiji citat.

### Korištenje gumba za upravljanje indeksom

Kako bismo upravljali promjenom citata, možemo koristiti `Button` za promjenu vrijednosti `index`. Svakim klikom na gumb, `index` će se automatski povećati za 1:

```swift
Button("Next") {
    index += 1
}
```

Kada kliknemo gumb, vrijednost `index` promijenit će se s `0` na `1`, što će izazvati osvježavanje prikaza, pa će `Text(sayings[index])` pročitati sljedeći citat.

Međutim, ovdje postoji jedan potencijalni problem: ako se gumb klikne više puta zaredom, `index` će narasti izvan raspona polja, što će uzrokovati grešku indeksa izvan raspona. Na primjer, kada `index` dosegne `5` (dok je valjani raspon indeksa polja od `0` do `4`), program će se srušiti.

Kako bismo spriječili izlazak indeksa polja iz raspona, trebamo dodati uvjetnu kontrolu i osigurati da `index` ne prijeđe granice polja. To možemo postići pomoću `if-else` izraza koji provjerava je li `index` manji od duljine polja.

## Uvjetna kontrola: `if-else` izraz

`if-else` izraz jedan je od najčešće korištenih uvjetnih grananja u Swiftu i koristi se za provjeru je li neki uvjet ispunjen te za izvođenje različitih blokova koda ovisno o rezultatu.

Osnovna struktura:

```swift
if condition {
    // Kod koji se izvršava kada je condition true
} else {
    // Kod koji se izvršava kada je condition false
}
```

U `if` izrazu uvjet `condition` je Boolean vrijednost (`Bool` tip), dakle može biti `true` ili `false`. Kada je uvjet `true`, izvršava se dio unutar `if`, a u suprotnom dio unutar `else`.

Na primjer:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

U ovom primjeru vrijednost `age` je `25`, a `if` provjerava vrijedi li `age > 18`. Ako je uvjet istinit, ispisat će `"Big Boy"`.

Ako dio `else` nije potreban, može se izostaviti:

```swift
if condition {
    // Kod koji se izvršava kada je condition true
}
```

### Korištenje uvjeta za kontrolu raspona indeksa

Kako bismo spriječili izlazak indeksa polja iz raspona, možemo koristiti `if` izraz da osiguramo da `index` ne prijeđe granice polja:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analiza logike: vrijednost `sayings.count` je `5` (ukupno 5 citata), pa je vrijednost `sayings.count - 1` jednaka `4`, što je ujedno i posljednji valjani indeks polja.

Kada je `index` manji od `4`, klik na gumb i povećanje za `1` potpuno je sigurno; kada `index` dosegne `4`, uvjet više nije zadovoljen i klik na gumb neće imati učinka.

Sada je kod već ostvario funkciju prebacivanja citata:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Kružni citati

Ako želimo da se nakon posljednjeg citata klikom ponovno prikaže prvi citat, kako bismo postigli kružno prikazivanje, to možemo ostvariti pomoću `else` dijela:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Kada kliknemo gumb i `index` dosegne posljednji element polja, `index` će se resetirati na `0` i citati će ponovno krenuti od početka.

## Optimizacija prikaza citata

Sada kada je logika vrtuljka citata gotova, možemo dodatno optimizirati sučelje da izgleda ljepše.

Potpuni kod:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

U ovom primjeru prikaz `Text` dobio je bijelu poluprozirnu pozadinu i zaobljene kutove, gumb koristi stil `.borderedProminent`, a `VStack` ima postavljenu pozadinsku sliku.

Dodatna napomena: kada koristimo modifikator `background()` za obradu slike kao pozadine, njegovo je zadano ponašanje pokušati ispuniti raspored prikaza što je više moguće. U mnogim situacijama može se prirodno proširiti i preko sigurnog područja (`Safe Area`).

Sada smo uspješno ostvarili prikaz vrtuljka citata.

![SwiftUI View](../../RESOURCE/011_word.png)

## Sažetak

Kroz ovu smo lekciju savladali kako koristiti polje za spremanje više citata i kako pomoću izraza `if` i `if-else` ostvariti vrtuljak citata.

Također smo upoznali osnovne operacije nad poljima, poput dodavanja, brisanja i mijenjanja elemenata, kao i način sprječavanja izlaska indeksa polja iz raspona.

Ova lekcija nije samo objasnila funkcionalnu realizaciju vrtuljka citata, nego je povezivanjem polja i uvjetnih izraza pomogla da ovladamo obradom podataka i kontrolom tijeka programa.

## Dodatno znanje - višestruka uvjetna provjera: `if-else if-else`

U stvarnom razvoju često treba obrađivati više uvjeta. Na primjer, u nekoj igri kada je broj bodova jednak `1`, pokreće se događaj A; kada je jednak `2`, pokreće se događaj B; kada je jednak `3`, pokreće se događaj C, i tako dalje.

Kada imamo više od dvije grane uvjeta, trebamo koristiti izraz `if-else if-else`.

Osnovna sintaksa:

```swift
if conditionA {
    // Kod koji se izvršava kada je conditionA true
} else if conditionB {
    // Kod koji se izvršava kada je conditionB true
} else if conditionC {
    // Kod koji se izvršava kada je conditionC true
} else {
    // Kod koji se izvršava kada nijedan uvjet nije ispunjen
}
```

U tom slučaju program redom provjerava uvjete i izvršava prvi uvjet koji je zadovoljen. Ako nijedan uvjet nije ispunjen, izvršava se kod iza `else`.

U vrtuljku citata također možemo koristiti `if-else if-else` za višestruku provjeru:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Kada je `index` `0`、`1`、`2` ili `3`, svaki klik na gumb izvršit će `index += 1`; kada je `index` `4` (posljednji element), `index` će se resetirati na `0`, čime se ostvaruje kružno prikazivanje.

Grana `else` služi kao zaštitna mjera kako bi se spriječile neispravne vrijednosti (na primjer kada je `index` greškom promijenjen).

Važno je primijetiti da se ovdje `==` koristi za provjeru “je li jednako”. Ako `if` izraz utvrdi da je `index` jednak nekom broju, vratit će `true` i izvršiti odgovarajući blok koda. Ako nije jednak, nastavit će s provjerom sljedećeg `if` uvjeta.

Takva višestruka provjera korisna je za izvršavanje različitog koda u različitim uvjetnim scenarijima.
