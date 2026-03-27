# Taupyklės sumos išsaugojimas

Ankstesnėje pamokoje sukūrėme paprastą „taupyklę“. Šioje pamokoje mokysimės, kaip padaryti, kad „taupyklės“ suma būtų išsaugoma ilgam.

Šioje pamokoje daugiausia susipažinsime su `UserDefaults` ir `@AppStorage` savybių apvalkalu, taip pat papildomai paaiškinsime `onAppear` vaidmenį ir pasirinktinių tipų (`nil`) naudojimą.

Svarbu: ši pamoka remiasi ankstesnėje pamokoje sukurtu „taupyklės“ kodu.

## Duomenų išsaugojimo problema

Dabar „taupyklės“ sąsaja yra paprasta ir patogi naudoti.

![Piggy Bank](../../Resource/014_view.png)

Tačiau yra akivaizdi problema: kiekvieną kartą atnaujinus vaizdą arba uždarius programą, bendra „taupyklės“ suma vėl tampa `0`, o ankstesni duomenys visiškai dingsta.

Tai reiškia, kad duomenys iš tikrųjų neišsaugomi. Kitaip tariant, dabartinė „taupyklė“ gali saugoti tik laikinus duomenis.

### Kodėl duomenys neišsaugomi ilgam?

Taip yra todėl, kad mes naudojame `@State` deklaruotą kintamąjį:

```swift
@State private var amount = 0
```

`@State` deklaruoto kintamojo gyvavimo ciklas visiškai priklauso nuo vaizdo.

Kai vaizdas sukuriamas, `amount` inicializuojamas į `0`; kai vaizdas sunaikinamas, `amount` taip pat sunaikinamas.

Todėl `amount` saugomi duomenys egzistuoja tik atmintyje ir nėra įrašomi į įrenginį.

Jei nenorime, kad `amount` būtų susietas su vaizdo gyvavimo ciklu, turime įgyvendinti nuolatinį duomenų išsaugojimą. Kitaip tariant, duomenis reikia išsaugoti pačiame įrenginyje.

### Kas yra „duomenų išsaugojimas ilgam“

Duomenų išsaugojimą ilgam galima suprasti kaip duomenų perkėlimą iš „laikinos atminties“ į „įrenginio saugyklą“.

Kai uždaromas vaizdas ar visa programa, duomenys nebedingsta.

Swift kūrime paprastesniam tokių duomenų išsaugojimui galima naudoti `UserDefaults`, o sudėtingesniems duomenims - `SwiftData` ar `CoreData`.

Šioje pamokoje pirmiausia išmoksime patį paprasčiausią variantą - `UserDefaults`.

## `UserDefaults`

`UserDefaults` naudojamas lengvoms raktas-reikšmė tipo poroms saugoti. Jis dažnai naudojamas `String`, `Int`, `Double`, `Bool` ir kitiems pagrindiniams tipams įrašyti.

### Duomenų įrašymas

`UserDefaults` naudoja metodą `set` duomenims įrašyti:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Pirmasis `UserDefaults` parametras yra saugoma reikšmė, čia perduodami `String`, `Int` ir panašūs duomenys.

Antrasis parametras `forKey` yra tarsi kintamojo vardas, naudojamas pažymėti, kokie duomenys saugomi `UserDefaults`.

### Duomenų nuskaitymas

`UserDefaults` turi atitinkamus duomenų nuskaitymo metodus:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Skaitant duomenis būtina naudoti atitinkamą tipo metodą, kitaip atsiras klaidų arba bus gauti neteisingi duomenys.

### Į ką reikia atkreipti dėmesį naudojant `UserDefaults`

#### 1. Gali būti grąžinamas pasirinktinis tipas

Kai `UserDefaults` naudojamas skaityti duomenis, kai kurie metodai grąžina pasirinktinius tipus (`Optional`).

Pavyzdžiui:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Grąžinamo `name` tipas yra:

```swift
String?
```

Tai reiškia, kad reikšmė gali egzistuoti, o gali ir neegzistuoti.

**Kodėl grąžinamas pasirinktinis tipas?**

Todėl, kad `UserDefaults` viduje tam tikram `Key` gali ir nebūti atitinkamų duomenų.

Pavyzdžiui:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Jei `City` niekada nebuvo išsaugotas, nuskaitymo rezultatas bus:

```swift
nil
```

Svarbu pabrėžti, kad `nil` reiškia ne „tuščią eilutę“, o „jokių duomenų nėra“.

„Tipų sistemos“ pamokoje jau susidūrėme su panašia situacija: kai tipo konvertavimas nepavyksta, grąžinamas pasirinktinis tipas.

Tokiu atveju turime naudoti `??`, kad pateiktume numatytąją reikšmę ir išpakuotume:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Jei `UserDefaults` randa duomenis, naudojama nuskaityta reikšmė; jei ne (`nil`), naudojama numatytoji reikšmė.

#### 2. Gali būti grąžinamas ir nepasirinktinis tipas

