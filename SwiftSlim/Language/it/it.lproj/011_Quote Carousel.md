# Carosello di citazioni

In questa lezione realizzeremo una funzione di "carosello di citazioni" e approfondiremo alcune conoscenze fondamentali di Swift, come gli array (`Array`) e le istruzioni condizionali (`if-else`).

Mostreremo come salvare più citazioni e come ottenere una riproduzione ciclica delle citazioni tramite l'interazione con i pulsanti.

![alt text](../../RESOURCE/011_word.png)

## Mostrare una citazione

Per prima cosa, dobbiamo mostrare una citazione in SwiftUI.

Il modo più semplice è usare la vista `Text`:

```swift
Text("Slow progress is still progress.")
```

Questo codice può mostrare solo una citazione fissa. Se vogliamo mostrare più citazioni e realizzare la funzione di cambio, dobbiamo prima salvarle.

Tuttavia, una normale variabile stringa può salvare solo una citazione:

```swift
let sayings = "Slow progress is still progress."
```

Se abbiamo bisogno di salvare più citazioni, dobbiamo dichiarare una variabile per ciascuna citazione:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Ma nello sviluppo reale questo modo non è soltanto macchinoso; inoltre, poiché ogni variabile è indipendente, non possiamo realizzare in modo flessibile il cambio ciclico.

Per gestire comodamente più citazioni, dobbiamo usare una struttura dati che le memorizzi insieme: l'array (`Array`).

Dopo aver usato l'array, il codice sopra può essere salvato così:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Suggerimento: nelle convenzioni di programmazione, i nomi delle variabili array che memorizzano più elementi usano di solito la forma plurale, come `sayings`, per riflettere la loro natura di collezione.**

## Array

In Swift, un array è una raccolta ordinata di elementi, indicata con parentesi quadre `[]`.

```swift
[]
```

Dentro un array possono esserci più elementi dello stesso tipo, separati da virgole inglesi `,`.

Per esempio:

```swift
[101, 102, 103, 104, 105]
```

Possiamo immaginare un array in modo semplice come un treno:

![Array](../../RESOURCE/011_array1.png)

L'intero treno rappresenta questo oggetto array, e ogni vagone è disposto in ordine.

### Indice e accesso agli elementi

Poiché l'array è ordinato, il sistema può localizzare un elemento specifico in base alla sua posizione. Questo meccanismo di localizzazione si chiama indice (`Index`).

In Swift (e nella grande maggioranza dei linguaggi di programmazione), l'indice degli array parte da 0 e non da 1. Questo significa che il primo elemento dell'array corrisponde all'indice 0, il secondo all'indice 1, e così via.

![Array](../../RESOURCE/011_array2.png)

Se vogliamo accedere a un elemento specifico dell'array, basta aggiungere parentesi quadre dopo il nome dell'array e inserire al loro interno il valore dell'indice dell'elemento desiderato.

Per esempio:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Se si prova ad accedere a un indice che supera il range valido dell'array, si verifica un problema di "indice fuori intervallo" (`Index Out of Range`). Perciò, quando si accede a un array, bisogna fare attenzione e assicurarsi che l'indice rientri nell'intervallo valido.

**Indice fuori intervallo**

Per esempio, se un array ha solo 5 elementi, l'intervallo valido degli indici va da 0 a 4. Se proviamo ad accedere a `sayings[5]`, il programma non riuscirà a trovare il "vagone" corrispondente, provocando un errore di indice fuori intervallo e facendo andare in crash l'app.

![Array](../../RESOURCE/011_array3.png)

### Operazioni sugli array

Gli array non supportano solo la definizione statica, ma anche operazioni come aggiungere, eliminare e modificare elementi, oltre a ottenere la lunghezza dell'array.

Suggerimento: se bisogna modificare l'array, è necessario dichiararlo con `var` e non con la costante `let`.

**1. Aggiungere elementi**

Si può usare il metodo `append` per aggiungere un elemento alla fine dell'array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Eliminare elementi**

