# Propiedades calculadas

En esta lección aprenderemos principalmente las propiedades calculadas.

Las propiedades calculadas se usan para calcular un resultado nuevo a partir de datos existentes. Pueden calcular valores numéricos y también contenido que debe mostrarse en vistas de SwiftUI.

Por ejemplo:

```swift
let a = 10
let b = 20
let c = a + b
```

Aquí `c` representa el resultado de sumar `a` y `b`.

En el código normal, esta forma de escribir es muy común.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Consejo: dentro del evento de toque de un `Button` se puede ejecutar código Swift normal.

Pero si escribimos código similar directamente en las propiedades de una vista SwiftUI, encontraremos un problema.

Por ejemplo:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Este código producirá un error.

Parece que `a` y `b` ya están escritos antes de `c`, así que parece que se podría calcular el valor de `c`.

Pero en la declaración de propiedades de una estructura, esta escritura no se puede usar directamente.

## Por qué c no puede calcular directamente a + b

Porque `a`, `b` y `c` no son constantes temporales dentro del evento de toque de un botón, sino propiedades dentro de la vista `ContentView`.

Dentro del evento de toque del botón, este código puede ejecutarse normalmente:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Porque después de tocar el botón, el código se ejecuta en orden. Primero se crea `a`, luego se crea `b` y finalmente se calcula `c` con `a + b`.

Pero al declarar propiedades dentro de una vista, la situación es diferente:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Aquí `a`, `b` y `c` son todas propiedades dentro de la vista `ContentView`.

Cuando se crea la vista `ContentView`, Swift necesita preparar primero estas propiedades. Para mantener seguro el proceso de creación, Swift no permite que el valor predeterminado de una propiedad almacenada de instancia lea directamente otras propiedades de la misma instancia.

Por eso esta línea producirá un error:

```swift
let c = a + b
```

Podemos entenderlo de forma sencilla así: **al declarar propiedades dentro de una vista, no podemos usar directamente una propiedad normal para calcular otra propiedad normal.**

Una propiedad que almacena directamente un valor se llama "propiedad almacenada". Para facilitar la comprensión, también podemos entenderla temporalmente como una propiedad normal.

Por ejemplo:

```swift
let a = 10
```

`a` almacena `10`.

```swift
let b = 20
```

`b` almacena `20`.

Pero:

```swift
let c = a + b
```

Aquí `c` no es un valor escrito directamente, sino que queremos calcularlo mediante `a + b`.

Para este tipo de situación, en la que "obtenemos un resultado a partir de datos existentes", una propiedad calculada es más adecuada.

Podemos cambiarlo a:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Aquí `c` es una propiedad calculada.

```swift
var c: Int {
    return a + b
}
```

Significa: **cuando sea necesario usar `c`, lee `a` y `b` en ese momento y devuelve el resultado de `a + b`.**

Por ejemplo:

```swift
Text("c: \(c)")
```

Cuando `Text` muestra `c`, en ese momento se activa el cálculo de `c`.

## ¿Qué es una propiedad calculada?

Una propiedad calculada parece una variable, pero no almacena datos por sí misma.

Por ejemplo:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Aquí `c` es una propiedad calculada.

No almacena un valor fijo como una propiedad normal, sino que cada vez que se lee `c`, vuelve a ejecutar el código dentro de `{}` y devuelve el resultado del cálculo.

Podemos entenderlo así:

```swift
var c: Int {
    return a + b
}
```

Cuando necesitamos usar `c`, se calcula `a + b`.

Por eso una propiedad calculada es adecuada para esta situación: **un resultado no necesita almacenarse por separado, porque se puede calcular a partir de datos existentes.**

## Escritura básica

Una propiedad calculada normalmente contiene tres partes:

```swift
var c: Int {
    return a + b
}
```

### 1. Declarar con `var`

```swift
var c
```

Una propiedad calculada debe declararse con `var`; no se puede usar `let`.

Porque una propiedad calculada no es un valor almacenado fijo, sino un resultado que se calcula dinámicamente cada vez que se lee.

### 2. Indicar el tipo de retorno

```swift
var c: Int
```

Una propiedad calculada necesita indicar el tipo que devuelve.

Aquí `c` finalmente devolverá un entero, por eso el tipo es `Int`.

### 3. Usar {} para escribir la lógica de cálculo

```swift
{
    return a + b
}
```

Dentro de `{}` se escribe la lógica de cálculo; aquí se devuelve `a + b`.

## La palabra clave return

Una propiedad calculada necesita devolver un resultado.

Por ejemplo:

```swift
var c: Int {
    return a + b
}
```

Aquí `return` significa: devuelve hacia afuera el resultado del cálculo `a + b`.

Si la propiedad calculada solo contiene una expresión que produce directamente un resultado, se puede omitir `return`:

```swift
var c: Int {
    a + b
}
```

