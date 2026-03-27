# Sistema de tipus

En les lliçons anteriors, ja hem après què són les variables i sabem que poden desar dades de diferents tipus.

Per exemple:

```swift
var hello = "Hello, World"
```

Aquí, `hello` desa un fragment de text, així que el seu tipus és `String`.

A continuació, estudiarem de manera sistemàtica el concepte de tipus (`Type`), així com la declaració explícita de tipus i la inferència de tipus, per entendre més a fons l'essència de les variables.

## Què és un tipus

En Swift, cada valor té un tipus clar. El tipus determina què és aquest valor i què pot fer.

Per exemple:

- `42` és un `Int` (enter)
- `"Hello"` és un `String` (cadena)
- `true` és un `Bool` (booleà)

Pertanyen a tipus diferents i també tenen usos diferents.

## Tipus bàsics habituals en Swift

En la fase inicial d'aprenentatge, els tipus més comuns són els següents:

- `String`: cadena de text
- `Int`: enter
- `Double`: nombre de coma flotant, amb decimals i més precisió
- `Bool`: valor booleà (`true`/`false`)

A més, també hi ha `Float` (nombre de coma flotant, però amb menys precisió que `Double`, i per això se sol utilitzar menys) i `Character` (un sol caràcter), com ara `"A"` o `"!"`.

### Declaració de tipus (tipus explícit)

En Swift, podem especificar manualment el tipus quan declarem una variable:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Afegim `: tipus` després del nom de la variable per declarar-ne el tipus.

La manera d'escriure el tipus d'un array és `: [Tipus]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

En aquest fragment, l'array `scores` només pot contenir elements de tipus `Int`, i `tags` només pot contenir elements de tipus `String`.

Declarar el tipus de manera explícita pot fer que la intenció del codi sigui més clara i, en alguns casos, evitar errors d'inferència de tipus.

## Inferència de tipus

En molts casos, no cal declarar el tipus explícitament:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Això és així perquè el compilador de Swift pot inferir automàticament el tipus a partir del "valor inicial".

## Declaració explícita i inferència de tipus

En les lliçons anteriors, no vam introduir la declaració explícita, per exemple:

```swift
var age: Int = 18
```

En canvi, vam prioritzar la inferència de tipus:

```swift
var age = 18
```

En aquest exemple, les dues formes són equivalents: `age` queda determinat com a tipus `Int`. Comparada amb la primera, la inferència de tipus és més concisa.

La raó per la qual al principi no posem l'èmfasi en la declaració explícita és que la inferència de tipus redueix informació addicional dins del codi i, per tant, també redueix la càrrega de comprensió en la fase inicial d'aprenentatge.

## Per què necessitem els tipus

Swift és un llenguatge fortament tipat (`Strongly Typed Language`).

Això significa que, un cop el tipus d'una variable queda determinat, no es pot canviar arbitràriament.

Per exemple:

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

El primer `20` és de tipus `Int`, així que es pot assignar a `age`. El segon `"20"` és de tipus `String`, i com que no coincideix amb `Int`, es produirà un error.

`nums` és un array de tipus `[Int]`, així que només pot emmagatzemar enters i no hi pot barrejar cadenes de text.

Els tipus poden restringir l'ús de les dades i detectar problemes d'incompatibilitat en fase de compilació, reduint els bugs provocats per la confusió de tipus i millorant l'estabilitat i el manteniment del codi.

## Quan cal declarar el tipus explícitament

Tot i que Swift pot inferir els tipus automàticament, hi ha situacions en què el compilador no ho pot fer, o pot inferir-los malament. En aquests casos, cal declarar-los manualment.

**1. Arrays buits**

Quan es crea un array buit, s'ha de declarar el tipus explícitament:

```swift
var nums: [Int] = []
```

Si no escrivim el tipus:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

El compilador no pot inferir el tipus dels elements a partir d'un array buit i, per tant, apareix un error de compilació.

**2. Evitar inferències incorrectes**

```swift
var value = 10   // Int
```

En aquest exemple, tot i que `10` també podria representar un nombre decimal (`Double`), com que no hi ha punt decimal, el compilador l'inferirà per defecte com a `Int`.

Si volem que `value` representi un nombre de tipus `Double`, cal declarar-lo explícitament:

```swift
var value: Double = 10   // Double
```

Quan el resultat de la inferència no coincideix amb el que esperem, hem d'utilitzar una declaració explícita del tipus o ajustar la forma del literal per assegurar-nos que el tipus sigui correcte.

**3. Tipus personalitzats**

Més endavant també aprendrem a crear tipus personalitzats. Quan els fem servir, normalment també cal declarar-los de manera explícita:

```swift
var info: GameInfo
var users: [User] = []
```

La raó és la mateixa que amb els arrays buits: el compilador no pot inferir automàticament el tipus a partir d'un valor buit.

## Conversió de tipus

En Swift, els diferents tipus no es poden convertir automàticament entre si; cal fer la conversió manualment.

Per exemple, si sumem dos nombres de tipus diferents:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

En aquest codi, `a` és de tipus `Int` i `b` és de tipus `Double`. Com que els tipus són diferents, no es poden operar directament.

Abans de fer l'operació, hem de convertir un dels valors al mateix tipus:

```swift
var result = Double(a) + b
```

Això significa que convertim `a`, que és un `Int`, en un `Double`, i després el sumem amb `b`. El resultat es desa a `result`.

Cal tenir en compte que la conversió no modifica el tipus de la variable original. Per exemple, `Double(a)` no canvia `a` a `Double`, sinó que crea un nou valor de tipus `Double` per utilitzar-lo en el càlcul.

Altres tipus també es poden convertir d'una manera semblant: s'utilitza el tipus de destinació seguit de `()` i s'hi passa el valor que volem convertir. Per exemple:

```
Int()、Double()、String()
```

Exemple:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Cal tenir en compte que no totes les conversions conserven exactament el valor. Per exemple, quan es converteix `Double` a `Int`, la part decimal es trunca directament, no s'arrodoneix.

## Àlies de tipus

En Swift, també podem donar un altre nom a un tipus existent per fer que el codi sigui més clar semànticament:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Aquí, `UserID` continua sent en essència un `Int`, el tipus no canvia, però el nom és més significatiu.

En projectes amb molt de codi i tipus complexos, els àlies de tipus poden fer que el codi sigui més llegible.

## Exemple de tipus

A continuació, utilitzarem un exemple senzill per mostrar el paper dels tipus en el desenvolupament real.

### Crear una variable

Primer, creem una variable `age`:

```swift
var age = 20
```

Com que necessitem mostrar i modificar aquesta variable a SwiftUI, hem d'utilitzar `@State` per declarar-la:

```swift
@State private var age = 20
```

Ja havíem esmentat abans `private`: vol dir que aquesta variable només es pot utilitzar dins de la vista actual. Més endavant ho aprendrem amb més profunditat.

### Mostrar dades a SwiftUI

Mostrem la variable `age` dins de SwiftUI:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

Ara la vista mostrarà:

```swift
age: 20
```

### Modificar dades

A continuació, afegim dos botons per modificar `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Resultat de l'execució

