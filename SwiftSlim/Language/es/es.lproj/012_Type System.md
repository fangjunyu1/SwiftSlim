# Sistema de tipos

En lecciones anteriores ya aprendimos qué son las variables y sabemos que pueden guardar datos de distintos tipos.

Por ejemplo:

```swift
var hello = "Hello, World"
```

Aquí `hello` guarda un fragmento de texto, por lo tanto su tipo es `String`.

A continuación estudiaremos de manera sistemática el concepto de tipo (`Type`), así como la declaración explícita de tipos y la inferencia de tipos, para entender con mayor profundidad la naturaleza de las variables.

## Qué es un tipo

En Swift, cada valor tiene un tipo claro. El tipo determina qué es ese valor y qué puede hacer.

Por ejemplo:

- `42` es un `Int` (entero)
- `"Hello"` es `String` (cadena)
- `true` es `Bool` (booleano)

Pertenecen a tipos distintos y, por tanto, también tienen usos distintos.

## Tipos básicos comunes en Swift

En la etapa inicial, los tipos más habituales son los siguientes:

- `String`: cadena (texto)
- `Int`: entero
- `Double`: número de punto flotante (con decimales y mayor precisión)
- `Bool`: valor booleano (`true`/`false`)

Además de estos, también existe `Float` (otro tipo de punto flotante, pero con menor precisión que `Double`, por lo que se usa menos) y `Character` (un solo carácter), como `"A"` o `"!"`.

### Declaración de tipo (tipo explícito)

En Swift, podemos especificar manualmente el tipo al declarar una variable:

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

Es decir, añadimos `: Tipo` después del nombre de la variable.

La sintaxis del tipo de un array es `: [Tipo]`:

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

En este código, el array `scores` solo puede guardar elementos de tipo `Int`, mientras que `tags` solo puede guardar elementos de tipo `String`.

Declarar explícitamente el tipo hace que la intención del código sea más clara y, en algunos casos, ayuda a evitar errores de inferencia de tipos.

## Inferencia de tipos

En muchos casos no hace falta declarar el tipo de forma explícita:

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]    // [Int]
var tags = ["Swift", "iOS"] // [String]
```

Esto se debe a que el compilador de Swift puede inferir automáticamente el tipo a partir del “valor inicial”.

## Declaración explícita e inferencia de tipos

En las lecciones anteriores no introdujimos la declaración explícita, por ejemplo:

```swift
var age: Int = 18
```

Sino que dimos prioridad a la inferencia de tipos:

```swift
var age = 18
```

En este ejemplo, ambas formas son equivalentes y en ambas `age` se determinará como tipo `Int`. En comparación, la escritura con inferencia de tipos es más concisa.

La razón por la que al principio no insistimos tanto en la declaración explícita es que la inferencia de tipos reduce la información extra dentro del código, y así disminuye el coste de comprensión para quienes están empezando.

## Por qué necesitamos tipos

Swift es un lenguaje fuertemente tipado (`Strongly Typed Language`).

Eso significa que, una vez determinado el tipo de una variable, no se puede cambiar arbitrariamente.

Por ejemplo:

```swift
var age: Int = 18

age = 20    // Success
age = "20"  // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

El primer `20` es de tipo `Int`, así que puede asignarse a `age`; el segundo `"20"` es de tipo `String`, y como no coincide con `Int`, producirá un error.

`nums` es un array de tipo `[Int]`, así que solo puede almacenar enteros y no puede mezclar cadenas.

Los tipos imponen restricciones sobre el uso de los datos y permiten detectar problemas de incompatibilidad de tipos en tiempo de compilación, reduciendo así los bugs derivados de mezclar tipos y mejorando la estabilidad y el mantenimiento del código.

## Cuándo es obligatorio declarar el tipo explícitamente

Aunque Swift puede inferir tipos automáticamente, hay situaciones en las que el compilador no puede hacerlo, o puede inferirlo mal. En esos casos debemos declararlo manualmente.

**1. Arrays vacíos**

Al crear un array vacío, es obligatorio declarar el tipo:

```swift
var nums: [Int] = []
```

Si no se escribe el tipo:

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

El compilador no puede inferir el tipo de los elementos a partir de un array vacío, y por eso aparece el error de compilación.

**2. Evitar inferencias incorrectas**

```swift
var value = 10   // Int
```

En este ejemplo, aunque `10` también podría representar un número de punto flotante (`Double`), como no tiene punto decimal el compilador lo inferirá por defecto como `Int`.

Si queremos que `value` represente un número de punto flotante, entonces debemos declararlo explícitamente:

