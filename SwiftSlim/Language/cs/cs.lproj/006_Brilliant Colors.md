# Zářivé barvy

V této lekci se naučíme běžné vizuální modifikátory ve SwiftUI, včetně:

- barvy
- barvy popředí
- barvy pozadí
- posunu
- průhlednosti
- rozmazání

Zároveň se seznámíme i se `Safe Area` (bezpečnou oblastí).

Tyto modifikátory slouží k řízení vzhledu zobrazení a pomáhají udělat rozhraní přehlednější a vrstevnatější.

## Barvy

Ve SwiftUI můžeme nastavit barvu textu.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` znamená modrou barvu a ve skutečnosti je to zjednodušený zápis `Color.blue` (díky odvození typu).

Mezi běžné barvy patří:

```
.black
.green
.yellow
.pink
.gray
...
```

To všechno jsou statické vlastnosti typu `Color`.

![Color](../../RESOURCE/006_color.png)

`Color` si můžete představit jako typ barvy a `.blue`, `.red` a další jako jeho konkrétní hodnoty.

### Zobrazení Color

Ve SwiftUI může `Color` fungovat také jako samostatné zobrazení.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Tento kód vytvoří červený čtverec o velikosti `100 × 100`.

Stejně tak můžeme nechat celé rozhraní zobrazit v určité barvě:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Po spuštění si všimneme, že červená nevyplňuje celou obrazovku. Horní a dolní část iPhonu zůstávají bílé, a zde vstupuje do hry `Safe Area`.

## Safe Area（bezpečná oblast）

`Safe Area` je oblast, kterou systém vyhrazuje proto, aby obsah nebyl zakrytý. Patří sem:

1. horní stavový řádek (čas, baterie)

2. spodní indikátor plochy Home

3. oblast výřezu (`notch`) nebo Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI ve výchozím nastavení omezuje obsah na bezpečnou oblast, takže zobrazení nesahá až k okrajům obrazovky.

### Ignorování Safe Area（bezpečné oblasti）

Pokud chceme, aby barva vyplnila celou obrazovku, můžeme použít `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Nebo `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Tím se zobrazení roztáhne přes celou obrazovku.

Je třeba poznamenat, že `edgesIgnoringSafeArea` je starší způsob zápisu. Od iOS 14 se doporučuje používat `ignoresSafeArea`.

## Barva popředí

### Modifikátor foregroundStyle

V předchozích lekcích jsme se už učili nastavovat barvu pomocí `foregroundStyle`.

Například:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` je novější stylový systém a podporuje barvy, přechody, materiály a další efekty.

![Color](../../RESOURCE/006_color2.png)

### Modifikátor foregroundColor

Barvu můžeme nastavit i pomocí `foregroundColor`:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Použití je stejné jako u `foregroundStyle`.

V nejnovějších verzích Xcode však Xcode upozorňuje, že `foregroundColor` může být v budoucích verzích iOS zastaralý, a doporučuje přednostně používat `foregroundStyle`.

## Pozadí

Pokud chceme zobrazení přidat barvu pozadí, můžeme použít `background`:

```swift
background(.red)
```

Například přidání barvy pozadí k textu:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Podobný efekt pozadí můžeme vidět například při výběru textu ve Wordu nebo Chrome.

![Color](../../RESOURCE/006_color16.png)

