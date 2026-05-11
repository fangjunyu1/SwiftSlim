# Scheda del corso

Questa lezione è una lezione di ripasso di fase. Completeremo una “scheda del corso”.

Attraverso questo esercizio, possiamo ripassare `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` e altri contenuti studiati in precedenza, e imparare come combinare più piccole viste in un modulo di vista completo.

Effetto della scheda del corso:

![view](../../../Resource/026_view.png)

Questa scheda del corso contiene principalmente alcune parti:

- Livello del corso: `Principiante`
- Contenuto del corso: `20+ lezioni`
- Titolo del corso: `Tutorial SwiftUI per principianti`
- Descrizione del corso
- Pulsante: `Inizia a imparare`
- Sfondo del corso: icona Swift e sfondo indaco

Possiamo completare questa vista in `ContentView`.

## Area superiore

Per prima cosa, creiamo l’area superiore della scheda del corso.

![view](../../../Resource/026_view1.png)

La parte sinistra dell’area superiore mostra il livello del corso, mentre la parte destra mostra il contenuto del corso.

Poiché questi due contenuti sono disposti orizzontalmente, possiamo usare `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Principiante")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lezioni")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Qui abbiamo separato l’area superiore in una proprietà calcolata:

```swift
var topView: some View
```

Il vantaggio di farlo è che rende `body` più chiaro.

L’area superiore usa principalmente questi contenuti:

- `HStack`: dispone due testi in orizzontale.
- `Text`: mostra il contenuto testuale.
- `Spacer()`: spinge il testo a sinistra verso sinistra e il testo a destra verso destra.
- `.font(.footnote)`: imposta uno stile di testo più piccolo.
- `.fontWeight(.bold)`: rende il testo in grassetto.
- `.foregroundStyle(Color.white)`: imposta il colore di primo piano su bianco.
- `.padding(.vertical, 10)`: imposta il padding verticale.
- `.padding(.horizontal, 16)`: imposta il padding orizzontale.
- `.background(Color.white.opacity(0.15))`: imposta uno sfondo bianco semitrasparente.
- `.cornerRadius(20)`: imposta il raggio degli angoli.

Qui `Principiante` usa `.padding()` in due direzioni:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

In questo modo il testo ha spazio sia sopra e sotto, sia a sinistra e a destra, e sembra più simile a un’etichetta.

`Color.white.opacity(0.15)` rappresenta un bianco con opacità del `15%`, cioè un bianco molto tenue.

### Aggiungere lo sfondo della scheda

Prima abbiamo creato `topView`, ma creare semplicemente una vista non la mostra automaticamente.

In SwiftUI, il contenuto che viene davvero visualizzato nell’interfaccia deve essere scritto in `body`.

Quindi possiamo prima inserire `topView` in `body` per mostrarlo:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

A questo punto vedremo che l’area superiore è già visualizzata:

![view](../../../Resource/026_view2.png)

Tuttavia, poiché il testo in `topView` è bianco e anche lo sfondo predefinito è chiaro, in modalità chiara potrebbe non essere facile da vedere.

Perciò possiamo aggiungere un `VStack` all’esterno, poi impostare padding, colore di sfondo e angoli arrotondati per tutta l’area:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Effetto visualizzato:

![view](../../../Resource/026_view3.png)

Qui il `VStack` contiene per ora solo un `topView`, quindi sembra non essere strettamente necessario.

Ma più avanti continueremo ad aggiungere il titolo del corso, la descrizione del corso e l’area del pulsante. Sono tutti contenuti disposti verticalmente, quindi usare `VStack` in anticipo rende più comodo continuare a combinare le viste.

Qui ci sono due `.padding()`, e i loro ruoli sono diversi.

Il primo `.padding(20)` è scritto prima di `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Controlla il margine interno della scheda, cioè la distanza tra il contenuto e il bordo dello sfondo.

Il secondo `.padding(30)` è scritto dopo `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Controlla il margine esterno della scheda, cioè la distanza tra l’intera scheda e il bordo dello schermo.

![view](../../../Resource/026_view4.png)

Quindi, anche se sono entrambi `.padding()`, quando sono scritti in posizioni diverse producono effetti diversi.

## Area del contenuto

Poi creiamo l’area del contenuto della scheda del corso.

Effetto visualizzato:

![view](../../../Resource/026_view5.png)

L’area del contenuto contiene il titolo e la descrizione del corso. Sono disposti verticalmente, quindi usiamo `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial SwiftUI per principianti")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Parti da zero con SwiftUI e impara in modo sistematico lo sviluppo dichiarativo delle interfacce Apple. Attraverso spiegazioni chiare ed esempi pratici, padroneggerai gradualmente layout, interazione e gestione dello stato per creare interfacce app belle e utili.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Effetto visualizzato:

![view](../../../Resource/026_view6.png)

Qui nel `VStack` abbiamo usato due parametri:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` significa che le viste interne del `VStack` sono allineate a sinistra.

`spacing: 10` significa che tra le viste interne del `VStack` viene mantenuta una distanza di `10 pt`.

Quindi il titolo del corso e la descrizione del corso inizieranno dal lato sinistro e tra loro resterà una certa distanza.

La descrizione del corso è piuttosto lunga. Se venisse mostrata tutta, la scheda diventerebbe molto alta, quindi qui usiamo `.lineLimit()` per limitare il numero di righe visualizzate:

```swift
.lineLimit(3)
```

Significa che verranno mostrate al massimo `3` righe. Quando il contenuto supera il numero di righe consentito, la parte in eccesso verrà omessa.

### Allineare la vista a sinistra

Qui c’è anche un punto da notare.

`VStack(alignment: .leading)` può controllare solo l’allineamento delle viste interne del `VStack`; non controlla direttamente la posizione del `VStack` stesso nel contenitore esterno.

Ad esempio, se la descrizione del corso è piuttosto breve:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial SwiftUI per principianti")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Solo un po’ di contenuto.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Effetto visualizzato:

![view](../../../Resource/026_view7.png)

Possiamo vedere che il titolo e la descrizione del corso, anche se all’interno del `VStack` sono allineati a sinistra, l’intero `VStack` non è aderente al lato più sinistro della scheda.

Questo perché, quando il contenuto è più breve, anche la larghezza del `VStack` diventa più stretta. Quando il contenitore esterno esegue il layout, può posizionare questo `VStack` più stretto al centro.

Possiamo intenderla così: `VStack(alignment: .leading)` è responsabile dell’allineamento interno a sinistra.
Ma non è responsabile di spingere l’intera area del contenuto verso il lato più sinistro.

Se vogliamo che l’intera area del contenuto sia davvero allineata a sinistra, possiamo avvolgerla con un ulteriore `HStack` e aggiungere `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial SwiftUI per principianti")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Solo un po’ di contenuto.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Effetto visualizzato:

![view](../../../Resource/026_view8.png)

Qui `HStack` è un layout orizzontale.

`Spacer()` occuperà lo spazio rimanente a destra, spingendo così il `VStack` a sinistra.

Perciò `HStack + Spacer()` può essere usato per controllare la posizione dell’intera area del contenuto.

Nella scheda del corso reale, la descrizione del corso è piuttosto lunga e di solito occupa una larghezza maggiore, quindi questo problema potrebbe non essere evidente. Ma capire questa differenza è importante, perché quando in seguito creeremo layout con testi brevi incontreremo spesso situazioni simili.

### Controllare la distanza tra le viste interne

Prima abbiamo scritto `spacing: 10` nel `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` viene usato per controllare la distanza tra le viste interne.

Se non impostiamo `spacing`, anche `VStack` avrà una distanza predefinita, ma questa distanza predefinita non sempre corrisponde all’effetto che vogliamo.

Qui, se il titolo e la descrizione del corso sono troppo vicini, sembreranno compressi, quindi usiamo:

```swift
spacing: 10
```

per lasciare un po’ di spazio tra loro.

Effetto visualizzato:

![view](../../../Resource/026_view9.png)

Allo stesso modo, anche l’area superiore e l’area del contenuto sono disposte verticalmente, quindi possiamo usare `spacing` per controllare la distanza tra loro.

