# Cykly a seznamy

V této lekci se naučíme cyklus `for` ve Swiftu a `ForEach` ve SwiftUI.

Oba nám mohou pomoci postupně číst prvky v poli. Ve skutečném vývoji často potřebujeme postupně vytahovat skupinu dat, a pak je zpracovat nebo zobrazit. Právě cyklus je důležitý nástroj, který tuto práci umožňuje.

Když prohlížíme web nebo používáme aplikaci, často vidíme mnoho seznamů nebo položek. Takový obsah se obvykle nejprve uloží do `pole`, pak se pomocí `cyklu` postupně přečte a nakonec zobrazí v rozhraní.

Například seznam výsledků vyhledávání Google:

![Google](../../Resource/017_google.png)

Každá položka v seznamu výsledků vyhledávání obvykle odpovídá jedné položce dat a pomocí cyklu se postupně zobrazuje.

Proto se `pole` a `cykly` často objevují společně. `Pole` slouží k uložení skupiny dat a `cyklus` slouží k tomu, aby tato data postupně vybral a provedl nad nimi stejnou operaci.

Níže nejprve začneme tím nejzákladnějším, tedy cyklem `for`.

## Odpočítávání

Představme si, že chceme napodobit funkci odpočítávání a postupně vypsat `„5, 4, 3, 2, 1“`.

Nejpřímější zápis je:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Tento způsob sice může odpočítávání napodobit, ale pokud je obsahu hodně, bude působit velmi opakovaně a později také nebude pohodlný na úpravy.

V takovém případě můžeme nejprve vložit data do pole a pak použít cyklus `for`, který je postupně vypíše:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Tento zápis je stručnější a také se snáze rozšiřuje. I kdyby bylo v odpočítávání hodně čísel, nemusíme psát `print` řádek po řádku, stačí nechat cyklus automaticky zpracovat každý prvek v poli.

Tento kód můžeme vložit do tlačítka a vyzkoušet ho:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Po klepnutí na tlačítko cyklus `for` postupně vezme každé celé číslo z `countDown` a vypíše ho do konzole.

Dále se podíváme na to, jak cyklus `for` funguje.

## Cyklus for

Cyklus `for` se používá ke zpracování skupiny dat v pořadí. Nejčastějšími objekty jsou pole a rozsahy.

Základní zápis:

```swift
for prvek in poleNeboRozsah {
    vykonávaný_kód
}
```

Například kód odpočítávání z předchozí části:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Zde `i` představuje právě vybraný aktuální prvek a za `in` následují data, přes která se iteruje, tedy pole `countDown`.

Význam tohoto kódu je následující: program bude z pole `countDown` postupně vybírat každý prvek. Pokaždé, když vybere jeden prvek, dočasně ho označí jako `i` a poté vykoná kód uvnitř složených závorek.

Průběh vykonávání si lze představit takto:

* První vybraný prvek je `5`, takže v této chvíli má `i` hodnotu `5`
* Vykoná se `print(i)` a vypíše se `5`
* Potom se pokračuje dalším prvkem `4`
* Znovu se vykoná `print(i)` a vypíše se `4`

Stejným způsobem se pak postupně vykonají i `3`, `2` a `1`.

![for](../../Resource/017_for.png)

Když jsou všechny prvky v poli zpracované, cyklus `for` se automaticky ukončí.

Pomocí cyklu `for` můžeme získat každý prvek v poli a vytvořit například funkci, jako je toto odpočítávání.

**Tip**: `i` je v cyklu `for` velmi běžný způsob pojmenování a používá se pro označení právě vybraného prvku, ale nejde o pevně daný zápis. Můžete použít i jiné anglické názvy.

Například můžeme pro každý vybraný prvek použít `num`:

```swift
for num in countDown {
    print(num)
}
```

Uvnitř složených závorek je pak také potřeba použít `num` pro označení aktuálního prvku.

### Iterace přes rozsah

Cyklus `for` neumí iterovat jen přes pole, ale také přes rozsahy.

Například když chceme spočítat součet kladných celých čísel do `50`, musíme postupně sečíst všechna celá čísla od `1` do `50`.

Nejpřímější zápis by mohl být:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problém tohoto zápisu je v tom, že musíme každé číslo napsat ručně. To je nepohodlné a pro skutečný vývoj nepraktické.

V takovém případě můžeme použít operátor rozsahu společně s cyklem `for`.

V předchozí kapitole o „operátorech“ jsme se už naučili operátor rozsahu:

```swift
1...3   // 1, 2, 3
```

