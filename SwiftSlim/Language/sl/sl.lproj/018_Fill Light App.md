# Aplikacija Fill Light

V tej lekciji bomo naredili zelo zanimivo aplikacijo fill light. Ko nastopi noč, lahko zaslon telefona prikaže različne barve in ga uporabljamo kot preprosto dopolnilno luč.

Ta aplikacija fill light omogoča preklapljanje barv z dotikom zaslona ter prilagajanje svetlosti z drsnikom.

V tem primeru se bomo naučili uporabljati `brightness` za prilagajanje svetlosti pogleda, `onTapGesture` za dodajanje poteze dotika pogledu ter kontrolnik `Slider`.

Rezultat:

![Color](../../Resource/018_color.png)

## Prikaz barve

Najprej naredimo tako, da pogled prikaže eno barvo.

V SwiftUI `Color` ne predstavlja samo barve, ampak se lahko prikaže tudi kot pogled:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Tukaj `Color.red` predstavlja rdeč pogled. `.ignoresSafeArea()` poskrbi, da barvni pogled zapolni celoten zaslon, zato je učinek bolj podoben pravi dopolnilni luči.

Rezultat:

![Color](../../Resource/018_color1.png)

### Polje barv in indeks

Zdaj je prikazana samo ena barva, vendar fill light običajno nima samo ene barve. Prikaže lahko tudi modro, rumeno, vijolično, belo in druge barve.

Želimo, da lahko ob dotiku zaslona preklapljamo med različnimi barvami. Te barve lahko shranimo v polje in jih upravljamo skupaj:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Polje je primerno za shranjevanje »skupine podatkov iste vrste«. Tukaj je vsak element v polju `Color`.

Če želimo prikazati določeno barvo, lahko uporabimo indeks:

```swift
colors[0]
```

To pomeni, da preberemo barvo na indeksu `0` v polju, torej prvo barvo.

Zdaj lahko kodo napišemo takole:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Tako bo zaslon prikazal prvo barvo v polju, torej rdečo.

### Indeks nadzoruje barvo

Če moramo preklapljati med različnimi barvami, potrebujemo spremenljivko za upravljanje indeksa, namesto da indeks zapišemo neposredno.

Za shranjevanje indeksa lahko uporabimo `@State`:

```swift
@State private var index = 0
```

Tukaj `index` pomeni indeks trenutne barve.

Ko se `index` spremeni, SwiftUI ponovno izračuna vmesnik in posodobi prikazano vsebino.

Nato prvotni `colors[0]` spremenimo v:

```swift
colors[index]
```

Tako barvo, prikazano v pogledu, določa `index`.

Zdaj koda postane:

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

Ko se `index` spremeni, bo `colors[index]` prikazal drugo barvo.

Na primer:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Pomembno je vedeti, da `index` ne sme preseči največjega indeksa v polju, sicer pride do napake zaradi indeksa izven obsega.

## Poteza dotika

Zdaj lahko glede na `index` prikažemo različne barve, vendar jih še ne moremo preklopiti z dotikom.

V prejšnjem primeru »vrtiljak citatov« smo za preklapljanje citatov uporabili `Button`.

Tokrat pa želimo preklapljati barve z »dotikom celotnega barvnega območja«, zato je primernejši `onTapGesture`.

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

Ko se dotaknemo barvnega pogleda, se izvede:

```swift
index += 1
```

To pomeni, da se `index` poveča za `1`. Ko se indeks poveča, `colors[index]` prikaže naslednjo barvo v polju.

### onTapGesture

`onTapGesture` je modifikator poteze, ki pogledu doda dejanje ob dotiku.

Osnovna uporaba:

```swift
.onTapGesture {
    // code
}
```

Na primer:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Ko se dotaknemo tega rdečega pogleda, se izvede koda v zavitih oklepajih in v konzoli se izpiše:

```swift
Click color
```

Z `onTapGesture` lahko določimo, kaj naj se zgodi po dotiku nekega pogleda.

### Razlika od `Button`

Prej smo se že učili o pogledu `Button`. Tako `Button` kot `onTapGesture` lahko obdelujeta dotik, vendar njuna uporaba ni povsem enaka.

`onTapGesture` je primernejši za »dodajanje možnosti dotika obstoječemu pogledu«, kot so `Color`, `Image`, `Text` ali drugi običajni pogledi.

`Button` pa je primernejši za jasno izražen gumb, kot so »Potrdi«, »Pošlji« ali »Izbriši«.

V tej aplikaciji fill light želimo, da je funkcija preklapljanja barv čim preprostejša, zato lahko za preklop barv ob dotiku celotnega barvnega območja uporabimo `onTapGesture`.

## Težava z indeksom

Zdaj lahko z dotikom zaslona preklapljamo med različnimi barvami.

Vendar pa je tukaj pomembna težava: **indeks lahko preseže obseg polja**.

Na primer:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Če se zaslona dotaknemo večkrat zapored, bo `index` sčasoma postal `4`, kar bo povzročilo napako »index out of range«.

