# Lasketut ominaisuudet

Tässä oppitunnissa opimme pääasiassa lasketuista ominaisuuksista.

Laskettuja ominaisuuksia käytetään uuden tuloksen laskemiseen olemassa olevien tietojen perusteella. Ne voivat laskea numeerisia arvoja, ja ne voivat myös laskea sisältöä, joka täytyy näyttää SwiftUI-näkymissä.

Esimerkiksi:

```swift
let a = 10
let b = 20
let c = a + b
```

Tässä `c` tarkoittaa tulosta, joka saadaan lisäämällä `a` ja `b` yhteen.

Tavallisessa koodissa tällainen kirjoitustapa on hyvin yleinen.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Vinkki: `Button`-painikkeen napautustapahtumassa voidaan suorittaa tavallista Swift-koodia.

Jos kuitenkin kirjoitamme vastaavaa koodia suoraan SwiftUI-näkymän ominaisuuksiin, kohtaamme ongelman.

Esimerkiksi:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Tämä koodi aiheuttaa virheen.

Näyttää siltä, että `a` ja `b` on jo kirjoitettu ennen `c`:tä, joten `c`:n arvon voisi näennäisesti laskea.

Rakenteen ominaisuusmäärityksissä tätä kirjoitustapaa ei kuitenkaan voi käyttää suoraan.

## Miksi c ei voi suoraan laskea a + b

Koska `a`, `b` ja `c` eivät ole painikkeen napautustapahtuman väliaikaisia vakioita, vaan `ContentView`-näkymän ominaisuuksia.

Painikkeen napautustapahtumassa tämä koodi voi toimia normaalisti:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Koska painikkeen napauttamisen jälkeen koodi suoritetaan järjestyksessä. Ensin luodaan `a`, sitten luodaan `b`, ja lopuksi `c` lasketaan käyttämällä `a + b`.

Mutta kun ominaisuuksia määritellään näkymän sisällä, tilanne on erilainen:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Tässä `a`, `b` ja `c` ovat kaikki `ContentView`-näkymän ominaisuuksia.

Kun `ContentView`-näkymä luodaan, Swiftin täytyy ensin valmistella nämä ominaisuudet. Luontiprosessin turvallisuuden varmistamiseksi Swift ei salli yhden tallennetun ilmentymäominaisuuden oletusarvon lukea suoraan saman ilmentymän muita ominaisuuksia.

Siksi tämä rivi aiheuttaa virheen:

```swift
let c = a + b
```

Voimme ymmärtää asian yksinkertaisesti näin: **kun ominaisuuksia määritellään näkymän sisällä, yhtä tavallista ominaisuutta ei voi suoraan käyttää toisen tavallisen ominaisuuden laskemiseen.**

Ominaisuutta, joka tallentaa arvon suoraan, kutsutaan "tallennetuksi ominaisuudeksi". Ymmärtämisen helpottamiseksi voimme toistaiseksi ajatella sitä tavallisena ominaisuutena.

Esimerkiksi:

```swift
let a = 10
```

`a` tallentaa arvon `10`.

```swift
let b = 20
```

`b` tallentaa arvon `20`.

Mutta:

```swift
let c = a + b
```

Tässä `c` ei ole suoraan kirjoitettu arvo, vaan haluamme laskea sen käyttämällä `a + b`.

Tällaisessa tilanteessa, jossa "saadaan tulos olemassa olevista tiedoista", laskettu ominaisuus sopii paremmin.

Sen voi muuttaa näin:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Tässä `c` on laskettu ominaisuus.

```swift
var c: Int {
    return a + b
}
```

Se tarkoittaa: **kun `c`:tä täytyy käyttää, lue `a` ja `b` silloin ja palauta tulos `a + b`.**

Esimerkiksi:

```swift
Text("c: \(c)")
```

Kun `Text` näyttää `c`:n, vasta silloin `c`:n laskenta käynnistyy.

## Mikä on laskettu ominaisuus?

Laskettu ominaisuus näyttää muuttujalta, mutta se ei itse tallenna tietoa.

Esimerkiksi:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Tässä `c` on laskettu ominaisuus.

Se ei tallenna kiinteää arvoa tavallisen ominaisuuden tavoin, vaan aina kun `c` luetaan, se suorittaa `{}`-lohkon koodin uudelleen ja palauttaa laskennan tuloksen.

Sen voi ymmärtää näin:

```swift
var c: Int {
    return a + b
}
```

Kun `c`:tä täytyy käyttää, lasketaan `a + b`.

Siksi laskettu ominaisuus sopii tällaiseen tilanteeseen: **tulosta ei tarvitse tallentaa erikseen, vaan se voidaan laskea olemassa olevista tiedoista.**

## Peruskirjoitustapa

