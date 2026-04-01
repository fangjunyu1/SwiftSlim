# Postavitev, slike in besedilo

V prejšnji lekciji smo spoznali kodo ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

V tej lekciji bomo spoznali privzeti mehanizem postavitve v SwiftUI ter način uporabe slik in besedila. Na podlagi prejšnje lekcije bomo dodatno razumeli strukturo pogledov in način prikaza, to znanje pa nam bo pomagalo graditi osnovne postavitve uporabniškega vmesnika.

## Privzeti mehanizem postavitve v SwiftUI

Ko si ogledamo predogled pogleda ContentView, opazimo, da sta ikona in besedilo prikazana na sredini, ne pa razporejena od vrha navzdol.

![Swift](../../RESOURCE/003_view.png)

Privzeto je poravnava vsebnika Stack nastavljena na .center, zato so podrejeni pogledi običajno prikazani poravnani na sredino.

### Alignment poravnava

Jasno je, da je sredinska poravnava le ena od možnosti. Če želimo levo ali desno poravnavo, moramo za nadzor poravnave uporabiti alignment.

```swift
alignment
```

V SwiftUI se poravnava običajno pojavi v dveh scenarijih:

**1. Parameter poravnave v vsebniku Stack**

Na primer, če želimo, da sta ikona in besedilo v ContentView poravnana levo:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment pri VStack nadzoruje poravnavo v vodoravni smeri.

Možnosti poravnave:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack je vodoravna razporeditev, alignment pa nadzoruje poravnavo v navpični smeri:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack je nalaganje pogledov enega na drugega, alignment pa lahko nadzoruje poravnavo v vodoravni ali navpični smeri:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Če alignment ni izrecno nastavljen, je privzeta vrednost za VStack, HStack in ZStack .center.

**2. alignment znotraj frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Ko frame zagotovi več prostora, kot ga pogled dejansko potrebuje, alignment določa položaj pogleda znotraj frame. Podrobnejšo uporabo frame bomo razložili kasneje; tukaj zadostuje osnovno razumevanje.

### Spacer in mehanizem razporejanja prostora

alignment lahko omogoči razvrščanje pogledov v vodoravni ali navpični smeri. Ko pa želimo, da sta besedilo in slika prikazana na dveh nasprotnih straneh, samo poravnava ni dovolj.

Na primer, če želimo ustvariti zgornji pogled spletnega mesta [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), kjer je na levi strani logotip NHK, na desni pa ikona menija.

![Swift](../../RESOURCE/003_alignment3.png)

Če uporabimo samo alignment, bosta logotip NHK in ikona menija prikazana le na isti strani. Ne moremo ju porazdeliti na levo in desno stran, zato potrebujemo Spacer za razdelitev preostalega prostora.

Spacer je prilagodljiv pogled za postavitev, ki lahko samodejno zapolni preostali prostor.

Način uporabe:

```swift
Spacer()
```

Na primer:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Ko med Image in Text dodamo Spacer, bo Spacer zapolnil preostali prostor ter potisnil Image in Text proti zgornjemu in spodnjemu robu.

![Swift](../../RESOURCE/003_view1.png)

Če je več Spacer-jev:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Bo preostali prostor enakomerno razdeljen med vse Spacer-je.

![Swift](../../RESOURCE/003_spacer.png)

## Prikaz in nadzor velikosti slike v Image

Pogled Image se uporablja predvsem za prikaz slik. Ikone SF Symbols, ki smo jih spoznali v prejšnji lekciji, so le ena izmed uporab Image.

Način uporabe:

```swift
Image("imageName")
```

Niz v dvojnih narekovajih predstavlja ime slike, brez pripone datoteke.

### Prikaz slike

Najprej pripravimo sliko.

![Swift](../../RESOURCE/003_img.jpg)

V Xcode izberemo mapo z viri Assets in sliko povlečemo vanjo.

![Swift](../../RESOURCE/003_img1.png)

V ContentView uporabimo Image za prikaz slike:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Opomba: SwiftUI-jev Image ne podpira predvajanja GIF-animacij, temveč lahko prikaže le statični kader.

### Nadzor velikosti slike

V SwiftUI je Image privzeto prikazan v izvirni velikosti slike. Če želimo prilagoditi velikost prikaza, moramo najprej uporabiti resizable, da se slika lahko spreminja, nato pa z frame določiti velikost postavitve.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifikator resizable

Modifikator resizable omogoča, da se slika v postavitvi lahko spreminja po velikosti, namesto da bi vedno ostala v izvirni velikosti.

