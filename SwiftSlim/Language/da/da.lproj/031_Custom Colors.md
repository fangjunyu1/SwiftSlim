# Brugerdefinerede farver

I denne lektion lærer vi, hvordan man bruger brugerdefinerede farver i SwiftUI.

I de tidligere lektioner har vi allerede brugt de standardfarver, som SwiftUI tilbyder, for eksempel:

```swift
Color.blue
Color.red
Color.green
```

Disse farver er meget nemme at bruge, men i rigtig appudvikling er standardfarver ofte ikke præcise nok.

For eksempel kan et design bruge farver som disse:

```text
#2c54c2
#4875ed
#213e8d
```

Denne type farve kaldes en Hex-farve.

I denne lektion vil vi først få SwiftUI til at understøtte Hex-farver og derefter bruge `static` til at organisere ofte brugte farver.

Til sidst anvender vi de brugerdefinerede farver i visningen for dyreleksikonet og bruger derudover en gradientbaggrund, så knappen får mere dybde.

## Hvorfor har vi brug for brugerdefinerede farver?

I SwiftUI kan vi bruge systemfarver direkte.

For eksempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Her betyder `.blue` blå. Det er faktisk en forkortet skrivemåde for `Color.blue`.

Fordelen ved standardfarver er, at de er enkle og praktiske, men udvalget af farver er relativt begrænset.

For eksempel:

```swift
Color.blue
```

kan kun repræsentere den standardblå farve, som SwiftUI tilbyder.

![Color.blue](../../../Resource/031_color6.png)

Men i faktisk udvikling har vi ofte brug for mere specifikke farver.

For eksempel kan den samme blå farve have forskellige udtryk som lyseblå, mørkeblå, gråblå eller klar blå.

![More Blue](../../../Resource/031_color5.png)

Hvis vi kun bruger `Color.blue`, er det derfor svært at genskabe designets udtryk.

Derfor skal vi få SwiftUI til at understøtte brugerdefinerede farver.

## Hvad er en Hex-farve?

Farver på en skærm består normalt af tre kanaler: rød, grøn og blå, altså RGB.

RGB står for:

```text
Red     // Rød
Green   // Grøn
Blue    // Blå
```

En Hex-farve er en måde at angive en RGB-farve på.

For eksempel:

```swift
#5479FF
```

Denne farveværdi kan enkelt forstås som tre dele:

```text
54  // Angiver den røde kanal
79  // Angiver den grønne kanal
FF  // Angiver den blå kanal
```

I denne lektion behøver vi ikke beregne disse værdier, og vi behøver heller ikke gå dybt ind i reglerne for hexadecimal notation.

Lige nu skal du kun vide, at `#5479FF` repræsenterer en bestemt farve.

Når vi senere ser skrivemåder som `#2c54c2` og `#4875ed`, kan vi først forstå dem som farveværdier.

I designværktøjer som Sketch, Figma og Photoshop ser man også ofte lignende farveværdier.

![color](../../../Resource/031_color.png)

Men SwiftUI understøtter som standard ikke direkte denne skrivemåde:

```swift
Color(hex: "#5479FF")
```

Derfor skal vi selv udvide typen `Color`, så den understøtter oprettelse af farver via en Hex-streng.

## Opret filen Color+Hex.swift

Først opretter vi en ny Swift-fil.

Filnavnet kan skrives som:

```text
Color.swift
```

Det kan også skrives mere tydeligt som:

```text
Color+Hex.swift
```

Her anbefales det mere at bruge:

```text
Color+Hex.swift
```

I Swift-projekter er filnavne som `Color+Hex.swift` meget almindelige.

Det betyder, at denne fil er en udvidelsesfil, som tilføjer Hex-funktionalitet til `Color`.

Filnavnet påvirker ikke direkte, hvordan koden kører. Det gør det bare lettere for os at forstå, hvad filen bruges til.

## Tilføj koden Color(hex:)

