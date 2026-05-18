# Mukautetut värit

Tässä oppitunnissa opimme, kuinka SwiftUI:ssa määritetään mukautettuja värejä.

Aiemmilla oppitunneilla olemme jo käyttäneet SwiftUI:n tarjoamia oletusvärejä, esimerkiksi:

```swift
Color.blue
Color.red
Color.green
```

Näitä värejä on helppo käyttää, mutta todellisessa App-kehityksessä oletusvärit eivät yleensä ole riittävän tarkkoja.

Esimerkiksi suunnittelukuvassa saatetaan käyttää tällaisia värejä:

```text
#2c54c2
#4875ed
#213e8d
```

Tällaista väriä kutsutaan Hex-väriksi.

Tässä oppitunnissa teemme ensin niin, että SwiftUI tukee Hex-värejä, ja sitten järjestämme usein käytetyt värit `static`-ominaisuuksien avulla.

Lopuksi käytämme mukautettuja värejä eläintietosanakirjan näkymässä ja käytämme lisäksi liukuväristä taustaa, jotta painikkeet näyttävät kerroksellisemmilta.

## Miksi mukautettuja värejä tarvitaan?

SwiftUI:ssa voimme käyttää järjestelmävärejä suoraan.

Esimerkiksi:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Tässä `.blue` tarkoittaa sinistä. Se on itse asiassa lyhennetty kirjoitusasu muodosta `Color.blue`.

Oletusvärien etuna on yksinkertaisuus ja helppokäyttöisyys, mutta värivalikoima on melko rajallinen.

Esimerkiksi:

```swift
Color.blue
```

voi tarkoittaa vain SwiftUI:n tarjoamaa oletussinistä.

![Color.blue](../../../Resource/031_color6.png)

Todellisessa kehityksessä tarvitsemme kuitenkin usein tarkempia värejä.

Esimerkiksi sama sininen voi tarkoittaa vaaleansinistä, tummansinistä, harmaansinistä, kirkasta sinistä ja monia muita vaikutelmia.

![More Blue](../../../Resource/031_color5.png)

Tällöin, jos käytämme vain `Color.blue`-väriä, suunnittelun vaikutelmaa on vaikea palauttaa tarkasti.

Siksi meidän täytyy lisätä SwiftUI:hin tuki mukautetuille väreille.

## Mikä on Hex-väri?

Näytöllä näkyvät värit muodostuvat yleensä kolmesta kanavasta: punaisesta, vihreästä ja sinisestä, eli RGB:stä.

RGB tarkoittaa seuraavia:

```text
Red     // Punainen
Green   // Vihreä
Blue    // Sininen
```

Hex-väri on yksi tapa esittää RGB-väri.

Esimerkiksi:

```swift
#5479FF
```

Tämän väriarvon voi yksinkertaisesti ymmärtää kolmena osana:

```text
54  // Tarkoittaa punaista kanavaa
79  // Tarkoittaa vihreää kanavaa
FF  // Tarkoittaa sinistä kanavaa
```

Tässä oppitunnissa meidän ei tarvitse laskea näitä arvoja eikä ymmärtää heksadesimaalijärjestelmän sääntöjä syvällisesti.

Nyt riittää, että tiedämme: `#5479FF` tarkoittaa tiettyä väriä.

Kun myöhemmin näemme kirjoitusasuja kuten `#2c54c2` ja `#4875ed`, voimme ensin ymmärtää ne eräänlaisiksi väriarvoiksi.

Myös suunnittelutyökaluissa, kuten Sketchissä, Figmassa ja Photoshopissa, näkee usein vastaavia väriarvoja.

![color](../../../Resource/031_color.png)

SwiftUI ei kuitenkaan oletuksena salli tällaista suoraa kirjoitustapaa:

```swift
Color(hex: "#5479FF")
```

Siksi meidän täytyy laajentaa `Color`-tyyppiä itse, jotta se tukee värin luomista Hex-merkkijonon avulla.

## Color+Hex.swift-tiedoston luominen

Ensin luomme uuden Swift-tiedoston.

Tiedoston nimeksi voi kirjoittaa:

```text
Color.swift
```

Tai selkeämmin:

```text
Color+Hex.swift
```

Tässä suositellaan enemmän nimeä:

```text
Color+Hex.swift
```

Swift-projektissa tiedostonimet kuten `Color+Hex.swift` ovat hyvin yleisiä.

Se tarkoittaa, että tämä tiedosto on laajennustiedosto, joka lisää `Color`-tyypille Hex-toiminnallisuuden.

Tiedostonimi ei vaikuta suoraan koodin suorittamiseen. Sen tarkoitus on vain auttaa meitä ymmärtämään tiedoston käyttötarkoitus helpommin.

