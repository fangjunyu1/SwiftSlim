# Mukautettu näkymä

Tässä oppitunnissa opimme erittäin tärkeän SwiftUI-kirjoitustavan: **mukautettu View**.

Mukautettu View voi kapseloida toistuvan View-koodin osan ja muuttaa sen View’ksi, jota voidaan käyttää uudelleen monta kertaa.

Todellisessa App-kehityksessä kohtaamme usein tällaisen tilanteen: monien käyttöliittymien rakenne on sama, mutta näytettävä sisältö on erilainen.

Esimerkiksi foorumisivuston julkaisuluettelossa jokaisella julkaisulla voi olla tietoja, kuten otsikko, kuva ja tykkäysten määrä.

![Reddit](../../../Resource/028_view1.png)

Verkkokauppasivuston tuoteluettelossa jokaisella tuotteella voi olla tietoja, kuten kuva, nimi ja hinta.

![Amazon](../../../Resource/028_view2.png)

Näiden sisältöjen rakenne on samankaltainen; ero on vain näytettävässä datassa.

Jos kirjoitamme jokaisen kohteen koodin käsin, koodista tulee hyvin pitkä, eikä sitä ole myöhemmin kätevä muokata.

Siksi voimme kapseloida yhteisen rakenteen mukautettuun View’hun ja välittää erilaisen sisällön parametreina.

Näin sama View voi näyttää erilaista sisältöä.

## Tarveskenaario

Esimerkiksi nyt haluamme luoda asetusten luettelon.

Näyttötulos:

![view](../../../Resource/028_view.png)

Tässä asetusten luettelossa on kolme erilaista asetuskohdetta: `Asetukset`, `Kansio` ja `Musiikki`.

Vaikka niiden kuvakkeet, värit ja otsikot ovat erilaisia, kokonaisrakenne on sama:

- Kuvake vasemmalla
- Kuvakkeen taustaväri
- Otsikko keskellä
- Nuoli oikealla

Jos emme käytä mukautettua View’ta, voisimme kirjoittaa näin:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Asetukset")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Kansio")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Musiikki")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Tämä koodi voidaan näyttää normaalisti, mutta ongelma on myös hyvin selvä: kolmen asetuskohteen koodi on lähes täysin sama.

Erona ovat vain kuvake, väri ja otsikko:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Asetukset")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Kansio")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musiikki")
```

Toisin sanoen jokaisen asetuskohteen rakenne on kiinteä, ja vain kuvake, väri ja otsikko ovat erilaisia.

Tällainen tilanne sopii erittäin hyvin mukautetun View’n käyttöön.

### Varjo shadow

Tässä käytämme uutta modifieria `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` voi lisätä varjon View’hun.

`radius` tarkoittaa varjon sumennussädettä. Mitä suurempi arvo on, sitä laajempi varjon leviämisalue yleensä on, ja sitä pehmeämmältä se näyttää.

Tässä arvoksi on asetettu `1`, mikä tarkoittaa, että lisäämme vain hyvin kevyen varjotehosteen.

## Asetuskohteen View’n kapselointi

Seuraavaksi kapseloimme jokaisen asetuskohteen uuteen View’hun.

Voimme luoda `SettingItemView`-View’n:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Tässä View’ssa määrittelemme kolme propertya:

```swift
let icon: String
let color: Color
let title: String
```

Niistä:

- `icon` tarkoittaa kuvakkeen nimeä
- `color` tarkoittaa kuvakkeen taustaväriä
- `title` tarkoittaa asetuskohteen otsikkoa

Koska nämä kolme sisältöä ovat erilaisia eri asetuskohteissa, teemme niistä parametreja, jotka voidaan välittää ulkopuolelta.

## Mukautetun View’n käyttäminen

Kun meillä on `SettingItemView`, meidän ei tarvitse enää kirjoittaa pitkää `HStack`-koodia toistuvasti.

Nyt voimme käyttää sitä näin:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")
```

Tämä koodirivi tarkoittaa, että luomme asetuskohteen View’n ja välitämme kolme parametria:

```swift
icon: "gear"
color: Color.blue
title: "Asetukset"
```

Kun ne on välitetty, `SettingItemView`-View’n sisäiset propertyt saavat vastaavat arvot:

