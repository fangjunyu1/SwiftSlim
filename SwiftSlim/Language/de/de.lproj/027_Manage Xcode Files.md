# Xcode-Dateien verwalten

In dieser Lektion lernen wir häufige Dateioperationen in Xcode kennen.

In den vorherigen Lektionen haben wir den größten Teil des Codes in `ContentView` geschrieben. So lassen sich Code und Anzeigeeffekt leichter beobachten.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

In einer echten App wird jedoch normalerweise nicht der gesamte Code in eine einzige Datei geschrieben.

Wenn Seiten, Komponenten und Funktionen immer mehr werden, müssen wir verschiedene Views in unterschiedliche SwiftUI-Dateien aufteilen.

Zum Beispiel:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

So wird die Codestruktur klarer, und die spätere Wartung und Änderung wird einfacher.

## Warum Dateien verwalten

In SwiftUI kann eine Seite oder eine Komponente normalerweise als eigene View-Datei geschrieben werden.

Zum Beispiel:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

`CardView` ist hier eine SwiftUI-View.

Wenn alle Views in `ContentView` geschrieben werden, wird der Code immer länger und immer schwerer lesbar.

Deshalb müssen wir lernen, Dateien zu erstellen, umzubenennen und zu löschen sowie Ordner zu verwenden, um verschiedene Codedateien zu verwalten.

## SwiftUI-Datei erstellen

In Xcode gibt es normalerweise zwei gängige Möglichkeiten, eine SwiftUI-Datei zu erstellen:

Die eine Möglichkeit ist, eine leere Datei zu erstellen und den Code selbst zu schreiben.

Die andere Möglichkeit ist, eine SwiftUI-Vorlagendatei zu erstellen, bei der Xcode den grundlegenden Code automatisch generiert.

Für Anfänger ist eine SwiftUI-Vorlagendatei eher zu empfehlen, weil sie die Grundstruktur automatisch erzeugt.

### Leere Datei erstellen

Klicke im Navigator-Bereich auf der linken Seite von Xcode mit der rechten Maustaste auf eine leere Stelle oder auf einen Ordner, und wähle `New Empty File`.

Die Position dafür sieht wie folgt aus:

![xcode](../../../Resource/027_view1.png)

Nach dem Erstellen einer leeren Datei erzeugt Xcode normalerweise eine unbenannte Swift-Datei, zum Beispiel `Untitled.swift`.

Wir können sie in `TestView.swift` umbenennen.

Wenn diese Datei in einem SwiftUI-Projekt zur Anzeige einer View verwendet wird, empfiehlt es sich normalerweise, am Ende des Namens `View` hinzuzufügen.

Zum Beispiel:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Das ist keine zwingende Regel, aber so erkennt man auf einen Blick, dass es sich um eine View-Datei handelt.

Nach dem Erstellen einer leeren Datei enthält sie möglicherweise nur Standardkommentare oder ist komplett leer. Das hängt von der Xcode-Version und der Erstellungsweise ab.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Jetzt müssen wir den SwiftUI-Code manuell schreiben:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Damit ist eine einfache SwiftUI-View-Datei erstellt.

### Datei umbenennen

Wenn du nach dem Erstellen einer Datei ihren Namen ändern möchtest, kannst du die Datei im Navigator-Bereich auf der linken Seite von Xcode auswählen und dann die Eingabetaste `⏎` drücken.

![xcode](../../../Resource/027_view2.png)

So lässt sich der Dateiname ändern.

Wichtig ist: Wenn du den Dateinamen änderst, wird der View-Name im Code nicht automatisch geändert.

Wenn der Dateiname zum Beispiel in `ProfileView.swift` geändert wurde, kann im Code trotzdem noch `struct TestView: View` stehen.

Das führt nicht unbedingt zu einem Fehler, kann aber leicht verwirren.

Deshalb empfiehlt es sich, Dateiname und View-Name konsistent zu halten. Wenn der Dateiname zum Beispiel `ProfileView.swift` ist, sollte auch der View-Name `ProfileView` verwendet werden.

## SwiftUI-Vorlagendatei erstellen

Neben einer leeren Datei können wir auch direkt eine SwiftUI-Vorlagendatei erstellen.

Klicke im Navigator-Bereich auf der linken Seite von Xcode mit der rechten Maustaste auf eine leere Stelle oder auf einen Ordner, und wähle `New File from Template...`.

Die Position dafür sieht wie folgt aus:

![xcode](../../../Resource/027_view3.png)

Im eingeblendeten Fenster kannst du oben verschiedene Plattformen auswählen, zum Beispiel `iOS`, `macOS` und andere.

Hier behalten wir einfach die Plattform bei, die zum aktuellen Projekt passt. Wenn wir zum Beispiel eine iOS-App erstellen, wählen wir `iOS`.

![xcode](../../../Resource/027_view4.png)

Wähle anschließend unten `SwiftUI View` aus.

![xcode](../../../Resource/027_view12.png)

Klicke dann auf `Next`, gib einen Dateinamen ein und speichere die Datei.

Zum Beispiel erstellen wir eine Datei `Test2View.swift`.

Xcode generiert automatisch Code, der etwa so aussieht:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Im Vergleich zu einer leeren Datei enthält die Vorlagendatei automatisch `import SwiftUI`, `struct`, `body` und `#Preview`.

