# Aloita ContentView’stä

## Valmistautuminen ennen tuntia

Tässä luvussa lähdemme liikkeelle tiedostosta `ContentView.swift` ja tutustumme järjestelmällisesti SwiftUI:n perusrakenteeseen. Käsittelemme muun muassa:

- Kommentit
- `View`-rakenne
- `VStack` / `HStack` / `ZStack` -asettelut
- `SF Symbols` -ikonit
- Näkymämuokkaimet (`modifier`)
- Esikatselukoodi `#Preview`

Etsi ensin aiemmin luomasi Xcode-projekti ja avaa `.xcodeproj`-tiedosto kaksoisklikkaamalla sitä.

Valitse vasemmanpuoleisesta `Navigator`-alueesta tiedosto `ContentView.swift`.

Huomaa: aina kun avaat projektin, `Canvas` saattaa näyttää tekstin `Preview paused`. Paina päivityspainiketta, niin esikatselu palautuu.

![Swift](../../RESOURCE/002_view7.png)

## Tutustutaan ContentView’hin

`ContentView`-koodi:

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

Vaikka koodia on vähän, se sisältää jo SwiftUI:n ydinerakenteen.

### 1. Kommentit

Tiedoston yläosassa:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Tämä on tiedostokommentti, jota käytetään tiedoston perustietojen tallentamiseen. Se sisältää tiedoston nimen, projektin nimen, tekijän ja luontiajan.

Swiftissä käytetään `//`-merkintää yksirivisiin kommentteihin:

```swift
// Tämä on kommentti
```

Kommentit parantavat koodin luettavuutta ja auttavat kehittäjää ymmärtämään koodin logiikkaa.

Käytännön kehitystyössä koodi voi olla joskus hankalasti hahmotettavaa. Ilman kommentteja voi käydä niin, ettei muutaman päivän kuluttua enää ymmärrä edes omaa koodiaan.

Siksi kommenttien lisääminen aktiivisesti koodia kirjoittaessa on hyvä tapa. Niiden avulla koodin logiikkaa on helpompi dokumentoida ja myöhemmin ylläpitää.

**Koodin väliaikainen pois kytkeminen**

Kommentteja voi käyttää myös koodin väliaikaiseen pois päältä laittamiseen ongelmien selvittämiseksi.

Esimerkiksi:

```text
A
B
C
```

`A`, `B` ja `C` ovat kolme koodinpätkää, joista yksi sisältää virheen. Voimme kommentoida ne tilapäisesti yksi kerrallaan ongelman paikallistamiseksi.

Lisätään ensin kommentti `A`:n eteen:

```text
// A
B
C
```

Jos koodi alkaa toimia tämän jälkeen normaalisti, ongelma on `A`:ssa.

Jos ongelma jatkuu, voimme kommentoida seuraavaksi `B`:n ja jatkaa samalla tavalla, kunnes ongelmallinen koodi löytyy.

Kehityksen aikana vastaan tulee paljon ongelmia, ja usein juuri kommentoimalla koodia selvitämme niiden syitä. Näin ongelmakoodi ja bugit löytyvät helpommin.

Xcodessa kommentin voi lisätä tai poistaa nopeasti pikanäppäimellä:

```text
Command ⌘ + /
```

### 2. SwiftUI-kehyksen tuominen käyttöön

```swift
import SwiftUI
```

Tämä rivi tarkoittaa, että otamme `SwiftUI`-kehyksen käyttöön.

SwiftUI:n tyypit, kuten `View`, `Text`, `Image` ja `VStack`, tulevat kaikki tästä kehyksestä.

Jos `SwiftUI`-kehystä ei tuoda mukaan, Xcode näyttää virheen:

```text
Cannot find type 'View' in scope
```

Tämä tarkoittaa, ettei kääntäjä tunnista `View`-tyyppiä.

