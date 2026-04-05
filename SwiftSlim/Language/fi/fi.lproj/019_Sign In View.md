# Kirjautumisnäkymä

Tässä oppitunnissa opimme erittäin käytännöllisen tilanteen: kirjautumisnäkymän.

Olipa kyseessä verkkosivusto tai sovellus, käytön aikana käyttäjän täytyy monissa tilanteissa kirjautua tililleen ja syöttää salasana.

Esimerkiksi GitHubin kirjautumissivu:

![WordPress](../../Resource/019_github.png)

Tässä oppitunnissa teemme samanlaisen kirjautumisnäkymän, jotta käyttäjä voi syöttää tilin ja salasanan käsin, ja tarkistamme, onko syötetyssä sisällössä jokin ongelma.

## Yläosan asettelu

Kirjoitamme kirjautumisnäkymän koodin `ContentView`-tiedostoon.

Ensin kirjoitamme kirjautumisnäkymän yläosassa olevan tunnistealueen. Voit ensin valmistella sopivan ikonikuvaan ja sijoittaa sen `Assets`-kansioon.

![icon](../../Resource/019_icon1.png)

Käytä sitten `Image`-näkymää ja muokkaimia kuvan näyttämiseen:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Nämä muokkaimet tarkoittavat:

- `resizable()`: mahdollistaa kuvan koon muuttamisen.
- `scaledToFit()`: skaalaa kuvaa säilyttäen sen alkuperäisen mittasuhteen.
- `frame(width: 100)`: asettaa kuvan näyttöleveydeksi `100`.

Käytä seuraavaksi `Text`-näkymää ja muokkaimia kirjautumisotsikon näyttämiseen:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Käytä sitten `VStack`-näkymää kuvan ja tekstin järjestämiseen pystysuunnassa:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Tulos:

![view](../../Resource/019_view.png)

Tähän mennessä olemme saaneet valmiiksi kirjautumisnäkymän yläosan otsikkoalueen.

### Asettelun optimointi

Tällä hetkellä kuva ja otsikko sijaitsevat oletuksena koko asettelun keskialueella.

Jos haluamme niiden näyttävän enemmän "sivun yläosan kirjautumistunnukselta", voimme käyttää `Spacer()`-näkymää venyttämään jäljellä olevan tilan ja saamaan sisällön näkymään lähempänä yläreunaa.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Tulos:

![view](../../Resource/019_view1.png)

Mutta nyt `Image` ja `Text` ovat liian lähellä näytön yläreunaa, ja näkymä näyttää hieman ahtaalta.

Tässä vaiheessa voimme käyttää `padding`-muokkainta lisätäksemme ylätilaa koko `VStack`-näkymälle.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Tulos:

![view](../../Resource/019_view2.png)

Näin sivun yläosan otsikkoalue näyttää hieman sopivammalta.

## Käyttäjätunnus ja salasana

Kirjautumissivu vaatii yleensä, että käyttäjä syöttää käyttäjätunnuksen ja salasanan.

SwiftUI:ssa voimme käyttää `TextField`-näkymää käyttäjän syöttämän sisällön vastaanottamiseen.

On kuitenkin huomattava, että `TextField` ei itse tallenna syötettyä dataa pitkäaikaisesti, vaan se on vain syöttöohjain. Se, mikä todella tallentaa nämä syöttötiedot, ovat muuttujat, joihin sidomme sen.

Siksi meidän täytyy ensin luoda kaksi `@State`-muuttujaa käyttäjätunnuksen ja salasanan tallentamiseen:

```swift
@State private var user = ""
@State private var password = ""
```

Kun `@State`-muuttujan arvo muuttuu, SwiftUI päivittää siihen liittyvät näkymät automaattisesti.

Käytä seuraavaksi `TextField`-näkymää näiden kahden muuttujan sitomiseen:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Tässä `$user` ja `$password` tarkoittavat "sidontaa".

