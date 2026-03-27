# Saadaan painike toimimaan

Tässä luvussa opimme pääasiassa `Button`-painikkeen, `print`-tulostuksen virheenkorjaukseen sekä Swift-funktiot.

Nämä ovat SwiftUI-vuorovaikutteisen ohjelmoinnin perusta.

## Painike

Painike on yksi yleisimmistä käyttöliittymäelementeistä. Kun haluamme esimerkiksi ladata, avata tai sulkea jotain, napsautamme yleensä painiketta.

Esimerkiksi App Storessa sovellus ladataan painamalla “Hae”-painiketta.

![Button](../../RESOURCE/008_button.png)

SwiftUI:ssa painiketta edustaa `Button`.

Peruskäyttö:

```swift
Button("") {
    
}
```

Rakenne voidaan jakaa kahteen osaan:

```swift
Button("Painikkeen teksti") {
    Koodi, joka suoritetaan painiketta painettaessa
}
```

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Kun tämä ajetaan, näytölle ilmestyy `Start`-painike.

![Button](../../RESOURCE/008_button1.png)

Kun käyttäjä painaa painiketta, aaltosulkeiden `{}` sisällä oleva koodi suoritetaan.

Huomaa: `Button` kuuluu SwiftUI:n käyttöliittymäkomponentteihin (`View`), joten se täytyy kirjoittaa `body`-lohkon sisään.

### buttonStyle-muokkain

SwiftUI:ssa `Button` tarjoaa järjestelmän sisäänrakennettuja painiketyylejä, joita voi käyttää `buttonStyle`-muokkaimella.

Esimerkiksi:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` käyttää järjestelmän tarjoamaa painiketyyliä.

Yleisiä vaihtoehtoja ovat:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Eri tyylien erot näkyvät pääasiassa siinä, onko painikkeella reunus, tausta ja kuinka voimakas visuaalinen korostus sillä on.

## print-tulostus

Ohjelmoinnissa täytyy usein tarkistaa, onko ohjelma edennyt johonkin tiettyyn kohtaan.

Swift tarjoaa tätä varten `print`-funktion, jolla voidaan tulostaa virheenkorjaustietoa.

Perusmuoto:

```swift
print("Hello")
```

Tämä rivi tulostaa tekstin `Console`-ikkunaan.

### Painikkeen toimivuuden testaaminen

Voimme kirjoittaa `print`-kutsun painikkeen sisään testataksemme, onko painiketta klikattu.

```swift
Button("Start") {
    print("Test 123")
}
```

Kun painiketta painetaan, `Console` näyttää:

```text
Test 123
```

Tämä tarkoittaa, että painike on laukaissut toiminnon onnistuneesti.

![Button](../../RESOURCE/008_button3.png)

Huomaa: `print` on Swift-koodia, ei käyttöliittymäkomponentti. Sitä ei voi laittaa suoraan `body`-lohkoon, muuten syntyy virhe.

Esimerkiksi seuraava kirjoitustapa on väärä:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Virhe: bodyn täytyy palauttaa View
    }
}
```

SwiftUI:ssa `body` kuvaa käyttöliittymän rakennetta, joten siellä voi olla vain käyttöliittymäkomponentteja (`View`), kuten `Text`, `Button` ja `Image`.

Tavallinen koodi, kuten laskentalogiikka ja `print`, täytyy sijoittaa painikkeisiin, funktioihin tai muihin tapahtumankäsittelijöihin.

### Console-konsoli

`print`-tulostus näkyy Xcoden `Console`-konsolissa.

Jos `Console` ei näy, voit avata debug-alueen oikean alakulman `Show the Debug Area` -painikkeella ja sen jälkeen näyttää konsolin `Show the Console` -painikkeella.

![](../../RESOURCE/008_button4.png)

`Console`-ikkunan vasemmassa alakulmassa on kaksi välilehteä: `Executable` ja `Previews`.

![](../../RESOURCE/008_button5.png)

Nämä vastaavat eri ajoympäristöjä: jos näkymä on auki `Canvas`-esikatselussa, `print`-tuloste näkyy `Previews`-välilehdellä; jos sovellus ajetaan simulaattorissa tai oikealla laitteella, tuloste näkyy `Executable`-välilehdellä.

Siksi jos `print`-tulostusta ei näy, ensimmäinen tarkistus kannattaa tehdä siitä, onko oikea välilehti valittuna.

## Esimerkki - ASCII-merkkitaide

Joissakin koodiprojekteissa näkee usein ASCII-merkkitaidetta.

Merkkitaide on kuva, joka muodostetaan tavallisista merkeistä. Esimerkiksi:

![ASCII](../../RESOURCE/008_ascii.png)

Voimme käyttää `Button` + `print` -yhdistelmää ASCII-merkkitaiteen tulostamiseen.

Esimerkkikoodi:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Kun painiketta klikataan, `Console` näyttää:

```text
 /\_/\
( o.o )
 > ^ <
```

Huomaa: merkkijonossa `\` täytyy kirjoittaa muodossa `\\`, koska kenoviiva on merkkijonoissa escape-merkki.

## Funktiot

Voimme kirjoittaa koodin suoraan painikkeen sisään.

Esimerkiksi:

```swift
Button("Start") {
    print("Hello")
}
```

Jos koodia on vähän, tämä toimii hyvin. Mutta käytännön kehityksessä yhden painikkeen logiikka voi olla paljonkin laajempi.

Esimerkiksi:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Koodia voi olla paljon enemmänkin
}
```

Jos koodi kasvaa liian suureksi, sen kirjoittaminen suoraan painikkeen sisään tekee käyttöliittymäkoodista sekavaa ja vaikeammin luettavaa sekä ylläpidettävää.

