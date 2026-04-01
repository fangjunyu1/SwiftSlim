# Schleifen und Listen

In dieser Lektion lernen wir die `for`-Schleife in Swift und `ForEach` in SwiftUI kennen.

Beide helfen uns dabei, die Elemente eines Arrays der Reihe nach zu lesen. In der tatsächlichen Entwicklung müssen wir oft eine Gruppe von Daten nacheinander herausnehmen und sie dann verarbeiten oder anzeigen. Schleifen sind genau das wichtige Werkzeug, um das zu erreichen.

Wenn wir im Web surfen oder eine App benutzen, sehen wir oft viele Listen oder Einträge. Solche Inhalte werden normalerweise zuerst in einem `Array` gespeichert, dann mit einer `Schleife` nacheinander gelesen und schließlich auf der Oberfläche angezeigt.

Zum Beispiel die Google-Suchergebnisliste:

![Google](../../Resource/017_google.png)

Jeder Eintrag in der Suchergebnisliste entspricht normalerweise einem Datenelement und wird durch eine Schleife nacheinander angezeigt.

Deshalb treten `Arrays` und `Schleifen` oft gemeinsam auf. Das `Array` ist dafür zuständig, eine Gruppe von Daten zu speichern, und die `Schleife` ist dafür zuständig, diese Daten der Reihe nach herauszunehmen und dieselbe Operation auszuführen.

Als Nächstes beginnen wir mit der grundlegendsten `for`-Schleife.

## Countdown

Nehmen wir an, wir möchten eine Countdown-Funktion simulieren und nacheinander `„5, 4, 3, 2, 1“` ausgeben.

Die direkteste Schreibweise ist:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Diese Methode kann zwar einen Countdown simulieren, aber wenn der Inhalt umfangreicher wird, wirkt sie sehr wiederholend und ist später auch nicht bequem zu ändern.

In diesem Fall können wir die Daten zuerst in ein Array legen und dann mit einer `for`-Schleife nacheinander ausgeben:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Diese Schreibweise ist kompakter und leichter zu erweitern. Selbst wenn es viele Zahlen im Countdown gibt, müssen wir `print` nicht Zeile für Zeile wiederholen. Wir müssen die Schleife nur jedes Element des Arrays automatisch verarbeiten lassen.

Wir können diesen Code zum Testen in einen Button setzen:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Wenn der Button angetippt wird, nimmt die `for`-Schleife jede ganze Zahl in `countDown` der Reihe nach heraus und gibt sie in der Konsole aus.

Als Nächstes schauen wir uns an, wie die `for`-Schleife funktioniert.

## for-Schleife

Die `for`-Schleife wird verwendet, um eine Gruppe von Daten der Reihe nach zu verarbeiten. Die häufigsten Objekte sind Arrays und Bereiche.

Grundlegende Schreibweise:

```swift
for Element in ArrayOderBereich {
    auszuführenderCode
}
```

Zum Beispiel der Countdown-Code von eben:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Hier steht `i` für das aktuell herausgenommene Element, und nach `in` stehen die Daten, über die iteriert wird, also das Array `countDown`.

Die Bedeutung dieses Codes ist: Das Programm nimmt jedes Element aus dem Array `countDown` der Reihe nach heraus. Jedes Mal, wenn ein Element herausgenommen wird, wird es vorübergehend durch `i` dargestellt, und dann wird der Code in den geschweiften Klammern ausgeführt.

Der Ablauf lässt sich so verstehen:

* Das erste herausgenommene Element ist `5`, also ist der Wert von `i` zu diesem Zeitpunkt `5`
* `print(i)` wird ausgeführt und `5` wird ausgegeben
* Danach wird das nächste Element `4` herausgenommen
* `print(i)` wird erneut ausgeführt und `4` wird ausgegeben

Die folgenden `3`, `2` und `1` werden auf dieselbe Weise nacheinander ausgeführt.

![for](../../Resource/017_for.png)

Wenn alle Elemente im Array verarbeitet wurden, endet die `for`-Schleife automatisch.

