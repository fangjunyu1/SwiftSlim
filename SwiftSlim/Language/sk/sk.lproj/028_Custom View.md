# Vlastné zobrazenie

V tejto lekcii sa naučíme veľmi dôležitý spôsob písania v SwiftUI: **vlastný View**.

Vlastný View dokáže zapuzdriť časť opakujúceho sa kódu zobrazenia a premeniť ju na View, ktorý možno používať opakovane.

Pri reálnom vývoji App sa často stretávame s takouto situáciou: štruktúra mnohých rozhraní je rovnaká, líši sa iba zobrazovaný obsah.

Napríklad v zozname príspevkov na fórovom webe môže mať každý príspevok názov, obrázok, počet označení páči sa mi a ďalšie informácie.

![Reddit](../../../Resource/028_view1.png)

V zozname produktov na nákupnom webe môže mať každý produkt obrázok, názov, cenu a ďalšie informácie.

![Amazon](../../../Resource/028_view2.png)

Štruktúra týchto obsahov je podobná; rozdiel je iba v zobrazovaných údajoch.

Ak by sme kód pre každú položku písali ručne, kód by bol veľmi dlhý a nebolo by pohodlné ho neskôr upravovať.

Preto môžeme rovnakú štruktúru zapuzdriť do vlastného View a odlišný obsah doň posielať ako parametre.

Tak môže ten istý View zobrazovať odlišný obsah.

## Scenár požiadavky

Napríklad teraz chceme vytvoriť zoznam nastavení.

Výsledok zobrazenia:

![view](../../../Resource/028_view.png)

V tomto zozname nastavení sú tri rôzne položky nastavení: `Nastavenia`, `Priečinok` a `Hudba`.

Hoci ich ikony, farby a názvy sú odlišné, celková štruktúra je rovnaká:

- Ikona vľavo
- Farba pozadia ikony
- Názov v strede
- Šípka vpravo

Ak nepoužijeme vlastný View, môžeme napísať napríklad toto:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Nastavenia")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Priečinok")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Hudba")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Tento kód sa dokáže správne zobraziť, ale problém je tiež veľmi zreteľný: kód troch položiek nastavení je takmer úplne rovnaký.

Odlišné sú iba ikona, farba a názov:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Nastavenia")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Priečinok")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Hudba")
```

Inými slovami, štruktúra každej položky nastavení je pevná, odlišné sú iba ikona, farba a názov.

Takáto situácia je veľmi vhodná na použitie vlastného View.

### Tieň shadow

Tu používame nový modifikátor `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` dokáže pridať View tieň.

`radius` označuje polomer rozmazania tieňa. Čím je hodnota väčšia, tým je zvyčajne väčší rozsah rozptýlenia tieňa a tieň pôsobí mäkšie.

Tu je nastavená hodnota `1`, čo znamená, že pridáme iba veľmi jemný efekt tieňa.

## Zapuzdrenie View položky nastavení

Ďalej zapuzdríme každú položku nastavení do nového View.

Môžeme vytvoriť `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

V tomto View definujeme tri vlastnosti:

```swift
let icon: String
let color: Color
let title: String
```

Konkrétne:

- `icon` označuje názov ikony
- `color` označuje farbu pozadia ikony
- `title` označuje názov položky nastavení

Keďže tieto tri hodnoty sú v rôznych položkách nastavení odlišné, spravíme z nich parametre, ktoré možno odovzdať zvonka.

## Použitie vlastného View

Keď už máme `SettingItemView`, nemusíme opakovane písať veľký blok kódu `HStack`.

