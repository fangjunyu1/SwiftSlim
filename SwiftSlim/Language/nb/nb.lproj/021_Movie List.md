# Filmliste

I denne leksjonen skal vi lage en filmliste.

![movie](../../Resource/021_movie.png)

I listen vil plakaten, navnet, regissøren og vurderingen for hver film vises.

I dette eksemplet skal vi lære et svært viktig kunnskapspunkt: `struct`-strukturer. Den kan hjelpe oss med å kombinere flere opplysninger om én film til én helhet. I tillegg vil vi også komme borti `UUID()`, `ForEach`, skillelinjen `Divider`, og hvordan vi kan bruke egendefinerte objekter til å håndtere data.

Denne kunnskapen er svært vanlig i videre SwiftUI-utvikling. Etter denne leksjonen vil du ikke bare kunne lage en filmliste, men også begynne å forstå «hvordan man viser en gruppe data som et grensesnitt».

## En enkelt film

Vi kan først begynne med grensesnittet for én enkelt film.

![movie](../../Resource/021_movie1.png)

Oppsettet i dette grensesnittet består hovedsakelig av to deler: til venstre er filmplakaten, og til høyre er filmbeskrivelsen.

### Filmplakat

Til venstre vises filmplakaten, og vi kan bruke `Image` for å vise bildet.

For eksempel:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Denne koden betyr at et bilde med navnet `"The Shawshank Redemption"` vises.

Det er viktig å merke seg her at bildefilen må finnes i ressursmappen `Assets`, ellers vil grensesnittet ikke kunne vise dette bildet riktig.

![movie](../../Resource/021_movie2.png)

Funksjonen til disse modifikatorene er som følger:

- `resizable()` betyr at bildet kan endre størrelse.
- `scaledToFit()` betyr at det opprinnelige forholdet beholdes under skalering, slik at bildet ikke strekkes og deformeres.
- `frame(height: 180)` betyr at høyden på bildet settes til 180.
- `cornerRadius(10)` betyr at bildet får avrundede hjørner med radius 10.

Slik får vi et filmplakatbilde med passende størrelse og avrundede hjørner.

![movie](../../Resource/021_movie3.png)

### Filmbeskrivelse

Til høyre vises filmbeskrivelsen, inkludert filmnavn, regissør og vurdering.

![movie](../../Resource/021_movie4.png)

Vi kan bruke `Text` for å vise denne delen:

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

I denne koden betyr `.font` størrelsen på skriften, og `.fontWeight` betyr tykkelsen på skriften.

For å få tydeligere avstand mellom «filmnavn», «regissørinformasjon» og «vurderingsinformasjon», bruker vi her `VStack` ytterst og setter:

```swift
spacing: 10
```

Dette betyr at avstanden mellom hver gruppe med innhold inne i denne `VStack` er 10.

Grunnen til at regissør og vurdering hver for seg pakkes inn i en egen `VStack`, er at de begge tilhører en struktur av typen «tittel + innhold». Derfor blir nivåene i grensesnittet tydeligere, og det blir også enklere for oss å justere stilen videre senere.

I tillegg er `VStack` som standard midtstilt. For å få all teksten venstrejustert, setter vi:

```swift
alignment: .leading
```

På denne måten ser filmbeskrivelsen ryddigere ut.

### Skillelinje

Nå er innholdet i filmbeskrivelsen riktignok adskilt gjennom `spacing`, men skillet mellom ulikt innhold er fortsatt ikke tydelig nok.

På dette tidspunktet kan vi legge til en skillelinje:

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

Slik vil filmbeskrivelsen få en tydeligere oppdelingseffekt.

![movie](../../Resource/021_movie4.png)

`Divider` er et svært enkelt, men veldig vanlig view. Funksjonen er å skille ulikt innhold fra hverandre.

I `VStack` vises `Divider()` som en vannrett linje.

I `HStack` vises `Divider()` som en loddrett linje.

I tillegg kan stilen til `Divider` endres gjennom `.frame`, `.background`, `.padding` og lignende.

For eksempel:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Dette vil lage en blå skillelinje med tykkelse 2 og innvendig marg på venstre og høyre side.

![divider](../../Resource/021_divider.png)

### Fullstendig grensesnitt

Til slutt kan vi bruke `HStack` til å plassere filmplakaten og filmbeskrivelsen side om side.

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

