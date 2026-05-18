# Culori personalizate

În această lecție, vom învăța cum să personalizăm culorile în SwiftUI.

În lecțiile anterioare, am folosit deja culorile implicite oferite de SwiftUI, de exemplu:

```swift
Color.blue
Color.red
Color.green
```

Aceste culori sunt ușor de folosit, dar în dezvoltarea reală a unei aplicații, culorile implicite nu sunt întotdeauna suficient de precise.

De exemplu, un design poate folosi astfel de culori:

```text
#2c54c2
#4875ed
#213e8d
```

Acest tip de culoare se numește culoare Hex.

În această lecție, vom face mai întâi ca SwiftUI să accepte culori Hex, apoi vom folosi `static` pentru a organiza culorile folosite frecvent.

La final, vom aplica culorile personalizate în vizualizarea enciclopediei animalelor și vom folosi în continuare un fundal cu gradient, pentru ca butoanele să pară mai stratificate.

## De ce avem nevoie de culori personalizate?

În SwiftUI, putem folosi direct culorile de sistem.

De exemplu:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Aici, `.blue` înseamnă albastru. De fapt, este o formă prescurtată pentru `Color.blue`.

Avantajul culorilor implicite este că sunt simple și comode, dar opțiunile de culoare sunt destul de limitate.

De exemplu:

```swift
Color.blue
```

Aceasta poate reprezenta doar albastrul implicit oferit de SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Totuși, în dezvoltarea reală, avem adesea nevoie de culori mai specifice.

De exemplu, chiar dacă toate sunt albastre, pot exista efecte diferite, precum albastru deschis, albastru închis, albastru-gri sau albastru intens.

![More Blue](../../../Resource/031_color5.png)

În acest caz, dacă folosim doar `Color.blue`, va fi dificil să reproducem efectul din design.

De aceea, trebuie să facem ca SwiftUI să accepte culori personalizate.

## Ce este o culoare Hex?

Culorile afișate pe ecran sunt de obicei alcătuite din trei canale: roșu, verde și albastru. Acesta este RGB.

RGB înseamnă:

```text
Red     // Roșu
Green   // Verde
Blue    // Albastru
```

O culoare Hex este o modalitate de reprezentare a unei culori RGB.

De exemplu:

```swift
#5479FF
```

Această valoare de culoare poate fi înțeleasă simplu ca trei părți:

```text
54  // Reprezintă canalul roșu
79  // Reprezintă canalul verde
FF  // Reprezintă canalul albastru
```

În această lecție, nu trebuie să calculăm aceste valori și nici să înțelegem în profunzime regulile sistemului hexazecimal.

Deocamdată, trebuie doar să știm că `#5479FF` reprezintă o culoare concretă.

Mai târziu, când vedem forme precum `#2c54c2` și `#4875ed`, le putem înțelege mai întâi ca valori de culoare.

În instrumente de design precum Sketch, Figma și Photoshop, putem vedea adesea valori de culoare similare.

![color](../../../Resource/031_color.png)

Totuși, SwiftUI nu permite implicit să scriem direct așa:

```swift
Color(hex: "#5479FF")
```

De aceea, trebuie să extindem noi înșine tipul `Color`, astfel încât să poată crea culori din șiruri Hex.

## Crearea fișierului Color+Hex.swift

Mai întâi, creăm un fișier Swift nou.

Numele fișierului poate fi:

```text
Color.swift
```

Poate fi scris și mai clar astfel:

```text
Color+Hex.swift
```

Aici este mai recomandat să folosim:

```text
Color+Hex.swift
```

În proiectele Swift, nume de fișiere precum `Color+Hex.swift` sunt foarte frecvente.

Acesta arată că fișierul este un fișier de extensie care adaugă funcționalitatea Hex pentru `Color`.

Numele fișierului nu afectează direct rularea codului. Este folosit doar pentru a ne ajuta să înțelegem mai ușor scopul fișierului.

## Adăugarea codului Color(hex:)

În fișierul `Color+Hex.swift`, scrie următorul cod:

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

