# Comptador

En les dues lliçons anteriors vam aprendre variables, constants, botons i funcions.

En aquesta lliçó combinarem aquests coneixements per crear una aplicació simple de comptador.

En aquest exemple aprendrem com guardar i modificar una variable, i com gestionar-la amb `@State`.

## Crear un comptador

Un comptador s'utilitza habitualment per registrar quantitats que han d'anar augmentant contínuament. Per exemple, el nombre de salts a corda o el nombre de voltes corrent.

Ara implementarem un comptador senzill: mostrarem un número i un botó, i cada vegada que es premi el botó, el número augmentarà.

![Num](../../RESOURCE/009_num.png)

### Mostrar el número

Primer, fem servir `Text` per mostrar un número.

```swift
Text("0")
```

Però si el número ha de canviar, no podem escriure `"0"` de manera fixa; en comptes d'això, hem d'utilitzar una variable per guardar-lo.

```swift
var num = 0
```

Després mostrem la variable a `Text`:

```swift
Text("\(num)")
```

Aquí fem servir la interpolació de cadenes `\()` per convertir el número en una cadena i poder-lo mostrar.

### Augmentar el número amb un botó

A continuació afegim un botó.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Quan es premi el botó, volem que el número augmenti.

Per tant, podem modificar la variable dins del botó:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Aquest codi significa: quan es fa clic al botó, es calcula `num + 1` i el resultat s'assigna a `num`.

### Una escriptura més simple

Swift proporciona una manera més concisa d'escriure això:

```swift
num += 1
```

Això és equivalent a:

```swift
num = num + 1
```

Aquesta sintaxi s'anomena «operador d'assignació composta».

Els operadors d'assignació composta més habituals a Swift són:

```text
+=   assignació de suma
-=   assignació de resta
*=   assignació de multiplicació
/=   assignació de divisió
%=   assignació del residu
```

Per exemple:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Codi complet

Ara podem escriure un comptador senzill:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Però aquest codi no funciona correctament.

### L'error

Xcode mostrarà:

```text
Cannot assign to property: 'self' is immutable
```

Això indica que no es pot modificar la propietat, perquè la vista és immutable.

Per què passa això?

## Com funciona SwiftUI

A SwiftUI, **la interfície està impulsada per les dades**, i això vol dir que quan les dades canvien, la interfície s'actualitza automàticament.

Però hi ha un detall important: SwiftUI només observa els canvis i refresca la vista quan el que canvia és un estat, com ara `@State` o `@Binding`.

Si fem servir una variable normal, SwiftUI només en llegeix el valor una vegada en crear la vista. Encara que després la variable canviï, la interfície no s'actualitzarà.

Per exemple:

```swift
var num = 0   // 0
num = 1   // 0
```

En l'exemple anterior, `num` és una variable normal. Encara que el seu valor canviï, SwiftUI no actualitza la vista i la interfície continua mostrant el `0` inicial.

![Num](../../RESOURCE/009_state.png)

Per això, només quan les dades estan marcades com a estat (per exemple, utilitzant `@State`, `@Binding` i altres property wrapper), SwiftUI les observa automàticament i actualitza la vista.

## Property wrapper `@State`

A SwiftUI, si volem modificar una variable i actualitzar la vista, hem d'utilitzar `@State`.

```swift
@State var num = 0
```

`@State` fa que SwiftUI observi aquesta variable.

Quan la variable canvia, SwiftUI recalcula la vista i l'actualitza.

Codi complet:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Ara, quan es prem el botó:

```swift
num += 1
```

SwiftUI detectarà que `num` ha canviat i actualitzarà la vista automàticament.

![Num](../../RESOURCE/009_state1.png)

## Regles d'ús de `@State`

En el desenvolupament real, `@State` sol seguir dues regles.

### 1. `@State` acostuma a utilitzar `private`

Les variables `@State` s'utilitzen normalment només dins del tipus actual (per exemple, l'estructura `View` actual), així que sovint s'escriuen així:

```swift
@State private var num = 0
```

Això evita que altres vistes accedeixin directament a la variable o la modifiquin.

