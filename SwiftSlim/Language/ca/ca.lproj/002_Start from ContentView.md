# Començar des de ContentView

## Preparació prèvia

En aquesta lliçó començarem pel fitxer `ContentView.swift` i coneixerem de manera sistemàtica l'estructura bàsica de SwiftUI, incloent:

- comentaris
- estructura `View`
- disposicions `VStack` / `HStack` / `ZStack`
- icones de SF Symbols
- modificadors de vista (`modifier`)
- codi de preview `#Preview`

Primer, troba el projecte Xcode que havies creat abans i fes doble clic al fitxer `.xcodeproj`.

A la zona de navegació `Navigator` de l'esquerra, selecciona el fitxer `ContentView.swift`.

Nota: cada vegada que obres el projecte, el `Canvas` pot mostrar `"Preview paused"`. Prem el botó de refresc per recuperar la previsualització.

![Swift](../../RESOURCE/002_view7.png)

## Coneixent ContentView

El codi de `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//

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

Encara que hi ha poc codi, ja conté l'estructura essencial de SwiftUI.

### 1. Comentaris

A la part superior del fitxer:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/2/23.
//
```

Aquests són comentaris del fitxer, utilitzats per registrar informació com el nom del fitxer, el nom del projecte, l'autor i la data de creació.

En Swift s'utilitza `//` per fer comentaris d'una sola línia:

```swift
// Això és un comentari
```

Els comentaris poden millorar la llegibilitat del codi i ajudar el desenvolupador a entendre la seva lògica.

En el desenvolupament real, el codi pot arribar a ser difícil d'entendre. Si no escrivim comentaris, és fàcil trobar-se en la situació de no entendre el propi codi tres dies després.

Per això, afegir comentaris de manera proactiva mentre escrivim codi és un bon hàbit. Fer servir comentaris per registrar la lògica del codi facilita molt el manteniment posterior.

**Desactivar codi temporalment**

Els comentaris també es poden utilitzar per desactivar codi temporalment i ajudar-nos a trobar problemes.

Per exemple:

```text
A
B
C
```

`A`, `B` i `C` són tres blocs de codi, i un d'ells conté un error. Podem comentar temporalment part del codi per comprovar on és el problema.

Primer afegim un comentari a `A`:

```text
// A
B
C
```

Si després de comentar `A` el codi torna a funcionar, això vol dir que el problema és probablement a `A`.

Si després de comentar `A` el problema continua, podem comentar `B`, i així successivament, fins a trobar el codi problemàtic.

Durant el desenvolupament ens trobem amb molts problemes i, en la majoria dels casos, necessitem comentar codi per localitzar-ne la causa. Això ens ajuda a trobar el codi conflictiu i a descobrir el `BUG`.

A Xcode pots fer servir la drecera:

```text
Command ⌘ + /
```

per afegir o eliminar comentaris ràpidament.

### 2. Importar el framework SwiftUI

```swift
import SwiftUI
```

Aquesta línia indica que estem important el framework SwiftUI.

Tipus com `View`, `Text`, `Image` o `VStack` provenen d'aquest framework.

Si no importem SwiftUI, Xcode mostrarà un error:

```text
Cannot find type 'View' in scope
```

Això significa que el compilador no pot reconèixer el tipus `View`.

### 3. Estructura `View`

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

La primera vegada que veus aquesta estructura `View`, pot semblar estranya, perquè inclou paraules clau com `struct`, `View`, `var`, `body` i `some`.

Encara no hem après aquestes paraules clau. De moment, només cal saber que aquest codi crea una vista anomenada `ContentView`.

Pots entendre `View` com una mena de llenç sobre el qual podem dibuixar, i l'eina per fer-ho és SwiftUI.

Per exemple:

![Swift](../../RESOURCE/002_view.png)

