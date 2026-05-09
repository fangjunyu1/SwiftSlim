# Proprietăți calculate

În această lecție vom învăța în principal despre proprietățile calculate.

O proprietate calculată este folosită pentru a calcula un rezultat nou pe baza datelor existente. Ea poate calcula valori numerice, dar și conținutul care trebuie afișat într-un view SwiftUI.

De exemplu:

```swift
let a = 10
let b = 20
let c = a + b
```

Aici, `c` reprezintă rezultatul obținut după adunarea lui `a` și `b`.

În codul obișnuit, acest mod de scriere este foarte frecvent.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Sugestie: în evenimentul de apăsare al unui `Button`, putem executa cod Swift obișnuit.

Dar dacă scriem un cod asemănător direct în proprietățile unui view SwiftUI, va apărea o problemă.

De exemplu:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Acest cod va produce o eroare.

La prima vedere, `a` și `b` sunt deja scrise înainte de `c`, așa că pare că valoarea lui `c` ar putea fi calculată.

Însă, atunci când declarăm proprietăți într-o structură, acest mod de scriere nu poate fi folosit direct.

## De ce c nu poate fi calculat direct ca a + b?

Pentru că `a`, `b` și `c` nu sunt constante temporare din evenimentul de apăsare al unui buton, ci proprietăți ale view-ului `ContentView`.

În evenimentul de apăsare al unui buton, acest cod poate fi executat normal:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Asta pentru că, după apăsarea butonului, codul se execută în ordine. Mai întâi este creat `a`, apoi este creat `b`, iar la final `c` este calculat folosind `a + b`.

Însă atunci când declarăm proprietăți în interiorul unui view, situația este diferită:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Aici, `a`, `b` și `c` sunt toate proprietăți ale view-ului `ContentView`.

Când view-ul `ContentView` este creat, Swift trebuie mai întâi să pregătească aceste proprietăți. Pentru ca procesul de creare să fie sigur, Swift nu permite ca valoarea implicită a unei proprietăți stocate de instanță să citească direct alte proprietăți de instanță din aceeași instanță.

De aceea, această linie va produce o eroare:

```swift
let c = a + b
```

Putem înțelege simplu astfel: **atunci când declarăm proprietăți în interiorul unui view, nu putem folosi direct o proprietate obișnuită pentru a calcula o altă proprietate obișnuită.**

Acest tip de proprietate, care stochează direct o valoare, se numește „proprietate stocată”. Pentru a o înțelege mai ușor, o putem considera temporar o proprietate obișnuită.

De exemplu:

```swift
let a = 10
```

`a` stochează `10`.

```swift
let b = 20
```

`b` stochează `20`.

Dar:

```swift
let c = a + b
```

Aici, `c` nu este o valoare fixă scrisă direct. Se dorește ca ea să fie calculată prin `a + b`.

Într-o astfel de situație, în care „obținem un rezultat pe baza datelor existente”, este mai potrivit să folosim o proprietate calculată.

Putem modifica astfel:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Aici, `c` este o proprietate calculată.

```swift
var c: Int {
    return a + b
}
```

Sensul este: **atunci când trebuie să folosim `c`, sunt citite `a` și `b`, iar rezultatul lui `a + b` este returnat.**

De exemplu:

```swift
Text("c: \(c)")
```

Calculul lui `c` este declanșat doar atunci când `Text` afișează `c`.

## Ce este o proprietate calculată?

O proprietate calculată arată ca o variabilă, dar ea însăși nu stochează date.

De exemplu:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Aici, `c` este o proprietate calculată.

Ea nu stochează o valoare fixă ca o proprietate obișnuită. De fiecare dată când `c` este citit, codul din `{}` este executat din nou, iar rezultatul calculat este returnat.

Putem înțelege astfel:

```swift
var c: Int {
    return a + b
}
```

Când este nevoie de `c`, se calculează `a + b`.

Prin urmare, proprietatea calculată este potrivită pentru această situație: **un rezultat nu trebuie stocat separat, deoarece poate fi calculat din datele existente.**

## Sintaxa de bază

O proprietate calculată conține de obicei trei părți:

```swift
var c: Int {
    return a + b
}
```

### 1. Declarare cu `var`

```swift
var c
```

O proprietate calculată trebuie declarată cu `var`, nu poate fi declarată cu `let`.

Pentru că o proprietate calculată nu este o valoare fixă stocată, ci un rezultat calculat dinamic de fiecare dată când este citită.

### 2. Specificarea tipului returnat

```swift
var c: Int
```

O proprietate calculată trebuie să specifice tipul returnat.

Aici, `c` va returna în final un număr întreg, deci tipul este `Int`.

### 3. Scrierea logicii de calcul în {}

```swift
{
    return a + b
}
```

În `{}` se scrie logica de calcul. Aici, rezultatul returnat este `a + b`.

## Cuvântul-cheie return

O proprietate calculată trebuie să returneze un rezultat.

De exemplu:

```swift
var c: Int {
    return a + b
}
```

Aici, `return` înseamnă: returnează rezultatul calculului `a + b`.

