# Ciklai ir sąrašai

Šioje pamokoje mokysimės Swift kalbos `for` ciklo ir SwiftUI `ForEach`.

Abu jie padeda nuosekliai perskaityti masyvo elementus. Realiame programų kūrime mums labai dažnai reikia po vieną paimti grupę duomenų, o tada juos apdoroti arba parodyti, ir ciklas būtent yra svarbus įrankis tokiam darbui atlikti.

Kai naršome internete arba naudojame App, dažnai matome daug sąrašų ar įrašų. Toks turinys paprastai pirmiausia saugomas `masyve`, o tada per `ciklą` paeiliui išskaitomas ir galiausiai parodomas sąsajoje.

Pavyzdžiui, Google paieškos rezultatų sąrašas:

![Google](../../Resource/017_google.png)

Kiekvienas paieškos rezultatų sąrašo įrašas dažniausiai atitinka vieną duomenų elementą ir per ciklą yra parodomas paeiliui.

Todėl `masyvai` ir `ciklai` dažnai pasirodo kartu. `Masyvas` atsako už duomenų grupės saugojimą, o `ciklas` atsako už tai, kad šie duomenys būtų paeiliui paimti ir su jais būtų atliktas tas pats veiksmas.

Toliau pirmiausia pradėkime nuo pačio paprasčiausio `for` ciklo.

## Atgalinis skaičiavimas

Tarkime, norime imituoti atgalinio skaičiavimo funkciją ir paeiliui išvesti `„5、4、3、2、1“`.

Tiesiausias užrašymo būdas būtų toks:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Šis būdas gali imituoti atgalinį skaičiavimą, tačiau jei turinio yra daug, jis atrodo labai pasikartojantis, o vėliau jį keisti taip pat nėra patogu.

Tokiu atveju pirmiausia galime sudėti duomenis į masyvą, o tada naudoti `for` ciklą, kad juos paeiliui išvestume:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Toks užrašymas yra glaustesnis ir lengviau išplečiamas. Net jei atgaliniame skaičiavime yra daug skaičių, mums nereikia eilutė po eilutės kartoti `print`, tereikia leisti ciklui automatiškai apdoroti kiekvieną masyvo elementą.

Šį kodą galime įdėti į mygtuką ir išbandyti:

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

Kai paspaudžiamas mygtukas, `for` ciklas pagal masyvo eilę paeiliui paima kiekvieną `countDown` esantį sveikąjį skaičių ir išspausdina jį į konsolę.

Toliau pažiūrėkime, kaip veikia `for` ciklas.

## for ciklas

`for` ciklas naudojamas nuosekliai apdoroti duomenų grupę, o dažniausiai tai būna masyvai ir intervalai.

Pagrindinis užrašymas:

```swift
for elementas in masyvas arba intervalas {
    vykdomas kodas
}
```

Pavyzdžiui, ką tik buvęs atgalinio skaičiavimo kodas:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Čia `i` reiškia šiuo metu paimtą elementą, o po `in` eina duomenys, kuriuos reikia kartoti, tai yra masyvas `countDown`.

Šio kodo reikšmė tokia: programa paeiliui paima kiekvieną elementą iš masyvo `countDown`. Kiekvieną kartą paėmus vieną elementą, jis laikinai pažymimas kaip `i`, o tada vykdomas kodas, esantis riestiniuose skliaustuose.

Vykdymo procesą galima suprasti taip:

* Pirmą kartą paimamas `5`, todėl tuo metu `i` reikšmė yra `5`
* Vykdomas `print(i)` ir išvedamas `5`
* Tada toliau paimamas kitas elementas `4`
* Vėl vykdomas `print(i)` ir išvedamas `4`

Toliau esantys `3`、`2`、`1` taip pat bus vykdomi tokiu pačiu būdu paeiliui.

![for](../../Resource/017_for.png)

Kai visi masyvo elementai būna apdoroti, `for` ciklas automatiškai baigiasi.

