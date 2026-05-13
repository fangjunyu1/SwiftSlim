# Capire le view

In questa lezione torniamo al `ContentView` dell'inizio.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Quando abbiamo incontrato SwiftUI per la prima volta, in `ContentView` c'erano molte parole chiave che non capivamo.

Per esempio parole chiave come `struct`, `View`, `var`, `body`, `some View` e così via.

Allora forse sapevamo solo questo: **se scriviamo il codice dentro `body`, il contenuto verrà mostrato sull'interfaccia.**

Ora abbiamo già studiato `struct`, variabili, metodi e protocolli, quindi possiamo rileggere questo codice e usarlo per capire meglio il rapporto tra le view di SwiftUI.

## Rivedere ContentView

Dopo aver creato un progetto SwiftUI, Xcode genera per impostazione predefinita un file `ContentView`.

Il codice di esempio è il seguente:

```swift
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
```

Possiamo capire questo codice dividendolo in alcune parti.

Prima di tutto:

```swift
import SwiftUI
```

Questa riga di codice indica che importiamo il framework SwiftUI.

Dopo aver importato SwiftUI, possiamo usare view SwiftUI come `View`, `Text`, `Image`, `VStack`, `Button` e altre.

## La struttura ContentView

Questa riga di codice indica che stiamo creando una struttura:

```swift
struct ContentView: View
```

In cui:

```swift
struct ContentView
```

significa che `ContentView` è una struttura.

Nella lezione precedente abbiamo conosciuto la struttura `struct`. Può combinare insieme diversi campi e può contenere proprietà e metodi.

Per esempio:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hello, world!")
    }
}
```

In questo esempio, dentro `ContentView` ci sono tre contenuti: `name`, `printName` e `body`.

In altre parole, `struct` può organizzare insieme proprietà, metodi e contenuto della view che sono collegati tra loro.

![contentView](../../Resource/023_contentVIew.png)

## View è un protocollo

Continuiamo a guardare questa riga di codice:

```swift
struct ContentView: View 
```

Il `View` dopo i due punti indica: `ContentView` segue il protocollo `View`.

Possiamo capirlo così: se `ContentView` vuole diventare una view SwiftUI, deve soddisfare i requisiti del protocollo `View`.

### Protocollo Identifiable

Quando in precedenza abbiamo studiato la lista dei film, abbiamo incontrato il protocollo `Identifiable`.

Allora dovevamo attraversare l'array `Movie` dentro `ForEach`, ma la struttura `Movie` non aveva un identificatore univoco, quindi non supportava l'attraversamento con `ForEach`.

In quel momento dovevamo fare in modo che la struttura `Movie` seguisse il protocollo `Identifiable`, così da rispettare il requisito di `ForEach` sull'identificatore univoco.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Il protocollo `Identifiable` richiede: **questo tipo ha un campo `id` che lo identifica.**

Quando `Movie` fornisce un campo `id`, può soddisfare il requisito di `Identifiable`.

Così, quando lo usiamo in `ForEach`, SwiftUI può riconoscere ogni dato.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protocollo View

Anche il protocollo `View` funziona così.

Se un tipo vuole diventare una view SwiftUI, deve seguire il protocollo `View`.

E il requisito più importante del protocollo `View` è fornire un `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

Possiamo capirlo così: il protocollo `View` richiede: **accetta solo la view SwiftUI restituita da `body`, mentre `ContentView` mostra la view SwiftUI attraverso `body`.**

### Cosa succede se non seguiamo View?

Se scriviamo così:

```swift
struct ContentView {
}
```

Questa è solo una struttura normale, non una view SwiftUI.

Non darà direttamente errore, perché una struttura normale è di per sé codice Swift valido.

Ma se la mettiamo nella preview:

```swift
#Preview {
    ContentView()
}
```

A questo punto comparirà un errore.

Il motivo è: **la preview deve mostrare una view SwiftUI, mentre questo `ContentView` non segue il protocollo `View`.**

Perciò, se vogliamo che `ContentView` possa essere mostrato sull'interfaccia, dobbiamo farlo seguire al protocollo `View`:

```swift
struct ContentView: View {
}
```

Allo stesso tempo, secondo il requisito del protocollo `View`, dobbiamo fornire `body`. Se non c'è `body`, il compiler segnalerà comunque un errore.

