# Žiarivé farby

V tejto lekcii sa naučíme bežné vizuálne modifikátory v SwiftUI vrátane:

- farby
- farby popredia
- farby pozadia
- posunu
- priehľadnosti
- rozmazania

Budeme sa venovať aj Safe Area (bezpečnej oblasti).

Tieto modifikátory sa používajú na riadenie vizuálneho vzhľadu zobrazenia, aby rozhranie pôsobilo jasnejšie a vrstvenejšie.

## Farby

V SwiftUI môžeme nastaviť farbu textu.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
````

.blue znamená modrú farbu a v skutočnosti ide o skrátený zápis Color.blue vďaka odvodzovaniu typu.

Medzi bežné farby patria:

```id="0rj7sn"
.black
.green
.yellow
.pink
.gray
...
```

Všetko sú to statické vlastnosti typu Color.

![Color](../../RESOURCE/006_color.png)

Color si môžete predstaviť ako typ farby a .blue či .red sú jeho konkrétne farby.

### Zobrazenie Color

V SwiftUI môže byť Color použitý aj ako samostatné zobrazenie.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Tento kód vytvorí červený štvorec s rozmerom 100 × 100.

Môžeme tiež nastaviť, aby celé rozhranie malo určitú farbu:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Po spustení si všimneme, že červená farba nezaplní úplne celú obrazovku. Horná aj dolná časť iPhonu zostávajú biele, čo súvisí s existenciou Safe Area.

## Safe Area (bezpečná oblasť)

Safe Area je oblasť, ktorú systém ponecháva, aby sa obsah neprekrýval s inými prvkami. Zahŕňa:

1. horný stavový riadok (čas, batéria)

2. spodný indikátor Home

3. oblasť výrezu (notch) alebo Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI predvolene obmedzuje obsah na bezpečnú oblasť, takže zobrazenie nesiaha až po okraje obrazovky.

### Ignorovanie Safe Area (bezpečnej oblasti)

Ak chceme, aby farba pokryla celú obrazovku, môžeme použiť ignoresSafeArea:

```swift
Color.red
    .ignoresSafeArea()
```

alebo edgesIgnoringSafeArea:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Takto sa zobrazenie roztiahne na celú obrazovku.

Treba si uvedomiť, že edgesIgnoringSafeArea je starší zápis. Od iOS 14 sa odporúča používať ignoresSafeArea.

## Farba popredia

### Modifikátor foregroundStyle

V predchádzajúcich lekciách sme sa už učili používať foregroundStyle na nastavenie farby.

Napríklad:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle je novší systém štýlov, ktorý podporuje farby, gradienty, materiály a ďalšie efekty.

![Color](../../RESOURCE/006_color2.png)

### Modifikátor foregroundColor

Na nastavenie farby sa dá použiť aj foregroundColor:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Používa sa rovnakým spôsobom ako foregroundStyle.

V najnovších verziách Xcode Xcode upozorňuje, že foregroundColor môže byť v budúcich verziách iOS vyradený, preto sa odporúča uprednostniť foregroundStyle.

## Pozadie

Ak chceme zobrazeniu pridať farbu pozadia, môžeme použiť background:

```swift
background(.red)
```

Napríklad pridanie farby pozadia k textu:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Podobný efekt pozadia môžeme vidieť, keď vyberáme text v aplikáciách ako Word alebo Chrome.

![Color](../../RESOURCE/006_color16.png)

Ak chceme pozadie zväčšiť, musíme ho kombinovať s padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Tu treba venovať pozornosť jednému dôležitému pravidlu:

Modifikátory v SwiftUI sa aplikujú zhora nadol. Modifikátor napísaný neskôr pôsobí na výsledok predchádzajúcich modifikátorov.

Teda:

```swift
.padding()
.background()
```

To znamená, že pozadie obalí zobrazenie až po pridaní vnútorného okraja.

Ak poradie otočíme:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Pozadie sa nezväčší, pretože neobalilo neskorší padding.

## Príklad – štvorhranná matica

Teraz vytvoríme jednoduché zobrazenie štvorhrannej matice.

![Color](../../RESOURCE/006_color8.png)

