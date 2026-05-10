# Adaptarea aspectului

În această lecție, vom învăța cum să adaptăm interfața pentru modul luminos și modul întunecat.

Pe iPhone, iPad și Mac, utilizatorii pot alege modul luminos sau modul întunecat.

Când sistemul trece la modul întunecat, fundalul, textul și culorile pictogramelor din multe aplicații se schimbă și ele.

De exemplu, interfața poate avea un fundal luminos ziua și poate trece la un fundal întunecat noaptea.

![view](../../../Resource/025_view9.png)

Această capacitate de a ajusta automat afișarea interfeței în funcție de aspectul sistemului se numește adaptarea aspectului.

## Previzualizarea adaptării aspectului în Xcode

Înainte de a învăța adaptarea aspectului, să vedem mai întâi cum putem previzualiza modul luminos și modul întunecat în Xcode.

În partea de jos a zonei `Canvas`, fă clic pe butonul `Device Settings` pentru a deschide fereastra pop-up `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

În fereastra pop-up, poți vedea setarea `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Aceasta înseamnă:

- `Light Appearance` înseamnă modul luminos.
- `Dark Appearance` înseamnă modul întunecat.

Putem comuta aspectul de previzualizare de aici și putem verifica cum arată interfața curentă în modul luminos și în modul întunecat.

## Afișarea celor două aspecte unul lângă altul

Dacă vrei să vezi modul luminos și modul întunecat în același timp, poți folosi funcția `Variants`.

În partea de jos a zonei `Canvas`, fă clic pe butonul `Variants` și alege `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

După selectare, `Canvas` va afișa în același timp previzualizările pentru modul luminos și modul întunecat.

![canvas3](../../../Resource/025_view3.png)

Astfel este mai ușor să compari diferențele interfeței dintre cele două aspecte.

Pe scurt:

Dacă vrei doar să comuți temporar între modul luminos și modul întunecat, poți folosi `Canvas Device Settings`.

Dacă vrei să vezi ambele aspecte în același timp, poți folosi `Color Scheme Variants`.

## Vizualizările se adaptează implicit la aspect

În SwiftUI, multe vizualizări de sistem se adaptează automat, implicit, la modul luminos și la modul întunecat.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Luminos")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("text text text")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rezultatul afișării:

![canvas](../../../Resource/025_view4.png)

După cum se poate vedea, în modul luminos, pictogramele și titlurile apar de obicei în culori închise.

În modul întunecat, pictogramele și titlurile devin automat deschise la culoare.

Acest lucru se întâmplă deoarece vizualizările SwiftUI precum `Text` și `Image` își ajustează implicit culorile în funcție de aspectul sistemului.

Cu alte cuvinte, dacă nu specificăm manual o culoare fixă, SwiftUI ne ajută să gestionăm o parte din adaptarea aspectului.

## Culorile fixe nu se schimbă automat

Trebuie reținut că, dacă specificăm manual o culoare fixă, aceasta nu se va schimba automat între modul luminos și modul întunecat.

De exemplu:

```swift
Text("text text text")
	.foregroundStyle(Color.gray)
```

Textul de aici este setat la `Color.gray`, deci va fi afișat mereu cu gri.

Un alt exemplu:

```swift
Text("Titlu")
    .foregroundStyle(Color.white)
```

Acest cod va afișa text alb atât în modul luminos, cât și în modul întunecat.

Dacă fundalul este și el luminos, textul alb poate deveni greu de citit.

Așadar, când adaptăm o interfață pentru aspecte diferite, ar trebui să evităm pe cât posibil scrierea directă a unor culori fixe precum `Color.white` și `Color.black`.

În multe cazuri, putem folosi cu prioritate stiluri semantice de sistem, de exemplu:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Aceasta înseamnă:

- `.primary` este folosit de obicei pentru conținutul principal.
- `.secondary` este folosit de obicei pentru conținutul secundar.

Acestea își ajustează automat afișarea în funcție de modul luminos și modul întunecat.

## Afișarea unui conținut diferit în funcție de aspect

Uneori nu vrem doar ca culorile să se schimbe, ci vrem ca în aspecte diferite să fie afișat conținut diferit.

De exemplu:

- În modul luminos, se afișează pictograma unui bec obișnuit.
- În modul întunecat, se afișează pictograma unui bec aprins.
- În modul luminos, titlul afișează `Luminos`.
- În modul întunecat, titlul afișează `Întunecat`.

În acest caz, trebuie să determinăm dacă sistemul curent se află în modul luminos sau în modul întunecat.

În SwiftUI, putem obține modul de aspect curent prin valoarea de mediu `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Cod complet:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Luminos" : "Întunecat"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("text text text")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Rezultatul afișării:

![view](../../../Resource/025_view5.png)

Din rezultatul previzualizării se poate vedea că aceeași vizualizare nu afișează conținut complet identic în moduri de aspect diferite.

În modul luminos, `Image` afișează pictograma becului obișnuit, iar titlul afișează `Luminos`.

În modul întunecat, `Image` afișează pictograma becului aprins, iar titlul afișează `Întunecat`.

Cu alte cuvinte, schimbarea de aici nu este doar o schimbare de culoare. Numele pictogramei și textul titlului se schimbă și ele.

Acest lucru se întâmplă deoarece nu am scris direct pictograma și titlul în `body`, ci am calculat conținut diferit pe baza lui `colorScheme`.

În acest cod, folosim două proprietăți calculate:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Luminos" : "Întunecat"
}
```

Când `colorScheme` este `.light`, înseamnă că modul curent este modul luminos.

Când `colorScheme` este `.dark`, înseamnă că modul curent este modul întunecat.

Astfel, putem returna nume de pictograme și texte de titlu diferite în funcție de modurile de aspect diferite.

Aceasta este și o utilizare frecventă a proprietăților calculate: calcularea conținutului pe care o vizualizare trebuie să îl afișeze în funcție de starea curentă.

## Înțelegerea lui @Environment

Aceasta este prima dată când întâlnim `@Environment`.

`@Environment` poate fi înțeles ca citirea unei valori din mediul SwiftUI.

Când o aplicație rulează, sistemul oferă multe tipuri de informații de mediu, de exemplu:

- Limba curentă
- Modul de aspect curent
- Direcția curentă a aspectului
- Setarea curentă a dimensiunii fontului

Când trebuie să obținem modul de aspect curent, putem citi `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Aici:

```swift
\.colorScheme
```

înseamnă citirea valorii `colorScheme` din mediu.

```swift
private var colorScheme
```

înseamnă salvarea valorii citite în variabila `colorScheme`.

Poți decide singur numele variabilei. De exemplu, poți scrie și:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Atât timp cât `\.colorScheme` din față nu se schimbă, înseamnă că citești modul de aspect curent.

## Două valori comune ale lui colorScheme

`colorScheme` are de obicei două valori:

```swift
.light
.dark
```

Ele înseamnă:

- `.light`: modul luminos
- `.dark`: modul întunecat

De exemplu:

```swift
private var titleName: String {
    colorScheme == .light ? "Luminos" : "Întunecat"
}
```

Această secvență de cod înseamnă:

Dacă modul curent este modul luminos, expresia `colorScheme == .light` este adevărată, deci se returnează `"Luminos"`.

În caz contrar, se returnează `"Întunecat"`.

Așadar, în modul luminos:

```swift
Text(titleName)
```

Textul afișat este:

```swift
Luminos
```

În modul întunecat, textul afișat este:

```swift
Întunecat
```

Prin această metodă, putem afișa conținut diferit în funcție de aspecte diferite.

## Exemplu de adaptare a culorilor

Pe lângă text și pictograme, uneori trebuie să gestionăm singuri adaptarea culorilor.

De exemplu:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Rezultatul afișării:

![view](../../../Resource/025_view6.png)

În acest cod, textul este alb, iar fundalul este negru.

În modul luminos, fundalul negru este destul de clar.

Totuși, în modul întunecat, dacă fundalul întregii interfețe este și el negru, acest fundal negru se va contopi cu fundalul sistemului și va părea mai puțin clar.

În acest moment, putem comuta culoarea textului și culoarea fundalului în funcție de modul de aspect:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Rezultatul afișării:

![view](../../../Resource/025_view7.png)

Acum, în modul luminos se folosește fundal negru cu text alb.

În modul întunecat se folosește fundal alb cu text negru.

Astfel, indiferent de aspectul folosit, textul și fundalul au contrast clar, iar utilizatorii pot vedea conținutul limpede.

## Folosirea Assets pentru adaptarea culorilor

Pe lângă verificarea manuală cu `colorScheme`, putem folosi și culori de resurse din `Assets` pentru a ne adapta la modul luminos și la modul întunecat.

Această metodă este mai potrivită pentru gestionarea culorilor comune dintr-o aplicație.

În proiectul Xcode, găsește folderul de resurse `Assets`.

![assets](../../../Resource/025_color.png)

Deschide folderul `Assets`, fă clic dreapta într-o zonă goală și alege `New Color Set` pentru a crea o nouă resursă de culoare.

![assets](../../../Resource/025_color1.png)

Aici creăm o culoare și o numim `redText`.

![assets](../../../Resource/025_color2.png)

O resursă de culoare poate seta separat culori pentru modul luminos și modul întunecat.

![assets](../../../Resource/025_color3.png)

