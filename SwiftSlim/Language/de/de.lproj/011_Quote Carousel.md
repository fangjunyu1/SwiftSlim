# Zitate-Karussell

In dieser Lektion bauen wir eine Funktion für ein "Zitate-Karussell" und vertiefen dabei grundlegendes Swift-Wissen über Arrays (`Array`) und bedingte Anweisungen wie `if-else`.

Wir zeigen, wie mehrere Zitate gespeichert werden können und wie sich mit Buttons ein zyklisch wechselndes Zitate-Karussell umsetzen lässt.

![alt text](../../RESOURCE/011_word.png)

## Zitate anzeigen

Zuerst müssen wir in SwiftUI ein Zitat anzeigen.

Die einfachste Methode ist die Verwendung einer `Text`-View:

```swift
Text("Slow progress is still progress.")
```

Dieser Code kann jedoch nur ein festes Zitat anzeigen. Wenn wir mehrere Zitate anzeigen und zwischen ihnen wechseln möchten, müssen wir die Zitate speichern.

Eine normale String-Variable kann aber nur ein einziges Zitat speichern:

```swift
let sayings = "Slow progress is still progress."
```

Wenn wir mehrere Zitate speichern möchten, müssten wir für jedes einzelne Zitat eine eigene Variable deklarieren:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

In der echten Entwicklung ist diese Vorgehensweise jedoch umständlich. Außerdem sind diese Variablen voneinander getrennt, sodass sich damit kein flexibler Karussell-Wechsel umsetzen lässt.

Damit mehrere Zitate bequem verwaltet werden können, brauchen wir eine Datenstruktur, die sie gemeinsam speichert. Dafür verwenden wir ein Array (`Array`).

Mit einem Array lässt sich der obige Code so schreiben:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Hinweis: In gängigen Programmierkonventionen werden Variablennamen für Arrays mit mehreren Elementen oft im Plural geschrieben, wie hier `sayings`, damit der Sammelcharakter direkt erkennbar ist.**

## Arrays

In Swift ist ein Array eine geordnete Sammlung von Elementen und wird mit eckigen Klammern `[]` dargestellt.

```swift
[]
```

Ein Array kann mehrere Elemente desselben Typs enthalten. Die Elemente werden mit englischen Kommas `,` voneinander getrennt.

Zum Beispiel:

```swift
[101, 102, 103, 104, 105]
```

Man kann sich ein Array vereinfacht wie einen Zug vorstellen:

![Array](../../RESOURCE/011_array1.png)

Der gesamte Zug steht für das Array als Ganzes, und jeder Waggon ist in einer festen Reihenfolge angeordnet.

### Index und Zugriff auf Elemente

Weil Arrays geordnet sind, kann das System einzelne Elemente anhand ihrer Position finden. Dieser Mechanismus heißt Index (`Index`).

In Swift und den meisten anderen Programmiersprachen beginnt der Array-Index bei `0`, nicht bei `1`. Das bedeutet: Das erste Element hat den Index `0`, das zweite den Index `1` und so weiter.

![Array](../../RESOURCE/011_array2.png)

Wenn wir auf ein bestimmtes Element im Array zugreifen möchten, schreiben wir hinter den Array-Namen eckige Klammern und setzen den Index des gewünschten Elements hinein.

Zum Beispiel:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Wenn man versucht, auf einen Index außerhalb des gültigen Bereichs zuzugreifen, tritt ein "Index Out of Range"-Fehler auf. Deshalb muss beim Zugriff auf Arrays immer darauf geachtet werden, dass der Index gültig ist.

**Index außerhalb des gültigen Bereichs**

Wenn ein Array zum Beispiel 5 Elemente hat, dann reicht der gültige Indexbereich von `0` bis `4`. Wenn wir versuchen, `sayings[5]` zu lesen, findet das Programm keinen passenden "Waggon", was einen Fehler wegen eines ungültigen Index auslöst und die App abstürzen lässt.

![Array](../../RESOURCE/011_array3.png)

### Arrays bearbeiten

Arrays können nicht nur statisch definiert werden, sondern auch Elemente hinzufügen, löschen, ändern oder ihre Länge abfragen.

Hinweis: Wenn ein Array verändert werden soll, muss es mit `var` als Variable deklariert werden, nicht mit `let` als Konstante.

