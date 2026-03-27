# Layout, immagini e testo

Nella lezione precedente abbiamo studiato il codice di `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In questa lezione impareremo il meccanismo di layout predefinito di SwiftUI e il modo di usare immagini e testo. Partendo dalle basi della lezione precedente, capiremo meglio la struttura e il metodo di visualizzazione delle viste; queste conoscenze ci aiuteranno a costruire layout di interfaccia di base.

## Meccanismo di layout predefinito di SwiftUI

Quando osserviamo l'anteprima della vista `ContentView`, vediamo che l'icona e il testo vengono mostrati al centro, invece di essere disposti a partire dall'alto.

![Swift](../../RESOURCE/003_view.png)

Per impostazione predefinita, l'allineamento del contenitore Stack è `.center`, quindi le viste figlie risultano di solito centrate.

### Alignment e modalità di allineamento

È evidente che l'allineamento centrale è soltanto uno dei possibili allineamenti. Se vogliamo allineare a sinistra o a destra, dobbiamo usare `alignment` per controllare il modo in cui la vista si allinea.

```swift
alignment
```

In SwiftUI, l'allineamento compare di solito in due scenari:

**1. Parametro di allineamento di un contenitore Stack**

Per esempio, allineare a sinistra l'icona e il testo in `ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

L'`alignment` di `VStack` controlla l'allineamento in direzione orizzontale.

Tipi di allineamento:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` è un ordinamento orizzontale, quindi `alignment` controlla l'allineamento in direzione verticale:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` è un ordinamento sovrapposto; `alignment` può controllare l'allineamento orizzontale o verticale:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Se `alignment` non viene specificato esplicitamente, `VStack`, `HStack` e `ZStack` usano `.center` per impostazione predefinita.

**2. alignment all'interno di frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Quando la dimensione fornita da `frame` è maggiore della dimensione della vista stessa, `alignment` decide la posizione della vista all'interno del frame. L'uso specifico di `frame` verrà approfondito più avanti; qui ne diamo solo una breve introduzione.

### Spacer e meccanismo di distribuzione dello spazio

`alignment` permette di ordinare e mostrare le viste in direzione orizzontale o verticale. Tuttavia, quando vogliamo mostrare testo e immagini alle due estremità, un singolo allineamento non basta.

Per esempio, quando vogliamo realizzare una vista superiore simile a quella del sito [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), con il logo NHK a sinistra e l'icona del menu del sito a destra.

![Swift](../../RESOURCE/003_alignment3.png)

Se usiamo solo `alignment`, il logo NHK e l'icona del menu compariranno solo su un lato. Non è possibile distribuire le due icone a sinistra e a destra; per questo serve `Spacer` a distribuire lo spazio rimanente.

`Spacer` è una vista flessibile per il layout che può riempire automaticamente lo spazio rimanente.

Modo d'uso:

```swift
Spacer()
```

Per esempio:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Quando aggiungiamo `Spacer` tra `Image` e `Text`, `Spacer` riempie lo spazio rimanente e spinge `Image` e `Text` rispettivamente verso l'alto e verso il basso.

![Swift](../../RESOURCE/003_view1.png)

Se ci sono più `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Lo spazio rimanente viene distribuito in modo uniforme tra gli `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Visualizzazione e controllo delle dimensioni di Image

La vista `Image` viene usata principalmente per mostrare immagini. Le icone SF Symbols studiate nella lezione precedente sono solo uno degli usi di `Image`.

Modo d'uso:

```swift
Image("imageName")
```

Tra virgolette in `Image` c'è il nome dell'immagine; non è necessario scrivere l'estensione.

### Mostrare un'immagine

Per prima cosa, prepariamo un'immagine.

![Swift](../../RESOURCE/003_img.jpg)

In Xcode, seleziona la cartella risorse `Assets` e trascina l'immagine dentro `Assets`.

![Swift](../../RESOURCE/003_img1.png)

In `ContentView`, usa `Image` per mostrare l'immagine:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Nota: `Image` di SwiftUI non supporta la riproduzione delle animazioni GIF (può mostrare solo un fotogramma statico).

### Controllare le dimensioni dell'immagine

In SwiftUI, `Image` viene mostrata per default con la dimensione originale dell'immagine. Se vuoi regolarne la dimensione a schermo, devi prima usare `resizable` per rendere scalabile il contenuto e poi usare `frame` per specificare la dimensione del layout.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modificatore resizable

Il modificatore `resizable` permette all'immagine di partecipare al ridimensionamento nel layout invece di usare sempre la dimensione originale.

