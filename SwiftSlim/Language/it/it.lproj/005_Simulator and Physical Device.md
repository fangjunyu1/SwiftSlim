# Simulatore e dispositivo fisico

Fino a questo punto abbiamo già completato la costruzione delle viste di base. Il contenuto principale di questa lezione è imparare come eseguire un'app nel simulatore e su un dispositivo fisico (Physical Device).

Ricordo ancora la prima volta che ho installato un'app su iPhone: ero molto felice, perché potevo vedere in modo più diretto il risultato del mio lavoro di sviluppo. È un feedback positivo: quando possiamo usare un'app sviluppata da noi, l'interesse ci spinge a imparare spontaneamente più cose.

Ora apri il progetto del curriculum personale completato nella lezione precedente e preparati a eseguirlo sul simulatore e sul dispositivo fisico.

## Simulatore

Xcode include molti simulatori integrati, che coprono vari modelli di iPhone, iPad e Apple Watch. Il simulatore può verificare le differenze di layout dell'app su modelli o versioni differenti.

### Scegliere il simulatore

Nell'elenco dei dispositivi nella barra degli strumenti in alto di Xcode, scegli un simulatore (per esempio iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### Avviare il simulatore

Poi fai clic sul pulsante di esecuzione in alto a sinistra.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode costruirà automaticamente il progetto e avvierà il simulatore.

![Swift](../../RESOURCE/005_xcode2.png)

### Chiudere il simulatore

Se devi chiudere il simulatore, fai clic sul pulsante di stop nella barra degli strumenti di Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Puoi anche chiudere direttamente il simulatore:

![Swift](../../RESOURCE/005_xcode17.png)

Se chiudi direttamente il simulatore, Xcode potrebbe mostrare:

```
Thread 1: signal SIGTERM
```

Di solito questo non è un errore della logica del programma, ma è dovuto al fatto che il processo di debug è stato terminato dall'esterno. In genere si può ignorare; non appartiene agli errori della logica applicativa.

Rispetto all'anteprima di Xcode, il simulatore è più vicino all'ambiente di esecuzione reale, ma non è ancora l'ambiente completo di un dispositivo. È adatto alla verifica del layout e ai test di adattamento su più modelli.

## Priorità degli ambienti di test

Nel vero flusso di sviluppo, l'ordine dei test dovrebbe essere:

dispositivo fisico > simulatore > anteprima di Xcode

L'anteprima è adatta a regolare rapidamente la UI; il simulatore è adatto ai test strutturali; la verifica finale deve essere completata su un dispositivo fisico, soprattutto per le operazioni relative a iCloud.

## Dispositivo fisico

Sia l'anteprima di Xcode sia il simulatore possono mostrare risultati non completamente accurati, quindi il dispositivo fisico ha un'importanza decisiva. Comportamenti come permessi di sistema, prestazioni e meccanismi di notifica possono essere verificati completamente solo su un dispositivo reale.

### Attivare la modalità sviluppatore

Su iPhone:

Impostazioni → Privacy e sicurezza → Modalità sviluppatore → Attiva

![Swift](../../RESOURCE/005_xcode4.png)

Il sistema riavvierà forzatamente il dispositivo. Se la modalità sviluppatore non è attiva, non sarà possibile eseguire il debug.

### Configurare il team di sviluppo

Xcode deve avere configurato un team di sviluppo, altrimenti non potrà firmare l'app né installarla.

Procedura di configurazione:

nome del progetto → TARGETS → Signing & Capabilities → Team

Se viene mostrato "Add Account...", significa che non è stato ancora aggiunto un account Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Fai clic sul pulsante di aggiunta ed effettua l'accesso con il tuo Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Dopo l'accesso con Apple ID, seleziona l'account corrispondente per completare la configurazione del team di sviluppo.

![Swift](../../RESOURCE/005_xcode7.png)

### Collegare il dispositivo

Usa un cavo per collegare iPhone e Mac.

Alla prima connessione:

- il Mac chiederà se vuoi collegare l'iPhone a questo Mac
- l'iPhone chiederà se vuoi considerare affidabile questo computer.

È necessario toccare "Considera attendibile" su iPhone e inserire il codice di sblocco. Successivamente, seleziona il tuo iPhone nell'elenco dei dispositivi di Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Fai clic sul pulsante di esecuzione in alto a sinistra.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode costruirà l'app e la installerà su iPhone.

![Swift](../../RESOURCE/005_view.png)

**Debug wireless**

In iOS 11 e versioni successive, Xcode supporta il debug wireless.

![Swift](../../RESOURCE/005_xcode18.png)

Condizioni preliminari:

1. la prima associazione tra iPhone e Mac deve essere completata tramite cavo dati
2. iPhone e Mac devono trovarsi nella stessa rete Wi-Fi
3. entrambi i dispositivi devono restare sbloccati

Dopo aver completato la prima associazione via cavo, in seguito anche se il cavo viene scollegato, finché i due dispositivi sono nella stessa rete si potrà eseguire direttamente.

Note:

- se il dispositivo non compare nell'elenco, puoi reinserire il cavo per collegarlo di nuovo
- il debug via Wi-Fi a volte non è stabile; se la connessione ha problemi, basta ricollegare il cavo
- in reti aziendali o isolate questa funzione può essere limitata

## Errori comuni e soluzioni

Quando Xcode si collega a iPhone per il debug, possono comparire diversi tipi di messaggi di errore. Qui sotto elenchiamo alcuni problemi comuni e il relativo modo di gestirli, così da aiutarti a localizzare e risolvere rapidamente le anomalie di connessione.

**1. Abbinamento non completato**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Questo indica che l'abbinamento per il debug tra Xcode e iPhone non è ancora stato completato.

Soluzione: conferma di aver toccato "Considera attendibile" su iPhone. Se l'errore continua, riavvia Xcode e ricollega il dispositivo.

**2. Team di sviluppo non configurato**

```
Signing for "SwiftSlimTest" requires a development team.
```

Può darsi che il team di sviluppo non sia stato configurato.

Soluzione: in `Signing & Capabilities`, seleziona l'account già connesso.

**3. Impossibile montare il Developer Disk Image**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Di solito compare quando l'installazione viene interrotta durante il processo (per esempio per scollegamento del cavo o arresto forzato), causando restrizioni e un errore al nuovo tentativo di installazione.

Soluzione: riavvia iPhone e ricollega il cavo.

**4. Connessione del tunnel di debug non riuscita**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Questo errore è comune quando VPN o proxy di rete interferiscono.

Soluzione: disattiva la VPN o il proxy di rete e riprova.

**5. Dispositivo non sbloccato**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Il dispositivo è nella schermata di blocco: basta sbloccare l'iPhone.

**6. Dispositivo non registrato**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Questo significa che il dispositivo non è stato aggiunto all'elenco dei dispositivi dell'account sviluppatore, quindi Xcode non può generare un profilo valido per firmare e installare l'app.

Soluzione: fai clic su "Register Device" per registrarlo automaticamente.

**7. Versione di deployment non corrispondente**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Questo indica che la versione del sistema del dispositivo è inferiore alla versione minima di deployment del progetto.

Percorso di modifica:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Regola la versione in modo che non superi quella del sistema del dispositivo.

Dopo la modifica, pulisci la cartella di build:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Dopo la pulizia, esegui di nuovo.
