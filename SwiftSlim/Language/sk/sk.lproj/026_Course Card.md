# Karta kurzu

Táto lekcia je priebežné opakovanie, v ktorom dokončíme „kartu kurzu“.

Pomocou tohto cvičenia si môžeme zopakovať prvky, ktoré sme sa naučili skôr, napríklad `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()`, a naučíme sa, ako spojiť viac malých zobrazení do jedného kompletného modulu zobrazenia.

Výsledok karty kurzu:

![view](../../../Resource/026_view.png)

Táto karta kurzu obsahuje hlavne niekoľko častí:

- Úroveň kurzu: `Začiatočník`
- Obsah kurzu: `20+ lekcií`
- Názov kurzu: `Kurz SwiftUI pre začiatočníkov`
- Popis kurzu
- Tlačidlo: `Začať sa učiť`
- Pozadie kurzu: ikona Swiftu a indigové pozadie

Toto zobrazenie môžeme dokončiť v `ContentView`.

## Horná oblasť

Najprv vytvoríme hornú oblasť karty kurzu.

![view](../../../Resource/026_view1.png)

Na ľavej strane hornej oblasti sa zobrazuje úroveň kurzu, na pravej strane sa zobrazuje obsah kurzu.

Keďže sú tieto dve položky usporiadané vodorovne, môžeme použiť `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Začiatočník")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lekcií")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Tu sme hornú oblasť rozdelili do jednej vypočítanej vlastnosti:

```swift
var topView: some View
```

Výhodou je, že `body` bude prehľadnejšie.

Horná oblasť používa hlavne tieto prvky:

- `HStack`: umožňuje usporiadať dva texty vodorovne.
- `Text`: zobrazuje textový obsah.
- `Spacer()`: posunie ľavý text doľava a pravý text doprava.
- `.font(.footnote)`: nastaví menší štýl písma.
- `.fontWeight(.bold)`: nastaví tučné písmo.
- `.foregroundStyle(Color.white)`: nastaví farbu popredia na bielu.
- `.padding(.vertical, 10)`: nastaví horné a dolné vnútorné odsadenie.
- `.padding(.horizontal, 16)`: nastaví ľavé a pravé vnútorné odsadenie.
- `.background(Color.white.opacity(0.15))`: nastaví polopriehľadné biele pozadie.
- `.cornerRadius(20)`: nastaví zaoblené rohy.

Pri texte `Začiatočník` sme použili `.padding()` v dvoch smeroch:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Vďaka tomu má text priestor hore, dole, vľavo aj vpravo, takže vyzerá viac ako štítok.

`Color.white.opacity(0.15)` znamená bielu farbu s nepriehľadnosťou `15 %`, teda veľmi jemnú bielu.

### Pridanie pozadia karty

Predtým sme vytvorili `topView`, ale samotné vytvorenie zobrazenia ešte neznamená, že sa automaticky zobrazí.

V SwiftUI musí byť obsah, ktorý sa má skutočne zobraziť na obrazovke, napísaný v `body`.

Preto môžeme najprv vložiť `topView` do `body` a zobraziť ho:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

V tejto chvíli už uvidíme, že horná oblasť sa zobrazila:

![view](../../../Resource/026_view2.png)

Keďže je však text v `topView` biely a predvolené pozadie je tiež svetlé, vo svetlom režime nemusí byť dobre čitateľný.

Preto môžeme na vonkajšiu vrstvu pridať `VStack` a celej oblasti nastaviť vnútorné odsadenie, farbu pozadia a zaoblené rohy:

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

Výsledok zobrazenia:

![view](../../../Resource/026_view3.png)

V tomto `VStack` je zatiaľ iba jeden `topView`, takže to môže vyzerať, akoby nebol potrebný.

Neskôr však ešte pridáme názov kurzu, popis kurzu a oblasť tlačidla. Všetky tieto položky sú usporiadané zhora nadol, takže tu vopred použijeme `VStack`, čo nám uľahčí ďalšie skladanie zobrazení.

Tu sú dve `.padding()` a ich účinky sa líšia.

Prvé `.padding(20)` je napísané pred `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Ovláda vnútorné odsadenie karty, teda vzdialenosť medzi obsahom a okrajom pozadia.

