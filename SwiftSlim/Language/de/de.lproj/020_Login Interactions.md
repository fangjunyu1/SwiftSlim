# Login-Interaktionen

In der letzten Lektion haben wir eine Login-Ansicht erstellt und durch Schaltflächen sowie Prüfungslogik eine einfache Überprüfung der eingegebenen Inhalte umgesetzt.

In dieser Lektion bauen wir weiter auf dem Code der letzten Lektion auf und lernen das Passworteingabefeld `SecureField`, das Warnfenster `Alert` sowie, wie man anhand von Variablen die Anzeige verschiedener Ansichten steuert.

Durch diese Lektion kannst du den grundlegenden Interaktionsablauf einer Login-Ansicht noch besser verstehen. Das ist auch eine grundlegende Logik, die in vielen Apps verwendet wird.

## Passworteingabefeld

In der letzten Lektion haben wir `TextField` verwendet, um ein Passwort einzugeben.

In einer echten Login-Oberfläche wird das Passwort jedoch normalerweise nicht direkt angezeigt, sondern als Punkte oder mit einem anderen Verbergeffekt dargestellt, damit die Privatsphäre des Benutzers geschützt wird.

In SwiftUI ist das speziell für die Passworteingabe vorgesehene Steuerelement `SecureField`.

Zum Beispiel:

```swift
SecureField("Password", text: $password)
```

Die Schreibweise ist `TextField` sehr ähnlich. Es benötigt ebenfalls einen Hinweistext und eine gebundene Variable.

Man kann es einfach so verstehen: `SecureField` ist ebenfalls ein Eingabefeld, nur dass der eingegebene Inhalt verborgen wird.

Wir können das ursprünglich für die Passworteingabe verwendete `TextField` direkt in `SecureField` ändern:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Wenn der Benutzer ein Passwort eingibt, wird der Passwortinhalt in der Oberfläche nicht direkt angezeigt.

Darstellung:

![password](../../Resource/020_password.png)

Jetzt können wir Benutzername und Passwort eingeben und nach dem Klick auf die Schaltfläche prüfen, ob die Eingabe korrekt ist.

### Rückmeldung anzeigen

Zuvor haben wir immer `print` verwendet, um Ergebnisse auszugeben.

Der Inhalt von `print` wird nur in der Konsole angezeigt. Entwickler können ihn sehen, wenn das Programm in Xcode ausgeführt wird, aber normale Benutzer können diese Hinweise auf dem Telefon nicht sehen.

Das heißt: Obwohl das Programm die Prüfung bereits abgeschlossen hat, weiß der Benutzer nicht, ob die eingegebenen Inhalte korrekt sind.

In diesem Fall brauchen wir eine Möglichkeit, Hinweise direkt auf der Oberfläche anzuzeigen.

## Alert-Warnfenster

In SwiftUI können wir `Alert` verwenden, um ein Hinweisfenster einzublenden.

Grundlegende Verwendung:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Dieser Code sieht etwas komplexer aus als die vorherigen Steuerelemente, aber wir können ihn aufgeteilt verstehen.

`Alert` besteht hauptsächlich aus den folgenden Teilen:

- `"Title"`: der Titel des Warnfensters
- `isPresented`: ein gebundener Bool-Wert, der steuert, ob das Warnfenster angezeigt wird
- `Button(...)`: die Schaltfläche im Warnfenster
- `message:`: der Hinweistext, der im Warnfenster angezeigt wird

Man kann es einfach so verstehen: Wenn die gebundene Variable `true` wird, zeigt das System dieses Hinweisfenster an.

Darstellung:

![alert](../../Resource/020_alert3.png)

Zugehörige Struktur:

![alert](../../Resource/020_alert.png)

### Alert ist ein Modifikator

Wie viele der Modifikatoren, die wir zuvor gelernt haben, wird auch `Alert` hinter einer bestimmten Ansicht hinzugefügt.

Zum Beispiel kann es hinter einer Schaltfläche stehen:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Es kann auch hinter dem äußeren `VStack` stehen:

```swift
VStack {
    // ...
}
.alert() {...}
```

Das bedeutet: `Alert` ist keine eigenständige Ansicht, die separat auf der Oberfläche liegt, sondern ein Modifikator, der an eine bestimmte Ansicht angehängt ist.

Einfach gesagt wird `Alert` normalerweise hinter einer Schaltfläche oder dem äußeren Layout geschrieben, um bei Erfüllung einer bestimmten Bedingung einen Hinweis einzublenden.

### Alert anzeigen

Wenn wir `Alert` anzeigen möchten, brauchen wir eine Variable, die es steuert.

Zum Beispiel:

```swift
@State private var showAlert = false
```

Diese Variable ist vom Typ `Bool`, das heißt, sie hat nur zwei Werte: `true` oder `false`.