La imatge superior mostra tres pàgines, i en realitat cadascuna és una `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Quan desenvolupem una app amb SwiftUI, cada pàgina és una `View`.

### 4. Codi SwiftUI

Dins la vista `View`, hi ha codi SwiftUI com aquest:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Aquest codi SwiftUI indica que es tracta d'una disposició vertical que mostra una icona i un text.

![Swift](../../RESOURCE/002_view1.png)

#### Disposició `VStack`

```swift
VStack { }  // Disposició vertical
```

`VStack` representa un contenidor de disposició vertical. Les vistes que conté s'ordenen de dalt cap a baix.

![Swift](../../RESOURCE/002_view8.png)

Les tres disposicions més habituals de SwiftUI són:

- `VStack` —— ordre vertical
- `HStack` —— ordre horitzontal
- `ZStack` —— ordre superposat (eix Z)

```swift
HStack { }  // Ordre horitzontal
ZStack { }  // Ordre superposat
```

Esquema de l'ordenació de cada disposició:

![Swift](../../RESOURCE/002_view2.png)

Per exemple, utilitzem `HStack` per fer una disposició horitzontal:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Podem veure que la icona del globus i el text es mostren en línia horitzontal.

![Swift](../../RESOURCE/002_view3.png)

Quan volem un ordre horitzontal, fem servir `HStack`. Quan necessitem superposició, fem servir `ZStack`.

#### `Image` i SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Aquest codi mostra una icona del globus, que prové del sistema d'icones SF Symbols d'Apple.

![Swift](../../RESOURCE/002_view9.png)

El significat d'aquest codi és mostrar una icona de globus, en mida gran i amb el color d'accent.

A més de la icona del globus, també podem mostrar altres icones.

Per exemple, mostrar una motxilla:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Com mostrar altres icones?**

Hem de fer servir la biblioteca oficial d'icones del sistema d'Apple, SF Symbols.

Obre el lloc web oficial d'Apple Developer i descarrega [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Obre l'app SF Symbols.

![Swift](../../RESOURCE/002_sf1.png)

A l'esquerra hi ha les categories de símbols, i a la dreta les icones corresponents.

Fes clic dret sobre una icona i tria l'opció de copiar-ne el nom. Aquest nom és el text corresponent.

Per exemple:

```text
"globe"
"backpack"
"heart"
```

Posant el nom copiat dins de `Image(systemName:)`, podràs mostrar icones diferents.

Nota: cada icona d'SF Symbols té una versió mínima del sistema que la suporta. Si la versió del sistema és massa baixa, potser la icona no es mostrarà. Cal comprovar la compatibilitat dins de l'app SF Symbols.

#### Modificadors

En SwiftUI, un modificador (`modifier`) és un mètode utilitzat per canviar l'aparença o el comportament d'una vista.

Podem entendre els modificadors com si fossin roba: amb roba diferent, l'aparença també canvia.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` i `foregroundStyle` són modificadors de la vista `Image`. Modifiquen la vista `Image` sense canviar el seu contingut.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Serveix per controlar la mida de les icones d'SF Symbols:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Podem canviar entre diferents opcions per mostrar els símbols d'SF Symbols en mides diferents.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` permet controlar el color del primer pla.

`.tint` representa el color d'accent de l'entorn actual; per defecte, a iOS és blau.

Si volem canviar el color del primer pla a vermell:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Vista `Text`

`Text` és una vista de text utilitzada per mostrar cadenes.

```swift
Text("Hello, world!")
```

Per exemple, mostrar el meu nom:

```swift
Text("FangJunyu")
```

Nota: les cadenes han d'estar obligatòriament entre cometes dobles `""`.

Pots provar de mostrar el teu nom, el teu número de telèfon o altres continguts.

#### `padding`

En SwiftUI, `padding` s'utilitza per afegir espai en blanc entre el contingut de la vista i el seu límit. Es tracta d'un «espai intern» (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Aquest codi indica que afegim el marge intern per defecte del sistema a la vista `HStack`.

**Què és `padding`?**

`padding` representa «l'espai en blanc entre el contingut de la vista i el seu límit».

A la imatge següent, després d'aplicar `padding` al `HStack` blau, l'àrea blava es contrau cap endins i visualment sembla «una mica més petita».

![Swift](../../RESOURCE/002_view6.png)

**Marge per defecte**

El modificador `padding()` utilitza per defecte l'espai recomanat pel sistema.

```swift
.padding()
```

Aquest valor pot variar segons la plataforma i el context. Per exemple:

- a iOS, habitualment és d'uns `16 pt`
- a macOS o watchOS, l'espai estàndard pot ser més gran o més petit segons les convencions de disseny de cada plataforma

**Marge personalitzat**

També podem establir marges concrets per a una direcció concreta.

1. Establir una sola direcció

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Explicació de les direccions:

- `.top`: marge superior
- `.bottom`: marge inferior
- `.leading`: marge de davant
- `.trailing`: marge del darrere

![Swift](../../RESOURCE/002_view12.png)

Nota: `leading` i `trailing` s'adapten automàticament segons la direcció de l'idioma. Per exemple, en entorns àrabs (`RTL`) s'inverteixen automàticament.

2. Establir diverses direccions

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Podem especificar diverses direccions alhora mitjançant un array. L'ús detallat dels arrays l'explicarem més endavant; aquí només cal conèixer aquesta sintaxi.

3. Establir horitzontalment o verticalment

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

És equivalent a:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Eliminar el marge**

Si no volem cap marge, podem utilitzar `.padding(0)`:

```swift
.padding(0)
```

o eliminar directament el modificador `padding`:

```swift
// .padding()
```

### 6. Codi de preview

```swift
#Preview {
    ContentView()
}
```

Aquest codi indica que al `Canvas` es genera una previsualització de la vista `ContentView`.

Nota: `#Preview` és una sintaxi nova introduïda a Swift 5.9 / Xcode 15. Abans d'això s'utilitzava l'estructura `PreviewProvider`.

