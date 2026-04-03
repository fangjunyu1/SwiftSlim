# Fill Light programėlė

Šioje pamokoje sukursime labai įdomią fill light programėlę. Kai ateina naktis, galime telefone rodyti skirtingas spalvas ir naudoti ekraną kaip paprastą papildomo apšvietimo priemonę.

Ši fill light programėlė gali keisti spalvas bakstelint ekraną, taip pat reguliuoti ryškumą naudojant slankiklį.

Šiame pavyzdyje išmoksime naudoti `brightness`, kad reguliuotume vaizdo ryškumą, `onTapGesture`, kad pridėtume bakstelėjimo gestą vaizdui, ir `Slider` valdiklį.

Rezultatas:

![Color](../../Resource/018_color.png)

## Spalvos rodymas

Pirmiausia leiskime vaizdui parodyti vieną spalvą.

SwiftUI sistemoje `Color` ne tik reiškia spalvą, bet gali būti rodomas ir kaip vaizdas:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Čia `Color.red` reiškia raudoną vaizdą. `.ignoresSafeArea()` leidžia spalvos vaizdui užpildyti visą ekraną, todėl jis labiau atrodo kaip tikras fill light efektas.

Rezultatas:

![Color](../../Resource/018_color1.png)

### Spalvų masyvas ir indeksas

Dabar rodoma tik viena spalva. Tačiau fill light paprastai neapsiriboja viena spalva. Jis taip pat gali rodyti mėlyną, geltoną, violetinę, baltą ir kitas spalvas.

Norime, kad palietus ekraną būtų galima perjungti skirtingas spalvas. Šias spalvas galime sudėti į masyvą ir valdyti jas kartu:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Masyvas tinka saugoti „vieno tipo duomenų grupę“. Čia kiekvienas masyvo elementas yra `Color`.

Jei norime parodyti tam tikrą spalvą, galime naudoti indeksą:

```swift
colors[0]
```

Tai reiškia nuskaityti spalvą, esančią masyvo indekse `0`, tai yra pirmąją spalvą.

Dabar kodą galima parašyti taip:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Tokiu būdu ekrane bus rodoma pirmoji masyvo spalva, tai yra raudona.

### Indekso naudojimas spalvai valdyti

Jei norime perjungti skirtingas spalvas, mums reikia kintamojo indeksui valdyti, o ne fiksuotai parašyto indekso.

Galime naudoti `@State`, kad deklaruotume kintamąjį, saugantį indeksą:

```swift
@State private var index = 0
```

Čia `index` reiškia dabartinės spalvos indeksą.

Kai `index` pasikeičia, SwiftUI perskaičiuoja sąsają ir atnaujina rodomą turinį.

Tada pakeičiame ankstesnį `colors[0]` į:

```swift
colors[index]
```

Tokiu būdu rodoma spalva priklausys nuo `index`.

Dabar kodas tampa toks:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Kai `index` keičiasi, `colors[index]` taip pat rodys kitą spalvą.

Pavyzdžiui:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Svarbu atkreipti dėmesį, kad `index` negali viršyti didžiausio masyvo indekso, nes kitaip įvyks indekso išėjimo už ribų klaida.

## Bakstelėjimo gestas

Dabar galime rodyti skirtingas spalvas pagal `index`, bet dar negalime jų perjungti bakstelėdami.

Ankstesnėje „Citatos karuselės“ pamokoje naudojome `Button`, kad valdytume citatų keitimą.

Tačiau šį kartą norime „bakstelėti visą spalvotą sritį“, kad pakeistume spalvą, todėl `onTapGesture` yra tinkamesnis.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Kai bakstelime spalvos vaizdą, vykdomas šis kodas:

```swift
index += 1
```

Tai reiškia padidinti `index` reikšmę `1`. Padidėjus indeksui, `colors[index]` rodys kitą spalvą masyve.

### `onTapGesture`

`onTapGesture` yra gesto modifikatorius, kuris prideda bakstelėjimo veiksmą prie vaizdo.

Pagrindinis naudojimas:

```swift
.onTapGesture {
    // code
}
```

Pavyzdžiui:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Kai bakstelime šį raudoną vaizdą, vykdomas kodas skliaustuose ir konsolėje parodoma:

```swift
Click color
```

Naudodami `onTapGesture`, galime nustatyti, kas įvyks po to, kai bus bakstelėtas vaizdas.

### Skirtumas nuo `Button`

Anksčiau mokėmės apie `Button` vaizdą. Tiek `Button`, tiek `onTapGesture` gali apdoroti bakstelėjimo veiksmus, tačiau jų naudojimo situacijos nėra visiškai vienodos.

`onTapGesture` labiau tinka „pridėti bakstelėjimo funkciją prie jau esančio vaizdo“, pavyzdžiui, `Color`, `Image`, `Text` ar kito įprasto vaizdo.

Tuo tarpu `Button` labiau tinka tada, kai norime aiškiai pavaizduoti mygtuką, pavyzdžiui, „Patvirtinti“, „Siųsti“ arba „Ištrinti“.

Šioje fill light programėlėje norime, kad spalvų keitimo funkcija būtų paprastesnė. Bakstelėjus visą spalvotą sritį spalva pasikeičia, todėl čia `onTapGesture` yra geras pasirinkimas.

## Indekso problema

Dabar galime bakstelėti ekraną ir perjungti skirtingas spalvas.

Tačiau čia yra viena svarbi problema: **indeksas gali išeiti už masyvo ribų**.

Pavyzdžiui:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Jei ir toliau liesime ekraną, `index` galiausiai taps `4`, ir tada įvyks „index out of range“ klaida.

Taip yra todėl, kad `colors` masyve yra `4` elementai, bet indeksavimas prasideda nuo `0`, todėl galiojantis indeksų intervalas yra `0 - 3`, o ne `4`.

Jei bandysime pasiekti `colors[4]`, įvyks „index out of range“ klaida.

Dabartiniame kode kiekvienas bakstelėjimas automatiškai padidina `index` per `1`. Jei to neapdorosime, galų gale jis tikrai viršys leistiną ribą.

Todėl bakstelint ekraną reikia tikrinti indeksą: jei tai jau paskutinė spalva, grįžtame prie pirmosios spalvos, kitu atveju toliau pridedame `1`.

Tai galime padaryti naudodami `if` sakinį:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Šiame kode `colors.count` reiškia masyvo elementų skaičių.

Dabartiniame masyve yra 4 spalvos, taigi:

```swift
colors.count // 4
```

Tačiau didžiausias indeksas nėra `4`, jis yra `3`, nes indeksavimas prasideda nuo `0`.

Todėl paskutinis indeksas turi būti rašomas taip:

```swift
colors.count - 1
```

Tai yra:

```swift
4 - 1 = 3
```

Ši logika reiškia: jei dabartinis indeksas jau atitinka paskutinę spalvą, nustatyk indeksą į `0`; priešingu atveju padidink jį `1`.

Taip spalvos galės keistis cikliškai.

### Indekso logikos supaprastinimas

Jei norime, kad kodas būtų trumpesnis, galime naudoti ir ternarinį operatorių:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Šis kodas reiškia: jei `index == colors.count - 1` yra tiesa, grąžink `0`. Priešingu atveju grąžink `index + 1`.

Galiausiai rezultatą vėl priskiriame `index`.

Dabar galime įgyvendinti spalvų keitimo efektą.

Pilnas kodas:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Dabar galime bakstelėti ekraną ir perjungti skirtingas spalvas. Paprasta fill light programėlė jau baigta.

## Spalvos pavadinimo rodymas

Galime pridėti dar vieną tekstų grupę, atitinkančią spalvas, kad keičiantis spalvai ekrane būtų rodomas ir dabartinės spalvos pavadinimas.

Pavyzdžiui:

- Raudona rodo `Red`
- Mėlyna rodo `Blue`
- Geltona rodo `Yellow`
- Violetinė rodo `Purple`

Čia taip pat galime naudoti masyvą spalvų pavadinimams saugoti:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Šiame masyve esančių tekstų tvarka turi tiksliai atitikti spalvų masyvo tvarką.

Tada galime naudoti `Text`, kad parodytume spalvos pavadinimą pagal dabartinį indeksą:

```swift
Text(colorsName[index])
```

`Text` rodo dabartinės spalvos pavadinimą pagal `index`.

