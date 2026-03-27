# Sistema dei tipi

Nelle lezioni precedenti abbiamo già studiato le variabili e sappiamo che una variabile può salvare dati di tipi diversi.

Per esempio:

```swift
var hello = "Hello, World"
```

Qui `hello` salva un testo, quindi il suo tipo è `String`.

Successivamente studieremo in modo sistematico il concetto di tipo (`Type`), insieme alla dichiarazione esplicita del tipo e all'inferenza del tipo, così da comprendere più a fondo la natura delle variabili.

## Che cos'è un tipo

In Swift, ogni valore ha un tipo ben definito. Il tipo determina che cosa sia quel valore e che cosa possa fare.

Per esempio:

- `42` è un `Int` (intero)
- `"Hello"` è `String` (stringa)
- `true` è `Bool` (valore booleano)

Appartengono a tipi diversi e anche i loro usi sono diversi.

## Tipi di base comuni in Swift

Nella fase iniziale, i tipi più comuni sono i seguenti:

- `String`: stringa (testo)
- `Int`: intero
- `Double`: numero in virgola mobile (con decimali, precisione più alta)
- `Bool`: valore booleano (`true/false`)

Inoltre esistono anche `Float` (numero in virgola mobile), ma con precisione inferiore rispetto a `Double`, quindi in genere si usa meno; e `Character` (singolo carattere), per esempio `"A"`, `"!"` e così via.

### Dichiarazione del tipo (tipo esplicito)

In Swift, quando si dichiara una variabile, si può specificarne manualmente il tipo:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Si aggiunge `: Tipo` dopo il nome della variabile per dichiararne il tipo.

La scrittura del tipo per gli array è `: [Tipo]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

In questo blocco di codice, l'array `scores` può salvare solo elementi di tipo `Int`, mentre `tags` può salvare solo elementi di tipo `String`.

Dichiarare esplicitamente il tipo può rendere più chiara l'intenzione del codice e in alcuni casi può evitare errori di inferenza del tipo.

## Inferenza del tipo

In molti casi, il tipo non va dichiarato esplicitamente:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Questo perché il compilatore Swift deduce automaticamente il tipo in base al "valore iniziale".

## Dichiarazione esplicita e inferenza del tipo

Nelle lezioni precedenti non abbiamo introdotto la dichiarazione esplicita, per esempio:

```swift
var age: Int = 18
```

ma abbiamo dato priorità all'inferenza del tipo:

```swift
var age = 18
```

In questo esempio, le due scritture sono equivalenti: `age` sarà comunque determinata come tipo `Int`. In confronto, la scrittura con inferenza del tipo è più concisa.

Il motivo per cui all'inizio non si insiste sulla dichiarazione esplicita è che l'inferenza del tipo può ridurre le informazioni extra presenti nel codice, diminuendo così il costo di comprensione nella fase iniziale dello studio.

## Perché servono i tipi

Swift è un linguaggio fortemente tipizzato (`Strongly Typed Language`).

Questo significa che: una volta determinato il tipo di una variabile, non può essere cambiato arbitrariamente.

Per esempio:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Il primo `20` è di tipo `Int`, quindi può essere assegnato ad `age`; il secondo `"20"` è di tipo `String`, e non coincide con `Int`, quindi genera un errore.

`nums` è un array di tipo `[Int]`, quindi può salvare solo interi e non può mescolare stringhe.

I tipi possono vincolare il modo in cui i dati vengono usati, individuando problemi di incompatibilità di tipo già in fase di compilazione; questo riduce i bug dovuti alla confusione di tipi e migliora la stabilità e la manutenibilità del codice.

## Quando è obbligatorio dichiarare esplicitamente il tipo

Anche se Swift può inferire automaticamente il tipo, in alcune situazioni il compilatore non riesce a dedurlo correttamente, o lo deduce in modo errato; in questi casi bisogna dichiararlo manualmente.

**1. Array vuoto**

Quando si crea un array vuoto, è obbligatorio dichiararne esplicitamente il tipo:

```swift
var nums: [Int] = []
```

Se non si scrive il tipo:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Il compilatore non riesce a dedurre il tipo degli elementi di un array vuoto, quindi viene generato un errore di compilazione.

**2. Evitare inferenze errate**

```swift
var value = 10   // Int
```

In questo esempio, anche se `10` potrebbe rappresentare un numero in virgola mobile (`Double`), poiché non contiene il punto decimale il compilatore lo deduce per default come `Int`.

Se si desidera che `value` rappresenti un numero in virgola mobile, è necessario dichiararne esplicitamente il tipo:

```swift
var value: Double = 10   // Double
```

Quando il risultato dell'inferenza non corrisponde a ciò che ci si aspetta, bisogna usare una dichiarazione di tipo esplicita oppure adattare la forma del valore letterale per assicurarsi che il tipo sia corretto.

**3. Tipi personalizzati**

Più avanti studieremo anche i tipi personalizzati; quando si usano tipi personalizzati, spesso è necessario dichiararli esplicitamente:

```swift
var info: GameInfo
var users: [User] = []
```

Il motivo è lo stesso degli array vuoti: il compilatore non riesce a dedurre automaticamente il tipo partendo da un valore vuoto.

## Conversione di tipo

In Swift, i tipi diversi non possono essere convertiti automaticamente tra loro: la conversione deve essere eseguita manualmente.

Per esempio, sommare due numeri di tipo diverso:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

In questo blocco di codice, `a` è di tipo `Int` e `b` è di tipo `Double`; essendo tipi diversi, non possono essere usati direttamente nella stessa operazione.

Prima di eseguire l'operazione, bisogna convertire uno dei due valori nello stesso tipo dell'altro:

```swift
var result = Double(a) + b
```

Questo codice significa che `a`, di tipo `Int`, viene convertito in `Double` e poi sommato a `b`, assegnando il risultato a `result`.

È importante notare che la conversione di tipo non modifica il tipo della variabile originale. Per esempio, `Double(a)` non cambia il tipo `Int` di `a`, ma crea un nuovo valore di tipo `Double` da usare nell'operazione.

Anche gli altri tipi possono essere convertiti in modo simile, cioè usando `TipoDestinazione()` e passando all'interno il valore da convertire. Per esempio:

```
Int()、Double()、String()
```

Esempio:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

È importante notare che non tutte le conversioni di tipo possono riuscire pienamente; per esempio, nella conversione `Double → Int`, la parte decimale viene troncata direttamente, senza arrotondamento.

## Alias di tipo

In Swift, si può anche assegnare un alias a un tipo esistente per rendere il significato del codice più chiaro:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Qui `UserId` nella sostanza resta comunque un `Int`: il tipo non cambia, cambia soltanto il nome, che diventa più significativo.

Nei progetti con molto codice e tipi complessi, gli alias di tipo possono rendere il codice più leggibile.

## Esempio di tipo

Qui sotto, attraverso un semplice esempio, mostriamo il ruolo dei tipi nello sviluppo reale.

### Creare una variabile

Per prima cosa, creiamo una variabile `age`:

```swift
var age = 20
```

Poiché dobbiamo mostrare e modificare questa variabile in SwiftUI, dobbiamo dichiararla con `@State`:

```swift
@State private var age = 20
```

`private` è già stato menzionato in precedenza e indica che questa variabile può essere usata solo nella vista corrente; più avanti la studieremo in modo più approfondito.

### Mostrare i dati in SwiftUI

Mostriamo la variabile `age` in SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Adesso la vista mostrerà:

```swift
age: 20
```

### Modificare i dati

Successivamente aggiungiamo due pulsanti per modificare `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Risultato dell'esecuzione

