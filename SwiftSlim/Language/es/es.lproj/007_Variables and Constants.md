# Variables y constantes

En esta lección aprenderemos principalmente las variables y constantes en Swift, y conoceremos algunos tipos de datos comunes y operadores básicos.

Todo esto forma parte de los conocimientos más fundamentales de la programación y también es una base importante para seguir aprendiendo SwiftUI.

## Variables y constantes en la vida cotidiana

Podemos entender las variables y las constantes a partir de cosas de la vida diaria.

Variables en la vida cotidiana:

- El contenido de cada programa en la televisión es distinto
- El tiempo cambia cada día
- El reloj cambia cada segundo

La característica común de estas cosas es: cambian.

Si la televisión mostrara siempre la misma imagen, si el tiempo fuera siempre soleado y si las agujas del reloj nunca se movieran, entonces esas cosas serían constantes.

Una puede cambiar, la otra no.

## Entender variables y constantes

En el desarrollo de apps, normalmente necesitamos que el usuario rellene o guarde cierta información.

Por ejemplo:

- Nombre de cuenta
- Fecha de nacimiento
- Información de contacto
- Dirección

Esta información se guarda y luego se muestra.

Por ejemplo, si el usuario introduce un nombre dentro de la app:

```text
FangJunyu
```

Necesitamos guardar ese nombre para poder mostrarlo dentro de la app.

Podemos entender ese proceso de guardado de una forma simple: como guardar algo en un cajón.

Cuando guardamos un nombre, es como si metiéramos ese nombre en un cajón.

Puede haber muchas cosas que guardar, y también muchos cajones. Para saber qué hay dentro de cada cajón, necesitamos ponerle un nombre.

Por ejemplo:

```text
name
```

En este ejemplo, `name` es el nombre del cajón y `FangJunyu` es la información guardada.

![Var](../../RESOURCE/007_var.png)

**En Swift, si necesitamos guardar datos, debemos declararlos usando una variable (`var`) o una constante (`let`).**

Como el nombre normalmente puede modificarse, aquí deberíamos usar una variable.

```swift
var name = "FangJunyu"
```

Aquí declaramos una variable llamada `name`, cuyo tipo es `String` y cuyo valor es `"FangJunyu"`.

### Diferencia entre variables y constantes

Las variables se declaran con `var`:

```swift
var
```

Las constantes se declaran con `let`:

```swift
let
```

Por ejemplo:

```swift
var name = "FangJunyu"
let id = 123456
```

Si se declara como variable, significa que el valor puede modificarse; si se declara como constante, ya no podrá cambiarse.

Por lo tanto, la diferencia principal entre variables y constantes es: si el valor puede cambiar o no.

### Modificar una constante

Si el código intenta modificar el valor de una constante:

```swift
let name = "Sam"
name = "Bob"
```

Swift indicará que no puede completar la asignación, porque se trata de una constante.

```text
Cannot assign to property: 'name' is a 'let' constant
```

Este mecanismo ayuda a los desarrolladores a evitar que algunos datos importantes se modifiquen accidentalmente.

### Mostrarlo en SwiftUI

Abre el archivo `ContentView.swift` y declara una variable dentro de la `View`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Aquí hemos declarado una variable llamada `name` y la mostramos en la interfaz mediante `Text`.

Si modificamos el contenido de la variable:

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

El texto mostrado por `Text` también cambiará.

De esta manera, podemos usar variables para controlar el contenido mostrado en la interfaz, sin necesidad de modificar directamente el texto dentro de `Text` cada vez.

Si en otra parte necesitamos obtener esta información, también podemos pasar la variable a otro lugar, como si entregáramos el contenido del “cajón” para que otra parte lo use.

### La posición de variables y constantes en SwiftUI

En SwiftUI, las variables y constantes normalmente se escriben fuera de `body`:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Por supuesto, también pueden escribirse dentro de `body`:

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Pero hay una diferencia importante entre ambas formas:

- Si la variable o constante se escribe dentro de `body`, se volverá a crear cada vez que la vista se recalcule
- Si se escribe fuera de `body`, existirá como propiedad de la estructura de la vista y la organización del código será más clara

