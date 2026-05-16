# Encyklopédia zvierat 

V tejto lekcii budeme ďalej precvičovať vlastné zobrazenia a odovzdávanie údajov.

Vytvoríme jednoduché zobrazenie encyklopédie zvierat. Na stránke sa zobrazí päť zvierat. Keď používateľ klepne na určité zviera, zobrazí sa detailné zobrazenie s obrázkom, oblasťou výskytu, biotopom a opisom tohto zvieraťa.

Výsledný efekt:

![view](../../../Resource/029_view.png)

Na tomto príklade si môžeme precvičiť spoluprácu medzi dátovou štruktúrou, zobrazením zoznamu, interakciou klepnutím a vyskakovacím zobrazením Sheet.

## Príprava obrázkových materiálov

Najprv si musíme pripraviť päť obrázkov zvierat:

- Delfín: `dolphin.jpg`
- Žirafa: `giraffe.jpg`
- Lev: `lion.jpg`
- Panda: `panda.jpg`
- Ľadový medveď: `polarBear.jpg`

Môžete použiť nasledujúce obrázkové materiály:

[Delfín](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Žirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lev](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Ľadový medveď](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Po stiahnutí obrázkov ich presuňte do priečinka zdrojov `Assets` v projekte Xcode.

![assets](../../../Resource/029_assets.png)

Treba si uvedomiť, že pri používaní obrázkov v kóde zvyčajne nie je potrebné písať príponu `.jpg`.

Napríklad, ak sa obrázkový zdroj volá `dolphin`, v kóde napíšeme:

```swift
Image("dolphin")
```

Ak názov obrázka napíšete nesprávne, obrázok sa nezobrazí správne.

Poznámka: Uvedené obrázkové materiály pochádzajú z projektov Wikimedia. Pri používaní sa odporúča ponechať odkaz na pôvodný obrázok a informácie o zdroji.

## Vytvorenie štruktúry zvieraťa

Na tejto stránke má každé zviera viacero informácií:

- Názov zvieraťa
- Obrázok zvieraťa
- Emoji zvieraťa
- Oblasť výskytu
- Biotop
- Opis zvieraťa

Ak tieto informácie rozptýlime do mnohých premenných, kód bude pomerne neprehľadný. Preto môžeme vytvoriť štruktúru `Animal` a uložiť informácie o jednom zvierati na jedno miesto.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

V tomto kóde:

- `id`: jedinečný identifikátor zvieraťa.
- `name`: názov zvieraťa.
- `imageName`: názov obrázka zvieraťa.
- `avatarEmoji`: emoji zvieraťa.
- `distributionArea`: oblasť výskytu.
- `habitat`: biotop.
- `animalDescription`: opis zvieraťa.

Medzi nimi:

```swift
let id = UUID()
```

`id` sa používa na identifikáciu každého zvieraťa. Neskôr budeme pomocou `ForEach` zobrazovať zoznam zvierat a pomocou `.sheet(item:)` podľa vybraného zvieraťa zobrazovať detaily, preto musí `Animal` dodržiavať protokol `Identifiable`.

Úlohou protokolu `Identifiable` je povedať SwiftUI: každé zviera má `id`, podľa ktorého sa dá odlíšiť od ostatných.

## Vytvorenie údajov o zvieratách

Potom v `ContentView` vytvoríme pole zvierat.

V poli je uložených päť hodnôt `Animal`, pričom každá hodnota `Animal` predstavuje jedno zviera.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfín
        Animal(
            name: "Delfín",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Teplé a mierne oceány po celom svete.",
            habitat: "Oceány, pobrežné vody a niektoré veľké rieky.",
            animalDescription: "Delfíny sú inteligentné morské cicavce. Žijú v skupinách, komunikujú zvukmi a sú známe svojím hravým správaním."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savany a otvorené lesy v Afrike.",
            habitat: "Trávnaté oblasti, savany a otvorené lesy.",
            animalDescription: "Žirafy sú najvyššie suchozemské zvieratá. Majú dlhé krky, dlhé nohy a zvyčajne sa živia listami z vysokých stromov."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vyskytuje sa najmä v subsaharskej Afrike, s malou populáciou v západnej Indii.",
            habitat: "Trávnaté oblasti, savany a otvorené lesnaté krajiny.",
            animalDescription: "Levy sú silné veľké mačky. Zvyčajne žijú v skupinách nazývaných svorky a často sa označujú ako králi zvieracej ríše."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Horské lesy v strednej Číne.",
            habitat: "Bambusové lesy v chladných a vlhkých horských oblastiach.",
            animalDescription: "Pandy sú medvede známe svojou čierno-bielou srsťou. Živia sa najmä bambusom a patria medzi najľahšie rozpoznateľné zvieratá na svete."
        ),
        // Ľadový medveď
        Animal(
            name: "Ľadový medveď",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktické oblasti okolo severného pólu.",
            habitat: "Morský ľad, pobrežné oblasti a chladné arktické prostredia.",
            animalDescription: "Ľadové medvede sú veľké medvede prispôsobené chladnému prostrediu. Sú silní plavci a pri love tuleňov sú závislé najmä od morského ľadu."
        )
    ]

    var body: some View {
        Text("Encyklopédia zvierat")
    }
}
```

Tu je `animals` pole:

```swift
let animals: [Animal]
```

`[Animal]` znamená, že v tomto poli je uložených viac hodnôt `Animal`.

Inými slovami, `animals` nie je jedno zviera, ale skupina zvierat.

## Zobrazenie zoznamu zvierat

Teraz môžeme pomocou `ForEach` zobraziť zoznam zvierat.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .clipShape(Circle())
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/029_view1.png)

V tomto kóde:

```swift
ForEach(animals) { animal in
    ...
}
```

znamená prechádzanie po poli `animals`.

Pri každom cykle `animal` predstavuje zviera, ktoré sa práve zobrazuje.

Napríklad pri prvom cykle je `animal` delfín; pri druhom cykle je `animal` žirafa.

Preto môžeme informácie o aktuálnom zvierati zobraziť týmto spôsobom:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Takto môžeme zobraziť všetkých päť zvierat.

## Umožnenie klepnutia na zoznam zvierat

Zoznam je teraz zobrazený, ale ešte sa naň nedá klepnúť.

Ak chceme po klepnutí na určité zviera zobraziť detaily, musíme najprv zaznamenať „aktuálne vybrané zviera“.

Preto do `ContentView` pridáme stavovú premennú:

```swift
@State private var selectedAnimal: Animal? = nil
```

Tu je `selectedAnimal` voliteľná hodnota typu `Animal?`.

To znamená, že môže obsahovať jedno zviera alebo nemusí obsahovať žiadne zviera.

Predvolená hodnota je `nil`, čo znamená, že na začiatku nie je vybrané žiadne zviera.

Potom každý riadok so zvieraťom zmeníme na `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .clipShape(Circle())
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

