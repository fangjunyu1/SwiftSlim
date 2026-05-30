# Prilagojen pogled

V tej lekciji se bomo naučili zelo pomembnega načina pisanja v SwiftUI: **prilagojen View**.

Prilagojen View lahko zapakira del ponavljajoče se kode za pogled in ga spremeni v View, ki ga lahko večkrat uporabimo.

Pri dejanskem razvoju App se pogosto srečamo s takšno situacijo: struktura številnih zaslonov je enaka, razlikuje se samo prikazana vsebina.

Na primer, na seznamu objav na forumu ima lahko vsaka objava naslov, sliko, število všečkov in druge informacije.

![Reddit](../../../Resource/028_view1.png)

Na seznamu izdelkov na nakupovalnem spletnem mestu ima lahko vsak izdelek sliko, ime, ceno in druge informacije.

![Amazon](../../../Resource/028_view2.png)

Struktura teh vsebin je podobna; razlika je samo v podatkih, ki se prikažejo.

Če bi kodo za vsak element napisali ročno, bi koda postala zelo dolga, poznejše spreminjanje pa bi bilo nepriročno.

Zato lahko enako strukturo zapakiramo v prilagojen View, različno vsebino pa vanj posredujemo kot parametre.

Tako lahko isti View prikaže različno vsebino.

## Scenarij potrebe

Na primer, zdaj želimo ustvariti seznam nastavitev.

Rezultat prikaza:

![view](../../../Resource/028_view.png)

Na tem seznamu nastavitev so trije različni elementi nastavitev: `Nastavitve`, `Mapa` in `Glasba`.

Čeprav so njihove ikone, barve in naslovi različni, je celotna struktura enaka:

- Ikona na levi
- Barva ozadja ikone
- Naslov na sredini
- Puščica na desni

Če ne uporabimo prilagojenega View, bi lahko napisali tako:

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

                Text("Nastavitve")
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

                Text("Glasba")
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

Ta koda se lahko pravilno prikaže, vendar je tudi težava zelo očitna: koda treh elementov nastavitev je skoraj popolnoma enaka.

Razlikujejo se samo ikona, barva in naslov:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Nastavitve")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mapa")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Glasba")
```

Z drugimi besedami, struktura vsakega elementa nastavitev je fiksna, razlikujejo se samo ikona, barva in naslov.

Takšna situacija je zelo primerna za uporabo prilagojenega View.

### Senca shadow

Tukaj uporabimo nov modifikator `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` lahko View doda senco.

`radius` pomeni polmer zameglitve sence. Večja kot je vrednost, običajno širše je območje razpršitve sence in mehkejši je njen videz.

Tukaj je vrednost nastavljena na `1`, kar pomeni, da dodamo samo zelo rahel učinek sence.

## Zapakiranje pogleda elementa nastavitev

Nato vsak element nastavitev zapakiramo v nov View.

Ustvarimo lahko `SettingItemView`:

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

V tem View določimo tri lastnosti:

```swift
let icon: String
let color: Color
let title: String
```

Med njimi:

- `icon` pomeni ime ikone
- `color` pomeni barvo ozadja ikone
- `title` pomeni naslov elementa nastavitev

Ker so te tri vsebine v različnih elementih nastavitev različne, jih naredimo kot parametre, ki jih je mogoče posredovati od zunaj.

## Uporaba prilagojenega View

Ko imamo `SettingItemView`, nam ni več treba ponavljati velikega dela kode `HStack`.

Zdaj ga lahko uporabimo tako:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")
```

Ta vrstica kode pomeni, da ustvarimo View elementa nastavitev in posredujemo tri parametre:

```swift
icon: "gear"
color: Color.blue
title: "Nastavitve"
```

Po posredovanju lastnosti znotraj `SettingItemView` dobijo ustrezne vrednosti:

- vrednost `icon` je `gear`
- vrednost `color` je `Color.blue`
- vrednost `title` je `"Nastavitve"`