Laskettu ominaisuus sisältää yleensä kolme osaa:

```swift
var c: Int {
    return a + b
}
```

### 1. Määrittele `var`-avainsanalla

```swift
var c
```

Laskettu ominaisuus täytyy määritellä `var`-avainsanalla; `let`-avainsanaa ei voi käyttää.

Koska laskettu ominaisuus ei ole kiinteästi tallennettu arvo, vaan tulos, joka lasketaan dynaamisesti aina luettaessa.

### 2. Merkitse palautustyyppi

```swift
var c: Int
```

Lasketun ominaisuuden täytyy merkitä palautustyyppi.

Tässä `c` palauttaa lopulta kokonaisluvun, joten tyyppi on `Int`.

### 3. Kirjoita laskentalogiikka käyttämällä {}

```swift
{
    return a + b
}
```

`{}`-lohkon sisällä on laskentalogiikka; tässä palautetaan `a + b`.

## return-avainsana

Lasketun ominaisuuden täytyy palauttaa tulos.

Esimerkiksi:

```swift
var c: Int {
    return a + b
}
```

Tässä `return` tarkoittaa: palauta `a + b` -laskennan tulos ulos.

Jos laskettu ominaisuus sisältää vain yhden lausekkeen, joka tuottaa tuloksen suoraan, `return` voidaan jättää pois:

```swift
var c: Int {
    a + b
}
```

Mutta jos laskettu ominaisuus sisältää useita koodirivejä, täytyy käyttää `return`-avainsanaa tuloksen selkeään palauttamiseen.

Esimerkiksi:

```swift
var totalPriceText: String {
    let total = count * price
    return "Yhteensä: \(total) $"
}
```

Tässä laskentaprosessi jakautuu kahteen vaiheeseen.

Ensimmäinen vaihe, laske ensin kokonaishinta:

```swift
let total = count * price
```

Toinen vaihe, yhdistä kokonaishinta tekstiksi ja palauta se:

```swift
return "Yhteensä: \(total) $"
```

Jos poistamme `return`-avainsanan:

```swift
var totalPriceText: String {
    let total = count * price
    "Yhteensä: \(total) $"
}
```

Tämä koodi aiheuttaa virheen.

Syy on: **tämä laskettu ominaisuus sisältää jo useita koodirivejä, eikä Swift voi enää automaattisesti päätellä, mikä rivi on lopullinen palautettava tulos.**

Siksi kun lasketussa ominaisuudessa on vain yksi tulosrivi, `return` voidaan jättää pois.

```swift
var c: Int {
    a + b
}
```

Kun laskettu ominaisuus sisältää useita koodirivejä, on suositeltavaa kirjoittaa `return` selkeästi.

```swift
var totalPriceText: String {
    let total = count * price
    return "Yhteensä: \(total) $"
}
```

## Laskettujen ominaisuuksien ja tavallisten ominaisuuksien ero

Tavalliset ominaisuudet tallentavat tietoa.

```swift
var c = 30
```

Tässä `c` tallentaa konkreettisen arvon: `30`.

Lasketut ominaisuudet eivät tallenna tietoa.

```swift
var c: Int {
    a + b
}
```

Tässä `c` ei tallenna arvoa `30`. Se tarjoaa vain laskentatavan.

Kun `c` luetaan, Swift suorittaa:

```swift
a + b
```

ja palauttaa sitten laskennan tuloksen.

Siksi lasketut ominaisuudet sopivat tilanteisiin, joissa tulos lasketaan muista tiedoista.

## body on myös laskettu ominaisuus

Kun olemme oppineet lasketut ominaisuudet, voimme ymmärtää uudelleen yhden SwiftUI:n yleisimmistä koodinpätkistä:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tässä `body` on myös laskettu ominaisuus.

Se määritellään `var`-avainsanalla:

```swift
var body
```

Sillä on palautustyyppi:

```swift
some View
```

Sen `{}`-lohkon sisällä palautetaan SwiftUI-näkymän sisältöä:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Siksi `body` voidaan ymmärtää näin: kun SwiftUI:n täytyy näyttää tämä näkymä, se lukee `body`:n ja luo käyttöliittymän `body`:n palauttaman sisällön perusteella.

Jos kirjoitamme `return`, sen voi ymmärtää näin:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

SwiftUI:ssa jätämme kuitenkin yleensä `return`-avainsanan pois ja kirjoitamme suoraan:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Kun `@State`-data muuttuu, SwiftUI lukee `body`:n uudelleen ja päivittää käyttöliittymän uuden datan perusteella.

