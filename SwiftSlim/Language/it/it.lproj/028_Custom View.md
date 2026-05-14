# View personalizzata

In questa lezione impareremo un modo molto importante di scrivere in SwiftUI: **View personalizzata**.

Una View personalizzata può incapsulare un blocco di codice View ripetuto e trasformarlo in una View che può essere riutilizzata più volte.

Nello sviluppo reale di un'App, incontriamo spesso questa situazione: la struttura di molte schermate è la stessa, ma il contenuto visualizzato è diverso.

Per esempio, nell'elenco dei post di un sito forum, ogni post può avere informazioni come titolo, immagine e numero di Mi piace.

![Reddit](../../../Resource/028_view1.png)

Nell'elenco dei prodotti di un sito di shopping, ogni prodotto può avere informazioni come immagine, nome e prezzo.

![Amazon](../../../Resource/028_view2.png)

La struttura di questi contenuti è simile; la differenza sta solo nei dati visualizzati.

Se scriviamo manualmente il codice di ogni elemento, il codice diventerà molto lungo e non sarà comodo da modificare in seguito.

Perciò possiamo incapsulare la struttura comune in una View personalizzata e passare il contenuto diverso come parametri.

In questo modo, la stessa View può visualizzare contenuti diversi.

## Scenario di esigenza

Per esempio, ora vogliamo creare un elenco di impostazioni.

Risultato visualizzato:

![view](../../../Resource/028_view.png)

In questo elenco di impostazioni ci sono tre elementi diversi: `Impostazioni`, `Cartella`, `Musica`.

Anche se le loro icone, i colori e i titoli sono diversi, la struttura generale è la stessa:

- Icona a sinistra
- Colore di sfondo dell'icona
- Titolo al centro
- Freccia a destra

Se non usiamo una View personalizzata, potremmo scrivere così:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Impostazioni")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Cartella")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Musica")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Questo codice può essere visualizzato normalmente, ma il problema è molto evidente: il codice dei tre elementi delle impostazioni è quasi completamente identico.

Le uniche differenze sono l'icona, il colore e il titolo:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Impostazioni")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Cartella")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musica")
```

In altre parole, la struttura di ogni elemento delle impostazioni è fissa, mentre cambiano solo l'icona, il colore e il titolo.

Questa situazione è molto adatta all'uso di una View personalizzata.

### Ombra shadow

Qui usiamo un nuovo modifier, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` può aggiungere un'ombra a una View.

`radius` indica il raggio di sfocatura dell'ombra. Più grande è il valore, più ampia è di solito l'area di diffusione dell'ombra, e più morbida apparirà.

Qui è impostato su `1`, cioè viene aggiunto solo un effetto ombra molto leggero.

## Incapsulare la View dell'elemento di impostazione

Successivamente incapsuliamo ogni elemento delle impostazioni in una nuova View.

Possiamo creare una `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

In questa View definiamo tre proprietà:

```swift
let icon: String
let color: Color
let title: String
```

Tra queste:

- `icon` indica il nome dell'icona
- `color` indica il colore di sfondo dell'icona
- `title` indica il titolo dell'elemento delle impostazioni

Poiché questi tre contenuti sono diversi nei diversi elementi delle impostazioni, li trasformiamo in parametri che possono essere passati dall'esterno.

## Usare una View personalizzata

Dopo aver creato `SettingItemView`, non abbiamo più bisogno di scrivere ripetutamente un grande blocco di codice `HStack`.

Ora possiamo usarla così:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")
```

Questa riga di codice significa creare una View per un elemento delle impostazioni e passare tre parametri:

```swift
icon: "gear"
color: Color.blue
title: "Impostazioni"
```

Dopo il passaggio, le proprietà interne di `SettingItemView` otterranno i valori corrispondenti:

- il valore di `icon` è `gear`
- il valore di `color` è `Color.blue`
- il valore di `title` è `"Impostazioni"`

Perciò, all'interno della View, `Image(systemName: icon)` mostrerà l'icona dell'ingranaggio, `.background(color)` userà uno sfondo blu e `Text(title)` mostrerà `Impostazioni`.

Codice completo:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Cartella")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musica")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Risultato visualizzato:

![view](../../../Resource/028_view.png)

Si può vedere che, dopo l'incapsulamento, il risultato visualizzato è lo stesso di prima, ma il codice è diventato più chiaro.

Prima ogni elemento delle impostazioni doveva scrivere un intero blocco `HStack`, mentre ora basta una sola riga di codice:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")
```

Questo è il ruolo di una View personalizzata: **incapsulare una struttura View ripetuta e passare solo il contenuto diverso come parametri.**

## Perché si possono passare parametri

Successivamente capiamo in modo semplice perché una View personalizzata può ricevere parametri.

In SwiftUI, una View è essenzialmente una struttura.

Per esempio:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ciao, mondo!")
    }
}
```

Qui `ContentView` è una struttura.

Quando scriviamo:

```swift
ContentView()
```

in realtà stiamo creando una View `ContentView`.

Le `()` finali indicano la chiamata al suo metodo di inizializzazione; si può anche intendere come la creazione di questa View.

Poiché questa `ContentView` non ha proprietà da passare dall'esterno, possiamo scrivere direttamente:

```swift
ContentView()
```

Ma se nella View esiste una proprietà senza valore, quando creiamo la View dobbiamo passare il valore corrispondente.