Quan es premi `changeAge1`, `age` passarà a ser 18:

```swift
age = 18
```

Com que `18` és de tipus `Int` i coincideix amb el tipus d'`age`, l'assignació és correcta.

En canvi, `changeAge2` generarà un error:

```swift
age = "18"
```

Missatge d'error:

```
Cannot assign value of type 'String' to type 'Int'
```

Això és perquè `"18"` és de tipus `String` i `age` és de tipus `Int`. Com que els tipus no coincideixen, no es pot fer l'assignació.

### Per què es produeix l'error?

La clau és aquesta línia:

```swift
@State private var age = 20   // Int
```

Tot i que no hem declarat el tipus explícitament, com que el valor inicial `20` és de tipus `Int`, el compilador infereix automàticament que `age` també és de tipus `Int`.

Un cop el tipus queda determinat, ja no es pot assignar un valor d'un altre tipus.

A més, el botó `changeAge2` no falla "en temps d'execució", sinó que l'error apareix ja en fase de compilació i el codi ni tan sols podrà compilar.

Aquesta és també una de les avantatges dels llenguatges fortament tipats com Swift: permeten detectar problemes de tipus mentre s'escriu el codi.

### Forma correcta

Després d'eliminar el codi erroni:

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Quan es premi el botó `changeAge1`, la vista s'actualitzarà a:

```
age: 18
```

### Declaració explícita del tipus (opcional)

També podem indicar clarament el tipus quan definim la variable:

```swift
@State private var age: Int = 20
```

Aquesta forma fa que el tipus sigui més clar, però en escenaris simples no és imprescindible.

## Resum

