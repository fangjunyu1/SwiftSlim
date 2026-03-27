# Carusel de citate

În această lecție, vom implementa funcționalitatea unui „carusel de citate” și vom aprofunda cunoștințele de bază din Swift despre array-uri (Array) și instrucțiunile de condiție (if-else).

Vom arăta cum se pot salva mai multe citate și cum se poate realiza rotația lor ciclică prin interacțiunea cu butoane.

![alt text](../../RESOURCE/011_word.png)

## Afișarea unui citat

Mai întâi, trebuie să afișăm un citat în SwiftUI.

Cea mai simplă metodă este să folosim view-ul Text:

```swift
Text("Slow progress is still progress.")
````

Acest cod poate afișa doar un singur citat fix. Dacă vrem să afișăm mai multe citate și să realizăm funcția de comutare, trebuie să le salvăm.

Însă o variabilă obișnuită de tip String poate salva doar un singur citat:

```swift id="83ziv4"
let sayings = "Slow progress is still progress."
```

Dacă trebuie să salvăm mai multe citate, atunci ar trebui să declarăm câte o variabilă pentru fiecare citat:

```swift id="jeyzq5"
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Dar în dezvoltarea reală, această metodă nu este doar greoaie, ci și lipsită de flexibilitate, deoarece fiecare variabilă este independentă și nu putem implementa o rotație convenabilă.

Pentru a gestiona mai ușor mai multe citate, avem nevoie de o structură de date care să le stocheze împreună, iar aceasta este array-ul (Array).

După folosirea unui array, codul de mai sus poate fi salvat astfel:

```swift id="0byefh"
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Observație: în convențiile de programare, numele unei variabile array care stochează mai multe elemente folosește de obicei forma de plural, cum ar fi sayings, pentru a reflecta natura sa de colecție.**

## Array

În Swift, un array este o colecție ordonată de elemente și este reprezentat prin paranteze pătrate [].

```swift id="v5j1ze"
[]
```

În interiorul unui array pot exista mai multe elemente de același tip, iar elementele sunt separate prin virgulă englezească ,.

De exemplu:

```swift id="xke10q"
[101, 102, 103, 104, 105]
```

Putem înțelege un array, în mod simplificat, ca pe un tren:

![Array](../../RESOURCE/011_array1.png)

Întregul tren reprezintă acest obiect array, iar fiecare vagon este aranjat într-o anumită ordine.

### Index și accesarea elementelor

Deoarece array-ul este ordonat, sistemul poate localiza un element concret în funcție de ordine. Acest mecanism de localizare se numește index (Index).

În Swift (și în majoritatea limbajelor de programare), indexul unui array începe de la 0, nu de la 1. Asta înseamnă că primul element din array are indexul 0, al doilea are indexul 1 și așa mai departe.

![Array](../../RESOURCE/011_array2.png)

Dacă vrei să accesezi un element anume din array, este suficient să adaugi paranteze pătrate după numele array-ului și să introduci în ele valoarea indexului elementului dorit.

De exemplu:

```swift id="1yknq1"
sayings[0]   // 101
sayings[1]   // 102
```

Dacă încerci să accesezi un index aflat în afara intervalului valid al array-ului, va apărea problema numită „index out of range”. De aceea, atunci când accesezi un array, trebuie să fii atent și să te asiguri că indexul este valid.

**Depășirea limitelor indexului**

De exemplu, când array-ul are doar 5 elemente, intervalul legal al indexului este de la 0 la 4. Dacă încercăm să accesăm sayings[5], programul nu va putea găsi „vagonul” corespunzător și va apărea eroarea „index out of range”, ceea ce va duce la prăbușirea aplicației.

![Array](../../RESOURCE/011_array3.png)

### Operarea asupra array-urilor

Array-urile nu doar că suportă definirea statică, ci și operații precum adăugarea, ștergerea, modificarea elementelor și obținerea lungimii array-ului.

Observație: dacă trebuie să modifici un array, trebuie să-l declari cu var, nu cu let.

**1. Adăugarea unui element**

Poți folosi metoda append pentru a adăuga un element la sfârșitul array-ului:

```swift id="9ptv7p"
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Ștergerea unui element**

