# Vista di accesso

In questa lezione, impareremo uno scenario molto pratico: la vista di accesso.

Che si tratti di un sito web o di un'app, durante l'uso spesso è necessario che l'utente acceda al proprio account e inserisca una password.

Per esempio, la pagina di accesso di GitHub:

![WordPress](../../Resource/019_github.png)

In questa lezione, creeremo una vista di accesso simile, in modo che l'utente possa inserire manualmente account e password, e controlleremo se ci sono problemi con il contenuto inserito.

## Layout superiore

Scriveremo il codice della vista di accesso nel file `ContentView`.

Per prima cosa, scriviamo l'area identificativa nella parte superiore della vista di accesso. Puoi preparare prima un'immagine icona adatta e metterla nella cartella `Assets`.

![icon](../../Resource/019_icon1.png)

Poi usa `Image` e i modificatori per mostrare l'immagine:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Questi modificatori significano:

- `resizable()`: permette di ridimensionare l'immagine.
- `scaledToFit()`: ridimensiona l'immagine mantenendo le sue proporzioni originali.
- `frame(width: 100)`: imposta la larghezza visualizzata dell'immagine su `100`.

Successivamente, usa `Text` e i modificatori per mostrare il titolo di accesso:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Poi usa `VStack` per disporre immagine e testo in verticale:

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

Risultato:

![view](../../Resource/019_view.png)

Fin qui, abbiamo completato l'area del titolo nella parte superiore della vista di accesso.

### Ottimizzare il layout

Ora, per impostazione predefinita, l'immagine e il titolo si trovano nella zona centrale dell'intero layout.

Se vogliamo che sembrino più come un "segno di accesso nella parte superiore della pagina", possiamo usare `Spacer()` per estendere lo spazio rimanente e far apparire il contenuto più vicino alla parte alta.

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

Risultato:

![view](../../Resource/019_view1.png)

Ma ora `Image` e `Text` sono troppo vicini alla parte superiore dello schermo, e l'aspetto è un po' affollato.

In questo momento, possiamo usare `padding` per aggiungere uno spazio superiore all'intero `VStack`.

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

Risultato:

![view](../../Resource/019_view2.png)

In questo modo, l'area del titolo nella parte superiore della pagina appare più adatta.

## Nome utente e password

Una pagina di accesso di solito richiede che l'utente inserisca un nome utente e una password.

In SwiftUI, possiamo usare `TextField` per ricevere il contenuto inserito dall'utente.

Ma bisogna fare attenzione: `TextField` da solo non conserva a lungo i dati inseriti, è solo un controllo di input. Quello che salva davvero questi contenuti inseriti sono le variabili che vi colleghiamo.

Per questo, dobbiamo prima creare due variabili `@State` per salvare nome utente e password:

```swift
@State private var user = ""
@State private var password = ""
```

Quando il valore di una variabile `@State` cambia, SwiftUI aggiorna automaticamente le viste correlate.

Successivamente, usa `TextField` per collegare queste due variabili:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Qui, `$user` e `$password` rappresentano il "binding".

Cioè, quando l'utente digita del testo nella casella di input, il valore della variabile cambia nello stesso momento; e quando la variabile cambia, anche il contenuto mostrato nella casella di input cambia in modo sincronizzato.

Questa relazione, in cui "la vista e i dati restano sincronizzati tra loro", si chiama binding.

Nota che qui bisogna usare la scrittura con `$`:

```swift
$user
```

Perché `TextField` non ha bisogno di una normale stringa, ma di un valore binding che "può modificare i dati in entrambe le direzioni".

### Mostrare i campi di input

Mettiamoli dentro `ContentView`:

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

Effetto di visualizzazione:

![view](../../Resource/019_view3.png)

Poiché ora `user` e `password` sono entrambi stringhe vuote per impostazione predefinita:

```swift
""
```

la casella di input mostrerà inizialmente il testo segnaposto, ad esempio:

```swift
input user
```

Questo testo serve solo a dire all'utente "che cosa andrebbe inserito qui", e non è il contenuto realmente inserito.

### Ottimizzare i campi di input

