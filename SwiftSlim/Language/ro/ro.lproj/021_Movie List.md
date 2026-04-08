# Lista de Filme

În această lecție, vom crea o listă de filme.

![movie](../../Resource/021_movie.png)

Lista va afișa posterul, numele, regizorul și ratingul fiecărui film.

În acest exemplu, vom învăța un concept foarte important: structura `struct`. Ea ne poate ajuta să combinăm mai multe informații despre un film într-un singur tot. În plus, vom lucra și cu `UUID()`, `ForEach`, separatorul `Divider` și cu modul de a folosi obiecte personalizate pentru a gestiona datele.

Aceste idei sunt foarte comune în dezvoltarea SwiftUI de mai târziu. După ce termini această lecție, nu doar că vei putea construi o listă de filme, ci vei începe și să înțelegi „cum să afișezi un set de date ca interfață”.

## Un Singur Film

Putem începe prin a construi interfața pentru un singur film.

![movie](../../Resource/021_movie1.png)

Aspectul acestei interfețe este alcătuit în principal din două părți: posterul filmului în stânga și introducerea filmului în dreapta.

### Posterul Filmului

Partea stângă afișează posterul filmului, iar noi putem folosi `Image` pentru a afișa imaginea.

De exemplu:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Acest cod înseamnă că este afișată o imagine numită `"The Shawshank Redemption"`.

Un lucru important de reținut aici este că numele imaginii trebuie să existe cu adevărat în folderul de resurse `Assets`. În caz contrar, interfața nu va putea afișa această imagine corect.

![movie](../../Resource/021_movie2.png)

Funcțiile acestor modificatori sunt:

- `resizable()` înseamnă că imaginea poate fi redimensionată.
- `scaledToFit()` înseamnă că proporția originală este păstrată în timpul scalării, astfel încât imaginea să nu fie întinsă sau deformată.
- `frame(height: 180)` înseamnă că înălțimea imaginii este setată la 180.
- `cornerRadius(10)` înseamnă că imaginea primește colțuri rotunjite cu o rază de 10.

În acest fel, putem obține un poster de film cu o dimensiune potrivită și colțuri rotunjite.

![movie](../../Resource/021_movie3.png)

### Introducerea Filmului

Partea dreaptă afișează introducerea filmului, inclusiv numele filmului, regizorul și ratingul.

![movie](../../Resource/021_movie4.png)

Putem folosi `Text` pentru a afișa această parte:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

În acest cod, `.font` reprezintă dimensiunea fontului, iar `.fontWeight` reprezintă grosimea fontului.

Pentru a face mai clar spațiul dintre „numele filmului”, „informațiile despre regizor” și „informațiile despre rating”, folosim aici `VStack` la nivelul cel mai exterior și setăm:

```swift
spacing: 10
```

Aceasta înseamnă că spațiul dintre fiecare grup de conținut din interiorul acestui `VStack` este 10.

Motivul pentru care regizorul și ratingul folosesc fiecare încă un `VStack` este că ambele aparțin unei structuri de tip „titlu + conținut”. Din acest motiv, ierarhia interfeței devine mai clară și este, de asemenea, mai convenabil pentru noi să ajustăm stilul mai târziu.

În plus, `VStack` este centrat în mod implicit. Pentru a alinia tot textul la stânga, setăm:

```swift
alignment: .leading
```

Acest lucru face ca secțiunea de introducere a filmului să arate mai ordonat.

### Separator

Acum, deși conținutul din introducerea filmului a fost distanțat folosind `spacing`, limitele dintre diferitele bucăți de conținut încă nu sunt suficient de evidente.

În acest moment, putem adăuga un separator:

```swift
Divider()
```

De exemplu:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Acest lucru oferă secțiunii de introducere a filmului un efect de separare mai evident.

![movie](../../Resource/021_movie4.png)

`Divider` este un view foarte simplu, dar utilizat frecvent, al cărui rol este să separe conținuturi diferite.

În `VStack`, `Divider()` este afișat ca o linie orizontală.

În `HStack`, `Divider()` este afișat ca o linie verticală.

În plus, putem modifica stilul lui `Divider` prin metode precum `.frame`, `.background` și `.padding`.

De exemplu:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Acest lucru creează o linie separatoare albastră cu grosimea 2 și spațiere orizontală de ambele părți.

![divider](../../Resource/021_divider.png)

### Interfața Completă

În cele din urmă, putem folosi `HStack` pentru a aranja posterul filmului și introducerea filmului unul lângă altul.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Aici, `HStack(spacing: 20)` înseamnă că există un spațiu de 20 între secțiunea din stânga și cea din dreapta.

