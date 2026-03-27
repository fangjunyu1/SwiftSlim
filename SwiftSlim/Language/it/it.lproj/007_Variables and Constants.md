# Variabili e costanti

In questa lezione studieremo principalmente variabili e costanti in Swift, e conosceremo alcuni tipi di dati comuni e operatori di base.

Questi contenuti sono tra le conoscenze più fondamentali della programmazione e costituiscono anche una base importante per lo studio successivo di SwiftUI.

## Variabili e costanti nella vita quotidiana

Possiamo capire variabili e costanti attraverso le cose della vita quotidiana.

Variabili nella vita quotidiana:

- il contenuto di ogni programma in televisione è diverso
- il tempo cambia ogni giorno
- le lancette dell'orologio cambiano a ogni secondo

La caratteristica comune di queste cose è che: cambiano.

Se la televisione mostrasse sempre la stessa immagine, il tempo fosse sempre sereno e le lancette dell'orologio non si muovessero mai, allora queste cose sarebbero costanti.

Una può cambiare, l'altra no.

## Comprendere variabili e costanti

Nello sviluppo di app, di solito è necessario che l'utente compili o salvi alcune informazioni.

Per esempio:

- nome dell'account
- data di nascita
- contatti
- indirizzo

Queste informazioni verranno salvate e poi visualizzate.

Per esempio, se l'utente inserisce un nome nell'app:

```
FangJunyu
```

Abbiamo bisogno di salvare questo nome, in modo da poterlo mostrare nell'app.

Possiamo interpretare in modo semplice il processo di salvataggio come mettere un oggetto dentro un cassetto.

Quando salviamo il nome, è come mettere il nome dentro un cassetto.

Le cose da salvare possono essere molte, e quindi anche i cassetti saranno molti. Per sapere che cosa contiene ciascun cassetto, dobbiamo dare un nome al cassetto.

Per esempio:

```
name
```

In questo esempio, `name` è il nome, mentre `FangJunyu` è l'informazione salvata.

![Var](../../RESOURCE/007_var.png)

**In Swift, se hai bisogno di salvare dati, devi dichiararli con una variabile (`var`) o una costante (`let`).**

Poiché un nome di solito può essere modificato, qui dovremmo usare una variabile.

```swift
var name = "FangJunyu"
```

Qui viene dichiarata una variabile chiamata `name`, di tipo `String`, con valore `"FangJunyu"`.

### Differenza tra variabili e costanti

Le variabili si dichiarano con `var`:

```swift
var
```

Le costanti si dichiarano con `let`:

```swift
let
```

Per esempio:

```swift
var name = "FangJunyu"
let id = 123456
```

Se viene dichiarato come variabile, significa che questo valore può essere modificato; se viene dichiarato come costante, non potrà più essere modificato.

Perciò, la differenza principale tra variabili e costanti è: se il valore può cambiare oppure no.

### Modificare una costante

Se il codice prova a modificare il valore di una costante:

```swift
let name = "Sam"
name = "Bob"
```

Swift mostrerà che non è possibile completare l'assegnazione, perché si tratta di una costante.

```
Cannot assign to property: 'name' is a 'let' constant
```

Questo meccanismo può aiutare gli sviluppatori a evitare che alcuni dati importanti vengano modificati accidentalmente.

### Mostrare in SwiftUI

Apri il file `ContentView.swift` e dichiara una variabile all'interno della View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Qui viene dichiarata una variabile chiamata `name`, che viene poi mostrata nell'interfaccia tramite `Text`.

Se modifichiamo il contenuto della variabile:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Anche il testo mostrato da `Text` cambierà.

In questo modo, possiamo usare le variabili per controllare il contenuto mostrato nell'interfaccia, senza dover modificare direttamente il testo dentro `Text` ogni volta.

Se in un altro punto serve ottenere questa informazione, possiamo anche passare la variabile lì, un po' come consegnare ad altri il contenuto del "cassetto".

### Posizione di variabili e costanti in SwiftUI

