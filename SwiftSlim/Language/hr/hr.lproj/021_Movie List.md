# Popis filmova

U ovoj lekciji izradit ćemo popis filmova.

![movie](../../Resource/021_movie.png)

Na popisu će se prikazivati poster, naziv, redatelj i ocjena svakog filma.

U ovom primjeru naučit ćemo jednu vrlo važnu točku znanja: `struct` strukturu. Ona nam može pomoći da više informacija o jednom filmu spojimo u jednu cjelinu. Osim toga, susrest ćemo se i s `UUID()`, `ForEach`, razdjelnom linijom `Divider` te s načinom korištenja prilagođenih objekata za upravljanje podacima.

Ova su znanja vrlo česta u kasnijem SwiftUI razvoju. Nakon što završiš ovu lekciju, nećeš moći samo napraviti popis filmova, nego ćeš i početi razumijevati „kako prikazati skup podataka kao sučelje”.

## Jedan film

Možemo prvo krenuti od izrade sučelja za jedan film.

![movie](../../Resource/021_movie1.png)

Raspored ovog sučelja uglavnom se sastoji od dva dijela: lijevo je poster filma, a desno predstavljanje filma.

### Poster filma

Na lijevoj strani prikazuje se poster filma, a za prikaz slike možemo koristiti `Image`.

Na primjer:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Ovaj kod znači da se prikazuje slika nazvana `"The Shawshank Redemption"`.

Ovdje treba obratiti pažnju na to da naziv slike mora stvarno postojati u mapi resursa `Assets`, inače sučelje neće moći ispravno prikazati tu sliku.

![movie](../../Resource/021_movie2.png)

Funkcije ovih modifikatora su sljedeće:

- `resizable()` znači da se veličina slike može prilagoditi.
- `scaledToFit()` znači da se tijekom skaliranja zadržava izvorni omjer, kako se slika ne bi razvukla i izobličila.
- `frame(height: 180)` znači da se visina slike postavlja na 180.
- `cornerRadius(10)` znači da se slici postavlja zaobljenje kutova od 10.

Na taj način možemo dobiti sliku filmskog postera odgovarajuće veličine i zaobljenih kutova.

![movie](../../Resource/021_movie3.png)

### Predstavljanje filma

Na desnoj strani prikazuje se predstavljanje filma, uključujući naziv filma, redatelja i ocjenu.

![movie](../../Resource/021_movie4.png)

Za prikaz ovog dijela možemo koristiti `Text`:

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

U ovom kodu `.font` predstavlja veličinu fonta, a `.fontWeight` predstavlja debljinu fonta.

Kako bi razmak između „naziva filma”, „informacija o redatelju” i „informacija o ocjeni” bio jasniji, ovdje na vanjskoj razini koristimo `VStack` i postavljamo:

```swift
spacing: 10
```

To znači da je razmak između svake skupine sadržaja unutar ovog `VStack` jednak 10.

Razlog zbog kojeg su redatelj i ocjena svaki zasebno omotani dodatnim `VStack`-om jest taj što oboje pripadaju strukturi „naslov + sadržaj”. Zato će hijerarhija sučelja biti jasnija, a i kasnije će nam biti lakše dodatno prilagođavati stil.

Osim toga, `VStack` je prema zadanim postavkama centriran. Kako bismo cijeli tekst poravnali ulijevo, postavljamo:

```swift
alignment: .leading
```

Tako dio s predstavljanjem filma izgleda urednije.

### Razdjelna linija

Sada, iako je sadržaj u predstavljanju filma razmaknut pomoću `spacing`, granica između različitih sadržaja još uvijek nije dovoljno očita.

U ovom trenutku možemo dodati razdjelnu liniju:

```swift
Divider()
```

Na primjer:

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

Na taj način dio s predstavljanjem filma dobiva očitiji efekt razdvajanja.

![movie](../../Resource/021_movie4.png)

`Divider` je vrlo jednostavan, ali vrlo često korišten view, čija je uloga odvajanje različitog sadržaja.

U `VStack`-u `Divider()` se prikazuje kao vodoravna linija.

U `HStack`-u `Divider()` se prikazuje kao okomita linija.

Osim toga, stil `Divider`-a može se mijenjati pomoću `.frame`, `.background`, `.padding` i drugih načina.

Na primjer:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

To će stvoriti plavu razdjelnu liniju debljine 2 s unutarnjim razmakom lijevo i desno.

![divider](../../Resource/021_divider.png)

### Potpuno sučelje

Na kraju možemo koristiti `HStack` kako bismo poster filma i predstavljanje filma rasporedili lijevo i desno, jedan uz drugi.

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