Quando si tocca `changeAge1`, a `age` verrà assegnato 18:

```swift
age = 18
```

Poiché `18` è di tipo `Int`, cioè dello stesso tipo di `age`, l'assegnazione riesce.

`changeAge2` invece produrrà un errore:

```swift
age = "18"
```

Messaggio di errore:

```
Cannot assign value of type 'String' to type 'Int'
```

Questo accade perché `"18"` è di tipo `String` (le stringhe devono essere racchiuse tra `""`), mentre `age` è di tipo `Int`; i tipi non coincidono, quindi l'assegnazione non è possibile.

### Perché compare l'errore?

Il punto chiave è questa riga di codice:

```swift
@State private var age = 20   // Int
```

Anche se il tipo non è dichiarato esplicitamente, poiché il valore iniziale `20` è di tipo `Int`, il compilatore deduce automaticamente che `age` è di tipo `Int`.

Una volta determinato il tipo, non è più possibile assegnargli un valore di un altro tipo.

Inoltre, il pulsante `changeAge2` non "fallisce a runtime", ma genera un errore già in fase di compilazione e il codice non può essere compilato.

Questo è anche uno dei vantaggi del forte sistema di tipi di Swift: i problemi di tipo possono essere individuati in anticipo già durante la scrittura del codice.

### Scrittura corretta

Dopo aver eliminato il codice errato:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Quando si tocca il pulsante `changeAge1`, la vista si aggiornerà in:

```
age: 18
```

### Dichiarazione esplicita del tipo (facoltativa)

Quando si definisce, si può anche specificare chiaramente il tipo:

```swift
@State private var age: Int = 20
```

