# Rozloženie, obrázky a text

V predchádzajúcej lekcii sme sa učili kód ContentView:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

V tejto lekcii sa naučíme predvolený mechanizmus rozloženia v SwiftUI a spôsob používania obrázkov a textu. Na základe predchádzajúcej lekcie budeme ďalej rozumieť štruktúre a zobrazeniu View. Tieto poznatky nám pomôžu vytvárať základné rozhrania.

## Predvolený mechanizmus rozloženia v SwiftUI

Pri náhľade zobrazenia ContentView si všimneme, že ikona a text sú zobrazené na strede, a nie usporiadané od horného okraja.

![Swift](../../RESOURCE/003_view.png)

Predvolene je zarovnanie kontajnera Stack nastavené na .center, preto sa podriadené zobrazenia zvyčajne javia ako centrované.

### Alignment — zarovnanie

Je zrejmé, že centrované zarovnanie je len jeden typ zarovnania. Ak chceme ľavé alebo pravé zarovnanie, musíme na riadenie zarovnania View použiť alignment.

```swift
alignment
```

V SwiftUI sa zarovnanie zvyčajne objavuje v dvoch situáciách:

**1. Parameter zarovnania v kontajneri Stack**

Napríklad ľavé zarovnanie ikony a textu v ContentView:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

alignment vo VStack riadi vodorovné zarovnanie.

Možnosti zarovnania:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

HStack je horizontálne usporiadanie a alignment riadi zvislé zarovnanie:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

ZStack je vrstvené usporiadanie a alignment môže riadiť vodorovné aj zvislé zarovnanie:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Ak alignment explicitne neurčíme, VStack, HStack aj ZStack používajú predvolene .center.

**2. alignment vo vnútri frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Keď frame poskytuje väčší rozmer než samotné zobrazenie, alignment určuje polohu zobrazenia vo vnútri frame. Podrobné použitie frame si vysvetlíme neskôr, tu stačí základné oboznámenie.

### Spacer a mechanizmus rozdeľovania priestoru

alignment dokáže zoradiť zobrazenia vodorovne alebo zvisle. Keď však chceme, aby sa text a obrázok zobrazovali na dvoch koncoch, samotné zarovnanie nestačí.

Napríklad keď chceme vytvoriť hornú časť stránky [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), kde je naľavo logo NHK a napravo ikona menu.

![Swift](../../RESOURCE/003_alignment3.png)

Ak použijeme iba alignment, logo NHK aj ikona menu sa zobrazia len na jednej strane. Nedokážeme ich rozdeliť na ľavú a pravú stranu, preto potrebujeme Spacer na rozdelenie zostávajúceho priestoru.

Spacer je pružné zobrazenie používané v rozložení, ktoré automaticky vyplní zostávajúci priestor.

Použitie:

```swift
Spacer()
```

Napríklad:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Keď medzi Image a Text pridáme Spacer, Spacer vyplní zostávajúci priestor a vytlačí Image a Text na horný a dolný koniec.

![Swift](../../RESOURCE/003_view1.png)

Ak existuje viac Spacerov:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Zostávajúci priestor sa medzi Spacery rozdelí rovnomerne.

![Swift](../../RESOURCE/003_spacer.png)

## Zobrazenie Image a ovládanie jeho veľkosti

Zobrazenie Image sa používa najmä na zobrazovanie obrázkov. Ikony SF Symbols, ktoré sme sa učili v predchádzajúcej lekcii, sú len jedným zo spôsobov použitia Image.

Použitie:

```swift
Image("imageName")
```

V dvojitých úvodzovkách je názov obrázka a netreba uvádzať príponu.

### Zobrazenie obrázka

Najprv si pripravíme jeden obrázok.

![Swift](../../RESOURCE/003_img.jpg)

V Xcode vyberte priečinok Assets a pretiahnite obrázok do Assets.

![Swift](../../RESOURCE/003_img1.png)

V ContentView použite Image na zobrazenie obrázka:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Poznámka: SwiftUI Image nepodporuje prehrávanie GIF animácií, dokáže zobraziť iba statický snímok.

### Ovládanie veľkosti obrázka

V SwiftUI sa Image predvolene zobrazuje v pôvodnej veľkosti. Ak chceme zmeniť jeho veľkosť, musíme najprv použiť resizable, aby sa obrázok mohol škálovať, a potom pomocou frame určiť veľkosť rozloženia.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifikátor resizable

Modifikátor resizable umožňuje obrázku škálovať sa v rozložení namiesto toho, aby vždy používal svoju pôvodnú veľkosť.

```swift
.resizable()
```

