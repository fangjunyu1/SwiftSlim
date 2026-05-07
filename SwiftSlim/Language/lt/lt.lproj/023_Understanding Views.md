# View supratimas

Šioje pamokoje vėl grįžtame prie paties pirmojo `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Kai pirmą kartą susipažinome su SwiftUI, `ContentView` viduje buvo daug raktažodžių, kurių dar nesupratome.

Pavyzdžiui, tokie raktažodžiai kaip `struct`, `View`, `var`, `body`, `some View` ir panašiai.

Tuo metu galbūt žinojome tik tiek: **jeigu kodą parašysime `body` viduje, turinys bus rodomas sąsajoje.**

Dabar jau mokėmės apie `struct`, kintamuosius, metodus ir protokolus, todėl galime iš naujo suprasti šį kodą ir geriau suprasti ryšį tarp SwiftUI view.

## Dar kartą apie ContentView

Sukūrus SwiftUI projektą, Xcode pagal numatytuosius nustatymus sugeneruoja `ContentView` failą.

Pavyzdinis kodas yra toks:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Šį kodą galima suprasti padalijus į kelias dalis.

Pirmiausia:

```swift
import SwiftUI
```

Ši kodo eilutė reiškia SwiftUI framework importavimą.

Importavę SwiftUI, galime naudoti tokias SwiftUI view kaip `View`, `Text`, `Image`, `VStack`, `Button` ir kitas.

## ContentView struktūra

Ši kodo eilutė reiškia, kad kuriama viena struktūra:

```swift
struct ContentView: View
```

Joje:

```swift
struct ContentView
```

reiškia, kad `ContentView` yra struktūra.

Praeitoje pamokoje susipažinome su `struct` struktūra. Ji gali sujungti skirtingus laukus ir gali turėti savybių bei metodų.

Pavyzdžiui:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

Šiame pavyzdyje `ContentView` viduje yra trys dalykai: `name`, `printName` ir `body`.

Kitaip tariant, `struct` gali kartu organizuoti susijusias savybes, metodus ir view turinį.

![contentView](../../Resource/023_contentVIew.png)

## View yra protokolas

Toliau pažiūrėkime į šią kodo eilutę:

```swift
struct ContentView: View 
```

`View` po dvitaškio reiškia: `ContentView` atitinka `View` protokolą.

Tai galima suprasti taip: jeigu `ContentView` nori tapti SwiftUI view, jis turi įvykdyti `View` protokolo reikalavimus.

### Identifiable protokolas

Anksčiau, mokydamiesi filmų sąrašą, susidūrėme su `Identifiable` protokolu.

Tada `ForEach` viduje reikėjo pereiti per `Movie` masyvą, tačiau `Movie` struktūra neturėjo unikalaus identifikatoriaus, todėl nepalaikė `ForEach` perėjimo.

Tuo metu reikėjo padaryti, kad `Movie` struktūra atitiktų `Identifiable` protokolą, taip įvykdant `ForEach` reikalavimą dėl unikalaus identifikatoriaus.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable` protokolo reikalavimas yra: **šis tipas turi turėti `id` lauką, kuris jį identifikuoja.**

Kai `Movie` pateikia `id` lauką, jis gali įvykdyti `Identifiable` reikalavimą.

Taip, kai naudojame jį `ForEach`, SwiftUI gali atpažinti kiekvieną duomenų elementą.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View protokolas

`View` protokolas taip pat veikia panašiai.

Jeigu tipas nori tapti SwiftUI view, jis turi atitikti `View` protokolą.

