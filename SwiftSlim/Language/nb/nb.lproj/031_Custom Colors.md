# Egendefinerte farger

I denne leksjonen skal vi lære hvordan vi kan definere egne farger i SwiftUI.

I tidligere leksjoner har vi allerede brukt standardfargene som SwiftUI tilbyr, for eksempel:

```swift
Color.blue
Color.red
Color.green
```

Disse fargene er praktiske å bruke, men i ekte apputvikling er standardfarger ofte ikke presise nok.

For eksempel kan en designskisse bruke farger som disse:

```text
#2c54c2
#4875ed
#213e8d
```

Denne typen farge kalles en Hex-farge.

I denne leksjonen skal vi først gjøre at SwiftUI støtter Hex-farger, og deretter bruke `static` til å organisere ofte brukte farger.

Til slutt skal vi bruke de egendefinerte fargene i dyreleksikon-visningen, og videre bruke en gradientbakgrunn for å få knappene til å se mer lagdelte ut.

## Hvorfor trenger vi egendefinerte farger?

I SwiftUI kan vi bruke systemfarger direkte.

For eksempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Her betyr `.blue` blå. Det er egentlig en forkortet skrivemåte for `Color.blue`.

Fordelen med standardfarger er at de er enkle og praktiske, men utvalget av farger er ganske begrenset.

For eksempel:

```swift
Color.blue
```

Dette kan bare representere standard blåfarge som SwiftUI tilbyr.

![Color.blue](../../../Resource/031_color6.png)

Men i faktisk utvikling trenger vi ofte mer spesifikke farger.

For eksempel kan samme blåfarge ha ulike uttrykk, som lyseblå, mørkeblå, gråblå og klar blå.

![More Blue](../../../Resource/031_color5.png)

Hvis vi da bare bruker `Color.blue`, blir det vanskelig å gjenskape designuttrykket.

Derfor må vi gjøre at SwiftUI støtter egendefinerte farger.

## Hva er en Hex-farge?

Farger på en skjerm består vanligvis av tre kanaler: rød, grønn og blå. Dette kalles RGB.

RGB står for:

```text
Red     // Rød
Green   // Grønn
Blue    // Blå
```

En Hex-farge er en måte å representere en RGB-farge på.

For eksempel:

```swift
#5479FF
```

Denne fargeverdien kan enkelt forstås som tre deler:

```text
54  // Representerer den røde kanalen
79  // Representerer den grønne kanalen
FF  // Representerer den blå kanalen
```

I denne leksjonen trenger vi ikke å beregne disse verdiene, og vi trenger heller ikke å forstå heksadesimale regler i dybden.

Akkurat nå trenger vi bare å vite at `#5479FF` representerer en konkret farge.

Senere, når vi ser skrivemåter som `#2c54c2` og `#4875ed`, kan vi først forstå dem som fargeverdier.

I designverktøy som Sketch, Figma og Photoshop kan vi også ofte se lignende fargeverdier.

![color](../../../Resource/031_color.png)

Men som standard støtter ikke SwiftUI å skrive dette direkte:

```swift
Color(hex: "#5479FF")
```

Derfor må vi selv utvide `Color`-typen slik at den støtter å opprette farger fra Hex-strenger.

## Opprett filen Color+Hex.swift

Først oppretter vi en ny Swift-fil.

Filnavnet kan være:

```text
Color.swift
```

Det kan også skrives tydeligere som:

```text
Color+Hex.swift
```

Her anbefales det mer å bruke:

```text
Color+Hex.swift
```

I Swift-prosjekter er filnavn som `Color+Hex.swift` svært vanlige.

Det betyr at denne filen er en utvidelsesfil som legger Hex-funksjonalitet til `Color`.

Filnavnet påvirker ikke kodekjøringen direkte. Det brukes bare for å gjøre det lettere å forstå hva filen er til.

## Legg til Color(hex:)-koden

