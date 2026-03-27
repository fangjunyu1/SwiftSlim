# Swift i SwiftUI

Quan s'aprèn desenvolupament per a plataformes Apple, molts tutorials tendeixen a explicar Swift i SwiftUI per separat. Això fa que els principiants tinguin fàcilment una sensació de fragmentació i arribin a pensar que són dues tecnologies completament independents.

En realitat, Swift i SwiftUI formen un conjunt profundament integrat: Swift és el llenguatge de programació i s'encarrega de la lògica i de les dades; SwiftUI és el framework d'interfície d'usuari construït sobre Swift i s'encarrega del renderitzat de les vistes i de la interacció.

En aquesta lliçó construirem un marc mental clar: què és Swift, què és SwiftUI i com col·laboren entre ells dins del codi.

## Què és Swift?

Swift és un llenguatge de programació modern presentat per Apple. S'utilitza per desenvolupar aplicacions per a iOS, macOS, watchOS, tvOS i altres plataformes d'Apple.

![swift](../../RESOURCE/010_swift.png)

Swift és un llenguatge fortament tipat i estàtic. En el seu disseny posa més èmfasi en la seguretat, redueix molts errors habituals de programació (com ara els punters nuls o els problemes de rang) i, al mateix temps, suporta una integració fluida amb C i Objective-C.

En el desenvolupament real, Swift s'encarrega principalment de la part lògica de l'aplicació, com ara el processament de dades, les peticions de xarxa o les operacions d'emmagatzematge.

## Què és SwiftUI?

SwiftUI és un nou framework de construcció d'interfícies presentat per Apple l'any 2019. SwiftUI adopta un model de programació declaratiu que permet als desenvolupadors descriure l'estructura de la interfície i el comportament d'interacció amb un codi molt més concís.

![swiftui](../../RESOURCE/010_swiftui.png)

La programació declarativa significa que el desenvolupador només ha de dir al sistema què vol mostrar, i el sistema actualitzarà automàticament la vista segons els canvis en les dades. Ja no cal actualitzar manualment l'estat de la interfície, i això simplifica molt la complexitat del desenvolupament d'UI.

El nucli de SwiftUI està format per components de vista (com `Text`, `Image`, `Button`, etc.) i contenidors de disposició (com `VStack`, `HStack`, `ZStack`). Aquests components interactuen mitjançant l'enllaç de dades i la gestió de l'estat, de manera que la interfície pugui respondre als canvis en les dades i actualitzar-se automàticament.

## Com col·laboren Swift i SwiftUI?

Les responsabilitats de Swift i SwiftUI es poden resumir així:

**1. Swift: tractar la lògica i les dades**

Swift s'utilitza principalment per gestionar dades, emmagatzemar estat i executar lògica. Aquest codi normalment no afecta directament el renderitzat de la interfície, sinó que és responsable del tractament de dades i del comportament.

Per exemple, en Swift podem processar dades així:

```swift
let markdown = try? String(contentsOf: url)
```

Aquest tipus de codi implica declaracions de variables, definicions de constants, funcions i control de flux, però no afecta directament la manera com es mostra la vista.

**2. SwiftUI: declarar i renderitzar la interfície**

SwiftUI, en canvi, s'utilitza per construir la disposició i el contingut de la interfície d'usuari, i s'encarrega principalment de renderitzar la interfície i gestionar la interacció visual.

Per exemple, crear una vista de text amb SwiftUI:

```swift
Text("SwiftSlim")
```

Tot això és codi que s'utilitza per construir i controlar elements de la interfície, i que interactua directament amb la UI.

### Exemple bàsic

A continuació tenim un exemple senzill de SwiftUI:

```swift
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

En aquest exemple:

**Codi SwiftUI**: `VStack`, `Image`, `Text` i `padding` pertanyen a SwiftUI i s'encarreguen de la visualització i la disposició de la interfície.

**Codi Swift**: els comentaris `//` de la part superior i `import SwiftUI` formen part de l'estructura de codi de Swift; a la part inferior, `#Preview` és un macro utilitzat per a la previsualització d'Xcode i no participa en el renderitzat real de la interfície.

### Exemple més avançat

En projectes reals, Swift i SwiftUI sovint es combinen per fer cadascun allò que sap fer millor:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

En aquest exemple:

**Codi SwiftUI**: `@State` és un `property wrapper` específic de SwiftUI, utilitzat per declarar l'estat mutable d'una vista; `Button` i `Text` són components SwiftUI responsables de mostrar la interfície i de la interacció amb l'usuari.

**Codi Swift**: `private var name` i `func printName()` són codi Swift que serveix per guardar dades i executar lògica, i no participa directament en el renderitzat de la vista.

Quan l'usuari fa clic al botó, SwiftUI desencadena el codi d'acció del botó:

```swift
Button("Print") {
    printName()
}
```

Aquí, `Button` és un component SwiftUI, mentre que la funció executada `printName()` és codi Swift encarregat de la lògica concreta.

Aquesta col·laboració fa que Swift i SwiftUI puguin treballar sense friccions: Swift s'encarrega de les dades i la lògica, i SwiftUI de la presentació de la interfície.

## On s'escriu normalment el codi Swift i el codi SwiftUI?

A SwiftUI, la interfície es construeix a partir de la vista retornada per la propietat `body`. Per això, tot el codi utilitzat per descriure la interfície s'escriu normalment dins de `body`.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

En aquest exemple, `Text` és un component de vista de SwiftUI i per això s'ha d'escriure dins de `body`, ja que SwiftUI llegeix `body` per generar la interfície.

