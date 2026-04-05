# Kirjautumisvuorovaikutukset

Edellisellä tunnilla teimme kirjautumisnäkymän ja toteutimme painikkeiden sekä ehtologiikan avulla yksinkertaisen syötetyn sisällön tarkistuksen.

Tällä tunnilla jatkamme edellisen tunnin koodin pohjalta ja opimme `SecureField`-salasanakentästä, `Alert`-varoitusikkunasta sekä siitä, miten eri näkymien näyttämistä voidaan ohjata muuttujien perusteella.

Tämän tunnin avulla voit ymmärtää paremmin kirjautumisnäkymän perusvuorovaikutuksen kulun, joka on myös monissa sovelluksissa käytetty peruslogiikka.

## Salasanan syöttökenttä

Edellisellä tunnilla käytimme `TextField`-kenttää salasanan syöttämiseen.

Todellisessa kirjautumisnäkymässä salasanaa ei kuitenkaan yleensä näytetä suoraan, vaan se näkyy pisteinä tai muuna piilotettuna efektinä, jotta käyttäjän yksityisyys suojataan.

SwiftUI:ssa salasanojen syöttämiseen tarkoitettu erityinen komponentti on `SecureField`.

Esimerkiksi:

```swift
SecureField("Password", text: $password)
```

Sen kirjoitustapa muistuttaa paljon `TextField`-kenttää: sekin tarvitsee vihjetekstin sekä sidotun muuttujan.

Sen voi ymmärtää yksinkertaisesti näin: `SecureField` on myös syöttökenttä, mutta se piilottaa syötetyn sisällön.

Voimme suoraan vaihtaa aiemmin salasanan syöttämiseen käytetyn `TextField`-kentän `SecureField`-kentäksi:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Kun käyttäjä syöttää salasanan, salasanan sisältöä ei enää näytetä suoraan käyttöliittymässä.

Näyttöefekti:

![password](../../Resource/020_password.png)

Nyt voimme syöttää käyttäjätunnuksen ja salasanan ja painaa painiketta tarkistaaksemme, onko syöte oikein.

### Palautteen näyttäminen

Aiemmin käytimme jatkuvasti `print`-komentoa tulosten tulostamiseen.

`print`-sisältö näkyy vain konsolissa. Kehittäjät näkevät sen, kun ohjelmaa ajetaan Xcodessa, mutta tavalliset käyttäjät eivät näe näitä viestejä puhelimessa.

Se tarkoittaa, että vaikka ohjelma on jo suorittanut tarkistuksen, käyttäjä ei tiedä, onko syötetty sisältö oikein.

Tässä tilanteessa tarvitsemme tavan näyttää viestit suoraan käyttöliittymässä.

## Alert-varoitusikkuna

SwiftUI:ssa voimme käyttää `Alert`-komponenttia näyttämään ponnahdusviesti-ikkunan.

Peruskäyttö:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Tämä koodinpätkä näyttää hieman monimutkaisemmalta kuin aiemmat komponentit, mutta voimme ymmärtää sen purkamalla sen osiin.

`Alert` sisältää pääasiassa seuraavat osat:

- `"Title"`: varoitusikkunan otsikko
- `isPresented`: sidottu Boolean-arvo, jota käytetään ohjaamaan, näytetäänkö varoitusikkuna
- `Button(...)`: varoitusikkunan painike
- `message:`: varoitusikkunassa näytettävä viestin sisältö

Sen voi ymmärtää yksinkertaisesti näin: kun sidotun muuttujan arvoksi tulee `true`, järjestelmä näyttää tämän viesti-ikkunan.

Näyttöefekti:

![alert](../../Resource/020_alert3.png)

Vastaava rakenne:

![alert](../../Resource/020_alert.png)

### Alert on muokkain

Kuten monet aiemmin oppimamme muokkaimet, myös `Alert` lisätään jonkin näkymän perään.

Esimerkiksi se voidaan liittää painikkeen perään:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Se voidaan liittää myös ulomman `VStack`-rakenteen perään:

```swift
VStack {
    // ...
}
.alert() {...}
```

Toisin sanoen `Alert` ei ole käyttöliittymässä yksinään oleva itsenäinen näkymä, vaan muokkain, joka on kiinnitetty tiettyyn näkymään.

Sen voi ymmärtää yksinkertaisesti niin, että `Alert` kirjoitetaan yleensä painikkeen tai ulomman asettelun perään näyttämään viesti, kun jokin ehto täyttyy.

### Alertin näyttäminen

Jos haluamme näyttää `Alert`-ikkunan, tarvitsemme sitä ohjaavan muuttujan.

Esimerkiksi:

```swift
@State private var showAlert = false
```

Tämä muuttuja on tyyppiä `Bool`, eli sillä on vain kaksi arvoa: `true` tai `false`.

Sitten sidomme sen `Alert`-komponentin `isPresented`-arvoon:

```swift
isPresented: $showAlert
```

Kun `showAlert` on `false`, varoitusikkunaa ei näytetä. Kun `showAlert` on `true`, varoitusikkuna avautuu.

### Varoitusikkunan näyttäminen painikkeen kautta

Nyt toteutetaan ensin kaikkein yksinkertaisin tilanne:

Kun käyttäjä ei syötä mitään ja painaa suoraan `Sign in`-painiketta, esiin tulee viesti-ikkuna, joka kertoo: “Et ole vielä syöttänyt mitään sisältöä.”

Luo ensin muuttuja tämän viesti-ikkunan ohjaamiseen:

```swift
@State private var showEmpty = false
```

Lisää sitten `Alert` `Button`-painikkeen perään:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Seuraavaksi tee tarkistus painikkeen klikkauskoodissa:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Jos sekä `user` että `password` ovat tyhjiä, muutamme `showEmpty`-muuttujan arvoksi `true`.

Koska `Alert` on sidottu tähän muuttujaan, järjestelmä näyttää viesti-ikkunan automaattisesti, kun sen arvoksi tulee `true`.

Näyttöefekti:

![alert](../../Resource/020_alert1.png)

Näin käyttäjä näkee viestin heti painikkeen painamisen jälkeen, eikä kehittäjän tarvitse mennä konsoliin tarkistamaan `print`-tulostetta.

### Painikkeen ja varoitusikkunan täydentäminen

Aiemmin käsittelimme vain tilannetta, jossa “mitään ei ole täytetty”.

Meidän täytyy vielä käsitellä seuraavat tilanteet:

- käyttäjätunnusta ei ole täytetty
- salasanaa ei ole täytetty
- käyttäjätunnus ja salasana on täytetty, mutta syöte on väärä

Siksi meidän täytyy myös valmistella näihin tilanteisiin vastaavat viestit.

Lisää ensin kolme uutta muuttujaa:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Jatka sitten lisäämällä vastaavat `Alert`-ikkunat painikkeen perään:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Täydennä seuraavaksi painikkeen sisäinen tarkistuslogiikka:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Kun painike päättelee, että käyttäjä ei ole täyttänyt mitään tietoa, on jättänyt yhden tiedon puuttumaan tai syötteen tarkistus on epäonnistunut, vastaavan Boolean-muuttujan arvoksi asetetaan `true`, minkä jälkeen vastaava `Alert` näytetään.

Tässä suosittelen, että testaat itse muutamia tilanteita:

- älä täytä mitään
- täytä vain käyttäjätunnus
- täytä vain salasana
- täytä sekä käyttäjätunnus että salasana, mutta väärällä sisällöllä
- täytä sekä käyttäjätunnus että salasana, ja sisältö on oikein

Näin voimme varmistaa, onko koodissamme ongelmia. Tämä on myös erittäin tärkeä “testaus”-vaihe sovelluskehityksessä.

Jos ohjelma käyttäytyy väärin jossakin tilanteessa, se tarkoittaa, että logiikassa saattaa olla ongelma ja ohjelmaan on ilmestynyt `Bug`.

Se, mitä kehityksessä usein kutsutaan `Bug`-nimellä, tarkoittaa virhettä, puutetta tai käyttäytymistä, joka ei vastaa odotuksia.

## Kirjautumisnäkymän viimeistely

Edellä käsitellyt `Alert`-esimerkit liittyivät kaikki siihen, miten käyttäjälle annetaan viesti silloin, kun “syöte on väärä”.

Kun käyttäjä syöttää oikean käyttäjätunnuksen ja salasanan, emme yleensä näytä “varoitusikkunaa”, vaan siirrymme suoraan kirjautumisen jälkeiseen käyttöliittymään.

Tässä on kyse erittäin tärkeästä käsitteestä: **eri näkymien näyttäminen muuttujan arvon perusteella.**

Esimerkiksi:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Tässä käytämme `Bool`-tyyppiä näkymän näyttämisen hallintaan:

- jos `login` on `true`, se tarkoittaa, että kirjautuminen on onnistunut ja kirjautumisen jälkeinen sisältö näytetään
- jos `login` on `false`, se tarkoittaa, että kirjautuminen ei ole onnistunut, ja kirjautumisnäkymä näkyy edelleen.

Vaikka `if`-lause on Swiftin ehtolause, SwiftUI:n `body`-osassa sitä voidaan käyttää ohjaamaan näkymien näyttölogiikkaa.

Toisin sanoen SwiftUI päättää ehdon tuloksen perusteella, mikä näkymä tulisi tällä hetkellä näyttää.

Voimme sijoittaa tämän näyttölogiikan nykyiseen `ContentView`-näkymään:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Tässä lisäsimme uuden `login`-muuttujan, jota käytetään ilmaisemaan, onko käyttäjä jo kirjautunut sisään onnistuneesti.

