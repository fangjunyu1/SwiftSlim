# Tierlexikon

In dieser Lektion üben wir weiter benutzerdefinierte Views und Datenübergabe.

Wir erstellen eine einfache Tierlexikon-Ansicht. Die Seite zeigt fünf Tiere an. Wenn du auf ein Tier tippst, erscheint eine Detailansicht, die das Bild, das Verbreitungsgebiet, den Lebensraum und die Beschreibung dieses Tieres zeigt.

Endergebnis:

![view](../../../Resource/029_view.png)

Mit diesem Beispiel können wir das Zusammenspiel von Datenstruktur, Listendarstellung, Tippinteraktion und Sheet-Präsentation üben.

## Bildressourcen vorbereiten

Zuerst müssen wir fünf Tierbilder vorbereiten:

- Delfin: `dolphin.jpg`
- Giraffe: `giraffe.jpg`
- Löwe: `lion.jpg`
- Panda: `panda.jpg`
- Eisbär: `polarBear.jpg`

Du kannst die folgenden Bildressourcen verwenden:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraffe](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Löwe](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Eisbär](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Nachdem du die Bilder heruntergeladen hast, ziehst du sie in den Ressourcenordner `Assets` des Xcode-Projekts.

![assets](../../../Resource/029_assets.png)

Beachte: Wenn du Bilder im Code verwendest, musst du die Endung `.jpg` normalerweise nicht schreiben.

Wenn der Name der Bildressource zum Beispiel `dolphin` ist, schreibst du im Code:

```swift
Image("dolphin")
```

Wenn der Bildname falsch geschrieben ist, kann das Bild nicht korrekt angezeigt werden.

Hinweis: Die oben genannten Bildressourcen stammen aus Wikimedia-Projekten. Bei der Verwendung wird empfohlen, die Originallinks und Quelleninformationen beizubehalten.

## Tierstruktur erstellen

Auf dieser Seite besitzt jedes Tier mehrere Informationen:

- Tiername
- Tierbild
- Tier-Emoji
- Verbreitungsgebiet
- Lebensraum
- Tierbeschreibung

Wenn wir diese Informationen in viele einzelne Variablen aufteilen, wird der Code unübersichtlich. Deshalb können wir eine Struktur `Animal` erstellen und die Informationen eines Tieres zusammenfassen.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

In diesem Code:

- `id`: die eindeutige Kennung des Tieres.
- `name`: der Tiername.
- `imageName`: der Name des Tierbildes.
- `avatarEmoji`: das Tier-Emoji.
- `distributionArea`: das Verbreitungsgebiet.
- `habitat`: der Lebensraum.
- `animalDescription`: die Tierbeschreibung.

Dabei gilt:

```swift
let id = UUID()
```

`id` wird verwendet, um jedes Tier zu identifizieren. Später verwenden wir `ForEach`, um die Tierliste anzuzeigen, und außerdem `.sheet(item:)`, um basierend auf dem ausgewählten Tier die Details einzublenden. Deshalb muss `Animal` dem Protokoll `Identifiable` entsprechen.

Die Aufgabe von `Identifiable` besteht darin, SwiftUI mitzuteilen: Jedes Tier besitzt eine `id`, mit der seine Identität unterschieden werden kann.

## Tierdaten erstellen

Als Nächstes erstellen wir in `ContentView` ein Tier-Array.

Das Array speichert fünf `Animal`-Werte, und jeder `Animal`-Wert stellt ein Tier dar.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warme und gemäßigte Ozeane auf der ganzen Welt.",
            habitat: "Ozeane, Küstengewässer und einige große Flüsse.",
            animalDescription: "Delfine sind intelligente Meeressäuger. Sie leben in Gruppen, kommunizieren mit Lauten und sind für ihr verspieltes Verhalten bekannt."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannen und offene Waldgebiete in Afrika.",
            habitat: "Grasland, Savannen und offene Wälder.",
            animalDescription: "Giraffen sind die größten Landtiere. Sie haben lange Hälse, lange Beine und fressen normalerweise Blätter von hohen Bäumen."
        ),
        // Löwe
        Animal(
            name: "Löwe",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Hauptsächlich südlich der Sahara in Afrika, mit einer kleinen Population in Westindien.",
            habitat: "Grasland, Savannen und offene Waldgebiete.",
            animalDescription: "Löwen sind kräftige Großkatzen. Sie leben normalerweise in Gruppen, die Rudel genannt werden, und gelten oft als Könige der Tierwelt."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergwälder in Zentralchina.",
            habitat: "Bambuswälder in kühlen und feuchten Bergregionen.",
            animalDescription: "Pandas sind Bären, die für ihr schwarz-weißes Fell bekannt sind. Sie fressen hauptsächlich Bambus und gehören zu den bekanntesten Tieren der Welt."
        ),
        // Eisbär
        Animal(
            name: "Eisbär",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktische Regionen rund um den Nordpol.",
            habitat: "Meereis, Küstengebiete und kalte arktische Umgebungen.",
            animalDescription: "Eisbären sind große Bären, die an kalte Umgebungen angepasst sind. Sie sind starke Schwimmer und sind beim Jagen von Robben hauptsächlich auf Meereis angewiesen."
        )
    ]

    var body: some View {
        Text("Tierlexikon")
    }
}
```

Hier ist `animals` ein Array:

```swift
let animals: [Animal]
```

`[Animal]` bedeutet, dass dieses Array mehrere `Animal`-Werte speichert.

Das heißt, `animals` ist nicht ein einzelnes Tier, sondern eine Gruppe von Tieren.

## Tierliste anzeigen

Jetzt können wir `ForEach` verwenden, um die Tierliste anzuzeigen.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Anzeigeergebnis:

![view](../../../Resource/029_view1.png)

In diesem Code:

```swift
ForEach(animals) { animal in
    ...
}
```

bedeutet, dass das Array `animals` durchlaufen wird.

Bei jedem Durchlauf steht `animal` für das Tier, das gerade angezeigt wird.

Beim ersten Durchlauf ist `animal` zum Beispiel der Delfin; beim zweiten Durchlauf ist `animal` die Giraffe.

Deshalb können wir die Informationen des aktuellen Tieres auf folgende Weise anzeigen:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

So können alle fünf Tiere angezeigt werden.

## Tierliste antippbar machen

Jetzt wird die Liste zwar angezeigt, aber sie kann noch nicht angetippt werden.

Wenn wir nach dem Tippen auf ein Tier Details anzeigen möchten, müssen wir zuerst das „aktuell ausgewählte Tier“ speichern.

Deshalb fügen wir in `ContentView` eine Zustandsvariable hinzu:

```swift
@State private var selectedAnimal: Animal? = nil
```

Hier ist `selectedAnimal` ein optionaler Wert vom Typ `Animal?`.

Das bedeutet: Es kann ein Tier enthalten sein, oder es kann kein Tier enthalten sein.

Der Standardwert ist `nil`, was bedeutet, dass am Anfang kein Tier ausgewählt ist.

Danach ändern wir jede Tierzeile in einen `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Die wichtigste Codezeile ist diese:

```swift
selectedAnimal = animal
```

Wenn der Benutzer auf ein Tier tippt, speichern wir dieses Tier in `selectedAnimal`.

Wenn der Benutzer zum Beispiel auf den Delfin tippt, speichert `selectedAnimal` den Delfin.

Wenn der Benutzer auf den Panda tippt, speichert `selectedAnimal` den Panda.

Mit anderen Worten: `selectedAnimal` zeichnet auf, welches Tier der Benutzer gerade angetippt hat.

## Sheet-Ansicht präsentieren

Jetzt können wir über den Button das „aktuell angetippte Tier“ speichern.

Als Nächstes müssen wir eine präsentierte Ansicht implementieren, um die Tierdetails anzuzeigen.

![view](../../../Resource/029_view2.png)

In SwiftUI können wir `Sheet` verwenden, um diesen Präsentationseffekt umzusetzen.

Ein `Sheet` kann als eine vorübergehend präsentierte Seite verstanden werden. Es erscheint über der aktuellen Seite, und nachdem der Benutzer den Inhalt angesehen hat, kann er nach unten wischen, um es zu schließen.

## Sheet-Beispiel

Bevor wir die Tierdetails wirklich anzeigen, verwenden wir zuerst ein einfaches Beispiel, um zu verstehen, wie ein `Sheet` präsentiert wird.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Sheet anzeigen")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet-Ansicht")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Anzeigeergebnis:

![view](../../../Resource/029_view3.png)

In diesem Code erstellen wir einen Booleschen Wert:

```swift
@State private var showSheet = false
```

`showSheet` ist standardmäßig `false`, was bedeutet, dass das `Sheet` am Anfang nicht angezeigt wird.

Wenn der Button angetippt wird:

```swift
showSheet.toggle()
```

bedeutet `toggle()`, den Booleschen Wert umzuschalten.

Wenn der ursprüngliche Wert `false` war, wird er nach dem Aufruf von `toggle()` zu `true`.

Wenn der ursprüngliche Wert `true` war, wird er nach dem Aufruf von `toggle()` zu `false`.

Nach dem Antippen des Buttons ändert sich `showSheet` also von `false` zu `true`.

Wenn `showSheet` zu `true` wird, präsentiert der folgende Code das `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-Ansicht")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Dieser Code bedeutet: Wenn `showSheet` `true` ist, wird ein `Sheet` präsentiert und im `Sheet` wird `Text("Sheet-Ansicht")` angezeigt.

Anzeigeergebnis:

![view](../../../Resource/029_view4.png)

Diese Schreibweise eignet sich zum Präsentieren fester Inhalte.

Zum Beispiel kann nach dem Tippen auf einen Button eine Einstellungsseite, eine Erklärungsseite, eine Hinweis-Seite usw. angezeigt werden.

### Position des Sheets

Obwohl `Sheet` eine präsentierte Ansicht ist, wird es in SwiftUI nicht wie `Text()` oder `Image()` direkt als eigenständige View geschrieben, sondern als View Modifier verwendet.

Das heißt, `.sheet(...)` ist ähnlich wie Modifier wie `.font()`, `.padding()` und `.shadow()`. Es muss an eine View angehängt werden.

Zum Beispiel:

```swift
Button("Sheet anzeigen") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-Ansicht")
}
```

In diesem Beispiel wird `.sheet` an den `Button` angehängt.

Wenn `showSheet` zu `true` wird, präsentiert SwiftUI das `Sheet` und zeigt den Inhalt in den geschweiften Klammern an:

```swift
Text("Sheet-Ansicht")
```

In der tatsächlichen Entwicklung fügt man jedoch, wenn eine Seite mehrere Buttons hat, normalerweise nicht jedem Button ein `.sheet` hinzu.

Häufiger ist es, `.sheet` an die äußere View anzuhängen.

Zum Beispiel:

```swift
VStack {
    Button("Sheet anzeigen") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-Ansicht")
}
```

Der Button ist dafür verantwortlich, `showSheet` zu ändern, und die äußere View ist dafür verantwortlich, je nachdem, ob `showSheet` `true` ist, das `Sheet` zu präsentieren.

## Sheet an einen optionalen Wert binden

Die Schreibweise, die wir zuvor gelernt haben, war:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-Ansicht")
}
```

Diese Schreibweise eignet sich dafür, die Anzeige und das Ausblenden einer festen Seite zu steuern.

Im Tierlexikon-Beispiel müssen wir jedoch nicht nur wissen, „ob das `Sheet` präsentiert werden soll“, sondern auch „welches Tier angetippt wurde“.

Zum Beispiel:

Wenn der Benutzer auf den Delfin tippt, soll das `Sheet` die Details des Delfins anzeigen.

Wenn der Benutzer auf den Panda tippt, soll das `Sheet` die Details des Pandas anzeigen.

