# Administration af Xcode-filer

I denne lektion skal vi lære almindelige filhandlinger i Xcode.

I de tidligere lektioner skrev vi det meste af koden i `ContentView`. Det gør det nemt at se både koden og visningsresultatet.

For eksempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Men i en rigtig App lægger man normalt ikke al kode i én fil.

Når der kommer flere sider, komponenter og funktioner, skal vi opdele forskellige visninger i forskellige SwiftUI-filer.

For eksempel:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Det gør kodestrukturen mere overskuelig og gør senere vedligeholdelse og ændringer lettere.

## Hvorfor administrere filer

I SwiftUI kan en side eller en komponent normalt skrives som en separat visningsfil.

For eksempel:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Her er `CardView` en SwiftUI-visning.

Hvis alle visninger skrives i `ContentView`, bliver koden længere og længere og sværere at læse.

Derfor skal vi lære at oprette, omdøbe og slette filer samt bruge mapper til at administrere forskellige kodefiler.

## Opret en SwiftUI-fil

I Xcode er der ofte to måder at oprette en SwiftUI-fil på:

Den ene er at oprette en tom fil og derefter selv skrive koden.

Den anden er at oprette en SwiftUI-skabelonfil, hvor Xcode automatisk genererer grundkoden.

For begyndere anbefales det mere at bruge en SwiftUI-skabelonfil, fordi den automatisk genererer den grundlæggende struktur.

### Opret en tom fil

I Navigator-området til venstre i Xcode skal du højreklikke på et tomt område eller en mappe og vælge `New Empty File`.

Placeringen vises her:

![xcode](../../../Resource/027_view1.png)

Når den tomme fil er oprettet, opretter Xcode normalt en Swift-fil uden navn, for eksempel `Untitled.swift`.

Vi kan omdøbe den til `TestView.swift`.

I et SwiftUI-projekt anbefales det normalt at tilføje `View` til slutningen af navnet, hvis filen bruges til at vise en visning.

For eksempel:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Det er ikke en tvungen regel, men det gør det muligt hurtigt at se, at dette er en visningsfil.

Efter oprettelse af en tom fil kan filen kun indeholde standardkommentarer eller være helt tom, afhængigt af Xcode-versionen og oprettelsesmetoden.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

På dette tidspunkt skal vi manuelt skrive SwiftUI-kode:

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

Så er en enkel SwiftUI-visningsfil oprettet.

### Omdøb fil

Hvis du vil ændre filnavnet efter oprettelsen, kan du vælge filen i Navigator-området til venstre i Xcode og derefter trykke på returtasten `⏎`.

![xcode](../../../Resource/027_view2.png)

Så kan filnavnet ændres.

Bemærk, at ændring af filnavnet ikke automatisk ændrer visningsnavnet i koden.

For eksempel kan koden stadig indeholde `struct TestView: View`, efter at filnavnet er ændret til `ProfileView.swift`.

Det giver ikke nødvendigvis en fejl, men det kan let skabe forvirring.

Derfor anbefales det at holde filnavnet og visningsnavnet ens. Hvis filnavnet for eksempel er `ProfileView.swift`, bør visningsnavnet også være `ProfileView`.

## Opret en SwiftUI-skabelonfil

Ud over at oprette en tom fil kan vi også oprette en SwiftUI-skabelonfil direkte.

I Navigator-området til venstre i Xcode skal du højreklikke på et tomt område eller en mappe og vælge `New File from Template...`.

Placeringen vises her:

![xcode](../../../Resource/027_view3.png)

I det vindue, der åbnes, kan du øverst vælge forskellige platforme, for eksempel `iOS`, `macOS` osv.

Her skal du blot beholde den platform, der svarer til det aktuelle projekt. Hvis vi for eksempel opretter en iOS App, vælger vi `iOS`.

![xcode](../../../Resource/027_view4.png)

Vælg derefter `SwiftUI View` nederst.

![xcode](../../../Resource/027_view12.png)

Klik derefter på `Next`, indtast filnavnet, og gem.

For eksempel opretter vi en `Test2View.swift`.

Xcode genererer automatisk kode, der ligner følgende:

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

Sammenlignet med en tom fil indeholder skabelonfilen automatisk `import SwiftUI`, `struct`, `body` og `#Preview`.

