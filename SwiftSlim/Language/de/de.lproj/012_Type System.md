# Das Typsystem

In den vorherigen Lektionen haben wir bereits Variablen kennengelernt und gesehen, dass Variablen Daten unterschiedlicher Typen speichern können.

Zum Beispiel:

```swift
var hello = "Hello, World"
```

Hier speichert `hello` einen Text, deshalb ist sein Typ `String`.

Als Nächstes lernen wir systematisch das Konzept von Typen (`Type`) sowie explizite Typdeklaration und Typinferenz kennen, damit wir das Wesen von Variablen besser verstehen.

## Was ist ein Typ?

In Swift hat jeder Wert einen eindeutigen Typ. Der Typ bestimmt, was dieser Wert ist und was man mit ihm tun kann.

Zum Beispiel:

- `42` ist ein `Int` (ganze Zahl)
- `"Hello"` ist ein `String` (Zeichenkette)
- `true` ist ein `Bool` (Boolescher Wert)

Diese Werte gehören zu unterschiedlichen Typen und haben deshalb unterschiedliche Einsatzbereiche.

## Häufige grundlegende Typen in Swift

In der Anfangsphase begegnen uns vor allem diese Typen:

- `String`: Zeichenkette, also Text
- `Int`: ganze Zahl
- `Double`: Fließkommazahl mit Nachkommastellen und höherer Genauigkeit
- `Bool`: boolescher Wert (`true`/`false`)

Daneben gibt es noch `Float` (ebenfalls eine Fließkommazahl, aber mit geringerer Genauigkeit als `Double`) sowie `Character` für einzelne Zeichen wie `"A"` oder `"!"`.

### Typdeklaration (expliziter Typ)

In Swift kann man beim Deklarieren einer Variablen den Typ auch von Hand angeben:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Der Typ einer Variablen wird also über `: Typ` hinter dem Variablennamen angegeben.

Für Arrays schreibt man den Typ als `: [Typ]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

In diesem Beispiel kann das Array `scores` nur Elemente vom Typ `Int` speichern, und `tags` nur Elemente vom Typ `String`.

Eine explizite Typdeklaration macht die Absicht des Codes deutlicher und verhindert in manchen Fällen Fehler bei der Typinferenz.

## Typinferenz

In vielen Fällen muss der Typ aber gar nicht explizit angegeben werden:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"] // [String]
```

Das liegt daran, dass der Swift-Compiler den Typ anhand des Anfangswerts automatisch ableitet.

## Explizite Deklaration und Typinferenz

In den vorherigen Lektionen haben wir keine expliziten Typen eingeführt, etwa:

```swift
var age: Int = 18
```

sondern zunächst lieber Typinferenz verwendet:

```swift
var age = 18
```

In diesem Beispiel sind beide Schreibweisen gleichwertig. In beiden Fällen wird `age` als `Int` bestimmt. Die Schreibweise mit Typinferenz ist allerdings kürzer.

Dass wir am Anfang die explizite Typdeklaration nicht betont haben, liegt daran, dass Typinferenz überflüssige Zusatzinformationen im Code reduziert und so die Einstiegshürde für Anfängerinnen und Anfänger senkt.

## Warum brauchen wir Typen?

Swift ist eine stark typisierte Sprache (`Strongly Typed Language`).

Das bedeutet: Sobald der Typ einer Variablen feststeht, kann er nicht beliebig geändert werden.

Zum Beispiel:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Das erste `20` ist ein `Int` und kann deshalb `age` zugewiesen werden. Das zweite `"20"` ist jedoch ein `String` und passt nicht zum Typ `Int`, daher entsteht ein Fehler.

`nums` ist ein Array vom Typ `[Int]` und darf deshalb nur ganze Zahlen enthalten, nicht gemischt mit Zeichenketten.

Typen setzen also Grenzen für die Verwendung von Daten und helfen dabei, Typfehler schon beim Kompilieren zu erkennen. Dadurch werden Fehler reduziert, die Stabilität verbessert und der Code leichter wartbar.

