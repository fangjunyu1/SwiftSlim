# Berechnete Eigenschaften

In dieser Lektion lernen wir hauptsächlich berechnete Eigenschaften.

Berechnete Eigenschaften werden verwendet, um aus vorhandenen Daten ein neues Ergebnis zu berechnen. Sie können Zahlenwerte berechnen und auch Inhalte, die in SwiftUI-Views angezeigt werden sollen.

Zum Beispiel:

```swift
let a = 10
let b = 20
let c = a + b
```

Hier steht `c` für das Ergebnis von `a` plus `b`.

In normalem Code ist diese Schreibweise sehr üblich.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Hinweis: Im Tap-Ereignis von `Button` kann normaler Swift-Code ausgeführt werden.

Wenn ähnlicher Code aber direkt in Eigenschaften einer SwiftUI-View geschrieben wird, entsteht ein Problem.

Zum Beispiel:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Dieser Code führt zu einem Fehler.

Es sieht so aus, als würden `a` und `b` bereits vor `c` stehen, sodass der Wert von `c` scheinbar berechnet werden kann.

In der Eigenschaftsdeklaration einer Struktur kann diese Schreibweise aber nicht direkt verwendet werden.

## Warum c nicht direkt a + b berechnen kann

Denn `a`, `b` und `c` sind keine temporären Konstanten im Tap-Ereignis eines Buttons, sondern Eigenschaften der View `ContentView`.

Im Tap-Ereignis eines Buttons kann dieser Code normal ausgeführt werden:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Denn nach dem Tippen auf den Button wird der Code der Reihe nach ausgeführt. Zuerst wird `a` erstellt, dann `b`, und zuletzt wird mit `a + b` der Wert von `c` berechnet.

Beim Deklarieren von Eigenschaften innerhalb einer View ist die Situation aber anders:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Hier sind `a`, `b` und `c` alle Eigenschaften der View `ContentView`.

Wenn die View `ContentView` erstellt wird, muss Swift diese Eigenschaften zuerst vorbereiten. Um den Erstellungsprozess sicher zu halten, erlaubt Swift nicht, dass der Standardwert einer gespeicherten Instanzeigenschaft direkt andere Instanzeigenschaften derselben Instanz liest.

Deshalb führt diese Zeile zu einem Fehler:

```swift
let c = a + b
```

Einfach gesagt: **Beim Deklarieren von Eigenschaften innerhalb einer View kann man nicht direkt eine normale Eigenschaft verwenden, um eine andere normale Eigenschaft zu berechnen.**

Eine Eigenschaft, die einen Wert direkt speichert, heißt „gespeicherte Eigenschaft“. Zum leichteren Verständnis können wir sie vorübergehend auch als normale Eigenschaft verstehen.

Zum Beispiel:

```swift
let a = 10
```

`a` speichert `10`.

```swift
let b = 20
```

`b` speichert `20`.

Aber:

```swift
let c = a + b
```

Hier ist `c` kein direkt festgeschriebener Wert, sondern soll durch `a + b` berechnet werden.

Für eine solche Situation, in der ein Ergebnis aus vorhandenen Daten gewonnen wird, eignet sich eine berechnete Eigenschaft besser.

Man kann es so ändern:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Hier ist `c` eine berechnete Eigenschaft.

```swift
var c: Int {
    return a + b
}
```

Das bedeutet: **Wenn `c` gebraucht wird, werden `a` und `b` erst dann gelesen, und das Ergebnis von `a + b` wird zurückgegeben.**

Zum Beispiel:

```swift
Text("c: \(c)")
```

Wenn `Text` den Wert von `c` anzeigt, wird erst dann die Berechnung von `c` ausgelöst.

## Was ist eine berechnete Eigenschaft?

Eine berechnete Eigenschaft sieht aus wie eine Variable, speichert aber selbst keine Daten.

Zum Beispiel:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Hier ist `c` eine berechnete Eigenschaft.

Sie speichert keinen festen Wert wie eine normale Eigenschaft, sondern führt jedes Mal, wenn `c` gelesen wird, den Code in `{}` erneut aus und gibt das Berechnungsergebnis zurück.

Man kann es so verstehen:

```swift
var c: Int {
    return a + b
}
```

Wenn `c` gebraucht wird, wird `a + b` berechnet.

Deshalb eignet sich eine berechnete Eigenschaft für diese Situation: **Ein Ergebnis muss nicht separat gespeichert werden, sondern kann aus vorhandenen Daten berechnet werden.**

## Grundlegende Schreibweise