Siksi tällainen koodi siirretään yleensä funktioon, jota painike kutsuu.

### Mikä funktio on

Funktio on uudelleenkäytettävä koodilohko.

Kun haluamme suorittaa tietyn koodin, meidän tarvitsee vain kutsua funktiota, jolloin sen sisällä oleva koodi suoritetaan.

Näin koodirakenne pysyy selkeämpänä ja samaa logiikkaa voidaan käyttää uudelleen.

### Peruskirjoitustapa

Swiftissä funktio määritellään avainsanalla `func`:

```swift
func randomInt() {
    // code
}
```

Tämä koodi määrittelee funktion.

`randomInt` on funktion nimi, jolla kyseinen koodilohko tunnistetaan.

`()` ilmaisee parametrien paikan. Sinne voidaan ottaa vastaan ulkopuolelta tulevaa dataa. Jos dataa ei tarvita, se voidaan jättää tyhjäksi.

Aaltosulkeiden `{}` sisällä on funktion koodialue, johon kaikki suoritettava koodi kirjoitetaan.

Esimerkiksi:

```swift
func getName() {
    print("FangJunyu")
}
```

Tämän funktion tehtävä on tulostaa tekstiä.

### Funktion kutsuminen

Funktion määrittely vain luo tämän koodin. Jos haluamme suorittaa sen, meidän täytyy myös kutsua funktiota.

Funktiota kutsutaan lisäämällä sen nimen perään `()`:

```swift
getName()
```

Kun ohjelma suorittaa tämän rivin, `getName`-funktion sisällä oleva koodi suoritetaan.

Täydellinen esimerkki:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Kun tämä ajetaan, `Console` näyttää:

```text
FangJunyu
```

### Funktion käyttö SwiftUI:ssa

SwiftUI-näkymässä funktiot kirjoitetaan tavallisesti `body`-lohkon ulkopuolelle.

Esimerkiksi:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Kun painiketta klikataan, `getName()`-funktiota kutsutaan.

Tällä tavalla käyttöliittymäkoodi pysyy siistinä ja varsinainen logiikka käsitellään funktiossa.

### Funktion parametrit

Joskus funktion täytyy tehdä eri asioita riippuen siitä, mitä dataa sille annetaan.

Esimerkiksi voimme haluta funktion tulostavan eri nimiä sen sijaan, että se tulostaisi aina saman kiinteän `"FangJunyu"`-tekstin.

Tällöin käytämme parametreja. Parametrin voi ajatella olevan data, joka annetaan funktiolle kutsuhetkellä.

Esimerkiksi:

```swift
func getName(name: String) {
    print(name)
}
```

Tähän funktioon on lisätty parametri. `name` on parametrin nimi ja `String` sen tyyppi.

Tämä tarkoittaa, että funktion täytyy vastaanottaa `String`-tyyppinen arvo.

Koska funktio tarvitsee nyt dataa, kutsun yhteydessä täytyy antaa se:

```swift
getName(name: "Sam")
```

Kun funktiolle annetaan `"Sam"`, funktion sisällä käytetään tätä arvoa tulostukseen.

Tuloste:

```text
Sam
```

## Esimerkki - ASCII-merkkitaiteen tulostaminen funktion avulla

Edellisessä esimerkissä kirjoitimme `print`-kutsut suoraan painikkeen sisään.

Mutta jos merkkitaide on monimutkaisempi, koodista tulee pitkä. Tällöin logiikka kannattaa siirtää funktioon, jolloin käyttöliittymäkoodi pysyy selkeämpänä.

Esimerkkikoodi:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Kun tämä ajetaan ja painiketta klikataan, `Console` näyttää:

```text
 /\_/\
( o.o )
 > ^ <
```

Tässä tapahtuu kaksi asiaa, kun käyttäjä klikkaa painiketta:

1. Painike kutsuu `printCat()`-funktiota
2. Funktion sisällä oleva `print`-koodi suoritetaan

Tällä tavalla käyttöliittymäkoodi vastaa vain tapahtuman käynnistämisestä, ja varsinainen logiikka hoidetaan funktion sisällä.

Käytännön kehityksessä suurin osa painikkeiden toiminnoista toteutetaan juuri funktioiden avulla.

## Yhteenveto

Tässä luvussa opimme kolme tärkeää asiaa:

**1. Button-painike**

`Button` on SwiftUI:n komponentti, jota käytetään toimintojen käynnistämiseen.

```swift
Button("Start") {

}
```

Kun käyttäjä painaa painiketta, aaltosulkeiden sisällä oleva koodi suoritetaan.

**2. print-tulostus**

`print`-funktiota käytetään virheenkorjaustiedon tulostamiseen `Console`-ikkunaan.

```swift
print("Hello")
```

Kehittäjä voi tarkastella ohjelman ajotilaa `Console`-ikkunan kautta.

**3. Funktiot**

Funktio on uudelleenkäytettävä koodilohko.

```swift
func sayHello() {
    print("Hello")
}
```

Funktion kutsu:

```swift
sayHello()
```

Jos funktio tarvitsee dataa, se voi käyttää parametreja:

```swift
func sayHello(name: String) {
    print(name)
}
```

Seuraavissa luvuissa opimme lisää SwiftUI-komponentteja sekä sitä, miten data vuorovaikuttaa käyttöliittymän kanssa.

## Harjoitus

Yritä tehdä seuraavat harjoitukset:

1. Luo painike, jonka tekstinä on `"Hello"`
2. Kun painiketta klikataan, tulosta `Hello Swift` `Console`-ikkunaan
3. Siirrä tulostuskoodi funktioon ja kutsu tätä funktiota painikkeesta
