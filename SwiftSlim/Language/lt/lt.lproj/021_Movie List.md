# Filmų sąrašas

Šioje pamokoje sukursime filmų sąrašą.

![movie](../../Resource/021_movie.png)

Sąraše bus rodoma kiekvieno filmo plakatas, pavadinimas, režisierius ir įvertinimas.

Šiame pavyzdyje išmoksime labai svarbią sąvoką: `struct` struktūrą. Ji padeda sujungti kelias filmo dalis į vieną visumą. Be to, dar susipažinsime su `UUID()`, `ForEach`, `Divider` skiriamąja linija ir tuo, kaip naudoti pasirinktinius objektus duomenims valdyti.

Šios žinios labai dažnos vėlesniame SwiftUI kūrime. Išmokę šią pamoką, ne tik sukursite filmų sąrašą, bet ir pradėsite suprasti, „kaip duomenų rinkinį paversti sąsaja“.

## Vienas filmas

Pirmiausia galime pradėti nuo vieno filmo sąsajos kūrimo.

![movie](../../Resource/021_movie1.png)

Šios sąsajos išdėstymą daugiausia sudaro dvi dalys: kairėje yra filmo plakatas, dešinėje - filmo aprašymas.

### Filmo plakatas

Kairėje rodoma filmo plakatas, ir paveikslui parodyti galime naudoti `Image`.

Pavyzdžiui:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Šis kodas reiškia, kad rodoma nuotrauka, kurios pavadinimas yra `"The Shawshank Redemption"`.

Čia svarbu atkreipti dėmesį, kad paveikslėlio pavadinimas turi tikrai egzistuoti `Assets` išteklių aplanke, kitaip sąsaja šio paveikslėlio teisingai neparodys.

![movie](../../Resource/021_movie2.png)

Šių modifikatorių paskirtis yra tokia:

- `resizable()` reiškia, kad paveikslėlio dydį galima keisti.
- `scaledToFit()` reiškia, kad mastelis išlaiko pradinį santykį ir apsaugo paveikslėlį nuo ištempimo bei deformacijos.
- `frame(height: 180)` reiškia, kad paveikslėlio aukštis nustatomas į 180.
- `cornerRadius(10)` reiškia, kad paveikslėliui nustatomas 10 kampų suapvalinimas.

Taip gauname tinkamo dydžio filmo plakatą su užapvalintais kampais.

![movie](../../Resource/021_movie3.png)

### Filmo aprašymas

Dešinėje rodoma filmo informacija, įskaitant filmo pavadinimą, režisierių ir įvertinimą.

![movie](../../Resource/021_movie4.png)

Šiai daliai parodyti galime naudoti `Text`:

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

Šiame kode `.font` reiškia šrifto dydį, o `.fontWeight` reiškia šrifto storį.

Kad tarpai tarp „filmo pavadinimo“, „režisieriaus informacijos“ ir „įvertinimo informacijos“ būtų aiškesni, čia išoriniame sluoksnyje naudojame `VStack` ir nustatome:

```swift
spacing: 10
```

Tai reiškia, kad tarp kiekvienos šio `VStack` viduje esančios turinio grupės tarpas bus 10.

Priežastis, kodėl režisierius ir įvertinimas kiekvienas dar kartą apgaubiami atskiru `VStack`, yra ta, kad jie abu priklauso tokiai struktūrai kaip „antraštė + turinys“. Todėl sąsajos lygmenys tampa aiškesni, o vėliau lengviau toliau koreguoti stilių.

Be to, `VStack` pagal numatymą lygiuojamas centre. Kad visas tekstas būtų lygiuojamas į kairę, nustatome:

```swift
alignment: .leading
```

Taip filmo aprašymo dalis atrodo tvarkingiau.

### Skiriamoji linija

Dabar, nors filmo aprašymo turinys jau turi atstumus dėl `spacing`, ribos tarp skirtingų dalių vis dar nėra pakankamai aiškios.

Šiuo metu galime pridėti skiriamąją liniją:

```swift
Divider()
```

Pavyzdžiui:

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

Taip filmo aprašymo dalyje atsiras aiškus atskyrimo efektas.

