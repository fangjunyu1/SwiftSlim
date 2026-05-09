# Proprietà calcolate

In questa lezione impariamo principalmente le proprietà calcolate.

Le proprietà calcolate servono a calcolare un nuovo risultato a partire da dati esistenti. Possono calcolare valori numerici e anche contenuti da mostrare nelle viste SwiftUI.

Per esempio:

```swift
let a = 10
let b = 20
let c = a + b
```

Qui `c` rappresenta il risultato della somma di `a` e `b`.

Nel codice normale, questo modo di scrivere è molto comune.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Suggerimento: nell'evento di tap di un `Button` si può eseguire normale codice Swift.

Tuttavia, se scriviamo codice simile direttamente nelle proprietà di una vista SwiftUI, incontreremo un problema.

Per esempio:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Questo codice produrrà un errore.

Sembra che `a` e `b` siano già scritti prima di `c`, quindi sembra possibile calcolare il valore di `c`.

Ma nelle dichiarazioni delle proprietà di una struttura, questa scrittura non può essere usata direttamente.

## Perché c non può calcolare direttamente a + b

Perché `a`, `b` e `c` non sono costanti temporanee nell'evento di tap di un pulsante, ma proprietà della vista `ContentView`.

Nell'evento di tap del pulsante, questo codice può essere eseguito normalmente:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Perché dopo il tap del pulsante, il codice viene eseguito in ordine. Prima viene creato `a`, poi viene creato `b`, e infine `c` viene calcolato con `a + b`.

Ma quando si dichiarano proprietà dentro una vista, la situazione è diversa:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Qui `a`, `b` e `c` sono tutte proprietà della vista `ContentView`.

Quando viene creata la vista `ContentView`, Swift deve prima preparare queste proprietà. Per mantenere sicuro il processo di creazione, Swift non consente al valore predefinito di una proprietà memorizzata di istanza di leggere direttamente altre proprietà della stessa istanza.

Perciò questa riga produrrà un errore:

```swift
let c = a + b
```

Possiamo capirlo semplicemente così: **quando si dichiarano proprietà dentro una vista, non si può usare direttamente una proprietà ordinaria per calcolare un'altra proprietà ordinaria.**

Una proprietà che memorizza direttamente un valore si chiama "proprietà memorizzata". Per facilitare la comprensione, possiamo anche considerarla temporaneamente una proprietà ordinaria.

Per esempio:

```swift
let a = 10
```

`a` memorizza `10`.

```swift
let b = 20
```

`b` memorizza `20`.

Ma:

```swift
let c = a + b
```

Qui `c` non è un valore scritto direttamente, ma un valore che vogliamo calcolare tramite `a + b`.

Per una situazione di questo tipo, cioè "ottenere un risultato da dati esistenti", una proprietà calcolata è più adatta.

Si può modificare così:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Qui `c` è una proprietà calcolata.

```swift
var c: Int {
    return a + b
}
```

Significa: **quando serve usare `c`, leggi `a` e `b` in quel momento e restituisci il risultato di `a + b`.**

Per esempio:

```swift
Text("c: \(c)")
```

Quando `Text` mostra `c`, solo allora viene attivato il calcolo di `c`.

## Che cos'è una proprietà calcolata?

Una proprietà calcolata sembra una variabile, ma non memorizza dati di per sé.

Per esempio:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Qui `c` è una proprietà calcolata.

Non memorizza un valore fisso come una proprietà ordinaria, ma ogni volta che `c` viene letta, esegue di nuovo il codice dentro `{}` e restituisce il risultato del calcolo.

Si può capire così:

```swift
var c: Int {
    return a + b
}
```

Quando dobbiamo usare `c`, calcoliamo `a + b`.

Quindi una proprietà calcolata è adatta a questa situazione: **un risultato non deve essere memorizzato separatamente, perché può essere calcolato da dati esistenti.**

## Sintassi di base

