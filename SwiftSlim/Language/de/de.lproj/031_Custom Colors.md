# Benutzerdefinierte Farben

In dieser Lektion lernen wir, wie man in SwiftUI benutzerdefinierte Farben verwendet.

In den vorherigen Lektionen haben wir bereits die von SwiftUI bereitgestellten Standardfarben verwendet, zum Beispiel:

```swift
Color.blue
Color.red
Color.green
```

Diese Farben sind sehr bequem zu verwenden, aber in der echten App-Entwicklung sind Standardfarben oft nicht präzise genug.

Zum Beispiel kann in einem Design eine solche Farbe verwendet werden:

```text
#2c54c2
#4875ed
#213e8d
```

Diese Art von Farbe nennt man Hex-Farbe.

In dieser Lektion sorgen wir zuerst dafür, dass SwiftUI Hex-Farben unterstützt, und verwenden anschließend `static`, um häufig genutzte Farben zu ordnen.

Zum Schluss wenden wir die benutzerdefinierten Farben auf die Tierlexikon-Ansicht an und verwenden zusätzlich einen Farbverlauf als Hintergrund, damit der Button mehr Tiefe erhält.

## Warum braucht man benutzerdefinierte Farben?

In SwiftUI können wir Systemfarben direkt verwenden.

Zum Beispiel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Das `.blue` steht hier für Blau. Es ist eigentlich eine Kurzform von `Color.blue`.

Der Vorteil von Standardfarben ist, dass sie einfach und bequem sind. Die Auswahl an Farben ist jedoch relativ begrenzt.

Zum Beispiel:

```swift
Color.blue
```

kann nur das von SwiftUI bereitgestellte Standardblau darstellen.

![Color.blue](../../../Resource/031_color6.png)

In der tatsächlichen Entwicklung brauchen wir jedoch häufig konkretere Farben.

Zum Beispiel kann Blau ebenfalls als Hellblau, Dunkelblau, Graublau, leuchtendes Blau und in weiteren Varianten erscheinen.

![More Blue](../../../Resource/031_color5.png)

Wenn wir dann nur `Color.blue` verwenden, lässt sich der Entwurf nur schwer exakt nachbilden.

Deshalb müssen wir dafür sorgen, dass SwiftUI benutzerdefinierte Farben unterstützt.

## Was ist eine Hex-Farbe?

Farben auf dem Bildschirm bestehen normalerweise aus drei Kanälen: Rot, Grün und Blau, also RGB.

RGB steht jeweils für:

```text
Red     // Rot
Green   // Grün
Blue    // Blau
```

Hex-Farbe ist eine Darstellungsform von RGB-Farben.

Zum Beispiel:

```swift
#5479FF
```

Diesen Farbwert kann man einfach als drei Teile verstehen:

```text
54  // steht für den roten Kanal
79  // steht für den grünen Kanal
FF  // steht für den blauen Kanal
```

In dieser Lektion müssen wir diese Werte nicht berechnen und die Regeln des Hexadezimalsystems nicht vertieft verstehen.

Jetzt müssen wir nur wissen: `#5479FF` steht für eine konkrete Farbe.

Wenn wir später Schreibweisen wie `#2c54c2` oder `#4875ed` sehen, können wir sie zunächst als eine Art Farbwert verstehen.

In Designwerkzeugen wie Sketch, Figma und Photoshop sieht man ähnliche Farbwerte ebenfalls häufig.

![color](../../../Resource/031_color.png)

SwiftUI kann standardmäßig jedoch nicht direkt so geschrieben werden:

```swift
Color(hex: "#5479FF")
```

Deshalb müssen wir den Typ `Color` selbst erweitern, damit er Farben über Hex-Strings erstellen kann.

## Datei Color+Hex.swift erstellen

Zuerst erstellen wir eine neue Swift-Datei.

Der Dateiname kann lauten:

```text
Color.swift
```

Er kann auch eindeutiger lauten:

```text
Color+Hex.swift
```

Hier wird eher empfohlen:

```text
Color+Hex.swift
```

In Swift-Projekten sind Dateinamen wie `Color+Hex.swift` sehr häufig.

Das bedeutet, dass diese Datei eine Erweiterungsdatei ist, die `Color` die Hex-Funktionalität hinzufügt.

Der Dateiname beeinflusst die Ausführung des Codes nicht direkt. Er hilft uns nur, den Zweck dieser Datei leichter zu verstehen.

## Color(hex:)-Code hinzufügen

