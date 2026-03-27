# Začínáme s ContentView

## Příprava na lekci

V této lekci začneme se souborem ContentView.swift a systematicky se seznámíme se základní strukturou SwiftUI, včetně:

- Komentáře
- Struktura View (Pohledu)
- Rozvržení VStack / HStack / ZStack
- Ikony SF Symbols
- Modifikátory pohledu (modifier)
- Kód náhledu #Preview

Nejprve najděte dříve vytvořený projekt Xcode a dvakrát klikněte na soubor .xcodeproj.

V levém navigačním panelu Navigator vyberte soubor ContentView.swift.

Poznámka: Při každém otevření projektu se na plátně (Canvas) může zobrazit "Preview paused" (Náhled pozastaven). Pro obnovení náhledu klikněte na tlačítko obnovení.

![Swift](../../RESOURCE/002_view7.png)

## Seznámení s ContentView

Kód ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Ačkoli je kódu poměrně málo, obsahuje základní strukturu SwiftUI.

### 1. Komentáře

Horní část souboru:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Toto je komentář souboru, který se používá k zaznamenání informací o souboru, včetně názvu souboru, názvu projektu, autora a času vytvoření.

Ve Swiftu se pro jednořádkové komentáře používá //:

```swift
// Toto je komentář
```

Komentáře mohou zlepšit čitelnost kódu a pomoci vývojářům pochopit logiku kódu.

Při skutečném vývoji může být kód nesrozumitelný a těžko pochopitelný. Pokud nebudete psát komentáře, můžete se po třech dnech dostat do situace, kdy vlastnímu kódu nebudete rozumět.

Proto je aktivní přidávání komentářů během psaní kódu dobrým vývojářským zvykem. Používejte komentáře k zaznamenání logiky kódu, což usnadní jeho budoucí údržbu.

**Dočasné skrytí kódu**

Komentáře mohou také dočasně skrýt (deaktivovat) kód, což nám pomáhá při řešení problémů.

Například:

```
A
B
C
```

A, B a C jsou tři bloky kódu. V jednom z nich je chyba, takže můžeme kód dočasně zakomentovat, abychom problém našli.

Nejprve přidáme komentář k A:

```
// A
B
C
```

Pokud se po zakomentování A kód vrátí do normálu, znamená to, že je problém v kódu A.

Pokud problém přetrvává i po zakomentování A, můžeme zakomentovat B a tak dále, dokud nenajdeme chybný kód.

Během vývoje se setkáte s mnoha problémy a většinu z nich budeme muset vyřešit pomocí zakomentování kódu, abychom zjistili příčinu, lokalizovali problematický kód a našli BUG.

V Xcode můžete použít klávesovou zkratku:

```
Command ⌘ + /
```

pro rychlé přidání nebo odstranění komentářů.

### 2. Importování frameworku SwiftUI

```swift
import SwiftUI
```

Tento kód znamená importování frameworku SwiftUI.

Typy jako View, Text, Image, VStack atd. v SwiftUI pocházejí z tohoto frameworku.

Pokud framework SwiftUI neimportujete, Xcode nahlásí chybu:

```
Cannot find type 'View' in scope
```

To znamená, že kompilátor nedokáže rozpoznat typ View.

### 3. Struktura View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Při prvním setkání s touto strukturou View se můžete cítit zmateně, protože obsahuje klíčová slova jako struct, View, var, body, some atd.

Tato klíčová slova jsme se ještě neučili. Stačí vědět, že tento kód znamená vytvoření pohledu (View) s názvem ContentView.

View si můžete představit jako kreslicí plátno, na které můžeme malovat, přičemž nástrojem pro malování je SwiftUI.

Například:

![Swift](../../RESOURCE/002_view.png)

Výše uvedený obrázek ukazuje tři stránky, což jsou ve skutečnosti tři Views.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Když vyvíjíme aplikace pomocí SwiftUI, každá stránka je jedním View.

### 4. Kód SwiftUI

Uvnitř pohledu View se nachází kód SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tento kód SwiftUI znamená, že se jedná o vertikální rozvržení (layout), které zobrazuje ikonu a text.

![Swift](../../RESOURCE/002_view1.png)

#### Rozvržení VStack

```swift
VStack { }  // Vertikální rozvržení
```

VStack představuje kontejner pro vertikální rozvržení. Vnitřní pohledy jsou seřazeny shora dolů.

![Swift](../../RESOURCE/002_view8.png)

