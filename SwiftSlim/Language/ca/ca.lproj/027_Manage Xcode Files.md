# Gestionar fitxers de Xcode

En aquesta lliçó, aprendrem les operacions de fitxers més habituals a Xcode.

En les lliçons anteriors, hem escrit la major part del codi dins de `ContentView`. Això facilita observar el codi i l’efecte visual.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Però en una App real, normalment no escrivim tot el codi en un sol fitxer.

Quan hi ha cada vegada més pantalles, components i funcions, hem de separar les diferents vistes en diferents fitxers SwiftUI.

Per exemple:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Això pot fer que l’estructura del codi sigui més clara, i també facilita el manteniment i les modificacions posteriors.

## Per què cal gestionar els fitxers

A SwiftUI, una pantalla o un component normalment es pot escriure com un fitxer de vista independent.

Per exemple:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Aquí, `CardView` és una vista SwiftUI.

Si totes les vistes s’escriuen dins de `ContentView`, el codi serà cada vegada més llarg i també més difícil de llegir.

Per això, hem d’aprendre a crear, canviar el nom i eliminar fitxers, i també a utilitzar carpetes per gestionar diferents fitxers de codi.

## Crear un fitxer SwiftUI

A Xcode, hi ha dues maneres habituals de crear un fitxer SwiftUI:

Una és crear un fitxer buit i després escriure el codi nosaltres mateixos.

L’altra és crear un fitxer de plantilla SwiftUI, i deixar que Xcode generi automàticament el codi bàsic.

Per als principiants, és més recomanable utilitzar un fitxer de plantilla SwiftUI, perquè genera automàticament l’estructura bàsica.

### Crear un fitxer buit

A la zona Navigator de l’esquerra de Xcode, fes clic amb el botó dret en una zona buida o en una carpeta, i tria `New Empty File`.

La posició de l’operació és la següent:

![xcode](../../../Resource/027_view1.png)

Després de crear un fitxer buit, Xcode normalment generarà un fitxer Swift sense nom, com ara `Untitled.swift`.

El podem canviar de nom a `TestView.swift`.

En un projecte SwiftUI, si aquest fitxer s’utilitza per mostrar una vista, normalment es recomana afegir `View` al final del nom.

Per exemple:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Això no és una norma obligatòria, però ens permet veure d’un cop d’ull que és un fitxer de vista.

Després de crear un fitxer buit, el fitxer pot contenir només comentaris predeterminats, o bé pot estar buit, segons la versió de Xcode i la manera de creació.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

En aquest moment, hem d’escriure manualment el codi SwiftUI:

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

D’aquesta manera, ja s’ha creat un fitxer de vista SwiftUI senzill.

### Canviar el nom d’un fitxer

Si després de crear un fitxer vols modificar-ne el nom, pots seleccionar el fitxer a la zona Navigator de l’esquerra de Xcode i prémer la tecla de retorn `⏎`.

![xcode](../../../Resource/027_view2.png)

Així pots modificar el nom del fitxer.

Cal tenir en compte que canviar el nom del fitxer no modifica automàticament el nom de la vista dins del codi.

Per exemple, després de canviar el nom del fitxer a `ProfileView.swift`, al codi encara podria aparèixer `struct TestView: View`.

Encara que això no sempre provoca un error, és fàcil que generi confusió.

Per tant, es recomana mantenir coherents el nom del fitxer i el nom de la vista. Per exemple, si el nom del fitxer és `ProfileView.swift`, el nom de la vista també hauria de ser `ProfileView`.

## Crear un fitxer de plantilla SwiftUI

A més de crear un fitxer buit, també podem crear directament un fitxer de plantilla SwiftUI.

A la zona Navigator de l’esquerra de Xcode, fes clic amb el botó dret en una zona buida o en una carpeta, i tria `New File from Template...`.

La posició de l’operació és la següent:

![xcode](../../../Resource/027_view3.png)

A la finestra emergent, a la part superior es poden seleccionar diferents plataformes, com ara `iOS`, `macOS`, etc.

Aquí podem mantenir seleccionada la plataforma corresponent al projecte actual. Per exemple, si estem creant una App iOS, triem `iOS`.

![xcode](../../../Resource/027_view4.png)

Després triem `SwiftUI View` a la part inferior.

![xcode](../../../Resource/027_view12.png)

Després fem clic a `Next`, introduïm el nom del fitxer i el desem.

Per exemple, creem un `Test2View.swift`.

Xcode generarà automàticament un codi semblant al següent:

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

En comparació amb un fitxer buit, el fitxer de plantilla inclou automàticament `import SwiftUI`, `struct`, `body` i `#Preview`.

