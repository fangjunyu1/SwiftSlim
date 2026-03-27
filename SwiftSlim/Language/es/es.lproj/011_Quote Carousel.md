# Carrusel de citas

En esta lección implementaremos una función de “carrusel de citas” y aprenderemos en profundidad conocimientos básicos de Swift como arrays (`Array`) y sentencias condicionales (`if-else`).

Veremos cómo guardar varias citas y cómo implementar un carrusel circular de citas mediante la interacción con botones.

![alt text](../../RESOURCE/011_word.png)

## Mostrar una cita

Primero, necesitamos mostrar una cita en SwiftUI.

La forma más simple es usar la vista `Text`:

```swift
Text("Slow progress is still progress.")
```

Este código solo puede mostrar una cita fija. Si queremos mostrar varias citas y permitir cambiar entre ellas, necesitamos guardarlas.

Sin embargo, una variable de tipo cadena común solo puede guardar una cita:

```swift
let sayings = "Slow progress is still progress."
```

Si necesitamos guardar varias citas, tendríamos que declarar una variable para cada una:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Pero en el desarrollo real, esta forma no solo es engorrosa, sino que además, como cada variable es independiente, no podemos implementar un cambio flexible tipo carrusel.

Para gestionar varias citas con comodidad, necesitamos usar una estructura de datos que las guarde juntas: eso es un array (`Array`).

Después de usar un array, el código anterior puede guardarse así:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Consejo: en las convenciones de programación, el nombre de una variable array que almacena varios elementos suele escribirse en plural, como `sayings`, para reflejar que se trata de una colección.**

## Array

En Swift, un array es una colección ordenada de elementos y se representa con corchetes `[]`.

```swift
[]
```

Dentro del array puede haber varios elementos del mismo tipo, separados entre sí por comas `,`.

Por ejemplo:

```swift
[101, 102, 103, 104, 105]
```

Podemos entender un array de forma sencilla como un tren:

![Array](../../RESOURCE/011_array1.png)

Todo el tren representa el objeto array, y cada vagón está ordenado uno tras otro.

### Índices y acceso a elementos

Como un array es ordenado, el sistema puede localizar elementos concretos según su posición. A este mecanismo de localización se le llama índice (`Index`).

En Swift, y en la gran mayoría de lenguajes de programación, el índice del array empieza en `0`, no en `1`. Eso significa que el primer elemento del array tiene índice `0`, el segundo tiene `1`, y así sucesivamente.

![Array](../../RESOURCE/011_array2.png)

Si quieres acceder a un elemento concreto del array, basta con añadir corchetes después del nombre del array e introducir dentro el índice del elemento objetivo.

Por ejemplo:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Si intentas acceder a un índice fuera del rango válido del array, se producirá un problema de “índice fuera de rango” (`Index Out of Range`). Por eso, al acceder a un array hay que tener cuidado y asegurarse de que el índice está dentro del rango válido.

**Índice fuera de rango**

Por ejemplo, si un array solo tiene `5` elementos, el rango válido de índices es de `0` a `4`. Si intentamos acceder a `sayings[5]`, el programa no podrá encontrar ese “vagón”, lo que provocará un error de índice fuera de rango y hará que la app se cierre.

![Array](../../RESOURCE/011_array3.png)

### Operar con arrays

Los arrays no solo se pueden definir de manera estática, sino que también permiten añadir, eliminar y modificar elementos, así como obtener la longitud del array.

Consejo: si necesitas modificar un array, debes declararlo con `var` y no con la constante `let`.

**1. Añadir elementos**

Puedes usar el método `append` para añadir un elemento al final del array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Eliminar elementos**

Mediante el método `remove(at:)`, puedes eliminar un elemento concreto del array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modificar elementos**

Puedes modificar directamente un elemento usando su índice:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Contar la longitud del array**

Usa la propiedad `count` para obtener el número de elementos:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Usar un array para mostrar citas

Para mostrar varias citas, podemos guardarlas en un array y después acceder a ellas y mostrarlas mediante su índice.

Primero, creamos un array `sayings` dentro de `ContentView` para guardar las citas, y luego usamos el índice dentro de la vista `Text` para leer y mostrar la cita correspondiente:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Aquí, `sayings[0]` representa la primera cita del array.

Si quieres mostrar una cita distinta, solo necesitas cambiar el valor del índice dentro de los corchetes:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definir el índice de la cita

Para implementar un efecto dinámico de cambio de citas, no podemos dejar el índice “escrito de forma fija” dentro de `Text`.

Necesitamos crear una variable que guarde por separado el índice que se está mostrando actualmente.

En SwiftUI, podemos usar `@State` para declarar un índice mutable:

```swift
@State private var index = 0
```

SwiftUI supervisará la variable envuelta con `@State`. Cuando cambie `index`, SwiftUI volverá a renderizar la vista y mostrará la cita correspondiente.

A continuación, usamos `sayings[index]` para obtener dinámicamente la cita del array:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Cuando cambie el valor de `index`, `Text` mostrará una cita distinta.

### Usar un botón para controlar el índice

Para controlar el cambio de cita, podemos usar un `Button` para modificar el valor de `index`. Cada vez que se pulsa el botón, `index` aumenta automáticamente en `1`:

```swift
Button("Next") {
    index += 1
}
```

Cuando pulsamos el botón, el valor de `index` cambia de `0` a `1`, se activa la actualización de la vista y `Text(sayings[index])` leerá la siguiente cita.

