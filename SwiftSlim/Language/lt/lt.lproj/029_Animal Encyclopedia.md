# Gyvūnų enciklopedija 

Šioje pamokoje toliau praktikuosimės kurti pasirinktinius rodinius ir perduoti duomenis.

Sukursime paprastą gyvūnų enciklopedijos rodinį. Puslapyje bus rodomi penki gyvūnai, o spustelėjus tam tikrą gyvūną bus parodytas išsamios informacijos rodinys, kuriame bus gyvūno nuotrauka, paplitimo sritis, buveinė ir aprašymas.

Galutinis rezultatas:

![view](../../../Resource/029_view.png)

Per šį pavyzdį galime pasipraktikuoti duomenų struktūrų, sąrašo rodymo, paspaudimo sąveikos ir `Sheet` iškylančio rodinio derinimą.

## Paruoškite paveikslėlių išteklius

Pirmiausia turime paruošti penkias gyvūnų nuotraukas:

- Delfinas: `dolphin.jpg`
- Žirafa: `giraffe.jpg`
- Liūtas: `lion.jpg`
- Panda: `panda.jpg`
- Baltasis lokys: `polarBear.jpg`

Galite naudoti šiuos paveikslėlių išteklius:

[Delfinas](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg)、[Žirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg)、[Liūtas](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg)、[Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg)、[Baltasis lokys](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Atsisiuntę paveikslėlius, nutempkite juos į Xcode projekto `Assets` išteklių aplanką.

![assets](../../../Resource/029_assets.png)

Reikia atkreipti dėmesį, kad naudojant paveikslėlį kode paprastai nereikia rašyti `.jpg` plėtinio.

Pavyzdžiui, jei paveikslėlio ištekliaus pavadinimas yra `dolphin`, kode rašome:

```swift
Image("dolphin")
```

Jei paveikslėlio pavadinimas parašytas neteisingai, paveikslėlis nebus rodomas tinkamai.

Pastaba: pirmiau nurodyti paveikslėlių ištekliai yra iš Wikimedia projektų. Naudojant rekomenduojama išsaugoti originalias nuorodas ir šaltinio informaciją.

## Sukurkite gyvūno struktūrą

Šiame puslapyje kiekvienas gyvūnas turi kelias informacijos dalis:

- Gyvūno pavadinimas
- Gyvūno paveikslėlis
- Gyvūno jaustukas
- Paplitimo sritis
- Buveinė
- Gyvūno aprašymas

Jeigu šią informaciją išskaidysime į daug atskirų kintamųjų, kodas taps gana netvarkingas. Todėl galime sukurti `Animal` struktūrą ir vieno gyvūno informaciją laikyti kartu.

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

Šiame kode:

- `id`: unikalus gyvūno identifikatorius.
- `name`: gyvūno pavadinimas.
- `imageName`: gyvūno paveikslėlio pavadinimas.
- `avatarEmoji`: gyvūno jaustukas.
- `distributionArea`: paplitimo sritis.
- `habitat`: buveinė.
- `animalDescription`: gyvūno aprašymas.

Tarp jų:

```swift
let id = UUID()
```

`id` naudojamas kiekvienam gyvūnui identifikuoti. Kadangi vėliau naudosime `ForEach` gyvūnų sąrašui rodyti ir taip pat naudosime `.sheet(item:)`, kad pagal pasirinktą gyvūną būtų parodyta išsami informacija, reikia, kad `Animal` atitiktų `Identifiable` protokolą.

`Identifiable` paskirtis yra pasakyti SwiftUI: kiekvienas gyvūnas turi `id`, pagal kurį galima atskirti jo tapatybę.

## Sukurkite gyvūnų duomenis

Toliau `ContentView` viduje sukuriame gyvūnų masyvą.

Masyve saugomi penki `Animal`, o kiekvienas `Animal` reiškia vieną gyvūną.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfinas
        Animal(
            name: "Delfinas",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Šilti ir vidutinio klimato vandenynai visame pasaulyje.",
            habitat: "Vandenynai, pakrančių vandenys ir kai kurios didelės upės.",
            animalDescription: "Delfinai yra protingi jūrų žinduoliai. Jie gyvena grupėmis, bendrauja garsais ir yra žinomi dėl žaismingo elgesio."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanos ir atviri miškai Afrikoje.",
            habitat: "Pievos, savanos ir atviri miškai.",
            animalDescription: "Žirafos yra aukščiausi sausumos gyvūnai. Jos turi ilgus kaklus, ilgas kojas ir paprastai minta aukštų medžių lapais."
        ),
        // Liūtas
        Animal(
            name: "Liūtas",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Daugiausia aptinkami į pietus nuo Sacharos esančioje Afrikoje, taip pat nedidelė populiacija gyvena vakarų Indijoje.",
            habitat: "Pievos, savanos ir atviri miškai.",
            animalDescription: "Liūtai yra galingos didžiosios katės. Jie paprastai gyvena grupėmis, vadinamomis gaujomis, ir dažnai vadinami gyvūnų pasaulio karaliais."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Kalnų miškai centrinėje Kinijoje.",
            habitat: "Bambukų miškai vėsiose ir drėgnose kalnų vietovėse.",
            animalDescription: "Pandos yra lokiai, žinomi dėl juodai balto kailio. Jos daugiausia minta bambukais ir yra vieni lengviausiai atpažįstamų gyvūnų pasaulyje."
        ),
        // Baltasis lokys
        Animal(
            name: "Baltasis lokys",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arkties regionai aplink Šiaurės ašigalį.",
            habitat: "Jūros ledas, pakrančių teritorijos ir šalta Arkties aplinka.",
            animalDescription: "Baltieji lokiai yra dideli lokiai, prisitaikę prie šaltos aplinkos. Jie yra stiprūs plaukikai ir medžiodami ruonius daugiausia priklauso nuo jūros ledo."
        )
    ]

    var body: some View {
        Text("Gyvūnų enciklopedija")
    }
}
```

Čia `animals` yra masyvas:

```swift
let animals: [Animal]
```

`[Animal]` reiškia, kad šiame masyve saugomi keli `Animal`.

Kitaip tariant, `animals` nėra vienas gyvūnas, o gyvūnų grupė.

## Rodykite gyvūnų sąrašą

Dabar galime naudoti `ForEach` gyvūnų sąrašui rodyti.

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

Galutinis rezultatas:

![view](../../../Resource/029_view1.png)

Šiame kode:

```swift
ForEach(animals) { animal in
    ...
}
```

reiškia, kad pereiname per `animals` masyvą.

Kiekvienos iteracijos metu `animal` reiškia šiuo metu rodomą gyvūną.

Pavyzdžiui, pirmos iteracijos metu `animal` yra delfinas; antros iteracijos metu `animal` yra žirafa.

Todėl dabartinio gyvūno informaciją galime rodyti taip:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Taip galima parodyti visus penkis gyvūnus.

## Leiskite spustelėti gyvūnų sąrašą

Dabar sąrašas jau rodomas, bet jo dar negalima spustelėti.

Jeigu norime, kad spustelėjus tam tikrą gyvūną būtų parodyta išsami informacija, pirmiausia turime įrašyti „šiuo metu pasirinktą gyvūną“.

Todėl `ContentView` pridėkite būsenos kintamąjį:

```swift
@State private var selectedAnimal: Animal? = nil
```

Čia `selectedAnimal` yra pasirenkamoji reikšmė `Animal?`.

Tai reiškia, kad ji gali turėti vieną gyvūną arba neturėti jokio gyvūno.

Numatytoji reikšmė yra `nil`, tai reiškia, kad iš pradžių nėra pasirinktas joks gyvūnas.

Tada kiekvieną gyvūno eilutę pakeičiame į `Button`:

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

Svarbiausia yra ši kodo eilutė:

```swift
selectedAnimal = animal
```

Kai naudotojas spusteli tam tikrą gyvūną, tą gyvūną išsaugome `selectedAnimal`.

Pavyzdžiui, jei naudotojas spusteli delfiną, `selectedAnimal` saugo delfiną.

Jei naudotojas spusteli pandą, `selectedAnimal` saugo pandą.

Kitaip tariant, `selectedAnimal` naudojamas įrašyti, kurį gyvūną naudotojas šiuo metu spustelėjo.

## `Sheet` iškylantis rodinys

Dabar jau galime mygtuku įrašyti „šiuo metu spustelėtą gyvūną“.

Toliau turime įgyvendinti iškylantį rodinį, skirtą rodyti gyvūno išsamiai informacijai.

![view](../../../Resource/029_view2.png)

SwiftUI galima naudoti `Sheet` tokiam iškylančiam efektui įgyvendinti.

`Sheet` galima suprasti kaip laikinai iškylantį puslapį. Jis bus rodomas virš dabartinio puslapio, o peržiūrėjęs turinį naudotojas gali braukti žemyn ir jį uždaryti.

## `Sheet` pavyzdys

Prieš iš tikrųjų rodydami gyvūno informaciją, pirmiausia per paprastą pavyzdį supraskime, kaip iškviečiamas `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Rodyti Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet rodinys")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Galutinis rezultatas:

![view](../../../Resource/029_view3.png)

Šiame kode sukuriame loginę reikšmę:

```swift
@State private var showSheet = false
```

`showSheet` numatytoji reikšmė yra `false`, tai reiškia, kad iš pradžių `Sheet` nerodomas.

Kai paspaudžiamas mygtukas:

```swift
showSheet.toggle()
```

`toggle()` reiškia loginės reikšmės perjungimą.

Jeigu pradinė reikšmė buvo `false`, po `toggle()` iškvietimo ji taps `true`.

Jeigu pradinė reikšmė buvo `true`, po `toggle()` iškvietimo ji taps `false`.

Todėl paspaudus mygtuką `showSheet` pasikeičia iš `false` į `true`.

Kai `showSheet` tampa `true`, toliau esantis kodas parodo `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet rodinys")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Šis kodas reiškia: kai `showSheet` yra `true`, parodyti `Sheet`, o `Sheet` viduje parodyti `Text("Sheet rodinys")`.

Galutinis rezultatas:

![view](../../../Resource/029_view4.png)

Toks rašymo būdas tinka rodyti fiksuotą turinį.

Pavyzdžiui, paspaudus mygtuką parodyti nustatymų puslapį, paaiškinimo puslapį, užuominos puslapį ir pan.

### `Sheet` rodymo vieta

Nors `Sheet` yra iškylantis rodinys, SwiftUI jis nėra rašomas kaip atskiras nepriklausomas rodinys, kaip `Text()` ar `Image()`. Jis naudojamas kaip rodinio modifikatorius.

Kitaip tariant, `.sheet(...)`, kaip ir `.font()`, `.padding()`, `.shadow()`, yra modifikatorius, kurį reikia pridėti po tam tikru rodiniu.

Pavyzdžiui:

```swift
Button("Rodyti Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet rodinys")
}
```

Šiame pavyzdyje `.sheet` pridėtas po `Button`.

Kai `showSheet` tampa `true`, SwiftUI parodo `Sheet` ir rodo figūriniuose skliaustuose esantį turinį:

```swift
Text("Sheet rodinys")
```

Tačiau realioje kūrimo praktikoje, jei puslapyje yra keli mygtukai, paprastai nepridedame `.sheet` prie kiekvieno mygtuko.

Dažnesnis būdas yra pridėti `.sheet` prie išorinio rodinio.

Pavyzdžiui:

```swift
VStack {
    Button("Rodyti Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet rodinys")
}
```

Mygtukas atsakingas už `showSheet` keitimą, o išorinis rodinys pagal tai, ar `showSheet` yra `true`, parodo `Sheet`.

## Pasirenkamosios reikšmės susiejimo `Sheet`

Ankstesnis išmoktas rašymo būdas buvo:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet rodinys")
}
```

