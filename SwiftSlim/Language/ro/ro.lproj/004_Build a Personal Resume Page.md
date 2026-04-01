# Construirea unei pagini de CV personal

În această lecție vom realiza un view simplu de CV personal și vom învăța următoarele noțiuni:

- `cornerRadius`
- `spacing`
- `ScrollView`

În procesul de construire, vom recapitula layout-ul, `Text` și `Image`, și vom implementa controlul spațierii, precum și efectul de derulare al conținutului.

## CV personal

Efectul țintă:

![Swift](../../RESOURCE/004_img.png)

**Te rog să încerci mai întâi să îl realizezi singur, apoi să continui cu explicațiile de mai jos.**

### Crearea proiectului

Creează un proiect iOS nou sau continuă să folosești proiectul creat anterior.

Codul implicit din `ContentView` este:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Acum șterge conținutul și începe să scrii propriul tău cod:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Structura generală

În dezvoltarea reală, de obicei proiectăm mai întâi structura generală.

Pagina noastră conține:

1. titlul
2. informațiile personale
3. prezentarea personală

Adăugăm un `VStack` în stratul cel mai exterior:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` poate asigura aranjarea verticală a view-urilor și poate controla ordinea și spațierea acestora.

### Titlul

Mai întâi, creăm un `Text` pentru a afișa titlul.

Aici voi afișa titlul ca fiind numele meu în engleză:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Titlul este de obicei mai mare și mai îngroșat, așa că folosim modificatorii `font` și `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Aranjarea în pagină

Modul implicit de aliniere în SwiftUI este `center`, iar acum titlul este afișat în mijlocul poziției din `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Trebuie să afișăm titlul în partea de sus a view-ului. Pentru aceasta putem folosi `Spacer` pentru a ajusta layout-ul:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` va ocupa spațiul rămas și va împinge `Text` în partea superioară a containerului.

![Swift](../../RESOURCE/004_img4.png)

### Spațiu liber

Dacă ți se pare că textul este prea aproape de partea de sus, poți folosi `padding` sau `Spacer`.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Aceasta setează marginea internă superioară a `VStack` la 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Poți folosi și `Spacer`, iar setând înălțimea prin `frame` poți obține un spațiu liber cu dimensiune fixă.

Efectul obținut:

![Swift](../../RESOURCE/004_img5.png)

### Imaginea

Pregătim o fotografie de profil și o plasăm în folderul de resurse `Assets`.

![Swift](../../RESOURCE/004_img6.png)

În `ContentView`, folosim `Image` pentru a afișa imaginea:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Deoarece dimensiunea originală a imaginii este destul de mare, trebuie să folosim `frame` pentru a controla dimensiunea de afișare.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

În acest moment vom observa o problemă:

Dacă raportul dintre lățime și înălțime din `frame` nu corespunde raportului original al imaginii, imaginea se va deforma.

De exemplu:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Pentru a evita deformarea imaginii, trebuie să folosim `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Rolul lui `scaledToFit` este:

În interiorul unui `frame` dat, imaginea este scalată păstrând proporțiile originale și este afișată complet.

Nu va întinde forțat imaginea pentru a umple întregul `frame`, ci va păstra raportul dintre lățime și înălțime și o va scala proporțional până când una dintre laturi se aliniază exact cu marginea.

Aceasta înseamnă:

* dacă lățimea `frame`-ului este mai mică, imaginea va fi scalată în funcție de lățime
* dacă înălțimea `frame`-ului este mai mică, imaginea va fi scalată în funcție de înălțime
* imaginea își păstrează întotdeauna proporțiile originale și nu se va deforma

De obicei este suficient să setezi dimensiunea pe o singură direcție. De exemplu:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Astfel, sistemul va calcula automat înălțimea potrivită pe baza lățimii de 140, păstrând în același timp proporțiile imaginii.

Dacă ai nevoie de un raport vizual fix sau vrei să eviți comprimarea în layout-uri mai complexe, poți constrânge simultan lățimea și înălțimea.

### Colțuri rotunjite

Dacă vrei ca imaginea să fie afișată cu colțuri rotunjite, poți folosi modificatorul `cornerRadius`:

```swift
.cornerRadius(10)
```

De exemplu:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Adaugă `cornerRadius(20)` după modificatorii lui `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` înseamnă că marginile view-ului vor fi decupate și li se va aplica o rază de colț de 20.

După adăugarea colțurilor rotunjite, cele patru colțuri ale imaginii devin arcuite, ceea ce face aspectul mai blând și mai modern.

Acest stil de design este foarte comun în interfețele actuale. De exemplu, pictogramele aplicațiilor iOS folosesc forma de dreptunghi cu colțuri rotunjite (deși pictogramele de sistem folosesc o curbă continuă de tip superelipsă, nu colțuri rotunjite simple).

### Informațiile personale

Acum începem să realizăm zona de informații personale din stânga imaginii. Din structura interfeței se observă că informațiile personale și imaginea sunt aranjate pe orizontală, deci trebuie să folosim un `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Conținutul informațiilor personale este aranjat pe verticală.

