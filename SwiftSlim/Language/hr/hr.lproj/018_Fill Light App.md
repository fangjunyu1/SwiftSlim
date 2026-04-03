# Fill Light aplikacija

U ovoj lekciji izradit ćemo vrlo zanimljivu fill light aplikaciju. Kada padne noć, možemo prikazivati različite boje na zaslonu telefona i koristiti ga kao jednostavno fill light svjetlo.

Ova fill light aplikacija može mijenjati boje dodirom zaslona, a također može prilagođavati svjetlinu pomoću klizača.

U ovom primjeru naučit ćemo kako koristiti `brightness` za prilagodbu svjetline prikaza, `onTapGesture` za dodavanje geste dodira prikazu te kontrolu `Slider`.

Rezultat:

![Color](../../Resource/018_color.png)

## Prikaz boje

Prvo ćemo omogućiti da prikaz pokaže jednu boju.

U SwiftUI-ju `Color` ne predstavlja samo boju, već se može prikazati i kao prikaz:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Ovdje `Color.red` predstavlja crveni prikaz. `.ignoresSafeArea()` čini da prikaz boje ispuni cijeli zaslon, pa više izgleda kao pravi fill light efekt.

Rezultat:

![Color](../../Resource/018_color1.png)

### Polje boja i indeks

Trenutno je prikazana samo jedna boja. Ali fill light obično nema samo jednu boju. Može prikazivati i plavu, žutu, ljubičastu, bijelu i druge boje.

Želimo mijenjati različite boje kada se dodirne zaslon. Te boje možemo staviti u polje radi zajedničkog upravljanja:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Polje je prikladno za spremanje "skupine podataka iste vrste". Ovdje je svaki element u polju `Color`.

Ako želimo prikazati određenu boju, možemo koristiti indeks:

```swift
colors[0]
```

To znači čitanje boje na indeksu `0` u polju, odnosno prve boje.

Sada se kod može napisati ovako:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Na taj način zaslon prikazuje prvu boju u polju, a to je crvena.

### Korištenje indeksa za upravljanje bojom

Ako trebamo mijenjati različite boje, potreban nam je varijabla za upravljanje indeksom umjesto da indeks upišemo fiksno.

Možemo koristiti `@State` za deklariranje varijable koja sprema indeks:

```swift
@State private var index = 0
```

Ovdje `index` predstavlja indeks trenutačne boje.

Kada se `index` promijeni, SwiftUI ponovno izračunava sučelje i ažurira prikazani sadržaj.

Zatim izvorni `colors[0]` mijenjamo u:

```swift
colors[index]
```

Na taj način boja prikazana u prikazu određena je pomoću `index`.

Sada kod postaje:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Kad se `index` promijeni, `colors[index]` će također prikazati drugu boju.

Na primjer:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Važno je napomenuti da `index` ne može prijeći najveći indeks polja, inače će se dogoditi pogreška izlaska iz raspona.

## Gesta dodira

Sada možemo prikazivati različite boje prema `index`, ali ih još ne možemo mijenjati dodirom.

U prethodnoj lekciji "Vrtuljak citata" koristili smo `Button` za upravljanje promjenom citata.

No ovaj put želimo "dodirnuti cijelo područje boje" kako bismo promijenili boju, pa je `onTapGesture` prikladniji.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Kada dodirnemo prikaz boje, izvršit će se ovaj kod:

```swift
index += 1
```

To znači povećati `index` za `1`. Nakon što se indeks poveća, `colors[index]` će prikazati sljedeću boju u polju.

### `onTapGesture`

`onTapGesture` je modifikator geste koji dodaje radnju dodira prikazu.

Osnovna upotreba:

```swift
.onTapGesture {
    // code
}
```

Na primjer:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Kada se ovaj crveni prikaz dodirne, kod unutar vitičastih zagrada se izvršava i u konzoli se ispisuje:

```swift
Click color
```

Pomoću `onTapGesture` možemo odrediti što će se dogoditi nakon dodira prikaza.

### Razlika u odnosu na `Button`

Ranije smo naučili o prikazu `Button`. I `Button` i `onTapGesture` mogu obrađivati radnje dodira, ali njihovi scenariji upotrebe nisu potpuno isti.

`onTapGesture` je prikladniji za "dodavanje mogućnosti dodira postojećem prikazu", kao što su `Color`, `Image`, `Text` ili neki drugi obični prikaz.

`Button` je prikladniji kada želimo predstaviti jasan gumb, kao što su "Potvrdi", "Pošalji" ili "Izbriši".

U ovoj fill light aplikaciji želimo da funkcija promjene boje bude jednostavnija. Dodir cijelog područja boje mijenja boju, pa je `onTapGesture` ovdje dobar izbor.

## Problem s indeksom

Sada možemo dodirnuti zaslon kako bismo mijenjali različite boje.

No ovdje postoji jedan važan problem: **indeks može izaći izvan raspona polja**.

Na primjer:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Ako nastavimo dodirivati zaslon, `index` će na kraju postati `4`, i tada će se pojaviti pogreška "index out of range".

