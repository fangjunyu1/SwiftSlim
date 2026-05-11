# Targeta del curs

Aquesta lliçó és una classe de revisió per etapes. Completarem una “targeta del curs”.

Amb aquest exercici, podem repassar `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` i altres continguts apresos abans, i també aprendrem com combinar diverses vistes petites en un mòdul de vista complet.

Efecte de la targeta del curs:

![view](../../../Resource/026_view.png)

Aquesta targeta del curs conté principalment diverses parts:

- Nivell del curs: `Beginner`
- Contingut del curs: `20+ Lessons`
- Títol del curs: `SwiftUI Beginner Tutorial`
- Descripció del curs
- Botó: `Start Learning`
- Fons del curs: icona de Swift i fons de color indi

Podem completar aquesta vista dins de `ContentView`.

## Àrea superior

Primer, creem l’àrea superior de la targeta del curs.

![view](../../../Resource/026_view1.png)

A la part esquerra de l’àrea superior es mostra el nivell del curs, i a la part dreta es mostra el contingut del curs.

Com que aquests dos continguts es disposen horitzontalment, podem utilitzar `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Principiant")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lliçons")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Aquí hem separat l’àrea superior en una propietat calculada:

```swift
var topView: some View
```

El benefici de fer-ho és que pot deixar `body` més clar.

L’àrea superior utilitza principalment aquests elements:

- `HStack`: fa que els dos textos es disposin horitzontalment.
- `Text`: mostra contingut de text.
- `Spacer()`: empeny el text de l’esquerra cap a l’esquerra i el text de la dreta cap a la dreta.
- `.font(.footnote)`: estableix un estil de text més petit.
- `.fontWeight(.bold)`: estableix el text en negreta.
- `.foregroundStyle(Color.white)`: estableix el color de primer pla en blanc.
- `.padding(.vertical, 10)`: estableix el farciment superior i inferior.
- `.padding(.horizontal, 16)`: estableix el farciment esquerre i dret.
- `.background(Color.white.opacity(0.15))`: estableix un fons blanc semitransparent.
- `.cornerRadius(20)`: estableix les cantonades arrodonides.

Aquí `Beginner` utilitza `.padding()` en dues direccions:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Això permet que el text tingui espai a dalt, a baix, a l’esquerra i a la dreta, i faci més la impressió d’una etiqueta.

`Color.white.opacity(0.15)` representa un blanc amb una opacitat del `15%`, és a dir, un blanc molt suau.

### Afegir el fons de la targeta

Abans hem creat `topView`, però crear una vista no fa que es mostri automàticament.

A SwiftUI, el contingut que realment es mostra a la interfície s’ha d’escriure dins de `body`.

Per tant, primer podem posar `topView` dins de `body` per mostrar-la:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

En aquest moment veurem que l’àrea superior ja s’ha mostrat:

![view](../../../Resource/026_view2.png)

Tanmateix, com que el text de `topView` és blanc i el fons predeterminat també és clar, en mode clar potser no es veu gaire bé.

Per això, podem afegir un `VStack` a la capa exterior, i després establir el farciment, el color de fons i les cantonades arrodonides de tota l’àrea:

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

Efecte de visualització:

![view](../../../Resource/026_view3.png)

Aquest `VStack` ara només conté un `topView`, així que sembla que no sigui imprescindible.

Però més endavant continuarem afegint el títol del curs, la descripció del curs i l’àrea del botó. Tots són continguts disposats verticalment, així que utilitzar aquí `VStack` amb antelació facilita continuar combinant vistes després.

Aquí hi ha dos `.padding()`, i tenen funcions diferents.

El primer `.padding(20)` s’escriu abans de `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Controla el marge intern de la targeta, és a dir, la distància entre el contingut i la vora del fons.

El segon `.padding(30)` s’escriu després de `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Controla el marge extern de la targeta, és a dir, la distància entre tota la targeta i les vores de la pantalla.

![view](../../../Resource/026_view4.png)

Per tant, encara que tots dos siguin `.padding()`, si s’escriuen en posicions diferents, l’efecte també serà diferent.

## Àrea de contingut

A continuació, creem l’àrea de contingut de la targeta del curs.

Efecte de visualització:

![view](../../../Resource/026_view5.png)

L’àrea de contingut inclou el títol del curs i la descripció del curs. Com que es disposen verticalment, fem servir `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial per a principiants de SwiftUI")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Comença des de zero amb SwiftUI i aprèn sistemàticament el desenvolupament declaratiu d’interfícies d’Apple. Amb explicacions clares i exemples pràctics, dominaràs gradualment la disposició, la interacció i la gestió d’estat per crear interfícies d’app boniques i útils.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efecte de visualització:

![view](../../../Resource/026_view6.png)

Aquest `VStack` utilitza dos paràmetres:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` indica que les vistes internes de `VStack` s’alineen a l’esquerra.

`spacing: 10` indica que les vistes internes de `VStack` mantenen una separació de `10 pt`.

Per tant, el títol del curs i la descripció del curs començaran a disposar-se des de l’esquerra, i entre ells es conservarà una certa distància.

La descripció del curs és relativament llarga. Si es mostrés sencera, la targeta es faria molt alta, així que aquí fem servir `.lineLimit()` per limitar el nombre de línies mostrades:

```swift
.lineLimit(3)
```

Això indica que es mostren com a màxim `3` línies. Quan el contingut supera el límit de línies, la part que sobra s’omet.

### Alinear la vista a l’esquerra

Aquí també cal fixar-se en un punt.

`VStack(alignment: .leading)` només pot controlar l’alineació de les vistes internes de `VStack`; no controla directament la posició del mateix `VStack` dins del contenidor exterior.

Per exemple, si la descripció del curs és relativament curta:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial per a principiants de SwiftUI")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Només una mica de contingut.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efecte de visualització:

![view](../../../Resource/026_view7.png)

Es pot veure que, tot i que el títol del curs i la descripció del curs estan alineats a l’esquerra dins de `VStack`, tot el `VStack` no s’ha enganxat al costat esquerre de la targeta.

Això és perquè, quan el contingut és relativament curt, l’amplada de `VStack` també serà relativament estreta. Quan el contenidor exterior fa la disposició, pot col·locar aquest `VStack` més estret al centre.

Es pot entendre així: `VStack(alignment: .leading)` s’encarrega de l’alineació interna a l’esquerra.
Però no s’encarrega d’empènyer tota l’àrea de contingut cap al costat més esquerre.

Si volem que tota l’àrea de contingut quedi realment a l’esquerra, podem embolicar-la amb una altra capa de `HStack` i afegir-hi `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial per a principiants de SwiftUI")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Només una mica de contingut.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efecte de visualització:

![view](../../../Resource/026_view8.png)

Aquí `HStack` és una disposició horitzontal.

`Spacer()` ocuparà l’espai restant de la dreta, i així empenyerà el `VStack` de l’esquerra cap al costat més esquerre.

Per tant, `HStack + Spacer()` es pot utilitzar per controlar la posició de tota l’àrea de contingut.

En una targeta del curs real, la descripció del curs és relativament llarga i normalment ocuparà més amplada, de manera que aquest problema potser no és gaire evident. Però entendre aquesta diferència és important, perquè quan més endavant fem disposicions amb textos curts, sovint trobarem situacions semblants.

### Controlar la distància entre les vistes internes

Abans hem escrit `spacing: 10` dins de `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` s’utilitza per controlar la distància entre les vistes internes.

Si no establim `spacing`, `VStack` també tindrà una separació predeterminada, però aquesta separació predeterminada no sempre coincideix amb l’efecte que volem.

Aquí, si el títol del curs i la descripció del curs estan massa a prop, es veurà atapeït, així que utilitzem:

```swift
spacing: 10
```

per deixar-hi una mica d’espai.

Efecte de visualització:

![view](../../../Resource/026_view9.png)

De la mateixa manera, l’àrea superior i l’àrea de contingut també estan disposades verticalment, i també podem utilitzar `spacing` per controlar la distància entre elles.

Ara, posem `topView` i `contentView` dins de `body`:

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

Efecte de visualització:

![view](../../../Resource/026_view10.png)

Aquí `VStack(spacing: 20)` controla la distància entre `topView` i `contentView`.

És a dir:

```swift
VStack(alignment: .leading, spacing: 10)
```

controla la distància entre el títol del curs i la descripció del curs.

```swift
VStack(spacing: 20)
```

controla la distància entre l’àrea superior i l’àrea de contingut.

