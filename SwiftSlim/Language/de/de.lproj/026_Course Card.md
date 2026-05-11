# Kurskarte

Diese Lektion ist eine Wiederholungslektion für eine Etappe. Wir erstellen eine „Kurskarte“.

Durch diese Übung können wir die zuvor gelernten Inhalte wie `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` usw. wiederholen und lernen, wie mehrere kleine Ansichten zu einem vollständigen Ansichtsmodul kombiniert werden.

Effekt der Kurskarte:

![view](../../../Resource/026_view.png)

Diese Kurskarte enthält hauptsächlich mehrere Bereiche:

- Kursniveau: `Anfänger`
- Kursinhalt: `20+ Lektionen`
- Kurstitel: `SwiftUI-Tutorial für Anfänger`
- Kursbeschreibung
- Schaltfläche: `Jetzt lernen`
- Kurshintergrund: Swift-Symbol und indigofarbener Hintergrund

Wir können diese Ansicht in `ContentView` erstellen.

## Oberer Bereich

Zuerst erstellen wir den oberen Bereich der Kurskarte.

![view](../../../Resource/026_view1.png)

Links im oberen Bereich wird das Kursniveau angezeigt, rechts der Kursinhalt.

Da diese beiden Inhalte horizontal angeordnet sind, können wir `HStack` verwenden.

```swift
var topView: some View {
    HStack {
        Text("Anfänger")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ Lektionen")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Hier zerlegen wir den oberen Bereich in eine berechnete Eigenschaft:

```swift
var topView: some View
```

Der Vorteil davon ist, dass `body` übersichtlicher bleibt.

Im oberen Bereich werden hauptsächlich diese Inhalte verwendet:

- `HStack`: ordnet zwei Texte horizontal an.
- `Text`: zeigt Textinhalte an.
- `Spacer()`: schiebt den linken Text nach links und den rechten Text nach rechts.
- `.font(.footnote)`: legt einen kleineren Schriftstil fest.
- `.fontWeight(.bold)`: macht den Text fett.
- `.foregroundStyle(Color.white)`: setzt die Vordergrundfarbe auf Weiß.
- `.padding(.vertical, 10)`: legt den oberen und unteren Innenabstand fest.
- `.padding(.horizontal, 16)`: legt den linken und rechten Innenabstand fest.
- `.background(Color.white.opacity(0.15))`: legt einen halbtransparenten weißen Hintergrund fest.
- `.cornerRadius(20)`: legt abgerundete Ecken fest.

Für `Anfänger` verwenden wir `.padding()` in zwei Richtungen:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

So erhält der Text oben, unten, links und rechts Abstand und sieht eher wie ein Label aus.

`Color.white.opacity(0.15)` bedeutet Weiß mit einer Deckkraft von `15%`, also ein sehr helles Weiß.

### Kartenhintergrund hinzufügen

Zuvor haben wir `topView` erstellt, aber nur eine Ansicht zu erstellen bedeutet nicht, dass sie automatisch angezeigt wird.

In SwiftUI müssen die Inhalte, die wirklich auf der Oberfläche angezeigt werden sollen, in `body` geschrieben werden.

Daher können wir zuerst `topView` in `body` anzeigen:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Nun sieht man, dass der obere Bereich bereits angezeigt wird:

![view](../../../Resource/026_view2.png)

Da der Text in `topView` jedoch weiß ist und der Standardhintergrund ebenfalls hell ist, ist er im hellen Modus möglicherweise nicht gut zu erkennen.

Deshalb können wir außen ein `VStack` hinzufügen und anschließend Innenabstand, Hintergrundfarbe und abgerundete Ecken für den gesamten Bereich festlegen:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view3.png)

In diesem `VStack` befindet sich derzeit nur ein `topView`, daher wirkt es vielleicht nicht zwingend notwendig.

Später fügen wir jedoch noch Kurstitel, Kursbeschreibung und Schaltflächenbereich hinzu. Diese Inhalte sind alle vertikal angeordnet. Deshalb verwenden wir hier vorab `VStack`, damit wir die Ansicht später leichter weiter zusammensetzen können.

Hier gibt es zwei `.padding()`, deren Funktionen unterschiedlich sind.

Das erste `.padding(20)` steht vor `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Es steuert den Innenabstand der Karte, also den Abstand zwischen Inhalt und Hintergrundrand.

