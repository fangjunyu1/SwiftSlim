# Gestionarea fișierelor Xcode

În această lecție, vom învăța operațiile frecvente cu fișiere în Xcode.

În lecțiile anterioare, am scris cea mai mare parte a codului în `ContentView`. Acest lucru ne ajută să observăm mai ușor codul și rezultatul afișat.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Totuși, într-o aplicație reală, de obicei nu punem tot codul într-un singur fișier.

Când paginile, componentele și funcțiile devin tot mai numeroase, trebuie să împărțim view-urile diferite în fișiere SwiftUI diferite.

De exemplu:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Astfel, structura codului devine mai clară, iar întreținerea și modificările ulterioare devin mai ușoare.

## De ce trebuie să gestionăm fișierele

În SwiftUI, o pagină sau o componentă poate fi scrisă de obicei ca un fișier de view separat.

De exemplu:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Aici, `CardView` este un view SwiftUI.

Dacă toate view-urile sunt scrise în `ContentView`, codul va deveni tot mai lung și tot mai greu de citit.

De aceea, trebuie să învățăm cum să creăm, să redenumim și să ștergem fișiere, precum și cum să folosim foldere pentru a gestiona diferite fișiere de cod.

## Crearea unui fișier SwiftUI

În Xcode, există de obicei două metode frecvente pentru a crea un fișier SwiftUI:

O metodă este să creăm un fișier gol, apoi să scriem codul singuri.

Cealaltă metodă este să creăm un fișier șablon SwiftUI, lăsând Xcode să genereze automat codul de bază.

Pentru începători, este mai recomandată folosirea unui fișier șablon SwiftUI, deoarece acesta generează automat structura de bază.

### Crearea unui fișier gol

În zona Navigator din partea stângă a Xcode, fă clic dreapta pe o zonă goală sau pe un folder, apoi alege `New Empty File`.

Poziția operației este prezentată mai jos:

![xcode](../../../Resource/027_view1.png)

După crearea unui fișier gol, Xcode generează de obicei un fișier Swift fără nume, cum ar fi `Untitled.swift`.

Îl putem redenumi în `TestView.swift`.

Într-un proiect SwiftUI, dacă acest fișier este folosit pentru a afișa un view, de obicei este recomandat să adăugăm `View` la finalul numelui.

De exemplu:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Aceasta nu este o regulă obligatorie, dar ne ajută să recunoaștem dintr-o privire că acesta este un fișier de view.

După crearea unui fișier gol, fișierul poate conține doar comentarii implicite sau poate fi gol. Acest lucru depinde de versiunea Xcode și de metoda de creare.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

În acest moment, trebuie să scriem manual codul SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Astfel, este creat un fișier simplu de view SwiftUI.

### Redenumirea unui fișier

Dacă vrei să modifici numele fișierului după ce l-ai creat, poți selecta fișierul în zona Navigator din partea stângă a Xcode, apoi să apeși tasta Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Astfel poți modifica numele fișierului.

Este important de reținut că modificarea numelui fișierului nu modifică automat numele view-ului din cod.

De exemplu, după ce numele fișierului este schimbat în `ProfileView.swift`, codul poate conține încă `struct TestView: View`.

Deși acest lucru nu provoacă neapărat o eroare, poate cauza ușor confuzie.

Prin urmare, este recomandat să păstrăm numele fișierului și numele view-ului consecvente. De exemplu, dacă numele fișierului este `ProfileView.swift`, numele view-ului ar trebui să folosească și el `ProfileView`.

## Crearea unui fișier șablon SwiftUI

Pe lângă crearea unui fișier gol, putem crea direct și un fișier șablon SwiftUI.

În zona Navigator din partea stângă a Xcode, fă clic dreapta pe o zonă goală sau pe un folder, apoi alege `New File from Template...`.

Poziția operației este prezentată mai jos:

![xcode](../../../Resource/027_view3.png)

În fereastra pop-up, poți alege în partea de sus diferite platforme, cum ar fi `iOS`, `macOS` și altele.

Aici păstrăm platforma corespunzătoare proiectului curent. De exemplu, dacă creăm o aplicație iOS, alegem `iOS`.

![xcode](../../../Resource/027_view4.png)

Apoi alege `SwiftUI View` din partea de jos.

![xcode](../../../Resource/027_view12.png)

Apoi fă clic pe `Next`, introdu numele fișierului și salvează-l.

De exemplu, creăm un fișier `Test2View.swift`.

Xcode va genera automat cod similar cu următorul:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Comparativ cu un fișier gol, un fișier șablon include automat `import SwiftUI`, `struct`, `body` și `#Preview`.

