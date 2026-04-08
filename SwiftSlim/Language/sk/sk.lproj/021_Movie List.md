# Zoznam filmov

V tejto lekcii vytvoríme zoznam filmov.

![movie](../../Resource/021_movie.png)

V zozname sa budú zobrazovať plagát, názov, režisér a hodnotenie každého filmu.

V tomto príklade sa naučíme veľmi dôležitú tému: štruktúru `struct`. Pomáha nám spojiť viacero informácií o jednom filme do jedného celku. Okrem toho sa zoznámime aj s `UUID()`, `ForEach`, oddeľovacou čiarou `Divider` a s tým, ako používať vlastné objekty na správu dát.

Tieto znalosti sú v ďalšom vývoji so SwiftUI veľmi bežné. Po dokončení tejto lekcie nielen vytvoríte zoznam filmov, ale tiež začnete chápať, „ako zobraziť skupinu dát ako rozhranie“.

## Jeden film

Najprv môžeme začať rozhraním jedného filmu.

![movie](../../Resource/021_movie1.png)

Rozloženie tohto rozhrania sa skladá najmä z dvoch častí: vľavo je plagát filmu a vpravo predstavenie filmu.

### Filmový plagát

Naľavo sa zobrazuje filmový plagát a na zobrazenie obrázka môžeme použiť `Image`.

Napríklad:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Tento kód znamená, že sa zobrazí obrázok s názvom `"The Shawshank Redemption"`.

Treba si tu všimnúť, že názov obrázka musí skutočne existovať v priečinku zdrojov `Assets`, inak rozhranie tento obrázok správne nezobrazí.

![movie](../../Resource/021_movie2.png)

Úlohy týchto modifikátorov sú nasledovné:

- `resizable()` znamená, že veľkosť obrázka sa dá meniť.
- `scaledToFit()` znamená, že pri škálovaní zostanú zachované pôvodné proporcie, aby sa obrázok nenaťahoval a nedeformoval.
- `frame(height: 180)` znamená, že výška obrázka sa nastaví na 180.
- `cornerRadius(10)` znamená, že obrázok dostane zaoblené rohy s polomerom 10.

Takto získame plagát filmu vhodnej veľkosti a so zaoblenými rohmi.

![movie](../../Resource/021_movie3.png)

### Predstavenie filmu

Na pravej strane sa zobrazuje predstavenie filmu vrátane názvu filmu, režiséra a hodnotenia.

![movie](../../Resource/021_movie4.png)

Na zobrazenie tejto časti môžeme použiť `Text`:

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

V tomto kóde `.font` označuje veľkosť písma a `.fontWeight` označuje jeho hrúbku.

Aby boli rozostupy medzi „názvom filmu“, „informáciou o režisérovi“ a „informáciou o hodnotení“ zreteľnejšie, tu na najvonkajšej úrovni používame `VStack` a nastavujeme:

```swift
spacing: 10
```

To znamená, že rozostup medzi každou skupinou obsahu v tomto `VStack` je 10.

Dôvod, prečo sú režisér a hodnotenie ešte raz samostatne obalené vlastným `VStack`, je ten, že oboje patrí do štruktúry „nadpis + obsah“. Vďaka tomu je hierarchia rozhrania prehľadnejšia a neskôr sa nám bude ľahšie upravovať štýl.

Okrem toho je `VStack` predvolene zarovnaný na stred. Aby bol celý text zarovnaný doľava, nastavíme:

```swift
alignment: .leading
```

Takto časť predstavenia filmu vyzerá upravenejšie.

### Oddeľovacia čiara

Teraz, aj keď je obsah predstavenia filmu rozdelený pomocou `spacing`, hranice medzi jednotlivými časťami ešte stále nie sú dostatočne výrazné.

V tomto momente môžeme pridať oddeľovaciu čiaru:

```swift
Divider()
```

Napríklad:

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

Takto bude mať časť s predstavením filmu zreteľnejší oddeľovací efekt.