Pero si la propiedad calculada contiene varias líneas de código, hay que usar `return` para devolver claramente el resultado.

Por ejemplo:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Aquí el proceso de cálculo se divide en dos pasos.

Primer paso, calcular primero el precio total:

```swift
let total = count * price
```

Segundo paso, unir el precio total en un texto y devolverlo:

```swift
return "Total: \(total) $"
```

Si quitamos `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total: \(total) $"
}
```

Este código producirá un error.

La razón es: **esta propiedad calculada ya contiene varias líneas de código, y Swift ya no puede determinar automáticamente qué línea es el resultado final que debe devolverse.**

Por eso, cuando una propiedad calculada solo tiene una línea de resultado, se puede omitir `return`.

```swift
var c: Int {
    a + b
}
```

Cuando una propiedad calculada contiene varias líneas de código, se recomienda escribir `return` claramente.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

## Diferencia entre propiedades calculadas y propiedades normales

Las propiedades normales almacenan datos.

```swift
var c = 30
```

Aquí `c` almacena un valor concreto: `30`.

Las propiedades calculadas no almacenan datos.

```swift
var c: Int {
    a + b
}
```

Aquí `c` no almacena `30`. Solo proporciona una forma de calcular.

Cuando se lee `c`, Swift ejecuta:

```swift
a + b
```

Luego devuelve el resultado del cálculo.

Por eso las propiedades calculadas son adecuadas para situaciones en las que un resultado se calcula a partir de otros datos.

## body también es una propiedad calculada

Después de aprender las propiedades calculadas, podemos volver a entender uno de los fragmentos más comunes en SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Aquí `body` también es una propiedad calculada.

Se declara con `var`:

```swift
var body
```

Tiene un tipo de retorno:

```swift
some View
```

Dentro de sus `{}` devuelve contenido de una vista SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

Por eso `body` se puede entender así: cuando SwiftUI necesita mostrar esta vista, lee `body` y genera la interfaz según el contenido que devuelve `body`.

Si escribimos `return`, podemos entenderlo así:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Pero en SwiftUI normalmente omitimos `return` y escribimos directamente:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Cuando los datos `@State` cambian, SwiftUI vuelve a leer `body` y actualiza la interfaz según los datos nuevos.