Eine berechnete Eigenschaft besteht normalerweise aus drei Teilen:

```swift
var c: Int {
    return a + b
}
```

### 1. Mit `var` deklarieren

```swift
var c
```

Eine berechnete Eigenschaft muss mit `var` deklariert werden; `let` kann nicht verwendet werden.

Denn eine berechnete Eigenschaft ist kein fest gespeicherter Wert, sondern ein Ergebnis, das bei jedem Lesen dynamisch berechnet wird.

### 2. Rückgabetyp angeben

```swift
var c: Int
```

Eine berechnete Eigenschaft muss einen Rückgabetyp angeben.

Hier gibt `c` am Ende eine Ganzzahl zurück, daher ist der Typ `Int`.

### 3. Mit {} die Berechnungslogik schreiben

```swift
{
    return a + b
}
```

In `{}` steht die Berechnungslogik; hier wird `a + b` zurückgegeben.

## Das Schlüsselwort return

Eine berechnete Eigenschaft muss ein Ergebnis zurückgeben.

Zum Beispiel:

```swift
var c: Int {
    return a + b
}
```

Hier bedeutet `return`: Gib das Ergebnis der Berechnung `a + b` nach außen zurück.

Wenn die berechnete Eigenschaft nur einen Ausdruck enthält, der direkt ein Ergebnis erzeugt, kann `return` weggelassen werden:

```swift
var c: Int {
    a + b
}
```

Wenn die berechnete Eigenschaft aber mehrere Codezeilen enthält, muss `return` verwendet werden, um das Ergebnis klar zurückzugeben.

Zum Beispiel:

```swift
var totalPriceText: String {
    let total = count * price
    return "Gesamt: \(total) $"
}
```

Der Berechnungsprozess ist hier in zwei Schritte aufgeteilt.

Erster Schritt: zuerst den Gesamtpreis berechnen:

```swift
let total = count * price
```

Zweiter Schritt: den Gesamtpreis zu Text zusammensetzen und zurückgeben:

```swift
return "Gesamt: \(total) $"
```

Wenn `return` entfernt wird:

```swift
var totalPriceText: String {
    let total = count * price
    "Gesamt: \(total) $"
}
```

Dieser Code führt zu einem Fehler.

Der Grund ist: **Diese berechnete Eigenschaft enthält bereits mehrere Codezeilen, und Swift kann nicht mehr automatisch bestimmen, welche Zeile das endgültige Rückgabeergebnis ist.**

Wenn eine berechnete Eigenschaft also nur eine Ergebniszeile hat, kann `return` weggelassen werden.

```swift
var c: Int {
    a + b
}
```

Wenn eine berechnete Eigenschaft mehrere Codezeilen enthält, wird empfohlen, `return` klar zu schreiben.

```swift
var totalPriceText: String {
    let total = count * price
    return "Gesamt: \(total) $"
}
```

## Unterschied zwischen berechneten und normalen Eigenschaften

Normale Eigenschaften speichern Daten.

```swift
var c = 30
```

Hier speichert `c` einen konkreten Wert: `30`.

Berechnete Eigenschaften speichern keine Daten.

```swift
var c: Int {
    a + b
}
```

Hier speichert `c` nicht `30`. Sie stellt nur eine Berechnungsmethode bereit.

Wenn `c` gelesen wird, führt Swift aus:

```swift
a + b
```

und gibt dann das Berechnungsergebnis zurück.

Deshalb eignen sich berechnete Eigenschaften für Situationen, in denen ein Ergebnis aus anderen Daten berechnet wird.

## body ist ebenfalls eine berechnete Eigenschaft

Nachdem wir berechnete Eigenschaften gelernt haben, können wir den häufigsten Code in SwiftUI neu verstehen:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Hier ist `body` ebenfalls eine berechnete Eigenschaft.

Sie wird mit `var` deklariert:

```swift
var body
```

Sie hat einen Rückgabetyp:

```swift
some View
```

In ihren `{}` wird SwiftUI-View-Inhalt zurückgegeben:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Deshalb kann `body` so verstanden werden: Wenn SwiftUI diese View anzeigen muss, liest es `body` und erzeugt die Oberfläche anhand des Inhalts, den `body` zurückgibt.

Wenn man `return` schreibt, kann man es so verstehen:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

In SwiftUI lassen wir `return` aber normalerweise weg und schreiben direkt:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Wenn sich `@State`-Daten ändern, liest SwiftUI `body` erneut und aktualisiert die Oberfläche anhand der neuen Daten.

