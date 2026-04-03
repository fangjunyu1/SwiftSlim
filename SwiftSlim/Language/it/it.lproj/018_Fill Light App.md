# App Fill Light

In questa lezione, realizzeremo un'app fill light molto interessante. Quando arriva la notte, possiamo far visualizzare allo schermo del telefono diversi colori e usarlo come una semplice luce di riempimento.

Questa app fill light può cambiare colore toccando lo schermo e può anche regolare la luminosità tramite uno slider.

In questo esempio, impareremo a usare `brightness` per regolare la luminosità di una vista, `onTapGesture` per aggiungere un gesto di tocco a una vista e il controllo `Slider`.

Risultato:

![Color](../../Resource/018_color.png)

## Mostrare un colore

Per prima cosa, facciamo in modo che la vista mostri un colore.

In SwiftUI, `Color` non rappresenta solo un colore, ma può anche essere mostrato come una vista:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Qui, `Color.red` rappresenta una vista rossa. `.ignoresSafeArea()` fa sì che la vista del colore riempia l'intero schermo, così da sembrare più simile a un vero effetto fill light.

Risultato:

![Color](../../Resource/018_color1.png)

### Array di colori e indice

Ora viene mostrato un solo colore. Ma una fill light di solito non ha un solo colore. Può anche mostrare blu, giallo, viola, bianco e altri colori.

Vogliamo passare tra colori diversi quando lo schermo viene toccato. Possiamo mettere questi colori in un array per gestirli in modo unificato:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Un array è adatto per memorizzare "un gruppo di dati dello stesso tipo". Qui, ogni elemento dell'array è un `Color`.

Se vogliamo mostrare un colore specifico, possiamo usare un indice:

```swift
colors[0]
```

Questo significa leggere il colore all'indice `0` dell'array, cioè il primo colore.

Ora il codice può essere scritto così:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

In questo modo, lo schermo mostra il primo colore dell'array, cioè il rosso.

### Usare l'indice per controllare il colore

Se abbiamo bisogno di passare tra colori diversi, ci serve una variabile per gestire l'indice invece di scriverlo in modo fisso.

Possiamo usare `@State` per dichiarare una variabile che salva l'indice:

```swift
@State private var index = 0
```

Qui, `index` rappresenta l'indice del colore corrente.

Quando `index` cambia, SwiftUI ricalcola l'interfaccia e aggiorna il contenuto mostrato.

Poi cambiamo il vecchio `colors[0]` in:

```swift
colors[index]
```

In questo modo, il colore mostrato nella vista è determinato da `index`.

Ora il codice diventa:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Quando `index` cambia, anche `colors[index]` mostrerà un colore diverso.

Per esempio:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

È importante notare che `index` non può superare l'indice massimo dell'array, altrimenti si verificherà un errore di indice fuori intervallo.

## Gesto di tocco

Ora possiamo mostrare colori diversi in base a `index`, ma non possiamo ancora cambiarli toccando.

Nella precedente lezione "Carosello di citazioni", abbiamo usato `Button` per controllare il cambio delle citazioni.

Ma questa volta vogliamo "toccare l'intera area di colore" per cambiare colore, quindi `onTapGesture` è più adatto.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Quando tocchiamo la vista del colore, viene eseguito questo codice:

```swift
index += 1
```

Questo significa aumentare `index` di `1`. Dopo che l'indice è aumentato, `colors[index]` mostrerà il colore successivo nell'array.

### `onTapGesture`

`onTapGesture` è un modificatore di gesture che aggiunge un'azione di tocco a una vista.

Uso di base:

```swift
.onTapGesture {
    // code
}
```

Per esempio:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Quando questa vista rossa viene toccata, il codice nelle parentesi graffe viene eseguito e nella console appare:

```swift
Click color
```

Attraverso `onTapGesture`, possiamo definire cosa succede dopo che una vista viene toccata.

### Differenza rispetto a `Button`

In precedenza abbiamo studiato la vista `Button`. Sia `Button` sia `onTapGesture` possono gestire azioni di tocco, ma i loro scenari di utilizzo non sono esattamente gli stessi.

`onTapGesture` è più adatto per "aggiungere una funzione di tocco a una vista già esistente", come `Color`, `Image`, `Text` o un'altra vista normale.

`Button` è più adatto quando vogliamo rappresentare un pulsante chiaro, come "Conferma", "Invia" o "Elimina".

In questa app fill light, vogliamo che la funzione di cambio colore sia più semplice. Toccare tutta l'area colorata per cambiare colore rende `onTapGesture` una buona scelta qui.

## Il problema dell'indice

Ora possiamo toccare lo schermo per passare tra colori diversi.

Ma qui c'è un problema importante: **l'indice può andare oltre l'intervallo dell'array**.

Per esempio:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Se continuiamo a toccare lo schermo, `index` diventerà alla fine `4`, e a quel punto si verificherà l'errore "index out of range".

