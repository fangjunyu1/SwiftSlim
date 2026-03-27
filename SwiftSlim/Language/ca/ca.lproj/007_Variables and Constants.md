# Variables i constants

En aquesta lliçó estudiarem principalment les variables i constants de Swift, així com alguns tipus de dades habituals i operadors bàsics.

Aquests conceptes són els coneixements més fonamentals de la programació i també una base important per a l'aprenentatge posterior de SwiftUI.

## Variables i constants a la vida quotidiana

Podem entendre les variables i constants a través d'exemples de la vida real.

Variables a la vida quotidiana:

- el contingut de cada programa de televisió és diferent
- el temps canvia cada dia
- el rellotge canvia cada segon

La característica comuna d'aquestes coses és que canvien.

Si la televisió mostrés sempre la mateixa imatge, el temps fos sempre assolellat i les agulles del rellotge no es moguessin mai, aleshores aquestes coses serien constants.

Una pot canviar, l'altra no.

## Entendre variables i constants

En el desenvolupament d'apps, sovint és necessari que l'usuari introdueixi o guardi certa informació.

Per exemple:

- nom del compte
- aniversari
- informació de contacte
- adreça

Aquesta informació es guarda i es mostra.

Per exemple, si un usuari introdueix un nom a l'app:

```text
FangJunyu
```

hem de guardar aquest nom perquè es pugui mostrar a l'app.

Podem entendre aquest procés de manera simple com guardar alguna cosa dins d'un calaix.

Quan guardem un nom, és com si poséssim aquest nom dins d'un calaix.

Les coses que cal guardar poden ser moltes, i els calaixos també poden ser molts. Per saber què hi ha dins de cada calaix, cal posar-los un nom.

Per exemple:

```text
name
```

En aquest exemple, `name` és el nom, i `FangJunyu` és la informació guardada.

![Var](../../RESOURCE/007_var.png)

**En Swift, si cal guardar dades, és imprescindible declarar-les mitjançant una variable (`var`) o una constant (`let`).**

Com que normalment un nom pot canviar, en aquest cas hauríem d'utilitzar una variable.

```swift
var name = "FangJunyu"
```

Aquí declarem una variable anomenada `name`, de tipus `String`, amb el valor `"FangJunyu"`.

### Diferència entre variables i constants

Les variables es declaren amb `var`:

```swift
var
```

Les constants es declaren amb `let`:

```swift
let
```

Per exemple:

```swift
var name = "FangJunyu"
let id = 123456
```

Si una dada es declara com a variable, significa que el valor es pot modificar; si es declara com a constant, ja no es pot modificar després.

Per tant, la diferència principal entre una variable i una constant és si el valor pot canviar o no.

### Modificar una constant

Si el codi intenta modificar el valor d'una constant:

```swift
let name = "Sam"
name = "Bob"
```

Swift indicarà que no es pot completar l'assignació, perquè es tracta d'una constant.

```text
Cannot assign to property: 'name' is a 'let' constant
```

Aquest mecanisme pot ajudar el desenvolupador a evitar que dades importants es modifiquin accidentalment.

### Mostrar-ho a SwiftUI

Obre el fitxer `ContentView.swift` i declara una variable dins la vista:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Aquí hem declarat una variable anomenada `name` i la mostrem a la interfície mitjançant `Text`.

Si modifiquem el contingut de la variable:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

el text que mostra `Text` també canviarà.

D'aquesta manera, podem utilitzar variables per controlar el contingut que mostra la interfície, sense haver de modificar directament el text dins de `Text` cada vegada.

Si en algun altre lloc cal obtenir aquesta informació, també podem passar-hi la variable, com si entreguéssim a un altre lloc el contingut del «calaix».

### Posició de les variables i constants a SwiftUI

A SwiftUI, les variables i constants acostumen a escriure's fora de `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

