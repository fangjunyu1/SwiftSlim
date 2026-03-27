# Începând cu ContentView

## Pregătire înainte de lecție

În această lecție, vom porni de la fișierul ContentView.swift pentru a înțelege în mod sistematic structura de bază a SwiftUI, inclusiv:

- comentarii
- structura View
- layout-urile VStack / HStack / ZStack
- pictogramele SF Symbols
- modificatorii de view (modifier)
- codul de previzualizare #Preview

Mai întâi, găsește proiectul Xcode creat anterior și fă dublu clic pe fișierul .xcodeproj.

În zona de navigare Navigator din stânga, selectează fișierul ContentView.swift.

Atenție: de fiecare dată când deschizi proiectul, Canvas poate afișa „Preview paused”. Apasă pe butonul de reîmprospătare pentru a relua previzualizarea.

![Swift](../../RESOURCE/002_view7.png)

## Cunoașterea ContentView

Codul ContentView:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

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
````

Deși codul este destul de scurt, el conține structura de bază a SwiftUI.

### 1. Comentarii

În partea de sus a fișierului:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Acesta este un comentariu de fișier, folosit pentru a înregistra informațiile fișierului, inclusiv numele fișierului, numele proiectului, autorul și data creării.

În Swift, `//` este folosit pentru comentarii pe un singur rând:

```swift
// Acesta este un comentariu
```

Comentariile pot îmbunătăți lizibilitatea codului și îi ajută pe dezvoltatori să înțeleagă logica acestuia.

În dezvoltarea reală, codul poate deveni greu de înțeles. Dacă nu scrii comentarii, este foarte posibil ca după trei zile să nu-ți mai poți înțelege propriul cod.

De aceea, adăugarea activă de comentarii în timpul scrierii codului este un obicei bun de dezvoltare. Folosește comentariile pentru a nota logica codului și pentru a facilita mentenanța ulterioară.

**Dezactivarea temporară a codului**

Comentariile pot fi folosite și pentru a dezactiva temporar codul, ajutându-ne să identificăm problemele.

De exemplu:

```
A
B
C
```

A, B și C sunt trei fragmente de cod, iar unul dintre ele produce o eroare. Putem comenta temporar codul pentru a investiga problema.

Mai întâi adăugăm comentariu la A:

```
// A
B
C
```

Dacă după comentarea lui A codul revine la normal, înseamnă că problema se află în codul A.

Dacă după comentarea lui A problema persistă, putem comenta apoi și B, și tot așa, până găsim fragmentul de cod problematic.

În procesul de dezvoltare vom întâlni multe probleme, iar de cele mai multe ori va trebui să le investigăm comentând codul. Acest lucru ne poate ajuta să localizăm fragmentul problematic și să găsim BUG-ul.

În Xcode, poți folosi combinația de taste:

```
Command ⌘ + /
```

pentru a adăuga sau elimina rapid comentarii.

### 2. Importarea framework-ului SwiftUI

```swift
import SwiftUI
```

Această linie de cod înseamnă că importăm framework-ul SwiftUI.

Tipurile `View`, `Text`, `Image`, `VStack` și altele din SwiftUI provin din acest framework.

Dacă nu imporți framework-ul SwiftUI, Xcode va afișa o eroare:

```
Cannot find type 'View' in scope
```

Aceasta înseamnă că compilatorul nu poate recunoaște tipul `View`.

### 3. Structura View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

La prima vedere, această structură View poate părea necunoscută, deoarece conține cuvinte-cheie precum `struct`, `View`, `var`, `body` și `some`.

Încă nu am studiat aceste cuvinte-cheie. Deocamdată, este suficient să știi că acest cod creează un view numit `ContentView`.

Poți înțelege `View` ca pe o pânză de desen pe care putem crea conținut vizual, iar unealta de desen este SwiftUI.

De exemplu:

![Swift](../../RESOURCE/002_view.png)

Imaginea de mai sus arată trei pagini, dar în esență ele sunt trei View-uri.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Atunci când dezvoltăm o aplicație folosind SwiftUI, fiecare pagină este un View.

### 4. Cod SwiftUI

În interiorul view-ului este afișat codul SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Acest cod SwiftUI înseamnă că avem un layout vertical care afișează o pictogramă și un text.

![Swift](../../RESOURCE/002_view1.png)

#### Layout-ul VStack

```swift
VStack { }  // layout vertical
```

`VStack` reprezintă un container cu layout vertical. View-urile din interior sunt aranjate de sus în jos.

![Swift](../../RESOURCE/002_view8.png)

