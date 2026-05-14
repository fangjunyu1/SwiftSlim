# Prilagođeni View

U ovoj lekciji naučit ćemo vrlo važan način pisanja u SwiftUI-ju: **prilagođeni View**.

Prilagođeni View može enkapsulirati dio ponavljajućeg koda prikaza i pretvoriti ga u View koji se može koristiti iznova i iznova.

U stvarnom razvoju App često se susrećemo s ovakvom situacijom: struktura mnogih sučelja je ista, ali je prikazani sadržaj različit.

Na primjer, na popisu objava na forumu svaka objava može imati naslov, sliku, broj sviđanja i druge informacije.

![Reddit](../../../Resource/028_view1.png)

Na popisu proizvoda na web-stranici za kupnju svaki proizvod može imati sliku, naziv, cijenu i druge informacije.

![Amazon](../../../Resource/028_view2.png)

Struktura ovih sadržaja je slična; razlika je samo u podacima koji se prikazuju.

Ako ručno napišemo kod za svaku stavku, kod će postati vrlo dugačak, a kasnije ga neće biti praktično mijenjati.

Zato možemo istu strukturu enkapsulirati u prilagođeni View, a različiti sadržaj proslijediti kao parametre.

Na taj način isti View može prikazivati različit sadržaj.

## Scenarij potrebe

Na primjer, sada želimo napraviti popis postavki.

Rezultat prikaza:

![view](../../../Resource/028_view.png)

U ovom popisu postavki postoje tri različite stavke postavki: `Postavke`, `Mapa`, `Glazba`.

Iako su njihove ikone, boje i naslovi različiti, ukupna struktura je ista:

- Ikona s lijeve strane
- Boja pozadine ikone
- Naslov u sredini
- Strelica s desne strane

Ako ne koristimo prilagođeni View, mogli bismo napisati ovako:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Postavke")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Mapa")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Glazba")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Ovaj se kod može normalno prikazati, ali je problem također vrlo očit: kod za tri stavke postavki gotovo je potpuno isti.

Razlikuju se samo ikona, boja i naslov:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Postavke")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mapa")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Glazba")
```

Drugim riječima, struktura svake stavke postavki je fiksna, a razlikuju se samo ikona, boja i naslov.

Ova je situacija vrlo prikladna za korištenje prilagođenog View.

### Sjena shadow

Ovdje koristimo novi modifier `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` može dodati sjenu View-u.

`radius` označava radijus zamućenja sjene. Što je vrijednost veća, obično je veće područje raspršivanja sjene i ona izgleda mekše.

Ovdje je postavljeno na `1`, što znači da se dodaje samo vrlo lagani efekt sjene.

## Enkapsuliranje View-a stavke postavki

Zatim svaku stavku postavki enkapsuliramo u novi View.

Možemo stvoriti `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

U ovom View-u definiramo tri svojstva:

```swift
let icon: String
let color: Color
let title: String
```

Među njima:

- `icon` označava naziv ikone
- `color` označava boju pozadine ikone
- `title` označava naslov stavke postavki

Budući da su ova tri sadržaja različita u različitim stavkama postavki, pretvaramo ih u parametre koji se mogu proslijediti izvana.

## Korištenje prilagođenog View

Nakon što imamo `SettingItemView`, više ne moramo ponavljano pisati veliki dio koda `HStack`.

Sada ga možemo koristiti ovako:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")
```

Ovaj redak koda znači da se stvara View stavke postavki i prosljeđuju tri parametra:

```swift
icon: "gear"
color: Color.blue
title: "Postavke"
```

Nakon prosljeđivanja, svojstva unutar `SettingItemView` dobit će odgovarajuće vrijednosti:

- vrijednost `icon` je `gear`
- vrijednost `color` je `Color.blue`
- vrijednost `title` je `"Postavke"`

Stoga će `Image(systemName: icon)` unutar View-a prikazati ikonu zupčanika, `.background(color)` će koristiti plavu pozadinu, a `Text(title)` će prikazati `Postavke`.

Cijeli kod:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mapa")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Glazba")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Rezultat prikaza:

![view](../../../Resource/028_view.png)

Može se vidjeti da je nakon enkapsuliranja rezultat prikaza isti kao prije, ali je kod postao jasniji.

Prije je svaka stavka postavki morala imati cijeli dio `HStack`, a sada je dovoljan samo jedan redak koda:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")
```

