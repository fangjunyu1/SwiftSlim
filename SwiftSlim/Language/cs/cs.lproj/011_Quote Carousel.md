# Kolotoč citátů

V této lekci vytvoříme funkci „kolotoče citátů“ a zároveň se podrobněji naučíme základní Swift znalosti, jako jsou pole (`Array`) a podmíněné příkazy (`if-else`).

Ukážeme si, jak uložit více citátů a jak pomocí tlačítka dosáhnout jejich cyklického přepínání.

![alt text](../../RESOURCE/011_word.png)

## Zobrazení citátu

Nejprve potřebujeme ve SwiftUI zobrazit jeden citát.

Nejjednodušší způsob je použít zobrazení `Text`:

```swift
Text("Slow progress is still progress.")
```

Tento kód umí zobrazit pouze jeden pevný citát. Pokud chceme zobrazovat více citátů a umožnit mezi nimi přepínání, musíme je nejprve uložit.

Běžná řetězcová proměnná ale dokáže uložit jen jeden citát:

```swift
let sayings = "Slow progress is still progress."
```

Pokud chceme uložit více citátů, musíme pro každý z nich deklarovat samostatnou proměnnou:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

V reálném vývoji je však takový postup nejen zdlouhavý, ale protože je každá proměnná samostatná, nedokážeme takto realizovat flexibilní přepínání v kolotoči.

Aby bylo spravování více citátů pohodlnější, potřebujeme datovou strukturu, která je uloží pohromadě. Tou je právě pole (`Array`).

Po použití pole může být výše uvedený kód uložen takto:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Tip: V programátorských konvencích se názvy proměnných, které uchovávají více prvků, obvykle píší v množném čísle, například `sayings`, aby bylo zřejmé, že jde o kolekci.**

## Pole

Ve Swiftu je pole kolekcí uspořádaných prvků a zapisuje se pomocí hranatých závorek `[]`.

```swift
[]
```

Uvnitř pole může být více prvků stejného typu, oddělených anglickou čárkou `,`.

Například:

```swift
[101, 102, 103, 104, 105]
```

Pole si můžeme jednoduše představit jako vlak:

![Array](../../RESOURCE/011_array1.png)

Celý vlak představuje objekt pole a jednotlivé vagóny jsou seřazeny v pořadí za sebou.

### Index a přístup k prvkům

Protože jsou pole uspořádaná, systém může určit konkrétní prvek podle jeho pořadí. Tento mechanismus se nazývá index (`Index`).

Ve Swiftu, stejně jako ve většině programovacích jazyků, se indexy polí počítají od `0`, nikoli od `1`. To znamená, že první prvek má index `0`, druhý prvek index `1` a tak dále.

![Array](../../RESOURCE/011_array2.png)

Pokud chceme přistoupit ke konkrétnímu prvku pole, stačí za název pole přidat hranaté závorky a do nich napsat index cílového prvku.

Například:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Pokud se pokusíme přistoupit k indexu mimo platný rozsah pole, dojde k chybě „Index Out of Range“. Proto musíme při práci s polem dbát na to, aby index vždy zůstal v platném rozsahu.

**Index mimo rozsah**

Například pokud má pole jen 5 prvků, platný rozsah indexů je od `0` do `4`. Pokud se pokusíme přistoupit k `sayings[5]`, program nenajde odpovídající „vagón“, což povede k chybě „index mimo rozsah“ a aplikace spadne.

![Array](../../RESOURCE/011_array3.png)

### Operace s polem

Pole nepodporuje jen statickou definici, ale také přidávání, mazání, úpravu prvků a zjišťování délky pole.

Tip: Pokud chceme pole upravovat, musíme proměnnou deklarovat pomocí `var`, nikoli pomocí konstanty `let`.

**1. Přidání prvku**

Pomocí metody `append` lze přidat prvek na konec pole:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Smazání prvku**

Pomocí metody `remove(at:)` lze odstranit konkrétní prvek pole:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Úprava prvku**

Prvky v poli lze měnit přímo pomocí jejich indexu:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Zjištění délky pole**

Pomocí vlastnosti `count` získáme počet prvků v poli:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Zobrazení citátů pomocí pole

Pro zobrazení více citátů je můžeme uložit do pole a poté je pomocí indexu načítat a zobrazovat.

Nejprve v `ContentView` vytvoříme pole `sayings`, které bude citáty ukládat, a pak v zobrazení `Text` pomocí indexu načteme a zobrazíme odpovídající citát:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Zde `sayings[0]` představuje první citát v poli.

Pokud chceme zobrazit jiný citát, stačí změnit index uvnitř hranatých závorek:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definování indexu citátu

Abychom dosáhli efektu dynamického přepínání citátů, nemůžeme index „napevno“ zapsat přímo do `Text`.

Potřebujeme vytvořit proměnnou, která bude samostatně ukládat aktuálně zobrazovaný index.

Ve SwiftUI můžeme použít `@State` k deklaraci měnitelného indexu:

```swift
@State private var index = 0
```

SwiftUI bude proměnné označené `@State` sledovat. Když se `index` změní, SwiftUI znovu vykreslí zobrazení a zobrazí odpovídající citát.

Poté použijeme `sayings[index]`, abychom dynamicky získali citát z pole:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Když se hodnota `index` změní, `Text` zobrazí jiný citát.

### Použití tlačítka k řízení indexu

Pro řízení přepínání citátů můžeme použít `Button`, který změní hodnotu `index`. Při každém kliknutí se `index` automaticky zvýší o `1`:

```swift
Button("Next") {
    index += 1
}
```

Když klikneme na tlačítko, hodnota `index` se změní z `0` na `1`, zobrazení se aktualizuje a `Text(sayings[index])` načte další citát.

