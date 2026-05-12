# Xcode-tiedostojen hallinta

Tässä oppitunnissa opimme Xcoden yleisiä tiedostotoimintoja.

Aiemmissa oppitunneissa kirjoitimme suurimman osan koodista `ContentView`-näkymään. Näin koodia ja sen näyttötulosta on helpompi tarkastella.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Oikeassa sovelluksessa kaikkea koodia ei kuitenkaan yleensä laiteta yhteen tiedostoon.

Kun sivuja, komponentteja ja toimintoja tulee yhä enemmän, meidän täytyy jakaa eri näkymät eri SwiftUI-tiedostoihin.

Esimerkiksi:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Näin koodin rakenne on selkeämpi, ja myöhempi ylläpito sekä muokkaaminen on helpompaa.

## Miksi tiedostoja pitää hallita

SwiftUI:ssa sivu tai komponentti voidaan yleensä kirjoittaa omaksi erilliseksi näkymätiedostokseen.

Esimerkiksi:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Tässä `CardView` on SwiftUI-näkymä.

Jos kaikki näkymät kirjoitetaan `ContentView`-näkymän sisään, koodista tulee vähitellen pidempää ja vaikeammin luettavaa.

Siksi meidän täytyy opetella luomaan, nimeämään uudelleen ja poistamaan tiedostoja sekä käyttämään kansioita eri kooditiedostojen hallintaan.

## SwiftUI-tiedoston luominen

Xcodessa SwiftUI-tiedoston luomiseen on yleensä kaksi tavallista tapaa:

Yksi tapa on luoda tyhjä tiedosto ja kirjoittaa koodi itse.

Toinen tapa on luoda SwiftUI-mallitiedosto, jolloin Xcode luo peruskoodin automaattisesti.

Aloittelijoille suositellaan enemmän SwiftUI-mallitiedoston käyttöä, koska se luo perusrakenteen automaattisesti.

### Tyhjän tiedoston luominen

Napsauta Xcoden vasemman reunan Navigator-alueella tyhjää kohtaa tai kansiota hiiren oikealla painikkeella ja valitse `New Empty File`.

Toiminnon sijainti näkyy alla:

![xcode](../../../Resource/027_view1.png)

Kun tyhjä tiedosto on luotu, Xcode luo yleensä nimeämättömän Swift-tiedoston, kuten `Untitled.swift`.

Voimme nimetä sen uudelleen nimellä `TestView.swift`.

SwiftUI-projektissa, jos tätä tiedostoa käytetään näkymän näyttämiseen, nimen loppuun kannattaa yleensä lisätä `View`.

Esimerkiksi:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Tämä ei ole pakollinen sääntö, mutta sen avulla näemme yhdellä silmäyksellä, että kyseessä on näkymätiedosto.

Tyhjän tiedoston luomisen jälkeen tiedostossa voi olla vain oletuskommentteja tai se voi olla tyhjä. Tämä riippuu Xcoden versiosta ja luontitavasta.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Tässä vaiheessa meidän täytyy kirjoittaa SwiftUI-koodi käsin:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Näin yksinkertainen SwiftUI-näkymätiedosto on luotu.

### Tiedoston nimeäminen uudelleen

Jos haluat muuttaa tiedoston nimeä sen luomisen jälkeen, voit valita tiedoston Xcoden vasemman reunan Navigator-alueella ja painaa Enter-näppäintä `⏎`.

![xcode](../../../Resource/027_view2.png)

Näin tiedoston nimeä voi muuttaa.

On tärkeää huomata, että tiedoston nimen muuttaminen ei muuta automaattisesti koodissa olevaa näkymän nimeä.

Esimerkiksi kun tiedoston nimeksi on muutettu `ProfileView.swift`, koodissa voi silti olla `struct TestView: View`.

Tämä ei välttämättä aiheuta virhettä, mutta se voi helposti aiheuttaa sekaannusta.

Siksi on suositeltavaa pitää tiedoston nimi ja näkymän nimi yhtenäisinä. Jos tiedoston nimi on esimerkiksi `ProfileView.swift`, myös näkymän nimenä kannattaa käyttää `ProfileView`.

## SwiftUI-mallitiedoston luominen

Tyhjän tiedoston luomisen lisäksi voimme myös luoda SwiftUI-mallitiedoston suoraan.

Napsauta Xcoden vasemman reunan Navigator-alueella tyhjää kohtaa tai kansiota hiiren oikealla painikkeella ja valitse `New File from Template...`.

Toiminnon sijainti näkyy alla:

![xcode](../../../Resource/027_view3.png)

Avautuvan ikkunan yläosassa voit valita eri alustoja, kuten `iOS`, `macOS` ja muita.

Tässä pidetään valittuna nykyistä projektia vastaava alusta. Jos esimerkiksi olemme luomassa iOS Appia, valitaan `iOS`.

![xcode](../../../Resource/027_view4.png)

Valitse sitten alhaalta `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Napsauta sitten `Next`, kirjoita tiedoston nimi ja tallenna se.

Luodaan esimerkiksi tiedosto `Test2View.swift`.

Xcode luo automaattisesti seuraavan kaltaista koodia:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Tyhjään tiedostoon verrattuna mallitiedosto sisältää automaattisesti kohdat `import SwiftUI`, `struct`, `body` ja `#Preview`.

Aloittelijalle SwiftUI-mallitiedoston käyttö on siis yksinkertaisempaa, ja tarvittavaa koodia jää harvemmin puuttumaan.