Una proprietà calcolata di solito contiene tre parti:

```swift
var c: Int {
    return a + b
}
```

### 1. Dichiararla con `var`

```swift
var c
```

Una proprietà calcolata deve essere dichiarata con `var`; non si può usare `let`.

Perché una proprietà calcolata non è un valore memorizzato fisso, ma un risultato calcolato dinamicamente ogni volta che viene letto.

### 2. Indicare il tipo restituito

```swift
var c: Int
```

Una proprietà calcolata deve indicare il tipo restituito.

Qui `c` alla fine restituirà un intero, quindi il tipo è `Int`.

### 3. Usare {} per scrivere la logica di calcolo

```swift
{
    return a + b
}
```

Dentro `{}` si scrive la logica di calcolo; qui viene restituito `a + b`.

## La parola chiave return

Una proprietà calcolata deve restituire un risultato.

Per esempio:

```swift
var c: Int {
    return a + b
}
```

Qui `return` significa: restituisci all'esterno il risultato del calcolo `a + b`.

Se la proprietà calcolata contiene una sola espressione che produce direttamente un risultato, `return` può essere omesso:

```swift
var c: Int {
    a + b
}
```

Ma se la proprietà calcolata contiene più righe di codice, bisogna usare `return` per restituire chiaramente il risultato.

Per esempio:

```swift
var totalPriceText: String {
    let total = count * price
    return "Totale: \(total) $"
}
```

Qui il processo di calcolo è diviso in due passaggi.

Primo passaggio, calcolare prima il prezzo totale:

```swift
let total = count * price
```

Secondo passaggio, unire il prezzo totale in un testo e restituirlo:

```swift
return "Totale: \(total) $"
```

Se rimuoviamo `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Totale: \(total) $"
}
```

Questo codice produrrà un errore.

Il motivo è: **questa proprietà calcolata contiene già più righe di codice e Swift non può più determinare automaticamente quale riga sia il risultato finale da restituire.**

Quindi, quando una proprietà calcolata ha una sola riga di risultato, `return` può essere omesso.

```swift
var c: Int {
    a + b
}
```

Quando una proprietà calcolata contiene più righe di codice, è consigliabile scrivere chiaramente `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Totale: \(total) $"
}
```

## Differenza tra proprietà calcolate e proprietà ordinarie

Le proprietà ordinarie memorizzano dati.

```swift
var c = 30
```

Qui `c` memorizza un valore concreto: `30`.

Le proprietà calcolate non memorizzano dati.

```swift
var c: Int {
    a + b
}
```

Qui `c` non memorizza `30`. Fornisce solo un modo di calcolo.

Quando `c` viene letta, Swift esegue:

```swift
a + b
```

Poi restituisce il risultato del calcolo.

Quindi le proprietà calcolate sono adatte alle situazioni in cui un risultato viene calcolato da altri dati.

## body è anche una proprietà calcolata

Dopo aver imparato le proprietà calcolate, possiamo capire di nuovo uno dei frammenti di codice più comuni in SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Qui `body` è anche una proprietà calcolata.

È dichiarata con `var`:

```swift
var body
```

Ha un tipo restituito:

```swift
some View
```

Dentro le sue `{}` viene restituito contenuto di vista SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Quindi `body` può essere capita così: quando SwiftUI deve mostrare questa vista, legge `body` e genera l'interfaccia in base al contenuto restituito da `body`.

Se scriviamo `return`, possiamo capirlo così:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Tuttavia in SwiftUI di solito omettiamo `return` e scriviamo direttamente:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Quando i dati `@State` cambiano, SwiftUI legge di nuovo `body` e aggiorna l'interfaccia in base ai nuovi dati.

