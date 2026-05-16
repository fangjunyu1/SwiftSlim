# Eläintietosanakirja 

Tällä oppitunnilla jatkamme mukautettujen näkymien ja tiedon välittämisen harjoittelua.

Luomme yksinkertaisen eläintietosanakirjanäkymän. Sivulla näytetään viisi eläintä. Kun käyttäjä napauttaa eläintä, näkyviin tulee yksityiskohtanäkymä, joka näyttää eläimen kuvan, levinneisyysalueen, elinympäristön ja kuvauksen.

Toteutuksen tulos:

![view](../../../Resource/029_view.png)

Tämän esimerkin avulla voimme harjoitella tietorakenteen, listan näyttämisen, napautusvuorovaikutuksen ja Sheet-ponnahdusnäkymän yhteistyötä.

## Kuvamateriaalien valmisteleminen

Ensin meidän täytyy valmistella viisi eläinkuvaa:

- Delfiini: `dolphin.jpg`
- Kirahvi: `giraffe.jpg`
- Leijona: `lion.jpg`
- Panda: `panda.jpg`
- Jääkarhu: `polarBear.jpg`

Voit käyttää seuraavia kuvia:

[Delfiini](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Kirahvi](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Leijona](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Jääkarhu](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Kun olet ladannut kuvat, vedä ne Xcode-projektin `Assets`-resurssikansioon.

![assets](../../../Resource/029_assets.png)

On hyvä huomata, että kun käytät kuvaa koodissa, `.jpg`-päätettä ei yleensä tarvitse kirjoittaa.

Jos esimerkiksi kuvan resurssin nimi on `dolphin`, kirjoita koodiin näin:

```swift
Image("dolphin")
```

Jos kuvan nimi kirjoitetaan väärin, kuva ei näy oikein.

Huomautus: yllä olevat kuvamateriaalit ovat Wikimedia-projekteista. Käytettäessä on suositeltavaa säilyttää alkuperäiset linkit ja lähdetiedot.

## Animal-rakenteen luominen

Tällä sivulla jokaisella eläimellä on useita tietoja:

- Eläimen nimi
- Eläimen kuva
- Eläimen emoji
- Levinneisyysalue
- Elinympäristö
- Eläimen kuvaus

Jos jaamme nämä tiedot moniin erillisiin muuttujiin, koodista tulee helposti sekavaa. Siksi voimme luoda `Animal`-rakenteen ja koota yhden eläimen tiedot yhteen paikkaan.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

Tässä koodissa:

- `id`: eläimen yksilöllinen tunniste.
- `name`: eläimen nimi.
- `imageName`: eläimen kuvan nimi.
- `avatarEmoji`: eläimen emoji.
- `distributionArea`: levinneisyysalue.
- `habitat`: elinympäristö.
- `animalDescription`: eläimen kuvaus.

Tässä kohdassa:

```swift
let id = UUID()
```

`id` tunnistaa jokaisen eläimen. Koska myöhemmin käytämme `ForEach`-rakennetta eläinlistan näyttämiseen ja käytämme myös `.sheet(item:)`-muotoa yksityiskohtien näyttämiseen valitun eläimen perusteella, `Animal`-rakenteen täytyy noudattaa `Identifiable`-protokollaa.

`Identifiable` kertoo SwiftUI:lle, että jokaisella eläimellä on `id`, jonka avulla se voidaan erottaa muista.

## Eläindatan luominen

Seuraavaksi luomme `ContentView`-näkymään eläintaulukon.

Taulukkoon tallennetaan viisi `Animal`-arvoa, ja jokainen `Animal` edustaa yhtä eläintä.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfiini
        Animal(
            name: "Delfiini",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lämpimät ja lauhkeat meret eri puolilla maailmaa.",
            habitat: "Meret, rannikkovedet ja jotkin suuret joet.",
            animalDescription: "Delfiinit ovat älykkäitä merinisäkkäitä. Ne elävät ryhmissä, viestivät äänillä ja tunnetaan leikkisästä käyttäytymisestään."
        ),
        // Kirahvi
        Animal(
            name: "Kirahvi",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannit ja avoimet metsämaat Afrikassa.",
            habitat: "Ruohomaat, savannit ja avoimet metsät.",
            animalDescription: "Kirahvit ovat korkeimpia maaeläimiä. Niillä on pitkä kaula, pitkät jalat, ja ne syövät yleensä korkeiden puiden lehtiä."
        ),
        // Leijona
        Animal(
            name: "Leijona",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Esiintyy pääasiassa Saharan eteläpuolisessa Afrikassa, ja pieni populaatio elää Länsi-Intiassa.",
            habitat: "Ruohomaat, savannit ja avoimet metsämaat.",
            animalDescription: "Leijonat ovat voimakkaita suuria kissaeläimiä. Ne elävät yleensä laumoissa ja niitä kutsutaan usein eläinten maailman kuninkaiksi."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Vuoristometsät Keski-Kiinassa.",
            habitat: "Bambumetsät viileillä ja kosteilla vuoristoalueilla.",
            animalDescription: "Pandat ovat karhuja, jotka tunnetaan mustavalkoisesta turkistaan. Ne syövät pääasiassa bambua ja ovat yksi maailman helpoimmin tunnistettavista eläimistä."
        ),
        // Jääkarhu
        Animal(
            name: "Jääkarhu",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiset alueet pohjoisnavan ympärillä.",
            habitat: "Merijää, rannikkoalueet ja kylmät arktiset ympäristöt.",
            animalDescription: "Jääkarhut ovat suuria karhuja, jotka ovat sopeutuneet kylmiin ympäristöihin. Ne ovat vahvoja uimareita ja ovat hylkeiden metsästyksessä pääasiassa riippuvaisia merijäästä."
        )
    ]

    var body: some View {
        Text("Eläintietosanakirja")
    }
}
```

Tässä `animals` on taulukko:

```swift
let animals: [Animal]
```

`[Animal]` tarkoittaa, että tähän taulukkoon tallennetaan useita `Animal`-arvoja.

Toisin sanoen `animals` ei ole yksi eläin, vaan joukko eläimiä.

## Eläinlistan näyttäminen

Nyt voimme käyttää `ForEach`-rakennetta eläinlistan näyttämiseen.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/029_view1.png)

Tässä koodissa:

```swift
ForEach(animals) { animal in
    ...
}
```

se tarkoittaa `animals`-taulukon läpikäymistä.

Jokaisella kierroksella `animal` tarkoittaa juuri sillä hetkellä näytettävää eläintä.

Esimerkiksi ensimmäisellä kierroksella `animal` on delfiini; toisella kierroksella `animal` on kirahvi.

Siksi voimme näyttää nykyisen eläimen tiedot seuraavasti:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Näin saamme viisi eläintä näkyviin.

## Eläinlistan tekeminen napautettavaksi

Nyt lista on jo näkyvissä, mutta sitä ei voi vielä napauttaa.

Jos haluamme näyttää yksityiskohdat eläintä napautettaessa, meidän täytyy ensin tallentaa “nykyinen valittu eläin”.

Siksi lisäämme `ContentView`-näkymään tilamuuttujan:

```swift
@State private var selectedAnimal: Animal? = nil
```

Tässä `selectedAnimal` on valinnainen tyyppi `Animal?`.

Se tarkoittaa, että siinä voi olla yksi eläin tai ei yhtään eläintä.

Oletusarvo on `nil`, mikä tarkoittaa, että alussa mitään eläintä ei ole valittu.

Sen jälkeen muutamme jokaisen eläinrivin `Button`-painikkeeksi:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Tärkein rivi on tämä:

```swift
selectedAnimal = animal
```

Kun käyttäjä napauttaa jotakin eläintä, tallennamme kyseisen eläimen `selectedAnimal`-muuttujaan.

Jos käyttäjä esimerkiksi napauttaa delfiiniä, `selectedAnimal` tallentaa delfiinin.

Jos käyttäjä napauttaa pandaa, `selectedAnimal` tallentaa pandakarhun.

Toisin sanoen `selectedAnimal` tallentaa sen, mitä eläintä käyttäjä parhaillaan napautti.

## Sheet-ponnahdusnäkymä

Nyt pystymme jo tallentamaan painikkeen avulla “nykyisen napautetun eläimen”.

Seuraavaksi meidän täytyy toteuttaa ponnahdusnäkymä, joka näyttää eläimen yksityiskohdat.

![view](../../../Resource/029_view2.png)

SwiftUI:ssa tällaisen ponnahdusefektin voi toteuttaa `Sheet`-rakenteella.

`Sheet` voidaan ymmärtää väliaikaisesti esiin tulevaksi sivuksi. Se näkyy nykyisen sivun päällä, ja käyttäjä voi sisällön katsottuaan sulkea sen pyyhkäisemällä alaspäin.

## Sheet-esimerkki

Ennen kuin näytämme varsinaiset eläimen yksityiskohdat, käytämme ensin yksinkertaista esimerkkiä ymmärtääksemme, miten `Sheet` ponnahtaa näkyviin.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Näytä Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet-näkymä")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/029_view3.png)

Tässä koodissa loimme Bool-arvon:

```swift
@State private var showSheet = false
```

`showSheet` on oletuksena `false`, mikä tarkoittaa, että `Sheet` ei näy alussa.

Kun painiketta napautetaan:

```swift
showSheet.toggle()
```

`toggle()` tarkoittaa Bool-arvon vaihtamista.

Jos alkuperäinen arvo on `false`, `toggle()`-kutsun jälkeen siitä tulee `true`.

Jos alkuperäinen arvo on `true`, `toggle()`-kutsun jälkeen siitä tulee `false`.

Siksi painikkeen napauttamisen jälkeen `showSheet` muuttuu arvosta `false` arvoon `true`.

Kun `showSheet` muuttuu arvoksi `true`, seuraava koodi näyttää `Sheet`-näkymän:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-näkymä")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Tämä koodi tarkoittaa: kun `showSheet` on `true`, näytetään `Sheet`, ja sen sisällä näytetään `Text("Sheet-näkymä")`.

Näyttötulos:

![view](../../../Resource/029_view4.png)

Tämä kirjoitustapa sopii kiinteän sisällön näyttämiseen.

Esimerkiksi painikkeen napauttamisen jälkeen voidaan näyttää asetussivu, ohjesivu, vinkkisivu ja niin edelleen.

### Sheet-näkymän sijainti

Vaikka `Sheet` on ponnahdusnäkymä, SwiftUI:ssa sitä ei kirjoiteta suoraan itsenäisenä näkymänä kuten `Text()` tai `Image()`, vaan sitä käytetään näkymämuokkaimena.

Toisin sanoen `.sheet(...)` on samankaltainen kuin `.font()`, `.padding()` ja `.shadow()`: se täytyy lisätä jonkin näkymän perään.

Esimerkiksi:

```swift
Button("Näytä Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-näkymä")
}
```

Tässä esimerkissä `.sheet` on lisätty `Button`-painikkeen perään.

Kun `showSheet` muuttuu arvoksi `true`, SwiftUI näyttää `Sheet`-näkymän ja näyttää aaltosulkeiden sisällön:

```swift
Text("Sheet-näkymä")
```

Käytännön kehitystyössä, jos yhdellä sivulla on useita painikkeita, jokaisen painikkeen perään ei kuitenkaan yleensä lisätä omaa `.sheet`-muokkainta.

Tavallisempi tapa on lisätä `.sheet` ulomman näkymän perään.

Esimerkiksi:

```swift
VStack {
    Button("Näytä Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-näkymä")
}
```

Painike vastaa `showSheet`-arvon muuttamisesta, ja ulompi näkymä vastaa `Sheet`-näkymän näyttämisestä sen mukaan, onko `showSheet` arvoltaan `true`.

## Valinnaiseen arvoon sidottu Sheet

Aiemmin opittu kirjoitustapa oli:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-näkymä")
}
```

