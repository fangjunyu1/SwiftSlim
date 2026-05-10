# Přizpůsobení vzhledu

V této lekci se naučíme přizpůsobení vzhledu pro světlý a tmavý režim.

Na iPhonu, iPadu a Macu si uživatel může vybrat světlý nebo tmavý režim.

Když se systém přepne do tmavého režimu, často se spolu s ním změní také pozadí, text a barvy ikon v mnoha aplikacích.

Například přes den může mít rozhraní světlé pozadí a v noci se může změnit na tmavé pozadí.

![view](../../../Resource/025_view9.png)

Schopnost automaticky upravit zobrazení rozhraní podle systémového vzhledu se nazývá přizpůsobení vzhledu.

## Náhled přizpůsobení vzhledu v Xcode

Než se začneme učit přizpůsobení vzhledu, nejprve si ukážeme, jak v Xcode zobrazit náhled světlého a tmavého režimu.

Ve spodní části oblasti `Canvas` klikněte na tlačítko `Device Settings`. Otevře se okno `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

V tomto okně uvidíte nastavení `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Konkrétně:

- `Light Appearance` znamená světlý režim.
- `Dark Appearance` znamená tmavý režim.

Zde můžeme přepínat náhled vzhledu a zkontrolovat, jak se aktuální rozhraní zobrazuje ve světlém i tmavém režimu.

## Zobrazení dvou vzhledů vedle sebe

Pokud chcete současně zobrazit světlý i tmavý režim, můžete použít funkci `Variants`.

Ve spodní části oblasti `Canvas` klikněte na tlačítko `Variants` a vyberte `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Po výběru bude `Canvas` současně zobrazovat náhled světlého i tmavého režimu.

![canvas3](../../../Resource/025_view3.png)

Díky tomu lze pohodlněji porovnat rozdíly rozhraní v obou vzhledech.

Jednoduše řečeno:

Pokud chcete jen dočasně přepnout světlý/tmavý režim, můžete použít `Canvas Device Settings`.

Pokud chcete současně zobrazit oba vzhledy, můžete použít `Color Scheme Variants`.

## Výchozí přizpůsobení vzhledu u zobrazení

Ve SwiftUI se mnoho systémových zobrazení ve výchozím stavu automaticky přizpůsobuje světlému a tmavému režimu.

Například:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Světlý")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nějaký nějaký nějaký")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Výsledek zobrazení:

![canvas](../../../Resource/025_view4.png)

Můžete vidět, že ve světlém režimu se ikona a nadpis obvykle zobrazují tmavě.

V tmavém režimu se ikona a nadpis automaticky změní na světlou barvu.

Je to proto, že zobrazení SwiftUI jako `Text` a `Image` ve výchozím stavu upravují barvy podle systémového vzhledu.

Jinými slovy, pokud ručně neurčíme pevnou barvu, SwiftUI nám pomůže zpracovat část přizpůsobení vzhledu.

## Pevné barvy se automaticky nezamění

Je potřeba si všimnout, že pokud ručně určíme pevnou barvu, nebude se automaticky přepínat podle světlého/tmavého režimu.

Například:

```swift
Text("nějaký nějaký nějaký")
	.foregroundStyle(Color.gray)
```

Zde je text nastaven na `Color.gray`, takže se bude vždy zobrazovat šedě.

Další příklad:

```swift
Text("Nadpis")
    .foregroundStyle(Color.white)
```

Tento kód zobrazí bílý text ve světlém i tmavém režimu.

Pokud je pozadí také světlé, bílý text může být špatně čitelný.

Při přizpůsobení vzhledu je proto vhodné vyhnout se náhodnému napevno zadanému použití barev jako `Color.white` nebo `Color.black`.

V mnoha případech můžeme přednostně používat systémové sémantické styly, například:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Konkrétně:

- `.primary` se obvykle používá pro hlavní obsah.
- `.secondary` se obvykle používá pro vedlejší obsah.

Tyto styly automaticky upraví výsledek zobrazení podle světlého/tmavého režimu.

## Zobrazení různého obsahu podle vzhledu

Někdy nechceme měnit jen barvy, ale chceme v různých vzhledech zobrazit i jiný obsah.

Například:

- Ve světlém režimu zobrazit běžnou ikonu žárovky.
- V tmavém režimu zobrazit svítící ikonu žárovky.
- Ve světlém režimu zobrazit nadpis `Světlý`.
- V tmavém režimu zobrazit nadpis `Tmavý`.

V takové situaci potřebujeme zjistit, zda je systém právě ve světlém nebo tmavém režimu.

Ve SwiftUI můžeme aktuální režim vzhledu získat pomocí hodnoty prostředí `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Celý kód:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Světlý" : "Tmavý"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nějaký nějaký nějaký")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/025_view5.png)

