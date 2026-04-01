# Färgstarka färger

I den här lektionen ska vi lära oss vanliga visuella modifierare i SwiftUI, bland annat:

- färg
- förgrundsfärg
- bakgrundsfärg
- förskjutning
- transparens
- oskärpa

Vi kommer också att lära oss om Safe Area (säkerhetsområde).

Dessa modifierare används för att styra hur vyer ser ut, så att gränssnittet blir tydligare och får bättre visuell struktur.

## Färger

I SwiftUI kan man ställa in textens färg.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

.blue betyder blått och är egentligen en förenklad skrivning av Color.blue genom typinferens.

Vanliga färger är till exempel:

```swift
.black
.green
.yellow
.pink
.gray
...
```

Alla dessa är statiska egenskaper hos Color.

![Color](../../RESOURCE/006_color.png)

Du kan tänka på Color som en färgtyp, där .blue och .red är konkreta färgvärden.

### Color-vyn

I SwiftUI kan Color också visas som en vy.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Den här koden skapar en röd kvadrat på 100 × 100.

Man kan också låta hela gränssnittet visas med en viss färg:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Efter körning ser man att det röda inte täcker hela skärmen. Överst och nederst på iPhone är det fortfarande vitt, och detta hänger ihop med Safe Area (säkerhetsområdet).

## Safe Area (säkerhetsområde)

Safe Area är det område som systemet reserverar för att undvika att innehåll täcks, inklusive:

1. statusfältet högst upp (tid, batteri)

2. Home-indikatorn längst ned

3. området för notch eller Dynamic Island

![Color](../../RESOURCE/006_color3.png)

SwiftUI begränsar som standard innehållet till säkerhetsområdet, så att vyn inte sträcker sig ända ut till skärmens kant.

### Ignorera Safe Area (säkerhetsområde)

Om du vill att färgen ska täcka hela skärmen kan du använda ignoresSafeArea:

```swift
Color.red
    .ignoresSafeArea()
```

Eller använda edgesIgnoringSafeArea:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Då kommer vyn att sträcka sig över hela skärmen.

Det är viktigt att notera att edgesIgnoringSafeArea är en äldre skrivning. Från och med iOS 14 rekommenderas ignoresSafeArea.

## Förgrundsfärg

### Modifieraren foregroundStyle

I tidigare lektioner har vi lärt oss att använda foregroundStyle för att sätta färg.

Till exempel:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

foregroundStyle är det nya stilsystemet och stöder färg, gradienter, material med mera.

![Color](../../RESOURCE/006_color2.png)

### Modifieraren foregroundColor

foregroundColor kan också användas för att sätta färg:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Det används på samma sätt som foregroundStyle.

I de senaste versionerna av Xcode visas en antydan om att foregroundColor eventuellt kan bli utfasad i framtida iOS-versioner, så det rekommenderas att i första hand använda foregroundStyle.

## Bakgrund

Om du vill lägga till en bakgrundsfärg till en vy kan du använda background:

```swift
background(.red)
```

Till exempel, lägg till en bakgrundsfärg till text:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

När vi markerar text i appar som Word eller Chrome kan vi se en liknande bakgrundsfärgseffekt.

![Color](../../RESOURCE/006_color16.png)

Om du vill göra bakgrunden större behöver du kombinera den med padding:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Här måste man förstå en viktig regel:

SwiftUI-modifierare bygger vyn uppifrån och ned. Modifierare som skrivs senare påverkar resultatet av det som skrevs tidigare.

Så:

```swift
.padding()
.background()
```

Det betyder att bakgrunden omsluter vyn efter att padding har lagts till.

Om ordningen skrivs tvärtom:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

kommer bakgrunden inte att bli större, eftersom bakgrunden inte omsluter den padding som kommer efteråt.

## Exempel - fyrkantig mutter

Nu ska vi skapa en enkel vy som ser ut som en fyrkantig mutter.

