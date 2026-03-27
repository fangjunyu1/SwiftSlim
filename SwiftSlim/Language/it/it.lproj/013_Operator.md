# Operatori

In questa lezione studieremo gli operatori di Swift (`Operators`).

Quando eseguiamo calcoli, confronti o giudizi logici, dobbiamo usare gli operatori. Queste operazioni attraversano ogni fase dell'esecuzione del programma e costituiscono una delle capacità più fondamentali della programmazione.

```swift
let a = 100 * 8
```

Durante lo studio della programmazione, molte persone scoprono che chi possiede una certa sensibilità matematica spesso comprende più facilmente la logica dei programmi. Questo perché la programmazione, nella sua essenza, non si separa da "calcolo" e "giudizio di regole", e questi sono proprio i ruoli centrali degli operatori.

Nello sviluppo reale, gli operatori non vengono usati solo per semplici calcoli numerici, ma anche in molti scenari concreti.

Per esempio, in un gioco a blocchi, quando l'utente trascina un blocco in una posizione specifica, bisogna calcolare:

- la posizione delle coordinate del blocco
- la posizione in cui il blocco può essere inserito
- se la posizione di destinazione è disponibile

Questi processi di "calcolo + giudizio", nella sostanza, dipendono tutti dagli operatori.

![Block](../../Resource/013_block.png)

Studiare gli operatori non significa solo imparare a fare conti con i numeri, ma anche gettare le basi per i futuri layout dell'interfaccia, l'elaborazione dei dati e la logica di interazione.

## Modalità di esecuzione dei calcoli in SwiftUI

In SwiftUI, di solito i calcoli vengono attivati tramite un `Button`, e la logica di calcolo viene poi eseguita dentro una funzione.

Per esempio:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Quando si tocca il pulsante, la Console mostrerà:

```
c: 20
```

In questa lezione scriveremo in modo uniforme la logica di calcolo dentro `func`, la attiveremo tramite pulsanti e useremo `print` per mostrare i risultati.

Negli esempi successivi, per semplificare la presentazione del codice, annoteremo direttamente il risultato del calcolo nel codice, invece di usare ogni volta `print`.

## Gestione dell'output della Console

Poiché ogni tocco produce informazioni di output, puoi fare clic sul pulsante di pulizia nell'angolo in basso a destra della Console per cancellare i log storici e facilitare la visualizzazione del risultato corrente.

![Console](../../Resource/013_console.png)

## Un altro modo di scrivere Button

Quando un pulsante esegue una sola funzione, si può usare una scrittura più concisa:

```swift
Button(action: ) {
    // View
}
```

In questa forma, `action` specifica la funzione da eseguire quando il pulsante viene toccato (funzione senza parametri), mentre le parentesi graffe `{}` servono a definire la vista del pulsante.

Unendo questo al `calculate` visto prima, si può scrivere:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Quando si tocca il pulsante, la funzione `calculate` verrà eseguita direttamente.

Perciò, quando la logica del pulsante è semplice e si limita a chiamare una sola funzione, la forma con `action` risulta più chiara e anche più conforme alle convenzioni del codice.

## Operatori aritmetici

Gli operatori aritmetici (`Arithmetic Operators`) vengono usati per i calcoli numerici:

- `+` addizione
- `-` sottrazione
- `*` moltiplicazione
- `/` divisione
- `%` modulo (resto)

Esempi:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

È importante notare che Swift è un linguaggio fortemente tipizzato e non mescola automaticamente tipi diversi:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Quando i due tipi non coincidono, bisogna convertire manualmente il tipo.

## Operatori di confronto

Gli operatori di confronto (`Comparison Operators`) servono a giudicare la relazione tra due valori, e il risultato è di tipo `Bool`:

- `==` uguale a
- `!=` diverso da
- `>` maggiore di
- `<` minore di
- `>=` maggiore o uguale a
- `<=` minore o uguale a

