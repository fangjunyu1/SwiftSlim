# Tilpasset View

I denne leksjonen skal vi lære en svært viktig måte å skrive SwiftUI på: **tilpasset View**.

En tilpasset View kan kapsle inn et stykke gjentatt View-kode og gjøre det til en View som kan brukes om og om igjen.

I praktisk App-utvikling møter vi ofte denne situasjonen: strukturen i mange grensesnitt er den samme, men innholdet som vises, er forskjellig.

For eksempel kan hvert innlegg i en innleggsliste på et forum ha informasjon som tittel, bilde og antall likerklikk.

![Reddit](../../../Resource/028_view1.png)

I en produktliste på et nettbutikknettsted kan hvert produkt ha informasjon som bilde, navn og pris.

![Amazon](../../../Resource/028_view2.png)

Strukturen til dette innholdet er lik; forskjellen ligger bare i dataene som vises.

Hvis vi skriver koden for hvert element manuelt, blir koden veldig lang, og den blir heller ikke praktisk å endre senere.

Derfor kan vi kapsle inn den felles strukturen i en tilpasset View og sende inn det ulike innholdet som parametere.

På denne måten kan den samme View vise forskjellig innhold.

## Behovsscenario

For eksempel skal vi nå lage en innstillingsliste.

Visningsresultat:

![view](../../../Resource/028_view.png)

I denne innstillingslisten finnes det tre ulike innstillingselementer: `Innstillinger`, `Mappe` og `Musikk`.

Selv om ikonene, fargene og titlene deres er forskjellige, er den overordnede strukturen den samme:

- Ikon på venstre side
- Bakgrunnsfarge for ikonet
- Tittel i midten
- Pil på høyre side

Hvis vi ikke bruker en tilpasset View, kan vi kanskje skrive slik:

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

                Text("Innstillinger")
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

                Text("Mappe")
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

                Text("Musikk")
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

Denne koden kan vises normalt, men problemet er også veldig tydelig: koden for de tre innstillingselementene er nesten helt lik.

Det eneste som er forskjellig, er ikon, farge og tittel:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Innstillinger")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mappe")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musikk")
```

Med andre ord er strukturen til hvert innstillingselement fast, og bare ikon, farge og tittel er forskjellige.

Denne situasjonen passer derfor svært godt til bruk av en tilpasset View.

### Skygge shadow

Her bruker vi en ny modifier, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` kan legge til en skygge på en View.

`radius` angir skyggenes uskarphetsradius. Jo større verdien er, desto større blir vanligvis skyggenes spredningsområde, og den ser også mykere ut.

Her er den satt til `1`, noe som betyr at vi bare legger til en svært svak skyggeeffekt.

## Kapsle inn View for innstillingselementet

Deretter kapsler vi hvert innstillingselement inn i en ny View.

Vi kan opprette en `SettingItemView`:

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

I denne View definerer vi tre properties:

```swift
let icon: String
let color: Color
let title: String
```

Blant dem:

- `icon` står for ikonnavnet
- `color` står for ikonets bakgrunnsfarge
- `title` står for tittelen til innstillingselementet

Siden disse tre delene er forskjellige i ulike innstillingselementer, gjør vi dem til parametere som kan sendes inn utenfra.

## Bruke en tilpasset View

Når vi har `SettingItemView`, trenger vi ikke lenger å skrive en stor blokk med `HStack`-kode gjentatte ganger.

Nå kan vi bruke den slik:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")
```

Denne kodelinjen betyr at vi oppretter en View for et innstillingselement og sender inn tre parametere:

```swift
icon: "gear"
color: Color.blue
title: "Innstillinger"
```

Etter at de er sendt inn, får properties inne i `SettingItemView` de tilsvarende verdiene:

- verdien til `icon` er `gear`
- verdien til `color` er `Color.blue`
- verdien til `title` er `"Innstillinger"`

Derfor vil `Image(systemName: icon)` inne i View vise tannhjulikonet, `.background(color)` vil bruke en blå bakgrunn, og `Text(title)` vil vise `Innstillinger`.

Fullstendig kode:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mappe")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musikk")
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

Visningsresultat:

![view](../../../Resource/028_view.png)

Vi kan se at visningsresultatet etter innkapslingen er det samme som før, men koden har blitt tydeligere.

Tidligere måtte hvert innstillingselement skrive en hel `HStack`-blokk, men nå holder det med én kodelinje:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")
```

Dette er rollen til en tilpasset View: **å kapsle inn en gjentatt View-struktur og bare sende inn det ulike innholdet som parametere.**

## Hvorfor parametere kan sendes inn

Deretter skal vi enkelt forstå hvorfor en tilpasset View kan ta imot parametere.

I SwiftUI er en View i bunn og grunn en struktur.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, verden!")
    }
}
```

Her er `ContentView` en struktur.

Når vi skriver:

```swift
ContentView()
```

oppretter vi egentlig en `ContentView`-View.

De etterfølgende `()` betyr at initialiseringsmetoden kalles; det kan også forstås som å opprette denne View.

Siden denne `ContentView` ikke har noen properties som må sendes inn utenfra, kan vi skrive direkte:

```swift
ContentView()
```

Men hvis en View har en property uten verdi, må vi sende inn den tilsvarende verdien når View opprettes.

For eksempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("navn: \(name)")
    }
}
```

Her er `name` en property, og den har ingen standardverdi.

Derfor må vi gi `name` en konkret verdi når vi oppretter `ContentView`:

```swift
ContentView(name: "Fang Junyu")
```

Slik kan View bruke denne verdien internt:

```swift
Text("navn: \(name)")
```

Dette er også grunnen til at vi må sende inn parametere når vi oppretter `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")
```

