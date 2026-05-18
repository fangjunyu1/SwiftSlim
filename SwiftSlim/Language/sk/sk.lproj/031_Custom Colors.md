# Vlastné farby

V tejto lekcii sa naučíme, ako v SwiftUI vytvárať vlastné farby.

V predchádzajúcich lekciách sme už používali predvolené farby, ktoré poskytuje SwiftUI, napríklad:

```swift
Color.blue
Color.red
Color.green
```

Tieto farby sa používajú veľmi pohodlne, ale pri vývoji skutočných aplikácií zvyčajne nie sú dostatočne presné.

Napríklad v dizajne sa môžu používať takéto farby:

```text
#2c54c2
#4875ed
#213e8d
```

Takýto typ farby sa nazýva Hex farba.

V tejto lekcii najprv umožníme SwiftUI podporovať Hex farby a potom pomocou `static` usporiadame často používané farby.

Nakoniec použijeme vlastné farby v zobrazení encyklopédie zvierat a ďalej použijeme prechodové pozadie, aby tlačidlá pôsobili viac vrstvene.

## Prečo potrebujeme vlastné farby?

V SwiftUI môžeme priamo používať systémové farby.

Napríklad:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Tu `.blue` označuje modrú farbu. V skutočnosti je to skrátený zápis pre `Color.blue`.

Výhodou predvolených farieb je jednoduchosť a pohodlnosť, ale výber farieb je pomerne obmedzený.

Napríklad:

```swift
Color.blue
```

môže vyjadrovať iba predvolenú modrú farbu, ktorú poskytuje SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

V reálnom vývoji však často potrebujeme konkrétnejšie farby.

Napríklad aj pri modrej farbe môžu existovať rôzne efekty, ako svetlomodrá, tmavomodrá, sivomodrá alebo žiarivá modrá.

![More Blue](../../../Resource/031_color5.png)

V takom prípade je veľmi ťažké obnoviť dizajnový efekt iba pomocou `Color.blue`.

Preto potrebujeme, aby SwiftUI podporovalo vlastné farby.

## Čo je Hex farba?

Farby na obrazovke sa zvyčajne skladajú z troch kanálov: červeného, zeleného a modrého, teda RGB.

RGB označuje:

```text
Red     // červená
Green   // zelená
Blue    // modrá
```

Hex farba je jeden zo spôsobov zápisu RGB farby.

Napríklad:

```swift
#5479FF
```

Túto hodnotu farby si môžeme jednoducho predstaviť ako tri časti:

```text
54  // označuje červený kanál
79  // označuje zelený kanál
FF  // označuje modrý kanál
```

V tejto lekcii nemusíme tieto hodnoty počítať ani podrobne chápať pravidlá šestnástkovej sústavy.

Teraz stačí vedieť, že `#5479FF` predstavuje konkrétnu farbu.

Keď v budúcnosti uvidíme zápis podobný `#2c54c2` alebo `#4875ed`, môžeme ho najprv chápať ako hodnotu farby.

Podobné hodnoty farieb často uvidíme aj v dizajnérskych nástrojoch, ako sú Sketch, Figma alebo Photoshop.

![color](../../../Resource/031_color.png)

SwiftUI však predvolene neumožňuje písať priamo takto:

```swift
Color(hex: "#5479FF")
```

Preto musíme sami rozšíriť typ `Color`, aby podporoval vytváranie farieb pomocou Hex reťazca.

## Vytvorenie súboru Color+Hex.swift

Najprv vytvoríme nový Swift súbor.

Názov súboru môže byť:

```text
Color.swift
```

Môže byť aj jasnejší:

```text
Color+Hex.swift
```

Tu viac odporúčame použiť:

```text
Color+Hex.swift
```

V projektoch Swift sú názvy súborov ako `Color+Hex.swift` veľmi bežné.

Označuje to, že tento súbor je rozširujúci súbor, ktorý pridáva typu `Color` schopnosť pracovať s Hex hodnotami.

Názov súboru priamo neovplyvní spustenie kódu. Slúži iba na to, aby sme ľahšie pochopili účel tohto súboru.

## Pridanie kódu Color(hex:)

Do súboru `Color+Hex.swift` vložte nasledujúci kód:

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