Scrittura corretta:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```

A questo punto `ContentView` è davvero una view SwiftUI che può essere mostrata.

## body è l'ingresso per mostrare la view

In SwiftUI, `body` è l'ingresso del contenuto della view.

```swift
var body: some View {
    Text("Hello, world!")
}
```

Qui possiamo dividerlo in tre parti:

**1. var body**

```swift
var body
```

Indica che definiamo una variabile chiamata `body`.

**2. some View**

```swift
: some View
```

Indica che questo `body` restituirà una view.

**3. { ... }**

```swift
{
    Text("Hello, world!")
}
```

Indica il contenuto della view da mostrare. In questo codice viene mostrata una view `Text`.

In altre parole, ciò che viene scritto dentro `body` è ciò che viene mostrato sull'interfaccia.

Per esempio:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Name:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Questo codice significa: **sull'interfaccia viene mostrato un contenuto disposto verticalmente, con due testi al suo interno.**

### Il nome body non può essere cambiato a piacere

Bisogna fare attenzione: il nome `body` non può essere modificato liberamente.

Se scriviamo:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hello, world!")
    }
}
```

Questo `content` è anch'esso una proprietà di view, ma non può sostituire `body`.

Perché il nome richiesto dal protocollo `View` è proprio `body`.

## Che cos'è some View?

In SwiftUI, `some View` significa restituire una view concreta, solo che non è necessario scrivere il tipo completo di questa view.

```swift
var body: some View
```

In altre parole, `some View` non significa che non ci sia un tipo. Il tipo reale esiste ancora, il compiler lo conosce, ma questo tipo può essere molto complesso, quindi Swift ci permette di nasconderlo usando `some View`.

### Che cos'è some?

In Swift, `some` è una parola chiave usata per dichiarare un tipo opaco, cioè opaque type.

Il significato di tipo opaco è: **il valore restituito ha un tipo concreto, il compiler sa qual è questo tipo concreto, ma noi non lo scriviamo direttamente.**

Per esempio:

```swift
func makeView() -> some View {
    Text("Hello")
}
```

Questo indica che `makeView` restituirà un tipo concreto che segue il protocollo `View`.

### Perché serve some?

Quando abbiamo studiato le variabili, abbiamo imparato che: **i valori in Swift devono avere un tipo annotato esplicitamente, oppure il compiler deve dedurlo automaticamente.**

Per esempio:

```swift
let a: Int = 10
```

Qui la costante `a` è di tipo `Int`.

Le view SwiftUI non fanno eccezione. Quando usiamo `body` per mostrare una view SwiftUI, dobbiamo fare in modo che `body` restituisca il tipo SwiftUI corrispondente.

Per esempio, se usiamo `body` per mostrare una view di testo `Text`, dobbiamo fare in modo che `body` restituisca il tipo `Text` corrispondente.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

In questo esempio, dentro `body` viene mostrata una view `Text`, e anche il tipo restituito è `Text`.

Solo quando il tipo interno e il tipo dichiarato coincidono, si soddisfa il requisito di coerenza dei tipi del compiler.

**Problema di tipi non coerenti**

Se impostiamo il tipo di `body` su `Color`, ma mostriamo un `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

Il tipo di `body` e il tipo del codice interno non sono coerenti, quindi si attiverà un errore di tipo non corrispondente.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

A questo punto dobbiamo modificare manualmente il tipo restituito da `body`.

**Tipi di view complessi**

Nello sviluppo reale, di solito l'interfaccia non contiene solo un `Text`.

Se dobbiamo mostrare un `VStack` più complesso, dovremmo annotare manualmente un tipo restituito complesso.

Per esempio:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hello, world!")
    }
}
```

Questo codice indica che viene restituito un `VStack`, al cui interno ci sono view di tipo `Image` e `Text`.

Il tipo restituito da `body` è:

```swift
VStack<TupleView<(Image,Text)>>
```

Si può vedere che questo tipo restituito è molto complesso, e contiene anche un nuovo `TupleView` che non avevamo visto prima.

Qui `TupleView` può essere capito così: **incapsulare più child view in una sola view.**

**Tipi di view ancora più complessi**

Se aggiungiamo modificatori alla view:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Allora il tipo restituito da questa view diventa molto complesso e non è possibile descriverlo concretamente qui.

Il tipo restituito esistente `VStack<TupleView<(Image,Text)>>` non riesce a descrivere i modificatori, quindi si verifica un errore.

**some View semplifica il tipo restituito**

Per questa situazione, SwiftUI offre una soluzione concisa: usare `some View` per semplificare la scrittura.

Quando cambiamo `body` nel tipo `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
    }
    .padding()
}
```

Ogni volta che modifichiamo il codice della view, non dobbiamo più scrivere il tipo restituito completo.

Questo perché `some View` significa restituire una view concreta che segue il protocollo `View`.

In altre parole, le view SwiftUI come `VStack`, `Image` e così via seguono tutte il protocollo `View`. Anche il tipo di view restituito dopo aver aggiunto modificatori continua a seguire il protocollo `View`.

Quindi possono tutte essere restituite come `some View`.

### some View non può restituire qualunque view a piacere