## Wann muss der Typ explizit angegeben werden?

Obwohl Swift Typen automatisch ableiten kann, gibt es Fälle, in denen der Compiler den Typ nicht erkennen kann oder falsch ableiten würde. Dann muss der Typ manuell angegeben werden.

**1. Leere Arrays**

Beim Erstellen eines leeren Arrays ist eine explizite Typangabe zwingend nötig:

```swift
var nums: [Int] = []
```

Wenn man den Typ nicht angibt:

```swift
var nums = []   // Error, Empty collection literal requires an explicit type
```

dann kann der Compiler aus einem leeren Array nicht erkennen, welchen Elementtyp das Array haben soll. Deshalb entsteht ein Compilerfehler.

**2. Fehlerhafte Typinferenz vermeiden**

```swift
var value = 10   // Int
```

Obwohl `10` theoretisch auch eine Fließkommazahl sein könnte, interpretiert der Compiler sie wegen des fehlenden Dezimalpunkts standardmäßig als `Int`.

Wenn `value` aber als Fließkommazahl gemeint ist, muss der Typ explizit angegeben werden:

```swift
var value: Double = 10   // Double
```

Wenn das Ergebnis der Typinferenz also nicht dem entspricht, was du erwartest, solltest du den Typ explizit angeben oder den Literalwert anpassen.

**3. Eigene Typen**

Später lernen wir auch eigene Typen kennen. Wenn diese verwendet werden, ist ebenfalls oft eine explizite Typdeklaration nötig:

```swift
var info: GameInfo
var users: [User] = []
```

Der Grund ist derselbe wie bei leeren Arrays: Aus einem leeren Wert kann der Compiler den Typ nicht automatisch ableiten.

## Typumwandlung

In Swift werden unterschiedliche Typen nicht automatisch ineinander umgewandelt. Die Konvertierung muss immer explizit erfolgen.

Zum Beispiel bei der Addition zweier Zahlen unterschiedlicher Typen:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Hier ist `a` vom Typ `Int`, `b` vom Typ `Double`. Da die Typen unterschiedlich sind, kann nicht direkt gerechnet werden.

Vor der Rechnung muss deshalb einer der beiden Werte in denselben Typ umgewandelt werden:

```swift
var result = Double(a) + b
```

Dieser Code wandelt `a` vom Typ `Int` in `Double` um und addiert es danach mit `b`. Das Ergebnis wird in `result` gespeichert.

Wichtig dabei ist: Eine Typumwandlung ändert nicht den Typ der ursprünglichen Variable. `Double(a)` verändert also nicht den Typ von `a`, sondern erzeugt nur einen neuen `Double`-Wert für die Berechnung.

Andere Typen lassen sich auf ähnliche Weise umwandeln, also durch Zieltyp plus `()` und dem zu konvertierenden Wert als Argument:

```text
Int()、Double()、String()
```

