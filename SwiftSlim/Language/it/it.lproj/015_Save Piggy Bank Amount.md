# Salvare l'importo del salvadanaio

Nella lezione precedente abbiamo realizzato un semplice "salvadanaio". In questa lezione impareremo come salvare in modo persistente l'importo del "salvadanaio".

In questa lezione studieremo principalmente `UserDefaults` e il property wrapper `@AppStorage`, e inoltre approfondiremo il ruolo di `onAppear` e il modo di usare i tipi opzionali (`nil`).

È importante notare che questa lezione continua a usare il codice del "salvadanaio" sviluppato nella lezione precedente.

## Problema del salvataggio persistente

Adesso l'interfaccia del "salvadanaio" è molto semplice e anche molto comoda da usare.

![Piggy Bank](../../Resource/014_view.png)

Tuttavia, c'è un problema evidente: ogni volta che la vista viene aggiornata oppure l'app viene chiusa, l'importo totale del "salvadanaio" torna sempre a 0, e tutto l'importo totale precedente va perso.

Questo significa che i dati non sono stati davvero salvati; in altre parole, l'attuale "salvadanaio" può salvare solo dati temporanei.

### Perché non può essere salvato in modo persistente?

Questo accade perché abbiamo dichiarato la variabile con `@State`:

```swift
@State private var amount = 0
```

La vita della variabile dichiarata con `@State` dipende completamente dalla vista.

Quando la vista viene creata, `amount` viene inizializzato a 0; quando la vista viene distrutta, anche `amount` viene distrutto.

I dati salvati qui in `amount` esistono solo in memoria e non vengono salvati sul dispositivo.

Noi non vogliamo che `amount` sia legato al ciclo di vita della vista, quindi dobbiamo realizzare un salvataggio persistente dei dati. In altre parole, dobbiamo salvare i dati sul dispositivo.

### Che cosa significa "persistenza dei dati"

La persistenza dei dati può essere intesa come salvare i dati dalla "memoria temporanea" allo "storage del dispositivo".

Quando la vista viene chiusa o l'app viene chiusa, i dati non andranno persi.

Nello sviluppo Swift, per una semplice "persistenza dei dati" si può usare `UserDefaults`; per dati più complessi servono `SwiftData` o `CoreData`.

In questa lezione, studieremo prima il più semplice, `UserDefaults`.

## UserDefaults

`UserDefaults` viene usato per salvare dati leggeri in formato chiave-valore, e viene spesso usato per memorizzare tipi di base come `String`, `Int`, `Double`, `Bool`.

### Salvare dati

`UserDefaults` usa il metodo `set` per salvare dati:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Il primo parametro di `UserDefaults` rappresenta il dato da salvare; qui vengono passati dati di tipo `String`, `Int` e così via.

Il secondo parametro `forKey` funziona in modo simile al nome di una variabile e serve a identificare il dato salvato da `UserDefaults`.

### Leggere dati

`UserDefaults` usa metodi corrispondenti per leggere i dati:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Durante la lettura bisogna usare il metodo del tipo corrispondente, altrimenti possono verificarsi errori o dati non corretti.

### Note importanti su UserDefaults

#### 1. Restituisce tipi opzionali

Quando si leggono dati con `UserDefaults`, alcuni metodi restituiscono tipi opzionali (`Optional`).

Per esempio:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Il tipo restituito di `name` è:

```swift
String?
```

Questo significa che può esserci un valore oppure no.

**Perché restituisce un tipo opzionale?**

Perché una certa `Key` in `UserDefaults` non ha necessariamente dati corrispondenti.

Per esempio:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Se in precedenza non è mai stato salvato il valore relativo alla chiave `"City"`, allora il risultato della lettura sarà:

```swift
nil
```

È importante sottolineare che `nil` significa assenza di dati, e non una stringa vuota.

Nella lezione sul "sistema dei tipi" abbiamo già incontrato un problema simile: quando una conversione di tipo fallisce, viene restituito un tipo opzionale.

In questo caso, dobbiamo usare `??` per fornire un valore predefinito e fare unwrapping:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Se `UserDefaults` legge un dato, userà il valore letto; se non riesce a leggerlo (`nil`), userà il valore predefinito.

#### 2. Restituisce tipi non opzionali

Quando `UserDefaults` legge tipi `Int`, `Double`, `Bool`, restituisce tipi non opzionali.

Per esempio:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Anche se per queste chiavi non è mai stato salvato alcun dato, il valore restituito non sarà `nil`.