Derfor er det enklere for begyndere at bruge en SwiftUI-skabelonfil, og det er mindre sandsynligt, at man glemmer at skrive kode.

**Tip**: Ud over at oprette en fil med højreklik kan du også klikke på plusknappen nederst i Navigator til venstre i Xcode for at oprette en fil eller mappe.

![xcode](../../../Resource/027_view5.png)

## Opret en mappe

Når der bliver flere og flere filer, kan vi bruge mapper til at administrere dem.

I Navigator-området til venstre i Xcode skal du højreklikke på et tomt område eller en mappe og vælge `New Folder`.

Når mappen er oprettet, kan du trække relaterede filer ind i mappen.

![xcode](../../../Resource/027_view7.png)

Mapper bruges primært til at organisere projektstrukturen og ændrer ikke, hvordan selve visningen bruges.

Så længe visningsnavnet er korrekt, kan den stadig bruges i andre filer med for eksempel `TestView()` og `Test2View()`.

## Slet fil eller mappe

Hvis du vil slette en fil eller mappe, kan du vælge den tilsvarende fil i Navigator-området til venstre i Xcode, højreklikke og vælge `Delete`.

Du kan også vælge filen og derefter trykke på slettetasten `⌫`.

Xcode viser et vindue til bekræftelse af sletningen.

![xcode](../../../Resource/027_view10.png)

Vælg `Move to Trash` for at flytte filen til papirkurven.

Hvis du ser `Remove Reference`, betyder det, at referencen kun fjernes fra Xcode-projektet, men at den oprindelige fil på disken ikke slettes.

For begyndere er det normalt nok at vælge `Move to Trash`, hvis du blot sletter en almindelig fil, du lige har oprettet.

## Vis flere SwiftUI-visninger

Når vi har lært at oprette filer, kan vi opdele forskellige visninger i forskellige filer.

For eksempel opretter vi to SwiftUI-filer:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` bruges til at vise forfatterens navn:

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

`CardView` bruges til at vise kortets baggrund:

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

Derefter kan vi bruge disse to visninger i `ContentView`:

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

Efter kørsel kan vi se, at `CardView` og `AuthorView` vises sammen:

![xcode](../../../Resource/027_view11.png)

I dette resultat fungerer `CardView` som baggrund, og `AuthorView` vises ovenpå, fordi de er placeret i en `ZStack`.

I `ContentView` bruger vi de to visninger gennem `CardView()` og `AuthorView()`. `()` efter navnet betyder, at vi opretter og bruger denne visning.

Dette er almindelig visningsindlejring i SwiftUI: I én visning kan man fortsætte med at bruge andre visninger.

## Indgangsfil

Til sidst gennemgår vi igen, hvorfra Appen begynder at vise grænsefladen.

I et SwiftUI-projekt findes der normalt en indgangsfil:

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

Her betyder `@main`, at dette er Appens indgangspunkt.

I `WindowGroup` ser vi:

```swift
ContentView()
```

Det betyder, at Appen først viser `ContentView`, når den starter.

Derefter viser `ContentView` igen:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Derfor kan visningshierarkiet forstås sådan:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Hvis vi ændrer den viste visning i indgangsfilen til `CardView`:

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

Så viser Appen kun `CardView`, efter den er startet.

Med andre ord bestemmer `WindowGroup` i indgangskoden, hvilken visning Appen først viser efter start.

Og inde i denne visning kan andre visninger fortsat vises.

## Opsummering

I denne lektion lærte vi almindelige filadministrationshandlinger i Xcode.

Vi lærte, hvordan man opretter SwiftUI-filer, hvordan man omdøber filer, hvordan man opretter mapper, og hvordan man sletter filer.

Samtidig lærte vi også et vigtigt koncept: SwiftUI-visninger kan opdeles i forskellige filer og derefter bruges i andre visninger.

For eksempel:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Her er `CardView()` og `AuthorView()` brug af andre visninger i `ContentView`.

Til sidst gennemgik vi også visningslogikken i indgangsfilen.

Når Appen starter, går den først ind i indgangskoden markeret med `@main` og viser derefter visningen i `WindowGroup`.

Det hjælper os med at forstå, at forskellige SwiftUI-filer ikke er isolerede. De kan kombineres med hinanden og til sidst danne en komplet App-grænseflade.