Z náhledu je vidět, že stejné zobrazení v různých režimech vzhledu neukazuje úplně stejný obsah.

Ve světlém režimu `Image` zobrazuje běžnou ikonu žárovky a nadpis se zobrazuje jako `Světlý`.

V tmavém režimu `Image` zobrazuje svítící ikonu žárovky a nadpis se zobrazuje jako `Tmavý`.

Jinými slovy, změna zde není jen změnou barvy, ale mění se také samotný název ikony a text nadpisu.

Je to proto, že jsme ikonu a nadpis nenapsali napevno přímo do `body`, ale podle `colorScheme` jsme vypočítali různý obsah.

V tomto kódu jsme použili dvě vypočítané vlastnosti:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Světlý" : "Tmavý"
}
```

Když je `colorScheme` `.light`, znamená to, že aktuální režim je světlý.

Když je `colorScheme` `.dark`, znamená to, že aktuální režim je tmavý.

Proto můžeme podle různých režimů vzhledu vracet různé názvy ikon a texty nadpisů.

To je také běžné použití vypočítaných vlastností: podle aktuálního stavu vypočítat obsah, který má zobrazení ukázat.

## Pochopení @Environment

S `@Environment` se setkáváme poprvé.

`@Environment` můžeme chápat jako čtení hodnoty z prostředí SwiftUI.

Když aplikace běží, systém poskytuje mnoho informací o prostředí, například:

- Aktuální jazyk
- Aktuální režim vzhledu
- Aktuální směr rozložení
- Aktuální nastavení velikosti písma

Když potřebujeme získat aktuální režim vzhledu, můžeme přečíst `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Zde

```swift
\.colorScheme
```

znamená přečtení hodnoty `colorScheme` z prostředí.

```swift
private var colorScheme
```

znamená uložit přečtenou hodnotu do proměnné `colorScheme`.

Název proměnné si můžete zvolit sami, například ho lze napsat také takto:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Dokud se přední část `\.colorScheme` nezmění, stále to znamená čtení aktuálního režimu vzhledu.

## Dvě běžné hodnoty colorScheme

`colorScheme` má běžně dvě hodnoty:

```swift
.light
.dark
```

Ty znamenají:

- `.light`: světlý režim
- `.dark`: tmavý režim

Například:

```swift
private var titleName: String {
    colorScheme == .light ? "Světlý" : "Tmavý"
}
```

Význam tohoto kódu je:

Pokud je aktuální režim světlý, výraz `colorScheme == .light` platí a vrátí se `"Světlý"`.

V opačném případě se vrátí `"Tmavý"`.

Proto se ve světlém režimu:

```swift
Text(titleName)
```

zobrazí:

```swift
Světlý
```

V tmavém režimu se zobrazí:

```swift
Tmavý
```

Tímto způsobem můžeme podle různých vzhledů zobrazovat různý obsah.

## Příklad přizpůsobení barev

Kromě textu a ikon někdy potřebujeme sami zpracovat také přizpůsobení barev.

Například:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/025_view6.png)

V tomto kódu je text bílý a pozadí černé.

Ve světlém režimu je černé pozadí poměrně výrazné.

V tmavém režimu však může černé pozadí splynout se systémovým pozadím, pokud je celé rozhraní také černé, a nemusí působit dostatečně zřetelně.

V takové situaci můžeme podle režimu vzhledu přepínat barvu textu a barvu pozadí:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/025_view7.png)

Nyní je ve světlém režimu černé pozadí a bílý text.

V tmavém režimu je bílé pozadí a černý text.

Tak má text a pozadí v obou vzhledech zřetelný kontrast a uživatel může obsah jasně vidět.

## Použití Assets pro přizpůsobení barev

Kromě ručního rozhodování pomocí `colorScheme` můžeme pro přizpůsobení světlému/tmavému režimu použít také barvy z prostředků `Assets`.

Tento způsob je vhodnější pro správu obecných barev v aplikaci.

V projektu Xcode najděte složku prostředků `Assets`.

![assets](../../../Resource/025_color.png)

Otevřete složku `Assets`, klikněte pravým tlačítkem do prázdné oblasti a vyberte `New Color Set`, čímž vytvoříte nový barevný prostředek.

![assets](../../../Resource/025_color1.png)

Zde vytvoříme barvu a pojmenujeme ji `redText`.

![assets](../../../Resource/025_color2.png)