Esimerkiksi:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("määrä: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Painikkeen napauttamisen jälkeen `count` muuttuu.

```swift
count += 1
```

Kun `count` muuttuu, SwiftUI laskee `body`:n uudelleen, joten myös käyttöliittymän teksti päivittyy.

```swift
Text("määrä: \(count)")
```

Tämä on myös syy siihen, miksi SwiftUI:ssa käyttöliittymä voi päivittyä automaattisesti datan muuttuessa.

### Monimutkaisia laskelmia ei suositella kirjoitettavaksi bodyyn

Koska `body` on laskettu ominaisuus, sitä voidaan lukea ja laskea uudelleen monta kertaa.

Esimerkiksi:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("numero: \(num)")
            Text("nimi: \(name)")
        }
    }
}
```

Kun `name` muuttuu, SwiftUI laskee `body`:n uudelleen.

Silloin myös `body`:n sisällä oleva koodi suoritetaan uudelleen, ja `num` luodaan myös uudelleen.

```swift
let num = 10
```

Tämän esimerkin `num` on hyvin yksinkertainen, joten vaikutus ei ole suuri.

Mutta jos `body`:ssa suoritetaan monimutkaisia laskelmia, kuten suuren datamäärän suodatusta, lajittelua, kuvankäsittelyä ja niin edelleen, se voi vaikuttaa käyttöliittymän sulavuuteen.

Siksi SwiftUI:ssa `body`:n pitäisi pääasiassa kuvata käyttöliittymän rakennetta.

Yksinkertainen väliaikainen data voidaan kirjoittaa `body`:n sisään.

Monimutkaiset laskelmat voidaan sijoittaa `body`:n ulkopuolisiin laskettuihin ominaisuuksiin, metodeihin tai erilliseen datankäsittelyyn.

## Esimerkki: määrä ja kokonaishinta

Seuraavaksi ymmärrämme lasketut ominaisuudet yksinkertaisen esimerkin avulla.

Oletetaan, että yhden porkkanan yksikköhinta on 2 $, käyttäjä voi muuttaa ostomäärää painikkeilla, ja käyttöliittymän täytyy näyttää kokonaishinta.

Kokonaishinnan laskentatapa:

```
määrä * yksikköhinta
```

Jos käytämme tavallista muuttujaa kokonaishinnan tallentamiseen, siitä tulee hieman hankalaa.

Koska aina kun määrä muuttuu, kokonaishinta täytyy päivittää käsin.

Parempi tapa on käyttää laskettua ominaisuutta:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("hinta: \(price) $")
                Text("määrä: \(count)")
                Text("kokonaishinta: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Näyttötulos:

![view](../../Resource/024_view.png)

Tässä esimerkissä:

```swift
@State private var count = 1
```

`count` tarkoittaa porkkanoiden määrää. Kun painiketta napautetaan, `count` muuttuu.

```swift
private let price = 2
```

`price` tarkoittaa porkkanan yksikköhintaa. Tässä se on kiinteä arvo, joten käytetään `let`-avainsanaa.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` tarkoittaa kokonaishintaa.

Sitä ei tarvitse tallentaa erikseen, koska kokonaishinta voidaan aina laskea käyttämällä `count * price`.

Kun `count` on `1`:

```swift
totalPrice = 1 * 2
```

Näytettävä tulos on:

```swift
kokonaishinta: 2 $
```

Kun `+`-painiketta napautetaan, `count` muuttuu arvoon `2`.

Kun `totalPrice` luetaan tällöin uudelleen, se lasketaan uudelleen:

```swift
totalPrice = 2 * 2
```

Näytettävä tulos on:

```swift
kokonaishinta: 4 $
```

Tämä on lasketun ominaisuuden tehtävä: laskea uusi tulos dynaamisesti olemassa olevien tietojen perusteella.

## Laskettuja ominaisuuksia voidaan käyttää tarkistuksiin

Lasketut ominaisuudet eivät voi vain laskea numeerisia arvoja, vaan ne voivat myös palauttaa tarkistuksen tuloksia.

Esimerkiksi silloin, kun haluamme määrän vähimmäisarvoksi 1.

Kun määrä on jo 1, `-`-painikkeen ei pitäisi enää vähentää sitä.