Naudodami `for` ciklą galime gauti kiekvieną masyvo elementą ir įgyvendinti, pavyzdžiui, atgalinį skaičiavimą.

**Pastaba**: `i` yra labai dažnas pavadinimas `for` cikle, naudojamas dabartiniam paimtam elementui žymėti, tačiau tai nėra fiksuotas variantas, galima naudoti ir kitus angliškus pavadinimus.

Pavyzdžiui, naudojant `num`, kad reikštų kiekvieną paimtą elementą:

```swift
for num in countDown {
    print(num)
}
```

Riestiniuose skliaustuose taip pat reikia naudoti `num`, kad būtų nurodytas šiuo metu paimtas elementas.

### Ciklo intervalas

`for` ciklas gali kartoti ne tik masyvą, bet ir intervalą.

Pavyzdžiui, kai reikia apskaičiuoti visų teigiamų sveikųjų skaičių iki `50` sumą, reikia paeiliui sudėti visus skaičius nuo `1` iki `50`.

Tiesiausias užrašymas galėtų būti toks:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Šio užrašymo problema ta, kad kiekvieną skaičių turėtume parašyti ranka, o tai yra ir nepatogu, ir netinka realioms kūrimo situacijoms.

Tokiu atveju galima naudoti intervalo operatorių kartu su `for` ciklu.

Ankstesniame skyriuje apie „operatorius“ jau mokėmės intervalo operatoriaus:

```swift
1...3   // 1, 2, 3
```

Čia `...` reiškia uždarą intervalą, tai yra apimantį ir pradžią, ir pabaigą.

Todėl čia galima naudoti `for` ciklą su sveikųjų skaičių intervalu nuo `1` iki `50`:

```swift
for i in 1...50 {
    
}
```

Kadangi šiuos skaičius reikia sudėti, mums dar reikia kintamojo, kuris išsaugotų sumą:

```swift
var count = 0
```

Tada kiekvieno ciklo metu dabartinį paimtą skaičių pridedame prie `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Šis kodas reiškia:

* `count` naudojamas dabartinei sumai saugoti
* `for` ciklas paeiliui paima sveikuosius skaičius nuo `1` iki `50`
* Kiekvieną kartą paėmus vieną skaičių, vykdomas `count += i`
* Ciklui pasibaigus, `count` saugo galutinę sumą

Taip galime gauti visų teigiamų sveikųjų skaičių iki `50` sumą.

Lygiai taip pat, jei reikia apskaičiuoti sveikųjų skaičių nuo `1` iki `100` sumą, tereikia pakeisti intervalą:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` ciklas gali kartoti ne tik masyvą, bet ir intervalą. Toks gebėjimas nuosekliai kartoti ir apdoroti duomenis kūrime yra labai dažnas.

Jis padeda mums automatiškai atlikti daug pasikartojančių darbų, nereikalaujant ranka parašyti kiekvieno skaičiaus sudėjimo proceso ar kitų panašių pasikartojančių veiksmų.

## Ciklai SwiftUI aplinkoje

Anksčiau aptartas `for` ciklas priklauso Swift kalbai.

Tačiau SwiftUI aplinkoje mes negalime tiesiogiai naudoti `for` vaizdo struktūroje tam, kad generuotume vaizdus:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Taip yra todėl, kad `VStack` viduje turi būti SwiftUI vaizdai, o paprastas `for` ciklas pats savaime nėra vaizdas.

Jei SwiftUI aplinkoje norime pagal masyvo turinį pakartotinai sukurti sąsajos elementus, turime naudoti `ForEach`.

Pavyzdžiui, jei norime parodyti visų grupės narių vardus, galima rašyti taip:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Rodomas rezultatas:

![for1](../../Resource/017_for1.png)

Tada kiekvienam `Text` pridėkime tuos pačius modifikatorius:

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

Dabar kiekvienas `Text` rodomas mažesniu ir storesniu šriftu.

