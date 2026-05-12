# Administrere Xcode-filer

I denne leksjonen skal vi lære vanlige filoperasjoner i Xcode.

I de tidligere leksjonene skrev vi mesteparten av koden i `ContentView`. Det gjør det enklere å se koden og resultatet på skjermen.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Men i en ekte app legger man vanligvis ikke all koden i én fil.

Når det blir flere og flere sider, komponenter og funksjoner, må vi dele ulike visninger inn i forskjellige SwiftUI-filer.

For eksempel:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Dette gjør kodestrukturen tydeligere, og gjør det enklere å vedlikeholde og endre senere.

## Hvorfor administrere filer

I SwiftUI kan en side eller en komponent vanligvis skrives som en egen visningsfil.

For eksempel:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Her er `CardView` en SwiftUI-visning.

Hvis alle visninger skrives i `ContentView`, blir koden stadig lengre og vanskeligere å lese.

Derfor må vi lære å opprette, gi nytt navn til og slette filer, samt bruke mapper til å administrere ulike kodefiler.

## Opprette en SwiftUI-fil

I Xcode finnes det vanligvis to vanlige måter å opprette en SwiftUI-fil på:

Den ene er å opprette en tom fil og deretter skrive koden selv.

Den andre er å opprette en SwiftUI-malfil, der Xcode automatisk genererer grunnleggende kode.

For nybegynnere anbefales det oftere å bruke en SwiftUI-malfil, fordi den automatisk genererer grunnstrukturen.

### Opprette en tom fil

I Navigator-området til venstre i Xcode høyreklikker du på et tomt område eller en mappe, og velger `New Empty File`.

Plasseringen er som følger:

![xcode](../../../Resource/027_view1.png)

Etter at du har opprettet en tom fil, genererer Xcode vanligvis en Swift-fil uten navn, for eksempel `Untitled.swift`.

Vi kan gi den nytt navn til `TestView.swift`.

I et SwiftUI-prosjekt anbefales det vanligvis å legge til `View` på slutten av navnet hvis denne filen brukes til å vise en visning.

For eksempel:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Dette er ikke en obligatorisk regel, men det gjør at vi umiddelbart kan se at dette er en visningsfil.

Etter at en tom fil er opprettet, kan filen bare inneholde standardkommentarer, eller den kan være tom. Dette avhenger av Xcode-versjonen og hvordan den ble opprettet.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

På dette tidspunktet må vi skrive SwiftUI-koden manuelt:

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

Slik er en enkel SwiftUI-visningsfil opprettet.

### Gi filen nytt navn

Hvis du vil endre filnavnet etter at filen er opprettet, kan du velge filen i Navigator-området til venstre i Xcode og deretter trykke på returtasten `⏎`.

![xcode](../../../Resource/027_view2.png)

Da kan du endre filnavnet.

Det er viktig å merke seg at endring av filnavnet ikke automatisk endrer visningsnavnet i koden.

Hvis filnavnet for eksempel endres til `ProfileView.swift`, kan koden fortsatt inneholde `struct TestView: View`.

Dette fører ikke nødvendigvis til en feil, men det kan lett skape forvirring.

Derfor anbefales det å holde filnavnet og visningsnavnet konsistente. Hvis filnavnet for eksempel er `ProfileView.swift`, bør visningsnavnet også være `ProfileView`.

## Opprette en SwiftUI-malfil

I tillegg til å opprette en tom fil kan vi også opprette en SwiftUI-malfil direkte.

I Navigator-området til venstre i Xcode høyreklikker du på et tomt område eller en mappe, og velger `New File from Template...`.

Plasseringen er som følger:

![xcode](../../../Resource/027_view3.png)

I vinduet som vises, kan du velge ulike plattformer øverst, for eksempel `iOS`, `macOS` og så videre.

Her beholder vi valget for plattformen som passer til det gjeldende prosjektet. Hvis vi for eksempel lager en iOS-app, velger vi `iOS`.

![xcode](../../../Resource/027_view4.png)

Deretter velger du `SwiftUI View` nederst.

![xcode](../../../Resource/027_view12.png)

Klikk deretter på `Next`, skriv inn filnavnet og lagre.

For eksempel oppretter vi en fil kalt `Test2View.swift`.

Xcode genererer automatisk kode som ligner på dette:

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

Sammenlignet med en tom fil inneholder en malfil automatisk `import SwiftUI`, `struct`, `body` og `#Preview`.

