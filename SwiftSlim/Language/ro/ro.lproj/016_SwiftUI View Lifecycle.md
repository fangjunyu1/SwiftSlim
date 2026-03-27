# Ciclul de viață al vizualizărilor în SwiftUI

În lecția anterioară, am aflat că variabilele @State urmează ciclul de viață al vizualizării și am învățat, de asemenea, utilizarea de bază a lui onAppear.

În această lecție, vom înțelege mai profund ciclul de viață al vizualizărilor SwiftUI, vom vedea cum sunt create și afișate vizualizările, precum și cum sunt create și recreate variabilele din vizualizare. În plus, vom învăța onAppear, onDisappear și constructorul init.

Pe baza acestor cunoștințe, vom construi o înțelegere generală a întregului proces de construire al unei vizualizări în SwiftUI.

## Ordinea de pornire a aplicației

Când creezi un proiect iOS, Xcode generează implicit două fișiere:

```
ContentView.swift
ProjectName + App.swift
````

Dintre acestea, „ProjectName + App”.swift este fișierul de intrare al întregii aplicații.

De exemplu:

```swift id="ro1"
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
````

### Fluxul de execuție al codului

Când rulăm aplicația (în simulator sau pe dispozitiv real), sistemul caută mai întâi cuvântul-cheie @main:

```swift id="ro2"
@main
struct SwiftSlimTestApp: App {...}
```

După ce confirmă fișierul de intrare, începe execuția codului.

Mai întâi intră în structura App, execută codul din body, apoi creează WindowGroup și încarcă în el ContentView.

### Rolul lui WindowGroup

WindowGroup este folosit pentru a gestiona ferestrele:

```swift id="ro3"
WindowGroup {
    ContentView()
}
```

Pe iPad și macOS, sistemul suportă ferestre multiple, în timp ce pe iPhone există de obicei o singură fereastră.

Prin urmare, pe iPhone, WindowGroup gestionează în principal primul ecran afișat.

### Procesul de încărcare al vizualizării

După ce sistemul găsește ContentView:

```swift id="ro4"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI execută codul din body, apoi construiește interfața pe baza structurii de vizualizare returnate (cum ar fi VStack, Text etc.) și o afișează pe ecran.

După finalizarea acestor pași, putem vedea ContentView în vizualizare.

![ContentView](../../Resource/016_view1.png)

Trebuie observat că rolul lui body este să genereze vizualizarea, nu să o stocheze.

Asta înseamnă că, de fiecare dată când vizualizarea se reîmprospătează, SwiftUI recalculează body și generează o nouă structură de vizualizare.

### Logica vizualizării de previzualizare

Previzualizarea Xcode (Canvas) și rularea reală sunt două mecanisme diferite.

De exemplu, putem adăuga un mesaj de depanare în fișierul de intrare:

```swift id="ro5"
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Atunci când previzualizăm ContentView în Xcode, execuția nu începe de la intrarea @main, deci onAppear din fișierul de intrare nu va fi declanșat.

Dar, dacă rulăm aplicația în simulator sau pe un dispozitiv fizic, sistemul va porni de la @main, va executa întregul flux al aplicației și va declanșa onAppear din intrare, afișând mesajul de depanare.

Cheia este că previzualizarea Xcode este doar o „randare locală”, folosită doar pentru a afișa vizualizarea curentă; simulatorul și dispozitivul fizic oferă un „mediu complet de execuție” și vor executa întreaga aplicație.

Prin urmare, atunci când testăm funcționalitatea aplicației, trebuie să ne bazăm pe simulator sau pe dispozitivul real. Previzualizarea Xcode nu poate oferi un mediu complet de rulare.

## Ciclul de viață al vizualizării

În etapa actuală, tot codul nostru este concentrat în ContentView. Dar într-o aplicație reală, o aplicație conține de obicei mai multe vizualizări care sunt schimbate în diferite scenarii.

De exemplu, în „Pușculiță”:

![PiggyBank](../../Resource/016_view.png)

Când apăsăm „Save”, este afișată vizualizarea SaveView; când procesul de economisire se termină sau fereastra este închisă, SaveView este eliminată.

Acest proces reprezintă ciclul de viață al unei vizualizări: de la creare, la afișare, apoi la eliminare.

### Închiderea aplicației

Când aplicația este închisă, toate vizualizările sunt eliminate, iar stările asociate dispar și ele.

Prin urmare, ContentView și celelalte vizualizări sunt eliminate din memorie, iar întreaga stare de execuție a aplicației este ștearsă.

## Ciclul de viață al variabilelor din vizualizare

În SwiftUI, ciclul de viață al variabilelor este de obicei legat de vizualizare.

De exemplu:

```swift id="ro6"
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variabilele @State

Variabilele declarate cu @State sunt legate de ciclul de viață al vizualizării.

```swift id="ro7"
@State private var name = "FangJunyu"
```

Când vizualizarea este creată, este creat și name; când vizualizarea este eliminată, și name este distrus.

Acesta este motivul pentru care trebuie să folosim metode precum UserDefaults pentru persistența datelor.

### Variabilele din body

Variabilele definite în body:

```swift id="ro8"
var num = 10
```

Au ciclul de viață legat de procesul de execuție al lui body.

Când starea din SwiftUI se schimbă, de exemplu:

```swift id="ro9"
@State private var name = "FangJunyu"
name = "Hu"
```

Când name se modifică, @State detectează schimbarea datelor și notifică SwiftUI să recalculeze vizualizarea, iar body este recalculat.

Când body este recalculat, tot codul din body se execută din nou, iar variabilele din body (cum este num) sunt recreate.

Acesta este și motivul pentru care nu este recomandat să definim variabile complexe în body.

Pentru că, la fiecare reîmprospătare a vizualizării, variabilele din body sunt recreate, ceea ce crește costul de calcul și afectează performanța.

În SwiftUI, tipuri diferite de date trebuie gestionate în moduri diferite. Datele care trebuie să urmeze ciclul de viață al vizualizării pot fi salvate cu @State; datele temporare de calcul pot fi plasate în body.

## onAppear și onDisappear

În lecția anterioară, am învățat deja onAppear, care este apelat atunci când vizualizarea este afișată.

```swift id="ro10"
.onAppear {}
```

De exemplu:

```swift id="ro11"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

În previzualizarea Xcode sau la rulare, putem vedea ieșirea de depanare din onAppear.

### onDisappear

Corespondentul lui onAppear este onDisappear:

```swift id="ro12"
.onDisappear {}
```

Când vizualizarea este închisă, onDisappear va fi apelat.

De exemplu:

```swift id="ro13"
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Când vizualizarea este eliminată, codul din onDisappear va fi executat.

Notă: în etapa actuală, ContentView este vizualizarea rădăcină a aplicației și nu poate fi închisă sau eliminată direct. Prin urmare, în această etapă nu putem observa direct efectul de execuție al lui onDisappear.

Abia în lecțiile următoare, când vom învăța navigarea între pagini și deschiderea unor noi vizualizări, vom putea vedea apelarea lui onDisappear.

## Logica de creare și afișare

Trebuie observat că crearea și afișarea unei vizualizări sunt două etape diferite.

Când o vizualizare este creată, este apelat constructorul structurii:

```swift id="ro14"
init() {}
```

Pentru că vizualizările SwiftUI sunt structuri:

```swift id="ro15"
struct ContentView: View { ... }
```

Prin urmare, atunci când instanța vizualizării este creată, va fi executată metoda init. Abia când vizualizarea este afișată, va fi apelată metoda onAppear.

De exemplu:

```swift id="ro16"
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

În previzualizarea Xcode, putem vedea următorul output de depanare:

```swift id="ro17"
Create ContentView
Show ContentView
```

Aceasta arată că mai întâi se execută init pentru a crea vizualizarea, apoi se calculează codul din body, iar în final vizualizarea este afișată și este executată metoda onAppear.

Prin urmare, trebuie să înțelegem că etapele de creare și de afișare ale unei vizualizări sunt separate.

### Constructorul init

init este o sintaxă de bază în Swift. Atât struct, cât și class pot defini init, iar acesta este folosit pentru inițializarea obiectelor.

```swift id="ro18"
init() {}
```

În SwiftUI, atunci când o vizualizare este creată, sistemul apelează metoda init a vizualizării, care poate fi folosită pentru a primi parametri și pentru a inițializa date.

Dacă nu scriem manual un init, Swift va genera automat un constructor implicit pentru struct.

Pentru vizualizări SwiftUI precum ContentView, la crearea vizualizării se execută init, iar la afișarea vizualizării se execută onAppear.

Prin urmare, init este constructorul executat atunci când vizualizarea este creată și va fi util ulterior atunci când vom transmite parametri sau vom inițializa date.

## Rezumat

În această lecție am învățat ordinea de pornire a aplicației, de la fișierul de intrare până la fluxul de execuție al fișierului ContentView.

Am înțeles ciclul de viață al vizualizărilor SwiftUI: când vizualizarea este creată se execută init, când este afișată pe ecran se execută onAppear, iar când este eliminată sau închisă se execută onDisappear.

Am învățat și mecanismul de actualizare al vizualizării: vizualizarea este condusă de stare, iar când stări precum @State se modifică, SwiftUI reîmprospătează vizualizarea, recalculează body, iar variabilele din body sunt recreate.

Ciclul de viață al variabilelor este legat de ciclul de viață al vizualizării, iar variabilele temporare din body sunt recreate de fiecare dată când vizualizarea este reîmprospătată.

Înțelegerea acestor cicluri de viață și a comportamentului variabilelor ne ajută să organizăm mai bine codul și să facem logica aplicației mai clară.
