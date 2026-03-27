# Creare una pagina di curriculum personale

In questa lezione realizzeremo una semplice vista di curriculum personale e impareremo le seguenti conoscenze:

- `cornerRadius`
- `spacing`
- `ScrollView`

Durante la costruzione ripasseremo anche concetti come layout, `Text` e `Image`, e realizzeremo il controllo degli spazi e l'effetto di scorrimento dei contenuti.

## Curriculum personale

Effetto obiettivo:

![Swift](../../RESOURCE/004_img.png)

**Prova prima a completarlo in autonomia, poi continua a leggere la spiegazione qui sotto.**

### Creare il progetto

Crea un nuovo progetto iOS oppure continua a usare il progetto precedente.

Codice predefinito di `ContentView`:

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
    }
}
```

Ora svuota il codice e inizia a scrivere il tuo contenuto:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Struttura generale

Nello sviluppo reale, di solito progettiamo prima la struttura generale.

La nostra pagina contiene:

1. titolo
2. informazioni personali
3. presentazione personale

Aggiungiamo un `VStack` all'esterno:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` può garantire l'ordinamento verticale delle viste e permette anche di controllarne disposizione e spaziatura.

### Titolo

Per prima cosa, creiamo un `Text` per mostrare il titolo.

Qui mostrerò il titolo con il mio nome inglese:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Di solito il titolo viene reso più grande e più marcato, quindi qui usiamo i modificatori `font` e `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Impaginazione

L'allineamento predefinito di SwiftUI è `center`, quindi ora il titolo appare al centro di `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Noi invece vogliamo mostrare il titolo nella parte alta della vista, quindi possiamo usare `Spacer` per regolare il layout:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` occuperà lo spazio rimanente e spingerà `Text` verso la parte superiore del contenitore.

![Swift](../../RESOURCE/004_img4.png)

### Spazio vuoto

Se pensi che il testo sia troppo vicino alla parte superiore, puoi usare `padding` oppure `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Imposta il margine superiore di `VStack` a 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Si può anche usare `Spacer` e impostare l'altezza di `frame` per ottenere uno spazio vuoto di altezza specifica.

Effetto ottenuto:

![Swift](../../RESOURCE/004_img5.png)

### Immagine

Prepariamo una nostra foto profilo e inseriamola nella cartella risorse `Assets`.

![Swift](../../RESOURCE/004_img6.png)

In `ContentView`, usa `Image` per mostrare l'immagine:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Poiché la dimensione originale dell'immagine è piuttosto grande, dobbiamo usare `frame` per controllarne la dimensione di visualizzazione.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

A questo punto noteremo un problema:

se il rapporto tra larghezza e altezza del `frame` non coincide con quello originale dell'immagine, l'immagine si deformerà.

Per esempio:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Per evitare che l'immagine si deformi, dobbiamo usare `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

La funzione di `scaledToFit` è:

ridimensionare l'immagine mantenendo le proporzioni originali all'interno del `frame` assegnato e mostrarne completamente il contenuto.

Non forza l'immagine a stirarsi per riempire l'intero `frame`, ma mantiene invariato il rapporto larghezza-altezza e la scala in proporzione finché uno dei lati aderisce esattamente al bordo.

Questo significa:

- se la larghezza del `frame` è più piccola, l'immagine verrà ridimensionata prendendo la larghezza come riferimento.
- se l'altezza del `frame` è più piccola, l'immagine verrà ridimensionata prendendo l'altezza come riferimento.
- l'immagine manterrà sempre le proporzioni originali e non si deformerà.

Di solito si può impostare la dimensione in una sola direzione. Per esempio:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

In questo modo il sistema calcolerà automaticamente un'altezza adatta sulla base della larghezza 140, mantenendo nello stesso tempo le proporzioni.

Se invece vuoi fissare una proporzione visiva specifica o evitare che venga compressa in layout complessi, puoi vincolare sia larghezza sia altezza.

### Angoli arrotondati

Se vuoi mostrare l'immagine con angoli arrotondati, puoi usare il modificatore `cornerRadius`:

```swift
.cornerRadius(10)
```

Per esempio:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Aggiungi `cornerRadius(20)` dopo i modificatori di `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` indica che i bordi della vista vengono ritagliati applicando un raggio di 20 agli angoli.

Dopo aver aggiunto gli angoli arrotondati, i quattro angoli dell'immagine diventeranno curvi, rendendo l'effetto visivo più morbido e moderno.

Questo stile di design è molto comune nelle interfacce attuali. Per esempio, le icone delle app di iOS usano una forma rettangolare arrotondata (anche se le icone di sistema usano in realtà una superellisse a curvatura continua, non semplici angoli arrotondati).

### Informazioni personali

