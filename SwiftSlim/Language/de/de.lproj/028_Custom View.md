# Benutzerdefinierte View

In dieser Lektion lernen wir eine sehr wichtige SwiftUI-Schreibweise: **benutzerdefinierte Views**.

Eine benutzerdefinierte View kann einen wiederholten Abschnitt von View-Code kapseln und daraus eine View machen, die wiederverwendet werden kann.

Bei der tatsächlichen Entwicklung einer App begegnet uns häufig diese Situation: Viele Oberflächen haben dieselbe Struktur, nur die angezeigten Inhalte unterscheiden sich.

Zum Beispiel kann in der Beitragsliste einer Forum-Website jeder Beitrag einen Titel, ein Bild, eine Anzahl an Likes und andere Informationen haben.

![Reddit](../../../Resource/028_view1.png)

In der Produktliste einer Shopping-Website kann jedes Produkt ein Bild, einen Namen, einen Preis und andere Informationen haben.

![Amazon](../../../Resource/028_view2.png)

Die Struktur dieser Inhalte ist ähnlich; der Unterschied liegt nur in den angezeigten Daten.

Wenn wir jedes Element manuell einmal schreiben, wird der Code sehr lang und spätere Änderungen werden unpraktisch.

Deshalb können wir die gleiche Struktur in eine benutzerdefinierte View kapseln und die unterschiedlichen Inhalte als Parameter übergeben.

So kann dieselbe View unterschiedliche Inhalte anzeigen.

## Anforderungsszenario

Zum Beispiel möchten wir jetzt eine Einstellungsliste erstellen.

Anzeigeeffekt:

![view](../../../Resource/028_view.png)

In dieser Einstellungsliste gibt es drei verschiedene Einstellungseinträge: `Settings`, `Folder` und `Music`.

Obwohl sich ihre Symbole, Farben und Titel unterscheiden, ist die Gesamtstruktur gleich:

- Symbol links
- Hintergrundfarbe des Symbols
- Titel in der Mitte
- Pfeil rechts

Wenn wir keine benutzerdefinierte View verwenden, könnten wir es so schreiben:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Einstellungen")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Ordner")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Musik")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Dieser Code kann normal angezeigt werden, aber das Problem ist ebenfalls offensichtlich: Der Code der drei Einstellungseinträge ist fast vollständig gleich.

Die einzigen unterschiedlichen Stellen sind Symbol, Farbe und Titel:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Einstellungen")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Ordner")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musik")
```

Das bedeutet: Die Struktur jedes Einstellungseintrags ist fest, nur Symbol, Farbe und Titel sind unterschiedlich.

Diese Situation eignet sich sehr gut für eine benutzerdefinierte View.

### Schatten shadow

Hier verwenden wir einen neuen Modifier `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` kann einer View einen Schatten hinzufügen.

`radius` bezeichnet den Unschärferadius des Schattens. Je größer der Wert, desto größer ist normalerweise die Ausbreitung des Schattens, und desto weicher wirkt er.

Hier setzen wir ihn auf `1`, was bedeutet, dass nur ein sehr leichter Schatteneffekt hinzugefügt wird.

## Einstellungseintrag-View kapseln

Als Nächstes kapseln wir jeden Einstellungseintrag in eine neue View.

Wir können eine `SettingItemView` erstellen:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

In dieser View definieren wir drei Eigenschaften:

```swift
let icon: String
let color: Color
let title: String
```

Dabei gilt:

- `icon` steht für den Symbolnamen
- `color` steht für die Hintergrundfarbe des Symbols
- `title` steht für den Titel des Einstellungseintrags

Da diese drei Inhalte in verschiedenen Einstellungseinträgen unterschiedlich sind, machen wir sie zu Parametern, die von außen übergeben werden können.

## Benutzerdefinierte View verwenden

Nachdem wir `SettingItemView` haben, müssen wir nicht mehr wiederholt einen großen Abschnitt `HStack`-Code schreiben.

Jetzt können wir sie so verwenden:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")
```

Diese Codezeile bedeutet: Eine Einstellungseintrag-View wird erstellt, und drei Parameter werden übergeben:

```swift
icon: "gear"
color: Color.blue
title: "Einstellungen"
```

Nach der Übergabe erhalten die Eigenschaften innerhalb von `SettingItemView` die entsprechenden Werte:

- Der Wert von `icon` ist `gear`
- Der Wert von `color` ist `Color.blue`
- Der Wert von `title` ist `"Einstellungen"`