Ve SwiftUI jsou běžná tři rozvržení:

- VStack —— Vertikální uspořádání
- HStack —— Horizontální uspořádání
- ZStack —— Vrstvené uspořádání (osa Z)

```swift
HStack { }  // Horizontální uspořádání
ZStack { }  // Vrstvené uspořádání
```

Schéma uspořádání jednotlivých rozvržení:

![Swift](../../RESOURCE/002_view2.png)

Například: Použití HStack pro horizontální uspořádání.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Můžete vidět, že ikona zeměkoule a text jsou zobrazeny horizontálně.

![Swift](../../RESOURCE/002_view3.png)

Pokud chceme horizontální uspořádání, použijeme HStack. Pokud potřebujeme vrstvení, použijeme ZStack.

#### Image a SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Tento kód zobrazuje ikonu zeměkoule. Ikona zeměkoule pochází ze systému ikon SF Symbols od společnosti Apple.

![Swift](../../RESOURCE/002_view9.png)

Význam kódu je zobrazení ikony zeměkoule, velké velikosti, v barvě zdůraznění.

Kromě ikony zeměkoule můžeme zobrazit i další ikony.

Například zobrazení batohu:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Jak zobrazit další ikony?**

Musíme použít oficiální knihovnu systémových ikon od Applu, SF Symbols.

