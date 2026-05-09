# Apskaičiuojamoji savybė

Šioje pamokoje daugiausia mokysimės apie apskaičiuojamąsias savybes.

Apskaičiuojamoji savybė naudojama tada, kai pagal jau turimus duomenis reikia apskaičiuoti naują rezultatą. Ji gali apskaičiuoti skaitines reikšmes, taip pat turinį, kurį reikia rodyti SwiftUI vaizde.

Pavyzdžiui:

```swift
let a = 10
let b = 20
let c = a + b
```

Čia `c` reiškia rezultatą, gautą sudėjus `a` ir `b`.

Įprastame kode toks rašymo būdas labai dažnas.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Pastaba: `Button` paspaudimo įvykyje galima vykdyti įprastą Swift kodą.

Tačiau jei panašų kodą tiesiogiai parašysime SwiftUI vaizdo savybėse, susidursime su problema.

Pavyzdžiui:

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

Šis kodas sukels klaidą.

Iš pirmo žvilgsnio atrodo, kad `a` ir `b` jau parašyti prieš `c`, todėl `c` reikšmę lyg ir būtų galima apskaičiuoti.

Tačiau deklaruojant struktūros savybes, tokio rašymo būdo tiesiogiai naudoti negalima.

## Kodėl c negalima tiesiogiai apskaičiuoti kaip a + b?

Nes `a`, `b`, `c` nėra laikinos konstantos mygtuko paspaudimo įvykyje. Tai yra `ContentView` vaizdo savybės.

Mygtuko paspaudimo įvykyje šis kodas gali būti vykdomas įprastai:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Taip yra todėl, kad paspaudus mygtuką kodas vykdomas iš eilės. Pirmiausia sukuriamas `a`, tada sukuriamas `b`, o galiausiai naudojant `a + b` apskaičiuojamas `c`.

Tačiau deklaruojant savybes vaizdo viduje situacija kitokia:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Čia `a`, `b`, `c` visos yra `ContentView` vaizdo savybės.

Kuriant `ContentView` vaizdą, Swift pirmiausia turi paruošti šias savybes. Kad kūrimo procesas būtų saugus, Swift neleidžia vienos egzemplioriaus saugomos savybės numatytojoje reikšmėje tiesiogiai skaityti kitų to paties egzemplioriaus savybių.

Todėl ši eilutė sukels klaidą:

```swift
let c = a + b
```

Paprastai galima suprasti taip: **deklaruojant savybes vaizdo viduje, negalima viena įprasta savybe tiesiogiai apskaičiuoti kitos įprastos savybės.**

Tokia savybė, kuri tiesiogiai saugo reikšmę, vadinama „saugoma savybe“. Kad būtų lengviau suprasti, laikinai ją galima laikyti įprasta savybe.

Pavyzdžiui:

```swift
let a = 10
```

`a` saugo `10`.

```swift
let b = 20
```

`b` saugo `20`.

Tačiau:

```swift
let c = a + b
```

Čia `c` nėra tiesiogiai įrašyta pastovi reikšmė. Tikimasi, kad ji bus apskaičiuota pagal `a + b`.

Tokiai situacijai, kai „pagal jau turimus duomenis gaunamas rezultatas“, labiau tinka apskaičiuojamoji savybė.

Galima pakeisti taip:

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

Čia `c` yra apskaičiuojamoji savybė.

```swift
var c: Int {
    return a + b
}
```

Tai reiškia: **kai reikia naudoti `c`, tada perskaitomi `a` ir `b`, o `a + b` rezultatas grąžinamas.**

Pavyzdžiui:

```swift
Text("c: \(c)")
```

Kai `Text` rodo `c`, tik tada suaktyvinamas `c` skaičiavimas.

## Kas yra apskaičiuojamoji savybė?

Apskaičiuojamoji savybė atrodo kaip kintamasis, bet pati duomenų nesaugo.

Pavyzdžiui:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Čia `c` yra apskaičiuojamoji savybė.

Ji nesaugo fiksuotos reikšmės kaip įprasta savybė. Kiekvieną kartą skaitant `c`, iš naujo vykdomas `{}` viduje esantis kodas ir grąžinamas apskaičiuotas rezultatas.

Galima suprasti taip:

```swift
var c: Int {
    return a + b
}
```

Kai reikia naudoti `c`, apskaičiuojama `a + b`.

