# Näkymien ymmärtäminen

Tässä oppitunnissa palaamme alkuperäiseen `ContentView`iin.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Kun kohtasimme SwiftUI:n ensimmäistä kertaa, `ContentView` sisälsi monia avainsanoja, joita emme ymmärtäneet.

Esimerkiksi `struct`, `View`, `var`, `body`, `some View` ja muita avainsanoja.

Silloin ehkä tiesimme vain tämän: **kun kirjoitamme koodia `body`n sisään, sisältö näkyy käyttöliittymässä.**

Nyt olemme oppineet `struct`in, muuttujat, metodit ja protokollat, joten voimme ymmärtää tämän koodin uudelleen ja sen avulla ymmärtää SwiftUI-näkymien välistä suhdetta.

## ContentView uudelleen

SwiftUI-projektin luomisen jälkeen Xcode luo oletuksena `ContentView`-tiedoston.

Esimerkkikoodi on seuraava:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hei, maailma!")
        }
        .padding()
    }
}
```

Tämän koodin voi ymmärtää jakamalla sen muutamaan osaan.

Ensimmäisenä:

```swift
import SwiftUI
```

Tämä rivi tarkoittaa SwiftUI-kehyksen tuomista käyttöön.

Kun SwiftUI on tuotu käyttöön, voimme käyttää SwiftUI-näkymiä, kuten `View`, `Text`, `Image`, `VStack` ja `Button`.

## ContentView-rakenne

Tämä koodirivi tarkoittaa rakenteen luomista:

```swift
struct ContentView: View
```

Siinä:

```swift
struct ContentView
```

tarkoittaa, että `ContentView` on rakenne.

Edellisellä oppitunnilla opimme `struct`ista. Se voi ryhmitellä toisiinsa liittyviä kenttiä yhteen, ja se voi sisältää ominaisuuksia ja metodeja.

Esimerkiksi:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Tässä esimerkissä `ContentView` sisältää kolme asiaa: `name`, `printName` ja `body`.

Toisin sanoen `struct` voi ryhmitellä toisiinsa liittyvät ominaisuudet, metodit ja näkymäsisällön yhteen.

![contentView](../../Resource/023_contentVIew.png)

## View on protokolla

Jatketaan tämän koodirivin tarkastelua:

```swift
struct ContentView: View 
```

Kaksoispisteen jälkeinen `View` tarkoittaa, että `ContentView` noudattaa `View`-protokollaa.

Sen voi ymmärtää näin: jos `ContentView` haluaa olla SwiftUI-näkymä, sen täytyy täyttää `View`-protokollan vaatimukset.

### Identifiable-protokolla

Kun opimme aiemmin elokuvalistaa, kohtasimme `Identifiable`-protokollan.

Silloin meidän piti käydä `Movie`-taulukko läpi `ForEach`in sisällä, mutta `Movie`-rakenteella ei ollut yksilöllistä tunnistetta, joten sitä ei voinut käyttää suoraan `ForEach`in kanssa.

Siksi meidän piti saada `Movie`-rakenne noudattamaan `Identifiable`-protokollaa, jotta se täyttäisi `ForEach`in yksilöllistä tunnistetta koskevan vaatimuksen.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

`Identifiable`-protokolla vaatii: **tällä tyypillä täytyy olla `id`-kenttä, joka tunnistaa sen.**

Kun `Movie` tarjoaa `id`-kentän, se voi täyttää `Identifiable`-protokollan vaatimukset.

Silloin SwiftUI voi tunnistaa jokaisen datan kohteen, kun käytämme sitä `ForEach`issä.

```swift
ForEach(lists) { movie in
    // ...
}
```

### View-protokolla

`View`-protokolla toimii samalla tavalla.

Jos jokin tyyppi haluaa olla SwiftUI-näkymä, sen täytyy noudattaa `View`-protokollaa.

`View`-protokollan tärkein vaatimus on tarjota `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, maailma!")
    }
}
```

`View`-protokollan vaatimuksen voi ymmärtää näin: **se hyväksyy `body`n palauttaman SwiftUI-näkymän, ja `ContentView` näyttää SwiftUI-näkymiä `body`n kautta.**

### Mitä tapahtuu, jos emme noudata View-protokollaa?

Jos kirjoitamme näin:

```swift
struct ContentView {
}
```

Tämä on vain tavallinen rakenne, ei SwiftUI-näkymä.

Se ei aiheuta virhettä suoraan, koska tavallinen rakenne on itsessään kelvollista Swift-koodia.

Mutta jos laitamme sen esikatseluun:

```swift
#Preview {
    ContentView()
}
```

syntyy virhe.

Syy on: **esikatselun täytyy näyttää SwiftUI-näkymä, mutta tämä `ContentView` ei noudata `View`-protokollaa.**

Siksi, jos haluamme, että `ContentView` voidaan näyttää käyttöliittymässä, meidän täytyy saada se noudattamaan `View`-protokollaa:

```swift
struct ContentView: View {
}
```

Samalla meidän täytyy tarjota `body` `View`-protokollan vaatimusten mukaisesti. Jos `body` puuttuu, kääntäjä antaa edelleen virheen.

Oikea kirjoitustapa:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, maailma!")
    }
}
```

