# Uvod

## Kaj je Swift?

Preden začnemo z učenjem Swifta, najprej na kratko spoznajmo programski jezik Swift. Swift je sodoben programski jezik, ki ga je razvil Apple in se uporablja predvsem za razvoj aplikacij za Applove platforme, kot so iOS, macOS, iPadOS in watchOS.

![Swift](../../RESOURCE/000_swift.png)

V primerjavi z drugimi programskimi jeziki ima Swift bolj jedrnato sintakso ter daje večji poudarek varnosti in berljivosti. V kombinaciji s SwiftUI ga je tudi lažje učiti in razumeti. Seveda sam prej nisem poznal drugih programskih jezikov, zato se mi je zdel morda le malo težji od HTML-ja.

Swift ni namenjen le razvoju aplikacij za Applove platforme. Skupnost Swift si prizadeva prenesti Swift tudi na platformo [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) in ga celo zagnati v drugih okoljih, kot so [strežniki](https://github.com/awslabs/swift-aws-lambda-runtime). Z vidika dolgoročnega razvoja ima Swift več prostora za rast in ima v prihodnosti možnost postati večplatformski programski jezik, podoben Flutterju ali React Native.

## Vsebina učenja

Ta vodič je osredotočen predvsem na osnove Swifta in SwiftUI-ja.

Začeli bomo s preprostimi spremenljivkami in podatkovnimi tipi, z uporabo SwiftUI gradili uporabniške vmesnike, razumeli načine shranjevanja in branja podatkov, nato pa se bomo morda poglobili tudi v naprednejše teme, kot sta SwiftData in sinhronizacija prek iClouda.

Vsako poglavje bo zgrajeno okoli konkretnega primera, tako da se bomo Swift učili v dejanskih scenarijih uporabe.

Nekateri vodiči najprej dolgo razlagajo veliko sintakse in API-jev, šele nato preidejo na praktične projekte. Za začetnike je to podobno, kot da bi se otrok učil besede iz slovarja — brez konkretnega konteksta si je težko zapomniti veliko vsebine, na koncu pa začetnik hitro izgubi zanimanje.

Ta vodič bo znanje podajal znotraj dejanskih razvojnih scenarijev, pri čemer bodo potrebe same vodile do ustreznih znanjskih točk.

Po zaključku tega vodiča boste lahko samostojno razvili in zagnali osnovno aplikacijo, jo namestili na svojo napravo iOS ali macOS ter jo po potrebi tudi objavili v App Store.

## Kako se učiti brez predznanja?

Tudi sam sem začel popolnoma brez osnove. Na začetku sem si ogledal nekaj [videov o Swiftu na YouTubu](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) in ugotovil, da razvoj aplikacij za iOS ni tako zapleten, kar je v meni vzbudilo določeno zanimanje. Nato sem začel raziskovati več znanja o Swiftu. Na primer, preizkusil sem programske igre v [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), bral [uradno dokumentacijo za Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) ter se učil iz [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Z današnje perspektive je bil prav [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) tisti, ki mi je ponudil učni okvir, s katerim sem lahko SwiftUI spoznaval bolj sistematično. Ker pa je bil vodič v angleščini in ker nisem imel programerskih osnov, sem med razumevanjem naletel na zelo veliko težav. Zato sem si pri razumevanju konceptov pomagal z umetno inteligenco, kot sta [ChatGPT](https://chatgpt.com/) in [Claude](https://claude.ai/?redirect=claude.com).

Med učenjem se neizogibno pojavijo težje razumljive vsebine. Spomnim se, da sem se pri učenju UserDefaults naučil le, kako podatke shraniti, nisem pa razumel, da jih je treba ročno tudi prebrati, zato sem celo podvomil, ali je z mojo kodo kaj narobe. Tudi tako preprost koncept mi je vzel več dni časa.

Podobno je bilo pri konceptih, kot so closure, glavna nit in generiki. Ker jih v začetni fazi nisem zares globoko razumel, sem jih moral ob ponovnem srečanju v dejanskem razvoju znova študirati in ponovno vlagati čas.

Zato je moj nasvet naslednji:

**1. Dopolnite osnovno znanje**

Na Kitajskem pravimo: »Vsak začetek je težak.« Za začetnike brez predznanja je povsem normalno, da med učenjem Swifta naletijo na koncepte, ki jih je težko razumeti — pogosto ne zato, ker bi bili sami po sebi zelo zapleteni, ampak zato, ker se pod njimi skrivajo še bolj osnovni koncepti, s katerimi se začetnik še ni srečal.

V takih primerih si lahko pomagate z orodji umetne inteligence, kot sta [ChatGPT](https://chatgpt.com/) in [Claude](https://claude.ai/?redirect=claude.com), da pravočasno zapolnite manjkajoče osnovno znanje.

**2. Razumite vsako znanje posebej**

Med učenjem je najpomembneje, da poskušate razumeti vsak posamezen koncept, tudi če za to potrebujete več dni.

Če se odločite preskočiti nekaj, česar ne razumete, boste na to v nadaljnjem razvoju zelo verjetno znova naleteli, to pa bo oviralo vaš napredek. Na koncu boste tako ali tako morali ponovno vložiti čas v učenje. Bolje je, da stvar razumete že v fazi učenja, kot da jo popravljate kasneje.

Vsak koncept je v bistvu orodje — več orodij kot obvladate, močnejša je vaša sposobnost reševanja problemov.

To je podobno gradnji hiše. Če imate v rokah le eno orodje, lahko sicer opravite večino dela, vendar boste pri višjih zahtevah glede kakovosti hitro naleteli na omejitve. Le z več orodji lahko zgradite trdnejšo hišo.

**3. Ohranite kontinuiteto učenja**

Učenje zahteva dolgoročno vztrajnost. Malo ljudi je pripravljeno več mesecev resno posvetiti učenju skozi en sam vodič. Pomembnejše od kratkotrajne visoke intenzivnosti je redno in neprekinjeno vlaganje časa.

Tudi če vsak dan opravite le en odstotek, lahko v sto dneh dosežete celoten cilj.

## Izobraževalna vizija

Ta tečaj ne bo učil prevelike količine znanja o Swiftu in SwiftUI-ju, temveč bo začetnike pripeljal na pot programiranja s Swiftom. Podobno kot pri sestavljanju kock — vodič razloži način sestavljanja, preostali čas pa je namenjen temu, da sami zgradite svojo lastno stvaritev.

Projekt je odprtokodno objavljen na [GitHubu](https://github.com/fangjunyu1/SwiftSlim), kjer ga lahko brezplačno prenesete in uporabljate. Na voljo je tudi različica v App Store za preizkus.

Upamo, da bomo pomagali več ljudem brez tehničnega ozadja, ki si želijo spremeniti svojo poklicno pot, da z učenjem programiranja in razvojem aplikacij pridobijo nove možnosti.

## Posodabljanje vsebine

Ta vodič je napisan na podlagi trenutne različice Swifta in SwiftUI-ja.

Ker se Applove platforme in orodja posodabljajo, se lahko nekateri API-ji sčasoma spremenijo. Če opazite težave ali vsebino, ki jo je treba posodobiti, se lahko obrnete na uradno dokumentacijo ali na najnovejšo različico odprtokodnega repozitorija.

---
Fang Junyu

2026-02-14