- `icon`-arvo on `gear`
- `color`-arvo on `Color.blue`
- `title`-arvo on `"Asetukset"`

Siksi View’n sisällä `Image(systemName: icon)` näyttää hammasrataskuvakkeen, `.background(color)` käyttää sinistä taustaa ja `Text(title)` näyttää tekstin `Asetukset`.

Koko koodi:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Kansio")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musiikki")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/028_view.png)

Voimme nähdä, että kapseloinnin jälkeen näyttötulos on sama kuin aiemmin, mutta koodi on selkeämpi.

Aiemmin jokaiselle asetuskohteelle piti kirjoittaa kokonainen `HStack`-osio, mutta nyt yksi koodirivi riittää:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")
```

Tämä on mukautetun View’n tehtävä: **kapseloida toistuva View-rakenne ja välittää vain erilainen sisältö parametreina.**

## Miksi parametreja voidaan välittää

Seuraavaksi ymmärrämme yksinkertaisesti, miksi mukautettu View voi vastaanottaa parametreja.

SwiftUI:ssa View on pohjimmiltaan rakenne.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Tässä `ContentView` on rakenne.

Kun kirjoitamme:

```swift
ContentView()
```

luomme itse asiassa `ContentView`-View’n.

Lopussa oleva `()` tarkoittaa sen alustamismetodin kutsumista; sen voi ymmärtää myös tämän View’n luomisena.

Koska tällä `ContentView`-View’lla ei ole propertyja, jotka pitäisi välittää ulkopuolelta, voimme kirjoittaa suoraan:

```swift
ContentView()
```

Mutta jos View’ssa on property ilman arvoa, View’ta luotaessa täytyy välittää vastaava arvo.

Esimerkiksi:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nimi: \(name)")
    }
}
```

Tässä `name` on property, eikä sillä ole oletusarvoa.

Siksi `ContentView`-View’ta luotaessa `name`-propertylle täytyy antaa konkreettinen arvo:

```swift
ContentView(name: "Fang Junyu")
```

Näin View voi käyttää tätä arvoa sisäisesti:

```swift
Text("nimi: \(name)")
```

Tämä on myös syy siihen, miksi `SettingItemView`-View’ta luotaessa täytyy välittää parametreja:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")
```

Koska `SettingItemView`-View’ssa on kolme propertya ilman oletusarvoja:

```swift
let icon: String
let color: Color
let title: String
```

Siksi ne täytyy välittää sisään, kun tämä View luodaan. Swift käyttää välitettyjä parametreja antaakseen arvot View’n sisäisille propertyille.

## Alustamismetodi

Seuraavaksi ymmärrämme alustamismetodia hieman syvemmin.

### Oletusalustamismetodi

Kun määrittelemme tavallisen View’n:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Tässä koodissa emme ole kirjoittaneet alustamismetodia käsin.

Mutta kun käytämme tätä View’ta, voimme kirjoittaa näin:

```swift
ContentView()
```

Tässä `()` tarkoittaa itse asiassa `ContentView`-View’n luomista; sen voi ymmärtää myös sen alustamismetodin kutsumisena.

### Miksi sitä voidaan kutsua, vaikka alustamismetodia ei näy?

Koska Swift compiler luo meille alustamismetodin automaattisesti.

On tärkeää huomata: **tämä alustamismetodi luodaan automaattisesti, emmekä yleensä näe sitä suoraan koodissa.**

Toisin sanoen, vaikka emme kirjoittaisi `struct`-rakenteeseen käsin tätä:

```swift
init() {

}
```

Swift compiler luo taustalla meille suunnilleen tällaisen alustamismetodin:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Siksi voimme kirjoittaa suoraan:

```swift
ContentView()
```

Siksi todellisessa koodissa alustamismetodia ei yleensä tarvitse kirjoittaa käsin.

Riittää, että ymmärrämme yhden asian: **kun SwiftUI View luodaan, sen alustamismetodia kutsutaan. Vaikka emme kirjoittaisi alustamismetodia käsin, Swift voi luoda sen automaattisesti.**

### Parametreja sisältävä alustamismetodi

Jos View’ssa on property ilman oletusarvoa, esimerkiksi:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nimi: \(name)")
    }
}
```

Swift compiler luo propertyn perusteella automaattisesti alustamismetodin, jossa on parametri.