Questo accade perché l'array `colors` ha `4` elementi, ma l'indicizzazione parte da `0`, quindi l'intervallo valido degli indici è `0 - 3`, non `4`.

Se accediamo a `colors[4]`, si verifica un errore "index out of range".

Nel codice attuale, ogni tocco aumenta automaticamente `index` di `1`. Se non gestiamo questo caso, prima o poi uscirà dall'intervallo valido.

Perciò, quando lo schermo viene toccato, dobbiamo controllare l'indice: se è già sull'ultimo colore, torniamo al primo colore; altrimenti continuiamo ad aggiungere `1`.

Possiamo farlo con un'istruzione `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

In questo codice, `colors.count` rappresenta il numero di elementi dell'array.

Nell'array attuale ci sono 4 colori, quindi:

```swift
colors.count // 4
```

Ma l'indice massimo non è `4`, bensì `3`, perché l'indicizzazione parte da `0`.

Perciò l'ultimo indice va scritto così:

```swift
colors.count - 1
```

Cioè:

```swift
4 - 1 = 3
```

Questa logica significa: se l'indice attuale corrisponde già all'ultimo colore, reimposta l'indice a `0`; altrimenti aumentalo di `1`.

In questo modo, i colori possono cambiare in ciclo.

### Ottimizzare la logica dell'indice

Se vogliamo rendere il codice più conciso, possiamo anche usare l'operatore ternario:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Questo codice significa: se `index == colors.count - 1` è vero, restituisci `0`. Altrimenti, restituisci `index + 1`.

Infine, riassegniamo il risultato a `index`.

Ora possiamo ottenere l'effetto di cambio colore.

Codice completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Ora possiamo toccare lo schermo e passare tra colori diversi. Una semplice app fill light di base è completata.

## Mostrare il nome del colore

Possiamo aggiungere un altro gruppo di testi corrispondenti ai colori, in modo che quando il colore cambia, sullo schermo venga mostrato anche il nome del colore attuale.

Per esempio:

- Il rosso mostra `Red`
- Il blu mostra `Blue`
- Il giallo mostra `Yellow`
- Il viola mostra `Purple`

Anche qui possiamo usare un array per salvare i nomi dei colori:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

L'ordine dei testi in questo array deve corrispondere esattamente all'ordine dei colori nell'array dei colori.

Poi possiamo usare `Text` per mostrare il nome del colore dell'indice attuale:

```swift
Text(colorsName[index])
```

`Text` mostra il nome del colore attuale in base a `index`.

Usiamo dei modificatori per migliorare l'aspetto di `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Questo fa apparire `Text` in bianco, con dimensione da titolo e con carattere in grassetto.

Ora abbiamo una vista `Color` a schermo intero. Se vogliamo che `Text` appaia sopra la vista `Color`, dobbiamo usare il contenitore di layout `ZStack` per sovrapporli.

```swift
ZStack {
    Color
    Text
}
```

Quindi il codice diventa:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

In questo modo, lo sfondo è la vista del colore, e sopra di essa viene sovrapposta una vista di testo.

Risultato:

![Color](../../Resource/018_color2.png)

È importante notare che, in uno `ZStack`, le viste scritte più tardi appaiono di solito davanti. Se `Text` viene scritto prima di `Color`, la vista `Color` scritta dopo potrebbe coprire `Text`.

## Controllare la luminosità

Ora possiamo cambiare tra colori diversi, ma una fill light ha anche un'altra funzione importante: **regolare la luminosità**.

In SwiftUI, possiamo usare il modificatore `brightness` per regolare la luminosità di una vista.

Per esempio:

```swift
.brightness(1)
```

Possiamo scrivere:

```swift
colors[index]
    .brightness(0.5)
```

Questo rende il colore attuale più luminoso e più vicino all'effetto di una fill light.

L'intervallo della luminosità è `0 - 1`. `0` significa mantenere il colore originale, e più il valore è vicino a `1`, più il colore diventa luminoso. `1` rappresenta il risultato bianco più luminoso.

Anche se possiamo controllare `brightness` nel codice, l'utente non può ancora regolarlo direttamente da solo.

Perciò dobbiamo aggiungere un controllo trascinabile: `Slider`.

## Vista `Slider`

In SwiftUI, `Slider` è un controllo usato per selezionare un valore all'interno di un intervallo. Apple lo descrive come "un controllo per selezionare un valore da un intervallo lineare limitato".

Uso di base:

```swift
Slider(value: $value, in: 0...1)
```

Spiegazione dei parametri:

1. `value: $value`: `Slider` deve essere collegato a una variabile.

    Quando il cursore viene trascinato, il valore della variabile cambia nello stesso momento. Al contrario, se la variabile cambia, anche il cursore si aggiorna.

    Questo è molto simile a `TextField`, che abbiamo imparato in precedenza. Entrambi "collegano un controllo a una variabile".

    Una variabile collegata deve avere il simbolo `$` davanti per rappresentare il binding.

