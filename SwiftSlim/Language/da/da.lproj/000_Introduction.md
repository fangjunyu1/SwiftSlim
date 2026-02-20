# Introduktion

## Hvad er Swift?

Før vi lærer Swift, lad os tale lidt om programmeringssproget Swift. Swift er et moderne programmeringssprog udviklet af Apple, som hovedsageligt bruges til at bygge applikationer på Apple-platforme såsom iOS, macOS, iPadOS, watchOS osv.

![Swift](000_swift.png)

Sammenlignet med andre programmeringssprog har Swift en kortfattet syntaks og lægger mere vægt på sikkerhed og læsbarhed. I kombination med SwiftUI er det lettere at lære og forstå. Jeg har selvfølgelig ikke lært andre programmeringssprog før, så det er måske lidt sværere end HTML.

Swift kan ikke kun udvikle applikationer til Apple-platforme; Swift-fællesskabet arbejder hårdt på at portere Swift til [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/)-platformen og endda køre det i [server](https://github.com/awslabs/swift-aws-lambda-runtime)-miljøer og andre steder. Fra et langsigtet udviklingsperspektiv har Swift et større vækstpotentiale og har i fremtiden mulighed for at blive et tværplatform-programmeringssprog ligesom Flutter og React Native.

## Læringsindhold

Denne vejledning fokuserer hovedsageligt på grundlæggende viden om Swift og SwiftUI.

Vi starter med at lære om simple variabler og datatyper, bruger SwiftUI til at opbygge grænseflader, forstår hvordan data lagres og læses, og til sidst vil vi måske dykke ned i avanceret indhold som Swift Data og iCloud-synkronisering.

Hvert kapitel vil dreje sig om en faktisk case, hvor vi lærer Swift-viden gennem praktisk anvendelse.

Nogle vejledninger fokuserer måske først på at forklare en stor mængde syntaks og API'er, før de går i gang med projektpraksis. For begyndere er det som et barn, der lærer ord fra en ordbog; at huske en masse indhold uden anvendelsesscenarier vil i sidste ende kun få begynderen til at miste interessen.

Denne vejledning vil lære viden i faktiske udviklingsscenarier og bruge behov til at introducere relaterede videnspunkter.

Efter at have gennemført denne vejledning vil du være i stand til selvstændigt at udvikle og køre en grundlæggende applikation, installere den på din egen iOS / macOS-enhed, eller publicere applikationen i App Store.

## Hvordan lærer man helt fra bunden?

Jeg startede også selv helt fra bunden. I begyndelsen så jeg bare et par [Swift-undervisningsvideoer]( iOS-applikationer ikke er komplekse, hvilket vakte min interesse. Derefter begyndte jeg at forsøge at få mere viden om Swift. For eksempel ved at spille programmeringsspil på [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), læse [den officielle Swift-dokumentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) samt studere [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Set i bakspejlet var det primært [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui), der gav mig en læringsramme, så jeg kunne lære SwiftUI systematisk. Men da vejledningen er på engelsk, og jeg manglede et programmeringsfundament, havde jeg meget svært ved at forstå det undervejs. Derfor brugte jeg AI som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) til at hjælpe med at forstå videnspunkterne.

I læringsprocessen er det uundgåeligt at støde på viden, der er svær at forstå. Jeg husker, at da jeg lærte om UserDefaults, vidste jeg kun, hvordan man gemte data, men ikke at data skulle læses manuelt, så jeg mistænkte min kode for at have problemer. Selv et så simpelt videnspunkt fik mig til at spilde flere dage.

Eller for eksempel closures (lukninger), main thread (hovedtråden), generics (generiske typer) og andre videnspunkter. Fordi jeg ikke forstod dem dybt nok i den tidlige læringsfase, måtte jeg bruge energi på at lære dem igen, da jeg stødte på dem i faktisk udvikling.

Derfor er mit råd:

**1. Suppler med grundlæggende viden**

Der er et kinesisk ordsprog, der siger: "Al begyndelse er svær". For en nybegynder er nogle videnspunkter ofte svære at forstå, når man lige er begyndt at lære Swift. Det er ikke fordi selve videnspunktet er komplekst, men fordi der under denne pyramide af viden findes endnu mere grundlæggende viden, som du ikke har lært eller kender til.

På dette tidspunkt bør du spørge AI som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) for at udfylde hullerne i den grundlæggende viden.

**2. Prøv at forstå hvert enkelt videnspunkt**

I læringsprocessen bør du prøve at forstå hvert enkelt videnspunkt, selvom det kræver flere dage at lære.

Når du vælger at springe indhold over, du ikke forstår, vil du blot støde på det igen i den efterfølgende udvikling, hvor det vil hindre dine fremskridt, og du vil i sidste ende skulle investere tid igen for at lære det. I stedet for at reparere folden, når fåret er løbet væk, er det bedre at forstå viden klart i læringsfasen.

Hvert videnspunkt er i bund og grund et værktøj – jo flere værktøjer du mestrer, desto stærkere er din evne til at løse problemer.

Det er ligesom at bygge et hus; hvis du kun har ét værktøj i hånden, kan du måske knap nok udføre det meste af arbejdet, men du vil virke magtesløs over for højere kvalitetskrav. At mestre flere værktøjer gør det muligt at bygge et mere solidt hus.

**3. Oprethold kontinuerlig læring**

Læring kræver vedholdenhed. Få mennesker er virkelig villige til at sætte flere måneder af til seriøst at studere en vejledning. Kontinuerlig investering af tid til læring er vigtigere end kortvarig høj intensitet.

Selv hvis du kun gennemfører én procent om dagen, kan du nå hele læringsmålet på hundrede dage.

## Uddannelsesvision

Dette kursus vil ikke undervise i alt for meget Swift- og SwiftUI-viden, men snarere lede begyndere ind på vejen til Swift-programmering. Det er ligesom at bygge med klodser – vejledningen er ansvarlig for at forklare samlemetoderne, og resten af tiden er op til dig til at bygge dine egne klodser.

Projektet er open source på [GitHub](https://github.com/fangjunyu1/SwiftSlim), og kan downloades og bruges gratis. Der tilbydes også en App Store-version til afprøvning.

Vi håber at kunne hjælpe flere mennesker uden teknisk baggrund, men som ønsker at ændre deres karrierevej, med at få nye muligheder gennem læring af programmering og app-udvikling.

## Indholdsopdateringer

Denne vejledning er skrevet baseret på de nuværende versioner af Swift og SwiftUI.

I takt med at Apple-platforme og værktøjer opdateres, kan nogle API'er ændre sig. Hvis du finder problemer eller indhold, der skal opdateres, kan du henvise til den officielle dokumentation eller den nyeste version i open source-lageret.

---
Fang Junyu

2026-02-14