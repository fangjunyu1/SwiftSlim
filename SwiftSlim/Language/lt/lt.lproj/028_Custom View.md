# Tinkintas rodinys

Šioje pamokoje išmoksime labai svarbų SwiftUI rašymo būdą: **tinkintas View**.

Tinkintas View gali įkapsuliuoti pasikartojantį View kodo fragmentą ir paversti jį View, kurį galima naudoti vėl ir vėl.

Kuriant tikrą App, dažnai susiduriame su tokia situacija: daugelio sąsajų struktūra yra tokia pati, skiriasi tik rodomas turinys.

Pavyzdžiui, forumo svetainės įrašų sąraše kiekvienas įrašas gali turėti pavadinimą, vaizdą, patiktukų skaičių ir kitą informaciją.

![Reddit](../../../Resource/028_view1.png)

Apsipirkimo svetainės produktų sąraše kiekvienas produktas gali turėti vaizdą, pavadinimą, kainą ir kitą informaciją.

![Amazon](../../../Resource/028_view2.png)

Šių turinių struktūra yra panaši; skiriasi tik rodomi duomenys.

Jei kiekvienam elementui kodą rašysime rankiniu būdu, kodas taps labai ilgas, o vėliau jį keisti bus nepatogu.

Todėl galime bendrą struktūrą įkapsuliuoti į tinkintą View, o skirtingą turinį perduoti kaip parametrus.

Taip tas pats View gali rodyti skirtingą turinį.

## Reikalavimo scenarijus

Pavyzdžiui, dabar norime sukurti nustatymų sąrašą.

Rodomas rezultatas:

![view](../../../Resource/028_view.png)

Šiame nustatymų sąraše yra trys skirtingi nustatymų elementai: `Nustatymai`, `Aplankas`, `Muzika`.

Nors jų piktogramos, spalvos ir pavadinimai skiriasi, bendra struktūra yra tokia pati:

- Piktograma kairėje
- Piktogramos fono spalva
- Pavadinimas viduryje
- Rodyklė dešinėje

Jei nenaudotume tinkinto View, galėtume rašyti taip:

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

                Text("Nustatymai")
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

                Text("Aplankas")
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

                Text("Muzika")
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

Šis kodas gali būti rodomas normaliai, tačiau problema taip pat labai akivaizdi: trijų nustatymų elementų kodas beveik visiškai vienodas.

Skiriasi tik piktograma, spalva ir pavadinimas:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Nustatymai")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Aplankas")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Muzika")
```

Kitaip tariant, kiekvieno nustatymų elemento struktūra yra fiksuota, skiriasi tik piktograma, spalva ir pavadinimas.

Tokia situacija labai tinka tinkintam View naudoti.

### Šešėlis shadow

Čia naudojame naują modifier `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` gali pridėti View šešėlį.

`radius` reiškia šešėlio suliejimo spindulį. Kuo didesnė reikšmė, tuo paprastai didesnė šešėlio sklaidos sritis ir tuo švelniau jis atrodo.

Čia nustatyta reikšmė `1`, tai reiškia, kad pridedamas tik labai lengvas šešėlio efektas.

## Nustatymų elemento View įkapsuliavimas

Toliau kiekvieną nustatymų elementą įkapsuliuosime į naują View.

Galime sukurti `SettingItemView`:

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

Šiame View apibrėžiame tris properties:

```swift
let icon: String
let color: Color
let title: String
```

Iš jų:

- `icon` reiškia piktogramos pavadinimą
- `color` reiškia piktogramos fono spalvą
- `title` reiškia nustatymų elemento pavadinimą

Kadangi šie trys dalykai skirtinguose nustatymų elementuose yra skirtingi, padarome juos parametrais, kuriuos galima perduoti iš išorės.

## Tinkinto View naudojimas

Kai turime `SettingItemView`, nebereikia kartoti didelio `HStack` kodo fragmento.

Dabar galime naudoti taip:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")
```

Ši kodo eilutė reiškia, kad sukuriamas nustatymų elemento View ir perduodami trys parametrai:

```swift
icon: "gear"
color: Color.blue
title: "Nustatymai"
```

Perdavus, `SettingItemView` viduje esančios properties gaus atitinkamas reikšmes:

- `icon` reikšmė yra `gear`
- `color` reikšmė yra `Color.blue`
- `title` reikšmė yra `"Nustatymai"`

Todėl View viduje `Image(systemName: icon)` rodys krumpliaračio piktogramą, `.background(color)` naudos mėlyną foną, o `Text(title)` rodys `Nustatymai`.

Pilnas kodas:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Aplankas")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Muzika")
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

Rodomas rezultatas:

![view](../../../Resource/028_view.png)

Galime matyti, kad po įkapsuliavimo rodomas rezultatas yra toks pat kaip anksčiau, tačiau kodas tapo aiškesnis.

Anksčiau kiekvienam nustatymų elementui reikėjo rašyti visą `HStack` fragmentą, o dabar pakanka vienos kodo eilutės:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")
```

Tokia yra tinkinto View paskirtis: **įkapsuliuoti pasikartojančią View struktūrą ir kaip parametrus perduoti tik skirtingą turinį.**

## Kodėl galima perduoti parametrus

Toliau paprastai supraskime, kodėl tinkintas View gali priimti parametrus.

SwiftUI sistemoje View iš esmės yra struktūra.

Pavyzdžiui:

```swift
struct ContentView: View {
    var body: some View {
        Text("Sveikas, pasauli!")
    }
}
```

Čia `ContentView` yra struktūra.

Kai rašome:

```swift
ContentView()
```

iš tikrųjų kuriame `ContentView` View.

Gale esantys `()` reiškia jo inicializavimo metodo iškvietimą; tai taip pat galima suprasti kaip šio View sukūrimą.

Kadangi šis `ContentView` neturi properties, kurias reikia perduoti iš išorės, galime tiesiogiai rašyti:

```swift
ContentView()
```

Tačiau jei View viduje yra property be priskirtos reikšmės, kuriant View reikia perduoti atitinkamą reikšmę.

Pavyzdžiui:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("vardas: \(name)")
    }
}
```

Čia `name` yra property ir ji neturi numatytosios reikšmės.

Todėl kuriant `ContentView`, `name` būtina suteikti konkrečią reikšmę:

```swift
ContentView(name: "Fang Junyu")
```

Taip View viduje galės naudoti šią reikšmę:

```swift
Text("vardas: \(name)")
```

Tai taip pat yra priežastis, kodėl kuriant `SettingItemView` reikia perduoti parametrus:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")
```

Nes `SettingItemView` turi tris properties be numatytųjų reikšmių:

```swift
let icon: String
let color: Color
let title: String
```

Todėl kuriant šį View, jas reikia perduoti į vidų. Perduotus parametrus Swift naudos View viduje esančių properties reikšmėms priskirti.

## Inicializavimo metodas

Toliau šiek tiek giliau supraskime inicializavimo metodą.

### Numatytasis inicializavimo metodas

Kai apibrėžiame paprastą View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Sveikas, pasauli!")
    }
}
```

Šiame kode rankiniu būdu nerašėme inicializavimo metodo.

Tačiau kai naudojame šį View, galime rašyti taip:

```swift
ContentView()
```

Čia `()` iš tikrųjų reiškia `ContentView` sukūrimą; tai taip pat galima suprasti kaip jo inicializavimo metodo iškvietimą.

### Kodėl galima iškviesti, nors inicializavimo metodo nematome?

Nes Swift compiler automatiškai sugeneruoja mums inicializavimo metodą.

Svarbu atkreipti dėmesį: **šis inicializavimo metodas sugeneruojamas automatiškai, ir paprastai jo tiesiogiai kode nematome.**

Tai reiškia, kad nors `struct` viduje rankiniu būdu neparašėme:

```swift
init() {

}
```

Swift compiler užkulisiuose sugeneruos mums maždaug tokį inicializavimo metodą:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Sveikas, pasauli!")
    }
}
```

Štai kodėl galime tiesiogiai rašyti:

```swift
ContentView()
```

Todėl realiame kode paprastai nereikia inicializavimo metodo rašyti rankiniu būdu.

Reikia suprasti tik vieną dalyką: **kuriant SwiftUI View, iškviečiamas to View inicializavimo metodas. Net jei rankiniu būdu inicializavimo metodo neparašėme, Swift gali jį automatiškai sugeneruoti.**

### Inicializavimo metodas su parametrais

Jei View turi property be numatytosios reikšmės, pavyzdžiui:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("vardas: \(name)")
    }
}
```

