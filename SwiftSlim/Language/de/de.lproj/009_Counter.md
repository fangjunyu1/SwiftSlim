# Zähler

In den letzten beiden Lektionen haben wir Variablen, Konstanten, Buttons und Funktionen kennengelernt.

In dieser Lektion kombinieren wir dieses Wissen und bauen eine einfache Zähler-App.

In diesem Beispiel lernen wir, wie man Variablen speichert und verändert und wie `@State` verwendet wird, um Variablen zu verwalten.

## Einen Zähler umsetzen

Ein Zähler wird typischerweise verwendet, um etwas mitzuzählen, das laufend zunimmt, zum Beispiel Sprungseil-Wiederholungen oder gelaufene Runden.

Jetzt bauen wir einen einfachen Zähler: Es wird eine Zahl und ein Button angezeigt, und beim Tippen auf den Button erhöht sich die Zahl.

![Num](../../RESOURCE/009_num.png)

### Eine Zahl anzeigen

Zuerst verwenden wir `Text`, um eine Zahl anzuzeigen.

```swift
Text("0")
```

Wenn sich die Zahl jedoch verändern soll, können wir `"0"` nicht einfach fest hineinschreiben, sondern sollten die Zahl in einer Variablen speichern.

```swift
var num = 0
```

Dann zeigen wir die Variable in `Text` an:

```swift
Text("\(num)")
```

Hier verwenden wir String Interpolation `\()`, um die Zahl in einen String umzuwandeln und anzuzeigen.

### Die Zahl mit einem Button erhöhen

Als Nächstes fügen wir einen Button hinzu.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Wenn der Button gedrückt wird, soll sich die Zahl erhöhen.

Deshalb können wir im Button die Variable ändern:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Dieser Code bedeutet: Wenn auf den Button getippt wird, wird `num + 1` berechnet und das Ergebnis wieder `num` zugewiesen.

### Eine kompaktere Schreibweise

Swift bietet dafür eine kürzere Schreibweise:

```swift
num += 1
```

Sie ist gleichbedeutend mit:

```swift
num = num + 1
```

Diese Schreibweise nennt man zusammengesetzten Zuweisungsoperator.

Häufige zusammengesetzte Zuweisungsoperatoren in Swift sind:

```text
+=   Additionszuweisung
-=   Subtraktionszuweisung
*=   Multiplikationszuweisung
/=   Divisionszuweisung
%=   Restzuweisung
```

Zum Beispiel:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Vollständiger Code

Jetzt können wir einen einfachen Zähler schreiben:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Allerdings funktioniert dieser Code noch nicht korrekt.

### Der auftretende Fehler

Xcode zeigt folgende Meldung:

```text
Cannot assign to property: 'self' is immutable
```

Das bedeutet, dass die Eigenschaft nicht verändert werden kann, weil die View nicht veränderbar ist.

Warum passiert das?

## Wie SwiftUI funktioniert

In SwiftUI gilt: **Die Oberfläche wird durch Daten gesteuert.** Das bedeutet, dass sich die Oberfläche automatisch aktualisiert, wenn sich Daten ändern.

Wichtig ist jedoch: SwiftUI überwacht Änderungen nur dann und aktualisiert die View nur dann, wenn sich ein Zustand wie `@State` oder `@Binding` ändert.

Wenn wir eine normale Variable verwenden, liest SwiftUI ihren Wert nur einmal beim Erzeugen der View. Selbst wenn sich die Variable danach ändert, wird die Oberfläche nicht aktualisiert.

Zum Beispiel:

```swift
var num = 0   // 0
num = 1   // 0
```

Im obigen Beispiel ist `num` eine normale Variable. Obwohl sich ihr Wert ändert, aktualisiert SwiftUI die View nicht. Auf dem Bildschirm bleibt also weiterhin die anfängliche `0` sichtbar.

![Num](../../RESOURCE/009_state.png)

Deshalb kann SwiftUI Daten nur dann automatisch überwachen und die View aktualisieren, wenn diese Daten als Zustand markiert sind, zum Beispiel mit `@State`, `@Binding` oder ähnlichen Property Wrappern.

## Der Property Wrapper @State

Wenn wir in SwiftUI eine Variable ändern und gleichzeitig die View aktualisieren möchten, müssen wir `@State` verwenden.

```swift
@State var num = 0
```

`@State` sorgt dafür, dass SwiftUI diese Variable überwacht.

Wenn sich die Variable ändert, berechnet SwiftUI die View neu und aktualisiert die Anzeige.

Vollständiger Code:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Wenn jetzt auf den Button getippt wird:

```swift
num += 1
```

dann erkennt SwiftUI, dass sich `num` geändert hat, und aktualisiert die View automatisch.

![Num](../../RESOURCE/009_state1.png)

## Regeln für die Verwendung von @State

In der Praxis folgt `@State` normalerweise zwei Regeln.

### 1. @State wird normalerweise mit private verwendet

