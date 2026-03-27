# Ciclo di vita delle viste SwiftUI

Nella lezione precedente abbiamo capito che le variabili `@State` seguono il ciclo di vita della vista, e abbiamo anche studiato l'uso di base di `onAppear`.

In questa lezione comprenderemo più a fondo il ciclo di vita delle viste SwiftUI, capiremo come una vista viene creata e mostrata, come vengono create e ricreate le variabili nella vista, e studieremo anche `onAppear`, `onDisappear` e il costruttore `init`.

Sulla base di queste conoscenze, costruiremo una comprensione complessiva dell'intero processo di costruzione di una vista SwiftUI.

## Ordine di avvio dell'applicazione

Quando si crea un progetto iOS, Xcode genera per default due file:

```
ContentView.swift
<NomeProgetto> + App.swift
```

Tra questi, `"<NomeProgetto> + App.swift"` è il file di ingresso di tutta l'applicazione.

Per esempio:

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

### Flusso di esecuzione del codice

Quando eseguiamo l'app (nel simulatore o su un dispositivo reale), il sistema cerca la parola chiave `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Dopo aver confermato il file di ingresso, il codice inizia a essere eseguito.

Per prima cosa entra nella struttura `App`, esegue il codice dentro `body`, poi crea il `WindowGroup` e carica al suo interno `ContentView`.

### Ruolo di WindowGroup

`WindowGroup` viene usato per gestire le finestre:

```swift
WindowGroup {
    ContentView()
}
```

Nei sistemi iPad / macOS è supportato il multi-finestra, mentre su iPhone di solito esiste una sola finestra.

Perciò, su iPhone `WindowGroup` gestisce principalmente la prima interfaccia mostrata.

### Processo di caricamento della vista

