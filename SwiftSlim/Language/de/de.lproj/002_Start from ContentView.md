# Start mit ContentView

## Vorbereitung

In dieser Lektion beginnen wir mit der Datei `ContentView.swift` und lernen systematisch den grundlegenden Aufbau von SwiftUI kennen, darunter:

- Kommentare
- Die Struktur einer View
- `VStack` / `HStack` / `ZStack`-Layouts
- SF-Symbols-Icons
- View-Modifikatoren (modifier)
- Vorschaucode mit `#Preview`

Öffne zuerst das zuvor erstellte Xcode-Projekt per Doppelklick auf die `.xcodeproj`-Datei.

Wähle links im Navigator-Bereich die Datei `ContentView.swift` aus.

Hinweis: Jedes Mal, wenn du ein Projekt öffnest, kann im Canvas "Preview paused" angezeigt werden. Klicke dann auf die Aktualisieren-Schaltfläche, um die Vorschau wiederherzustellen.

![Swift](../../RESOURCE/002_view7.png)

## ContentView kennenlernen

Der Code von `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Obwohl der Code recht kurz ist, enthält er bereits die Kernstruktur von SwiftUI.

### 1. Kommentare

Am Anfang der Datei:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Das ist ein Dateikommentar. Er dient dazu, Informationen über die Datei festzuhalten, darunter Dateiname, Projektname, Ersteller und Erstellungszeitpunkt.

In Swift verwendet man `//` für einzeilige Kommentare:

```swift
// Das ist ein Kommentar
```

Kommentare verbessern die Lesbarkeit des Codes und helfen Entwicklerinnen und Entwicklern, die Logik leichter zu verstehen.

In der Praxis kann Code schnell schwer verständlich werden. Wenn man keine Kommentare schreibt, kommt leicht der Moment, in dem man schon nach drei Tagen den eigenen Code nicht mehr versteht.

Deshalb ist es eine gute Gewohnheit, beim Schreiben von Code aktiv Kommentare hinzuzufügen. Sie helfen dabei, die Logik festzuhalten und den Code später leichter zu warten.

**Code vorübergehend deaktivieren**

Kommentare können auch verwendet werden, um Code vorübergehend zu deaktivieren und Probleme zu untersuchen.

Zum Beispiel:

```text
A
B
C
```

A, B und C sind drei Codeabschnitte, und einer davon enthält einen Fehler. Dann können wir den Code vorübergehend auskommentieren, um die Ursache einzugrenzen.

Zuerst kommentieren wir A aus:

```text
// A
B
C
```

Wenn der Code danach wieder normal funktioniert, liegt das Problem in A.

Falls das Problem weiterhin besteht, können wir anschließend B auskommentieren und so weiter, bis wir die fehlerhafte Stelle gefunden haben.

Beim Entwickeln begegnen wir vielen Problemen, und oft ist das Auskommentieren von Code eine hilfreiche Methode, um die Ursache einzugrenzen. So können wir problematische Stellen und Bugs schneller finden.

In Xcode kannst du dafür die Tastenkombination verwenden:

```text
Command ⌘ + /
```

Damit lassen sich Kommentare schnell hinzufügen oder entfernen.

### 2. Das SwiftUI-Framework importieren

```swift
import SwiftUI
```

Diese Zeile bedeutet, dass das SwiftUI-Framework importiert wird.

Typen wie `View`, `Text`, `Image` oder `VStack` stammen alle aus diesem Framework.

Wenn du SwiftUI nicht importierst, zeigt Xcode einen Fehler an:

```text
Cannot find type 'View' in scope
```

Das bedeutet, dass der Compiler den Typ `View` nicht erkennen kann.

### 3. Die View-Struktur

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Wenn man diese View-Struktur zum ersten Mal sieht, wirkt sie vielleicht ungewohnt, weil sie Schlüsselwörter wie `struct`, `View`, `var`, `body` und `some` enthält.

Diese Schlüsselwörter haben wir noch nicht gelernt. Im Moment musst du nur wissen, dass dieser Code eine View mit dem Namen `ContentView` erstellt.

Du kannst dir eine View wie eine Zeichenfläche vorstellen, auf der wir etwas gestalten. Das Werkzeug dafür ist SwiftUI.

Zum Beispiel:

![Swift](../../RESOURCE/002_view.png)

Das Bild oben zeigt drei Seiten, und in Wirklichkeit sind das einfach drei verschiedene Views.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Wenn wir Apps mit SwiftUI entwickeln, ist jede Seite eine View.

### 4. SwiftUI-Code

Innerhalb der View sehen wir SwiftUI-Code:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Dieser SwiftUI-Code bedeutet, dass ein vertikales Layout angezeigt wird, das ein Icon und einen Text enthält.

![Swift](../../RESOURCE/002_view1.png)

#### VStack-Layout

```swift
VStack { }  // Vertikales Layout
```

`VStack` ist ein Container für vertikale Anordnung. Die enthaltenen Views werden von oben nach unten angeordnet.

![Swift](../../RESOURCE/002_view8.png)

Die drei häufigsten Layouts in SwiftUI sind:

- `VStack` — vertikale Anordnung
- `HStack` — horizontale Anordnung
- `ZStack` — überlagerte Anordnung (Z-Achse)

```swift
HStack { }  // Horizontale Anordnung
ZStack { }  // Überlagerte Anordnung
```

Die Anordnung der einzelnen Layouts sieht schematisch so aus:

![Swift](../../RESOURCE/002_view2.png)

Zum Beispiel mit `HStack` für eine horizontale Anordnung:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Man sieht, dass das Globus-Icon und der Text nun nebeneinander angezeigt werden.

![Swift](../../RESOURCE/002_view3.png)

Wenn wir eine horizontale Anordnung möchten, verwenden wir `HStack`. Wenn wir Views überlagern möchten, verwenden wir `ZStack`.

#### Image und SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Dieser Code zeigt ein Globus-Icon an. Das Icon stammt aus Apples SF-Symbols-System.

![Swift](../../RESOURCE/002_view9.png)

Der Code bedeutet: Zeige ein Globus-Icon in großer Größe und mit der Akzentfarbe an.

Neben dem Globus können wir natürlich auch andere Symbole anzeigen.

Zum Beispiel einen Rucksack:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Wie zeigt man andere Symbole an?**

Dazu verwenden wir Apples offizielle System-Symbolbibliothek SF Symbols.

