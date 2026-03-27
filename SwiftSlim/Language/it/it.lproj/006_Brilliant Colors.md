# Colori brillanti

In questa lezione impareremo alcuni modificatori visivi comuni in SwiftUI, tra cui:

- colore
- colore di primo piano
- colore di sfondo
- offset
- opacità
- sfocatura

Impareremo anche la Safe Area (area sicura).

Questi modificatori vengono usati per controllare l'aspetto delle viste e rendere l'interfaccia più chiara e stratificata.

## Colore

In SwiftUI, si può impostare il colore del testo.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` indica il colore blu, ed è in realtà una forma semplificata di `Color.blue` (inferenza di tipo).

I colori più comuni includono:

```
.black
.green
.yellow
.pink
.gray
...
```

Queste sono tutte proprietà statiche di `Color`.

![Color](../../RESOURCE/006_color.png)

Puoi considerare `Color` come un tipo di colore, mentre `.blue`, `.red` ecc. sono i suoi colori concreti.

### Vista Color

In SwiftUI, anche `Color` può essere visualizzato come una vista.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Questo codice genera un quadrato rosso di 100 × 100.

Si può anche far apparire un intero schermo in un determinato colore:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Dopo l'esecuzione, si può vedere che il rosso non riempie tutto lo schermo: la parte superiore e quella inferiore dell'iPhone restano bianche. Qui entra in gioco l'esistenza della Safe Area (area sicura).

## Safe Area (area sicura)

La Safe Area è l'area riservata dal sistema per evitare che il contenuto venga coperto, e include:

1. la barra di stato in alto (ora, batteria)

2. la barra Home nella parte inferiore

3. l'area del notch o della Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Per default, SwiftUI limita il contenuto all'interno della Safe Area, quindi la vista non si estende fino ai bordi dello schermo.

### Ignorare la Safe Area

Se vuoi che il colore riempia tutto lo schermo, puoi usare `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Oppure usare `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

In questo modo la vista si estenderà su tutto lo schermo.

È importante notare che `edgesIgnoringSafeArea` è una sintassi più vecchia; a partire da iOS 14, si consiglia di usare `ignoresSafeArea`.

## Colore di primo piano

### Modificatore foregroundStyle

Nelle lezioni precedenti abbiamo già studiato `foregroundStyle` per impostare il colore.

Per esempio:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` fa parte del nuovo sistema di stili e supporta colori, gradienti, materiali e altro.

![Color](../../RESOURCE/006_color2.png)

### Modificatore foregroundColor

Anche `foregroundColor` può essere usato per impostare il colore:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Il modo d'uso è lo stesso di `foregroundStyle`.

Nelle versioni più recenti di Xcode, Xcode segnala che `foregroundColor` potrebbe essere deprecato in future versioni di iOS, quindi è consigliabile dare priorità a `foregroundStyle`.

## Sfondo

Se vuoi aggiungere un colore di sfondo a una vista, puoi usare `background`:

```swift
background(.red)
```

Per esempio, aggiungere uno sfondo a un testo:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Quando selezioniamo del testo in app come Word o Chrome, possiamo vedere un effetto di sfondo simile.

![Color](../../RESOURCE/006_color16.png)

Se vuoi ingrandire lo sfondo, devi combinarlo con `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Qui bisogna tenere a mente una regola importante:

in SwiftUI i modificatori costruiscono la vista dall'alto verso il basso. I modificatori scritti dopo agiranno sul risultato di quelli scritti prima.

Quindi:

```swift
.padding()
.background()
```

Questo significa che lo sfondo avvolgerà la vista dopo l'aggiunta del margine interno.

Se invece l'ordine viene invertito:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Lo sfondo non si espanderà, perché non avvolge il `padding` scritto dopo.

## Esempio - dado a quattro angoli

Ora realizziamo una semplice vista simile a un dado a quattro angoli.

![Color](../../RESOURCE/006_color8.png)

Per prima cosa creiamo un quadrato bianco di 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Se vogliamo trasformarlo in un cerchio, possiamo usare `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Quando il raggio degli angoli arrotondati è pari alla metà della larghezza e dell'altezza, diventa un cerchio.

