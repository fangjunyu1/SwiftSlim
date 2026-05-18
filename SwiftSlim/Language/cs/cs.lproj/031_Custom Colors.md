# Vlastní barvy

V této lekci se naučíme, jak ve SwiftUI definovat vlastní barvy.

V předchozích lekcích jsme už používali výchozí barvy, které SwiftUI poskytuje, například:

```swift
Color.blue
Color.red
Color.green
```

Tyto barvy se používají velmi pohodlně, ale při vývoji skutečné aplikace výchozí barvy obvykle nejsou dostatečně přesné.

Například v návrhu se mohou objevit takové barvy:

```text
#2c54c2
#4875ed
#213e8d
```

Tento typ barvy se nazývá Hex barva.

V této lekci nejprve přidáme do SwiftUI podporu pro Hex barvy a potom pomocí `static` uspořádáme často používané barvy.

Nakonec vlastní barvy použijeme ve zobrazení encyklopedie zvířat a dále použijeme přechodové pozadí, aby tlačítka působila vrstveněji.

## Proč potřebujeme vlastní barvy?

Ve SwiftUI můžeme přímo používat systémové barvy.

Například:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Zde `.blue` znamená modrou barvu a ve skutečnosti jde o zkrácený zápis `Color.blue`.

Výhodou výchozích barev je jednoduchost a pohodlné používání, ale výběr barev je poměrně omezený.

Například:

```swift
Color.blue
```

Může vyjádřit pouze výchozí modrou barvu poskytovanou SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Ve skutečném vývoji však často potřebujeme konkrétnější barvy.

Například i u modré barvy může existovat světle modrá, tmavě modrá, šedomodrá, jasně modrá a další různé efekty.

![More Blue](../../../Resource/031_color5.png)

V takové situaci je velmi obtížné obnovit návrhový efekt pouze pomocí `Color.blue`.

Proto potřebujeme, aby SwiftUI podporovalo vlastní barvy.

## Co je Hex barva?

Barvy na obrazovce jsou obvykle složené ze tří kanálů: červeného, zeleného a modrého, tedy RGB.

RGB označuje:

```text
Red     // Červená
Green   // Zelená
Blue    // Modrá
```

Hex barva je jeden ze způsobů zápisu RGB barvy.

Například:

```swift
#5479FF
```

Tuto hodnotu barvy můžeme zjednodušeně chápat jako tři části:

```text
54  // Označuje červený kanál
79  // Označuje zelený kanál
FF  // Označuje modrý kanál
```

V této lekci nemusíme tyto hodnoty počítat ani do hloubky chápat pravidla šestnáctkové soustavy.

Teď stačí vědět, že `#5479FF` představuje konkrétní barvu.

Až později uvidíme zápis jako `#2c54c2` nebo `#4875ed`, můžeme ho nejprve chápat jako hodnotu barvy.

V návrhářských nástrojích, jako jsou Sketch, Figma nebo Photoshop, se podobné hodnoty barev objevují také velmi často.

![color](../../../Resource/031_color.png)

SwiftUI však ve výchozím stavu neumožňuje psát přímo toto:

```swift
Color(hex: "#5479FF")
```

Proto musíme sami rozšířit typ `Color`, aby podporoval vytváření barev pomocí Hex řetězce.

## Vytvoření souboru Color+Hex.swift

Nejprve vytvoříme nový soubor Swift.

Název souboru může být:

```text
Color.swift
```

Může být také jasnější:

```text
Color+Hex.swift
```

Zde se více doporučuje použít:

```text
Color+Hex.swift
```

V projektech Swift jsou názvy souborů jako `Color+Hex.swift` velmi běžné.

Znamená to, že tento soubor je rozšiřující soubor, který přidává typu `Color` schopnost pracovat s Hex barvami.

Název souboru přímo neovlivňuje běh kódu, slouží jen k tomu, abychom snáze pochopili účel tohoto souboru.

## Přidání kódu Color(hex:)

Do souboru `Color+Hex.swift` vložte následující kód:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Tento kód pomocí `extension` rozšiřuje typ `Color` a přidává do `Color` nový inicializátor:

```swift
init(hex: String)
```

Jakmile máme tento inicializátor, můžeme typu `Color` předat Hex řetězec a vytvořit tak vlastní barvu:

```swift
Color(hex: "#5479FF")
```

Uvnitř tohoto rozšíření se Hex řetězec převede na RGB barvu, kterou SwiftUI dokáže rozpoznat.

V této fázi není nutné do hloubky rozumět každému řádku převodní logiky; stačí vědět, že přidaná metoda `Color(hex:)` nám umožňuje vytvářet vlastní barvy pomocí Hex hodnot.

## Použití vlastní barvy

