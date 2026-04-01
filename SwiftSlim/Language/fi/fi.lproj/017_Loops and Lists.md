# Silmukat ja listat

Tässä oppitunnissa opimme Swiftin `for`-silmukan sekä SwiftUI:n `ForEach`-rakenteen.

Molemmat auttavat meitä lukemaan taulukon elementtejä järjestyksessä yksi kerrallaan. Käytännön kehitystyössä meidän täytyy usein ottaa joukko dataa esiin yksi kohde kerrallaan ja sitten käsitellä tai näyttää se, ja silmukat ovat juuri tärkeä työkalu tämän tekemiseen.

Kun selaamme verkkosivuja tai käytämme sovellusta, näemme usein paljon listoja tai rivejä. Tällainen sisältö tallennetaan yleensä ensin `taulukkoon`, sitten luetaan yksi kerrallaan `silmukan` avulla ja lopuksi näytetään käyttöliittymässä.

Esimerkiksi Googlen hakutuloslista:

![Google](../../Resource/017_google.png)

Jokainen hakutuloslistan rivi vastaa yleensä yhtä tietoa, joka näytetään yksi kerrallaan silmukan avulla.

Siksi `taulukot` ja `silmukat` esiintyvät usein yhdessä. `Taulukko` vastaa tietojoukon tallentamisesta, ja `silmukka` vastaa näiden tietojen ottamisesta esiin järjestyksessä ja saman toiminnon suorittamisesta niille.

Seuraavaksi aloitamme kaikkein perusmuotoisimmasta `for`-silmukasta.

## Lähtölaskenta

Oletetaan, että haluamme toteuttaa lähtölaskennan ja tulostaa järjestyksessä `“5, 4, 3, 2, 1”`.

Suorin tapa kirjoittaa se on:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Vaikka tällä tavalla voidaan toteuttaa lähtölaskenta, jos sisältöä on paljon, koodi näyttää hyvin toistavalta eikä sitä ole myöhemmin helppo muokata.

Tässä tilanteessa voimme ensin laittaa tiedot taulukkoon ja käyttää sitten `for`-silmukkaa niiden tulostamiseen yksi kerrallaan:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tämä tapa on tiiviimpi ja myös helpompi laajentaa. Vaikka lähtölaskennassa olisi paljon numeroita, meidän ei tarvitse kirjoittaa `print`-riviä uudelleen ja uudelleen, vaan voimme antaa silmukan käsitellä jokaisen taulukon elementin automaattisesti.

Voimme laittaa tämän koodin painikkeeseen testattavaksi:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Kun painiketta napautetaan, `for`-silmukka ottaa `countDown`-taulukon jokaisen kokonaisluvun järjestyksessä ja tulostaa ne konsoliin.

Seuraavaksi katsotaan, miten `for`-silmukka toimii.

## for-silmukka

`for`-silmukkaa käytetään tietojoukon käsittelemiseen järjestyksessä. Yleisimmät kohteet ovat taulukot ja alueet.

Perusrakenne:

```swift
for elementti in taulukkoTaiAlue {
    suoritettavaKoodi
}
```

Esimerkiksi äskeinen lähtölaskentakoodi:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tässä `i` tarkoittaa sillä hetkellä haettua elementtiä, ja `in`-sanan jälkeen tulee silmukoitava data, eli `countDown`-taulukko.

Tämän koodin merkitys on: ohjelma ottaa `countDown`-taulukosta jokaisen elementin järjestyksessä. Joka kerta kun elementti otetaan, sitä merkitään väliaikaisesti muuttujalla `i`, ja sitten suoritetaan aaltosulkeiden sisällä oleva koodi.

Suoritusprosessi voidaan ymmärtää näin:

* Ensimmäinen haettu elementti on `5`, joten silloin `i`:n arvo on `5`
* Suoritetaan `print(i)` ja tulostetaan `5`
* Sitten haetaan seuraava elementti `4`
* Suoritetaan taas `print(i)` ja tulostetaan `4`

Seuraavat `3`, `2` ja `1` suoritetaan samalla tavalla yksi kerrallaan.

![for](../../Resource/017_for.png)

Kun kaikki taulukon elementit on käsitelty, `for`-silmukka päättyy automaattisesti.