Kai `UserDefaults` skaito `Int`, `Double`, `Bool` tipus, grąžinamas nepasirinktinis tipas.

Pavyzdžiui:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Net jei šie `Key` niekada nebuvo išsaugoti, grąžinama reikšmė nebus `nil`.

Vietoje to bus grąžintos numatytosios reikšmės:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Duomenų kiekio ribojimas

`UserDefaults` tinka tik mažam duomenų kiekiui saugoti, pavyzdžiui, programos nustatymams ar paprastoms būsenoms.

Praktikoje jis netinka nei dideliems duomenų kiekiams, nei dažnam skaitymui ir rašymui.

## „Taupyklės“ sumos išsaugojimas

Dabar galime naudoti `UserDefaults`, kad įgyvendintume „taupyklės“ bendros sumos saugojimo logiką.

Kai naudotojas paspaudžia mygtuką, įvesta suma pridedama prie bendros sumos, o ši bendra suma išsaugoma į `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Dabar jau turime duomenų įrašymo logiką.

## Duomenų išsaugojimo logikos paaiškinimas

Nors įrašymo logiką jau įgyvendinome, praktiškai pamatysime, kad kiekvieną kartą atnaujinus vaizdą ar vėl atidarius programą kintamasis `amount` vis tiek yra `0`.

Taip yra todėl, kad:

```swift
@State private var amount = 0
```

SwiftUI sistemoje `@State` kintamasis vaizdo kūrimo metu visada inicializuojamas iš naujo.

Nors `UserDefaults` jau išsaugojo `amount`, kai vaizdas įkeliamas iš naujo, `amount` vis tiek grąžinamas į `0`.

Tai reiškia, kad šiuo metu mes tik įrašėme duomenis į `UserDefaults`, bet jų neatstatėme atgal į vaizdą.

Todėl, kai vaizdas įkeliamas, dar reikia rankiniu būdu perskaityti `UserDefaults` ir vėl priskirti reikšmę `amount`, tik tada veiks pilna duomenų išsaugojimo logika.

### Loginė analogija

Šį procesą galima palyginti su „lenta klasėje“:

Pamokos metu mokytojas rašo turinį ant lentos. Šis turinys panašus į dabartinę vaizdo būseną (`@State`).

Kai pamoka baigiasi, lenta nuvaloma, kad būtų galima ruošti kitą pamoką. Tai atitinka vaizdo sunaikinimą, kai `@State` duomenys taip pat išvalomi.

Kad mokymo turinys nepradingtų, mokytojas iš anksto jį išsaugo konspekte. Tas konspektas atitinka `UserDefaults`.

Kai kitą kartą pamoka prasideda iš naujo, lenta pradžioje būna tuščia (`@State` inicializavimas), todėl mokytojas turi pagal konspektą vėl užrašyti turinį ant lentos (perskaityti `UserDefaults`).

Svarbiausia suprasti, kad lenta pati neatsistato automatiškai; reikia ją „atkurti iš konspekto“ (`UserDefaults`).

## Duomenų nuskaitymas su `onAppear`

Kai vaizdas pasirodo, turime rankiniu būdu perskaityti `UserDefaults` reikšmę ir priskirti ją `@State` kintamajam `amount`, kad būtų pasiektas tikras duomenų išsaugojimas.

SwiftUI sistemoje galima naudoti `onAppear`, kad įvykdytume inicializavimo logiką, kai vaizdas parodomas:

```swift
.onAppear {}
```

Į `onAppear` įdedame `UserDefaults` nuskaitymo kodą:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Kai vaizdas sukuriamas, `amount` pirmiausia inicializuojamas į `0`; kai vaizdas pasirodo, suveikia `onAppear`, iš `UserDefaults` nuskaito reikšmę ir priskiria ją `amount`. Taip vaizde galima parodyti paskutinį kartą išsaugotą bendrą sumą.

Dabar visa „taupyklės“ duomenų išsaugojimo logika jau baigta.

## Pilnas kodas

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage` savybių apvalkalas

SwiftUI pateikia `@AppStorage` savybių apvalkalą, kuris gali supaprastinti `UserDefaults` saugojimo logiką.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` yra `UserDefaults` apvalkalas, o `"amount"` atitinka `UserDefaults` `Key`.

Kai vaizdas sukuriamas, jis perskaito duomenis iš `UserDefaults`; kai kintamasis pasikeičia, jis automatiškai įrašomas atgal į `UserDefaults`.

Jis taip pat palaiko SwiftUI būsenos atnaujinimo mechanizmą ir, kaip `@State`, pasikeitus reikšmei atnaujina SwiftUI vaizdą.

Kitaip tariant, `@AppStorage` gali pats atlikti ir nuskaitymo, ir įrašymo logiką, todėl nebereikia rankiniu būdu kviesti `UserDefaults` ir naudoti `onAppear`.

Todėl galime pakeisti kode `UserDefaults` į `@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Santrauka

Šioje pamokoje daugiausia išmokome šiuos dalykus:

Pirmiausia, `UserDefaults` naudojamas lengviems duomenims saugoti, todėl mes jį panaudojome bendrai sumai išsaugoti įrenginyje. `UserDefaults` suteikia duomenų skaitymo ir rašymo metodus, o taip pat reikalauja atsižvelgti į pasirinktinius tipus ir panašias situacijas.

Toliau, `@State` kintamasis naudojamas tik laikinos vaizdo būsenos valdymui, todėl jo gyvavimo ciklas sutampa su vaizdu. Kai vaizdas sukuriamas iš naujo, `@State` taip pat inicializuojamas iš naujo.

Atkuriant `UserDefaults` duomenis išmokome naudoti `onAppear`, kad duomenys būtų perskaitomi rodant vaizdą ir taip būtų atkurta būsena.

Galiausiai, pakeitėme `UserDefaults` į `@AppStorage`, kad vaizdo įkėlimo metu duomenys būtų perskaitomi automatiškai, o jiems pasikeitus - automatiškai įrašomi, taip pakeičiant rankinį `UserDefaults` ir `onAppear` naudojimą.

Per šias žinias galime įgyvendinti paprastą programėlės duomenų saugojimą, kad duomenys būtų išsaugomi ilgam.

## Praktika po pamokos

Dabar „taupyklė“ jau palaiko sumos išsaugojimą, tačiau jos funkcionalumas dar nėra pilnas.

1. Jei naudotojui reikia išsiimti sumą, reikėtų sukurti atitinkamą išėmimo logiką.
2. Jei naudotojas nori visą sumą išvalyti, taip pat reikia pridėti nustatymo iš naujo logiką.
3. Jei norima „taupyklei“ suteikti pavadinimą, reikės įtraukti ir `String` tipo duomenų saugojimą.

Galite toliau tobulinti esamą projektą ir taip padaryti „taupyklę“ pilnesnę.

## Papildomos žinios - įvesties lauko numatytosios reikšmės problema

Dabar galime dar šiek tiek patobulinti įvesties lauko sąveiką, kad įvesti būtų patogiau.

![textfield](../../Resource/015_view.png)

Dabartinėje įgyvendinimo versijoje įvesties lauko numatytoji reikšmė yra `0`. Kiekvieną kartą įvesdamas naują sumą naudotojas turi pirmiausia ištrinti `0`, o tik tada įvesti naują skaičių, ir tai nėra patogu.

Turėtume padaryti taip, kad pradžioje įvesties laukas būtų tuščias, o ne rodytų `0`.

Taip yra todėl, kad `TextField` ir `number` susieti dviem kryptimis:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Kai `number` inicializuojamas į `0`, įvesties laukas taip pat rodo `0`.

Todėl turime pakeisti `number` į tuščią reikšmę, tai yra `nil`.

```swift
@State private var number = nil
```

Tokiu atveju atsiranda klaida:

```
Generic parameter 'Value' could not be inferred
```

Tai būtent ta situacija, apie kurią kalbėjome „tipų sistemos“ pamokoje: kai kintamojo tipo negalima nustatyti automatiškai, jį reikia deklaruoti aiškiai.

Kadangi `number` nustatome į `nil`, o pats `nil` neturi jokios tipo informacijos, kompiliatorius negali nustatyti, ar šis kintamasis turi būti `String`, `Int` ar kažkas kita, todėl ir atsiranda klaida.

Todėl `number` tipą turime nurodyti aiškiai:

```swift
@State private var number:Int? = nil
```

Čia `Int?` reiškia pasirinktinį tipą (`Optional`) ir nurodo, kad `number` reikšmė gali būti arba `Int`, arba `nil`.

Tokiu būdu nustatę jį į `nil`, pasiekiame, kad pradžioje įvesties laukas būtų tuščias, o ne rodytų `0`.

### Pasirinktinio tipo išpakavimas

Kai `number` pakeičiame į pasirinktinį tipą, ankstesnis skaičiavimo kodas pradeda rodyti klaidą:

```swift
amount += number
```

Patarimas:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Taip yra todėl, kad dabar `number` gali būti `nil`. Jei bandytume tiesiogiai įtraukti jį į skaičiavimą, tai virstų:

```swift
amount += nil
```

Akivaizdu, kad `nil` negali būti sudedamas su `amount`, todėl tokia operacija negalima.

Todėl naudojant pasirinktinį tipą skaičiavimuose, pirmiausia reikia jį išpakuoti.

Čia galima naudoti `??`, kad pateiktume numatytąją reikšmę:

```swift
amount += number ?? 0
```

Kai `number` yra `nil`, naudojama numatytoji reikšmė `0`; kai `number` turi reikšmę, naudojamas tikrasis naudotojo įvestas skaičius.

Tai užtikrina ir teisingą skaičiavimą, ir norimą efektą, kad įvesties laukas pradžioje būtų tuščias, todėl naudotojui nebereikia ranka ištrinti `0`.

## Išplėstinis kodas

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
