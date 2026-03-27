# Zoznámme sa s Xcode

## Čo je Xcode

Xcode je integrované vývojové prostredie (IDE, Integrated Development Environment), ktoré oficiálne poskytuje spoločnosť Apple a používa sa na vývoj aplikácií pre platformy Apple, ako sú iOS, macOS, watchOS a tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Počas celého tohto kurzu budeme na písanie kódu a spúšťanie programov používať práve Xcode.

V tejto lekcii sa naučíme, ako stiahnuť Xcode, vytvoriť svoju prvú iOS aplikáciu a získať prvotný prehľad o štruktúre rozhrania Xcode.

## Stiahnutie Xcode

Xcode je v súčasnosti možné nainštalovať dvoma spôsobmi:

1. Stiahnuť cez [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Stiahnuť cez [oficiálnu stránku Apple Developer](https://developer.apple.com/xcode/)

Oboma spôsobmi je možné Xcode stiahnuť. Rozdiel je v tom, že na oficiálnej stránke Apple Developer sú okrem stabilnej verzie dostupné aj [Beta](https://developer.apple.com/download/all/?q=Xcode) verzie a historické verzie.

Ak sa len učíte vyvíjať aplikácie, odporúča sa používať stabilnú verziu. Beta verzia sa používa najmä na testovanie nových funkcií a môže byť nestabilná.

## Vytvorenie prvého projektu

Po otvorení Xcode sa zobrazí úvodná obrazovka.

![Swift](../../RESOURCE/001_xcode1.png)

Na ľavej strane sa nachádzajú tri často používané možnosti:

- Create New Project —— vytvoriť nový projekt  
- Clone Git Repository —— klonovať Git repozitár  
- Open Existing Project —— otvoriť existujúci projekt

Na pravej strane sa zobrazujú naposledy otvorené projekty Xcode.

Vyberieme možnosť „Create New Project“.

### Výber šablóny projektu

![Swift](../../RESOURCE/001_xcode2.png)

Otvorí sa obrazovka na výber šablóny projektu, kde sa zobrazujú viaceré platformy (iOS, macOS atď.) a rôzne typy projektových šablón.

Vysvetlenie bežných šablón:
- App —— najzákladnejší typ aplikácie (odporúčané)
- Document App —— aplikácia založená na práci s dokumentmi
- Game —— na vývoj hier
- Framework —— znovupoužiteľný modul

Na začiatku budeme vyberať iba šablónu „iOS“ - „App“, pretože ide o typ aplikácie s používateľským rozhraním.

Kliknite na „Next“.

### Vyplnenie informácií o projekte

Otvorí sa obrazovka na vyplnenie informácií o projekte. Jednotlivé polia treba vyplniť podľa ich významu.

![Swift](../../RESOURCE/001_xcode3.png)

Význam jednotlivých polí:

- Product Name —— názov projektu, napríklad: SwiftSlimTest
- Team —— vývojársky tím; ak nemáte platený účet Apple Developer, môžete toto pole nechať nevybrané
- Organization Identifier —— identifikátor organizácie, zvyčajne vo formáte obrátenej domény, napríklad:
  - com.yourname
  - com.yourcompany
  - ak nemáte doménu, môžete použiť svoje anglické meno ako identifikátor
- Bundle Identifier —— jedinečný identifikátor aplikácie, ktorý sa automaticky vytvorí na základe Organization Identifier a Product Name
- Interface —— technológia používateľského rozhrania, vyberte SwiftUI
- Language —— programovací jazyk, vyberte Swift
- Testing System —— predvolene sa vytvorí testovací cieľ (Unit Tests); v začiatočníckej fáze to môžete ignorovať
- Storage —— rámec na lokálne perzistentné ukladanie dát, ktorý môže automaticky integrovať SwiftData alebo Core Data; v začiatočníckej fáze to môžete ignorovať

Po vyplnení kliknite na „Next“.

### Uloženie projektu

![Swift](../../RESOURCE/001_xcode4.png)

Vyberte vhodný priečinok na uloženie.

Kliknite na tlačidlo „Create“ a Xcode automaticky vygeneruje štruktúru projektu.

## Štruktúra projektu Xcode

Po uložení projektu Xcode môžete vo Finderi vidieť vygenerovaný priečinok projektu.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— priečinok na ukladanie obrázkov, ikon aplikácie a ďalších zdrojov

- ContentView.swift —— predvolene vytvorený súbor SwiftUI zobrazenia; neskôr doň budeme písať kód používateľského rozhrania

- SwiftSlimTestApp.swift —— vstupný súbor aplikácie (App Entry Point), ktorý je zodpovedný za spustenie aplikácie; zatiaľ ho nepotrebujeme detailne poznať

- SwiftSlimTest.xcodeproj —— projektový súbor Xcode; dvojklikom naň projekt otvoríte

## Zoznámme sa s rozhraním Xcode

Dvojklikom otvorte súbor .xcodeproj a v ľavej oblasti Navigator vyberte súbor ContentView.swift.

Rozhranie Xcode sa skladá hlavne z piatich oblastí:

- Navigator —— navigačná oblasť na prezeranie štruktúry súborov a vyhľadávanie
- Editor —— editačná oblasť na písanie kódu Swift alebo SwiftUI
- Canvas —— plátno na náhľad SwiftUI
- Inspector —— oblasť kontroly vlastností na zobrazenie a úpravu vlastností súboru
- Debug Area —— ladiaca oblasť na zobrazenie výstupov a logov

![Swift](../../RESOURCE/001_xcode6.png)

Poznámka: Canvas sa používa najmä na náhľad SwiftUI zobrazení. Z pohľadu oficiálnej architektúry Xcode ide o pomocný panel náhľadu pre Editor (Preview Pane). Canvas je možné zapnúť iba pri otvorení súboru SwiftUI zobrazenia; pri iných typoch súborov sa náhľad nezobrazí.

V ďalších lekciách budeme písať kód Swift a SwiftUI najmä v oblasti Editor.

Pri prvom otvorení projektu Xcode môžu byť oblasti Inspector a Debug Area predvolene skryté. Môžete ich zobraziť kliknutím na tlačidlá vpravo hore a vpravo dole.

![Swift](../../RESOURCE/001_xcode7.png)

Tip: Oblasť Inspector sa používa najmä na zobrazenie a úpravu vlastností súboru. V skutočnom vývoji sa táto oblasť často skrýva, aby zostalo viac miesta na editovanie.

## Zhrnutie

V tejto lekcii sme sa naučili, ako stiahnuť Xcode, vytvoriť svoj prvý projekt v Xcode a pochopiť základné rozloženie rozhrania Xcode.

Teraz nasleduje voľný čas na skúšanie:
- môžete skúsiť vytvárať a mazať súbory v oblasti Navigator,  
- pozrieť si kód v oblasti Editor a sledovať jeho štruktúru,
- pozrieť si tlačidlá v oblasti Canvas a skúsiť zväčšiť alebo zmenšiť náhľad.

V ďalšej lekcii začneme písať jednoduchý kód, ktorý nám pomôže Xcode ešte lepšie spoznať.