Ovdje `HStack(spacing: 20)` znači da se između lijevog i desnog dijela ostavlja razmak od 20.

Treba primijetiti da `Divider()`, kao i `TextField` i `Slider` koje smo ranije spominjali, prema zadanim postavkama pokušava zauzeti što više dostupnog prostora.

Zato vanjskom `VStack`-u desnog dijela s opisom postavljamo fiksnu širinu:

```swift
.frame(width: 200)
```

Na taj način širina razdjelne linije i tekstualnog područja može ostati ista, pa će cjelina izgledati urednije.

Do ovdje smo dovršili sučelje za prikaz „jednog filma”.

![movie](../../Resource/021_movie1.png)

## Spremanje filmova u niz

Ako želimo prikazati više filmova jedan za drugim u istom stilu, to znači da moramo pisati sličan kod za svaki film.

Na primjer:

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

Iako se ovakvim pisanjem koda može postići željeni efekt, koda će biti sve više, a održavanje će postati vrlo zamorno.

Na primjer, ako treba promijeniti razmak svih filmova s `20` na `15`, ili promijeniti širinu desnog dijela s `200` na
`220`, morat će se ručno mijenjati svaki ponovljeni blok koda.

To očito nije učinkovita metoda.

Ranije smo učili o nizovima, a također smo naučili koristiti `ForEach` za opetovano prikazivanje viewova na temelju niza.

Na primjer:

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

Ovaj način je vrlo prikladan za slučajeve kada postoji „samo jedan podatak”, kao što je skup naziva slika.

Ali film nema samo jednu vrijednost. On barem sadrži:

1. poster filma
2. naziv filma
3. redatelja
4. ocjenu

Drugim riječima, film je zapravo skup povezanih podataka, a ne samo jedan string.

Ako koristimo samo nizove, te informacije možemo spremiti samo odvojeno:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Prilikom prikaza moramo se oslanjati na isti indeks kako bismo ih povezali jedan po jedan:

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

Problem s ovakvim načinom pisanja je taj što je trošak održavanja vrlo visok.

Budući da se podaci jednog filma rasprše u više nizova, dovoljno je da jedan niz ima jednu stavku više, jednu manje ili drugačiji redoslijed, pa će rezultat prikaza biti pogrešan.

Posebno kod dodavanja ili brisanja filmova moraš istovremeno mijenjati više nizova, pa je vrlo lako nešto previdjeti.

Kako onda možemo spojiti informacije poput „naziv filma, redatelj i ocjena” u jednu cjelinu?

Za to treba koristiti `struct`.

## Definiranje struct strukture

U Swiftu `struct` znači „struktura”.

Možeš ga shvatiti kao „prilagođeni tip podataka” koji može spojiti više povezanih polja u jednu cjelinu.

Osnovna upotreba:

```swift
struct StructName {
	let name: String
}
```

U ovom kodu `struct` je ključna riječ koja pokazuje da definiramo strukturu. `StructName` je naziv strukture.

Sadržaj unutar vitičastih zagrada su polja koja ta struktura sadrži, a za svako polje moraju se jasno navesti naziv i tip.

Obično naziv `struct` započinje velikim slovom, na primjer `Movie`, `Student` ili `UserInfo`. To je uobičajena konvencija imenovanja u Swiftu.

`struct` možeš jednostavno zamisliti kao praznu kutiju, gdje je svako polje poput rezerviranog praznog mjesta unutar kutije.

Kada ta mjesta još nisu popunjena, to je samo prazna kutija. Tek kada se sva polja ispune odgovarajućim vrijednostima, ona postaje potpuna poklon-kutija.

### struct instanca

Ranije smo definirali samo samu strukturu, što je isto kao da pripremimo oblik kutije.

Još uvijek moramo ispuniti konkretan sadržaj da bismo dobili stvarnu „instancu” koja se može koristiti.

Prilikom stvaranja instance obično se iza naziva strukture dodaje `()`:

```swift
StructName(...)
```

Ono što se upisuje unutar zagrada upravo je sadržaj polja koji ta struktura treba.

Na primjer:

```swift
StructName(name: "Fang Junyu")
```

Ovaj kod znači: prema formatu strukture `StructName` stvoriti novu instancu i polju `name` dodijeliti vrijednost `"Fang Junyu"`.

Kada ispunimo sav potrebni sadržaj polja, to je kao da smo potpuno ispunili ovu kutiju.

U tom trenutku dobivamo potpunu instancu strukture.

### Pristup svojstvima struct-a

Nakon što stvorimo instancu, možemo koristiti „točkastu sintaksu” kako bismo pristupili njezinim unutarnjim svojstvima.

Osnovni zapis:

```swift
instanca.nazivSvojstva
```