```swift
var value: Double = 10   // Double
```

Cuando el resultado de la inferencia no coincide con lo que esperamos, debemos usar una declaración explícita o ajustar la forma literal para asegurarnos de que el tipo es el correcto.

**3. Tipos personalizados**

Más adelante aprenderemos tipos personalizados, y cuando se usan suele ser habitual declararlos explícitamente:

```swift
var info: GameInfo
var users: [User] = []
```

La razón es la misma que con los arrays vacíos: el compilador no puede inferir el tipo automáticamente a partir de un valor vacío.

## Conversión de tipos

En Swift, los distintos tipos no se convierten automáticamente entre sí; hay que hacer la conversión manualmente.

Por ejemplo, si queremos sumar dos números de tipos distintos:

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b    // Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

En este código, `a` es de tipo `Int` y `b` es de tipo `Double`. Como los tipos son distintos, no pueden operar directamente entre sí.

Antes de hacer la operación, debemos convertir uno de ellos al mismo tipo que el otro:

```swift
var result = Double(a) + b
```

Este código significa que convertimos `a`, que es `Int`, en un `Double`, y luego lo sumamos con `b`, guardando el resultado en `result`.

Hay que tener en cuenta que una conversión de tipo no modifica el tipo original de la variable. Por ejemplo, `Double(a)` no cambia el hecho de que `a` siga siendo `Int`; simplemente crea un nuevo valor de tipo `Double` para usarlo en la operación.

Otros tipos también pueden convertirse de manera parecida, usando la forma `TipoObjetivo()` y pasando dentro el valor que se quiere convertir. Por ejemplo:

```text
Int()、Double()、String()
```

Ejemplo:

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Hay que tener en cuenta que no todas las conversiones se realizan “perfectamente”. Por ejemplo, al convertir `Double → Int`, la parte decimal se corta directamente, sin redondearse.

## Alias de tipo

En Swift, también podemos ponerle un alias a un tipo existente para que el significado del código sea más claro:

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Aquí `UserID` en esencia sigue siendo `Int`, el tipo no ha cambiado; simplemente el nombre expresa mejor su propósito.

En proyectos grandes o con tipos complejos, los aliases de tipo pueden hacer que el código sea más legible.

## Ejemplo de tipos

A continuación, veremos un ejemplo sencillo para mostrar el papel de los tipos en el desarrollo real.

### Crear una variable

Primero creamos una variable `age`:

```swift
var age = 20
```

Como necesitamos mostrar y modificar esta variable en SwiftUI, debemos declararla usando `@State`:

```swift
@State private var age = 20
```

Ya mencionamos antes `private`: significa que esta variable solo puede usarse dentro de la vista actual. Más adelante la estudiaremos con más detalle.

### Mostrar datos en SwiftUI

Mostrar la variable `age` en SwiftUI:

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

Ahora la vista mostrará:

```swift
age: 20
```

### Modificar datos

A continuación añadimos dos botones para modificar `age`:

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Resultado de ejecución

Cuando se pulsa `changeAge1`, a `age` se le asigna `18`:

```swift
age = 18
```

Como `18` es de tipo `Int` y coincide con el tipo de `age`, la asignación se realiza con éxito.

En cambio, `changeAge2` dará error:

```swift
age = "18"
```

Mensaje de error:

```text
Cannot assign value of type 'String' to type 'Int'
```

Esto se debe a que `"18"` es de tipo `String` y `age` es de tipo `Int`; los tipos no coinciden, por lo que la asignación no es posible.

### ¿Por qué se produce el error?

La clave está en esta línea:

```swift
@State private var age = 20   // Int
```

Aunque no declaramos el tipo explícitamente, como el valor inicial `20` es de tipo `Int`, el compilador inferirá automáticamente que `age` también es `Int`.

Una vez que el tipo queda determinado, ya no se puede volver a asignar otro tipo distinto.

Además, el botón `changeAge2` no falla “en tiempo de ejecución”, sino que el error aparece directamente en tiempo de compilación y el código no llegará a compilar.

Esta es también una de las ventajas del sistema de tipos fuertes de Swift: permite detectar problemas de tipo antes de ejecutar el programa.

### Forma correcta

Después de eliminar el código erróneo:

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

Al pulsar el botón `changeAge1`, la vista se actualizará a:

```text
age: 18
```

### Declaración explícita del tipo (opcional)

También podemos indicar claramente el tipo al definir la variable:

```swift
@State private var age: Int = 20
```

Esta forma hace que el tipo sea más claro, aunque en escenarios sencillos no es obligatoria.

## Resumen