Das zweite `.padding(30)` steht nach `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Es steuert den Außenabstand der Karte, also den Abstand zwischen der gesamten Karte und dem Bildschirmrand.

![view](../../../Resource/026_view4.png)

Obwohl es in beiden Fällen `.padding()` ist, führt eine andere Position zu einem anderen Effekt.

## Inhaltsbereich

Als Nächstes erstellen wir den Inhaltsbereich der Kurskarte.

Anzeigeeffekt:

![view](../../../Resource/026_view5.png)

Der Inhaltsbereich enthält den Kurstitel und die Kursbeschreibung. Sie sind vertikal angeordnet, daher verwenden wir `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI-Tutorial für Anfänger")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Beginne bei null mit SwiftUI und lerne systematisch die deklarative UI-Entwicklung von Apple. Durch klare Erklärungen und praktische Beispiele wirst du Layout, Interaktion und Zustandsverwaltung schrittweise beherrschen und schöne sowie nützliche App-Oberflächen erstellen können.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view6.png)

In diesem `VStack` verwenden wir zwei Parameter:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` bedeutet, dass die Ansichten innerhalb von `VStack` links ausgerichtet werden.

`spacing: 10` bedeutet, dass zwischen den Ansichten innerhalb von `VStack` ein Abstand von `10 pt` bleibt.

Daher beginnen Kurstitel und Kursbeschreibung links und zwischen ihnen bleibt ein gewisser Abstand.

Die Kursbeschreibung ist relativ lang. Wenn sie vollständig angezeigt wird, wird die Karte sehr hoch. Deshalb verwenden wir hier `.lineLimit()`, um die Anzahl der angezeigten Zeilen zu begrenzen:

```swift
.lineLimit(3)
```

Das bedeutet, dass höchstens `3` Zeilen angezeigt werden. Wenn der Inhalt diese Grenze überschreitet, wird der überstehende Teil gekürzt.

### Ansicht links ausrichten

Hier ist noch ein Punkt zu beachten.

`VStack(alignment: .leading)` steuert nur die Ausrichtung der Ansichten innerhalb von `VStack`; es steuert nicht direkt die Position von `VStack` selbst im äußeren Container.

Zum Beispiel, wenn die Kursbeschreibung relativ kurz ist:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI-Tutorial für Anfänger")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Ein kurzer Inhalt.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view7.png)

Man sieht, dass Kurstitel und Kursbeschreibung zwar innerhalb von `VStack` links ausgerichtet sind, das gesamte `VStack` aber nicht ganz links an der Karte liegt.

Das liegt daran, dass die Breite von `VStack` ebenfalls schmaler wird, wenn der Inhalt kürzer ist. Beim Layout kann der äußere Container dieses schmalere `VStack` in die Mitte setzen.

Man kann es so verstehen: `VStack(alignment: .leading)` ist für die innere Linksausrichtung zuständig.
Aber es ist nicht dafür zuständig, den gesamten Inhaltsbereich ganz nach links zu schieben.

Wenn der gesamte Inhaltsbereich wirklich links anliegen soll, kann man außen noch ein `HStack` hinzufügen und `Spacer()` ergänzen:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI-Tutorial für Anfänger")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Ein kurzer Inhalt.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view8.png)

Dieses `HStack` ist ein horizontales Layout.

`Spacer()` belegt den verbleibenden Platz auf der rechten Seite und schiebt dadurch das linke `VStack` ganz nach links.

Daher kann `HStack + Spacer()` verwendet werden, um die Position des gesamten Inhaltsbereichs zu steuern.

In der tatsächlichen Kurskarte ist die Kursbeschreibung relativ lang und nimmt normalerweise mehr Breite ein. Deshalb ist dieses Problem nicht unbedingt offensichtlich. Es ist jedoch wichtig, diesen Unterschied zu verstehen, weil man später bei Layouts mit kurzen Texten häufig auf ähnliche Situationen trifft.

### Abstand zwischen inneren Ansichten steuern

Zuvor haben wir in `VStack` `spacing: 10` geschrieben:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` wird verwendet, um den Abstand zwischen inneren Ansichten zu steuern.

Wenn `spacing` nicht festgelegt wird, hat `VStack` ebenfalls einen Standardabstand, aber dieser Standardabstand entspricht nicht unbedingt dem gewünschten Effekt.

Hier würden Kurstitel und Kursbeschreibung zu gedrängt wirken, wenn sie zu nah beieinander liegen. Deshalb verwenden wir:

```swift
spacing: 10
```

So bleibt zwischen ihnen etwas Platz.

Anzeigeeffekt:

![view](../../../Resource/026_view9.png)

Ebenso sind der obere Bereich und der Inhaltsbereich vertikal angeordnet. Auch hier kann `spacing` verwendet werden, um den Abstand zwischen ihnen zu steuern.

Jetzt setzen wir `topView` und `contentView` in `body` ein:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view10.png)

Dieses `VStack(spacing: 20)` steuert den Abstand zwischen `topView` und `contentView`.

Das heißt:

```swift
VStack(alignment: .leading, spacing: 10)
```

steuert den Abstand zwischen Kurstitel und Kursbeschreibung.

```swift
VStack(spacing: 20)
```

steuert den Abstand zwischen oberem Bereich und Inhaltsbereich.

