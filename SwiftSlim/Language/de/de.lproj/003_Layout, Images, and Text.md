# Layout, Bilder und Text

In der letzten Lektion haben wir den Code von `ContentView` kennengelernt:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In dieser Lektion lernen wir den Standard-Layoutmechanismus von SwiftUI sowie die Verwendung von Bildern und Text kennen. Auf Grundlage der vorherigen Lektion werden wir die Struktur und Darstellung von Views weiter verstehen. Dieses Wissen hilft uns dabei, grundlegende Oberflächenlayouts aufzubauen.

## Der Standard-Layoutmechanismus von SwiftUI

Wenn wir die `ContentView`-Vorschau betrachten, sehen wir, dass das Symbol und der Text zentriert angezeigt werden, statt oben zu beginnen.

![Swift](../../RESOURCE/003_view.png)

Standardmäßig ist die Ausrichtung eines Stack-Containers `.center`, daher erscheinen die enthaltenen Views in der Regel zentriert.

### Alignment-Ausrichtung

Zentrierte Ausrichtung ist natürlich nur eine von mehreren Möglichkeiten. Wenn wir eine linke oder rechte Ausrichtung möchten, müssen wir mit `alignment` steuern, wie die View ausgerichtet wird.

```swift
alignment
```

In SwiftUI kommt Ausrichtung typischerweise in zwei Situationen vor:

**1. Der Ausrichtungsparameter eines Stack-Containers**

Zum Beispiel, wenn das Symbol und der Text in `ContentView` links ausgerichtet werden sollen:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

Das `alignment` von `VStack` steuert die Ausrichtung in horizontaler Richtung.

Ausrichtungsoptionen:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` ordnet horizontal an, daher steuert `alignment` dort die vertikale Ausrichtung:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` ordnet überlagernd an. Dort kann `alignment` sowohl horizontale als auch vertikale Ausrichtung steuern:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Wenn `alignment` nicht explizit angegeben wird, verwenden `VStack`, `HStack` und `ZStack` standardmäßig `.center`.

**2. alignment innerhalb von frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Wenn `frame` mehr Platz bereitstellt, als die View selbst benötigt, bestimmt `alignment`, wo die View innerhalb dieses `frame` positioniert wird. Die konkrete Verwendung von `frame` besprechen wir später noch ausführlicher. Hier genügt ein erstes Verständnis.

### Spacer und die Verteilung von freiem Raum

Mit `alignment` können Views horizontal oder vertikal ausgerichtet werden. Wenn wir jedoch möchten, dass Text und Bild an gegenüberliegenden Enden erscheinen, reicht eine einfache Ausrichtung allein nicht aus.

Wenn wir zum Beispiel eine obere Leiste ähnlich wie auf der [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/)-Website erstellen möchten, mit dem NHK-Logo links und einem Menüsymbol rechts:

![Swift](../../RESOURCE/003_alignment3.png)

Wenn wir nur `alignment` verwenden, erscheinen sowohl das NHK-Logo als auch das Menüsymbol auf derselben Seite. Um die beiden Symbole links und rechts zu verteilen, brauchen wir `Spacer`, um den verbleibenden Raum aufzuteilen.

`Spacer` ist eine flexible Layout-View, die automatisch den restlichen freien Platz ausfüllt.

Verwendung:

```swift
Spacer()
```

Zum Beispiel:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Wenn wir zwischen `Image` und `Text` einen `Spacer` einfügen, füllt dieser den restlichen Platz aus und schiebt `Image` und `Text` jeweils an das obere und untere Ende.

![Swift](../../RESOURCE/003_view1.png)

Wenn mehrere `Spacer` vorhanden sind:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

wird der freie Platz gleichmäßig auf die `Spacer` verteilt.

![Swift](../../RESOURCE/003_spacer.png)

## Anzeige und Größensteuerung von Image

Die `Image`-View wird hauptsächlich zum Anzeigen von Bildern verwendet. Die SF-Symbols-Icons aus der letzten Lektion sind nur eine spezielle Verwendung von `Image`.

Verwendung:

```swift
Image("imageName")
```

Innerhalb der doppelten Anführungszeichen steht der Bildname, ohne Dateiendung.

### Bilder anzeigen

Zuerst bereiten wir ein Bild vor.

![Swift](../../RESOURCE/003_img.jpg)

Wähle in Xcode den Ressourcenordner `Assets` aus und ziehe das Bild in `Assets`.

![Swift](../../RESOURCE/003_img1.png)

In `ContentView` können wir das Bild mit `Image` anzeigen:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Hinweis: `Image` in SwiftUI unterstützt keine GIF-Animationen. Es kann nur einen statischen Frame anzeigen.

### Bildgröße steuern

In SwiftUI wird `Image` standardmäßig in seiner Originalgröße angezeigt. Wenn wir die angezeigte Größe ändern möchten, müssen wir zuerst mit `resizable` erlauben, dass das Bild skaliert werden kann, und anschließend mit `frame` die Layoutgröße festlegen.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Der Modifikator resizable

Der Modifikator `resizable` erlaubt es dem Bild, sich im Layout skalieren zu lassen, statt immer seine Originalgröße zu behalten.

```swift
.resizable()
```

