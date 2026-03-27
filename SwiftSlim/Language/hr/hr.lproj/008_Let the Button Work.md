# Pokrenimo gumb

U ovoj lekciji uglavnom učimo o gumbu `Button`, ispisu informacija za debug pomoću `print` i Swift funkcijama.

Ovi su sadržaji temelj interaktivnog programiranja u SwiftUI-ju.

## Gumb

Gumb je jedan od najčešćih UI kontrola. Kada trebamo preuzeti, otvoriti ili izaći iz nečega, obično kliknemo gumb.

Na primjer, u App Storeu kliknemo gumb “Get” kako bismo preuzeli aplikaciju.

![Button](../../RESOURCE/008_button.png)

U SwiftUI-ju se gumb predstavlja pomoću `Button`.

Osnovna upotreba:

```swift
Button("") {
    
}
```

Struktura se može podijeliti na dva dijela:

```swift
Button("Tekst gumba") {
    Kod koji se izvršava pri kliku gumba
}
```

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Nakon pokretanja prikazat će se gumb `Start`.

![Button](../../RESOURCE/008_button1.png)

Kada korisnik klikne gumb, izvršit će se kod unutar `{}`.

Važno je napomenuti: `Button` pripada SwiftUI sučelnim kontrolama (`View`), pa mora biti napisan unutar `body`.

### Modifikator `buttonStyle`

U SwiftUI-ju `Button` nudi ugrađene sistemske stilove gumba koji se mogu koristiti preko modifikatora `buttonStyle`.

Na primjer:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` koristi sistemski ponuđeni stil gumba.

Česte opcije uključuju:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

Razlike između različitih stilova uglavnom se očituju u tome ima li gumb obrub, pozadinu i koliko je vizualno naglašen.

## `print` ispis

U programiranju često trebamo provjeriti je li program stigao do određenog dijela koda.

Swift pruža funkciju `print` za ispis informacija za debug.

Osnovni zapis:

```swift
print("Hello")
```

Ta će linija ispisati tekst u `Console` (konzolu).

### Testiranje radi li gumb

Možemo napisati `print` unutar gumba kako bismo testirali je li gumb kliknut.

```swift
Button("Start") {
    print("Test 123")
}
```

Kada se klikne gumb, `Console` će ispisati:

```
Test 123
```

To znači da je gumb uspješno aktiviran.

![Button](../../RESOURCE/008_button3.png)

Napomena: `print` je Swift kod, a ne sučelna kontrola. Ne može se staviti izravno u `body`, inače će doći do greške.

Na primjer, ovakav zapis je pogrešan:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Greška: body mora vratiti jedan View
    }
}
```

U SwiftUI-ju `body` služi za opis strukture sučelja i unutar njega mogu stajati samo sučelne kontrole (`View`), poput `Text`、`Button`、`Image` i drugih.

Obični kod (logika izračuna, `print` i slično) mora biti smješten unutar gumba, funkcije ili drugog rukovatelja događajem.

### Konzola `Console`

Sadržaj koji ispisuje `print` prikazuje se u Xcode `Console` području.

Ako ne vidite `Console`, možete kliknuti gumb `Show the Debug Area` u donjem desnom kutu da otvorite debug područje, a zatim kliknuti gumb `Show the Console` da prikažete konzolu.

![](../../RESOURCE/008_button4.png)

U donjem lijevom kutu `Console` postoje dvije oznake: `Executable` i `Previews`.

![](../../RESOURCE/008_button5.png)

Te dvije oznake odgovaraju različitim okruženjima izvođenja: kada ste u Canvas pregledu, izlaz `print` prikazuje se pod oznakom `Previews`; ako aplikaciju pokrećete u simulatoru ili na stvarnom uređaju, izlaz se prikazuje pod oznakom `Executable`.

Zato, ako primijetite da `print` ne daje izlaz, prvo provjerite jeste li odabrali ispravnu oznaku.

## Primjer - ASCII crtež znakovima

U nekim kodnim projektima često se mogu vidjeti ASCII crteži.

ASCII crtež je slika sastavljena od običnih znakova, na primjer:

![ASCII](../../RESOURCE/008_ascii.png)

Možemo koristiti gumb + `print` za ispis jednog ASCII crteža.

Primjer koda:

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

Kada kliknete gumb, `Console` će ispisati:

```
 /\_/\
( o.o )
 > ^ <
```

Napomena: znak `\` u stringu treba napisati kao `\\`, jer je kosa crta u stringovima escape znak.

## Funkcije

Unutar gumba možemo izravno pisati kod.

Na primjer:

```swift
Button("Start") {
    print("Hello")
}
```

Ako je koda malo, takav je zapis u redu. No u stvarnom razvoju logika koju gumb pokreće može biti mnogo veća.

Na primjer:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // možda još mnogo koda
}
```

