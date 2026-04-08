# Filmliste

In dieser Lektion erstellen wir eine Filmliste.

![movie](../../Resource/021_movie.png)

In der Liste werden für jeden Film das Poster, der Name, der Regisseur und die Bewertung angezeigt.

In diesem Beispiel lernen wir einen sehr wichtigen Punkt kennen: die `struct`-Struktur. Sie kann uns dabei helfen, mehrere Informationen zu einem Film zu einem Ganzen zusammenzufassen. Außerdem kommen wir mit `UUID()`, `ForEach`, der Trennlinie `Divider` sowie damit in Kontakt, wie man benutzerdefinierte Objekte zur Verwaltung von Daten verwendet.

Dieses Wissen ist in der späteren SwiftUI-Entwicklung sehr häufig. Nach dieser Lektion kannst du nicht nur eine Filmliste erstellen, sondern auch anfangen zu verstehen, „wie man eine Gruppe von Daten als Oberfläche darstellt“.

## Einzelner Film

Wir können zuerst mit der Oberfläche für einen einzelnen Film beginnen.

![movie](../../Resource/021_movie1.png)

Das Layout dieser Oberfläche besteht hauptsächlich aus zwei Teilen: Links befindet sich das Filmplakat, rechts die Filmbeschreibung.

### Filmplakat

Auf der linken Seite wird das Filmplakat angezeigt. Zum Anzeigen des Bildes können wir `Image` verwenden.

Zum Beispiel:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Dieser Code bedeutet, dass ein Bild mit dem Namen `"The Shawshank Redemption"` angezeigt wird.

Hier ist zu beachten, dass der Bildname tatsächlich im Ressourcenordner `Assets` vorhanden sein muss, sonst kann die Oberfläche dieses Bild nicht korrekt anzeigen.

![movie](../../Resource/021_movie2.png)

Die Funktionen dieser Modifikatoren sind jeweils:

- `resizable()` bedeutet, dass die Größe des Bildes angepasst werden kann.
- `scaledToFit()` bedeutet, dass beim Skalieren das ursprüngliche Seitenverhältnis beibehalten wird, damit das Bild nicht gestreckt und verzerrt wird.
- `frame(height: 180)` bedeutet, dass die Höhe des Bildes auf 180 gesetzt wird.
- `cornerRadius(10)` bedeutet, dass dem Bild ein Eckenradius von 10 gegeben wird.

Auf diese Weise erhalten wir ein Filmplakatbild in geeigneter Größe mit abgerundeten Ecken.

![movie](../../Resource/021_movie3.png)

### Filmbeschreibung

Auf der rechten Seite wird die Filmbeschreibung angezeigt, einschließlich Filmname, Regisseur und Bewertung.

![movie](../../Resource/021_movie4.png)

Wir können `Text` verwenden, um diesen Teil anzuzeigen:

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

In diesem Code bedeutet `.font` die Schriftgröße, und `.fontWeight` bedeutet die Schriftstärke.

Damit zwischen „Filmname“, „Regieinformationen“ und „Bewertungsinformationen“ klarere Abstände bestehen, verwenden wir hier auf der äußersten Ebene `VStack` und setzen:

```swift
spacing: 10
```

Das bedeutet, dass der Abstand zwischen jeder Inhaltsgruppe innerhalb dieses `VStack` 10 beträgt.

Der Grund, warum Regisseur und Bewertung jeweils noch einmal in ein eigenes `VStack` gepackt werden, ist, dass beide zu einer Struktur vom Typ „Titel + Inhalt“ gehören. Dadurch wird die Hierarchie der Oberfläche klarer, und wir können den Stil später leichter weiter anpassen.

Außerdem ist `VStack` standardmäßig zentriert ausgerichtet. Damit der Text insgesamt links ausgerichtet ist, setzen wir:

```swift
alignment: .leading
```

So wirkt der Teil mit der Filmbeschreibung ordentlicher.

### Trennlinie

Jetzt sind die Inhalte in der Filmbeschreibung zwar durch `spacing` voneinander getrennt, aber die Abgrenzung zwischen den verschiedenen Inhalten ist immer noch nicht deutlich genug.

In diesem Fall können wir eine Trennlinie hinzufügen:

```swift
Divider()
```

Zum Beispiel:

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

