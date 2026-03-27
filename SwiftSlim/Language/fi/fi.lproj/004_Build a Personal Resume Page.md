# Henkilökohtaisen CV-sivun rakentaminen

Tässä luvussa teemme yksinkertaisen henkilökohtaisen CV-näkymän ja opimme seuraavat asiat:

- `cornerRadius`
- `spacing`
- `ScrollView`

Rakentamisen aikana kertaamme asettelua, `Text`- ja `Image`-näkymiä sekä toteutamme välistyksen hallinnan ja sisällön vierityksen.

## Henkilökohtainen CV

Tavoitetulos:

![Swift](../../RESOURCE/004_img.png)

**Yritä ensin tehdä tämä itsenäisesti ja jatka vasta sitten lukemista.**

### Projektin luominen

Luo uusi iOS-projekti tai jatka aiemmin tekemääsi projektia.

Oletusarvoinen `ContentView`-koodi:

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
    }
}
```

Tyhjennä nyt koodi ja ala kirjoittaa omaa sisältöäsi:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Kokonaisrakenne

Käytännön kehitystyössä suunnittelemme yleensä ensin kokonaisuuden.

Sivumme sisältää:

1. Otsikon
2. Henkilötiedot
3. Henkilöesittelyn

Lisäämme uloimmaksi `VStack`-säiliön:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` varmistaa, että näkymät asettuvat pystysuunnassa, ja sen avulla voidaan hallita järjestystä ja välistystä.

### Otsikko

Luodaan ensin `Text`, joka näyttää otsikon.

Tässä näytän otsikkona oman englanninkielisen nimeni:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Otsikko on tavallisesti suurempi ja lihavoitu, joten käytämme tähän `font`- ja `fontWeight`-muokkaimia:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Asettelu

SwiftUI:n oletuskohdistus on `center`, joten otsikko näkyy nyt `ContentView`-näkymän keskellä.

![Swift](../../RESOURCE/004_img3.png)

Meidän täytyy saada otsikko näkymän yläosaan. Tähän voidaan käyttää `Spacer`-näkymää:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` vie jäljelle jäävän tilan ja työntää `Text`-näkymän säiliön yläosaan.

![Swift](../../RESOURCE/004_img4.png)

### Tyhjä tila

Jos teksti näyttää olevan liian lähellä yläreunaa, voidaan käyttää `padding`- tai `Spacer`-ratkaisua.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Tämä asettaa `VStack`-säiliölle `20` pisteen yläreunuksen.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Voimme käyttää myös `Spacer`-näkymää ja antaa sille korkeuden `frame`:llä, jolloin saadaan tietyn korkuinen tyhjä tila.

Tuloksena:

![Swift](../../RESOURCE/004_img5.png)

### Kuva

Valmistelemme oman kasvokuvamme ja laitamme sen `Assets`-resurssikansioon.

![Swift](../../RESOURCE/004_img6.png)

Näytetään kuva `ContentView`-näkymässä `Image`-komponentilla:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Koska kuvan alkuperäinen koko on suuri, meidän täytyy käyttää `frame`-muokkainta näkyvän koon hallintaan.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Tässä huomataan yksi ongelma:

Jos `frame`:n leveyden ja korkeuden suhde ei vastaa kuvan alkuperäistä suhdetta, kuva vääristyy.

Esimerkiksi:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Jotta kuva ei vääristyisi, meidän täytyy käyttää `scaledToFit`-muokkainta:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` toimii näin:

Se skaalaa kuvan annetun `frame`-alueen sisään alkuperäisiä mittasuhteita noudattaen ja näyttää kuvan kokonaan.

Se ei venytä kuvaa väkisin täyttämään koko `frame`:ä, vaan säilyttää kuvasuhteen ja skaalaa kuvaa suhteellisesti, kunnes toinen reuna osuu tarkasti rajaan.

Tämä tarkoittaa:

- Jos `frame`:n leveys on pienempi, kuva skaalautuu leveyden mukaan
- Jos `frame`:n korkeus on pienempi, kuva skaalautuu korkeuden mukaan
- Kuva säilyttää aina alkuperäisen kuvasuhteensa eikä vääristy

Usein riittää, että asetetaan vain yhden suunnan koko. Esimerkiksi:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Tällöin järjestelmä laskee automaattisesti sopivan korkeuden leveyden `140` perusteella säilyttäen kuvasuhteen.

Jos haluat kiinteän visuaalisen suhteen tai haluat välttää kuvan puristumisen monimutkaisemmassa asettelussa, voit rajata sekä leveyden että korkeuden.

### Pyöristetyt kulmat

Jos haluat näyttää kuvan pyöristetyillä kulmilla, voit käyttää `cornerRadius`-muokkainta:

```swift
.cornerRadius(10)
```

Esimerkiksi:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Lisää `cornerRadius(20)` `Image`-muokkainten loppuun.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` tarkoittaa, että näkymän reuna leikataan ja siihen lisätään `20` pisteen kulmasäde.

Kun pyöristetyt kulmat on lisätty, kuvan neljästä kulmasta tulee kaarevia, mikä tekee ilmeestä pehmeämmän ja modernimman.

Tällainen suunnittelutyyli on nykyisissä käyttöliittymissä hyvin yleinen. Esimerkiksi iOS-sovellusikonit ovat myös pyöristetyn suorakulmion muotoisia, vaikka järjestelmäikonit käyttävätkin jatkuvan kaarevuuden superellipsiä eivätkä yksinkertaisia pyöristettyjä kulmia.

### Henkilötiedot

Seuraavaksi toteutamme kuvan vasemmalle puolelle tulevan henkilötietoalueen. Käyttöliittymästä näkee, että henkilötiedot ja kuva ovat vaakasuunnassa vierekkäin, joten tarvitsemme `HStack`-asettelun.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Henkilötietojen sisältö on pystysuunnassa.

![Swift](../../RESOURCE/004_img11.png)

Siksi käytämme ulompana `HStack`ia, henkilötietoihin `VStack`ia ja tekstisisältöön `Text`-näkymiä.

Perusrakenne:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Kenttäotsikoiden lihavointi**

Jotta kentän nimi ja kentän arvo erottuvat toisistaan, kentän nimelle voidaan käyttää `fontWeight`-muokkainta:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Tekstin vasen kohdistus**

`VStack` on oletuksena keskitetty. Jos haluamme kaikkien tekstien olevan vasemmalle kohdistettuja, meidän täytyy asettaa kohdistus:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` tarkoittaa vasenta kohdistusta vasemmalta oikealle etenevissä kieliympäristöissä.

