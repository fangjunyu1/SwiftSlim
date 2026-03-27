# Salvadanaio

In questa lezione svilupperemo un semplice progetto "salvadanaio". La funzione è semplice ma contiene una logica di interazione completa, quindi è molto adatta ai principianti.

Attraverso questo progetto impareremo `TextField` (campo di input), `border` (bordo) e capiremo anche il data binding (`$`).

L'obiettivo finale è realizzare un progetto "salvadanaio" in cui si possa inserire un importo, toccare un pulsante per salvarlo e accumulare automaticamente l'importo totale.

Effetto finale:

![Piggy Bank](../../RESOURCE/014_view.png)

## Mostrare l'importo totale

Per prima cosa, dobbiamo mostrare nella vista l'importo totale del "salvadanaio".

In `ContentView`, dichiariamo una variabile per salvare l'importo totale del "salvadanaio".

```swift
@State private var amount = 0
```

Poi usiamo `Text` per mostrare questo importo:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Qui usiamo `.font` e `.fontWeight` per impostare la dimensione e il peso del carattere.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Quando `amount` cambia, anche l'importo totale mostrato da `Text` si aggiornerà automaticamente.

## Inserire l'importo

Oltre a mostrare l'importo totale, il "salvadanaio" deve anche permettere all'utente di "inserire" l'importo da depositare o prelevare. Per questo dobbiamo usare il controllo di vista `TextField` di SwiftUI.

### TextField

`TextField` è il controllo di vista di SwiftUI usato per inserire contenuti, di solito per input su una sola riga.

`TextField` offre principalmente due formati di binding:

**1. Binding di tipo stringa (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Adatto a contenuti testuali come nomi, titoli e simili.

**2. Binding di tipo numerico (`Int/Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Adatto a numeri come età, stipendio, importi ecc.

`format: .number` indica che questo campo di input analizzerà e mostrerà il contenuto in formato numerico.

#### Placeholder di testo

Il primo parametro di `TextField` è il placeholder, usato per suggerire all'utente cosa inserire:

```swift
TextField("input your name", text: $text)
```

Quando il campo di input è vuoto, mostrerà un testo grigio di suggerimento.

![textfield](../../RESOURCE/014_textfield.png)

#### Data binding

`TextField` non è responsabile del salvataggio persistente del contenuto inserito; serve una variabile collegata per gestire i dati.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Il contenuto inserito dall'utente verrà salvato direttamente nella variabile `text`, mentre `TextField` si occupa solo dell'interfaccia di input.

`$` indica il binding (`Binding`):

```swift
$text
```

Questa non è una variabile normale, ma un valore di tipo `Binding`.

La sua funzione è stabilire un collegamento tra la vista e i dati:

quando l'utente inserisce contenuto in `TextField`, `text` si aggiorna automaticamente; quando `text` cambia, anche `TextField` si aggiorna in modo sincronizzato.

Per esempio:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Quando si inserisce del contenuto nel `TextField`, il `Text` sopra verrà aggiornato in tempo reale.

![textField](../../RESOURCE/014_textfield1.png)

### Binding di tipo numerico

Quando bisogna inserire numeri, serve una variabile del tipo corrispondente:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Quando l'utente inserisce un importo, `TextField` analizzerà il contenuto inserito e aggiornerà automaticamente il valore di `number`.

## Aggiungere il campo di input

Dopo aver capito l'uso di base di `TextField`, applichiamolo al progetto "salvadanaio".

Il "salvadanaio" deve ricevere un "importo", quindi usiamo il modo "binding di tipo numerico (`Int/Double`)" e aggiungiamo una variabile `number` per salvare l'importo inserito dall'utente:

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
		}
    }
}
```

Adesso `TextField` mostrerà di default il valore di `number` (che per default è 0).

Quando il contenuto viene cancellato, verrà mostrato il placeholder "Amount".

Questo dimostra ancora una volta che `TextField` mostra il valore della variabile legata, e non salva il contenuto da solo.

### Problema della dimensione del campo di input

Nella vista corrente, noteremo che `TextField` non ha bordo, mostra solo uno 0 e il contenuto appare allineato a sinistra.

L'effetto è il seguente:

![textfield](../../RESOURCE/014_textfield2.png)

Questo accade perché `TextField` occupa per default tutta la larghezza della vista padre.

Possiamo verificarlo aggiungendo un colore di sfondo:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

L'effetto è questo:

![textfield](../../RESOURCE/014_textfield3.png)

Si può vedere che `TextField` in realtà riempie l'intera larghezza della riga.

### Impostare una larghezza fissa

Se vogliamo che il campo di input sia più compatto, possiamo usare `frame` per limitarne la larghezza:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

L'effetto è il seguente:

![textfield](../../RESOURCE/014_textfield4.png)

### Aggiungere bordo e padding interno

Poiché `TextField` non ha un bordo predefinito, possiamo aggiungere manualmente uno stile:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Adesso questo campo di input assomiglia di più a un "campo di input standard".

![textfield](../../RESOURCE/014_textfield5.png)

## Bordo

In SwiftUI, `border` viene usato per aggiungere un bordo a una vista.

Uso di base:

```swift
border(Color.black, width: 1)
```

Qui `Color.black` indica il colore del bordo, mentre `width` ne indica lo spessore.

Nel `TextField`, usiamo:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Questo significa aggiungere al campo di input un bordo nero con spessore di 1 pt.

Si possono anche provare altri colori, per esempio `Color.blue`, `Color.green`, oppure aumentare lo spessore del bordo con `width:2`.

## Pulsante di salvataggio

Ora abbiamo una variabile `amount` per mostrare l'importo totale, un `TextField` per l'inserimento dell'importo e una variabile `number` collegata al campo di input.

Il codice attuale è il seguente:

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
		}
    }
}
```

### Aggiungere un pulsante

Adesso dobbiamo aggiungere un pulsante per attivare l'operazione di salvataggio dell'importo.

```swift
Button("Save") {
    
}
```

### Realizzare la logica del salvataggio

Vogliamo che l'utente inserisca un importo e, toccando il pulsante, questo venga automaticamente accumulato nel totale.


```swift
Button("Save") {
    amount += number
}
```

Qui usiamo l'operatore di assegnazione composta per sommare l'importo inserito dall'utente `number` al totale `amount`.

### Reimpostare l'importo inserito

Adesso c'è un problema: ogni volta che si tocca il pulsante, l'importo nel campo di input non viene cancellato.

Se l'utente inserisce 10 e poi tocca Salva, il campo di input continuerà a mostrare 10, e questo influenzerà l'importo del salvataggio successivo.

Questo accade perché `TextField` è legato a `number`: quando tocchiamo il pulsante, modifichiamo solo `amount`, mentre `number` non cambia, quindi il campo continua a mostrare il vecchio valore.

Dobbiamo aggiungere una logica di pulizia: dopo aver toccato il pulsante, prima accumuliamo l'importo, poi reimpostiamo l'importo inserito:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Adesso, quando l'utente inserisce un importo e tocca il pulsante, l'importo verrà aggiunto al totale. `number` verrà reimpostato a 0, facilitando l'inserimento successivo.

Abbiamo così completato tutta la logica di salvataggio del "salvadanaio".

## Ottimizzare la vista

Dopo aver completato la funzione, possiamo eseguire una semplice ottimizzazione dell'interfaccia aggiungendo un'immagine di sfondo e uno stile al pulsante.

Aggiungere lo stile del pulsante:

```swift
.buttonStyle(.borderedProminent)
```

Aggiungere l'immagine di sfondo:

```swift
.background {
    Image("1")
}
```

Adesso abbiamo completato lo sviluppo dell'intero "salvadanaio".

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Effetto finale:

![Piggy Bank](../../RESOURCE/014_view.png)

Ora possiamo provare a depositare 100 o anche più soldi, per controllare se la logica del "salvadanaio" presenta problemi.

Oppure possiamo eseguire il "salvadanaio" nel simulatore o su un dispositivo fisico, per provare direttamente l'app che abbiamo sviluppato.

### Output di debug

Per verificare se la logica è corretta, possiamo anche aggiungere una logica di debug nel pulsante, così da verificare se l'importo inserito è corretto:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Ogni volta che si deposita denaro e si tocca il pulsante, possiamo vedere il corrispondente output di debug per verificare se nella logica del codice ci sono problemi.

```
---Saving---
amount:11
number:0
```