Až po pridaní resizable() môže frame skutočne zmeniť zobrazenú veľkosť obrázka.

Ak resizable vynecháme:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

frame len poskytne obrázku priestor v rozložení, ale samotná veľkosť obrázka sa nezmení.

### Modifikátor frame

frame(width:height) slúži na určenie šírky a výšky zobrazenia.

Základné použitie:

```swift
.frame(width: 10,height: 10)
```

Napríklad nastavíme obrázok na obdĺžnik so šírkou 300 a výškou 100:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Môžeme nastaviť aj len šírku alebo len výšku:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinácia resizable + frame umožňuje pružne riadiť veľkosť zobrazenia obrázka v rozhraní a zároveň zachovať možnosť škálovania.

### Pomer strán: scaledToFit a scaledToFill

Ak nastavíme frame s iným pomerom šírky a výšky než má obrázok, obrázok sa môže natiahnuť a deformovať.

Ak chceme zachovať proporcie obrázka a zároveň ho prispôsobiť dostupnému priestoru, môžeme použiť scaledToFit alebo scaledToFill.

**scaledToFit**

scaledToFit zachová pôvodný pomer strán obrázka a zmenší alebo zväčší ho tak, aby sa celý zmestil do dostupného priestoru bez orezania:

```swift
.scaledToFit()
```

alebo

```swift
.aspectRatio(contentMode: .fit)
```

Tento spôsob je vhodný tam, kde chceme zobraziť celý obrázok a nechceme jeho deformáciu.

Ak všetkým obrázkom nastavíme rovnakú šírku a výšku, ľahko dôjde k ich natiahnutiu.

Napríklad:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Bez nastavenia pomeru strán sa obrázok nezobrazí vo svojich pôvodných proporciách.

![Swift](../../RESOURCE/003_img4.png)

Použitie scaledToFit umožní zachovať pôvodný pomer strán.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

scaledToFill tiež zachová pomer strán obrázka, ale vyplní celý dostupný priestor. Ak sa pomery nezhodujú, presahujúca časť sa oreže:

```swift
.scaledToFill()
```

alebo

```swift
.aspectRatio(contentMode: .fill)
```

Tento spôsob je vhodný pre prípady, keď má obrázok pokryť celú oblasť, napríklad ako pozadie alebo banner. Hodí sa najmä na použitie obrázka ako pozadia.

**Rozdiel medzi nimi**

![Swift](../../RESOURCE/003_img6.png)

## Text

V SwiftUI sa Text používa na zobrazovanie textu.

Základné použitie:

```swift
Text("FangJunyu")
```

Text sme už spoznali v predchádzajúcej lekcii. Tentoraz sa ďalej naučíme, ako riadiť veľkosť a hrúbku písma, aby bol text vo View výraznejší.

### Veľkosť písma

Na ovládanie veľkosti textu sa používa modifikátor font:

```swift
.font(.title)
```

Napríklad:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Bežné veľkosti písma (od najväčšej po najmenšiu):

```id="4y2pyk"
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Hrúbka písma

Ak chceme text zvýrazniť tučným písmom, môžeme použiť modifikátor fontWeight:

```swift
.fontWeight(.bold)
```

Napríklad:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Bežné hrúbky písma (od najtenšej po najhrubšiu):

```id="dv90xm"
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

font riadi veľkosť písma a fontWeight riadi jeho hrúbku. Obe sa dajú používať spolu, aby text pôsobil výraznejšie.

## Zhrnutie a prax

Doteraz sme sa naučili základy SwiftUI, ako sú predvolené rozloženie, Spacer, Image a Text. Tieto poznatky už stačia na vytváranie niektorých jednoduchých zobrazení.

Napríklad: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Rozhranie Google je veľmi čisté. Obsahuje obrázky aj text a môžeme sa pokúsiť analyzovať jeho štruktúru z pohľadu SwiftUI:

1. Celok sa skladá z troch častí: logo Google, vyhľadávacie pole a pomocný text. Na zvislé usporiadanie môžeme použiť VStack.
2. Logo Google je obrázok, takže ho môžeme zobraziť pomocou Image.
3. Vyhľadávacie pole obsahuje vstupné pole a ikonu. Ak dočasne ignorujeme vstupné pole, ikonu vyhľadávania môžeme zobraziť pomocou Image.
4. Pomocný text zobrazíme pomocou Text, vodorovné usporiadanie textu môžeme vytvoriť cez HStack a farbu textu možno riadiť pomocou foregroundStyle.

Precvičovaním týchto poznatkov môžeme vytvárať jednoduché zobrazenia a zároveň si prehĺbiť pochopenie a používanie zobrazení Image a Text aj ich modifikátorov.
