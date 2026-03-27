# Inledning

## Vad är Swift?

Innan vi börjar lära oss Swift kan vi först kort förstå vad programmeringsspråket Swift är. Swift är ett modernt programmeringsspråk utvecklat av Apple och används främst för att bygga appar för Apples plattformar, såsom iOS, macOS, iPadOS och watchOS.

![Swift](../../RESOURCE/000_swift.png)

Jämfört med andra programmeringsspråk har Swift en enkel syntax och lägger större vikt vid säkerhet och läsbarhet. Tillsammans med SwiftUI blir det också lättare att lära sig och förstå. Jag hade förstås själv inte lärt mig andra programmeringsspråk tidigare, så det kändes kanske lite svårare än HTML.

Swift kan inte bara användas för att utveckla appar på Apples plattformar. Swift-communityn arbetar också med att porta Swift till [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/), och till och med köra det i andra miljöer som på [servrar](https://github.com/awslabs/swift-aws-lambda-runtime). Ur ett långsiktigt utvecklingsperspektiv har Swift större potential och kan i framtiden få möjlighet att bli ett plattformsöverskridande programmeringsspråk liknande Flutter och React Native.

## Innehåll i kursen

Den här kursen fokuserar främst på grunderna i Swift och SwiftUI.

Vi börjar med enkla variabler och datatyper, använder SwiftUI för att bygga gränssnitt, förstår hur data lagras och läses, och går kanske till sist vidare till mer avancerade ämnen som SwiftData och iCloud-synkronisering.

Varje kapitel kretsar kring ett verkligt exempel, så att Swift-kunskaper lärs in i praktisk användning.

Vissa kurser går först igenom stora mängder syntax och API:er innan de börjar med projekt. För nybörjare är det ungefär som att ett barn lär sig ord ur en ordbok — att memorera stora mängder innehåll utan användningssammanhang gör till slut bara att motivationen försvinner.

Den här kursen lär ut kunskap i verkliga utvecklingsscenarier och låter konkreta behov leda fram till relevanta kunskapspunkter.

När du har gått klart kursen kommer du att kunna utveckla och köra en grundläggande app på egen hand, installera den på dina egna iOS-/macOS-enheter och även publicera appen på App Store.

## Hur lär man sig som helt nybörjare?

Jag var själv också helt ny från början. Till en början tittade jag bara på några [Swift-undervisningsvideor](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) på Youtube och upptäckte att det inte verkade särskilt komplicerat att utveckla iOS-appar, vilket väckte mitt intresse. Därefter började jag försöka lära mig mer om Swift, till exempel genom att prova programmeringsspelen i [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), läsa [Swifts officiella handledning](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) och studera [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

När jag ser tillbaka nu var det framför allt [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) som gav mig en inlärningsram, så att jag kunde lära mig SwiftUI mer systematiskt. Men eftersom kursen var på engelska och jag själv saknade programmeringsbakgrund, stötte jag på väldigt många svårigheter i förståelsen. Därför använde jag AI-verktyg som [ChatGPT](https://chatgpt.com/) och [Claude](https://claude.ai/?redirect=claude.com) för att få hjälp att förstå olika kunskapspunkter.

Under inlärningen stöter man oundvikligen på kunskap som är svår att förstå. Jag minns till exempel att när jag lärde mig UserDefaults visste jag bara hur man sparade data, men inte att data måste läsas in manuellt, vilket fick mig att misstänka att det var fel på min kod. Även en så enkel kunskapspunkt gjorde att jag förlorade flera dagar.

Ett annat exempel är kunskapspunkter som closures, huvudtråden och generics. I början av min inlärning kunde jag inte förstå dem på djupet, och när jag senare stötte på dem igen i verklig utveckling behövde jag lägga ny energi på att lära mig dem på nytt.

Därför är mitt råd följande:

**1. Fyll på med grundläggande kunskap**

Det finns ett kinesiskt ordspråk som säger att ”allt är svårt i början”. För nybörjare som lär sig Swift från grunden är det oundvikligt att stöta på kunskap som är svår att förstå under lärprocessen — ofta beror det inte på att kunskapspunkten i sig är särskilt komplicerad, utan på att det längst ner i denna kunskapspyramid finns ännu mer grundläggande begrepp som nybörjaren inte har kommit i kontakt med.

När detta händer kan man överväga att använda AI-verktyg som [ChatGPT](https://chatgpt.com/) och [Claude](https://claude.ai/?redirect=claude.com) för att snabbt komplettera de grundläggande kunskaper som saknas.

**2. Förstå varje kunskapspunkt**

Det viktigaste under inlärningen är att så långt som möjligt försöka förstå varje kunskapspunkt, även om det skulle ta flera dagar.

Om man väljer att hoppa över sådant man inte förstår, kommer man med stor sannolikhet att stöta på det igen i senare utveckling, där det då hindrar arbetets framsteg, och till slut måste man ändå lägga tid på att lära sig det på nytt. I stället för att försöka laga i efterhand är det bättre att förstå kunskapen ordentligt redan under lärandet.

Varje kunskapspunkt är i grunden ett verktyg — ju fler verktyg du behärskar, desto starkare blir din förmåga att lösa problem.

Det är som att bygga ett hus. Om du bara har ett enda verktyg i handen kan du visserligen med nöd och näppe utföra det mesta arbetet, men när högre kvalitetskrav ställs kommer det inte att räcka till. Först när du behärskar fler verktyg kan du bygga ett stabilare hus.

**3. Fortsätt lära kontinuerligt**

Lärande kräver uthållighet över lång tid. Få människor är verkligen villiga att avsätta flera månader för att seriöst arbeta igenom en kurs. Att fortsätta lägga tid på lärandet är viktigare än kortvariga intensiva insatser.

Även om du bara slutför en procent varje dag kan du nå hela målet på hundra dagar.

## Pedagogisk vision

Den här kursen kommer inte att lära ut alltför mycket Swift- och SwiftUI-kunskap, utan snarare leda nybörjare in på den väg som heter Swift-programmering. Det är som att bygga med klossar — kursen ansvarar för att förklara hur delarna sätts ihop, och resten av tiden är till för att du själv ska bygga dina egna konstruktioner.

Projektet är öppen källkod på [GitHub](https://github.com/fangjunyu1/SwiftSlim) och kan laddas ner och användas gratis. Det finns också en App Store-version för att prova.

Vi hoppas kunna hjälpa fler människor utan teknisk bakgrund men med en stark vilja att förändra sin yrkesbana, så att de genom att lära sig programmering och utveckla appar kan få nya möjligheter.

## Innehållsuppdateringar

Den här kursen är skriven utifrån den nuvarande versionen av Swift och SwiftUI.

I takt med att Apples plattformar och verktyg uppdateras kan vissa API:er förändras. Om du upptäcker problem eller att innehåll behöver uppdateras kan du hänvisa till den senaste versionen av den officiella dokumentationen eller det öppna källkodsarkivet.

---
Fang Junyu

2026-02-14  
