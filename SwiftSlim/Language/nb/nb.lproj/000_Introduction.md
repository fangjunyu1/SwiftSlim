# Innledning

## Hva er Swift?

Før vi begynner å lære Swift, kan vi først få en enkel oversikt over programmeringsspråket Swift. Swift er et moderne programmeringsspråk utviklet av Apple, og brukes hovedsakelig til å bygge apper på Apple-plattformer som iOS, macOS, iPadOS og watchOS.

![Swift](../../RESOURCE/000_swift.png)

Sammenlignet med andre programmeringsspråk har Swift en mer konsis syntaks og legger større vekt på sikkerhet og lesbarhet. Sammen med SwiftUI er det også lettere å lære og forstå. Jeg hadde riktignok ikke lært andre programmeringsspråk tidligere, så det kan føles litt vanskeligere enn HTML.

Swift kan ikke bare brukes til å utvikle apper for Apple-plattformer. Swift-fellesskapet arbeider også med å overføre Swift til [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), og det kan til og med kjøre i andre miljøer som på [servere](https://github.com/awslabs/swift-aws-lambda-runtime). På lang sikt har Swift et større utviklingsrom, og kan i fremtiden få muligheten til å bli et plattformuavhengig språk på linje med Flutter og React Native.

## Læringsinnhold

Denne veiledningen fokuserer hovedsakelig på grunnleggende kunnskap i Swift og SwiftUI.

Vi skal starte med enkle variabler og datatyper, bruke SwiftUI til å bygge grensesnitt, forstå hvordan data lagres og leses, og til slutt kan vi også gå videre til mer avanserte emner som SwiftData og iCloud-synkronisering.

Hvert kapittel vil ta utgangspunkt i et konkret eksempel, slik at vi lærer Swift-kunnskap gjennom praktiske situasjoner.

Noen veiledninger forklarer først mye syntaks og mange API-er samlet, og går først deretter over til prosjektpraksis. For nybegynnere blir det litt som at et barn lærer tegn direkte fra en ordbok. Uten en brukssammenheng gjør det bare at man må huske mye innhold, og til slutt mister interessen.

Denne veiledningen vil lære bort kunnskap i faktiske utviklingsscenarier, og la behovene trekke fram de relevante kunnskapspunktene.

Etter å ha fullført denne veiledningen vil du kunne utvikle og kjøre en grunnleggende app på egen hånd, installere den på din egen iOS- eller macOS-enhet, og også publisere appen i App Store.

## Hvordan lærer man uten forkunnskaper?

Da jeg begynte, hadde jeg også ingen forkunnskaper. Først så jeg bare noen episoder av [Swift-undervisningsvideoer](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) på Youtube, og oppdaget at det ikke var så komplisert å utvikle iOS-apper. Det gjorde meg interessert. Etterpå begynte jeg å prøve å lære mer Swift-kunnskap. For eksempel testet jeg programmeringsspillene i [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), leste [Swifts offisielle dokumentasjon](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) og lærte gjennom [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Slik jeg ser det nå, var det hovedsakelig [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) som ga meg et læringsrammeverk, slik at jeg kunne lære SwiftUI systematisk. Men siden veiledningen var på engelsk, og jeg selv manglet programmeringsgrunnlag, møtte jeg mange vanskeligheter i forståelsesprosessen. Derfor brukte jeg AI-verktøy som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) for å hjelpe meg med å forstå kunnskapspunktene.

I læringsprosessen vil man uunngåelig møte kunnskap som er vanskelig å forstå. Jeg husker for eksempel at da jeg lærte UserDefaults, visste jeg bare hvordan jeg skulle lagre data, men ikke at data måtte leses manuelt. Derfor mistenkte jeg at det var noe galt med koden min. Selv et så enkelt kunnskapspunkt kostet meg flere dager.

Det samme gjaldt kunnskap som closures, hovedtråd og generics. I den tidlige læringsfasen klarte jeg ikke å forstå dem i dybden, og da jeg møtte dem igjen i faktisk utvikling, måtte jeg bruke tid og energi på å lære dem på nytt.

Derfor er mitt råd:

**1. Fyll på med grunnkunnskap**

I Kina finnes det et uttrykk som sier at “det vanskeligste er begynnelsen”. For nybegynnere som lærer Swift uten forkunnskaper, er det uunngåelig å møte enkelte ting som er vanskelige å forstå underveis. Ofte betyr ikke det at selve kunnskapspunktet er spesielt komplisert, men at det finnes enda mer grunnleggende begreper nederst i denne kunnskapspyramiden som man ennå ikke har vært borti.

Når dette skjer, kan du vurdere å bruke AI-verktøy som [ChatGPT](https://chatgpt.com/) og [Claude](https://claude.ai/?redirect=claude.com) til å fylle inn manglende grunnkunnskap i tide.

**2. Forstå hvert enkelt kunnskapspunkt**

Det viktigste i læringsprosessen er å prøve å forstå hvert enkelt kunnskapspunkt, selv om det skulle ta flere dager.

Hvis du velger å hoppe over noe du ikke forstår, vil du med stor sannsynlighet møte det igjen senere i utviklingen, og det vil hindre framdriften. Til slutt må du uansett bruke tid på å lære det på nytt. I stedet for å reparere problemet senere, er det bedre å forstå kunnskapen godt allerede i læringsfasen.

Hvert kunnskapspunkt er i bunn og grunn et verktøy. Jo flere verktøy du behersker, desto sterkere blir evnen din til å løse problemer.

Det er som å bygge et hus. Hvis du bare har ett verktøy i hånden, kan du så vidt klare det meste, men når kravene til kvalitet blir høyere, vil det fort føles utilstrekkelig. Bare ved å beherske flere verktøy kan du bygge et mer solid hus.

**3. Hold læringen i gang**

Læring krever langsiktig utholdenhet. Det er få som virkelig er villige til å sette av flere måneder til å lære en hel veiledning grundig. Å bruke tid jevnt og trutt er viktigere enn kortvarig høy intensitet.

Selv om du bare fullfører én prosent hver dag, kan du nå hele læringsmålet på hundre dager.

## Pedagogisk visjon

Dette kurset kommer ikke til å lære bort altfor mye Swift- og SwiftUI-kunnskap på en gang. Målet er heller å lede nybegynnere inn på denne programmeringsveien med Swift. Det er litt som å bygge med klosser: Veiledningen forklarer hvordan delene settes sammen, og resten av tiden er det du selv som bygger dine egne kreasjoner.

Prosjektet er åpen kildekode på [GitHub](https://github.com/fangjunyu1/SwiftSlim), og kan lastes ned og brukes gratis. Det finnes også en App Store-versjon som kan prøves.

Vi håper å hjelpe flere mennesker uten teknisk bakgrunn, men som ønsker å endre karrierevei, til å få nye muligheter gjennom å lære programmering og utvikle apper.

## Innholdsoppdateringer

Denne veiledningen er skrevet basert på den nåværende versjonen av Swift og SwiftUI.

Etter hvert som Apple-plattformer og verktøy oppdateres, kan enkelte API-er endre seg. Hvis du oppdager problemer eller at innhold bør oppdateres, kan du se til den offisielle dokumentasjonen eller den nyeste versjonen i det åpne kodearkivet.

---
Fang Junyu

2026-02-14