Dann binden wir sie an `isPresented` von `Alert`:

```swift
isPresented: $showAlert
```

Wenn `showAlert` `false` ist, wird das Warnfenster nicht angezeigt; wenn `showAlert` `true` ist, erscheint das Warnfenster.

### Warnfenster über die Schaltfläche anzeigen

Jetzt setzen wir zuerst das einfachste Szenario um:

Wenn der Benutzer gar nichts eingibt und direkt auf die Schaltfläche `Sign in` klickt, erscheint ein Hinweisfenster mit der Meldung: „Du hast noch nichts eingegeben.“

Erstelle zuerst eine Variable, um dieses Hinweisfenster zu steuern:

```swift
@State private var showEmpty = false
```

Füge dann hinter `Button` ein `Alert` hinzu:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Anschließend führen wir in dem Code für den Schaltflächenklick die Prüfung durch:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Wenn sowohl `user` als auch `password` leer sind, setzen wir `showEmpty` auf `true`.

Da `Alert` wieder an diese Variable gebunden ist, blendet das System automatisch das Hinweisfenster ein, wenn sie `true` wird.

Darstellung:

![alert](../../Resource/020_alert1.png)

So kann der Benutzer nach dem Klick auf die Schaltfläche den Hinweis sofort sehen, ohne dass der Entwickler in der Konsole die Ausgabe von `print` prüfen muss.

### Schaltfläche und Warnfenster vervollständigen

Zuvor haben wir nur den Fall behandelt, dass „nichts ausgefüllt wurde“.

Wir müssen auch noch die folgenden Situationen behandeln:

- Benutzername fehlt
- Passwort fehlt
- Benutzername und Passwort wurden ausgefüllt, aber die Eingabe ist falsch

Deshalb müssen wir auch für diese Fälle passende Hinweise vorbereiten.

Füge zuerst drei neue Variablen hinzu:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Füge dann hinter der Schaltfläche die entsprechenden `Alert` weiter hinzu:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Als Nächstes vervollständigen wir die Prüfungslogik in der Schaltfläche:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Wenn die Schaltfläche erkennt, dass der Benutzer gar keine Informationen eingegeben hat, eine Information fehlt oder die Eingabeprüfung fehlgeschlagen ist, wird die entsprechende Bool-Variable auf `true` gesetzt und anschließend das passende `Alert` angezeigt.

Hier empfehle ich dir, selbst einige Situationen zu testen:

- nichts eingeben
- nur den Benutzernamen eingeben
- nur das Passwort eingeben
- Benutzername und Passwort eingeben, aber mit falschem Inhalt
- Benutzername und Passwort eingeben und der Inhalt ist korrekt

So kannst du überprüfen, ob es Probleme in unserem Code gibt. Das ist auch ein sehr wichtiger „Test“-Schritt in der App-Entwicklung.

Wenn sich das Programm in einem bestimmten Szenario nicht richtig verhält, bedeutet das, dass möglicherweise ein Problem in der Logik vorliegt und ein `Bug` im Programm aufgetreten ist.

Was man in der Entwicklung oft als `Bug` bezeichnet, meint Fehler, Schwachstellen oder Verhalten, das nicht den Erwartungen entspricht.

## Login-Ansicht fertigstellen

Die zuvor besprochenen `Alert` dienten alle dazu, dem Benutzer bei „falscher Eingabe“ einen Hinweis zu geben.

Wenn der Benutzer den richtigen Benutzernamen und das richtige Passwort eingibt, zeigen wir normalerweise kein „Warnfenster“ an, sondern wechseln direkt zur Ansicht nach dem Login.

Hier geht es um einen sehr wichtigen Wissenspunkt: **Je nach Wert einer Variablen unterschiedliche Ansichten anzeigen.**

Zum Beispiel:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Hier verwenden wir den Typ `Bool`, um die Anzeige der Ansicht zu verwalten:

- wenn `login` `true` ist, bedeutet das, dass der Login erfolgreich war, und es wird der Inhalt nach dem Login angezeigt
- wenn `login` `false` ist, bedeutet das, dass der Login nicht erfolgreich war, und die Login-Oberfläche wird weiter angezeigt.

Obwohl die `if`-Anweisung eine bedingte Anweisung in Swift ist, kann sie im `body` von SwiftUI verwendet werden, um die Logik der Ansichtsanzeige zu steuern.

Das heißt: SwiftUI entscheidet anhand des Ergebnisses der Bedingung, welche Ansicht aktuell angezeigt werden soll.

Wir können diese Anzeigelogik in die aktuelle `ContentView` einfügen:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Hier haben wir eine neue Variable `login` hinzugefügt, die angibt, ob der Benutzer bereits erfolgreich eingeloggt ist.

