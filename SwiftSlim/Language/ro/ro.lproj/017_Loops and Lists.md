# Bucle și liste

În această lecție, vom învăța bucla `for` din Swift și `ForEach` din SwiftUI.

Ambele ne pot ajuta să citim pe rând elementele dintr-un array. În dezvoltarea reală, de multe ori trebuie să luăm un grup de date unul câte unul, apoi să le procesăm sau să le afișăm, iar bucla este exact un instrument important pentru a realiza această sarcină.

Când navigăm pe pagini web sau folosim o aplicație, vedem adesea multe liste sau elemente. Un astfel de conținut este de obicei stocat mai întâi într-un `array`, apoi este citit unul câte unul printr-o `buclă`, iar în final este afișat în interfață.

De exemplu, lista de rezultate Google:

![Google](../../Resource/017_google.png)

Fiecare element din lista de rezultate ale căutării corespunde de obicei unei date și este afișat unul câte unul printr-o buclă.

Prin urmare, `array` și `buclă` apar adesea împreună. `Array` este responsabil pentru stocarea unui grup de date, iar `bucla` este responsabilă pentru a lua aceste date în ordine și pentru a executa aceeași operație.

Mai jos, vom începe cu cea mai de bază buclă `for`.

## Numărătoare inversă

Să presupunem că vrem să simulăm o funcție de numărătoare inversă și să afișăm pe rând `„5、4、3、2、1”`.

Cea mai directă variantă este:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Deși această metodă poate simula funcția de numărătoare inversă, dacă există mult conținut, va părea foarte repetitivă, iar mai târziu nici nu va fi comod de modificat.

În acest moment, putem mai întâi să punem datele într-un array, apoi să folosim bucla `for` pentru a le afișa pe rând:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Această scriere este mai concisă și mai ușor de extins. Chiar dacă sunt multe numere în numărătoarea inversă, nu trebuie să scriem `print` linie cu linie în mod repetat; este suficient să lăsăm bucla să proceseze automat fiecare element din array.

Putem pune acest cod într-un buton pentru test:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Când se apasă butonul, bucla `for` va lua pe rând fiecare număr întreg din `countDown`, conform ordinii din array, și îl va afișa în consolă.

În continuare, să vedem cum funcționează bucla `for`.

## Bucla for

Bucla `for` este folosită pentru a procesa în ordine un grup de date. Cele mai comune obiecte sunt array-urile și intervalele.

Forma de bază:

```swift
for element in array sau interval {
    cod de executat
}
```

De exemplu, codul numărătorii inverse de mai sus:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Aici, `i` reprezintă elementul extras în acel moment, iar după `in` urmează datele care vor fi parcurse în buclă, adică array-ul `countDown`.

Semnificația acestui cod este: programul va lua în ordine fiecare element din array-ul `countDown`. De fiecare dată când ia un element, îl va reprezenta temporar prin `i`, apoi va executa codul din acolade.

Procesul de execuție poate fi înțeles astfel:

* Prima dată este extras `5`, deci în acel moment valoarea lui `i` este `5`
* Se execută `print(i)` și se afișează `5`
* Apoi continuă și extrage următorul element `4`
* Se execută din nou `print(i)` și se afișează `4`

Valorile următoare `3`、`2`、`1` vor fi și ele executate pe rând în același mod.

![for](../../Resource/017_for.png)

Când toate elementele din array au fost procesate, bucla `for` se termină automat.

Putem folosi bucla `for` pentru a obține fiecare element dintr-un array și pentru a realiza funcții precum numărătoarea inversă.

**Sugestie**: `i` este un mod foarte comun de denumire în bucla for, folosit pentru a reprezenta elementul extras în acel moment, dar nu este o regulă fixă; putem folosi și alte denumiri în engleză.

De exemplu, folosim `num` pentru a reprezenta fiecare element extras:

```swift
for num in countDown {
    print(num)
}
```

În interiorul acoladelor, trebuie tot să folosim `num` pentru a reprezenta elementul extras în acel moment.

### Interval de buclă

Bucla `for` poate parcurge nu doar array-uri, ci și intervale.

De exemplu, atunci când vrem să calculăm suma numerelor întregi pozitive până la `50`, trebuie să adunăm pe rând toate numerele întregi dintre `1` și `50`.

Cea mai directă variantă ar putea fi:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problema acestui mod de scriere este că trebuie să scriem manual fiecare număr. Este complicat și nepotrivit pentru scenarii reale de dezvoltare.

În acest moment, putem folosi operatorul de interval împreună cu bucla `for`.