`@State`-Variablen werden meist nur innerhalb des aktuellen Typs, also zum Beispiel der aktuellen View-Struktur, verwendet. Deshalb schreibt man oft:

```swift
@State private var num = 0
```

Damit wird verhindert, dass andere Views direkt auf diese Variable zugreifen oder sie verändern.

`private` haben wir noch nicht gelernt. Du kannst es fürs Erste einfach so verstehen:

**Etwas, das mit `private` markiert ist, kann nur in der aktuellen View verwendet werden und nicht von außen.**

### 2. @State ist nur für den Zustand der aktuellen View gedacht

`@State` eignet sich für Daten, die von der aktuellen View selbst verwaltet werden.

Zum Beispiel für den Inhalt eines Eingabefeldes oder den Status eines Schalters:

```swift
@State private var isOn = false
@State private var text = ""
```

Wenn Daten zwischen mehreren Views geteilt werden müssen, braucht man andere Zustandstypen, zum Beispiel `@Binding` oder `@Observable`.

Diese Inhalte lernen wir in späteren Lektionen.

### Ein Button zum Verringern

Ein Zähler soll nicht nur erhöhen, sondern auch verringern können.

Wir können deshalb einen `-`-Button hinzufügen.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Danach ordnen wir die Buttons mit `HStack` horizontal an:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Ergebnis:

![Num](../../RESOURCE/009_num1.png)

Wenn auf `+` getippt wird, erhöht sich die Zahl um 1; wenn auf `-` getippt wird, verringert sie sich um 1.

### Ein Reset-Button

Wir können auch einen Reset-Button hinzufügen, der die Zahl wieder auf `0` setzt.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Wenn auf den Reset-Button getippt wird, wird `num` wieder `0` zugewiesen.

Ergebnis:

![Num](../../RESOURCE/009_num2.png)

Wenn auf den `0`-Button getippt wird, springt die Zahl zurück auf `0`.

### Eigene Buttons gestalten

Im Moment können unsere Buttons nur Text anzeigen:

```swift
Button("+") {

}
```

Ein Button in dieser Form kann nur Textinhalt darstellen, zum Beispiel `+` oder `-`.

In der Praxis möchten wir oft reichhaltigere Button-Darstellungen, zum Beispiel mit Icons oder anderen Views.

SwiftUI erlaubt es uns, das Aussehen eines Buttons selbst zu definieren. Dafür kann eine andere Schreibweise des Buttons verwendet werden:

```swift
Button(action: {

}, label: {

})
```

In dieser Schreibweise steht `action` für den Code, der beim Tippen ausgeführt wird, und `label` für die View, die im Button angezeigt wird.

Zum Beispiel können wir statt Text ein SF-Symbol anzeigen:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Dann zeigt der Button keinen Text mehr an, sondern ein Symbol.

### Die Zähleroberfläche verbessern

Damit die Oberfläche des Zählers klarer wird, können wir auch die Darstellung der Zahl anpassen, zum Beispiel indem wir sie größer anzeigen:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Als Nächstes ändern wir auch den sichtbaren Inhalt der Buttons zu Symbolen und vergrößern die Symbole etwas:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Genauso können wir den Verringern-Button und den Reset-Button in Symbol-Buttons umwandeln:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Jetzt zeigen die Buttons SF-Symbols-Icons an, und die Oberfläche wirkt direkter und verständlicher.

![Num](../../RESOURCE/009_num3.png)

## Zusammenfassung

In dieser Lektion haben wir mit einem einfachen Zähler die Verwendung von Variablen, `Text` und `Button` gemeinsam geübt. Wir haben eine Variable verwendet, um die Zahl zu speichern, und mit Buttons gesteuert, ob sie erhöht oder verringert wird. Dabei haben wir auch zusammengesetzte Zuweisungsoperatoren wie `num += 1` und `num -= 1` kennengelernt.

Während der Umsetzung haben wir außerdem verstanden, wie SwiftUI arbeitet: Die Oberfläche wird durch Daten gesteuert. Nur wenn sich Daten ändern, wird die Oberfläche aktualisiert. Deshalb müssen veränderliche Zustände mit `@State` gespeichert werden. Wenn sich eine `@State`-Variable ändert, aktualisiert SwiftUI die View automatisch.

Zum Schluss haben wir die Oberfläche noch leicht verbessert, die Schrift des `Text` angepasst und mit `Button(action:label:)` eigene Button-Inhalte definiert, damit die Buttons Symbole anzeigen können. Dadurch wird die Zähleroberfläche klarer und ansprechender.

Jetzt haben wir bereits die grundlegende Verwendung von SwiftUI-Views kennengelernt. In SwiftUI wird ein Großteil der Oberfläche durch Variablen gesteuert. Wenn sich Variablen ändern, aktualisiert SwiftUI die Anzeige automatisch. Deshalb müssen wir bei der Entwicklung von SwiftUI-Apps meist zuerst überlegen, welche Daten gespeichert werden sollen, und daraus anschließend Oberfläche und Interaktionslogik aufbauen.

## Vollständiger Code

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