I filen `Color+Hex.swift` skriver du følgende kode:

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

Denne koden bruker `extension` til å utvide `Color`-typen, og legger til en ny initialiseringsmetode for `Color`:

```swift
init(hex: String)
```

Når vi har denne initialiseringsmetoden, kan vi sende en Hex-streng til `Color` for å opprette en egendefinert farge:

```swift
Color(hex: "#5479FF")
```

Inne i denne utvidelseskoden blir Hex-strengen konvertert til en RGB-farge som SwiftUI kan forstå.

På dette stadiet trenger du ikke å forstå konverteringslogikken i hver linje i dybden. Du trenger bare å vite at den nye `Color(hex:)`-metoden lar oss opprette egendefinerte farger fra Hex-fargeverdier.

## Bruk egendefinerte farger

Nå kan vi teste egendefinerte farger i `ContentView`.

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

I dette eksemplet bruker den første linjen en systemfarge:

```swift
.foregroundStyle(Color.blue)
```

De neste tre linjene bruker egendefinerte Hex-farger:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Ved å sammenligne kan vi se at systemblå bare har én standardeffekt.

Hex-farger kan derimot representere mer detaljerte variasjoner av blått.

Dette er verdien av egendefinerte farger: De kan gjøre grensesnittfargene nærmere det faktiske designet, og de gjør det enklere for oss å kontrollere den visuelle stilen i en app.

## Bruk static til å organisere farger

Nå kan vi allerede opprette farger fra Hex-strenger:

```swift
Color(hex: "#2c54c2")
```

Denne skrivemåten fungerer normalt, men hvis samme farge brukes flere steder, blir senere vedlikehold mindre praktisk.

Hvis denne fargeverdien er skrevet på 10 ulike steder, må vi endre den ett sted av gangen når vi senere vil justere denne blåfargen.

Da kan vi bruke `static` til å organisere ofte brukte farger på ett sted.

Nederst i filen `Color+Hex.swift` fortsetter du med å legge til følgende kode:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Her har vi lagt til tre statiske egenskaper i `Color`: `animalBlue`, `animalLightBlue` og `animalDarkBlue`. De representerer ulike nyanser av blått.

Fordi disse egenskapene bruker `static`, tilhører de selve `Color`-typen.

Når vi bruker dem, kan vi få tilgang til dem direkte gjennom `Color.`:

```swift
Color.animalBlue
```

Denne skrivemåten er tydeligere enn å skrive en Hex-streng direkte.

Når vi ser `Color.animalBlue`, kan vi vite at den representerer blåfargen som brukes i dyreleksikonet.

Men når vi ser `Color(hex: "#2c54c2")`, kan vi bare vite at det er en fargeverdi, og det er ikke like lett å se det konkrete bruksområdet.

Å administrere farger på ett sted har også en annen fordel: senere endringer blir enklere.

Hvis vi vil justere hovedfargen i dyreleksikonet, trenger vi bare å endre definisjonsstedet:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Alle steder som bruker denne fargen, oppdateres samtidig.

Dette er poenget med å bruke `static` til å organisere farger: Fargenavnene blir tydeligere, og senere vedlikehold blir mer praktisk.

## Bruk det i dyreleksikonet

Nå kan vi bruke de egendefinerte fargene i den tidligere dyreleksikon-visningen.

Tidligere var bakgrunnen til dyreknappen hvit:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nå kan vi endre den til en egendefinert farge:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Her er `Color.animalBlue` den statiske fargen vi nettopp definerte i `Color+Hex.swift`.

Knappeteksten bruker hvitt:

```swift
.foregroundStyle(Color.white)
```

Bakgrunnen til dyre-emojien bruker halvgjennomsiktig hvitt:

```swift
.background(Color.white.opacity(0.15))
```

Slik får knappen en enhetlig blå visuell stil.

Fokuset i dette trinnet er ikke å legge til kompleks kode, men å virkelig bruke de egendefinerte fargene vi lærte tidligere, i grensesnittet.

