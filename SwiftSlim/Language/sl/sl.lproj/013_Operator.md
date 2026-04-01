# Operatorji

V tej lekciji bomo spoznali operatorje v Swiftu（Operators）。

Ko računamo, primerjamo ali izvajamo logične presoje, moramo uporabljati operatorje. Takšne operacije potekajo skozi vse dele izvajanja programa in so ena najbolj osnovnih sposobnosti v programiranju.

```swift
let a = 100 * 8
```

Med učenjem programiranja veliko ljudi opazi, da tisti z nekoliko boljšim matematičnim razmišljanjem pogosto lažje razumejo logiko programa. To je zato, ker programiranje v bistvu ne more brez »računanja« in »presoje pravil«, operatorji pa imajo prav pri tem osrednjo vlogo.

V dejanskem razvoju se operatorji ne uporabljajo le za preproste številčne izračune, temveč so široko prisotni tudi v zelo konkretnih scenarijih.

Na primer, v igri s kockami moramo, ko uporabnik povleče eno kocko na določeno mesto, izračunati:

* koordinatni položaj kocke
* položaje, ki jih kocka lahko zapolni
* ali je ciljni položaj na voljo

Ti procesi »izračun + presoja« so v svojem bistvu odvisni od operatorjev.

![Block](../../Resource/013_block.png)

Učenje operatorjev ni le učenje številčnega računanja, ampak tudi priprava temeljev za poznejšo postavitev vmesnika, obdelavo podatkov in interaktivno logiko.

## Način izvajanja računanja v SwiftUI

V SwiftUI običajno računanje sprožimo prek gumba Button, nato pa logiko izvajamo znotraj funkcije.

Na primer:

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

Ko kliknemo gumb, Console izpiše:

```id="fdydsr"
c: 20
```

V tej lekciji bomo logiko izračunov enotno zapisovali v func, izvajanje pa sprožali prek gumba, rezultat pa prikazovali z uporabo print.

V poznejših primerih bomo zaradi poenostavitve prikaza kode rezultat izračuna neposredno zapisali v komentarju in ne bomo več ponavljali izpisa s print.

## Upravljanje izpisa v Console

Ker vsak klik povzroči nov izpis informacij, lahko kliknete gumb za čiščenje v spodnjem desnem delu območja Console in tako počistite zgodovino dnevnikov, da boste lažje videli trenutni rezultat.

![Console](../../Resource/013_console.png)

## Druga oblika zapisa Button

Ko gumb izvaja samo eno funkcijo, lahko uporabimo bolj jedrnat zapis:

```swift
Button(action: ) {
    // View
}
```

V tem zapisu action določa funkcijo, ki se mora izvesti ob kliku gumba（funkcija brez parametrov）, zaviti oklepaji {} pa določajo pogled gumba.

Če to združimo s prejšnjo funkcijo calculate, lahko zapišemo:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Ko kliknemo gumb, se funkcija calculate izvede neposredno.

Zato je pri enostavni logiki gumba in kadar ta samo kliče eno funkcijo zapis z action bolj jasen in bolje usklajen s kodnim slogom.

## Aritmetični operatorji

Aritmetični operatorji（Arithmetic Operators）se uporabljajo za računanje z vrednostmi:

* `+` seštevanje
* `-` odštevanje
* `*` množenje
* `/` deljenje
* `%` ostanek pri deljenju（ostanek）

Primer:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Pomembno je poudariti, da je Swift močno tipiziran jezik in ne bo samodejno mešal različnih podatkovnih tipov:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Ko sta tipa različna, moramo tip pretvoriti ročno.

## Primerjalni operatorji

Primerjalni operatorji（Comparison Operators）se uporabljajo za presojo odnosa med dvema vrednostma, rezultat pa je Bool：

* `==` enako
* `!= ni` enako
* `>` večje od
* `<` manjše od
* `>=` večje ali enako
* `<=` manjše ali enako

