# Uvod

## Što je Swift?

Prije nego što počnemo učiti Swift, ukratko upoznajmo programski jezik Swift. Swift je moderan programski jezik koji je razvio Apple i koristi se uglavnom za izradu aplikacija na Apple platformama kao što su iOS, macOS, iPadOS i watchOS.

![Swift](../../RESOURCE/000_swift.png)

U usporedbi s drugim programskim jezicima, Swift ima sažetiju sintaksu te više naglašava sigurnost i čitljivost. U kombinaciji sa SwiftUI-jem lakše ga je učiti i razumjeti. Naravno, ja prije toga nisam učio druge programske jezike, pa mi se činio tek malo težim od HTML-a.

Swift se ne može koristiti samo za razvoj aplikacija na Apple platformama. Swift zajednica ulaže trud da Swift prenese i na [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) platformu, pa čak i da se izvršava na [poslužiteljima](https://github.com/awslabs/swift-aws-lambda-runtime) i u drugim okruženjima. Dugoročno gledano, Swift ima više prostora za razvoj i u budućnosti bi mogao postati višeplatformski programski jezik sličan Flutteru i React Nativeu.

## Sadržaj učenja

Ovaj je vodič usmjeren uglavnom na osnove Swifta i SwiftUI-ja.

Počet ćemo s jednostavnim varijablama i tipovima podataka, koristiti SwiftUI za izradu sučelja, razumjeti kako se podaci pohranjuju i čitaju, a na kraju možda ćemo dublje ući i u naprednije teme poput SwiftData i iCloud sinkronizacije.

Svako će poglavlje biti organizirano oko stvarnog primjera, tako da se Swift uči kroz praktičnu primjenu.

Neki tutorijali najprije usmjere puno vremena na objašnjavanje sintakse i API-ja, a tek potom prelaze na projekt. Početnicima je to kao da dijete uči riječi iz rječnika: bez stvarne primjene pamćenje velike količine sadržaja na kraju samo dovede do gubitka interesa.

Ovaj će vodič učiti znanje kroz stvarne razvojne scenarije, gdje potrebe prirodno uvode povezane koncepte.

Nakon završetka ovog vodiča moći ćete samostalno razviti i pokrenuti osnovnu aplikaciju, instalirati je na vlastiti iOS / macOS uređaj, a također i objaviti je na App Storeu.

## Kako učiti bez predznanja?

I ja sam u početku bio potpuni početnik. U početku sam samo pogledao nekoliko [Swift video lekcija](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) na YouTubeu i otkrio da razvoj iOS aplikacija nije toliko kompliciran, što je u meni probudilo zanimanje. Nakon toga počeo sam pokušavati učiti više Swift znanja. Primjerice, isprobao sam igre programiranja u [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), čitao [službenu Swift dokumentaciju](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) i učio kroz [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Gledajući unatrag, upravo je [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) ponudio okvir za učenje koji mi je omogućio sustavno učenje SwiftUI-ja. Međutim, zato što je vodič na engleskom i zato što nisam imao programersku osnovu, u procesu razumijevanja bilo je mnogo poteškoća. Zbog toga sam koristio AI alate poput [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) kako bih lakše razumio pojedine koncepte.

Tijekom učenja neizbježno se pojavljuju teme koje je teže razumjeti. Sjećam se da sam, dok sam učio UserDefaults, znao samo kako spremiti podatke, ali nisam znao da ih treba ručno učitati, pa sam čak sumnjao da moj kod ima problem. Čak mi je i tako jednostavna stvar oduzela nekoliko dana.

Na primjer, teme poput closures, glavne niti i generika, u ranoj fazi učenja nisam mogao dovoljno duboko razumjeti. Kad sam kasnije u stvarnom razvoju ponovno naišao na te pojmove, morao sam opet uložiti dodatno vrijeme da ih učim ispočetka.

Zato je moj savjet sljedeći:

**1. Nadopunite temeljno znanje**

U Kini postoji izreka: “Sve je teško na početku.” Za potpune početnike u Swiftu u procesu učenja neizbježno se pojavljuju koncepti koje je teško razumjeti. To često nije zato što su sami koncepti toliko složeni, nego zato što na dnu piramide znanja postoje još temeljitije ideje s kojima se početnik još nije susreo.

Kad se to dogodi, možete razmisliti o tome da uz pomoć AI alata kao što su [ChatGPT](https://chatgpt.com/) i [Claude](https://claude.ai/?redirect=claude.com) pravovremeno nadopunite propušteno osnovno znanje.

**2. Potrudite se razumjeti svaku točku znanja**

Tijekom učenja najvažnije je pokušati razumjeti svaku točku znanja, čak i ako vam za to treba nekoliko dana.

Ako odlučite preskočiti ono što ne razumijete, vrlo je vjerojatno da ćete se s tim ponovno susresti u kasnijem razvoju i to će vas opet usporiti, pa ćete na kraju ipak morati ponovno uložiti vrijeme da to naučite. Umjesto da problem popravljate kasnije, bolje je u fazi učenja znanje odmah razjasniti.

Svaka je točka znanja u suštini alat. Što više alata ovladate, to je jača vaša sposobnost rješavanja problema.

To je poput gradnje kuće: ako imate samo jedan alat, možda ćete jedva moći završiti većinu poslova, ali kad se suočite s višim zahtjevima kvalitete, osjećat ćete se ograničeno. Tek s više alata možete sagraditi stabilniju kuću.

**3. Održavajte kontinuitet u učenju**

Učenje zahtijeva dugoročnu ustrajnost. Malo je ljudi koji su zaista spremni odvojiti nekoliko mjeseci da ozbiljno prouče jedan vodič. Kontinuirano ulaganje vremena važnije je od kratkoročnog intenziteta.

Čak i ako svaki dan završite samo jedan posto, za sto dana možete dovršiti cijeli cilj učenja.

## Obrazovna vizija

Ovaj tečaj neće podučavati previše Swift i SwiftUI znanja odjednom, nego će početnike uvesti na put programiranja sa Swiftom. To je poput slaganja kockica: vodič objašnjava kako se spajaju, a ostatak vremena vi sami slažete svoje vlastite konstrukcije.

Projekt je otvorenog koda na [GitHubu](https://github.com/fangjunyu1/SwiftSlim) i može se besplatno preuzeti i koristiti. Dostupna je i App Store verzija za isprobavanje.

Nadamo se pomoći većem broju ljudi bez tehničke pozadine, ali s velikom željom da promijene svoj profesionalni put, da kroz učenje programiranja i razvoj aplikacija dobiju nove mogućnosti.

## Ažuriranja sadržaja

Ovaj je vodič napisan na temelju trenutnih verzija Swifta i SwiftUI-ja.

Kako se Apple platforme i alati ažuriraju, neki API-ji mogu se promijeniti. Ako primijetite problem ili sadržaj treba ažurirati, možete pogledati službenu dokumentaciju ili najnoviju verziju u repozitoriju otvorenog koda.

---
方君宇

2026-02-14  