Daher zeigt `Image(systemName: icon)` innerhalb der View ein Zahnrad-Symbol an, `.background(color)` verwendet einen blauen Hintergrund, und `Text(title)` zeigt `Einstellungen` an.

Vollständiger Code:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Ordner")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/028_view.png)

Man sieht: Nach der Kapselung ist der Anzeigeeffekt derselbe wie vorher, aber der Code ist klarer geworden.

Ursprünglich musste jeder Einstellungseintrag einen ganzen Abschnitt `HStack` schreiben. Jetzt reicht eine Codezeile:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")
```

Das ist die Aufgabe benutzerdefinierter Views: **Wiederholte View-Strukturen werden gekapselt, und nur die unterschiedlichen Inhalte werden als Parameter übergeben.**

## Warum Parameter übergeben werden können

Als Nächstes verstehen wir kurz, warum benutzerdefinierte Views Parameter übergeben können.

In SwiftUI ist eine View im Kern eine Struktur.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

Hier ist `ContentView` eine Struktur.

Wenn wir schreiben:

```swift
ContentView()
```

erstellen wir eigentlich eine `ContentView`-View.

Die nachfolgenden `()` bedeuten, dass ihre Initialisierungsmethode aufgerufen wird. Man kann es auch als Erstellen dieser View verstehen.

Da diese `ContentView` keine Eigenschaft hat, die von außen übergeben werden muss, kann man direkt schreiben:

```swift
ContentView()
```

Wenn eine View jedoch eine Eigenschaft ohne zugewiesenen Wert hat, muss beim Erstellen der View ein entsprechender Wert übergeben werden.

Zum Beispiel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("Name: \(name)")
    }
}
```

Hier ist `name` eine Eigenschaft und hat keinen Standardwert.

Deshalb muss beim Erstellen von `ContentView` ein konkreter Wert für `name` angegeben werden:

```swift
ContentView(name: "Fang Junyu")
```

So kann dieser Wert innerhalb der View verwendet werden:

```swift
Text("Name: \(name)")
```

Das ist auch der Grund, warum wir beim Erstellen von `SettingItemView` Parameter übergeben müssen:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")
```

Denn `SettingItemView` hat drei Eigenschaften ohne Standardwert:

```swift
let icon: String
let color: Color
let title: String
```

Deshalb müssen sie beim Erstellen dieser View übergeben werden. Die übergebenen Parameter werden von Swift verwendet, um den Eigenschaften innerhalb der View Werte zuzuweisen.

## Initialisierungsmethode

Als Nächstes verstehen wir die Initialisierungsmethode noch etwas genauer.

### Standard-Initialisierungsmethode

Wenn wir eine gewöhnliche View definieren:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

In diesem Code haben wir keine Initialisierungsmethode manuell geschrieben.

Wenn wir diese View verwenden, können wir aber so schreiben:

```swift
ContentView()
```

Die `()` bedeuten hier eigentlich, dass `ContentView` erstellt wird. Man kann es auch als Aufruf ihrer Initialisierungsmethode verstehen.

### Warum kann sie aufgerufen werden, obwohl es keine Initialisierungsmethode gibt?

Weil der Swift-Compiler automatisch eine Initialisierungsmethode für uns erzeugt.

Wichtig ist: **Diese Initialisierungsmethode wird automatisch erzeugt. Normalerweise sehen wir sie im Code nicht direkt.**

Das heißt: Obwohl wir im `struct` nicht manuell Folgendes geschrieben haben:

```swift
init() {

}
```

erzeugt der Swift-Compiler im Hintergrund dennoch eine ähnliche Initialisierungsmethode für uns:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

Das ist der Grund, warum wir direkt schreiben können:

```swift
ContentView()
```

Daher müssen wir in tatsächlichem Code die Initialisierungsmethode normalerweise nicht manuell ausschreiben.

Wir müssen nur einen Punkt verstehen: **Wenn eine SwiftUI-View erstellt wird, wird die Initialisierungsmethode der View aufgerufen. Selbst wenn wir keine Initialisierungsmethode manuell schreiben, kann Swift sie automatisch für uns erzeugen.**

### Initialisierungsmethode mit Parametern

Wenn eine View eine Eigenschaft ohne Standardwert enthält, zum Beispiel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("Name: \(name)")
    }
}
```

