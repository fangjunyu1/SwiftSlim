# Encyklopedie zvířat

V této lekci budeme dál procvičovat vlastní zobrazení a předávání dat.

Vytvoříme jednoduché zobrazení encyklopedie zvířat. Na stránce se zobrazí pět zvířat. Když klepnete na některé zvíře, zobrazí se detailní zobrazení s obrázkem zvířete, oblastí výskytu, prostředím a popisem.

Výsledný efekt:

![view](../../../Resource/029_view.png)

Na tomto příkladu si procvičíme spolupráci datové struktury, zobrazení seznamu, interakce klepnutím a vysunutí Sheet zobrazení.

## Příprava obrázkových materiálů

Nejprve potřebujeme připravit pět obrázků zvířat:

- Delfín: `dolphin.jpg`
- Žirafa: `giraffe.jpg`
- Lev: `lion.jpg`
- Panda: `panda.jpg`
- Lední medvěd: `polarBear.jpg`

Můžete použít následující obrázkové materiály:

[Delfín](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Žirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lev](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Lední medvěd](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Po stažení obrázků je přetáhněte do složky prostředků `Assets` v projektu Xcode.

![assets](../../../Resource/029_assets.png)

Je třeba si všimnout, že při používání obrázků v kódu obvykle nemusíme psát příponu `.jpg`.

Například pokud se obrázkový prostředek jmenuje `dolphin`, v kódu napíšeme:

```swift
Image("dolphin")
```

Pokud název obrázku napíšete špatně, obrázek se nebude správně zobrazovat.

Poznámka: Uvedené obrázkové materiály pocházejí z projektů Wikimedia. Při použití se doporučuje ponechat původní odkazy a informace o zdroji.

## Vytvoření struktury Animal

Na této stránce má každé zvíře několik informací:

- Název zvířete
- Obrázek zvířete
- Emoji zvířete
- Oblast výskytu
- Prostředí
- Popis zvířete

Pokud tyto informace rozdělíme do mnoha samostatných proměnných, kód bude nepřehledný. Proto můžeme vytvořit strukturu `Animal` a informace o jednom zvířeti uložit pohromadě.

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

V tomto kódu:

- `id`: jedinečný identifikátor zvířete.
- `name`: název zvířete.
- `imageName`: název obrázku zvířete.
- `avatarEmoji`: emoji zvířete.
- `distributionArea`: oblast výskytu.
- `habitat`: prostředí.
- `animalDescription`: popis zvířete.

Mezi nimi:

```swift
let id = UUID()
```

`id` se používá k identifikaci každého zvířete. Později použijeme `ForEach` pro zobrazení seznamu zvířat a také `.sheet(item:)` pro zobrazení detailů podle vybraného zvířete, takže `Animal` musí odpovídat protokolu `Identifiable`.

Úkolem `Identifiable` je říct SwiftUI: každé zvíře má `id`, podle kterého lze rozlišit jeho identitu.

## Vytvoření dat zvířat

Dále v `ContentView` vytvoříme pole zvířat.

Pole ukládá pět hodnot `Animal` a každá hodnota `Animal` představuje jedno zvíře.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfín
        Animal(
            name: "Delfín",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Teplé a mírné oceány po celém světě.",
            habitat: "Oceány, pobřežní vody a některé velké řeky.",
            animalDescription: "Delfíni jsou inteligentní mořští savci. Žijí ve skupinách, komunikují pomocí zvuků a jsou známí svým hravým chováním."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savany a otevřené lesy v Africe.",
            habitat: "Travnaté oblasti, savany a otevřené lesy.",
            animalDescription: "Žirafy jsou nejvyšší suchozemská zvířata. Mají dlouhé krky, dlouhé nohy a obvykle se živí listy z vysokých stromů."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vyskytuje se hlavně v subsaharské Africe, s malou populací v západní Indii.",
            habitat: "Travnaté oblasti, savany a otevřené lesy.",
            animalDescription: "Lvi jsou silné velké kočky. Obvykle žijí ve skupinách zvaných smečky a často se jim říká králové zvířecí říše."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Horské lesy ve střední Číně.",
            habitat: "Bambusové lesy v chladných a vlhkých horských oblastech.",
            animalDescription: "Pandy jsou medvědi známí černobílou srstí. Živí se hlavně bambusem a patří mezi nejznámější zvířata na světě."
        ),
        // Lední medvěd
        Animal(
            name: "Lední medvěd",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktické oblasti kolem severního pólu.",
            habitat: "Mořský led, pobřežní oblasti a chladné arktické prostředí.",
            animalDescription: "Lední medvědi jsou velcí medvědi přizpůsobení chladnému prostředí. Jsou silní plavci a při lovu tuleňů závisí hlavně na mořském ledu."
        )
    ]

    var body: some View {
        Text("Encyklopedie zvířat")
    }
}
```

Zde je `animals` pole:

```swift
let animals: [Animal]
```

`[Animal]` znamená, že toto pole ukládá více hodnot `Animal`.

Jinými slovy, `animals` není jedno zvíře, ale skupina zvířat.

## Zobrazení seznamu zvířat

Nyní můžeme použít `ForEach` k zobrazení seznamu zvířat.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
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

Výsledek zobrazení:

![view](../../../Resource/029_view1.png)

V tomto kódu:

```swift
ForEach(animals) { animal in
    ...
}
```

Znamená to procházení pole `animals`.

Při každém průchodu představuje `animal` aktuálně zobrazované zvíře.

Například při prvním průchodu je `animal` delfín; při druhém průchodu je `animal` žirafa.

Proto můžeme informace o aktuálním zvířeti zobrazit následujícím způsobem:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Takto můžeme zobrazit všech pět zvířat.

## Umožnění klepnutí na seznam zvířat

Seznam se již zobrazuje, ale zatím na něj nelze klepnout.

Pokud chceme po klepnutí na určité zvíře zobrazit detail, musíme nejprve zaznamenat „aktuálně vybrané zvíře“.

Proto do `ContentView` přidáme stavovou proměnnou:

```swift
@State private var selectedAnimal: Animal? = nil
```

Zde je `selectedAnimal` volitelná hodnota typu `Animal?`.

Znamená to, že může obsahovat jedno zvíře, nebo také nemusí obsahovat žádné zvíře.

Výchozí hodnota je `nil`, což znamená, že na začátku není vybrané žádné zvíře.

Potom změníme každý řádek zvířete na `Button`:

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
                .cornerRadius(20)
            
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

Důležitý je tento řádek kódu:

```swift
selectedAnimal = animal
```

Když uživatel klepne na určité zvíře, uložíme toto zvíře do `selectedAnimal`.

Například když uživatel klepne na delfína, `selectedAnimal` uloží delfína.

Když uživatel klepne na pandu, `selectedAnimal` uloží pandu.

Jinými slovy, `selectedAnimal` slouží k zaznamenání toho, na které zvíře uživatel právě klepnul.

## Vysunutí Sheet zobrazení

Nyní už můžeme pomocí tlačítka zaznamenat „aktuálně klepnuté zvíře“.

Dále potřebujeme vytvořit vysunuté zobrazení pro zobrazení detailů zvířete.

![view](../../../Resource/029_view2.png)

Ve SwiftUI můžeme tento efekt vysunutí vytvořit pomocí `Sheet`.

`Sheet` si můžeme představit jako dočasně vysunutou stránku. Zobrazí se nad aktuální stránkou a po prohlédnutí obsahu ji uživatel může zavřít přejetím dolů.

## Příklad Sheet

Než začneme skutečně zobrazovat detail zvířete, nejprve použijeme jednoduchý příklad, abychom pochopili, jak se `Sheet` vysouvá.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Zobrazit Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet zobrazení")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/029_view3.png)

V tomto kódu jsme vytvořili booleovskou hodnotu:

```swift
@State private var showSheet = false
```

`showSheet` je ve výchozím stavu `false`, což znamená, že se `Sheet` na začátku nezobrazuje.

Když klepneme na tlačítko:

```swift
showSheet.toggle()
```

`toggle()` znamená přepnutí booleovské hodnoty.

Pokud byla původně `false`, po zavolání `toggle()` se změní na `true`.

Pokud byla původně `true`, po zavolání `toggle()` se změní na `false`.

Po klepnutí na tlačítko se tedy `showSheet` změní z `false` na `true`.

Když se `showSheet` změní na `true`, následující kód vysune `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet zobrazení")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Tento kód znamená: když je `showSheet` `true`, vysune se `Sheet` a uvnitř `Sheet` se zobrazí `Text("Sheet zobrazení")`.