Este important de reținut că `Divider()`, la fel ca `TextField` și `Slider` despre care am discutat mai devreme, încearcă în mod implicit să ocupe cât mai mult spațiu disponibil.

Prin urmare, setăm o lățime fixă pentru `VStack` exterior al secțiunii de introducere din dreapta:

```swift
.frame(width: 200)
```

Acest lucru păstrează consistentă lățimea liniei separatoare și a zonei de text, făcând ca întregul aspect să arate mai curat.

În acest punct, am finalizat interfața de afișare pentru un „singur film”.

![movie](../../Resource/021_movie1.png)

## Stocarea Filmelor într-un Array

Dacă vrem să afișăm mai multe filme unul după altul în același stil, asta înseamnă că ar trebui să scriem cod similar pentru fiecare film.

De exemplu:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Deși un cod scris în acest fel poate obține rezultatul dorit, codul va deveni din ce în ce mai lung și va fi foarte greu de întreținut.

De exemplu, dacă trebuie să schimbăm spațierea pentru toate filmele de la `20` la `15`, sau să schimbăm lățimea părții din dreapta de la `200` la
`220`, ar trebui să edităm manual fiecare bloc repetat de cod.

Acesta nu este, evident, un mod eficient.

Am învățat anterior despre array-uri și am învățat, de asemenea, să folosim `ForEach` pentru a afișa în mod repetat view-uri pe baza unui array.

De exemplu:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Această abordare este foarte potrivită pentru situațiile în care există „doar o singură bucată de date”, cum ar fi un grup de nume de imagini.

Totuși, un film nu are doar o singură valoare. El conține cel puțin:

1. posterul filmului
2. numele filmului
3. regizorul
4. ratingul

Cu alte cuvinte, un film este de fapt un set de date conexe, nu doar un singur șir de caractere.

Dacă folosim doar array-uri, putem stoca aceste informații doar separat:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Când le afișăm, trebuie să ne bazăm pe același index pentru a le potrivi una câte una:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Problema cu această abordare este că costul de întreținere este foarte ridicat.

Deoarece datele unui film sunt împărțite în mai multe array-uri, este suficient ca un array să aibă un element în plus, un element lipsă sau o ordine diferită, iar rezultatul afișării va fi greșit.

Mai ales atunci când adaugi sau elimini filme, trebuie să actualizezi mai multe array-uri în același timp și este foarte ușor să omiți ceva.

Așadar, cum putem combina informații precum „numele filmului, regizorul și ratingul” într-un singur tot?

Pentru asta este nevoie să folosim `struct`.

## Definirea unei structuri struct

În Swift, `struct` înseamnă „structură”.

Poți să te gândești la ea ca la un „tip de date personalizat” care poate combina mai multe câmpuri conexe într-un singur tot.

Utilizare de bază:

```swift
struct StructName {
	let name: String
}
```

În acest cod, `struct` este cuvântul-cheie care indică faptul că definim o structură. `StructName` este numele structurii.

Conținutul din interiorul acoladelor este setul de câmpuri conținute în această structură, iar fiecare câmp trebuie să includă clar atât un nume, cât și un tip.

În mod normal, numele unei `struct` începe cu literă mare, cum ar fi `Movie`, `Student` sau `UserInfo`. Aceasta este o convenție comună de denumire în Swift.

Poți pur și simplu să te gândești la `struct` ca la o cutie goală, în care fiecare câmp este ca o poziție rezervată în interiorul cutiei.

Atunci când aceste poziții nu au fost încă umplute, este doar o cutie goală. Doar după ce toate câmpurile sunt completate cu valori potrivite devine o cutie cadou completă.

### Instanță de struct

Mai devreme, am definit doar structura în sine, ceea ce este echivalent cu pregătirea formei cutiei.

Încă trebuie să completăm conținutul real pentru a obține o „instanță” adevărată care poate fi folosită.

Când creăm o instanță, adăugăm de obicei `()` după numele structurii:

```swift
StructName(...)
```

Ceea ce este completat în paranteze este conținutul câmpurilor cerute de această structură.

De exemplu:

```swift
StructName(name: "Fang Junyu")
```

Acest cod înseamnă: creează o instanță nouă conform formatului structurii `StructName` și atribuie valoarea `"Fang Junyu"` câmpului `name`.

Când completăm toate valorile de câmp necesare, este ca și cum am umple cutia.

În acel moment, obținem o instanță completă a structurii.

### Accesarea Proprietăților unei struct

