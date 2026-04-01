# Petlje i popisi

U ovoj lekciji naučit ćemo `for` petlju u Swiftu te `ForEach` u SwiftUI-ju.

Obje nam mogu pomoći da redom, jedan po jedan, čitamo elemente u polju. U stvarnom razvoju često trebamo iz skupine podataka uzimati stavke jednu po jednu, a zatim ih obrađivati ili prikazivati, a petlje su upravo važan alat za obavljanje tog zadatka.

Kada pregledavamo web-stranice ili koristimo aplikaciju, često vidimo mnogo popisa ili stavki. Takav se sadržaj obično prvo sprema u `polje`, zatim se čita jedan po jedan pomoću `petlje`, i na kraju se prikazuje u sučelju.

Na primjer, Googleov popis rezultata pretraživanja:

![Google](../../Resource/017_google.png)

Svaka stavka u popisu rezultata pretraživanja obično odgovara jednom podatku i prikazuje se jedna po jedna pomoću petlje.

Zato se `polja` i `petlje` često pojavljuju zajedno. `Polje` je zaduženo za spremanje skupine podataka, a `petlja` je zadužena za to da te podatke uzima redom i nad njima izvršava istu operaciju.

Zatim krenimo od najosnovnije `for` petlje.

## Odbrojavanje

Pretpostavimo da želimo simulirati funkciju odbrojavanja i redom ispisati `“5, 4, 3, 2, 1”`.

Najizravniji način pisanja toga je:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Iako se na ovaj način može simulirati odbrojavanje, ako sadržaja ima mnogo, to će izgledati vrlo ponavljajuće, a kasnije neće biti praktično za izmjene.

U tom trenutku možemo prvo staviti podatke u polje, a zatim koristiti `for` petlju da ih ispisujemo jedan po jedan:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Ovakav zapis je sažetiji i lakše ga je proširivati. Čak i ako u odbrojavanju ima mnogo brojeva, ne trebamo redak po redak pisati `print`, nego samo pustiti petlju da automatski obradi svaki element u polju.

Taj kod možemo staviti u gumb kako bismo ga testirali:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Kada se pritisne gumb, `for` petlja će redom uzeti svaki cijeli broj iz `countDown` i ispisati ga u konzolu.

Zatim pogledajmo kako `for` petlja radi.

## for petlja

`for` petlja koristi se za obradu skupine podataka redom. Najčešći objekti su polja i rasponi.

Osnovni zapis:

```swift
for element in poljeIliRaspon {
    kodZaIzvršavanje
}
```

Na primjer, kod odbrojavanja od maloprije:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Ovdje `i` predstavlja trenutačno izdvojeni element, a iza `in` nalazi se podatak kroz koji se prolazi petljom, odnosno polje `countDown`.

Značenje ovog koda je: program će redom uzimati svaki element iz polja `countDown`. Svaki put kada uzme jedan element, privremeno će ga predstavljati pomoću `i`, a zatim će izvršiti kod unutar vitičastih zagrada.

Proces izvršavanja može se razumjeti ovako:

* Prvi izdvojeni element je `5`, pa je u tom trenutku vrijednost `i` jednaka `5`
* Izvršava se `print(i)` i ispisuje se `5`
* Zatim se nastavlja s idućim elementom `4`
* Ponovno se izvršava `print(i)` i ispisuje se `4`

Kasniji `3`, `2` i `1` također će se izvršavati jedan po jedan na isti način.

![for](../../Resource/017_for.png)

Kada su svi elementi u polju obrađeni, `for` petlja automatski završava.

Pomoću `for` petlje možemo dohvatiti svaki element u polju i ostvariti funkcije poput ovog odbrojavanja.

**Napomena**: `i` je vrlo čest način imenovanja u for petlji i koristi se za predstavljanje trenutačno izdvojenog elementa, ali to nije obavezan zapis. Mogu se koristiti i druga engleska imena.

Na primjer, koristiti `num` za predstavljanje svakog izdvojenog elementa:

```swift
for num in countDown {
    print(num)
}
```

Unutar vitičastih zagrada također treba koristiti `num` za predstavljanje trenutačno izdvojenog elementa.

### Petlja kroz raspon

`for` petlja ne može prolaziti samo kroz polja, nego i kroz raspone.

Na primjer, kada trebamo izračunati zbroj pozitivnih cijelih brojeva unutar `50`, moramo jedan po jedan zbrojiti sve cijele brojeve između `1` i `50`.

Najizravniji zapis mogao bi biti:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Problem s ovakvim pristupom je što svaki broj moramo napisati ručno. To je zamorno i nije prikladno za stvarne razvojne scenarije.

U tom trenutku možemo koristiti operator raspona zajedno s `for` petljom da to obavimo.