Zum Beispiel:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Anzahl: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Nach dem Tippen auf den Button ändert sich `count`.

```swift
count += 1
```

Nachdem sich `count` geändert hat, berechnet SwiftUI `body` erneut, daher wird auch der Text in der Oberfläche aktualisiert.

```swift
Text("Anzahl: \(count)")
```

Das ist auch der Grund, warum sich die Oberfläche in SwiftUI nach Datenänderungen automatisch aktualisieren kann.

### Komplexe Berechnungen in body werden nicht empfohlen

Da `body` eine berechnete Eigenschaft ist, kann sie viele Male gelesen und neu berechnet werden.

Zum Beispiel:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("Zahl: \(num)")
            Text("Name: \(name)")
        }
    }
}
```

Wenn sich `name` ändert, berechnet SwiftUI `body` erneut.

Dann wird auch der Code innerhalb von `body` erneut ausgeführt, und `num` wird ebenfalls neu erstellt.

```swift
let num = 10
```

`num` in diesem Beispiel ist sehr einfach, daher ist der Einfluss gering.

Wenn in `body` aber komplexe Berechnungen ausgeführt werden, zum Beispiel das Filtern großer Datenmengen, Sortieren oder Bildverarbeitung, kann dies die flüssige Darstellung der Oberfläche beeinträchtigen.

Deshalb sollte `body` in SwiftUI hauptsächlich die Struktur der Oberfläche beschreiben.

Einfache temporäre Daten können in `body` geschrieben werden.

Komplexe Berechnungen können in berechnete Eigenschaften außerhalb von `body`, in Methoden oder in eine separate Datenverarbeitung ausgelagert werden.

## Beispiel: Anzahl und Gesamtpreis

Im Folgenden verstehen wir berechnete Eigenschaften mit einem einfachen Beispiel.

Angenommen, der Einzelpreis einer Karotte beträgt 2 $, der Benutzer kann per Button die Kaufmenge ändern, und die Oberfläche muss den Gesamtpreis anzeigen.

Die Berechnung des Gesamtpreises:

```
Anzahl * Einzelpreis
```

Wenn man den Gesamtpreis mit einer normalen Variablen speichert, wird es etwas umständlich.

Denn jedes Mal, wenn sich die Anzahl ändert, muss der Gesamtpreis manuell aktualisiert werden.

Besser ist es, eine berechnete Eigenschaft zu verwenden:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("Preis: \(price) $")
                Text("Anzahl: \(count)")
                Text("Gesamtpreis: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Anzeigeergebnis:

![view](../../Resource/024_view.png)

In diesem Beispiel:

```swift
@State private var count = 1
```

`count` steht für die Anzahl der Karotten. Beim Tippen auf den Button ändert sich `count`.

```swift
private let price = 2
```

`price` steht für den Einzelpreis der Karotte. Hier ist es ein fester Wert, daher wird `let` verwendet.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` steht für den Gesamtpreis.

Er muss nicht separat gespeichert werden, denn der Gesamtpreis kann immer mit `count * price` berechnet werden.

Wenn `count` `1` ist:

```swift
totalPrice = 1 * 2
```

Das Anzeigeergebnis ist:

```swift
Gesamtpreis: 2 $
```

Nach dem Tippen auf den Button `+` wird `count` zu `2`.

Wenn `totalPrice` jetzt erneut gelesen wird, wird er neu berechnet:

```swift
totalPrice = 2 * 2
```

Das Anzeigeergebnis ist:

```swift
Gesamtpreis: 4 $
```

Das ist die Aufgabe einer berechneten Eigenschaft: anhand vorhandener Daten dynamisch ein neues Ergebnis berechnen.

## Berechnete Eigenschaften können für Entscheidungen verwendet werden

Berechnete Eigenschaften können nicht nur Zahlenwerte berechnen, sondern auch Entscheidungsergebnisse zurückgeben.

Zum Beispiel, wenn die Mindestanzahl 1 sein soll.

Wenn die Anzahl bereits 1 ist, sollte der Button `-` nicht weiter verringern.