Dadurch bekommt der Teil mit der Filmbeschreibung einen deutlich sichtbaren Trenneffekt.

![movie](../../Resource/021_movie4.png)

`Divider` ist eine sehr einfache, aber sehr häufig verwendete View, deren Aufgabe es ist, unterschiedliche Inhalte voneinander zu trennen.

In `VStack` wird `Divider()` als horizontale Linie angezeigt.

In `HStack` wird `Divider()` als vertikale Linie angezeigt.

Außerdem kann man den Stil von `Divider` über `.frame`, `.background`, `.padding` und andere Methoden verändern.

Zum Beispiel:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Dadurch wird eine blaue Trennlinie mit einer Dicke von 2 und horizontalem Innenabstand erzeugt.

![divider](../../Resource/021_divider.png)

### Vollständige Oberfläche

Zum Schluss können wir `HStack` verwenden, um Filmplakat und Filmbeschreibung nebeneinander anzuordnen.

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

Hier bedeutet `HStack(spacing: 20)`, dass zwischen dem linken und dem rechten Teil ein Abstand von 20 gelassen wird.

Dabei ist zu beachten, dass `Divider()` genauso wie die zuvor behandelten `TextField` und `Slider` standardmäßig versucht, möglichst viel verfügbaren Platz einzunehmen.

Deshalb geben wir dem äußeren `VStack` des rechten Beschreibungsteils eine feste Breite:

```swift
.frame(width: 200)
```

Dadurch kann die Breite der Trennlinie und des Textbereichs gleich bleiben, und das Gesamtbild wirkt ordentlicher.

Bis hierhin haben wir die Anzeigeoberfläche für „einen einzelnen Film“ fertiggestellt.

![movie](../../Resource/021_movie1.png)

## Filme in einem Array speichern

Wenn wir mehrere Filme nacheinander im gleichen Stil anzeigen wollen, bedeutet das, dass wir für jeden Film einen ähnlichen Code schreiben müssen.

Zum Beispiel:

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

Auch wenn man mit diesem Code den gewünschten Effekt erreichen kann, wird der Code immer umfangreicher, und die Wartung wird sehr mühsam.

Wenn man zum Beispiel den Abstand aller Filme von `20` auf `15` ändern möchte oder die Breite des rechten Bereichs von `200` auf
`220`, muss man jeden wiederholten Codeabschnitt manuell ändern.

Das ist offensichtlich keine effiziente Methode.

Wir haben zuvor bereits Arrays gelernt und auch gelernt, mit `ForEach` Views anhand eines Arrays wiederholt anzuzeigen.

Zum Beispiel:

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

Diese Methode eignet sich sehr gut für Situationen, in denen es „nur einen Datenwert“ gibt, zum Beispiel eine Gruppe von Bildnamen.

Aber ein Film besteht nicht nur aus einem Wert. Er enthält mindestens:

1. Filmplakat
2. Filmname
3. Regisseur
4. Bewertung

Das heißt, ein Film ist eigentlich eine Gruppe zusammengehöriger Daten und nicht nur ein einzelner String.

Wenn wir nur Arrays verwenden, können wir diese Informationen nur getrennt speichern:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Beim Anzeigen müssen wir uns dann auf denselben Index verlassen, um sie eins zu eins zuzuordnen:

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

Das Problem bei dieser Schreibweise ist, dass die Wartungskosten sehr hoch sind.

Denn die Daten eines Films werden auf mehrere Arrays verteilt. Sobald ein Array einen Eintrag mehr, einen Eintrag weniger oder eine andere Reihenfolge hat, wird das Anzeigeergebnis falsch.

Besonders beim Hinzufügen oder Löschen von Filmen muss man mehrere Arrays gleichzeitig ändern, und es ist sehr leicht, etwas zu übersehen.

Wie kann man also Informationen wie „Filmname, Regisseur und Bewertung“ zu einem Ganzen zusammenfassen?

Dafür braucht man `struct`.

## struct-Struktur definieren

In Swift ist `struct` eine „Struktur“.

Du kannst sie als einen „benutzerdefinierten Datentyp“ verstehen, der mehrere zusammengehörige Felder zu einem Ganzen zusammenfassen kann.

Grundlegende Verwendung:

```swift
struct StructName {
	let name: String
}
```

