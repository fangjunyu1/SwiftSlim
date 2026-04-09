# struct ja class

Edellisellä oppitunnilla aloitimme vasta tutustumisen `struct`iin, määrittelimme yhden rakenteen ja laajensimme samalla oppimista myös protokolliin, `UUID`:hen ja muihin tietokohtiin.

Nyt meillä on jo alustava käsitys avainsanasta `struct`, mutta sitä ei vielä voi sanoa todelliseksi ymmärrykseksi.

Tässä oppitunnissa jatkamme `struct`in pitämistä keskeisenä sisältönä ja samalla tutustumme myös `class`iin. Tämän oppitunnin kautta ymmärrät selvemmin: mitä instanssi on, mitä konstruktori on ja miksi voimme käyttää `struct`ia ja `class`ia datan järjestämiseen.

## Opiskelijahallintajärjestelmä

Esimerkiksi haluamme nyt kehittää opiskelijahallintajärjestelmän. Jokaisella opiskelijalla on tietoja, kuten nimi, sukupuoli, puhelinnumero, ikä, kotiosoite ja niin edelleen.

Tässä vaiheessa voimme yhdistää nämä tiedot yhteen ja määritellä ne `Student`-rakenteeksi:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Tässä käytämme `struct`ia opiskelijatyypin määrittelemiseen.

Tämä `Student`-rakenne sisältää useita ominaisuuksia:

- `id`: opiskelijan yksilöllinen tunniste
- `name`: opiskelijan nimi
- `sex`: opiskelijan sukupuoli
- `phone`: opiskelijan puhelinnumero
- `age`: opiskelijan ikä
- `address`: kotiosoite

Näin useat alun perin hajallaan olleet tiedot yhdistyvät yhdeksi kokonaiseksi "opiskelijaksi".

Tässä `Student` noudattaa myös `Identifiable`-protokollaa ja määrittelee `id`-kentän, jotta tietojen näyttäminen myöhemmin `ForEach`-silmukan kanssa olisi kätevää.

Sen jälkeen voimme luoda opiskelijainstanssin:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Tämä koodi tarkoittaa, että `Student`-rakenteen pohjalta voidaan luoda tietyn opiskelijan tiedot.

Tässä `Student` on tyyppi, ja `Student(...)` tarkoittaa luotua instanssia.

SwiftUI:ssa voimme sijoittaa tämän instanssin muuttujaan ja sitten näyttää sen.

Esimerkiksi:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Näin voimme nähdä näkymässä tämän opiskelijan nimen: `Fang Junyu`.

Tässä loimme ensin `Student`-instanssin, sitten sijoitimme sen `student`-muuttujaan ja lopuksi luimme sen ominaisuuden `student.name`:n kautta.

## Mikä on instanssi

Kun alamme ensimmäistä kertaa opetella `struct`ia, sana "instanssi" voi tuntua hyvin vieraalta.

Todellisuudessa olemme kuitenkin käyttäneet instansseja aivan alusta asti, emme vain aiemmin kiinnittäneet niihin erityistä huomiota.

Esimerkiksi:

```swift
let name = "Fang Junyu"
```

Tässä `"Fang Junyu"` on merkkijonoarvo, ja pohjimmiltaan se on `String`-tyypin instanssi.

Voimme kirjoittaa sen myös näin:

```swift
let name = String("Fang Junyu")
```

Nämä kaksi kirjoitustapaa ilmaisevat saman asian: `String`-tyypin instanssin luomisen ja sen sijoittamisen `name`-muuttujaan.

Samoin myös `Int` toimii näin:

```swift
let num = 3
```

Tässä `3` on pohjimmiltaan `Int`-tyypin arvo, ja sen voi ymmärtää myös `Int`-instanssina.

Instanssi ei siis ole jokin erityinen käsite, joka esiintyisi vain `struct`issa.

Olipa kyseessä `String`, `Int`, `Double`, `Bool` tai mukautettu `Student`, kaikki voivat luoda instansseja.

Siksi, kun kirjoitamme:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

