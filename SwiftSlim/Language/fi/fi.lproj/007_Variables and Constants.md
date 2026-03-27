# Muuttujat ja vakiot

Tässä luvussa opimme Swiftin muuttujat ja vakiot sekä tutustumme joihinkin yleisiin tietotyyppeihin ja perusoperaattoreihin.

Nämä ovat ohjelmoinnin kaikkein perustavimpia tietoja ja samalla tärkeä perusta myöhemmälle SwiftUI-opiskelulle.

## Muuttujat ja vakiot arjessa

Voimme ymmärtää muuttujia ja vakioita arkisten asioiden kautta.

Muuttujia arjessa:

- Televisiossa jokaisen ohjelman sisältö on erilainen
- Sää on joka päivä erilainen
- Kellon näyttö muuttuu sekunti sekunnilta

Näiden asioiden yhteinen piirre on se, että ne muuttuvat.

Jos televisiossa olisi aina vain yksi kuva, sää olisi aina aurinkoinen ja kellon viisarit eivät koskaan liikkuisi, nämä asiat olisivat vakioita.

Toinen voi muuttua, toinen ei.

## Muuttujien ja vakioiden ymmärtäminen

Sovelluskehityksessä käyttäjän täytyy usein syöttää tai tallentaa tietoja.

Esimerkiksi:

- Tilin nimi
- Syntymäpäivä
- Yhteystiedot
- Osoite

Nämä tiedot tallennetaan ja näytetään myöhemmin.

Esimerkiksi käyttäjä syöttää sovellukseen nimen:

```text
FangJunyu
```

Meidän täytyy tallentaa tämä nimi, jotta voimme näyttää sen sovelluksessa.

Tallennusprosessia voi ajatella yksinkertaisesti näin: laitetaan jotain laatikkoon.

Kun tallennamme nimen, se on kuin laittaisimme nimen yhteen laatikkoon.

Tallennettavia asioita voi olla paljon, joten laatikoitakin on paljon. Jotta tietäisimme, mitä missäkin laatikossa on, meidän täytyy antaa laatikolle nimi.

Esimerkiksi:

```text
name
```

Tässä esimerkissä `name` on nimi ja `FangJunyu` on tallennettu tieto.

![Var](../../RESOURCE/007_var.png)

**Swiftissä dataa tallennettaessa täytyy aina käyttää muuttujaa (`var`) tai vakiota (`let`).**

Koska nimeä voidaan yleensä muuttaa, meidän kannattaa käyttää muuttujaa.

```swift
var name = "FangJunyu"
```

Tässä on määritelty muuttuja nimeltä `name`. Sen tyyppi on `String` ja arvo on `"FangJunyu"`.

### Muuttujan ja vakion ero

Muuttuja määritellään sanalla `var`:

```swift
var
```

Vakio määritellään sanalla `let`:

```swift
let
```

Esimerkiksi:

```swift
var name = "FangJunyu"
let id = 123456
```

Jos arvo määritellään muuttujaksi, sitä voidaan muuttaa myöhemmin. Jos se määritellään vakioksi, sitä ei voi enää muuttaa.

Siksi muuttujien ja vakioiden suurin ero on: saako arvo muuttua vai ei.

### Vakion muuttaminen

Jos koodi yrittää muuttaa vakion arvoa:

```swift
let name = "Sam"
name = "Bob"
```

Swift ilmoittaa, ettei arvoa voi asettaa, koska kyseessä on vakio.

```text
Cannot assign to property: 'name' is a 'let' constant
```

Tämä mekanismi auttaa kehittäjää välttämään tärkeiden tietojen vahingossa tapahtuvaa muuttamista.

### Näyttäminen SwiftUI:ssa

Avaa tiedosto `ContentView.swift` ja määrittele muuttuja näkymän sisällä:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tässä on määritelty muuttuja nimeltä `name`, ja se näytetään käyttöliittymässä `Text`-näkymän avulla.

Jos muutamme muuttujan sisältöä:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Myös `Text`-näkymässä näkyvä teksti muuttuu.

Tällä tavalla voimme käyttää muuttujaa näkymän sisällön hallintaan ilman, että meidän täytyy joka kerta muokata `Text`-näkymän merkkijonoa suoraan.

Jos jossain muualla tarvitaan tätä tietoa, voimme välittää muuttujan sinne — aivan kuin antaisimme “laatikon” sisällön toiseen paikkaan käytettäväksi.

### Muuttujien ja vakioiden sijainti SwiftUI:ssa

SwiftUI:ssa muuttujat ja vakiot kirjoitetaan tavallisesti `body`-lohkon ulkopuolelle:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Toki ne voidaan kirjoittaa myös `body`-lohkon sisään:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Näiden kahden välillä on kuitenkin tärkeä ero:

- Jos muuttuja tai vakio kirjoitetaan `body`-lohkon sisälle, se luodaan uudelleen aina, kun näkymä lasketaan uudestaan
- Jos se kirjoitetaan `body`-lohkon ulkopuolelle, se on näkymärakenteen ominaisuus ja koodin rakenne pysyy selkeämpänä

