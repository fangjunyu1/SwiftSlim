# Views verstehen

In dieser Lektion kehren wir wieder zum ursprünglichen `ContentView` zurück.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

Als wir zum ersten Mal mit SwiftUI in Berührung kamen, gab es in `ContentView` viele Schlüsselwörter, die wir nicht verstanden.

Zum Beispiel `struct`, `View`, `var`, `body`, `some View` und weitere Schlüsselwörter.

Damals wussten wir vielleicht nur: **Wenn Code in `body` geschrieben wird, erscheint der Inhalt auf der Oberfläche.**

Jetzt haben wir `struct`, Variablen, Methoden und Protokolle gelernt. Deshalb können wir diesen Code erneut verstehen und damit die Beziehungen zwischen SwiftUI-Views besser begreifen.

## ContentView wiederholen

Nach dem Erstellen eines SwiftUI-Projekts erzeugt Xcode standardmäßig eine Datei `ContentView`.

Der Beispielcode sieht so aus:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hallo, Welt!")
        }
        .padding()
    }
}
```

Diesen Code kann man in mehrere Teile zerlegen und verstehen.

Zuerst:

```swift
import SwiftUI
```

Diese Zeile bedeutet, dass das SwiftUI-Framework importiert wird.

Nach dem Import von SwiftUI können wir SwiftUI-Views wie `View`, `Text`, `Image`, `VStack`, `Button` und andere verwenden.

## Die ContentView-Struktur

Diese Codezeile bedeutet, dass eine Struktur erstellt wird:

```swift
struct ContentView: View
```

Davon bedeutet:

```swift
struct ContentView
```

dass `ContentView` eine Struktur ist.

In der letzten Lektion haben wir die `struct`-Struktur kennengelernt. Sie kann verschiedene zusammengehörige Felder zusammenfassen und Eigenschaften sowie Methoden enthalten.

Zum Beispiel:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

In diesem Beispiel enthält `ContentView` drei Dinge: `name`, `printName` und `body`.

Das heißt, `struct` kann zusammengehörige Eigenschaften, Methoden und View-Inhalte bündeln.

![contentView](../../Resource/023_contentVIew.png)

## View ist ein Protokoll

Schauen wir weiter auf diese Codezeile:

```swift
struct ContentView: View 
```

Das `View` nach dem Doppelpunkt bedeutet: `ContentView` folgt dem Protokoll `View`.

Man kann es so verstehen: Wenn `ContentView` eine SwiftUI-View werden möchte, muss es die Anforderungen des Protokolls `View` erfüllen.

### Das Identifiable-Protokoll

Beim früheren Lernen der Filmliste sind wir mit dem Protokoll `Identifiable` in Berührung gekommen.

Damals mussten wir in `ForEach` ein `Movie`-Array durchlaufen, aber die Struktur `Movie` hatte keine eindeutige Kennung und unterstützte deshalb das Durchlaufen mit `ForEach` nicht.

Zu diesem Zeitpunkt mussten wir die Struktur `Movie` dem Protokoll `Identifiable` folgen lassen, damit sie die Anforderung von `ForEach` an eine eindeutige Kennung erfüllt.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Das Protokoll `Identifiable` verlangt: **Dieser Typ besitzt ein `id`-Feld, das ihn identifiziert.**

Nachdem `Movie` ein `id`-Feld bereitstellt, kann es die Anforderung von `Identifiable` erfüllen.

So kann SwiftUI beim Verwenden in `ForEach` jeden einzelnen Datensatz erkennen.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Das View-Protokoll

Mit dem Protokoll `View` ist es genauso.

Wenn ein Typ eine SwiftUI-View werden möchte, muss er dem Protokoll `View` folgen.

Die wichtigste Anforderung des Protokolls `View` ist, ein `body` bereitzustellen.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

Man kann die Anforderung des Protokolls `View` so verstehen: **Es akzeptiert nur die SwiftUI-View, die `body` zurückgibt, und `ContentView` zeigt SwiftUI-Views über `body` an.**

### Was passiert, wenn man View nicht folgt?

Wenn wir so schreiben:

```swift
struct ContentView {
}
```

ist das nur eine gewöhnliche Struktur und keine SwiftUI-View.

Sie löst nicht direkt einen Fehler aus, weil eine gewöhnliche Struktur an sich gültiger Swift-Code ist.

Wenn wir sie aber in die Vorschau setzen:

```swift
#Preview {
    ContentView()
}
```

dann entsteht ein Fehler.

Der Grund ist: **Die Vorschau muss eine SwiftUI-View anzeigen, aber dieses `ContentView` folgt nicht dem Protokoll `View`.**

Wenn wir also möchten, dass `ContentView` auf der Oberfläche angezeigt werden kann, müssen wir es dem Protokoll `View` folgen lassen:

```swift
struct ContentView: View {
}
```

Gleichzeitig muss gemäß der Anforderung des Protokolls `View` ein `body` bereitgestellt werden. Wenn `body` fehlt, meldet der Compiler weiterhin einen Fehler.

Die richtige Schreibweise:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hallo, Welt!")
    }
}
```