Na primjer:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Ovdje je `st` instanca strukture, a `st.name` znači čitanje vrijednosti `name` iz te instance.

Ovaj način čitanja možeš shvatiti ovako: kada napišemo `st.name`, to je kao da čitamo sadržaj pohranjen na određenom mjestu unutar te kutije.

Ovakav način pisanja bit će vrlo čest u kasnijim SwiftUI sučeljima.

Na primjer, ako imamo strukturu učenika koja sadrži ime, dob i razred, prilikom prikaza u sučelju možemo zasebno čitati:

```swift
student.name
student.age
student.className
```

Prednost ovoga je u tome što podaci postaju jasniji i lakši za upravljanje.

### Položaj struct-a

Za početnike se struktura obično može pisati izvan `ContentView`.

Na primjer:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Na taj način struktura postaje jasnija i lakša za čitanje.

Primijetit ćeš da je i sam `ContentView` zapravo također `struct`.

### Movie struktura

S prethodnom osnovom sada možemo definirati strukturu filma:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ovo je struktura nazvana `Movie`, koju čine tri polja: `name`, `director` i `rating`, a predstavljaju naziv filma, redatelja i ocjenu.

Na taj način informacije povezane s jednim filmom više ne moramo razdvajati u više nizova, nego ih možemo izravno spojiti u jednu cjelinu.

Na primjer, možemo stvoriti ovakvu instancu filma:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Ova instanca predstavlja „potpune podatke jednog filma”.

### Spremanje struktura u niz

Ranije smo rekli da niz može spremati samo isti tip.

Sada već imamo strukturu `Movie`, pa niz može spremati više `Movie` vrijednosti.

```swift
let lists: [Movie] = []
```

Na primjer:

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

U ovom nizu `lists` ne pohranjuju se stringovi, nego više instanci `Movie`.

Drugim riječima, svaki element niza jedan je potpuni film.

Tako, kada trebamo prikazati popis filmova, možemo pomoću `ForEach` čitati svaki film jedan po jedan.

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

Ovdje `movie in` znači da će se pri svakom prolazu petlje iz niza uzeti jedan film i privremeno nazvati `movie`.

Zatim možemo koristiti:

```swift
movie.name
movie.director
movie.rating
```

za čitanje naziva, redatelja i ocjene tog filma te njihov prikaz u sučelju.

## ForEach greška

Do ovdje smo već dovršili osnovni način pisanja niza filmova i `ForEach`.

Međutim, ako izravno pokreneš sljedeći kod:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

pojavit će se greška:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Značenje ove greške je da, kada napišeš `id: \.self`, SwiftUI mora svaki element niza smatrati „jedinstvenim identifikatorom” kako bi ih mogao razlikovati.

Ovakav zapis prikladan je za jednostavne tipove kao što su `String` i `Int`, jer ih je same po sebi lakše razlikovati.

Ali `Movie` je prilagođena struktura koju smo sami definirali, a `ForEach` ne zna kako samu strukturu koristiti kao jedinstveni identifikator, pa zato prijavljuje grešku.

Najčešći način rješavanja ovog problema je da `Movie` učinimo usklađenim s protokolom `Identifiable`.

## Protokol

U Swiftu se protokol može razumjeti kao svojevrsno „pravilo” ili „zahtjev”.

Možeš ga zamisliti kao sporazum u međunarodnoj organizaciji: ako neka država želi pristupiti određenoj međunarodnoj organizaciji, obično prvo mora ispuniti neka pravila koja ta organizacija postavlja, objaviti određene podatke i pridržavati se nekih zajedničkih pravila. Tek nakon ispunjavanja tih uvjeta može joj pristupiti ili sudjelovati u nekim poslovima.

Protokoli funkcioniraju na sličan način.

Kada se neki tip želi pridržavati određenog protokola, mora zadovoljiti sadržaj koji protokol zahtijeva. Tek nakon što su ti zahtjevi ispunjeni, taj tip može koristiti odgovarajuću funkcionalnost.

Osnovni zapis:

```swift
struct Movie: Identifiable {
    // ...
}
```

Ovdje `: Identifiable` znači da `Movie` prati protokol `Identifiable`.

Ako neki tip prati više protokola, mogu se odvojiti zarezima:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Za `Identifiable` je najvažniji zahtjev to da tip mora imati `id` kojim se može identificirati.

Na primjer:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Ovdje je `id` poput osobnog identifikacijskog broja i koristi se za razlikovanje svakog filma.

Dok god je `id` svakog filma različit, SwiftUI može ispravno razlikovati svaki element u nizu.

Na primjer:

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

Zatim u `ForEach` koristimo:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Tako više neće biti greške.

