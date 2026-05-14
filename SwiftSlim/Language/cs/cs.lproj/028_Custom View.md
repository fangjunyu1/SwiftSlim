# Vlastní zobrazení

V této lekci se naučíme jeden velmi důležitý způsob zápisu ve SwiftUI: **vlastní zobrazení**.

Vlastní zobrazení umožňuje zapouzdřit opakující se kód zobrazení a změnit ho na zobrazení, které lze používat opakovaně.

Při skutečném vývoji aplikací se s takovou situací setkáváme často: mnoho obrazovek má stejnou strukturu, ale zobrazuje jiný obsah.

Například v seznamu příspěvků na fóru může mít každý příspěvek název, obrázek, počet lajků a další informace.

![Reddit](../../../Resource/028_view1.png)

V seznamu produktů v internetovém obchodě může mít každý produkt obrázek, název, cenu a další informace.

![Amazon](../../../Resource/028_view2.png)

Struktura těchto obsahů je podobná; liší se jen zobrazená data.

Pokud bychom kód každé položky psali ručně, kód by byl velmi dlouhý a pozdější úpravy by nebyly pohodlné.

Proto můžeme stejnou strukturu zapouzdřit do vlastního zobrazení a odlišný obsah do něj předat jako parametry.

Díky tomu může stejné zobrazení zobrazovat různý obsah.

## Scénář potřeby

Například teď chceme vytvořit seznam nastavení.

Výsledný vzhled:

![view](../../../Resource/028_view.png)

V tomto seznamu nastavení jsou tři různé položky nastavení: `Settings`, `Folder` a `Music`.

I když se jejich ikony, barvy a názvy liší, celková struktura je stejná:

- Ikona vlevo
- Barva pozadí ikony
- Název uprostřed
- Šipka vpravo

Pokud nepoužijeme vlastní zobrazení, mohli bychom kód napsat například takto:

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

                Text("Settings")
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

                Text("Folder")
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

                Text("Music")
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

Tento kód se může zobrazit správně, ale problém je také zřejmý: kód tří položek nastavení je téměř úplně stejný.

Liší se jen ikona, barva a název:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Settings")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Folder")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Music")
```

Jinými slovy, struktura každé položky nastavení je pevná a liší se pouze ikona, barva a název.

Taková situace je velmi vhodná pro použití vlastního zobrazení.

### Stín shadow

Zde jsme použili nový modifikátor `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` může zobrazení přidat stín.

`radius` označuje poloměr rozmazání stínu. Čím větší je hodnota, tím větší obvykle bude rozsah stínu a tím měkčeji bude působit.

Zde je nastavena hodnota `1`, což znamená, že přidáme jen velmi jemný stín.

## Zapouzdření zobrazení položky nastavení

Dále zapouzdříme každou položku nastavení do nového zobrazení.

Můžeme vytvořit `SettingItemView`:

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

V tomto zobrazení jsme definovali tři vlastnosti:

```swift
let icon: String
let color: Color
let title: String
```

Konkrétně:

- `icon` označuje název ikony
- `color` označuje barvu pozadí ikony
- `title` označuje název položky nastavení

Protože se tyto tři hodnoty v různých položkách nastavení liší, uděláme z nich parametry, které lze předat zvenku.

## Použití vlastního zobrazení

Po vytvoření `SettingItemView` už nemusíme znovu psát dlouhý blok kódu `HStack`.

Teď ho můžeme použít takto:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Tento řádek kódu znamená, že vytvoříme zobrazení položky nastavení a předáme do něj tři parametry:

```swift
icon: "gear"
color: Color.blue
title: "Settings"
```

Po předání získají vnitřní vlastnosti `SettingItemView` odpovídající hodnoty:

- Hodnota `icon` je `gear`
- Hodnota `color` je `Color.blue`
- Hodnota `title` je `"Settings"`

Proto `Image(systemName: icon)` uvnitř zobrazení zobrazí ikonu ozubeného kola, `.background(color)` použije modré pozadí a `Text(title)` zobrazí `Settings`.

Úplný kód:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Settings")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Folder")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
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

Výsledný vzhled:

![view](../../../Resource/028_view.png)

Vidíme, že po zapouzdření je výsledný vzhled stejný jako předtím, ale kód je přehlednější.

Dříve bylo nutné pro každou položku nastavení napsat celý blok `HStack`; teď stačí jen jeden řádek kódu:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

To je účel vlastního zobrazení: **zapouzdřit opakující se strukturu zobrazení a předávat jen odlišný obsah jako parametry.**

## Proč lze předávat parametry

Dále si jednoduše vysvětlíme, proč může vlastní zobrazení přijímat parametry.

Ve SwiftUI je zobrazení v podstatě struktura.

Například:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Zde je `ContentView` struktura.

Když napíšeme:

```swift
ContentView()
```

ve skutečnosti tím vytváříme zobrazení `ContentView`.

Závorky `()` znamenají volání jeho inicializační metody. Můžeme si to také představit jako vytvoření tohoto zobrazení.

Protože tento `ContentView` nemá žádnou vlastnost, kterou by bylo nutné předat zvenku, můžeme napsat přímo:

```swift
ContentView()
```

Pokud však zobrazení obsahuje vlastnost bez přiřazené hodnoty, je nutné při vytváření zobrazení předat odpovídající hodnotu.

Například:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

Zde je `name` vlastnost a nemá výchozí hodnotu.

Proto musíme při vytváření `ContentView` předat pro `name` konkrétní hodnotu:

```swift
ContentView(name: "Fang Junyu")
```

Díky tomu může zobrazení tuto hodnotu uvnitř použít:

```swift
Text("name: \(name)")
```

To je také důvod, proč musíme při vytváření `SettingItemView` předat parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Protože `SettingItemView` obsahuje tři vlastnosti bez výchozí hodnoty:

```swift
let icon: String
let color: Color
let title: String
```

Při vytváření tohoto zobrazení je tedy musíme předat. Předané parametry Swift použije k přiřazení hodnot vnitřním vlastnostem zobrazení.

## Inicializační metoda

Dále si inicializační metodu vysvětlíme podrobněji.

### Výchozí inicializační metoda

Když definujeme běžné zobrazení:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

V tomto kódu jsme inicializační metodu nenapsali ručně.

Když však toto zobrazení používáme, můžeme napsat:

```swift
ContentView()
```

Zde `()` ve skutečnosti znamená, že vytváříme `ContentView`; můžeme to také chápat jako volání jeho inicializační metody.

### Proč ji lze volat, i když inicializační metodu nevidíme?

Protože kompilátor Swiftu nám automaticky vygeneruje inicializační metodu.

Je potřeba si všimnout, že **tato inicializační metoda je generována automaticky a obvykle ji v kódu přímo neuvidíme.**

Jinými slovy, i když jsme do `struct` ručně nenapsali:

```swift
init() {

}
```

kompilátor Swiftu nám na pozadí vygeneruje inicializační metodu podobnou této:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

Proto můžeme přímo napsat:

```swift
ContentView()
```

V reálném kódu tedy obvykle není nutné inicializační metodu ručně vypisovat.

Stačí pochopit jednu věc: **při vytváření zobrazení SwiftUI se volá inicializační metoda zobrazení. I když ji nenapíšeme ručně, Swift ji v některých případech může automaticky vygenerovat.**

### Inicializační metoda s parametry

Pokud je v zobrazení vlastnost bez výchozí hodnoty, například:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("name: \(name)")
    }
}
```