Voimme lisätä lasketun ominaisuuden:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Täydellinen koodi:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("hinta: \(price) $")
                Text("määrä: \(count)")
                Text("kokonaishinta: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Näyttötulos:

![view](../../Resource/024_view1.png)

Tässä:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Tämä koodi tarkoittaa, voiko määrää tällä hetkellä vähentää.

Kun `count` on suurempi kuin `1`:

```swift
canDecrease == true
```

se tarkoittaa, että vähentäminen on mahdollista.

Kun `count` on yhtä suuri kuin `1`:

```swift
canDecrease == false
```

se tarkoittaa, että vähentämistä ei voi jatkaa.

### Ehtotarkistus painikkeessa

Painikkeessa käytetään:

```swift
if canDecrease {
    count -= 1
}
```

Vain kun `canDecrease` arvioituu arvoon `true`, `count` voidaan vähentää.

### Näkymän etualan värin hallinta

Voimme myös käyttää `canDecrease`-ominaisuutta painikkeen etualan värin hallintaan:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tässä käytetään ternääristä operaattoria:

```swift
canDecrease ? Color.primary : Color.gray
```

Tämän koodin merkitys on: jos `canDecrease` on `true`, etualan värinä käytetään `Color.primary`; jos `canDecrease` on `false`, etualan värinä käytetään `Color.gray`.

`Color.primary` on SwiftUI:n tarjoama järjestelmän semanttinen väri. Se tarkoittaa nykyisen käyttöliittymän päätekstiväriä.

Vaaleassa tilassa `Color.primary` on yleensä lähellä mustaa; tummassa tilassa `Color.primary` on yleensä lähellä valkoista.

Siksi `Color.primary`-värin etu on se, että se mukautuu automaattisesti vaaleaan ja tummaan tilaan.

### Näkymän poistetun käytöstä -tilan hallinta

`disabled`-muokkainta käytetään hallitsemaan, onko näkymä pois käytöstä:

```swift
.disabled(!canDecrease)
```

Kun `disabled` on `false`, näkymää voi napauttaa.

Kun `disabled` on `true`, näkymä on pois käytöstä eikä sitä voi napauttaa.

`canDecrease`-ehdon käyttäminen tässä tekee koodista helpommin ymmärrettävää.

Kun näemme `canDecrease`, tiedämme sen tarkoittavan "voiko määrää vähentää juuri nyt".

### Lisäselitys: miksi tarkistus tehdään kahdesti?

`-`-painikkeessa:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Tässä käytetään sekä `.disabled(!canDecrease)` että painikkeen sisällä `if canDecrease`.

`.disabled(!canDecrease)` vastaa painikkeen poistamisesta käytöstä käyttöliittymässä, jotta käyttäjä ei voi napauttaa sitä.

`if canDecrease` vastaa uudesta tarkistuksesta ennen koodin suorittamista. Se suorittaa `count -= 1` vain silloin, kun vähentäminen on sallittua.

Tämä on kaksinkertainen suoja. Todellisessa kehityksessä sisäinen tarkistus voidaan jättää pois, jos painike on jo poistettu käytöstä. Opetusesimerkissä se kuitenkin säilytetään, jotta `canDecrease`-ominaisuuden rooli olisi selkeämpi.

## Yhteenveto

Tässä oppitunnissa opimme pääasiassa lasketut ominaisuudet.

Laskettu ominaisuus ei tallenna arvoa suoraan. Sen sijaan se laskee tuloksen olemassa olevista tiedoista, kun sitä luetaan.

Esimerkiksi:

```swift
var c: Int {
    a + b
}
```

Tässä `c`:tä ei tarvitse tallentaa erikseen, koska se voidaan laskea käyttämällä `a + b`.

Laskettu ominaisuus täytyy määritellä `var`-avainsanalla, ja sen täytyy merkitä palautustyyppi.

```swift
var canDecrease: Bool {
    count > 1
}
```

Lasketut ominaisuudet voivat palauttaa numeeristen arvojen lisäksi myös tarkistustuloksia, tekstisisältöä ja jopa SwiftUI-näkymien sisältöä.

Tässä oppitunnissa opimme myös `return`-avainsanan.

`return` tarkoittaa tuloksen palauttamista:

```swift
var totalPriceText: String {
    let total = count * price
    return "Yhteensä: \(total) $"
}
```

Jos laskettu ominaisuus sisältää vain yhden lausekkeen, joka tuottaa tuloksen suoraan, `return` voidaan jättää pois.

```swift
var totalPrice: Int {
    count * price
}
```

Lisäksi opimme myös `Color.primary`-väristä ja `disabled`-muokkaimesta.

`Color.primary` on SwiftUI:n järjestelmän semanttinen väri. Se säätää näyttötulosta automaattisesti vaalean ja tumman tilan mukaan.

```swift
.foregroundStyle(Color.primary)
```

`disabled`-muokkainta käytetään hallitsemaan, onko näkymä pois käytöstä.

```swift
.disabled(true)
```

Tämä tarkoittaa pois käytöstä, eikä sitä voi napauttaa.

```swift
.disabled(false)
```

Tämä tarkoittaa käytettävissä, ja sitä voi napauttaa.

Siksi lasketut ominaisuudet ovat hyvin yleisiä SwiftUI:ssa. Ne auttavat meitä järjestämään laskentatulokset, tarkistusehdot ja näytettävän sisällön selkeämmin.