Otevřete oficiální webové stránky Apple Developer a stáhněte si [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Otevřete aplikaci SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

Na levé straně je klasifikace symbolů a na pravé straně jsou příslušné ikony.

Klikněte pravým tlačítkem na ikonu a vyberte "Kopírovat 1 název", název je příslušný textový řetězec.

Například:

```
"globe"
"backpack"
"heart"
```

Vložte zkopírovaný název ikony do Image(systemName:) a zobrazí se příslušná ikona.

Poznámka: Každá ikona SF Symbols má minimální podporovanou verzi systému. Pokud je verze systému příliš stará, ikona se nemusí zobrazit. Informace o kompatibilitě je třeba zkontrolovat v aplikaci SF Symbols.

#### Modifikátory (Modifiers)

Ve SwiftUI je modifikátor (modifier) metoda používaná ke změně vzhledu nebo chování pohledu.

Modifikátory si můžete představit jako oblečení; různé oblečení vede k různému vzhledu.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale a foregroundStyle jsou modifikátory pohledu Image. Modifikují pohled Image, aniž by změnily samotný obsah Image.

**1. imageScale**

```swift
.imageScale(.large)
```

Může ovládat velikost ikon SF Symbols:

- .small
- .medium
- .large

![Swift](../../RESOURCE/002_view11.png)

Změnou různých možností můžeme symbolům SF Symbols nastavit různé velikosti.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle umožňuje ovládat barvu popředí.

.tint představuje zdůrazňující barvu (accent color) aktuálního prostředí, ve výchozím nastavení je na iOS modrá.

Pokud chceme změnit barvu popředí na červenou:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Pohled Text

Text je textový pohled, který se používá k zobrazení řetězců.

```swift
Text("Hello, world!")
```

Například zobrazení mého jména:

```swift
Text("FangJunyu")
```

Poznámka: Řetězce musí být uzavřeny v dvojitých uvozovkách "".

Můžete zkusit zobrazit své jméno, telefonní číslo a další údaje.

#### Odsazení padding

Ve SwiftUI se padding používá k přidání prázdného prostoru mezi obsahem pohledu a jeho okraji. Patří do kategorie "vnitřního odsazení (padding / content inset)".

```swift
HStack {
    ...
}
.padding()
```

Výše uvedený kód znamená přidání výchozího systémového odsazení k pohledu HStack.

**Co je to padding?**

Padding představuje "prázdný prostor mezi obsahem pohledu a jeho okraji".

Na obrázku níže, po nastavení paddingu u modrého HStack, se modrá oblast smrští dovnitř a bude vypadat "o něco menší".

![Swift](../../RESOURCE/002_view6.png)

**Výchozí odsazení**

Modifikátor padding() standardně používá doporučené standardní mezery systému.

```swift
.padding()
```

Tato hodnota se může lišit na různých platformách a v různých kontextech, například:

- Na iOS je to obvykle kolem 16 pt.
- Na macOS nebo watchOS se standardní mezery systému mohou lišit, obvykle jsou větší nebo menší v závislosti na specifikacích designu jednotlivých platforem.

**Vlastní odsazení**

K pohledu lze také nastavit individuální odsazení.

1. Nastavení pro jeden směr

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Vysvětlení směrů:

- .top: horní odsazení
- .bottom: spodní odsazení
- .leading: odsazení přední strany (vlevo)
- .trailing: odsazení zadní strany (vpravo)

![Swift](../../RESOURCE/002_view12.png)

Poznámka: leading a trailing se automaticky přizpůsobí podle směru jazyka. Například v arabštině (prostředí RTL) se automaticky převrátí.

2. Nastavení pro více směrů

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Prostřednictvím pole můžete určit více směrů současně. Konkrétní použití polí bude podrobněji vysvětleno v následujících lekcích, zde stačí tomuto zápisu pouze porozumět.

3. Nastavení pro horizontální nebo vertikální směr

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Což je ekvivalentní s:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Odstranění odsazení**

Pokud nechcete žádné odsazení, můžete jej odstranit pomocí .padding(0):

```swift
.padding(0)
```

Nebo jednoduše smazat modifikátor padding:

```swift
// .padding()
```

### 6. Kód náhledu Preview

```swift
#Preview {
    ContentView()
}
```

Tento kód znamená generování náhledu pohledu ContentView na plátně (Canvas).

Poznámka: #Preview je nová syntaxe zavedená ve Swift 5.9 / Xcode 15. Předtím se používala struktura PreviewProvider.

**Co se stane, když zakomentujeme Preview?**

Pokud zakomentujete Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Na plátně (Canvas) se již nebude zobrazovat obsah k vykreslení.

![Swift](../../RESOURCE/002_xcode.png)

#Preview totiž ovládá zobrazení náhledového pohledu na plátně.

Pokud potřebujeme zobrazit náhled pohledu SwiftUI v Xcode, přidáme kód náhledu #Preview. Pokud náhled pohledu nepotřebujeme, můžeme kód náhledu #Preview zakomentovat nebo smazat.

## Shrnutí

Ačkoliv soubor ContentView.swift neobsahuje mnoho kódu, ve skutečnosti pokrývá několik základních konceptů SwiftUI. Pro začátečníka může tento kód působit cize, ale rozebráním struktury kódu si můžete vybudovat prvotní představu o SwiftUI.

Při zpětném pohledu na obsah této lekce jsme se nejprve seznámili s komentáři //, které můžeme použít k vysvětlení logiky kódu nebo k dočasnému skrytí kódu.

Dále jsme se dozvěděli, že soubory SwiftUI musí importovat framework SwiftUI:

```swift
import SwiftUI
```

Pokud framework neimportujete, kompilátor nedokáže rozpoznat typy jako View.

Následně jsme se seznámili se základní strukturou pohledu SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Kde ContentView je název pohledu.

Také jsme se naučili tři běžné kontejnery pro rozvržení: VStack (vertikální uspořádání), HStack (horizontální uspořádání) a ZStack (vrstvené uspořádání).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Tento kód znamená zobrazení vertikálně uspořádaného kontejneru, uvnitř kterého se zobrazuje ikona a text.

Image dokáže zobrazit ikony SF Symbols a pomocí modifikátorů lze ovládat velikost a barvu ikony.

Pohled Text může zobrazit textový obsah.

padding je odsazení, které přidává průhledný prostor kolem pohledu.

Nakonec náhledový pohled #Preview, který umožňuje zobrazit náhled pohledu na plátně.

### Cvičení po lekci

Pro začátečníky může být obsah této lekce trochu složitější. Můžeme si však prohloubit porozumění znalostem získaným v této lekci prostřednictvím dalších cvičení:

- Změňte název ikony SF Symbols.
- Změňte barvu popředí ikony na černou.
- Změňte VStack na HStack.
- Zakomentujte Image nebo Text a pozorujte změny v náhledu.

### Bonus: Automatické doplňování kódu (Code Completion)

Při zadávání kódu jste si možná jako pozorní posluchači všimli, že Xcode automaticky zobrazuje seznam dostupných možností.

Například když upravujeme modifikátor imageScale:

```swift
.imageScale(.)
```

Xcode zobrazí dostupné možnosti:

![Swift](../../RESOURCE/002_view10.png)

To spadá pod mechanismus automatického doplňování kódu (Code Completion), který je založen na odvozování typů a nápovědách pro členy výčtů (enum), čímž se zvyšuje efektivita psaní a snižuje počet chyb.

V dalších lekcích si oficiálně představíme výčty (enum), prozatím postačí toto stručné seznámení.
