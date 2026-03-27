# Vytvoření osobní stránky s životopisem

V této lekci vytvoříme jednoduché zobrazení osobního životopisu a naučíme se následující:

- `cornerRadius`
- `spacing`
- `ScrollView`

Během vytváření si zopakujeme znalosti o rozvržení, `Text` a `Image` a zároveň si ukážeme, jak řídit mezery a jak pracovat s rolovatelným obsahem.

## Osobní životopis

Cílový výsledek:

![Swift](../../RESOURCE/004_img.png)

**Nejprve si zkuste stránku vytvořit samostatně a teprve potom pokračujte ve čtení následujícího vysvětlení.**

### Vytvoření projektu

Vytvořte nový iOS projekt, nebo pokračujte v tom, který jste používali dříve.

Výchozí kód v `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Teď kód vymažte a začněte psát vlastní obsah:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Celková struktura

V reálném vývoji obvykle nejprve navrhneme celkovou strukturu.

Naše stránka obsahuje:

1. Titulek
2. Osobní informace
3. Osobní představení

Na nejvzdálenější úroveň přidáme `VStack`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` zajistí vertikální řazení zobrazení a zároveň umožní řídit jejich rozmístění a mezery.

### Titulek

Nejprve vytvoříme `Text`, který zobrazí titulek.

Zde zobrazím titulek jako své anglické jméno:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titulek bývá obvykle větší a tučný, proto zde použijeme modifikátory `font` a `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Rozvržení

Výchozí zarovnání ve SwiftUI je `center`, takže se titulek aktuálně zobrazuje uprostřed `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Potřebujeme titulek zobrazit nahoře ve zobrazení, čehož můžeme dosáhnout pomocí `Spacer`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` zabere zbylý prostor a vytlačí `Text` směrem nahoru v rámci kontejneru.

![Swift](../../RESOURCE/004_img4.png)

### Volný prostor

Pokud se vám zdá, že je text příliš blízko hornímu okraji, můžete použít `padding` nebo `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Tím se nastaví horní vnitřní odsazení `VStack` na `20`.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Můžete také použít `Spacer` a pomocí `frame` nastavit jeho výšku, čímž získáte prázdné místo o přesně dané výšce.

Výsledek:

![Swift](../../RESOURCE/004_img5.png)

### Obrázek

Připravíme si vlastní portrétní fotografii a vložíme ji do složky prostředků `Assets`.

![Swift](../../RESOURCE/004_img6.png)

V `ContentView` pak použijeme `Image` pro její zobrazení:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Protože původní velikost obrázku je poměrně velká, musíme použít `frame` pro řízení zobrazené velikosti.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

V této chvíli si všimneme jednoho problému:

Pokud poměr šířky a výšky ve `frame` neodpovídá původnímu poměru obrázku, obrázek se zdeformuje.

Například:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Abychom zabránili deformaci obrázku, musíme použít `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Úkolem `scaledToFit` je:

Zmenšit nebo zvětšit obrázek v rámci daného `frame` podle jeho původního poměru stran a zároveň zobrazit celý obsah obrázku.

Nevynucuje natažení obrázku tak, aby vyplnil celý `frame`, ale zachovává poměr šířky a výšky a mění velikost proporcionálně, dokud se jedna strana přesně nedotkne hranice.

To znamená:

- Pokud je šířka `frame` menší, obrázek se bude škálovat podle šířky.
- Pokud je výška `frame` menší, obrázek se bude škálovat podle výšky.
- Obrázek si vždy zachová původní poměr a nebude deformovaný.

Obvykle stačí nastavit rozměr jen v jednom směru. Například:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Systém pak automaticky spočítá vhodnou výšku podle šířky `140` a zároveň zachová poměr stran obrázku.

Pokud potřebujete pevný vizuální poměr nebo chcete zabránit stlačení v komplikovanějším rozvržení, můžete omezit šířku i výšku současně.

### Zaoblené rohy

Pokud chcete obrázek zobrazit se zaoblenými rohy, můžete použít modifikátor `cornerRadius`:

```swift
.cornerRadius(10)
```

Například:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Za `Image` přidáme modifikátor `cornerRadius(20)`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` znamená, že se okraje zobrazení oříznou a použije se poloměr zaoblení `20`.

Po přidání zaoblení se čtyři rohy obrázku změní na obloukový tvar, takže vizuální efekt bude jemnější a modernější.

Tento styl návrhu je v dnešních rozhraních velmi běžný, například i ikony aplikací v iOS používají zaoblený obdélníkový tvar. Systémové ikony však používají superelipsu s plynulou křivostí, nikoli jednoduché zaoblené rohy.

### Osobní informace

