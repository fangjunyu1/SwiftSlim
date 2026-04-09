# struct a class

V minulé lekci jsme se teprve začali seznamovat se `struct`, definovali jsme jednu strukturu a navíc si rozšířili znalosti o protokoly, `UUID` a dalších tématech.

Teď už máme o klíčovém slově `struct` základní představu, ale stále se ještě nedá říct, že mu opravdu rozumíme.

V této lekci budeme pokračovat se `struct` jako s hlavním tématem a mimochodem se seznámíme také s `class`. Díky této lekci budete jasněji vědět: co je instance, co je konstruktor a proč můžeme pomocí `struct` a `class` organizovat data.

## Systém správy studentů

Například teď chceme vyvíjet systém správy studentů. Každý student má informace jako jméno, pohlaví, telefon, věk, domácí adresa a podobně.

V této chvíli můžeme tyto informace spojit dohromady a definovat je jako strukturu `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Zde používáme `struct` k definování typu studenta.

Tato struktura `Student` obsahuje několik vlastností:

- `id`: jedinečný identifikátor studenta
- `name`: jméno studenta
- `sex`: pohlaví studenta
- `phone`: telefon studenta
- `age`: věk studenta
- `address`: domácí adresa

Tímto způsobem se několik původně rozptýlených údajů spojí do jednoho úplného „studenta“.

`Student` zde také dodržuje protokol `Identifiable` a definuje pole `id`, aby bylo později pohodlné zobrazovat data pomocí cyklu `ForEach`.

Potom můžeme vytvořit instanci studenta:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Tento kus kódu znamená, že podle této struktury `Student` lze vytvořit konkrétní studentská data.

Zde je `Student` typ a `Student(...)` představuje vytvořenou instanci.

Ve SwiftUI můžeme tuto instanci přiřadit proměnné a pak ji zobrazit.

Například:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Takto pak můžeme ve view vidět jméno tohoto studenta: `Fang Junyu`.

Zde jsme nejprve vytvořili instanci `Student`, potom ji přiřadili do proměnné `student` a nakonec z ní četli vlastnost pomocí `student.name`.

## Co je instance

Když se právě začínáme učit `struct`, může nám slovo „instance“ připadat dost neznámé.

Ve skutečnosti ale instance používáme už od samého začátku, jen jsme si jich dříve zvlášť nevšímali.

Například:

```swift
let name = "Fang Junyu"
```

Zde je `"Fang Junyu"` řetězcová hodnota a ve své podstatě je to instance typu `String`.

Můžeme to napsat i takto:

```swift
let name = String("Fang Junyu")
```

Oba způsoby vyjadřují totéž: vytvořit instanci typu `String` a přiřadit ji proměnné `name`.

Stejně tak je to i s `Int`:

```swift
let num = 3
```

Zde je `3` ve své podstatě hodnota typu `Int` a lze ji také chápat jako instanci `Int`.

Instance tedy není nějaký zvláštní pojem, který by se objevoval jen ve `struct`.

Ať už jde o `String`, `Int`, `Double`, `Bool` nebo vlastní `Student`, všechny z nich mohou vytvářet instance.

Proto když napíšeme:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

je to ve své podstatě stejné jako vytvořit instanci `String` nebo `Int`, jen `Student` je typ, který jsme si definovali sami.

## Konstruktor

Když vytváříme instanci:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

ve skutečnosti tím voláme inicializační metodu `Student`, tedy `init`.

Konstruktor si můžete představit jako: **vstupní bod, který při vytváření instance zodpovídá za přiřazení hodnot vlastnostem.**

Jinými slovy, než je instance skutečně plně vytvořena, obvykle nejprve projde přes `init`.

Například když jsme se dříve učili životní cyklus view ve SwiftUI, psali jsme kód jako tento:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Zde se `init()` vykoná při vytvoření instance `ContentView`, zatímco `onAppear` se vykoná až ve chvíli, kdy se view skutečně zobrazí na obrazovce. To znamená, že vytvoření a zobrazení view nejsou totéž.

Stejně tak když vytváříme `Student(...)`, voláme tím konstruktor `Student`.

### Konstruktor automaticky generovaný systémem

Když jsme definovali `Student`, nepsali jsme ručně `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Přesto ale stále můžeme instanci vytvořit přímo:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Proč lze instanci vytvořit, i když jsme nenapsali konstruktor?

