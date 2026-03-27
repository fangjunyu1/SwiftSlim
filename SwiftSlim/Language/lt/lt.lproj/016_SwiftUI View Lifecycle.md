# SwiftUI vaizdo gyvavimo ciklas

Ankstesnėje pamokoje sužinojome, kad `@State` kintamieji seka vaizdo gyvavimo ciklą, taip pat išmokome pagrindinį `onAppear` naudojimą.

Šioje pamokoje dar giliau suprasime SwiftUI vaizdo gyvavimo ciklą: kaip vaizdas sukuriamas ir parodomas, kaip jame esantys kintamieji sukuriami ir atkuriami, taip pat susipažinsime su `onAppear`, `onDisappear` ir `init` konstruktoriaus funkcija.

Remdamiesi šiomis žiniomis, susikursime bendrą supratimą apie visą SwiftUI vaizdo kūrimo procesą.

## Programos paleidimo seka

Kuriant iOS projektą, Xcode pagal numatymą sugeneruoja du failus:

```
ContentView.swift
ProjectName + App.swift
```

Tarp jų failas „projekto pavadinimas + `App`.swift“ yra visos programos įėjimo taškas.

Pavyzdžiui:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Kodo vykdymo eiga

Kai paleidžiame programą (simuliatoriuje ar tikrame įrenginyje), sistema ieško raktažodžio `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Patvirtinusi įėjimo failą, ji pradeda vykdyti kodą.

Pirmiausia įeinama į `App` struktūrą, vykdomas `body` esantis kodas, tada sukuriamas `WindowGroup` ir įkeliamas jame esantis `ContentView`.

### `WindowGroup` vaidmuo

`WindowGroup` naudojamas langams valdyti:

```swift
WindowGroup {
    ContentView()
}
```

`iPad` ir `macOS` sistemos palaiko kelis langus, o `iPhone` dažniausiai turi tik vieną.

Todėl `WindowGroup` `iPhone` įrenginyje daugiausia valdo pirmąjį rodomą ekraną.

### Vaizdo įkėlimo procesas

Kai sistema suranda `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI vykdo `body` esantį kodą, tada pagal grąžintą vaizdo struktūrą (`VStack`, `Text` ir pan.) sukuria sąsają ir ją parodo ekrane.

Po šių veiksmų jau galime matyti `ContentView`.

![ContentView](../../Resource/016_view1.png)

Svarbu: `body` paskirtis yra generuoti vaizdą, o ne jį saugoti.

Tai reiškia, kad kiekvieną kartą, kai vaizdas atsinaujina, SwiftUI perskaičiuoja `body` ir sugeneruoja naują vaizdo struktūrą.

### Peržiūros logika

Xcode peržiūra (`Canvas`) ir tikras programos vykdymas yra du skirtingi mechanizmai.

Pavyzdžiui, jei į įėjimo failą pridėsime derinimo išvestį:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Kai Xcode aplinkoje peržiūrime `ContentView`, vykdymas neprasideda nuo `@main` įėjimo, todėl `onAppear` įėjimo faile nesuveikia.

Tačiau paleidus programą simuliatoriuje ar tikrame įrenginyje, sistema pradeda nuo `@main`, pilnai paleidžia visą programą, todėl įėjimo faile esantis `onAppear` suveikia ir išveda derinimo informaciją.

Svarbiausia čia tai, kad Xcode peržiūra yra tik „dalinis atvaizdavimas“, skirtas tik esamo vaizdo rodymui; o simuliatorius ir tikras įrenginys suteikia „pilną vykdymo aplinką“, kuri vykdo visą programą.

Todėl, testuojant programos funkcionalumą, reikėtų remtis simuliatoriumi arba tikru įrenginiu, nes Xcode peržiūra negali pateikti pilnos vykdymo aplinkos.

## Vaizdo gyvavimo ciklas

Dabartiniame etape visas mūsų kodas sutelktas `ContentView` viduje. Tačiau realioje programoje dažniausiai būna keli vaizdai, tarp kurių pereinama skirtingose situacijose.

Pavyzdžiui, „taupyklės“ projekte:

![PiggyBank](../../Resource/016_view.png)

Kai paspaudžiama „Save“, parodomas `SaveView`; kai taupymas baigiamas arba langas uždaromas, `SaveView` pašalinamas.

Šis procesas ir yra vaizdo gyvavimo ciklas: vaizdo sukūrimas, jo parodymas ir galiausiai pašalinimas.

### Programos uždarymas

Kai programa uždaroma, visi vaizdai pašalinami, o susijusi būsena išnyksta.

Todėl `ContentView` ir kiti vaizdai pašalinami iš atminties, o visa programos vykdymo būsena išvaloma.

## Vaizde esančių kintamųjų gyvavimo ciklas

SwiftUI sistemoje kintamųjų gyvavimo ciklas dažniausiai susietas su vaizdu.

