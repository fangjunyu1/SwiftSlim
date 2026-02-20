# Úvod

## Co je Swift?

Předtím, než se začneme učit Swift, promluvme si o programovacím jazyce Swift. Swift je moderní programovací jazyk vyvinutý společností Apple, který se používá hlavně pro tvorbu aplikací na platformách Apple, jako jsou iOS, macOS, iPadOS, watchOS atd.

![Swift](000_swift.png)

V porovnání s jinými programovacími jazyky má Swift stručnou syntaxi a klade větší důraz na bezpečnost a čitelnost. Ve spojení se SwiftUI je snazší se ho naučit a pochopit. Samozřejmě, předtím jsem se neučil jiné programovací jazyky, možná je o něco těžší než HTML.

Swift neslouží jen k vývoji aplikací pro platformy Apple. Komunita Swift usilovně pracuje na přenosu Swiftu na platformu [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) a dokonce i na jeho spuštění na [serverech](https://github.com/awslabs/swift-aws-lambda-runtime) a v dalších prostředích. Z dlouhodobého hlediska má Swift velký prostor pro růst a v budoucnu má šanci stát se multiplatformním programovacím jazykem podobným Flutteru nebo React Native.

## Obsah výuky

Tento kurz se zaměřuje především na základy Swiftu a SwiftUI.

Začneme učením jednoduchých proměnných a datových typů, budeme používat SwiftUI k vytváření rozhraní, pochopíme způsoby ukládání a čtení dat a nakonec se možná ponoříme do pokročilých témat, jako jsou Swift Data a synchronizace přes iCloud.

Každá kapitola se bude točit kolem reálného případu, abychom se znalosti Swiftu učili v praxi.

Některé návody se mohou nejprve soustředit na vysvětlení velkého množství syntaxe a API, než přejdou k projektové praxi. Pro začátečníky je to jako když se dítě učí slova ze slovníku; zapamatování velkého množství obsahu bez aplikačních scénářů nakonec vede jen ke ztrátě zájmu.

V tomto kurzu se budeme učit znalosti v reálných vývojových scénářích a využívat požadavky k zavedení souvisejících poznatků.

Po dokončení tohoto kurzu budete schopni samostatně vyvinout a spustit základní aplikaci, nainstalovat ji na své vlastní iOS / macOS zařízení nebo ji publikovat v App Store.

## Jak se učit od nuly?

Dříve jsem také začínal od nuly. Zpočátku jsem jen procházel několik [výukových videí Swift]( aplikací pro iOS není složitý, což ve mně vzbudilo zájem. Poté jsem se začal snažit získat více znalostí o Swiftu. Například hraním programovacích her v [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), čtením [oficiální dokumentace Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) a studiem [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

S odstupem času se zdá, že to byl hlavně [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui), co mi poskytlo rámec pro učení a umožnilo mi systematicky se učit SwiftUI. Nicméně, protože kurz je v angličtině a já postrádal základy programování, narážel jsem při porozumění na mnoho potíží. K jejich řešení jsem používal AI jako [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com), aby mi pomohly pochopit jednotlivé body.

V procesu učení se nevyhnutelně objeví některé znalosti, které jsou obtížnější na pochopení. Vzpomínám si, že když jsem se učil UserDefaults, věděl jsem jen, jak data uložit, ale nevěděl jsem, že data je třeba ručně načíst, takže jsem podezříval svůj kód z chyb. I takto jednoduchá věc mě stála několik dní času.

Nebo například uzávěry (closures), hlavní vlákno (main thread), generika a další témata. Protože jsem jim v počáteční fázi učení do hloubky neporozuměl, když jsem na ně znovu narazil při skutečném vývoji, musel jsem vynaložit energii na jejich opětovné naučení.

Proto jsou mé návrhy následující:

**1. Doplňte si základní znalosti**

V Číně se říká: „Každý začátek je těžký“. Pro úplné začátečníky jsou některé body při prvním setkání se Swiftem často těžko pochopitelné. Není to proto, že by samotný bod byl složitý, ale proto, že pod touto pyramidou znalostí jsou ještě základnější věci, které jste se neučili nebo o nich nevíte.

V takovém případě byste se měli zeptat AI jako [ChatGPT](https://chatgpt.com/) a [Claude](https://claude.ai/?redirect=claude.com) a doplnit si základy.

**2. Snažte se pochopit každý bod**

V procesu učení byste se měli snažit pochopit každou věc, i kdyby to mělo trvat několik dní.

Pokud se rozhodnete přeskočit obsah, kterému nerozumíte, narazíte na něj v pozdějším vývoji, což zbrzdí váš postup a nakonec budete muset znovu investovat čas do učení. Místo látání děr až když je pozdě, je lepší si věci ujasnit už ve fázi učení.

Každá znalost je v podstatě nástroj – čím více nástrojů ovládáte, tím silnější je vaše schopnost řešit problémy.

Je to jako stavba domu. Pokud máte v ruce pouze jeden nástroj, sice s ním možná stěží zvládnete většinu práce, ale při požadavcích na vyšší kvalitu budete bezmocní. Ovládnutí více nástrojů vám umožní postavit pevnější dům.

**3. Udržujte neustálé učení**

Učení vyžaduje vytrvalost. Málokdo je opravdu ochoten věnovat několik měsíců serióznímu studiu nějakého kurzu. Neustálé investování času do učení je důležitější než krátkodobá vysoká intenzita.

I když každý den splníte jen jedno procento, za sto dní můžete splnit celý cíl učení.

## Vzdělávací vize

Tento kurz nebude vyučovat příliš mnoho znalostí Swiftu a SwiftUI, ale spíše přivede začátečníky na cestu programování ve Swiftu. Je to jako stavebnice – návod vysvětluje metody spojování a zbytek času je na vás, abyste si postavili vlastní výtvory.

Projekt je open-source na [GitHubu](https://github.com/fangjunyu1/SwiftSlim) a lze jej zdarma stáhnout a používat. K dispozici je také verze v App Store pro vyzkoušení.

Doufáme, že pomůžeme více lidem bez technického zázemí, kteří však touží po změně kariérní dráhy, získat nové možnosti prostřednictvím výuky programování a vývoje aplikací.

## Aktualizace obsahu

Tento návod je napsán na základě aktuálních verzí Swiftu a SwiftUI.

S aktualizacemi platforem a nástrojů Apple se mohou některá API změnit. Pokud narazíte na problém nebo obsah vyžadující aktualizaci, nahlédněte do oficiální dokumentace nebo na nejnovější verzi v open-source repozitáři.

---
Fang Junyu

14. 02. 2026