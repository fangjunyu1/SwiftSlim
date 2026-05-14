# Anpassad View

I den här lektionen ska vi lära oss ett mycket viktigt sätt att skriva SwiftUI: **anpassad View**.

En anpassad View kan kapsla in ett stycke upprepad vy-kod och göra det till en View som kan användas om och om igen.

När vi utvecklar en App i praktiken stöter vi ofta på den här situationen: många gränssnitt har samma struktur, men innehållet som visas är olika.

Till exempel kan varje inlägg i en inläggslista på ett forum ha information som titel, bild och antal gillningar.

![Reddit](../../../Resource/028_view1.png)

I en produktlista på en shoppingwebbplats kan varje produkt ha information som bild, namn och pris.

![Amazon](../../../Resource/028_view2.png)

Strukturen för dessa innehåll är liknande; skillnaden är bara att de data som visas är olika.

Om vi skriver koden för varje objekt manuellt blir koden väldigt lång, och den blir inte heller smidig att ändra senare.

Därför kan vi kapsla in den gemensamma strukturen i en anpassad View och sedan skicka in det olika innehållet som parametrar.

På så sätt kan samma View visa olika innehåll.

## Kravscenario

Till exempel ska vi nu skapa en inställningslista.

Visningsresultat:

![view](../../../Resource/028_view.png)

I den här inställningslistan finns tre olika inställningsobjekt: `Inställningar`, `Mapp` och `Musik`.

Även om deras ikoner, färger och titlar är olika, är den övergripande strukturen densamma:

- Ikon till vänster
- Bakgrundsfärg för ikonen
- Titel i mitten
- Pil till höger

Om vi inte använder en anpassad View kan vi skriva så här:

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

                Text("Inställningar")
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

                Text("Mapp")
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

Den här koden kan visas korrekt, men problemet är också mycket tydligt: koden för de tre inställningsobjekten är nästan helt likadan.

Det som skiljer sig åt är bara ikon, färg och titel:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Inställningar")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Mapp")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musik")
```

Med andra ord är strukturen för varje inställningsobjekt fast; det är bara ikon, färg och titel som är olika.

Den här situationen passar därför mycket bra för en anpassad View.

### Skugga shadow

Här används en ny modifierare, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` kan lägga till en skugga på en View.

`radius` anger skuggans oskärperadie. Ju större värde, desto större blir skuggans spridningsområde vanligtvis, och den ser också mjukare ut.

Här är värdet satt till `1`, vilket betyder att vi bara lägger till en mycket lätt skuggeffekt.

## Kapsla in inställningsobjektets View

Nästa steg är att kapsla in varje inställningsobjekt i en ny View.

Vi kan skapa en `SettingItemView`:

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

I den här View definierar vi tre egenskaper:

```swift
let icon: String
let color: Color
let title: String
```

Där:

- `icon` anger ikonens namn
- `color` anger ikonens bakgrundsfärg
- `title` anger inställningsobjektets titel

Eftersom dessa tre innehåll skiljer sig mellan olika inställningsobjekt gör vi dem till parametrar som kan skickas in utifrån.

## Använda en anpassad View

När vi har `SettingItemView` behöver vi inte längre skriva ett långt stycke `HStack`-kod upprepade gånger.

Nu kan vi använda den så här:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")
```

Den här kodraden betyder att vi skapar en View för ett inställningsobjekt och skickar in tre parametrar:

```swift
icon: "gear"
color: Color.blue
title: "Inställningar"
```

Efter att de har skickats in får egenskaperna inuti `SettingItemView` motsvarande värden:

- värdet för `icon` är `gear`
- värdet för `color` är `Color.blue`
- värdet för `title` är `"Inställningar"`

Därför visar `Image(systemName: icon)` inuti View en kugghjulsikon, `.background(color)` använder blå bakgrund och `Text(title)` visar `Inställningar`.

Fullständig kod:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Mapp")

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

Visningsresultat:

![view](../../../Resource/028_view.png)

Som du kan se är visningsresultatet detsamma som tidigare efter inkapslingen, men koden har blivit tydligare.

Tidigare behövde varje inställningsobjekt skriva ett helt stycke `HStack`; nu behövs bara en rad kod:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")
```

Detta är rollen för en anpassad View: **att kapsla in en upprepad View-struktur och bara skicka in det olika innehållet som parametrar.**

## Varför det går att skicka parametrar

Nästa steg är att enkelt förstå varför en anpassad View kan ta emot parametrar.

I SwiftUI är en View i grunden en struktur.

Till exempel:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hej, världen!")
    }
}
```

Här är `ContentView` en struktur.

När vi skriver:

```swift
ContentView()
```

skapar vi egentligen en `ContentView`-View.

De efterföljande `()` betyder att vi anropar dess initialiseringsmetod; det kan också förstås som att vi skapar denna View.

Eftersom denna `ContentView` inte har några egenskaper som behöver skickas in utifrån kan vi skriva direkt:

```swift
ContentView()
```

Men om en View har en egenskap utan tilldelat värde måste vi skicka in motsvarande värde när vi skapar View.

Till exempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("namn: \(name)")
    }
}
```

Här är `name` en egenskap, och den har inget standardvärde.

Därför måste vi ge `name` ett konkret värde när vi skapar `ContentView`:

```swift
ContentView(name: "Fang Junyu")
```

Då kan View använda detta värde internt:

```swift
Text("namn: \(name)")
```

Detta är också anledningen till att vi måste skicka in parametrar när vi skapar `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")
```

Eftersom `SettingItemView` har tre egenskaper utan standardvärden:

```swift
let icon: String
let color: Color
let title: String
```

När vi skapar denna View måste vi alltså skicka in dem. De parametrar som skickas in används av Swift för att tilldela värden till egenskaperna inuti View.

## Initialiseringsmetod

Nästa steg är att förstå initialiseringsmetoden lite mer.

### Standardinitialiseringsmetod

När vi definierar en vanlig View:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hej, världen!")
    }
}
```

I den här koden har vi inte skrivit någon initialiseringsmetod manuellt.

Men när vi använder denna View kan vi skriva så här:

```swift
ContentView()
```

Här betyder `()` egentligen att vi skapar `ContentView`; det kan också förstås som att vi anropar dess initialiseringsmetod.

### Varför går det att anropa den även om ingen initialiseringsmetod syns?

Det beror på att Swift-kompilatorn automatiskt hjälper oss att skapa en initialiseringsmetod.

Det är viktigt att notera: **denna initialiseringsmetod skapas automatiskt, och vi ser den vanligtvis inte direkt i koden.**

Det vill säga, även om vi inte manuellt skriver detta i `struct`:

```swift
init() {

}
```

kommer Swift-kompilatorn bakom kulisserna att skapa en ungefär sådan initialiseringsmetod åt oss:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Hej, världen!")
    }
}
```

Det är därför vi kan skriva direkt:

```swift
ContentView()
```

Därför behöver vi i faktisk kod vanligtvis inte skriva ut initialiseringsmetoden manuellt.

Vi behöver bara förstå en sak: **när en SwiftUI View skapas anropas View:ns initialiseringsmetod. Även om vi inte skriver en initialiseringsmetod manuellt kan Swift automatiskt skapa en åt oss.**

### Initialiseringsmetod med parametrar

Om en View har en egenskap utan standardvärde, till exempel:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("namn: \(name)")
    }
}
```

skapar Swift-kompilatorn automatiskt en initialiseringsmetod med parametrar baserat på egenskapen.

Det kan enkelt förstås som:

```swift
init(name: String) {
    self.name = name
}
```

Här:

```swift
init(name: String)
```

betyder att när vi skapar `ContentView` måste vi skicka in en `name`-parameter av typen `String`.

När vi skriver:

```swift
ContentView(name: "Fang Junyu")
```

betyder det: skicka `"Fang Junyu"` som parameter till initialiseringsmetoden.

Sedan körs följande inuti initialiseringsmetoden:

```swift
self.name = name
```

Den här kodraden betyder: tilldela det `name` som skickats in utifrån till den aktuella View:ns egen `name`-egenskap.

Det kan enkelt förstås som:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("namn: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

På så sätt kan View använda det inskickade värdet internt.

Detta är initialiseringsflödet för en View med parametrar: **när en egenskap i View inte har något standardvärde måste motsvarande parameter skickas in när View skapas, så att initialiseringsmetoden kan slutföra tilldelningen av egenskapen.**

## När en egenskap har ett standardvärde

Om en egenskap redan har ett standardvärde behöver vi inte skicka in någon parameter när vi skapar View.

Till exempel:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("namn: \(name)")
    }
}
```

Här har `name` redan ett standardvärde:

```swift
"Fang Junyu"
```

Därför kan vi skapa `ContentView` genom att skriva direkt:

```swift
ContentView()
```

Då använder `name` standardvärdet, och gränssnittet visar:

```swift
namn: Fang Junyu
```

Självklart kan vi också skicka in ett nytt värde när vi skapar View:

```swift
ContentView(name: "Sam")
```

Då använder View `"Sam"` som skickats in utifrån, i stället för standardvärdet, och gränssnittet visar:

```swift
namn: Sam
```

För att göra det lättare att förstå kan vi förenklat betrakta den initialiseringsmetod som Swift-kompilatorn skapar automatiskt som:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Här betyder `name: String = "Fang Junyu"`: om inget `name` skickas in när View skapas, används standardvärdet `"Fang Junyu"`; om ett nytt `name` skickas in när View skapas, används det inskickade värdet.

Med andra ord: **om ingen parameter skickas in utifrån används egenskapens standardvärde; om en parameter skickas in utifrån används det inskickade värdet.**

## Tillbaka till SettingItemView

Nu går vi tillbaka och tittar på SettingItemView:

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

Strukturen för denna View är fast.

De fasta delarna omfattar:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

De delar som skiljer sig åt omfattar:

```swift
icon
color
title
```

Därför gör vi det olika innehållet till egenskaper och skickar in dem som parametrar när vi skapar View.

När vi skapar olika inställningsobjekt behöver vi bara skicka in olika parametrar:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")
SettingItemView(icon: "folder", color: Color.brown, title: "Mapp")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musik")
```

På så sätt kan samma `SettingItemView` visa tre olika inställningsobjekt.

Detta är det vanligaste sättet att använda en anpassad View.

## Sammanfattning

I den här lektionen har vi lärt oss om anpassade Views.

Den centrala rollen för en anpassad View är: **att kapsla in upprepad vy-kod så att den kan återanvändas.**

I det här exemplet har de tre inställningsobjekten samma struktur; endast ikon, färg och titel skiljer sig åt.

Därför skapade vi en `SettingItemView`:

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

Sedan skickar vi in olika parametrar när vi använder denna View:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Inställningar")
```

Parametrarna här går in i `SettingItemView`.

På det här sättet kan vi med mindre kod skapa Views som har samma struktur men olika innehåll.

Detta är också ett mycket vanligt sätt att skriva kod i SwiftUI-utveckling.
