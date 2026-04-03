# Fill-Light-App

In dieser Lektion erstellen wir eine sehr interessante Fill-Light-App. Wenn es Nacht wird, können wir den Bildschirm des Telefons verschiedene Farben anzeigen lassen und ihn als einfaches Fill Light verwenden.

Diese Fill-Light-App kann durch Tippen auf den Bildschirm die Farben wechseln und die Helligkeit mit einem Schieberegler anpassen.

In diesem Beispiel lernen wir, wie man `brightness` zum Anpassen der Helligkeit einer View verwendet, `onTapGesture` zum Hinzufügen einer Tippgeste zu einer View und das Steuerelement `Slider`.

Ergebnis:

![Color](../../Resource/018_color.png)

## Eine Farbe anzeigen

Zuerst lassen wir die View eine Farbe anzeigen.

In SwiftUI steht `Color` nicht nur für eine Farbe, sondern kann auch als View angezeigt werden:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Hier steht `Color.red` für eine rote View. `.ignoresSafeArea()` sorgt dafür, dass die Farb-View den gesamten Bildschirm ausfüllt, sodass sie mehr wie ein echter Fill-Light-Effekt aussieht.

Ergebnis:

![Color](../../Resource/018_color1.png)

### Farbarray und Index

Im Moment wird nur eine Farbe angezeigt. Ein Fill Light hat aber normalerweise mehr als nur eine Farbe. Es kann auch Blau, Gelb, Lila, Weiß und andere Farben anzeigen.

Wir möchten beim Tippen auf den Bildschirm zwischen verschiedenen Farben wechseln. Diese Farben können wir in ein Array legen und gemeinsam verwalten:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Ein Array eignet sich zum Speichern "einer Gruppe von Daten desselben Typs". Hier ist jedes Element im Array ein `Color`.

Wenn wir eine bestimmte Farbe anzeigen möchten, können wir einen Index verwenden:

```swift
colors[0]
```

Das bedeutet, dass die Farbe mit dem Index `0` im Array gelesen wird, also die erste Farbe.

Jetzt kann der Code so geschrieben werden:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Auf diese Weise zeigt der Bildschirm die erste Farbe im Array an, also Rot.

### Den Index zur Steuerung der Farbe verwenden

Wenn wir zwischen verschiedenen Farben wechseln möchten, brauchen wir eine Variable, die den Index verwaltet, anstatt den Index fest einzutragen.

Wir können `@State` verwenden, um eine Variable zu deklarieren, die den Index speichert:

```swift
@State private var index = 0
```

Hier steht `index` für den Index der aktuellen Farbe.

Wenn sich `index` ändert, berechnet SwiftUI die Oberfläche neu und aktualisiert den angezeigten Inhalt.

Dann ändern wir das ursprüngliche `colors[0]` zu:

```swift
colors[index]
```

Auf diese Weise wird die in der View angezeigte Farbe durch `index` bestimmt.

Nun wird der Code zu:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Wenn sich `index` ändert, zeigt `colors[index]` ebenfalls eine andere Farbe an.

Zum Beispiel:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Wichtig ist, dass `index` den größten Index des Arrays nicht überschreiten darf, sonst entsteht ein Fehler wegen eines Indexes außerhalb des gültigen Bereichs.

## Tippgeste

Jetzt können wir je nach `index` verschiedene Farben anzeigen, aber wir können noch nicht durch Tippen wechseln.

In der vorherigen Lektion "Zitat-Karussell" haben wir `Button` verwendet, um den Wechsel der Zitate zu steuern.

Diesmal möchten wir aber "auf den gesamten Farbbereich tippen", um die Farbe zu wechseln, daher ist `onTapGesture` besser geeignet.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Wenn wir auf die Farb-View tippen, wird dieser Code ausgeführt:

```swift
index += 1
```

Das bedeutet, dass `index` um `1` erhöht wird. Nachdem der Index erhöht wurde, zeigt `colors[index]` die nächste Farbe im Array an.

### `onTapGesture`

`onTapGesture` ist ein Gesten-Modifikator, der einer View eine Tippaktion hinzufügt.

Grundlegende Verwendung:

```swift
.onTapGesture {
    // code
}
```

Zum Beispiel:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Wenn auf diese rote View getippt wird, wird der Code in den geschweiften Klammern ausgeführt, und in der Konsole erscheint:

```swift
Click color
```

Mit `onTapGesture` können wir festlegen, was nach dem Tippen auf eine View passiert.

### Unterschied zu `Button`

Vorher haben wir die View `Button` kennengelernt. Sowohl `Button` als auch `onTapGesture` können Tippaktionen verarbeiten, aber ihre Einsatzszenarien sind nicht völlig gleich.

`onTapGesture` eignet sich eher dafür, "einer vorhandenen View eine Tippfunktion hinzuzufügen", zum Beispiel `Color`, `Image`, `Text` oder einer anderen normalen View.

`Button` eignet sich eher dann, wenn ein klarer Button dargestellt werden soll, etwa "Bestätigen", "Senden" oder "Löschen".

In dieser Fill-Light-App möchten wir, dass der Farbwechsel einfacher ist. Wenn der gesamte Farbbereich per Tippen die Farbe wechselt, ist `onTapGesture` hier eine gute Wahl.

## Das Indexproblem

Jetzt können wir durch Tippen auf den Bildschirm zwischen verschiedenen Farben wechseln.

Aber hier gibt es ein wichtiges Problem: **der Index kann den Bereich des Arrays überschreiten**.

Zum Beispiel:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Wenn wir immer weiter auf den Bildschirm tippen, wird `index` irgendwann zu `4`, und dann tritt ein Fehler vom Typ "index out of range" auf.

Das liegt daran, dass das Array `colors` `4` Elemente hat, die Indizierung aber bei `0` beginnt. Daher ist der gültige Indexbereich `0 - 3` und nicht `4`.

Wenn wir auf `colors[4]` zugreifen, entsteht ein Fehler vom Typ "index out of range".

Im aktuellen Code erhöht jedes Tippen `index` um `1`. Wenn wir das nicht behandeln, wird der gültige Bereich am Ende sicher überschritten.

Deshalb müssen wir beim Tippen auf den Bildschirm den Index prüfen: Wenn bereits die letzte Farbe erreicht ist, gehen wir zur ersten Farbe zurück, andernfalls erhöhen wir weiter um `1`.

Das können wir mit einer `if`-Anweisung umsetzen:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

In diesem Code bedeutet `colors.count` die Anzahl der Elemente im Array.

Im aktuellen Array gibt es 4 Farben, also:

```swift
colors.count // 4
```

Der größte Index ist aber nicht `4`, sondern `3`, weil die Indizierung bei `0` beginnt.

Daher muss der letzte Index so geschrieben werden:

```swift
colors.count - 1
```

Also:

```swift
4 - 1 = 3
```

Diese Logik bedeutet: Wenn der aktuelle Index bereits der letzten Farbe entspricht, setze den Index auf `0` zurück, andernfalls erhöhe ihn um `1`.

Auf diese Weise können die Farben in einer Schleife wechseln.

### Die Indexlogik vereinfachen

Wenn wir den Code kürzer machen möchten, können wir auch den ternären Operator verwenden:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Dieser Code bedeutet: Wenn `index == colors.count - 1` wahr ist, gib `0` zurück. Andernfalls gib `index + 1` zurück.

Zum Schluss weisen wir das Ergebnis wieder `index` zu.

Jetzt können wir den Effekt des Farbwechsels erreichen.

Vollständiger Code:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Jetzt können wir auf den Bildschirm tippen und zwischen verschiedenen Farben wechseln. Eine grundlegende Fill-Light-App ist fertig.

## Den Farbnamen anzeigen

Wir können noch eine weitere Gruppe von Texten hinzufügen, die den Farben entspricht, sodass beim Wechsel der Farbe auch der Name der aktuellen Farbe auf dem Bildschirm angezeigt wird.

Zum Beispiel:

- Rot zeigt `Red`
- Blau zeigt `Blue`
- Gelb zeigt `Yellow`
- Lila zeigt `Purple`

Auch hier können wir ein Array verwenden, um die Farbnamen zu speichern:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Die Reihenfolge der Texte in diesem Array sollte genau der Reihenfolge der Farben im Farbarray entsprechen.

Dann können wir `Text` verwenden, um den Farbnamen für den aktuellen Index anzuzeigen:

```swift
Text(colorsName[index])
```

`Text` zeigt den aktuellen Farbnamen entsprechend `index` an.

