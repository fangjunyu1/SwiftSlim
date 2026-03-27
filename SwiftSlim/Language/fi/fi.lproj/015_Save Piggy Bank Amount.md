# Säästöpossun summan tallentaminen

Edellisessä luvussa toteutimme yksinkertaisen "säästöpossun". Tässä luvussa opimme, miten säästöpossun summa voidaan tallentaa pysyvästi.

Tässä luvussa opiskelemme pääasiassa `UserDefaults`-tallennusta ja `@AppStorage`-ominaisuuskäärettä. Samalla laajennamme aihetta käsittelemällä `onAppear`-toimintoa sekä valinnaisen tyypin (`nil`) käyttöä.

On tärkeää huomata, että tämä luku jatkaa edellisessä luvussa kirjoitetun säästöpossu-koodin pohjalta.

## Pysyvän tallennuksen ongelma

Nyt säästöpossun käyttöliittymä on hyvin yksinkertainen ja kätevä käyttää.

![Piggy Bank](../../Resource/014_view.png)

Silti siinä on selvä ongelma: aina kun näkymä päivittyy tai sovellus suljetaan, säästöpossun kokonaissumma palautuu arvoon `0`, ja aiemmin säästetty summa katoaa kokonaan.

Tämä tarkoittaa, että dataa ei oikeasti tallenneta. Toisin sanoen nykyinen säästöpossu pystyy säilyttämään vain väliaikaista dataa.

### Miksi pysyvää tallennusta ei synny?

Tämä johtuu siitä, että käytämme `@State`-muuttujaa:

```swift
@State private var amount = 0
```

`@State`-muuttujan elinkaari riippuu täysin näkymästä.

Kun näkymä luodaan, `amount` alustetaan arvolla `0`. Kun näkymä tuhotaan, myös `amount` häviää.

Tässä `amount`-arvo on olemassa vain muistissa, eikä sitä tallenneta laitteelle.

Koska emme halua, että `amount` on sidottu näkymän elinkaareen, meidän täytyy toteuttaa pysyvä tallennus eli tallentaa data laitteelle.

### Mitä "datan pysyvä tallennus" tarkoittaa

Datan pysyvän tallennuksen voi ymmärtää niin, että data siirretään "väliaikaisesta muistista" "laitteen tallennustilaan".

Kun näkymä suljetaan tai sovellus sammutetaan, data ei katoa.

Swift-kehityksessä yksinkertainen pysyvä tallennus voidaan toteuttaa `UserDefaults`-ratkaisulla. Monimutkaisempaan dataan käytetään esimerkiksi `SwiftDataa` tai `CoreDataa`.

Tässä luvussa opimme ensin kaikkein yksinkertaisimman vaihtoehdon eli `UserDefaults`in.

## `UserDefaults`

`UserDefaults`-ratkaisua käytetään kevyen avain-arvo-datan tallentamiseen. Sitä käytetään usein `String`-, `Int`-, `Double`- ja `Bool`-tyyppisten perustietojen säilyttämiseen.

### Datan tallentaminen

`UserDefaults` tallentaa dataa `set`-metodilla:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

`UserDefaults`in ensimmäinen parametri on tallennettava data, joka tässä voi olla esimerkiksi `String` tai `Int`.

Toinen parametri `forKey` toimii eräänlaisena muuttujan nimenä ja yksilöi tallennetun arvon.

### Datan lukeminen

`UserDefaults`-arvot luetaan vastaavilla metodeilla:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Lukiessa täytyy käyttää oikeaa tyyppiä vastaavaa metodia, muuten tulos voi olla väärä tai epäonnistua.

### Huomioita `UserDefaults`ista

#### 1. Palauttaa valinnaisen tyypin

Kun `UserDefaults`ista luetaan dataa, osa metodeista palauttaa valinnaisen tyypin (`Optional`).

Esimerkiksi:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Palautuvan `name`-arvon tyyppi on:

```swift
String?
```

Tämä tarkoittaa, että arvo voi olla olemassa tai puuttua.

**Miksi se palauttaa valinnaisen tyypin?**

Koska tietylle `Key`-avaimelle ei välttämättä ole vielä tallennettu mitään arvoa.

Esimerkiksi:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Jos `"City"`-avaimelle ei ole koskaan tallennettu dataa, lukutulos on:

```swift
nil
```

On tärkeää korostaa, että `nil` tarkoittaa "ei dataa", ei tyhjää merkkijonoa.

"Tyyppijärjestelmä"-luvussa näimme saman ilmiön myös tyyppimuunnoksissa: kun muunnos voi epäonnistua, palautetaan valinnainen tyyppi.

Silloin meidän täytyy käyttää `??`-operaattoria oletusarvon tarjoamiseen ja valinnaisen purkamiseen:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Jos `UserDefaults`ista saadaan arvo, käytetään sitä. Jos arvoa ei löydy (`nil`), käytetään oletusarvoa.

#### 2. Palauttaa ei-valinnaisen tyypin

Kun `UserDefaults`ista luetaan `Int`-, `Double`- tai `Bool`-arvoja, palautuva tyyppi ei ole valinnainen.

