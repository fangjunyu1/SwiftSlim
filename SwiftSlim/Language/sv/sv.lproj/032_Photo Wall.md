# Fotogalleri

I den här lektionen ska vi skapa en fotogallerisida.

![view](../../../Resource/032_view13.png)

I det här exemplet repeterar vi kunskaper om `extension`, `self` och instanser, och lär oss om vanliga `Shape`-former i SwiftUI.

Med dessa kunskaper kan vi beskära vanliga bilder till olika stilar, till exempel cirklar, rundade rektanglar, kapselformer och ellipser, och lägga till rameffekter på foton.

I den här lektionen använder vi flera nya begrepp: `Shape`, `clipShape`, `strokeBorder` och `overlay`.

Bland dem används `clipShape` för att beskära en vys form, `strokeBorder` för att rita en formram och `overlay` för att lägga en ny vy ovanpå den aktuella vyn.

## Bildresurser

Innan vi börjar behöver vi förbereda några bilder.

Du kan använda dina egna foton, eller använda exempelbilderna som tillhandahålls i den här lektionen.

Exempelfotona i den här lektionen kommer från webbplatsen [Pixabay](https://pixabay.com/):

[Landskap](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Räv](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Byggnad](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Blomma](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Svan](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

När bilderna har laddats ner lägger du till dem i resursmappen `Assets` och namnger dem i ordning som `1`, `2`, `3`, `4` och `5`.

![assets](../../../Resource/032_view17.png)

På så sätt kan vi visa bilderna i SwiftUI med `Image("1")`, `Image("2")` och så vidare.

## Visa foton

Först visar vi 5 foton i `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view.png)

I den här koden använder vi `ScrollView` för att göra fotolistan rullningsbar, och använder `VStack` för att placera flera bilder uppifrån och ned.

Varje bild använder `.resizable()`, `.scaledToFit()` och `.frame(width: 300)` för att ställa in visningseffekten, så att bilden kan skalas, behålla sina proportioner och begränsas i bredd.

`.padding(.vertical, 100)` på `VStack` används för att öka avståndet upptill och nedtill, så att det första och sista fotot inte hamnar för nära skärmens kanter.

Den sista `.ignoresSafeArea()` betyder att rullningsvyn ignorerar den säkra ytan, så att fotona kan sträcka sig till skärmens övre och nedre del vid rullning och sidan visas mer komplett.

Men just nu använder alla 5 bilder samma modifierare:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

När vi ser upprepad kod kan vi överväga att använda en `extension` för att organisera den.

## Använda extension för att organisera bildstilar

Vi kan utöka `Image` med en metod som är särskilt avsedd för fotogalleriet:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Här utökar vi typen `Image` med metoden `photoGalleryStyle`.

Den här metoden innehåller de tidigare upprepade `.resizable()`, `.scaledToFit()` och `.frame(width: 300)`. Med andra ord samlar den koden för bildskalning, proportionell visning och breddinställning på ett ställe.

Efter att vi har använt den här utökningen kan den ursprungliga bildkoden:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

förenklas till:

```swift
Image("1")
    .photoGalleryStyle()
```

På så sätt behöver varje bild bara anropa `.photoGalleryStyle()` för att använda samma fotogalleristil. Koden blir renare och det blir också enklare att ändra stilen enhetligt senare.

## Förstå self

I utökningsmetoden skrev vi `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Här representerar `self` den aktuella bildinstans som anropar den här metoden.

Till exempel:

```swift
Image("1")
    .photoGalleryStyle()
```

I den här koden anropas `photoGalleryStyle()` av `Image("1")`, så `self` inne i metoden representerar just den här `Image("1")`-bilden.

Du kan enkelt förstå det som: den som anropar metoden är det som `self` representerar.

Det är viktigt att notera att SwiftUI-modifierare hela tiden returnerar nya vyresultat. Därför returnerar `photoGalleryStyle()` en modifierad vy, inte bara den ursprungliga `Image` i sig.

## Fotoformer

Nu kan fotona redan visas normalt. Men som standard är dessa foton rektangulära, vilket ser ganska vanligt ut.

Om du bara vill ge fotona rundade hörn kan du direkt använda `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Visningsresultat:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` betyder att bilden får en hörnradie på `20 pt`. För vanliga bilder med rundade hörn räcker den här skrivningen redan.

Men `.cornerRadius()` kan bara hantera effekten med rundade hörn och passar för vanliga rundade bilder. Om vi vill göra foton till fler olika former räcker inte den här modifieraren ensam.

Då behöver vi använda `Shape` i SwiftUI. `Shape` kan representera olika former, och tillsammans med `clipShape` kan den beskära en bild till motsvarande form.

## Förstå Shape

I SwiftUI representerar `Shape` en form. Precis som `View` är det en mycket vanlig typ i SwiftUI.

Vanliga `Shape`-typer är cirklar, rektanglar, rundade rektanglar, kapselformer och ellipser. För att mer intuitivt kunna se hur olika former ser ut sätter exemplen nedan olika färger och storlekar för varje form.

I dessa exempel används `.fill()` för att fylla formen med färg, och `.frame()` används för att ställa in formens visningsstorlek. Färgerna används bara för att skilja olika former åt och är inte formens fasta färger.

### Circle cirkel

`Circle` representerar en cirkel. Den används ofta för avatarer, cirkulära knappar, cirkulära bilder och andra gränssnittseffekter.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rektangel

`Rectangle` representerar en rektangel. Den är en av de mest grundläggande formerna och kan också användas för att skapa bakgrunder, avdelade områden eller vanliga ramar.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle rundad rektangel

`RoundedRectangle` representerar en rundad rektangel. `cornerRadius` används för att ställa in hörnradien.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapselform

`Capsule` representerar en kapselform. Dess två ändar är bågformade, och den används ofta för kapselknappar, etikettbakgrunder och andra gränssnittseffekter.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellips

`Ellipse` representerar en ellips. Den liknar `Circle`, men när bredden och höjden är olika visas den som en ellips.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Genom dessa exempel kan vi se att `Shape` i sig kan visas direkt som en form. Därefter kommer vi att använda dessa `Shape`-typer tillsammans med `clipShape` för att beskära foton så att de visas i olika former.

## Använda clipShape för att beskära foton

Nu kan vi använda `clipShape` för att beskära foton till olika former.

Till exempel kan vi beskära det första fotot till en cirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Den här koden betyder: visa först en bild och använd sedan `Circle()` för att beskära den till en cirkel.

![view](../../../Resource/032_view2.png)

Den grundläggande skrivningen för `clipShape` är:

```swift
.clipShape(form)
```

Lägg till `.clipShape(...)` efter vyn och ange den form som vyn ska beskäras till inom parenteserna.

Till exempel:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Nu beskär vi de 5 fotona till olika former:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view8.png)

Bland dem blir resultatet efter beskärning med `Rectangle()` nära ett vanligt rektangulärt foto, så den visuella förändringen är inte tydlig. Det används främst för jämförelse med andra former.

Nu är fotona inte längre bara vanliga rektanglar, utan har olika former.

## Lägga till fotoramar

Om vi vill lägga till en ram på ett cirkulärt foto kan vi kanske tänka på att använda `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Men då får vi oftast inte en cirkulär ram, utan en rektangulär ram.

![view](../../../Resource/032_view9.png)

Det beror på att `border` lägger till en ram utifrån vyns rektangulära område, inte utifrån formen efter beskärning med `clipShape`.

Därför kan vi inte direkt använda `border` om vi vill ha en cirkulär ram.

## Använda strokeBorder för att rita formramar

I SwiftUI kan `strokeBorder` rita inre ramar för dessa vanliga `Shape`-typer.

Till exempel kan vi rita en cirkulär ram:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Den här koden betyder: rita en brun ram för `Circle`, med rambredden `10 pt`.

![view](../../../Resource/032_view12.png)

Här behöver vi notera att `strokeBorder` inte direkt lägger till en ram på fotot. I stället ritar den en ram för formen `Circle()`.

Med andra ord skapar den här koden bara en fristående cirkulär ram, och den har ännu ingen relation till fotot.

Om vi vill att den här cirkulära ramen ska visas ovanpå fotot behöver vi fortsätta använda `overlay` och lägga ramen ovanpå fotot.

## Använda overlay för att lägga på ramar

`overlay` är en vymodifierare som kan lägga en ny vy ovanpå den aktuella vyn.

Dess grundläggande struktur kan förstås som:

```swift
Aktuell vy
    .overlay {
        Överlagrad vy
    }
```

I det här exemplet är den aktuella vyn fotot som redan har beskurits till en cirkel:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Den nya vy som vi vill lägga ovanpå är en cirkulär ram:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Därför kan vi kombinera fotot och ramen:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Här betyder `overlay` att en ny vy läggs ovanpå den aktuella vyn.

I `overlay` läggs ramen ovanpå enligt det aktuella fotots visningsområde, så det behövs ingen separat `frame`. Så länge ramformen stämmer överens med beskärningsformen kan ramen passa fotot.

![view](../../../Resource/032_view10.png)

Slutresultatet är att en cirkulär ram ligger ovanpå det cirkulära fotot.

Jämfört med `ZStack` passar `overlay` bättre för den här typen av scenario där man "lägger till dekoration på den aktuella vyn". Fotot är huvudobjektet, och ramen är bara en extra effekt, så det blir tydligare att använda `overlay`.

## Slutföra fotogalleriet

Nu lägger vi till motsvarande form och ram på varje foto:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Visningsresultat:

![view](../../../Resource/032_view13.png)

På så sätt är en grundläggande fotogallerisida färdig.

På den här sidan använder vi `ScrollView` för att skapa rullningsbar visning, `Image` för att visa foton, `clipShape` för att beskära fotoformer och `overlay` tillsammans med `strokeBorder` för att lägga till ramar.

## Komplett kod

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Sammanfattning

I den här lektionen färdigställde vi en fotogallerisida.

![view](../../../Resource/032_view13.png)

I det här exemplet använde vi först `Image` för att visa foton, och utökade sedan `Image` med metoden `photoGalleryStyle` genom `extension` för att organisera upprepad kod för bildstilar.

Därefter lärde vi oss om vanliga `Shape`-typer i SwiftUI, till exempel `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` och `Ellipse`. Dessa former kan inte bara visas direkt, utan kan också användas tillsammans med `clipShape` för att beskära vyer.

Till exempel:

```swift
.clipShape(Circle())
```

betyder att vyn beskärs till en cirkel.

Till sist använde vi `overlay` och `strokeBorder` för att lägga till ramar med motsvarande form på fotona. Det är viktigt att notera att `border` vanligtvis ritar en ram enligt vyns rektangulära område. Om du vill att ramen ska följa en cirkel, kapselform eller ellips passar det bättre att lägga ovanpå samma `Shape`.

Genom den här lektionen färdigställde vi inte bara fotogallerieffekten, utan förstod också den vanliga kombinationen av `Shape`, `clipShape`, `strokeBorder` och `overlay` i gränssnitt.

## Övningar efter lektionen

### 1. Lägg till en bakgrund för fotogalleriet

Lägg till en helskärmsbakgrundsbild på fotogallerisidan.

Krav: Bakgrundsbilden ska kunna fylla hela skärmen och ignorera den säkra ytan.

### 2. Gradientram

Ändra de befintliga enfärgade ramarna till linjära gradientramar.

Du kan prova att använda `LinearGradient` för att skapa rikare rameffekter.

### 3. Simulerad fotoram

Sök på nätet efter några verkliga fotoramsstilar och försök använda `overlay` för att lägga på bildramar, så att fotona ser mer ut som riktiga tavelramar.

Visningsresultat för övningen:

![button](../../../Resource/032_view15.jpeg)

### 4. Skapa en rundad knappkant

I faktisk utveckling använder knappar ofta rundade rektangelramar.

Försök skapa en rundad knapp och använd `RoundedRectangle` och `strokeBorder` för att lägga till en rundad ram på knappen.

Visningsresultat för övningen:

![button](../../../Resource/032_view14.png)

### Tankefråga

Om du inte vill använda en enfärgad ram och inte heller en gradientram, utan vill att ramen ska visa någon form av mönstereffekt, hur bör det implementeras?

Du kan försöka söka information och lära dig om relaterade användningar som `overlay`, `mask` eller `ImagePaint`.

Visningsresultat för övningen:

![button](../../../Resource/032_view16.png)
