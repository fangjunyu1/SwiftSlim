# Gestire i file di Xcode

In questa lezione impareremo le operazioni più comuni sui file in Xcode.

Nelle lezioni precedenti abbiamo scritto la maggior parte del codice dentro `ContentView`. Questo rende più semplice osservare il codice e il risultato visualizzato.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Tuttavia, in una vera App, di solito non si mette tutto il codice in un solo file.

Quando pagine, componenti e funzionalità aumentano, dobbiamo separare le diverse viste in file SwiftUI diversi.

Per esempio:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Questo rende la struttura del codice più chiara e facilita anche la manutenzione e le modifiche successive.

## Perché gestire i file

In SwiftUI, una pagina o un componente può di solito essere scritto come un file di vista separato.

Per esempio:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Qui, `CardView` è una vista SwiftUI.

Se tutte le viste vengono scritte dentro `ContentView`, il codice diventerà sempre più lungo e sempre più difficile da leggere.

Per questo dobbiamo imparare a creare, rinominare ed eliminare file, e a usare le cartelle per gestire file di codice diversi.

## Creare un file SwiftUI

In Xcode, ci sono comunemente due modi per creare un file SwiftUI:

Uno è creare un file vuoto e poi scrivere il codice manualmente.

L’altro è creare un file modello SwiftUI, lasciando che Xcode generi automaticamente il codice di base.

Per i principianti, è più consigliabile usare un file modello SwiftUI, perché genera automaticamente la struttura di base.

### Creare un file vuoto

Nell’area Navigator sul lato sinistro di Xcode, fai clic destro su uno spazio vuoto o su una cartella, quindi scegli `New Empty File`.

La posizione dell’operazione è mostrata di seguito:

![xcode](../../../Resource/027_view1.png)

Dopo aver creato un file vuoto, Xcode di solito genera un file Swift senza nome, ad esempio `Untitled.swift`.

Possiamo rinominarlo in `TestView.swift`.

In un progetto SwiftUI, se questo file viene usato per mostrare una vista, di solito è consigliabile aggiungere `View` alla fine del nome.

Per esempio:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Questa non è una regola obbligatoria, ma ci permette di capire a colpo d’occhio che si tratta di un file di vista.

Dopo aver creato un file vuoto, il file potrebbe contenere solo commenti predefiniti, oppure potrebbe essere vuoto. Questo dipende dalla versione di Xcode e dal metodo di creazione.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

A questo punto, dobbiamo scrivere manualmente il codice SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

In questo modo, viene creato un semplice file di vista SwiftUI.

### Rinominare un file

Se dopo aver creato un file vuoi modificarne il nome, puoi selezionare il file nell’area Navigator sul lato sinistro di Xcode, quindi premere il tasto Invio `⏎`.

![xcode](../../../Resource/027_view2.png)

Così puoi modificare il nome del file.

È importante notare che modificare il nome del file non modifica automaticamente il nome della vista nel codice.

Per esempio, dopo aver cambiato il nome del file in `ProfileView.swift`, nel codice potrebbe esserci ancora `struct TestView: View`.

Anche se questo non causa necessariamente un errore, può facilmente creare confusione.

Perciò, è consigliabile mantenere coerenti il nome del file e il nome della vista. Per esempio, se il nome del file è `ProfileView.swift`, anche il nome della vista dovrebbe usare `ProfileView`.

## Creare un file modello SwiftUI

Oltre a creare un file vuoto, possiamo anche creare direttamente un file modello SwiftUI.

Nell’area Navigator sul lato sinistro di Xcode, fai clic destro su uno spazio vuoto o su una cartella, quindi scegli `New File from Template...`.

La posizione dell’operazione è mostrata di seguito:

![xcode](../../../Resource/027_view3.png)

Nella finestra che appare, in alto puoi scegliere piattaforme diverse, ad esempio `iOS`, `macOS` e così via.

Qui mantieni selezionata la piattaforma corrispondente al progetto corrente. Per esempio, se stiamo creando una iOS App, scegli `iOS`.

![xcode](../../../Resource/027_view4.png)

Poi scegli `SwiftUI View` in basso.

![xcode](../../../Resource/027_view12.png)

Poi fai clic su `Next`, inserisci il nome del file e salvalo.

Per esempio, creiamo un file `Test2View.swift`.

Xcode genererà automaticamente un codice simile al seguente:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Rispetto a un file vuoto, un file modello include automaticamente `import SwiftUI`, `struct`, `body` e `#Preview`.

