# struct und class

In der letzten Lektion haben wir gerade erst begonnen, mit `struct` in Berührung zu kommen, eine Struktur definiert und außerdem Themen wie Protokolle, `UUID` und weitere Wissenspunkte kennengelernt.

Jetzt haben wir bereits ein erstes Verständnis für das Schlüsselwort `struct`, aber man kann noch nicht sagen, dass wir es wirklich verstanden haben.

In dieser Lektion machen wir mit `struct` als Hauptthema weiter und lernen nebenbei auch `class` kennen. Durch diese Lektion wirst du klarer verstehen: Was eine Instanz ist, was ein Konstruktor ist und warum wir `struct` und `class` verwenden können, um Daten zu organisieren.

## Schülerverwaltungssystem

Zum Beispiel wollen wir jetzt ein Schülerverwaltungssystem entwickeln. Jeder Schüler hat Informationen wie Name, Geschlecht, Telefon, Alter, Wohnadresse und so weiter.

An diesem Punkt können wir diese Informationen zusammenfassen und als eine `Student`-Struktur definieren:

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

Hier verwenden wir `struct`, um einen Schülertyp zu definieren.

Diese `Student`-Struktur enthält mehrere Eigenschaften:

- `id`: die eindeutige Kennung des Schülers
- `name`: der Name des Schülers
- `sex`: das Geschlecht des Schülers
- `phone`: die Telefonnummer des Schülers
- `age`: das Alter des Schülers
- `address`: die Wohnadresse

Auf diese Weise werden mehrere ursprünglich verteilte Daten zu einem vollständigen „Schüler“ zusammengefasst.

Hier folgt `Student` außerdem dem Protokoll `Identifiable` und definiert ein Feld `id`, damit sich Daten später bequem zusammen mit der `ForEach`-Schleife anzeigen lassen.

Danach können wir eine Schülerinstanz erstellen:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Dieser Code bedeutet, dass nach dieser Struktur `Student` konkrete Schülerdaten erstellt werden können.

Dabei ist `Student` der Typ und `Student(...)` steht für eine erstellte Instanz.

In SwiftUI können wir diese Instanz einer Variablen zuweisen und dann anzeigen.

Zum Beispiel:

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

So können wir in der Ansicht den Namen dieses Schülers sehen: `Fang Junyu`.

Hier haben wir zuerst eine `Student`-Instanz erstellt, sie dann der Variablen `student` zugewiesen und schließlich über `student.name` auf ihre Eigenschaft zugegriffen.

## Was ist eine Instanz

Wenn wir gerade erst anfangen, `struct` zu lernen, kann uns das Wort „Instanz“ ziemlich fremd vorkommen.

Aber in Wirklichkeit verwenden wir Instanzen schon von Anfang an, wir haben nur vorher nicht besonders darauf geachtet.

Zum Beispiel:

```swift
let name = "Fang Junyu"
```

Hier ist `"Fang Junyu"` ein String-Wert, und seinem Wesen nach ist es eine Instanz des Typs `String`.

Wir können es auch so schreiben:

```swift
let name = String("Fang Junyu")
```

Diese beiden Schreibweisen drücken dieselbe Sache aus: eine Instanz des Typs `String` zu erstellen und sie der Variablen `name` zuzuweisen.

Genauso ist es auch bei `Int`:

```swift
let num = 3
```

Die `3` hier ist ihrem Wesen nach ein Wert vom Typ `Int` und kann ebenfalls als `Int`-Instanz verstanden werden.

Eine Instanz ist also kein besonderes Konzept, das nur in `struct` auftaucht.

Ob `String`, `Int`, `Double`, `Bool` oder der benutzerdefinierte `Student` - sie alle können Instanzen erzeugen.

Wenn wir also schreiben:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

dann ist das im Wesentlichen dasselbe wie das Erstellen einer `String`- oder `Int`-Instanz, nur dass `Student` ein von uns selbst definierter Typ ist.

