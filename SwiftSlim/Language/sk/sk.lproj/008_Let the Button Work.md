# Aby tlačidlo začalo fungovať

V tejto lekcii sa budeme učiť hlavne o tlačidle Button, výstupe debug informácií cez print a o funkciách v Swifte.

Tieto poznatky sú základom interaktívneho programovania v SwiftUI.

## Tlačidlo

Tlačidlo patrí medzi najbežnejšie UI prvky. Keď potrebujeme niečo stiahnuť, otvoriť alebo ukončiť, zvyčajne klikáme práve na tlačidlo.

Napríklad v App Store klikneme na tlačidlo „Získať“, aby sme stiahli App.

![Button](../../RESOURCE/008_button.png)

V SwiftUI sa tlačidlo zapisuje pomocou Button.

Základné použitie:

```swift
Button("") {
    
}
```

Jeho štruktúru možno rozdeliť na dve časti:

```swift
Button("Text tlačidla") {
    kód, ktorý sa vykoná po kliknutí na tlačidlo
}
```

Napríklad:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Po spustení sa zobrazí tlačidlo Start.

![Button](../../RESOURCE/008_button1.png)

Keď používateľ klikne na tlačidlo, vykoná sa kód vo vnútri {}.

Treba si uvedomiť, že Button patrí medzi prvky rozhrania SwiftUI, teda View, a preto musí byť napísaný vo vnútri body.

### Modifikátor buttonStyle

V SwiftUI poskytuje Button systémové štýly tlačidiel, ktoré možno použiť pomocou modifikátora buttonStyle.

Napríklad:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle použije systémový štýl tlačidla.

Bežné možnosti zahŕňajú:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

Rozdiely medzi jednotlivými štýlmi sa prejavujú hlavne v tom, či má tlačidlo okraj, pozadie a aká je úroveň jeho vizuálneho zvýraznenia.

## Výstup cez print

Pri programovaní často potrebujeme overiť, či sa program dostal do určitej časti kódu.

Swift poskytuje funkciu print na výpis debug informácií.

Základný zápis:

```swift
print("Hello")
```

Tento riadok vypíše text do Console.

### Otestovanie, či tlačidlo funguje

print môžeme napísať do tlačidla a použiť ho na otestovanie, či bolo tlačidlo stlačené.

```swift
Button("Start") {
    print("Test 123")
}
```

Po kliknutí na tlačidlo sa v Console zobrazí:

```id="slse4o"
Test 123
```

To znamená, že tlačidlo bolo úspešne spustené.

![Button](../../RESOURCE/008_button3.png)

Poznámka: print je Swift kód, nie prvok rozhrania. Nemožno ho vložiť priamo do body, inak vznikne chyba.

Napríklad tento zápis je nesprávny:

```swift id="v4xfot"
struct ContentView: View {
    var body: some View {
        print("Test 123")  // chyba: body musí vrátiť View
    }
}
```

V SwiftUI slúži body na opis štruktúry rozhrania, preto doň možno vkladať iba prvky View, ako napríklad Text, Button alebo Image.

Bežný kód, ako výpočty alebo print, musí byť umiestnený v tlačidle, funkcii alebo inom obslužnom kóde udalostí.

### Ovládacia konzola Console

Obsah vypísaný cez print sa zobrazuje v Console v Xcode.

Ak Console nevidíte, môžete kliknúť na tlačidlo Show the Debug Area v pravom dolnom rohu, čím otvoríte debug oblasť, a potom kliknúť na Show the Console, aby sa zobrazila konzola.

![](../../RESOURCE/008_button4.png)

V ľavom dolnom rohu Console sa nachádzajú dve záložky: Executable a Previews.

![](../../RESOURCE/008_button5.png)

Tieto dve záložky zodpovedajú rôznym prostrediam spustenia. Keď používate náhľad v Canvas, výstup z print sa zobrazí pod záložkou Previews. Ak App spúšťate v simulátore alebo na fyzickom zariadení, výstup sa zobrazí pod záložkou Executable.

Preto keď zistíte, že print nič nevypisuje, najprv si overte, či ste vybrali správnu záložku.

## Príklad – ASCII obrázok z textových znakov

V niektorých projektoch možno často vidieť ASCII obrázky.

ASCII obrázok je obrazec vytvorený z bežných znakov, napríklad:

![ASCII](../../RESOURCE/008_ascii.png)

Pomocou Button + print môžeme vypísať ASCII obrázok.

Ukážkový kód:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po kliknutí na tlačidlo sa v Console vypíše:

```id="9beqqe"
 /\_/\
( o.o )
 > ^ <
```

Poznámka: znak \ v reťazci treba zapísať ako \ , pretože spätné lomítko je v reťazci escape znak.

## Funkcie

Do tlačidla môžeme napísať kód priamo.

Napríklad:

```swift id="x4vljc"
Button("Start") {
    print("Hello")
}
```

Ak je kódu málo, je to v poriadku. V skutočnom vývoji však logika spustená tlačidlom môže byť omnoho rozsiahlejšia.

Napríklad:

```swift id="vehx0l"
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // môže tu byť ešte veľa ďalšieho kódu
}
```