Sitten sijoitimme aiemmin kirjoittamamme kirjautumisnäkymän koodin `else`-lauseen jälkeen.

Näkymän näyttölogiikka:

- kun `login` on `false`, se tarkoittaa, että kirjautuminen ei ole vielä onnistunut, joten alkuperäinen kirjautumisnäkymä näkyy edelleen.
- kun `login` on `true`, se tarkoittaa, että kirjautuminen on onnistunut, eikä kirjautumisnäkymää enää näytetä, vaan näytetään `Login successful`.

Toisin sanoen `ContentView` näyttää eri sisältöä riippuen `login`-muuttujan arvosta.

Muokataan seuraavaksi kirjautumisen onnistumislogiikkaa painikkeen sisällä:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Kun käyttäjän syöttämä käyttäjätunnus ja salasana ovat molemmat oikein, asetamme `login`-muuttujan arvoksi `true`.

Heti kun `login`-arvo muuttuu, myös `ContentView`-näkymän `if`-tarkistuksen tulos muuttuu, ja käyttöliittymä vaihtuu alkuperäisestä kirjautumisnäkymästä `Login successful`-näkymään.

Näyttöefekti on seuraava:

![view](../../Resource/020_view.png)

Nyt olemme todella soveltaneet tietoa “eri näkymien näyttämisestä ehtojen perusteella” tähän nykyiseen kirjautumissivuun.

Todellisissa sovelluksissa käytetään yleensä samaa tapaa: eri näkymiä näytetään jonkin tietyn arvon perusteella.

Esimerkiksi silloin, kun käyttäjä ei ole kirjautunut sisään, näytetään kirjautumissivu. Kun käyttäjä kirjautuu onnistuneesti, näytetään toinen käyttöliittymä.

Ydinajatus on: **hallita sitä, mitä sisältöä käyttöliittymä näyttää, muuttujien muutosten avulla.**

## Yhteenveto

Tällä tunnilla opimme kolme tärkeää asiaa:

1. Käyttämään `SecureField`-kenttää salasanan syöttämiseen niin, ettei salasanan sisältö näy suoraan käyttöliittymässä.
2. Käyttämään `Alert`-komponenttia viestien näyttämiseen käyttäjälle sen sijaan, että niitä tulostettaisiin vain konsoliin.
3. Käyttämään muuttujia ja `if`-ehtoja eri näkymien näyttämisen ohjaamiseen ja toteuttamaan siirtymän ennen kirjautumista ja kirjautumisen jälkeen näkyvien käyttöliittymien välillä.

Näiden tietojen avulla pystymme nyt toteuttamaan kirjautumisnäkymän, jossa on perusvuorovaikutuksia, ja ymmärtämään syvemmin SwiftUI:n kehitysajatusta: “tila muuttuu, käyttöliittymä päivittyy”.

## Täydellinen koodi

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Lisätieto - Alert useilla painikkeilla

Tämän tunnin aiemmassa osassa käytimme kaikkein yksinkertaisinta `Alert`-muotoa, jossa on vain yksi painike ja jota käytetään pääasiassa käyttäjän huomauttamiseen.

Itse asiassa `Alert` voi sisältää myös useita painikkeita, jotta käyttäjä voi tehdä erilaisia valintoja.

Esimerkiksi:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Kun painiketta napsautetaan, esiin tulee viesti-ikkuna, jossa on kolme vaihtoehtoa: `Ok`, `delete` ja `cancel`.

Näyttöefekti:

![alert](../../Resource/020_alert2.png)

Kun eri painikkeita napsautetaan, vastaava koodi suoritetaan.

### Buttonin role-ominaisuus

Tässä huomaat, että `Alert`-komponentin sisällä oleva `Button` eroaa hieman tavallisen painikkeen kirjoitustavasta, jonka opimme aiemmin:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Tässä on mukana ylimääräinen `role`-parametri.

SwiftUI:ssa `role`-ominaisuutta käytetään kertomaan järjestelmälle, minkä tyyppiseen toimintaan tämä painike kuuluu.

Muutamia yleisiä rooleja ovat:

- `.cancel`: peruutustoiminto
- `.destructive`: vaarallinen toiminto, esimerkiksi poistaminen
- `nil`: tavallinen toiminto

Eri `role`-arvot aiheuttavat yleensä myös eroja käyttöliittymän visuaalisessa tyylissä.

Esimerkiksi vaaralliset toiminnot näytetään usein huomiota herättävämmällä tyylillä muistuttamaan käyttäjää varovaisuudesta.

Lisäksi `role` antaa painikkeelle lisäsemanttista tietoa, mikä helpottaa ruudunlukijoita (kuten VoiceOveria Apple-laitteilla) selittämään käyttäjälle painikkeen tarkoituksen.

Siksi `role`-arvon lisääminen painikkeeseen sopivissa tilanteissa on erittäin hyvä tapa.