To je zato što polje `colors` ima `4` elementa, ali indeksiranje počinje od `0`, pa je valjani raspon indeksa `0 - 3`, a ne `4`.

Ako pristupimo `colors[4]`, pojavit će se pogreška "index out of range".

U trenutačnom kodu svaki dodir povećava `index` za `1`. Ako to ne obradimo, na kraju će sigurno prijeći valjani raspon.

Zato trebamo provjeriti indeks kada se zaslon dodirne: ako je već na posljednjoj boji, vraćamo se na prvu boju; inače nastavljamo dodavati `1`.

To možemo napraviti pomoću `if` naredbe:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

U ovom kodu `colors.count` znači broj elemenata u polju.

U trenutačnom polju nalaze se 4 boje, pa:

```swift
colors.count // 4
```

Ali najveći indeks nije `4`, nego `3`, jer indeksiranje počinje od `0`.

Zato se posljednji indeks treba zapisati ovako:

```swift
colors.count - 1
```

Odnosno:

```swift
4 - 1 = 3
```

Ta logika znači: ako trenutačni indeks već odgovara posljednjoj boji, vrati indeks na `0`; inače ga povećaj za `1`.

Na taj način boje se mogu mijenjati u krug.

### Optimiziranje logike indeksa

Ako želimo da kod bude sažetiji, možemo koristiti i ternarni operator:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Ovaj kod znači: ako je `index == colors.count - 1` točno, vrati `0`. U suprotnom vrati `index + 1`.

Na kraju rezultat ponovno dodjeljujemo varijabli `index`.

Sada možemo postići efekt mijenjanja boja.

Cijeli kod:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Sada možemo dodirivati zaslon i mijenjati različite boje. Osnovna fill light aplikacija je gotova.

## Prikaz naziva boje

Možemo dodati još jednu skupinu tekstova koja odgovara bojama, tako da se pri promjeni boje na zaslonu prikaže i naziv trenutačne boje.

Na primjer:

- Crvena prikazuje `Red`
- Plava prikazuje `Blue`
- Žuta prikazuje `Yellow`
- Ljubičasta prikazuje `Purple`

I ovdje možemo koristiti polje za spremanje naziva boja:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Redoslijed tekstova u ovom polju mora točno odgovarati redoslijedu boja u polju boja.

Zatim možemo koristiti `Text` za prikaz naziva boje za trenutačni indeks:

```swift
Text(colorsName[index])
```

`Text` prikazuje naziv trenutačne boje prema `index`.

Koristite modifikatore za poboljšanje izgleda `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

To omogućuje da se `Text` prikaže u bijeloj boji, veličinom naslova i podebljanim fontom.

Sada imamo `Color` prikaz preko cijelog zaslona. Ako želimo da se `Text` prikazuje preko `Color` prikaza, trebamo koristiti `ZStack` raspored za slaganje jednog preko drugog.

```swift
ZStack {
    Color
    Text
}
```

Tako kod postaje:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Na taj način pozadina je prikaz boje, a preko nje je složen tekstualni prikaz.

Rezultat:

![Color](../../Resource/018_color2.png)

Važno je primijetiti da se u `ZStack`-u prikazi napisani kasnije obično pojavljuju ispred. Ako se `Text` napiše prije `Color`, kasnije napisani `Color` prikaz može prekriti `Text`.

## Upravljanje svjetlinom

Sada možemo mijenjati različite boje, ali fill light ima još jednu važnu funkciju: **prilagodbu svjetline**.

U SwiftUI-ju možemo koristiti modifikator `brightness` za prilagodbu svjetline prikaza.

Na primjer:

```swift
.brightness(1)
```

Možemo napisati:

```swift
colors[index]
    .brightness(0.5)
```

To trenutačnu boju čini svjetlijom i bližom efektu fill lighta.

Raspon svjetline je `0 - 1`. `0` znači zadržati izvornu boju, a što je vrijednost bliže `1`, to boja postaje svjetlija. `1` znači najsvjetliji bijeli rezultat.

Iako možemo upravljati `brightness` u kodu, korisnik ga još uvijek ne može izravno podešavati sam.

Zato trebamo dodati kontrolu koju možemo povlačiti: `Slider`.

## `Slider` prikaz

U SwiftUI-ju, `Slider` je kontrola koja se koristi za odabir vrijednosti unutar određenog raspona. Apple ga opisuje kao "kontrolu za odabir vrijednosti iz ograničenog linearnog raspona".

Osnovna upotreba:

```swift
Slider(value: $value, in: 0...1)
```

Objašnjenje parametara:

1. `value: $value`: `Slider` mora biti povezan s varijablom.

    Kada se klizač povlači, vrijednost varijable se također mijenja. Obrnuto, ako se varijabla promijeni, i klizač se ažurira.

    To je vrlo slično `TextField`-u koji smo ranije učili. Oboje "povezuju kontrolu s varijablom".

    Povezana varijabla treba imati simbol `$` ispred sebe kako bi predstavljala binding.

2. `in: 0...1`: Ovaj parametar predstavlja raspon vrijednosti klizača.

    Ovdje `0...1` znači da je najmanja vrijednost `0`, a najveća `1`.

    Kada se klizač povuče sasvim ulijevo, povezana varijabla je blizu `0`; kada se povuče sasvim udesno, blizu je `1`.

Na primjer:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` je povezan s varijablom `value`. Kada se klizač povlači, i vrijednost varijable `value` se mijenja u isto vrijeme.

