# Operatoren

In dieser Lektion lernen wir Swift-Operatoren (`Operators`) kennen.

Immer wenn wir rechnen, vergleichen oder logische Entscheidungen treffen, benötigen wir Operatoren. Solche Vorgänge durchziehen die gesamte Programmausführung und gehören zu den grundlegendsten Fähigkeiten beim Programmieren.

```swift
let a = 100 * 8
```

Viele Menschen stellen beim Lernen des Programmierens fest: Wer ein gewisses mathematisches Denkvermögen mitbringt, versteht Programmlogik oft leichter. Das liegt daran, dass Programmierung im Kern immer mit Berechnung und Regelentscheidungen zu tun hat, und genau dafür sind Operatoren da.

In der praktischen Entwicklung werden Operatoren nicht nur für einfache Zahlenrechnungen verwendet, sondern in vielen konkreten Szenarien.

Zum Beispiel in einem Blockspiel: Wenn ein Benutzer einen Block an eine bestimmte Position zieht, muss das Programm berechnen:

- die Koordinatenposition des Blocks
- die mögliche Füllposition des Blocks
- ob die Zielposition gültig ist

Diese Prozesse aus "Berechnung + Entscheidung" basieren im Kern auf Operatoren.

![Block](../../Resource/013_block.png)

Operatoren zu lernen bedeutet also nicht nur, Rechnen mit Zahlen zu lernen, sondern auch eine Grundlage für spätere Themen wie Layout, Datenverarbeitung und Interaktionslogik aufzubauen.

## Wie Berechnungen in SwiftUI ausgeführt werden

In SwiftUI wird Berechnungslogik typischerweise durch einen `Button` ausgelöst und dann in einer Funktion ausgeführt.

Zum Beispiel:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Wenn man auf den Button tippt, gibt die Console aus:

```text
c: 20
```

In dieser Lektion schreiben wir die Rechenlogik einheitlich in `func`-Funktionen, lösen sie über Buttons aus und verwenden `print`, um die Ergebnisse auszugeben.

In den späteren Beispielen werden wir der Übersicht halber die Rechenergebnisse direkt im Code kommentieren und nicht jedes Mal zusätzlich `print` verwenden.

## Ausgabe in der Console verwalten

Da bei jedem Tippen neue Ausgaben erzeugt werden, kannst du unten rechts im Console-Bereich auf die Schaltfläche zum Leeren klicken, um alte Logs zu entfernen und aktuelle Ergebnisse leichter zu sehen.

![Console](../../Resource/013_console.png)

## Eine andere Schreibweise für Button

Wenn ein Button nur eine einzelne Funktion ausführt, kann eine kompaktere Schreibweise verwendet werden:

```swift
Button(action: ) {
    // View
}
```

In dieser Form legt `action` die Funktion fest, die beim Tippen aufgerufen wird, und der Block `{}` beschreibt die View des Buttons.

Mit der Funktion `calculate` von oben kann man also schreiben:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Wenn auf den Button getippt wird, wird `calculate` direkt ausgeführt.

Wenn die Button-Logik also einfach ist und nur eine einzelne Funktion aufgerufen werden soll, ist die Schreibweise mit `action` klarer und meist näher an gängigen Codekonventionen.

## Arithmetische Operatoren

Arithmetische Operatoren (`Arithmetic Operators`) werden für Zahlenberechnungen verwendet:

- `+` Addition
- `-` Subtraktion
- `*` Multiplikation
- `/` Division
- `%` Modulo, also Rest

Beispiele:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Wichtig ist, dass Swift eine stark typisierte Sprache ist und unterschiedliche Datentypen nicht automatisch mischt:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Wenn zwei Werte unterschiedliche Typen haben, muss der Typ manuell angepasst werden.

## Vergleichsoperatoren

Vergleichsoperatoren (`Comparison Operators`) werden verwendet, um die Beziehung zwischen zwei Werten zu prüfen. Das Ergebnis ist immer ein `Bool`.

- `==` gleich
- `!=` ungleich
- `>` größer als
- `<` kleiner als
- `>=` größer oder gleich
- `<=` kleiner oder gleich

Beispiele:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Vergleichsoperatoren werden häufig in Bedingungen verwendet. Zum Beispiel mussten wir im "Zitate-Karussell" sicherstellen, dass der Index nicht über den gültigen Array-Bereich hinausgeht:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Wenn `index` kleiner als `sayings.count - 1` ist, ergibt der Vergleich `true`, und der Code im `if`-Block wird ausgeführt. Wenn das Ergebnis `false` ist, wird der folgende Code nicht ausgeführt.

