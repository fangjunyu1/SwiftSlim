# Den Sparschwein-Betrag speichern

In der letzten Lektion haben wir ein einfaches Sparschwein gebaut. In dieser Lektion lernen wir, wie der Betrag des Sparschweins dauerhaft gespeichert werden kann.

Im Mittelpunkt stehen `UserDefaults` und der Property Wrapper `@AppStorage`. Außerdem sehen wir uns die Rolle von `onAppear` und die Verwendung optionaler Typen (`nil`) genauer an.

Wichtig ist: Für diese Lektion verwenden wir den Code des Sparschweins aus der vorherigen Lektion weiter.

## Das Problem mit dauerhafter Speicherung

Die Oberfläche des Sparschweins ist inzwischen sehr einfach und bequem zu verwenden.

![Piggy Bank](../../Resource/014_view.png)

Es gibt jedoch ein deutliches Problem: Jedes Mal, wenn die View aktualisiert oder die App geschlossen wird, springt der Gesamtbetrag des Sparschweins wieder auf `0`, und der bisherige Betrag geht komplett verloren.

Das bedeutet, dass die Daten nicht wirklich gespeichert wurden. Anders gesagt: Das aktuelle Sparschwein speichert nur temporäre Daten.

### Warum wird der Wert nicht dauerhaft gespeichert?

Der Grund liegt in dieser mit `@State` deklarierten Variablen:

```swift
@State private var amount = 0
```

Eine mit `@State` deklarierte Variable hängt vollständig vom Lebenszyklus der View ab.

Wenn die View erstellt wird, wird `amount` mit `0` initialisiert. Wenn die View zerstört wird, wird auch `amount` zerstört.

Das bedeutet: Der in `amount` gespeicherte Wert existiert nur im Arbeitsspeicher und wird nicht auf dem Gerät gesichert.

Wenn wir nicht möchten, dass `amount` an den Lebenszyklus der View gebunden ist, brauchen wir dauerhafte Datenspeicherung. Anders gesagt: Wir müssen die Daten auf dem Gerät ablegen.

### Was bedeutet "Persistenz"?

Persistenz kann man so verstehen, dass Daten aus dem temporären Speicher in den Gerätespeicher geschrieben werden.

Wenn eine View oder die App geschlossen wird, gehen die Daten dann nicht verloren.

In Swift kann einfache Persistenz mit `UserDefaults` umgesetzt werden. Für komplexere Daten verwendet man eher `SwiftData` oder `CoreData`.

In dieser Lektion lernen wir zunächst die einfachste Form: `UserDefaults`.

## UserDefaults

`UserDefaults` wird verwendet, um kleine Mengen von Schlüssel-Wert-Daten zu speichern und eignet sich häufig für grundlegende Typen wie `String`, `Int`, `Double` oder `Bool`.

### Daten speichern

Mit der Methode `set` speichert `UserDefaults` Daten:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Der erste Parameter ist der zu speichernde Wert, hier also Daten vom Typ `String`, `Int` und so weiter.

Der zweite Parameter `forKey` funktioniert wie ein Variablenname und dient dazu, den gespeicherten Wert in `UserDefaults` zu identifizieren.

### Daten lesen

Zum Lesen verwendet `UserDefaults` typabhängige Methoden:

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")    // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")    // true
```

Beim Lesen muss die passende Methode zum Datentyp verwendet werden, sonst erhält man Fehler oder falsche Daten.

### Hinweise zu UserDefaults

#### 1. Rückgabe optionaler Typen

Beim Lesen von Daten aus `UserDefaults` liefern manche Methoden einen optionalen Typ (`Optional`) zurück.

Zum Beispiel:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Der Typ von `name` ist dann:

```text
String?
```

Das bedeutet, dass ein Wert vorhanden sein kann, aber nicht vorhanden sein muss.

**Warum wird ein Optional zurückgegeben?**

Weil für einen bestimmten Key in `UserDefaults` nicht zwangsläufig überhaupt ein Wert existiert.

Zum Beispiel:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Wenn für `"City"` nie etwas gespeichert wurde, lautet das Ergebnis:

```text
nil
```

Wichtig ist: `nil` bedeutet, dass kein Wert vorhanden ist, und nicht etwa ein leerer String.

Im Kapitel über das Typsystem sind wir bereits auf eine ähnliche Situation gestoßen: Wenn eine Typumwandlung fehlschlägt, erhält man ebenfalls einen optionalen Typ.

Dann können wir mit `??` einen Standardwert angeben und das Optional entpacken:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

Wenn `UserDefaults` einen Wert liefert, wird dieser verwendet; wenn kein Wert vorhanden ist (`nil`), wird stattdessen der Standardwert genommen.

#### 2. Rückgabe nicht-optionaler Typen

Wenn `UserDefaults` Werte vom Typ `Int`, `Double` oder `Bool` liest, werden keine Optionalen zurückgegeben.

Zum Beispiel:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")    // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")    // false
```

