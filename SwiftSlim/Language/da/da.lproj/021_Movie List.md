# Filmliste

I denne lektion skal vi lave en filmliste.

![movie](../../Resource/021_movie.png)

I listen vises hver films plakat, navn, instruktør og vurdering.

I dette eksempel lærer vi et meget vigtigt emne: `struct`-strukturen. Den kan hjælpe os med at samle flere oplysninger om én film til en helhed. Ud over det kommer vi også i kontakt med `UUID()`, `ForEach`, skillelinjen `Divider`, og hvordan man bruger brugerdefinerede objekter til at administrere data.

Denne viden er meget almindelig i senere SwiftUI-udvikling. Når du er færdig med denne lektion, kan du ikke bare lave en filmliste, men også begynde at forstå "hvordan man viser et sæt data som en brugerflade".

## En enkelt film

Vi kan først begynde med at lave grænsefladen til en enkelt film.

![movie](../../Resource/021_movie1.png)

Layoutet i denne grænseflade består hovedsageligt af to dele: til venstre er filmplakaten, og til højre er filmintroduktionen.

### Filmplakat

Til venstre vises filmplakaten, og vi kan bruge `Image` til at vise billedet.

For eksempel:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Denne kode betyder, at der vises et billede med navnet `"The Shawshank Redemption"`.

Her skal man være opmærksom på, at billedets navn faktisk skal findes i ressourcemappen `Assets`, ellers kan grænsefladen ikke vise billedet korrekt.

![movie](../../Resource/021_movie2.png)

Disse modifikatorers funktioner er henholdsvis:

- `resizable()` betyder, at billedets størrelse kan ændres.
- `scaledToFit()` betyder, at det oprindelige forhold bevares under skalering, så billedet ikke bliver strakt og forvrænget.
- `frame(height: 180)` betyder, at billedets højde sættes til 180.
- `cornerRadius(10)` betyder, at billedet får hjørner med radius 10.

På den måde kan vi få et filmplakatbillede med passende størrelse og afrundede hjørner.

![movie](../../Resource/021_movie3.png)

### Filmintroduktion

Til højre vises filmintroduktionen, herunder filmens navn, instruktør og vurdering.

![movie](../../Resource/021_movie4.png)

Vi kan bruge `Text` til at vise denne del:

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

I denne kode betyder `.font` skriftstørrelsen, og `.fontWeight` betyder skrifttykkelsen.

For at gøre afstanden mellem "filmens navn", "instruktøroplysninger" og "vurderingsoplysninger" tydeligere bruger vi her `VStack` yderst og sætter:

```swift
spacing: 10
```

Det betyder, at afstanden mellem hver gruppe af indhold inde i denne `VStack` er 10.

Grunden til, at instruktør og vurdering hver især er pakket ind i endnu en `VStack`, er, at de begge tilhører en struktur af typen "titel + indhold". Derfor bliver grænsefladens niveauer tydeligere, og det bliver også nemmere for os senere at justere stilen yderligere.

Derudover er `VStack` som standard centreret. For at få al teksten til at være venstrejusteret sætter vi:

```swift
alignment: .leading
```

På den måde ser filmintroduktionsdelen mere ryddelig ud.

### Skillelinje

Nu er indholdet i filmintroduktionen ganske vist blevet adskilt med `spacing`, men grænsen mellem det forskellige indhold er stadig ikke tydelig nok.

På dette tidspunkt kan vi tilføje en skillelinje:

```swift
Divider()
```

For eksempel:

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

På den måde får filmintroduktionsdelen en tydeligere opdeling.

![movie](../../Resource/021_movie4.png)

`Divider` er en meget enkel, men meget ofte brugt visning, hvis funktion er at adskille forskelligt indhold.

I `VStack` vises `Divider()` som en vandret linje.

I `HStack` vises `Divider()` som en lodret linje.

Derudover kan man også ændre stilen på `Divider` via `.frame`, `.background`, `.padding` og lignende.

For eksempel:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Dette vil skabe en blå skillelinje med tykkelsen 2 og indvendig afstand i venstre og højre side.

![divider](../../Resource/021_divider.png)

### Komplet grænseflade

Til sidst kan vi bruge `HStack` til at placere filmplakaten og filmintroduktionen side om side.

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

Her betyder `HStack(spacing: 20)`, at der efterlades en afstand på 20 mellem venstre og højre del.

