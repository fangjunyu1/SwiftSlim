# Asettelu, kuvat ja teksti

Edellisessä luvussa opimme seuraavan `ContentView`-koodin:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tässä luvussa opimme SwiftUI:n oletusasettelumekanismin sekä kuvien ja tekstin käytön. Edellisen luvun pohjalta ymmärrämme tarkemmin näkymien rakennetta ja sitä, miten ne esitetään. Näiden tietojen avulla voimme rakentaa peruskäyttöliittymäasetteluja.

## SwiftUI:n oletusasettelumekanismi

Kun esikatselemme `ContentView`-näkymää, huomaamme, että ikoni ja teksti näkyvät keskitettyinä, eivätkä ala ruudun yläreunasta.

![Swift](../../RESOURCE/003_view.png)

Oletuksena `Stack`-säiliön kohdistus on `.center`, joten alinäkyvät näkyvät tavallisesti keskitettyinä.

### Alignment-kohdistus

On selvää, että keskitys on vain yksi kohdistusvaihtoehto. Jos haluamme kohdistaa vasemmalle tai oikealle, meidän täytyy käyttää `alignment`-asetusta näkymän kohdistuksen hallintaan.

```swift
alignment
```

SwiftUI:ssa kohdistus näkyy yleensä kahdessa tilanteessa:

**1. Stack-säiliön kohdistusparametri**

Esimerkiksi `ContentView`-näkymässä ikoni ja teksti voidaan kohdistaa vasemmalle:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack`-säiliössä `alignment` hallitsee vaakasuunnan kohdistusta.

Kohdistusvaihtoehdot:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` järjestää vaakasuunnassa, joten `alignment` hallitsee pystysuuntaista kohdistusta:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` on päällekkäinen asettelu, joten `alignment` voi hallita sekä vaaka- että pystysuuntaista kohdistusta:

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

Jos `alignment`-arvoa ei anneta erikseen, `VStack`, `HStack` ja `ZStack` käyttävät oletuksena `.center`-arvoa.

**2. frame:n sisäinen alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Kun `frame` tarjoaa näkymälle enemmän tilaa kuin näkymä itse tarvitsee, `alignment` määrää näkymän paikan `frame`:n sisällä. `frame`:n käyttöä käsitellään myöhemmin tarkemmin; tässä riittää perusymmärrys.

### Spacer ja tilan jakamisen mekanismi

`alignment` voi järjestää näkymiä vaaka- tai pystysuuntaan. Mutta kun haluamme esimerkiksi tekstin ja kuvan näkyvän eri puolilla, pelkkä kohdistus ei enää riitä.

Esimerkiksi jos haluamme tehdä [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) -sivuston yläosan kaltaisen näkymän, jossa vasemmalla on NHK:n logo ja oikealla valikkoikoni:

![Swift](../../RESOURCE/003_alignment3.png)

Jos käyttäisimme vain kohdistusta, molemmat ikonit näkyisivät samalla puolella. Emme saisi niitä jakautumaan vasemmalle ja oikealle, joten tarvitsemme `Spacer`-näkymän jakamaan jäljelle jäävän tilan.

`Spacer` on joustava asettelunäkymä, joka voi täyttää jäljelle jäävän tilan automaattisesti.

Käyttö:

```swift
Spacer()
```

Esimerkiksi:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Kun lisäämme `Spacer`-näkymän `Image`- ja `Text`-näkymien väliin, se täyttää jäljellä olevan tilan ja työntää kuvan ylös ja tekstin alas.

![Swift](../../RESOURCE/003_view1.png)

Jos `Spacer`-näkymiä on useita:

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

Jäljellä oleva tila jakautuu niiden kesken tasaisesti.

![Swift](../../RESOURCE/003_spacer.png)

## Kuvien näyttäminen ja koon hallinta

`Image`-näkymää käytetään pääasiassa kuvien näyttämiseen. Edellisessä luvussa opitut `SF Symbols` -ikonit olivat vain yksi `Image`-näkymän käyttötapa.

Käyttö:

```swift
Image("imageName")
```

Lainausmerkkien sisälle kirjoitetaan kuvan nimi, eikä tiedostopäätettä tarvitse lisätä.

### Kuvan näyttäminen

Valmistellaan ensin yksi kuva.

![Swift](../../RESOURCE/003_img.jpg)

Valitse Xcodessa `Assets`-resurssikansio ja vedä kuva sinne.

![Swift](../../RESOURCE/003_img1.png)

Näytetään kuva `ContentView`-näkymässä:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Huomaa: SwiftUI:n `Image` ei tue GIF-animaatioiden toistoa, vaan näyttää vain yhden staattisen ruudun.

### Kuvan koon hallinta

SwiftUI:ssa `Image` näkyy oletuksena alkuperäisessä koossaan. Jos haluamme säätää kuvan näkyvää kokoa, meidän täytyy ensin käyttää `resizable`, jotta kuva voi skaalautua, ja sen jälkeen määritellä asettelukoko `frame`:llä.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable-muokkain

`resizable` sallii kuvan skaalautua asettelussa sen sijaan, että se aina käyttäisi alkuperäistä kokoaan.

```swift
.resizable()
```

Vasta kun `resizable()` on lisätty, `frame` voi oikeasti muuttaa kuvan näkyvää kokoa.

Jos `resizable` jätetään pois:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` antaa vain asettelutilaa kuvalle, mutta kuvan oma koko ei muutu.