**1. Elemente hinzufügen**

Mit der Methode `append` kann am Ende des Arrays ein neues Element angehängt werden:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Elemente löschen**

Mit `remove(at:)` kann ein bestimmtes Element im Array entfernt werden:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Elemente ändern**

Über den Index können Array-Elemente direkt verändert werden:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Länge eines Arrays abfragen**

Mit der Eigenschaft `count` lässt sich die Anzahl der Elemente abrufen:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Zitate mit einem Array anzeigen

Um mehrere Zitate anzuzeigen, können wir sie in einem Array speichern und dann über einen Index auslesen.

Zuerst legen wir in `ContentView` ein Array `sayings` an, um die Zitate zu speichern, und lesen anschließend im `Text`-Element über den Index das passende Zitat aus:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Hier bedeutet `sayings[0]`, dass das erste Zitat des Arrays angezeigt wird.

Wenn du ein anderes Zitat anzeigen möchtest, musst du nur den Index in den Klammern ändern:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Den Index des Zitats definieren

Wenn wir erreichen möchten, dass das Zitat dynamisch gewechselt werden kann, dürfen wir den Index nicht fest in `Text` hineinschreiben.

Wir brauchen eine eigene Variable, die den aktuell angezeigten Index speichert.

In SwiftUI können wir dafür mit `@State` einen veränderlichen Index deklarieren:

```swift
@State private var index = 0
```

SwiftUI beobachtet Variablen, die mit `@State` verpackt sind. Wenn sich `index` ändert, rendert SwiftUI die View neu und zeigt das passende Zitat an.

Anschließend verwenden wir `sayings[index]`, um dynamisch das passende Zitat aus dem Array zu holen:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Wenn sich `index` ändert, zeigt `Text` ein anderes Zitat an.

### Den Index mit Buttons steuern

Um den Zitatwechsel zu steuern, können wir einen `Button` verwenden und den Wert von `index` bei jedem Tippen um 1 erhöhen:

```swift
Button("Next") {
    index += 1
}
```

Wenn wir auf den Button tippen, ändert sich `index` von `0` auf `1`. Dadurch wird die View aktualisiert und `Text(sayings[index])` liest das nächste Zitat.

Hier gibt es allerdings ein mögliches Problem: Wenn wir immer weiter tippen, steigt `index` irgendwann über den gültigen Bereich des Arrays hinaus. Das führt zu einem Fehler wegen eines ungültigen Array-Index. Wenn `index` zum Beispiel `5` erreicht, obwohl das Array nur Indizes von `0` bis `4` hat, stürzt das Programm ab.

Um das zu verhindern, müssen wir mit Bedingungen sicherstellen, dass `index` im gültigen Bereich bleibt. Dafür können wir eine `if-else`-Anweisung verwenden.

## Bedingungssteuerung: if-else

Die `if-else`-Anweisung ist eine der wichtigsten Verzweigungen in Swift. Sie wird verwendet, um zu prüfen, ob eine Bedingung erfüllt ist, und abhängig davon unterschiedlichen Code auszuführen.

Grundstruktur:

```swift
if condition {
    // Code, der ausgeführt wird, wenn condition true ist
} else {
    // Code, der ausgeführt wird, wenn condition false ist
}
```

In einer `if`-Anweisung ist die Bedingung `condition` ein Bool-Wert, also `true` oder `false`. Wenn die Bedingung `true` ist, wird der `if`-Teil ausgeführt, andernfalls der `else`-Teil.

Zum Beispiel:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Hier ist `age` gleich `25`, und die `if`-Anweisung prüft, ob `age > 18` gilt. Da die Bedingung erfüllt ist, wird `"Big Boy"` ausgegeben.

Wenn kein `else` benötigt wird, kann es weggelassen werden:

```swift
if condition {
    // Code, der ausgeführt wird, wenn condition true ist
}
```

### Den Indexbereich mit Bedingungen steuern

Um zu verhindern, dass der Array-Index ungültig wird, können wir mit `if` sicherstellen, dass `index` nicht über das Array hinauswächst:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logik dahinter: `sayings.count` ist `5`, also ist `sayings.count - 1` gleich `4`. Das ist der letzte gültige Index.