Öffne die Apple-Developer-Website und lade [SF Symbols](https://developer.apple.com/sf-symbols/) herunter.

![Swift](../../RESOURCE/002_sf.png)

Öffne anschließend die SF-Symbols-App.

![Swift](../../RESOURCE/002_sf1.png)

Auf der linken Seite siehst du die Symbolkategorien, rechts die dazugehörigen Icons.

Wenn du mit der rechten Maustaste auf ein Symbol klickst und "Copy Name" auswählst, erhältst du den zugehörigen Zeichenkettennamen.

Zum Beispiel:

```text
"globe"
"backpack"
"heart"
```

Wenn du den kopierten Symbolnamen in `Image(systemName:)` einfügst, kannst du unterschiedliche Symbole anzeigen.

Hinweis: Jedes SF-Symbol hat eine minimale unterstützte Systemversion. Wenn die Systemversion zu alt ist, wird das Symbol möglicherweise nicht angezeigt. Die Kompatibilitätsinformationen kannst du in der SF-Symbols-App einsehen.

#### Modifikatoren

In SwiftUI ist ein Modifikator (`modifier`) eine Methode, mit der das Aussehen oder Verhalten einer View verändert wird.

Du kannst dir Modifikatoren wie Kleidung vorstellen: Wenn man unterschiedliche Kleidung anzieht, sieht man unterschiedlich aus.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` und `foregroundStyle` sind Modifikatoren der `Image`-View. Sie verändern die Darstellung der View, ohne ihren eigentlichen Inhalt zu ändern.

**1. imageScale**

```swift
.imageScale(.large)
```

Damit kann die Größe von SF-Symbols-Icons gesteuert werden:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Du kannst verschiedene Optionen ausprobieren, damit die SF-Symbole in unterschiedlichen Größen angezeigt werden.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` steuert die Vordergrundfarbe.

`.tint` bedeutet die aktuelle Akzentfarbe der Umgebung. Standardmäßig ist sie unter iOS blau.

Wenn wir die Vordergrundfarbe zum Beispiel auf Rot ändern möchten:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Die Text-View

`Text` ist eine Text-View und dient dazu, Zeichenketten anzuzeigen.

```swift
Text("Hello, world!")
```

Zum Beispiel, um meinen Namen anzuzeigen:

```swift
Text("FangJunyu")
```

Hinweis: Zeichenketten müssen immer in doppelte Anführungszeichen `""` gesetzt werden.

Du kannst versuchen, deinen eigenen Namen, eine Telefonnummer oder andere Inhalte anzuzeigen.

#### padding-Abstand

In SwiftUI wird `padding` verwendet, um zwischen dem Inhalt einer View und ihrem Rand zusätzlichen Leerraum einzufügen. Es entspricht dem Innenabstand (`padding` / `content inset`).

```swift
HStack {
    ...
}
.padding()
```

Der obige Code bedeutet, dass der `HStack`-View der vom System empfohlene Standardabstand hinzugefügt wird.

**Was ist padding?**

`padding` bezeichnet den Leerraum zwischen dem Inhalt einer View und ihrem Rand.

Im folgenden Bild erhält der blaue `HStack` ein `padding`. Dadurch zieht sich der blaue Bereich nach innen zusammen und wirkt optisch etwas kleiner.

![Swift](../../RESOURCE/002_view6.png)

**Standardabstand**

Der Modifikator `padding()` verwendet standardmäßig den vom System empfohlenen Standardabstand.

```swift
.padding()
```

Dieser Wert kann je nach Plattform und Kontext unterschiedlich sein, zum Beispiel:

- Unter iOS meist ungefähr 16 pt
- Unter macOS oder watchOS kann der Standardabstand anders sein, oft etwas größer oder kleiner, je nach Designrichtlinien der Plattform

**Benutzerdefinierter Abstand**

Man kann auch gezielt für einzelne Seiten Abstände setzen.

1. Einen einzelnen Rand setzen

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Richtungen:

- `.top`: oberer Abstand
- `.bottom`: unterer Abstand
- `.leading`: vorderer Abstand
- `.trailing`: hinterer Abstand

![Swift](../../RESOURCE/002_view12.png)

Hinweis: `leading` und `trailing` passen sich automatisch an die Schreibrichtung einer Sprache an. In einer arabischen RTL-Umgebung werden sie zum Beispiel automatisch gespiegelt.

2. Mehrere Richtungen gleichzeitig setzen

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Über ein Array können mehrere Richtungen gleichzeitig angegeben werden. Die genaue Verwendung von Arrays behandeln wir später ausführlicher. Hier reicht es, diese Schreibweise zunächst kennenzulernen.

3. Horizontalen oder vertikalen Abstand setzen

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Das entspricht:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Abstand entfernen**

Wenn du gar keinen Abstand möchtest, kannst du ihn mit `.padding(0)` entfernen:

```swift
.padding(0)
```

Oder du löschst den `padding`-Modifikator direkt:

```swift
// .padding()
```

### 6. Preview-Vorschaucode

```swift
#Preview {
    ContentView()
}
```

Dieser Code bedeutet, dass im Canvas eine Vorschau von `ContentView` erzeugt wird.

Hinweis: `#Preview` ist eine neue Syntax, die mit Swift 5.9 und Xcode 15 eingeführt wurde. Zuvor verwendete man dafür eine `PreviewProvider`-Struktur.

**Was passiert, wenn man Preview auskommentiert?**

Wenn du `Preview` auskommentierst:

```swift
// #Preview {
//    ContentView()
// }
```

dann zeigt der Canvas keinen renderbaren Inhalt mehr an.

![Swift](../../RESOURCE/002_xcode.png)

So steuert `#Preview`, ob im Canvas eine Vorschau-View angezeigt wird.

Wenn wir SwiftUI-Views in Xcode in der Vorschau sehen möchten, fügen wir `#Preview` hinzu. Wenn wir keine Vorschau benötigen, können wir den `#Preview`-Code auskommentieren oder löschen.

## Zusammenfassung

Obwohl die Datei `ContentView.swift` nicht viel Code enthält, deckt sie in Wirklichkeit schon mehrere zentrale Konzepte von SwiftUI ab. Für Anfänger wirkt dieser Code vielleicht zunächst fremd, aber wenn man ihn in einzelne Teile zerlegt, kann man sich ein erstes Verständnis für SwiftUI aufbauen.

Rückblickend haben wir in dieser Lektion zuerst `//`-Kommentare kennengelernt. Mit ihnen kann man Codelogik erklären oder Code vorübergehend deaktivieren.

Danach haben wir gesehen, dass eine SwiftUI-Datei unbedingt das SwiftUI-Framework importieren muss:

```swift
import SwiftUI
```

Ohne diesen Import kann der Compiler Typen wie `View` nicht erkennen.

Dann haben wir den grundlegenden Aufbau einer SwiftUI-View kennengelernt:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Dabei ist `ContentView` der Name der View.

Außerdem haben wir drei häufige Layout-Container kennengelernt: `VStack` (vertikal), `HStack` (horizontal) und `ZStack` (überlagernd).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Dieser Code bedeutet, dass ein vertikaler Container angezeigt wird, in dem ein Icon und ein Text enthalten sind.

`Image` kann SF-Symbols-Icons anzeigen, und mit Modifikatoren lassen sich Größe und Farbe steuern.

Die `Text`-View kann Textinhalte anzeigen.

`padding` steht für Abstand und fügt rund um die View transparenten Raum hinzu.

Zum Schluss haben wir die Vorschau-View `#Preview` kennengelernt, mit der sich die Vorschau im Canvas anzeigen lässt.

### Übungen nach der Lektion

Für Anfänger kann der Inhalt dieser Lektion noch etwas komplex wirken. Mit zusätzlichen Übungen lässt sich das Gelernte besser vertiefen:

- Den Namen eines SF-Symbols ändern
- Die Vordergrundfarbe des Symbols auf Schwarz ändern
- `VStack` in `HStack` umwandeln
- `Image` oder `Text` auskommentieren und beobachten, wie sich die Vorschau verändert

### Bonus: Code Completion

Beim Eingeben von Code ist dir vielleicht schon aufgefallen, dass Xcode automatisch eine Liste verfügbarer Optionen anzeigt.

Zum Beispiel, wenn wir den `imageScale`-Modifikator verändern:

```swift
.imageScale(.)
```

Dann zeigt Xcode die verfügbaren Optionen an:

![Swift](../../RESOURCE/002_view10.png)

Das gehört zur Code Completion. Sie basiert auf Typinferenz und Vorschlägen für Enum-Mitglieder und hilft dabei, schneller zu schreiben und Fehler zu vermeiden.

In späteren Lektionen werden wir Enums (`enum`) offiziell einführen. Im Moment genügt es, dieses Konzept erst einmal grob kennenzulernen.