![Swift](../../RESOURCE/004_img14.png)

### Välistys

Jos haluamme säilyttää henkilötietojen ja kuvan välissä kiinteän etäisyyden, olemme aiemmin käyttäneet `Spacer`-näkymää:

```swift
Spacer()
    .frame(width: 10)
```

Voimme käyttää myös `HStack`in `spacing`-parametria:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` tarkoittaa, että kahden alinäkyvän väliin jää `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Mitä spacing on?**

`VStack`-, `HStack`- ja `ZStack`-säiliöissä `spacing` hallitsee alinäkyvien välistä etäisyyttä.

Esimerkiksi:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

`VStack`in alinäkyvien väli asetetaan `10 pt`:iin.

![Swift](../../RESOURCE/004_img16.png)

Huomaa, että `spacing` vaikuttaa vain suoriin alinäkyviin, eikä muuta sisäkkäisten säiliöiden sisäistä asettelua.

**Listan sisäisen välistyksen hallinta**

Jos haluat lisätä väliä kenttien väliin, suoraviivaisin tapa on asettaa `spacing` `VStack`iin:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Tällöin kaikkien alinäkyvien väliseksi etäisyydeksi tulee `10 pt`.

Mutta käyttöliittymää tarkastelemalla näkyy yksi ongelma:

Kenttäryhmien välissä on väliä, mutta samalla myös kentän nimen ja kentän arvon väliin ilmestyy sama etäisyys.

Tämä johtuu siitä, että `spacing` vaikuttaa kaikkiin nykyisen säiliön suoriin alinäkyviin.

Tässä rakenteessa jokainen `Text` on ulomman `VStack`in suora alinäkyvä, joten välistys on yhtenäinen.

Jos haluamme väliä kenttäryhmien väliin mutta pitää kentän nimen ja arvon oletuksena tiiviinä, voimme käsitellä “kentän nimi + kentän arvo” yhtenä loogisena kokonaisuutena ja kääriä ne erilliseen `VStack`iin:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Tällöin ulomman `VStack`in sisäisten ryhmien välillä on väliä, mutta kunkin sisemmän `VStack`in sisällä käytetään oletuksena tiivistä välistystä, joten kentän nimen ja arvon väliin ei tule ylimääräistä tyhjää tilaa.

![Swift](../../RESOURCE/004_img18.png)

### Henkilöesittely

Seuraavaksi toteutetaan henkilöesittelyalue.

Käyttöliittymän rakenteesta nähdään, että esittely koostuu useista tekstiriveistä, jotka on aseteltu pystysuunnassa.

![Swift](../../RESOURCE/004_img19.png)

Siksi voimme käyttää `VStack`-säiliötä yhdessä `Text`-näkymien kanssa:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Lisätään väliä**

Nyt henkilötieto- ja esittelyosat ovat melko tiiviit, eikä ulkoasu ole vielä kovin miellyttävä.

![Swift](../../RESOURCE/004_img20.png)

Koska ne molemmat sijaitsevat samassa ulommassa säiliössä, voimme hallita kokonaisväliä sen kautta:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Tuloksena:

![Swift](../../RESOURCE/004_img21.png)

**Listan välistys**

Voimme käyttää `spacing`-asetusta myös henkilöesittelyn tekstirivien välissä:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### CV:n viimeistely

Nyt henkilökohtaisen CV:n perusrakenne on valmis.

![Swift](../../RESOURCE/004_img.png)

### Vieritysnäkymä

Tällä hetkellä sivun rakenne käyttää `VStack`ia, mikä toimii hyvin, jos esittelytekstiä on vähän. Mutta jos rivejä on `20`, `30` tai enemmän, sisällön korkeus ylittää näytön.

Esimerkiksi:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Silloin tapahtuu kaksi asiaa:

- Alapuolinen sisältö leikkautuu pois
- Sivua ei voi vierittää

Tämä ei ole `VStack`in vika. `VStack` on vain asettelusäiliö, eikä se tarjoa automaattisesti vieritystä.

**Mikä ScrollView on**

`ScrollView` on vieritettävä säiliö, joka sopii tilanteisiin, joissa sisältö ylittää näytön koon, esimerkiksi pystysuuntaisille tai vaakasuuntaisille listoille.

Perusrakenne:

```swift
ScrollView {
    ...
}
```

Jos haluamme saada vierityksen käyttöön, koko sivun sisältö täytyy kääriä `ScrollView`-säiliön sisään:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Tällöin koko sivu muuttuu vieritettäväksi alueeksi, ja kun sisältö ylittää näytön korkeuden, sitä voi vierittää luonnollisesti.

`ScrollView` näyttää oletuksena vierityspalkin osoittimet. Jos haluat piilottaa ne, voit kirjoittaa:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Täydellinen koodi

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding()
        }
    }
}
```