Con il metodo `remove(at:)`, si può eliminare l'elemento specificato dell'array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modificare elementi**

Si possono modificare direttamente gli elementi dell'array tramite indice:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Contare la lunghezza dell'array**

Usa la proprietà `count` per ottenere il numero di elementi dell'array:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Usare un array per mostrare citazioni

Per mostrare più citazioni, possiamo salvarle in un array e poi accedervi e mostrarle tramite indice.

Per prima cosa, in `ContentView` creiamo un array `sayings` per memorizzare le citazioni, poi nella vista `Text` leggiamo e mostriamo la citazione corrispondente tramite indice:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Qui `sayings[0]` rappresenta la prima citazione dell'array.

Se vuoi mostrare una citazione diversa, basta modificare l'indice dentro le parentesi quadre:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definire l'indice della citazione

Per realizzare l'effetto di cambio dinamico della citazione, non possiamo "scrivere fisso" l'indice nella vista `Text`.

Dobbiamo creare una variabile che salvi separatamente il valore dell'indice attualmente mostrato.

In SwiftUI, possiamo usare `@State` per dichiarare un indice modificabile:

```swift
@State private var index = 0
```

SwiftUI osserverà la variabile wrappata da `@State`; quando `index` cambia, SwiftUI renderizzerà di nuovo la vista e mostrerà la citazione corrispondente.

Poi usiamo `sayings[index]` per ottenere dinamicamente la citazione dall'array:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Quando il valore di `index` cambia, `Text` mostrerà una citazione diversa.

### Usare il pulsante per controllare l'indice

Per controllare il cambio delle citazioni, possiamo usare `Button` per modificare il valore di `index`. Ogni volta che si tocca il pulsante, `index` aumenta automaticamente di 1:

```swift
Button("Next") {
    index += 1
}
```

Quando tocchiamo il pulsante, il valore di `index` passa da 0 a 1, attivando l'aggiornamento della vista, e `Text(sayings[index])` leggerà la citazione successiva.

Tuttavia, qui c'è un problema potenziale: se il pulsante viene toccato continuamente, `index` aumenterà fino a superare il range dell'array, il che causerà un errore di indice fuori intervallo. Per esempio, quando `index` arriva a 5 (mentre l'intervallo valido degli indici dell'array è da 0 a 4), il programma andrà in crash.

Per evitare che l'indice dell'array esca dal range, dobbiamo introdurre un controllo condizionale, così da assicurarci che `index` non superi l'intervallo dell'array. Possiamo usare un'istruzione `if-else` per verificare se `index` è minore della lunghezza dell'array.

## Controllo condizionale: istruzione if-else

L'istruzione `if-else` è una delle istruzioni di diramazione condizionale più comuni in Swift; serve a verificare se una condizione è vera e a eseguire blocchi di codice diversi a seconda che la condizione sia vera o falsa.

Struttura di base:

```swift
if condition {
    // Codice eseguito quando condition è true
} else {
    // Codice eseguito quando condition è false
}
```

Nell'istruzione `if`, la condizione `condition` è un valore booleano (`Bool`) e può essere `true` oppure `false`. Quando la condizione è `true`, verrà eseguito il codice del blocco `if`; altrimenti verrà eseguito il blocco `else`.

Per esempio:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

In questo esempio, il valore di `age` è 25; l'istruzione `if` verifica se `age > 18` è vera. Poiché la condizione è vera, viene stampato `"Big Boy"`.

Se non serve il blocco `else`, lo si può omettere:

```swift
if condition {
    // Codice eseguito quando condition è true
}
```

### Usare le condizioni per controllare il range dell'indice

Per evitare che l'indice dell'array vada fuori intervallo, possiamo usare un'istruzione `if` per assicurarci che `index` non superi il range dell'array:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analisi della logica: il valore di `sayings.count` è 5 (ci sono in totale 5 citazioni), quindi il valore di `sayings.count - 1` è 4, che è anche l'ultimo indice valido dell'array.

