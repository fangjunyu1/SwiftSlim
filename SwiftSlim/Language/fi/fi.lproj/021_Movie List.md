# Elokuvalista

Tässä oppitunnissa teemme elokuvalistan.

![movie](../../Resource/021_movie.png)

Listassa näytetään jokaisen elokuvan juliste, nimi, ohjaaja ja arvio.

Tässä esimerkissä opimme erittäin tärkeän asian: `struct`-rakenteen. Se voi auttaa meitä yhdistämään yhden elokuvan useita tietoja yhdeksi kokonaisuudeksi. Lisäksi tutustumme myös `UUID()`:ään, `ForEach`:iin, `Divider`-jakoviivaan sekä siihen, miten mukautettuja objekteja käytetään datan hallintaan.

Nämä tiedot ovat hyvin yleisiä myöhemmässä SwiftUI-kehityksessä. Kun olet käynyt tämän oppitunnin läpi, et ainoastaan osaa tehdä elokuvalistaa, vaan alat myös ymmärtää, "miten tietojoukko näytetään käyttöliittymänä".

## Yksi elokuva

Voimme ensin aloittaa yksittäisen elokuvan käyttöliittymästä.

![movie](../../Resource/021_movie1.png)

Tämän käyttöliittymän asettelu koostuu pääasiassa kahdesta osasta: vasemmalla on elokuvan juliste ja oikealla elokuvan esittely.

### Elokuvajuliste

Vasemmalla näytetään elokuvan juliste, ja voimme käyttää `Image`-komponenttia kuvan näyttämiseen.

Esimerkiksi:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Tämä koodi tarkoittaa, että näytetään kuva, jonka nimi on `"The Shawshank Redemption"`.

Tässä on tärkeää huomata, että kuvan nimen täytyy todella olla olemassa `Assets`-resurssikansiossa, muuten käyttöliittymä ei pysty näyttämään kuvaa oikein.

![movie](../../Resource/021_movie2.png)

Näiden muokkainten tehtävät ovat seuraavat:

- `resizable()` tarkoittaa, että kuvan kokoa voidaan muuttaa.
- `scaledToFit()` tarkoittaa, että alkuperäinen kuvasuhde säilyy skaalattaessa, jotta kuva ei veny eikä vääristy.
- `frame(height: 180)` tarkoittaa, että kuvan korkeudeksi asetetaan 180.
- `cornerRadius(10)` tarkoittaa, että kuvalle asetetaan kulmien pyöristyssäde 10.

Näin saamme sopivan kokoisen ja pyöristetyillä kulmilla varustetun elokuvajulisteen.

![movie](../../Resource/021_movie3.png)

### Elokuvan esittely

Oikealla näytetään elokuvan esittely, mukaan lukien elokuvan nimi, ohjaaja ja arvio.

![movie](../../Resource/021_movie4.png)

Voimme käyttää `Text`-komponenttia tämän osan näyttämiseen:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Tässä koodissa `.font` tarkoittaa fontin kokoa ja `.fontWeight` tarkoittaa fontin paksuutta.

Jotta "elokuvan nimen", "ohjaajatietojen" ja "arviotietojen" väliin saadaan selkeämpi välistys, käytämme tässä uloimmalla tasolla `VStack`:ia ja asetamme:

```swift
spacing: 10
```

Tämä tarkoittaa, että tämän `VStack`:in sisällä jokaisen sisältöryhmän välinen etäisyys on 10.

Syy siihen, miksi ohjaaja ja arvio on kumpikin kääritty vielä omaan `VStack`:iin, on se, että ne molemmat kuuluvat rakenteeseen "otsikko + sisältö". Tämän ansiosta käyttöliittymän rakenne on selkeämpi, ja tyyliä on helpompi säätää myöhemmin.

Lisäksi `VStack` on oletuksena keskitetty. Jotta kaikki teksti olisi vasemmalle tasattu, asetamme:

```swift
alignment: .leading
```

Näin elokuvan esittelyosa näyttää siistimmältä.

### Jakoviiva

Nyt elokuvan esittelyn sisältö on kyllä erotettu toisistaan `spacing`:in avulla, mutta eri sisältöjen välinen raja ei vieläkään ole tarpeeksi selkeä.

Tässä vaiheessa voimme lisätä jakoviivan:

```swift
Divider()
```

Esimerkiksi:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Näin elokuvan esittelyosaan saadaan selkeämpi erotteluefekti.

