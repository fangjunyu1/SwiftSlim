# Životni ciklus SwiftUI prikaza

U prethodnoj lekciji saznali smo da `@State` varijable prate životni ciklus prikaza, a također smo naučili i osnovnu upotrebu `onAppear`.

U ovoj ćemo lekciji dodatno razumjeti životni ciklus SwiftUI prikaza: kako se prikazi stvaraju i prikazuju, kako se varijable unutar prikaza stvaraju i ponovno stvaraju, te ćemo učiti `onAppear`、`onDisappear` i konstruktor `init`.

Na temelju tog znanja izgradit ćemo cjelovitu sliku procesa izgradnje SwiftUI prikaza.

## Redoslijed pokretanja aplikacije

Kada stvaramo iOS projekt, Xcode prema zadanim postavkama generira dvije datoteke:

```
ContentView.swift
NazivProjekta + App.swift
```

Od njih je “NazivProjekta + App.swift” ulazna datoteka cijele aplikacije.

Na primjer:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Tijek izvršavanja koda

Kada pokrenemo aplikaciju (u simulatoru ili na stvarnom uređaju), sustav će potražiti ključnu riječ `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Nakon potvrde ulazne datoteke, kod se počinje izvršavati.

Najprije se ulazi u `App` strukturu, izvršava se kod unutar `body`, zatim se stvara `WindowGroup` i unutar nje učitava `ContentView`.

### Uloga `WindowGroup`

`WindowGroup` se koristi za upravljanje prozorima:

```swift
WindowGroup {
    ContentView()
}
```

Na iPad / macOS sustavima podržano je više prozora, dok iPhone obično ima samo jedan prozor.

Zato `WindowGroup` na iPhoneu uglavnom upravlja prvim prikazanim sučeljem.

### Proces učitavanja prikaza

Kada sustav pronađe `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI će izvršiti kod unutar `body`, a zatim prema vraćenoj strukturi prikaza (kao što su `VStack`、`Text`) izgraditi sučelje i prikazati ga na zaslonu.

Nakon što su ti koraci dovršeni, u prikazu ćemo moći vidjeti `ContentView`.

![ContentView](../../Resource/016_view1.png)

Važno je napomenuti da je uloga `body` generirati prikaz, a ne pohraniti ga.

To znači da će SwiftUI svaki put kada se prikaz osvježi ponovno izračunati `body` i generirati novu strukturu prikaza.

### Logika pregleda prikaza

Xcode pregled (`Canvas`) i stvarno pokretanje dvije su različite mehanike.

Na primjer, u ulaznu datoteku možemo dodati jedan ispis za debug:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Kada u Xcodeu pregledavamo prikaz `ContentView`, izvršavanje neće krenuti od ulaza `@main`, pa se `onAppear` u ulaznoj datoteci neće pokrenuti.

Međutim, ako aplikaciju pokrenemo u simulatoru ili na fizičkom uređaju, sustav će krenuti od `@main` i izvršiti cijelu aplikaciju prema punom tijeku, pokrenut će `onAppear` u ulazu i ispisati debug informaciju.

Ključna je razlika u tome što je Xcode pregled samo “lokalno renderiranje” i služi samo za prikaz trenutačnog prikaza; simulator i fizički uređaj pružaju “potpuno okruženje izvođenja” koje izvršava cijelu aplikaciju.

Zato pri testiranju funkcionalnosti aplikacije treba kao mjerodavan uzeti simulator ili fizički uređaj; Xcode pregled ne može pružiti potpuno okruženje izvođenja.

## Životni ciklus prikaza

U trenutačnoj fazi sav naš kod koncentriran je u `ContentView`. Ali u stvarnim aplikacijama jedna aplikacija obično sadrži više prikaza koji se prebacuju u različitim scenarijima.

Na primjer, u “kasici-prasici”:

![PiggyBank](../../Resource/016_view.png)

Kada kliknemo “Spremi novac”, prikazuje se `SaveView`; kada je spremanje dovršeno ili se prikaz zatvori, `SaveView` se uklanja.

To je upravo životni ciklus jednog prikaza: stvaranje prikaza, prikazivanje prikaza i na kraju uklanjanje prikaza.

### Zatvaranje aplikacije

Kada se aplikacija zatvori, svi prikazi se uklanjaju, a pripadajuće stanje također nestaje.

Stoga se `ContentView` i drugi prikazi uklanjaju iz memorije, a cijelo stanje izvođenja aplikacije se briše.

## Životni ciklus varijabli unutar prikaza

U SwiftUI-ju je životni ciklus varijabli obično vezan uz prikaz.

Na primjer:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### `@State` varijable

Varijable deklarirane pomoću `@State` vezane su uz životni ciklus prikaza.

```swift
@State private var name = "FangJunyu"
```

Kada se prikaz stvori, stvara se i `name`; kada se prikaz ukloni, i `name` se uništava.