Tässä vaiheessa `ContentView` on oikea SwiftUI-näkymä, joka voidaan näyttää.

## body on näkymän näyttämisen sisäänkäynti

SwiftUI:ssa `body` on näkymän sisällön sisäänkäynti.

```swift
var body: some View {
    Text("Hei, maailma!")
}
```

Tämän voi jakaa kolmeen osaan:

**1. var body**

```swift
var body
```

Tämä määrittelee muuttujan nimeltä `body`.

**2. some View**

```swift
: some View
```

Tämä tarkoittaa, että tämä `body` palauttaa näkymän.

**3. { ... }**

```swift
{
    Text("Hei, maailma!")
}
```

Tämä edustaa näytettävää näkymäsisältöä. Tässä koodissa näytettävä sisältö on `Text`-näkymä.

Toisin sanoen kaikki, mitä kirjoitamme `body`n sisään, näkyy käyttöliittymässä.

Esimerkiksi:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nimi:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Tämä koodi tarkoittaa: **käyttöliittymä näyttää pystysuunnassa järjestettyä sisältöä, jonka sisällä on kaksi tekstiä.**

### Nimeä body ei voi muuttaa vapaasti

On tärkeää huomata, että nimeä `body` ei voi muuttaa vapaasti.

Jos kirjoitamme:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hei, maailma!")
    }
}
```

Tämä `content` on myös näkymäominaisuus, mutta se ei voi korvata `body`a.

Tämä johtuu siitä, että `View`-protokollan vaatima nimi on `body`.

## Mikä on some View?

SwiftUI:ssa `some View` tarkoittaa tietyn näkymän palauttamista ilman, että näkymän koko tyyppiä tarvitsee kirjoittaa.

```swift
var body: some View
```

Toisin sanoen `some View` ei tarkoita, ettei tyyppiä olisi. Todellinen tyyppi on edelleen olemassa, ja kääntäjä tuntee sen, mutta tyyppi voi olla monimutkainen, joten Swift antaa meidän piilottaa sen `some View`in avulla.

### Mikä on some?

Swiftissä `some` on avainsana, jota käytetään opaque type -tyypin ilmoittamiseen.

Opaque type tarkoittaa: **palautusarvolla on konkreettinen tyyppi, ja kääntäjä tietää, mikä tämä konkreettinen tyyppi on, mutta emme kirjoita konkreettista tyyppiä suoraan.**

Esimerkiksi:

```swift
func makeView() -> some View {
    Text("Hei")
}
```

Tämä tarkoittaa, että `makeView` palauttaa konkreettisen tyypin, joka noudattaa `View`-protokollaa.

### Miksi tarvitsemme somea?

Muuttujia opiskellessamme opimme, että: **Swiftin arvoilla täytyy olla joko eksplisiittinen tyyppimerkintä, tai kääntäjän täytyy päätellä niiden tyyppi automaattisesti.**

Esimerkiksi:

```swift
let a: Int = 10
```

Tässä vakio `a` on tyyppiä `Int`.

SwiftUI-näkymät eivät ole poikkeus. Kun käytämme `body`a SwiftUI-näkymän näyttämiseen, `body`n täytyy palauttaa vastaava SwiftUI-tyyppi.

Jos esimerkiksi käytämme `body`a `Text`-näkymän näyttämiseen, `body`n täytyy palauttaa vastaava `Text`-tyyppi.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Tässä esimerkissä `body`n sisällä näytettävä näkymä on `Text`-näkymä, ja palautustyyppi on myös `Text`.

Vain kun sisäinen tyyppi vastaa ilmoitettua tyyppiä, se täyttää kääntäjän tyyppien yhdenmukaisuusvaatimuksen.

**Tyyppiristiriidan ongelma**

Jos asetamme `body`n tyypiksi `Color`, mutta näytämme `Text`in:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

`body`n tyyppi ja sisäisen koodin tyyppi eivät täsmää, joten syntyy tyyppiristiriitavirhe.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Tässä vaiheessa meidän täytyy muuttaa `body`n palautustyyppi käsin.

**Monimutkaiset näkymätyypit**

Todellisessa kehityksessä käyttöliittymä ei yleensä sisällä vain yhtä `Text`iä.

Jos meidän täytyy näyttää monimutkaisempi `VStack`, meidän pitäisi kirjoittaa monimutkainen palautustyyppi käsin.

Esimerkiksi:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hei, maailma!")
    }
}
```

