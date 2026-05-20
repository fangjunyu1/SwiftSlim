# Kuvagalleria

Tässä oppitunnissa rakennamme kuvagalleriasivun.

![view](../../../Resource/032_view13.png)

Tässä esimerkissä kertaamme `extension`-, `self`- ja instanssikäsitteitä sekä opimme SwiftUI:ssa usein käytetyistä `Shape`-muodoista.

Näiden tietojen avulla voimme rajata tavallisia kuvia eri tyyleihin, kuten ympyräksi, pyöristetyksi suorakulmioksi, kapseliksi ja ellipsiksi, sekä lisätä kuviin reunatehosteita.

Tässä oppitunnissa käytetään muutamia uusia käsitteitä: `Shape`, `clipShape`, `strokeBorder` ja `overlay`.

Niistä `clipShape` käytetään näkymän muodon rajaamiseen, `strokeBorder` muodon reunan piirtämiseen ja `overlay` uuden näkymän asettamiseen nykyisen näkymän päälle.

## Kuvaresurssit

Ennen aloittamista meidän täytyy valmistella muutama kuva.

Voit käyttää omia kuviasi tai tässä oppitunnissa annettuja esimerkkikuvia.

Tämän oppitunnin esimerkkikuvat ovat peräisin [Pixabay](https://pixabay.com/) -sivustolta:

[Maisema](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Kettu](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Rakennus](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Kukka](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Joutsen](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Kun kuvat on ladattu, lisää ne `Assets`-resurssikansioon ja nimeä ne järjestyksessä `1`, `2`, `3`, `4` ja `5`.

![assets](../../../Resource/032_view17.png)

Näin voimme näyttää kuvat SwiftUI:ssa muodossa `Image("1")`, `Image("2")` ja niin edelleen.

## Kuvien näyttäminen

Näytetään ensin 5 kuvaa `ContentView`-näkymässä:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Näyttötulos:

![view](../../../Resource/032_view.png)

Tässä koodissa käytämme `ScrollView`-näkymää, jotta kuvaluetteloa voidaan vierittää, ja `VStack`-näkymää useiden kuvien järjestämiseen ylhäältä alas.

Jokainen kuva käyttää `.resizable()`, `.scaledToFit()` ja `.frame(width: 300)` -muokkaimia näyttötavan määrittämiseen, jotta kuva voi skaalautua, säilyttää mittasuhteensa ja rajoittua tiettyyn leveyteen.

`VStack`-näkymän `.padding(.vertical, 100)` lisää ylä- ja alaväliä, jotta ensimmäinen ja viimeinen kuva eivät ole liian lähellä näytön reunoja.

Lopun `.ignoresSafeArea()` tarkoittaa, että vieritysnäkymä ohittaa turvallisen alueen, jolloin kuvat voivat vierittäessä ulottua näytön ylä- ja alareunaan ja sivu näkyy täydellisemmin.

Tällä hetkellä kaikki 5 kuvaa käyttävät kuitenkin samoja muokkaimia:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Kun näemme toistuvaa koodia, voimme harkita sen järjestämistä `extension`-laajennuksen avulla.

## Kuvatyyli extension-laajennuksella

Voimme laajentaa `Image`-tyyppiä kuvagalleriaa varten tarkoitetulla metodilla:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tässä laajennamme `Image`-tyyppiä `photoGalleryStyle`-metodilla.

Tämä metodi sisältää aiemmin toistetut `.resizable()`, `.scaledToFit()` ja `.frame(width: 300)`. Toisin sanoen se kokoaa kuvan skaalauksen, mittasuhteiden mukaisen näyttämisen ja leveyden asettamisen samaan paikkaan.

Kun tätä laajennusta käytetään, alkuperäinen kuvakoodi:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

voidaan yksinkertaistaa muotoon:

```swift
Image("1")
    .photoGalleryStyle()
```

Näin jokaisen kuvan tarvitsee vain kutsua `.photoGalleryStyle()`-metodia saman kuvagalleriatyylin käyttämiseksi. Koodista tulee selkeämpää, ja sitä on myöhemmin helpompi muuttaa yhtenäisesti.

## self-käsitteen ymmärtäminen

Laajennusmetodissa kirjoitimme `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tässä `self` tarkoittaa nykyistä kuva-instanssia, joka kutsuu tätä metodia.

Esimerkiksi:

```swift
Image("1")
    .photoGalleryStyle()
```

Tässä koodissa `photoGalleryStyle()`-metodia kutsuu `Image("1")`, joten metodin sisällä oleva `self` tarkoittaa tätä `Image("1")`-kuvaa.

Yksinkertaisesti ajateltuna: se, joka kutsuu tätä metodia, on se, mitä `self` tarkoittaa.

On tärkeää huomata, että SwiftUI:n muokkaimet palauttavat jatkuvasti uusia näkymätuloksia. Siksi `photoGalleryStyle()` palauttaa muokatun näkymän eikä vain alkuperäistä `Image`-arvoa sellaisenaan.

## Kuvien muodot

Nyt kuvat voidaan jo näyttää normaalisti. Oletuksena nämä kuvat ovat kuitenkin suorakulmaisia, mikä näyttää melko tavalliselta.

Jos haluat vain lisätä kuviin pyöristetyt kulmat, voit käyttää suoraan `.cornerRadius()`-muokkainta:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Näyttötulos:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` tarkoittaa, että kuvaan lisätään `20 pt` kulmapyöristys. Tavallisille pyöristetyn kulman kuville tämä kirjoitustapa riittää jo.

`.cornerRadius()` voi kuitenkin käsitellä vain pyöristettyjä kulmia, ja se sopii tavallisten pyöristettyjen kuvien tekemiseen. Jos haluamme muuttaa kuvat useampiin erilaisiin muotoihin, tämä muokkain ei yksin riitä.

Tässä vaiheessa tarvitaan SwiftUI:n `Shape`-muotoja. `Shape` voi kuvata erilaisia grafiikkamuotoja, ja yhdessä `clipShape`-muokkaimen kanssa sen avulla voidaan rajata kuva vastaavaan muotoon.

## Shape-käsitteen ymmärtäminen

SwiftUI:ssa `Shape` tarkoittaa graafista muotoa. Kuten `View`, se on SwiftUI:ssa erittäin yleisesti käytetty tyyppi.

Yleisiä `Shape`-tyyppejä ovat ympyrä, suorakulmio, pyöristetty suorakulmio, kapseli ja ellipsi. Jotta eri muotojen ulkoasua olisi helpompi tarkastella, seuraavissa esimerkeissä jokaiselle muodolle asetetaan eri väri ja koko.

Näissä esimerkeissä `.fill()` täyttää muodon värillä ja `.frame()` asettaa muodon näyttökoon. Värit ovat vain eri muotojen erottamista varten eivätkä muotojen pysyviä värejä.

### Circle-ympyrä

`Circle` tarkoittaa ympyrää. Sitä käytetään usein avatareissa, pyöreissä painikkeissa, pyöreissä kuvissa ja muissa käyttöliittymätehosteissa.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle-suorakulmio

`Rectangle` tarkoittaa suorakulmiota. Se on yksi perusmuodoista, ja sitä voidaan käyttää myös taustojen, jaettujen alueiden tai tavallisten reunojen tekemiseen.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle-pyöristetty suorakulmio

`RoundedRectangle` tarkoittaa pyöristettyä suorakulmiota. `cornerRadius` määrittää kulmien pyöristyksen koon.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule-kapselimuoto

`Capsule` tarkoittaa kapselimuotoa. Sen molemmat päät ovat kaaria, ja sitä käytetään usein kapselipainikkeissa, tunnisteiden taustoissa ja muissa käyttöliittymätehosteissa.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse-ellipsi

`Ellipse` tarkoittaa ellipsiä. Se muistuttaa `Circle`-muotoa, mutta kun leveys ja korkeus eivät ole samat, se näkyy ellipsinä.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Näistä esimerkeistä näemme, että `Shape` voidaan näyttää suoraan graafisena muotona. Seuraavaksi käytämme näitä `Shape`-tyyppejä yhdessä `clipShape`-muokkaimen kanssa kuvien rajaamiseen eri muotoihin.

## Kuvien rajaaminen clipShape-muokkaimella

Nyt voimme käyttää `clipShape`-muokkainta kuvien rajaamiseen eri muotoihin.

Esimerkiksi ensimmäisen kuvan rajaaminen ympyräksi:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Tämä koodi tarkoittaa: näytä ensin kuva ja rajaa se sitten ympyräksi `Circle()`-muodon avulla.

![view](../../../Resource/032_view2.png)

`clipShape`-muokkaimen perusrakenne on:

```swift
.clipShape(muoto)
```

Lisää näkymän perään `.clipShape(...)` ja kirjoita sulkeiden sisään graafinen muoto, johon haluat rajata näkymän.

Esimerkiksi:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nyt rajataan 5 kuvaa eri muotoihin:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Näyttötulos:

![view](../../../Resource/032_view8.png)

Niistä `Rectangle()`-muodolla rajattu tulos muistuttaa tavallista suorakulmaista kuvaa, joten visuaalinen muutos ei ole ilmeinen. Sitä käytetään pääasiassa vertailuun muiden muotojen kanssa.

Nyt kuvat eivät ole enää vain tavallisia suorakulmioita, vaan niillä on erilaisia muotoja.

## Kuvan reunan lisääminen

Jos haluamme lisätä pyöreään kuvaan reunan, voimme ensin ajatella `border`-muokkaimen käyttöä:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Tällä tavalla saadaan kuitenkin yleensä pyöreän reunan sijaan suorakulmainen reuna.

![view](../../../Resource/032_view9.png)

Tämä johtuu siitä, että `border` lisää reunan näkymän suorakulmaisen alueen mukaan eikä `clipShape`-rajauksen jälkeisen muodon mukaan.

Siksi, jos haluamme pyöreän reunan, emme voi käyttää suoraan `border`-muokkainta.

## Muodon reunan piirtäminen strokeBorder-muokkaimella

SwiftUI:ssa `strokeBorder` voi piirtää sisäreunan näille yleisille `Shape`-tyypeille.

Esimerkiksi pyöreän reunan piirtäminen:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Tämä koodi tarkoittaa: piirrä `Circle`-muodolle ruskea reuna, jonka leveys on `10 pt`.

![view](../../../Resource/032_view12.png)

Tässä on huomattava, että `strokeBorder` ei lisää reunaa suoraan kuvaan, vaan piirtää reunan `Circle()`-graafiselle muodolle.

Toisin sanoen tämä koodi tuottaa vain itsenäisen pyöreän reunan, eikä sillä ole vielä yhteyttä kuvaan.

Jos haluamme näyttää tämän pyöreän reunan kuvan päällä, meidän täytyy jatkaa `overlay`-muokkaimen käyttöä ja asettaa reuna kuvan päälle.

## Reunan asettaminen overlay-muokkaimella

`overlay` on näkymämuokkain, jolla voidaan asettaa uusi näkymä nykyisen näkymän päälle.

Sen perusrakenne voidaan ymmärtää näin:

```swift
Nykyinen näkymä
    .overlay {
        Päälle asetettava näkymä
    }
```

Tässä tapauksessa nykyinen näkymä on kuva, joka on jo rajattu ympyräksi:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Päälle asetettava uusi näkymä on pyöreä reuna:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Siksi voimme yhdistää kuvan ja reunan näin:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Tässä `overlay` tarkoittaa uuden näkymän asettamista nykyisen näkymän päälle.

`overlay`-sisällä reuna asetetaan nykyisen kuvan näyttöalueen mukaan, joten sille ei tarvitse asettaa erillistä `frame`-kokoa. Kun reunan muoto vastaa rajausmuotoa, reuna voi asettua kuvan mukaisesti.

![view](../../../Resource/032_view10.png)

Lopullinen vaikutus on, että pyöreän kuvan päälle asetetaan pyöreä reuna.

`ZStack`-rakenteeseen verrattuna `overlay` sopii paremmin tilanteisiin, joissa nykyiseen näkymään lisätään koriste. Kuva on pääsisältö ja reuna vain lisätehoste, joten `overlay` tekee rakenteesta selkeämmän.

## Kuvagallerian viimeistely

Nyt lisäämme jokaiselle kuvalle vastaavan muodon ja reunan:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Näyttötulos:

![view](../../../Resource/032_view13.png)

Näin valmis on perustason kuvagalleriasivu.

Tällä sivulla käytämme `ScrollView`-näkymää vieritettävän näyttämisen toteuttamiseen, `Image`-näkymää kuvien näyttämiseen, `clipShape`-muokkainta kuvien muotojen rajaamiseen sekä `overlay`- ja `strokeBorder`-muokkaimia reunojen lisäämiseen.

## Koko koodi

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Yhteenveto

Tässä oppitunnissa toteutimme kuvagalleriasivun.

![view](../../../Resource/032_view13.png)

Tässä esimerkissä käytimme ensin `Image`-näkymää kuvien näyttämiseen ja laajensimme sitten `Image`-tyyppiä `extension`-laajennuksella lisäämällä `photoGalleryStyle`-metodin toistuvan kuvatyylikoodin järjestämistä varten.

Seuraavaksi opimme SwiftUI:n yleisistä `Shape`-tyypeistä, kuten `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ja `Ellipse`. Näitä muotoja voidaan paitsi näyttää suoraan, myös käyttää yhdessä `clipShape`-muokkaimen kanssa näkymien rajaamiseen.

Esimerkiksi:

```swift
.clipShape(Circle())
```

tarkoittaa näkymän rajaamista ympyräksi.

Lopuksi käytimme `overlay`- ja `strokeBorder`-muokkaimia vastaavan muotoisten reunojen lisäämiseen kuviin. On tärkeää huomata, että `border` piirtää reunan yleensä näkymän suorakulmaisen alueen mukaan. Jos haluat, että reuna seuraa ympyrää, kapselia tai ellipsiä, on sopivampaa asettaa sama `Shape` päälle.

Tämän oppitunnin avulla emme ainoastaan toteuttaneet kuvagalleriatehostetta, vaan myös ymmärsimme `Shape`-, `clipShape`-, `strokeBorder`- ja `overlay`-muokkainten yleisen yhdistelmän käyttöliittymissä.

## Harjoitukset oppitunnin jälkeen

### 1. Lisää kuvagallerian tausta

Lisää kuvagalleriasivulle koko näytön taustakuva.

Vaatimus: taustakuvan tulee täyttää koko näyttö ja ohittaa turvallinen alue.

### 2. Liukuvärireuna

Muuta nykyiset yksiväriset reunat lineaarisiksi liukuvärireunoiksi.

Voit kokeilla `LinearGradient`-rakennetta rikkaampien reunatehosteiden toteuttamiseen.

### 3. Simuloitu valokuvakehys

Etsi verkosta oikeiden valokuvakehysten tyylejä ja kokeile käyttää `overlay`-muokkainta kuvakehysten asettamiseen päälle, jotta kuvat näyttävät enemmän oikeilta kehystetyiltä kuvilta.

Harjoituksen näyttötulos:

![button](../../../Resource/032_view15.jpeg)

### 4. Toteuta pyöristetyn painikkeen reuna

Varsinaisessa kehityksessä painikkeissa käytetään usein pyöristetyn suorakulmion reunoja.

Kokeile tehdä pyöristetty painike ja lisää siihen pyöristetty reuna `RoundedRectangle`- ja `strokeBorder`-muokkainten avulla.

Harjoituksen näyttötulos:

![button](../../../Resource/032_view14.png)

### Pohdintakysymys

Jos et halua käyttää yksiväristä reunaa etkä liukuvärireunaa, vaan haluat reunan näyttävän jonkinlaiselta kuviolta, miten se pitäisi toteuttaa?

Voit kokeilla etsiä tietoa ja tutustua esimerkiksi `overlay`-, `mask`- tai `ImagePaint`-käyttötapoihin.

Harjoituksen näyttötulos:

![button](../../../Resource/032_view16.png)
