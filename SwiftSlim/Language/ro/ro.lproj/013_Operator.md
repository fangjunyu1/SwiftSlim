# Operatori

În această lecție, vom învăța operatorii din Swift (Operators).

Atunci când efectuăm calcule, comparații sau judecăți logice, avem nevoie de operatori. Aceste operații apar în toate etapele executării programului și reprezintă una dintre cele mai fundamentale abilități din programare.

```swift
let a = 100 * 8
```

În procesul de învățare a programării, mulți oameni observă că persoanele cu o anumită gândire matematică reușesc adesea să înțeleagă mai ușor logica programelor. Asta deoarece esența programării nu poate fi separată de „calcul” și „judecata pe baza regulilor”, iar operatorii sunt exact cei care îndeplinesc acest rol central.

În dezvoltarea reală, operatorii nu sunt folosiți doar pentru calcule numerice simple, ci sunt aplicați pe scară largă în numeroase scenarii concrete.

De exemplu, într-un joc cu blocuri, atunci când utilizatorul trage un bloc într-o poziție anume, este necesar să se calculeze:

* poziția coordonatelor blocului
* locurile pe care blocul le poate ocupa
* dacă poziția țintă este disponibilă

Aceste procese de tip „calcul + judecată” se bazează, în esență, pe operatori.

![Block](../../Resource/013_block.png)

A învăța operatorii nu înseamnă doar a învăța calcule numerice, ci și a pune bazele pentru layout-ul interfeței, procesarea datelor și logica interacțiunii din lecțiile următoare.

## Modul de executare a calculelor în SwiftUI

În SwiftUI, de obicei folosim Button pentru a declanșa o funcție, iar logica de calcul este executată în funcție.

De exemplu:

```swift id="o4tcvw"
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Când butonul este apăsat, în Console va fi afișat:

```id="7cpjm9"
c: 20
```

În această lecție, vom scrie în mod unitar logica operațiilor în funcții, vom folosi butoane pentru a le declanșa și print pentru a afișa rezultatele.

În exemplele următoare, pentru a simplifica prezentarea codului, vom marca direct rezultatele în cod, fără să mai repetăm de fiecare dată ieșirea prin print.

## Gestionarea ieșirii din Console

Deoarece fiecare apăsare produce mesaje de ieșire, poți apăsa butonul de curățare din colțul din dreapta jos al zonei Console pentru a șterge istoricul logurilor și a vedea mai ușor rezultatele curente.

![Console](../../Resource/013_console.png)

## O altă formă de scriere pentru Button

Atunci când un buton execută doar o singură funcție, poți folosi o scriere mai concisă:

```swift id="jphfdy"
Button(action: ) {
    // View
}
```

În această formă, action specifică funcția care trebuie executată la apăsarea butonului (o funcție fără parametri), iar acoladele {} sunt folosite pentru a defini view-ul butonului.

Combinând cu funcția calculate de mai sus, putem scrie astfel:

```swift id="bj8ent"
Button(action: calculate) {
    Text("Button")
}
```

Când butonul este apăsat, funcția calculate va fi executată direct.

Prin urmare, atunci când logica butonului este simplă și doar apelează o funcție, forma cu action este mai clară și mai potrivită din punct de vedere al stilului codului.

## Operatori aritmetici

Operatorii aritmetici (Arithmetic Operators) sunt folosiți pentru calcule numerice:

* `+` adunare
* `-` scădere
* `*` înmulțire
* `/` împărțire
* `%` restul împărțirii (modulo)

Exemple:

```swift id="ph7d0v"
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Trebuie remarcat că Swift este un limbaj puternic tipizat și nu combină automat tipuri de date diferite:

```swift id="l6zsd8"
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Atunci când cele două tipuri sunt diferite, trebuie să convertești manual tipul.

## Operatori de comparație

Operatorii de comparație (Comparison Operators) sunt folosiți pentru a compara relația dintre două valori, iar rezultatul este de tip Bool:

* `==` egal cu
* `!=` diferit de
* `>` mai mare decât
* `<` mai mic decât
* `>=` mai mare sau egal cu
* `<=` mai mic sau egal cu

Exemple:

```swift id="54r7so"
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Operatorii de comparație sunt adesea folosiți în instrucțiuni condiționale. De exemplu, în „caruselul de citate”, trebuie să controlăm ca indexul să nu depășească intervalul array-ului:

```swift id="7bj00w"
if index < sayings.count - 1 {
    index += 1
}
```

Dacă index este mai mic decât sayings.count - 1, rezultatul comparației este true, iar codul din if va fi executat; dacă rezultatul este false, codul de mai jos nu va fi executat.

## Operatori logici

Operatorii logici (Logical Operators) sunt folosiți pentru a combina mai multe condiții:

* `&&` și (AND)
* `||` sau (OR)
* `!` nu (NOT)

### && și

Atunci când mai multe condiții trebuie îndeplinite simultan, folosim &&.

De exemplu:

```swift id="tt8idu"
let age = 16
let legalAge = age >= 18 && age <= 100
```

În acest cod, există două condiții: age >= 18 și age <= 100.

Doar atunci când ambele condiții sunt true, legalAge va fi true; dacă măcar una dintre condiții nu este îndeplinită, rezultatul va fi false.

### || sau

Atunci când este suficient să fie îndeplinită una dintre mai multe condiții, folosim ||.

De exemplu:

```swift id="w6z7ir"
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Acest cod înseamnă că, atât timp cât money >= 50 sau creditCard >= 50 este adevărat, payAllowed va fi true.

Doar dacă ambele condiții sunt false, rezultatul va fi false.

De exemplu, într-un scenariu de plată, poți plăti fie cu numerar, fie cu cardul de credit. Dacă niciuna dintre opțiuni nu este disponibilă, plata va eșua.

### ! nu

! este operatorul logic NOT, folosit pentru a inversa o valoare Bool.

Poți să îl înțelegi astfel: ! transformă true în false și false în true.

De exemplu:

```swift id="rzwqvu"
let allowed = true
let result = !allowed   // false
```

Aici, !allowed înseamnă inversarea valorii lui allowed.

Trebuie remarcat că ! și != sunt doi operatori diferiți: ! inversează o valoare Bool, în timp ce != este un operator de comparație care returnează un Bool.

## Operatori de atribuire

Operatorii de atribuire (Assignment Operators) sunt folosiți pentru a atribui valori sau pentru a actualiza variabile:

* `=` atribuire

Atât în procesul de declarare a variabilelor, cât și în calcule, apare atribuirea:

```swift id="l0fjlwm"
let a = 5
```

Acest cod înseamnă că valoarea 5 este atribuită variabilei a.

### Operatorii compuși de atribuire

În dezvoltarea reală, pe lângă operatorul de atribuire de bază, sunt folosiți foarte des și „operatorii compuși de atribuire”, care permit calculul direct pe baza valorii existente și actualizarea imediată:

* `+=`
* `-=`
* `*=`
* `/=`

În lecția anterioară despre „contor”, am întâlnit deja pe scurt operatorii compuși de atribuire.

De exemplu, când vrem ca o variabilă să crească automat la apăsarea unui buton:

```swift id="ep3s10"
var num = 10
num += 5   // num = 15
```

Acest cod înseamnă că num este adunat cu 5, iar rezultatul este atribuit înapoi lui num.

Prin urmare, este echivalent cu:

```swift id="v4q9cw"
var num = 10
num = num + 5   // num = 15
```

## Operatorul ternar

Operatorul ternar (Ternary Operator) din Swift face o verificare condițională și returnează unul dintre două rezultate:

```swift id="3qjlwmc"
condiție ? valoare1 : valoare2
```

Logica lui este următoarea: dacă condiția este true, returnează „valoare1”; dacă este false, returnează „valoare2”.

De exemplu:

```swift id="jlwmou"
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Acest cod verifică valoarea lui showColor: dacă este true, returnează Color.blue, iar fundalul va fi albastru; dacă este false, returnează Color.clear, adică nu va fi afișată culoarea de fundal.

Observație: Color.clear înseamnă culoare transparentă (nu afișează nimic).

### Diferența față de if-else

Operatorul ternar este echivalent logic cu instrucțiunea if-else.

De exemplu, codul de mai sus poate fi scris astfel:

```swift id="c4mdkk"
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

Logica de execuție este exact aceeași: când condiția este true, se execută primul rezultat; când este false, se execută al doilea rezultat.

În utilizarea practică, operatorul ternar este mai concis și este mai potrivit pentru exprimarea unei alegeri simple de tip „una dintre două”, fiind folosit adesea atunci când vrei să returnezi direct o valoare.

În construcția View-urilor SwiftUI, operatorul ternar este foarte frecvent, de exemplu:

```swift id="0p5ywj"
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Această formă permite schimbarea dinamică a efectului view-ului într-o singură linie de cod, în funcție de condiție.

## Operatori de interval

Operatorii de interval (Range Operators) sunt folosiți pentru a reprezenta intervale:

* `...` interval închis (include ambele capete)
* `..<` interval semi-deschis (nu include capătul din dreapta)

De exemplu:

```id="sg6tmm"
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Poți înțelege astfel: 1...3 înseamnă de la 1 la 3, inclusiv 3; 5..<8 înseamnă de la 5 la 8, dar fără a include 8.

Forme extinse (doar pentru familiarizare):

```id="hlzpp9"
5...    // >= 5
...5    // <= 5
```

Această scriere reprezintă un „interval unilateral” și este adesea folosită în condiții sau în potrivirea de modele.

Operatorii de interval vor fi utilizați mai târziu când vom învăța bucla for. Pentru moment, îi poți înțelege ca pe un interval continuu de valori numerice.

## Exersarea operatorilor

Mai jos, prin câteva exemple simple, vom exersa rolul operatorilor în view.

### 1. Calcularea numărului total de vehicule

De exemplu, dacă printr-o intersecție trec zilnic 500 de vehicule, putem calcula numărul total de vehicule care trec în 30 de zile.

Putem folosi operatorii aritmetici:

```swift id="m5fi6i"
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Procesul de calcul de aici este: 500 de vehicule pe zi, iar în 30 de zile totalul este 500 × 30, rezultând în final 15000 de vehicule.

### 2. Verificarea unui membru cu achiziție în aplicație

Putem verifica dacă o persoană este membru prin achiziție în aplicație. Atât timp cât are fie abonament pe viață, fie abonament recurent, este considerată membru.

```swift id="o7lykr"
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

În acest cod este folosit operatorul || (sau): lifeTime = false înseamnă că nu există abonament pe viață; subscription = true înseamnă că există abonament recurent.

Pentru că este suficientă îndeplinirea uneia dintre condiții, isMember este true. Prin urmare, această persoană este membru.

## Rezumat

În Swift, operatorii sunt baza calculelor de date și a judecăților logice. La fel cum Text este folosit pentru a afișa conținut, operatorii sunt folosiți pentru a procesa datele în sine.

De la cele mai simple calcule numerice, la judecăți logice mai complexe, până la controlul stării view-urilor și calculele de layout, operatorii sunt implicați peste tot.

Prin exerciții în diferite scenarii, poți deveni treptat familiarizat și poți stăpâni diferitele categorii de operatori prezentate în această lecție. Aceasta este o bază importantă pentru studiul ulterior.

### Cunoștințe extinse - operatori pe biți

În plus, Swift oferă și o categorie mai de nivel jos de operatori — operatorii pe biți (Bitwise Operators):

* `&`（și pe biți）
* `|`（sau pe biți）
* `^`（xor pe biți）
* `~`（negație pe biți）
* `>>`（deplasare la dreapta）
* `<<`（deplasare la stânga）

De exemplu:

```swift id="i9pzdt"
let a = 6  // binar 110
let b = 3  // binar 011

print(a & b) // 2 (binar 010)
print(a | b) // 7 (binar 111)
print(a ^ b) // 5 (binar 101)
print(~a)    // -7 (negație)
```

În Swift, numerele întregi sunt reprezentate în cod complementar binar, iar după operația de negație se obține rezultatul negativ corespunzător.

Operatorii pe biți operează direct asupra reprezentării binare și sunt folosiți de obicei în procesarea de date de nivel jos și în scenarii de optimizare a performanței.

Pentru începători, scenariile de utilizare pentru această categorie de operatori sunt puține, iar în dezvoltarea obișnuită iOS sau SwiftUI ei nu sunt foarte întâlniți, de aceea aici nu îi vom aprofunda.

Dacă mai târziu vei întâlni logică de nivel jos sau optimizare de performanță, poți reveni și să îi studiezi mai în detaliu.
