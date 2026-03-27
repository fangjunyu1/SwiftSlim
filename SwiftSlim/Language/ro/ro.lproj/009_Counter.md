# Contorul

În primele două lecții, am învățat despre variabile, constante, butoane și funcții.

În această lecție, vom combina aceste cunoștințe pentru a crea o aplicație simplă de tip contor.

În acest exemplu, vom învăța cum să salvăm și să modificăm o variabilă și cum să folosim @State pentru a gestiona variabila.

## Implementarea contorului

Contorul este folosit de obicei pentru a înregistra o cantitate care trebuie acumulată în mod continuu. De exemplu, numărul de sărituri cu coarda, numărul de ture alergate și alte scenarii de numărare.

Mai jos vom crea un contor simplu: afișăm un număr și un buton, iar când apăsăm butonul, numărul crește.

![Num](../../RESOURCE/009_num.png)

### Afișarea numărului

Mai întâi, folosim Text pentru a afișa un număr.

```swift
Text("0")
````

Dar dacă numărul trebuie să se schimbe, nu putem scrie direct "0", ci trebuie să folosim o variabilă pentru a salva numărul.

```swift
var num = 0
```

Apoi afișăm variabila în Text:

```swift
Text("\(num)")
```

Aici este folosită interpolarea de șiruri \() pentru a converti numărul în text și a-l afișa.

### Butonul mărește numărul

În continuare, adăugăm un buton.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Când butonul este apăsat, vrem ca numărul să crească.

De aceea putem modifica variabila în interiorul butonului:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Acest cod înseamnă: când butonul este apăsat, se calculează num + 1, iar rezultatul este atribuit lui num.

### O scriere mai concisă

Swift oferă o scriere mai concisă:

```swift
num += 1
```

Ea este echivalentă cu:

```swift
num = num + 1
```

Această scriere se numește „operator compus de atribuire”.

Operatorii compuși de atribuire frecvent întâlniți în Swift sunt:

```
+=   atribuire prin adunare
-=   atribuire prin scădere
*=   atribuire prin înmulțire
/=   atribuire prin împărțire
%=   atribuire prin rest
```

De exemplu:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Cod complet

Acum putem scrie un contor simplu:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Totuși, în acest moment codul nu poate rula corect.

### Apare o eroare

Xcode va afișa mesajul:

```
Cannot assign to property: 'self' is immutable
```

Aceasta înseamnă că proprietatea nu poate fi modificată, deoarece view-ul este imuabil.

De ce se întâmplă asta?

## Cum funcționează SwiftUI

În SwiftUI: **interfața este condusă de date**, ceea ce înseamnă că atunci când datele se schimbă, interfața se actualizează automat.

Dar trebuie observat că SwiftUI monitorizează schimbările și reîmprospătează view-ul doar atunci când starea (de exemplu @State, @Binding) se modifică.

Dacă folosim o variabilă obișnuită, SwiftUI va citi valoarea ei doar o singură dată la crearea view-ului. După aceea, chiar dacă variabila se schimbă, interfața nu se va actualiza.

De exemplu:

```swift
var num = 0   // 0
num = 1   // 0
```

În exemplul de mai sus, num este o variabilă obișnuită. Deși valoarea ei s-a schimbat, SwiftUI nu va actualiza view-ul, iar interfața va continua să afișeze valoarea inițială 0.

![Num](../../RESOURCE/009_state.png)

Prin urmare, doar atunci când datele sunt marcate ca stare (de exemplu folosind @State, @Binding și alți property wrappers), SwiftUI le va monitoriza automat schimbările și va actualiza view-ul.

## Property wrapper-ul @State

În SwiftUI, dacă trebuie să modificăm o variabilă și să actualizăm view-ul, trebuie să folosim @State.

```swift
@State var num = 0
```

@State îi permite lui SwiftUI să urmărească această variabilă.

Când variabila se schimbă, SwiftUI va recalcula view-ul și îl va actualiza.

Cod complet:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Acum, când butonul este apăsat:

```swift
num += 1
```

SwiftUI va detecta că num s-a schimbat și va actualiza automat view-ul.

![Num](../../RESOURCE/009_state1.png)

## Regulile de utilizare pentru @State

În dezvoltarea reală, @State urmează de obicei două reguli.

### 1. @State folosește de obicei private

Variabilele @State sunt de obicei folosite doar în tipul curent (de exemplu în structura View curentă), deci în general sunt scrise astfel:

```swift
@State private var num = 0
```

Astfel se evită accesarea sau modificarea directă a acestei variabile din alte view-uri.

Încă nu am învățat despre private, așa că îl poți înțelege simplu astfel:

**Conținutul modificat cu private poate fi folosit doar în view-ul curent; view-urile din exterior nu îl pot folosi.**

### 2. @State este folosit doar pentru starea view-ului curent

@State este potrivit pentru datele gestionate chiar de View-ul curent.

De exemplu, conținutul unui câmp de introducere sau starea unui comutator.

```swift
@State private var isOn = false
@State private var text = ""
```

Dacă datele trebuie partajate între mai multe view-uri, trebuie folosite alte tipuri de stare, cum ar fi @Binding sau @Observable.

Aceste conținuturi vor fi studiate în lecțiile următoare.

### Butonul de scădere

Pe lângă creștere, contorul poate și să scadă.

Putem adăuga un buton -.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Apoi folosim HStack pentru a aranja butoanele pe orizontală:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Efect:

![Num](../../RESOURCE/009_num1.png)

Când este apăsat butonul +, numărul crește cu 1; când este apăsat butonul -, numărul scade cu 1.

### Butonul de resetare

Mai putem adăuga și un buton de resetare, care schimbă numărul la 0.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Când butonul de resetare este apăsat, lui num i se atribuie valoarea 0.

Efect:

![Num](../../RESOURCE/009_num2.png)

Când este apăsat butonul 0, numărul devine 0.

### Butoane personalizate

În acest moment, butoanele noastre pot afișa doar text:

```swift
Button("+") {

}
```

Butoanele scrise astfel pot afișa doar conținut text, cum ar fi + sau -.

În dezvoltarea reală, de obicei vrem ca aspectul butoanelor să fie mai bogat, de exemplu să folosim iconițe sau alte view-uri.

SwiftUI ne permite să personalizăm conținutul afișat de buton. În acest caz, putem folosi o altă formă de scriere pentru buton:

```swift
Button(action: {

}, label: {

})
```

În această formă, action reprezintă codul executat când butonul este apăsat, iar label reprezintă view-ul afișat de buton.

De exemplu, putem face ca butonul să afișeze o iconiță SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Astfel, butonul nu mai afișează text, ci o iconiță.

### Optimizarea interfeței contorului

Pentru ca interfața contorului să fie mai clară, putem ajusta și stilul de afișare al numărului. De exemplu, putem mări numărul:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

În continuare, schimbăm și conținutul butoanelor în iconițe și mărim puțin dimensiunea acestora:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

În același mod, putem schimba și butonul de scădere și butonul de resetare în iconițe:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Acum butoanele afișează iconițe SF Symbols, iar interfața va fi mai intuitivă.

![Num](../../RESOURCE/009_num3.png)

## Rezumat

În această lecție, prin realizarea unui contor simplu, am exersat integrat folosirea variabilelor, a Text și a Button. Am folosit o variabilă pentru a salva numărul și am controlat creșterea sau scăderea numărului prin butoane, în timp ce am învățat și operatorii compuși de atribuire, cum ar fi num += 1 și num -= 1.

În procesul implementării, am înțeles modul de funcționare al SwiftUI: interfața este condusă de date. Atunci când datele se schimbă, interfața se actualizează. De aceea, este necesar să folosim @State pentru a salva starea care se poate schimba; când variabila @State se modifică, SwiftUI actualizează automat view-ul.

La final, am făcut și o optimizare simplă a interfeței, am ajustat stilul fontului pentru Text și am folosit Button(action:label:) pentru a personaliza conținutul butoanelor, astfel încât acestea să poată afișa iconițe, făcând interfața contorului mai clară și mai frumoasă.

Acum am intrat deja în contact cu modul de bază de utilizare al view-urilor SwiftUI. În SwiftUI, cea mai mare parte a interfeței este condusă de variabile. Când variabilele se schimbă, SwiftUI actualizează automat view-ul. De aceea, atunci când dezvoltăm aplicații SwiftUI, de obicei trebuie mai întâi să proiectăm datele care trebuie salvate, apoi să construim interfața și logica de interacțiune pe baza acestor date.

## Cod complet

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
