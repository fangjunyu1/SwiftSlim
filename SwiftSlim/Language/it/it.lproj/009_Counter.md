# Contatore

Nelle due lezioni precedenti abbiamo studiato variabili, costanti, pulsanti e metodi.

In questa lezione uniremo queste conoscenze per realizzare una semplice app contatore.

In questo esempio impareremo come salvare e modificare le variabili e come usare `@State` per gestirle.

## Realizzare un contatore

Un contatore viene spesso usato per registrare quantità che devono aumentare continuamente. Per esempio, il numero di salti con la corda, il numero di giri di corsa e altri scenari di conteggio.

Ora realizziamo un contatore semplice: mostriamo un numero e un pulsante, e quando il pulsante viene toccato il numero aumenta.

![Num](../../RESOURCE/009_num.png)

### Mostrare il numero

Per prima cosa, usiamo `Text` per mostrare il numero.

```swift
Text("0")
```

Tuttavia, se il numero deve cambiare, non possiamo lasciare fisso `"0"`, ma dobbiamo usare una variabile per salvarlo.

```swift
var num = 0
```

Poi mostriamo la variabile dentro `Text`:

```swift
Text("\(num)")
```

Qui viene usata l'interpolazione di stringa `\()` per convertire il numero in stringa e mostrarlo.

### Il pulsante aumenta il numero

Successivamente aggiungiamo un pulsante.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Quando il pulsante viene toccato, vogliamo che il numero aumenti.

Perciò possiamo modificare la variabile dentro il pulsante:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Questo codice significa: quando si tocca il pulsante, si calcola `num + 1` e il risultato viene assegnato a `num`.

### Una scrittura più concisa

Swift offre un modo più conciso di scriverlo:

```swift
num += 1
```

Equivale a:

```swift
num = num + 1
```

Questa scrittura si chiama "operatore di assegnazione composta".

Gli operatori di assegnazione composta più comuni in Swift sono:

```
+=   assegnazione con addizione
-=   assegnazione con sottrazione
*=   assegnazione con moltiplicazione
/=   assegnazione con divisione
%=   assegnazione con resto
```

Per esempio:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Codice completo

Ora possiamo scrivere un semplice contatore:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Tuttavia, in questo momento il codice non può funzionare correttamente.

### Compare un errore

Xcode mostrerà:

```
Cannot assign to property: 'self' is immutable
```

Significa che la proprietà non può essere modificata, perché la vista è immutabile.

Perché succede?

## Come funziona SwiftUI

In SwiftUI: **l'interfaccia è guidata dai dati**, il che significa che quando i dati cambiano, l'interfaccia si aggiorna automaticamente.

Ma c'è un punto importante: SwiftUI monitora il cambiamento e aggiorna la vista solo quando cambia uno stato (come `@State`, `@Binding`).

Se usiamo una variabile normale, SwiftUI leggerà il suo valore solo una volta quando la vista viene creata; anche se la variabile cambia in seguito, l'interfaccia non si aggiornerà.

Per esempio:

```swift
var num = 0   // 0
num = 1   // 0
```

Nell'esempio sopra, `num` è una variabile normale. Anche se il suo valore è cambiato, SwiftUI non aggiornerà la vista e l'interfaccia continuerà a mostrare il valore iniziale 0.

![Num](../../RESOURCE/009_state.png)

Perciò, solo quando i dati vengono contrassegnati come stato (per esempio usando wrapper di proprietà come `@State`, `@Binding`), SwiftUI ne monitorerà automaticamente i cambiamenti e aggiornerà la vista.

## Property wrapper @State

In SwiftUI, se hai bisogno di modificare una variabile e aggiornare la vista, devi usare `@State`.

```swift
@State var num = 0
```

`@State` fa sì che SwiftUI osservi questa variabile.

Quando la variabile cambia, SwiftUI ricalcolerà la vista e la aggiornerà.

Codice completo:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Adesso, quando si tocca il pulsante:

```swift
num += 1
```

SwiftUI rileverà il cambiamento di `num` e aggiornerà automaticamente la vista.

![Num](../../RESOURCE/009_state1.png)

## Regole d'uso di @State

Nello sviluppo reale, `@State` segue di solito due regole.

### 1. @State di solito usa private

Le variabili `@State` vengono normalmente usate solo nel tipo corrente (per esempio, nella struttura `View` corrente), perciò di solito si scrivono così:

```swift
@State private var num = 0
```