Esempi:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Gli operatori di confronto vengono spesso usati nelle istruzioni di giudizio. Per esempio, nel "carosello di citazioni", dobbiamo controllare che l'indice non superi il range dell'array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Se `index` è minore di `sayings.count - 1`, il risultato del confronto è `true` e il codice dentro `if` verrà eseguito; se il risultato è `false`, il codice successivo non verrà eseguito.

## Operatori logici

Gli operatori logici (`Logical Operators`) vengono usati per combinare più condizioni:

- `&&` AND
- `||` OR
- `!` NOT

### && AND

Quando più condizioni devono essere tutte soddisfatte contemporaneamente, si usa `&&`.

Per esempio:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

In questo codice sono presenti due condizioni: `age >= 18` e `age <= 100`.

Solo quando entrambe sono `true`, `legalAge` sarà `true`; basta che una sola non sia soddisfatta perché il risultato diventi `false`.

### || OR

Quando tra più condizioni ne basta una sola soddisfatta, si usa `||`.

Per esempio:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Questo codice significa che basta che `money >= 50` oppure `creditCard >= 50` sia vera, e `payAllowed` diventerà `true`.

Solo quando entrambe le condizioni non sono soddisfatte, il risultato sarà `false`.

Per esempio, in uno scenario di pagamento si può pagare in contanti oppure con carta di credito. Se nessuno dei due metodi è disponibile, il pagamento fallisce.

### ! NOT

`!` è l'operatore logico di negazione (`NOT`) e serve a invertire un valore `Bool`.

Lo si può intendere in modo semplice così: `!` trasforma `true` in `false`, e `false` in `true`.

Per esempio:

```swift
let allowed = true
let result = !allowed   // false
```

Qui `!allowed` significa invertire il valore di `allowed`.

È importante notare che `!` e `!=` sono due operatori diversi: `!` inverte un valore `Bool`, mentre `!=` è un operatore di confronto che restituisce un `Bool`.

## Operatori di assegnazione

Gli operatori di assegnazione (`Assignment Operators`) vengono usati per assegnare valori o aggiornare variabili:

- `=` assegnazione

Sia nella dichiarazione di variabili sia nel processo di calcolo, l'assegnazione compare sempre:

```swift
let a = 5
```

Questo codice significa assegnare il valore `5` alla variabile `a`.

### Operatori di assegnazione composta

Nello sviluppo reale, oltre agli operatori di assegnazione di base, si usano spesso anche gli "operatori di assegnazione composta", che permettono di calcolare direttamente sulla base del valore esistente e aggiornare il risultato:

- `+=`
- `-=`
- `*=`
- `/=`

Nella lezione precedente sul "contatore", abbiamo già conosciuto brevemente gli operatori di assegnazione composta.

Per esempio, quando si tocca un pulsante e si vuole fare aumentare automaticamente una variabile:

```swift
var num = 10
num += 5   // num = 15
```

Questo codice significa che `num` viene sommato a 5, e poi il risultato viene riassegnato a `num`.

Perciò equivale a:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operatore ternario

L'operatore ternario (`Ternary Operator`) in Swift esegue un giudizio in base a una condizione e restituisce uno dei due risultati:

```swift
condizione ? valore1 : valore2
```

La sua logica è: se la condizione è `true`, restituisce `valore1`; se è `false`, restituisce `valore2`.

Per esempio:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Questo codice giudica il valore di `showColor`: se è `true`, restituisce `Color.blue` e lo sfondo apparirà blu; se è `false`, restituisce `Color.clear` e non verrà mostrato alcun colore di sfondo.

Suggerimento: `Color.clear` indica un colore trasparente (nessun contenuto visibile).

### Differenza rispetto a if-else

Dal punto di vista logico, l'operatore ternario equivale a un'istruzione `if-else`.

Per esempio, il codice sopra può essere scritto così:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

La logica di esecuzione è esattamente la stessa: se la condizione è `true`, viene eseguito il primo risultato; se è `false`, viene eseguito il secondo.

Nell'uso pratico, l'operatore ternario è più conciso ed è più adatto a esprimere un semplice giudizio "o l'uno o l'altro", spesso usato per restituire direttamente un valore.