Dôležitý je tento riadok kódu:

```swift
selectedAnimal = animal
```

Keď používateľ klepne na určité zviera, uložíme toto zviera do `selectedAnimal`.

Napríklad, keď používateľ klepne na delfína, v `selectedAnimal` sa uloží delfín.

Keď používateľ klepne na pandu, v `selectedAnimal` sa uloží panda.

Inými slovami, `selectedAnimal` slúži na zaznamenanie toho, na ktoré zviera používateľ práve klepol.

## Vyskakovacie zobrazenie Sheet

Teraz už môžeme pomocou tlačidla zaznamenať „aktuálne klepnuté zviera“.

Ďalej musíme implementovať vyskakovacie zobrazenie, ktoré bude zobrazovať detaily zvieraťa.

![view](../../../Resource/029_view2.png)

V SwiftUI môžeme na takýto vyskakovací efekt použiť `Sheet`.

`Sheet` môžeme chápať ako dočasne vysunutú stránku. Zobrazí sa nad aktuálnou stránkou a používateľ ju môže po prezretí obsahu zavrieť potiahnutím nadol.

## Príklad Sheet

Skôr než skutočne zobrazíme detaily zvieraťa, najprv si na jednoduchom príklade vysvetlíme, ako sa `Sheet` zobrazuje.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Zobraziť Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Zobrazenie Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/029_view3.png)

V tomto kóde sme vytvorili boolovskú hodnotu:

```swift
@State private var showSheet = false
```