![movie](../../Resource/021_movie4.png)

`Divider` yra labai paprastas, bet dažnai naudojamas vaizdo elementas, kurio paskirtis - atskirti skirtingą turinį.

`VStack` viduje `Divider()` rodomas kaip horizontali linija.

`HStack` viduje `Divider()` rodomas kaip vertikali linija.

Be to, `Divider` stilių galima keisti naudojant `.frame`, `.background`, `.padding` ir kitus būdus.

Pavyzdžiui:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Taip sukuriama mėlyna, 2 storio skiriamoji linija su vidiniais tarpais iš kairės ir dešinės.

![divider](../../Resource/021_divider.png)

### Pilna sąsaja

Galiausiai galime naudoti `HStack`, kad filmo plakatas ir filmo aprašymas būtų išdėstyti vienas šalia kito.

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

Čia `HStack(spacing: 20)` reiškia, kad tarp kairės ir dešinės dalių paliekamas 20 tarpas.

Svarbu pastebėti, kad `Divider()` kaip ir anksčiau aptarti `TextField` bei `Slider`, pagal numatymą stengiasi užimti kiek įmanoma daugiau prieinamos vietos.

Todėl išoriniam `VStack`, esančiam dešinėje informacijos dalyje, nustatome fiksuotą plotį:

```swift
.frame(width: 200)
```

Taip skiriamosios linijos ir teksto srities plotis išliks vienodas, o bendras vaizdas bus tvarkingesnis.

Iki čia mes užbaigėme „vieno filmo“ rodymo sąsają.

![movie](../../Resource/021_movie1.png)

## Filmai saugomi masyve

Jei norime kelis filmus parodyti vieną po kito tuo pačiu stiliumi, tai reiškia, kad kiekvienam filmui reikėtų dar kartą rašyti panašų kodą.

Pavyzdžiui:

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

Nors taip parašytas kodas gali pasiekti rezultatą, jo vis daugės, o prižiūrėti bus labai nepatogu.

Pavyzdžiui, jei reikia visų filmų tarpus pakeisti iš `20` į `15`, arba dešinės pusės plotį pakeisti iš `200` į
`220`, teks ranka keisti kiekvieną pasikartojančią kodo dalį.

Akivaizdu, kad tai nėra efektyvus būdas.

Anksčiau jau mokėmės masyvų ir taip pat mokėmės naudoti `ForEach`, kad pagal masyvą pakartotinai parodytume vaizdus.

Pavyzdžiui:

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

Toks būdas labai tinka situacijoms, kai turimas tik vienas duomuo, pavyzdžiui, paveikslėlių pavadinimų rinkinys.

Tačiau filmas nėra tik viena reikšmė. Jame bent jau yra:

1. Filmo plakatas
2. Filmo pavadinimas
3. Režisierius
4. Įvertinimas

Kitaip tariant, vienas filmas iš tikrųjų yra susijusių duomenų rinkinys, o ne atskira viena eilutė.

Jei naudotume tik masyvus, šią informaciją galėtume saugoti tik atskirai:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Rodant, tektų remtis tais pačiais indeksais, kad viskas atitiktų vienas kitą:

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

Šio rašymo būdo problema yra ta, kad jo priežiūros kaina labai didelė.

Taip yra todėl, kad vieno filmo duomenys išskaidomi į kelis masyvus. Užtenka, kad kuriame nors masyve būtų vienu elementu daugiau, vienu mažiau arba kitokia tvarka, ir rodymo rezultatas bus neteisingas.

Ypač pridedant arba šalinant filmus, reikia vienu metu keisti kelis masyvus, todėl labai lengva ką nors praleisti.

Taigi, kaip sujungti tokią informaciją kaip „filmo pavadinimas, režisierius, įvertinimas“ į vieną visumą?

Tam reikia naudoti `struct`.

## `struct` struktūros apibrėžimas

Swift kalboje `struct` reiškia „struktūrą“.

Galite ją suprasti kaip „pasirinktinį duomenų tipą“, kuris leidžia sujungti kelis susijusius laukus į vieną visumą.

Bazinis naudojimas:

```swift
struct StructName {
	let name: String
}
```