Pokud chceme pozadí zvětšit, musíme jej kombinovat s `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Zde je potřeba si zapamatovat jedno důležité pravidlo:

Modifikátory ve SwiftUI se aplikují shora dolů. Modifikátor napsaný později působí na výsledek vytvořený těmi předchozími.

Takže:

```swift
.padding()
.background()
```

to znamená, že pozadí obalí zobrazení až po přidání vnitřního odsazení.

Pokud pořadí obrátíme:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

pozadí se nezvětší, protože neobaluje pozdější `padding`.

## Příklad - čtyřhranná matice

Nyní vytvoříme jednoduché zobrazení připomínající čtyřhrannou matici.

![Color](../../RESOURCE/006_color8.png)

Nejprve vytvoříme bílý čtverec o velikosti `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Pokud z něj chceme udělat kruh, můžeme použít `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Když je poloměr zaoblení roven polovině šířky a výšky, vznikne kruh.

Teď přidáme modré pozadí:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Nově přidaný `padding` zvětší vnější oblast a `background` na ni vykreslí modrou barvu.

Tím vznikne efekt čtyřhranné matice.

### Jiný přístup

Kromě použití barvy pozadí můžeme stejného efektu dosáhnout i pomocí `ZStack`.

Dříve jsme se učili, že `ZStack` umožňuje vrstvené řazení, a tuto čtyřhrannou matici můžeme také chápat jako překrytí kruhu a obdélníku.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` skládá zobrazení nad sebe podle pořadí, takže později přidané zobrazení se zobrazí nahoře.

## Příklad - dva překrývající se kruhy

Mnoho ikon je vytvořeno překrytím jednoduchých tvarů, například dvou kruhů.

![Color](../../RESOURCE/006_color14.png)

Nejprve vytvoříme dva kruhy:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Protože chceme, aby se dva kruhy překrývaly, použijeme rozvržení `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

V tuto chvíli se oba stejně velké kruhy zcela překrývají.

My ale potřebujeme, aby se překrývaly jen částečně, nikoli úplně. K tomu můžeme použít `offset` a vytvořit efekt posunutí.

## Posun

`offset` mění pouze vykreslenou pozici zobrazení, ale neovlivňuje výpočet rozvržení v rodičovském zobrazení.

Použití:

```swift
.offset(x:y:)
```

`x` je vodorovná hodnota posunu, `y` svislá hodnota posunu.

Kladné hodnoty znamenají posun doprava nebo dolů, záporné hodnoty posun doleva nebo nahoru.

Pomocí `offset` nastavíme částečné překrytí dvou kruhů:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Pozice červeného kruhu v rozvržení se nezměnila, ale jeho vykreslení se posunulo o `25` bodů doleva. Díky tomu vznikne vizuální efekt částečného překrytí.

## Průhlednost

Ve SwiftUI se `opacity` používá k nastavení průhlednosti zobrazení.

Základní použití:

```swift
.opacity(0.5)
```

Rozsah parametru `opacity` je od `0.0` do `1.0`, kde:

- `0` znamená úplnou průhlednost
- `1` znamená neprůhlednost

Pomocí `opacity` můžeme nastavit průhlednost oranžového kruhu:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Když nastavíme `opacity` oranžového kruhu na `0.8`, znamená to 80% neprůhlednost. Když se kruhy překrývají, v překryté oblasti vznikne efekt míchání barev.

## Rozmazání

Ve SwiftUI lze efekt rozmazání vytvořit pomocí `blur`:

```swift
.blur(radius:10)
```

`radius` určuje poloměr rozmazání. Čím vyšší hodnota, tím silnější rozmazání.

Rozmazání můžeme přidat oběma kruhům:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Výsledkem budou dva velmi rozmazané kruhy.

## Shrnutí

Tato lekce se zaměřila na běžné vizuální modifikátory ve SwiftUI a ukázala, jak lze pomocí modifikátorů řídit barvu, pozici i vizuální efekty zobrazení.

Na konkrétních příkladech jsme viděli skutečné použití různých vizuálních modifikátorů v rozhraní a zároveň jsme se seznámili s bezpečnou oblastí.

To vše jsou velmi základní modifikátory. Čím více je budeme procvičovat a používat, tím snazší bude v reálném vývoji přesněji řídit vzhled rozhraní.

### Cvičení po lekci

- Přidejte obrázku průhlednost a rozmazání
- Nastavte tři kruhy s různou průhledností, které se překrývají
- Vytvořte obrázek na pozadí, který vyplní celou obrazovku a ignoruje bezpečnou oblast
- Použijte `offset` k úpravě pozice více zobrazení

Smyslem cvičení není mechanicky si zapamatovat API, ale pozorovat vztah mezi vizuální změnou a chováním rozvržení.