Anche se `some View` può nascondere tipi complessi, non significa che sia "senza tipo".

La sua regola fondamentale è: **il compiler deve poter determinare un tipo restituito concreto**.

Per esempio:

```swift
var title: some View {
    Text("Hello")
}
```

Qui la view restituita è `Text`.

Ma se proviamo a restituire due view, si verifica un errore:

```swift
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

Perché `some View` alla fine deve restituire una struttura di view, mentre qui si tenta di restituire due view indipendenti.

### Soluzione

Di solito ci sono due soluzioni: un contenitore e `@ViewBuilder`.

**1. Avvolgere con un contenitore**

```swift
var title: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

In questo codice, `title` restituisce un `VStack`, mentre `Text` e `Image` sono child view dentro `VStack`.

La struttura di view accettata da `some View` è un `VStack<...>`, quindi soddisfa il requisito di `some View` di restituire una sola struttura di view. 

Questo è anche il motivo per cui, fin dall'inizio dello studio di SwiftUI, consigliamo di usare un contenitore `VStack` nel livello più esterno per avvolgere il codice della view.

**2. Usare @ViewBuilder**

Possiamo anche aggiungere il modificatore `@ViewBuilder` davanti a `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hello")
    Image(systemName: "star")
}
```

`@ViewBuilder` può combinare più view in un unico risultato restituito.

La sua essenza è comunque unire più view in una sola view, per soddisfare il requisito di `some View` di restituire una sola struttura di view.

### Perché body può scrivere direttamente più view?

Se scriviamo più view dentro `var body`, per esempio:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

In alcuni casi, un `body` scritto così non darà errore.

Il motivo è che, nel protocollo `View`, `body` supporta `@ViewBuilder` per impostazione predefinita:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Nel codice sorgente del protocollo `View`, possiamo vedere che `@ViewBuilder` ha già modificato la variabile `body`.

Perciò `body`, rispetto a un normale `some View`, ha uno strato di trattamento speciale in più, e SwiftUI ci aiuta automaticamente a combinare più view in una sola view.

**Si consiglia di usare un contenitore**

Per renderlo più facile da capire per i principianti, si consiglia di usare prima contenitori come `VStack`, `HStack`, `ZStack`, `Group` e simili per organizzare più view.

Per esempio:

```swift
var body: some View {
    VStack {
        Text("Hello")
        Image(systemName: "star")
    }
}
```

Così il codice è più intuitivo: **il livello esterno è un `VStack`, e dentro ci sono due child view.**

## Suddividere le view

Se l'interfaccia è relativamente semplice, possiamo scrivere tutto il codice dentro `body`.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Benvenuto in Qinote")
                Text("Buongiorno")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("cliccami") {
                print("cliccami ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Lo stile di visualizzazione di questa view:

![view](../../Resource/023_view1.png)

Questo codice può funzionare normalmente, ma se il codice della view diventa molto complesso, il codice dentro `body` diventerà sempre più lungo, e leggere e modificare diventerà sempre più difficile.

A questo punto possiamo suddividere le diverse aree in proprietà di view indipendenti.

### Suddividere la view superiore

Per esempio, estraiamo l'area superiore:

```swift
var topHome: some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Qui `topHome` è una variabile che restituisce una view.

Poiché ciò che viene restituito è una view, il tipo può essere scritto come:

```swift
some View
```

In realtà questo è lo stesso uso di `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Entrambi usano una variabile per mostrare una view, e il tipo restituito è `some View`.

### Suddividere altre view

Poi continuiamo a suddividere le altre parti:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Benvenuto in Qinote")
        Text("Buongiorno")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Cliccami") {
        print("cliccami")
    }
    .buttonStyle(.borderedProminent)
}
```

Dopo la suddivisione, possiamo mettere le variabili di view dentro `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Benvenuto in Qinote")
            Text("Buongiorno")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Cliccami") {
            print("cliccami")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Ora `body` è responsabile solo di descrivere la struttura della pagina:

```swift
topBar
welcomeText
colorList
clickButton
```

L'implementazione concreta di ogni parte viene messa nella proprietà corrispondente sotto.

Questo modo di suddividere le view può rendere più chiara la struttura della pagina. Ogni area della view ha il proprio nome, quindi la lettura è più intuitiva.

Quando si modifica il codice di una certa parte, si può trovare direttamente l'area di view corrispondente, invece di cercare il codice in un insieme complesso.

### some View restituisce una sola view

In questa view suddivisa, se proviamo a restituire più view:

```swift
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` può restituire solo una struttura di view, quindi si verifica un errore.

A differenza di `body`, una normale proprietà calcolata non ha `@ViewBuilder` per impostazione predefinita.

Perciò, se dobbiamo restituire più view, possiamo usare un contenitore `VStack`, `HStack` oppure `Group` per combinare più view in una sola.