Kompilátor Swiftu podle vlastností automaticky vygeneruje inicializační metodu s parametry.

Zjednodušeně si ji můžeme představit takto:

```swift
init(name: String) {
    self.name = name
}
```

Zde:

```swift
init(name: String)
```

znamená, že při vytváření `ContentView` je nutné předat parametr `name` typu `String`.

Když napíšeme:

```swift
ContentView(name: "Fang Junyu")
```

znamená to, že předáme `"Fang Junyu"` jako parametr inicializační metodě.

Potom se uvnitř inicializační metody provede:

```swift
self.name = name
```

Tento řádek znamená: hodnotu `name` předanou zvenku přiřaď aktuální vlastní vlastnosti `name` tohoto zobrazení.

Zjednodušeně si to můžeme představit takto:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("name: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Tím může zobrazení uvnitř používat předanou hodnotu.

To je inicializační proces zobrazení s parametry: **když vlastnost ve zobrazení nemá výchozí hodnotu, je při vytváření zobrazení nutné předat odpovídající parametr, aby inicializační metoda dokončila přiřazení hodnoty vlastnosti.**

## Situace, kdy má vlastnost výchozí hodnotu

Pokud už vlastnost má výchozí hodnotu, nemusíme při vytváření zobrazení předávat parametr.

Například:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("name: \(name)")
    }
}
```

Zde už má `name` výchozí hodnotu:

```swift
"Fang Junyu"
```

Proto můžeme při vytváření `ContentView` napsat přímo:

```swift
ContentView()
```

V této chvíli `name` použije výchozí hodnotu a rozhraní zobrazí:

```swift
name: Fang Junyu
```

Samozřejmě můžeme při vytváření zobrazení předat také novou hodnotu:

```swift
ContentView(name: "Sam")
```

V tom případě zobrazení použije `"Sam"` předané zvenku, místo aby použilo výchozí hodnotu, a rozhraní zobrazí:

```swift
name: Sam
```

Pro snazší pochopení si můžeme automaticky generovanou inicializační metodu Swiftu představit jednoduše takto:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Zde `name: String = "Fang Junyu"` znamená: pokud při vytváření zobrazení nepředáme `name`, použije se výchozí hodnota `"Fang Junyu"`; pokud při vytváření zobrazení předáme nové `name`, použije se předaná hodnota.

Jinými slovy: **pokud zvenku není předán parametr, použije se výchozí hodnota vlastnosti; pokud zvenku parametr předán je, použije se předaná hodnota.**

## Zpět k SettingItemView

Teď se znovu podíváme na SettingItemView:

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

Struktura tohoto zobrazení je pevná.

Mezi pevné části patří:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Mezi odlišné části patří:

```swift
icon
color
title
```

Proto z odlišného obsahu uděláme vlastnosti a při vytváření zobrazení je předáme jako parametry.

Když vytváříme různé položky nastavení, stačí předat různé parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
SettingItemView(icon: "folder", color: Color.brown, title: "Folder")
SettingItemView(icon: "music.note", color: Color.purple, title: "Music")
```

Díky tomu může stejné `SettingItemView` zobrazit tři různé položky nastavení.

To je nejběžnější způsob použití vlastního zobrazení.

## Shrnutí

V této lekci jsme se naučili vlastní zobrazení.

Hlavní účel vlastního zobrazení je: **zapouzdřit opakující se kód zobrazení, aby ho bylo možné znovu používat.**

V tomto příkladu je struktura tří položek nastavení stejná; liší se pouze ikona, barva a název.

Proto jsme vytvořili `SettingItemView`:

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

Potom při používání tohoto zobrazení předáváme různé parametry:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Settings")
```

Tyto parametry vstoupí dovnitř `SettingItemView`.

Tímto způsobem můžeme s menším množstvím kódu vytvořit zobrazení se stejnou strukturou, ale odlišným obsahem.

To je také velmi běžný způsob zápisu ve vývoji SwiftUI.
