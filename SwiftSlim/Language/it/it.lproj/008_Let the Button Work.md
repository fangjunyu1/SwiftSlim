# Far funzionare il pulsante

In questa lezione studieremo principalmente il pulsante `Button`, l'output di debug con `print` e le funzioni Swift.

Questi contenuti costituiscono la base della programmazione interattiva in SwiftUI.

## Pulsanti

I pulsanti sono il controllo UI che vediamo più spesso. Quando dobbiamo scaricare, aprire o uscire da qualcosa, normalmente facciamo clic su un pulsante.

Per esempio, nell'App Store si tocca il pulsante "Ottieni" per scaricare un'app.

![Button](../../RESOURCE/008_button.png)

In SwiftUI, i pulsanti sono rappresentati con `Button`.

Uso di base:

```swift
Button("") {
    
}
```

La struttura può essere divisa in due parti:

```swift
Button("Testo del pulsante") {
    Codice eseguito quando si tocca il pulsante
}
```

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Dopo l'esecuzione, verrà mostrato un pulsante Start.

![Button](../../RESOURCE/008_button1.png)

Quando l'utente tocca il pulsante, il codice dentro `{}` verrà eseguito.

È importante notare che `Button` appartiene ai controlli di interfaccia (`View`) di SwiftUI, quindi deve essere scritto dentro `body`.

### Modificatore buttonStyle

In SwiftUI, `Button` mette a disposizione stili di pulsante integrati nel sistema, che possono essere usati tramite il modificatore `buttonStyle`.

Per esempio:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` applicherà uno stile di pulsante fornito dal sistema.

Le opzioni più comuni includono:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

La differenza principale tra gli stili riguarda la presenza o meno di bordo, sfondo e intensità dell'enfasi visiva.

## Output con print

Nella programmazione, spesso abbiamo bisogno di verificare se il programma è arrivato a un determinato blocco di codice.

Swift fornisce la funzione `print` per l'output delle informazioni di debug.

Scrittura di base:

```swift
print("Hello")
```

Questa riga di codice invierà il testo nella Console.

### Testare se il pulsante funziona

Possiamo scrivere `print` dentro il pulsante per verificare se il pulsante è stato premuto.

```swift
Button("Start") {
    print("Test 123")
}
```

Quando si tocca il pulsante, la Console mostrerà:

```
Test 123
```

Questo significa che il pulsante è stato attivato con successo.

![Button](../../RESOURCE/008_button3.png)

Nota: `print` è codice Swift, non un controllo dell'interfaccia. Non può essere messo direttamente in `body`, altrimenti comparirà un errore.

Per esempio, scrivere così è sbagliato:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Errore: body deve restituire una View
    }
}
```

In SwiftUI, `body` serve a descrivere la struttura dell'interfaccia, quindi può contenere solo controlli di interfaccia (`View`), come `Text`, `Button`, `Image` e così via.

Il codice normale (logica di calcolo, `print` ecc.) deve stare nei pulsanti, nelle funzioni o in altri gestori di evento.

### Console

Il contenuto stampato da `print` verrà mostrato nella Console di Xcode.

Se non vedi la Console, puoi fare clic sul pulsante `Show the Debug Area` in basso a destra per aprire l'area di debug, poi sul pulsante `Show the Console` per mostrare la console.

![](../../RESOURCE/008_button4.png)

Nell'angolo inferiore sinistro della Console ci sono due schede: `Executable` e `Previews`.

![](../../RESOURCE/008_button5.png)

Queste due schede corrispondono ad ambienti di esecuzione differenti: quando si usa la vista di anteprima nel Canvas, l'output di `print` verrà mostrato sotto la scheda `Previews`; se invece l'app viene eseguita nel simulatore o su un dispositivo reale, l'output verrà mostrato sotto la scheda `Executable`.

Perciò, quando ti accorgi che `print` non produce output, puoi prima verificare di aver selezionato la scheda corretta.

## Esempio - ASCII art

In alcuni progetti di codice, si vedono spesso figure ASCII.

Le figure ASCII sono disegni composti da caratteri comuni, per esempio:

![ASCII](../../RESOURCE/008_ascii.png)

Possiamo usare `Button` + `print` per mostrare una figura ASCII.

Codice di esempio:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Quando si tocca il pulsante, la Console mostrerà:

```
 /\_/\
( o.o )
 > ^ <
```

Nota: la barra rovesciata `\` nelle stringhe deve essere scritta come `\\`, perché il backslash è un carattere di escape nelle stringhe.

## Funzioni

Dentro il pulsante possiamo scrivere direttamente del codice.

Per esempio:

```swift
Button("Start") {
    print("Hello")
}
```

Se il codice è poco, scrivere così non è un problema. Ma nello sviluppo reale, la logica attivata da un pulsante può essere molto più ampia.

Per esempio:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Potrebbe esserci molto altro codice
}
```

Se il codice diventa sempre di più, scriverlo direttamente dentro il pulsante renderà il codice dell'interfaccia disordinato e poco comodo da leggere e mantenere.