Prin metoda remove(at:), poți șterge un element specificat din array:

```swift id="c4e6hh"
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modificarea unui element**

Poți modifica direct un element din array folosind indexul:

```swift id="7l65x2"
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Numărarea elementelor din array**

Folosește proprietatea count pentru a obține numărul de elemente din array:

```swift id="n7cm12"
var num = [0, 1, 2]
num.count   // 3
```

### Folosirea array-ului pentru a afișa citate

Pentru a afișa mai multe citate, putem salva citatele într-un array, apoi să le accesăm și afișăm prin index.

Mai întâi, în ContentView, creăm un array sayings pentru a stoca citatele, apoi în view-ul Text citim și afișăm citatul corespunzător prin index:

```swift id="xnudvc"
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Aici, sayings[0] reprezintă primul citat din array.

Dacă vrei să afișezi alt citat, trebuie doar să modifici valoarea indexului din paranteze:

```swift id="0e8r8n"
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definirea indexului citatului

Pentru a realiza schimbarea dinamică a citatelor, nu putem „scrie fix” indexul direct în view-ul Text.

Trebuie să creăm o variabilă care să salveze separat indexul afișat în prezent.

În SwiftUI, putem folosi @State pentru a declara un index care se poate modifica:

```swift id="dl0aen"
@State private var index = 0
```

SwiftUI va monitoriza variabila împachetată cu @State. Când index se schimbă, SwiftUI va re-randa view-ul și va afișa citatul corespunzător.

Apoi folosim sayings[index] pentru a obține dinamic citatul din array:

```swift id="l22eni"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Când valoarea lui index se schimbă, Text va afișa un alt citat.

### Folosirea butonului pentru a controla indexul

Pentru a controla schimbarea citatelor, putem folosi Button pentru a modifica valoarea lui index. La fiecare apăsare a butonului, index crește automat cu 1:

```swift id="id5gog"
Button("Next") {
    index += 1
}
```

Când apăsăm butonul, valoarea lui index va trece de la 0 la 1, ceea ce va declanșa reîmprospătarea view-ului, iar Text(sayings[index]) va citi următorul citat.

Totuși, aici există o problemă potențială: dacă apăsăm butonul de prea multe ori, index va crește până la o valoare care depășește limitele array-ului, iar asta va duce la eroarea de depășire a indexului. De exemplu, când index ajunge la 5 (iar intervalul valid este de la 0 la 4), aplicația se va prăbuși.

Pentru a preveni depășirea indexului array-ului, trebuie să introducem control condițional, astfel încât index să nu iasă din limitele array-ului. Putem folosi instrucțiunea if-else pentru a verifica dacă index este mai mic decât lungimea array-ului.

## Control condițional: instrucțiunea if-else

Instrucțiunea if-else este una dintre cele mai frecvente instrucțiuni condiționale din Swift. Ea este folosită pentru a verifica dacă o condiție este adevărată și pentru a executa cod diferit în funcție de rezultat.

Structura de bază:

```swift id="7vqv6f"
if condition {
    // Cod executat când condition este true
} else {
    // Cod executat când condition este false
}
```

În instrucțiunea if, condiția condition este o valoare booleană (de tip Bool), adică true sau false. Când condiția este true, se execută codul din if; altfel se execută codul din else.

De exemplu:

```swift id="rc1rq6"
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

În acest exemplu, valoarea lui age este 25, iar instrucțiunea if verifică dacă age > 18 este adevărat. Dacă da, se afișează "Big Boy".

Dacă nu ai nevoie de partea else, aceasta poate fi omisă:

```swift id="7zik5r"
if condition {
    // Cod executat când condition este true
}
```

### Folosirea controlului condițional pentru a limita indexul

Pentru a preveni depășirea limitelor array-ului, putem folosi instrucțiunea if pentru a ne asigura că index nu va depăși intervalul array-ului:

```swift id="ihmjlwm"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analiza logicii: valoarea lui sayings.count este 5 (există 5 citate), deci sayings.count - 1 este 4, care este și ultimul index valid al array-ului.

Când index este mai mic decât 4, este sigur să crească cu 1 la apăsarea butonului; odată ce index ajunge la 4, condiția nu mai este îndeplinită și apăsarea butonului nu mai produce nicio reacție.

Acum codul a realizat deja funcția de schimbare a citatelor:

```swift id="9drb0z"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Citate în buclă

Dacă vrem ca, după afișarea ultimului citat, apăsarea butonului să afișeze din nou primul citat și astfel să realizăm o afișare circulară, putem face acest lucru prin partea else:

```swift id="fr4v2q"
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Când butonul este apăsat, dacă index a ajuns la ultimul element al array-ului, el va fi resetat la 0 și caruselul de citate va începe din nou.

## Optimizarea view-ului de citate

Acum logica de bază a caruselului de citate este deja implementată, dar putem optimiza în continuare interfața pentru a o face mai plăcută vizual.

Cod complet:

```swift id="ax8ppk"
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

În acest exemplu, view-ul Text are un fundal alb semi-transparent și colțuri rotunjite, butonul Button folosește stilul .borderedProminent, iar VStack are o imagine de fundal.

Completare de cunoștințe: când folosești modificatorul background() pentru a trata un fundal de imagine, comportamentul său implicit este să umple pe cât posibil zona de layout a view-ului curent. În multe situații, el se poate extinde în mod natural și peste Safe Area.

Acum am realizat view-ul caruselului de citate.

![SwiftUI View](../../RESOURCE/011_word.png)

## Rezumat

Prin studiul acestei lecții, am învățat cum să folosim un array pentru a stoca mai multe citate și cum să folosim instrucțiunile if și if-else pentru a realiza rotația citatelor.

Am înțeles și operațiile de bază asupra array-urilor, precum adăugarea, ștergerea și modificarea elementelor, precum și modul de prevenire a depășirii limitelor indexului.

Această lecție nu doar a explicat implementarea funcției de carusel de citate, ci a combinat și utilizarea de bază a array-urilor și a instrucțiunilor condiționale, ajutându-ne să înțelegem mai bine cum se gestionează datele și fluxul programului.

## Cunoștințe extinse - condiții multiple: instrucțiunea if-else if-else

În dezvoltarea reală, adesea trebuie să gestionăm mai multe condiții. De exemplu, într-un joc, când scorul este egal cu 1 se declanșează evenimentul A, când este egal cu 2 se declanșează evenimentul B, când este egal cu 3 se declanșează evenimentul C și așa mai departe.

În situațiile în care există mai mult de două ramuri condiționale, avem nevoie să folosim instrucțiunea if-else if-else pentru a face o verificare multiplă.

Sintaxa de bază:

```swift id="k58hzn"
if conditionA {
    // Cod executat când conditionA este true
} else if conditionB {
    // Cod executat când conditionB este true
} else if conditionC {
    // Cod executat când conditionC este true
} else {
    // Cod executat când niciuna dintre condiții nu este îndeplinită
}
```

În acest caz, programul va verifica condițiile în ordine și va executa prima ramură care este adevărată. Dacă nicio condiție nu este îndeplinită, se va executa codul de după else.

În caruselul de citate, putem folosi și instrucțiunea if-else if-else pentru a face mai multe verificări:

```swift id="jlwmqg"
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Când index este 0, 1, 2 sau 3, fiecare apăsare a butonului execută index += 1; când index este 4 (ultimul element), index este resetat la 0, realizând astfel rotația circulară.

Ramura else este folosită ca protecție suplimentară, pentru a preveni apariția unor valori invalide (de exemplu, dacă index a fost modificat greșit).

Trebuie observat că operatorul == folosit aici înseamnă „este egal cu”. Dacă instrucțiunea if verifică dacă index este egal cu o anumită valoare, rezultatul va fi true și se va executa blocul de cod următor. Dacă nu este egal, se va continua verificarea următoarei condiții if.

Acest tip de condiționare multiplă este util atunci când, în scenarii diferite, trebuie executat cod diferit.
