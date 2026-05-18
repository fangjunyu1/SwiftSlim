# Anpassade färger

I den här lektionen ska vi lära oss hur man skapar anpassade färger i SwiftUI.

I tidigare lektioner har vi redan använt standardfärgerna som SwiftUI tillhandahåller, till exempel:

```swift
Color.blue
Color.red
Color.green
```

Dessa färger är enkla att använda, men i verklig apputveckling är standardfärger ofta inte tillräckligt exakta.

Till exempel kan en designskiss använda färger som dessa:

```text
#2c54c2
#4875ed
#213e8d
```

Den här typen av färg kallas Hex-färg.

I den här lektionen låter vi först SwiftUI stödja Hex-färger och använder sedan `static` för att samla vanliga färger.

Till sist använder vi de anpassade färgerna i vyn för djurencyklopedin och går vidare med en gradientbakgrund, så att knapparna får mer djup.

## Varför behövs anpassade färger?

I SwiftUI kan vi använda systemfärger direkt.

Till exempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Här betyder `.blue` blått. Det är egentligen ett kortare sätt att skriva `Color.blue`.

Fördelen med standardfärger är att de är enkla och bekväma, men färgvalen är ganska begränsade.

Till exempel:

```swift
Color.blue
```

Det kan bara representera den standardblå färg som SwiftUI tillhandahåller.

![Color.blue](../../../Resource/031_color6.png)

Men i faktisk utveckling behöver vi ofta mer specifika färger.

Till exempel kan samma blå färg ha olika effekter som ljusblå, mörkblå, gråblå och klarblå.

![More Blue](../../../Resource/031_color5.png)

Om vi då bara använder `Color.blue` blir det svårt att återskapa designens utseende.

Därför behöver vi låta SwiftUI stödja anpassade färger.

## Vad är en Hex-färg?

Färger på skärmen består vanligtvis av tre kanaler: röd, grön och blå, alltså RGB.

RGB betyder:

```text
Red     // Röd
Green   // Grön
Blue    // Blå
```

Hex-färg är ett sätt att uttrycka RGB-färger.

Till exempel:

```swift
#5479FF
```

Det här färgvärdet kan förenklat förstås som tre delar:

```text
54  // Representerar den röda kanalen
79  // Representerar den gröna kanalen
FF  // Representerar den blå kanalen
```

I den här lektionen behöver vi inte beräkna dessa värden och inte heller gå djupt in i reglerna för hexadecimala tal.

Just nu räcker det att veta att `#5479FF` representerar en specifik färg.

När vi senare ser skrivsätt som `#2c54c2` och `#4875ed` kan vi först förstå dem som färgvärden.

I designverktyg som Sketch, Figma och Photoshop ser man också ofta liknande färgvärden.

![color](../../../Resource/031_color.png)

Men som standard kan SwiftUI inte skrivas direkt så här:

```swift
Color(hex: "#5479FF")
```

Därför behöver vi själva utöka typen `Color`, så att den kan skapa färger via Hex-strängar.

## Skapa filen Color+Hex.swift

Först skapar vi en ny Swift-fil.

Filnamnet kan skrivas som:

```text
Color.swift
```

Det kan också skrivas tydligare som:

```text
Color+Hex.swift
```

Här rekommenderas följande namn:

```text
Color+Hex.swift
```

I Swift-projekt är filnamn som `Color+Hex.swift` mycket vanliga.

Det betyder att den här filen är en tilläggsfil som ger `Color` Hex-funktionalitet.

Filnamnet påverkar inte direkt hur koden körs, utan gör det bara lättare för oss att förstå vad filen används till.

## Lägg till koden Color(hex:)

Skriv följande kod i filen `Color+Hex.swift`:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Den här koden använder `extension` för att utöka typen `Color` och lägger till en ny initieringsmetod för `Color`:

```swift
init(hex: String)
```

När vi har den här initieringsmetoden kan vi skicka en Hex-sträng till `Color` och därmed skapa en anpassad färg:

```swift
Color(hex: "#5479FF")
```

Internt omvandlar den här tilläggskoden Hex-strängen till en RGB-färg som SwiftUI kan förstå.

I det här skedet behöver du inte förstå varje rad i konverteringslogiken på djupet. Det räcker att förstå att den tillagda metoden `Color(hex:)` gör att vi kan skapa anpassade färger via Hex-färgvärden.

## Använda anpassade färger