Det er vigtigt at bemærke, at `Divider()`, ligesom `TextField` og `Slider`, som vi tidligere har gennemgået, som standard forsøger at optage så meget tilgængelig plads som muligt.

Derfor giver vi den yderste `VStack` i introduktionsdelen til højre en fast bredde:

```swift
.frame(width: 200)
```

På den måde kan bredden på skillelinjen og tekstområdet holdes ens, så helheden ser mere ordentlig ud.

Nu har vi færdiggjort visningsgrænsefladen for "en enkelt film".

![movie](../../Resource/021_movie1.png)

## Gem film i et array

Hvis vi vil vise flere film efter hinanden i samme stil, betyder det, at vi skal skrive lignende kode én gang for hver film.

For eksempel:

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

Selvom kode skrevet på denne måde kan opnå effekten, bliver koden mere og mere omfattende, og den bliver meget besværlig at vedligeholde.

For eksempel, hvis man skal ændre afstanden for alle film fra `20` til `15`, eller ændre bredden på højre side fra `200` til
`220`, så skal man manuelt ændre hvert stykke gentaget kode.

Det er tydeligvis ikke en effektiv metode.

Vi har tidligere lært om arrays, og vi har også lært at bruge `ForEach` til gentaget at vise views ud fra et array.

For eksempel:

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

Denne metode er meget velegnet til at håndtere situationer, hvor der "kun er én type data", for eksempel en gruppe billednavne.

Men en film har ikke kun én værdi. Den indeholder mindst:

1. filmplakat
2. filmnavn
3. instruktør
4. vurdering

Det vil sige, at en film i virkeligheden er en gruppe relaterede data, og ikke bare en enkelt streng.

Hvis vi kun bruger arrays, kan vi kun gemme disse oplysninger adskilt:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Ved visning må vi så stole på de samme indekser for at matche dem én for én:

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

Problemet med denne skrivemåde er, at vedligeholdelsesomkostningen er meget høj.

Fordi dataene for én film bliver spredt ud over flere arrays, vil visningsresultatet blive forkert, så snart ét array har et element for meget, et element for lidt eller en anden rækkefølge.

Især når man tilføjer eller sletter film, skal man samtidig ændre flere arrays, og det er meget let at overse noget.

Hvordan kan vi så kombinere oplysninger som "filmnavn, instruktør og vurdering" til en helhed?

Det kræver brug af `struct`.

## Definér struct-strukturen

I Swift er `struct` en "struktur".

Du kan forstå den som en "brugerdefineret datatype", der kan samle flere relaterede felter og gøre dem til en helhed.

Grundlæggende brug:

```swift
struct StructName {
	let name: String
}
```

I denne kode er `struct` nøgleordet, der viser, at vi er ved at definere en struktur. `StructName` er navnet på strukturen.

Indholdet i de krøllede parenteser er de felter, som denne struktur indeholder, og hvert felt skal have både navn og type tydeligt angivet.

Normalt starter navnet på en `struct` med stort bogstav, for eksempel `Movie`, `Student` eller `UserInfo`. Det er en almindelig navngivningsvane i Swift.

Du kan enkelt forstå `struct` som en tom æske, hvor hvert felt svarer til en reserveret tom plads i æsken.

Når disse pladser endnu ikke er udfyldt, er det bare en tom æske. Først når alle felterne er udfyldt med passende værdier, bliver det til en komplet gaveæske.

### struct-instans

Før definerede vi kun selve strukturen, hvilket svarer til at forberede formen på en æske.

Vi er stadig nødt til at fylde konkret indhold i den, før vi får en rigtig "instans", der kan bruges.

Når man opretter en instans, tilføjer man normalt `()` efter strukturens navn:

```swift
StructName(...)
```

Det, der udfyldes inde i parenteserne, er netop de feltværdier, som denne struktur kræver.

For eksempel:

```swift
StructName(name: "Fang Junyu")
```

Denne kode betyder: Opret en ny instans efter formatet i strukturen `StructName`, og giv feltet `name` værdien `"Fang Junyu"`.

Når vi har udfyldt alle de nødvendige feltværdier, svarer det til at fylde denne æske helt op.

På det tidspunkt har vi fået en komplet strukturinstans.

### Adgang til struct-egenskaber

Når vi har oprettet en instans, kan vi bruge "punktnotation" til at få adgang til egenskaberne inde i den.

Grundlæggende skrivemåde:

```swift
instans.egenskabsnavn
```

