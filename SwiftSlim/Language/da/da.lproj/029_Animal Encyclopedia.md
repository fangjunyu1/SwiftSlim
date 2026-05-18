# Dyreleksikon

I denne lektion fortsætter vi med at øve brugerdefinerede views og dataoverførsel.

Vi skal lave et enkelt dyreleksikon-view. Siden viser fem dyr. Når brugeren trykker på et dyr, vises et detalje-view med dyrets billede, udbredelsesområde, levested og beskrivelse.

Resultat:

![view](../../../Resource/029_view.png)

Gennem dette eksempel kan vi øve, hvordan datastrukturer, listevisning, trykinteraktion og Sheet-præsentation arbejder sammen.

## Forbered billedressourcer

Først skal vi forberede fem dyrebilleder:

- Delfin: `dolphin.jpg`
- Giraf: `giraffe.jpg`
- Løve: `lion.jpg`
- Panda: `panda.jpg`
- Isbjørn: `polarBear.jpg`

Du kan bruge følgende billedressourcer:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraf](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Løve](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Isbjørn](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Når billederne er downloadet, skal du trække dem ind i Xcode-projektets ressourcefolder `Assets`.

![assets](../../../Resource/029_assets.png)

Bemærk, at når du bruger billeder i kode, behøver du normalt ikke skrive filendelsen `.jpg`.

Hvis billedressourcens navn for eksempel er `dolphin`, skriver du sådan i koden:

```swift
Image("dolphin")
```

Hvis billednavnet skrives forkert, kan billedet ikke vises korrekt.

Bemærk: Billedressourcerne ovenfor kommer fra Wikimedia-projekter. Ved brug anbefales det at bevare de originale links og kildeoplysninger.

## Opret Animal-strukturen

På denne side har hvert dyr flere oplysninger:

- Dyrets navn
- Dyrets billede
- Dyrets emoji
- Udbredelsesområde
- Levested
- Dyrebeskrivelse

Hvis vi spreder disse oplysninger ud i mange separate variabler, bliver koden uoverskuelig. Derfor kan vi oprette en `Animal`-struktur og samle oplysningerne om ét dyr ét sted.

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

I denne kode:

- `id`: dyrets unikke identifikator.
- `name`: dyrets navn.
- `imageName`: navnet på dyrets billede.
- `avatarEmoji`: dyrets emoji.
- `distributionArea`: udbredelsesområdet.
- `habitat`: levestedet.
- `animalDescription`: dyrebeskrivelsen.

Blandt dem:

```swift
let id = UUID()
```

`id` bruges til at identificere hvert enkelt dyr. Senere bruger vi `ForEach` til at vise dyrelisten, og vi bruger også `.sheet(item:)` til at vise detaljer baseret på det valgte dyr. Derfor skal `Animal` følge protokollen `Identifiable`.

Rollen for `Identifiable` er at fortælle SwiftUI, at hvert dyr har et `id`, som kan skelne dets identitet.

## Opret dyredata

Dernæst opretter vi et dyrearray i `ContentView`.

Arrayet gemmer fem `Animal`-værdier, og hver `Animal` repræsenterer ét dyr.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererede have rundt om i verden.",
            habitat: "Have, kystvande og nogle store floder.",
            animalDescription: "Delfiner er intelligente havpattedyr. De lever i grupper, kommunikerer med lyde og er kendt for deres legesyge adfærd."
        ),
        // Giraf
        Animal(
            name: "Giraf",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner og åbne skovområder i Afrika.",
            habitat: "Græsarealer, savanner og åbne skove.",
            animalDescription: "Giraffer er de højeste landdyr. De har lange halse, lange ben og spiser normalt blade fra høje træer."
        ),
        // Løve
        Animal(
            name: "Løve",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Findes hovedsageligt i Afrika syd for Sahara, med en lille bestand i det vestlige Indien.",
            habitat: "Græsarealer, savanner og åbne skovområder.",
            animalDescription: "Løver er kraftige store kattedyr. De lever normalt i grupper, der kaldes flokke, og omtales ofte som dyreverdenens konger."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bjergskove i det centrale Kina.",
            habitat: "Bambusskove i kølige og fugtige bjergområder.",
            animalDescription: "Pandaer er bjørne, der er kendt for deres sort-hvide pels. De spiser hovedsageligt bambus og er blandt verdens mest genkendelige dyr."
        ),
        // Isbjørn
        Animal(
            name: "Isbjørn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiske områder omkring Nordpolen.",
            habitat: "Havis, kystområder og kolde arktiske miljøer.",
            animalDescription: "Isbjørne er store bjørne, der er tilpasset kolde miljøer. De er stærke svømmere og er hovedsageligt afhængige af havis for at jage sæler."
        )
    ]

    var body: some View {
        Text("Dyreleksikon")
    }
}
```

Her er `animals` et array:

```swift
let animals: [Animal]
```

`[Animal]` betyder, at dette array gemmer flere `Animal`-værdier.

Med andre ord er `animals` ikke ét dyr, men en gruppe dyr.

## Vis dyrelisten

Nu kan vi bruge `ForEach` til at vise dyrelisten.

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

Visningsresultat:

![view](../../../Resource/029_view1.png)

I denne kode:

```swift
ForEach(animals) { animal in
    ...
}
```

Det betyder, at vi gennemløber arrayet `animals`.

I hver gennemløbning repræsenterer `animal` det dyr, der vises lige nu.

For eksempel er `animal` delfinen i den første gennemløbning, og `animal` er giraffen i den anden gennemløbning.

Derfor kan vi vise det aktuelle dyrs oplysninger på følgende måde:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

På den måde kan de fem dyr vises.

## Gør dyrelisten trykbar

Listen vises nu, men den kan endnu ikke trykkes på.

Hvis vi vil vise detaljer efter et tryk på et dyr, skal vi først registrere det “aktuelt valgte dyr”.

Derfor tilføjer vi en state-variabel i `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Her er `selectedAnimal` en optional-værdi af typen `Animal?`.

