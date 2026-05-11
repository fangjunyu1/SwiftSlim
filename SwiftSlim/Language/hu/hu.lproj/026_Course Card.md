# Kurzus kártya

Ez a lecke egy szakaszos ismétlőlecke. Egy „kurzus kártyát” fogunk elkészíteni.

Ezzel a gyakorlattal átismételhetjük a korábban tanult `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` és más elemeket, valamint megtanuljuk, hogyan kombinálhatunk több kisebb nézetet egy teljes nézetmodullá.

A kurzus kártya eredménye:

![view](../../../Resource/026_view.png)

Ez a kurzus kártya főként több részből áll:

- Kurzus szintje: `Kezdő`
- Kurzus tartalma: `20+ lecke`
- Kurzus címe: `SwiftUI kezdőknek`
- Kurzus leírása
- Gomb: `Tanulás indítása`
- Kurzus háttere: Swift ikon és indigó háttér

Ezt a nézetet a `ContentView` felületen készíthetjük el.

## Felső terület

Először készítsük el a kurzus kártya felső területét.

![view](../../../Resource/026_view1.png)

A felső terület bal oldalán a kurzus szintje, jobb oldalán pedig a kurzus tartalma jelenik meg.

Mivel ez a két tartalom vízszintesen helyezkedik el, használhatunk `HStack` elemet.

