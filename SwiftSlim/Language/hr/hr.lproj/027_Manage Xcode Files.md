# Upravljanje datotekama u Xcodeu

U ovoj lekciji naučit ćemo česte operacije s datotekama u Xcodeu.

U prethodnim lekcijama većinu koda pisali smo unutar `ContentView`. To olakšava promatranje koda i rezultata prikaza.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Međutim, u stvarnoj aplikaciji obično ne stavljamo sav kod u jednu datoteku.

Kada broj stranica, komponenti i funkcija postane sve veći, različite prikaze trebamo razdvojiti u različite SwiftUI datoteke.

Na primjer:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Tako struktura koda postaje jasnija, a kasnije održavanje i izmjene lakši.

## Zašto upravljati datotekama

U SwiftUI-ju se jedna stranica ili jedna komponenta obično može napisati kao zasebna datoteka prikaza.

Na primjer:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Ovdje je `CardView` jedan SwiftUI prikaz.

Ako su svi prikazi napisani unutar `ContentView`, kod će postajati sve dulji i sve teži za čitanje.

Zato trebamo naučiti stvarati, preimenovati i brisati datoteke te koristiti mape za upravljanje različitim datotekama koda.

## Stvaranje SwiftUI datoteke

U Xcodeu postoje dva česta načina za stvaranje SwiftUI datoteke:

jedan je stvaranje prazne datoteke, a zatim samostalno pisanje koda.

drugi je stvaranje SwiftUI datoteke iz predloška, pri čemu Xcode automatski generira osnovni kod.

Za početnike se više preporučuje korištenje SwiftUI datoteke iz predloška, jer ona automatski generira osnovnu strukturu.

### Stvaranje prazne datoteke

U području Navigator na lijevoj strani Xcodea desnom tipkom kliknite prazno mjesto ili mapu, zatim odaberite `New Empty File`.

Mjesto radnje prikazano je u nastavku:

![xcode](../../../Resource/027_view1.png)

Nakon stvaranja prazne datoteke, Xcode obično generira neimenovanu Swift datoteku, na primjer `Untitled.swift`.

Možemo je preimenovati u `TestView.swift`.

U SwiftUI projektu, ako se ova datoteka koristi za prikaz jednog prikaza, obično se preporučuje dodati `View` na kraj naziva.

Na primjer:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

To nije obavezno pravilo, ali nam omogućuje da na prvi pogled vidimo da je riječ o datoteci prikaza.

Nakon stvaranja prazne datoteke, datoteka može sadržavati samo zadane komentare, a može biti i prazna, ovisno o verziji Xcodea i načinu stvaranja.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

U ovom trenutku trebamo ručno napisati SwiftUI kod:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Tako je stvorena jednostavna SwiftUI datoteka prikaza.

### Preimenovanje datoteke

Ako nakon stvaranja datoteke želite promijeniti njezin naziv, možete odabrati datoteku u području Navigator na lijevoj strani Xcodea, a zatim pritisnuti tipku Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Tako možete promijeniti naziv datoteke.

Treba imati na umu da promjena naziva datoteke neće automatski promijeniti naziv prikaza u kodu.

Na primjer, nakon što naziv datoteke promijenite u `ProfileView.swift`, u kodu i dalje može ostati `struct TestView: View`.

Iako to ne mora nužno uzrokovati pogrešku, lako može zbuniti.

Zato se preporučuje da naziv datoteke i naziv prikaza budu usklađeni. Na primjer, ako je naziv datoteke `ProfileView.swift`, naziv prikaza također treba biti `ProfileView`.

## Stvaranje SwiftUI datoteke iz predloška

Osim stvaranja prazne datoteke, možemo izravno stvoriti i SwiftUI datoteku iz predloška.

U području Navigator na lijevoj strani Xcodea desnom tipkom kliknite prazno mjesto ili mapu, zatim odaberite `New File from Template...`.

Mjesto radnje prikazano je u nastavku:

![xcode](../../../Resource/027_view3.png)

U skočnom prozoru na vrhu možete odabrati različite platforme, na primjer `iOS`, `macOS` i druge.

Ovdje je dovoljno zadržati platformu koja odgovara trenutačnom projektu. Na primjer, ako stvaramo iOS App, odabiremo `iOS`.

![xcode](../../../Resource/027_view4.png)

Zatim u donjem dijelu odaberite `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Zatim kliknite `Next`, unesite naziv datoteke i spremite je.

Na primjer, stvorimo `Test2View.swift`.

Xcode će automatski generirati kod sličan sljedećem:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

U usporedbi s praznom datotekom, datoteka iz predloška automatski sadrži `import SwiftUI`, `struct`, `body` i `#Preview`.