Teraz ho môžeme použiť takto:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")
```

Tento riadok kódu znamená vytvorenie View položky nastavení a odovzdanie troch parametrov:

```swift
icon: "gear"
color: Color.blue
title: "Nastavenia"
```

Po odovzdaní získajú vlastnosti vo vnútri `SettingItemView` zodpovedajúce hodnoty:

- hodnota `icon` je `gear`
- hodnota `color` je `Color.blue`
- hodnota `title` je `"Nastavenia"`

Preto `Image(systemName: icon)` vo vnútri View zobrazí ikonu ozubeného kolieska, `.background(color)` použije modré pozadie a `Text(title)` zobrazí `Nastavenia`.

Kompletný kód:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Priečinok")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Hudba")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/028_view.png)

Môžeme vidieť, že po zapuzdrení je výsledok zobrazenia rovnaký ako predtým, ale kód je prehľadnejší.

Predtým bolo potrebné pre každú položku nastavení napísať celý blok `HStack`, teraz stačí jeden riadok kódu:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")
```

Toto je úloha vlastného View: **zapuzdriť opakujúcu sa štruktúru View a ako parametre odovzdávať iba odlišný obsah.**

## Prečo možno odovzdávať parametre

Ďalej si jednoducho vysvetlíme, prečo môže vlastný View prijímať parametre.

V SwiftUI je View vo svojej podstate štruktúra.

Napríklad:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

Tu je `ContentView` štruktúra.

Keď napíšeme:

```swift
ContentView()
```

v skutočnosti vytvárame View `ContentView`.

Zátvorky `()` na konci znamenajú volanie jeho inicializačnej metódy; možno to chápať aj ako vytvorenie tohto View.

Keďže tento `ContentView` nemá žiadne vlastnosti, ktoré treba odovzdať zvonka, môžeme priamo napísať:

```swift
ContentView()
```

Ak však View obsahuje vlastnosť bez priradenej hodnoty, pri vytváraní View musíme odovzdať zodpovedajúcu hodnotu.

Napríklad:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("meno: \(name)")
    }
}
```

Tu je `name` vlastnosť a nemá predvolenú hodnotu.

Preto pri vytváraní `ContentView` musíme dať `name` konkrétnu hodnotu:

```swift
ContentView(name: "Fang Junyu")
```

Tak môže View túto hodnotu používať vo vnútri:

```swift
Text("meno: \(name)")
```

To je aj dôvod, prečo pri vytváraní `SettingItemView` musíme odovzdať parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")
```

Pretože `SettingItemView` má tri vlastnosti bez predvolených hodnôt:

```swift
let icon: String
let color: Color
let title: String
```

Preto ich pri vytváraní tohto View musíme odovzdať dovnútra. Odovzdané parametre Swift použije na priradenie hodnôt vlastnostiam vo vnútri View.

## Inicializačná metóda

Ďalej si ešte hlbšie vysvetlíme inicializačnú metódu.

### Predvolená inicializačná metóda

Keď definujeme bežný View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

V tomto kóde sme inicializačnú metódu nenapísali ručne.

Keď však tento View používame, môžeme napísať:

```swift
ContentView()
```

Tu `()` v skutočnosti znamená vytvorenie `ContentView`; možno to chápať aj ako volanie jeho inicializačnej metódy.

### Prečo možno volať inicializačnú metódu, aj keď ju nevidíme?

Pretože kompilátor Swift nám automaticky vygeneruje inicializačnú metódu.

Treba si všimnúť: **táto inicializačná metóda je vygenerovaná automaticky a v kóde ju zvyčajne priamo nevidíme.**

Inými slovami, hoci sme v `struct` ručne nenapísali:

```swift
init() {

}
```

kompilátor Swift nám na pozadí vygeneruje približne takúto inicializačnú metódu:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Ahoj, svet!")
    }
}
```

Preto môžeme priamo napísať:

```swift
ContentView()
```

V skutočnom kóde preto zvyčajne nemusíme inicializačnú metódu písať ručne.

Stačí pochopiť jednu vec: **pri vytváraní SwiftUI View sa zavolá inicializačná metóda daného View. Aj keď inicializačnú metódu nenapíšeme ručne, Swift ju môže automaticky vygenerovať.**

### Inicializačná metóda s parametrami

Ak má View vlastnosť bez predvolenej hodnoty, napríklad:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("meno: \(name)")
    }
}
```

kompilátor Swift podľa vlastnosti automaticky vygeneruje inicializačnú metódu s parametrom.

