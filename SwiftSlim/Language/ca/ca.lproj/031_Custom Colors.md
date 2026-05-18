# Colors personalitzats

En aquesta lliçó, aprendrem com personalitzar colors a SwiftUI.

En les lliçons anteriors, ja hem utilitzat els colors predeterminats que ofereix SwiftUI, per exemple:

```swift
Color.blue
Color.red
Color.green
```

Aquests colors són molt còmodes d'utilitzar, però en el desenvolupament real d'una app, els colors predeterminats sovint no són prou precisos.

Per exemple, en un disseny es poden utilitzar colors com aquests:

```text
#2c54c2
#4875ed
#213e8d
```

Aquest tipus de color s'anomena color Hex.

En aquesta lliçó, primer farem que SwiftUI admeti colors Hex, i després utilitzarem `static` per organitzar els colors d'ús freqüent.

Finalment, aplicarem els colors personalitzats a la vista de l'enciclopèdia d'animals i farem servir un fons degradat per donar més profunditat als botons.

## Per què necessitem colors personalitzats?

A SwiftUI, podem utilitzar directament els colors del sistema.

Per exemple:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Aquí, `.blue` representa el color blau. En realitat, és una forma abreujada de `Color.blue`.

L'avantatge dels colors predeterminats és que són simples i còmodes, però les opcions de color són relativament limitades.

Per exemple:

```swift
Color.blue
```

Només pot representar el blau predeterminat que proporciona SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Però en el desenvolupament real, sovint necessitem colors més concrets.

Per exemple, encara que tots siguin blaus, poden tenir efectes diferents, com blau clar, blau fosc, blau grisós o blau viu.

![More Blue](../../../Resource/031_color5.png)

En aquest cas, si només utilitzem `Color.blue`, és difícil reproduir l'efecte del disseny.

Per això, necessitem que SwiftUI admeti colors personalitzats.

## Què és un color Hex?

Els colors de la pantalla solen estar formats per tres canals: vermell, verd i blau, és a dir, RGB.

RGB significa respectivament:

```text
Red     // Vermell
Green   // Verd
Blue    // Blau
```

Un color Hex és una manera de representar un color RGB.

Per exemple:

```swift
#5479FF
```

Aquest valor de color es pot entendre de manera simple com tres parts:

```text
54  // Representa el canal vermell
79  // Representa el canal verd
FF  // Representa el canal blau
```

En aquesta lliçó, no cal calcular aquests valors ni entendre a fons les regles hexadecimals.

Ara només cal saber que `#5479FF` representa un color concret.

Més endavant, quan vegem formes com `#2c54c2` o `#4875ed`, les podrem entendre primer com un valor de color.

En eines de disseny com Sketch, Figma o Photoshop, també és habitual veure valors de color semblants.

![color](../../../Resource/031_color.png)

Tanmateix, SwiftUI no permet escriure directament això de manera predeterminada:

```swift
Color(hex: "#5479FF")
```

Per això, hem d'ampliar nosaltres mateixos el tipus `Color` perquè admeti crear colors a partir d'una cadena Hex.

## Crear el fitxer Color+Hex.swift

Primer, creem un nou fitxer Swift.

El nom del fitxer pot ser:

```text
Color.swift
```

També pot ser un nom més clar:

```text
Color+Hex.swift
```

Aquí és més recomanable utilitzar:

```text
Color+Hex.swift
```

En un projecte Swift, noms de fitxer com `Color+Hex.swift` són molt habituals.

Indica que aquest fitxer és un fitxer d'extensió que afegeix capacitat Hex a `Color`.

El nom del fitxer no afecta directament l'execució del codi; només ens ajuda a entendre més fàcilment la finalitat del fitxer.

## Afegir el codi Color(hex:)

Al fitxer `Color+Hex.swift`, escriu el codi següent:

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

Aquest codi utilitza `extension` per ampliar el tipus `Color` i afegeix un nou mètode d'inicialització a `Color`:

```swift
init(hex: String)
```

Després de tenir aquest mètode d'inicialització, podem passar una cadena Hex a `Color` per crear un color personalitzat:

```swift
Color(hex: "#5479FF")
```

Dins d'aquesta extensió, el codi converteix la cadena Hex en un color RGB que SwiftUI pot reconèixer.

En aquesta etapa, no cal entendre a fons la lògica de conversió de cada línia. Només cal saber que el mètode `Color(hex:)` que hem afegit ens permet crear colors personalitzats mitjançant valors Hex.

## Utilitzar colors personalitzats

Ara podem provar els colors personalitzats a `ContentView`.

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

Efecte visual:

![color](../../../Resource/031_color1.png)

En aquest exemple, la primera línia utilitza un color del sistema:

```swift
.foregroundStyle(Color.blue)
```

Les tres línies següents utilitzen colors Hex personalitzats:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

En comparar-los, podem veure que el blau del sistema només té un efecte predeterminat.

En canvi, els colors Hex poden representar variacions de blau més detallades.

Aquest és el valor dels colors personalitzats: poden fer que els colors de la interfície s'acostin més al disseny real i també ens faciliten controlar l'estil visual de l'app.

## Utilitzar static per organitzar colors

Ara ja podem crear colors mitjançant cadenes Hex:

```swift
Color(hex: "#2c54c2")
```

Aquesta forma d'escriptura funciona correctament, però si el mateix color apareix repetidament en diversos llocs, el manteniment posterior no és gaire còmode.

Si hem escrit aquest valor de color en 10 llocs i més endavant volem modificar aquest blau, haurem de canviar-lo un per un.

En aquest moment, podem utilitzar `static` per organitzar de manera unificada els colors d'ús freqüent.

