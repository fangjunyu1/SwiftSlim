# Porozumění zobrazením

V této lekci se znovu vrátíme k původnímu `ContentView`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, světe!")
    }
}
```

Když jsme se poprvé setkali se SwiftUI, v `ContentView` bylo mnoho klíčových slov, kterým jsme nerozuměli.

Například `struct`, `View`, `var`, `body`, `some View` a další klíčová slova.

Tehdy jsme možná věděli jen toto: **když napíšeme kód do `body`, obsah se zobrazí na rozhraní.**

Teď už jsme se učili `struct`, proměnné, metody a protokoly, takže můžeme tomuto kódu znovu porozumět a lépe pochopit vztahy mezi zobrazeními ve SwiftUI.

## Připomenutí ContentView

Po vytvoření projektu SwiftUI Xcode ve výchozím nastavení vygeneruje soubor `ContentView`.

Ukázkový kód je následující:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Ahoj, světe!")
        }
        .padding()
    }
}
```

Tento kód můžeme pochopit tak, že ho rozdělíme na několik částí.

Nejprve:

```swift
import SwiftUI
```

Tento řádek znamená import frameworku SwiftUI.

Po importu SwiftUI můžeme používat zobrazení SwiftUI, jako jsou `View`, `Text`, `Image`, `VStack`, `Button` a další.

## Struktura ContentView

Tento řádek kódu znamená vytvoření struktury:

```swift
struct ContentView: View
```

Z toho:

```swift
struct ContentView
```

znamená, že `ContentView` je struktura.

V minulé lekci jsme poznali strukturu `struct`; dokáže spojit různé související položky dohromady a může obsahovat vlastnosti i metody.