Výsledek zobrazení:

![view](../../../Resource/029_view4.png)

Tento zápis je vhodný pro vysunutí pevně daného obsahu.

Například po klepnutí na tlačítko lze vysunout stránku nastavení, stránku s vysvětlením, stránku s upozorněním a podobně.

### Umístění Sheet

Ačkoli je `Sheet` vysunuté zobrazení, ve SwiftUI se nepíše přímo jako samostatné zobrazení typu `Text()` nebo `Image()`, ale používá se jako modifikátor zobrazení.

Jinými slovy, `.sheet(...)` je podobné modifikátorům `.font()`, `.padding()` a `.shadow()` a musí být připojeno za některé zobrazení.

Například:

```swift
Button("Zobrazit Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet zobrazení")
}
```

V tomto příkladu je `.sheet` připojeno za `Button`.

Když se `showSheet` změní na `true`, SwiftUI vysune `Sheet` a zobrazí obsah uvnitř složených závorek:

```swift
Text("Sheet zobrazení")
```

V reálném vývoji ale obvykle nepřidáváme `.sheet` ke každému tlačítku, pokud má stránka více tlačítek.

Běžnější postup je přidat `.sheet` za vnější zobrazení.

Například:

```swift
VStack {
    Button("Zobrazit Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet zobrazení")
}
```

