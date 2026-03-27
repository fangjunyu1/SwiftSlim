# Operaattorit

Tässä luvussa opimme Swiftin operaattoreita (`Operators`).

Kun teemme laskutoimituksia, vertailuja tai loogisia päätelmiä, tarvitsemme operaattoreita. Nämä toiminnot kulkevat mukana ohjelman suorituksen eri vaiheissa ja ovat yksi ohjelmoinnin perustaidon ydinosista.

```swift
let a = 100 * 8
```

Ohjelmointia opiskellessa moni huomaa, että hyvä matemaattinen ajattelu helpottaa usein ohjelmalogiikan ymmärtämistä. Tämä johtuu siitä, että ohjelmointi perustuu olennaisesti laskemiseen ja sääntöjen arviointiin, ja juuri nämä ovat operaattorien keskeisiä tehtäviä.

Käytännön kehityksessä operaattoreita ei käytetä vain yksinkertaisiin numerolaskuihin, vaan niitä hyödynnetään laajasti monissa eri tilanteissa.

Esimerkiksi palikkapelissä, kun käyttäjä vetää palikan tiettyyn kohtaan, täytyy laskea:

- palikan koordinaattiasema
- paikat, joihin palikka voi asettua
- onko kohdesijainti käytettävissä

Nämä "laskenta + päätös" -prosessit perustuvat pohjimmiltaan operaattoreihin.

![Block](../../Resource/013_block.png)

Operaattorien opiskelu ei siis tarkoita vain numerolaskua, vaan se luo pohjan myöhemmälle käyttöliittymien asettelulle, datan käsittelylle ja vuorovaikutuslogiikalle.

## Miten laskenta suoritetaan SwiftUI:ssa

SwiftUI:ssa laskentalogiikka suoritetaan tavallisesti siten, että `Button` käynnistää funktion ja funktio suorittaa varsinaisen operaation.

Esimerkiksi:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Kun painiketta painetaan, Console tulostaa:

```
c: 20
```

Tässä luvussa kirjoitamme laskentalogiikan johdonmukaisesti `func`-funktioihin, käynnistämme ne painikkeilla ja käytämme `print`-tulostusta tulosten näyttämiseen.

Myöhemmissä esimerkeissä yksinkertaistamme esitystapaa ja merkitsemme laskennan tulokset suoraan koodiin sen sijaan, että käyttäisimme joka kerta erikseen `print`-tulostusta.

## Consolen tulostuksen hallinta

Koska jokainen painallus tuottaa tulostetta, voit puhdistaa vanhat lokit napsauttamalla Console-alueen oikeassa alakulmassa olevaa tyhjennyspainiketta. Näin nykyinen tulos on helpompi nähdä.

![Console](../../Resource/013_console.png)

## Toinen tapa kirjoittaa `Button`

Kun painike suorittaa vain yhden funktion, voidaan käyttää tiiviimpää kirjoitustapaa:

```swift
Button(action: ) {
    // View
}
```

Tässä kirjoitustavassa `action` määrittää funktion, joka suoritetaan painiketta painettaessa (parametriton funktio), ja aaltosulut `{}` määrittävät painikkeen näkymän.

Yhdistettynä aiempaan `calculate`-funktioon tämä voidaan kirjoittaa näin:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Kun painiketta painetaan, `calculate` suoritetaan suoraan.

Siksi tilanteissa, joissa painikkeen logiikka on yksinkertainen ja se vain kutsuu yhtä funktiota, `action`-kirjoitustapa on usein selkeämpi ja myös koodikäytäntöjen mukaisempi.

## Aritmeettiset operaattorit

Aritmeettisia operaattoreita (`Arithmetic Operators`) käytetään numeerisiin laskutoimituksiin:

- `+` yhteenlasku
- `-` vähennyslasku
- `*` kertolasku
- `/` jakolasku
- `%` jakojäännös

Esimerkki:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

On tärkeää huomata, että Swift on vahvasti tyypitetty kieli eikä se yhdistä eri datatyyppejä automaattisesti:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Kun tyypit ovat eri, tyyppi täytyy muuntaa käsin ennen laskentaa.

## Vertailuoperaattorit

Vertailuoperaattoreita (`Comparison Operators`) käytetään vertaamaan kahden arvon suhdetta. Tulos on `Bool`.

- `==` yhtä suuri kuin
- `!=` eri suuri kuin
- `>` suurempi kuin
- `<` pienempi kuin
- `>=` suurempi tai yhtä suuri kuin
- `<=` pienempi tai yhtä suuri kuin

