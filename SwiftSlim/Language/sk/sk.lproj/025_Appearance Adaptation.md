# Prispôsobenie vzhľadu

V tejto lekcii sa naučíme prispôsobenie vzhľadu pre svetlý režim a tmavý režim.

Na zariadeniach iPhone, iPad a Mac si používatelia môžu vybrať svetlý režim alebo tmavý režim.

Keď sa systém prepne do tmavého režimu, pozadie, text a farby ikon v mnohých appkách sa zmenia spolu s ním.

Napríklad cez deň môže mať rozhranie svetlé pozadie a v noci sa môže zmeniť na tmavé pozadie.

![view](../../../Resource/025_view9.png)

Schopnosť automaticky upraviť zobrazenie rozhrania podľa systémového vzhľadu sa nazýva prispôsobenie vzhľadu.

## Náhľad prispôsobenia vzhľadu v Xcode

Predtým než sa začneme učiť prispôsobenie vzhľadu, najprv si pozrieme, ako v Xcode zobraziť náhľad svetlého režimu a tmavého režimu.

V spodnej časti oblasti `Canvas` kliknite na tlačidlo `Device Settings`. Otvorí sa vyskakovacie okno `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Vo vyskakovacom okne môžete vidieť nastavenie `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Konkrétne:

- `Light Appearance` znamená svetlý režim.
- `Dark Appearance` znamená tmavý režim.

Tu môžeme prepínať vzhľad náhľadu a pozrieť si, ako sa aktuálne rozhranie zobrazuje v svetlom režime a v tmavom režime.

## Zobrazenie dvoch vzhľadov vedľa seba

Ak chcete naraz zobraziť svetlý režim aj tmavý režim, môžete použiť funkciu `Variants`.

V spodnej časti oblasti `Canvas` kliknite na tlačidlo `Variants` a vyberte `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Po výbere bude `Canvas` naraz zobrazovať náhľad svetlého režimu aj tmavého režimu.

![canvas3](../../../Resource/025_view3.png)

Takto sa pohodlnejšie porovnávajú rozdiely rozhrania v oboch vzhľadoch.

Jednoducho povedané:

Ak chcete iba dočasne prepínať svetlý/tmavý režim, môžete použiť `Canvas Device Settings`.

Ak chcete naraz vidieť oba vzhľady, môžete použiť `Color Scheme Variants`.

## Zobrazenia sa predvolene prispôsobujú vzhľadu

V SwiftUI sa mnoho systémových zobrazení predvolene automaticky prispôsobuje svetlému režimu a tmavému režimu.

Napríklad:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Svetlý")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("niečo niečo niečo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Výsledok zobrazenia:

![canvas](../../../Resource/025_view4.png)

Vidíme, že v svetlom režime sa ikona a nadpis zvyčajne zobrazujú tmavou farbou.

V tmavom režime sa ikona a nadpis automaticky zmenia na svetlú farbu.

Je to preto, že zobrazenia SwiftUI ako `Text` a `Image` predvolene upravujú farby podľa systémového vzhľadu.

Inými slovami, ak ručne neurčíme pevnú farbu, SwiftUI za nás spracuje časť prispôsobenia vzhľadu.

## Pevné farby sa automaticky nevymieňajú

Je potrebné si uvedomiť, že ak ručne určíme pevnú farbu, nebude sa automaticky vymieňať podľa svetlého/tmavého režimu.

Napríklad:

```swift
Text("niečo niečo niečo")
	.foregroundStyle(Color.gray)
```

Tento text je nastavený na `Color.gray`, takže sa bude stále zobrazovať sivou farbou.

Ďalší príklad:

```swift
Text("Názov")
    .foregroundStyle(Color.white)
```

Tento kód zobrazí biely text bez ohľadu na to, či je appka v svetlom režime alebo v tmavom režime.

Ak je aj pozadie svetlé, biely text môže byť ťažko čitateľný.

Preto sa pri prispôsobovaní vzhľadu snažte zbytočne nepísať napevno pevné farby ako `Color.white` a `Color.black`.

V mnohých prípadoch je lepšie uprednostniť systémové sémantické štýly, napríklad:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Konkrétne:

- `.primary` sa zvyčajne používa pre hlavný obsah.
- `.secondary` sa zvyčajne používa pre vedľajší obsah.

Tieto štýly automaticky upravia výsledok zobrazenia podľa svetlého/tmavého režimu.

## Zobrazenie odlišného obsahu podľa vzhľadu

Niekedy nechceme, aby sa zmenila iba farba, ale aby sa v rôznych vzhľadoch zobrazoval aj odlišný obsah.

Napríklad:

- V svetlom režime sa zobrazí obyčajná ikona žiarovky.
- V tmavom režime sa zobrazí rozsvietená ikona žiarovky.
- V svetlom režime nadpis zobrazí `Svetlý`.
- V tmavom režime nadpis zobrazí `Tmavý`.

Vtedy musíme určiť, či je aktuálny systém v svetlom režime alebo v tmavom režime.

V SwiftUI môžeme aktuálny režim vzhľadu získať cez hodnotu prostredia `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Úplný kód:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Svetlý" : "Tmavý"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("niečo niečo niečo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/025_view5.png)

