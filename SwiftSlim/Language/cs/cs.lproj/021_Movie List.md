# Seznam filmů

V této lekci vytvoříme seznam filmů.

![movie](../../Resource/021_movie.png)

V seznamu se budou zobrazovat plakát, název, režisér a hodnocení každého filmu.

V tomto příkladu se naučíme velmi důležitý poznatek: strukturu `struct`. Ta nám může pomoci spojit více informací o jednom filmu do jednoho celku. Kromě toho se seznámíme také s `UUID()`, `ForEach`, oddělovací čárou `Divider` a s tím, jak používat vlastní objekty ke správě dat.

Tyto znalosti jsou v dalším vývoji se SwiftUI velmi běžné. Po dokončení této lekce nejen vytvoříš seznam filmů, ale také začneš chápat, „jak zobrazit skupinu dat jako rozhraní“.

## Jeden film

Nejprve můžeme začít vytvářet rozhraní pro jeden jediný film.

![movie](../../Resource/021_movie1.png)

Rozvržení tohoto rozhraní se skládá hlavně ze dvou částí: vlevo je plakát filmu a vpravo je představení filmu.

### Plakát filmu

Na levé straně se zobrazuje plakát filmu a k zobrazení obrázku můžeme použít `Image`.

Například:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Tento kód znamená, že se zobrazí obrázek s názvem `"The Shawshank Redemption"`.

Tady je potřeba si uvědomit, že název obrázku musí skutečně existovat ve složce zdrojů `Assets`, jinak rozhraní tento obrázek nebude schopné správně zobrazit.

![movie](../../Resource/021_movie2.png)

Funkce těchto modifikátorů jsou následující:

- `resizable()` znamená, že velikost obrázku lze upravovat.
- `scaledToFit()` znamená, že se při změně velikosti zachovají původní proporce, aby se obrázek neroztáhl a nedeformoval.
- `frame(height: 180)` znamená, že se výška obrázku nastaví na 180.
- `cornerRadius(10)` znamená, že se obrázku nastaví zaoblení rohů 10.

Takto získáme obrázek filmového plakátu vhodné velikosti se zaoblenými rohy.

![movie](../../Resource/021_movie3.png)

### Představení filmu

Na pravé straně se zobrazuje představení filmu, včetně názvu filmu, režiséra a hodnocení.

![movie](../../Resource/021_movie4.png)

K zobrazení této části můžeme použít `Text`:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

V tomto kódu `.font` označuje velikost písma a `.fontWeight` označuje tloušťku písma.

Aby byly mezi „názvem filmu“, „informacemi o režisérovi“ a „informacemi o hodnocení“ jasnější rozestupy, používáme zde na vnější úrovni `VStack` a nastavujeme:

```swift
spacing: 10
```

To znamená, že mezi každou skupinou obsahu uvnitř tohoto `VStack` je mezera 10.

Důvod, proč jsou režisér a hodnocení každý zvlášť zabalené do dalšího `VStack`, je ten, že oba patří do struktury „nadpis + obsah“. Díky tomu bude hierarchie rozhraní přehlednější a bude také snazší později dál upravovat styl.

Kromě toho je `VStack` ve výchozím nastavení zarovnán na střed. Aby byl celý text zarovnán vlevo, nastavíme:

```swift
alignment: .leading
```

Tím bude část s představením filmu působit upraveněji.

### Oddělovací čára

Teď sice obsah představení filmu dostal díky `spacing` větší rozestupy, ale hranice mezi různými částmi obsahu stále není dostatečně zřetelná.

V této chvíli můžeme přidat oddělovací čáru:

```swift
Divider()
```

Například:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Tím získá část s představením filmu výraznější oddělovací efekt.

![movie](../../Resource/021_movie4.png)

`Divider` je velmi jednoduchý, ale velmi často používaný pohled, jehož funkcí je oddělovat různý obsah.

Ve `VStack` se `Divider()` zobrazuje jako vodorovná čára.

V `HStack` se `Divider()` zobrazuje jako svislá čára.

Kromě toho lze styl `Divider` upravit také pomocí `.frame`, `.background`, `.padding` a dalších způsobů.

Například:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Tím se vytvoří modrá oddělovací čára o tloušťce 2 s vodorovným vnitřním odsazením po stranách.

![divider](../../Resource/021_divider.png)

### Kompletní rozhraní

Nakonec můžeme použít `HStack`, abychom vedle sebe uspořádali filmový plakát a představení filmu.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Zde `HStack(spacing: 20)` znamená, že mezi levou a pravou částí zůstane mezera 20.