Tämä koodi palauttaa `VStack`in, ja `VStack`in sisällä on tyyppejä `Image` ja `Text` olevia näkymiä.

`body`n palautustyyppi on:

```swift
VStack<TupleView<(Image,Text)>>
```

Kuten näet, tämä palautustyyppi on hyvin monimutkainen, ja se tuo myös esiin `TupleView`n, jota emme ole aiemmin nähneet.

Tässä `TupleView` voidaan ymmärtää näin: **useiden child view -näkymien kääriminen yhdeksi näkymäksi.**

**Vielä monimutkaisemmat näkymätyypit**

Jos lisäämme näkymään modifierit:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hei, maailma!")
    }
    .padding()
}
```

tämän näkymän palautustyyppi muuttuu hyvin monimutkaiseksi, eikä sitä voi kuvata tässä yksityiskohtaisesti.

Nykyinen palautustyyppi `VStack<TupleView<(Image,Text)>>` ei enää pysty kuvaamaan modifiereita, joten syntyy virhe.

**some View yksinkertaistaa palautustyyppiä**

Tähän tilanteeseen SwiftUI tarjoaa selkeän ratkaisun: käytetään `some View`ia koodin yksinkertaistamiseen.

Kun muutamme `body`n tyypiksi `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hei, maailma!")
    }
    .padding()
}
```

meidän ei enää tarvitse kirjoittaa täydellistä palautustyyppiä joka kerta, kun muutamme näkymäkoodia.

Tämä johtuu siitä, että `some View` tarkoittaa konkreettisen, `View`-protokollaa noudattavan näkymän palauttamista.

Toisin sanoen SwiftUI-näkymät, kuten `VStack` ja `Image`, noudattavat kaikki `View`-protokollaa. Kun modifiereita lisätään, palautettu näkymätyyppi noudattaa edelleen `View`-protokollaa.

Siksi ne kaikki voidaan palauttaa `some View`ina.

### some View ei voi palauttaa mitä tahansa näkymää vapaasti

Vaikka `some View` voi piilottaa monimutkaisia tyyppejä, se ei ole “tyypitön”.

Sen ydinsääntö on: **kääntäjän täytyy pystyä määrittämään yksi konkreettinen palautustyyppi**.

Esimerkiksi:

```swift
var title: some View {
    Text("Hei")
}
```

Tämä palauttaa `Text`-näkymän.

Jos kuitenkin yritämme palauttaa kaksi näkymää, syntyy virhe:

```swift
var title: some View {
    Text("Hei")
    Image(systemName: "star")
}
```

Tämä johtuu siitä, että `some View`n täytyy lopulta palauttaa yksi näkymärakenne, mutta tässä yritämme palauttaa kaksi itsenäistä näkymää.

### Ratkaisu

Ratkaisuja on yleensä kaksi: container ja `@ViewBuilder`.

**1. Kääri containerilla**

```swift
var title: some View {
    VStack {
        Text("Hei")
        Image(systemName: "star")
    }
}
```

Tässä koodissa `title` palauttaa `VStack`in, kun taas `Text` ja `Image` ovat `VStack`in sisäisiä child view -näkymiä.

`some View`in vastaanottama näkymärakenne on `VStack<...>`, mikä täyttää vaatimuksen siitä, että `some View` palauttaa yhden näkymärakenteen. 

Tämä on myös syy siihen, miksi suosittelemme SwiftUI:n oppimisen alusta lähtien käärimään näkymäkoodin ulompaan `VStack`-containeriin.

**2. Käytä @ViewBuilderia**

Voimme myös lisätä `@ViewBuilder`-modifierin ennen `some View`ia:

```swift
@ViewBuilder
var title: some View {
    Text("Hei")
    Image(systemName: "star")
}
```

`@ViewBuilder` voi yhdistää useita näkymiä yhdeksi palautustulokseksi.

Sen ydin on edelleen yhdistää useita näkymiä yhdeksi näkymäksi, jotta `some View`in vaatimus yhden näkymärakenteen palauttamisesta täyttyy.

### Miksi body voi sisältää useita näkymiä suoraan?

Jos kirjoitamme useita näkymiä `var body`n sisään, esimerkiksi:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hei, maailma!")
}
```

