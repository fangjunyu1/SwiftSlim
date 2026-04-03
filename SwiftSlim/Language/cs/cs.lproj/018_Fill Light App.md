# Aplikace Fill Light

V této lekci vytvoříme velmi zajímavou aplikaci fill light. Když přijde noc, můžeme nechat obrazovku telefonu zobrazovat různé barvy a použít ji jako jednoduché přisvětlovací světlo.

Tato aplikace fill light umí přepínat barvy klepnutím na obrazovku a také upravovat jas pomocí posuvníku.

V tomto příkladu se naučíme používat `brightness` pro úpravu jasu zobrazení, `onTapGesture` pro přidání gesta klepnutí do zobrazení a ovládací prvek `Slider`.

Výsledek:

![Color](../../Resource/018_color.png)

## Zobrazení barvy

Nejprve nechme zobrazení ukázat jednu barvu.

Ve SwiftUI `Color` nepředstavuje jen barvu, ale může být zobrazen i jako pohled:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Zde `Color.red` představuje červené zobrazení. `.ignoresSafeArea()` způsobí, že barevné zobrazení vyplní celou obrazovku, takže to vypadá více jako skutečný efekt přisvětlovacího světla.

Výsledek:

![Color](../../Resource/018_color1.png)

### Pole barev a index

Právě teď se zobrazuje jen jedna barva. Přisvětlovací světlo ale obvykle nemá jen jednu barvu. Může zobrazovat také modrou, žlutou, fialovou, bílou a další barvy.

Chceme při klepnutí na obrazovku přepínat mezi různými barvami. Tyto barvy můžeme vložit do pole a spravovat je společně:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Pole je vhodné pro ukládání "skupiny dat stejného typu". Zde je každý prvek v poli `Color`.

Pokud chceme zobrazit konkrétní barvu, můžeme použít index:

```swift
colors[0]
```

To znamená přečíst barvu na indexu `0` v poli, tedy první barvu.

Nyní lze kód napsat takto:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Tímto způsobem obrazovka zobrazí první barvu v poli, tedy červenou.

### Použití indexu pro ovládání barvy

Pokud potřebujeme přepínat mezi různými barvami, potřebujeme proměnnou pro správu indexu místo pevně zadaného indexu.

Můžeme použít `@State` k deklaraci proměnné, která index uloží:

```swift
@State private var index = 0
```

Zde `index` představuje index aktuální barvy.

Když se `index` změní, SwiftUI znovu přepočítá rozhraní a aktualizuje zobrazený obsah.

Pak změníme původní `colors[0]` na:

```swift
colors[index]
```

Tím bude barva zobrazená ve view určena hodnotou `index`.

Kód nyní vypadá takto:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Když se `index` změní, `colors[index]` také zobrazí jinou barvu.

Například:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Je třeba si uvědomit, že `index` nemůže překročit nejvyšší index pole, jinak dojde k chybě indexu mimo rozsah.

## Gesto klepnutí

Nyní můžeme zobrazovat různé barvy podle `index`, ale zatím je nemůžeme klepnutím přepínat.

V předchozí lekci "Kolotoč citátů" jsme použili `Button` pro ovládání přepínání citátů.

Tentokrát ale chceme "klepnout na celou barevnou plochu", abychom změnili barvu, takže je vhodnější `onTapGesture`.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Když klepneme na barevné zobrazení, provede se tento kód:

```swift
index += 1
```

To znamená zvýšit `index` o `1`. Po zvýšení indexu `colors[index]` zobrazí další barvu v poli.

### `onTapGesture`

`onTapGesture` je modifikátor gesta, který přidává akci klepnutí do view.

Základní použití:

```swift
.onTapGesture {
    // code
}
```

Například:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Když na toto červené zobrazení klepneme, provede se kód uvnitř složených závorek a v konzoli se zobrazí:

```swift
Click color
```

Pomocí `onTapGesture` můžeme definovat, co se má stát po klepnutí na zobrazení.

### Rozdíl oproti `Button`

Dříve jsme se učili view `Button`. Jak `Button`, tak `onTapGesture` umí zpracovat klepnutí, ale jejich scénáře použití nejsou úplně stejné.

`onTapGesture` je vhodnější pro "přidání funkce klepnutí k již existujícímu view", například `Color`, `Image`, `Text` nebo jinému běžnému view.

`Button` je vhodnější tehdy, když představuje jasné tlačítko, například "Potvrdit", "Odeslat" nebo "Smazat".

V této aplikaci fill light chceme, aby přepínání barev bylo jednodušší. Klepnutí na celou barevnou oblast přepne barvu, takže je zde `onTapGesture` dobrá volba.

## Problém s indexem

Nyní můžeme klepnutím na obrazovku přepínat mezi různými barvami.

Je tu ale jeden důležitý problém: **index může překročit rozsah pole**.

