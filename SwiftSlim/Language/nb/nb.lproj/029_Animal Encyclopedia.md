# Dyrleksikon 

I denne leksjonen fortsetter vi å øve på egendefinerte visninger og dataoverføring.

Vi skal lage en enkel dyrleksikonvisning. Siden viser fem dyr. Når brukeren trykker på et dyr, åpnes en detaljvisning som viser dyrets bilde, utbredelsesområde, leveområde og beskrivelse.

Sluttresultat:

![view](../../../Resource/029_view.png)

Gjennom dette eksemplet kan vi øve på samspillet mellom datastrukturer, listevisning, trykkinteraksjon og Sheet-popupvisninger.

## Forbered bilderessurser

Først må vi forberede fem dyrebilder:

- Delfin: `dolphin.jpg`
- Sjiraff: `giraffe.jpg`
- Løve: `lion.jpg`
- Panda: `panda.jpg`
- Isbjørn: `polarBear.jpg`

Du kan bruke disse bilderessursene:

[Delfin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Sjiraff](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Løve](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Isbjørn](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Når bildene er lastet ned, drar du dem inn i ressursmappen `Assets` i Xcode-prosjektet.

![assets](../../../Resource/029_assets.png)

Merk at du vanligvis ikke trenger å skrive filendelsen `.jpg` når du bruker bilder i koden.

Hvis bilderessursen for eksempel heter `dolphin`, skriver du dette i koden:

```swift
Image("dolphin")
```

Hvis bildenavnet er skrevet feil, kan bildet ikke vises riktig.

Merk: Bilderessursene ovenfor kommer fra Wikimedia-prosjektet. Ved bruk anbefales det å beholde lenken til originalbildet og kildeinformasjonen.

## Opprett dyrestrukturen

På denne siden har hvert dyr flere opplysninger:

- Dyrets navn
- Dyrets bilde
- Dyrets emoji
- Utbredelsesområde
- Leveområde
- Dyrebeskrivelse

Hvis vi sprer disse opplysningene i mange variabler, blir koden ganske rotete. Derfor kan vi opprette en `Animal`-struktur og samle informasjonen om ett dyr på ett sted.

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

I denne koden:

- `id`: dyrets unike identifikator.
- `name`: dyrets navn.
- `imageName`: navnet på dyrets bilde.
- `avatarEmoji`: dyrets emoji.
- `distributionArea`: utbredelsesområde.
- `habitat`: leveområde.
- `animalDescription`: dyrebeskrivelse.

Her:

```swift
let id = UUID()
```

`id` brukes til å identifisere hvert enkelt dyr. Senere bruker vi `ForEach` til å vise dyrelisten, og vi bruker også `.sheet(item:)` til å åpne detaljer basert på det valgte dyret. Derfor må `Animal` følge protokollen `Identifiable`.

Rollen til `Identifiable` er å fortelle SwiftUI: hvert dyr har en `id` som kan skille det fra de andre.

## Opprett dyredata

Deretter oppretter vi en dyrearray i `ContentView`.

Arrayen lagrer fem `Animal`-verdier, og hver `Animal` representerer ett dyr.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfin
        Animal(
            name: "Delfin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Varme og tempererte hav over hele verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for lekende atferd."
        ),
        // Sjiraff
        Animal(
            name: "Sjiraff",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner og åpne skogområder i Afrika.",
            habitat: "Gressletter, savanner og åpne skoger.",
            animalDescription: "Sjiraffer er de høyeste landdyrene. De har lange halser, lange bein og spiser vanligvis blader fra høye trær."
        ),
        // Løve
        Animal(
            name: "Løve",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Finnes hovedsakelig i Afrika sør for Sahara, med en liten bestand i vestlige India.",
            habitat: "Gressletter, savanner og åpne skogområder.",
            animalDescription: "Løver er kraftige store kattedyr. De lever vanligvis i grupper som kalles flokker, og omtales ofte som kongene i dyreverdenen."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Fjellskoger i det sentrale Kina.",
            habitat: "Bambusskoger i kjølige og fuktige fjellområder.",
            animalDescription: "Pandaer er bjørner kjent for den svarte og hvite pelsen. De spiser hovedsakelig bambus og er blant verdens mest gjenkjennelige dyr."
        ),
        // Isbjørn
        Animal(
            name: "Isbjørn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiske områder rundt Nordpolen.",
            habitat: "Havis, kystområder og kalde arktiske miljøer.",
            animalDescription: "Isbjørner er store bjørner som er tilpasset kalde miljøer. De er sterke svømmere og er hovedsakelig avhengige av havis for å jakte på sel."
        )
    ]

    var body: some View {
        Text("Dyrleksikon")
    }
}
```

Her er `animals` en array:

```swift
let animals: [Animal]
```

`[Animal]` betyr at denne arrayen lagrer flere `Animal`-verdier.

Med andre ord er `animals` ikke ett dyr, men en gruppe dyr.

## Vis dyrelisten

Nå kan vi bruke `ForEach` til å vise dyrelisten.

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

Sluttresultat:

![view](../../../Resource/029_view1.png)

I denne koden:

```swift
ForEach(animals) { animal in
    ...
}
```

betyr det at vi går gjennom arrayen `animals`.

For hver runde i løkken representerer `animal` det dyret som vises akkurat nå.

For eksempel er `animal` en delfin i den første runden, og en sjiraff i den andre runden.

Derfor kan vi vise informasjonen til det aktuelle dyret på denne måten:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Slik kan de fem dyrene vises.

## Gjør dyrelisten trykkbar

Nå vises listen, men den kan ikke trykkes på ennå.

Hvis vi vil åpne detaljer etter at brukeren trykker på et dyr, må vi først registrere «det dyret som er valgt nå».

Derfor legger vi til en tilstandsvariabel i `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Her er `selectedAnimal` en valgfri type, `Animal?`.

