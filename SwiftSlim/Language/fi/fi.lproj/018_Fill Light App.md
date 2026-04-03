# Fill Light -sovellus

Tässä oppitunnissa rakennamme erittäin mielenkiintoisen fill light -sovelluksen. Kun yö saapuu, voimme saada puhelimen näytön näyttämään eri värejä ja käyttää sitä yksinkertaisena fill lightina.

Tämä fill light -sovellus voi vaihtaa värejä napauttamalla näyttöä, ja se voi myös säätää kirkkautta liukusäätimen avulla.

Tässä esimerkissä opimme käyttämään `brightness`-muokkainta näkymän kirkkauden säätämiseen, `onTapGesture`-toimintoa napautuseleiden lisäämiseen näkymään sekä `Slider`-ohjauskomponenttia.

Tulos:

![Color](../../Resource/018_color.png)

## Värin näyttäminen

Aluksi annetaan näkymän näyttää yksi väri.

SwiftUI:ssa `Color` ei tarkoita vain väriä, vaan sitä voidaan näyttää myös näkymänä:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Tässä `Color.red` tarkoittaa punaista näkymää. `.ignoresSafeArea()` saa värinäkymän täyttämään koko näytön, joten se näyttää enemmän oikealta fill light -efektiltä.

Tulos:

![Color](../../Resource/018_color1.png)

### Värijoukko ja indeksi

Tällä hetkellä näkyy vain yksi väri. Fill light ei kuitenkaan yleensä ole vain yhtä väriä. Se voi näyttää myös sinistä, keltaista, violettia, valkoista ja muita värejä.

Haluamme vaihtaa eri värien välillä, kun näyttöä napautetaan. Voimme laittaa nämä värit taulukkoon yhteistä hallintaa varten:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Taulukko sopii "saman tyyppisen tietoryhmän" tallentamiseen. Tässä jokainen taulukon alkio on `Color`.

Jos haluamme näyttää tietyn värin, voimme käyttää indeksiä:

```swift
colors[0]
```

Tämä tarkoittaa taulukon indeksissä `0` olevan värin lukemista, eli ensimmäistä väriä.

Nyt koodi voidaan kirjoittaa näin:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Näin näyttö näyttää taulukon ensimmäisen värin, eli punaisen.

### Indeksin käyttäminen värin ohjaamiseen

Jos meidän täytyy vaihtaa eri värien välillä, tarvitsemme muuttujan indeksin hallintaan sen sijaan, että kirjoittaisimme indeksin kiinteästi.

Voimme käyttää `@State`-määrettä julistamaan muuttujan, joka tallentaa indeksin:

```swift
@State private var index = 0
```

Tässä `index` tarkoittaa nykyisen värin indeksiä.

Kun `index` muuttuu, SwiftUI laskee käyttöliittymän uudelleen ja päivittää näytettävän sisällön.

Sitten muutamme alkuperäisen `colors[0]`-kohdan muotoon:

```swift
colors[index]
```

Näin näkymässä näkyvä väri määräytyy `index`-arvon perusteella.

Nyt koodi muuttuu muotoon:

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

Kun `index` muuttuu, myös `colors[index]` näyttää eri värin.

Esimerkiksi:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

On tärkeää huomata, että `index` ei saa ylittää taulukon suurinta indeksiä, muuten syntyy virhe indeksin ylittäessä sallitun alueen.

## Napautusele

Nyt voimme näyttää eri värejä `index`-arvon perusteella, mutta emme vielä voi vaihtaa niitä napauttamalla.

Edellisessä "Quote Carousel" -oppitunnissa käytimme `Button`-komponenttia lainausten vaihtamiseen.

Tällä kertaa haluamme kuitenkin "napauttaa koko värialuetta" värin vaihtamiseksi, joten `onTapGesture` sopii paremmin.

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

Kun napautamme värinäkymää, tämä koodi suoritetaan:

```swift
index += 1
```

Tämä tarkoittaa, että `index` kasvaa arvolla `1`. Kun indeksi kasvaa, `colors[index]` näyttää taulukon seuraavan värin.

### `onTapGesture`

`onTapGesture` on elemuokkain, joka lisää napautustoiminnon näkymään.

Peruskäyttö:

```swift
.onTapGesture {
    // code
}
```

Esimerkiksi:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Kun tätä punaista näkymää napautetaan, aaltosulkeiden sisällä oleva koodi suoritetaan ja konsoliin tulostuu:

```swift
Click color
```

`onTapGesture`-toiminnon avulla voimme määritellä, mitä tapahtuu näkymän napauttamisen jälkeen.

### Ero `Button`-komponenttiin

Aiemmin opimme `Button`-näkymän. Sekä `Button` että `onTapGesture` voivat käsitellä napautustoimintoja, mutta niiden käyttötarkoitukset eivät ole täysin samat.

`onTapGesture` sopii paremmin "napautustoiminnon lisäämiseen olemassa olevaan näkymään", kuten `Color`, `Image`, `Text` tai muu tavallinen näkymä.

`Button` sopii paremmin silloin, kun halutaan esittää selkeä painike, kuten "Vahvista", "Lähetä" tai "Poista".

Tässä fill light -sovelluksessa haluamme tehdä värinvaihtotoiminnosta yksinkertaisemman. Kun koko värialuetta napautetaan värin vaihtamiseksi, `onTapGesture` on hyvä valinta.

## Indeksiongelma

Nyt voimme vaihtaa eri värejä napauttamalla näyttöä.

Mutta tässä on yksi tärkeä ongelma: **indeksi voi ylittää taulukon alueen**.

Esimerkiksi:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Jos jatkamme näytön napauttamista, `index` muuttuu lopulta arvoksi `4`, ja silloin syntyy "index out of range" -virhe.

Tämä johtuu siitä, että `colors`-taulukossa on `4` alkiota, mutta indeksointi alkaa arvosta `0`, joten sallittu indeksialue on `0 - 3`, ei `4`.

Jos käytämme `colors[4]`, syntyy "index out of range" -virhe.

Nykyisessä koodissa jokainen napautus lisää `index`-arvoa yhdellä. Jos emme käsittele tätä, se ylittää lopulta sallitun alueen.

Siksi meidän täytyy tarkistaa indeksi näyttöä napautettaessa: jos kyseessä on jo viimeinen väri, palataan ensimmäiseen väriin, muuten lisätään edelleen `1`.

Voimme toteuttaa tämän `if`-lauseella:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Tässä koodissa `colors.count` tarkoittaa taulukon alkioiden määrää.

Nykyisessä taulukossa on 4 väriä, joten:

```swift
colors.count // 4
```

Mutta suurin indeksi ei ole `4`, vaan `3`, koska indeksointi alkaa `0`:sta.

Siksi viimeinen indeksi pitää kirjoittaa näin:

```swift
colors.count - 1
```

Eli:

```swift
4 - 1 = 3
```

Tämä logiikka tarkoittaa: jos nykyinen indeksi vastaa jo viimeistä väriä, palauta indeksi arvoon `0`; muuten kasvata sitä yhdellä.

Näin värit voivat vaihtua silmukassa.

### Indeksilogiikan optimointi

Jos haluamme tehdä koodista lyhyemmän, voimme käyttää myös kolmioperaattoria:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Tämä koodi tarkoittaa: jos `index == colors.count - 1` on tosi, palauta `0`. Muussa tapauksessa palauta `index + 1`.

Lopuksi annamme tuloksen takaisin `index`-muuttujalle.

Nyt voimme toteuttaa värinvaihtotehosteen.

Täydellinen koodi:

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

Nyt voimme napauttaa näyttöä ja vaihtaa eri värien välillä. Perus fill light -sovellus on valmis.

## Värin nimen näyttäminen

Voimme lisätä toisen tekstiryhmän, joka vastaa värejä, jotta värin vaihtuessa näytöllä näkyy myös nykyisen värin nimi.

Esimerkiksi:

- Punainen näyttää `Red`
- Sininen näyttää `Blue`
- Keltainen näyttää `Yellow`
- Violetti näyttää `Purple`

Tässäkin voimme käyttää taulukkoa värien nimien tallentamiseen:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Tämän taulukon tekstien järjestyksen tulee vastata täsmälleen väritaulukon värien järjestystä.

Sitten voimme käyttää `Text`-komponenttia nykyisen indeksin värin nimen näyttämiseen:

```swift
Text(colorsName[index])
```

`Text` näyttää nykyisen värin nimen `index`-arvon perusteella.

Käytä muokkaimia parantaaksesi `Text`-komponentin ulkoasua:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Tämä saa `Text`-tekstin näkymään valkoisena, otsikkokoolla ja lihavoituna.