Selbst wenn für diese Keys nie ein Wert gespeichert wurde, ist das Ergebnis nicht `nil`.

Stattdessen werden Standardwerte geliefert:

```text
Int → 0
Double → 0.0
Bool → false
```

#### 3. Begrenzung der Datenmenge

`UserDefaults` eignet sich nur für kleine Datenmengen, zum Beispiel App-Einstellungen oder einfache Zustände.

Für große Datenmengen oder sehr häufige Lese- und Schreibvorgänge ist es in der Praxis nicht geeignet.

## Den Sparschwein-Betrag speichern

Jetzt können wir mit `UserDefaults` die Logik umsetzen, um den Gesamtbetrag des Sparschweins zu sichern.

Wenn die Nutzerin oder der Nutzer auf den Button tippt, wird der eingegebene Betrag zum Gesamtbetrag addiert und anschließend in `UserDefaults` gespeichert.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

Damit haben wir nun die Logik zum Schreiben der Daten umgesetzt.

## Erklärung der Persistenzlogik

Obwohl das Schreiben der Daten jetzt funktioniert, bemerkt man beim Ausführen immer noch: Nach einem Neuladen der View oder dem erneuten Öffnen der App bleibt `amount` nicht erhalten, sondern ist wieder `0`.

Der Grund ist:

```swift
@State private var amount = 0
```

In SwiftUI wird eine `@State`-Variable beim Erstellen der View erneut initialisiert.

Obwohl der Wert von `amount` in `UserDefaults` gespeichert wurde, wird `amount` beim erneuten Laden der View zunächst wieder auf `0` gesetzt.

Das bedeutet: Bisher haben wir die Daten zwar in `UserDefaults` geschrieben, aber noch nicht in die View zurückgeladen.

Deshalb müssen wir beim Laden der View zusätzlich den Wert aus `UserDefaults` lesen und wieder `amount` zuweisen. Erst dann ist die Persistenzlogik vollständig.

### Logischer Vergleich

Man kann diesen Vorgang mit einer Tafel im Klassenraum vergleichen:

Während des Unterrichts schreibt die Lehrkraft Inhalte an die Tafel. Diese Inhalte entsprechen dem aktuellen View-Zustand (`@State`).

Nach dem Unterricht wird die Tafel abgewischt, um Platz für die nächste Stunde zu schaffen. Das entspricht dem Zerstören der View, wodurch auch die in `@State` gespeicherten Daten verschwinden.

Damit der Inhalt nicht verloren geht, speichert die Lehrkraft ihn vorher in Unterrichtsmaterialien. Diese Materialien entsprechen den in `UserDefaults` gespeicherten Daten.

Wenn die nächste Stunde beginnt, ist die Tafel wieder leer (`@State` wird neu initialisiert). Die Lehrkraft muss den Inhalt anhand der Unterrichtsmaterialien erneut an die Tafel schreiben, also die Daten aus `UserDefaults` lesen.

Wichtig dabei ist: Die Tafel stellt den vorherigen Inhalt nicht von selbst wieder her. Sie muss aktiv aus den gespeicherten Materialien neu beschrieben werden.

## Daten mit onAppear lesen

Wenn die View erscheint, müssen wir den Wert aus `UserDefaults` lesen und der `@State`-Variablen `amount` zuweisen, damit echte Persistenz entsteht.

In SwiftUI lässt sich mit `onAppear` Logik ausführen, sobald eine View erscheint:

```swift
.onAppear {}
```

Wir setzen den Code zum Lesen aus `UserDefaults` in `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Wenn die View erstellt wird, startet `amount` zunächst mit `0`. Sobald die View sichtbar wird, wird `onAppear` ausgelöst und der gespeicherte Wert aus `UserDefaults` gelesen und `amount` zugewiesen. Dadurch zeigt die View wieder den zuletzt gespeicherten Gesamtbetrag an.

Damit ist die Persistenzlogik des Sparschweins vollständig.

## Vollständiger Code

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Der Property Wrapper @AppStorage

SwiftUI stellt mit `@AppStorage` einen Property Wrapper bereit, der die Arbeit mit `UserDefaults` vereinfacht.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` ist im Grunde eine Kapselung um `UserDefaults`, wobei `"amount"` dem Key in `UserDefaults` entspricht.

Wenn die View erstellt wird, liest `@AppStorage` den Wert automatisch aus `UserDefaults`. Wenn sich die Variable ändert, wird der neue Wert automatisch zurückgeschrieben.

Es ist außerdem mit dem SwiftUI-Zustandssystem verbunden. Genau wie `@State` sorgt eine Änderung dafür, dass die SwiftUI-View aktualisiert wird.

Das bedeutet: Mit `@AppStorage` brauchen wir weder manuell `UserDefaults` aufzurufen noch mit `onAppear` selbst zu lesen und zu schreiben.

Wir können also `UserDefaults` im Code durch `@AppStorage` ersetzen:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Zusammenfassung