### 3. View-rakenne

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Kun näet tämän `View`-rakenteen ensimmäistä kertaa, se voi tuntua oudolta, koska siinä näkyy avainsanoja kuten `struct`, `View`, `var`, `body` ja `some`.

Emme ole vielä opetelleet näitä avainsanoja. Tässä vaiheessa riittää, että tiedät tämän koodin tarkoittavan näkymän nimeltä `ContentView`.

Voit ajatella `View`’ta ikään kuin piirtoalustana, jonka päälle voidaan piirtää. Piirtotyökaluna toimii SwiftUI.

Esimerkiksi:

![Swift](../../RESOURCE/002_view.png)

Yllä olevassa kuvassa näkyy kolme sivua, jotka ovat käytännössä kolme eri `View`-näkymää.

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

Kun rakennamme sovellusta SwiftUI:lla, jokainen sivu on yksi `View`.

### 4. SwiftUI-koodi

`View`-näkymän sisällä näkyy SwiftUI-koodia:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tämä koodi tarkoittaa pystysuuntaisen säiliön näyttämistä, jonka sisällä näkyy yksi ikoni ja yksi teksti.

`Image` voi näyttää `SF Symbols` -ikoneita, ja muokkaimilla voidaan hallita ikonien kokoa ja väriä.

`Text`-näkymä voi näyttää tekstisisältöä.

`padding` on reunusväli, joka lisää näkymän ympärille läpinäkyvän tyhjän tilan.

Lopuksi `#Preview` on esikatselunäkymä, jonka avulla `Canvas` voi näyttää esikatselun.

### Harjoituksia tunnin jälkeen

Aloittelijalle tämän luvun sisältö voi tuntua melko monimutkaiselta. Voimme syventää ymmärrystä harjoittelemalla lisää:

- muuta `SF Symbols` -ikonin nimeä
- muuta ikonin etualan väri mustaksi
- vaihda `VStack` -> `HStack`
- kommentoi `Image` tai `Text` pois ja tarkkaile esikatselun muutoksia

### Lisäbonus: koodin täydennys (`Code Completion`)

Kun kirjoitat koodia, olet ehkä huomannut, että Xcode näyttää automaattisesti listan käytettävissä olevista vaihtoehdoista.

Esimerkiksi kun muokkaamme `imageScale`-muokkainta:

```swift
.imageScale(.)
```

Xcode näyttää käytettävissä olevat vaihtoehdot:

![Swift](../../RESOURCE/002_view10.png)

Tämä kuuluu koodin täydennysmekanismiin (`Code Completion`). Se perustuu tyyppipäättelyyn ja enum-jäsenten vihjeisiin, ja auttaa kirjoittamaan nopeammin sekä vähentämään virheitä.

Myöhemmissä luvuissa esittelemme enumit (`enum`) virallisemmin. Tässä vaiheessa riittää, että tutustut niihin kevyesti.

Tämä SwiftUI-koodi tarkoittaa pystysuuntaista asettelua, jossa näytetään yksi ikoni ja yksi teksti.

![Swift](../../RESOURCE/002_view1.png)

#### VStack-asettelu

```swift
VStack { }  // Pystysuuntainen asettelu
```

`VStack` tarkoittaa pystysuuntaista asettelukonttia. Sen sisäiset näkymät asetellaan ylhäältä alas.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI:n kolme yleisintä asettelua ovat:

- `VStack` — pystysuuntainen järjestys
- `HStack` — vaakasuuntainen järjestys
- `ZStack` — päällekkäinen järjestys (`Z`-akseli)

```swift
HStack { }  // Vaakasuuntainen järjestys
ZStack { }  // Päällekkäinen järjestys
```

Kaavio eri asettelujen järjestyksestä:

![Swift](../../RESOURCE/002_view2.png)

Esimerkiksi `HStack`-asettelulla saadaan vaakasuuntainen järjestys:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tästä näkee, että maapalloikoni ja teksti näkyvät rinnakkain.

![Swift](../../RESOURCE/002_view3.png)