![movie](../../Resource/021_movie4.png)

`Divider` je veľmi jednoduchý, ale veľmi často používaný view, ktorého úlohou je oddeľovať rôzny obsah.

Vo `VStack` sa `Divider()` zobrazuje ako vodorovná čiara.

V `HStack` sa `Divider()` zobrazuje ako zvislá čiara.

Okrem toho sa štýl `Divider` dá meniť pomocou `.frame`, `.background`, `.padding` a ďalších spôsobov.

Napríklad:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Týmto sa vytvorí modrá oddeľovacia čiara s hrúbkou 2 a s vnútornými okrajmi naľavo a napravo.

![divider](../../Resource/021_divider.png)

### Kompletné rozhranie

Nakoniec môžeme použiť `HStack`, aby sme plagát filmu a predstavenie filmu usporiadali vedľa seba vľavo a vpravo.

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

Tu `HStack(spacing: 20)` znamená, že medzi ľavou a pravou časťou zostane medzera 20.

Treba si všimnúť, že `Divider()`, rovnako ako už spomínané `TextField` a `Slider`, sa predvolene snaží zabrať čo najviac dostupného priestoru.

Preto nastavíme vonkajšiemu `VStack` v pravej časti predstavenia pevnú šírku:

```swift
.frame(width: 200)
```

Takto zostane šírka oddeľovacej čiary a textovej oblasti rovnaká a celok bude pôsobiť upravenejšie.

Týmto sme dokončili zobrazovacie rozhranie „jedného filmu“.

![movie](../../Resource/021_movie1.png)

## Ukladanie filmov do poľa

Ak chceme zobraziť viac filmov jeden po druhom v rovnakom štýle, znamená to, že pre každý film by sme museli znovu písať podobný kód.

Napríklad:

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

Takto napísaný kód síce môže dosiahnuť požadovaný výsledok, ale kódu bude stále pribúdať a jeho údržba bude veľmi nepraktická.

Napríklad, ak by sme potrebovali zmeniť rozostup všetkých filmov z `20` na `15`, alebo zmeniť šírku pravej časti z `200` na
`220`, museli by sme ručne upravovať každý opakujúci sa úsek kódu.

To zjavne nie je efektívny spôsob.

Predtým sme sa učili o poliach a tiež o tom, ako pomocou `ForEach` opakovane zobrazovať views podľa poľa.

Napríklad:

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

Tento spôsob je veľmi vhodný na spracovanie situácií, kde existuje „len jeden typ dát“, napríklad skupina názvov obrázkov.

Film však nemá len jednu hodnotu. Obsahuje minimálne:

1. Filmový plagát
2. Názov filmu
3. Režiséra
4. Hodnotenie

Inými slovami, jeden film je v skutočnosti skupina súvisiacich dát, nie samostatný string.

Ak by sme použili len polia, mohli by sme tieto informácie ukladať iba oddelene:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Pri zobrazovaní by sme sa museli spoliehať na rovnaké indexy, aby sme ich spárovali jeden k jednému:

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

Problém s takýmto spôsobom zápisu je v tom, že náklady na údržbu sú veľmi vysoké.

Keďže údaje jedného filmu sú rozdelené do viacerých polí, stačí, aby v jednom poli bol o jednu položku viac, o jednu menej alebo iné poradie, a výsledok zobrazenia bude chybný.

Najmä pri pridávaní alebo odstraňovaní filmov musíte meniť viacero polí naraz a veľmi ľahko sa niečo prehliadne.

Ako teda spojiť informácie ako „názov filmu, režisér, hodnotenie“ do jedného celku?

Na to potrebujeme použiť `struct`.

## Definovanie štruktúry `struct`

V Swift znamená `struct` „štruktúra“.

Môžete ju chápať ako „vlastný dátový typ“, ktorý môže spojiť viacero súvisiacich polí do jedného celku.

Základné použitie:

```swift
struct StructName {
	let name: String
}
```

V tomto kóde je `struct` kľúčové slovo, ktoré označuje, že definujeme štruktúru. `StructName` je názov štruktúry.

Obsah v zložených zátvorkách sú polia, ktoré táto štruktúra obsahuje, a pri každom poli musí byť jasne uvedený názov aj typ.

Zvyčajne sa názov `struct` začína veľkým písmenom, napríklad `Movie`, `Student`, `UserInfo`. Toto je bežná konvencia pomenovania v Swift.

`struct` si môžete jednoducho predstaviť ako prázdnu darčekovú škatuľu, v ktorej je každé pole ako vyhradené prázdne miesto.

Kým tieto miesta nie sú vyplnené obsahom, ide len o prázdnu škatuľu. Až keď sa všetky polia vyplnia vhodnými hodnotami, stane sa z nej kompletná darčeková škatuľa.

### Inštancia `struct`

Doteraz sme definovali len samotnú štruktúru, čo je ekvivalent prípravy tvaru darčekovej škatule.

Stále do nej však musíme vložiť konkrétny obsah, aby sme získali skutočnú „inštanciu“, ktorú možno použiť.

Pri vytváraní inštancie sa za názov štruktúry zvyčajne pridáva `()`:

```swift
StructName(...)
```

Do zátvoriek sa vypĺňa obsah polí, ktorý táto štruktúra vyžaduje.

Napríklad:

```swift
StructName(name: "Fang Junyu")
```

Tento kód znamená: vytvoriť novú inštanciu podľa formátu štruktúry `StructName` a priradiť poľu `name` hodnotu `"Fang Junyu"`.

Keď vyplníme všetok potrebný obsah polí, je to, ako keby sme naplnili škatuľu.

Vtedy získame kompletnú inštanciu štruktúry.

### Prístup k vlastnostiam `struct`

Keď vytvoríme inštanciu, môžeme na prístup k jej vnútorným vlastnostiam použiť „bodkovú syntax“.

Základný zápis:

```swift
instance.propertyName
```

Napríklad:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Tu je `st` inštancia štruktúry a `st.name` znamená prečítanie hodnoty `name` z tejto inštancie.

Tento spôsob čítania si môžete predstaviť tak, že keď napíšeme `st.name`, je to ako keby sme čítali obsah uložený na určitom mieste v škatuľke.

Takýto zápis bude v neskorších rozhraniach SwiftUI veľmi bežný.

Ak napríklad máme štruktúru študenta obsahujúcu meno, vek a triedu, pri zobrazovaní v rozhraní môžeme samostatne čítať:

```swift
student.name
student.age
student.className
```

Výhodou toho je, že dáta sú prehľadnejšie a jednoduchšie na správu.

### Umiestnenie `struct`

Pre začiatočníkov je zvyčajne vhodné písať štruktúru mimo `ContentView`.

Napríklad:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Takto bude štruktúra prehľadnejšia a ľahšie čitateľná.

Zistíte, že samotný `ContentView` je v skutočnosti tiež `struct`.

### Štruktúra `Movie`

S predchádzajúcim základom môžeme definovať štruktúru filmu:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Ide o štruktúru s názvom `Movie`, ktorá sa skladá z troch polí: `name`, `director` a `rating`, ktoré predstavujú názov filmu, režiséra a hodnotenie.

Takto už informácie o jednom filme netreba rozdeľovať do viacerých polí, ale môžu sa priamo spojiť do jedného celku.

Napríklad môžeme vytvoriť takúto inštanciu filmu:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Táto inštancia predstavuje „jedny kompletné údaje o filme“.

### Ukladanie štruktúr do poľa

Predtým sme povedali, že pole môže ukladať len jeden typ.

Teraz už máme štruktúru `Movie`, takže pole môže ukladať viacero `Movie`.

```swift
let lists: [Movie] = []
```

Napríklad:

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

