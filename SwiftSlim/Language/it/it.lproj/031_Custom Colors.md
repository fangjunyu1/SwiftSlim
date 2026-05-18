# Colori personalizzati

In questa lezione impareremo come personalizzare i colori in SwiftUI.

Nelle lezioni precedenti abbiamo già usato i colori predefiniti forniti da SwiftUI, per esempio:

```swift
Color.blue
Color.red
Color.green
```

Questi colori sono comodi da usare, ma nello sviluppo reale di un'App i colori predefiniti spesso non sono abbastanza precisi.

Per esempio, un progetto grafico potrebbe usare colori come questi:

```text
#2c54c2
#4875ed
#213e8d
```

Questo tipo di colore si chiama colore Hex.

In questa lezione faremo prima in modo che SwiftUI supporti i colori Hex, poi useremo `static` per organizzare i colori usati di frequente.

Infine, applicheremo i colori personalizzati alla vista dell'enciclopedia degli animali e useremo anche uno sfondo sfumato, così i pulsanti avranno più profondità visiva.

## Perché servono i colori personalizzati?

In SwiftUI possiamo usare direttamente i colori di sistema.

Per esempio:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Qui `.blue` indica il blu. In realtà è una forma abbreviata di `Color.blue`.

Il vantaggio dei colori predefiniti è che sono semplici e comodi, ma le opzioni disponibili sono limitate.

Per esempio:

```swift
Color.blue
```

Questo può rappresentare solo il blu predefinito fornito da SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Tuttavia, nello sviluppo reale abbiamo spesso bisogno di colori più specifici.

Per esempio, anche se sono tutti blu, possono esserci effetti diversi come azzurro, blu scuro, blu grigiastro e blu acceso.

![More Blue](../../../Resource/031_color5.png)

A questo punto, se usiamo solo `Color.blue`, sarà difficile riprodurre l'effetto del progetto grafico.

Per questo dobbiamo fare in modo che SwiftUI supporti i colori personalizzati.

## Che cos'è un colore Hex?

I colori sullo schermo sono solitamente composti da tre canali: rosso, verde e blu. Questo è RGB.

RGB significa:

```text
Red     // Rosso
Green   // Verde
Blue    // Blu
```

Un colore Hex è un modo per rappresentare un colore RGB.

Per esempio:

```swift
#5479FF
```

Questo valore di colore può essere compreso semplicemente come tre parti:

```text
54  // Rappresenta il canale rosso
79  // Rappresenta il canale verde
FF  // Rappresenta il canale blu
```

In questa lezione non è necessario calcolare questi valori e non è necessario comprendere a fondo le regole esadecimali.

Per ora dobbiamo solo sapere che `#5479FF` rappresenta un colore specifico.

In futuro, quando vedremo forme come `#2c54c2` e `#4875ed`, potremo prima considerarle come valori di colore.

Anche negli strumenti di progettazione come Sketch, Figma e Photoshop si vedono spesso valori di colore simili.

![color](../../../Resource/031_color.png)

Tuttavia, SwiftUI per impostazione predefinita non permette di scrivere direttamente così:

```swift
Color(hex: "#5479FF")
```

Per questo dobbiamo estendere noi stessi il tipo `Color`, in modo che supporti la creazione di colori da stringhe Hex.

## Creare il file Color+Hex.swift

Per prima cosa, creiamo un nuovo file Swift.

Il nome del file può essere:

```text
Color.swift
```

Può anche essere scritto in modo più chiaro come:

```text
Color+Hex.swift
```

Qui è più consigliato usare:

```text
Color+Hex.swift
```

Nei progetti Swift, nomi di file come `Color+Hex.swift` sono molto comuni.

Significa che questo file è un file di estensione che aggiunge a `Color` la capacità di usare Hex.

Il nome del file non influisce direttamente sull'esecuzione del codice. Serve solo ad aiutarci a capire più facilmente lo scopo del file.

## Aggiungere il codice Color(hex:)