Nu kan vi testa anpassade färger i `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Visningsresultat:

![color](../../../Resource/031_color1.png)

I det här exemplet använder den första raden en systemfärg:

```swift
.foregroundStyle(Color.blue)
```

De följande tre raderna använder anpassade Hex-färger:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Genom jämförelsen kan vi se att systemets blå färg bara har en standardeffekt.

Hex-färger kan däremot uttrycka mer detaljerade variationer av blått.

Detta är värdet med anpassade färger: de kan göra gränssnittets färger mer lika den verkliga designen och gör det också enklare att styra appens visuella stil.

## Använd static för att organisera färger

Nu kan vi redan skapa färger via Hex-strängar:

```swift
Color(hex: "#2c54c2")
```

Det här skrivsättet fungerar, men om samma färg förekommer på flera ställen blir det mindre praktiskt att underhålla senare.

Om färgvärdet skrivs på 10 olika platser och vi senare vill ändra den blå färgen måste vi ändra varje plats en efter en.

Då kan vi använda `static` för att samla vanliga färger på ett enhetligt sätt.

Lägg till följande kod längst ned i filen `Color+Hex.swift`:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Här har vi lagt till tre statiska egenskaper för `Color`: `animalBlue`, `animalLightBlue` och `animalDarkBlue`. De representerar blå färger med olika ljushet.

Eftersom dessa egenskaper använder `static` tillhör de själva typen `Color`.

När de används kan vi komma åt dem direkt via `Color.`:

```swift
Color.animalBlue
```

Det här skrivsättet är tydligare än att skriva Hex-strängen direkt.

När vi ser `Color.animalBlue` vet vi att den representerar den blå färg som används i djurencyklopedin.

När vi däremot ser `Color(hex: "#2c54c2")` vet vi bara att det är ett färgvärde, men det är inte lika lätt att se dess specifika användning.

Att hantera färger på ett enhetligt sätt har också en annan fördel: senare ändringar blir enklare.

Om vi vill justera huvudfärgen i djurencyklopedin behöver vi bara ändra den plats där färgen definieras:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Alla platser som använder den färgen uppdateras samtidigt.

Detta är syftet med att använda `static` för att organisera färger: färgnamnen blir tydligare och senare underhåll blir enklare.

## Tillämpa i djurencyklopedin

Nu kan vi tillämpa de anpassade färgerna i den tidigare vyn för djurencyklopedin.

Tidigare var djurknappens bakgrund vit:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Nu kan vi ändra den till en anpassad färg:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Här är `Color.animalBlue` den statiska färg som vi nyss definierade i `Color+Hex.swift`.

Knapptexten använder vitt:

```swift
.foregroundStyle(Color.white)
```

Bakgrunden för djurets emoji använder halvtransparent vitt:

```swift
.background(Color.white.opacity(0.15))
```

På så sätt får knappen en enhetlig blå visuell stil.

Fokus i det här steget är inte att lägga till komplicerad kod, utan att faktiskt använda de anpassade färger vi nyss lärt oss i gränssnittet.

## Använda gradientbakgrund

Förutom att använda en enda färg kan vi också kombinera flera färger till en gradienteffekt.

Till exempel definierade vi tidigare dessa färger:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Dessa färger kan inte bara användas var för sig, utan också kombineras till en gradientbakgrund.

I SwiftUI kan vi använda `LinearGradient` för att skapa en linjär gradient.

Till exempel:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Den här koden skapar en gradientbakgrund från vänster till höger, där färgen gradvis övergår från `Color.animalBlue` till `Color.animalLightBlue`.

Här används `colors` för att ange färgerna som ingår i gradienten, medan `startPoint` och `endPoint` används för att styra gradientens riktning.

### Testa gradienteffekten

Vi kan använda en enkel Text för att testa gradientbakgrunden.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Visningsresultat:

![color](../../../Resource/031_color3.png)

I det här exemplet är bakgrunden för `Text` inte längre en enda färg, utan en gradientfärg som gradvis förändras från vänster till höger.

Jämfört med en vanlig bakgrundsfärg ger en gradientbakgrund mer djup och gör det också lättare att skapa en visuell tyngdpunkt i gränssnittet.

## Använda gradientbakgrund i djurencyklopedin

Nu kan vi ändra djurknappens bakgrundsfärg:

```swift
.background(Color.animalBlue)
```

till en gradientbakgrund:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Den fullständiga koden är följande:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Visningsresultat:

![color](../../../Resource/031_color4.png)

Nu har djurknappen inte längre bara en enfärgad bakgrund, utan en gradienteffekt från vänster till höger.

Jämfört med en enfärgad bakgrund kan en gradientbakgrund få gränssnittet att kännas mer skiktat och även närma sig den visuella design som används i riktiga appar.

## Skillnaden mellan enfärgad bakgrund och gradientbakgrund

En enfärgad bakgrund använder bara en färg.

Till exempel:

```swift
.background(Color.animalBlue)
```

Det här skrivsättet är enkelt och tydligt och passar de flesta grundläggande gränssnitt.

En gradientbakgrund använder flera färger.

Till exempel:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Det här skrivsättet kan ge gränssnittet mer djup, men det kan också lätt öka den visuella komplexiteten.

I faktisk utveckling kan man därför förstå det så här:

Enfärgade bakgrunder passar vanligt textinnehåll, vanliga knappar, vanliga kort och vanliga sidbakgrunder.

Gradientbakgrunder passar viktiga knappar, toppområden, omslagskort, funktionsingångar och andra platser som behöver betonas.

## Sammanfattning

I den här lektionen har vi lärt oss hur man använder anpassade färger i SwiftUI.

Först gick vi igenom Hex-färger.

Till exempel:

```text
#2c54c2
```

Det representerar en specifik färg.

Sedan använde vi `extension Color` för att utöka typen `Color`.

Det gör att SwiftUI kan skapa färger på följande sätt:

```swift
Color(hex: "#2c54c2")
```

Därefter använde vi `static` för att organisera vanliga färger:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

På så sätt kan vi använda dem direkt i andra vyer:

```swift
Color.animalBlue
```

Jämfört med att skriva Hex-strängen varje gång är den här metoden tydligare och gör det också enklare att ändra färger enhetligt senare.

Till sist lärde vi oss `LinearGradient` och kombinerade anpassade färger till en gradientbakgrund:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Genom den här lektionen har vi gått igenom processen från att skapa anpassade färger till att använda färger i ett verkligt gränssnitt.

När en färg i framtiden behöver användas på flera platser kan vi i första hand överväga att samla den i ett `Color`-tillägg.

På så sätt blir koden tydligare och gränssnittets stil lättare att hålla enhetlig.