În capitolul anterior despre „operatori”, am învățat deja operatorul de interval:

```swift
1...3   // 1, 2, 3
```

Aici, `...` reprezintă un interval închis, adică include atât punctul de început, cât și punctul de sfârșit.

Prin urmare, aici putem folosi bucla `for` pentru intervalul de numere întregi de la `1` la `50`:

```swift
for i in 1...50 {
    
}
```

Trebuie să adunăm aceste numere întregi, așa că mai avem nevoie și de o variabilă pentru a păstra suma totală:

```swift
var count = 0
```

Apoi, la fiecare iterație, adunăm numărul extras în acel moment la `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Acest cod înseamnă:

* `count` este folosit pentru a păstra suma curentă
* Bucla `for` va lua pe rând numerele întregi de la `1` la `50`
* De fiecare dată când ia un număr întreg, execută `count += i`
* După terminarea buclei, `count` va conține suma finală

Astfel, putem obține suma tuturor numerelor întregi pozitive până la `50`.

În mod similar, dacă vrem să calculăm suma numerelor întregi de la `1` la `100`, trebuie doar să modificăm intervalul:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

Bucla `for` nu poate parcurge doar array-uri, ci și un interval. Această capacitate de a procesa datele în ordine și în mod repetat este foarte comună în dezvoltare.

Ea ne poate ajuta să procesăm automat multă muncă repetitivă, fără să fie nevoie să scriem manual fiecare pas al adunării numerelor sau alte operații repetitive similare.

## Buclă în SwiftUI

Bucla `for` de mai sus aparține limbajului Swift.

Dar în SwiftUI nu putem folosi direct `for` în structura view-ului pentru a genera view-uri:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

Asta pentru că în interiorul lui `VStack` avem nevoie de view-uri SwiftUI, iar o buclă `for` obișnuită nu este ea însăși un view.

Dacă vrem să generăm în mod repetat interfața în SwiftUI pe baza conținutului unui array, trebuie să folosim `ForEach`.

De exemplu, dacă vrem să afișăm numele tuturor membrilor unui grup, putem scrie:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Efectul afișat:

![for1](../../Resource/017_for1.png)

Apoi adăugăm aceiași modificatori pentru fiecare `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Acum, fiecare `Text` este afișat cu un font mai mic și mai gros.

Efectul afișat:

![](../../Resource/017_for2.png)

Deși modificatorii fac interfața mai frumoasă, ei fac și codul mai lung și mai repetitiv.

Dacă numele continuă să crească sau dacă mai târziu vrem să modificăm uniform fontul, culoarea și alte stiluri, atunci va trebui să scriem și să modificăm mult cod identic în mod repetat. Acest lucru este incomod și greu de întreținut.

În acest moment, putem pune mai întâi aceste nume într-un array, apoi să folosim `ForEach` din SwiftUI pentru a genera în mod repetat view-uri pe baza datelor din array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Acest cod este mai concis. `ForEach` va citi pe rând fiecare element din array și va afișa conținutul corespunzător în interfață.

Când adăugăm ulterior nume noi, trebuie doar să modificăm numele din array-ul `names`, fără să repetăm mereu adăugarea de `Text` și modificatori complicați.

## ForEach

`ForEach` este structura din SwiftUI folosită pentru a genera view-uri în mod repetat. O poți înțelege ca pe o structură din SwiftUI asemănătoare unei bucle `for`.

Utilizare de bază:

```swift
ForEach(array, id: \.self) { element in
    cod SwiftUI
}
```

De exemplu, numele grupului de mai sus:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Acest cod înseamnă:

`names` este array-ul parcurs în buclă, adică datele care trebuie afișate.

`id:\.self` înseamnă că se folosește chiar elementul din array pentru a diferenția fiecare element.

În exemplul actual, array-ul conține string-uri:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Prin urmare, SwiftUI va folosi direct string-urile în sine, adică "Sam"、"John"、"Wathon"、"Bob", pentru a diferenția conținuturile diferite.

Pentru array-uri simple comune la nivel de începător, precum `String` și `Int`, de obicei putem scrie mai întâi:

```swift
id: \.self
```

Acum este suficient să reții doar această formă; nu este nevoie să înțelegi mai profund alte reguli despre id.

`item in` înseamnă elementul extras în acel moment.

De exemplu, la prima iterație, `item` este `"Sam"`, iar la a doua iterație, `item` este `"John"`.

Prin urmare:

```swift
Text(item)
```

se va transforma pe rând în:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Așadar, rolul acestui cod este: să ia pe rând fiecare nume din array-ul `names` și să genereze pentru fiecare nume un view `Text`.