Zato je potrebno koristiti načine poput `UserDefaults` kako bismo ostvarili trajnu pohranu podataka.

### Varijable unutar `body`

Varijabla definirana unutar `body`:

```swift
var num = 10
```

Njezin je životni ciklus vezan uz proces izvršavanja `body`.

Kada se stanje SwiftUI-ja promijeni, na primjer:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Kada se `name` promijeni, `@State` detektira promjenu podataka i obavještava SwiftUI da ponovno izračuna prikaz, pa se `body` ponovno izračunava.

Kada se `body` ponovno izračuna, sav kod unutar `body` ponovno se izvršava, a varijable unutar `body` (kao što je `num`) ponovno se stvaraju.

To je ujedno i razlog zašto se ne preporučuje definirati složene varijable unutar `body`.

Budući da će se pri svakom osvježavanju prikaza varijable unutar `body` ponovno stvarati, to povećava trošak izračuna i može utjecati na performanse.

U SwiftUI-ju različite vrste podataka trebale bi se upravljati na različite načine: podaci koji trebaju pratiti životni ciklus prikaza mogu se spremati pomoću `@State`, dok se privremeni izračunati podaci mogu smjestiti unutar `body`.

## `onAppear` i `onDisappear`

U prethodnoj lekciji već smo učili `onAppear`: kada se prikaz prikaže, pozvat će se `onAppear`.

```swift
.onAppear {}
```

Na primjer:

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
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

U Xcode pregledu ili prilikom pokretanja možemo vidjeti debug ispis iz `onAppear`.

### `onDisappear`

Odgovarajući partner za `onAppear` je `onDisappear`:

```swift
.onDisappear {}
```

Kada se prikaz zatvori, pozvat će se `onDisappear`.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Kada se prikaz ukloni, pozvat će se kod unutar `onDisappear`.

Savjet: `ContentView` koji trenutačno koristimo korijenski je prikaz aplikacije i ne može se izravno zatvoriti ili ukloniti. Zato u ovoj fazi ne možemo izravno promatrati učinak izvođenja `onDisappear`.

Tek kada budemo učili prijelaz između stranica i otvaranje novih prikaza, moći ćemo vidjeti kada se `onDisappear` poziva.

## Logika stvaranja i prikaza

Važno je primijetiti da su stvaranje prikaza i njegovo prikazivanje dvije različite faze.

Kada se prikaz stvori, poziva se konstruktor strukture:

```swift
init() {}
```

Budući da je SwiftUI prikaz struktura (`struct`):

```swift
struct ContentView: View { ... }
```

Dakle, kada se stvara instanca prikaza, izvršit će se konstruktor `init`. Tek kada se prikaz zaista prikaže, poziva se metoda `onAppear`.

Na primjer:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Kada pregledamo prikaz u Xcodeu, možemo vidjeti sljedeći debug izlaz:

```swift
Create ContentView
Show ContentView
```

To pokazuje da se najprije izvršava `init` i stvara prikaz, zatim se izračunava kod unutar `body`, a na kraju se prikaz prikazuje i izvršava se `onAppear`.

Zato je važno razumjeti da su faze stvaranja i prikazivanja prikaza odvojene.

### Konstruktor `init`

`init` je osnovna Swift sintaksa. I `struct` i `class` mogu ga definirati, a koristi se za inicijalizaciju objekata.

```swift
init() {}
```

U SwiftUI-ju, kada se prikaz stvori, sustav će pozvati njegovu metodu `init`, koja se može koristiti za primanje parametara i inicijalizaciju podataka.

Ako ručno ne napišemo `init`, Swift će za strukturu automatski generirati zadani konstruktor.

Za SwiftUI prikaze poput `ContentView`, pri stvaranju prikaza izvršava se `init`, a pri prikazivanju prikaza izvršava se `onAppear`.

Prema tome, `init` je konstruktor koji se izvršava kada se prikaz stvara i kasnije će se koristiti pri prosljeđivanju parametara ili inicijalizaciji podataka.

## Sažetak

U ovoj smo lekciji učili redoslijed pokretanja aplikacije, od ulazne datoteke do procesa izvršavanja datoteke `ContentView`.

Upoznali smo životni ciklus SwiftUI prikaza: kada se prikaz stvara, izvršava se `init`; kada se prikaže na zaslonu, izvršava se `onAppear`; kada se prikaz ukloni ili zatvori, izvršava se `onDisappear`.

Naučili smo i mehanizam ažuriranja prikaza: prikaz je vođen stanjem. Kada se stanje poput `@State` promijeni, SwiftUI osvježava prikaz, ponovno izračunava `body`, a varijable unutar `body` također se ponovno stvaraju.

Životni ciklus varijabli može biti vezan uz životni ciklus prikaza, dok se privremene varijable unutar `body` pri svakom osvježavanju ponovno stvaraju.

Razumijevanje tih životnih ciklusa i ponašanja varijabli pomaže nam da bolje organiziramo kod i da logika aplikacije bude jasnija.