Por eso, en el desarrollo real, normalmente se escriben fuera de `body`.

## Tipos de datos

Las variables pueden guardar muchos tipos distintos de datos, y esos tipos se llaman tipos de datos.

Por ejemplo, antes usamos `Text` para mostrar texto:

```swift
Text("Hello, World")
```

Aquí `"Hello, World"` pertenece al tipo `String`.

`String` se utiliza para representar contenido de texto, y en Swift debe ir envuelto entre comillas dobles `""`.

Por ejemplo:

```swift
var hello = "Hello, World"
```

Además de las cadenas, en Swift existen muchos otros tipos de datos.

En la etapa inicial, los cuatro tipos más comunes son:

- `String`
- `Int`
- `Double`
- `Bool`

Con estos cuatro tipos se puede realizar la mayor parte del procesamiento básico de datos.

**String**

`String` representa texto. Por ejemplo:

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Las cadenas suelen usarse para representar: nombre de usuario, títulos y contenido textual.

**Int**

`Int` representa enteros, es decir, números sin decimales.

Por ejemplo:

```swift
var age = 26
var count = 100
```

Los enteros suelen usarse para representar: edad, cantidad y conteo.

**Double**

`Double` representa números con decimales.

Por ejemplo:

```swift
var weight = 74.5
var height = 185.0
```

En Swift, los números decimales suelen usar `Double` por defecto.

Existe también un tipo parecido llamado `Float`, pero el rango de valores que puede representar es menor, así que en el desarrollo real se usa más `Double`.

**Bool**

El tipo `Bool` se utiliza para representar dos estados: `true` y `false`.

Por ejemplo:

```swift
var isShowAlert = true
var isLogin = false
```

`Bool` se usa a menudo en condiciones, por ejemplo para decidir si se muestra una alerta.

Cuando solo existen dos resultados posibles, `Bool` es un tipo muy adecuado.

### Mostrarlo en SwiftUI

Cuando mostramos un valor de tipo `String`, podemos usarlo directamente en `Text`:

```swift
Text(name)
```

Pero tipos como `Int` o `Double` no son cadenas, así que no se pueden usar directamente como parte del texto.

Si necesitamos mostrar esos datos dentro de `Text`, podemos usar interpolación de cadenas (`String Interpolation`):

```swift
\()
```

La interpolación debe escribirse dentro de una cadena y envolver la variable o constante con `\()`.

Por ejemplo:

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

En el código anterior, `""` indica una cadena y `\()` sirve para insertar variables o constantes dentro de ella.

Por ejemplo:

```swift
"DoubleNum: \(num * 2)"
```

El contenido mostrado será:

```text
DoubleNum: 2
```

De este modo, podemos insertar variables o constantes dentro de una cadena y luego mostrarlas en la interfaz con `Text`.

Consejo: `\()` solo puede usarse dentro de cadenas `""`.

## Operadores

Cuando declaramos una variable o una constante, podemos ver una forma como esta:

```swift
var num = 1
```

Aquí, `=` se llama operador de asignación.

Su función es: asignar el valor de la derecha a la variable de la izquierda.

En este ejemplo, `1` se asigna a la variable `num`.

Además del operador de asignación, también existen algunos operadores numéricos comunes:

- `+`
- `-`
- `*`
- `/`

Cuando hacemos cálculos con números, como datos de tipo `Int` o `Double`, usamos estos operadores.

Por ejemplo:

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Después de realizar la operación, el resultado se guarda en la variable.

## Resumen

Las variables, las constantes y los operadores son conceptos fundamentales en programación.

Gracias a las variables y constantes, podemos guardar distintos tipos de datos dentro del programa; gracias a los tipos de datos, podemos saber con claridad qué clase de datos estamos manejando; y gracias a los operadores, podemos calcular y procesar esos datos.

Todos estos conocimientos son como las herramientas básicas del mundo de la programación. Dominarlos te dará una base sólida para seguir aprendiendo Swift y SwiftUI.
