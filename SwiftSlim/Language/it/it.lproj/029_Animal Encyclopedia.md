# Enciclopedia degli animali

In questa lezione continuiamo a esercitarci con le viste personalizzate e il passaggio dei dati.

Creeremo una semplice vista di enciclopedia degli animali. La pagina mostrerà cinque animali; quando tocchi un animale, verrà aperta una vista di dettaglio che mostra l'immagine, l'area di distribuzione, l'habitat e la descrizione di quell'animale.

Risultato finale:

![view](../../../Resource/029_view.png)

Con questo esempio possiamo esercitarci sulla collaborazione tra strutture dati, visualizzazione di liste, interazione al tocco e viste Sheet.

## Preparare le immagini

Per prima cosa, dobbiamo preparare cinque immagini di animali:

- Delfino: `dolphin.jpg`
- Giraffa: `giraffe.jpg`
- Leone: `lion.jpg`
- Panda: `panda.jpg`
- Orso polare: `polarBear.jpg`

Puoi usare queste immagini:

[Delfino](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraffa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Leone](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Orso polare](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Dopo aver scaricato le immagini, trascinale nella cartella risorse `Assets` del progetto Xcode.

![assets](../../../Resource/029_assets.png)

Nota: quando usi un'immagine nel codice, di solito non è necessario scrivere l'estensione `.jpg`.

Ad esempio, se il nome della risorsa immagine è `dolphin`, nel codice scrivi:

```swift
Image("dolphin")
```

Se il nome dell'immagine è scritto in modo errato, l'immagine non verrà visualizzata correttamente.

Nota: le immagini sopra provengono dai progetti Wikimedia. Quando le usi, è consigliabile conservare i link originali e le informazioni sulla fonte.

## Creare la struttura Animal

In questa pagina, ogni animale ha diverse informazioni:

- Nome dell'animale
- Immagine dell'animale
- Emoji dell'animale
- Area di distribuzione
- Habitat
- Descrizione dell'animale

Se dividiamo queste informazioni in molte variabili separate, il codice diventerà più disordinato. Per questo possiamo creare una struttura `Animal` e mettere insieme le informazioni di un singolo animale.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

In questo codice:

- `id`: identificatore univoco dell'animale.
- `name`: nome dell'animale.
- `imageName`: nome dell'immagine dell'animale.
- `avatarEmoji`: emoji dell'animale.
- `distributionArea`: area di distribuzione.
- `habitat`: habitat.
- `animalDescription`: descrizione dell'animale.

Tra questi:

```swift
let id = UUID()
```

`id` serve a identificare ogni animale. Più avanti useremo `ForEach` per mostrare la lista degli animali e useremo anche `.sheet(item:)` per aprire il dettaglio in base all'animale selezionato, quindi dobbiamo fare in modo che `Animal` sia conforme al protocollo `Identifiable`.

Il ruolo di `Identifiable` è dire a SwiftUI: ogni animale ha un `id` che permette di distinguerne l'identità.

## Creare i dati degli animali

Poi creiamo un array di animali in `ContentView`.

L'array salva cinque `Animal`, e ogni `Animal` rappresenta un animale.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfino
        Animal(
            name: "Delfino",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceani caldi e temperati in tutto il mondo.",
            habitat: "Oceani, acque costiere e alcuni grandi fiumi.",
            animalDescription: "I delfini sono mammiferi marini intelligenti. Vivono in gruppi, comunicano con suoni e sono noti per il loro comportamento giocoso."
        ),
        // Giraffa
        Animal(
            name: "Giraffa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane e boschi aperti in Africa.",
            habitat: "Praterie, savane e foreste aperte.",
            animalDescription: "Le giraffe sono gli animali terrestri più alti. Hanno colli lunghi, zampe lunghe e di solito si nutrono di foglie degli alberi alti."
        ),
        // Leone
        Animal(
            name: "Leone",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Presente soprattutto nell'Africa subsahariana, con una piccola popolazione nell'India occidentale.",
            habitat: "Praterie, savane e boschi aperti.",
            animalDescription: "I leoni sono potenti grandi felini. Di solito vivono in gruppi chiamati branchi e sono spesso conosciuti come i re del mondo animale."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Foreste montane della Cina centrale.",
            habitat: "Foreste di bambù in aree montane fresche e umide.",
            animalDescription: "I panda sono orsi noti per la loro pelliccia bianca e nera. Mangiano soprattutto bambù e sono tra gli animali più riconoscibili al mondo."
        ),
        // Orso polare
        Animal(
            name: "Orso polare",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regioni artiche attorno al Polo Nord.",
            habitat: "Ghiaccio marino, aree costiere e ambienti artici freddi.",
            animalDescription: "Gli orsi polari sono grandi orsi adattati agli ambienti freddi. Sono ottimi nuotatori e dipendono principalmente dal ghiaccio marino per cacciare le foche."
        )
    ]

    var body: some View {
        Text("Enciclopedia degli animali")
    }
}
```

Qui `animals` è un array:

```swift
let animals: [Animal]
```

`[Animal]` indica che questo array contiene più elementi di tipo `Animal`.

In altre parole, `animals` non è un solo animale, ma un gruppo di animali.

## Mostrare la lista degli animali

Ora possiamo usare `ForEach` per mostrare la lista degli animali.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())

                Text(animal.name)
                    .fontWeight(.bold)

                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Risultato:

![view](../../../Resource/029_view1.png)

In questo codice:

```swift
ForEach(animals) { animal in
    ...
}
```

significa attraversare l'array `animals`.

A ogni ciclo, `animal` rappresenta l'animale che viene mostrato in quel momento.

Ad esempio, al primo ciclo `animal` è il delfino; al secondo ciclo `animal` è la giraffa.

Quindi possiamo mostrare le informazioni dell'animale corrente in questo modo:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

In questo modo possiamo mostrare tutti e cinque gli animali.

## Rendere cliccabile la lista degli animali

Ora la lista è già visualizzata, ma non è ancora cliccabile.

Se vogliamo aprire il dettaglio dopo il tocco su un animale, dobbiamo prima registrare "l'animale attualmente selezionato".

Perciò aggiungiamo una variabile di stato in `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Qui `selectedAnimal` è un valore opzionale di tipo `Animal?`.