Jednoducho si ju môžeme predstaviť takto:

```swift
init(name: String) {
    self.name = name
}
```

Tu:

```swift
init(name: String)
```

znamená, že pri vytváraní `ContentView` treba odovzdať parameter `name` typu `String`.

Keď napíšeme:

```swift
ContentView(name: "Fang Junyu")
```

znamená to: odovzdať `"Fang Junyu"` ako parameter inicializačnej metóde.

Potom sa vo vnútri inicializačnej metódy vykoná:

```swift
self.name = name
```

Tento riadok kódu znamená: priradiť `name`, ktoré prišlo zvonka, vlastnej vlastnosti `name` aktuálneho View.

Jednoducho si to môžeme predstaviť takto:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("meno: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Tak môže View vo vnútri používať odovzdanú hodnotu.

Toto je inicializačný proces View s parametrami: **keď vlastnosť vo View nemá predvolenú hodnotu, pri vytváraní View treba odovzdať zodpovedajúci parameter, aby inicializačná metóda dokončila priradenie hodnoty vlastnosti.**

## Situácia, keď má vlastnosť predvolenú hodnotu

Ak má vlastnosť už predvolenú hodnotu, pri vytváraní View nemusíme odovzdávať parameter.

Napríklad:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("meno: \(name)")
    }
}
```

Tu má `name` už predvolenú hodnotu:

```swift
"Fang Junyu"
```

Preto pri vytváraní `ContentView` môžeme priamo napísať:

```swift
ContentView()
```

Vtedy `name` použije predvolenú hodnotu a rozhranie zobrazí:

```swift
meno: Fang Junyu
```

Samozrejme, pri vytváraní View môžeme odovzdať aj novú hodnotu:

```swift
ContentView(name: "Sam")
```

Vtedy View použije `"Sam"` odovzdané zvonka namiesto predvolenej hodnoty a rozhranie zobrazí:

```swift
meno: Sam
```

Pre jednoduchšie pochopenie si inicializačnú metódu, ktorú automaticky vygeneruje kompilátor Swift, môžeme predstaviť takto:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Tu `name: String = "Fang Junyu"` znamená: ak pri vytváraní View neodovzdáme `name`, použije sa predvolená hodnota `"Fang Junyu"`; ak pri vytváraní View odovzdáme nové `name`, použije sa odovzdaná hodnota.

Inými slovami: **ak zvonka neodovzdáme parameter, použije sa predvolená hodnota vlastnosti; ak zvonka parameter odovzdáme, použije sa odovzdaná hodnota.**

## Späť k SettingItemView

Teraz sa znovu pozrime na SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Štruktúra tohto View je pevná.

Medzi pevné časti patria:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Medzi odlišné časti patria:

```swift
icon
color
title
```

Preto z odlišného obsahu spravíme vlastnosti a pri vytváraní View ich odovzdáme ako parametre.

Keď vytvárame rôzne položky nastavení, stačí odovzdať rôzne parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")
SettingItemView(icon: "folder", color: Color.brown, title: "Priečinok")
SettingItemView(icon: "music.note", color: Color.purple, title: "Hudba")
```

Tak môže ten istý `SettingItemView` zobraziť tri rôzne položky nastavení.

Toto je najbežnejší spôsob používania vlastného View.

## Zhrnutie

V tejto lekcii sme sa naučili vlastný View.

Hlavná úloha vlastného View je: **zapuzdriť opakujúci sa kód zobrazenia, aby ho bolo možné znovu používať.**

V tomto príklade je štruktúra troch položiek nastavení rovnaká, odlišné sú iba ikona, farba a názov.

Preto sme vytvorili `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Potom pri používaní tohto View odovzdáme rôzne parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavenia")
```

Tieto parametre vstúpia do `SettingItemView`.

Týmto spôsobom môžeme s menším množstvom kódu vytvárať View s rovnakou štruktúrou, ale s odlišným obsahom.

Je to tiež veľmi bežný spôsob písania pri vývoji v SwiftUI.
