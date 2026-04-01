# Sistemul de tipuri

În lecțiile anterioare, am învățat deja despre variabile și știm că variabilele pot păstra date de tipuri diferite.

De exemplu:

```swift
var hello = "Hello, World"
```

Aici, hello păstrează un text, deci tipul său este String.

În continuare, vom studia sistematic conceptul de tip (Type), precum și declararea explicită a tipului și inferența tipului, pentru a înțelege mai profund esența variabilelor.

## Ce este un tip

În Swift, fiecare valoare are un tip clar. Tipul decide ce este acea valoare și ce poate face.

De exemplu:

* 42 este un Int (număr întreg)
* "Hello" este String (șir de caractere)
* true este Bool (valoare booleană)

Ele aparțin unor tipuri diferite și au și utilizări diferite.

## Tipuri de bază comune în Swift

În etapa de început, cele mai comune tipuri sunt următoarele:

* String: șir de caractere (text)
* Int: număr întreg
* Double: număr cu virgulă mobilă (cu zecimale, precizie mai mare)
* Bool: valoare booleană (true/false)

În plus, mai există și Float (număr cu virgulă mobilă), dar precizia lui este mai mică decât a lui Double, deci este folosit mai rar; Character reprezintă un singur caracter, de exemplu "A", "!" și alte caractere unice.

### Declararea tipului (tip explicit)

În Swift, putem specifica manual tipul atunci când declarăm o variabilă:

```swift id="u2o5n1"
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Adăugăm `: Tip` după numele variabilei pentru a declara tipul variabilei.

Sintaxa tipului pentru array este `: [Tip]`:

```swift id="3bnnhy"
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

În acest fragment de cod, array-ul scores poate păstra doar elemente de tip Int, iar tags poate păstra doar elemente de tip String.

Declararea explicită a tipului poate face intenția codului mai clară și, în unele situații, poate evita erorile de inferență a tipului.

## Inferența tipului

În multe situații, nu este nevoie să declarăm explicit tipul:

```swift id="vmgdjlwm"
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Asta deoarece compilatorul Swift poate deduce automat tipul pe baza „valorii inițiale”.

## Declararea explicită și inferența tipului

În lecțiile anterioare, nu am introdus declararea explicită, de exemplu:

```swift id="8n0nql"
var age: Int = 18
```

Ci am preferat să folosim inferența tipului:

```swift id="v4xxpb"
var age = 18
```

În acest exemplu, cele două forme sunt echivalente; în ambele cazuri, age va fi determinat ca tip Int. Comparativ, scrierea cu inferență de tip este mai concisă.

Motivul pentru care nu am insistat de la început asupra declarării explicite este că inferența tipului reduce informația suplimentară din cod și, astfel, scade costul de înțelegere pentru începători.

## De ce avem nevoie de tipuri

Swift este un limbaj puternic tipizat (Strongly Typed Language).

Asta înseamnă: odată ce tipul unei variabile este stabilit, el nu mai poate fi schimbat arbitrar.

De exemplu:

```swift id="twj6ay"
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Primul 20 este de tip Int și poate fi atribuit lui age; al doilea "20" este de tip String și nu este compatibil cu Int, deci va genera eroare.

nums este un array de tip [Int], deci poate stoca doar numere întregi și nu poate conține și șiruri de caractere.

Tipurile pot constrânge modul de utilizare a datelor și pot descoperi problemele de nepotrivire de tip încă din faza de compilare, reducând astfel bug-urile cauzate de confuzia de tipuri și crescând stabilitatea și mentenabilitatea codului.

## Când trebuie declarat explicit tipul

Deși Swift poate deduce automat tipurile, există situații în care compilatorul nu le poate deduce sau le poate deduce greșit. Atunci este nevoie de declararea manuală.

**1. Array gol**

La crearea unui array gol, trebuie declarat explicit tipul:

```swift id="ncval7"
var nums: [Int] = []
```

Dacă nu scrii tipul:

```swift id="5co3cz"
var nums = []   // Error，Empty collection literal requires an explicit type
```

Compilatorul nu poate deduce tipul elementelor dintr-un array gol, deci apare o eroare de compilare.

**2. Evitarea inferenței greșite**

```swift id="xwnd3a"
var value = 10   // Int
```

În acest exemplu, deși 10 poate reprezenta și un număr în virgulă mobilă (Double), pentru că nu are punct zecimal, compilatorul îl va deduce implicit ca Int.

Dacă vrem ca value să reprezinte un număr în virgulă mobilă, trebuie să declarăm explicit tipul:

```swift id="7f5tvl"
var value: Double = 10   // Double
```

Atunci când rezultatul inferenței tipului nu corespunde așteptărilor, trebuie să folosim declararea explicită a tipului sau să ajustăm forma literalului pentru a ne asigura că tipul este corect.