2. `in: 0...1`: questo parametro rappresenta l'intervallo di valori del cursore.

    Qui, `0...1` significa che il valore minimo è `0` e il valore massimo è `1`.

    Quando il cursore viene spostato completamente a sinistra, la variabile collegata è vicina a `0`; quando viene spostato completamente a destra, è vicina a `1`.

Per esempio:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` è collegato alla variabile `value`. Quando il cursore viene trascinato, anche il valore della variabile `value` cambia nello stesso momento.

Aspetto:

![Slider](../../Resource/018_slider.png)

Quando il `Slider` viene spostato verso sinistra, il valore collegato `value` diventa `0`. Quando viene spostato verso destra, diventa `1`.

### Intervallo di valori

L'intervallo di valori di `Slider` non è fisso. Può anche essere scritto così:

```swift
0...100
```

oppure con un altro intervallo.

Ma in questa app fill light dobbiamo controllare la luminosità, quindi `0...1` è la scelta più adatta.

## Usare `Slider` per controllare la luminosità

Ora dobbiamo collegare `Slider` con `brightness`.

Per prima cosa, creiamo una variabile per memorizzare il valore della luminosità:

```swift
@State private var slider = 0.0
```

Qui, `0.0` è un valore di tipo `Double`.

Poiché `Slider` è normalmente collegato a un tipo numerico, e qui vogliamo che cambi in modo continuo, `Double` è più adatto. Inoltre, `brightness` può accettare solo un valore di tipo `Double`.

Poi passiamo questo valore a `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Quando `slider == 0`, il colore rimane nel suo stato predefinito. Più `slider` è vicino a `1`, più il colore appare luminoso.

### Aggiungere il controllo `Slider`

Successivamente, aggiungiamo un controllo `Slider` per modificare questa variabile:

```swift
Slider(value: $slider, in: 0...1)
```

Quando il cursore cambia, anche il valore di `slider` cambia, e `brightness(slider)` aggiorna la luminosità nello stesso momento.

Questo è un esempio molto tipico del concetto secondo cui "le variabili guidano la vista" in SwiftUI.

### Regolare l'aspetto di `Slider`

Per impostazione predefinita, `Slider` usa la larghezza disponibile.

Possiamo dargli una larghezza fissa:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Poi aggiungiamo ancora alcuni modificatori per renderlo più visibile:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Questo dà al cursore uno sfondo bianco e angoli arrotondati, facendolo risaltare più chiaramente sulla vista `Color`.

Infine, posizioniamolo nella parte inferiore dello schermo.

Dato che abbiamo già usato `ZStack`, possiamo inserire al suo interno un `VStack` e usare `Spacer()` per spingere il `Slider` verso il basso.

## Codice completo

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Risultato:

![Color](../../Resource/018_color.png)

## Riepilogo

Usando le conoscenze apprese in precedenza insieme a concetti di base come colori e array, abbiamo costruito un'app fill light molto interessante.

Attraverso questa app fill light, abbiamo imparato a usare `brightness` per regolare la luminosità, `onTapGesture` per aggiungere azioni di tocco alle viste e il controllo `Slider`.

Abbiamo aggiunto `onTapGesture` alla vista `Color` per cambiare colore. Abbiamo anche usato il controllo `Slider` per modificare una variabile che gestisce `brightness`, che è un altro esempio del fatto che "le variabili guidano la vista".

Abbiamo anche ripassato l'operatore ternario, usato `ZStack` per sovrapporre le viste e usato gli array per gestire un gruppo di dati dello stesso tipo. Questo aiuta ad approfondire la nostra comprensione di array e indici, incluso il problema pratico di evitare errori di indice fuori intervallo.

Anche se questo esempio non è complicato, collega molte delle idee di base che abbiamo imparato prima. Quando vengono combinate in un piccolo progetto reale, diventa più facile capire a cosa serve ciascun concetto.

### Scenario d'uso reale

Immagina di mettere un vecchio iPhone sulla scrivania e usare l'app fill light che hai sviluppato tu stesso per controllare il colore della luce. Sarebbe un'esperienza davvero piacevole.

Nell'App Store ci sono molte app "fill light", e neanche quelle sembrano particolarmente complicate.

![AppStore](../../Resource/018_appStore.PNG)

Possiamo iniziare sviluppando app semplici e provare a pubblicarle sull'App Store. Questo non solo aumenta il nostro interesse per lo sviluppo, ma registra anche la nostra crescita.

### Esercizio dopo la lezione

Puoi continuare a pensare a modi per espandere questa app fill light, per esempio:

- Aggiungere più colori
- Mostrare il valore attuale della luminosità
- Migliorare il design dell'area inferiore dello slider

Quando inizierai davvero a usare queste conoscenze, scoprirai che ogni concetto che impariamo è in realtà uno strumento per costruire app.

Più strumenti padroneggiamo, più funzioni possiamo creare.
