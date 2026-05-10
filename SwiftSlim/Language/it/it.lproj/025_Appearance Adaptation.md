# Adattamento dell’aspetto

In questa lezione impareremo ad adattare un'interfaccia alla modalità chiara e alla modalità scura.

Su iPhone, iPad e Mac, gli utenti possono scegliere la modalità chiara o la modalità scura.

Quando il sistema passa alla modalità scura, anche lo sfondo, il testo e i colori delle icone di molte app cambiano di conseguenza.

Ad esempio, l'interfaccia può usare uno sfondo chiaro di giorno e passare a uno sfondo scuro di notte.

![view](../../../Resource/025_view9.png)

Questa capacità di regolare automaticamente la visualizzazione dell'interfaccia in base all'aspetto del sistema si chiama adattamento dell'aspetto.

## Anteprima dell'adattamento dell'aspetto in Xcode

Prima di imparare l'adattamento dell'aspetto, vediamo come visualizzare in anteprima la modalità chiara e la modalità scura in Xcode.

Nella parte inferiore dell'area `Canvas`, fai clic sul pulsante `Device Settings` per aprire la finestra `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Nella finestra puoi vedere l'impostazione `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Questo significa:

- `Light Appearance` indica la modalità chiara.
- `Dark Appearance` indica la modalità scura.

Da qui possiamo cambiare l'aspetto dell'anteprima e controllare come appare l'interfaccia corrente in modalità chiara e in modalità scura.

## Mostrare due aspetti affiancati

Se vuoi visualizzare contemporaneamente la modalità chiara e la modalità scura, puoi usare la funzione `Variants`.

Nella parte inferiore dell'area `Canvas`, fai clic sul pulsante `Variants` e scegli `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Dopo la selezione, il `Canvas` mostrerà contemporaneamente le anteprime della modalità chiara e della modalità scura.

![canvas3](../../../Resource/025_view3.png)

Questo rende più comodo confrontare le differenze dell'interfaccia tra i due aspetti.

In parole semplici:

Se vuoi solo passare temporaneamente tra modalità chiara e modalità scura, puoi usare `Canvas Device Settings`.

Se vuoi visualizzare entrambi gli aspetti contemporaneamente, puoi usare `Color Scheme Variants`.

## Le viste si adattano all'aspetto per impostazione predefinita

In SwiftUI, molte viste di sistema si adattano automaticamente alla modalità chiara e alla modalità scura per impostazione predefinita.

Ad esempio:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Chiaro")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("testo testo testo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Risultato visualizzato:

![canvas](../../../Resource/025_view4.png)

Come puoi vedere, in modalità chiara le icone e i titoli di solito appaiono scuri.

In modalità scura, le icone e i titoli diventano automaticamente chiari.

Questo perché le viste SwiftUI come `Text` e `Image` regolano i propri colori in base all'aspetto del sistema per impostazione predefinita.

In altre parole, se non specifichiamo manualmente un colore fisso, SwiftUI gestirà per noi una parte dell'adattamento dell'aspetto.

## I colori fissi non si scambiano automaticamente

È importante notare che, se specifichiamo manualmente un colore fisso, questo non passerà automaticamente tra modalità chiara e modalità scura.

Ad esempio:

```swift
Text("testo testo testo")
	.foregroundStyle(Color.gray)
```

Qui il testo è impostato su `Color.gray`, quindi verrà sempre visualizzato in grigio.

Un altro esempio:

```swift
Text("Titolo")
    .foregroundStyle(Color.white)
```

Questo codice mostrerà testo bianco sia in modalità chiara sia in modalità scura.

Se anche lo sfondo è chiaro, il testo bianco potrebbe diventare difficile da leggere.

Quindi, quando adatti un'interfaccia ai diversi aspetti, cerca di evitare di scrivere casualmente colori fissi come `Color.white` e `Color.black`.

In molti casi puoi preferire gli stili semantici di sistema, ad esempio:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Questo significa:

- `.primary` viene solitamente usato per il contenuto principale.
- `.secondary` viene solitamente usato per il contenuto secondario.

Questi stili regolano automaticamente la visualizzazione in base alla modalità chiara e alla modalità scura.

## Mostrare contenuti diversi in base all'aspetto

A volte non vogliamo solo che cambino i colori, ma vogliamo anche mostrare contenuti diversi sotto aspetti diversi.

Ad esempio:

- Mostrare una normale icona di lampadina in modalità chiara.
- Mostrare un'icona di lampadina luminosa in modalità scura.
- Mostrare `Chiaro` come titolo in modalità chiara.
- Mostrare `Scuro` come titolo in modalità scura.

In questo caso dobbiamo determinare se il sistema corrente è in modalità chiara o in modalità scura.