Nyní začneme vytvářet oblast osobních informací vlevo od obrázku. Ze struktury rozhraní je vidět, že osobní informace a obrázek jsou seřazeny vodorovně, takže musíme použít `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Obsah osobních informací je uspořádán svisle.

![Swift](../../RESOURCE/004_img11.png)

Proto použijeme na vnější úrovni `HStack`, pro osobní informace `VStack` a pro textový obsah `Text`.

Základní struktura:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Zvýraznění názvů polí**

Abychom odlišili názvy polí od jejich hodnot, můžeme na názvy použít `fontWeight`:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Zarovnání textu vlevo**

`VStack` je ve výchozím nastavení zarovnán na střed. Pokud chceme, aby byl všechen text zarovnán vlevo, musíme nastavit zarovnání:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` znamená zarovnání podle levé strany v prostředí jazyků psaných zleva doprava.

![Swift](../../RESOURCE/004_img14.png)

### Rozestupy

Pokud chceme mezi osobními informacemi a obrázkem zachovat pevný rozestup, předtím jsme se učili používat `Spacer`:

```swift
Spacer()
    .frame(width: 10)
```

Můžeme však také použít parametr `spacing` v `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` znamená, že mezera mezi dvěma podřízenými zobrazeními bude `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**Co je spacing?**

Ve `VStack`, `HStack` a `ZStack` může `spacing` řídit vzdálenost mezi podřízenými zobrazeními.

Například:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Rozestup mezi podřízenými zobrazeními ve `VStack` bude nastaven na `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Je důležité si uvědomit, že `spacing` působí jen na "přímé podřízené zobrazení" a neovlivňuje rozvržení uvnitř vnořených kontejnerů.

**Řízení rozestupů uvnitř seznamu**

Pokud chceme zvětšit mezery mezi jednotlivými poli, nejpřímější způsob je nastavit `spacing` přímo na `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Tím se rozestup mezi všemi podřízenými zobrazeními změní na `10 pt`.

Při pohledu na rozhraní si však všimneme jednoho problému:

Mezera vznikne nejen mezi skupinami polí, ale stejná mezera se objeví i mezi názvem pole a jeho hodnotou.

To je proto, že `spacing` působí na všechna přímá podřízená zobrazení aktuálního kontejneru.

V této struktuře je každý `Text` přímým podřízeným vnějšího `VStack`, takže rozestupy jsou jednotné.

Pokud chceme, aby mezi skupinami polí byla mezera, ale mezi názvem pole a jeho hodnotou zůstal výchozí kompaktní rozestup, můžeme "název pole + hodnota pole" považovat za jeden logický celek a zabalit je do samostatného `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

V takové struktuře bude mezi vnějšími `VStack` mezera, zatímco uvnitř každého vnitřního `VStack` zůstane výchozí kompaktní rozestup. Proto se mezi názvem pole a hodnotou neobjeví zbytečné mezery.

![Swift](../../RESOURCE/004_img18.png)

### Osobní představení

Nyní vytvoříme oblast osobního představení.

Ze struktury rozhraní je patrné, že obsah představení tvoří více řádků textu a je uspořádán svisle.

![Swift](../../RESOURCE/004_img19.png)

Proto můžeme použít `VStack` spolu s `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Zvětšení rozestupů**

V tuto chvíli jsou části osobních informací a osobního představení poměrně natěsnané a vizuální styl není příliš hezký.

![Swift](../../RESOURCE/004_img20.png)

Protože se obě části nacházejí ve stejném vnějším kontejneru, můžeme celkový rozestup řídit právě na něm:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Výsledek:

![Swift](../../RESOURCE/004_img21.png)

**Rozestup v seznamu**

Pomocí `spacing` nastavíme rozestupy mezi jednotlivými řádky osobního představení:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Dokončení osobního životopisu

V tuto chvíli je základní rámec našeho osobního životopisu hotový.

![Swift](../../RESOURCE/004_img.png)

### Rolovací zobrazení

Aktuálně používá struktura stránky `VStack`, což není problém, pokud je textu v představení jen málo. Kdybychom však počet řádků zvýšili na 20, 30 nebo ještě více, výška obsahu by přesáhla výšku obrazovky.

Například:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

V tu chvíli se objeví dva jevy:

- Spodní obsah bude oříznut
- Stránku nebude možné rolovat

To ale není problém `VStack`. `VStack` je pouze kontejner pro rozvržení a sám od sebe schopnost rolování neposkytuje.

**Co je ScrollView**

`ScrollView` je rolovatelný kontejner vhodný pro větší množství obsahu, které přesahuje velikost obrazovky, například pro svislé nebo vodorovné seznamy.

Základní struktura:

```swift
ScrollView {
    ...
}
```

Pokud chceme dosáhnout efektu rolování, musíme celý obsah stránky zabalit do `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Tím se celá stránka stane rolovatelnou oblastí a pokud výška obsahu přesáhne výšku obrazovky, bude možné přirozeně rolovat.

`ScrollView` ve výchozím nastavení zobrazuje indikátor posuvníku. Pokud jej chcete skrýt, můžete nastavit:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Kompletní kód

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