Solange `index` kleiner als `4` ist, ist es sicher, beim Tippen um `1` zu erhöhen. Sobald `index` `4` erreicht, ist die Bedingung nicht mehr erfüllt, und der Button bewirkt nichts mehr.

Damit ist der Wechsel zwischen Zitaten bereits umgesetzt:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Zitate im Kreis rotieren lassen

Wenn wir möchten, dass nach dem letzten Zitat beim nächsten Tippen wieder das erste Zitat erscheint, also ein Kreis entsteht, können wir das im `else`-Teil umsetzen:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Wenn `index` das letzte Element im Array erreicht hat, wird es beim nächsten Tippen wieder auf `0` zurückgesetzt, und die Zitate beginnen von vorne.

## Die Zitate-View verbessern

Die Logik für das Zitate-Karussell funktioniert jetzt bereits. Wir können die Oberfläche aber noch etwas schöner gestalten.

Vollständiger Code:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

In diesem Beispiel erhält die `Text`-View einen halbtransparenten weißen Hintergrund und abgerundete Ecken. Der `Button` verwendet den Stil `.borderedProminent`, und der `VStack` bekommt ein Hintergrundbild.

Zusatzwissen: Wenn der Modifikator `background()` mit einem Bild als Hintergrund verwendet wird, versucht SwiftUI standardmäßig, den verfügbaren Layoutbereich der aktuellen View möglichst auszufüllen. In vielen Fällen dehnt sich dieser Hintergrund dabei ganz natürlich bis in die Safe Area aus.

Damit haben wir die View für das Zitate-Karussell umgesetzt.

![SwiftUI View](../../RESOURCE/011_word.png)

## Zusammenfassung

In dieser Lektion haben wir gelernt, wie man mehrere Zitate mit einem Array speichert und mit `if` und `if-else` eine Zitate-Rotation aufbaut.

Außerdem haben wir grundlegende Array-Operationen wie Hinzufügen, Löschen und Ändern kennengelernt sowie gesehen, wie man Fehler durch ungültige Array-Indizes vermeidet.

Diese Lektion erklärt also nicht nur das Zitate-Karussell selbst, sondern verbindet es auch mit grundlegender Arbeit mit Daten und Programmflusssteuerung.

## Erweiterung - Mehrfachbedingungen mit if-else if-else

In der praktischen Entwicklung muss man häufig mehrere Bedingungen verarbeiten. Zum Beispiel könnte in einem Spiel bei einem Punktestand von `1` ein Ereignis A ausgelöst werden, bei `2` ein Ereignis B, bei `3` ein Ereignis C und so weiter.

Sobald es mehr als zwei mögliche Verzweigungen gibt, verwendet man dafür `if-else if-else`.

Grundsyntax:

```swift
if conditionA {
    // Code, wenn conditionA true ist
} else if conditionB {
    // Code, wenn conditionB true ist
} else if conditionC {
    // Code, wenn conditionC true ist
} else {
    // Code, wenn keine Bedingung erfüllt ist
}
```

In diesem Fall prüft das Programm die Bedingungen der Reihe nach und führt den Code der ersten erfüllten Bedingung aus. Wenn keine Bedingung erfüllt ist, wird der `else`-Teil ausgeführt.

Auch im Zitate-Karussell könnte man `if-else if-else` für Mehrfachprüfungen verwenden:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Wenn `index` `0`, `1`, `2` oder `3` ist, erhöht ein Tippen auf den Button jeweils um `1`. Wenn `index` `4` ist, also das letzte Element, wird `index` wieder auf `0` gesetzt, sodass ein Kreis entsteht.

Der `else`-Zweig dient hier als Absicherung für ungültige Werte, zum Beispiel wenn `index` versehentlich falsch verändert wurde.

Wichtig ist außerdem: Das hier verwendete `==` prüft, ob zwei Werte gleich sind. Wenn `if` feststellt, dass `index` genau dem angegebenen Wert entspricht, liefert die Bedingung `true`, und der zugehörige Block wird ausgeführt. Andernfalls wird die nächste Bedingung geprüft.

Solche Mehrfachabfragen sind hilfreich, wenn in verschiedenen Situationen auch wirklich unterschiedlicher Code ausgeführt werden soll.
