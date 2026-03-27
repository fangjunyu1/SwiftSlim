# Den Button zum Arbeiten bringen

In dieser Lektion lernen wir vor allem den `Button`, `print` zur Ausgabe von Debug-Informationen und Swift-Funktionen kennen.

Diese Inhalte bilden die Grundlage der Interaktionsprogrammierung in SwiftUI.

## Button

Buttons gehören zu den häufigsten UI-Steuerelementen. Wenn wir etwas herunterladen, öffnen oder beenden möchten, klicken wir in der Regel auf einen Button.

Zum Beispiel tippt man im App Store auf den Button "Laden", um eine App herunterzuladen.

![Button](../../RESOURCE/008_button.png)

In SwiftUI wird ein Button mit `Button` dargestellt.

Grundlegende Verwendung:

```swift
Button("") {
    
}
```

Die Struktur lässt sich in zwei Teile aufteilen:

```swift
Button("Button-Text") {
    Code, der beim Tippen auf den Button ausgeführt wird
}
```

Zum Beispiel:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Nach dem Ausführen erscheint ein Button mit der Beschriftung `Start`.

![Button](../../RESOURCE/008_button1.png)

Wenn die Nutzerin oder der Nutzer auf den Button tippt, wird der Code innerhalb der `{}` ausgeführt.

Wichtig ist: `Button` ist ein SwiftUI-UI-Element (`View`) und muss deshalb innerhalb von `body` stehen.

### Der Modifikator buttonStyle

In SwiftUI stellt `Button` einige integrierte Systemstile bereit, die über den Modifikator `buttonStyle` verwendet werden können.

Zum Beispiel:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` verwendet einen vom System bereitgestellten Button-Stil.

Häufige Optionen sind:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Die Unterschiede zwischen den Stilen zeigen sich vor allem darin, ob der Button einen Rahmen, einen Hintergrund und wie viel visuelle Hervorhebung er hat.

## print-Ausgabe

Beim Programmieren müssen wir oft prüfen, ob das Programm einen bestimmten Codeabschnitt wirklich erreicht hat.

Swift stellt dafür die Funktion `print` zur Ausgabe von Debug-Informationen bereit.

Grundlegende Schreibweise:

```swift
print("Hello")
```

Diese Zeile gibt den Text in der `Console` aus.

### Testen, ob ein Button funktioniert

Wir können `print` in einen Button schreiben, um zu testen, ob der Button wirklich gedrückt wurde.

```swift
Button("Start") {
    print("Test 123")
}
```

Wenn der Button gedrückt wird, gibt die `Console` Folgendes aus:

```text
Test 123
```

Das zeigt, dass der Button erfolgreich ausgelöst wurde.

![Button](../../RESOURCE/008_button3.png)

Wichtig: `print` ist Swift-Code und kein UI-Element. Es kann deshalb nicht direkt in `body` stehen, sonst entsteht ein Fehler.

Zum Beispiel ist dies falsch:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Fehler: body muss ein View zurückgeben
    }
}
```

In SwiftUI beschreibt `body` die Struktur der Oberfläche. Deshalb dürfen dort nur UI-Elemente (`View`) stehen, zum Beispiel `Text`, `Button` oder `Image`.

Normaler Code wie Berechnungen oder `print` muss in Buttons, Funktionen oder andere Event-Handler geschrieben werden.

### Die Console

Die mit `print` ausgegebenen Inhalte erscheinen in der `Console` von Xcode.

Wenn du die `Console` nicht siehst, kannst du unten rechts auf `Show the Debug Area` klicken, um den Debug-Bereich zu öffnen, und danach auf `Show the Console`, um die Konsole anzuzeigen.

![](../../RESOURCE/008_button4.png)

Unten links in der `Console` gibt es zwei Tabs: `Executable` und `Previews`.

![](../../RESOURCE/008_button5.png)

Diese beiden Tabs gehören zu unterschiedlichen Laufumgebungen: Wenn du eine View im Canvas in der Vorschau betrachtest, erscheinen `print`-Ausgaben im Tab `Previews`. Wenn du die App im Simulator oder auf einem physischen Gerät ausführst, erscheinen sie im Tab `Executable`.

Wenn du also keine `print`-Ausgabe siehst, solltest du zuerst prüfen, ob du den richtigen Tab ausgewählt hast.

## Beispiel: ASCII-Art

In einigen Code-Projekten sieht man häufig ASCII-Art.

ASCII-Art sind Bilder, die aus normalen Zeichen zusammengesetzt werden, zum Beispiel:

![ASCII](../../RESOURCE/008_ascii.png)

Wir können mit einem Button plus `print` eine ASCII-Grafik ausgeben.

Beispielcode:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Wenn du auf den Button tippst, gibt die `Console` Folgendes aus:

```text
 /\_/\
( o.o )
 > ^ <
```

Hinweis: Das `\` innerhalb eines Strings muss als `\\` geschrieben werden, weil der Backslash in Strings ein Escape-Zeichen ist.

## Funktionen

In einem Button können wir Code direkt schreiben.

Zum Beispiel:

```swift
Button("Start") {
    print("Hello")
}
```

Wenn nur wenig Code vorhanden ist, ist das kein Problem. In der realen Entwicklung kann die Logik, die ein Button auslöst, jedoch sehr umfangreich werden.

Zum Beispiel:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Möglicherweise noch viel mehr Code
}
```

Wenn der Code immer länger wird, wirkt der direkt im Button geschriebene Code schnell unübersichtlich und wird schwerer lesbar und wartbar.

