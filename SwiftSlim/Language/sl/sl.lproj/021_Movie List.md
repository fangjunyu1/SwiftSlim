# Seznam filmov

V tej lekciji bomo ustvarili seznam filmov.

![movie](../../Resource/021_movie.png)

Na seznamu bodo prikazani plakat, ime, režiser in ocena vsakega filma.

V tem primeru se bomo naučili zelo pomembnega koncepta: strukture `struct`. Ta nam pomaga združiti več informacij o enem filmu v celoto. Poleg tega bomo spoznali še `UUID()`, `ForEach`, ločilno črto `Divider` in kako uporabljati prilagojene objekte za upravljanje podatkov.

To znanje je v nadaljnjem razvoju SwiftUI zelo pogosto. Po tej lekciji ne boste znali ustvariti samo seznama filmov, ampak boste začeli razumeti tudi, »kako skupino podatkov prikazati kot vmesnik«.

## En film

Najprej lahko začnemo z vmesnikom enega samega filma.

![movie](../../Resource/021_movie1.png)

Postavitev tega vmesnika je v glavnem sestavljena iz dveh delov: na levi je filmski plakat, na desni pa predstavitev filma.

### Filmski plakat

Na levi strani je prikazan filmski plakat, za prikaz slike pa lahko uporabimo `Image`.

Na primer:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Ta koda pomeni, da se prikaže slika z imenom `"The Shawshank Redemption"`.

Tukaj je treba paziti, da ime slike res obstaja v mapi z viri `Assets`, sicer vmesnik te slike ne bo mogel pravilno prikazati.

![movie](../../Resource/021_movie2.png)

Vloga teh modifikatorjev je naslednja:

- `resizable()` pomeni, da se velikost slike lahko spreminja.
- `scaledToFit()` pomeni, da se pri skaliranju ohrani prvotno razmerje, da se slika ne raztegne in popači.
- `frame(height: 180)` pomeni, da se višina slike nastavi na 180.
- `cornerRadius(10)` pomeni, da se sliki nastavijo zaobljeni robovi z radijem 10.

Tako dobimo plakat filma primerne velikosti in z zaobljenimi robovi.

![movie](../../Resource/021_movie3.png)

### Predstavitev filma

Na desni strani je prikazana predstavitev filma, vključno z imenom filma, režiserjem in oceno.

![movie](../../Resource/021_movie4.png)

Za prikaz tega dela lahko uporabimo `Text`:

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

V tej kodi `.font` predstavlja velikost pisave, `.fontWeight` pa debelino pisave.

Da bodo razmiki med »imenom filma«, »podatki o režiserju« in »podatki o oceni« bolj jasni, tukaj na najbolj zunanji ravni uporabimo `VStack` in nastavimo:

```swift
spacing: 10
```

To pomeni, da bo razmik med vsako skupino vsebine v tem `VStack` enak 10.

Razlog, da sta režiser in ocena dodatno vsak posebej ovita v svoj `VStack`, je ta, da oba sodita v strukturo tipa »naslov + vsebina«. Zato so ravni vmesnika bolj jasne, kasneje pa je tudi lažje nadalje prilagajati slog.

Poleg tega je `VStack` privzeto poravnan na sredino. Da bo celotno besedilo poravnano levo, nastavimo:

```swift
alignment: .leading
```

Tako del s predstavitvijo filma izgleda bolj urejeno.

### Ločilna črta

Zdaj, čeprav je vsebina predstavitve filma razmaknjena s pomočjo `spacing`, meja med različnimi deli še vedno ni dovolj očitna.

Takrat lahko dodamo ločilno črto:

```swift
Divider()
```

Na primer:

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

Tako bo del s predstavitvijo filma dobil bolj očiten učinek ločevanja.

![movie](../../Resource/021_movie4.png)

`Divider` je zelo preprost, a zelo pogosto uporabljen view, katerega naloga je ločevanje različne vsebine.

V `VStack` se `Divider()` prikaže kot vodoravna črta.

V `HStack` se `Divider()` prikaže kot navpična črta.

Poleg tega je mogoče slog `Divider` spreminjati z `.frame`, `.background`, `.padding` in drugimi načini.

Na primer:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

To ustvari modro ločilno črto debeline 2 z notranjim odmikom levo in desno.

![divider](../../Resource/021_divider.png)

### Celoten vmesnik

Na koncu lahko uporabimo `HStack`, da filmski plakat in predstavitev filma razporedimo levo in desno.

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

Tukaj `HStack(spacing: 20)` pomeni, da med levim in desnim delom ostane razmik 20.

