# Der Lebenszyklus von SwiftUI-Views

In der letzten Lektion haben wir gesehen, dass `@State`-Variablen dem Lebenszyklus einer View folgen, und wir haben die grundlegende Verwendung von `onAppear` kennengelernt.

In dieser Lektion bauen wir dieses Verständnis weiter aus: Wir sehen uns an, wie SwiftUI-Views erstellt und angezeigt werden, wie Variablen innerhalb einer View erstellt und neu erzeugt werden und lernen `onAppear`, `onDisappear` sowie den Konstruktor `init` kennen.

Auf dieser Grundlage entwickeln wir ein Gesamtverständnis dafür, wie der Aufbauprozess einer SwiftUI-View funktioniert.

## Startreihenfolge der App

Wenn du ein iOS-Projekt erstellst, erzeugt Xcode standardmäßig zwei Dateien:

```text
ContentView.swift
Projektname + App.swift
```

Die Datei `"Projektname + App".swift` ist der Einstiegspunkt der gesamten App.

Zum Beispiel:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Ablauf der Codeausführung

Wenn wir die App starten, im Simulator oder auf einem echten Gerät, sucht das System nach dem Schlüsselwort `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Nachdem die Einstiegsdatei gefunden wurde, beginnt die Ausführung des Codes.

Zuerst wird die `App`-Struktur betreten und der Code in `body` ausgeführt. Danach wird die `WindowGroup` erstellt und die darin enthaltene `ContentView` geladen.

### Die Aufgabe von WindowGroup

`WindowGroup` dient zur Verwaltung von Fenstern:

```swift
WindowGroup {
    ContentView()
}
```

Auf iPad und macOS kann das System mehrere Fenster unterstützen, während auf dem iPhone normalerweise nur ein Fenster vorhanden ist.

Deshalb verwaltet `WindowGroup` auf dem iPhone im Wesentlichen den ersten angezeigten Bildschirm.

### Der Ladevorgang einer View

Sobald das System `ContentView` gefunden hat:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

führt SwiftUI den Code in `body` aus, baut aus der zurückgegebenen View-Struktur wie `VStack` oder `Text` die Oberfläche zusammen und zeigt sie auf dem Bildschirm an.

Wenn diese Schritte abgeschlossen sind, sehen wir `ContentView` in der View.

![ContentView](../../Resource/016_view1.png)

Wichtig ist: Die Aufgabe von `body` ist es, eine View zu erzeugen, nicht sie zu speichern.

Das bedeutet, dass SwiftUI bei jeder Aktualisierung der View `body` neu berechnet und daraus eine neue View-Struktur erzeugt.

### Die Logik der Vorschauansicht

Die Xcode-Vorschau im Canvas und die echte Ausführung der App sind zwei unterschiedliche Mechanismen.

Zum Beispiel, wenn wir in der Einstiegsdatei eine Debug-Ausgabe ergänzen:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Wenn du `ContentView` in Xcode nur in der Vorschau betrachtest, beginnt die Ausführung nicht beim `@main`-Einstiegspunkt. Deshalb wird `onAppear` in der Einstiegsdatei dort nicht ausgelöst.

Wenn du die App jedoch im Simulator oder auf einem physischen Gerät ausführst, startet das System bei `@main`, durchläuft den vollständigen App-Ablauf und löst dabei auch das `onAppear` am Einstiegspunkt aus.

Der entscheidende Punkt ist: Die Xcode-Vorschau rendert nur lokal einen Ausschnitt der View. Simulator und physisches Gerät stellen dagegen eine vollständige Laufzeitumgebung bereit und führen die gesamte App aus.

Deshalb sollte man sich bei Funktionstests auf Simulator oder physische Geräte verlassen. Die Xcode-Vorschau kann keine komplette Laufzeitumgebung ersetzen.

## Der Lebenszyklus einer View

Im aktuellen Lernstand liegt unser gesamter Code in `ContentView`. In echten Apps gibt es aber normalerweise mehrere Views, zwischen denen in unterschiedlichen Situationen gewechselt wird.

Zum Beispiel im Sparschwein:

![PiggyBank](../../Resource/016_view.png)

Wenn auf "Sparen" getippt wird, erscheint eine `SaveView`. Wenn der Sparvorgang abgeschlossen ist oder die Ansicht geschlossen wird, wird `SaveView` wieder entfernt.

Genau dieser Prozess ist der Lebenszyklus einer View: Die View wird erstellt, angezeigt und schließlich wieder entfernt.

### Die App schließen

Wenn die App geschlossen wird, werden alle Views entfernt, und auch die zugehörigen Zustände verschwinden.

Deshalb werden `ContentView` und alle anderen Views aus dem Speicher entfernt, und der gesamte Laufzustand der App wird gelöscht.

## Der Lebenszyklus von Variablen in einer View

In SwiftUI ist die Lebensdauer von Variablen häufig an die Lebensdauer der View gebunden.

Zum Beispiel:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### @State-Variablen

Eine mit `@State` deklarierte Variable ist an den Lebenszyklus der View gebunden.

```swift
@State private var name = "FangJunyu"
```

Wenn die View erstellt wird, wird auch `name` erzeugt. Wenn die View entfernt wird, wird auch `name` zerstört.

Das ist einer der Gründe, warum für dauerhafte Daten Speicherung über Dinge wie `UserDefaults` nötig ist.

### Variablen innerhalb von body

Eine Variable, die in `body` definiert wird:

```swift
var num = 10
```

ist an die Ausführung von `body` gebunden.

Wenn sich in SwiftUI ein Zustand verändert, zum Beispiel:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

und `name` dadurch einen neuen Wert erhält, erkennt `@State` diese Veränderung und SwiftUI berechnet die View neu.

Wenn `body` neu berechnet wird, wird auch der gesamte Code in `body` erneut ausgeführt. Variablen innerhalb von `body`, wie `num`, werden dann wieder neu erzeugt.

Deshalb wird nicht empfohlen, komplexe Variablen direkt in `body` zu definieren.

Denn bei jeder Aktualisierung der View werden diese Variablen erneut erstellt, was zusätzlichen Rechenaufwand verursacht und sich negativ auf die Performance auswirken kann.

In SwiftUI sollten unterschiedliche Arten von Daten auch unterschiedlich verwaltet werden: Daten, die dem Lebenszyklus der View folgen sollen, speichert man typischerweise mit `@State`; temporäre Berechnungswerte können in `body` stehen.

## onAppear und onDisappear

In der letzten Lektion haben wir bereits `onAppear` kennengelernt. Es wird aufgerufen, wenn eine View sichtbar wird.

```swift
.onAppear {}
```

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Sowohl in der Xcode-Vorschau als auch bei der Ausführung kann man die Debug-Ausgabe von `onAppear` sehen.

### onDisappear

Das Gegenstück zu `onAppear` ist `onDisappear`:

```swift
.onDisappear {}
```

Wenn eine View geschlossen wird, wird `onDisappear` aufgerufen.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Wenn die View entfernt wird, wird der Code in `onDisappear` ausgeführt.

Hinweis: In unserem aktuellen Lernstand ist `ContentView` die Root-View der App und kann nicht direkt geschlossen oder entfernt werden. Deshalb lässt sich die Wirkung von `onDisappear` an dieser Stelle noch nicht direkt beobachten.

Erst später, wenn wir Navigation und das Öffnen weiterer Views lernen, können wir sehen, wie `onDisappear` tatsächlich ausgelöst wird.

## Erstellungs- und Anzeige-Logik

Wichtig ist, dass das Erstellen einer View und ihr Anzeigen zwei unterschiedliche Phasen sind.

Wenn eine View erstellt wird, wird der Konstruktor der `struct` aufgerufen:

```swift
init() {}
```

Da SwiftUI-Views `struct`-Typen sind:

```swift
struct ContentView: View { ... }
```

wird beim Erzeugen einer View-Instanz zunächst `init` ausgeführt. Erst wenn die View wirklich angezeigt wird, wird `onAppear` aufgerufen.

Zum Beispiel:

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
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Wenn diese View in Xcode in der Vorschau gerendert wird, kann man typischerweise eine Debug-Ausgabe wie diese sehen:

```swift
Create ContentView
Show ContentView
```

Das bedeutet: Zuerst wird `init` ausgeführt, also die View erstellt. Danach wird `body` berechnet, und schließlich wird die View angezeigt und `onAppear` aufgerufen.

Man muss also verstehen, dass Erstellung und Anzeige einer View getrennte Schritte sind.

### Der Konstruktor init

`init` ist ein grundlegendes Sprachmerkmal von Swift. Sowohl `struct` als auch `class` können ihn definieren, und er dient der Initialisierung von Objekten oder Werten.

```swift
init() {}
```

In SwiftUI wird beim Erstellen einer View ihr `init` aufgerufen. Er kann verwendet werden, um Parameter entgegenzunehmen oder Daten zu initialisieren.

Wenn kein eigener `init` geschrieben wird, erzeugt Swift für die `struct` automatisch einen Standardkonstruktor.

Für SwiftUI-Views wie `ContentView` gilt also: Beim Erstellen der View wird `init` ausgeführt, und beim Anzeigen wird `onAppear` aufgerufen.

Deshalb ist `init` der Konstruktor für die Erstellungsphase einer View und spielt später auch eine wichtige Rolle, wenn wir Parameter übergeben oder Daten initialisieren.

## Zusammenfassung

In dieser Lektion haben wir die Startreihenfolge einer App kennengelernt, also den Ausführungsweg von der Einstiegsdatei bis hin zu `ContentView`.

Wir haben den Lebenszyklus von SwiftUI-Views verstanden: Beim Erstellen einer View wird `init` ausgeführt, beim Erscheinen auf dem Bildschirm `onAppear`, und beim Entfernen oder Schließen `onDisappear`.

Außerdem haben wir die Aktualisierungsmechanik von Views betrachtet: Eine View wird durch Zustände gesteuert. Wenn sich `@State` oder ein anderer Zustand ändert, aktualisiert SwiftUI die View und berechnet `body` neu. Dabei werden auch Variablen in `body` erneut erzeugt.

Die Lebensdauer von Variablen kann also an die Lebensdauer einer View gebunden sein, während temporäre Werte in `body` bei jeder Aktualisierung neu entstehen.

Wenn wir diese Lebenszyklen und das Verhalten von Variablen verstehen, können wir unseren Code besser strukturieren und die Logik einer App klarer aufbauen.