Her betyr `HStack(spacing: 20)` at det beholdes en avstand på 20 mellom de to delene til venstre og høyre.

Det er viktig å merke seg at `Divider()`, akkurat som `TextField` og `Slider` som vi har nevnt tidligere, som standard prøver å oppta så mye tilgjengelig plass som mulig.

Derfor setter vi en fast bredde på den ytre `VStack` i beskrivelsesdelen til høyre:

```swift
.frame(width: 200)
```

Slik kan bredden på skillelinjen og tekstområdet holdes lik, og helheten vil se ryddigere ut.

Hit til har vi fullført visningsgrensesnittet for «en enkelt film».

![movie](../../Resource/021_movie1.png)

## Lagre filmer i en array

Hvis vi vil vise flere filmer etter hverandre med samme stil, betyr det at vi må skrive lignende kode én gang for hver film.

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

Selv om kode skrevet på denne måten kan oppnå resultatet, blir koden stadig mer omfattende, og den blir vanskelig å vedlikeholde.

For eksempel, hvis vi må endre avstanden for alle filmer fra `20` til `15`, eller endre bredden til høyre fra `200` til
`220`, må vi manuelt endre hver eneste gjentatte kodeblokk.

Dette er åpenbart ikke en effektiv metode.

Vi har tidligere lært om arrayer, og vi har også lært å bruke `ForEach` til å vise views gjentatte ganger basert på en array.

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

Denne måten passer godt til å håndtere situasjoner med «bare én type data», for eksempel en gruppe bildenames.

Men én film har ikke bare én verdi. Den inneholder minst:

1. Filmplakat
2. Filmnavn
3. Regissør
4. Vurdering

Det vil si at én film egentlig er en gruppe relaterte data, og ikke bare en enkelt streng.

Hvis vi bare bruker arrayer, kan vi bare lagre denne informasjonen separat:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Ved visning må vi stole på samme indeks for å få en-til-en-samsvar:

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

Problemet med denne skrivemåten er at vedlikeholdskostnaden er høy.

Fordi dataene til én film blir spredd ut i flere arrayer, vil visningsresultatet bli feil så snart én array har ett element for mye, ett for lite, eller rekkefølgen ikke stemmer.

Særlig når man legger til eller sletter filmer, må man endre flere arrayer samtidig, og det er veldig lett å overse noe.

Hvordan kan vi da kombinere informasjon som «filmnavn, regissør, vurdering» til én helhet?

Da må vi bruke `struct`.

## Definere `struct`

I Swift er `struct` en «struktur».

Du kan forstå den som en «egendefinert datatype» som kan kombinere flere relaterte felt til én helhet.

Grunnleggende bruk:

```swift
struct StructName {
	let name: String
}
```

I denne koden er `struct` et nøkkelord som viser at vi definerer en struktur. `StructName` er navnet på strukturen.

Innholdet i klammeparentesene er feltene som denne strukturen inneholder, og hvert felt må ha både navn og type tydelig skrevet.

Vanligvis begynner navnet på en `struct` med stor bokstav, for eksempel `Movie`, `Student`, `UserInfo`. Dette er en vanlig navneskikk i Swift.

Du kan enkelt forstå `struct` som en tom gaveeske, der hvert felt er som en tom plass som er satt av i esken.

Når disse plassene ennå ikke er fylt med innhold, er det bare en tom eske. Først når alle feltene fylles med passende verdier, blir den en komplett gaveeske.

### `struct`-instans

Tidligere definerte vi bare selve strukturen, noe som tilsvarer å ha gjort klart utformingen på en gaveeske.

Vi må fortsatt fylle inn det konkrete innholdet før vi får en ekte «instans» som kan brukes.

Når vi oppretter en instans, legger vi vanligvis til `()` etter navnet på strukturen:

```swift
StructName(...)
```

Det som fylles inn i parentesene, er feltinnholdet som denne strukturen trenger.

For eksempel:

```swift
StructName(name: "Fang Junyu")
```

Denne koden betyr: opprett en ny instans etter formatet til strukturen `StructName`, og gi feltet `name` verdien `"Fang Junyu"`.

Når vi har fylt inn alt feltinnhold som trengs, tilsvarer det å fylle gaveesken.

Da får vi en komplett strukturinstans.

### Tilgang til `struct`-egenskaper

Når vi har opprettet en instans, kan vi bruke «dot-syntax» for å få tilgang til egenskapene inni den.

