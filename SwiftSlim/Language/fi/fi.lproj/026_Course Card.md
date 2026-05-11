# Kurssikortti

Tämä oppitunti on vaiheen kertausoppitunti. Toteutamme siinä “kurssikortin”.

Tämän harjoituksen avulla voimme kerrata aiemmin opittuja asioita, kuten `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()` ja `.cornerRadius()`, sekä oppia, miten useita pieniä näkymiä yhdistetään kokonaiseksi näkymämoduuliksi.

Kurssikortin lopputulos:

![view](../../../Resource/026_view.png)

Tämä kurssikortti sisältää pääasiassa seuraavat osat:

- Kurssitaso: `Aloittelija`
- Kurssin sisältö: `20+ oppituntia`
- Kurssin otsikko: `SwiftUI-opas aloittelijoille`
- Kurssin kuvaus
- Painike: `Aloita opiskelu`
- Kurssin tausta: Swift-kuvake ja indigonsininen tausta

Voimme toteuttaa tämän näkymän `ContentView`-rakenteessa.

## Yläalue

Luodaan ensin kurssikortin yläalue.

![view](../../../Resource/026_view1.png)

Yläalueen vasemmalla puolella näytetään kurssitaso ja oikealla puolella kurssin sisältö.

Koska nämä kaksi sisältöä asetetaan vaakasuunnassa, voimme käyttää `HStack`-rakennetta.

```swift
var topView: some View {
    HStack {
        Text("Aloittelija")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ oppituntia")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Tässä jaamme yläalueen lasketuksi ominaisuudeksi:

```swift
var topView: some View
```

Tämän etuna on, että `body` pysyy selkeämpänä.

Yläalueessa käytetään pääasiassa seuraavia asioita:

- `HStack`: asettaa kaksi tekstinäkymää vaakasuunnassa.
- `Text`: näyttää tekstisisällön.
- `Spacer()`: työntää vasemman tekstin vasemmalle ja oikean tekstin oikealle.
- `.font(.footnote)`: asettaa pienemmän tekstityylin.
- `.fontWeight(.bold)`: lihavoi tekstin.
- `.foregroundStyle(Color.white)`: asettaa etualan väriksi valkoisen.
- `.padding(.vertical, 10)`: asettaa pystysuuntaisen sisäisen välin.
- `.padding(.horizontal, 16)`: asettaa vaakasuuntaisen sisäisen välin.
- `.background(Color.white.opacity(0.15))`: asettaa läpikuultavan valkoisen taustan.
- `.cornerRadius(20)`: asettaa kulmien pyöristyksen.

Tässä `Aloittelija` käyttää `.padding()`-muokkainta kahdessa suunnassa:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Näin teksti saa tilaa sekä pysty- että vaakasuunnassa, jolloin se näyttää enemmän tunnisteelta.

`Color.white.opacity(0.15)` tarkoittaa valkoista väriä, jonka peittävyys on `15%`, eli hyvin vaaleaa valkoista.

### Lisää kortin tausta

Aiemmin loimme `topView`-näkymän, mutta pelkkä näkymän luominen ei näytä sitä automaattisesti.

SwiftUI:ssa ruudulla oikeasti näkyvä sisältö täytyy kirjoittaa `body`-osaan.

Siksi voimme ensin sijoittaa `topView`-näkymän `body`-osaan ja näyttää sen:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Tässä vaiheessa näet, että yläalue on jo näkyvissä:

![view](../../../Resource/026_view2.png)

Koska `topView`-näkymän teksti on kuitenkin valkoinen ja oletustausta on myös vaalea, sitä ei välttämättä näe selvästi vaaleassa tilassa.

Siksi voimme lisätä ulkopuolelle `VStack`-rakenteen ja asettaa koko alueelle sisäisen välin, taustavärin ja kulmien pyöristyksen:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Näyttövaikutus:

![view](../../../Resource/026_view3.png)

Tässä `VStack` sisältää tällä hetkellä vain yhden `topView`-näkymän, joten se voi näyttää tarpeettomalta.

Myöhemmin lisäämme kuitenkin kurssin otsikon, kurssin kuvauksen ja painikealueen. Ne ovat kaikki pystysuuntaisesti järjestettyä sisältöä, joten `VStack`-rakenteen käyttäminen tässä etukäteen helpottaa näkymien yhdistämistä myöhemmin.

Tässä on kaksi `.padding()`-muokkainta, ja niiden tehtävät ovat erilaiset.

Ensimmäinen `.padding(20)` kirjoitetaan ennen `.background()`-muokkainta:

```swift
.padding(20)
.background(Color.indigo)
```

Se hallitsee kortin sisäistä väliä eli sisällön ja taustan reunan välistä etäisyyttä.

Toinen `.padding(30)` kirjoitetaan `.background()`-muokkaimen jälkeen:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Se hallitsee kortin ulkoista väliä eli koko kortin ja näytön reunan välistä etäisyyttä.

![view](../../../Resource/026_view4.png)

Vaikka molemmat ovat siis `.padding()`-muokkaimia, niiden sijoittaminen eri kohtiin tuottaa erilaisen vaikutuksen.

## Sisältöalue

Seuraavaksi luodaan kurssikortin sisältöalue.

Näyttövaikutus:

![view](../../../Resource/026_view5.png)

Sisältöalue sisältää kurssin otsikon ja kurssin kuvauksen. Ne asetetaan pystysuunnassa, joten käytämme `VStack`-rakennetta.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI-opas aloittelijoille")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Aloita nollasta SwiftUI:n parissa ja opi järjestelmällisesti Applen deklaratiivista käyttöliittymäkehitystä. Selkeiden selitysten ja käytännön esimerkkien avulla hallitset vähitellen asettelun, vuorovaikutuksen ja tilanhallinnan sekä rakennat kauniita ja hyödyllisiä sovelluskäyttöliittymiä.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Näyttövaikutus:

![view](../../../Resource/026_view6.png)

Tässä `VStack`-rakenteessa käytetään kahta parametria:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` tarkoittaa, että `VStack`-rakenteen sisällä olevat näkymät tasataan aloitusreunaan.

