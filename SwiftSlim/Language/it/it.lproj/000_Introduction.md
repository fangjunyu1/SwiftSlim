# Introduzione

## Che cos'è Swift?

Prima di iniziare a studiare Swift, conosciamo brevemente il linguaggio di programmazione Swift. Swift è un linguaggio di programmazione moderno sviluppato da Apple, usato principalmente per creare applicazioni per le piattaforme Apple, come iOS, macOS, iPadOS e watchOS.

![Swift](../../RESOURCE/000_swift.png)

Rispetto ad altri linguaggi di programmazione, Swift ha una sintassi più concisa e pone maggiore attenzione sulla sicurezza e sulla leggibilità. In combinazione con SwiftUI, è anche più facile da imparare e da comprendere. Naturalmente, in precedenza non avevo studiato altri linguaggi di programmazione, quindi forse è comunque un po' più complesso dell'HTML.

Swift non può essere usato soltanto per sviluppare applicazioni sulle piattaforme Apple. La community Swift sta lavorando anche per portare Swift sulla piattaforma [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) e persino per farlo funzionare in ambienti [server](https://github.com/awslabs/swift-aws-lambda-runtime) e in altri contesti. Dal punto di vista dello sviluppo a lungo termine, Swift ha più spazio di crescita e in futuro potrebbe diventare un linguaggio multipiattaforma simile a Flutter o React Native.

## Contenuti dello studio

Questa guida si concentra soprattutto sulle conoscenze di base di Swift e SwiftUI.

Partiremo da variabili semplici e tipi di dati, poi costruiremo interfacce con SwiftUI, capiremo come salvare e leggere i dati e, in seguito, potremmo approfondire temi più avanzati come SwiftData e la sincronizzazione con iCloud.

Ogni capitolo sarà costruito attorno a un esempio reale, così da imparare Swift in un contesto pratico.

In alcune guide, prima si spiegano in dettaglio grandi quantità di sintassi e API, e solo dopo si passa alla pratica. Per chi è agli inizi, è un po' come se un bambino imparasse le parole da un dizionario: quando manca un contesto reale d'uso, memorizzare molto materiale finisce solo per ridurre l'interesse verso lo studio.

In questa guida, le conoscenze vengono apprese dentro scenari reali di sviluppo, dove il bisogno porta naturalmente ai concetti e agli argomenti corrispondenti.

Dopo aver completato questo corso, sarai in grado di sviluppare e avviare autonomamente un'applicazione di base, installarla sul tuo dispositivo iOS / macOS e anche pubblicarla sull'App Store.

## Come imparare partendo da zero?

Anch'io sono partito completamente da zero. All'inizio ho semplicemente guardato alcune [lezioni su Swift](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) su Youtube e ho scoperto che sviluppare app iOS non era così complicato, cosa che mi ha suscitato un certo interesse. Successivamente ho iniziato a provare a imparare più cose su Swift. Per esempio, ho sperimentato i giochi di programmazione in [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), letto la [documentazione ufficiale di Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) e studiato [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Guardando la situazione oggi, è stato soprattutto [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) a fornirmi una struttura di studio che mi ha permesso di apprendere SwiftUI in modo sistematico. Tuttavia, poiché il corso era in inglese e io non avevo basi di programmazione, durante la comprensione ho incontrato moltissime difficoltà. Per questo mi sono aiutato con strumenti di IA come [ChatGPT](https://chatgpt.com/) e [Claude](https://claude.ai/?redirect=claude.com), che mi hanno supportato nel comprendere i vari concetti.

Durante lo studio è inevitabile incontrare argomenti difficili da capire. Ricordo che quando studiavo UserDefaults sapevo soltanto come salvare i dati, ma non sapevo che dovessero essere letti manualmente, al punto da iniziare a sospettare che ci fosse un errore nel mio codice. Anche un argomento apparentemente semplice mi ha fatto perdere diversi giorni.

Altri esempi sono closures, thread principale e generics. Nella fase iniziale dello studio non riuscivo a comprenderli davvero in profondità, per cui quando li incontravo di nuovo nello sviluppo reale dovevo spendere ancora tempo ed energie per ristudiarli.

Perciò il mio consiglio è questo:

**1. Colma le conoscenze di base**

In Cina esiste un detto: "Tutto è difficile all'inizio". Per chi inizia a studiare Swift da zero, durante il percorso di apprendimento è inevitabile incontrare argomenti difficili da comprendere, e di solito non perché quegli argomenti siano davvero così complessi, ma perché alla base di questa piramide di conoscenze ci sono concetti ancora più semplici con cui un principiante non è ancora entrato in contatto.

In questa situazione, si può ricorrere a strumenti di IA come [ChatGPT](https://chatgpt.com/) e [Claude](https://claude.ai/?redirect=claude.com) per colmare in tempo le lacune nelle conoscenze di base.

**2. Comprendi ogni concetto**

Nel processo di apprendimento, la cosa più importante è cercare di comprendere ogni concetto, anche se per farlo servono diversi giorni.

Se si salta il materiale non compreso, è molto probabile che lo si incontri di nuovo nello sviluppo successivo e che diventi un ostacolo al progresso. Alla fine si dovrà comunque spendere tempo per ristudiarlo. Perciò è meglio chiarire l'argomento già nella fase di apprendimento, invece di dover recuperare più avanti.

Ogni concetto è, in sostanza, uno strumento: più strumenti padroneggerai, più forte sarà la tua capacità di risolvere problemi.

È un po' come costruire una casa: se hai in mano un solo strumento, forse riuscirai a malapena a completare la maggior parte dei lavori, ma quando servirà una qualità maggiore, non basterà. Solo padroneggiando più strumenti si può costruire una casa davvero solida.

**3. Mantieni una continuità nello studio**

Imparare richiede perseveranza nel lungo periodo. Pochissime persone sono davvero disposte a dedicare alcuni mesi a seguire seriamente un corso completo. Investire tempo ogni giorno in modo continuo è più importante di un'intensità elevata per un breve periodo.

Anche se ogni giorno si completa solo l'uno per cento, in cento giorni si può comunque raggiungere l'obiettivo completo di apprendimento.

## Visione educativa

Questo corso non ha l'obiettivo di trasmettere troppe conoscenze di Swift e SwiftUI, ma piuttosto di accompagnare i principianti a imboccare la strada della programmazione in Swift. È un po' come montare dei mattoncini: la guida spiega come collegare i pezzi, e poi arriva il tuo momento di costruire qualcosa di tuo con questi elementi.

Il progetto è già open source su [GitHub](https://github.com/fangjunyu1/SwiftSlim), quindi può essere scaricato e usato gratuitamente. È disponibile anche una versione sull'App Store per provarlo.

Speriamo di aiutare più persone senza un background tecnico, ma con il desiderio di cambiare direzione professionale, a ottenere nuove opportunità grazie allo studio della programmazione e dello sviluppo di applicazioni.

## Aggiornamenti dei contenuti

Questa guida è scritta sulla base delle versioni correnti di Swift e SwiftUI.

Con l'aggiornamento delle piattaforme Apple e degli strumenti, alcune API potrebbero cambiare. Se noti un problema o vedi che qualche contenuto necessita di aggiornamento, puoi consultare la documentazione ufficiale o l'ultima versione del repository open source.

---

Fang Junyu

2026-02-14
