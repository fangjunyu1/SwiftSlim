# Anmeldeansicht

In dieser Lektion lernen wir ein sehr praktisches Szenario kennen: die Anmeldeansicht.

Egal ob Website oder App, bei der Nutzung ist es oft nötig, dass sich der Benutzer bei seinem Konto anmeldet und ein Passwort eingibt.

Zum Beispiel die GitHub-Anmeldeseite:

![WordPress](../../Resource/019_github.png)

In dieser Lektion erstellen wir eine ähnliche Anmeldeansicht, damit der Benutzer Konto und Passwort manuell eingibt, und wir prüfen, ob es Probleme mit dem eingegebenen Inhalt gibt.

## Oberes Layout

Wir schreiben den Code für die Anmeldeansicht in die Datei `ContentView`.

Zuerst schreiben wir den Kennzeichnungsbereich oben in der Anmeldeansicht. Du kannst vorher ein passendes Symbolbild vorbereiten und es in den Ordner `Assets` legen.

![icon](../../Resource/019_icon1.png)

Verwende dann `Image` und Modifikatoren, um das Bild anzuzeigen:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Diese Modifikatoren bedeuten:

- `resizable()`: macht das Bild in seiner Größe veränderbar.
- `scaledToFit()`: skaliert das Bild unter Beibehaltung seines ursprünglichen Seitenverhältnisses.
- `frame(width: 100)`: setzt die angezeigte Breite des Bildes auf `100`.

Verwende anschließend `Text` und Modifikatoren, um den Anmeldetitel anzuzeigen:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Verwende danach `VStack`, um Bild und Text vertikal anzuordnen:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Ergebnis:

![view](../../Resource/019_view.png)

Damit haben wir den Titelbereich oben in der Anmeldeansicht fertiggestellt.

### Layout optimieren

Im Moment befinden sich Bild und Titel standardmäßig im mittleren Bereich des gesamten Layouts.

Wenn wir möchten, dass sie eher wie eine "Anmeldekennzeichnung oben auf der Seite" wirken, können wir `Spacer()` verwenden, um den verbleibenden Raum aufzudehnen und den Inhalt näher am oberen Rand anzuzeigen.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Ergebnis:

![view](../../Resource/019_view1.png)

Jetzt sind `Image` und `Text` jedoch zu nah am oberen Bildschirmrand, sodass es etwas gedrängt aussieht.

Hier können wir `padding` verwenden, um dem gesamten `VStack` einen oberen Abstand hinzuzufügen.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Ergebnis:

![view](../../Resource/019_view2.png)

So sieht der Titelbereich oben auf der Seite etwas passender aus.

## Benutzername und Passwort

Eine Anmeldeseite verlangt normalerweise, dass der Benutzer einen Benutzernamen und ein Passwort eingibt.

In SwiftUI können wir `TextField` verwenden, um den vom Benutzer eingegebenen Inhalt entgegenzunehmen.

Dabei ist aber zu beachten: `TextField` speichert die eingegebenen Daten nicht selbst dauerhaft, sondern ist nur ein Eingabesteuerelement. Gespeichert werden diese Eingaben tatsächlich von den Variablen, die wir daran binden.

Deshalb müssen wir zuerst zwei `@State`-Variablen erstellen, um Benutzername und Passwort zu speichern:

```swift
@State private var user = ""
@State private var password = ""
```

Wenn sich der Wert einer `@State`-Variablen ändert, aktualisiert SwiftUI automatisch die zugehörigen Views.

Verwende anschließend `TextField`, um diese beiden Variablen zu binden:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Hier stehen `$user` und `$password` für ein "Binding".

Das heißt: Wenn der Benutzer Text in das Eingabefeld eingibt, ändert sich die Variable synchron mit; und wenn sich die Variable ändert, ändert sich auch der im Eingabefeld angezeigte Inhalt synchron.

Diese Beziehung, bei der sich "View und Daten gegenseitig synchronisieren", nennt man Binding.

Beachte, dass hier die Schreibweise mit `$` verwendet werden muss:

```swift
$user
```

Denn `TextField` braucht keinen normalen String, sondern einen Binding-Wert, der "Daten in beide Richtungen verändern kann".

### Eingabefelder anzeigen

Setzen wir sie in `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Anzeigeeffekt:

![view](../../Resource/019_view3.png)

Da `user` und `password` jetzt standardmäßig beide leere Strings sind:

```swift
""
```

wird im Eingabefeld zunächst ein Platzhaltertext angezeigt, zum Beispiel:

```swift
input user
```

Dieser Text weist den Benutzer nur darauf hin, "was hier eingegeben werden soll", und ist nicht der tatsächliche Eingabeinhalt.

### Eingabefelder optimieren

Jetzt sind die Eingabefelder bereits verwendbar, aber der Standardstil ist relativ schlicht.

Damit die Oberfläche klarer wirkt, können wir vor dem Eingabefeld einen Titel hinzufügen und das Eingabefeld selbst etwas stilistisch optimieren.

Füge zum Beispiel zuerst einen Titel hinzu:

```swift
Text("Username")
    .fontWeight(.bold)