erzeugt der Swift-Compiler anhand der Eigenschaft automatisch eine Initialisierungsmethode mit Parametern.

Man kann es vereinfacht so verstehen:

```swift
init(name: String) {
    self.name = name
}
```

Hier bedeutet:

```swift
init(name: String)
```

Beim Erstellen von `ContentView` muss ein Parameter `name` vom Typ `String` übergeben werden.

Wenn wir schreiben:

```swift
ContentView(name: "Fang Junyu")
```

bedeutet das: `"Fang Junyu"` wird als Parameter an die Initialisierungsmethode übergeben.

Anschließend führt die Initialisierungsmethode intern Folgendes aus:

```swift
self.name = name
```

Diese Codezeile bedeutet: Der von außen übergebene `name` wird der eigenen Eigenschaft `name` der aktuellen View zugewiesen.

Vereinfacht kann man es so verstehen:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("Name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

So kann die View intern den übergebenen Wert verwenden.

Das ist der Initialisierungsablauf einer View mit Parametern: **Wenn Eigenschaften innerhalb der View keinen Standardwert haben, müssen beim Erstellen der View entsprechende Parameter übergeben werden, damit die Initialisierungsmethode die Zuweisung der Eigenschaften abschließen kann.**

## Wenn Eigenschaften Standardwerte haben

Wenn eine Eigenschaft bereits einen Standardwert hat, kann man beim Erstellen der View auf die Übergabe des Parameters verzichten.

Zum Beispiel:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("Name: \(name)")
    }
}
```

Hier hat `name` bereits einen Standardwert:

```swift
"Fang Junyu"
```

Deshalb kann man beim Erstellen von `ContentView` direkt schreiben:

```swift
ContentView()
```

In diesem Fall verwendet `name` den Standardwert, und die Oberfläche zeigt:

```swift
Name: Fang Junyu
```

Natürlich kann man beim Erstellen der View auch einen neuen Wert übergeben:

```swift
ContentView(name: "Sam")
```

In diesem Fall verwendet die View das von außen übergebene `"Sam"` anstelle des Standardwerts, und die Oberfläche zeigt:

```swift
Name: Sam
```

Zum leichteren Verständnis kann man die vom Swift-Compiler automatisch erzeugte Initialisierungsmethode vereinfacht so sehen:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Hier bedeutet `name: String = "Fang Junyu"`: Wenn beim Erstellen der View kein `name` übergeben wird, wird der Standardwert `"Fang Junyu"` verwendet; wenn beim Erstellen der View ein neuer `name` übergeben wird, wird der übergebene Wert verwendet.

Das heißt: **Wenn von außen kein Parameter übergeben wird, wird der Standardwert der Eigenschaft verwendet; wenn von außen ein Parameter übergeben wird, wird der übergebene Wert verwendet.**

## Zurück zu SettingItemView

Jetzt schauen wir uns noch einmal SettingItemView an:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Die Struktur dieser View ist fest.

Zu den festen Teilen gehören:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Zu den unterschiedlichen Teilen gehören:

```swift
icon
color
title
```

Deshalb machen wir die unterschiedlichen Inhalte zu Eigenschaften und übergeben sie beim Erstellen der View als Parameter.

Wenn wir unterschiedliche Einstellungseinträge erstellen, müssen wir nur unterschiedliche Parameter übergeben:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")
SettingItemView(icon: "folder", color: Color.brown, title: "Ordner")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
```

So kann dieselbe `SettingItemView` drei verschiedene Einstellungseinträge anzeigen.

Das ist die häufigste Verwendung benutzerdefinierter Views.

## Zusammenfassung

In dieser Lektion haben wir benutzerdefinierte Views gelernt.

Die Kernaufgabe benutzerdefinierter Views lautet: **Wiederholten View-Code kapseln, damit er wiederverwendet werden kann.**

In diesem Beispiel ist die Struktur der drei Einstellungseinträge gleich, nur Symbol, Farbe und Titel unterscheiden sich.

Deshalb haben wir eine `SettingItemView` erstellt:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Anschließend übergeben wir beim Verwenden dieser View unterschiedliche Parameter:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Einstellungen")
```

Die Parameter hier gelangen in das Innere von `SettingItemView`.

Auf diese Weise können wir mit weniger Code Views erstellen, die dieselbe Struktur, aber unterschiedliche Inhalte haben.

Das ist auch eine sehr häufige Schreibweise in der SwiftUI-Entwicklung.