For nybegynnere er det derfor enklere å bruke en SwiftUI-malfil, og det er også mindre sannsynlig at man glemmer å skrive nødvendig kode.

**Tips**: I tillegg til å opprette filer ved å høyreklikke, kan du også klikke på plussknappen nederst i Navigator-området til venstre i Xcode for å opprette en fil eller mappe.

![xcode](../../../Resource/027_view5.png)

## Opprette en mappe

Når det blir flere og flere filer, kan vi bruke mapper til å organisere dem.

I Navigator-området til venstre i Xcode høyreklikker du på et tomt område eller en mappe, og velger `New Folder`.

Etter at mappen er opprettet, kan du dra relaterte filer inn i mappen.

![xcode](../../../Resource/027_view7.png)

Mapper brukes hovedsakelig til å organisere prosjektstrukturen, og de endrer ikke hvordan selve visningen brukes.

Så lenge visningsnavnet er riktig, kan den fortsatt brukes i andre filer med `TestView()`, `Test2View()` og lignende.

## Slette en fil eller mappe

Hvis du vil slette en fil eller mappe, kan du velge den aktuelle filen i Navigator-området til venstre i Xcode, høyreklikke og velge `Delete`.

Du kan også velge filen og deretter trykke på slettetasten `⌫`.

Xcode viser et vindu for å bekrefte slettingen.

![xcode](../../../Resource/027_view10.png)

Hvis du velger `Move to Trash`, betyr det at filen flyttes til papirkurven.

Hvis du ser `Remove Reference`, betyr det at referansen bare fjernes fra Xcode-prosjektet, men den opprinnelige filen på disken slettes ikke.

For nybegynnere er det vanligvis nok å velge `Move to Trash` hvis du bare sletter en vanlig fil du nettopp har opprettet.

## Vise flere SwiftUI-visninger

Etter å ha lært å opprette filer kan vi dele ulike visninger inn i forskjellige filer.

For eksempel oppretter vi to SwiftUI-filer:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` brukes til å vise forfatternavnet:

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

`CardView` brukes til å vise kortbakgrunnen:

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

Deretter kan vi bruke disse to visningene i `ContentView`:

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

Etter kjøring kan vi se at `CardView` og `AuthorView` kombineres og vises sammen:

![xcode](../../../Resource/027_view11.png)

I dette resultatet fungerer `CardView` som bakgrunn, og `AuthorView` vises over den. Dette er fordi de er plassert i en `ZStack`.

I `ContentView` bruker vi disse to visningene gjennom `CardView()` og `AuthorView()`. `()` etter navnet betyr at vi oppretter og bruker denne visningen.

Dette er vanlig visningsnesting i SwiftUI: I én visning kan vi fortsette å bruke andre visninger.

## Inngangsfil

Til slutt skal vi se tilbake på hvor appen begynner å vise grensesnittet.

I et SwiftUI-prosjekt finnes det vanligvis en inngangsfil:

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

Her betyr `@main` at dette er appens inngangspunkt.

I `WindowGroup` ser vi:

```swift
ContentView()
```

Dette betyr at appen først viser `ContentView` etter oppstart.

Deretter viser `ContentView` også følgende inni seg:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Derfor kan visningshierarkiet forstås slik:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Hvis vi endrer visningen som vises i inngangsfilen til `CardView`:

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

Da vil appen bare vise `CardView` etter oppstart.

Med andre ord bestemmer `WindowGroup` i inngangskoden hvilken visning som først vises etter at appen starter.

Og inni denne visningen kan den fortsette å vise andre visninger.

## Oppsummering

I denne leksjonen lærte vi vanlige filadministrasjonsoperasjoner i Xcode.

Vi lærte hvordan vi oppretter SwiftUI-filer, gir filer nytt navn, oppretter mapper og sletter filer.

Samtidig lærte vi også et viktig konsept: SwiftUI-visninger kan deles inn i forskjellige filer og deretter brukes i andre visninger.

For eksempel:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Her er `CardView()` og `AuthorView()` andre visninger som brukes i `ContentView`.

Til slutt gjennomgikk vi også visningslogikken i inngangsfilen.

Når appen starter, går den først inn i inngangskoden merket med `@main`, og viser deretter visningen i `WindowGroup`.

Dette hjelper oss å forstå at ulike SwiftUI-filer ikke er isolerte. De kan kombineres med hverandre og til slutt danne et komplett appgrensesnitt.
