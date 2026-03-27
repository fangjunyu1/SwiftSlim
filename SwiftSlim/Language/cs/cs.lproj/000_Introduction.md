# Úvod

## Co je to Swift?

Než se začneme učit Swift, pojďme se s tímto programovacím jazykem stručně seznámit. Swift je moderní programovací jazyk vyvinutý společností Apple, který se primárně používá k vytváření aplikací pro platformy Apple, jako jsou iOS, macOS, iPadOS, watchOS a další.

![Swift](../../RESOURCE/000_swift.png)

Ve srovnání s jinými programovacími jazyky má Swift stručnou syntaxi a klade větší důraz na bezpečnost a čitelnost. V kombinaci se SwiftUI je jeho učení a pochopení ještě snazší. Samozřejmě, já sám jsem se dříve žádný jiný programovací jazyk neučil, takže se mi může zdát jen o něco těžší než HTML.

Swift neslouží pouze k vývoji aplikací pro platformy Apple. Komunita Swiftu se aktivně snaží přenést Swift na platformu [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) a dokonce jej spouštět na [serverech](https://github.com/awslabs/swift-aws-lambda-runtime) či v jiných prostředích. Z dlouhodobého hlediska má Swift obrovský prostor pro rozvoj a v budoucnu má šanci stát se multiplatformním programovacím jazykem podobným Flutteru nebo React Native.

## Obsah kurzu

Tento tutoriál se zaměřuje především na základy jazyka Swift a frameworku SwiftUI.

Začneme od jednoduchých proměnných a datových typů, budeme vytvářet uživatelská rozhraní pomocí SwiftUI, pochopíme způsoby ukládání a čtení dat a nakonec se možná ponoříme i do pokročilejších témat, jako je SwiftData nebo synchronizace přes iCloud.

Každá kapitola bude postavena na praktickém příkladu, takže se znalosti Swiftu budete učit přímo při reálném použití.

Některé tutoriály mohou nejprve vysvětlovat obrovské množství syntaxe a API a až poté přejít k samotnému projektu. Pro začátečníka je to jako nutit dítě učit se číst ze slovníku – memorování spousty informací bez reálného kontextu nakonec povede jen k tomu, že začátečník ztratí zájem.

Tento tutoriál vás bude učit znalosti v kontextu reálných vývojových scénářů a konkrétní potřeby projektu nám vždy odhalí příslušné teoretické koncepty.

Po dokončení tohoto tutoriálu budete schopni samostatně vyvinout a spustit základní aplikaci, nainstalovat si ji na vlastní zařízení s iOS / macOS, nebo ji dokonce publikovat v App Store.

## Jak se učit s nulovými zkušenostmi?

Na začátku jsem byl také úplný začátečník. Nejdříve jsem jen zhlédl několik [výukových videí o Swiftu na YouTube]( Zjištění, že vývoj iOS aplikací není složitý, ve mně vzbudilo určitý zájem. Poté jsem se začal snažit naučit o Swiftu více. Vyzkoušel jsem například programovací hry v aplikaci [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), četl [oficiální dokumentaci Swiftu](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) a studoval kurz [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

S odstupem času vidím, že to byl především kurz [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui), který mi poskytl vzdělávací rámec a umožnil mi systematicky se učit SwiftUI. Nicméně, protože byl tutoriál v angličtině a já postrádal základy programování, narážel jsem při snaze o porozumění na mnoho obtíží. Z toho důvodu jsem k pochopení jednotlivých konceptů využíval pomoc umělé inteligence, jako je [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com).

Během studia se nevyhnutelně objevily koncepty, které bylo obtížné pochopit. Pamatuji si, že když jsem se učil o UserDefaults, věděl jsem jen, jak data uložit, ale netušil jsem, že se musí také ručně načíst, což mě vedlo k pochybnostem, zda v mém kódu není chyba. I takto jednoduchá věc mě stála několik dní ztraceného času.

Dalším příkladem jsou koncepty jako uzávěry (closures), hlavní vlákno (main thread) nebo generika (generics). Protože jsem je v rané fázi studia nedokázal pochopit do hloubky, musel jsem při jejich pozdějším využití v reálném vývoji věnovat další energii jejich znovunaučení.

Proto zní má doporučení následovně:

**1. Doplňte si základní znalosti**

Jedno čínské přísloví říká: „Každý začátek je těžký.“ Pro nováčka, který se učí Swift s nulovými zkušenostmi, je nevyhnutelné, že během studia narazí na těžko pochopitelné koncepty. Často to není tím, že by byla daná věc sama o sobě tak složitá, ale spíše tím, že na dně této pyramidy vědomostí leží ještě základnější pojmy, se kterými se začátečník dosud nesetkal.

Pokud nastane taková situace, můžete zvážit využití AI nástrojů, jako jsou [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com), abyste si chybějící základy včas doplnili.

**2. Pochopte každý jednotlivý koncept**

Nejdůležitější věcí během procesu učení je snaha porozumět každému bodu učiva, i kdyby to mělo zabrat několik dní.

Pokud se rozhodnete přeskočit to, čemu nerozumíte, s velkou pravděpodobností na to při dalším vývoji narazíte znovu. Zpomalí to váš pokrok a nakonec stejně budete muset investovat čas do toho, abyste se to naučili. Je lepší daný koncept správně pochopit už ve fázi učení, než později složitě napravovat škody.

Každá znalost je ve své podstatě nástroj – čím více nástrojů ovládáte, tím lépe dokážete řešit problémy.

Je to jako se stavbou domu: pokud máte v ruce jen jeden nástroj, možná s vypětím všech sil zvládnete většinu práce, ale když budete čelit požadavkům na vyšší kvalitu, začnete ztrácet dech. Zvládnutí více nástrojů je to, co vám umožní postavit stabilnější dům.

**3. Udržujte si kontinuitu učení**

Učení vyžaduje dlouhodobou vytrvalost. Jen málokdo je opravdu ochoten obětovat několik měsíců svého času pečlivému studiu tutoriálu. Pravidelné a trvalé investování času do studia je mnohem důležitější než krátkodobé, ale intenzivní nárazové učení.

I když každý den dokončíte jen jedno procento, za sto dní dosáhnete celého svého studijního cíle.

## Vzdělávací vize

Tento kurz vás nenaučí vyčerpávající množství znalostí o Swiftu a SwiftUI, ale spíše vyvede začátečníky na samotnou cestu programování ve Swiftu. Je to jako skládání stavebnice – tutoriál je zodpovědný za to, že vám vysvětlí, jak dílky spojovat, a zbytek času už bude jen na vás, abyste si postavili svou vlastní stavebnici.

Projekt je jako open source dostupný na [GitHubu](https://github.com/fangjunyu1/SwiftSlim), kde si jej můžete zdarma stáhnout a používat. Zároveň je k dispozici i verze v App Store pro vyzkoušení.

Doufáme, že pomůžeme více lidem bez technického vzdělání, kteří touží po změně své kariérní cesty, získat nové možnosti prostřednictvím výuky programování a vývoje aplikací.

## Aktualizace obsahu

Tento tutoriál je napsán na základě aktuálních verzí jazyka Swift a frameworku SwiftUI.

S tím, jak se aktualizují platformy a nástroje společnosti Apple, může dojít ke změnám některých API. Pokud narazíte na problém nebo zjistíte, že je nutné obsah aktualizovat, podívejte se prosím do oficiální dokumentace nebo do nejnovější verze repozitáře s otevřeným zdrojovým kódem.

---
Fang Junyu

2026-02-14