Todėl apskaičiuojamoji savybė tinka tokiai situacijai: **rezultato nereikia saugoti atskirai, nes jį galima apskaičiuoti pagal jau turimus duomenis.**

## Pagrindinis rašymo būdas

Apskaičiuojamoji savybė paprastai susideda iš trijų dalių:

```swift
var c: Int {
    return a + b
}
```

### 1. Deklaruojama naudojant `var`

```swift
var c
```

Apskaičiuojamąją savybę būtina deklaruoti naudojant `var`, negalima naudoti `let`.

Nes apskaičiuojamoji savybė nėra fiksuotai saugoma reikšmė. Tai rezultatas, kuris dinamiškai apskaičiuojamas kiekvieną kartą ją skaitant.

### 2. Nurodomas grąžinamas tipas

```swift
var c: Int
```

Apskaičiuojamoji savybė turi nurodyti grąžinamą tipą.

Čia `c` galiausiai grąžins sveikąjį skaičių, todėl tipas yra `Int`.

### 3. Skaičiavimo logika rašoma {} viduje

```swift
{
    return a + b
}
```

`{}` viduje rašoma skaičiavimo logika. Čia grąžinama `a + b`.

## return raktažodis

Apskaičiuojamoji savybė turi grąžinti rezultatą.

Pavyzdžiui:

```swift
var c: Int {
    return a + b
}
```

Čia `return` reiškia: grąžinti `a + b` skaičiavimo rezultatą.

Jei apskaičiuojamojoje savybėje yra tik viena išraiška, tiesiogiai sukurianti rezultatą, `return` galima praleisti:

```swift
var c: Int {
    a + b
}
```

Tačiau jei apskaičiuojamojoje savybėje yra kelios kodo eilutės, reikia naudoti `return`, kad aiškiai būtų nurodytas grąžinamas rezultatas.

Pavyzdžiui:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Čia skaičiavimo procesas padalytas į du žingsnius.

Pirmas žingsnis — apskaičiuoti bendrą kainą:

```swift
let total = count * price
```

Antras žingsnis — sujungti bendrą kainą į tekstą ir ją grąžinti:

```swift
return "Total：\(total) $"
```

Jei pašalinsime `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Šis kodas sukels klaidą.

Priežastis: **šioje apskaičiuojamojoje savybėje jau yra kelios kodo eilutės, todėl Swift nebegali automatiškai nustatyti, kuri eilutė yra galutinis grąžinamas rezultatas.**

Todėl, kai apskaičiuojamojoje savybėje yra tik viena rezultatą sukurianti išraiška, `return` galima praleisti.

```swift
var c: Int {
    a + b
}
```

Kai apskaičiuojamojoje savybėje yra kelios kodo eilutės, rekomenduojama aiškiai parašyti `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Apskaičiuojamosios savybės ir įprastos savybės skirtumas

Įprasta savybė saugo duomenis.

```swift
var c = 30
```

Čia `c` saugo konkrečią reikšmę: `30`.

Apskaičiuojamoji savybė duomenų nesaugo.

```swift
var c: Int {
    a + b
}
```

Čia `c` nesaugo `30`. Ji tik pateikia skaičiavimo būdą.

Kai skaitoma `c`, Swift vykdo:

```swift
a + b
```

Tada grąžina apskaičiuotą rezultatą.

Todėl apskaičiuojamoji savybė tinka situacijoms, kai rezultatą reikia apskaičiuoti pagal kitus duomenis.

## body taip pat yra apskaičiuojamoji savybė

Išmokus apskaičiuojamąsias savybes, galima iš naujo suprasti dažniausiai SwiftUI matomą kodo dalį:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Čia `body` taip pat yra apskaičiuojamoji savybė.

Ji deklaruojama naudojant `var`:

```swift
var body
```

Ji turi grąžinamą tipą:

```swift
some View
```

Jos `{}` viduje grąžinamas SwiftUI vaizdo turinys:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Todėl `body` galima suprasti taip: kai SwiftUI reikia parodyti šį vaizdą, ji perskaito `body` ir pagal `body` grąžintą turinį sukuria sąsają.

Jei parašytume `return`, tai būtų galima suprasti taip:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tačiau SwiftUI paprastai praleidžiame `return` ir tiesiog rašome taip:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Kai pasikeičia `@State` duomenys, SwiftUI iš naujo perskaito `body` ir pagal naujus duomenis atnaujina sąsają.

Pavyzdžiui:

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