El codi no relacionat directament amb la interfície, com variables, funcions o lògica de processament de dades, normalment s'escriu fora de `body`. Per exemple:

```swift
struct ContentView: View {

    // Swift: dades o lògica
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interfície
    var body: some View {
        Text(name)
    }
}
```

Cal tenir en compte que dins de `body` encara podem utilitzar sintaxi de Swift, com `if` o `for`. Simplement s'utilitza per controlar la generació de vistes SwiftUI:

```swift
if isLogin {
    Text("Welcome")
}
```

Per tant, en el desenvolupament amb SwiftUI ho podem entendre de manera simple així: el codi de vista (`Text`, `Image`, `Button`, etc.) s'escriu habitualment dins de `body`, mentre que el codi de dades i lògica (variables, funcions, etc.) s'escriu normalment fora de `body`.

## Fitxers Swift

A mesura que anem avançant en l'aprenentatge, també trobarem l'arquitectura MVVM, en què les capes `ViewModel` i `Model` solen estar formades per codi Swift pur i separades completament de la capa de vistes (`SwiftUI`).

Per exemple, una classe per gestionar l'estat de l'aplicació:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

O bé una estructura que descriu una estructura de dades:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

La responsabilitat d'aquest tipus de fitxers és gestionar i persistir dades, i no mostrar-les directament a la vista. Per això pertanyen completament a Swift.

## Context històric

Per entendre la relació entre Swift i SwiftUI, també cal conèixer l'evolució de les tecnologies de desenvolupament d'Apple. Fins al 2026, aquest ecosistema tècnic ha passat per diverses iteracions.

### Història de Swift

Abans de l'aparició de Swift, Objective-C era el llenguatge principal de les plataformes Apple, i permetia barrejar-se amb C. La seva sintaxi era força verbosa i la barrera d'entrada per als principiants era més alta:

```Obj-c
// Sintaxi d'Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

L'any 2014, Apple va presentar Swift a la WWDC. Swift tenia una sintaxi més moderna i una seguretat de tipus superior, i gradualment va anar substituint Objective-C com a llenguatge principal de desenvolupament:

```swift
// Sintaxi de Swift
let name = "Fang"
print("Hello, \(name)")
```

Tot i això, Objective-C no ha desaparegut de l'escena. Encara s'utilitza àmpliament en molts projectes heretats i frameworks de nivell més baix. Conèixer-ne la sintaxi bàsica continua sent útil per mantenir projectes antics i entendre millor el funcionament intern del sistema.

### Història de SwiftUI

Abans de SwiftUI, iOS feia servir **UIKit** i macOS feia servir **AppKit**. Aquests dos frameworks seguien un model de programació «imperatiu». Els desenvolupadors havien d'arrossegar controls al Storyboard o escriure manualment codi per controlar l'estat de la vista. Això generava molt de codi i un cost elevat de manteniment, especialment quan la lògica de la interfície es feia més complexa.

![storyboard](../../RESOURCE/010_xcode.png)

L'any 2019, Apple va presentar oficialment SwiftUI a la WWDC. SwiftUI va introduir el paradigma de programació «declaratiu» i va simplificar de manera considerable el desenvolupament d'UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Cal tenir en compte que SwiftUI no és una implementació de baix nivell completament independent. A cada plataforma, en essència, coopera i fa de pont amb UIKit (a iOS) o AppKit (a macOS), i continua depenent d'aquests dos frameworks a nivell intern.

### Relació entre Swift i UIKit / AppKit

Encara que Swift és un llenguatge de programació d'ús general que pot executar-se a les plataformes Apple, no pot substituir completament UIKit o AppKit. Per a algunes necessitats d'interfície més complexes, o per a funcions que SwiftUI encara no cobreix, encara cal recórrer a UIKit o AppKit.

Per exemple, UIKit ja és molt madur en aspectes com la gestió de controladors de vista complexos, els efectes d'animació o el reconeixement de gestos, i acumula una gran quantitat de validació en entorns reals de producció. Tot i que SwiftUI continua millorant en aquests terrenys, encara té limitacions en alguns casos marginals.

Per això, molts desenvolupadors combinen SwiftUI amb UIKit (o AppKit) dins d'un mateix projecte per aprofitar al màxim els punts forts de cadascun.

Des d'aquesta perspectiva, podem entendre SwiftUI com una capa d'abstracció d'alt nivell sobre UIKit / AppKit. Mentre aprenem SwiftUI, tenir una comprensió bàsica de UIKit i AppKit pot ajudar-nos a prendre decisions tècniques més raonables quan mantenim projectes antics o implementem funcions complexes.

## Resum

**Swift**: s'utilitza principalment per escriure lògica, tractament de dades i control de flux, i no està relacionat directament amb la disposició de la vista.

**SwiftUI**: s'utilitza per construir interfícies d'usuari de manera declarativa; el codi relacionat amb el contingut i la disposició de la vista pertany a SwiftUI.

En el desenvolupament real, Swift i SwiftUI es fan servir habitualment junts: Swift tracta la lògica i SwiftUI tracta la interfície.

Des d'Objective-C i UIKit fins a Swift i SwiftUI, l'entorn de desenvolupament d'Apple ha anat evolucionant cap a formes de programació més modernes i més simples. Tot i això, UIKit i AppKit continuen sent importants en molts projectes tradicionals.

Entenent bé la relació entre Swift i SwiftUI, podrem desenvolupar aplicacions per a iOS i macOS de manera més eficient i també prendre decisions tècniques més encertades quan mantinguem projectes antics.
