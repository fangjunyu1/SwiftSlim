# Zanke in seznami

V tej lekciji se bomo naučili zanke `for` v Swiftu in `ForEach` v SwiftUI.

Oba nam pomagata brati elemente polja po vrsti. Pri dejanskem razvoju moramo pogosto podatke iz neke skupine jemati enega za drugim ter jih nato obdelati ali prikazati, zato je zanka zelo pomembno orodje za takšno delo.

Ko brskamo po spletu ali uporabljamo App, pogosto vidimo veliko seznamov ali postavk. Takšna vsebina je navadno najprej shranjena v `polju`, nato se prek `zanke` bere po vrsti in se na koncu prikaže na zaslonu.

Na primer seznam Googlovih rezultatov iskanja:

![Google](../../Resource/017_google.png)

Vsaka postavka v seznamu rezultatov iskanja običajno ustreza enemu podatku in se prek zanke prikaže po vrsti.

Zato se `polje` in `zanka` zelo pogosto pojavita skupaj. `Polje` skrbi za shranjevanje skupine podatkov, `zanka` pa skrbi za to, da te podatke po vrsti vzame ven in nad njimi izvede enako dejanje.

Spodaj bomo najprej začeli z najbolj osnovno zanko `for`.

## Odštevanje

Predpostavimo, da želimo posnemati funkcijo odštevanja in zaporedno izpisati `»5, 4, 3, 2, 1«`.

Najbolj neposreden zapis je:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Takšen način sicer lahko posnema odštevanje, vendar bo pri več vsebine koda zelo ponavljajoča, pozneje pa jo bo tudi neprijetno spreminjati.

Takrat lahko podatke najprej damo v polje in jih nato z zanko `for` izpišemo po vrsti:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Takšen zapis je krajši in ga je lažje razširjati. Tudi če je v odštevanju veliko števil, nam ni treba vrstice `print` pisati znova in znova. Dovolj je, da zanka samodejno obdela vsak element v polju.

To kodo lahko postavimo v gumb in jo preizkusimo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Ko kliknemo gumb, bo zanka `for` glede na vrstni red v polju iz `countDown` po eno jemala vsako celo število in jih izpisovala v konzolo.

Nato si poglejmo, kako zanka `for` deluje.

## Zanka for

Zanka `for` se uporablja za obdelavo skupine podatkov po vrsti. Najpogostejši primeri so polja in obsegi.

Osnovna oblika:

```swift
for element in poljeAliObseg {
    kodaZaIzvedbo
}
```

Na primer koda za odštevanje iz prejšnjega dela:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tukaj `i` pomeni trenutno izbrani element, za `in` pa sledijo podatki, prek katerih bomo iterirali, torej polje `countDown`.

Pomen te kode je naslednji: program bo iz polja `countDown` po vrsti jemal vsak element. Ko vzame en element, ga začasno predstavlja z `i`, nato pa izvede kodo v zavitih oklepajih.

Potek izvajanja si lahko predstavljamo takole:

- Prvi vzeti element je `5`, zato je takrat vrednost `i` enaka `5`
- Izvede se `print(i)` in izpiše se `5`
- Nato se vzame naslednji element `4`
- `print(i)` se izvede še enkrat in izpiše se `4`

Na enak način se nato po vrsti obdelajo še `3`, `2` in `1`.

![for](../../Resource/017_for.png)

Ko so vsi elementi v polju obdelani, se zanka `for` samodejno konča.

S pomočjo zanke `for` lahko dobimo vsak element v polju in izvedemo funkcije, kot je odštevanje.

**Namig**: `i` je v zankah for zelo pogost način poimenovanja za trenutni element, vendar to ni obvezno. Uporabite lahko tudi druga angleška imena.

Na primer lahko za vsak vzeti element uporabimo `num`:

```swift
for num in countDown {
    print(num)
}
```

V zavitih oklepajih moramo potem prav tako uporabiti `num` za označevanje trenutnega elementa.

### Iteriranje po obsegu

Zanka `for` ne more iterirati samo prek polja, ampak tudi prek obsega.

Na primer, ko želimo izračunati vsoto pozitivnih celih števil do `50`, moramo po vrsti sešteti vsa cela števila od `1` do `50`.

Najbolj neposreden zapis bi lahko bil:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Težava tega zapisa je v tem, da moramo vsako število zapisati ročno. To je zamudno in ni primerno za pravo razvojno delo.

Takrat lahko uporabimo operator obsega skupaj z zanko `for`.

V prejšnjem poglavju o »operatorjih« smo operator obsega že spoznali:

```swift
1...3   // 1, 2, 3
```

Tukaj `...` pomeni zaprt obseg, kar pomeni, da vključuje začetno in končno točko.

Zato lahko tukaj uporabimo zanko `for` za obseg celih števil od `1` do `50`:

```swift
for i in 1...50 {
    
}
```

Ker moramo ta števila seštevati, potrebujemo še spremenljivko za shranjevanje vsote:

```swift
var count = 0
```

Nato pri vsakem prehodu zanke trenutno vzeto število prištejemo k `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Ta koda pomeni:

- `count` shrani trenutno vsoto
- Zanka `for` bo po vrsti jemala cela števila od `1` do `50`
- Vsakič ko vzame eno celo število, izvede `count += i`
- Ko se zanka konča, bo v `count` shranjena končna vsota.

Tako lahko dobimo vsoto vseh pozitivnih celih števil do `50`.

Podobno, če želimo izračunati vsoto celih števil od `1` do `100`, moramo le spremeniti obseg:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Zanka `for` ne more iterirati le prek polja, temveč tudi prek obsega. Takšna sposobnost ponavljajoče obdelave podatkov po vrsti je pri razvoju zelo pogosta.

Pomaga nam samodejno opraviti veliko ponavljajočega dela, ne da bi morali ročno zapisati postopek seštevanja za vsako število ali druga podobna ponavljajoča dejanja.

## Zanke v SwiftUI

Prejšnja zanka `for` pripada jeziku Swift.

V SwiftUI pa `for` ne moremo neposredno uporabiti znotraj strukture view za ustvarjanje pogledov:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

To je zato, ker morajo biti znotraj `VStack` SwiftUI view-i, navadna zanka `for` pa sama po sebi ni view.

Če želimo v SwiftUI na podlagi vsebine polja večkrat ustvariti vmesnik, moramo uporabiti `ForEach`.

Na primer, če želimo prikazati imena vseh članov skupine, lahko napišemo:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Prikazani rezultat:

![for1](../../Resource/017_for1.png)

Nato vsakemu `Text` dodamo enake modifikatorje:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Zdaj se vsak `Text` prikaže z manjšo in debelejšo pisavo.

Prikazani rezultat:

![](../../Resource/017_for2.png)

Čeprav modifikatorji naredijo vmesnik lepši, kodo hkrati tudi podaljšajo in naredijo bolj ponavljajočo.

Če se število imen še poveča ali bomo pozneje želeli enotno spremeniti pisavo, barvo in druge sloge, bomo morali ponavljati in spreminjati veliko enake kode. To je precej neprijetno in otežuje vzdrževanje.

Takrat lahko ta imena najprej shranimo v polje in nato z `ForEach` v SwiftUI večkrat ustvarimo view glede na podatke v polju:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Ta skupina kode je bolj jedrnata. `ForEach` bo po vrsti prebral vsak element v polju in ustrezno vsebino prikazal na zaslonu.

Ko bomo pozneje dodajali nova imena, bo dovolj, da spremenimo vsebino polja `names`. Ni treba vsakič znova dodajati `Text` in zapletenih modifikatorjev.

## ForEach

`ForEach` je struktura v SwiftUI, namenjena večkratnemu ustvarjanju view-ov. Lahko jo razumemo kot nekaj podobnega zanki `for`, vendar znotraj SwiftUI.

Osnovna uporaba:

```swift
ForEach(polje, id: \.self) { element in
    SwiftUI koda
}
```

Na primer prej prikazana imena skupine:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ta koda pomeni:

`names` je polje, prek katerega iteriramo, torej podatki, ki jih želimo prikazati.

`id:\.self` pomeni, da se za razlikovanje vsakega elementa uporablja sam element polja.

V tem primeru polje vsebuje nize:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Zato bo SwiftUI neposredno uporabil same nize "Sam", "John", "Wathon", "Bob" za razlikovanje različnih vsebin.

Pri preprostih poljih, kot sta String in Int, s katerimi se začetniki pogosto srečajo, lahko običajno najprej pišemo:

```swift
id: \.self
```

Za zdaj si je dovolj zapomniti prav ta zapis. Ni treba še podrobno razumeti dodatnih pravil za id.

`item in` pomeni, da `item` predstavlja trenutno izbrani element.

Na primer, pri prvem krogu je `item` `"Sam"`, pri drugem pa `"John"`.

Zato:

```swift
Text(item)
```

Postopoma postane:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Naloga te kode je torej: po vrsti vzeti vsako ime iz polja `names` in za vsako ime ustvariti en `Text` view.

### Potek izvajanja

Potek izvajanja si lahko predstavljamo takole:

- `ForEach` najprej prebere prvi element `"Sam"` iz polja `names`
- `item` začasno predstavlja `"Sam"`
- `Text(item)` prikaže `"Sam"`
- Nato nadaljuje z branjem naslednjega elementa `"John"`
- In znova izvede isto view kodo

Na koncu bodo prikazana vsa imena v polju.

Prednost takšnega zapisa je v tem, da ko je imen več, nam ni treba znova in znova pisati veliko `Text`. Dovolj je, da spremenimo vsebino polja.

### Iteriranje čez fotografije

`ForEach` ne more prikazovati samo besedila, ampak tudi slike, barve ali druge SwiftUI view-e.

Na primer, pripravimo 4 slike:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Te štiri slike povlecite v mapo Assets v Xcode.

![image](../../Resource/017_for3.png)

Če ne uporabimo `ForEach`, moramo vsako sliko napisati ročno:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Prikazani rezultat:

![image](../../Resource/017_for4.png)

Takšen zapis sicer deluje, vendar bo koda precej dolga.

Če bo slik vedno več, bomo morali pisati vedno več kode `Image`.

Če bomo pozneje želeli enotno spremeniti velikost slik, jih bomo morali popravljati eno po eno.

Takrat lahko imena slik shranimo v polje in nato uporabimo `ForEach` za večkratno ustvarjanje view-ov slik:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

`images` je tukaj polje nizov in vsak element v polju je ime slike.

`ForEach(images, id: \.self)` pomeni, da se po vrsti bere vsak element polja `images`, sam element se uporabi za razlikovanje posameznih postavk, nato pa se glede na trenutni element ustvari ustrezen view.

Na primer, če je prvi prebrani element `"430F9BEF"`, potem:

```swift
Image(item)
```

Pomeni isto kot:

```swift
Image("430F9BEF")
```

Tudi naslednje slike bodo po vrsti prikazane na enak način.

![image](../../Resource/017_for4.png)

Tudi tukaj še vedno uporabljamo:

```swift
id: \.self
```

Razlog je enak kot prej. Tudi elementi v polju `images` so preprosti nizi, zato je v začetni fazi učenja dovolj, da za razlikovanje uporabimo sam element.

To si lahko preprosto zapomnimo kot stalno pravilo:

**Ko `ForEach` iterira prek preprostega polja, kot sta `String` ali `Int`, običajno zapišemo `id: \.self`.**

### Dodajanje slik

Če bomo pozneje morali dodati nove slike, bo dovolj, da spremenimo vsebino polja:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Ni treba znova pisati nove kode `Image`.

Če je slik veliko, lahko to uporabimo skupaj s `ScrollView`, sicer po preseganju zaslona vsebine ne bo mogoče v celoti predogledati.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Spreminjanje slik

Ko želimo enotno spremeniti slog slik, moramo le spremeniti kodo znotraj `ForEach`.

Na primer, širino spremenimo na `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Tako se bodo vse slike posodobile naenkrat in jih ne bo treba popravljati eno po eno.

