# Začnimo z datoteko ContentView

## Priprava pred začetkom

V tej lekciji bomo začeli z datoteko ContentView.swift in sistematično spoznali osnovno strukturo SwiftUI, vključno z:

- komentarji
- strukturo View
- postavitvami VStack / HStack / ZStack
- ikonami SF Symbols
- modifikatorji pogledov (modifier)
- kodo za predogled #Preview

Najprej poiščite projekt Xcode, ki ste ga ustvarili prej, in dvokliknite datoteko .xcodeproj.

V levem navigacijskem območju Navigator izberite datoteko ContentView.swift.

Opomba: vsakič, ko odprete projekt, lahko Canvas prikaže "Preview paused". Kliknite gumb za osvežitev, da znova omogočite predogled.

![Swift](../../RESOURCE/002_view7.png)

## Spoznajmo ContentView

Koda ContentView:

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

Čeprav je kode razmeroma malo, vsebuje osrednjo strukturo SwiftUI.

### 1. Komentarji

Na vrhu datoteke:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

To je komentar datoteke, ki se uporablja za beleženje informacij o datoteki, vključno z imenom datoteke, imenom projekta, avtorjem in časom ustvarjanja.

V Swiftu se za enovrstični komentar uporablja //:

```swift
// To je komentar
```

Komentarji lahko izboljšajo berljivost kode in razvijalcem pomagajo razumeti logiko kode.

Pri dejanskem razvoju je lahko koda precej težko razumljiva. Če ne pišete komentarjev, se lahko zgodi, da čez tri dni ne boste več razumeli niti lastne kode.

Zato je dobra razvojna navada, da med pisanjem kode aktivno dodajate komentarje. Z njimi lahko zabeležite logiko kode in si olajšate poznejše vzdrževanje.

**Začasno onemogočanje kode**

Komentarji se lahko uporabljajo tudi za začasno izklopitev kode, kar nam pomaga pri odpravljanju težav.

Na primer:

```
A
B
C
```

A, B in C predstavljajo tri dele kode, pri čemer je eden od njih napačen. Za iskanje težave lahko kodo začasno komentiramo.

Najprej komentiramo A:

```
// A
B
C
```

Če po komentiranju A koda ponovno deluje normalno, to pomeni, da je težava v kodi A.

Če se težava po komentiranju A še vedno pojavlja, lahko nato komentiramo še B in tako naprej, dokler ne najdemo problematične kode.

V razvojnem procesu bomo naleteli na veliko težav. Večino časa jih bomo odkrivali tako, da bomo del kode komentirali. To nam pomaga locirati problematičen del kode in najti BUG.

V Xcode lahko uporabite bližnjico na tipkovnici:

```
Command ⌘ + /
```

za hitro dodajanje ali odstranjevanje komentarjev.

### 2. Uvoz ogrodja SwiftUI

```swift
import SwiftUI
```

Ta vrstica pomeni uvoz ogrodja SwiftUI.

Tipi, kot so View, Text, Image in VStack v SwiftUI, prihajajo iz tega ogrodja.

Če ogrodja SwiftUI ne uvozite, bo Xcode prikazal napako:

```
Cannot find type 'View' in scope
```

To pomeni, da prevajalnik ne prepozna tipa View.

### 3. Struktura View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Ko prvič vidite to strukturo View, se vam lahko zdi nenavadna, ker vsebuje ključne besede struct, View, var, body in some.

Teh ključnih besed še nismo obravnavali, zato za zdaj zadostuje, da razumete, da ta koda ustvari pogled View z imenom ContentView.

View si lahko predstavljate kot platno, na katerem lahko rišemo, orodje za to pa je SwiftUI.

Na primer:

![Swift](../../RESOURCE/002_view.png)

Na zgornji sliki so prikazane tri strani, ki so v resnici trije View.

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

Ko razvijamo aplikacijo s SwiftUI, je vsaka stran en View.

### 4. Koda SwiftUI

Znotraj pogleda View je prikazana koda SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ta del kode SwiftUI pomeni, da gre za navpično postavitev, ki prikazuje eno ikono in eno besedilo.

![Swift](../../RESOURCE/002_view1.png)

#### Postavitev VStack

```swift
VStack { }  // navpična postavitev
```

VStack pomeni vsebnik za navpično postavitev. Pogledi v njem so razporejeni od zgoraj navzdol.

![Swift](../../RESOURCE/002_view8.png)