In diesem Code ist `struct` das Schlüsselwort, das anzeigt, dass wir eine Struktur definieren. `StructName` ist der Name der Struktur.

Der Inhalt in den geschweiften Klammern sind die Felder, die diese Struktur enthält, und bei jedem Feld müssen Name und Typ klar angegeben werden.

Üblicherweise beginnt der Name einer `struct` mit einem Großbuchstaben, zum Beispiel `Movie`, `Student` oder `UserInfo`. Das ist eine in Swift verbreitete Benennungsgewohnheit.

Du kannst `struct` ganz einfach als eine leere Verpackungsbox verstehen, wobei jedes Feld wie ein reservierter leerer Platz in dieser Box ist.

Wenn diese Plätze noch nicht gefüllt sind, ist es nur eine leere Box. Erst wenn alle Felder mit passenden Werten gefüllt sind, wird daraus eine vollständige Geschenkbox.

### struct-Instanz

Vorhin haben wir nur die Struktur selbst definiert, was dem Vorbereiten der Form einer Verpackungsbox entspricht.

Wir müssen noch den konkreten Inhalt hineinfüllen, um eine echte „Instanz“ zu erhalten, die verwendet werden kann.

Beim Erstellen einer Instanz wird normalerweise hinter den Strukturnamen `()` gesetzt:

```swift
StructName(...)
```

Was in die Klammern geschrieben wird, ist genau der Feldinhalt, den diese Struktur benötigt.

Zum Beispiel:

```swift
StructName(name: "Fang Junyu")
```

Dieser Code bedeutet: Nach dem Format der Struktur `StructName` wird eine neue Instanz erstellt, und dem Feld `name` wird der Wert `"Fang Junyu"` zugewiesen.

Wenn wir alle benötigten Feldinhalte ausfüllen, ist das so, als würden wir diese Verpackungsbox vollständig füllen.

Dann erhalten wir eine vollständige Strukturinstanz.

### Zugriff auf struct-Eigenschaften

Wenn wir eine Instanz erstellt haben, können wir mit der „Punktsyntax“ auf ihre inneren Eigenschaften zugreifen.

Grundlegende Schreibweise:

```swift
Instanz.Eigenschaftsname
```

Zum Beispiel:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Hier ist `st` eine Strukturinstanz, und `st.name` bedeutet, den `name`-Wert dieser Instanz zu lesen.

Du kannst diese Lesemethode so verstehen: Wenn wir `st.name` schreiben, ist das so, als würden wir den Inhalt lesen, der an einer bestimmten Stelle in dieser Verpackungsbox liegt.

Diese Schreibweise wird in späteren SwiftUI-Oberflächen sehr häufig vorkommen.

Wenn wir zum Beispiel eine Schülerstruktur haben, die Name, Alter und Klasse enthält, können wir bei der Anzeige in der Oberfläche jeweils lesen:

```swift
student.name
student.age
student.className
```

Der Vorteil davon ist, dass die Daten klarer werden und sich auch leichter verwalten lassen.

### Position von struct

Für Anfänger kann man die Struktur normalerweise außerhalb von `ContentView` schreiben.

Zum Beispiel:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Dadurch wird die Struktur klarer und lässt sich leichter lesen.

Du wirst feststellen, dass `ContentView` selbst eigentlich auch eine `struct` ist.

### Movie-Struktur

Mit der vorigen Grundlage können wir nun eine Filmstruktur definieren:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Dies ist eine Struktur mit dem Namen `Movie`, die aus den drei Feldern `name`, `director` und `rating` besteht, die jeweils Filmname, Regisseur und Bewertung darstellen.

Dadurch müssen die zu einem Film gehörenden Informationen nicht mehr getrennt in mehreren Arrays gespeichert werden, sondern können direkt zu einem Ganzen zusammengefasst werden.

Zum Beispiel können wir eine Filminstanz wie diese erstellen:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Diese Instanz steht für „einen vollständigen Filmdatensatz“.

### Strukturen in einem Array speichern

Vorhin haben wir gesagt, dass ein Array nur denselben Typ speichern kann.

Jetzt haben wir bereits die `Movie`-Struktur, also kann das Array mehrere `Movie` speichern.

```swift
let lists: [Movie] = []
```

Zum Beispiel:

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

In diesem `lists`-Array werden keine Strings gespeichert, sondern mehrere `Movie`-Instanzen.