```swift
.resizable()
```

Šele po dodajanju resizable() lahko frame dejansko spremeni prikazano velikost slike.

Če resizable izpustimo:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

bo frame sliki zagotovil le prostor za postavitev, velikost same slike pa se ne bo spremenila.

### Modifikator frame

frame(width:height) se uporablja za določitev širine in višine pogleda.

Osnovna uporaba:

```swift
.frame(width: 10,height: 10)
```

Na primer, če želimo sliko nastaviti v pravokotnik širine 300 in višine 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Lahko nastavimo tudi samo širino ali samo višino:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinacija resizable + frame omogoča prilagodljiv nadzor velikosti slike na zaslonu, hkrati pa ohranja možnost skaliranja.

### Razmerje slike: scaledToFit in scaledToFill

Če z frame nastavimo širino in višino v drugačnem razmerju, kot ga ima slika, se lahko slika raztegne in popači.

Če želimo ohraniti razmerje slike in jo hkrati prilagoditi razpoložljivemu prostoru, lahko uporabimo scaledToFit ali scaledToFill.

**scaledToFit**

scaledToFit ohrani izvirno razmerje slike in jo pomanjša ali poveča tako, da se v celoti prilega razpoložljivemu prostoru, brez obrezovanja:

```swift
.scaledToFit()
```

ali

```swift
.aspectRatio(contentMode: .fit)
```

Ta način je primeren, kadar želimo sliko prikazati v celoti in brez popačenja.

Če vsem slikam nastavimo enako širino in višino, se pogosto zgodi, da pride do raztezanja.

Na primer:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Če ne nastavimo načina skaliranja, slika ne bo prikazana v svojem izvirnem razmerju.

![Swift](../../RESOURCE/003_img4.png)

Če nastavimo scaledToFit, bo slika ohranila prvotno razmerje.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill prav tako ohrani razmerje slike, vendar zapolni celoten razpoložljivi prostor. Če se razmerje ne ujema, bodo deli slike odrezani:

```swift
.scaledToFill()
```

ali

```swift
.aspectRatio(contentMode: .fill)
```

Ta način je primeren, kadar želimo, da slika prekrije celotno območje, na primer kot ozadje ali banner. Posebej primeren je za uporabo slike kot ozadja.

**Razlika med njima**

![Swift](../../RESOURCE/003_img6.png)

## Besedilo

V SwiftUI se za prikaz besedila uporablja Text.

Osnovna uporaba:

```swift
Text("FangJunyu")
```

V prejšnji lekciji smo že spoznali Text. V tej lekciji bomo nadaljevali z učenjem nadzora velikosti in debeline pisave, da bo besedilo v pogledu bolj izrazito.

### Velikost pisave

Z modifikatorjem font lahko nadzorujemo velikost besedila:

```swift
.font(.title)
```

Na primer:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Pogoste velikosti pisave (od največje do najmanjše):

```id="uqrwwn"
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Debelina pisave

Če želimo, da je besedilo krepko, lahko uporabimo modifikator fontWeight:

```swift
.fontWeight(.bold)
```

Na primer:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Pogoste debeline pisave (od tanke do debele):

```id="3pn8wz"
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font nadzoruje velikost pisave, fontWeight pa debelino pisave. Uporabljamo ju lahko skupaj, da besedilo dobi bolj izrazit videz.

## Povzetek in praksa

Do zdaj smo spoznali privzeto postavitev SwiftUI, Spacer, Image in Text ter druga osnovna znanja. Ta vsebina že zadostuje za razvoj nekaterih preprostih pogledov.

Na primer: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Vmesnik Googla je zelo čist in vsebuje slike ter besedilo. Lahko poskusimo analizirati njegovo strukturo z vidika SwiftUI:

1. Celota je razdeljena na tri dele: Googlov logotip, iskalno polje in pomožno besedilo. Za navpično razporeditev lahko uporabimo VStack.
2. Googlov logotip je slika, zato ga lahko prikažemo z Image.
3. Iskalno polje vsebuje vnosno polje in ikono. Če vnosno polje za zdaj zanemarimo, lahko iskalno ikono prikažemo z Image.
4. Pomožno besedilo prikažemo z Text, vodoravno razporeditev besedila pa lahko izvedemo z HStack, medtem ko lahko barvo besedila nastavimo z foregroundStyle.

Z vajo teh znanj lahko izdelamo nekaj preprostih pogledov in poglobimo razumevanje ter uporabo pogledov Image in Text ter njunih modifikatorjev.
