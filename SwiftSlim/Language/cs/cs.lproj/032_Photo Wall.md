# Fotogalerie

V této lekci vytvoříme stránku fotogalerie.

![view](../../../Resource/032_view13.png)

V tomto příkladu si zopakujeme znalosti o `extension`, `self` a instancích a naučíme se běžně používané tvary `Shape` ve SwiftUI.

Díky těmto znalostem můžeme běžné obrázky oříznout do různých stylů, například do kruhu, zaobleného obdélníku, kapsle nebo elipsy, a k fotografiím přidat efekt rámečku.

V této lekci použijeme několik nových znalostí: `Shape`, `clipShape`, `strokeBorder` a `overlay`.

`clipShape` se používá k oříznutí tvaru zobrazení, `strokeBorder` k vykreslení okraje tvaru a `overlay` k překrytí nového zobrazení nad aktuálním zobrazením.

## Obrázkové materiály

Než začneme, musíme si připravit několik obrázků.

Můžete použít vlastní fotografie nebo ukázkové obrázky poskytnuté v této lekci.

Ukázkové fotografie v této lekci pocházejí z webu [Pixabay](https://pixabay.com/):

[Krajina](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[liška](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[budova](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[květina](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[labuť](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Po stažení obrázků je přidejte do složky prostředků `Assets` a postupně je pojmenujte `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

Takto můžeme ve SwiftUI zobrazovat obrázky pomocí `Image("1")`, `Image("2")` a podobně.

## Zobrazení fotografií

Nejprve v `ContentView` zobrazíme 5 fotografií:

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

Výsledek zobrazení:

![view](../../../Resource/032_view.png)

V této části kódu používáme `ScrollView` k vytvoření posuvného seznamu fotografií a `VStack` k uspořádání více obrázků shora dolů.

Každý obrázek nastavujeme pomocí `.resizable()`, `.scaledToFit()` a `.frame(width: 300)`, aby bylo možné obrázek škálovat, zobrazit jej celý se zachováním poměru stran a omezit jeho šířku.

`.padding(.vertical, 100)` na `VStack` slouží ke zvětšení horního a dolního odsazení, aby první a poslední fotografie nebyly příliš blízko okrajům obrazovky.

Poslední `.ignoresSafeArea()` znamená, že posuvné zobrazení ignoruje bezpečnou oblast, takže fotografie se při posouvání mohou rozšířit až k horní a dolní části obrazovky a stránka působí úplněji.

Nyní však všech 5 obrázků používá stejné modifikátory:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Když vidíme opakující se kód, můžeme zvážit jeho uspořádání pomocí `extension`.

## Použití extension k uspořádání stylu obrázků

Můžeme pro `Image` rozšířit metodu určenou speciálně pro fotogalerii:

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

Zde jsme typu `Image` přidali metodu `photoGalleryStyle`.

Tato metoda uvnitř obsahuje dříve opakovaně používané `.resizable()`, `.scaledToFit()` a `.frame(width: 300)`. Jinými slovy, soustřeďuje kód pro škálování obrázku, zachování poměru stran a nastavení šířky na jedno místo.

Po použití tohoto rozšíření lze původní kód obrázku:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

zjednodušit na:

```swift
Image("1")
    .photoGalleryStyle()
```

Takto stačí u každého obrázku zavolat `.photoGalleryStyle()`, aby se použil stejný styl fotogalerie. Kód bude stručnější a pozdější jednotné úpravy budou pohodlnější.

## Porozumění self

V metodě rozšíření jsme napsali `self`:

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

Zde `self` představuje aktuální instanci obrázku, která tuto metodu volá.

Například:

```swift
Image("1")
    .photoGalleryStyle()
```

V tomto kódu je `photoGalleryStyle()` volána objektem `Image("1")`, takže `self` uvnitř metody představuje právě tento obrázek `Image("1")`.

Jednoduše řečeno: kdo metodu volá, toho představuje `self`.

Je třeba si všimnout, že modifikátory SwiftUI neustále vracejí nové výsledky zobrazení. Proto `photoGalleryStyle()` vrací upravené zobrazení, nikoli jednoduše původní `Image` samotný.

## Tvary fotografií

Nyní se fotografie mohou správně zobrazit. Ve výchozím stavu jsou však všechny tyto fotografie obdélníkové a vypadají poměrně obyčejně.

Pokud chceme fotografii pouze zaoblit rohy, můžeme přímo použít `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Výsledek zobrazení:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` znamená přidání zaoblení rohů o hodnotě `20 pt`. Pro běžnou zaoblenou fotografii je tento zápis už dostačující.

`.cornerRadius()` však umí zpracovat pouze efekt zaoblení rohů a hodí se pro tvorbu běžných zaoblených obrázků. Pokud chceme fotografii změnit do více různých tvarů, tento modifikátor sám o sobě nestačí.

V takovém případě potřebujeme ve SwiftUI použít `Shape`. `Shape` může představovat různé grafické tvary a ve spojení s `clipShape` lze obrázek oříznout do odpovídajícího tvaru.

## Seznámení se Shape

Ve SwiftUI `Shape` představuje grafický tvar. Stejně jako `View` patří mezi velmi často používané typy ve SwiftUI.

Mezi běžné `Shape` patří kruh, obdélník, zaoblený obdélník, kapsle a elipsa. Aby bylo možné vzhled jednotlivých tvarů pozorovat názorněji, nastaví následující příklady každému tvaru jinou barvu a velikost.

V těchto příkladech se `.fill()` používá k vyplnění tvaru barvou a `.frame()` k nastavení zobrazované velikosti tvaru. Barvy slouží pouze k odlišení jednotlivých tvarů a nejsou pevně danou barvou samotného tvaru.

### Circle kruh

`Circle` představuje kruh. Často se používá pro avatary, kruhová tlačítka, kruhové obrázky a podobné efekty rozhraní.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle obdélník

`Rectangle` představuje obdélník. Je to jeden z nejzákladnějších tvarů a lze jej použít také k vytvoření pozadí, rozdělovacích oblastí nebo běžných rámečků.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle zaoblený obdélník

`RoundedRectangle` představuje zaoblený obdélník. `cornerRadius` slouží k nastavení velikosti zaoblení rohů.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapsle

`Capsule` představuje tvar kapsle. Její oba konce jsou obloukové a často se používá pro kapslová tlačítka, pozadí štítků a podobné efekty rozhraní.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsa

`Ellipse` představuje elipsu. Je podobná `Circle`, ale když šířka a výška nejsou stejné, zobrazí se jako elipsa.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Z těchto příkladů je vidět, že samotný `Shape` lze přímo zobrazit jako grafický tvar. Dále použijeme tyto `Shape` společně s `clipShape` k oříznutí fotografií, aby se fotografie zobrazily v různých tvarech.

## Použití clipShape k oříznutí fotografií

Nyní můžeme pomocí `clipShape` oříznout fotografie do různých tvarů.

Například ořízneme první fotografii do kruhu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Tento kód znamená: nejprve zobrazit obrázek a poté jej pomocí `Circle()` oříznout do kruhu.

![view](../../../Resource/032_view2.png)

Základní zápis `clipShape` je:

```swift
.clipShape(tvar)
```

Za zobrazení přidáme `.clipShape(...)` a do závorek vyplníme grafický tvar, do kterého má být zobrazení oříznuto.

Například:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nyní ořízneme 5 fotografií postupně do různých tvarů:

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

Výsledek zobrazení:

![view](../../../Resource/032_view8.png)

Efekt po oříznutí pomocí `Rectangle()` je blízký běžné obdélníkové fotografii, takže vizuální změna není výrazná; používá se hlavně pro porovnání s ostatními tvary.

Nyní už fotografie nejsou jen běžné obdélníky, ale mají různé tvary.

## Přidání rámečku fotografie

Pokud chceme ke kruhové fotografii přidat rámeček, může nás napadnout použít `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Tím však obvykle nedostaneme kruhový rámeček, ale obdélníkový rámeček.

![view](../../../Resource/032_view9.png)

Důvodem je, že `border` přidává rámeček podle obdélníkové oblasti zobrazení, nikoli podle tvaru oříznutého pomocí `clipShape`.

Pokud tedy chceme kruhový rámeček, nemůžeme přímo použít `border`.

## Použití strokeBorder k vykreslení okraje tvaru

Ve SwiftUI může `strokeBorder` těmto běžným `Shape` vykreslit vnitřní okraj.

Například vykreslíme kruhový rámeček:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Tento kód znamená: vykreslit pro `Circle` hnědý rámeček o šířce `10 pt`.

![view](../../../Resource/032_view12.png)

Zde je třeba si všimnout, že `strokeBorder` nepřidává rámeček přímo k fotografii, ale vykresluje okraj pro grafický tvar `Circle()`.

Jinými slovy, výsledkem tohoto kódu je pouze samostatný kruhový rámeček, který zatím s fotografií nijak nesouvisí.

Pokud chceme tento kruhový rámeček zobrazit nad fotografií, musíme dále použít `overlay` a rámeček na fotografii překrýt.

## Použití overlay k překrytí rámečku

`overlay` je modifikátor zobrazení, který může nad aktuální zobrazení překrýt nové zobrazení.

Jeho základní strukturu lze chápat takto:

```swift
Aktuální zobrazení
    .overlay {
        Překryté zobrazení
    }
```

V tomto příkladu je aktuálním zobrazením fotografie, která už byla oříznuta do kruhu:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Nové zobrazení, které chceme překrýt, je kruhový rámeček:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Proto můžeme fotografii a rámeček zkombinovat:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Zde `overlay` znamená překrytí nového zobrazení nad aktuálním zobrazením.

V `overlay` se rámeček překryje podle zobrazovací oblasti aktuální fotografie, takže není nutné znovu samostatně nastavovat `frame`. Stačí, aby tvar rámečku odpovídal tvaru oříznutí, a rámeček bude k fotografii přiléhat.

![view](../../../Resource/032_view10.png)

Konečný efekt je ten, že nad kruhovou fotografií leží kruhový rámeček.

Ve srovnání s `ZStack` je `overlay` vhodnější pro situace typu „přidat dekoraci k aktuálnímu zobrazení“. Fotografie je hlavní obsah a rámeček je pouze doplňkový efekt, takže použití `overlay` je přehlednější.

## Dokončení fotogalerie

Nyní každé fotografii přidáme odpovídající tvar a rámeček:

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

Výsledek zobrazení:

![view](../../../Resource/032_view13.png)

Tím je základní stránka fotogalerie hotová.

Na této stránce používáme `ScrollView` k posuvnému zobrazení, `Image` k zobrazení fotografií, `clipShape` k oříznutí tvaru fotografií a pomocí `overlay` a `strokeBorder` přidáváme rámečky.

## Kompletní kód

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

## Shrnutí

V této lekci jsme dokončili stránku fotogalerie.

![view](../../../Resource/032_view13.png)

V tomto příkladu jsme nejprve použili `Image` k zobrazení fotografií a poté jsme pomocí `extension` rozšířili `Image` o metodu `photoGalleryStyle`, která slouží k uspořádání opakujícího se kódu stylu obrázků.

Poté jsme se naučili běžné `Shape` ve SwiftUI, například `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` a `Ellipse`. Tyto tvary lze nejen přímo zobrazit, ale lze je také použít společně s `clipShape` k oříznutí zobrazení.

Například:

```swift
.clipShape(Circle())
```

znamená oříznout zobrazení do kruhu.

Nakonec jsme pomocí `overlay` a `strokeBorder` přidali fotografiím rámečky odpovídajících tvarů. Je třeba si všimnout, že `border` obvykle kreslí rámeček podle obdélníkové oblasti zobrazení. Pokud chceme, aby rámeček následoval kruh, kapsli nebo elipsu, je vhodnější použít ke překrytí stejný `Shape`.

Díky této lekci jsme nejen dokončili efekt fotogalerie, ale také pochopili běžný způsob kombinování `Shape`, `clipShape`, `strokeBorder` a `overlay` v rozhraní.

## Cvičení po lekci

### 1、Přidání pozadí fotogalerie

Přidejte stránce fotogalerie obrázek na pozadí přes celou obrazovku.

Požadavek: obrázek na pozadí může vyplnit celou obrazovku a ignorovat bezpečnou oblast.

### 2、Přechodový rámeček

Změňte stávající jednobarevný rámeček na lineární přechodový rámeček.

Můžete zkusit použít `LinearGradient` k vytvoření bohatšího efektu rámečku.

### 3、Napodobení fotografického rámečku

Vyhledejte na internetu některé styly skutečných fotografických rámečků a zkuste pomocí `overlay` překrýt obrázkový rámeček, aby fotografie působila více jako skutečný obrazový rám.

Výsledek cvičení:

![button](../../../Resource/032_view15.jpeg)

### 4、Vytvoření rámečku tlačítka se zaoblenými rohy

Ve skutečném vývoji se u tlačítek často používá rámeček se zaobleným obdélníkem.

Zkuste vytvořit tlačítko se zaoblenými rohy a pomocí `RoundedRectangle` a `strokeBorder` k němu přidejte zaoblený rámeček.

Výsledek cvičení:

![button](../../../Resource/032_view14.png)

### Otázka k zamyšlení

Pokud nechceme použít jednobarevný rámeček ani přechodový rámeček, ale chceme, aby rámeček měl nějaký vzor, jak bychom toho měli dosáhnout?

Můžete zkusit vyhledat materiály a seznámit se se souvisejícím použitím `overlay`, `mask` nebo `ImagePaint`.

Výsledek cvičení:

![button](../../../Resource/032_view16.png)