Tri pogoste postavitve v SwiftUI:

* VStack —— navpična razporeditev
* HStack —— vodoravna razporeditev
* ZStack —— nalaganje enega nad drugega (os Z)

```swift
HStack { }  // vodoravna razporeditev
ZStack { }  // nalaganje
```

Shema razporeditve za posamezne postavitve:

![Swift](../../RESOURCE/002_view2.png)

Na primer: vodoravna razporeditev z uporabo HStack.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Vidimo lahko, da sta ikona globusa in besedilo prikazana vodoravno.

![Swift](../../RESOURCE/002_view3.png)

Ko želimo vodoravno razporeditev, uporabimo HStack. Ko potrebujemo nalaganje elementov, uporabimo ZStack.

#### Image in SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Ta koda prikaže ikono globusa, ki prihaja iz Applovega sistema ikon SF Symbols.

![Swift](../../RESOURCE/002_view9.png)

Pomen te kode je prikaz ikone globusa v veliki velikosti in z barvo poudarka.

Poleg ikone globusa lahko prikažemo tudi druge ikone.

Na primer, prikažemo nahrbtnik:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Kako prikazati druge ikone?**

Uporabiti moramo uradno Applovo knjižnico sistemskih ikon SF Symbols.

Odprite uradno spletno stran Apple Developer in prenesite [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Odprite aplikacijo SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Na levi strani so kategorije simbolov, na desni pa pripadajoče ikone.

Z desnim klikom na ikono izberite "Copy Name", da kopirate njeno ime kot ustrezen niz.

Na primer:

```
"globe"
"backpack"
"heart"
```

Kopirano ime ikone vstavite v Image(systemName:), in tako lahko prikažete različne ikone.

Opomba: vsaka ikona SF Symbols ima minimalno podprto različico sistema. Če je različica sistema prenizka, se ikona morda ne bo prikazala. Združljivost lahko preverite v aplikaciji SF Symbols.

#### Modifikatorji

V SwiftUI so modifikatorji (modifier) metode, ki se uporabljajo za spreminjanje videza ali vedenja pogleda.

Modifikatorje si lahko predstavljate kot oblačila. Ko pogled oblečemo v različna oblačila, bo tudi videti drugače.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale in foregroundStyle sta modifikatorja pogleda Image. Ne spreminjata vsebine Image, temveč spreminjata njegov videz.

**1. imageScale**

```swift
.imageScale(.large)
```

Ta modifikator lahko nadzira velikost ikon SF Symbols:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

Z izbiro različnih možnosti lahko simbole SF Symbols prikažemo v različnih velikostih.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle lahko nadzira barvo ospredja.

.tint pomeni trenutno barvo poudarka okolja (accent color), ki je v iOS privzeto modra.

Če želimo barvo ospredja spremeniti v rdečo:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Pogled Text

Text je pogled za besedilo in se uporablja za prikaz nizov.

```swift
Text("Hello, world!")
```

Na primer, prikažemo svoje ime:

```swift
Text("FangJunyu")
```

Opomba: niz mora biti vedno zapisan znotraj dvojnih narekovajev "".

Lahko poskusite prikazati svoje ime, telefonsko številko ali drugo vsebino.

#### padding – robovi oziroma notranji odmik

V SwiftUI se padding uporablja za dodajanje praznega prostora med vsebino pogleda in njegovo mejo. Spada med notranje odmike (padding / content inset).

```swift
HStack {
    ...
}
.padding()
```

Zgornja koda pomeni, da pogledu HStack dodamo privzeti sistemski odmik.

**Kaj je padding?**

padding pomeni "prazen prostor med vsebino pogleda in njegovo mejo".

Na spodnji sliki bo po nastavitvi padding za modri HStack modro območje videti, kot da se skrči navznoter, zato bo delovalo, kot da je "malo manjše".

![Swift](../../RESOURCE/002_view6.png)

**Privzeti odmik**

Modifikator padding() privzeto uporablja standardni razmik, ki ga priporoča sistem.

```swift
.padding()
```

Na različnih platformah in v različnih kontekstih je ta vrednost lahko različna, na primer:

* v iOS je običajno približno 16 pt.
* v macOS ali watchOS je standardni razmik lahko večji ali manjši, odvisno od oblikovalskih smernic posamezne platforme.

**Prilagojen odmik**

Pogledu lahko nastavimo tudi odmik za posamezne strani.

1. Nastavitev enega smernega odmika

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Pomen smeri:

* .top: zgornji odmik
* .bottom: spodnji odmik
* .leading: odmik na začetni strani
* .trailing: odmik na končni strani

![Swift](../../RESOURCE/002_view12.png)

Opomba: leading in trailing se samodejno prilagodita smeri jezika. Na primer, v arabskem okolju (RTL) se samodejno obrneta.

2. Nastavitev več smeri hkrati

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Z uporabo polja lahko hkrati določimo več smeri. Podrobno uporabo polj bomo razložili v kasnejših lekcijah; tukaj zadostuje, da poznate ta zapis.

3. Nastavitev vodoravne ali navpične smeri

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

To je enakovredno naslednjemu:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Odstranitev odmika**

Če ne želite nobenega odmika, lahko uporabite .padding(0):

```swift
.padding(0)
```

ali pa modifikator padding preprosto izbrišete:

```swift
// .padding()
```

### 6. Koda za predogled Preview

```swift
#Preview {
    ContentView()
}
```

Ta del kode pomeni, da se v Canvas ustvari predogled pogleda ContentView.

Opomba: #Preview je nova sintaksa, uvedena v Swift 5.9 / Xcode 15. Pred tem se je uporabljala struktura PreviewProvider.

**Kaj se zgodi, če komentiramo Preview?**

Če komentiramo Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas ne bo več prikazoval vsebine, ki jo je mogoče izrisati.

![Swift](../../RESOURCE/002_xcode.png)

To pomeni, da #Preview nadzoruje prikaz predogleda v Canvas.

Ko želimo v Xcode predogled pogleda SwiftUI, dodamo kodo #Preview. Če predogleda ne potrebujemo, lahko kodo #Preview komentiramo ali izbrišemo.

## Povzetek

Čeprav datoteka ContentView.swift ne vsebuje veliko kode, dejansko zajema več ključnih konceptov SwiftUI. Za začetnike je lahko ta del kode videti nekoliko tuj, vendar lahko z razčlenjevanjem njegove strukture zgradimo osnovno razumevanje SwiftUI.

Če obnovimo vsebino te lekcije, smo se najprej naučili komentarjev //, s katerimi lahko pojasnimo logiko kode ali začasno onemogočimo del kode.

Nato smo spoznali, da mora datoteka SwiftUI uvoziti ogrodje SwiftUI:

```swift
import SwiftUI
```

Če ogrodja ne uvozimo, prevajalnik ne bo mogel prepoznati tipov, kot je View.

Nato smo spoznali osnovno strukturo pogledov v SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Pri tem je ContentView ime pogleda.

Spoznali smo tudi tri pogoste vsebnike za postavitev: VStack (navpična razporeditev), HStack (vodoravna razporeditev) in ZStack (nalaganje).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ta del kode pomeni, da se prikaže vsebnik z navpično razporeditvijo, v njem pa ena ikona in eno besedilo.

Image lahko prikaže ikone SF Symbols, velikost in barvo ikone pa lahko nadzorujemo z modifikatorji.

Pogled Text lahko prikazuje besedilo.

padding je odmik, ki okoli pogleda doda prosojen prazen prostor.

Na koncu je še #Preview, ki omogoča prikaz predogleda v Canvas.

### Vaja po lekciji

Za začetnike je lahko vsebina te lekcije nekoliko zahtevna. Z dodatno vajo lahko bolje utrdimo razumevanje naučenega:

* spremenite ime ikone SF Symbols
* spremenite barvo ospredja ikone v črno
* zamenjajte VStack z HStack
* komentirajte Image ali Text in opazujte, kako se spremeni predogled

### Dodatek: samodejno dopolnjevanje kode (Code Completion)

Med vnašanjem kode ste morda že opazili, da Xcode samodejno prikaže seznam razpoložljivih možnosti.

Na primer, ko spreminjamo modifikator imageScale:

```swift
.imageScale(.)
```

Xcode prikaže razpoložljive možnosti:

![Swift](../../RESOURCE/002_view10.png)

To je mehanizem samodejnega dopolnjevanja kode (Code Completion), ki temelji na sklepanju tipov in predlogih članov enumov. Pomaga izboljšati hitrost pisanja kode in zmanjšati napake.

V kasnejših lekcijah bomo formalno predstavili enum. Za zdaj zadostuje, da o tem dobite osnovno predstavo.
