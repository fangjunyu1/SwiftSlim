# struct a class

V predchádzajúcej lekcii sme sa práve začali zoznamovať so `struct`, definovali sme jednu štruktúru a zároveň sme si rozšírili poznatky o protokoloch, `UUID` a ďalších témach.

Teraz už máme o kľúčovom slove `struct` základnú predstavu, ale ešte stále sa nedá povedať, že mu naozaj rozumieme.

V tejto lekcii budeme pokračovať so `struct` ako hlavnou témou a popritom sa zoznámime aj s `class`. Vďaka tejto lekcii budeš jasnejšie vedieť: čo je inštancia, čo je konštruktor a prečo môžeme pomocou `struct` a `class` organizovať dáta.

## Systém správy študentov

Napríklad teraz chceme vyvinúť systém správy študentov. Každý študent má informácie ako meno, pohlavie, telefón, vek, domácu adresu a podobne.

V tomto momente môžeme tieto informácie spojiť a definovať ich ako štruktúru `Student`:

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

Tu používame `struct` na definovanie typu študenta.

Táto štruktúra `Student` obsahuje viacero vlastností:

- `id`: jedinečný identifikátor študenta
- `name`: meno študenta
- `sex`: pohlavie študenta
- `phone`: telefón študenta
- `age`: vek študenta
- `address`: domáca adresa

Takto sa pôvodne roztrúsené údaje spoja do jedného úplného „študenta“.

`Student` tu zároveň dodržiava protokol `Identifiable` a definuje pole `id`, aby bolo neskôr jednoduchšie zobrazovať dáta v cykle `ForEach`.

Potom môžeme vytvoriť inštanciu študenta:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Tento kód znamená, že podľa tejto štruktúry `Student` možno vytvoriť konkrétne údaje o študentovi.

Tu je `Student` typ a `Student(...)` predstavuje vytvorenú inštanciu.

V SwiftUI môžeme túto inštanciu priradiť premennej a potom ju zobraziť.

Napríklad:

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

Takto môžeme vo view vidieť meno tohto študenta: `Fang Junyu`.

Tu sme najprv vytvorili inštanciu `Student`, potom sme ju priradili premennej `student` a napokon sme cez `student.name` prečítali jej vlastnosť.

## Čo je inštancia

Keď sa práve začíname učiť `struct`, môže sa nám slovo „inštancia“ zdať neznáme.

V skutočnosti však inštancie používame od samého začiatku, len sme si to predtým zvlášť neuvedomovali.

Napríklad:

```swift
let name = "Fang Junyu"
```

Tu je `"Fang Junyu"` hodnota reťazca a vo svojej podstate je to inštancia typu `String`.

Môžeme to napísať aj takto:

```swift
let name = String("Fang Junyu")
```

Tieto dva zápisy vyjadrujú tú istú vec: vytvoriť inštanciu typu `String` a priradiť ju premennej `name`.

Rovnako je to aj pri `Int`:

```swift
let num = 3
```

Tu je `3` vo svojej podstate hodnota typu `Int` a možno ju chápať aj ako inštanciu `Int`.

Preto inštancia nie je nejaký špeciálny pojem, ktorý sa objavuje iba v `struct`.

Či už ide o `String`, `Int`, `Double`, `Bool`, alebo o vlastný `Student`, všetky môžu vytvárať inštancie.

Preto keď napíšeme:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Vo svojej podstate je to to isté ako vytváranie inštancií `String` alebo `Int`, len `Student` je typ, ktorý sme si definovali sami.

## Konštruktor

Keď vytvárame inštanciu:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

V skutočnosti tým voláme inicializačnú metódu `Student`, teda `init`.

Konštruktor si môžeš predstaviť ako: **vstupný bod, ktorý je pri vytváraní inštancie zodpovedný za priradenie hodnôt vlastnostiam.**

To znamená, že predtým, než je inštancia naozaj vytvorená, zvyčajne najprv prejde cez `init`.

Napríklad keď sme sa predtým učili životný cyklus SwiftUI view, písali sme takýto kód:

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

Tu sa `init()` vykoná pri vytvorení inštancie `ContentView`, zatiaľ čo `onAppear` sa vykoná až vtedy, keď sa view naozaj zobrazí na obrazovke. Inými slovami, vytvorenie view a jeho zobrazenie nie sú ten istý okamih.

Podobne, keď vytvoríme `Student(...)`, voláme konštruktor `Student`.

### Automaticky vygenerovaný konštruktor

Keď sme definovali `Student`, `init` sme ručne nepísali:

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

Aj tak však môžeme priamo vytvoriť inštanciu:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Prečo možno vytvoriť inštanciu aj bez konštruktora?

