# Fotostena

V tej lekciji bomo izdelali stran s fotosteno.

![view](../../../Resource/032_view13.png)

V tem primeru bomo ponovili znanje o `extension`, `self` in instancah ter se naučili pogosto uporabljenih oblik `Shape` v SwiftUI.

S tem znanjem lahko navadne slike obrežemo v različne sloge, kot so krog, zaobljen pravokotnik, kapsula in elipsa, ter fotografijam dodamo učinek obrobe.

V tej lekciji bomo uporabili nekaj novih pojmov: `Shape`, `clipShape`, `strokeBorder` in `overlay`.

Med njimi se `clipShape` uporablja za obrezovanje oblike pogleda, `strokeBorder` za risanje obrobe oblike, `overlay` pa za dodajanje novega pogleda nad trenutni pogled.

## Slikovni viri

Preden začnemo, moramo pripraviti nekaj slik.

Uporabite lahko svoje fotografije ali pa vzorčne slike, ki so priložene tej lekciji.

Primeri fotografij v tej lekciji prihajajo s spletnega mesta [Pixabay](https://pixabay.com/):

[Pokrajina](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[Lisica](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[Arhitektura](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[Cvetje](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[Labod](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Ko slike prenesete, jih dodajte v mapo virov `Assets` in jih po vrsti poimenujte `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

Tako lahko slike v SwiftUI prikažemo z `Image("1")`, `Image("2")` in podobno.

## Prikaz fotografij

Najprej v `ContentView` prikažemo 5 fotografij:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Prikazani učinek:

![view](../../../Resource/032_view.png)

V tem delu kode uporabimo `ScrollView`, da omogočimo drsni prikaz seznama fotografij, in `VStack`, da več slik razporedimo od zgoraj navzdol.

Vsaka slika z `.resizable()`, `.scaledToFit()` in `.frame(width: 300)` nastavi način prikaza slike, tako da se slika lahko poveča ali pomanjša, ohrani celotno razmerje stranic in omeji širino slike.

`.padding(.vertical, 100)` na `VStack` se uporablja za povečanje zgornjega in spodnjega odmika, da prva in zadnja fotografija nista preveč prilepljeni na rob zaslona.

Zadnji `.ignoresSafeArea()` pomeni, da drsni pogled prezre varno območje, zato se lahko fotografije med drsenjem razširijo do zgornjega in spodnjega roba zaslona, stran pa je prikazana bolj celovito.

Vendar zdaj vseh 5 slik uporablja iste modifikatorje:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Ko vidimo ponavljajočo se kodo, lahko razmislimo o urejanju z `extension`.

## Urejanje sloga slik z extension

Za `Image` lahko razširimo posebno metodo za fotosteno:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tukaj smo tipu `Image` dodali metodo `photoGalleryStyle`.

V tej metodi so vključeni prej ponavljajoči se `.resizable()`, `.scaledToFit()` in `.frame(width: 300)`. Z drugimi besedami, kodo za spreminjanje velikosti slike, ohranjanje razmerja in nastavitev širine smo združili na enem mestu.

Po uporabi te razširitve lahko prvotno kodo slike:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

poenostavimo v:

```swift
Image("1")
    .photoGalleryStyle()
```

Tako mora vsaka slika samo poklicati `.photoGalleryStyle()`, da uporabi isti slog fotostene. Koda je krajša, poznejše enotne spremembe pa so lažje.

## Razumevanje self

V metodi razširitve smo zapisali `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tukaj `self` pomeni trenutno instanco slike, ki kliče to metodo.

Na primer:

```swift
Image("1")
    .photoGalleryStyle()
```

V tej kodi metodo `photoGalleryStyle()` pokliče `Image("1")`, zato `self` znotraj metode pomeni prav to sliko `Image("1")`.

Preprosto si lahko zapomnimo: kdor pokliče metodo, tega predstavlja `self`.

Pomembno je vedeti, da modifikatorji v SwiftUI nenehno vračajo nove rezultate pogleda. Zato `photoGalleryStyle()` vrne spremenjen pogled, ne pa zgolj izvirnega `Image`.

## Oblike fotografij

Zdaj se fotografije že pravilno prikazujejo. Vendar so privzeto vse pravokotne, zato so videti precej običajno.

Če želimo fotografijam dodati samo zaobljene vogale, lahko neposredno uporabimo `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Prikazani učinek:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` pomeni, da sliki dodamo zaobljene vogale velikosti `20 pt`. Za običajno sliko z zaobljenimi vogali je ta zapis že dovolj.

Vendar `.cornerRadius()` obravnava samo učinek zaobljenih vogalov in je primeren za izdelavo navadnih zaobljenih slik. Če želimo, da fotografije postanejo še druge različne oblike, samo ta modifikator ni dovolj.

Takrat moramo uporabiti `Shape` v SwiftUI. `Shape` lahko predstavlja različne grafične oblike, skupaj z `clipShape` pa lahko sliko obrežemo v ustrezno obliko.

## Spoznajmo Shape

V SwiftUI `Shape` pomeni grafično obliko. Tako kot `View` je tudi to zelo pogosto uporabljen tip v SwiftUI.

Pogoste oblike `Shape` so krog, pravokotnik, zaobljen pravokotnik, kapsula in elipsa. Da bi lažje opazovali videz različnih oblik, bodo spodnji primeri vsaki obliki nastavili drugo barvo in velikost.

V teh primerih se `.fill()` uporablja za zapolnitev oblike z barvo, `.frame()` pa za nastavitev prikazne velikosti oblike. Barva je uporabljena samo za razlikovanje med oblikami in ni stalna barva same oblike.

### Circle krog

`Circle` pomeni krog. Pogosto se uporablja za avatarje, okrogle gumbe, okrogle slike in podobne učinke v vmesniku.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle pravokotnik

`Rectangle` pomeni pravokotnik. Je ena najosnovnejših oblik, uporabimo pa ga lahko tudi za ozadja, ločevanje območij ali navadne obrobe.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle zaobljen pravokotnik

`RoundedRectangle` pomeni zaobljen pravokotnik. `cornerRadius` se uporablja za nastavitev velikosti zaobljenih vogalov.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapsula

`Capsule` pomeni obliko kapsule. Njena konca sta zaobljena, zato se pogosto uporablja za kapsulaste gumbe, ozadja oznak in podobne učinke v vmesniku.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsa

`Ellipse` pomeni elipso. Podobna je `Circle`, vendar se pri različnih vrednostih širine in višine prikaže kot elipsa.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Iz teh primerov lahko vidimo, da se lahko `Shape` sam neposredno prikaže kot grafična oblika. Nato bomo te `Shape` uporabili skupaj z `clipShape` za obrezovanje fotografij, da se fotografije prikažejo v različnih oblikah.

## Obrezovanje fotografij s clipShape

Zdaj lahko s `clipShape` fotografije obrežemo v različne oblike.

Na primer, prvo fotografijo obrežemo v krog:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Ta koda pomeni: najprej prikaži sliko, nato jo z `Circle()` obreži v krog.

![view](../../../Resource/032_view2.png)

Osnovni zapis `clipShape` je:

```swift
.clipShape(oblika)
```

Za pogled dodamo `.clipShape(...)`, v oklepajih pa navedemo grafično obliko, v katero želimo obrezati pogled.

Na primer:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Zdaj 5 fotografij obrežemo v različne oblike:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Prikazani učinek:

![view](../../../Resource/032_view8.png)

Med njimi je učinek obrezovanja z `Rectangle()` podoben navadni pravokotni fotografiji, zato vizualna sprememba ni očitna; uporablja se predvsem za primerjavo z drugimi oblikami.

Zdaj fotografije niso več samo navadni pravokotniki, ampak imajo različne oblike.

## Dodajanje obrobe fotografijam

Če želimo okrogli fotografiji dodati obrobo, lahko najprej pomislimo na uporabo `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Vendar rezultat običajno ni okrogla obroba, ampak pravokotna obroba.

![view](../../../Resource/032_view9.png)

Razlog je, da `border` doda obrobo glede na pravokotno območje pogleda, ne glede na obliko, ki je nastala po obrezovanju z `clipShape`.

Zato, če želimo okroglo obrobo, ne moremo neposredno uporabiti `border`.

## Risanje obrobe oblike s strokeBorder

V SwiftUI lahko `strokeBorder` tem pogostim oblikam `Shape` nariše notranjo obrobo.

Na primer, narišemo okroglo obrobo:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Ta koda pomeni: za `Circle` nariši rjavo obrobo, pri čemer je širina obrobe `10 pt`.

![view](../../../Resource/032_view12.png)

Tukaj je treba opozoriti, da `strokeBorder` ne doda obrobe neposredno fotografiji, ampak nariše obrobo za grafično obliko `Circle()`.

To pomeni, da ta koda ustvari samo samostojno okroglo obrobo, ki še ni povezana s fotografijo.

Če želimo, da se ta okrogla obroba prikaže nad fotografijo, moramo še naprej uporabiti `overlay`, da obrobo položimo čez fotografijo.

## Prekrivanje obrobe z overlay

`overlay` je modifikator pogleda, ki lahko nad trenutni pogled položi nov pogled.

Njegovo osnovno strukturo lahko razumemo tako:

```swift
trenutni pogled
    .overlay {
        prekrivni pogled
    }
```

V tem primeru je trenutni pogled fotografija, ki je že obrezana v krog:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Nov pogled, ki ga želimo položiti čez fotografijo, je okrogla obroba:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Zato lahko fotografijo in obrobo združimo takole:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Tukaj `overlay` pomeni, da nad trenutni pogled položimo nov pogled.

V `overlay` se bo obroba prekrivala glede na prikazno območje trenutne fotografije, zato ni treba posebej nastavljati `frame`. Dokler sta oblika obrobe in oblika obrezovanja enaki, se lahko obroba prilega fotografiji.

![view](../../../Resource/032_view10.png)

Končni učinek je, da je nad okroglo fotografijo položena okrogla obroba.

V primerjavi z `ZStack` je `overlay` primernejši za scenarije, kot je »dodajanje okrasitve trenutnemu pogledu«. Fotografija je glavni element, obroba pa je le dodaten učinek, zato je uporaba `overlay` jasnejša.

## Dokončanje fotostene

Zdaj vsaki fotografiji dodamo ustrezno obliko in obrobo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Prikazani učinek:

![view](../../../Resource/032_view13.png)

Tako je osnovna stran fotostene dokončana.

Na tej strani uporabimo `ScrollView` za drsni prikaz, `Image` za prikaz fotografij, `clipShape` za obrezovanje oblik fotografij ter `overlay` in `strokeBorder` za dodajanje obrob.

## Celotna koda

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Povzetek

V tej lekciji smo dokončali stran s fotosteno.

![view](../../../Resource/032_view13.png)

V tem primeru smo najprej uporabili `Image` za prikaz fotografij, nato pa z `extension` tipu `Image` dodali metodo `photoGalleryStyle`, ki se uporablja za urejanje ponavljajoče se kode sloga slik.

Nato smo spoznali pogoste oblike `Shape` v SwiftUI, na primer `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` in `Ellipse`. Te oblike se lahko ne le neposredno prikažejo, ampak se lahko skupaj z `clipShape` uporabljajo tudi za obrezovanje pogledov.

Na primer:

```swift
.clipShape(Circle())
```

pomeni, da pogled obrežemo v krog.

Na koncu smo z `overlay` in `strokeBorder` fotografijam dodali obrobe ustreznih oblik. Pomembno je vedeti, da `border` običajno riše obrobo glede na pravokotno območje pogleda. Če želimo, da obroba sledi krogu, kapsuli ali elipsi, je primerneje uporabiti isto obliko `Shape` za prekrivanje.

S to lekcijo nismo dokončali le učinka fotostene, ampak smo razumeli tudi pogoste kombinacije `Shape`, `clipShape`, `strokeBorder` in `overlay` v vmesniku.

## Vaje po lekciji

### 1、Dodajanje ozadja fotostene

Strani fotostene dodajte celozaslonsko sliko ozadja.

Zahteva: slika ozadja lahko zapolni celoten zaslon in prezre varno območje.

### 2、Gradientna obroba

Obstoječo enobarvno obrobo spremenite v linearno gradientno obrobo.

Poskusite uporabiti `LinearGradient`, da dosežete bogatejši učinek obrobe.

### 3、Imitacija obrobe fotografije

Na spletu poiščite nekaj slogov resničnih obrob fotografij in poskusite z `overlay` položiti slikovno obrobo čez fotografijo, da bo fotografija videti bolj podobna pravemu okvirju.

Prikaz učinka vaje:

![button](../../../Resource/032_view15.jpeg)

### 4、Izdelava obrobe za zaobljen gumb

V dejanskem razvoju gumbi pogosto uporabljajo obrobe z zaobljenimi pravokotniki.

Poskusite izdelati zaobljen gumb in z `RoundedRectangle` ter `strokeBorder` gumbu dodajte zaobljeno obrobo.

Prikaz učinka vaje:

![button](../../../Resource/032_view14.png)

### Vprašanje za razmislek

Če ne želimo uporabiti enobarvne obrobe niti gradientne obrobe, ampak želimo, da obroba prikaže nek vzorec, kako bi to lahko izvedli?

Poskusite poiskati gradivo in spoznati povezane uporabe, kot so `overlay`, `mask` ali `ImagePaint`.

Prikaz učinka vaje:

![button](../../../Resource/032_view16.png)