După ce am creat o instanță, putem folosi sintaxa cu punct pentru a accesa proprietățile din interiorul ei.

Sintaxă de bază:

```swift
instance.propertyName
```

De exemplu:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Aici, `st` este o instanță a structurii, iar `st.name` înseamnă citirea valorii `name` din acea instanță.

Poți înțelege această metodă de citire astfel: când scriem `st.name`, este ca și cum am citi conținutul stocat într-o anumită poziție din acea cutie.

Acest stil de scriere va fi foarte comun în interfețele SwiftUI de mai târziu.

De exemplu, dacă avem o structură de student care include nume, vârstă și clasă, atunci când o afișăm în interfață putem citi:

```swift
student.name
student.age
student.className
```

Avantajul acestui lucru este că datele devin mai clare și mai ușor de gestionat.

### Poziția unei struct

Pentru începători, structura poate fi de obicei scrisă în afara `ContentView`.

De exemplu:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Acest lucru face structura mai clară și mai ușor de citit.

Vei observa că `ContentView` în sine este, de fapt, tot o `struct`.

### Structura Movie

Cu baza de mai sus, putem defini o structură pentru film:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Aceasta este o structură numită `Movie`, alcătuită din cele trei câmpuri `name`, `director` și `rating`, care reprezintă numele filmului, regizorul și ratingul.

În acest fel, informațiile legate de un film nu mai trebuie împărțite în mai multe array-uri, ci pot fi combinate direct într-un singur tot.

De exemplu, putem crea o instanță de film astfel:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Această instanță reprezintă „un set complet de date despre film”.

### Stocarea Structurilor într-un Array

Mai devreme, am spus că un array poate stoca un singur tip.

Acum că avem deja structura `Movie`, array-ul poate stoca mai multe valori `Movie`.

```swift
let lists: [Movie] = []
```

De exemplu:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

În acest array `lists`, ceea ce este stocat nu sunt șiruri de caractere, ci mai multe instanțe `Movie`.

Adică fiecare element din array este un film complet.

În acest fel, atunci când trebuie să afișăm lista de filme, putem folosi `ForEach` pentru a citi fiecare film unul câte unul.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Aici, `movie in` înseamnă că în fiecare buclă, un film este luat din array și numit temporar `movie`.

Apoi, putem folosi:

```swift
movie.name
movie.director
movie.rating
```

pentru a citi numele, regizorul și ratingul acelui film și pentru a le afișa în interfață.

## Eroare ForEach

În acest punct, am finalizat deja stilul de bază de scriere pentru array-ul de filme și `ForEach`.

Totuși, dacă rulezi direct următorul cod:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

vei primi o eroare:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Semnificația acestei erori este că atunci când scrii `id: \.self`, SwiftUI trebuie să trateze fiecare element din array ca pe un „identificator unic” pentru a le putea distinge.

Acest stil de scriere este potrivit pentru tipuri simple precum `String` și `Int`, deoarece ele sunt mai ușor de distins prin ele însele.

Dar `Movie` este o structură personalizată definită de noi, iar `ForEach` nu știe cum să trateze structura însăși ca identificator unic, așa că raportează o eroare.

Cel mai comun mod de a rezolva această problemă este să faci `Movie` să respecte protocolul `Identifiable`.

## Protocol

În Swift, un protocol poate fi înțeles ca un fel de „regulă” sau „cerință”.

Te poți gândi la el ca la un acord într-o organizație internațională: dacă o țară vrea să intre într-o anumită organizație internațională, de obicei trebuie mai întâi să satisfacă anumite reguli propuse de acea organizație, să dezvăluie anumite date și să urmeze anumite reguli comune. Doar după îndeplinirea acestor condiții poate intra sau participa la anumite activități.

Protocoalele funcționează într-un mod asemănător.

Când un tip vrea să respecte un anumit protocol, trebuie să satisfacă conținutul cerut de acel protocol. Numai după ce îndeplinește aceste cerințe, acel tip poate folosi funcționalitatea corespunzătoare.

Sintaxă de bază:

```swift
struct Movie: Identifiable {
    // ...
}
```

Aici, `: Identifiable` înseamnă că `Movie` respectă protocolul `Identifiable`.

Dacă un tip respectă mai multe protocoale, ele pot fi separate prin virgule:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Pentru `Identifiable`, cea mai importantă cerință este ca tipul să aibă un `id` care îl poate identifica.

De exemplu:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Aici, `id` este ca un număr de identificare și este folosit pentru a distinge fiecare film.

Atâta timp cât `id`-ul fiecărui film este diferit, SwiftUI poate distinge corect fiecare element din array.