Zato bo `Image(systemName: icon)` znotraj View prikazal ikono zobnika, `.background(color)` bo uporabil modro ozadje, `Text(title)` pa bo prikazal `Nastavitve`.

Celotna koda:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mapa")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Glasba")
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

Vidimo lahko, da je po zapakiranju rezultat prikaza enak kot prej, vendar je koda postala jasnejša.

Prej je moral vsak element nastavitev napisati celoten del `HStack`, zdaj pa je potrebna samo ena vrstica kode:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")
```

To je vloga prilagojenega View: **zapakirati ponavljajočo se strukturo View in kot parametre posredovati samo različno vsebino.**

## Zakaj lahko posredujemo parametre

Nato na kratko razumimo, zakaj lahko prilagojen View sprejema parametre.

V SwiftUI je View v bistvu struktura.

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        Text("Pozdravljen, svet!")
    }
}
```

Tukaj je `ContentView` struktura.

Ko napišemo:

```swift
ContentView()
```

pravzaprav ustvarjamo View `ContentView`.

Zadnji `()` pomeni klic njegove inicializacijske metode; to lahko razumemo tudi kot ustvarjanje tega View.

Ker ta `ContentView` nima lastnosti, ki bi jih bilo treba posredovati od zunaj, lahko neposredno napišemo:

```swift
ContentView()
```

Če pa ima View lastnost brez dodeljene vrednosti, moramo pri ustvarjanju View posredovati ustrezno vrednost.

Na primer:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ime: \(name)")
    }
}
```

Tukaj je `name` lastnost in nima privzete vrednosti.

Zato moramo pri ustvarjanju `ContentView` za `name` navesti konkretno vrednost:

```swift
ContentView(name: "Fang Junyu")
```

Tako lahko View to vrednost uporabi znotraj:

```swift
Text("ime: \(name)")
```

To je tudi razlog, zakaj moramo pri ustvarjanju `SettingItemView` posredovati parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")
```

Ker ima `SettingItemView` tri lastnosti brez privzetih vrednosti:

```swift
let icon: String
let color: Color
let title: String
```

Zato jih moramo pri ustvarjanju tega View posredovati. Posredovane parametre Swift uporabi za dodelitev vrednosti lastnostim znotraj View.

## Inicializacijska metoda

Nato še nekoliko bolje razumimo inicializacijsko metodo.

### Privzeta inicializacijska metoda

Ko določimo običajen View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Pozdravljen, svet!")
    }
}
```

V tej kodi nismo ročno napisali inicializacijske metode.

Ko pa uporabimo ta View, lahko napišemo tako:

```swift
ContentView()
```

Tukaj `()` pravzaprav pomeni ustvarjanje `ContentView`; to lahko razumemo tudi kot klic njegove inicializacijske metode.

### Zakaj jo lahko pokličemo, čeprav inicializacijske metode ni videti?

Ker nam prevajalnik Swift samodejno ustvari inicializacijsko metodo.

Pomembno je opaziti: **ta inicializacijska metoda je ustvarjena samodejno in je običajno v kodi ne vidimo neposredno.**

To pomeni, da čeprav v `struct` nismo ročno napisali:

```swift
init() {

}
```

bo prevajalnik Swift v ozadju za nas ustvaril približno takšno inicializacijsko metodo:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Pozdravljen, svet!")
    }
}
```

Zato lahko neposredno napišemo:

```swift
ContentView()
```

Zato nam v dejanski kodi običajno ni treba ročno zapisati inicializacijske metode.

Razumeti moramo samo eno stvar: **pri ustvarjanju SwiftUI View se pokliče inicializacijska metoda tega View. Tudi če inicializacijske metode ne napišemo ročno, jo lahko Swift samodejno ustvari.**

### Inicializacijska metoda s parametri