Druhé `.padding(30)` je napísané za `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ovláda vonkajšie odsadenie karty, teda vzdialenosť medzi celou kartou a okrajom obrazovky.

![view](../../../Resource/026_view4.png)

Preto aj keď ide v oboch prípadoch o `.padding()`, umiestnenie na rôznych miestach spôsobí odlišný výsledok.

## Oblasť obsahu

Ďalej vytvoríme oblasť obsahu karty kurzu.

Výsledok zobrazenia:

![view](../../../Resource/026_view5.png)

Oblasť obsahu obsahuje názov kurzu a popis kurzu. Sú usporiadané zhora nadol, takže použijeme `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Kurz SwiftUI pre začiatočníkov")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Začnite od nuly so SwiftUI a systematicky sa učte deklaratívny vývoj používateľského rozhrania pre platformy Apple. Vďaka jasným vysvetleniam a praktickým príkladom si postupne osvojíte rozloženie, interakcie a správu stavu, aby ste mohli vytvárať pekné a užitočné rozhrania aplikácií.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/026_view6.png)

V tomto `VStack` sme použili dva parametre:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` znamená, že zobrazenia vo vnútri `VStack` budú zarovnané doľava.

`spacing: 10` znamená, že medzi zobrazeniami vo vnútri `VStack` bude zachovaný rozostup `10 pt`.

Názov kurzu a popis kurzu sa teda začnú radiť od ľavej strany a medzi nimi zostane určitý odstup.

Popis kurzu je pomerne dlhý. Ak by sa zobrazil celý, karta by bola veľmi vysoká, preto tu použijeme `.lineLimit()` na obmedzenie počtu zobrazených riadkov:

```swift
.lineLimit(3)
```

Znamená to, že sa zobrazia najviac `3` riadky. Keď obsah presiahne tento limit, nadbytočná časť sa skráti.

### Zarovnanie zobrazenia doľava

Tu si treba všimnúť ešte jednu vec.

`VStack(alignment: .leading)` dokáže ovládať iba zarovnanie zobrazení vo vnútri `VStack`. Neovláda priamo pozíciu samotného `VStack` vo vonkajšom kontajneri.

Napríklad keď je popis kurzu krátky:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Kurz SwiftUI pre začiatočníkov")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Len nejaký obsah.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Výsledok zobrazenia:

![view](../../../Resource/026_view7.png)

Môžeme vidieť, že názov kurzu a popis kurzu sú síce vo vnútri `VStack` zarovnané doľava, ale celý `VStack` sa neprisunul k ľavému okraju karty.

Je to preto, že keď je obsah krátky, šírka `VStack` bude tiež pomerne úzka. Pri rozložení môže vonkajší kontajner umiestniť tento užší `VStack` doprostred.

Môžeme to chápať takto: `VStack(alignment: .leading)` zodpovedá za vnútorné zarovnanie doľava.
Nezodpovedá však za posunutie celej oblasti obsahu k ľavému okraju.

Ak chceme, aby sa celá oblasť obsahu skutočne prisunula doľava, môžeme ju zvonka ešte obaliť do `HStack` a pridať `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kurz SwiftUI pre začiatočníkov")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Len nejaký obsah.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/026_view8.png)

Tu je `HStack` vodorovné rozloženie.

`Spacer()` obsadí zostávajúci priestor napravo, čím posunie ľavý `VStack` úplne doľava.

Preto možno `HStack + Spacer()` použiť na ovládanie pozície celej oblasti obsahu.

V skutočnej karte kurzu je popis kurzu pomerne dlhý a zvyčajne zaberie väčšiu šírku, takže tento problém nemusí byť veľmi zreteľný. Je však dôležité pochopiť tento rozdiel, pretože pri neskoršej tvorbe rozložení s krátkym textom sa s podobnými situáciami budeme stretávať často.

### Ovládanie vzdialenosti medzi vnútornými zobrazeniami

Predtým sme do `VStack` napísali `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` slúži na ovládanie vzdialenosti medzi vnútornými zobrazeniami.

Ak `spacing` nenastavíme, `VStack` bude mať aj predvolený rozostup, ale predvolený rozostup nemusí vždy zodpovedať požadovanému výsledku.

Tu by príliš malá vzdialenosť medzi názvom kurzu a popisom kurzu pôsobila stiesnene, preto použijeme:

```swift
spacing: 10
```

Vďaka tomu medzi nimi zostane trochu priestoru.

Výsledok zobrazenia:

![view](../../../Resource/026_view9.png)

Rovnako sú horná oblasť a oblasť obsahu usporiadané zhora nadol, takže aj ich vzdialenosť môžeme ovládať pomocou `spacing`.

Teraz vložíme `topView` a `contentView` do `body`:

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

Výsledok zobrazenia:

![view](../../../Resource/026_view10.png)

Tu `VStack(spacing: 20)` ovláda vzdialenosť medzi `topView` a `contentView`.

Inými slovami:

```swift
VStack(alignment: .leading, spacing: 10)
```