### frame-muokkain

`frame(width:height)`-muokkainta käytetään näkymän leveyden ja korkeuden määrittämiseen.

Peruskäyttö:

```swift
.frame(width: 10,height: 10)
```

Esimerkiksi voimme määrittää kuvan suorakulmioksi, jonka leveys on `300` ja korkeus `100`.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Voimme määrittää myös pelkän leveyden tai pelkän korkeuden:

```swift
.frame(width: 200)
.frame(height: 100)
```

Yhdistelmä `resizable + frame` antaa joustavan tavan hallita kuvan kokoa käyttöliittymässä säilyttäen samalla skaalautuvuuden.

### Skaalaussuhde: scaledToFit ja scaledToFill

Kun `frame` määrittää kuvalle alkuperäisestä poikkeavan leveyden ja korkeuden suhteen, kuva voi venyä ja vääristyä.

Jos haluamme pitää kuvan mittasuhteet ennallaan mutta saada sen sopimaan käytettävissä olevaan tilaan, voimme käyttää `scaledToFit`- tai `scaledToFill`-muokkainta.

**scaledToFit**

`scaledToFit` säilyttää kuvan alkuperäisen kuvasuhteen ja skaalaa sen niin, että kuva mahtuu kokonaan käytettävissä olevaan tilaan ilman rajausta:

```swift
.scaledToFit()
```

tai

```swift
.aspectRatio(contentMode: .fit)
```

Tämä sopii tilanteisiin, joissa kuva pitää näyttää kokonaisena ilman vääristymistä.

Jos kaikille kuville asetetaan sama leveys ja korkeus, venyminen on hyvin todennäköistä.

Esimerkiksi:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Jos skaalaussuhdetta ei määritellä, kuva ei voi säilyttää alkuperäisiä mittasuhteitaan.

![Swift](../../RESOURCE/003_img4.png)

Kun asetamme `scaledToFit`, kuva säilyttää alkuperäisen kuvasuhteensa.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` säilyttää myös kuvan mittasuhteet, mutta täyttää koko käytettävissä olevan tilan. Jos mittasuhteet eivät täsmää, ylimenevä osa rajautuu pois:

```swift
.scaledToFill()
```

tai

```swift
.aspectRatio(contentMode: .fill)
```

Tämä sopii tilanteisiin, joissa kuvan halutaan peittävän koko alue, esimerkiksi taustakuvana tai bannerina.

**Näiden ero**

![Swift](../../RESOURCE/003_img6.png)

## Teksti

SwiftUI:ssa `Text`-näkymää käytetään tekstin näyttämiseen.

Peruskäyttö:

```swift
Text("FangJunyu")
```

Opimme `Text`-näkymän jo edellisessä luvussa. Tässä luvussa opimme hallitsemaan tarkemmin tekstin fonttikokoa ja lihavuutta, jotta teksti ilmaisisi enemmän käyttöliittymässä.

### Fonttikoko

`font`-muokkaimella voidaan hallita tekstin kokoa:

```swift
.font(.title)
```

Esimerkiksi:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Yleisiä fonttikokoja suurimmasta pienimpään:

```text
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

### Fontin lihavuus

Jos haluamme tehdä tekstistä lihavoidun, voimme käyttää `fontWeight`-muokkainta:

```swift
.fontWeight(.bold)
```

Esimerkiksi:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Yleisiä fontin paksuuksia ohuimmasta paksuimpaan:

```text
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

`font` hallitsee fonttikokoa ja `fontWeight` hallitsee sen paksuutta. Näitä kahta voi käyttää yhdessä tekstin ilmaisun rikastamiseen.

## Yhteenveto ja harjoittelu

Tähän mennessä olemme oppineet SwiftUI:n oletusasettelun, `Spacer`-näkymän, `Image`- ja `Text`-näkymät sekä muita perusteita. Näillä tiedoilla pystyy jo kehittämään joitakin yksinkertaisia näkymiä.

Esimerkiksi: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Googlen käyttöliittymä on hyvin pelkistetty. Se sisältää sekä kuvia että tekstiä, joten voimme yrittää analysoida sen rakennetta SwiftUI:n näkökulmasta:

1. Kokonaisuus jakautuu kolmeen osaan: Google-logo, hakukenttä ja ohjeteksti. Tämän voi järjestää pystysuunnassa `VStack`in avulla.
2. Google-logo on kuva, joten se voidaan näyttää `Image`-näkymällä.
3. Hakukenttä sisältää syöttökentän ja ikonit. Jos syöttökenttä sivuutetaan tässä vaiheessa, hakukuvakkeen voi näyttää `Image`-näkymällä.
4. Ohjeteksti näytetään `Text`-näkymällä. Tekstien vaakasuuntainen järjestys voidaan tehdä `HStack`illa, ja tekstin väriä voidaan hallita `foregroundStyle`-muokkaimella.

Kun harjoittelemme näitä asioita, voimme rakentaa yksinkertaisia näkymiä ja syventää ymmärrystämme `Image`- ja `Text`-näkymistä sekä niiden muokkaimista.
