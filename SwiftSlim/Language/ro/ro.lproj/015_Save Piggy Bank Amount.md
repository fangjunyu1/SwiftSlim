# Salvarea sumei din pușculiță

În lecția anterioară, am realizat o „pușculiță” simplă. În această lecție, vom învăța cum să salvăm persistent suma din „pușculiță”.

Această lecție se concentrează în principal pe UserDefaults și pe property wrapper-ul @AppStorage. În același timp, vom extinde explicația despre rolul lui onAppear și despre modul de utilizare al tipului opțional (nil).

Trebuie menționat că această lecție continuă pe baza codului „pușculiței” dezvoltat în lecția anterioară.

## Problema salvării persistente

Acum, interfața „pușculiței” este foarte simplă și comodă de folosit.

![Piggy Bank](../../Resource/014_view.png)

Totuși, există o problemă evidentă: de fiecare dată când vizualizarea este reîmprospătată sau când aplicația este închisă, suma totală din „pușculiță” revine la 0, iar suma totală anterioară se pierde complet.

Asta înseamnă că datele nu sunt cu adevărat salvate. Cu alte cuvinte, „pușculița” actuală poate salva doar date temporare.

### De ce nu poate fi salvată persistent?

Asta se întâmplă deoarece folosim o variabilă declarată cu @State:

```swift id="q1b8ye"
@State private var amount = 0
````

Variabila declarată cu @State are ciclul ei de viață complet dependent de vizualizare.

Când vizualizarea este creată, amount este inițializat cu 0; când vizualizarea este distrusă, amount este distrus.

Datele salvate aici în amount există doar în memorie și nu sunt salvate pe dispozitiv.

Dacă nu vrem ca amount să fie legat de ciclul de viață al vizualizării, trebuie să implementăm salvarea persistentă a datelor. Cu alte cuvinte, să salvăm datele pe dispozitiv.

### Ce înseamnă „persistența datelor”

Persistența datelor poate fi înțeleasă ca procesul de a salva datele din „memoria temporară” în „stocarea dispozitivului”.

Astfel, atunci când vizualizarea este închisă sau aplicația este închisă, datele nu se pierd.

În dezvoltarea Swift, pentru o „persistență a datelor” simplă se poate folosi UserDefaults, iar pentru date mai complexe este nevoie de SwiftData sau CoreData.

În această lecție, vom învăța mai întâi cel mai simplu mecanism: UserDefaults.

## UserDefaults

UserDefaults este folosit pentru a salva date ușoare sub formă de perechi cheie-valoare și este utilizat frecvent pentru stocarea tipurilor de bază precum String, Int, Double, Bool etc.

### Salvarea datelor

UserDefaults folosește metoda set pentru a salva date:

```swift id="i8o6wf"
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Primul parametru din UserDefaults reprezintă datele ce urmează să fie salvate; aici sunt transmise tipuri precum String și Int.

Al doilea parametru, forKey, este asemănător numelui unei variabile și este folosit pentru a identifica datele salvate în UserDefaults.

### Citirea datelor

UserDefaults folosește metode corespunzătoare pentru citire:

```swift id="n4n7tn"
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

La citire, trebuie folosită metoda corespunzătoare tipului, altfel pot apărea erori sau date incorecte.

### Lucruri de reținut despre UserDefaults

#### 1. Returnează tip opțional

Atunci când citim date din UserDefaults, unele metode returnează un tip opțional (Optional).

De exemplu:

```swift id="ddt7x5"
let name = UserDefaults.standard.string(forKey: "name")
```

Tipul returnat pentru name este:

```swift id="1v7smr"
String?
```

Asta înseamnă că poate avea o valoare sau poate să nu aibă nicio valoare.

**De ce returnează un tip opțional?**

Pentru că o anumită cheie din UserDefaults nu are neapărat date corespunzătoare salvate.

De exemplu:

```swift id="jn0e4v"
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Dacă cheia "City" nu a fost salvată niciodată înainte, atunci rezultatul citirii va fi:

```swift id="l1w9lu"
nil
```

Trebuie subliniat că nil înseamnă lipsa datelor, nu un șir gol.

În lecția „sistemul de tipuri”, am întâlnit o problemă similară: când conversia tipului de date eșuează, este returnat un tip opțional.

În acest caz, trebuie să folosim ?? pentru a oferi o valoare implicită și pentru a face despachetarea:

```swift id="f5k1kz"
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Dacă UserDefaults citește date, se folosește valoarea citită; dacă nu poate citi nimic (nil), se folosește valoarea implicită.

#### 2. Returnează tip non-opțional

Când UserDefaults citește tipurile Int, Double și Bool, returnează tipuri non-opționale.

De exemplu:

```swift id="7ql5a3"
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Chiar dacă aceste chei nu au avut niciodată date salvate, valorile returnate nu vor fi nil.