Naudokime modifikatorius, kad pagerintume `Text` išvaizdą:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Taip `Text` bus rodomas baltai, antraštės dydžiu ir paryškintu šriftu.

Dabar turime visą ekraną užimantį `Color` vaizdą. Jei norime, kad `Text` būtų rodomas ant `Color` vaizdo, turime naudoti `ZStack` išdėstymo konteinerį, kad juos sudėtume vieną ant kito.

```swift
ZStack {
    Color
    Text
}
```

Tada kodas tampa toks:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Tokiu būdu fone bus spalvos vaizdas, o virš jo bus uždėtas teksto vaizdas.

Rezultatas:

![Color](../../Resource/018_color2.png)

Svarbu atkreipti dėmesį, kad `ZStack` viduje vėliau parašyti vaizdai paprastai rodomi priekyje. Jei `Text` parašytas prieš `Color`, vėliau parašytas `Color` gali uždengti `Text`.

## Ryškumo valdymas

Dabar galime keisti skirtingas spalvas, tačiau fill light turi dar vieną svarbią funkciją: **ryškumo reguliavimą**.

SwiftUI sistemoje galime naudoti `brightness` modifikatorių vaizdo ryškumui reguliuoti.

Pavyzdžiui:

```swift
.brightness(1)
```

Galime parašyti taip:

```swift
colors[index]
    .brightness(0.5)
```

Tai padaro dabartinę spalvą šviesesnę ir artimesnę fill light efektui.

Ryškumo intervalas yra `0 - 1`. `0` reiškia išlaikyti pradinę spalvą, o kuo reikšmė arčiau `1`, tuo spalva tampa šviesesnė. `1` reiškia šviesiausią baltą rezultatą.

Nors `brightness` galime valdyti kode, vartotojas vis dar negali jo tiesiogiai reguliuoti pats.

Todėl turime pridėti valdiklį, kurį galima vilkti: `Slider`.

## `Slider` vaizdas

SwiftUI sistemoje `Slider` yra valdiklis, naudojamas reikšmei pasirinkti tam tikrame intervale. Apple jį apibūdina kaip „valdiklį reikšmei pasirinkti iš riboto linijinio intervalo“.

Pagrindinis naudojimas:

```swift
Slider(value: $value, in: 0...1)
```

Parametrų paaiškinimas:

1. `value: $value`: `Slider` turi būti susietas su kintamuoju.

    Kai slankiklis stumiamas, kintamojo reikšmė taip pat keičiasi tuo pačiu metu. Ir atvirkščiai, jei kintamasis pasikeičia, slankiklis taip pat atsinaujina.

    Tai labai panašu į anksčiau mokytą `TextField`. Abu „susieja valdiklį su kintamuoju“.

    Susietas kintamasis turi turėti `$` simbolį prieš save, kad parodytų binding.

2. `in: 0...1`: šis parametras reiškia slankiklio reikšmių intervalą.

    Čia `0...1` reiškia, kad mažiausia reikšmė yra `0`, o didžiausia — `1`.

    Kai slankiklis nustumiamas visiškai į kairę, susietas kintamasis bus arti `0`; kai nustumiamas visiškai į dešinę, jis bus arti `1`.

Pavyzdžiui:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` yra susietas su kintamuoju `value`. Kai slankiklis judinamas, `value` reikšmė taip pat keičiasi tuo pačiu metu.

Išvaizda:

![Slider](../../Resource/018_slider.png)

Kai `Slider` perstumiamas į kairę, susieta reikšmė `value` tampa `0`. Kai perstumiamas į dešinę, ji tampa `1`.

### Reikšmių intervalas

`Slider` reikšmių intervalas nėra fiksuotas. Jį taip pat galima rašyti taip:

```swift
0...100
```

arba kitu intervalu.

Tačiau šioje fill light programėlėje mums reikia valdyti ryškumą, todėl `0...1` yra tinkamiausias pasirinkimas.

## `Slider` naudojimas ryškumui valdyti

Dabar turime sujungti `Slider` su `brightness`.

Pirmiausia sukurkime kintamąjį ryškumo reikšmei saugoti:

```swift
@State private var slider = 0.0
```

Čia `0.0` yra `Double` tipo reikšmė.

Kadangi `Slider` paprastai susiejamas su skaitiniu tipu, o čia norime, kad reikšmė keistųsi tolygiai, `Double` yra tinkamesnis. Be to, `brightness` gali priimti tik `Double` tipo reikšmę.

Tada perduokime šią reikšmę į `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Kai `slider == 0`, spalva lieka savo numatytojoje būsenoje. Kuo `slider` artimesnis `1`, tuo šviesesnė atrodo spalva.