Per esempio:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nome: \(name)")
    }
}
```

Qui `name` è una proprietà e non ha un valore predefinito.

Perciò, quando creiamo `ContentView`, dobbiamo assegnare a `name` un valore concreto:

```swift
ContentView(name: "Fang Junyu")
```

In questo modo, la View potrà usare questo valore al suo interno:

```swift
Text("nome: \(name)")
```

Questo è anche il motivo per cui dobbiamo passare parametri quando creiamo `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")
```

Perché in `SettingItemView` ci sono tre proprietà senza valori predefiniti:

```swift
let icon: String
let color: Color
let title: String
```

Quindi, quando creiamo questa View, dobbiamo passarle all'interno. I parametri passati verranno usati da Swift per assegnare valori alle proprietà interne della View.

## Metodo di inizializzazione

Successivamente capiamo un po' meglio il metodo di inizializzazione.

### Metodo di inizializzazione predefinito

Quando definiamo una View normale:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ciao, mondo!")
    }
}
```

In questo codice non abbiamo scritto manualmente un metodo di inizializzazione.

Ma quando usiamo questa View, possiamo scrivere così:

```swift
ContentView()
```

Qui `()` significa in realtà creare `ContentView`; si può anche intendere come chiamare il suo metodo di inizializzazione.

### Perché si può chiamare anche se non vediamo un metodo di inizializzazione?

Perché il compilatore Swift genera automaticamente un metodo di inizializzazione per noi.

Bisogna notare che: **questo metodo di inizializzazione viene generato automaticamente e di solito non lo vediamo direttamente nel codice.**

In altre parole, anche se non abbiamo scritto manualmente in `struct`:

```swift
init() {

}
```

il compilatore Swift genererà dietro le quinte un metodo di inizializzazione simile a questo:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Ciao, mondo!")
    }
}
```

Ecco perché possiamo scrivere direttamente:

```swift
ContentView()
```

Perciò, nel codice reale, di solito non è necessario scrivere manualmente il metodo di inizializzazione.

Basta capire una cosa: **quando si crea una SwiftUI View, viene chiamato il metodo di inizializzazione di quella View. Anche se non scriviamo manualmente il metodo di inizializzazione, Swift può generarlo automaticamente.**

### Metodo di inizializzazione con parametri

Se in una View esiste una proprietà senza valore predefinito, per esempio:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nome: \(name)")
    }
}
```

il compilatore Swift genererà automaticamente un metodo di inizializzazione con parametro in base alla proprietà.

Possiamo comprenderlo semplicemente così:

```swift
init(name: String) {
    self.name = name
}
```

Qui:

```swift
init(name: String)
```

significa che, quando creiamo `ContentView`, dobbiamo passare un parametro `name` di tipo `String`.

Quando scriviamo:

```swift
ContentView(name: "Fang Junyu")
```

significa: passare `"Fang Junyu"` come parametro al metodo di inizializzazione.

Poi, all'interno del metodo di inizializzazione, verrà eseguito:

```swift
self.name = name
```

Questa riga di codice significa: assegnare il `name` passato dall'esterno alla proprietà `name` della View corrente.

Possiamo comprenderlo semplicemente così:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nome: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

In questo modo, la View può usare internamente il valore passato.

Questo è il flusso di inizializzazione di una View con parametri: **quando una proprietà nella View non ha un valore predefinito, al momento della creazione della View bisogna passare il parametro corrispondente, così il metodo di inizializzazione completa l'assegnazione del valore alla proprietà.**

## Caso in cui una proprietà ha un valore predefinito

Se una proprietà ha già un valore predefinito, quando creiamo la View possiamo non passare il parametro.

Per esempio:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nome: \(name)")
    }
}
```

Qui `name` ha già un valore predefinito:

```swift
"Fang Junyu"
```

Perciò, quando creiamo `ContentView`, possiamo scrivere direttamente:

```swift
ContentView()
```

In questo momento `name` userà il valore predefinito e l'interfaccia mostrerà:

```swift
nome: Fang Junyu
```

Naturalmente, quando creiamo la View possiamo anche passare un nuovo valore:

```swift
ContentView(name: "Sam")
```

In questo momento, la View userà `"Sam"` passato dall'esterno invece del valore predefinito, e l'interfaccia mostrerà:

```swift
nome: Sam
```

Per facilitare la comprensione, possiamo vedere in modo semplice il metodo di inizializzazione generato automaticamente dal compilatore Swift così:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Qui `name: String = "Fang Junyu"` significa: se quando creiamo la View non passiamo `name`, usare il valore predefinito `"Fang Junyu"`; se quando creiamo la View passiamo un nuovo `name`, usare il valore passato.

In altre parole: **se dall'esterno non viene passato un parametro, si usa il valore predefinito della proprietà; se dall'esterno viene passato un parametro, si usa il valore passato.**

## Torniamo a SettingItemView

Ora torniamo a vedere SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

La struttura di questa View è fissa.

Le parti fisse includono:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Le parti diverse includono:

```swift
icon
color
title
```

Perciò trasformiamo il contenuto diverso in proprietà e lo passiamo come parametri quando creiamo la View.

Quando creiamo elementi delle impostazioni diversi, dobbiamo solo passare parametri diversi:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")
SettingItemView(icon: "folder", color: Color.brown, title: "Cartella")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musica")
```

In questo modo, la stessa `SettingItemView` può visualizzare tre elementi delle impostazioni diversi.

Questo è il modo più comune di usare una View personalizzata.

## Riepilogo

In questa lezione abbiamo imparato la View personalizzata.

Il ruolo principale di una View personalizzata è: **incapsulare il codice View ripetuto, così da poterlo riutilizzare.**

In questo esempio, la struttura dei tre elementi delle impostazioni è la stessa; cambiano solo icona, colore e titolo.

Perciò abbiamo creato una `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Poi, quando usiamo questa View, passiamo parametri diversi:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Impostazioni")
```

Questi parametri entrano all'interno di `SettingItemView`.

Con questo metodo possiamo usare meno codice per creare View con la stessa struttura ma con contenuti diversi.

Questo è anche un modo di scrivere molto comune nello sviluppo SwiftUI.