Toisin sanoen, kun käyttäjä kirjoittaa tekstiä syöttökenttään, muuttujan arvo muuttuu samanaikaisesti; ja kun muuttujan arvo muuttuu, myös syöttökentässä näytettävä sisältö muuttuu samanaikaisesti.

Tätä suhdetta, jossa "näkymä ja data pysyvät synkronissa keskenään", kutsutaan sidonnaksi.

Huomaa, että tässä täytyy käyttää kirjoitusasua, jossa on `$`:

```swift
$user
```

Koska `TextField` ei tarvitse tavallista merkkijonoa, vaan sidonta-arvon, joka "voi muokata dataa kahteen suuntaan".

### Syöttökenttien näyttäminen

Laitetaan ne `ContentView`-näkymään:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Näyttötulos:

![view](../../Resource/019_view3.png)

Koska `user` ja `password` ovat nyt molemmat oletuksena tyhjiä merkkijonoja:

```swift
""
```

syöttökentässä näkyy ensin paikkamerkkiteksti, esimerkiksi:

```swift
input user
```

Tämä teksti vain kertoo käyttäjälle, "mitä tähän pitäisi syöttää", eikä ole varsinainen syötetty sisältö.

### Syöttökenttien optimointi

Nyt syöttökenttiä voidaan jo käyttää, mutta oletustyyli on melko yksinkertainen.

Jotta käyttöliittymä olisi selkeämpi, voimme lisätä otsikon syöttökentän eteen ja tehdä itse kentälle hieman yksinkertaista tyylin optimointia.

Lisää esimerkiksi ensin otsikko:

```swift
Text("Username")
    .fontWeight(.bold)
```

Käytä sitten `HStack`-näkymää asettaaksesi otsikon ja syöttökentän samalle riville:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Käytämme tässä `HStack`-näkymää, koska haluamme "näyttää otsikon vasemmalla ja syöttökentän oikealla".

On huomattava, että `TextField` vie oletuksena jäljellä olevan vapaan tilan.

![color](../../Resource/019_view6.png)

Jotta kahden syöttökentän koko olisi yhtenäisempi, voimme käyttää `frame(width:)`-muokkainta leveyden asettamiseen, jolloin syöttökentät näyttävät siistimmiltä.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Lisää sitten myös reunus, jotta syöttökenttä erottuu paremmin:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Lisätään nyt sekä käyttäjätunnus että salasana `ContentView`-näkymään:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Näyttötulos:

![view](../../Resource/019_view4.png)

Tähän mennessä käyttäjä voi jo syöttää käyttäjätunnuksen ja salasanan.

## Kirjautumispainike

Seuraavaksi lisäämme kirjautumispainikkeen syöttökenttien alapuolelle.

```swift
Button("Sign in") {

}
```

Käytä sitten `buttonStyle`-muokkainta antaaksesi painikkeelle näkyvämmän järjestelmätyylin:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Näyttötulos:

![view](../../Resource/019_view5.png)

Varmistaaksemme, että painike todella reagoi napautuksiin, voimme ensin kirjoittaa painikkeen sisään `print`-komennon testausta varten:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Kun painiketta napautetaan, konsoli tulostaa:

```swift
click Sign in
```

Tämä osoittaa, että painike on reagoinut onnistuneesti napautustoimintoon.

## Kirjautumislogiikka

Nyt lisäämme kirjautumispainikkeeseen kaikkein perustavimman tarkistuslogiikan: **tarkistamme, onko käyttäjä syöttänyt käyttäjätunnuksen ja salasanan**.

Haluamme toteuttaa seuraavat tilanteet:

- Jos käyttäjä ei syötä mitään, tulosta `Empty`
- Jos käyttäjä syöttää vain toisen niistä, ilmoita mikä puuttuu
- Jos sekä käyttäjätunnus että salasana on syötetty, tulosta `Success`

### Tietoja ei ole syötetty lainkaan