Protože u `struct`, pokud konstruktor nenapíšeme ručně, systém nám obvykle automaticky vygeneruje vhodný konstruktor.

V začátečnické fázi si to můžete jednoduše představit tak, že Swift za nás automaticky doplní inicializační kód.

Zhruba se to dá chápat tak, že systém za nás doplní následující kód:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Tady je potřeba si všimnout jednoho detailu:

```swift
let id = UUID()
```

`id` už má výchozí hodnotu, takže při vytváření instance nemusíme `id` znovu ručně předávat.

To znamená, že vlastnosti bez výchozí hodnoty je obvykle potřeba předat do konstruktoru; vlastnosti, které výchozí hodnotu už mají, mohou obvykle rovnou použít tuto původní výchozí hodnotu.

Proto když vytváříme instanci `Student`, stačí předat `name`, `sex`, `phone`, `age` a `address`.

### Nápověda kompilátoru

Kromě toho při psaní `Student(...)` v Xcode můžeme také vidět nápovědu parametrů, kterou systém nabízí.

![student](../../Resource/022_student.png)

To vlastně také ukazuje, že tento aktuální typ skutečně má systémem automaticky vygenerovaný konstruktor.

### Napsat konstruktor vlastními silami

I když systém umí konstruktor automaticky vygenerovat, někdy tento výchozí způsob inicializace úplně neodpovídá našim potřebám.

Například máme strukturu `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Podle automaticky generovaného konstruktoru musíme při vytváření instance zároveň předat tyto tři parametry:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ale pokud teď chceme zadat dávku starých filmů a známe jen název filmu, ale neznáme režiséra ani hodnocení, bude to trochu nepraktické.

Protože to můžeme psát jen takto:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

I když to funguje, opakovaně psát `--` pokaždé není zrovna pohodlné.

V takové chvíli si můžeme napsat vlastní konstruktor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Takto při vytváření starých filmů stačí předat jen `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

To je jeden z významů psaní vlastního konstruktoru: **umožnit, aby způsob vytváření instance lépe odpovídal skutečným potřebám.**

### Rozbor vlastního konstruktoru

Podívejme se na tento ručně napsaný konstruktor z předchozí chvíle:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Tento kód znamená, že při vytváření instance `Movie` je potřeba předat jen jeden parametr `name`.

Potom konstruktor uvnitř přiřadí předané `name` do vlastního `name` instance a `director` a `rating` dostanou výchozí hodnotu `--`.

`self` zde znamená „tato aktuální instance sama“.

Například:

```swift
self.name = name
```

Levé `self.name` označuje vlastnost v instanci; pravé `name` označuje parametr, který jsme předali.

Lze to jednoduše chápat tak, že hodnota předaná zvenčí se uloží do vlastní vlastnosti instance.

Když jsou všem vlastnostem přiřazeny hodnoty, je vytváření této instance dokončeno.

### Mechanismus konstruktoru

Když explicitně deklarujeme konstruktor, přinese to ještě jednu změnu:

původní konstruktor, který systém automaticky generoval, už obvykle nelze přímo používat.

Například:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Teď když to znovu napíšeme takto:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

kompilátor ohlásí chybu:

```swift
Extra arguments at positions #2, #3 in call
```

To znamená: předali jste zbytečné parametry.

Proč tato chyba vznikne?

Protože v této aktuální struktuře `Movie` existuje jen tento jeden typ konstruktoru, který jste ručně deklarovali:

```swift
init(name: String)
```

Ten přijímá jen jeden parametr `name` a nepřijímá `director` ani `rating`.

Jinými slovy, když ručně přidáte vlastní konstruktor, původní automaticky generovaný způsob inicializace už nelze přímo použít.

Pokud chceme podporovat jak „předat jen název“, tak i „předat úplné informace“, musíme sami dopsat ještě jeden úplný konstruktor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Takto už máme dva různé konstruktory.

Když vytváříme starý film, můžeme psát takto:

```swift
Movie(name: "The Night of the Hunter")
```

Když vytváříme nový film s úplnými informacemi, můžeme psát takto:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Tento způsob zápisu také ukazuje, že jeden a tentýž typ může mít více konstruktorů, pokud se liší tvarem parametrů.

## Co je přetížení

Tady ještě doplníme jeden potřebný poznatek.