Primer:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Primerjalni operatorji se pogosto uporabljajo v pogojnih stavkih. Na primer, v »vrtečih se citatih« moramo nadzorovati, da indeks ne preseže obsega polja:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Če je index manjši od sayings.count - 1, bo rezultat primerjave true in koda v stavku if se bo izvedla; če je rezultat false, se naslednja koda ne bo izvedla.

## Logični operatorji

Logični operatorji（Logical Operators）se uporabljajo za povezovanje več pogojev:

* `&&` in（AND）
* `||` ali（OR）
* `!` ne（NOT）

### && in

Kadar mora biti hkrati izpolnjenih več pogojev, uporabimo &&。

Na primer:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

V tej kodi sta vključena dva pogoja: age >= 18 in age <= 100。

Samo če sta oba pogoja hkrati true, bo legalAge true；če ni izpolnjen že samo eden, je rezultat false。

### || ali

Kadar zadošča, da je izpolnjen samo eden izmed več pogojev, uporabimo ||。

Na primer:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Ta koda pomeni, da je payAllowed true, dokler velja money >= 50 ali creditCard >= 50。

Rezultat je false samo takrat, ko noben od pogojev ni izpolnjen.

Na primer, v scenariju plačevanja lahko plačamo z gotovino ali s kreditno kartico. Če ni mogoče plačati z nobenim od obeh načinov, plačilo ne uspe.

### ! ne

! je logični operator negacije（NOT）, ki obrne Bool vrednost.

Lahko ga razumemo tako, da ! spremeni true v false in false v true。

Na primer:

```swift
let allowed = true
let result = !allowed   // false
```

Tukaj !allowed pomeni, da vrednost allowed obrnemo v nasprotno.

Pomembno je poudariti, da sta ! in != dva različna operatorja. ! obrača Bool vrednost, != pa je primerjalni operator, ki vrne Bool vrednost.

## Operatorji prirejanja

Operatorji prirejanja（Assignment Operators）se uporabljajo za dodeljevanje ali posodabljanje vrednosti spremenljivk:

* `=` prirejanje

Tako pri deklaraciji spremenljivke kot pri izračunu se pojavlja operacija prirejanja:

```swift
let a = 5
```

Ta koda pomeni, da vrednost 5 dodelimo spremenljivki a.

### Sestavljeni operatorji prirejanja

V dejanskem razvoju se poleg osnovnega operatorja prirejanja pogosto uporabljajo tudi »sestavljeni operatorji prirejanja«, ki omogočajo neposreden izračun na obstoječi vrednosti in njeno posodobitev:

* `+=`
* `-=`
* `*=`
* `/=`

V prejšnji lekciji »Števec« smo se s sestavljenimi operatorji prirejanja že na kratko srečali.

Na primer, če želimo ob kliku gumba samodejno povečati vrednost spremenljivke:

```swift
var num = 10
num += 5   // num = 15
```

Ta koda pomeni, da num seštejemo s 5 in rezultat nato ponovno dodelimo num。

Zato je enakovredna naslednjemu zapisu:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternarni operator

Ternarni operator v Swiftu（Ternary Operator）presodi pogoj in vrne eno od dveh vrednosti:

```swift
pogoj ? vrednost1 : vrednost2
```

Logika izvajanja je taka: če je pogoj true, vrne »vrednost1«；če je pogoj false, vrne »vrednost2«。

Na primer:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Ta koda preveri vrednost showColor：če je true, vrne Color.blue in ozadje bo modro；če je false, vrne Color.clear in barva ozadja ne bo prikazana.

Namig：Color.clear pomeni prozorno barvo（nič ni prikazano）。

### Razlika v primerjavi z if-else

Ternarni operator je po logiki enakovreden stavku if-else。

Na primer, zgornjo kodo lahko zapišemo takole:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logika izvajanja je v obeh primerih povsem enaka：če je pogoj true, uporabimo prvi rezultat；če je pogoj false, uporabimo drugega.

V praksi je ternarni operator krajši in primernejši za izražanje preprostih odločitev »eno od dveh«, pogosto pa se uporablja tudi za neposredno vračanje vrednosti.