Tento kód používa `extension` na rozšírenie typu `Color` a pridáva typu `Color` nový inicializátor:

```swift
init(hex: String)
```

Po pridaní tohto inicializátora môžeme odovzdať Hex reťazec do `Color` a vytvoriť tak vlastnú farbu:

```swift
Color(hex: "#5479FF")
```

Vnútri tohto rozšírenia sa Hex reťazec prevedie na RGB farbu, ktorú SwiftUI dokáže rozpoznať.

V tejto fáze nie je potrebné podrobne rozumieť logike prevodu v každom riadku. Stačí vedieť, že pridaná metóda `Color(hex:)` nám umožňuje vytvárať vlastné farby pomocou Hex hodnôt.

## Použitie vlastnej farby

Teraz môžeme vlastnú farbu otestovať v `ContentView`.

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

Výsledné zobrazenie:

![color](../../../Resource/031_color1.png)

V tomto príklade prvý riadok používa systémovú farbu:

```swift
.foregroundStyle(Color.blue)
```

Nasledujúce tri riadky používajú vlastné Hex farby:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Porovnaním zistíme, že systémová modrá má iba jeden predvolený efekt.

Hex farby však dokážu vyjadriť jemnejšie odtiene modrej.

Práve v tom spočíva hodnota vlastných farieb: umožňujú, aby sa farby rozhrania viac priblížili skutočnému dizajnu, a zároveň nám uľahčujú kontrolu vizuálneho štýlu aplikácie.

## Usporiadanie farieb pomocou static

Teraz už môžeme vytvárať farby pomocou Hex reťazca:

```swift
Color(hex: "#2c54c2")
```

Tento zápis funguje správne, ale ak sa rovnaká farba opakuje na viacerých miestach, neskoršia údržba nebude veľmi pohodlná.

Ak túto hodnotu farby napíšeme na 10 miestach a neskôr budeme chcieť modrú upraviť, budeme ju musieť meniť jednu po druhej.

V takom prípade môžeme pomocou `static` jednotne usporiadať často používané farby.

Na koniec súboru `Color+Hex.swift` ďalej pridajte nasledujúci kód:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tu sme typu `Color` pridali tri statické vlastnosti: `animalBlue`, `animalLightBlue` a `animalDarkBlue`. Predstavujú rôzne svetlé a tmavé odtiene modrej.

Keďže tieto vlastnosti používajú `static`, patria samotnému typu `Color`.

Pri používaní k nim môžeme pristupovať priamo cez `Color.`:

```swift
Color.animalBlue
```

Tento zápis je jasnejší než priame písanie Hex reťazca.

Keď vidíme `Color.animalBlue`, vieme, že označuje modrú farbu používanú v encyklopédii zvierat.

Keď však vidíme `Color(hex: "#2c54c2")`, vieme iba to, že ide o hodnotu farby, ale nie je ľahké rozpoznať jej konkrétne použitie.

Jednotná správa farieb má ešte jednu výhodu: neskoršie úpravy sú pohodlnejšie.

Ak chceme upraviť hlavnú farbu encyklopédie zvierat, stačí zmeniť miesto definície:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Všetky miesta, ktoré túto farbu používajú, sa aktualizujú naraz.

Toto je význam usporiadania farieb pomocou `static`: názvy farieb sú jasnejšie a neskoršia údržba je pohodlnejšia.

## Použitie v encyklopédii zvierat

Teraz môžeme vlastné farby použiť v predchádzajúcom zobrazení encyklopédie zvierat.

Predtým bolo pozadie tlačidla zvieraťa biele:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Teraz ho môžeme zmeniť na vlastnú farbu:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Tu `Color.animalBlue` je statická farba, ktorú sme práve definovali v `Color+Hex.swift`.

Text tlačidla používa bielu farbu:

```swift
.foregroundStyle(Color.white)
```

Pozadie emoji zvieraťa používa polopriehľadnú bielu farbu:

```swift
.background(Color.white.opacity(0.15))
```

Takto tlačidlo vytvorí jednotný modrý vizuálny štýl.

Dôrazom tohto kroku nie je pridávať zložitý kód, ale skutočne použiť vlastné farby, ktoré sme sa naučili vyššie, v rozhraní.