Mit Modifikatoren können wir das Aussehen von `Text` verbessern:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Dadurch wird `Text` in Weiß, mit Titelgröße und fett dargestellt.

Jetzt haben wir eine `Color`-View im Vollbild. Wenn wir möchten, dass `Text` über der `Color`-View angezeigt wird, müssen wir den Layout-Container `ZStack` verwenden, um beide übereinander zu legen.

```swift
ZStack {
    Color
    Text
}
```

Der Code wird also zu:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Auf diese Weise bildet die Farb-View den Hintergrund, und darüber liegt eine Text-View.

Ergebnis:

![Color](../../Resource/018_color2.png)

Wichtig ist, dass in einem `ZStack` Views, die später geschrieben werden, normalerweise vorne erscheinen. Wenn `Text` vor `Color` geschrieben wird, kann die später geschriebene `Color`-View den `Text` überdecken.

## Helligkeit steuern

Jetzt können wir zwischen verschiedenen Farben wechseln, aber ein Fill Light hat noch eine andere wichtige Funktion: **die Helligkeit anpassen**.

In SwiftUI können wir den Modifikator `brightness` verwenden, um die Helligkeit einer View anzupassen.

Zum Beispiel:

```swift
.brightness(1)
```

Wir können schreiben:

```swift
colors[index]
    .brightness(0.5)
```

Dadurch wird die aktuelle Farbe heller und kommt dem Effekt eines Fill Lights näher.

Der Helligkeitsbereich ist `0 - 1`. `0` bedeutet, die ursprüngliche Farbe beizubehalten, und je näher der Wert an `1` liegt, desto heller wird die Farbe. `1` bedeutet das hellste weiße Ergebnis.

Obwohl wir `brightness` im Code steuern können, kann der Benutzer es noch nicht selbst direkt anpassen.

Deshalb müssen wir ein ziehbares Steuerelement hinzufügen: `Slider`.

## `Slider`-View

In SwiftUI ist `Slider` ein Steuerelement, mit dem ein Wert innerhalb eines Bereichs ausgewählt werden kann. Apple beschreibt es als "ein Steuerelement zur Auswahl eines Werts aus einem begrenzten linearen Bereich".

Grundlegende Verwendung:

```swift
Slider(value: $value, in: 0...1)
```

Erklärung der Parameter:

1. `value: $value`: `Slider` muss an eine Variable gebunden werden.

    Wenn der Schieberegler bewegt wird, ändert sich der Wert der Variable gleichzeitig. Umgekehrt wird auch der Schieberegler aktualisiert, wenn sich die Variable ändert.

    Das ist sehr ähnlich zu `TextField`, das wir zuvor kennengelernt haben. Beide "binden ein Steuerelement an eine Variable".

    Vor einer gebundenen Variable muss das Symbol `$` stehen, um das Binding darzustellen.

2. `in: 0...1`: Dieser Parameter stellt den Wertebereich des Schiebereglers dar.

    Hier bedeutet `0...1`, dass der Minimalwert `0` und der Maximalwert `1` ist.

    Wenn der Schieberegler ganz nach links gezogen wird, liegt die gebundene Variable nahe bei `0`; wenn er ganz nach rechts gezogen wird, liegt sie nahe bei `1`.

Zum Beispiel:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` ist an die Variable `value` gebunden. Wenn der Schieberegler bewegt wird, ändert sich der Wert von `value` gleichzeitig.

Aussehen:

![Slider](../../Resource/018_slider.png)

Wenn der `Slider` nach links bewegt wird, wird der gebundene Wert `value` zu `0`. Wenn er nach rechts bewegt wird, wird er zu `1`.

### Wertebereich

Der Wertebereich von `Slider` ist nicht fest. Er kann auch so geschrieben werden:

```swift
0...100
```

oder als ein anderer Bereich.

In dieser Fill-Light-App müssen wir aber die Helligkeit steuern, daher ist `0...1` die passendste Wahl.

## `Slider` zur Steuerung der Helligkeit verwenden

Jetzt müssen wir `Slider` mit `brightness` verbinden.

Zuerst erstellen wir eine Variable, um den Helligkeitswert zu speichern:

```swift
@State private var slider = 0.0
```

Hier ist `0.0` ein Wert vom Typ `Double`.

Da `Slider` normalerweise an einen numerischen Typ gebunden wird und wir hier möchten, dass er sich kontinuierlich ändern kann, ist `Double` besser geeignet. Außerdem akzeptiert `brightness` nur einen Wert vom Typ `Double`.

Dann übergeben wir diesen Wert an `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Wenn `slider == 0`, bleibt die Farbe in ihrem Standardzustand. Je näher `slider` an `1` ist, desto heller wirkt die Farbe.

