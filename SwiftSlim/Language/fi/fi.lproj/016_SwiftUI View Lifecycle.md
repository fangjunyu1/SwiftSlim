# SwiftUI-näkymän elinkaari

Edellisessä luvussa opimme, että `@State`-muuttujat seuraavat näkymän elinkaarta, ja tutustuimme myös `onAppear`-toiminnon peruskäyttöön.

Tässä luvussa syvennämme ymmärrystä SwiftUI-näkymien elinkaaresta: opimme, miten näkymä luodaan ja näytetään, miten näkymän muuttujat syntyvät ja rakentuvat uudelleen, ja lisäksi tutustumme `onAppear`-, `onDisappear`- ja `init`-rakentajaan.

Näiden tietojen avulla muodostamme kokonaiskuvan siitä, miten SwiftUI-näkymä rakentuu.

## Sovelluksen käynnistysjärjestys

Kun luot iOS-projektin, Xcode generoi oletuksena kaksi tiedostoa:

```
ContentView.swift
projektin nimi + App.swift
```

Näistä `"projektin nimi + App".swift` on koko sovelluksen sisääntulotiedosto.

Esimerkiksi:

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

### Koodin suoritusvirta

Kun käynnistämme sovelluksen simulaattorissa tai oikealla laitteella, järjestelmä etsii ensin `@main`-avainsanan:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Kun sisääntulotiedosto on tunnistettu, koodin suoritus alkaa.

Ensin siirrytään `App`-rakenteeseen ja suoritetaan sen `body`-lohkon koodi. Sen jälkeen luodaan `WindowGroup` ja sen sisällä oleva `ContentView` ladataan.

### `WindowGroup`in tehtävä

`WindowGroup`-rakenne huolehtii ikkunoiden hallinnasta:

```swift
WindowGroup {
    ContentView()
}
```

iPad- ja macOS-järjestelmät tukevat useita ikkunoita, kun taas iPhonessa on yleensä vain yksi ikkuna.

Siksi `WindowGroup` hallitsee iPhonessa pääasiassa ensimmäistä näkyvää käyttöliittymää.

### Näkymän latausprosessi

Kun järjestelmä löytää `ContentView`-näkymän:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI suorittaa `body`-koodin, rakentaa palautetun näkymärakenteen kuten `VStack`in ja `Text`-näkymän perusteella käyttöliittymän ja näyttää sen ruudulla.

Kun nämä vaiheet on tehty, voimme nähdä `ContentView`-näkymän ruudulla.

![ContentView](../../Resource/016_view1.png)

On tärkeää huomata, että `body`n tehtävä on tuottaa näkymä, ei tallentaa sitä.

Tämä tarkoittaa, että aina kun näkymä päivittyy, SwiftUI laskee `body`n uudelleen ja luo uuden näkymärakenteen.

### Esikatselun logiikka

Xcoden esikatselu (`Canvas`) ja sovelluksen oikea ajo ovat kaksi eri mekanismia.

Jos esimerkiksi lisäät sisääntulotiedostoon debug-tulosteen:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Kun esikatselet `ContentView`-näkymää Xcodessa, suoritus ei ala `@main`-sisääntulosta, joten sisääntulotiedoston `onAppear` ei käynnisty.

Mutta jos ajat sovelluksen simulaattorissa tai oikealla laitteella, järjestelmä alkaa suorittaa sitä `@main`-kohdasta, käy läpi koko sovelluksen suorituspolun ja käynnistää sisääntulon `onAppear`-toiminnon sekä tulostaa debug-tiedot.

Olennaista on se, että Xcoden esikatselu on vain "paikallinen renderöinti", jonka tehtävä on näyttää nykyinen näkymä. Simulaattori ja oikea laite tarjoavat puolestaan "täyden ajoympäristön", jossa koko sovellus suoritetaan.

Siksi sovelluksen toimintoja testatessa simulaattori tai oikea laite on luotettavampi kuin Xcoden esikatselu, joka ei pysty tarjoamaan täydellistä ajoympäristöä.

## Näkymän elinkaari

Nykyisessä vaiheessa kaikki koodimme on keskittynyt `ContentView`-näkymään. Todellisissa sovelluksissa yksi appi sisältää kuitenkin yleensä useita näkymiä, joiden välillä vaihdellaan eri tilanteissa.

Esimerkiksi säästöpossussa:

![PiggyBank](../../Resource/016_view.png)

Kun käyttäjä painaa "Talleta", näytetään `SaveView`-näkymä. Kun talletus on valmis tai näkymä suljetaan, `SaveView` poistetaan.

Tämä on näkymän elinkaari: näkymä luodaan, näytetään ja lopulta poistetaan.

### Sovelluksen sulkeminen

Kun sovellus suljetaan, kaikki näkymät poistetaan ja niihin liittyvä tila katoaa.

Siksi sekä `ContentView` että muut näkymät poistuvat muistista, ja koko sovelluksen ajonaikainen tila tyhjentyy.

## Näkymän muuttujien elinkaari

SwiftUI:ssa muuttujien elinkaari on yleensä sidottu näkymään.