Rodomas rezultatas:

![](../../Resource/017_for2.png)

Nors modifikatoriai padaro sąsają gražesnę, jie taip pat pailgina kodą ir padaro jį labiau pasikartojantį.

Jei vardų daugėja arba vėliau norime vienu metu pakeisti šriftą, spalvą ir kitus stilius, teks daug kartų kartoti ir taisyti tą patį kodą, o tai bus nepatogu ir sunkiau prižiūrima.

Tokiu atveju galime pirmiausia sudėti šiuos vardus į masyvą, o tada naudoti SwiftUI `ForEach`, kad pagal masyvo duomenis pakartotinai sukurtume vaizdus:

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

Šis kodas yra glaustesnis, `ForEach` paeiliui perskaito kiekvieną masyvo elementą ir atitinkamą turinį parodo sąsajoje.

Kai vėliau pridedame naujus vardus, tereikia pakeisti vardus masyve `names`, nereikia kiekvieną kartą kartoti `Text` ir sudėtingų modifikatorių.

## ForEach

`ForEach` yra SwiftUI struktūra, naudojama pakartotinai generuoti vaizdus. Galima ją suprasti kaip į SwiftUI panašią `for` ciklo struktūrą.

Pagrindinis naudojimas:

```swift
ForEach(masyvas, id: \.self) { elementas in
    SwiftUI kodas
}
```

Pavyzdžiui, ką tik matyti grupės vardai:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Šis kodas reiškia:

`names` yra kartojamas masyvas, tai yra duomenys, kuriuos reikia rodyti.

`id:\.self` reiškia, kad kiekvienam elementui atskirti naudojamas pats masyvo elementas.

Šiame pavyzdyje masyve saugomos eilutės:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Todėl SwiftUI tiesiogiai naudoja pačias eilutes „Sam“、„John“、„Wathon“、„Bob“, kad atskirtų skirtingą turinį.

Pradiniame etape dažniausiai sutinkamiems paprastiems masyvams, tokiems kaip String ir Int, dažniausiai galima tiesiog rašyti taip:

```swift
id: \.self
```

Kol kas pakanka prisiminti tik šį vieną užrašymo būdą, nereikia gilintis į daugiau `id` taisyklių.

`item in` esantis `item` reiškia šiuo metu paimtą elementą.

Pavyzdžiui, pirmo ciklo metu `item` yra `"Sam"`, o antro ciklo metu `item` yra `"John"`.

Todėl:

```swift
Text(item)
```

palaipsniui virsta:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Taigi šio kodo paskirtis yra tokia: paeiliui paimti kiekvieną vardą iš masyvo `names` ir kiekvienam vardui sugeneruoti po vieną `Text` vaizdą.

### Vykdymo procesas

Vykdymo procesą galima suprasti taip:

* `ForEach` pirmiausia perskaito pirmą masyvo `names` elementą `"Sam"`
* `item` laikinai reiškia `"Sam"`
* `Text(item)` parodo `"Sam"`
* Tada toliau perskaitomas kitas elementas `"John"`
* Ir vėl pakartojamas tas pats vaizdo kodas

Galiausiai visi masyvo vardai bus parodyti.

Tokio užrašymo pranašumas tas, kad kai vardų daugėja, nereikia kartoti daugybės `Text`, užtenka keisti masyvo turinį.

### Nuotraukų kartojimas

`ForEach` gali rodyti ne tik tekstą, bet ir paveikslėlius, spalvas ar kitus SwiftUI vaizdus.

Pavyzdžiui, paruošėme 4 paveikslėlius:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Įtempkite šiuos keturis paveikslėlius į Xcode Assets aplanką.

![image](../../Resource/017_for3.png)

Jei nenaudotume `ForEach`, kiekvieną paveikslėlį turėtume parašyti ranka:

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

Rodomas rezultatas:

![image](../../Resource/017_for4.png)

Toks užrašymas leidžia įgyvendinti funkciją, tačiau kodas tampa gana ilgas.

