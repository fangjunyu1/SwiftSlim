# Úvod

## Čo je Swift?

Predtým, než sa začneme učiť Swift, si najprv stručne predstavíme programovací jazyk Swift. Swift je moderný programovací jazyk vyvinutý spoločnosťou Apple a používa sa najmä na vytváranie aplikácií pre platformy Apple, ako sú iOS, macOS, iPadOS a watchOS.

![Swift](../../RESOURCE/000_swift.png)

V porovnaní s inými programovacími jazykmi má Swift stručnejšiu syntax, viac zdôrazňuje bezpečnosť a čitateľnosť. V kombinácii so SwiftUI sa tiež ľahšie učí a chápe. Samozrejme, predtým som sa neučil žiadny iný programovací jazyk, takže môže byť o niečo náročnejší než HTML.

Swift sa nepoužíva len na vývoj aplikácií pre platformy Apple. Komunita Swift sa usiluje preniesť Swift aj na platformu [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) a dokonca ho spúšťať aj v iných prostrediach, napríklad na [serveroch](https://github.com/awslabs/swift-aws-lambda-runtime). Z dlhodobého hľadiska má Swift väčší priestor na rozvoj a v budúcnosti sa môže stať multiplatformovým programovacím jazykom podobne ako Flutter alebo React Native.

## Obsah učenia

Tento kurz sa zameriava najmä na základy Swiftu a SwiftUI.

Začneme jednoduchými premennými a dátovými typmi, budeme pomocou SwiftUI vytvárať používateľské rozhranie, porozumieme spôsobom ukladania a čítania dát a neskôr sa možno dostaneme aj k pokročilejším témam, ako sú SwiftData či synchronizácia cez iCloud.

Každá kapitola bude postavená na konkrétnom praktickom príklade a znalosti Swiftu sa budeme učiť priamo v reálnom použití.

Niektoré kurzy najprv sústredene vysvetľujú veľké množstvo syntaxe a API a až potom prechádzajú k praktickým projektom. Pre začiatočníka je to podobné, ako keby sa dieťa učilo slová zo slovníka — ak chýba reálny kontext použitia, memorovanie veľkého množstva obsahu nakoniec len vedie k strate záujmu.

Tento kurz bude učiť poznatky priamo v kontexte skutočných vývojových scenárov a jednotlivé potreby budú prirodzene uvádzať súvisiace znalostné body.

Po dokončení tohto kurzu budete schopní samostatne vyvinúť a spustiť jednoduchú aplikáciu, nainštalovať ju na svoje zariadenie s iOS / macOS a prípadne ju aj publikovať v App Store.

## Ako sa učiť od úplných základov?

Aj ja som na začiatku začínal úplne od nuly. Najprv som si len pozrel niekoľko dielov [výučbových videí Swiftu](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) na YouTube a zistil som, že vývoj aplikácií pre iOS nie je až taký zložitý, čo vo mne vzbudilo určitý záujem. Potom som sa začal pokúšať naučiť viac o Swifte. Napríklad som si vyskúšal programovacie hry v [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), čítal [oficiálnu príručku Swiftu](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) a učil sa z [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Keď sa na to pozerám teraz, práve [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) mi poskytlo rámec učenia, vďaka ktorému som sa mohol SwiftUI učiť systematicky. Keďže však bol tento kurz v angličtine a zároveň som nemal programátorské základy, pri porozumení som narážal na množstvo ťažkostí. Preto som využíval AI nástroje ako [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com), aby mi pomohli lepšie pochopiť jednotlivé poznatky.

Počas učenia sa nevyhnutne objavia témy, ktorým je ťažšie porozumieť. Pamätám si napríklad, že keď som sa učil UserDefaults, vedel som len, ako dáta uložiť, ale nevedel som, že ich treba načítať ručne, a tak som dokonca začal pochybovať, či v mojom kóde nie je chyba. Aj takýto jednoduchý poznatok ma stál niekoľko dní času.

Napríklad pri témach ako closures, hlavné vlákno alebo generiká som im v počiatočnej fáze učenia nedokázal porozumieť do hĺbky. Keď som sa s nimi potom znova stretol pri reálnom vývoji, musel som opäť investovať energiu do ich štúdia.

Preto odporúčam:

**1. Doplňte si základné poznatky**

V Číne existuje príslovie: „Začať je najťažšie.“ Pre nováčikov, ktorí sa učia Swift úplne od nuly, je prirodzené, že sa počas učenia stretnú s ťažko pochopiteľnými témami — často to však neznamená, že samotná téma je veľmi zložitá, ale skôr to, že na spodku tejto pyramídy znalostí sa nachádzajú ešte základnejšie pojmy, s ktorými sa začiatočník zatiaľ nestretol.

Ak sa ocitnete v takejto situácii, môžete zvážiť použitie AI nástrojov, ako sú [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com), aby ste si chýbajúce základy včas doplnili.

**2. Snažte sa porozumieť každému poznatku**

Počas učenia je najdôležitejšie snažiť sa porozumieť každému jednotlivému poznatku, aj keby to malo trvať niekoľko dní.

Ak sa rozhodnete preskočiť niečo, čomu nerozumiete, je veľmi pravdepodobné, že sa s tým počas ďalšieho vývoja znova stretnete a bude to brzdiť váš postup. Nakoniec aj tak budete musieť znovu investovať čas do učenia. Namiesto neskorého napravovania je lepšie pochopiť veci už vo fáze učenia.

Každý poznatok je vo svojej podstate nástroj — čím viac nástrojov ovládate, tým silnejšia je vaša schopnosť riešiť problémy.

Je to ako pri stavbe domu: ak máte v rukách len jeden nástroj, možno s ním zvládnete väčšinu práce, ale pri vyšších nárokoch na kvalitu už nebude stačiť. Len ak ovládate viac nástrojov, môžete postaviť pevnejší dom.

**3. Zachovajte si kontinuitu učenia**

Učenie si vyžaduje dlhodobú vytrvalosť. Len málokto je naozaj ochotný venovať niekoľko mesiacov tomu, aby poctivo prešiel celý kurz. Dôležitejšie než krátkodobá vysoká intenzita je neustále a pravidelné investovanie času do učenia.

Aj keď každý deň dokončíte len jedno percento, za sto dní môžete dokončiť celý cieľ učenia.

## Vzdelávacia vízia

Tento kurz nebude učiť príliš veľa vedomostí o Swifte a SwiftUI, ale skôr pomôže začiatočníkom vstúpiť na cestu programovania v Swifte. Je to ako skladanie stavebnice — kurz vysvetlí spôsob skladania a zvyšný čas je na vás, aby ste si poskladali vlastnú stavbu.

Projekt je open source na [GitHube](https://github.com/fangjunyu1/SwiftSlim), je možné ho bezplatne stiahnuť a používať. Zároveň je k dispozícii aj verzia v App Store na vyskúšanie.

Dúfame, že pomôžeme viacerým ľuďom bez technického zázemia, ktorí túžia zmeniť svoju kariérnu cestu, aby si prostredníctvom učenia sa programovania a vývoja aplikácií otvorili nové možnosti.

## Aktualizácie obsahu

Tento kurz je napísaný na základe aktuálnej verzie Swiftu a SwiftUI.

Keďže sa platformy Apple a nástroje priebežne aktualizujú, niektoré API sa môžu zmeniť. Ak narazíte na problém alebo bude potrebné obsah aktualizovať, môžete sa pozrieť do oficiálnej dokumentácie alebo do najnovšej verzie open source repozitára.

---
Fang Junyu

2026-02-14