És clar que també es poden escriure dins de `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Però hi ha una diferència important entre aquests dos casos:

- si les variables i constants s'escriuen dins de `body`, cada vegada que la vista es recalcula es tornen a crear
- si s'escriuen fora de `body`, existeixen com a propietats de l'estructura de la vista i l'estructura del codi és més clara

Per això, en el desenvolupament real, les variables i constants se solen escriure fora de `body`.

## Tipus de dades

Les variables poden guardar molts tipus diferents de dades, i aquests tipus s'anomenen tipus de dades.

Per exemple, abans utilitzàvem `Text` per mostrar text:

```swift
Text("Hello, World")
```

Aquí, `"Hello, World"` és de tipus cadena (`String`).

Les cadenes s'utilitzen per representar text i, en Swift, han d'estar entre cometes dobles `""`.

Per exemple:

```swift
var hello = "Hello, World"
```

A més de les cadenes, Swift té molts altres tipus de dades.

En una fase inicial, els quatre tipus més habituals són:

- `String`
- `Int`
- `Double`
- `Bool`

Aquests quatre tipus cobreixen la major part del processament bàsic de dades.

**`String`**

`String` representa contingut textual, per exemple:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Les cadenes s'utilitzen habitualment per a noms d'usuari, títols i contingut de text.

**`Int`**

`Int` representa enters, és a dir, números sense decimals.

Per exemple:

```swift
var age = 26
var count = 100
```

Els enters se solen utilitzar per representar edat, quantitat i comptatge.

**`Double`**

`Double` representa números amb decimals.

Per exemple:

```swift
var weight = 74.5
var height = 185.0
```

En Swift, els decimals acostumen a utilitzar `Double` per defecte.

També hi ha un tipus similar anomenat `Float`, però el rang de valors que pot representar és més petit; per això, en el desenvolupament real, `Double` és més habitual.

**`Bool`**

El tipus `Bool` s'utilitza per representar dos estats: `true` i `false`.

Per exemple:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` s'utilitza molt en condicions, com ara si cal mostrar o no una alerta.

Per a situacions amb només dues possibilitats, `Bool` és especialment adequat.

### Mostrar-ho a SwiftUI

Quan mostrem un valor `String`, podem utilitzar `Text` directament:

```swift
Text(name)
```

Però `Int`, `Double` i altres tipus no són cadenes, així que no es poden incloure directament com a contingut textual.

Si volem mostrar aquestes dades a `Text`, podem utilitzar la interpolació de cadenes (`String Interpolation`):

```swift
\()
```

La interpolació s'ha d'escriure dins d'una cadena i embolicar la variable o constant amb `\()`.

Per exemple:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

En el codi de dalt, `""` representa una cadena, i `\()` serveix per inserir-hi variables o constants.

Per exemple:

```swift
"DoubleNum: \(num * 2)"
```

El contingut que es mostrarà és:

```text
DoubleNum: 2
```

D'aquesta manera podem inserir variables o constants dins d'una cadena i després mostrar-les a la interfície amb `Text`.

Consell: `\()` només es pot utilitzar dins d'una cadena `""`.

## Operadors

Quan declarem variables o constants, sovint veiem un codi com aquest:

```swift
var num = 1
```

Aquí, `=` s'anomena operador d'assignació.

La seva funció és assignar el valor de la dreta a la variable de l'esquerra.

En aquest exemple, `1` s'assigna a la variable `num`.

A més de l'operador d'assignació, hi ha també alguns operadors numèrics habituals:

- `+`
- `-`
- `*`
- `/`

Quan fem càlculs numèrics, per exemple amb valors de tipus `Int` o `Double`, utilitzem aquests operadors.

Per exemple:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Un cop acabat el càlcul, el resultat es guarda a la variable.

## Resum

Les variables, constants i operadors són alguns dels conceptes més fonamentals de la programació.

Mitjançant variables i constants podem desar diverses dades dins del programa; amb els tipus de dades podem deixar clar de quin tipus és cada dada; i amb els operadors podem calcular-la i processar-la.

Aquests coneixements són com les eines bàsiques del món de la programació. Dominar-los és la base per continuar aprenent Swift i SwiftUI.