se on pohjimmiltaan sama asia kuin `String`- tai `Int`-instanssin luominen, paitsi että `Student` on meidän itse määrittelemämme tyyppi.

## Konstruktori

Kun luomme instanssin:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

todellisuudessa kutsumme `Student`in alustamismetodia eli `init`iä.

Voit ymmärtää konstruktorin näin: **se on sisäänkäynti, joka vastaa ominaisuuksien arvojen asettamisesta instanssia luotaessa.**

Toisin sanoen ennen kuin instanssi on oikeasti valmis, sen täytyy yleensä ensin kulkea `init`in kautta.

Esimerkiksi kun aiemmin opettelimme SwiftUI-näkymien elinkaarta, kirjoitimme tällaista koodia:

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
    }
}
```

Tässä `init()` suoritetaan, kun `ContentView`-instanssi luodaan, kun taas `onAppear` suoritetaan vasta, kun näkymä oikeasti ilmestyy ruudulle. Toisin sanoen näkymän luominen ja näkymän näyttäminen eivät tapahdu samassa hetkessä.

Samoin, kun luomme `Student(...)`, kutsumme samalla myös `Student`in konstruktoria.

### Järjestelmän automaattisesti luoma konstruktori

Kun määrittelimme `Student`in, emme kirjoittaneet `init`iä käsin:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Silti voimme yhä luoda instanssin suoraan:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Miksi instanssin voi luoda ilman kirjoitettua konstruktoria?

Koska `struct`in kohdalla, jos emme kirjoita konstruktoria käsin, järjestelmä luo meille yleensä automaattisesti sopivan konstruktorin.

Opiskelun alkuvaiheessa tämän voi ymmärtää yksinkertaisesti näin: Swift täydentää alustuskoodin automaattisesti puolestamme.

Karkeasti ymmärrettynä järjestelmä täydentää meille seuraavan koodin:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Tässä pitää kiinnittää huomiota yhteen yksityiskohtaan:

```swift
let id = UUID()
```

`id`:llä on jo oletusarvo, joten instanssia luotaessa meidän ei tarvitse antaa `id`:tä enää käsin.

Toisin sanoen ominaisuudet, joilla ei ole oletusarvoa, täytyy yleensä antaa konstruktorissa; ominaisuudet, joilla jo on oletusarvo, voivat yleensä käyttää suoraan alkuperäistä oletusarvoaan.

Siksi `Student`-instanssia luotaessa meidän tarvitsee antaa vain `name`, `sex`, `phone`, `age` ja `address`.

### Kääntäjän vihjeet

Lisäksi kun kirjoitamme `Student(...)` Xcodessa, voimme myös nähdä järjestelmän antamat parametrivihjeet.

![student](../../Resource/022_student.png)

Tämäkin itse asiassa osoittaa, että nykyisellä tyypillä todella on järjestelmän automaattisesti luoma konstruktori.

### Konstruktorin kirjoittaminen itse

Vaikka järjestelmä voi luoda konstruktorin automaattisesti, joskus tämä oletusalustustapa ei täysin vastaa tarpeitamme.

Esimerkiksi meillä on `Movie`-rakenne:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Järjestelmän automaattisesti luoman konstruktorin mukaan meidän täytyy instanssia luotaessa antaa nämä kolme parametria samanaikaisesti:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Mutta jos nyt haluamme syöttää joukon vanhoja elokuvia ja tiedämme vain elokuvien nimet, mutta emme tiedä ohjaajaa tai arvosanaa, tämä on hieman hankalaa.

Koska silloin voimme kirjoittaa sen vain näin:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Vaikka tämä toimii, `--`:n toistuva kirjoittaminen joka kerta ei ole kätevää.

Tässä vaiheessa voimme kirjoittaa konstruktorin:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Näin vanhoja elokuvia luotaessa meidän tarvitsee antaa vain `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Tämä on yksi itse kirjoitetun konstruktorin merkityksistä: **tehdä instanssien luomistavasta paremmin todellisia tarpeita vastaava.**