Nyt meillä on koko näytön kokoinen `Color`-näkymä. Jos haluamme, että `Text` näkyy `Color`-näkymän päällä, meidän täytyy käyttää `ZStack`-asettelusäiliötä niiden pinoamiseen.

```swift
ZStack {
    Color
    Text
}
```

Silloin koodista tulee:

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

Näin taustana on värinäkymä, ja sen päälle pinotaan tekstinäkymä.

Tulos:

![Color](../../Resource/018_color2.png)

On hyvä huomata, että `ZStack`-rakenteessa myöhemmin kirjoitetut näkymät näkyvät yleensä edessä. Jos `Text` kirjoitetaan ennen `Color`-näkymää, myöhempi `Color`-näkymä voi peittää `Text`-tekstin.

## Kirkkauden hallinta

Nyt voimme vaihtaa eri värien välillä, mutta fill lightilla on toinenkin tärkeä toiminto: **kirkkauden säätäminen**.

SwiftUI:ssa voimme käyttää `brightness`-muokkainta näkymän kirkkauden säätämiseen.

Esimerkiksi:

```swift
.brightness(1)
```

Voimme kirjoittaa:

```swift
colors[index]
    .brightness(0.5)
```

Tämä tekee nykyisestä väristä kirkkaamman ja lähempänä fill light -efektiä.

Kirkkauden alue on `0 - 1`. `0` tarkoittaa alkuperäisen värin säilyttämistä, ja mitä lähempänä arvo on `1`, sitä kirkkaammaksi väri muuttuu. `1` tarkoittaa kirkkainta valkoista tulosta.

Vaikka voimme hallita `brightness`-arvoa koodissa, käyttäjä ei silti voi säätää sitä itse suoraan.

Siksi meidän täytyy lisätä vedettävä ohjain: `Slider`.

## `Slider`-näkymä

SwiftUI:ssa `Slider` on ohjauskomponentti, jota käytetään arvon valitsemiseen tietyltä alueelta. Apple kuvaa sitä "ohjaimeksi arvon valitsemiseksi rajatulta lineaariselta alueelta".

Peruskäyttö:

```swift
Slider(value: $value, in: 0...1)
```

Parametrien selitys:

1. `value: $value`: `Slider` täytyy sitoa muuttujaan.

    Kun liukusäädintä vedetään, muuttujan arvo muuttuu samalla. Vastaavasti jos muuttujan arvo muuttuu, myös liukusäädin päivittyy.

    Tämä on hyvin samanlaista kuin aiemmin oppimamme `TextField`. Molemmissa "ohjain sidotaan muuttujaan".

    Sidotun muuttujan eteen tarvitaan `$`-symboli osoittamaan sidontaa.

2. `in: 0...1`: Tämä parametri edustaa liukusäätimen arvoaluetta.

    Tässä `0...1` tarkoittaa, että pienin arvo on `0` ja suurin arvo on `1`.

    Kun liukusäädin vedetään täysin vasemmalle, sidottu muuttuja on lähellä arvoa `0`; kun se vedetään täysin oikealle, se on lähellä arvoa `1`.

Esimerkiksi:

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

`Slider` on sidottu `value`-muuttujaan. Kun liukusäädintä vedetään, `value`-muuttujan arvo muuttuu samalla.

Ulkoasu:

![Slider](../../Resource/018_slider.png)

Kun `Slider` siirretään vasemmalle puolelle, sidottu `value`-arvo muuttuu `0`:ksi. Kun se siirretään oikealle puolelle, siitä tulee `1`.

### Arvoalue

`Slider`-komponentin arvoalue ei ole kiinteä. Se voidaan kirjoittaa myös näin:

```swift
0...100
```

tai jonkin muun alueen muodossa.

Mutta tässä fill light -sovelluksessa meidän täytyy hallita kirkkautta, joten `0...1` on sopivin valinta.

## `Slider`-komponentin käyttäminen kirkkauden hallintaan

Nyt meidän täytyy yhdistää `Slider` ja `brightness`.

Luo ensin muuttuja kirkkausarvon tallentamiseen:

```swift
@State private var slider = 0.0
```

Tässä `0.0` on `Double`-tyyppinen arvo.

