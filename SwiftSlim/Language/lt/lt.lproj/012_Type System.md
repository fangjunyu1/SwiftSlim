# Tipų sistema

Ankstesnėse pamokose jau mokėmės apie kintamuosius ir žinome, kad kintamieji gali saugoti skirtingų tipų duomenis.

Pavyzdžiui:

```swift
var hello = "Hello, World"
```

Čia `hello` saugo teksto eilutę, todėl jo tipas yra `String`.

Toliau sistemingai mokysimės tipo (`Type`) sąvokos, aiškaus tipo deklaravimo ir tipo išvedimo, kad giliau suprastume kintamųjų prigimtį.

## Kas yra tipas

Swift kalboje kiekviena reikšmė turi aiškų tipą. Tipas nusako, kas tai per reikšmė ir ką su ja galima daryti.

Pavyzdžiui:

- `42` yra `Int` (sveikasis skaičius)
- `"Hello"` yra `String` (eilutė)
- `true` yra `Bool` (loginė reikšmė)

Jos priklauso skirtingiems tipams ir naudojamos skirtingose situacijose.

## Dažniausi pagrindiniai Swift tipai

Pradiniame etape dažniausiai sutinkami tipai:

- `String`: eilutė (tekstas)
- `Int`: sveikasis skaičius
- `Double`: slankiojo kablelio skaičius (su trupmenine dalimi, didesnis tikslumas)
- `Bool`: loginė reikšmė (`true/false`)

Be to, yra ir `Float` (slankiojo kablelio skaičius), tačiau jo tikslumas mažesnis nei `Double`, todėl jis naudojamas rečiau; taip pat `Character` (vienas simbolis), pavyzdžiui, `"A"`, `"!"` ir pan.

### Tipo deklaravimas (aiškus tipas)

Swift kalboje tipą galima nurodyti rankiniu būdu deklaruojant kintamąjį:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Po kintamojo pavadinimo pridedamas `: tipas`, kad būtų deklaruotas jo tipas.