In dieser Lektion haben wir vor allem Folgendes gelernt:

Zuerst haben wir gesehen, dass `UserDefaults` für die Speicherung kleiner Datenmengen geeignet ist. Wir haben `UserDefaults` verwendet, um den Gesamtbetrag auf dem Gerät zu speichern. Dabei mussten wir uns auch mit Lesen, Schreiben und optionalen Rückgabewerten beschäftigen.

Außerdem haben wir verstanden, dass eine `@State`-Variable nur für temporäre Zustände in einer View gedacht ist und denselben Lebenszyklus wie die View hat. Wenn die View neu erstellt wird, wird auch `@State` neu initialisiert.

Beim Wiederherstellen der Daten aus `UserDefaults` haben wir gelernt, mit `onAppear` beim Anzeigen der View gespeicherte Daten einzulesen.

Schließlich haben wir `@AppStorage` kennengelernt, mit dem `UserDefaults` ersetzt werden kann. Damit werden Werte beim Laden der View automatisch gelesen und bei Änderungen automatisch geschrieben, sodass man die manuelle Logik mit `UserDefaults` und `onAppear` nicht mehr selbst schreiben muss.

Mit diesem Wissen können wir eine grundlegende Datenspeicherung für Apps umsetzen, sodass Daten dauerhaft erhalten bleiben.

## Übungen nach der Lektion

Jetzt unterstützt das Sparschwein bereits das Speichern von Beträgen, aber die Funktion ist noch nicht vollständig.

1. Wenn Nutzerinnen und Nutzer Geld entnehmen möchten, braucht das Sparschwein eine entsprechende Abhebelogik.
2. Wenn der Betrag komplett geleert werden soll, muss zusätzlich eine Reset-Logik ergänzt werden.
3. Wenn das Sparschwein einen Namen bekommen soll, muss zusätzlich ein `String` gespeichert werden.

Auf dieser Grundlage kannst du die Funktionen weiter ausbauen und das Sparschwein vollständiger machen.

## Erweiterung - Problem mit dem Standardwert im Eingabefeld

Wir können die Interaktion des Eingabefelds jetzt noch weiter verbessern, damit die Eingabe bequemer wird.

![textfield](../../Resource/015_view.png)

Im aktuellen Stand ist der Standardwert des Eingabefelds `0`. Das bedeutet, dass die Nutzerin oder der Nutzer vor jeder Eingabe zuerst die `0` löschen muss. Diese Interaktion ist nicht besonders angenehm.

Besser wäre es, wenn das Eingabefeld anfangs leer ist und nicht `0` anzeigt.

Der Grund liegt an der bidirektionalen Bindung zwischen `TextField` und `number`:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Wenn `number` mit `0` initialisiert wird, zeigt auch das Eingabefeld `0`.

Deshalb möchten wir `number` auf einen leeren Zustand setzen, also auf `nil`.

```swift
@State private var number = nil
```

Dann tritt allerdings ein Fehler auf:

```text
Generic parameter 'Value' could not be inferred
```

Genau das ist die Situation, die wir bereits im Kapitel über das Typsystem kennengelernt haben: Wenn ein Wert nicht automatisch typisiert werden kann, muss der Typ explizit angegeben werden.

Da `number` auf `nil` gesetzt wird und `nil` selbst keine Typinformation enthält, kann der Compiler nicht erkennen, ob die Variable ein `String`, `Int` oder etwas anderes sein soll. Deshalb entsteht ein Fehler.

Darum müssen wir den Typ von `number` explizit angeben:

```swift
@State private var number:Int? = nil
```

Hier bedeutet `Int?`, dass es sich um einen optionalen Typ handelt. `number` kann also entweder einen `Int` enthalten oder `nil` sein.

Wenn wir ihn auf diese Weise mit `nil` initialisieren, bleibt das Eingabefeld leer statt `0` anzuzeigen.

### Optionale Typen entpacken

Wenn `number` jetzt ein optionaler Typ ist, führt der bisherige Berechnungscode zu einem Fehler:

```swift
amount += number
```

Fehlermeldung:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Der Grund ist, dass `number` nun `nil` sein kann. Wenn wir direkt damit rechnen wollen, läuft es im Prinzip auf Folgendes hinaus:

```swift
amount += nil
```

Offensichtlich kann `nil` nicht zu `amount` addiert werden. Das ist also ungültig.

Deshalb muss ein optionaler Wert vor der Berechnung zuerst entpackt werden.

Hier können wir `??` mit einem Standardwert verwenden:

```swift
amount += number ?? 0
```

Wenn `number` `nil` ist, wird stattdessen `0` verwendet. Wenn `number` einen Wert enthält, wird der tatsächlich eingegebene Betrag verwendet.

So bleibt die Berechnung korrekt, und gleichzeitig erscheint das Eingabefeld anfangs leer, sodass die Nutzerin oder der Nutzer nicht jedes Mal zuerst die `0` löschen muss.

## Erweiterter Code

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
