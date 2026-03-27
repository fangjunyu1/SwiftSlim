# Iniziare da ContentView

## Preparazione prima della lezione

In questa lezione partiremo dal file `ContentView.swift` per conoscere in modo sistematico la struttura di base di SwiftUI, tra cui:

- commenti
- struttura di View
- layout VStack / HStack / ZStack
- icone SF Symbols
- modificatori di vista (modifier)
- codice di anteprima `#Preview`

Per prima cosa, trova il progetto Xcode creato in precedenza e fai doppio clic sul file `.xcodeproj`.

Nell'area di navigazione Navigator a sinistra, seleziona il file `ContentView.swift`.

Nota: ogni volta che apri il progetto, Canvas potrebbe mostrare "Preview paused". Fai clic sul pulsante di aggiornamento per ripristinare l'anteprima.

![Swift](../../RESOURCE/002_view7.png)

## Conoscere ContentView

Codice di ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Anche se il codice è piuttosto breve, contiene la struttura fondamentale di SwiftUI.

### 1. Commenti

Nella parte superiore del file:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//
```

Questo è il commento del file, usato per registrare le informazioni sul file, tra cui il nome del file, il nome del progetto, l'autore e la data di creazione.

In Swift si usa `//` per i commenti su singola riga:

```swift
// Questo è un commento
```

I commenti possono migliorare la leggibilità del codice e aiutare gli sviluppatori a comprenderne la logica.

Nello sviluppo reale, il codice può risultare difficile da capire. Se non si scrivono commenti, può succedere di non capire più il proprio codice dopo appena tre giorni.

Perciò, aggiungere attivamente commenti durante la scrittura del codice è una buona abitudine di sviluppo. Usare i commenti per registrare la logica del codice facilita la manutenzione successiva.

**Disattivare temporaneamente il codice**

I commenti possono anche essere usati per disattivare temporaneamente del codice e aiutarci a individuare i problemi.

Per esempio:

```
A
B
C
```

A, B e C sono tre blocchi di codice, e uno di essi contiene un errore. Possiamo commentarli temporaneamente per fare il debug.

Prima aggiungiamo un commento ad A:

```
// A
B
C
```

Se dopo aver commentato A il codice torna a funzionare normalmente, significa che il problema è nel blocco A.

Se invece anche commentando A il problema rimane, possiamo commentare B, e così via, finché non troviamo il blocco di codice problematico.

Nel processo di sviluppo incontreremo molti problemi e nella maggior parte dei casi dovremo usare i commenti per individuare la causa. Questo ci aiuta a localizzare il codice problematico e a trovare il bug.

In Xcode si può usare la scorciatoia:

```
Command ⌘ + /
```

per aggiungere o rimuovere rapidamente i commenti.

### 2. Importare il framework SwiftUI

```swift
import SwiftUI
```

Questa riga di codice indica che stiamo importando il framework SwiftUI.

In SwiftUI, tipi come `View`, `Text`, `Image` e `VStack` provengono tutti da questo framework.

Se non si importa il framework SwiftUI, Xcode mostrerà l'errore:

```
Cannot find type 'View' in scope
```

Questo significa che il compilatore non riesce a riconoscere il tipo `View`.

### 3. Struttura di View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

La prima volta che si vede questa struttura `View`, può sembrare poco familiare, perché contiene parole chiave come `struct`, `View`, `var`, `body` e `some`.

Al momento non abbiamo ancora studiato queste parole chiave; basta sapere che il significato di questo codice è creare una vista chiamata `ContentView`.

Puoi immaginare una `View` come una tavola da disegno su cui possiamo disegnare, e lo strumento di disegno è SwiftUI.

Per esempio:

![Swift](../../RESOURCE/002_view.png)

L'immagine sopra mostra tre schermate che in realtà corrispondono a tre View.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Quando sviluppiamo un'app con SwiftUI, ogni schermata è una View.

### 4. Codice SwiftUI

All'interno della vista View viene mostrato questo codice SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Questo codice SwiftUI indica un layout verticale che mostra un'icona e un testo.

![Swift](../../RESOURCE/002_view1.png)

#### Layout VStack

```swift
VStack { }  // Layout verticale
```

`VStack` rappresenta un contenitore con layout verticale. Le viste interne vengono disposte dall'alto verso il basso.

![Swift](../../RESOURCE/002_view8.png)

In SwiftUI esistono tre layout comuni:

- `VStack` —— ordinamento verticale
- `HStack` —— ordinamento orizzontale
- `ZStack` —— ordinamento sovrapposto (asse Z)

```swift
HStack { }  // Ordinamento orizzontale
ZStack { }  // Ordinamento sovrapposto
```

Schema dell'ordinamento dei vari layout:

![Swift](../../RESOURCE/002_view2.png)

Per esempio, usare `HStack` per un ordinamento orizzontale.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Si può vedere che l'icona del globo e il testo vengono mostrati in orizzontale.

![Swift](../../RESOURCE/002_view3.png)

Quando vogliamo un ordinamento orizzontale, usiamo `HStack`. Quando abbiamo bisogno di un ordinamento sovrapposto, usiamo `ZStack`.

#### Image e SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Questo codice mostra un'icona del globo, proveniente dal sistema di icone SF Symbols di Apple.

![Swift](../../RESOURCE/002_view9.png)

Il significato del codice è mostrare un'icona del globo, di dimensione grande e con il colore di enfasi.

Oltre al globo, possiamo naturalmente mostrare anche altre icone.

Per esempio, mostrare uno zaino:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Come si mostrano altre icone?**

Dobbiamo usare la libreria ufficiale di icone di sistema fornita da Apple, SF Symbols.

Apri il sito ufficiale Apple Developer e scarica [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Apri l'app SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

A sinistra c'è la classificazione dei simboli, a destra le icone corrispondenti.

Fai clic con il tasto destro su un'icona e scegli "Copia 1 nome"; il nome è la stringa corrispondente.

Per esempio:

```
"globe"
"backpack"
"heart"
```

Inserendo il nome dell'icona copiato dentro `Image(systemName:)`, si possono mostrare icone differenti.

Nota: ogni icona SF Symbols ha una versione minima di sistema supportata. Se la versione del sistema è troppo bassa, l'icona potrebbe non essere mostrata. È necessario verificare le informazioni di compatibilità nell'app SF Symbols.

#### Modificatori

In SwiftUI, un modificatore (`modifier`) è un metodo usato per cambiare l'aspetto o il comportamento di una vista.

Puoi immaginare i modificatori come dei vestiti: indossando vestiti diversi, l'aspetto mostrato cambia.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` e `foregroundStyle` sono modificatori della vista `Image`: senza cambiare il contenuto di `Image`, ne modificano l'aspetto.

**1. imageScale**

```swift
.imageScale(.large)
```

Può controllare la dimensione delle icone SF Symbols:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Possiamo cambiare le diverse opzioni per mostrare i simboli SF Symbols con dimensioni diverse.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` può controllare il colore di primo piano.

`.tint` indica il colore di enfasi dell'ambiente corrente (accent color), che per impostazione predefinita in iOS è il blu.

Se vogliamo cambiare il colore di primo piano in rosso:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Vista Text

`Text` è una vista di testo usata per mostrare stringhe.

```swift
Text("Hello, world!")
```

Per esempio, mostrare il mio nome:

```swift
Text("FangJunyu")
```

Nota: le stringhe devono essere racchiuse tra doppi apici `""`.

Puoi provare a mostrare il tuo nome, il tuo numero di telefono e altri contenuti.

#### padding e margini interni

In SwiftUI, `padding` viene usato per aggiungere spazio vuoto tra il contenuto della vista e il bordo; appartiene al concetto di margine interno (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Il codice qui sopra indica che viene aggiunto il margine predefinito di sistema alla vista `HStack`.

**Che cos'è padding?**

`padding` indica "lo spazio vuoto tra il contenuto della vista e il suo bordo".

Nell'immagine seguente, dopo aver impostato `padding` per l'HStack blu, l'area blu si ritira verso l'interno e sembra "rimpicciolirsi di un giro".

![Swift](../../RESOURCE/002_view6.png)

**Margine predefinito**

Il modificatore `padding()` usa per default la spaziatura standard consigliata dal sistema.

```swift
.padding()
```

Su piattaforme e contesti diversi, questo valore può cambiare, per esempio:

- in iOS di solito è circa 16 pt.
- su macOS o watchOS la spaziatura standard del sistema può essere diversa, generalmente più grande o più piccola, a seconda delle linee guida di design della piattaforma.

**Margine personalizzato**

È anche possibile impostare margini specifici per la vista.

1. Impostare una sola direzione

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Spiegazione delle direzioni:

- `.top`: margine superiore
- `.bottom`: margine inferiore
- `.leading`: margine iniziale
- `.trailing`: margine finale

![Swift](../../RESOURCE/002_view12.png)

Nota: `leading` e `trailing` si adattano automaticamente in base alla direzione della lingua. Per esempio, in un ambiente arabo (RTL) si invertiranno automaticamente.

2. Impostare più direzioni

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

È possibile specificare più direzioni contemporaneamente tramite un array. L'uso specifico degli array verrà spiegato in dettaglio nelle lezioni successive; qui basta sapere che questa sintassi esiste.

3. Impostare la direzione orizzontale o verticale

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Equivale a:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Rimuovere il margine**

Se non vuoi alcun margine, puoi usare `.padding(0)` per rimuoverlo:

```swift
.padding(0)
```

Oppure eliminare direttamente il modificatore `padding`:

```swift
// .padding()
```

### 6. Codice di anteprima Preview

```swift
#Preview {
    ContentView()
}
```

Questo codice indica che in Canvas viene generata l'anteprima della vista `ContentView`.

Nota: `#Preview` è una nuova sintassi introdotta in Swift 5.9 / Xcode 15; prima si usava la struttura `PreviewProvider`.