Acest cod folosește `extension` pentru a extinde tipul `Color` și îi adaugă lui `Color` o metodă nouă de inițializare:

```swift
init(hex: String)
```

După ce avem această metodă de inițializare, putem transmite un șir Hex către `Color`, pentru a crea o culoare personalizată:

```swift
Color(hex: "#5479FF")
```

În interiorul acestei extensii, șirul Hex este convertit într-o culoare RGB pe care SwiftUI o poate recunoaște.

În această etapă, nu trebuie să înțelegi în profunzime logica de conversie a fiecărei linii. Trebuie doar să știi că metoda adăugată `Color(hex:)` ne permite să creăm culori personalizate din valori de culoare Hex.

## Folosirea culorilor personalizate

Acum putem testa culorile personalizate în `ContentView`.

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

Efectul afișat:

![color](../../../Resource/031_color1.png)

În acest exemplu, primul rând folosește o culoare de sistem:

```swift
.foregroundStyle(Color.blue)
```

Următoarele trei rânduri folosesc culori Hex personalizate:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Prin comparație, putem observa că albastrul de sistem are doar un efect implicit.

Culorile Hex însă pot reprezenta variații mai fine ale albastrului.

Aceasta este valoarea culorilor personalizate: ele pot face culorile interfeței mai apropiate de designul real și ne ajută să controlăm mai ușor stilul vizual al aplicației.

## Folosirea static pentru organizarea culorilor

Acum putem deja crea culori din șiruri Hex:

```swift
Color(hex: "#2c54c2")
```

Această scriere poate fi folosită normal, dar dacă aceeași culoare apare repetat în mai multe locuri, întreținerea ulterioară devine mai incomodă.

Dacă această valoare de culoare este scrisă în 10 locuri diferite, atunci când vrem să schimbăm acest albastru mai târziu, trebuie să modificăm fiecare loc separat.

În acest moment, putem folosi `static` pentru a organiza culorile folosite frecvent într-un singur loc.

La finalul fișierului `Color+Hex.swift`, continuă să adaugi următorul cod:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aici am adăugat trei proprietăți statice pentru `Color`: `animalBlue`, `animalLightBlue` și `animalDarkBlue`. Ele reprezintă nuanțe diferite de albastru.

Deoarece aceste proprietăți folosesc `static`, ele aparțin tipului `Color` însuși.

Când le folosim, le putem accesa direct prin `Color.`:

```swift
Color.animalBlue
```

Această scriere este mai clară decât scrierea directă a unui șir Hex.

Când vedem `Color.animalBlue`, putem ști că reprezintă albastrul folosit în enciclopedia animalelor.

Dar când vedem `Color(hex: "#2c54c2")`, putem ști doar că este o valoare de culoare și nu este ușor să observăm scopul ei concret.

Gestionarea culorilor într-un singur loc mai are un avantaj: modificările ulterioare sunt mai ușoare.

Dacă vrem să ajustăm culoarea principală a enciclopediei animalelor, trebuie doar să modificăm locul unde este definită:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Toate locurile care folosesc această culoare se vor actualiza împreună.

Acesta este sensul folosirii `static` pentru organizarea culorilor: face numele culorilor mai clare și întreținerea ulterioară mai comodă.

## Aplicarea în enciclopedia animalelor

Acum putem aplica culorile personalizate în vizualizarea anterioară a enciclopediei animalelor.

Anterior, fundalul butonului pentru animal era alb:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Acum îl putem schimba într-o culoare personalizată:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Aici, `Color.animalBlue` este culoarea statică pe care tocmai am definit-o în `Color+Hex.swift`.

Textul butonului folosește alb:

```swift
.foregroundStyle(Color.white)
```

Fundalul emoji-ului animalului folosește alb semi-transparent:

```swift
.background(Color.white.opacity(0.15))
```

Astfel, butonul va forma un stil vizual albastru unitar.

Accentul acestui pas nu este să adăugăm cod complex, ci să aplicăm cu adevărat în interfață culorile personalizate învățate mai devreme.