To je zato, ker ima polje `colors` `4` elemente, vendar se indeksi začnejo pri `0`, zato je veljaven obseg indeksov `0 - 3`, ne pa `4`.

Če dostopamo do `colors[4]`, pride do »prekoračitve indeksa«.

V trenutni kodi se ob vsakem dotiku zaslona `index` samodejno poveča za `1`, zato bo brez dodatne obdelave sčasoma zagotovo presegel obseg.

Zato moramo ob dotiku zaslona preveriti indeks: če je trenutna barva zadnja, se vrnemo na prvo, sicer indeks še naprej povečamo za `1`.

To lahko naredimo z ukazom `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

V tej kodi `colors.count` pomeni število elementov v polju.

V trenutnem polju so `4` barve, zato:

```swift
colors.count // 4
```

Vendar največji indeks ni `4`, ampak `3`, ker se indeks začne pri `0`.

Zato zadnji indeks zapišemo kot:

```swift
colors.count - 1
```

Torej:

```swift
4 - 1 = 3
```

Ta logika pomeni, da če je trenutni indeks že zadnji, ga ponastavimo na `0`, sicer ga povečamo za `1`.

Tako lahko barve krožno preklapljamo.

### Poenostavitev indeksa

Če želimo bolj jedrnato kodo, lahko uporabimo tudi ternarni operator:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Ta koda pomeni: če je `index == colors.count - 1`, vrni `0`; sicer vrni `index + 1`.

Na koncu ta rezultat znova dodelimo `index`.

Zdaj lahko dosežemo učinek preklapljanja barv.

Celotna koda:

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

Zdaj lahko kliknemo zaslon in preklapljamo med različnimi barvami, osnovna aplikacija fill light pa je končana.

## Prikaz imena barve

Dodamo lahko še skupino besedil, ki ustrezajo barvam, da se ob preklopu na zaslonu hkrati prikaže tudi ime trenutne barve.

Na primer:

- pri rdeči prikažemo `Red`
- pri modri prikažemo `Blue`
- pri rumeni prikažemo `Yellow`
- pri vijolični prikažemo `Purple`

Tudi tukaj lahko uporabimo polje za shranjevanje imen barv:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Vrstni red besedil v tem polju mora ustrezati vrstnemu redu v polju barv.

Nato lahko z `Text` prikažemo ime barve, ki ustreza trenutnemu indeksu:

```swift
Text(colorsName[index])
```

`Text` bo glede na `index` prikazal trenutno ime barve.

Z modifikatorji izboljšamo slog prikaza `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Tako bo `Text` prikazan belo, z velikim naslovom in krepko pisavo.

Zdaj imamo celozaslonski pogled `Color`. Če želimo, da se `Text` prikaže nad pogledom `Color`, moramo uporabiti vsebnik postavitve `ZStack`.

```swift
ZStack {
    Color
    Text
}
```

Kodo zato spremenimo v:

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

Tako je v ozadju barvni pogled, spredaj pa je naložen pogled z besedilom.

Rezultat:

![Color](../../Resource/018_color2.png)

Upoštevati moramo, da se v `ZStack` pogled, ki je zapisan kasneje, običajno prikaže spredaj. Če bi `Text` zapisali pred `Color`, bi ga lahko kasnejši pogled `Color` prekril.

## Nadzor svetlosti

Zdaj lahko preklapljamo med različnimi barvami, vendar ima fill light še eno pomembno funkcijo: **prilagajanje svetlosti**.

V SwiftUI lahko za prilagajanje svetlosti pogleda uporabimo modifikator `brightness`.

Na primer:

```swift
.brightness(1)
```

Lahko zapišemo:

```swift
colors[index]
    .brightness(0.5)
```

Tako bo trenutna barva svetlejša in bo bolj podobna učinku fill light.

Obseg `brightness` je `0 - 1`: `0` pomeni, da ostane izvirna barva, bolj ko se približuje `1`, svetlejša je barva, `1` pa pomeni najsvetlejšo belo.

Čeprav lahko v kodi nastavimo `brightness`, uporabnik tega še ne more prilagajati sam.

Dodan mora biti kontrolnik, ki ga lahko vlečemo: `Slider`.

## Pogled drsnika Slider

V SwiftUI je `Slider` drsni kontrolnik za izbiro vrednosti znotraj določenega obsega. Apple ga opisuje kot »control for selecting a value from a bounded linear range«.

Osnovna uporaba:

```swift
Slider(value: $value, in: 0...1)
```

Razlaga parametrov:

1. `value: $value`: `Slider` mora biti vezan na spremenljivko.

    Ko uporabnik premika drsnik, se vrednost spremenljivke hkrati posodablja. Obratno pa se ob spremembi spremenljivke posodobi tudi drsnik.

    To je zelo podobno `TextField`, ki smo ga spoznali prej, saj pri obeh »povežemo kontrolnik in spremenljivko«.
    
    Pred vezano spremenljivko moramo dodati znak `$`, da označimo vezavo.