Dopo che il sistema ha trovato `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI eseguirà il codice dentro `body`, poi costruirà l'interfaccia in base alla struttura di vista restituita (come `VStack`, `Text` ecc.) e la mostrerà sullo schermo.

Dopo aver completato questi passaggi, potremo vedere `ContentView` nella vista.

![ContentView](../../Resource/016_view1.png)

È importante notare che il ruolo di `body` è generare la vista, non memorizzarla.

Questo significa che ogni volta che la vista viene aggiornata, SwiftUI ricalcola `body` e genera una nuova struttura di vista.

### Logica della vista di anteprima

L'anteprima di Xcode (Canvas) e l'esecuzione reale sono due meccanismi diversi.

Per esempio, se aggiungiamo un output di debug nel file di ingresso:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Quando si visualizza in anteprima la vista `ContentView` in Xcode, l'esecuzione non parte dall'ingresso `@main`, quindi `onAppear` nel file di ingresso non verrà attivato.

Tuttavia, se si esegue l'app nel simulatore o su un dispositivo reale, il sistema partirà da `@main`, seguirà il flusso completo dell'app e attiverà `onAppear` nell'ingresso, producendo l'output di debug.

Il punto chiave è che l'anteprima di Xcode è solo un "rendering locale", usato soltanto per mostrare la vista corrente; il simulatore e i dispositivi reali forniscono invece un "ambiente di esecuzione completo", che esegue l'intera app.

Perciò, quando si testa una funzione dell'app, bisogna fare riferimento al simulatore o al dispositivo reale: l'anteprima di Xcode non può fornire un ambiente di esecuzione completo.

## Ciclo di vita della vista

Nella fase attuale, tutto il nostro codice è concentrato in `ContentView`. Ma nelle applicazioni reali, un'app contiene normalmente più viste, che vengono cambiate in scenari diversi.

Per esempio, nel "salvadanaio":

![PiggyBank](../../Resource/016_view.png)

Quando si tocca "Salva denaro", viene mostrata la vista `SaveView`; quando il salvataggio termina o la finestra viene chiusa, `SaveView` viene rimossa.

Questo processo costituisce il ciclo di vita di una vista: dalla sua creazione, alla sua visualizzazione, fino alla sua rimozione.

### Chiudere l'app

Quando l'app viene chiusa, tutte le viste vengono rimosse e gli stati correlati scompaiono.

Perciò `ContentView` e le altre viste verranno rimosse dalla memoria, e l'intero stato di esecuzione dell'app verrà svuotato.

## Ciclo di vita delle variabili dentro la vista

In SwiftUI, il ciclo di vita delle variabili è di solito legato alla vista.

Per esempio:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variabile @State

La variabile dichiarata con `@State` è legata al ciclo di vita della vista.

```swift
@State private var name = "FangJunyu"
```

Quando la vista viene creata, anche `name` viene creata; quando la vista viene rimossa, anche `name` viene distrutta.

Questo è il motivo per cui bisogna usare metodi come `UserDefaults` per realizzare la persistenza dei dati.

### Variabili dentro body

Le variabili definite dentro `body`:

```swift
var num = 10
```

Hanno un ciclo di vita legato al processo di esecuzione di `body`.

Quando lo stato di SwiftUI cambia, per esempio:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Quando `name` cambia, `@State` rileva la modifica dei dati e notifica SwiftUI di ricalcolare la vista; `body` verrà quindi ricalcolato.

Quando `body` viene ricalcolato, tutto il codice al suo interno viene eseguito di nuovo, e le variabili presenti in `body` (come `num`) vengono ricreate.

Questo è anche il motivo per cui non è consigliato definire variabili complesse dentro `body`.

Perché a ogni aggiornamento della vista, le variabili dentro `body` vengono ricreate, aumentando il costo di calcolo e influenzando le prestazioni.

In SwiftUI, tipi diversi di dati devono essere gestiti in modi diversi: i dati che devono seguire il ciclo di vita della vista possono essere salvati con `@State`; i dati temporanei di calcolo possono essere messi dentro `body`.

## onAppear e onDisappear

Nella lezione precedente abbiamo già studiato `onAppear`: quando la vista viene mostrata, `onAppear` viene chiamato.

```swift
.onAppear {}
```

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Durante l'anteprima in Xcode o l'esecuzione, si potrà vedere l'output di debug dentro `onAppear`.

### onDisappear

Il corrispondente di `onAppear` è `onDisappear`:

```swift
.onDisappear {}
```

Quando la vista viene chiusa, `onDisappear` viene chiamato.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quando la vista viene rimossa, verrà chiamato il codice dentro `onDisappear`.

Suggerimento: nella fase attuale, `ContentView` è la vista radice dell'app e non può essere chiusa o rimossa direttamente. Perciò in questa fase non è possibile osservare direttamente l'effetto di esecuzione di `onDisappear`.

Solo più avanti, quando studieremo il passaggio tra pagine e l'apertura di nuove viste, potremo vedere `onDisappear` in azione.

## Logica di creazione e visualizzazione

È importante notare che la creazione e la visualizzazione della vista sono due fasi diverse.

Quando la vista viene creata, viene chiamato il costruttore della `struct`:

```swift
init() {}
```

Poiché le viste SwiftUI sono strutture `struct`:

```swift
struct ContentView: View { ... }
```

Perciò, quando viene creata un'istanza della vista, viene eseguito il costruttore `init`. Solo quando la vista viene mostrata viene chiamato `onAppear`.

Per esempio:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quando si visualizza la vista in anteprima in Xcode, si può vedere l'output di debug:

```swift
Create ContentView
Show ContentView
```

Questo mostra che prima viene eseguito `init` per creare la vista, poi viene calcolato il codice in `body`, e infine la vista viene mostrata ed esegue `onAppear`.

Perciò è importante comprendere che la fase di creazione e quella di visualizzazione della vista sono separate.

### Costruttore init

`init` è sintassi di base di Swift: sia `struct` sia `class` possono definirlo, e serve a inizializzare un oggetto.

```swift
init() {}
```

In SwiftUI, quando una vista viene creata, il sistema chiama il metodo `init` della vista, che può essere usato per ricevere parametri e inizializzare dati.

Se non si scrive manualmente `init`, Swift genererà automaticamente un costruttore predefinito per la `struct`.

Per le viste SwiftUI come `ContentView`, quando la vista viene creata viene eseguito `init`, mentre quando la vista viene mostrata viene eseguito `onAppear`.

Perciò `init` è il costruttore che viene eseguito quando la vista viene creata, e verrà usato più avanti quando passeremo parametri o inizializzeremo dati.

## Riepilogo

In questa lezione abbiamo studiato l'ordine di avvio dell'applicazione, cioè il flusso di esecuzione dal file di ingresso fino al file `ContentView`.

Abbiamo capito il ciclo di vita delle viste SwiftUI: quando una vista viene creata esegue `init`, quando viene mostrata sullo schermo esegue `onAppear`, e quando viene rimossa o chiusa esegue `onDisappear`.

Abbiamo studiato anche il meccanismo di aggiornamento della vista: le viste sono guidate dallo stato, e quando stati come `@State` cambiano, SwiftUI aggiorna la vista, ricalcola `body` e ricrea anche le variabili dentro `body`.

Il ciclo di vita delle variabili è legato al ciclo di vita della vista, mentre le variabili temporanee dentro `body` vengono ricreate a ogni aggiornamento.

Capire questi comportamenti del ciclo di vita e delle variabili ci aiuta a organizzare meglio il codice e a rendere la logica dell'app più chiara.