**Che cosa succede se si commenta Preview?**

Se si commenta Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas non mostrerà più alcun contenuto renderizzabile.

![Swift](../../RESOURCE/002_xcode.png)

Questo è il modo in cui `#Preview` controlla la visualizzazione dell'anteprima in Canvas.

Quando abbiamo bisogno di vedere in anteprima una vista SwiftUI in Xcode, aggiungiamo il codice di anteprima `#Preview`. Se non serve l'anteprima, possiamo commentare o eliminare il codice `#Preview`.

## Riepilogo

Anche se il codice del file `ContentView.swift` non è molto, in realtà copre diversi concetti fondamentali di SwiftUI. Per chi è agli inizi, questo codice può sembrare poco familiare, ma scomponendone la struttura si può costruire una comprensione iniziale di SwiftUI.

Ripassando il contenuto di questa lezione, per prima cosa abbiamo imparato il commento `//`, che può essere usato per spiegare la logica del codice o per disattivare temporaneamente del codice.

Poi abbiamo capito che un file SwiftUI deve importare il framework SwiftUI:

```swift
import SwiftUI
```

Se il framework non viene importato, il compilatore non potrà riconoscere tipi come `View`.

Successivamente abbiamo conosciuto la struttura di base di una vista SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

In essa, `ContentView` è il nome della vista.

Abbiamo anche studiato tre contenitori di layout comuni: `VStack` (ordinamento verticale), `HStack` (ordinamento orizzontale) e `ZStack` (ordinamento sovrapposto).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

In questo blocco di codice si mostra un contenitore con ordinamento verticale, al cui interno compaiono un'icona e un testo.

`Image` può mostrare icone SF Symbols e, tramite i modificatori, controllarne la dimensione e il colore.

La vista `Text` può mostrare contenuto testuale.

`padding` è il margine, cioè uno spazio trasparente aggiunto attorno alla vista.

Infine c'è la vista di anteprima `#Preview`, che può mostrare l'anteprima nel Canvas.

### Esercizi dopo la lezione

Per chi è agli inizi, i contenuti di questa lezione possono risultare piuttosto complessi. Possiamo approfondire ciò che abbiamo imparato con altri esercizi:

- modificare il nome dell'icona SF Symbols
- cambiare il colore di primo piano dell'icona in nero
- sostituire `VStack` con `HStack`
- commentare `Image` o `Text` e osservare i cambiamenti nella vista di anteprima

### Extra: completamento del codice (Code Completion)

Durante l'inserimento del codice, chi è attento potrebbe aver già notato che Xcode mostra automaticamente un elenco di opzioni disponibili.

Per esempio, quando modifichiamo il modificatore `imageScale`:

```swift
.imageScale(.)
```

Xcode mostrerà le opzioni disponibili:

![Swift](../../RESOURCE/002_view10.png)

Questo fa parte del meccanismo di completamento del codice (Code Completion), basato sull'inferenza dei tipi e sui suggerimenti dei membri delle enum, e può migliorare l'efficienza di inserimento riducendo gli errori.

Nelle lezioni successive presenteremo formalmente le enumerazioni (`enum`); per ora basta una conoscenza introduttiva.
