# Cicli ed elenchi

In questa lezione impareremo il ciclo `for` in Swift e `ForEach` in SwiftUI.

Entrambi possono aiutarci a leggere gli elementi di un array in ordine, uno per uno. Nello sviluppo reale, spesso abbiamo bisogno di prendere un gruppo di dati uno alla volta, per poi elaborarli o mostrarli, e i cicli sono proprio uno strumento importante per svolgere questo compito.

Quando navighiamo su pagine web o utilizziamo un’app, vediamo spesso molti elenchi o voci. Contenuti di questo tipo vengono di solito prima memorizzati in un `array`, poi letti uno per uno tramite un `ciclo`, e infine mostrati nell’interfaccia.

Per esempio, l’elenco dei risultati di ricerca di Google:

![Google](../../Resource/017_google.png)

Ogni voce nell’elenco dei risultati di ricerca corrisponde di solito a un dato, e viene mostrata una per una tramite un ciclo.

Per questo motivo, `array` e `cicli` compaiono spesso insieme. L’`array` serve a memorizzare un gruppo di dati, mentre il `ciclo` serve a prendere questi dati in ordine ed eseguire la stessa operazione su ciascuno di essi.

Ora iniziamo dal ciclo `for` più basilare.

## Conto alla rovescia

Supponiamo di voler simulare una funzione di conto alla rovescia e stampare in ordine `“5, 4, 3, 2, 1”`.

Il modo più diretto per scriverlo è:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Anche se questo modo può simulare il conto alla rovescia, se il contenuto è molto, risulterà molto ripetitivo e in seguito non sarà nemmeno comodo da modificare.

A questo punto, possiamo prima mettere i dati in un array e poi usare un ciclo `for` per stamparli uno per uno:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Questo modo di scrivere è più conciso ed è anche più facile da estendere. Anche se nel conto alla rovescia ci sono molti numeri, non dobbiamo scrivere `print` riga per riga: basta lasciare che il ciclo elabori automaticamente ogni elemento dell’array.

Possiamo inserire questo codice in un pulsante per provarlo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Quando si tocca il pulsante, il ciclo `for` prende ogni intero di `countDown` nell’ordine dell’array e lo stampa nella console.

Vediamo ora come funziona il ciclo `for`.

## Ciclo for

Il ciclo `for` serve per elaborare un gruppo di dati in ordine. Gli oggetti più comuni sono gli array e gli intervalli.

Forma base:

```swift
for elemento in arrayOIntervallo {
    codiceDaEseguire
}
```

Per esempio, il codice del conto alla rovescia di prima:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Qui `i` rappresenta l’elemento attualmente estratto, mentre dopo `in` c’è il dato da scorrere, cioè l’array `countDown`.

Il significato di questo codice è: il programma prenderà ogni elemento dell’array `countDown` in ordine. Ogni volta che prende un elemento, usa temporaneamente `i` per rappresentarlo, poi esegue il codice tra parentesi graffe.

Il processo di esecuzione può essere compreso così:

* Il primo elemento estratto è `5`, quindi in questo momento il valore di `i` è `5`
* Si esegue `print(i)` e viene stampato `5`
* Poi si continua estraendo l’elemento successivo `4`
* Si esegue di nuovo `print(i)` e viene stampato `4`

Anche `3`, `2` e `1` successivi verranno eseguiti uno per uno nello stesso modo.

![for](../../Resource/017_for.png)

Quando tutti gli elementi dell’array sono stati elaborati, il ciclo `for` termina automaticamente.

Possiamo usare il ciclo `for` per ottenere ogni elemento dell’array e realizzare funzioni come questo conto alla rovescia.

**Suggerimento**: `i` è un nome molto comune nei cicli for e viene usato per rappresentare l’elemento attualmente estratto, ma non è una forma fissa. Si possono usare anche altri nomi inglesi.

Per esempio, usare `num` per rappresentare ogni elemento estratto:

```swift
for num in countDown {
    print(num)
}
```

Anche all’interno delle parentesi graffe bisogna usare `num` per rappresentare l’elemento attualmente estratto.

### Ciclo su un intervallo

Il ciclo `for` non può solo scorrere gli array, ma anche gli intervalli.

Per esempio, quando dobbiamo calcolare la somma dei numeri interi positivi entro `50`, dobbiamo sommare uno per uno tutti gli interi da `1` a `50`.

Il modo più diretto potrebbe essere:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Il problema di questo modo è che dobbiamo scrivere ogni numero a mano. È scomodo e non adatto ai veri scenari di sviluppo.