## Logische Operatoren

Logische Operatoren (`Logical Operators`) werden verwendet, um mehrere Bedingungen zu kombinieren:

- `&&` und (`AND`)
- `||` oder (`OR`)
- `!` nicht (`NOT`)

### && und

Wenn mehrere Bedingungen gleichzeitig erfüllt sein müssen, verwendet man `&&`.

Zum Beispiel:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

In diesem Code gibt es zwei Bedingungen: `age >= 18` und `age <= 100`.

Nur wenn beide Bedingungen `true` sind, wird `legalAge` ebenfalls `true`. Sobald eine Bedingung nicht erfüllt ist, wird das Ergebnis `false`.

### || oder

Wenn von mehreren Bedingungen nur eine einzige erfüllt sein muss, verwendet man `||`.

Zum Beispiel:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Dieser Code bedeutet: Sobald entweder `money >= 50` oder `creditCard >= 50` erfüllt ist, wird `payAllowed` `true`.

Nur wenn beide Bedingungen nicht erfüllt sind, ist das Ergebnis `false`.

Im Zahlungsszenario kann zum Beispiel entweder mit Bargeld oder mit Kreditkarte bezahlt werden. Wenn beides nicht ausreicht, scheitert die Zahlung.

### ! nicht

`!` ist der logische Nicht-Operator (`NOT`) und kehrt einen `Bool`-Wert um.

Man kann sich das so vorstellen: `!` macht aus `true` ein `false` und aus `false` ein `true`.

Zum Beispiel:

```swift
let allowed = true
let result = !allowed   // false
```

Hier bedeutet `!allowed`, dass der Wert von `allowed` umgekehrt wird.

Wichtig ist: `!` und `!=` sind zwei unterschiedliche Operatoren. `!` negiert einen Bool-Wert, während `!=` zwei Werte vergleicht und ein Bool-Ergebnis zurückgibt.

## Zuweisungsoperatoren

Zuweisungsoperatoren (`Assignment Operators`) werden verwendet, um Variablen Werte zuzuweisen oder zu aktualisieren:

- `=` Zuweisung

Sowohl bei Variablendeklarationen als auch bei Berechnungen tritt Zuweisung ständig auf:

```swift
let a = 5
```

Dieser Code bedeutet, dass der Wert `5` der Variablen `a` zugewiesen wird.

### Zusammengesetzte Zuweisungsoperatoren

In der Praxis verwendet man neben dem einfachen Zuweisungsoperator auch häufig zusammengesetzte Zuweisungsoperatoren, um direkt auf Basis des bisherigen Werts zu rechnen und gleichzeitig zu aktualisieren:

- `+=`
- `-=`
- `*=`
- `/=`

Im Kapitel über den Zähler haben wir solche zusammengesetzten Zuweisungsoperatoren bereits kurz kennengelernt.

Zum Beispiel, wenn ein Wert beim Tippen auf einen Button automatisch erhöht werden soll:

```swift
var num = 10
num += 5   // num = 15
```

Dieser Code bedeutet: `num` wird mit `5` addiert, und das Ergebnis wird wieder in `num` gespeichert.

Das ist gleichbedeutend mit:

```swift
var num = 10
num = num + 5   // num = 15
```

## Ternärer Operator

Der ternäre Operator (`Ternary Operator`) prüft in Swift eine Bedingung und gibt einen von zwei möglichen Werten zurück:

```swift
Bedingung ? Wert1 : Wert2
```

Seine Logik lautet: Wenn die Bedingung `true` ist, wird `Wert1` zurückgegeben, andernfalls `Wert2`.

Zum Beispiel:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Dieser Code prüft den Wert von `showColor`: Wenn er `true` ist, wird `Color.blue` zurückgegeben, und der Hintergrund ist blau. Wenn er `false` ist, wird `Color.clear` verwendet, also kein sichtbarer Hintergrund.

Hinweis: `Color.clear` bedeutet eine transparente Farbe.

### Unterschied zu if-else

Der ternäre Operator ist logisch gleichwertig zu einer `if-else`-Anweisung.

Zum Beispiel kann der obige Code auch so geschrieben werden:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Die Logik ist identisch: Wenn die Bedingung `true` ist, wird das erste Ergebnis verwendet, andernfalls das zweite.

In der Praxis ist der ternäre Operator knapper und besonders geeignet für einfache "entweder-oder"-Entscheidungen, wenn direkt ein Wert zurückgegeben werden soll.