Právě jsme pro `Movie` napsali dva `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Tento způsob zápisu, „stejné jméno funkce, ale jiné parametry“, se nazývá „přetížení“.

Zde se obě funkce jmenují `init`, ale protože přijímají jiné parametry, Swift dokáže rozlišit, kterou funkci voláte.

Například:

```swift
Movie(name: "Days of Heaven")
```

zavolá:

```swift
init(name: String)
```

Zatímco:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

zavolá druhou úplnou verzi inicializační metody.

Úloha přetížení tedy je: umožnit jednomu typu poskytovat různé způsoby vytváření podle různých situací.

## Seznámení s class

Dále se stručně seznámíme s `class`.

Vedle běžného `struct` ve Swiftu používá mnoho programovacích jazyků pro vytváření instancí `class`, například Java, C#, Kotlin a další.

Ve Swiftu je způsob zápisu `class` velmi podobný `struct`.

Například:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Všimnete si, že kromě změny klíčového slova z `struct` na `class` vypadají ostatní části téměř stejně.

Podobný je i způsob vytváření instance:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Takže na syntaktické úrovni jsou si `struct` a `class` skutečně velmi podobné.

### Rozdíl mezi Struct a Class

Přestože `struct` a `class` vypadají velmi podobně, nejsou úplně stejné.

**1. Způsob inicializace je odlišný**

U `struct`, pokud ručně nenapíšeme konstruktor, systém obvykle automaticky vygeneruje vhodnou inicializační metodu.

U `class` ale, pokud existují vlastnosti bez výchozí hodnoty, je obvykle potřeba ručně napsat `init`, jinak vznikne chyba.

Například:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Tato `class` způsobí chybu, protože nemá konstruktor a vlastnosti tak nejsou inicializované.

Kompilátor zobrazí hlášku podobnou:

```swift
Class 'Movie' has no initializers
```

Proto v tomto příkladu musí mít `class` konstruktor napsaný ručně.

**2. `struct` je hodnotový typ, `class` je referenční typ**

`struct` je hodnotový typ a `class` je referenční typ.

V začátečnické fázi není potřeba tyto dva pojmy plně ovládnout, stačí o nich mít jednoduchou představu.

Například `struct` je bližší představě „zkopírovat novou hodnotu“.

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Když zde přiřadíme `user1` do `user2`, jako bychom zkopírovali nová data, takže změna `user2` neovlivní `user1`.

Naopak `class` je bližší představě „společně ukazovat na tutéž instanci“.

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Zde `user1` a `user2` ukazují na stejnou instanci.

Teď ještě nemusíme plně rozumět vnitřnímu mechanismu hodnotových a referenčních typů, stačí jen vědět, že `struct` se hodí spíše pro ukládání nezávislých dat a `class` spíše tam, kde má více míst sdílet stejnou instanci.

## Jak vybírat v začátečnické fázi

V této fázi je u běžných datových modelů lepší nejdřív uvažovat o `struct`; když je potřeba data sdílet a synchronně upravovat, pak zvažovat `class`.

Není to absolutní pravidlo, ale pro začátečníky je to dost praktický způsob rozhodování.

Zvlášť ve SwiftUI často zjistíte, že `struct` už zvládne většinu práce.

Navíc se v mnoha programovacích materiálech tomu, co se vytváří pomocí `class`, říká také „objekt“. V začátečnické fázi si to můžete zatím jednoduše vyložit jako instanci a není nutné je záměrně odlišovat.

## Shrnutí

V této lekci jsme se hlouběji naučili `struct` a mimochodem se seznámili i s `class`; obě lze použít k definování typů.

Typy mohou vytvářet instance. Při vytváření instance se volá konstruktor, tedy `init`.

U `struct`, pokud ručně nenapíšeme konstruktor, systém obvykle automaticky vygeneruje vhodný konstruktor. Pokud výchozí konstruktor nevyhovuje potřebám, můžeme si konstruktor napsat i sami.

Navíc jsme získali i první představu o rozdílu mezi `struct` a `class`: `struct` je hodnotový typ a `class` je referenční typ. Ve SwiftUI se v začátečnické fázi obvykle častěji setkáte právě se `struct`.

Později, až se budeme učit předávání hodnot mezi view, datové modely a správu stavu, se všechna tato témata znovu objeví.