joissakin tilanteissa tämä `body` ei aiheuta virhettä.

Syy on, että `View`-protokollan `body` tukee oletuksena `@ViewBuilder`ia:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

`View`-protokollan lähdekoodissa näemme, että `@ViewBuilder` muokkaa jo `body`-muuttujaa.

Siksi `body`lla on tavalliseen `some View`iin verrattuna ylimääräinen erityiskäsittelykerros, joten SwiftUI auttaa automaattisesti yhdistämään useita näkymiä yhdeksi näkymäksi.

**Käytä ensin containereita**

Aloittelijoiden ymmärtämisen helpottamiseksi on suositeltavaa käyttää ensin containereita, kuten `VStack`, `HStack`, `ZStack` ja `Group`, useiden näkymien järjestämiseen.

Esimerkiksi:

```swift
var body: some View {
    VStack {
        Text("Hei")
        Image(systemName: "star")
    }
}
```

Tämä tekee koodista havainnollisempaa: **ulkokerros on `VStack`, ja sen sisällä on kaksi child view -näkymää.**

## Näkymien jakaminen

Jos käyttöliittymä on yksinkertainen, voimme kirjoittaa kaiken koodin `body`n sisään.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Tervetuloa Qinoteen")
                Text("Hyvää huomenta")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Napsauta minua") {
                print("Napsauta minua ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Tämän näkymän näyttötyyli:

![view](../../Resource/023_view1.png)

Tämä koodi voi toimia normaalisti, mutta jos näkymäkoodista tulee hyvin monimutkaista, `body`n sisällä oleva koodi pitenee jatkuvasti, jolloin sen lukeminen ja muuttaminen vaikeutuu.

Tässä vaiheessa voimme jakaa eri alueet itsenäisiksi näkymäominaisuuksiksi.

### Ylänäkymän jakaminen

Esimerkiksi jaetaan yläalue erilleen:

```swift
var topHome: some View {
    HStack {
        Text("Koti")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Tässä `topHome` on muuttuja, joka palauttaa näkymän.

Koska se palauttaa näkymän, sen tyyppi voidaan kirjoittaa näin:

```swift
some View
```

Tämä on käytännössä sama käyttötapa kuin `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Molemmat käyttävät muuttujia näkymien näyttämiseen, ja molempien palautustyyppi on `some View`.

### Muiden näkymien jakaminen

Jatketaan sitten muiden osien jakamista:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Tervetuloa Qinoteen")
        Text("Hyvää huomenta")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Napsauta minua") {
        print("Napsauta minua")
    }
    .buttonStyle(.borderedProminent)
}
```

Jakamisen jälkeen voimme laittaa näkymämuuttujat `body`n sisään:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Koti")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Tervetuloa Qinoteen")
            Text("Hyvää huomenta")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Napsauta minua") {
            print("Napsauta minua")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Nyt `body` vastaa vain sivurakenteen kuvaamisesta:

```swift
topBar
welcomeText
colorList
clickButton
```

Jokaisen osan tarkka toteutus sijoitetaan alla olevaan vastaavaan ominaisuuteen.

Tämä tapa jakaa näkymiä voi tehdä sivurakenteesta selkeämmän. Jokaisella näkymäalueella on oma nimensä, mikä helpottaa koodin lukemista.

Kun muokkaamme tiettyä koodin osaa, voimme löytää vastaavan näkymäalueen suoraan sen sijaan, että etsisimme monimutkaisen koodin seasta.

### some View palauttaa yhden näkymän

Tässä jaetussa näkymässä, jos yritämme palauttaa useita näkymiä:

```swift
var topBar: some View {
    Text("Koti")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

syntyy virhe, koska `some View` voi palauttaa vain yhden näkymärakenteen.

Toisin kuin `body`, tavallisilla computed property -ominaisuuksilla ei ole oletuksena `@ViewBuilder`ia.

Siksi, jos meidän täytyy palauttaa useita näkymiä, voimme käyttää `VStack`-, `HStack`- tai `Group`-containeria yhdistämään useita näkymiä yhdeksi.

```swift
var topBar: some View {
    VStack {
        Text("Koti")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Tai lisätä `@ViewBuilder`in näkymien yhdistämiseksi:

```swift
@ViewBuilder
var topBar: some View {
    Text("Koti")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Näin voimme palauttaa useita näkymiä.

### if palauttaa useita näkymiä

Esimerkiksi:

```swift
var topHome: some View {
    if step == "Koti" {
        HStack {
            Text("Koti")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Tyhjä")
    }
}
```

Tässä koodissa `topHome` palauttaa `step`in sisällön mukaan joko `HStack`in tai `Text`in, jotka ovat kaksi eri näkymätyyppiä.

Koska `some View` vaatii yhden määrätyn konkreettisen palautustyypin, tavallisen computed property -ominaisuuden `if`-haarat eivät voi palauttaa suoraan eri näkymätyyppejä, joten syntyy virhe.

**Ratkaisu on edelleen kääriä ne containeriin tai käyttää `@ViewBuilder`ia.**

### Miksi jaetut näkymät eivät käytä sulkeita

Kun käytämme erotettuja näkymäominaisuuksia `body`n sisällä, kirjoitamme ne suoraan:

```swift
topBar
welcomeText
colorList
clickButton
```

emmekä näin:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Tämä johtuu siitä, että `topBar`, `welcomeText`, `colorList` ja `clickButton` ovat muuttujia. Tarkemmin sanottuna ne ovat computed property -ominaisuuksia, eivät metodeja.

**Ominaisuudet eivät tarvitse sulkeita.**

Jos kirjoitamme sen metodina, voimme saavuttaa samankaltaisen vaikutuksen:

```swift
func topBar() -> some View {
    HStack {
        Text("Koti")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Tämä koodi voi myös saavuttaa samankaltaisen vaikutuksen. Tämän metodin kutsuminen palauttaa näkymän.

Käytettäessä se täytyy kirjoittaa näin:

```swift
topBar()
```

SwiftUI:ssa, jos vain erotamme näkymän, joka ei tarvitse parametreja, computed property -ominaisuuden käyttäminen on yleisempää.

```swift
var topBar: some View { ... }
```

## Sisäkkäiset näkymät

Koodin jakamisen lisäksi ominaisuuksiin voimme myös luoda uusia näkymärakenteita.

Esimerkiksi:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Tämä `PinkColorView`, kuten `ContentView`, on itsenäinen SwiftUI-näkymä.

Jos meidän täytyy näyttää se `ContentView`in sisällä, voimme lisätä `()` näkymän nimen jälkeen.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Tässä:

```swift
PinkColorView()
```

tarkoittaa `PinkColorView`-instanssin luomista.

Koska `PinkColorView` noudattaa `View`-protokollaa, se voidaan sijoittaa muihin näkymiin ja näyttää aivan kuten `Text`, `Image` ja `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Tämä on näkymien sisäkkäisyys: yksi näkymä voidaan näyttää toisen näkymän sisällä.

## Näkymäominaisuus vai uusi näkymä?

Kun näkymäkoodi on yksinkertaista, sitä ei yleensä tarvitse jakaa. Vasta kun koodi muuttuu monimutkaisemmaksi, näkymien jakamista suositellaan.

### Milloin käyttää näkymäominaisuuksia

Jos kyseessä on vain pieni sisältöosa nykyisessä näkymässä, voimme käyttää näkymäominaisuutta.

Esimerkiksi:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Näitä sisältöjä käytetään yleensä vain nykyisessä näkymässä.

### Milloin luoda uusi näkymä

Jos sisältö on suhteellisen itsenäinen tai sitä voidaan tulevaisuudessa käyttää uudelleen useilla sivuilla, on sopivampaa luoda uusi näkymä.

Esimerkiksi:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Tämä on otsikkonäkymä. Jos haluamme käyttää tätä näkymää uudelleenkäytettävänä komponenttina muissa näkymissä.

Voimme luoda uuden näkymän:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Sitten käytämme sitä muualla:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Tässä vaiheessa tämä näkymä on uudelleenkäytettävä itsenäinen komponentti.

Voimme tiivistää sen näin:

- Nykyisen näkymän sisältöalueet voivat käyttää `var xxx: some View`
- Uudelleenkäytettävät itsenäiset komponentit voidaan luoda uutena `struct XxxView: View` -rakenteena
- Komponentit, joihin täytyy välittää dataa, sopivat yleensä paremmin uusiksi näkymiksi.

## Yhteenveto

Tässä oppitunnissa ymmärsimme uudelleen SwiftUI:n perustavanlaatuisimman ja tärkeimmän näkymärakenteen.

`ContentView` on rakenne. Se määritellään `struct`illa, ja sitä käytetään sivuun liittyvän koodin järjestämiseen.

`View` on protokolla. Jos rakenne haluaa olla SwiftUI-näkymä, sen täytyy noudattaa `View`-protokollaa.

`body` on sisältö, jonka `View`-protokolla vaatii meitä tarjoamaan, ja se määrittää, mitä tämä näkymä näyttää.

`some View` tarkoittaa tietyn konkreettisen näkymän palauttamista ilman, että meidän tarvitsee kirjoittaa sen monimutkaista täydellistä tyyppiä.

Kun näkymäkoodi pitenee, voimme käyttää `var xxx: some View`ia jakaaksemme näkymäkoodin useisiin pieniin alueisiin.

Kun sisältöosa on suhteellisen itsenäinen tai sitä täytyy käyttää uudelleen, voimme luoda uuden näkymärakenteen ja näyttää sen muissa näkymissä `XxxView()`in avulla.

Yksinkertaisesti sanottuna SwiftUI-käyttöliittymät koostuvat yhteen yhdistetyistä näkymistä. Yksi sivu voi sisältää useita pieniä näkymiä, ja pieni näkymä voi myös sisältää muita näkymiä.