## Konstruktor

Wenn wir eine Instanz erstellen:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

dann rufen wir in Wirklichkeit die Initialisierungsmethode von `Student` auf, also `init`.

Du kannst einen Konstruktor so verstehen: **Er ist der Einstiegspunkt, der beim Erstellen einer Instanz dafür verantwortlich ist, Werte an die Eigenschaften zuzuweisen.**

Das heißt: Bevor eine Instanz wirklich vollständig erstellt ist, muss sie normalerweise zuerst durch `init`.

Zum Beispiel haben wir beim Lernen des SwiftUI-View-Lebenszyklus zuvor solchen Code geschrieben:

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

Hier wird `init()` ausgeführt, wenn die `ContentView`-Instanz erstellt wird, während `onAppear` erst ausgeführt wird, wenn die View tatsächlich auf dem Bildschirm erscheint. Das heißt, das Erstellen und das Anzeigen einer View sind nicht derselbe Zeitpunkt.

Genauso rufen wir beim Erstellen von `Student(...)` den Konstruktor von `Student` auf.

### Automatisch vom System erzeugter Konstruktor

Als wir `Student` definiert haben, haben wir `init` nicht manuell geschrieben:

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

Trotzdem können wir weiterhin direkt eine Instanz erstellen:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Warum kann eine Instanz erstellt werden, obwohl kein Konstruktor geschrieben wurde?

Weil bei `struct` das System normalerweise automatisch einen passenden Konstruktor für uns erzeugt, wenn wir keinen Konstruktor manuell schreiben.

In der Anfangsphase des Lernens kann man das einfach so verstehen: Swift ergänzt den Initialisierungscode automatisch für uns.

Man kann es ungefähr so verstehen, dass das System folgenden Code für uns ergänzt:

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

Hier muss man auf ein Detail achten:

```swift
let id = UUID()
```

`id` hat bereits einen Standardwert, deshalb müssen wir beim Erstellen einer Instanz `id` nicht noch einmal manuell übergeben.

Das heißt: Eigenschaften ohne Standardwert müssen normalerweise im Konstruktor übergeben werden; Eigenschaften, die bereits einen Standardwert haben, können diesen ursprünglichen Standardwert normalerweise direkt verwenden.

Deshalb müssen wir beim Erstellen einer `Student`-Instanz nur `name`, `sex`, `phone`, `age` und `address` übergeben.

### Hinweise des Compilers

Außerdem können wir, wenn wir `Student(...)` in Xcode eingeben, auch die vom System gegebenen Parameterhinweise sehen.

![student](../../Resource/022_student.png)

Das zeigt eigentlich auch: Der aktuelle Typ besitzt tatsächlich einen vom System automatisch erzeugten Konstruktor.

### Den Konstruktor selbst schreiben

Obwohl das System einen Konstruktor automatisch erzeugen kann, passt diese Standardinitialisierung manchmal nicht vollständig zu unseren Anforderungen.

Zum Beispiel haben wir eine `Movie`-Struktur:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Nach dem automatisch vom System erzeugten Konstruktor müssen wir beim Erstellen einer Instanz diese drei Parameter gleichzeitig übergeben:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Wenn wir jetzt aber eine Reihe alter Filme erfassen wollen und nur die Filmtitel kennen, nicht aber Regisseur und Bewertung, wird das etwas umständlich.

Denn dann können wir nur so schreiben:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Auch wenn das funktioniert, ist es nicht bequem, jedes Mal `--` zu wiederholen.

Dann können wir einen Konstruktor schreiben:

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

Auf diese Weise müssen wir beim Erstellen alter Filme nur `name` übergeben:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Das ist eine der Bedeutungen des selbst geschriebenen Konstruktors: **die Art, wie Instanzen erstellt werden, besser an die tatsächlichen Anforderungen anzupassen.**

### Einen benutzerdefinierten Konstruktor verstehen