În SwiftUI există trei layout-uri uzuale:

* `VStack` —— aranjare verticală
* `HStack` —— aranjare orizontală
* `ZStack` —— aranjare suprapusă (axa Z)

```swift
HStack { }  // aranjare orizontală
ZStack { }  // aranjare suprapusă
```

Schema de aranjare pentru fiecare layout:

![Swift](../../RESOURCE/002_view2.png)

De exemplu, folosim `HStack` pentru aranjare orizontală:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Se poate observa că pictograma globului și textul sunt afișate pe orizontală.

![Swift](../../RESOURCE/002_view3.png)

Atunci când vrem o aranjare orizontală, folosim `HStack`. Când avem nevoie de suprapunere, folosim `ZStack`.

#### Image și SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Acest cod afișează o pictogramă cu glob, iar această pictogramă provine din sistemul de iconuri SF Symbols de la Apple.

![Swift](../../RESOURCE/002_view9.png)

Sensul codului este: afișează o pictogramă glob, de dimensiune mare, cu culoarea de accent.

Pe lângă glob, putem afișa și alte pictograme.

De exemplu, pentru a afișa un rucsac:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Cum afișăm alte pictograme?**

Trebuie să folosim biblioteca oficială de pictograme de sistem oferită de Apple, SF Symbols.