Nella costruzione di View in SwiftUI, l'operatore ternario è molto comune. Per esempio:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Questa scrittura permette di modificare dinamicamente l'effetto visivo della vista in una sola riga di codice, in base alla condizione.

## Operatori di range

Gli operatori di range (`Range Operators`) vengono usati per rappresentare intervalli:

- `...` intervallo chiuso (include entrambe le estremità)
- `..<` intervallo semiaperto (non include l'estremo destro)

Per esempio:

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Possiamo capirlo così: `1...3` rappresenta da 1 a 3, incluso 3; `5..<8` rappresenta da 5 a 8, ma senza includere 8.

Forme estese (solo da conoscere):

```
5...    // >= 5
...5    // <= 5
```

Questa scrittura rappresenta un "range unilaterale", spesso usato nelle condizioni o nel pattern matching.

Gli operatori di range verranno usati più avanti nello studio dei cicli `for`; per ora basta comprenderli come un intervallo continuo di valori.

## Esercitarsi con gli operatori

Adesso, attraverso alcuni semplici esempi, esercitiamo l'effetto degli operatori all'interno della vista.

### 1. Calcolare il numero totale di veicoli

Per esempio, a un incrocio passano ogni giorno 500 veicoli; calcoliamo il totale dei veicoli in 30 giorni.

Possiamo usare gli operatori di calcolo:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Qui il processo di calcolo è: 500 veicoli al giorno, per 30 giorni il totale è `500 × 30`, ottenendo infine 15000 veicoli.

### 2. Giudicare un abbonamento membro in-app

Possiamo giudicare se una persona è membro in-app: basta che abbia attivato il piano permanente oppure l'abbonamento periodico, e verrà considerata membro.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

In questo codice viene usato l'operatore `||` (OR): `lifeTime = false` indica che non ha il piano permanente; `subscription = true` indica che ha un abbonamento.

Poiché basta soddisfare una delle due condizioni, `isMember` sarà `true`. Perciò questa persona è un membro in-app.

## Riepilogo

In Swift, gli operatori sono la base del calcolo dei dati e del giudizio logico, proprio come `Text` serve a mostrare il contenuto, gli operatori servono a elaborare i dati stessi.

Dal calcolo numerico più semplice, fino ai giudizi logici più complessi, e ancora al controllo dello stato nelle viste e ai calcoli di layout, tutto dipende dalla partecipazione degli operatori.

Attraverso l'esercizio in scenari diversi, possiamo familiarizzare gradualmente e padroneggiare i vari tipi di operatori introdotti in questa lezione; questa è un'importante base per lo studio successivo.

### Conoscenza estesa - Operatori bit a bit

Inoltre, Swift fornisce anche una classe di operatori di livello più basso: gli operatori bit a bit (`Bitwise Operators`):

- `&` (AND bit a bit)
- `|` (OR bit a bit)
- `^` (XOR bit a bit)
- `~` (NOT bit a bit)
- `>>` (shift a destra)
- `<<` (shift a sinistra)

Per esempio:

```swift
let a = 6  // binario 110
let b = 3  // binario 011

print(a & b) // 2 (binario 010)
print(a | b) // 7 (binario 111)
print(a ^ b) // 5 (binario 101)
print(~a)    // -7 (complemento bit a bit)
```

In Swift, gli interi usano la rappresentazione binaria in complemento a due; dopo l'inversione dei bit si ottiene il corrispondente risultato negativo.

Gli operatori bit a bit operano direttamente sul binario e vengono in genere usati nell'elaborazione dei dati di basso livello o negli scenari di ottimizzazione delle prestazioni.

Per i principianti, gli scenari d'uso di questi operatori sono relativamente pochi, e nello sviluppo generale di iOS o SwiftUI non sono nemmeno molto comuni, quindi qui non li approfondiremo.

Se in seguito entreremo in contatto con logiche di basso livello o con l'ottimizzazione delle prestazioni, potremo studiarli e capirli più a fondo.
