# Interazioni di accesso

Nella lezione precedente abbiamo creato una vista di accesso e, attraverso pulsanti e logica di verifica, abbiamo realizzato una semplice convalida del contenuto inserito.

In questa lezione continueremo partendo dal codice della lezione precedente per imparare il campo di inserimento password `SecureField`, il riquadro di avviso `Alert` e anche come controllare la visualizzazione di viste diverse in base alle variabili.

Attraverso questa lezione, potrai comprendere meglio il flusso di interazione di base di una vista di accesso, che è anche una logica fondamentale usata in molte app.

## Campo di inserimento della password

Nella lezione precedente abbiamo usato `TextField` per inserire la password.

Tuttavia, in una vera interfaccia di accesso, la password di solito non viene mostrata direttamente, ma appare come punti o con altri effetti di nascondimento, in modo da proteggere la privacy dell’utente.

In SwiftUI, il controllo usato appositamente per inserire password è `SecureField`.

Per esempio:

```swift
SecureField("Password", text: $password)
```

Il suo modo di scrittura è molto simile a `TextField`: richiede allo stesso modo un testo di suggerimento e una variabile associata.

Lo si può capire semplicemente così: `SecureField` è anch’esso un campo di input, solo che nasconde il contenuto inserito.

Possiamo sostituire direttamente il `TextField` originariamente usato per inserire la password con `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Quando l’utente inserisce la password, il contenuto della password non verrà più mostrato direttamente sull’interfaccia.

Effetto di visualizzazione:

![password](../../Resource/020_password.png)

Ora possiamo inserire nome utente e password e, dopo aver cliccato il pulsante, verificare se l’input è corretto.

### Mostrare messaggi di feedback

In precedenza abbiamo sempre usato `print` per mostrare i risultati.

Il contenuto di `print` viene mostrato solo nella console. Gli sviluppatori possono vederlo quando eseguono il programma in Xcode, ma gli utenti comuni su telefono non possono vedere questi messaggi.

Ciò significa che, anche se il programma ha già completato il controllo, l’utente non sa se il contenuto inserito è corretto.

In questo momento, abbiamo bisogno di un modo per mostrare messaggi direttamente sull’interfaccia.

## Riquadro di avviso Alert

In SwiftUI, possiamo usare `Alert` per far apparire un riquadro di messaggio.

Utilizzo di base:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Questo pezzo di codice sembra un po’ più complesso dei controlli precedenti, ma possiamo capirlo scomponendolo.

`Alert` contiene principalmente le seguenti parti:

- `"Title"`: il titolo del riquadro di avviso
- `isPresented`: un valore booleano associato usato per controllare se il riquadro di avviso viene mostrato
- `Button(...)`: il pulsante del riquadro di avviso
- `message:`: il contenuto del messaggio mostrato nel riquadro di avviso

Lo si può capire semplicemente così: quando la variabile associata diventa `true`, il sistema farà apparire questo riquadro di messaggio.

Effetto di visualizzazione:

![alert](../../Resource/020_alert3.png)

Struttura corrispondente:

![alert](../../Resource/020_alert.png)

### Alert è un modificatore

Come molti modificatori che abbiamo imparato prima, anche `Alert` viene aggiunto dopo una certa vista.

Per esempio, può essere applicato dietro un pulsante:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Può anche essere applicato dietro il `VStack` esterno:

```swift
VStack {
    // ...
}
.alert() {...}
```

Questo significa che `Alert` non è una vista indipendente collocata da sola nell’interfaccia, ma un modificatore collegato a una certa vista.

Lo si può capire semplicemente così: `Alert` di solito si scrive dietro il pulsante o il layout esterno, per mostrare un messaggio quando una certa condizione è soddisfatta.

### Mostrare Alert

Se vogliamo mostrare un `Alert`, abbiamo bisogno di una variabile per controllarlo.

Per esempio:

```swift
@State private var showAlert = false
```

Questa variabile è di tipo `Bool`, cioè ha solo due valori: `true` o `false`.

Poi la associamo a `isPresented` di `Alert`:

```swift
isPresented: $showAlert
```

Quando `showAlert` è `false`, il riquadro di avviso non verrà mostrato; quando `showAlert` è `true`, il riquadro di avviso apparirà.

### Mostrare il riquadro di avviso tramite il pulsante

Ora implementiamo prima lo scenario più semplice:

Quando l’utente non inserisce nulla e clicca direttamente sul pulsante `Sign in`, apparirà un riquadro di messaggio che gli dice: “Non hai ancora inserito alcun contenuto”.

Per prima cosa, crea una variabile per controllare questo riquadro di messaggio:

```swift
@State private var showEmpty = false
```

Poi aggiungi un `Alert` dietro `Button`:

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

Successivamente, esegui il controllo nel codice del clic del pulsante:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Se sia `user` sia `password` sono vuoti, imposteremo `showEmpty` su `true`.

E poiché `Alert` è associato a questa variabile, quando essa diventa `true`, il sistema mostrerà automaticamente il riquadro di avviso.

Effetto di visualizzazione:

![alert](../../Resource/020_alert1.png)

In questo modo, dopo aver cliccato il pulsante, l’utente può vedere subito il messaggio, senza che lo sviluppatore debba andare nella console a controllare l’output di `print`.

### Migliorare il pulsante e il riquadro di avviso

Prima abbiamo gestito solo la situazione in cui “non è stato compilato nulla”.

Dobbiamo ancora gestire le seguenti situazioni:

- il nome utente non è stato inserito
- la password non è stata inserita
- nome utente e password sono stati inseriti, ma l’input è errato

Perciò dobbiamo anche preparare i messaggi corrispondenti per questi casi.

Per prima cosa, aggiungi tre nuove variabili:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Poi continua ad aggiungere gli `Alert` corrispondenti dietro il pulsante:

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

Successivamente, completa la logica di valutazione all’interno del pulsante:

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

Quando il pulsante determina che l’utente non ha compilato alcuna informazione, ne ha lasciata una mancante oppure la convalida dell’input è fallita, cambierà la corrispondente variabile booleana in `true`, e poi apparirà il relativo `Alert`.

Qui ti consiglio di testare tu stesso alcune situazioni:

- non compilare nulla
- compilare solo il nome utente
- compilare solo la password
- compilare nome utente e password, ma con contenuto errato
- compilare nome utente e password, e il contenuto è corretto

Questo serve a verificare se il nostro codice presenta problemi. È anche una fase di “test” molto importante nello sviluppo di app.

Se in un certo scenario il programma si comporta in modo errato, significa che potrebbe esserci un problema nella logica e che nel programma è comparso un `Bug`.

Quello che comunemente chiamiamo `Bug` nello sviluppo indica un errore, una falla o un comportamento non conforme alle aspettative.

## Completare la vista di accesso

Gli `Alert` di cui abbiamo parlato prima riguardavano tutti come dare un messaggio all’utente quando “l’input è errato”.

Quando l’utente inserisce correttamente nome utente e password, di solito non mostriamo un “riquadro di avviso”, ma entriamo direttamente nell’interfaccia successiva all’accesso.

Qui è coinvolto un punto molto importante: **mostrare viste diverse in base al valore di una variabile.**

Per esempio:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Qui usiamo il tipo `Bool` per gestire la visualizzazione della vista:

- se `login` è `true`, significa che l’accesso è già riuscito, e viene mostrato il contenuto successivo all’accesso
- se `login` è `false`, significa che l’accesso non è riuscito, e l’interfaccia di accesso continua a essere mostrata.

Sebbene l’istruzione `if` sia un’istruzione condizionale di Swift, nel `body` di SwiftUI può essere usata per controllare la logica di visualizzazione delle viste.

Questo significa che SwiftUI determinerà quale vista debba essere mostrata in quel momento in base al risultato della condizione.

Possiamo inserire questa logica di visualizzazione nell’attuale `ContentView`:

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

Qui abbiamo aggiunto una nuova variabile `login`, usata per indicare se l’utente ha già effettuato l’accesso con successo.

Poi abbiamo messo dietro l’istruzione `else` il codice della vista di accesso che avevamo già scritto in precedenza.

Logica di visualizzazione della vista:

- quando `login` è `false`, significa che l’accesso non è ancora riuscito, quindi continua a essere mostrata la vista di accesso originale.
- quando `login` è `true`, significa che l’accesso è riuscito; in questo momento la vista di accesso non viene più mostrata, ma viene mostrato `Login successful`.

Ciò significa che `ContentView` mostrerà contenuti diversi in base al valore di `login`.

Successivamente, modifichiamo la logica di successo dell’accesso all’interno del pulsante:

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

Quando il nome utente e la password inseriti dall’utente sono entrambi corretti, imposteremo `login` su `true`.

Una volta che il valore di `login` cambia, cambia anche il risultato del controllo `if` all’interno di `ContentView`, e l’interfaccia passerà dalla vista di accesso originale a `Login successful`.

L’effetto di visualizzazione è il seguente:

![view](../../Resource/020_view.png)

Ora abbiamo davvero applicato la conoscenza di “mostrare viste diverse in base alle condizioni” a questa pagina di accesso attuale.

Nelle app reali, di solito funziona proprio così: si mostrano viste diverse in base a un certo valore.

Per esempio, quando l’utente non ha effettuato l’accesso, viene mostrata la pagina di accesso; dopo che l’utente accede con successo, viene mostrata un’altra interfaccia.

L’idea centrale è: **controllare quale contenuto viene mostrato nell’interfaccia attraverso i cambiamenti delle variabili.**

## Riepilogo

In questa lezione abbiamo imparato tre contenuti importanti:

1. Usare `SecureField` per inserire password, in modo che il contenuto della password non venga mostrato direttamente nell’interfaccia.
2. Usare `Alert` per mostrare messaggi all’utente, invece di limitarci a stamparli nella console.
3. Usare variabili e controlli `if` per governare la visualizzazione di viste diverse, realizzando il passaggio tra l’interfaccia prima e dopo l’accesso.

Attraverso l’apprendimento di queste conoscenze, ora siamo già in grado di completare una vista di accesso con effetti di interazione di base e di comprendere meglio l’idea di sviluppo di SwiftUI: “lo stato cambia, l’interfaccia si aggiorna”.

## Codice completo

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

## Conoscenze estese - Alert con più pulsanti

Nella parte precedente di questa lezione, abbiamo usato il `Alert` più basilare, che ha un solo pulsante e serve principalmente a mostrare un avviso all’utente.

In realtà, `Alert` può anche contenere più pulsanti, permettendo all’utente di fare scelte diverse.

Per esempio:

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

Dopo aver cliccato il pulsante, apparirà un riquadro di messaggio con tre opzioni: `Ok`, `delete` e `cancel`.

Effetto di visualizzazione:

![alert](../../Resource/020_alert2.png)

Cliccando pulsanti diversi, verrà eseguito il codice corrispondente.

### La proprietà role di Button

Qui noterai che il `Button` dentro `Alert` è leggermente diverso dalla sintassi del normale pulsante che abbiamo imparato in precedenza:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Qui è presente un parametro aggiuntivo, `role`.

In SwiftUI, `role` viene usato per indicare al sistema a quale tipo di azione appartiene questo pulsante.

Alcuni ruoli comuni sono:

- `.cancel`: azione di annullamento
- `.destructive`: azione pericolosa, per esempio eliminare
- `nil`: azione normale

Valori diversi di `role` comportano di solito anche differenze nello stile visivo dell’interfaccia.

Per esempio, le azioni pericolose vengono spesso mostrate con uno stile più evidente, per ricordare all’utente di cliccare con cautela.

Inoltre, `role` fornisce anche informazioni semantiche aggiuntive per il pulsante, facilitando ai lettori di schermo (come VoiceOver sui dispositivi Apple) il compito di spiegare all’utente la funzione del pulsante.

Perciò, nelle situazioni appropriate, aggiungere `role` a un pulsante è un’ottima abitudine.