Schauen wir uns diesen eben von Hand geschriebenen Konstruktor einmal an:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Dieser Code bedeutet, dass beim Erstellen einer `Movie`-Instanz nur ein Parameter `name` übergeben werden muss.

Dann weist der Konstruktor intern das übergebene `name` dem eigenen `name` der Instanz zu und gibt `director` und `rating` jeweils den Standardwert `--`.

`self` bedeutet hier „diese aktuelle Instanz selbst“.

Zum Beispiel:

```swift
self.name = name
```

Das `self.name` links steht für die Eigenschaft in der Instanz; das `name` rechts steht für den von uns übergebenen Parameter.

Man kann es einfach so verstehen, dass der von außen übergebene Wert in der eigenen Eigenschaft der Instanz gespeichert wird.

Wenn allen Eigenschaften Werte zugewiesen wurden, ist die Erstellung dieser Instanz abgeschlossen.

### Mechanismus des Konstruktors

Wenn wir einen Konstruktor explizit deklarieren, bringt das noch eine weitere Veränderung mit sich:

der ursprünglich automatisch vom System erzeugte Konstruktor kann dann normalerweise nicht mehr direkt verwendet werden.

Zum Beispiel:

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

Wenn wir jetzt wieder so schreiben:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

dann meldet der Compiler einen Fehler:

```swift
Extra arguments at positions #2, #3 in call
```

Das bedeutet: Du hast zusätzliche Parameter übergeben.

Warum tritt dieser Fehler auf?

Weil es in der aktuellen `Movie`-Struktur nur diesen einen Typ von Konstruktor gibt, den du manuell deklariert hast:

```swift
init(name: String)
```

Er akzeptiert nur einen Parameter `name` und akzeptiert nicht `director` und `rating`.

Das heißt: Wenn du deinen eigenen Konstruktor manuell hinzufügst, kann die ursprünglich automatisch erzeugte Initialisierungsweise nicht mehr direkt verwendet werden.

Wenn wir sowohl „nur den Namen übergeben“ als auch „vollständige Informationen übergeben“ unterstützen wollen, müssen wir selbst noch einen vollständigen Konstruktor ergänzen:

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

So haben wir dann zwei verschiedene Konstruktoren.

Beim Erstellen eines alten Films können wir so schreiben:

```swift
Movie(name: "The Night of the Hunter")
```

Beim Erstellen eines neuen Films mit vollständigen Informationen können wir so schreiben:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Diese Schreibweise zeigt auch: Derselbe Typ kann mehrere Konstruktoren besitzen, solange sich ihre Parameterformen unterscheiden.

## Was ist Überladung

Hier ergänzen wir noch einen notwendigen Wissenspunkt.

Gerade eben haben wir für `Movie` zwei `init` geschrieben:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Diese Schreibweise - „derselbe Funktionsname, aber unterschiedliche Parameter“ - nennt man „Überladung“.

Hier heißen beide Funktionen `init`, aber weil sie unterschiedliche Parameter empfangen, kann Swift unterscheiden, welche Funktion du aufrufst.

Zum Beispiel:

```swift
Movie(name: "Days of Heaven")
```

ruft auf:

```swift
init(name: String)
```

Während:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

die andere vollständige Version der Initialisierungsmethode aufruft.

Die Aufgabe der Überladung ist also: demselben Typ je nach Situation verschiedene Arten der Erstellung anzubieten.

## class kennenlernen

Als Nächstes lernen wir `class` noch kurz kennen.

Neben dem in Swift häufigen `struct` verwenden viele Programmiersprachen `class`, um Instanzen zu erzeugen, zum Beispiel Java, C#, Kotlin und andere.

In Swift ist die Schreibweise von `class` der von `struct` sehr ähnlich.

Zum Beispiel:

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

Du wirst feststellen, dass - abgesehen davon, dass das Schlüsselwort von `struct` zu `class` wechselt - die übrigen Teile fast gleich aussehen.