Fordi `SettingItemView` har tre properties uten standardverdier:

```swift
let icon: String
let color: Color
let title: String
```

Derfor må vi sende dem inn når vi oppretter denne View. Parameterne som sendes inn, brukes av Swift til å tilordne verdier til properties inne i View.

## Initialiseringsmetode

Deretter skal vi forstå initialiseringsmetoden litt dypere.

### Standard initialiseringsmetode

Når vi definerer en vanlig View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hei, verden!")
    }
}
```

I denne koden har vi ikke skrevet noen initialiseringsmetode manuelt.

Men når vi bruker denne View, kan vi skrive slik:

```swift
ContentView()
```

Her betyr `()` egentlig at `ContentView` opprettes; det kan også forstås som å kalle initialiseringsmetoden.

### Hvorfor kan den kalles selv om vi ikke ser en initialiseringsmetode?

Fordi Swift-kompilatoren automatisk genererer en initialiseringsmetode for oss.

Det er viktig å merke seg: **denne initialiseringsmetoden genereres automatisk, og vi ser den vanligvis ikke direkte i koden.**

Det vil si at selv om vi ikke manuelt har skrevet dette i `struct`:

```swift
init() {

}
```

vil Swift-kompilatoren i bakgrunnen generere en initialiseringsmetode omtrent slik for oss:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hei, verden!")
    }
}
```

Derfor kan vi skrive direkte:

```swift
ContentView()
```

Derfor trenger vi vanligvis ikke å skrive initialiseringsmetoden manuelt i faktisk kode.

Vi trenger bare å forstå ett punkt: **Når en SwiftUI View opprettes, kalles initialiseringsmetoden til denne View. Selv om vi ikke skriver en initialiseringsmetode manuelt, kan Swift automatisk generere en for oss.**

### Initialiseringsmetode med parametere

Hvis en View har en property uten standardverdi, for eksempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("navn: \(name)")
    }
}
```

vil Swift-kompilatoren automatisk generere en initialiseringsmetode med parameter basert på propertyen.

Det kan enkelt forstås slik:

```swift
init(name: String) {
    self.name = name
}
```

Her:

```swift
init(name: String)
```

betyr at når vi oppretter `ContentView`, må vi sende inn en `name`-parameter av typen `String`.

Når vi skriver:

```swift
ContentView(name: "Fang Junyu")
```

betyr det: send `"Fang Junyu"` som parameter til initialiseringsmetoden.

Deretter kjøres dette inne i initialiseringsmetoden:

```swift
self.name = name
```

Denne kodelinjen betyr: tilordne `name` som er sendt inn utenfra, til den nåværende View sin egen `name`-property.

Det kan enkelt forstås slik:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("navn: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

På denne måten kan View bruke den innsendte verdien internt.

Dette er initialiseringsprosessen for en View med parametere: **Når en property inne i View ikke har en standardverdi, må den tilsvarende parameteren sendes inn når View opprettes, slik at initialiseringsmetoden fullfører verdi-tilordningen til propertyen.**

## Når en property har standardverdi

Hvis en property allerede har en standardverdi, kan vi opprette View uten å sende inn parameteren.

For eksempel:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("navn: \(name)")
    }
}
```

Her har `name` allerede en standardverdi:

```swift
"Fang Junyu"
```

Derfor kan vi skrive direkte når vi oppretter `ContentView`:

```swift
ContentView()
```

Da bruker `name` standardverdien, og grensesnittet viser:

```swift
navn: Fang Junyu
```

Selvfølgelig kan vi også sende inn en ny verdi når vi oppretter View:

```swift
ContentView(name: "Sam")
```

Da bruker View `"Sam"` som er sendt inn utenfra, i stedet for standardverdien, og grensesnittet viser:

```swift
navn: Sam
```

For å gjøre det enklere å forstå kan initialiseringsmetoden som Swift-kompilatoren automatisk genererer, enkelt ses slik:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Her betyr `name: String = "Fang Junyu"`: Hvis `name` ikke sendes inn når View opprettes, brukes standardverdien `"Fang Junyu"`; hvis en ny `name` sendes inn når View opprettes, brukes den innsendte verdien.

Med andre ord: **Hvis ingen parameter sendes inn utenfra, brukes propertyens standardverdi; hvis en parameter sendes inn utenfra, brukes den innsendte verdien.**

## Tilbake til SettingItemView

Nå ser vi tilbake på SettingItemView:

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

Strukturen til denne View er fast.

De faste delene inkluderer:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

De ulike delene inkluderer:

```swift
icon
color
title
```

Derfor gjør vi det ulike innholdet til properties og sender dem inn som parametere når View opprettes.

Når vi oppretter ulike innstillingselementer, trenger vi bare å sende inn ulike parametere:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")
SettingItemView(icon: "folder", color: Color.brown, title: "Mappe")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musikk")
```

Slik kan den samme `SettingItemView` vise tre ulike innstillingselementer.

Dette er den vanligste måten å bruke en tilpasset View på.

## Oppsummering

I denne leksjonen har vi lært om tilpasset View.

Kjernerollen til en tilpasset View er: **å kapsle inn gjentatt View-kode slik at den kan gjenbrukes.**

I dette eksempelet er strukturen til de tre innstillingselementene den samme; bare ikon, farge og tittel er forskjellige.

Derfor opprettet vi en `SettingItemView`:

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

Deretter sender vi inn ulike parametere når vi bruker denne View:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Innstillinger")
```

Parameterne her går inn i `SettingItemView`.

På denne måten kan vi bruke mindre kode til å lage Views med samme struktur, men med ulikt innhold.

Dette er også en svært vanlig skrivemåte i SwiftUI-utvikling.