```swift
var topView: some View {
    HStack {
        Text("Kezdő")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lecke")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Itt a felső területet egy számított tulajdonságra bontottuk:

```swift
var topView: some View
```

Ennek az az előnye, hogy a `body` tisztább marad.

A felső terület főként a következő elemeket használja:

- `HStack`: két szöveges nézetet vízszintesen rendez el.
- `Text`: szöveges tartalmat jelenít meg.
- `Spacer()`: a bal oldali szöveget balra, a jobb oldali szöveget jobbra tolja.
- `.font(.footnote)`: kisebb szövegstílust állít be.
- `.fontWeight(.bold)`: félkövérré teszi a szöveget.
- `.foregroundStyle(Color.white)`: az előtér színét fehérre állítja.
- `.padding(.vertical, 10)`: függőleges belső margót állít be.
- `.padding(.horizontal, 16)`: vízszintes belső margót állít be.
- `.background(Color.white.opacity(0.15))`: áttetsző fehér hátteret állít be.
- `.cornerRadius(20)`: beállítja a lekerekített sarkokat.

Itt a `Kezdő` két irányban használ `.padding()` módosítót:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Így a szöveg függőlegesen és vízszintesen is kap helyet, ezért inkább címkének tűnik.

A `Color.white.opacity(0.15)` `15%` átlátszatlanságú fehéret jelent, vagyis egy nagyon halvány fehéret.

### A kártyaháttér hozzáadása

Korábban létrehoztuk a `topView` nézetet, de egy nézet létrehozása önmagában még nem jeleníti meg azt automatikusan.

SwiftUI-ban a képernyőn ténylegesen megjelenő tartalmat a `body` elemben kell megírni.

Ezért először betehetjük a `topView` nézetet a `body` elembe, hogy megjelenjen:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Ekkor látható, hogy a felső terület már megjelent:

![view](../../../Resource/026_view2.png)

Mivel azonban a `topView` szövege fehér, az alapértelmezett háttér pedig szintén világos, világos módban nem biztos, hogy jól látható.

Ezért kívülre hozzáadhatunk egy `VStack` elemet, majd az egész területhez belső margót, háttérszínt és saroklekerekítést állíthatunk be:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view3.png)

Az itt látható `VStack` jelenleg csak egyetlen `topView` elemet tartalmaz, ezért elsőre feleslegesnek tűnhet.

Később azonban tovább fogjuk bővíteni a kurzus címével, a kurzus leírásával és a gomb területével. Ezek mind függőlegesen rendezett tartalmak, ezért itt előre használjuk a `VStack` elemet, hogy később könnyebb legyen folytatni a nézetek összeállítását.

Itt két `.padding()` módosító szerepel, és különböző feladatuk van.

Az első `.padding(20)` a `.background()` előtt áll:

```swift
.padding(20)
.background(Color.indigo)
```

Ez a kártya belső margóját szabályozza, vagyis a tartalom és a háttér széle közötti távolságot.

A második `.padding(30)` a `.background()` után áll:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Ez a kártya külső margóját szabályozza, vagyis a teljes kártya és a képernyő széle közötti távolságot.

![view](../../../Resource/026_view4.png)

Tehát bár mindkettő `.padding()`, eltérő helyre írva eltérő hatást eredményez.

## Tartalmi terület

Ezután készítsük el a kurzus kártya tartalmi területét.

Megjelenési eredmény:

![view](../../../Resource/026_view5.png)

A tartalmi terület a kurzus címét és a kurzus leírását tartalmazza. Ezek függőlegesen helyezkednek el, ezért `VStack` elemet használunk.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI kezdőknek")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Kezdd nulláról a SwiftUI tanulását, és ismerd meg rendszeresen az Apple deklaratív UI-fejlesztését. Világos magyarázatokon és gyakorlati példákon keresztül fokozatosan elsajátítod az elrendezést, az interakciót és az állapotkezelést, hogy szép és hasznos appfelületeket készíthess.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view6.png)

Ebben a `VStack` elemben két paramétert használunk:

```swift
VStack(alignment: .leading, spacing: 10)
```

Az `alignment: .leading` azt jelenti, hogy a `VStack` belső nézetei a kezdő élhez igazodnak.

A `spacing: 10` azt jelenti, hogy a `VStack` belső nézetei között `10 pt` távolság marad.

Így a kurzus címe és leírása a bal oldalról indul, és köztük bizonyos távolság marad.

A kurzus leírása viszonylag hosszú. Ha az egész megjelenne, a kártya nagyon magas lenne, ezért itt a `.lineLimit()` segítségével korlátozzuk a megjelenített sorok számát:

```swift
.lineLimit(3)
```

Ez azt jelenti, hogy legfeljebb `3` sor jelenik meg. Ha a tartalom túllépi a sorkorlátot, a többlet rész kimarad.

### A nézet balra igazítása

Itt még egy pontra érdemes figyelni.

A `VStack(alignment: .leading)` csak a `VStack` belső nézeteinek igazítását szabályozza. Nem szabályozza közvetlenül magának a `VStack` elemnek a helyzetét a külső tárolóban.

Például, ha a kurzus leírása viszonylag rövid:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI kezdőknek")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Csak néhány tartalom.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view7.png)

Látható, hogy bár a kurzus címe és leírása a `VStack` belsejében balra van igazítva, a teljes `VStack` nem igazodik a kártya bal széléhez.

Ennek az az oka, hogy amikor a tartalom rövid, a `VStack` szélessége is viszonylag keskeny lesz. Amikor a külső tároló elrendezi a tartalmát, ezt a keskenyebb `VStack` elemet középre helyezheti.

Úgy is érthetjük: a `VStack(alignment: .leading)` a belső balra igazításért felel.
De nem felel azért, hogy az egész tartalmi területet egészen balra tolja.

Ha azt szeretnénk, hogy a teljes tartalmi terület valóban balra igazodjon, kívülről becsomagolhatjuk egy `HStack` elembe, és hozzáadhatunk egy `Spacer()` elemet:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI kezdőknek")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Csak néhány tartalom.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view8.png)

Az itt használt `HStack` vízszintes elrendezés.

A `Spacer()` elfoglalja a jobb oldali fennmaradó helyet, így a bal oldali `VStack` elemet egészen balra tolja.

Ezért a `HStack + Spacer()` használható a teljes tartalmi terület helyzetének szabályozására.

A tényleges kurzus kártyában a kurzus leírása viszonylag hosszú, és általában nagyobb szélességet foglal el, ezért ez a probléma nem feltétlenül feltűnő. De fontos megérteni ezt a különbséget, mert rövid szöveges elrendezések készítésekor később gyakran találkozunk hasonló helyzettel.

### A belső nézetek közötti távolság szabályozása

Korábban a `VStack` elemben ezt írtuk: `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

A `spacing` a belső nézetek közötti távolság szabályozására szolgál.

Ha nem állítjuk be a `spacing` értékét, a `VStack` alapértelmezett térközt használ, de ez nem biztos, hogy megfelel a kívánt hatásnak.

Itt, ha a kurzus címe és leírása túl közel kerül egymáshoz, az elrendezés zsúfoltnak tűnik, ezért ezt használjuk:

```swift
spacing: 10
```

Így egy kis hely marad közöttük.

Megjelenési eredmény:

![view](../../../Resource/026_view9.png)

Hasonlóképpen, a felső terület és a tartalmi terület is függőlegesen helyezkedik el, ezért a `spacing` közöttük lévő távolság szabályozására is használható.

Most tegyük a `topView` és a `contentView` nézetet a `body` elembe:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view10.png)

Itt a `VStack(spacing: 20)` a `topView` és a `contentView` közötti távolságot szabályozza.

Más szóval:

```swift
VStack(alignment: .leading, spacing: 10)
```