Deschide site-ul oficial Apple Developer și descarcă [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Deschide aplicația SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

În stânga se află categoriile de simboluri, iar în dreapta pictogramele corespunzătoare.

Fă clic dreapta pe o pictogramă și alege „Copy Name”, iar numele copiat va fi conținutul șirului corespunzător.

De exemplu:

```
"globe"
"backpack"
"heart"
```

Introdu numele pictogramei copiate în `Image(systemName:)`, iar astfel poți afișa pictograme diferite.

Atenție: fiecare pictogramă SF Symbols are o versiune minimă de sistem suportată. Dacă versiunea sistemului este prea veche, este posibil ca pictograma să nu poată fi afișată. Trebuie să verifici informațiile de compatibilitate în aplicația SF Symbols.

#### Modificatori

În SwiftUI, modificatorii (modifier) sunt metode folosite pentru a schimba aspectul sau comportamentul unui view.

Poți înțelege modificatorii ca pe niște haine: purtând haine diferite, aspectul afișat va fi diferit.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` și `foregroundStyle` sunt modificatori ai view-ului `Image`. Fără a schimba conținutul lui `Image`, ei îi modifică aspectul.

**1. imageScale**

```swift
.imageScale(.large)
```

Acesta poate controla dimensiunea pictogramelor SF Symbols:

* `.small`
* `.medium`
* `.large`

![Swift](../../RESOURCE/002_view11.png)

Putem schimba diferitele opțiuni pentru a afișa simbolurile SF diferit ca dimensiune.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` poate controla culoarea din prim-plan.

`.tint` reprezintă culoarea de accent a mediului curent (accent color), care în mod implicit pe iOS este albastră.

Dacă vrem să modificăm culoarea din prim-plan în roșu:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### View-ul Text

`Text` este un view pentru text, folosit pentru a afișa șiruri de caractere.

```swift
Text("Hello, world!")
```

De exemplu, pentru a afișa numele meu:

```swift
Text("FangJunyu")
```

Atenție: șirurile de caractere trebuie încadrate între ghilimele duble `""`.

Poți încerca să afișezi propriul nume, numărul de telefon sau alte informații.

#### padding

În SwiftUI, `padding` este folosit pentru a adăuga spațiu gol între conținutul unui view și marginile sale. El aparține noțiunii de „spațiere interioară (padding / content inset)”.

```swift
HStack {
    ...
}
.padding()
```

Codul de mai sus înseamnă că adăugăm margini interne implicite sistemului pentru view-ul `HStack`.

**Ce este padding?**

`padding` reprezintă „spațiul liber dintre conținutul unui view și marginile lui”.

În imaginea de mai jos, după ce `HStack`-ul albastru primește `padding`, zona albastră se retrage spre interior și pare „puțin mai mică”.

![Swift](../../RESOURCE/002_view6.png)

**Padding implicit**

Modificatorul `padding()` folosește în mod implicit distanța standard recomandată de sistem.

```swift
.padding()
```

Pe platforme și în contexte diferite, această valoare poate varia. De exemplu:

* pe iOS este de obicei aproximativ 16 pt
* pe macOS sau watchOS, spațierea standard a sistemului poate fi diferită, uneori mai mare sau mai mică, în funcție de regulile de design ale platformei

**Padding personalizat**

Poți seta și margini interne separate pentru view.

1. Setarea unei singure direcții

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Explicația direcțiilor:

* `.top`: margine superioară
* `.bottom`: margine inferioară
* `.leading`: margine din partea de început
* `.trailing`: margine din partea de sfârșit

![Swift](../../RESOURCE/002_view12.png)

Atenție: `leading` și `trailing` se adaptează automat în funcție de direcția limbii. De exemplu, în mediile arabe (RTL) ele se inversează automat.

2. Setarea mai multor direcții

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Poți folosi un array pentru a specifica mai multe direcții în același timp. Modul concret de folosire al array-urilor va fi explicat mai detaliat în lecțiile următoare; aici este suficient doar să cunoști această sintaxă.

3. Setarea direcției orizontale sau verticale

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Echivalent cu:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Eliminarea padding-ului**

Dacă nu vrei niciun fel de padding, poți folosi `.padding(0)` pentru a-l elimina:

```swift
.padding(0)
```

sau poți șterge direct modificatorul `padding`:

```swift
// .padding()
```

### 6. Codul de previzualizare Preview

```swift
#Preview {
    ContentView()
}
```

Acest cod înseamnă că în Canvas este generată previzualizarea view-ului `ContentView`.

Atenție: `#Preview` este o sintaxă nouă introdusă în Swift 5.9 / Xcode 15. Înainte de aceasta se folosea structura `PreviewProvider`.

**Ce se întâmplă dacă dezactivăm Preview?**

Dacă dezactivezi Preview:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas nu va mai afișa conținut renderizabil.

![Swift](../../RESOURCE/002_xcode.png)

Acesta este modul în care `#Preview` controlează afișarea previzualizării în Canvas.

Atunci când avem nevoie să previzualizăm un view SwiftUI în Xcode, adăugăm codul de previzualizare `#Preview`. Dacă nu avem nevoie de previzualizare, putem comenta sau șterge codul `#Preview`.

## Rezumat

Deși fișierul ContentView.swift nu conține mult cod, el acoperă de fapt mai multe concepte esențiale din SwiftUI. Pentru începători, acest cod poate părea necunoscut, dar prin descompunerea structurii lui se poate construi o înțelegere inițială a SwiftUI.

Recapitulând conținutul acestei lecții, am învățat mai întâi despre comentariile `//`, care pot fi folosite pentru a explica logica codului sau pentru a dezactiva temporar anumite linii de cod.

Apoi, am aflat că fișierele SwiftUI trebuie să importe framework-ul SwiftUI:

```swift
import SwiftUI
```

Dacă framework-ul nu este importat, compilatorul nu va putea recunoaște tipuri precum `View`.

După aceea, am înțeles structura de bază a unui view SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Aici `ContentView` este numele view-ului.

Am studiat și trei containere de layout frecvent folosite: `VStack` (aranjare verticală), `HStack` (aranjare orizontală) și `ZStack` (aranjare suprapusă).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

În acest cod, se afișează un container cu aranjare verticală, iar în interiorul lui sunt afișate o pictogramă și un text.

`Image` poate afișa pictograme SF Symbols, iar prin modificatori putem controla dimensiunea și culoarea pictogramei.

View-ul `Text` poate afișa conținut text.

`padding` reprezintă marginea internă, adică un spațiu transparent adăugat în jurul view-ului.

În final, `#Preview` este view-ul de previzualizare care permite afișarea previzualizării în Canvas.

### Exerciții după lecție

Pentru începători, conținutul acestei lecții poate părea destul de complex. Putem aprofunda înțelegerea prin câteva exerciții suplimentare:

* modifică numele pictogramei SF Symbols
* modifică culoarea din prim-plan a pictogramei în negru
* schimbă `VStack` în `HStack`
* comentează `Image` sau `Text` și observă schimbările din previzualizare

### Bonus: completarea automată a codului (Code Completion)

În timpul scrierii codului, este posibil să fi observat deja că Xcode afișează automat o listă cu opțiuni disponibile.

De exemplu, atunci când modificăm modificatorul `imageScale`:

```swift
.imageScale(.)
```

Xcode va afișa opțiunile disponibile:

![Swift](../../RESOURCE/002_view10.png)

Aceasta face parte din mecanismul de completare automată a codului (Code Completion). El se bazează pe inferența de tip și pe sugestiile pentru membrii enum-urilor, putând crește eficiența tastării și reduce erorile.

În lecțiile următoare, vom introduce oficial enum-urile (`enum`), iar deocamdată este suficient să ai doar o înțelegere de bază.