Grunnleggende skrivemåte:

```swift
instance.propertyName
```

For eksempel:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Her er `st` en strukturinstans, og `st.name` betyr å lese verdien `name` i denne instansen.

Du kan forstå denne måten å lese på slik: når vi skriver `st.name`, er det som om vi leser innholdet som er lagret på en bestemt plass i gaveesken.

Denne skrivemåten vil være svært vanlig i SwiftUI-grensesnitt senere.

Hvis vi for eksempel har en studentstruktur som inneholder navn, alder og klasse, kan vi ved visning i grensesnittet lese:

```swift
student.name
student.age
student.className
```

Fordelen med dette er at dataene blir tydeligere og enklere å håndtere.

### Hvor `struct` plasseres

For nybegynnere kan det ofte være lurt å skrive strukturen utenfor `ContentView`.

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

Slik blir strukturen tydeligere, og den blir også lettere å lese.

Du vil oppdage at `ContentView` faktisk også er en `struct`.

### `Movie`-struktur

Med grunnlaget over kan vi definere en filmstruktur:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Dette er en struktur som heter `Movie`, og den består av tre felt: `name`, `director` og `rating`, som representerer henholdsvis filmnavn, regissør og vurdering.

Dermed trenger ikke informasjonen om én film lenger å deles opp i flere arrayer, men kan kombineres direkte til én helhet.

For eksempel kan vi opprette en slik filminstans:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Denne instansen representerer «ett komplett filmdatasett».

### Lagre strukturer i en array

Tidligere sa vi at en array bare kan lagre én og samme type.

Nå har vi allerede strukturen `Movie`, og da kan arrayen lagre flere `Movie`.

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

I denne arrayen `lists` lagres ikke strenger, men flere `Movie`-instanser.

Det vil si at hvert element i arrayen er én komplett film.

Slik kan vi, når vi trenger å vise filmlisten, bruke `ForEach` til å lese hver film én etter én.

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

Her betyr `movie in` at det ved hver løkke hentes ut én film fra arrayen, og den får midlertidig navnet `movie`.

Deretter kan vi bruke:

```swift
movie.name
movie.director
movie.rating
```

for å lese navnet, regissøren og vurderingen til denne filmen hver for seg, og vise dem i grensesnittet.

## `ForEach`-feil

Hit til har vi fullført den grunnleggende skrivemåten for filmarrayen og `ForEach`.

Men hvis vi kjører koden nedenfor direkte:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

vil vi få en feil:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Denne feilen betyr at når du skriver `id: \.self`, trenger SwiftUI å bruke hvert element i arrayen i seg selv som en «unik identifikator» for å skille dem fra hverandre.

Denne skrivemåten passer for enkle typer som `String` og `Int`, fordi de i seg selv er relativt enkle å skille.

Men `Movie` er en egendefinert struktur, og `ForEach` vet ikke hvordan den skal bruke selve strukturen som unik identifikator, derfor oppstår feilen.

Den vanligste måten å løse dette problemet på er å la `Movie` følge protokollen `Identifiable`.

## Protokoll

I Swift kan en protokoll forstås som en slags «regel» eller «krav».

Du kan forstå det som en avtale i en internasjonal organisasjon: Hvis et land ønsker å bli med i en internasjonal organisasjon, må det vanligvis først oppfylle noen regler som organisasjonen stiller, offentliggjøre noen data og følge noen felles regler. Først etter å ha oppfylt disse betingelsene kan det bli med eller delta i enkelte saker.

En protokoll fungerer på lignende måte.

Når en type ønsker å følge en bestemt protokoll, må den oppfylle innholdet som denne protokollen krever. Først etter å ha oppfylt disse kravene kan typen bruke den tilhørende funksjonaliteten.

Grunnleggende skrivemåte:

```swift
struct Movie: Identifiable {
    // ...
}
```

Her betyr `: Identifiable` at `Movie` følger protokollen `Identifiable`.

Hvis en type følger flere protokoller, kan de skilles med komma:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

For `Identifiable` er det viktigste kravet at typen må ha en `id` som kan identifisere den selv.

For eksempel:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Her er `id` som et personnummer, brukt til å skille hver film fra de andre.

Så lenge `id` for hver film er forskjellig, kan SwiftUI skille hvert element i arrayen korrekt.

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