Questa scrittura può rendere il tipo più chiaro, ma negli scenari semplici non è indispensabile.

## Riepilogo

Questa lezione ha parlato soprattutto del sistema dei tipi di Swift e del suo ruolo nello sviluppo reale.

In Swift, ogni valore ha un tipo ben definito, e il tipo determina il significato dei dati e le operazioni a cui possono partecipare.

Swift è fortemente tipizzato: una volta definito il tipo di una variabile, non è più possibile assegnarle un tipo diverso. Questo vincolo permette di individuare errori in fase di compilazione, riducendo i problemi a runtime e aumentando la sicurezza del codice.

Il tipo di una variabile può essere dedotto automaticamente dal valore iniziale oppure dichiarato esplicitamente. In alcune situazioni (come array vuoti, errori di inferenza del tipo, tipi personalizzati), il compilatore non riesce a dedurre correttamente il tipo, quindi è obbligatorio dichiararlo esplicitamente.

Tra tipi diversi non avvengono conversioni automatiche; bisogna usare conversioni esplicite come `Int()`, `Double()`, `String()`.

I tipi supportano anche alias; soprattutto nei progetti complessi, gli alias di tipo possono migliorare la leggibilità.

Il tipo non è solo un'etichetta dei dati, ma anche un meccanismo di vincolo che assicura che l'uso dei dati sia sicuro, chiaro e controllabile.

## Conoscenza estesa - Tipo opzionale

Quando si eseguono conversioni di tipo, alcune operazioni possono fallire.

Per esempio, convertire una `String` in `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Qui `Double(input)` non restituisce `Double`, ma:

```
Double?
```

Questo è un tipo opzionale (`Optional`).

### Perché restituisce un tipo opzionale?

Perché il contenuto di una stringa è incerto: `"3.14"` può essere convertito in `Double`, mentre `"Hello"` non può esserlo.

In altre parole, questa operazione può avere successo oppure fallire.

Perciò Swift usa un tipo opzionale per rappresentare questa incertezza.

### Che cos'è un tipo opzionale?

Un tipo opzionale significa che: un valore può esistere, oppure può non esistere.

Per esempio:

```
Double?
```

Questo tipo significa che, se c'è un valore, durante la stampa verrà mostrato `Optional(...)`; se non c'è un valore, verrà restituito `nil`.

È importante notare che `nil` significa "nessun valore", e non 0 o una stringa vuota.

### Esempio

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Output:

```
pi:Optional(3.14)
```

Questo significa che la stringa è stata convertita con successo in `Double`, ottenendo `3.14`, ma poiché il tipo è `Double?`, il valore viene racchiuso in `Optional`.

Se la conversione fallisce:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Output:

```
pi: nil
```

Poiché `"Hello"` non può essere convertito in `Double`, la conversione fallisce e restituisce `nil`.

### Che cos'è Optional(...)?

Quando stampiamo direttamente un tipo opzionale:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift mostrerà la sua "descrizione di debug":

```
Optional(3.14)
```

Questo non fa parte dei dati reali, ma serve a indicare che il valore corrente è un "tipo opzionale" e che al suo interno contiene un valore.

### Unwrapping di un tipo opzionale

Nello sviluppo reale, di solito dobbiamo estrarre il valore reale da un tipo opzionale; questo processo si chiama unwrapping.

Un modo comune consiste nell'usare `??` per fornire un valore predefinito:

```
??
```

Questo si chiama: operatore di coalescenza del nil (`Nil-Coalescing Operator`).

Per esempio:

```swift
name ?? "FangJunyu"
```

Questo codice significa: se `name` ha un valore, restituisci quel valore; se invece è `nil`, usa il valore predefinito `"FangJunyu"`.

È importante notare che il tipo del valore predefinito deve coincidere con il tipo dell'opzionale.

### Usare ?? per fornire un valore predefinito

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Output:

```
pi: 30
```

Quando `input` viene convertito in `Double`, la conversione riesce e viene stampato il valore. Se la conversione fallisce, verrà stampato il valore predefinito fornito da `??`.

Se la conversione fallisce:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Output:

```
pi: 10
```

Qui, quando `input` viene convertito in `Double`, la conversione fallisce e restituisce `nil`; `??` fornisce quindi un valore predefinito per `nil`.

Il tipo opzionale viene usato per rappresentare situazioni in cui "può esserci un valore, oppure può non esserci".

Nelle operazioni che possono fallire, come la conversione di tipo, Swift restituisce un tipo opzionale per garantire la sicurezza del programma.

Quando dobbiamo usare il valore al suo interno, possiamo fornire un valore predefinito tramite `??`, così da ottenere comunque un risultato ragionevole anche in presenza di `nil`.
