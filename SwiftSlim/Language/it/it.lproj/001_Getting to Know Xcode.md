# Conoscere Xcode

## Che cos'è Xcode

Xcode è l'ambiente di sviluppo integrato ufficiale (IDE, Integrated Development Environment) fornito da Apple per sviluppare applicazioni per le piattaforme Apple come iOS, macOS, watchOS e tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Durante tutto il percorso didattico useremo Xcode per scrivere codice ed eseguire i programmi.

In questa lezione impareremo come scaricare Xcode, creare la prima app iOS e conoscere in modo preliminare la struttura dell'interfaccia di Xcode.

## Scaricare Xcode

Attualmente Xcode può essere installato in due modi:

1、Scaricandolo dal [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Scaricandolo dal [sito ufficiale Apple Developer](https://developer.apple.com/xcode/)

Entrambi i modi permettono di scaricare Xcode. La differenza è che sul sito ufficiale Apple Developer, oltre alla versione stabile, si possono scaricare anche la versione [Beta](https://developer.apple.com/download/all/?q=Xcode) o le versioni storiche.

Se stai solo imparando a sviluppare, è consigliabile usare la versione stabile. La versione Beta serve soprattutto per testare nuove funzionalità e può presentare instabilità.

## Creare il primo progetto

Dopo aver aperto Xcode, vedrai la schermata iniziale.

![Swift](../../RESOURCE/001_xcode1.png)

Sulla sinistra ci sono tre opzioni usate di frequente:

- Create New Project —— creare un nuovo progetto  
- Clone Git Repository —— clonare un repository Git  
- Open Existing Project —— aprire un progetto esistente

Sulla destra vengono mostrati i progetti Xcode aperti di recente.

Noi scegliamo l'opzione "Create New Project".

### Scegliere il modello del progetto

![Swift](../../RESOURCE/001_xcode2.png)

Si entra nella schermata di selezione del modello del progetto, dove sono mostrati più piattaforme (iOS, macOS ecc.) e diversi tipi di modelli.

Descrizione dei modelli più comuni:
- App —— il tipo di applicazione più basilare (consigliato)
- Document App —— applicazione basata sul modello documentale
- Game —— per lo sviluppo di giochi
- Framework —— modulo riutilizzabile

Nella fase iniziale scegliamo solo il modello "iOS" - "App", perché è il tipo di applicazione con interfaccia grafica.

Fai clic su "Next".

### Compilare le informazioni del progetto

Si entra nella schermata di compilazione delle informazioni del progetto, dove dobbiamo riempire i campi in base al loro tipo.

![Swift](../../RESOURCE/001_xcode3.png)

Significato dei vari campi:

- Product Name —— nome del progetto, per esempio: SwiftSlimTest
- Team —— team di sviluppatori; se non hai un account Apple Developer a pagamento, puoi lasciarlo non selezionato
- Organization Identifier —— identificatore dell'organizzazione, di solito in formato dominio inverso, per esempio:
  - com.yourname
  - com.yourcompany
  - se non hai un dominio, puoi usare il tuo nome inglese come identificatore
- Bundle Identifier —— identificatore univoco dell'app, generato automaticamente in base a Organization Identifier e Product Name
- Interface —— tecnologia dell'interfaccia, scegli SwiftUI
- Language —— linguaggio di sviluppo, scegli Swift
- Testing System —— per impostazione predefinita viene creato un target di test (Unit Tests), che all'inizio possiamo ignorare
- Storage —— framework per la persistenza locale dei dati, che può integrare automaticamente SwiftData o Core Data; anche questo si può ignorare nella fase iniziale

Dopo aver compilato tutto, fai clic su "Next".

### Salvare il progetto

![Swift](../../RESOURCE/001_xcode4.png)

Scegli una cartella adatta in cui salvare il progetto.

Fai clic sul pulsante "Create" e Xcode genererà automaticamente la struttura del progetto.

## Struttura del progetto Xcode

Dopo aver salvato il progetto Xcode, nel Finder potrai vedere la cartella del progetto generata.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— cartella usata per memorizzare risorse come immagini e icone dell'app

- ContentView.swift —— file di vista SwiftUI generato di default, nel quale più avanti scriveremo il codice dell'interfaccia.

- SwiftSlimTestApp.swift —— file di ingresso dell'app (App Entry Point), responsabile dell'avvio dell'applicazione; per il momento non abbiamo bisogno di capirlo.

- SwiftSlimTest.xcodeproj —— file del progetto Xcode; fai doppio clic su questo file per aprire il progetto.

## Conoscere l'interfaccia di Xcode

Fai doppio clic sul file `.xcodeproj` per aprire il progetto, quindi seleziona il file ContentView.swift nell'area Navigator a sinistra.

L'interfaccia di Xcode è composta principalmente da cinque aree:

- Navigator —— area di navigazione, usata per vedere la struttura dei file e fare ricerche
- Editor —— area di modifica, usata per scrivere codice Swift o SwiftUI
- Canvas —— area del canvas, usata per l'anteprima SwiftUI
- Inspector —— area di ispezione proprietà, usata per visualizzare e modificare le proprietà dei file
- Debug Area —— area di debug, usata per vedere l'output dei log

![Swift](../../RESOURCE/001_xcode6.png)

Nota: Canvas è usato soprattutto per l'anteprima delle viste SwiftUI. Dal punto di vista dell'architettura ufficiale di Xcode, è un pannello di anteprima ausiliario dell'Editor (Preview Pane). Solo quando si apre un file di vista SwiftUI è possibile attivare Canvas; gli altri tipi di file non mostrano la funzione di anteprima.

Nelle lezioni successive scriveremo principalmente codice Swift e SwiftUI nell'area Editor.

Quando apri un progetto Xcode per la prima volta, Inspector e Debug Area potrebbero essere nascosti per impostazione predefinita; puoi mostrarli con i pulsanti in alto a destra e in basso a destra.

![Swift](../../RESOURCE/001_xcode7.png)

Suggerimento: l'area Inspector serve soprattutto per vedere e modificare le proprietà dei file. Nello sviluppo reale, di solito viene nascosta per ottenere più spazio di modifica.

## Riepilogo

In questa lezione abbiamo imparato come scaricare Xcode, creare il primo progetto Xcode e conoscere il layout di base dell'interfaccia di Xcode.

Adesso è tempo di fare qualche prova libera:
- puoi provare a creare o eliminare file nell'area Navigator.  
- Guarda il codice nell'area Editor e osservane la struttura.
- Guarda i pulsanti nell'area Canvas e prova a ingrandire o ridurre la vista di anteprima.

Nella prossima lezione inizieremo a scrivere un po' di codice semplice, e questo ci aiuterà a comprendere ancora meglio Xcode.  
