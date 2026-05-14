# Brugerdefinerede views

I denne lektion lærer vi en meget vigtig SwiftUI-skrivemåde: **brugerdefinerede views**.

Et brugerdefineret view kan pakke en gentaget del af view-koden ind, så den bliver til et view, der kan bruges igen og igen.

Når vi udvikler apps i praksis, støder vi ofte på denne situation: Mange skærme har samme struktur, men viser forskelligt indhold.

For eksempel kan hver post i en liste på et forumwebsted have oplysninger som titel, billede og antal likes.

![Reddit](../../../Resource/028_view1.png)

På et shoppingwebsted kan hvert produkt have oplysninger som billede, navn og pris.

![Amazon](../../../Resource/028_view2.png)

Strukturen i disse indholdstyper ligner hinanden. Forskellen er kun de data, der vises.

Hvis vi skriver koden for hvert element manuelt, bliver koden meget lang, og den bliver heller ikke nem at ændre senere.

Derfor kan vi pakke den fælles struktur ind i et brugerdefineret view og derefter sende det forskellige indhold ind som parametre.

På den måde kan det samme view vise forskelligt indhold.

## Kravscenarie

Lad os for eksempel sige, at vi nu vil lave en indstillingsliste.

Visningseffekt:

![view](../../../Resource/028_view.png)

I denne indstillingsliste er der tre forskellige indstillingselementer: `Indstillinger`, `Mappe` og `Musik`.

Selvom deres ikoner, farver og titler er forskellige, er den overordnede struktur den samme:

- Ikon i venstre side
- Baggrundsfarve for ikonet
- Titel i midten
- Pil i højre side

Hvis vi ikke bruger et brugerdefineret view, kunne vi skrive sådan:

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

                Text("Indstillinger")
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

                Text("Musik")
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

Denne kode kan vises normalt, men problemet er også meget tydeligt: Koden for de tre indstillingselementer er næsten helt ens.

De eneste forskellige dele er ikon, farve og titel:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Indstillinger")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mappe")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musik")
```

Det vil sige, at strukturen for hvert indstillingselement er fast. Kun ikon, farve og titel er forskellige.

Denne situation er meget velegnet til at bruge et brugerdefineret view.

### Skygge shadow

Her bruger vi en ny modifier `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` kan tilføje en skygge til et view.

`radius` angiver skyggens sløringsradius. Jo større værdien er, desto større bliver skyggens udbredelse som regel, og desto blødere ser den ud.

Her sættes den til `1`, hvilket betyder, at der kun tilføjes en meget let skyggeeffekt.

## Indpakning af indstillingselementets view

Dernæst pakker vi hvert indstillingselement ind som et nyt view.

Vi kan oprette et `SettingItemView`:

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

I dette view definerer vi tre egenskaber:

```swift
let icon: String
let color: Color
let title: String
```

Her betyder:

- `icon` ikonets navn
- `color` ikonets baggrundsfarve
- `title` indstillingselementets titel

Fordi disse tre stykker indhold er forskellige i forskellige indstillingselementer, gør vi dem til parametre, der kan sendes ind udefra.

## Brug af et brugerdefineret view

Når vi har `SettingItemView`, behøver vi ikke længere gentage en stor blok `HStack`-kode.

Nu kan vi bruge det sådan:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")
```

Denne linje kode betyder, at vi opretter et indstillingselement-view og sender tre parametre ind:

```swift
icon: "gear"
color: Color.blue
title: "Indstillinger"
```

Efter de er sendt ind, får egenskaberne inde i `SettingItemView` de tilsvarende værdier:

- Værdien af `icon` er `gear`
- Værdien af `color` er `Color.blue`
- Værdien af `title` er `"Indstillinger"`

Derfor viser `Image(systemName: icon)` inde i viewet et tandhjulsikon, `.background(color)` bruger en blå baggrund, og `Text(title)` viser `Indstillinger`.

Komplet kode:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mappe")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
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

Visningseffekt:

![view](../../../Resource/028_view.png)

Som du kan se, er visningseffekten den samme efter indpakningen, men koden er blevet mere overskuelig.

Før skulle hvert indstillingselement skrives som en hel `HStack`. Nu behøver vi kun én linje kode:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")
```

Det er rollen for et brugerdefineret view: **at pakke en gentaget view-struktur ind og kun sende det forskellige indhold ind som parametre.**

## Hvorfor parametre kan sendes

Dernæst forstår vi kort, hvorfor et brugerdefineret view kan modtage parametre.

I SwiftUI er et view i bund og grund en struktur.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Her er `ContentView` en struktur.

Når vi skriver:

```swift
ContentView()
```

opretter vi faktisk et `ContentView`-view.

De efterfølgende `()` betyder, at vi kalder dets initialiseringsmetode. Det kan også forstås som, at vi opretter dette view.

Fordi dette `ContentView` ikke har egenskaber, der skal sendes ind udefra, kan vi skrive direkte:

```swift
ContentView()
```

Men hvis et view har egenskaber uden værdier, skal de tilsvarende værdier sendes ind, når viewet oprettes.

For eksempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("navn: \(name)")
    }
}
```

Her er `name` en egenskab, og den har ikke en standardværdi.

Derfor skal vi give `name` en konkret værdi, når vi opretter `ContentView`:

```swift
ContentView(name: "Fang Junyu")
```

På den måde kan viewet bruge denne værdi internt:

```swift
Text("navn: \(name)")
```

Det er også grunden til, at vi skal sende parametre ind, når vi opretter `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")
```

Fordi `SettingItemView` har tre egenskaber uden standardværdier:

```swift
let icon: String
let color: Color
let title: String
```