**Vinkki**: Tiedoston luomisen hiiren oikealla painikkeella lisäksi voit myös napsauttaa Xcoden vasemman reunan Navigator-alueen alaosassa olevaa plus-painiketta ja luoda tiedoston tai kansion.

![xcode](../../../Resource/027_view5.png)

## Kansion luominen

Kun tiedostoja tulee yhä enemmän, voimme käyttää kansioita niiden hallintaan.

Napsauta Xcoden vasemman reunan Navigator-alueella tyhjää kohtaa tai kansiota hiiren oikealla painikkeella ja valitse `New Folder`.

Kun kansio on luotu, voit vetää siihen liittyvät tiedostot kansion sisään.

![xcode](../../../Resource/027_view7.png)

Kansioita käytetään pääasiassa projektin rakenteen järjestämiseen. Ne eivät muuta sitä, miten itse näkymää käytetään.

Kunhan näkymän nimi on oikein, sitä voi edelleen käyttää muissa tiedostoissa esimerkiksi muodossa `TestView()` tai `Test2View()`.

## Tiedoston tai kansion poistaminen

Jos haluat poistaa tiedoston tai kansion, voit valita vastaavan tiedoston Xcoden vasemman reunan Navigator-alueella, napsauttaa hiiren oikealla painikkeella ja valita `Delete`.

Voit myös valita tiedoston ja painaa Delete-näppäintä `⌫`.

Xcode näyttää poiston vahvistusikkunan.

![xcode](../../../Resource/027_view10.png)

Valitse `Move to Trash`, jos haluat siirtää tiedoston Roskakoriin.

Jos näet vaihtoehdon `Remove Reference`, se tarkoittaa, että vain viittaus poistetaan Xcode-projektista, mutta levyllä olevaa alkuperäistä tiedostoa ei poisteta.

Aloittelijalle, jos poistat vain juuri luomasi tavallisen tiedoston, valinta `Move to Trash` yleensä riittää.

## Useiden SwiftUI-näkymien näyttäminen

Kun olemme oppineet luomaan tiedostoja, voimme jakaa eri näkymät eri tiedostoihin.

Esimerkiksi luomme kaksi SwiftUI-tiedostoa:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` käytetään kirjoittajan nimen näyttämiseen:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` käytetään kortin taustan näyttämiseen:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Sitten voimme käyttää näitä kahta näkymää `ContentView`-näkymässä:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Kun sovellus suoritetaan, näet, että `CardView` ja `AuthorView` yhdistetään ja näytetään yhdessä:

![xcode](../../../Resource/027_view11.png)

Tässä tuloksessa `CardView` toimii taustana, ja `AuthorView` näytetään sen yläpuolella. Tämä johtuu siitä, että ne on sijoitettu `ZStack`-rakenteen sisään.

`ContentView`-näkymässä käytämme näitä kahta näkymää muodoilla `CardView()` ja `AuthorView()`. Nimen perässä oleva `()` tarkoittaa tämän näkymän luomista ja käyttämistä.

Tämä on SwiftUI:ssa tavallista näkymien sisäkkäisyyttä: yhden näkymän sisällä voidaan edelleen käyttää muita näkymiä.

## Aloitustiedosto

Lopuksi kerrataan, mistä sovellus alkaa näyttää käyttöliittymää.

SwiftUI-projektissa on yleensä aloitustiedosto:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Tässä `@main` tarkoittaa, että tämä on sovelluksen aloituskohta.

`WindowGroup`-rakenteen sisällä näemme:

```swift
ContentView()
```

Tämä tarkoittaa, että sovelluksen käynnistyttyä se näyttää ensin `ContentView`-näkymän.

Sen jälkeen `ContentView` näyttää sisällään myös:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Näkymähierarkian voi siis ymmärtää näin:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Jos muutamme aloitustiedostossa näytettäväksi näkymäksi `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Silloin sovelluksen käynnistyttyä se näyttää vain `CardView`-näkymän.

Toisin sanoen aloituskoodin `WindowGroup` määrittää, mikä näkymä näytetään ensimmäisenä sovelluksen käynnistymisen jälkeen.

Tämän näkymän sisällä voidaan puolestaan edelleen näyttää muita näkymiä.

## Yhteenveto

Tässä oppitunnissa opimme Xcoden yleisiä tiedostonhallintatoimintoja.

Opimme, miten SwiftUI-tiedostoja luodaan, miten tiedostoja nimetään uudelleen, miten kansioita luodaan ja miten tiedostoja poistetaan.

Samalla opimme myös tärkeän käsitteen: SwiftUI-näkymät voidaan jakaa eri tiedostoihin ja käyttää sitten muiden näkymien sisällä.

Esimerkiksi:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Tässä `CardView()` ja `AuthorView()` ovat muita näkymiä, joita käytetään `ContentView`-näkymän sisällä.

Lopuksi kertasimme myös aloitustiedoston näyttölogiikan.

Kun sovellus käynnistyy, se siirtyy ensin `@main`-merkinnällä merkittyyn aloituskoodiin ja näyttää sitten `WindowGroup`-rakenteen sisällä olevan näkymän.

Tämä auttaa ymmärtämään, että eri SwiftUI-tiedostot eivät ole toisistaan erillisiä. Ne voidaan yhdistää toisiinsa, ja lopulta ne muodostavat kokonaisen sovelluksen käyttöliittymän.
