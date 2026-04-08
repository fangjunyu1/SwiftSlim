# Elenco dei film

In questa lezione creeremo un elenco di film.

![movie](../../Resource/021_movie.png)

Nell'elenco verranno mostrati il poster, il nome, il regista e la valutazione di ogni film.

In questo esempio impareremo un punto molto importante: la struttura `struct`. Essa ci aiuta a combinare più informazioni di un film in un unico insieme. Inoltre, entreremo in contatto anche con `UUID()`, `ForEach`, la linea divisoria `Divider` e il modo di usare oggetti personalizzati per gestire i dati.

Queste conoscenze sono molto comuni nello sviluppo successivo con SwiftUI. Dopo questa lezione, non solo sarai in grado di creare un elenco di film, ma inizierai anche a capire "come mostrare un gruppo di dati come interfaccia".

## Un singolo film

Possiamo iniziare prima dall'interfaccia di un singolo film.

![movie](../../Resource/021_movie1.png)

Il layout di questa interfaccia è composto principalmente da due parti: a sinistra c'è il poster del film, a destra c'è la presentazione del film.

### Poster del film

Sul lato sinistro viene mostrato il poster del film, e possiamo usare `Image` per visualizzare l'immagine.

Ad esempio:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Questo codice indica che viene mostrata un'immagine chiamata `"The Shawshank Redemption"`.

Qui bisogna fare attenzione al fatto che il nome dell'immagine deve esistere realmente nella cartella delle risorse `Assets`, altrimenti l'interfaccia non sarà in grado di mostrare correttamente questa immagine.

![movie](../../Resource/021_movie2.png)

Le funzioni di questi modificatori sono rispettivamente:

- `resizable()` indica che la dimensione dell'immagine può essere regolata.
- `scaledToFit()` indica che durante il ridimensionamento viene mantenuta la proporzione originale, per evitare che l'immagine venga stirata e deformata.
- `frame(height: 180)` indica che l'altezza dell'immagine viene impostata a 180.
- `cornerRadius(10)` indica che all'immagine viene applicato un raggio di arrotondamento di 10.

In questo modo possiamo ottenere un'immagine del poster del film di dimensione adatta e con angoli arrotondati.

![movie](../../Resource/021_movie3.png)

### Presentazione del film

Sul lato destro viene mostrata la presentazione del film, inclusi nome del film, regista e valutazione.

![movie](../../Resource/021_movie4.png)

Possiamo usare `Text` per mostrare questa parte:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

In questo codice, `.font` rappresenta la dimensione del carattere, mentre `.fontWeight` rappresenta lo spessore del carattere.

Per rendere più chiara la distanza tra "nome del film", "informazioni sul regista" e "informazioni sulla valutazione", qui usiamo `VStack` sul livello più esterno e impostiamo:

```swift
spacing: 10
```

Questo significa che la distanza tra ogni gruppo di contenuti all'interno di questo `VStack` è 10.

Il motivo per cui regista e valutazione sono ciascuno racchiusi in un altro `VStack` è che entrambi appartengono a una struttura del tipo "titolo + contenuto". Di conseguenza, la gerarchia dell'interfaccia sarà più chiara e sarà anche più comodo continuare a regolare lo stile in seguito.

Inoltre, `VStack` è centrato per impostazione predefinita. Per allineare tutto il testo a sinistra, impostiamo:

```swift
alignment: .leading
```

Così la parte di presentazione del film appare più ordinata.

### Linea divisoria

Ora, anche se il contenuto della presentazione del film è stato distanziato tramite `spacing`, il confine tra i diversi contenuti non è ancora abbastanza evidente.

A questo punto, possiamo aggiungere una linea divisoria:

```swift
Divider()
```

Ad esempio:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

In questo modo, la parte di presentazione del film avrà un effetto di separazione più evidente.

![movie](../../Resource/021_movie4.png)

`Divider` è una view molto semplice ma molto usata, il cui compito è separare contenuti diversi.

In `VStack`, `Divider()` viene mostrato come una linea orizzontale.

In `HStack`, `Divider()` viene mostrato come una linea verticale.

Inoltre, lo stile di `Divider` può essere modificato anche tramite `.frame`, `.background`, `.padding` e altri modi.

Ad esempio:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Questo genererà una linea divisoria blu, con spessore 2 e padding orizzontale ai lati.

![divider](../../Resource/021_divider.png)

### Interfaccia completa

Infine, possiamo usare `HStack` per disporre il poster del film e la presentazione del film fianco a fianco.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Qui, `HStack(spacing: 20)` significa che tra la parte sinistra e la parte destra viene mantenuta una distanza di 20.

