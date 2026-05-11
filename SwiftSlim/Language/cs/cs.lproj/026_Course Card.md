# Karta kurzu

Tato lekce je průběžná opakovací lekce, ve které dokončíme „kartu kurzu“.

Pomocí tohoto cvičení si můžeme zopakovat dříve naučené prvky, jako jsou `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, a naučíme se, jak spojit několik malých view do jednoho kompletního modulu view.

Výsledek karty kurzu:

![view](../../../Resource/026_view.png)

Tato karta kurzu obsahuje hlavně několik částí:

- Úroveň kurzu: `Začátečník`
- Obsah kurzu: `20+ lekcí`
- Název kurzu: `Kurz SwiftUI pro začátečníky`
- Popis kurzu
- Tlačítko: `Začít se učit`
- Pozadí kurzu: ikona Swiftu a indigové pozadí

Toto view můžeme dokončit v `ContentView`.

## Horní oblast

Nejprve vytvoříme horní oblast karty kurzu.

![view](../../../Resource/026_view1.png)

V levé části horní oblasti se zobrazuje úroveň kurzu, v pravé části se zobrazuje obsah kurzu.

Protože jsou tyto dvě položky uspořádány vodorovně, můžeme použít `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Začátečník")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lekcí")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Zde jsme horní oblast rozdělili do jedné vypočítané vlastnosti:

```swift
var topView: some View
```

Výhodou je, že `body` bude přehlednější.

Horní oblast používá hlavně tyto prvky:

- `HStack`: umožní vodorovně uspořádat dva texty.
- `Text`: zobrazí textový obsah.
- `Spacer()`: posune levý text doleva a pravý text doprava.
- `.font(.footnote)`: nastaví menší styl písma.
- `.fontWeight(.bold)`: nastaví tučné písmo.
- `.foregroundStyle(Color.white)`: nastaví barvu popředí na bílou.
- `.padding(.vertical, 10)`: nastaví horní a dolní vnitřní odsazení.
- `.padding(.horizontal, 16)`: nastaví levé a pravé vnitřní odsazení.
- `.background(Color.white.opacity(0.15))`: nastaví poloprůhledné bílé pozadí.
- `.cornerRadius(20)`: nastaví zaoblené rohy.

U textu `Začátečník` jsme použili `.padding()` ve dvou směrech:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Díky tomu má text prostor nahoře, dole, vlevo i vpravo, takže vypadá více jako štítek.

`Color.white.opacity(0.15)` znamená bílou barvu s neprůhledností `15 %`, tedy velmi světlou bílou.

### Přidání pozadí karty

Předtím jsme vytvořili `topView`, ale samotné vytvoření view ještě neznamená, že se automaticky zobrazí.

Ve SwiftUI musí být obsah, který se má skutečně zobrazit na obrazovce, napsán v `body`.

Proto můžeme nejprve vložit `topView` do `body` a zobrazit ho:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

V tuto chvíli už uvidíme, že se horní oblast zobrazila:

![view](../../../Resource/026_view2.png)

Protože je však text v `topView` bílý a výchozí pozadí je také světlé, ve světlém režimu nemusí být dobře čitelný.

Proto můžeme na vnější vrstvu přidat `VStack` a celé oblasti nastavit vnitřní odsazení, barvu pozadí a zaoblené rohy:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view3.png)

V tomto `VStack` je zatím jen jeden `topView`, takže to může vypadat, jako by nebyl nutný.

Později ale ještě přidáme název kurzu, popis kurzu a oblast tlačítka. Všechny tyto položky jsou uspořádány shora dolů, takže zde předem použijeme `VStack`, což nám usnadní další skládání view.

Zde jsou dvě `.padding()` a jejich účinky se liší.

První `.padding(20)` je napsané před `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Ovládá vnitřní odsazení karty, tedy vzdálenost mezi obsahem a okrajem pozadí.

Druhé `.padding(30)` je napsané za `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ovládá vnější odsazení karty, tedy vzdálenost mezi celou kartou a okrajem obrazovky.

![view](../../../Resource/026_view4.png)

Proto i když jde v obou případech o `.padding()`, umístění v různých pozicích způsobí odlišný výsledek.

## Oblast obsahu

