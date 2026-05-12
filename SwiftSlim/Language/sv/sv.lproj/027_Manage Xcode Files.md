# Hantera Xcode-filer

I den här lektionen ska vi lära oss vanliga filåtgärder i Xcode.

I tidigare lektioner skrev vi det mesta av koden i `ContentView`. Det gör det enkelt att se koden och visningseffekten.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Men i en riktig app brukar man vanligtvis inte lägga all kod i en enda fil.

När det blir fler sidor, komponenter och funktioner behöver vi dela upp olika vyer i olika SwiftUI-filer.

Till exempel:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Det gör kodstrukturen tydligare och gör det enklare att underhålla och ändra senare.

## Varför hantera filer

I SwiftUI kan en sida eller en komponent vanligtvis skrivas som en separat vyfil.

Till exempel:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Här är `CardView` en SwiftUI-vy.

Om alla vyer skrivs i `ContentView` blir koden längre och längre, och allt svårare att läsa.

Därför behöver vi lära oss att skapa, byta namn på och ta bort filer, samt använda mappar för att hantera olika kodfiler.

## Skapa en SwiftUI-fil

I Xcode finns det vanligtvis två vanliga sätt att skapa en SwiftUI-fil:

Det ena är att skapa en tom fil och sedan skriva koden själv.

Det andra är att skapa en SwiftUI-mallfil, där Xcode automatiskt genererar grundkoden.

För nybörjare rekommenderas SwiftUI-mallfilen mer, eftersom den automatiskt genererar grundstrukturen.

### Skapa en tom fil

I Navigator-området till vänster i Xcode högerklickar du på ett tomt område eller en mapp och väljer `New Empty File`.

Platsen för åtgärden visas nedan:

![xcode](../../../Resource/027_view1.png)

Efter att en tom fil har skapats genererar Xcode vanligtvis en namnlös Swift-fil, till exempel `Untitled.swift`.

Vi kan byta namn på den till `TestView.swift`.

I ett SwiftUI-projekt rekommenderas det vanligtvis att lägga till `View` i slutet av namnet om filen används för att visa en vy.

Till exempel:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Detta är ingen tvingande regel, men det gör att vi direkt kan se att det är en vyfil.

Efter att en tom fil har skapats kan filen bara innehålla standardkommentarer, eller vara helt tom. Det beror på Xcode-versionen och hur filen skapades.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

Nu behöver vi skriva SwiftUI-koden manuellt:

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

Därmed har en enkel SwiftUI-vyfil skapats.

### Byta namn på en fil

Om du vill ändra filnamnet efter att filen har skapats kan du välja filen i Navigator-området till vänster i Xcode och sedan trycka på returtangenten `⏎`.

![xcode](../../../Resource/027_view2.png)

Då kan filnamnet ändras.

Det är viktigt att notera att ändring av filnamnet inte automatiskt ändrar vynamnet i koden.

Till exempel kan koden fortfarande innehålla `struct TestView: View` efter att filnamnet har ändrats till `ProfileView.swift`.

Detta leder inte nödvändigtvis till ett fel, men det kan lätt skapa förvirring.

Därför rekommenderas det att hålla filnamnet och vynamnet konsekventa. Om filnamnet till exempel är `ProfileView.swift`, bör vynamnet också vara `ProfileView`.

## Skapa en SwiftUI-mallfil

Förutom att skapa en tom fil kan vi också skapa en SwiftUI-mallfil direkt.

I Navigator-området till vänster i Xcode högerklickar du på ett tomt område eller en mapp och väljer `New File from Template...`.

Platsen för åtgärden visas nedan:

![xcode](../../../Resource/027_view3.png)

I fönstret som visas kan du välja olika plattformar längst upp, till exempel `iOS`, `macOS` och så vidare.

Här behåller vi den plattform som motsvarar det aktuella projektet. Om vi till exempel skapar en iOS-app väljer vi `iOS`.

![xcode](../../../Resource/027_view4.png)

Välj sedan `SwiftUI View` nedanför.

![xcode](../../../Resource/027_view12.png)

Klicka sedan på `Next`, ange filnamnet och spara.

Till exempel skapar vi `Test2View.swift`.

Xcode genererar automatiskt kod som liknar följande:

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