Sin embargo, aquí hay un problema potencial: si pulsamos el botón muchas veces seguidas, `index` crecerá hasta un valor fuera del rango del array, lo que provocará un error de índice fuera de rango. Por ejemplo, cuando `index` llegue a `5` y el rango válido del array sea de `0` a `4`, el programa se cerrará.

Para evitar este problema, necesitamos introducir control condicional, asegurándonos de que `index` no supere el rango del array. Podemos usar una sentencia `if-else` para comprobar si `index` es menor que la longitud del array.

## Control condicional: sentencia if-else

La sentencia `if-else` es una de las estructuras condicionales más comunes en Swift. Sirve para comprobar si una condición se cumple y ejecutar distintos bloques de código según sea verdadera o falsa.

Estructura básica:

```swift
if condition {
    // Código que se ejecuta cuando condition es true
} else {
    // Código que se ejecuta cuando condition es false
}
```

En una sentencia `if`, la condición `condition` es un valor booleano (`Bool`), que puede ser `true` o `false`. Cuando la condición es `true`, se ejecuta el código de `if`; de lo contrario, se ejecuta el bloque de `else`.

Por ejemplo:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

En este ejemplo, `age` vale `25`, así que la sentencia `if` comprueba si `age > 18`. Como la condición se cumple, se imprime `"Big Boy"`.

Si no necesitas la parte `else`, puedes omitirla:

```swift
if condition {
    // Código que se ejecuta cuando condition es true
}
```

### Usar condiciones para controlar el rango del índice

Para evitar un índice fuera de rango, podemos usar `if` para asegurarnos de que `index` no se salga del rango del array:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Análisis de la lógica: `sayings.count` vale `5`, porque hay `5` citas, así que `sayings.count - 1` vale `4`, que es también el último índice válido del array.

Cuando `index` es menor que `4`, pulsar el botón y ejecutar `+1` es seguro; una vez `index` llega a `4`, la condición deja de cumplirse y el botón ya no hace nada.

Ahora el código ya implementa la función de cambiar citas:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Citas en bucle

Si queremos que, después de mostrar la última cita, al pulsar el botón vuelva a mostrarse la primera, para lograr así una visualización circular, podemos hacerlo usando la parte `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Cuando se pulsa el botón y `index` ya apunta al último elemento del array, se reinicia a `0` y el carrusel vuelve a empezar.

## Optimizar la vista de citas

Ahora ya hemos implementado la lógica del carrusel de citas, pero todavía podemos mejorar la interfaz para que se vea más bonita.

Código completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

En este ejemplo, la vista `Text` añade un fondo blanco semitransparente y esquinas redondeadas; el botón usa el estilo `.borderedProminent`; y `VStack` establece una imagen de fondo.

Punto extra de conocimiento: cuando se usa el modificador `background()` para manejar imágenes de fondo, su comportamiento por defecto es intentar llenar al máximo el área de layout de la vista actual. En muchos casos, puede extenderse de forma natural hasta cubrir la `Safe Area`.

Ahora ya hemos implementado la vista del carrusel de citas.

![SwiftUI View](../../RESOURCE/011_word.png)

## Resumen

A través de esta lección, hemos aprendido a usar arrays para almacenar varias citas, y a implementar un carrusel de citas mediante sentencias `if` e `if-else`.

También entendimos operaciones básicas sobre arrays, como añadir, eliminar y modificar elementos, y cómo evitar errores de índice fuera de rango.

Esta lección no solo explica cómo implementar la función de carrusel de citas, sino que también combina el uso básico de arrays y condicionales, ayudándonos a desarrollar la capacidad de procesar datos y controlar el flujo del programa.

## Conocimiento ampliado - Condiciones múltiples: if-else if-else

En el desarrollo real, a menudo necesitamos tratar con múltiples condiciones. Por ejemplo, en un juego, cuando la puntuación es `1` se activa el evento `A`, cuando es `2` se activa el evento `B`, cuando es `3` el evento `C`, y así sucesivamente.

Cuando nos encontramos con una situación con más de dos ramas condicionales, necesitamos usar `if-else if-else` para hacer una comprobación múltiple.

Sintaxis básica:

```swift
if conditionA {
    // Código que se ejecuta cuando conditionA es true
} else if conditionB {
    // Código que se ejecuta cuando conditionB es true
} else if conditionC {
    // Código que se ejecuta cuando conditionC es true
} else {
    // Código que se ejecuta cuando ninguna condición se cumple
}
```

En ese caso, el programa comprobará las condiciones en orden y ejecutará la primera que se cumpla. Si ninguna se cumple, se ejecutará el código detrás de `else`.

En el carrusel de citas, también podríamos usar `if-else if-else` para hacer varias comprobaciones:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Cuando `index` es `0`, `1`, `2` o `3`, cada pulsación ejecuta `index += 1`; cuando `index` es `4`, es decir, el último elemento, `index` vuelve a `0`, implementando así el bucle.

La rama `else` actúa como protección final para evitar valores no válidos, por ejemplo si `index` se hubiera modificado incorrectamente.

Hay que tener en cuenta que aquí `==` significa “comprobar si dos valores son iguales”. Si la sentencia `if` comprueba que `index` es igual a cierto número, devolverá `true` y ejecutará el bloque correspondiente; si no son iguales, seguirá comprobando el siguiente `if`.

Este tipo de condición múltiple resulta útil cuando queremos ejecutar código distinto según distintos escenarios.