**3. Tipuri personalizate**

Mai târziu vom învăța și despre tipurile personalizate. Atunci când le folosim, de obicei este necesar și să declarăm explicit tipul:

```swift id="vuz0es"
var info: GameInfo
var users: [User] = []
```

Motivul este același ca în cazul array-urilor goale: compilatorul nu poate deduce automat tipul dintr-o valoare goală.

## Conversia tipurilor

În Swift, tipurile diferite nu pot fi convertite automat între ele, ci trebuie convertite manual.

De exemplu, adunarea a două numere de tipuri diferite:

```swift id="ndyzda"
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

În acest fragment, a este de tip Int, iar b este de tip Double. Tipurile sunt diferite, deci nu pot fi folosite direct în aceeași operație.

Înainte de calcul, trebuie să convertim una dintre valori la același tip:

```swift id="x8u6lz"
var result = Double(a) + b
```

Acest cod înseamnă că valoarea a de tip Int este convertită la tipul Double și apoi este adunată cu b, iar rezultatul este atribuit lui result.

Trebuie observat că această conversie nu modifică tipul variabilei originale. De exemplu, Double(a) nu schimbă tipul lui a din Int, ci creează o nouă valoare Double care participă la operație.

Și alte tipuri pot fi convertite într-un mod similar, adică folosind forma `TipȚintă()` și trecând înăuntru valoarea care trebuie convertită. De exemplu:

```id="x3drss"
Int()、Double()、String()
```

Exemplu:

```swift id="f5yet0"
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Trebuie reținut că nu toate conversiile păstrează complet informația; de exemplu, la conversia Double → Int, partea zecimală este tăiată direct, fără rotunjire.

## Alias de tip

În Swift, putem da și un alias unui tip existent, pentru a face semnificația codului mai clară:

```swift id="7n6mll"
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Aici, UserID este în esență tot Int; tipul nu s-a schimbat, doar numele a devenit mai semnificativ.

În proiectele cu mult cod și tipuri complexe, aliasurile de tip pot face codul mai ușor de citit.

## Exemplu despre tipuri

Mai jos, printr-un exemplu simplu, vom vedea rolul tipurilor în dezvoltarea reală.

### Crearea variabilei

Mai întâi, creăm o variabilă age:

```swift id="efgbto"
var age = 20
```

Deoarece trebuie să afișăm și să modificăm această variabilă în SwiftUI, trebuie să o declarăm folosind @State:

```swift id="t2byri"
@State private var age = 20
```

private a fost menționat anterior și înseamnă că această variabilă poate fi folosită doar în view-ul curent; vom aprofunda asta mai târziu.

### Afișarea datelor în SwiftUI

Afișăm variabila age în SwiftUI:

```swift id="6gatj8"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Acum view-ul va afișa:

```swift id="a4u10j"
age: 20
```

### Modificarea datelor

În continuare, adăugăm două butoane pentru a modifica age:

```swift id="giuqva"
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Rezultatul rulării

Când apăsăm changeAge1, lui age i se va atribui valoarea 18:

```swift id="8yp234"
age = 18
```

Deoarece 18 este de tip Int și este compatibil cu tipul lui age, atribuirea reușește.

changeAge2 va produce o eroare:

```swift id="9r6eoj"
age = "18"
```

Mesajul de eroare:

```id="b46epq"
Cannot assign value of type 'String' to type 'Int'
```

Asta deoarece "18" este de tip String (șirurile trebuie încadrate între ""), iar age este de tip Int; tipurile nu coincid, deci atribuirea nu este permisă.

### De ce apare eroarea?

Cheia se află în această linie de cod:

```swift id="efuq7j"
@State private var age = 20   // Int
```

Deși tipul nu a fost declarat explicit, deoarece valoarea inițială 20 este de tip Int, compilatorul va deduce automat că age este de tip Int.

Odată ce tipul este stabilit, nu mai putem atribui o valoare de alt tip.

Mai mult, butonul changeAge2 nu „eșuează în timpul rulării”, ci produce o eroare încă din faza de compilare, iar codul nu poate fi compilat.

Acesta este unul dintre avantajele sistemului puternic tipizat din Swift: problemele de tip pot fi descoperite din timp, chiar în momentul scrierii codului.

### Scrierea corectă

După eliminarea codului greșit:

```swift id="inrrh1"
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Când apăsăm butonul changeAge1, view-ul se va actualiza la:

```id="hmuwjlwm"
age: 18
```

### Declararea explicită a tipului (opțional)

Putem de asemenea să specificăm clar tipul la definire:

```swift id="75zl1t"
@State private var age: Int = 20
```

Această scriere face tipul mai clar, dar în scenarii simple nu este obligatorie.

## Rezumat

Această lecție a prezentat în principal sistemul de tipuri din Swift și rolul lui în dezvoltarea reală.

