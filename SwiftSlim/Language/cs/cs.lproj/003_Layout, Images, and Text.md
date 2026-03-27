# Rozvržení, obrázky a text

V minulé lekci jsme se seznámili s kódem `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

V této lekci se naučíme výchozí mechanismus rozvržení ve SwiftUI a také způsoby použití obrázků a textu. Na základě minulé lekce dále prohloubíme naše porozumění struktuře a zobrazování pohledů (views). Tyto znalosti nám pomohou při vytváření základního rozvržení uživatelského rozhraní.

## Výchozí mechanismus rozvržení ve SwiftUI

Při náhledu pohledu `ContentView` si můžeme všimnout, že ikona a text jsou zobrazeny uprostřed, nikoli seřazeny odshora.

![Swift](../../RESOURCE/003_view.png)

Ve výchozím nastavení je zarovnání kontejneru Stack nastaveno na `.center`, takže podřízené pohledy (subviews) se obvykle zobrazují vycentrované.

### Zarovnání (Alignment)

Je zřejmé, že vycentrování je pouze jedním ze způsobů zarovnání. Pokud chceme zarovnat prvky doleva nebo doprava, musíme k ovládání zarovnání pohledů použít `alignment`.

```swift
alignment
```

Ve SwiftUI se zarovnání obvykle objevuje ve dvou scénářích:

**1. Parametr zarovnání kontejneru Stack**

Například zarovnání ikony a textu v `ContentView` doleva:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

Parametr `alignment` u `VStack` řídí způsob zarovnání v horizontálním směru.

Způsoby zarovnání:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` zajišťuje horizontální uspořádání a `alignment` zde řídí způsob zarovnání ve vertikálním směru:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` slouží k překrývání prvků na sebe a `alignment` může řídit zarovnání v horizontálním i vertikálním směru:

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

Pokud `alignment` explicitně nespecifikujete, výchozí hodnota pro `VStack`, `HStack` i `ZStack` je `.center`.

**2. Zarovnání uvnitř modifikátoru frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Když jsou rozměry poskytnuté modifikátorem `frame` větší než vlastní velikost pohledu, `alignment` určuje umístění pohledu uvnitř `frame`. Konkrétní použití `frame` si vysvětlíme podrobněji později, zde se s ním jen stručně seznámíme.

### Spacer a mechanismus rozdělování prostoru

Zarovnání (`alignment`) umožňuje seřadit pohledy v horizontálním nebo vertikálním směru. Pokud ale chceme, aby se text a obrázek zobrazovaly na opačných koncích, samotné zarovnání už našim požadavkům stačit nebude.

Představme si například, že chceme vytvořit horní pohled jako na webu [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), kde je na levé straně logo NHK a na pravé straně ikona pro menu webu.

![Swift](../../RESOURCE/003_alignment3.png)

Pokud bychom použili pouze `alignment`, ikona webu NHK i ikona menu by se zobrazily pouze na jedné straně. Nebylo by možné tyto dvě ikony rozmístit na levou a pravou stranu, a proto potřebujeme použít `Spacer` pro rozdělení zbývajícího prostoru.

`Spacer` je flexibilní pohled používaný pro rozvržení, který dokáže automaticky vyplnit zbývající prostor.

Způsob použití:

```swift
Spacer()
```

Například:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Když přidáme `Spacer` mezi `Image` a `Text`, `Spacer` vyplní zbývající prostor a odtlačí `Image` a `Text` k hornímu a dolnímu okraji.

![Swift](../../RESOURCE/003_view1.png)

Pokud existuje více pohledů `Spacer`:

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

Zbývající prostor bude mezi pohledy `Spacer` rozdělen rovnoměrně.

![Swift](../../RESOURCE/003_spacer.png)

## Zobrazování a kontrola velikosti u Image

Pohled `Image` se primárně používá k zobrazování obrázků. Ikony SF Symbols, které jsme se naučili v minulé lekci, jsou pouze jedním ze způsobů využití `Image`.

Způsob použití:

```swift
Image("imageName")
```

V uvozovkách uvnitř `Image` je název obrázku, přičemž není nutné psát příponu souboru.

### Zobrazení obrázku

Nejprve si připravíme obrázek.

![Swift](../../RESOURCE/003_img.jpg)

V Xcode vybereme složku zdrojů Assets a obrázek do ní přetáhneme.

![Swift](../../RESOURCE/003_img1.png)

V `ContentView` použijeme `Image` k zobrazení obrázku:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Poznámka: `Image` ve SwiftUI nepodporuje přehrávání GIF animací (dokáže zobrazit pouze statický snímek).

### Kontrola velikosti obrázku

Ve SwiftUI se `Image` ve výchozím stavu zobrazuje v původní velikosti obrázku. Pokud chceme upravit velikost jeho zobrazení, musíme nejprve použít `resizable`, aby byl obsah obrázku škálovatelný, a poté použít `frame` k určení velikosti rozvržení.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifikátor resizable

Modifikátor `resizable` umožňuje obrázku zapojit se do škálování v rozvržení, místo aby fixně používal svou původní velikost.

```swift
.resizable()
```

Pouze po přidání `resizable()` může `frame` skutečně změnit velikost zobrazení obrázku.

Pokud `resizable` vynecháme:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` pouze poskytne obrázku prostor pro rozvržení, ale samotná velikost obrázku se nezmění.