Deshalb fasst man solchen Code normalerweise in einer Funktion zusammen und ruft diese Funktion dann im Button auf.

### Was ist eine Funktion?

Eine Funktion ist ein wiederverwendbarer Codeabschnitt.

Wenn bestimmter Code ausgeführt werden soll, reicht es aus, die Funktion aufzurufen, und der darin enthaltene Code wird ausgeführt.

Dadurch wird die Codestruktur klarer, und derselbe Code lässt sich leichter mehrfach verwenden.

### Grundlegende Schreibweise

In Swift werden Funktionen mit dem Schlüsselwort `func` definiert:

```swift
func randomInt() {
    // code
}
```

Dieser Code definiert eine Funktion.

`randomInt` ist der Funktionsname, also die Kennung dieses Codeabschnitts.

`()` ist die Stelle für Parameter. Hier können Daten von außen an die Funktion übergeben werden. Wenn keine Daten benötigt werden, bleiben die Klammern leer.

Im Bereich `{}` steht der eigentliche Funktionscode. Alles, was die Funktion ausführen soll, wird dort hineingeschrieben.

Zum Beispiel:

```swift
func getName() {
    print("FangJunyu")
}
```

Diese Funktion gibt einen Text aus.

### Eine Funktion aufrufen

Die Definition einer Funktion erzeugt diese Codeeinheit nur. Wenn du sie tatsächlich ausführen möchtest, musst du sie aufrufen.

Der Aufruf geschieht, indem man hinter den Funktionsnamen `()` setzt:

```swift
getName()
```

Wenn das Programm zu dieser Zeile gelangt, wird der Code innerhalb der Funktion `getName` ausgeführt.

Vollständiges Beispiel:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Nach dem Ausführen gibt die `Console` Folgendes aus:

```text
FangJunyu
```

### Funktionen in SwiftUI verwenden

In SwiftUI-Views werden Funktionen normalerweise außerhalb von `body` geschrieben.

Zum Beispiel:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Wenn auf den Button getippt wird, wird die Funktion `getName()` aufgerufen.

So bleibt der UI-Code übersichtlich, während die konkrete Logik in einer Funktion verarbeitet wird.

### Funktionsparameter

Manchmal soll eine Funktion je nach übergebenen Daten unterschiedliche Dinge tun.

Zum Beispiel möchten wir vielleicht, dass die Funktion verschiedene Namen ausgeben kann, statt immer nur `"FangJunyu"`.

Dafür können wir Parameter verwenden. Parameter kann man als Daten verstehen, die beim Aufruf an die Funktion übergeben werden.

Zum Beispiel:

```swift
func getName(name: String) {
    print(name)
}
```

Diese Funktion hat nun einen zusätzlichen Parameter. `name` ist der Parametername, `String` der Parametertyp.

Das bedeutet, dass die Funktion Daten vom Typ `String` erhalten muss.

Da die Funktion jetzt Daten benötigt, müssen wir diese Daten beim Aufruf mitgeben.

```swift
getName(name: "Sam")
```

Wenn beim Aufruf `"Sam"` übergeben wird, verwendet die Funktion diesen Wert zur Ausgabe.

Ergebnis:

```text
Sam
```

## Beispiel: ASCII-Art über eine Funktion ausgeben

Im vorherigen Beispiel haben wir `print` direkt im Button geschrieben.

Wenn die ASCII-Grafik aber komplizierter wird, wird der Code schnell sehr lang. Dann kann man die Logik in eine Funktion auslagern, damit der UI-Code klarer bleibt.

Beispielcode:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Wenn du nach dem Ausführen auf den Button tippst, gibt die `Console` Folgendes aus:

```text
 /\_/\
( o.o )
 > ^ <
```

Hier passieren zwei Dinge, nachdem der Button gedrückt wurde:

1. Der Button ruft die Funktion `printCat()` auf
2. Der `print`-Code innerhalb der Funktion wird ausgeführt

Auf diese Weise ist der UI-Code nur noch für das Auslösen des Ereignisses zuständig, während die konkrete Logik in einer Funktion liegt.

In der Praxis werden die meisten Button-Aktionen über Funktionen umgesetzt.

## Zusammenfassung

In dieser Lektion haben wir drei wichtige Inhalte kennengelernt:

**1. Button**

`Button` ist das Steuerelement in SwiftUI, mit dem Aktionen ausgelöst werden.

```swift
Button("Start") {

}
```

Wenn die Nutzerin oder der Nutzer auf den Button tippt, wird der Code in den geschweiften Klammern ausgeführt.

**2. print**

`print` wird verwendet, um Debug-Informationen in die `Console` auszugeben.

```swift
print("Hello")
```

Entwicklerinnen und Entwickler können damit den Laufzustand des Programms überprüfen.

**3. Funktionen**

Eine Funktion ist ein wiederverwendbarer Codeabschnitt.

```swift
func sayHello() {
    print("Hello")
}
```

Eine Funktion aufrufen:

```swift
sayHello()
```

Wenn eine Funktion Daten benötigt, kann sie Parameter verwenden:

```swift
func sayHello(name: String) {
    print(name)
}
```

In den folgenden Lektionen werden wir weitere SwiftUI-Steuerelemente kennenlernen und sehen, wie Daten mit der Oberfläche interagieren.

## Übungen

Versuche, die folgenden Übungen zu lösen:

1. Erstelle einen Button mit dem Text `"Hello"`
2. Gib beim Tippen auf den Button in der `Console` `Hello Swift` aus
3. Schreibe den Ausgabecode in eine Funktion und rufe diese Funktion im Button auf