Dann haben wir den zuvor geschriebenen Code der Login-Ansicht hinter die `else`-Anweisung gesetzt.

Logik der Ansichtsanzeige:

- wenn `login` `false` ist, bedeutet das, dass der Login noch nicht erfolgreich war, und die ursprüngliche Login-Ansicht wird weiter angezeigt.
- wenn `login` `true` ist, bedeutet das, dass der Login erfolgreich war. Dann wird die Login-Ansicht nicht mehr angezeigt, sondern `Login successful`.

Das heißt: `ContentView` zeigt je nach Wert von `login` unterschiedlichen Ansichtsinhalt an.

Als Nächstes ändern wir noch die Erfolgslogik in der Schaltfläche:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Wenn der vom Benutzer eingegebene Benutzername und das Passwort beide korrekt sind, setzen wir `login` auf `true`.

Sobald sich der Wert von `login` ändert, ändert sich auch das Ergebnis der `if`-Prüfung in `ContentView`, und die Oberfläche wechselt von der ursprünglichen Login-Ansicht zu `Login successful`.

Die Darstellung sieht so aus:

![view](../../Resource/020_view.png)

Jetzt haben wir das Wissen „unterschiedliche Ansichten je nach Bedingung anzeigen“ tatsächlich in dieser aktuellen Login-Seite angewendet.

In echten Apps wird normalerweise ebenfalls auf diese Weise entschieden: Je nach einem bestimmten Wert werden unterschiedliche Ansichten angezeigt.

Wenn der Benutzer zum Beispiel nicht eingeloggt ist, wird die Login-Seite angezeigt; nach erfolgreichem Login wird eine andere Oberfläche angezeigt.

Die Kernidee ist: **Durch Änderungen von Variablen steuern, welchen Inhalt die Oberfläche anzeigt.**

## Zusammenfassung

In dieser Lektion haben wir drei wichtige Inhalte gelernt:

1. `SecureField` verwenden, um Passwörter einzugeben, sodass der Passwortinhalt nicht direkt auf der Oberfläche angezeigt wird.
2. `Alert` verwenden, um dem Benutzer Hinweise anzuzeigen, anstatt nur in der Konsole auszugeben.
3. Variablen und `if`-Prüfungen verwenden, um die Anzeige verschiedener Ansichten zu steuern und den Wechsel zwischen der Oberfläche vor und nach dem Login umzusetzen.

Durch das Erlernen dieser Kenntnisse sind wir bereits in der Lage, eine Login-Ansicht mit grundlegenden Interaktionen zu erstellen, und verstehen die Entwicklungslogik in SwiftUI noch besser: „Zustand ändert sich, Oberfläche aktualisiert sich.“

## Vollständiger Code

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Erweiterung - Alert mit mehreren Schaltflächen

In diesem Abschnitt zuvor haben wir das grundlegendste `Alert` verwendet, das nur eine Schaltfläche hat und hauptsächlich dazu dient, dem Benutzer einen Hinweis zu geben.

Tatsächlich kann `Alert` auch mehrere Schaltflächen enthalten, damit der Benutzer verschiedene Entscheidungen treffen kann.

Zum Beispiel:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Nach dem Klick auf die Schaltfläche erscheint ein Hinweisfenster mit drei Optionen: `Ok`, `delete` und `cancel`.

Darstellung:

![alert](../../Resource/020_alert2.png)

Wenn auf unterschiedliche Schaltflächen geklickt wird, wird der entsprechende Code ausgeführt.

### Die role-Eigenschaft von Button

Hier wirst du feststellen, dass sich der `Button` in `Alert` ein wenig von der Schreibweise einer normalen Schaltfläche unterscheidet, die wir zuvor gelernt haben:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Hier gibt es einen zusätzlichen Parameter `role`.

In SwiftUI wird `role` verwendet, um dem System mitzuteilen, zu welcher Art von Aktion diese Schaltfläche gehört.

Einige häufige Rollen sind:

- `.cancel`: Aktion abbrechen
- `.destructive`: gefährliche Aktion, zum Beispiel Löschen
- `nil`: normale Aktion

Unterschiedliche `role` führen in der Oberfläche normalerweise auch zu unterschiedlichen Darstellungsstilen.

Zum Beispiel werden gefährliche Aktionen häufig auffälliger dargestellt, um den Benutzer daran zu erinnern, vorsichtig zu klicken.

Außerdem liefert `role` zusätzliche semantische Informationen für die Schaltfläche, was es Screenreadern (zum Beispiel VoiceOver auf Apple-Geräten) erleichtert, dem Benutzer die Funktion der Schaltfläche zu erklären.

Deshalb ist es in passenden Situationen eine sehr gute Gewohnheit, einer Schaltfläche `role` hinzuzufügen.