In SwiftUI, variabili e costanti di solito si scrivono all'esterno di `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Naturalmente, si possono anche scrivere all'interno di `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Tuttavia, tra i due casi esiste una differenza importante:

- se variabili e costanti sono scritte dentro `body`, ogni volta che la vista viene ricalcolata quella variabile verrà ricreata.
- se sono scritte fuori da `body`, la variabile esisterà come proprietà della struttura della vista, e la struttura del codice sarà più chiara.

Perciò, nello sviluppo reale, di solito si scrivono variabili e costanti all'esterno di `body`.

## Tipi di dati

Una variabile può salvare molti tipi diversi di dati, e questi tipi vengono chiamati tipi di dati.

Per esempio, in precedenza abbiamo usato `Text` per mostrare del testo:

```swift
Text("Hello, World")
```

Qui `"Hello, World"` appartiene al tipo stringa (`String`).

Le stringhe servono per rappresentare contenuti testuali e in Swift devono essere racchiuse tra doppi apici `""`.

Per esempio:

```swift
var hello = "Hello, World"
```

Oltre alle stringhe, in Swift esistono molti altri tipi di dati.

Nella fase iniziale, i quattro tipi più comuni sono:

- `String`
- `Int`
- `Double`
- `Bool`

Questi quattro tipi possono coprire la maggior parte dell'elaborazione di dati di base.

**String**

`String` rappresenta contenuti testuali, per esempio:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Le stringhe si usano spesso per rappresentare: nome utente, titolo, contenuto testuale.

**Int**

`Int` rappresenta i numeri interi, cioè numeri senza parte decimale.

Per esempio:

```swift
var age = 26
var count = 100
```

Gli interi si usano spesso per rappresentare: età, quantità, conteggi.

**Double**

`Double` rappresenta numeri con la parte decimale.

Per esempio:

```swift
var weight = 74.5
var height = 185.0
```

In Swift, i numeri decimali usano in genere `Double` come tipo predefinito.

Esiste anche un tipo simile chiamato `Float`, ma l'intervallo di valori che può rappresentare è più piccolo; perciò nello sviluppo reale si usa più spesso `Double`.

**Bool**

Il tipo `Bool` serve a rappresentare due stati: `true` e `false`.

Per esempio:

```swift
var isShowAlert = true
var isLogin = false
```

Il tipo `Bool` viene usato spesso nei giudizi condizionali. Per esempio, per stabilire se mostrare o meno una finestra di avviso.

Per tutte le situazioni che hanno solo due risultati, è particolarmente adatto usare il tipo `Bool`.

### Mostrare in SwiftUI

Quando mostriamo un valore di tipo `String`, possiamo usare direttamente `Text`:

```swift
Text(name)
```

Ma tipi come `Int` e `Double` non sono stringhe, quindi non possono essere inseriti direttamente come parte di un testo.

Se vogliamo mostrare questi dati dentro `Text`, possiamo usare l'interpolazione di stringa (`String Interpolation`):

```swift
\()
```

L'interpolazione di stringa deve essere scritta all'interno del contenuto della stringa e usa `\()` per racchiudere variabili o costanti.

Per esempio:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Nel codice sopra, `""` indica una stringa, mentre `\()` serve a inserire una variabile o una costante dentro la stringa.

Per esempio:

```swift
"DoubleNum: \(num * 2)"
```

Il contenuto mostrato sarà:

```swift
DoubleNum: 2
```

In questo modo, possiamo inserire variabili o costanti dentro una stringa e poi mostrarle nell'interfaccia con `Text`.

Suggerimento: `\()` può essere usato solo all'interno di una stringa `""`.

## Operatori

Quando dichiariamo una variabile o una costante, possiamo vedere questa scrittura:

```swift
var num = 1
```

Qui `=` si chiama operatore di assegnazione.

La sua funzione è: assegnare il valore a destra alla variabile a sinistra.

In questo esempio, `1` viene assegnato alla variabile `num`.

Oltre all'operatore di assegnazione, esistono anche alcuni operatori numerici comuni:

- `+`
- `-`
- `*`
- `/`

Quando effettuiamo calcoli sui numeri, per esempio con dati di tipo `Int` o `Double`, useremo questi operatori.

Per esempio:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Dopo il calcolo, il risultato verrà salvato nella variabile.

## Riepilogo

Variabili, costanti e operatori sono i concetti più basilari della programmazione.

Attraverso variabili e costanti possiamo salvare diversi dati nel programma; attraverso i tipi di dati possiamo chiarire la natura dei dati; attraverso gli operatori possiamo calcolare ed elaborare i dati.

Queste conoscenze sono come gli strumenti di base del mondo della programmazione. Padroneggiarle può gettare fondamenta solide per lo studio successivo di Swift e SwiftUI.