Nyní můžeme vlastní barvy otestovat v `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Výsledné zobrazení:

![color](../../../Resource/031_color1.png)

V tomto příkladu první řádek používá systémovou barvu:

```swift
.foregroundStyle(Color.blue)
```

Další tři řádky používají vlastní Hex barvy:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Porovnáním zjistíme, že systémová modrá má pouze jeden výchozí efekt.

Hex barvy však dokážou vyjádřit jemnější změny modré.

To je hodnota vlastních barev: umožňují, aby barvy rozhraní byly blíže skutečnému návrhu, a zároveň nám usnadňují řízení vizuálního stylu aplikace.

## Uspořádání barev pomocí static

Nyní už můžeme vytvářet barvy pomocí Hex řetězce:

```swift
Color(hex: "#2c54c2")
```

Tento zápis funguje správně, ale pokud se stejná barva bude opakovat na více místech, pozdější údržba nebude příliš pohodlná.

Pokud tuto hodnotu barvy napíšeme na 10 místech a později budeme chtít tuto modrou změnit, bude nutné upravit ji jednu po druhé.

V takové situaci můžeme pomocí `static` sjednotit a uspořádat často používané barvy.

Na konec souboru `Color+Hex.swift` dále přidejte následující kód:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Zde jsme do `Color` přidali tři statické vlastnosti: `animalBlue`, `animalLightBlue` a `animalDarkBlue`, které představují různé odstíny modré.

Protože tyto vlastnosti používají `static`, patří samotnému typu `Color`.

Při používání k nim můžeme přistupovat přímo přes `Color.`:

```swift
Color.animalBlue
```

Tento zápis je jasnější než přímé psaní Hex řetězce.

Když uvidíme `Color.animalBlue`, víme, že označuje modrou barvu používanou v encyklopedii zvířat.

Když však uvidíme `Color(hex: "#2c54c2")`, víme pouze, že jde o hodnotu barvy, ale není snadné poznat její konkrétní účel.

Jednotná správa barev má ještě jednu výhodu: pozdější úpravy jsou pohodlnější.

Pokud chceme upravit hlavní barvu encyklopedie zvířat, stačí změnit místo definice:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Všechna místa, která tuto barvu používají, se aktualizují společně.

Právě to je význam uspořádání barev pomocí `static`: názvy barev jsou jasnější a pozdější údržba je pohodlnější.

## Použití v encyklopedii zvířat

Nyní můžeme vlastní barvy použít v předchozím zobrazení encyklopedie zvířat.

Dříve bylo pozadí tlačítka zvířete bílé:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nyní ho můžeme změnit na vlastní barvu:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Zde je `Color.animalBlue` statická barva, kterou jsme právě definovali v `Color+Hex.swift`.

Text tlačítka používá bílou barvu:

```swift
.foregroundStyle(Color.white)
```

Pozadí zvířecího emoji používá poloprůhlednou bílou:

```swift
.background(Color.white.opacity(0.15))
```

Tlačítko tak vytvoří jednotný modrý vizuální styl.

Smyslem tohoto kroku není přidat složitý kód, ale skutečně použít vlastní barvy naučené výše v rozhraní.

## Použití přechodového pozadí

Kromě jedné barvy můžeme také zkombinovat více barev do přechodového efektu.

Například jsme výše definovali tyto barvy:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tyto barvy lze používat nejen samostatně, ale také je lze zkombinovat do přechodového pozadí.

Ve SwiftUI můžeme pomocí `LinearGradient` vytvořit lineární přechod.

Například:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Tento kód vytvoří přechodové pozadí zleva doprava, kde barva postupně přechází z `Color.animalBlue` do `Color.animalLightBlue`.

Parametr `colors` slouží k nastavení barev zapojených do přechodu a `startPoint` s `endPoint` slouží k ovládání směru přechodu.

### Testování efektu přechodu

Přechodové pozadí můžeme otestovat pomocí jednoduchého `Text`.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Výsledné zobrazení:

![color](../../../Resource/031_color3.png)

V tomto příkladu už pozadí `Text` není jedna barva, ale přechodová barva, která se postupně mění zleva doprava.

Ve srovnání s běžnou barvou pozadí působí přechodové pozadí vrstveněji a snáze vytváří v rozhraní vizuální důraz.

## Použití přechodového pozadí v encyklopedii zvířat

Nyní můžeme pozadí tlačítka zvířete:

```swift
.background(Color.animalBlue)
```

změnit na přechodové pozadí:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Úplný kód je následující:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Výsledné zobrazení:

![color](../../../Resource/031_color4.png)

Nyní už tlačítko zvířete nemá jen jednobarevné pozadí, ale má přechodový efekt zleva doprava.

Ve srovnání s jednobarevným pozadím může přechodové pozadí působit v rozhraní vrstveněji a více se přibližovat vizuálnímu návrhu skutečné aplikace.

## Rozdíl mezi jednobarevným a přechodovým pozadím

Jednobarevné pozadí používá pouze jednu barvu.

Například:

```swift
.background(Color.animalBlue)
```

Tento zápis je jednoduchý a jasný a hodí se pro většinu základních rozhraní.

Přechodové pozadí používá více barev.

Například:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Tento zápis může rozhraní dodat více vrstev, ale také snadněji zvyšuje vizuální složitost.

V praktickém vývoji to tedy můžeme chápat takto:

Jednobarevné pozadí se hodí pro běžný text, běžná tlačítka, běžné karty a běžná pozadí stránek.

Přechodové pozadí se hodí pro hlavní tlačítka, horní oblasti, titulní karty, vstupy do funkcí a další místa, která je potřeba zdůraznit.

## Shrnutí

V této lekci jsme se naučili, jak ve SwiftUI používat vlastní barvy.

Nejprve jsme se seznámili s Hex barvami.

Například:

```text
#2c54c2
```

Představuje konkrétní barvu.

Poté jsme pomocí `extension Color` rozšířili typ `Color`.

SwiftUI tak může vytvářet barvy následujícím způsobem:

```swift
Color(hex: "#2c54c2")
```

Dále jsme pomocí `static` uspořádali často používané barvy:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Díky tomu je lze v jiných zobrazeních používat přímo takto:

```swift
Color.animalBlue
```

Ve srovnání s opakovaným psaním Hex řetězce je tento způsob jasnější a také pohodlnější pro pozdější jednotné úpravy barev.

Nakonec jsme se naučili `LinearGradient` a zkombinovali vlastní barvy do přechodového pozadí:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

V této lekci jsme dokončili proces od „vytvoření vlastní barvy“ až po „použití barvy ve skutečném rozhraní“.

Když bude v budoucnu potřeba použít jednu barvu na více místech, můžeme přednostně zvážit její uspořádání do rozšíření `Color`.

Kód tak bude jasnější a styl rozhraní bude snazší udržet jednotný.