Verrà invece restituito un valore predefinito:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Limite della quantità di dati

`UserDefaults` è adatto solo a salvare una piccola quantità di dati, per esempio configurazioni dell'app e semplici stati.

Nella pratica, non è adatto a salvare grandi quantità di dati o dati soggetti a letture e scritture frequenti.

## Salvare l'importo del "salvadanaio"

Adesso possiamo usare `UserDefaults` per realizzare la logica di salvataggio dell'importo totale del "salvadanaio".

Quando l'utente tocca il pulsante, l'importo inserito viene sommato al totale e il totale viene salvato in `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Adesso abbiamo realizzato la logica di scrittura dei dati.

## Spiegazione della logica di persistenza dei dati

Anche se abbiamo completato la logica di scrittura della persistenza dei dati, durante l'esecuzione reale noteremo che ogni volta che la vista viene aggiornata o l'app viene riaperta, la variabile `amount` continua comunque a essere 0.

Questo perché:

```swift
@State private var amount = 0
```

In SwiftUI, quando la vista viene creata, una variabile `@State` viene inizializzata di nuovo.

Anche se il valore di `amount` è stato salvato in `UserDefaults`, quando la vista viene ricaricata `amount` verrà comunque reimpostato a 0.

Questo dimostra che al momento i dati vengono soltanto salvati in `UserDefaults`, ma non vengono ripristinati nella vista.

Perciò, quando la vista viene caricata, dobbiamo anche leggere manualmente i dati da `UserDefaults` e riassegnarli ad `amount`, così da completare l'intera logica della persistenza dei dati.

### Analogia della logica

Possiamo capire questo processo come una "lavagna in aula":

durante la lezione, l'insegnante scrive il contenuto sulla lavagna; questo contenuto è simile allo stato della vista corrente (`@State`).

Quando la lezione finisce, la lavagna viene cancellata per preparare la lezione successiva. Questo corrisponde alla distruzione della vista, e anche i dati in `@State` vengono cancellati.

Per evitare di perdere il contenuto dell'insegnamento, l'insegnante salva il contenuto nelle dispense. Quelle dispense corrispondono ai dati salvati in `UserDefaults`.

Quando la lezione ricomincia la volta successiva, la lavagna è di nuovo vuota all'inizio (`@State` viene inizializzato), e l'insegnante deve riscrivere sulla lavagna il contenuto precedente basandosi sulle dispense (leggendo `UserDefaults`).

È importante capire che la lavagna non ripristina automaticamente il contenuto precedente: bisogna riscriverlo leggendo le dispense (`UserDefaults`).

## Usare onAppear per leggere i dati

Quando la vista viene mostrata, bisogna leggere manualmente il valore in `UserDefaults` e assegnarlo alla variabile `amount` di `@State`, così da realizzare davvero la persistenza dei dati.

In SwiftUI, si può usare `onAppear` per eseguire logiche di inizializzazione quando la vista viene mostrata:

```swift
.onAppear {}
```

Mettiamo il codice di lettura di `UserDefaults` dentro `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Quando la vista viene creata, `amount` viene inizializzato a 0; quando la vista viene mostrata, si attiva `onAppear`, legge il valore da `UserDefaults` e lo riassegna ad `amount`. In questo modo la vista può mostrare l'ultimo importo totale salvato.

Adesso l'intera logica di persistenza dei dati del "salvadanaio" è completata.

## Codice completo

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Property wrapper @AppStorage

SwiftUI fornisce il property wrapper `@AppStorage`, che può semplificare la logica di salvataggio di `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` è un incapsulamento di `UserDefaults`, e `"amount"` corrisponde alla `Key` di `UserDefaults`.

Quando la vista viene creata, leggerà i dati da `UserDefaults`; quando la variabile cambia, scriverà automaticamente in `UserDefaults`.

Supporta anche il meccanismo di aggiornamento dello stato di SwiftUI: come `@State`, quando cambia aggiorna la vista SwiftUI.

In altre parole, `@AppStorage` può realizzare sia la logica di lettura sia quella di salvataggio dei dati: non c'è più bisogno di chiamare manualmente `UserDefaults`, né di usare `onAppear` per leggere i dati.

Perciò possiamo usare `@AppStorage` per sostituire `UserDefaults` nel codice:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Riepilogo

In questa lezione abbiamo studiato soprattutto i seguenti punti:

Per prima cosa, `UserDefaults` viene usato per salvare dati leggeri; noi abbiamo usato `UserDefaults` per salvare l'importo totale sul dispositivo. `UserDefaults` offre metodi di lettura e scrittura, e bisogna anche gestire situazioni come i tipi opzionali.

In secondo luogo, le variabili `@State` servono solo a gestire lo stato temporaneo nella vista, e il loro ciclo di vita coincide con quello della vista. Quando la vista viene ricreata, anche `@State` viene re-inizializzato.

Durante il ripristino dei dati da `UserDefaults`, abbiamo imparato a usare `onAppear` per leggere `UserDefaults` quando la vista viene mostrata e completare così il recupero dei dati.

Infine, abbiamo sostituito `UserDefaults` con `@AppStorage`, così da leggere automaticamente i dati al caricamento della vista e scriverli automaticamente quando i dati cambiano, sostituendo la logica manuale basata su `UserDefaults` e `onAppear`.

Attraverso queste conoscenze, possiamo realizzare una funzione base di archiviazione dati per l'app, così che i dati possano essere salvati in modo persistente.

## Esercizi dopo la lezione

Adesso il "salvadanaio" supporta il salvataggio dell'importo, ma la funzione è ancora incompleta.

1. Quando l'utente ha bisogno di prelevare denaro, bisogna progettare la logica corrispondente al prelievo.
2. Quando l'utente vuole azzerare l'importo, bisogna anche realizzare una logica di reset.
3. Se si vuole aggiungere un nome al salvadanaio, bisogna introdurre anche il salvataggio di dati di tipo `String`.

Puoi completare queste funzioni sulla base di quanto c'è già, rendendo il "salvadanaio" più completo.

## Conoscenza estesa - Problema del valore predefinito del campo di input

Adesso possiamo anche ottimizzare ulteriormente l'interazione del campo di input, rendendo l'operazione di inserimento più comoda.

![textfield](../../Resource/015_view.png)

Nell'implementazione attuale, il valore predefinito del campo di input è 0. Ogni volta che l'utente inserisce un importo, deve prima cancellare lo 0 e poi inserire il nuovo valore: questa esperienza d'uso non è ragionevole.

Dovremmo fare in modo che il valore iniziale del campo di input sia vuoto, e non 0.

Questo accade perché `TextField` e `number` sono legati in modo bidirezionale:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Quando `number` viene inizializzato a 0, anche il campo di input mostra 0.

Perciò, dobbiamo cambiare `number` in un valore vuoto, cioè `nil`.

```swift
@State private var number = nil
```

A questo punto apparirà un errore:

```
Generic parameter 'Value' could not be inferred
```

Questa è proprio la situazione di cui abbiamo parlato nella lezione sul "sistema dei tipi": quando il tipo di una variabile non può essere dedotto automaticamente, bisogna dichiararlo esplicitamente.

Poiché qui impostiamo `number` a `nil`, e `nil` di per sé non contiene alcuna informazione di tipo, il compilatore non riesce a stabilire se quella variabile sia `String`, `Int` o qualcos'altro, e quindi segnala un errore.

Perciò dobbiamo dichiarare esplicitamente il tipo di `number`:

```swift
@State private var number:Int? = nil
```

Qui `Int?` indica un tipo opzionale (`Optional`), cioè il valore di `number` può essere un `Int` oppure `nil`.

In questo modo, inizializzandolo a `nil`, il campo di input verrà mostrato vuoto e non con 0.

### Unwrapping del tipo opzionale

Quando trasformiamo `number` in un tipo opzionale, il codice di calcolo originale produrrà un errore:

```swift
amount += number
```

Messaggio:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Questo accade perché adesso `number` può essere `nil`. Se partecipa direttamente al calcolo, diventa qualcosa del tipo:

```swift
amount += nil
```

È evidente che `nil` non può essere sommato ad `amount`: si tratta di un'operazione non valida.

Perciò, quando un tipo opzionale partecipa a un calcolo, bisogna prima fare unwrapping.

Qui possiamo usare `??` per fornire un valore predefinito:

```swift
amount += number ?? 0
```

Quando `number` è `nil`, usa il valore predefinito 0; quando `number` ha un valore, usa il dato reale inserito.

In questo modo non solo si garantisce la correttezza del calcolo, ma si ottiene anche l'effetto di avere il campo di input inizialmente vuoto, così l'utente non deve più cancellare manualmente lo 0.

## Codice esteso

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
