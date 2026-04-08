# Filmlista

I den här lektionen ska vi skapa en filmlista.

![movie](../../Resource/021_movie.png)

I listan visas varje films affisch, namn, regissör och betyg.

I det här exemplet ska vi lära oss en mycket viktig kunskapspunkt: `struct`-strukturen. Den kan hjälpa oss att kombinera flera uppgifter om en film till en helhet. Dessutom kommer vi också i kontakt med `UUID()`, `ForEach`, skiljelinjen `Divider`, samt hur man använder anpassade objekt för att hantera data.

Den här kunskapen är mycket vanlig i senare SwiftUI-utveckling. Efter den här lektionen kommer du inte bara att kunna skapa en filmlista, utan också börja förstå ”hur man visar en grupp data som ett gränssnitt”.

## En film

Vi kan först börja med gränssnittet för en enskild film.

![movie](../../Resource/021_movie1.png)

Det här gränssnittets layout består huvudsakligen av två delar: till vänster finns filmens affisch, och till höger finns filmbeskrivningen.

### Filmaffisch

Till vänster visas filmaffischen, och vi kan använda `Image` för att visa bilden.

Till exempel:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Den här koden betyder att en bild med namnet `"The Shawshank Redemption"` visas.

Det är viktigt att notera här att bildnamnet verkligen måste finnas i resursmappen `Assets`, annars kan gränssnittet inte visa bilden korrekt.

![movie](../../Resource/021_movie2.png)

De här modifierarnas funktioner är följande:

- `resizable()` betyder att bildens storlek kan ändras.
- `scaledToFit()` betyder att den ursprungliga proportionen behålls vid skalning, så att bilden inte sträcks ut och förvrängs.
- `frame(height: 180)` betyder att bildens höjd sätts till 180.
- `cornerRadius(10)` betyder att bilden får rundade hörn med radien 10.

På så sätt får vi en filmaffisch med lämplig storlek och rundade hörn.

![movie](../../Resource/021_movie3.png)

### Filmbeskrivning

Till höger visas filmbeskrivningen, inklusive filmens namn, regissör och betyg.

![movie](../../Resource/021_movie4.png)

Vi kan använda `Text` för att visa den här delen:

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

I den här koden betyder `.font` teckenstorlek, och `.fontWeight` betyder teckentjocklek.

För att göra avståndet mellan ”filmens namn”, ”regissörsinformation” och ”betygsinformation” tydligare använder vi här `VStack` i det yttersta lagret och ställer in:

```swift
spacing: 10
```

Det betyder att avståndet mellan varje innehållsgrupp inuti den här `VStack` är 10.

Anledningen till att regissören och betyget var för sig omsluts av en egen `VStack` är att båda tillhör en struktur av typen ”rubrik + innehåll”. Därför blir gränssnittets nivåer tydligare, och det blir också lättare för oss att fortsätta justera stilen senare.

Dessutom är `VStack` centrerad som standard. För att få all text vänsterjusterad ställer vi in:

```swift
alignment: .leading
```

På så sätt ser delen med filmbeskrivningen mer prydlig ut.

### Skiljelinje

Nu har innehållet i filmbeskrivningen visserligen fått avstånd genom `spacing`, men gränsen mellan olika innehåll är fortfarande inte tillräckligt tydlig.

Vid det här laget kan vi lägga till en skiljelinje:

```swift
Divider()
```

Till exempel:

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

På så sätt får delen med filmbeskrivningen en tydligare uppdelningseffekt.

![movie](../../Resource/021_movie4.png)

`Divider` är en mycket enkel men mycket vanligt använd view, vars funktion är att skilja olika innehåll åt.

I `VStack` visas `Divider()` som en horisontell linje.

I `HStack` visas `Divider()` som en vertikal linje.

Dessutom kan stilen på `Divider` ändras genom `.frame`, `.background`, `.padding` och andra sätt.

Till exempel:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Detta skapar en blå skiljelinje med tjocklek 2 och inre marginaler på vänster och höger sida.

![divider](../../Resource/021_divider.png)

### Fullständigt gränssnitt

Till sist kan vi använda `HStack` för att placera filmaffischen och filmbeskrivningen sida vid sida till vänster och höger.

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

Här betyder `HStack(spacing: 20)` att ett avstånd på 20 behålls mellan vänster och höger del.

