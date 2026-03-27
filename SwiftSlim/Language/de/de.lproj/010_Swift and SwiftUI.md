# Swift und SwiftUI

Beim Lernen der Entwicklung für Apple-Plattformen erklären viele Tutorials Swift und SwiftUI getrennt voneinander. Das kann bei Anfängerinnen und Anfängern leicht ein Gefühl der Trennung erzeugen, sodass man denkt, es handle sich um zwei völlig unabhängige Technologien.

Tatsächlich sind Swift und SwiftUI eng miteinander verbunden: Swift ist die Programmiersprache und stellt Logik und Daten bereit, während SwiftUI ein auf Swift basierendes UI-Framework ist, das für das Rendern von Views und Interaktionen zuständig ist.

Diese Lektion hilft dir dabei, ein klares mentales Modell aufzubauen: Was ist Swift, was ist SwiftUI, und wie arbeiten beide im Code zusammen?

## Was ist Swift?

Swift ist eine moderne Programmiersprache von Apple, die zur Entwicklung von Apps für iOS, macOS, watchOS und tvOS verwendet wird.

![swift](../../RESOURCE/010_swift.png)

Swift ist eine stark typisierte, statische Sprache. Beim Entwurf wurde viel Wert auf Sicherheit gelegt, sodass viele typische Programmierfehler wie Nullzeigerprobleme oder Grenzwertfehler reduziert werden. Außerdem unterstützt Swift die nahtlose Zusammenarbeit mit C und Objective-C.

In der praktischen Entwicklung übernimmt Swift vor allem die Logik einer App, zum Beispiel Datenverarbeitung, Netzwerkabfragen, Speicheroperationen und ähnliche Aufgaben.

## Was ist SwiftUI?

SwiftUI ist ein neues UI-Framework, das Apple 2019 vorgestellt hat. SwiftUI verwendet ein deklaratives Programmiermodell, mit dem Entwicklerinnen und Entwickler Oberflächen und Interaktionen mit deutlich kompakterem Code beschreiben können.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklaratives Programmieren bedeutet, dass Entwicklerinnen und Entwickler dem System nur sagen müssen, was angezeigt werden soll. Das System aktualisiert die View dann automatisch entsprechend den Datenänderungen. Dadurch entfällt viel manuelle UI-Zustandsverwaltung, was die Komplexität der UI-Entwicklung stark reduziert.

Der Kern von SwiftUI besteht aus View-Komponenten wie `Text`, `Image` und `Button` sowie Layout-Containern wie `VStack`, `HStack` und `ZStack`. Diese Komponenten arbeiten über Datenbindung und Zustandsverwaltung zusammen, sodass die Oberfläche auf Datenänderungen reagieren und sich automatisch aktualisieren kann.

## Wie arbeiten Swift und SwiftUI zusammen?

Die Aufgaben von Swift und SwiftUI lassen sich so zusammenfassen:

**1. Swift: Logik und Daten verarbeiten**

Swift wird hauptsächlich verwendet, um Daten zu verwalten, Zustände zu speichern und Logik auszuführen. Solcher Code beeinflusst normalerweise nicht direkt das Rendern der Oberfläche, sondern kümmert sich um Daten und Verhalten.

Zum Beispiel bei der Datenverarbeitung in Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Dieser Code betrifft Variablendeklarationen, Konstanten, Funktionen, Kontrollfluss und ähnliche Dinge, wirkt sich aber nicht direkt auf die Darstellung einer View aus.

**2. SwiftUI: Oberfläche deklarieren und rendern**

SwiftUI wird dagegen zum Aufbau der Benutzeroberfläche, des Layouts und des Inhalts verwendet und ist in erster Linie für das Rendern und die Benutzerinteraktion verantwortlich.

Zum Beispiel ein Text mit SwiftUI:

```swift
Text("SwiftSlim")
```

Solcher Code wird verwendet, um UI-Elemente aufzubauen und zu steuern und steht in direkter Beziehung zur Benutzeroberfläche.

### Einfaches Beispiel

Hier ist ein einfaches SwiftUI-Beispiel:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

In diesem Beispiel:

**SwiftUI-Code**: `VStack`, `Image`, `Text` und `padding` gehören alle zu SwiftUI und sind für Darstellung und Layout zuständig.

