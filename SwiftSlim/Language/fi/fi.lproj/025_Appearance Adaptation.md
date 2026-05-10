# Ulkoasun mukautus

Tässä oppitunnissa opimme, miten käyttöliittymä mukautetaan vaaleaan tilaan ja tummaan tilaan.

iPhonessa, iPadissa ja Macissa käyttäjä voi valita vaalean tilan tai tumman tilan.

Kun järjestelmä vaihtuu tummaan tilaan, monien appien tausta-, teksti- ja kuvakevärit muuttuvat myös sen mukana.

Esimerkiksi päivällä käyttöliittymän tausta voi olla vaalea, ja yöllä se voi muuttua tummaksi.

![view](../../../Resource/025_view9.png)

Tätä kykyä säätää käyttöliittymän näyttöä automaattisesti järjestelmän ulkoasun mukaan kutsutaan ulkoasun mukautukseksi.

## Ulkoasun mukautuksen esikatselu Xcodessa

Ennen kuin opimme ulkoasun mukautusta, katsotaan ensin, miten vaaleaa tilaa ja tummaa tilaa voi esikatsella Xcodessa.

Napsauta `Canvas`-alueen alareunassa `Device Settings` -painiketta, jolloin `Canvas Device Settings` -ponnahdusikkuna avautuu.

![canvas](../../../Resource/025_view.png)

Ponnahdusikkunassa näkyy `Color Scheme` -asetus.

![canvas1](../../../Resource/025_view1.png)

Tässä:

- `Light Appearance` tarkoittaa vaaleaa tilaa.
- `Dark Appearance` tarkoittaa tummaa tilaa.

Voimme vaihtaa esikatseltavaa ulkoasua tästä ja tarkistaa, miltä nykyinen käyttöliittymä näyttää vaaleassa ja tummassa tilassa.

## Kahden ulkoasun näyttäminen rinnakkain

Jos haluat nähdä vaalean tilan ja tumman tilan samaan aikaan, voit käyttää `Variants`-toimintoa.

Napsauta `Canvas`-alueen alareunassa `Variants`-painiketta ja valitse `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Valinnan jälkeen `Canvas` näyttää vaalean tilan ja tumman tilan esikatselut samaan aikaan.

![canvas3](../../../Resource/025_view3.png)

Näin kahden ulkoasun välisiä käyttöliittymäeroja on helpompi vertailla.

Yksinkertaisesti sanottuna:

Jos haluat vain vaihtaa vaalean ja tumman tilan välillä väliaikaisesti, voit käyttää `Canvas Device Settings` -asetusta.

Jos haluat nähdä molemmat ulkoasut samaan aikaan, voit käyttää `Color Scheme Variants` -toimintoa.

## Näkymät mukautuvat ulkoasuun oletuksena

SwiftUI:ssa monet järjestelmän näkymät mukautuvat oletuksena automaattisesti vaaleaan tilaan ja tummaan tilaan.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Vaalea")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("jotain jotain jotain")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Näyttötulos:

![canvas](../../../Resource/025_view4.png)

Kuten näet, vaaleassa tilassa kuvakkeet ja otsikot näkyvät yleensä tummina.

Tummassa tilassa kuvakkeet ja otsikot muuttuvat automaattisesti vaaleiksi.

Tämä johtuu siitä, että SwiftUI-näkymät, kuten `Text` ja `Image`, säätävät värejään oletuksena järjestelmän ulkoasun mukaan.

Toisin sanoen, jos emme määritä kiinteää väriä käsin, SwiftUI hoitaa osan ulkoasun mukautuksesta puolestamme.

## Kiinteät värit eivät vaihdu automaattisesti

On tärkeää huomata, että jos määritämme kiinteän värin käsin, se ei vaihdu automaattisesti vaalean ja tumman tilan mukaan.

Esimerkiksi:

```swift
Text("jotain jotain jotain")
	.foregroundStyle(Color.gray)
```

Tässä tekstille on määritetty `Color.gray`, joten se näkyy aina harmaana.

Toinen esimerkki:

```swift
Text("Otsikko")
    .foregroundStyle(Color.white)
