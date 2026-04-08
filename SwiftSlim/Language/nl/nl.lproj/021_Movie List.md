# Filmlijst

In deze les gaan we een filmlijst maken.

![movie](../../Resource/021_movie.png)

In de lijst worden van elke film de poster, naam, regisseur en beoordeling weergegeven.

In dit voorbeeld leren we een zeer belangrijk concept: de `struct`-structuur. Die helpt ons om meerdere stukjes informatie over één film samen te voegen tot één geheel. Daarnaast maken we ook kennis met `UUID()`, `ForEach`, de scheidingslijn `Divider`, en hoe we aangepaste objecten kunnen gebruiken om gegevens te beheren.

Deze kennis komt heel vaak terug in latere SwiftUI-ontwikkeling. Na deze les kun je niet alleen een filmlijst maken, maar begin je ook te begrijpen “hoe je een groep gegevens als interface weergeeft”.

## Eén film

We kunnen eerst beginnen met de interface van één enkele film.

![movie](../../Resource/021_movie1.png)

De lay-out van deze interface bestaat voornamelijk uit twee delen: links staat de filmposter en rechts de filmbeschrijving.

### Filmposter

Links wordt de filmposter weergegeven, en we kunnen `Image` gebruiken om de afbeelding te tonen.

Bijvoorbeeld:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Deze code betekent dat een afbeelding met de naam `"The Shawshank Redemption"` wordt weergegeven.

Let er hier op dat de afbeeldingsnaam echt moet bestaan in de bronmap `Assets`, anders kan de interface deze afbeelding niet correct tonen.

![movie](../../Resource/021_movie2.png)

De functies van deze modifiers zijn als volgt:

- `resizable()` betekent dat de afbeelding van grootte kan veranderen.
- `scaledToFit()` betekent dat de oorspronkelijke verhouding tijdens het schalen behouden blijft, zodat de afbeelding niet wordt uitgerekt of vervormd.
- `frame(height: 180)` betekent dat de hoogte van de afbeelding op 180 wordt ingesteld.
- `cornerRadius(10)` betekent dat de afbeelding afgeronde hoeken met straal 10 krijgt.

Zo krijgen we een filmposter met een geschikte grootte en afgeronde hoeken.

![movie](../../Resource/021_movie3.png)

### Filmbeschrijving

Rechts wordt de filmbeschrijving weergegeven, inclusief filmnaam, regisseur en beoordeling.

![movie](../../Resource/021_movie4.png)

We kunnen `Text` gebruiken om dit deel weer te geven:

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

In deze code staat `.font` voor de grootte van het lettertype en `.fontWeight` voor de dikte ervan.

Om duidelijkere afstanden te krijgen tussen “filmnaam”, “regisseurinformatie” en “beoordelingsinformatie”, gebruiken we hier aan de buitenkant `VStack` en stellen we in:

```swift
spacing: 10
```

Dit betekent dat de afstand tussen elke groep inhoud binnen deze `VStack` 10 is.

De reden dat regisseur en beoordeling elk nog eens in een eigen `VStack` worden verpakt, is dat ze allebei tot een structuur van “titel + inhoud” behoren. Daardoor worden de lagen van de interface duidelijker en kunnen we de stijl later ook makkelijker verder aanpassen.

Bovendien is `VStack` standaard gecentreerd uitgelijnd. Om de tekst als geheel links uit te lijnen, stellen we in:

```swift
alignment: .leading
```

Zo ziet het gedeelte met de filmbeschrijving er netter uit.

### Scheidingslijn

Nu is de inhoud in de filmbeschrijving wel uit elkaar getrokken met `spacing`, maar de scheiding tussen verschillende onderdelen is nog steeds niet duidelijk genoeg.

Op dit moment kunnen we een scheidingslijn toevoegen:

```swift
Divider()
```

Bijvoorbeeld:

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

Zo krijgt het gedeelte met de filmbeschrijving een duidelijker scheidingseffect.