Per esempio:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("conteggio: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Dopo aver toccato il pulsante, `count` cambia.

```swift
count += 1
```

Dopo che `count` cambia, SwiftUI ricalcola `body`, quindi anche il testo nell'interfaccia viene aggiornato.

```swift
Text("conteggio: \(count)")
```

Questo è anche il motivo per cui in SwiftUI, dopo il cambiamento dei dati, l'interfaccia può aggiornarsi automaticamente.

### Non è consigliato scrivere calcoli complessi in body

Poiché `body` è una proprietà calcolata, può essere letta e ricalcolata molte volte.

Per esempio:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("numero: \(num)")
            Text("nome: \(name)")
        }
    }
}
```

Quando `name` cambia, SwiftUI ricalcola `body`.

In quel momento anche il codice dentro `body` viene eseguito di nuovo, e anche `num` viene ricreato.

```swift
let num = 10
```

Il `num` in questo esempio è molto semplice, quindi l'impatto non è grande.

Ma se in `body` vengono eseguiti calcoli complessi, come filtrare molti dati, ordinare, elaborare immagini e così via, ciò può influire sulla fluidità dell'interfaccia.

Quindi in SwiftUI `body` dovrebbe occuparsi principalmente di descrivere la struttura dell'interfaccia.

Dati temporanei semplici possono essere scritti dentro `body`.

I calcoli complessi possono essere messi in proprietà calcolate fuori da `body`, in metodi o in un'elaborazione dati separata.

## Esempio: quantità e prezzo totale

Ora capiremo le proprietà calcolate con un semplice esempio.

Supponiamo che il prezzo unitario di una carota sia 2 $, che l'utente possa toccare pulsanti per cambiare la quantità acquistata e che l'interfaccia debba mostrare il prezzo totale.

Il modo per calcolare il prezzo totale:

```
quantità * prezzo unitario
```

Se usiamo una variabile ordinaria per memorizzare il prezzo totale, diventa un po' scomodo.

Perché ogni volta che la quantità cambia, dobbiamo aggiornare manualmente il prezzo totale.

Un modo migliore è usare una proprietà calcolata:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("prezzo: \(price) $")
                Text("quantità: \(count)")
                Text("prezzo totale: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Risultato visualizzato:

![view](../../Resource/024_view.png)

In questo esempio:

```swift
@State private var count = 1
```

`count` rappresenta la quantità di carote. Quando il pulsante viene toccato, `count` cambia.

```swift
private let price = 2
```

`price` rappresenta il prezzo unitario della carota. Qui è un valore fisso, quindi si usa `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` rappresenta il prezzo totale.

Non deve essere memorizzato separatamente, perché il prezzo totale può sempre essere calcolato con `count * price`.

Quando `count` è `1`:

```swift
totalPrice = 1 * 2
```

Il risultato mostrato è:

```swift
prezzo totale: 2 $
```

Dopo aver toccato il pulsante `+`, `count` diventa `2`.

In quel momento, quando `totalPrice` viene letto di nuovo, verrà ricalcolato:

```swift
totalPrice = 2 * 2
```

Il risultato mostrato è:

```swift
prezzo totale: 4 $
```

Questo è il ruolo di una proprietà calcolata: calcolare dinamicamente un nuovo risultato da dati esistenti.

## Le proprietà calcolate possono essere usate per controlli

Le proprietà calcolate non possono solo calcolare valori numerici, ma possono anche restituire risultati di controllo.

Per esempio, quando vogliamo che la quantità minima sia 1.

Quando la quantità è già 1, il pulsante `-` non dovrebbe continuare a diminuire.

Possiamo aggiungere una proprietà calcolata:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Codice completo:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("prezzo: \(price) $")
                Text("quantità: \(count)")
                Text("prezzo totale: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Risultato visualizzato:

![view](../../Resource/024_view1.png)

Qui:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Questo codice indica se al momento è possibile diminuire.

Quando `count` è maggiore di `1`:

```swift
canDecrease == true
```

significa che si può diminuire.

Quando `count` è uguale a `1`:

```swift
canDecrease == false
```

significa che non si può continuare a diminuire.

### Controllo condizionale nel pulsante

Nel pulsante si usa:

```swift
if canDecrease {
    count -= 1
}
```

Solo quando `canDecrease` viene valutato come `true`, `count` può essere diminuito.

### Controllare il colore di primo piano della vista

Possiamo anche usare `canDecrease` per controllare il colore di primo piano del pulsante:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Qui viene usato l'operatore ternario:

```swift
canDecrease ? Color.primary : Color.gray
```

Il significato di questo codice è: se `canDecrease` è `true`, usa `Color.primary` come colore di primo piano; se `canDecrease` è `false`, usa `Color.gray`.

`Color.primary` è un colore semantico di sistema fornito da SwiftUI. Rappresenta il colore principale del testo nell'interfaccia corrente.

In modalità chiara, `Color.primary` è di solito vicino al nero; in modalità scura, `Color.primary` è di solito vicino al bianco.

Quindi il vantaggio di usare `Color.primary` è che si adatta automaticamente alla modalità chiara e scura.

### Controllare lo stato disabilitato della vista

`disabled` viene usato per controllare se una vista è in stato disabilitato:

```swift
.disabled(!canDecrease)
```

Quando `disabled` è `false`, la vista può essere toccata.

Quando `disabled` è `true`, la vista è disabilitata e non può essere toccata.

Usare `canDecrease` come condizione qui rende il codice più facile da capire.

Quando vediamo `canDecrease`, sappiamo che significa "se al momento si può continuare a diminuire".

### Nota aggiuntiva: perché ci sono due controlli?

Nel pulsante `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Qui viene usato sia `.disabled(!canDecrease)`, sia `if canDecrease` dentro il pulsante.