Mit der `for`-Schleife können wir jedes Element im Array erhalten und damit Funktionen wie diesen Countdown umsetzen.

**Tipp**: `i` ist eine sehr häufige Benennung in einer `for`-Schleife und wird verwendet, um das aktuell herausgenommene Element darzustellen. Es ist aber keine feste Vorgabe, du kannst auch andere englische Namen verwenden.

Zum Beispiel kann `num` verwendet werden, um jedes herausgenommene Element darzustellen:

```swift
for num in countDown {
    print(num)
}
```

Innerhalb der geschweiften Klammern musst du dann ebenfalls `num` verwenden, um das aktuelle Element darzustellen.

### Über einen Bereich schleifen

Die `for`-Schleife kann nicht nur über Arrays laufen, sondern auch über Bereiche.

Wenn wir zum Beispiel die Summe der positiven ganzen Zahlen bis `50` berechnen möchten, müssen wir alle ganzen Zahlen von `1` bis `50` nacheinander addieren.

Die direkteste Schreibweise wäre vielleicht:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Das Problem bei dieser Schreibweise ist, dass wir jede Zahl manuell schreiben müssen. Das ist umständlich und für echte Entwicklungsszenarien ungeeignet.

In diesem Fall können wir den Bereichsoperator zusammen mit der `for`-Schleife verwenden.

Im vorherigen Kapitel über „Operatoren“ haben wir den Bereichsoperator bereits kennengelernt:

```swift
1...3   // 1, 2, 3
```

Hier bedeutet `...` einen geschlossenen Bereich, also einen Bereich, der sowohl den Start- als auch den Endwert enthält.

Deshalb können wir hier die `for`-Schleife über den Ganzzahlbereich von `1` bis `50` verwenden:

```swift
for i in 1...50 {
    
}
```

Wir müssen diese ganzen Zahlen addieren, also brauchen wir auch eine Variable, um die Summe zu speichern:

```swift
var count = 0
```