Schreibe in die Datei `Color+Hex.swift` den folgenden Code:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Dieser Code erweitert den Typ `Color` mit `extension` und fügt `Color` eine neue Initialisierungsmethode hinzu:

```swift
init(hex: String)
```

Nachdem diese Initialisierungsmethode vorhanden ist, können wir einen Hex-String an `Color` übergeben und so eine benutzerdefinierte Farbe erstellen:

```swift
Color(hex: "#5479FF")
```

Der Erweiterungscode wandelt intern den Hex-String in eine RGB-Farbe um, die SwiftUI erkennen kann.

In dieser Phase ist es nicht nötig, jede Zeile der Umwandlungslogik vertieft zu verstehen. Es genügt zu wissen, dass die hinzugefügte Methode `Color(hex:)` uns ermöglicht, über Hex-Farbwerte benutzerdefinierte Farben zu erstellen.

## Benutzerdefinierte Farben verwenden

Jetzt können wir die benutzerdefinierten Farben in `ContentView` testen.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Anzeigeeffekt:

![color](../../../Resource/031_color1.png)

In diesem Beispiel verwendet die erste Zeile eine Systemfarbe:

```swift
.foregroundStyle(Color.blue)
```

Die folgenden drei Zeilen verwenden benutzerdefinierte Hex-Farben:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Durch den Vergleich kann man feststellen, dass das Systemblau nur einen einzigen Standardeffekt hat.

Hex-Farben können dagegen feinere Blauabstufungen darstellen.

Das ist der Wert benutzerdefinierter Farben: Sie können die Farben der Oberfläche näher an ein echtes Design bringen und es uns außerdem erleichtern, den visuellen Stil der App zu steuern.

## Farben mit static ordnen

Jetzt können wir über Hex-Strings Farben erstellen:

```swift
Color(hex: "#2c54c2")
```

Diese Schreibweise funktioniert, ist aber nicht besonders wartungsfreundlich, wenn dieselbe Farbe an mehreren Stellen wiederholt vorkommt.

Wenn dieser Farbwert an 10 Stellen geschrieben wird und man dieses Blau später ändern möchte, muss man jede Stelle einzeln ändern.

In diesem Fall können wir `static` verwenden, um häufig genutzte Farben einheitlich zu ordnen.

Füge am Ende der Datei `Color+Hex.swift` den folgenden Code hinzu:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Hier fügen wir `Color` drei statische Eigenschaften hinzu: `animalBlue`, `animalLightBlue` und `animalDarkBlue`. Sie stehen jeweils für verschiedene helle und dunkle Blautöne.

Da diese Eigenschaften `static` verwenden, gehören sie zum Typ `Color` selbst.

Bei der Verwendung kann direkt über `Color.` darauf zugegriffen werden:

```swift
Color.animalBlue
```

Diese Schreibweise ist klarer als ein direkter Hex-String.

Wenn wir `Color.animalBlue` sehen, wissen wir, dass es das im Tierlexikon verwendete Blau bedeutet.

Wenn wir dagegen `Color(hex: "#2c54c2")` sehen, wissen wir nur, dass es ein Farbwert ist. Der konkrete Verwendungszweck ist nicht leicht zu erkennen.

Die einheitliche Verwaltung von Farben hat noch einen weiteren Vorteil: spätere Änderungen werden einfacher.

Wenn man die Hauptfarbe des Tierlexikons anpassen möchte, muss nur die Definitionsstelle geändert werden:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Alle Stellen, die diese Farbe verwenden, werden gemeinsam aktualisiert.

Das ist der Sinn davon, Farben mit `static` zu ordnen: Die Farbnamen werden klarer, und die spätere Wartung wird einfacher.

## Auf das Tierlexikon anwenden

Jetzt können wir die benutzerdefinierten Farben auf die vorherige Tierlexikon-Ansicht anwenden.

Vorher war der Hintergrund des Tier-Buttons weiß:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Jetzt können wir ihn in eine benutzerdefinierte Farbe ändern:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

`Color.animalBlue` ist hier genau die statische Farbe, die wir gerade in `Color+Hex.swift` definiert haben.

Der Button-Text verwendet Weiß:

```swift
.foregroundStyle(Color.white)
```

Der Hintergrund des Tier-Emojis verwendet halbtransparentes Weiß:

```swift
.background(Color.white.opacity(0.15))
```

So entsteht für den Button ein einheitlicher blauer visueller Stil.

Der Schwerpunkt dieses Schritts liegt nicht darin, komplexen Code hinzuzufügen, sondern die zuvor gelernten benutzerdefinierten Farben wirklich in der Oberfläche anzuwenden.