Zato je početnicima korištenje SwiftUI datoteke iz predloška jednostavnije i smanjuje mogućnost da se zaboravi napisati dio koda.

**Savjet**: Osim stvaranja datoteke desnim klikom, možete kliknuti i gumb plus na dnu područja Navigator na lijevoj strani Xcodea kako biste stvorili datoteku ili mapu.

![xcode](../../../Resource/027_view5.png)

## Stvaranje mape

Kada datoteka postane sve više, možemo ih organizirati pomoću mapa.

U području Navigator na lijevoj strani Xcodea desnom tipkom kliknite prazno mjesto ili mapu, zatim odaberite `New Folder`.

Nakon stvaranja mape, povezane datoteke možete povući u mapu.

![xcode](../../../Resource/027_view7.png)

Mape se uglavnom koriste za organiziranje strukture projekta i ne mijenjaju način korištenja samog prikaza.

Sve dok je naziv prikaza ispravan, u drugim se datotekama i dalje može koristiti na način poput `TestView()` i `Test2View()`.

## Brisanje datoteke ili mape

Ako želite izbrisati datoteku ili mapu, možete odabrati odgovarajuću datoteku u području Navigator na lijevoj strani Xcodea, zatim desnom tipkom kliknuti i odabrati `Delete`.

Također možete odabrati datoteku i pritisnuti tipku Delete `⌫`.

Xcode će prikazati prozor za potvrdu brisanja.

![xcode](../../../Resource/027_view10.png)

Odabir `Move to Trash` znači premještanje datoteke u smeće.

Ako vidite `Remove Reference`, to znači da se uklanja samo referenca iz Xcode projekta, ali se izvorna datoteka na disku neće izbrisati.

Za početnike, ako samo brišete običnu datoteku koju ste upravo stvorili, obično je dovoljno odabrati `Move to Trash`.

## Prikaz više SwiftUI prikaza

Nakon što naučimo stvarati datoteke, različite prikaze možemo razdvojiti u različite datoteke.

Na primjer, stvorimo dvije SwiftUI datoteke:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` se koristi za prikaz imena autora:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` se koristi za prikaz pozadine kartice:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Zatim ova dva prikaza možemo koristiti u `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Nakon pokretanja možemo vidjeti da su `CardView` i `AuthorView` kombinirano prikazani zajedno:

![xcode](../../../Resource/027_view11.png)

U ovom rezultatu `CardView` služi kao pozadina, a `AuthorView` se prikazuje iznad, zato što su smješteni u `ZStack`.

U `ContentView` ta dva prikaza koristimo putem `CardView()` i `AuthorView()`, a `()` iza naziva označava stvaranje i korištenje tog prikaza.

To je uobičajeno ugnježđivanje prikaza u SwiftUI-ju: u jednom prikazu možemo nastaviti koristiti druge prikaze.

## Ulazna datoteka

Na kraju, još jednom pregledajmo odakle App počinje prikazivati sučelje.

U SwiftUI projektu obično postoji jedna ulazna datoteka:

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

Ovdje `@main` označava da je ovo ulazno mjesto aplikacije.

U `WindowGroup` vidimo:

```swift
ContentView()
```

To znači da se nakon pokretanja Appa prvo prikazuje `ContentView`.

Zatim se unutar `ContentView` prikazuje i:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Zato se hijerarhija prikaza može razumjeti ovako:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Ako prikaz koji se prikazuje u ulaznoj datoteci promijenimo u `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Tada će se nakon pokretanja Appa prikazati samo `CardView`.

Drugim riječima, `WindowGroup` u ulaznom kodu određuje koji će se prikaz prvi prikazati nakon pokretanja Appa.

A unutar tog prikaza mogu se dalje prikazivati drugi prikazi.

## Sažetak

U ovoj lekciji naučili smo česte operacije upravljanja datotekama u Xcodeu.

Saznali smo kako stvoriti SwiftUI datoteke, kako preimenovati datoteke, kako stvoriti mape i kako izbrisati datoteke.

Istodobno smo naučili i važan koncept: SwiftUI prikazi mogu se razdvojiti u različite datoteke, a zatim koristiti u drugim prikazima.

Na primjer:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Ovdje su `CardView()` i `AuthorView()` korištenje drugih prikaza unutar `ContentView`.

Na kraju smo još jednom pregledali logiku prikaza ulazne datoteke.

Kada se App pokrene, najprije ulazi u ulazni kod označen s `@main`, a zatim prikazuje prikaz unutar `WindowGroup`.

To nam pomaže razumjeti da različite SwiftUI datoteke nisu izolirane, nego se mogu međusobno kombinirati i na kraju oblikovati potpuno App sučelje.