![Color](../../RESOURCE/006_color8.png)

Börja med att skapa en vit kvadrat på 50 × 50:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Om du vill göra den till en cirkel kan du använda cornerRadius:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

När hörnradien är lika med halva bredden och höjden blir formen en cirkel.

Lägg nu till en blå bakgrund:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Den tillagda padding utökar det yttre området, och background ritar blått på detta yttre område.

Nu har vi skapat effekten av en fyrkantig mutter.

### Ett annat sätt att tänka

Förutom att använda bakgrundsfärg för att skapa den fyrkantiga muttern kan man också använda ZStack.

Vi har tidigare lärt oss att ZStack kan användas för överlagring. En fyrkantig mutter kan också förstås som en cirkel som ligger ovanpå en rektangel.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

ZStack lägger vyer ovanpå varandra i ordning, där den senast tillagda vyn visas överst.

## Exempel - två överlappande cirklar

Många ikoner byggs upp av enkla former som läggs ovanpå varandra, till exempel två överlappande cirklar.

![Color](../../RESOURCE/006_color14.png)

Börja med att skapa två cirklar:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Eftersom vi vill att de två cirklarna ska överlappa används ZStack-layout:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Nu överlappar de två lika stora cirklarna helt.

Vi vill att de ska överlappa delvis i stället för att täcka varandra helt, och då kan vi använda offset för att skapa en förskjutningseffekt.

## Förskjutning

offset ändrar bara vyens ritposition och påverkar inte layoutberäkningen i föräldravyn.

Användning:

```swift
.offset(x:y:)
```

x är den horisontella förskjutningen och y är den vertikala förskjutningen.

Positiva värden betyder förskjutning åt höger eller nedåt, och negativa värden betyder åt vänster eller uppåt.

Använd offset för att få de två cirklarna att överlappa delvis:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Den röda cirkelns plats i layouten förändras inte, men dess ritposition flyttas 25 punkter åt vänster. Därför uppstår en visuell effekt där de två cirklarna överlappar delvis.

## Transparens

I SwiftUI används opacity för att ställa in en vys transparens.

Grundläggande användning:

```swift
.opacity(0.5)
```

Parametern för opacity ligger mellan 0.0 och 1.0, där:

* 0 betyder helt transparent
* 1 betyder helt ogenomskinlig

Du kan använda opacity för att ställa in transparensen för den orange cirkeln:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

När opacity för den orange cirkeln sätts till 0.8 blir dess ogenomskinlighet 80 %, och när de två cirklarna överlappar uppstår en blandningseffekt i det överlappande området.

## Oskärpa

I SwiftUI kan man använda blur för att skapa en oskärpeffekt:

```swift
.blur(radius:10)
```

radius definierar oskärpans radie. Ju större värdet är, desto tydligare blir oskärpan.

Vi kan lägga till oskärpa på de två cirklarna:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Till slut ser vi två mycket suddiga cirklar.

## Sammanfattning

Den här lektionen fokuserade på vanliga visuella modifierare i SwiftUI och gick igenom hur man med hjälp av modifierare kan styra vyers färg, position och visuella effekter.

Genom konkreta exempel kan man se hur olika visuella modifierare faktiskt påverkar gränssnittet, och vi har också lärt oss om säkerhetsområdet.

Allt detta är mycket grundläggande modifierare. Det är bra att öva på dem ofta, eftersom det hjälper oss att mer exakt styra gränssnittets utseende i verklig utveckling.

### Övningar efter lektionen

* Lägg till transparens och oskärpa på en bild
* Skapa tre överlappande cirklar med olika transparens
* Skapa en bakgrundsbild som fyller hela skärmen och ignorerar säkerhetsområdet
* Använd offset för att justera positionen på flera vyer

Målet med övningen är inte att memorera API:er, utan att observera sambandet mellan visuella förändringar och layoutbeteende.