Koska `Slider` sidotaan yleensä numeeriseen tyyppiin, ja täällä haluamme sen muuttuvan jatkuvasti, `Double` sopii paremmin. Lisäksi `brightness` hyväksyy vain `Double`-tyyppisen arvon.

Syötä sitten tämä arvo `brightness`-muokkaimeen:

```swift
colors[index]
    .brightness(slider)
```

Kun `slider == 0`, väri pysyy oletustilassaan. Mitä lähempänä `slider` on arvoa `1`, sitä kirkkaammalta väri näyttää.

### `Slider`-ohjaimen lisääminen

Lisää seuraavaksi `Slider`-ohjain tämän muuttujan muuttamista varten:

```swift
Slider(value: $slider, in: 0...1)
```

Kun liukusäädin muuttuu, myös `slider`-arvo muuttuu, ja `brightness(slider)` päivittää kirkkauden samalla.

Tämä on erittäin tyypillinen esimerkki siitä, kuinka "muuttujat ohjaavat näkymää" SwiftUI:ssa.

### `Slider`-komponentin ulkoasun säätäminen

Oletusarvoisesti `Slider` käyttää käytettävissä olevan leveyden.

Voimme antaa sille kiinteän leveyden:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Lisätään sitten vielä muutama muokkain, jotta se näkyy paremmin:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Tämä antaa liukusäätimelle valkoisen taustan ja pyöristetyt kulmat, jolloin se erottuu selvemmin `Color`-näkymän päällä.

Lopuksi sijoita se näytön alareunaan.

Koska käytimme jo `ZStack`-rakennetta, voimme lisätä sen sisään `VStack`-rakenteen ja käyttää `Spacer()`-komponenttia työntämään `Slider` alas.

## Täydellinen koodi

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

Tulos:

![Color](../../Resource/018_color.png)

## Yhteenveto

Käyttämällä aiemmin oppimaamme tietoa yhdessä peruskäsitteiden, kuten värien ja taulukoiden, kanssa rakensimme erittäin mielenkiintoisen fill light -sovelluksen.

Tämän fill light -sovelluksen kautta opimme käyttämään `brightness`-muokkainta kirkkauden säätämiseen, `onTapGesture`-toimintoa napautustoimintojen lisäämiseen näkymiin sekä `Slider`-ohjainta.

Lisäsimme `onTapGesture`-toiminnon `Color`-näkymään värien vaihtamista varten. Käytimme myös `Slider`-ohjainta muuttamaan muuttujaa, joka hallitsee `brightness`-arvoa, mikä on toinen esimerkki siitä, että "muuttujat ohjaavat näkymää".

Kertasimme myös kolmioperaattorin, käytimme `ZStack`-rakennetta näkymien pinoamiseen ja käytimme taulukoita saman tyyppisen tietoryhmän hallintaan. Tämä syventää ymmärrystämme taulukoista ja indekseistä, mukaan lukien käytännön ongelma indeksin ylitysvirheiden välttämisestä.

Vaikka tämä esimerkki ei ole monimutkainen, se yhdistää monia aiemmin oppimiamme perusideoita. Kun ne yhdistetään pieneen oikeaan projektiin, on helpompi ymmärtää, mihin kutakin käsitettä käytetään.

### Todellinen käyttöskenaario

Kuvittele, että asetat vanhan iPhonen pöydälle ja käytät itse kehittämääsi fill light -sovellusta valon värin hallintaan. Se olisi erittäin mukava käyttökokemus.

App Storessa on monia "fill light" -sovelluksia, eivätkä nekään näytä kovin monimutkaisilta.

![AppStore](../../Resource/018_appStore.PNG)

Voimme aloittaa kehittämällä yksinkertaisia sovelluksia ja yrittää julkaista niitä App Storeen. Tämä ei ainoastaan lisää kiinnostustamme kehitystyöhön, vaan myös tallentaa kasvumme.

### Harjoitus oppitunnin jälkeen

Voit jatkaa tämän fill light -sovelluksen laajennusmahdollisuuksien pohtimista, esimerkiksi:

- Lisää värejä
- Näytä nykyinen kirkkausarvo
- Paranna alareunan liukusäädinalueen ulkoasua

Kun todella alat käyttää tätä tietoa, huomaat, että jokainen oppimamme käsite on itse asiassa työkalu sovellusten rakentamiseen.

Mitä enemmän työkaluja hallitsemme, sitä enemmän toimintoja voimme toteuttaa.
