# Darstellungsanpassung

In dieser Lektion lernen wir die Darstellungsanpassung für den hellen Modus und den dunklen Modus.

Auf iPhone, iPad und Mac können Benutzer den hellen Modus oder den dunklen Modus auswählen.

Wenn das System in den dunklen Modus wechselt, ändern sich bei vielen Apps auch Hintergrund, Text und Symbolfarben entsprechend.

Zum Beispiel kann die Oberfläche tagsüber einen hellen Hintergrund haben und nachts zu einem dunklen Hintergrund wechseln.

![view](../../../Resource/025_view9.png)

Diese Fähigkeit, die Anzeige der Oberfläche automatisch an die Systemdarstellung anzupassen, nennt man Darstellungsanpassung.

## Darstellungsanpassung in Xcode vorschauen

Bevor wir die Darstellungsanpassung lernen, sehen wir uns zuerst an, wie man in Xcode den hellen Modus und den dunklen Modus vorschauen kann.

Klicke unten im Bereich `Canvas` auf die Schaltfläche `Device Settings`, um das Fenster `Canvas Device Settings` zu öffnen.

![canvas](../../../Resource/025_view.png)

Im Fenster sieht man die Einstellung `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Dabei gilt:

- `Light Appearance` steht für den hellen Modus.
- `Dark Appearance` steht für den dunklen Modus.

Hier können wir die Vorschau-Darstellung umschalten und prüfen, wie die aktuelle Oberfläche im hellen Modus und im dunklen Modus aussieht.

## Zwei Darstellungen nebeneinander anzeigen

Wenn man den hellen Modus und den dunklen Modus gleichzeitig ansehen möchte, kann man die Funktion `Variants` verwenden.

Klicke unten im Bereich `Canvas` auf die Schaltfläche `Variants` und wähle `Color Scheme Variants` aus.

![canvas2](../../../Resource/025_view2.png)

Nach der Auswahl zeigt `Canvas` die Vorschau für den hellen Modus und den dunklen Modus gleichzeitig an.

![canvas3](../../../Resource/025_view3.png)

So lassen sich die Unterschiede der Oberfläche in beiden Darstellungen bequemer vergleichen.

Einfach gesagt:

Wenn man nur vorübergehend zwischen hellem und dunklem Modus wechseln möchte, kann man `Canvas Device Settings` verwenden.

Wenn man beide Darstellungen gleichzeitig ansehen möchte, kann man `Color Scheme Variants` verwenden.

## Ansichten passen sich standardmäßig an die Darstellung an

In SwiftUI passen sich viele Systemansichten standardmäßig automatisch an den hellen Modus und den dunklen Modus an.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Hell")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("etwas etwas etwas")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Anzeigeeffekt:

![canvas](../../../Resource/025_view4.png)

Man kann sehen, dass Symbole und Titel im hellen Modus normalerweise dunkel angezeigt werden.

Im dunklen Modus werden Symbole und Titel automatisch hell.

Das liegt daran, dass SwiftUI-Ansichten wie `Text` und `Image` ihre Farben standardmäßig an die Systemdarstellung anpassen.

Das heißt: Wenn wir keine feste Farbe manuell angeben, übernimmt SwiftUI einen Teil der Darstellungsanpassung für uns.

## Feste Farben werden nicht automatisch umgekehrt

Wichtig ist: Wenn wir manuell eine feste Farbe angeben, wird sie nicht automatisch zwischen hellem und dunklem Modus umgekehrt.

Zum Beispiel:

```swift
Text("etwas etwas etwas")
	.foregroundStyle(Color.gray)
```

Hier wird der Text auf `Color.gray` festgelegt, deshalb bleibt er immer grau.

Ein weiteres Beispiel:

```swift
Text("Titel")
    .foregroundStyle(Color.white)
