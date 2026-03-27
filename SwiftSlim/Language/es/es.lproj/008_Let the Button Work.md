# Hacer que el botón empiece a funcionar

En esta lección aprenderemos principalmente `Button`, la salida de depuración con `print` y las funciones en Swift.

Todo esto forma parte de la base de la programación interactiva en SwiftUI.

## Botón

El botón es uno de los controles de UI más comunes. Cuando necesitamos descargar, abrir o salir, normalmente hacemos clic en un botón.

Por ejemplo, en la App Store hacemos clic en el botón “Obtener” para descargar una app.

![Button](../../RESOURCE/008_button.png)

En SwiftUI, un botón se representa con `Button`.

Uso básico:

```swift
Button("") {
    
}
```

Su estructura puede dividirse en dos partes:

```swift
Button("Texto del botón") {
    Código que se ejecuta al pulsar el botón
}
```

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Después de ejecutar, se mostrará un botón `Start`.

![Button](../../RESOURCE/008_button1.png)

Cuando el usuario pulsa el botón, se ejecuta el código dentro de `{}`.

Hay que tener en cuenta que `Button` pertenece a los controles de interfaz (`View`) de SwiftUI, por lo que debe escribirse dentro de `body`.

### Modificador buttonStyle

En SwiftUI, `Button` ofrece estilos de botón integrados del sistema, que pueden usarse a través del modificador `buttonStyle`.

Por ejemplo:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` aplicará uno de los estilos de botón proporcionados por el sistema.

Las opciones comunes incluyen:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

La diferencia principal entre los distintos estilos está en si el botón tiene borde, fondo o mayor énfasis visual.

## Salida con print

En programación, a menudo necesitamos comprobar si el programa ha llegado a una determinada parte del código.

Swift proporciona la función `print` para mostrar información de depuración.

Forma básica:

```swift
print("Hello")
```

Esta línea mostrará el texto en la `Console`.

### Probar si el botón funciona

Podemos poner `print` dentro del botón para comprobar si realmente se ha pulsado.

```swift
Button("Start") {
    print("Test 123")
}
```

Cuando pulses el botón, la `Console` mostrará:

```text
Test 123
```

Eso significa que el botón se ha activado correctamente.

![Button](../../RESOURCE/008_button3.png)

Atención: `print` es código Swift, no un control de interfaz. No puede colocarse directamente dentro de `body`, de lo contrario dará error.

Por ejemplo, esto es incorrecto:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Error: body debe devolver una View
    }
}
```

En SwiftUI, `body` sirve para describir la estructura de la interfaz y solo puede contener controles de UI (`View`), como `Text`, `Button`, `Image`, etc.

El código normal, como lógica de cálculo o `print`, debe colocarse dentro de botones, funciones u otros manejadores de eventos.

### Console

El contenido de `print` se muestra en la `Console` de Xcode.

Si no ves la `Console`, puedes abrir la zona de depuración haciendo clic en el botón `Show the Debug Area` de la esquina inferior derecha y luego hacer clic en `Show the Console`.

![](../../RESOURCE/008_button4.png)

En la parte inferior izquierda de la `Console` hay dos pestañas: `Executable` y `Previews`.

![](../../RESOURCE/008_button5.png)

Estas dos pestañas corresponden a distintos entornos de ejecución: cuando previsualizas una vista en `Canvas`, la salida de `print` aparece en la pestaña `Previews`; si ejecutas la app en el simulador o en un dispositivo real, la salida aparecerá en la pestaña `Executable`.

Por eso, si notas que `print` no muestra nada, primero conviene comprobar que tienes seleccionada la pestaña correcta.

## Caso práctico - arte ASCII

En algunos proyectos de código es frecuente ver arte ASCII.

El arte ASCII es una imagen formada con caracteres normales. Por ejemplo:

![ASCII](../../RESOURCE/008_ascii.png)

Podemos usar `Button + print` para mostrar una imagen ASCII.

Código de ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Cuando pulses el botón, la `Console` mostrará:

```text
 /\_/\
( o.o )
 > ^ <
```

Atención: dentro de una cadena, `\` debe escribirse como `\\`, porque la barra invertida es un carácter de escape.

## Funciones

Dentro de un botón podemos escribir código directamente.

Por ejemplo:

```swift
Button("Start") {
    print("Hello")
}
```

Si el código es corto, esto no supone ningún problema. Pero en el desarrollo real, la lógica que dispara un botón puede ser bastante más compleja.

Por ejemplo:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Puede haber mucho más código
}
```

Si el código se hace cada vez más largo, escribirlo directamente dentro del botón hará que el código de interfaz quede desordenado y sea más difícil de leer y mantener.