Ora i campi di input sono già utilizzabili, ma lo stile predefinito è relativamente semplice.

Per rendere l'interfaccia più chiara, possiamo aggiungere un titolo davanti al campo di input e fare una piccola ottimizzazione di stile sul campo stesso.

Per esempio, aggiungiamo prima un titolo:

```swift
Text("Username")
    .fontWeight(.bold)
```

Poi usa `HStack` per mettere titolo e campo di input sulla stessa riga:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Qui usiamo `HStack` perché vogliamo "mostrare il titolo a sinistra e il campo di input a destra".

Va notato che `TextField` occuperà per impostazione predefinita tutto lo spazio disponibile rimanente.

![color](../../Resource/019_view6.png)

Per rendere più uniforme la dimensione dei due campi di input, possiamo usare `frame(width:)` per impostare una larghezza, così i campi di input appariranno più ordinati.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Poi aggiungi anche un bordo, in modo che il campo di input risulti più evidente:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ora, aggiungiamo sia il nome utente sia la password alla vista `ContentView`:

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

Effetto di visualizzazione:

![view](../../Resource/019_view4.png)

A questo punto, l'utente può già inserire nome utente e password.

## Pulsante di accesso

Successivamente, aggiungiamo un pulsante di accesso sotto i campi di input.

```swift
Button("Sign in") {

}
```

Poi usa `buttonStyle` per dare al pulsante uno stile di sistema più evidente:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Effetto di visualizzazione:

![view](../../Resource/019_view5.png)

Per confermare che il pulsante risponda davvero al tocco, possiamo prima scrivere un `print` all'interno del pulsante per fare una prova:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Quando il pulsante viene toccato, la console mostrerà:

```swift
click Sign in
```

Questo dimostra che il pulsante ha già risposto con successo all'azione di tocco.

## Logica di accesso

Ora aggiungeremo al pulsante di accesso la logica di validazione più basilare: **controllare se l'utente ha inserito nome utente e password**.

Vogliamo ottenere le seguenti situazioni:

- Se l'utente non inserisce nulla, mostra `Empty`
- Se l'utente inserisce solo uno dei due, indica quale manca
- Se sia il nome utente sia la password sono inseriti, mostra `Success`

### Nessuna informazione inserita

Poiché `user` e `password` sono entrambi stringhe vuote per impostazione predefinita:

```swift
@State private var user = ""
@State private var password = ""
```

resteranno vuoti quando l'utente non inserisce nulla.

In Swift, tipi come `String` possono usare `isEmpty` per determinare se il contenuto è vuoto.

### Proprietà isEmpty

`isEmpty` viene spesso usato per controllare se stringhe, array e altri contenuti sono vuoti.

Per esempio:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Se il contenuto è vuoto, `isEmpty` restituisce `true`; se il contenuto non è vuoto, restituisce `false`.

Per questo possiamo usarlo per determinare se il nome utente e la password contengono input.

### Usare isEmpty per controllare le variabili

Se l'utente non ha inserito alcuna informazione, allora:

```swift
user.isEmpty // true
password.isEmpty    // true
```

A questo punto, possiamo scrivere la condizione così:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Questo codice significa: se `user` è vuoto e anche `password` è vuoto, allora mostra:

```swift
Empty
```

Qui, `&&` è un operatore logico e significa "e".

Cioè, l'intera condizione è vera solo quando la condizione a sinistra è vera e anche quella a destra è vera.

Perciò, questo codice verrà eseguito solo quando sia il nome utente sia la password saranno vuoti.

## L'utente ha compilato solo una parte

Successivamente, consideriamo un'altra situazione: l'utente ha compilato solo il nome utente, oppure solo la password.

Per esempio:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

In questo momento, il nome utente non è vuoto, ma la password sì.

Possiamo continuare a usare `isEmpty` per controllare:

### Situazione in cui l'utente ha compilato l'account o la password

Se l'utente ha compilato solo il nome utente o solo la password, dobbiamo dare l'avviso corrispondente su ciò che manca.

Per esempio, se l'utente ha compilato solo il nome utente:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

