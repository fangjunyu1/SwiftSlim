# Galleria fotografica

In questa lezione realizzeremo una pagina di galleria fotografica.

![view](../../../Resource/032_view13.png)

In questo caso, ripasseremo le conoscenze su `extension`, `self` e le istanze, e impareremo le grafiche `Shape` comunemente usate in SwiftUI.

Con queste conoscenze, possiamo ritagliare immagini comuni in stili diversi, come cerchi, rettangoli arrotondati, capsule ed ellissi, e aggiungere effetti di bordo alle foto.

In questa lezione useremo alcuni nuovi concetti: `Shape`, `clipShape`, `strokeBorder` e `overlay`.

Tra questi, `clipShape` viene usato per ritagliare la forma di una vista, `strokeBorder` viene usato per disegnare il bordo di una forma, e `overlay` viene usato per sovrapporre una nuova vista sopra la vista corrente.

## Risorse immagine

Prima di iniziare, dobbiamo preparare alcune immagini.

Puoi usare le tue foto, oppure le immagini di esempio fornite in questa lezione.

Gli esempi fotografici di questa lezione provengono dal sito [Pixabay](https://pixabay.com/):

[Paesaggio](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Volpe](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Edificio](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Fiore](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Cigno](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Dopo aver scaricato le immagini, aggiungile alla cartella delle risorse `Assets` e nominale in ordine `1`, `2`, `3`, `4` e `5`.

![assets](../../../Resource/032_view17.png)

In questo modo, possiamo mostrare le immagini in SwiftUI usando `Image("1")`, `Image("2")` e così via.

## Visualizzare le foto

Per prima cosa, visualizziamo 5 foto in `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Risultato visualizzato:

![view](../../../Resource/032_view.png)

In questo codice, usiamo `ScrollView` per rendere scorrevole l'elenco delle foto e usiamo `VStack` per disporre più immagini dall'alto verso il basso.

Ogni immagine usa `.resizable()`, `.scaledToFit()` e `.frame(width: 300)` per impostare il suo effetto di visualizzazione, in modo che l'immagine possa essere ridimensionata, mantenere le proporzioni e avere una larghezza limitata.

Il `.padding(.vertical, 100)` su `VStack` serve ad aumentare la spaziatura superiore e inferiore, evitando che la prima e l'ultima foto siano troppo vicine ai bordi dello schermo.

L'ultimo `.ignoresSafeArea()` indica che la vista di scorrimento ignora l'area sicura, permettendo alle foto di estendersi fino alla parte superiore e inferiore dello schermo durante lo scorrimento, rendendo la visualizzazione della pagina più completa.

Tuttavia, attualmente le 5 immagini usano tutte gli stessi modificatori:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Quando vediamo codice ripetuto, possiamo considerare l'uso di una `extension` per organizzarlo.

## Usare extension per organizzare lo stile delle immagini

Possiamo estendere `Image` con un metodo dedicato alla galleria fotografica:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Qui, estendiamo il tipo `Image` con un metodo `photoGalleryStyle`.

Questo metodo contiene i precedenti `.resizable()`, `.scaledToFit()` e `.frame(width: 300)` usati ripetutamente. In altre parole, organizza insieme il codice per il ridimensionamento dell'immagine, la visualizzazione proporzionale e l'impostazione della larghezza.

Dopo aver usato questa estensione, il codice immagine originale:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

può essere semplificato in:

```swift
Image("1")
    .photoGalleryStyle()
```

In questo modo, ogni immagine deve solo chiamare `.photoGalleryStyle()` per applicare lo stesso stile della galleria fotografica. Il codice diventa più pulito ed è anche più comodo da modificare in modo uniforme in seguito.

## Comprendere self

Nel metodo dell'estensione, abbiamo scritto `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Qui, `self` rappresenta l'istanza immagine corrente che chiama questo metodo.

Per esempio:

```swift
Image("1")
    .photoGalleryStyle()
```

In questo codice, `photoGalleryStyle()` è chiamato da `Image("1")`, quindi il `self` all'interno del metodo rappresenta questa immagine `Image("1")`.

Puoi capirlo semplicemente così: chi chiama questo metodo è ciò che `self` rappresenta.

È importante notare che i modificatori di SwiftUI restituiscono continuamente nuovi risultati di vista. Pertanto, `photoGalleryStyle()` restituisce una vista modificata, invece di restituire semplicemente l'`Image` originale stessa.

## Forme delle foto

Ora le foto possono già essere visualizzate normalmente. Tuttavia, per impostazione predefinita queste foto sono rettangolari, quindi appaiono piuttosto comuni.

Se vuoi solo che le foto abbiano angoli arrotondati, puoi usare direttamente `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Risultato visualizzato:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` significa aggiungere all'immagine un raggio degli angoli di `20 pt`. Per immagini comuni con angoli arrotondati, questa sintassi è già sufficiente.

Tuttavia, `.cornerRadius()` può gestire solo l'effetto degli angoli arrotondati ed è adatto per creare immagini ordinarie con angoli arrotondati. Se vogliamo trasformare le foto in più forme diverse, questo modificatore da solo non basta.

A questo punto, dobbiamo usare `Shape` in SwiftUI. `Shape` può rappresentare diverse grafiche e, insieme a `clipShape`, può ritagliare un'immagine nella forma corrispondente.

## Conoscere Shape

In SwiftUI, `Shape` rappresenta una grafica. Come `View`, è un tipo molto usato in SwiftUI.

I tipi comuni di `Shape` includono cerchio, rettangolo, rettangolo arrotondato, capsula ed ellisse. Per osservare in modo più intuitivo l'aspetto delle diverse grafiche, gli esempi seguenti impostano colori e dimensioni diversi per ogni grafica.

In questi esempi, `.fill()` viene usato per riempire la grafica con un colore, mentre `.frame()` viene usato per impostare la dimensione di visualizzazione della grafica. I colori servono solo a distinguere le diverse grafiche e non sono colori fissi delle grafiche stesse.

### Circle cerchio

`Circle` rappresenta un cerchio. È spesso usato per avatar, pulsanti circolari, immagini circolari e altri effetti dell'interfaccia.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rettangolo

`Rectangle` rappresenta un rettangolo. È una delle grafiche più basilari e può essere usato anche per creare sfondi, aree divise o bordi comuni.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle rettangolo arrotondato

`RoundedRectangle` rappresenta un rettangolo arrotondato. `cornerRadius` viene usato per impostare la dimensione degli angoli arrotondati.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule capsula

`Capsule` rappresenta una forma a capsula. Le sue due estremità sono ad arco ed è spesso usata per pulsanti a capsula, sfondi di etichette e altri effetti dell'interfaccia.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellisse

`Ellipse` rappresenta un'ellisse. È simile a `Circle`, ma quando larghezza e altezza sono diverse, viene visualizzata come un'ellisse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Da questi esempi possiamo vedere che `Shape` stessa può essere visualizzata direttamente come una grafica. Successivamente, useremo questi tipi `Shape` insieme a `clipShape` per ritagliare le foto e farle apparire in forme diverse.

## Usare clipShape per ritagliare le foto

Ora possiamo usare `clipShape` per ritagliare le foto in forme diverse.

Per esempio, ritagliamo la prima foto in un cerchio:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Questo codice significa: prima mostra un'immagine, poi usa `Circle()` per ritagliarla in un cerchio.

![view](../../../Resource/032_view2.png)

La sintassi di base di `clipShape` è:

```swift
.clipShape(forma)
```

Aggiungi `.clipShape(...)` dopo la vista e inserisci tra parentesi la grafica in cui vuoi ritagliarla.

Per esempio:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Ora ritagliamo le 5 foto in forme diverse:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Risultato visualizzato:

![view](../../../Resource/032_view8.png)

Tra queste, l'effetto dopo il ritaglio con `Rectangle()` è simile a una normale foto rettangolare, quindi il cambiamento visivo non è evidente. Serve principalmente per il confronto con altre forme.

Ora le foto non sono più soltanto rettangoli comuni, ma hanno forme diverse.

## Aggiungere bordi alle foto

Se vogliamo aggiungere un bordo a una foto circolare, potremmo pensare di usare `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Tuttavia, di solito così non otteniamo un bordo circolare, ma un bordo rettangolare.

![view](../../../Resource/032_view9.png)

Questo perché `border` aggiunge il bordo in base all'area rettangolare della vista, non in base alla forma dopo il ritaglio con `clipShape`.

Quindi, se vogliamo un bordo circolare, non possiamo usare direttamente `border`.

## Usare strokeBorder per disegnare bordi di forma

In SwiftUI, `strokeBorder` può disegnare bordi interni per questi tipi comuni di `Shape`.

Per esempio, disegniamo un bordo circolare:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Questo codice significa: disegnare un bordo marrone per `Circle`, con una larghezza del bordo di `10 pt`.

![view](../../../Resource/032_view12.png)

Qui è importante notare che `strokeBorder` non aggiunge direttamente un bordo alla foto. Disegna invece un bordo per questa grafica `Circle()`.

In altre parole, questo codice crea solo un bordo circolare indipendente e non ha ancora relazione con la foto.

Se vogliamo che questo bordo circolare appaia sopra la foto, dobbiamo continuare a usare `overlay` per sovrapporre il bordo alla foto.

## Usare overlay per sovrapporre bordi

`overlay` è un modificatore di vista che può sovrapporre una nuova vista sopra la vista corrente.

La sua struttura di base può essere compresa così:

```swift
Vista corrente
    .overlay {
        Vista sovrapposta
    }
```

In questo caso, la vista corrente è la foto già ritagliata in un cerchio:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

La nuova vista che vogliamo sovrapporre è un bordo circolare:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Quindi, possiamo combinare la foto e il bordo:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Qui `overlay` significa sovrapporre una nuova vista sopra la vista corrente.

In `overlay`, il bordo viene sovrapposto seguendo l'area di visualizzazione della foto corrente, quindi non è necessario impostare un `frame` separato. Finché la forma del bordo coincide con la forma di ritaglio, il bordo può aderire alla foto.

![view](../../../Resource/032_view10.png)

L'effetto finale è che un bordo circolare copre la parte superiore della foto circolare.

Rispetto a `ZStack`, `overlay` è più adatto a questo tipo di scenario in cui si "aggiunge una decorazione alla vista corrente". La foto è il soggetto principale, mentre il bordo è solo un effetto aggiuntivo, quindi usare `overlay` risulta più chiaro.

## Completare la galleria fotografica

Ora aggiungiamo a ogni foto la forma e il bordo corrispondenti:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Risultato visualizzato:

![view](../../../Resource/032_view13.png)

In questo modo, una pagina di galleria fotografica di base è completata.

In questa pagina usiamo `ScrollView` per realizzare la visualizzazione scorrevole, usiamo `Image` per mostrare le foto, usiamo `clipShape` per ritagliare le forme delle foto e usiamo `overlay` e `strokeBorder` per aggiungere i bordi.

## Codice completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Riepilogo

In questa lezione abbiamo completato una pagina di galleria fotografica.

![view](../../../Resource/032_view13.png)

In questo caso, abbiamo prima usato `Image` per mostrare le foto, poi abbiamo esteso `Image` con un metodo `photoGalleryStyle` tramite `extension` per organizzare il codice ripetuto dello stile delle immagini.

Successivamente, abbiamo imparato i tipi comuni di `Shape` in SwiftUI, come `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ed `Ellipse`. Queste grafiche non solo possono essere visualizzate direttamente, ma possono anche essere usate insieme a `clipShape` per ritagliare le viste.

Per esempio:

```swift
.clipShape(Circle())
```

significa ritagliare la vista in un cerchio.

Infine, abbiamo usato `overlay` e `strokeBorder` per aggiungere alle foto i bordi delle forme corrispondenti. È importante notare che `border` di solito disegna un bordo in base all'area rettangolare della vista. Se vuoi che il bordo segua un cerchio, una capsula o un'ellisse, è più adatto sovrapporre la stessa `Shape`.

Attraverso questa lezione, non solo abbiamo completato l'effetto della galleria fotografica, ma abbiamo anche compreso la combinazione comune di `Shape`, `clipShape`, `strokeBorder` e `overlay` nelle interfacce.

## Esercizi dopo la lezione

### 1. Aggiungere uno sfondo alla galleria fotografica

Aggiungi un'immagine di sfondo a schermo intero alla pagina della galleria fotografica.

Requisito: l'immagine di sfondo deve riempire l'intero schermo e ignorare l'area sicura.

### 2. Bordo sfumato

Modifica i bordi monocolore esistenti trasformandoli in bordi con sfumatura lineare.

Puoi provare a usare `LinearGradient` per ottenere effetti di bordo più ricchi.

### 3. Cornice fotografica simulata

Cerca online alcuni stili di cornici fotografiche reali e prova a usare `overlay` per sovrapporre cornici immagine, in modo che le foto appaiano più vicine a vere cornici.

Risultato visualizzato dell'esercizio:

![button](../../../Resource/032_view15.jpeg)

### 4. Implementare il bordo di un pulsante arrotondato

Nello sviluppo reale, i pulsanti usano spesso bordi con rettangoli arrotondati.

Prova a creare un pulsante arrotondato e usa `RoundedRectangle` e `strokeBorder` per aggiungere un bordo arrotondato al pulsante.

Risultato visualizzato dell'esercizio:

![button](../../../Resource/032_view14.png)

### Domanda di riflessione

Se non vuoi usare un bordo monocolore né un bordo sfumato, ma vuoi che il bordo mostri un certo effetto a motivo, come dovresti realizzarlo?

Puoi provare a cercare informazioni per conoscere gli usi correlati di `overlay`, `mask` o `ImagePaint`.

Risultato visualizzato dell'esercizio:

![button](../../../Resource/032_view16.png)