Og deretter bruke i `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Da vil det ikke lenger oppstå feil.

Siden `Movie` allerede følger `Identifiable`, er det enda vanligere å utelate `id:` direkte:

```swift
ForEach(lists) { movie in
    // ...
}
```

Fordi SwiftUI allerede vet at `movie.id` skal brukes for å skille hvert element.

## Skilleidentifikator i `ForEach`

Nedenfor skal vi forstå rollen til `id` i `ForEach` mer i dybden.

For eksempel:

```swift
ForEach(lists, id: \.self)
```

Her betyr det: bruk selve elementet som skilleidentifikator.

Og:

```swift
ForEach(lists, id: \.id)
```

betyr: bruk feltet `id` i elementet som skilleidentifikator.

Hvis et felt i seg selv kan garantere unikhet, kan det også brukes midlertidig.

For eksempel, hvis navnet på hver film er forskjellig, kan følgende skrivemåte også fungere med de nåværende dataene:

```swift
ForEach(lists, id: \.name)
```

Men her finnes det et skjult problem: `name` er ikke nødvendigvis alltid unikt.

La oss si at du senere legger til en film med samme navn, da vil `name` ikke lenger kunne skille hvert element nøyaktig.

På det tidspunktet kan koden fortsatt kompilere, men ved oppfriskning, oppdatering, innsetting og sletting av views kan SwiftUI gjenkjenne feil og føre til unormal visning.

Derfor, når data må skilles på en stabil måte, er det best å bruke et virkelig unikt felt, nemlig `id`.

## UUID

Selv om man kan løse problemet ved å skrive `id: 1`, `id: 2` manuelt, finnes det fortsatt en risiko: man kan ved et uhell skrive en duplikat `id`, og den unike identifikasjonen vil da miste effekten.

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

Da vil det oppstå to like `id`, og den unike identifikasjonen vil ikke lenger fungere.

For å unngå manuelle feil bruker vi vanligvis `UUID()`.

I Swift vil `UUID()` generere en tilfeldig 128-bit identifikator. Den vises vanligvis som en lang streng bestående av bokstaver og tall.

For eksempel:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Her oppretter `UUID()` faktisk en instans av typen `UUID`, og du kan forstå den som et automatisk generert «unikt nummer».

Derfor vil verdiene som opprettes nesten aldri være like, og de passer derfor svært godt som `id`.

Vi kan endre `Movie` til:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Denne koden betyr at feltet `id` i strukturen `Movie` som standard vil få tildelt en ny `UUID`-instans.

Det vil si at hver gang vi oppretter en ny `Movie`, vil systemet automatisk først generere en unik `id` for oss.

`id` har allerede en standardverdi, så når vi senere oppretter `Movie`-instanser, trenger vi ikke lenger fylle ut `id` manuelt.

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

Selv om `id` ikke er skrevet her, har denne filminstansen i praksis fortsatt sin egen `id`; det er bare at verdien allerede er automatisk generert av `UUID()`.

Ved å bruke denne måten trenger vi ikke lenger manuelt å fylle inn `id` for hver film, noe som både reduserer mengden kode og unngår feil forårsaket av dupliserte id-er.

Til slutt trenger vi bare å legge til et `Banner`-bilde øverst og bruke `ScrollView` for å gjøre innholdet rullbart, så er hele filmlistevisningen ferdig.

## Oppsummering

I denne leksjonen lærte vi et svært viktig kunnskapspunkt: `struct`.

Gjennom `struct` kan vi kombinere flere relaterte felt for én film til én helhet, i stedet for å splitte navn, regissør og vurdering opp i flere arrayer.

Når dataene er satt sammen, kan vi bruke `ForEach` til å vise hver film i arrayen én etter én i viewet.

Samtidig forsto vi også rollen til «skilleidentifikator» i `ForEach`. SwiftUI må vite hvordan hvert element i arrayen skal skilles, slik at viewet kan vises og oppdateres riktig.

Derfor lot vi `Movie` følge protokollen `Identifiable`, og ga den en unik `id`.

For å unngå feil ved manuell utfylling av `id`, lærte vi videre om `UUID()`, som lar systemet automatisk generere en unik identifikator.

Etter denne leksjonen har du ikke bare fullført en filmliste, men også begynt å møte en viktig tankegang i SwiftUI: **organiser først dataene, og generer deretter viewet basert på dataene.**

## Fullstendig kode

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