![movie](../../Resource/021_movie4.png)

`Divider` is een heel eenvoudig maar veelgebruikt view, en de functie ervan is om verschillende inhoud van elkaar te scheiden.

In `VStack` wordt `Divider()` weergegeven als een horizontale lijn.

In `HStack` wordt `Divider()` weergegeven als een verticale lijn.

Daarnaast kun je de stijl van `Divider` ook aanpassen via `.frame`, `.background`, `.padding` en andere methoden.

Bijvoorbeeld:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Hiermee wordt een blauwe scheidingslijn gemaakt met dikte 2 en binnenmarges aan de linker- en rechterkant.

![divider](../../Resource/021_divider.png)

### Volledige interface

Tot slot kunnen we `HStack` gebruiken om de filmposter en filmbeschrijving links en rechts naast elkaar te plaatsen.

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

Hier betekent `HStack(spacing: 20)` dat er een afstand van 20 tussen de twee delen links en rechts wordt behouden.

Belangrijk is dat `Divider()`, net als `TextField` en `Slider` die we eerder hebben besproken, standaard zoveel mogelijk beschikbare ruimte probeert in te nemen.

Daarom geven we de buitenste `VStack` van het beschrijvingsgedeelte rechts een vaste breedte:

```swift
.frame(width: 200)
```

Zo blijft de breedte van de scheidingslijn en het tekstgebied gelijk en ziet het geheel er netter uit.

Tot hier hebben we de weergave-interface voor “één film” voltooid.

![movie](../../Resource/021_movie1.png)

## Films opslaan in een array

Als we meerdere films één voor één in dezelfde stijl willen weergeven, betekent dat dat we voor elke film opnieuw vergelijkbare code moeten schrijven.

Bijvoorbeeld:

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

Code die zo geschreven is kan het gewenste effect bereiken, maar de code wordt steeds langer en is lastig te onderhouden.

Bijvoorbeeld: als we de afstand van alle films van `20` naar `15` moeten wijzigen, of de breedte aan de rechterkant van `200` naar
`220` moeten veranderen, dan moeten we elk herhaald codeblok handmatig aanpassen.

Dit is duidelijk geen efficiënte manier.

We hebben eerder arrays geleerd, en ook hoe je met `ForEach` op basis van een array views herhaald kunt weergeven.

Bijvoorbeeld:

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

Deze manier is heel geschikt voor situaties waarin er “slechts één soort gegevens” is, zoals een groep afbeeldingsnamen.

Maar een film heeft niet slechts één waarde. Een film bevat minstens:

1. Filmposter
2. Filmnaam
3. Regisseur
4. Beoordeling

Met andere woorden: een film is eigenlijk een groep gerelateerde gegevens en niet zomaar één losse string.

Als we alleen arrays gebruiken, kunnen we deze informatie alleen apart opslaan:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Bij het weergeven moeten we vertrouwen op dezelfde index om ze één voor één met elkaar te laten overeenkomen:

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

Het probleem met deze schrijfwijze is dat de onderhoudskosten hoog zijn.

Omdat de gegevens van één film verspreid zijn over meerdere arrays, gaat het weergaveresultaat al mis zodra één array één item te veel, één te weinig of een andere volgorde heeft.

Vooral bij het toevoegen of verwijderen van films moet je meerdere arrays tegelijk aanpassen, en het is heel makkelijk om iets over het hoofd te zien.

Hoe kunnen we dan informatie zoals “filmnaam, regisseur, beoordeling” combineren tot één geheel?

Daarvoor moeten we `struct` gebruiken.

## Een `struct` definiëren

In Swift is `struct` een “structuur”.

Je kunt het begrijpen als een “aangepast gegevenstype” dat meerdere gerelateerde velden tot één geheel kan combineren.

Basisgebruik:

```swift
struct StructName {
	let name: String
}
```

In deze code is `struct` een sleutelwoord dat aangeeft dat we een structuur definiëren. `StructName` is de naam van de structuur.

