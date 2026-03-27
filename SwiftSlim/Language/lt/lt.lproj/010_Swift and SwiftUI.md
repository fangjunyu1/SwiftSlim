# Swift ir SwiftUI

Mokantis kurti Apple platformoms, daugelis vadovėlių linkę Swift ir SwiftUI aiškinti atskirai. Dėl to pradedantieji lengvai pajunta dirbtinį atskyrimą ir gali klaidingai manyti, kad tai dvi visiškai nepriklausomos technologijos.

Iš tikrųjų Swift ir SwiftUI yra glaudžiai susijusi visuma: Swift yra programavimo kalba, atsakinga už logiką ir duomenis, o SwiftUI yra Swift pagrindu sukurtas vartotojo sąsajos karkasas, atsakingas už vaizdų atvaizdavimą ir sąveiką.

Ši pamoka padės susidaryti aiškų suvokimo karkasą: kas yra Swift, kas yra SwiftUI ir kaip jos bendradarbiauja kode.

## Kas yra Swift?

Swift yra moderni programavimo kalba, kurią Apple sukūrė programoms, veikiančioms iOS, macOS, watchOS ir tvOS platformose, kurti.

![swift](../../RESOURCE/010_swift.png)

Swift yra stipriai tipizuota, statiška kalba, kuri projektuojama skiriant didesnį dėmesį saugumui ir sumažinant daugelį įprastų programavimo klaidų (pavyzdžiui, `nil` rodykles, ribų viršijimą ir pan.), taip pat palaiko sklandžią integraciją su C ir Objective-C.

Praktiniame kūrime Swift daugiau atsakinga už programos logiką, pavyzdžiui, duomenų apdorojimą, tinklo užklausas, saugojimo operacijas ir kt.

## Kas yra SwiftUI?

SwiftUI yra naujas sąsajų kūrimo karkasas, kurį Apple pristatė 2019 metais. SwiftUI taiko deklaratyvų programavimo modelį, leidžiantį kūrėjams glaustesniu kodu aprašyti sąsajos struktūrą ir sąveikos elgseną.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklaratyvus programavimas reiškia, kad kūrėjui tereikia nurodyti, ką sistema turi rodyti, o sistema pati automatiškai atnaujina vaizdą pagal duomenų pokyčius. Nebereikia rankiniu būdu valdyti sąsajos būsenos, todėl UI kūrimas tampa gerokai paprastesnis.

SwiftUI branduolį sudaro vaizdo komponentai (tokie kaip `Text`, `Image`, `Button` ir kt.) ir išdėstymo konteineriai (tokie kaip `VStack`, `HStack`, `ZStack`). Šie komponentai sąveikauja per duomenų susiejimą ir būsenos valdymą, todėl sąsaja gali reaguoti į duomenų pokyčius ir automatiškai atsinaujinti.

## Kaip bendradarbiauja Swift ir SwiftUI?

Swift ir SwiftUI atsakomybes galima apibendrinti taip:

**1. Swift: logikos ir duomenų apdorojimas**

Swift daugiausia naudojama duomenims valdyti, būsenai saugoti ir logikai vykdyti. Šis kodas paprastai tiesiogiai neveikia sąsajos braižymo, bet atsako už duomenų ir elgsenos apdorojimą.

Pavyzdžiui, duomenų apdorojimas Swift kalboje:

```swift
let markdown = try? String(contentsOf: url)
```

Toks kodas apima kintamųjų deklaracijas, konstantas, funkcijas, valdymo srautą ir pan., tačiau tiesiogiai nelemia vaizdo rodymo.

**2. SwiftUI: sąsajos deklaravimas ir braižymas**

SwiftUI naudojama vartotojo sąsajos išdėstymui ir turiniui kurti, daugiausia atsako už sąsajos braižymą ir sąveiką.

Pavyzdžiui, teksto vaizdo sukūrimas naudojant SwiftUI:

```swift
Text("SwiftSlim")
```

Tai yra kodas, naudojamas sąsajos elementams kurti ir valdyti, tiesiogiai sąveikaujantis su vartotojo sąsaja.

### Pagrindinis pavyzdys

Toliau pateikiamas paprastas SwiftUI pavyzdys:

```swift
// ContentView.swift

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

#Preview {
    ContentView()
}
```

Šiame pavyzdyje:

**SwiftUI kodas**: `VStack`, `Image`, `Text`, `padding` priklauso SwiftUI ir atsako už sąsajos rodymą bei išdėstymą.

**Swift kodas**: failo viršuje esantis `//` komentaras ir `import SwiftUI` priklauso Swift kodo struktūrai; apačioje esantis `#Preview` yra Xcode peržiūros makrokomanda ir faktiniame sąsajos braižyme nedalyvauja.

### Pažangesnis pavyzdys

Realiuose projektuose Swift ir SwiftUI dažnai naudojamos kartu, kad atliktų tai, ką moka geriausiai:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Šiame pavyzdyje:

**SwiftUI kodas**: `@State` yra SwiftUI būdingas savybių apvalkalas, naudojamas vaizdo kintamai būsenai deklaruoti; `Button` ir `Text` yra SwiftUI vaizdo komponentai, atsakingi už rodymą ir vartotojo sąveiką.

**Swift kodas**: `private var name` ir `func printName()` yra Swift kodas, naudojamas duomenims saugoti ir logikai vykdyti, tačiau tiesiogiai nelemia vaizdo braižymo.

Kai naudotojas paspaudžia mygtuką, SwiftUI suaktyvina mygtuke esantį veiksmų kodą:

```swift
Button("Print") {
    printName()
}
```

Čia `Button` yra SwiftUI komponentas, o vykdoma funkcija `printName()` yra Swift kodas, atsakingas už konkrečią logiką.

Toks bendradarbiavimas leidžia Swift ir SwiftUI sklandžiai veikti kartu: Swift atsako už duomenis ir logiką, o SwiftUI - už vartotojo sąsajos rodymą.

## Kur paprastai rašomas Swift ir SwiftUI kodas?

SwiftUI aplinkoje sąsaja konstruojama iš vaizdų, grąžinamų per `body` savybę. Todėl visas kodas, skirtas sąsajai aprašyti, paprastai rašomas `body` viduje.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Šiame pavyzdyje `Text` yra SwiftUI vaizdo komponentas, todėl jis turi būti rašomas `body` viduje, nes SwiftUI per `body` nuskaito ir sugeneruoja sąsają.

Su sąsaja nesusijęs kodas, pavyzdžiui, kintamieji, funkcijos ar duomenų apdorojimo logika, paprastai rašomas už `body` ribų. Pavyzdžiui:

```swift
struct ContentView: View {

    // Swift: duomenys arba logika
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: sąsaja
    var body: some View {
        Text(name)
    }
}
```

Svarbu atkreipti dėmesį, kad `body` viduje vis tiek galima naudoti Swift sintaksę, pavyzdžiui, `if`, `for` ir kitus valdymo srauto sakinius; jie tiesiog naudojami SwiftUI vaizdams generuoti:

```
if isLogin {
    Text("Welcome")
}
```

Todėl kuriant SwiftUI galima paprastai suprasti taip: vaizdo kodas (`Text`, `Image`, `Button` ir pan.) paprastai rašomas `body` viduje, o duomenų ir logikos kodas (kintamieji, funkcijos ir pan.) - už `body` ribų.

## Swift failai

Toliau mokantis susidursime ir su MVVM architektūra, kurioje `ViewModel` ir `Model` sluoksniai paprastai sudaryti iš gryno Swift kodo ir yra visiškai atskirti nuo vaizdo sluoksnio (SwiftUI).

Pavyzdžiui, klasė, naudojama programos būsenai valdyti:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Arba struktūra, aprašanti duomenų modelį:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Tokių failų paskirtis - duomenų valdymas ir išsaugojimas, jie nėra tiesiogiai rodomi sąsajoje, todėl visiškai priklauso Swift sričiai.

## Istorinis kontekstas

Norint suprasti Swift ir SwiftUI santykį, taip pat reikia žinoti Apple kūrimo technologijų raidą. Iki 2026 metų ši technologijų aibė jau buvo perėjusi ne vieną iteraciją.

### Swift istorija

Prieš atsirandant Swift, pagrindinė Apple platformų programavimo kalba buvo Objective-C, palaikanti mišrų naudojimą su C kalba. Jos sintaksė gana gremėzdiška, todėl pradedantiesiems slenkstis buvo aukštas:

```Obj-c
// Objective-C rašymo būdas
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 metais Apple WWDC konferencijoje pristatė Swift kalbą. Swift sintaksė modernesnė, tipų saugumas didesnis, ir ji palaipsniui pakeitė Objective-C kaip pagrindinę kūrimo kalbą:

```swift
// Swift rašymo būdas
let name = "Fang"
print("Hello, \(name)")
```

Tačiau Objective-C dėl to neišnyko. Ji vis dar plačiai naudojama daugelyje esamų projektų ir žemo lygio karkasų. Suprasti jos pagrindinę sintaksę vis dar naudinga prižiūrint senesnius projektus ir geriau suvokiant sistemos pagrindus.

### SwiftUI istorija

Iki SwiftUI atsiradimo iOS naudojo **UIKit**, o macOS - **AppKit**. Šie du karkasai rėmėsi „imperatyviu“ programavimo būdu. Kūrėjai turėdavo per `Storyboard` tempdami valdiklius arba ranka rašydami kodą valdyti vaizdo būseną. Kodo būdavo daug, priežiūros kaina aukšta, ypač kai sąsajos logika tapdavo sudėtinga.

![storyboard](../../RESOURCE/010_xcode.png)

2019 metais Apple WWDC konferencijoje oficialiai pristatė SwiftUI. SwiftUI atnešė „deklaratyvią“ programavimo paradigmą ir smarkiai supaprastino UI kūrimo procesą.

![storyboard](../../RESOURCE/010_xcode1.png)

Svarbu pažymėti, kad SwiftUI nėra visiškai nepriklausomas apatinio lygio įgyvendinimas. Skirtingose platformose jis iš esmės bendradarbiauja ir yra sujungtas su UIKit (iOS) arba AppKit (macOS), todėl apačioje vis dar remiasi šiais dviem karkasais.

### Swift ir UIKit/AppKit santykis

Nors Swift yra bendros paskirties programavimo kalba, galinti veikti įvairiose Apple platformose, ji negali visiškai pakeisti UIKit ar AppKit. Kai kuriems sudėtingesniems sąsajos poreikiams arba funkcijoms, kurių SwiftUI dar neapima, vis dar reikia pasitelkti UIKit arba AppKit.

Pavyzdžiui, UIKit jau labai brandus valdant sudėtingus vaizdo valdiklius, animacijas, gestų atpažinimą ir kitus aspektus, sukaupęs daug patikrintos praktikos. Nors SwiftUI galimybės nuolat stiprėja, tam tikrose ribinėse situacijose jis vis dar turi apribojimų.

Todėl daugelis kūrėjų projektuose maišo SwiftUI su UIKit (arba AppKit), kad pasinaudotų abiejų stiprybėmis.

Šiuo požiūriu SwiftUI galima suprasti kaip aukštesnio lygio `UIKit / AppKit` apvalkalą. Mokantis SwiftUI verta bent šiek tiek susipažinti ir su pagrindinėmis UIKit bei AppKit sąvokomis, nes tai padeda prižiūrėti senesnius projektus arba protingiau spręsti sudėtingų funkcijų įgyvendinimą.

## Santrauka

**Swift**: daugiausia naudojama logikai, duomenų apdorojimui ir valdymo srautui rašyti, nesusijusiems su vaizdo išdėstymu.

**SwiftUI**: naudojama deklaratyviai kurti vartotojo sąsają; vaizdo turinio ir išdėstymo kodas priklauso SwiftUI.

Praktiniame kūrime Swift ir SwiftUI paprastai naudojamos kartu: Swift tvarko logiką, SwiftUI tvarko sąsają.

Nuo Objective-C ir UIKit iki Swift ir SwiftUI Apple kūrimo aplinka palaipsniui perėjo prie modernesnio ir glaustesnio programavimo būdo, tačiau UIKit ir AppKit daugelyje tradicinių projektų vis dar išlieka svarbūs.

Suprasdami Swift ir SwiftUI santykį, galime efektyviau kurti iOS/macOS programas ir prižiūrėdami senesnius projektus priimti labiau pagrįstus techninius sprendimus.