Koska `user` ja `password` ovat oletuksena molemmat tyhjiä merkkijonoja:

```swift
@State private var user = ""
@State private var password = ""
```

ne pysyvät tyhjinä, kun käyttäjä ei syötä mitään.

Swiftissä tyypit kuten `String` voivat käyttää `isEmpty`-ominaisuutta sen selvittämiseen, onko sisältö tyhjä.

### isEmpty-ominaisuus

`isEmpty`-ominaisuutta käytetään usein tarkistamaan, ovatko merkkijonot, taulukot ja muut sisällöt tyhjiä.

Esimerkiksi:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Jos sisältö on tyhjä, `isEmpty` palauttaa `true`; jos sisältö ei ole tyhjä, se palauttaa `false`.

Siksi voimme käyttää sitä määrittämään, onko käyttäjätunnuksessa ja salasanassa syötettyä sisältöä.

### isEmptyn käyttäminen muuttujien tarkistamiseen

Jos käyttäjä ei ole syöttänyt mitään tietoja, silloin:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Tässä vaiheessa voimme kirjoittaa ehdon näin:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Tämä koodi tarkoittaa: jos `user` on tyhjä ja myös `password` on tyhjä, tulosta:

```swift
Empty
```

Tässä `&&` on looginen operaattori ja tarkoittaa "ja".

Toisin sanoen koko ehto on tosi vain silloin, kun vasemman puolen ehto on tosi ja myös oikean puolen ehto on tosi.

Siksi tämä koodi suoritetaan vain, kun sekä käyttäjätunnus että salasana ovat tyhjiä.

## Käyttäjä täytti vain osan

Seuraavaksi tarkastellaan toista tilannetta: käyttäjä täytti vain käyttäjätunnuksen tai vain salasanan.

Esimerkiksi:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Tässä tilanteessa käyttäjätunnus ei ole tyhjä, mutta salasana on tyhjä.

Voimme edelleen käyttää `isEmpty`-ominaisuutta tarkistamiseen:

### Tilanne, jossa käyttäjä täytti tilin tai salasanan

Jos käyttäjä täytti vain käyttäjätunnuksen tai salasanan, meidän täytyy antaa vastaava ilmoitus siitä, mikä puuttuu.

Esimerkiksi jos käyttäjä täytti vain käyttäjätunnuksen:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Tämän koodin logiikka on: jos käyttäjätunnus on tyhjä, pyydä syöttämään käyttäjätunnus. Muuten tarkista, onko salasana tyhjä, ja jos se on tyhjä, pyydä syöttämään salasana.

### Käyttäjä täytti kaikki tiedot

Jos sekä käyttäjätunnus että salasana on jo syötetty, `isEmpty` palauttaa molemmille `false`.

Tässä vaiheessa voimme kirjoittaa sen näin:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Tässä `!` tarkoittaa "negaatiota".

Esimerkiksi:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Toisin sanoen `user.isEmpty`-ominaisuutta käytetään määrittämään, "onko käyttäjätunnus tyhjä", kun taas `!user.isEmpty`-muotoa käytetään määrittämään, "eikö käyttäjätunnus ole tyhjä".

Salasana noudattaa samaa logiikkaa.

Joten tämän koodin merkitys on: käyttäjätunnus ei ole tyhjä, eikä salasana myöskään ole tyhjä.

Kun molemmat ehdot ovat totta, tulos on:

```swift
Success
```

## Täydellinen tarkistuslogiikka

Nyt yhdistämme nämä kolme tilannetta ja kirjoitamme ne `Button`-näkymään:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Tämän koodin suoritusjärjestys voidaan ymmärtää näin:

Ensimmäisessä vaiheessa tarkistamme ensin:

```swift
if user.isEmpty && password.isEmpty
```

Jos sekä käyttäjätunnus että salasana ovat tyhjiä, tulostetaan suoraan `Empty`.

