# Upeat värit

Tässä luvussa opimme SwiftUI:n yleisiä visuaalisia muokkaimia, kuten:

- Värit
- Etualan väri
- Taustaväri
- Siirtymä
- Läpinäkyvyys
- Sumennus

Opimme myös `Safe Area` -alueesta.

Näitä muokkaimia käytetään näkymän ulkoasun hallintaan, jotta käyttöliittymästä tulee selkeämpi ja kerroksellisempi.

## Värit

SwiftUI:ssa tekstille voidaan asettaa väri.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` tarkoittaa sinistä, ja on käytännössä lyhyt kirjoitustapa muodolle `Color.blue` (tyyppipäätelmän ansiosta).

Tavallisia värejä ovat esimerkiksi:

```text
.black
.green
.yellow
.pink
.gray
...
```

Kaikki nämä ovat `Color`-tyypin staattisia ominaisuuksia.

![Color](../../RESOURCE/006_color.png)

Voit ajatella `Color`-tyyppiä värejä kuvaavana tyyppinä, ja `.blue`, `.red` ja muut sen yksittäisinä väreinä.

### Color-näkymä

SwiftUI:ssa `Color` voi myös näkyä suoraan näkymänä.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Tämä koodi tuottaa `100×100` punaisen neliön.

Voimme myös saada koko käyttöliittymän näyttämään tietyn väriseltä:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Kun sovellus ajetaan, huomataan, ettei punainen peitä koko näyttöä. iPhonen ylä- ja alareuna jäävät edelleen valkoisiksi, mikä liittyy `Safe Area` -alueeseen.

## Safe Area

`Safe Area` on järjestelmän varaama alue, jonka tarkoitus on estää sisällön peittyminen. Se sisältää:

1. Yläreunan tilapalkin (aika, akku)
2. Alareunan Home-indikaattorin
3. Lovialueen (`notch`) tai Dynamic Island -alueen

![Color](../../RESOURCE/006_color3.png)

SwiftUI rajoittaa sisällön oletuksena turvalliselle alueelle, joten näkymä ei ulotu ruudun reunoihin asti.

### Safe Area -alueen ohittaminen

Jos haluamme värin peittävän koko näytön, voimme käyttää `ignoresSafeArea`-muokkainta:

```swift
Color.red
    .ignoresSafeArea()
```

Tai vaihtoehtoisesti `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Tällöin näkymä ulottuu koko näytölle.

Huomaa, että `edgesIgnoringSafeArea` on vanhempi tapa. iOS 14:stä lähtien suositellaan käyttämään `ignoresSafeArea`-muokkainta.

## Etualan väri

### foregroundStyle-muokkain

Aiemmissa luvuissa olemme jo käyttäneet `foregroundStyle`-muokkainta värien asettamiseen.

Esimerkiksi:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` on uudempi tyylijärjestelmä, joka tukee värejä, liukuvärejä, materiaaleja ja muuta.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor-muokkain

`foregroundColor`-muokkainta voi myös käyttää värin asettamiseen:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Sitä käytetään samalla tavalla kuin `foregroundStyle`-muokkainta.

Uusimmissa Xcode-versioissa Xcode huomauttaa, että `foregroundColor` saatetaan poistaa käytöstä tulevissa iOS-versioissa, joten ensisijaisesti suositellaan `foregroundStyle`-muokkainta.

## Tausta

Jos haluamme lisätä näkymälle taustavärin, voimme käyttää `background`-muokkainta:

```swift
background(.red)
```

Esimerkiksi tekstin taustavärin lisääminen:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Kun valitsemme tekstiä esimerkiksi Wordissa tai Chromessa, näemme samantyyppisen taustaväritehosteen.

![Color](../../RESOURCE/006_color16.png)

Jos haluamme suurentaa tausta-aluetta, meidän täytyy käyttää `padding`-muokkainta yhdessä sen kanssa:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Tässä on tärkeä sääntö:

SwiftUI rakentaa näkymän muokkaimet ylhäältä alas. Myöhemmin kirjoitetut muokkaimet vaikuttavat aikaisempien muokkainten tulokseen.

Siksi:

```swift
.padding()
.background()
```

tarkoittaa, että tausta ympäröi näkymää sen jälkeen, kun sisätilaa on lisätty.

Jos järjestyksen kirjoittaa toisin päin:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Tausta ei laajene, koska se ei ympäröi myöhemmin lisättyä `padding`-aluetta.

## Esimerkki - nelikulmainen mutteri

Tehdään nyt yksinkertainen nelikulmaista mutteria muistuttava näkymä.

![Color](../../RESOURCE/006_color8.png)

Luodaan ensin `50 × 50` valkoinen neliö:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Jos haluamme siitä ympyrän, voimme käyttää `cornerRadius`-muokkainta:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Kun kulmasäde on yhtä suuri kuin puolet leveydestä ja korkeudesta, muodosta tulee ympyrä.

Lisätään nyt sininen tausta:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Uusi `padding` suurentaa ulompaa aluetta, ja `background` piirtää sinisen sen päälle.

Näin saamme aikaan nelikulmaisen mutterin kaltaisen efektin.

### Toinen ajattelutapa

Mutterin voi tehdä taustavärin lisäksi myös `ZStack`-asettelulla.

Olemme aiemmin oppineet, että `ZStack` mahdollistaa päällekkäisen asettelun. Nelikulmainen mutteri voidaan ajatella myös ympyrän ja suorakulmion päällekkäisyytenä.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` asettaa näkymät päällekkäin järjestyksessä, ja myöhemmin lisätty näkymä näkyy ylempänä.