V tomto poli `lists` nie sú uložené stringy, ale viacero inštancií `Movie`.

To znamená, že každý prvok poľa predstavuje jeden kompletný film.

Takto môžeme pri potrebe zobraziť zoznam filmov pomocou `ForEach` čítať každý film jeden po druhom.

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

Tu `movie in` znamená, že pri každom priechode cyklu sa z poľa vezme jeden film a dočasne sa pomenuje `movie`.

Potom môžeme použiť:

```swift
movie.name
movie.director
movie.rating
```

na samostatné prečítanie názvu, režiséra a hodnotenia tohto filmu a ich zobrazenie v rozhraní.

## Chyba `ForEach`

Až po tento bod sme dokončili základný zápis poľa filmov a `ForEach`.

Ak však priamo spustíme nasledujúci kód:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

objaví sa chyba:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Táto chyba znamená, že keď napíšete `id: \.self`, SwiftUI potrebuje použiť každý prvok poľa samotný ako „jedinečný identifikátor“, aby ich vedelo rozlíšiť.

Takýto spôsob zápisu je vhodný pre jednoduché typy ako `String` a `Int`, pretože sa dajú samy osebe pomerne ľahko rozlíšiť.

Ale `Movie` je nami definovaná vlastná štruktúra a `ForEach` nevie, ako ju použiť samu o sebe ako jedinečný identifikátor, preto vznikne chyba.

Najbežnejší spôsob, ako tento problém vyriešiť, je zabezpečiť, aby `Movie` spĺňalo protokol `Identifiable`.

## Protokol

V Swift môžete protokol chápať ako druh „pravidla“ alebo „požiadavky“.

Môžete si ho predstaviť ako dohodu v medzinárodnej organizácii: ak sa nejaká krajina chce pripojiť k medzinárodnej organizácii, zvyčajne musí najprv splniť určité pravidlá stanovené touto organizáciou, zverejniť niektoré údaje a dodržiavať spoločné pravidlá. Až po splnení týchto podmienok sa môže pridať alebo zúčastniť na určitých záležitostiach.

Protokol funguje podobným spôsobom.

Keď sa nejaký typ chce riadiť určitým protokolom, musí spĺňať obsah, ktorý tento protokol vyžaduje. Až po splnení týchto požiadaviek môže typ používať príslušnú funkcionalitu.

Základný zápis:

```swift
struct Movie: Identifiable {
    // ...
}
```

Tu `: Identifiable` znamená, že `Movie` sa riadi protokolom `Identifiable`.

Ak sa typ riadi viacerými protokolmi, možno ich oddeliť čiarkami:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Pre `Identifiable` je najdôležitejšou požiadavkou to, aby mal typ `id`, ktorým sa dokáže identifikovať.

Napríklad:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Tu je `id` ako číslo občianskeho preukazu, ktoré sa používa na rozlíšenie každého filmu.

Pokiaľ je `id` každého filmu iné, SwiftUI dokáže správne rozlíšiť každý prvok v poli.

Napríklad:

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

A potom použijeme vo `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Takto sa chyba už neobjaví.

Keďže `Movie` už spĺňa `Identifiable`, ešte bežnejší zápis je jednoducho vynechať `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Pretože SwiftUI už vie, že na rozlíšenie každej položky má použiť `movie.id`.

## Rozlišovací identifikátor vo `ForEach`

Nižšie si hlbšie vysvetlíme úlohu `id` vo `ForEach`.

Napríklad:

```swift
ForEach(lists, id: \.self)
```

Tu to znamená: použiť samotný prvok ako rozlišovací identifikátor.

A:

```swift
ForEach(lists, id: \.id)
```

znamená: použiť pole `id` prvku ako rozlišovací identifikátor.

Ak nejaké pole samo o sebe dokáže zaručiť jedinečnosť, dá sa dočasne použiť aj ono.

Napríklad, ak je názov každého filmu iný, nasledujúci zápis môže pri aktuálnych dátach fungovať správne:

```swift
ForEach(lists, id: \.name)
```

Je tu však skrytý problém: `name` nemusí byť vždy jedinečné.

Predstavte si, že neskôr pridáte ďalší film s rovnakým názvom — vtedy `name` už nedokáže presne rozlíšiť každý prvok.

V takom prípade sa kód môže stále skompilovať, ale pri obnovení view, aktualizácii, vkladaní a mazaní môže SwiftUI prvky rozpoznať nesprávne, čo spôsobí chybné zobrazenie.

Preto, keď potrebujeme údaje stabilne rozlišovať, je najlepšie použiť skutočne jedinečné pole, teda `id`.

## UUID

Aj keď ručné zapisovanie `id: 1`, `id: 2` môže problém vyriešiť, stále tu zostáva riziko: môžeme omylom napísať duplicitné `id`, a jedinečná identifikácia potom prestane fungovať.

Napríklad:

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

Takto vzniknú dve rovnaké `id` a jedinečná identifikácia sa stane neplatnou.

Aby sme sa vyhli ručným chybám, zvyčajne používame `UUID()`.

Vo Swift `UUID()` náhodne generuje 128-bitový identifikátor. Zvyčajne sa zobrazuje ako dlhý reťazec písmen a číslic.

Napríklad:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Tu `UUID()` v skutočnosti vytvára inštanciu typu `UUID`; môžete si ju predstaviť ako automaticky generované „jedinečné číslo“.

Preto sa vytvorené hodnoty takmer nikdy neopakujú, a preto sú veľmi vhodné na použitie ako `id`.

Môžeme upraviť `Movie` na:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Tento kód znamená, že pole `id` v štruktúre `Movie` dostane predvolene hodnotu novej inštancie `UUID`.

Inými slovami, zakaždým keď vytvárame nový `Movie`, systém nám najprv automaticky vygeneruje jedinečné `id`.

`id` už má predvolenú hodnotu, takže pri neskoršom vytváraní inštancií `Movie` už netreba `id` vypĺňať ručne.

Napríklad:

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

Hoci tu `id` nie je napísané, táto inštancia filmu má v skutočnosti svoje vlastné `id`; táto hodnota je len automaticky vygenerovaná cez `UUID()`.

Po použití tohto spôsobu už nemusíme ručne vypĺňať `id` pre každý film, čo nielen znižuje množstvo kódu, ale aj zabraňuje chybám spôsobeným duplicitnými id.

Na konci už len stačí pridať hore obrázok `Banner` a použiť `ScrollView`, aby sa obsah dal posúvať, a tým bude celý pohľad zoznamu filmov hotový.

## Zhrnutie

V tejto lekcii sme sa naučili veľmi dôležitú tému: `struct`.

Pomocou `struct` môžeme spojiť viacero súvisiacich polí jedného filmu do jedného celku, namiesto toho, aby sme názov, režiséra a hodnotenie rozdeľovali do viacerých polí.

Po spojení dát môžeme pomocou `ForEach` zobrazovať každý film v poli jeden po druhom vo view.

Zároveň sme pochopili aj úlohu „rozlišovacieho identifikátora“ vo `ForEach`. SwiftUI musí vedieť, ako rozlíšiť každý prvok v poli, aby mohlo view správne zobrazovať a aktualizovať.

Preto sme zabezpečili, aby `Movie` spĺňalo protokol `Identifiable`, a poskytli sme mu jedinečné `id`.

Aby sme sa vyhli chybám pri ručnom vypĺňaní `id`, ďalej sme sa naučili aj `UUID()`, ktoré systému umožňuje automaticky generovať jedinečný identifikátor.

Po dokončení tejto lekcie ste nielen vytvorili zoznam filmov, ale tiež ste sa začali stretávať s dôležitým spôsobom uvažovania v SwiftUI: **najprv usporiadať dáta a potom na ich základe generovať view.**

## Kompletný kód

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