`.disabled(!canDecrease)` ha il compito di disabilitare il pulsante nell'interfaccia, così l'utente non può toccarlo.

`if canDecrease` ha il compito di controllare di nuovo prima che il codice venga eseguito. Esegue `count -= 1` solo quando la diminuzione è consentita.

Questa è una doppia protezione. Nello sviluppo reale, se il pulsante è già disabilitato, il controllo interno può essere omesso. Ma in un esempio didattico lo manteniamo, così il ruolo di `canDecrease` è più chiaro.

## Riepilogo

In questa lezione abbiamo imparato principalmente le proprietà calcolate.

Una proprietà calcolata non memorizza direttamente un valore. Invece, quando viene letta, calcola un risultato da dati esistenti.

Per esempio:

```swift
var c: Int {
    a + b
}
```

Qui `c` non deve essere memorizzata separatamente, perché può essere calcolata tramite `a + b`.

Una proprietà calcolata deve essere dichiarata con `var` e deve indicare un tipo restituito.

```swift
var canDecrease: Bool {
    count > 1
}
```

Le proprietà calcolate possono restituire non solo valori numerici, ma anche risultati di controllo, contenuto testuale e persino contenuto di viste SwiftUI.

In questa lezione abbiamo anche imparato `return`.

`return` significa restituire un risultato:

```swift
var totalPriceText: String {
    let total = count * price
    return "Totale: \(total) $"
}
```

Se una proprietà calcolata contiene una sola espressione che produce direttamente un risultato, `return` può essere omesso.

```swift
var totalPrice: Int {
    count * price
}
```

Inoltre, abbiamo conosciuto anche `Color.primary` e `disabled`.

`Color.primary` è un colore semantico di sistema di SwiftUI. Regola automaticamente la visualizzazione in base alla modalità chiara e scura.

```swift
.foregroundStyle(Color.primary)
```

`disabled` viene usato per controllare se una vista è disabilitata.

```swift
.disabled(true)
```

Significa disabilitata, non può essere toccata.

```swift
.disabled(false)
```

Significa disponibile, può essere toccata.

Perciò le proprietà calcolate sono molto comuni in SwiftUI. Possono aiutarci a organizzare più chiaramente risultati di calcolo, condizioni di controllo e contenuti visualizzati.
