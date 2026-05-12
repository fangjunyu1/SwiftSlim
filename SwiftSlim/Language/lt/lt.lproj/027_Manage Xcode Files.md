# Xcode failų valdymas

Šioje pamokoje mokysimės dažnų failų veiksmų Xcode aplinkoje.

Ankstesnėse pamokose daugumą kodo rašėme `ContentView` viduje. Taip patogu stebėti kodą ir rodymo rezultatą.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Tačiau tikroje App programoje paprastai nerašome viso kodo viename faile.

Kai puslapių, komponentų ir funkcijų vis daugėja, skirtingus vaizdus reikia išskaidyti į skirtingus SwiftUI failus.

Pavyzdžiui:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Taip kodo struktūra tampa aiškesnė, o vėliau jį lengviau prižiūrėti ir keisti.

## Kodėl reikia valdyti failus

SwiftUI aplinkoje vieną puslapį arba vieną komponentą dažnai galima parašyti kaip atskirą vaizdo failą.

Pavyzdžiui:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Čia `CardView` yra SwiftUI vaizdas.

Jei visi vaizdai būtų rašomi `ContentView` viduje, kodas taptų vis ilgesnis ir vis sunkiau skaitomas.

Todėl turime išmokti kurti, pervardyti ir ištrinti failus, taip pat naudoti aplankus skirtingiems kodo failams tvarkyti.

## SwiftUI failo kūrimas

Xcode aplinkoje SwiftUI failą dažniausiai galima sukurti dviem būdais:

vienas būdas yra sukurti tuščią failą, o tada patiems parašyti kodą.

kitas būdas yra sukurti SwiftUI šablono failą, kad Xcode automatiškai sugeneruotų pradinį kodą.

Pradedantiesiems labiau rekomenduojama naudoti SwiftUI šablono failą, nes jis automatiškai sugeneruoja pagrindinę struktūrą.

### Tuščio failo kūrimas

Xcode kairėje esančioje Navigator srityje dešiniuoju pelės mygtuku spustelėkite tuščią vietą arba aplanką ir pasirinkite `New Empty File`.

Veiksmo vieta parodyta toliau:

![xcode](../../../Resource/027_view1.png)

Sukūrus tuščią failą, Xcode paprastai sugeneruoja neįvardytą Swift failą, pavyzdžiui, `Untitled.swift`.

Galime jį pervadinti į `TestView.swift`.

SwiftUI projekte, jei šis failas naudojamas vaizdui rodyti, paprastai rekomenduojama pavadinimo pabaigoje pridėti `View`.

Pavyzdžiui:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Tai nėra privaloma taisyklė, bet taip iš pirmo žvilgsnio galima suprasti, kad tai yra vaizdo failas.

Sukūrus tuščią failą, faile gali būti tik numatytieji komentarai arba jis gali būti tuščias. Tai priklauso nuo Xcode versijos ir kūrimo būdo.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Tada reikia rankiniu būdu parašyti SwiftUI kodą:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Taip sukuriamas paprastas SwiftUI vaizdo failas.

### Failo pervardijimas

Jei sukūrę failą norite pakeisti jo pavadinimą, Xcode kairėje esančioje Navigator srityje pasirinkite failą, tada paspauskite grįžimo klavišą `⏎`.

![xcode](../../../Resource/027_view2.png)

Taip galima pakeisti failo pavadinimą.

Svarbu atkreipti dėmesį, kad pakeitus failo pavadinimą, vaizdo pavadinimas kode automatiškai nepasikeičia.

Pavyzdžiui, pakeitus failo pavadinimą į `ProfileView.swift`, kode vis dar gali likti `struct TestView: View`.

Nors tai nebūtinai sukels klaidą, lengvai gali kilti painiava.

Todėl rekomenduojama išlaikyti failo pavadinimo ir vaizdo pavadinimo nuoseklumą. Pavyzdžiui, jei failo pavadinimas yra `ProfileView.swift`, vaizdo pavadinimas taip pat turėtų būti `ProfileView`.

## SwiftUI šablono failo kūrimas

Be tuščio failo kūrimo, galime tiesiogiai sukurti SwiftUI šablono failą.

Xcode kairėje esančioje Navigator srityje dešiniuoju pelės mygtuku spustelėkite tuščią vietą arba aplanką ir pasirinkite `New File from Template...`.

Veiksmo vieta parodyta toliau:

![xcode](../../../Resource/027_view3.png)

Atsidariusiame lange viršuje galima pasirinkti skirtingas platformas, pavyzdžiui, `iOS`, `macOS` ir kt.

Čia palikite pasirinktą dabartinį projektą atitinkančią platformą. Pavyzdžiui, jei kuriame iOS App, pasirenkame `iOS`.

![xcode](../../../Resource/027_view4.png)

Tada apačioje pasirinkite `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Tada spustelėkite `Next`, įveskite failo pavadinimą ir išsaugokite.

Pavyzdžiui, sukuriame `Test2View.swift`.

Xcode automatiškai sugeneruos į toliau pateiktą panašų kodą:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Palyginti su tuščiu failu, šablono faile automatiškai yra `import SwiftUI`, `struct`, `body` ir `#Preview`.