![movie](../../Resource/021_movie4.png)

`Divider` on hyvin yksinkertainen mutta hyvin usein käytetty näkymä, jonka tehtävänä on erottaa eri sisältöjä toisistaan.

`VStack`:issa `Divider()` näkyy vaakaviivana.

`HStack`:issa `Divider()` näkyy pystysuorana viivana.

Lisäksi `Divider`:in tyyliä voi muuttaa esimerkiksi `.frame`, `.background` ja `.padding` -tavoilla.

Esimerkiksi:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Tämä luo sinisen jakoviivan, jonka paksuus on 2 ja jonka molemmilla puolilla on vaakasuuntainen sisennys.

![divider](../../Resource/021_divider.png)

### Täydellinen käyttöliittymä

Lopuksi voimme käyttää `HStack`:ia sijoittaaksemme elokuvajulisteen ja elokuvan esittelyn vierekkäin.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Tässä `HStack(spacing: 20)` tarkoittaa, että vasemman ja oikean osan väliin jätetään 20 yksikön väli.

On tärkeää huomata, että `Divider()`, kuten aiemmin käsitellyt `TextField` ja `Slider`, pyrkii oletuksena viemään mahdollisimman paljon käytettävissä olevaa tilaa.

Siksi annamme oikeanpuoleisen esittelyosan ulommalle `VStack`:ille kiinteän leveyden:

```swift
.frame(width: 200)
```

Näin jakoviivan ja tekstialueen leveys pysyy samana, ja kokonaisuus näyttää siistimmältä.

Tähän mennessä olemme saaneet valmiiksi "yhden elokuvan" näyttöliittymän.

![movie](../../Resource/021_movie1.png)

## Tallenna elokuvat taulukkoon

Jos haluamme näyttää useita elokuvia peräkkäin samalla tyylillä, se tarkoittaa, että jokaiselle elokuvalle pitäisi kirjoittaa samanlaista koodia uudelleen.

Esimerkiksi:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Vaikka tällä tavalla kirjoitettu koodi voikin saavuttaa halutun lopputuloksen, koodia tulee koko ajan enemmän ja sen ylläpito muuttuu hyvin hankalaksi.

Jos esimerkiksi kaikkien elokuvien väli pitäisi muuttaa `20`:stä `15`:een tai oikean puolen leveys `200`:sta
`220`:een, jokainen toistuva koodinpätkä olisi muokattava käsin.

Tämä ei selvästikään ole tehokas tapa.

Olemme aiemmin oppineet taulukoista, ja olemme myös oppineet käyttämään `ForEach`:ia näkymien toistuvaan näyttämiseen taulukon perusteella.

Esimerkiksi:

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

Tämä tapa sopii hyvin tilanteisiin, joissa on "vain yksi datatyyppi", kuten joukko kuvien nimiä.

Mutta elokuvassa ei ole vain yhtä arvoa. Siihen kuuluu ainakin:

1. elokuvajuliste
2. elokuvan nimi
3. ohjaaja
4. arvio

Toisin sanoen elokuva on itse asiassa joukko toisiinsa liittyviä tietoja, eikä vain yksi merkkijono.

Jos käytämme vain taulukoita, voimme tallentaa nämä tiedot vain erillään:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Näytettäessä meidän täytyy sitten luottaa samaan indeksiin, jotta ne vastaavat toisiaan yksi kerrallaan:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Tämän kirjoitustavan ongelma on se, että ylläpitokustannus on hyvin korkea.

Koska yhden elokuvan tiedot hajotetaan useisiin taulukoihin, riittää että yhdessä taulukossa on yksi alkio liikaa, yksi liian vähän tai eri järjestys, niin näyttötulos menee väärin.

Erityisesti kun lisäät tai poistat elokuvia, sinun täytyy muokata useita taulukoita samaan aikaan, ja jotain jää erittäin helposti huomaamatta.

Miten siis voimme yhdistää tiedot kuten "elokuvan nimi, ohjaaja ja arvio" yhdeksi kokonaisuudeksi?

Tähän tarvitaan `struct`.

## struct-rakenteen määrittely

Swiftissä `struct` tarkoittaa "rakennetta".

Voit ajatella sitä "mukautettuna tietotyyppinä", joka voi yhdistää useita toisiinsa liittyviä kenttiä yhdeksi kokonaisuudeksi.

Peruskäyttö:

```swift
struct StructName {
	let name: String
}
```