Bisogna notare che `Divider()`, proprio come `TextField` e `Slider` menzionati in precedenza, per impostazione predefinita cerca di occupare il più possibile lo spazio disponibile.

Per questo motivo, impostiamo una larghezza fissa per il `VStack` esterno della parte descrittiva a destra:

```swift
.frame(width: 200)
```

In questo modo la larghezza della linea divisoria e dell'area di testo può rimanere coerente, e l'insieme apparirà più ordinato.

Fin qui, abbiamo completato l'interfaccia di visualizzazione di "un singolo film".

![movie](../../Resource/021_movie1.png)

## Salvare i film in un array

Se vogliamo mostrare più film uno dopo l'altro con lo stesso stile, significa che dovremo scrivere un codice simile per ogni film.

Ad esempio:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Anche se un codice scritto in questo modo può ottenere il risultato desiderato, il codice diventerà sempre più lungo e la manutenzione sarà molto scomoda.

Ad esempio, se bisogna modificare la distanza di tutti i film da `20` a `15`, oppure modificare la larghezza della parte destra da `200` a
`220`, sarà necessario modificare manualmente ogni blocco di codice ripetuto.

Questo, ovviamente, non è un metodo efficiente.

In precedenza abbiamo studiato gli array, e abbiamo anche imparato a usare `ForEach` per visualizzare ripetutamente delle view in base a un array.

Ad esempio:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Questo metodo è molto adatto per trattare situazioni in cui c'è "un solo dato", come un gruppo di nomi di immagini.

Ma un film non ha un solo valore. Contiene almeno:

1. il poster del film
2. il nome del film
3. il regista
4. la valutazione

In altre parole, un film è in realtà un insieme di dati correlati, e non una singola stringa.

Se usiamo solo gli array, possiamo solo salvare queste informazioni separatamente:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Durante la visualizzazione, dobbiamo affidarci allo stesso indice per farle corrispondere una per una:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Il problema di questo modo di scrivere è che il costo di manutenzione è molto alto.

Poiché i dati di un film sono sparsi in più array, basta che un array abbia un elemento in più, uno in meno o un ordine diverso perché il risultato della visualizzazione risulti errato.

Soprattutto quando si aggiungono o si eliminano film, devi modificare contemporaneamente più array, ed è molto facile dimenticare qualcosa.

Allora, come possiamo combinare informazioni come "nome del film, regista e valutazione" in un solo insieme?

Per questo è necessario usare `struct`.

## Definire la struttura struct

In Swift, `struct` significa "struttura."

Puoi capirla come un "tipo di dato personalizzato", capace di combinare più campi correlati in un unico insieme.

Uso di base:

```swift
struct StructName {
	let name: String
}
```

In questo codice, `struct` è la parola chiave che indica che stiamo definendo una struttura. `StructName` è il nome della struttura.

Il contenuto all'interno delle parentesi graffe sono i campi contenuti in questa struttura, e per ciascun campo bisogna specificare chiaramente nome e tipo.

Di solito, il nome di una `struct` inizia con una lettera maiuscola, ad esempio `Movie`, `Student` o `UserInfo`. Questa è una convenzione di denominazione comune in Swift.

Puoi immaginare `struct` in modo semplice come una scatola vuota, dove ogni campo è come una posizione vuota riservata all'interno della scatola.

Quando queste posizioni non sono ancora state riempite, è solo una scatola vuota. Solo quando tutti i campi vengono riempiti con valori adatti, diventa una confezione regalo completa.

### Istanza di struct

Prima abbiamo definito solo la struttura stessa, che equivale a preparare la forma di una scatola.

Dobbiamo ancora riempirla con contenuto concreto per ottenere una vera "istanza" utilizzabile.

Quando si crea un'istanza, di solito si aggiunge `()` dopo il nome della struttura:

```swift
StructName(...)
```

Quello che viene inserito tra le parentesi è proprio il contenuto dei campi richiesti da quella struttura.

Ad esempio:

```swift
StructName(name: "Fang Junyu")
```

Questo codice significa: creare una nuova istanza secondo il formato della struttura `StructName`, e assegnare al campo `name` il valore `"Fang Junyu"`.

Quando riempiamo tutto il contenuto necessario dei campi, è come se riempissimo completamente quella scatola.

A quel punto, otteniamo un'istanza completa della struttura.

### Accesso alle proprietà di struct

Dopo aver creato un'istanza, possiamo usare la "dot syntax" per accedere alle sue proprietà interne.

Scrittura di base:

```swift
istanza.nomeProprieta
```

Ad esempio:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Qui `st` è un'istanza di struttura, e `st.name` significa leggere il valore `name` di quell'istanza.

Puoi comprendere questo modo di leggere così: quando scriviamo `st.name`, è come se leggessimo il contenuto conservato in una certa posizione dentro quella scatola.

Questo stile di scrittura sarà molto comune nelle interfacce SwiftUI successive.

Per esempio, se abbiamo una struttura studente che contiene nome, età e classe, allora quando la mostriamo nell'interfaccia possiamo leggere separatamente:

```swift
student.name
student.age
student.className
```

Il vantaggio di questo approccio è che i dati diventano più chiari e anche più facili da gestire.

### Posizione di struct

Per chi è alle prime armi, di solito la struttura può essere scritta fuori da `ContentView`.

Ad esempio:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

In questo modo la struttura risulta più chiara ed è anche più facile da leggere.

Ti accorgerai che anche `ContentView` stesso è in realtà una `struct`.

### Struttura Movie

Con le basi precedenti, ora possiamo definire una struttura per il film:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Questa è una struttura chiamata `Movie`, composta dai tre campi `name`, `director` e `rating`, che rappresentano rispettivamente il nome del film, il regista e la valutazione.

In questo modo, le informazioni relative a un film non devono più essere separate in più array, ma possono essere combinate direttamente in un unico insieme.

Ad esempio, possiamo creare un'istanza di film come questa:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Questa istanza rappresenta "un insieme completo di dati di un film".

### Salvare strutture in un array

In precedenza abbiamo detto che un array può salvare solo un unico tipo.

Ora abbiamo già la struttura `Movie`, quindi l'array può contenere più `Movie`.

```swift
let lists: [Movie] = []
```

Ad esempio:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

In questo array `lists`, ciò che viene salvato non sono stringhe, ma più istanze di `Movie`.

Vale a dire che ogni elemento dell'array è un film completo.

In questo modo, quando dobbiamo mostrare l'elenco dei film, possiamo usare `ForEach` per leggere ogni film uno dopo l'altro.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Qui `movie in` significa che, a ogni iterazione del ciclo, verrà preso un film dall'array e gli verrà assegnato temporaneamente il nome `movie`.

Poi, possiamo usare:

```swift
movie.name
movie.director
movie.rating
```

per leggere rispettivamente il nome, il regista e la valutazione di quel film, e mostrarli nell'interfaccia.

## Errore di ForEach

A questo punto, abbiamo già completato la scrittura di base dell'array di film e di `ForEach`.

Tuttavia, se esegui direttamente il seguente codice:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

verrà mostrato un errore:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Il significato di questo errore è che, quando scrivi `id: \.self`, SwiftUI ha bisogno di considerare ogni elemento dell'array stesso come "identificatore univoco" per distinguerli.

Questo modo di scrivere è adatto a tipi semplici come `String` e `Int`, perché di per sé sono più facili da distinguere.

Ma `Movie` è una struttura personalizzata definita da noi, e `ForEach` non sa come usare la struttura stessa come identificatore univoco, per questo compare l'errore.

Il modo più comune per risolvere questo problema è fare in modo che `Movie` aderisca al protocollo `Identifiable`.

## Protocollo

In Swift, un protocollo può essere inteso come una sorta di "regola" o "requisito."

Puoi capirlo come un accordo in un'organizzazione internazionale: se un paese vuole entrare in una determinata organizzazione internazionale, di solito deve prima soddisfare alcune regole proposte da quell'organizzazione, rendere pubblici alcuni dati e rispettare alcune regole comuni. Solo dopo aver soddisfatto queste condizioni può entrare o partecipare ad alcune questioni.

Anche i protocolli funzionano in modo simile.

Quando un tipo vuole conformarsi a un certo protocollo, deve soddisfare il contenuto richiesto da quel protocollo. Solo dopo aver soddisfatto tali requisiti, quel tipo può usare le funzionalità corrispondenti.

Scrittura di base:

```swift
struct Movie: Identifiable {
    // ...
}
```

Qui, `: Identifiable` significa che `Movie` aderisce al protocollo `Identifiable`.

Se un tipo aderisce a più protocolli, questi possono essere separati con una virgola:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Per `Identifiable`, il requisito più importante è che il tipo debba avere un `id` con cui possa identificarsi.

Ad esempio:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Qui, `id` è come un numero di identità, e viene usato per distinguere ogni film.

Finché l'`id` di ogni film è diverso, SwiftUI può distinguere correttamente ogni elemento nell'array.