A questo punto possiamo usare l’operatore di intervallo insieme al ciclo `for` per completare il compito.

Nella precedente lezione sugli “Operatori”, abbiamo già imparato l’operatore di intervallo:

```swift
1...3   // 1, 2, 3
```

Qui `...` rappresenta un intervallo chiuso, cioè include sia il punto iniziale sia quello finale.

Perciò qui possiamo usare un ciclo `for` sull’intervallo di interi da `1` a `50`:

```swift
for i in 1...50 {
    
}
```

Dobbiamo sommare questi interi, quindi ci serve anche una variabile per salvare il totale:

```swift
var count = 0
```

Poi, a ogni iterazione, aggiungiamo il numero attualmente estratto a `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Questo codice significa:

* `count` serve a salvare la somma attuale
* Il ciclo `for` estrae uno per uno gli interi da `1` a `50`
* Ogni volta che estrae un intero, esegue una volta `count += i`
* Quando il ciclo termina, `count` contiene il totale finale

In questo modo possiamo ottenere la somma di tutti gli interi positivi entro `50`.

Allo stesso modo, se vogliamo calcolare la somma degli interi da `1` a `100`, basta cambiare l’intervallo:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Il ciclo `for` non può solo scorrere gli array, ma anche un intervallo. Questa capacità di elaborare dati ripetutamente e in ordine è molto comune nello sviluppo.

Può aiutarci a gestire automaticamente molto lavoro ripetitivo, senza dover scrivere manualmente la somma di ogni numero o altre operazioni ripetitive simili.

## Cicli in SwiftUI

Il precedente ciclo `for` appartiene al linguaggio Swift.

Ma in SwiftUI non possiamo usare direttamente `for` dentro una struttura di view per generare view:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Questo perché dentro `VStack` servono view SwiftUI, mentre un normale ciclo `for` di per sé non è una view.

Se vogliamo generare ripetutamente l’interfaccia in SwiftUI in base al contenuto di un array, allora dobbiamo usare `ForEach`.

Per esempio, se vogliamo mostrare i nomi di tutti i membri di un gruppo, possiamo scrivere:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Risultato della visualizzazione:

![for1](../../Resource/017_for1.png)

Poi aggiungiamo gli stessi modificatori a ogni `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ora ogni `Text` viene mostrato con un font più piccolo e più spesso.

Risultato della visualizzazione:

![](../../Resource/017_for2.png)

Anche se i modificatori rendono l’interfaccia più bella, rendono anche il codice più lungo e ripetitivo.

Se i nomi continuano ad aumentare, oppure se più avanti vogliamo modificare in modo uniforme font, colore e altri stili, dovremo scrivere e modificare molte parti di codice uguali. Questo è piuttosto scomodo e poco facile da mantenere.

A questo punto possiamo prima mettere questi nomi in un array, poi usare `ForEach` in SwiftUI per generare ripetutamente view in base ai dati dell’array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Questo codice è più conciso. `ForEach` legge uno per uno gli elementi dell’array e mostra nell’interfaccia il contenuto corrispondente.

Quando in seguito aggiungeremo nuovi nomi, dovremo solo modificare i nomi nell’array `names`. Non servirà aggiungere ogni volta di nuovo `Text` e modificatori complessi.

## ForEach

`ForEach` è una struttura di SwiftUI usata per generare ripetutamente view. Puoi considerarla come una struttura in SwiftUI simile a un ciclo `for`.

Uso di base:

```swift
ForEach(array, id: \.self) { elemento in
    codice SwiftUI
}
```

Per esempio, i nomi del gruppo di prima:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Questo codice significa:

`names` è l’array su cui si sta iterando, cioè i dati da mostrare.

`id:\.self` significa usare l’elemento stesso dell’array per distinguere ogni elemento.

Nell’esempio attuale, l’array contiene stringhe:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Quindi SwiftUI userà direttamente le stringhe stesse, come "Sam", "John", "Wathon" e "Bob", per distinguere contenuti diversi.

Per gli array semplici più comuni nella fase iniziale, come `String` e `Int`, di solito possiamo prima scrivere:

```swift
id: \.self
```

Per ora ti basta ricordare questa sola forma. Non c’è bisogno di approfondire altre regole di `id`.

`item` in `item in` rappresenta l’elemento attualmente estratto.

Per esempio, alla prima iterazione `item` è `"Sam"`, e alla seconda iterazione `item` è `"John"`.

Perciò:

```swift
Text(item)
```

diventerà uno dopo l’altro:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Quindi, la funzione di questo codice è: prendere uno per uno ogni nome dall’array `names` e generare una view `Text` per ciascun nome.