Šiame kode `struct` yra raktažodis, reiškiantis, kad apibrėžiame struktūrą. `StructName` yra struktūros pavadinimas.

Laužtiniuose skliaustuose esantis turinys yra laukai, kuriuos ši struktūra apima, ir kiekvienam laukui būtina aiškiai nurodyti pavadinimą bei tipą.

Paprastai `struct` pavadinimai rašomi iš didžiosios raidės, pavyzdžiui, `Movie`, `Student`, `UserInfo`. Tai dažnas Swift pavadinimų stilius.

Galite paprastai įsivaizduoti `struct` kaip tuščią dėžutę, kurioje kiekvienas laukas yra tarsi iš anksto palikta tuščia vieta.

Kol šios vietos dar neužpildytos, tai tėra tuščia dėžė. Tik tada, kai visi laukai užpildomi tinkamomis reikšmėmis, ji tampa pilna dovanų dėže.

### `struct` egzempliorius

Anksčiau tik apibrėžėme pačią struktūrą, tai yra, paruošėme dėžutės formą.

Dar turime į ją įdėti konkrečius duomenis, kad gautume tikrą, naudoti tinkamą „egzempliorių“.

Kuriant egzempliorių, po struktūros pavadinimo paprastai rašoma `()`:

```swift
StructName(...)
```

Mažuosiuose skliaustuose rašomas šiai struktūrai reikalingų laukų turinys.

Pavyzdžiui:

```swift
StructName(name: "Fang Junyu")
```

Šis kodas reiškia: pagal `StructName` struktūros formatą sukurti naują egzempliorių ir laukui `name` priskirti reikšmę `"Fang Junyu"`.

Kai užpildome visus reikalingus laukus, tai prilygsta dėžutės užpildymui.

Tuomet gauname pilną struktūros egzempliorių.

### `struct` savybių pasiekimas

Sukūrę egzempliorių, galime naudoti „taško sintaksę“, kad pasiektume jo vidines savybes.

Pagrindinis rašymo būdas:

```swift
egzempliorius.savybė
```

Pavyzdžiui:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Čia `st` yra struktūros egzempliorius, o `st.name` reiškia šio egzemplioriaus `name` reikšmės nuskaitymą.

Tokį skaitymo būdą galite suprasti taip: kai rašome `st.name`, tai tarsi skaitome turinį, laikomą vienoje konkrečioje dėžutės vietoje.

Toks rašymo būdas vėlesnėse SwiftUI sąsajose bus labai dažnas.

Pavyzdžiui, jei turime studento struktūrą, kurioje yra vardas, amžius ir klasė, rodydami ją sąsajoje galime atskirai skaityti:

```swift
student.name
student.age
student.className
```

Tokio būdo pranašumas tas, kad duomenys tampa aiškesni ir juos patogiau valdyti.

### `struct` vieta

Pradedantiesiems struktūrą paprastai galima rašyti už `ContentView` ribų.

Pavyzdžiui:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Taip struktūra bus aiškesnė ir lengviau skaitoma.

Pastebėsite, kad pats `ContentView` iš tikrųjų taip pat yra `struct`.

### `Movie` struktūra

Turėdami ankstesnį pagrindą, galime apibrėžti filmo struktūrą:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Tai struktūra, pavadinta `Movie`, kurią sudaro trys laukai: `name`, `director` ir `rating`, atitinkamai reiškiantys filmo pavadinimą, režisierių ir įvertinimą.

Taip vieno filmo informacijos nebereikia skaidyti į kelis masyvus, ją galima tiesiog sujungti į vieną visumą.

Pavyzdžiui, galime sukurti tokį filmo egzempliorių:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Šis egzempliorius reiškia „vieną pilną filmo duomenų įrašą“.

### Struktūros saugojimas masyve

Anksčiau minėjome, kad masyvas gali saugoti tik vieno tipo reikšmes.

Dabar jau turime `Movie` struktūrą, todėl masyvas gali saugoti kelis `Movie`.

```swift
let lists: [Movie] = []
```

Pavyzdžiui:

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

Šiame `lists` masyve saugomos ne eilutės, o keli `Movie` egzemplioriai.

