# Variabile și constante

În această lecție vom învăța în principal despre variabilele și constantele din Swift și vom face cunoștință cu câteva tipuri de date uzuale și operatori de bază.

Aceste conținuturi reprezintă cele mai fundamentale cunoștințe din programare și sunt, de asemenea, o bază importantă pentru studiul ulterior al SwiftUI.

## Variabile și constante în viața de zi cu zi

Putem înțelege variabilele și constantele prin lucrurile din viața de zi cu zi.

Variabile din viața de zi cu zi:

- Conținutul fiecărui program de la televizor este diferit
- Vremea din fiecare zi este diferită
- Ceasul se schimbă în fiecare secundă

Caracteristica comună a acestor lucruri este: ele se schimbă.

Dacă televizorul ar avea mereu o singură imagine, vremea ar fi mereu senină, iar acele ceasului nu s-ar mișca niciodată, atunci aceste lucruri ar fi constante.

Unul se poate schimba, iar celălalt nu se schimbă.

## Înțelegerea variabilelor și constantelor

În dezvoltarea de aplicații, de obicei este nevoie ca utilizatorul să completeze sau să salveze anumite informații.

De exemplu:

- numele contului
- data nașterii
- datele de contact
- adresa

Aceste informații vor fi salvate și afișate.

De exemplu, utilizatorul introduce un nume în aplicație:

```

FangJunyu

```

Trebuie să salvăm acest nume, astfel încât să îl putem afișa în aplicație.

Putem înțelege simplificat procesul de salvare astfel: punem ceva într-un sertar.

Când salvăm un nume, este ca și cum am pune acel nume într-un sertar.

Lucrurile care trebuie salvate pot fi multe, iar sertarele pot fi și ele multe. Pentru a ști ce conține fiecare sertar, trebuie să dăm fiecărui sertar un nume.

De exemplu:

```

name

```

În acest exemplu, name este numele, iar FangJunyu este informația salvată.

![Var](../../RESOURCE/007_var.png)

**În Swift, dacă trebuie să salvăm date, trebuie neapărat să folosim o variabilă (`var`) sau o constantă (`let`) pentru declarare.**

Deoarece numele poate fi, de regulă, modificat, ar trebui să folosim o variabilă.

```swift
var name = "FangJunyu"
```

Aici este declarată o variabilă numită name, al cărei tip este String, iar valoarea este "FangJunyu".

### Diferența dintre variabile și constante

Variabilele se declară cu var:

```swift
var
```

Constantele se declară cu let:

```swift
let
```

De exemplu:

```swift
var name = "FangJunyu"
let id = 123456
```

Dacă este declarată ca variabilă, înseamnă că această valoare poate fi modificată; dacă este declarată ca o constantă, atunci nu mai poate fi modificată.

Prin urmare, principala diferență dintre variabile și constante este: dacă valoarea poate fi schimbată sau nu.

### Modificarea unei constante

Dacă un cod încearcă să modifice valoarea unei constante:

```swift
let name = "Sam"
name = "Bob"
```

Swift va afișa un mesaj că atribuirea nu poate fi făcută, deoarece este o constantă.

```
Cannot assign to property: 'name' is a 'let' constant
```

Acest mecanism îl poate ajuta pe dezvoltator să evite ca anumite date importante să fie modificate accidental.

### Afișarea în SwiftUI

Deschide fișierul ContentView.swift și declară o variabilă în interiorul View:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Aici a fost declarată o variabilă numită name și a fost afișată în interfață prin Text.

Dacă modificăm conținutul variabilei:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Și textul afișat de Text se va schimba.

Prin această metodă, putem folosi variabile pentru a controla conținutul afișat în interfață, fără să modificăm direct textul din Text de fiecare dată.

Dacă în altă parte este nevoie de această informație, putem transmite și variabila mai departe, echivalent cu a oferi altui loc conținutul din „sertar”.

### Poziția variabilelor și constantelor în SwiftUI

În SwiftUI, variabilele și constantele se scriu de obicei în afara lui body:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Desigur, variabilele și constantele pot fi scrise și în interiorul lui body:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Totuși, între cele două există o diferență importantă:

* Dacă variabilele și constantele sunt scrise în interiorul lui body, ele vor fi recreate de fiecare dată când view-ul este recalculat.
* Dacă sunt scrise în afara lui body, ele vor exista ca proprietăți ale structurii view, iar structura codului va fi mai clară.

De aceea, în dezvoltarea reală, variabilele și constantele sunt, de obicei, scrise în afara lui body.

## Tipuri de date

Variabilele pot salva multe tipuri diferite de date, iar aceste tipuri se numesc tipuri de date.

De exemplu, anterior am folosit Text pentru a afișa text:

```swift
Text("Hello, World")
```

Aici, "Hello, World" aparține tipului String.

String este folosit pentru a reprezenta conținut text, iar în Swift trebuie încadrat între ghilimele duble "".

De exemplu:

```swift
var hello = "Hello, World"
```

Pe lângă string, în Swift există și multe alte tipuri de date.

În etapa de început, cele mai frecvente patru tipuri sunt:

* String
* Int
* Double
* Bool

Aceste patru tipuri pot acoperi majoritatea prelucrărilor de date de bază.

**String**

String reprezintă conținut text, de exemplu:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

String este folosit de obicei pentru: nume de utilizator, titluri, conținut text.

**Int**

Int reprezintă numere întregi, adică numere fără zecimale.

De exemplu:

```swift
var age = 26
var count = 100
```

Numerele întregi sunt folosite de obicei pentru: vârstă, cantitate, numărare.

**Double**

Double reprezintă numere cu zecimale.

De exemplu:

```swift
var weight = 74.5
var height = 185.0
```

În Swift, numerele zecimale folosesc de obicei implicit tipul Double.

Mai există un tip asemănător numit Float, dar acesta poate reprezenta un interval numeric mai mic, de aceea în dezvoltarea practică se folosește mai des Double.

**Bool**

Tipul Bool este folosit pentru a reprezenta două stări: true și false.

De exemplu:

```swift
var isShowAlert = true
var isLogin = false
```

Tipul Bool este adesea folosit în condiții. De exemplu, dacă trebuie afișat sau nu un mesaj de alertă.

Pentru situațiile care au doar două rezultate, Bool este foarte potrivit.

### Afișarea în SwiftUI

Când afișăm un String, putem folosi direct Text:

```swift
Text(name)
```

Dar tipurile Int, Double și altele similare nu sunt string-uri, deci nu pot fi folosite direct ca parte a conținutului text.

Dacă trebuie să afișăm aceste date în Text, putem folosi interpolarea de string (String Interpolation):

```swift
\()
```

Interpolarea de string trebuie scrisă în interiorul conținutului unui string și folosește \() pentru a încadra variabila sau constanta.

De exemplu:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

În codul de mai sus, "" reprezintă un string, iar \() este folosit pentru a insera o variabilă sau o constantă în string.

De exemplu:

```swift
"DoubleNum: \(num * 2)"
```

Conținutul afișat va fi:

```swift
DoubleNum: 2
```

Prin această metodă, putem insera variabile sau constante într-un string și apoi le putem afișa cu Text.

Notă: \() poate fi folosit doar în interiorul unui string "".

## Operatori

Când declarăm o variabilă sau o constantă, putem vedea următoarea scriere:

```swift
var num = 1
```

Aici, = se numește operator de atribuire.

Rolul lui este: să atribuie valoarea din dreapta variabilei din stânga.

În acest exemplu, 1 este atribuit variabilei num.

Pe lângă operatorul de atribuire, mai există și câțiva operatori aritmetici uzuali:

* `+`
* `-`
* `*`
* `/`

Atunci când facem calcule cu numere, de exemplu cu date de tip Int sau Double, vom folosi acești operatori.

De exemplu:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

După efectuarea operației, rezultatul va fi salvat în variabilă.

## Rezumat

Variabilele, constantele și operatorii sunt cele mai fundamentale concepte din programare.

Prin variabile și constante, putem salva diferite tipuri de date în program; prin tipurile de date, putem clarifica natura datelor; iar prin operatori, putem calcula și prelucra aceste date.

Aceste cunoștințe sunt ca instrumentele de bază ale lumii programării. Stăpânirea lor poate pune o fundație solidă pentru studiul ulterior al Swift și SwiftUI.
