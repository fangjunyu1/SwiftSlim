# View personalizat

În această lecție, vom învăța un mod foarte important de scriere în SwiftUI: **View personalizat**.

Un View personalizat poate încapsula un fragment repetitiv de cod pentru interfață și îl poate transforma într-un View care poate fi reutilizat.

În dezvoltarea reală a unei App, întâlnim des această situație: structura multor ecrane este aceeași, dar conținutul afișat este diferit.

De exemplu, într-o listă de postări de pe un forum, fiecare postare poate avea un titlu, o imagine, un număr de aprecieri și alte informații.

![Reddit](../../../Resource/028_view1.png)

Într-o listă de produse de pe un site de cumpărături, fiecare produs poate avea o imagine, un nume, un preț și alte informații.

![Amazon](../../../Resource/028_view2.png)

Structura acestor elemente este asemănătoare; diferența constă doar în datele afișate.

Dacă scriem manual codul pentru fiecare element, codul va deveni foarte lung și nu va fi convenabil de modificat ulterior.

Prin urmare, putem încapsula structura comună într-un View personalizat, apoi putem transmite conținutul diferit ca parametri.

Astfel, același View poate afișa conținut diferit.

## Scenariul cerinței

De exemplu, acum vrem să creăm o listă de setări.

Rezultatul afișării:

![view](../../../Resource/028_view.png)

În această listă de setări există trei elemente diferite: `Setări`, `Dosar`, `Muzică`.

Deși pictogramele, culorile și titlurile lor sunt diferite, structura generală este aceeași:

- Pictogramă în partea stângă
- Culoarea fundalului pictogramei
- Titlu în mijloc
- Săgeată în partea dreaptă

Dacă nu folosim un View personalizat, am putea scrie astfel:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Setări")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Dosar")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Muzică")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Acest cod poate fi afișat normal, dar problema este și ea foarte evidentă: codul celor trei elemente de setări este aproape complet identic.

Diferențele sunt doar pictograma, culoarea și titlul:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Setări")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Dosar")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Muzică")
```

Cu alte cuvinte, structura fiecărui element de setări este fixă; doar pictograma, culoarea și titlul sunt diferite.

Această situație este foarte potrivită pentru folosirea unui View personalizat.

### Umbră shadow

Aici folosim un nou modificator, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` poate adăuga o umbră unui View.

`radius` indică raza de estompare a umbrei. Cu cât valoarea este mai mare, de obicei zona de răspândire a umbrei este mai mare, iar aspectul ei este mai moale.

Aici este setat la `1`, ceea ce înseamnă că adăugăm doar un efect de umbră foarte subtil.

## Încapsularea View-ului pentru elementul de setări

În continuare, încapsulăm fiecare element de setări într-un View nou.

Putem crea un `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

În acest View, definim trei proprietăți:

```swift
let icon: String
let color: Color
let title: String
```

Dintre acestea:

- `icon` reprezintă numele pictogramei
- `color` reprezintă culoarea fundalului pictogramei
- `title` reprezintă titlul elementului de setări

Deoarece aceste trei conținuturi sunt diferite în elemente de setări diferite, le transformăm în parametri care pot fi transmiși din exterior.

## Folosirea unui View personalizat

După ce avem `SettingItemView`, nu mai trebuie să scriem repetat un bloc mare de cod `HStack`.

Acum îl putem folosi astfel:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Setări")
```

Această linie de cod înseamnă crearea unui View pentru un element de setări și transmiterea a trei parametri:

```swift
icon: "gear"
color: Color.blue
title: "Setări"
```

După transmitere, proprietățile din interiorul `SettingItemView` vor primi valorile corespunzătoare:

- valoarea lui `icon` este `gear`
- valoarea lui `color` este `Color.blue`
- valoarea lui `title` este `"Setări"`