Z náhľadu vidíme, že rovnaké zobrazenie v rôznych režimoch vzhľadu nezobrazuje úplne rovnaký obsah.

V svetlom režime `Image` zobrazuje obyčajnú ikonu žiarovky a nadpis zobrazuje `Svetlý`.

V tmavom režime `Image` zobrazuje rozsvietenú ikonu žiarovky a nadpis zobrazuje `Tmavý`.

To znamená, že sa tu nemení iba farba, ale mení sa aj samotný názov ikony a text nadpisu.

Je to preto, že ikonu a nadpis nepíšeme priamo napevno do `body`, ale vypočítavame odlišný obsah podľa `colorScheme`.

V tomto kóde sme použili dve vypočítané vlastnosti:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Svetlý" : "Tmavý"
}
```

Keď je `colorScheme` hodnota `.light`, znamená to, že aktuálne ide o svetlý režim.

Keď je `colorScheme` hodnota `.dark`, znamená to, že aktuálne ide o tmavý režim.

Preto môžeme podľa rôznych režimov vzhľadu vracať rôzne názvy ikon a texty nadpisov.

Toto je aj bežné použitie vypočítaných vlastností: podľa aktuálneho stavu vypočítať obsah, ktorý má zobrazenie zobraziť.

## Pochopenie @Environment

S `@Environment` sa stretávame prvýkrát.

`@Environment` môžeme chápať ako čítanie hodnoty z prostredia SwiftUI.

Keď appka beží, systém poskytuje veľa informácií o prostredí, napríklad:

- aktuálny jazyk
- aktuálny režim vzhľadu
- aktuálny smer rozloženia
- aktuálne nastavenie veľkosti písma

Keď potrebujeme získať aktuálny režim vzhľadu, môžeme čítať `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Kde

```swift
\.colorScheme
```

znamená, že z prostredia čítame hodnotu `colorScheme`.

```swift
private var colorScheme
```

znamená, že načítanú hodnotu uložíme do premennej `colorScheme`.

Názov premennej si môžeme zvoliť sami. Napríklad ju môžeme napísať aj takto:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Pokiaľ sa predná časť `\.colorScheme` nemení, stále to znamená, že čítame aktuálny režim vzhľadu.

## Dve bežné hodnoty colorScheme

`colorScheme` má bežne dve hodnoty:

```swift
.light
.dark
```

Znamenajú:

- `.light`: svetlý režim
- `.dark`: tmavý režim

Napríklad:

```swift
private var titleName: String {
    colorScheme == .light ? "Svetlý" : "Tmavý"
}
```

Význam tohto kódu je:

Ak je aktuálne svetlý režim, výraz `colorScheme == .light` platí a vráti sa `"Svetlý"`.

V opačnom prípade sa vráti `"Tmavý"`.

Preto sa v svetlom režime:

```swift
Text(titleName)
```

zobrazí:

```swift
Svetlý
```

V tmavom režime sa zobrazí:

```swift
Tmavý
```

Týmto spôsobom môžeme zobrazovať odlišný obsah podľa rôznych vzhľadov.

## Príklad prispôsobenia farieb

Okrem textu a ikon niekedy potrebujeme sami spracovať aj prispôsobenie farieb.

Napríklad:

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

Výsledok zobrazenia:

![view](../../../Resource/025_view6.png)

V tomto kóde je text biely a pozadie čierne.

V svetlom režime je čierne pozadie pomerne výrazné.

V tmavom režime však, ak je celé pozadie rozhrania tiež čierne, toto čierne pozadie splynie so systémovým pozadím a nebude vyzerať dostatočne jasne.

Vtedy môžeme podľa režimu vzhľadu prepínať farbu textu a farbu pozadia:

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

Výsledok zobrazenia:

![view](../../../Resource/025_view7.png)

Teraz je v svetlom režime čierne pozadie a biely text.

V tmavom režime je biele pozadie a čierny text.

Takto majú text a pozadie v každom vzhľade výrazný kontrast a používateľ môže obsah jasne vidieť.

## Použitie Assets na prispôsobenie farieb

Okrem ručného posudzovania pomocou `colorScheme` môžeme na prispôsobenie svetlého/tmavého režimu použiť aj farby zdrojov `Assets`.

Tento spôsob je vhodnejší na správu spoločných farieb v appke.

V projekte Xcode nájdite priečinok zdrojov `Assets`.

![assets](../../../Resource/025_color.png)

Otvorte priečinok `Assets`, kliknite pravým tlačidlom na prázdne miesto a vyberte `New Color Set`, čím vytvoríte nový farebný zdroj.

![assets](../../../Resource/025_color1.png)

Tu vytvoríme farbu a pomenujeme ju `redText`.

![assets](../../../Resource/025_color2.png)

