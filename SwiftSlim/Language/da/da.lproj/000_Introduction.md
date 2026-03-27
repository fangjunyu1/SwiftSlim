# Introduktion

## Hvad er Swift?

Før vi lærer Swift, skal vi først kort forstå programmeringssproget Swift. Swift er et moderne programmeringssprog udviklet af Apple og bruges primært til at bygge apps til Apple-platforme som iOS, macOS, iPadOS og watchOS.

![Swift](../../RESOURCE/000_swift.png)

Sammenlignet med andre programmeringssprog har Swift en mere enkel syntaks og lægger større vægt på sikkerhed og læsbarhed. Sammen med SwiftUI er det lettere at lære og forstå. Jeg havde dog selv ikke lært andre programmeringssprog før, så det kan føles lidt sværere end HTML.

Swift kan ikke kun bruges til at udvikle apps til Apple-platforme. Swift-fællesskabet arbejder også på at porte Swift til [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) og endda lade det køre på [servere](https://github.com/awslabs/swift-aws-lambda-runtime) og andre miljøer. Set i et langsigtet perspektiv har Swift et stort udviklingspotentiale og kan i fremtiden få mulighed for at blive et cross-platform programmeringssprog på linje med Flutter og React Native.

## Hvad skal vi lære?

Denne vejledning fokuserer hovedsageligt på grundlæggende viden om Swift og SwiftUI.

Vi starter med enkle variabler og datatyper, bruger SwiftUI til at bygge brugerflader, forstår hvordan data gemmes og læses, og til sidst kan vi også komme ind på mere avancerede emner som SwiftData og iCloud-synkronisering.

Hvert kapitel tager udgangspunkt i en konkret case, så vi lærer Swift gennem rigtige anvendelser.

Nogle vejledninger bruger først lang tid på at forklare en masse syntaks og API'er og går først derefter videre til projekter. For begyndere svarer det lidt til, at et barn lærer ord fra en ordbog. Når man skal huske en masse indhold uden en reel anvendelsessituation, mister man let interessen.

Denne vejledning lærer dig viden i faktiske udviklingsscenarier og bruger behov til at introducere de relevante begreber.

Når du har gennemført denne vejledning, vil du kunne udvikle og køre en grundlæggende app selv, installere den på dine egne iOS- eller macOS-enheder og endda udgive appen på App Store.

## Hvordan lærer man Swift helt fra bunden?

Jeg startede også helt uden erfaring. I begyndelsen så jeg bare nogle få [Swift-undervisningsvideoer](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) på YouTube og opdagede, at det faktisk ikke var særligt kompliceret at udvikle iOS-apps, hvilket vækkede min interesse. Derefter begyndte jeg at prøve at lære mere om Swift, for eksempel gennem programmeringsspillene i [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), ved at læse [Swifts officielle dokumentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) og ved at følge [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Når jeg ser tilbage på det nu, var det især [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui), der gav mig en læringsramme, så jeg kunne lære SwiftUI mere systematisk. Men fordi vejledningen er på engelsk, og fordi jeg selv manglede programmeringsgrundlag, stødte jeg på mange vanskeligheder undervejs. Derfor brugte jeg AI-værktøjer som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) til at hjælpe mig med at forstå begreberne.

I læringsprocessen er der uundgåeligt nogle emner, der er svære at forstå. Jeg husker for eksempel, at da jeg lærte UserDefaults, vidste jeg kun, hvordan man gemte data, men ikke at data skulle læses manuelt tilbage. Det fik mig endda til at tvivle på, om der var noget galt med min kode. Selv et så simpelt begreb kostede mig flere dage.

For eksempel med closures, hovedtråde og generics: i den tidlige læringsfase kunne jeg ikke forstå dem til bunds. Da jeg senere stødte på dem igen i rigtig udvikling, måtte jeg bruge tid på at lære dem på ny.

Derfor er mit råd følgende:

**1. Supplér den grundlæggende viden**

På kinesisk siger man, at "alt er svært i begyndelsen". For nybegyndere, der lærer Swift helt fra bunden, vil der næsten uundgåeligt dukke nogle begreber op, som er svære at forstå undervejs. Det betyder ofte ikke, at selve begrebet er særligt komplekst, men at der endnu længere nede i denne videnspyramide findes endnu mere grundlæggende koncepter, som begynderen endnu ikke har mødt.

Når det sker, kan du overveje at bruge AI-værktøjer som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) til hurtigt at udfylde den manglende basisviden.

**2. Forsøg at forstå hvert enkelt begreb**

Det vigtigste i læringsprocessen er at prøve at forstå hvert enkelt begreb, også selv om det kræver flere dages arbejde.

Hvis du vælger at springe noget over, du ikke forstår, er sandsynligheden stor for, at du møder det igen senere i udviklingen, hvor det så vil bremse din fremdrift. Til sidst bliver du alligevel nødt til at bruge tid på at lære det igen. I stedet for at lappe skaden senere er det bedre at forstå stoffet ordentligt allerede i læringsfasen.

Hvert begreb er i bund og grund et værktøj. Jo flere værktøjer du mestrer, desto stærkere bliver din evne til at løse problemer.

Det er lidt som at bygge et hus. Hvis du kun har ét værktøj i hånden, kan du måske lige akkurat klare det meste arbejde, men når kravene til kvalitet bliver højere, vil du hurtigt komme til kort. Jo flere værktøjer du mestrer, desto mere solidt et hus kan du bygge.

**3. Bevar kontinuerlig læring**

Læring kræver vedholdenhed over lang tid. Der er ikke mange, som reelt er villige til at bruge flere måneder på at studere en vejledning seriøst. Det er vigtigere at lægge tid i det kontinuerligt end at presse sig selv hårdt i en kort periode.

Selv hvis du kun gennemfører én procent om dagen, kan du stadig nå hele målet på hundrede dage.

## Pædagogisk vision

Dette kursus vil ikke lære dig enorme mængder Swift- og SwiftUI-viden, men snarere føre begyndere ind på programmeringsvejen med Swift. Det er som at bygge med klodser: vejledningen forklarer, hvordan delene sættes sammen, og resten af tiden er det dig selv, der bygger dine egne klodskonstruktioner.

Projektet er open source på [GitHub](https://github.com/fangjunyu1/SwiftSlim), så det kan downloades og bruges gratis. Der findes også en App Store-version, som kan bruges til at prøve oplevelsen.

Vi håber at kunne hjælpe flere mennesker uden teknisk baggrund, men med et stærkt ønske om at ændre deres karrierevej, med at få nye muligheder gennem programmering og appudvikling.

## Opdatering af indhold

Denne vejledning er skrevet med udgangspunkt i den aktuelle version af Swift og SwiftUI.

Efterhånden som Apple-platforme og værktøjer opdateres, kan visse API'er ændre sig. Hvis du opdager problemer, eller indholdet har brug for opdatering, kan du se den nyeste version i den officielle dokumentation eller i open source-repositoriet.

---
Fang Junyu

2026-02-14