Dacă într-o proprietate calculată există o singură expresie care produce direct rezultatul, `return` poate fi omis:

```swift
var c: Int {
    a + b
}
```

Dar dacă o proprietate calculată conține mai multe linii de cod, trebuie folosit `return` pentru a indica clar rezultatul returnat.

De exemplu:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Aici, procesul de calcul este împărțit în două etape.

Prima etapă calculează prețul total:

```swift
let total = count * price
```

A doua etapă transformă prețul total într-un text și îl returnează:

```swift
return "Total：\(total) $"
```

Dacă eliminăm `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total：\(total) $"
}
```

Acest cod va produce o eroare.

Motivul este: **această proprietate calculată conține deja mai multe linii de cod, iar Swift nu mai poate determina automat care linie este rezultatul final ce trebuie returnat.**

De aceea, atunci când o proprietate calculată conține o singură expresie care produce rezultatul, `return` poate fi omis.

```swift
var c: Int {
    a + b
}
```

Când o proprietate calculată conține mai multe linii de cod, este recomandat să scriem explicit `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

## Diferența dintre proprietatea calculată și proprietatea obișnuită

O proprietate obișnuită stochează date.

```swift
var c = 30
```

Aici, `c` stochează o valoare concretă: `30`.

O proprietate calculată nu stochează date.

```swift
var c: Int {
    a + b
}
```

Aici, `c` nu stochează `30`. Ea oferă doar o metodă de calcul.

Când `c` este citit, Swift execută:

```swift
a + b
```

Apoi returnează rezultatul calculat.

Prin urmare, o proprietate calculată este potrivită pentru situațiile în care rezultatul trebuie calculat pe baza altor date.

## body este tot o proprietate calculată

După ce învățăm despre proprietățile calculate, putem înțelege din nou acest cod foarte des întâlnit în SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Aici, `body` este tot o proprietate calculată.

Este declarată cu `var`:

```swift
var body
```

Are un tip returnat:

```swift
some View
```

Conținutul returnat în `{}` este conținutul view-ului SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Prin urmare, `body` poate fi înțeles astfel: când SwiftUI trebuie să afișeze acest view, citește `body` și creează interfața pe baza conținutului returnat de `body`.

Dacă scriem `return`, putem înțelege astfel:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Dar în SwiftUI, de obicei omitem `return` și scriem direct:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Când datele `@State` se schimbă, SwiftUI citește din nou `body` și actualizează interfața pe baza noilor date.

De exemplu:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("count: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

După apăsarea butonului, `count` se schimbă.

```swift
count += 1
```

După ce `count` se schimbă, SwiftUI recalculează `body`, deci textul din interfață se actualizează și el.

```swift
Text("count: \(count)")
```

Acesta este și motivul pentru care, în SwiftUI, interfața se poate reîmprospăta automat după schimbarea datelor.

### Nu este recomandat să scriem calcule complexe în body

Deoarece `body` este o proprietate calculată, poate fi citită și recalculată de mai multe ori.

De exemplu:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("num: \(num)")
            Text("name: \(name)")
        }
    }
}
```

Când `name` se schimbă, SwiftUI recalculează `body`.

În acel moment, codul din `body` este executat din nou, iar `num` este creat din nou.

```swift
let num = 10
```

În acest exemplu, `num` este foarte simplu, deci impactul nu este mare.

Dar dacă în `body` sunt executate calcule complexe, cum ar fi filtrarea unei cantități mari de date, sortarea, procesarea imaginilor etc., acest lucru poate afecta fluiditatea interfeței.

De aceea, în SwiftUI, `body` ar trebui să fie responsabil în principal pentru descrierea structurii interfeței.

Datele temporare simple pot fi scrise în `body`.

Calculele complexe pot fi mutate în afara lui `body`, într-o proprietate calculată, într-o metodă sau într-o parte separată de procesare a datelor.

## Exemplu: cantitate și preț total

În continuare, vom folosi un exemplu simplu pentru a înțelege proprietățile calculate.

Să presupunem că prețul unui morcov este 2 $. Utilizatorul poate apăsa butoane pentru a modifica numărul cumpărat, iar interfața trebuie să afișeze prețul total.

Formula de calcul a prețului total:

```text
Cantitate * Preț unitar
```

Dacă folosim o variabilă obișnuită pentru a stoca prețul total, va fi destul de incomod.

Pentru că de fiecare dată când cantitatea se schimbă, trebuie să actualizăm manual prețul total.

O metodă mai bună este să folosim o proprietate calculată:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Rezultatul afișat:

![view](../../Resource/024_view.png)

În acest exemplu:

```swift
@State private var count = 1
```

`count` reprezintă cantitatea de morcovi. Când butonul este apăsat, `count` se schimbă.

```swift
private let price = 2
```

`price` reprezintă prețul unitar al morcovului. Aici este o valoare fixă, deci folosim `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` reprezintă prețul total.

Nu trebuie stocat separat, deoarece prețul total poate fi calculat întotdeauna prin `count * price`.

Când `count` este `1`:

```swift
totalPrice = 1 * 2
```

Rezultatul afișat este:

```swift
totalPrice: 2 $
```