```swift
var topBar: some View {
    VStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Oppure aggiungere `@ViewBuilder` per combinare le view:

```swift
@ViewBuilder
var topBar: some View {
    Text("Home")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Così possiamo restituire più view.

### if restituisce più view

Per esempio:

```swift
var topHome: some View {
    if step == "Home" {
        HStack {
            Text("Home")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Niente")
    }
}
```

In questo codice, `topHome` restituisce, in base al contenuto di `step`, due tipi diversi di view: `HStack` oppure `Text`.

Poiché `some View` richiede un tipo restituito concreto e determinato, i due rami di `if` in una normale proprietà calcolata non possono restituire direttamente view di tipi diversi, quindi si verifica un errore.

**La soluzione resta avvolgere con un contenitore oppure usare il modificatore `@ViewBuilder`.**

### Perché le view suddivise non usano parentesi

Quando usiamo dentro `body` le proprietà di view estratte, scriviamo direttamente:

```swift
topBar
welcomeText
colorList
clickButton
```

invece di scrivere:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Questo perché `topBar`, `welcomeText`, `colorList`, `clickButton` sono variabili. Queste variabili in realtà sono proprietà calcolate, non metodi.

**Le proprietà non hanno bisogno di parentesi.**

Se le scriviamo come metodi, possiamo ottenere un effetto simile:

```swift
func topBar() -> some View {
    HStack {
        Text("Home")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Anche questo codice può ottenere un effetto simile. Chiamare questo metodo restituisce una view.

Quando lo usiamo, dobbiamo scriverlo così:

```swift
topBar()
```

In SwiftUI, se stiamo solo suddividendo una view che non richiede parametri in ingresso, è più comune usare una proprietà calcolata.

```swift
var topBar: some View { ... }
```

## View annidate

Oltre a suddividere il codice in proprietà, possiamo anche creare nuove strutture di view.

Per esempio:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
    }
}
```

Questo `PinkColorView`, come `ContentView`, è una view SwiftUI indipendente.

Se dobbiamo mostrarla dentro `ContentView`, possiamo aggiungere `()` dopo il nome della view.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Qui:

```swift
PinkColorView()
```

significa creare un'istanza di `PinkColorView`.

Poiché `PinkColorView` segue il protocollo `View`, può essere inserita e mostrata in altre view proprio come `Text`, `Image`, `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Questa è l'annidamento delle view: una view può essere mostrata dentro un'altra view.

## Proprietà di view o creare una nuova view?

Quando il codice della view è relativamente semplice, di solito non è necessario suddividerlo. Solo quando il codice è più complesso è consigliabile suddividere la view.

### Caso in cui usare una proprietà di view

Se si tratta solo di una piccola parte di contenuto nella view corrente, possiamo usare una proprietà di view.

Per esempio:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Questi contenuti di solito vengono usati solo nella view corrente.

### Caso in cui creare una nuova view

Se questi contenuti sono relativamente indipendenti, oppure in futuro potrebbero essere riutilizzati in più pagine, è più adatto creare una nuova view.

Per esempio:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Questa è una view titolo. Se vogliamo usarla come componente comune e riutilizzarla in altre view.

Possiamo creare una nuova view:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Poi usarla in altri punti:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

A questo punto questa view è un componente indipendente e riutilizzabile.

Possiamo riassumere semplicemente così:

- area di contenuto della view corrente: possiamo usare `var xxx: some View`
- componente indipendente riutilizzabile: possiamo creare un nuovo `struct XxxView: View`
- componente che deve ricevere dati: di solito è più adatto creare una nuova view.

## Riepilogo

In questa lezione abbiamo compreso di nuovo la struttura di view più fondamentale, ma anche più importante, in SwiftUI.

`ContentView` è una struttura. Viene definita con `struct` e serve a organizzare il codice relativo alla pagina.

`View` è un protocollo. Se una struttura vuole diventare una view SwiftUI, deve seguire il protocollo `View`.

`body` è il contenuto che il protocollo `View` ci richiede di fornire. Determina quale contenuto questa view mostrerà.

`some View` indica che viene restituito un certo tipo concreto di view, e non abbiamo bisogno di scriverne il tipo completo e complesso.

Quando il codice della view diventa lungo, possiamo usare `var xxx: some View` per suddividere il codice della view in più piccole aree.

Quando una parte di contenuto è relativamente indipendente, oppure deve essere riutilizzata, possiamo creare una nuova struttura di view e mostrarla in altre view tramite `XxxView()`.

In parole semplici, l'interfaccia di SwiftUI è composta combinando view una dopo l'altra. Una pagina può contenere più piccole view, e una piccola view può a sua volta contenere altre view.
