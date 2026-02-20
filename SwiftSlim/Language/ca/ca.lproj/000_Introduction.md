# Introducció

## Què és Swift?

Abans d'aprendre Swift, parlem una mica sobre el llenguatge de programació Swift. Swift és un llenguatge de programació modern desenvolupat per Apple, utilitzat principalment per crear aplicacions a les plataformes d'Apple com iOS, macOS, iPadOS, watchOS, etc.

![Swift](000_swift.png)

En comparació amb altres llenguatges de programació, la sintaxi de Swift és concisa i posa més èmfasi en la seguretat i la llegibilitat. Juntament amb SwiftUI, és més fàcil d'aprendre i entendre. Per descomptat, no he après altres llenguatges de programació abans, potser és una mica més difícil que l'HTML.

Swift no només serveix per desenvolupar aplicacions a les plataformes d'Apple; la comunitat de Swift està treballant dur per portar Swift a la plataforma [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), i fins i tot per executar-lo en [servidors](https://github.com/awslabs/swift-aws-lambda-runtime) i altres entorns. Des d'una perspectiva de desenvolupament a llarg termini, Swift té un espai de creixement més gran i en el futur té l'oportunitat de convertir-se en un llenguatge de programació multiplataforma similar a Flutter o React Native.

## Contingut de l'aprenentatge

Aquest tutorial se centra principalment en els conceptes bàsics de Swift i SwiftUI.

Començarem aprenent variables simples i tipus de dades, utilitzarem SwiftUI per construir interfícies, entendrem com s'emmagatzemen i es llegeixen les dades i, finalment, potser aprofundirem en continguts avançats com Swift Data i la sincronització amb iCloud.

Cada capítol girarà al voltant d'un cas pràctic real, aprenent coneixements de Swift en aplicacions pràctiques.

Alguns tutorials poden centrar-se primer a explicar una gran quantitat de sintaxi i API abans d'entrar en la pràctica del projecte. Per als principiants, això és com un nen que aprèn paraules d'un diccionari; memoritzar una gran quantitat de contingut sense escenaris d'aplicació només farà que el principiant perdi l'interès al final.

Aquest tutorial aprendrà coneixements en escenaris de desenvolupament reals, utilitzant els requisits per introduir els punts de coneixement relacionats.

Després de completar aquest tutorial, sereu capaços de desenvolupar i executar independentment una aplicació bàsica, instal·lar-la al vostre propi dispositiu iOS / macOS, o també publicar l'aplicació a l'App Store.

## Com aprendre des de zero?

Jo també començava de zero. Al principi, només vaig mirar alguns [vídeos tutorials de Swift]( l'aplicació iOS no és complexa, la qual cosa em va generar cert interès. Després, vaig començar a intentar obtenir més coneixements de Swift. Per exemple, jugant a jocs de programació a [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), llegint la [documentació oficial del tutorial de Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/), i estudiant [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Ara sembla que principalment [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) va proporcionar un marc d'aprenentatge que em va permetre aprendre SwiftUI sistemàticament. No obstant això, com que el tutorial és en anglès i em mancava una base de programació, vaig tenir moltes dificultats per comprendre-ho. Per a això, vaig utilitzar IA com [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) per ajudar-me a entendre els punts de coneixement.

En el procés d'aprenentatge, és inevitable que apareguin alguns coneixements difícils d'entendre. Recordo que quan aprenia UserDefaults, només sabia com desar dades, però no sabia que les dades s'havien de llegir manualment, fins al punt que sospitava que hi havia problemes al meu codi. Fins i tot un punt de coneixement tan simple em va fer perdre uns quants dies.

O per exemple, els tancaments (closures), el fil principal (main thread), els genèrics i altres punts; durant l'etapa inicial d'aprenentatge, com que no els podia entendre profundament, quan em tornava a trobar amb ells en el desenvolupament real, havia de dedicar energia a aprendre'ls de nou.

Per tant, el meu suggeriment és:

**1. Completar els coneixements bàsics**

Hi ha una dita xinesa que diu "tot començament és difícil". Per als que comencen de zero, quan comencen a aprendre Swift, alguns punts de coneixement sovint són difícils d'entendre. Això no és perquè el punt de coneixement en si sigui complex, sinó perquè sota aquesta piràmide de coneixement hi ha coneixements més bàsics que no heu après o conegut.

En aquest moment, hauríeu de preguntar a IA com [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) per completar els coneixements bàsics.

**2. Intentar entendre cada punt de coneixement**

En el procés d'aprenentatge, hauríeu d'intentar entendre cada punt de coneixement, encara que hàgiu de dedicar-hi uns quants dies.

Quan trieu saltar-vos contingut que no enteneu, només us el trobareu de nou en el desenvolupament posterior i obstaculitzarà el progrés, i finalment haureu de tornar a invertir temps per aprendre-ho. En lloc d'arreglar el corral quan l'ovella ja s'ha escapat, és millor entendre els coneixements clarament en l'etapa d'aprenentatge.

Cada punt de coneixement és essencialment una eina: com més eines domineu, més forta serà la vostra capacitat per resoldre problemes.

Igual que construir una casa, si només teniu una eina a la mà, tot i que amb prou feines podeu completar la major part de la feina, semblareu impotents davant de requisits de qualitat més alts. Dominar més eines permet construir cases més sòlides.

**3. Mantenir un aprenentatge continu**

L'aprenentatge requereix constància. Molt poques persones estan realment disposades a dedicar uns mesos a aprendre seriosament un tutorial. Invertir temps contínuament en l'aprenentatge és més important que una alta intensitat a curt termini.

Fins i tot si només completeu un u per cent cada dia, en cent dies podeu completar tot l'objectiu d'aprenentatge.

## Visió educativa

Aquest curs no ensenyarà massa coneixements de Swift i SwiftUI, sinó que portarà els principiants al camí de la programació amb Swift. Com muntar blocs de construcció: el tutorial s'encarrega d'explicar el mètode de muntatge, i la resta del temps és perquè vosaltres munteu els vostres propis blocs.

El projecte és de codi obert a [GitHub](https://github.com/fangjunyu1/SwiftSlim), i es pot descarregar i utilitzar gratuïtament. També s'ofereix una versió a l'App Store per provar-la.

Esperem ajudar més persones sense formació tècnica però amb ganes de canviar la seva trajectòria professional, perquè obtinguin noves possibilitats aprenent programació i desenvolupament d'aplicacions.

## Actualització del contingut

Aquest tutorial s'ha escrit basant-se en les versions actuals de Swift i SwiftUI.

Amb l'actualització de les plataformes i eines d'Apple, algunes API poden canviar. Si trobeu problemes o contingut que necessita actualització, podeu consultar la documentació oficial o l'última versió al repositori de codi obert.

---
Fang Junyu

2026-02-14