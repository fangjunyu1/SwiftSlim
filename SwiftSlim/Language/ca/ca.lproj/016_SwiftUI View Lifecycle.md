# Cicle de vida de les vistes de SwiftUI

En la lliçó anterior, vam veure que les variables `@State` segueixen el cicle de vida de la vista, i també vam aprendre l'ús bàsic d'`onAppear`.

En aquesta lliçó, entendrem amb més profunditat el cicle de vida de les vistes de SwiftUI: com es creen i es mostren, com es creen i es tornen a crear les variables dins de la vista, i també aprendrem `onAppear`, `onDisappear` i el constructor `init`.

A partir d'aquests coneixements, construirem una comprensió global de tot el procés de construcció d'una vista SwiftUI.

## Ordre d'inici de l'aplicació

Quan creem un projecte iOS, Xcode genera per defecte dos fitxers:

```
ContentView.swift
NomDelProjecte + App.swift
```

D'entre aquests, `"NomDelProjecte + App".swift` és el fitxer d'entrada de tota l'aplicació.

Per exemple:

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

### Flux d'execució del codi

Quan executem l'app, ja sigui al simulador o en un dispositiu físic, el sistema busca primer la paraula clau `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Un cop confirmat el fitxer d'entrada, comença l'execució del codi.

Primer entra a l'estructura `App`, executa el codi dins de `body`, després crea `WindowGroup` i hi carrega `ContentView`.

### El paper de WindowGroup

`WindowGroup` s'utilitza per gestionar finestres:

```swift
WindowGroup {
    ContentView()
}
```

En sistemes com iPad i macOS es poden admetre múltiples finestres, mentre que a l'iPhone normalment només n'hi ha una.

Per tant, a l'iPhone, `WindowGroup` s'encarrega principalment de gestionar la primera pantalla que es mostra.

### Procés de càrrega de la vista