Je potřeba si všimnout, že `Divider()`, stejně jako dříve probírané `TextField` a `Slider`, se ve výchozím stavu snaží zabrat co nejvíce dostupného prostoru.

Proto nastavíme vnějšímu `VStack` pravé popisné části pevnou šířku:

```swift
.frame(width: 200)
```

Tím lze udržet stejnou šířku oddělovací čáry i textové oblasti a celek pak působí upraveněji.

Tímto jsme dokončili zobrazení rozhraní „jednoho filmu“.

![movie](../../Resource/021_movie1.png)

## Uložení filmů do pole

Pokud chceme zobrazit více filmů za sebou ve stejném stylu, znamená to, že pro každý film musíme napsat podobný kód.

Například:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Takto napsaný kód sice dokáže dosáhnout požadovaného výsledku, ale bude ho stále více a údržba bude velmi nepohodlná.

Například když bude potřeba změnit rozestup všech filmů z `20` na `15`, nebo změnit šířku pravé části z `200` na
`220`, bude nutné ručně upravit každý opakující se blok kódu.

To zjevně není efektivní přístup.

Dříve jsme se už naučili pole a také jsme se naučili používat `ForEach` k opakovanému zobrazování pohledů podle pole.

Například:

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

Tento způsob je velmi vhodný pro případy, kdy je „jen jedna datová hodnota“, například skupina názvů obrázků.

Ale jeden film nemá jen jednu hodnotu. Obsahuje alespoň:

1. filmový plakát
2. název filmu
3. režiséra
4. hodnocení

To znamená, že jeden film je ve skutečnosti skupina souvisejících dat, a ne samostatný řetězec.

Pokud použijeme jen pole, můžeme tyto informace uložit pouze odděleně:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Při zobrazování pak musíme spoléhat na stejné indexy, aby odpovídaly jedna k jedné:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Problém tohoto způsobu zápisu je v tom, že náklady na údržbu jsou velmi vysoké.

Protože se data jednoho filmu rozdělí do více polí, stačí, aby v jednom poli byla jedna položka navíc, jedna chyběla nebo bylo pořadí jiné, a výsledek zobrazení bude chybný.

Zvlášť při přidávání nebo mazání filmů musíš upravovat několik polí zároveň a je velmi snadné něco přehlédnout.

Jak tedy můžeme spojit informace jako „název filmu, režisér a hodnocení“ do jednoho celku?

K tomu je potřeba použít `struct`.

## Definování struktury struct

Ve Swiftu znamená `struct` „struktura“.

Můžeš si ji představit jako „vlastní datový typ“, který dokáže spojit několik souvisejících polí dohromady a vytvořit jeden celek.

Základní použití:

```swift
struct StructName {
	let name: String
}
```

V tomto kódu je `struct` klíčové slovo, které označuje, že definujeme strukturu. `StructName` je název struktury.

Obsah ve složených závorkách jsou pole, která tato struktura obsahuje, a u každého pole musí být jasně uveden název i typ.

Obvykle název `struct` začíná velkým písmenem, například `Movie`, `Student` nebo `UserInfo`. To je ve Swiftu běžný styl pojmenovávání.

`struct` si můžeš jednoduše představit jako prázdnou krabičku, kde každé pole představuje jedno vyhrazené prázdné místo uvnitř.

Dokud tato místa nejsou vyplněná, je to jen prázdná krabička. Teprve až se všechna pole vyplní vhodnými hodnotami, stane se z ní kompletní dárková krabička.

### Instance struct

Předtím jsme definovali pouze samotnou strukturu, což odpovídá přípravě tvaru obalu.

Ještě musíme dovnitř vložit konkrétní obsah, abychom získali skutečnou „instanci“, kterou lze používat.

Při vytváření instance se obvykle za název struktury přidává `()`:

```swift
StructName(...)
```

To, co se vyplní do závorek, je obsah polí, která tato struktura potřebuje.

Například:

```swift
StructName(name: "Fang Junyu")
```

Tento kód znamená: podle formátu struktury `StructName` vytvořit novou instanci a přiřadit poli `name` hodnotu `"Fang Junyu"`.

Když vyplníme všechen potřebný obsah polí, je to stejné, jako bychom tuto krabičku naplnili.

V tu chvíli získáme kompletní instanci struktury.

### Přístup k vlastnostem struct

Když už máme instanci vytvořenou, můžeme používat „tečkovou syntaxi“ pro přístup k jejím vnitřním vlastnostem.

