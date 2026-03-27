# Inleiding

## Wat is Swift?

Voordat we Swift gaan leren, bekijken we eerst kort de programmeertaal Swift. Swift is een moderne programmeertaal die door Apple is ontwikkeld en vooral wordt gebruikt om apps te bouwen voor Apple-platformen zoals iOS, macOS, iPadOS en watchOS.

![Swift](../../RESOURCE/000_swift.png)

Vergeleken met andere programmeertalen heeft Swift een beknoptere syntaxis en legt het meer nadruk op veiligheid en leesbaarheid. In combinatie met SwiftUI is het ook makkelijker te leren en te begrijpen. Ik had zelf eerder trouwens geen andere programmeertalen geleerd, dus het kan iets moeilijker aanvoelen dan HTML.

Swift kan niet alleen apps ontwikkelen voor Apple-platformen. De Swift-community werkt er ook aan om Swift over te brengen naar het [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/)-platform, en het kan zelfs draaien in andere omgevingen zoals op [servers](https://github.com/awslabs/swift-aws-lambda-runtime). Op de lange termijn heeft Swift meer ontwikkelingsruimte en kan het in de toekomst misschien een platformonafhankelijke programmeertaal worden zoals Flutter en React Native.

## Leerinhoud

Deze tutorial richt zich vooral op de basiskennis van Swift en SwiftUI.

We beginnen met eenvoudige variabelen en datatypen, gebruiken SwiftUI om interfaces te bouwen, begrijpen hoe gegevens worden opgeslagen en gelezen, en gaan mogelijk later ook dieper in op geavanceerdere onderwerpen zoals SwiftData en iCloud-synchronisatie.

Elk hoofdstuk draait om een praktisch voorbeeld, zodat we Swift-kennis leren in echte toepassingssituaties.

Sommige tutorials leggen eerst een grote hoeveelheid syntaxis en API's uit en gaan daarna pas over naar projectoefeningen. Voor beginners is dat een beetje alsof een kind woorden leert uit een woordenboek. Als je zonder toepassingscontext een grote hoeveelheid inhoud moet onthouden, verlies je uiteindelijk alleen maar je interesse.

Deze tutorial leert kennis in echte ontwikkelscenario's en laat de behoeften de relevante kennispunten naar voren brengen.

Na het voltooien van deze tutorial kun je zelfstandig een basisapp ontwikkelen en uitvoeren, deze installeren op je eigen iOS- of macOS-apparaat, en de app ook publiceren in de App Store.

## Hoe leer je zonder voorkennis?

Toen ik begon, had ik ook helemaal geen basis. In het begin keek ik alleen een paar [Swift-lesvideo's](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) op Youtube en ontdekte ik dat het ontwikkelen van iOS-apps niet zo ingewikkeld was. Dat wekte mijn interesse. Daarna begon ik meer Swift-kennis te leren. Bijvoorbeeld door programmeerspellen in [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12) uit te proberen, de [officiële Swift-documentatie](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) te lezen en [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) te volgen.

Achteraf gezien was het vooral [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) dat een leerraamwerk bood, zodat ik SwiftUI systematisch kon leren. Maar omdat de tutorial in het Engels is en ik zelf geen programmeerbasis had, liep ik tegen veel moeilijkheden aan tijdens het begrijpen ervan. Daarom gebruikte ik AI-tools zoals [ChatGPT](https://chatgpt.com/) en [Claude](https://claude.ai/?redirect=claude.com) om kennispunten beter te begrijpen.

Tijdens het leerproces kom je onvermijdelijk kennis tegen die lastig te begrijpen is. Ik herinner me dat ik bij het leren van UserDefaults alleen wist hoe ik gegevens moest opslaan, maar niet dat de gegevens handmatig moesten worden gelezen, waardoor ik dacht dat er iets mis was met mijn code. Zelfs zo'n eenvoudig kennispunt kostte me meerdere dagen.

Hetzelfde gold voor onderwerpen zoals closures, de main thread en generics. Omdat ik ze in het begin niet diepgaand begreep, moest ik later, toen ik ze opnieuw tegenkwam in echte ontwikkeling, opnieuw tijd steken in het leren ervan.

Daarom is mijn advies:

**1. Vul basiskennis aan**

In China bestaat het gezegde: “Alles is moeilijk in het begin.” Voor beginners die Swift zonder basis leren, is het onvermijdelijk dat ze tijdens het leerproces op kennispunten stuiten die moeilijk te begrijpen zijn. Dat betekent vaak niet dat het kennispunt zelf erg ingewikkeld is, maar dat er onderaan deze kennispiramide nog fundamentelere begrippen liggen waar de beginner nog niet mee in aanraking is gekomen.

Wanneer dit gebeurt, kun je overwegen om AI-tools zoals [ChatGPT](https://chatgpt.com/) en [Claude](https://claude.ai/?redirect=claude.com) te gebruiken om ontbrekende basiskennis tijdig aan te vullen.

**2. Begrijp elk kennispunt**

Het belangrijkste tijdens het leren is om elk kennispunt zo goed mogelijk te begrijpen, zelfs als dat een paar dagen kost.

Als je ervoor kiest om iets wat je niet begrijpt over te slaan, is de kans groot dat je het later in de ontwikkeling opnieuw tegenkomt en dat het je voortgang belemmert. Uiteindelijk moet je er dan alsnog opnieuw tijd in investeren. In plaats van achteraf problemen te repareren, is het beter om de kennis al tijdens het leerproces goed te begrijpen.

Elk kennispunt is in wezen een hulpmiddel. Hoe meer hulpmiddelen je beheerst, hoe sterker je probleemoplossend vermogen wordt.

Het is als het bouwen van een huis. Als je maar één gereedschap in handen hebt, kun je het meeste werk misschien net doen, maar zodra de kwaliteitseisen hoger worden, schiet het tekort. Alleen door meer gereedschappen te beheersen, kun je een steviger huis bouwen.

**3. Blijf voortdurend leren**

Leren vraagt om langdurige volharding. Er zijn maar weinig mensen die echt bereid zijn om maandenlang serieus een tutorial te leren. Consequent tijd blijven investeren is belangrijker dan op korte termijn heel intensief werken.

Zelfs als je elke dag maar één procent voltooit, kun je na honderd dagen het hele leerdoel bereiken.

## Onderwijsvisie

Deze cursus zal niet te veel Swift- en SwiftUI-kennis tegelijk onderwijzen, maar beginners op weg helpen op het programmeerpad van Swift. Het is als bouwen met blokken: de tutorial legt uit hoe je de blokken in elkaar zet, en daarna is het aan jou om je eigen creaties te bouwen.

Het project is open source op [GitHub](https://github.com/fangjunyu1/SwiftSlim), en kan gratis worden gedownload en gebruikt. Er is ook een App Store-versie beschikbaar om uit te proberen.

We hopen meer mensen zonder technische achtergrond, maar met de wens om hun loopbaanpad te veranderen, te helpen om nieuwe mogelijkheden te krijgen door programmeren te leren en apps te ontwikkelen.

## Inhoudsupdates

Deze tutorial is geschreven op basis van de huidige versie van Swift en SwiftUI.

Naarmate Apple-platformen en tools worden bijgewerkt, kunnen sommige API's veranderen. Als je problemen ontdekt of denkt dat inhoud moet worden bijgewerkt, kun je de officiële documentatie of de nieuwste versie van de open-source repository raadplegen.

---
Fang Junyu

2026-02-14