O svarbiausias `View` protokolo reikalavimas yra pateikti `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Tai galima suprasti taip: `View` protokolas reikalauja: **priimama tik SwiftUI view, kurią grąžina `body`, o `ContentView` per `body` rodo SwiftUI view.**

### Kas nutiks, jei neatitiksime View?

Jeigu parašysime taip:

```swift
struct ContentView {
}
```

Tai yra tik paprasta struktūra, ne SwiftUI view.

Ji tiesiogiai klaidos nesukels, nes paprasta struktūra pati savaime yra validus Swift kodas.

Tačiau jei ją įdėsime į preview:

```swift
#Preview {
    ContentView()
}
```

Tada atsiras klaida.

Priežastis: **preview turi rodyti SwiftUI view, o šis `ContentView` neatitinka `View` protokolo.**

Todėl, jei norime, kad `ContentView` būtų rodomas sąsajoje, jis turi atitikti `View` protokolą:

```swift
struct ContentView: View {
}
```

Tuo pačiu, pagal `View` protokolo reikalavimą, reikia pateikti `body`. Jei `body` nėra, compiler vis tiek parodys klaidą.

Teisingas rašymo būdas:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Tada `ContentView` tikrai yra SwiftUI view, kurią galima rodyti.

## body yra view rodymo pradžios taškas

SwiftUI aplinkoje `body` yra view turinio pradžios taškas.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Čia galima išskirti tris dalis:

**1. var body**

```swift
var body
```

Tai reiškia, kad apibrėžiamas kintamasis pavadinimu `body`.

**2. some View**

```swift
: some View
```

Tai reiškia, kad šis `body` grąžins view.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Tai rodomas view turinys. Šiame kode rodoma `Text` view.

Kitaip tariant, kas parašyta `body` viduje, tas ir rodoma sąsajoje.

Pavyzdžiui:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Šis kodas reiškia: **sąsajoje rodomas vertikaliai išdėstytas turinys, kuriame yra du tekstai.**

### body pavadinimo negalima keisti laisvai

Svarbu atkreipti dėmesį, kad pavadinimo `body` negalima keisti kaip panorėjus.

Jeigu parašysime:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

Šis `content` taip pat yra view savybė, bet jis negali pakeisti `body`.

Nes `View` protokolo reikalaujamas pavadinimas yra būtent `body`.

## Kas yra some View?

SwiftUI aplinkoje `some View` reiškia, kad grąžinama konkreti view, tik nereikia parašyti viso šios view tipo.

```swift
var body: some View
```

Kitaip tariant, `some View` nereiškia, kad tipo nėra. Tikrasis tipas vis tiek egzistuoja, compiler jį žino, tačiau tas tipas gali būti labai sudėtingas, todėl Swift leidžia jį paslėpti naudojant `some View`.

### Kas yra some?

Swift kalboje `some` yra raktažodis, naudojamas deklaruoti nepermatomą tipą, arba opaque type.

Opaque type reiškia: **grąžinama reikšmė turi konkretų tipą, compiler žino, koks tas konkretus tipas, bet mes jo tiesiogiai nerašome.**

Pavyzdžiui:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Tai reiškia, kad `makeView` grąžins konkretų tipą, kuris atitinka `View` protokolą.

### Kodėl reikia some?

Mokydamiesi kintamuosius, sužinojome: **Swift reikšmėms reikia aiškiai nurodyto tipo arba compiler turi automatiškai išvesti tipą.**

Pavyzdžiui:

```swift
let a: Int = 10
```

Čia konstanta `a` yra `Int` tipo.

SwiftUI view taip pat nėra išimtis. Kai naudojame `body` SwiftUI view rodyti, `body` turi grąžinti atitinkamą SwiftUI tipą.

Pavyzdžiui, jeigu `body` naudojame tekstinei `Text` view rodyti, tada `body` turi grąžinti atitinkamą `Text` tipą.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Šiame pavyzdyje `body` viduje rodoma `Text` view, o grąžinamas tipas taip pat yra `Text`.

Tik tada, kai vidinis tipas ir deklaruotas tipas sutampa, įvykdomas compiler reikalavimas dėl tipo nuoseklumo.

**Tipo neatitikimo problema**

Jeigu `body` tipą nustatome kaip `Color`, bet rodome `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body` tipas ir vidinio kodo tipas nesutampa, todėl atsiranda tipo neatitikimo klaida.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Tada reikia rankiniu būdu pakeisti `body` grąžinimo tipą.

**Sudėtingi view tipai**

Realioje kūrimo aplinkoje sąsajoje paprastai nebūna tik vieno `Text`.

Jeigu reikia rodyti sudėtingesnį `VStack`, sudėtingą grąžinimo tipą reikėtų nurodyti rankiniu būdu.

Pavyzdžiui:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Šis kodas reiškia, kad grąžinamas `VStack`, kurio viduje yra `Image` ir `Text` tipo view.

`body` grąžinimo tipas yra:

```swift
VStack<TupleView<(Image,Text)>>
```

Matome, kad šis grąžinimo tipas labai sudėtingas, taip pat atsirado anksčiau nematytas `TupleView`.

Čia `TupleView` galima suprasti kaip: **kelių child view apgaubimą į vieną view.**

**Dar sudėtingesni view tipai**

Jeigu view pridėsime modifikatorių:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Tada šios view grąžinimo tipas tampa labai sudėtingas, ir čia jo konkrečiai aprašyti neįmanoma.

Esamas grąžinimo tipas `VStack<TupleView<(Image,Text)>>` negali aprašyti modifikatorių, todėl atsiranda klaida.

**some View supaprastina grąžinimo tipą**

Tokiai situacijai SwiftUI pateikia glaustą sprendimą: naudoti `some View`, kad rašymas būtų paprastesnis.

Kai `body` pakeičiame į `some View` tipą:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Kiekvieną kartą pakeitus view kodą, nebereikia iš naujo rašyti pilno grąžinimo tipo.

Taip yra todėl, kad `some View` reiškia grąžinti konkrečią view, kuri atitinka `View` protokolą.

Kitaip tariant, `VStack`, `Image` ir kitos SwiftUI view visos atitinka `View` protokolą. Pridėjus modifikatorių, grąžinamas view tipas taip pat vis dar atitinka `View` protokolą.

Todėl jos visos gali būti grąžinamos kaip `some View`.

### some View negali bet kaip grąžinti bet kurios view

Nors `some View` gali paslėpti sudėtingus tipus, tai nereiškia, kad ji „neturi tipo“.

Pagrindinė taisyklė yra: **compiler turi galėti nustatyti vieną konkretų grąžinimo tipą**.

Pavyzdžiui:

```swift
var title: some View {
    Text("Hello")
}
```

Čia grąžinama `Text` view.

Tačiau jei bandysime grąžinti dvi view, atsiras klaida:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Nes `some View` galiausiai turi grąžinti vieną view struktūrą, o čia bandoma grąžinti dvi nepriklausomas view.

### Sprendimas

Paprastai yra du sprendimai: container ir `@ViewBuilder`.

**1. Apgaubti container**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Šiame kode `title` grąžina vieną `VStack`, o `Text` ir `Image` yra child view `VStack` viduje.

View struktūra, kurią priima `some View`, yra vienas `VStack<...>`, todėl tai atitinka `some View` reikalavimą grąžinti vieną view struktūrą. 

Būtent todėl nuo SwiftUI mokymosi pradžios siūlome išoriniame sluoksnyje naudoti `VStack` container view kodui apgaubti.

**2. Naudoti @ViewBuilder**

Prieš `some View` taip pat galime pridėti `@ViewBuilder` modifikatorių:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` gali sujungti kelias view į vieną grąžinamą rezultatą.