Det betyr at den kan inneholde et dyr, eller at den ikke inneholder noe dyr.

Standardverdien er `nil`, som betyr at ingen dyr er valgt i starten.

Deretter endrer vi hver dyrerad til en `Button`:

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

Den viktigste kodelinjen er denne:

```swift
selectedAnimal = animal
```

Når brukeren trykker på et dyr, lagrer vi dette dyret i `selectedAnimal`.

Hvis brukeren for eksempel trykker på delfinen, er det delfinen som lagres i `selectedAnimal`.

Hvis brukeren trykker på pandaen, er det pandaen som lagres i `selectedAnimal`.

Med andre ord brukes `selectedAnimal` til å registrere hvilket dyr brukeren trykket på akkurat nå.

## Sheet-popupvisning

Nå kan vi allerede bruke knappen til å registrere «dyret som ble trykket på nå».

Deretter må vi lage en popupvisning som viser dyredetaljene.

![view](../../../Resource/029_view2.png)

I SwiftUI kan du bruke `Sheet` til å lage denne popup-effekten.

`Sheet` kan forstås som en midlertidig side som åpnes. Den vises over den nåværende siden, og brukeren kan sveipe ned for å lukke den etter å ha lest innholdet.

## Sheet-eksempel

Før vi virkelig viser dyredetaljene, bruker vi først et enkelt eksempel for å forstå hvordan `Sheet` åpnes.

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
            Text("Sheet-visning")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Sluttresultat:

![view](../../../Resource/029_view3.png)

I denne koden oppretter vi en boolsk verdi:

```swift
@State private var showSheet = false
```

`showSheet` er som standard `false`, som betyr at `Sheet` ikke vises i starten.

Når knappen trykkes:

```swift
showSheet.toggle()
```

`toggle()` betyr å bytte den boolske verdien.

Hvis verdien opprinnelig er `false`, blir den `true` etter at `toggle()` kalles.

Hvis verdien opprinnelig er `true`, blir den `false` etter at `toggle()` kalles.

Derfor endres `showSheet` fra `false` til `true` etter at knappen trykkes.

Når `showSheet` blir `true`, åpner denne koden et `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-visning")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Denne koden betyr: Når `showSheet` er `true`, åpnes et `Sheet`, og `Text("Sheet-visning")` vises i `Sheet`.

Sluttresultat:

![view](../../../Resource/029_view4.png)

Denne skrivemåten passer for å åpne fast innhold.

For eksempel kan du åpne en innstillingsside, en forklaringsside eller en tipside etter at en knapp trykkes.

### Plasseringen til Sheet

Selv om `Sheet` er en popupvisning, skrives den i SwiftUI ikke direkte som en selvstendig visning slik `Text()` og `Image()` gjør. Den brukes i stedet som en visningsmodifier.

Det vil si at `.sheet(...)`, på samme måte som `.font()`, `.padding()` og `.shadow()`, må legges til etter en bestemt visning.

For eksempel:

```swift
Button("Vis Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-visning")
}
```

I dette eksemplet er `.sheet` lagt til etter `Button`.

Når `showSheet` blir `true`, åpner SwiftUI et `Sheet` og viser innholdet i klammeparentesene:

```swift
Text("Sheet-visning")
```

I faktisk utvikling legger man likevel vanligvis ikke til en egen `.sheet` på hver knapp hvis en side har flere knapper.

En vanligere praksis er å legge `.sheet` til etter den ytre visningen.

For eksempel:

```swift
VStack {
    Button("Vis Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-visning")
}
```

Knappen er ansvarlig for å endre `showSheet`, og den ytre visningen er ansvarlig for å åpne `Sheet` basert på om `showSheet` er `true`.

## Sheet bundet til en valgfri verdi

Skrivemåten vi lærte tidligere er:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet-visning")
}
```