```

Dieser Code zeigt den Text sowohl im hellen Modus als auch im dunklen Modus weiß an.

Wenn der Hintergrund ebenfalls hell ist, kann weißer Text schwer lesbar werden.

Bei der Darstellungsanpassung sollte man daher möglichst vermeiden, feste Farben wie `Color.white` und `Color.black` beliebig hart zu codieren.

In vielen Fällen kann man bevorzugt semantische Systemstile verwenden, zum Beispiel:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Dabei gilt:

- `.primary` wird normalerweise für Hauptinhalte verwendet.
- `.secondary` wird normalerweise für Nebeninhalte verwendet.

Sie passen ihre Anzeige automatisch an den hellen Modus und den dunklen Modus an.

## Je nach Darstellung unterschiedliche Inhalte anzeigen

Manchmal möchten wir nicht nur, dass sich Farben ändern, sondern dass in verschiedenen Darstellungen auch unterschiedliche Inhalte angezeigt werden.

Zum Beispiel:

- Im hellen Modus wird ein normales Glühbirnen-Symbol angezeigt.
- Im dunklen Modus wird ein leuchtendes Glühbirnen-Symbol angezeigt.
- Im hellen Modus zeigt der Titel `Hell` an.
- Im dunklen Modus zeigt der Titel `Dunkel` an.

Dann müssen wir erkennen, ob sich das aktuelle System im hellen Modus oder im dunklen Modus befindet.

In SwiftUI kann man über den Umgebungswert `colorScheme` die aktuelle Darstellung abrufen:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Vollständiger Code:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Hell" : "Dunkel"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("etwas etwas etwas")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/025_view5.png)

Aus der Vorschau erkennt man, dass dieselbe Ansicht in verschiedenen Darstellungsmodi nicht vollständig identische Inhalte anzeigt.

Im hellen Modus zeigt `Image` das normale Glühbirnen-Symbol an, und der Titel zeigt `Hell` an.

Im dunklen Modus zeigt `Image` das leuchtende Glühbirnen-Symbol an, und der Titel zeigt `Dunkel` an.

Das heißt: Hier ändern sich nicht nur die Farben, sondern auch der Symbolname und der Titeltext selbst.

Das liegt daran, dass wir Symbol und Titel nicht direkt im `body` hart codiert haben, sondern die jeweiligen Inhalte anhand von `colorScheme` berechnen.

In diesem Code verwenden wir zwei berechnete Eigenschaften:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Hell" : "Dunkel"
}
```

Wenn `colorScheme` `.light` ist, bedeutet das, dass aktuell der helle Modus aktiv ist.

Wenn `colorScheme` `.dark` ist, bedeutet das, dass aktuell der dunkle Modus aktiv ist.

So können wir je nach Darstellungsmodus unterschiedliche Symbolnamen und Titeltexte zurückgeben.

Das ist auch eine häufige Verwendung berechneter Eigenschaften: Sie berechnen anhand des aktuellen Zustands den Inhalt, den die Ansicht anzeigen soll.

## @Environment verstehen

Dies ist unser erster Kontakt mit `@Environment`.

`@Environment` kann man so verstehen: Es liest einen Wert aus der SwiftUI-Umgebung.

Wenn eine App läuft, stellt das System viele Umgebungsinformationen bereit, zum Beispiel:

- Aktuelle Sprache
- Aktueller Darstellungsmodus
- Aktuelle Layout-Richtung
- Aktuelle Einstellung der Schriftgröße

Wenn wir den aktuellen Darstellungsmodus abrufen möchten, können wir `colorScheme` lesen:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Dabei gilt:

```swift
\.colorScheme
```

bedeutet, dass der Wert `colorScheme` aus der Umgebung gelesen wird.

```swift
private var colorScheme
```

bedeutet, dass der gelesene Wert in der Variablen `colorScheme` gespeichert wird.

Den Variablennamen kann man selbst festlegen, zum Beispiel auch so:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Solange das vorangestellte `\.colorScheme` unverändert bleibt, wird weiterhin der aktuelle Darstellungsmodus gelesen.

## Zwei häufige Werte von colorScheme

`colorScheme` hat häufig zwei Werte:

```swift
.light
.dark
```

Sie bedeuten:

- `.light`: heller Modus
- `.dark`: dunkler Modus

Zum Beispiel:

```swift
private var titleName: String {
    colorScheme == .light ? "Hell" : "Dunkel"
}
```

Dieser Code bedeutet:

Wenn aktuell der helle Modus aktiv ist und `colorScheme == .light` wahr ist, wird `"Hell"` zurückgegeben.

Andernfalls wird `"Dunkel"` zurückgegeben.

Deshalb zeigt im hellen Modus:

```swift
Text(titleName)
```

Folgendes an:

```swift
Hell
```

Im dunklen Modus wird Folgendes angezeigt:

```swift
Dunkel
```

Auf diese Weise können wir je nach Darstellung unterschiedliche Inhalte anzeigen.

## Beispiel für Farbanpassung

Neben Text und Symbolen müssen wir manchmal auch Farben selbst anpassen.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/025_view6.png)

In diesem Code ist der Text weiß und der Hintergrund schwarz.

Im hellen Modus ist der schwarze Hintergrund gut sichtbar.

Im dunklen Modus kann dieser schwarze Hintergrund jedoch mit dem Systemhintergrund verschmelzen, wenn die gesamte Oberfläche ebenfalls schwarz ist. Dann wirkt er nicht klar genug.

Dann können wir je nach Darstellungsmodus Textfarbe und Hintergrundfarbe wechseln:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Anzeigeeffekt:

![view](../../../Resource/025_view7.png)

Jetzt hat der helle Modus einen schwarzen Hintergrund und weißen Text.

Der dunkle Modus hat einen weißen Hintergrund und schwarzen Text.

So haben Text und Hintergrund in jeder Darstellung einen deutlichen Kontrast, und Benutzer können den Inhalt klar erkennen.

## Farben mit Assets anpassen

Neben der manuellen Prüfung mit `colorScheme` können wir auch Farben aus `Assets` verwenden, um den hellen und dunklen Modus anzupassen.

Diese Methode eignet sich besser für die Verwaltung allgemeiner Farben in einer App.

Suche im Xcode-Projekt den Ressourcenordner `Assets`.

![assets](../../../Resource/025_color.png)

Öffne den Ordner `Assets`, klicke mit der rechten Maustaste auf einen leeren Bereich und wähle `New Color Set`, um eine neue Farbressource zu erstellen.

![assets](../../../Resource/025_color1.png)

Hier erstellen wir eine Farbe und nennen sie `redText`.

![assets](../../../Resource/025_color2.png)

Eine Farbressource kann getrennte Farben für den hellen Modus und den dunklen Modus festlegen.

![assets](../../../Resource/025_color3.png)

Nachdem du den entsprechenden Farbbereich ausgewählt hast, kannst du die Farbe rechts im Eigenschaften-Inspektor ändern.

Klicke oben rechts auf die Schaltfläche `Hide or show the Inspectors`, um den Inspektorbereich zu öffnen.

Wähle dann `Show the Attributes inspector` und suche unten `Show Color Panel`, um das Farbpanel zu öffnen.

![assets](../../../Resource/025_color4.png)

Wenn du im Farbpanel eine Farbe anklickst, ändert sich der entsprechende Farbbereich von `redText` synchron.

Hier setzen wir `redText` auf:

- Im hellen Modus rot anzeigen
- Im dunklen Modus grün anzeigen

![assets](../../../Resource/025_color5.png)

Zurück im SwiftUI-Code kann man diese Farbe so verwenden:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Dabei gilt:

```swift
Color("redText")
```

bedeutet, dass die Farbressource mit dem Namen `redText` aus `Assets` gelesen wird.

Anzeigeeffekt:

![assets](../../../Resource/025_view8.png)

Man kann sehen, dass dasselbe `Color("redText")` im hellen Modus und im dunklen Modus unterschiedliche Farben anzeigt.