Per això, per als principiants, utilitzar un fitxer de plantilla SwiftUI és més senzill i també redueix la possibilitat d’oblidar codi.

**Consell**: A més de crear fitxers amb el clic dret, també pots fer clic al botó de suma de la part inferior de la zona Navigator de l’esquerra de Xcode per crear un fitxer o una carpeta.

![xcode](../../../Resource/027_view5.png)

## Crear una carpeta

Quan hi ha cada vegada més fitxers, podem utilitzar carpetes per gestionar-los.

A la zona Navigator de l’esquerra de Xcode, fes clic amb el botó dret en una zona buida o en una carpeta, i tria `New Folder`.

Després de crear la carpeta, pots arrossegar-hi els fitxers relacionats.

![xcode](../../../Resource/027_view7.png)

Les carpetes s’utilitzen principalment per organitzar l’estructura del projecte, i no canvien la manera d’utilitzar la vista.

Mentre el nom de la vista sigui correcte, encara es pot utilitzar en altres fitxers amb formes com `TestView()` i `Test2View()`.

## Eliminar un fitxer o una carpeta

Si vols eliminar un fitxer o una carpeta, pots seleccionar el fitxer corresponent a la zona Navigator de l’esquerra de Xcode, després fer clic amb el botó dret i triar `Delete`.

També pots seleccionar el fitxer i prémer la tecla d’eliminació `⌫`.

Xcode mostrarà una finestra de confirmació d’eliminació.

![xcode](../../../Resource/027_view10.png)

Triar `Move to Trash` significa moure el fitxer a la paperera.

Si veus `Remove Reference`, vol dir que només s’elimina la referència del projecte Xcode, però no s’elimina el fitxer original del disc.

Per als principiants, si només vols eliminar un fitxer normal que acabes de crear, normalment pots triar `Move to Trash`.

## Mostrar diverses vistes SwiftUI

Després d’aprendre a crear fitxers, podem separar diferents vistes en diferents fitxers.

Per exemple, creem dos fitxers SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` s’utilitza per mostrar el nom de l’autor:

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

`CardView` s’utilitza per mostrar el fons de la targeta:

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

Després, podem utilitzar aquestes dues vistes dins de `ContentView`:

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

Després d’executar-ho, podem veure que `CardView` i `AuthorView` es combinen i es mostren junts:

![xcode](../../../Resource/027_view11.png)

En aquest resultat, `CardView` actua com a fons, i `AuthorView` es mostra a sobre, perquè totes dues s’han posat dins d’un `ZStack`.

A `ContentView`, fem servir aquestes dues vistes mitjançant `CardView()` i `AuthorView()`. Els `()` després del nom indiquen que es crea i s’utilitza aquesta vista.

Això és la nidificació de vistes habitual a SwiftUI: dins d’una vista, es poden continuar utilitzant altres vistes.

## Fitxer d’entrada

Finalment, repassem des d’on comença l’App a mostrar la interfície.

En un projecte SwiftUI, normalment hi ha un fitxer d’entrada:

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

Aquí, `@main` indica que aquesta és la posició d’entrada de l’App.

Dins de `WindowGroup`, veiem:

```swift
ContentView()
```

Això indica que, després d’iniciar-se, l’App mostra primer `ContentView`.

Després, dins de `ContentView` també es mostra:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Per tant, la jerarquia de vistes es pot entendre així:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Si canviem la vista que es mostra al fitxer d’entrada per `CardView`:

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

Aleshores, després d’iniciar-se, l’App només mostrarà `CardView`.

És a dir, el `WindowGroup` del codi d’entrada determina quina vista es mostra primer després d’iniciar l’App.

I dins d’aquesta vista, es poden continuar mostrant altres vistes.

## Resum

En aquesta lliçó, hem après les operacions habituals de gestió de fitxers a Xcode.

Hem entès com crear fitxers SwiftUI, com canviar el nom dels fitxers, com crear carpetes i com eliminar fitxers.

Al mateix temps, també hem après un concepte important: les vistes SwiftUI es poden separar en diferents fitxers i després utilitzar-se dins d’altres vistes.

Per exemple:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Aquí, `CardView()` i `AuthorView()` són l’ús d’altres vistes dins de `ContentView`.

Finalment, també hem repassat la lògica de visualització del fitxer d’entrada.

Quan l’App s’inicia, primer entra al codi d’entrada marcat amb `@main`, i després mostra la vista dins de `WindowGroup`.

Això ens ajuda a entendre que els diferents fitxers SwiftUI no estan aïllats; es poden combinar entre ells i, finalment, formar una interfície d’App completa.