Nel file `Color+Hex.swift`, scrivi il codice seguente:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Questo codice usa `extension` per estendere il tipo `Color` e aggiunge a `Color` un nuovo inizializzatore:

```swift
init(hex: String)
```

Dopo aver aggiunto questo inizializzatore, possiamo passare una stringa Hex a `Color` per creare un colore personalizzato:

```swift
Color(hex: "#5479FF")
```

All'interno di questo codice di estensione, la stringa Hex viene convertita in un colore RGB che SwiftUI può riconoscere.

In questa fase non serve comprendere a fondo la logica di conversione di ogni riga. Basta sapere che il metodo `Color(hex:)` aggiunto ci permette di creare colori personalizzati tramite valori di colore Hex.

## Usare colori personalizzati

Ora possiamo testare i colori personalizzati in `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Effetto visualizzato:

![color](../../../Resource/031_color1.png)

In questo esempio, la prima riga usa un colore di sistema:

```swift
.foregroundStyle(Color.blue)
```

Le tre righe successive usano colori Hex personalizzati:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Dal confronto possiamo vedere che il blu di sistema ha un solo effetto predefinito.

I colori Hex, invece, possono rappresentare variazioni di blu più dettagliate.

Questo è il valore dei colori personalizzati: possono rendere i colori dell'interfaccia più vicini al progetto reale e ci permettono di controllare più facilmente lo stile visivo di un'App.

## Usare static per organizzare i colori

Ora possiamo già creare colori tramite stringhe Hex:

```swift
Color(hex: "#2c54c2")
```

Questa scrittura funziona normalmente, ma se lo stesso colore compare più volte in punti diversi, la manutenzione successiva diventa poco comoda.

Se questo valore di colore viene scritto in 10 punti diversi, quando in futuro vorremo modificare questo blu dovremo modificarli uno per uno.

A questo punto possiamo usare `static` per organizzare in un unico posto i colori usati di frequente.

In fondo al file `Color+Hex.swift`, continua ad aggiungere il codice seguente:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Qui abbiamo aggiunto a `Color` tre proprietà statiche: `animalBlue`, `animalLightBlue` e `animalDarkBlue`. Rappresentano diversi toni di blu.

Poiché queste proprietà usano `static`, appartengono al tipo `Color` stesso.

Quando le usiamo, possiamo accedervi direttamente tramite `Color.`:

```swift
Color.animalBlue
```

Questa scrittura è più chiara rispetto a scrivere direttamente una stringa Hex.

Quando vediamo `Color.animalBlue`, possiamo sapere che rappresenta il blu usato nell'enciclopedia degli animali.

Quando invece vediamo `Color(hex: "#2c54c2")`, possiamo sapere solo che è un valore di colore, ma non è facile capire il suo uso specifico.

Gestire i colori in modo centralizzato ha anche un altro vantaggio: le modifiche successive sono più comode.

Se vogliamo regolare il colore principale dell'enciclopedia degli animali, dobbiamo modificare solo il punto in cui è definito:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Tutti i punti che usano questo colore verranno aggiornati insieme.

Questo è il significato di usare `static` per organizzare i colori: rende i nomi dei colori più chiari e rende più comoda la manutenzione successiva.

## Applicarlo all'enciclopedia degli animali

Ora possiamo applicare i colori personalizzati alla vista dell'enciclopedia degli animali usata in precedenza.

Prima, lo sfondo del pulsante dell'animale era bianco:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Ora possiamo cambiarlo in un colore personalizzato:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Qui `Color.animalBlue` è il colore statico che abbiamo appena definito in `Color+Hex.swift`.

Il testo del pulsante usa il bianco:

```swift
.foregroundStyle(Color.white)
```

Lo sfondo dell'emoji dell'animale usa un bianco semitrasparente:

```swift
.background(Color.white.opacity(0.15))
```

In questo modo il pulsante forma uno stile visivo blu uniforme.

Il punto centrale di questo passaggio non è aggiungere codice complesso, ma applicare davvero all'interfaccia i colori personalizzati imparati prima.

## Usare uno sfondo sfumato

Oltre a usare un colore singolo, possiamo anche combinare più colori per ottenere un effetto sfumato.

Per esempio, prima abbiamo definito questi colori:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Questi colori non solo possono essere usati singolarmente, ma possono anche essere combinati in uno sfondo sfumato.

In SwiftUI possiamo usare `LinearGradient` per creare una sfumatura lineare.

Per esempio:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Questo codice crea uno sfondo sfumato da sinistra a destra, con il colore che passa gradualmente da `Color.animalBlue` a `Color.animalLightBlue`.

Qui `colors` serve a impostare i colori che partecipano alla sfumatura, mentre `startPoint` ed `endPoint` servono a controllare la direzione della sfumatura.

### Testare l'effetto sfumato

Possiamo usare un semplice Text per testare lo sfondo sfumato.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Effetto visualizzato:

![color](../../../Resource/031_color3.png)

In questo esempio, lo sfondo di `Text` non è più un colore singolo, ma un colore sfumato che cambia gradualmente da sinistra a destra.

Rispetto a un normale colore di sfondo, uno sfondo sfumato ha più profondità e può creare più facilmente un punto visivo importante nell'interfaccia.

## Usare uno sfondo sfumato nell'enciclopedia degli animali

Ora possiamo cambiare il colore di sfondo del pulsante dell'animale:

```swift
.background(Color.animalBlue)
```

in uno sfondo sfumato:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Il codice completo è il seguente:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Effetto visualizzato:

![color](../../../Resource/031_color4.png)

Ora il pulsante dell'animale non è più solo uno sfondo a colore singolo, ma ha un effetto sfumato da sinistra a destra.

Rispetto a uno sfondo a colore singolo, uno sfondo sfumato può rendere l'interfaccia più stratificata e più vicina al design visivo di un'App reale.

## Differenza tra sfondo a colore singolo e sfondo sfumato

Uno sfondo a colore singolo usa un solo colore.

Per esempio:

```swift
.background(Color.animalBlue)
```

Questa scrittura è semplice e chiara, ed è adatta alla maggior parte delle interfacce di base.

Uno sfondo sfumato usa più colori.

Per esempio:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Questa scrittura può rendere l'interfaccia più stratificata, ma può anche aumentare più facilmente la complessità visiva.

Perciò, nello sviluppo reale, possiamo capirla così:

Gli sfondi a colore singolo sono adatti a testi normali, pulsanti normali, schede normali e sfondi di pagina normali.

Gli sfondi sfumati sono adatti a pulsanti principali, aree superiori, schede di copertina, ingressi a funzionalità e altre posizioni che devono essere evidenziate.

## Riepilogo

In questa lezione abbiamo imparato come usare colori personalizzati in SwiftUI.

Per prima cosa abbiamo conosciuto i colori Hex.

Per esempio:

```text
#2c54c2
```

Rappresenta un colore specifico.

Poi abbiamo usato `extension Color` per estendere il tipo `Color`.

Questo permette a SwiftUI di creare colori nel modo seguente:

```swift
Color(hex: "#2c54c2")
```

Successivamente abbiamo usato `static` per organizzare i colori usati di frequente:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

In questo modo, in altre viste possiamo usarlo direttamente:

```swift
Color.animalBlue
```

Rispetto a scrivere ogni volta stringhe Hex, questo approccio è più chiaro e rende più comoda la modifica uniforme dei colori in futuro.

Infine abbiamo imparato `LinearGradient` e abbiamo combinato colori personalizzati in uno sfondo sfumato:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Attraverso questa lezione abbiamo completato il processo da "creare colori personalizzati" a "usare i colori in un'interfaccia reale".

In futuro, quando un colore dovrà essere usato ripetutamente in più punti, possiamo considerare prima di organizzarlo in un'estensione di `Color`.

In questo modo il codice sarà più chiaro e lo stile dell'interfaccia sarà più facile da uniformare.