Če ima View lastnost brez privzete vrednosti, na primer:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("ime: \(name)")
    }
}
```

bo prevajalnik Swift glede na lastnost samodejno ustvaril inicializacijsko metodo s parametrom.

Preprosto si jo lahko predstavljamo tako:

```swift
init(name: String) {
    self.name = name
}
```

Tukaj:

```swift
init(name: String)
```

pomeni, da moramo pri ustvarjanju `ContentView` posredovati parameter `name` tipa `String`.

Ko napišemo:

```swift
ContentView(name: "Fang Junyu")
```

to pomeni: `"Fang Junyu"` posredujemo kot parameter inicializacijski metodi.

Nato se znotraj inicializacijske metode izvede:

```swift
self.name = name
```

Ta vrstica kode pomeni: `name`, posredovan od zunaj, dodelimo lastni lastnosti `name` trenutnega View.

Preprosto si lahko predstavljamo tako:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("ime: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Tako lahko View znotraj uporablja posredovano vrednost.

To je inicializacijski potek View s parametri: **ko lastnost v View nima privzete vrednosti, je treba pri ustvarjanju View posredovati ustrezen parameter, da inicializacijska metoda dokonča dodelitev vrednosti lastnosti.**

## Primer, ko ima lastnost privzeto vrednost

Če ima lastnost že privzeto vrednost, nam pri ustvarjanju View ni treba posredovati parametra.

Na primer:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("ime: \(name)")
    }
}
```

Tukaj ima `name` že privzeto vrednost:

```swift
"Fang Junyu"
```

Zato lahko pri ustvarjanju `ContentView` neposredno napišemo:

```swift
ContentView()
```

Takrat `name` uporabi privzeto vrednost, vmesnik pa prikaže:

```swift
ime: Fang Junyu
```

Seveda lahko pri ustvarjanju View posredujemo tudi novo vrednost:

```swift
ContentView(name: "Sam")
```

Takrat View uporabi `"Sam"`, posredovan od zunaj, namesto privzete vrednosti, vmesnik pa prikaže:

```swift
ime: Sam
```

Za lažje razumevanje si lahko inicializacijsko metodo, ki jo samodejno ustvari prevajalnik Swift, preprosto predstavljamo tako:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Tukaj `name: String = "Fang Junyu"` pomeni: če pri ustvarjanju View ne posredujemo `name`, se uporabi privzeta vrednost `"Fang Junyu"`; če pri ustvarjanju View posredujemo nov `name`, se uporabi posredovana vrednost.

Z drugimi besedami: **če od zunaj ni posredovanega parametra, se uporabi privzeta vrednost lastnosti; če je od zunaj posredovan parameter, se uporabi posredovana vrednost.**

## Nazaj k SettingItemView

Zdaj se vrnimo k SettingItemView:

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

Struktura tega View je fiksna.

Fiksni deli vključujejo:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Različni deli vključujejo:

```swift
icon
color
title
```

Zato različno vsebino naredimo kot lastnosti in jo pri ustvarjanju View posredujemo kot parametre.

Ko ustvarimo različne elemente nastavitev, moramo samo posredovati različne parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")
SettingItemView(icon: "folder", color: Color.brown, title: "Mapa")
SettingItemView(icon: "music.note", color: Color.purple, title: "Glasba")
```

Tako lahko isti `SettingItemView` prikaže tri različne elemente nastavitev.

To je najpogostejši način uporabe prilagojenega View.

## Povzetek

V tej lekciji smo se naučili prilagojenega View.

Osrednja vloga prilagojenega View je: **zapakirati ponavljajočo se kodo pogleda, da jo je mogoče ponovno uporabiti.**

V tem primeru je struktura treh elementov nastavitev enaka, razlikujejo se samo ikona, barva in naslov.

Zato smo ustvarili `SettingItemView`:

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

Nato pri uporabi tega View posredujemo različne parametre:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nastavitve")
```

Ti parametri vstopijo v `SettingItemView`.

Na ta način lahko z manj kode ustvarimo View z enako strukturo, vendar z različno vsebino.

To je tudi zelo pogost način pisanja pri razvoju SwiftUI.
