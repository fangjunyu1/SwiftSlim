# Leuchtende Farben

In dieser Lektion lernen wir häufig verwendete visuelle Modifikatoren in SwiftUI kennen, darunter:

- Farben
- Vordergrundfarbe
- Hintergrundfarbe
- Offset
- Transparenz
- Unschärfe

Außerdem lernen wir die Safe Area kennen.

Diese Modifikatoren werden verwendet, um das visuelle Erscheinungsbild einer View zu steuern und die Oberfläche klarer und besser gegliedert zu gestalten.

## Farben

In SwiftUI kann man die Farbe von Text festlegen.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` steht für Blau und ist in Wirklichkeit nur eine verkürzte Schreibweise von `Color.blue` durch Typinferenz.

Häufige Farben sind zum Beispiel:

```text
.black
.green
.yellow
.pink
.gray
...
```

All diese Werte sind statische Eigenschaften von `Color`.

![Color](../../RESOURCE/006_color.png)

Du kannst `Color` als einen Farbtyp verstehen, und `.blue` oder `.red` als konkrete Farben dieses Typs.

### Die Color-View

In SwiftUI kann `Color` auch direkt als View angezeigt werden.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Dieser Code erzeugt ein rotes Quadrat mit 100 × 100.

Man kann auch die gesamte Oberfläche in einer bestimmten Farbe anzeigen:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Nach dem Ausführen sieht man, dass Rot den Bildschirm nicht vollständig ausfüllt. Oben und unten auf dem iPhone bleiben weiße Bereiche sichtbar. Hier kommt die Safe Area ins Spiel.

## Safe Area

Die Safe Area ist der Bereich, den das System reserviert, damit Inhalte nicht verdeckt werden. Dazu gehören:

1. Die Statusleiste oben, zum Beispiel Uhrzeit und Batteriestand
2. Die Home-Anzeige unten
3. Der Bereich von Notch oder Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Standardmäßig beschränkt SwiftUI Inhalte auf die Safe Area, sodass Views nicht bis an alle Bildschirmränder reichen.

### Die Safe Area ignorieren

Wenn du möchtest, dass eine Farbe den gesamten Bildschirm ausfüllt, kannst du `ignoresSafeArea` verwenden:

```swift
Color.red
    .ignoresSafeArea()
```

Oder `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Dann erstreckt sich die View über den gesamten Bildschirm.

Wichtig ist dabei: `edgesIgnoringSafeArea` ist die ältere Schreibweise. Seit iOS 14 wird `ignoresSafeArea` empfohlen.

## Vordergrundfarbe

### Der Modifikator foregroundStyle

In früheren Lektionen haben wir bereits `foregroundStyle` zum Setzen von Farben kennengelernt.

Zum Beispiel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ist das neuere Stylesystem und unterstützt Farben, Verläufe, Materialien und mehr.

![Color](../../RESOURCE/006_color2.png)

### Der Modifikator foregroundColor

Mit `foregroundColor` kann ebenfalls eine Farbe gesetzt werden:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Die Verwendung ist ähnlich wie bei `foregroundStyle`.

In neueren Xcode-Versionen weist Xcode darauf hin, dass `foregroundColor` in zukünftigen iOS-Versionen möglicherweise veraltet sein könnte. Deshalb sollte bevorzugt `foregroundStyle` verwendet werden.

## Hintergrund

Wenn du einer View eine Hintergrundfarbe geben möchtest, kannst du `background` verwenden:

```swift
background(.red)
```

Zum Beispiel, um einem Text eine Hintergrundfarbe zu geben:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Wenn wir in Apps wie Word oder Chrome Text markieren, sehen wir einen ähnlichen Hintergrundeffekt.

![Color](../../RESOURCE/006_color16.png)

Wenn du den Hintergrund vergrößern möchtest, musst du ihn mit `padding` kombinieren:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Hier ist eine wichtige Regel zu beachten:

SwiftUI-Modifikatoren bauen eine View von oben nach unten auf. Ein später geschriebener Modifikator wirkt auf das Ergebnis der vorherigen Modifikatoren.

Also:

```swift
.padding()
.background()
```

Das bedeutet, dass der Hintergrund die View nach dem Hinzufügen des Innenabstands umschließt.

Wenn die Reihenfolge vertauscht wird:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Dann wird der Hintergrund nicht größer, weil er das spätere `padding` nicht mit einschließt.

## Beispiel: Vierkantmutter

Jetzt erstellen wir eine einfache View, die wie eine Vierkantmutter aussieht.

![Color](../../RESOURCE/006_color8.png)