Dann addieren wir bei jedem Schleifendurchlauf die aktuell herausgenommene Zahl zu `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Dieser Code bedeutet:

* `count` wird verwendet, um die aktuelle Summe zu speichern
* Die `for`-Schleife nimmt die ganzen Zahlen von `1` bis `50` nacheinander heraus
* Jedes Mal, wenn eine ganze Zahl herausgenommen wird, wird `count += i` ausgeführt
* Wenn die Schleife beendet ist, befindet sich die endgültige Summe in `count`

So können wir die Summe aller positiven ganzen Zahlen bis `50` erhalten.

Genauso gilt: Wenn wir die Summe der ganzen Zahlen von `1` bis `100` berechnen möchten, müssen wir nur den Bereich ändern:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Die `for`-Schleife kann also nicht nur über Arrays laufen, sondern auch über einen Bereich.

Diese Fähigkeit, wiederholte Daten der Reihe nach zu verarbeiten, ist in der Entwicklung sehr verbreitet.

Sie hilft uns dabei, viele wiederholende Aufgaben automatisch zu erledigen, ohne jede Zahlensumme oder andere ähnliche wiederholte Operationen manuell schreiben zu müssen.

## Schleifen in SwiftUI

Die vorherige `for`-Schleife gehört zur Swift-Sprache.

In SwiftUI können wir `for` aber nicht direkt in der View-Struktur verwenden, um Views zu erzeugen:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Der Grund ist, dass sich innerhalb von `VStack` SwiftUI-Views befinden müssen, während eine normale `for`-Schleife selbst keine View ist.

Wenn wir in SwiftUI die Oberfläche abhängig vom Inhalt eines Arrays wiederholt erzeugen möchten, müssen wir `ForEach` verwenden.

Wenn wir zum Beispiel die Namen aller Mitglieder einer Gruppe anzeigen möchten, können wir es so schreiben:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Anzeigenergebnis:

![for1](../../Resource/017_for1.png)

Danach fügen wir jedem `Text` dieselben Modifier hinzu:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Jetzt wird jeder `Text` mit einer kleineren und fetteren Schrift angezeigt.

Anzeigenergebnis:

![](../../Resource/017_for2.png)

Obwohl die Modifier die Oberfläche schöner machen, machen sie den Code auch länger und wiederholender.

Wenn später weitere Namen hinzukommen oder wir Schriftart, Farbe oder andere Stile einheitlich ändern möchten, müssten wir viel ähnlichen Code wiederholt schreiben und anpassen. Das ist umständlich und auch nicht besonders wartungsfreundlich.

In diesem Fall können wir diese Namen zuerst in ein Array legen und dann `ForEach` in SwiftUI verwenden, um auf Grundlage der Daten im Array wiederholt Views zu erzeugen:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Dieser Code ist kompakter. `ForEach` liest jedes Element des Arrays der Reihe nach und zeigt den entsprechenden Inhalt auf der Oberfläche an.

Wenn wir später neue Namen hinzufügen, müssen wir nur den Inhalt des Arrays `names` ändern und nicht jedes Mal erneut `Text` und dieselben Modifier hinzufügen.

## ForEach

`ForEach` ist eine Struktur in SwiftUI, die verwendet wird, um Views wiederholt zu erzeugen. Du kannst sie als eine Art Struktur verstehen, die in SwiftUI einer `for`-Schleife ähnelt.

Grundlegende Verwendung:

```swift
ForEach(Array, id: \.self) { Element in
    SwiftUI-Code
}
```

Zum Beispiel die Gruppennamen von eben:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Dieser Code bedeutet:

`names` ist das Array, über das iteriert wird, also die Daten, die angezeigt werden sollen.

`id:\.self` bedeutet, dass das Element selbst im Array verwendet wird, um jedes einzelne Element zu unterscheiden.

Im aktuellen Beispiel enthält das Array Zeichenketten:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Deshalb verwendet SwiftUI direkt die Zeichenketten `"Sam"`, `"John"`, `"Wathon"` und `"Bob"` selbst, um die verschiedenen Inhalte zu unterscheiden.

Für einfache Arrays, die in der Anfängerphase häufig vorkommen, wie `String` und `Int`, können wir normalerweise einfach Folgendes schreiben:

```swift
id: \.self
```

Im Moment musst du dir nur diese eine Schreibweise merken. Es ist nicht nötig, jetzt schon tiefer in weitere Regeln für `id` einzusteigen.

In `item in` steht `item` für das aktuell herausgenommene Element.

Zum Beispiel ist `item` beim ersten Durchlauf `"Sam"` und beim zweiten Durchlauf `"John"`.

Deshalb wird:

```swift
Text(item)
```

nacheinander zu:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Die Funktion dieses Codes ist also: Jedes Element aus dem Array `names` nacheinander herauszunehmen und für jeden Namen eine `Text`-View zu erzeugen.

### Ausführungsablauf

Der Ausführungsablauf lässt sich so verstehen:

* `ForEach` liest zuerst das erste Element `"Sam"` aus dem Array `names`
* `item` steht vorübergehend für `"Sam"`
* `Text(item)` zeigt `"Sam"` an
* Danach wird das nächste Element `"John"` gelesen
* Dann wird derselbe View-Code erneut ausgeführt

Am Ende werden alle Namen im Array angezeigt.

Der Vorteil dieser Schreibweise ist: Wenn mehr Namen hinzukommen, müssen wir nicht viele `Text`-Views wiederholt schreiben, sondern nur den Inhalt des Arrays ändern.

### Bilder durchlaufen

`ForEach` kann nicht nur Text anzeigen, sondern auch Bilder, Farben oder andere SwiftUI-Views.

Zum Beispiel bereiten wir 4 Bilder vor:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Ziehe diese vier Bilder in den Assets-Ordner von Xcode.

![image](../../Resource/017_for3.png)

Wenn wir `ForEach` nicht verwenden, müssen wir jedes Bild manuell schreiben:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Anzeigenergebnis:

![image](../../Resource/017_for4.png)

Diese Schreibweise kann die Funktion zwar umsetzen, aber der Code wird relativ lang.

Wenn es immer mehr Bilder gibt, müssen wir immer mehr `Image`-Code wiederholt schreiben.

Wenn wir später die Bildgröße einheitlich ändern möchten, müssten wir sie ebenfalls einzeln anpassen.

In diesem Fall können wir die Bildnamen in ein Array legen und dann `ForEach` verwenden, um die Bild-Views wiederholt zu erzeugen:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Hier ist `images` ein String-Array, und jedes Element darin ist ein Bildname.

`ForEach(images, id: \.self)` bedeutet: Jedes Element des Arrays `images` wird der Reihe nach gelesen, das Element selbst wird verwendet, um jeden Eintrag zu unterscheiden, und dann wird auf Grundlage des aktuellen Elements die entsprechende View erzeugt.

Wenn zum Beispiel als Erstes `"430F9BEF"` gelesen wird, dann entspricht:

```swift
Image(item)
```

dem hier:

```swift
Image("430F9BEF")
```

Die folgenden Bilder werden auf dieselbe Weise nacheinander angezeigt.

![image](../../Resource/017_for4.png)

Auch hier verwenden wir weiterhin:

```swift
id: \.self
```

Der Grund ist derselbe wie zuvor: Die Elemente im Array `images` sind ebenfalls einfache Strings. Deshalb können wir in der Anfängerphase direkt das Element selbst als Unterscheidungsmerkmal verwenden.

Du kannst es dir vereinfacht wie eine feste Formel merken:

**Wenn `ForEach` über ein einfaches Array vom Typ `String` oder `Int` läuft, schreiben wir normalerweise `id: \.self`.**

### Bilder hinzufügen

Wenn wir später weitere Bilder hinzufügen müssen, reicht es aus, den Inhalt des Arrays zu ändern:

```swift
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Wir müssen dann keinen neuen `Image`-Code wiederholt hinzufügen.