Základní zápis:

```swift
instance.názevVlastnosti
```

Například:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Zde je `st` instance struktury a `st.name` znamená přečtení hodnoty `name` z této instance.

Tento způsob si můžeš představit tak, že když napíšeme `st.name`, je to jako bychom četli obsah uložený na určitém místě v této krabičce.

Tento způsob zápisu bude v dalších rozhraních SwiftUI velmi častý.

Například pokud máme strukturu studenta obsahující jméno, věk a třídu, můžeme je v rozhraní zobrazovat samostatným čtením:

```swift
student.name
student.age
student.className
```

Výhodou je, že data budou přehlednější a také se budou snáze spravovat.

### Umístění struct

Pro začátečníky je obvykle vhodné psát strukturu mimo `ContentView`.

Například:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Tím bude struktura přehlednější a také se bude snadněji číst.

Všimneš si, že i samotný `ContentView` je vlastně `struct`.

### Struktura Movie

S předchozím základem už můžeme definovat strukturu filmu:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

To je struktura s názvem `Movie`, kterou tvoří tři pole `name`, `director` a `rating`, představující název filmu, režiséra a hodnocení.

Díky tomu už není potřeba ukládat související informace o jednom filmu rozdělené do více polí, ale lze je přímo spojit do jednoho celku.

Například můžeme vytvořit takovouto instanci filmu:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Tato instance představuje „kompletní data jednoho filmu“.

### Uložení struktur do pole

Dříve jsme říkali, že pole může ukládat jen jeden a tentýž typ.

Teď už máme strukturu `Movie`, takže pole může ukládat více `Movie`.

```swift
let lists: [Movie] = []
```

Například:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

V tomto poli `lists` nejsou uloženy řetězce, ale více instancí `Movie`.

Jinými slovy, každý prvek pole je jeden kompletní film.

Takže když potřebujeme zobrazit seznam filmů, můžeme pomocí `ForEach` postupně načítat každý film.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Zde `movie in` znamená, že při každém průchodu cyklu se z pole vezme jeden film a dočasně se pojmenuje `movie`.

Potom můžeme použít:

```swift
movie.name
movie.director
movie.rating
```

k postupnému čtení názvu filmu, režiséra a hodnocení a jejich zobrazení v rozhraní.

## Chyba ForEach

Až sem jsme už dokončili základní zápis pole filmů a `ForEach`.

Pokud ale přímo spustíš následující kód:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

objeví se chybové hlášení:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Tato chyba znamená, že když napíšeš `id: \.self`, SwiftUI potřebuje používat každý prvek pole samotný jako „jedinečný identifikátor“, aby je od sebe odlišila.

Tento zápis je vhodný pro jednoduché typy jako `String` a `Int`, protože se samy o sobě rozlišují poměrně snadno.

Ale `Movie` je vlastní struktura, kterou jsme si definovali, a `ForEach` neví, jak ji samotnou použít jako jedinečný identifikátor, a proto hlásí chybu.

Nejběžnějším způsobem, jak tento problém vyřešit, je nechat `Movie` dodržovat protokol `Identifiable`.

## Protokol

Ve Swiftu lze protokol chápat jako druh „pravidla“ nebo „požadavku“.

Můžeš si to představit jako dohodu v mezinárodní organizaci: pokud se chce nějaký stát připojit k určité mezinárodní organizaci, obvykle musí nejprve splnit určitá pravidla stanovená touto organizací, zveřejnit některá data a dodržovat některá společná pravidla. Teprve po splnění těchto podmínek se může připojit nebo účastnit některých záležitostí.

Podobně fungují i protokoly.

Když chce nějaký typ dodržovat určitý protokol, musí splnit obsah, který tento protokol vyžaduje. Teprve po splnění těchto požadavků může daný typ používat odpovídající funkce.

Základní zápis:

```swift
struct Movie: Identifiable {
    // ...
}
```

Tady `: Identifiable` znamená, že `Movie` dodržuje protokol `Identifiable`.

Pokud typ dodržuje více protokolů, lze je oddělit čárkou:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Pro `Identifiable` je nejdůležitějším požadavkem to, že typ musí mít `id`, kterým se dokáže identifikovat.

Například:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Tady je `id` jako číslo občanského průkazu a slouží k odlišení jednotlivých filmů.

Dokud je `id` každého filmu jiný, SwiftUI dokáže správně rozlišit každý prvek pole.

Například:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Potom v `ForEach` použijeme:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Tím už chyba nenastane.