A kurzus címe és a kurzus leírása közötti távolságot szabályozza.

```swift
VStack(spacing: 20)
```

A felső terület és a tartalmi terület közötti távolságot szabályozza.

Mindkettő `spacing`, de különböző `VStack` tárolókra hatnak, ezért az általuk befolyásolt tartomány is eltérő.

Ezzel a tartalmi terület nézete elkészült.

## Gombterület

Ezután készítsük el az alsó gombterületet.

Megjelenési eredmény:

![view](../../../Resource/026_view11.png)

A gombterület főként egy lejátszás ikonból és egy szövegből áll.

Az `Image` segítségével megjeleníthetjük a lejátszás ikont, a `Text` segítségével pedig a gomb szövegét.

Itt először készítsük el a gomb megjelenését:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("gomb megnyomva")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Tanulás indítása")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view12.png)

Itt két `HStack` tárolót használunk:

A belső `HStack` az ikon és a szöveg vízszintes elrendezésére szolgál:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Tanulás indítása")
}
```

A külső `HStack` a `Spacer()` elemmel együtt arra szolgál, hogy a gomb megjelenése balra igazodjon:

```swift
HStack {
    ...
    Spacer()
}
```

Amikor megérintjük a gombot, a konzol ezt írja ki: `gomb megnyomva`.

## Az alapkártya elkészült

Most kombináljuk a felső területet, a tartalmi területet és a gombterületet:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Megjelenési eredmény:

![view](../../../Resource/026_view13.png)

Eddigre egy alap kurzus kártya elkészült.

## Swift ikon háttér

Végül adjunk a kártyához egy áttetsző Swift ikon hátteret.

![view](../../../Resource/026_view.png)

Korábban a `Color.indigo` értéket használtuk háttérszínként. Valójában a `.background()` nemcsak színt, hanem egy teljes nézetet is hozzáadhat.

Ezért először létrehozhatunk egy külön háttérnézetet:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Ebben a háttérnézetben `VStack`, `HStack` és `Spacer()` elemeket használunk, hogy a Swift ikont a jobb alsó sarokba toljuk.

Mivel a Swift ikon csak dekoratív háttérként szolgál, itt áttetsző fehéret használunk:

```swift
Color.white.opacity(0.15)
```

Így az ikon nem lesz túl hangsúlyos, és nem zavarja az elöl lévő szöveges tartalmat.

Ezután adjuk hozzá a `backgroundView` nézetet a kártyához:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Végső eredmény:

![view](../../../Resource/026_view14.png)

Itt két `.background()` módosítót használunk egymás után:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Az első `.background()` a Swift ikon háttér hozzáadására szolgál.
A második `.background()` az indigó háttér hozzáadására szolgál.

Így a Swift ikon az indigó háttér fölött jelenik meg, és a kártya hátterének részeként látszik.

Ebből látható, hogy a `.background()` nemcsak színt, hanem egyéni nézetet is hozzáadhat. Több `.background()` módosító kombinálásával gazdagabb háttéreffektusokat is létrehozhatunk.

Ezzel a teljes kurzus kártya elkészült.

## Összegzés

Ebben a leckében egy kurzus kártyán keresztül átismételtük a SwiftUI gyakori alapvető elrendezési módszereit.

A `Text` elemmel szöveget jelenítettünk meg, az `Image` elemmel rendszerikont, a `VStack`, `HStack` és `Spacer()` elemekkel pedig a nézetek elrendezését szabályoztuk.

Megtanultuk a `.lineLimit()` használatát, amellyel korlátozható, hogy egy szöveg legfeljebb hány sorban jelenjen meg. Ha a tartalom túllépi a korlátot, a többlet rész kimarad.

Eközben átismételtük az olyan gyakori módosítókat is, mint a `.padding()`, `.background()`, `.cornerRadius()` és `.foregroundStyle()`.

A lecke elvégzése után már több kisebb nézetet is össze tudunk kombinálni egy teljes kártyamodullá.

Ez a SwiftUI-fejlesztésben is nagyon gyakori gondolkodásmód: először kisebb nézetekre bontjuk a felületet, majd ezekből állítjuk össze a teljes képernyőt.

## Teljes kód

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Kezdő")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lecke")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI kezdőknek")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Kezdd nulláról a SwiftUI tanulását, és ismerd meg rendszeresen az Apple deklaratív UI-fejlesztését. Világos magyarázatokon és gyakorlati példákon keresztül fokozatosan elsajátítod az elrendezést, az interakciót és az állapotkezelést, hogy szép és hasznos appfelületeket készíthess.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("gomb megnyomva")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Tanulás indítása")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