Dále vytvoříme oblast obsahu karty kurzu.

Výsledek zobrazení:

![view](../../../Resource/026_view5.png)

Oblast obsahu obsahuje název kurzu a popis kurzu. Jsou uspořádány shora dolů, takže použijeme `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Kurz SwiftUI pro začátečníky")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Začněte od nuly se SwiftUI a systematicky se učte deklarativní vývoj uživatelského rozhraní pro Apple platformy. Díky srozumitelnému výkladu a praktickým příkladům si postupně osvojíte rozvržení, interakce a správu stavu, abyste mohli vytvářet krásná a užitečná rozhraní aplikací.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view6.png)

V tomto `VStack` jsme použili dva parametry:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` znamená, že view uvnitř `VStack` budou zarovnána doleva.

`spacing: 10` znamená, že mezi view uvnitř `VStack` bude zachován rozestup `10 pt`.

Název kurzu a popis kurzu se tedy začnou řadit od levé strany a mezi nimi zůstane určitý odstup.

Popis kurzu je poměrně dlouhý. Pokud by se zobrazil celý, karta by byla velmi vysoká, proto zde použijeme `.lineLimit()` k omezení počtu zobrazených řádků:

```swift
.lineLimit(3)
```

To znamená, že se zobrazí maximálně `3` řádky. Když obsah přesáhne tento limit, přebytečná část bude zkrácena.

### Zarovnání view doleva

Zde je potřeba si všimnout ještě jedné věci.

`VStack(alignment: .leading)` dokáže ovládat pouze zarovnání view uvnitř `VStack`. Neovládá přímo pozici samotného `VStack` ve vnějším kontejneru.

Například když je popis kurzu krátký:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Kurz SwiftUI pro začátečníky")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Jen nějaký obsah.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view7.png)

Můžeme vidět, že název kurzu a popis kurzu jsou sice uvnitř `VStack` zarovnány doleva, ale celý `VStack` se nepřisunul k levému okraji karty.

Je to proto, že když je obsah krátký, šířka `VStack` bude také poměrně úzká. Při rozvržení může vnější kontejner umístit tento užší `VStack` doprostřed.

Můžeme to chápat takto: `VStack(alignment: .leading)` odpovídá za vnitřní zarovnání doleva.
Neodpovídá ale za posunutí celé oblasti obsahu k levému okraji.

Pokud chceme, aby se celá oblast obsahu skutečně přisunula doleva, můžeme ji zvenku ještě obalit do `HStack` a přidat `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kurz SwiftUI pro začátečníky")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Jen nějaký obsah.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view8.png)

Zde je `HStack` vodorovné rozvržení.

`Spacer()` obsadí zbývající prostor napravo, čímž posune levý `VStack` úplně doleva.

Proto lze `HStack + Spacer()` použít k ovládání pozice celé oblasti obsahu.

Ve skutečné kartě kurzu je popis kurzu poměrně dlouhý a obvykle zabere větší šířku, takže tento problém nemusí být příliš zřejmý. Je však důležité tento rozdíl pochopit, protože při pozdější tvorbě rozvržení s krátkým textem se s podobnými situacemi budeme setkávat často.

### Řízení vzdálenosti mezi vnitřními view

Předtím jsme do `VStack` napsali `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` slouží k řízení vzdálenosti mezi vnitřními view.

Pokud `spacing` nenastavíme, `VStack` bude mít také výchozí rozestup, ale výchozí rozestup nemusí vždy odpovídat požadovanému výsledku.

Zde by příliš malá vzdálenost mezi názvem kurzu a popisem kurzu působila stísněně, proto použijeme:

```swift
spacing: 10
```

Díky tomu mezi nimi zůstane trochu prostoru.

Výsledek zobrazení:

![view](../../../Resource/026_view9.png)

Stejně tak jsou horní oblast a oblast obsahu uspořádány shora dolů, takže i jejich vzdálenost můžeme ovládat pomocí `spacing`.

Nyní vložíme `topView` a `contentView` do `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view10.png)

Zde `VStack(spacing: 20)` ovládá vzdálenost mezi `topView` a `contentView`.

Jinými slovy:

```swift
VStack(alignment: .leading, spacing: 10)
```