Das heißt, jedes Element im Array ist ein vollständiger Film.

Wenn wir also die Filmliste anzeigen müssen, können wir mit `ForEach` jeden Film der Reihe nach auslesen.

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

Hier bedeutet `movie in`, dass bei jeder Schleife ein Film aus dem Array genommen und vorübergehend `movie` genannt wird.

Dann können wir verwenden:

```swift
movie.name
movie.director
movie.rating
```

um jeweils den Namen, den Regisseur und die Bewertung dieses Films auszulesen und in der Oberfläche anzuzeigen.

## ForEach-Fehler

Bis hierhin haben wir bereits die grundlegende Schreibweise für das Filmarray und `ForEach` abgeschlossen.

Wenn man jedoch den folgenden Code direkt ausführt:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

erscheint eine Fehlermeldung:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Diese Fehlermeldung bedeutet, dass SwiftUI, wenn du `id: \.self` schreibst, jedes Element im Array selbst als „eindeutige Kennung“ verwenden muss, um es zu unterscheiden.

Diese Schreibweise eignet sich für einfache Typen wie `String` und `Int`, weil sie sich an sich leichter unterscheiden lassen.

Aber `Movie` ist eine von uns definierte benutzerdefinierte Struktur, und `ForEach` weiß nicht, wie sie selbst als eindeutige Kennung verwendet werden soll, deshalb entsteht der Fehler.

Die häufigste Lösung für dieses Problem ist, `Movie` dem Protokoll `Identifiable` entsprechen zu lassen.

## Protokoll

In Swift kann ein Protokoll als eine Art „Regel“ oder „Anforderung“ verstanden werden.

Man kann es sich wie ein Abkommen in einer internationalen Organisation vorstellen: Wenn ein Land einer bestimmten internationalen Organisation beitreten möchte, muss es normalerweise zuerst einige von dieser Organisation aufgestellte Regeln erfüllen, einige Daten offenlegen und einige gemeinsame Regeln einhalten. Erst wenn diese Bedingungen erfüllt sind, kann es beitreten oder an bestimmten Angelegenheiten teilnehmen.

Bei Protokollen ist es ganz ähnlich.

Wenn ein Typ einem bestimmten Protokoll entsprechen möchte, muss er den vom Protokoll geforderten Inhalt erfüllen. Erst nachdem diese Anforderungen erfüllt sind, kann dieser Typ die entsprechenden Funktionen verwenden.

Grundlegende Schreibweise:

```swift
struct Movie: Identifiable {
    // ...
}
```

Hier bedeutet `: Identifiable`, dass `Movie` dem Protokoll `Identifiable` entspricht.

Wenn ein Typ mehreren Protokollen entspricht, kann man sie mit Kommas trennen:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Für `Identifiable` ist die wichtigste Anforderung, dass der Typ ein `id` haben muss, mit dem er sich selbst identifizieren kann.

Zum Beispiel:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Hier ist `id` wie eine Ausweisnummer und wird verwendet, um jeden Film zu unterscheiden.

Solange die `id` jedes Films unterschiedlich ist, kann SwiftUI jedes Element im Array korrekt unterscheiden.

Zum Beispiel:

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