În schimb, vor returna valori implicite:

```swift id="vdr56o"
Int → 0
Double → 0.0
Bool → false
```

#### 3. Limitarea cantității de date

UserDefaults este potrivit doar pentru salvarea unei cantități mici de date, cum ar fi configurațiile aplicației sau stări simple.

În practică, nu este potrivit pentru salvarea unor cantități mari de date sau a datelor care sunt citite și scrise frecvent.

## Salvarea sumei din „pușculiță”

Acum putem folosi UserDefaults pentru a implementa logica de salvare a sumei totale din „pușculiță”.

Atunci când utilizatorul apasă butonul, suma introdusă se adaugă la suma totală, iar apoi suma totală este salvată în UserDefaults.

```swift id="h6vjlwm"
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Acum am realizat logica de scriere a datelor.

## Explicația logicii de persistență a datelor

Deși am realizat logica de scriere pentru persistența datelor, la rularea efectivă vom observa că, de fiecare dată când vizualizarea este reîmprospătată sau aplicația este redeschisă, variabila amount rămâne tot 0.

Asta deoarece:

```swift id="cxj6b8"
@State private var amount = 0
```

În SwiftUI, variabilele @State sunt reinițializate atunci când vizualizarea este creată din nou.

Chiar dacă valoarea lui amount a fost salvată în UserDefaults, când vizualizarea este reîncărcată, amount este tot resetat la 0.

Asta arată că, momentan, doar salvăm datele în UserDefaults, dar nu le și restaurăm în vizualizare.

Prin urmare, atunci când vizualizarea se încarcă, trebuie să citim manual datele din UserDefaults și să le atribuim din nou lui amount pentru a realiza întreaga logică de persistență.

### Analogie logică

Putem înțelege acest proces ca fiind „tabla din clasă”:

În timpul orei, profesorul scrie conținutul pe tablă, iar acel conținut este similar cu starea actuală a vizualizării (@State).

Când ora se termină, tabla este ștearsă pentru a pregăti următoarea lecție. Acest lucru corespunde distrugerii vizualizării, iar datele din @State sunt și ele șterse.

Pentru a evita pierderea conținutului predat, profesorul salvează în prealabil conținutul într-un suport de curs. Acest suport de curs este similar cu datele salvate în UserDefaults.

Când începe următoarea lecție, tabla este goală la început (@State este inițializat), iar profesorul trebuie să rescrie pe tablă cunoștințele anterioare pe baza suportului de curs (citirea din UserDefaults).

Trebuie înțeles că tabla nu își recuperează automat conținutul anterior; acesta trebuie rescris prin „citirea suportului de curs” (citirea din UserDefaults).

## Citirea datelor folosind onAppear

Atunci când vizualizarea apare, trebuie să citim manual valoarea din UserDefaults și să o atribuim variabilei amount declarate cu @State, pentru a realiza persistența reală a datelor.

În SwiftUI, putem folosi onAppear pentru a executa logica de inițializare atunci când vizualizarea este afișată:

```swift id="wf2opz"
.onAppear {}
```

Punem codul de citire din UserDefaults în onAppear:

```swift id="oc7g0v"
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Când vizualizarea este creată, amount este inițializat cu 0; când vizualizarea apare, se declanșează onAppear, iar valoarea este citită din UserDefaults și atribuită lui amount. Astfel, vizualizarea poate afișa ultima sumă totală salvată.

Acum, întreaga logică de persistență a datelor din „pușculiță” este completă.

## Cod complet

```swift id="am0h9h"
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Property wrapper-ul @AppStorage

SwiftUI oferă property wrapper-ul @AppStorage, care poate simplifica logica de salvare cu UserDefaults.

```swift id="ouqj7u"
@AppStorage("amount") private var amount = 0
```

@AppStorage este o abstractizare peste UserDefaults, iar "amount" corespunde cheii din UserDefaults.

Când vizualizarea este creată, datele sunt citite din UserDefaults; când variabila se modifică, valoarea este scrisă automat în UserDefaults.

În plus, suportă mecanismul de actualizare a stării din SwiftUI și, la fel ca @State, va reîmprospăta vizualizarea când valoarea se schimbă.

Cu alte cuvinte, @AppStorage poate realiza atât logica de citire, cât și pe cea de salvare a datelor, fără să mai fie nevoie să apelăm manual UserDefaults sau să folosim onAppear pentru a citi datele.

Prin urmare, putem folosi @AppStorage pentru a înlocui codul cu UserDefaults:

```swift id="r06twz"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Rezumat