Deshalb eignet sich hier eine andere Sheet-Schreibweise besser:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Inhalt, der im Sheet angezeigt wird
}
```

In diesem Code ist `Sheet` an den optionalen Wert `selectedAnimal` gebunden.

Beachte: Nach `item:` schreiben wir `$selectedAnimal`, nicht `selectedAnimal`.

Denn `Sheet` liest nicht nur den Wert von `selectedAnimal`, sondern muss auch anhand seiner Änderungen entscheiden, ob es präsentiert wird.

Du kannst diesen Code so verstehen:

- Wenn `selectedAnimal` `nil` ist, wird das `Sheet` nicht angezeigt.
- Wenn `selectedAnimal` einen Wert hat, wird das `Sheet` angezeigt.
- Wenn das `Sheet` geschlossen wird, setzt SwiftUI `selectedAnimal` wieder auf `nil`.

SwiftUI übergibt das in `selectedAnimal` gespeicherte Tier an `animal` innerhalb der geschweiften Klammern.

Mit anderen Worten: `.sheet(item:)` steuert nicht nur die Präsentation, sondern übergibt auch die ausgewählten Daten an das `Sheet`.

## Mit Sheet den Tiernamen anzeigen

Jetzt sollten wir noch nicht sofort eine komplexe Detailansicht erstellen.

Damit der Code leichter zu verstehen ist, zeigen wir zuerst im `Sheet` den Namen des aktuellen Tieres an.

Füge `.sheet(item:)` außerhalb des `VStack` hinzu:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Der wichtigste Teil ist hier dieser Code:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Wenn `selectedAnimal` einen Wert hat, wird das `Sheet` präsentiert.

Das `animal` innerhalb der geschweiften Klammern ist das aktuell ausgewählte Tier.

Deshalb:

```swift
Text(animal.name)
```

zeigt den Namen des aktuell angetippten Tieres an.

Wenn du zum Beispiel auf `Delfin` tippst, zeigt das Sheet `Delfin` an.

Wenn du auf `Panda` tippst, zeigt das `Sheet` `Panda` an.

Auf diese Weise haben wir den Effekt umgesetzt, dass beim Tippen auf verschiedene Tiere verschiedene Tiernamen präsentiert werden.

Tiernamen anzeigen:

![view](../../../Resource/029_view5.png)

Tierdetails sollten jedoch nicht nur einen Namen anzeigen. Sie sollten außerdem den Namen, das Verbreitungsgebiet, den Lebensraum und die Beschreibung anzeigen.

Wenn wir all diesen Code in `.sheet` schreiben, wird der Code sehr lang und schwer lesbar.

Deshalb erstellen wir als Nächstes eine neue benutzerdefinierte View, die speziell für die Anzeige der Tierdetails verantwortlich ist.

## Tierdetailansicht erstellen

Als Nächstes erstellen wir eine neue benutzerdefinierte View namens `AnimalDetailView`.

Diese View empfängt ein `Animal` und zeigt die Tierdetails an.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Verbreitungsgebiet**: \(animal.distributionArea)")

                    Divider()

                    Text("**Lebensraum**: \(animal.habitat)")

                    Divider()

                    Text("**Tierbeschreibung**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Anzeigeergebnis:

![view](../../../Resource/029_view2.png)

Der wichtigste Punkt ist hier:

```swift
var animal: Animal
```

Das bedeutet, dass `AnimalDetailView` ein Tier von außen empfangen muss.

Nachdem das Tier empfangen wurde, kann die Detailansicht die verschiedenen Informationen dieses Tieres verwenden:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Mit anderen Worten: `AnimalDetailView` ist nur dafür verantwortlich, das übergebene Tier anzuzeigen.

### Markdown-Fettschrift

In der Detailansicht haben wir solchen Code geschrieben:

```swift
Text("**Lebensraum:** \(animal.habitat)")
```

Hier gibt es zwei Punkte zu verstehen.

Erstens verwendet `**Lebensraum:**` die `Markdown`-Syntax. Text, der von zwei Sternchen umschlossen ist, wird fett angezeigt.

Zweitens ist `\()` String-Interpolation. Damit kann der Wert einer Variablen innerhalb eines Textes angezeigt werden.

Dieser Code zeigt zuerst das fett gesetzte `Lebensraum:` an und danach den Lebensraum dieses Tieres.

## Detailansicht im Sheet anzeigen

Nachdem wir `AnimalDetailView` erstellt haben, können wir zu `ContentView` zurückkehren und die ursprüngliche Namensansicht im `Sheet` durch die Detailansicht ersetzen.

Ursprünglich war es:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Jetzt ändern wir es zu:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Hier ist `animal:` der Parametername von `AnimalDetailView`.

Das dahinter stehende `animal` ist das aktuelle Tier, das von `.sheet(item:)` übergeben wird.

Das heißt, das aktuell angetippte Tier wird an `AnimalDetailView` übergeben und angezeigt.

Vollständige Struktur:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

Wenn der Benutzer auf ein Tier tippt:

```swift
selectedAnimal = animal
```

ändert sich `selectedAnimal` von `nil` zu einem konkreten Tier. Nachdem das `Sheet` erkannt hat, dass `selectedAnimal` einen Wert hat, präsentiert es die View.

Das `Sheet` übergibt das Tier in `selectedAnimal` an die View `AnimalDetailView`, und `AnimalDetailView` zeigt die Tierdetails an.

So haben wir die Funktion umgesetzt, dass beim Tippen auf die Tierliste die entsprechenden Tierdetails präsentiert werden.

## Unterschied zwischen den zwei Sheet-Schreibweisen

Jetzt haben wir mit `.sheet(item:)` die Anzeige der Tierdetailansicht fertiggestellt.

Hier können wir die zwei häufigen Schreibweisen von `Sheet` kurz zusammenfassen.

### Die erste Schreibweise bindet einen Booleschen Wert

```swift
@State private var showSheet = false