Skriv følgende kode i filen `Color+Hex.swift`:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Denne kode bruger `extension` til at udvide typen `Color` og tilføjer en ny initialiseringsmetode til `Color`:

```swift
init(hex: String)
```

Når vi har denne initialiseringsmetode, kan vi sende en Hex-streng til `Color` og dermed oprette en brugerdefineret farve:

```swift
Color(hex: "#5479FF")
```

Internt konverterer denne udvidelseskode Hex-strengen til en RGB-farve, som SwiftUI kan genkende.

På dette trin behøver du ikke forstå hver linje i konverteringslogikken i dybden. Du skal kun vide, at den tilføjede metode `Color(hex:)` gør det muligt at oprette brugerdefinerede farver ud fra Hex-farveværdier.

## Brug brugerdefinerede farver

Nu kan vi teste de brugerdefinerede farver i `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Visningseffekt:

![color](../../../Resource/031_color1.png)

I dette eksempel bruger den første linje en systemfarve:

```swift
.foregroundStyle(Color.blue)
```

De næste tre linjer bruger brugerdefinerede Hex-farver:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Ved at sammenligne dem kan vi se, at systemets blå farve kun har én standardeffekt.

Hex-farver kan derimod udtrykke mere nuancerede variationer af blå.

Det er værdien ved brugerdefinerede farver: de kan få grænsefladens farver tættere på det faktiske design og gøre det lettere for os at styre appens visuelle stil.

## Brug static til at organisere farver

Nu kan vi allerede oprette farver via Hex-strenge:

```swift
Color(hex: "#2c54c2")
```

Denne skrivemåde fungerer fint, men hvis den samme farve bruges flere steder, bliver vedligeholdelse senere mindre praktisk.

Hvis denne farveværdi er skrevet 10 forskellige steder, skal vi ændre den ét sted ad gangen, hvis vi senere vil justere den blå farve.

På dette tidspunkt kan vi bruge `static` til at samle ofte brugte farver ét sted.

Tilføj fortsat følgende kode nederst i filen `Color+Hex.swift`:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Her har vi tilføjet tre statiske egenskaber til `Color`: `animalBlue`, `animalLightBlue` og `animalDarkBlue`. De repræsenterer blå farver med forskellig lysstyrke og dybde.

Fordi disse egenskaber bruger `static`, tilhører de selve typen `Color`.

Når vi bruger dem, kan vi få direkte adgang via `Color.`:

```swift
Color.animalBlue
```

Denne skrivemåde er tydeligere end at skrive Hex-strengen direkte.

Når vi ser `Color.animalBlue`, kan vi forstå, at den repræsenterer den blå farve, der bruges i dyreleksikonet.

Men når vi ser `Color(hex: "#2c54c2")`, kan vi kun se, at det er en farveværdi. Det er ikke let at se dens konkrete anvendelse.

Samlet administration af farver har også en anden fordel: senere ændringer bliver mere praktiske.

Hvis vi vil justere hovedfarven i dyreleksikonet, skal vi kun ændre definitionsstedet:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Alle steder, hvor denne farve bruges, bliver opdateret samtidig.

Det er formålet med at bruge `static` til at organisere farver: farvenavnene bliver tydeligere, og senere vedligeholdelse bliver lettere.

## Anvendelse i dyreleksikonet

Nu kan vi anvende de brugerdefinerede farver i den tidligere visning for dyreleksikonet.

Tidligere var dyreknappens baggrund hvid:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nu kan vi ændre den til en brugerdefineret farve:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Her er `Color.animalBlue` den statiske farve, vi lige har defineret i `Color+Hex.swift`.

Knappens tekst bruger hvid:

```swift
.foregroundStyle(Color.white)
```

Dyre-emojien bruger en halvgennemsigtig hvid baggrund:

```swift
.background(Color.white.opacity(0.15))
```

På den måde får knappen en samlet blå visuel stil.

Fokus i dette trin er ikke at tilføje kompleks kode, men at anvende de brugerdefinerede farver, vi netop har lært, i den faktiske grænseflade.

## Brug gradientbaggrund

Ud over at bruge én enkelt farve kan vi også kombinere flere farver til en gradienteffekt.

For eksempel definerede vi tidligere disse farver:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Disse farver kan ikke kun bruges enkeltvis, men også kombineres til en gradientbaggrund.

I SwiftUI kan vi bruge `LinearGradient` til at oprette en lineær gradient.

For eksempel:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Denne kode opretter en gradientbaggrund fra venstre mod højre, hvor farven gradvist går fra `Color.animalBlue` til `Color.animalLightBlue`.

Her bruges `colors` til at angive de farver, der deltager i gradienten, mens `startPoint` og `endPoint` bruges til at styre gradientens retning.

### Test gradienteffekten

Vi kan bruge en simpel Text til at teste gradientbaggrunden.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Visningseffekt:

![color](../../../Resource/031_color3.png)

I dette eksempel er `Text`-visningens baggrund ikke længere en enkelt farve, men en gradvis farveovergang fra venstre mod højre.

Sammenlignet med en almindelig baggrundsfarve giver en gradientbaggrund mere dybde og gør det lettere at skabe et visuelt fokus i grænsefladen.

## Brug gradientbaggrund i dyreleksikonet

Nu kan vi ændre dyreknappens baggrundsfarve:

```swift
.background(Color.animalBlue)
```

til en gradientbaggrund:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Den komplette kode er som følger:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
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
```

