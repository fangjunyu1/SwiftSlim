# Entendre les vistes

En aquesta lliçó tornem al `ContentView` del començament.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hola, món!")
    }
}
```

Quan vam entrar en contacte amb SwiftUI per primera vegada, dins de `ContentView` hi havia moltes paraules clau que no enteníem.

Per exemple `struct`, `View`, `var`, `body`, `some View` i altres paraules clau.

En aquell moment potser només sabíem això: **si escrivim el codi dins de `body`, el contingut es mostrarà a la interfície.**

Ara ja hem après `struct`, variables, mètodes i protocols, així que podem tornar a entendre aquest codi i ajudar-nos a comprendre la relació entre les vistes de SwiftUI.

## Repassar ContentView

Després de crear un projecte SwiftUI, Xcode genera per defecte un fitxer `ContentView`.

El codi d'exemple és el següent:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hola, món!")
        }
        .padding()
    }
}
```

Aquest codi es pot entendre dividint-lo en diverses parts.

Primer:

```swift
import SwiftUI
```

Aquesta línia indica que importem el framework SwiftUI.

Després d'importar SwiftUI, podem utilitzar vistes de SwiftUI com `View`, `Text`, `Image`, `VStack`, `Button`, etc.

## L'estructura ContentView

Aquesta línia de codi indica que es crea una estructura:

```swift
struct ContentView: View
```

Entre aquests elements:

```swift
struct ContentView
```

indica que `ContentView` és una estructura.

A la lliçó anterior vam conèixer l'estructura `struct`: pot combinar diferents camps relacionats i pot contenir propietats i mètodes.

Per exemple:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Hola, món!")
    }
}
```

En aquest exemple, `ContentView` conté tres elements: `name`, `printName` i `body`.

És a dir, `struct` pot agrupar propietats, mètodes i contingut de vista relacionats.

![contentView](../../Resource/023_contentVIew.png)

## View és un protocol

Continuem mirant aquesta línia de codi:

```swift
struct ContentView: View 
```

El `View` després dels dos punts indica que `ContentView` segueix el protocol `View`.

Podem entendre-ho així: si `ContentView` vol convertir-se en una vista SwiftUI, ha de complir els requisits del protocol `View`.

### Protocol Identifiable

Quan abans vam estudiar la llista de pel·lícules, vam entrar en contacte amb el protocol `Identifiable`.

En aquell moment necessitàvem recórrer l'array `Movie` dins de `ForEach`, però l'estructura `Movie` no tenia un identificador únic, així que no admetia el recorregut amb `ForEach`.

En aquell moment vam haver de fer que l'estructura `Movie` seguís el protocol `Identifiable`, per complir el requisit d'identificador únic de `ForEach`.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

El protocol `Identifiable` requereix: **que aquest tipus tingui un camp `id` que l'identifiqui.**

Quan `Movie` proporciona un camp `id`, ja pot complir el requisit de `Identifiable`.

Així, quan l'utilitzem dins de `ForEach`, SwiftUI pot reconèixer cada dada.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Protocol View

Amb el protocol `View` passa el mateix.

Si un tipus vol convertir-se en una vista SwiftUI, ha de seguir el protocol `View`.

I el requisit més important del protocol `View` és proporcionar un `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hola, món!")
    }
}
```

Podem entendre el requisit del protocol `View` així: **només accepta la vista SwiftUI que retorna `body`, i `ContentView` mostra una vista SwiftUI a través de `body`.**

### Què passa si no seguim View?

Si escrivim això:

```swift
struct ContentView {
}
```

Això només és una estructura normal, no una vista SwiftUI.

No donarà error directament, perquè una estructura normal és codi Swift vàlid.

Però si la posem a la previsualització:

```swift
#Preview {
    ContentView()
}
```

aleshores apareixerà un error.

El motiu és: **la previsualització necessita mostrar una vista SwiftUI, però aquest `ContentView` no segueix el protocol `View`.**

Per tant, si volem que `ContentView` es pugui mostrar a la interfície, hem de fer que segueixi el protocol `View`:

```swift
struct ContentView: View {
}
```

Al mateix temps, cal proporcionar `body` segons el requisit del protocol `View`; si no hi ha `body`, el compilador encara donarà error.

Escriptura correcta:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hola, món!")
    }
}
```

En aquest moment, `ContentView` ja és una vista SwiftUI real que es pot mostrar.

## body és l'entrada de visualització de la vista

En SwiftUI, `body` és l'entrada del contingut de la vista.

```swift
var body: some View {
    Text("Hola, món!")
}
```

Aquí ho podem dividir en tres parts:

**1. var body**

```swift
var body
```

Indica que definim una variable anomenada `body`.

**2. some View**

```swift
: some View
```