Kitaip tariant, kiekvienas masyvo elementas yra vienas pilnas filmas.

Taip, kai reikia parodyti filmų sąrašą, galime naudoti `ForEach`, kad paeiliui perskaitytume kiekvieną filmą.

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

Čia `movie in` reiškia, kad kiekvieno ciklo metu iš masyvo paimamas vienas filmas ir laikinai pavadinamas `movie`.

Tuomet galime naudoti:

```swift
movie.name
movie.director
movie.rating
```

kad atskirai perskaitytume šio filmo pavadinimą, režisierių ir įvertinimą bei parodytume juos sąsajoje.

## `ForEach` klaida

Iki šios vietos jau užbaigėme bazinį filmų masyvo ir `ForEach` rašymą.

Tačiau paleidus žemiau esantį kodą:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

bus parodyta klaida:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Ši klaida reiškia, kad kai parašote `id: \.self`, SwiftUI turi laikyti kiekvieną masyvo elementą pačiu savaime kaip „unikalų identifikatorių“, kad galėtų juos atskirti.

Toks rašymo būdas tinka tokiems paprastiems tipams kaip `String` ir `Int`, nes juos pačius nesunku atskirti.

Tačiau `Movie` yra mūsų pasirinktinė struktūra, o `ForEach` nežino, kaip pačią ją laikyti unikaliu identifikatoriumi, todėl ir pateikia klaidą.

Norint išspręsti šią problemą, dažniausias būdas yra leisti `Movie` laikytis `Identifiable` protokolo.

## Protokolas

Swift kalboje protokolą galima suprasti kaip tam tikrą „taisyklių“ ar „reikalavimų“ rinkinį.

Galima tai įsivaizduoti kaip tarptautinės organizacijos susitarimą: jei šalis nori prisijungti prie tam tikros tarptautinės organizacijos, ji paprastai pirmiausia turi atitikti tam tikras šios organizacijos taisykles, paviešinti tam tikrus duomenis ir laikytis bendrų nuostatų. Tik tada ji gali prisijungti arba dalyvauti tam tikruose reikaluose.

Protokolas veikia labai panašiai.

Kai tipas nori laikytis tam tikro protokolo, jis turi atitikti tai, ko šis protokolas reikalauja. Tik įvykdęs šiuos reikalavimus tipas gali naudoti atitinkamą funkcionalumą.

Bazinis rašymo būdas:

```swift
struct Movie: Identifiable {
    // ...
}
```

Čia `: Identifiable` reiškia, kad `Movie` laikosi `Identifiable` protokolo.

Jei tipas laikosi kelių protokolų, juos galima atskirti kableliais:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Kalbant apie `Identifiable`, svarbiausias jo reikalavimas yra toks: tipas turi turėti `id`, pagal kurį save identifikuoja.

Pavyzdžiui:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Čia `id` yra tarsi asmens tapatybės numeris, naudojamas atskirti kiekvieną filmą.

Kol kiekvieno filmo `id` skiriasi, SwiftUI gali teisingai atskirti kiekvieną masyvo elementą.

Pavyzdžiui:

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

Tada `ForEach` viduje naudojame:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Taip klaidos nebebus.