După apăsarea butonului `+`, `count` devine `2`.

În acest moment, când `totalPrice` este citit din nou, este recalculat:

```swift
totalPrice = 2 * 2
```

Rezultatul afișat este:

```swift
totalPrice: 4 $
```

Acesta este rolul proprietății calculate: calculează dinamic un rezultat nou pe baza datelor existente.

## Proprietățile calculate pot fi folosite și pentru condiții

O proprietate calculată nu poate doar să calculeze numere, ci poate returna și un rezultat de verificare.

De exemplu, atunci când vrem ca valoarea minimă a cantității să fie 1.

Când cantitatea este deja 1, butonul `-` nu ar trebui să mai reducă valoarea.

Putem adăuga o proprietate calculată:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Cod complet:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("price: \(price) $")
                Text("count: \(count)")
                Text("totalPrice: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Rezultatul afișat:

![view](../../Resource/024_view1.png)

Aici:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Acest cod indică dacă în acest moment cantitatea mai poate fi redusă.

Când `count` este mai mare decât `1`:

```swift
canDecrease == true
```

înseamnă că poate fi redusă.

Când `count` este egal cu `1`:

```swift
canDecrease == false
```

înseamnă că nu mai poate fi redusă.

### Verificarea condiției în buton

În buton se folosește:

```swift
if canDecrease {
    count -= 1
}
```

Doar când `canDecrease` este `true`, `count` poate fi redus.

### Controlarea culorii de prim-plan a view-ului

Putem folosi `canDecrease` și pentru a controla culoarea de prim-plan a butonului:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aici se folosește operatorul ternar:

```swift
canDecrease ? Color.primary : Color.gray
```

Sensul acestui cod este: dacă `canDecrease` este `true`, culoarea de prim-plan folosește `Color.primary`; dacă `canDecrease` este `false`, culoarea de prim-plan folosește `Color.gray`.

`Color.primary` este o culoare semantică de sistem oferită de SwiftUI. Ea reprezintă culoarea principală a textului în interfața curentă.

În Light Mode, `Color.primary` este de obicei apropiată de negru; în Dark Mode, este de obicei apropiată de alb.

Prin urmare, avantajul folosirii lui `Color.primary` este că se adaptează automat la Light Mode și Dark Mode.

### Controlarea stării disabled a view-ului

`disabled` este folosit pentru a controla dacă un view se află în stare dezactivată:

```swift
.disabled(!canDecrease)
```

Când `disabled` este `false`, view-ul poate fi apăsat.

Când `disabled` este `true`, view-ul este dezactivat și nu poate fi apăsat.

Aici, folosirea lui `canDecrease` ca o condiție face codul mai ușor de înțeles.

Când vedem `canDecrease`, putem înțelege imediat că înseamnă „dacă în acest moment se mai poate reduce”.

### Explicație suplimentară: de ce există două verificări?

În butonul `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aici folosim atât `.disabled(!canDecrease)`, cât și `if canDecrease` în interiorul butonului.

`.disabled(!canDecrease)` dezactivează butonul la nivelul interfeței, astfel încât utilizatorul să nu îl poată apăsa.

`if canDecrease` verifică încă o dată înainte de executarea codului. Doar atunci când se poate reduce, se execută `count -= 1`.

Aceasta este o protecție dublă. În dezvoltarea reală, dacă butonul este deja dezactivat, verificarea internă poate fi omisă. Dar într-un exemplu didactic, păstrarea ei poate arăta mai clar rolul lui `canDecrease`.

## Rezumat

În această lecție am învățat în principal despre proprietățile calculate.

O proprietate calculată nu stochează direct o valoare. Când este citită, calculează un rezultat pe baza datelor existente.

De exemplu:

```swift
var c: Int {
    a + b
}
```

Aici, `c` nu trebuie stocat separat, deoarece poate fi calculat prin `a + b`.

O proprietate calculată trebuie declarată cu `var` și trebuie să specifice tipul returnat.

```swift
var canDecrease: Bool {
    count > 1
}
```

O proprietate calculată poate returna nu doar valori numerice, ci și rezultate de verificare, conținut text și chiar conținut de view SwiftUI.

În această lecție am învățat și `return`.

`return` înseamnă returnarea unui rezultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total：\(total) $"
}
```

Dacă într-o proprietate calculată există o singură expresie care produce direct rezultatul, `return` poate fi omis.

```swift
var totalPrice: Int {
    count * price
}
```

În plus, am înțeles și `Color.primary` și `disabled`.

`Color.primary` este o culoare semantică de sistem în SwiftUI. Ea ajustează automat efectul de afișare în funcție de Light Mode și Dark Mode.

```swift
.foregroundStyle(Color.primary)
```

`disabled` este folosit pentru a controla dacă un view este dezactivat.

```swift
.disabled(true)
```

Înseamnă dezactivat, nu poate fi apăsat.

```swift
.disabled(false)
```

Înseamnă disponibil, poate fi apăsat.

De aceea, proprietățile calculate sunt foarte frecvente în SwiftUI. Ele ne ajută să organizăm mai clar rezultatele calculelor, condițiile și conținutul afișat.