Voimme käyttää `for`-silmukkaa taulukon jokaisen elementin hakemiseen ja toteuttaa esimerkiksi tällaisen lähtölaskennan.

**Vihje**: `i` on hyvin yleinen nimi for-silmukassa, ja sitä käytetään kuvaamaan parhaillaan haettua elementtiä, mutta se ei ole pakollinen. Voit käyttää myös muita englanninkielisiä nimiä.

Voimme esimerkiksi käyttää `num`-nimeä kuvaamaan jokaista haettua elementtiä:

```swift
for num in countDown {
    print(num)
}
```

Aaltosulkeiden sisällä täytyy myös käyttää `num`-nimeä kuvaamaan parhaillaan haettua elementtiä.

### Alueen silmukointi

`for`-silmukka voi kiertää paitsi taulukoita myös alueita.

Esimerkiksi kun haluamme laskea positiivisten kokonaislukujen summan `50`:een asti, meidän täytyy laskea yhteen kaikki kokonaisluvut `1`:stä `50`:een yksi kerrallaan.

Suorin tapa voisi olla:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Tämän tavan ongelma on, että meidän täytyy kirjoittaa jokainen numero käsin. Se on työlästä eikä sovi oikeisiin kehitystilanteisiin.

Tässä tilanteessa voimme käyttää alueoperaattoria yhdessä `for`-silmukan kanssa.

Edellisessä “Operaattorit”-luvussa opimme jo alueoperaattorin:

```swift
1...3   // 1, 2, 3
```

Tässä `...` tarkoittaa suljettua aluetta eli se sisältää sekä alkupisteen että loppupisteen.

Siksi voimme tässä käyttää `for`-silmukkaa kokonaislukualueen `1`–`50` kanssa:

```swift
for i in 1...50 {
    
}
```

Meidän täytyy laskea nämä kokonaisluvut yhteen, joten tarvitsemme myös muuttujan summan tallentamiseen:

```swift
var count = 0
```

Sitten jokaisella kierroksella lisäämme parhaillaan haetun luvun `count`-muuttujaan:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Tämä koodi tarkoittaa:

* `count` tallentaa tämänhetkisen summan
* `for`-silmukka hakee kokonaisluvut `1`:stä `50`:een yksi kerrallaan
* Joka kerta kun yksi kokonaisluku haetaan, suoritetaan `count += i`
* Kun silmukka päättyy, `count` sisältää lopullisen summan

Näin voimme saada kaikkien positiivisten kokonaislukujen summan `50`:een asti.

