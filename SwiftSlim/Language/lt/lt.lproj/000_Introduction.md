# Įžanga

## Kas yra Swift?

Prieš pradėdami mokytis Swift, pirmiausia trumpai susipažinkime su Swift programavimo kalba. Swift yra moderni programavimo kalba, kurią sukūrė Apple ir kuri daugiausia naudojama kurti programas Apple platformoms, tokioms kaip iOS, macOS, iPadOS ir watchOS.

![Swift](../../RESOURCE/000_swift.png)

Palyginti su kitomis programavimo kalbomis, Swift sintaksė yra glaustesnė, labiau pabrėžiamas saugumas ir skaitomumas. Mokytis ir suprasti ją kartu su SwiftUI yra lengviau. Žinoma, anksčiau nesu mokęsis kitų programavimo kalbų, todėl man ji gali atrodyti šiek tiek sunkesnė nei HTML.

Naudojant Swift galima kurti ne tik Apple platformų programas. Swift bendruomenė stengiasi perkelti Swift ir į [Android](https://www.swift.org/blog/nightly-swift-sdk-for-android/) platformą, o taip pat pritaikyti ją veikti [serveriuose](https://github.com/awslabs/swift-aws-lambda-runtime) ir kitose aplinkose. Ilgalaikėje perspektyvoje Swift turi daugiau erdvės augti ir ateityje gali tapti kelių platformų programavimo kalba, panašia į Flutter ar React Native.

## Ko mokysimės

Ši pamoka daugiausia skirta Swift ir SwiftUI pagrindams.

Pradėsime nuo paprastų kintamųjų ir duomenų tipų, naudosime SwiftUI kurdami sąsają, suprasime, kaip duomenys saugomi ir nuskaitomi, o vėliau galbūt pereisime ir prie pažangesnių temų, tokių kaip SwiftData ar iCloud sinchronizacija.

Kiekvienas skyrius bus paremtas realiu pavyzdžiu, kad Swift žinias mokytumėmės praktinio pritaikymo kontekste.

Kai kurios pamokos pirmiausia daug dėmesio skiria didelei kiekių sintaksės ir API aiškinimui, o tik tada pereina prie projektų praktikos. Pradedantiesiems tai panašu į tai, kaip vaikas mokytųsi žodžių iš žodyno: kai nėra jokio taikymo konteksto, didelio kiekio informacijos įsiminimas galiausiai tiesiog atima susidomėjimą.

Šioje pamokoje žinias mokysimės realiose kūrimo situacijose, kai konkretūs poreikiai natūraliai iškelia susijusias sąvokas.

Baigę šią pamoką, galėsite savarankiškai sukurti ir paleisti paprastą programą, įdiegti ją savo iOS / macOS įrenginiuose arba net paskelbti ją App Store.

## Kaip mokytis nuo visiško nulio?

Aš pats pradėjau visiškai nuo nulio. Iš pradžių tiesiog peržiūrėjau kelias [Swift mokomųjų vaizdo įrašų](https://www.youtube.com/watch?v=4SaddkGm5yA&list=PLliocbKHJNwuLHJlVv6q5tKJxJltjBspC&index=3) serijas YouTube ir supratau, kad iOS programų kūrimas nėra toks sudėtingas, todėl tai mane sudomino. Vėliau pradėjau bandyti mokytis daugiau Swift žinių. Pavyzdžiui, išbandžiau programavimo žaidimus [Swift Playgrounds](https://apps.apple.com/cn/app/swift-playgrounds/id1496833156?mt=12), skaičiau [oficialią Swift dokumentaciją](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) ir mokiausi pagal [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui).

Dabar atrodo, kad būtent [100 Days Of SwiftUI](https://www.hackingwithswift.com/100/swiftui) suteikė mokymosi struktūrą, leidusią sistemingai mokytis SwiftUI. Tačiau kadangi pamoka buvo anglų kalba, o mano programavimo pagrindai buvo silpni, supratimo procese kilo labai daug sunkumų. Todėl naudojau tokias AI priemones kaip [ChatGPT](https://chatgpt.com/) ir [Claude](https://claude.ai/?redirect=claude.com), kad lengviau suprasčiau atskiras sąvokas.

Mokantis neišvengiamai atsiranda žinių, kurias suprasti sunkiau. Pavyzdžiui, prisimenu, kad mokydamasis UserDefaults žinojau tik kaip išsaugoti duomenis, bet nesupratau, kad juos reikia rankiniu būdu perskaityti, todėl net pradėjau įtarti, jog mano kode yra klaida. Nors tai buvo paprasta sąvoka, ji man kainavo kelias dienas laiko.

Panašiai ir su tokiomis sąvokomis kaip closures, pagrindinė gija ar generics: ankstyvame etape jų iki galo nesupratau, o kai realiame kūrime vėl jas sutikdavau, tekdavo iš naujo skirti laiko mokymuisi.

Todėl mano patarimai yra tokie:

**1. Pildykite pagrindines žinias**

Kinijoje yra posakis: „Visų dalykų pradžia sunki“. Žmonėms, kurie mokosi Swift nuo nulio, mokymosi procese neišvengiamai pasitaiko sunkiai suprantamų žinių taškų. Dažniausiai taip yra ne todėl, kad pati sąvoka labai sudėtinga, o todėl, kad šios žinių piramidės apačioje dar yra bazinių sąvokų, su kuriomis pradedantieji dar nebuvo susidūrę.

Tokiais atvejais verta pasitelkti [ChatGPT](https://chatgpt.com/) ir [Claude](https://claude.ai/?redirect=claude.com) ar kitus AI įrankius, kad laiku užpildytumėte trūkstamas pagrindines žinias.

**2. Stenkitės suprasti kiekvieną žinių tašką**

Mokymosi procese svarbiausia yra kiek įmanoma suprasti kiekvieną sąvoką, net jei tam reikia kelių dienų.

Jei nuspręsite praleisti nesuprastą vietą, vėliau kūrimo procese su ja greičiausiai vėl susidursite, ji trukdys progresui ir vis tiek teks iš naujo skirti laiko mokymuisi. Užuot taisius spragas vėliau, geriau mokymosi etape viską aiškiai suprasti.

Kiekviena žinių sąvoka iš esmės yra įrankis. Kuo daugiau įrankių turite, tuo stipresnis jūsų gebėjimas spręsti problemas.

Tai panašu į namo statymą: jei rankose turite tik vieną įrankį, daugumą darbų galbūt dar įmanoma atlikti, bet susidūrus su aukštesniais kokybės reikalavimais jo nebeužteks. Tik įvaldę daugiau įrankių, galėsite pastatyti tvirtesnį namą.

**3. Mokykitės nuosekliai**

Mokymuisi reikia ilgalaikio pastovumo. Nedaug žmonių iš tikrųjų nori skirti kelis mėnesius tam, kad rimtai pereitų visą vieną kursą. Nuolatinis laiko investavimas yra svarbiau nei trumpalaikis intensyvus krūvis.

Net jei kasdien atliksite tik vieną procentą, per šimtą dienų vis tiek pasieksite visą mokymosi tikslą.

## Edukacinė vizija

Šis kursas nesiekia perduoti pernelyg daug Swift ir SwiftUI žinių vienu metu, o veikiau nori įvesti pradedančiuosius į Swift programavimo kelią. Tai panašu į kaladėlių dėliojimą: pamoka paaiškina, kaip jungti dalis, o likęs laikas yra jūsų pačių kūrybai, dėliojant savas kaladėles.

Projektas yra atvirojo kodo ir paskelbtas [GitHub](https://github.com/fangjunyu1/SwiftSlim), todėl jį galima nemokamai atsisiųsti ir naudoti. Taip pat pateikiama ir App Store versija išbandymui.

Tikimės padėti daugiau žmonių, neturinčių technologinio pagrindo, bet norinčių pakeisti savo karjeros kryptį, kad mokydamiesi programavimo ir kurdami programas jie įgytų naujų galimybių.

## Turinys atnaujinamas

Ši pamoka parašyta remiantis dabartinėmis Swift ir SwiftUI versijomis.

Atnaujinant Apple platformas ir įrankius, dalis API gali pasikeisti. Jei pastebėsite problemų arba reikės atnaujinti turinį, galite remtis naujausia oficialios dokumentacijos ar atvirojo kodo saugyklos versija.

---
方君宇

2026-02-14  
