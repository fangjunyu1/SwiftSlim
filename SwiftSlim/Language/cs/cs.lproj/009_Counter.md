# Počítadlo

V předchozích dvou lekcích jsme se učili o proměnných, konstantách, tlačítkách a funkcích.

V této lekci tyto znalosti spojíme dohromady a vytvoříme jednoduchou aplikaci počítadla.

Na tomto příkladu se naučíme, jak proměnné ukládat a měnit a jak k jejich správě používat `@State`.

## Vytvoření počítadla

Počítadlo se běžně používá k zaznamenávání hodnot, které je potřeba průběžně navyšovat, například počtu přeskoků přes švihadlo nebo počtu uběhnutých kol.

Teď si vytvoříme jednoduché počítadlo: zobrazíme číslo a tlačítko a po kliknutí na tlačítko se číslo zvýší.

![Num](../../RESOURCE/009_num.png)

### Zobrazení čísla

Nejprve použijeme `Text` pro zobrazení čísla.

```swift
Text("0")
```

Pokud se ale číslo má měnit, nemůžeme přímo napevno psát `"0"`. Místo toho bychom měli číslo ukládat do proměnné.

```swift
var num = 0
```

Potom proměnnou zobrazíme v `Text`:

```swift
Text("\(num)")
```

Zde používáme interpolaci řetězce `\()`, aby se číslo převedlo na řetězec a mohlo se zobrazit.

### Tlačítko pro zvýšení čísla

Dále přidáme tlačítko.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Po kliknutí na tlačítko chceme, aby se číslo zvýšilo.

Proto můžeme uvnitř tlačítka proměnnou změnit:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Tento kód znamená: po kliknutí na tlačítko se spočítá `num + 1` a výsledek se přiřadí zpět do `num`.

### Stručnější zápis

Swift nabízí i stručnější způsob zápisu:

```swift
num += 1
```

To je ekvivalentní k:

```swift
num = num + 1
```

Tento způsob zápisu se nazývá složený operátor přiřazení.

Mezi běžné složené operátory přiřazení ve Swiftu patří:

```
+=   přiřazení sčítání
-=   přiřazení odčítání
*=   přiřazení násobení
/=   přiřazení dělení
%=   přiřazení zbytku po dělení
```

Například:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Kompletní kód

Teď můžeme napsat jednoduché počítadlo:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

V této podobě ale kód nepoběží správně.

### Chyba

Xcode zobrazí:

```
Cannot assign to property: 'self' is immutable
```

To znamená, že vlastnost nelze změnit, protože zobrazení je neměnné.

Proč se to děje?

## Jak SwiftUI funguje

Ve SwiftUI platí: **rozhraní je řízené daty**. To znamená, že když se data změní, rozhraní se automaticky aktualizuje.

Je ale důležité si uvědomit, že SwiftUI sleduje změny a obnovuje zobrazení jen tehdy, když se změní stav (`state`), například `@State` nebo `@Binding`.

Pokud použijeme běžnou proměnnou, SwiftUI její hodnotu načte jen jednou při vytvoření zobrazení. I když se hodnota později změní, rozhraní se už neaktualizuje.

Například:

```swift
var num = 0   // 0
num = 1   // 0
```

V tomto příkladu je `num` obyčejná proměnná. I když se její hodnota změnila, SwiftUI zobrazení neaktualizuje a rozhraní bude stále ukazovat původní `0`.

![Num](../../RESOURCE/009_state.png)

Proto SwiftUI automaticky sleduje změny a aktualizuje zobrazení pouze tehdy, když jsou data označena jako stav, například pomocí property wrapperů `@State`, `@Binding` a podobně.

## Property wrapper @State

Ve SwiftUI, pokud chceme proměnnou měnit a zároveň aktualizovat zobrazení, musíme použít `@State`.

```swift
@State var num = 0
```

`@State` způsobí, že SwiftUI tuto proměnnou sleduje.

Když se proměnná změní, SwiftUI znovu přepočítá zobrazení a aktualizuje ho.

Kompletní kód:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Nyní, když klikneme na tlačítko:

```swift
num += 1
```

SwiftUI rozpozná, že se `num` změnilo, a automaticky aktualizuje zobrazení.

![Num](../../RESOURCE/009_state1.png)

## Pravidla používání @State

V reálném vývoji se `@State` obvykle řídí dvěma pravidly.

### 1. @State se obvykle používá s private