ovláda vzdialenosť medzi názvom kurzu a popisom kurzu.

```swift
VStack(spacing: 20)
```

ovláda vzdialenosť medzi hornou oblasťou a oblasťou obsahu.

Obe používajú `spacing`, ale pôsobia na rôzne `VStack`, takže ovplyvňujú odlišný rozsah.

Tým je zobrazenie oblasti obsahu dokončené.

## Oblasť tlačidla

Ďalej vytvoríme spodnú oblasť tlačidla.

Výsledok zobrazenia:

![view](../../../Resource/026_view11.png)

Oblasť tlačidla sa skladá hlavne z ikony prehrávania a textu.

Na zobrazenie ikony prehrávania môžeme použiť `Image` a na zobrazenie textu tlačidla `Text`.

Najprv vytvoríme vzhľad tlačidla:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("kliknutie na tlačidlo")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Začať sa učiť")
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

Výsledok zobrazenia:

![view](../../../Resource/026_view12.png)

Tu sme použili dva `HStack`:

Vnútorný `HStack` slúži na vodorovné usporiadanie ikony a textu:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Začať sa učiť")
}
```

Vonkajší `HStack` v spojení so `Spacer()` slúži na to, aby sa vzhľad tlačidla zobrazil vľavo:

```swift
HStack {
    ...
    Spacer()
}
```

Po kliknutí na tlačidlo konzola vypíše `kliknutie na tlačidlo`.

## Základná karta je hotová

Teraz spojíme hornú oblasť, oblasť obsahu a oblasť tlačidla:

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

Výsledok zobrazenia:

![view](../../../Resource/026_view13.png)

Tým je základná karta kurzu dokončená.

## Pozadie s ikonou Swiftu

Nakoniec do karty pridáme polopriehľadnú ikonu Swiftu ako pozadie.

![view](../../../Resource/026_view.png)

Predtým sme ako farbu pozadia použili `Color.indigo`. V skutočnosti môže `.background()` okrem farby pridať aj celé zobrazenie.

Preto môžeme najprv vytvoriť samostatné zobrazenie pozadia:

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

V tomto zobrazení pozadia používame `VStack`, `HStack` a `Spacer()`, aby sme ikonu Swiftu posunuli do pravého dolného rohu.

Keďže ikona Swiftu slúži iba ako dekoratívne pozadie, používame tu polopriehľadnú bielu farbu:

```swift
Color.white.opacity(0.15)
```

Vďaka tomu ikona nebude príliš výrazná a nebude rušiť textový obsah v popredí.

Potom pridáme `backgroundView` do karty:

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

Výsledok:

![view](../../../Resource/026_view14.png)

Tu sme za sebou použili dve `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Prvá `.background()` slúži na pridanie pozadia s ikonou Swiftu.
Druhá `.background()` slúži na pridanie indigového pozadia.

Tým sa ikona Swiftu zobrazí nad indigovým pozadím a bude zobrazená ako súčasť pozadia karty.

Z toho je vidieť, že `.background()` môže okrem farby pridať aj vlastné zobrazenie. Viacero `.background()` možno tiež kombinovať a vytvoriť tak bohatšie efekty pozadia.

Tým je kompletná karta kurzu dokončená.

## Zhrnutie

V tejto lekcii sme si pomocou karty kurzu zopakovali bežné základné spôsoby rozloženia vo SwiftUI.

Použili sme `Text` na zobrazenie textu, `Image` na zobrazenie systémovej ikony a `VStack`, `HStack` a `Spacer()` na ovládanie usporiadania zobrazení.

Naučili sme sa `.lineLimit()`, ktoré dokáže obmedziť maximálny počet zobrazených riadkov textu. Keď obsah limit prekročí, nadbytočná časť sa skráti.

Zároveň sme si zopakovali bežné modifikátory, ako sú `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()`.

Po dokončení tejto lekcie už dokážeme spojiť viac malých zobrazení do jedného kompletného modulu karty.

To je pri vývoji so SwiftUI veľmi bežný spôsob uvažovania: najprv rozdeliť rozhranie na malé zobrazenia a potom ich poskladať do kompletnej obrazovky.

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
            Text("Začiatočník")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lekcií")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Kurz SwiftUI pre začiatočníkov")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Začnite od nuly so SwiftUI a systematicky sa učte deklaratívny vývoj používateľského rozhrania pre platformy Apple. Vďaka jasným vysvetleniam a praktickým príkladom si postupne osvojíte rozloženie, interakcie a správu stavu, aby ste mohli vytvárať pekné a užitočné rozhrania aplikácií.")
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
    	        print("kliknutie na tlačidlo")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Začať sa učiť")
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