Det är viktigt att notera att `Divider()`, liksom de tidigare nämnda `TextField` och `Slider`, som standard försöker ta upp så mycket tillgängligt utrymme som möjligt.

Därför sätter vi en fast bredd på den yttre `VStack` i beskrivningsdelen till höger:

```swift
.frame(width: 200)
```

På så sätt hålls bredden på skiljelinjen och textområdet konsekvent, och helheten ser mer prydlig ut.

Hittills har vi slutfört visningsgränssnittet för ”en film”.

![movie](../../Resource/021_movie1.png)

## Spara filmer i en array

Om vi vill visa flera filmer en efter en i samma stil, betyder det att vi måste skriva liknande kod för varje film.

Till exempel:

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

Även om kod skriven på det här sättet kan uppnå effekten, blir det mer och mer kod, och den blir svår att underhålla.

Till exempel, om vi behöver ändra avståndet för alla filmer från `20` till `15`, eller ändra bredden till höger från `200` till
`220`, behöver vi manuellt ändra varje upprepad koddel.

Det här är uppenbart inte en effektiv metod.

Vi har tidigare lärt oss om arrayer, och också hur man använder `ForEach` för att upprepat visa vyer baserat på en array.

Till exempel:

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

Det här sättet passar mycket bra för att hantera situationer där det bara finns ”en enda typ av data”, till exempel en grupp bildnamn.

Men en film har inte bara ett enda värde. Den innehåller åtminstone:

1. Filmaffisch
2. Filmnamn
3. Regissör
4. Betyg

Med andra ord är en film egentligen en grupp relaterade data, och inte bara en enskild sträng.

Om vi bara använder arrayer kan vi bara spara den här informationen separat:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Vid visning måste vi förlita oss på samma index för att matcha dem en efter en:

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

Problemet med det här skrivsättet är att underhållskostnaden är mycket hög.

Eftersom data för en film splittras upp i flera arrayer räcker det att en array har ett objekt för mycket, ett för lite eller en annan ordning för att visningsresultatet ska bli fel.

Särskilt när man lägger till eller tar bort filmer måste man ändra flera arrayer samtidigt, och det är väldigt lätt att missa något.

Hur kan vi då kombinera information som ”filmens namn, regissör, betyg” till en helhet?

Det är här vi behöver använda `struct`.

## Definiera en `struct`

I Swift betyder `struct` ”struktur”.

Du kan förstå den som en ”anpassad datatyp” som kan kombinera flera relaterade fält till en helhet.

Grundläggande användning:

```swift
struct StructName {
	let name: String
}
```

I den här koden är `struct` ett nyckelord som visar att vi definierar en struktur. `StructName` är namnet på strukturen.

Innehållet inom klamrarna är de fält som strukturen innehåller, och varje fält måste tydligt ange namn och typ.

Vanligtvis börjar namnet på en `struct` med stor bokstav, till exempel `Movie`, `Student`, `UserInfo`. Detta är en vanlig namnkonvention i Swift.

Du kan enkelt förstå `struct` som en tom förpackningslåda, där varje fält är som en reserverad tom plats i lådan.

När dessa platser ännu inte är ifyllda är det bara en tom låda. Först när alla fält fylls med lämpliga värden blir den en komplett presentlåda.

### `struct`-instans

Tidigare definierade vi bara själva strukturen, vilket motsvarar att ha förberett formen på en förpackningslåda.

Vi behöver fortfarande fylla den med konkret innehåll för att få en verklig ”instans” som går att använda.

När man skapar en instans lägger man vanligtvis till `()` efter strukturens namn:

```swift
StructName(...)
```

Det som fylls i inom parenteserna är innehållet i de fält som strukturen behöver.

Till exempel:

```swift
StructName(name: "Fang Junyu")
```

Den här koden betyder: skapa en ny instans enligt formatet för strukturen `StructName`, och ge fältet `name` värdet `"Fang Junyu"`.

När vi fyllt i allt nödvändigt fältinnehåll motsvarar det att fylla lådan.

Då får vi en komplett strukturinstans.

### Åtkomst till `struct`-egenskaper

När vi har skapat en instans kan vi använda ”punktnotation” för att komma åt dess inre egenskaper.

Grundläggande skrivsätt:

```swift
instance.propertyName
```

Till exempel:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Här är `st` en strukturinstans, och `st.name` betyder att läsa värdet `name` i den här instansen.

Du kan förstå det här sättet att läsa så här: när vi skriver `st.name` är det som att läsa innehållet som lagrats på en viss plats i lådan.

Detta skrivsätt kommer att vara mycket vanligt i senare SwiftUI-gränssnitt.

Om vi till exempel har en studentstruktur som innehåller namn, ålder och klass, kan vi vid visning i gränssnittet läsa:

```swift
student.name
student.age
student.className
```

Fördelen med detta är att data blir tydligare och lättare att hantera.

### Var `struct` placeras

För nybörjare är det vanligtvis lämpligt att skriva strukturen utanför `ContentView`.

Till exempel:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

På så sätt blir strukturen tydligare och också lättare att läsa.

Du kommer att märka att `ContentView` själv faktiskt också är en `struct`.

### `Movie`-struktur

Med grunden ovan kan vi definiera en filmstruktur:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Detta är en struktur med namnet `Movie`, som består av tre fält: `name`, `director` och `rating`, som representerar filmens namn, regissör och betyg.

På så sätt behöver information som hör till en film inte längre delas upp i flera arrayer, utan kan direkt kombineras till en helhet.

Till exempel kan vi skapa en sådan här filminstans:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Den här instansen representerar ”en komplett uppsättning filmdata”.

### Spara strukturer i en array

Tidigare sa vi att en array bara kan lagra samma typ.

Nu har vi redan strukturen `Movie`, och då kan arrayen lagra flera `Movie`.

```swift
let lists: [Movie] = []
```

Till exempel:

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

I den här arrayen `lists` lagras inte strängar, utan flera `Movie`-instanser.

Det innebär att varje element i arrayen är en komplett film.

När vi behöver visa filmlistan kan vi därför läsa varje film en efter en med `ForEach`.

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

Här betyder `movie in` att en film hämtas från arrayen vid varje varv i loopen och tillfälligt får namnet `movie`.

Därefter kan vi använda:

```swift
movie.name
movie.director
movie.rating
```

för att läsa filmens namn, regissör och betyg var för sig och visa dem i gränssnittet.

## `ForEach`-fel

Fram till här har vi slutfört det grundläggande skrivsättet för filmarrayen och `ForEach`.

Men om vi direkt kör följande kod:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

kommer ett fel att visas:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Detta fel betyder att när du skriver `id: \.self` behöver SwiftUI behandla varje element i arrayen som en ”unik identifierare” för att skilja dem åt.

Det här skrivsättet passar för enkla typer som `String` och `Int`, eftersom de i sig själva är relativt lätta att skilja åt.

Men `Movie` är en anpassad struktur som vi själva definierat, och `ForEach` vet inte hur den ska använda själva strukturen som en unik identifierare, därför uppstår felet.

Det vanligaste sättet att lösa detta problem är att låta `Movie` följa protokollet `Identifiable`.

## Protokoll

I Swift kan ett protokoll förstås som en sorts ”regel” eller ”krav”.

Du kan förstå det som ett avtal i en internationell organisation: om ett land vill gå med i en internationell organisation måste det vanligtvis först uppfylla vissa regler som organisationen ställer, offentliggöra vissa data och följa gemensamma regler. Först efter att dessa villkor är uppfyllda kan det gå med eller delta i vissa frågor.

Ett protokoll fungerar på liknande sätt.

När en typ vill följa ett visst protokoll måste den uppfylla det innehåll som protokollet kräver. Först efter att dessa krav är uppfyllda kan typen använda motsvarande funktionalitet.

Grundläggande skrivsätt:

```swift
struct Movie: Identifiable {
    // ...
}
```

Här betyder `: Identifiable` att `Movie` följer protokollet `Identifiable`.

Om en typ följer flera protokoll kan de skiljas åt med kommatecken:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

För `Identifiable` är det viktigaste kravet att typen behöver ha ett `id` som kan identifiera sig själv.

Till exempel:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Här är `id` som ett identitetsnummer, som används för att skilja varje film från de andra.

Så länge varje films `id` är olika kan SwiftUI korrekt särskilja varje element i arrayen.

Till exempel:

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