## Folosirea unui fundal cu gradient

Pe lângă folosirea unei singure culori, putem combina mai multe culori într-un efect de gradient.

De exemplu, mai devreme am definit aceste culori:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aceste culori pot fi folosite nu doar separat, ci și combinate într-un fundal cu gradient.

În SwiftUI, putem folosi `LinearGradient` pentru a crea un gradient liniar.

De exemplu:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Acest cod creează un fundal cu gradient de la stânga la dreapta, iar culoarea trece treptat de la `Color.animalBlue` la `Color.animalLightBlue`.

Aici, `colors` este folosit pentru a seta culorile care participă la gradient, iar `startPoint` și `endPoint` sunt folosite pentru a controla direcția gradientului.

### Testarea efectului de gradient

Putem folosi un Text simplu pentru a testa fundalul cu gradient.

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

Efectul afișat:

![color](../../../Resource/031_color3.png)

În acest exemplu, fundalul lui `Text` nu mai este o singură culoare, ci o culoare cu gradient care se schimbă treptat de la stânga la dreapta.

Comparativ cu o culoare de fundal obișnuită, un fundal cu gradient are mai multă profunzime și poate crea mai ușor un punct de interes vizual în interfață.

## Folosirea fundalului cu gradient în enciclopedia animalelor

Acum putem schimba culoarea de fundal a butonului pentru animal:

```swift
.background(Color.animalBlue)
```

Într-un fundal cu gradient:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Codul complet este următorul:

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

Efectul afișat:

![color](../../../Resource/031_color4.png)

Acum, butonul pentru animal nu mai are doar o singură culoare de fundal, ci are un efect de gradient de la stânga la dreapta.

Comparativ cu un fundal într-o singură culoare, un fundal cu gradient poate face interfața să pară mai stratificată și mai apropiată de designul vizual al unei aplicații reale.

## Diferența dintre fundalul într-o singură culoare și fundalul cu gradient

Un fundal într-o singură culoare folosește doar o culoare.

De exemplu:

```swift
.background(Color.animalBlue)
```

Această scriere este simplă și clară și este potrivită pentru majoritatea interfețelor de bază.

Un fundal cu gradient folosește mai multe culori.

De exemplu:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Această scriere poate face interfața mai stratificată, dar poate crește mai ușor și complexitatea vizuală.

De aceea, în dezvoltarea reală, putem înțelege lucrurile astfel:

Fundalurile într-o singură culoare sunt potrivite pentru text obișnuit, butoane obișnuite, carduri obișnuite și fundaluri obișnuite de pagină.

Fundalurile cu gradient sunt potrivite pentru butoane importante, zone de sus, carduri de copertă, intrări de funcții și alte poziții care trebuie evidențiate.

## Rezumat

În această lecție, am învățat cum să folosim culori personalizate în SwiftUI.

Mai întâi, am înțeles culorile Hex.

De exemplu:

```text
#2c54c2
```

Aceasta reprezintă o culoare concretă.

Apoi, am folosit `extension Color` pentru a extinde tipul `Color`.

Astfel, SwiftUI poate crea culori în următorul mod:

```swift
Color(hex: "#2c54c2")
```

În continuare, am folosit `static` pentru a organiza culorile folosite frecvent:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Astfel, în alte vizualizări putem folosi direct:

```swift
Color.animalBlue
```

Comparativ cu scrierea șirului Hex de fiecare dată, această metodă este mai clară și face mai comodă modificarea unitară a culorilor mai târziu.

La final, am învățat `LinearGradient` și am combinat culorile personalizate într-un fundal cu gradient:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Prin această lecție, am parcurs procesul de la „crearea culorilor personalizate” până la „folosirea culorilor într-o interfață reală”.

Mai târziu, când o culoare trebuie folosită repetat în mai multe locuri, putem lua mai întâi în considerare organizarea ei într-o extensie `Color`.

Astfel, codul va fi mai clar, iar stilul interfeței va fi mai ușor de unificat.