Dann verwenden wir in `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Dann tritt der Fehler nicht mehr auf.

Da `Movie` bereits `Identifiable` entspricht, ist eine noch häufigere Schreibweise, `id:` direkt wegzulassen:

```swift
ForEach(lists) { movie in
    // ...
}
```

Denn SwiftUI weiß bereits, dass `movie.id` verwendet werden soll, um jedes Element zu unterscheiden.

## Die Unterscheidungskennung von ForEach

Im Folgenden werden wir die Rolle von `id` in `ForEach` genauer verstehen.

Zum Beispiel:

```swift
ForEach(lists, id: \.self)
```

Das bedeutet: Das Element selbst als Unterscheidungskennung verwenden.

Und:

```swift
ForEach(lists, id: \.id)
```

bedeutet: Das Feld `id` des Elements als Unterscheidungskennung verwenden.

Wenn ein bestimmtes Feld selbst Eindeutigkeit garantieren kann, kann man es vorübergehend ebenfalls verwenden.

Wenn zum Beispiel der Name jedes Films unterschiedlich ist, könnte die folgende Schreibweise mit den aktuellen Daten ebenfalls normal funktionieren:

```swift
ForEach(lists, id: \.name)
```

Aber hier gibt es ein verstecktes Problem: `name` ist nicht unbedingt immer eindeutig.

Angenommen, du fügst später noch einen Film mit demselben Namen hinzu, dann kann `name` nicht mehr jedes Element genau unterscheiden.

Dann kann der Code zwar immer noch kompiliert werden, aber beim Aktualisieren der View, beim Einfügen oder Löschen kann SwiftUI die Elemente möglicherweise falsch erkennen, was zu Darstellungsfehlern führt.

Deshalb ist es besser, bei Bedarf einer stabilen Unterscheidung von Daten das wirklich eindeutige Feld zu verwenden, also `id`.

## UUID

Obwohl man das Problem durch manuelles Schreiben wie `id: 1`, `id: 2` lösen kann, gibt es trotzdem ein Risiko: Man könnte versehentlich eine doppelte `id` schreiben, und dann verliert die eindeutige Kennung ihre Wirkung.

Zum Beispiel:

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

So entstehen zwei gleiche `id`, und die eindeutige Kennung verliert ihre Gültigkeit.

Um manuelle Fehler zu vermeiden, verwenden wir normalerweise `UUID()`.

In Swift erzeugt `UUID()` zufällig eine 128-Bit-Kennung. Sie wird normalerweise als lange Zeichenfolge aus Buchstaben und Zahlen angezeigt.

Zum Beispiel:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Hier erstellt `UUID()` tatsächlich eine Instanz vom Typ `UUID`; du kannst sie als automatisch erzeugte „eindeutige Nummer“ verstehen.

Deshalb wiederholen sich die erzeugten Werte fast nie und eignen sich sehr gut als `id`.

Wir können `Movie` so ändern:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Dieser Code bedeutet, dass das Feld `id` in der Struktur `Movie` standardmäßig mit einer neuen `UUID`-Instanz belegt wird.

Das heißt, jedes Mal, wenn wir eine neue `Movie` erstellen, erzeugt das System zuerst automatisch eine eindeutige `id`.

Da `id` bereits einen Standardwert hat, müssen wir beim späteren Erstellen von `Movie`-Instanzen `id` nicht mehr manuell ausfüllen.

Zum Beispiel:

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

Obwohl hier `id` nicht geschrieben ist, besitzt diese Filminstanz tatsächlich trotzdem ihre eigene `id`; dieser Wert wurde nur bereits automatisch von `UUID()` erzeugt.

Nach dieser Methode müssen wir für jeden Film `id` nicht mehr manuell ausfüllen. Das verringert nicht nur die Code-Menge, sondern vermeidet auch Fehler durch doppelt vergebene id-Werte.

Zum Schluss müssen wir nur noch oben ein `Banner`-Bild hinzufügen und `ScrollView` verwenden, damit der Inhalt gescrollt werden kann, dann ist die gesamte Filmlisten-Ansicht fertig.

## Zusammenfassung

In dieser Lektion haben wir einen sehr wichtigen Punkt gelernt: `struct`.

Mit `struct` können wir mehrere zusammengehörige Felder eines Films zu einem Ganzen zusammenfassen, anstatt Name, Regisseur und Bewertung getrennt in mehreren Arrays zu speichern.

Nachdem die Daten zusammengefasst sind, können wir `ForEach` verwenden, um jeden Film im Array nacheinander in der View anzuzeigen.

Gleichzeitig haben wir auch die Rolle der „Unterscheidungskennung“ in `ForEach` verstanden: SwiftUI muss wissen, wie jedes Element im Array unterschieden werden kann, damit die View korrekt angezeigt und aktualisiert werden kann.

Deshalb haben wir `Movie` dem Protokoll `Identifiable` entsprechen lassen und ihm eine eindeutige `id` gegeben.

Um Fehler beim manuellen Ausfüllen von `id` zu vermeiden, haben wir zusätzlich `UUID()` kennengelernt, damit das System die eindeutige Kennung automatisch erzeugt.

Nach dieser Lektion hast du nicht nur die Filmliste fertiggestellt, sondern beginnst auch, eine wichtige Denkweise in SwiftUI kennenzulernen: **Ordne zuerst die Daten, und erzeuge dann die View anhand der Daten.**

## Vollständiger Code

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