Todėl pradedantiesiems naudoti SwiftUI šablono failą yra paprasčiau ir mažiau tikėtina, kad bus praleistas reikalingas kodas.

**Patarimas**: failą galima sukurti ne tik spustelėjus dešiniuoju pelės mygtuku. Taip pat galima spustelėti pliuso mygtuką Xcode kairės Navigator srities apačioje ir sukurti failą arba aplanką.

![xcode](../../../Resource/027_view5.png)

## Aplanko kūrimas

Kai failų daugėja, galime juos tvarkyti naudodami aplankus.

Xcode kairėje esančioje Navigator srityje dešiniuoju pelės mygtuku spustelėkite tuščią vietą arba aplanką ir pasirinkite `New Folder`.

Sukūrus aplanką, susijusius failus galima nutempti į aplanką.

![xcode](../../../Resource/027_view7.png)

Aplankai daugiausia naudojami projekto struktūrai tvarkyti ir nekeičia paties vaizdo naudojimo būdo.

Kol vaizdo pavadinimas teisingas, kituose failuose jį vis tiek galima naudoti tokiais būdais kaip `TestView()` ir `Test2View()`.

## Failo arba aplanko ištrynimas

Jei norite ištrinti failą arba aplanką, Xcode kairėje esančioje Navigator srityje pasirinkite atitinkamą failą, tada spustelėkite dešiniuoju pelės mygtuku ir pasirinkite `Delete`.

Taip pat galite pasirinkti failą ir paspausti trynimo klavišą `⌫`.

Xcode parodys ištrynimo patvirtinimo langą.

![xcode](../../../Resource/027_view10.png)

Pasirinkimas `Move to Trash` reiškia, kad failas bus perkeltas į šiukšlinę.

Jei matote `Remove Reference`, tai reiškia, kad iš Xcode projekto pašalinama tik nuoroda, bet originalus failas diske neištrinamas.

Pradedantiesiems, jei tiesiog trinate ką tik sukurtą įprastą failą, paprastai pakanka pasirinkti `Move to Trash`.

## Kelių SwiftUI vaizdų rodymas

Išmokę kurti failus, galime skirtingus vaizdus išskaidyti į skirtingus failus.

Pavyzdžiui, sukuriame du SwiftUI failus:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` naudojamas autoriaus vardui rodyti:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` naudojamas kortelės fonui rodyti:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Tada šiuos du vaizdus galime naudoti `ContentView` viduje:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Paleidus galima matyti, kad `CardView` ir `AuthorView` rodomi kartu:

![xcode](../../../Resource/027_view11.png)

Šiame rezultate `CardView` veikia kaip fonas, o `AuthorView` rodomas viršuje, nes jie įdėti į `ZStack`.

`ContentView` viduje šiuos du vaizdus naudojame per `CardView()` ir `AuthorView()`. Po pavadinimo esantys `()` reiškia šio vaizdo sukūrimą ir naudojimą.

Tai yra dažnas SwiftUI vaizdų įdėjimas: viename vaizde galima toliau naudoti kitus vaizdus.

## Įėjimo failas

Galiausiai dar kartą peržvelkime, nuo kur App pradeda rodyti sąsają.

SwiftUI projekte paprastai yra įėjimo failas:

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

Čia `@main` reiškia, kad tai yra App įėjimo vieta.

`WindowGroup` viduje matome:

```swift
ContentView()
```

Tai reiškia, kad paleidus App pirmiausia rodomas `ContentView`.

Tada `ContentView` viduje dar rodoma:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Todėl vaizdų hierarchiją galima suprasti taip:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Jei įėjimo faile rodomą vaizdą pakeisime į `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Tada paleidus App bus rodomas tik `CardView`.

Kitaip tariant, įėjimo kode esantis `WindowGroup` nurodo, kuris vaizdas pirmiausia rodomas paleidus App.

O šio vaizdo viduje gali būti toliau rodomi kiti vaizdai.

## Santrauka

Šioje pamokoje mokėmės dažnų failų valdymo veiksmų Xcode aplinkoje.

Sužinojome, kaip kurti SwiftUI failus, kaip pervardyti failus, kaip kurti aplankus ir kaip ištrinti failus.

Kartu išmokome svarbią sąvoką: SwiftUI vaizdus galima išskaidyti į skirtingus failus, o tada naudoti kituose vaizduose.

Pavyzdžiui:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Čia `CardView()` ir `AuthorView()` yra kitų vaizdų naudojimas `ContentView` viduje.

Galiausiai taip pat peržvelgėme įėjimo failo rodymo logiką.

Paleidžiant App, pirmiausia patenkama į įėjimo kodą, pažymėtą `@main`, o tada rodomas `WindowGroup` viduje esantis vaizdas.

Tai padeda suprasti, kad skirtingi SwiftUI failai nėra izoliuoti. Jie gali būti tarpusavyje derinami ir galiausiai sudaryti visą App sąsają.