Significa che può contenere un animale, oppure non contenere nessun animale.

Il valore predefinito è `nil`, cioè all'inizio non è selezionato nessun animale.

Poi trasformiamo ogni riga degli animali in un `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())

            Text(animal.name)
                .fontWeight(.bold)

            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Il punto chiave è questa riga di codice:

```swift
selectedAnimal = animal
```

Quando l'utente tocca un animale, salviamo quell'animale in `selectedAnimal`.

Ad esempio, se l'utente tocca il delfino, `selectedAnimal` salva il delfino.

Se l'utente tocca il panda, `selectedAnimal` salva il panda.

In altre parole, `selectedAnimal` serve a registrare quale animale l'utente ha toccato in quel momento.

## Vista Sheet

Ora possiamo già registrare "l'animale toccato" tramite il pulsante.

Il passo successivo è implementare una vista a comparsa per mostrare il dettaglio dell'animale.

![view](../../../Resource/029_view2.png)

In SwiftUI puoi usare `Sheet` per ottenere questo effetto di presentazione.

Puoi intendere `Sheet` come una pagina temporanea che appare. Viene mostrata sopra la pagina corrente e, dopo aver consultato il contenuto, l'utente può scorrere verso il basso per chiuderla.

## Esempio di Sheet

Prima di mostrare davvero il dettaglio dell'animale, usiamo un esempio semplice per capire come viene presentato un `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Mostra Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Vista Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Risultato:

![view](../../../Resource/029_view3.png)

In questo codice creiamo un valore booleano:

```swift
@State private var showSheet = false
```

Il valore predefinito di `showSheet` è `false`, cioè all'inizio il `Sheet` non viene mostrato.