### Das `Slider`-Steuerelement hinzufügen

Als Nächstes fügen wir ein `Slider`-Steuerelement hinzu, um diese Variable zu ändern:

```swift
Slider(value: $slider, in: 0...1)
```

Wenn sich der Schieberegler ändert, ändert sich auch der Wert von `slider`, und `brightness(slider)` aktualisiert die Helligkeit gleichzeitig.

Das ist ein sehr typisches Beispiel dafür, dass in SwiftUI "Variablen die View steuern".

### Das Aussehen von `Slider` anpassen

Standardmäßig nutzt `Slider` die verfügbare Breite.

Wir können ihm eine feste Breite geben:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Dann fügen wir noch einige Modifikatoren hinzu, damit er besser sichtbar ist:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Dadurch erhält der Schieberegler einen weißen Hintergrund und abgerundete Ecken, sodass er auf der `Color`-View deutlicher hervorsticht.

Zum Schluss platzieren wir ihn am unteren Rand des Bildschirms.

Da wir bereits `ZStack` verwenden, können wir darin zusätzlich einen `VStack` platzieren und mit `Spacer()` den `Slider` nach unten schieben.

## Vollständiger Code

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Ergebnis:

![Color](../../Resource/018_color.png)

## Zusammenfassung

Mit dem Wissen, das wir zuvor gelernt haben, zusammen mit grundlegenden Konzepten wie Farben und Arrays, haben wir eine sehr interessante Fill-Light-App gebaut.

Durch diese Fill-Light-App haben wir gelernt, wie man `brightness` zum Anpassen der Helligkeit, `onTapGesture` zum Hinzufügen von Tippaktionen zu Views und das Steuerelement `Slider` verwendet.

Wir haben `onTapGesture` zur `Color`-View hinzugefügt, um die Farben zu wechseln. Außerdem haben wir das Steuerelement `Slider` verwendet, um eine Variable zu ändern, die `brightness` steuert. Das ist ein weiteres Beispiel dafür, dass "Variablen die View steuern".

Wir haben außerdem den ternären Operator wiederholt, `ZStack` zum Stapeln von Views verwendet und Arrays genutzt, um eine Gruppe von Daten desselben Typs zu verwalten. Das vertieft unser Verständnis von Arrays und Indizes, einschließlich des praktischen Problems, Fehler durch Indizes außerhalb des gültigen Bereichs zu vermeiden.

Obwohl dieses Beispiel nicht kompliziert ist, verbindet es viele der grundlegenden Ideen, die wir zuvor gelernt haben. Wenn sie in einem kleinen realen Projekt zusammenkommen, wird es leichter zu verstehen, wofür jedes Konzept verwendet wird.

### Reales Anwendungsszenario

Stell dir vor, du stellst ein altes iPhone auf den Tisch und benutzt die Fill-Light-App, die du selbst entwickelt hast, um die Lichtfarbe zu steuern. Das wäre eine sehr schöne Erfahrung.

Im App Store gibt es viele "Fill-Light"-Apps, und auch sie sehen nicht besonders kompliziert aus.

![AppStore](../../Resource/018_appStore.PNG)

Wir können damit beginnen, einfache Apps zu entwickeln und versuchen, sie im App Store zu veröffentlichen. Das steigert nicht nur unser Interesse an der Entwicklung, sondern dokumentiert auch unseren Fortschritt.

### Übung nach der Lektion

Du kannst weiter darüber nachdenken, wie du diese Fill-Light-App erweitern kannst, zum Beispiel:

- Mehr Farben hinzufügen
- Den aktuellen Helligkeitswert anzeigen
- Das Design des unteren Slider-Bereichs verbessern

Wenn du dieses Wissen wirklich einsetzt, wirst du entdecken, dass jedes Konzept, das wir lernen, in Wirklichkeit ein Werkzeug zum Entwickeln von Apps ist.

Je mehr Werkzeuge wir beherrschen, desto mehr Funktionen können wir umsetzen.