En esta lección hemos visto principalmente el sistema de tipos de Swift y el papel que desempeña en el desarrollo real.

En Swift, cada valor tiene un tipo claro. El tipo determina el significado de los datos y también qué operaciones pueden realizarse sobre ellos.

Swift es fuertemente tipado: una vez que una variable ha determinado su tipo, ya no puede recibir un valor de otro tipo. Esta restricción permite detectar errores en tiempo de compilación, reduciendo problemas en tiempo de ejecución y mejorando la seguridad del código.

El tipo de una variable puede inferirse automáticamente a partir del valor inicial o declararse explícitamente. En algunas situaciones, como arrays vacíos, errores de inferencia o tipos personalizados, el compilador no puede inferir correctamente el tipo, y entonces es obligatorio declararlo explícitamente.

Los tipos distintos no pueden convertirse automáticamente entre sí, sino que deben convertirse explícitamente mediante `Int()`, `Double()`, `String()` y otras funciones similares.

Los tipos también admiten alias, y especialmente en proyectos complejos los aliases de tipo pueden mejorar la legibilidad.

Un tipo no es solo una etiqueta para los datos, sino también un mecanismo de restricción que garantiza que el uso de los datos sea seguro, claro y controlable.

## Conocimiento ampliado - tipos opcionales

Durante la conversión de tipos, algunas operaciones pueden fallar.

Por ejemplo, convertir un `String` en `Double`:

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Aquí `Double(input)` no devuelve un `Double`, sino:

```text
Double?
```

Eso es un tipo opcional (`Optional`).

### ¿Por qué devuelve un tipo opcional?

Porque el contenido de una cadena es incierto: `"3.14"` puede convertirse en `Double`, pero `"Hello"` no puede.

Es decir, la operación puede tener éxito o puede fallar.

Por eso Swift usa un tipo opcional para representar esa incertidumbre.

### ¿Qué es un tipo opcional?

Un tipo opcional significa: un valor puede existir, o puede no existir.

Por ejemplo:

```text
Double?
```

Este tipo significa que, si hay valor, al imprimirlo aparecerá como `Optional(...)`; y si no lo hay, el resultado será `nil`.

Hay que tener en cuenta que `nil` significa “no hay valor”, y no `0` ni una cadena vacía.

### Ejemplo

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Salida:

```text
pi:Optional(3.14)
```

Esto significa que la cadena se convirtió correctamente en `Double` y dio como resultado `3.14`, pero como el tipo es `Double?`, queda envuelto dentro de `Optional`.

Si la conversión falla:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Salida:

```text
pi: nil
```

Como `"Hello"` no puede convertirse al tipo `Double`, la conversión falla y devuelve `nil`.

### ¿Qué es Optional(...)?

Cuando imprimimos directamente un tipo opcional:

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift mostrará su “descripción de depuración”:

```text
Optional(3.14)
```

Esto no forma parte del dato real, sino que es una indicación de que el valor actual es un “tipo opcional” que contiene internamente un valor.

### Desempaquetar un tipo opcional

En el desarrollo real, normalmente necesitamos sacar el valor real de un tipo opcional. A este proceso se le llama desempaquetado (`Unwrapping`).

Una forma común es usar `??` para proporcionar un valor por defecto:

```text
??
```

Esto se llama operador de coalescencia nula (`Nil-Coalescing Operator`).

Por ejemplo:

```swift
name ?? "FangJunyu"
```

Este código significa que, si `name` tiene valor, se devuelve ese valor; si es `nil`, se usa el valor por defecto `"FangJunyu"`.

Hay que tener en cuenta que el tipo del valor por defecto debe coincidir con el del tipo opcional.

### Usar ?? para proporcionar un valor por defecto

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")    // 30
```

Salida:

```text
pi: 30
```

Cuando `input` se convierte a `Double`, la conversión tiene éxito y se imprime el valor. Si la conversión fallara, se imprimiría el valor por defecto proporcionado por `??`.

Si la conversión falla:

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Salida:

```text
pi: 10
```

Aquí, al intentar convertir `input` en `Double`, la conversión falla y devuelve `nil`, por lo que `??` proporciona un valor por defecto.

Los tipos opcionales se usan para representar situaciones en las que “puede haber valor o puede no haberlo”.

En operaciones que pueden fallar, como las conversiones de tipo, Swift devuelve un tipo opcional para mantener la seguridad del programa.

Cuando necesitamos usar el valor interno, podemos proporcionar un valor por defecto mediante `??`, de modo que incluso si aparece `nil`, seguimos obteniendo un resultado razonable.