Protože `Movie` už dodržuje `Identifiable`, běžnější zápis je `id:` rovnou vynechat:

```swift
ForEach(lists) { movie in
    // ...
}
```

Protože SwiftUI už ví, že má k rozlišení každé položky použít `movie.id`.

## Rozlišovací identifikátor ve ForEach

Níže si podrobněji vysvětlíme roli `id` ve `ForEach`.

Například:

```swift
ForEach(lists, id: \.self)
```

To znamená: použít samotný prvek jako rozlišovací identifikátor.

A:

```swift
ForEach(lists, id: \.id)
```

znamená: použít pole `id` prvku jako rozlišovací identifikátor.

Pokud nějaké pole samo o sobě dokáže zaručit jedinečnost, lze jej dočasně použít také.

Například pokud má každý film jiný název, může tento zápis za aktuálních dat fungovat také správně:

```swift
ForEach(lists, id: \.name)
```

Ale je tu skrytý problém: `name` nemusí být navždy jedinečné.

Představ si, že později přidáš další film se stejným názvem. Pak už `name` nebude schopné přesně odlišit každý prvek.

V takové chvíli se sice kód ještě může zkompilovat, ale při obnovování pohledu, aktualizacích, vkládání nebo mazání může SwiftUI prvky chybně rozpoznat a způsobit anomálie v zobrazení.

Proto když potřebujeme data stabilně rozlišovat, je nejlepší používat skutečně jedinečné pole, tedy `id`.

## UUID

I když ruční psaní `id: 1`, `id: 2` problém vyřeší, stále tu existuje jedno riziko: můžeš omylem napsat duplicitní `id`, a jedinečný identifikátor pak přestane fungovat.

Například:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Takto vzniknou dvě stejná `id` a jedinečný identifikátor přestane být platný.

Abychom se vyhnuli ručním chybám, obvykle používáme `UUID()`.

Ve Swiftu `UUID()` náhodně generuje 128bitový identifikátor. Obvykle se zobrazuje jako dlouhý řetězec složený z písmen a čísel.

Například:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Tady `UUID()` ve skutečnosti vytváří instanci typu `UUID`; můžeš si ji představit jako automaticky generované „jedinečné číslo“.

Proto se hodnoty vytvořené pokaždé téměř nikdy neopakují, a tak jsou velmi vhodné pro použití jako `id`.

`Movie` můžeme upravit takto:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Tento kód znamená, že pole `id` ve struktuře `Movie` bude mít ve výchozím stavu přiřazenou novou instanci `UUID`.

Jinými slovy, pokaždé když vytvoříme novou `Movie`, systém nám nejprve automaticky vygeneruje jedinečné `id`.

`id` už má výchozí hodnotu, takže při pozdějším vytváření instancí `Movie` už nebude potřeba `id` ručně vyplňovat.

Například:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

I když zde `id` není napsáno, ve skutečnosti má tato instance filmu stále své vlastní `id`, jen už byla tato hodnota automaticky vygenerována pomocí `UUID()`.

Po použití tohoto způsobu už nemusíme ručně vyplňovat `id` pro každý film, což nejen zmenšuje množství kódu, ale také zabraňuje chybám způsobeným opakováním id.

Nakonec stačí přidat nahoře obrázek `Banner` a použít `ScrollView`, aby bylo možné obsah posouvat, a tím dokončíme celé zobrazení seznamu filmů.

## Shrnutí

V této lekci jsme se naučili velmi důležitý poznatek: `struct`.

Pomocí `struct` můžeme spojit více souvisejících polí jednoho filmu do jednoho celku, místo abychom název, režiséra a hodnocení rozdělovali do několika samostatných polí.

Když jsou data spojena dohromady, můžeme použít `ForEach` k tomu, abychom ve view postupně zobrazili každý film z pole.

Zároveň jsme pochopili i roli „rozlišovacího identifikátoru“ ve `ForEach`: SwiftUI musí vědět, jak rozlišit každý prvek v poli, aby mohla správně zobrazovat a aktualizovat view.

Proto jsme nechali `Movie` dodržovat protokol `Identifiable` a poskytli jsme jí jedinečné `id`.

Abychom se vyhnuli chybám při ručním vyplňování `id`, naučili jsme se i `UUID()`, aby systém jedinečný identifikátor generoval automaticky.

Po dokončení této lekce nejen dokončíš seznam filmů, ale také se začneš seznamovat s důležitou myšlenkou ve SwiftUI: **nejprve uspořádej data a pak podle nich generuj view.**

## Kompletní kód

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