Encara no hem estudiat `private`, així que de moment podem entendre-ho simplement així:

**El contingut modificat amb `private` només es pot utilitzar dins de la vista actual, i les vistes externes no hi poden accedir.**

### 2. `@State` només serveix per a l'estat de la vista actual

`@State` és adequat per a les dades que gestiona la mateixa `View`.

Per exemple, el contingut d'un camp d'entrada o l'estat d'un interruptor.

```swift
@State private var isOn = false
@State private var text = ""
```

Si les dades s'han de compartir entre diverses vistes, caldrà utilitzar altres tipus d'estat, com `@Binding` o `@Observable`.

Aquests continguts s'estudiaran més endavant.

### Botó per disminuir

Un comptador no només augmenta; també pot disminuir.

Podem afegir un botó `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Després utilitzem `HStack` per ordenar els botons horitzontalment:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Resultat:

![Num](../../RESOURCE/009_num1.png)

Quan es prem el botó `+`, el número augmenta en `1`; quan es prem el botó `-`, el número disminueix en `1`.

### Botó de reinici

També podem afegir un botó de reinici per tornar el número a `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Quan es prem el botó de reinici, s'assigna `0` a `num`.

Resultat:

![Num](../../RESOURCE/009_num2.png)

Quan es prem el botó `0`, el número torna a `0`.

### Personalitzar botons

De moment, els nostres botons només poden mostrar text:

```swift
Button("+") {

}
```

Aquesta forma de botó només pot mostrar contingut textual, com ara `+` o `-`.

En el desenvolupament real, normalment volem que l'aspecte dels botons sigui més ric, per exemple fent servir icones o altres vistes.

SwiftUI ens permet personalitzar el contingut visual d'un botó. En aquest cas podem utilitzar una altra escriptura de `Button`:

```swift
Button(action: {

}, label: {

})
```

En aquesta forma, `action` representa el codi que s'executa en prémer el botó, i `label` representa la vista que es mostra dins del botó.

Per exemple, podem fer que el botó mostri una icona d'SF Symbols:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

D'aquesta manera, el botó deixa de mostrar text i mostra una icona.

### Optimitzar la interfície del comptador

Per fer la interfície del comptador més clara, també podem ajustar l'estil del número. Per exemple, podem engrandir-lo:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

A continuació, també canviem el contingut dels botons perquè mostrin icones, i ampliem lleugerament la mida de la icona:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

De la mateixa manera, podem convertir el botó de disminuir i el de reiniciar en botons amb icones:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Ara els botons mostren icones d'SF Symbols, i la interfície serà més intuïtiva.

![Num](../../RESOURCE/009_num3.png)

## Resum

En aquesta lliçó, mitjançant la implementació d'un comptador senzill, hem practicat conjuntament l'ús de variables, `Text` i `Button`. Hem utilitzat una variable per guardar el número i hem fet servir botons per augmentar-lo o disminuir-lo, mentre apreníem també els operadors d'assignació composta, com `num += 1` i `num -= 1`.

Durant la implementació, hem entès la manera com funciona SwiftUI: la interfície està impulsada per dades. Quan les dades canvien, la interfície s'actualitza. Per això cal utilitzar `@State` per guardar l'estat que pot canviar; quan una variable `@State` canvia, SwiftUI actualitza automàticament la vista.

Finalment, també hem fet una petita optimització de la interfície, ajustant l'estil de lletra de `Text` i utilitzant `Button(action:label:)` per personalitzar el contingut del botó, de manera que els botons puguin mostrar icones i la interfície del comptador sigui més clara i agradable.

Ara ja hem entrat en contacte amb la manera bàsica d'utilitzar les vistes SwiftUI. A SwiftUI, la major part de la interfície està impulsada per variables. Quan una variable canvia, SwiftUI actualitza automàticament la vista. Per això, quan desenvolupem apps amb SwiftUI, normalment primer hem de dissenyar bé quines dades cal guardar, i després utilitzar aquestes dades per construir la interfície i la lògica d'interacció.

## Codi complet

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