`showSheet` má predvolenú hodnotu `false`, čo znamená, že na začiatku sa `Sheet` nezobrazuje.

Keď klepneme na tlačidlo:

```swift
showSheet.toggle()
```

`toggle()` znamená prepnutie boolovskej hodnoty.

Ak bola pôvodne `false`, po zavolaní `toggle()` sa zmení na `true`.

Ak bola pôvodne `true`, po zavolaní `toggle()` sa zmení na `false`.

Preto sa po klepnutí na tlačidlo `showSheet` zmení z `false` na `true`.

Keď sa `showSheet` zmení na `true`, nasledujúci kód zobrazí `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Zobrazenie Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Tento kód znamená: keď je `showSheet` `true`, zobrazí sa `Sheet` a v `Sheet` sa zobrazí `Text("Zobrazenie Sheet")`.

Výsledok zobrazenia:

![view](../../../Resource/029_view4.png)

Tento zápis je vhodný na zobrazenie pevného obsahu.

Napríklad po klepnutí na tlačidlo môžeme zobraziť stránku nastavení, stránku vysvetlenia, stránku upozornenia a podobne.

### Umiestnenie Sheet

Hoci je `Sheet` vyskakovacie zobrazenie, v SwiftUI sa nepíše priamo ako samostatné zobrazenie typu `Text()` alebo `Image()`, ale používa sa ako modifikátor zobrazenia.

To znamená, že `.sheet(...)` je podobné modifikátorom `.font()`, `.padding()` alebo `.shadow()` a treba ho pridať za nejaké zobrazenie.

Napríklad:

```swift
Button("Zobraziť Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Zobrazenie Sheet")
}
```

V tomto príklade je `.sheet` pridané za `Button`.

Keď sa `showSheet` zmení na `true`, SwiftUI zobrazí `Sheet` a zobrazí obsah v zložených zátvorkách:

```swift
Text("Zobrazenie Sheet")
```

V skutočnom vývoji však zvyčajne nepridávame `.sheet` ku každému tlačidlu, ak je na stránke viac tlačidiel.

Bežnejším postupom je pridať `.sheet` za vonkajšie zobrazenie.

Napríklad:

```swift
VStack {
    Button("Zobraziť Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Zobrazenie Sheet")
}
```

Tlačidlo je zodpovedné za zmenu `showSheet` a vonkajšie zobrazenie je zodpovedné za zobrazenie `Sheet` podľa toho, či je `showSheet` `true`.

## Sheet viazaný na voliteľnú hodnotu

Predtým sme sa naučili tento zápis:

```swift
.sheet(isPresented: $showSheet) {
    Text("Zobrazenie Sheet")
}
```

Tento zápis je vhodný na ovládanie zobrazenia a skrytia pevnej stránky.

V prípade encyklopédie zvierat však nepotrebujeme vedieť len to, „či sa má `Sheet` zobraziť“, ale aj to, „na ktoré zviera používateľ klepol“.

Napríklad:

Používateľ klepne na delfína, v `Sheet` by sa mali zobraziť detaily delfína.

Používateľ klepne na pandu, v `Sheet` by sa mali zobraziť detaily pandy.

Preto je tu vhodnejšie použiť iný zápis Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Obsah zobrazený v Sheet
}
```

V tomto kóde je `Sheet` viazaný na voliteľnú hodnotu `selectedAnimal`.

Tu si všimnite, že za `item:` píšeme `$selectedAnimal`, nie `selectedAnimal`.

Dôvod je, že `Sheet` hodnotu `selectedAnimal` nielen číta, ale podľa jej zmien musí rozhodnúť, či sa má zobraziť.

Tento kód môžeme chápať takto:

- Keď je `selectedAnimal` `nil`, `Sheet` sa nezobrazí.
- Keď má `selectedAnimal` hodnotu, `Sheet` sa zobrazí.
- Keď sa `Sheet` zavrie, SwiftUI opäť zmení `selectedAnimal` na `nil`.

SwiftUI odovzdá zviera uložené v `selectedAnimal` do `animal` v zložených zátvorkách.

Inými slovami, `.sheet(item:)` nielen ovláda vyskakovanie, ale aj odovzdáva vybrané údaje do `Sheet`.

## Použitie Sheet na zobrazenie názvu zvieraťa