In SwiftUI possiamo ottenere la modalità di aspetto corrente tramite il valore di ambiente `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Codice completo:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Chiaro" : "Scuro"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("testo testo testo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Risultato visualizzato:

![view](../../../Resource/025_view5.png)

Dal risultato dell'anteprima puoi vedere che la stessa vista non mostra esattamente lo stesso contenuto sotto modalità di aspetto diverse.

In modalità chiara, `Image` mostra l'icona della lampadina normale e il titolo mostra `Chiaro`.

In modalità scura, `Image` mostra l'icona della lampadina luminosa e il titolo mostra `Scuro`.

In altre parole, qui il cambiamento non riguarda solo il colore. Anche il nome dell'icona e il testo del titolo sono cambiati.

Questo perché non abbiamo scritto direttamente l'icona e il titolo dentro `body`. Invece, calcoliamo contenuti diversi in base a `colorScheme`.

In questo codice usiamo due proprietà calcolate:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Chiaro" : "Scuro"
}
```

Quando `colorScheme` è `.light`, significa che la modalità corrente è la modalità chiara.

Quando `colorScheme` è `.dark`, significa che la modalità corrente è la modalità scura.

Quindi possiamo restituire nomi di icone e testi del titolo diversi in base alle diverse modalità di aspetto.

Questo è anche un uso comune delle proprietà calcolate: calcolare il contenuto che una vista deve mostrare in base allo stato corrente.

## Capire @Environment

Questa è la prima volta che incontriamo `@Environment`.

`@Environment` può essere inteso come la lettura di un valore dall'ambiente di SwiftUI.

Quando un'app è in esecuzione, il sistema fornisce molti tipi di informazioni di ambiente, ad esempio:

- Lingua corrente
- Modalità di aspetto corrente
- Direzione di layout corrente
- Impostazione corrente della dimensione del carattere

