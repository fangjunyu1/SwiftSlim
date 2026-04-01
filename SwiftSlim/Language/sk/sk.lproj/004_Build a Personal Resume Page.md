# Vytvorenie osobnej profilovej stránky

V tejto lekcii vytvoríme jednoduché zobrazenie osobného profilu a naučíme sa tieto poznatky:

- cornerRadius
- spacing
- ScrollView

Počas vytvárania si zopakujeme rozloženie, Text a Image a zároveň si ukážeme, ako riadiť medzery a dosiahnuť rolovanie obsahu.

## Osobný profil

Cieľový vzhľad:

![Swift](../../RESOURCE/004_img.png)

**Najprv sa ho skúste vytvoriť samostatne a až potom pokračujte v čítaní nižšie uvedeného vysvetlenia.**

### Vytvorenie projektu

Vytvorte nový iOS projekt alebo pokračujte v predchádzajúcom projekte.

Predvolený kód ContentView:

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

Teraz kód vymažte a začnite písať vlastný obsah:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Celková štruktúra

V skutočnom vývoji si zvyčajne najprv navrhneme celkovú štruktúru.

Naša stránka obsahuje:

1. nadpis
2. osobné informácie
3. osobné predstavenie

Na najvzdialenejšej úrovni pridáme VStack:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack zabezpečí vertikálne usporiadanie zobrazení a zároveň umožní riadiť ich poradie a rozstupy.

### Nadpis

Najprv vytvoríme Text na zobrazenie nadpisu.

Tu ako nadpis zobrazím svoje anglické meno:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Nadpis býva zvyčajne väčší a tučný, preto použijeme modifikátory font a fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Sadzba rozloženia

Predvolené zarovnanie v SwiftUI je center, preto sa nadpis zobrazuje uprostred ContentView.

![Swift](../../RESOURCE/004_img3.png)

Potrebujeme zobraziť nadpis v hornej časti zobrazenia. Na úpravu rozloženia môžeme použiť Spacer:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer zaberie zvyšný priestor a vytlačí Text do hornej časti kontajnera.

![Swift](../../RESOURCE/004_img4.png)

### Voľný priestor

Ak sa vám zdá, že text je príliš blízko horného okraja, môžete použiť padding alebo Spacer.

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

Tým nastavíme horný vnútorný okraj VStack na 20.

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

Môžeme tiež použiť Spacer a nastavením výšky cez frame získať voľný priestor s presnou výškou.

Výsledok:

![Swift](../../RESOURCE/004_img5.png)

### Obrázok

Pripravíme si vlastnú profilovú fotografiu a vložíme ju do priečinka Assets.

![Swift](../../RESOURCE/004_img6.png)

V ContentView použijeme Image na zobrazenie obrázka:

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

Keďže pôvodná veľkosť obrázka je pomerne veľká, musíme jeho zobrazenie ovládať pomocou frame.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

V tejto chvíli si všimneme jeden problém:

Ak sa pomer šírky a výšky vo frame nezhoduje s pôvodným pomerom obrázka, obrázok sa deformuje.

Napríklad:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Aby sme zabránili deformácii obrázka, musíme použiť scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Účinok scaledToFit je nasledovný:

V rámci zadaného frame škáluje obrázok podľa jeho pôvodného pomeru strán a zobrazí celý obsah obrázka.

Nebude obrázok násilne naťahovať, aby zaplnil celý frame. Zachová pomer šírky a výšky a zmenší alebo zväčší ho proporcionálne, kým sa jedna strana presne neprispôsobí hranici.

To znamená:

* ak je menšia šírka frame, obrázok sa bude škálovať podľa šírky,
* ak je menšia výška frame, obrázok sa bude škálovať podľa výšky,
* obrázok si vždy zachová pôvodný pomer strán a nebude deformovaný.

Často stačí nastaviť veľkosť len v jednom smere. Napríklad:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Systém potom podľa šírky 140 automaticky vypočíta vhodnú výšku a zároveň zachová pomer obrázka.

Ak potrebujete fixný vizuálny pomer alebo chcete zabrániť stlačeniu v zložitejšom rozložení, môžete obmedziť šírku aj výšku naraz.

### Zaoblené rohy

Ak chcete, aby sa obrázok zobrazoval so zaoblenými rohmi, môžete použiť modifikátor cornerRadius:

```swift
.cornerRadius(10)
```

Napríklad:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Za modifikátory Image pridáme cornerRadius(20).

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) znamená, že hranice zobrazenia sa orežú a použije sa polomer zaoblenia 20.

Po pridaní zaoblenia sa štyri rohy obrázka zmenia na oblúkové tvary, čím výsledok pôsobí jemnejšie a modernejšie.

Tento štýl je v súčasnom dizajne rozhraní veľmi bežný. Napríklad ikony aplikácií v iOS používajú zaoblený obdĺžnikový tvar, hoci systémové ikony využívajú superelipsu so spojitou krivkou, nie jednoduché zaoblenie rohov.

### Osobné informácie

Teraz začneme vytvárať oblasť osobných informácií na ľavej strane obrázka. Zo štruktúry rozhrania je vidieť, že osobné informácie a obrázok sú zoradené vodorovne, preto musíme použiť HStack.

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