```

Tämä koodi näyttää valkoista tekstiä sekä vaaleassa tilassa että tummassa tilassa.

Jos tausta on myös vaalea, valkoista tekstiä voi olla vaikea lukea.

Siksi ulkoasua mukautettaessa kannattaa välttää kiinteiden värien, kuten `Color.white` ja `Color.black`, satunnaista kovakoodaamista.

Monissa tilanteissa kannattaa ensisijaisesti käyttää järjestelmän semanttisia tyylejä, kuten:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Tässä:

- `.primary` käytetään yleensä pääsisältöön.
- `.secondary` käytetään yleensä toissijaiseen sisältöön.

Ne säätävät näyttötapansa automaattisesti vaalean ja tumman tilan mukaan.

## Erilaisen sisällön näyttäminen ulkoasun mukaan

Joskus emme halua vain värien muuttuvan, vaan haluamme myös näyttää erilaista sisältöä eri ulkoasuissa.

Esimerkiksi:

- Vaaleassa tilassa näytetään tavallinen hehkulamppukuvake.
- Tummassa tilassa näytetään loistava hehkulamppukuvake.
- Vaaleassa tilassa otsikkona näytetään `Vaalea`.
- Tummassa tilassa otsikkona näytetään `Tumma`.

Tällöin meidän on selvitettävä, onko nykyinen järjestelmä vaaleassa tilassa vai tummassa tilassa.

SwiftUI:ssa nykyisen ulkoasutilan voi saada `colorScheme`-ympäristöarvon kautta:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Täydellinen koodi:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Vaalea" : "Tumma"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("jotain jotain jotain")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/025_view5.png)

Esikatselutuloksesta näkee, että sama näkymä ei näytä täysin samaa sisältöä eri ulkoasutiloissa.

Vaaleassa tilassa `Image` näyttää tavallisen hehkulamppukuvakkeen ja otsikkona näkyy `Vaalea`.

Tummassa tilassa `Image` näyttää loistavan hehkulamppukuvakkeen ja otsikkona näkyy `Tumma`.

Toisin sanoen muutos ei ole tässä pelkkä värin muutos, vaan myös kuvakkeen nimi ja otsikkoteksti muuttuvat.

Tämä johtuu siitä, että emme kirjoittaneet kuvaketta ja otsikkoa suoraan kovakoodattuina `body`-osaan, vaan laskemme erilaisen sisällön `colorScheme`-arvon perusteella.

Tässä koodissa käytämme kahta laskettua ominaisuutta:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Vaalea" : "Tumma"
}
```

Kun `colorScheme` on `.light`, se tarkoittaa, että nykyinen tila on vaalea tila.

Kun `colorScheme` on `.dark`, se tarkoittaa, että nykyinen tila on tumma tila.

Siksi voimme palauttaa eri kuvakenimiä ja otsikkotekstejä eri ulkoasutilojen mukaan.

Tämä on myös yksi laskettujen ominaisuuksien yleinen käyttötapa: lasketaan nykyisen tilan perusteella sisältö, jonka näkymän täytyy näyttää.

## @Environmentin ymmärtäminen

Tämä on ensimmäinen kerta, kun kohtaamme `@Environment`-ominaisuuspakkaajan.

`@Environment` voidaan ymmärtää näin: se lukee arvon SwiftUI:n ympäristöstä.

Kun appi on käynnissä, järjestelmä tarjoaa monenlaista ympäristötietoa, esimerkiksi:

- Nykyinen kieli
- Nykyinen ulkoasutila
- Nykyinen asettelusuunta
- Nykyinen fonttikokoasetus

Kun meidän täytyy saada nykyinen ulkoasutila, voimme lukea `colorScheme`-arvon:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Tässä:

```swift
\.colorScheme
```

tarkoittaa `colorScheme`-arvon lukemista ympäristöstä.

```swift
private var colorScheme
```

tarkoittaa, että luettu arvo tallennetaan `colorScheme`-muuttujaan.

Muuttujan nimen voi päättää itse. Esimerkiksi sen voi kirjoittaa myös näin:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Kunhan edessä oleva `\.colorScheme` ei muutu, se tarkoittaa nykyisen ulkoasutilan lukemista.