### `Slider` valdiklio pridėjimas

Toliau pridėkime `Slider` valdiklį, kad galėtume keisti šį kintamąjį:

```swift
Slider(value: $slider, in: 0...1)
```

Kai slankiklis keičiasi, `slider` reikšmė taip pat keičiasi, o `brightness(slider)` tuo pačiu metu atnaujina ryškumą.

Tai labai tipiškas pavyzdys, kaip SwiftUI sistemoje „kintamieji valdo vaizdą“.

### `Slider` išvaizdos koregavimas

Pagal numatytąją būseną `Slider` naudoja visą prieinamą plotį.

Galime nustatyti jam fiksuotą plotį:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Tada pridėkime dar keletą modifikatorių, kad jis būtų geriau matomas:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Tai suteikia slankikliui baltą foną ir užapvalintus kampus, todėl jis aiškiau išsiskiria ant `Color` vaizdo.

Galiausiai padėkime jį ekrano apačioje.

Kadangi jau naudojame `ZStack`, galime jo viduje įdėti `VStack` ir naudoti `Spacer()`, kad pastumtume `Slider` žemyn.

## Pilnas kodas

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Rezultatas:

![Color](../../Resource/018_color.png)

## Santrauka

Naudodami anksčiau išmoktą medžiagą kartu su pagrindinėmis sąvokomis, tokiomis kaip spalvos ir masyvai, sukūrėme labai įdomią fill light programėlę.

Per šią fill light programėlę išmokome naudoti `brightness` ryškumui reguliuoti, `onTapGesture` bakstelėjimo veiksmams pridėti prie vaizdų ir `Slider` valdiklį.

Pridėjome `onTapGesture` prie `Color` vaizdo, kad galėtume keisti spalvas. Taip pat naudojome `Slider` valdiklį keisti kintamąjį, valdantį `brightness`, o tai yra dar vienas pavyzdys, kaip „kintamieji valdo vaizdą“.

Taip pat pakartojome ternarinį operatorių, naudojome `ZStack` vaizdams sluoksniuoti ir naudojome masyvus vieno tipo duomenų grupėms valdyti. Tai padeda giliau suprasti masyvus ir indeksus, įskaitant praktinę problemą, kaip išvengti indekso išėjimo už ribų klaidų.

Nors šis pavyzdys nėra sudėtingas, jis sujungia daug pagrindinių idėjų, kurias mokėmės anksčiau. Kai jos panaudojamos mažame tikrame projekte, tampa lengviau suprasti, kam reikalinga kiekviena sąvoka.

### Tikro naudojimo scenarijus

Įsivaizduokite, kad padedate seną iPhone ant stalo ir naudojate savo sukurtą fill light programėlę šviesos spalvai valdyti. Tai būtų labai gera patirtis.

App Store yra daug „fill light“ programėlių, ir jos taip pat neatrodo labai sudėtingos.

![AppStore](../../Resource/018_appStore.PNG)

Galime pradėti kurti paprastas programėles ir bandyti jas paskelbti App Store. Tai ne tik padidina mūsų susidomėjimą kūrimu, bet ir užfiksuoja mūsų augimą.

### Užduotis po pamokos

Galite toliau galvoti, kaip išplėsti šią fill light programėlę, pavyzdžiui:

- Pridėti daugiau spalvų
- Rodyti dabartinę ryškumo reikšmę
- Patobulinti apatinės slankiklio srities dizainą

Kai iš tikrųjų pradėsite naudoti šias žinias, pamatysite, kad kiekviena sąvoka, kurią mokomės, iš tiesų yra įrankis programėlėms kurti.

Kuo daugiau įrankių įvaldome, tuo daugiau funkcijų galime sukurti.