To je uloga prilagođenog View: **enkapsulirati ponavljajuću strukturu View-a i proslijediti samo različiti sadržaj kao parametre.**

## Zašto se parametri mogu proslijediti

Zatim jednostavno shvatimo zašto prilagođeni View može primati parametre.

U SwiftUI-ju je View u osnovi struktura.

Na primjer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Pozdrav, svijete!")
    }
}
```

Ovdje je `ContentView` struktura.

Kada napišemo:

```swift
ContentView()
```

zapravo stvaramo `ContentView` View.

Završne `()` označavaju pozivanje njegove metode inicijalizacije; to se također može razumjeti kao stvaranje ovog View-a.

Budući da ovaj `ContentView` nema svojstva koja treba proslijediti izvana, možemo izravno napisati:

```swift
ContentView()
```

Ali ako View ima svojstvo kojem nije dodijeljena vrijednost, pri stvaranju View-a moramo proslijediti odgovarajuću vrijednost.

Na primjer:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ime: \(name)")
    }
}
```

Ovdje je `name` svojstvo i nema zadanu vrijednost.

Zato pri stvaranju `ContentView` moramo dati konkretnu vrijednost za `name`:

```swift
ContentView(name: "Fang Junyu")
```

Tako View može koristiti ovu vrijednost iznutra:

```swift
Text("ime: \(name)")
```

To je također razlog zašto pri stvaranju `SettingItemView` moramo proslijediti parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")
```

Zato što `SettingItemView` ima tri svojstva bez zadanih vrijednosti:

```swift
let icon: String
let color: Color
let title: String
```

Zato ih pri stvaranju ovog View-a treba proslijediti unutra. Proslijeđene parametre Swift koristi za dodjeljivanje vrijednosti svojstvima unutar View-a.

## Metoda inicijalizacije

Zatim malo dublje razumimo metodu inicijalizacije.

### Zadana metoda inicijalizacije

Kada definiramo običan View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Pozdrav, svijete!")
    }
}
```

U ovom kodu nismo ručno napisali metodu inicijalizacije.

Ali kada koristimo ovaj View, možemo napisati ovako:

```swift
ContentView()
```

Ovdje `()` zapravo znači stvaranje `ContentView`; to se također može razumjeti kao pozivanje njegove metode inicijalizacije.

### Zašto se može pozvati iako metoda inicijalizacije nije vidljiva?

Zato što Swift compiler automatski generira metodu inicijalizacije za nas.

Važno je primijetiti: **ova metoda inicijalizacije generira se automatski i obično je ne vidimo izravno u kodu.**

Drugim riječima, iako nismo ručno napisali u `struct`:

```swift
init() {

}
```

Swift compiler će u pozadini za nas generirati otprilike ovakvu metodu inicijalizacije:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Pozdrav, svijete!")
    }
}
```

Zato možemo izravno napisati:

```swift
ContentView()
```

Zbog toga u stvarnom kodu obično ne moramo ručno pisati metodu inicijalizacije.

Dovoljno je razumjeti jednu stvar: **kada stvaramo SwiftUI View, poziva se metoda inicijalizacije tog View-a. Čak i ako metodu inicijalizacije ne napišemo ručno, Swift je može automatski generirati.**

### Metoda inicijalizacije s parametrima

Ako View ima svojstvo bez zadane vrijednosti, na primjer:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ime: \(name)")
    }
}
```

Swift compiler automatski generira metodu inicijalizacije s parametrom na temelju svojstva.