Například:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Ahoj, světe!")
    }
}
```

V tomto příkladu obsahuje `ContentView` tři části: `name`, `printName` a `body`.

Jinými slovy, `struct` může spojit související vlastnosti, metody a obsah zobrazení dohromady.

![contentView](../../Resource/023_contentVIew.png)

## View je protokol

Pokračujme pohledem na tento řádek kódu:

```swift
struct ContentView: View 
```

`View` za dvojtečkou znamená: `ContentView` dodržuje protokol `View`.

Můžeme to chápat tak, že pokud se má `ContentView` stát zobrazením SwiftUI, musí splnit požadavky protokolu `View`.

### Protokol Identifiable

Když jsme se dříve učili seznam filmů, setkali jsme se s protokolem `Identifiable`.

Tehdy jsme potřebovali procházet pole `Movie` ve `ForEach`, ale struktura `Movie` neměla jedinečný identifikátor, takže nepodporovala procházení pomocí `ForEach`.

V tu chvíli jsme potřebovali, aby struktura `Movie` dodržovala protokol `Identifiable`, čímž splnila požadavek `ForEach` na jedinečný identifikátor.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Protokol `Identifiable` vyžaduje: **aby tento typ měl pole `id`, které ho identifikuje.**

Když `Movie` poskytne pole `id`, může splnit požadavek `Identifiable`.

Tak ho při použití ve `ForEach` SwiftUI dokáže rozpoznat jako jednotlivé datové položky.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protokol View

S protokolem `View` je to stejné.

Pokud se nějaký typ chce stát zobrazením SwiftUI, musí dodržovat protokol `View`.

A nejdůležitějším požadavkem protokolu `View` je poskytnout `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, světe!")
    }
}
```

Požadavek protokolu `View` můžeme chápat takto: **přijímá pouze zobrazení SwiftUI, které vrátí `body`, a `ContentView` zobrazuje SwiftUI zobrazení právě přes `body`.**

### Co se stane, když View nedodržíme?

Pokud napíšeme:

```swift
struct ContentView {
}
```

Je to jen obyčejná struktura, ne zobrazení SwiftUI.

Nevyvolá chybu přímo, protože obyčejná struktura je sama o sobě platný kód Swift.

Ale pokud ji vložíme do náhledu:

```swift
#Preview {
    ContentView()
}
```

v tuto chvíli se objeví chyba.

Důvod je: **náhled potřebuje zobrazit zobrazení SwiftUI, ale tento `ContentView` nedodržuje protokol `View`.**

Proto pokud chceme, aby se `ContentView` mohl zobrazit na rozhraní, musíme ho nechat dodržovat protokol `View`:

```swift
struct ContentView: View {
}
```

Současně musíme podle požadavku protokolu `View` poskytnout `body`; pokud `body` chybí, kompilátor stále nahlásí chybu.

Správný zápis:

```swift
struct ContentView: View {
    var body: some View {
        Text("Ahoj, světe!")
    }
}
```

Teprve tehdy je `ContentView` skutečné zobrazení SwiftUI, které lze zobrazit.

## body je vstup pro zobrazení obsahu

Ve SwiftUI je `body` vstupem k obsahu zobrazení.

```swift
var body: some View {
    Text("Ahoj, světe!")
}
```

Zde ho můžeme rozdělit na tři části:

**1. var body**

```swift
var body
```

Znamená to definovat proměnnou s názvem `body`.

**2. some View**

```swift
: some View
```

Znamená to, že tento `body` vrátí zobrazení.

**3. { ... }**

```swift
{
    Text("Ahoj, světe!")
}
```

Představuje zobrazovaný obsah zobrazení; v tomto kódu se zobrazuje zobrazení `Text`.

Jinými slovy, co napíšeme do `body`, to se zobrazí na rozhraní.

Například:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Jméno:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Tento kód znamená: **na rozhraní se zobrazí svisle uspořádaný obsah, uvnitř kterého jsou dva texty.**

### Název body nelze libovolně měnit

Je třeba si všimnout, že název `body` nelze libovolně změnit.

Pokud ho napíšeme takto:

```swift
struct ContentView: View {
    var content: some View {
        Text("Ahoj, světe!")
    }
}
```

Tento `content` je sice také vlastnost zobrazení, ale nemůže nahradit `body`.

Protože název, který požaduje protokol `View`, je právě `body`.

## Co je some View?

Ve SwiftUI `some View` znamená vrátit konkrétní zobrazení, jen nemusíme psát celý typ tohoto zobrazení.

```swift
var body: some View
```

To znamená, že `some View` neznamená, že typ neexistuje. Skutečný typ stále existuje a kompilátor ho zná, jen může být velmi složitý, takže nám Swift dovoluje použít `some View`, abychom ho skryli.

### Co je some?

Ve Swiftu je `some` klíčové slovo pro deklaraci neprůhledného typu (opaque type).

Neprůhledný typ znamená: **návratová hodnota má konkrétní typ, kompilátor ví, jaký konkrétní typ to je, ale my tento typ nepíšeme přímo.**

Například:

```swift
func makeView() -> some View {
    Text("Ahoj")
}
```

To znamená, že `makeView` vrátí konkrétní typ, který dodržuje protokol `View`.

### Proč potřebujeme some?

Při učení proměnných jsme zjistili: **hodnoty ve Swiftu musí mít buď explicitně označený typ, nebo jejich typ kompilátor automaticky odvodí.**

Například:

```swift
let a: Int = 10
```

Zde je konstanta `a` typu `Int`.

Zobrazení SwiftUI nejsou výjimkou. Když používáme `body` k zobrazení SwiftUI zobrazení, musí `body` vracet odpovídající typ SwiftUI.

Například když pomocí `body` zobrazujeme textové zobrazení `Text`, musíme nechat `body` vracet odpovídající typ `Text`.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

V tomto příkladu se uvnitř `body` zobrazuje zobrazení `Text` a návratový typ je také `Text`.

Pouze když vnitřní typ souhlasí s deklarovaným typem, splňuje to požadavek kompilátoru na shodu typů.

**Problém neshody typů**

Pokud nastavíme typ `body` na `Color`, ale zobrazujeme `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

typ `body` a typ vnitřního kódu se neshodují, takže vznikne chyba neshody typů.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

V tu chvíli musíme ručně upravit návratový typ `body`.

**Složité typy zobrazení**

Ve skutečném vývoji rozhraní obvykle není jen jedno `Text`.

Pokud potřebujeme zobrazit složitější `VStack`, musíme ručně označit složitý návratový typ.

