# Introducció

## Què és Swift?

Abans de començar a aprendre Swift, primer fem una breu introducció al llenguatge de programació Swift. Swift és un llenguatge modern desenvolupat per Apple i s'utilitza principalment per crear aplicacions per a plataformes d'Apple com iOS, macOS, iPadOS i watchOS.

![Swift](../../RESOURCE/000_swift.png)

En comparació amb altres llenguatges de programació, Swift té una sintaxi més simple i posa més èmfasi en la seguretat i la llegibilitat. Juntament amb SwiftUI, és més fàcil d'aprendre i d'entendre. És clar que jo abans no havia estudiat altres llenguatges de programació, així que potser és una mica més difícil que HTML.

Swift no només serveix per desenvolupar aplicacions per a plataformes d'Apple. La comunitat de Swift està treballant per portar Swift a la plataforma [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) i fins i tot per executar-lo en [servidors](https://github.com/awslabs/swift-aws-lambda-runtime) i altres entorns. A llarg termini, Swift té un espai de creixement més gran i en el futur pot arribar a convertir-se en un llenguatge multiplataforma semblant a Flutter o React Native.

## Què aprendrem

Aquest tutorial se centra principalment en els coneixements bàsics de Swift i SwiftUI.

Començarem amb variables senzilles i tipus de dades, farem interfícies amb SwiftUI, entendrem com es guarden i es llegeixen les dades, i finalment potser aprofundirem en temes més avançats com SwiftData i la sincronització amb iCloud.

Cada capítol girarà al voltant d'un cas pràctic real, per aprendre Swift dins d'un context d'ús real.

Hi ha tutorials que primer expliquen una gran quantitat de sintaxi i API i només després entren en la pràctica del projecte. Per als principiants, això és com si un nen aprengués paraules d'un diccionari: memoritzar molta informació sense un context d'aplicació només acaba fent perdre l'interès.

En aquest tutorial aprendrem en escenaris reals de desenvolupament i farem servir necessitats concretes per introduir els conceptes relacionats.

Quan acabis aquest tutorial, seràs capaç de desenvolupar i executar de manera independent una aplicació bàsica, instal·lar-la als teus dispositius iOS / macOS i fins i tot publicar-la a l'App Store.

## Com aprendre des de zero?

Jo també vaig començar completament des de zero. Al principi només vaig mirar alguns [vídeos de Swift a YouTube](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) i vaig descobrir que desenvolupar aplicacions per a iOS no era tan complicat, cosa que em va despertar interès. Després vaig començar a aprendre més Swift, per exemple provant els jocs de programació de [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), llegint la [documentació oficial de Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) i seguint [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Mirant-ho ara, sobretot va ser [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) qui em va donar un marc d'aprenentatge que em va permetre estudiar SwiftUI de manera sistemàtica. Però com que el tutorial és en anglès i jo no tenia base de programació, vaig trobar moltes dificultats per entendre'l. Per això vaig fer servir eines d'IA com [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) per ajudar-me a entendre els conceptes.

Durant l'aprenentatge, és inevitable topar-se amb coneixements difícils d'entendre. Recordo que quan estudiava `UserDefaults`, només sabia com desar dades, però no sabia que calia llegir-les manualment, fins al punt de sospitar que el meu codi tenia algun problema. Fins i tot un concepte tan senzill em va fer perdre uns quants dies.

També em va passar amb conceptes com closures, el fil principal o els genèrics. En la primera etapa del meu aprenentatge, com que no els podia entendre prou a fons, quan me'ls tornava a trobar en el desenvolupament real havia d'invertir novament temps i energia per reaprendre'ls.

Per això, el meu consell és el següent:

**1. Reforça els coneixements bàsics**

A la Xina hi ha una dita que diu: «Tot començament és difícil». Per a una persona que aprèn Swift des de zero, és normal trobar-se conceptes difícils durant el procés. Sovint això no passa perquè el concepte sigui especialment complex, sinó perquè a la base d'aquesta piràmide de coneixement hi ha nocions encara més fonamentals que el principiant encara no ha vist.

Quan et trobis en una situació així, pots considerar utilitzar eines d'IA com [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) per completar a temps aquests coneixements bàsics que et falten.

**2. Entén cada concepte**

Durant l'aprenentatge, el més important és intentar entendre cada concepte, encara que això et porti uns quants dies.

Si decideixes saltar-te allò que no entens, és molt probable que més endavant t'ho tornis a trobar durant el desenvolupament i que això et freni. Al final hauràs de tornar-hi a dedicar temps. En lloc d'arreglar-ho tard, és millor entendre bé els coneixements durant la fase d'aprenentatge.

En el fons, cada concepte és una eina: com més eines domines, més forta és la teva capacitat per resoldre problemes.

És com construir una casa. Si només tens una eina, encara que puguis fer la major part de la feina, quan les exigències de qualitat siguin més altes et quedaràs curt. Només dominant més eines podràs construir una casa més sòlida.

**3. Mantén un aprenentatge constant**

Aprendre requereix constància a llarg termini. Poques persones estan realment disposades a dedicar uns quants mesos a estudiar un tutorial seriosament. És més important invertir temps de manera constant que no pas fer un esforç molt intens durant poc temps.

Encara que cada dia només completis un u per cent, en cent dies també pots assolir tot l'objectiu d'aprenentatge.

## Visió educativa

Aquest curs no pretén ensenyar una quantitat excessiva de coneixements de Swift i SwiftUI, sinó portar els principiants cap al camí de la programació amb Swift. És com jugar amb peces de construcció: el tutorial s'encarrega d'explicar com encaixar-les, i la resta del temps et toca a tu construir les teves pròpies peces.

El projecte és de codi obert a [GitHub](https://github.com/fangjunyu1/SwiftSlim), des d'on es pot descarregar i utilitzar gratuïtament. També hi ha una versió a l'App Store per provar-lo.

Esperem ajudar més persones sense formació tècnica però amb ganes de canviar la seva trajectòria professional, perquè a través de l'aprenentatge de la programació i el desenvolupament d'aplicacions puguin aconseguir noves possibilitats.

## Actualització del contingut

Aquest tutorial està escrit sobre la versió actual de Swift i SwiftUI.

Amb les actualitzacions de les plataformes i eines d'Apple, algunes API poden canviar. Si trobes problemes o cal actualitzar algun contingut, pots consultar la documentació oficial o la versió més recent del repositori de codi obert.

---
Fang Junyu

2026-02-14