Paspaudus mygtuką, `count` pasikeičia.

```swift
count += 1
```

Kai `count` pasikeičia, SwiftUI iš naujo apskaičiuoja `body`, todėl sąsajoje esantis tekstas taip pat atnaujinamas.

```swift
Text("count: \(count)")
```

Tai taip pat paaiškina, kodėl SwiftUI sąsaja gali automatiškai atsinaujinti pasikeitus duomenims.

### Nerekomenduojama body viduje rašyti sudėtingų skaičiavimų

Kadangi `body` yra apskaičiuojamoji savybė, ji gali būti skaitoma ir perskaičiuojama daug kartų.

Pavyzdžiui:

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

Kai `name` pasikeičia, SwiftUI iš naujo apskaičiuoja `body`.

Tuo metu `body` viduje esantis kodas taip pat vykdomas iš naujo, o `num` taip pat sukuriamas iš naujo.

```swift
let num = 10
```

Šiame pavyzdyje `num` yra labai paprastas, todėl poveikis nėra didelis.

Tačiau jei `body` viduje vykdomi sudėtingi skaičiavimai, pavyzdžiui, didelio kiekio duomenų filtravimas, rūšiavimas, vaizdų apdorojimas ir pan., tai gali paveikti sąsajos sklandumą.

Todėl SwiftUI viduje `body` daugiausia turėtų būti atsakingas už sąsajos struktūros aprašymą.

Paprastus laikinus duomenis galima rašyti `body` viduje.

Sudėtingus skaičiavimus geriau iškelti į apskaičiuojamąją savybę, metodą arba atskirą duomenų apdorojimo dalį už `body` ribų.

## Pavyzdys: kiekis ir bendra kaina

Toliau per paprastą pavyzdį suprasime apskaičiuojamąją savybę.

Tarkime, vienos morkos kaina yra 2 $. Vartotojas gali paspausti mygtuką ir pakeisti perkamą kiekį, o sąsajoje reikia rodyti bendrą kainą.

Bendros kainos skaičiavimo būdas:

```text
Kiekis * Vieneto kaina
```

Jei bendrą kainą saugotume įprastame kintamajame, tai būtų gana nepatogu.

Nes kiekvieną kartą pasikeitus kiekiui reikėtų rankiniu būdu atnaujinti bendrą kainą.

Geresnis būdas — naudoti apskaičiuojamąją savybę:

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

Rodomas rezultatas:

![view](../../Resource/024_view.png)

Šiame pavyzdyje:

```swift
@State private var count = 1
```

`count` reiškia morkų kiekį. Paspaudus mygtuką, `count` pasikeičia.

```swift
private let price = 2
```

`price` reiškia vienos morkos kainą. Čia tai yra fiksuota reikšmė, todėl naudojamas `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` reiškia bendrą kainą.

Jos nereikia saugoti atskirai, nes bendra kaina visada gali būti apskaičiuota pagal `count * price`.

Kai `count` yra `1`:

```swift
totalPrice = 1 * 2
```

Rodomas rezultatas yra:

```swift
totalPrice: 2 $
```

Paspaudus `+` mygtuką, `count` tampa `2`.

Tada, kai vėl skaitomas `totalPrice`, jis apskaičiuojamas iš naujo:

```swift
totalPrice = 2 * 2
```

Rodomas rezultatas yra:

```swift
totalPrice: 4 $
```

Tai ir yra apskaičiuojamosios savybės paskirtis: pagal jau turimus duomenis dinamiškai apskaičiuoti naują rezultatą.

## Apskaičiuojamoji savybė gali būti naudojama sąlygai tikrinti

Apskaičiuojamoji savybė gali ne tik apskaičiuoti skaičius, bet ir grąžinti tikrinimo rezultatą.

Pavyzdžiui, kai norime, kad mažiausias kiekis būtų 1.

Kai kiekis jau yra 1, `-` mygtukas neturėtų jo toliau mažinti.

Galima pridėti tokią apskaičiuojamąją savybę:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Visas kodas:

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

Rodomas rezultatas:

![view](../../Resource/024_view1.png)

Čia:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Šis kodas reiškia, ar šiuo metu dar galima mažinti.

Kai `count` yra didesnis nei `1`:

```swift
canDecrease == true
```

Tai reiškia, kad galima mažinti.

Kai `count` yra lygus `1`:

```swift
canDecrease == false
```

Tai reiškia, kad toliau mažinti negalima.