Beispiele:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int, 9
```

Wichtig ist außerdem: Nicht jede Umwandlung verhält sich exakt so, wie man vielleicht erwartet. Bei `Double → Int` wird der Nachkommateil zum Beispiel einfach abgeschnitten und nicht gerundet.

## Typalias

In Swift kann man vorhandenen Typen auch einen anderen Namen geben, um die Bedeutung im Code klarer zu machen:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Hier ist `UserID` im Kern weiterhin ein `Int`. Der Typ selbst ändert sich also nicht, aber der Name macht den Zweck deutlicher.

In größeren Projekten mit komplexeren Typen können Typalias den Code deutlich lesbarer machen.

## Typbeispiel

Im Folgenden sehen wir an einem einfachen Beispiel, welche Rolle Typen in der praktischen Entwicklung spielen.

### Eine Variable erstellen

Zuerst erzeugen wir eine Variable `age`:

```swift
var age = 20
```

Da diese Variable in SwiftUI angezeigt und verändert werden soll, müssen wir sie mit `@State` deklarieren:

```swift
@State private var age = 20
```

`private` wurde schon früher erwähnt und bedeutet hier, dass diese Variable nur in der aktuellen View verwendet werden kann. Später werden wir das genauer kennenlernen.

### Daten in SwiftUI anzeigen

So zeigen wir die Variable `age` in SwiftUI an:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Jetzt zeigt die View:

```swift
age: 20
```

### Daten verändern

Als Nächstes fügen wir zwei Buttons hinzu, um `age` zu verändern:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Ausführungsergebnis

Wenn du auf `changeAge1` tippst, wird `age` auf `18` gesetzt:

```swift
age = 18
```

Da `18` ein `Int` ist und damit zum Typ von `age` passt, funktioniert die Zuweisung.

`changeAge2` erzeugt dagegen einen Fehler:

```swift
age = "18"
```

Fehlermeldung:

```text
Cannot assign value of type 'String' to type 'Int'
```

Der Grund ist, dass `"18"` ein `String` ist, weil Zeichenketten in `""` geschrieben werden. `age` ist aber ein `Int`. Die Typen passen also nicht zusammen.

### Warum tritt der Fehler auf?

Der Schlüssel liegt in dieser Zeile:

```swift
@State private var age = 20   // Int
```

Auch ohne explizite Typangabe erkennt der Compiler anhand des Anfangswerts `20`, dass `age` ein `Int` sein muss.

Sobald der Typ festgelegt ist, darf später kein Wert eines anderen Typs mehr zugewiesen werden.

Außerdem ist wichtig: Der Fehler bei `changeAge2` tritt nicht erst zur Laufzeit auf, sondern bereits während der Kompilierung. Der Code kann also gar nicht erfolgreich gebaut werden.

Das ist einer der Vorteile von Swifts starker Typisierung: Typfehler werden schon beim Schreiben des Codes erkannt.

### Richtige Schreibweise

Wenn wir den fehlerhaften Code entfernen:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Dann wird beim Tippen auf `changeAge1` die View zu:

```text
age: 18
```

### Explizite Typdeklaration (optional)

Du kannst den Typ auch beim Definieren ausdrücklich angeben:

```swift
@State private var age: Int = 20
```

Diese Schreibweise macht den Typ klarer sichtbar, ist in einfachen Szenarien aber nicht zwingend notwendig.

## Zusammenfassung

In dieser Lektion ging es hauptsächlich um das Typsystem von Swift und seine Rolle in der praktischen Entwicklung.

In Swift hat jeder Wert einen klaren Typ. Der Typ bestimmt, was die Daten bedeuten und welche Operationen mit ihnen möglich sind.

Swift ist stark typisiert. Sobald der Typ einer Variablen festgelegt ist, kann ihr kein anderer Typ mehr zugewiesen werden. Diese Einschränkung ermöglicht es, Fehler schon während der Kompilierung zu finden, wodurch Laufzeitprobleme reduziert und die Sicherheit des Codes erhöht werden.

Der Typ einer Variablen kann automatisch aus dem Anfangswert abgeleitet oder explizit angegeben werden. In bestimmten Situationen, zum Beispiel bei leeren Arrays, fehlerhafter Typinferenz oder eigenen Typen, kann der Compiler den Typ nicht korrekt ableiten. Dann ist eine explizite Typdeklaration notwendig.

Unterschiedliche Typen können nicht automatisch ineinander umgewandelt werden, sondern müssen mit `Int()`, `Double()`, `String()` und ähnlichen Konstruktoren explizit konvertiert werden.

Typen unterstützen außerdem Aliasnamen. Gerade in komplexeren Projekten können Typalias die Lesbarkeit verbessern.

Typen sind also nicht nur ein Etikett für Daten, sondern auch ein Mechanismus der Einschränkung. Dadurch wird sichergestellt, dass Daten sicher, eindeutig und kontrollierbar verwendet werden.

## Erweiterung - Optionale Typen

Bei manchen Typumwandlungen kann die Konvertierung fehlschlagen.

Zum Beispiel bei der Umwandlung von `String` in `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Hier liefert `Double(input)` nicht `Double`, sondern:

```text
Double?
```

Das ist ein optionaler Typ (`Optional`).

### Warum wird ein Optional zurückgegeben?

Weil der Inhalt einer Zeichenkette ungewiss ist. `"3.14"` kann in einen `Double` umgewandelt werden, `"Hello"` aber nicht.

Das heißt: Diese Operation kann erfolgreich sein, aber auch fehlschlagen.

Deshalb verwendet Swift optionale Typen, um genau diese Unsicherheit auszudrücken.

### Was ist ein optionaler Typ?

Ein optionaler Typ bedeutet: Ein Wert kann vorhanden sein, muss es aber nicht.

Zum Beispiel:

```text
Double?
```

Dieser Typ bedeutet: Wenn ein Wert vorhanden ist, sieht man beim Ausgeben `Optional(...)`; wenn kein Wert vorhanden ist, erhält man `nil`.

Wichtig ist: `nil` bedeutet "kein Wert" und nicht `0` oder ein leerer String.

### Beispiel

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Ausgabe:

```text
pi:Optional(3.14)
```

Das zeigt, dass die Zeichenkette erfolgreich in einen `Double` konvertiert wurde und den Wert `3.14` ergibt. Da der Typ aber `Double?` ist, wird der Wert in `Optional` eingepackt angezeigt.

Wenn die Umwandlung fehlschlägt:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Ausgabe:

```text
pi: nil
```

Da `"Hello"` nicht in `Double` umgewandelt werden kann, schlägt die Konvertierung fehl und gibt `nil` zurück.

### Was bedeutet Optional(...)?

Wenn wir einen optionalen Typ direkt ausgeben:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

dann zeigt Swift dessen "Debug-Beschreibung":

```text
Optional(3.14)
```

Das ist kein Teil der eigentlichen Daten, sondern lediglich ein Hinweis darauf, dass der aktuelle Wert ein Optional ist und innen einen Wert enthält.

### Optionals entpacken

In der Praxis möchten wir meistens den tatsächlichen Wert aus einem Optional herausholen. Dieser Vorgang heißt Entpacken (`Unwrapping`).

Eine häufige Methode ist die Verwendung von `??`, um einen Standardwert bereitzustellen:

```text
??
```

Das nennt man den Nil-Coalescing-Operator.

Zum Beispiel:

```swift
name ?? "FangJunyu"
```

Dieser Code bedeutet: Wenn `name` einen Wert hat, wird dieser Wert verwendet. Wenn `name` `nil` ist, wird stattdessen der Standardwert `"FangJunyu"` verwendet.

Wichtig ist, dass der Standardwert denselben Typ haben muss wie der Wert im Optional.

### Mit ?? einen Standardwert bereitstellen

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

Ausgabe:

```text
pi: 30
```

`input` wird hier erfolgreich in einen `Double` umgewandelt und ausgegeben. Wenn die Umwandlung fehlschlagen würde, käme stattdessen der mit `??` angegebene Standardwert zum Einsatz.

Wenn die Umwandlung fehlschlägt:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Ausgabe:

```text
pi: 10
```

Hier scheitert die Umwandlung in `Double` und liefert `nil`. Daraufhin stellt `??` den Standardwert bereit.

Optionale Typen werden verwendet, um Situationen auszudrücken, in denen ein Wert vorhanden sein kann, aber nicht vorhanden sein muss.

Bei potenziell fehlschlagenden Operationen wie Typumwandlungen gibt Swift deshalb einen optionalen Typ zurück, um die Sicherheit des Programms zu gewährleisten.

Wenn wir den enthaltenen Wert verwenden möchten, können wir über `??` einen Standardwert bereitstellen und dadurch auch im Fall von `nil` noch ein sinnvolles Ergebnis erhalten.
