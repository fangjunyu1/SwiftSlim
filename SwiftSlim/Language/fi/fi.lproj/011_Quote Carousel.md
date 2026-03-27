# Sitaattikaruselli

Tässä luvussa toteutamme "sitaattikaruselli"-toiminnon ja opimme syvemmin Swiftin perusasioita, kuten taulukot (`Array`) ja ehtolauseet (`if-else`).

Näytämme, miten useita sitaatteja tallennetaan ja miten niitä voidaan vaihtaa painikkeen avulla kiertävästi.

![alt text](../../RESOURCE/011_word.png)

## Sitaatin näyttäminen

Ensin meidän täytyy näyttää yksi sitaatti SwiftUI:ssa.

Yksinkertaisin tapa on käyttää `Text`-näkymää:

```swift
Text("Slow progress is still progress.")
```

Tämä koodi voi näyttää vain yhden kiinteän sitaatin. Jos haluamme näyttää useita sitaatteja ja vaihtaa niiden välillä, meidän täytyy tallentaa ne talteen.

Tavallinen merkkijonomuuttuja voi kuitenkin tallentaa vain yhden sitaatin:

```swift
let sayings = "Slow progress is still progress."
```

Jos haluamme tallentaa useita sitaatteja, meidän täytyy määritellä muuttuja jokaiselle sitaatille erikseen:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Käytännön kehityksessä tämä tapa on kuitenkin hankala. Lisäksi koska jokainen muuttuja on erillinen, emme voi toteuttaa joustavaa karusellivaihtoa.

Jotta useita sitaatteja olisi helpompi hallita, tarvitsemme tietorakenteen, joka tallentaa ne yhteen paikkaan. Tätä varten käytetään taulukkoa (`Array`).

Taulukon avulla yllä oleva sisältö voidaan tallentaa näin:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Vinkki: ohjelmointikäytännöissä useita alkioita sisältävän taulukon muuttujanimi kirjoitetaan yleensä monikossa, kuten `sayings`, jotta sen kokoelmaluonne näkyy selvästi.**

## Taulukot

Swiftissä taulukko on järjestetty kokoelma alkioita, ja se merkitään hakasuluilla `[]`.

```swift
[]
```

Taulukko voi sisältää useita saman tyyppisiä alkioita, ja alkiot erotetaan toisistaan englanninkielisellä pilkulla `,`.

Esimerkiksi:

```swift
[101, 102, 103, 104, 105]
```

Taulukkoa voi ajatella yksinkertaisesti junana:

![Array](../../RESOURCE/011_array1.png)

Koko juna edustaa tätä taulukko-oliota, ja jokainen vaunu on järjestetty peräkkäin.

### Indeksit ja alkioiden käyttö

Koska taulukko on järjestetty, järjestelmä voi paikantaa sen yksittäiset alkiot järjestyksen perusteella. Tätä paikannusmekanismia kutsutaan indeksiksi (`Index`).

Swiftissä, kuten useimmissa ohjelmointikielissä, taulukon indeksit alkavat arvosta `0`, eivät `1`. Tämä tarkoittaa, että ensimmäisen alkion indeksi on `0`, toisen `1` ja niin edelleen.

![Array](../../RESOURCE/011_array2.png)

Jos haluat käyttää tiettyä taulukon alkiota, lisää taulukon nimen perään hakasulut ja kirjoita niiden sisään halutun alkion indeksiarvo.

Esimerkiksi:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Jos yrität käyttää indeksiä, joka ylittää taulukon sallitun alueen, tapahtuu "Index Out of Range" -virhe. Siksi taulukkoa käytettäessä pitää varmistaa, että indeksi on voimassa.

**Indeksin ylitys**

Esimerkiksi kun taulukossa on vain 5 alkiota, laillinen indeksialue on `0`-`4`. Jos yritämme käyttää `sayings[5]`, ohjelma ei löydä vastaavaa "vaunua", mikä aiheuttaa indeksivirheen ja kaataa sovelluksen.

![Array](../../RESOURCE/011_array3.png)

### Taulukon käsittely

Taulukko ei tue vain staattista määrittelyä, vaan siitä voi myös lisätä, poistaa ja muokata alkioita sekä tarkistaa taulukon pituuden.

Vinkki: jos haluat muokata taulukkoa, se täytyy määritellä `var`-muuttujana eikä `let`-vakiona.

**1. Alkion lisääminen**