Quando tocchiamo il pulsante:

```swift
showSheet.toggle()
```

`toggle()` significa invertire un valore booleano.

Se prima era `false`, dopo aver chiamato `toggle()` diventa `true`.

Se prima era `true`, dopo aver chiamato `toggle()` diventa `false`.

Quindi, dopo il tocco sul pulsante, `showSheet` passa da `false` a `true`.

Quando `showSheet` diventa `true`, questo codice presenta il `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Questo codice significa: quando `showSheet` è `true`, presenta un `Sheet` e mostra `Text("Vista Sheet")` al suo interno.

Risultato:

![view](../../../Resource/029_view4.png)

Questa scrittura è adatta per presentare contenuti fissi.

Ad esempio, dopo il tocco su un pulsante puoi presentare una pagina impostazioni, una pagina di spiegazione, una pagina di avviso e così via.

### Posizione in cui si scrive Sheet

Anche se `Sheet` è una vista a comparsa, in SwiftUI non si scrive direttamente come una vista indipendente tipo `Text()` o `Image()`, ma si usa come modificatore di vista.

In altre parole, `.sheet(...)` è simile a modificatori come `.font()`, `.padding()` e `.shadow()`: deve essere aggiunto dopo una certa vista.

Ad esempio:

```swift
Button("Mostra Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

In questo esempio, `.sheet` è aggiunto dopo `Button`.

Quando `showSheet` diventa `true`, SwiftUI presenta il `Sheet` e mostra il contenuto tra parentesi graffe:

```swift
Text("Vista Sheet")
```

Tuttavia, nello sviluppo reale, se una pagina contiene più pulsanti, di solito non aggiungiamo uno `.sheet` a ogni pulsante.

Un approccio più comune è aggiungere `.sheet` alla vista esterna.

Ad esempio:

```swift
VStack {
    Button("Mostra Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Il pulsante è responsabile della modifica di `showSheet`, mentre la vista esterna è responsabile della presentazione del `Sheet` in base al fatto che `showSheet` sia `true` o meno.

## Sheet associato a un valore opzionale

La scrittura che abbiamo imparato prima è:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Questa scrittura è adatta per controllare la visualizzazione e la chiusura di una pagina fissa.

Ma nell'esempio dell'enciclopedia degli animali non dobbiamo solo sapere "se presentare il `Sheet`", dobbiamo anche sapere "quale animale è stato toccato".

Ad esempio:

Se l'utente tocca il delfino, il `Sheet` deve mostrare il dettaglio del delfino.

Se l'utente tocca il panda, il `Sheet` deve mostrare il dettaglio del panda.

Quindi qui è più adatta un'altra scrittura di Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Contenuto mostrato nel Sheet
}
```

In questo codice, `Sheet` è associato a un valore opzionale `selectedAnimal`.

Qui bisogna notare che dopo `item:` scriviamo `$selectedAnimal`, non `selectedAnimal`.

Perché `Sheet` non deve solo leggere il valore di `selectedAnimal`, ma deve anche decidere se presentarsi in base ai suoi cambiamenti.

Questo codice può essere compreso così:

- Quando `selectedAnimal` è `nil`, il `Sheet` non viene mostrato.
- Quando `selectedAnimal` ha un valore, il `Sheet` viene mostrato.
- Quando il `Sheet` viene chiuso, SwiftUI riporta `selectedAnimal` a `nil`.

SwiftUI passa l'animale salvato in `selectedAnimal` al parametro `animal` tra parentesi graffe.

In altre parole, `.sheet(item:)` non solo controlla la presentazione, ma passa anche i dati selezionati dentro il `Sheet`.

## Usare Sheet per mostrare il nome dell'animale

Ora non creiamo subito una vista di dettaglio complessa.

Per rendere il codice più facile da capire, prima mostriamo nel `Sheet` il nome dell'animale corrente.

Aggiungi `.sheet(item:)` fuori dal `VStack`:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())

                    Text(animal.name)
                        .fontWeight(.bold)

                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

