# Življenjski cikel pogleda v SwiftUI

V prejšnji lekciji smo izvedeli, da spremenljivke @State sledijo življenjskemu ciklu pogleda, prav tako pa smo spoznali osnovno uporabo onAppear.

V tej lekciji bomo še podrobneje razumeli življenjski cikel pogledov v SwiftUI, izvedeli bomo, kako se pogled ustvari in prikaže ter kako se spremenljivke v pogledu ustvarijo in ponovno ustvarijo. Naučili se bomo tudi onAppear, onDisappear in konstruktor init.

Na podlagi teh znanj bomo zgradili celostno razumevanje procesa, po katerem SwiftUI sestavi pogled.

## Zaporedje zagona aplikacije

Ko v Xcode ustvarimo iOS projekt, sistem privzeto ustvari dve datoteki:

```

ContentView.swift
ProjectName + App.swift

```

Med njima je datoteka »ProjectName + App«.swift vstopna točka celotne aplikacije.

Na primer:

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

### Potek izvajanja kode

Ko zaženemo aplikacijo (v simulatorju ali na fizični napravi), sistem poišče ključno besedo @main:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Ko potrdi vstopno datoteko, začne izvajati kodo.

Najprej vstopi v strukturo App in izvede kodo v body, nato ustvari WindowGroup in v njem naloži ContentView.

### Vloga WindowGroup

WindowGroup se uporablja za upravljanje oken:

```swift
WindowGroup {
    ContentView()
}
```

V sistemih iPad in macOS je podprtih več oken, medtem ko ima iPhone običajno samo eno okno.

Zato WindowGroup na iPhonu predvsem upravlja prvi zaslon, ki se prikaže.

### Postopek nalaganja pogleda

Ko sistem najde ContentView:

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

SwiftUI izvede kodo v body, nato pa na podlagi vrnjene strukture pogleda (kot so VStack, Text in podobno) zgradi uporabniški vmesnik in ga prikaže na zaslonu.

Ko so ti koraki končani, lahko v pogledu vidimo ContentView.

![ContentView](../../Resource/016_view1.png)

Pomembno je poudariti, da je naloga body ustvarjanje pogleda, ne pa shranjevanje pogleda.

To pomeni, da SwiftUI ob vsakem osveževanju pogleda znova izračuna body in ustvari novo strukturo pogleda.

### Logika predogleda pogleda

Predogled v Xcode (Canvas) in dejanski zagon aplikacije sta dva različna mehanizma.

Na primer, v vstopno datoteko lahko dodamo izpis za razhroščevanje:

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

Ko v Xcode odpremo predogled pogleda ContentView, izvajanje ne začne od vhoda @main, zato se onAppear v vstopni datoteki ne sproži.

Če pa aplikacijo zaženemo v simulatorju ali na fizični napravi, sistem začne izvajanje pri @main, izvede celoten potek zagona aplikacije, sproži onAppear v vhodu in izpiše podatke za razhroščevanje.

Ključna razlika je v tem, da je predogled v Xcode le »delno izrisovanje«, namenjeno zgolj prikazu trenutnega pogleda, medtem ko simulator in fizična naprava nudita »celotno izvajalno okolje« in zaženeta celotno aplikacijo.

Zato se je treba pri preizkušanju funkcionalnosti aplikacije zanašati na simulator ali fizično napravo, saj predogled v Xcode ne zagotavlja popolnega izvajalnega okolja.

## Življenjski cikel pogleda

Na tej stopnji je vsa naša koda zbrana v ContentView. V dejanski aplikaciji pa aplikacija običajno vsebuje več pogledov, med katerimi se preklaplja v različnih scenarijih.

Na primer v »hranilniku«:

![PiggyBank](../../Resource/016_view.png)

Ko kliknemo »Shrani«, se prikaže pogled SaveView; ko je shranjevanje končano ali ko pogled zapremo, se SaveView odstrani.

Ta proces je življenjski cikel pogleda: ustvarjanje pogleda, prikaz pogleda in končno odstranitev pogleda.

### Zaprtje aplikacije

Ko aplikacijo zapremo, se odstranijo vsi pogledi in z njimi izgine tudi povezano stanje.

Zato se ContentView in drugi pogledi odstranijo iz pomnilnika, celotno stanje izvajanja aplikacije pa se počisti.

## Življenjski cikel spremenljivk v pogledu

V SwiftUI je življenjski cikel spremenljivk običajno vezan na pogled.

Na primer:

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

### Spremenljivka @State

Spremenljivka, deklarirana z @State, je vezana na življenjski cikel pogleda.

```swift
@State private var name = "FangJunyu"
```

Ko se pogled ustvari, se ustvari tudi name; ko se pogled odstrani, se uniči tudi name.