Voit lisätä alkion taulukon loppuun `append`-metodilla:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Alkion poistaminen**

`remove(at:)`-metodilla voidaan poistaa taulukosta tietty alkio:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Alkion muokkaaminen**

Taulukon alkiota voidaan muuttaa suoraan indeksin avulla:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Taulukon pituuden tarkistaminen**

`count`-ominaisuudella saadaan selville taulukon alkioiden määrä:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Sitaattien näyttäminen taulukon avulla

Jotta voimme näyttää useita sitaatteja, voimme tallentaa ne taulukkoon ja käyttää niitä indeksin avulla.

Ensin luomme `ContentView`-näkymään `sayings`-taulukon sitaattien tallentamista varten, ja sitten luemme ja näytämme halutun sitaatin `Text`-näkymässä indeksin avulla:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Tässä `sayings[0]` tarkoittaa taulukon ensimmäistä sitaattia.

Jos haluat näyttää toisen sitaatin, sinun tarvitsee vain muuttaa hakasulkujen sisällä olevaa indeksiä:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Sitaatin indeksin määrittely

Jotta sitaatti voisi vaihtua dynaamisesti, emme voi "kovakoodata" indeksiä `Text`-näkymään.

Meidän täytyy luoda muuttuja, joka tallentaa erikseen sen indeksin, jota tällä hetkellä näytetään.

SwiftUI:ssa voimme käyttää `@State`-ominaisuutta muuttuvan indeksin määrittämiseen:

```swift
@State private var index = 0
```

SwiftUI seuraa `@State`:llä käärittyjä muuttujia. Kun `index` muuttuu, SwiftUI renderöi näkymän uudelleen ja näyttää vastaavan sitaatin.

Seuraavaksi käytämme `sayings[index]`-muotoa taulukon sitaatin hakemiseen dynaamisesti:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Kun `index` muuttuu, `Text` näyttää eri sitaatin.

### Indeksin hallinta painikkeella

Voimme käyttää `Button`-painiketta ohjaamaan sitaatin vaihtumista muuttamalla `index`-arvoa. Jokaisella painalluksella `index` kasvaa yhdellä:

```swift
Button("Next") {
    index += 1
}
```

Kun napsautamme painiketta, `index` muuttuu arvosta `0` arvoon `1`, mikä käynnistää näkymän päivityksen. Tällöin `Text(sayings[index])` lukee seuraavan sitaatin.

Tässä on kuitenkin piilevä ongelma: jos painiketta painetaan monta kertaa peräkkäin, `index` voi kasvaa taulukon sallitun alueen ulkopuolelle. Tämä aiheuttaa indeksivirheen. Esimerkiksi kun `index` saavuttaa arvon `5` (taulukon indeksialue on `0`-`4`), ohjelma kaatuu.

Jotta taulukon indeksin ylitykseltä vältytään, tarvitsemme ehtolauseen, joka varmistaa, ettei `index` mene taulukon pituuden yli. Tämä voidaan tehdä `if-else`-lauseella.

## Ehtojen hallinta: `if-else`-lause

`if-else` on yksi Swiftin yleisimmin käytetyistä ehtolauseista. Sillä tarkistetaan, onko ehto tosi, ja suoritetaan eri koodilohko sen mukaan, onko ehto tosi vai epätosi.

Perusrakenne:

```swift
if condition {
    // Koodi, joka suoritetaan, kun condition on true
} else {
    // Koodi, joka suoritetaan, kun condition on false
}
```

`if`-lauseessa ehto `condition` on totuusarvo (`Bool`), eli joko `true` tai `false`. Kun ehto on `true`, suoritetaan `if`-osan koodi, muuten suoritetaan `else`-osan koodi.

Esimerkiksi:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Tässä esimerkissä `age` on `25`, joten `if` tarkistaa, pitääkö `age > 18` paikkansa. Koska ehto täyttyy, tulostuu `"Big Boy"`.

Jos `else`-osaa ei tarvita, sen voi jättää pois:

```swift
if condition {
    // Koodi, joka suoritetaan, kun condition on true
}
```

### Ehdon käyttäminen indeksialueen rajaamiseen

Jotta taulukon indeksi ei ylity, voimme käyttää `if`-lausetta varmistamaan, ettei `index` ylitä taulukon sallittua aluetta:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Looginen analyysi: `sayings.count` on `5`, koska sitaatteja on yhteensä viisi, joten `sayings.count - 1` on `4`, eli taulukon viimeinen kelvollinen indeksi.