**Swift-Code**: Der `//`-Kommentar am Dateianfang und `import SwiftUI` gehören zur Swift-Code-Struktur; das `#Preview` am Ende ist ein Makro für die Xcode-Vorschau und nicht Teil des eigentlichen UI-Renderings.

### Weiterführendes Beispiel

In echten Projekten werden Swift und SwiftUI oft gemischt verwendet, damit jede Seite das tun kann, worin sie gut ist:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

In diesem Beispiel:

**SwiftUI-Code**: `@State` ist ein spezieller Property Wrapper von SwiftUI und wird verwendet, um veränderlichen Zustand in einer View zu deklarieren. `Button` und `Text` sind SwiftUI-Komponenten, die für Anzeige und Benutzerinteraktion zuständig sind.

**Swift-Code**: `private var name` und `func printName()` sind Swift-Code. Sie speichern Daten und führen Logik aus, beeinflussen aber nicht direkt das Rendern der View.

Wenn die Nutzerin oder der Nutzer auf den Button tippt, löst SwiftUI den Aktionscode im Button aus:

```swift
Button("Print") {
    printName()
}
```

Hier ist `Button` eine SwiftUI-Komponente, während die aufgerufene Funktion `printName()` Swift-Code ist und die konkrete Logik übernimmt.

Diese Zusammenarbeit sorgt dafür, dass Swift und SwiftUI nahtlos kombiniert werden können: Swift kümmert sich um Daten und Logik, SwiftUI um die Benutzeroberfläche.

## Wo schreibt man Swift- und SwiftUI-Code normalerweise?

In SwiftUI wird die Oberfläche über die von `body` zurückgegebene View aufgebaut. Deshalb wird aller Code, der die Oberfläche beschreibt, in der Regel innerhalb von `body` geschrieben.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

In diesem Beispiel ist `Text` eine SwiftUI-View-Komponente und muss deshalb innerhalb von `body` stehen, weil SwiftUI die Oberfläche über `body` einliest und erzeugt.

Code, der nichts direkt mit der Oberfläche zu tun hat, zum Beispiel Variablen, Funktionen oder Datenverarbeitungslogik, wird normalerweise außerhalb von `body` geschrieben. Zum Beispiel:

```swift
struct ContentView: View {

    // Swift: Daten oder Logik
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: Oberfläche
    var body: some View {
        Text(name)
    }
}
```

Wichtig ist dabei: Innerhalb von `body` kann weiterhin Swift-Syntax wie `if` oder `for` verwendet werden. Sie dient dort allerdings nur dazu, die Erzeugung von SwiftUI-Views zu steuern:

```swift
if isLogin {
    Text("Welcome")
}
```

Für die SwiftUI-Entwicklung kann man es daher vereinfacht so verstehen: View-Code wie `Text`, `Image` oder `Button` steht normalerweise in `body`; Daten- und Logikcode wie Variablen und Funktionen normalerweise außerhalb von `body`.

## Swift-Dateien

Je tiefer wir lernen, desto mehr kommen wir auch mit MVVM in Berührung. Dabei bestehen die Ebenen `ViewModel` und `Model` oft aus reinem Swift-Code und sind vollständig von der View-Schicht (SwiftUI) getrennt.

Zum Beispiel eine Klasse zur Verwaltung des App-Zustands:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Oder eine Struktur zur Beschreibung eines Datenmodells:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Solche Dateien sind für Verwaltung und Persistenz von Daten zuständig und werden nicht direkt als View angezeigt. Deshalb gehören sie vollständig zu Swift.

## Historischer Hintergrund

Um die Beziehung zwischen Swift und SwiftUI wirklich zu verstehen, hilft auch ein Blick auf die Entwicklung der Apple-Technologien. Bis 2026 hat sich dieser Stack in mehreren Schritten weiterentwickelt.

### Die Geschichte von Swift

Bevor Swift erschien, war Objective-C die Hauptprogrammiersprache auf Apple-Plattformen. Sie konnte mit C kombiniert werden. Ihre Syntax war vergleichsweise lang und für Einsteiger eher schwer zugänglich:

```Obj-c
// Schreibweise in Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

2014 stellte Apple auf der WWDC Swift vor. Swift bot modernere Syntax und höhere Typsicherheit und löste Objective-C nach und nach als Hauptsprache der Entwicklung ab:

```swift
// Schreibweise in Swift
let name = "Fang"
print("Hello, \(name)")
```

Objective-C ist jedoch nicht vollständig verschwunden. In vielen bestehenden Projekten und in unteren Framework-Schichten wird es weiterhin häufig eingesetzt. Ein grundlegendes Verständnis dieser Syntax ist deshalb weiterhin nützlich, wenn man ältere Projekte wartet oder tiefergehende Systemzusammenhänge verstehen möchte.

### Die Geschichte von SwiftUI

Vor SwiftUI verwendete iOS hauptsächlich **UIKit**, und macOS verwendete **AppKit**. Beide Frameworks basieren auf einem imperativen Programmiermodell. Entwicklerinnen und Entwickler mussten Views entweder über Storyboards zusammenziehen oder ihren Zustand manuell im Code steuern. Das führte oft zu viel Code und hohen Wartungskosten, besonders bei komplexer UI-Logik.

![storyboard](../../RESOURCE/010_xcode.png)

2019 stellte Apple auf der WWDC SwiftUI offiziell vor. SwiftUI führte das deklarative Programmierparadigma ein und vereinfachte die UI-Entwicklung erheblich.

![storyboard](../../RESOURCE/010_xcode1.png)

Wichtig ist dabei: SwiftUI ist keine völlig unabhängige Low-Level-Implementierung. Auf den jeweiligen Plattformen arbeitet es im Kern mit UIKit (unter iOS) oder AppKit (unter macOS) zusammen und stützt sich im Unterbau weiterhin auf diese Frameworks.

### Die Beziehung zwischen Swift und UIKit/AppKit

Obwohl Swift eine allgemeine Programmiersprache ist und auf allen Apple-Plattformen genutzt werden kann, kann sie UIKit oder AppKit nicht vollständig ersetzen. Für manche komplexeren UI-Anforderungen oder Funktionen, die SwiftUI noch nicht vollständig abdeckt, müssen UIKit oder AppKit weiterhin hinzugezogen werden.

Zum Beispiel ist UIKit in Bereichen wie komplexer View-Controller-Verwaltung, Animationen oder Gestenerkennung bereits sehr ausgereift und in vielen Produktionsprojekten erprobt. SwiftUI entwickelt sich in diesen Bereichen zwar ständig weiter, hat in manchen Randfällen aber noch Grenzen.

Deshalb verwenden viele Entwicklerinnen und Entwickler SwiftUI und UIKit oder AppKit gemeinsam in einem Projekt, um die jeweiligen Stärken optimal auszunutzen.

Aus dieser Perspektive kann man SwiftUI als eine Art höherwertige Abstraktion über UIKit und AppKit verstehen. Wenn man SwiftUI lernt, hilft ein grundlegendes Verständnis von UIKit und AppKit dabei, bei der Wartung älterer Projekte oder der Umsetzung komplexer Funktionen bessere technische Entscheidungen zu treffen.

## Zusammenfassung

**Swift**: Wird hauptsächlich für Logik, Datenverarbeitung, Kontrollfluss und ähnliche Dinge verwendet, die nichts mit dem Layout einer View zu tun haben.

**SwiftUI**: Wird verwendet, um Benutzeroberflächen deklarativ aufzubauen. Code für View-Inhalt und Layout gehört zu SwiftUI.

In der Praxis werden Swift und SwiftUI normalerweise zusammen verwendet: Swift übernimmt die Logik, SwiftUI die Oberfläche.

Von Objective-C und UIKit bis hin zu Swift und SwiftUI hat sich die Apple-Entwicklungswelt nach und nach in Richtung modernerer und kompakterer Programmierweisen bewegt. Trotzdem bleiben UIKit und AppKit in vielen älteren Projekten weiterhin relevant.

Wenn wir die Beziehung zwischen Swift und SwiftUI verstehen, können wir iOS- und macOS-Entwicklung effizienter betreiben und gleichzeitig bei der Wartung älterer Projekte bessere technische Entscheidungen treffen.
