# Tyyppijärjestelmä

Edellisissä luvuissa olemme jo oppineet muuttujista ja nähneet, että muuttujat voivat tallentaa erilaista dataa.

Esimerkiksi:

```swift
var hello = "Hello, World"
```

Tässä `hello` tallentaa tekstin, joten sen tyyppi on `String`.

Seuraavaksi opimme järjestelmällisesti, mitä tyyppi (`Type`) tarkoittaa sekä mitä ovat eksplisiittinen tyyppimäärittely ja tyyppipäättely, jotta ymmärrämme muuttujien olemusta syvemmin.

## Mitä tyyppi tarkoittaa

Swiftissä jokaisella arvolla on selkeä tyyppi. Tyyppi määrittää, mitä tämä arvo on ja mitä sillä voidaan tehdä.

Esimerkiksi:

- `42` on `Int` (kokonaisluku)
- `"Hello"` on `String` (merkkijono)
- `true` on `Bool` (totuusarvo)

Ne kuuluvat eri tyyppeihin, ja myös niiden käyttötarkoitus on erilainen.

## Swiftin yleiset perustyypit

Alkuvaiheen opiskelussa yleisimmät tyypit ovat seuraavat:

- `String`: merkkijono (teksti)
- `Int`: kokonaisluku
- `Double`: liukuluku (sisältää desimaaleja, tarkempi)
- `Bool`: totuusarvo (`true`/`false`)

Lisäksi on olemassa `Float` (liukuluku), mutta sen tarkkuus on heikompi kuin `Double`-tyypillä, joten sitä käytetään yleensä harvemmin. On myös `Character` (yksi merkki), esimerkiksi `"A"` tai `"!"`.

### Tyypin määrittely (eksplisiittinen tyyppi)

Swiftissä tyyppi voidaan määrittää käsin muuttujan luonnin yhteydessä:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Muuttujan tyyppi ilmoitetaan lisäämällä muuttujan nimen perään `: Tyyppi`.