Erst dann ist `ContentView` eine echte anzeigbare SwiftUI-View.

## body ist der Einstieg zur Anzeige der View

In SwiftUI ist `body` der Einstieg zum Inhalt einer View.

```swift
var body: some View {
    Text("Hallo, Welt!")
}
```

Das kann hier in drei Teile zerlegt werden:

**1. var body**

```swift
var body
```

Das bedeutet, eine Variable mit dem Namen `body` zu definieren.

**2. some View**

```swift
: some View
```

Das bedeutet, dass dieses `body` eine View zurückgibt.

**3. { ... }**

```swift
{
    Text("Hallo, Welt!")
}
```

Das steht für den angezeigten View-Inhalt. In diesem Code wird eine `Text`-View angezeigt.

Mit anderen Worten: Was in `body` steht, wird auf der Oberfläche angezeigt.

Zum Beispiel:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Dieser Code bedeutet: **Auf der Oberfläche wird vertikal angeordneter Inhalt angezeigt, darin befinden sich zwei Texte.**

### Der Name body kann nicht beliebig geändert werden

Man muss beachten, dass der Name `body` nicht beliebig geändert werden kann.

Wenn wir so schreiben:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hallo, Welt!")
    }
}
```

ist dieses `content` zwar ebenfalls eine View-Eigenschaft, aber es kann `body` nicht ersetzen.

Denn der Name, den das Protokoll `View` verlangt, ist `body`.

## Was ist some View?

In SwiftUI bedeutet `some View`, dass eine konkrete View zurückgegeben wird, ohne dass der vollständige Typ dieser View ausgeschrieben werden muss.

```swift
var body: some View
```

Das heißt: `some View` bedeutet nicht, dass es keinen Typ gibt. Der echte Typ existiert weiterhin, und der Compiler kennt diesen Typ. Dieser Typ kann aber sehr komplex sein, deshalb erlaubt Swift uns, ihn mit `some View` zu verbergen.

### Was ist some?

In Swift ist `some` ein Schlüsselwort zum Deklarieren eines opaken Typs (opaque type).

Ein opaker Typ bedeutet: **Der Rückgabewert hat einen konkreten Typ, der Compiler kennt diesen konkreten Typ, aber wir schreiben ihn nicht direkt aus.**

Zum Beispiel:

```swift
func makeView() -> some View {
    Text("Hallo")
}
```

Das bedeutet, dass `makeView` einen konkreten Typ zurückgibt, der dem Protokoll `View` folgt.

### Warum brauchen wir some?

Beim Lernen von Variablen haben wir verstanden: **Werte in Swift benötigen entweder eine explizite Typangabe, oder der Compiler leitet den Typ automatisch ab.**

Zum Beispiel:

```swift
let a: Int = 10
```

Die Konstante `a` ist hier vom Typ `Int`.

SwiftUI-Views sind keine Ausnahme. Wenn wir mit `body` eine SwiftUI-View anzeigen, muss `body` den passenden SwiftUI-Typ zurückgeben.

Wenn wir zum Beispiel mit `body` eine Text-View `Text` anzeigen, muss `body` den entsprechenden Typ `Text` zurückgeben.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

In diesem Beispiel wird innerhalb von `body` eine `Text`-View angezeigt, und der Rückgabetyp ist ebenfalls `Text`.

Nur wenn der innere Typ und der deklarierte Typ übereinstimmen, erfüllt das die Typkonsistenzanforderung des Compilers.

**Problem mit nicht übereinstimmenden Typen**

Wenn wir den Typ von `body` auf `Color` setzen, aber `Text` anzeigen:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

stimmen der Typ von `body` und der Typ des inneren Codes nicht überein, und es entsteht ein Fehler wegen nicht übereinstimmender Typen.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

Dann müssen wir den Rückgabetyp von `body` manuell ändern.

**Komplexe View-Typen**

In der tatsächlichen Entwicklung besteht eine Oberfläche normalerweise nicht nur aus einem `Text`.

Wenn eine komplexere `VStack` angezeigt werden soll, müssten wir manuell einen komplexen Rückgabetyp angeben.

Zum Beispiel:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hallo, Welt!")
    }
}
```