Šis rašymo būdas tinka valdyti fiksuoto puslapio rodymą ir slėpimą.

Tačiau gyvūnų enciklopedijos pavyzdyje mums reikia ne tik žinoti, „ar rodyti `Sheet`“, bet ir žinoti, „kuris gyvūnas buvo spustelėtas“.

Pavyzdžiui:

Naudotojas spusteli delfiną, todėl `Sheet` turėtų rodyti delfino informaciją.

Naudotojas spusteli pandą, todėl `Sheet` turėtų rodyti pandos informaciją.

Todėl čia labiau tinka kita `Sheet` rašymo forma:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Turinys, rodomas Sheet viduje
}
```

Šiame kode `Sheet` susiejamas su pasirenkamąja reikšme `selectedAnimal`.

Reikia atkreipti dėmesį, kad po `item:` rašome `$selectedAnimal`, o ne `selectedAnimal`.

Nes `Sheet` ne tik perskaito `selectedAnimal` reikšmę, bet ir pagal jos pokyčius sprendžia, ar reikia iškilti.

Šį kodą galima suprasti taip:

- Kai `selectedAnimal` yra `nil`, `Sheet` nerodomas.
- Kai `selectedAnimal` turi reikšmę, `Sheet` rodomas.
- Kai `Sheet` uždaromas, SwiftUI vėl paverčia `selectedAnimal` į `nil`.

SwiftUI perduos `selectedAnimal` saugomą gyvūną į figūriniuose skliaustuose esantį `animal`.

Kitaip tariant, `.sheet(item:)` ne tik valdo iškėlimą, bet ir perduoda pasirinktus duomenis į `Sheet`.

## Naudokite `Sheet` gyvūno pavadinimui rodyti

Dabar dar neskubėkime kurti sudėtingo išsamios informacijos rodinio.

Kad kodą būtų lengviau suprasti, pirmiausia `Sheet` viduje parodykime dabartinio gyvūno pavadinimą.

Prie `VStack` išorės pridėkite `.sheet(item:)`:

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

Čia svarbiausias yra šis kodas:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Kai `selectedAnimal` turi reikšmę, `Sheet` iškyla.

Figūriniuose skliaustuose esantis `animal` yra šiuo metu pasirinktas gyvūnas.

Todėl:

```swift
Text(animal.name)
```

parodys šiuo metu spustelėto gyvūno pavadinimą.

Pavyzdžiui, spustelėjus `Delfinas`, `Sheet` viduje bus rodoma `Delfinas`.

Spustelėjus `Panda`, `Sheet` viduje bus rodoma `Panda`.

Taip įgyvendiname efektą, kai spustelėjus skirtingą gyvūną iškyla skirtingo gyvūno pavadinimas.

Rodomas gyvūno pavadinimas:

![view](../../../Resource/029_view5.png)

Tačiau gyvūno išsami informacija neturėtų rodyti tik vieno pavadinimo. Ji taip pat turėtų rodyti pavadinimą, paplitimo sritį, buveinę ir aprašymą.

Jeigu visą šį kodą rašysime `.sheet` viduje, kodas taps labai ilgas ir nepatogus skaityti.

Todėl toliau sukursime naują pasirinktinį rodinį, kuris bus atsakingas tik už gyvūno išsamios informacijos rodymą.

## Sukurkite gyvūno išsamios informacijos rodinį

Toliau sukuriame naują pasirinktinį rodinį `AnimalDetailView`.

Šis rodinys priima vieną `Animal` ir rodo gyvūno išsamią informaciją.

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
                    Text("**Paplitimo sritis** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Buveinė** ：\(animal.habitat)")

                    Divider()

                    Text("**Gyvūno aprašymas** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Galutinis rezultatas:

![view](../../../Resource/029_view2.png)

Čia svarbiausia yra:

```swift
var animal: Animal
```

Tai reiškia, kad `AnimalDetailView` turi iš išorės priimti vieną gyvūną.

Gavęs gyvūną, išsamios informacijos rodinys gali naudoti įvairią šio gyvūno informaciją:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Kitaip tariant, `AnimalDetailView` yra atsakingas tik už perduoto gyvūno rodymą.

### Markdown paryškintas tekstas

Išsamios informacijos rodinyje parašėme tokį kodą:

```swift
Text("**Buveinė:** \(animal.habitat)")
```

Čia yra du žinių taškai.

Pirma, `**Buveinė:**` naudoja `Markdown` sintaksę. Dviem žvaigždutėmis apgaubtas tekstas bus rodomas paryškintas.

Antra, `\()` yra eilučių interpoliacija, leidžianti tekste parodyti kintamojo reikšmę.

Šis kodas reiškia: pirmiausia parodyti paryškintą `Buveinė:`, tada parodyti šio gyvūno buveinę.

## `Sheet` viduje rodykite išsamios informacijos rodinį

Sukūrę `AnimalDetailView`, galime grįžti į `ContentView` ir pakeisti ankstesnį pavadinimo rodinį `Sheet` viduje į išsamios informacijos rodinį.

Anksčiau buvo:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Dabar pakeičiame į:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Čia `animal:` yra `AnimalDetailView` parametro pavadinimas.

Už jo esantis `animal` yra dabartinis gyvūnas, perduotas iš `.sheet(item:)`.

Tai reiškia, kad dabartinis spustelėtas gyvūnas perduodamas `AnimalDetailView` rodyti.

Pilna struktūra:

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

Kai naudotojas spusteli gyvūną:

```swift
selectedAnimal = animal
```

`selectedAnimal` iš `nil` tampa konkrečiu gyvūnu, o `Sheet`, aptikęs, kad `selectedAnimal` turi reikšmę, parodo rodinį.

`Sheet` perduoda `selectedAnimal` saugomą gyvūną į `AnimalDetailView`, o `AnimalDetailView` rodo gyvūno išsamią informaciją.

Taip įgyvendiname funkciją, kai spustelėjus gyvūnų sąrašą iškyla atitinkamo gyvūno išsami informacija.

## Dviejų `Sheet` rašymo būdų skirtumas

Dabar jau naudodami `.sheet(item:)` užbaigėme gyvūno išsamios informacijos rodymą.

Čia galime trumpai apibendrinti du dažnus `Sheet` rašymo būdus.

### Pirmasis būdas — susieti loginę reikšmę

```swift
@State private var showSheet = false

