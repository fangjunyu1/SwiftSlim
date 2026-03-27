# Operadores

En esta lección aprenderemos los operadores de Swift (`Operators`).

Cada vez que hacemos cálculos, comparaciones o juicios lógicos, necesitamos usar operadores. Estas operaciones atraviesan todas las etapas de ejecución de un programa y forman una de las capacidades más básicas de la programación.

```swift
let a = 100 * 8
```

Durante el aprendizaje de la programación, muchas personas descubren que quienes tienen cierta base de pensamiento matemático suelen entender mejor la lógica de los programas. Esto se debe a que la programación, en esencia, no puede separarse del “cálculo” y de las “reglas de decisión”, y los operadores son precisamente los encargados de esas funciones.

En el desarrollo real, los operadores no se usan solo para cálculos numéricos simples, sino también en muchos escenarios concretos.

Por ejemplo, en un juego de bloques, cuando el usuario arrastra un bloque hasta una posición determinada, necesitamos calcular:

- La posición de coordenadas del bloque
- Las posiciones donde puede colocarse
- Si la posición objetivo está disponible

Estos procesos de “cálculo + decisión” dependen esencialmente de los operadores.

![Block](../../Resource/013_block.png)

Aprender operadores no significa solo aprender a calcular números, sino sentar las bases para el diseño de interfaces, el procesamiento de datos y la lógica de interacción que veremos después.

## Cómo se ejecutan los cálculos en SwiftUI

En SwiftUI, normalmente disparamos una función mediante `Button` y luego ejecutamos la lógica de cálculo dentro de esa función.

Por ejemplo:

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Al pulsar el botón, la `Console` mostrará:

```text
c: 20
```

En esta lección, escribiremos la lógica de operación dentro de `func`, ejecutándola mediante botones y usando `print` para mostrar el resultado.

En los ejemplos posteriores, para simplificar el código, marcaremos directamente el resultado dentro del propio código y no repetiremos `print` en cada caso.

## Gestión de la salida en Console

Como cada clic genera información de salida, puedes pulsar el botón de limpieza en la esquina inferior derecha del área de `Console` para borrar el historial y ver con más claridad el resultado actual.

![Console](../../Resource/013_console.png)

## Otra forma de escribir Button

Cuando un botón solo ejecuta una función, se puede usar una sintaxis más simple:

```swift
Button(action: ) {
    // View
}
```

En esta sintaxis, `action` indica la función que debe ejecutarse al pulsar el botón (una función sin parámetros), y las llaves `{}` se usan para definir la vista que se muestra en el botón.

Combinándolo con la función `calculate` de antes, podemos escribir:

```swift
Button(action: calculate) {
    Text("Button")
}
```

Cuando pulses el botón, se ejecutará directamente la función `calculate`.

Por eso, cuando la lógica del botón es simple y solo llama a una función, usar la forma con `action` es más claro y también más acorde a las buenas prácticas.

## Operadores aritméticos

Los operadores aritméticos (`Arithmetic Operators`) se utilizan para cálculos numéricos:

- `+` suma
- `-` resta
- `*` multiplicación
- `/` división
- `%` resto

Ejemplo:

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Hay que tener en cuenta que Swift es un lenguaje fuertemente tipado y no mezcla automáticamente tipos de datos distintos:

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Cuando los tipos son distintos, hay que convertirlos manualmente.

## Operadores de comparación

Los operadores de comparación (`Comparison Operators`) se usan para comparar la relación entre dos valores, y el resultado es de tipo `Bool`:

- `==` igual a
- `!=` distinto de
- `>` mayor que
- `<` menor que
- `>=` mayor o igual que
- `<=` menor o igual que

Ejemplo:

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Los operadores de comparación se usan mucho en sentencias condicionales. Por ejemplo, en el “carrusel de citas” necesitamos controlar que el índice no supere el rango del array:

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Si `index` es menor que `sayings.count - 1`, el resultado de la comparación será `true` y se ejecutará el código dentro del `if`; si es `false`, no se ejecutará.

## Operadores lógicos

Los operadores lógicos (`Logical Operators`) se usan para combinar varias condiciones:

- `&&` y (`AND`)
- `||` o (`OR`)
- `!` no (`NOT`)

### && y

Cuando varias condiciones deben cumplirse al mismo tiempo, usamos `&&`.

Por ejemplo:

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

En este código hay dos condiciones: `age >= 18` y `age <= 100`.

Solo cuando ambas sean `true`, `legalAge` será `true`; basta con que una no se cumpla para que el resultado sea `false`.

### || o

Cuando basta con que se cumpla una sola condición entre varias, usamos `||`.

Por ejemplo:

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Este código significa que, mientras se cumpla `money >= 50` o `creditCard >= 50`, `payAllowed` será `true`.

Solo cuando ambas condiciones sean falsas, el resultado será `false`.

Por ejemplo, en un escenario de pago, podemos pagar en efectivo o con tarjeta de crédito. Si ninguna de las dos opciones es válida, el pago falla.

### ! no

`!` es el operador lógico de negación (`NOT`), y se usa para invertir un valor `Bool`.

Podemos entenderlo así: `!` convierte `true` en `false`, y `false` en `true`.

Por ejemplo:

```swift
let allowed = true
let result = !allowed   // false
```

Aquí `!allowed` significa invertir el valor de `allowed`.

Hay que tener cuidado con no confundir `!` y `!=`: `!` invierte un valor `Bool`, mientras que `!=` es un operador de comparación que devuelve un `Bool`.

## Operadores de asignación

Los operadores de asignación (`Assignment Operators`) se usan para asignar o actualizar variables:

- `=` asignación

Tanto en la declaración de variables como durante los cálculos aparece continuamente la operación de asignar:

```swift
let a = 5
```

Este código significa que el valor `5` se asigna a la variable `a`.

### Operadores de asignación compuesta

En el desarrollo real, además del operador básico de asignación, también se usan mucho los operadores de asignación compuesta, que permiten calcular sobre el valor actual y actualizarlo directamente:

- `+=`
- `-=`
- `*=`
- `/=`

En la lección del “contador” ya vimos una introducción a estos operadores.

Por ejemplo, cuando queremos que una variable aumente automáticamente al pulsar un botón:

```swift
var num = 10
num += 5   // num = 15
```

Este código significa que `num` se suma con `5`, y después el resultado se vuelve a asignar a `num`.

Por lo tanto, equivale a:

```swift
var num = 10
num = num + 5   // num = 15
```

## Operador ternario

En Swift, el operador ternario (`Ternary Operator`) evalúa una condición y devuelve uno de dos resultados:

```swift
condición ? valor1 : valor2
```

La lógica es: si la condición es `true`, devuelve `valor1`; si es `false`, devuelve `valor2`.

Por ejemplo:

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Este código comprueba el valor de `showColor`: si es `true`, devuelve `Color.blue` y el fondo será azul; si es `false`, devuelve `Color.clear` y no se mostrará color de fondo.

Consejo: `Color.clear` significa color transparente, es decir, no mostrar contenido.

### Diferencia con if-else

El operador ternario es lógicamente equivalente a una sentencia `if-else`.

Por ejemplo, el código anterior también puede escribirse así:

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

La lógica es exactamente la misma: si la condición es `true`, se usa el primer resultado; si es `false`, se usa el segundo.

En el uso práctico, el operador ternario es más conciso y resulta más adecuado para expresar juicios simples de “una cosa u otra”, especialmente cuando queremos devolver un valor directamente.

En la construcción de vistas de SwiftUI, el operador ternario es muy común. Por ejemplo:

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Esta forma permite cambiar el efecto visual de la vista según una condición en una sola línea de código.

## Operadores de rango

Los operadores de rango (`Range Operators`) se usan para representar intervalos:

- `...` rango cerrado (incluye ambos extremos)
- `..<` rango semiabierto (no incluye el extremo derecho)

Por ejemplo:

```text
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

Podemos entenderlo así: `1...3` significa de `1` a `3`, incluyendo el `3`; `5..<8` significa de `5` a `8`, pero sin incluir el `8`.

Formas extendidas (solo para conocerlas):

```text
5...    // >= 5
...5    // <= 5
```

Esta sintaxis representa un “rango unilateral”, y suele usarse en condiciones o en pattern matching.

Los operadores de rango aparecerán más adelante cuando estudiemos los bucles `for`. Por ahora basta con entenderlos como una sección continua de valores.

## Practicar operadores

A continuación, practicaremos el uso de operadores con algunos ejemplos simples dentro de la vista.

### 1. Calcular el total de vehículos

Por ejemplo, si por un cruce pasan `500` vehículos al día, podemos calcular cuántos pasan en `30` días.

Podemos usar operadores aritméticos:

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

El proceso de cálculo aquí es: `500` vehículos al día, durante `30` días, así que el total es `500 × 30`, lo que da `15000`.

### 2. Comprobar si es miembro por compra interna

Podemos decidir si alguien es miembro de compra interna: basta con que tenga una membresía de por vida o una suscripción activa para considerarlo miembro.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Aquí se usa el operador `||` (`o`): `lifeTime = false` significa que no tiene membresía de por vida; `subscription = true` significa que sí tiene suscripción.

Como basta con que una de las condiciones se cumpla, `isMember` será `true`. Por lo tanto, esta persona es miembro.

## Resumen

En Swift, los operadores son la base del cálculo de datos y del juicio lógico. Igual que `Text` se usa para mostrar contenido, los operadores se usan para procesar los datos en sí mismos.

Desde los cálculos numéricos más sencillos hasta las decisiones lógicas más complejas, pasando por el control de estado de una vista y los cálculos de layout, todo requiere la participación de operadores.

Practicando en diferentes escenarios, podemos familiarizarnos poco a poco con los distintos operadores presentados en esta lección. Esa será una base importante para el aprendizaje posterior.

### Conocimiento ampliado - operadores bit a bit

Además, Swift también ofrece una clase de operadores más cercanos al nivel bajo: los operadores bit a bit (`Bitwise Operators`):

- `&` (AND bit a bit)
- `|` (OR bit a bit)
- `^` (XOR bit a bit)
- `~` (NOT bit a bit)
- `>>` (desplazamiento a la derecha)
- `<<` (desplazamiento a la izquierda)

Por ejemplo:

```swift
let a = 6  // binario 110
let b = 3  // binario 011

print(a & b) // 2 (binario 010)
print(a | b) // 7 (binario 111)
print(a ^ b) // 5 (binario 101)
print(~a)    // -7 (negación)
```

En Swift, los enteros se representan en complemento a dos, por lo que al invertir bits se obtiene el número negativo correspondiente.

Los operadores bit a bit actúan directamente sobre el binario y suelen utilizarse en escenarios de procesamiento de datos de bajo nivel y optimización de rendimiento.

Para los principiantes, estos operadores tienen menos usos habituales y tampoco son muy comunes en el desarrollo general con iOS o SwiftUI, por eso aquí no profundizaremos demasiado.

Si más adelante encuentras lógica de bajo nivel o temas de optimización, podrás estudiarlos con más detalle.