Esimerkki:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Vertailuoperaattoreita käytetään usein ehtolauseissa. Esimerkiksi "sitaattikarusellissa" meidän täytyy varmistaa, ettei indeksi ylitä taulukon sallittua aluetta:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Jos `index` on pienempi kuin `sayings.count - 1`, vertailun tulos on `true` ja `if`-lauseen koodi suoritetaan. Jos tulos on `false`, sen jälkeistä koodia ei suoriteta.

## Loogiset operaattorit

Loogisia operaattoreita (`Logical Operators`) käytetään yhdistämään useita ehtoja:

- `&&` ja (`AND`)
- `||` tai (`OR`)
- `!` ei (`NOT`)

### `&&` ja

Kun useiden ehtojen täytyy toteutua samanaikaisesti, käytetään `&&`.

Esimerkiksi:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Tässä koodissa on kaksi ehtoa: `age >= 18` ja `age <= 100`.

Vain jos molemmat ehdot ovat `true`, myös `legalAge` on `true`. Jos yksikin ehto ei täyty, tulos on `false`.

### `||` tai

Kun useista ehdoista riittää, että yksikin toteutuu, käytetään `||`.

Esimerkiksi:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Tämä tarkoittaa, että niin kauan kuin joko `money >= 50` tai `creditCard >= 50` toteutuu, `payAllowed` on `true`.

Vain silloin, kun kumpikaan ehto ei toteudu, tulos on `false`.

Esimerkiksi maksutilanteessa voidaan maksaa joko käteisellä tai luottokortilla. Jos kumpikaan ei riitä, maksu epäonnistuu.

### `!` ei

`!` on looginen negaatio-operaattori (`NOT`), joka kääntää `Bool`-arvon vastakkaiseksi.

Sen voi ymmärtää niin, että `!` muuttaa `true`-arvon `false`-arvoksi ja `false`-arvon `true`-arvoksi.

Esimerkiksi:

```swift
let allowed = true
let result = !allowed   // false
```

Tässä `!allowed` tarkoittaa, että `allowed`-arvo käännetään vastakkaiseksi.

On hyvä huomata, että `!` ja `!=` ovat kaksi eri operaattoria. `!` kääntää `Bool`-arvon, kun taas `!=` on vertailuoperaattori, jonka tulos on `Bool`.

## Sijoitusoperaattorit

Sijoitusoperaattoreita (`Assignment Operators`) käytetään arvon antamiseen tai muuttujan päivittämiseen:

- `=` sijoitus

Sekä muuttujien luonti että laskennan tulosten tallentaminen käyttävät sijoitusta:

```swift
let a = 5
```

Tämä tarkoittaa, että arvo `5` sijoitetaan muuttujaan `a`.

### Yhdistetyt sijoitusoperaattorit

Käytännön kehityksessä perussijoituksen lisäksi käytetään usein myös yhdistettyjä sijoitusoperaattoreita, joilla arvoa voidaan laskea ja päivittää suoraan:

- `+=`
- `-=`
- `*=`
- `/=`

Edellisessä "laskuri"-luvussa tutustuimme jo lyhyesti yhdistettyihin sijoitusoperaattoreihin.

Esimerkiksi jos haluamme kasvattaa muuttujan arvoa painikkeen painalluksella:

```swift
var num = 10
num += 5   // num = 15
```

Tämä tarkoittaa, että `num` lasketaan yhteen `5`:n kanssa ja tulos sijoitetaan takaisin `num`-muuttujaan.

Siksi se on sama kuin:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternäärioperaattori

Swiftin ternäärioperaattori (`Ternary Operator`) arvioi ehdon ja palauttaa toisen kahdesta arvosta:

```swift
ehto ? arvo1 : arvo2
```

Sen suorituslogiikka on seuraava: jos ehto on `true`, palautetaan "arvo 1"; jos ehto on `false`, palautetaan "arvo 2".

Esimerkiksi:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Tämä koodi tarkistaa `showColor`-arvon. Jos se on `true`, palautetaan `Color.blue`, jolloin tausta näkyy sinisenä. Jos se on `false`, palautetaan `Color.clear`, jolloin taustaväriä ei näytetä.

Vinkki: `Color.clear` tarkoittaa läpinäkyvää väriä.

### Ero `if-else`-rakenteeseen

Ternäärioperaattori on loogisesti sama kuin `if-else`.

Esimerkiksi yllä oleva koodi voidaan kirjoittaa näin:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Näiden kahden kirjoitustavan suorituslogiikka on täysin sama: jos ehto on `true`, käytetään ensimmäistä tulosta, ja jos ehto on `false`, käytetään toista.

Käytännössä ternäärioperaattori on lyhyempi, joten se sopii hyvin yksinkertaisiin "kaksi vaihtoehtoa" -tilanteisiin, etenkin kun palautetaan suoraan jokin arvo.

