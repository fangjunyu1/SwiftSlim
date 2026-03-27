# Pușculiță

În această lecție, vom dezvolta un proiect simplu de tip „pușculiță”. Funcționalitatea este simplă, dar include o logică completă de interacțiune, fiind foarte potrivită pentru începători.

Prin acest proiect, vom învăța despre TextField (câmp de introducere), border și legarea datelor ($).

Obiectivul final este să realizăm un proiect „pușculiță” în care utilizatorul poate introduce o sumă, poate apăsa un buton pentru a o salva și poate acumula suma totală.

Efectul final:

![Piggy Bank](../../RESOURCE/014_view.png)

## Afișarea sumei totale

Mai întâi, trebuie să afișăm suma totală din „pușculiță”.

În ContentView, declarăm o variabilă pentru a salva suma totală din „pușculiță”.

```swift
@State private var amount = 0
````

Apoi, folosim Text pentru a afișa această sumă:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Aici folosim .font și .fontWeight pentru a seta dimensiunea și grosimea fontului.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Când amount se schimbă, suma totală afișată de Text se actualizează automat.

## Introducerea sumei

Pe lângă afișarea sumei totale, „pușculița” trebuie să permită utilizatorului să „introducă” suma pe care vrea să o depună. Pentru aceasta, trebuie să folosim controlul vizual TextField din SwiftUI.

### TextField

TextField este un control vizual din SwiftUI folosit pentru introducerea conținutului, de obicei pentru introducere pe un singur rând.

TextField oferă în principal două forme de legare:

**1. Legare la tip String**

```swift
TextField("Placeholder", text: $text)
```

Este potrivit pentru introducerea textului, cum ar fi nume sau titluri.

**2. Legare la tip numeric (Int/Double)**

```swift
TextField("Amount", value: $number, format: .number)
```

Este potrivit pentru vârstă, salariu, sume și alte valori numerice.

format: .number indică faptul că acest câmp va analiza și afișa conținutul în „format numeric”.

#### Text placeholder

Primul parametru al lui TextField este placeholder-ul, folosit pentru a sugera utilizatorului ce să introducă:

```swift
TextField("input your name", text: $text)
```

Când câmpul de introducere este gol, va afișa un text gri de sugestie.

![textfield](../../RESOURCE/014_textfield.png)

#### Legarea datelor

TextField nu este responsabil pentru salvarea persistentă a conținutului introdus; el trebuie să gestioneze datele printr-o variabilă legată.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Conținutul introdus de utilizator va fi salvat direct în variabila text, iar TextField se ocupă doar de interfața de introducere.

$ indică o legare (Binding):

```swift
$text
```

Aceasta nu este o variabilă obișnuită, ci un tip Binding.

Rolul ei este să creeze conexiunea dintre vizualizare și date:

Când utilizatorul introduce conținut în TextField, text se actualizează automat; când text se schimbă, și TextField se actualizează sincron.

De exemplu:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Când introduci conținut în TextField, Text-ul de deasupra se actualizează în timp real.

![textField](../../RESOURCE/014_textfield1.png)

### Legare la tip numeric

Când trebuie să introducem un număr, trebuie să legăm o variabilă de tipul corespunzător:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Când utilizatorul introduce o sumă, TextField va analiza conținutul introdus și va actualiza automat valoarea lui number.

## Adăugarea câmpului de introducere

După ce am înțeles utilizarea de bază a lui TextField, îl aplicăm în proiectul „pușculiță”.

„Pușculița” trebuie să introducă o „sumă”, așa că folosim modul „legare la tip numeric (Int/Double)” și adăugăm o nouă variabilă number pentru a salva suma introdusă de utilizator:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Acum, TextField afișează implicit valoarea lui number (valoarea implicită este 0).

Când conținutul introdus este șters, va afișa placeholder-ul „Amount”.

Acest lucru arată din nou că TextField afișează valoarea variabilei legate, nu își salvează singur conținutul.

### Problema dimensiunii câmpului de introducere

În vizualizarea curentă, vom observa că TextField nu are margine, afișează doar un 0, iar conținutul pare aliniat la stânga.

Efectul este următorul:

![textfield](../../RESOURCE/014_textfield2.png)

Asta se întâmplă deoarece, în mod implicit, TextField ocupă întreaga lățime a vizualizării părinte.

Putem verifica acest lucru adăugând o culoare de fundal:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Efectul este următorul:

![textfield](../../RESOURCE/014_textfield3.png)

Se poate vedea că, în realitate, TextField umple întreaga lățime a rândului.

### Setarea unei lățimi fixe

Dacă dorim ca acest câmp să fie mai compact, putem folosi frame pentru a-i limita lățimea:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Efectul este următorul:

![textfield](../../RESOURCE/014_textfield4.png)

### Adăugarea unei margini și a spațiului interior

Deoarece TextField nu are margine în mod implicit, putem adăuga manual stilul:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Acum, acest câmp de introducere arată mai mult ca un „câmp standard”.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

În SwiftUI, border este folosit pentru a adăuga o margine unei vizualizări.

Utilizarea de bază:

```swift
border(Color.black, width: 1)
```

Aici, Color.black reprezintă culoarea marginii, iar width reprezintă grosimea marginii.

În TextField, folosim:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Aceasta înseamnă că adăugăm o margine neagră de 1 pt câmpului de introducere.

Poți încerca și alte culori, cum ar fi Color.blue, Color.green, sau o margine mai groasă cu width: 2.

## Butonul de economisire

Acum avem o variabilă amount pentru afișarea sumei totale, un TextField pentru introducerea sumei și variabila number legată la câmpul de introducere.

Codul actual este următorul:

```swift
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
		}
    }
}
```

### Adăugarea unui buton

Mai jos, trebuie să adăugăm un buton pentru a declanșa operația de economisire.

```swift
Button("Save") {
    
}
```

### Implementarea logicii de economisire

Vrem ca utilizatorul să introducă o sumă, iar după apăsarea butonului, suma să fie adăugată automat la total.

```swift
Button("Save") {
    amount += number
}
```

Aici folosim „operatorul de atribuire compusă” pentru a adăuga suma introdusă de utilizator, number, la suma totală amount.

### Resetarea sumei introduse

Acum există o problemă: de fiecare dată când apăsăm butonul, suma din câmpul de introducere nu se golește.

Dacă utilizatorul introduce 10 și apasă Save, câmpul de introducere păstrează încă 10, ceea ce va afecta următoarea introducere.

Asta se întâmplă deoarece TextField este legat la number, iar când apăsăm butonul, modificăm doar amount; number nu se schimbă, deci câmpul continuă să afișeze vechea valoare.

Trebuie să adăugăm o logică de ștergere: când utilizatorul apasă butonul, mai întâi suma este adăugată la total, apoi valoarea introdusă este resetată:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Acum, când utilizatorul introduce o sumă și apasă butonul, suma introdusă se adaugă la total. number este resetat la 0, pentru a pregăti următoarea introducere.

Astfel, am realizat întreaga logică de economisire a proiectului „pușculiță”.

## Optimizarea vizualizării

După finalizarea funcționalității, putem face o optimizare simplă a interfeței, adăugând o imagine de fundal și un stil pentru buton.

Adăugarea stilului butonului:

```swift
.buttonStyle(.borderedProminent)
```

Adăugarea imaginii de fundal:

```swift
.background {
    Image("1")
}
```

Acum, am finalizat dezvoltarea completă a proiectului „pușculiță”.

## Cod complet

```swift
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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Efectul final:

![Piggy Bank](../../RESOURCE/014_view.png)

Acum putem încerca să depunem 100 sau chiar mai mulți bani pentru a verifica dacă logica „pușculiței” are probleme.

Sau putem rula „pușculița” în simulator ori pe un dispozitiv fizic, pentru a experimenta aplicația pe care am dezvoltat-o.

### Ieșire de depanare

Pentru a verifica dacă logica este corectă, putem adăuga și o logică de depanare în buton, pentru a verifica dacă suma introdusă este corectă:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

De fiecare dată când economisim bani și apăsăm butonul, putem vedea ieșirea de depanare corespunzătoare, pentru a verifica dacă există probleme în logică.

```
---Saving---
amount:11
number:0
```