Jo esmė vis tiek yra kelių view sujungimas į vieną view, kad būtų įvykdytas `some View` reikalavimas grąžinti vieną view struktūrą.

### Kodėl body gali tiesiogiai rašyti kelias view?

Jeigu `var body` viduje parašome kelias view, pavyzdžiui:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

Kai kuriais atvejais toks `body` klaidos nesukels.

Priežastis yra ta, kad `View` protokole `body` pagal numatytuosius nustatymus palaiko `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View` protokolo source code matome, kad `@ViewBuilder` jau modifikuoja `body` kintamąjį.

Todėl `body`, palyginti su paprastu `some View`, turi papildomą specialų apdorojimą, ir SwiftUI automatiškai sujungia kelias view į vieną view.

**Rekomenduojama naudoti container**

Kad pradedantiesiems būtų lengviau suprasti, kelioms view organizuoti rekomenduojama pirmiausia naudoti tokius container kaip `VStack`, `HStack`, `ZStack`, `Group`.

Pavyzdžiui:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Taip kodas intuityvesnis: **išorinis sluoksnis yra vienas `VStack`, o jo viduje yra dvi child view.**

## View skaidymas

Jeigu sąsaja gana paprasta, visą kodą galime rašyti `body` viduje.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Sveiki atvykę į Qinote")
                Text("Labas rytas")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("spausk mane") {
                print("spausk mane ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Šios view rodymo stilius:

![view](../../Resource/023_view1.png)

Šis kodas gali veikti normaliai, bet jei view kodas labai sudėtingas, `body` viduje esantis kodas vis ilgės, o skaityti ir keisti bus vis sunkiau.

Tada skirtingas sritis galime išskaidyti į savarankiškas view savybes.

### Viršutinės view skaidymas

Pavyzdžiui, išskirkime viršutinę sritį:

```swift
var topHome: some View {
    HStack {
        Text("Pradžia")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Čia `topHome` yra kintamasis, kuris grąžina view.

Kadangi grąžinama view, tipą galima rašyti taip:

```swift
some View
```

Tai iš esmės toks pats naudojimas kaip `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Abu naudoja kintamąjį view rodyti, o grąžinimo tipas yra `some View`.

### Kitų view skaidymas

Tada toliau skaidome kitas dalis:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Sveiki atvykę į Qinote")
        Text("Labas rytas")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Spausk mane") {
        print("spausk mane")
    }
    .buttonStyle(.borderedProminent)
}
```

Išskaidžius, view kintamuosius galima įdėti į `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Pradžia")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Sveiki atvykę į Qinote")
            Text("Labas rytas")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Spausk mane") {
            print("spausk mane")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Dabar `body` atsakingas tik už puslapio struktūros aprašymą:

```swift
topBar
welcomeText
colorList
clickButton
```

Kiekvienos dalies konkretus įgyvendinimas yra atitinkamoje savybėje žemiau.

Toks view skaidymo būdas gali padaryti puslapio struktūrą aiškesnę. Kiekviena view sritis turi savo pavadinimą, todėl skaityti intuityviau.

Kai reikia pakeisti tam tikros dalies kodą, galima tiesiogiai rasti atitinkamą view sritį, o ne ieškoti kodo sudėtingo kodo krūvoje.

### some View grąžina vieną view

Šioje išskaidytoje view, jeigu bandysime grąžinti kelias view:

```swift
var topBar: some View {
    Text("Pradžia")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` gali grąžinti tik vieną view struktūrą, todėl atsiranda klaida.

Skirtingai nuo `body`, paprasta computed property pagal numatytuosius nustatymus neturi `@ViewBuilder`.

Todėl, jei reikia grąžinti kelias view, galime naudoti `VStack`, `HStack` arba `Group` container, kad kelias view sujungtume į vieną.

```swift
var topBar: some View {
    VStack {
        Text("Pradžia")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Arba pridėti `@ViewBuilder`, kad sujungtume view:

```swift
@ViewBuilder
var topBar: some View {
    Text("Pradžia")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Taip galime grąžinti kelias view.

### if grąžina kelias view

Pavyzdžiui:

```swift
var topHome: some View {
    if step == "Pradžia" {
        HStack {
            Text("Pradžia")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Nėra")
    }
}
```

Šiame kode `topHome` pagal `step` turinį grąžina dvi skirtingų tipų view: `HStack` arba `Text`.

Kadangi `some View` reikia vieno aiškaus konkretaus grąžinimo tipo, paprastos computed property `if` dvi šakos negali tiesiogiai grąžinti skirtingų tipų view, todėl atsiranda klaida.

**Sprendimas vis tiek yra apgaubti container arba naudoti `@ViewBuilder` modifikatorių.**

### Kodėl išskaidytai view nenaudojame skliaustų

Kai `body` viduje naudojame išskirtas view savybes, rašome tiesiog:

```swift
topBar
welcomeText
colorList
clickButton
```

o ne taip:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Taip yra todėl, kad `topBar`, `welcomeText`, `colorList`, `clickButton` yra kintamieji. Šie kintamieji iš tikrųjų yra computed property, o ne metodai.

**Savybėms skliaustų nereikia.**

Jeigu parašysime kaip metodą, taip pat galime pasiekti panašų efektą:

```swift
func topBar() -> some View {
    HStack {
        Text("Pradžia")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Šis kodas taip pat gali pasiekti panašų efektą. Iškvietus šį metodą, bus grąžinta view.

Naudojant reikia rašyti taip:

```swift
topBar()
```

SwiftUI aplinkoje, jei tik išskaidome view, kuriai nereikia perduoti parametrų, computed property būdas yra dažnesnis.

```swift
var topBar: some View { ... }
```

## Įdėtinės view

Be kodo skaidymo į savybes, taip pat galime kurti naujas view struktūras.

Pavyzdžiui:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Ši `PinkColorView`, kaip ir `ContentView`, yra savarankiška SwiftUI view.

Jei reikia ją parodyti `ContentView` viduje, po view pavadinimo galima pridėti `()`.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Čia:

```swift
PinkColorView()
```

reiškia sukurti `PinkColorView` instance.

Kadangi `PinkColorView` atitinka `View` protokolą, ją galima dėti į kitas view ir rodyti taip pat kaip `Text`, `Image`, `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Tai yra view įdėjimas: viena view gali būti rodoma kitos view viduje.

## View savybė ar naujos view kūrimas?

Kai view kodas gana paprastas, paprastai jo skaidyti nereikia. Tik kai kodas tampa sudėtingesnis, rekomenduojama skaidyti view.

### Kada naudoti view savybę

Jeigu tai tik nedidelė turinio dalis dabartinėje view, galima naudoti view savybę.

Pavyzdžiui:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Toks turinys paprastai naudojamas tik dabartinėje view.

### Kada kurti naują view

Jeigu šis turinys gana savarankiškas arba ateityje gali būti pakartotinai naudojamas keliuose puslapiuose, labiau tinka kurti naują view.

Pavyzdžiui:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Tai yra title view. Jeigu norime šią view naudoti kaip bendrą komponentą ir pakartotinai naudoti kitose view.

Galime sukurti naują view:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Tada naudoti kitose vietose:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Tada ši view tampa pakartotinai naudojamu savarankišku komponentu.

Paprastai galima apibendrinti taip:

- dabartinės view turinio sritis: galima naudoti `var xxx: some View`
- pakartotinai naudojamas savarankiškas komponentas: galima kurti naują `struct XxxView: View`
- komponentas, kuriam reikia perduoti duomenis: paprastai labiau tinka kurti naują view.

## Santrauka

Šioje pamokoje iš naujo supratome pačią pagrindinę, bet ir svarbiausią SwiftUI view struktūrą.

`ContentView` yra struktūra. Ji apibrėžiama naudojant `struct` ir naudojama su puslapiu susijusiam kodui organizuoti.

`View` yra protokolas. Jei struktūra nori tapti SwiftUI view, ji turi atitikti `View` protokolą.

`body` yra turinys, kurį `View` protokolas reikalauja pateikti. Jis nusprendžia, kokį turinį ši view rodys.

`some View` reiškia, kad grąžinama tam tikra konkreti view, ir mums nereikia rašyti jos sudėtingo pilno tipo.

Kai view kodas pailgėja, galime naudoti `var xxx: some View`, kad išskaidytume view kodą į kelias mažas sritis.

Kai tam tikra turinio dalis yra gana savarankiška arba ją reikia pakartotinai naudoti, galime sukurti naują view struktūrą ir rodyti ją kitose view per `XxxView()`.

Paprastai tariant, SwiftUI sąsaja sudaryta derinant atskiras view. Vienas puslapis gali turėti kelias mažas view, o maža view taip pat gali toliau turėti kitas view.