Barevný prostředek může samostatně nastavit barvu pro světlý režim a barvu pro tmavý režim.

![assets](../../../Resource/025_color3.png)

Po výběru odpovídající barevné oblasti můžete barvu upravit v inspektoru vlastností vpravo.

Klikněte na tlačítko `Hide or show the Inspectors` v pravém horním rohu a otevřete oblast inspektorů.

Poté vyberte `Show the Attributes inspector` a dole najděte `Show Color Panel`, čímž otevřete panel barev.

![assets](../../../Resource/025_color4.png)

Po kliknutí na barvu v panelu barev se odpovídající barevná oblast `redText` současně změní.

Zde nastavíme `redText` takto:

- Ve světlém režimu se zobrazí červeně
- V tmavém režimu se zobrazí zeleně

![assets](../../../Resource/025_color5.png)

Po návratu do kódu SwiftUI můžeme tuto barvu použít takto:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Zde:

```swift
Color("redText")
```

znamená načtení barevného prostředku s názvem `redText` z `Assets`.

Výsledek zobrazení:

![assets](../../../Resource/025_view8.png)

Můžete vidět, že stejný `Color("redText")` se ve světlém a tmavém režimu zobrazuje různými barvami.

To ukazuje, že samotné barvy v `Assets` také podporují přizpůsobení vzhledu.

## Rozdíl mezi colorScheme a Assets

`colorScheme` i `Assets` mohou realizovat přizpůsobení vzhledu, ale hodí se pro různé situace.

Pokud jen přepínáte textový obsah, název obrázku nebo název `SF Symbols` podle světlého/tmavého režimu, můžete použít `colorScheme`.

Například:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Pokud jde o často používané barvy v aplikaci, například tematickou barvu, barvu pozadí karty nebo barvu textu, doporučuje se spíše použít barvy v `Assets`.

Protože barvy v `Assets` lze znovu používat ve více zobrazeních a jejich pozdější úprava je pohodlnější.

Například:

```swift
Color("redText")
```

Stačí pak upravit barvu v `Assets` a všechna místa, která tuto barvu používají, se změní společně.

## Shrnutí

V této lekci jsme se naučili přizpůsobení vzhledu pro světlý a tmavý režim.

Nejprve jsme se naučili, jak v `Canvas` v Xcode zobrazit náhled různých vzhledů, a také jak pomocí `Color Scheme Variants` současně zobrazit světlý a tmavý režim.

Poté jsme zjistili, že zobrazení SwiftUI jako `Text` a `Image` se ve výchozím stavu automaticky přizpůsobují systémovému vzhledu.

Pokud však ručně určíme pevnou barvu, například `Color.white` nebo `Color.black`, tyto barvy se automaticky nezamění.

Dále jsme se naučili `@Environment` a `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pomocí `colorScheme` můžeme určit, zda je aktuální režim světlý nebo tmavý, a podle různých vzhledů zobrazit různé ikony, texty nebo barvy.

Nakonec jsme se naučili barvy v `Assets`.

Barvy v `Assets` lze samostatně nastavit pro světlý a tmavý režim a jsou vhodné pro správu obecných barevných prostředků v aplikaci.

Přizpůsobení vzhledu umožňuje aplikaci lépe vypadat ve dne i v noci a také pomáhá zabránit problémům, jako je nečitelný text nebo nevýrazné pozadí.

V reálném vývoji se doporučuje nejprve používat výchozí schopnosti přizpůsobení SwiftUI a barvy v `Assets`.

Když je v různých vzhledech potřeba přepínat text, ikonu, obrázek nebo zpracovat několik speciálních efektů zobrazení, teprve potom použijte `colorScheme` pro rozhodování.

## Rozšířené znalosti: určení velikosti písma

Když jsme se dříve učili `font`, používali jsme některé systémové styly písma:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Kromě použití systémových stylů písma jako `.largeTitle` a `.callout` můžeme velikost písma určit také ručně.

Například:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Zde:

```swift
.font(.system(size: 100))
```

znamená nastavit velikost písma na `100 pt`.

U ikon `SF Symbols` ovlivňuje `font` také velikost ikony.

Pokud tedy chcete, aby se ikona zobrazovala větší, můžete velikost určit pomocí `.font(.system(size:))`.

Například:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Je potřeba si všimnout, že ruční určení velikosti písma je sice flexibilnější, ale u běžného textu se nedoporučuje používat velké množství pevných velikostí.

U běžného textu je vhodné přednostně používat systémové styly písma jako `.title`, `.headline`, `.body` nebo `.caption`.

Tak se lépe přizpůsobí různým zařízením a uživatelskému nastavení velikosti písma.