Tässä koodissa `struct` on avainsana, joka kertoo, että olemme määrittelemässä rakennetta. `StructName` on rakenteen nimi.

Aaltosulkeiden sisällä oleva sisältö on tämän rakenteen kentät, ja jokaisen kentän nimi ja tyyppi on kirjoitettava selkeästi.

Yleensä `struct`:in nimi alkaa isolla kirjaimella, esimerkiksi `Movie`, `Student` tai `UserInfo`. Tämä on Swiftissä yleinen nimeämistapa.

Voit ymmärtää `struct`:in yksinkertaisesti tyhjänä laatikkona, jossa jokainen kenttä on kuin etukäteen varattu tyhjä paikka laatikossa.

Kun näitä paikkoja ei ole vielä täytetty, kyseessä on vain tyhjä laatikko. Vasta kun kaikki kentät täytetään sopivilla arvoilla, siitä tulee täydellinen lahjapakkaus.

### struct-instanssi

Aiempana määrittelimme vain itse rakenteen, mikä vastaa pakkauslaatikon muodon valmistelua.

Meidän täytyy vielä täyttää siihen varsinainen sisältö, jotta saamme oikean "instanssin", jota voidaan käyttää.

Instanssia luotaessa rakenteen nimen perään lisätään yleensä `()`:

```swift
StructName(...)
```

Sulkeiden sisään kirjoitetaan juuri tämän rakenteen tarvitsemat kenttäarvot.

Esimerkiksi:

```swift
StructName(name: "Fang Junyu")
```

Tämä koodi tarkoittaa: luodaan uusi instanssi `StructName`-rakenteen muodon mukaan ja annetaan `name`-kentälle arvo `"Fang Junyu"`.

Kun täytämme kaikki tarvittavat kenttäarvot, se on kuin täyttäisimme tämän pakkauksen kokonaan.

Tällöin saamme täydellisen rakenne-instanssin.

### struct-ominaisuuksien käyttö

Kun olemme luoneet instanssin, voimme käyttää "pistesyntaksia" sen sisäisten ominaisuuksien käyttämiseen.

Perusmuoto:

```swift
instanssi.ominaisuudenNimi
```

Esimerkiksi:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Tässä `st` on rakenne-instanssi, ja `st.name` tarkoittaa, että luetaan tämän instanssin `name`-arvo.

Voit ymmärtää tämän lukutavan niin, että kun kirjoitamme `st.name`, se on kuin lukisimme sisällön, joka on tallennettu tiettyyn paikkaan tässä laatikossa.

Tällainen kirjoitustapa on hyvin tavallinen myöhemmissä SwiftUI-käyttöliittymissä.

Jos meillä esimerkiksi on opiskelijarakenne, joka sisältää nimen, iän ja luokan, voimme käyttöliittymässä näyttää ne lukemalla erikseen:

```swift
student.name
student.age
student.className
```

Tämän etuna on se, että datasta tulee selkeämpää ja sitä on myös helpompi hallita.

### structin sijainti

Aloittelijoille on yleensä sopivaa kirjoittaa rakenne `ContentView`:n ulkopuolelle.

Esimerkiksi:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Näin rakenne on selkeämpi ja myös helpompi lukea.

Huomaat, että `ContentView` itse on oikeastaan myös `struct`.

### Movie-rakenne

Edellisen perustan avulla voimme määritellä elokuvarakenteen:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Tämä on rakenne nimeltä `Movie`, joka koostuu kolmesta kentästä `name`, `director` ja `rating`, jotka edustavat elokuvan nimeä, ohjaajaa ja arviota.

Näin yhteen elokuvaan liittyviä tietoja ei enää tarvitse hajottaa useisiin taulukoihin, vaan ne voidaan yhdistää suoraan yhdeksi kokonaisuudeksi.

Esimerkiksi voimme luoda tällaisen elokuvainstanssin:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Tämä instanssi edustaa "yhtä täydellistä elokuvadatakokonaisuutta".

### Rakenteiden tallentaminen taulukkoon

Sanoimme aiemmin, että taulukko voi tallentaa vain saman tyyppisiä arvoja.

Nyt meillä on jo `Movie`-rakenne, joten taulukko voi tallentaa useita `Movie`-arvoja.

```swift
let lists: [Movie] = []
```

Esimerkiksi:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Tähän `lists`-taulukkoon ei tallenneta merkkijonoja, vaan useita `Movie`-instansseja.

Toisin sanoen jokainen taulukon alkio on yksi täydellinen elokuva.

