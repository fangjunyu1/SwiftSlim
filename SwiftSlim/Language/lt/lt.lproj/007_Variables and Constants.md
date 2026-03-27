# Kintamieji ir konstantos

Šioje pamokoje daugiausia mokysimės Swift kintamųjų ir konstantų, taip pat susipažinsime su keliomis dažnai naudojamomis duomenų rūšimis ir pagrindiniais operatoriais.

Šios temos yra pačios programavimo pagrindinės žinios ir svarbus pamatas tolesniam SwiftUI mokymuisi.

## Kintamieji ir konstantos kasdieniame gyvenime

Kintamuosius ir konstantas galime suprasti per kasdienius dalykus.

Kintamieji kasdieniame gyvenime:

- televizoriuje kiekvienos laidos rodomas turinys yra skirtingas
- kiekvienos dienos oras būna kitoks
- laikrodis keičiasi kas sekundę

Visų šių dalykų bendras bruožas yra tas, kad jie keičiasi.

Jei televizorius visada rodytų tik vieną vaizdą, oras visada būtų saulėtas, o laikrodžio rodyklės niekada nejudėtų, tuomet tokie dalykai būtų konstantos.

Vienas gali keistis, o kitas — ne.

## Kintamųjų ir konstantų supratimas

App kūrime dažnai reikia, kad vartotojas įvestų arba išsaugotų tam tikrą informaciją.

Pavyzdžiui:

- paskyros pavadinimą
- gimimo datą
- kontaktinę informaciją
- adresą

Ši informacija bus išsaugota ir vėliau parodyta ekrane.

Pavyzdžiui, jei vartotojas App viduje įveda vardą:

```
FangJunyu
```

Mes turime išsaugoti šį vardą, kad vėliau galėtume jį rodyti programoje.

Šį išsaugojimo procesą galime paprastai įsivaizduoti kaip daikto padėjimą į stalčių.

Kai išsaugome vardą, tai panašu į tai, kad vardą įdedame į stalčių.

Tai, ką reikia saugoti, gali būti daug, todėl ir stalčių gali būti daug. Kad žinotume, kas yra kiekviename stalčiuje, turime kiekvienam jų suteikti pavadinimą.

Pavyzdžiui:

```
name
```

Šiame pavyzdyje `name` yra pavadinimas, o `FangJunyu` — išsaugota informacija.

![Var](../../RESOURCE/007_var.png)

**Swift kalboje, jei reikia išsaugoti duomenis, privaloma naudoti kintamąjį (`var`) arba konstantą (`let`).**

Kadangi vardas paprastai gali būti keičiamas, turėtume naudoti kintamąjį.

```swift
var name = "FangJunyu"
```

Čia deklaruojamas kintamasis pavadinimu `name`, jo tipas yra `String`, o reikšmė — `"FangJunyu"`.

### Kintamųjų ir konstantų skirtumas

Kintamieji deklaruojami naudojant `var`:

```swift
var
```

Konstantos deklaruojamos naudojant `let`:

```swift
let
```

Pavyzdžiui:

```swift
var name = "FangJunyu"
let id = 123456
```

Jei deklaruojame kaip kintamąjį, tai reiškia, kad reikšmė gali būti keičiama; jei deklaruojame kaip konstantą, reikšmės daugiau pakeisti negalima.

Todėl pagrindinis kintamojo ir konstantos skirtumas yra toks: ar leidžiama keisti reikšmę.

### Konstantos keitimas

Jei kodas bando pakeisti konstantos reikšmę:

```swift
let name = "Sam"
name = "Bob"
```

Swift praneš, kad priskyrimo atlikti negalima, nes tai yra konstanta.

```
Cannot assign to property: 'name' is a 'let' constant
```

Toks mechanizmas padeda kūrėjams išvengti situacijų, kai kai kurie svarbūs duomenys netyčia pakeičiami.

### Rodymas SwiftUI aplinkoje

Atidarykite `ContentView.swift` failą ir View viduje deklaruokite kintamąjį:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Čia deklaruojamas kintamasis `name`, o per `Text` jis parodomas sąsajoje.

Jei pakeisime kintamojo turinį:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

`Text` rodomas tekstas taip pat pasikeis.

Tokiu būdu galime naudoti kintamuosius, kad valdytume, kas rodoma sąsajoje, o ne kiekvieną kartą tiesiogiai keisti tekstą `Text` viduje.

Jei kitur reikėtų šios informacijos, galėtume perduoti patį kintamąjį — tai panašu į tai, kad „stalčiuje“ esantį turinį perduodame naudoti kitai vietai.

### Kintamųjų ir konstantų vieta SwiftUI aplinkoje

SwiftUI aplinkoje kintamieji ir konstantos dažniausiai rašomi už `body` ribų:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Žinoma, kintamuosius ir konstantas galima rašyti ir `body` viduje:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Tačiau tarp šių dviejų būdų yra svarbus skirtumas:

- jei kintamasis ar konstanta rašomi `body` viduje, kiekvieną kartą perskaičiuojant vaizdą šis kintamasis bus sukuriamas iš naujo
- jei jie rašomi už `body` ribų, kintamasis egzistuos kaip vaizdo struktūros savybė, todėl kodo struktūra bus aiškesnė

Todėl praktiniame kūrime kintamieji ir konstantos dažniausiai rašomi už `body` ribų.

## Duomenų tipai

Kintamieji gali saugoti daug skirtingų tipų duomenis, o šie tipai vadinami duomenų tipais.

Pavyzdžiui, anksčiau rodėme tekstą su `Text`:

```swift
Text("Hello, World")
```

Čia `"Hello, World"` yra eilutės (`String`) tipas.

Eilutės naudojamos tekstiniam turiniui išreikšti, o Swift kalboje jos turi būti apgaubtos dvigubomis kabutėmis `""`.

Pavyzdžiui:

```swift
var hello = "Hello, World"
```

Be eilučių, Swift taip pat turi daug kitų duomenų tipų.

Pradiniame etape dažniausiai sutinkami keturi tipai:

- String
- Int
- Double
- Bool

Šių keturių tipų pakanka didžiajai daliai pagrindinio duomenų apdorojimo.

**String**

`String` reiškia tekstinį turinį, pavyzdžiui:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Eilutės dažniausiai naudojamos tokiems dalykams kaip vartotojo vardas, pavadinimas ar kitas tekstinis turinys.

**Int**

`Int` reiškia sveikąjį skaičių, tai yra skaičių be trupmeninės dalies.

Pavyzdžiui:

```swift
var age = 26
var count = 100
```

Sveikieji skaičiai dažniausiai naudojami amžiui, kiekiui, skaičiavimams ir pan.

**Double**

`Double` reiškia skaičių su trupmenine dalimi.

Pavyzdžiui:

```swift
var weight = 74.5
var height = 185.0
```

Swift aplinkoje trupmeniniai skaičiai pagal nutylėjimą dažniausiai yra `Double` tipo.

Yra dar panašus tipas `Float`, tačiau jis gali reprezentuoti mažesnį skaičių intervalą, todėl praktiniame kūrime dažniau naudojamas `Double`.

**Bool**

`Bool` tipas naudojamas dviem būsenoms žymėti: `true` ir `false`.

Pavyzdžiui:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` dažnai naudojamas sąlygoms tikrinti. Pavyzdžiui, ar reikia rodyti priminimo langą.

Situacijoms, kuriose yra tik du galimi rezultatai, `Bool` tipas yra ypač tinkamas.

### Rodymas SwiftUI aplinkoje

Kai norime rodyti `String` tipą, galime tiesiogiai naudoti `Text`:

```swift
Text(name)
```

Tačiau `Int`, `Double` ir kiti tokie tipai nėra eilutės, todėl jų negalima tiesiogiai naudoti kaip teksto turinio dalies.

Jei norime juos parodyti `Text`, galime naudoti eilutės interpolaciją (String Interpolation):

```swift
\()
```

Eilutės interpolacija turi būti rašoma eilutės viduje ir naudoti `\()` kintamajam ar konstantai apgaubti.

Pavyzdžiui:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Aukščiau esančiame kode `""` reiškia eilutę, o `\()` naudojamas tam, kad į eilutę įterptume kintamąjį ar konstantą.

Pavyzdžiui:

```swift
"DoubleNum: \(num * 2)"
```

Rodomas turinys bus:

```swift
DoubleNum: 2
```

Tokiu būdu galime į eilutę įterpti kintamuosius ar konstantas ir tada naudoti `Text`, kad parodytume juos sąsajoje.

Patarimas: `\()` gali būti naudojamas tik eilutės `""` viduje.

## Operatoriai

Deklaruodami kintamąjį ar konstantą, dažnai matome tokį užrašymą:

```swift
var num = 1
```

Čia `=` vadinamas priskyrimo operatoriumi.

Jo paskirtis yra tokia: dešinėje pusėje esanti reikšmė priskiriama kairėje pusėje esančiam kintamajam.

Šiame pavyzdyje `1` priskiriamas kintamajam `num`.

Be priskyrimo operatoriaus, yra ir keli dažni skaitiniai operatoriai:

- `+`
- `-`
- `*`
- `/`

Kai atliekame skaičiavimus su skaičiais, pavyzdžiui `Int` arba `Double` tipo duomenimis, naudojame būtent šiuos operatorius.

Pavyzdžiui:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Po skaičiavimo rezultatas išsaugomas kintamajame.

## Santrauka

Kintamieji, konstantos ir operatoriai yra pačios pagrindinės programavimo sąvokos.

Naudodami kintamuosius ir konstantas galime programoje saugoti įvairius duomenis; naudodami duomenų tipus galime aiškiai apibrėžti, kokie tai duomenys; naudodami operatorius galime atlikti skaičiavimus ir duomenų apdorojimą.

Šios žinios yra tarsi pagrindiniai programavimo pasaulio įrankiai. Jas įvaldę, sukursite tvirtą pagrindą tolesniam Swift ir SwiftUI mokymuisi。