Zde `...` znamená uzavřený rozsah, tedy že zahrnuje počáteční i koncovou hodnotu.

Proto zde můžeme použít cyklus `for` pro rozsah celých čísel od `1` do `50`:

```swift
for i in 1...50 {
    
}
```

Tato celá čísla potřebujeme sečíst, takže potřebujeme také proměnnou, která bude ukládat součet:

```swift
var count = 0
```

Poté při každém průchodu cyklem přidáme aktuálně vybrané číslo do `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Tento kód znamená:

* `count` slouží k uložení aktuálního součtu
* Cyklus `for` bude postupně vybírat celá čísla od `1` do `50`
* Pokaždé, když se vybere jedno celé číslo, vykoná se `count += i`
* Po skončení cyklu bude v `count` uložen konečný součet

Tímto způsobem tedy můžeme získat součet všech kladných celých čísel do `50`.

Stejně tak, pokud chceme spočítat součet celých čísel od `1` do `100`, stačí upravit rozsah:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Cyklus `for` neumí iterovat jen přes pole, ale také přes rozsah.

Tato schopnost postupně zpracovávat opakující se data je ve vývoji velmi běžná.

Pomáhá nám automaticky zpracovat mnoho opakujících se úloh, aniž bychom museli ručně psát sčítání každého čísla nebo jiné podobné opakované operace.

## Cykly ve SwiftUI

Předchozí cyklus `for` patří do jazyka Swift.

Ve SwiftUI ale nemůžeme přímo použít `for` uvnitř struktury pohledu k vytváření pohledů:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Je to proto, že uvnitř `VStack` musí být pohledy SwiftUI, zatímco běžný cyklus `for` sám o sobě pohledem není.

Pokud chceme ve SwiftUI opakovaně vytvářet rozhraní podle obsahu pole, musíme použít `ForEach`.

Například pokud chceme zobrazit jména všech členů skupiny, můžeme to napsat takto:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Výsledek zobrazení:

![for1](../../Resource/017_for1.png)

Potom ke každému `Text` přidáme stejné modifikátory:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Nyní se každý `Text` zobrazí menším a tučnějším písmem.

Výsledek zobrazení:

![](../../Resource/017_for2.png)

Přestože modifikátory dělají rozhraní hezčím, zároveň dělají kód delším a opakovanějším.

Pokud bude jmen přibývat nebo pokud budeme chtít později jednotně upravit písmo, barvu nebo jiné styly, budeme muset opakovaně psát a upravovat spoustu podobného kódu, což bude nepohodlné a obtížně udržovatelné.

V takovém případě můžeme tato jména nejprve vložit do pole a pak použít `ForEach` ve SwiftUI, který bude podle dat v poli opakovaně vytvářet pohledy:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Tato sada kódu je stručnější. `ForEach` bude postupně číst každý prvek v poli a zobrazovat odpovídající obsah v rozhraní.

Když budeme později přidávat další jména, stačí upravit jména v poli `names` a nemusíme pokaždé znovu přidávat `Text` a všechny stejné modifikátory.

## ForEach

`ForEach` je struktura ve SwiftUI používaná k opakovanému vytváření pohledů. Můžete si ji představit jako strukturu ve SwiftUI podobnou cyklu `for`.

Základní použití:

```swift
ForEach(pole, id: \.self) { prvek in
    SwiftUI kód
}
```

Například jména skupiny z předchozí části:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Tento kód znamená:

`names` je pole, přes které se iteruje, tedy data, která se mají zobrazit.

`id:\.self` znamená, že k rozlišení jednotlivých prvků se použije samotný prvek v poli.

V aktuálním příkladu pole obsahuje řetězce:

```swift
["Sam", "John", "Wathon", "Bob"]
```

SwiftUI tedy přímo použije samotné řetězce `"Sam"`, `"John"`, `"Wathon"` a `"Bob"` k rozlišení různých položek.

U jednoduchých polí běžných v začátečnické fázi, jako jsou `String` a `Int`, obvykle můžeme rovnou napsat:

```swift
id: \.self
```

V tuto chvíli si stačí zapamatovat právě tento jeden zápis, není potřeba se hlouběji zabývat dalšími pravidly pro `id`.

V části `item in` představuje `item` právě vybraný prvek.

Například při prvním průchodu je `item` `"Sam"` a při druhém průchodu `"John"`.

Proto se:

```swift
Text(item)
```

postupně změní na:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Úkolem tohoto kódu tedy je: postupně vybírat každé jméno z pole `names` a pro každé jméno vytvořit pohled `Text`.

### Proces vykonávání

Proces vykonávání si lze představit takto:

* `ForEach` nejprve přečte první prvek `"Sam"` z pole `names`
* `item` dočasně představuje `"Sam"`
* `Text(item)` zobrazí `"Sam"`
* Potom pokračuje čtením dalšího prvku `"John"`
* A znovu vykoná stejný kód pohledu

Nakonec se zobrazí všechna jména v poli.

Výhodou tohoto zápisu je, že když jmen přibude, nemusíme opakovaně psát mnoho `Text`, stačí jen upravit obsah pole.

### Iterace přes obrázky

`ForEach` neumí zobrazovat jen text, ale také obrázky, barvy nebo jiné pohledy SwiftUI.

Například si připravíme 4 obrázky:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Přetáhněte tyto čtyři obrázky do složky Assets v Xcode.

![image](../../Resource/017_for3.png)

Pokud nepoužijeme `ForEach`, budeme muset každý obrázek napsat ručně:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Výsledek zobrazení:

![image](../../Resource/017_for4.png)

Tento zápis sice funguje, ale kód bude poměrně dlouhý.

Pokud bude obrázků přibývat, budeme muset psát stále více opakujícího se kódu `Image`.

Pokud budeme chtít později jednotně upravit velikost obrázků, budeme je muset měnit jeden po druhém.

V takovém případě můžeme vložit názvy obrázků do pole a pak použít `ForEach` k opakovanému vytváření pohledů s obrázky:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Zde je `images` pole řetězců a každý prvek v něm je název obrázku.

`ForEach(images, id: \.self)` znamená, že bude postupně číst každý prvek pole `images`, použije samotný prvek k rozlišení jednotlivých položek a poté podle aktuálního prvku vytvoří odpovídající pohled.

Například pokud je prvním přečteným prvkem `"430F9BEF"`, pak:

```swift
Image(item)
```

je ekvivalentní k:

```swift
Image("430F9BEF")
```

Další obrázky se také budou stejným způsobem postupně zobrazovat.

![image](../../Resource/017_for4.png)

Zde stále používáme:

```swift
id: \.self
```

Důvod je stejný jako předtím, protože prvky v poli `images` jsou také jednoduché řetězce, takže v začátečnické fázi můžeme přímo použít samotný prvek jako způsob rozlišení.

Můžete si to jednoduše zapamatovat jako pevný vzorec:

**Když `ForEach` iteruje přes jednoduché pole typu `String` nebo `Int`, obvykle píšeme `id: \.self`.**

### Přidání obrázků

Pokud budeme později potřebovat přidat další obrázky, stačí upravit obsah pole:

```swift
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Není potřeba znovu opakovaně psát nový kód `Image`.

