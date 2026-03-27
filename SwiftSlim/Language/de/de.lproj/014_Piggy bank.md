# Sparschwein

In dieser Lektion entwickeln wir ein einfaches "Sparschwein"-Projekt. Die Funktion ist überschaubar, enthält aber bereits vollständige Interaktionslogik und eignet sich daher sehr gut für den Einstieg.

Mit diesem Projekt lernen wir `TextField` (Eingabefeld), `border` (Rahmen) und bekommen ein erstes Verständnis für Datenbindung über `$`.

Das Ziel ist ein "Sparschwein", bei dem ein Betrag eingegeben, per Button gespeichert und zum Gesamtbetrag addiert werden kann.

Ergebnis:

![Piggy Bank](../../RESOURCE/014_view.png)

## Gesamtbetrag anzeigen

Zuerst müssen wir in der View den Gesamtbetrag des Sparschweins anzeigen.

In `ContentView` deklarieren wir eine Variable, um diesen Gesamtbetrag zu speichern:

```swift
@State private var amount = 0
```

Danach zeigen wir den Betrag mit `Text` an:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Hier verwenden wir `.font` und `.fontWeight`, um die Schriftgröße und Schriftstärke festzulegen.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
```

Wenn sich `amount` ändert, wird der von `Text` angezeigte Gesamtbetrag automatisch aktualisiert.

## Betrag eingeben

Das Sparschwein soll den Gesamtbetrag nicht nur anzeigen, sondern den Nutzerinnen und Nutzern auch erlauben, einen Geldbetrag einzugeben. Dafür verwenden wir das SwiftUI-Steuerelement `TextField`.

### TextField

`TextField` ist in SwiftUI eine View zur Eingabe von Inhalten und wird in der Regel für einzeilige Eingaben verwendet.

`TextField` unterstützt hauptsächlich zwei Bindungsformen:

**1. Bindung an einen String**

```swift
TextField("Placeholder", text: $text)
```

Diese Form eignet sich für Namen, Titel und andere Texteingaben.

**2. Bindung an einen Zahlenwert**

```swift
TextField("Amount", value: $number, format: .number)
```

Diese Form eignet sich für Alter, Gehalt, Beträge und andere numerische Eingaben.

`format: .number` bedeutet, dass das Eingabefeld den Inhalt im Zahlenformat interpretiert und anzeigt.

#### Platzhaltertext

Der erste Parameter von `TextField` ist der Platzhalter (`Placeholder`), der dem Nutzer einen Hinweis gibt:

```swift
TextField("input your name", text: $text)
```

Wenn das Eingabefeld leer ist, erscheint ein grauer Hinweistext.

![textfield](../../RESOURCE/014_textfield.png)

#### Datenbindung

`TextField` speichert den eingegebenen Inhalt nicht selbst dauerhaft, sondern verwaltet ihn über eine gebundene Variable:

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Der eingegebene Inhalt wird direkt in der Variablen `text` gespeichert. `TextField` ist nur für die Eingabeoberfläche zuständig.

`$` steht für Binding:

```swift
$text
```

Das ist keine normale Variable, sondern ein Wert vom Typ `Binding`.

Seine Aufgabe ist es, die Verbindung zwischen View und Daten herzustellen:

Wenn die Nutzerin oder der Nutzer in `TextField` etwas eingibt, wird `text` automatisch aktualisiert; wenn sich `text` ändert, aktualisiert sich auch `TextField`.

Zum Beispiel:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("text:\(text)")
            TextField("input your name", text: $text)
                .frame(width: 150)
        }
    }
}
```

Wenn man in `TextField` etwas eingibt, zeigt der `Text` darüber den Inhalt in Echtzeit an.

![textField](../../RESOURCE/014_textfield1.png)

### Zahlentypen binden

Wenn Zahlen eingegeben werden sollen, muss eine Variable des passenden Typs gebunden werden:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Wenn ein Betrag eingegeben wird, interpretiert `TextField` die Eingabe als Zahl und aktualisiert den Wert von `number` automatisch.

## Das Eingabefeld hinzufügen

Nachdem wir die grundlegende Verwendung von `TextField` kennengelernt haben, setzen wir es nun im Sparschwein-Projekt ein.