## Color(hex:) -koodin lisääminen

Kirjoita `Color+Hex.swift`-tiedostoon seuraava koodi:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Tämä koodi käyttää `extension`-rakennetta `Color`-tyypin laajentamiseen ja lisää `Color`-tyypille uuden alustajan:

```swift
init(hex: String)
```

Kun meillä on tämä alustaja, voimme välittää Hex-merkkijonon `Color`-tyypille ja luoda näin mukautetun värin:

```swift
Color(hex: "#5479FF")
```

Tämän laajennuskoodin sisällä Hex-merkkijono muunnetaan RGB-väriksi, jonka SwiftUI tunnistaa.

Tässä vaiheessa jokaista muunnoslogiikan riviä ei tarvitse ymmärtää syvällisesti. Riittää, että tiedämme lisätyn `Color(hex:)`-metodin antavan meille mahdollisuuden luoda mukautettuja värejä Hex-väriarvojen avulla.

## Mukautetun värin käyttäminen

Nyt voimme testata mukautettua väriä `ContentView`-näkymässä.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Näyttötulos:

![color](../../../Resource/031_color1.png)

Tässä esimerkissä ensimmäinen rivi käyttää järjestelmäväriä:

```swift
.foregroundStyle(Color.blue)
```

Seuraavat kolme riviä käyttävät mukautettuja Hex-värejä:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Vertailun kautta huomaamme, että järjestelmän sinisellä on vain yksi oletusvaikutelma.

Hex-väreillä voidaan sen sijaan esittää tarkempia sinisen sävyeroja.

Tämä on mukautettujen värien arvo: niiden avulla käyttöliittymän värit voivat olla lähempänä todellista suunnittelua, ja Appin visuaalista tyyliä on helpompi hallita.

## Värien järjestäminen static-ominaisuuksilla

Nyt voimme jo luoda värejä Hex-merkkijonojen avulla:

```swift
Color(hex: "#2c54c2")
```

Tämä kirjoitustapa toimii normaalisti, mutta jos sama väri esiintyy toistuvasti monessa paikassa, myöhempi ylläpito ei ole kovin kätevää.

Jos tämä väriarvo kirjoitetaan 10 eri paikkaan ja haluamme myöhemmin muuttaa tätä sinistä, muutokset täytyy tehdä yksi kerrallaan.

Tässä tilanteessa voimme käyttää `static`-ominaisuuksia ja järjestää usein käytetyt värit yhteen paikkaan.

Lisää `Color+Hex.swift`-tiedoston loppuun seuraava koodi:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tässä lisäämme `Color`-tyypille kolme staattista ominaisuutta: `animalBlue`, `animalLightBlue` ja `animalDarkBlue`. Ne tarkoittavat eri tummuusasteisia sinisiä.

Koska nämä ominaisuudet käyttävät `static`-avainsanaa, ne kuuluvat itse `Color`-tyypille.

Käytettäessä niihin pääsee suoraan `Color.`-muodon kautta:

```swift
Color.animalBlue
```

Tämä kirjoitustapa on selkeämpi kuin Hex-merkkijonon kirjoittaminen suoraan.

Kun näemme `Color.animalBlue`, tiedämme, että se tarkoittaa eläintietosanakirjassa käytettävää sinistä.

Kun taas näemme `Color(hex: "#2c54c2")`, tiedämme vain, että kyseessä on väriarvo, mutta sen käyttötarkoitusta ei ole helppo päätellä.

Värien yhtenäisellä hallinnalla on myös toinen etu: myöhemmät muutokset ovat helpompia.

Jos haluamme säätää eläintietosanakirjan pääväriä, meidän tarvitsee muuttaa vain määrittelykohtaa:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Kaikki tätä väriä käyttävät kohdat päivittyvät samalla kertaa.

Tämä on `static`-ominaisuuksilla järjestettyjen värien merkitys: värien nimet ovat selkeämpiä ja myöhempi ylläpito on helpompaa.

## Soveltaminen eläintietosanakirjaan

Nyt voimme käyttää mukautettuja värejä aiemmassa eläintietosanakirjan näkymässä.

Aiemmin eläinpainikkeen tausta oli valkoinen:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nyt voimme muuttaa sen mukautetuksi väriksi:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Tässä `Color.animalBlue` on staattinen väri, jonka juuri määrittelimme `Color+Hex.swift`-tiedostossa.

Painikkeen teksti käyttää valkoista:

```swift
.foregroundStyle(Color.white)
```

Eläin-emojin tausta käyttää puoliksi läpinäkyvää valkoista:

```swift
.background(Color.white.opacity(0.15))
```

Näin painikkeeseen muodostuu yhtenäinen sininen visuaalinen tyyli.