Teraz sa ešte neponáhľajme s vytvorením zložitého detailného zobrazenia.

Aby bol kód ľahšie pochopiteľný, najprv v `Sheet` zobrazíme názov aktuálneho zvieraťa.

Za `VStack` pridáme `.sheet(item:)`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Najdôležitejšia je táto časť kódu:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Keď má `selectedAnimal` hodnotu, `Sheet` sa zobrazí.

`animal` v zložených zátvorkách je aktuálne vybrané zviera.

Preto:

```swift
Text(animal.name)
```

zobrazí názov aktuálne klepnutého zvieraťa.

Napríklad, keď klepneme na `Delfín`, v Sheet sa zobrazí `Delfín`.

Keď klepneme na `Panda`, v `Sheet` sa zobrazí `Panda`.

Takto sme dosiahli efekt, že pri klepnutí na rôzne zvieratá sa zobrazia rôzne názvy zvierat.

Zobrazenie názvu zvieraťa:

![view](../../../Resource/029_view5.png)

Detaily zvieraťa by však nemali zobrazovať iba názov. Mali by zobrazovať názov, oblasť výskytu, biotop a opis.

Ak by sme celý tento kód napísali priamo do `.sheet`, kód by sa stal veľmi dlhý a horšie čitateľný.

Preto ďalej vytvoríme nové vlastné zobrazenie, ktoré bude špeciálne zodpovedné za zobrazovanie detailov zvieraťa.

## Vytvorenie detailného zobrazenia zvieraťa

Ďalej vytvoríme nové vlastné zobrazenie `AnimalDetailView`.