Quindi, per i principianti, usare un file modello SwiftUI è più semplice e riduce anche la probabilità di dimenticare codice necessario.

**Suggerimento**: oltre a creare un file con il clic destro, puoi anche fare clic sul pulsante più in basso nell’area Navigator sul lato sinistro di Xcode per creare un file o una cartella.

![xcode](../../../Resource/027_view5.png)

## Creare una cartella

Quando i file diventano sempre più numerosi, possiamo usare le cartelle per gestirli.

Nell’area Navigator sul lato sinistro di Xcode, fai clic destro su uno spazio vuoto o su una cartella, quindi scegli `New Folder`.

Dopo aver creato la cartella, puoi trascinare i file correlati al suo interno.

![xcode](../../../Resource/027_view7.png)

Le cartelle servono principalmente a organizzare la struttura del progetto e non modificano il modo in cui la vista stessa viene usata.

Finché il nome della vista è corretto, può comunque essere usata in altri file con forme come `TestView()` e `Test2View()`.

## Eliminare un file o una cartella

Se vuoi eliminare un file o una cartella, puoi selezionare il file corrispondente nell’area Navigator sul lato sinistro di Xcode, quindi fare clic destro e scegliere `Delete`.

Puoi anche selezionare il file e premere il tasto Cancella `⌫`.

Xcode mostrerà una finestra di conferma dell’eliminazione.

![xcode](../../../Resource/027_view10.png)

Scegli `Move to Trash` per spostare il file nel Cestino.

Se vedi `Remove Reference`, significa che viene rimossa solo la referenza dal progetto Xcode, ma il file originale sul disco non viene eliminato.

Per i principianti, se stai eliminando solo un normale file appena creato, di solito basta scegliere `Move to Trash`.

## Mostrare più viste SwiftUI

Dopo aver imparato a creare file, possiamo separare viste diverse in file diversi.

Per esempio, creiamo due file SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` viene usata per mostrare il nome dell’autore:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` viene usata per mostrare lo sfondo della scheda:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Poi possiamo usare queste due viste dentro `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Dopo l’esecuzione, puoi vedere che `CardView` e `AuthorView` vengono combinate e mostrate insieme:

![xcode](../../../Resource/027_view11.png)

In questo risultato, `CardView` funge da sfondo, mentre `AuthorView` viene mostrata sopra. Questo perché sono inserite dentro uno `ZStack`.

In `ContentView`, usiamo queste due viste tramite `CardView()` e `AuthorView()`. Le `()` dopo il nome indicano la creazione e l’uso di questa vista.

Questo è un comune annidamento di viste in SwiftUI: dentro una vista, puoi continuare a usare altre viste.

## File di ingresso

Infine, rivediamo da dove l’App inizia a mostrare l’interfaccia.

In un progetto SwiftUI, di solito esiste un file di ingresso:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Qui, `@main` indica che questo è il punto di ingresso dell’App.

Dentro `WindowGroup`, vediamo:

```swift
ContentView()
```

Questo significa che, dopo l’avvio dell’App, viene mostrato prima `ContentView`.

Poi, dentro `ContentView`, viene mostrato anche:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Quindi la gerarchia delle viste può essere compresa così:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Se modifichiamo la vista mostrata nel file di ingresso in `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Allora, dopo l’avvio dell’App, verrà mostrata solo `CardView`.

In altre parole, il `WindowGroup` nel codice di ingresso decide quale vista viene mostrata per prima dopo l’avvio dell’App.

All’interno di questa vista, è possibile continuare a mostrare altre viste.

## Riepilogo

In questa lezione abbiamo imparato le operazioni più comuni di gestione dei file in Xcode.

Abbiamo visto come creare file SwiftUI, come rinominare file, come creare cartelle e come eliminare file.

Allo stesso tempo, abbiamo imparato anche un concetto importante: le viste SwiftUI possono essere separate in file diversi e poi usate dentro altre viste.

Per esempio:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Qui, `CardView()` e `AuthorView()` sono altre viste usate dentro `ContentView`.

Infine, abbiamo anche rivisto la logica di visualizzazione del file di ingresso.

Quando l’App si avvia, entra prima nel codice di ingresso contrassegnato con `@main`, quindi mostra la vista dentro `WindowGroup`.

Questo ci aiuta a capire che i diversi file SwiftUI non sono isolati tra loro: possono combinarsi a vicenda e alla fine formare un’interfaccia App completa.