De inhoud tussen de accolades zijn de velden die deze structuur bevat, en voor elk veld moeten naam en type duidelijk worden opgegeven.

Meestal begint de naam van een `struct` met een hoofdletter, zoals `Movie`, `Student`, `UserInfo`. Dit is een gebruikelijke naamgevingsconventie in Swift.

Je kunt `struct` eenvoudig zien als een lege verpakkingsdoos, waarbij elk veld lijkt op een lege plek die in die doos is gereserveerd.

Zolang die plekken nog niet zijn gevuld, is het slechts een lege doos. Pas wanneer alle velden met geschikte waarden zijn ingevuld, wordt het een complete cadeaudoos.

### `struct`-instance

Hiervoor hebben we alleen de structuur zelf gedefinieerd, wat neerkomt op het voorbereiden van het model van een verpakkingsdoos.

We moeten er nog concrete inhoud in stoppen om een echte bruikbare “instance” te krijgen.

Bij het maken van een instance zetten we meestal `()` achter de naam van de structuur:

```swift
StructName(...)
```

Wat tussen de ronde haakjes wordt ingevuld, is de veldinhoud die de structuur nodig heeft.

Bijvoorbeeld:

```swift
StructName(name: "Fang Junyu")
```

Deze code betekent: maak volgens het formaat van de structuur `StructName` een nieuwe instance aan en geef het veld `name` de waarde `"Fang Junyu"`.

Wanneer we alle vereiste veldwaarden hebben ingevuld, is dat alsof we de verpakkingsdoos volledig hebben gevuld.

Dan hebben we een volledige structuurinstance gekregen.

### Toegang tot `struct`-eigenschappen

Wanneer we een instance hebben aangemaakt, kunnen we “dot-syntax” gebruiken om toegang te krijgen tot de eigenschappen erin.

Basisnotatie:

```swift
instance.propertyName
```

Bijvoorbeeld:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Hier is `st` een structuurinstance, en `st.name` betekent dat we de waarde `name` in deze instance uitlezen.

Je kunt deze manier van lezen zo begrijpen: wanneer we `st.name` schrijven, is het alsof we de inhoud lezen die op een bepaalde plek in die verpakkingsdoos is opgeslagen.

Deze schrijfwijze zal later in SwiftUI-interfaces heel vaak voorkomen.

Als we bijvoorbeeld een studentstructuur hebben met naam, leeftijd en klas, dan kunnen we bij het weergeven in de interface apart uitlezen:

```swift
student.name
student.age
student.className
```

Het voordeel hiervan is dat de gegevens duidelijker worden en ook makkelijker te beheren zijn.

### Positie van `struct`

Voor beginners is het meestal prima om de structuur buiten `ContentView` te schrijven.

Bijvoorbeeld:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Zo wordt de structuur duidelijker en ook makkelijker leesbaar.

Je zult merken dat `ContentView` zelf eigenlijk ook een `struct` is.

### Structuur `Movie`

Met de bovenstaande basis kunnen we een filmstructuur definiëren:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Dit is een structuur met de naam `Movie`, die uit drie velden bestaat: `name`, `director` en `rating`, die respectievelijk de filmnaam, regisseur en beoordeling voorstellen.

Zo hoeft informatie die bij één film hoort niet meer over meerdere arrays verdeeld te worden opgeslagen, maar kan die direct tot één geheel worden gecombineerd.

Bijvoorbeeld, we kunnen zo’n filminstance maken:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Deze instance vertegenwoordigt “één volledige filmdataset”.

### Structuren opslaan in een array

Eerder zeiden we dat een array alleen hetzelfde type kan opslaan.

Nu we de structuur `Movie` hebben, kan een array meerdere `Movie`-objecten opslaan.

```swift
let lists: [Movie] = []
```

Bijvoorbeeld:

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

In deze array `lists` worden geen strings opgeslagen, maar meerdere `Movie`-instances.