Samalla tavalla, jos haluamme laskea kokonaislukujen summan `1`:stä `100`:aan, meidän tarvitsee vain muuttaa aluetta:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for`-silmukka voi siis kiertää paitsi taulukoita myös aluetta. Tämä kyky käsitellä dataa toistuvasti järjestyksessä on hyvin yleinen ohjelmistokehityksessä.

Se voi auttaa meitä käsittelemään automaattisesti paljon toistuvaa työtä ilman, että meidän täytyy kirjoittaa käsin jokaisen luvun yhteenlasku tai muita vastaavia toistuvia toimintoja.

## Silmukat SwiftUI:ssa

Aiempi `for`-silmukka kuuluu Swift-kieleen.

SwiftUI:ssa emme kuitenkaan voi käyttää `for`-silmukkaa suoraan näkymärakenteen sisällä näkymien luomiseen:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Tämä johtuu siitä, että `VStack` tarvitsee sisälleen SwiftUI-näkymiä, kun taas tavallinen `for`-silmukka ei itsessään ole näkymä.

Jos haluamme SwiftUI:ssa luoda käyttöliittymää toistuvasti taulukon sisällön perusteella, meidän täytyy käyttää `ForEach`-rakennetta.

Esimerkiksi jos haluamme näyttää ryhmän kaikkien jäsenten nimet, voimme kirjoittaa:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Näyttötulos:

![for1](../../Resource/017_for1.png)

Sitten lisäämme jokaiselle `Text`-näkymälle samat muokkaimet:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Nyt jokainen `Text` näytetään pienemmällä ja paksummalla fontilla.

Näyttötulos:

![](../../Resource/017_for2.png)

Vaikka muokkaimet tekevät käyttöliittymästä paremman näköisen, ne myös pidentävät koodia ja tekevät siitä toistavampaa.

Jos nimiä tulee lisää tai jos myöhemmin haluamme muuttaa fonttia, väriä ja muita tyylejä yhtenäisesti, meidän täytyy kirjoittaa ja muokata paljon samaa koodia yhä uudelleen. Se on hankalaa eikä helppoa ylläpitää.

Tässä tilanteessa voimme ensin laittaa nimet taulukkoon ja sitten käyttää SwiftUI:n `ForEach`-rakennetta luomaan näkymiä toistuvasti taulukon datan perusteella:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Tämä koodi on tiiviimpi. `ForEach` lukee taulukon jokaisen elementin yksi kerrallaan ja näyttää vastaavan sisällön käyttöliittymässä.

Kun myöhemmin lisäämme uusia nimiä, meidän tarvitsee vain muokata `names`-taulukon sisältöä. Meidän ei tarvitse lisätä joka kerta uutta `Text`-näkymää ja monimutkaisia muokkaimia.

## ForEach

`ForEach` on SwiftUI-rakenne, jota käytetään näkymien toistuvaan luomiseen. Sen voi ymmärtää SwiftUI:n rakenteena, joka muistuttaa `for`-silmukkaa.

Peruskäyttö:

```swift
ForEach(taulukko, id: \.self) { elementti in
    SwiftUI-koodi
}
```

Esimerkiksi äskeiset ryhmän nimet:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Tämä koodi tarkoittaa:

`names` on silmukoitava taulukko eli näytettävä data.

`id:\.self` tarkoittaa, että taulukon elementtiä itseään käytetään jokaisen elementin erottamiseen.

Tässä esimerkissä taulukossa on merkkijonoja:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Siksi SwiftUI käyttää suoraan merkkijonoja "Sam", "John", "Wathon" ja "Bob" erottamaan eri sisällöt toisistaan.

Aloitteluvaiheessa tavallisille yksinkertaisille taulukoille, kuten `String` ja `Int`, voimme yleensä kirjoittaa:

```swift
id: \.self
```

Tässä vaiheessa sinun tarvitsee vain muistaa tämä yksi tapa. Muita `id`-sääntöjä ei vielä tarvitse ymmärtää syvällisemmin.

`item in`-kohdan `item` tarkoittaa parhaillaan haettua elementtiä.

Esimerkiksi ensimmäisellä kierroksella `item` on `"Sam"` ja toisella kierroksella `item` on `"John"`.

Siksi:

```swift
Text(item)
```

muuttuu yksi kerrallaan muotoon:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Tämän koodin tehtävä on siis: ottaa jokainen nimi `names`-taulukosta yksi kerrallaan ja luoda jokaiselle nimelle `Text`-näkymä.

### Suoritusprosessi

Suoritusprosessi voidaan ymmärtää näin:

* `ForEach` lukee ensin `names`-taulukon ensimmäisen elementin `"Sam"`
* `item` edustaa väliaikaisesti arvoa `"Sam"`
* `Text(item)` näyttää `"Sam"`
* Sitten se jatkaa seuraavan elementin `"John"` lukemista
* Ja suorittaa saman näkymäkoodin uudelleen

Lopulta kaikki taulukon nimet näytetään.

Tämän kirjoitustavan etu on se, että kun nimiä tulee lisää, meidän ei tarvitse kirjoittaa montaa `Text`-näkymää uudelleen, vaan riittää että muokkaamme taulukon sisältöä.

### Kuvien silmukointi

`ForEach` ei voi näyttää vain tekstiä, vaan myös kuvia, värejä tai muita SwiftUI-näkymiä.

Esimerkiksi valmistellaan 4 kuvaa:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Vedä nämä neljä kuvaa Xcoden Assets-kansioon.

![image](../../Resource/017_for3.png)

Jos emme käytä `ForEach`-rakennetta, meidän täytyy kirjoittaa jokainen kuva käsin:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Näyttötulos:

![image](../../Resource/017_for4.png)

Vaikka tällä tavalla toiminto saadaan toteutettua, koodi on melko pitkä.

Jos kuvia tulee enemmän ja enemmän, meidän täytyy kirjoittaa yhä enemmän `Image`-koodia uudelleen.

Jos myöhemmin haluamme muuttaa kaikkien kuvien kokoa yhtenäisesti, meidän täytyy muokata niitä yksi kerrallaan.

Tässä tilanteessa voimme laittaa kuvien nimet taulukkoon ja käyttää sitten `ForEach`-rakennetta kuvienäkymien toistuvaan luomiseen:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Tässä `images` on merkkijonotaulukko, ja jokainen taulukon elementti on kuvan nimi.

`ForEach(images, id: \.self)` tarkoittaa, että `images`-taulukon jokainen elementti luetaan yksi kerrallaan, itse elementtiä käytetään rivien erottamiseen, ja sitten kyseisen elementin perusteella luodaan vastaava näkymä.

Esimerkiksi jos ensimmäinen luettu elementti on `"430F9BEF"`, silloin:

```swift
Image(item)
```

vastaa samaa kuin:

```swift
Image("430F9BEF")
```

Myös muut kuvat näytetään samalla tavalla yksi kerrallaan.

![image](../../Resource/017_for4.png)

Tässä käytämme yhä:

```swift
id: \.self
```

Syy on sama kuin aiemmin: koska myös `images`-taulukon elementit ovat yksinkertaista merkkijonotyyppiä, voimme aloitteluvaiheessa käyttää suoraan itse elementtiä erottelutapana.

Tämän voi ymmärtää yksinkertaisena kiinteänä kaavana:

**Kun `ForEach` käy läpi yksinkertaista taulukkoa, kuten `String` tai `Int`, kirjoitetaan yleensä `id: \.self`.**

### Kuvien lisääminen

Jos myöhemmin tarvitsemme lisää kuvia, meidän tarvitsee vain muokata taulukon sisältöä:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Uutta `Image`-koodia ei tarvitse kirjoittaa uudelleen.

Jos kuvia on paljon, sitä voi käyttää yhdessä `ScrollView`-rakenteen kanssa. Muuten jos sisältö ylittää näytön, kaikkea ei voi esikatsella kokonaan.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Kuvien muokkaaminen

Kun haluamme muuttaa kuvien tyyliä yhtenäisesti, meidän tarvitsee vain muuttaa `ForEach`-rakenteen sisällä olevaa koodia.

Esimerkiksi muutetaan leveys arvoon `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Näin kaikki kuvat muuttuvat samalla kertaa, eikä niitä tarvitse muokata yksi kerrallaan.