Najprv vytvoríme biely štvorec s rozmerom 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Ak z neho chceme urobiť kruh, môžeme použiť cornerRadius:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Keď sa polomer rohov rovná polovici šírky a výšky, z tvaru sa stane kruh.

Teraz pridáme modré pozadie:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Nový padding zväčší vonkajšiu oblasť a background nakreslí modrú farbu práve do tejto vonkajšej oblasti.

Tým je efekt štvorhrannej matice hotový.

### Iný prístup

Okrem použitia farby pozadia môžeme štvorhrannú maticu vytvoriť aj pomocou ZStack.

Už sme sa učili, že ZStack umožňuje vrstvené usporiadanie. Štvorhrannú maticu možno chápať aj ako prekrytie kruhu a obdĺžnika.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack prekryje zobrazenia podľa poradia a neskôr pridané zobrazenie sa zobrazí navrchu.

## Príklad – dva prekrývajúce sa kruhy

Mnohé ikony sú zložené z jednoduchých tvarov, napríklad z dvoch prekrývajúcich sa kruhov.

![Color](../../RESOURCE/006_color14.png)

Najprv vytvoríme dva kruhy:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Keďže chceme, aby sa kruhy zobrazovali navrstvené, použijeme ZStack:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

V tomto momente sa dva kruhy rovnakej veľkosti úplne prekrývajú.

Potrebujeme však, aby sa prekrývali len čiastočne, a nie úplne. Na to môžeme použiť offset a vytvoriť efekt posunu.

## Posun

offset mení iba vykreslenú polohu zobrazenia, ale neovplyvňuje výpočet rozloženia rodičovského zobrazenia.

Použitie:

```swift
.offset(x:y:)
```

x je hodnota vodorovného posunu a y je hodnota zvislého posunu.

Kladné hodnoty znamenajú posun doprava alebo nadol, záporné hodnoty znamenajú posun doľava alebo nahor.

Pomocou offset nastavíme dva kruhy na čiastočné prekrývanie:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Poloha červeného kruhu v rozložení sa nezmenila, ale jeho vykreslená poloha sa posunula o 25 bodov doľava. Preto vznikol vizuálny efekt čiastočného prekrývania dvoch kruhov.

## Priehľadnosť

V SwiftUI sa opacity používa na nastavenie priehľadnosti zobrazenia.

Základné použitie:

```swift
.opacity(0.5)
```

Rozsah parametra opacity je od 0.0 do 1.0, kde:

* 0 znamená úplne priehľadné
* 1 znamená nepriehľadné

Pomocou opacity môžeme nastaviť priehľadnosť oranžového kruhu:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Keď nastavíme opacity oranžového kruhu na 0.8, jeho nepriehľadnosť je 80 %. Pri prekrytí dvoch kruhov sa v prekrývajúcej oblasti vytvorí efekt miešania farieb.

## Rozmazanie

V SwiftUI môžeme použiť blur na nastavenie rozmazania:

```swift
.blur(radius:10)
```

radius určuje polomer rozmazania. Čím je hodnota väčšia, tým je rozmazanie výraznejšie.

Môžeme pridať rozmazanie obom kruhom:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Nakoniec vidíme dva veľmi rozmazané kruhy.

## Zhrnutie

Táto lekcia sa zameriavala na bežné vizuálne modifikátory v SwiftUI a ukázala, ako pomocou modifikátorov riadiť farbu, polohu a vizuálny efekt zobrazení.

Na konkrétnych príkladoch sme videli skutočné pôsobenie rôznych vizuálnych modifikátorov v rozhraní a zároveň sme spoznali Safe Area.

Ide o veľmi základné modifikátory. Oplatí sa ich často skúšať a používať, pretože pomáhajú presnejšie riadiť vzhľad rozhrania v skutočnom vývoji.

### Cvičenie po lekcii

* pridajte k obrázku priehľadnosť a rozmazanie
* nastavte tri kruhy s rôznou priehľadnosťou tak, aby sa prekrývali
* vytvorte obrázok na pozadí cez celú obrazovku a ignorujte bezpečnú oblasť
* použite offset na úpravu polohy viacerých zobrazení

Cieľom cvičenia nie je zapamätať si API, ale sledovať vzťah medzi vizuálnymi zmenami a správaním rozloženia.