ovládá vzdálenost mezi názvem kurzu a popisem kurzu.

```swift
VStack(spacing: 20)
```

ovládá vzdálenost mezi horní oblastí a oblastí obsahu.

Obě používají `spacing`, ale působí na různé `VStack`, takže ovlivňují odlišný rozsah.

Tím je view oblasti obsahu dokončeno.

## Oblast tlačítka

Dále vytvoříme spodní oblast tlačítka.

Výsledek zobrazení:

![view](../../../Resource/026_view11.png)

Oblast tlačítka se skládá hlavně z ikony přehrávání a textu.

K zobrazení ikony přehrávání můžeme použít `Image` a k zobrazení textu tlačítka `Text`.

Nejprve vytvoříme vzhled tlačítka:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("kliknutí na tlačítko")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Začít se učit")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view12.png)

Zde jsme použili dva `HStack`:

Vnitřní `HStack` slouží k vodorovnému uspořádání ikony a textu:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Začít se učit")
}
```

Vnější `HStack` ve spojení se `Spacer()` slouží k tomu, aby se vzhled tlačítka zobrazil vlevo:

```swift
HStack {
    ...
    Spacer()
}
```

Po kliknutí na tlačítko konzole vypíše `kliknutí na tlačítko`.

## Základní karta je hotová

Nyní spojíme horní oblast, oblast obsahu a oblast tlačítka:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/026_view13.png)

Tím je základní karta kurzu dokončena.

## Pozadí s ikonou Swiftu

Nakonec ke kartě přidáme poloprůhlednou ikonu Swiftu jako pozadí.

![view](../../../Resource/026_view.png)

Předtím jsme jako barvu pozadí použili `Color.indigo`. Ve skutečnosti může `.background()` kromě barvy přidat také celé view.

Proto můžeme nejprve vytvořit samostatné view pozadí:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

V tomto view pozadí používáme `VStack`, `HStack` a `Spacer()`, abychom ikonu Swiftu posunuli do pravého dolního rohu.

Protože ikona Swiftu slouží pouze jako dekorativní pozadí, používáme zde poloprůhlednou bílou barvu:

```swift
Color.white.opacity(0.15)
```

Díky tomu ikona nebude příliš výrazná a nebude rušit textový obsah v popředí.

Poté přidáme `backgroundView` do karty:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Výsledek:

![view](../../../Resource/026_view14.png)

Zde jsme za sebou použili dvě `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

První `.background()` slouží k přidání pozadí s ikonou Swiftu.
Druhé `.background()` slouží k přidání indigového pozadí.

Tím se ikona Swiftu zobrazí nad indigovým pozadím a bude zobrazena jako součást pozadí karty.

Z toho je vidět, že `.background()` může kromě barvy přidat také vlastní view. Více `.background()` lze také kombinovat, a vytvořit tak bohatší efekty pozadí.

Tím je kompletní karta kurzu dokončena.

## Shrnutí

V této lekci jsme si pomocí karty kurzu zopakovali běžné základní způsoby rozvržení ve SwiftUI.

Použili jsme `Text` k zobrazení textu, `Image` k zobrazení systémové ikony a `VStack`, `HStack` a `Spacer()` k řízení uspořádání view.

Naučili jsme se `.lineLimit()`, které dokáže omezit maximální počet zobrazených řádků textu. Když obsah limit překročí, přebytečná část se zkrátí.

Zároveň jsme si zopakovali běžné modifikátory, jako jsou `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()`.

Po dokončení této lekce už dokážeme spojit několik malých view do jednoho kompletního modulu karty.

To je ve vývoji se SwiftUI velmi běžný způsob uvažování: nejprve rozdělit rozhraní na malá view a poté je složit do kompletní obrazovky.

## Úplný kód

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Začátečník")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lekcí")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Kurz SwiftUI pro začátečníky")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Začněte od nuly se SwiftUI a systematicky se učte deklarativní vývoj uživatelského rozhraní pro Apple platformy. Díky srozumitelnému výkladu a praktickým příkladům si postupně osvojíte rozvržení, interakce a správu stavu, abyste mohli vytvářet krásná a užitečná rozhraní aplikací.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("kliknutí na tlačítko")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Začít se učit")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