Tämä kirjoitustapa sopii kiinteän sivun näyttämisen ja piilottamisen hallintaan.

Mutta eläintietosanakirjaesimerkissä meidän ei tarvitse tietää vain “näytetäänkö `Sheet`”, vaan myös “mitä eläintä napautettiin”.

Esimerkiksi:

Kun käyttäjä napauttaa delfiiniä, `Sheet`-näkymässä pitäisi näyttää delfiinin tiedot.

Kun käyttäjä napauttaa pandaa, `Sheet`-näkymässä pitäisi näyttää pandan tiedot.

Siksi tähän sopii paremmin toinen Sheet-kirjoitustapa:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Sheetissä näytettävä sisältö
}
```

Tässä koodissa `Sheet` on sidottu valinnaiseen arvoon `selectedAnimal`.

Huomaa, että `item:`-kohdan jälkeen kirjoitetaan `$selectedAnimal`, ei `selectedAnimal`.

Tämä johtuu siitä, että `Sheet` ei vain lue `selectedAnimal`-arvoa, vaan sen täytyy myös päättää arvon muutosten perusteella, näytetäänkö se.

Tämän koodin voi ymmärtää näin:

- Kun `selectedAnimal` on `nil`, `Sheet`-näkymää ei näytetä.
- Kun `selectedAnimal` sisältää arvon, `Sheet`-näkymä näytetään.
- Kun `Sheet` suljetaan, SwiftUI muuttaa `selectedAnimal`-arvon takaisin arvoksi `nil`.

SwiftUI välittää `selectedAnimal`-muuttujaan tallennetun eläimen aaltosulkeiden sisällä olevalle `animal`-arvolle.

Toisin sanoen `.sheet(item:)` ei vain hallitse ponnahdusta, vaan se myös välittää valitun datan `Sheet`-näkymään.

## Eläimen nimen näyttäminen Sheet-näkymässä

Nyt emme vielä kiirehdi luomaan monimutkaista yksityiskohtanäkymää.

Jotta koodi olisi helpompi ymmärtää, näytämme ensin `Sheet`-näkymässä nykyisen eläimen nimen.

Lisää `.sheet(item:)` `VStack`-rakenteen ulkopuolelle:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Tärkeintä tässä on tämä koodi:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kun `selectedAnimal` sisältää arvon, `Sheet` ponnahtaa näkyviin.

Aaltosulkeiden sisällä oleva `animal` on nykyinen valittu eläin.

Siksi:

```swift
Text(animal.name)
```

näyttää juuri napautetun eläimen nimen.

Esimerkiksi kun napautat `Delfiini`, Sheetissä näkyy `Delfiini`.

Kun napautat `Panda`, `Sheet`-näkymässä näkyy `Panda`.

Näin olemme toteuttaneet vaikutuksen, jossa eri eläimiä napauttamalla avautuu eri eläimen nimi.

Eläimen nimen näyttäminen:

![view](../../../Resource/029_view5.png)

Eläimen yksityiskohdissa ei kuitenkaan pitäisi näyttää vain nimeä, vaan myös nimi, levinneisyysalue, elinympäristö ja kuvaus.

Jos kirjoitamme kaiken tämän koodin `.sheet`-lohkoon, koodista tulee pitkä ja vaikealukuinen.

Siksi luomme seuraavaksi uuden mukautetun näkymän, joka vastaa erityisesti eläimen yksityiskohtien näyttämisestä.

## Eläimen yksityiskohtanäkymän luominen

Seuraavaksi luomme uuden mukautetun näkymän `AnimalDetailView`.

Tämä näkymä vastaanottaa yhden `Animal`-arvon ja näyttää eläimen yksityiskohdat.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Levinneisyysalue** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Elinympäristö** ：\(animal.habitat)")

                    Divider()

                    Text("**Eläimen kuvaus** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Näyttötulos:

![view](../../../Resource/029_view2.png)

Tässä tärkeää on:

```swift
var animal: Animal
```

Tämä tarkoittaa, että `AnimalDetailView` tarvitsee ulkopuolelta yhden eläimen.

Kun eläin on vastaanotettu, yksityiskohtanäkymä voi käyttää sen eri tietoja:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Toisin sanoen `AnimalDetailView` vastaa vain sille välitetyn eläimen näyttämisestä.

### Markdownin lihavoitu teksti

Yksityiskohtanäkymässä kirjoitimme tällaista koodia:

```swift
Text("**Elinympäristö:** \(animal.habitat)")
```

Tässä on kaksi tietokohtaa.

Ensimmäiseksi `**Elinympäristö:**` käyttää `Markdown`-syntaksia. Kahden tähtimerkin sisään kirjoitettu teksti näytetään lihavoituna.

Toiseksi `\()` on merkkijonointerpolaatio, jonka avulla muuttujan arvo voidaan näyttää tekstissä.

Tämä koodi näyttää ensin lihavoidun tekstin `Elinympäristö:` ja näyttää sen jälkeen tämän eläimen elinympäristön.

## Yksityiskohtanäkymän näyttäminen Sheetissä

Kun `AnimalDetailView` on luotu, voimme palata `ContentView`-näkymään ja korvata `Sheet`-näkymässä aiemmin olleen niminäkymän yksityiskohtanäkymällä.

Aiemmin se oli:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nyt muutamme sen muotoon:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tässä `animal:` on `AnimalDetailView`-näkymän parametrin nimi.

Jälkimmäinen `animal` on nykyinen eläin, jonka `.sheet(item:)` välittää sisään.

Se tarkoittaa, että nykyinen napautettu eläin välitetään `AnimalDetailView`-näkymälle näytettäväksi.

Koko rakenne:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Kun käyttäjä napauttaa eläintä:

```swift
selectedAnimal = animal
```

`selectedAnimal` muuttuu arvosta `nil` konkreettiseksi eläimeksi. Kun `Sheet` havaitsee, että `selectedAnimal` sisältää arvon, se avaa näkymän.

`Sheet` välittää `selectedAnimal`-muuttujassa olevan eläimen `AnimalDetailView`-näkymälle, ja `AnimalDetailView` näyttää eläimen yksityiskohdat.

Näin toteutimme toiminnon, jossa eläinlistaa napauttamalla avautuvat vastaavan eläimen yksityiskohdat.

## Sheetin kahden kirjoitustavan ero

Nyt olemme käyttäneet `.sheet(item:)`-muotoa eläimen yksityiskohtanäkymän näyttämiseen.

Tässä voimme lyhyesti tiivistää `Sheet`-näkymän kaksi yleistä kirjoitustapaa.

### Ensimmäinen tapa on sitoa Bool-arvo

```swift
@State private var showSheet = false