`spacing: 10` tarkoittaa, että `VStack`-rakenteen sisällä olevien näkymien väliin jää `10 pt` väli.

Näin kurssin otsikko ja kurssin kuvaus alkavat vasemmalta puolelta ja niiden väliin jää tietty etäisyys.

Kurssin kuvaus on melko pitkä. Jos se näytetään kokonaan, kortista tulee hyvin korkea, joten tässä käytetään `.lineLimit()`-muokkainta näytettävien rivien määrän rajoittamiseen:

```swift
.lineLimit(3)
```

Se tarkoittaa, että enintään `3` riviä näytetään. Kun sisältö ylittää rivirajoituksen, ylimääräinen osa jätetään pois.

### Tasaa näkymä vasemmalle

Tässä on vielä yksi huomioitava kohta.

`VStack(alignment: .leading)` voi hallita vain `VStack`-rakenteen sisällä olevien näkymien tasausta. Se ei suoraan hallitse itse `VStack`-rakenteen sijaintia ulkoisessa säilössä.

Esimerkiksi jos kurssin kuvaus on melko lyhyt:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI-opas aloittelijoille")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Vain vähän sisältöä.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Näyttövaikutus:

![view](../../../Resource/026_view7.png)

Voit nähdä, että vaikka kurssin otsikko ja kurssin kuvaus ovat `VStack`-rakenteen sisällä vasemmalle tasattuja, koko `VStack` ei ole kortin vasemmassa reunassa.

Tämä johtuu siitä, että kun sisältö on lyhyt, myös `VStack`-rakenteen leveys muuttuu suhteellisen kapeaksi. Kun ulompi säilö asettelee sisältöä, se saattaa sijoittaa tämän kapeamman `VStack`-rakenteen keskelle.

Asian voi ymmärtää näin: `VStack(alignment: .leading)` vastaa sisäisestä vasemmalle tasauksesta.
Mutta se ei vastaa koko sisältöalueen työntämisestä aivan vasemmalle.

Jos haluamme, että koko sisältöalue todella tasautuu vasemmalle, voimme kääriä sen vielä yhteen `HStack`-rakenteeseen ja lisätä `Spacer()`-näkymän:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI-opas aloittelijoille")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Vain vähän sisältöä.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Näyttövaikutus:

![view](../../../Resource/026_view8.png)

Tässä `HStack` on vaakasuuntainen asettelu.

`Spacer()` varaa oikealla jäljellä olevan tilan ja työntää vasemmalla olevan `VStack`-rakenteen aivan vasemmalle.

Siksi `HStack + Spacer()`-yhdistelmää voidaan käyttää koko sisältöalueen sijainnin hallintaan.

Varsinaisessa kurssikortissa kurssin kuvaus on melko pitkä ja vie yleensä enemmän leveyttä, joten tämä ongelma ei välttämättä ole ilmeinen. Tämän eron ymmärtäminen on kuitenkin tärkeää, koska vastaavia tilanteita tulee usein vastaan myöhemmin lyhyiden tekstiasettelujen tekemisessä.

### Hallitse sisäisten näkymien välistä etäisyyttä

Aiemmin kirjoitimme `VStack`-rakenteeseen `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing`-parametria käytetään sisäisten näkymien välisen etäisyyden hallintaan.

Jos `spacing`-parametria ei aseteta, myös `VStack`-rakenteella on oletusväli, mutta oletusväli ei välttämättä vastaa haluamaamme vaikutusta.

Tässä kurssin otsikko ja kurssin kuvaus näyttävät ahtailta, jos ne ovat liian lähellä toisiaan, joten käytämme:

```swift
spacing: 10
```

Näin niiden väliin jää hieman tilaa.

Näyttövaikutus:

![view](../../../Resource/026_view9.png)

Samoin yläalue ja sisältöalue asetetaan myös pystysuunnassa, joten `spacing`-parametria voidaan käyttää myös niiden välisen etäisyyden hallintaan.

Sijoitetaan nyt `topView` ja `contentView` `body`-osaan:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Näyttövaikutus:

![view](../../../Resource/026_view10.png)

