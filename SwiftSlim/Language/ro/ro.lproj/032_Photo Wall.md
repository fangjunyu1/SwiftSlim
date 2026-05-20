# Galerie foto

În această lecție, vom crea o pagină de galerie foto.

![view](../../../Resource/032_view13.png)

În acest exemplu, vom recapitula cunoștințele despre `extension`, `self` și instanțe, apoi vom învăța graficele `Shape` folosite frecvent în SwiftUI.

Cu aceste cunoștințe, putem decupa imagini obișnuite în diferite stiluri, cum ar fi cercuri, dreptunghiuri rotunjite, capsule și elipse, și putem adăuga efecte de bordură fotografiilor.

În această lecție vom folosi câteva concepte noi: `Shape`, `clipShape`, `strokeBorder` și `overlay`.

Dintre acestea, `clipShape` este folosit pentru a decupa forma unei vizualizări, `strokeBorder` este folosit pentru a desena bordura unei forme, iar `overlay` este folosit pentru a suprapune o nouă vizualizare deasupra vizualizării curente.

## Resurse imagine

Înainte de a începe, trebuie să pregătim câteva imagini.

Poți folosi propriile fotografii sau poți folosi imaginile exemplu oferite în această lecție.

Fotografiile exemplu din această lecție provin de pe site-ul [Pixabay](https://pixabay.com/):

[Peisaj](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Vulpe](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Clădire](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Floare](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Lebădă](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

După descărcarea imaginilor, adaugă-le în folderul de resurse `Assets` și denumește-le pe rând `1`, `2`, `3`, `4` și `5`.

![assets](../../../Resource/032_view17.png)

Astfel, putem afișa imaginile în SwiftUI prin `Image("1")`, `Image("2")` și așa mai departe.

## Afișarea fotografiilor

Mai întâi, afișăm 5 fotografii în `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rezultatul afișării:

![view](../../../Resource/032_view.png)

În acest cod, folosim `ScrollView` pentru a permite derularea listei de fotografii și folosim `VStack` pentru a aranja mai multe imagini de sus în jos.

Fiecare imagine folosește `.resizable()`, `.scaledToFit()` și `.frame(width: 300)` pentru a seta efectul de afișare, astfel încât imaginea să poată fi redimensionată, să își păstreze proporțiile și să aibă o lățime limitată.

`.padding(.vertical, 100)` de pe `VStack` este folosit pentru a mări spațiul de sus și de jos, evitând ca prima și ultima fotografie să fie prea aproape de marginile ecranului.

Ultimul `.ignoresSafeArea()` înseamnă că vizualizarea derulabilă ignoră zona sigură, permițând fotografiilor să se extindă până în partea de sus și de jos a ecranului în timpul derulării, astfel încât pagina să fie afișată mai complet.

Totuși, în acest moment cele 5 imagini folosesc toate aceiași modificatori:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Când observăm cod repetat, putem lua în considerare folosirea unui `extension` pentru a-l organiza.

## Folosirea extension pentru organizarea stilului imaginilor

Putem extinde `Image` cu o metodă dedicată galeriei foto:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aici, extindem tipul `Image` cu o metodă `photoGalleryStyle`.

Această metodă conține `.resizable()`, `.scaledToFit()` și `.frame(width: 300)`, care au fost folosite repetat anterior. Cu alte cuvinte, ea organizează împreună codul pentru redimensionarea imaginii, afișarea proporțională și setarea lățimii.

După folosirea acestei extensii, codul original al imaginii:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

poate fi simplificat astfel:

```swift
Image("1")
    .photoGalleryStyle()
```

În acest fel, fiecare imagine trebuie doar să apeleze `.photoGalleryStyle()` pentru a aplica același stil de galerie foto. Codul devine mai curat și este mai ușor de modificat uniform ulterior.

## Înțelegerea lui self

În metoda de extensie, am scris `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aici, `self` reprezintă instanța curentă de imagine care apelează această metodă.

De exemplu:

```swift
Image("1")
    .photoGalleryStyle()
```

În acest cod, `photoGalleryStyle()` este apelată de `Image("1")`, deci `self` din interiorul metodei reprezintă această imagine `Image("1")`.

Poți înțelege simplu astfel: cine apelează această metodă, acela este reprezentat de `self`.

Trebuie observat că modificatorii SwiftUI returnează continuu rezultate noi de vizualizare. Prin urmare, `photoGalleryStyle()` returnează o vizualizare modificată, nu doar imaginea originală `Image`.

## Forme pentru fotografii

Acum, fotografiile pot fi deja afișate normal. Totuși, aceste fotografii sunt implicit dreptunghiulare, ceea ce arată destul de obișnuit.

Dacă vrei doar ca fotografiile să aibă colțuri rotunjite, poți folosi direct `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Rezultatul afișării:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` înseamnă adăugarea unei raze de colț de `20 pt` imaginii. Pentru imaginile obișnuite cu colțuri rotunjite, această scriere este deja suficientă.

Totuși, `.cornerRadius()` poate trata doar efectul de colțuri rotunjite și este potrivit pentru imagini obișnuite cu colțuri rotunjite. Dacă vrem ca fotografiile să devină mai multe forme diferite, doar acest modificator nu este suficient.

În acest moment, trebuie să folosim `Shape` în SwiftUI. `Shape` poate reprezenta diferite grafice, iar împreună cu `clipShape`, poate decupa o imagine în forma corespunzătoare.

## Înțelegerea lui Shape

În SwiftUI, `Shape` reprezintă un grafic. La fel ca `View`, este un tip foarte folosit în SwiftUI.

Tipurile comune de `Shape` includ cercul, dreptunghiul, dreptunghiul rotunjit, capsula și elipsa. Pentru a observa mai intuitiv aspectul diferitelor grafice, exemplele de mai jos setează culori și dimensiuni diferite pentru fiecare grafic.

În aceste exemple, `.fill()` este folosit pentru a umple graficul cu culoare, iar `.frame()` este folosit pentru a seta dimensiunea de afișare a graficului. Culorile sunt folosite doar pentru a distinge diferitele grafice și nu sunt culorile fixe ale graficelor în sine.

### Circle cerc

`Circle` reprezintă un cerc. Este folosit frecvent pentru avataruri, butoane circulare, imagini circulare și alte efecte de interfață.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle dreptunghi

`Rectangle` reprezintă un dreptunghi. Este unul dintre cele mai de bază grafice și poate fi folosit și pentru a crea fundaluri, zone delimitate sau borduri obișnuite.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle dreptunghi rotunjit

`RoundedRectangle` reprezintă un dreptunghi rotunjit. `cornerRadius` este folosit pentru a seta dimensiunea colțurilor rotunjite.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule formă de capsulă

`Capsule` reprezintă o formă de capsulă. Cele două capete ale sale sunt arcuri rotunjite și este folosită frecvent pentru butoane tip capsulă, fundaluri de etichete și alte efecte de interfață.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsă

`Ellipse` reprezintă o elipsă. Este similar cu `Circle`, dar atunci când lățimea și înălțimea sunt diferite, se afișează ca o elipsă.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Prin aceste exemple putem vedea că `Shape` poate fi afișat direct ca grafic. În continuare, vom folosi aceste tipuri `Shape` împreună cu `clipShape` pentru a decupa fotografiile, astfel încât să fie afișate în forme diferite.

## Folosirea clipShape pentru decuparea fotografiilor

Acum, putem folosi `clipShape` pentru a decupa fotografiile în forme diferite.

De exemplu, decupăm prima fotografie într-un cerc:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Acest cod înseamnă: mai întâi afișăm o imagine, apoi folosim `Circle()` pentru a o decupa într-un cerc.

![view](../../../Resource/032_view2.png)

Scrierea de bază pentru `clipShape` este:

```swift
.clipShape(formă)
```

Adaugă `.clipShape(...)` după vizualizare, iar în paranteze completează graficul în care vrei să fie decupată.

De exemplu:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Acum, decupăm cele 5 fotografii în forme diferite:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rezultatul afișării:

![view](../../../Resource/032_view8.png)

Dintre acestea, efectul după decuparea cu `Rectangle()` este apropiat de o fotografie dreptunghiulară obișnuită, așa că schimbarea vizuală nu este evidentă și este folosită în principal pentru comparație cu celelalte forme.

Acum, fotografiile nu mai sunt doar dreptunghiuri obișnuite, ci au forme diferite.

## Adăugarea bordurilor pentru fotografii

Dacă vrem să adăugăm o bordură unei fotografii circulare, s-ar putea să ne gândim să folosim `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Totuși, rezultatul obținut de obicei nu este o bordură circulară, ci o bordură dreptunghiulară.

![view](../../../Resource/032_view9.png)

Acest lucru se întâmplă deoarece `border` adaugă bordura conform zonei dreptunghiulare a vizualizării, nu conform formei rezultate după decuparea cu `clipShape`.

Prin urmare, dacă vrem o bordură circulară, nu putem folosi direct `border`.

## Folosirea strokeBorder pentru desenarea bordurilor formelor

În SwiftUI, `strokeBorder` poate desena borduri interioare pentru aceste tipuri comune de `Shape`.

De exemplu, desenăm o bordură circulară:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Acest cod înseamnă: desenează pentru `Circle` o bordură maro, cu lățimea bordurii de `10 pt`.

![view](../../../Resource/032_view12.png)

Aici trebuie observat că `strokeBorder` nu adaugă direct o bordură fotografiei, ci desenează o bordură pentru graficul `Circle()`.

Cu alte cuvinte, acest cod obține doar o bordură circulară independentă, care încă nu are legătură cu fotografia.

Dacă vrem ca această bordură circulară să apară deasupra fotografiei, trebuie să continuăm să folosim `overlay`, pentru a suprapune bordura peste fotografie.

## Folosirea overlay pentru suprapunerea bordurilor

`overlay` este un modificator de vizualizare care poate suprapune o nouă vizualizare deasupra vizualizării curente.

Structura sa de bază poate fi înțeleasă astfel:

```swift
Vizualizarea curentă
    .overlay {
        Vizualizarea suprapusă
    }
```

În acest caz, vizualizarea curentă este fotografia care a fost deja decupată într-un cerc:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Noua vizualizare pe care vrem să o suprapunem este o bordură circulară:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Așadar, putem combina fotografia și bordura:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Aici, `overlay` înseamnă suprapunerea unei noi vizualizări deasupra vizualizării curente.

În `overlay`, bordura se suprapune urmând zona de afișare a fotografiei curente, deci nu este necesar să setăm separat un `frame`. Atâta timp cât forma bordurii este aceeași cu forma de decupare, bordura se poate potrivi cu fotografia.

![view](../../../Resource/032_view10.png)

Efectul final este că deasupra fotografiei circulare este acoperită o bordură circulară.

Comparativ cu `ZStack`, `overlay` este mai potrivit pentru scenarii de tipul „adăugarea unei decorații la vizualizarea curentă”. Fotografia este elementul principal, iar bordura este doar un efect suplimentar, deci folosirea `overlay` este mai clară.

## Finalizarea galeriei foto

Acum, adăugăm fiecărei fotografii forma și bordura corespunzătoare:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rezultatul afișării:

![view](../../../Resource/032_view13.png)

Astfel, o pagină de galerie foto de bază este finalizată.

În această pagină, folosim `ScrollView` pentru a realiza afișarea derulabilă, folosim `Image` pentru a afișa fotografii, folosim `clipShape` pentru a decupa forma fotografiilor și folosim `overlay` și `strokeBorder` pentru a adăuga borduri.

## Cod complet

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Rezumat

În această lecție, am finalizat o pagină de galerie foto.

![view](../../../Resource/032_view13.png)

În acest exemplu, am folosit mai întâi `Image` pentru a afișa fotografii, apoi am extins `Image` prin `extension` cu o metodă `photoGalleryStyle`, pentru a organiza codul repetat al stilului de imagine.

Apoi, am învățat tipurile comune de `Shape` din SwiftUI, cum ar fi `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` și `Ellipse`. Aceste grafice nu doar că pot fi afișate direct, ci pot fi folosite și împreună cu `clipShape` pentru a decupa vizualizări.

De exemplu:

```swift
.clipShape(Circle())
```

înseamnă decuparea vizualizării într-un cerc.

În cele din urmă, am folosit `overlay` și `strokeBorder` pentru a adăuga fotografiilor borduri cu forme corespunzătoare. Trebuie observat că `border` desenează de obicei bordura conform zonei dreptunghiulare a vizualizării. Dacă vrem ca bordura să urmeze un cerc, o capsulă sau o elipsă, este mai potrivit să suprapunem același `Shape`.

Prin această lecție, nu doar am finalizat efectul de galerie foto, ci am și înțeles combinația frecventă dintre `Shape`, `clipShape`, `strokeBorder` și `overlay` în interfețe.

## Exerciții după lecție

### 1. Adaugă un fundal pentru galeria foto

Adaugă o imagine de fundal pe tot ecranul pentru pagina galeriei foto.

Cerință: imaginea de fundal trebuie să umple întregul ecran și să ignore zona sigură.

### 2. Bordură în gradient

Modifică bordurile existente cu o singură culoare în borduri cu gradient liniar.

Poți încerca să folosești `LinearGradient` pentru a obține efecte de bordură mai bogate.

### 3. Bordură foto realistă

Caută online câteva stiluri reale de rame foto și încearcă să folosești `overlay` pentru a suprapune rame de imagine, astfel încât fotografiile să arate mai aproape de ramele reale.

Rezultatul afișării exercițiului:

![button](../../../Resource/032_view15.jpeg)

### 4. Realizează o bordură pentru un buton rotunjit

În dezvoltarea reală, butoanele folosesc frecvent borduri de dreptunghi rotunjit.

Încearcă să creezi un buton rotunjit și să folosești `RoundedRectangle` și `strokeBorder` pentru a adăuga butonului o bordură rotunjită.

Rezultatul afișării exercițiului:

![button](../../../Resource/032_view14.png)

### Întrebare de gândire

Dacă nu vrei să folosești o bordură cu o singură culoare și nici o bordură în gradient, ci vrei ca bordura să prezinte un anumit efect de model, cum ar trebui implementat?

Poți încerca să cauți materiale și să afli utilizări relevante precum `overlay`, `mask` sau `ImagePaint`.

Rezultatul afișării exercițiului:

![button](../../../Resource/032_view16.png)
