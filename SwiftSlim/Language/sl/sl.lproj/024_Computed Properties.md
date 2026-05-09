# Izračunane lastnosti

V tej lekciji se bomo učili predvsem o izračunanih lastnostih.

Izračunana lastnost se uporablja za izračun novega rezultata na podlagi že obstoječih podatkov. Z njo lahko izračunamo številčne vrednosti, pa tudi vsebino, ki jo je treba prikazati v SwiftUI view.

Na primer:

```swift
let a = 10
let b = 20
let c = a + b
```

Tukaj `c` pomeni rezultat po seštevanju `a` in `b`.

V običajni kodi je takšen način pisanja zelo pogost.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Namig: v dogodku klika `Button` lahko izvajamo običajno Swift kodo.

Toda če podobno kodo napišemo neposredno med lastnostmi SwiftUI view, naletimo na težavo.

Na primer:

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

Ta koda bo povzročila napako.

Na prvi pogled se zdi, da sta `a` in `b` že zapisana pred `c`, zato bi bilo vrednost `c` mogoče izračunati.

Vendar pri deklariranju lastnosti v strukturi tega načina pisanja ni mogoče uporabiti neposredno.

## Zakaj c ni mogoče neposredno izračunati kot a + b?

Ker `a`, `b` in `c` niso začasne konstante v dogodku klika gumba, temveč lastnosti view `ContentView`.

V dogodku klika gumba lahko ta koda deluje normalno:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

To je zato, ker se po kliku gumba koda izvaja po vrsti. Najprej se ustvari `a`, nato `b`, na koncu pa se z `a + b` izračuna `c`.

Pri deklariranju lastnosti znotraj view pa je situacija drugačna:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Tukaj so `a`, `b` in `c` vse lastnosti view `ContentView`.

Ko se ustvari view `ContentView`, mora Swift najprej pripraviti te lastnosti. Da je postopek ustvarjanja varen, Swift ne dovoli, da privzeta vrednost ene shranjene lastnosti instance neposredno bere druge lastnosti iste instance.

Zato bo ta vrstica povzročila napako:

```swift
let c = a + b
```

Preprosto lahko razumemo tako: **pri deklariranju lastnosti znotraj view ne moremo neposredno uporabiti ene običajne lastnosti za izračun druge običajne lastnosti.**

Takšna lastnost, ki neposredno shranjuje vrednost, se imenuje »shranjena lastnost«. Za lažje razumevanje jo lahko začasno obravnavamo kot običajno lastnost.

Na primer:

```swift
let a = 10
```

`a` shranjuje `10`.

```swift
let b = 20
```

`b` shranjuje `20`.

Toda:

```swift
let c = a + b
```

Tukaj `c` ni neposredno zapisana stalna vrednost. Pričakujemo, da bo izračunana z `a + b`.

V takšni situaciji, ko »rezultat dobimo na podlagi obstoječih podatkov«, je bolj primerna izračunana lastnost.

Kodo lahko spremenimo tako:

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

Tukaj je `c` izračunana lastnost.

```swift
var c: Int {
    return a + b
}
```

Pomen je: **ko moramo uporabiti `c`, se prebereta `a` in `b`, nato pa se vrne rezultat `a + b`.**

Na primer:

```swift
Text("c: \(c)")
```

Ko `Text` prikaže `c`, se šele takrat sproži izračun `c`.

## Kaj je izračunana lastnost?

Izračunana lastnost je videti kot spremenljivka, vendar sama ne shranjuje podatkov.

Na primer:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Tukaj je `c` izračunana lastnost.

Ne shranjuje stalne vrednosti kot običajna lastnost. Vsakič, ko preberemo `c`, se koda znotraj `{}` znova izvede in vrne izračunani rezultat.

To lahko razumemo tako:

```swift
var c: Int {
    return a + b
}
```

Ko potrebujemo `c`, se izračuna `a + b`.

Zato je izračunana lastnost primerna za takšno situacijo: **rezultata ni treba shranjevati posebej, ker ga lahko izračunamo iz že obstoječih podatkov.**

## Osnovni zapis

Izračunana lastnost je običajno sestavljena iz treh delov:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklaracija z `var`

```swift
var c
```

Izračunano lastnost moramo deklarirati z `var`; `let` ni mogoče uporabiti.

To je zato, ker izračunana lastnost ni stalno shranjena vrednost, ampak rezultat, ki se dinamično izračuna ob vsakem branju.

### 2. Navedba vrnjenega tipa

```swift
var c: Int
```

Izračunana lastnost mora imeti naveden vrnjeni tip.

Tukaj `c` na koncu vrne celo število, zato je tip `Int`.

### 3. Zapis logike izračuna znotraj {}

```swift
{
    return a + b
}
```

Znotraj `{}` zapišemo logiko izračuna. Tukaj se vrne `a + b`.

## Ključna beseda return

Izračunana lastnost mora vrniti rezultat.

Na primer:

```swift
var c: Int {
    return a + b
}
```

Tukaj `return` pomeni: vrni rezultat izračuna `a + b`.

Če je v izračunani lastnosti samo en izraz, ki neposredno ustvari rezultat, lahko `return` izpustimo:

```swift
var c: Int {
    a + b
}
```

Če pa izračunana lastnost vsebuje več vrstic kode, moramo uporabiti `return`, da jasno označimo vrnjeni rezultat.

Na primer:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Tukaj je postopek izračuna razdeljen na dva koraka.

Prvi korak je izračun skupne cene:

```swift
let total = count * price
```

Drugi korak je združitev skupne cene v besedilo in vračanje rezultata:

```swift
return "Total：\(total) $"
```

Če odstranimo `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

bo ta koda povzročila napako.

Razlog je: **ta izračunana lastnost že vsebuje več vrstic kode, zato Swift ne more samodejno določiti, katera vrstica je končni rezultat za vračanje.**

Zato lahko `return` izpustimo, kadar ima izračunana lastnost samo en izraz, ki ustvari rezultat.

```swift
var c: Int {
    a + b
}
```

Kadar izračunana lastnost vsebuje več vrstic kode, je priporočljivo jasno zapisati `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Razlika med izračunano lastnostjo in običajno lastnostjo

Običajna lastnost shranjuje podatke.

```swift
var c = 30
```

Tukaj `c` shranjuje konkretno vrednost: `30`.

Izračunana lastnost ne shranjuje podatkov.

```swift
var c: Int {
    a + b
}
```

Tukaj `c` ne shranjuje `30`. Zagotavlja samo način izračuna.

Ko preberemo `c`, Swift izvede:

```swift
a + b
```

Nato vrne izračunani rezultat.

Zato je izračunana lastnost primerna za situacije, kjer je treba rezultat izračunati na podlagi drugih podatkov.

## body je tudi izračunana lastnost

Ko spoznamo izračunane lastnosti, lahko znova razumemo najpogostejšo kodo v SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tukaj je `body` prav tako izračunana lastnost.

Deklarirana je z `var`:

```swift
var body
```

Ima vrnjeni tip:

```swift
some View
```

V `{}` se vrne vsebina SwiftUI view:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Zato lahko `body` razumemo tako: ko mora SwiftUI prikazati ta view, prebere `body` in na podlagi vsebine, ki jo `body` vrne, ustvari vmesnik.

Če zapišemo `return`, lahko to razumemo tako:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

V SwiftUI pa običajno izpustimo `return` in pišemo neposredno:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ko se podatki `@State` spremenijo, SwiftUI znova prebere `body` in posodobi vmesnik glede na nove podatke.

Na primer:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Po kliku gumba se `count` spremeni.

```swift
count += 1
```

Ko se `count` spremeni, SwiftUI znova izračuna `body`, zato se posodobi tudi besedilo v vmesniku.

```swift
Text("count: \(count)")
```

To je tudi razlog, zakaj se lahko v SwiftUI vmesnik samodejno osveži po spremembi podatkov.

### V body ni priporočljivo pisati zapletenih izračunov

Ker je `body` izračunana lastnost, se lahko večkrat prebere in znova izračuna.

Na primer:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Ko se `name` spremeni, SwiftUI znova izračuna `body`.

Takrat se znova izvede tudi koda znotraj `body`, prav tako se znova ustvari `num`.

```swift
let num = 10
```

V tem primeru je `num` zelo preprost, zato vpliv ni velik.

Če pa v `body` izvajamo zapletene izračune, na primer filtriranje velike količine podatkov, razvrščanje, obdelavo slik in podobno, lahko to vpliva na tekoče delovanje vmesnika.

Zato naj bo v SwiftUI `body` predvsem odgovoren za opis strukture vmesnika.

Preproste začasne podatke lahko pišemo znotraj `body`.

Zapletene izračune je bolje premakniti izven `body`, na primer v izračunano lastnost, metodo ali ločen del za obdelavo podatkov.

## Primer: količina in skupna cena

Zdaj bomo izračunano lastnost razumeli s preprostim primerom.

Predpostavimo, da ena korenček stane 2 $. Uporabnik lahko s klikom na gumbe spremeni kupljeno količino, vmesnik pa mora prikazati skupno ceno.

Način izračuna skupne cene:

```text
Količina * Cena na enoto
```

Če bi skupno ceno shranili v običajno spremenljivko, bi bilo to nekoliko nepraktično.

Ker bi morali ob vsaki spremembi količine ročno posodobiti skupno ceno.

Boljši način je uporaba izračunane lastnosti:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Prikazani rezultat:

![view](../../Resource/024_view.png)

V tem primeru:

```swift
@State private var count = 1
```

`count` predstavlja količino korenčkov. Ko kliknemo gumb, se `count` spremeni.

```swift
private let price = 2
```

`price` predstavlja ceno enega korenčka. Tukaj je to stalna vrednost, zato uporabimo `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` predstavlja skupno ceno.

Ni je treba shranjevati posebej, ker se skupna cena vedno lahko izračuna z `count * price`.

Ko je `count` `1`:

```swift
totalPrice = 1 * 2
```

Prikazani rezultat je:

```swift
totalPrice: 2 $
```

Po kliku gumba `+` postane `count` `2`.

Takrat se ob ponovnem branju `totalPrice` znova izračuna:

```swift
totalPrice = 2 * 2
```

Prikazani rezultat je:

```swift
totalPrice: 4 $
```

To je vloga izračunane lastnosti: dinamično izračuna nov rezultat na podlagi že obstoječih podatkov.

## Izračunano lastnost lahko uporabimo tudi za preverjanje pogojev

Izračunana lastnost ne more samo računati števil, temveč lahko vrne tudi rezultat preverjanja pogoja.

Na primer, kadar želimo, da je najmanjša količina 1.

Ko je količina že 1, gumb `-` ne bi smel več zmanjševati vrednosti.

Dodamo lahko izračunano lastnost:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Celotna koda:

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
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Prikazani rezultat:

![view](../../Resource/024_view1.png)

Tukaj:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Ta koda pomeni, ali lahko trenutno količino še zmanjšamo.

Ko je `count` večji od `1`:

```swift
canDecrease == true
```

to pomeni, da lahko zmanjšamo.

Ko je `count` enak `1`:

```swift
canDecrease == false
```

to pomeni, da ne moremo več zmanjševati.

### Preverjanje pogoja v gumbu

V gumbu uporabimo:

```swift
if canDecrease {
    count -= 1
}
```

Samo ko je `canDecrease` `true`, lahko zmanjšamo `count`.

### Upravljanje barve ospredja view

Z `canDecrease` lahko upravljamo tudi barvo ospredja gumba:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tukaj uporabimo ternarni operator:

```swift
canDecrease ? Color.primary : Color.gray
```

Pomen te kode je: če je `canDecrease` `true`, se za barvo ospredja uporabi `Color.primary`; če je `canDecrease` `false`, se uporabi `Color.gray`.

`Color.primary` je sistemska semantična barva, ki jo ponuja SwiftUI. Predstavlja glavno barvo besedila v trenutnem vmesniku.

V svetlem načinu je `Color.primary` običajno blizu črni barvi; v temnem načinu je običajno blizu beli barvi.

Prednost uporabe `Color.primary` je, da se samodejno prilagodi svetlemu in temnemu načinu.

### Upravljanje onemogočenega stanja view

`disabled` se uporablja za upravljanje tega, ali je view v onemogočenem stanju:

```swift
.disabled(!canDecrease)
```

Ko je `disabled` `false`, lahko view kliknemo.

Ko je `disabled` `true`, je view onemogočen in ga ni mogoče klikniti.

Tukaj je `canDecrease` uporabljen kot pogoj, zato je koda lažje razumljiva.

Ko vidimo `canDecrease`, lahko takoj razumemo, da pomeni »ali lahko trenutno še zmanjšamo«.

### Dodatna razlaga: zakaj preverjamo dvakrat?

V gumbu `-`:

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

Tukaj uporabimo tako `.disabled(!canDecrease)` kot tudi `if canDecrease` znotraj gumba.

`.disabled(!canDecrease)` onemogoči gumb na ravni vmesnika, da ga uporabnik ne more klikniti.

`if canDecrease` pa pred izvajanjem kode še enkrat preveri pogoj. Samo kadar je zmanjšanje mogoče, se izvede `count -= 1`.

To je dvojna zaščita. V dejanskem razvoju lahko notranje preverjanje izpustimo, če je gumb že onemogočen. V učnem primeru pa ga lahko pustimo, ker jasneje pokaže vlogo `canDecrease`.

## Povzetek

V tej lekciji smo se učili predvsem o izračunanih lastnostih.

Izračunana lastnost ne shranjuje vrednosti neposredno. Ko jo preberemo, izračuna rezultat na podlagi že obstoječih podatkov.

Na primer:

```swift
var c: Int {
    a + b
}
```

Tukaj `c` ni treba shranjevati posebej, ker ga lahko izračunamo z `a + b`.

Izračunano lastnost moramo deklarirati z `var`, navesti pa moramo tudi vrnjeni tip.

```swift
var canDecrease: Bool {
    count > 1
}
```

Izračunana lastnost lahko vrne ne samo številčno vrednost, temveč tudi rezultat preverjanja pogoja, besedilno vsebino in celo vsebino SwiftUI view.

V tej lekciji smo se naučili tudi `return`.

`return` pomeni vrniti rezultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Če je v izračunani lastnosti samo en izraz, ki neposredno ustvari rezultat, lahko `return` izpustimo.

```swift
var totalPrice: Int {
    count * price
}
```

Poleg tega smo spoznali tudi `Color.primary` in `disabled`.

`Color.primary` je sistemska semantična barva v SwiftUI. Samodejno prilagodi prikaz glede na svetli in temni način.

```swift
.foregroundStyle(Color.primary)
```

`disabled` se uporablja za upravljanje tega, ali je view onemogočen.

```swift
.disabled(true)
```

To pomeni, da je onemogočen in ga ni mogoče klikniti.

```swift
.disabled(false)
```

To pomeni, da je na voljo in ga je mogoče klikniti.

Zato so izračunane lastnosti v SwiftUI zelo pogoste. Pomagajo nam jasneje organizirati rezultate izračunov, pogoje in prikazano vsebino.