În această lecție am învățat în principal următoarele puncte:

Mai întâi, UserDefaults este folosit pentru salvarea datelor ușoare, iar noi l-am folosit pentru a salva suma totală pe dispozitiv. UserDefaults oferă metode de citire și scriere și necesită, de asemenea, gestionarea tipurilor opționale în anumite situații.

În al doilea rând, variabilele @State sunt folosite doar pentru gestionarea stării temporare din vizualizare, iar ciclul lor de viață este identic cu cel al vizualizării. Când vizualizarea este recreată, @State este reinițializat.

Atunci când restaurăm datele din UserDefaults, am învățat să folosim onAppear pentru a citi datele atunci când vizualizarea apare și pentru a finaliza restaurarea lor.

În final, am folosit @AppStorage pentru a înlocui UserDefaults, astfel încât datele să fie citite automat la încărcarea vizualizării și scrise automat atunci când valorile se schimbă, înlocuind astfel logica manuală bazată pe UserDefaults și onAppear.

Prin aceste cunoștințe, putem implementa o funcție de bază de stocare a datelor într-o aplicație, astfel încât datele să poată fi salvate persistent.

## Exercițiu după lecție

Acum, „pușculița” suportă salvarea sumei, dar funcționalitatea ei este încă incompletă.

1. Când utilizatorul dorește să retragă o sumă, trebuie proiectată logica corespunzătoare pentru retragere.
2. Când utilizatorul dorește să golească suma, trebuie implementată și logica de resetare.
3. Dacă vrem să adăugăm și un nume pentru pușculiță, trebuie să introducem și salvarea datelor de tip String.

Poți îmbunătăți aceste funcții pe baza implementării existente, pentru ca funcționalitatea „pușculiței” să fie mai completă.

## Cunoștințe extinse - problema valorii implicite din câmpul de introducere

Acum putem optimiza și mai mult interacțiunea cu câmpul de introducere, pentru ca introducerea valorilor să fie mai comodă.

![textfield](../../Resource/015_view.png)

În implementarea actuală, valoarea implicită a câmpului de introducere este 0. De fiecare dată când utilizatorul introduce o sumă, trebuie mai întâi să șteargă 0 și apoi să introducă noua valoare, iar această experiență de interacțiune nu este rezonabilă.

Ar trebui să facem ca valoarea inițială a câmpului de introducere să fie goală, nu 0.

Asta se întâmplă deoarece TextField și number sunt legate bidirecțional:

```swift id="sy7h5s"
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Când number este inițializat cu 0, câmpul de introducere va afișa și el 0.

Prin urmare, trebuie să schimbăm number într-o valoare goală, adică nil.

```swift id="h3ncof"
@State private var number = nil
```

În acest moment va apărea o eroare:

```id="mhl0e6"
Generic parameter 'Value' could not be inferred
```

Aceasta este exact situația despre care am vorbit în lecția „sistemul de tipuri”: atunci când tipul unei variabile nu poate fi dedus automat, trebuie să declarăm explicit tipul acelei variabile.

Pentru că setăm number la nil, iar nil în sine nu conține nicio informație de tip, compilatorul nu poate determina dacă această variabilă este de tip String, Int sau altceva, așa că va apărea eroarea.

Prin urmare, trebuie să declarăm explicit tipul lui number:

```swift id="x2zqfr"
@State private var number:Int? = nil
```

Aici, Int? reprezintă un tip opțional (Optional), ceea ce înseamnă că valoarea lui number poate fi un Int sau poate fi nil.

Astfel, dacă îl inițializăm cu nil, câmpul de introducere va fi gol, nu va mai afișa 0.

### Despachetarea tipului opțional

După ce am modificat number într-un tip opțional, codul de calcul existent va da eroare:

```swift id="9jmh0p"
amount += number
```

Mesajul este:

```swift id="0nhnhu"
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Asta deoarece number poate fi acum nil. Dacă participă direct la calcul, situația devine:

```swift id="23gmm6"
amount += nil
```

Este evident că nil nu poate fi adunat la amount; aceasta este o operație invalidă.

Prin urmare, atunci când un tip opțional participă la calcule, trebuie mai întâi despachetat.

Aici putem folosi ?? pentru a oferi o valoare implicită:

```swift id="lnji0s"
amount += number ?? 0
```

Când number este nil, se va folosi valoarea implicită 0; când number are o valoare, se va folosi valoarea efectiv introdusă.

Astfel, garantăm corectitudinea calculului și obținem și efectul dorit: câmpul de introducere este gol în mod implicit, iar utilizatorul nu mai trebuie să șteargă manual 0 din el.

## Cod extins

```swift id="bmygce"
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```