Prin urmare, în interiorul View-ului, `Image(systemName: icon)` va afișa pictograma rotiță, `.background(color)` va folosi un fundal albastru, iar `Text(title)` va afișa `Setări`.

Cod complet:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Setări")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Dosar")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Muzică")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Rezultatul afișării:

![view](../../../Resource/028_view.png)

Putem vedea că, după încapsulare, rezultatul afișării este același ca înainte, dar codul a devenit mai clar.

Înainte, pentru fiecare element de setări trebuia scris un întreg bloc `HStack`; acum este suficientă o singură linie de cod:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Setări")
```

Acesta este rolul unui View personalizat: **să încapsuleze structura repetitivă a unui View și să transmită doar conținutul diferit ca parametri.**

## De ce putem transmite parametri

În continuare, să înțelegem pe scurt de ce un View personalizat poate primi parametri.

În SwiftUI, un View este în esență o structură.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        Text("Salut, lume!")
    }
}
```

Aici `ContentView` este o structură.

Când scriem:

```swift
ContentView()
```

de fapt creăm un View `ContentView`.

Parantezele `()` de la final indică apelarea metodei sale de inițializare; se poate înțelege și ca procesul de creare a acestui View.

Deoarece acest `ContentView` nu are proprietăți care trebuie transmise din exterior, putem scrie direct:

```swift
ContentView()
```

Dar dacă în View există o proprietate fără valoare, atunci la crearea View-ului trebuie să transmitem valoarea corespunzătoare.

De exemplu:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nume: \(name)")
    }
}
```

Aici `name` este o proprietate și nu are valoare implicită.

Prin urmare, când creăm `ContentView`, trebuie să oferim o valoare concretă pentru `name`:

```swift
ContentView(name: "Fang Junyu")
```

Astfel, View-ul poate folosi această valoare în interior:

```swift
Text("nume: \(name)")
```

Acesta este și motivul pentru care trebuie să transmitem parametri când creăm `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Setări")
```

Pentru că în `SettingItemView` există trei proprietăți fără valori implicite:

```swift
let icon: String
let color: Color
let title: String
```

Prin urmare, când creăm acest View, trebuie să le transmitem în interior. Parametrii transmiși vor fi folosiți de Swift pentru a atribui valori proprietăților din interiorul View-ului.

## Metoda de inițializare

În continuare, să înțelegem puțin mai profund metoda de inițializare.

### Metoda de inițializare implicită

Când definim un View obișnuit:

```swift
struct ContentView: View {
    var body: some View {
        Text("Salut, lume!")
    }
}
```

În acest cod, nu am scris manual o metodă de inițializare.

Dar când folosim acest View, putem scrie astfel:

```swift
ContentView()
```

Aici `()` înseamnă, de fapt, crearea lui `ContentView`; se poate înțelege și ca apelarea metodei sale de inițializare.

### De ce o putem apela chiar dacă nu există o metodă de inițializare vizibilă?

Pentru că Swift compiler generează automat o metodă de inițializare pentru noi.

Trebuie observat că: **această metodă de inițializare este generată automat, iar de obicei nu o vedem direct în cod.**

Cu alte cuvinte, deși nu am scris manual în `struct`:

```swift
init() {

}
```

Swift compiler va genera în spate pentru noi o metodă de inițializare aproximativ ca aceasta:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Salut, lume!")
    }
}
```

Acesta este motivul pentru care putem scrie direct:

```swift
ContentView()
```

Prin urmare, în codul real, de obicei nu trebuie să scriem manual metoda de inițializare.

Trebuie doar să înțelegem un lucru: **când creăm un SwiftUI View, se apelează metoda de inițializare a acelui View. Chiar dacă nu scriem manual metoda de inițializare, Swift o poate genera automat pentru noi.**

### Metoda de inițializare cu parametri