Das zeigt, dass auch `Assets`-Farben selbst Darstellungsanpassung unterstützen.

## Unterschied zwischen colorScheme und Assets

Sowohl `colorScheme` als auch `Assets` können Darstellungsanpassung umsetzen, aber sie eignen sich für unterschiedliche Szenarien.

Wenn man nur je nach hellem oder dunklem Modus Textinhalte, Bildnamen oder `SF Symbols`-Namen wechseln möchte, kann man `colorScheme` verwenden.

Zum Beispiel:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Wenn es um Farben geht, die in der App häufig verwendet werden, etwa Themenfarben, Kartenhintergründe oder Textfarben, sind `Assets`-Farben empfehlenswerter.

Denn `Assets`-Farben können in mehreren Ansichten wiederverwendet werden und lassen sich später bequemer ändern.

Zum Beispiel:

```swift
Color("redText")
```

Dann muss man die Farbe nur in `Assets` ändern, und alle Stellen, die diese Farbe verwenden, ändern sich gemeinsam.

## Zusammenfassung

In dieser Lektion haben wir die Darstellungsanpassung für den hellen Modus und den dunklen Modus gelernt.

Zuerst haben wir gelernt, wie man in Xcodes `Canvas` verschiedene Darstellungen vorschaut, und auch, wie man mit `Color Scheme Variants` den hellen Modus und den dunklen Modus gleichzeitig ansieht.

Dann haben wir gesehen, dass SwiftUI-Ansichten wie `Text` und `Image` ihre Farben standardmäßig automatisch an die Systemdarstellung anpassen.

Wenn man jedoch feste Farben manuell angibt, zum Beispiel `Color.white` oder `Color.black`, werden diese Farben nicht automatisch umgekehrt.

Anschließend haben wir `@Environment` und `colorScheme` gelernt:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Mit `colorScheme` können wir feststellen, ob aktuell der helle Modus oder der dunkle Modus aktiv ist, und je nach Darstellung unterschiedliche Symbole, Texte oder Farben anzeigen.

Zum Schluss haben wir `Assets`-Farben gelernt.

`Assets`-Farben können getrennte Farben für den hellen Modus und den dunklen Modus festlegen und eignen sich für die Verwaltung allgemeiner Farbressourcen in einer App.

Darstellungsanpassung sorgt dafür, dass eine App tagsüber und nachts besser aussieht, und vermeidet Probleme wie schlecht lesbaren Text oder unklare Hintergründe.

In der praktischen Entwicklung empfiehlt es sich, zuerst die standardmäßige Anpassungsfähigkeit von SwiftUI und `Assets`-Farben zu verwenden.

Wenn in verschiedenen Darstellungen Text, Symbole oder Bilder gewechselt werden müssen oder wenn einige spezielle Anzeigeeffekte behandelt werden sollen, kann man anschließend mit `colorScheme` prüfen.

## Erweiterungswissen: Schriftgröße festlegen

Als wir zuvor `font` gelernt haben, haben wir einige System-Schriftstile verwendet:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Neben System-Schriftstilen wie `.largeTitle` und `.callout` kann man die Schriftgröße auch manuell festlegen.

Zum Beispiel:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Hier bedeutet:

```swift
.font(.system(size: 100))
```

Die Schriftgröße wird auf `100 pt` gesetzt.

Bei `SF Symbols`-Symbolen beeinflusst `font` ebenfalls die Symbolgröße.

Wenn man ein Symbol größer anzeigen möchte, kann man daher mit `.font(.system(size:))` die Größe festlegen.

Zum Beispiel:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Zu beachten ist: Eine manuell festgelegte Schriftgröße ist zwar flexibler, aber für normalen Text sollte man feste Schriftgrößen nicht in großer Menge verwenden.

Für normalen Text sollte man bevorzugt System-Schriftstile wie `.title`, `.headline`, `.body` und `.caption` verwenden.

So kann sich der Text besser an verschiedene Geräte und die Schriftgrößeneinstellungen der Benutzer anpassen.