### Mukautetun konstruktorin tarkastelu

Katsotaan tätä käsin kirjoitettua konstruktoria, jonka näimme juuri äsken:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Tämän koodin merkitys on, että `Movie`-instanssia luotaessa tarvitsee antaa vain yksi parametri, `name`.

Sen jälkeen konstruktorin sisällä annettu `name` sijoitetaan instanssin omaan `name`-ominaisuuteen, ja `director` sekä `rating` saavat oletusarvoksi `--`.

Tässä `self` tarkoittaa "tätä nykyistä instanssia itseään".

Esimerkiksi:

```swift
self.name = name
```

Vasemman puolen `self.name` tarkoittaa instanssin ominaisuutta; oikean puolen `name` tarkoittaa meille annettua parametria.

Sen voi yksinkertaisesti ymmärtää niin, että ulkoa annettu arvo tallennetaan instanssin omaan ominaisuuteen.

Kun kaikki ominaisuudet ovat saaneet arvot, tämän instanssin luominen on valmis.

### Konstruktorin mekanismi

Kun ilmoitamme konstruktorin eksplisiittisesti, tapahtuu myös toinen muutos:

järjestelmän alun perin automaattisesti luomaa konstruktoria ei yleensä enää voi käyttää suoraan.

Esimerkiksi:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Jos nyt kirjoitamme jälleen näin:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

kääntäjä antaa virheen:

```swift
Extra arguments at positions #2, #3 in call
```

Se tarkoittaa: annoit ylimääräisiä parametreja.

Miksi tämä virhe ilmestyy?

Koska nykyisessä `Movie`-rakenteessa on vain tämä yksi käsin ilmoittamasi konstruktori:

```swift
init(name: String)
```

Se hyväksyy vain yhden parametrin `name` eikä hyväksy `director`ia tai `rating`ia.

Toisin sanoen kun lisäät oman konstruktorisi käsin, alun perin automaattisesti luotua alustustapaa ei voi enää käyttää suoraan.

Jos haluamme tukea sekä "vain nimen antamista" että "täydellisten tietojen antamista", meidän täytyy itse lisätä vielä yksi täydellinen konstruktori:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Näin meillä on kaksi erilaista konstruktoria.

Vanhaa elokuvaa luotaessa voimme kirjoittaa näin:

```swift
Movie(name: "The Night of the Hunter")
```

Uutta elokuvaa täydellisillä tiedoilla luotaessa voimme kirjoittaa näin:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Tämä kirjoitustapa myös osoittaa, että samalla tyypillä voi olla useita konstruktoreita, kunhan niiden parametrimuodot ovat erilaisia.

## Mitä on ylikuormitus

Tähän lisätään vielä yksi tarpeellinen tietokohta.

Juuri äsken kirjoitimme `Movie`:lle kaksi `init`iä:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Tällaista kirjoitustapaa, "sama funktion nimi mutta eri parametrit", kutsutaan "ylikuormitukseksi".

Tässä molempien funktioiden nimi on `init`, mutta koska niiden vastaanottamat parametrit ovat erilaiset, Swift pystyy erottamaan, mitä funktiota kutsut.

Esimerkiksi:

```swift
Movie(name: "Days of Heaven")
```

kutsuu:

```swift
init(name: String)
```

Kun taas:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

kutsuu toista täydellistä versiota alustamismetodista.

Ylikuormituksen tehtävä on siis: antaa saman tyypin tarjota erilaisia luontitapoja eri tilanteisiin.

## Tutustutaan classiin

Seuraavaksi tutustutaan lyhyesti myös `class`iin.

Swiftissä yleisen `struct`in lisäksi monet ohjelmointikielet käyttävät `class`ia instanssien luomiseen, kuten Java, C#, Kotlin ja muut.

Swiftissä `class`in kirjoitustapa on hyvin lähellä `struct`ia.

Esimerkiksi:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Huomaat, että lukuun ottamatta avainsanan muuttumista `struct`ista `class`iksi, muut osat näyttävät lähes samoilta.