Zuerst erzeugen wir ein weißes Quadrat mit 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Wenn es rund werden soll, können wir `cornerRadius` verwenden:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Wenn der Radius der Hälfte von Breite und Höhe entspricht, entsteht ein Kreis.

Jetzt fügen wir einen blauen Hintergrund hinzu:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Das zusätzliche `padding` vergrößert den äußeren Bereich, und `background` zeichnet Blau hinter diesem äußeren Bereich.

So entsteht bereits der Effekt einer Vierkantmutter.

### Eine andere Denkweise

Neben einer Hintergrundfarbe kann man die Vierkantmutter auch mit `ZStack` umsetzen.

Wir haben bereits gelernt, dass `ZStack` Views übereinander stapeln kann. Eine Vierkantmutter kann man auch als Überlagerung eines Kreises und eines Rechtecks verstehen.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` legt Views in Reihenfolge übereinander. Die später hinzugefügte View erscheint auf der oberen Ebene.

## Beispiel: Zwei überlappende Kreise

Viele Icons bestehen aus der Überlagerung einfacher Formen, zum Beispiel zwei teilweise überlappenden Kreisen.

![Color](../../RESOURCE/006_color14.png)

Zuerst erstellen wir zwei Kreise:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Da die beiden Kreise überlagert werden sollen, verwenden wir `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

In diesem Zustand liegen zwei gleich große Kreise vollständig übereinander.

Wir möchten jedoch, dass sie sich nur teilweise überlappen und nicht vollständig deckungsgleich sind. Dafür können wir mit `offset` eine Verschiebung erzeugen.

## Offset

`offset` verändert nur die Zeichenposition einer View, aber nicht die Layoutberechnung der Eltern-View.

Verwendung:

```swift
.offset(x:y:)
```

`x` ist die horizontale Verschiebung, `y` die vertikale Verschiebung.

Positive Werte verschieben nach rechts beziehungsweise unten, negative Werte nach links beziehungsweise oben.

Mit `offset` können wir die beiden Kreise teilweise überlappen lassen:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Die Position des roten Kreises im Layout bleibt unverändert, aber seine Zeichenposition wird um 25 Punkte nach links verschoben. Dadurch entsteht der visuelle Effekt einer teilweisen Überlappung.

## Transparenz

In SwiftUI wird `opacity` verwendet, um die Transparenz einer View festzulegen.

Grundlegende Verwendung:

```swift
.opacity(0.5)
```

Der Wertebereich von `opacity` reicht von 0.0 bis 1.0:

- `0` bedeutet vollständig transparent
- `1` bedeutet vollständig deckend

Wir können `opacity` verwenden, um die Transparenz des orangefarbenen Kreises anzupassen:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Wenn `opacity` des orangefarbenen Kreises auf 0.8 gesetzt wird, beträgt seine Deckkraft 80 %. Wenn sich die beiden Kreise überlappen, entsteht im Schnittbereich ein Mischfarbeffekt.

## Unschärfe

In SwiftUI kann man mit `blur` einen Unschärfeeffekt hinzufügen:

```swift
.blur(radius:10)
```

`radius` definiert den Unschärferadius. Je größer der Wert, desto deutlicher wird die Unschärfe.

Wir können beiden Kreisen eine Unschärfe geben:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Am Ende sehen wir zwei stark verschwommene Kreise.

## Zusammenfassung

In dieser Lektion ging es um häufige visuelle Modifikatoren in SwiftUI. Wir haben gelernt, wie man mit Modifikatoren Farbe, Position und visuelle Effekte einer View steuert.

Anhand konkreter Beispiele haben wir gesehen, welche Wirkung verschiedene visuelle Modifikatoren auf eine Oberfläche haben, und zusätzlich das Konzept der Safe Area verstanden.

All das sind sehr grundlegende Modifikatoren. Wenn wir sie oft üben und einsetzen, fällt es uns in der praktischen Entwicklung leichter, das Aussehen einer Oberfläche präzise zu steuern.

### Übungen nach der Lektion

- Füge einem Bild Transparenz und Unschärfe hinzu
- Erstelle drei überlagerte Kreise mit unterschiedlicher Transparenz
- Erstelle ein Hintergrundbild, das den ganzen Bildschirm ausfüllt und die Safe Area ignoriert
- Verwende `offset`, um die Position mehrerer Views anzupassen

Das Ziel dieser Übungen ist nicht, die APIs auswendig zu lernen, sondern die Beziehung zwischen visuellen Veränderungen und Layoutverhalten zu beobachten.