Jednostavno je možemo razumjeti ovako:

```swift
init(name: String) {
    self.name = name
}
```

Ovdje:

```swift
init(name: String)
```

znači da pri stvaranju `ContentView` treba proslijediti parametar `name` tipa `String`.

Kada napišemo:

```swift
ContentView(name: "Fang Junyu")
```

to znači: proslijediti `"Fang Junyu"` kao parametar metodi inicijalizacije.

Zatim će se unutar metode inicijalizacije izvršiti:

```swift
self.name = name
```

Ovaj redak koda znači: dodijeliti `name` proslijeđen izvana vlastitom svojstvu `name` trenutačnog View-a.

Jednostavno to možemo razumjeti ovako:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ime: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Tako View iznutra može koristiti proslijeđenu vrijednost.

To je tijek inicijalizacije View-a s parametrima: **kada svojstvo unutar View-a nema zadanu vrijednost, pri stvaranju View-a treba proslijediti odgovarajući parametar kako bi metoda inicijalizacije dovršila dodjelu vrijednosti svojstvu.**

## Situacija kada svojstvo ima zadanu vrijednost

Ako svojstvo već ima zadanu vrijednost, pri stvaranju View-a ne moramo proslijediti parametar.

Na primjer:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ime: \(name)")
    }
}
```

Ovdje `name` već ima zadanu vrijednost:

```swift
"Fang Junyu"
```

Zato pri stvaranju `ContentView` možemo izravno napisati:

```swift
ContentView()
```

Tada će `name` koristiti zadanu vrijednost, a sučelje će prikazati:

```swift
ime: Fang Junyu
```

Naravno, pri stvaranju View-a možemo proslijediti i novu vrijednost:

```swift
ContentView(name: "Sam")
```

Tada View koristi `"Sam"` proslijeđen izvana, umjesto zadane vrijednosti, a sučelje prikazuje:

```swift
ime: Sam
```

Radi lakšeg razumijevanja, metodu inicijalizacije koju Swift compiler automatski generira možemo pojednostavljeno zamisliti ovako:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Ovdje `name: String = "Fang Junyu"` znači: ako se pri stvaranju View-a ne proslijedi `name`, koristi se zadana vrijednost `"Fang Junyu"`; ako se pri stvaranju View-a proslijedi novi `name`, koristi se proslijeđena vrijednost.

Drugim riječima: **ako se izvana ne proslijedi parametar, koristi se zadana vrijednost svojstva; ako se izvana proslijedi parametar, koristi se proslijeđena vrijednost.**

## Povratak na SettingItemView

Sada se ponovno vratimo na SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Struktura ovog View-a je fiksna.

Fiksni dijelovi uključuju:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Različiti dijelovi uključuju:

```swift
icon
color
title
```

Zato različiti sadržaj pretvaramo u svojstva i prosljeđujemo ih kao parametre pri stvaranju View-a.

Kada stvaramo različite stavke postavki, trebamo samo proslijediti različite parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")
SettingItemView(icon: "folder", color: Color.brown, title: "Mapa")
SettingItemView(icon: "music.note", color: Color.purple, title: "Glazba")
```

Tako isti `SettingItemView` može prikazati tri različite stavke postavki.

Ovo je najčešći način korištenja prilagođenog View-a.

## Sažetak

U ovoj lekciji naučili smo o prilagođenom View-u.

Glavna uloga prilagođenog View-a je: **enkapsulirati ponavljajući View kod kako bi se mogao ponovno koristiti.**

U ovom primjeru struktura tri stavke postavki je ista, a razlikuju se samo ikona, boja i naslov.

Zato smo stvorili `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Zatim pri korištenju ovog View-a prosljeđujemo različite parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Postavke")
```

Parametri ovdje ulaze u `SettingItemView`.

Ovim načinom možemo s manje koda stvoriti View-ove iste strukture, ali različitog sadržaja.

To je također vrlo čest način pisanja u SwiftUI razvoju.