In questo modo si evita che altre viste accedano o modifichino direttamente questa variabile.

Non abbiamo ancora studiato `private`; per ora puoi intenderlo in modo semplice così:

**Il contenuto modificato con `private` può essere usato solo nella vista corrente, mentre le viste esterne non possono usarlo.**

### 2. @State si usa solo per lo stato della vista corrente

`@State` è adatto ai dati gestiti dalla View corrente stessa.

Per esempio, contenuto di un campo di input, stato di un interruttore.

```swift
@State private var isOn = false
@State private var text = ""
```

Se i dati devono essere condivisi tra più viste, sarà necessario usare altri tipi di stato, per esempio `@Binding` o `@Observable`.

Questi contenuti verranno studiati nelle lezioni successive.

### Pulsante di diminuzione

Oltre ad aumentare, il contatore può anche diminuire.

Possiamo aggiungere un pulsante `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Poi usiamo `HStack` per disporre i pulsanti in orizzontale:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Effetto:

![Num](../../RESOURCE/009_num1.png)

Quando si tocca il pulsante `+`, il numero aumenta di 1; quando si tocca il pulsante `-`, il numero diminuisce di 1.

### Pulsante di reset

Possiamo anche aggiungere un pulsante di reset, per riportare il numero a 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Quando si tocca il pulsante di reset, a `num` viene assegnato il valore 0.

Effetto:

![Num](../../RESOURCE/009_num2.png)

Quando si tocca il pulsante `0`, il numero torna a 0.

### Pulsanti personalizzati

Al momento i nostri pulsanti possono mostrare solo testo:

```swift
Button("+") {

}
```

Questo tipo di scrittura può mostrare soltanto contenuti testuali, come `+` o `-`.

Nello sviluppo reale, però, spesso vogliamo che l'aspetto dei pulsanti sia più ricco, per esempio usando icone o altre viste.

SwiftUI permette di personalizzare il contenuto mostrato dal pulsante; in questo caso si può usare un'altra forma di scrittura:

```swift
Button(action: {

}, label: {

})
```

In questa scrittura, `action` indica il codice eseguito quando il pulsante viene toccato, mentre `label` indica la vista mostrata dal pulsante.

Per esempio, possiamo far sì che il pulsante mostri un'icona SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

In questo modo il pulsante non mostrerà più testo, ma un'icona.

### Ottimizzare l'interfaccia del contatore

Per rendere l'interfaccia del contatore più chiara, possiamo anche regolare lo stile di visualizzazione del numero. Per esempio, ingrandire il numero:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Successivamente, cambiamo anche il contenuto dei pulsanti in icone e aumentiamo opportunamente le dimensioni delle icone:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Allo stesso modo, possiamo trasformare anche il pulsante di diminuzione e quello di reset in pulsanti con icona:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Adesso i pulsanti mostrano icone SF Symbols e l'interfaccia risulterà più intuitiva.

![Num](../../RESOURCE/009_num3.png)

## Riepilogo

In questa lezione, attraverso la realizzazione di un semplice contatore, abbiamo esercitato in modo integrato l'uso di variabili, `Text` e `Button`. Abbiamo usato una variabile per salvare il numero e usato i pulsanti per controllarne l'aumento e la diminuzione, imparando anche gli operatori di assegnazione composta, come `num += 1` e `num -= 1`.

Durante l'implementazione abbiamo compreso il modo di lavorare di SwiftUI: l'interfaccia è guidata dai dati. Solo quando i dati cambiano, l'interfaccia si aggiorna. Per questo bisogna usare `@State` per salvare uno stato modificabile; quando una variabile `@State` cambia, SwiftUI aggiorna automaticamente la vista.

Infine, abbiamo eseguito una semplice ottimizzazione dell'interfaccia, regolando lo stile del carattere di `Text` e usando `Button(action:label:)` per personalizzare il contenuto del pulsante, così che il pulsante possa mostrare icone, rendendo il contatore più chiaro e gradevole.

Ora abbiamo già iniziato a entrare in contatto con l'uso di base delle viste SwiftUI. In SwiftUI, la maggior parte delle interfacce è guidata dalle variabili. Quando le variabili cambiano, SwiftUI aggiorna automaticamente la vista. Perciò, nello sviluppo di applicazioni SwiftUI, di solito dobbiamo prima progettare bene i dati da salvare, e poi usare questi dati per costruire l'interfaccia e la logica di interazione.

## Codice completo

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