Například:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Pokud budeme na obrazovku klepat dál, `index` se nakonec stane `4` a pak dojde k chybě "index out of range".

Je to proto, že pole `colors` má `4` prvky, ale indexování začíná od `0`, takže platný rozsah indexů je `0 - 3`, ne `4`.

Pokud přistoupíme k `colors[4]`, dojde k chybě "index out of range".

V aktuálním kódu každé klepnutí zvýší `index` o `1`. Pokud to neošetříme, nakonec určitě překročí platný rozsah.

Proto musíme při klepnutí na obrazovku zkontrolovat index: pokud už je na poslední barvě, vrátíme se na první; jinak pokračujeme přidáním `1`.

Můžeme to udělat pomocí příkazu `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

V tomto kódu `colors.count` znamená počet prvků v poli.

V aktuálním poli jsou 4 barvy, takže:

```swift
colors.count // 4
```

Ale nejvyšší index není `4`, nýbrž `3`, protože indexování začíná od `0`.

Proto by se poslední index měl zapsat takto:

```swift
colors.count - 1
```

Tedy:

```swift
4 - 1 = 3
```

Tato logika znamená: pokud aktuální index už odpovídá poslední barvě, resetuj index na `0`; jinak ho zvyš o `1`.

Tímto způsobem se barvy mohou přepínat dokola.

### Zjednodušení logiky indexu

Pokud chceme mít kód stručnější, můžeme použít také ternární operátor:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Tento kód znamená: pokud je `index == colors.count - 1` pravda, vrať `0`. Jinak vrať `index + 1`.

Nakonec přiřadíme výsledek zpět do `index`.

Teď už můžeme dosáhnout efektu přepínání barev.

Úplný kód:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Nyní můžeme klepat na obrazovku a přepínat mezi různými barvami. Základní aplikace fill light je hotová.

## Zobrazení názvu barvy

Můžeme přidat další skupinu textů odpovídajících barvám, takže když se barva změní, na obrazovce se zároveň zobrazí i název aktuální barvy.

Například:

- Červená zobrazí `Red`
- Modrá zobrazí `Blue`
- Žlutá zobrazí `Yellow`
- Fialová zobrazí `Purple`

I zde můžeme použít pole pro uložení názvů barev:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

Pořadí textů v tomto poli by mělo přesně odpovídat pořadí barev v poli barev.

Pak můžeme použít `Text` pro zobrazení názvu barvy odpovídající aktuálnímu indexu:

```swift
Text(colorsName[index])
```

`Text` zobrazuje aktuální název barvy podle `index`.

Pomocí modifikátorů můžeme zlepšit vzhled `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

To způsobí, že se `Text` zobrazí bíle, velikostí nadpisu a tučně.

Nyní máme `Color` view přes celou obrazovku. Pokud chceme, aby se `Text` zobrazil nad `Color` view, musíme použít kontejner rozložení `ZStack`, který je vrství přes sebe.

```swift
ZStack {
    Color
    Text
}
```

Kód se tedy změní na:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

Tímto způsobem tvoří barevné zobrazení pozadí a nad ním je překryté textové zobrazení.

Výsledek:

![Color](../../Resource/018_color2.png)

Je třeba poznamenat, že v `ZStack` se view zapsaná později obvykle zobrazují vpředu. Pokud je `Text` zapsán před `Color`, může pozdější `Color` view `Text` zakrýt.

## Ovládání jasu

Nyní můžeme přepínat mezi různými barvami, ale přisvětlovací světlo má ještě jednu důležitou funkci: **úpravu jasu**.

Ve SwiftUI můžeme použít modifikátor `brightness` pro úpravu jasu view.

Například:

```swift
.brightness(1)
```

Můžeme napsat:

```swift
colors[index]
    .brightness(0.5)
```

Tím bude aktuální barva světlejší a blíže efektu přisvětlovacího světla.

Rozsah jasu je `0 - 1`. `0` znamená zachovat původní barvu a čím blíže je hodnota k `1`, tím světlejší barva bude. `1` znamená nejjasnější bílý výsledek.

Přestože můžeme `brightness` ovládat v kódu, uživatel jej stále nemůže upravovat přímo.

Proto musíme přidat ovládací prvek, který lze posouvat: `Slider`.

## View `Slider`

Ve SwiftUI je `Slider` ovládací prvek používaný pro výběr hodnoty v určitém rozsahu. Apple jej popisuje jako "ovládací prvek pro výběr hodnoty z omezeného lineárního rozsahu".

Základní použití:

```swift
Slider(value: $value, in: 0...1)
```

Vysvětlení parametrů:

1. `value: $value`: `Slider` musí být svázán s proměnnou.

    Když se posuvník pohybuje, hodnota proměnné se mění zároveň. Naopak, když se změní proměnná, posuvník se také aktualizuje.

    Je to velmi podobné `TextField`, který jsme se učili dříve. Oba "svazují ovládací prvek s proměnnou".

    Svázaná proměnná potřebuje před sebou symbol `$`, aby vyjadřovala binding.