SwiftUI:n `View`-rakennuksessa ternäärioperaattoria käytetään hyvin usein, esimerkiksi:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Tällä tavoin näkymän ulkoasua voidaan muuttaa dynaamisesti yhdessä koodirivissä ehdon perusteella.

## Alueoperaattorit

Alueoperaattoreita (`Range Operators`) käytetään kuvaamaan väliä:

- `...` suljettu väli (sisältää molemmat päät)
- `..<` puoliavoin väli (ei sisällä oikeaa päätä)

Esimerkiksi:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Voit ajatella tämän niin, että `1...3` tarkoittaa väliä `1`-`3` ja sisältää myös `3`:n, kun taas `5..<8` tarkoittaa väliä `5`-`8`, mutta ei sisällä `8`:aa.

Laajennetut muodot (vain tutustumista varten):

```
5...    // >= 5
...5    // <= 5
```

Tämä tarkoittaa yksipuolista aluetta, jota käytetään usein ehtotarkistuksissa tai mallivastaavuudessa.

Alueoperaattoreita käytetään myöhemmin erityisesti `for`-silmukoiden yhteydessä. Tässä vaiheessa riittää, että ymmärrät ne jatkuvana lukuvälinä.

## Operaattorien harjoittelu

Seuraavaksi harjoittelemme operaattoreita muutaman yksinkertaisen esimerkin avulla.

### 1. Ajoneuvojen kokonaismäärän laskeminen

Esimerkiksi tietyssä risteyksessä kulkee päivittäin `500` autoa. Lasketaan, kuinka monta autoa kulkee `30` päivän aikana.

Voimme käyttää laskentaoperaattoria:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Laskennan ajatus on tässä se, että jos päivässä kulkee `500` autoa, niin `30` päivän kokonaismäärä on `500 × 30`, eli lopputuloksena saadaan `15000`.

### 2. Sisäisten ostojen jäsenyyden tarkistaminen

Voimme tarkistaa, onko joku sisäisten ostojen jäsen. Jos henkilöllä on joko elinikäinen jäsenyys tai tilausjäsenyys, hänet katsotaan jäseneksi.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Tässä käytetään `||`-operaattoria: `lifeTime = false` tarkoittaa, ettei elinikäistä jäsenyyttä ole, ja `subscription = true` tarkoittaa, että tilausjäsenyys on olemassa.

Koska vain yhden ehdon täytyy toteutua, `isMember` on `true`. Tästä syystä tämä henkilö on jäsen.

## Yhteenveto

Swiftissä operaattorit ovat datan laskennan ja loogisen arvioinnin perusta, aivan kuten `Text` näyttää sisältöä, operaattorit puolestaan käsittelevät itse dataa.

Yksinkertaisista laskutoimituksista monimutkaiseen logiikkaan sekä näkymien tilanhallintaan ja asettelulaskelmiin asti operaattoreita tarvitaan kaikkialla.

Harjoittelemalla niitä eri tilanteissa voit vähitellen oppia tuntemaan ja hallitsemaan tässä luvussa esitellyt operaattorit. Tämä on tärkeä perusta myöhemmälle oppimiselle.

### Lisätieto - Bittioperaattorit

Lisäksi Swift tarjoaa myös matalamman tason operaattoreita eli bittioperaattoreita (`Bitwise Operators`):

- `&` (bittikohtainen JA)
- `|` (bittikohtainen TAI)
- `^` (bittikohtainen XOR)
- `~` (bittikohtainen NOT)
- `>>` (siirto oikealle)
- `<<` (siirto vasemmalle)

Esimerkiksi:

```swift
let a = 6  // binaari 110
let b = 3  // binaari 011

print(a & b) // 2 (binaari 010)
print(a | b) // 7 (binaari 111)
print(a ^ b) // 5 (binaari 101)
print(~a)    // -7 (bitittainen inversio)
```

Swiftissä kokonaisluvut esitetään binäärisessä kahden komplementin muodossa, joten bittikohtainen kääntö tuottaa vastaavan negatiivisen luvun.

Bittioperaattorit käsittelevät binääridataa suoraan, ja niitä käytetään yleensä matalan tason datankäsittelyssä tai suorituskyvyn optimoinnissa.

Aloittelijoille näiden operaattorien käyttötilanteet ovat suhteellisen harvinaisia, eikä niitä tavallisessa iOS- tai SwiftUI-kehityksessä yleensä käytetä paljon, joten emme käsittele niitä tässä syvällisemmin.

Jos myöhemmin törmäämme matalan tason logiikkaan tai suorituskyvyn optimointiin, näihin voi palata tarkemmin.
