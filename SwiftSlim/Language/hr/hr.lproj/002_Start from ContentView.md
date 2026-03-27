# Početak od ContentViewa

## Priprema prije lekcije

U ovoj ćemo lekciji krenuti od datoteke `ContentView.swift` i sustavno upoznati osnovnu strukturu SwiftUI-ja, uključujući:

- komentare
- strukturu `View`
- rasporede `VStack` / `HStack` / `ZStack`
- ikone `SF Symbols`
- modifikatore pogleda (`modifier`)
- pregledni kod `#Preview`

Najprije pronađite Xcode projekt koji ste ranije stvorili i dvostrukim klikom otvorite `.xcodeproj` datoteku.

U lijevom Navigator području odaberite datoteku `ContentView.swift`.

Napomena: svaki put kada otvorite projekt, Canvas može prikazati "Preview paused". Kliknite gumb za osvježavanje kako biste vratili pregled.

![Swift](../../RESOURCE/002_view7.png)

## Upoznavanje ContentViewa

Kod za `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

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

#Preview {
    ContentView()
}
```

Iako koda nema mnogo, on već sadrži ključnu strukturu SwiftUI-ja.

### 1. Komentari

Na vrhu datoteke:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

To je komentar datoteke koji služi za bilježenje informacija o datoteci, uključujući naziv datoteke, naziv projekta, autora i vrijeme izrade.

U Swiftu se za jednolinijske komentare koristi `//`:

```swift
// Ovo je komentar
```

Komentari mogu poboljšati čitljivost koda i pomoći programerima da razumiju logiku koda.

U stvarnom razvoju kod ponekad može biti težak za razumjeti. Ako ne pišete komentare, može vam se dogoditi da tri dana kasnije više ne razumijete vlastiti kod.

Zato je dobra razvojna navika aktivno dodavati komentare tijekom pisanja koda. Korištenjem komentara za bilježenje logike koda olakšavate kasnije održavanje.

**Privremeno isključivanje koda**

Komentari se mogu koristiti i za privremeno isključivanje dijelova koda, što pomaže u pronalaženju problema.

Na primjer:

```
A
B
C
```

`A`、`B` i `C` predstavljaju tri dijela koda, od kojih jedan sadrži grešku. Možemo privremeno komentirati kod kako bismo pronašli problem.

Najprije dodamo komentar na `A`:

```
// A
B
C
```

Ako nakon komentiranja `A` kod ponovno radi normalno, to znači da je problem u dijelu `A`.

Ako problem i dalje postoji, možemo zatim komentirati `B`, i tako redom sve dok ne pronađemo problematični dio.

U razvoju ćemo se susresti s mnogo problema, a u većini slučajeva upravo komentiranjem dijelova koda tražimo uzrok, što nam pomaže da lociramo problematični kod i pronađemo bug.

U Xcodeu možete koristiti prečac:

```
Command ⌘ + /
```

za brzo dodavanje ili uklanjanje komentara.

### 2. Uvoz SwiftUI okvira

```swift
import SwiftUI
```

Ovaj redak znači da uvozimo SwiftUI framework.

Tipovi kao što su `View`、`Text`、`Image` i `VStack` u SwiftUI-ju dolaze iz tog okvira.

Ako ne uvezete SwiftUI framework, Xcode će prijaviti grešku:

```
Cannot find type 'View' in scope
```

To znači da prevoditelj ne može prepoznati tip `View`.

### 3. Struktura Viewa

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Kada prvi put vidite ovu `View` strukturu, može vam djelovati nepoznato jer sadrži ključne riječi poput `struct`、`View`、`var`、`body` i `some`.

Mi te ključne riječi još nismo učili, pa zasad trebate samo znati da ovaj kod stvara prikaz nazvan `ContentView`.

`View` možete shvatiti kao platno na kojem crtamo, a alat za crtanje je SwiftUI.

Na primjer:

![Swift](../../RESOURCE/002_view.png)

Na gornjoj slici prikazane su tri stranice, a zapravo su to tri različita `View` prikaza.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Kada razvijamo aplikaciju koristeći SwiftUI, svaka stranica je jedan `View`.

### 4. SwiftUI kod

Unutar `View` prikaza nalazi se SwiftUI kod:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ovaj SwiftUI kod znači da je to okomiti raspored koji prikazuje jednu ikonu i jedan tekst.

![Swift](../../RESOURCE/002_view1.png)

#### `VStack` raspored

```swift
VStack { }  // okomiti raspored
```

