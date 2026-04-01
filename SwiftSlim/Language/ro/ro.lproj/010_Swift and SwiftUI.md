# Swift și SwiftUI

Atunci când înveți dezvoltarea pentru platformele Apple, multe tutoriale tind să explice Swift și SwiftUI separat. Acest lucru îi poate face pe începători să simtă o ruptură între ele și să creadă, în mod eronat, că sunt două tehnologii complet independente.

În realitate, Swift și SwiftUI formează un întreg profund integrat: Swift este limbajul de programare, responsabil pentru logică și date; SwiftUI este framework-ul de interfață construit pe baza lui Swift, responsabil pentru randarea și interacțiunea vizuală.

Această lecție te va ajuta să construiești un cadru clar de înțelegere: ce este Swift, ce este SwiftUI și cum colaborează ele în cod.

## Ce este Swift?

Swift este un limbaj modern de programare lansat de Apple, folosit pentru dezvoltarea aplicațiilor pe platforme precum iOS, macOS, watchOS și tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift este un limbaj puternic tipizat și static, proiectat cu accent pe siguranță, reducând multe erori comune de programare (precum pointerii nuli, depășirea limitelor etc.) și oferind integrare fără probleme cu C și Objective-C.

În dezvoltarea reală, Swift se ocupă mai ales de partea logică a aplicației, cum ar fi procesarea datelor, cererile de rețea, operațiile de stocare și altele similare.

## Ce este SwiftUI?

SwiftUI este un nou framework de construire a interfețelor, lansat de Apple în 2019. SwiftUI adoptă modelul de programare declarativă și le permite dezvoltatorilor să descrie structura interfeței și comportamentul interactiv cu un cod mai simplu.

![swiftui](../../RESOURCE/010_swiftui.png)

Programarea declarativă înseamnă că dezvoltatorul trebuie doar să spună sistemului ce dorește să afișeze, iar sistemul va reîmprospăta automat view-ul în funcție de schimbările datelor. Nu mai este nevoie să actualizezi manual starea interfeței, ceea ce simplifică mult complexitatea dezvoltării UI.

Nucleul SwiftUI îl reprezintă componentele de view (precum Text, Image, Button etc.) și containerele de layout (precum VStack, HStack, ZStack). Aceste componente interacționează prin data binding și state management, astfel încât interfața poate răspunde la schimbările datelor și se poate actualiza automat.

## Cum colaborează Swift și SwiftUI?

Responsabilitățile lui Swift și SwiftUI pot fi rezumate astfel:

**1. Swift: gestionează logica și datele**

Swift este folosit în principal pentru gestionarea datelor, stocarea stării și executarea logicii. Acest cod, de obicei, nu afectează direct randarea interfeței, ci este responsabil de procesarea datelor și a comportamentului.

De exemplu, procesarea datelor în Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Acest cod implică declarații de variabile, definiții de constante, funcții, controlul fluxului și altele similare, dar nu afectează direct afișarea view-ului.

**2. SwiftUI: declară și randază interfața**

SwiftUI este folosit pentru construirea layout-ului și conținutului interfeței, fiind responsabil în principal de randarea interfeței și de interacțiunea vizuală.

De exemplu, folosirea SwiftUI pentru a crea un view text:

```swift
Text("SwiftSlim")
```

Acestea sunt fragmente de cod folosite pentru construirea și controlul elementelor de interfață, interacționând direct cu UI-ul.

### Exemplu de bază

Mai jos este un exemplu simplu SwiftUI:

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

În acest exemplu:

**Cod SwiftUI**: VStack, Image, Text și padding aparțin SwiftUI și sunt responsabile de afișarea și layout-ul interfeței.

**Cod Swift**: comentariul `//` din partea de sus a fișierului și `import SwiftUI` aparțin structurii codului Swift; `#Preview` din partea de jos este un macro folosit pentru previzualizarea în Xcode și nu participă la randarea reală a interfeței.

### Exemplu avansat

În proiectele reale, Swift și SwiftUI sunt adesea folosite împreună pentru a îndeplini sarcinile la care fiecare se pricepe cel mai bine:

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

În acest exemplu:

**Cod SwiftUI**: @State este un property wrapper specific SwiftUI, folosit pentru a declara starea mutabilă a view-ului; Button și Text sunt componente de view SwiftUI, responsabile de afișarea interfeței și de interacțiunea utilizatorului.

**Cod Swift**: `private var name` și `func printName()` sunt cod Swift, folosit pentru stocarea datelor și executarea logicii, fără a afecta direct randarea view-ului.

Când utilizatorul apasă butonul, SwiftUI va declanșa codul operației din buton:

```swift
Button("Print") {
    printName()
}
```

Aici, Button este o componentă SwiftUI, iar funcția `printName()` care este executată reprezintă cod Swift, responsabil de logica efectivă.

Această colaborare face ca Swift și SwiftUI să poată fi combinate fără întreruperi: Swift se ocupă de date și logică, iar SwiftUI se ocupă de afișarea interfeței utilizatorului.

## Unde se scriu de obicei codul Swift și codul SwiftUI?

În SwiftUI, interfața este construită prin view-ul returnat de proprietatea body. De aceea, tot codul folosit pentru a descrie interfața este de obicei scris în body.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

În acest exemplu, Text este o componentă de view SwiftUI, deci trebuie scrisă în body, deoarece SwiftUI citește body pentru a genera interfața.

Codul care nu are legătură directă cu interfața, cum ar fi variabilele, funcțiile sau logica de procesare a datelor, este de obicei scris în afara lui body. De exemplu:

```swift
struct ContentView: View {

    // Swift: date sau logică
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interfață
    var body: some View {
        Text(name)
    }
}
```

Trebuie observat că în body se poate folosi în continuare sintaxa Swift, cum ar fi instrucțiuni de control al fluxului precum if și for; ele sunt doar folosite pentru a controla generarea view-urilor SwiftUI:

```swift
if isLogin {
    Text("Welcome")
}
```

Prin urmare, în dezvoltarea SwiftUI poți înțelege simplu astfel: codul de view (Text, Image, Button etc.) este de obicei scris în body; codul de date și logică (variabile, funcții etc.) este de obicei scris în afara lui body.

## Fișiere Swift

Pe măsură ce studiul avansează, vom întâlni și arhitectura MVVM, unde straturile ViewModel și Model sunt de obicei compuse din cod Swift pur, complet separate de stratul de view (SwiftUI).

De exemplu, o clasă folosită pentru gestionarea stării aplicației:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Sau o structură care descrie structura datelor:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Rolul acestor fișiere este să gestioneze și să persiste datele, fără să fie afișate direct în view, deci ele aparțin complet lui Swift.

## Context istoric

Pentru a înțelege relația dintre Swift și SwiftUI, este util să înțelegi și evoluția tehnologiilor de dezvoltare Apple. Până în 2026, acest stack tehnologic a trecut prin mai multe iterații.

### Istoria lui Swift

Înainte de apariția lui Swift, Objective-C era principalul limbaj de programare pentru platformele Apple și suporta folosirea împreună cu limbajul C. Sintaxa sa era mai verbosă și avea o barieră de intrare mai mare pentru începători:

```Obj-c
// Scriere în Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

În 2014, Apple a lansat limbajul Swift la WWDC. Sintaxa Swift este mai modernă, iar siguranța tipurilor este mai ridicată, înlocuind treptat Objective-C ca limbaj principal de dezvoltare:

```swift
// Scriere în Swift
let name = "Fang"
print("Hello, \(name)")
```

Totuși, Objective-C nu a dispărut din istorie. El este încă folosit pe scară largă în multe proiecte existente și în framework-uri de nivel jos. Înțelegerea sintaxei sale de bază rămâne valoroasă pentru mentenanța proiectelor vechi și pentru înțelegerea nivelului inferior al sistemului.

### Istoria lui SwiftUI

Înainte de apariția SwiftUI, iOS folosea **UIKit**, iar macOS folosea **AppKit**. Aceste două framework-uri adoptau un stil de programare „imperativ”. Dezvoltatorii trebuiau să tragă controale în Storyboard sau să scrie manual cod pentru a controla starea view-urilor. Rezultatul era mult cod și costuri mari de mentenanță, mai ales atunci când logica interfeței devenea complexă.

![storyboard](../../RESOURCE/010_xcode.png)

În 2019, Apple a lansat oficial SwiftUI la WWDC. SwiftUI a introdus paradigma programării „declarative”, simplificând considerabil fluxul de dezvoltare UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Este important de observat că SwiftUI nu este o implementare de nivel jos complet independentă. Pe fiecare platformă, în esență, el colaborează și face bridging către UIKit (iOS) sau AppKit (macOS), iar nivelul inferior încă se bazează pe aceste două framework-uri pentru a rula.

### Relația dintre Swift și UIKit/AppKit

Deși Swift este un limbaj de programare general care poate rula pe diferite platforme Apple, el nu poate înlocui complet UIKit sau AppKit. Pentru unele cerințe complexe de interfață sau pentru funcționalități pe care SwiftUI încă nu le acoperă, este încă necesar să recurgem la UIKit sau AppKit.

De exemplu, UIKit este deja foarte matur în gestionarea complexă a view controller-elor, a animațiilor, a recunoașterii gesturilor și a altor aspecte, având la bază multă experiență validată în producție. Deși SwiftUI își îmbunătățește continuu capabilitățile în aceste domenii, în anumite scenarii de margine încă există limitări.

De aceea, mulți dezvoltatori folosesc împreună în proiecte SwiftUI și UIKit (sau AppKit), pentru a valorifica pe deplin avantajele fiecăruia.

Privit din acest unghi, SwiftUI poate fi considerat o încapsulare de nivel mai înalt peste UIKit / AppKit. În timp ce înveți SwiftUI, o înțelegere adecvată a conceptelor de bază din UIKit și AppKit te poate ajuta să iei decizii tehnice mai rezonabile atunci când întreții proiecte vechi sau implementezi funcționalități complexe.

## Rezumat

**Swift**: este folosit în principal pentru scrierea logicii, procesarea datelor, controlul fluxului și altele similare, fără legătură directă cu layout-ul view-urilor.

**SwiftUI**: este folosit pentru construirea declarativă a interfeței utilizatorului; codul pentru conținutul și layout-ul view-urilor aparține SwiftUI.

În dezvoltarea reală, Swift și SwiftUI sunt de obicei folosite împreună: Swift se ocupă de logică, iar SwiftUI se ocupă de interfață.

De la Objective-C și UIKit până la Swift și SwiftUI, mediul de dezvoltare Apple s-a orientat treptat spre o modalitate de programare mai modernă și mai simplă, dar UIKit și AppKit rămân încă importante în multe proiecte tradiționale.

Prin înțelegerea relației dintre Swift și SwiftUI, putem dezvolta mai eficient pentru iOS/macOS și putem lua decizii tehnice mai potrivite atunci când întreținem proiecte mai vechi.