Beide verwenden `spacing`, wirken aber auf unterschiedliche `VStack`, daher beeinflussen sie unterschiedliche Bereiche.

Damit ist die Ansicht des Inhaltsbereichs fertig.

## Schaltflächenbereich

Als Nächstes erstellen wir den unteren Schaltflächenbereich.

Anzeigeeffekt:

![view](../../../Resource/026_view11.png)

Der Schaltflächenbereich besteht hauptsächlich aus einem Wiedergabesymbol und einem Text.

Wir können `Image` verwenden, um das Wiedergabesymbol anzuzeigen, und `Text`, um den Schaltflächentext anzuzeigen.

Zuerst erstellen wir das Aussehen einer Schaltfläche:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("Button geklickt")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Jetzt lernen")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view12.png)

Hier verwenden wir zwei `HStack`:

Das innere `HStack` wird verwendet, um Symbol und Text horizontal anzuordnen:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Jetzt lernen")
}
```

Das äußere `HStack` wird zusammen mit `Spacer()` verwendet, damit das Aussehen der Schaltfläche links angezeigt wird:

```swift
HStack {
    ...
    Spacer()
}
```

Wenn auf die Schaltfläche geklickt wird, gibt die Konsole `Button geklickt` aus.

## Basiskarte fertigstellen

Jetzt kombinieren wir den oberen Bereich, den Inhaltsbereich und den Schaltflächenbereich:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/026_view13.png)

Bis hierhin ist eine grundlegende Kurskarte fertiggestellt.

## Swift-Symbolhintergrund

Zum Schluss fügen wir der Karte einen halbtransparenten Swift-Symbolhintergrund hinzu.

![view](../../../Resource/026_view.png)

Zuvor haben wir `Color.indigo` als Hintergrundfarbe verwendet. Tatsächlich kann `.background()` nicht nur eine Farbe hinzufügen, sondern auch eine vollständige Ansicht.

Daher können wir zunächst eine eigene Hintergrundansicht erstellen:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

In dieser Hintergrundansicht verwenden wir `VStack`, `HStack` und `Spacer()`, um das Swift-Symbol nach rechts unten zu schieben.

Da das Swift-Symbol nur als dekorativer Hintergrund dient, verwenden wir hier halbtransparentes Weiß:

```swift
Color.white.opacity(0.15)
```

So wirkt das Symbol nicht zu auffällig und beeinträchtigt den Text im Vordergrund nicht.

Anschließend fügen wir `backgroundView` zur Karte hinzu:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Umsetzungseffekt:

![view](../../../Resource/026_view14.png)

Hier verwenden wir zwei `.background()` direkt hintereinander:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Das erste `.background()` wird verwendet, um den Swift-Symbolhintergrund hinzuzufügen.
Das zweite `.background()` wird verwendet, um den indigofarbenen Hintergrund hinzuzufügen.

So wird das Swift-Symbol über dem indigofarbenen Hintergrund angezeigt und als Teil des Kartenhintergrunds dargestellt.

Daran sieht man, dass `.background()` nicht nur Farben hinzufügen kann, sondern auch benutzerdefinierte Ansichten. Mehrere `.background()` können außerdem kombiniert werden, um reichere Hintergrundeffekte zu erzeugen.

Damit ist eine vollständige Kurskarte fertiggestellt.

## Zusammenfassung

In dieser Lektion haben wir anhand einer Kurskarte häufig verwendete grundlegende Layoutmethoden in SwiftUI wiederholt.

Wir verwenden `Text`, um Text anzuzeigen, `Image`, um Systemsymbole anzuzeigen, und `VStack`, `HStack` sowie `Spacer()`, um die Anordnung von Ansichten zu steuern.

Wir haben `.lineLimit()` gelernt. Damit lässt sich begrenzen, wie viele Textzeilen maximal angezeigt werden. Wenn der Inhalt die Grenze überschreitet, wird der überstehende Teil gekürzt.

Gleichzeitig haben wir auch häufig verwendete Modifikatoren wie `.padding()`, `.background()`, `.cornerRadius()` und `.foregroundStyle()` wiederholt.

Nach dieser Lektion können wir bereits mehrere kleine Ansichten zu einem vollständigen Kartenmodul kombinieren.

Das ist auch ein sehr häufiger Ansatz in der SwiftUI-Entwicklung: zuerst kleine Ansichten aufteilen und sie dann zu einer vollständigen Oberfläche zusammensetzen.

## Vollständiger Code

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Anfänger")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ Lektionen")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI-Tutorial für Anfänger")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Beginne bei null mit SwiftUI und lerne systematisch die deklarative UI-Entwicklung von Apple. Durch klare Erklärungen und praktische Beispiele wirst du Layout, Interaktion und Zustandsverwaltung schrittweise beherrschen und schöne sowie nützliche App-Oberflächen erstellen können.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("Button geklickt")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Jetzt lernen")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