Det betyder, at den enten kan indeholde et dyr eller slet ikke indeholde et dyr.

Standardværdien er `nil`, hvilket betyder, at der ikke er valgt noget dyr i begyndelsen.

Derefter ændrer vi hver dyrerække til en `Button`:

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

Den vigtigste linje er denne:

```swift
selectedAnimal = animal
```

Når brugeren trykker på et dyr, gemmer vi dette dyr i `selectedAnimal`.

Hvis brugeren for eksempel trykker på delfinen, gemmer `selectedAnimal` delfinen.

Hvis brugeren trykker på pandaen, gemmer `selectedAnimal` pandaen.

Med andre ord registrerer `selectedAnimal`, hvilket dyr brugeren netop har trykket på.

## Vis et Sheet-view

Nu kan vi bruge knappen til at registrere det “aktuelt trykkede dyr”.

Dernæst skal vi implementere et præsenteret view, der viser dyrets detaljer.

![view](../../../Resource/029_view2.png)

I SwiftUI kan vi bruge `Sheet` til at implementere denne præsentationseffekt.

Et `Sheet` kan forstås som en midlertidigt præsenteret side. Den vises oven på den aktuelle side, og når brugeren er færdig med at se indholdet, kan den lukkes ved at swipe ned.

## Sheet-eksempel

Før vi viser dyredetaljerne, bruger vi et enkelt eksempel til at forstå, hvordan et `Sheet` præsenteres.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Vis Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet-view")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/029_view3.png)

I denne kode opretter vi en boolesk værdi:

```swift
@State private var showSheet = false
```

`showSheet` er som standard `false`, hvilket betyder, at `Sheet` ikke vises i begyndelsen.

Når der trykkes på knappen:

```swift
showSheet.toggle()
```

`toggle()` betyder at skifte den booleske værdi.

Hvis den oprindeligt var `false`, bliver den `true` efter kaldet til `toggle()`.

Hvis den oprindeligt var `true`, bliver den `false` efter kaldet til `toggle()`.

Efter et tryk på knappen ændres `showSheet` altså fra `false` til `true`.