Proměnné `@State` se obvykle používají jen v aktuálním typu, například v aktuální struktuře `View`, proto se běžně zapisují takto:

```swift
@State private var num = 0
```

Tím zabráníme jiným zobrazením, aby tuto proměnnou přímo používala nebo měnila.

`private` jsme ještě podrobně neprobírali, ale prozatím si to můžete jednoduše představit takto:

**Obsah označený jako `private` lze používat jen v aktuálním zobrazení, zvenčí dostupný není.**

### 2. @State se používá jen pro stav aktuálního zobrazení

`@State` je vhodný pro data, která si spravuje samotné aktuální `View`.

Například obsah vstupního pole nebo stav přepínače.

```swift
@State private var isOn = false
@State private var text = ""
```

Pokud je potřeba data sdílet mezi více zobrazeními, musíme použít jiné typy stavu, například `@Binding` nebo `@Observable`.

Tyto věci se budeme učit v pozdějších lekcích.

### Tlačítko pro snížení

Počítadlo nemusí jen přičítat, může také odečítat.

Můžeme přidat tlačítko `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Poté použijeme `HStack`, aby se tlačítka zobrazila vodorovně:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Výsledek:

![Num](../../RESOURCE/009_num1.png)

Po kliknutí na tlačítko `+` se číslo zvýší o `1`; po kliknutí na `-` se číslo sníží o `1`.

### Tlačítko pro reset

Můžeme také přidat tlačítko reset, které nastaví číslo zpět na `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Po kliknutí na tlačítko reset bude `num` nastaveno na `0`.

Výsledek:

![Num](../../RESOURCE/009_num2.png)

Po kliknutí na tlačítko `0` se číslo změní na `0`.

### Vlastní tlačítko

V tuto chvíli naše tlačítka stále umí zobrazovat jen text:

```swift
Button("+") {

}
```

Takto napsané tlačítko může zobrazovat jen textový obsah, například `+` nebo `-`.

V reálném vývoji ale obvykle chceme, aby vzhled tlačítka byl bohatší, například s ikonou nebo jiným zobrazením.

SwiftUI nám umožňuje vlastní obsah tlačítka přizpůsobit. V takovém případě můžeme použít jiný zápis tlačítka:

```swift
Button(action: {

}, label: {

})
```

V tomto zápisu `action` označuje kód, který se vykoná po kliknutí na tlačítko, a `label` představuje zobrazení tlačítka.

Například můžeme nechat tlačítko zobrazit ikonu ze systému SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Tím tlačítko už nebude zobrazovat text, ale ikonu.

### Vylepšení rozhraní počítadla

Aby bylo rozhraní počítadla přehlednější, můžeme také upravit styl zobrazení čísla. Například můžeme číslo zvětšit:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Dále změníme obsah tlačítek na ikony a vhodně zvětšíme i velikost ikon:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Stejně tak můžeme i tlačítko pro snížení a reset změnit na ikonovou podobu:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Nyní tlačítka zobrazují ikony ze SF Symbols a rozhraní je přehlednější.

![Num](../../RESOURCE/009_num3.png)

## Shrnutí

V této lekci jsme na jednoduchém počítadle souhrnně procvičili použití proměnných, `Text` a `Button`. Pomocí proměnné jsme ukládali číslo a pomocí tlačítek jsme řídili jeho zvyšování a snižování. Zároveň jsme se naučili složené operátory přiřazení, například `num += 1` a `num -= 1`.

Během implementace jsme pochopili, jak SwiftUI funguje: rozhraní je řízené daty. Když se data změní, rozhraní se obnoví. Proto musíme pro měnitelný stav používat `@State`. Když se proměnná `@State` změní, SwiftUI automaticky aktualizuje zobrazení.

Nakonec jsme rozhraní jednoduše vylepšili, upravili styl písma v `Text` a pomocí `Button(action:label:)` přizpůsobili obsah tlačítek, takže mohla zobrazovat ikony a rozhraní počítadla je jasnější a hezčí.

Nyní jsme se již dotkli základního způsobu používání zobrazení ve SwiftUI. Ve SwiftUI je většina rozhraní řízena proměnnými. Když se proměnná změní, SwiftUI zobrazení automaticky aktualizuje. Proto při vývoji aplikací ve SwiftUI obvykle nejdříve navrhneme, jaká data je potřeba ukládat, a teprve potom z těchto dat vytvoříme rozhraní a interakční logiku.

## Kompletní kód

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