Například:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Ahoj, světe!")
    }
}
```

Tento kód znamená vrátit `VStack`, uvnitř kterého jsou zobrazení typu `Image` a `Text`.

Návratový typ `body` je:

```swift
VStack<TupleView<(Image,Text)>>
```

Vidíme, že tento návratový typ je velmi složitý a navíc přibyl `TupleView`, který jsme dříve neviděli.

`TupleView` zde můžeme chápat takto: **představuje zabalení několika podzobrazení do jednoho zobrazení.**

**Ještě složitější typy zobrazení**

Pokud ke zobrazení přidáme modifikátory:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Ahoj, světe!")
    }
    .padding()
}
```

pak se návratový typ tohoto zobrazení stane velmi složitým a zde ho nelze konkrétně popsat.

Stávající návratový typ `VStack<TupleView<(Image,Text)>>` už nedokáže popsat modifikátory, a proto vznikne chyba.

**some View zjednodušuje návratový typ**

Pro tuto situaci poskytuje SwiftUI stručné řešení, a tím je použití `some View` ke zjednodušení zápisu.

Když změníme `body` na typ `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Ahoj, světe!")
    }
    .padding()
}
```

při každé změně kódu zobrazení už nemusíme znovu psát úplný návratový typ.

Je to proto, že `some View` znamená vrátit konkrétní zobrazení, které dodržuje protokol `View`.

Jinými slovy, zobrazení SwiftUI jako `VStack`, `Image` a další jsou zobrazení, která dodržují protokol `View`. Po přidání modifikátorů návratový typ zobrazení stále dodržuje protokol `View`.

Proto je lze všechny vrátit jako `some View`.

### some View nemůže libovolně vracet jakékoli zobrazení

`some View` sice dokáže skrýt složité typy, ale není „bez typu“.

Jeho základní pravidlo je: **kompilátor musí umět určit jeden konkrétní návratový typ**.

Například:

```swift
var title: some View {
    Text("Ahoj")
}
```

Zde se vrací zobrazení `Text`.

Ale pokud se pokusíme vrátit dvě zobrazení, dojde k chybě:

```swift
var title: some View {
    Text("Ahoj")
    Image(systemName: "star")
}
```

Protože `some View` nakonec potřebuje vrátit jednu strukturu zobrazení, zatímco zde se pokoušíme vrátit dvě nezávislá zobrazení.

### Řešení

Řešení jsou obvykle dvě: kontejner a `@ViewBuilder`.

**1. Zabalit pomocí kontejneru**

```swift
var title: some View {
    VStack {
        Text("Ahoj")
        Image(systemName: "star")
    }
}
```

V tomto kódu `title` vrací jeden `VStack`, zatímco `Text` a `Image` jsou podzobrazení uvnitř `VStack`.

Struktura zobrazení, kterou `some View` přijímá, je `VStack<...>`, a tak splňuje požadavek `some View` na vrácení jedné struktury zobrazení. 

To je také důvod, proč od začátku učení SwiftUI doporučujeme použít na nejvnější vrstvě kontejner `VStack` k zabalení kódu zobrazení.

**2. Použít @ViewBuilder**

Před `some View` můžeme také přidat modifikátor `@ViewBuilder`:

```swift
@ViewBuilder
var title: some View {
    Text("Ahoj")
    Image(systemName: "star")
}
```

`@ViewBuilder` dokáže spojit několik zobrazení do jednoho návratového výsledku.

Jeho podstatou je stále sloučit několik zobrazení do jednoho zobrazení, aby splnil požadavek `some View` na vrácení jedné struktury zobrazení.

### Proč může body přímo obsahovat několik zobrazení?