După ce selectezi zona de culoare corespunzătoare, poți modifica culoarea în inspectorul din dreapta.

Fă clic pe butonul `Hide or show the Inspectors` din colțul din dreapta sus pentru a deschide zona inspectorului.

Apoi alege `Show the Attributes inspector`, găsește `Show Color Panel` în partea de jos și deschide panoul de culori.

![assets](../../../Resource/025_color4.png)

Fă clic pe o culoare din panoul de culori, iar zona de culoare corespunzătoare pentru `redText` se va schimba în același timp.

Aici setăm `redText` astfel:

- Afișează roșu în modul luminos
- Afișează verde în modul întunecat

![assets](../../../Resource/025_color5.png)

Înapoi în codul SwiftUI, poți folosi această culoare astfel:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Aici:

```swift
Color("redText")
```

înseamnă citirea resursei de culoare numite `redText` din `Assets`.

Rezultatul afișării:

![assets](../../../Resource/025_view8.png)

Poți vedea că același `Color("redText")` afișează culori diferite în modul luminos și în modul întunecat.

Aceasta arată că și culorile din `Assets` acceptă adaptarea aspectului.

## Diferența dintre colorScheme și Assets

Atât `colorScheme`, cât și `Assets` pot implementa adaptarea aspectului, dar sunt potrivite pentru scenarii diferite.

Dacă trebuie doar să comuți conținutul textului, numele imaginilor sau numele `SF Symbols` în funcție de modul luminos și modul întunecat, poți folosi `colorScheme`.

De exemplu:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Dacă o culoare este folosită frecvent în aplicație, de exemplu culoarea temei, culoarea fundalului unui card sau culoarea textului, este mai recomandat să folosești culori din `Assets`.

Acest lucru se datorează faptului că aceste culori din `Assets` pot fi reutilizate în mai multe vizualizări și sunt mai ușor de modificat ulterior.

De exemplu:

```swift
Color("redText")
```

În acest fel, trebuie doar să modifici culoarea în `Assets`, iar toate locurile care folosesc această culoare se vor schimba împreună.

## Rezumat

În această lecție, am învățat adaptarea aspectului pentru modul luminos și modul întunecat.

Mai întâi, am învățat cum să previzualizăm aspecte diferite în `Canvas` din Xcode și cum să folosim `Color Scheme Variants` pentru a vedea în același timp modul luminos și modul întunecat.

Apoi, am aflat că vizualizările SwiftUI precum `Text` și `Image` își adaptează implicit culorile în funcție de aspectul sistemului.

Totuși, dacă specificăm manual culori fixe precum `Color.white` sau `Color.black`, aceste culori nu se vor schimba automat.

În continuare, am învățat despre `@Environment` și `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Prin `colorScheme`, putem determina dacă modul curent este luminos sau întunecat și putem afișa pictograme, texte sau culori diferite în funcție de aspecte diferite.

În final, am învățat despre culorile din `Assets`.

Culorile din `Assets` pot seta separat culori pentru modul luminos și modul întunecat, ceea ce le face potrivite pentru gestionarea resurselor de culoare comune dintr-o aplicație.

Adaptarea aspectului poate face ca o aplicație să arate mai bine atât ziua, cât și noaptea și poate preveni probleme precum text greu de citit sau fundal neclar.

În dezvoltarea reală, se recomandă să folosești cu prioritate comportamentul implicit de adaptare al SwiftUI și culorile din `Assets`.

Când trebuie să comuți texte, pictograme, imagini sau să gestionezi un număr mic de efecte speciale de afișare în aspecte diferite, atunci folosește `colorScheme` pentru verificare.

## Cunoștințe extinse: specificarea dimensiunii fontului

Când am învățat anterior `font`, am folosit câteva stiluri de font de sistem:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Pe lângă folosirea stilurilor de font de sistem precum `.largeTitle` și `.callout`, poți specifica manual și dimensiunea fontului.

De exemplu:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Aici:

```swift
.font(.system(size: 100))
```

înseamnă setarea dimensiunii fontului la `100 pt`.

Pentru pictogramele `SF Symbols`, `font` afectează și dimensiunea pictogramei.

Așadar, dacă vrei ca o pictogramă să apară mai mare, poți specifica dimensiunea cu `.font(.system(size:))`.

De exemplu:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Trebuie reținut că, deși specificarea manuală a dimensiunii fontului este mai flexibilă, nu este recomandat să folosești multe dimensiuni fixe pentru textul obișnuit.

Pentru textul obișnuit, folosește cu prioritate stiluri de font de sistem precum `.title`, `.headline`, `.body` și `.caption`.

Astfel se poate adapta mai bine la dispozitive diferite și la setările de font ale utilizatorilor.