Dat betekent dat elk element in de array een volledige film is.

Zo kunnen we, wanneer we de filmlijst willen weergeven, via `ForEach` elke film één voor één uitlezen.

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

Hier betekent `movie in` dat bij elke lus één film uit de array wordt gehaald en tijdelijk `movie` wordt genoemd.

Daarna kunnen we gebruiken:

```swift
movie.name
movie.director
movie.rating
```

om de naam, regisseur en beoordeling van die film afzonderlijk uit te lezen en in de interface weer te geven.

## `ForEach`-fout

Tot hier hebben we de basis van de filmarray en `ForEach` voltooid.

Maar als we de onderstaande code direct uitvoeren:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

dan verschijnt er een fout:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

De betekenis van deze fout is dat, wanneer je `id: \.self` schrijft, SwiftUI elk element in de array zelf als “unieke identificatie” moet gebruiken om ze te onderscheiden.

Deze schrijfwijze is geschikt voor eenvoudige typen zoals `String` en `Int`, omdat die op zichzelf al relatief makkelijk te onderscheiden zijn.

Maar `Movie` is een door ons aangepaste structuur, en `ForEach` weet niet hoe het die zelf als unieke identificatie moet gebruiken, daarom verschijnt deze fout.

De meest gebruikelijke manier om dit probleem op te lossen is: `Movie` laten voldoen aan het protocol `Identifiable`.

## Protocol

In Swift kun je een protocol begrijpen als een soort “regel” of “vereiste”.

Je kunt het begrijpen als een verdrag in een internationale organisatie: als een land zich bij een bepaalde internationale organisatie wil aansluiten, moet het meestal eerst voldoen aan een aantal regels die die organisatie stelt, bepaalde gegevens openbaar maken en zich aan een aantal gemeenschappelijke regels houden. Pas nadat aan deze voorwaarden is voldaan, kan het zich aansluiten of aan bepaalde zaken deelnemen.

Een protocol werkt op een vergelijkbare manier.

Wanneer een type aan een bepaald protocol wil voldoen, moet het voldoen aan de inhoud die door dat protocol wordt voorgeschreven. Pas nadat aan die eisen is voldaan, kan dat type de bijbehorende functionaliteit gebruiken.

Basisnotatie:

```swift
struct Movie: Identifiable {
    // ...
}
```

Hier betekent `: Identifiable` dat `Movie` voldoet aan het protocol `Identifiable`.

Als een type aan meerdere protocollen voldoet, kun je ze met komma’s scheiden:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Voor `Identifiable` is de belangrijkste eis: het type moet een `id` hebben waarmee het zichzelf kan identificeren.

Bijvoorbeeld:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Hier is `id` net als een identiteitsnummer, waarmee elke film van elkaar wordt onderscheiden.

Zolang de `id` van elke film verschillend is, kan SwiftUI elk element in de array correct onderscheiden.

Bijvoorbeeld:

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