Por eso, normalmente organizamos ese código dentro de una función y luego llamamos a esa función desde el botón.

### Qué es una función

Una función es un bloque de código reutilizable.

Cuando necesitamos ejecutar cierto código, basta con llamar a la función para que se ejecute lo que hay dentro.

De este modo, la estructura del código queda más clara y además el código se puede reutilizar.

### Forma básica

En Swift, una función se define con la palabra clave `func`:

```swift
func randomInt() {
    // code
}
```

Este bloque define una función.

`randomInt` es el nombre de la función, que sirve para identificar ese bloque de código.

`()` indica la posición de los parámetros. Aquí se pueden recibir datos externos. Si no hacen falta datos, puede dejarse vacío.

Dentro de `{}` está la zona de código de la función, donde se escribe todo lo que debe ejecutarse.

Por ejemplo:

```swift
func getName() {
    print("FangJunyu")
}
```

Esta función sirve para imprimir un texto.

### Llamar a una función

Definir una función solo crea ese bloque de código. Si quieres ejecutarlo, todavía necesitas llamarlo.

La forma de llamarlo es añadir `()` después del nombre:

```swift
getName()
```

Cuando el programa llega a esta línea, ejecuta el código dentro de `getName`.

Ejemplo completo:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Después de ejecutarlo, la `Console` mostrará:

```text
FangJunyu
```

### Usar funciones en SwiftUI

Dentro de una vista SwiftUI, normalmente las funciones se escriben fuera de `body`.

Por ejemplo:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Cuando se pulsa el botón, se llama a `getName()`.

Así el código de interfaz permanece limpio, mientras que la lógica concreta se maneja dentro de la función.

### Parámetros de función

A veces una función necesita ejecutar acciones distintas según los datos que reciba.

Por ejemplo, queremos que una función pueda imprimir distintos nombres, y no solo `"FangJunyu"`.

En ese caso, podemos usar parámetros. Un parámetro puede entenderse como: los datos que se pasan al llamar a la función.

Por ejemplo:

```swift
func getName(name: String) {
    print(name)
}
```

Esta función añade un parámetro. `name` es el nombre del parámetro y `String` es su tipo.

Eso significa que la función necesita recibir un dato de tipo `String`.

Como ahora la función necesita datos, al llamarla debemos proporcionarlos.

```swift
getName(name: "Sam")
```

Cuando la llamamos pasando `"Sam"`, la función usará ese valor para imprimirlo.

Resultado:

```text
Sam
```

## Caso práctico - usar una función para mostrar arte ASCII

En el ejemplo anterior, escribimos `print` directamente dentro del botón.

Pero si el arte ASCII es más complejo, el código se volverá bastante largo. En ese caso, podemos mover la lógica a una función para que el código de interfaz se vea más limpio.

Código de ejemplo:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Después de ejecutar y pulsar el botón, la `Console` mostrará:

```text
 /\_/\
( o.o )
 > ^ <
```

Aquí han ocurrido dos cosas cuando el usuario pulsó el botón:

1. El botón llamó a la función `printCat()`
2. El código `print` dentro de la función se ejecutó

Así conseguimos que el código de interfaz solo se encargue de disparar eventos, mientras que la lógica concreta se maneja en funciones.

En el desarrollo real, la mayoría de las acciones de los botones se implementan mediante funciones.

## Resumen

En esta lección aprendimos tres contenidos importantes:

**1. Botón `Button`**

`Button` es el control de SwiftUI que se utiliza para disparar acciones.

```swift
Button("Start") {

}
```

Cuando el usuario pulsa el botón, se ejecuta el código dentro de las llaves.

**2. Salida con `print`**

`print` sirve para mostrar información de depuración en la `Console`.

```swift
print("Hello")
```

Los desarrolladores pueden observar el estado de ejecución del programa a través de la `Console`.

**3. Funciones**

Una función es un bloque de código reutilizable.

```swift
func sayHello() {
    print("Hello")
}
```

Llamar a la función:

```swift
sayHello()
```

Si la función necesita datos, puede usar parámetros:

```swift
func sayHello(name: String) {
    print(name)
}
```

En las lecciones siguientes seguiremos aprendiendo más controles de SwiftUI y cómo interactúan los datos con la interfaz.

## Ejercicio

Intenta completar los siguientes ejercicios:

1. Crea un botón cuyo texto sea `"Hello"`
2. Cuando pulses el botón, muestra `Hello Swift` en la `Console`
3. Coloca el código de salida dentro de una función y luego llama a esa función desde el botón