Zato moramo za trajno shranjevanje podatkov uporabiti UserDefaults ali podobne načine.

### Spremenljivke znotraj body

Spremenljivke, definirane znotraj body:

```swift
var num = 10
```

Njihov življenjski cikel je vezan na samo izvajanje body.

Ko se stanje v SwiftUI spremeni, na primer:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Ko se name spremeni, @State zazna spremembo podatkov in obvesti SwiftUI, naj ponovno izračuna pogled, zato se body ponovno izračuna.

Ko se body ponovno izračuna, se ponovno izvede vsa koda v body, spremenljivke znotraj body (kot je num) pa se ustvarijo na novo.

To je tudi razlog, zakaj ni priporočljivo v body definirati zapletenih spremenljivk.

Ker se ob vsakem osveževanju pogleda spremenljivke v body znova ustvarijo, to poveča strošek izračuna in vpliva na zmogljivost.

V SwiftUI je treba različne vrste podatkov upravljati na različne načine: podatke, ki morajo slediti življenjskemu ciklu pogleda, lahko hranimo z @State, začasne izračunane podatke pa lahko damo v body.

## onAppear in onDisappear

V prejšnji lekciji smo že spoznali onAppear, ki se pokliče, ko se pogled prikaže.

```swift
.onAppear {}
```

Na primer:

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

V predogledu Xcode ali med zagonom lahko vidimo izpis razhroščevanja iz onAppear.

### onDisappear

Ustreznik onAppear je onDisappear:

```swift
.onDisappear {}
```

Ko se pogled zapre, se pokliče onDisappear.

Na primer:

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

Ko se pogled odstrani, se izvede koda v onDisappear.

Opomba: ContentView, ki ga uporabljamo na tej stopnji, je korenski pogled aplikacije, zato ga ne moremo neposredno zapreti ali odstraniti. Zaradi tega na tej stopnji še ne moremo neposredno opazovati učinka izvajanja onDisappear.

Šele ko bomo pozneje obravnavali navigacijo med stranmi in odpiranje novih pogledov, bomo lahko videli, da se onDisappear dejansko pokliče.

## Logika ustvarjanja in prikaza

Pomembno je razumeti, da sta ustvarjanje in prikaz pogleda dve različni fazi.

Ko se pogled ustvari, se pokliče konstruktor strukture:

```swift
init() {}
```

Ker so SwiftUI pogledi strukture:

```swift
struct ContentView: View { ... }
```

se ob ustvarjanju instance pogleda izvede konstruktor init. Šele ko se pogled prikaže, se pokliče metoda onAppear.

Na primer:

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

Ko v Xcode odpremo predogled pogleda, lahko v razhroščevalnem izpisu vidimo:

```swift
Create ContentView
Show ContentView
```

To kaže, da se najprej izvede init za ustvarjanje pogleda, nato se izračuna koda v body in šele potem se pogled prikaže ter se izvede metoda onAppear.

Zato moramo razumeti, da sta faza ustvarjanja in faza prikaza pogleda ločeni.

### Konstruktor init

init je osnovna sintaksa v Swiftu; definirata ga lahko tako struct kot class in se uporablja za inicializacijo objekta.

```swift
init() {}
```

V SwiftUI sistem ob ustvarjanju pogleda pokliče init tega pogleda, ki ga lahko uporabimo za sprejem parametrov ali inicializacijo podatkov.

Če init ne napišemo ročno, bo Swift za struct samodejno ustvaril privzeti konstruktor.

Za SwiftUI poglede, kot je ContentView, velja: ko se pogled ustvari, se izvede init; ko se pogled prikaže, se izvede onAppear.

Zato je init konstruktor, ki se izvede ob ustvarjanju pogleda, in ga bomo pozneje uporabljali pri posredovanju parametrov ali inicializaciji podatkov.

## Povzetek

V tej lekciji smo se naučili zaporedja zagona aplikacije, od vstopne datoteke do poteka izvajanja datoteke ContentView.

Spoznali smo življenjski cikel pogleda v SwiftUI: ko se pogled ustvari, se izvede init; ko se prikaže na zaslonu, se izvede onAppear; ko se pogled odstrani ali zapre, se izvede onDisappear.

Naučili smo se tudi mehanizma posodabljanja pogleda: pogled je voden s stanjem, in ko se stanje, kot je @State, spremeni, SwiftUI osveži pogled, ponovno izračuna body, spremenljivke znotraj body pa se prav tako znova ustvarijo.

Življenjski cikel spremenljivk je vezan na življenjski cikel pogleda, medtem ko se začasne spremenljivke v body ob vsakem osveževanju ustvarijo znova.

Razumevanje teh življenjskih ciklov in obnašanja spremenljivk nam pomaga bolje organizirati kodo in narediti logiko aplikacije bolj jasno.