La parte più importante qui è questo codice:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Quando `selectedAnimal` ha un valore, il `Sheet` viene presentato.

Il parametro `animal` tra parentesi graffe è l'animale attualmente selezionato.

Quindi:

```swift
Text(animal.name)
```

mostrerà il nome dell'animale attualmente toccato.

Ad esempio, toccando `Delfino`, nel Sheet viene mostrato `Delfino`.

Toccando `Panda`, nel `Sheet` viene mostrato `Panda`.

Così realizziamo l'effetto di toccare animali diversi e presentare nomi di animali diversi.

Mostrare il nome dell'animale:

![view](../../../Resource/029_view5.png)

Tuttavia, il dettaglio dell'animale non dovrebbe mostrare solo un nome, ma anche nome, area di distribuzione, habitat e descrizione.

Se scriviamo tutto questo codice dentro `.sheet`, il codice diventa molto lungo e poco leggibile.

Perciò, ora creiamo una nuova vista personalizzata dedicata alla visualizzazione del dettaglio dell'animale.

## Creare la vista di dettaglio dell'animale

Ora creiamo una nuova vista personalizzata `AnimalDetailView`.

Questa vista riceve un `Animal` e mostra il dettaglio dell'animale.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Area di distribuzione**: \(animal.distributionArea)")

                    Divider()

                    Text("**Habitat**: \(animal.habitat)")

                    Divider()

                    Text("**Descrizione dell'animale**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Risultato:

![view](../../../Resource/029_view2.png)

Il punto chiave qui è:

```swift
var animal: Animal
```

Questo indica che `AnimalDetailView` deve ricevere un animale dall'esterno.

Dopo aver ricevuto l'animale, la vista di dettaglio può usare tutte le informazioni di quell'animale:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

In altre parole, `AnimalDetailView` è responsabile solo della visualizzazione dell'animale passato.

### Testo in grassetto con Markdown

Nella vista di dettaglio abbiamo scritto questo codice:

```swift
Text("**Habitat:** \(animal.habitat)")
```

Qui ci sono due concetti.

Primo, `**Habitat:**` usa la sintassi `Markdown`. Il testo racchiuso tra due asterischi viene mostrato in grassetto.

Secondo, `\()` è l'interpolazione di stringa, che permette di mostrare il valore di una variabile dentro un testo.

Questo codice significa: prima mostra `Habitat:` in grassetto, poi mostra l'habitat di questo animale.

## Mostrare la vista di dettaglio in Sheet

Dopo aver creato `AnimalDetailView`, possiamo tornare in `ContentView` e sostituire la vista del nome originale nel `Sheet` con la vista di dettaglio.

Prima era:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ora diventa:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Qui `animal:` è il nome del parametro di `AnimalDetailView`.

L'`animal` dopo i due punti è l'animale corrente passato da `.sheet(item:)`.

Cioè passiamo l'animale attualmente toccato ad `AnimalDetailView` per mostrarlo.

Struttura completa:

```swift
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
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())

                    Text(animal.name)
                        .fontWeight(.bold)

                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
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
```

Quando l'utente tocca un animale:

```swift
selectedAnimal = animal
```

`selectedAnimal` passa da `nil` a un animale concreto; il `Sheet` rileva che `selectedAnimal` ha un valore e presenta la vista.

Il `Sheet` passa l'animale dentro `selectedAnimal` alla vista `AnimalDetailView`, e `AnimalDetailView` mostra il dettaglio dell'animale.

Così realizziamo la funzione: toccare la lista degli animali e aprire il dettaglio corrispondente.

## Differenza tra le due scritture di Sheet

Ora abbiamo già usato `.sheet(item:)` per completare la visualizzazione del dettaglio dell'animale.

Qui possiamo riassumere brevemente le due scritture comuni di `Sheet`.

### La prima associa un valore booleano

```swift
@State private var showSheet = false

Button("Mostra Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Questa scrittura è adatta per presentare contenuti fissi, come pagine impostazioni, pagine di spiegazione, pagine di avviso e così via.

`showSheet` è un valore booleano e ha solo due stati: `true` e `false`.

Quando `showSheet` è `true`, il `Sheet` viene mostrato.

Quando `showSheet` è `false`, il `Sheet` non viene mostrato.

### La seconda associa un valore opzionale

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Questa scrittura è adatta per presentare contenuti diversi in base ai dati selezionati.

In questa lezione tocchiamo animali diversi e dobbiamo mostrare dettagli diversi, quindi usare `.sheet(item:)` è più appropriato.

## Codice completo

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()

    // Nome dell'animale
    let name: String

    // Immagine dell'animale
    let imageName: String

    // Emoji dell'animale
    let avatarEmoji: String

    // Area di distribuzione
    let distributionArea: String

    // Habitat
    let habitat: String

    // Descrizione dell'animale
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil

    let animals: [Animal] = [
        // Delfino
        Animal(
            name: "Delfino",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceani caldi e temperati in tutto il mondo.",
            habitat: "Oceani, acque costiere e alcuni grandi fiumi.",
            animalDescription: "I delfini sono mammiferi marini intelligenti. Vivono in gruppi, comunicano con suoni e sono noti per il loro comportamento giocoso."
        ),
        // Giraffa
        Animal(
            name: "Giraffa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savane e boschi aperti in Africa.",
            habitat: "Praterie, savane e foreste aperte.",
            animalDescription: "Le giraffe sono gli animali terrestri più alti. Hanno colli lunghi, zampe lunghe e di solito si nutrono di foglie degli alberi alti."
        ),
        // Leone
        Animal(
            name: "Leone",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Presente soprattutto nell'Africa subsahariana, con una piccola popolazione nell'India occidentale.",
            habitat: "Praterie, savane e boschi aperti.",
            animalDescription: "I leoni sono potenti grandi felini. Di solito vivono in gruppi chiamati branchi e sono spesso conosciuti come i re del mondo animale."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Foreste montane della Cina centrale.",
            habitat: "Foreste di bambù in aree montane fresche e umide.",
            animalDescription: "I panda sono orsi noti per la loro pelliccia bianca e nera. Mangiano soprattutto bambù e sono tra gli animali più riconoscibili al mondo."
        ),
        // Orso polare
        Animal(
            name: "Orso polare",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regioni artiche attorno al Polo Nord.",
            habitat: "Ghiaccio marino, aree costiere e ambienti artici freddi.",
            animalDescription: "Gli orsi polari sono grandi orsi adattati agli ambienti freddi. Sono ottimi nuotatori e dipendono principalmente dal ghiaccio marino per cacciare le foche."
        )
    ]

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
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
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

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Area di distribuzione**: \(animal.distributionArea)")

                    Divider()

                    Text("**Habitat**: \(animal.habitat)")

                    Divider()

                    Text("**Descrizione dell'animale**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Riepilogo

In questa lezione abbiamo completato una semplice pagina di enciclopedia degli animali.

Prima usiamo la struttura `Animal` per salvare le informazioni degli animali, poi usiamo un array per salvare cinque animali e infine usiamo `ForEach` per mostrare la lista degli animali.

Quando l'utente tocca un animale, salviamo quell'animale in `selectedAnimal`:

```swift
selectedAnimal = animal
```

Quando `selectedAnimal` ha un valore, `.sheet(item:)` presenta la vista di dettaglio e passa l'animale selezionato ad `AnimalDetailView`.

La cosa più importante di questa lezione non è lo stile dell'interfaccia, ma capire questo percorso di passaggio dei dati:

```swift
Tocco sull'animale → selectedAnimal salva l'animale → Sheet viene presentato → AnimalDetailView mostra il dettaglio
```

Dopo aver capito questo percorso, in futuro potrai creare più funzioni simili, ad esempio dettagli di prodotti, dettagli di corsi, dettagli di articoli, dettagli di contatti e così via.