### Sąlygos tikrinimas mygtuke

Mygtuke naudojama:

```swift
if canDecrease {
    count -= 1
}
```

Tik kai `canDecrease` yra `true`, galima sumažinti `count`.

### Vaizdo priekinės spalvos valdymas

Taip pat galima naudoti `canDecrease` mygtuko priekinei spalvai valdyti:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Čia naudojamas trinaris operatorius:

```swift
canDecrease ? Color.primary : Color.gray
```

Šio kodo prasmė: jei `canDecrease` yra `true`, priekinė spalva bus `Color.primary`; jei `canDecrease` yra `false`, priekinė spalva bus `Color.gray`.

`Color.primary` yra SwiftUI teikiama sistemos semantinė spalva. Ji reiškia pagrindinę teksto spalvą dabartinėje sąsajoje.

Šviesiame režime `Color.primary` paprastai yra artima juodai spalvai; tamsiame režime paprastai artima baltai spalvai.

Todėl `Color.primary` privalumas yra tas, kad ji automatiškai prisitaiko prie šviesaus ir tamsaus režimų.

### Vaizdo išjungtos būsenos valdymas

`disabled` naudojamas valdyti, ar vaizdas yra išjungtos būsenos:

```swift
.disabled(!canDecrease)
```

Kai `disabled` yra `false`, vaizdą galima paspausti.

Kai `disabled` yra `true`, vaizdas yra išjungtas ir jo paspausti negalima.

Čia `canDecrease` naudojamas kaip sąlyga, todėl kodą lengviau suprasti.

Pamačius `canDecrease`, iš karto galima suprasti, kad tai reiškia „ar šiuo metu dar galima mažinti“.

### Papildomas paaiškinimas: kodėl tikrinama du kartus?

`-` mygtuke:

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

Čia naudojamas ir `.disabled(!canDecrease)`, ir `if canDecrease` mygtuko viduje.

`.disabled(!canDecrease)` atsakingas už mygtuko išjungimą sąsajos lygiu, kad vartotojas negalėtų jo paspausti.

`if canDecrease` dar kartą patikrina prieš vykdant kodą ir tik tada, kai galima mažinti, vykdo `count -= 1`.

Tai yra dviguba apsauga. Praktiniame kūrime, jei mygtukas jau išjungtas, vidinį tikrinimą galima praleisti. Tačiau mokomajame pavyzdyje jį palikus galima aiškiau parodyti `canDecrease` paskirtį.

## Santrauka

Šioje pamokoje daugiausia mokėmės apie apskaičiuojamąją savybę.

Apskaičiuojamoji savybė tiesiogiai nesaugo reikšmės. Ji, kai yra skaitoma, pagal jau turimus duomenis apskaičiuoja rezultatą.

Pavyzdžiui:

```swift
var c: Int {
    a + b
}
```

Čia `c` nereikia saugoti atskirai, nes ją galima apskaičiuoti pagal `a + b`.

Apskaičiuojamoji savybė turi būti deklaruojama naudojant `var`, taip pat reikia nurodyti grąžinamą tipą.

```swift
var canDecrease: Bool {
    count > 1
}
```

Apskaičiuojamoji savybė gali grąžinti ne tik skaitinę reikšmę, bet ir sąlygos rezultatą, tekstinį turinį ar net SwiftUI vaizdo turinį.

Šioje pamokoje taip pat išmokome `return`.

`return` reiškia rezultato grąžinimą:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Jei apskaičiuojamojoje savybėje yra tik viena tiesiogiai rezultatą sukurianti išraiška, `return` galima praleisti.

```swift
var totalPrice: Int {
    count * price
}
```

Taip pat susipažinome su `Color.primary` ir `disabled`.

`Color.primary` yra SwiftUI sistemos semantinė spalva. Ji automatiškai prisitaiko prie šviesaus ir tamsaus režimų.

```swift
.foregroundStyle(Color.primary)
```

`disabled` naudojamas valdyti, ar vaizdas išjungtas.

```swift
.disabled(true)
```

Reiškia, kad vaizdas išjungtas ir jo paspausti negalima.

```swift
.disabled(false)
```

Reiškia, kad vaizdas pasiekiamas ir jį galima paspausti.

Todėl apskaičiuojamoji savybė SwiftUI naudojama labai dažnai. Ji padeda aiškiau sutvarkyti skaičiavimo rezultatus, sąlygas ir rodomą turinį.
