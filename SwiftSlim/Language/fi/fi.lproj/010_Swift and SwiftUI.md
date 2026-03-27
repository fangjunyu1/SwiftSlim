# Swift ja SwiftUI

Apple-alustojen kehitystä opiskellessa monet oppaat selittävät Swiftin ja SwiftUI:n erikseen. Tämä voi helposti saada aloittelijan kokemaan, että ne ovat irrallisia toisistaan, ja luulemaan niiden olevan kaksi täysin erillistä teknologiaa.

Todellisuudessa Swift ja SwiftUI muodostavat tiiviisti yhteen kuuluvan kokonaisuuden: Swift on ohjelmointikieli, joka vastaa logiikasta ja datasta, kun taas SwiftUI on Swiftin päälle rakennettu käyttöliittymäkehys, joka vastaa näkymien renderöinnistä ja vuorovaikutuksesta.

Tämä luku auttaa rakentamaan selkeän ajattelumallin siitä, mitä Swift on, mitä SwiftUI on ja miten ne toimivat yhdessä koodissa.

## Mikä Swift on?

Swift on Applen julkaisema moderni ohjelmointikieli, jota käytetään iOS-, macOS-, watchOS- ja tvOS-alustoille tehtävien sovellusten kehittämiseen.

![swift](../../RESOURCE/010_swift.png)

Swift on vahvasti tyypitetty, staattinen kieli, jonka suunnittelussa painotetaan turvallisuutta. Se vähentää monia tavallisia ohjelmointivirheitä, kuten nollaviittauksia ja rajojen ylityksiä, ja tukee saumattomasti myös C- ja Objective-C-koodin kanssa työskentelyä.

Käytännön kehityksessä Swift huolehtii enemmän sovelluksen logiikasta, kuten datan käsittelystä, verkkopyynnöistä ja tallennustoiminnoista.

## Mikä SwiftUI on?

SwiftUI on Applen vuonna 2019 julkaisema uusi käyttöliittymien rakentamiseen tarkoitettu kehys. SwiftUI käyttää deklaratiivista ohjelmointimallia, jonka avulla kehittäjä voi kuvata käyttöliittymän rakenteen ja vuorovaikutuksen aiempaa lyhyemmällä ja selkeämmällä koodilla.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklaratiivinen ohjelmointi tarkoittaa, että kehittäjän täytyy vain kertoa järjestelmälle, mitä hän haluaa näyttää, ja järjestelmä päivittää näkymän automaattisesti datan muutosten perusteella. Käyttöliittymän tilaa ei siis tarvitse päivittää käsin, mikä vähentää UI-kehityksen monimutkaisuutta huomattavasti.

SwiftUI:n ydin koostuu näkymäkomponenteista, kuten `Text`, `Image` ja `Button`, sekä asettelusäiliöistä, kuten `VStack`, `HStack` ja `ZStack`. Nämä komponentit toimivat yhdessä datan sidonnan ja tilanhallinnan avulla, jolloin käyttöliittymä pystyy reagoimaan datan muutoksiin ja päivittymään automaattisesti.

## Miten Swift ja SwiftUI toimivat yhdessä?

Swiftin ja SwiftUI:n vastuut voidaan tiivistää seuraavasti:

**1. Swift: logiikan ja datan käsittely**

Swiftiä käytetään pääasiassa datan hallintaan, tilan säilyttämiseen ja logiikan suorittamiseen. Tämä koodi ei yleensä vaikuta suoraan käyttöliittymän renderöintiin, vaan vastaa datan ja toiminnan käsittelystä.

Esimerkiksi datan käsittely Swiftillä:

```swift
let markdown = try? String(contentsOf: url)
```

Tämäntyyppinen koodi sisältää muuttujien määrittelyä, vakioita, funktioita ja ohjausvirtaa, mutta ei suoraan vaikuta näkymän ulkoasuun.

**2. SwiftUI: käyttöliittymän julistaminen ja renderöinti**

SwiftUI:ta käytetään käyttäjäliittymän rakenteen ja sisällön rakentamiseen. Se vastaa ennen kaikkea näkymien renderöinnistä ja vuorovaikutuksesta.

Esimerkiksi tekstinäkymän luominen SwiftUI:lla:

```swift
Text("SwiftSlim")
```

Tällainen koodi rakentaa käyttöliittymäelementtejä ja ohjaa niiden toimintaa, eli se liittyy suoraan käyttöliittymään.

### Perusesimerkki

Alla on yksinkertainen SwiftUI-esimerkki:

```swift
// ContentView.swift

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

Tässä esimerkissä:

**SwiftUI-koodi**: `VStack`, `Image`, `Text` ja `padding` kuuluvat SwiftUI:hin, ja ne vastaavat käyttöliittymän näyttämisestä ja asettelusta.

**Swift-koodi**: tiedoston yläosan `//`-kommentit ja `import SwiftUI` ovat Swift-koodin rakennetta; alareunan `#Preview` on Xcoden esikatseluun tarkoitettu makro, eikä se osallistu varsinaisen käyttöliittymän renderöintiin.

### Edistyneempi esimerkki

Oikeissa projekteissa Swift ja SwiftUI sekoittuvat usein toisiinsa, jotta kumpikin hoitaa sen, missä se on parhaimmillaan:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Tässä esimerkissä:

**SwiftUI-koodi**: `@State` on SwiftUI:n oma property wrapper, jota käytetään näkymän muuttuvan tilan määrittämiseen; `Button` ja `Text` ovat SwiftUI:n näkymäkomponentteja, jotka vastaavat käyttöliittymästä ja käyttäjän vuorovaikutuksesta.

**Swift-koodi**: `private var name` ja `func printName()` ovat Swift-koodia, jota käytetään datan tallentamiseen ja logiikan suorittamiseen. Ne eivät suoraan vaikuta näkymän renderöintiin.

Kun käyttäjä painaa painiketta, SwiftUI suorittaa painikkeen sisällä olevan toiminnon:

```swift
Button("Print") {
    printName()
}
```

Tässä `Button` on SwiftUI-komponentti, mutta suoritettava `printName()`-funktio on Swift-koodia, joka hoitaa varsinaisen logiikan.

Juuri tällainen yhteistyö mahdollistaa sen, että Swift ja SwiftUI toimivat saumattomasti yhdessä: Swift käsittelee dataa ja logiikkaa, SwiftUI vastaa käyttöliittymän näyttämisestä.

## Missä Swift- ja SwiftUI-koodi yleensä kirjoitetaan?

SwiftUI:ssa käyttöliittymä rakennetaan `body`-ominaisuuden palauttamasta näkymästä. Siksi kaikki käyttöliittymää kuvaava koodi kirjoitetaan tavallisesti `body`-lohkoon.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Tässä esimerkissä `Text` on SwiftUI-näkymäkomponentti, joten sen täytyy olla `body`-lohkon sisällä, koska SwiftUI lukee `body`n ja luo käyttöliittymän sen pohjalta.

Käyttöliittymästä riippumaton koodi, kuten muuttujat, funktiot tai datankäsittelylogiikka, kirjoitetaan tavallisesti `body`-lohkon ulkopuolelle. Esimerkiksi:

```swift
struct ContentView: View {

    // Swift: dataa tai logiikkaa
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: käyttöliittymä
    var body: some View {
        Text(name)
    }
}
```

On tärkeää huomata, että `body`-lohkon sisällä voidaan silti käyttää myös Swiftin syntaksia, kuten `if`- ja `for`-ohjausrakenteita. Niitä käytetään kuitenkin vain hallitsemaan SwiftUI-näkymien muodostumista:

```swift
if isLogin {
    Text("Welcome")
}
```

Siksi SwiftUI-kehityksessä voi ajatella yksinkertaisesti näin: näkymäkoodi (`Text`, `Image`, `Button` jne.) kirjoitetaan tavallisesti `body`-lohkoon, ja data- sekä logiikkakoodi (muuttujat, funktiot jne.) kirjoitetaan tavallisesti sen ulkopuolelle.

## Swift-tiedostot

Kun opiskelu etenee, tulemme vastaan myös MVVM-arkkitehtuurin. Siinä `ViewModel`- ja `Model`-kerrokset koostuvat usein puhtaasta Swift-koodista ja ovat täysin erillään näkymäkerroksesta (`SwiftUI`).

Esimerkiksi luokka, jota käytetään sovelluksen tilan hallintaan:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Tai tietorakennetta kuvaava `struct`:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Tällaisten tiedostojen tehtävä on hallita ja säilyttää dataa pysyvästi, eivätkä ne näy suoraan näkymässä, joten ne kuuluvat täysin Swiftin puolelle.

## Historiallinen tausta

Swiftin ja SwiftUI:n suhteen ymmärtämiseksi on myös hyödyllistä tuntea Applen kehitysteknologioiden historiallinen kehityskaari. Vuoteen 2026 mennessä tämä teknologiapino on käynyt läpi useita iteraatioita.

### Swiftin historia

Ennen Swiftin ilmestymistä Objective-C oli Applen alustojen tärkein ohjelmointikieli, ja sitä voitiin käyttää yhdessä C-kielen kanssa. Sen syntaksi oli melko pitkä ja aloittelijoille kynnys korkea:

```Obj-c
// Objective-C:n kirjoitustapa
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Vuonna 2014 Apple julkaisi Swift-kielen WWDC:ssä. Swiftin syntaksi oli modernimpi ja tyyppiturvallisuus parempi, ja vähitellen se korvasi Objective-C:n pääasiallisena kehityskielenä:

```swift
// Swiftin kirjoitustapa
let name = "Fang"
print("Hello, \(name)")
```

Objective-C ei kuitenkaan kadonnut kokonaan. Sitä käytetään edelleen laajasti monissa vanhoissa projekteissa ja alitason kehyksissä. Sen perussyntaksin tunteminen on edelleen hyödyllistä vanhojen projektien ylläpidossa ja järjestelmän sisäisten rakenteiden ymmärtämisessä.

### SwiftUI:n historia

Ennen SwiftUI:ta iOS käytti **UIKit**-kehystä ja macOS **AppKit**-kehystä. Nämä kehykset perustuivat “imperatiiviseen” ohjelmointiin. Kehittäjän täytyi käyttää Storyboardia tai kirjoittaa paljon käsinkoodattua logiikkaa näkymän tilan hallintaan, mikä johti runsaaseen koodimäärään ja suureen ylläpitokustannukseen, erityisesti monimutkaisessa käyttöliittymälogiikassa.

![storyboard](../../RESOURCE/010_xcode.png)

Vuonna 2019 Apple julkaisi SwiftUI:n virallisesti WWDC:ssä. SwiftUI toi mukanaan “deklaratiivisen” ohjelmointitavan, joka yksinkertaisti käyttöliittymäkehitystä huomattavasti.

![storyboard](../../RESOURCE/010_xcode1.png)

On tärkeää huomata, että SwiftUI ei ole täysin itsenäinen alitason toteutus. Eri alustoilla se toimii pohjimmiltaan yhteistyössä UIKitin (iOS) tai AppKitin (macOS) kanssa, ja sen toiminta riippuu edelleen näistä kehyksistä.

### Swiftin ja UIKitin/AppKitin suhde

Vaikka Swift on yleiskäyttöinen ohjelmointikieli, joka toimii eri Apple-alustoilla, se ei voi täysin korvata UIKitia tai AppKitia. Joissain monimutkaisissa käyttöliittymätarpeissa tai tilanteissa, joissa SwiftUI ei vielä kata tarvittavaa toiminnallisuutta, täytyy edelleen käyttää UIKitia tai AppKitia.

Esimerkiksi UIKit on erittäin kypsä monimutkaisten view controller -rakenteiden hallinnassa, animaatioissa ja eleiden tunnistuksessa, ja sen toiminta on vahvistettu laajassa tuotantokäytössä. SwiftUI kehittyy näissä asioissa jatkuvasti, mutta tietyissä reunatapauksissa sillä on edelleen rajoituksia.

Siksi monet kehittäjät käyttävät projekteissaan rinnakkain SwiftUI:ta ja UIKitia (tai AppKitia), jotta kummankin vahvuudet saadaan käyttöön.

Tästä näkökulmasta SwiftUI:n voi ajatella olevan UIKitin / AppKitin korkeamman tason abstrahointi. SwiftUI:ta opetellessa UIKitin ja AppKitin peruskäsitteisiin tutustuminen auttaa tekemään järkevämpiä teknisiä päätöksiä vanhoja projekteja ylläpidettäessä tai monimutkaisempia toimintoja toteutettaessa.

## Yhteenveto

**Swift**: käytetään pääasiassa logiikan, datankäsittelyn, ohjausvirran ja muun käyttöliittymäasettelusta riippumattoman koodin kirjoittamiseen.

**SwiftUI**: käytetään käyttöliittymän deklaratiiviseen rakentamiseen; näkymien sisältö ja asettelukoodi kuuluvat SwiftUI:n puolelle.

Käytännön kehityksessä Swiftiä ja SwiftUI:ta käytetään yleensä yhdessä: Swift huolehtii logiikasta ja SwiftUI käyttöliittymästä.

Objective-C:stä ja UIKitista Swiftiin ja SwiftUI:hin siirtyminen on vienyt Applen kehitysympäristöä kohti modernimpaa ja yksinkertaisempaa ohjelmointitapaa, mutta UIKitia ja AppKitia ei silti voi sivuuttaa monissa perinteisissä projekteissa.

Kun ymmärrämme Swiftin ja SwiftUI:n suhteen, pystymme kehittämään iOS- ja macOS-sovelluksia tehokkaammin ja tekemään järkevämpiä teknisiä ratkaisuja myös vanhoja projekteja ylläpidettäessä.
