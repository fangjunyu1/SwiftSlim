# Eine persönliche Lebenslauf-Seite erstellen

In dieser Lektion erstellen wir eine einfache persönliche Lebenslauf-View und lernen dabei folgende Inhalte:

- `cornerRadius`
- `spacing`
- `ScrollView`

Während wir die Oberfläche aufbauen, wiederholen wir außerdem Layouts sowie `Text` und `Image`, und setzen Abstände und Scrollverhalten praktisch um.

## Persönlicher Lebenslauf

Zielansicht:

![Swift](../../RESOURCE/004_img.png)

**Versuche bitte zuerst, die Aufgabe selbstständig zu lösen, bevor du die folgende Erklärung liest.**

### Projekt erstellen

Erstelle ein neues iOS-Projekt oder verwende dein bisheriges Projekt weiter.

Der standardmäßige `ContentView`-Code sieht so aus:

```swift
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
```

Jetzt leeren wir den Code und beginnen mit unserem eigenen Inhalt:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Gesamtstruktur

In der praktischen Entwicklung entwerfen wir normalerweise zuerst die Gesamtstruktur.

Unsere Seite enthält:

1. Einen Titel
2. Persönliche Informationen
3. Eine persönliche Vorstellung

Wir fügen außen zuerst einen `VStack` hinzu:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` sorgt dafür, dass die Views vertikal angeordnet werden, und erlaubt uns, Anordnung und Abstände zu steuern.

### Titel

Zuerst erstellen wir einen `Text`, der den Titel anzeigt.

Hier verwende ich meinen englischen Namen als Titel:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Ein Titel ist meist größer und fett dargestellt. Deshalb verwenden wir hier die Modifikatoren `font` und `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Anordnung

SwiftUI verwendet standardmäßig die Ausrichtung `center`, deshalb erscheint der Titel zunächst in der Mitte von `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Wir möchten den Titel oben in der View anzeigen. Dafür können wir mit `Spacer` das Layout anpassen:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` belegt den restlichen Raum und schiebt den `Text` an den oberen Rand des Containers.

![Swift](../../RESOURCE/004_img4.png)

### Leerraum

Wenn dir der Text zu nah am oberen Rand erscheint, kannst du `padding` oder `Spacer` verwenden.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Damit erhält der `VStack` oben einen `padding`-Abstand von 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Du kannst auch einen `Spacer` mit festgelegter Höhe verwenden, um Leerraum mit einer bestimmten Höhe zu erzeugen.

Ergebnis:

![Swift](../../RESOURCE/004_img5.png)

### Bild

Wir bereiten ein eigenes Porträtfoto vor und legen es in den Ressourcenordner `Assets`.

![Swift](../../RESOURCE/004_img6.png)

In `ContentView` zeigen wir das Bild mit `Image` an:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Da die Originalgröße des Bildes recht groß ist, müssen wir mit `frame` die angezeigte Größe steuern.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Dabei fällt ein Problem auf:

Wenn das Seitenverhältnis von `frame` nicht zum ursprünglichen Bildverhältnis passt, wird das Bild verzerrt.

Zum Beispiel:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Um Verzerrungen zu vermeiden, müssen wir `scaledToFit` verwenden:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Die Aufgabe von `scaledToFit` ist:

Innerhalb des vorgegebenen `frame` das Bild nach seinem ursprünglichen Seitenverhältnis zu skalieren und den Bildinhalt vollständig anzuzeigen.

Es dehnt das Bild nicht gewaltsam, um den gesamten `frame` zu füllen, sondern behält das Seitenverhältnis bei und skaliert proportional, bis eine Seite gerade am Rand anliegt.

Das bedeutet:

- Wenn die Breite des `frame` kleiner ist, wird das Bild anhand der Breite skaliert.
- Wenn die Höhe des `frame` kleiner ist, wird das Bild anhand der Höhe skaliert.
- Das Bild behält immer sein ursprüngliches Verhältnis und wird nicht verzerrt.

Oft reicht es, nur eine Richtung festzulegen. Zum Beispiel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Dann berechnet das System anhand der Breite 140 automatisch eine passende Höhe und bewahrt dabei das Seitenverhältnis des Bildes.

Wenn du jedoch ein festes visuelles Verhältnis brauchst oder verhindern möchtest, dass das Bild in komplexeren Layouts zusammengedrückt wird, kannst du gleichzeitig Breite und Höhe einschränken.

### Abgerundete Ecken

Wenn das Bild mit abgerundeten Ecken angezeigt werden soll, kannst du den Modifikator `cornerRadius` verwenden:

```swift
.cornerRadius(10)
```

Zum Beispiel:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Wir fügen also nach den `Image`-Modifikatoren `cornerRadius(20)` hinzu.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` bedeutet, dass der Rand der View zugeschnitten und mit einem Radius von 20 abgerundet wird.

Nach dem Abrunden werden die vier Ecken des Bildes zu Rundungen, wodurch das Bild weicher und moderner wirkt.

Dieser Stil ist in aktuellem UI-Design sehr verbreitet. Zum Beispiel verwenden auch iOS-App-Icons eine Form mit abgerundeten Ecken, wobei System-Icons allerdings eine kontinuierlich gekrümmte Superellipse statt eines einfachen Radius nutzen.

### Persönliche Informationen

Jetzt setzen wir den Bereich mit den persönlichen Informationen links neben dem Bild um. An der Struktur der Oberfläche sieht man, dass persönliche Informationen und Bild horizontal angeordnet sind, deshalb verwenden wir `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Die Inhalte der persönlichen Informationen selbst sind vertikal angeordnet.