Treba je poudariti, da se `Divider()`, tako kot prej omenjena `TextField` in `Slider`, privzeto poskuša raztegniti čez čim več razpoložljivega prostora.

Zato zunanjemu `VStack` v desnem delu predstavitve nastavimo fiksno širino:

```swift
.frame(width: 200)
```

Tako ostaneta širina ločilne črte in širina besedilnega območja enaki, celoten videz pa je bolj urejen.

Do tukaj smo zaključili prikazni vmesnik za »en film«.

![movie](../../Resource/021_movie1.png)

## Shranjevanje filmov v polje

Če želimo več filmov prikazati enega za drugim v istem slogu, to pomeni, da bi morali za vsak film znova napisati podobno kodo.

Na primer:

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

Tako napisana koda sicer lahko doseže želeni učinek, vendar bo kode vedno več, vzdrževanje pa bo zelo neprijetno.

Na primer, če moramo razmik vseh filmov spremeniti iz `20` v `15`, ali širino desnega dela iz `200` v
`220`, moramo ročno spreminjati vsak ponavljajoči se del kode.

To očitno ni učinkovit način.

Prej smo že spoznali polja in tudi uporabo `ForEach` za ponavljajoč prikaz viewov na podlagi polja.

Na primer:

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

Ta način je zelo primeren za primere, kjer obstaja »samo ena vrsta podatkov«, na primer skupina imen slik.

Toda film nima samo ene vrednosti. Vsebuje vsaj:

1. Filmski plakat
2. Ime filma
3. Režiserja
4. Oceno

Z drugimi besedami: en film je pravzaprav skupina povezanih podatkov, ne pa samo en sam niz.

Če uporabljamo samo polja, lahko te podatke shranjujemo le ločeno:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Pri prikazu bi se morali zanašati na isti indeks, da jih uskladimo enega z drugim:

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

Težava takšnega načina pisanja je v tem, da so stroški vzdrževanja zelo visoki.

Ker so podatki enega filma razpršeni po več poljih, je dovolj, da ima eno polje en element preveč, enega premalo ali drugačen vrstni red, pa bo rezultat prikaza napačen.

Še posebej pri dodajanju ali brisanju filmov je treba hkrati spreminjati več polj, zato je zelo lahko kaj spregledati.

Kako torej združiti informacije, kot so »ime filma, režiser, ocena«, v eno celoto?

Za to potrebujemo `struct`.

## Definiranje strukture `struct`

V Swift pomeni `struct` »struktura«.

Lahko jo razumete kot »prilagojen podatkovni tip«, ki lahko združi več povezanih polj v eno celoto.

Osnovna uporaba:

```swift
struct StructName {
	let name: String
}
```

V tej kodi je `struct` ključna beseda, ki pomeni, da definiramo strukturo. `StructName` je ime strukture.

Vsebina v zavitih oklepajih so polja, ki jih ta struktura vsebuje, pri vsakem polju pa je treba jasno zapisati ime in tip.

Običajno se ime `struct` začne z veliko začetnico, na primer `Movie`, `Student`, `UserInfo`. To je v Swift pogosta poimenovalna konvencija.

`struct` si lahko preprosto predstavljate kot prazno embalažno škatlo, pri čemer je vsako polje kot rezervirano prazno mesto v njej.

Ko ta mesta še niso zapolnjena, je to le prazna škatla. Šele ko so vsa polja napolnjena z ustreznimi vrednostmi, postane popolna darilna škatla.

### Primerek `struct`

Prej smo definirali le samo strukturo, kar je enakovredno pripravi oblike darilne škatle.

Vanjo moramo še vnesti konkretno vsebino, da dobimo pravi »primerek«, ki ga lahko uporabimo.

Pri ustvarjanju primerka navadno za ime strukture dodamo `()`:

```swift
StructName(...)
```

V oklepajih je vsebina polj, ki jih ta struktura potrebuje.

Na primer:

```swift
StructName(name: "Fang Junyu")
```

Ta koda pomeni: ustvariti nov primerek po formatu strukture `StructName` in polju `name` dodeliti vrednost `"Fang Junyu"`.

Ko izpolnimo vso potrebno vsebino polj, je to enako, kot da bi škatlo napolnili.

Takrat dobimo popoln primerek strukture.

### Dostop do lastnosti `struct`

Ko ustvarimo primerek, lahko za dostop do njegovih notranjih lastnosti uporabimo »pikčasto sintakso«.

Osnovni zapis:

```swift
instance.propertyName
```

Na primer:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Tukaj je `st` primerek strukture, `st.name` pa pomeni branje vrednosti `name` iz tega primerka.

