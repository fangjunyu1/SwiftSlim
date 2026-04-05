# Vizualizare de autentificare

În această lecție, vom învăța un scenariu foarte practic: vizualizarea de autentificare.

Fie că este vorba de un site web sau de o aplicație, în multe situații, în timpul utilizării, utilizatorul trebuie să se autentifice cu contul și parola.

De exemplu, pagina de autentificare GitHub:

![WordPress](../../Resource/019_github.png)

În această lecție, vom crea o vizualizare de autentificare similară, astfel încât utilizatorul să poată introduce manual contul și parola și să verifice dacă există probleme în conținutul introdus.

## Aspectul de sus

Vom scrie codul pentru vizualizarea de autentificare în fișierul `ContentView`.

Mai întâi, vom crea zona de identificare din partea de sus a vizualizării de autentificare. Poți pregăti mai întâi o imagine de pictogramă potrivită și să o pui în folderul `Assets`.

![icon](../../Resource/019_icon1.png)

Apoi, folosește `Image` și modificatori pentru a afișa imaginea:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Acești modificatori înseamnă:

- `resizable()`: permite redimensionarea imaginii.
- `scaledToFit()`: scalează imaginea păstrând proporția originală.
- `frame(width: 100)`: setează lățimea afișată a imaginii la `100`.

În continuare, folosește `Text` și modificatori pentru a afișa titlul de autentificare:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Apoi, folosește `VStack` pentru a aranja imaginea și textul pe verticală:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Efectul obținut:

![view](../../Resource/019_view.png)

Până aici, am finalizat zona de titlu din partea de sus a vizualizării de autentificare.

### Optimizarea aspectului

Acum, imaginea și titlul sunt poziționate implicit în zona centrală a întregului aspect.

Dacă vrem să arate mai mult ca un „semn de autentificare în partea de sus a paginii”, putem folosi `Spacer()` pentru a umple spațiul rămas, astfel încât conținutul să apară mai aproape de partea de sus.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Efectul obținut:

![view](../../Resource/019_view1.png)

Totuși, acum `Image` și `Text` sunt prea aproape de partea de sus a ecranului și par puțin înghesuite.

În acest moment, putem folosi `padding` pentru a adăuga spațiu în partea de sus pentru întregul `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Efectul obținut:

![view](../../Resource/019_view2.png)

Astfel, zona de titlu din partea de sus a paginii arată mai potrivit.

## Nume de utilizator și parolă

Pagina de autentificare cere de obicei utilizatorului să introducă numele de utilizator și parola.

În SwiftUI, putem folosi `TextField` pentru a primi conținutul introdus de utilizator.

Dar trebuie remarcat: `TextField` nu păstrează singur datele introduse pe termen lung, este doar un control de introducere. Ceea ce păstrează cu adevărat aceste date sunt variabilele pe care le legăm de el.

Prin urmare, trebuie mai întâi să creăm două variabile `@State` pentru a păstra numele de utilizator și parola:

```swift
@State private var user = ""
@State private var password = ""
```

Când valoarea unei variabile `@State` se schimbă, SwiftUI reîmprospătează automat vizualizarea asociată.

În continuare, folosește `TextField` pentru a lega aceste două variabile:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Aici, `$user` și `$password` înseamnă „binding”.

Adică, atunci când utilizatorul scrie în câmpul de introducere, variabila se schimbă sincron; iar când variabila se schimbă, conținutul afișat în câmp se modifică și el sincron.

Această relație în care „vizualizarea și datele se sincronizează reciproc” se numește binding.

Observă că aici trebuie să folosim scrierea cu `$`:

```swift
$user
```

Pentru că `TextField` nu are nevoie de un șir obișnuit, ci de o valoare de binding care „poate modifica datele în ambele direcții”.

### Afișarea câmpurilor de introducere

Să le punem în `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efectul afișării:

![view](../../Resource/019_view3.png)

Pentru că acum `user` și `password` sunt implicit șiruri goale:

```swift
""
```

Câmpul de introducere va afișa mai întâi textul placeholder, de exemplu:

```swift
input user
```

Acest text doar îi indică utilizatorului „ce ar trebui introdus aici”, nu este conținutul introdus propriu-zis.

### Optimizarea câmpurilor de introducere

Acum câmpurile de introducere pot fi deja folosite, dar stilul implicit este destul de simplu.