Quando dobbiamo ottenere la modalità di aspetto corrente, possiamo leggere `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Qui:

```swift
\.colorScheme
```

significa leggere il valore `colorScheme` dall'ambiente.

```swift
private var colorScheme
```

significa salvare il valore letto nella variabile `colorScheme`.

Puoi decidere tu il nome della variabile. Ad esempio, puoi anche scrivere:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Finché il `\.colorScheme` precedente non cambia, significa che stai leggendo la modalità di aspetto corrente.

## Due valori comuni di colorScheme

`colorScheme` ha comunemente due valori:

```swift
.light
.dark
```

Significano:

- `.light`: modalità chiara
- `.dark`: modalità scura

Ad esempio:

```swift
private var titleName: String {
    colorScheme == .light ? "Chiaro" : "Scuro"
}
```

Questo codice significa:

Se la modalità corrente è la modalità chiara, `colorScheme == .light` è vero, quindi restituisce `"Chiaro"`.

Altrimenti, restituisce `"Scuro"`.

Quindi, in modalità chiara:

```swift
Text(titleName)
```

Il testo visualizzato è:

```swift
Chiaro
```

In modalità scura, il testo visualizzato è:

```swift
Scuro
```

In questo modo possiamo mostrare contenuti diversi in base ai diversi aspetti.

## Esempio di adattamento dei colori

Oltre al testo e alle icone, a volte dobbiamo anche gestire personalmente l'adattamento dei colori.

Ad esempio:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Testo")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Risultato visualizzato:

![view](../../../Resource/025_view6.png)

In questo codice, il testo è bianco e lo sfondo è nero.

In modalità chiara, lo sfondo nero è piuttosto evidente.

Tuttavia, in modalità scura, se anche l'intero sfondo dell'interfaccia è nero, questo sfondo nero si fonderà con lo sfondo di sistema e sembrerà meno chiaro.

A questo punto possiamo cambiare il colore del testo e il colore dello sfondo in base alla modalità di aspetto:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Testo")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Risultato visualizzato:

![view](../../../Resource/025_view7.png)

Ora la modalità chiara usa uno sfondo nero con testo bianco.

La modalità scura usa uno sfondo bianco con testo nero.

In questo modo, qualunque sia l'aspetto utilizzato, il testo e lo sfondo hanno un contrasto evidente e gli utenti possono vedere chiaramente il contenuto.

## Usare Assets per adattare i colori

Oltre al controllo manuale con `colorScheme`, possiamo anche usare i colori risorsa di `Assets` per adattarci alla modalità chiara e alla modalità scura.

Questo approccio è più adatto alla gestione dei colori comuni in un'app.

Nel progetto Xcode, trova la cartella delle risorse `Assets`.

![assets](../../../Resource/025_color.png)

Apri la cartella `Assets`, fai clic destro su un'area vuota e scegli `New Color Set` per creare una nuova risorsa colore.

![assets](../../../Resource/025_color1.png)

Qui creiamo un colore e lo chiamiamo `redText`.

![assets](../../../Resource/025_color2.png)

Una risorsa colore può impostare separatamente colori per la modalità chiara e per la modalità scura.

![assets](../../../Resource/025_color3.png)

Dopo aver selezionato l'area colore corrispondente, puoi modificare il colore nell'ispettore a destra.

Fai clic sul pulsante `Hide or show the Inspectors` nell'angolo in alto a destra per aprire l'area degli ispettori.

Poi scegli `Show the Attributes inspector`, trova `Show Color Panel` in basso e apri il pannello dei colori.

![assets](../../../Resource/025_color4.png)

Fai clic su un colore nel pannello dei colori e l'area colore corrispondente di `redText` cambierà contemporaneamente.

Qui impostiamo `redText` così:

- Mostra rosso in modalità chiara
- Mostra verde in modalità scura

![assets](../../../Resource/025_color5.png)

Tornando al codice SwiftUI, puoi usare questo colore così:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Qui:

```swift
Color("redText")
```

significa leggere da `Assets` la risorsa colore chiamata `redText`.

Risultato visualizzato:

![assets](../../../Resource/025_view8.png)

Puoi vedere che lo stesso `Color("redText")` mostra colori diversi in modalità chiara e in modalità scura.

Questo dimostra che anche i colori di `Assets` supportano l'adattamento dell'aspetto.

## Differenza tra colorScheme e Assets

Sia `colorScheme` sia `Assets` possono implementare l'adattamento dell'aspetto, ma sono adatti a scenari diversi.

Se devi solo cambiare contenuto del testo, nomi delle immagini o nomi di `SF Symbols` in base alla modalità chiara e alla modalità scura, puoi usare `colorScheme`.

Ad esempio:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Se un colore viene usato spesso nell'app, ad esempio un colore tema, un colore di sfondo delle schede o un colore del testo, è più consigliato usare i colori di `Assets`.

Questo perché i colori di `Assets` possono essere riutilizzati in più viste e sono più facili da modificare in seguito.

Ad esempio:

```swift
Color("redText")
```

In questo modo devi solo modificare il colore in `Assets`, e tutti i punti che usano questo colore cambieranno insieme.

## Riepilogo

In questa lezione abbiamo imparato l'adattamento dell'aspetto per la modalità chiara e la modalità scura.

Per prima cosa abbiamo imparato come visualizzare in anteprima aspetti diversi nel `Canvas` di Xcode e come usare `Color Scheme Variants` per visualizzare contemporaneamente la modalità chiara e la modalità scura.

Poi abbiamo visto che le viste SwiftUI come `Text` e `Image` adattano automaticamente i loro colori in base all'aspetto del sistema per impostazione predefinita.

Tuttavia, se specifichiamo manualmente colori fissi come `Color.white` o `Color.black`, questi colori non si scambieranno automaticamente.

Successivamente abbiamo imparato `@Environment` e `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Tramite `colorScheme`, possiamo determinare se la modalità corrente è chiara o scura e mostrare icone, testo o colori diversi in base ai diversi aspetti.

Infine abbiamo imparato i colori di `Assets`.

I colori di `Assets` possono impostare separatamente colori per la modalità chiara e per la modalità scura, quindi sono adatti alla gestione delle risorse colore comuni in un'app.

L'adattamento dell'aspetto può rendere un'app più gradevole sia di giorno sia di notte e può anche evitare problemi come testo illeggibile o sfondi poco chiari.

Nello sviluppo reale, è consigliabile preferire il comportamento di adattamento predefinito di SwiftUI e i colori di `Assets`.

Quando devi cambiare testo, icone, immagini o gestire pochi effetti di visualizzazione speciali sotto aspetti diversi, allora usa `colorScheme` per il controllo.

## Conoscenza aggiuntiva: specificare la dimensione del carattere

Quando abbiamo studiato `font` in precedenza, abbiamo usato alcuni stili di carattere di sistema:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Oltre a usare stili di carattere di sistema come `.largeTitle` e `.callout`, puoi anche specificare manualmente la dimensione del carattere.

Ad esempio:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Qui:

```swift
.font(.system(size: 100))
```

significa impostare la dimensione del carattere su `100 pt`.

Per le icone `SF Symbols`, anche `font` influisce sulla dimensione dell'icona.

Quindi, se vuoi che un'icona appaia più grande, puoi specificare la dimensione con `.font(.system(size:))`.

Ad esempio:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

È importante notare che, anche se specificare manualmente la dimensione del carattere è più flessibile, non è consigliabile usare spesso dimensioni fisse per il testo normale.

Per il testo normale, preferisci stili di carattere di sistema come `.title`, `.headline`, `.body` e `.caption`.

Questo rende più facile l'adattamento a dispositivi diversi e alle impostazioni dei caratteri dell'utente.