Pri gradnji pogleda v SwiftUI je ternarni operator zelo pogost, na primer:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Takšen zapis omogoča, da v eni vrstici kode dinamično spreminjamo videz pogleda glede na pogoj.

## Operatorji obsega

Operatorji obsega（Range Operators）se uporabljajo za predstavitev intervalov:

* `...` zaprti interval（vključuje oba konca）
* `..<` polodprti interval（desnega konca ne vključuje）

Na primer：

```id="xhfrqv"
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

To lahko razumemo takole：1...3 pomeni od 1 do 3 in vključuje 3；5..<8 pomeni od 5 do 8, vendar 8 ne vključuje。

Razširjene oblike（samo za orientacijo）：

```id="prl5d2"
5...    // >= 5
...5    // <= 5
```

Ta zapis pomeni »enostranski obseg« in se pogosto uporablja v pogojnih presojah ali pri ujemanju vzorcev.

Operatorje obsega bomo pozneje uporabljali pri učenju zanke for. Za zdaj jih lahko razumemo preprosto kot neprekinjen številčni interval.

## Vaja z operatorji

Zdaj bomo s pomočjo nekaj preprostih primerov vadili uporabo operatorjev v pogledu.

### 1. Izračun skupnega števila vozil

Na primer, po nekem križišču vsak dan pelje 500 vozil. Izračunajmo skupno število vozil v 30 dneh.

Lahko uporabimo računski operator:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Tukaj je postopek izračuna naslednji: vsak dan 500 vozil, skupno v 30 dneh pa 500 × 30, kar na koncu pomeni 15000 vozil.

### 2. Presoja članstva za nakup v aplikaciji

Presodimo lahko, ali je neka oseba član za nakup v aplikaciji. Dokler ima trajno članstvo ali naročniško članstvo, jo obravnavamo kot člana.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

V tej kodi uporabljamo operator ||（ali）：lifeTime = false pomeni, da ni trajnega članstva；subscription = true pa pomeni, da ima naročnino.

Ker je dovolj, da je izpolnjen eden od pogojev, je isMember true。Zato je ta oseba član nakupa v aplikaciji.

## Povzetek

V Swiftu so operatorji osnova podatkovnih izračunov in logične presoje. Tako kot Text prikazuje vsebino, operatorji obdelujejo same podatke.

Od najpreprostejših številčnih izračunov do zapletenih logičnih presoj, pa tudi do nadzora stanja in izračuna postavitve v pogledu, povsod sodelujejo operatorji.

S postopnim vadenjem v različnih scenarijih se lahko dobro seznanimo z vsemi vrstami operatorjev, predstavljenih v tej lekciji, kar predstavlja pomembno osnovo za nadaljnje učenje.

### Razširjeno znanje - bitni operatorji

Poleg tega Swift ponuja še eno bolj nizkonivojsko skupino operatorjev —— bitne operatorje（Bitwise Operators）：

* `&`（bitni AND）
* `|`（bitni OR）
* `^`（bitni XOR）
* `~`（bitni NOT）
* `>>`（premik v desno）
* `<<`（premik v levo）

Na primer：

```swift
let a = 6  // binarno 110
let b = 3  // binarno 011

print(a & b) // 2 (binarno 010)
print(a | b) // 7 (binarno 111)
print(a ^ b) // 5 (binarno 101)
print(~a)    // -7 (negacija)
```

V Swiftu so cela števila predstavljena v dvojiškem komplementu, zato po negaciji dobimo ustrezen negativen rezultat.

Bitni operatorji neposredno delujejo na dvojiškem zapisu in se običajno uporabljajo pri nizkonivojski obdelavi podatkov ali pri optimizaciji zmogljivosti.

Za začetnike so takšni operatorji redkeje uporabni, v običajnem razvoju za iOS ali SwiftUI pa tudi niso pogosti, zato jih tukaj ne bomo podrobneje razlagali.

Če bomo pozneje naleteli na nizkonivojsko logiko ali optimizacijo zmogljivosti, se lahko vanje dodatno poglobimo.
