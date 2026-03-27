# Cum să faci butonul să funcționeze

În această lecție vom învăța în principal despre butonul Button, ieșirea de depanare cu print și funcțiile din Swift.

Aceste conținuturi reprezintă baza programării interactive în SwiftUI.

## Butonul

Butonul este unul dintre cele mai comune controale UI. Când avem nevoie să descărcăm, să deschidem sau să ieșim dintr-o aplicație, de obicei apăsăm un buton.

De exemplu, în App Store, apeși butonul „Obține” pentru a descărca o aplicație.

![Button](../../RESOURCE/008_button.png)

În SwiftUI, butonul este reprezentat prin Button.

Utilizarea de bază:

```swift
Button("") {
    
}
````

Structura poate fi împărțită în două părți:

```swift
Button("Textul butonului") {
    Codul executat când butonul este apăsat
}
```

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

După rulare, va fi afișat un buton Start.

![Button](../../RESOURCE/008_button1.png)

Când utilizatorul apasă butonul, codul din interiorul {} va fi executat.

Trebuie observat că Button este un control de interfață (View) din SwiftUI, deci trebuie scris în body.

### Modificatorul buttonStyle

În SwiftUI, Button oferă stiluri de buton integrate în sistem, care pot fi folosite prin modificatorul buttonStyle.

De exemplu:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle va folosi stilul de buton oferit de sistem.

Opțiunile comune includ:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

Diferențele dintre stiluri se reflectă în principal în existența sau nu a chenarului, a fundalului și în gradul de accent vizual.

## Ieșirea print

În programare, este adesea nevoie să verificăm dacă programul a ajuns la un anumit segment de cod.

Swift oferă funcția print pentru a afișa informații de depanare.

Sintaxa de bază:

```swift
print("Hello")
```

Această linie de cod va afișa textul în Console.

### Testarea funcționării butonului

Putem scrie print în interiorul butonului pentru a testa dacă butonul a fost apăsat.

```swift
Button("Start") {
    print("Test 123")
}
```

Când butonul este apăsat, Console va afișa:

```
Test 123
```

Asta înseamnă că butonul a fost declanșat cu succes.

![Button](../../RESOURCE/008_button3.png)

Atenție: print este cod Swift, nu un control de interfață. Nu poate fi pus direct în body, altfel va apărea o eroare.

De exemplu, următorul cod este greșit:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Eroare: body trebuie să returneze un View
    }
}
```

În SwiftUI, body este folosit pentru a descrie structura interfeței și poate conține doar controale de interfață (View), cum ar fi Text, Button, Image etc.

Codul obișnuit (logică de calcul, print etc.) trebuie plasat în butoane, funcții sau în alți handleri de evenimente.

### Consola Console

Conținutul afișat de print va apărea în Console din Xcode.

Dacă nu vezi Console, poți apăsa butonul Show the Debug Area din colțul din dreapta jos pentru a deschide zona de depanare, apoi apasă Show the Console pentru a afișa consola.

![](../../RESOURCE/008_button4.png)

În colțul din stânga jos al Console există două etichete: Executable și Previews.

![](../../RESOURCE/008_button5.png)

Aceste două etichete corespund unor medii de rulare diferite: când rulezi în vizualizarea de previzualizare Canvas, ieșirea print va apărea sub eticheta Previews; dacă rulezi aplicația în simulator sau pe un dispozitiv real, ieșirea va apărea sub eticheta Executable.

Prin urmare, dacă observi că print nu afișează nimic, mai întâi verifică dacă ai selectat eticheta corectă.

## Exemplu - ASCII art

În unele proiecte de cod, se poate vedea frecvent ASCII art.

ASCII art este un desen realizat din caractere obișnuite, de exemplu:

![ASCII](../../RESOURCE/008_ascii.png)

Putem folosi Button + print pentru a afișa un desen ASCII.

Exemplu de cod:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Când butonul este apăsat, Console va afișa:

```
 /\_/\
( o.o )
 > ^ <
```

Atenție: caracterul \ din string trebuie scris ca \, deoarece backslash-ul este un caracter de escape în stringuri.

## Funcții

În interiorul butonului, putem scrie direct cod.

De exemplu:

```swift
Button("Start") {
    print("Hello")
}
```

Dacă există puțin cod, această scriere nu este o problemă. Dar în dezvoltarea reală, logica declanșată de un buton poate fi mult mai amplă.

