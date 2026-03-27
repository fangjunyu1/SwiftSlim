# Variablen und Konstanten

In dieser Lektion lernen wir hauptsächlich Variablen und Konstanten in Swift kennen sowie einige häufig verwendete Datentypen und grundlegende Operatoren.

Diese Inhalte gehören zu den elementarsten Grundlagen des Programmierens und sind zugleich eine wichtige Basis für das weitere Lernen von SwiftUI.

## Variablen und Konstanten im Alltag

Wir können Variablen und Konstanten anhand von Dingen aus dem Alltag verstehen.

Variablen im Alltag:

- Im Fernsehen ist der Inhalt jeder Sendung unterschiedlich
- Das Wetter ist jeden Tag anders
- Eine Uhr verändert sich jede Sekunde

Die gemeinsame Eigenschaft dieser Dinge ist: Sie verändern sich.

Wenn im Fernsehen immer nur dasselbe Bild zu sehen wäre, das Wetter immer sonnig bliebe und sich die Zeiger einer Uhr nie bewegen würden, dann wären diese Dinge Konstanten.

Das eine kann sich verändern, das andere nicht.

## Variablen und Konstanten verstehen

Bei der App-Entwicklung müssen Nutzerinnen und Nutzer oft bestimmte Informationen eingeben oder speichern.

Zum Beispiel:

- Kontoname
- Geburtstag
- Kontaktdaten
- Adresse

Diese Informationen werden gespeichert und anschließend angezeigt.

Nehmen wir an, ein Nutzer gibt in einer App einen Namen ein:

```text
FangJunyu
```

Diesen Namen müssen wir speichern, damit er in der App angezeigt werden kann.

Man kann sich den Speichervorgang vereinfacht wie das Ablegen von Dingen in einer Schublade vorstellen.

Wenn wir einen Namen speichern, ist das so, als würden wir ihn in eine Schublade legen.

Es kann viele Dinge geben, die gespeichert werden müssen, also gibt es auch viele Schubladen. Damit wir wissen, was sich in welcher Schublade befindet, brauchen die Schubladen Namen.

Zum Beispiel:

```text
name
```

In diesem Beispiel ist `name` der Name der Schublade und `FangJunyu` die gespeicherte Information.

![Var](../../RESOURCE/007_var.png)

**In Swift muss jede gespeicherte Information mit einer Variablen (`var`) oder einer Konstante (`let`) deklariert werden.**

Da ein Name normalerweise geändert werden kann, sollten wir hier eine Variable verwenden.

```swift
var name = "FangJunyu"
```

Hier wird eine Variable mit dem Namen `name` deklariert. Ihr Typ ist `String`, und ihr Wert ist `"FangJunyu"`.

### Der Unterschied zwischen Variablen und Konstanten

Variablen werden mit `var` deklariert:

```swift
var
```

Konstanten werden mit `let` deklariert:

```swift
let
```

Zum Beispiel:

```swift
var name = "FangJunyu"
let id = 123456
```

Wenn etwas als Variable deklariert ist, darf sein Wert geändert werden. Wenn es als Konstante deklariert ist, kann der Wert danach nicht mehr geändert werden.

Der Hauptunterschied zwischen Variablen und Konstanten ist also: Ob der Wert verändert werden darf oder nicht.

### Eine Konstante ändern

Wenn der Code versucht, den Wert einer Konstante zu ändern:

```swift
let name = "Sam"
name = "Bob"
```

dann meldet Swift, dass die Zuweisung nicht möglich ist, weil es sich um eine Konstante handelt.

```text
Cannot assign to property: 'name' is a 'let' constant
```

Dieser Mechanismus hilft Entwicklerinnen und Entwicklern dabei, wichtige Daten davor zu schützen, versehentlich geändert zu werden.

### In SwiftUI anzeigen

Öffne die Datei `ContentView.swift` und deklariere innerhalb der View eine Variable:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Hier wurde eine Variable mit dem Namen `name` deklariert und mit `Text` auf dem Bildschirm angezeigt.

Wenn wir den Inhalt der Variablen ändern:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

dann ändert sich auch der Text, den `Text` anzeigt.

Auf diese Weise können wir mit Variablen den Inhalt steuern, der auf der Oberfläche angezeigt wird, ohne jedes Mal direkt den Text in `Text` zu ändern.

Wenn andere Stellen dieselbe Information benötigen, können wir die Variable auch weitergeben. Das ist so, als würden wir den Inhalt der "Schublade" an eine andere Stelle weiterreichen.

### Die Position von Variablen und Konstanten in SwiftUI

In SwiftUI werden Variablen und Konstanten normalerweise außerhalb von `body` geschrieben:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Natürlich kann man Variablen und Konstanten auch innerhalb von `body` schreiben:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Zwischen diesen beiden Varianten gibt es jedoch einen wichtigen Unterschied:

- Wenn Variablen und Konstanten innerhalb von `body` geschrieben werden, werden sie bei jeder Neuberechnung der View neu erzeugt.
- Wenn sie außerhalb von `body` geschrieben werden, existieren sie als Eigenschaften der View-Struktur, und der Code bleibt übersichtlicher.

Deshalb schreibt man Variablen und Konstanten in der Praxis meistens außerhalb von `body`.

## Datentypen

Variablen können viele unterschiedliche Arten von Daten speichern. Diese Arten nennt man Datentypen.

Wir haben zum Beispiel vorher `Text` verwendet, um Text anzuzeigen:

```swift
Text("Hello, World")
```

Hier ist `"Hello, World"` vom Typ `String`.

`String` steht für Textinhalt, und in Swift muss er mit doppelten Anführungszeichen `""` umschlossen werden.

Zum Beispiel:

```swift
var hello = "Hello, World"
```

Neben Zeichenketten gibt es in Swift viele weitere Datentypen.

In der Anfangsphase sind vier Typen besonders wichtig:

- `String`
- `Int`
- `Double`
- `Bool`

Mit diesen vier Typen lassen sich die meisten grundlegenden Datenverarbeitungen umsetzen.

**String**

`String` steht für Textinhalt, zum Beispiel:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Zeichenketten werden häufig verwendet für: Benutzernamen, Titel oder allgemeine Textinhalte.

**Int**

`Int` steht für ganze Zahlen, also Zahlen ohne Nachkommastellen.

Zum Beispiel:

```swift
var age = 26
var count = 100
```

Ganze Zahlen werden häufig verwendet für: Alter, Mengen oder Zählerstände.

**Double**

`Double` steht für Zahlen mit Nachkommastellen.

Zum Beispiel:

```swift
var weight = 74.5
var height = 185.0
```

In Swift werden Dezimalzahlen standardmäßig meistens als `Double` behandelt.

Es gibt noch einen ähnlichen Typ namens `Float`, aber er kann einen kleineren Wertebereich darstellen. Deshalb wird in der Praxis meist `Double` verwendet.

**Bool**

Der Typ `Bool` beschreibt genau zwei Zustände: `true` und `false`.

Zum Beispiel:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` wird häufig für Bedingungen verwendet, zum Beispiel dafür, ob ein Hinweisfenster angezeigt werden soll.

Immer wenn es nur zwei mögliche Ergebnisse gibt, eignet sich `Bool` sehr gut.

### In SwiftUI anzeigen

Wenn wir einen Wert vom Typ `String` anzeigen möchten, können wir ihn direkt in `Text` verwenden:

```swift
Text(name)
```

Aber Typen wie `Int` oder `Double` sind keine Zeichenketten und können deshalb nicht direkt als Teil eines Textes verwendet werden.

Wenn wir solche Daten in `Text` anzeigen möchten, können wir String Interpolation verwenden:

```swift
\()
```

String Interpolation muss innerhalb eines Strings geschrieben und mit `\()` um die Variable oder Konstante gelegt werden.

Zum Beispiel:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Im obigen Code stehen `""` für einen String, und `\()` wird verwendet, um Variablen oder Konstanten in diesen String einzusetzen.

Zum Beispiel:

```swift
"DoubleNum: \(num * 2)"
```

Der angezeigte Inhalt lautet:

```text
DoubleNum: 2
```

Auf diese Weise können wir Variablen oder Konstanten in einen String einfügen und anschließend mit `Text` auf dem Bildschirm anzeigen.

Hinweis: `\()` kann nur innerhalb eines Strings `""` verwendet werden.

## Operatoren

Bei der Deklaration einer Variablen oder Konstante sehen wir oft eine Schreibweise wie:

```swift
var num = 1
```

Das `=` nennt man Zuweisungsoperator.

Seine Aufgabe ist es, den Wert auf der rechten Seite der Variablen auf der linken Seite zuzuweisen.

In diesem Beispiel wird `1` der Variablen `num` zugewiesen.

Neben dem Zuweisungsoperator gibt es noch einige häufig verwendete numerische Operatoren:

- `+`
- `-`
- `*`
- `/`

Wenn wir mit Zahlen rechnen, zum Beispiel mit Daten vom Typ `Int` oder `Double`, verwenden wir diese Operatoren.

Zum Beispiel:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Nach der Berechnung wird das Ergebnis in der Variablen gespeichert.

## Zusammenfassung

Variablen, Konstanten und Operatoren gehören zu den grundlegendsten Konzepten der Programmierung.

Mit Variablen und Konstanten können wir unterschiedlichste Daten im Programm speichern. Mit Datentypen wird festgelegt, um welche Art von Daten es sich handelt. Mit Operatoren können wir diese Daten berechnen und verarbeiten.

Dieses Wissen ist wie ein Satz grundlegender Werkzeuge in der Welt des Programmierens. Wenn du diese Inhalte beherrschst, legst du eine stabile Grundlage für das weitere Lernen von Swift und SwiftUI.