Beim Aufbau von SwiftUI-Views ist der ternäre Operator sehr häufig. Zum Beispiel:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Mit dieser Schreibweise kann der Effekt einer View in einer einzigen Zeile abhängig von einer Bedingung verändert werden.

## Bereichsoperatoren

Bereichsoperatoren (`Range Operators`) werden verwendet, um Wertebereiche darzustellen:

- `...` geschlossener Bereich, also inklusive beider Enden
- `..<` halboffener Bereich, also ohne das rechte Ende

Zum Beispiel:

```text
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Man kann sich das so vorstellen: `1...3` bedeutet von 1 bis 3, inklusive 3; `5..<8` bedeutet von 5 bis 8, aber ohne die 8.

Erweiterte Formen, nur zum Einordnen:

```text
5...    // >= 5
...5    // <= 5
```

Diese Schreibweise nennt man einseitige Bereiche. Sie werden oft in Bedingungen oder beim Pattern Matching verwendet.

Bereichsoperatoren werden später besonders beim Lernen von `for`-Schleifen wichtig. Für den Moment reicht es, sie als Darstellung eines zusammenhängenden Zahlenbereichs zu verstehen.

## Operatoren üben

Im Folgenden üben wir die Wirkung von Operatoren an ein paar einfachen Beispielen in einer View.

### 1. Gesamtzahl der Fahrzeuge berechnen

Nehmen wir an, an einer bestimmten Kreuzung fahren pro Tag 500 Fahrzeuge vorbei. Berechne die Gesamtzahl für 30 Tage.

Dafür verwenden wir Rechenoperatoren:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Die Rechnung lautet hier: 500 Fahrzeuge pro Tag, über 30 Tage also `500 × 30`, insgesamt `15000` Fahrzeuge.

### 2. In-App-Mitgliedschaft prüfen

Wir können prüfen, ob eine Person In-App-Mitglied ist. Sobald entweder eine Lifetime-Mitgliedschaft oder ein Abonnement aktiv ist, gilt die Person als Mitglied.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Dieser Code verwendet den `||`-Operator (`oder`): `lifeTime = false` bedeutet, es gibt keine Lifetime-Mitgliedschaft; `subscription = true` bedeutet, ein Abonnement ist aktiv.

Da nur eine der beiden Bedingungen erfüllt sein muss, wird `isMember` `true`. Die Person ist also Mitglied.

## Zusammenfassung

In Swift sind Operatoren die Grundlage für Datenberechnung und logische Entscheidungen. Genauso wie `Text` Inhalte anzeigt, dienen Operatoren dazu, Daten selbst zu verarbeiten.

Von einfachen Zahlenberechnungen über komplexe logische Prüfungen bis hin zu Zustandssteuerung und Layoutberechnungen in Views sind Operatoren überall beteiligt.

Durch Übungen in unterschiedlichen Szenarien kann man sich Schritt für Schritt mit den in dieser Lektion vorgestellten Operatoren vertraut machen. Das ist eine wichtige Grundlage für das weitere Lernen.

### Erweiterung - Bitweise Operatoren

Swift bietet außerdem eine niedrigere Ebene von Operatoren: bitweise Operatoren (`Bitwise Operators`):

- `&` bitweises UND
- `|` bitweises ODER
- `^` bitweises XOR
- `~` bitweises NICHT
- `>>` Rechtsverschiebung
- `<<` Linksverschiebung

Zum Beispiel:

```swift
let a = 6  // binär 110
let b = 3  // binär 011

print(a & b) // 2 (binär 010)
print(a | b) // 7 (binär 111)
print(a ^ b) // 5 (binär 101)
print(~a)    // -7 (Negation)
```

In Swift werden Ganzzahlen intern im Zweierkomplement dargestellt. Deshalb ergibt eine bitweise Negation einen entsprechenden negativen Wert.

Bitweise Operatoren arbeiten direkt auf Binärdaten und werden meist in systemnaher Datenverarbeitung oder in Performance-Optimierungsszenarien eingesetzt.

Für Anfängerinnen und Anfänger kommen diese Operatoren nur selten zum Einsatz, und auch in normaler iOS- oder SwiftUI-Entwicklung sind sie nicht besonders häufig. Deshalb vertiefen wir sie hier nicht weiter.

Wenn wir später mit systemnäherer Logik oder Leistungsoptimierung arbeiten, kann man darauf noch einmal gezielt zurückkommen.
