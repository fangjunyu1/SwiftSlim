# Pradėkime nuo ContentView

## Pasiruošimas prieš pamoką

Šioje pamokoje pradėsime nuo `ContentView.swift` failo ir sistemingai susipažinsime su pagrindine SwiftUI struktūra, įskaitant:

- komentarus
- View struktūrą
- VStack / HStack / ZStack išdėstymą
- SF Symbols piktogramas
- vaizdo modifikatorius (modifier)
- peržiūros kodą `#Preview`

Pirmiausia suraskite anksčiau sukurtą Xcode projektą ir dukart spustelėkite `.xcodeproj` failą.

Kairėje Navigator srityje pasirinkite `ContentView.swift` failą.

Pastaba: kiekvieną kartą atidarius projektą, Canvas gali rodyti "Preview paused". Paspauskite atnaujinimo mygtuką ir peržiūra bus atkurta.

![Swift](../../RESOURCE/002_view7.png)

## Susipažinimas su ContentView

ContentView kodas:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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

Nors kodo nėra daug, jame jau yra pagrindinė SwiftUI struktūra.

### 1. Komentarai

Failo viršuje:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Tai yra failo komentaras, naudojamas failo informacijai įrašyti, įskaitant failo pavadinimą, projekto pavadinimą, kūrėją ir sukūrimo laiką.

Swift kalboje vienos eilutės komentarams naudojamas `//`:

```swift
// Tai komentaras
```

Komentarai padeda pagerinti kodo skaitomumą ir padeda kūrėjams suprasti kodo logiką.

Praktiniame kūrime kodas kartais gali tapti sunkiai suprantamas. Jei nepaliksite komentarų, galite po trijų dienų nebesuprasti net savo paties parašyto kodo.

Todėl aktyviai pridėti komentarus rašant kodą yra geras kūrimo įprotis. Komentarai padeda užfiksuoti logiką ir palengvina vėlesnę priežiūrą.

**Laikinas kodo išjungimas**

Komentarai taip pat gali būti naudojami laikinai išjungti kodą, kad būtų lengviau ieškoti problemų.

Pavyzdžiui:

```
A
B
C
```

A, B ir C yra trys kodo dalys, o viena iš jų turi klaidą. Tokiu atveju galime laikinai komentuoti kodą ir taip ieškoti problemos.

Pirmiausia pridedame komentarą prie A:

```
// A
B
C
```

Jei pakomentavus A kodas vėl veikia normaliai, tai reiškia, kad problema yra A dalyje.

Jei pakomentavus A problema išlieka, galime pakomentuoti B ir taip tęsti tol, kol surasime klaidingą kodą.

Kūrimo metu kyla daug problemų, todėl dažnai tenka naudoti komentarus problemos priežasčiai aiškintis. Tai padeda tiksliai nustatyti, kuri kodo dalis sukelia BUG.

Xcode aplinkoje galite naudoti klavišų kombinaciją:

```
Command ⌘ + /
```

ji leidžia greitai pridėti arba pašalinti komentarą.

### 2. SwiftUI karkaso importavimas

```swift
import SwiftUI
```

Ši eilutė reiškia, kad importuojamas SwiftUI karkasas.

SwiftUI `View`, `Text`, `Image`, `VStack` ir kiti tipai priklauso šiam karkasui.

Jei SwiftUI karkaso neimportuosite, Xcode parodys klaidą:

```
Cannot find type 'View' in scope
```

Tai reiškia, kad kompiliatorius negali atpažinti `View` tipo.

### 3. View struktūra

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Pirmą kartą pamačius tokią View struktūrą, ji gali atrodyti neįprasta, nes joje yra tokie raktažodžiai kaip `struct`, `View`, `var`, `body`, `some`.

Mes jų dar nesimokėme, tačiau kol kas užtenka suprasti, kad ši kodo dalis sukuria View vaizdą pavadinimu `ContentView`.

Galite įsivaizduoti, kad View yra drobė, ant kurios piešiame, o piešimo įrankis yra SwiftUI.

Pavyzdžiui:

![Swift](../../RESOURCE/002_view.png)

Aukščiau pateiktoje iliustracijoje rodomi trys puslapiai, tačiau iš esmės tai yra trys View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Kai kuriame App naudodami SwiftUI, kiekvienas puslapis yra vienas View.

### 4. SwiftUI kodas

View viduje pateikiamas toks SwiftUI kodas:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Šis SwiftUI kodas reiškia, kad tai vertikalus išdėstymas, kuriame rodomos viena piktograma ir vienas tekstas.

![Swift](../../RESOURCE/002_view1.png)

#### VStack išdėstymas

```swift
VStack { }  // vertikalus išdėstymas
```

`VStack` reiškia vertikalaus išdėstymo konteinerį. Vidiniai vaizdai rikiuojami iš viršaus į apačią.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI dažniausiai naudojami trys išdėstymai:

- VStack —— vertikalus rikiavimas
- HStack —— horizontalus rikiavimas
- ZStack —— sluoksniavimas (Z ašis)

```swift
HStack { }  // horizontalus rikiavimas
ZStack { }  // sluoksniavimas
```

Kiekvieno išdėstymo schema:

![Swift](../../RESOURCE/002_view2.png)

Pavyzdžiui, naudojant `HStack` horizontaliam išdėstymui:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Galima matyti, kad gaublio piktograma ir tekstas rodomi horizontaliai.

![Swift](../../RESOURCE/002_view3.png)

Kai norime elementus išrikiuoti horizontaliai, naudojame `HStack`. Kai reikia juos sluoksniuoti vieną ant kito, naudojame `ZStack`.

#### Image ir SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Šis kodas rodo gaublio piktogramą, kuri gaunama iš Apple SF Symbols piktogramų sistemos.

![Swift](../../RESOURCE/002_view9.png)

Kodo reikšmė: rodyti gaublio piktogramą dideliu dydžiu ir paryškinta akcentine spalva.

Be gaublio piktogramos galime rodyti ir kitas piktogramas.

Pavyzdžiui, kuprinę:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Kaip rodyti kitas piktogramas?**

Tam reikia naudoti Apple oficialiai siūlomą sisteminę piktogramų biblioteką SF Symbols.