## colorSchemen kaksi yleistä arvoa

`colorScheme`-arvolla on tavallisesti kaksi arvoa:

```swift
.light
.dark
```

Ne tarkoittavat:

- `.light`: vaalea tila
- `.dark`: tumma tila

Esimerkiksi:

```swift
private var titleName: String {
    colorScheme == .light ? "Vaalea" : "Tumma"
}
```

Tämän koodin merkitys on:

Jos nykyinen tila on vaalea tila, `colorScheme == .light` on tosi, joten palautetaan `"Vaalea"`.

Muussa tapauksessa palautetaan `"Tumma"`.

Siksi vaaleassa tilassa:

```swift
Text(titleName)
```

Näytettävä teksti on:

```swift
Vaalea
```

Tummassa tilassa näytettävä teksti on:

```swift
Tumma
```

Tällä tavalla voimme näyttää erilaista sisältöä eri ulkoasujen perusteella.

## Esimerkki värien mukautuksesta

Tekstin ja kuvakkeiden lisäksi meidän täytyy joskus käsitellä värien mukautusta itse.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Teksti")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/025_view6.png)

Tässä koodissa teksti on valkoinen ja tausta on musta.

Vaaleassa tilassa musta tausta erottuu selvästi.

Tummassa tilassa taas, jos koko käyttöliittymän tausta on myös musta, tämä musta tausta sulautuu järjestelmän taustaan eikä näytä tarpeeksi selkeältä.

Tässä vaiheessa voimme vaihtaa tekstivärin ja taustavärin ulkoasutilan mukaan:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Teksti")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/025_view7.png)

Nyt vaaleassa tilassa käytetään mustaa taustaa ja valkoista tekstiä.

Tummassa tilassa käytetään valkoista taustaa ja mustaa tekstiä.

Näin tekstin ja taustan välillä on selkeä kontrasti kummassakin ulkoasussa, ja käyttäjä näkee sisällön selvästi.

## Assets-resurssien käyttäminen värien mukautukseen

Sen lisäksi, että tarkistamme tilan käsin `colorScheme`-arvolla, voimme käyttää myös `Assets`-resurssivärejä vaaleaan ja tummaan tilaan mukautumiseen.

Tämä tapa sopii paremmin appin yleisten värien hallintaan.

Etsi Xcode-projektista `Assets`-resurssikansio.

![assets](../../../Resource/025_color.png)

Avaa `Assets`-kansio, napsauta tyhjää aluetta hiiren oikealla painikkeella ja valitse `New Color Set` luodaksesi uuden väriresurssin.

![assets](../../../Resource/025_color1.png)

Tässä luomme värin ja annamme sille nimeksi `redText`.

![assets](../../../Resource/025_color2.png)

Väriresurssille voi määrittää erikseen värit vaaleaa tilaa ja tummaa tilaa varten.

![assets](../../../Resource/025_color3.png)

Kun olet valinnut vastaavan värialueen, voit muokata väriä oikean reunan tarkastimessa.

Napsauta oikeassa yläkulmassa olevaa `Hide or show the Inspectors` -painiketta avataksesi tarkastinalueen.

Valitse sitten `Show the Attributes inspector`, etsi alareunasta `Show Color Panel` ja avaa väripaneeli.

![assets](../../../Resource/025_color4.png)

Kun napsautat väriä väripaneelissa, `redText`-arvon vastaava värialue muuttuu samalla.

Tässä asetamme `redText`-värille seuraavat arvot:

- Vaaleassa tilassa näytetään punainen
- Tummassa tilassa näytetään vihreä

![assets](../../../Resource/025_color5.png)

Takaisin SwiftUI-koodissa tätä väriä voi käyttää näin:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Tässä:

```swift
Color("redText")
```

tarkoittaa `redText`-nimisen väriresurssin lukemista `Assets`-kansiosta.

Näyttötulos:

![assets](../../../Resource/025_view8.png)

Voit nähdä, että sama `Color("redText")` näyttää eri värejä vaaleassa tilassa ja tummassa tilassa.

Tämä osoittaa, että myös `Assets`-värit itsessään tukevat ulkoasun mukautusta.

## colorSchemen ja Assets-resurssien ero