Denne skrivemåten passer for å kontrollere visning og skjuling av én fast side.

Men i dyrleksikon-eksemplet trenger vi ikke bare å vite «om `Sheet` skal åpnes», vi må også vite «hvilket dyr som ble trykket på».

For eksempel:

Hvis brukeren trykker på delfinen, bør `Sheet` vise delfindetaljene.

Hvis brukeren trykker på pandaen, bør `Sheet` vise pandadetaljene.

Derfor passer en annen Sheet-skrivemåte bedre her:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Innholdet som vises i Sheet
}
```

I denne koden er `Sheet` bundet til den valgfrie verdien `selectedAnimal`.

Merk at det som står etter `item:` er `$selectedAnimal`, ikke `selectedAnimal`.

Det er fordi `Sheet` ikke bare leser verdien til `selectedAnimal`, men også må bestemme om det skal åpnes basert på endringer i denne verdien.

Denne koden kan forstås slik:

- Når `selectedAnimal` er `nil`, vises ikke `Sheet`.
- Når `selectedAnimal` har en verdi, vises `Sheet`.
- Når `Sheet` lukkes, setter SwiftUI `selectedAnimal` tilbake til `nil`.

SwiftUI sender dyret som er lagret i `selectedAnimal`, inn til `animal` i klammeparentesene.

Det betyr at `.sheet(item:)` ikke bare kontrollerer popupvisningen, men også sender de valgte dataene inn i `Sheet`.

## Bruk Sheet til å vise dyrets navn

Nå haster vi ikke med å opprette en kompleks detaljvisning.

For å gjøre koden lettere å forstå viser vi først navnet på det aktuelle dyret i `Sheet`.

Legg til `.sheet(item:)` utenfor `VStack`:

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

Det viktigste her er denne koden:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Når `selectedAnimal` har en verdi, åpnes `Sheet`.

`animal` i klammeparentesene er det dyret som er valgt nå.

Derfor:

```swift
Text(animal.name)
```

viser navnet på dyret som ble trykket på.

Hvis brukeren for eksempel trykker på `Delfin`, vises `Delfin` i Sheet.

Hvis brukeren trykker på `Panda`, vises `Panda` i `Sheet`.

Slik har vi laget en effekt der ulike dyr åpner ulike dyrenavn.

Vis dyrets navn:

![view](../../../Resource/029_view5.png)

Dyredetaljene bør likevel ikke bare vise ett navn. De bør også vise navn, utbredelsesområde, leveområde og beskrivelse.

Hvis all denne koden skrives direkte i `.sheet`, blir koden veldig lang og vanskelig å lese.

Derfor oppretter vi nå en ny egendefinert visning som bare har ansvar for å vise dyredetaljene.

## Opprett dyredetaljvisningen

Deretter oppretter vi en ny egendefinert visning, `AnimalDetailView`.

Denne visningen mottar ett `Animal` og viser dyredetaljene.

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
                    Text("**Utbredelsesområde** ：\(animal.distributionArea)")

                    Divider()

                    Text("**Leveområde** ：\(animal.habitat)")

                    Divider()

                    Text("**Dyrebeskrivelse** ：\(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Sluttresultat:

![view](../../../Resource/029_view2.png)

Hovedpunktet her er:

```swift
var animal: Animal
```

Dette betyr at `AnimalDetailView` må motta ett dyr utenfra.

Etter at dyret er mottatt, kan detaljvisningen bruke de ulike opplysningene om dette dyret:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Med andre ord har `AnimalDetailView` bare ansvar for å vise dyret som sendes inn.

### Uthevet tekst med Markdown

I detaljvisningen skrev vi denne koden:

```swift
Text("**Leveområde:** \(animal.habitat)")
```

Her er det to kunnskapspunkter.

For det første bruker `**Leveområde:**` `Markdown`-syntaks. Tekst som omsluttes av to stjerner, vises med fet skrift.

For det andre er `\()` strenginterpolering. Den kan vise verdien til en variabel i teksten.

Denne koden betyr at den først viser `Leveområde:` med fet skrift, og deretter viser dyrets leveområde.

## Vis detaljvisningen i Sheet

Etter at `AnimalDetailView` er opprettet, kan vi gå tilbake til `ContentView` og erstatte navnevisningen som opprinnelig lå i `Sheet`, med detaljvisningen.

Opprinnelig var det:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nå endrer vi det til:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Her er `animal:` parameternavnet til `AnimalDetailView`.

Den siste `animal` er det aktuelle dyret som sendes inn fra `.sheet(item:)`.

Det vil si at vi sender dyret brukeren nettopp trykket på, til `AnimalDetailView` for visning.

Full struktur:

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

Når brukeren trykker på et dyr:

```swift
selectedAnimal = animal
```

endres `selectedAnimal` fra `nil` til et konkret dyr. Når `Sheet` oppdager at `selectedAnimal` har en verdi, åpnes visningen.

`Sheet` sender dyret i `selectedAnimal` til `AnimalDetailView`, og `AnimalDetailView` viser dyredetaljene.

Slik har vi implementert funksjonen der et trykk på et dyr i listen åpner den tilhørende dyredetaljen.

## Forskjellen mellom to Sheet-skrivemåter

Nå har vi allerede brukt `.sheet(item:)` til å fullføre visningen av dyredetaljene.

Her kan vi kort oppsummere to vanlige måter å skrive `Sheet` på.

### Den første er å binde en boolsk verdi

```swift
@State private var showSheet = false