Pokud do `var body` napíšeme několik zobrazení, například:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Ahoj, světe!")
}
```

v některých případech takový `body` nevyvolá chybu.

Důvod je, že `body` v protokolu `View` ve výchozím nastavení podporuje `@ViewBuilder`:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Ve zdrojovém kódu protokolu `View` vidíme, že proměnná `body` je už označena pomocí `@ViewBuilder`.

Proto má `body` oproti běžnému `some View` navíc jednu zvláštní vrstvu zpracování, a SwiftUI nám tak automaticky pomůže spojit několik zobrazení do jednoho.

**Doporučuje se používat kontejnery**

Aby to bylo pro začátečníky snazší pochopit, doporučujeme nejprve používat kontejnery jako `VStack`, `HStack`, `ZStack`, `Group` k organizaci několika zobrazení.

Například:

```swift
var body: some View {
    VStack {
        Text("Ahoj")
        Image(systemName: "star")
    }
}
```

Takový kód je názornější: **vnější vrstva je `VStack` a uvnitř jsou dvě podzobrazení.**

## Rozdělení zobrazení

Pokud je rozhraní jednoduché, můžeme napsat celý kód do `body`.

Například:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Vítejte v Qinote")
                Text("Dobré ráno")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Klikni na mě") {
                print("Klikni na mě ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Vzhled tohoto zobrazení:

![view](../../Resource/023_view1.png)

Tento kód může normálně fungovat, ale pokud je kód zobrazení velmi složitý, kód v `body` bude stále delší a čtení i úpravy budou čím dál obtížnější.

V tu chvíli můžeme různé oblasti rozdělit na samostatné vlastnosti zobrazení.

### Rozdělení horního zobrazení

Například oddělíme horní oblast:

```swift
var topHome: some View {
    HStack {
        Text("Domů")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Zde je `topHome` proměnná, která vrací zobrazení.

Protože vrací zobrazení, typ lze napsat jako:

```swift
some View
```

Ve skutečnosti je to stejné použití jako `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Obě používají proměnnou k zobrazení zobrazení a návratový typ je `some View`.

### Rozdělení dalších zobrazení

Potom pokračujeme rozdělením dalších částí:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Vítejte v Qinote")
        Text("Dobré ráno")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Klikni na mě") {
        print("Klikni na mě")
    }
    .buttonStyle(.borderedProminent)
}
```

Po rozdělení můžeme proměnné zobrazení vložit do `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Domů")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Vítejte v Qinote")
            Text("Dobré ráno")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Klikni na mě") {
            print("Klikni na mě")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Nyní `body` odpovídá jen za popis struktury stránky:

```swift
topBar
welcomeText
colorList
clickButton
```

Konkrétní implementace každé části je umístěna do odpovídajících vlastností níže.

Tento způsob rozdělení zobrazení může zpřehlednit strukturu stránky; každá oblast zobrazení má své vlastní jméno a čte se názorněji.

Když upravujeme určitou část kódu, můžeme přímo najít odpovídající oblast zobrazení, místo abychom hledali v hromadě složitého kódu.

### some View vrací jedno zobrazení

V tomto rozděleném zobrazení, pokud se pokusíme vrátit několik zobrazení:

```swift
var topBar: some View {
    Text("Domů")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` může vrátit pouze jednu strukturu zobrazení, takže vznikne chyba.

Na rozdíl od `body` nemají běžné vypočítané vlastnosti ve výchozím nastavení `@ViewBuilder`.

Proto pokud potřebujeme vrátit několik zobrazení, můžeme použít kontejner `VStack`, `HStack` nebo `Group`, abychom několik zobrazení spojili do jednoho.

```swift
var topBar: some View {
    VStack {
        Text("Domů")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Nebo můžeme přidat `@ViewBuilder` pro spojení zobrazení:

```swift
@ViewBuilder
var topBar: some View {
    Text("Domů")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Tak můžeme vracet několik zobrazení.

### if vrací několik zobrazení

Například:

```swift
var topHome: some View {
    if step == "Domů" {
        HStack {
            Text("Domů")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Žádné")
    }
}
```

V tomto kódu `topHome` podle obsahu `step` vrací dva různé typy zobrazení: `HStack` nebo `Text`.

Protože `some View` potřebuje jeden určitý konkrétní návratový typ, dvě větve `if` v běžné vypočítané vlastnosti nemohou přímo vracet různé typy zobrazení, a tím vznikne chyba.

**Řešením je stále zabalit obsah do kontejneru nebo použít `@ViewBuilder`.**

### Proč rozdělená zobrazení nepoužívají závorky

Když v `body` používáme rozdělené vlastnosti zobrazení, píšeme přímo:

```swift
topBar
welcomeText
colorList
clickButton
```

a nepíšeme:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Je to proto, že `topBar`, `welcomeText`, `colorList` a `clickButton` jsou proměnné; ve skutečnosti jde o vypočítané vlastnosti, ne metody.

**Vlastnosti nepotřebují závorky.**

Pokud je napíšeme jako metodu, můžeme také dosáhnout podobného efektu:

```swift
func topBar() -> some View {
    HStack {
        Text("Domů")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Tento kód může také dosáhnout podobného efektu; zavolání této metody vrátí zobrazení.

Při použití je třeba napsat:

```swift
topBar()
```

Ve SwiftUI, pokud jen rozdělujeme zobrazení, které nepotřebuje předávat parametry, je běžnější použít vypočítanou vlastnost.

```swift
var topBar: some View { ... }
```

## Vnořená zobrazení

Kromě rozdělení kódu na vlastnosti můžeme také vytvářet nové struktury zobrazení.

Například:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Tento `PinkColorView` je stejně jako `ContentView` samostatné zobrazení SwiftUI.

Pokud ho potřebujeme zobrazit v `ContentView`, můžeme za název zobrazení přidat `()`.

Například:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Zde:

```swift
PinkColorView()
```

znamená vytvořit instanci `PinkColorView`.

Protože `PinkColorView` dodržuje protokol `View`, může být stejně jako `Text`, `Image` nebo `Button` vložen do jiných zobrazení a zobrazen.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

To je vnoření zobrazení: jedno zobrazení se může zobrazit uvnitř jiného zobrazení.

## Vlastnost zobrazení, nebo nové zobrazení?

Když je kód zobrazení jednoduchý, obvykle ho není třeba dělit; dělení zobrazení doporučujeme až tehdy, když je kód složitější.

### Kdy použít vlastnost zobrazení

Pokud jde jen o malou část obsahu v aktuálním zobrazení, můžeme použít vlastnost zobrazení.

Například:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Takový obsah se obvykle používá jen v aktuálním zobrazení.

### Kdy vytvořit nové zobrazení

Pokud je tento obsah relativně samostatný nebo se v budoucnu může opakovaně použít na několika stránkách, je vhodnější vytvořit nové zobrazení.

Například:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Toto je zobrazení nadpisu. Pokud ho chceme použít jako obecnou komponentu a znovu ho používat v jiných zobrazeních.

Můžeme vytvořit nové zobrazení:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Potom ho použijeme na jiných místech:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

V tu chvíli je toto zobrazení samostatná znovupoužitelná komponenta.

Jednoduše to můžeme shrnout takto:

- Oblast obsahu aktuálního zobrazení může použít `var xxx: some View`
- Samostatná znovupoužitelná komponenta může vytvořit nový `struct XxxView: View`
- Komponenta, do které je třeba předávat data, je obvykle vhodnější jako nové zobrazení.

## Shrnutí

V této lekci jsme znovu porozuměli nejzákladnější, ale také nejdůležitější struktuře zobrazení ve SwiftUI.

`ContentView` je struktura definovaná pomocí `struct`, která slouží k organizaci kódu souvisejícího se stránkou.

`View` je protokol; pokud se má struktura stát zobrazením SwiftUI, musí dodržovat protokol `View`.

`body` je obsah, který po nás protokol `View` požaduje, a určuje, co toto zobrazení ukazuje.

`some View` znamená vrátit určitý konkrétní typ zobrazení a nemusíme psát jeho složitý úplný typ.

Když se kód zobrazení prodlouží, můžeme pomocí `var xxx: some View` rozdělit kód zobrazení na několik menších oblastí.

Když je nějaká část obsahu relativně samostatná nebo ji potřebujeme znovu použít, můžeme vytvořit novou strukturu zobrazení a zobrazit ji v jiných zobrazeních pomocí `XxxView()`.

Jednoduše řečeno, rozhraní SwiftUI se skládá z jednotlivých zobrazení spojených dohromady; jedna stránka může obsahovat několik malých zobrazení a malé zobrazení může dále obsahovat další zobrazení.