Tlačítko je odpovědné za změnu `showSheet` a vnější zobrazení je odpovědné za vysunutí `Sheet` podle toho, zda je `showSheet` `true`.

## Sheet navázaný na volitelnou hodnotu

Zápis, který jsme se naučili výše, byl:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet zobrazení")
}
```

Tento zápis je vhodný pro řízení zobrazení a skrytí jedné pevně dané stránky.

V příkladu encyklopedie zvířat ale nepotřebujeme vědět jen „zda se má `Sheet` vysunout“, ale také „na které zvíře bylo klepnuto“.

Například:

Když uživatel klepne na delfína, v `Sheet` by se měl zobrazit detail delfína.

Když uživatel klepne na pandu, v `Sheet` by se měl zobrazit detail pandy.

Proto se zde lépe hodí jiný zápis Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Obsah zobrazený v Sheet
}
```

V tomto kódu je `Sheet` navázán na volitelnou hodnotu `selectedAnimal`.

Je třeba si všimnout, že za `item:` píšeme `$selectedAnimal`, ne `selectedAnimal`.

Je to proto, že `Sheet` nejen čte hodnotu `selectedAnimal`, ale také podle její změny rozhoduje, zda se má vysunout.

Tento kód můžeme chápat takto:

- Když je `selectedAnimal` `nil`, `Sheet` se nezobrazuje.
- Když má `selectedAnimal` hodnotu, `Sheet` se zobrazí.
- Když je `Sheet` zavřen, SwiftUI změní `selectedAnimal` zpět na `nil`.

SwiftUI předá zvíře uložené v `selectedAnimal` do `animal` uvnitř složených závorek.

Jinými slovy, `.sheet(item:)` nejen řídí vysunutí, ale také předá vybraná data do `Sheet`.

## Použití Sheet k zobrazení názvu zvířete

Nyní zatím nespěchejme s vytvářením složitého detailního zobrazení.

Aby byl kód snazší na pochopení, nejprve v `Sheet` zobrazíme název aktuálního zvířete.