```swift
.resizable()
```

Solo aggiungendo `resizable()`, `frame` può cambiare davvero la dimensione mostrata dell'immagine.

Se si omette `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` fornirà solo lo spazio di layout per l'immagine, ma la dimensione dell'immagine stessa non cambierà.

### Modificatore frame

`frame(width:height)` serve a specificare la larghezza e l'altezza di una vista.

Uso di base:

```swift
.frame(width: 10,height: 10)
```

Per esempio, impostare l'immagine come un rettangolo con `width` 300 e `height` 100.


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Si può anche impostare solo la larghezza o solo l'altezza:

```swift
.frame(width: 200)
.frame(height: 100)
```

La combinazione `resizable + frame` permette di controllare in modo flessibile la dimensione mostrata delle immagini nell'interfaccia, mantenendone al tempo stesso la capacità di ridimensionamento.

### Proporzioni: scaledToFit e scaledToFill

Quando usiamo `frame` con larghezza e altezza che non rispettano le proporzioni originali, l'immagine potrebbe deformarsi.

Se vogliamo che l'immagine si adatti allo spazio disponibile mantenendo le proporzioni, possiamo usare `scaledToFit` o `scaledToFill`.

**scaledToFit**

`scaledToFit` mantiene il rapporto originale dell'immagine, la ridimensiona per adattarla completamente allo spazio disponibile e non la ritaglia:

```swift
.scaledToFit()
```

oppure

```swift
.aspectRatio(contentMode: .fit)
```

Questo metodo è adatto agli scenari in cui si vuole mostrare l'immagine intera senza deformazioni.

Se tutte le immagini vengono impostate con la stessa larghezza e altezza, è facile che si deformino.

Per esempio:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Senza impostare la modalità di scala, l'immagine non può essere mostrata con le proporzioni originali.

![Swift](../../RESOURCE/003_img4.png)

Impostando `scaledToFit`, l'immagine può mantenere le sue proporzioni originali.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` mantiene anch'esso le proporzioni dell'immagine, ma riempie l'intero spazio disponibile; se le proporzioni non coincidono, la parte in eccesso viene ritagliata:

```swift
.scaledToFill()
```

oppure

```swift
.aspectRatio(contentMode: .fill)
```

Questo metodo è adatto agli scenari in cui l'immagine deve coprire l'intera area, per esempio come immagine di sfondo o banner. È adatto quindi ai casi in cui l'immagine funge da sfondo.

**Differenza tra i due**

![Swift](../../RESOURCE/003_img6.png)

## Testo

In SwiftUI, `Text` viene usato per mostrare testo.

Uso di base:

```swift
Text("FangJunyu")
```

Nella lezione precedente abbiamo già studiato `Text`; in questa lezione andremo oltre, imparando a controllare la dimensione e lo spessore del carattere per rendere il testo più espressivo nella vista.

### Dimensione del carattere

Con il modificatore `font` si può controllare la dimensione del testo:

```swift
.font(.title)
```

Per esempio:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Dimensioni di carattere comuni (dalla più grande alla più piccola):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Spessore del carattere

Se vogliamo rendere il testo in grassetto, possiamo usare il modificatore `fontWeight`:

```swift
.fontWeight(.bold)
```

Per esempio:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Spessori di carattere comuni (dal più sottile al più pesante):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controlla la dimensione del carattere, `fontWeight` ne controlla lo spessore. I due si possono combinare per rendere il testo più espressivo.

## Riepilogo e pratica

Fino a questo punto, abbiamo studiato il layout predefinito di SwiftUI, `Spacer`, `Image` e `Text`: conoscenze di base già sufficienti per sviluppare alcune viste semplici.

Per esempio: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

L'interfaccia di Google è molto pulita; contiene immagini e testo, e possiamo provare ad analizzarne la struttura dal punto di vista di SwiftUI:

1. L'insieme è diviso in tre parti: logo Google, barra di ricerca e testo di suggerimento. Si può usare `VStack` per l'ordinamento verticale.
2. Il logo Google è un'immagine e può essere mostrato con `Image`.
3. La barra di ricerca contiene un campo di input e un'icona; se ignoriamo il campo di input, l'icona di ricerca può essere mostrata con `Image`.
4. Il testo di suggerimento viene mostrato con `Text`; per l'ordinamento orizzontale del testo si può usare `HStack`, mentre il colore si può controllare con `foregroundStyle`.

Esercitandoci con queste conoscenze, possiamo creare alcune viste semplici e approfondire la comprensione e l'uso delle viste `Image` e `Text` e dei loro modificatori.