La logica di questo codice è: se il nome utente è vuoto, chiedi di inserire il nome utente. Altrimenti, controlla se la password è vuota e, se lo è, chiedi di inserire la password.

### L'utente ha compilato tutte le informazioni

Se sia il nome utente sia la password sono già stati inseriti, allora `isEmpty` restituirà `false` per entrambi.

A questo punto, possiamo scriverlo così:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Qui, `!` significa "negazione".

Per esempio:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Cioè, `user.isEmpty` viene usato per determinare "se il nome utente è vuoto", mentre `!user.isEmpty` viene usato per determinare "se il nome utente non è vuoto".

La password segue la stessa logica.

Quindi, il significato di questo codice è: il nome utente non è vuoto, e anche la password non è vuota.

Quando entrambe queste condizioni sono vere, il risultato sarà:

```swift
Success
```

## Logica di validazione completa

Ora, uniamo queste tre situazioni e scriviamole dentro `Button`:

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

L'ordine di esecuzione di questo codice può essere compreso così:

Come primo passo, controlliamo prima:

```swift
if user.isEmpty && password.isEmpty
```

Se sia il nome utente sia la password sono vuoti, verrà mostrato direttamente `Empty`.

Se non sono entrambi vuoti, continuiamo controllando questa riga:

```swift
else if user.isEmpty || password.isEmpty
```

Qui, `||` significa "oppure".

Cioè, finché una delle condizioni è vera, l'intera condizione è vera.

Perciò, finché il nome utente è vuoto, oppure la password è vuota, verrà eseguito il blocco di codice `else if`.

Dopo essere entrati nel blocco di codice, controlliamo più in dettaglio quale campo di input non è stato compilato:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Se nessuna delle due condizioni precedenti è vera, significa che il nome utente non è vuoto e anche la password non è vuota.

Allora il programma entrerà nell'ultimo `else`:

```swift
print("Success")
```

In questo modo, completiamo la logica di validazione più basilare dell'input di accesso.

## Validazione di nome utente e password

La logica sopra controlla solo "se è stato inserito del contenuto oppure no".

Ma in un'app reale, non basta solo inserire del contenuto. Di solito dobbiamo anche inviare nome utente e password al server per la verifica.

Se il server conferma che il nome utente esiste e che la password è corretta, permetterà l'accesso; altrimenti, indicherà che l'accesso è fallito.

Per esercitarci in questo processo, possiamo prima impostare nel codice un account e una password temporanei per simulare "informazioni di accesso corrette":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Quando sia il nome utente sia la password non sono vuoti, allora li confrontiamo per vedere se sono corretti:

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

Qui, `==` significa "se è uguale a".

Per esempio:

```swift
user == userID
```

Significa: il nome utente inserito dall'utente è esattamente uguale al nome utente corretto che abbiamo impostato? Il controllo della password segue la stessa logica.

Perciò, quando il nome utente e la password inseriti sono uguali ai valori impostati, il risultato sarà `Success`; finché uno dei due non è uguale, il risultato sarà `Input error`.

In questo modo, completiamo una semplice "verifica simulata di accesso".

Anche se non è ancora una vera funzione di accesso collegata a un server, è già sufficiente per aiutarci a capire: **dopo aver toccato il pulsante, si può eseguire codice diverso in base a condizioni diverse**.

## Riepilogo

In questa lezione, abbiamo completato una vista di accesso di base e ci siamo concentrati soprattutto sull'apprendimento della "logica per giudicare il contenuto inserito in base alle condizioni".

Il contenuto centrale di questa lezione è: usare `isEmpty` per determinare se una stringa è vuota, e usare le istruzioni `if` insieme agli operatori logici per gestire situazioni diverse.

Tra questi, ci sono due operatori logici molto importanti:

- `&&`: significa "e", entrambe le condizioni devono essere soddisfatte
- `||`: significa "oppure", basta che una sola condizione sia soddisfatta

Quando queste condizioni producono infine `true` o `false`, l'istruzione `if` eseguirà codice diverso in base al risultato.

Attraverso questa vista di accesso, abbiamo già iniziato a entrare in contatto con un metodo di sviluppo che combina "interfaccia + dati + giudizio logico".

## Codice completo

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