Masyvo tipo rašymo forma yra `: [tipas]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Šiame kode masyvas `scores` gali saugoti tik `Int` tipo elementus, o `tags` - tik `String`.

Aiškus tipo deklaravimas gali padaryti kodo intenciją aiškesnę ir kai kuriose situacijose padėti išvengti klaidų, susijusių su tipo išvedimu.

## Tipo išvedimas

Daugeliu atvejų tipo aiškiai nurodyti nereikia:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Taip yra todėl, kad Swift kompiliatorius tipą automatiškai nustato pagal „pradinę reikšmę“.

## Aiškus deklaravimas ir tipo išvedimas

Ankstesnėse pamokose nenaudojome aiškaus deklaravimo, pavyzdžiui:

```swift
var age: Int = 18
```

Vietoje to pirmiausia naudojome tipo išvedimą:

```swift
var age = 18
```

Šiame pavyzdyje šie du rašymo būdai yra lygiaverčiai, nes `age` abiem atvejais bus nustatytas kaip `Int`. Palyginti su tuo, tipo išvedimas yra glaustesnis.

Pradiniame etape aiškus deklaravimas nebuvo pabrėžiamas todėl, kad tipo išvedimas sumažina papildomos informacijos kiekį kode, tad pradėti mokytis yra lengviau.

## Kodėl reikalingi tipai

Swift yra stipriai tipizuota kalba (`Strongly Typed Language`).

Tai reiškia: kai kintamojo tipas jau nustatytas, jo nebegalima savavališkai keisti.

Pavyzdžiui:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Pirmasis `20` yra `Int` tipo, todėl jį galima priskirti `age`; antrasis `"20"` yra `String`, jo tipas nesutampa su `Int`, todėl atsiranda klaida.

`nums` yra `[Int]` tipo masyvas, todėl gali saugoti tik sveikuosius skaičius ir negali maišyti eilutės.

Tipai riboja duomenų naudojimo būdą, leidžia kompiliavimo metu aptikti neatitikimus ir sumažina klaidų kiekį, didindami kodo stabilumą ir prižiūrimumą.

## Kada būtina aiškiai deklaruoti tipą

Nors Swift gali tipą nustatyti automatiškai, tam tikrose situacijose kompiliatorius to negali padaryti arba gali nustatyti neteisingai, todėl tipą reikia deklaruoti ranka.

**1. Tuščias masyvas**

Kuriant tuščią masyvą, tipą būtina deklaruoti aiškiai:

```swift
var nums: [Int] = []
```

Jei tipo nenurodysime:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Kompiliatorius negali iš tuščio masyvo nustatyti, kokio tipo elementus jis turėtų saugoti, todėl atsiranda kompiliavimo klaida.

**2. Netinkamo išvedimo išvengimas**

```swift
var value = 10   // Int
```

Šiame pavyzdyje, nors `10` teoriškai gali reikšti ir slankiojo kablelio skaičių (`Double`), dėl to, kad nėra kablelio, kompiliatorius jį numatytai interpretuoja kaip `Int`.

Jei norime, kad `value` būtų slankiojo kablelio skaičius, reikia aiškiai deklaruoti tipą:

```swift
var value: Double = 10   // Double
```

Kai tipo išvedimo rezultatas neatitinka lūkesčių, reikia aiškiai deklaruoti tipą arba pakoreguoti literalo formą.

**3. Vartotojo tipai**

Vėliau mokysimės ir savo tipų. Naudojant juos, taip pat dažnai reikia aiškios deklaracijos:

```swift
var info: GameInfo
var users: [User] = []
```

Priežastis panaši kaip ir su tuščiu masyvu: kompiliatorius negali automatiškai išvesti tipo iš tuščios reikšmės.

## Tipų konvertavimas

Swift kalboje skirtingi tipai nėra konvertuojami automatiškai, todėl konvertavimą reikia atlikti rankiniu būdu.

Pavyzdžiui, dviejų skirtingų tipų skaičių sudėtis:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Šiame kode `a` yra `Int`, `b` yra `Double`; tipai skirtingi, todėl jų tiesiogiai sudėti negalima.

Prieš atliekant veiksmą, vieną iš reikšmių reikia paversti tuo pačiu tipu:

```swift
var result = Double(a) + b
```

Tai reiškia, kad `a` tipo `Int` paverčiamas į `Double`, o tada sudedamas su `b`; rezultatas priskiriamas `result`.

Svarbu: tipo konvertavimas nekeičia pradinio kintamojo tipo. Pavyzdžiui, `Double(a)` nepakeičia `a` tipo `Int`, o tik sukuria naują `Double` reikšmę skaičiavimui.

Kitus tipus taip pat galima konvertuoti panašiu būdu, naudojant `tikslinisTipas + ()`, į kuriuos perduodama reikšmė, kurią reikia konvertuoti. Pavyzdžiui:

```
Int()、Double()、String()
```

Pavyzdys:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Svarbu: ne visi konvertavimai baigiasi taip, kaip galėtume tikėtis. Pavyzdžiui, `Double → Int` tiesiog nukerpa trupmeninę dalį ir neapvalina.

## Tipo pseudonimai

Swift kalboje galima jau egzistuojančiam tipui suteikti kitą pavadinimą, kad kodo semantika būtų aiškesnė:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Čia `UserID` iš esmės vis tiek yra `Int`, tipas nepasikeičia, tik pavadinimas tampa prasmingesnis.

Dideliuose ir sudėtinguose projektuose tipo pseudonimai padeda kodą skaityti lengviau.

## Tipų pavyzdys

Toliau per paprastą pavyzdį pažiūrėsime, kokį vaidmenį tipai atlieka realiame kūrime.

### Kintamojo sukūrimas

Pirmiausia sukuriame kintamąjį `age`:

```swift
var age = 20
```

Kadangi šį kintamąjį reikia rodyti ir keisti SwiftUI aplinkoje, jį turime deklaruoti su `@State`:

```swift
@State private var age = 20
```

`private` jau buvo minėtas anksčiau: tai reiškia, kad kintamasis gali būti naudojamas tik dabartiniame vaizde. Vėliau apie tai mokysimės išsamiau.

### Duomenų rodymas SwiftUI aplinkoje

Rodome `age` kintamąjį SwiftUI vaizde:

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

Dabar vaizdas rodys:

```swift
age: 20
```

### Duomenų keitimas

Toliau pridedame du mygtukus `age` reikšmei keisti:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Vykdymo rezultatas

Kai paspaudžiamas `changeAge1`, `age` gaus reikšmę `18`:

```swift
age = 18
```

Kadangi `18` yra `Int` tipo ir sutampa su `age` tipu, priskyrimas sėkmingas.

`changeAge2` sukels klaidą:

```swift
age = "18"
```

Klaidos pranešimas:

```
Cannot assign value of type 'String' to type 'Int'
```

Taip yra todėl, kad `"18"` yra `String` tipo (eilutės apgaubiamos `""`), o `age` yra `Int`, todėl jų tipai nesutampa.

### Kodėl atsiranda klaida?

Svarbiausia ši eilutė:

```swift
@State private var age = 20   // Int
```

Nors tipas nėra aiškiai deklaruotas, pradinei reikšmei esant `20`, kompiliatorius automatiškai išveda `age` kaip `Int`.

Kai tipas jau nustatytas, jo nebegalima pakeisti į kitą.

Be to, `changeAge2` klaida įvyksta ne vykdymo metu, o jau kompiliuojant, todėl kodas net negali būti paleistas.

Tai ir yra vienas iš stiprios Swift tipizacijos privalumų: tipo problemas galima pastebėti dar rašant kodą.

### Teisingas rašymo būdas

Pašalinus klaidingą kodą:

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

Paspaudus mygtuką `changeAge1`, vaizdas atsinaujins į:

```
age: 18
```

### Aiškus tipo deklaravimas (pasirinktinai)

Tipą taip pat galima aiškiai nurodyti ir deklaruojant:

```swift
@State private var age: Int = 20
```

Šis rašymas padaro tipą aiškesnį, tačiau paprastose situacijose nėra būtinas.

## Santrauka

Šioje pamokoje daugiausia kalbėjome apie Swift tipų sistemą ir jos vaidmenį praktiniame kūrime.

Swift kalboje kiekviena reikšmė turi aiškų tipą; tipas nulemia duomenų prasmę ir veiksmus, kuriuos su jais galima atlikti.

Swift yra stipriai tipizuota kalba: kai kintamojo tipas jau nustatytas, jo nebegalima pakeisti į kitą. Šis apribojimas leidžia klaidas aptikti kompiliavimo etape, sumažina vykdymo metu kylančias problemas ir padidina kodo saugumą.

Kintamojo tipas gali būti nustatytas automatiškai pagal pradinę reikšmę arba deklaruojamas aiškiai. Kai kuriose situacijose (tušti masyvai, netinkamas išvedimas, vartotojo tipai) kompiliatorius negali tipo nustatyti teisingai, todėl jį būtina deklaruoti ranka.

Skirtingi tipai nėra konvertuojami automatiškai; reikia naudoti `Int()`, `Double()`, `String()` ir panašius aiškius konvertavimo būdus.

Tipai taip pat gali turėti pseudonimus; ypač sudėtingesniuose projektuose tai didina skaitomumą.

Tipas nėra vien duomenų etiketė - tai ir apribojimo mechanizmas, padedantis užtikrinti, kad duomenys būtų naudojami saugiai, aiškiai ir valdomai.

## Papildomos žinios - pasirinktiniai tipai

Atliekant tipų konvertavimą, kai kurios operacijos gali nepavykti.

Pavyzdžiui, `String` vertimas į `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Čia `Double(input)` grąžina ne `Double`, o:

```
Double?
```

Tai ir yra pasirinktinis tipas (`Optional`).

### Kodėl grąžinamas pasirinktinis tipas?

Todėl, kad eilutės turinys nėra iš anksto garantuotas: `"3.14"` gali būti paverstas į `Double`, o `"Hello"` - ne.

Kitaip tariant, ši operacija gali pavykti arba nepavykti.

Todėl Swift naudoja pasirinktinį tipą, kad parodytų šį neapibrėžtumą.

### Kas yra pasirinktinis tipas?

Pasirinktinis tipas reiškia: reikšmė gali egzistuoti, o gali ir neegzistuoti.

Pavyzdžiui:

```
Double?
```

Šis tipas reiškia, kad jei reikšmė egzistuoja, spausdinant ji bus parodyta kaip `Optional(...)`; jei neegzistuoja, bus grąžinta `nil`.

Svarbu: `nil` reiškia „nėra reikšmės“, o ne `0` ar tuščią eilutę.

### Pavyzdys

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Išvestis:

```
pi:Optional(3.14)
```

Tai reiškia, kad eilutė sėkmingai paversta į `Double`, gauta `3.14`, tačiau kadangi tipas yra `Double?`, reikšmė apgaubiama `Optional`.

Jei konvertavimas nepavyktų:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Išvestis:

```
pi: nil
```

Kadangi `"Hello"` negali būti paversta į `Double`, konvertavimas nepavyksta ir grąžinamas `nil`.

### Kas yra `Optional(...)`?

Kai tiesiogiai išvedame pasirinktinį tipą:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift parodo jo „derinimo aprašymą“:

```
Optional(3.14)
```

Tai nėra tikrųjų duomenų dalis, o tik priminimas, kad dabartinė reikšmė yra „pasirinktinis tipas“ ir jo viduje yra reikšmė.

### Pasirinktinio tipo išpakavimas

Praktiniame kūrime dažniausiai reikia iš pasirinktinio tipo paimti tikrąją reikšmę. Šis procesas vadinamas išpakavimu (`Unwrapping`).

Vienas dažnas būdas - naudoti `??`, kad pateiktume numatytąją reikšmę:

```
??
```

Tai vadinama `Nil-Coalescing Operator`.

Pavyzdžiui:

```swift
name ?? "FangJunyu"
```

Šis kodas reiškia: jei `name` turi reikšmę, grąžinama ji; jei tai `nil`, naudojama numatytoji reikšmė `"FangJunyu"`.

Svarbu: numatytoji reikšmė turi būti to paties tipo kaip ir pasirinktinio tipo vidinė reikšmė.

### Numatytosios reikšmės pateikimas per `??`

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Išvestis:

```
pi: 30
```

Kai `input` paverčiamas į `Double`, konvertavimas sėkmingas ir išvedama reikšmė. Jei konvertavimas nepavyktų, būtų panaudota numatytoji reikšmė po `??`.

Jei konvertavimas nepavyksta:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Išvestis:

```
pi: 10
```

Čia `input` nepavyksta paversti į `Double`, todėl grąžinamas `nil`, o `??` pateikia numatytąją reikšmę.

Pasirinktiniai tipai naudojami situacijoms, kai „reikšmė gali būti, o gali ir nebūti“ aprašyti.

Tokiose operacijose kaip tipų konvertavimas, kurios gali nepavykti, Swift grąžina pasirinktinį tipą, kad užtikrintų programos saugumą.

Kai mums reikia naudoti jo vidinę reikšmę, galime per `??` pateikti numatytąją reikšmę ir net `nil` atveju gauti pagrįstą rezultatą.