Für Anfänger ist die SwiftUI-Vorlagendatei deshalb einfacher zu verwenden, und es ist weniger wahrscheinlich, dass Code vergessen wird.

**Hinweis**: Neben dem Erstellen per Rechtsklick kannst du auch auf die Plus-Schaltfläche unten im Navigator-Bereich auf der linken Seite von Xcode klicken, um Dateien oder Ordner zu erstellen.

![xcode](../../../Resource/027_view5.png)

## Ordner erstellen

Wenn es immer mehr Dateien gibt, können wir Ordner zur Verwaltung verwenden.

Klicke im Navigator-Bereich auf der linken Seite von Xcode mit der rechten Maustaste auf eine leere Stelle oder auf einen Ordner, und wähle `New Folder`.

Nach dem Erstellen eines Ordners kannst du zusammengehörige Dateien in den Ordner ziehen.

![xcode](../../../Resource/027_view7.png)

Ordner dienen hauptsächlich dazu, die Projektstruktur zu organisieren. Sie ändern nicht die Art und Weise, wie eine View selbst verwendet wird.

Solange der View-Name korrekt ist, kann sie in anderen Dateien weiterhin mit `TestView()` oder `Test2View()` verwendet werden.

## Datei oder Ordner löschen

Wenn du eine Datei oder einen Ordner löschen möchtest, kannst du die entsprechende Datei im Navigator-Bereich auf der linken Seite von Xcode auswählen, mit der rechten Maustaste klicken und `Delete` wählen.

Du kannst auch die Datei auswählen und anschließend die Löschtaste `⌫` drücken.

Xcode zeigt ein Bestätigungsfenster zum Löschen an.

![xcode](../../../Resource/027_view10.png)

Wenn du `Move to Trash` auswählst, wird die Datei in den Papierkorb verschoben.

Wenn du `Remove Reference` siehst, bedeutet das, dass nur die Referenz aus dem Xcode-Projekt entfernt wird, die Originaldatei auf der Festplatte aber nicht gelöscht wird.

Für Anfänger gilt: Wenn du nur eine gewöhnliche Datei löschen möchtest, die du gerade selbst erstellt hast, reicht normalerweise `Move to Trash`.

## Mehrere SwiftUI-Views anzeigen

Nachdem wir gelernt haben, Dateien zu erstellen, können wir verschiedene Views in unterschiedliche Dateien aufteilen.

Zum Beispiel erstellen wir zwei SwiftUI-Dateien:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` wird verwendet, um den Namen des Autors anzuzeigen:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` wird verwendet, um den Kartenhintergrund anzuzeigen:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Danach können wir diese beiden Views in `ContentView` verwenden:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Nach dem Ausführen sehen wir, dass `CardView` und `AuthorView` gemeinsam kombiniert angezeigt werden:

![xcode](../../../Resource/027_view11.png)

In diesem Effekt dient `CardView` als Hintergrund, und `AuthorView` wird darüber angezeigt. Das liegt daran, dass beide in einem `ZStack` platziert wurden.

In `ContentView` verwenden wir diese beiden Views über `CardView()` und `AuthorView()`. Die `()` hinter dem Namen bedeuten, dass diese View erstellt und verwendet wird.

Das ist eine häufige View-Verschachtelung in SwiftUI: In einer View können weitere Views verwendet werden.

## Einstiegspunktdatei

Zum Schluss schauen wir noch einmal, wo die App mit der Anzeige der Oberfläche beginnt.

In einem SwiftUI-Projekt gibt es normalerweise eine Einstiegspunktdatei:

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

`@main` bedeutet hier, dass dies der Einstiegspunkt der App ist.

In `WindowGroup` sehen wir:

```swift
ContentView()
```

Das bedeutet, dass nach dem Start der App zuerst `ContentView` angezeigt wird.

Anschließend zeigt `ContentView` wiederum Folgendes an:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Die View-Hierarchie kann also so verstanden werden:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Wenn wir die in der Einstiegspunktdatei angezeigte View in `CardView` ändern:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Dann zeigt die App nach dem Start nur `CardView` an.

Mit anderen Worten: `WindowGroup` im Einstiegscode entscheidet, welche View nach dem Start der App zuerst angezeigt wird.

Innerhalb dieser View können wiederum weitere Views angezeigt werden.

## Zusammenfassung

In dieser Lektion haben wir häufige Dateioperationen in Xcode gelernt.

Wir haben erfahren, wie man SwiftUI-Dateien erstellt, Dateien umbenennt, Ordner erstellt und Dateien löscht.

Gleichzeitig haben wir ein wichtiges Konzept gelernt: SwiftUI-Views können in verschiedene Dateien aufgeteilt und anschließend in anderen Views verwendet werden.

Zum Beispiel:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Hier werden `CardView()` und `AuthorView()` als andere Views in `ContentView` verwendet.

Zum Schluss haben wir auch die Anzeigelogik der Einstiegspunktdatei wiederholt.

Wenn die App startet, wird zuerst der mit `@main` markierte Einstiegscode betreten, anschließend wird die View in `WindowGroup` angezeigt.

Das hilft uns zu verstehen: Verschiedene SwiftUI-Dateien sind nicht voneinander isoliert. Sie können miteinander kombiniert werden und am Ende gemeinsam die vollständige App-Oberfläche bilden.
