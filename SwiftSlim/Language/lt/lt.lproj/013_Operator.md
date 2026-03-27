# Operatoriai

Šioje pamokoje mokysimės Swift operatorių (`Operators`).

Kai atliekame skaičiavimus, palyginimus ar loginį vertinimą, turime naudoti operatorius. Šie veiksmai persmelkia visą programos vykdymą ir yra vienas pačių pagrindinių programavimo gebėjimų.

```swift
let a = 100 * 8
```

Mokantis programuoti daugelis pastebi, kad žmonės, turintys bent šiek tiek matematinio mąstymo, dažnai lengviau supranta programos logiką. Taip yra todėl, kad programavimo esmė neatsiejama nuo „skaičiavimo“ ir „taisyklių tikrinimo“, o tai ir yra pagrindinė operatorių paskirtis.

Praktiniame kūrime operatoriai naudojami ne tik paprastiems skaičiavimams, bet ir labai konkrečiose situacijose.

Pavyzdžiui, žaidime su kaladėlėmis, kai naudotojas nutempia vieną bloką į tam tikrą vietą, reikia apskaičiuoti:

- bloko koordinates
- vietas, kuriose blokas gali būti įterptas
- ar tikslinė vieta yra tinkama

Šis „skaičiavimo + tikrinimo“ procesas iš esmės remiasi operatoriais.

![Block](../../Resource/013_block.png)

Operatorių mokymasis nėra vien skaičių skaičiavimas - tai pagrindas būsimam sąsajos išdėstymui, duomenų apdorojimui ir sąveikos logikai.

## Kaip atliekami skaičiavimai SwiftUI aplinkoje

SwiftUI sistemoje paprastai naudojame `Button`, kad iškviestume funkciją, o pačioje funkcijoje atliekame skaičiavimo logiką.

Pavyzdžiui:

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

Kai mygtukas paspaudžiamas, `Console` rodo:

```
c: 20
```

Šioje pamokoje visą skaičiavimo logiką vieningai rašysime `func` viduje, vykdymą paleisime per mygtuką, o rezultatą parodysime su `print`.

Vėlesniuose pavyzdžiuose, kad kodas būtų trumpesnis, skaičiavimo rezultatą žymėsime tiesiog komentaruose ir nebekartosime `print` išvesties.

## `Console` išvesties valdymas

Kadangi kiekvienas paspaudimas sukuria išvesties informaciją, galima paspausti valymo mygtuką dešiniajame apatiniame `Console` kampe ir išvalyti ankstesnius žurnalus, kad būtų lengviau matyti dabartinį rezultatą.

![Console](../../Resource/013_console.png)

## Kitas `Button` rašymo būdas

Kai mygtukas vykdo tik vieną funkciją, galima naudoti glaustesnį rašymo būdą:

```swift
Button(action: ) {
    // View
}
```

Šiame rašyme `action` nurodo funkciją, kuri turi būti vykdoma paspaudus mygtuką (funkcija be parametrų), o `{}` apibrėžia mygtuko vaizdą.

Sujungus tai su prieš tai buvusia funkcija `calculate`, galima rašyti taip:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Kai mygtukas paspaudžiamas, `calculate` funkcija bus iškviesta tiesiogiai.

Todėl, kai mygtuko logika paprasta ir tereikia iškviesti vieną funkciją, `action` rašymo būdas yra aiškesnis ir labiau atitinka gero kodo stilių.

## Aritmetiniai operatoriai

Aritmetiniai operatoriai (`Arithmetic Operators`) naudojami skaičiavimams:

- `+` sudėtis
- `-` atimtis
- `*` daugyba
- `/` dalyba
- `%` liekana

Pavyzdys:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Svarbu: Swift yra stipriai tipizuota kalba, todėl ji automatiškai nemaišo skirtingų duomenų tipų:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Kai tipai skiriasi, reikia rankiniu būdu atlikti konvertavimą.

## Palyginimo operatoriai

Palyginimo operatoriai (`Comparison Operators`) naudojami dviejų reikšmių santykiui patikrinti, o jų rezultatas yra `Bool`:

- `==` lygu
- `!=` nelygu
- `>` daugiau nei
- `<` mažiau nei
- `>=` daugiau arba lygu
- `<=` mažiau arba lygu