De exemplu:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Apoi folosește următorul cod în `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Astfel, nu va mai exista nicio eroare.

Deoarece `Movie` respectă deja `Identifiable`, un stil de scriere mai comun este să omitem direct `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Pentru că SwiftUI știe deja să folosească `movie.id` pentru a distinge fiecare element.

## Identificatorul Distinctiv din ForEach

În continuare, vom înțelege mai profund rolul lui `id` în `ForEach`.

De exemplu:

```swift
ForEach(lists, id: \.self)
```

Acest lucru înseamnă: folosește elementul însuși ca identificator distinctiv.

Iar:

```swift
ForEach(lists, id: \.id)
```

înseamnă: folosește câmpul `id` al elementului ca identificator distinctiv.

Dacă un anumit câmp poate garanta unicitatea de unul singur, el poate fi folosit și temporar.

De exemplu, dacă fiecare film are un nume diferit, atunci următorul cod poate funcționa corect și cu datele actuale:

```swift
ForEach(lists, id: \.name)
```

Dar aici există o problemă ascunsă: `name` nu este garantat că va fi mereu unic.

Să presupunem că mai târziu adaugi un alt film cu același nume. Atunci `name` nu va mai putea distinge corect fiecare element.

În acel moment, chiar dacă codul se poate compila în continuare, SwiftUI poate recunoaște incorect elementele în timpul reîmprospătării view-ului, al actualizărilor, inserărilor sau ștergerilor, provocând probleme de afișare.

Prin urmare, atunci când avem nevoie de o diferențiere stabilă a datelor, este totuși mai bine să folosim câmpul cu adevărat unic, adică `id`.

## UUID

Deși scrierea manuală a `id: 1`, `id: 2` poate rezolva problema, încă există un risc: poți scrie accidental valori `id` duplicate, iar atunci identificatorul unic devine invalid.

De exemplu:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Acest lucru duce la două valori `id` identice, iar identificatorul unic își pierde efectul.

Pentru a evita greșelile manuale, folosim de obicei `UUID()`.

În Swift, `UUID()` generează aleator un identificator pe 128 de biți. El este afișat de obicei ca un șir lung format din litere și cifre.

De exemplu:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Aici, `UUID()` creează de fapt o instanță a tipului `UUID`. Poți să te gândești la el ca la un „număr unic” generat automat.

Din acest motiv, valorile create de fiecare dată aproape că nu se repetă niciodată, deci sunt foarte potrivite pentru a fi folosite ca `id`.

Putem modifica `Movie` astfel:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Acest cod înseamnă că câmpul `id` din structura `Movie` va primi în mod implicit o nouă instanță `UUID`.

Cu alte cuvinte, de fiecare dată când creăm un nou `Movie`, sistemul va genera mai întâi automat un `id` unic.

Deoarece `id` are deja o valoare implicită, nu mai trebuie să completăm manual `id` atunci când creăm instanțe `Movie` mai târziu.

De exemplu:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Deși `id` nu este scris aici, instanța filmului are totuși propriul `id`; doar că această valoare a fost deja generată automat de `UUID()`.

După folosirea acestei metode, nu mai trebuie să completăm manual `id` pentru fiecare film, ceea ce nu doar că reduce cantitatea de cod, dar evită și erorile cauzate de valorile id duplicate.

În final, trebuie doar să adăugăm o imagine `Banner` în partea de sus și să folosim `ScrollView` pentru ca conținutul să poată fi derulat, iar apoi întregul ecran al listei de filme este complet.

## Rezumat

În această lecție, am învățat un concept foarte important: `struct`.

Prin `struct`, putem combina mai multe câmpuri conexe ale unui film într-un singur tot, în loc să împărțim numele, regizorul și ratingul în mai multe array-uri.

După ce datele sunt combinate, putem folosi `ForEach` pentru a afișa fiecare film din array unul câte unul în view.

În același timp, am înțeles și rolul „identificatorului distinctiv” în `ForEach`: SwiftUI trebuie să știe cum să distingă fiecare element din array pentru a afișa și actualiza corect view-ul.

Prin urmare, am făcut ca `Movie` să respecte protocolul `Identifiable` și i-am oferit un `id` unic.

Pentru a evita greșelile la completarea manuală a `id`, am învățat în continuare `UUID()`, astfel încât sistemul să poată genera automat identificatorul unic.

După ce termini această lecție, nu doar că vei finaliza lista de filme, ci vei începe să atingi și o idee importantă în SwiftUI: **organizează mai întâi datele, apoi generează view-ul pe baza lor.**

## Cod Complet

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
