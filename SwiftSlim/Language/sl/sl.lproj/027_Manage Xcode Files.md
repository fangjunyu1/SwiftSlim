# Upravljanje datotek Xcode

V tej lekciji se bomo naučili pogostih operacij z datotekami v Xcode.

V prejšnjih lekcijah smo večino kode pisali v `ContentView`. Tako lažje opazujemo kodo in rezultat prikaza.

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Vendar v pravi aplikaciji običajno vse kode ne damo v eno samo datoteko.

Ko je strani, komponent in funkcij vedno več, moramo različne poglede razdeliti v različne datoteke SwiftUI.

Na primer:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Tako je struktura kode jasnejša, poznejše vzdrževanje in spreminjanje pa sta lažja.

## Zakaj upravljati datoteke

V SwiftUI lahko stran ali komponento običajno napišemo kot samostojno datoteko pogleda.

Na primer:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Tukaj je `CardView` pogled SwiftUI.

Če so vsi pogledi zapisani v `ContentView`, bo koda postajala vedno daljša in vse težja za branje.

Zato se moramo naučiti ustvarjati, preimenovati in brisati datoteke ter uporabljati mape za upravljanje različnih datotek s kodo.

## Ustvarjanje datoteke SwiftUI

V Xcode sta za ustvarjanje datoteke SwiftUI običajno na voljo dva pogosta načina:

Prvi način je, da ustvarimo prazno datoteko in nato sami napišemo kodo.

Drugi način je, da ustvarimo datoteko predloge SwiftUI, pri čemer Xcode samodejno ustvari osnovno kodo.

Za začetnike je bolj priporočljiva uporaba datoteke predloge SwiftUI, ker samodejno ustvari osnovno strukturo.

### Ustvarjanje prazne datoteke

V območju Navigator na levi strani Xcode z desno tipko kliknite prazen prostor ali mapo, nato izberite `New Empty File`.

Mesto operacije je prikazano spodaj:

![xcode](../../../Resource/027_view1.png)

Po ustvarjanju prazne datoteke Xcode običajno ustvari neimenovano datoteko Swift, na primer `Untitled.swift`.

Preimenujemo jo lahko v `TestView.swift`.

V projektu SwiftUI je, če se ta datoteka uporablja za prikaz pogleda, običajno priporočljivo na konec imena dodati `View`.

Na primer:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

To ni obvezno pravilo, vendar nam pomaga, da že na prvi pogled prepoznamo, da gre za datoteko pogleda.

Po ustvarjanju prazne datoteke lahko datoteka vsebuje samo privzete komentarje ali pa je prazna. To je odvisno od različice Xcode in načina ustvarjanja.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Na tej točki moramo ročno napisati kodo SwiftUI:

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

Tako je ustvarjena preprosta datoteka pogleda SwiftUI.

### Preimenovanje datoteke

Če želite po ustvarjanju datoteke spremeniti njeno ime, lahko datoteko izberete v območju Navigator na levi strani Xcode in nato pritisnete tipko Return `⏎`.

![xcode](../../../Resource/027_view2.png)

Tako lahko spremenite ime datoteke.

Pomembno je vedeti, da sprememba imena datoteke ne spremeni samodejno imena pogleda v kodi.

Na primer, ko je ime datoteke spremenjeno v `ProfileView.swift`, lahko koda še vedno vsebuje `struct TestView: View`.

Čeprav to ne povzroči nujno napake, lahko zlahka povzroči zmedo.

Zato je priporočljivo, da sta ime datoteke in ime pogleda skladna. Če je na primer ime datoteke `ProfileView.swift`, naj se kot ime pogleda uporabi tudi `ProfileView`.

## Ustvarjanje datoteke predloge SwiftUI

Poleg ustvarjanja prazne datoteke lahko neposredno ustvarimo tudi datoteko predloge SwiftUI.

V območju Navigator na levi strani Xcode z desno tipko kliknite prazen prostor ali mapo, nato izberite `New File from Template...`.

Mesto operacije je prikazano spodaj:

![xcode](../../../Resource/027_view3.png)

V pojavnem oknu lahko na vrhu izberete različne platforme, na primer `iOS`, `macOS` in druge.

Tukaj ohranite platformo, ki ustreza trenutnemu projektu. Če na primer ustvarjamo aplikacijo iOS, izberemo `iOS`.

![xcode](../../../Resource/027_view4.png)

Nato spodaj izberite `SwiftUI View`.

![xcode](../../../Resource/027_view12.png)

Nato kliknite `Next`, vnesite ime datoteke in jo shranite.

Na primer, ustvarimo datoteko `Test2View.swift`.

Xcode bo samodejno ustvaril kodo, podobno spodnji:

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

V primerjavi s prazno datoteko datoteka predloge samodejno vključuje `import SwiftUI`, `struct`, `body` in `#Preview`.

