# Swift och SwiftUI

När man lär sig utveckling för Apples plattformar tenderar många handledningar att förklara Swift och SwiftUI var för sig. Det gör att nybörjare lätt får en splittrad förståelse och felaktigt tror att det är två helt fristående tekniker.

I själva verket är Swift och SwiftUI djupt integrerade med varandra: Swift är programmeringsspråket och ansvarar för logik och data, medan SwiftUI är ett ramverk för användargränssnitt som är byggt ovanpå Swift och ansvarar för rendering av vyer och interaktion.

Den här lektionen hjälper dig att bygga upp en tydlig mental modell: vad Swift är, vad SwiftUI är och hur de samarbetar i kod.

## Vad är Swift?

Swift är ett modernt programmeringsspråk som skapades av Apple och används för att utveckla appar för plattformar som iOS, macOS, watchOS och tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift är ett starkt typat och statiskt språk. Det är utformat med stort fokus på säkerhet, vilket minskar många vanliga programmeringsfel, till exempel nullpekare och indexfel. Det stöder också sömlös integration med C och Objective-C.

I praktisk utveckling ansvarar Swift oftare för applikationens logikdel, till exempel databehandling, nätverksanrop och lagringsoperationer.

## Vad är SwiftUI?

SwiftUI är ett nytt ramverk för gränssnittsutveckling som Apple lanserade år 2019. SwiftUI använder ett deklarativt programmeringssätt, vilket gör det möjligt för utvecklare att beskriva gränssnittets struktur och interaktionsbeteende med mer kortfattad kod.

![swiftui](../../RESOURCE/010_swiftui.png)

Deklarativ programmering innebär att utvecklaren bara behöver tala om för systemet vad som ska visas, och systemet uppdaterar automatiskt vyn när data förändras. Man behöver alltså inte längre manuellt uppdatera gränssnittets tillstånd, vilket kraftigt förenklar komplexiteten i UI-utveckling.

Kärnan i SwiftUI är vykomponenter, som Text, Image och Button, samt layoutbehållare, som VStack, HStack och ZStack. Dessa komponenter samverkar genom databindning och tillståndshantering, så att gränssnittet kan reagera på förändringar i data och uppdateras automatiskt.

## Hur samarbetar Swift och SwiftUI?

Ansvarsfördelningen mellan Swift och SwiftUI kan sammanfattas så här:

**1. Swift: hanterar logik och data**

Swift används främst för att hantera data, lagra tillstånd och utföra logik. Den här typen av kod påverkar vanligtvis inte renderingen av gränssnittet direkt, utan ansvarar i stället för behandling av data och beteenden.

Till exempel, att behandla data i Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Den här typen av kod omfattar variabeldeklarationer, konstantdefinitioner, funktioner, kontrollflöden och liknande, och påverkar inte direkt hur vyn visas.

**2. SwiftUI: deklarerar och renderar gränssnittet**

SwiftUI används däremot för att bygga användargränssnittets layout och innehåll, och ansvarar främst för rendering av gränssnittet och interaktion i vyn.

Till exempel, att skapa en textvy med SwiftUI:

```swift
Text("SwiftSlim")
```

Sådan kod används för att bygga och styra gränssnittselement och samverkar direkt med användargränssnittet.

### Grundläggande exempel

Här är ett enkelt exempel i SwiftUI:

```swift
// ContentView.swift

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

I detta exempel:

**SwiftUI-kod**: VStack, Image, Text och padding tillhör SwiftUI och ansvarar för visning och layout av gränssnittet.

**Swift-kod**: kommentaren `//` överst i filen och `import SwiftUI` tillhör Swift-kodens struktur; längst ned är `#Preview` en makro för Xcode-förhandsvisning och deltar inte i faktisk gränssnittsrendering.

### Mer avancerat exempel

I verkliga projekt används Swift och SwiftUI ofta tillsammans för att utföra de uppgifter de är bäst lämpade för:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

I detta exempel:

**SwiftUI-kod**: @State är ett egenskapsomslag som är särskilt för SwiftUI och används för att deklarera vyts föränderliga tillstånd; Button och Text är SwiftUI-komponenter som ansvarar för gränssnittets visning och användarinteraktion.

**Swift-kod**: `private var name` och `func printName()` är Swift-kod som används för att lagra data och utföra logik, utan att direkt påverka renderingen av vyn.

När användaren trycker på knappen kommer SwiftUI att utlösa operationskoden i knappen:

```swift
Button("Print") {
    printName()
}
```

Här är Button en SwiftUI-komponent, medan funktionen `printName()` som körs är Swift-kod och ansvarar för den konkreta logiska behandlingen.

Detta samspel gör att Swift och SwiftUI kan integreras sömlöst: Swift ansvarar för data och logik, medan SwiftUI ansvarar för presentationen av användargränssnittet.

## Var brukar Swift- och SwiftUI-kod skrivas?

I SwiftUI byggs gränssnittet upp genom den vy som returneras av egenskapen `body`. Därför skrivs all kod som beskriver gränssnittet vanligtvis i `body`.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

I detta exempel är Text en SwiftUI-vykomponent och måste därför skrivas i `body`, eftersom SwiftUI läser `body` för att generera gränssnittet.

Kod som inte hör till gränssnittet, till exempel variabler, funktioner eller logik för databehandling, skrivs vanligtvis utanför `body`. Till exempel:

```swift
struct ContentView: View {

    // Swift: data eller logik
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: gränssnitt
    var body: some View {
        Text(name)
    }
}
```

Det är viktigt att notera att man fortfarande kan använda Swift-syntax i `body`, till exempel kontrollflöden som `if` och `for`. De används bara för att styra hur SwiftUI-vyer genereras:

```
if isLogin {
    Text("Welcome")
}
```

Därför kan man i SwiftUI-utveckling enkelt förstå det så här: vykod, som Text, Image och Button, skrivs vanligtvis i `body`; data- och logikkod, som variabler och funktioner, skrivs vanligtvis utanför `body`.

## Swift-filer

När du lär dig mer kommer du också att stöta på MVVM-arkitektur. Där består ViewModel- och Model-lagren vanligtvis av ren Swift-kod och är helt separerade från vylagret, alltså SwiftUI.

Till exempel en klass som används för att hantera applikationens tillstånd:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Eller en struktur som beskriver en datastruktur:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Den här typen av filer har som uppgift att hantera och spara data, utan att direkt visas i gränssnittet, och tillhör därför helt och hållet Swift.

## Historisk bakgrund

För att förstå relationen mellan Swift och SwiftUI behöver man också känna till utvecklingen av Apples tekniker. Fram till år 2026 har denna teknikstack genomgått flera iterationer.

### Swifts historia

Innan Swift dök upp var Objective-C det huvudsakliga programmeringsspråket för Apples plattformar, och det stödde blandad användning med C. Dess syntax var relativt långdragen, vilket gjorde tröskeln högre för nybörjare:

```Obj-c
// Så här skrivs det i Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

År 2014 lanserade Apple programmeringsspråket Swift på WWDC. Swift har modernare syntax och högre typsäkerhet, och har gradvis ersatt Objective-C som det dominerande utvecklingsspråket:

```swift
// Så här skrivs det i Swift
let name = "Fang"
print("Hello, \(name)")
```

Men Objective-C har inte försvunnit ur historien. Det används fortfarande i stor utsträckning i många äldre projekt och underliggande ramverk. Att förstå dess grundläggande syntax har fortfarande värde när man underhåller äldre projekt eller försöker förstå systemets underliggande lager.

### SwiftUI:s historia

Innan SwiftUI dök upp använde iOS **UIKit**, medan macOS använde **AppKit**. Dessa två ramverk byggde på ett "imperativt" programmeringssätt. Utvecklare behövde dra och släppa kontroller i Storyboard eller manuellt skriva kod för att styra vyernas tillstånd. Det ledde till stora kodmängder och höga underhållskostnader, särskilt när gränssnittslogiken blev komplex.

![storyboard](../../RESOURCE/010_xcode.png)

År 2019 lanserade Apple officiellt SwiftUI på WWDC. SwiftUI introducerade det "deklarativa" programmeringsparadigmet och förenklade UI-utvecklingsprocessen avsevärt.

![storyboard](../../RESOURCE/010_xcode1.png)

Det är också värt att notera att SwiftUI inte är en helt fristående implementation på låg nivå. På respektive plattform fungerar det i grunden genom bryggning och samarbete med UIKit på iOS eller AppKit på macOS, och är fortfarande beroende av dessa två ramverk på underliggande nivå.

### Relation mellan Swift och UIKit/AppKit

Även om Swift är ett allmänt programmeringsspråk som kan köras på Apples olika plattformar, kan det inte helt ersätta UIKit eller AppKit. För vissa mer komplexa gränssnittsbehov, eller funktioner som SwiftUI ännu inte täcker, behöver man fortfarande använda UIKit eller AppKit.

Till exempel är UIKit redan mycket moget när det gäller hantering av komplexa vykontrollerhierarkier, animationseffekter och gestigenkänning, och har samlat på sig mycket verifierad produktionspraxis. Även om SwiftUI:s möjligheter fortsätter att stärkas, finns det fortfarande begränsningar i vissa kantfall.

Därför väljer många utvecklare att använda SwiftUI tillsammans med UIKit eller AppKit i samma projekt, för att dra nytta av styrkorna hos båda.

Ur detta perspektiv kan SwiftUI förstås som en form av avancerad inkapsling ovanpå UIKit och AppKit. När man lär sig SwiftUI är det också värdefullt att ha en grundläggande förståelse för UIKit och AppKit, eftersom det hjälper vid underhåll av äldre projekt eller när mer komplexa funktioner behöver implementeras.

## Sammanfattning

**Swift**: används främst för att skriva logik, databehandling och kontrollflöde, och hör inte till vylayouten.

**SwiftUI**: används för att deklarativt bygga användargränssnitt, och koden för vyinnehåll och layout tillhör SwiftUI.

I verklig utveckling används Swift och SwiftUI vanligtvis tillsammans: Swift hanterar logiken, och SwiftUI hanterar gränssnittet.

Från Objective-C och UIKit till Swift och SwiftUI har Apples utvecklingsmiljö gradvis rört sig mot ett modernare och mer förenklat programmeringssätt. Samtidigt går det fortfarande inte att bortse från UIKit och AppKit i många traditionella projekt.

Genom att förstå relationen mellan Swift och SwiftUI kan vi utveckla iOS- och macOS-appar mer effektivt, och också fatta mer rimliga tekniska beslut när vi underhåller äldre projekt.
