# Card de curs

Această lecție este o lecție de recapitulare pe etape. Vom realiza un „card de curs”.

Prin acest exercițiu, putem recapitula `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` și alte elemente învățate anterior și vom învăța cum să combinăm mai multe vizualizări mici într-un modul de vizualizare complet.

Efectul cardului de curs:

![view](../../../Resource/026_view.png)

Acest card de curs conține în principal câteva părți:

- Nivelul cursului: `Beginner`
- Conținutul cursului: `20+ Lessons`
- Titlul cursului: `SwiftUI Beginner Tutorial`
- Descrierea cursului
- Buton: `Start Learning`
- Fundalul cursului: pictograma Swift și fundal indigo

Putem finaliza această vizualizare în `ContentView`.

## Zona de sus

Mai întâi, creăm zona de sus a cardului de curs.

![view](../../../Resource/026_view1.png)

În partea stângă a zonei de sus se afișează nivelul cursului, iar în partea dreaptă se afișează conținutul cursului.

Deoarece aceste două elemente sunt aranjate pe orizontală, putem folosi `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Începător")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lecții")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Aici am separat zona de sus într-o proprietate calculată:

```swift
var topView: some View
```

Avantajul acestui lucru este că poate face `body` mai clar.

Zona de sus folosește în principal următoarele elemente:

- `HStack`: aranjează două texte pe orizontală.
- `Text`: afișează conținut text.
- `Spacer()`: împinge textul din stânga spre stânga și textul din dreapta spre dreapta.
- `.font(.footnote)`: setează un stil de text mai mic.
- `.fontWeight(.bold)`: setează textul îngroșat.
- `.foregroundStyle(Color.white)`: setează culoarea prim-planului la alb.
- `.padding(.vertical, 10)`: setează spațierea interioară verticală.
- `.padding(.horizontal, 16)`: setează spațierea interioară orizontală.
- `.background(Color.white.opacity(0.15))`: setează un fundal alb semitransparent.
- `.cornerRadius(20)`: setează colțurile rotunjite.

Aici, `Beginner` folosește `.padding()` în două direcții:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Astfel, textul primește spațiu atât sus și jos, cât și la stânga și la dreapta, iar aspectul seamănă mai mult cu o etichetă.

`Color.white.opacity(0.15)` reprezintă alb cu opacitate de `15%`, adică un alb foarte discret.

### Adăugarea fundalului cardului

Anterior am creat `topView`, dar simpla creare a unei vizualizări nu o va afișa automat.

În SwiftUI, conținutul care este afișat efectiv pe ecran trebuie scris în `body`.

De aceea, putem pune mai întâi `topView` în `body` pentru afișare:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

În acest moment, vei vedea că zona de sus a fost deja afișată:

![view](../../../Resource/026_view2.png)

Totuși, deoarece textul din `topView` este alb, iar fundalul implicit este și el deschis, în modul luminos s-ar putea să nu fie ușor de văzut.

Prin urmare, putem adăuga un `VStack` la exterior, apoi putem seta spațierea interioară, culoarea de fundal și colțurile rotunjite pentru întreaga zonă:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Efectul afișat:

![view](../../../Resource/026_view3.png)

Aici, `VStack` conține deocamdată doar un `topView`, deci poate părea că nu este necesar.

Dar mai târziu vom continua să adăugăm titlul cursului, descrierea cursului și zona butonului. Toate acestea sunt conținuturi aranjate vertical, așa că folosirea din timp a unui `VStack` aici facilitează combinarea ulterioară a vizualizărilor.

Aici există două `.padding()`, iar rolurile lor sunt diferite.

Primul `.padding(20)` este scris înainte de `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Acesta controlează spațierea interioară a cardului, adică distanța dintre conținut și marginea fundalului.

Al doilea `.padding(30)` este scris după `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Acesta controlează spațierea exterioară a cardului, adică distanța dintre întregul card și marginea ecranului.

![view](../../../Resource/026_view4.png)

Așadar, chiar dacă ambele sunt `.padding()`, poziționarea lor în locuri diferite produce efecte diferite.

## Zona de conținut

Apoi creăm zona de conținut a cardului de curs.

Efectul afișat:

![view](../../../Resource/026_view5.png)

Zona de conținut include titlul cursului și descrierea cursului. Acestea sunt aranjate vertical, deci folosim `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial SwiftUI pentru începători")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Începe de la zero cu SwiftUI și învață sistematic dezvoltarea declarativă a interfețelor Apple. Prin explicații clare și exemple practice, vei stăpâni treptat layout-ul, interacțiunea și gestionarea stării pentru a construi interfețe de aplicație frumoase și utile.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efectul afișat:

![view](../../../Resource/026_view6.png)

În acest `VStack` sunt folosiți doi parametri:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` înseamnă că vizualizările din interiorul `VStack` sunt aliniate la marginea de început.

`spacing: 10` înseamnă că vizualizările din interiorul `VStack` păstrează între ele o distanță de `10 pt`.

Prin urmare, titlul cursului și descrierea cursului vor începe din partea stângă și vor păstra o anumită distanță între ele.

Descrierea cursului este relativ lungă. Dacă ar fi afișată complet, cardul ar deveni foarte înalt, așa că aici folosim `.lineLimit()` pentru a limita numărul de rânduri afișate:

```swift
.lineLimit(3)
```

Aceasta înseamnă că se afișează cel mult `3` rânduri. Când conținutul depășește limita de rânduri, partea suplimentară este omisă.

### Alinierea vizualizării la stânga

Aici mai trebuie observat un aspect.

`VStack(alignment: .leading)` poate controla doar alinierea vizualizărilor din interiorul `VStack`. Nu controlează direct poziția lui `VStack` în containerul exterior.

De exemplu, dacă descrierea cursului este relativ scurtă:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial SwiftUI pentru începători")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Doar puțin conținut.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efectul afișat:

![view](../../../Resource/026_view7.png)

Se poate vedea că, deși titlul cursului și descrierea cursului sunt aliniate la stânga în interiorul `VStack`, întregul `VStack` nu este lipit de marginea stângă a cardului.

Acest lucru se întâmplă deoarece, atunci când conținutul este scurt, lățimea lui `VStack` devine și ea relativ îngustă. Când containerul exterior își așază conținutul, poate plasa acest `VStack` mai îngust în centru.

Poți înțelege astfel: `VStack(alignment: .leading)` este responsabil pentru alinierea internă la stânga.
Dar nu este responsabil pentru împingerea întregii zone de conținut până în extrema stângă.

Dacă dorim ca întreaga zonă de conținut să fie cu adevărat aliniată la stânga, o putem înveli într-un alt `HStack` și putem adăuga `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial SwiftUI pentru începători")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Doar puțin conținut.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efectul afișat:

![view](../../../Resource/026_view8.png)

Aici, `HStack` este un layout orizontal.

`Spacer()` ocupă spațiul rămas din dreapta, împingând astfel `VStack` din stânga până în extrema stângă.

Prin urmare, `HStack + Spacer()` poate fi folosit pentru a controla poziția întregii zone de conținut.

În cardul de curs real, descrierea cursului este relativ lungă și de obicei ocupă mai multă lățime, deci această problemă poate să nu fie foarte evidentă. Totuși, este important să înțelegem această diferență, deoarece vom întâlni des situații similare când realizăm layout-uri cu texte scurte.

### Controlul distanței dintre vizualizările interne

Anterior am scris `spacing: 10` în `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` este folosit pentru a controla distanța dintre vizualizările interne.

Dacă nu setăm `spacing`, `VStack` are și el o distanță implicită, dar aceasta nu corespunde neapărat efectului dorit.

Aici, dacă titlul cursului și descrierea cursului sunt prea apropiate, layout-ul va părea înghesuit, așa că folosim:

```swift
spacing: 10
```

Astfel, între ele se păstrează puțin spațiu.

Efectul afișat:

![view](../../../Resource/026_view9.png)

În mod similar, zona de sus și zona de conținut sunt și ele aranjate vertical, deci putem folosi `spacing` pentru a controla distanța dintre ele.