Tässä `VStack(spacing: 20)` hallitsee `topView`- ja `contentView`-näkymien välistä etäisyyttä.

Toisin sanoen:

```swift
VStack(alignment: .leading, spacing: 10)
```

Hallitsee kurssin otsikon ja kurssin kuvauksen välistä etäisyyttä.

```swift
VStack(spacing: 20)
```

Hallitsee yläalueen ja sisältöalueen välistä etäisyyttä.

Molemmat ovat `spacing`-parametreja, mutta ne vaikuttavat eri `VStack`-säilöihin, joten myös vaikutusalue on erilainen.

Näin sisältöalueen näkymä on valmis.

## Painikealue

Seuraavaksi luodaan alareunan painikealue.

Näyttövaikutus:

![view](../../../Resource/026_view11.png)

Painikealue koostuu pääasiassa toistokuvakkeesta ja tekstistä.

Voimme näyttää toistokuvakkeen `Image`-näkymällä ja painiketekstin `Text`-näkymällä.

Luodaan tässä ensin painikkeen ulkoasu:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("painiketta napautettiin")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Aloita opiskelu")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Näyttövaikutus:

![view](../../../Resource/026_view12.png)

Tässä käytetään kahta `HStack`-säilöä:

Sisempi `HStack` järjestää kuvakkeen ja tekstin vaakasuunnassa:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Aloita opiskelu")
}
```

Ulompi `HStack` yhdessä `Spacer()`-näkymän kanssa asettaa painikkeen ulkoasun vasemmalle:

```swift
HStack {
    ...
    Spacer()
}
```

Kun painiketta napautetaan, konsoli tulostaa `painiketta napautettiin`.

## Peruskortti valmis

Yhdistetään nyt yläalue, sisältöalue ja painikealue:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Näyttövaikutus:

![view](../../../Resource/026_view13.png)

Tässä vaiheessa perusmuotoinen kurssikortti on valmis.

## Swift-kuvakkeen tausta

Lisätään lopuksi korttiin läpikuultava Swift-kuvaketausta.

![view](../../../Resource/026_view.png)

Aiemmin käytimme `Color.indigo`-väriä taustavärinä. Itse asiassa `.background()` voi värin lisäämisen lisäksi lisätä myös kokonaisen näkymän.

Siksi voimme ensin luoda erillisen taustanäkymän:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Tässä taustanäkymässä käytämme `VStack`-, `HStack`- ja `Spacer()`-rakenteita työntämään Swift-kuvakkeen oikeaan alakulmaan.

Koska Swift-kuvake toimii vain koristeellisena taustana, tässä käytetään läpikuultavaa valkoista:

```swift
Color.white.opacity(0.15)
```

Näin kuvake ei ole liian hallitseva eikä häiritse edessä olevaa tekstisisältöä.

Seuraavaksi lisätään `backgroundView` korttiin:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Lopputulos:

![view](../../../Resource/026_view14.png)

Tässä käytetään peräkkäin kahta `.background()`-muokkainta:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Ensimmäinen `.background()` lisää Swift-kuvakkeen taustan.
Toinen `.background()` lisää indigonsinisen taustan.

Näin Swift-kuvake näkyy indigonsinisen taustan päällä ja osana kortin taustaa.

Tästä näemme, että `.background()` voi lisätä värien lisäksi myös mukautettuja näkymiä. Useita `.background()`-muokkaimia voidaan myös yhdistää rikkaampien taustatehosteiden luomiseen.

Tässä vaiheessa kokonainen kurssikortti on valmis.

## Yhteenveto

Tällä oppitunnilla kertasimme SwiftUI:n yleisiä perusasettelutapoja kurssikortin avulla.

Käytimme `Text`-näkymää tekstin näyttämiseen, `Image`-näkymää järjestelmäkuvakkeen näyttämiseen sekä `VStack`-, `HStack`- ja `Spacer()`-rakenteita näkymien asettelun hallintaan.

Opimme `.lineLimit()`-muokkaimen, jolla voidaan rajoittaa tekstin enimmäisrivimäärää. Kun sisältö ylittää rajan, ylimääräinen osa jätetään pois.

Samalla kertasimme myös yleisiä muokkaimia, kuten `.padding()`, `.background()`, `.cornerRadius()` ja `.foregroundStyle()`.

Tämän oppitunnin jälkeen osaamme jo yhdistää useita pieniä näkymiä kokonaiseksi korttimoduuliksi.

Tämä on myös hyvin yleinen ajattelutapa SwiftUI-kehityksessä: jaa näkymät ensin pieniin osiin ja yhdistä ne sitten kokonaiseksi käyttöliittymäksi.

## Täydellinen koodi

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Aloittelija")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ oppituntia")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI-opas aloittelijoille")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Aloita nollasta SwiftUI:n parissa ja opi järjestelmällisesti Applen deklaratiivista käyttöliittymäkehitystä. Selkeiden selitysten ja käytännön esimerkkien avulla hallitset vähitellen asettelun, vuorovaikutuksen ja tilanhallinnan sekä rakennat kauniita ja hyödyllisiä sovelluskäyttöliittymiä.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("painiketta napautettiin")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Aloita opiskelu")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