Når `showSheet` bliver `true`, præsenterer følgende kode `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Denne kode betyder: Når `showSheet` er `true`, præsenteres et `Sheet`, og `Text("Sheet-view")` vises inde i `Sheet`.

Visningsresultat:

![view](../../../Resource/029_view4.png)

Denne skrivemåde er velegnet til at præsentere fast indhold.

For eksempel kan den efter et tryk på en knap præsentere en indstillingsside, en vejledningsside, en meddelelsesside osv.

### Hvor Sheet placeres

Selvom `Sheet` er et præsenteret view, skrives det i SwiftUI ikke direkte som et selvstændigt view på samme måde som `Text()` eller `Image()`. Det bruges i stedet som en view modifier.

Det vil sige, at `.sheet(...)` minder om modifiers som `.font()`, `.padding()` og `.shadow()`. Den skal tilføjes efter et view.

For eksempel:

```swift
Button("Vis Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

I dette eksempel tilføjes `.sheet` efter `Button`.

Når `showSheet` bliver `true`, præsenterer SwiftUI `Sheet` og viser indholdet inde i klammerne:

```swift
Text("Sheet-view")
```

I reel udvikling har en side dog ofte flere knapper, og normalt tilføjer vi ikke en `.sheet` til hver enkelt knap.

En mere almindelig fremgangsmåde er at tilføje `.sheet` efter det yderste view.

For eksempel:

```swift
VStack {
    Button("Vis Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

Knappen er ansvarlig for at ændre `showSheet`, mens det yderste view er ansvarligt for at præsentere `Sheet` afhængigt af, om `showSheet` er `true`.

## Bind Sheet til en optional-værdi

Den skrivemåde, vi lærte tidligere, var:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

Denne skrivemåde er velegnet til at styre visning og skjulning af en fast side.

Men i dyreleksikon-eksemplet skal vi ikke kun vide, “om `Sheet` skal præsenteres”, men også “hvilket dyr der blev trykket på”.

For eksempel:

Hvis brugeren trykker på delfinen, skal `Sheet` vise delfinens detaljer.

Hvis brugeren trykker på pandaen, skal `Sheet` vise pandaens detaljer.

Derfor er en anden Sheet-skrivemåde mere velegnet her:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Indhold, der vises i Sheet
}
```

I denne kode bindes `Sheet` til optional-værdien `selectedAnimal`.

Bemærk, at vi efter `item:` skriver `$selectedAnimal`, ikke `selectedAnimal`.

Det skyldes, at `Sheet` ikke kun læser værdien af `selectedAnimal`; den skal også afgøre, om den skal præsenteres ud fra værdien og dens ændringer.

Du kan forstå denne kode på denne måde:

- Når `selectedAnimal` er `nil`, vises `Sheet` ikke.
- Når `selectedAnimal` har en værdi, vises `Sheet`.
- Når `Sheet` lukkes, ændrer SwiftUI `selectedAnimal` tilbage til `nil`.

SwiftUI sender det dyr, der er gemt i `selectedAnimal`, til `animal` inde i klammerne.

Med andre ord styrer `.sheet(item:)` ikke kun præsentationen, men sender også de valgte data ind i `Sheet`.

## Brug Sheet til at vise dyrets navn

Nu skal vi ikke skynde os med at oprette et komplekst detalje-view endnu.

For at gøre koden lettere at forstå viser vi først det aktuelle dyrs navn i `Sheet`.

Tilføj `.sheet(item:)` uden for `VStack`:

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

Den vigtigste del her er denne kode:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Når `selectedAnimal` har en værdi, præsenteres `Sheet`.

`animal` inde i klammerne er det aktuelt valgte dyr.

Derfor:

```swift
Text(animal.name)
```

Dette viser navnet på det dyr, der netop er trykket på.

Tryk for eksempel på `Delfin`, og Sheet viser `Delfin`.

Tryk på `Panda`, og `Sheet` viser `Panda`.

På denne måde har vi implementeret effekten, hvor tryk på forskellige dyr præsenterer forskellige dyrenavne.

Vis dyrets navn:

![view](../../../Resource/029_view5.png)

Dyredetaljer bør dog ikke kun vise et navn. De bør også vise navn, udbredelsesområde, levested og beskrivelse.

Hvis vi skriver al denne kode inde i `.sheet`, bliver koden meget lang og svær at læse.

Derfor opretter vi nu et nyt brugerdefineret view, der specifikt er ansvarligt for at vise dyredetaljer.

## Opret dyrets detalje-view

Dernæst opretter vi et nyt brugerdefineret view med navnet `AnimalDetailView`.

Dette view modtager en `Animal` og viser dyrets detaljer.

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
                    Text("**Udbredelsesområde**: \(animal.distributionArea)")

                    Divider()

                    Text("**Levested**: \(animal.habitat)")

                    Divider()

                    Text("**Dyrebeskrivelse**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Visningsresultat:

![view](../../../Resource/029_view2.png)

Det vigtigste her er:

```swift
var animal: Animal
```

Det betyder, at `AnimalDetailView` skal modtage et dyr udefra.

Efter at have modtaget dyret kan detalje-viewet bruge dyrets forskellige oplysninger:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Med andre ord er `AnimalDetailView` kun ansvarlig for at vise det dyr, der sendes ind i viewet.

### Fed tekst med Markdown

I detalje-viewet skrev vi kode som denne:

```swift
Text("**Levested:** \(animal.habitat)")
```

Her er der to punkter, der skal forstås.

For det første bruger `**Levested:**` `Markdown`-syntaks. Tekst omgivet af to stjerner vises med fed skrift.

For det andet er `\()` strenginterpolation, som kan vise værdien af en variabel inde i tekst.

Denne kode viser først det fede `Levested:` og viser derefter dyrets levested.

## Vis detalje-viewet i Sheet

Efter at have oprettet `AnimalDetailView` kan vi vende tilbage til `ContentView` og erstatte det oprindelige navne-view i `Sheet` med detalje-viewet.

Oprindeligt var det:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nu ændrer vi det til:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Her er `animal:` parameternavnet i `AnimalDetailView`.

`animal` efter det er det aktuelle dyr, som `.sheet(item:)` sender ind.

Det vil sige, at vi sender det dyr, der netop er trykket på, til `AnimalDetailView` for at vise det.

Komplet struktur:

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

Når brugeren trykker på et dyr:

```swift
selectedAnimal = animal
```

`selectedAnimal` ændres fra `nil` til et konkret dyr. Når `Sheet` registrerer, at `selectedAnimal` har en værdi, præsenterer det viewet.

`Sheet` sender dyret i `selectedAnimal` til `AnimalDetailView`, og `AnimalDetailView` viser dyrets detaljer.

På denne måde har vi implementeret funktionen, hvor et tryk på dyrelisten præsenterer de tilsvarende dyredetaljer.

## Forskellen mellem de to Sheet-skrivemåder

Nu har vi brugt `.sheet(item:)` til at færdiggøre visningen af dyrets detalje-view.

Her kan vi kort opsummere de to almindelige skrivemåder for `Sheet`.

### Den første skrivemåde er at binde en boolesk værdi

```swift
@State private var showSheet = false

Button("Vis Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-view")
}
```

Denne skrivemåde er velegnet til at præsentere fast indhold, for eksempel en indstillingsside, en vejledningsside, en meddelelsesside osv.

`showSheet` er en boolesk værdi med kun to tilstande: `true` og `false`.

Når `showSheet` er `true`, vises `Sheet`.

Når `showSheet` er `false`, vises `Sheet` ikke.

### Den anden skrivemåde er at binde en optional-værdi

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Denne skrivemåde er velegnet til at præsentere forskelligt indhold baseret på de valgte data.

I denne lektion trykker vi på forskellige dyr og skal vise forskellige dyredetaljer, så det er mere velegnet at bruge `.sheet(item:)`.

## Komplet kode

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Dyrets navn
    let name: String
    
    // Dyrets billede
    let imageName: String
    
    // Dyrets emoji
    let avatarEmoji: String
    
    // Udbredelsesområde
    let distributionArea: String
    
    // Levested
    let habitat: String
    
    // Dyrebeskrivelse
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererede have rundt om i verden.",
            habitat: "Have, kystvande og nogle store floder.",
            animalDescription: "Delfiner er intelligente havpattedyr. De lever i grupper, kommunikerer med lyde og er kendt for deres legesyge adfærd."
        ),
        // Giraf
        Animal(
            name: "Giraf",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner og åbne skovområder i Afrika.",
            habitat: "Græsarealer, savanner og åbne skove.",
            animalDescription: "Giraffer er de højeste landdyr. De har lange halse, lange ben og spiser normalt blade fra høje træer."
        ),
        // Løve
        Animal(
            name: "Løve",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Findes hovedsageligt i Afrika syd for Sahara, med en lille bestand i det vestlige Indien.",
            habitat: "Græsarealer, savanner og åbne skovområder.",
            animalDescription: "Løver er kraftige store kattedyr. De lever normalt i grupper, der kaldes flokke, og omtales ofte som dyreverdenens konger."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bjergskove i det centrale Kina.",
            habitat: "Bambusskove i kølige og fugtige bjergområder.",
            animalDescription: "Pandaer er bjørne, der er kendt for deres sort-hvide pels. De spiser hovedsageligt bambus og er blandt verdens mest genkendelige dyr."
        ),
        // Isbjørn
        Animal(
            name: "Isbjørn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiske områder omkring Nordpolen.",
            habitat: "Havis, kystområder og kolde arktiske miljøer.",
            animalDescription: "Isbjørne er store bjørne, der er tilpasset kolde miljøer. De er stærke svømmere og er hovedsageligt afhængige af havis for at jage sæler."
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
                    Text("**Udbredelsesområde**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Levested**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Dyrebeskrivelse**: \(animal.animalDescription)")
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

## Opsummering

I denne lektion færdiggjorde vi en enkel dyreleksikon-side.

Vi brugte først `Animal`-strukturen til at gemme dyreoplysninger, derefter brugte vi et array til at gemme fem dyr, og til sidst brugte vi `ForEach` til at vise dyrelisten.

Når brugeren trykker på et dyr, gemmer vi dette dyr i `selectedAnimal`:

```swift
selectedAnimal = animal
```

Når `selectedAnimal` har en værdi, præsenterer `.sheet(item:)` detalje-viewet og sender det valgte dyr til `AnimalDetailView`.

Det vigtigste i denne lektion er ikke grænsefladens stil, men at forstå denne dataoverførselsrute:

```swift
Tryk på dyr → selectedAnimal gemmer dyret → Sheet vises → AnimalDetailView viser detaljer
```

Når du har forstået denne rute, kan du senere lave flere lignende funktioner, for eksempel produktdetaljer, kursusdetaljer, artikeldetaljer, kontaktdetaljer osv.