Siksi käytännön kehityksessä muuttujat ja vakiot kirjoitetaan yleensä `body`-lohkon ulkopuolelle.

## Tietotyypit

Muuttujat voivat tallentaa monenlaista dataa. Näitä luokkia kutsutaan tietotyypeiksi.

Esimerkiksi käytimme aiemmin `Text`-näkymää tekstin näyttämiseen:

```swift
Text("Hello, World")
```

Tässä `"Hello, World"` kuuluu merkkijonotyyppiin (`String`).

Merkkijonoa käytetään tekstisisällön esittämiseen, ja Swiftissä se täytyy ympäröidä lainausmerkeillä `""`.

Esimerkiksi:

```swift
var hello = "Hello, World"
```

Merkkijonojen lisäksi Swiftissä on monia muitakin tietotyyppejä.

Alkuvaiheen neljä yleisintä tyyppiä ovat:

- `String`
- `Int`
- `Double`
- `Bool`

Näillä neljällä voidaan hoitaa suurin osa perusdatan käsittelystä.

**String**

`String` tarkoittaa tekstisisältöä. Esimerkiksi:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Merkkijonoja käytetään yleensä esimerkiksi käyttäjänimien, otsikoiden ja tekstisisältöjen esittämiseen.

**Int**

`Int` tarkoittaa kokonaislukua eli lukua ilman desimaaliosaa.

Esimerkiksi:

```swift
var age = 26
var count = 100
```

Kokonaislukuja käytetään usein esimerkiksi iän, määrän ja laskurien esittämiseen.

**Double**

`Double` tarkoittaa desimaalilukua.

Esimerkiksi:

```swift
var weight = 74.5
var height = 185.0
```

Swiftissä desimaalit ovat oletuksena yleensä `Double`-tyyppiä.

On olemassa myös samankaltainen tyyppi nimeltä `Float`, mutta se pystyy esittämään pienemmän arvoalueen, joten käytännön kehityksessä `Double` on tavallisempi.

**Bool**

`Bool`-tyyppiä käytetään kahden tilan esittämiseen: `true` ja `false`.

Esimerkiksi:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool`-tyyppiä käytetään usein ehtolauseissa. Esimerkiksi siinä, näytetäänkö ilmoitusikkuna vai ei.

Kun tilanteella on vain kaksi mahdollista lopputulosta, `Bool` on erittäin sopiva valinta.

### Näyttäminen SwiftUI:ssa

Kun näytämme `String`-tyyppiä, voimme käyttää sitä suoraan `Text`-näkymässä:

```swift
Text(name)
```

Mutta `Int`-, `Double`- ja muut vastaavat tyypit eivät ole merkkijonoja, joten niitä ei voi käyttää suoraan tekstisisältönä.

Jos haluamme näyttää nämä tiedot `Text`-näkymässä, voimme käyttää merkkijonointerpolaatiota (`String Interpolation`):

```swift
\()
```

Merkkijonointerpolaatio täytyy kirjoittaa merkkijonon sisään ja muuttuja tai vakio täytyy ympäröidä `\()`-muodolla.

Esimerkiksi:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Yllä olevassa koodissa `""` tarkoittaa merkkijonoa ja `\()` muuttujan tai vakion lisäämistä merkkijonon sisään.

Esimerkiksi:

```swift
"DoubleNum: \(num * 2)"
```

Näytettävä sisältö on:

```text
DoubleNum: 2
```

Tällä tavalla voimme lisätä muuttujia tai vakioita merkkijonoon ja näyttää ne sitten käyttöliittymässä `Text`-näkymän avulla.

Vinkki: `\()` toimii vain merkkijonon `""` sisällä.

## Operaattorit

Kun määrittelemme muuttujan tai vakion, näemme usein tämänkaltaisen kirjoitustavan:

```swift
var num = 1
```

Tässä `=`-merkkiä kutsutaan sijoitusoperaattoriksi.

Sen tehtävä on asettaa oikealla puolella oleva arvo vasemmalla puolella olevaan muuttujaan.

Tässä esimerkissä arvo `1` sijoitetaan muuttujaan `num`.

Sijoitusoperaattorin lisäksi on olemassa tavallisia numero-operaattoreita:

- `+`
- `-`
- `*`
- `/`

Kun laskemme numeroilla, esimerkiksi `Int`- tai `Double`-tyyppisillä arvoilla, käytämme näitä operaattoreita.

Esimerkiksi:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Laskun jälkeen tulos tallennetaan muuttujaan.

## Yhteenveto

Muuttujat, vakiot ja operaattorit ovat ohjelmoinnin kaikkein perustavimpia käsitteitä.

Muuttujien ja vakioiden avulla voimme tallentaa ohjelmassa erilaisia tietoja; tietotyyppien avulla voimme täsmentää datan lajin; ja operaattorien avulla voimme laskea ja käsitellä sitä.

Nämä tiedot ovat kuin ohjelmoinnin perustyökalut. Kun hallitset ne, rakennat vahvan pohjan myöhemmälle Swift- ja SwiftUI-opiskelulle.