Das Sparschwein braucht eine Eingabe für einen "Betrag", deshalb verwenden wir die Form zur Bindung eines numerischen Typs und fügen zusätzlich eine Variable `number` hinzu, um den eingegebenen Betrag zu speichern:

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
        }
    }
}
```

Jetzt zeigt `TextField` standardmäßig den Wert von `number` an, also zunächst `0`.

Wenn der Inhalt gelöscht wird, erscheint stattdessen der Platzhalter `"Amount"`.

Das zeigt noch einmal deutlich, dass `TextField` den Wert der gebundenen Variable anzeigt und nicht seinen Inhalt selbst verwaltet.

### Problem mit der Größe des Eingabefelds

In der aktuellen View fällt auf, dass `TextField` keinen Rahmen hat, nur eine `0` zeigt und linksbündig wirkt.

So sieht das aus:

![textfield](../../RESOURCE/014_textfield2.png)

Der Grund ist, dass `TextField` standardmäßig die gesamte Breite der übergeordneten View einnimmt.

Das lässt sich leicht mit einer Hintergrundfarbe überprüfen:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Ergebnis:

![textfield](../../RESOURCE/014_textfield3.png)

Man sieht, dass `TextField` tatsächlich die ganze Zeilenbreite ausfüllt.

### Eine feste Breite setzen

Wenn das Eingabefeld kompakter sein soll, können wir die Breite mit `frame` begrenzen:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Ergebnis:

![textfield](../../RESOURCE/014_textfield4.png)

### Rahmen und Innenabstand hinzufügen

Da `TextField` standardmäßig keinen Rahmen hat, können wir ihn selbst gestalten:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Jetzt wirkt das Eingabefeld deutlich mehr wie ein klassisches Standard-Eingabefeld.

![textfield](../../RESOURCE/014_textfield5.png)

## Rahmen

In SwiftUI wird `border` verwendet, um einer View einen Rahmen hinzuzufügen.

Grundlegende Verwendung:

```swift
border(Color.black, width: 1)
```

Dabei steht `Color.black` für die Rahmenfarbe und `width` für die Dicke des Rahmens.

Im `TextField` verwenden wir:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Das bedeutet, dass das Eingabefeld einen schwarzen Rahmen mit einer Breite von `1 pt` erhält.

Du kannst auch andere Farben wie `Color.blue` oder `Color.green` ausprobieren oder den Rahmen mit `width: 2` dicker machen.

## Der Sparen-Button

Jetzt haben wir eine Variable `amount` für den Gesamtbetrag, ein `TextField` zur Eingabe und eine an das Eingabefeld gebundene Variable `number`.

Der aktuelle Code sieht so aus:

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
        }
    }
}
```

### Einen Button hinzufügen

Als Nächstes brauchen wir einen Button, der den Sparvorgang auslöst.

```swift
Button("Save") {
    
}
```

### Die Logik fürs Sparen umsetzen

Wir möchten erreichen, dass der eingegebene Betrag beim Tippen auf den Button automatisch zum Gesamtbetrag addiert wird.

```swift
Button("Save") {
    amount += number
}
```

Hier verwenden wir einen zusammengesetzten Zuweisungsoperator und addieren den eingegebenen Betrag `number` zum Gesamtbetrag `amount`.

### Den eingegebenen Betrag zurücksetzen

Jetzt gibt es noch ein Problem: Nach dem Tippen auf den Button bleibt der eingegebene Betrag im Eingabefeld stehen.

Wenn die Nutzerin oder der Nutzer `10` eingibt und speichert, bleibt im Eingabefeld weiter `10` stehen. Das stört die nächste Eingabe.

Der Grund ist, dass `TextField` an `number` gebunden ist. Beim Tippen auf den Button haben wir bisher nur `amount` geändert, aber nicht `number`. Deshalb bleibt die alte Zahl sichtbar.

Wir müssen also noch eine Löschlogik ergänzen: Nach dem Addieren des Betrags setzen wir den eingegebenen Betrag wieder zurück:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Jetzt wird beim Eingeben und Speichern der Betrag korrekt zum Gesamtbetrag addiert, und `number` wird wieder auf `0` gesetzt, damit die nächste Eingabe sauber beginnen kann.

Damit ist die komplette Spar-Logik des Sparschweins umgesetzt.

## Die View verbessern

Nachdem die Funktion fertig ist, können wir die Oberfläche noch leicht verbessern, zum Beispiel mit einem Hintergrundbild und einem Button-Stil.

Button-Stil hinzufügen:

```swift
.buttonStyle(.borderedProminent)
```

Hintergrundbild hinzufügen:

```swift
.background {
    Image("1")
}
```

Damit ist die gesamte Entwicklung des Sparschweins abgeschlossen.

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Ergebnis:

![Piggy Bank](../../RESOURCE/014_view.png)

Jetzt können wir zum Beispiel versuchen, `100` oder noch mehr Geld zu sparen, um zu prüfen, ob die Logik des Sparschweins korrekt funktioniert.

Oder wir führen das Sparschwein im Simulator oder auf einem echten Gerät aus, um unsere selbst entwickelte App direkt auszuprobieren.

### Debug-Ausgabe

Um zu überprüfen, ob die Logik korrekt läuft, können wir in den Button zusätzlich Debug-Code einfügen, um die eingegebenen Werte zu kontrollieren:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Jedes Mal, wenn wir sparen und auf den Button tippen, sehen wir die passende Debug-Ausgabe und können so prüfen, ob es ein Problem in der Logik gibt.

```text
---Saving---
amount:11
number:0
```