Man kann eine berechnete Eigenschaft hinzufügen:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Vollständiger Code:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("Preis: \(price) $")
                Text("Anzahl: \(count)")
                Text("Gesamtpreis: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Anzeigeergebnis:

![view](../../Resource/024_view1.png)

Hier:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Dieser Code bedeutet, ob im Moment weiter verringert werden kann.

Wenn `count` größer als `1` ist:

```swift
canDecrease == true
```

bedeutet das, dass verringert werden kann.

Wenn `count` gleich `1` ist:

```swift
canDecrease == false
```

bedeutet das, dass nicht weiter verringert werden kann.

### Bedingte Prüfung im Button

Im Button wird verwendet:

```swift
if canDecrease {
    count -= 1
}
```

Nur wenn `canDecrease` zu `true` ausgewertet wird, kann `count` verringert werden.

### Vordergrundfarbe der View steuern

Man kann `canDecrease` auch verwenden, um die Vordergrundfarbe des Buttons zu steuern:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Hier wird der ternäre Operator verwendet:

```swift
canDecrease ? Color.primary : Color.gray
```

Dieser Code bedeutet: Wenn `canDecrease` `true` ist, wird `Color.primary` als Vordergrundfarbe verwendet; wenn `canDecrease` `false` ist, wird `Color.gray` verwendet.

`Color.primary` ist eine von SwiftUI bereitgestellte systemsemantische Farbe und steht für die Haupttextfarbe in der aktuellen Oberfläche.

Im hellen Modus ist `Color.primary` normalerweise fast schwarz; im dunklen Modus ist `Color.primary` normalerweise fast weiß.

Der Vorteil von `Color.primary` ist also, dass es sich automatisch an hellen und dunklen Modus anpasst.

### Deaktivierten Zustand der View steuern

`disabled` wird verwendet, um zu steuern, ob eine View deaktiviert ist:

```swift
.disabled(!canDecrease)
```

Wenn `disabled` `false` ist, kann die View angetippt werden.

Wenn `disabled` `true` ist, ist die View deaktiviert und kann nicht angetippt werden.

Die Verwendung von `canDecrease` als Bedingung macht den Code leichter verständlich.

Wenn man `canDecrease` sieht, erkennt man, dass es bedeutet: „Kann im Moment weiter verringert werden?“

### Ergänzende Erklärung: Warum gibt es zwei Prüfungen?

Im Button `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Hier wird sowohl `.disabled(!canDecrease)` verwendet als auch `if canDecrease` innerhalb des Buttons.

`.disabled(!canDecrease)` deaktiviert den Button in der Oberfläche, sodass der Benutzer ihn nicht antippen kann.

`if canDecrease` prüft vor der Codeausführung noch einmal und führt `count -= 1` nur aus, wenn verringert werden darf.

Das ist ein doppelter Schutz. In der echten Entwicklung kann die innere Prüfung weggelassen werden, wenn der Button bereits deaktiviert ist; im Lehrbeispiel bleibt sie erhalten, damit die Rolle von `canDecrease` klarer wird.

## Zusammenfassung

In dieser Lektion haben wir hauptsächlich berechnete Eigenschaften gelernt.

Eine berechnete Eigenschaft speichert den Wert nicht direkt, sondern berechnet beim Lesen anhand vorhandener Daten ein Ergebnis.

Zum Beispiel:

```swift
var c: Int {
    a + b
}
```

Hier muss `c` nicht separat gespeichert werden, denn sie kann mit `a + b` berechnet werden.

Eine berechnete Eigenschaft muss mit `var` deklariert werden und einen Rückgabetyp angeben.

```swift
var canDecrease: Bool {
    count > 1
}
```

Berechnete Eigenschaften können nicht nur Zahlenwerte zurückgeben, sondern auch Entscheidungsergebnisse, Textinhalte und sogar SwiftUI-View-Inhalte.

In dieser Lektion haben wir auch `return` gelernt.

`return` bedeutet, ein Ergebnis zurückzugeben:

```swift
var totalPriceText: String {
    let total = count * price
    return "Gesamt: \(total) $"
}
```

Wenn eine berechnete Eigenschaft nur einen Ausdruck enthält, der direkt ein Ergebnis erzeugt, kann `return` weggelassen werden.

```swift
var totalPrice: Int {
    count * price
}
```

Außerdem haben wir `Color.primary` und `disabled` kennengelernt.

`Color.primary` ist eine systemsemantische Farbe von SwiftUI und passt die Anzeige automatisch an hellen und dunklen Modus an.

```swift
.foregroundStyle(Color.primary)
```

`disabled` wird verwendet, um zu steuern, ob eine View deaktiviert ist.

```swift
.disabled(true)
```

Bedeutet deaktiviert, kann nicht angetippt werden.

```swift
.disabled(false)
```

Bedeutet verfügbar, kann angetippt werden.

Deshalb sind berechnete Eigenschaften in SwiftUI sehr häufig. Sie helfen uns, Berechnungsergebnisse, Entscheidungsbedingungen und Anzeigeinhalte klarer zu organisieren.