Pokud je obrázků hodně, můžeme to kombinovat se `ScrollView`, jinak po přesahu obsahu mimo obrazovku nebude možné vše kompletně zobrazit.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Úprava obrázků

Když potřebujeme jednotně upravit styl obrázků, stačí změnit jen kód uvnitř `ForEach`.

Například změnit šířku na `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Tím se všechny obrázky změní najednou a není potřeba je upravovat jeden po druhém.

To je jedna z důležitých funkcí `ForEach`:

**Když má více pohledů stejnou strukturu a liší se jen obsahem, můžeme kód pohledu napsat jen jednou a nechat data v poli rozhodnout, co se zobrazí.**

## Shrnutí

V této lekci jsme se naučili cyklus `for` a `ForEach`.

Cyklus `for` se používá k postupnému zpracování prvků v poli nebo rozsahu a více se zaměřuje na zpracování dat.

`ForEach` se ve SwiftUI používá k opakovanému vytváření pohledů podle obsahu pole a více se zaměřuje na zobrazení rozhraní.

V aktuální začátečnické fázi je nejběžnější zápis `ForEach` následující:

```swift
ForEach(pole, id: \.self) { prvek in
    SwiftUI kód
}
```

Zde `id: \.self` znamená, že k rozlišení jednotlivých prvků se používá samotný prvek.

Když obsah pole tvoří jednoduché typy jako `String` nebo `Int`, obvykle na začátku můžeme používat právě tento jeden zápis.

Až budete později při prohlížení webu nebo používání aplikací vídat skupiny opakujících se textů, obrázků nebo jiného seznamového obsahu, můžete si vzpomenout, že ve SwiftUI se takový obsah obvykle nejprve uloží do pole a pak se postupně zobrazí pomocí `ForEach`.