Myös instanssin luomistapa on hyvin samankaltainen:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Siksi syntaksitasolla `struct` ja `class` todella muistuttavat paljon toisiaan.

### Ero Structin ja Classin välillä

Vaikka `struct` ja `class` näyttävät hyvin samanlaisilta, ne eivät ole täysin samoja.

**1. Alustamistapa on erilainen**

`struct`in kohdalla, jos emme kirjoita konstruktoria käsin, järjestelmä luo yleensä automaattisesti sopivan alustamismetodin.

Mutta `class`in kohdalla, jos on ominaisuuksia, joilla ei vielä ole oletusarvoa, meidän täytyy yleensä kirjoittaa `init` käsin, muuten tulee virhe.

Esimerkiksi:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Tämä `class` aiheuttaa virheen, koska sillä ei ole konstruktoria ja ominaisuuksia ei ole alustettu.

Kääntäjä näyttää jotakin tämän kaltaista:

```swift
Class 'Movie' has no initializers
```

Siksi tässä esimerkissä `class` tarvitsee pakollisesti käsin kirjoitetun konstruktorin.

**2. `struct` on arvotyyppi, `class` on viitetyyppi**

`struct` on arvotyyppi ja `class` on viitetyyppi.

Opiskelun alkuvaiheessa näitä kahta käsitettä ei tarvitse hallita täysin, riittää että niistä on yksinkertainen yleiskuva.

Esimerkiksi `struct` muistuttaa enemmän "uuden arvon kopioimista".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Tässä `user1`:n sijoittaminen `user2`:een vastaa uuden datakopion tekemistä, joten `user2`:n muuttaminen ei vaikuta `user1`:een.

`class` taas muistuttaa enemmän "yhdessä samaan instanssiin viittaamista".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Tässä `user1` ja `user2` viittaavat samaan instanssiin.

Nyt meidän ei tarvitse täysin ymmärtää arvotyyppien ja viitetyyppien taustamekanismia; riittää, että tiedämme `struct`in sopivan paremmin itsenäisten tietojen tallentamiseen ja `class`in sopivan paremmin tilanteisiin, joissa usean paikan täytyy jakaa sama instanssi.

## Miten valita alkuvaiheessa

Nykyisessä vaiheessa tavallisten datamallien kohdalla kannattaa ensin harkita `struct`ia; kun tarvitaan jaettua dataa ja synkronoituja muutoksia, kannattaa harkita `class`ia.

Tämä ei ole ehdoton sääntö, mutta aloittelijalle se on riittävän käytännöllinen tapa tehdä arvio.

Erityisesti SwiftUI:ssa huomaat usein, että `struct` pystyy jo hoitamaan suurimman osan työstä.

Lisäksi monissa ohjelmointimateriaaleissa `class`in luomaa sisältöä kutsutaan myös "olioksi". Alkuvaiheessa voit vain ymmärtää sen instanssina ilman, että niitä tarvitsee tarkoituksella erottaa toisistaan.

## Yhteenveto

Tässä oppitunnissa opimme `struct`ista syvemmin ja samalla tutustuimme myös `class`iin; molempia voidaan käyttää tyyppien määrittelemiseen.

Tyypit voivat luoda instansseja. Kun instanssi luodaan, kutsutaan konstruktoria eli `init`iä.

`struct`in kohdalla, jos emme kirjoita konstruktoria käsin, järjestelmä luo yleensä automaattisesti sopivan konstruktorin. Jos oletuskonstruktori ei vastaa tarpeita, voimme myös kirjoittaa konstruktorin itse.

Lisäksi saimme alustavan käsityksen myös `struct`in ja `class`in erosta: `struct` on arvotyyppi, kun taas `class` on viitetyyppi. SwiftUI:ssa alkuvaiheessa vastaan tulee yleensä useammin `struct`.

Myöhemmin, kun opimme arvojen välittämistä näkymien välillä, datamalleja ja tilanhallintaa, kaikki nämä sisällöt tulevat edelleen käyttöön.