A la part inferior del fitxer `Color+Hex.swift`, continua afegint el codi següent:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aquí hem afegit tres propietats estàtiques a `Color`: `animalBlue`, `animalLightBlue` i `animalDarkBlue`. Representen diferents tons de blau.

Com que aquestes propietats utilitzen `static`, pertanyen al mateix tipus `Color`.

Quan les utilitzem, podem accedir-hi directament mitjançant `Color.`:

```swift
Color.animalBlue
```

Aquesta forma d'escriptura és més clara que escriure directament una cadena Hex.

Quan veiem `Color.animalBlue`, podem saber que representa el blau utilitzat a l'enciclopèdia d'animals.

En canvi, quan veiem `Color(hex: "#2c54c2")`, només sabem que és un valor de color, però no és fàcil saber-ne l'ús concret.

Gestionar els colors de manera unificada també té un altre avantatge: és més fàcil modificar-los més endavant.

Si volem ajustar el color principal de l'enciclopèdia d'animals, només cal modificar-ne el lloc de definició:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Tots els llocs que utilitzin aquest color s'actualitzaran alhora.

Aquest és el sentit d'utilitzar `static` per organitzar colors: fa que els noms dels colors siguin més clars i que el manteniment posterior sigui més còmode.

## Aplicar-ho a l'enciclopèdia d'animals

Ara podem aplicar els colors personalitzats a la vista anterior de l'enciclopèdia d'animals.

Abans, el fons dels botons d'animals era blanc:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Ara el podem canviar per un color personalitzat:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Aquí, `Color.animalBlue` és el color estàtic que acabem de definir a `Color+Hex.swift`.

El text del botó utilitza blanc:

```swift
.foregroundStyle(Color.white)
```

El fons de l'emoji de l'animal utilitza blanc semitransparent:

```swift
.background(Color.white.opacity(0.15))
```

Així, el botó forma un estil visual blau unificat.

El punt principal d'aquest pas no és afegir codi complex, sinó aplicar realment a la interfície els colors personalitzats que hem après abans.

## Utilitzar un fons degradat

A més d'utilitzar un sol color, també podem combinar diversos colors per crear un efecte degradat.

Per exemple, abans hem definit aquests colors:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aquests colors no només es poden utilitzar per separat, sinó que també es poden combinar en un fons degradat.

A SwiftUI, podem utilitzar `LinearGradient` per crear un degradat lineal.

Per exemple:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Aquest codi crea un fons degradat d'esquerra a dreta, en què el color passa gradualment de `Color.animalBlue` a `Color.animalLightBlue`.

Entre aquests paràmetres, `colors` s'utilitza per definir els colors que participen en el degradat, i `startPoint` i `endPoint` s'utilitzen per controlar la direcció del degradat.

### Provar l'efecte degradat

Podem utilitzar un `Text` senzill per provar el fons degradat.

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

Efecte visual:

![color](../../../Resource/031_color3.png)

En aquest exemple, el fons de `Text` ja no és un sol color, sinó un color degradat que canvia gradualment d'esquerra a dreta.

En comparació amb un fons normal, un fons degradat té més profunditat i també facilita crear un punt visual destacat a la interfície.

## Utilitzar un fons degradat a l'enciclopèdia d'animals

Ara podem canviar el color de fons del botó d'animal:

```swift
.background(Color.animalBlue)
```

per un fons degradat:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

El codi complet és el següent:

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

Efecte visual:

![color](../../../Resource/031_color4.png)

Ara, el botó d'animal ja no és només un fons d'un sol color, sinó que té un efecte degradat d'esquerra a dreta.

En comparació amb un fons d'un sol color, el fons degradat pot fer que la interfície sembli més rica i també més propera al disseny visual d'una app real.

## Diferència entre fons d'un sol color i fons degradat

Un fons d'un sol color només utilitza un color.

Per exemple:

```swift
.background(Color.animalBlue)
```

Aquesta forma d'escriptura és simple i clara, i és adequada per a la majoria d'interfícies bàsiques.

Un fons degradat utilitza diversos colors.

Per exemple:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Aquesta forma d'escriptura pot donar més profunditat a la interfície, però també pot augmentar més fàcilment la complexitat visual.

Per tant, en el desenvolupament real, ho podem entendre així:

Els fons d'un sol color són adequats per a text normal, botons normals, targetes normals i fons de pàgina normals.

Els fons degradats són adequats per a botons destacats, zones superiors, targetes de portada, entrades de funcions i altres posicions que necessiten èmfasi.

## Resum

En aquesta lliçó, hem après com utilitzar colors personalitzats a SwiftUI.

Primer, hem entès els colors Hex.

Per exemple:

```text
#2c54c2
```

Representa un color concret.

Després, hem utilitzat `extension Color` per ampliar el tipus `Color`.

Això permet que SwiftUI creï colors d'aquesta manera:

```swift
Color(hex: "#2c54c2")
```

Tot seguit, hem utilitzat `static` per organitzar els colors d'ús freqüent:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Així, en altres vistes podem utilitzar directament:

```swift
Color.animalBlue
```

En comparació amb escriure cada vegada la cadena Hex, aquesta manera és més clara i també facilita modificar els colors de manera unificada més endavant.

Finalment, hem après `LinearGradient` i hem combinat colors personalitzats en un fons degradat:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Amb aquesta lliçó, hem completat el procés que va de “crear colors personalitzats” a “utilitzar colors en una interfície real”.

Més endavant, quan un color s'hagi d'utilitzar repetidament en diversos llocs, podem considerar primer organitzar-lo dins d'una extensió de `Color`.

Així el codi serà més clar i l'estil de la interfície també serà més fàcil d'unificar.