Button("Näytä Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-näkymä")
}
```

Tämä kirjoitustapa sopii kiinteän sisällön näyttämiseen, esimerkiksi asetussivuille, ohjesivuille ja vinkkisivuille.

`showSheet` on Bool-arvo, jolla on vain kaksi tilaa: `true` ja `false`.

Kun `showSheet` on `true`, `Sheet` näytetään.

Kun `showSheet` on `false`, `Sheet` ei näy.

### Toinen tapa on sitoa valinnainen arvo

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tämä kirjoitustapa sopii erilaisten sisältöjen näyttämiseen valitun datan perusteella.

Tällä oppitunnilla napautamme eri eläimiä ja meidän täytyy näyttää eri eläinten yksityiskohdat, joten `.sheet(item:)` sopii paremmin.

## Täydellinen koodi

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Eläimen nimi
    let name: String
    
    // Eläimen kuva
    let imageName: String
    
    // Eläimen tunniste-emoji
    let avatarEmoji: String
    
    // Levinneisyysalue
    let distributionArea: String
    
    // Elinympäristö
    let habitat: String
    
    // Eläimen kuvaus
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfiini
        Animal(
            name: "Delfiini",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Lämpimät ja lauhkeat meret eri puolilla maailmaa.",
            habitat: "Meret, rannikkovedet ja jotkin suuret joet.",
            animalDescription: "Delfiinit ovat älykkäitä merinisäkkäitä. Ne elävät ryhmissä, viestivät äänillä ja tunnetaan leikkisästä käyttäytymisestään."
        ),
        // Kirahvi
        Animal(
            name: "Kirahvi",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannit ja avoimet metsämaat Afrikassa.",
            habitat: "Ruohomaat, savannit ja avoimet metsät.",
            animalDescription: "Kirahvit ovat korkeimpia maaeläimiä. Niillä on pitkä kaula, pitkät jalat, ja ne syövät yleensä korkeiden puiden lehtiä."
        ),
        // Leijona
        Animal(
            name: "Leijona",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Esiintyy pääasiassa Saharan eteläpuolisessa Afrikassa, ja pieni populaatio elää Länsi-Intiassa.",
            habitat: "Ruohomaat, savannit ja avoimet metsämaat.",
            animalDescription: "Leijonat ovat voimakkaita suuria kissaeläimiä. Ne elävät yleensä laumoissa ja niitä kutsutaan usein eläinten maailman kuninkaiksi."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Vuoristometsät Keski-Kiinassa.",
            habitat: "Bambumetsät viileillä ja kosteilla vuoristoalueilla.",
            animalDescription: "Pandat ovat karhuja, jotka tunnetaan mustavalkoisesta turkistaan. Ne syövät pääasiassa bambua ja ovat yksi maailman helpoimmin tunnistettavista eläimistä."
        ),
        // Jääkarhu
        Animal(
            name: "Jääkarhu",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiset alueet pohjoisnavan ympärillä.",
            habitat: "Merijää, rannikkoalueet ja kylmät arktiset ympäristöt.",
            animalDescription: "Jääkarhut ovat suuria karhuja, jotka ovat sopeutuneet kylmiin ympäristöihin. Ne ovat vahvoja uimareita ja ovat hylkeiden metsästyksessä pääasiassa riippuvaisia merijäästä."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Levinneisyysalue** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Elinympäristö** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Eläimen kuvaus** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Yhteenveto

Tällä oppitunnilla toteutimme yksinkertaisen eläintietosanakirjasivun.

Käytimme ensin `Animal`-rakennetta eläintietojen tallentamiseen, tallensimme sitten viisi eläintä taulukkoon ja näytimme eläinlistan `ForEach`-rakenteella.

Kun käyttäjä napauttaa jotakin eläintä, tallennamme kyseisen eläimen `selectedAnimal`-muuttujaan:

```swift
selectedAnimal = animal
```

Kun `selectedAnimal` sisältää arvon, `.sheet(item:)` avaa yksityiskohtanäkymän ja välittää valitun eläimen `AnimalDetailView`-näkymälle.

Tällä oppitunnilla tärkeintä ei ole käyttöliittymän tyyli, vaan tämän tiedonvälitysreitin ymmärtäminen:

```swift
Napauta eläintä → selectedAnimal tallentaa eläimen → Sheet avautuu → AnimalDetailView näyttää yksityiskohdat
```

Kun ymmärrät tämän reitin, voit myöhemmin tehdä lisää samankaltaisia toimintoja, kuten tuotetietoja, kurssitietoja, artikkelitietoja ja yhteystietoja.