2. `in: 0...1`: Tento parametr představuje rozsah hodnot posuvníku.

    Zde `0...1` znamená, že minimální hodnota je `0` a maximální hodnota je `1`.

    Když je posuvník úplně vlevo, svázaná proměnná je blízko `0`; když je úplně vpravo, je blízko `1`.

Například:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` je svázán s proměnnou `value`. Když se posuvník pohybuje, hodnota proměnné `value` se mění zároveň.

Vzhled:

![Slider](../../Resource/018_slider.png)

Když se `Slider` posune doleva, svázaná hodnota `value` se stane `0`. Když se posune doprava, stane se `1`.

### Rozsah hodnot

Rozsah hodnot `Slider` není pevně daný. Může být zapsán také takto:

```swift
0...100
```

nebo jako jiný rozsah.

V této aplikaci fill light ale potřebujeme ovládat jas, takže `0...1` je nejvhodnější volba.

## Použití `Slider` pro ovládání jasu

Teď musíme propojit `Slider` s `brightness`.

Nejprve vytvořte proměnnou pro uložení hodnoty jasu:

```swift
@State private var slider = 0.0
```

Zde je `0.0` hodnota typu `Double`.

Protože `Slider` je obvykle svázán s číselným typem a zde chceme, aby se měnil plynule, je `Double` vhodnější. Navíc `brightness` přijímá pouze hodnotu typu `Double`.

Pak tuto hodnotu předejte do `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Když `slider == 0`, barva zůstává ve výchozím stavu. Čím blíže je `slider` k `1`, tím jasněji barva vypadá.

### Přidání ovládacího prvku `Slider`

Dále přidejte ovládací prvek `Slider`, který bude tuto proměnnou měnit:

```swift
Slider(value: $slider, in: 0...1)
```

Když se posuvník změní, změní se i hodnota `slider` a `brightness(slider)` aktualizuje jas současně.

To je velmi typický příklad toho, jak ve SwiftUI "proměnné řídí view".

### Úprava vzhledu `Slider`

Ve výchozím stavu `Slider` využívá dostupnou šířku.

Můžeme mu dát pevnou šířku:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Pak přidáme ještě několik modifikátorů, aby byl lépe vidět:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Tím dostane posuvník bílé pozadí a zaoblené rohy, takže na view `Color` více vynikne.

Nakonec jej umístěte do spodní části obrazovky.

Protože jsme už použili `ZStack`, můžeme do něj vložit `VStack` a pomocí `Spacer()` posunout `Slider` dolů.

## Kompletní kód

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Výsledek:

![Color](../../Resource/018_color.png)

## Shrnutí

Pomocí znalostí, které jsme se naučili dříve, spolu se základními pojmy jako barvy a pole, jsme vytvořili velmi zajímavou aplikaci fill light.

Díky této aplikaci jsme se naučili používat `brightness` pro úpravu jasu, `onTapGesture` pro přidání akcí klepnutí do view a ovládací prvek `Slider`.

Přidali jsme `onTapGesture` do view `Color`, abychom mohli přepínat barvy. Také jsme použili ovládací prvek `Slider` ke změně proměnné, která spravuje `brightness`, což je další příklad toho, jak "proměnné řídí view".

Také jsme si zopakovali ternární operátor, použili jsme `ZStack` pro vrstvení view a pole pro správu skupiny dat stejného typu. To pomáhá prohloubit naše porozumění polím a indexům, včetně praktického problému, jak se vyhnout chybám indexu mimo rozsah.

I když tento příklad není složitý, propojuje mnoho základních myšlenek, které jsme se naučili dříve. Když se spojí do malého skutečného projektu, je snazší pochopit, k čemu se jednotlivé koncepty používají.

### Reálný scénář použití

Představte si, že položíte starý iPhone na stůl a pomocí aplikace fill light, kterou jste si sami vytvořili, ovládáte barvu světla. To by byl velmi příjemný zážitek.

V App Store je mnoho aplikací typu "fill light" a ani ty nevypadají příliš složitě.

![AppStore](../../Resource/018_appStore.PNG)

Můžeme začít vyvíjet jednoduché aplikace a zkusit je publikovat do App Store. To nejen zvyšuje náš zájem o vývoj, ale také zaznamenává náš růst.

### Cvičení po lekci

Můžete dál přemýšlet o způsobech, jak tuto aplikaci fill light rozšířit, například:

- Přidat více barev
- Zobrazit aktuální hodnotu jasu
- Vylepšit vzhled spodní oblasti s posuvníkem

Když tyto znalosti opravdu začnete používat, zjistíte, že každý pojem, který se učíme, je ve skutečnosti nástroj pro tvorbu aplikací.

Čím více nástrojů zvládneme, tím více funkcí dokážeme vytvořit.