![Swift](../../RESOURCE/004_img11.png)

Deshalb verwenden wir außen `HStack`, für die persönlichen Informationen `VStack` und für den Inhalt `Text`.

Grundstruktur:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Feldüberschriften fett darstellen**

Damit sich Feldname und Feldwert besser unterscheiden lassen, können wir `fontWeight` für die Feldnamen verwenden:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Text links ausrichten**

`VStack` ist standardmäßig zentriert ausgerichtet. Wenn du möchtest, dass alle Texte linksbündig erscheinen, musst du die Ausrichtung festlegen:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` bedeutet linksbündige Ausrichtung in einer Schreibrichtung von links nach rechts.

![Swift](../../RESOURCE/004_img14.png)

### Abstand

Wenn zwischen den persönlichen Informationen und dem Bild ein fester Abstand bestehen soll, haben wir bisher `Spacer` verwendet, um Leerraum zu erzeugen:

```swift
Spacer()
    .frame(width: 10)
```

Du kannst aber auch den `spacing`-Parameter von `HStack` verwenden:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` bedeutet, dass der Abstand zwischen den beiden Child-Views 30 pt beträgt.

![Swift](../../RESOURCE/004_img15.png)

**Was ist spacing?**

In `VStack`, `HStack` und `ZStack` kann `spacing` den Abstand zwischen Child-Views steuern.

Zum Beispiel:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Dann wird der Abstand zwischen den Child-Views im `VStack` auf 10 pt gesetzt.

![Swift](../../RESOURCE/004_img16.png)

Wichtig dabei ist: `spacing` wirkt nur auf die direkten Child-Views und beeinflusst nicht das Layout innerhalb verschachtelter Container.

**Abstand innerhalb der Liste steuern**

Wenn du zwischen den Feldern mehr Abstand haben möchtest, ist der direkteste Weg, `spacing` für `VStack` zu setzen:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Dann wird der Abstand zwischen allen Child-Views 10 pt.

Wenn wir die Oberfläche aber genauer ansehen, fällt ein Problem auf:

Zwischen den Feldgruppen entsteht Abstand, aber gleichzeitig erscheint derselbe Abstand auch zwischen Feldnamen und Feldwert.

Das liegt daran, dass `spacing` auf alle direkten Child-Views des aktuellen Containers wirkt.

In dieser Struktur ist jeder `Text` eine direkte Child-View des äußeren `VStack`, deshalb ist der Abstand überall gleich.

Wenn du möchtest, dass es Abstand zwischen den Feldgruppen gibt, Feldname und Feldwert innerhalb einer Gruppe aber kompakt beieinander bleiben, kannst du "Feldname + Feldwert" als logische Einheit betrachten und jeweils in einen eigenen `VStack` packen:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Dann gilt: Zwischen den äußeren `VStack`-Elementen gibt es Abstand, innerhalb der inneren `VStack` bleibt der Standardabstand kompakt. Deshalb entsteht zwischen Feldnamen und Feldwert kein zusätzlicher Abstand.

![Swift](../../RESOURCE/004_img18.png)

### Persönliche Vorstellung

Als Nächstes setzen wir den Bereich für die persönliche Vorstellung um.

An der Struktur der Oberfläche sieht man, dass der Vorstellungstext aus mehreren Textzeilen besteht, die vertikal angeordnet sind.

![Swift](../../RESOURCE/004_img19.png)

Dafür können wir `VStack` zusammen mit `Text` verwenden:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Mehr Abstand hinzufügen**

Im Moment stehen der Bereich mit den persönlichen Informationen und die persönliche Vorstellung noch recht dicht beieinander, und das sieht noch nicht besonders gut aus.

![Swift](../../RESOURCE/004_img20.png)

Da beide Teile im selben äußeren Container liegen, können wir den Gesamtabstand über den äußeren Container steuern:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Ergebnis:

![Swift](../../RESOURCE/004_img21.png)

**Abstand in der Liste**

Verwende `spacing`, um den Abstand zwischen den Texten der persönlichen Vorstellung zu setzen:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Den persönlichen Lebenslauf fertigstellen

Jetzt ist das Grundgerüst unseres persönlichen Lebenslaufs fertig.

![Swift](../../RESOURCE/004_img.png)

### ScrollView

Im Moment verwenden wir für die Seitenstruktur `VStack`. Das ist kein Problem, solange der Vorstellungstext nur wenige Zeilen enthält. Wenn wir ihn jedoch auf 20, 30 oder noch mehr Einträge erweitern, überschreitet die Gesamthöhe des Inhalts den Bildschirm.

Zum Beispiel:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Dann treten zwei Effekte auf:

- Der Inhalt unten wird abgeschnitten
- Die Seite kann nicht gescrollt werden

Das ist kein Problem von `VStack`. `VStack` ist nur ein Layout-Container und stellt nicht automatisch Scrollfähigkeit bereit.

**Was ist ScrollView?**

`ScrollView` ist ein scrollbarer Container und eignet sich für größere Inhalte, die den Bildschirm überschreiten, zum Beispiel vertikale oder horizontale Listen.

Grundstruktur:

```swift
ScrollView {
    ...
}
```

Wenn wir Scrollverhalten möchten, müssen wir also den gesamten Seiteninhalt in `ScrollView` einbetten:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Dadurch wird die gesamte Seite zu einem scrollbaren Bereich. Wenn der Inhalt höher ist als der Bildschirm, kann die Seite ganz natürlich gescrollt werden.

Standardmäßig zeigt `ScrollView` eine Scrollleisten-Anzeige. Wenn du diese ausblenden möchtest, kannst du Folgendes setzen:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Vollständiger Code

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