Auch die Art, eine Instanz zu erstellen, ist sehr ähnlich:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Daher sind sich `struct` und `class` auf der Syntaxebene tatsächlich sehr ähnlich.

### Unterschied zwischen Struct und Class

Auch wenn `struct` und `class` sehr ähnlich aussehen, sind sie nicht vollständig identisch.

**1. Die Initialisierung ist unterschiedlich**

Bei `struct` gilt: Wenn wir keinen Konstruktor manuell schreiben, erzeugt das System normalerweise automatisch eine passende Initialisierungsmethode.

Bei `class` gilt jedoch: Wenn es Eigenschaften ohne Standardwert gibt, muss normalerweise `init` manuell geschrieben werden, sonst entsteht ein Fehler.

Zum Beispiel:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Diese `class` führt zu einem Fehler, weil sie keinen Konstruktor hat und die Eigenschaften dadurch nicht initialisiert werden.

Der Compiler zeigt einen Hinweis in der Art:

```swift
Class 'Movie' has no initializers
```

Deshalb muss in diesem Beispiel für `class` zwingend ein Konstruktor manuell geschrieben werden.

**2. `struct` ist ein Werttyp, `class` ist ein Referenztyp**

`struct` ist ein Werttyp und `class` ist ein Referenztyp.

In der Anfangsphase musst du diese beiden Konzepte noch nicht vollständig beherrschen; es reicht, wenn du sie grob kennst.

Zum Beispiel ähnelt `struct` eher dem „Kopieren eines neuen Werts“.

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

Hier ist es nach der Zuweisung von `user1` an `user2` so, als ob eine neue Kopie der Daten erstellt wurde, deshalb beeinflusst das Ändern von `user2` `user1` nicht.

`class` ähnelt dagegen eher dem „gemeinsamen Verweisen auf dieselbe Instanz“.

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

Hier verweisen `user1` und `user2` auf dieselbe Instanz.

Im Moment müssen wir den zugrunde liegenden Mechanismus von Werttypen und Referenztypen noch nicht vollständig verstehen; es reicht zu wissen, dass `struct` besser zum Speichern unabhängiger Daten geeignet ist und `class` besser geeignet ist, wenn mehrere Stellen dieselbe Instanz gemeinsam nutzen sollen.

## Wie man in der Anfangsphase auswählt

In der aktuellen Phase sollte man bei gewöhnlichen Datenmodellen zuerst `struct` in Betracht ziehen, und wenn Daten geteilt und synchron verändert werden müssen, dann `class`.

Das ist keine absolute Regel, aber für Anfänger ist es eine ausreichend praktische Entscheidungsweise.

Besonders in SwiftUI wirst du oft feststellen, dass `struct` den größten Teil der Arbeit bereits erledigen kann.

Außerdem wird in vielen Programmiermaterialien das, was mit `class` erstellt wird, auch „Objekt“ genannt. In der Anfangsphase kannst du es einfach als Instanz verstehen, ohne absichtlich zwischen beiden zu unterscheiden.

## Zusammenfassung

In dieser Lektion haben wir `struct` genauer kennengelernt und nebenbei auch `class`; beide können verwendet werden, um Typen zu definieren.

Typen können Instanzen erstellen. Beim Erstellen einer Instanz wird der Konstruktor aufgerufen, also `init`.

Bei `struct` gilt: Wenn wir keinen Konstruktor manuell schreiben, erzeugt das System normalerweise automatisch einen passenden Konstruktor. Wenn der Standardkonstruktor den Anforderungen nicht genügt, können wir auch selbst einen Konstruktor schreiben.

Außerdem haben wir einen ersten Eindruck vom Unterschied zwischen `struct` und `class` bekommen: `struct` ist ein Werttyp und `class` ein Referenztyp. In SwiftUI begegnet man in der Anfangsphase normalerweise häufiger `struct`.

Später, wenn wir das Weitergeben von Werten zwischen Views, Datenmodelle und Zustandsverwaltung lernen, werden all diese Inhalte weiter verwendet.