En gebruik vervolgens in `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Dan krijg je geen fout meer.

Omdat `Movie` al voldoet aan `Identifiable`, is het nog gebruikelijker om `id:` gewoon weg te laten:

```swift
ForEach(lists) { movie in
    // ...
}
```

Omdat SwiftUI al weet dat `movie.id` moet worden gebruikt om elk item te onderscheiden.

## Het onderscheidingsteken van `ForEach`

Hieronder gaan we de rol van `id` in `ForEach` dieper begrijpen.

Bijvoorbeeld:

```swift
ForEach(lists, id: \.self)
```

Hier betekent het: gebruik het element zelf als onderscheidingsteken.

En:

```swift
ForEach(lists, id: \.id)
```

betekent: gebruik het veld `id` van het element als onderscheidingsteken.

Als een bepaald veld op zichzelf uniciteit kan garanderen, kan het tijdelijk ook worden gebruikt.

Bijvoorbeeld, als de naam van elke film anders is, dan kan de volgende schrijfwijze met de huidige gegevens ook gewoon werken:

```swift
ForEach(lists, id: \.name)
```

Maar hier zit een verborgen probleem: `name` is niet per se altijd uniek.

Stel dat je later nog een film met dezelfde naam toevoegt, dan kan `name` niet langer elk element nauwkeurig onderscheiden.

Op dat moment kan de code nog steeds compileren, maar bij het verversen, bijwerken, invoegen of verwijderen van views kan SwiftUI zich vergissen, waardoor de weergave abnormaal wordt.

Daarom is het, wanneer gegevens stabiel onderscheiden moeten worden, het beste om toch het echt unieke veld te gebruiken, namelijk `id`.

## UUID

Hoewel handmatig `id: 1`, `id: 2` schrijven het probleem kan oplossen, is er nog steeds een risico: je kunt per ongeluk een dubbele `id` schrijven, waardoor de unieke identificatie niet meer werkt.

Bijvoorbeeld:

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

Dan ontstaan er twee gelijke `id`’s, en verliest de unieke identificatie zijn werking.

Om handmatige fouten te voorkomen, gebruiken we meestal `UUID()`.

In Swift genereert `UUID()` willekeurig een identificatiecode van 128 bits. Meestal wordt die weergegeven als een lange reeks van letters en cijfers.

Bijvoorbeeld:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Hier maakt `UUID()` eigenlijk een instance van het type `UUID`, en je kunt het begrijpen als een automatisch gegenereerd “uniek nummer”.

Daarom worden de waarden die telkens worden aangemaakt bijna nooit herhaald, en zijn ze dus heel geschikt om als `id` te gebruiken.

We kunnen `Movie` aanpassen naar:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Deze code betekent dat het veld `id` in de structuur `Movie` standaard een nieuwe `UUID`-instance toegewezen krijgt.

Met andere woorden: telkens wanneer we een nieuwe `Movie` aanmaken, genereert het systeem automatisch eerst een unieke `id` voor ons.

`id` heeft al een standaardwaarde, dus wanneer we later `Movie`-instances maken, hoeven we `id` niet meer handmatig in te vullen.

Bijvoorbeeld:

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

Hoewel hier geen `id` is geschreven, heeft deze filminstance in werkelijkheid nog steeds zijn eigen `id`; de waarde is alleen al automatisch door `UUID()` gegenereerd.

Met deze manier hoeven we niet langer handmatig voor elke film een `id` in te vullen. Dat vermindert niet alleen de hoeveelheid code, maar voorkomt ook fouten door dubbele id’s.

Tot slot hoeven we alleen nog bovenaan een `Banner`-afbeelding toe te voegen en `ScrollView` te gebruiken zodat de inhoud scrollbaar is, en dan is de volledige filmlijstweergave klaar.

## Samenvatting

In deze les hebben we een zeer belangrijk concept geleerd: `struct`.

Met `struct` kunnen we meerdere gerelateerde velden van één film combineren tot één geheel, in plaats van naam, regisseur en beoordeling afzonderlijk over meerdere arrays te verdelen.

Wanneer de gegevens zijn samengevoegd, kunnen we `ForEach` gebruiken om elke film in de array één voor één in de view weer te geven.

Tegelijkertijd hebben we ook de rol begrepen van het “onderscheidingsteken” in `ForEach`. SwiftUI moet weten hoe elk element in de array onderscheiden moet worden, zodat de view correct kan worden weergegeven en bijgewerkt.

Daarom hebben we `Movie` laten voldoen aan het protocol `Identifiable` en het van een unieke `id` voorzien.

Om fouten bij het handmatig invullen van `id` te voorkomen, hebben we verder `UUID()` geleerd, waarmee het systeem automatisch een unieke identificatie genereert.

Na deze les heb je niet alleen een filmlijst voltooid, maar raak je ook een belangrijke denkrichting in SwiftUI aan: **organiseer eerst de gegevens en genereer daarna op basis van die gegevens de view.**

## Volledige code

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