Kun haluamme järjestää asioita vaakasuunnassa, käytämme `HStack`ia. Kun tarvitsemme päällekkäistä asettelua, käytämme `ZStack`ia.

#### Image ja SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Tämä koodi näyttää maapalloikonin, joka tulee Applen `SF Symbols` -ikonijärjestelmästä.

![Swift](../../RESOURCE/002_view9.png)

Koodi tarkoittaa maapalloikonin näyttämistä suurena ja korostusvärillä.

Voimme näyttää maapallon lisäksi myös muita ikoneita.

Esimerkiksi reppu:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Miten muita ikoneita näytetään?**

Tarvitsemme Applen virallisen järjestelmäikonikirjaston, `SF Symbols`.

Avaa Apple Developerin virallinen sivusto ja lataa [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Avaa `SF Symbols` -sovellus.

![Swift](../../RESOURCE/002_sf1.png)

Vasemmalla näkyvät symbolikategoriat, ja oikealla niitä vastaavat ikonit.

Klikkaa ikonia hiiren oikealla painikkeella ja valitse “kopioi 1 nimi”. Tämä nimi on kyseistä ikonia vastaava merkkijono.

Esimerkiksi:

```text
"globe"
"backpack"
"heart"
```

Kun liität kopioidun nimen `Image(systemName:)`-kutsuun, voit näyttää eri ikoneita.

Huomaa: jokaisella `SF Symbols` -ikonilla on oma vähimmäiskäyttöjärjestelmäversionsa. Jos järjestelmäversio on liian vanha, ikoni ei ehkä näy. Yhteensopivuustiedot voi tarkistaa `SF Symbols` -sovelluksesta.

#### Muokkaimet

SwiftUI:ssa muokkain (`modifier`) on tapa muuttaa näkymän ulkoasua tai käyttäytymistä.

Voit ajatella muokkaimia vaatteina: eri vaatteilla ulkonäkökin muuttuu.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` ja `foregroundStyle` ovat `Image`-näkymän muokkaimia. Ne muokkaavat näkymää ilman, että `Image`-sisältö itse muuttuu.

**1. imageScale**

```swift
.imageScale(.large)
```

Sillä voidaan säätää `SF Symbols` -ikonien kokoa:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Voimme vaihtaa eri vaihtoehtoja, jolloin `SF Symbols` -symbolit näkyvät eri kokoisina.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` hallitsee etualan väriä.

`.tint` tarkoittaa nykyisen ympäristön korostusväriä (`accent color`), joka on iOS:ssä oletuksena sininen.

Jos haluamme muuttaa etualan värin punaiseksi:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text-näkymä

`Text` on tekstinäkymä, jota käytetään merkkijonojen näyttämiseen.

```swift
Text("Hello, world!")
```

Esimerkiksi oman nimeni näyttämiseen:

```swift
Text("FangJunyu")
```

Huomaa: merkkijonot täytyy aina ympäröidä lainausmerkeillä `""`.

Voit kokeilla näyttää omaa nimeäsi, puhelinnumeroasi tai muuta sisältöä.

#### padding-reunus

SwiftUI:ssa `padding` lisää tyhjää tilaa näkymän sisällön ja sen reunojen väliin. Se kuuluu sisämarginaalin (`padding / content inset`) käsitteeseen.

```swift
HStack {
    ...
}
.padding()
```

Yllä oleva koodi lisää `HStack`-näkymälle järjestelmän oletusreunuksen.

**Mitä padding tarkoittaa?**

`padding` tarkoittaa näkymän sisällön ja sen reunojen välistä tyhjää tilaa.

Seuraavassa kuvassa siniselle `HStack`-alueelle lisätään `padding`. Tämän seurauksena sininen alue vetäytyy sisäänpäin ja näyttää hieman pienemmältä.

![Swift](../../RESOURCE/002_view6.png)

**Oletusreunus**

`padding()` käyttää oletuksena järjestelmän suosittelemaa vakioväliä.

```swift
.padding()
```

Tämä arvo vaihtelee alustan ja tilanteen mukaan. Esimerkiksi:

- iOS:ssä se on yleensä noin `16 pt`
- macOS:ssä tai watchOS:ssä järjestelmän vakioväli voi olla eri, joskus suurempi ja joskus pienempi, riippuen kyseisen alustan suunnitteluohjeista

**Mukautettu reunus**

Näkymälle voi asettaa myös yksittäisen suunnan reunuksia.

1. Yksi suunta kerrallaan

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Suunta-analyysi:

- `.top`: yläreunus
- `.bottom`: alareunus
- `.leading`: etureunus
- `.trailing`: takareunus

![Swift](../../RESOURCE/002_view12.png)

Huomaa: `leading` ja `trailing` mukautuvat automaattisesti kielen suuntaan. Esimerkiksi arabian (`RTL`) ympäristössä ne vaihtuvat automaattisesti päinvastaisiksi.

2. Useita suuntia kerralla

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Taulukon avulla voidaan määrittää useita suuntia samanaikaisesti. Taulukoiden käyttöä käsitellään tarkemmin myöhemmin, mutta tässä vaiheessa riittää, että tunnet tämän kirjoitustavan.

3. Vaakasuuntainen tai pystysuuntainen reunus

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Tämä vastaa seuraavaa:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Reunuksen poistaminen**

Jos et halua lainkaan reunusta, voit poistaa sen käyttämällä `.padding(0)`:

```swift
.padding(0)
```

Tai poistamalla `padding`-muokkaimen kokonaan:

```swift
// .padding()
```

### 6. Preview-esikatselukoodi

```swift
#Preview {
    ContentView()
}
```

Tämä koodi tarkoittaa, että `Canvas`-alueella luodaan `ContentView`-näkymän esikatselu.

Huomaa: `#Preview` on uusi syntaksi, joka tuli Swift 5.9:n / Xcode 15:n mukana. Sitä ennen käytettiin `PreviewProvider`-rakennetta.

**Mitä tapahtuu, jos Preview kommentoidaan pois?**

Jos `Preview` kommentoidaan:

```swift
// #Preview {
//    ContentView()
// }
```

`Canvas` ei enää näytä renderöitävää sisältöä.

![Swift](../../RESOURCE/002_xcode.png)

Tämä johtuu siitä, että `#Preview` määrittää, mitä `Canvas` näyttää esikatselussa.

Kun haluamme esikatsella SwiftUI-näkymää Xcodessa, lisäämme `#Preview`-koodin. Jos esikatselua ei tarvita, `#Preview` voidaan kommentoida pois tai poistaa.

## Yhteenveto

Vaikka `ContentView.swift`-tiedostossa ei ole paljon koodia, se kattaa todellisuudessa useita SwiftUI:n ydinkäsitteitä. Aloittelijalle tämä koodi voi tuntua vieraalta, mutta kun rakenne pilkotaan osiin, siitä alkaa muodostua ensimmäinen käsitys SwiftUI:sta.

Kerrataan tämän luvun sisältö: opimme ensin kommentin `//`, jota voidaan käyttää koodin logiikan selittämiseen tai koodin väliaikaiseen pois päältä laittamiseen.

Seuraavaksi opimme, että SwiftUI-tiedoston täytyy tuoda `SwiftUI`-kehys käyttöön:

```swift
import SwiftUI
```

Jos kehystä ei tuoda käyttöön, kääntäjä ei tunnista esimerkiksi `View`-tyyppiä.

Sen jälkeen tutustuimme SwiftUI-näkymän perusrakenteeseen:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Tässä `ContentView` on näkymän nimi.

Opimme myös kolme yleistä asettelukonttia: `VStack` (pystysuuntainen järjestys), `HStack` (vaakasuuntainen järjestys) ja `ZStack` (päällekkäinen järjestys).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```