### Modifikátor frame

`frame(width:height)` se používá k určení šířky a výšky pohledu.

Základní použití:

```swift
.frame(width: 10,height: 10)
```

Například nastavení obrázku jako obdélníku o šířce (`width`) 300 a výšce (`height`) 100.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Lze také nastavit šířku nebo výšku samostatně:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinace `resizable` a `frame` dokáže flexibilně ovládat velikost zobrazení obrázku v rozhraní a zároveň mu zachovat schopnost škálování.

### Poměr měřítka: scaledToFit a scaledToFill

Když použijeme `frame` s poměrem stran, který neodpovídá originálu, může dojít k deformaci obrázku protažením.

Pokud chceme, aby se obrázek přizpůsobil dostupnému prostoru v rozvržení a zároveň si zachoval svůj původní poměr stran, můžeme použít `scaledToFit` nebo `scaledToFill`.

**scaledToFit**

`scaledToFit` zachová původní poměr šířky a výšky obrázku a zmenší/zvětší jej tak, aby se celý vešel do dostupného prostoru, přičemž nedojde k oříznutí obrázku:

```swift
.scaledToFit()
```

Nebo

```swift
.aspectRatio(contentMode: .fit)
```

Tento způsob je vhodný pro situace, kdy je potřeba zobrazit obrázek celý a nechceme, aby se zdeformoval.

Pokud bychom u každého obrázku nastavili stejnou šířku a výšku, nevyhnutelně by došlo k jejich natažení/deformaci.

Například:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Dokud není nastaven poměr škálování, obrázek se nemůže zobrazit ve svých přirozených proporcích.

![Swift](../../RESOURCE/003_img4.png)

Nastavení `scaledToFit` umožní obrázku zachovat svůj původní poměr stran.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` rovněž zachovává poměr stran obrázku, ale vyplní celý dostupný prostor. Pokud se poměr liší, přesahující části budou oříznuty:

```swift
.scaledToFill()
```

Nebo

```swift
.aspectRatio(contentMode: .fill)
```

Tento způsob se hodí pro situace, kdy má obrázek pokrýt celou oblast, například jako obrázek na pozadí nebo banner. Je ideální pro scénáře s obrázky na pozadí.

**Rozdíl mezi nimi**

![Swift](../../RESOURCE/003_img6.png)

## Text

Ve SwiftUI se `Text` používá k zobrazení textu.

Základní použití:

```swift
Text("FangJunyu")
```

O `Text` jsme se učili už v minulé lekci, v této lekci se naučíme, jak ovládat velikost a tloušťku písma, aby měl text v pohledu větší výraznost.

### Velikost písma

Ke kontrole velikosti textu se používá modifikátor `font`:

```swift
.font(.title)
```

Například:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Běžně používané velikosti písma (od největší po nejmenší):

```
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

### Tloušťku písma

Pokud chcete text ztučnit, můžete použít modifikátor `fontWeight`:

```swift
.fontWeight(.bold)
```

Například:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Běžně používané tloušťky písma (od nejtenčí po nejtlustší):

```
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

`font` ovládá velikost písma a `fontWeight` ovládá jeho tloušťku. Obě vlastnosti lze kombinovat, čímž získáte bohatší možnosti formátování textu.

## Shrnutí a praxe

Dosud jsme se naučili základní znalosti o výchozím rozvržení ve SwiftUI, o `Spacer`, `Image` a `Text`. Tyto znalosti jsou již dostačující pro vývoj jednoduchých pohledů.

Například: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Rozhraní Googlu je velmi čisté a obsahuje obrázky a text. Můžeme se pokusit analyzovat strukturu uživatelského rozhraní Googlu z pohledu SwiftUI:

1. Celek je rozdělen do tří částí: logo Google, vyhledávací pole a textová nápověda. K jejich vertikálnímu uspořádání lze použít `VStack`.
2. Logo Google je obrázek, který lze zobrazit pomocí `Image`.
3. Vyhledávací pole obsahuje textové pole a ikonu. Pokud pomineme textové pole, můžeme ikonu hledání zobrazit pomocí `Image`.
4. Text nápovědy se zobrazuje pomocí `Text`, k horizontálnímu uspořádání textu lze použít `HStack` a barvu písma lze upravit pomocí `foregroundStyle`.

Procvičováním těchto znalostí můžeme vytvářet jednoduché pohledy, a prohloubit tak naše porozumění a schopnost používat pohledy `Image` a `Text` včetně jejich modifikátorů.