Pavyzdžiui:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` kintamasis

`@State` deklaruotas kintamasis yra susietas su vaizdo gyvavimo ciklu.

```swift
@State private var name = "FangJunyu"
```

Kai vaizdas sukuriamas, `name` taip pat sukuriamas; kai vaizdas pašalinamas, `name` taip pat sunaikinamas.

Būtent todėl, kai reikia duomenų išsaugojimo ilgam, naudojame `UserDefaults` ir panašius būdus.

### Kintamasis `body` viduje

Kai kintamasis apibrėžiamas `body` viduje:

```swift
var num = 10
```

Jo gyvavimo ciklas susietas su `body` vykdymo procesu.

Kai SwiftUI būsena pasikeičia, pavyzdžiui:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Kai `name` pasikeičia, `@State` aptinka šį pokytį, praneša SwiftUI perskaičiuoti vaizdą, ir `body` apskaičiuojamas iš naujo.

Kai `body` perskaičiuojamas, visas `body` viduje esantis kodas vykdomas dar kartą, todėl `body` kintamieji (pvz., `num`) sukuriami iš naujo.

Todėl nerekomenduojama `body` viduje laikyti sudėtingų kintamųjų.

Kiekvieną kartą atnaujinus vaizdą, `body` viduje esantys kintamieji kuriami iš naujo, o tai didina skaičiavimo kainą ir gali neigiamai veikti našumą.

SwiftUI aplinkoje skirtingų tipų duomenys turėtų būti valdomi skirtingai: duomenis, kurie turi sekti vaizdo gyvavimo ciklą, galima saugoti su `@State`, o laikinus skaičiavimo duomenis galima dėti į `body`.

## `onAppear` ir `onDisappear`

Ankstesnėje pamokoje jau mokėmės `onAppear`: kai vaizdas parodomas, `onAppear` yra iškviečiamas.

```swift
.onAppear {}
```

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcode peržiūroje arba vykdymo metu galima pamatyti `onAppear` išvestą derinimo informaciją.

### `onDisappear`

Atitinkamas `onAppear` partneris yra `onDisappear`:

```swift
.onDisappear {}
```

Kai vaizdas uždaromas, `onDisappear` yra iškviečiamas.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Kai vaizdas pašalinamas, įvykdomas `onDisappear` viduje esantis kodas.

Patarimas: dabartiniame etape naudojamas `ContentView` yra programos šakninis vaizdas, todėl jo negalima tiesiogiai uždaryti ar pašalinti. Dėl šios priežasties kol kas negalime tiesiogiai stebėti `onDisappear` efekto.

Tik vėliau, kai mokysimės puslapių perėjimo ir naujų vaizdų atidarymo, bus galima pamatyti, kaip `onDisappear` yra iškviečiamas.

## Sukūrimo ir rodymo logika

Svarbu suprasti, kad vaizdo sukūrimas ir jo parodymas yra du skirtingi etapai.

Kai vaizdas sukuriamas, iškviečiamas struktūros konstruktorius:

```swift
init() {}
```

Kadangi SwiftUI vaizdas yra `struct` struktūra:

```swift
struct ContentView: View { ... }
```

Todėl, kai sukuriamas vaizdo egzempliorius, įvykdomas `init` konstruktorius. Kai vaizdas parodomas, tik tada iškviečiamas `onAppear`.

Pavyzdžiui:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Peržiūrint vaizdą Xcode, galima matyti tokią derinimo išvestį:

```swift
Create ContentView
Show ContentView
```

Tai parodo, kad pirmiausia vykdomas `init`, sukuriantis vaizdą, tada apskaičiuojamas `body`, ir tik galiausiai vaizdas parodomas bei iškviečiamas `onAppear`.

Todėl svarbu suprasti, kad vaizdo sukūrimo ir rodymo etapai yra atskirti.

### `init` konstruktorius

`init` yra pagrindinė Swift sintaksės dalis; jį gali apibrėžti tiek `struct`, tiek `class`, ir jis naudojamas objekto inicializavimui.

```swift
init() {}
```

SwiftUI sistemoje, kai vaizdas sukuriamas, sistema iškviečia to vaizdo `init` metodą. Jis gali būti naudojamas parametrams priimti ar duomenims inicializuoti.

Jei `init` nerašome ranka, Swift `struct` tipui automatiškai sugeneruoja numatytąjį konstruktorių.

Tokiems SwiftUI vaizdams kaip `ContentView` galioja paprasta taisyklė: kai vaizdas sukuriamas, vykdomas `init`; kai vaizdas parodomas, vykdomas `onAppear`.

Todėl `init` yra konstruktorius, vykdomas vaizdo sukūrimo metu, ir vėliau jis bus naudingas perduodant parametrus ar inicializuojant duomenis.

## Santrauka

Šioje pamokoje išmokome programos paleidimo seką - nuo įėjimo failo iki `ContentView` vykdymo proceso.

Taip pat supratome SwiftUI vaizdo gyvavimo ciklą: kai vaizdas sukuriamas, vykdomas `init`; kai jis parodomas ekrane, vykdomas `onAppear`; kai vaizdas pašalinamas arba uždaromas, vykdomas `onDisappear`.

Išmokome ir vaizdo atnaujinimo mechanizmą: vaizdą valdo būsena. Kai pasikeičia `@State` ar kita būsena, SwiftUI atnaujina vaizdą, perskaičiuoja `body`, o `body` viduje esantys kintamieji taip pat sukuriami iš naujo.

Kintamųjų gyvavimo ciklas siejasi su vaizdo gyvavimo ciklu, o `body` viduje esantys laikini duomenys kiekvieną kartą atnaujinant kuriami iš naujo.

Šių gyvavimo ciklų ir kintamųjų elgesio supratimas padeda geriau organizuoti kodą ir daro programos logiką aiškesnę.