Za vnější `VStack` přidáme `.sheet(item:)`:

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
                        .cornerRadius(20)
                    
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

Nejdůležitější je zde tento kód:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Když má `selectedAnimal` hodnotu, `Sheet` se vysune.

`animal` uvnitř složených závorek je aktuálně vybrané zvíře.

Proto:

```swift
Text(animal.name)
```

zobrazí název aktuálně klepnutého zvířete.

Například když klepnete na `Delfín`, v Sheet se zobrazí `Delfín`.

Když klepnete na `Panda`, v `Sheet` se zobrazí `Panda`.

Tímto způsobem jsme vytvořili efekt, kdy klepnutí na různá zvířata vysune různé názvy zvířat.

Zobrazení názvu zvířete:

![view](../../../Resource/029_view5.png)

Detail zvířete by však neměl zobrazovat jen název. Měl by zobrazovat název, oblast výskytu, prostředí a popis.

Pokud bychom celý tento kód napsali do `.sheet`, kód by byl velmi dlouhý a špatně čitelný.

Proto dále vytvoříme nové vlastní zobrazení, které bude speciálně odpovědné za zobrazení detailů zvířete.

## Vytvoření detailního zobrazení zvířete

Dále vytvoříme nové vlastní zobrazení `AnimalDetailView`.