Per questo, di solito organizziamo questo codice dentro una funzione, e poi richiamiamo la funzione nel pulsante.

### Che cos'è una funzione

Una funzione è un blocco di codice riutilizzabile.

Quando un certo codice deve essere eseguito, basta chiamare questa funzione per far eseguire il codice al suo interno.

Questo può rendere la struttura del codice più chiara e facilitare il riuso.

### Scrittura di base

In Swift, una funzione viene definita con la parola chiave **func**:

```swift
func randomInt() {
    // code
}
```

Questo codice definisce una funzione.

`randomInt` è il nome della funzione, usato per identificare questo blocco di codice.

`()` rappresenta la posizione dei parametri: qui si possono ricevere dati passati dall'esterno. Se non servono dati, può restare vuoto.

Dentro `{}` si trova l'area di codice della funzione; tutto il codice che deve essere eseguito va scritto lì.

Per esempio:

```swift
func getName() {
    print("FangJunyu")
}
```

Questa funzione serve a stampare una riga di testo.

### Chiamare una funzione

Definire una funzione significa soltanto creare questo blocco di codice; se vuoi eseguirlo, devi ancora chiamarla.

Il modo di chiamarla consiste nell'aggiungere `()` dopo il nome della funzione:

```swift
getName()
```

Quando il programma arriva a questa riga, eseguirà il codice dentro la funzione `getName`.

Esempio completo:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Dopo l'esecuzione, la Console mostrerà:

```
FangJunyu
```

### Usare funzioni in SwiftUI

Nelle viste SwiftUI, le funzioni di solito si scrivono fuori da `body`.

Per esempio:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Quando si tocca il pulsante, verrà chiamata la funzione `getName()`.

In questo modo il codice dell'interfaccia può rimanere più pulito, mentre la logica concreta viene gestita nella funzione.

### Parametri di funzione

A volte una funzione deve eseguire operazioni diverse a seconda dei dati ricevuti.

Per esempio, vogliamo che la funzione possa stampare nomi diversi, invece di stampare soltanto il valore fisso `"FangJunyu"`.

In questo caso possiamo usare i parametri; i parametri possono essere intesi come i dati passati quando si chiama una funzione.

Per esempio:

```swift
func getName(name: String) {
    print(name)
}
```

Questa funzione aggiunge un parametro: `name` è il nome del parametro, `String` è il tipo del parametro. 

Questo significa che la funzione deve ricevere un dato di tipo `String`.

Poiché la funzione adesso ha bisogno di dati, quando la chiami dobbiamo fornirli.

```swift
getName(name: "Sam")
```

Quando viene passato `"Sam"`, la funzione userà questo valore per stamparlo.

Risultato dell'esecuzione:

```
Sam
```

## Esempio - usare una funzione per stampare ASCII art

Nell'esempio precedente abbiamo scritto `print` direttamente dentro il pulsante.

Ma se il disegno ASCII diventa più complesso, il codice si allungherà molto. In quel caso possiamo spostare la logica dentro una funzione, così il codice dell'interfaccia sarà più chiaro.

Codice di esempio:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Dopo l'esecuzione, quando tocchi il pulsante, la Console mostrerà:

```
 /\_/\
( o.o )
 > ^ <
```

Qui succedono due cose quando l'utente tocca il pulsante:

1. il pulsante chiama la funzione `printCat()`
2. il codice `print` dentro la funzione viene eseguito

In questo modo il codice dell'interfaccia si occupa solo di attivare l'evento, mentre la logica concreta viene gestita nella funzione.

Nello sviluppo reale, la maggior parte delle operazioni dei pulsanti viene realizzata proprio attraverso funzioni.

## Riepilogo

In questa lezione abbiamo studiato tre contenuti importanti:

**1. Pulsante Button**

`Button` è il controllo di SwiftUI usato per attivare operazioni.

```swift
Button("Start") {

}
```

Quando l'utente tocca il pulsante, il codice dentro le parentesi graffe viene eseguito.

**2. Output con print**

`print` serve a inviare informazioni di debug alla Console.

```swift
print("Hello")
```

Gli sviluppatori possono usare la Console per osservare lo stato di esecuzione del programma.

**3. Funzioni**

Una funzione è un blocco di codice riutilizzabile.

```swift
func sayHello() {
    print("Hello")
}
```

Chiamare una funzione:

```swift
sayHello()
```

Se la funzione ha bisogno di dati, si possono usare parametri:

```swift
func sayHello(name: String) {
    print(name)
}
```

Nelle lezioni successive continueremo a studiare altri controlli SwiftUI e il modo in cui i dati interagiscono con l'interfaccia.

## Esercizi

Prova a completare questi esercizi:

1. crea un pulsante con il testo "Hello"
2. quando si tocca il pulsante, stampa `Hello Swift` nella Console
3. sposta il codice di output in una funzione e poi richiama quella funzione nel pulsante