De exemplu:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Pot exista încă multe linii de cod
}
```

Dacă volumul de cod crește, scrierea lui direct în interiorul butonului va face codul interfeței dezordonat și greu de citit și întreținut.

De aceea, de obicei organizăm acest cod într-o funcție, apoi apelăm funcția în buton.

### Ce este o funcție

O funcție este un fragment de cod care poate fi reutilizat.

Când anumit cod trebuie executat, trebuie doar să apelăm această funcție, iar codul din interiorul ei va rula.

Astfel, structura codului devine mai clară și reutilizarea este mai ușoară.

### Sintaxa de bază

În Swift, o funcție este definită folosind cuvântul-cheie **func**:

```swift
func randomInt() {
    // code
}
```

Acest cod definește o funcție.

randomInt este numele funcției și este folosit pentru a identifica acest fragment de cod.

() reprezintă locul pentru parametri; aici pot fi primite date transmise din exterior. Dacă nu sunt necesare date, poate rămâne gol.

Interiorul {} este zona de cod a funcției, iar tot codul care trebuie executat este scris aici.

De exemplu:

```swift
func getName() {
    print("FangJunyu")
}
```

Rolul acestei funcții este să afișeze un text.

### Apelarea unei funcții

Definirea unei funcții înseamnă doar crearea acelui fragment de cod. Dacă vrei să îl execuți, trebuie să apelezi funcția.

Modul de apelare este să adaugi () după numele funcției:

```swift
getName()
```

Când programul ajunge la această linie, codul din funcția getName va fi executat.

Exemplu complet:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

După rulare, Console va afișa:

```
FangJunyu
```

### Folosirea funcțiilor în SwiftUI

Într-un view SwiftUI, funcțiile sunt de obicei scrise în afara lui body.

De exemplu:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Când butonul este apăsat, va fi apelată funcția getName().

Astfel, codul interfeței rămâne simplu, iar logica concretă este tratată în funcție.

### Parametrii funcției

Uneori, o funcție trebuie să execute operații diferite în funcție de date diferite.

De exemplu, vrem ca funcția să poată afișa nume diferite, nu doar "FangJunyu".

În acest caz, putem folosi parametri. Parametrii pot fi înțeleși ca datele transmise atunci când funcția este apelată.

De exemplu:

```swift
func getName(name: String) {
    print(name)
}
```

Această funcție adaugă un parametru nou. name este numele parametrului, iar String este tipul parametrului.

Asta înseamnă că funcția trebuie să primească o valoare de tip String.

Deoarece funcția are acum nevoie de date, la apelare trebuie să furnizăm acele date.

```swift
getName(name: "Sam")
```

Când este transmis "Sam", funcția va folosi această valoare pentru afișare.

Rezultatul rulării:

```
Sam
```

## Exemplu - folosirea funcțiilor pentru a afișa ASCII art

În exemplul anterior, am scris print direct în interiorul butonului.

Dar dacă desenul ASCII este mai complex, codul va deveni foarte lung. În acest caz, putem muta logica într-o funcție, pentru ca interfața să fie mai clară.

Exemplu de cod:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

După rulare, când butonul este apăsat, Console va afișa:

```
 /\_/\
( o.o )
 > ^ <
```

Aici se întâmplă două lucruri. După ce utilizatorul apasă butonul:

1. Butonul apelează funcția printCat()
2. Codul print din funcție este executat

Astfel, codul interfeței se ocupă doar de declanșarea evenimentului, iar logica concretă este pusă în funcție.

În dezvoltarea reală, majoritatea acțiunilor butoanelor sunt implementate prin funcții.

## Rezumat

În această lecție am învățat trei conținuturi importante:

**1. Butonul Button**

Button este controlul din SwiftUI folosit pentru a declanșa acțiuni.

```swift
Button("Start") {

}
```

Când utilizatorul apasă butonul, codul din acolade va fi executat.

**2. Ieșirea print**

print este folosit pentru a afișa informații de depanare în Console.

```swift
print("Hello")
```

Dezvoltatorul poate verifica starea rulării programului prin Console.

**3. Funcțiile**

O funcție este un fragment de cod reutilizabil.

```swift
func sayHello() {
    print("Hello")
}
```

Apelarea funcției:

```swift
sayHello()
```

Dacă funcția are nevoie de date, putem folosi parametri:

```swift
func sayHello(name: String) {
    print(name)
}
```

În lecțiile următoare, vom continua să învățăm mai multe controale SwiftUI și modul în care datele interacționează cu interfața.

## Exercițiu

Încearcă să finalizezi următorul exercițiu:

1. Creează un buton cu textul "Hello"
2. Când butonul este apăsat, afișează Hello Swift în Console
3. Scrie codul de afișare într-o funcție, apoi apelează acea funcție în buton