## Bruk en gradientbakgrunn

I tillegg til å bruke én enkelt farge kan vi også kombinere flere farger til en gradienteffekt.

For eksempel definerte vi disse fargene tidligere:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Disse fargene kan ikke bare brukes hver for seg, men også kombineres til en gradientbakgrunn.

I SwiftUI kan vi bruke `LinearGradient` til å opprette en lineær gradient.

For eksempel:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Denne koden oppretter en gradientbakgrunn fra venstre mot høyre, der fargen gradvis går fra `Color.animalBlue` til `Color.animalLightBlue`.

Her brukes `colors` til å angi fargene som deltar i gradienten, mens `startPoint` og `endPoint` brukes til å kontrollere gradientretningen.

### Test gradienteffekten

Vi kan bruke en enkel Text til å teste gradientbakgrunnen.

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

I dette eksemplet er bakgrunnen til `Text` ikke lenger én enkelt farge. I stedet er den en gradientfarge som gradvis endrer seg fra venstre mot høyre.

Sammenlignet med en vanlig bakgrunnsfarge har en gradientbakgrunn mer dybde, og den kan lettere skape et visuelt fokus i grensesnittet.

## Bruk gradientbakgrunn i dyreleksikonet

Nå kan vi endre bakgrunnsfargen til dyreknappen:

```swift
.background(Color.animalBlue)
```

Til en gradientbakgrunn:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Den komplette koden er som følger:

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

Nå er dyreknappen ikke lenger bare én enkelt bakgrunnsfarge. I stedet har den en gradienteffekt fra venstre mot høyre.

Sammenlignet med en ensfarget bakgrunn kan en gradientbakgrunn få grensesnittet til å se mer lagdelt ut og ligge nærmere den visuelle designen i en ekte app.

## Forskjellen mellom ensfarget bakgrunn og gradientbakgrunn

En ensfarget bakgrunn bruker bare én farge.

For eksempel:

```swift
.background(Color.animalBlue)
```

Denne skrivemåten er enkel og tydelig, og den passer for de fleste grunnleggende grensesnitt.

En gradientbakgrunn bruker flere farger.

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

Denne skrivemåten kan gjøre grensesnittet mer lagdelt, men den kan også lettere øke den visuelle kompleksiteten.

Derfor kan vi forstå det slik i faktisk utvikling:

Ensfarget bakgrunn passer for vanlig tekst, vanlige knapper, vanlige kort og vanlige sidebakgrunner.

Gradientbakgrunn passer for viktige knapper, toppområder, omslagskort, funksjonsinnganger og andre steder som trenger vektlegging.

## Oppsummering

I denne leksjonen lærte vi hvordan vi bruker egendefinerte farger i SwiftUI.

Først lærte vi om Hex-farger.

For eksempel:

```text
#2c54c2
```

Den representerer en konkret farge.

Deretter brukte vi `extension Color` til å utvide `Color`-typen.

Dette gjør at SwiftUI kan opprette farger på følgende måte:

```swift
Color(hex: "#2c54c2")
```

Deretter brukte vi `static` til å organisere ofte brukte farger:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Slik kan vi bruke den direkte i andre visninger:

```swift
Color.animalBlue
```

Sammenlignet med å skrive Hex-strenger hver gang er denne metoden tydeligere, og den gjør det mer praktisk å endre farger samlet senere.

Til slutt lærte vi `LinearGradient`, og kombinerte egendefinerte farger til en gradientbakgrunn:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Gjennom denne leksjonen fullførte vi prosessen fra «å opprette egendefinerte farger» til «å bruke farger i et ekte grensesnitt».

Senere, når en farge må brukes flere steder, kan vi først vurdere å organisere den i en `Color`-utvidelse.

Dette gjør koden tydeligere og gjør det lettere å holde grensesnittstilen enhetlig.