Dacă într-un View există o proprietate fără valoare implicită, de exemplu:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nume: \(name)")
    }
}
```

Swift compiler va genera automat, pe baza proprietății, o metodă de inițializare cu parametru.

O putem înțelege simplu astfel:

```swift
init(name: String) {
    self.name = name
}
```

Aici:

```swift
init(name: String)
```

înseamnă că, atunci când creăm `ContentView`, trebuie să transmitem un parametru `name` de tip `String`.

Când scriem:

```swift
ContentView(name: "Fang Junyu")
```

înseamnă: transmite `"Fang Junyu"` ca parametru către metoda de inițializare.

Apoi, în interiorul metodei de inițializare se va executa:

```swift
self.name = name
```

Această linie de cod înseamnă: atribuie `name`, transmis din exterior, propriei proprietăți `name` a View-ului curent.

Putem înțelege simplu astfel:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nume: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Astfel, View-ul poate folosi în interior valoarea transmisă.

Acesta este fluxul de inițializare al unui View cu parametri: **când o proprietate din View nu are valoare implicită, la crearea View-ului trebuie transmis parametrul corespunzător, pentru ca metoda de inițializare să finalizeze atribuirea valorii proprietății.**

## Cazul în care proprietatea are o valoare implicită

Dacă proprietatea are deja o valoare implicită, atunci la crearea View-ului putem să nu transmitem parametrul.

De exemplu:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nume: \(name)")
    }
}
```

Aici `name` are deja o valoare implicită:

```swift
"Fang Junyu"
```

Prin urmare, când creăm `ContentView`, putem scrie direct:

```swift
ContentView()
```

În acest moment, `name` va folosi valoarea implicită, iar interfața va afișa:

```swift
nume: Fang Junyu
```

Desigur, putem transmite și o valoare nouă la crearea View-ului:

```swift
ContentView(name: "Sam")
```

În acest moment, View-ul va folosi `"Sam"` transmis din exterior, nu valoarea implicită, iar interfața va afișa:

```swift
nume: Sam
```

Pentru a înțelege mai ușor, putem privi metoda de inițializare generată automat de Swift compiler aproximativ astfel:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Aici `name: String = "Fang Junyu"` înseamnă: dacă la crearea View-ului nu se transmite `name`, se folosește valoarea implicită `"Fang Junyu"`; dacă la crearea View-ului se transmite un `name` nou, se folosește valoarea transmisă.

Cu alte cuvinte: **dacă nu se transmite un parametru din exterior, se folosește valoarea implicită a proprietății; dacă se transmite un parametru din exterior, se folosește valoarea transmisă.**

## Revenim la SettingItemView

Acum să revenim la SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Structura acestui View este fixă.

Părțile fixe includ:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Părțile diferite includ:

```swift
icon
color
title
```

Prin urmare, transformăm conținutul diferit în proprietăți și îl transmitem ca parametri atunci când creăm View-ul.

Când creăm elemente de setări diferite, trebuie doar să transmitem parametri diferiți:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Setări")
SettingItemView(icon: "folder", color: Color.brown, title: "Dosar")
SettingItemView(icon: "music.note", color: Color.purple, title: "Muzică")
```

Astfel, același `SettingItemView` poate afișa trei elemente de setări diferite.

Acesta este cel mai frecvent mod de folosire a unui View personalizat.

## Rezumat

În această lecție, am învățat despre View personalizat.

Rolul principal al unui View personalizat este: **să încapsuleze codul repetitiv al interfeței, astfel încât acesta să poată fi reutilizat.**

În acest exemplu, structura celor trei elemente de setări este aceeași; doar pictograma, culoarea și titlul sunt diferite.

Prin urmare, am creat un `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Apoi, când folosim acest View, transmitem parametri diferiți:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Setări")
```

Parametrii de aici intră în `SettingItemView`.

Prin această metodă, putem folosi mai puțin cod pentru a crea View-uri cu aceeași structură, dar cu conținut diferit.

Acesta este și un mod de scriere foarte frecvent în dezvoltarea SwiftUI.