Button("Sheet anzeigen") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-Ansicht")
}
```

Diese Schreibweise eignet sich zum Präsentieren fester Inhalte, zum Beispiel einer Einstellungsseite, einer Erklärungsseite, einer Hinweis-Seite usw.

`showSheet` ist ein Boolescher Wert mit nur zwei Zuständen: `true` und `false`.

Wenn `showSheet` `true` ist, wird das `Sheet` angezeigt.

Wenn `showSheet` `false` ist, wird das `Sheet` nicht angezeigt.

### Die zweite Schreibweise bindet einen optionalen Wert

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Diese Schreibweise eignet sich dafür, je nach ausgewählten Daten unterschiedliche Inhalte zu präsentieren.

In dieser Lektion tippen wir verschiedene Tiere an und müssen unterschiedliche Tierdetails anzeigen. Deshalb ist `.sheet(item:)` besser geeignet.

## Vollständiger Code

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Tiername
    let name: String
    
    // Tierbild
    let imageName: String
    
    // Tier-Emoji
    let avatarEmoji: String
    
    // Verbreitungsgebiet
    let distributionArea: String
    
    // Lebensraum
    let habitat: String
    
    // Tierbeschreibung
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warme und gemäßigte Ozeane auf der ganzen Welt.",
            habitat: "Ozeane, Küstengewässer und einige große Flüsse.",
            animalDescription: "Delfine sind intelligente Meeressäuger. Sie leben in Gruppen, kommunizieren mit Lauten und sind für ihr verspieltes Verhalten bekannt."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannen und offene Waldgebiete in Afrika.",
            habitat: "Grasland, Savannen und offene Wälder.",
            animalDescription: "Giraffen sind die größten Landtiere. Sie haben lange Hälse, lange Beine und fressen normalerweise Blätter von hohen Bäumen."
        ),
        // Löwe
        Animal(
            name: "Löwe",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Hauptsächlich südlich der Sahara in Afrika, mit einer kleinen Population in Westindien.",
            habitat: "Grasland, Savannen und offene Waldgebiete.",
            animalDescription: "Löwen sind kräftige Großkatzen. Sie leben normalerweise in Gruppen, die Rudel genannt werden, und gelten oft als Könige der Tierwelt."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bergwälder in Zentralchina.",
            habitat: "Bambuswälder in kühlen und feuchten Bergregionen.",
            animalDescription: "Pandas sind Bären, die für ihr schwarz-weißes Fell bekannt sind. Sie fressen hauptsächlich Bambus und gehören zu den bekanntesten Tieren der Welt."
        ),
        // Eisbär
        Animal(
            name: "Eisbär",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktische Regionen rund um den Nordpol.",
            habitat: "Meereis, Küstengebiete und kalte arktische Umgebungen.",
            animalDescription: "Eisbären sind große Bären, die an kalte Umgebungen angepasst sind. Sie sind starke Schwimmer und sind beim Jagen von Robben hauptsächlich auf Meereis angewiesen."
        )
    ]
    
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
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Verbreitungsgebiet**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Lebensraum**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Tierbeschreibung**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Zusammenfassung

In dieser Lektion haben wir eine einfache Tierlexikon-Seite fertiggestellt.

Zuerst haben wir die Struktur `Animal` verwendet, um Tierinformationen zu speichern. Danach haben wir ein Array verwendet, um fünf Tiere zu speichern, und anschließend `ForEach` genutzt, um die Tierliste anzuzeigen.

Wenn der Benutzer auf ein Tier tippt, speichern wir dieses Tier in `selectedAnimal`:

```swift
selectedAnimal = animal
```

Wenn `selectedAnimal` einen Wert hat, präsentiert `.sheet(item:)` die Detailansicht und übergibt das ausgewählte Tier an `AnimalDetailView`.

Der wichtigste Punkt dieser Lektion ist nicht der Stil der Oberfläche, sondern das Verständnis dieser Datenübergabe-Route:

```swift
Tier antippen → selectedAnimal speichert Tier → Sheet wird präsentiert → AnimalDetailView zeigt Details an
```

Nachdem du diese Route verstanden hast, kannst du später weitere ähnliche Funktionen erstellen, zum Beispiel Produktdetails, Kursdetails, Artikeldetails, Kontaktdetails usw.