Ako koda bude sve više, izravno pisanje unutar gumba učinit će kod sučelja neurednim, a čitanje i održavanje bit će otežani.

Zato takav kod obično organiziramo u funkciju, a zatim tu funkciju pozivamo iz gumba.

### Što je funkcija

Funkcija je dio koda koji se može ponovno koristiti.

Kada je potrebno izvršiti neki kod, dovoljno je pozvati tu funkciju i izvršit će se kod unutar nje.

To čini strukturu koda jasnijom i olakšava ponovno korištenje.

### Osnovni zapis

U Swiftu se funkcija definira pomoću ključne riječi **func**:

```swift
func randomInt() {
    // code
}
```

Ovaj kod definira jednu funkciju.

`randomInt` je naziv funkcije i služi za označavanje tog dijela koda.

`()` označava mjesto za parametre, preko kojih funkcija može primati podatke izvana. Ako nisu potrebni, mogu ostati prazni.

Unutar `{}` nalazi se područje koda funkcije, gdje pišemo sve što treba biti izvršeno.

Na primjer:

```swift
func getName() {
    print("FangJunyu")
}
```

Ova funkcija služi za ispis jedne tekstualne linije.

### Pozivanje funkcije

Definiranje funkcije samo stvara taj dio koda. Ako je želimo izvršiti, moramo je pozvati.

Pozivanje se radi tako da se iza naziva funkcije dodaju `()`:

```swift
getName()
```

Kada program dođe do te linije, izvršit će se kod iz funkcije `getName`.

Potpuni primjer:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Nakon pokretanja, `Console` će ispisati:

```
FangJunyu
```

### Korištenje funkcija u SwiftUI-ju

U SwiftUI prikazu funkcije se obično pišu izvan `body`.

Na primjer:

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

Kada kliknete gumb, pozvat će se funkcija `getName()`.

Tako kod sučelja ostaje sažet, a konkretna logika obrađuje se unutar funkcije.

### Parametri funkcije

Ponekad funkcija treba izvršiti različite radnje ovisno o različitim podacima.

Na primjer, možda želimo da funkcija može ispisivati različita imena, a ne samo fiksno `"FangJunyu"`.

Tada možemo koristiti parametre. Parametar možemo razumjeti kao podatke koji se predaju funkciji pri pozivu.

Na primjer:

```swift
func getName(name: String) {
    print(name)
}
```

Ova funkcija dodaje jedan parametar: `name` je naziv parametra, a `String` njegov tip.

To znači da funkcija treba primiti podatke tipa `String`.

Budući da funkcija sada treba podatke, pri pozivu joj te podatke moramo dati.

```swift
getName(name: "Sam")
```

Kada se pri pozivu proslijedi `"Sam"`, funkcija će koristiti tu vrijednost za ispis.

Rezultat pokretanja:

```
Sam
```

## Primjer - ispis ASCII crteža pomoću funkcije

U prethodnom primjeru `print` smo pisali izravno unutar gumba.

Ali ako je crtež složeniji, kod će postati vrlo dug. Tada logiku možemo premjestiti u funkciju kako bi kod sučelja bio jasniji.

Primjer koda:

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

Nakon pokretanja kliknite gumb i `Console` će ispisati:

```
 /\_/\
( o.o )
 > ^ <
```

Ovdje se nakon klika korisnika događaju dvije stvari:

1. gumb poziva funkciju `printCat()`
2. kod `print` unutar funkcije se izvršava

Na taj način kod sučelja odgovoran je samo za pokretanje događaja, a konkretna logika obrađuje se unutar funkcije.

U stvarnom razvoju većina radnji gumba implementira se upravo putem funkcija.

## Sažetak

U ovoj smo lekciji naučili tri važne stvari:

**1. Gumb `Button`**

`Button` je kontrola u SwiftUI-ju koja se koristi za pokretanje radnji.

```swift
Button("Start") {

}
```

Kada korisnik klikne gumb, izvršava se kod unutar vitičastih zagrada.

**2. Ispis `print`**

`print` se koristi za ispis informacija za debug u `Console`.

```swift
print("Hello")
```

Programeri putem `Console` mogu provjeravati stanje izvođenja programa.

**3. Funkcija**

Funkcija je dio koda koji se može ponovno koristiti.

```swift
func sayHello() {
    print("Hello")
}
```

Pozivanje funkcije:

```swift
sayHello()
```

Ako funkcija treba podatke, mogu se koristiti parametri:

```swift
func sayHello(name: String) {
    print(name)
}
```

U sljedećim ćemo lekcijama nastaviti učiti više SwiftUI kontrola i kako podaci komuniciraju sa sučeljem.

## Vježba

Pokušajte dovršiti sljedeće:

1. Stvorite gumb s tekstom `"Hello"`
2. Kada kliknete gumb, neka `Console` ispiše `Hello Swift`
3. Stavite kod za ispis u funkciju, a zatim tu funkciju pozovite unutar gumba