Ora inseriamo `topView` e `contentView` in `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Effetto visualizzato:

![view](../../../Resource/026_view10.png)

Qui `VStack(spacing: 20)` controlla la distanza tra `topView` e `contentView`.

In altre parole:

```swift
VStack(alignment: .leading, spacing: 10)
```

controlla la distanza tra il titolo e la descrizione del corso.

```swift
VStack(spacing: 20)
```

controlla la distanza tra l’area superiore e l’area del contenuto.

Sono entrambi `spacing`, ma agiscono su `VStack` diversi, quindi anche l’intervallo influenzato è diverso.

Così la vista dell’area del contenuto è completata.

## Area del pulsante

Poi creiamo l’area del pulsante in basso.

Effetto visualizzato:

![view](../../../Resource/026_view11.png)

L’area del pulsante è composta principalmente da un’icona di riproduzione e da una porzione di testo.

Possiamo usare `Image` per mostrare l’icona di riproduzione e `Text` per mostrare il testo del pulsante.

Qui creiamo prima l’aspetto di un pulsante:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("pulsante premuto")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Inizia a imparare")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Effetto visualizzato:

![view](../../../Resource/026_view12.png)

Qui abbiamo usato due `HStack`:

L’`HStack` interno viene usato per disporre orizzontalmente l’icona e il testo:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Inizia a imparare")
}
```

L’`HStack` esterno, insieme a `Spacer()`, viene usato per mostrare questo aspetto del pulsante allineato a sinistra:

```swift
HStack {
    ...
    Spacer()
}
```

Quando il pulsante viene toccato, nella console verrà stampato `pulsante premuto`.

## Scheda di base completata

Ora combiniamo l’area superiore, l’area del contenuto e l’area del pulsante:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Effetto visualizzato:

![view](../../../Resource/026_view13.png)

A questo punto, una scheda del corso di base è già completata.

## Sfondo con icona Swift

Infine, aggiungiamo alla scheda uno sfondo semitrasparente con l’icona Swift.

![view](../../../Resource/026_view.png)

Prima abbiamo usato `Color.indigo` come colore di sfondo. In realtà, oltre ad aggiungere un colore, `.background()` può anche aggiungere una vista completa.

Quindi possiamo prima creare una vista dedicata per lo sfondo:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

In questa vista di sfondo, usiamo `VStack`, `HStack` e `Spacer()` per spingere l’icona Swift nell’angolo in basso a destra.

Poiché l’icona Swift serve solo come sfondo decorativo, qui usiamo un bianco semitrasparente:

```swift
Color.white.opacity(0.15)
```

In questo modo l’icona non risulterà troppo evidente e non influenzerà il contenuto testuale davanti.

Poi aggiungiamo `backgroundView` alla scheda:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Effetto realizzato:

![view](../../../Resource/026_view14.png)

Qui abbiamo usato due `.background()` consecutivi:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Il primo `.background()` viene usato per aggiungere lo sfondo con l’icona Swift.
Il secondo `.background()` viene usato per aggiungere lo sfondo color indaco.

In questo modo, l’icona Swift verrà mostrata sopra lo sfondo indaco e apparirà come parte dello sfondo della scheda.

Da qui possiamo vedere che `.background()` non solo può aggiungere un colore, ma può anche aggiungere una vista personalizzata. Più `.background()` possono inoltre essere combinati per ottenere effetti di sfondo più ricchi.

A questo punto, una scheda del corso completa è terminata.

## Riepilogo

In questa lezione, attraverso una scheda del corso, abbiamo ripassato alcuni metodi di layout di base comuni in SwiftUI.

Abbiamo usato `Text` per mostrare il testo, `Image` per mostrare le icone di sistema, e `VStack`, `HStack` e `Spacer()` per controllare la disposizione delle viste.

Abbiamo imparato `.lineLimit()`, che può limitare il numero massimo di righe visualizzate da un testo. Quando il contenuto supera il limite, la parte in eccesso viene omessa.

Allo stesso tempo, abbiamo anche ripassato modificatori comuni come `.padding()`, `.background()`, `.cornerRadius()` e `.foregroundStyle()`.

Dopo aver completato questa lezione, siamo già in grado di combinare più piccole viste in un modulo di scheda completo.

Questo è anche un modo di pensare molto comune nello sviluppo SwiftUI: prima suddividere in piccole viste, poi combinarle in un’interfaccia completa.

## Codice completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Principiante")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lezioni")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial SwiftUI per principianti")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Parti da zero con SwiftUI e impara in modo sistematico lo sviluppo dichiarativo delle interfacce Apple. Attraverso spiegazioni chiare ed esempi pratici, padroneggerai gradualmente layout, interazione e gestione dello stato per creare interfacce app belle e utili.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("pulsante premuto")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Inizia a imparare")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