Ora aggiungiamo uno sfondo blu:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Il nuovo `padding` espanderà l'area esterna e `background` disegnerà il blu su quell'area esterna.

In questo modo abbiamo ottenuto l'effetto di un dado a quattro angoli.

### Un altro approccio

Oltre a usare un colore di sfondo per realizzare questo effetto, si può anche usare `ZStack`.

Abbiamo già visto che `ZStack` permette di sovrapporre le viste; anche il dado a quattro angoli può essere inteso come la sovrapposizione di un cerchio e un rettangolo.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` sovrappone le viste in ordine, e le viste aggiunte dopo vengono mostrate sopra.

## Esempio - due cerchi sovrapposti

Molte icone sono composte dalla sovrapposizione di forme semplici, per esempio due cerchi sovrapposti.

![Color](../../RESOURCE/006_color14.png)

Per prima cosa, creiamo due cerchi:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Poiché dobbiamo mostrare i due cerchi in sovrapposizione, usiamo il layout `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

A questo punto i due cerchi, avendo la stessa dimensione, si sovrappongono completamente.

Noi vogliamo invece che si sovrappongano solo in parte, non che si coprano totalmente, quindi possiamo usare `offset` per creare un effetto di spostamento.

## Offset

`offset` cambia solo la posizione di disegno della vista, senza influenzare il calcolo del layout della vista padre.

Modo d'uso:

```swift
.offset(x:y:)
```

`x` è lo spostamento in direzione orizzontale, `y` è lo spostamento in direzione verticale.

I valori positivi indicano uno spostamento verso destra / verso il basso, quelli negativi verso sinistra / verso l'alto.

Usiamo `offset` per far sì che i due cerchi si sovrappongano parzialmente:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

La posizione del cerchio rosso nel layout non cambia, ma la sua posizione di disegno si sposta di 25 punti verso sinistra. Per questo i due cerchi producono un effetto visivo di sovrapposizione parziale.

## Opacità

In SwiftUI, `opacity` viene usato per impostare la trasparenza di una vista.

Uso di base:

```swift
.opacity(0.5)
```

Il parametro di `opacity` va da 0.0 a 1.0, dove:

- 0 indica completamente trasparente
- 1 indica opaco

Si può usare `opacity` per impostare la trasparenza del cerchio arancione:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Dopo aver impostato `opacity` del cerchio arancione a 0.8, la sua opacità diventa dell'80%. Quando i due cerchi si sovrappongono, la zona di sovrapposizione produrrà un effetto di mescolanza dei colori.

## Sfocatura

In SwiftUI, si può usare `blur` per impostare un effetto di sfocatura:

```swift
.blur(radius:10)
```

`radius` definisce il raggio della sfocatura: più il valore è grande, più l'effetto di sfocatura è evidente.

Possiamo aggiungere un effetto di sfocatura ai due cerchi:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Alla fine possiamo vedere due cerchi molto sfocati.

## Riepilogo

Questa lezione si è concentrata sui modificatori visivi comuni in SwiftUI, imparando a controllare colore, posizione ed effetti visivi delle viste attraverso i modificatori.

Attraverso esempi concreti, abbiamo visto l'effetto reale dei diversi modificatori visivi nell'interfaccia e abbiamo capito anche il concetto di area sicura.

Questi sono modificatori molto basilari, ma praticarli e usarli spesso ci aiuterà a controllare con maggiore chiarezza l'effetto dell'interfaccia nello sviluppo reale.

### Esercizi dopo la lezione

- aggiungi trasparenza e sfocatura a un'immagine
- imposta tre cerchi sovrapposti con livelli di opacità differenti
- crea un'immagine di sfondo che riempia tutto lo schermo ignorando la Safe Area
- usa `offset` per regolare la posizione di più viste

Lo scopo dell'esercizio non è memorizzare le API, ma osservare la relazione tra cambiamenti visivi e comportamento del layout.