Wenn es viele Bilder gibt, können wir es zusammen mit `ScrollView` verwenden. Andernfalls kann der Inhalt nicht vollständig betrachtet werden, sobald er über den Bildschirm hinausgeht.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Bilder ändern

Wenn wir den Stil der Bilder einheitlich ändern möchten, müssen wir nur den Code innerhalb von `ForEach` anpassen.

Zum Beispiel, wenn wir die Breite auf `80` ändern:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Dann werden alle Bilder gleichzeitig geändert, und wir müssen sie nicht einzeln anpassen.

Das ist eine wichtige Aufgabe von `ForEach`:

**Wenn mehrere Views dieselbe Struktur haben und sich nur der Inhalt unterscheidet, können wir den View-Code nur einmal schreiben und dann die Daten im Array entscheiden lassen, was angezeigt wird.**

## Zusammenfassung

In dieser Lektion haben wir die `for`-Schleife und `ForEach` gelernt.

Die `for`-Schleife wird verwendet, um Elemente in einem Array oder Bereich der Reihe nach zu verarbeiten, und ist eher auf Datenverarbeitung ausgerichtet.

`ForEach` wird in SwiftUI verwendet, um auf Grundlage des Array-Inhalts wiederholt Views zu erzeugen, und ist stärker auf die Anzeige von Views ausgerichtet.

In der aktuellen Anfängerphase ist die häufigste Schreibweise von `ForEach`:

```swift
ForEach(Array, id: \.self) { Element in
    SwiftUI-Code
}
```

Hier bedeutet `id: \.self`, dass das Element selbst verwendet wird, um jedes einzelne Element zu unterscheiden.

Wenn der Inhalt des Arrays einfache Typen wie `String` oder `Int` sind, können wir am Anfang normalerweise genau diese eine Schreibweise verwenden.

Wenn du später beim Surfen im Web oder beim Benutzen von Apps auf Gruppen von wiederholtem Text, Bildern oder anderen Listeninhalten stößt, kannst du daran denken, dass solche Inhalte in SwiftUI normalerweise zuerst in ein Array gelegt und dann mit `ForEach` nacheinander angezeigt werden.