Sen voi ymmärtää yksinkertaisesti näin:

```swift
init(name: String) {
    self.name = name
}
```

Tässä:

```swift
init(name: String)
```

tarkoittaa, että `ContentView`-View’ta luotaessa täytyy välittää `String`-tyyppinen `name`-parametri.

Kun kirjoitamme:

```swift
ContentView(name: "Fang Junyu")
```

se tarkoittaa: välitä `"Fang Junyu"` parametrina alustamismetodille.

Sen jälkeen alustamismetodin sisällä suoritetaan:

```swift
self.name = name
```

Tämä koodirivi tarkoittaa: määritä ulkopuolelta välitetty `name` nykyisen View’n omalle `name`-propertylle.

Sen voi ymmärtää yksinkertaisesti näin:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nimi: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Näin View voi käyttää välitettyä arvoa sisäisesti.

Tämä on parametreja sisältävän View’n alustamisprosessi: **kun View’n sisäisellä propertylla ei ole oletusarvoa, View’ta luotaessa täytyy välittää vastaava parametri, jotta alustamismetodi viimeistelee arvon antamisen propertylle.**

## Tilanne, jossa propertylla on oletusarvo

Jos propertylla on jo oletusarvo, View’ta luotaessa parametria ei tarvitse välittää.

Esimerkiksi:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nimi: \(name)")
    }
}
```

Tässä `name`-propertylla on jo oletusarvo:

```swift
"Fang Junyu"
```

Siksi `ContentView`-View’ta luotaessa voimme kirjoittaa suoraan:

```swift
ContentView()
```

Tällöin `name` käyttää oletusarvoa, ja käyttöliittymä näyttää:

```swift
nimi: Fang Junyu
```

Tietenkin voimme myös välittää uuden arvon, kun luomme View’n:

```swift
ContentView(name: "Sam")
```

Tällöin View käyttää ulkopuolelta välitettyä arvoa `"Sam"` oletusarvon sijaan, ja käyttöliittymä näyttää:

```swift
nimi: Sam
```

Ymmärtämisen helpottamiseksi Swift compilerin automaattisesti luoman alustamismetodin voi ajatella yksinkertaisesti näin:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Tässä `name: String = "Fang Junyu"` tarkoittaa: jos View’ta luotaessa `name`-arvoa ei välitetä, käytetään oletusarvoa `"Fang Junyu"`; jos View’ta luotaessa välitetään uusi `name`, käytetään välitettyä arvoa.

Toisin sanoen: **jos ulkopuolelta ei välitetä parametria, käytetään propertyn oletusarvoa; jos ulkopuolelta välitetään parametri, käytetään välitettyä arvoa.**

## Takaisin SettingItemView’hun

Katsotaan nyt uudelleen SettingItemView’ta:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Tämän View’n rakenne on kiinteä.

Kiinteisiin osiin kuuluvat:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Erilaisiin osiin kuuluvat:

```swift
icon
color
title
```

Siksi teemme erilaisesta sisällöstä propertyja ja välitämme ne parametreina, kun luomme View’n.

Kun luomme erilaisia asetuskohteita, meidän tarvitsee vain välittää erilaiset parametrit:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")
SettingItemView(icon: "folder", color: Color.brown, title: "Kansio")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musiikki")
```

Näin sama `SettingItemView` voi näyttää kolme erilaista asetuskohdetta.

Tämä on mukautetun View’n yleisin käyttötapa.

## Yhteenveto

Tässä oppitunnissa opimme mukautetun View’n.

Mukautetun View’n keskeinen tehtävä on: **kapseloida toistuva View-koodi, jotta sitä voidaan käyttää uudelleen.**

Tässä esimerkissä kolmen asetuskohteen rakenne on sama, ja vain kuvake, väri ja otsikko ovat erilaisia.

Siksi loimme `SettingItemView`-View’n:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Sen jälkeen välitämme erilaiset parametrit, kun käytämme tätä View’ta:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Asetukset")
```

Nämä parametrit menevät `SettingItemView`-View’n sisään.

Tällä tavalla voimme luoda vähemmällä koodilla View’ja, joilla on sama rakenne mutta erilainen sisältö.

Tämä on myös erittäin yleinen kirjoitustapa SwiftUI-kehityksessä.