![Swift](../../RESOURCE/004_img11.png)

Prin urmare, la exterior folosim `HStack`, pentru informațiile personale folosim `VStack`, iar conținutul textual va fi afișat prin `Text`.

Structura de bază:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Îngroșarea titlurilor câmpurilor**

Pentru a diferenția numele câmpurilor de valorile lor, putem aplica `fontWeight` numelor de câmpuri:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Alinierea textului la stânga**

`VStack` este aliniat implicit pe centru. Dacă vrem ca tot textul să fie aliniat la stânga, trebuie să setăm modul de aliniere:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` înseamnă aliniere la partea stângă în limbile scrise de la stânga la dreapta.

![Swift](../../RESOURCE/004_img14.png)

### Spațiere

Dacă vrei să existe o distanță fixă între informațiile personale și imagine, până acum am învățat că putem folosi `Spacer` pentru spațiu liber:

```swift
Spacer()
    .frame(width: 10)
```

Dar putem folosi și parametrul `spacing` al lui `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` înseamnă că distanța dintre cele două subview-uri este de 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Ce este spacing?**

În `VStack`, `HStack` și `ZStack`, `spacing` poate controla distanța dintre subview-uri.

De exemplu:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Distanța dintre subview-urile din `VStack` va fi setată la 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Trebuie remarcat că `spacing` se aplică doar „subview-urilor directe” și nu afectează layout-ul din interiorul containerelor imbricate.

**Controlul spațierii în interiorul listei**

Dacă vrei să adaugi spațiu între câmpuri, cea mai directă metodă este să setezi `spacing` pe `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Astfel, distanța dintre toate subview-urile va deveni 10 pt.

Dar, dacă observi interfața, vei vedea o problemă:

Există spațiu între grupurile de câmpuri, dar apare aceeași distanță și între numele câmpului și valoarea lui.

Acest lucru se întâmplă deoarece `spacing` acționează asupra tuturor subview-urilor directe ale containerului curent.

În această structură, fiecare `Text` este un subview direct al `VStack`-ului exterior, deci distanța este uniformă.

Dacă vrei să existe spațiu între grupurile de câmpuri, dar să păstrezi o distanță compactă implicită între numele câmpului și valoarea lui, poți considera „nume câmp + valoare câmp” ca un întreg logic și să îl înfășori într-un `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Acum structura devine una în care există spațiu între `VStack`-urile exterioare, dar în interiorul fiecărui `VStack` spațierea rămâne compactă implicit, deci nu va apărea un spațiu suplimentar între numele câmpului și valoarea acestuia.

![Swift](../../RESOURCE/004_img18.png)

### Prezentarea personală

În continuare realizăm zona de prezentare personală.

Din structura interfeței se observă că prezentarea este formată din mai multe linii de text, aranjate vertical.

![Swift](../../RESOURCE/004_img19.png)

Prin urmare, putem folosi `VStack` împreună cu `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Adăugarea spațierii**

În acest moment, informațiile personale și prezentarea personală sunt destul de înghesuite, iar stilul nu arată prea bine.

![Swift](../../RESOURCE/004_img20.png)

Deoarece ambele se află în același container exterior, putem controla spațierea generală la nivelul acelui container:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Efectul obținut:

![Swift](../../RESOURCE/004_img21.png)

**Spațierea listei**

Folosim `spacing` pentru a seta distanța dintre textele din prezentarea personală:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Finalizarea CV-ului personal

Acum, structura de bază a CV-ului nostru personal este completă.

![Swift](../../RESOURCE/004_img.png)

### View derulabil

În acest moment, structura paginii folosește `VStack`. Când numărul textelor din prezentare este mic, nu există probleme. Dar dacă numărul crește la 20, 30 sau chiar mai multe, înălțimea conținutului va depăși ecranul.

De exemplu:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

În acel moment vor apărea două fenomene:

* conținutul din partea de jos va fi tăiat
* pagina nu va putea fi derulată

Aceasta nu este o problemă a lui `VStack`; `VStack` este doar un container de layout și nu oferă automat capacitate de derulare.

**Ce este ScrollView**

`ScrollView` este un container derulabil, potrivit pentru conținut de mari dimensiuni care depășește ecranul. De exemplu, liste verticale sau orizontale.

Structura de bază:

```swift
ScrollView {
    ...
}
```

Dacă vrem să obținem efectul de derulare, trebuie să înfășurăm întregul conținut al paginii într-un `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Astfel, întreaga pagină devine o zonă derulabilă. Când conținutul depășește înălțimea ecranului, acesta poate fi derulat în mod natural.

Implicit, `ScrollView` afișează indicatorii de derulare. Dacă vrei să îi ascunzi, poți seta:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Cod complet

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