Ak je kódu stále viac, jeho priame písanie do tlačidla spôsobí, že kód rozhrania bude neprehľadný a ťažko sa bude čítať aj udržiavať.

Preto takýto kód zvyčajne presunieme do funkcie a v tlačidle iba zavoláme túto funkciu.

### Čo je funkcia

Funkcia je úsek kódu, ktorý možno opakovane používať.

Keď potrebujeme určitý kód vykonať, stačí zavolať funkciu a vykoná sa kód vo vnútri nej.

Vďaka tomu je štruktúra kódu prehľadnejšia a zároveň sa takýto kód dá opakovane používať.

### Základný zápis

V Swifte sa funkcie definujú pomocou kľúčového slova **func**:

```swift
func randomInt() {
    // code
}
```

Tento kód definuje funkciu.

randomInt je názov funkcie, ktorým sa označuje tento úsek kódu.

() označuje miesto pre parametre, teda údaje odovzdané zvonka. Ak žiadne údaje nepotrebujeme, môžu zostať prázdne.

Vo vnútri {} sa nachádza telo funkcie, kam zapisujeme všetok kód, ktorý sa má vykonať.

Napríklad:

```swift
func getName() {
    print("FangJunyu")
}
```

Táto funkcia slúži na výpis jedného textu.

### Volanie funkcie

Definovanie funkcie len vytvorí tento úsek kódu. Ak ho chceme naozaj vykonať, musíme funkciu zavolať.

Volanie sa zapisuje tak, že za názov funkcie pridáme ():

```swift
getName()
```

Keď program vykoná tento riadok, spustí sa kód vo funkcii getName.

Úplný príklad:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Po spustení sa v Console zobrazí:

```id="4r6grf"
FangJunyu
```

### Použitie funkcie v SwiftUI

Vo SwiftUI sa funkcie zvyčajne píšu mimo body.

Napríklad:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Po kliknutí na tlačidlo sa zavolá funkcia getName().

Takto zostane kód rozhrania jednoduchý a konkrétna logika bude spracovaná vo funkcii.

### Parametre funkcie

Niekedy musí funkcia vykonať rôzne operácie podľa rôznych údajov.

Napríklad chceme, aby funkcia dokázala vypísať rôzne mená, a nie iba pevne zadané "FangJunyu".

Vtedy môžeme použiť parameter. Parameter si možno predstaviť ako údaje odovzdané pri volaní funkcie.

Napríklad:

```swift
func getName(name: String) {
    print(name)
}
```

Táto funkcia pridáva jeden parameter. name je názov parametra a String je jeho typ.

To znamená, že funkcia musí prijať údaje typu String.

Keďže funkcia teraz údaje vyžaduje, pri volaní ich musíme dodať.

```swift
getName(name: "Sam")
```

Keď pri volaní odovzdáme "Sam", funkcia túto hodnotu použije a vypíše ju.

Výsledok:

```id="u2sej3"
Sam
```

## Príklad – výpis ASCII obrázka pomocou funkcie

V predchádzajúcom príklade sme písali print priamo do tlačidla.

Ak je však ASCII obrázok zložitejší, kód sa predĺži. Vtedy môžeme logiku presunúť do funkcie, aby bol kód rozhrania prehľadnejší.

Ukážkový kód:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po spustení a kliknutí na tlačidlo sa v Console vypíše:

```id="m409ot"
 /\_/\
( o.o )
 > ^ <
```

Tu sa stanú dve veci, keď používateľ klikne na tlačidlo:

1. tlačidlo zavolá funkciu printCat()
2. vykoná sa print kód vo funkcii

Takto je kód rozhrania zodpovedný iba za spustenie udalosti a konkrétna logika sa spracúva vo funkcii.

V skutočnom vývoji bude väčšina operácií tlačidiel realizovaná práve pomocou funkcií.

## Zhrnutie

V tejto lekcii sme sa naučili tri dôležité veci:

**1. Tlačidlo Button**

Button je prvok v SwiftUI, ktorý sa používa na spustenie operácie.

```swift
Button("Start") {

}
```

Keď používateľ klikne na tlačidlo, vykoná sa kód vo vnútri zložených zátvoriek.

**2. Výstup cez print**

print sa používa na výpis debug informácií do Console.

```swift
print("Hello")
```

Vývojár môže cez Console sledovať stav behu programu.

**3. Funkcie**

Funkcia je úsek kódu, ktorý možno používať opakovane.

```swift
func sayHello() {
    print("Hello")
}
```

Volanie funkcie:

```swift
sayHello()
```

Ak funkcia potrebuje údaje, môžeme použiť parameter:

```swift
func sayHello(name: String) {
    print(name)
}
```

V ďalších lekciách sa budeme ďalej učiť ďalšie SwiftUI prvky a tiež to, ako údaje komunikujú s rozhraním.

## Cvičenie

Skúste splniť tieto úlohy:

1. vytvorte tlačidlo s textom "Hello"
2. po kliknutí na tlačidlo vypíšte do Console text Hello Swift
3. presuňte výpis do funkcie a túto funkciu potom zavolajte v tlačidle
