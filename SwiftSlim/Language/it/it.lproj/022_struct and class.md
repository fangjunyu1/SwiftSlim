# struct e class

Nella lezione precedente abbiamo appena iniziato a entrare in contatto con `struct`, abbiamo definito una struttura e abbiamo anche ampliato l'apprendimento su argomenti come i protocolli, `UUID` e altri punti di conoscenza.

Ora abbiamo già una comprensione iniziale della parola chiave `struct`, ma non si può ancora dire che la comprendiamo davvero.

In questa lezione continueremo a prendere `struct` come contenuto principale e, allo stesso tempo, conosceremo anche `class`. Attraverso questa lezione, capirai con maggiore chiarezza: che cos'è un'istanza, che cos'è un costruttore e perché possiamo usare `struct` e `class` per organizzare i dati.

## Sistema di gestione degli studenti

Per esempio, ora vogliamo sviluppare un sistema di gestione degli studenti. Ogni studente ha informazioni come nome, sesso, telefono, età, indirizzo di casa e così via.

A questo punto, possiamo unire queste informazioni e definirle come una struttura `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Qui usiamo `struct` per definire un tipo di studente.

Questa struttura `Student` contiene diverse proprietà:

- `id`: l'identificatore univoco dello studente
- `name`: il nome dello studente
- `sex`: il sesso dello studente
- `phone`: il telefono dello studente
- `age`: l'età dello studente
- `address`: l'indirizzo di casa

In questo modo, più dati che in origine erano separati vengono combinati in uno "studente" completo.

Qui `Student` segue anche il protocollo `Identifiable` e definisce un campo `id`, così da facilitare in seguito la visualizzazione dei dati insieme al ciclo `ForEach`.

Poi possiamo creare un'istanza di studente:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Questo codice indica che, seguendo la struttura `Student`, si possono creare dati concreti di uno studente.

Qui `Student` è il tipo, mentre `Student(...)` rappresenta un'istanza creata.

In SwiftUI, possiamo assegnare questa istanza a una variabile e poi mostrarla.

Per esempio:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

In questo modo, possiamo vedere nella vista il nome di questo studente: `Fang Junyu`.

Qui abbiamo prima creato un'istanza di `Student`, poi l'abbiamo assegnata alla variabile `student`, e infine abbiamo letto la sua proprietà tramite `student.name`.

## Che cos'è un'istanza

Quando iniziamo appena a studiare `struct`, la parola "istanza" può sembrare molto estranea.

Ma in realtà, stiamo usando istanze fin dall'inizio, solo che prima non ci facevamo particolarmente caso.

Per esempio:

```swift
let name = "Fang Junyu"
```

Qui `"Fang Junyu"` è un valore stringa, e nella sua essenza è un'istanza del tipo `String`.

Possiamo anche scriverlo così:

```swift
let name = String("Fang Junyu")
```

Questi due modi di scrivere esprimono la stessa cosa: creare un'istanza del tipo `String` e assegnarla alla variabile `name`.

Allo stesso modo, vale anche per `Int`:

```swift
let num = 3
```

Qui `3` è essenzialmente un valore del tipo `Int`, e si può anche intendere come un'istanza di `Int`.

Quindi, un'istanza non è un concetto speciale che compare solo in `struct`.

Che si tratti di `String`, `Int`, `Double`, `Bool` o del `Student` personalizzato, tutti possono creare istanze.

Perciò, quando scriviamo:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

in sostanza è la stessa cosa che creare un'istanza di `String` o `Int`, solo che `Student` è un tipo definito da noi stessi.

## Costruttore

Quando creiamo un'istanza:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

in realtà stiamo chiamando il metodo di inizializzazione di `Student`, cioè `init`.

Puoi capire il costruttore così: **è il punto di ingresso responsabile dell'assegnazione dei valori alle proprietà quando viene creata un'istanza.**

Vale a dire, prima che un'istanza sia davvero completata, di solito deve prima passare per `init`.

Per esempio, quando in precedenza abbiamo studiato il ciclo di vita delle viste SwiftUI, abbiamo scritto un codice come questo:

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
    }
}
```

Qui `init()` viene eseguito quando viene creata l'istanza `ContentView`, mentre `onAppear` viene eseguito solo quando la vista viene realmente mostrata sullo schermo. In altre parole, la creazione della vista e la sua visualizzazione non avvengono nello stesso momento.

Allo stesso modo, quando creiamo `Student(...)`, stiamo chiamando anche il costruttore di `Student`.

### Costruttore generato automaticamente dal sistema