Ta način branja si lahko predstavljate tako: ko zapišemo `st.name`, je to, kot da beremo vsebino, shranjeno na določenem mestu v škatli.

Tak način pisanja bo v kasnejših vmesnikih SwiftUI zelo pogost.

Na primer, če imamo strukturo študenta, ki vsebuje ime, starost in razred, lahko pri prikazu v vmesniku ločeno beremo:

```swift
student.name
student.age
student.className
```

Prednost tega je, da so podatki bolj pregledni in jih je lažje upravljati.

### Mesto za `struct`

Za začetnike je običajno primerno, da strukturo napišejo zunaj `ContentView`.

Na primer:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Tako bo struktura preglednejša in tudi lažje berljiva.

Opazili boste, da je tudi sam `ContentView` pravzaprav `struct`.

### Struktura `Movie`

S prejšnjo osnovo lahko definiramo strukturo filma:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

To je struktura z imenom `Movie`, ki jo sestavljajo tri polja: `name`, `director` in `rating`, ki predstavljajo ime filma, režiserja in oceno.

Tako informacij o enem filmu ni več treba razdeliti v več polj, ampak jih lahko neposredno združimo v eno celoto.

Na primer, ustvarimo lahko tak primerek filma:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Ta primerek predstavlja »en popoln nabor podatkov o filmu«.

### Shranjevanje struktur v polje

Prej smo povedali, da lahko polje shranjuje samo isti tip.

Zdaj, ko že imamo strukturo `Movie`, lahko polje hrani več primerkov `Movie`.

```swift
let lists: [Movie] = []
```

Na primer:

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

V tem polju `lists` niso shranjeni nizi, ampak več primerkov `Movie`.

To pomeni, da je vsak element v polju en popoln film.

Ko moramo prikazati seznam filmov, lahko s pomočjo `ForEach` enega za drugim preberemo vsak film.

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

Tukaj `movie in` pomeni, da se pri vsakem prehodu iz polja vzame en film in se začasno poimenuje `movie`.

Nato lahko uporabimo:

```swift
movie.name
movie.director
movie.rating
```

za ločeno branje imena, režiserja in ocene tega filma ter njihov prikaz v vmesniku.

## Napaka `ForEach`

Do tukaj smo dokončali osnovni zapis polja filmov in `ForEach`.

Če pa neposredno zaženemo naslednjo kodo:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

se pojavi napaka:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Ta napaka pomeni, da mora SwiftUI, ko napišete `id: \.self`, vsak element polja uporabiti kot »enolični identifikator«, da jih lahko razlikuje.

Ta način zapisa je primeren za enostavne tipe, kot sta `String` in `Int`, ker ju je že sama po sebi razmeroma lahko razlikovati.

Toda `Movie` je lastna struktura, ki smo jo definirali sami, in `ForEach` ne ve, kako bi samo strukturo obravnaval kot enolični identifikator, zato pride do napake.

Najpogostejši način za rešitev te težave je, da `Movie` sledi protokolu `Identifiable`.

## Protokol

V Swift lahko protokol razumemo kot nekakšno »pravilo« ali »zahtevo«.

Lahko si ga predstavljate kot dogovor v mednarodni organizaciji: če se želi neka država pridružiti mednarodni organizaciji, mora običajno najprej izpolniti določena pravila te organizacije, javno razkriti nekatere podatke in spoštovati skupna pravila. Šele po izpolnitvi teh pogojev se lahko pridruži ali sodeluje v določenih zadevah.

Protokol deluje na podoben način.

Ko nek tip želi slediti določenemu protokolu, mora izpolniti vsebino, ki jo ta protokol zahteva. Šele po izpolnitvi teh zahtev lahko tip uporablja ustrezno funkcionalnost.

Osnovni zapis:

```swift
struct Movie: Identifiable {
    // ...
}
```

Tukaj `: Identifiable` pomeni, da `Movie` sledi protokolu `Identifiable`.

Če tip sledi več protokolom, jih lahko ločimo z vejicami:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Za `Identifiable` je najpomembnejša zahteva ta, da ima tip `id`, s katerim se lahko identificira.

Na primer:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Tukaj je `id` kot številka osebnega dokumenta, ki se uporablja za razlikovanje vsakega filma.

Dokler je `id` vsakega filma drugačen, lahko SwiftUI pravilno razlikuje vsak element v polju.

Na primer:

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

Nato v `ForEach` uporabimo:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Tako do napake ne bo več prišlo.

Ker `Movie` že sledi `Identifiable`, je še pogostejši način zapisa, da `id:` preprosto izpustimo:

```swift
ForEach(lists) { movie in
    // ...
}
```

Ker SwiftUI že ve, da mora za razlikovanje vsake postavke uporabiti `movie.id`.

## Razlikovalni identifikator v `ForEach`

Spodaj bomo podrobneje razumeli vlogo `id` v `ForEach`.

Na primer:

```swift
ForEach(lists, id: \.self)
```

To pomeni: kot razlikovalni identifikator uporabimo sam element.

In:

```swift
ForEach(lists, id: \.id)
```

pomeni: kot razlikovalni identifikator uporabimo polje `id` elementa.

Če lahko neko polje samo po sebi zagotovi enoličnost, ga lahko začasno uporabimo tudi v ta namen.

Na primer, če je ime vsakega filma različno, lahko naslednji zapis pri trenutnih podatkih deluje pravilno:

```swift
ForEach(lists, id: \.name)
```

Toda tukaj obstaja skrita težava: `name` ni nujno vedno enoličen.

Predpostavimo, da kasneje dodate še en film z istim imenom — takrat `name` ne bo več mogel natančno razlikovati vsakega elementa.

Takrat se lahko koda sicer še vedno prevede, vendar lahko SwiftUI ob osveževanju viewa, posodobitvah, vstavljanju in brisanju elemente napačno prepozna, kar povzroči nepravilno prikazovanje.

Zato je, kadar moramo podatke stabilno razlikovati, najbolje uporabiti resnično enolično polje, torej `id`.

## UUID

Čeprav lahko ročno zapisovanje `id: 1`, `id: 2` težavo reši, še vedno obstaja tveganje: pomotoma lahko napišemo podvojen `id`, in enolična identifikacija ne bo več delovala.

Na primer:

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

Tako se pojavita dva enaka `id`, zato enolična identifikacija postane neveljavna.

Da bi se izognili ročnim napakam, običajno uporabljamo `UUID()`.

V Swift `UUID()` naključno ustvari 128-bitni identifikator. Običajno se prikaže kot dolg niz črk in številk.

Na primer:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Tukaj `UUID()` v resnici ustvari primerek tipa `UUID`; lahko si ga predstavljate kot samodejno ustvarjeno »enolično številko«.

Zato se ustvarjene vrednosti skoraj nikoli ne ponavljajo in so zelo primerne za uporabo kot `id`.

`Movie` lahko spremenimo tako:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ta koda pomeni, da polje `id` v strukturi `Movie` privzeto dobi vrednost novega primerka `UUID`.

To pomeni, da sistem vsakič, ko ustvarimo nov `Movie`, najprej samodejno ustvari enolični `id`.

`id` že ima privzeto vrednost, zato ga pri kasnejšem ustvarjanju primerkov `Movie` ni treba več ročno izpolnjevati.

Na primer:

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

Čeprav tukaj `id` ni zapisan, ima ta primerek filma v resnici še vedno svoj `id`; le da je bila ta vrednost že samodejno ustvarjena z `UUID()`.

Po uporabi tega načina nam ni več treba ročno izpolnjevati `id` za vsak film, kar ne zmanjša samo količine kode, ampak tudi prepreči napake zaradi podvojenih id-jev.

Na koncu moramo na vrh dodati le še sliko `Banner` in uporabiti `ScrollView`, da bo vsebina drsna, in s tem bo celoten pogled seznama filmov dokončan.

## Povzetek

V tej lekciji smo spoznali zelo pomemben koncept: `struct`.

Z uporabo `struct` lahko več povezanih polj enega filma združimo v eno celoto, namesto da ime, režiserja in oceno razdelimo v več ločenih polj.

Ko so podatki združeni, lahko uporabimo `ForEach`, da vsak film iz polja enega za drugim prikažemo v viewu.

Hkrati smo razumeli tudi vlogo »razlikovalnega identifikatorja« v `ForEach`. SwiftUI mora vedeti, kako razlikovati vsak element v polju, da lahko view pravilno prikaže in posodobi.

Zato smo zagotovili, da `Movie` sledi protokolu `Identifiable`, in mu dali enolični `id`.

Da bi se izognili napakam pri ročnem izpolnjevanju `id`, smo se dodatno naučili še `UUID()`, ki sistemu omogoča samodejno ustvarjanje enoličnega identifikatorja.

Po tej lekciji niste dokončali le seznama filmov, ampak ste se začeli srečevati tudi s pomembnim načinom razmišljanja v SwiftUI: **najprej urediti podatke, nato pa na podlagi teh podatkov ustvariti view.**

## Celotna koda

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