Och använd sedan i `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Då kommer felet inte längre att uppstå.

Eftersom `Movie` redan följer `Identifiable` är det ännu vanligare att helt utelämna `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Eftersom SwiftUI redan vet att den ska använda `movie.id` för att skilja varje post åt.

## Identifierare för åtskillnad i `ForEach`

Nedan ska vi förstå rollen för `id` i `ForEach` mer på djupet.

Till exempel:

```swift
ForEach(lists, id: \.self)
```

Här betyder det: använd själva elementet som identifierare för åtskillnad.

Och:

```swift
ForEach(lists, id: \.id)
```

betyder: använd elementets fält `id` som identifierare för åtskillnad.

Om ett visst fält i sig själv kan garantera unikhet kan det också tillfälligt användas.

Till exempel, om namnet på varje film är olika, kan följande skrivsätt också fungera korrekt med de nuvarande uppgifterna:

```swift
ForEach(lists, id: \.name)
```

Men här finns ett dolt problem: `name` är inte nödvändigtvis alltid unikt.

Anta att du senare lägger till en till film med samma namn, då kan `name` inte längre exakt skilja varje element åt.

Vid det laget kan koden fortfarande kompileras, men vid uppdatering, infogning, borttagning eller omladdning av vyer kan SwiftUI identifiera fel, vilket leder till onormal visning.

Därför är det bäst att använda ett verkligt unikt fält, alltså `id`, när data måste särskiljas stabilt.

## UUID

Även om det går att lösa problemet genom att skriva `id: 1`, `id: 2` manuellt, finns det fortfarande en risk: man kan råka skriva ett duplicerat `id`, och den unika identifieringen tappar då sin funktion.

Till exempel:

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

Då uppstår två identiska `id`, och den unika identifieringen blir ogiltig.

För att undvika manuella misstag använder vi vanligtvis `UUID()`.

I Swift genererar `UUID()` slumpmässigt en 128-bitars identifierare. Den visas vanligtvis som en lång sträng bestående av bokstäver och siffror.

Till exempel:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Här skapar `UUID()` faktiskt en instans av typen `UUID`; du kan förstå den som ett automatiskt genererat ”unikt nummer”.

Därför upprepas de värden som skapas nästan aldrig, och de passar därför mycket bra att använda som `id`.

Vi kan ändra `Movie` till:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Den här koden betyder att fältet `id` i strukturen `Movie` som standard får värdet av en ny `UUID`-instans.

Det vill säga: varje gång vi skapar en ny `Movie` genererar systemet först automatiskt ett unikt `id` åt oss.

`id` har redan ett standardvärde, så när vi senare skapar `Movie`-instanser behöver vi inte längre fylla i `id` manuellt.

Till exempel:

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

Även om `id` inte skrivs här, har den här filminstansen i praktiken fortfarande sitt eget `id`; det är bara så att värdet redan har genererats automatiskt av `UUID()`.

Efter att ha använt den här metoden behöver vi inte längre fylla i `id` manuellt för varje film, vilket både minskar mängden kod och undviker fel som orsakas av duplicerade id:n.

Till sist behöver vi bara lägga till en `Banner`-bild överst och använda `ScrollView` så att innehållet går att rulla, och då är hela visningen av filmlistan klar.

## Sammanfattning

I den här lektionen lärde vi oss en mycket viktig kunskapspunkt: `struct`.

Genom `struct` kan vi kombinera flera relaterade fält för en film till en helhet, istället för att dela upp namn, regissör och betyg i flera arrayer.

När datan har kombinerats kan vi använda `ForEach` för att visa varje film i arrayen en efter en i vyn.

Samtidigt förstod vi också rollen för ”identifierare för åtskillnad” i `ForEach`. SwiftUI måste veta hur varje element i arrayen ska särskiljas för att kunna visa och uppdatera vyn korrekt.

Därför lät vi `Movie` följa protokollet `Identifiable` och gav det ett unikt `id`.

För att undvika fel vid manuell ifyllning av `id` lärde vi oss vidare `UUID()`, som låter systemet automatiskt generera en unik identifierare.

Efter den här lektionen har du inte bara färdigställt en filmlista, utan också börjat komma i kontakt med ett viktigt tankesätt i SwiftUI: **ordna först datan och generera sedan vyn utifrån datan.**

## Komplett kod

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