Quando abbiamo definito `Student`, non abbiamo scritto manualmente `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Tuttavia, possiamo comunque creare direttamente un'istanza:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Perché si può creare un'istanza senza aver scritto un costruttore?

Perché per `struct`, se non scriviamo manualmente un costruttore, il sistema di solito genera automaticamente per noi un costruttore adatto.

Nella fase iniziale di apprendimento, puoi semplicemente capirlo così: Swift completa automaticamente per noi il codice di inizializzazione.

In modo approssimativo, si può capire come se il sistema ci completasse il seguente codice:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Qui bisogna prestare attenzione a un dettaglio:

```swift
let id = UUID()
```

`id` ha già un valore predefinito, quindi quando creiamo un'istanza non dobbiamo passare di nuovo `id` manualmente.

Vale a dire, le proprietà che non hanno un valore predefinito di solito devono essere passate nel costruttore; le proprietà che hanno già un valore predefinito di solito possono usare direttamente quel valore originario.

Perciò, quando creiamo un'istanza `Student`, dobbiamo passare solo `name`, `sex`, `phone`, `age` e `address`.

### Suggerimenti del compilatore

Inoltre, quando scriviamo `Student(...)` in Xcode, possiamo anche vedere i suggerimenti dei parametri forniti dal sistema.

![student](../../Resource/022_student.png)

Questo in realtà mostra anche che il tipo attuale possiede davvero un costruttore generato automaticamente dal sistema.

### Scrivere il costruttore da soli

Anche se il sistema può generare automaticamente il costruttore, a volte questo modo predefinito di inizializzazione non corrisponde del tutto alle nostre esigenze.

Per esempio, abbiamo una struttura `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Secondo il costruttore generato automaticamente dal sistema, quando creiamo un'istanza dobbiamo passare contemporaneamente questi tre parametri:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ma se ora vogliamo inserire un gruppo di vecchi film e conosciamo solo il nome del film, senza conoscere il regista e la valutazione, questo diventa piuttosto scomodo.

Perché possiamo scriverlo solo così:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Anche se funziona, non è comodo scrivere ogni volta `--` ripetutamente.

A questo punto, possiamo scrivere un costruttore:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

In questo modo, quando creiamo vecchi film, dobbiamo passare solo `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Questo è uno dei significati dello scrivere il costruttore da soli: **rendere il modo di creare le istanze più adatto alle esigenze reali.**

### Analisi di un costruttore personalizzato

Vediamo questo costruttore scritto a mano poco fa:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Il significato di questo codice è che, quando si crea un'istanza di `Movie`, viene richiesto solo di passare un parametro `name`.

Poi, all'interno del costruttore, il `name` passato verrà assegnato al `name` dell'istanza stessa, mentre a `director` e `rating` verrà dato il valore predefinito `--`.

Qui `self` significa "questa istanza corrente stessa".

Per esempio:

```swift
self.name = name
```

Il `self.name` a sinistra rappresenta la proprietà dell'istanza; il `name` a destra rappresenta il parametro che abbiamo passato.

Lo si può capire semplicemente come il salvataggio, nella proprietà dell'istanza stessa, del valore passato dall'esterno.

Quando tutte le proprietà hanno ricevuto un valore, la creazione di questa istanza è completata.

### Meccanismo del costruttore

Quando dichiariamo esplicitamente un costruttore, avviene anche un altro cambiamento:

il costruttore che il sistema generava automaticamente in origine di solito non può più essere usato direttamente.

Per esempio:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Ora, se scriviamo di nuovo così:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

il compilatore segnalerà un errore:

```swift
Extra arguments at positions #2, #3 in call
```

Questo significa: hai passato parametri in eccesso.

Perché compare questo errore?

Perché nella struttura `Movie` attuale esiste solo questo unico costruttore che hai dichiarato manualmente:

```swift
init(name: String)
```

Accetta solo un parametro `name` e non accetta `director` né `rating`.

Vale a dire, quando aggiungi manualmente un tuo costruttore, il modo di inizializzazione originariamente generato automaticamente non può più essere usato direttamente.

Se vogliamo supportare sia "passare solo il nome" sia "passare le informazioni complete", allora dobbiamo aggiungere noi stessi un altro costruttore completo:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

In questo modo, abbiamo due costruttori diversi.

Quando creiamo un vecchio film, possiamo scrivere così:

```swift
Movie(name: "The Night of the Hunter")
```

Quando creiamo un nuovo film con informazioni complete, possiamo scrivere così:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Questo modo di scrivere mostra anche che lo stesso tipo può avere più costruttori, purché la forma dei loro parametri sia diversa.

## Che cos'è l'overload

Qui aggiungiamo un altro punto di conoscenza necessario.

Poco fa abbiamo scritto due `init` per `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Questo modo di scrivere, "lo stesso nome di funzione ma parametri diversi", si chiama "overload".