Swift compiler pagal property automatiškai sugeneruos inicializavimo metodą su parametru.

Tai galima paprastai suprasti taip:

```swift
init(name: String) {
    self.name = name
}
```

Čia:

```swift
init(name: String)
```

reiškia, kad kuriant `ContentView`, reikia perduoti `String` tipo `name` parametrą.

Kai rašome:

```swift
ContentView(name: "Fang Junyu")
```

tai reiškia: `"Fang Junyu"` perduodamas kaip parametras inicializavimo metodui.

Tada inicializavimo metodo viduje bus vykdoma:

```swift
self.name = name
```

Ši kodo eilutė reiškia: iš išorės perduotą `name` priskirti dabartinio View nuosavai `name` property.

Tai galima paprastai suprasti taip:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("vardas: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Taip View viduje galima naudoti perduotą reikšmę.

Tai yra View su parametrais inicializavimo eiga: **kai View viduje esanti property neturi numatytosios reikšmės, kuriant View reikia perduoti atitinkamą parametrą, kad inicializavimo metodas užbaigtų reikšmės priskyrimą property.**

## Situacija, kai property turi numatytąją reikšmę

Jei property jau turi numatytąją reikšmę, kuriant View parametro galima neperduoti.

Pavyzdžiui:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("vardas: \(name)")
    }
}
```

Čia `name` jau turi numatytąją reikšmę:

```swift
"Fang Junyu"
```

Todėl kuriant `ContentView` galima tiesiogiai rašyti:

```swift
ContentView()
```

Tada `name` naudos numatytąją reikšmę, o sąsaja rodys:

```swift
vardas: Fang Junyu
```

Žinoma, kuriant View taip pat galima perduoti naują reikšmę:

```swift
ContentView(name: "Sam")
```

Tada View naudos iš išorės perduotą `"Sam"`, o ne numatytąją reikšmę, ir sąsaja rodys:

```swift
vardas: Sam
```

Kad būtų lengviau suprasti, Swift compiler automatiškai sugeneruotą inicializavimo metodą galima paprastai įsivaizduoti taip:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Čia `name: String = "Fang Junyu"` reiškia: jei kuriant View `name` neperduodamas, naudoti numatytąją reikšmę `"Fang Junyu"`; jei kuriant View perduodamas naujas `name`, naudoti perduotą reikšmę.

Kitaip tariant: **jei iš išorės parametras neperduodamas, naudojama property numatytoji reikšmė; jei iš išorės parametras perduodamas, naudojama perduota reikšmė.**

## Grįžkime prie SettingItemView

Dabar dar kartą pažiūrėkime į SettingItemView:

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

Šio View struktūra yra fiksuota.

Fiksuotos dalys apima:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Skirtingos dalys apima:

```swift
icon
color
title
```

Todėl skirtingą turinį paverčiame properties ir kuriant View perduodame kaip parametrus.

Kai kuriame skirtingus nustatymų elementus, tereikia perduoti skirtingus parametrus:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")
SettingItemView(icon: "folder", color: Color.brown, title: "Aplankas")
SettingItemView(icon: "music.note", color: Color.purple, title: "Muzika")
```

Taip tas pats `SettingItemView` gali parodyti tris skirtingus nustatymų elementus.

Tai yra dažniausias tinkinto View naudojimo būdas.

## Santrauka

Šioje pamokoje išmokome tinkintą View.

Pagrindinė tinkinto View paskirtis: **įkapsuliuoti pasikartojantį View kodą, kad jį būtų galima naudoti pakartotinai.**

Šiame pavyzdyje trijų nustatymų elementų struktūra yra tokia pati, skiriasi tik piktograma, spalva ir pavadinimas.

Todėl sukūrėme `SettingItemView`:

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

Tada naudodami šį View perduodame skirtingus parametrus:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Nustatymai")
```

Šie parametrai patenka į `SettingItemView` vidų.

Tokiu būdu galime naudoti mažiau kodo ir kurti View su ta pačia struktūra, bet skirtingu turiniu.

Tai taip pat yra labai dažnas rašymo būdas SwiftUI kūrime.