Quando `index` è minore di 4, toccare il pulsante ed eseguire l'operazione `+ 1` è sicuro; una volta che `index` raggiunge 4, la condizione non è più soddisfatta e toccare il pulsante non provocherà alcuna reazione.

Adesso il codice ha già realizzato la funzione di cambio della citazione:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Citazioni in ciclo

Se vogliamo che, una volta mostrata l'ultima citazione, toccando il pulsante si torni a mostrare la prima, così da realizzare un ciclo di citazioni, possiamo ottenerlo tramite la parte `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Quando si tocca il pulsante, se `index` ha raggiunto l'ultimo elemento dell'array, `index` verrà reimpostato a 0, ricominciando così il ciclo di citazioni.

## Ottimizzare la vista delle citazioni

Ora la logica del carosello di citazioni è già stata realizzata, ma possiamo ancora ottimizzare l'interfaccia per renderla più gradevole.

Codice completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

In questo esempio, la vista `Text` ha uno sfondo bianco semitrasparente con angoli arrotondati, il pulsante `Button` usa lo stile `.borderedProminent`, e `VStack` imposta un'immagine di sfondo.

Approfondimento: quando si usa il modificatore `background()` per gestire un'immagine di sfondo, il suo comportamento predefinito è riempire per quanto possibile l'area di layout in cui si trova la vista corrente. In molti casi, esso può naturalmente estendersi a coprire anche la Safe Area.

Ora abbiamo realizzato la vista del carosello di citazioni.

![SwiftUI View](../../RESOURCE/011_word.png)

## Riepilogo

Attraverso lo studio di questa lezione, abbiamo imparato a usare un array per memorizzare più citazioni e a usare le istruzioni `if` e `if-else` per realizzare il cambio ciclico delle citazioni.

Abbiamo anche conosciuto le operazioni di base sugli array, come aggiungere, eliminare e modificare elementi, e come evitare che l'indice dell'array vada fuori intervallo.

Questa lezione non ha solo spiegato l'implementazione del carosello di citazioni, ma ha anche unito gli usi di base di array e istruzioni condizionali, aiutandoci a padroneggiare la capacità di gestire i dati e controllare il flusso del programma.

## Conoscenza estesa - giudizio condizionale multiplo: istruzione if-else if-else

Nello sviluppo reale, è spesso necessario gestire più condizioni. Per esempio, in un certo gioco, quando il punteggio è uguale a 1 si attiva l'evento A, quando è uguale a 2 l'evento B, quando è uguale a 3 l'evento C, e così via.

Davanti a scenari con più di due rami condizionali, dobbiamo usare l'istruzione `if-else if-else` per effettuare giudizi multipli.

Sintassi di base:

```swift
if conditionA {
    // Codice eseguito quando conditionA è true
} else if conditionB {
    // Codice eseguito quando conditionB è true
} else if conditionC {
    // Codice eseguito quando conditionC è true
} else {
    // Codice eseguito quando nessuna condizione è soddisfatta
}
```

In questo caso, il programma verificherà le condizioni in ordine ed eseguirà la prima che risulti soddisfatta. Se nessuna condizione è soddisfatta, eseguirà il codice dopo `else`.

Nel carosello di citazioni, possiamo anche usare l'istruzione `if-else if-else` per un giudizio multiplo:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Quando `index` vale 0, 1, 2, 3, a ogni tocco del pulsante viene eseguito `index += 1`; quando `index` vale 4 (l'ultimo elemento), `index` viene reimpostato a 0, così si realizza il ciclo.

Il ramo `else` viene usato come copertura finale, per evitare valori non validi (per esempio se `index` venisse modificato in modo errato).

È importante notare che qui l'operatore `==` significa "uguale a". Se l'istruzione `if` verifica che `index` sia uguale a un certo numero, restituisce `true` ed esegue il blocco di codice successivo. Se non è uguale, passa a verificare l'`if` successivo.

Questo tipo di giudizio multiplo è utile per eseguire codice diverso in scenari condizionali differenti.