Qui entrambe le funzioni si chiamano `init`, ma poiché ricevono parametri diversi, Swift riesce a distinguere quale funzione stai chiamando.

Per esempio:

```swift
Movie(name: "Days of Heaven")
```

chiamerà:

```swift
init(name: String)
```

Mentre:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

chiamerà l'altra versione completa del metodo di inizializzazione.

Quindi il ruolo dell'overload è: permettere allo stesso tipo di offrire modi diversi di essere creato in base a situazioni diverse.

## Conoscere class

Successivamente, conosciamo brevemente anche `class`.

Oltre al comune `struct` in Swift, molti linguaggi di programmazione usano `class` per creare istanze, come Java, C#, Kotlin e altri.

In Swift, il modo di scrivere `class` è molto vicino a quello di `struct`.

Per esempio:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Ti accorgerai che, a parte il fatto che la parola chiave cambia da `struct` a `class`, le altre parti sembrano quasi identiche.

Anche il modo di creare un'istanza è molto simile:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Perciò, a livello di sintassi, `struct` e `class` sono davvero molto simili.

### Differenza tra Struct e Class

Anche se `struct` e `class` sembrano molto simili, non sono esattamente la stessa cosa.

**1. Il modo di inizializzare è diverso**

Per `struct`, se non scriviamo manualmente un costruttore, il sistema di solito genera automaticamente un metodo di inizializzazione adeguato.

Ma per `class`, se ci sono proprietà che non hanno ancora un valore predefinito, di solito dobbiamo scrivere manualmente `init`, altrimenti comparirà un errore.

Per esempio:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Questa `class` genera un errore perché non ha un costruttore, quindi le proprietà non vengono inizializzate.

Il compilatore mostrerà qualcosa di simile a:

```swift
Class 'Movie' has no initializers
```

Quindi, in questo esempio, `class` deve necessariamente avere un costruttore scritto manualmente.

**2. `struct` è un tipo valore, `class` è un tipo riferimento**

`struct` è un tipo valore, mentre `class` è un tipo riferimento.

Nella fase iniziale dell'apprendimento, non è necessario padroneggiare completamente questi due concetti; è sufficiente avere una comprensione semplice.

Per esempio, `struct` assomiglia di più a "copiare un nuovo valore".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Qui, dopo aver assegnato `user1` a `user2`, è come se venisse copiata una nuova porzione di dati, quindi modificare `user2` non influisce su `user1`.

Al contrario, `class` assomiglia di più a "puntare insieme alla stessa istanza".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Qui `user1` e `user2` puntano alla stessa istanza.

Per ora non abbiamo bisogno di comprendere completamente il meccanismo interno dei tipi valore e dei tipi riferimento; è sufficiente sapere che `struct` è più adatto a salvare dati indipendenti, mentre `class` è più adatto quando più parti devono condividere la stessa istanza.

## Come scegliere nella fase iniziale

Nella fase attuale, per i normali modelli di dati conviene considerare prima `struct`; quando servono dati condivisi e modifiche sincronizzate, allora conviene considerare `class`.

Questa non è una regola assoluta, ma per i principianti è un criterio di giudizio abbastanza pratico.

Soprattutto in SwiftUI, molte volte scoprirai che `struct` è già in grado di svolgere la maggior parte del lavoro.

Inoltre, in molti materiali di programmazione, ciò che viene creato da `class` viene anche chiamato "oggetto". Nella fase iniziale, puoi semplicemente intenderlo come un'istanza, senza bisogno di distinguerli deliberatamente.

## Riepilogo

In questa lezione abbiamo studiato `struct` più in profondità e, allo stesso tempo, abbiamo conosciuto anche `class`; entrambi possono essere usati per definire tipi.

I tipi possono creare istanze. Quando viene creata un'istanza, viene chiamato il costruttore, cioè `init`.

Per `struct`, se non scriviamo manualmente un costruttore, il sistema di solito genera automaticamente un costruttore adatto. Se il costruttore predefinito non soddisfa le esigenze, possiamo anche scrivere un costruttore noi stessi.

Inoltre, abbiamo anche ottenuto una comprensione iniziale della differenza tra `struct` e `class`: `struct` è un tipo valore, mentre `class` è un tipo riferimento. In SwiftUI, nella fase iniziale, ciò che si incontra più spesso di solito è `struct`.

Più avanti, quando studieremo il passaggio di valori tra viste, i modelli di dati e la gestione dello stato, tutti questi contenuti continueranno a essere usati.
