# Fotogaléria

V tejto lekcii vytvoríme stránku fotogalérie.

![view](../../../Resource/032_view13.png)

V tomto príklade si zopakujeme znalosti o `extension`, `self` a inštanciách a naučíme sa často používané grafické tvary `Shape` v SwiftUI.

Pomocou týchto znalostí môžeme bežné obrázky orezať do rôznych štýlov, napríklad do kruhu, zaobleného obdĺžnika, kapsuly alebo elipsy, a pridať fotografiám efekt okraja.

V tejto lekcii použijeme niekoľko nových pojmov: `Shape`, `clipShape`, `strokeBorder` a `overlay`.

`clipShape` sa používa na orezanie tvaru zobrazenia, `strokeBorder` sa používa na vykreslenie okraja tvaru a `overlay` sa používa na prekrytie nového zobrazenia nad aktuálnym zobrazením.

## Obrazové materiály

Pred začiatkom si musíme pripraviť niekoľko obrázkov.

Môžete použiť vlastné fotografie alebo ukážkové obrázky poskytnuté v tejto lekcii.

Ukážkové fotografie v tejto lekcii pochádzajú z webu [Pixabay](https://pixabay.com/):

[Krajina](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [líška](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [budova](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [kvet](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [labuť](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Po stiahnutí obrázkov ich pridajte do priečinka zdrojov `Assets` a postupne ich pomenujte `1`, `2`, `3`, `4` a `5`.

![assets](../../../Resource/032_view17.png)

Takto môžeme obrázky v SwiftUI zobrazovať pomocou `Image("1")`, `Image("2")` a podobne.

## Zobrazenie fotografií

Najprv v `ContentView` zobrazíme 5 fotografií:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/032_view.png)

V tomto kóde používame `ScrollView` na rolovateľné zobrazenie zoznamu fotografií a `VStack` na usporiadanie viacerých obrázkov zhora nadol.

Každý obrázok používa `.resizable()`, `.scaledToFit()` a `.frame(width: 300)` na nastavenie spôsobu zobrazenia, takže obrázok sa môže škálovať, zachovať pomer strán a mať obmedzenú šírku.

`.padding(.vertical, 100)` na `VStack` slúži na zväčšenie horného a dolného odsadenia, aby prvá a posledná fotografia neboli príliš blízko okrajov obrazovky.

Záverečné `.ignoresSafeArea()` znamená, že rolovacie zobrazenie ignoruje bezpečnú oblasť, takže fotografie sa pri rolovaní môžu rozšíriť k hornej a dolnej časti obrazovky a stránka sa zobrazí úplnejšie.

Teraz však všetkých 5 obrázkov používa rovnaké modifikátory:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Keď vidíme opakujúci sa kód, môžeme zvážiť jeho usporiadanie pomocou `extension`.

## Použitie extension na usporiadanie štýlu obrázkov

Typ `Image` môžeme rozšíriť o metódu určenú špeciálne pre fotogalériu:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tu rozširujeme typ `Image` o metódu `photoGalleryStyle`.

Táto metóda obsahuje predtým opakovane používané `.resizable()`, `.scaledToFit()` a `.frame(width: 300)`. Inými slovami, spája kód na škálovanie obrázka, proporcionálne zobrazenie a nastavenie šírky na jedno miesto.

Po použití tohto rozšírenia môžeme pôvodný kód obrázka:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

zjednodušiť na:

```swift
Image("1")
    .photoGalleryStyle()
```

Takto stačí, aby každý obrázok zavolal `.photoGalleryStyle()`, a použije rovnaký štýl fotogalérie. Kód je čistejší a neskôr sa dá jednoduchšie jednotne upravovať.

## Pochopenie self

V metóde rozšírenia sme napísali `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Tu `self` predstavuje aktuálnu inštanciu obrázka, ktorá túto metódu volá.

Napríklad:

```swift
Image("1")
    .photoGalleryStyle()
```

V tomto kóde metódu `photoGalleryStyle()` volá `Image("1")`, takže `self` vo vnútri metódy predstavuje tento obrázok `Image("1")`.

Jednoducho si to môžeme predstaviť takto: kto túto metódu volá, toho predstavuje `self`.

Treba si všimnúť, že modifikátory SwiftUI neustále vracajú nové výsledky zobrazenia. Preto `photoGalleryStyle()` vracia upravené zobrazenie, nie iba pôvodný samotný `Image`.

## Tvary fotografií

Teraz sa už fotografie môžu zobrazovať normálne. Predvolene sú však tieto fotografie obdĺžnikové, čo pôsobí pomerne obyčajne.

Ak chceme fotografiám iba pridať zaoblené rohy, môžeme priamo použiť `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Výsledok zobrazenia:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` znamená pridanie zaoblenia rohov s hodnotou `20 pt` k obrázku. Pre bežné obrázky so zaoblenými rohmi je tento zápis už dostačujúci.

`.cornerRadius()` však dokáže spracovať iba efekt zaoblených rohov a hodí sa na vytváranie bežných obrázkov so zaoblenými rohmi. Ak chceme, aby sa fotografie zmenili na viac rôznych tvarov, samotný tento modifikátor nestačí.

V tejto chvíli potrebujeme použiť `Shape` v SwiftUI. `Shape` môže predstavovať rôzne grafické tvary a spolu s `clipShape` dokáže orezať obrázok do zodpovedajúceho tvaru.

## Pochopenie Shape

V SwiftUI `Shape` predstavuje grafický tvar. Podobne ako `View` ide o veľmi často používaný typ v SwiftUI.

Medzi bežné typy `Shape` patria kruhy, obdĺžniky, zaoblené obdĺžniky, kapsuly a elipsy. Aby sme vzhľad rôznych grafických tvarov videli intuitívnejšie, nasledujúce príklady nastavujú každému tvaru inú farbu a veľkosť.

V týchto príkladoch sa `.fill()` používa na vyplnenie grafického tvaru farbou a `.frame()` sa používa na nastavenie zobrazovacej veľkosti tvaru. Farby slúžia iba na rozlíšenie rôznych tvarov a nie sú pevnými farbami samotných tvarov.

### Circle

`Circle` predstavuje kruh. Často sa používa pri avataroch, kruhových tlačidlách, kruhových obrázkoch a ďalších efektoch rozhrania.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle

`Rectangle` predstavuje obdĺžnik. Je to jeden z najzákladnejších grafických tvarov a dá sa použiť aj na vytváranie pozadí, rozdelených oblastí alebo bežných okrajov.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle

`RoundedRectangle` predstavuje zaoblený obdĺžnik. `cornerRadius` sa používa na nastavenie veľkosti zaoblenia rohov.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule

`Capsule` predstavuje tvar kapsuly. Jej dva konce sú oblúkové a často sa používa pri kapsulových tlačidlách, pozadiach značiek a ďalších efektoch rozhrania.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse

`Ellipse` predstavuje elipsu. Je podobná ako `Circle`, ale keď sa šírka a výška líšia, zobrazí sa ako elipsa.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Z týchto príkladov vidíme, že samotný `Shape` sa dá priamo zobraziť ako grafický tvar. Ďalej použijeme tieto typy `Shape` spolu s `clipShape` na orezanie fotografií tak, aby sa zobrazovali v rôznych tvaroch.

## Použitie clipShape na orezanie fotografií

Teraz môžeme použiť `clipShape` na orezanie fotografií do rôznych tvarov.

Napríklad orežeme prvú fotografiu do kruhu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Tento kód znamená: najprv zobrazíme obrázok a potom ho pomocou `Circle()` orežeme do kruhu.

![view](../../../Resource/032_view2.png)

Základný zápis `clipShape` je:

```swift
.clipShape(tvar)
```

Za zobrazenie pridáme `.clipShape(...)` a do zátvoriek vložíme grafický tvar, do ktorého ho chceme orezať.

Napríklad:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Teraz orežeme 5 fotografií do rôznych tvarov:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/032_view8.png)

Výsledok po orezaní pomocou `Rectangle()` je podobný bežnej obdĺžnikovej fotografii, preto vizuálna zmena nie je výrazná. Slúži hlavne na porovnanie s ostatnými tvarmi.

Teraz už fotografie nie sú iba obyčajné obdĺžniky, ale majú rôzne tvary.

## Pridanie okrajov fotografií

Ak chceme pridať okraj ku kruhovej fotografii, môže nám napadnúť použiť `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Takto však zvyčajne nedostaneme kruhový okraj, ale obdĺžnikový okraj.

![view](../../../Resource/032_view9.png)

Je to preto, že `border` pridáva okraj podľa obdĺžnikovej oblasti zobrazenia, nie podľa tvaru po orezaní pomocou `clipShape`.

Preto ak chceme kruhový okraj, nemôžeme priamo použiť `border`.

## Použitie strokeBorder na vykreslenie okrajov tvarov

V SwiftUI dokáže `strokeBorder` vykresliť vnútorné okraje pre tieto bežné typy `Shape`.

Napríklad vykreslíme kruhový okraj:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Tento kód znamená: vykresliť hnedý okraj pre `Circle` so šírkou okraja `10 pt`.

![view](../../../Resource/032_view12.png)

Tu je potrebné poznamenať, že `strokeBorder` nepridáva okraj priamo fotografii. Namiesto toho vykresľuje okraj pre grafický tvar `Circle()`.

Inými slovami, tento kód vytvorí iba samostatný kruhový okraj a s fotografiou zatiaľ nesúvisí.

Ak chceme, aby sa tento kruhový okraj zobrazil nad fotografiou, musíme ďalej použiť `overlay` a okraj prekryť cez fotografiu.

## Použitie overlay na prekrytie okrajov

`overlay` je modifikátor zobrazenia, ktorý dokáže prekryť nové zobrazenie nad aktuálnym zobrazením.

Jeho základnú štruktúru môžeme chápať takto:

```swift
Aktuálne zobrazenie
    .overlay {
        Prekrývané zobrazenie
    }
```

V tomto prípade je aktuálnym zobrazením fotografia, ktorá už bola orezaná do kruhu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Nové zobrazenie, ktoré chceme prekryť, je kruhový okraj:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Preto môžeme fotografiu a okraj spojiť:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Tu `overlay` znamená prekrytie nového zobrazenia nad aktuálnym zobrazením.

V `overlay` sa okraj prekryje podľa zobrazovacej oblasti aktuálnej fotografie, takže nie je potrebné nastavovať samostatný `frame`. Ak sa tvar okraja zhoduje s tvarom orezania, okraj presne prilieha k fotografii.

![view](../../../Resource/032_view10.png)

Výsledný efekt je taký, že nad kruhovou fotografiou je umiestnený kruhový okraj.

V porovnaní so `ZStack` je `overlay` vhodnejší pre scenáre typu „pridanie dekorácie k aktuálnemu zobrazeniu“. Fotografia je hlavný obsah a okraj je iba doplnkový efekt, preto je použitie `overlay` prehľadnejšie.

## Dokončenie fotogalérie

Teraz každej fotografii pridáme zodpovedajúci tvar a okraj:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/032_view13.png)

Takto je základná stránka fotogalérie hotová.

Na tejto stránke používame `ScrollView` na rolovateľné zobrazenie, `Image` na zobrazenie fotografií, `clipShape` na orezanie tvarov fotografií a `overlay` spolu so `strokeBorder` na pridanie okrajov.

## Kompletný kód

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Zhrnutie

V tejto lekcii sme dokončili stránku fotogalérie.

![view](../../../Resource/032_view13.png)

V tomto príklade sme najprv použili `Image` na zobrazenie fotografií a potom sme cez `extension` rozšírili `Image` o metódu `photoGalleryStyle`, aby sme usporiadali opakujúci sa kód štýlu obrázkov.

Potom sme sa naučili bežné typy `Shape` v SwiftUI, ako sú `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` a `Ellipse`. Tieto grafické tvary sa dajú nielen priamo zobraziť, ale môžu sa používať aj spolu s `clipShape` na orezanie zobrazení.

Napríklad:

```swift
.clipShape(Circle())
```

znamená orezať zobrazenie do kruhu.

Nakoniec sme použili `overlay` a `strokeBorder` na pridanie okrajov zodpovedajúcich tvarov k fotografiám. Treba si všimnúť, že `border` zvyčajne kreslí okraj podľa obdĺžnikovej oblasti zobrazenia. Ak chceme, aby okraj nasledoval kruh, kapsulu alebo elipsu, je vhodnejšie prekryť rovnaký `Shape`.

Vďaka tejto lekcii sme nielen dokončili efekt fotogalérie, ale aj pochopili bežnú kombináciu `Shape`, `clipShape`, `strokeBorder` a `overlay` v rozhraniach.

## Cvičenia po lekcii

### 1. Pridanie pozadia fotogalérie

Pridajte na stránku fotogalérie obrázok na celú obrazovku ako pozadie.

Požiadavka: obrázok pozadia by mal vyplniť celú obrazovku a ignorovať bezpečnú oblasť.

### 2. Prechodový okraj

Zmeňte existujúce jednofarebné okraje na lineárne prechodové okraje.

Môžete skúsiť použiť `LinearGradient` na vytvorenie bohatších efektov okraja.

### 3. Simulovaný rám fotografie

Vyhľadajte na internete niekoľko štýlov skutočných rámov fotografií a skúste pomocou `overlay` prekryť obrázkové rámy tak, aby fotografie vyzerali bližšie k skutočným rámom.

Výsledok zobrazenia cvičenia:

![button](../../../Resource/032_view15.jpeg)

### 4. Vytvorenie okraja zaobleného tlačidla

V reálnom vývoji tlačidlá často používajú okraje so zaobleným obdĺžnikom.

Skúste vytvoriť zaoblené tlačidlo a pomocou `RoundedRectangle` a `strokeBorder` pridať tlačidlu zaoblený okraj.

Výsledok zobrazenia cvičenia:

![button](../../../Resource/032_view14.png)

### Otázka na zamyslenie

Ak nechceme použiť jednofarebný okraj ani prechodový okraj, ale chceme, aby okraj zobrazoval určitý vzorový efekt, ako by sme ho mali implementovať?

Môžete skúsiť vyhľadať materiály a naučiť sa súvisiace použitia ako `overlay`, `mask` alebo `ImagePaint`.

Výsledok zobrazenia cvičenia:

![button](../../../Resource/032_view16.png)