Indica que aquest `body` retornarà una vista.

**3. { ... }**

```swift
{
    Text("Hola, món!")
}
```

Representa el contingut de vista que es mostra; en aquest codi es mostra una vista `Text`.

És a dir, allò que escrivim dins de `body` és el que es mostrarà a la interfície.

Per exemple:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nom:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Aquest codi indica: **a la interfície es mostra un contingut ordenat verticalment, amb dos textos a dins.**

### El nom body no es pot modificar lliurement

Cal tenir en compte que el nom `body` no es pot modificar lliurement.

Si l'escrivim així:

```swift
struct ContentView: View {
    var content: some View {
        Text("Hola, món!")
    }
}
```

Aquest `content`, tot i que també és una propietat de vista, no pot substituir `body`.

Perquè el nom que exigeix el protocol `View` és `body`.

## Què és some View?

En SwiftUI, `some View` significa retornar una vista concreta, però sense haver d'escriure el tipus complet d'aquesta vista.

```swift
var body: some View
```

És a dir, `some View` no vol dir que no hi hagi tipus. El tipus real continua existint i el compilador coneix aquest tipus, però pot ser molt complex, per això Swift ens permet utilitzar `some View` per amagar-lo.

### Què és some?

En Swift, `some` és una paraula clau per declarar un tipus opac (opaque type).

Un tipus opac significa: **el valor retornat té un tipus concret, el compilador sap quin és aquest tipus concret, però nosaltres no l'escrivim directament.**

Per exemple:

```swift
func makeView() -> some View {
    Text("Hola")
}
```

Això indica que `makeView` retornarà un tipus concret que segueix el protocol `View`.

### Per què necessitem some?

Quan vam aprendre variables, vam entendre que: **els valors en Swift necessiten una anotació explícita de tipus, o bé que el compilador en dedueixi automàticament el tipus.**

Per exemple:

```swift
let a: Int = 10
```

Aquí la constant `a` és de tipus `Int`.

Les vistes SwiftUI no són una excepció. Quan utilitzem `body` per mostrar una vista SwiftUI, cal que `body` retorni el tipus SwiftUI corresponent.

Per exemple, si utilitzem `body` per mostrar una vista de text `Text`, cal que `body` retorni el tipus `Text` corresponent.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

En aquest exemple, dins de `body` es mostra una vista `Text`, i el tipus retornat també és `Text`.

Només quan el tipus intern i el tipus declarat coincideixen, es compleix el requisit de coherència de tipus del compilador.

**Problema d'incoherència de tipus**

Si configurem el tipus de `body` com a `Color`, però mostrem un `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

el tipus de `body` i el tipus del codi intern no coincideixen, i això provocarà un error d'incoherència de tipus.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

En aquest moment, hem de modificar manualment el tipus de retorn de `body`.

**Tipus de vista complexos**

En el desenvolupament real, una interfície normalment no té només un `Text`.

Si necessitem mostrar un `VStack` més complex, hem d'anotar manualment un tipus de retorn complex.

Per exemple:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Hola, món!")
    }
}
```

Aquest codi indica que retorna un `VStack`, i dins del `VStack` hi ha vistes de tipus `Image` i `Text`.

El tipus de retorn de `body` és:

```swift
VStack<TupleView<(Image,Text)>>
```

Podem veure que aquest tipus de retorn és molt complex, i també apareix un `TupleView` que abans no havíem vist.

Aquí podem entendre `TupleView` com: **la representació d'embolicar diverses subvistes en una sola vista.**

**Tipus de vista encara més complexos**