```

Verwende dann `HStack`, um Titel und Eingabefeld in dieselbe Zeile zu setzen:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Hier verwenden wir `HStack`, weil wir möchten, dass "links der Titel und rechts das Eingabefeld angezeigt wird".

Zu beachten ist, dass `TextField` standardmäßig den verbleibenden verfügbaren Platz einnimmt.

![color](../../Resource/019_view6.png)

Damit die Größe der beiden Eingabefelder einheitlicher wirkt, können wir mit `frame(width:)` eine Breite festlegen, sodass die Eingabefelder ordentlicher aussehen.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Füge dann noch einen Rahmen hinzu, damit das Eingabefeld deutlicher sichtbar wird:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Jetzt fügen wir sowohl Benutzernamen als auch Passwort zur `ContentView`-View hinzu:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Anzeigeeffekt:

![view](../../Resource/019_view4.png)

Bis hierhin kann der Benutzer bereits Benutzernamen und Passwort eingeben.

## Anmelde-Button

Als Nächstes fügen wir unter den Eingabefeldern einen Anmelde-Button hinzu.

```swift
Button("Sign in") {

}
```

Verwende dann `buttonStyle`, um dem Button einen deutlicheren Systemstil zu geben:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Anzeigeeffekt:

![view](../../Resource/019_view5.png)

Um zu bestätigen, dass der Button wirklich auf Tippen reagiert, können wir zuerst ein `print` in den Button schreiben, um es zu testen:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Wenn auf den Button getippt wird, gibt die Konsole Folgendes aus:

```swift
click Sign in
```

Das zeigt, dass der Button bereits erfolgreich auf die Tippaktion reagiert hat.

## Anmeldelogik

Jetzt fügen wir dem Anmelde-Button die grundlegendste Prüfungslogik hinzu: **zu prüfen, ob der Benutzer Benutzernamen und Passwort eingegeben hat**.

Wir möchten die folgenden Situationen umsetzen:

- Wenn der Benutzer nichts eingibt, gib `Empty` aus
- Wenn der Benutzer nur eines von beiden eingibt, gib einen Hinweis darauf, was fehlt
- Wenn sowohl Benutzername als auch Passwort eingegeben wurden, gib `Success` aus

### Keine Informationen eingegeben

Da `user` und `password` standardmäßig beide leere Strings sind:

```swift
@State private var user = ""
@State private var password = ""
```

bleiben sie leer, wenn der Benutzer gar nichts eingibt.

In Swift können Typen wie `String` `isEmpty` verwenden, um festzustellen, ob der Inhalt leer ist.

### Eigenschaft isEmpty

`isEmpty` wird häufig verwendet, um zu prüfen, ob Strings, Arrays und andere Inhalte leer sind.

Zum Beispiel:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Wenn der Inhalt leer ist, gibt `isEmpty` `true` zurück; wenn der Inhalt nicht leer ist, gibt es `false` zurück.

Daher können wir es verwenden, um festzustellen, ob Benutzername und Passwort Inhalte enthalten.

### Mit isEmpty Variablen prüfen

Wenn der Benutzer keine Informationen eingegeben hat, dann:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Dann können wir die Prüfung so schreiben:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Dieser Code bedeutet: Wenn `user` leer ist und `password` ebenfalls leer ist, gib Folgendes aus:

```swift
Empty
```

`&&` ist hier ein logischer Operator und bedeutet "und".

Das heißt, die gesamte Bedingung ist nur erfüllt, wenn die Bedingung auf der linken Seite erfüllt ist und auch die auf der rechten Seite.

Daher wird dieser Code nur ausgeführt, wenn sowohl Benutzername als auch Passwort leer sind.

## Der Benutzer hat nur einen Teil ausgefüllt

Als Nächstes betrachten wir eine andere Situation: Der Benutzer hat nur den Benutzernamen oder nur das Passwort ausgefüllt.

Zum Beispiel:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

In diesem Moment ist der Benutzername nicht leer, aber das Passwort ist leer.

Wir können weiterhin `isEmpty` zur Prüfung verwenden:

### Situation, in der der Benutzer Konto oder Passwort ausgefüllt hat

Wenn der Benutzer nur den Benutzernamen oder nur das Passwort eingegeben hat, müssen wir den entsprechenden Hinweis darauf geben, was fehlt.

Wenn der Benutzer zum Beispiel nur den Benutzernamen eingegeben hat:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Die Logik dieses Codes ist: Wenn der Benutzername leer ist, fordere zur Eingabe des Benutzernamens auf. Andernfalls prüfe, ob das Passwort leer ist, und wenn es leer ist, fordere zur Eingabe des Passworts auf.

### Der Benutzer hat alle Informationen ausgefüllt

Wenn sowohl Benutzername als auch Passwort bereits eingegeben wurden, gibt `isEmpty` bei beiden `false` zurück.

Dann können wir es so schreiben:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Hier bedeutet `!` "Negation".

Zum Beispiel:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Das heißt, `user.isEmpty` wird verwendet, um festzustellen, "ob der Benutzername leer ist", und `!user.isEmpty`, um festzustellen, "ob der Benutzername nicht leer ist".

Für das Passwort gilt dieselbe Logik.

Die Bedeutung dieses Codes ist also: Der Benutzername ist nicht leer und das Passwort ist ebenfalls nicht leer.

Wenn diese beiden Bedingungen erfüllt sind, lautet die Ausgabe:

```swift
Success
```

## Vollständige Prüfungslogik

Jetzt kombinieren wir diese drei Situationen und schreiben sie in `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Die Ausführungsreihenfolge dieses Codes lässt sich so verstehen:

Im ersten Schritt prüfen wir zunächst:

```swift
if user.isEmpty && password.isEmpty
```

Wenn sowohl Benutzername als auch Passwort leer sind, wird direkt `Empty` ausgegeben.

Wenn nicht beide leer sind, prüfen wir als Nächstes diese Zeile:

```swift
else if user.isEmpty || password.isEmpty
```

Hier bedeutet `||` "oder".

Das heißt, sobald eine der Bedingungen erfüllt ist, ist die gesamte Bedingung erfüllt.

Daher wird der `else if`-Codeblock ausgeführt, solange der Benutzername leer ist oder das Passwort leer ist.

Nachdem wir den Codeblock betreten haben, prüfen wir weiter, welches Eingabefeld genau nicht ausgefüllt wurde:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Wenn keine der beiden vorherigen Bedingungen erfüllt ist, bedeutet das, dass der Benutzername nicht leer ist und auch das Passwort nicht leer ist.

Dann geht das Programm in das letzte `else`:

```swift
print("Success")
```

Damit haben wir die grundlegendste Prüfungslogik für die Anmeldeeingabe abgeschlossen.

## Prüfung von Benutzername und Passwort

Die obige Logik prüft nur, "ob überhaupt Inhalt eingegeben wurde".

In einer echten App reicht es aber nicht aus, nur Inhalte einzugeben. Normalerweise müssen Benutzername und Passwort auch an den Server gesendet und dort überprüft werden.

Wenn der Server bestätigt, dass der Benutzername existiert und das Passwort korrekt ist, wird die Anmeldung erlaubt; andernfalls wird auf einen fehlgeschlagenen Login hingewiesen.

Um diesen Prozess zu üben, können wir zunächst im Code ein temporäres Konto und Passwort festlegen, um "korrekte Anmeldedaten" zu simulieren:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Wenn Benutzername und Passwort beide nicht leer sind, vergleichen wir anschließend, ob sie korrekt sind:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Hier bedeutet `==` "ob es gleich ist".

Zum Beispiel:

```swift
user == userID
```

Das bedeutet, ob der vom Benutzer eingegebene Benutzername genau mit dem von uns festgelegten richtigen Benutzernamen übereinstimmt; für das Passwort gilt dieselbe Logik.

Daher wird `Success` ausgegeben, wenn der eingegebene Benutzername und das Passwort mit den festgelegten Werten übereinstimmen; sobald einer von beiden nicht übereinstimmt, wird `Input error` ausgegeben.

Damit haben wir eine einfache "simulierte Login-Prüfung" abgeschlossen.

Auch wenn es noch keine echte mit dem Server verbundene Login-Funktion ist, reicht es bereits aus, um uns zu helfen zu verstehen: **Nach dem Tippen auf den Button kann je nach unterschiedlichen Bedingungen unterschiedlicher Code ausgeführt werden**.

## Zusammenfassung

In dieser Lektion haben wir eine grundlegende Anmeldeansicht fertiggestellt und uns besonders auf die "Logik zur Beurteilung des eingegebenen Inhalts anhand von Bedingungen" konzentriert.

Der Kern dieser Lektion ist: `isEmpty` zu verwenden, um festzustellen, ob ein String leer ist, und `if`-Anweisungen zusammen mit logischen Operatoren zu verwenden, um verschiedene Situationen zu behandeln.

Darunter sind zwei sehr wichtige logische Operatoren:

- `&&`: bedeutet "und", beide Bedingungen müssen erfüllt sein
- `||`: bedeutet "oder", es reicht, wenn eine Bedingung erfüllt ist

Wenn diese Bedingungen am Ende `true` oder `false` ergeben, führt die `if`-Anweisung je nach Ergebnis unterschiedlichen Code aus.

Durch diese Anmeldeansicht haben wir bereits begonnen, mit einer Entwicklungsweise in Kontakt zu kommen, die "Oberfläche + Daten + logische Beurteilung" kombiniert.

## Vollständiger Code

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