### Processo di esecuzione

Il processo di esecuzione può essere compreso così:

* `ForEach` legge prima il primo elemento `"Sam"` dell’array `names`
* `item` rappresenta temporaneamente `"Sam"`
* `Text(item)` mostra `"Sam"`
* Poi continua leggendo l’elemento successivo `"John"`
* E ripete di nuovo lo stesso codice della view

Alla fine, tutti i nomi dell’array verranno mostrati.

Il vantaggio di scriverlo in questo modo è che, quando i nomi aumentano, non dobbiamo scrivere ripetutamente molti `Text`: dobbiamo solo modificare il contenuto dell’array.

### Ciclo sulle foto

`ForEach` non può mostrare solo testo, ma anche immagini, colori o altre view SwiftUI.

Per esempio, prepariamo 4 immagini:

```text
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Trascina queste quattro immagini nella cartella Assets di Xcode.

![image](../../Resource/017_for3.png)

Se non usiamo `ForEach`, dobbiamo scrivere ogni immagine manualmente:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Risultato della visualizzazione:

![image](../../Resource/017_for4.png)

Questo modo può funzionare, ma il codice diventa piuttosto lungo.

Se le immagini aumentano, dovremo scrivere sempre più codice `Image` in modo ripetitivo.

Se in seguito vogliamo modificare in modo uniforme la dimensione delle immagini, dovremo cambiarle una per una.

A questo punto possiamo mettere i nomi delle immagini in un array e poi usare `ForEach` per generare ripetutamente view immagine:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Qui `images` è un array di stringhe, e ogni elemento dell’array è il nome di un’immagine.

`ForEach(images, id: \.self)` significa leggere uno per uno gli elementi dell’array `images`, usare l’elemento stesso per distinguere ogni voce, e poi generare la view corrispondente in base all’elemento corrente.

Per esempio, se il primo elemento letto è `"430F9BEF"`, allora:

```swift
Image(item)
```

equivale a:

```swift
Image("430F9BEF")
```

Anche le immagini successive verranno mostrate una per una nello stesso modo.

![image](../../Resource/017_for4.png)

Qui continuiamo comunque a usare:

```swift
id: \.self
```

Il motivo è lo stesso di prima: poiché gli elementi dell’array `images` sono anch’essi semplici stringhe, nella fase iniziale possiamo usare direttamente l’elemento stesso come modo per distinguere ogni voce.

Puoi capirlo semplicemente come una formula fissa:

**Quando `ForEach` scorre un array semplice come `String` o `Int`, di solito si scrive `id: \.self`.**

### Aggiungere immagini

Se più avanti dobbiamo aggiungere immagini, basta modificare il contenuto dell’array:

```text
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Non è necessario scrivere di nuovo altro codice `Image`.

Se le immagini sono molte, si può usare insieme a `ScrollView`. Altrimenti, quando il contenuto supera lo schermo, non sarà possibile visualizzarlo completamente.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modificare le immagini

Quando vogliamo modificare in modo uniforme lo stile delle immagini, ci basta modificare il codice dentro `ForEach`.

Per esempio, cambiare la larghezza a `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

In questo modo, tutte le immagini verranno modificate insieme, senza doverle cambiare una per una.

Questo è uno dei ruoli importanti di `ForEach`:

**Quando più view hanno la stessa struttura e cambia solo il contenuto, possiamo scrivere il codice della view una sola volta e lasciare che i dati nell’array decidano cosa mostrare.**

## Riepilogo

In questa lezione abbiamo imparato il ciclo `for` e `ForEach`.

Il ciclo `for` serve per elaborare in ordine gli elementi di un array o di un intervallo, ed è più orientato all’elaborazione dei dati.

`ForEach` viene usato in SwiftUI per generare ripetutamente view in base al contenuto di un array, ed è più orientato alla visualizzazione dell’interfaccia.

Nella fase iniziale attuale, la forma più comune di `ForEach` è:

```swift
ForEach(array, id: \.self) { elemento in
    codice SwiftUI
}
```

Qui `id: \.self` significa usare l’elemento stesso per distinguere ogni elemento.

Quando il contenuto dell’array è formato da tipi semplici come `String` e `Int`, di solito possiamo iniziare con questa sola forma.

In futuro, quando navigherai sul web o userai app e vedrai gruppi di testi ripetuti, immagini o altri contenuti a elenco, potrai pensare che in SwiftUI questi contenuti vengono di solito prima messi in un array, e poi mostrati uno per uno tramite `ForEach`.