Pavyzdys:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Palyginimo operatoriai dažnai naudojami sąlyginėse išraiškose. Pavyzdžiui, „citatų karuselėje“ turime užtikrinti, kad indeksas neviršytų masyvo ribų:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jei `index` mažesnis už `sayings.count - 1`, palyginimo rezultatas yra `true`, todėl `if` viduje esantis kodas vykdomas; jei rezultatas yra `false`, paskesnis kodas nevykdomas.

## Loginiai operatoriai

Loginiai operatoriai (`Logical Operators`) naudojami kelioms sąlygoms jungti:

- `&&` ir (`AND`)
- `||` arba (`OR`)
- `!` ne (`NOT`)

### `&&` ir

Kai kelios sąlygos turi būti teisingos vienu metu, naudojamas `&&`.

Pavyzdžiui:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Šiame kode yra dvi sąlygos: `age >= 18` ir `age <= 100`.

Tik tada, kai abi jos yra `true`, `legalAge` taip pat bus `true`; jei bent viena neteisinga, rezultatas bus `false`.

### `||` arba

Kai reikia, kad būtų tenkinama bent viena iš kelių sąlygų, naudojamas `||`.

Pavyzdžiui:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Šis kodas reiškia, kad jei bent viena iš sąlygų `money >= 50` arba `creditCard >= 50` yra teisinga, `payAllowed` bus `true`.

Tik kai abi sąlygos neteisingos, rezultatas tampa `false`.

Pavyzdžiui, mokėjimo scenarijuje galima atsiskaityti grynaisiais arba kredito kortele. Jei nei vienas būdas netinka, mokėjimas nepavyksta.

### `!` ne

`!` yra loginis ne operatorius (`NOT`), naudojamas `Bool` reikšmei apversti.

Jį galima suprasti taip: `!` paverčia `true` į `false`, o `false` į `true`.

Pavyzdžiui:

```swift
let allowed = true
let result = !allowed   // false
```

Čia `!allowed` reiškia `allowed` reikšmės apvertimą.

Svarbu: `!` ir `!=` yra du skirtingi operatoriai. `!` apverčia `Bool` reikšmę, o `!=` yra palyginimo operatorius, kuris grąžina `Bool`.

## Priskyrimo operatoriai

Priskyrimo operatoriai (`Assignment Operators`) naudojami reikšmei priskirti arba kintamajam atnaujinti:

- `=` priskyrimas

Deklaruojant kintamuosius arba atliekant skaičiavimus, visada yra priskyrimo operacija:

```swift
let a = 5
```

Šis kodas reiškia, kad skaičius `5` priskiriamas kintamajam `a`.

### Sudėtiniai priskyrimo operatoriai

Praktiniame kūrime, be pagrindinio priskyrimo operatoriaus, dažnai naudojami ir „sudėtiniai priskyrimo operatoriai“, leidžiantys tiesiogiai apskaičiuoti naują reikšmę remiantis sena:

- `+=`
- `-=`
- `*=`
- `/=`

Ankstesnėje „skaitiklio“ pamokoje jau trumpai susipažinome su sudėtiniais priskyrimo operatoriais.

Pavyzdžiui, kai paspaudžiamas mygtukas ir norime automatiškai padidinti kintamąjį:

```swift
var num = 10
num += 5   // num = 15
```

Tai reiškia, kad `num` ir `5` sudedami, o rezultatas vėl priskiriamas `num`.

Todėl tai lygiavertė šiam kodui:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternarinis operatorius

Swift kalboje ternarinis operatorius (`Ternary Operator`) pagal sąlygą pasirenka vieną iš dviejų rezultatų:

```swift
条件 ? 值1 : 值2
```

Jo veikimo logika tokia: jei sąlyga yra `true`, grąžinama „1 reikšmė“; jei sąlyga yra `false`, grąžinama „2 reikšmė“.

Pavyzdžiui:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Šis kodas patikrina `showColor` reikšmę: jei ji `true`, grąžinamas `Color.blue`, todėl fonas bus mėlynas; jei `false`, grąžinamas `Color.clear`, todėl fonas nebus matomas.

Patarimas: `Color.clear` reiškia skaidrią spalvą.

### Skirtumas nuo `if-else`

Ternarinis operatorius logiškai yra lygiavertis `if-else`.

Pavyzdžiui, ankstesnį kodą galima perrašyti taip:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Abiejų rašymų vykdymo logika visiškai tokia pati: kai sąlyga `true`, pasirenkamas pirmas rezultatas; kai `false`, antras.

Praktikoje ternarinis operatorius yra trumpesnis, todėl patogesnis paprastiems „vienas iš dviejų“ pasirinkimams ir dažnai naudojamas ten, kur reikia tiesiogiai grąžinti vieną reikšmę.