skal vi sende dem ind, når vi opretter dette view. De parametre, der sendes ind, bruges af Swift til at tildele værdier til egenskaberne inde i viewet.

## Initialiseringsmetode

Dernæst forstår vi initialiseringsmetoden lidt mere detaljeret.

### Standardinitialiseringsmetode

Når vi definerer et almindeligt view:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

I denne kode har vi ikke skrevet en initialiseringsmetode manuelt.

Men når vi bruger dette view, kan vi skrive sådan:

```swift
ContentView()
```

Her betyder `()` faktisk, at vi opretter `ContentView`. Det kan også forstås som at kalde dets initialiseringsmetode.

### Hvorfor kan den stadig kaldes, selvom der ikke findes en initialiseringsmetode?

Fordi Swift-kompileren automatisk hjælper os med at generere en initialiseringsmetode.

Det er vigtigt at bemærke, at **denne initialiseringsmetode genereres automatisk, og vi ser den normalt ikke direkte i koden.**

Det vil sige, at selvom vi ikke manuelt skriver dette i `struct`:

```swift
init() {

}
```

så hjælper Swift-kompileren os i baggrunden med at generere en initialiseringsmetode, der ligner denne:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hello, World!")
    }
}
```

Det er derfor, vi kan skrive direkte:

```swift
ContentView()
```

I praksis behøver vi derfor normalt ikke skrive initialiseringsmetoden manuelt.

Vi behøver kun at forstå én ting: **Når et SwiftUI-view oprettes, kaldes viewets initialiseringsmetode. Selvom vi ikke har skrevet en initialiseringsmetode manuelt, kan Swift stadig generere en automatisk for os.**

### Initialiseringsmetode med parametre

Hvis et view har en egenskab uden standardværdi, for eksempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("navn: \(name)")
    }
}
```

Swift-kompileren genererer automatisk en initialiseringsmetode med parametre ud fra egenskaben.

Vi kan enkelt forstå det som:

```swift
init(name: String) {
    self.name = name
}
```

Her betyder:

```swift
init(name: String)
```

at når vi opretter `ContentView`, skal vi sende en `name`-parameter af typen `String` ind.

Når vi skriver:

```swift
ContentView(name: "Fang Junyu")
```

betyder det: Send `"Fang Junyu"` som parameter til initialiseringsmetoden.

Derefter udfører initialiseringsmetoden internt:

```swift
self.name = name
```

Denne linje kode betyder: Tildel den `name`, der er sendt ind udefra, til dette views egen `name`-egenskab.

Det kan enkelt forstås som:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("navn: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

På den måde kan viewet bruge den værdi, der er sendt ind.

Dette er initialiseringsforløbet for et view med parametre: **Når egenskaberne i viewet ikke har standardværdier, skal de tilsvarende parametre sendes ind, når viewet oprettes, så initialiseringsmetoden kan tildele egenskaberne værdier.**

## Når egenskaber har standardværdier

Hvis en egenskab allerede har en standardværdi, kan vi oprette viewet uden at sende parametre ind.

For eksempel:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("navn: \(name)")
    }
}
```

Her har `name` allerede en standardværdi:

```swift
"Fang Junyu"
```

Derfor kan vi skrive direkte, når vi opretter `ContentView`:

```swift
ContentView()
```

På dette tidspunkt bruger `name` standardværdien, og grænsefladen viser:

```swift
navn: Fang Junyu
```

Selvfølgelig kan vi også sende en ny værdi ind, når vi opretter viewet:

```swift
ContentView(name: "Sam")
```

På dette tidspunkt bruger viewet den `"Sam"`, der er sendt ind udefra, i stedet for standardværdien, og grænsefladen viser:

```swift
navn: Sam
```

For at gøre det nemmere at forstå kan vi ganske enkelt se den initialiseringsmetode, som Swift-kompileren automatisk genererer, som sådan her:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Her betyder `name: String = "Fang Junyu"`: Hvis der ikke sendes `name` ind, når viewet oprettes, bruges standardværdien `"Fang Junyu"`; hvis der sendes en ny `name` ind, bruges den indsendte værdi.

Det vil sige: **Hvis der ikke sendes en parameter ind udefra, bruges egenskabens standardværdi. Hvis der sendes en parameter ind udefra, bruges den indsendte værdi.**

## Tilbage til SettingItemView

Nu ser vi igen på SettingItemView:

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

Strukturen i dette view er fast.

De faste dele omfatter:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

De forskellige dele omfatter:

```swift
icon
color
title
```

Derfor gør vi det forskellige indhold til egenskaber og sender dem ind som parametre, når viewet oprettes.

Når vi opretter forskellige indstillingselementer, behøver vi kun at sende forskellige parametre ind:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")
SettingItemView(icon: "folder", color: Color.brown, title: "Mappe")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
```

På den måde kan det samme `SettingItemView` vise tre forskellige indstillingselementer.

Dette er den mest almindelige måde at bruge brugerdefinerede views på.

## Opsummering

I denne lektion har vi lært om brugerdefinerede views.

Kernefunktionen for et brugerdefineret view er: **at pakke gentaget view-kode ind, så den kan genbruges.**

I dette eksempel har de tre indstillingselementer den samme struktur. Kun ikon, farve og titel er forskellige.

Derfor oprettede vi et `SettingItemView`:

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

Derefter sender vi forskellige parametre ind, når vi bruger dette view:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Indstillinger")
```

Parametrene her kommer ind i `SettingItemView`.

På denne måde kan vi bruge mindre kode til at oprette views med samme struktur, men forskelligt indhold.

Dette er også en meget almindelig skrivemåde i SwiftUI-udvikling.