Button("Vis Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet-visning")
}
```

Denne skrivemåten passer for å åpne fast innhold, for eksempel en innstillingsside, en forklaringsside eller en tipside.

`showSheet` er en boolsk verdi med bare to tilstander: `true` og `false`.

Når `showSheet` er `true`, vises `Sheet`.

Når `showSheet` er `false`, vises ikke `Sheet`.

### Den andre er å binde en valgfri verdi

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Denne skrivemåten passer for å åpne ulikt innhold basert på valgte data.

I denne leksjonen trykker vi på ulike dyr og må vise detaljer for ulike dyr. Derfor passer `.sheet(item:)` bedre.

## Fullstendig kode

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Dyrets navn
    let name: String
    
    // Dyrets bilde
    let imageName: String
    
    // Dyrets emoji
    let avatarEmoji: String
    
    // Utbredelsesområde
    let distributionArea: String
    
    // Leveområde
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
            distributionArea: "Varme og tempererte hav over hele verden.",
            habitat: "Hav, kystfarvann og noen store elver.",
            animalDescription: "Delfiner er intelligente sjøpattedyr. De lever i grupper, kommuniserer med lyder og er kjent for lekende atferd."
        ),
        // Sjiraff
        Animal(
            name: "Sjiraff",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanner og åpne skogområder i Afrika.",
            habitat: "Gressletter, savanner og åpne skoger.",
            animalDescription: "Sjiraffer er de høyeste landdyrene. De har lange halser, lange bein og spiser vanligvis blader fra høye trær."
        ),
        // Løve
        Animal(
            name: "Løve",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Finnes hovedsakelig i Afrika sør for Sahara, med en liten bestand i vestlige India.",
            habitat: "Gressletter, savanner og åpne skogområder.",
            animalDescription: "Løver er kraftige store kattedyr. De lever vanligvis i grupper som kalles flokker, og omtales ofte som kongene i dyreverdenen."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Fjellskoger i det sentrale Kina.",
            habitat: "Bambusskoger i kjølige og fuktige fjellområder.",
            animalDescription: "Pandaer er bjørner kjent for den svarte og hvite pelsen. De spiser hovedsakelig bambus og er blant verdens mest gjenkjennelige dyr."
        ),
        // Isbjørn
        Animal(
            name: "Isbjørn",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arktiske områder rundt Nordpolen.",
            habitat: "Havis, kystområder og kalde arktiske miljøer.",
            animalDescription: "Isbjørner er store bjørner som er tilpasset kalde miljøer. De er sterke svømmere og er hovedsakelig avhengige av havis for å jakte på sel."
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
                    Text("**Utbredelsesområde** ：\(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Leveområde** ：\(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Dyrebeskrivelse** ：\(animal.animalDescription)")
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

## Oppsummering

I denne leksjonen fullførte vi en enkel dyrleksikonside.

Vi brukte først `Animal`-strukturen til å lagre dyreinformasjon, deretter brukte vi en array til å lagre fem dyr, og til slutt brukte vi `ForEach` til å vise dyrelisten.

Når brukeren trykker på et dyr, lagrer vi dette dyret i `selectedAnimal`:

```swift
selectedAnimal = animal
```

Når `selectedAnimal` har en verdi, åpner `.sheet(item:)` detaljvisningen og sender det valgte dyret til `AnimalDetailView`.

Det viktigste i denne leksjonen er ikke grensesnittstilen, men å forstå denne dataoverføringsruten:

```swift
Trykk på dyr → selectedAnimal lagrer dyret → Sheet åpnes → AnimalDetailView viser detaljer
```

Når du har forstått denne ruten, kan du senere lage flere lignende funksjoner, for eksempel produktdetaljer, kursdetaljer, artikkeldetaljer og kontaktdetaljer.