Pretože pri `struct`, ak ručne nenapíšeme konštruktor, systém nám zvyčajne automaticky vygeneruje vhodný konštruktor.

V začiatočníckej fáze si to môžeš jednoducho vysvetliť takto: Swift za nás automaticky doplní inicializačný kód.

Približne si to možno predstaviť tak, že systém za nás doplní nasledujúci kód:

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

Tu si treba všimnúť jeden detail:

```swift
let id = UUID()
```

`id` už má predvolenú hodnotu, takže pri vytváraní inštancie nemusíme `id` odovzdávať ručne.

Inými slovami, vlastnosti bez predvolenej hodnoty je zvyčajne potrebné odovzdať do konštruktora, zatiaľ čo vlastnosti, ktoré už predvolenú hodnotu majú, môžu túto pôvodnú hodnotu priamo použiť.

Preto pri vytváraní inštancie `Student` musíme odovzdať iba `name`, `sex`, `phone`, `age` a `address`.

### Nápoveda kompilátora

Okrem toho, keď v Xcode zadáme `Student(...)`, môžeme vidieť aj nápovedu parametrov, ktorú poskytuje systém.

![student](../../Resource/022_student.png)

Aj to vlastne ukazuje, že daný typ naozaj má systémom automaticky vygenerovaný konštruktor.

### Napísanie vlastného konštruktora

Aj keď systém dokáže konštruktor vygenerovať automaticky, niekedy tento predvolený spôsob inicializácie úplne nezodpovedá našim potrebám.

Napríklad máme štruktúru `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Podľa systémom automaticky vygenerovaného konštruktora musíme pri vytváraní inštancie zadať všetky tri parametre:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ak však teraz chceme zadávať skupinu starých filmov a poznáme iba názov filmu, no nepoznáme režiséra ani hodnotenie, bude to dosť nepraktické.

Pretože môžeme písať iba takto:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Aj keď to funguje, nie je pohodlné zakaždým opakovať `--`.

Vtedy si môžeme napísať vlastný konštruktor:

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

Takto pri vytváraní starých filmov potrebujeme odovzdať iba `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

To je jeden z významov písania vlastného konštruktora: **spraviť spôsob vytvárania inštancií vhodnejším pre skutočné potreby.**

### Rozbor vlastného konštruktora

Pozrime sa na tento ručne napísaný konštruktor:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Význam tohto kódu je taký, že pri vytváraní inštancie `Movie` sa vyžaduje odovzdať iba jeden parameter `name`.

Potom sa vo vnútri konštruktora odovzdaný `name` priradí k vlastnému `name` inštancie a `director` a `rating` dostanú predvolenú hodnotu `--`.

`self` tu znamená „táto aktuálna inštancia sama“.

Napríklad:

```swift
self.name = name
```

`self.name` na ľavej strane označuje vlastnosť inštancie, zatiaľ čo `name` na pravej strane označuje parameter, ktorý sme odovzdali.

Jednoducho si to možno predstaviť tak, že hodnota odovzdaná zvonka sa uloží do vlastnej vlastnosti inštancie.

Keď sú všetkým vlastnostiam priradené hodnoty, inštancia je vytvorená.

### Mechanizmus konštruktora

Keď explicitne deklarujeme konštruktor, prinesie to ešte jednu zmenu:

Pôvodný systémom automaticky vygenerovaný konštruktor sa zvyčajne už nedá priamo použiť.

Napríklad:

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

Ak to teraz znovu napíšeme takto:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Kompilátor vypíše chybu:

```swift
Extra arguments at positions #2, #3 in call
```

To znamená: odovzdal si nadbytočné argumenty.

Prečo k tejto chybe dôjde?

Pretože v aktuálnej štruktúre `Movie` je iba tento jeden ručne deklarovaný konštruktor:

```swift
init(name: String)
```

Prijíma len jeden parameter `name` a neprijíma `director` ani `rating`.

Inými slovami, keď pridáš vlastný konštruktor, pôvodný automaticky generovaný spôsob inicializácie už nemožno priamo používať.

Ak chceme podporovať aj „zadať iba názov“, aj „zadať úplné informácie“, musíme sami dopísať ešte jeden plný konštruktor:

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

Takto budeme mať dva rôzne konštruktory.

Pri vytváraní starých filmov môžeme písať takto:

```swift
Movie(name: "The Night of the Hunter")
```

Pri vytváraní nových filmov s úplnými informáciami môžeme písať takto:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Takýto zápis zároveň ukazuje, že ten istý typ môže mať viacero konštruktorov, pokiaľ sa líši forma ich parametrov.

## Čo je preťaženie

Tu ešte doplníme jeden potrebný poznatok.