Jos ne eivät ole molemmat tyhjiä, jatkamme tarkistamalla tämän rivin:

```swift
else if user.isEmpty || password.isEmpty
```

Tässä `||` tarkoittaa "tai".

Toisin sanoen, niin kauan kuin yksi ehdoista on tosi, koko ehto on tosi.

Siksi `else if`-koodilohko suoritetaan niin kauan kuin käyttäjätunnus on tyhjä tai salasana on tyhjä.

Kun olemme siirtyneet koodilohkoon, tarkistamme tarkemmin, mikä syöttökenttä jäi täyttämättä:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Jos kumpikaan kahdesta edellisestä ehdosta ei ole tosi, se tarkoittaa, että käyttäjätunnus ei ole tyhjä eikä salasana myöskään ole tyhjä.

Silloin ohjelma siirtyy viimeiseen `else`-haaraan:

```swift
print("Success")
```

Näin saamme valmiiksi kaikkein perustavimman kirjautumissyötteen tarkistuslogiikan.

## Käyttäjätunnuksen ja salasanan tarkistus

Yllä oleva logiikka tarkistaa vain, "onko sisältöä syötetty vai ei".

Mutta oikeassa sovelluksessa ei riitä, että sisältöä vain syötetään. Yleensä meidän täytyy myös lähettää käyttäjätunnus ja salasana palvelimelle tarkistettavaksi.

Jos palvelin vahvistaa, että käyttäjätunnus on olemassa ja salasana on oikea, se sallii kirjautumisen; muuten se ilmoittaa kirjautumisen epäonnistuneen.

Tämän prosessin harjoittelemiseksi voimme ensin asettaa koodiin väliaikaisen tilin ja salasanan simuloidaksemme "oikeita kirjautumistietoja":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Kun sekä käyttäjätunnus että salasana eivät ole tyhjiä, vertaamme sitten, ovatko ne oikein:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Tässä `==` tarkoittaa "onko yhtä suuri kuin".

Esimerkiksi:

```swift
user == userID
```

Se tarkoittaa, onko käyttäjän syöttämä käyttäjätunnus täsmälleen sama kuin asettamamme oikea käyttäjätunnus. Salasanan tarkistus noudattaa samaa logiikkaa.

Siksi kun syötetty käyttäjätunnus ja salasana ovat samat kuin asetetut arvot, tulos on `Success`; jos jompikumpi niistä ei ole sama, tulos on `Input error`.

Näin saamme valmiiksi yksinkertaisen "tehdyn kirjautumistarkistuksen".

Vaikka se ei vielä ole oikea palvelimeen yhdistetty kirjautumistoiminto, se riittää jo auttamaan meitä ymmärtämään: **painikkeen napauttamisen jälkeen voidaan suorittaa eri koodia eri ehtojen perusteella**.

## Yhteenveto

Tässä oppitunnissa saimme valmiiksi perustason kirjautumisnäkymän ja keskityimme erityisesti oppimaan "syötetyn sisällön arvioinnin logiikkaa ehtojen perusteella".

Tämän oppitunnin ydin on: käyttää `isEmpty`-ominaisuutta merkkijonon tyhjyyden tarkistamiseen ja käyttää `if`-lauseita yhdessä loogisten operaattorien kanssa erilaisten tilanteiden käsittelemiseen.

Näistä kaksi erittäin tärkeää loogista operaattoria ovat:

- `&&`: tarkoittaa "ja", molempien ehtojen täytyy täyttyä
- `||`: tarkoittaa "tai", yhden ehdon täyttyminen riittää

Kun nämä ehdot lopulta tuottavat `true` tai `false`, `if`-lause suorittaa eri koodia tuloksen perusteella.

Tämän kirjautumisnäkymän kautta olemme jo alkaneet tutustua kehitystapaan, joka yhdistää "käyttöliittymä + data + looginen arviointi".

## Täydellinen koodi

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