Pentru a face interfața mai clară, putem adăuga un titlu înaintea câmpului și putem face o mică optimizare de stil chiar câmpului de introducere.

De exemplu, adaugă mai întâi un titlu:

```swift
Text("Username")
    .fontWeight(.bold)
```

Apoi, folosește `HStack` pentru a pune titlul și câmpul de introducere pe aceeași linie:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Aici folosim `HStack` pentru că vrem „titlul în stânga și câmpul de introducere în dreapta”.

Trebuie remarcat că `TextField` ocupă implicit spațiul disponibil rămas.

![color](../../Resource/019_view6.png)

Pentru ca dimensiunea celor două câmpuri de introducere să fie mai uniformă, putem folosi `frame(width:)` pentru a seta o lățime, astfel încât câmpurile să arate mai ordonat.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Apoi adaugă o margine pentru ca câmpul de introducere să fie mai evident:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Acum adăugăm atât numele de utilizator, cât și parola în vizualizarea `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Efectul afișării:

![view](../../Resource/019_view4.png)

Până în acest moment, utilizatorul poate introduce numele de utilizator și parola.

## Butonul de autentificare

Mai jos, vom adăuga un buton de autentificare sub câmpurile de introducere.

```swift
Button("Sign in") {

}
```

Apoi, folosește `buttonStyle` pentru a da butonului un stil de sistem mai evident:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Efectul afișării:

![view](../../Resource/019_view5.png)

Pentru a confirma dacă butonul răspunde într-adevăr la apăsare, putem mai întâi să scriem un `print` în buton pentru test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Când apeși butonul, consola va afișa:

```swift
click Sign in
```

Acest lucru arată că butonul a răspuns deja cu succes la apăsare.

## Logica de autentificare

Acum adăugăm butonului de autentificare cea mai de bază logică de validare: **verificarea dacă utilizatorul a introdus numele de utilizator și parola**.

Vrem să realizăm următoarele situații:

- Dacă utilizatorul nu a introdus nimic, afișăm `Empty`
- Dacă utilizatorul a introdus doar unul dintre câmpuri, indicăm ce lipsește
- Dacă au fost introduse atât numele de utilizator, cât și parola, afișăm `Success`

### Nu a fost introdusă nicio informație

Pentru că `user` și `password` sunt implicit șiruri goale:

```swift
@State private var user = ""
@State private var password = ""
```

Atunci când utilizatorul nu introduce nimic, ele rămân goale.

În Swift, tipuri precum `String` pot folosi `isEmpty` pentru a verifica dacă un conținut este gol.

### Proprietatea isEmpty

`isEmpty` este folosit frecvent pentru a verifica dacă șirurile, tablourile și alte tipuri de conținut sunt goale.

De exemplu:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Dacă un conținut este gol, `isEmpty` returnează `true`; dacă nu este gol, `isEmpty` returnează `false`.

Prin urmare, îl putem folosi pentru a verifica dacă numele de utilizator și parola au fost introduse.

### Folosirea lui isEmpty pentru a verifica variabile

Dacă utilizatorul nu a introdus nicio informație, atunci:

```swift
user.isEmpty // true
password.isEmpty    // true
```

În acest moment, putem scrie condiția astfel:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Acest cod înseamnă: dacă `user` este gol și `password` este de asemenea gol, atunci afișează:

```swift
Empty
```

Aici, `&&` este un operator logic și înseamnă „și”.

Adică, doar atunci când condiția din stânga este adevărată și condiția din dreapta este adevărată, întreaga condiție este adevărată.

Prin urmare, acest cod va fi executat doar când atât numele de utilizator, cât și parola sunt goale.

## Utilizatorul a completat doar o parte

În continuare, să luăm în considerare o altă situație: utilizatorul a completat doar numele de utilizator sau doar parola.

De exemplu:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

În acest moment, numele de utilizator nu este gol, dar parola este goală.

Putem continua să folosim `isEmpty` pentru a verifica:

### Situația în care utilizatorul a completat contul sau parola

Dacă utilizatorul a completat doar numele de utilizator sau parola, trebuie să oferim mesajul corespunzător despre ceea ce lipsește.

De exemplu, dacă utilizatorul a completat doar numele de utilizator:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logica acestui cod este: dacă numele de utilizator este gol, cere completarea numelui de utilizator. În caz contrar, verifică dacă parola este goală; dacă este goală, cere completarea parolei.

### Utilizatorul a completat toate informațiile

Dacă atât numele de utilizator, cât și parola au fost deja introduse, atunci `isEmpty` pentru ambele va returna `false`.

În acest caz, putem scrie astfel:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Aici, `!` înseamnă „negație”.

De exemplu:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Adică, `user.isEmpty` este folosit pentru a verifica „dacă numele de utilizator este gol”, iar `!user.isEmpty` este folosit pentru a verifica „dacă numele de utilizator nu este gol”.

Pentru parolă logica este aceeași.

Prin urmare, sensul acestui cod este: numele de utilizator nu este gol, iar parola nu este nici ea goală.

Când aceste două condiții sunt îndeplinite, se afișează:

```swift
Success
```

## Logica completă de validare

Acum combinăm aceste trei situații și le scriem în `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Ordinea de execuție a acestui cod poate fi înțeleasă astfel:

Primul pas este să verificăm mai întâi:

```swift
if user.isEmpty && password.isEmpty
```

Dacă atât numele de utilizator, cât și parola sunt goale, se afișează direct `Empty`.

Dacă ambele nu sunt goale, continuăm să verificăm următoarea linie:

```swift
else if user.isEmpty || password.isEmpty
```

Aici, `||` înseamnă „sau”.

Adică, atât timp cât una dintre condiții este îndeplinită, întreaga condiție este îndeplinită.

Prin urmare, atât timp cât numele de utilizator este gol sau parola este goală, va fi executat blocul de cod din `else if`.

După ce intrăm în blocul de cod, verificăm mai departe exact care câmp nu a fost completat:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Dacă primele două condiții nu sunt îndeplinite, înseamnă că numele de utilizator nu este gol și nici parola nu este goală.

Atunci programul va intra în ultimul `else`:

```swift
print("Success")
```

Astfel, am finalizat cea mai de bază logică de validare a introducerii pentru autentificare.

## Verificarea numelui de utilizator și a parolei

Logica de mai sus verifică doar „dacă a fost introdus conținut”.

Dar într-o aplicație reală, simpla introducere a conținutului nu este suficientă. De obicei, este nevoie și să trimitem numele de utilizator și parola către server pentru verificare.

Dacă serverul confirmă că numele de utilizator există și parola este corectă, autentificarea este permisă; altfel, se afișează un eșec de autentificare.

Pentru a exersa acest proces, putem seta mai întâi în cod un cont și o parolă temporare, pentru a simula „informațiile corecte de autentificare”:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Când atât numele de utilizator, cât și parola nu sunt goale, le comparăm mai departe pentru a vedea dacă sunt corecte:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Aici, `==` înseamnă „dacă sunt egale”.

De exemplu:

```swift
user == userID
```

Adică, dacă numele de utilizator introdus de utilizator este exact același cu numele de utilizator corect pe care l-am setat; pentru parolă, logica este aceeași.

Prin urmare, atunci când numele de utilizator și parola introduse sunt egale cu valorile setate, se afișează `Success`; dacă unul dintre ele nu este egal, se afișează `Input error`.

Astfel, am finalizat o simplă „verificare simulată a autentificării”.

Deși încă nu este o funcție reală de autentificare conectată la server, este deja suficientă pentru a ne ajuta să înțelegem: **după apăsarea butonului, se poate executa cod diferit în funcție de condiții diferite**.

## Rezumat

În această lecție, am finalizat o vizualizare de autentificare de bază și am învățat în special „logica de a evalua conținutul introdus pe baza condițiilor”.

Conținutul de bază al acestei lecții este: folosirea lui `isEmpty` pentru a verifica dacă un șir este gol, precum și folosirea instrucțiunilor `if` împreună cu operatori logici pentru a gestiona situații diferite.

Doi operatori logici foarte importanți sunt:

- `&&`: înseamnă „și”, ambele condiții trebuie îndeplinite
- `||`: înseamnă „sau”, este suficient să fie îndeplinită una dintre condiții

Atunci când aceste condiții devin în final `true` sau `false`, instrucțiunea `if` va executa cod diferit în funcție de rezultat.

Prin această vizualizare de autentificare, am început deja să intrăm în contact cu o metodă de dezvoltare care combină „interfață + date + judecată logică”.

## Cod complet

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