Acum, punem `topView` și `contentView` în `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efectul afișat:

![view](../../../Resource/026_view10.png)

Aici, `VStack(spacing: 20)` controlează distanța dintre `topView` și `contentView`.

Cu alte cuvinte:

```swift
VStack(alignment: .leading, spacing: 10)
```

Controlează distanța dintre titlul cursului și descrierea cursului.

```swift
VStack(spacing: 20)
```

Controlează distanța dintre zona de sus și zona de conținut.

Ambele sunt `spacing`, dar acționează asupra unor containere `VStack` diferite, deci și aria influențată este diferită.

Astfel, vizualizarea zonei de conținut este finalizată.

## Zona butonului

Apoi creăm zona butonului de jos.

Efectul afișat:

![view](../../../Resource/026_view11.png)

Zona butonului este compusă în principal dintr-o pictogramă de redare și un text.

Putem folosi `Image` pentru a afișa pictograma de redare și `Text` pentru a afișa textul butonului.

Aici creăm mai întâi aspectul butonului:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("buton apăsat")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Începe să înveți")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Efectul afișat:

![view](../../../Resource/026_view12.png)

Aici sunt folosite două `HStack`:

`HStack` din interior este folosit pentru a aranja pe orizontală pictograma și textul:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Începe să înveți")
}
```

`HStack` din exterior, împreună cu `Spacer()`, este folosit pentru ca aspectul butonului să fie afișat aliniat la stânga:

```swift
HStack {
    ...
    Spacer()
}
```

Când se apasă butonul, consola va afișa `buton apăsat`.

## Cardul de bază este finalizat

Acum combinăm zona de sus, zona de conținut și zona butonului:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efectul afișat:

![view](../../../Resource/026_view13.png)

Până aici, un card de curs de bază este finalizat.

## Fundal cu pictograma Swift

La final, adăugăm cardului un fundal semitransparent cu pictograma Swift.

![view](../../../Resource/026_view.png)

Anterior am folosit `Color.indigo` ca fundal. De fapt, pe lângă adăugarea unei culori, `.background()` poate adăuga și o vizualizare completă.

Prin urmare, putem crea mai întâi o vizualizare de fundal dedicată:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

În această vizualizare de fundal, folosim `VStack`, `HStack` și `Spacer()` pentru a împinge pictograma Swift în colțul din dreapta jos.

Deoarece pictograma Swift este folosită doar ca fundal decorativ, aici folosim alb semitransparent:

```swift
Color.white.opacity(0.15)
```

Astfel, pictograma nu va fi prea evidentă și nu va afecta conținutul textului din față.

Apoi adăugăm `backgroundView` în card:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efectul final:

![view](../../../Resource/026_view14.png)

Aici sunt folosite consecutiv două `.background()`:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Primul `.background()` este folosit pentru a adăuga fundalul cu pictograma Swift.
Al doilea `.background()` este folosit pentru a adăuga fundalul indigo.

Astfel, pictograma Swift va fi afișată deasupra fundalului indigo și va apărea ca parte a fundalului cardului.

De aici putem vedea că `.background()` poate adăuga nu doar culori, ci și vizualizări personalizate. Mai multe `.background()` pot fi combinate pentru a obține efecte de fundal mai bogate.

Până aici, un card de curs complet este finalizat.

## Rezumat

În această lecție, am recapitulat metode de bază frecvente de layout în SwiftUI printr-un card de curs.

Am folosit `Text` pentru a afișa text, `Image` pentru a afișa o pictogramă de sistem, iar `VStack`, `HStack` și `Spacer()` pentru a controla aranjarea vizualizărilor.

Am învățat `.lineLimit()`, care poate limita numărul maxim de rânduri afișate de un text. Când conținutul depășește limita, partea suplimentară este omisă.

În același timp, am recapitulat și modificatori frecvent folosiți precum `.padding()`, `.background()`, `.cornerRadius()` și `.foregroundStyle()`.

După finalizarea acestei lecții, putem deja combina mai multe vizualizări mici într-un modul de card complet.

Aceasta este și o idee foarte frecventă în dezvoltarea SwiftUI: mai întâi împărțim vizualizările în părți mici, apoi le combinăm într-o interfață completă.

## Cod complet

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Începător")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lecții")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial SwiftUI pentru începători")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Începe de la zero cu SwiftUI și învață sistematic dezvoltarea declarativă a interfețelor Apple. Prin explicații clare și exemple practice, vei stăpâni treptat layout-ul, interacțiunea și gestionarea stării pentru a construi interfețe de aplicație frumoase și utile.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("buton apăsat")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Începe să înveți")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