Si afegim modificadors a la vista:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hola, món!")
    }
    .padding()
}
```

aleshores el tipus de retorn d'aquesta vista es torna molt complex i no es pot descriure aquí de manera concreta.

El tipus de retorn existent `VStack<TupleView<(Image,Text)>>` ja no pot descriure els modificadors, i per això es produirà un error.

**some View simplifica el tipus de retorn**

Per a aquesta situació, SwiftUI ofereix una solució senzilla: utilitzar `some View` per simplificar l'escriptura.

Quan canviem `body` al tipus `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hola, món!")
    }
    .padding()
}
```

cada vegada que modifiquem el codi de la vista, ja no hem d'escriure el tipus de retorn complet.

Això és perquè `some View` significa retornar una vista concreta que segueix el protocol `View`.

Dit d'una altra manera, vistes SwiftUI com `VStack`, `Image`, etc., són vistes que segueixen el protocol `View`. Després d'afegir modificadors, el tipus de vista retornat continua seguint el protocol `View`.

Per això totes es poden retornar com a `some View`.

### some View no pot retornar qualsevol vista arbitràriament

Tot i que `some View` pot amagar tipus complexos, no és "sense tipus".

La seva regla central és: **el compilador ha de poder determinar un tipus de retorn concret**.

Per exemple:

```swift
var title: some View {
    Text("Hola")
}
```

Aquí es retorna una vista `Text`.

Però si intentem retornar dues vistes, es produirà un error:

```swift
var title: some View {
    Text("Hola")
    Image(systemName: "star")
}
```

Perquè `some View` al final necessita retornar una estructura de vista, però aquí intentem retornar dues vistes independents.

### Solució

Normalment hi ha dues solucions: contenidor i `@ViewBuilder`.

**1. Embolicar amb un contenidor**

```swift
var title: some View {
    VStack {
        Text("Hola")
        Image(systemName: "star")
    }
}
```

En aquest codi, `title` retorna un `VStack`, mentre que `Text` i `Image` són subvistes dins del `VStack`.

L'estructura de vista que rep `some View` és un `VStack<...>`, de manera que compleix el requisit de `some View` de retornar una estructura de vista. 

Aquesta és també la raó per la qual, des del començament d'aprendre SwiftUI, recomanem utilitzar un contenidor `VStack` a la capa més externa per embolicar el codi de vista.

**2. Utilitzar @ViewBuilder**

També podem afegir el modificador `@ViewBuilder` davant de `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hola")
    Image(systemName: "star")
}
```

`@ViewBuilder` pot combinar diverses vistes en un únic resultat de retorn.

En essència, continua combinant diverses vistes en una sola vista per satisfer el requisit de `some View` de retornar una estructura de vista.

### Per què body pot escriure diverses vistes directament?

Si escrivim diverses vistes dins de `var body`, per exemple:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hola, món!")
}
```

en alguns casos, aquest `body` no donarà error.

El motiu és que el `body` del protocol `View` admet `@ViewBuilder` per defecte:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Al codi font del protocol `View`, podem veure que `@ViewBuilder` ja decora la variable `body`.

Per tant, `body` té una capa de processament especial més que un `some View` normal, i així SwiftUI ens ajuda automàticament a combinar diverses vistes en una sola vista.

**Es recomana utilitzar contenidors**

Per facilitar la comprensió als principiants, es recomana utilitzar primer contenidors com `VStack`, `HStack`, `ZStack`, `Group` per organitzar diverses vistes.

Per exemple:

```swift
var body: some View {
    VStack {
        Text("Hola")
        Image(systemName: "star")
    }
}
```

Així el codi és més intuïtiu: **la capa exterior és un `VStack`, i a dins hi ha dues subvistes.**

## Dividir la vista

Si la interfície és relativament senzilla, podem escriure tot el codi dins de `body`.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Benvingut a Qinote")
                Text("Bon dia")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Prem-me") {
                print("Prem-me ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

L'estil de visualització d'aquesta vista:

![view](../../Resource/023_view1.png)

Aquest codi pot funcionar normalment, però si el codi de la vista és molt complex, el codi dins de `body` es farà cada vegada més llarg i la dificultat de lectura i modificació augmentarà.

En aquest moment, podem dividir les diferents zones en propietats de vista independents.

### Dividir la vista superior

Per exemple, separem la zona superior:

```swift
var topHome: some View {
    HStack {
        Text("Inici")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Aquí `topHome` és una variable que retorna una vista.

Com que retorna una vista, el tipus es pot escriure així:

```swift
some View
```

Això en realitat és el mateix ús que `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Totes dues utilitzen variables per mostrar vistes, amb tipus de retorn `some View`.

### Dividir altres vistes

Després, continuem dividint altres parts:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Benvingut a Qinote")
        Text("Bon dia")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Prem-me") {
        print("Prem-me")
    }
    .buttonStyle(.borderedProminent)
}
```

Després de dividir, podem posar les variables de vista dins de `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Inici")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Benvingut a Qinote")
            Text("Bon dia")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Prem-me") {
            print("Prem-me")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Ara `body` només s'encarrega de descriure l'estructura de la pàgina:

```swift
topBar
welcomeText
colorList
clickButton
```

La implementació concreta de cada part es posa a la propietat corresponent de sota.

Aquesta manera de dividir la vista pot fer que l'estructura de la pàgina sigui més clara; cada zona de vista té el seu propi nom i la lectura és més intuïtiva.

Quan modifiquem una part del codi, podem trobar directament la zona de vista corresponent, en lloc de buscar dins d'un munt de codi complex.

### some View retorna una sola vista

En aquesta divisió de vista, si intentem retornar diverses vistes:

```swift
var topBar: some View {
    Text("Inici")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

`some View` només pot retornar una estructura de vista, i per això es produirà un error.

A diferència de `body`, les propietats calculades normals no tenen `@ViewBuilder` per defecte.

Per tant, si necessitem retornar diverses vistes, podem utilitzar un contenidor `VStack`, `HStack` o `Group` per combinar diverses vistes en una sola.

```swift
var topBar: some View {
    VStack {
        Text("Inici")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

O afegir `@ViewBuilder` per combinar les vistes:

```swift
@ViewBuilder
var topBar: some View {
    Text("Inici")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Així podem retornar diverses vistes.

### if retorna diverses vistes

Per exemple:

```swift
var topHome: some View {
    if step == "Inici" {
        HStack {
            Text("Inici")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Buit")
    }
}
```

En aquest codi, `topHome` segons el contingut de `step` retorna dos tipus de vista diferents: `HStack` o `Text`.

Com que `some View` necessita un tipus de retorn concret determinat, els dos branques de `if` en una propietat calculada normal no poden retornar directament tipus de vista diferents, i això provoca un error.

**La solució continua sent embolicar amb un contenidor o utilitzar `@ViewBuilder`.**

### Per què les vistes dividides no fan servir parèntesis?

Quan utilitzem dins de `body` les propietats de vista que hem dividit, escrivim directament:

```swift
topBar
welcomeText
colorList
clickButton
```

i no escrivim:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Això és perquè `topBar`, `welcomeText`, `colorList` i `clickButton` són variables; aquestes variables en realitat són propietats calculades, no mètodes.

**Les propietats no necessiten parèntesis.**

Si ho escrivim com a mètode, també podem aconseguir un efecte semblant:

```swift
func topBar() -> some View {
    HStack {
        Text("Inici")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Aquest codi també pot aconseguir un efecte semblant; cridar aquest mètode retornarà una vista.

Quan l'utilitzem, cal escriure:

```swift
topBar()
```

En SwiftUI, si només dividim una vista que no necessita passar paràmetres, és més habitual utilitzar una propietat calculada.

```swift
var topBar: some View { ... }
```

## Vistes imbricades

A més de dividir el codi en propietats, també podem crear noves estructures de vista.

Per exemple:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Aquest `PinkColorView`, igual que `ContentView`, és una vista SwiftUI independent.

Si necessitem mostrar-la dins de `ContentView`, podem afegir `()` després del nom de la vista.

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Aquí:

```swift
PinkColorView()
```

significa crear una instància de `PinkColorView`.

Com que `PinkColorView` segueix el protocol `View`, es pot posar dins d'altres vistes per mostrar-se, igual que `Text`, `Image` o `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Això és la imbricació de vistes: una vista es pot mostrar dins d'una altra vista.

## Propietat de vista o crear una vista nova?

Quan el codi de vista és relativament senzill, normalment no cal dividir el codi; només quan el codi és més complex és recomanable dividir la vista.

### Escenaris per utilitzar propietats de vista

Si només és una petita part del contingut dins de la vista actual, podem utilitzar una propietat de vista.

Per exemple:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Aquests continguts normalment només s'utilitzen dins de la vista actual.

### Escenaris per crear una vista nova

Si aquests continguts són relativament independents, o en el futur es poden reutilitzar en diverses pàgines, és més adequat crear una vista nova.

Per exemple:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Aquesta és una vista de títol. Si volem utilitzar aquesta vista com a component general i reutilitzar-la en altres vistes.

Podem crear una vista nova:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Després, la fem servir en altres llocs:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

En aquest moment, aquesta vista és un component independent reutilitzable.

Es pot resumir de manera senzilla així:

- Una zona de contingut de la vista actual pot utilitzar `var xxx: some View`
- Un component independent reutilitzable pot crear un nou `struct XxxView: View`
- Un component que necessita rebre dades normalment és més adequat com a vista nova.

## Resum

En aquesta lliçó hem tornat a entendre l'estructura de vista més bàsica, però també més important, de SwiftUI.

`ContentView` és una estructura, definida amb `struct`, que serveix per organitzar el codi relacionat amb la pàgina.

`View` és un protocol; si una estructura vol convertir-se en una vista SwiftUI, ha de seguir el protocol `View`.

`body` és el contingut que el protocol `View` ens demana proporcionar, i determina quin contingut mostra aquesta vista.

`some View` significa retornar un tipus concret de vista, sense que hàgim d'escriure'n el tipus complet i complex.

Quan el codi de vista es fa llarg, podem utilitzar `var xxx: some View` per dividir el codi de vista en diverses zones petites.

Quan una part del contingut és relativament independent o s'ha de reutilitzar, podem crear una nova estructura de vista i mostrar-la en altres vistes mitjançant `XxxView()`.

En poques paraules, la interfície de SwiftUI està formada per vistes combinades; una pàgina pot contenir diverses petites vistes, i una petita vista també pot continuar contenint altres vistes.