Práve teraz sme pre `Movie` napísali dva `init`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Takýto spôsob, keď „názov funkcie je rovnaký, ale parametre sú odlišné“, sa nazýva „preťaženie“.

Tu sa obe funkcie volajú `init`, ale prijímajú rôzne parametre, takže Swift vie rozlíšiť, ktorú funkciu voláš.

Napríklad:

```swift
Movie(name: "Days of Heaven")
```

Zavolá:

```swift
init(name: String)
```

A:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Zavolá druhú, plnú verziu inicializačnej metódy.

Preto je úlohou preťaženia to, aby ten istý typ mohol podľa rôznych situácií ponúkať rôzne spôsoby vytvárania.

## Zoznámenie sa s class

Ďalej sa ešte stručne zoznámime s `class`.

Okrem bežného `struct` v jazyku Swift používa veľa programovacích jazykov na vytváranie inštancií aj `class`, napríklad Java, C#, Kotlin a podobne.

V Swift je zápis `class` veľmi podobný zápisu `struct`.

Napríklad:

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

Všimneš si, že okrem zmeny kľúčového slova z `struct` na `class` vyzerajú ostatné časti takmer rovnako.

Aj spôsob vytvárania inštancie je veľmi podobný:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Takže na úrovni syntaxe sú si `struct` a `class` naozaj veľmi podobné.

### Rozdiel medzi Struct a Class

Hoci `struct` a `class` vyzerajú veľmi podobne, nie sú úplne rovnaké.

**1. Spôsob inicializácie je odlišný**

Pri `struct`, ak ručne nenapíšeme konštruktor, systém nám zvyčajne automaticky vygeneruje vhodnú inicializačnú metódu.

Pri `class`, ak však existujú vlastnosti bez predvolených hodnôt, zvyčajne treba ručne napísať `init`, inak vznikne chyba.

Napríklad:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Táto `class` nemá konštruktor, preto vznikne chyba, lebo vlastnosti neboli inicializované.

Kompilátor zobrazí hlásenie podobné:

```swift
Class 'Movie' has no initializers
```

Preto v tomto príklade musí mať `class` ručne napísaný konštruktor.

**2. `struct` je hodnotový typ, `class` je referenčný typ**

`struct` je hodnotový typ a `class` je referenčný typ.

V začiatočníckej fáze nemusíš tieto dva pojmy úplne ovládať, stačí mať o nich jednoduchú predstavu.

Napríklad `struct` je skôr ako „vytvoriť novú kópiu hodnoty“.

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

Keď tu priradíme `user1` do `user2`, je to akoby sa vytvorila nová kópia dát, takže zmena `user2` neovplyvní `user1`.

Naopak `class` je skôr ako „spoločne ukazovať na tú istú inštanciu“.

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

Tu `user1` a `user2` ukazujú na tú istú inštanciu.

Teraz ešte nemusíme úplne rozumieť vnútornému mechanizmu hodnotových a referenčných typov, stačí vedieť, že `struct` je vhodnejší na ukladanie nezávislých dát a `class` je vhodnejší tam, kde má viacero miest zdieľať tú istú inštanciu.

## Ako si vyberať v začiatočníckej fáze

V aktuálnej fáze má pri bežných dátových modeloch prednosť `struct`, a až pri dátach, ktoré treba zdieľať a synchronizovane upravovať, zvažujeme `class`.

Nie je to absolútne pravidlo, ale pre začiatočníkov je to dostatočne praktický spôsob rozhodovania.

Najmä v SwiftUI často zistíš, že `struct` už dokáže splniť väčšinu úloh.

Okrem toho sa v mnohých programátorských materiáloch obsah vytvorený pomocou `class` nazýva aj „objekt“. V začiatočníckej fáze si to môžeš zatiaľ vysvetliť jednoducho ako inštanciu a nemusíš to zámerne rozlišovať.

## Zhrnutie

V tejto lekcii sme sa podrobnejšie naučili `struct` a popritom sme sa zoznámili aj s `class`; obe sa dajú použiť na definovanie typov.

Typy môžu vytvárať inštancie. Pri vytváraní inštancie sa volá konštruktor, teda `init`.

Pri `struct`, ak ručne nenapíšeme konštruktor, systém zvyčajne automaticky vygeneruje vhodný konštruktor. Ak predvolený konštruktor nevyhovuje potrebám, môžeme si konštruktor napísať aj ručne.

Okrem toho sme sa predbežne oboznámili aj s rozdielom medzi `struct` a `class`: `struct` je hodnotový typ a `class` je referenčný typ. V SwiftUI sa v začiatočníckej fáze častejšie stretávame práve so `struct`.

Neskôr, keď sa budeme učiť odovzdávanie hodnôt vo view, dátové modely a správu stavu, budeme tento obsah ďalej používať.