Jei paveikslėlių vis daugės, teks kartoti vis daugiau `Image` kodo.

Vėliau, jei norėsime vienodai pakeisti paveikslėlių dydį, taip pat teks juos taisyti po vieną.

Tokiu atveju galima sudėti paveikslėlių pavadinimus į masyvą, o tada naudoti `ForEach`, kad pakartotinai sugeneruotume paveikslėlių vaizdus:

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

Čia `images` yra eilučių masyvas, o kiekvienas masyvo elementas yra paveikslėlio pavadinimas.

`ForEach(images, id: \.self)` reiškia, kad paeiliui perskaitomas kiekvienas masyvo `images` elementas, pats elementas naudojamas kiekvienam įrašui atskirti, o tada pagal dabartinį elementą sugeneruojamas atitinkamas vaizdas.

Pavyzdžiui, jei pirmą kartą perskaitomas `"430F9BEF"`, tuomet:

```swift
Image(item)
```

atitinka:

```swift
Image("430F9BEF")
```

Likę paveikslėliai taip pat bus parodyti tokiu pačiu būdu paeiliui.

![image](../../Resource/017_for4.png)

Čia vis dar naudojame:

```swift
id: \.self
```

Priežastis ta pati kaip ir anksčiau: masyvo `images` elementai taip pat yra paprastos eilutės, todėl pradiniame etape galime tiesiog naudoti patį elementą kaip atskyrimo būdą.

Galima paprastai tai suprasti kaip vieną fiksuotą formulę:

**Kai `ForEach` kartoja paprastą masyvą, pvz., `String` arba `Int`, dažniausiai rašoma `id: \.self`.**

### Paveikslėlių pridėjimas

Jei vėliau reikės pridėti daugiau paveikslėlių, pakaks pakeisti masyvo turinį:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nebereikia kartoti naujo `Image` kodo.

Jei paveikslėlių yra daug, galima naudoti kartu su `ScrollView`, kitaip turinys išeis už ekrano ribų ir jo nebus galima pilnai peržiūrėti.

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

### Paveikslėlių keitimas

Kai reikia vienodai pakeisti paveikslėlių stilių, užtenka pakeisti kodą `ForEach` viduje.

Pavyzdžiui, pakeisti plotį į `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Tokiu būdu visi paveikslėliai pasikeis kartu, nereikės jų taisyti po vieną.

Tai yra viena svarbių `ForEach` paskirčių:

**Kai kelių vaizdų struktūra yra vienoda, o skiriasi tik turinys, galima parašyti tik vieną vaizdo kodą, o tada leisti masyvo duomenims nuspręsti, kas bus rodoma.**

## Santrauka

Šioje pamokoje išmokome `for` ciklą ir `ForEach`.

`for` ciklas naudojamas nuosekliai apdoroti masyvo ar intervalo elementus ir labiau orientuotas į duomenų apdorojimą.

`ForEach` naudojamas SwiftUI aplinkoje tam, kad pagal masyvo turinį pakartotinai generuotų vaizdus, todėl jis labiau orientuotas į vaizdo rodymą.

Dabartiniame pradiniame etape dažniausiai naudojamas `ForEach` užrašymas yra toks:

```swift
ForEach(masyvas, id: \.self) { elementas in
    SwiftUI kodas
}
```

Čia `id: \.self` reiškia, kad kiekvienam elementui atskirti naudojamas pats elementas.

Kai masyvo turinys yra tokio paprasto tipo kaip `String` ar `Int`, dažniausiai galime pirmiausia naudoti būtent šį vieną variantą.

Ateityje, kai naršydami interneto puslapius ar App matysite pasikartojantį tekstą, paveikslėlius ar kitą sąrašinį turinį, galite prisiminti, kad SwiftUI aplinkoje toks turinys dažniausiai pirmiausia sudedamas į masyvą, o tada per `ForEach` paeiliui parodomas.