`VStack` predstavlja spremnik za okomiti raspored. Prikazi unutar njega raspoređuju se odozgo prema dolje.

![Swift](../../RESOURCE/002_view8.png)

Tri česta rasporeda u SwiftUI-ju:

- `VStack` —— okomiti raspored
- `HStack` —— vodoravni raspored
- `ZStack` —— slojeviti raspored (Z-os)

```swift
HStack { }  // vodoravni raspored
ZStack { }  // slojeviti raspored
```

Shema njihovih rasporeda:

![Swift](../../RESOURCE/002_view2.png)

Na primjer, vodoravni raspored pomoću `HStack`:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Možete vidjeti da su ikona globusa i tekst sada prikazani vodoravno.

![Swift](../../RESOURCE/002_view3.png)

Kad želimo vodoravno rasporediti sadržaj, koristimo `HStack`. Kada nam treba slojeviti raspored, koristimo `ZStack`.

#### `Image` i `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Ovaj kod prikazuje ikonu globusa, a ona dolazi iz Appleova sustava ikona SF Symbols.

![Swift](../../RESOURCE/002_view9.png)

Značenje koda je prikaz ikone globusa, velike veličine, u naglašenoj boji.

Osim globusa, možemo prikazati i druge ikone.

Na primjer, ruksak:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Kako prikazati druge ikone?**

Moramo koristiti službenu Appleovu biblioteku sistemskih ikona SF Symbols.