Budući da `Movie` već prati `Identifiable`, češći način pisanja je izravno izostaviti `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Jer SwiftUI već zna da za razlikovanje svake stavke treba koristiti `movie.id`.

## Identifikator razlikovanja u ForEach

U nastavku ćemo dublje razumjeti ulogu `id` u `ForEach`.

Na primjer:

```swift
ForEach(lists, id: \.self)
```

To znači: koristi sam element kao identifikator razlikovanja.

A:

```swift
ForEach(lists, id: \.id)
```

znači: koristi polje `id` elementa kao identifikator razlikovanja.

Ako neko polje samo po sebi može jamčiti jedinstvenost, može se i privremeno koristiti.

Na primjer, ako su nazivi svakog filma različiti, tada sljedeći zapis može također normalno raditi s trenutnim podacima:

```swift
ForEach(lists, id: \.name)
```

Ali ovdje postoji jedan skriveni problem: `name` nije nužno uvijek jedinstven.

Pretpostavimo da kasnije dodaš još jedan film s istim nazivom, tada `name` više neće moći točno razlikovati svaki element.

Tada, iako se kod još uvijek može kompajlirati, SwiftUI može pogrešno prepoznati elemente tijekom osvježavanja, ažuriranja, umetanja ili brisanja viewova, što može dovesti do problema u prikazu.

Stoga je, kada trebamo stabilno razlikovati podatke, ipak najbolje koristiti stvarno jedinstveno polje, a to je `id`.

## UUID

Iako ručno pisanje poput `id: 1`, `id: 2` može riješiti problem, i dalje postoji jedan rizik: moguće je greškom napisati isti `id`, pa jedinstveni identifikator više neće biti valjan.

Na primjer:

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

Na taj će način nastati dva ista `id`, pa će jedinstveni identifikator izgubiti valjanost.

Kako bismo izbjegli ručne pogreške, obično koristimo `UUID()`.

U Swiftu `UUID()` nasumično generira 128-bitni identifikator. Obično se prikazuje kao dugačak string sastavljen od slova i brojeva.

Na primjer:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Ovdje `UUID()` zapravo stvara instancu tipa `UUID`; možeš je shvatiti kao automatski generiran „jedinstveni broj”.

Zbog toga se vrijednosti koje se stvaraju svaki put gotovo nikada ne ponavljaju, pa su vrlo prikladne za korištenje kao `id`.

Možemo promijeniti `Movie` ovako:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ovaj kod znači da će polje `id` u strukturi `Movie` prema zadanim postavkama dobiti novu instancu `UUID`.

To jest, svaki put kada stvorimo novi `Movie`, sustav će nam automatski prvo generirati jedinstveni `id`.

Budući da `id` već ima zadanu vrijednost, kasnije više ne trebamo ručno ispunjavati `id` prilikom stvaranja `Movie` instanci.

Na primjer:

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

Iako ovdje `id` nije napisan, u stvarnosti ova instanca filma i dalje ima vlastiti `id`; samo je ta vrijednost već automatski generirana pomoću `UUID()`.

Nakon što koristimo ovu metodu, više ne moramo ručno popunjavati `id` za svaki film, što ne samo da smanjuje količinu koda, već i izbjegava pogreške uzrokovane ponovljenim id vrijednostima.

Na kraju nam samo preostaje dodati sliku `Banner` na vrh i koristiti `ScrollView` kako bi sadržaj bio pomičan, pa je cijeli prikaz popisa filmova dovršen.

## Sažetak

U ovoj lekciji naučili smo jednu vrlo važnu točku znanja: `struct`.

Pomoću `struct` možemo više povezanih polja jednog filma spojiti u jednu cjelinu, umjesto da naziv, redatelja i ocjenu razdvajamo u više nizova.

Nakon što se podaci spoje, možemo koristiti `ForEach` kako bismo svaki film iz niza prikazali jedan po jedan u viewu.

Istodobno smo razumjeli i ulogu „identifikatora razlikovanja” u `ForEach`: SwiftUI mora znati kako razlikovati svaki element u nizu kako bi mogao ispravno prikazivati i ažurirati view.

Zato smo omogućili da `Movie` prati protokol `Identifiable` i dali mu jedinstveni `id`.

Kako bismo izbjegli pogreške pri ručnom ispunjavanju `id`, dodatno smo naučili i `UUID()`, kako bi sustav mogao automatski generirati jedinstveni identifikator.

Nakon što završiš ovu lekciju, ne samo da ćeš dovršiti popis filmova, nego ćeš i početi doticati jednu važnu ideju u SwiftUI-ju: **prvo organiziraj podatke, a zatim generiraj view na temelju podataka.**

## Potpuni kod

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