Quan el sistema localitza `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI executa el codi dins de `body`, i després construeix la interfície segons l'estructura de vista retornada, com ara `VStack`, `Text`, etc., i finalment la mostra a la pantalla.

Un cop completats aquests passos, ja podem veure `ContentView` a la vista.

![ContentView](../../Resource/016_view1.png)

Cal tenir en compte que la funció de `body` és generar la vista, no pas emmagatzemar-la.

Això significa que, cada vegada que la vista s'actualitza, SwiftUI recalcula `body` i genera una nova estructura de vista.

### Lògica de la vista prèvia

La vista prèvia de Xcode (`Canvas`) i l'execució real són dos mecanismes diferents.

Per exemple, si afegim una sortida de depuració al fitxer d'entrada:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Quan es previsualitza `ContentView` a Xcode, l'execució no comença des de l'entrada `@main`, així que no es dispararà l'`onAppear` que hi hagi al fitxer d'entrada.

En canvi, si s'executa al simulador o en un dispositiu físic, el sistema començarà des d'`@main`, seguirà tot el flux complet de l'app, i sí que es dispararà l'`onAppear` del fitxer d'entrada mostrant la informació de depuració.

La clau és que la vista prèvia de Xcode és només un "renderitzat parcial", pensat exclusivament per mostrar la vista actual; mentre que el simulador i els dispositius físics proporcionen un "entorn d'execució complet" que executa tota l'app.

Per això, quan es prova el comportament real d'una app, cal prendre com a referència el simulador o el dispositiu físic. La vista prèvia de Xcode no pot proporcionar un entorn complet d'execució.

## Cicle de vida de la vista

En aquesta fase, tot el nostre codi està concentrat dins de `ContentView`. Però en una aplicació real, una app normalment conté múltiples vistes, i aquestes es mostren o es tanquen segons els diferents escenaris.

Per exemple, a la "guardiola":

![PiggyBank](../../Resource/016_view.png)

Quan es prem "Save", es mostra la vista `SaveView`; quan l'operació d'estalvi finalitza o la vista es tanca, `SaveView` s'elimina.

Aquest procés és justament el cicle de vida d'una vista: la vista es crea, es mostra i finalment s'elimina.

### Tancar l'aplicació

Quan l'app es tanca, totes les vistes s'eliminen i també desapareixen els estats associats.

Per tant, tant `ContentView` com les altres vistes s'eliminen de la memòria, i tot l'estat d'execució de l'app també es neteja completament.

## Cicle de vida de les variables dins de la vista

En SwiftUI, el cicle de vida de les variables normalment està lligat al de la vista.

Per exemple:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variables @State

Les variables declarades amb `@State` estan vinculades al cicle de vida de la vista.

```swift
@State private var name = "FangJunyu"
```

Quan la vista es crea, `name` també es crea; quan la vista s'elimina, `name` també es destrueix.

Per això necessitem utilitzar `UserDefaults` i altres maneres similars per aconseguir persistència de dades.

### Variables dins de body

Les variables definides dins de `body`:

```swift
var num = 10
```

Tenen un cicle de vida lligat al procés d'execució de `body`.

Quan l'estat de SwiftUI canvia, per exemple:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Quan `name` canvia, `@State` detecta el canvi de dades i notifica a SwiftUI que ha de recalcular la vista, de manera que `body` es torna a calcular.

Quan `body` es recalcula, tot el codi que hi ha dins de `body` s'executa de nou, i les variables internes, com `num`, es tornen a crear.

Aquesta és també la raó per la qual no es recomana definir variables complexes dins de `body`.

Com que cada vegada que la vista s'actualitza, les variables dins de `body` es tornen a crear, això augmenta el cost de càlcul i pot afectar el rendiment.

En SwiftUI, diferents tipus de dades s'han de gestionar de maneres diferents: les dades que han de seguir el cicle de vida de la vista es poden desar amb `@State`; les dades temporals de càlcul es poden posar dins de `body`.

## onAppear i onDisappear

A la lliçó anterior ja vam aprendre `onAppear`: quan la vista es mostra, s'executa `onAppear`.

```swift
.onAppear {}
```

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Tant a la vista prèvia de Xcode com durant l'execució, es pot veure la sortida de depuració dins d'`onAppear`.

### onDisappear

L'equivalent d'`onAppear` és `onDisappear`:

```swift
.onDisappear {}
```

Quan la vista es tanca, s'executa `onDisappear`.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quan la vista s'elimina, s'executa el codi dins d'`onDisappear`.

Consell: en aquesta etapa, `ContentView` és la vista arrel de l'aplicació, i no es pot tancar ni eliminar directament. Per això, en aquesta fase encara no podem observar clarament l'efecte d'execució d'`onDisappear`.

Més endavant, quan aprenguem navegació entre pàgines i a obrir noves vistes, sí que podrem veure `onDisappear` en acció.

## Lògica de creació i de visualització

Cal tenir en compte que la creació de la vista i la seva visualització són dues fases diferents.

Quan la vista es crea, es crida el constructor de l'`struct`:

```swift
init() {}
```

Com que les vistes de SwiftUI són estructures:

```swift
struct ContentView: View { ... }
```

Per tant, quan es crea una instància de la vista, s'executa el constructor `init`. En canvi, `onAppear` només s'executa quan la vista es mostra.

Per exemple:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quan es previsualitza la vista a Xcode, es pot veure la sortida de depuració següent:

```swift
Create ContentView
Show ContentView
```

Això indica que primer s'executa `init` per crear la vista, després es calcula el codi de `body`, i finalment la vista es mostra i s'executa `onAppear`.

Per tant, cal entendre clarament que les fases de creació i visualització de la vista estan separades.

### Constructor init

`init` és una sintaxi bàsica de Swift. Tant `struct` com `class` poden definir-lo, i s'utilitza per inicialitzar objectes.

```swift
init() {}
```

En SwiftUI, quan una vista es crea, el sistema crida el seu mètode `init`, que es pot utilitzar per rebre paràmetres o inicialitzar dades.

Si no escrivim manualment `init`, Swift generarà automàticament un constructor per defecte per a l'`struct`.

Per a una vista SwiftUI com `ContentView`, quan la vista es crea s'executa `init`, i quan es mostra s'executa `onAppear`.

Per tant, `init` és el constructor que s'executa quan es crea la vista, i més endavant serà útil quan necessitem passar paràmetres o inicialitzar dades.

## Resum

En aquesta lliçó hem après l'ordre d'inici d'una aplicació, des del fitxer d'entrada fins al flux d'execució cap a `ContentView`.

També hem entès el cicle de vida de les vistes de SwiftUI: quan la vista es crea s'executa `init`; quan es mostra a la pantalla s'executa `onAppear`; i quan es tanca o s'elimina s'executa `onDisappear`.

Hem après també el mecanisme d'actualització de les vistes: les vistes estan impulsades per l'estat. Quan un estat com `@State` canvia, SwiftUI refresca la vista i recalcula `body`, i les variables temporals dins de `body` es tornen a crear.

El cicle de vida de les variables està vinculat al cicle de vida de la vista, i les variables temporals dins de `body` es tornen a crear cada vegada que la vista s'actualitza.

Entendre aquests comportaments del cicle de vida i de les variables ens ajuda a organitzar millor el codi i a fer que la lògica de l'aplicació sigui més clara.