To je ena pomembnih vlog `ForEach`:

**Ko ima več view-ov enako strukturo in se razlikuje samo vsebina, zadošča, da view kodo napišemo enkrat, podatki v polju pa določijo, kaj se bo prikazalo.**

## Povzetek

V tej lekciji smo spoznali zanko `for` in `ForEach`.

Zanka `for` se uporablja za zaporedno obdelavo elementov v polju ali obsegu in je bolj usmerjena v obdelavo podatkov.

`ForEach` se v SwiftUI uporablja za večkratno ustvarjanje view-ov glede na vsebino polja in je bolj usmerjen v prikaz uporabniškega vmesnika.

Na trenutni začetni ravni je najpogostejši zapis `ForEach` naslednji:

```swift
ForEach(polje, id: \.self) { element in
    SwiftUI koda
}
```

Tukaj `id: \.self` pomeni, da za razlikovanje vsakega elementa uporabimo sam element.

Ko je vsebina polja preprost tip, kot sta `String` ali `Int`, lahko običajno najprej uporabimo prav ta zapis.

Ko boste pozneje med brskanjem po spletu ali uporabo App videli skupine ponavljajočega se besedila, slik ali druge seznamne vsebine, se lahko spomnite, da se v SwiftUI takšna vsebina običajno najprej da v polje, nato pa se s `ForEach` prikaže po vrsti.