Prin urmare, pentru începători, folosirea unui fișier șablon SwiftUI este mai simplă și reduce probabilitatea de a omite codul necesar.

**Sfat**: Pe lângă crearea unui fișier prin clic dreapta, poți face clic și pe butonul plus din partea de jos a zonei Navigator din stânga Xcode pentru a crea un fișier sau un folder.

![xcode](../../../Resource/027_view5.png)

## Crearea unui folder

Când fișierele devin tot mai numeroase, putem folosi foldere pentru a le gestiona.

În zona Navigator din partea stângă a Xcode, fă clic dreapta pe o zonă goală sau pe un folder, apoi alege `New Folder`.

După crearea folderului, poți trage fișierele asociate în folder.

![xcode](../../../Resource/027_view7.png)

Folderele sunt folosite în principal pentru organizarea structurii proiectului. Ele nu schimbă modul de utilizare al view-ului în sine.

Atât timp cât numele view-ului este corect, acesta poate fi folosit în continuare în alte fișiere sub forme precum `TestView()` și `Test2View()`.

## Ștergerea unui fișier sau folder

Dacă vrei să ștergi un fișier sau un folder, poți selecta fișierul corespunzător în zona Navigator din partea stângă a Xcode, apoi să faci clic dreapta și să alegi `Delete`.

Poți de asemenea să selectezi fișierul și să apeși tasta Delete `⌫`.

Xcode va afișa o fereastră de confirmare a ștergerii.

![xcode](../../../Resource/027_view10.png)

Alege `Move to Trash` pentru a muta fișierul în Coșul de gunoi.

Dacă vezi `Remove Reference`, înseamnă că este eliminată doar referința din proiectul Xcode, iar fișierul original de pe disc nu este șters.

Pentru începători, dacă ștergi doar un fișier obișnuit pe care tocmai l-ai creat, alegerea `Move to Trash` este de obicei suficientă.

## Afișarea mai multor view-uri SwiftUI

După ce învățăm cum să creăm fișiere, putem împărți view-urile diferite în fișiere diferite.

De exemplu, creăm două fișiere SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` este folosit pentru a afișa numele autorului:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` este folosit pentru a afișa fundalul cardului:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Apoi putem folosi aceste două view-uri în `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

După rulare, poți vedea că `CardView` și `AuthorView` sunt combinate și afișate împreună:

![xcode](../../../Resource/027_view11.png)

În acest rezultat, `CardView` acționează ca fundal, iar `AuthorView` este afișat deasupra. Aceasta se întâmplă deoarece ele sunt plasate într-un `ZStack`.

În `ContentView`, folosim aceste două view-uri prin `CardView()` și `AuthorView()`. `()` de după nume înseamnă crearea și folosirea acestui view.

Acesta este un caz frecvent de imbricare a view-urilor în SwiftUI: în interiorul unui view, poți continua să folosești alte view-uri.

## Fișierul de intrare

La final, să revedem de unde începe aplicația să afișeze interfața.

Într-un proiect SwiftUI, există de obicei un fișier de intrare:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Aici, `@main` înseamnă că acesta este punctul de intrare al aplicației.

În interiorul `WindowGroup`, vedem:

```swift
ContentView()
```

Acest lucru înseamnă că, după pornirea aplicației, se afișează mai întâi `ContentView`.

Apoi, în interiorul `ContentView`, se afișează și:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Astfel, ierarhia view-urilor poate fi înțeleasă astfel:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Dacă schimbăm view-ul afișat în fișierul de intrare în `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Atunci, după pornirea aplicației, se va afișa doar `CardView`.

Cu alte cuvinte, `WindowGroup` din codul de intrare decide ce view este afișat primul după pornirea aplicației.

Iar în interiorul acelui view, se pot afișa în continuare alte view-uri.

## Rezumat

În această lecție, am învățat operațiile frecvente de gestionare a fișierelor în Xcode.

Am învățat cum să creăm fișiere SwiftUI, cum să redenumim fișiere, cum să creăm foldere și cum să ștergem fișiere.

În același timp, am învățat și un concept important: view-urile SwiftUI pot fi împărțite în fișiere diferite, apoi folosite în alte view-uri.

De exemplu:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Aici, `CardView()` și `AuthorView()` sunt alte view-uri folosite în interiorul `ContentView`.

În final, am revizuit și logica de afișare a fișierului de intrare.

Când aplicația pornește, intră mai întâi în codul de intrare marcat cu `@main`, apoi afișează view-ul din `WindowGroup`.

Acest lucru ne ajută să înțelegem că fișierele SwiftUI diferite nu sunt izolate unele de altele. Ele pot fi combinate între ele și, în cele din urmă, pot forma o interfață completă de aplicație.