Jämfört med en tom fil innehåller mallfilen automatiskt `import SwiftUI`, `struct`, `body` och `#Preview`.

För nybörjare är det därför enklare att använda en SwiftUI-mallfil, och det minskar också risken att glömma nödvändig kod.

**Tips**: Förutom att högerklicka för att skapa filer kan du också klicka på plusknappen längst ned i Navigator-området till vänster i Xcode för att skapa en fil eller mapp.

![xcode](../../../Resource/027_view5.png)

## Skapa mappar

När filerna blir fler kan vi använda mappar för att organisera dem.

I Navigator-området till vänster i Xcode högerklickar du på ett tomt område eller en mapp och väljer `New Folder`.

Efter att mappen har skapats kan du dra relaterade filer in i mappen.

![xcode](../../../Resource/027_view7.png)

Mappar används främst för att ordna projektstrukturen och ändrar inte hur själva vyn används.

Så länge vynamnet är korrekt kan den fortfarande användas i andra filer med exempelvis `TestView()` och `Test2View()`.

## Ta bort en fil eller mapp

Om du vill ta bort en fil eller mapp kan du välja motsvarande fil i Navigator-området till vänster i Xcode, högerklicka och välja `Delete`.

Du kan också välja filen och sedan trycka på delete-tangenten `⌫`.

Xcode visar ett bekräftelsefönster för borttagning.

![xcode](../../../Resource/027_view10.png)

Välj `Move to Trash`, vilket innebär att filen flyttas till papperskorgen.

Om du ser `Remove Reference` betyder det att endast referensen tas bort från Xcode-projektet, men den ursprungliga filen på disken tas inte bort.

För nybörjare räcker det vanligtvis att välja `Move to Trash` om du bara tar bort en vanlig fil som du nyss har skapat.

## Visa flera SwiftUI-vyer

När vi har lärt oss att skapa filer kan vi dela upp olika vyer i olika filer.

Till exempel skapar vi två SwiftUI-filer:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` används för att visa författarens namn:

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

`CardView` används för att visa kortets bakgrund:

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

Sedan kan vi använda dessa två vyer i `ContentView`:

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

Efter körning kan vi se att `CardView` och `AuthorView` visas tillsammans:

![xcode](../../../Resource/027_view11.png)

I detta resultat fungerar `CardView` som bakgrund, medan `AuthorView` visas ovanpå. Det beror på att de har placerats i en `ZStack`.

I `ContentView` använder vi dessa två vyer genom `CardView()` och `AuthorView()`. `()` efter namnet betyder att vyn skapas och används.

Detta är vanlig vynästning i SwiftUI: i en vy kan vi fortsätta att använda andra vyer.

## Ingångsfilen

Till sist går vi igenom var appen börjar visa gränssnittet.

I ett SwiftUI-projekt finns det vanligtvis en ingångsfil:

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

Här betyder `@main` att detta är appens ingångspunkt.

I `WindowGroup` ser vi:

```swift
ContentView()
```

Det betyder att appen först visar `ContentView` efter start.

Sedan visar `ContentView` i sin tur:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Därför kan vyhierarkin förstås så här:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Om vi ändrar vyn som visas i ingångsfilen till `CardView`:

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

Då kommer appen efter start endast att visa `CardView`.

Med andra ord avgör `WindowGroup` i ingångskoden vilken vy som visas först efter att appen har startat.

Inuti denna vy kan andra vyer sedan fortsätta att visas.

## Sammanfattning

I den här lektionen lärde vi oss vanliga filhanteringsåtgärder i Xcode.

Vi gick igenom hur man skapar SwiftUI-filer, hur man byter namn på filer, hur man skapar mappar och hur man tar bort filer.

Samtidigt lärde vi oss också ett viktigt begrepp: SwiftUI-vyer kan delas upp i olika filer och sedan användas i andra vyer.

Till exempel:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Här är `CardView()` och `AuthorView()` exempel på att använda andra vyer i `ContentView`.

Till sist gick vi också igenom visningslogiken i ingångsfilen.

När appen startar går den först in i ingångskoden som är markerad med `@main`, och visar sedan vyn i `WindowGroup`.

Detta hjälper oss att förstå att olika SwiftUI-filer inte är isolerade från varandra. De kan kombineras med varandra och till slut bilda ett komplett appgränssnitt.