Visningseffekt:

![color](../../../Resource/031_color4.png)

Nu er dyreknappen ikke længere kun en ensfarvet baggrund, men har en gradienteffekt fra venstre mod højre.

Sammenlignet med en ensfarvet baggrund kan en gradientbaggrund få grænsefladen til at se mere lagdelt ud og komme tættere på det visuelle design i en rigtig app.

## Forskellen mellem ensfarvet baggrund og gradientbaggrund

En ensfarvet baggrund bruger kun én farve.

For eksempel:

```swift
.background(Color.animalBlue)
```

Denne skrivemåde er enkel og tydelig og passer til de fleste grundlæggende grænseflader.

En gradientbaggrund bruger flere farver.

For eksempel:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Denne skrivemåde kan give grænsefladen mere dybde, men den kan også lettere øge den visuelle kompleksitet.

I faktisk udvikling kan vi derfor forstå det sådan:

Ensfarvet baggrund passer til almindelig tekst, almindelige knapper, almindelige kort og almindelige sidebaggrunde.

Gradientbaggrund passer til vigtige knapper, topområder, coverkort, funktionsindgange og andre steder, der skal fremhæves.

## Opsummering

I denne lektion lærte vi, hvordan man bruger brugerdefinerede farver i SwiftUI.

Først lærte vi om Hex-farver.

For eksempel:

```text
#2c54c2
```

Den repræsenterer en bestemt farve.

Derefter brugte vi `extension Color` til at udvide typen `Color`.

Det gør det muligt for SwiftUI at oprette farver på denne måde:

```swift
Color(hex: "#2c54c2")
```

Derefter brugte vi `static` til at organisere ofte brugte farver:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

På den måde kan vi i andre visninger bruge direkte:

```swift
Color.animalBlue
```

Sammenlignet med at skrive Hex-strengen hver gang er denne metode tydeligere og gør det lettere at ændre farver samlet senere.

Til sidst lærte vi `LinearGradient` og kombinerede brugerdefinerede farver til en gradientbaggrund:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Gennem denne lektion gennemførte vi hele processen fra “at oprette brugerdefinerede farver” til “at bruge farver i en rigtig grænseflade”.

Når en farve fremover skal bruges flere steder, kan du først overveje at organisere den i en `Color`-udvidelse.

På den måde bliver koden tydeligere, og grænsefladens stil bliver lettere at holde samlet.