Zde je ale jedno potenciální nebezpečí: pokud budeme na tlačítko klikat opakovaně, může se `index` zvýšit na hodnotu mimo rozsah pole. To povede k chybě indexu mimo rozsah. Například když `index` dosáhne `5` (přitom indexy pole jsou jen od `0` do `4`), program spadne.

Abychom tomu zabránili, musíme zavést podmínku, která zajistí, že `index` nepřekročí rozsah pole. Toho lze dosáhnout pomocí příkazu `if-else`, který ověří, zda je `index` menší než délka pole.

## Podmíněné řízení: příkaz if-else

Příkaz `if-else` patří ve Swiftu k nejběžnějším podmíněným větvením. Slouží k tomu, aby ověřil, zda je podmínka splněná, a podle pravdivosti vykonal různé bloky kódu.

Základní struktura:

```swift
if condition {
    // Kód, který se provede, když je condition true
} else {
    // Kód, který se provede, když je condition false
}
```

V příkazu `if` je podmínka `condition` booleovská hodnota (`Bool`), která může být `true` nebo `false`. Pokud je podmínka `true`, vykoná se část `if`, jinak se vykoná část `else`.

Například:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

V tomto příkladu má `age` hodnotu `25` a `if` ověřuje, zda platí `age > 18`. Podmínka je splněna, takže se vypíše `"Big Boy"`.

Pokud část `else` nepotřebujeme, můžeme ji vynechat:

```swift
if condition {
    // Kód, který se provede, když je condition true
}
```

### Použití podmínek pro řízení rozsahu indexu

Abychom zabránili indexu pole vystoupit mimo platný rozsah, můžeme použít `if`, které zajistí, že `index` nepřekročí rozsah pole:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Logická analýza: hodnota `sayings.count` je `5`, protože máme `5` citátů. Proto je `sayings.count - 1` rovno `4`, což je zároveň poslední platný index pole.

Když je `index` menší než `4`, je bezpečné po kliknutí na tlačítko zvýšit jeho hodnotu o `1`. Jakmile `index` dosáhne `4`, podmínka už nebude splněna a kliknutí na tlačítko nebude mít žádný efekt.

Teď už kód umí realizovat přepínání citátů:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cyklické citáty

Pokud chceme, aby se po zobrazení posledního citátu při dalším kliknutí znovu zobrazil první citát a tím vznikl cyklický kolotoč, můžeme to udělat pomocí části `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Když už `index` dosáhne posledního prvku pole, při kliknutí na tlačítko se nastaví zpět na `0` a citáty se začnou znovu zobrazovat od začátku.

## Vylepšení zobrazení citátů

Nyní už máme logiku kolotoče citátů hotovou, ale rozhraní můžeme ještě dál vylepšit, aby bylo hezčí.

Kompletní kód:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

V tomto příkladu má `Text` bílé poloprůhledné pozadí a zaoblené rohy, tlačítko používá styl `.borderedProminent` a `VStack` má obrázek na pozadí.

Doplnění znalostí: Když se používá modifikátor `background()` pro obrázkové pozadí, jeho výchozí chování je co nejvíce vyplnit oblast rozvržení aktuálního zobrazení. V mnoha případech se také přirozeně rozšíří přes `Safe Area`.

Tím jsme dokončili zobrazení kolotoče citátů.

![SwiftUI View](../../RESOURCE/011_word.png)

## Shrnutí

V této lekci jsme se naučili ukládat více citátů do pole a pomocí příkazů `if` a `if-else` realizovat jejich přepínání v kolotoči.

Seznámili jsme se také se základními operacemi s polem, jako je přidávání, mazání a úprava prvků, a také s tím, jak zabránit indexu pole vystoupit mimo rozsah.

Tato lekce nejen vysvětluje implementaci funkce kolotoče citátů, ale zároveň kombinuje základní použití polí a podmíněných příkazů, aby nám pomohla osvojit si práci s daty a řízení toku programu.

## Rozšířená znalost - vícečetné podmínky: if-else if-else

V reálném vývoji je často potřeba zpracovávat více podmínek. Například v nějaké hře: když je počet bodů roven `1`, spustí se událost `A`, když je roven `2`, spustí se událost `B`, když je roven `3`, spustí se událost `C` a tak dále.

V situacích, kdy máme více než dvě větve podmínek, potřebujeme použít `if-else if-else`.

Základní syntaxe:

```swift
if conditionA {
    // Kód, který se vykoná, když je conditionA true
} else if conditionB {
    // Kód, který se vykoná, když je conditionB true
} else if conditionC {
    // Kód, který se vykoná, když je conditionC true
} else {
    // Kód, který se vykoná, když není splněna žádná podmínka
}
```

V takové situaci program postupně kontroluje podmínky v pořadí a vykoná první, která je splněná. Pokud není splněna žádná, provede se kód v `else`.

V kolotoči citátů můžeme `if-else if-else` použít také:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Když je `index` `0`, `1`, `2` nebo `3`, při každém kliknutí se provede `index += 1`. Když je `index` `4`, tedy poslední prvek, nastaví se `index` zpět na `0` a kolotoč pokračuje od začátku.

Větev `else` zde slouží jako pojistka pro případ neplatné hodnoty, například kdyby byl `index` omylem změněn nesprávně.

Je třeba si uvědomit, že `==` zde znamená „je rovno“. Pokud podmínka `if` ověří, že `index` je roven určitému číslu, vrátí `true` a vykoná následující blok kódu. Pokud roven není, pokračuje se k další podmínce `if`.

Takové vícenásobné podmíněné vyhodnocení pomáhá spouštět různý kód v různých podmíněných situacích.