Obsah osobných informácií je usporiadaný zvislo.

![Swift](../../RESOURCE/004_img11.png)

Preto použijeme navonok HStack, pre osobné informácie VStack a textový obsah zobrazíme pomocou Text.

Základná štruktúra:

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

**Zvýraznenie názvov polí**

Aby sme odlíšili názvy polí od ich hodnôt, môžeme na názvy polí použiť fontWeight:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Zarovnanie textu doľava**

VStack je predvolene centrovaný. Ak chceme mať všetok text zarovnaný doľava, musíme nastaviť zarovnanie:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading znamená zarovnanie podľa ľavej strany v jazykovom prostredí zľava doprava.

![Swift](../../RESOURCE/004_img14.png)

### Rozstupy

Ak chceme medzi osobnými informáciami a obrázkom ponechať pevnú medzeru, predtým sme sa učili používať Spacer:

```swift
Spacer()
    .frame(width: 10)
```

Môžeme však použiť aj parameter spacing v HStack:

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

spacing: 30 znamená, že vzdialenosť medzi dvoma podriadenými zobrazeniami bude 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Čo je spacing?**

Vo VStack, HStack a ZStack môže spacing riadiť vzdialenosť medzi podriadenými zobrazeniami.

Napríklad:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Rozstup medzi podriadenými zobrazeniami vo VStack bude nastavený na 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Treba si uvedomiť, že spacing pôsobí iba na „priame podriadené zobrazenia“ a neovplyvňuje rozloženie vo vnorených kontajneroch.

**Ovládanie vnútorných rozstupov v zozname**

Ak chceme zväčšiť medzeru medzi jednotlivými poľami, najjednoduchším spôsobom je nastaviť spacing vo VStack:

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

Tým sa medzera medzi všetkými podriadenými zobrazeniami zmení na 10 pt.

Pri pohľade na rozhranie si však všimneme problém:

Medzera vznikne medzi jednotlivými skupinami polí, ale rovnaká medzera sa objaví aj medzi názvom poľa a jeho hodnotou.

Je to preto, že spacing pôsobí na všetky priame podriadené zobrazenia aktuálneho kontajnera.

V tejto štruktúre je každý Text priamym podriadeným prvkom vonkajšieho VStack, preto je rozostup jednotný.

Ak chceme mať medzeru medzi skupinami polí, ale názov poľa a jeho hodnota majú zostať pri sebe, môžeme „názov poľa + hodnota poľa“ považovať za jeden logický celok a obaliť ich ďalším VStack:

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

V tomto prípade bude mať vonkajší VStack medzery medzi svojimi vnútornými skupinami, zatiaľ čo vnútorné VStacks si ponechajú predvolený kompaktný rozstup. Preto medzi názvom poľa a jeho hodnotou nevznikne ďalšia medzera.

![Swift](../../RESOURCE/004_img18.png)

### Osobné predstavenie

Teraz vytvoríme oblasť osobného predstavenia.

Zo štruktúry rozhrania vidno, že obsah predstavenia sa skladá z viacerých riadkov textu, ktoré sú usporiadané zvislo.

![Swift](../../RESOURCE/004_img19.png)

Preto môžeme použiť VStack spolu s Text:

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

**Pridanie rozstupov**

Teraz sú osobné informácie a osobné predstavenie príliš natlačené a vzhľad nepôsobí dobre.

![Swift](../../RESOURCE/004_img20.png)

Keďže sa obe časti nachádzajú v tom istom vonkajšom kontajneri, môžeme celkový rozstup riadiť práve na ňom:

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

Výsledok:

![Swift](../../RESOURCE/004_img21.png)

**Rozstupy v zozname**

Na nastavenie rozstupov medzi textami osobného predstavenia použijeme spacing:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Dokončenie osobného profilu

Teraz je základná štruktúra nášho osobného profilu hotová.

![Swift](../../RESOURCE/004_img.png)

### ScrollView — rolovacie zobrazenie

Momentálne je stránka vytvorená pomocou VStack. Keď je textov predstavenia málo, nevzniká problém. Ak ich však zvýšime na 20, 30 alebo viac, výška obsahu presiahne výšku obrazovky.

Napríklad:

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

Vtedy nastanú dva javy:

* spodný obsah bude odrezaný,
* stránka sa nebude dať rolovať.

To nie je problém VStack. VStack je iba kontajner rozloženia a automaticky neposkytuje možnosť rolovania.

**Čo je ScrollView**

ScrollView je rolovateľný kontajner, vhodný pre veľké množstvo obsahu, ktorý presahuje veľkosť obrazovky. Napríklad pri zvislých alebo vodorovných zoznamoch.

Základná štruktúra:

```swift
ScrollView {
    ...
}
```

Ak chceme dosiahnuť efekt rolovania, musíme celý obsah stránky obaliť do ScrollView:

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

Tým sa celá stránka stane rolovateľnou oblasťou a keď obsah presiahne výšku obrazovky, bude možné prirodzene rolovať.

ScrollView predvolene zobrazuje indikátor rolovania. Ak ho chceme skryť, môžeme nastaviť:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Kompletný kód

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