Erst wenn `resizable()` hinzugefügt wurde, kann `frame` die sichtbare Bildgröße wirklich verändern.

Wenn `resizable` weggelassen wird:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

dann stellt `frame` der View nur Layoutplatz zur Verfügung, aber das Bild selbst ändert seine Größe nicht.

### Der Modifikator frame

`frame(width:height:)` wird verwendet, um Breite und Höhe einer View festzulegen.

Grundlegende Verwendung:

```swift
.frame(width: 10, height: 10)
```

Zum Beispiel, um ein Bild auf ein Rechteck mit `width` 300 und `height` 100 zu setzen:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Man kann auch nur Breite oder Höhe einzeln festlegen:

```swift
.frame(width: 200)
.frame(height: 100)
```

Die Kombination aus `resizable` und `frame` erlaubt es uns, die Bildgröße flexibel zu steuern und das Bild gleichzeitig skalierbar zu halten.

### Skalierung: scaledToFit und scaledToFill

Wenn wir mit `frame` eine Breite und Höhe setzen, deren Seitenverhältnis nicht zum Bild passt, kann das Bild verzerrt werden.

Wenn wir möchten, dass das Bild sein Seitenverhältnis behält und trotzdem den verfügbaren Layoutplatz sinnvoll nutzt, können wir `scaledToFit` oder `scaledToFill` verwenden.

**scaledToFit**

`scaledToFit` behält das ursprüngliche Seitenverhältnis des Bildes bei und skaliert es so, dass es vollständig in den verfügbaren Bereich passt, ohne beschnitten zu werden:

```swift
.scaledToFit()
```

oder

```swift
.aspectRatio(contentMode: .fit)
```

Diese Methode eignet sich für Situationen, in denen das gesamte Bild sichtbar bleiben soll und nicht verzerrt werden darf.

Wenn alle Bilder dieselbe Breite und Höhe erhalten, kommt es sonst leicht zu Verzerrungen.

Zum Beispiel:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Ohne Skalierungsmodus kann das Bild nicht in seinem ursprünglichen Verhältnis dargestellt werden.

![Swift](../../RESOURCE/003_img4.png)

Mit `scaledToFit` bleibt das ursprüngliche Seitenverhältnis erhalten.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` behält ebenfalls das Seitenverhältnis des Bildes bei, füllt aber den gesamten verfügbaren Bereich. Wenn das Seitenverhältnis nicht passt, wird der überstehende Teil abgeschnitten:

```swift
.scaledToFill()
```

oder

```swift
.aspectRatio(contentMode: .fill)
```

Diese Methode eignet sich für Situationen, in denen ein Bild den gesamten Bereich ausfüllen soll, zum Beispiel als Hintergrundbild oder Banner.

**Unterschied zwischen beiden**

![Swift](../../RESOURCE/003_img6.png)

## Text

In SwiftUI wird `Text` verwendet, um Text anzuzeigen.

Grundlegende Verwendung:

```swift
Text("FangJunyu")
```

Wir haben `Text` bereits in der vorherigen Lektion kennengelernt. In dieser Lektion lernen wir nun zusätzlich, wie man Schriftgröße und Schriftstärke steuert, damit Text in einer View ausdrucksstärker wirkt.

### Schriftgröße

Mit dem Modifikator `font` lässt sich die Schriftgröße steuern:

```swift
.font(.title)
```

Zum Beispiel:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Häufig verwendete Schriftgrößen (von groß nach klein):

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Schriftstärke

Wenn du den Text fett darstellen möchtest, kannst du den Modifikator `fontWeight` verwenden:

```swift
.fontWeight(.bold)
```

Zum Beispiel:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Häufig verwendete Schriftstärken (von dünn nach dick):

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` steuert die Schriftgröße, `fontWeight` die Schriftstärke. Beide lassen sich kombinieren, um Text ausdrucksstärker zu gestalten.

## Zusammenfassung und Praxis

Bis hierhin haben wir bereits grundlegende Kenntnisse über das Standard-Layout von SwiftUI, `Spacer`, `Image` und `Text` gelernt. Diese Inhalte reichen schon aus, um einige einfache Views zu entwickeln.

Zum Beispiel: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Die Google-Oberfläche ist sehr schlicht. Sie enthält Bilder und Text. Wir können versuchen, ihre Struktur aus SwiftUI-Sicht zu analysieren:

1. Insgesamt lässt sie sich in drei Teile aufteilen: Google-Logo, Suchfeld und Hinweistext. Dafür kann `VStack` zur vertikalen Anordnung verwendet werden.
2. Das Google-Logo ist ein Bild und kann mit `Image` angezeigt werden.
3. Das Suchfeld enthält Eingabefeld und Symbol. Wenn wir das Eingabefeld vorerst ignorieren, kann das Suchsymbol mit `Image` dargestellt werden.
4. Der Hinweistext wird mit `Text` angezeigt. Die horizontale Anordnung kann mit `HStack` erfolgen, und die Textfarbe lässt sich mit `foregroundStyle` steuern.

Indem wir diese Inhalte üben, können wir einige einfache Views bauen und unser Verständnis für `Image`, `Text` und ihre Modifikatoren vertiefen.