Toto zobrazenie prijme jedno `Animal` a zobrazí detaily zvieraťa.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Oblasť výskytu**: \(animal.distributionArea)")

                    Divider()

                    Text("**Biotop**: \(animal.habitat)")

                    Divider()

                    Text("**Opis zvieraťa**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Výsledok zobrazenia:

![view](../../../Resource/029_view2.png)

Dôležitá časť je:

```swift
var animal: Animal
```

To znamená, že `AnimalDetailView` musí zvonka prijať jedno zviera.

Po prijatí zvieraťa môže detailné zobrazenie používať rôzne informácie o tomto zvierati:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Inými slovami, `AnimalDetailView` je zodpovedné iba za zobrazenie odovzdaného zvieraťa.

### Tučný text pomocou Markdown

V detailnom zobrazení sme napísali takýto kód:

```swift
Text("**Biotop:** \(animal.habitat)")
```

Tu sú dva dôležité body.

Po prvé, `**Biotop:**` používa syntax `Markdown`. Text uzavretý medzi dvoma hviezdičkami sa zobrazí tučným písmom.

Po druhé, `\()` je interpolácia reťazca, ktorá dokáže zobraziť hodnotu premennej v texte.

Tento kód znamená, že sa najprv zobrazí tučný text `Biotop:` a potom biotop tohto zvieraťa.

## Zobrazenie detailného zobrazenia v Sheet

Po vytvorení `AnimalDetailView` sa môžeme vrátiť do `ContentView` a pôvodné zobrazenie názvu v `Sheet` nahradiť detailným zobrazením.

Pôvodne bolo:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Teraz to zmeníme na:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tu je `animal:` názov parametra zobrazenia `AnimalDetailView`.

Nasledujúce `animal` je aktuálne zviera odovzdané cez `.sheet(item:)`.

To znamená, že aktuálne klepnuté zviera odovzdáme do `AnimalDetailView` na zobrazenie.

Celá štruktúra:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Keď používateľ klepne na zviera:

```swift
selectedAnimal = animal
```

`selectedAnimal` sa z `nil` zmení na konkrétne zviera a keď `Sheet` zistí, že `selectedAnimal` má hodnotu, zobrazí zobrazenie.

`Sheet` odovzdá zviera v `selectedAnimal` do zobrazenia `AnimalDetailView` a `AnimalDetailView` zobrazí detaily zvieraťa.

Takto sme implementovali funkciu, pri ktorej sa po klepnutí na zviera v zozname zobrazia príslušné detaily zvieraťa.

## Rozdiel medzi dvoma zápismi Sheet

Teraz sme pomocou `.sheet(item:)` dokončili zobrazenie detailov zvieraťa.

Tu môžeme stručne zhrnúť dva bežné zápisy `Sheet`.

### Prvý zápis viaže boolovskú hodnotu

```swift
@State private var showSheet = false

Button("Zobraziť Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Zobrazenie Sheet")
}
```

Tento zápis je vhodný na zobrazenie pevného obsahu, napríklad stránky nastavení, stránky vysvetlenia alebo stránky upozornenia.

`showSheet` je boolovská hodnota a má iba dva stavy: `true` a `false`.

Keď je `showSheet` `true`, `Sheet` sa zobrazí.

Keď je `showSheet` `false`, `Sheet` sa nezobrazí.

### Druhý zápis viaže voliteľnú hodnotu

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tento zápis je vhodný na zobrazenie rôzneho obsahu podľa vybraných údajov.

V tejto lekcii klepáme na rôzne zvieratá a potrebujeme zobraziť detaily rôznych zvierat, preto je `.sheet(item:)` vhodnejšie.

## Kompletný kód

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Názov zvieraťa
    let name: String
    
    // Obrázok zvieraťa
    let imageName: String
    
    // Symbol označenia zvieraťa
    let avatarEmoji: String
    
    // Oblasť výskytu
    let distributionArea: String
    
    // Biotop
    let habitat: String
    
    // Opis zvieraťa
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfín
        Animal(
            name: "Delfín",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Teplé a mierne oceány po celom svete.",
            habitat: "Oceány, pobrežné vody a niektoré veľké rieky.",
            animalDescription: "Delfíny sú inteligentné morské cicavce. Žijú v skupinách, komunikujú zvukmi a sú známe svojím hravým správaním."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savany a otvorené lesy v Afrike.",
            habitat: "Trávnaté oblasti, savany a otvorené lesy.",
            animalDescription: "Žirafy sú najvyššie suchozemské zvieratá. Majú dlhé krky, dlhé nohy a zvyčajne sa živia listami z vysokých stromov."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vyskytuje sa najmä v subsaharskej Afrike, s malou populáciou v západnej Indii.",
            habitat: "Trávnaté oblasti, savany a otvorené lesnaté krajiny.",
            animalDescription: "Levy sú silné veľké mačky. Zvyčajne žijú v skupinách nazývaných svorky a často sa označujú ako králi zvieracej ríše."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Horské lesy v strednej Číne.",
            habitat: "Bambusové lesy v chladných a vlhkých horských oblastiach.",
            animalDescription: "Pandy sú medvede známe svojou čierno-bielou srsťou. Živia sa najmä bambusom a patria medzi najľahšie rozpoznateľné zvieratá na svete."
        ),
        // Ľadový medveď
        Animal(
            name: "Ľadový medveď",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktické oblasti okolo severného pólu.",
            habitat: "Morský ľad, pobrežné oblasti a chladné arktické prostredia.",
            animalDescription: "Ľadové medvede sú veľké medvede prispôsobené chladnému prostrediu. Sú silní plavci a pri love tuleňov sú závislé najmä od morského ľadu."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Oblasť výskytu**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Biotop**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Opis zvieraťa**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Zhrnutie

V tejto lekcii sme dokončili jednoduchú stránku encyklopédie zvierat.

Najprv sme pomocou štruktúry `Animal` uložili informácie o zvieratách, potom sme pomocou poľa uložili päť zvierat a pomocou `ForEach` sme zobrazili zoznam zvierat.

Keď používateľ klepne na určité zviera, uložíme toto zviera do `selectedAnimal`:

```swift
selectedAnimal = animal
```

Keď má `selectedAnimal` hodnotu, `.sheet(item:)` zobrazí detailné zobrazenie a odovzdá vybrané zviera do `AnimalDetailView`.

Najdôležitejšie v tejto lekcii nie je štýl rozhrania, ale pochopenie tejto cesty odovzdávania údajov:

```swift
Klepnutie na zviera → selectedAnimal uloží zviera → Sheet sa zobrazí → AnimalDetailView zobrazí detaily
```

Keď pochopíte túto cestu, neskôr môžete vytvoriť viac podobných funkcií, napríklad detaily produktu, detaily kurzu, detaily článku alebo detaily kontaktu.