For eksempel:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Her er `st` en strukturinstans, og `st.name` betyder, at man læser værdien `name` i denne instans.

Du kan forstå denne læsemåde sådan: Når vi skriver `st.name`, er det som at læse det indhold, der er placeret et bestemt sted i denne æske.

Denne skrivemåde vil være meget almindelig i de senere SwiftUI-grænseflader.

Hvis vi for eksempel har en elevstruktur, som indeholder navn, alder og klasse, kan vi ved visning i grænsefladen læse:

```swift
student.name
student.age
student.className
```

Fordelen ved dette er, at dataene bliver tydeligere og også nemmere at administrere.

### struct-placering

For begyndere kan man normalt skrive strukturen uden for `ContentView`.

For eksempel:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

På den måde bliver strukturen tydeligere og også lettere at læse.

Du vil opdage, at `ContentView` i sig selv faktisk også er en `struct`.

### Movie-strukturen

Med det foregående grundlag kan vi definere en filmstruktur:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Dette er en struktur med navnet `Movie`, som består af de tre felter `name`, `director` og `rating`, der henholdsvis repræsenterer filmnavn, instruktør og vurdering.

På den måde behøver oplysningerne om en film ikke længere at blive opdelt og gemt i flere arrays, men kan i stedet kombineres direkte til en helhed.

For eksempel kan vi oprette en filminstans som denne:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Denne instans repræsenterer "et komplet sæt filmdata".

### Gem strukturer i et array

Vi har tidligere sagt, at et array kun kan gemme samme type.

Nu har vi allerede `Movie`-strukturen, så arrayet kan gemme flere `Movie`.

```swift
let lists: [Movie] = []
```

For eksempel:

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

I dette `lists`-array gemmes der ikke strenge, men flere `Movie`-instanser.

Det vil sige, at hvert element i arrayet er en komplet film.

På den måde kan vi, når vi skal vise filmlisten, bruge `ForEach` til at læse hver film én efter én.

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

Her betyder `movie in`, at der ved hver gennemløb tages én film ud af arrayet, som midlertidigt får navnet `movie`.

Derefter kan vi bruge:

```swift
movie.name
movie.director
movie.rating
```

til henholdsvis at læse denne films navn, instruktør og vurdering og vise dem i grænsefladen.

## ForEach-fejl

På dette punkt har vi allerede færdiggjort den grundlæggende skrivemåde for filmarrayet og ForEach.

Men hvis man kører denne kode direkte:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

vil der komme en fejlmeddelelse:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Betydningen af denne fejl er, at når du skriver `id: \.self`, har SwiftUI brug for at tage hvert element i arrayet selv som en "unik identifikator" for at kunne skelne dem fra hinanden.

Denne skrivemåde passer til simple typer som `String` og `Int`, fordi de i sig selv er lettere at skelne.

Men `Movie` er en brugerdefineret struktur, som vi selv har lavet, og `ForEach` ved ikke, hvordan den skal bruge selve strukturen som unik identifikator, og derfor opstår fejlen.

Den mest almindelige måde at løse dette problem på er at lade `Movie` overholde protokollen `Identifiable`.

## Protokol

I Swift kan en protokol forstås som en slags "regel" eller "krav".

Du kan forstå den som en aftale i en international organisation: Hvis et land vil være med i en international organisation, skal det som regel først opfylde nogle regler, som organisationen opstiller, offentliggøre nogle data og overholde nogle fælles regler. Først når disse betingelser er opfyldt, kan det blive medlem eller deltage i visse forhold.

Protokoller fungerer på en lignende måde.

Når en type vil overholde en bestemt protokol, skal den opfylde det indhold, som protokollen kræver. Først når disse krav er opfyldt, kan typen bruge den tilsvarende funktionalitet.

Grundlæggende skrivemåde:

```swift
struct Movie: Identifiable {
    // ...
}
```

Her betyder `: Identifiable`, at `Movie` overholder `Identifiable`-protokollen.

Hvis en type overholder flere protokoller, kan de adskilles med komma:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

For `Identifiable` er det vigtigste krav, at typen skal have en `id`, som kan identificere den selv.

For eksempel:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Her er `id` ligesom et id-nummer og bruges til at skelne hver film.

Så længe hver films `id` er forskellig, kan SwiftUI korrekt skelne hvert element i arrayet.

For eksempel:

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