Esimerkiksi:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Vaikka näille avaimille ei olisi koskaan tallennettu arvoa, tulos ei ole `nil`.

Sen sijaan palautetaan oletusarvo:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Datamäärän rajoitus

`UserDefaults` sopii vain pienen datamäärän tallentamiseen, kuten sovelluksen asetuksiin tai yksinkertaisiin tilatietoihin.

Käytännössä se ei sovellu suuren datamäärän tai hyvin usein luettavan ja kirjoitettavan datan säilyttämiseen.

## Säästöpossun summan tallentaminen

Nyt voimme käyttää `UserDefaults`ia toteuttamaan logiikan, joka tallentaa säästöpossun kokonaissumman.

Kun käyttäjä painaa painiketta, syötetty summa lisätään kokonaismäärään ja kokonaissumma tallennetaan `UserDefaults`iin.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nyt kirjoituslogiikka on valmis.

## Pysyvän tallennuksen logiikan selitys

Vaikka olemme jo toteuttaneet pysyvän tallennuksen kirjoituslogiikan, käytännön ajossa huomataan, että aina näkymän päivittyessä tai sovelluksen käynnistyessä uudelleen `amount`-muuttuja on silti `0`.

Tämä johtuu siitä, että:

```swift
@State private var amount = 0
```

SwiftUI:ssa `@State`-muuttuja alustetaan aina uudelleen, kun näkymä luodaan.

Vaikka `UserDefaults`issa on tallennettu `amount`-arvo, näkymän latautuessa `amount` palautetaan silti ensin arvoon `0`.

Tämä osoittaa, että olemme vasta tallentaneet datan `UserDefaults`iin, mutta emme vielä palauttaneet sitä takaisin näkymään.

Siksi näkymän latautuessa täytyy myös lukea `UserDefaults`ista arvo ja sijoittaa se uudelleen `amount`-muuttujaan, jotta pysyvän tallennuksen koko logiikka toimii.

### Looginen vertaus

Voit ajatella tätä prosessia "luokkahuoneen tauluna":

Oppitunnin aikana opettaja kirjoittaa sisällön taululle. Tämä vastaa nykyisen näkymän tilaa (`@State`).

Kun tunti päättyy, taulu pyyhitään puhtaaksi seuraavaa tuntia varten. Tämä vastaa näkymän tuhoutumista ja sitä, että `@State`-data tyhjenee.

Jotta opetussisältö ei katoaisi, opettaja tallentaa sisällön etukäteen opetusmateriaaliin. Tämä materiaali vastaa `UserDefaults`iin tallennettua dataa.

Kun seuraava tunti alkaa, taulu on taas aluksi tyhjä (`@State` alustetaan uudelleen), joten opettajan täytyy kirjoittaa vanha sisältö takaisin taululle materiaalin perusteella (`UserDefaults`in lukeminen).

On tärkeää ymmärtää, että taulu ei palauta vanhaa sisältöä automaattisesti. Se täytyy kirjoittaa takaisin "lukemalla materiaali" eli lukemalla `UserDefaults`.

## Datan lukeminen `onAppear`-toiminnolla

Kun näkymä ilmestyy, täytyy lukea `UserDefaults`in arvo käsin ja sijoittaa se `@State`-muuttujaan `amount`, jotta pysyvä tallennus toimii aidosti.

SwiftUI:ssa voidaan käyttää `onAppear`-toimintoa suorittamaan alustuslogiikka silloin, kun näkymä näytetään:

```swift
.onAppear {}
```

Sijoitetaan `UserDefaults`in lukulogiikka `onAppear`-lohkoon:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Kun näkymä luodaan, `amount` alustetaan arvoksi `0`. Kun näkymä ilmestyy, `onAppear` suoritetaan, data luetaan `UserDefaults`ista ja sijoitetaan `amount`-muuttujaan. Näin näkymä voi näyttää viimeksi tallennetun kokonaissumman.

Nyt koko säästöpossun pysyvän tallennuksen logiikka on valmis.

## Täydellinen koodi

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## `@AppStorage`-ominaisuuskääre