Tots dos són `spacing`, però actuen sobre `VStack` diferents, així que l’abast que afecten també és diferent.

Així, la vista de l’àrea de contingut queda completada.

## Àrea del botó

A continuació, creem l’àrea inferior del botó.

Efecte de visualització:

![view](../../../Resource/026_view11.png)

L’àrea del botó està composta principalment per una icona de reproducció i un fragment de text.

Podem utilitzar `Image` per mostrar la icona de reproducció i `Text` per mostrar el text del botó.

Aquí primer creem l’aspecte d’un botó:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("botó premut")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Comença a aprendre")
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

Efecte de visualització:

![view](../../../Resource/026_view12.png)

Aquí hem utilitzat dos `HStack`:

L’`HStack` interior s’utilitza per disposar horitzontalment la icona i el text:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Comença a aprendre")
}
```

L’`HStack` exterior, juntament amb `Spacer()`, s’utilitza perquè aquest aspecte de botó es mostri alineat a l’esquerra:

```swift
HStack {
    ...
    Spacer()
}
```

Quan premem el botó, la consola mostrarà `botó premut`.

## Targeta bàsica completada

Ara combinem l’àrea superior, l’àrea de contingut i l’àrea del botó:

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

Efecte de visualització:

![view](../../../Resource/026_view13.png)

Fins aquí, ja hem completat una targeta del curs bàsica.

## Fons amb icona de Swift

Finalment, afegim a la targeta un fons amb una icona de Swift semitransparent.

![view](../../../Resource/026_view.png)

Abans hem utilitzat `Color.indigo` com a color de fons. En realitat, `.background()` no només pot afegir un color, sinó que també pot afegir una vista completa.

Per això, primer podem crear una vista de fons específica:

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

En aquesta vista de fons, utilitzem `VStack`, `HStack` i `Spacer()` per empènyer la icona de Swift cap a la cantonada inferior dreta.

Com que la icona de Swift només serveix com a fons decoratiu, aquí hem utilitzat un blanc semitransparent:

```swift
Color.white.opacity(0.15)
```

Així la icona no serà massa evident i tampoc afectarà el contingut de text del davant.

Després, afegim `backgroundView` a la targeta:

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

Efecte aconseguit:

![view](../../../Resource/026_view14.png)

Aquí hem utilitzat dos `.background()` seguits:

```swift
.background(backgroundView)
.background(Color.indigo)
```

El primer `.background()` s’utilitza per afegir el fons amb la icona de Swift.
El segon `.background()` s’utilitza per afegir el fons de color indi.

D’aquesta manera, la icona de Swift es mostrarà per sobre del fons de color indi i formarà part del fons de la targeta.

A partir d’aquí es pot veure que `.background()` no només pot afegir colors, sinó també vistes personalitzades. Diversos `.background()` també es poden combinar per aconseguir efectes de fons més rics.

Fins aquí, una targeta del curs completa queda acabada.

## Resum

En aquesta lliçó, mitjançant una targeta del curs, hem repassat formes bàsiques de disposició comunes en SwiftUI.

Hem utilitzat `Text` per mostrar text, `Image` per mostrar icones del sistema, i `VStack`, `HStack` i `Spacer()` per controlar la disposició de les vistes.

Hem après `.lineLimit()`, que pot limitar el nombre màxim de línies que mostra un text. Quan el contingut supera el límit, la part excedent s’omet.

Al mateix temps, també hem repassat modificadors comuns com `.padding()`, `.background()`, `.cornerRadius()` i `.foregroundStyle()`.

Després de completar aquesta lliçó, ja podem combinar diverses vistes petites en un mòdul de targeta complet.

Aquesta també és una manera de pensar molt habitual en el desenvolupament amb SwiftUI: primer dividir en vistes petites i després combinar-les en una interfície completa.

## Codi complet

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
            Text("Principiant")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lliçons")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial per a principiants de SwiftUI")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Comença des de zero amb SwiftUI i aprèn sistemàticament el desenvolupament declaratiu d’interfícies d’Apple. Amb explicacions clares i exemples pràctics, dominaràs gradualment la disposició, la interacció i la gestió d’estat per crear interfícies d’app boniques i útils.")
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
    	        print("botó premut")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Comença a aprendre")
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