Kadangi `Movie` jau laikosi `Identifiable`, dar dažnesnis rašymo būdas yra tiesiog praleisti `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Nes SwiftUI jau žino, kad kiekvienam elementui atskirti reikia naudoti `movie.id`.

## `ForEach` atskyrimo identifikatorius

Toliau giliau suprasime `id` paskirtį `ForEach` viduje.

Pavyzdžiui:

```swift
ForEach(lists, id: \.self)
```

Čia reiškia: kaip atskyrimo identifikatorius naudojamas pats elementas.

O:

```swift
ForEach(lists, id: \.id)
```

reiškia: kaip atskyrimo identifikatorius naudojamas elemento `id` laukas.

Jei tam tikras laukas pats savaime gali garantuoti unikalumą, jį taip pat galima laikinai naudoti.

Pavyzdžiui, jei kiekvieno filmo pavadinimas skiriasi, toks rašymo būdas su dabartiniais duomenimis irgi gali veikti:

```swift
ForEach(lists, id: \.name)
```

Tačiau čia slypi viena problema: `name` nebūtinai visada bus unikalus.

Tarkime, vėliau pridėsite dar vieną to paties pavadinimo filmą, tada `name` jau nebegalės tiksliai atskirti kiekvieno elemento.

Tokiu atveju kodas gal ir toliau bus kompiliuojamas, tačiau atnaujinant vaizdą, įterpiant ar šalinant elementus SwiftUI gali neteisingai juos atpažinti ir parodymas gali veikti netaisyklingai.

Todėl, kai reikia stabiliai atskirti duomenis, geriausia naudoti tikrai unikalų lauką, tai yra `id`.

## UUID

Nors rankiniu būdu rašyti `id: 1`, `id: 2` ir panašiai gali išspręsti problemą, vis tiek išlieka rizika: galima netyčia parašyti pasikartojantį `id`, ir unikalus identifikatorius praras prasmę.

Pavyzdžiui:

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

Taip atsiras du vienodi `id`, o unikalus identifikatorius nebeveiks.

Kad išvengtume rankinių klaidų, paprastai naudojame `UUID()`.

Swift kalboje `UUID()` atsitiktinai sugeneruoja 128 bitų identifikatorių. Jis paprastai rodomas kaip ilga raidžių ir skaičių eilutė.

Pavyzdžiui:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Čia `UUID()` iš tikrųjų sukuria `UUID` tipo egzempliorių; galite jį suprasti kaip automatiškai sugeneruotą „unikalų numerį“.

Todėl kiekvieną kartą sukurta reikšmė beveik niekada nesikartoja, tad ji labai tinka naudoti kaip `id`.

Galime pakeisti `Movie` į:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Šis kodas reiškia, kad `Movie` struktūros laukas `id` pagal numatymą gaus naujo `UUID` egzemplioriaus reikšmę.

Kitaip tariant, kiekvieną kartą kuriant naują `Movie`, sistema automatiškai pirmiausia sugeneruos unikalų `id`.

`id` jau turi numatytąją reikšmę, todėl vėliau kuriant `Movie` egzempliorius nebereikia rankiniu būdu pildyti `id`.

Pavyzdžiui:

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

Nors čia `id` neparašytas, iš tikrųjų šis filmo egzempliorius vis tiek turi savo `id`, tik ši reikšmė jau automatiškai sugeneruota per `UUID()`.

Naudojant šį būdą nebereikia rankiniu būdu kiekvienam filmui pildyti `id`, taip sumažėja kodo kiekis ir išvengiama klaidų dėl pasikartojančių `id`.

Galiausiai mums tereikia viršuje pridėti `Banner` paveikslėlį ir naudoti `ScrollView`, kad turinį būtų galima slinkti, ir taip užbaigsime visą filmų sąrašo vaizdą.

## Santrauka

Šioje pamokoje išmokome labai svarbią sąvoką: `struct`.

Naudodami `struct`, galime sujungti kelis susijusius vieno filmo laukus į vieną visumą, užuot pavadinimą, režisierių ir įvertinimą atskirai išskaidę į kelis masyvus.

Kai duomenys jau sujungti, galime naudoti `ForEach`, kad paeiliui parodytume kiekvieną masyve esantį filmą.

Tuo pačiu supratome ir „atskyrimo identifikatoriaus“ paskirtį `ForEach`: SwiftUI turi žinoti, kaip atskirti kiekvieną masyvo elementą, kad galėtų teisingai parodyti ir atnaujinti vaizdą.

Todėl leidome `Movie` laikytis `Identifiable` protokolo ir suteikėme jam unikalų `id`.

Kad išvengtume klaidų rankiniu būdu pildydami `id`, toliau išmokome `UUID()`, leidžiantį sistemai automatiškai generuoti unikalų identifikatorių.

Išmokę šią pamoką, ne tik užbaigėte filmų sąrašą, bet ir pradėjote liesti svarbią SwiftUI mąstymo kryptį: **pirmiausia sutvarkyti duomenis, o tada pagal juos generuoti vaizdą.**

## Pilnas kodas

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