SwiftUI tarjoaa `@AppStorage`-ominaisuuskääreen, joka yksinkertaistaa `UserDefaults`-pohjaista tallennuslogiikkaa.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` on `UserDefaults`in päälle rakennettu kääre, ja `"amount"` vastaa `UserDefaults`in avainta.

Kun näkymä luodaan, arvo luetaan automaattisesti `UserDefaults`ista. Kun muuttujan arvo muuttuu, se kirjoitetaan automaattisesti takaisin `UserDefaults`iin.

Se tukee SwiftUI:n tilapäivitysmekanismia, joten kuten `@State`, myös se päivittää SwiftUI-näkymän muuttujan muuttuessa.

Toisin sanoen `@AppStorage` voi toteuttaa sekä datan lukemisen että tallentamisen ilman, että `UserDefaults`ia tarvitsee kutsua käsin tai käyttää `onAppear`-toimintoa datan lataamiseen.

Siksi voimme korvata `UserDefaults`-ratkaisun `@AppStorage`lla:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Yhteenveto

Tässä luvussa opimme pääasiassa seuraavat asiat:

Ensinnäkin `UserDefaults`ia käytetään kevyen datan tallentamiseen. Tallensimme sen avulla säästöpossun kokonaissumman laitteelle. `UserDefaults` tarjoaa lukemiseen ja kirjoittamiseen tarvittavat metodit, ja samalla täytyy huomioida esimerkiksi valinnaiset tyypit.

Toiseksi `@State`-muuttujaa käytetään vain näkymän väliaikaisen tilan hallintaan, ja sen elinkaari on sidottu näkymään. Kun näkymä luodaan uudelleen, myös `@State` alustetaan uudelleen.

Opimme myös käyttämään `onAppear`-toimintoa `UserDefaults`-datan lukemiseen silloin, kun näkymä ilmestyy, jotta data voidaan palauttaa.

Lopuksi korvasimme `UserDefaults`-kutsut `@AppStorage`-ominaisuuskääreellä, joka lukee datan automaattisesti näkymän latautuessa ja kirjoittaa sen automaattisesti takaisin datan muuttuessa. Näin käsin kirjoitettu `UserDefaults`- ja `onAppear`-logiikka voidaan korvata.

Näiden asioiden avulla voimme toteuttaa perusmuotoisen sovellusdatan tallennuksen niin, että data säilyy pysyvästi.

## Harjoituksia tunnin jälkeen

Nyt säästöpossu tukee summan tallennusta, mutta toiminnallisuus ei ole vielä täydellinen.

1. Kun käyttäjä haluaa nostaa rahaa, tarvitaan vastaava nostologiikka.
2. Kun käyttäjä haluaa tyhjentää summan kokonaan, tarvitaan myös palautuslogiikka.
3. Jos säästöpossulle halutaan nimi, täytyy lisäksi tallentaa `String`-tyyppistä dataa.

Voit täydentää näitä toimintoja nykyisen projektin pohjalta, jotta säästöpossun toiminnallisuus olisi kokonaisempi.

## Lisätieto - Syötekentän oletusarvo

Voimme vielä parantaa syötekentän käyttökokemusta, jotta summan syöttäminen olisi sujuvampaa.

![textfield](../../Resource/015_view.png)

Nykyisessä toteutuksessa syötekentän oletusarvo on `0`. Tämä tarkoittaa, että käyttäjän täytyy aina ensin poistaa `0` ja vasta sitten syöttää uusi arvo, mikä ei ole kovin hyvä käyttökokemus.

Parempi ratkaisu on, että syötekenttä on aluksi tyhjä eikä näytä `0`:aa.

Tämä johtuu siitä, että `TextField` ja `number` ovat kaksisuuntaisesti sidottuja:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Kun `number` alustetaan arvolla `0`, syötekenttä näyttää myös `0`.

Siksi meidän täytyy muuttaa `number` tyhjäksi arvoksi eli `nil`:ksi.

```swift
@State private var number = nil
```

Tällöin syntyy virhe:

```
Generic parameter 'Value' could not be inferred
```

Tämä on juuri sitä, mitä käsittelimme "Tyyppijärjestelmä"-luvussa: kun muuttujan tyyppiä ei voida päätellä automaattisesti, tyyppi täytyy määritellä eksplisiittisesti.

Koska asetimme `number`-arvon `nil`:ksi, eikä `nil` itsessään sisällä tyyppitietoa, kääntäjä ei pysty päättelemään, onko muuttuja `String`, `Int` vai jotain muuta. Siksi se antaa virheen.

Siksi meidän täytyy määritellä `number`-tyyppi eksplisiittisesti:

```swift
@State private var number:Int? = nil
```

Tässä `Int?` tarkoittaa valinnaista tyyppiä (`Optional`), eli `number` voi olla joko `Int` tai `nil`.

Näin voimme alustaa sen arvolla `nil`, jolloin syötekenttä näkyy aluksi tyhjänä eikä `0`:na.

### Valinnaisen purkaminen

Kun `number` muutetaan valinnaiseksi tyypiksi, alkuperäinen laskentakoodi aiheuttaa virheen:

```swift
amount += number
```

Virheilmoitus:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Tämä johtuu siitä, että `number` voi nyt olla `nil`. Jos sitä käytetään suoraan laskennassa, siitä tulisi käytännössä:

```swift
amount += nil
```

On selvää, että `nil`:ää ei voi laskea yhteen `amount`-arvon kanssa, joten tämä ei ole sallittu operaatio.

Siksi valinnaista tyyppiä käytettäessä arvo täytyy purkaa ennen laskentaa.

Tässä voidaan käyttää `??`-operaattoria oletusarvon tarjoamiseen:

```swift
amount += number ?? 0
```

Kun `number` on `nil`, käytetään oletusarvoa `0`. Kun `number` sisältää arvon, käytetään käyttäjän syöttämää todellista arvoa.

Tämä varmistaa laskennan oikeellisuuden ja samalla mahdollistaa sen, että syötekenttä on oletuksena tyhjä eikä käyttäjän tarvitse poistaa `0`:aa joka kerta.

## Laajennettu koodi

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