Toto zobrazení přijímá jedno `Animal` a zobrazuje detaily zvířete.

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
                    Text("**Oblast výskytu**: \(animal.distributionArea)")

                    Divider()

                    Text("**Prostředí**: \(animal.habitat)")

                    Divider()

                    Text("**Popis zvířete**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Výsledek zobrazení:

![view](../../../Resource/029_view2.png)

Zde je důležitý tento bod:

```swift
var animal: Animal
```

To znamená, že `AnimalDetailView` potřebuje zvenku přijmout jedno zvíře.

Po přijetí zvířete může detailní zobrazení používat různé informace tohoto zvířete:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Jinými slovy, `AnimalDetailView` je odpovědné pouze za zobrazení předaného zvířete.

### Tučný text v Markdownu

V detailním zobrazení jsme napsali takový kód:

```swift
Text("**Prostředí:** \(animal.habitat)")
```

Zde je třeba pochopit dva body.

Za prvé, `**Prostředí:**` používá syntaxi `Markdown`. Text obalený dvěma hvězdičkami se zobrazí tučně.

Za druhé, `\()` je interpolace řetězce, která dokáže zobrazit hodnotu proměnné uvnitř textu.

Tento kód nejprve zobrazí tučné `Prostředí:` a potom zobrazí prostředí tohoto zvířete.

## Zobrazení detailního zobrazení v Sheet

Po vytvoření `AnimalDetailView` se můžeme vrátit do `ContentView` a původní zobrazení názvu v `Sheet` nahradit detailním zobrazením.

Původně to bylo:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nyní to změníme na:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Zde je `animal:` název parametru zobrazení `AnimalDetailView`.

`animal` za ním je aktuální zvíře předané z `.sheet(item:)`.

Tedy předáme aktuálně klepnuté zvíře do `AnimalDetailView` k zobrazení.

Úplná struktura:

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
                        .cornerRadius(20)
                    
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

Když uživatel klepne na zvíře:

```swift
selectedAnimal = animal
```

`selectedAnimal` se změní z `nil` na konkrétní zvíře. Když `Sheet` zjistí, že `selectedAnimal` má hodnotu, vysune zobrazení.

`Sheet` předá zvíře uložené v `selectedAnimal` do zobrazení `AnimalDetailView` a `AnimalDetailView` zobrazí detaily zvířete.

Tímto způsobem jsme vytvořili funkci klepnutí na seznam zvířat a vysunutí odpovídajících detailů zvířete.

## Rozdíl mezi dvěma zápisy Sheet

Nyní jsme už použili `.sheet(item:)` k dokončení zobrazení detailního zobrazení zvířete.

Zde můžeme stručně shrnout dva běžné zápisy `Sheet`.

### První způsob je navázání booleovské hodnoty

```swift
@State private var showSheet = false

Button("Zobrazit Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet zobrazení")
}
```

Tento zápis je vhodný pro vysunutí pevně daného obsahu, například stránky nastavení, stránky s vysvětlením, stránky s upozorněním a podobně.

`showSheet` je booleovská hodnota, která má jen dva stavy: `true` a `false`.

Když je `showSheet` `true`, `Sheet` se zobrazí.

Když je `showSheet` `false`, `Sheet` se nezobrazí.

### Druhý způsob je navázání volitelné hodnoty

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Tento zápis je vhodný pro vysunutí různého obsahu podle vybraných dat.

V této lekci klepáme na různá zvířata a potřebujeme zobrazit různé detaily zvířat, takže použití `.sheet(item:)` je vhodnější.

## Kompletní kód

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Název zvířete
    let name: String
    
    // Obrázek zvířete
    let imageName: String
    
    // Emoji zvířete
    let avatarEmoji: String
    
    // Oblast výskytu
    let distributionArea: String
    
    // Prostředí
    let habitat: String
    
    // Popis zvířete
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
            distributionArea: "Teplé a mírné oceány po celém světě.",
            habitat: "Oceány, pobřežní vody a některé velké řeky.",
            animalDescription: "Delfíni jsou inteligentní mořští savci. Žijí ve skupinách, komunikují pomocí zvuků a jsou známí svým hravým chováním."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savany a otevřené lesy v Africe.",
            habitat: "Travnaté oblasti, savany a otevřené lesy.",
            animalDescription: "Žirafy jsou nejvyšší suchozemská zvířata. Mají dlouhé krky, dlouhé nohy a obvykle se živí listy z vysokých stromů."
        ),
        // Lev
        Animal(
            name: "Lev",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Vyskytuje se hlavně v subsaharské Africe, s malou populací v západní Indii.",
            habitat: "Travnaté oblasti, savany a otevřené lesy.",
            animalDescription: "Lvi jsou silné velké kočky. Obvykle žijí ve skupinách zvaných smečky a často se jim říká králové zvířecí říše."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Horské lesy ve střední Číně.",
            habitat: "Bambusové lesy v chladných a vlhkých horských oblastech.",
            animalDescription: "Pandy jsou medvědi známí černobílou srstí. Živí se hlavně bambusem a patří mezi nejznámější zvířata na světě."
        ),
        // Lední medvěd
        Animal(
            name: "Lední medvěd",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktické oblasti kolem severního pólu.",
            habitat: "Mořský led, pobřežní oblasti a chladné arktické prostředí.",
            animalDescription: "Lední medvědi jsou velcí medvědi přizpůsobení chladnému prostředí. Jsou silní plavci a při lovu tuleňů závisí hlavně na mořském ledu."
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
                            .cornerRadius(20)

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
                    Text("**Oblast výskytu**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Prostředí**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Popis zvířete**: \(animal.animalDescription)")
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

## Shrnutí

V této lekci jsme dokončili jednoduchou stránku encyklopedie zvířat.

Nejprve jsme použili strukturu `Animal` k uložení informací o zvířatech, potom jsme použili pole k uložení pěti zvířat a nakonec jsme použili `ForEach` k zobrazení seznamu zvířat.

Když uživatel klepne na určité zvíře, uložíme toto zvíře do `selectedAnimal`:

```swift
selectedAnimal = animal
```

Když má `selectedAnimal` hodnotu, `.sheet(item:)` vysune detailní zobrazení a předá vybrané zvíře do `AnimalDetailView`.

Nejdůležitější částí této lekce není styl rozhraní, ale pochopení této trasy předávání dat:

```swift
Klepnutí na zvíře → selectedAnimal uloží zvíře → Sheet se vysune → AnimalDetailView zobrazí detail
```

Po pochopení této trasy budete později moci vytvářet více podobných funkcí, například detaily produktů, detaily kurzů, detaily článků, detaily kontaktů a podobně.
