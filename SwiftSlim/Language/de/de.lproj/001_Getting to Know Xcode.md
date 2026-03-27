# Xcode kennenlernen

## Was ist Xcode?

Xcode ist die offizielle integrierte Entwicklungsumgebung (IDE, Integrated Development Environment) von Apple und wird für die Entwicklung von Apps auf Apple-Plattformen wie iOS, macOS, watchOS und tvOS verwendet.

![Swift](../../RESOURCE/001_xcode.png)

Im gesamten Tutorial werden wir Xcode verwenden, um Code zu schreiben und Programme auszuführen.

In dieser Lektion lernen wir, wie man Xcode herunterlädt, die erste iOS-App erstellt und sich zunächst mit dem Aufbau der Xcode-Oberfläche vertraut macht.

## Xcode herunterladen

Derzeit gibt es zwei Möglichkeiten, Xcode zu installieren:

1. Über den [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)
2. Über die [offizielle Apple-Developer-Website](https://developer.apple.com/xcode/)

Mit beiden Wegen kann Xcode heruntergeladen werden. Der Unterschied ist, dass auf der Apple-Developer-Website neben der stabilen Version auch [Beta](https://developer.apple.com/download/all/?q=Xcode)-Versionen und ältere Versionen angeboten werden.

Wenn du Xcode nur zum Lernen verwendest, ist die stabile Version empfehlenswert. Beta-Versionen dienen hauptsächlich zum Testen neuer Funktionen und können instabil sein.

## Das erste Projekt erstellen

Wenn du Xcode öffnest, siehst du zuerst den Startbildschirm.

![Swift](../../RESOURCE/001_xcode1.png)

Auf der linken Seite gibt es drei häufig genutzte Optionen:

- Create New Project — Neues Projekt erstellen
- Clone Git Repository — Git-Repository klonen
- Open Existing Project — Vorhandenes Projekt öffnen

Auf der rechten Seite werden zuletzt geöffnete Xcode-Projekte angezeigt.

Wir wählen die Option "Create New Project".

### Projektvorlage auswählen

![Swift](../../RESOURCE/001_xcode2.png)

Danach gelangst du zur Auswahl der Projektvorlage. Hier werden mehrere Plattformen wie iOS und macOS sowie verschiedene Projekttypen angezeigt.

Häufige Vorlagen:

- App — Der grundlegendste App-Typ (empfohlen)
- Document App — Eine dokumentbasierte App
- Game — Für die Spieleentwicklung
- Framework — Ein wiederverwendbares Modul

Für den Einstieg wählen wir nur die Vorlage "iOS" - "App", weil es sich dabei um einen typischen UI-App-Typ handelt.

Klicke anschließend auf "Next".

### Projektinformationen ausfüllen

Nun gelangst du zum Formular für die Projektinformationen. Dort müssen wir die Felder passend ausfüllen.

![Swift](../../RESOURCE/001_xcode3.png)

Bedeutung der einzelnen Felder:

- Product Name — Projektname, zum Beispiel: SwiftSlimTest
- Team — Entwicklerteam; wenn du keinen kostenpflichtigen Apple-Developer-Account hast, kannst du dieses Feld leer lassen
- Organization Identifier — Organisationskennung, normalerweise im umgekehrten Domain-Format, zum Beispiel:
  - com.yourname
  - com.yourcompany
  - Wenn du keine Domain hast, kannst du auch deinen englischen Namen als Kennung verwenden
- Bundle Identifier — Die eindeutige Kennung der App; sie wird automatisch aus Organization Identifier und Product Name erzeugt
- Interface — Oberflächentechnologie, hier wählen wir SwiftUI
- Language — Programmiersprache, hier wählen wir Swift
- Testing System — Standardmäßig wird ein Test-Target (Unit Tests) erstellt; das ignorieren wir in der Anfangsphase
- Storage — Framework für lokale Datenpersistenz; SwiftData oder Core Data können automatisch integriert werden; auch das ignorieren wir zunächst

Wenn alles ausgefüllt ist, klicke auf "Next".

### Projekt speichern

![Swift](../../RESOURCE/001_xcode4.png)

Wähle einen geeigneten Ordner zum Speichern aus.

Klicke auf "Create". Xcode erzeugt dann automatisch die Projektstruktur.

## Die Xcode-Projektstruktur

Nachdem das Projekt gespeichert wurde, kannst du im Finder den erzeugten Projektordner sehen.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets — Ordner für Bilder, App-Icons und andere Ressourcen
- ContentView.swift — Die standardmäßig erzeugte SwiftUI-View-Datei; hier schreiben wir später unseren UI-Code
- SwiftSlimTestApp.swift — Die Einstiegspunkt-Datei der App (App Entry Point), die für den Start der App zuständig ist; das müssen wir im Moment noch nicht verstehen
- SwiftSlimTest.xcodeproj — Die Xcode-Projektdatei; ein Doppelklick darauf öffnet das Projekt

## Die Xcode-Oberfläche kennenlernen

Öffne das Projekt durch Doppelklick auf die `.xcodeproj`-Datei und wähle links im Navigator-Bereich die Datei `ContentView.swift` aus.

Die Xcode-Oberfläche besteht hauptsächlich aus fünf Bereichen:

- Navigator — Navigationsbereich zum Anzeigen der Dateistruktur und für die Suche
- Editor — Bearbeitungsbereich zum Schreiben von Swift- oder SwiftUI-Code
- Canvas — Vorschaufläche für SwiftUI
- Inspector — Bereich zum Anzeigen und Ändern von Dateieigenschaften
- Debug Area — Debug-Bereich zur Anzeige von Log-Ausgaben

![Swift](../../RESOURCE/001_xcode6.png)

Hinweis: Der Canvas dient hauptsächlich zur SwiftUI-Vorschau. Aus Sicht der offiziellen Xcode-Architektur ist er ein unterstützendes Vorschaufenster des Editors (Preview Pane). Nur wenn eine SwiftUI-View-Datei geöffnet ist, kann der Canvas aktiviert werden. Bei anderen Dateitypen wird keine Vorschau angezeigt.

In den folgenden Lektionen werden wir hauptsächlich im Editor-Bereich Swift- und SwiftUI-Code schreiben.

Wenn du ein Xcode-Projekt zum ersten Mal öffnest, können Inspector und Debug Area standardmäßig ausgeblendet sein. Über die Schaltflächen oben rechts und unten rechts kannst du sie einblenden.

![Swift](../../RESOURCE/001_xcode7.png)

Tipp: Der Inspector-Bereich wird hauptsächlich zum Anzeigen und Bearbeiten von Dateieigenschaften verwendet. In der praktischen Entwicklung blendet man diesen Bereich häufig aus, um mehr Platz zum Schreiben von Code zu haben.

## Zusammenfassung

In dieser Lektion haben wir gelernt, wie man Xcode herunterlädt, das erste Xcode-Projekt erstellt und die grundlegende Oberflächenstruktur von Xcode versteht.

Hier ist nun etwas freie Übungszeit:

- Versuche, im Navigator-Bereich Dateien zu erstellen oder zu löschen.
- Sieh dir den Code im Editor-Bereich an und beobachte seine Struktur.
- Sieh dir die Schaltflächen im Canvas-Bereich an und probiere aus, die Vorschau zu vergrößern oder zu verkleinern.

In der nächsten Lektion beginnen wir damit, einige einfache Codezeilen zu schreiben und Xcode noch besser kennenzulernen.