**Què passa si comentem el `Preview`?**

Si comentem el `Preview`:

```swift
// #Preview {
//    ContentView()
// }
```

el `Canvas` deixarà de mostrar contingut renderitzable.

![Swift](../../RESOURCE/002_xcode.png)

És `#Preview` qui controla la vista prèvia del `Canvas`.

Quan necessitem previsualitzar una vista SwiftUI a Xcode, afegim el codi de `#Preview`. Si no necessitem el preview, podem comentar-lo o eliminar-lo.

## Resum

Tot i que el fitxer `ContentView.swift` no conté gaire codi, en realitat cobreix diversos conceptes clau de SwiftUI. Per als principiants, aquest codi pot resultar poc familiar, però si en desglossem l'estructura, podem construir una comprensió inicial de SwiftUI.

Repassem el contingut d'aquesta lliçó. Primer hem après els comentaris `//`, que podem utilitzar per explicar la lògica del codi o per desactivar-lo temporalment.

Després hem entès que els fitxers SwiftUI han d'importar obligatòriament el framework SwiftUI:

```swift
import SwiftUI
```

Si no l'importem, el compilador no podrà reconèixer tipus com `View`.

A continuació, hem conegut l'estructura bàsica d'una vista SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

on `ContentView` és el nom de la vista.

També hem après els tres contenidors de disposició més habituals: `VStack` (ordre vertical), `HStack` (ordre horitzontal) i `ZStack` (superposició).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Aquest codi indica que es mostra un contenidor d'ordre vertical que conté una icona i un text.

`Image` pot mostrar icones d'SF Symbols, i els modificadors ens permeten controlar-ne la mida i el color.

La vista `Text` pot mostrar contingut textual.

`padding` és el marge que afegeix un espai transparent al voltant de la vista.

Finalment, `#Preview` permet mostrar la vista prèvia al `Canvas`.

### Exercicis

Per als principiants, el contingut d'aquesta lliçó pot semblar una mica complex. Podem reforçar la comprensió amb aquests exercicis:

- canviar el nom d'una icona d'SF Symbols
- canviar el color del primer pla de la icona a negre
- canviar `VStack` per `HStack`
- comentar `Image` o `Text` i observar els canvis en la previsualització

### Extra: completat automàtic de codi (`Code Completion`)

Quan escrius codi, potser ja t'has adonat que Xcode mostra automàticament una llista d'opcions disponibles.

Per exemple, quan modifiquem el modificador `imageScale`:

```swift
.imageScale(.)
```

Xcode mostrarà les opcions disponibles:

![Swift](../../RESOURCE/002_view10.png)

Això forma part del mecanisme de completat automàtic (`Code Completion`), basat en la inferència de tipus i en suggeriments de membres d'enumeracions, que pot millorar l'eficiència d'escriptura i reduir errors.

En les lliçons posteriors presentarem formalment les enumeracions (`enum`); ara per ara n'hi ha prou amb tenir-ne una idea bàsica.