## Použitie prechodového pozadia

Okrem použitia jednej farby môžeme skombinovať viacero farieb do prechodového efektu.

Napríklad vyššie sme definovali tieto farby:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Tieto farby sa dajú používať nielen samostatne, ale aj kombinovať do prechodového pozadia.

V SwiftUI môžeme na vytvorenie lineárneho prechodu použiť `LinearGradient`.

Napríklad:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Tento kód vytvorí prechodové pozadie zľava doprava, pričom farba postupne prechádza z `Color.animalBlue` do `Color.animalLightBlue`.

Parameter `colors` sa používa na nastavenie farieb, ktoré sa zúčastnia prechodu. Parametre `startPoint` a `endPoint` slúžia na ovládanie smeru prechodu.

### Testovanie efektu prechodu

Prechodové pozadie môžeme otestovať na jednoduchom `Text`.

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

Výsledné zobrazenie:

![color](../../../Resource/031_color3.png)

V tomto príklade už pozadie `Text` nie je jednofarebné, ale je to prechodová farba, ktorá sa postupne mení zľava doprava.

V porovnaní s obyčajným pozadím pôsobí prechodové pozadie viac vrstvene a ľahšie vytvára vizuálny dôraz v rozhraní.

## Použitie prechodového pozadia v encyklopédii zvierat

Teraz môžeme zmeniť farbu pozadia tlačidla zvieraťa:

```swift
.background(Color.animalBlue)
```

na prechodové pozadie:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Úplný kód je nasledujúci:

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

Výsledné zobrazenie:

![color](../../../Resource/031_color4.png)

Teraz tlačidlo zvieraťa už nemá iba jednofarebné pozadie, ale má prechodový efekt zľava doprava.

V porovnaní s jednofarebným pozadím môže prechodové pozadie spôsobiť, že rozhranie bude pôsobiť viac vrstvene a bližšie k vizuálnemu dizajnu skutočnej aplikácie.

## Rozdiel medzi jednofarebným a prechodovým pozadím

Jednofarebné pozadie používa iba jednu farbu.

Napríklad:

```swift
.background(Color.animalBlue)
```

Tento zápis je jednoduchý a jasný a hodí sa pre väčšinu základných rozhraní.

Prechodové pozadie používa viacero farieb.

Napríklad:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Tento zápis môže rozhraniu dodať viac vrstiev, ale zároveň môže ľahšie zvýšiť vizuálnu zložitosť.

Preto to v praktickom vývoji môžeme chápať takto:

Jednofarebné pozadie je vhodné pre bežný text, bežné tlačidlá, bežné karty a bežné pozadie stránky.

Prechodové pozadie je vhodné pre hlavné tlačidlá, horné oblasti, úvodné karty, vstupy do funkcií a ďalšie miesta, ktoré treba zdôrazniť.

## Zhrnutie

V tejto lekcii sme sa naučili, ako v SwiftUI používať vlastné farby.

Najprv sme pochopili Hex farby.

Napríklad:

```text
#2c54c2
```

Predstavuje konkrétnu farbu.

Potom sme pomocou `extension Color` rozšírili typ `Color`.

Vďaka tomu môže SwiftUI vytvárať farby týmto spôsobom:

```swift
Color(hex: "#2c54c2")
```

Ďalej sme pomocou `static` usporiadali často používané farby:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Takto ich môžeme v iných zobrazeniach používať priamo:

```swift
Color.animalBlue
```

V porovnaní s opakovaným písaním Hex reťazca je tento spôsob jasnejší a zároveň uľahčuje neskoršiu jednotnú úpravu farieb.

Nakoniec sme sa naučili `LinearGradient` a skombinovali vlastné farby do prechodového pozadia:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Vďaka tejto lekcii sme dokončili proces od „vytvorenia vlastnej farby“ po „použitie farby v skutočnom rozhraní“.

Keď sa v budúcnosti jedna farba bude musieť opakovane používať na viacerých miestach, môžeme najprv zvážiť jej usporiadanie do rozšírenia `Color`.

Tak bude kód jasnejší a vizuálny štýl rozhrania sa bude ľahšie zjednocovať.