### Proces de execuție

Procesul de execuție poate fi înțeles astfel:

* `ForEach` citește mai întâi primul element `"Sam"` din array-ul `names`
* `item` reprezintă temporar `"Sam"`
* `Text(item)` afișează `"Sam"`
* Apoi continuă și citește următorul element `"John"`
* După aceea, execută din nou același cod de view

În final, toate numele din array vor fi afișate.

Avantajul acestei scrieri este: atunci când numele cresc ca număr, nu trebuie să repetăm multe `Text`, ci doar să modificăm conținutul array-ului.

### Parcurgerea fotografiilor

`ForEach` nu poate afișa doar text, ci și imagini, culori sau alte view-uri SwiftUI.

De exemplu, pregătim 4 imagini:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Trage aceste patru imagini în folderul Assets din Xcode.

![image](../../Resource/017_for3.png)

Dacă nu folosim `ForEach`, trebuie să scriem manual fiecare imagine:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Efectul afișat:

![image](../../Resource/017_for4.png)

Această scriere poate realiza funcția, dar codul devine destul de lung.

Dacă imaginile devin tot mai multe, va trebui să repetăm din ce în ce mai mult cod `Image`.

Dacă mai târziu vrem să modificăm uniform dimensiunea imaginilor, va trebui și atunci să le modificăm una câte una.

În acest moment, putem pune numele imaginilor într-un array și apoi să folosim `ForEach` pentru a genera în mod repetat view-uri de imagine:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Aici, `images` este un array de string-uri, iar fiecare element din array este numele unei imagini.

`ForEach(images, id: \.self)` înseamnă că se citește pe rând fiecare element din array-ul `images`, se folosește elementul însuși pentru a diferenția fiecare element, apoi se generează view-ul corespunzător pe baza elementului curent.

De exemplu, dacă primul element citit este `"430F9BEF"`, atunci:

```swift
Image(item)
```

este echivalent cu:

```swift
Image("430F9BEF")
```

Imaginile următoare vor fi și ele afișate pe rând în același mod.

![image](../../Resource/017_for4.png)

Aici folosim în continuare:

```swift
id: \.self
```

Motivul este același ca mai devreme: pentru că elementele din array-ul `images` sunt și ele string-uri simple, la nivel de începător putem folosi direct elementul însuși ca modalitate de diferențiere.

Poți înțelege asta simplu ca pe o formulă fixă:

**Atunci când `ForEach` parcurge un array simplu de tip `String` sau `Int`, de obicei scriem `id: \.self`.**

### Adăugarea imaginilor

Dacă ulterior trebuie să adăugăm imagini noi, trebuie doar să modificăm conținutul array-ului:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nu mai este nevoie să repetăm și să scriem cod nou pentru `Image`.

Dacă există multe imagini, putem folosi acest lucru împreună cu `ScrollView`, altfel, când conținutul depășește ecranul, nu va mai putea fi previzualizat complet.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modificarea imaginilor

Când vrem să modificăm uniform stilul imaginilor, trebuie doar să modificăm codul din interiorul lui `ForEach`.

De exemplu, schimbăm lățimea la `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

În acest fel, toate imaginile vor fi modificate împreună, fără să fie nevoie să le schimbăm una câte una.

Acesta este unul dintre rolurile importante ale lui `ForEach`:

**Atunci când mai multe view-uri au aceeași structură și diferă doar prin conținut, putem scrie o singură dată codul view-ului, iar datele din array vor decide ce se afișează.**

## Rezumat

În această lecție, am învățat bucla `for` și `ForEach`.

Bucla `for` este folosită pentru a procesa în ordine elementele din array-uri sau intervale și este mai orientată spre procesarea datelor.

`ForEach` este folosit în SwiftUI pentru a genera view-uri în mod repetat pe baza conținutului array-urilor și este mai orientat spre afișarea view-urilor.

Pentru etapa actuală de începător, cea mai comună formă de `ForEach` este:

```swift
ForEach(array, id: \.self) { element in
    cod SwiftUI
}
```

Aici, `id: \.self` înseamnă folosirea elementului însuși pentru a diferenția fiecare element.

Atunci când conținutul din array este format din tipuri simple precum `String` și `Int`, de obicei putem începe cu această singură formă.

Pe viitor, atunci când navighezi pe pagini web sau în aplicații și vezi un grup de texte repetitive, imagini sau alte conținuturi de listă, te poți gândi că în SwiftUI acest tip de conținut este de obicei pus mai întâi într-un array, apoi afișat unul câte unul prin `ForEach`.