Ad esempio:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Poi, in `ForEach` usiamo:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

In questo modo, l'errore non apparirà.

Poiché `Movie` aderisce già a `Identifiable`, un modo ancora più comune di scrivere è omettere direttamente `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Perché SwiftUI sa già di dover usare `movie.id` per distinguere ogni elemento.

## L'identificatore distintivo di ForEach

Di seguito, capiremo più a fondo il ruolo di `id` in `ForEach`.

Ad esempio:

```swift
ForEach(lists, id: \.self)
```

Qui significa: usare l'elemento stesso come identificatore distintivo.

E:

```swift
ForEach(lists, id: \.id)
```

significa: usare il campo `id` dell'elemento come identificatore distintivo.

Se un certo campo può garantire da solo l'unicità, allora può essere usato anche temporaneamente.

Ad esempio, se il nome di ogni film è diverso, allora la scrittura seguente potrebbe funzionare correttamente anche con i dati attuali:

```swift
ForEach(lists, id: \.name)
```

Ma qui c'è un problema nascosto: `name` non è detto che sia sempre unico.

Supponiamo che in futuro tu aggiunga un altro film con lo stesso nome; allora `name` non potrà più distinguere con precisione ogni elemento.

A quel punto, anche se il codice può ancora compilare, SwiftUI potrebbe riconoscere male gli elementi durante il refresh, l'aggiornamento, l'inserimento o l'eliminazione delle view, causando anomalie nella visualizzazione.

Perciò, quando abbiamo bisogno di distinguere i dati in modo stabile, è meglio usare il campo davvero univoco, cioè `id`.

## UUID

Anche se scrivere manualmente `id: 1`, `id: 2` può risolvere il problema, c'è comunque un rischio: si può accidentalmente scrivere un `id` duplicato, e allora l'identificatore univoco perde validità.

Ad esempio:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

In questo modo compariranno due `id` uguali, e l'identificatore univoco perderà validità.

Per evitare errori manuali, di solito usiamo `UUID()`.

In Swift, `UUID()` genera casualmente un identificatore a 128 bit. Di solito viene mostrato come una lunga stringa composta da lettere e numeri.

Ad esempio:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Qui, `UUID()` crea in realtà un'istanza del tipo `UUID`; puoi capirla come un "numero univoco" generato automaticamente.

Per questo, i valori generati ogni volta quasi non si ripetono mai, quindi sono molto adatti a essere usati come `id`.

Possiamo modificare `Movie` così:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Questo codice significa che il campo `id` nella struttura `Movie` riceverà di default una nuova istanza di `UUID`.

In altre parole, ogni volta che creiamo un nuovo `Movie`, il sistema ci genererà automaticamente prima un `id` univoco.

Poiché `id` ha già un valore predefinito, in seguito non ci sarà più bisogno di compilare manualmente `id` quando si creano istanze di `Movie`.

Ad esempio:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Anche se qui non viene scritto `id`, in realtà questa istanza di film possiede comunque il suo `id`; semplicemente quel valore è già stato generato automaticamente da `UUID()`.

Dopo aver usato questo metodo, non dovremo più compilare manualmente `id` per ogni film. Questo non solo riduce la quantità di codice, ma evita anche gli errori causati da valori id duplicati.

Infine, dobbiamo solo aggiungere un'immagine `Banner` in alto e usare `ScrollView` per rendere il contenuto scorrevole, e così l'intera vista dell'elenco dei film sarà completa.

## Riepilogo

In questa lezione abbiamo imparato un punto molto importante: `struct`.

Attraverso `struct`, possiamo combinare più campi correlati di un film in un unico insieme, invece di separare nome, regista e valutazione in più array.

Dopo aver combinato i dati, possiamo usare `ForEach` per mostrare ogni film dell'array uno alla volta nella view.

Allo stesso tempo, abbiamo compreso anche il ruolo dell'"identificatore distintivo" in `ForEach`: SwiftUI deve sapere come distinguere ogni elemento dell'array per poter mostrare e aggiornare correttamente la view.

Per questo abbiamo fatto sì che `Movie` aderisse al protocollo `Identifiable` e gli abbiamo fornito un `id` univoco.

Per evitare errori quando si compila manualmente `id`, abbiamo imparato anche `UUID()`, in modo che il sistema possa generare automaticamente l'identificatore univoco.

Dopo aver completato questa lezione, non solo avrai completato l'elenco dei film, ma inizierai anche a entrare in contatto con un'idea importante di SwiftUI: **prima organizza i dati, poi genera la view in base ai dati.**

## Codice completo

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