Dieser Code bedeutet, dass eine `VStack` zurückgegeben wird. In der `VStack` befinden sich Views vom Typ `Image` und `Text`.

Der Rückgabetyp von `body` ist:

```swift
VStack<TupleView<(Image,Text)>>
```

Man sieht, dass dieser Rückgabetyp sehr komplex ist. Außerdem kommt ein bisher unbekanntes `TupleView` hinzu.

`TupleView` kann hier so verstanden werden: **Es verpackt mehrere Unterviews zu einer View.**

**Noch komplexere View-Typen**

Wenn wir der View Modifikatoren hinzufügen:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hallo, Welt!")
    }
    .padding()
}
```

dann wird der Rückgabetyp dieser View sehr komplex und kann hier nicht konkret beschrieben werden.

Der vorhandene Rückgabetyp `VStack<TupleView<(Image,Text)>>` kann die Modifikatoren nicht beschreiben und führt deshalb zu einem Fehler.

**some View vereinfacht den Rückgabetyp**

Für diese Situation bietet SwiftUI eine einfache Lösung: `some View`, um die Schreibweise zu vereinfachen.

Wenn wir `body` auf den Typ `some View` ändern:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hallo, Welt!")
    }
    .padding()
}
```

müssen wir bei jeder Änderung des View-Codes nicht erneut den vollständigen Rückgabetyp schreiben.

Denn `some View` bedeutet, eine konkrete View zurückzugeben, die dem Protokoll `View` folgt.

Anders gesagt: SwiftUI-Views wie `VStack`, `Image` und so weiter sind alle Views, die dem Protokoll `View` folgen. Nach dem Hinzufügen von Modifikatoren folgt der zurückgegebene View-Typ weiterhin dem Protokoll `View`.

Deshalb können sie alle als `some View` zurückgegeben werden.

### some View kann nicht beliebig jede View zurückgeben

`some View` kann zwar komplexe Typen verbergen, ist aber nicht „typfrei“.

Die Kernregel lautet: **Der Compiler muss einen konkreten Rückgabetyp bestimmen können**.

Zum Beispiel:

```swift
var title: some View {
    Text("Hallo")
}
```

Hier wird eine `Text`-View zurückgegeben.

Wenn wir jedoch versuchen, zwei Views zurückzugeben, entsteht ein Fehler:

```swift
var title: some View {
    Text("Hallo")
    Image(systemName: "star")
}
```

Denn `some View` muss am Ende eine View-Struktur zurückgeben, während hier versucht wird, zwei unabhängige Views zurückzugeben.

### Lösung

Es gibt normalerweise zwei Lösungen: Container und `@ViewBuilder`.

**1. Mit einem Container verpacken**

```swift
var title: some View {
    VStack {
        Text("Hallo")
        Image(systemName: "star")
    }
}
```

In diesem Code gibt `title` eine `VStack` zurück, während `Text` und `Image` Unterviews innerhalb der `VStack` sind.

Die View-Struktur, die `some View` erhält, ist `VStack<...>`, und erfüllt damit die Anforderung von `some View`, eine View-Struktur zurückzugeben. 

Das ist auch der Grund, warum wir seit Beginn des SwiftUI-Lernens empfehlen, auf der äußersten Ebene einen `VStack`-Container zum Verpacken des View-Codes zu verwenden.

**2. @ViewBuilder verwenden**

Wir können vor `some View` auch den Modifikator `@ViewBuilder` hinzufügen:

```swift
@ViewBuilder
var title: some View {
    Text("Hallo")
    Image(systemName: "star")
}
```

`@ViewBuilder` kann mehrere Views zu einem Rückgabeergebnis kombinieren.

Im Kern werden weiterhin mehrere Views zu einer View zusammengeführt, um die Anforderung von `some View` zu erfüllen, eine View-Struktur zurückzugeben.

### Warum kann body mehrere Views direkt schreiben?

