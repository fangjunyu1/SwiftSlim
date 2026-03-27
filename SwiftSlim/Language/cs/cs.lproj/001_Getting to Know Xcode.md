# Seznámení s Xcode

## Co je to Xcode

Xcode je oficiální integrované vývojové prostředí (IDE, Integrated Development Environment) od společnosti Apple, které slouží k vývoji aplikací pro platformy Apple, jako jsou iOS, macOS, watchOS a tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Během celého výukového procesu budeme používat Xcode k psaní kódu a spouštění programů.

V této lekci se naučíme, jak stáhnout Xcode, jak vytvořit první aplikaci pro iOS a jak se základně zorientovat ve struktuře rozhraní Xcode.

## Stažení Xcode

Xcode má v současnosti dva způsoby instalace:

1. Stažení přes [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2. Stažení z [oficiálních stránek Apple Developer](https://developer.apple.com/xcode/)

Oběma způsoby lze Xcode stáhnout. Rozdíl je v tom, že na oficiálních stránkách Apple Developer si kromě stabilní verze můžete stáhnout i [Beta](https://developer.apple.com/download/all/?q=Xcode) verzi nebo starší verze.

Pokud se vývoj teprve učíte, doporučujeme používat stabilní verzi. Beta verze slouží hlavně k testování nových funkcí a může být nestabilní.

## Vytvoření prvního projektu

Po spuštění Xcode uvidíte úvodní obrazovku.

![Swift](../../RESOURCE/001_xcode1.png)

Levá strana obsahuje tři běžné možnosti:

- Create New Project —— Vytvořit nový projekt  
- Clone Git Repository —— Klonovat repozitář Git  
- Open Existing Project —— Otevřít existující projekt

Pravá strana zobrazuje nedávno otevřené projekty v Xcode.

Zvolíme možnost „Create New Project“.

### Výběr šablony projektu

![Swift](../../RESOURCE/001_xcode2.png)

Vstoupíte do rozhraní pro výběr šablony projektu, kde se zobrazuje několik platforem (iOS, macOS atd.) a různé typy šablon projektů.

Popis běžných šablon:
- App —— Nejzákladnější typ aplikace (doporučeno)
- Document App —— Aplikace založená na dokumentech
- Game —— Pro vývoj her
- Framework —— Znovupoužitelný modul

V začátečnické fázi budeme volit pouze šablonu „iOS“ - „App“, protože se jedná o typ aplikace s uživatelským rozhraním.

Klikněte na „Next“.

### Vyplnění informací o projektu

Dostanete se do rozhraní pro vyplnění informací o projektu, kde musíme vyplnit údaje podle jednotlivých polí.

![Swift](../../RESOURCE/001_xcode3.png)

Význam jednotlivých polí:

- Product Name —— Název projektu, např.: SwiftSlimTest
- Team —— Vývojářský tým, pokud nemáte placený účet Apple Developer, nemusíte vybírat nic
- Organization Identifier —— Identifikátor organizace, obvykle ve formátu reverzní domény, např.:
  - com.vasejmeno
  - com.vasespolecnost
  - Pokud nemáte doménu, můžete jako identifikátor použít své jméno bez diakritiky
- Bundle Identifier —— Unikátní identifikátor aplikace, který se automaticky vygeneruje na základě Organization Identifier a Product Name
- Interface —— Technologie rozhraní, zvolte SwiftUI
- Language —— Programovací jazyk, zvolte Swift
- Testing System —— Ve výchozím nastavení vytvoří testovací cíl (Unit Tests), pro začátečníky ignorujte
- Storage —— Framework pro perzistenci lokálních dat, může automaticky integrovat SwiftData nebo Core Data, pro začátečníky ignorujte

Po vyplnění klikněte na „Next“.

### Uložení projektu

![Swift](../../RESOURCE/001_xcode4.png)

Vyberte vhodnou složku pro uložení.

Klikněte na tlačítko „Create“ a Xcode automaticky vygeneruje strukturu projektu.

## Struktura projektu v Xcode

Po uložení projektu v Xcode uvidíte vygenerovanou složku projektu ve Finderu.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— Složka pro ukládání obrázků, ikon aplikace a dalších prostředků

- ContentView.swift —— Výchozí vygenerovaný soubor s pohledem SwiftUI, do kterého budeme později psát kód uživatelského rozhraní.

- SwiftSlimTestApp.swift —— Vstupní soubor aplikace (App Entry Point), který má na starosti spuštění aplikace; zatím se jím nemusíme zabývat.

- SwiftSlimTest.xcodeproj —— Soubor projektu Xcode, dvojitým kliknutím na tento soubor projekt otevřete.

## Seznámení s rozhraním Xcode

Dvojitým kliknutím na soubor .xcodeproj otevřete projekt a v levé oblasti Navigator vyberte soubor ContentView.swift.

Rozhraní Xcode se skládá převážně z pěti oblastí:

- Navigator —— Navigační oblast, slouží k prohlížení struktury souborů a vyhledávání
- Editor —— Oblast editoru, slouží k psaní kódu Swift nebo SwiftUI
- Canvas —— Oblast plátna, slouží k náhledům SwiftUI
- Inspector —— Oblast inspektoru, slouží k prohlížení a úpravě vlastností souborů
- Debug Area —— Oblast ladění, pro zobrazení výstupu protokolů (logů)

![Swift](../../RESOURCE/001_xcode6.png)

Poznámka: Canvas primárně slouží k náhledu pohledů SwiftUI; z hlediska oficiální architektury Xcode jde o pomocný panel náhledu (Preview Pane) editoru. Canvas lze aktivovat pouze při otevření souboru pohledu SwiftUI, u jiných typů souborů se funkce náhledu nezobrazí.

V následujících lekcích budeme psát kód Swift a SwiftUI převážně v oblasti Editoru.

Při prvním otevření projektu v Xcode mohou být oblasti Inspector a Debug Area ve výchozím nastavení skryté; můžete je zobrazit kliknutím na tlačítka v pravém horním a pravém dolním rohu.

![Swift](../../RESOURCE/001_xcode7.png)

Tip: Oblast Inspector se primárně používá k prohlížení a úpravě vlastností souborů. V reálném vývoji se tato oblast obvykle skrývá, aby se získal větší prostor pro úpravy.

## Shrnutí

V této lekci jsme se naučili, jak stáhnout Xcode, jak vytvořit první projekt v Xcode a základní rozložení rozhraní Xcode.

Nyní je čas na volnou aktivitu:
- Můžete si zkusit vytvořit a smazat soubory v oblasti Navigator.  
- Prohlédněte si kód v oblasti Editoru a sledujte strukturu kódu.
- Prozkoumejte tlačítka v oblasti Canvas a zkuste si přiblížit nebo oddálit zobrazení náhledu.

V příští lekci začneme psát nějaký jednoduchý kód a to nám pomůže Xcode ještě lépe poznat.