Button("Rodyti Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet rodinys")
}
```

Šis rašymo būdas tinka rodyti fiksuotą turinį, pavyzdžiui, nustatymų puslapį, paaiškinimo puslapį, užuominos puslapį ir pan.

`showSheet` yra loginė reikšmė, turinti tik dvi būsenas: `true` ir `false`.

Kai `showSheet` yra `true`, `Sheet` rodomas.

Kai `showSheet` yra `false`, `Sheet` nerodomas.

### Antrasis būdas — susieti pasirenkamąją reikšmę

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Šis rašymo būdas tinka pagal pasirinktus duomenis rodyti skirtingą turinį.

Šioje pamokoje spustelėjus skirtingus gyvūnus reikia rodyti skirtingą jų informaciją, todėl `.sheet(item:)` yra tinkamesnis pasirinkimas.

## Pilnas kodas

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Gyvūno pavadinimas
    let name: String
    
    // Gyvūno paveikslėlis
    let imageName: String
    
    // Gyvūno žymos simbolis
    let avatarEmoji: String
    
    // Paplitimo sritis
    let distributionArea: String
    
    // Buveinė
    let habitat: String
    
    // Gyvūno aprašymas
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfinas
        Animal(
            name: "Delfinas",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Šilti ir vidutinio klimato vandenynai visame pasaulyje.",
            habitat: "Vandenynai, pakrančių vandenys ir kai kurios didelės upės.",
            animalDescription: "Delfinai yra protingi jūrų žinduoliai. Jie gyvena grupėmis, bendrauja garsais ir yra žinomi dėl žaismingo elgesio."
        ),
        // Žirafa
        Animal(
            name: "Žirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanos ir atviri miškai Afrikoje.",
            habitat: "Pievos, savanos ir atviri miškai.",
            animalDescription: "Žirafos yra aukščiausi sausumos gyvūnai. Jos turi ilgus kaklus, ilgas kojas ir paprastai minta aukštų medžių lapais."
        ),
        // Liūtas
        Animal(
            name: "Liūtas",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Daugiausia aptinkami į pietus nuo Sacharos esančioje Afrikoje, taip pat nedidelė populiacija gyvena vakarų Indijoje.",
            habitat: "Pievos, savanos ir atviri miškai.",
            animalDescription: "Liūtai yra galingos didžiosios katės. Jie paprastai gyvena grupėmis, vadinamomis gaujomis, ir dažnai vadinami gyvūnų pasaulio karaliais."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Kalnų miškai centrinėje Kinijoje.",
            habitat: "Bambukų miškai vėsiose ir drėgnose kalnų vietovėse.",
            animalDescription: "Pandos yra lokiai, žinomi dėl juodai balto kailio. Jos daugiausia minta bambukais ir yra vieni lengviausiai atpažįstamų gyvūnų pasaulyje."
        ),
        // Baltasis lokys
        Animal(
            name: "Baltasis lokys",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arkties regionai aplink Šiaurės ašigalį.",
            habitat: "Jūros ledas, pakrančių teritorijos ir šalta Arkties aplinka.",
            animalDescription: "Baltieji lokiai yra dideli lokiai, prisitaikę prie šaltos aplinkos. Jie yra stiprūs plaukikai ir medžiodami ruonius daugiausia priklauso nuo jūros ledo."
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
                    Text("**Paplitimo sritis** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Buveinė** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Gyvūno aprašymas** ：\(animal.animalDescription)")
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

## Santrauka

Šioje pamokoje sukūrėme paprastą gyvūnų enciklopedijos puslapį.

Pirmiausia naudojome `Animal` struktūrą gyvūnų informacijai saugoti, tada masyvą penkiems gyvūnams saugoti, o galiausiai naudojome `ForEach` gyvūnų sąrašui rodyti.

Kai naudotojas spusteli tam tikrą gyvūną, tą gyvūną išsaugome `selectedAnimal`:

```swift
selectedAnimal = animal
```

Kai `selectedAnimal` turi reikšmę, `.sheet(item:)` parodo išsamios informacijos rodinį ir perduoda pasirinktą gyvūną į `AnimalDetailView`.

Svarbiausia šioje pamokoje yra ne sąsajos stilius, o šio duomenų perdavimo kelio supratimas:

```swift
Spustelėti gyvūną → selectedAnimal išsaugo gyvūną → Sheet iškyla → AnimalDetailView rodo informaciją
```

Supratus šį kelią, ateityje galima kurti daugiau panašių funkcijų, pavyzdžiui, produkto informaciją, kurso informaciją, straipsnio informaciją, kontakto informaciją ir pan.
