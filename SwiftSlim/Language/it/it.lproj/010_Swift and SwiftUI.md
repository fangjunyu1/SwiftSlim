# Swift e SwiftUI

Quando si studia lo sviluppo per le piattaforme Apple, molti tutorial tendono a spiegare Swift e SwiftUI separatamente. Questo può facilmente dare ai principianti una sensazione di frammentazione, portandoli a credere che siano due tecnologie completamente indipendenti.

In realtà, Swift e SwiftUI formano un insieme strettamente integrato: Swift è il linguaggio di programmazione, responsabile della logica e dei dati; SwiftUI invece è un framework di interfaccia utente costruito su Swift, responsabile del rendering delle viste e dell'interazione.

Questa lezione ti aiuterà a costruire un quadro mentale chiaro: che cos'è Swift, che cos'è SwiftUI e come collaborano nel codice.

## Che cos'è Swift?

Swift è un linguaggio di programmazione moderno lanciato da Apple, usato per sviluppare applicazioni sulle piattaforme iOS, macOS, watchOS e tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift è un linguaggio fortemente tipizzato e statico, progettato con maggiore attenzione alla sicurezza, così da ridurre molti errori comuni di programmazione (come puntatori nulli, accessi fuori limite ecc.), e supporta un'integrazione senza soluzione di continuità con C e Objective-C.

Nello sviluppo reale, Swift si occupa soprattutto della parte logica dell'applicazione, come elaborazione dei dati, richieste di rete, operazioni di archiviazione e così via.

## Che cos'è SwiftUI?

SwiftUI è un nuovo framework per la costruzione di interfacce lanciato da Apple nel 2019. SwiftUI adotta il paradigma della programmazione dichiarativa, che permette agli sviluppatori di descrivere la struttura dell'interfaccia e il comportamento interattivo con codice più conciso.

![swiftui](../../RESOURCE/010_swiftui.png)

La programmazione dichiarativa significa che lo sviluppatore deve solo dire al sistema che cosa desidera mostrare, e il sistema aggiornerà automaticamente la vista in base ai cambiamenti dei dati. Non è più necessario aggiornare manualmente lo stato dell'interfaccia, e questo semplifica notevolmente la complessità dello sviluppo UI.

Il nucleo di SwiftUI è formato dai componenti di vista (come `Text`, `Image`, `Button` ecc.) e dai contenitori di layout (come `VStack`, `HStack`, `ZStack`). Questi componenti interagiscono attraverso il binding dei dati e la gestione dello stato, così che l'interfaccia possa rispondere ai cambiamenti dei dati e aggiornarsi automaticamente.

## Come collaborano Swift e SwiftUI?

I ruoli di Swift e SwiftUI si possono riassumere così:

**1. Swift: gestione della logica e dei dati**

Swift viene usato principalmente per gestire dati, salvare stato ed eseguire logica. Questo codice in genere non influisce direttamente sul rendering dell'interfaccia, ma si occupa dell'elaborazione di dati e comportamenti.

Per esempio, elaborare dati in Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Questo codice coinvolge dichiarazioni di variabili, definizioni di costanti, funzioni, flusso di controllo ecc., ma non influisce direttamente sulla presentazione della vista.

**2. SwiftUI: dichiarare e renderizzare l'interfaccia**

SwiftUI invece viene usato per costruire layout e contenuti dell'interfaccia utente, occupandosi soprattutto del rendering dell'interfaccia e dell'interazione con la vista.

Per esempio, usare SwiftUI per creare una vista di testo:

```swift
Text("SwiftSlim")
```

Tutto questo è codice usato per costruire e controllare gli elementi dell'interfaccia, e interagisce direttamente con la UI.

### Esempio di base

Qui sotto c'è un semplice esempio SwiftUI:

```swift
// ContentView.swift

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

In questo esempio:

**Codice SwiftUI**: `VStack`, `Image`, `Text`, `padding` appartengono tutti a SwiftUI e sono responsabili della presentazione e del layout dell'interfaccia.

**Codice Swift**: i commenti `//` nella parte alta del file e `import SwiftUI` fanno parte della struttura del codice Swift; `#Preview` in fondo è una macro usata per l'anteprima in Xcode e non partecipa al rendering reale dell'interfaccia.

### Esempio più avanzato

Nei progetti reali, Swift e SwiftUI vengono spesso usati insieme per completare i compiti in cui ciascuno è più adatto:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

In questo esempio:

**Codice SwiftUI**: `@State` è un property wrapper specifico di SwiftUI, usato per dichiarare uno stato modificabile della vista; `Button` e `Text` sono componenti di vista SwiftUI, responsabili della visualizzazione dell'interfaccia e dell'interazione dell'utente.

**Codice Swift**: `private var name` e `func printName()` sono codice Swift, usato per memorizzare dati ed eseguire logica, senza influire direttamente sul rendering della vista.

Quando l'utente tocca il pulsante, SwiftUI attiva il codice dell'operazione dentro il pulsante:

```swift
Button("Print") {
    printName()
}
```

Qui `Button` è un componente SwiftUI, mentre la funzione `printName()` che viene eseguita è codice Swift responsabile della logica concreta.

Questa collaborazione permette a Swift e SwiftUI di integrarsi senza soluzione di continuità: Swift si occupa dei dati e della logica, SwiftUI della presentazione dell'interfaccia utente.

## In quale posizione si scrive di solito il codice Swift e SwiftUI?

In SwiftUI, l'interfaccia viene costruita attraverso la vista restituita dalla proprietà `body`. Perciò tutto il codice che serve a descrivere l'interfaccia viene in genere scritto dentro `body`.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

In questo esempio, `Text` è un componente di vista SwiftUI, quindi deve essere scritto dentro `body`, perché SwiftUI userà `body` per leggere e generare l'interfaccia.

Il codice che non riguarda direttamente l'interfaccia, come variabili, funzioni o logica di elaborazione dei dati, di solito viene scritto fuori da `body`. Per esempio:

```swift
struct ContentView: View {

    // Swift: dati o logica
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interfaccia
    var body: some View {
        Text(name)
    }
}
```

Va notato che dentro `body` si può comunque usare la sintassi Swift, per esempio istruzioni di controllo del flusso come `if` e `for`; servono semplicemente a controllare la generazione delle viste SwiftUI:

```
if isLogin {
    Text("Welcome")
}
```

Perciò, nello sviluppo SwiftUI, possiamo capire in modo semplice che: il codice delle viste (`Text`, `Image`, `Button` ecc.) viene di solito scritto dentro `body`; il codice di dati e logica (variabili, funzioni ecc.) viene di solito scritto fuori da `body`.

## File Swift

Man mano che lo studio si approfondisce, entreremo anche in contatto con l'architettura MVVM, nella quale i livelli ViewModel e Model sono di solito costituiti da puro codice Swift, completamente separato dal livello di vista (SwiftUI).

Per esempio, una classe usata per gestire lo stato dell'app:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Oppure una struttura che descrive una struttura dati:

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Il compito di questo tipo di file è gestire e persistere i dati; non vengono mostrati direttamente nella vista, perciò appartengono completamente a Swift.

## Contesto storico

Per capire il rapporto tra Swift e SwiftUI, bisogna anche conoscere l'evoluzione delle tecnologie di sviluppo Apple. Fino al 2026, questo stack tecnologico ha attraversato più iterazioni.

### La storia di Swift

Prima della comparsa di Swift, Objective-C era il principale linguaggio di programmazione delle piattaforme Apple e supportava l'uso misto con il linguaggio C. La sua sintassi era piuttosto verbosa e, per chi iniziava, la soglia d'ingresso era più alta:

```Obj-c
// Scrittura in Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

Nel 2014, Apple ha pubblicato il linguaggio Swift durante la WWDC. Swift ha una sintassi più moderna, una sicurezza dei tipi più alta e ha progressivamente sostituito Objective-C come linguaggio di sviluppo principale:

```swift
// Scrittura in Swift
let name = "Fang"
print("Hello, \(name)")
```

Tuttavia, Objective-C non è uscito subito dalla scena storica: è ancora ampiamente usato in molti progetti esistenti e nei framework di basso livello. Conoscerne la sintassi di base resta utile per mantenere vecchi progetti e capire i livelli più profondi del sistema.

### La storia di SwiftUI

Prima della comparsa di SwiftUI, iOS usava **UIKit** e macOS usava **AppKit**. Questi due framework adottavano un approccio di programmazione "imperativo". Gli sviluppatori dovevano controllare lo stato della vista trascinando controlli nello Storyboard o scrivendo manualmente codice; il volume di codice era grande e il costo di manutenzione elevato, soprattutto quando la logica dell'interfaccia diventava complessa.

![storyboard](../../RESOURCE/010_xcode.png)

Nel 2019, Apple ha annunciato ufficialmente SwiftUI durante la WWDC. SwiftUI ha introdotto il paradigma della programmazione "dichiarativa", semplificando in modo significativo il processo di sviluppo dell'interfaccia utente.

![storyboard](../../RESOURCE/010_xcode1.png)

Vale la pena notare che SwiftUI non è un'implementazione di basso livello completamente indipendente. Su ogni piattaforma, in sostanza effettua un bridge e una collaborazione con UIKit (iOS) o AppKit (macOS); il livello sottostante continua a dipendere da questi due framework per funzionare.

### Relazione tra Swift e UIKit/AppKit

Anche se Swift è un linguaggio di programmazione generico e può funzionare sulle piattaforme Apple, non può sostituire completamente UIKit o AppKit. Per alcune esigenze di interfaccia più complesse, o per funzionalità che SwiftUI non copre ancora, è ancora necessario ricorrere a UIKit o AppKit.

Per esempio, UIKit è già molto maturo nella gestione complessa dei view controller, negli effetti di animazione, nel riconoscimento dei gesti ecc., e ha accumulato una grande quantità di pratica verificata in produzione. Anche se SwiftUI continua a rafforzarsi in questi ambiti, in alcuni scenari di margine presenta ancora dei limiti.

Perciò molti sviluppatori usano nei progetti sia SwiftUI sia UIKit (o AppKit), sfruttando pienamente i vantaggi di entrambi.

Da questo punto di vista, SwiftUI può essere visto come un'incapsulazione di livello più alto di UIKit / AppKit. Mentre impari SwiftUI, comprendere in modo appropriato i concetti di base di UIKit e AppKit può aiutarti a prendere decisioni tecniche più ragionevoli nella manutenzione di progetti esistenti o nell'implementazione di funzioni complesse.

## Riepilogo

**Swift**: viene usato principalmente per scrivere logica, elaborazione dati, controllo di flusso ecc., senza relazione diretta con il layout della vista.

**SwiftUI**: viene usato per costruire l'interfaccia utente in modo dichiarativo; il codice relativo al contenuto e al layout delle viste appartiene a SwiftUI.

Nello sviluppo reale, Swift e SwiftUI vengono di solito usati insieme: Swift gestisce la logica, SwiftUI gestisce l'interfaccia.

Da Objective-C e UIKit fino a Swift e SwiftUI, l'ambiente di sviluppo Apple si è gradualmente spostato verso modalità di programmazione più moderne e concise, ma UIKit e AppKit restano ancora importanti in molti progetti tradizionali.

Comprendendo il rapporto tra Swift e SwiftUI, possiamo sviluppare in modo più efficiente per iOS/macOS e anche prendere scelte tecniche più ragionevoli nella manutenzione di progetti esistenti.