SwiftUI vaizdų kūrime ternarinis operatorius labai dažnas, pavyzdžiui:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Tokiu būdu vienoje eilutėje galima pagal sąlygą dinamiškai pakeisti vaizdo efektą.

## Intervalų operatoriai

Intervalų operatoriai (`Range Operators`) naudojami intervalams žymėti:

- `...` uždaras intervalas (įtraukiami abu galai)
- `..<` pusiau atviras intervalas (dešinysis kraštas neįtraukiamas)

Pavyzdžiui:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Paprasčiau tariant, `1...3` reiškia nuo `1` iki `3`, įskaitant `3`; `5..<8` reiškia nuo `5` iki `8`, bet neįskaitant `8`.

Išplėstinės formos (tik susipažinimui):

```
5...    // >= 5
...5    // <= 5
```

Toks rašymas reiškia „vienpusį intervalą“, dažnai naudojamą sąlygose ar šablonų atitikime.

Vėliau, mokantis `for` ciklų, intervalų operatoriai bus naudojami dažniau; kol kas pakanka juos suprasti kaip ištisinį skaitinį diapazoną.

## Praktika su operatoriais

Toliau per kelis paprastus pavyzdžius pažiūrėsime, kaip operatoriai veikia vaizde.

### 1. Transporto priemonių skaičiaus apskaičiavimas

Pavyzdžiui, jei tam tikroje sankryžoje per dieną pravažiuoja 500 automobilių, galime apskaičiuoti, kiek jų pravažiuos per 30 dienų.

Galime naudoti skaičiavimo operatorių:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Skaičiavimo procesas čia paprastas: 500 automobilių per dieną, 30 dienų iš viso yra `500 × 30`, todėl gauname `15000`.

### 2. Nario prenumeratos tikrinimas

Galime patikrinti, ar žmogus yra mokamas narys: jei jis turi arba viso gyvenimo, arba prenumeratos narystę, laikome jį nariu.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Šiame kode naudojamas `||` (arba) operatorius: `lifeTime = false` reiškia, kad viso gyvenimo narystės nėra; `subscription = true` reiškia, kad yra prenumerata.

Kadangi pakanka vienos sąlygos, `isMember` bus `true`. Todėl šis žmogus laikomas nariu.

## Santrauka

Swift kalboje operatoriai yra duomenų skaičiavimo ir loginio vertinimo pagrindas, panašiai kaip `Text` atsako už turinio rodymą, operatoriai atsako už pačių duomenų apdorojimą.

Nuo pačių paprasčiausių skaičiavimų iki sudėtingų loginių sprendimų, o taip pat iki būsenos valdymo ir išdėstymo skaičiavimų vaizde - visur reikalingi operatoriai.

Per skirtingų scenarijų praktiką galima palaipsniui priprasti prie šioje pamokoje pristatytų operatorių tipų. Tai yra svarbus pagrindas tolimesniam mokymuisi.

### Papildomos žinios - bitiniai operatoriai

Be to, Swift pateikia ir žemesnio lygio operatorių grupę - bitinius operatorius (`Bitwise Operators`):

- `&` (bitinis AND)
- `|` (bitinis OR)
- `^` (bitinis XOR)
- `~` (bitinis NOT)
- `>>` (poslinkis į dešinę)
- `<<` (poslinkis į kairę)

Pavyzdžiui:

```swift
let a = 6  // dvejetainis 110
let b = 3  // dvejetainis 011

print(a & b) // 2 (dvejetainis 010)
print(a | b) // 7 (dvejetainis 111)
print(a ^ b) // 5 (dvejetainis 101)
print(~a)    // -7 (bitinis apvertimas)
```

Swift kalboje sveikieji skaičiai vaizduojami dvejetainiu papildiniu, todėl po apvertimo gaunamas atitinkamas neigiamas skaičius.

Bitiniai operatoriai tiesiogiai veikia dvejetainius duomenis ir paprastai naudojami žemo lygio duomenų apdorojimui arba našumo optimizavimo scenarijams.

Pradedantiesiems tokie operatoriai reikalingi retai, o bendrame iOS ar SwiftUI kūrime jie taip pat nėra dažni, todėl čia jų detaliai nenagrinėsime.

Jei vėliau susidursime su žemo lygio logika ar našumo optimizavimu, prie jų bus galima sugrįžti giliau.