În Swift, fiecare valoare are un tip clar, iar tipul decide semnificația datelor și operațiile la care poate participa.

Swift este puternic tipizat: odată ce tipul unei variabile este determinat, ea nu mai poate primi o valoare de alt tip. Această constrângere poate descoperi erorile încă din faza de compilare, reducând problemele de la rulare și crescând siguranța codului.

Tipul unei variabile poate fi dedus automat pe baza valorii inițiale sau poate fi declarat explicit. În anumite situații (cum ar fi array-uri goale, inferență greșită sau tipuri personalizate), compilatorul nu poate deduce corect tipul, iar atunci declararea explicită devine obligatorie.

Între tipuri diferite nu există conversie automată; trebuie să folosim explicit Int()、Double()、String() și alte forme similare.

Tipurile suportă și aliasuri. Mai ales în proiectele complexe, aliasurile de tip pot îmbunătăți lizibilitatea.

Tipul nu este doar o etichetă a datelor, ci și un mecanism de constrângere care poate asigura că folosirea datelor este sigură, clară și controlabilă.

## Cunoștințe extinse - tipuri opționale

În procesul conversiei de tip, unele operații pot eșua.

De exemplu, conversia unui String la Double:

```swift id="auw10m"
let input = "3.14"
let pi = Double(input)  // Double?
```

Aici, Double(input) nu returnează un Double, ci:

```id="6sl8r0"
Double?
```

Acesta este tipul opțional (Optional).

### De ce returnează un tip opțional?

Pentru că conținutul unui șir de caractere este nesigur: "3.14" poate fi convertit la Double, dar "Hello" nu poate.

Cu alte cuvinte, această operație poate reuși sau poate eșua.

De aceea, Swift folosește tipuri opționale pentru a reprezenta această incertitudine.

### Ce este un tip opțional?

Un tip opțional înseamnă: o valoare poate exista sau poate să nu existe.

De exemplu:

```id="970zqr"
Double?
```

Acest tip înseamnă că, dacă există o valoare, la afișare va apărea Optional(...), iar dacă nu există, va returna nil.

Trebuie observat că nil înseamnă „nu există valoare”, nu 0 și nici șir gol.

### Exemplu

```swift id="twjlwmig"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Rezultatul:

```id="n8r6qz"
pi:Optional(3.14)
```

Asta înseamnă că șirul a fost convertit cu succes la Double și a rezultat 3.14, dar pentru că tipul este Double?, valoarea este împachetată în Optional.

Dacă transformarea eșuează:

```swift id="6q7zrs"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Rezultatul:

```id="3t3dtx"
pi: nil
```

Pentru că "Hello" nu poate fi convertit la Double, conversia eșuează și returnează nil.

### Ce este Optional(...)?

Când afișăm direct un tip opțional:

```swift id="hwrjlwmn"
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift va afișa „descrierea de depanare” a valorii:

```id="3l5zii"
Optional(3.14)
```

Aceasta nu este o parte a datelor reale, ci doar indică faptul că valoarea curentă este un „tip opțional” și că în interior conține o valoare.

### Despachetarea unui tip opțional

În dezvoltarea reală, de obicei trebuie să extragem valoarea reală dintr-un tip opțional. Acest proces se numește despachetare (Unwrapping).

O metodă comună este folosirea lui ?? pentru a oferi o valoare implicită:

```id="p7m3xt"
??
```

Acesta se numește operatorul de coalescență pentru nil (Nil-Coalescing Operator).

De exemplu:

```swift id="l3gnp0"
name ?? "FangJunyu"
```

Acest cod înseamnă că, dacă name are o valoare, se returnează acea valoare; dacă este nil, se folosește valoarea implicită "FangJunyu".

Trebuie observat că tipul valorii implicite trebuie să fie același cu tipul valorii opționale.

### Folosirea lui ?? pentru a oferi o valoare implicită

```swift id="wtafw8"
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Rezultatul:

```id="ynx0uk"
pi: 30
```

Când input este convertit la Double, conversia reușește și se afișează valoarea. Dacă transformarea eșuează, va fi afișată valoarea implicită oferită de ??.

Dacă transformarea eșuează:

```swift id="nkvjlwm"
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Rezultatul:

```id="fqa4ln"
pi: 10
```

Aici, la conversia lui input la Double, transformarea eșuează și returnează nil, iar ?? furnizează o valoare implicită pentru nil.

Tipurile opționale sunt folosite pentru a reprezenta situațiile în care „poate exista o valoare sau poate să nu existe”.

În operațiile care pot eșua, cum ar fi conversia de tip, Swift va returna un tip opțional pentru a garanta siguranța programului.

Când avem nevoie să folosim valoarea din interior, putem furniza o valoare implicită prin ??, astfel încât, chiar dacă apare nil, să obținem în continuare un rezultat rezonabil.
