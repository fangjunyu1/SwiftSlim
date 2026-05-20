# Fotowand

In dieser Lektion erstellen wir eine Fotowand-Seite.

![view](../../../Resource/032_view13.png)

In diesem Beispiel wiederholen wir das Wissen zu `extension`, `self` und Instanzen und lernen häufig verwendete `Shape`-Formen in SwiftUI kennen.

Mit diesem Wissen können wir normale Bilder in unterschiedliche Formen wie Kreise, abgerundete Rechtecke, Kapseln und Ellipsen zuschneiden und den Fotos Rahmeneffekte hinzufügen.

In dieser Lektion verwenden wir mehrere neue Konzepte: `Shape`, `clipShape`, `strokeBorder` und `overlay`.

Dabei wird `clipShape` verwendet, um die Form einer View zuzuschneiden, `strokeBorder`, um den Rahmen einer Form zu zeichnen, und `overlay`, um eine neue View über einer bestehenden View zu platzieren.

## Bildmaterial

Bevor wir beginnen, müssen wir einige Bilder vorbereiten.

Du kannst eigene Fotos verwenden oder die in dieser Lektion bereitgestellten Beispielbilder nutzen.

Die Fotobeispiele in dieser Lektion stammen von der Website [Pixabay](https://pixabay.com/):

[Landschaft](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Fuchs](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Gebäude](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Blume](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Schwan](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Nachdem du die Bilder heruntergeladen hast, füge sie dem Ressourcenordner `Assets` hinzu und benenne sie der Reihe nach als `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

So können wir die Bilder in SwiftUI mit `Image("1")`, `Image("2")` anzeigen.

## Fotos anzeigen

Zuerst zeigen wir in `ContentView` 5 Fotos an:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/032_view.png)

In diesem Code verwenden wir `ScrollView`, um eine scrollbare Fotoliste zu erstellen, und `VStack`, damit mehrere Bilder von oben nach unten angeordnet werden.

Jedes Bild erhält über `.resizable()`, `.scaledToFit()` und `.frame(width: 300)` seine Anzeigeeinstellungen. Dadurch kann das Bild skaliert, vollständig im richtigen Seitenverhältnis angezeigt und gleichzeitig in der Breite begrenzt werden.

`.padding(.vertical, 100)` auf `VStack` erhöht den Abstand oben und unten, damit das erste und das letzte Foto nicht zu nah am Bildschirmrand liegen.

Das abschließende `.ignoresSafeArea()` bedeutet, dass die ScrollView den sicheren Bereich ignoriert. So können die Fotos beim Scrollen bis an den oberen und unteren Bildschirmrand reichen, wodurch die Seite vollständiger wirkt.

Aktuell verwenden jedoch alle 5 Bilder dieselben Modifier:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Wenn wir wiederholten Code sehen, können wir überlegen, ihn mit `extension` zu organisieren.

## Bildstil mit extension organisieren

Wir können `Image` um eine Methode erweitern, die speziell für die Fotowand gedacht ist:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Hier erweitern wir den Typ `Image` um die Methode `photoGalleryStyle`.

Diese Methode enthält die zuvor wiederholt verwendeten `.resizable()`, `.scaledToFit()` und `.frame(width: 300)`. Das heißt, sie fasst den Code für Bildskalierung, proportional passende Anzeige und Breitenfestlegung zusammen.

Nach Verwendung dieser Erweiterung kann der ursprüngliche Bildcode:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

vereinfacht werden zu:

```swift
Image("1")
    .photoGalleryStyle()
```

So muss jedes Bild nur noch `.photoGalleryStyle()` aufrufen, um denselben Fotowand-Stil anzuwenden. Der Code wird dadurch kompakter und spätere einheitliche Änderungen werden einfacher.

## self verstehen

In der Erweiterungsmethode haben wir `self` geschrieben:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Dieses `self` bezeichnet hier die aktuelle Bildinstanz, die diese Methode aufruft.

Zum Beispiel:

```swift
Image("1")
    .photoGalleryStyle()
```

In diesem Code wird `photoGalleryStyle()` von `Image("1")` aufgerufen. Deshalb steht `self` innerhalb der Methode für dieses Bild `Image("1")`.

Einfach gesagt: Wer diese Methode aufruft, für den steht `self`.

Zu beachten ist, dass SwiftUI-Modifier fortlaufend neue View-Ergebnisse zurückgeben. Deshalb gibt `photoGalleryStyle()` eine modifizierte View zurück und nicht einfach das ursprüngliche `Image` selbst.

## Fotoformen

Jetzt können die Fotos bereits normal angezeigt werden. Standardmäßig sind diese Fotos jedoch rechteckig und wirken recht gewöhnlich.

Wenn du Fotos nur mit abgerundeten Ecken versehen möchtest, kannst du direkt `.cornerRadius()` verwenden:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Anzeigeeffekt:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` bedeutet, dass dem Bild ein Eckenradius von `20 pt` hinzugefügt wird. Für normale Bilder mit abgerundeten Ecken reicht diese Schreibweise bereits aus.

Allerdings kann `.cornerRadius()` nur den Effekt abgerundeter Ecken behandeln und eignet sich für gewöhnliche Bilder mit abgerundeten Ecken. Wenn wir Fotos in mehr unterschiedliche Formen bringen möchten, reicht dieser Modifier allein nicht aus.

An dieser Stelle brauchen wir `Shape` in SwiftUI. `Shape` kann unterschiedliche Formen darstellen. Zusammen mit `clipShape` können wir Bilder in die entsprechende Form zuschneiden.

## Shape kennenlernen

In SwiftUI steht `Shape` für eine Form. Genau wie `View` ist es ein sehr häufig verwendeter Typ in SwiftUI.

Häufige `Shape`-Formen sind Kreis, Rechteck, abgerundetes Rechteck, Kapsel und Ellipse. Um das Aussehen verschiedener Formen anschaulicher zu beobachten, erhält jede Form im folgenden Beispiel eine andere Farbe und Größe.

In diesen Beispielen wird `.fill()` verwendet, um die Form mit Farbe zu füllen, und `.frame()`, um die Anzeigegröße der Form festzulegen. Die Farben dienen nur zur Unterscheidung der Formen und sind keine festen Eigenschaften der Formen selbst.

### Circle Kreis

`Circle` steht für einen Kreis. Es wird häufig für Avatare, runde Buttons, runde Bilder und ähnliche Oberflächeneffekte verwendet.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle Rechteck

`Rectangle` steht für ein Rechteck. Es ist eine der grundlegendsten Formen und kann auch zum Erstellen von Hintergründen, Trennbereichen oder einfachen Rahmen verwendet werden.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle abgerundetes Rechteck

`RoundedRectangle` steht für ein abgerundetes Rechteck. Mit `cornerRadius` wird die Größe der Rundung festgelegt.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule Kapsel

`Capsule` steht für eine Kapselform. Ihre beiden Enden sind bogenförmig. Sie wird häufig für Kapselbuttons, Label-Hintergründe und ähnliche Oberflächeneffekte verwendet.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse Ellipse

`Ellipse` steht für eine Ellipse. Sie ähnelt `Circle`, wird aber bei ungleicher Breite und Höhe als Ellipse angezeigt.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

An diesen Beispielen sehen wir, dass `Shape` selbst direkt als Form angezeigt werden kann. Als Nächstes verwenden wir diese `Shape`-Formen zusammen mit `clipShape`, um Fotos zuzuschneiden, sodass sie in unterschiedlichen Formen erscheinen.

## Fotos mit clipShape zuschneiden

Jetzt können wir `clipShape` verwenden, um Fotos in unterschiedliche Formen zuzuschneiden.

Zum Beispiel schneiden wir das erste Foto kreisförmig zu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Dieser Code bedeutet: Zuerst wird ein Bild angezeigt, dann wird es mit `Circle()` zu einem Kreis zugeschnitten.

![view](../../../Resource/032_view2.png)

Die Grundschreibweise von `clipShape` lautet:

```swift
.clipShape(Form)
```

Nach einer View wird `.clipShape(...)` hinzugefügt. In die Klammern schreibt man die Form, in die zugeschnitten werden soll.

Zum Beispiel:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Jetzt schneiden wir die 5 Fotos jeweils in unterschiedliche Formen zu:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/032_view8.png)

Dabei ähnelt der Effekt nach dem Zuschneiden mit `Rectangle()` einem normalen rechteckigen Foto, weshalb die visuelle Veränderung nicht deutlich ist. Es dient hauptsächlich zum Vergleich mit anderen Formen.

Jetzt sind die Fotos nicht mehr nur gewöhnliche Rechtecke, sondern besitzen unterschiedliche Formen.

## Fotorahmen hinzufügen

Wenn wir einem runden Foto einen Rahmen hinzufügen möchten, denken wir vielleicht zuerst an `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Das Ergebnis ist jedoch normalerweise kein runder Rahmen, sondern ein rechteckiger Rahmen.

![view](../../../Resource/032_view9.png)

Das liegt daran, dass `border` den Rahmen anhand des rechteckigen Bereichs der View hinzufügt und nicht anhand der durch `clipShape` zugeschnittenen Form.

Wenn wir also einen runden Rahmen möchten, können wir `border` nicht direkt verwenden.

## Formrahmen mit strokeBorder zeichnen

In SwiftUI kann `strokeBorder` für diese häufigen `Shape`-Formen einen inneren Rahmen zeichnen.

Zum Beispiel zeichnen wir einen kreisförmigen Rahmen:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Dieser Code bedeutet: Für `Circle` wird ein brauner Rahmen mit einer Rahmenbreite von `10 pt` gezeichnet.

![view](../../../Resource/032_view12.png)

Hier ist wichtig: `strokeBorder` fügt nicht direkt dem Foto einen Rahmen hinzu, sondern zeichnet einen Rahmen für die Form `Circle()`.

Das heißt, dieser Code erzeugt nur einen unabhängigen kreisförmigen Rahmen, der mit dem Foto noch nichts zu tun hat.

Wenn dieser kreisförmige Rahmen über dem Foto angezeigt werden soll, müssen wir weiter `overlay` verwenden und den Rahmen über das Foto legen.

## Rahmen mit overlay überlagern

`overlay` ist ein View-Modifier, mit dem eine neue View über der aktuellen View platziert werden kann.

Die Grundstruktur kann man so verstehen:

```swift
Aktuelle View
    .overlay {
        Überlagerte View
    }
```

In diesem Beispiel ist die aktuelle View das bereits kreisförmig zugeschnittene Foto:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Die neue View, die wir darüberlegen möchten, ist ein kreisförmiger Rahmen:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Deshalb können wir Foto und Rahmen kombinieren:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Hier bedeutet `overlay`, dass über der aktuellen View eine neue View platziert wird.

Innerhalb von `overlay` folgt der Rahmen dem Anzeigebereich des aktuellen Fotos. Deshalb muss kein separater `frame` mehr gesetzt werden. Solange Rahmenform und Zuschneideform übereinstimmen, passt der Rahmen zum Foto.

![view](../../../Resource/032_view10.png)

Das endgültige Ergebnis ist, dass über dem kreisförmigen Foto ein kreisförmiger Rahmen liegt.

Im Vergleich zu `ZStack` eignet sich `overlay` besser für Szenarien wie „der aktuellen View eine Dekoration hinzufügen“. Das Foto ist das Hauptelement, der Rahmen nur ein zusätzlicher Effekt. Daher ist die Verwendung von `overlay` klarer.

## Fotowand fertigstellen

Jetzt fügen wir jedem Foto die passende Form und den passenden Rahmen hinzu:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/032_view13.png)

Damit ist eine einfache Fotowand-Seite fertig.

Auf dieser Seite verwenden wir `ScrollView` für die scrollbare Anzeige, `Image` zum Anzeigen der Fotos, `clipShape` zum Zuschneiden der Fotoformen sowie `overlay` und `strokeBorder`, um Rahmen hinzuzufügen.

## Vollständiger Code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Zusammenfassung

In dieser Lektion haben wir eine Fotowand-Seite fertiggestellt.

![view](../../../Resource/032_view13.png)

In diesem Beispiel haben wir zuerst mit `Image` Fotos angezeigt und anschließend `Image` über `extension` um die Methode `photoGalleryStyle` erweitert, um wiederholten Bildstil-Code zu organisieren.

Danach haben wir häufige `Shape`-Formen in SwiftUI kennengelernt, zum Beispiel `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` und `Ellipse`. Diese Formen können nicht nur direkt angezeigt werden, sondern auch zusammen mit `clipShape` zum Zuschneiden von Views verwendet werden.

Zum Beispiel:

```swift
.clipShape(Circle())
```

bedeutet, dass die View kreisförmig zugeschnitten wird.

Zum Schluss haben wir mit `overlay` und `strokeBorder` den Fotos Rahmen in der jeweils passenden Form hinzugefügt. Zu beachten ist, dass `border` den Rahmen normalerweise anhand des rechteckigen View-Bereichs zeichnet. Wenn der Rahmen einem Kreis, einer Kapsel oder einer Ellipse folgen soll, ist es besser, dieselbe `Shape`-Form zu überlagern.

Durch diese Lektion haben wir nicht nur den Fotowand-Effekt fertiggestellt, sondern auch die häufige Kombination aus `Shape`, `clipShape`, `strokeBorder` und `overlay` in Benutzeroberflächen verstanden.

## Übung nach der Lektion

### 1. Fotowand-Hintergrund hinzufügen

Füge der Fotowand-Seite ein vollflächiges Hintergrundbild hinzu.

Anforderung: Das Hintergrundbild soll den gesamten Bildschirm ausfüllen und den sicheren Bereich ignorieren können.

### 2. Verlaufsrahmen

Ändere die vorhandenen einfarbigen Rahmen in lineare Verlaufsrahmen.

Du kannst versuchen, mit `LinearGradient` reichere Rahmeneffekte zu erzeugen.

### 3. Realistischen Fotorahmen nachbilden

Suche im Internet nach einigen echten Fotorahmen-Stilen und versuche, mit `overlay` einen Bildrahmen zu überlagern, damit das Foto stärker wie ein echter Bilderrahmen wirkt.

Anzeigeeffekt der Übung:

![button](../../../Resource/032_view15.jpeg)

### 4. Rahmen für einen Button mit abgerundeten Ecken erstellen

In der tatsächlichen Entwicklung verwenden Buttons häufig Rahmen mit abgerundeten Rechtecken.

Versuche, einen Button mit abgerundeten Ecken zu erstellen und mit `RoundedRectangle` und `strokeBorder` einen abgerundeten Rahmen hinzuzufügen.

Anzeigeeffekt der Übung:

![button](../../../Resource/032_view14.png)

### Denkfrage

Wenn du keinen einfarbigen Rahmen und auch keinen Verlaufsrahmen verwenden möchtest, sondern möchtest, dass der Rahmen ein bestimmtes Muster zeigt, wie könnte man das umsetzen?

Du kannst versuchen, Informationen zu suchen und verwandte Verwendungen wie `overlay`, `mask` oder `ImagePaint` kennenzulernen.

Anzeigeeffekt der Übung:

![button](../../../Resource/032_view16.png)