Sekä `colorScheme` että `Assets` voivat toteuttaa ulkoasun mukautuksen, mutta ne sopivat eri tilanteisiin.

Jos haluat vain vaihtaa tekstisisältöä, kuvan nimeä tai `SF Symbols` -nimeä vaalean ja tumman tilan mukaan, voit käyttää `colorScheme`-arvoa.

Esimerkiksi:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Jos väriä käytetään appissa usein, esimerkiksi teemavärinä, kortin taustavärinä tai tekstivärinä, `Assets`-värien käyttö on suositeltavampaa.

Tämä johtuu siitä, että `Assets`-värejä voi käyttää uudelleen useissa näkymissä, ja niitä on myöhemmin helpompi muuttaa.

Esimerkiksi:

```swift
Color("redText")
```

Tällä tavalla väri tarvitsee muuttaa vain `Assets`-kansiossa, ja kaikki tätä väriä käyttävät kohdat muuttuvat yhdessä.

## Yhteenveto

Tässä oppitunnissa opimme vaalean tilan ja tumman tilan ulkoasun mukautusta.

Ensin opimme, miten eri ulkoasuja esikatsellaan Xcoden `Canvas`-alueella ja miten `Color Scheme Variants` -toiminnolla voidaan katsoa vaaleaa ja tummaa tilaa samaan aikaan.

Sen jälkeen opimme, että SwiftUI-näkymät, kuten `Text` ja `Image`, mukauttavat värejään oletuksena automaattisesti järjestelmän ulkoasun mukaan.

Jos kuitenkin määritämme kiinteitä värejä käsin, esimerkiksi `Color.white` tai `Color.black`, nämä värit eivät vaihdu automaattisesti.

Seuraavaksi opimme `@Environment`-ominaisuuspakkaajan ja `colorScheme`-arvon:

```swift
@Environment(\.colorScheme) private var colorScheme
```

`colorScheme`-arvon avulla voimme päätellä, onko nykyinen tila vaalea vai tumma, ja näyttää eri kuvakkeita, tekstejä tai värejä eri ulkoasujen mukaan.

Lopuksi opimme `Assets`-väreistä.

`Assets`-väreille voi määrittää erikseen värit vaaleaa ja tummaa tilaa varten, joten ne sopivat appin yleisten väriresurssien hallintaan.

Ulkoasun mukautus voi parantaa appin näyttöä sekä päivällä että yöllä, ja se voi myös ehkäistä ongelmia, kuten vaikeasti luettavaa tekstiä tai epäselvää taustaa.

Käytännön kehityksessä kannattaa ensisijaisesti käyttää SwiftUI:n oletusarvoista mukautuskykyä ja `Assets`-värejä.

Kun eri ulkoasuissa täytyy vaihtaa tekstiä, kuvakkeita tai kuvia tai käsitellä pieni määrä erityisiä näyttötehosteita, käytä vasta silloin `colorScheme`-arvoa tarkistamiseen.

## Lisätieto: fonttikoon määrittäminen

Kun opimme aiemmin `font`-muokkainta, käytimme joitakin järjestelmän fonttityylejä:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Järjestelmän fonttityylien, kuten `.largeTitle` ja `.callout`, lisäksi fonttikoon voi määrittää myös käsin.

Esimerkiksi:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Tässä:

```swift
.font(.system(size: 100))
```

tarkoittaa, että fonttikooksi asetetaan `100 pt`.

`SF Symbols` -kuvakkeissa myös `font` vaikuttaa kuvakkeen kokoon.

Jos siis haluat tehdä kuvakkeesta suuremman, voit määrittää koon `.font(.system(size:))`-muokkaimella.

Esimerkiksi:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

On tärkeää huomata, että vaikka fonttikoon käsin määrittäminen on joustavampaa, tavallisessa tekstissä ei suositella käyttämään paljon kiinteitä fonttikokoja.

Tavallisessa tekstissä kannattaa ensisijaisesti käyttää järjestelmän fonttityylejä, kuten `.title`, `.headline`, `.body` ja `.caption`.

Näin teksti mukautuu paremmin eri laitteisiin ja käyttäjän fonttiasetuksiin.