Farebný zdroj môže samostatne nastaviť farby pre svetlý režim a tmavý režim.

![assets](../../../Resource/025_color3.png)

Po výbere príslušnej farebnej oblasti môžete farbu upraviť v pravom inšpektore vlastností.

Kliknite na tlačidlo `Hide or show the Inspectors` v pravom hornom rohu a otvorte oblasť inšpektorov.

Potom vyberte `Show the Attributes inspector`, v spodnej časti nájdite `Show Color Panel` a otvorte panel farieb.

![assets](../../../Resource/025_color4.png)

Kliknite na farbu v paneli farieb a príslušná farebná oblasť `redText` sa zmení zároveň.

Tu nastavíme `redText` takto:

- v svetlom režime sa zobrazí červená
- v tmavom režime sa zobrazí zelená

![assets](../../../Resource/025_color5.png)

Keď sa vrátime do kódu SwiftUI, môžeme túto farbu použiť takto:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Konkrétne:

```swift
Color("redText")
```

znamená, že z `Assets` čítame farebný zdroj s názvom `redText`.

Výsledok zobrazenia:

![assets](../../../Resource/025_view8.png)

Vidíme, že rovnaký `Color("redText")` sa v svetlom režime a tmavom režime zobrazí rôznymi farbami.

To znamená, že aj samotné farby v `Assets` podporujú prispôsobenie vzhľadu.

## Rozdiel medzi colorScheme a Assets

`colorScheme` aj `Assets` môžu realizovať prispôsobenie vzhľadu, ale hodia sa na odlišné situácie.

Ak iba prepínate textový obsah, názov obrázka alebo názov `SF Symbols` podľa svetlého/tmavého režimu, môžete použiť `colorScheme`.

Napríklad:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Ak ide o farby často používané v appke, napríklad tematickú farbu, farbu pozadia karty alebo farbu textu, viac sa odporúča použiť farby `Assets`.

Pretože farby `Assets` sa dajú opakovane používať vo viacerých zobrazeniach a neskôr sa jednoduchšie upravujú.

Napríklad:

```swift
Color("redText")
```

Takto stačí upraviť farbu v `Assets` a všetky miesta, ktoré túto farbu používajú, sa zmenia spolu.

## Zhrnutie

V tejto lekcii sme sa naučili prispôsobenie vzhľadu pre svetlý režim a tmavý režim.

Najprv sme sa naučili, ako v `Canvas` v Xcode zobraziť náhľad rôznych vzhľadov, a tiež ako pomocou `Color Scheme Variants` naraz zobraziť svetlý režim a tmavý režim.

Potom sme pochopili, že zobrazenia ako `Text` a `Image` v SwiftUI sa predvolene automaticky prispôsobujú farbám podľa systémového vzhľadu.

Ak však ručne určíte pevnú farbu, napríklad `Color.white` alebo `Color.black`, tieto farby sa automaticky nevymenia.

Ďalej sme sa naučili `@Environment` a `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pomocou `colorScheme` môžeme určiť, či je aktuálne svetlý režim alebo tmavý režim, a podľa rôznych vzhľadov zobrazovať rôzne ikony, text alebo farby.

Nakoniec sme sa naučili farby `Assets`.

Farby `Assets` môžu samostatne nastaviť farby pre svetlý režim a tmavý režim a hodia sa na správu spoločných farebných zdrojov v appke.

Prispôsobenie vzhľadu môže zabezpečiť, aby mala appka lepší výsledok zobrazenia cez deň aj v noci, a môže tiež zabrániť problémom, ako je nečitateľný text alebo nevýrazné pozadie.

V reálnom vývoji sa odporúča najprv používať predvolené prispôsobenie SwiftUI a farby `Assets`.

Keď je v rôznych vzhľadoch potrebné prepínať text, ikony, obrázky alebo spracovať malé množstvo špeciálnych efektov zobrazenia, až potom použite `colorScheme` na posúdenie.

## Rozšírené poznatky: určenie veľkosti písma

Keď sme sa predtým učili `font`, použili sme niektoré systémové štýly písma:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Okrem použitia systémových štýlov písma ako `.largeTitle` a `.callout` môžeme veľkosť písma určiť aj ručne.

Napríklad:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Tu:

```swift
.font(.system(size: 100))
```

znamená nastaviť veľkosť písma na `100 pt`.

Pre ikony `SF Symbols` ovplyvňuje `font` aj veľkosť ikony.

Preto ak chcete, aby sa ikona zobrazovala väčšia, môžete určiť veľkosť pomocou `.font(.system(size:))`.

Napríklad:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Je potrebné si uvedomiť, že hoci je ručné určovanie veľkosti písma flexibilnejšie, pri bežnom texte sa neodporúča vo veľkom používať pevné veľkosti písma.

Pri bežnom texte uprednostnite systémové štýly písma ako `.title`, `.headline`, `.body` a `.caption`.

Takto sa text lepšie prispôsobí rôznym zariadeniam a používateľským nastaveniam veľkosti písma.
