# Tutustutaan Xcodeen

## Mikä Xcode on?

Xcode on Applen virallinen integroitu kehitysympäristö (`IDE`, Integrated Development Environment), jota käytetään iOS-, macOS-, watchOS-, tvOS- ja muiden Apple-alustojen sovellusten kehittämiseen.

![Swift](../../RESOURCE/001_xcode.png)

Koko tämän oppaan ajan käytämme Xcodea koodin kirjoittamiseen ja ohjelmien ajamiseen.

Tässä luvussa opimme, miten Xcode ladataan, miten ensimmäinen iOS-sovellus luodaan ja miten Xcoden käyttöliittymän perusrakenne hahmotetaan.

## Xcoden lataaminen

Xcode voidaan tällä hetkellä asentaa kahdella tavalla:

1. [Mac App Storesta](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)
2. [Apple Developerin viralliselta sivustolta](https://developer.apple.com/xcode/)

Molemmilla tavoilla voi ladata Xcoden. Erona on se, että Apple Developerin viralliselta sivustolta saa vakaan version lisäksi myös [Beta](https://developer.apple.com/download/all/?q=Xcode) -versioita ja vanhempia versioita.

Jos tarkoitus on vain opetella kehitystä, vakaa versio on suositeltava. Beta-versioita käytetään pääasiassa uusien ominaisuuksien testaamiseen, ja ne voivat olla epävakaita.

## Ensimmäisen projektin luominen

Kun avaat Xcoden, näet aloitusnäkymän.

![Swift](../../RESOURCE/001_xcode1.png)

Vasemmalla näkyy kolme tavallista vaihtoehtoa:

- `Create New Project` — luo uusi projekti
- `Clone Git Repository` — kloonaa Git-varasto
- `Open Existing Project` — avaa olemassa oleva projekti

Oikealla näytetään viimeksi avatut Xcode-projektit.

Valitsemme vaihtoehdon `Create New Project`.

### Projektipohjan valitseminen

![Swift](../../RESOURCE/001_xcode2.png)

Seuraavaksi siirryt projektipohjan valintanäkymään, jossa näkyy useita alustoja, kuten iOS ja macOS, sekä erilaisia projektimalleja.

Tavallisia malleja:

- `App` — kaikkein perustavanlaatuisin sovellustyyppi (suositus)
- `Document App` — dokumenttipohjainen sovellus
- `Game` — pelikehitykseen
- `Framework` — uudelleenkäytettävä moduuli

Alkuvaiheessa valitsemme vain mallin `iOS` - `App`, koska kyseessä on käyttöliittymäsovellus.

Paina `Next`.

### Projektin tietojen täyttäminen

Seuraavaksi täytämme projektin tiedot kenttien mukaisesti.

![Swift](../../RESOURCE/001_xcode3.png)

Kenttien merkitys:

- `Product Name` — projektin nimi, esimerkiksi `SwiftSlimTest`
- `Team` — kehittäjätiimi; jos sinulla ei ole maksullista Apple Developer -tiliä, tämän voi jättää valitsematta
- `Organization Identifier` — organisaatiotunniste, yleensä käänteisen verkkotunnuksen muodossa, esimerkiksi:
  - `com.yourname`
  - `com.yourcompany`
  - jos sinulla ei ole verkkotunnusta, voit käyttää omaa englanninkielistä nimeäsi tunnisteena
- `Bundle Identifier` — sovelluksen yksilöllinen tunniste, joka muodostuu automaattisesti `Organization Identifier`- ja `Product Name` -kenttien perusteella
- `Interface` — käyttöliittymätekniikka, valitse `SwiftUI`
- `Language` — ohjelmointikieli, valitse `Swift`
- `Testing System` — oletuksena luodaan testikohde (`Unit Tests`), jonka voi alkuvaiheessa ohittaa
- `Storage` — paikallisen datan pysyvyyden kehys, joka voi integroida automaattisesti `SwiftData`n tai `Core Data`n; myös tämän voi alkuvaiheessa ohittaa

Kun tiedot on täytetty, paina `Next`.

### Projektin tallentaminen

![Swift](../../RESOURCE/001_xcode4.png)

Valitse sopiva kansio projektin tallennuspaikaksi.

Paina `Create`, ja Xcode luo projektirakenteen automaattisesti.

## Xcode-projektin rakenne

Kun Xcode-projekti on tallennettu, Finderissa näkyy luotu projektikansio.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` — kansio kuville, sovellusikoneille ja muille resursseille
- `ContentView.swift` — oletuksena luotu SwiftUI-näkymätiedosto, johon kirjoitamme myöhemmin käyttöliittymäkoodia
- `SwiftSlimTestApp.swift` — sovelluksen sisääntulotiedosto (`App Entry Point`), joka vastaa sovelluksen käynnistämisestä; sitä ei vielä tarvitse ymmärtää
- `SwiftSlimTest.xcodeproj` — Xcode-projektitiedosto, jota kaksoisklikkaamalla projekti avautuu

## Tutustutaan Xcoden käyttöliittymään

Avaa projekti kaksoisklikkaamalla `.xcodeproj`-tiedostoa, ja valitse vasemmanpuoleiselta `Navigator`-alueelta tiedosto `ContentView.swift`.

Xcoden käyttöliittymä koostuu pääasiassa viidestä alueesta:

- `Navigator` — navigointialue tiedostorakenteen tarkasteluun ja hakuun
- `Editor` — muokkausalue Swift- ja SwiftUI-koodin kirjoittamiseen
- `Canvas` — alue SwiftUI-esikatselua varten
- `Inspector` — ominaisuuksien tarkistusalue tiedoston asetusten katseluun ja muuttamiseen
- `Debug Area` — virheenkorjausalue lokitulosteiden katseluun

![Swift](../../RESOURCE/001_xcode6.png)

Huomaa: `Canvas` on tarkoitettu pääasiassa SwiftUI-näkymien esikatseluun. Xcoden virallisen arkkitehtuurin näkökulmasta se on `Editor`-alueen apuesikatselupaneeli (`Preview Pane`). Se voidaan ottaa käyttöön vain silloin, kun avattuna on SwiftUI-näkymätiedosto; muissa tiedostotyypeissä esikatselua ei näytetä.

Seuraavissa luvuissa kirjoitamme Swift- ja SwiftUI-koodia pääasiassa `Editor`-alueella.

Kun Xcode-projektin avaa ensimmäisen kerran, `Inspector` ja `Debug Area` voivat olla oletuksena piilotettuina. Ne saa näkyviin oikean ylä- ja alakulman painikkeilla.

![Swift](../../RESOURCE/001_xcode7.png)

Vinkki: `Inspector`-aluetta käytetään pääasiassa tiedoston ominaisuuksien tarkasteluun ja muuttamiseen. Käytännön kehitystyössä se piilotetaan usein, jotta muokkaustilaa jää enemmän.

## Yhteenveto

Tässä luvussa opimme, miten Xcode ladataan, miten ensimmäinen Xcode-projekti luodaan ja mikä on Xcoden käyttöliittymän perusjako.

Nyt on vapaan kokeilun aika:

- Voit kokeilla tiedostojen luomista ja poistamista `Navigator`-alueella.
- Voit tarkastella `Editor`-alueen koodia ja huomioida sen rakennetta.
- Voit katsoa `Canvas`-alueen painikkeita ja kokeilla esikatselun suurentamista ja pienentämistä.

Seuraavassa luvussa alamme kirjoittaa yksinkertaista koodia, mikä auttaa meitä ymmärtämään Xcodea vielä paremmin.