Otvorite Apple Developer stranicu i preuzmite [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Otvorite aplikaciju SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

S lijeve strane nalaze se kategorije simbola, a s desne pripadajuće ikone.

Desnim klikom na ikonu odaberite "Copy Name", a ime je odgovarajući tekstualni niz.

Na primjer:

```
"globe"
"backpack"
"heart"
```

Stavite kopirano ime ikone u `Image(systemName:)` i tako možete prikazivati različite ikone.

Napomena: svaka SF Symbols ikona ima minimalnu podržanu verziju sustava. Ako je verzija sustava preniska, ikona se možda neće prikazati. Informacije o kompatibilnosti možete provjeriti unutar aplikacije SF Symbols.

#### Modifikatori

U SwiftUI-ju je modifikator (`modifier`) način kojim se mijenja izgled ili ponašanje prikaza.

Modifikator možete zamisliti kao odjeću: s različitom odjećom izgled se mijenja.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` i `foregroundStyle` su modifikatori prikaza `Image`: bez promjene samog sadržaja slike, oni mijenjaju prikaz slike.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Može kontrolirati veličinu SF Symbols ikona:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Možete isprobati različite opcije kako biste vidjeli različite veličine SF Symbols simbola.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` može kontrolirati boju prednjeg plana.

`.tint` označava naglašenu boju trenutnog okruženja; prema zadanim postavkama u iOS-u to je plava.

Ako želimo promijeniti boju prednjeg plana u crvenu:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### `Text` prikaz

`Text` je prikaz za tekst i koristi se za prikaz nizova znakova.

```swift
Text("Hello, world!")
```

Na primjer, prikaz mog imena:

```swift
Text("FangJunyu")
```

Napomena: niz znakova mora biti unutar dvostrukih navodnika `""`.

Možete pokušati prikazati svoje ime, telefonski broj i sličan sadržaj.

#### `padding` razmak

U SwiftUI-ju se `padding` koristi za dodavanje praznog prostora između sadržaja prikaza i njegove granice; to pripada unutarnjem razmaku (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Gornji kod znači da se `HStack` prikazu dodaje zadani sistemski razmak.

**Što je `padding`?**

`padding` označava "prazan prostor između sadržaja prikaza i njegove granice".

Na slici ispod, nakon što se plavom `HStack`-u doda `padding`, plavo područje djeluje kao da se povlači prema unutra i izgleda "malo manje".

![Swift](../../RESOURCE/002_view6.png)

**Zadani razmak**

Modifikator `padding()` prema zadanim postavkama koristi sistemski preporučeni standardni razmak.

```swift
.padding()
```

Na različitim platformama i u različitim kontekstima ta vrijednost može biti drugačija, na primjer:

- na iOS-u je obično oko 16 pt.
- na macOS-u ili watchOS-u standardni sistemski razmak može biti veći ili manji, ovisno o pravilima dizajna platforme.

**Prilagođeni razmak**

Također možete postaviti razmak samo za određene strane prikaza.

1. Postavljanje jednog smjera

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Objašnjenje smjerova:

- `.top`: gornji razmak
- `.bottom`: donji razmak
- `.leading`: prednji bočni razmak
- `.trailing`: stražnji bočni razmak

![Swift](../../RESOURCE/002_view12.png)

Napomena: `leading` i `trailing` automatski se prilagođavaju smjeru jezika. Na primjer, u arapskom (RTL) okruženju automatski će se obrnuti.

2. Postavljanje više smjerova

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Pomoću polja možete istodobno odrediti više smjerova. Konkretna uporaba polja bit će detaljnije objašnjena u kasnijim lekcijama; ovdje je dovoljno samo upoznati ovaj zapis.

3. Postavljanje vodoravnog ili okomitog smjera

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

To je ekvivalentno sljedećem:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Uklanjanje razmaka**

Ako ne želite nikakav razmak, možete koristiti `.padding(0)`:

```swift
.padding(0)
```

Ili jednostavno ukloniti modifikator `padding`:

```swift
// .padding()
```

### 6. `#Preview` pregledni kod

```swift
#Preview {
    ContentView()
}
```

Ovaj kod znači da se u Canvasu generira pregled prikaza `ContentView`.

Napomena: `#Preview` je nova sintaksa uvedena u Swift 5.9 / Xcode 15. Prije toga koristila se struktura `PreviewProvider`.

**Što se događa ako komentiramo `Preview`?**

Ako zakomentiramo `Preview`:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas više neće prikazivati sadržaj koji se može renderirati.

![Swift](../../RESOURCE/002_xcode.png)

To znači da `#Preview` kontrolira prikaz pregleda u Canvasu.

Kada želimo pregledavati SwiftUI prikaz u Xcodeu, dodajemo `#Preview`. Ako pregled nije potreban, `#Preview` se može komentirati ili ukloniti.

## Sažetak

Iako datoteka `ContentView.swift` ne sadrži mnogo koda, ona zapravo obuhvaća više ključnih SwiftUI koncepata. Početniku taj kod može izgledati nepoznato, ali razlaganjem njegove strukture možemo izgraditi početno razumijevanje SwiftUI-ja.

Prisjetimo se sadržaja ove lekcije: najprije smo naučili komentare `//`, koji se mogu koristiti za objašnjenje logike koda ili za privremeno isključivanje koda.

Zatim smo saznali da SwiftUI datoteka mora uvesti SwiftUI framework:

```swift
import SwiftUI
```

Ako se framework ne uveze, prevoditelj neće moći prepoznati tipove poput `View`.

Nakon toga upoznali smo osnovnu strukturu SwiftUI prikaza:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

U toj strukturi `ContentView` je naziv prikaza.

Također smo naučili tri česta spremnika rasporeda: `VStack` (okomiti raspored), `HStack` (vodoravni raspored) i `ZStack` (slojeviti raspored).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ovaj kod znači da prikazujemo spremnik s okomitim rasporedom, a unutar njega ikonu i tekst.

`Image` može prikazivati SF Symbols ikone, a modifikatori kontroliraju veličinu i boju ikone.

`Text` prikaz može prikazivati tekstualni sadržaj.

`padding` je razmak koji oko prikaza dodaje proziran prostor.

Na kraju dolazi `#Preview`, koji može prikazati pregled prikaza u Canvasu.

### Vježba nakon lekcije

Početnicima sadržaj ove lekcije može djelovati prilično složeno. Daljnjom vježbom možemo produbiti razumijevanje naučenih koncepata:

- promijenite naziv SF Symbols ikone
- promijenite boju prednjeg plana ikone u crnu
- zamijenite `VStack` s `HStack`
- komentirajte `Image` ili `Text` i promatrajte promjene u pregledu

### Bonus: dovršavanje koda (`Code Completion`)

Dok unosite kod, možda ste već primijetili da Xcode automatski prikazuje popis dostupnih opcija.

Na primjer, kada mijenjamo modifikator `imageScale`:

```swift
.imageScale(.)
```

Xcode prikazuje dostupne opcije:

![Swift](../../RESOURCE/002_view10.png)

To pripada mehanizmu dovršavanja koda (`Code Completion`). Temelji se na zaključivanju tipova i prijedlozima članova enumeracija te može poboljšati brzinu unosa i smanjiti broj pogrešaka.

U kasnijim ćemo lekcijama službeno predstaviti enumeracije (`enum`), a za sada je dovoljno tek osnovno upoznavanje.