2. `in: 0...1`: ta parameter predstavlja obseg vrednosti drsnika.

    Tukaj `0...1` pomeni: najmanjša vrednost je `0`, največja pa `1`.

    Ko drsnik premaknemo povsem levo, bo vezana spremenljivka blizu `0`; ko ga premaknemo povsem desno, bo blizu `1`.

Na primer:

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

`Slider` je vezan na spremenljivko `value`, zato se bo ob premikanju drsnika ta vrednost hkrati spreminjala.

Videz:

![Slider](../../Resource/018_slider.png)

Ko je `Slider` skrajno levo, postane vezana vrednost `0`; ko je skrajno desno, postane `1`.

### Obseg vrednosti

Obseg vrednosti pri `Slider` ni fiksen. Lahko ga zapišemo tudi kot:

```swift
0...100
```

ali kot kakšen drug obseg.

Toda v tej aplikaciji fill light moramo upravljati svetlost, zato je `0...1` najprimernejša izbira.

## Uporaba Slider za nadzor svetlosti

Zdaj moramo povezati `Slider` in `brightness`.

Najprej ustvarimo spremenljivko za shranjevanje vrednosti svetlosti:

```swift
@State private var slider = 0.0
```

Tukaj je `0.0` vrednost tipa `Double`.

Ker je `Slider` običajno vezan na številski tip in želimo neprekinjene spremembe, je uporaba `Double` primernejša. Poleg tega `brightness` sprejme le vrednosti tipa `Double`.

Nato to vrednost predamo `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Ko je `slider == 0`, barva ostane v privzetem stanju; ko se `slider` približuje `1`, je videti svetlejša.

### Dodajanje kontrolnika Slider

Nato dodamo kontrolnik `Slider`, ki bo spreminjal to spremenljivko:

```swift
Slider(value: $slider, in: 0...1)
```

Ko se drsnik spremeni, se spremeni tudi `slider`, `brightness(slider)` pa hkrati prilagodi svetlost.

To je zelo značilen primer v SwiftUI, kjer »spremenljivka poganja pogled«.

### Prilagajanje videza Slider

Privzeto `Slider` uporablja širino glede na razpoložljiv prostor.

Lahko mu določimo fiksno širino:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Nato dodamo še nekaj modifikatorjev, da bo bolje viden:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Tako bo drsnik dobil belo ozadje in zaobljene vogale, zato bo na pogledu `Color` bolj opazen.

Na koncu ga postavimo še na dno zaslona.

Ker smo že uporabili `ZStack`, lahko vanj dodamo še `VStack` in z `Spacer()` potisnemo `Slider` na dno.

## Celotna koda

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

Rezultat:

![Color](../../Resource/018_color.png)

## Povzetek

Z uporabo znanja, ki smo ga osvojili prej, ter osnov o barvah in poljih smo izdelali zelo zanimivo aplikacijo fill light.

S to aplikacijo fill light smo se naučili uporabljati `brightness` za prilagajanje svetlosti, `onTapGesture` za dodajanje dejanja dotika pogledu ter kontrolnik `Slider`.

Pogledu `Color` smo dodali `onTapGesture` in tako omogočili preklapljanje barv. Prek kontrolnika `Slider` pa upravljamo spremenljivko za `brightness`, s čimer prilagajamo svetlost barve. Tudi to je primer, kako »spremenljivka poganja pogled«.

Ponovili smo ternarni operator, uporabili `ZStack` za nalaganje pogledov in uporabili polja za upravljanje skupine podatkov iste vrste. S tem poglobimo razumevanje polj in indeksov ter v praksi upoštevamo težavo prekoračitve indeksa.

Ta primer sicer ni zapleten, vendar poveže veliko osnovnega znanja, ki smo se ga naučili prej. Ko to znanje uporabimo v resničnem malem projektu, lažje razumemo vlogo vsakega posameznega koncepta.

### Resnični scenarij uporabe

Predstavljajte si, da na mizo postavite star iPhone in z lastno razvito aplikacijo fill light nadzirate barvo dopolnilne luči. To bi bila zelo dobra uporabniška izkušnja.

V App Store lahko vidimo veliko aplikacij »fill light«, ki prav tako niso videti posebej zapletene.

![AppStore](../../Resource/018_appStore.PNG)

Začnemo lahko z razvojem preprostih aplikacij in jih poskusimo objaviti v App Store. To ne poveča le našega zanimanja za razvoj, ampak tudi beleži naš napredek.

### Vaja po lekciji

Lahko še naprej razmišljate o tem, kako razširiti to aplikacijo fill light, na primer:

- dodajte več barv
- prikažite trenutno vrednost svetlosti
- polepšajte spodnje območje z drsnikom

Ko boste to osnovno znanje resnično uporabljali, boste ugotovili, da je vsaka stvar, ki se je naučimo, pravzaprav orodje za razvoj aplikacij.