Og derefter bruger vi i `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Så vil der ikke længere opstå fejl.

Fordi `Movie` allerede overholder `Identifiable`, er en mere almindelig skrivemåde at udelade `id:` direkte:

```swift
ForEach(lists) { movie in
    // ...
}
```

Fordi SwiftUI allerede ved, at den skal bruge `movie.id` til at skelne hver post.

## ForEach' skelneidentifikator

Nedenfor vil vi forstå rollen af `id` i `ForEach` mere i dybden.

For eksempel:

```swift
ForEach(lists, id: \.self)
```

Her betyder det: Brug selve elementet som skelneidentifikator.

Og:

```swift
ForEach(lists, id: \.id)
```

betyder: Brug elementets `id`-felt som skelneidentifikator.

Hvis et bestemt felt i sig selv kan garantere unikhed, kan det også bruges midlertidigt.

Hvis for eksempel hver films navn er forskelligt, så kan denne skrivemåde også fungere normalt med de nuværende data:

```swift
ForEach(lists, id: \.name)
```

Men der er et skjult problem her: `name` er ikke nødvendigvis altid unikt.

Hvis du senere tilføjer endnu en film med samme navn, kan `name` ikke længere skelne præcist mellem hvert element.

På det tidspunkt kan koden godt stadig kompilere, men ved opdatering af view, indsættelse eller sletning kan SwiftUI komme til at identificere forkert, hvilket fører til visningsfejl.

Derfor er det bedst at bruge et virkelig unikt felt, nemlig `id`, når data skal kunne skelnes stabilt.

## UUID

Selvom manuel skrivning som `id: 1`, `id: 2` kan løse problemet, er der stadig en risiko: Man kan ved et uheld komme til at skrive en duplikeret `id`, og så mister den unikke identifikator sin virkning.

For eksempel:

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

På den måde opstår der to ens `id`, og den unikke identifikator mister sin gyldighed.

For at undgå manuelle fejl bruger vi normalt `UUID()`.

I Swift genererer `UUID()` tilfældigt en 128-bit identifikator. Den vises normalt som en lang streng bestående af bogstaver og tal.

For eksempel:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Her opretter `UUID()` faktisk en instans af typen `UUID`; du kan forstå den som et automatisk genereret "unikt nummer".

Derfor vil de værdier, der oprettes hver gang, næsten aldrig være ens, så den er meget velegnet til brug som `id`.

Vi kan ændre `Movie` til:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Denne kode betyder, at feltet `id` i `Movie`-strukturen som standard vil blive tildelt en ny `UUID`-instans.

Det vil sige, at hver gang vi opretter en ny `Movie`, vil systemet automatisk først generere en unik `id`.

`id` har allerede en standardværdi, så når vi senere opretter `Movie`-instanser, behøver vi ikke længere manuelt at udfylde `id`.

For eksempel:

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

Selvom der ikke står `id` her, har denne filminstans stadig sin egen `id`; det er bare en værdi, som allerede automatisk er genereret af `UUID()`.

Når vi bruger denne metode, behøver vi ikke længere manuelt udfylde `id` for hver film, hvilket både reducerer kodemængden og undgår fejl på grund af gentagne id-værdier.

Til sidst skal vi bare tilføje et `Banner`-billede øverst og bruge `ScrollView` til at gøre indholdet rulleligt, så hele filmlistevisningen er fuldført.

## Opsummering

I denne lektion lærte vi et meget vigtigt emne: `struct`.

Ved hjælp af `struct` kan vi samle flere relaterede felter for en film til en helhed i stedet for at splitte navn, instruktør og vurdering op i flere arrays.

Når dataene er samlet, kan vi bruge `ForEach` til at vise hver film i arrayet én efter én i viewet.

Samtidig forstod vi også rollen af "skelneidentifikatoren" i `ForEach`: SwiftUI skal vide, hvordan den skal skelne hvert element i arrayet, for at kunne vise og opdatere viewet korrekt.

Derfor lod vi `Movie` overholde `Identifiable`-protokollen og gav den en unik `id`.

For at undgå fejl ved manuel udfyldning af `id` lærte vi også `UUID()`, så systemet automatisk kan generere den unikke identifikator.

Når du er færdig med denne lektion, har du ikke kun lavet en filmliste, men også fået kontakt med en vigtig tankegang i SwiftUI: **Organisér først dataene, og generér derefter viewet ud fra dataene.**

## Komplet kode

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