Izgled:

![Slider](../../Resource/018_slider.png)

Kada se `Slider` pomakne ulijevo, povezana vrijednost `value` postaje `0`. Kada se pomakne udesno, postaje `1`.

### Raspon vrijednosti

Raspon vrijednosti `Slider`-a nije fiksan. Može se zapisati i ovako:

```swift
0...100
```

ili kao neki drugi raspon.

Ali u ovoj fill light aplikaciji trebamo upravljati svjetlinom, pa je `0...1` najprikladniji izbor.

## Korištenje `Slider`-a za upravljanje svjetlinom

Sada trebamo povezati `Slider` s `brightness`.

Najprije izradite varijablu za spremanje vrijednosti svjetline:

```swift
@State private var slider = 0.0
```

Ovdje je `0.0` vrijednost tipa `Double`.

Budući da se `Slider` obično povezuje s numeričkim tipom, a ovdje želimo da se mijenja kontinuirano, `Double` je prikladniji. Osim toga, `brightness` može prihvatiti samo `Double` vrijednost.

Zatim proslijedite tu vrijednost u `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Kada je `slider == 0`, boja ostaje u svom zadanom stanju. Što je `slider` bliže `1`, to boja izgleda svjetlije.

### Dodavanje kontrole `Slider`

Zatim dodajte kontrolu `Slider` za mijenjanje te varijable:

```swift
Slider(value: $slider, in: 0...1)
```

Kada se klizač promijeni, mijenja se i vrijednost `slider`, a `brightness(slider)` istodobno ažurira svjetlinu.

Ovo je vrlo tipičan primjer toga kako "varijable upravljaju prikazom" u SwiftUI-ju.

### Prilagodba izgleda `Slider`-a

Prema zadanim postavkama, `Slider` koristi dostupnu širinu.

Možemo mu dati fiksnu širinu:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Zatim dodajmo još nekoliko modifikatora kako bi se bolje vidio:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

To klizaču daje bijelu pozadinu i zaobljene kutove, pa se jasnije ističe na `Color` prikazu.

Na kraju ga postavite na dno zaslona.

Budući da smo već koristili `ZStack`, možemo unutar njega staviti `VStack` i upotrijebiti `Spacer()` kako bismo gurnuli `Slider` prema dnu.

## Cijeli kod

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Rezultat:

![Color](../../Resource/018_color.png)

## Sažetak

Koristeći znanje koje smo ranije naučili, zajedno s osnovnim pojmovima kao što su boje i polja, izradili smo vrlo zanimljivu fill light aplikaciju.

Kroz ovu fill light aplikaciju naučili smo koristiti `brightness` za prilagodbu svjetline, `onTapGesture` za dodavanje radnji dodira prikazima i kontrolu `Slider`.

Dodali smo `onTapGesture` prikazu `Color` kako bismo mijenjali boje. Također smo koristili kontrolu `Slider` za promjenu varijable koja upravlja `brightness`, što je još jedan primjer da "varijable pokreću prikaz".

Također smo ponovili ternarni operator, koristili `ZStack` za slaganje prikaza jedan preko drugoga i koristili polja za upravljanje skupinom podataka iste vrste. To pomaže produbiti naše razumijevanje polja i indeksa, uključujući praktičan problem izbjegavanja pogrešaka izlaska indeksa iz raspona.

Iako ovaj primjer nije složen, povezuje mnoge osnovne ideje koje smo ranije naučili. Kada se spoje u mali stvarni projekt, postaje lakše razumjeti čemu svaki pojam služi.

### Stvarni scenarij upotrebe

Zamislite da stavite stari iPhone na stol i koristite fill light aplikaciju koju ste sami izradili za upravljanje bojom svjetla. To bi bilo vrlo dobro iskustvo.

U App Storeu postoji mnogo "fill light" aplikacija, a ni one ne izgledaju vrlo složeno.

![AppStore](../../Resource/018_appStore.PNG)

Možemo početi razvijati jednostavne aplikacije i pokušati ih objaviti u App Storeu. To ne samo da povećava naš interes za razvoj, već i bilježi naš napredak.

### Vježba nakon lekcije

Možete nastaviti razmišljati o načinima proširenja ove fill light aplikacije, na primjer:

- Dodajte više boja
- Prikažite trenutačnu vrijednost svjetline
- Poboljšajte dizajn donjeg područja klizača

Kada stvarno počnete koristiti ovo znanje, otkrit ćete da je svaki pojam koji učimo zapravo alat za izradu aplikacija.

Što više alata savladamo, to više funkcionalnosti možemo stvoriti.