Por ejemplo:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("cantidad: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Después de tocar el botón, `count` cambiará.

```swift
count += 1
```

Después de que `count` cambie, SwiftUI vuelve a calcular `body`, por eso el texto de la interfaz también se actualiza.

```swift
Text("cantidad: \(count)")
```

Esta también es la razón por la que en SwiftUI la interfaz puede actualizarse automáticamente después de que cambien los datos.

### No se recomienda escribir cálculos complejos en body

Como `body` es una propiedad calculada, puede leerse y recalcularse muchas veces.

Por ejemplo:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("número: \(num)")
            Text("nombre: \(name)")
        }
    }
}
```

Cuando `name` cambia, SwiftUI vuelve a calcular `body`.

En ese momento, el código dentro de `body` también se ejecuta de nuevo, y `num` también se vuelve a crear.

```swift
let num = 10
```

El `num` de este ejemplo es muy simple, así que el impacto no es grande.

Pero si se ejecutan cálculos complejos en `body`, como filtrar muchos datos, ordenar, procesar imágenes, etc., puede afectar la fluidez de la interfaz.

Por eso, en SwiftUI, `body` debería encargarse principalmente de describir la estructura de la interfaz.

Los datos temporales simples se pueden escribir dentro de `body`.

Los cálculos complejos se pueden colocar en propiedades calculadas fuera de `body`, en métodos o en un procesamiento de datos separado.

## Ejemplo: cantidad y precio total

A continuación, entenderemos las propiedades calculadas con un ejemplo sencillo.

Supongamos que el precio unitario de una zanahoria es 2 $, el usuario puede tocar botones para modificar la cantidad comprada y la interfaz necesita mostrar el precio total.

La forma de calcular el precio total:

```
cantidad * precio unitario
```

Si usamos una variable normal para almacenar el precio total, será un poco complicado.

Porque cada vez que cambie la cantidad, tendremos que actualizar manualmente el precio total.

Una mejor forma es usar una propiedad calculada:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("precio: \(price) $")
                Text("cantidad: \(count)")
                Text("precio total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Resultado visual:

![view](../../Resource/024_view.png)

En este ejemplo:

```swift
@State private var count = 1
```

`count` representa la cantidad de zanahorias. Cuando se toca el botón, `count` cambia.

```swift
private let price = 2
```

`price` representa el precio unitario de la zanahoria. Aquí es un valor fijo, así que se usa `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` representa el precio total.

No necesita almacenarse por separado, porque el precio total siempre se puede calcular con `count * price`.

Cuando `count` es `1`:

```swift
totalPrice = 1 * 2
```

El resultado mostrado es:

```swift
precio total: 2 $
```

Después de tocar el botón `+`, `count` pasa a ser `2`.

En este momento, cuando se lee `totalPrice` de nuevo, se recalcula:

```swift
totalPrice = 2 * 2
```

El resultado mostrado es:

```swift
precio total: 4 $
```

Esta es la función de una propiedad calculada: calcular dinámicamente un nuevo resultado a partir de datos existentes.

## Las propiedades calculadas pueden usarse para comprobaciones

Las propiedades calculadas no solo pueden calcular valores numéricos, sino que también pueden devolver resultados de comprobaciones.

Por ejemplo, cuando queremos que la cantidad mínima sea 1.

Cuando la cantidad ya es 1, el botón `-` no debería seguir disminuyéndola.

Podemos agregar una propiedad calculada:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Código completo:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("precio: \(price) $")
                Text("cantidad: \(count)")
                Text("precio total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Resultado visual:

![view](../../Resource/024_view1.png)

Aquí:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Este código indica si actualmente se puede seguir disminuyendo.

Cuando `count` es mayor que `1`:

```swift
canDecrease == true
```

significa que se puede disminuir.

Cuando `count` es igual a `1`:

```swift
canDecrease == false
```

significa que no se puede seguir disminuyendo.

### Comprobación condicional en el botón

En el botón se usa:

```swift
if canDecrease {
    count -= 1
}
```

Solo cuando `canDecrease` se evalúa como `true`, se puede disminuir `count`.

### Controlar el color de primer plano de la vista

También podemos usar `canDecrease` para controlar el color de primer plano del botón:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aquí se usa el operador ternario:

```swift
canDecrease ? Color.primary : Color.gray
```

El significado de este código es: si `canDecrease` es `true`, el color de primer plano usa `Color.primary`; si `canDecrease` es `false`, el color de primer plano usa `Color.gray`.

`Color.primary` es un color semántico del sistema proporcionado por SwiftUI. Representa el color principal del texto en la interfaz actual.

En modo claro, `Color.primary` normalmente se acerca al negro; en modo oscuro, `Color.primary` normalmente se acerca al blanco.

Por eso, la ventaja de usar `Color.primary` es que se adapta automáticamente al modo claro y al modo oscuro.

### Controlar el estado desactivado de una vista

`disabled` se usa para controlar si una vista está en estado desactivado:

```swift
.disabled(!canDecrease)
```

Cuando `disabled` es `false`, se puede tocar la vista.

Cuando `disabled` es `true`, la vista está desactivada y no se puede tocar.

Usar `canDecrease` como condición aquí hace que el código sea más fácil de entender.

Cuando vemos `canDecrease`, sabemos que significa "si actualmente se puede seguir disminuyendo".

### Nota adicional: ¿por qué hay dos comprobaciones?

Dentro del botón `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Aquí se usa `.disabled(!canDecrease)` y también se usa `if canDecrease` dentro del botón.

`.disabled(!canDecrease)` se encarga de desactivar el botón en la interfaz, para que el usuario no pueda tocarlo.

`if canDecrease` se encarga de comprobar de nuevo antes de ejecutar el código. Solo ejecuta `count -= 1` cuando se permite disminuir.

Esto es una doble protección. En el desarrollo real, si el botón ya está desactivado, se puede omitir la comprobación interna. Pero en un ejemplo didáctico, conservarla hace más claro el papel de `canDecrease`.

## Resumen

En esta lección aprendimos principalmente las propiedades calculadas.

Una propiedad calculada no almacena directamente un valor. En cambio, cuando se lee, calcula un resultado a partir de datos existentes.

Por ejemplo:

```swift
var c: Int {
    a + b
}
```

Aquí `c` no necesita almacenarse por separado, porque se puede calcular mediante `a + b`.

Una propiedad calculada debe declararse con `var` y necesita indicar un tipo de retorno.

```swift
var canDecrease: Bool {
    count > 1
}
```

Las propiedades calculadas no solo pueden devolver valores numéricos, sino también resultados de comprobaciones, contenido de texto e incluso contenido de vistas SwiftUI.

En esta lección también aprendimos `return`.

`return` significa devolver un resultado:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Si una propiedad calculada solo contiene una expresión que produce directamente un resultado, se puede omitir `return`.

```swift
var totalPrice: Int {
    count * price
}
```

Además, también conocimos `Color.primary` y `disabled`.

`Color.primary` es un color semántico del sistema de SwiftUI. Ajusta automáticamente su apariencia según el modo claro y el modo oscuro.

```swift
.foregroundStyle(Color.primary)
```

`disabled` se usa para controlar si una vista está desactivada.

```swift
.disabled(true)
```

Significa desactivada, no se puede tocar.

```swift
.disabled(false)
```

Significa disponible, se puede tocar.

Por eso las propiedades calculadas son muy comunes en SwiftUI. Pueden ayudarnos a organizar con más claridad los resultados de cálculo, las condiciones de comprobación y el contenido mostrado.