Tämä on yksi `ForEach`-rakenteen tärkeistä tehtävistä:

**Kun useilla näkymillä on sama rakenne ja vain sisältö eroaa, voidaan kirjoittaa näkymäkoodi vain kerran ja antaa taulukon datan päättää, mitä näytetään.**

## Yhteenveto

Tässä oppitunnissa opimme `for`-silmukan ja `ForEach`-rakenteen.

`for`-silmukkaa käytetään taulukon tai alueen elementtien käsittelemiseen järjestyksessä, ja se painottuu enemmän datan käsittelyyn.

`ForEach`-rakennetta käytetään SwiftUI:ssa näkymien toistuvaan luomiseen taulukon sisällön perusteella, ja se painottuu enemmän näkymien näyttämiseen.

Nykyisessä aloitteluvaiheessa `ForEach`-rakenteen yleisin muoto on:

```swift
ForEach(taulukko, id: \.self) { elementti in
    SwiftUI-koodi
}
```

Tässä `id: \.self` tarkoittaa, että itse elementtiä käytetään jokaisen elementin erottamiseen.

Kun taulukon sisältö on yksinkertaista tyyppiä kuten `String` tai `Int`, voimme yleensä aloittaa tällä yhdellä kirjoitustavalla.

Myöhemmin, kun selaat verkkosivuja tai sovelluksia ja näet ryhmän toistuvaa tekstiä, kuvia tai muuta listasisältöä, voit ajatella, että SwiftUI:ssa tällainen sisältö laitetaan yleensä ensin taulukkoon ja näytetään sitten yksi kerrallaan `ForEach`-rakenteen avulla.