## Farbverlauf als Hintergrund verwenden

Neben einer einzelnen Farbe können wir auch mehrere Farben zu einem Verlaufseffekt kombinieren.

Zum Beispiel haben wir zuvor diese Farben definiert:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Diese Farben können nicht nur einzeln verwendet, sondern auch zu einem Farbverlauf als Hintergrund kombiniert werden.

In SwiftUI kann man mit `LinearGradient` einen linearen Farbverlauf erstellen.

Zum Beispiel:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Dieser Code erstellt einen Farbverlauf von links nach rechts. Die Farbe geht allmählich von `Color.animalBlue` zu `Color.animalLightBlue` über.

Dabei legt `colors` die am Verlauf beteiligten Farben fest. `startPoint` und `endPoint` steuern die Richtung des Verlaufs.

### Verlaufseffekt testen

Wir können den Verlaufshintergrund mit einem einfachen Text testen.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Anzeigeeffekt:

![color](../../../Resource/031_color3.png)

In diesem Beispiel ist der Hintergrund von `Text` keine einzelne Farbe mehr, sondern ein Verlauf, der sich von links nach rechts allmählich verändert.

Im Vergleich zu einem normalen Hintergrund wirkt ein Verlaufshintergrund räumlicher und erleichtert es, einen visuellen Schwerpunkt in der Oberfläche zu erzeugen.

## Verlaufshintergrund im Tierlexikon verwenden

Jetzt können wir die Hintergrundfarbe des Tier-Buttons:

```swift
.background(Color.animalBlue)
```

in einen Verlaufshintergrund ändern:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Der vollständige Code lautet:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Anzeigeeffekt:

![color](../../../Resource/031_color4.png)

Jetzt hat der Tier-Button nicht mehr nur eine einzelne Hintergrundfarbe, sondern einen Verlaufseffekt von links nach rechts.

Im Vergleich zu einem einfarbigen Hintergrund kann ein Verlaufshintergrund die Oberfläche plastischer wirken lassen und dem visuellen Design echter Apps näherkommen.

## Unterschied zwischen einfarbigem Hintergrund und Verlaufshintergrund

Ein einfarbiger Hintergrund verwendet nur eine Farbe.

Zum Beispiel:

```swift
.background(Color.animalBlue)
```

Diese Schreibweise ist einfach und klar und eignet sich für die meisten grundlegenden Oberflächen.

Ein Verlaufshintergrund verwendet mehrere Farben.

Zum Beispiel:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Diese Schreibweise kann der Oberfläche mehr Tiefe geben, erhöht aber auch leichter die visuelle Komplexität.

Deshalb kann man es in der tatsächlichen Entwicklung so verstehen:

Einfarbige Hintergründe eignen sich für normalen Text, normale Buttons, normale Karten und normale Seitenhintergründe.

Verlaufshintergründe eignen sich für wichtige Buttons, obere Bereiche, Cover-Karten, Funktionseinstiege und andere Stellen, die hervorgehoben werden sollen.

## Zusammenfassung

In dieser Lektion haben wir gelernt, wie man in SwiftUI benutzerdefinierte Farben verwendet.

Zuerst haben wir Hex-Farben kennengelernt.

Zum Beispiel:

```text
#2c54c2
```

Das steht für eine konkrete Farbe.

Danach haben wir mit `extension Color` den Typ `Color` erweitert.

Dadurch kann SwiftUI Farben auf folgende Weise erstellen:

```swift
Color(hex: "#2c54c2")
```

Anschließend haben wir mit `static` häufig genutzte Farben geordnet:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

So kann man in anderen Ansichten direkt verwenden:

```swift
Color.animalBlue
```

Im Vergleich dazu, jedes Mal den Hex-String zu schreiben, ist diese Vorgehensweise klarer und erleichtert spätere einheitliche Änderungen an Farben.

Zum Schluss haben wir `LinearGradient` gelernt und benutzerdefinierte Farben zu einem Verlaufshintergrund kombiniert:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Durch diese Lektion haben wir den Prozess von „benutzerdefinierte Farben erstellen“ bis „Farben in einer echten Oberfläche verwenden“ abgeschlossen.

Wenn eine Farbe später an mehreren Stellen wiederholt verwendet werden muss, kann man vorrangig überlegen, sie in einer `Color`-Erweiterung zu ordnen.

So wird der Code klarer, und der Stil der Oberfläche lässt sich leichter vereinheitlichen.