Kun `index` on pienempi kuin `4`, painikkeen painaminen ja arvon kasvattaminen yhdellä on turvallista. Kun `index` saavuttaa arvon `4`, ehto ei enää täyty eikä painikkeen painaminen tee mitään.

Nyt koodi toteuttaa jo sitaattien vaihtamisen:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Sitaattien kierto

Jos haluamme, että viimeisen sitaatin jälkeen painike näyttää taas ensimmäisen sitaatin, voimme toteuttaa kierron `else`-haaran avulla:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Kun painiketta painetaan ja `index` on jo taulukon viimeisessä alkiossa, `index` palautetaan arvoon `0`, jolloin sitaattien näyttäminen alkaa alusta.

## Sitaattinäkymän viimeistely

Nyt sitaattikarusellin logiikka on valmis, mutta voimme vielä parantaa käyttöliittymää, jotta se näyttää siistimmältä.

Kokonainen koodi:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Tässä esimerkissä `Text`-näkymälle on lisätty puoliläpinäkyvä valkoinen tausta ja pyöristetyt kulmat. `Button` käyttää `.borderedProminent`-tyyliä, ja `VStack`-näkymälle on asetettu taustakuva.

Lisätieto: kun `background()`-muokkainta käytetään kuvan kanssa taustana, sen oletuskäyttäytyminen on täyttää nykyisen näkymän asettelualue mahdollisimman hyvin. Monissa tapauksissa se ulottuu luonnollisesti myös turva-alueelle (`Safe Area`).

Nyt olemme toteuttaneet sitaattikarusellin näkymän.

![SwiftUI View](../../RESOURCE/011_word.png)

## Yhteenveto

Tässä luvussa opimme tallentamaan useita sitaatteja taulukkoon sekä käyttämään `if`- ja `if-else`-lauseita sitaattien kiertämiseen.

Lisäksi opimme taulukkojen perustoiminnot, kuten alkioiden lisäämisen, poistamisen ja muokkaamisen, sekä sen, miten taulukon indeksin ylitys voidaan estää.

Tässä luvussa ei ainoastaan rakennettu sitaattikarusellia, vaan samalla harjoiteltiin taulukoiden ja ehtolauseiden peruskäyttöä, joiden avulla pystymme käsittelemään dataa ja ohjaamaan ohjelman kulkua.

## Lisätieto - Moniosainen ehtolause: `if-else if-else`

Todellisessa kehitystyössä täytyy usein käsitellä useita ehtoja. Esimerkiksi pelissä voidaan laukaista tapahtuma A, kun pisteet ovat `1`, tapahtuma B, kun pisteet ovat `2`, ja tapahtuma C, kun pisteet ovat `3`.

Kun ehtoja on enemmän kuin kaksi, tarvitaan `if-else if-else` -rakenne useiden haarojen tarkistamiseen.

Perussyntaksi:

```swift
if conditionA {
    // Koodi, joka suoritetaan, kun conditionA on true
} else if conditionB {
    // Koodi, joka suoritetaan, kun conditionB on true
} else if conditionC {
    // Koodi, joka suoritetaan, kun conditionC on true
} else {
    // Koodi, joka suoritetaan, jos mikään ehto ei täyty
}
```

Tässä tilanteessa ohjelma tarkistaa ehdot järjestyksessä ja suorittaa ensimmäisen ehdon koodin, joka täyttyy. Jos mikään ehto ei täyty, suoritetaan `else`-osan koodi.

Sitaattikarusellissa voisimme käyttää `if-else if-else` -rakennetta myös näin:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Kun `index` on `0`, `1`, `2` tai `3`, jokainen painallus suorittaa `index += 1`. Kun `index` on `4` eli viimeinen alkio, `index` palautetaan arvoon `0`, jolloin kierto alkaa alusta.

`else`-haara toimii varmistuksena siltä varalta, että `index` päätyy virheelliseen arvoon.

On hyvä huomata, että tässä käytetty `==` tarkoittaa tarkistusta "onko yhtä suuri kuin". Jos `if` tarkistaa, onko `index` yhtä suuri kuin jokin luku, tulos on `true` ja vastaava koodilohko suoritetaan. Muussa tapauksessa siirrytään seuraavaan ehtoon.

Tällainen moniosainen ehto on hyödyllinen silloin, kun eri tilanteissa täytyy suorittaa erilaista koodia.