## Esimerkki - kaksi päällekkäistä ympyrää

Monet ikonit rakentuvat yksinkertaisten muotojen päällekkäisyydestä, esimerkiksi kahdesta osittain limittäin olevasta ympyrästä.

![Color](../../RESOURCE/006_color14.png)

Luodaan ensin kaksi ympyrää:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Koska meidän täytyy saada kaksi ympyrää näkyviin päällekkäin, käytämme `ZStack`-asettelua:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Tässä vaiheessa kaksi samankokoista ympyrää menevät täysin päällekkäin.

Meidän täytyy saada ne vain osittain limittäin eikä täysin peittämään toisiaan, ja siihen voimme käyttää `offset`-siirtymää.

## Siirtymä

`offset` muuttaa vain näkymän piirtokohtaa, eikä vaikuta emonäkymän asettelulaskentaan.

Käyttö:

```swift
.offset(x:y:)
```

`x` on vaakasuuntainen siirtymä ja `y` pystysuuntainen siirtymä.

Positiivinen arvo siirtää oikealle tai alas, negatiivinen vasemmalle tai ylös.

Käytetään `offset`-muokkainta, jotta kaksi ympyrää menevät osittain päällekkäin:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Punaisen ympyrän asettelupaikka ei muutu, mutta sen piirtokohta siirtyy `25` pistettä vasemmalle. Siksi kaksi ympyrää näyttävät limittäisiltä.

## Läpinäkyvyys

SwiftUI:ssa `opacity`-muokkainta käytetään näkymän läpinäkyvyyden säätämiseen.

Peruskäyttö:

```swift
.opacity(0.5)
```

`opacity`-arvo vaihtelee välillä `0.0`–`1.0`, missä:

- `0` tarkoittaa täysin läpinäkyvää
- `1` tarkoittaa täysin peittävää

Voimme käyttää `opacity`-muokkainta oranssin ympyrän läpinäkyvyyden säätämiseen:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Kun oranssin ympyrän `opacity` asetetaan arvoon `0.8`, sen peittävyys on `80 %`. Kun kaksi ympyrää menevät päällekkäin, leikkausalueella näkyy värien sekoittumista.

## Sumennus

SwiftUI:ssa voidaan käyttää `blur`-muokkainta sumennusefektin lisäämiseen:

```swift
.blur(radius:10)
```

`radius` määrittää sumennuksen säteen. Mitä suurempi arvo, sitä voimakkaampi sumennus.

Voimme lisätä sumennuksen kahteen ympyrään:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Lopputuloksena nähdään kaksi hyvin sumeaa ympyrää.

## Yhteenveto

Tässä luvussa keskityimme SwiftUI:n yleisiin visuaalisiin muokkaimiin ja opimme hallitsemaan näkymän väriä, sijaintia ja visuaalisia tehosteita muokkaimien avulla.

Konkreettisten esimerkkien kautta näimme, miten erilaiset visuaaliset muokkaimet vaikuttavat käyttöliittymässä, ja samalla opimme myös turvallisen alueen käsitteen.

Nämä kaikki ovat hyvin perustavanlaatuisia muokkaimia. Niitä kannattaa harjoitella ja käyttää paljon, koska ne auttavat hallitsemaan käyttöliittymän ulkoasua selkeämmin oikeassa kehitystyössä.

### Harjoituksia tunnin jälkeen

- Lisää kuvaan läpinäkyvyys- ja sumennustehoste
- Tee kolme eri läpinäkyvyydellä päällekkäistä ympyrää
- Luo koko näytön täyttävä taustakuva ja ohita turvallinen alue
- Säädä useiden näkymien sijaintia `offset`-muokkaimella

Harjoitusten tarkoitus ei ole opetella API:a ulkoa, vaan havainnoida visuaalisten muutosten ja asettelukäyttäytymisen välistä suhdetta.
