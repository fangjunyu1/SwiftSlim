# Sistem tipov

V prejšnjih lekcijah smo se že naučili o spremenljivkah in vemo, da lahko shranjujejo podatke različnih vrst.

Na primer:

```swift
var hello = "Hello, World"
````

Tukaj hello shranjuje besedilo, zato je njegov tip String.

Nato bomo sistematično spoznali pojem tipa (Type), pa tudi eksplicitno deklaracijo tipov in sklepanje tipov, da bomo globlje razumeli bistvo spremenljivk.

## Kaj je tip

V Swiftu ima vsaka vrednost določen tip. Tip določa, kaj ta vrednost je in kaj lahko z njo počnemo.

Na primer:

* 42 je Int (celo število)
* "Hello" je String (niz)
* true je Bool (logična vrednost)

Pripadajo različnim tipom in imajo tudi različne namene.

## Pogosti osnovni tipi v Swiftu

Na začetni stopnji so najpogostejši tipi naslednji:

* String：niz (besedilo)
* Int：celo število
* Double：število s plavajočo vejico (z decimalami, višja natančnost)
* Bool：logična vrednost (true/false)

Poleg tega obstajata še Float (število s plavajočo vejico), vendar ima nižjo natančnost kot Double in se uporablja redkeje, ter Character (en sam znak), na primer "A", "!" in podobno.

### Deklaracija tipa（eksplicitni tip）

V Swiftu lahko pri deklaraciji spremenljivke tip določimo ročno:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Za imenom spremenljivke dodamo ": tip", da deklariramo njen tip.

Zapis tipa za polje je ": [tip]":

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

V tem delu kode lahko polje scores vsebuje samo elemente tipa Int, tags pa samo elemente tipa String.

Eksplicitna deklaracija tipa lahko naredi namen kode bolj jasen in v določenih primerih prepreči napake pri sklepanju tipov.

## Sklepanje tipov

V veliko primerih tipa ni treba eksplicitno zapisati:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

To je zato, ker bo prevajalnik Swift tip samodejno sklepal iz »začetne vrednosti«.

## Eksplicitna deklaracija in sklepanje tipov

V prejšnjih lekcijah nismo uvajali eksplicitnih deklaracij, na primer:

```swift
var age: Int = 18
```

temveč smo dajali prednost sklepanju tipov:

```swift
var age = 18
```

V tem primeru sta zapisa enakovredna, saj bo age v obeh primerih določen kot tip Int. V primerjavi s tem je zapis s sklepanjem tipa krajši.

Razlog, da v začetni fazi nismo poudarjali eksplicitnih deklaracij, je v tem, da sklepanje tipov zmanjša količino dodatnih informacij v kodi in s tem zniža strošek razumevanja za začetnike.

## Zakaj potrebujemo tipe

Swift je močno tipiziran jezik（Strongly Typed Language）。

To pomeni: ko je tip spremenljivke enkrat določen, ga ni mogoče poljubno spreminjati.

Na primer:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Prvi 20 je tipa Int, zato ga lahko dodelimo spremenljivki age; drugi "20" pa je tipa String, kar ni skladno z Int, zato pride do napake.

nums je polje tipa [Int], zato lahko shranjuje samo cela števila in ne more vsebovati niza.

Tipi omejujejo uporabo podatkov in omogočajo, da neskladja tipov odkrijemo že v fazi prevajanja, kar zmanjšuje zmedo med tipi, zmanjšuje BUG-e in izboljšuje stabilnost ter vzdržljivost kode.

## Kdaj moramo tip eksplicitno deklarirati

Čeprav lahko Swift tip samodejno sklepa, obstajajo primeri, ko ga prevajalnik ne more ugotoviti ali pa ga ugotovi napačno. Takrat ga moramo deklarirati ročno.

**1. Prazno polje**

Pri ustvarjanju praznega polja moramo tip deklarirati eksplicitno:

```swift
var nums: [Int] = []
```

Če tipa ne zapišemo:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

prevajalnik ne more iz praznega polja sklepati, kakšnega tipa so njegovi elementi, zato pride do napake pri prevajanju.

**2. Izogib napačnemu sklepanju**

```swift
var value = 10   // Int
```

V tem primeru je 10 sicer mogoče razumeti tudi kot število s plavajočo vejico (Double), vendar ga bo prevajalnik, ker nima decimalne pike, privzeto obravnaval kot Int.

Če želimo, da value predstavlja število s plavajočo vejico, moramo tip deklarirati eksplicitno:

```swift
var value: Double = 10   // Double
```

Ko rezultat sklepanja tipa ne ustreza pričakovanemu, moramo s eksplicitno deklaracijo tipa ali prilagoditvijo literala zagotoviti pravilnost tipa.

**3. Lastni tipi**

Kasneje bomo spoznali tudi lastne tipe. Pri njih je običajno prav tako potrebna eksplicitna deklaracija:

```swift
var info: GameInfo
var users: [User] = []
```

Razlog je enak kot pri praznem polju: prevajalnik ne more samodejno sklepati tipa iz prazne vrednosti.

## Pretvorba tipov

V Swiftu se različni tipi med seboj ne pretvarjajo samodejno; pretvorbo moramo izvesti ročno.

Na primer, seštevanje dveh števil različnih tipov:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

V tem delu kode je a tipa Int, b pa tipa Double. Ker sta tipa različna, ju ni mogoče neposredno uporabiti v isti operaciji.

Pred izračunom moramo eno od vrednosti najprej pretvoriti v isti tip:

```swift
var result = Double(a) + b
```

Ta zapis pomeni, da a tipa Int pretvorimo v Double in ga nato seštejemo z b, rezultat pa shranimo v result.

Pomembno je poudariti, da pretvorba tipa ne spremeni tipa izvorne spremenljivke. Na primer, Double(a) ne spremeni a iz Int v Double, ampak ustvari novo vrednost tipa Double, ki sodeluje v izračunu.

Tudi druge tipe lahko pretvarjamo na podoben način, torej z uporabo ciljanega tipa + () in podajanjem vrednosti, ki jo želimo pretvoriti. Na primer:

```id="u5i55i"
Int()、Double()、String()
```

Primer:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Treba je poudariti, da se vse pretvorbe ne izvedejo popolnoma intuitivno. Na primer, pri Double → Int se decimalni del preprosto odreže, ne pa zaokroži.

## Vzdevki tipov

V Swiftu lahko obstoječemu tipu damo tudi vzdevek, kar naredi pomen kode bolj jasen:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Tukaj je UserId v bistvu še vedno Int. Tip se ni spremenil, le ime je postalo bolj smiselno.

V projektih z veliko kode in bolj zapletenimi tipi lahko vzdevki tipov izboljšajo berljivost.

## Primer tipov

Spodaj bomo s preprostim primerom pokazali vlogo tipov v dejanskem razvoju.

### Ustvarjanje spremenljivke

Najprej ustvarimo spremenljivko age:

```swift
var age = 20
```

Ker moramo to spremenljivko prikazati in spreminjati v SwiftUI, jo moramo deklarirati z @State:

```swift
@State private var age = 20
```

private smo omenili že prej. Pomeni, da je ta spremenljivka dostopna samo v trenutnem pogledu. Kasneje jo bomo podrobneje obravnavali.

### Prikaz podatkov v SwiftUI

Prikaz spremenljivke age v SwiftUI:

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

Pogled bo zdaj prikazal:

```swift
age: 20
```

### Spreminjanje podatkov

Nato dodamo dva gumba za spreminjanje age:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Rezultat izvajanja

Ko kliknemo changeAge1, bo age dobil vrednost 18:

```swift
age = 18
```

Ker je 18 tipa Int in se ujema s tipom age, je dodelitev uspešna.

Pri changeAge2 pa pride do napake:

```swift
age = "18"
```

Sporočilo o napaki:

```id="coedn7"
Cannot assign value of type 'String' to type 'Int'
```

Razlog je v tem, da je "18" tipa String（niz mora biti zapisan v ""）, medtem ko je age tipa Int. Ker tipa nista skladna, dodelitev ni mogoča.

### Zakaj pride do napake？

Ključ je v tej vrstici kode:

```swift
@State private var age = 20   // Int
```

Čeprav tip ni eksplicitno deklariran, bo prevajalnik zaradi začetne vrednosti 20 samodejno sklepal, da je age tipa Int.

Ko je tip enkrat določen, mu ni več mogoče dodeliti vrednosti drugega tipa.

Poleg tega gumb changeAge2 ne »odpove med izvajanjem«, ampak napako javi že v fazi prevajanja, zato se koda sploh ne prevede.

To je tudi ena od prednosti močne tipizacije v Swiftu: težave s tipi lahko odkrijemo že med pisanjem kode.

### Pravilni zapis

Ko odstranimo napačno kodo:

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

Ko kliknemo gumb changeAge1, se pogled posodobi na:

```id="x4vmy1"
age: 18
```

### Eksplicitna deklaracija tipa（izbirno）

Tip lahko ob definiciji določimo tudi izrecno:

```swift
@State private var age: Int = 20
```

Ta zapis naredi tip bolj jasen, vendar v enostavnih primerih ni nujen.

## Povzetek

Ta lekcija je predvsem obravnavala sistem tipov v Swiftu in njegovo vlogo v dejanskem razvoju.

V Swiftu ima vsaka vrednost določen tip, tip pa določa pomen podatka in operacije, v katerih lahko sodeluje.

Swift je močno tipiziran jezik. Ko je tip spremenljivke enkrat določen, ji ni več mogoče dodeliti vrednosti drugega tipa. Ta omejitev omogoča, da odkrijemo napake že v fazi prevajanja, zmanjšamo težave med izvajanjem in izboljšamo varnost kode.

Tip spremenljivke lahko prevajalnik samodejno sklepa iz začetne vrednosti ali pa ga eksplicitno deklariramo. V nekaterih primerih, kot so prazna polja, napačno sklepanje tipa ali lastni tipi, prevajalnik ne more pravilno ugotoviti tipa, zato ga moramo deklarirati eksplicitno.

Med različnimi tipi se pretvorba ne zgodi samodejno. Izvesti jo moramo eksplicitno z Int()、Double()、String() in podobno.

Tipi podpirajo tudi vzdevke, ki lahko v zahtevnejših projektih izboljšajo berljivost.

Tip ni samo oznaka podatka, ampak tudi mehanizem omejevanja, ki zagotavlja, da je uporaba podatkov varna, jasna in nadzorovana.

## Razširjeno znanje - opcijski tip

Pri pretvorbi tipov lahko nekatere operacije spodletijo.

Na primer, pretvorba String v Double:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Tukaj Double(input) ne vrne Double, ampak:

```id="4vr0dz"
Double?
```

To je opcijski tip（Optional）。

### Zakaj se vrne opcijski tip？

Ker je vsebina niza negotova, lahko "3.14" pretvorimo v Double, "Hello" pa ne.

To pomeni, da je operacija lahko uspešna ali neuspešna.

Zato Swift uporablja opcijski tip za predstavitev te negotovosti.

### Kaj je opcijski tip？

Opcijski tip pomeni: vrednost lahko obstaja ali pa ne obstaja.

Na primer:

```id="26fn5l"
Double?
```

Ta tip pomeni, da bo ob obstoječi vrednosti pri izpisu prikazano Optional(...), če vrednosti ni, pa se vrne nil.

Pomembno je poudariti, da nil pomeni »ni vrednosti«, ne pa 0 ali prazen niz.

### Primer

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Izpis:

```id="er2fca"
pi:Optional(3.14)
```

To pomeni, da je bil niz uspešno pretvorjen v Double in dobili smo 3.14, vendar je vrednost zaradi tipa Double? ovita v Optional.

Če pretvorba ne uspe:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Izpis:

```id="m0zzmm"
pi: nil
```

Ker "Hello" ni mogoče pretvoriti v Double, pretvorba ne uspe in vrne nil.

### Kaj je Optional(...)？

Ko opcijski tip neposredno izpišemo:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift prikaže njegov »opis za razhroščevanje«:

```id="1h4dt8"
Optional(3.14)
```

To ni del dejanskih podatkov, ampak namiguje, da je trenutna vrednost »opcijskega tipa« in da v sebi vsebuje neko vrednost.

### Odpiranje opcijskega tipa

V dejanskem razvoju moramo iz opcijskega tipa običajno pridobiti pravo vrednost. Ta postopek se imenuje odpiranje（Unwrapping）。

Eden pogostih načinov je uporaba ?? za podajo privzete vrednosti:

```id="wtjoiu"
??
```

To se imenuje: operator združevanja z nil（Nil-Coalescing Operator）。

Na primer:

```swift
name ?? "FangJunyu"
```

Ta zapis pomeni, da vrnemo vrednost name, če obstaja; če je nil, uporabimo privzeto vrednost "FangJunyu".

Treba je poudariti, da mora biti tip privzete vrednosti skladen z opcijskim tipom.

### Uporaba ?? za podajo privzete vrednosti

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Izpis：

```id="qn8xas"
pi: 30
```

Ko se input pretvori v Double, je pretvorba uspešna in izpiše se vrednost. Če bi pretvorba spodletela, bi se izpisala privzeta vrednost, podana z ??.

Če pretvorba ne uspe:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Izpis：

```id="5t946h"
pi: 10
```

Tukaj se pri pretvorbi input v Double pretvorba ponesreči in vrne nil, ?? pa za nil poda privzeto vrednost.

Opcijski tip se uporablja za predstavitev situacij, kjer »morda obstaja vrednost, morda pa ne«.

Pri operacijah, kot je pretvorba tipov, ki lahko spodletijo, Swift vrne opcijski tip, da zagotovi varnost programa.

Ko moramo uporabiti vrednost iz opcijskega tipa, lahko z uporabo ?? podamo privzeto vrednost in tako tudi ob pojavu nil še vedno dobimo smiseln rezultat.