Ora iniziamo a realizzare l'area delle informazioni personali a sinistra dell'immagine. Dalla struttura dell'interfaccia si vede che le informazioni personali e l'immagine sono disposte orizzontalmente, quindi dobbiamo usare `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Il contenuto delle informazioni personali è disposto verticalmente.

![Swift](../../RESOURCE/004_img11.png)

Perciò, all'esterno usiamo `HStack`, per le informazioni personali usiamo `VStack` e per il contenuto testuale usiamo `Text`.

Struttura di base:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Rendere in grassetto i titoli dei campi**

Per distinguere il nome del campo dal valore del campo, puoi usare `fontWeight` sui nomi dei campi:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Allineamento del testo a sinistra**

`VStack` è centrato per default. Se vuoi che tutto il testo sia allineato a sinistra, devi impostare l'allineamento:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` indica l'allineamento verso sinistra (in un ambiente linguistico da sinistra a destra).

![Swift](../../RESOURCE/004_img14.png)

### Spaziatura

Se vuoi mantenere una distanza fissa tra le informazioni personali e l'immagine, in precedenza abbiamo studiato l'uso di `Spacer` per creare spazio vuoto:

```swift
Spacer()
    .frame(width: 10)
```

Si può anche usare il parametro `spacing` di `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` significa che la distanza tra le due sottoviste è di 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Che cos'è spacing?**

In `VStack`, `HStack` e `ZStack`, `spacing` può controllare la distanza tra le viste figlie.

Per esempio:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

La distanza tra le viste figlie di `VStack` verrà impostata a 10 pt.

![Swift](../../RESOURCE/004_img16.png)

È importante notare che `spacing` agisce solo sulle "viste figlie dirette" e non influisce sul layout all'interno dei contenitori annidati.

**Controllare la spaziatura interna dell'elenco**

Se vuoi aumentare la distanza tra i campi, il modo più diretto è impostare `spacing` in `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

In questo modo, la distanza tra tutte le viste figlie diventerà 10 pt.

Ma osservando l'interfaccia si nota un problema:

tra i gruppi di campi c'è spazio, ma anche tra il nome del campo e il suo valore compare la stessa distanza.

Questo accade perché `spacing` agisce su tutte le viste figlie dirette del contenitore corrente.

In questa struttura, ogni `Text` è una vista figlia diretta del `VStack` esterno, quindi la spaziatura è uniforme.

Se vuoi che ci sia spazio tra i gruppi di campi, ma che tra nome del campo e valore resti la spaziatura compatta predefinita, puoi considerare "nome del campo + valore del campo" come un'unità logica e avvolgerla in un altro `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

In questo modo la struttura diventa tale che tra i `VStack` esterni c'è spazio, mentre all'interno dei `VStack` interni resta la spaziatura compatta predefinita; quindi non appariranno spazi extra tra nome del campo e valore.

![Swift](../../RESOURCE/004_img18.png)

### Presentazione personale

Ora realizziamo l'area della presentazione personale.

Dalla struttura dell'interfaccia si vede che il contenuto della presentazione è composto da più righe di testo, disposte verticalmente.

![Swift](../../RESOURCE/004_img19.png)

Perciò si può usare `VStack` insieme a `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Aumentare la spaziatura**

Adesso la sezione delle informazioni personali e quella della presentazione sono piuttosto compatte, e lo stile non è molto gradevole.

![Swift](../../RESOURCE/004_img20.png)

Poiché si trovano entrambe nello stesso contenitore esterno, possiamo controllare la spaziatura complessiva sul contenitore esterno:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Effetto ottenuto:

![Swift](../../RESOURCE/004_img21.png)

**Spaziatura della lista**

Usa `spacing` per impostare la distanza tra le righe di testo della presentazione personale:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Completare il curriculum personale

Ora la struttura di base del nostro curriculum personale è completata.

![Swift](../../RESOURCE/004_img.png)

### Vista di scorrimento

Adesso la struttura della pagina usa `VStack`, e quando il numero di righe della presentazione è ridotto non ci sono problemi. Ma se le aumentiamo a 20, 30 o anche di più, l'altezza del contenuto supererà lo schermo.

Per esempio:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

A questo punto compariranno due fenomeni:

- il contenuto in basso verrà tagliato
- la pagina non potrà scorrere

Questo non è un problema di `VStack`: `VStack` è solo un contenitore di layout e non fornisce automaticamente la capacità di scorrimento.

**Che cos'è ScrollView**

`ScrollView` è un contenitore scorrevole, adatto a grandi quantità di contenuto che superano la dimensione dello schermo, per esempio liste verticali o orizzontali.

Struttura di base:

```swift
ScrollView {
    ...
}
```

Se vuoi ottenere l'effetto di scorrimento, devi racchiudere l'intero contenuto della pagina dentro `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

In questo modo l'intera pagina diventa un'area scorrevole; quando il contenuto supera l'altezza dello schermo, sarà possibile scorrere naturalmente.

`ScrollView` mostra per default l'indicatore della barra di scorrimento. Se vuoi nasconderlo, puoi impostare:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Codice completo

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