Atsidarykite Apple Developer oficialią svetainę ir atsisiųskite [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Atidarykite SF Symbols programėlę.

![Swift](../../RESOURCE/002_sf1.png)

Kairėje rodomos simbolių kategorijos, dešinėje — atitinkamos piktogramos.

Paspaudę piktogramą dešiniuoju pelės klavišu galite pasirinkti "拷贝1个名称", ir bus nukopijuotas atitinkamas tekstinis pavadinimas.

Pavyzdžiui:

```
"globe"
"backpack"
"heart"
```

Įdėję nukopijuotą piktogramos pavadinimą į `Image(systemName:)`, galėsite rodyti skirtingas piktogramas.

Pastaba: kiekviena SF Symbols piktograma turi minimalų palaikomą sistemos versijos reikalavimą. Jei sistemos versija per sena, piktograma gali būti nerodoma. Suderinamumo informaciją reikia tikrinti SF Symbols programėlėje.

#### Modifikatoriai

SwiftUI modifikatorius (modifier) yra būdas pakeisti vaizdo išvaizdą ar elgseną.

Galite įsivaizduoti modifikatorius kaip drabužius: užsidėjus skirtingus drabužius, išvaizda taip pat keičiasi.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` ir `foregroundStyle` yra `Image` vaizdo modifikatoriai. Jie keičia `Image` vaizdo išvaizdą, nepakeisdami paties `Image` turinio.

**1. imageScale**

```swift
.imageScale(.large)
```

Jis leidžia valdyti SF Symbols piktogramos dydį:

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

Galime keisti skirtingus variantus, kad SF Symbols piktograma būtų rodoma skirtingais dydžiais.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` leidžia valdyti priekinio plano spalvą.

`.tint` reiškia dabartinės aplinkos akcentinę spalvą (accent color), kuri pagal nutylėjimą iOS sistemoje yra mėlyna.

Jei norime pakeisti priekinio plano spalvą į raudoną:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text vaizdas

`Text` yra tekstinis vaizdas, naudojamas rodyti eilutėms.

```swift
Text("Hello, world!")
```

Pavyzdžiui, jei norėtume parodyti savo vardą:

```swift
Text("FangJunyu")
```

Pastaba: eilutės turi būti būtinai apgaubtos dvigubomis kabutėmis `""`.

Galite pabandyti parodyti savo vardą, telefono numerį ar kitą tekstą.

#### padding kraštinės

SwiftUI `padding` naudojamas pridėti tarpą tarp vaizdo turinio ir jo ribų, tai yra vidinės paraštės (padding / content inset).

```swift
HStack {
    ...
}
.padding()
```

Šis kodas reiškia, kad `HStack` vaizdui pridedamos numatytosios sistemos paraštės.

**Kas yra padding?**

`padding` reiškia „tuščia erdvė tarp vaizdo turinio ir jo ribų“.

Žemiau esančiame paveikslėlyje mėlynas `HStack` pritaikius `padding` susitraukia į vidų, todėl atrodo tarsi „sumažėjęs vienu sluoksniu“.

![Swift](../../RESOURCE/002_view6.png)

**Numatytosios paraštės**

`padding()` modifikatorius pagal nutylėjimą naudoja sistemos rekomenduojamą standartinį tarpą.

```swift
.padding()
```

Skirtingose platformose ir kontekstuose ši reikšmė gali skirtis, pavyzdžiui:

- iOS sistemoje ji dažniausiai yra apie 16 pt
- macOS ar watchOS platformose standartinis sistemos tarpas gali būti didesnis arba mažesnis, priklausomai nuo konkrečios platformos dizaino gairių

**Pasirinktinės paraštės**

Taip pat galima nustatyti atskiras paraštes konkrečioms kryptims.

1. Nustatyti vieną kryptį

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Krypčių paaiškinimas:

- .top: viršutinė paraštė
- .bottom: apatinė paraštė
- .leading: priekinė paraštė
- .trailing: galinė paraštė

![Swift](../../RESOURCE/002_view12.png)

Pastaba: `leading` ir `trailing` automatiškai prisitaiko prie kalbos krypties. Pavyzdžiui, arabų (RTL) aplinkoje jos automatiškai apsiverčia.

2. Nustatyti kelias kryptis

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Naudojant masyvą galima vienu metu nurodyti kelias kryptis. Apie masyvų naudojimą plačiau kalbėsime vėlesnėse pamokose, o kol kas užtenka žinoti, kad tokia forma egzistuoja.

3. Nustatyti horizontalią arba vertikalią kryptį

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Tai atitinka:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Pašalinti paraštes**

Jei nenorite jokių paraščių, galite naudoti `.padding(0)`:

```swift
.padding(0)
```

Arba tiesiog pašalinti `padding` modifikatorių:

```swift
// .padding()
```

### 6. Preview peržiūros kodas

```swift
#Preview {
    ContentView()
}
```

Šis kodas reiškia, kad Canvas lange generuojama `ContentView` peržiūra.

Pastaba: `#Preview` yra nauja sintaksė, įvesta Swift 5.9 / Xcode 15. Iki tol buvo naudojama `PreviewProvider` struktūra.

**Kas nutiks, jei pakomentuosime Preview?**

Jei Preview bus pakomentuotas:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas daugiau neberodys jokio atvaizduojamo turinio.

![Swift](../../RESOURCE/002_xcode.png)

Taip yra todėl, kad `#Preview` valdo, koks peržiūros vaizdas rodomas Canvas.

Kai norime Xcode aplinkoje peržiūrėti SwiftUI vaizdą, pridedame `#Preview` kodą. Jei peržiūros nereikia, galime jį pakomentuoti arba ištrinti.

## Santrauka

Nors `ContentView.swift` faile nėra daug kodo, jame iš tikrųjų jau yra keletas pagrindinių SwiftUI sąvokų. Pradedančiajam šis kodas gali atrodyti neįprastas, tačiau išskaidžius jo struktūrą galima susikurti pradinį supratimą apie SwiftUI.

Peržvelkime, ką išmokome šioje pamokoje. Pirmiausia išmokome komentarus `//`, kurie gali būti naudojami kodo logikai paaiškinti arba laikinai išjungti tam tikras kodo dalis.

Toliau supratome, kad SwiftUI failas turi importuoti SwiftUI karkasą:

```swift
import SwiftUI
```

Jei karkaso neimportuosime, kompiliatorius neatpažins tokių tipų kaip `View`.

Tada susipažinome su pagrindine SwiftUI vaizdo struktūra:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Čia `ContentView` yra vaizdo pavadinimas.

Taip pat išmokome tris dažnai naudojamus išdėstymo konteinerius: `VStack` (vertikalus rikiavimas), `HStack` (horizontalus rikiavimas) ir `ZStack` (sluoksniavimas).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Šis kodas reiškia, kad rodomas vertikalus konteineris, kurio viduje yra viena piktograma ir vienas tekstas.

`Image` gali rodyti SF Symbols piktogramas, o modifikatoriai leidžia valdyti jų dydį ir spalvą.

`Text` vaizdas rodo tekstinį turinį.

`padding` reiškia paraštes ir prideda skaidrią erdvę aplink vaizdą.

Galiausiai, `#Preview` leidžia rodyti peržiūros vaizdą Canvas lange.

### Užduotys po pamokos

Pradedantiesiems ši pamoka gali atrodyti gana sudėtinga. Tolimesnės praktikos užduotys gali padėti geriau įtvirtinti supratimą:

- pakeisti SF Symbols piktogramos pavadinimą
- pakeisti piktogramos priekinio plano spalvą į juodą
- pakeisti VStack į HStack
- pakomentuoti `Image` arba `Text` ir stebėti, kaip keičiasi peržiūra

### Maža premija: kodo užbaigimas (Code Completion)

Rašydami kodą, galbūt jau pastebėjote, kad Xcode automatiškai parodo galimų variantų sąrašą.

Pavyzdžiui, kai keičiame `imageScale` modifikatorių:

```swift
.imageScale(.)
```

Xcode parodys galimus pasirinkimus:

![Swift](../../RESOURCE/002_view10.png)

Tai yra kodo užbaigimo mechanizmas (Code Completion), paremtas tipo išvedimu ir `enum` narių pasiūlymais. Jis padeda rašyti greičiau ir sumažina klaidų skaičių.

Vėlesnėse pamokose oficialiai susipažinsime su išvardijimais (`enum`), o dabar užtenka tiesiog žinoti, kad toks mechanizmas egzistuoja。