En aquesta lliçó hem après principalment el sistema de tipus de Swift i el seu paper en el desenvolupament real.

En Swift, cada valor té un tipus clar, i el tipus determina el significat de les dades i les operacions en què poden participar.

Swift és fortament tipat: un cop una variable té un tipus determinat, ja no pot rebre valors d'un altre tipus. Aquesta restricció permet detectar errors en fase de compilació, reduir problemes en temps d'execució i millorar la seguretat del codi.

El tipus d'una variable es pot inferir automàticament a partir del valor inicial, o bé es pot declarar explícitament. En alguns casos, com ara arrays buits, errors d'inferència o tipus personalitzats, el compilador no pot deduir el tipus correctament i llavors cal declarar-lo manualment.

Els diferents tipus no es poden convertir automàticament entre si: cal utilitzar formes explícites com `Int()`, `Double()` o `String()`.

Els tipus també admeten àlies. Especialment en projectes complexos, això pot millorar la llegibilitat del codi.

Els tipus no són només una etiqueta de dades, sinó també un mecanisme de restricció que garanteix que l'ús de les dades sigui segur, clar i controlable.

## Coneixement ampliat - Tipus opcionals

Quan fem conversions de tipus, algunes operacions poden fallar.

Per exemple, convertir un `String` en `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Aquí, `Double(input)` no retorna un `Double`, sinó:

```
Double?
```

Això és un tipus opcional (`Optional`).

### Per què retorna un opcional?

Perquè el contingut d'una cadena no és segur. `"3.14"` es pot convertir en `Double`, però `"Hello"` no.

És a dir, aquesta operació pot tenir èxit o pot fallar.

Per això, Swift utilitza el tipus opcional per representar aquesta incertesa.

### Què és un tipus opcional?

Un tipus opcional vol dir que un valor pot existir o pot no existir.

Per exemple:

```
Double?
```

Aquest tipus significa que, si hi ha un valor, en imprimir-lo es mostrarà com `Optional(...)`; i si no n'hi ha, retornarà `nil`.

Cal tenir en compte que `nil` significa "no hi ha valor", no pas `0` ni una cadena buida.

### Exemple

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Sortida:

```
pi:Optional(3.14)
```

Això significa que la cadena s'ha convertit correctament a `Double`, obtenint `3.14`, però com que el tipus és `Double?`, queda embolcallat dins d'`Optional`.

Si la conversió falla:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Sortida:

```
pi: nil
```

Com que `"Hello"` no es pot convertir a `Double`, la conversió falla i es retorna `nil`.

### Què és Optional(...)?

Quan imprimim directament un tipus opcional:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift mostrarà la seva "descripció de depuració":

```
Optional(3.14)
```

Això no forma part de la dada real, sinó que indica que el valor actual és un "tipus opcional" i que a dins conté un valor.

### Desempaquetar un tipus opcional

En el desenvolupament real, normalment necessitem extreure el valor real d'un tipus opcional. Aquest procés s'anomena desempaquetament (`Unwrapping`).

Una manera habitual és utilitzar `??` per proporcionar un valor per defecte:

```
??
```

Això s'anomena operador de coalescència de nil (`Nil-Coalescing Operator`).

Per exemple:

```swift
name ?? "FangJunyu"
```

Això significa que, si `name` té un valor, es retorna aquest valor; si és `nil`, s'utilitza el valor per defecte `"FangJunyu"`.

Cal tenir en compte que el tipus del valor per defecte ha de coincidir amb el tipus de l'opcional.

### Utilitzar ?? per proporcionar un valor per defecte

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Sortida:

```
pi: 30
```

Quan `input` es converteix a `Double`, la conversió té èxit i es mostra el valor obtingut. Si la conversió fallés, es mostraria el valor per defecte proporcionat per `??`.

Si la conversió falla:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Sortida:

```
pi: 10
```

Aquí, quan `input` es converteix a `Double`, la conversió falla i retorna `nil`. Aleshores, `??` proporciona un valor per defecte per a aquest `nil`.

Els tipus opcionals s'utilitzen per representar situacions en què "pot haver-hi valor, o pot no haver-n'hi".

En operacions que poden fallar, com la conversió de tipus, Swift retorna un tipus opcional per garantir la seguretat del programa.

Quan necessitem utilitzar aquest valor, podem proporcionar un valor per defecte amb `??`, i així, fins i tot si apareix `nil`, encara podrem obtenir un resultat raonable.