Näin, kun meidän täytyy näyttää elokuvalista, voimme käyttää `ForEach`:ia lukeaksemme jokaisen elokuvan yksi kerrallaan.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Tässä `movie in` tarkoittaa, että jokaisella silmukkakierroksella taulukosta otetaan yksi elokuva, jolle annetaan väliaikaisesti nimi `movie`.

Sen jälkeen voimme käyttää:

```swift
movie.name
movie.director
movie.rating
```

lukemaan tämän elokuvan nimen, ohjaajan ja arvion ja näyttämään ne käyttöliittymässä.

## ForEach-virhe

Tähän mennessä olemme jo saaneet valmiiksi elokuvataulukon ja `ForEach`:in peruskirjoitustavan.

Mutta jos ajat suoraan seuraavan koodin:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

saat virheilmoituksen:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Tämän virheen merkitys on se, että kun kirjoitat `id: \.self`, SwiftUI tarvitsee jokaisen taulukon alkion itsensä "yksilölliseksi tunnisteeksi", jotta se voi erottaa ne toisistaan.

Tällainen kirjoitustapa sopii yksinkertaisille tyypeille kuten `String` ja `Int`, koska ne on itsessään helpompi erottaa toisistaan.

Mutta `Movie` on meidän itse määrittelemämme mukautettu rakenne, eikä `ForEach` tiedä, miten käyttää itse rakennetta yksilöllisenä tunnisteena, joten se antaa virheen.

Yleisin tapa ratkaista tämä ongelma on tehdä niin, että `Movie` noudattaa `Identifiable`-protokollaa.

## Protokolla

Swiftissä protokollan voi ymmärtää eräänlaisena "sääntönä" tai "vaatimuksena".

Voit ajatella sitä kansainvälisen järjestön sopimuksena: jos jokin maa haluaa liittyä tiettyyn kansainväliseen järjestöön, sen täytyy yleensä ensin täyttää järjestön asettamat säännöt, julkaista tiettyjä tietoja ja noudattaa yhteisiä sääntöjä. Vasta näiden ehtojen täytyttyä se voi liittyä mukaan tai osallistua tiettyihin asioihin.

Protokollat toimivat hyvin samalla tavalla.

Kun jokin tyyppi haluaa noudattaa tiettyä protokollaa, sen täytyy täyttää protokollan määräämä sisältö. Vasta kun nämä vaatimukset täyttyvät, kyseinen tyyppi voi käyttää vastaavaa toiminnallisuutta.

Perusmuoto:

```swift
struct Movie: Identifiable {
    // ...
}
```

Tässä `: Identifiable` tarkoittaa, että `Movie` noudattaa `Identifiable`-protokollaa.

Jos tyyppi noudattaa useita protokollia, ne voidaan erottaa pilkulla:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

`Identifiable`:n kohdalla tärkein vaatimus on se, että tyypillä täytyy olla `id`, jolla se voi tunnistaa itsensä.

Esimerkiksi:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Tässä `id` on kuin henkilötunnus, ja sitä käytetään erottamaan jokainen elokuva toisistaan.

Niin kauan kuin jokaisen elokuvan `id` on erilainen, SwiftUI pystyy erottamaan taulukon jokaisen alkion oikein.

Esimerkiksi:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ja sitten käytämme `ForEach`:ssa:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Tällä tavalla virhettä ei enää tule.

Koska `Movie` noudattaa jo `Identifiable`:a, tavallisempi kirjoitustapa on jättää `id:` suoraan pois:

```swift
ForEach(lists) { movie in
    // ...
}
```

Koska SwiftUI tietää jo, että se käyttää `movie.id`:tä erottaakseen jokaisen kohdan.

## ForEachin erottava tunniste

Seuraavaksi ymmärrämme `id`:n roolia `ForEach`:issa syvemmin.

Esimerkiksi:

```swift
ForEach(lists, id: \.self)
```

Tämä tarkoittaa: käytä itse alkiota erottavana tunnisteena.

Ja:

```swift
ForEach(lists, id: \.id)
```

tarkoittaa: käytä alkion `id`-kenttää erottavana tunnisteena.

Jos jokin kenttä pystyy itsessään takaamaan yksilöllisyyden, sitä voi myös väliaikaisesti käyttää.

Jos esimerkiksi jokaisen elokuvan nimi on erilainen, seuraava kirjoitustapa voi toimia nykyisillä tiedoilla myös oikein:

```swift
ForEach(lists, id: \.name)
```

Mutta tässä on piilossa yksi ongelma: `name` ei välttämättä ole aina yksilöllinen.

Jos oletetaan, että lisäät myöhemmin vielä toisen elokuvan samalla nimellä, `name` ei enää pysty erottamaan jokaista alkiota tarkasti.

Silloin koodi voi kyllä edelleen kääntyä, mutta näkymän päivityksessä, lisäyksissä tai poistoissa SwiftUI voi tunnistaa alkiot väärin, mikä voi johtaa näyttövirheisiin.

Siksi silloin kun tarvitsemme vakaan tavan erottaa data, on parasta käyttää aidosti yksilöllistä kenttää eli `id`.

## UUID

Vaikka käsin kirjoittaminen kuten `id: 1`, `id: 2` voi ratkaista ongelman, siihen liittyy silti yksi riski: voi vahingossa kirjoittaa saman `id`:n kahdesti, jolloin yksilöllinen tunniste menettää merkityksensä.

Esimerkiksi:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Tällöin syntyy kaksi samaa `id`:tä, ja yksilöllinen tunniste menettää voimansa.

Käsin tehtävien virheiden välttämiseksi käytämme yleensä `UUID()`:tä.

Swiftissä `UUID()` luo satunnaisesti 128-bittisen tunnisteen. Se näkyy yleensä pitkänä kirjaimista ja numeroista muodostuvana merkkijonona.

Esimerkiksi:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Tässä `UUID()` luo itse asiassa `UUID`-tyypin instanssin, jonka voit ymmärtää automaattisesti luotuna "yksilöllisenä numerona".

Siksi joka kerta luodut arvot eivät lähes koskaan toistu, joten ne sopivat erittäin hyvin käytettäväksi `id`:nä.

Voimme muuttaa `Movie`:a näin:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Tämä koodi tarkoittaa, että `Movie`-rakenteen `id`-kentälle annetaan oletuksena uusi `UUID`-instanssi.

Toisin sanoen aina kun luomme uuden `Movie`:n, järjestelmä luo meille ensin automaattisesti yksilöllisen `id`:n.

Koska `id`:llä on jo oletusarvo, meidän ei myöhemmin tarvitse enää täyttää `id`:tä käsin luodessamme `Movie`-instansseja.

Esimerkiksi:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Vaikka tässä ei kirjoiteta `id`:tä, tällä elokuvainstanssilla on silti oma `id`; tämän arvon on vain automaattisesti luonut `UUID()`.

Kun käytämme tätä tapaa, meidän ei enää tarvitse täyttää `id`:tä käsin jokaiselle elokuvalle, mikä ei ainoastaan vähennä koodin määrää, vaan myös välttää virheet, joita toistuvat id-arvot aiheuttavat.

Lopuksi meidän tarvitsee vain lisätä yläosaan `Banner`-kuva ja käyttää `ScrollView`:tä, jotta sisältöä voidaan vierittää, ja näin koko elokuvalistan näkymä valmistuu.

## Yhteenveto

Tässä oppitunnissa opimme erittäin tärkeän asian: `struct`.

`struct`:in avulla voimme yhdistää yhden elokuvan useita toisiinsa liittyviä kenttiä yhdeksi kokonaisuudeksi sen sijaan, että jakaisimme nimen, ohjaajan ja arvion useisiin eri taulukoihin.

Kun data on yhdistetty, voimme käyttää `ForEach`:ia näyttämään taulukon jokaisen elokuvan yksi kerrallaan näkymässä.

Samalla ymmärsimme myös `ForEach`:in "erottavan tunnisteen" roolin: SwiftUI:n täytyy tietää, miten erottaa taulukon jokainen alkio, jotta näkymä voidaan näyttää ja päivittää oikein.

Siksi laitoimme `Movie`:n noudattamaan `Identifiable`-protokollaa ja annoimme sille yksilöllisen `id`:n.

Jotta välttyisimme virheiltä täyttäessämme `id`:n käsin, opimme lisäksi `UUID()`:n, jotta järjestelmä voi luoda yksilöllisen tunnisteen automaattisesti.

Kun olet käynyt tämän oppitunnin läpi, et ainoastaan saa valmiiksi elokuvalistaa, vaan alat myös koskettaa yhtä tärkeää ajatusta SwiftUI:ssa: **järjestä ensin data ja luo näkymä sen perusteella.**

## Täydellinen koodi

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