Wenn wir in `var body` mehrere Views schreiben, zum Beispiel:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hallo, Welt!")
}
```

führt ein solches `body` in einigen Fällen nicht zu einem Fehler.

Der Grund ist, dass `body` im Protokoll `View` standardmäßig `@ViewBuilder` unterstützt:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Im Quellcode des Protokolls `View` sehen wir, dass die Variable `body` bereits mit `@ViewBuilder` versehen ist.

Deshalb hat `body` gegenüber einem gewöhnlichen `some View` eine zusätzliche Sonderbehandlung, sodass SwiftUI automatisch mehrere Views zu einer View kombiniert.

**Container werden empfohlen**

Damit Anfänger es leichter verstehen, empfehlen wir zuerst Container wie `VStack`, `HStack`, `ZStack`, `Group`, um mehrere Views zu organisieren.

Zum Beispiel:

```swift
var body: some View {
    VStack {
        Text("Hallo")
        Image(systemName: "star")
    }
}
```

So ist der Code anschaulicher: **Die äußere Ebene ist eine `VStack`, darin liegen zwei Unterviews.**

## Views aufteilen

Wenn die Oberfläche einfach ist, können wir den gesamten Code in `body` schreiben.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Willkommen bei Qinote")
                Text("Guten Morgen")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Klick mich") {
                print("Klick mich ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Das Erscheinungsbild dieser View:

![view](../../Resource/023_view1.png)

Dieser Code kann normal funktionieren. Wenn der View-Code jedoch sehr komplex wird, wird der Code in `body` immer länger, und Lesen sowie Ändern werden immer schwieriger.

Dann können wir verschiedene Bereiche in eigenständige View-Eigenschaften aufteilen.

### Die obere View aufteilen

Zum Beispiel den oberen Bereich herauslösen:

```swift
var topHome: some View {
    HStack {
        Text("Startseite")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Hier ist `topHome` eine Variable, die eine View zurückgibt.

Da eine View zurückgegeben wird, kann der Typ so geschrieben werden:

```swift
some View
```

Das ist im Grunde dieselbe Verwendung wie bei `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Beide verwenden Variablen zum Anzeigen von Views, und der Rückgabetyp ist `some View`.

### Weitere Views aufteilen

Danach teilen wir weitere Teile auf:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Willkommen bei Qinote")
        Text("Guten Morgen")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Klick mich") {
        print("Klick mich")
    }
    .buttonStyle(.borderedProminent)
}
```

Nach dem Aufteilen können die View-Variablen in `body` platziert werden:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Startseite")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Willkommen bei Qinote")
            Text("Guten Morgen")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Klick mich") {
            print("Klick mich")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Jetzt ist `body` nur noch dafür zuständig, die Seitenstruktur zu beschreiben:

```swift
topBar
welcomeText
colorList
clickButton
```

Die konkrete Umsetzung jedes Teils befindet sich in den entsprechenden Eigenschaften darunter.

Diese Art der View-Aufteilung kann die Seitenstruktur klarer machen. Jeder View-Bereich hat einen eigenen Namen und ist leichter zu lesen.

Wenn wir einen bestimmten Teil des Codes ändern, können wir den entsprechenden View-Bereich direkt finden, statt in viel komplexem Code zu suchen.

### some View gibt eine einzelne View zurück

Wenn wir in dieser aufgeteilten View versuchen, mehrere Views zurückzugeben:

```swift
var topBar: some View {
    Text("Startseite")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

entsteht ein Fehler, weil `some View` nur eine View-Struktur zurückgeben kann.

Anders als `body` haben gewöhnliche berechnete Eigenschaften standardmäßig kein `@ViewBuilder`.

Wenn wir also mehrere Views zurückgeben müssen, können wir einen Container wie `VStack`, `HStack` oder `Group` verwenden, um mehrere Views zu einer View zu kombinieren.

```swift
var topBar: some View {
    VStack {
        Text("Startseite")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Oder wir fügen `@ViewBuilder` hinzu, um Views zu kombinieren:

```swift
@ViewBuilder
var topBar: some View {
    Text("Startseite")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

So können wir mehrere Views zurückgeben.

### if gibt mehrere Views zurück

Zum Beispiel:

```swift
var topHome: some View {
    if step == "Startseite" {
        HStack {
            Text("Startseite")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Leer")
    }
}
```

In diesem Code gibt `topHome` je nach Inhalt von `step` zwei unterschiedliche View-Typen zurück: `HStack` oder `Text`.

Da `some View` einen bestimmten konkreten Rückgabetyp benötigt, können die beiden Zweige von `if` in einer gewöhnlichen berechneten Eigenschaft nicht direkt unterschiedliche View-Typen zurückgeben. Dadurch entsteht ein Fehler.

**Die Lösung bleibt, einen Container zu verwenden oder `@ViewBuilder` hinzuzufügen.**

### Warum aufgeteilte Views keine Klammern verwenden

Wenn wir die aufgeteilten View-Eigenschaften in `body` verwenden, schreiben wir direkt:

```swift
topBar
welcomeText
colorList
clickButton
```

und nicht:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Der Grund ist, dass `topBar`, `welcomeText`, `colorList` und `clickButton` Variablen sind. Diese Variablen sind tatsächlich berechnete Eigenschaften, keine Methoden.

**Eigenschaften benötigen keine Klammern.**

Wenn wir es als Methode schreiben, können wir einen ähnlichen Effekt erzielen:

```swift
func topBar() -> some View {
    HStack {
        Text("Startseite")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Dieser Code kann ebenfalls einen ähnlichen Effekt erzielen. Der Aufruf dieser Methode gibt eine View zurück.

Bei der Verwendung muss man schreiben:

```swift
topBar()
```

In SwiftUI ist es üblicher, berechnete Eigenschaften zu verwenden, wenn eine View nur aufgeteilt wird und keine Parameter übergeben werden müssen.

```swift
var topBar: some View { ... }
```

## Verschachtelte Views

Neben dem Aufteilen des Codes in Eigenschaften können wir auch neue View-Strukturen erstellen.

Zum Beispiel:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Diese `PinkColorView` ist wie `ContentView` eine eigenständige SwiftUI-View.

Wenn wir sie in `ContentView` anzeigen möchten, können wir nach dem View-Namen `()` hinzufügen.

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Hier:

```swift
PinkColorView()
```

bedeutet, eine Instanz von `PinkColorView` zu erstellen.

Da `PinkColorView` dem Protokoll `View` folgt, kann sie wie `Text`, `Image` und `Button` in anderen Views angezeigt werden.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Das ist View-Verschachtelung: Eine View kann in einer anderen View angezeigt werden.

## View-Eigenschaft oder neue View erstellen?

Wenn der View-Code einfach ist, muss der Code normalerweise nicht aufgeteilt werden. Nur wenn der Code komplexer wird, empfiehlt es sich, Views aufzuteilen.

### Szenarien für View-Eigenschaften

Wenn es nur ein kleiner Teil des Inhalts der aktuellen View ist, kann eine View-Eigenschaft verwendet werden.

Zum Beispiel:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Diese Inhalte werden normalerweise nur in der aktuellen View verwendet.

### Szenarien für das Erstellen neuer Views

Wenn diese Inhalte relativ eigenständig sind oder später auf mehreren Seiten wiederverwendet werden können, ist es besser, eine neue View zu erstellen.

Zum Beispiel:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Das ist eine Titel-View. Wenn wir diese View als allgemeine Komponente in anderen Views wiederverwenden möchten.

Können wir eine neue View erstellen:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Dann verwenden wir sie an anderen Stellen:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

Dann ist diese View eine wiederverwendbare eigenständige Komponente.

Man kann es einfach so zusammenfassen:

- Inhaltsbereiche der aktuellen View können `var xxx: some View` verwenden
- Wiederverwendbare eigenständige Komponenten können eine neue `struct XxxView: View` erstellen
- Komponenten, denen Daten übergeben werden müssen, eignen sich normalerweise besser als neue Views.

## Zusammenfassung

In dieser Lektion haben wir die grundlegendste und zugleich wichtigste View-Struktur in SwiftUI erneut verstanden.

`ContentView` ist eine Struktur, die mit `struct` definiert wird und dazu dient, seitenbezogenen Code zu organisieren.

`View` ist ein Protokoll. Wenn eine Struktur eine SwiftUI-View werden möchte, muss sie dem Protokoll `View` folgen.

`body` ist der Inhalt, den das Protokoll `View` von uns verlangt. Es bestimmt, was diese View anzeigt.

`some View` bedeutet, eine bestimmte konkrete View zurückzugeben, ohne ihren komplexen vollständigen Typ schreiben zu müssen.

Wenn View-Code länger wird, können wir mit `var xxx: some View` den View-Code in mehrere kleine Bereiche aufteilen.

Wenn ein Teil des Inhalts relativ eigenständig ist oder wiederverwendet werden muss, können wir eine neue View-Struktur erstellen und sie in anderen Views mit `XxxView()` anzeigen.

Einfach gesagt: Die Oberfläche von SwiftUI wird aus einzelnen Views zusammengesetzt. Eine Seite kann mehrere kleine Views enthalten, und eine kleine View kann wiederum weitere Views enthalten.