Zato je za začetnike uporaba datoteke predloge SwiftUI preprostejša in zmanjša možnost, da bi izpustili potrebno kodo.

**Namig**: Poleg ustvarjanja datoteke z desnim klikom lahko kliknete tudi gumb plus na dnu območja Navigator na levi strani Xcode ter ustvarite datoteko ali mapo.

![xcode](../../../Resource/027_view5.png)

## Ustvarjanje mape

Ko je datotek vedno več, jih lahko upravljamo z mapami.

V območju Navigator na levi strani Xcode z desno tipko kliknite prazen prostor ali mapo, nato izberite `New Folder`.

Po ustvarjanju mape lahko povezane datoteke povlečete v mapo.

![xcode](../../../Resource/027_view7.png)

Mape se uporabljajo predvsem za urejanje strukture projekta. Ne spremenijo načina uporabe samega pogleda.

Dokler je ime pogleda pravilno, ga lahko v drugih datotekah še vedno uporabljamo v oblikah, kot sta `TestView()` in `Test2View()`.

## Brisanje datoteke ali mape

Če želite izbrisati datoteko ali mapo, lahko v območju Navigator na levi strani Xcode izberete ustrezno datoteko, nato z desno tipko kliknete in izberete `Delete`.

Datoteko lahko tudi izberete in pritisnete tipko Delete `⌫`.

Xcode bo prikazal potrditveno okno za brisanje.

![xcode](../../../Resource/027_view10.png)

Izberite `Move to Trash`, kar pomeni, da datoteko premaknete v Koš.

Če vidite `Remove Reference`, to pomeni, da je iz projekta Xcode odstranjen samo sklic, izvirna datoteka na disku pa ni izbrisana.

Za začetnike je, če brišete samo običajno datoteko, ki ste jo pravkar ustvarili, običajno dovolj izbrati `Move to Trash`.

## Prikaz več pogledov SwiftUI

Ko se naučimo ustvarjati datoteke, lahko različne poglede razdelimo v različne datoteke.

Na primer, ustvarimo dve datoteki SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` se uporablja za prikaz imena avtorja:

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

`CardView` se uporablja za prikaz ozadja kartice:

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

Nato lahko ta dva pogleda uporabimo znotraj `ContentView`:

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

Po zagonu lahko vidite, da sta `CardView` in `AuthorView` združena in prikazana skupaj:

![xcode](../../../Resource/027_view11.png)

V tem rezultatu `CardView` deluje kot ozadje, `AuthorView` pa je prikazan nad njim. To je zato, ker sta postavljena v `ZStack`.

V `ContentView` ta dva pogleda uporabljamo prek `CardView()` in `AuthorView()`. `()` za imenom pomeni ustvarjanje in uporabo tega pogleda.

To je pogosto gnezdenje pogledov v SwiftUI: znotraj enega pogleda lahko še naprej uporabljamo druge poglede.

## Vstopna datoteka

Na koncu še enkrat poglejmo, kje aplikacija začne prikazovati vmesnik.

V projektu SwiftUI običajno obstaja vstopna datoteka:

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

Tukaj `@main` pomeni, da je to vstopna točka aplikacije.

Znotraj `WindowGroup` vidimo:

```swift
ContentView()
```

To pomeni, da po zagonu aplikacije najprej prikaže `ContentView`.

Nato znotraj `ContentView` prikaže tudi:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Zato lahko hierarhijo pogledov razumemo tako:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Če pogled, prikazan v vstopni datoteki, spremenimo v `CardView`:

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

Potem bo aplikacija po zagonu prikazala samo `CardView`.

Z drugimi besedami, `WindowGroup` v vstopni kodi določa, kateri pogled se prikaže najprej po zagonu aplikacije.

Znotraj tega pogleda pa lahko še naprej prikazujemo druge poglede.

## Povzetek

V tej lekciji smo se naučili pogostih operacij upravljanja datotek v Xcode.

Naučili smo se, kako ustvariti datoteke SwiftUI, kako preimenovati datoteke, kako ustvariti mape in kako izbrisati datoteke.

Hkrati smo se naučili tudi pomembnega koncepta: poglede SwiftUI lahko razdelimo v različne datoteke in jih nato uporabimo znotraj drugih pogledov.

Na primer:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Tukaj sta `CardView()` in `AuthorView()` druga pogleda, uporabljena znotraj `ContentView`.

Na koncu smo pregledali tudi logiko prikaza vstopne datoteke.

Ko se aplikacija zažene, najprej vstopi v vstopno kodo, označeno z `@main`, nato pa prikaže pogled znotraj `WindowGroup`.

To nam pomaga razumeti, da različne datoteke SwiftUI niso izolirane druga od druge. Med seboj se lahko kombinirajo in na koncu oblikujejo celoten vmesnik aplikacije.