U prethodnom poglavlju o “operatorima” već smo naučili operator raspona:

```swift
1...3   // 1, 2, 3
```

Ovdje `...` predstavlja zatvoreni raspon, što znači da uključuje i početnu i završnu točku.

Stoga ovdje možemo koristiti `for` petlju kroz raspon cijelih brojeva od `1` do `50`:

```swift
for i in 1...50 {
    
}
```

Te brojeve trebamo zbrojiti, pa nam je potrebna i varijabla za spremanje ukupnog zbroja:

```swift
var count = 0
```

Zatim u svakoj iteraciji dodamo trenutačno izdvojeni broj u `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Ovaj kod znači:

* `count` se koristi za spremanje trenutačnog zbroja
* `for` petlja će jedan po jedan uzimati cijele brojeve od `1` do `50`
* Svaki put kada se uzme jedan cijeli broj, izvršit će se `count += i`
* Kada petlja završi, `count` će sadržavati konačni zbroj

Na taj način možemo dobiti zbroj svih pozitivnih cijelih brojeva unutar `50`.

Isto tako, ako trebamo izračunati zbroj cijelih brojeva od `1` do `100`, trebamo samo promijeniti raspon:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

`for` petlja ne može prolaziti samo kroz polja, nego i kroz raspon. Ta sposobnost da se podaci ponavljano obrađuju redom vrlo je česta u razvoju.

Može nam pomoći da automatski obavimo mnogo ponavljajućih zadataka, bez potrebe da ručno pišemo zbrajanje svakog broja ili druge slične ponavljajuće operacije.

## Petlje u SwiftUI-ju

Prethodna `for` petlja pripada samom jeziku Swift.

Ali u SwiftUI-ju ne možemo izravno koristiti `for` unutar strukture prikaza za generiranje prikaza:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

To je zato što `VStack` iznutra treba SwiftUI prikaze, dok obična `for` petlja sama po sebi nije prikaz.

Ako u SwiftUI-ju želimo ponavljano generirati sučelje prema sadržaju polja, moramo koristiti `ForEach`.

Na primjer, ako želimo prikazati imena svih članova neke grupe, možemo napisati:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Rezultat prikaza:

![for1](../../Resource/017_for1.png)

Zatim svakom `Text` dodajemo iste modifikatore:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Sada se svaki `Text` prikazuje manjim i debljim fontom.

Rezultat prikaza:

![](../../Resource/017_for2.png)

Iako modifikatori čine sučelje ljepšim, oni također čine kod dužim i ponavljajućim.

Ako se broj imena nastavi povećavati ili ako kasnije želimo jednako promijeniti font, boju i druge stilove, morat ćemo mnogo istog koda pisati i mijenjati više puta. To je prilično zamorno i nije praktično za održavanje.

U tom trenutku možemo ta imena prvo staviti u polje, a zatim koristiti `ForEach` u SwiftUI-ju za ponavljano generiranje prikaza prema podacima iz polja:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Ovaj kod je sažetiji. `ForEach` će jedan po jedan čitati svaki element iz polja i prikazivati odgovarajući sadržaj u sučelju.

Kada kasnije dodamo nova imena, trebamo samo promijeniti sadržaj polja `names`. Ne trebamo svaki put ponovno dodavati `Text` i složene modifikatore.

## ForEach

`ForEach` je struktura u SwiftUI-ju koja se koristi za ponavljano generiranje prikaza. Možete je razumjeti kao strukturu u SwiftUI-ju sličnu `for` petlji.

Osnovna upotreba:

```swift
ForEach(polje, id: \.self) { element in
    SwiftUI kod
}
```

Na primjer, imena grupe od maloprije:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ovaj kod znači:

`names` je polje kroz koje se prolazi petljom, odnosno podaci koji se trebaju prikazati.

`id:\.self` znači koristiti sam element u polju za razlikovanje svake stavke.

U trenutačnom primjeru polje sadrži nizove znakova:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Zato će SwiftUI izravno koristiti same nizove, kao što su "Sam", "John", "Wathon" i "Bob", za razlikovanje različitog sadržaja.

Za uobičajena jednostavna polja u početnoj fazi, poput `String` i `Int`, obično možemo prvo pisati:

```swift
id: \.self
```

Za sada je dovoljno da zapamtite samo ovaj jedan oblik. Nema potrebe dublje ulaziti u druga pravila za `id`.

`item` u `item in` predstavlja trenutačno izdvojeni element.

Na primjer, u prvoj iteraciji `item` je `"Sam"`, a u drugoj iteraciji `item` je `"John"`.

Zato:

```swift
Text(item)
```

postupno postaje:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Dakle, funkcija ovog koda je: jedan po jedan uzeti svako ime iz polja `names` i za svako ime generirati `Text` prikaz.

### Proces izvršavanja

Proces izvršavanja može se razumjeti ovako:

* `ForEach` prvo čita prvi element `"Sam"` u polju `names`
* `item` privremeno predstavlja `"Sam"`
* `Text(item)` prikazuje `"Sam"`
* Zatim nastavlja čitati sljedeći element `"John"`
* I ponovno izvršava isti kod prikaza

Na kraju će se prikazati sva imena u polju.

Prednost ovakvog pisanja je ta da, kada ima više imena, ne trebamo ponovno pisati mnogo `Text` prikaza, nego samo mijenjati sadržaj polja.

### Petlja kroz fotografije

`ForEach` ne može prikazivati samo tekst, nego i slike, boje ili druge SwiftUI prikaze.

Na primjer, pripremimo 4 slike:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Povucite te četiri slike u Assets mapu u Xcodeu.

![image](../../Resource/017_for3.png)

Ako ne koristimo `ForEach`, svaku sliku moramo napisati ručno:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Rezultat prikaza:

![image](../../Resource/017_for4.png)

Iako se na ovaj način može postići funkcionalnost, kod će biti prilično dug.

Ako bude sve više slika, morat ćemo ponovno pisati sve više `Image` koda.

Ako kasnije želimo jednako promijeniti veličinu slika, morat ćemo ih mijenjati jednu po jednu.

U tom trenutku možemo staviti nazive slika u polje, a zatim koristiti `ForEach` za ponavljano generiranje prikaza slika:

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

Ovdje je `images` polje nizova znakova, a svaki element u polju je naziv slike.

`ForEach(images, id: \.self)` znači da se jedan po jedan čita svaki element iz polja `images`, da se sam element koristi za razlikovanje svake stavke, a zatim se prema trenutačnom elementu generira odgovarajući prikaz.

Na primjer, ako je prvi pročitani element `"430F9BEF"`, tada:

```swift
Image(item)
```

znači isto što i:

```swift
Image("430F9BEF")
```

I sljedeće slike također će se prikazivati jedna po jedna na isti način.

![image](../../Resource/017_for4.png)

Ovdje i dalje koristimo:

```swift
id: \.self
```

Razlog je isti kao i prije: zato što su elementi u polju `images` također jednostavni nizovi znakova, pa u početnoj fazi možemo izravno koristiti sam element kao način razlikovanja svake stavke.

To se može jednostavno razumjeti kao fiksna formula:

**Kada `ForEach` prolazi kroz jednostavno polje poput `String` ili `Int`, obično se piše `id: \.self`.**

### Dodavanje novih slika

Ako kasnije trebamo dodati nove slike, trebamo samo promijeniti sadržaj polja:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Nema potrebe ponovno pisati novi `Image` kod.

Ako ima mnogo slika, to se može koristiti zajedno sa `ScrollView`. U suprotnom, kada sadržaj prijeđe granice zaslona, neće se moći u potpunosti pregledati.

```swift
ScrollView {
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

### Mijenjanje slika

Kada trebamo jednako promijeniti stil svih slika, trebamo samo promijeniti kod unutar `ForEach`.

Na primjer, promijeniti širinu na `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Na taj će se način sve slike promijeniti odjednom i nećemo ih morati mijenjati jednu po jednu.

To je jedna važna uloga `ForEach`:

**Kada više prikaza ima istu strukturu, a razlikuje se samo sadržaj, možemo kod prikaza napisati samo jednom, a zatim pustiti podatke u polju da odluče što će se prikazati.**

## Sažetak

U ovoj lekciji naučili smo `for` petlju i `ForEach`.

`for` petlja koristi se za obradu elemenata u polju ili rasponu redom i više je usmjerena na obradu podataka.

`ForEach` se koristi u SwiftUI-ju za ponavljano generiranje prikaza prema sadržaju polja i više je usmjeren na prikaz sučelja.

U trenutačnoj početnoj fazi najčešći oblik `ForEach` je:

```swift
ForEach(polje, id: \.self) { element in
    SwiftUI kod
}
```

Ovdje `id: \.self` znači koristiti sam element za razlikovanje svake stavke.

Kada je sadržaj polja jednostavan tip poput `String` ili `Int`, obično možemo prvo krenuti samo s ovim jednim zapisom.

Kasnije, kada budete pregledavali web-stranice ili aplikacije i vidjeli skupinu ponavljajućih tekstova, slika ili drugog sadržaja popisa, možete pomisliti da se u SwiftUI-ju takav sadržaj obično prvo stavlja u polje, a zatim se prikazuje jedan po jedan pomoću `ForEach`.