Taulukon tyyppi kirjoitetaan muotoon `: [Tyyppi]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Tässä koodissa `scores` voi sisältää vain `Int`-tyyppisiä alkioita ja `tags` vain `String`-tyyppisiä alkioita.

Eksplisiittinen tyyppimäärittely tekee koodin tarkoituksesta selvempää ja voi joissain tilanteissa estää väärän tyyppipäättelyn.

## Tyyppipäättely

Monissa tilanteissa tyyppiä ei tarvitse määritellä erikseen:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Tämä johtuu siitä, että Swiftin kääntäjä pystyy päättelemään tyypin automaattisesti "alkuarvon" perusteella.

## Eksplisiittinen määrittely ja tyyppipäättely

Aiemmissa luvuissa emme ottaneet käyttöön eksplisiittistä tyyppimäärittelyä, kuten:

```swift
var age: Int = 18
```

Vaan käytimme ensisijaisesti tyyppipäättelyä:

```swift
var age = 18
```

Tässä esimerkissä nämä kaksi kirjoitustapaa ovat samanarvoisia: `age` määrittyy molemmissa tapauksissa `Int`-tyypiksi. Tyyppipäättelyn kirjoitustapa on kuitenkin lyhyempi.

Syy siihen, miksi eksplisiittistä määrittelyä ei korostettu alussa, on se, että tyyppipäättely vähentää koodin ylimääräistä tietoa ja madaltaa aloittelijoiden ymmärtämiskynnystä.

## Miksi tyyppiä tarvitaan

Swift on vahvasti tyypitetty kieli (`Strongly Typed Language`).

Tämä tarkoittaa sitä, että kun muuttujan tyyppi on kerran määräytynyt, sitä ei voi vaihtaa mielivaltaisesti.

Esimerkiksi:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Ensimmäinen `20` on `Int`-tyyppiä, joten se voidaan antaa `age`:lle. Toinen `"20"` on `String`, eikä se vastaa `Int`-tyyppiä, joten kääntäjä antaa virheen.

`nums` on `[Int]`-taulukko, joten siihen voidaan tallentaa vain kokonaislukuja, ei merkkijonoja.

Tyyppi rajoittaa datan käyttöä ja auttaa löytämään tyyppivirheitä jo käännösvaiheessa. Näin voidaan vähentää tyyppisekaannuksesta johtuvia bugeja sekä parantaa koodin vakautta ja ylläpidettävyyttä.

## Milloin tyyppi täytyy määritellä eksplisiittisesti

Vaikka Swift osaa päätellä tyypin automaattisesti, joissakin tilanteissa kääntäjä ei pysty päättelemään sitä tai päättelee sen väärin. Tällöin tyyppi täytyy määritellä käsin.

**1. Tyhjä taulukko**

Tyhjää taulukkoa luotaessa tyyppi täytyy aina määritellä eksplisiittisesti:

```swift
var nums: [Int] = []
```

Jos tyyppiä ei kirjoiteta:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Kääntäjä ei pysty päättelemään tyhjän taulukon alkiotyyppiä, joten syntyy käännösvirhe.

**2. Väärän päättelyn välttäminen**

```swift
var value = 10   // Int
```

Tässä esimerkissä `10` voisi myös tarkoittaa liukulukua (`Double`), mutta koska siinä ei ole desimaalipistettä, kääntäjä päättelee sen oletuksena `Int`-tyypiksi.

Jos haluat, että `value` on liukuluku, tyyppi täytyy määritellä eksplisiittisesti:

```swift
var value: Double = 10   // Double
```

Kun tyyppipäättelyn tulos ei vastaa odotusta, oikea tyyppi kannattaa varmistaa eksplisiittisellä määrittelyllä tai muuttamalla kirjainarvon muotoa.

**3. Mukautetut tyypit**

Myöhemmin opimme myös itse määriteltyjä tyyppejä. Niitä käytettäessä tarvitaan usein eksplisiittinen tyyppimäärittely:

```swift
var info: GameInfo
var users: [User] = []
```

Syy on sama kuin tyhjän taulukon kohdalla: kääntäjä ei pysty päättelemään tyyppiä tyhjästä arvosta.

## Tyyppimuunnos

Swiftissä eri tyyppien välillä ei tehdä automaattista muunnosta, vaan muunnos täytyy tehdä käsin.

Esimerkiksi kahden erilaista tyyppiä olevan luvun yhteenlasku:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Tässä `a` on `Int` ja `b` on `Double`. Koska tyypit ovat eri, niitä ei voi laskea suoraan yhteen.

Ennen laskutoimitusta toinen arvo täytyy muuntaa samaan tyyppiin:

```swift
var result = Double(a) + b
```

Tämä tarkoittaa, että `Int`-tyyppinen `a` muunnetaan ensin `Double`-tyyppiseksi ja vasta sitten lasketaan yhteen `b`:n kanssa. Lopputulos tallennetaan `result`-muuttujaan.

On tärkeää huomata, että tyyppimuunnos ei muuta alkuperäisen muuttujan tyyppiä. Esimerkiksi `Double(a)` ei muuta `a`:ta `Double`-tyyppiseksi, vaan luo uuden `Double`-arvon laskua varten.

Myös muita tyyppejä voidaan muuntaa samalla periaatteella: käytetään kohdetyyppiä ja sulkeita, joiden sisään annetaan muunnettava arvo.

```
Int()、Double()、String()
```

Esimerkki:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

On hyvä huomata, että kaikki muunnokset eivät säilytä arvoa sellaisenaan. Esimerkiksi `Double` → `Int` katkaisee desimaaliosan suoraan eikä pyöristä.

## Tyyppialias

Swiftissä olemassa olevalle tyypille voidaan antaa myös aliasnimi, jolloin koodin merkitys voi olla selkeämpi:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Tässä `UserID` on pohjimmiltaan yhä `Int`, eli itse tyyppi ei muutu, vain nimi on kuvaavampi.

Suurissa ja monimutkaisissa projekteissa tyyppialiasit voivat parantaa koodin luettavuutta huomattavasti.

## Tyyppiesimerkki

Käydään seuraavaksi läpi yksinkertainen esimerkki siitä, miten tyypit näkyvät käytännön kehityksessä.

### Muuttujan luominen

Ensin luomme `age`-muuttujan:

```swift
var age = 20
```

Koska tätä muuttujaa täytyy näyttää ja muuttaa SwiftUI:ssa, meidän pitää määritellä se `@State`-muuttujana:

```swift
@State private var age = 20
```

`private` mainittiin aiemmin. Se tarkoittaa, että muuttujaa voidaan käyttää vain nykyisessä näkymässä. Palaamme siihen myöhemmin tarkemmin.

### Datan näyttäminen SwiftUI:ssa

`age`-muuttujan näyttäminen SwiftUI:ssa:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Nyt näkymässä näkyy:

```swift
age: 20
```

### Datan muuttaminen

Seuraavaksi lisäämme kaksi painiketta `age`-arvon muuttamista varten:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Ajotulos

Kun `changeAge1`-painiketta painetaan, `age` saa arvon `18`:

```swift
age = 18
```

Koska `18` on `Int`-tyyppiä ja samaa tyyppiä kuin `age`, sijoitus onnistuu.

`changeAge2` aiheuttaa virheen:

```swift
age = "18"
```

Virheilmoitus:

```
Cannot assign value of type 'String' to type 'Int'
```

Syy on se, että `"18"` on `String`-tyyppiä (merkkijono kirjoitetaan lainausmerkkien sisään), mutta `age` on `Int`, joten tyypit eivät täsmää.

### Miksi virhe syntyy?

Avain on tässä rivissä:

```swift
@State private var age = 20   // Int
```

Vaikka tyyppiä ei ole kirjoitettu erikseen, alkuarvo `20` on `Int`, joten kääntäjä päättelee `age`:n automaattisesti `Int`-tyyppiseksi.

Kun tyyppi on kerran määräytynyt, muuttujaan ei voi enää sijoittaa toisen tyyppistä arvoa.

Lisäksi `changeAge2` ei epäonnistu "ajon aikana", vaan virhe syntyy jo käännösvaiheessa, jolloin koodi ei käänny lainkaan.

Tämä on yksi Swiftin vahvan tyypityksen eduista: tyyppiongelmat havaitaan jo koodia kirjoitettaessa.

### Oikea kirjoitustapa

Kun virheellinen koodi poistetaan:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Kun `changeAge1`-painiketta painetaan, näkymä päivittyy muotoon:

```
age: 18
```

### Eksplisiittinen tyyppimäärittely (valinnainen)

Tyypin voi määrittää myös selvästi jo alussa:

```swift
@State private var age: Int = 20
```

Tämä kirjoitustapa tekee tyypistä näkyvämmän, mutta yksinkertaisissa tapauksissa se ei ole pakollinen.

## Yhteenveto

Tässä luvussa käsittelimme Swiftin tyyppijärjestelmää ja sen merkitystä käytännön kehityksessä.

Swiftissä jokaisella arvolla on selkeä tyyppi, ja tyyppi määrittää datan merkityksen sekä sen, mitä toimintoja sillä voidaan tehdä.

Swift on vahvasti tyypitetty, joten kun muuttujan tyyppi on kerran määräytynyt, siihen ei voi enää sijoittaa toisen tyyppistä arvoa. Tämä rajoitus auttaa löytämään virheitä jo käännösvaiheessa, vähentää ajonaikaisia ongelmia ja parantaa koodin turvallisuutta.

Muuttujan tyyppi voidaan päätellä automaattisesti alkuarvosta tai määritellä eksplisiittisesti. Joissakin tilanteissa, kuten tyhjän taulukon, väärän tyyppipäättelyn tai mukautettujen tyyppien kohdalla, eksplisiittinen määrittely on välttämätön.

Eri tyyppien välillä ei tehdä automaattista muunnosta, vaan käytetään esimerkiksi `Int()`, `Double()` ja `String()` -funktioita.

Tyypeille voidaan myös luoda aliasnimiä, mikä voi parantaa luettavuutta erityisesti laajoissa projekteissa.

Tyyppi ei ole vain datan merkintä, vaan myös rajoitusmekanismi, joka auttaa pitämään datan käytön turvallisena, selkeänä ja hallittavana.

## Lisätieto - Valinnaiset tyypit

Tyyppimuunnoksissa jotkin operaatiot voivat epäonnistua.

Esimerkiksi merkkijonon muuntaminen `Double`-tyypiksi:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Tässä `Double(input)` ei palauta `Double`-arvoa vaan:

```
Double?
```

Tätä kutsutaan valinnaiseksi tyypiksi (`Optional`).

### Miksi palautetaan valinnainen tyyppi?

Koska merkkijonon sisältö ei ole varma. `"3.14"` voidaan muuntaa `Double`-arvoksi, mutta `"Hello"`-tekstiä ei voida.

Toisin sanoen operaatio voi onnistua tai epäonnistua.

Siksi Swift käyttää valinnaista tyyppiä kuvaamaan tällaista epävarmuutta.

### Mikä on valinnainen tyyppi?

Valinnainen tyyppi tarkoittaa sitä, että arvo voi olla olemassa tai puuttua.

Esimerkiksi:

```
Double?
```

Tämä tyyppi tarkoittaa, että jos arvo on olemassa, tulostuksessa näkyy `Optional(...)`. Jos arvoa ei ole, tulos on `nil`.

On hyvä huomata, että `nil` tarkoittaa "ei arvoa", ei `0`:aa eikä tyhjää merkkijonoa.

### Esimerkki

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Tulostus:

```
pi:Optional(3.14)
```

Tämä tarkoittaa, että merkkijono muunnettiin onnistuneesti `Double`-arvoksi ja tuloksena saatiin `3.14`, mutta koska tyyppi on `Double?`, arvo on kääritty `Optional`-rakenteeseen.

Jos muunnos epäonnistuu:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Tulostus:

```
pi: nil
```

Koska `"Hello"`-tekstiä ei voi muuntaa `Double`-tyyppiseksi, muunnos epäonnistuu ja palauttaa `nil`.

### Mitä `Optional(...)` tarkoittaa?

Kun tulostamme valinnaisen tyypin suoraan:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift näyttää sen "debug-kuvauksen":

```
Optional(3.14)
```

Tämä ei ole osa varsinaista dataa, vaan kertoo, että nykyinen arvo on valinnainen tyyppi ja että sen sisällä on arvo.

### Valinnaisen purkaminen

Käytännön kehityksessä meidän täytyy usein ottaa valinnaisen tyypin sisältä todellinen arvo käyttöön. Tätä kutsutaan purkamiseksi (`Unwrapping`).

Yksi yleinen tapa on käyttää `??`-operaattoria oletusarvon antamiseen:

```
??
```

Tätä kutsutaan nimellä tyhjän arvon yhdistämisoperaattori (`Nil-Coalescing Operator`).

Esimerkiksi:

```swift
name ?? "FangJunyu"
```

Tämä tarkoittaa, että jos `name` sisältää arvon, palautetaan se. Jos arvo on `nil`, käytetään oletusarvoa `"FangJunyu"`.

On hyvä huomata, että oletusarvon tyypin täytyy olla sama kuin valinnaisen tyypin sisältämän arvon tyyppi.

### Oletusarvon tarjoaminen `??`-operaattorilla

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Tulostus:

```
pi: 30
```

Kun `input` muunnetaan `Double`-tyyppiseksi, muunnos onnistuu ja tulostuu oikea arvo. Jos muunnos epäonnistuisi, käytettäisiin `??`-operaattorin tarjoamaa oletusarvoa.

Jos muunnos epäonnistuu:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Tulostus:

```
pi: 10
```

Tässä `input` muunnetaan `Double`-tyyppiseksi, mutta muunnos epäonnistuu ja palauttaa `nil`. Tällöin `??` antaa tilalle oletusarvon.

Valinnainen tyyppi kuvaa tilannetta, jossa arvo voi olla olemassa tai puuttua.

Mahdollisesti epäonnistuvissa operaatioissa, kuten tyyppimuunnoksissa, Swift palauttaa valinnaisen tyypin ohjelman turvallisuuden varmistamiseksi.

Kun meidän täytyy käyttää sen sisältämää arvoa, voimme antaa oletusarvon `??`-operaattorilla, jolloin saamme järkevän tuloksen myös silloin, kun arvo on `nil`.