Esimerkiksi:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State`-muuttuja

`@State`-määritelty muuttuja on sidottu näkymän elinkaareen.

```swift
@State private var name = "FangJunyu"
```

Kun näkymä luodaan, myös `name` syntyy. Kun näkymä poistetaan, myös `name` tuhoutuu.

Tämän vuoksi datan pysyvään tallennukseen tarvitaan `UserDefaults`in kaltaisia ratkaisuja.

### `body`n sisällä olevat muuttujat

`body`n sisällä määritelty muuttuja:

```swift
var num = 10
```

Sen elinkaari on sidottu `body`n suorittamiseen.

Kun SwiftUI:n tila muuttuu, esimerkiksi:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Kun `name` muuttuu, `@State` havaitsee muutoksen ja ilmoittaa siitä SwiftUI:lle, joka laskee näkymän uudelleen ja suorittaa `body`n uudestaan.

Kun `body` lasketaan uudelleen, kaikki sen sisällä oleva koodi suoritetaan taas, ja `body`n sisäiset muuttujat kuten `num` luodaan uudelleen.

Siksi monimutkaisia muuttujia ei suositella määrittelemään `body`n sisälle.

Koska `body`n sisäiset muuttujat luodaan jokaisella päivityksellä uudelleen, se lisää laskentakustannuksia ja voi vaikuttaa suorituskykyyn.

SwiftUI:ssa erityyppistä dataa kannattaa hallita eri tavoilla: näkymän elinkaarta seuraava data voidaan tallentaa `@State`-muuttujaan, kun taas väliaikainen laskettu data voidaan sijoittaa `body`n sisälle.

## `onAppear` ja `onDisappear`

Edellisessä luvussa opimme jo `onAppear`-toiminnon, joka kutsutaan silloin, kun näkymä ilmestyy.

```swift
.onAppear {}
```

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Xcoden esikatselussa tai ajon aikana voit nähdä `onAppear`-sisällön debug-tulosteen.

### `onDisappear`

`onAppear`-toimintoa vastaava toinen toiminto on `onDisappear`:

```swift
.onDisappear {}
```

Kun näkymä suljetaan, `onDisappear` kutsutaan.

Esimerkiksi:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Kun näkymä poistetaan, `onDisappear`-lohkon koodi suoritetaan.

Vinkki: tässä vaiheessa käytössä oleva `ContentView` on sovelluksen juurinäkymä, joten sitä ei voida sulkea tai poistaa suoraan. Siksi `onDisappear`-toimintoa ei vielä tässä vaiheessa voi nähdä käytännössä.

Kun myöhemmin opimme sivunvaihtoja ja uusien näkymien avaamista, `onDisappear`-kutsu tulee näkyväksi.

## Luonti- ja näyttölogiikka

On tärkeää huomata, että näkymän luominen ja näyttäminen ovat kaksi eri vaihetta.

Kun näkymä luodaan, rakenteen konstruktori suoritetaan:

```swift
init() {}
```

Koska SwiftUI-näkymä on `struct`:

```swift
struct ContentView: View { ... }
```

Kun näkymäolio luodaan, suoritetaan `init`-konstruktori. Vasta kun näkymä näytetään, kutsutaan `onAppear`.

Esimerkiksi:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Kun näkymää esikatsellaan Xcodessa, debug-tuloste näyttää:

```swift
Create ContentView
Show ContentView
```

Tämä osoittaa, että ensin suoritetaan `init`, jolla näkymä luodaan, sitten lasketaan `body`n sisältö ja lopuksi näkymä näytetään ja `onAppear` suoritetaan.

Siksi on tärkeää ymmärtää, että näkymän luonti- ja näyttövaihe ovat erillisiä.

### `init`-konstruktori

`init` on Swiftin perussyntaksia. Sen voi määritellä sekä `struct`- että `class`-tyypeille, ja sitä käytetään olion alustamiseen.

```swift
init() {}
```

SwiftUI:ssa järjestelmä kutsuu näkymän `init`-metodia, kun näkymä luodaan. Sitä voidaan käyttää parametrien vastaanottamiseen ja datan alustamiseen.

Jos `init`-konstruktoria ei kirjoiteta käsin, Swift luo `struct`-tyypille automaattisesti oletusrakentajan.

`ContentView`n kaltaisissa SwiftUI-näkymissä näkymä luotaessa suoritetaan `init`, ja näkymä näytettäessä suoritetaan `onAppear`.

Siksi `init` on konstruktori, joka suoritetaan näkymän luontivaiheessa. Sitä hyödynnetään myöhemmin esimerkiksi parametrien välittämiseen ja datan alustamiseen.

## Yhteenveto

Tässä luvussa opimme sovelluksen käynnistysjärjestyksen sisääntulotiedostosta `ContentView`-tiedoston suoritusvirtaan.

Tutustuimme SwiftUI-näkymän elinkaareen: näkymän luontivaiheessa suoritetaan `init`, näkymän ilmestyessä ruudulle suoritetaan `onAppear`, ja näkymän sulkeutuessa tai poistuessa suoritetaan `onDisappear`.

Opimme myös näkymän päivitysmekanismin: näkymä on tilavetoisesti rakennettu, joten kun `@State` tai muu tila muuttuu, SwiftUI päivittää näkymän, laskee `body`n uudelleen ja myös `body`n sisällä olevat muuttujat luodaan uudestaan.

Muuttujien elinkaari on sidottu näkymän elinkaareen, kun taas `body`n sisäiset väliaikaiset muuttujat luodaan uudelleen jokaisella päivityksellä.

Näiden elinkaarien ja muuttujakäyttäytymisen ymmärtäminen auttaa järjestämään koodia paremmin ja tekee sovelluslogiikasta selkeämpää.