Tämän vaiheen painopiste ei ole monimutkaisen koodin lisäämisessä, vaan siinä, että edellä opitut mukautetut värit otetaan todella käyttöön käyttöliittymässä.

## Liukuväritaustan käyttäminen

Yksittäisen värin lisäksi voimme yhdistää useita värejä liukuväritehosteeksi.

Esimerkiksi aiemmin määrittelimme nämä värit:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Näitä värejä voi käyttää erikseen, mutta ne voidaan myös yhdistää liukuväritaustaksi.

SwiftUI:ssa lineaarisen liukuvärin voi luoda `LinearGradient`-rakenteella.

Esimerkiksi:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Tämä koodi luo vasemmalta oikealle kulkevan liukuväritaustan, jossa väri siirtyy vähitellen `Color.animalBlue`-väristä `Color.animalLightBlue`-väriin.

Siinä `colors` asettaa liukuväriin osallistuvat värit, ja `startPoint` sekä `endPoint` ohjaavat liukuvärin suuntaa.

### Liukuväritehosteen testaaminen

Voimme testata liukuväritaustaa yksinkertaisella Text-näkymällä.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Näyttötulos:

![color](../../../Resource/031_color3.png)

Tässä esimerkissä `Text`-näkymän tausta ei ole enää yksivärinen, vaan vasemmalta oikealle vähitellen muuttuva liukuväri.

Tavalliseen taustaväriin verrattuna liukuväritausta tuo enemmän kerroksellisuutta ja auttaa myös luomaan käyttöliittymään visuaalisen painopisteen.

## Liukuväritaustan käyttäminen eläintietosanakirjassa

Nyt voimme muuttaa eläinpainikkeen taustavärin:

```swift
.background(Color.animalBlue)
```

liukuväritaustaksi:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Koko koodi on seuraava:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Näyttötulos:

![color](../../../Resource/031_color4.png)

Nyt eläinpainike ei ole enää vain yksivärinen tausta, vaan siinä on vasemmalta oikealle kulkeva liukuväritehoste.

Yksiväriseen taustaan verrattuna liukuväritausta voi tehdä käyttöliittymästä kerroksellisemman ja lähempänä todellisten Appien visuaalista suunnittelua.

## Yksivärisen taustan ja liukuväritaustan ero

Yksivärinen tausta käyttää vain yhtä väriä.

Esimerkiksi:

```swift
.background(Color.animalBlue)
```

Tämä kirjoitustapa on yksinkertainen ja selkeä, ja se sopii useimpiin peruskäyttöliittymiin.

Liukuväritausta käyttää useita värejä.

Esimerkiksi:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Tämä kirjoitustapa voi tehdä käyttöliittymästä kerroksellisemman, mutta se voi myös helposti lisätä visuaalista monimutkaisuutta.

Siksi todellisessa kehityksessä asian voi ymmärtää näin:

Yksivärinen tausta sopii tavalliseen tekstiin, tavallisiin painikkeisiin, tavallisiin kortteihin ja tavalliseen sivun taustaan.

Liukuväritausta sopii korostettuihin painikkeisiin, yläalueisiin, kansikortteihin, toiminnallisiin sisäänkäynteihin ja muihin kohtiin, joita täytyy korostaa.

## Yhteenveto

Tässä oppitunnissa opimme, kuinka SwiftUI:ssa käytetään mukautettuja värejä.

Ensin tutustuimme Hex-väreihin.

Esimerkiksi:

```text
#2c54c2
```

Se tarkoittaa tiettyä väriä.

Sen jälkeen käytimme `extension Color`-rakennetta `Color`-tyypin laajentamiseen.

Näin SwiftUI voi luoda värejä seuraavalla tavalla:

```swift
Color(hex: "#2c54c2")
```

Seuraavaksi käytimme `static`-ominaisuuksia usein käytettyjen värien järjestämiseen:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Tämän jälkeen muissa näkymissä voi käyttää suoraan:

```swift
Color.animalBlue
```

Verrattuna siihen, että Hex-merkkijono kirjoitetaan joka kerta uudelleen, tämä tapa on selkeämpi ja helpottaa myös värien yhtenäistä muuttamista myöhemmin.

Lopuksi opimme `LinearGradient`-rakenteen ja yhdistimme mukautetut värit liukuväritaustaksi:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Tämän oppitunnin kautta saimme valmiiksi prosessin “mukautettujen värien luomisesta” siihen, “kuinka värejä käytetään todellisessa käyttöliittymässä”.

Kun jokin väri myöhemmin täytyy käyttää toistuvasti monessa paikassa, kannattaa ensisijaisesti harkita sen järjestämistä `Color`-laajennukseen.

Näin koodi on selkeämpää ja käyttöliittymän tyyli on helpompi pitää yhtenäisenä.
