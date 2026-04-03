# Aplicación Fill Light

En esta lección, construiremos una aplicación fill light muy interesante. Cuando llegue la noche, podemos hacer que la pantalla del teléfono muestre distintos colores y usarla como una luz de relleno simple.

Esta aplicación fill light puede cambiar colores al tocar la pantalla, y también puede ajustar el brillo con un deslizador.

En este ejemplo, aprenderemos a usar `brightness` para ajustar el brillo de una vista, `onTapGesture` para añadir un gesto de toque a una vista y el control `Slider`.

Resultado:

![Color](../../Resource/018_color.png)

## Mostrar un color

Primero, hagamos que la vista muestre un color.

En SwiftUI, `Color` no solo representa un color, sino que también puede mostrarse como una vista:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Aquí, `Color.red` representa una vista roja. `.ignoresSafeArea()` hace que la vista de color llene toda la pantalla, por lo que se parece más al efecto real de una luz de relleno.

Resultado:

![Color](../../Resource/018_color1.png)

### Arreglo de colores e índice

Ahora mismo solo se muestra un color. Pero una luz de relleno normalmente no tiene solo un color. También puede mostrar azul, amarillo, púrpura, blanco y otros colores.

Queremos cambiar entre distintos colores cuando se toque la pantalla. Podemos poner esos colores en un arreglo para gestionarlos de forma unificada:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Un arreglo es adecuado para guardar "un grupo de datos del mismo tipo". Aquí, cada elemento del arreglo es un `Color`.

Si queremos mostrar un color específico, podemos usar un índice:

```swift
colors[0]
```

Esto significa leer el color en el índice `0` del arreglo, es decir, el primer color.

Ahora el código puede escribirse así:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

De esta manera, la pantalla muestra el primer color del arreglo, que es el rojo.

### Usar el índice para controlar el color

Si necesitamos cambiar entre distintos colores, necesitamos una variable para gestionar el índice en lugar de escribir el índice de forma fija.

Podemos usar `@State` para declarar una variable que guarde el índice:

```swift
@State private var index = 0
```

Aquí, `index` representa el índice del color actual.

Cuando `index` cambia, SwiftUI vuelve a calcular la interfaz y actualiza el contenido mostrado.

Después cambiamos el `colors[0]` original por:

```swift
colors[index]
```

De esta manera, el color mostrado por la vista queda determinado por `index`.

Ahora el código se convierte en:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Cuando `index` cambie, `colors[index]` también mostrará un color diferente.

Por ejemplo:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Hay que tener en cuenta que `index` no puede superar el índice máximo del arreglo, o se producirá un error de índice fuera de rango.

## Gesto de toque

Ahora podemos mostrar diferentes colores según `index`, pero todavía no podemos tocar para cambiarlos.

En la lección anterior de "Carrusel de citas", usamos `Button` para controlar el cambio de citas.

Pero esta vez queremos "tocar toda el área de color" para cambiar el color, así que `onTapGesture` es más adecuado.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Cuando tocamos la vista de color, se ejecuta este código:

```swift
index += 1
```

Esto significa aumentar `index` en `1`. Después de aumentar el índice, `colors[index]` mostrará el siguiente color del arreglo.

### `onTapGesture`

`onTapGesture` es un modificador de gesto que añade una acción de toque a una vista.

Uso básico:

```swift
.onTapGesture {
    // code
}
```

Por ejemplo:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Cuando se toca esta vista roja, se ejecuta el código dentro de las llaves y en la consola se muestra:

```swift
Click color
```

Mediante `onTapGesture`, podemos definir qué sucede después de tocar una vista.

### Diferencia con `Button`

Antes aprendimos la vista `Button`. Tanto `Button` como `onTapGesture` pueden manejar acciones de toque, pero sus escenarios de uso no son exactamente iguales.

`onTapGesture` es más adecuado para "añadir funcionalidad de toque a una vista ya existente", como `Color`, `Image`, `Text` u otra vista común.

`Button` es más adecuado cuando queremos representar un botón claro, como "Confirmar", "Enviar" o "Eliminar".

En esta aplicación fill light, queremos que la función de cambio de color sea más simple. Tocar toda el área de color cambia el color, así que `onTapGesture` es una buena opción aquí.

## El problema del índice

Ahora podemos tocar la pantalla para cambiar entre distintos colores.

Pero aquí hay un problema importante: **el índice puede salirse del rango del arreglo**.

Por ejemplo:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Si seguimos tocando la pantalla, `index` terminará siendo `4`, y entonces aparecerá un error de "index out of range".

Esto ocurre porque el arreglo `colors` tiene `4` elementos, pero la indexación comienza desde `0`, así que el rango válido de índices es `0 - 3`, no `4`.

Si accedemos a `colors[4]`, se producirá un error de "index out of range".

En el código actual, cada toque aumenta `index` en `1`. Si no lo controlamos, al final superará el rango válido.

Por eso debemos comprobar el índice cuando se toca la pantalla: si ya está en el último color, volvemos al primero; en caso contrario, seguimos sumando `1`.

Podemos hacerlo con una instrucción `if`:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

En este código, `colors.count` significa la cantidad de elementos del arreglo.

En el arreglo actual hay 4 colores, así que:

```swift
colors.count // 4
```

Pero el índice máximo no es `4`, sino `3`, porque la indexación comienza desde `0`.

Por eso, el último índice debe escribirse así:

```swift
colors.count - 1
```

Es decir:

```swift
4 - 1 = 3
```

Esta lógica significa: si el índice actual ya corresponde al último color, reinicia el índice a `0`; en caso contrario, súmale `1`.

De esta manera, los colores pueden cambiar en ciclo.

### Optimizar la lógica del índice

Si queremos que el código sea más conciso, también podemos usar el operador ternario:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Este código significa: si `index == colors.count - 1` es verdadero, devuelve `0`. En caso contrario, devuelve `index + 1`.

Por último, asignamos el resultado de nuevo a `index`.

Ahora ya podemos conseguir el efecto de cambio de color.

Código completo:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Ahora podemos tocar la pantalla y cambiar entre distintos colores. Ya está terminada una aplicación fill light básica.

## Mostrar el nombre del color

Podemos añadir otro grupo de textos correspondiente a los colores, para que cuando cambie el color también se muestre en la pantalla el nombre del color actual.

Por ejemplo:

- Rojo muestra `Red`
- Azul muestra `Blue`
- Amarillo muestra `Yellow`
- Púrpura muestra `Purple`

Aquí también podemos usar un arreglo para guardar los nombres de los colores:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

El orden de los textos en este arreglo debe corresponder exactamente al orden de los colores en el arreglo de colores.

Luego podemos usar `Text` para mostrar el nombre del color correspondiente al índice actual:

```swift
Text(colorsName[index])
```

`Text` muestra el nombre del color actual según `index`.

Usa modificadores para mejorar la apariencia de `Text`:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Esto hace que `Text` aparezca en blanco, con tamaño de título y en negrita.

Ahora tenemos una vista `Color` a pantalla completa. Si queremos que `Text` aparezca encima de la vista `Color`, debemos usar el contenedor de diseño `ZStack` para superponerlos.

```swift
ZStack {
    Color
    Text
}
```

Así, el código queda:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

De esta forma, el fondo es la vista de color y encima se superpone una vista de texto.

Resultado:

![Color](../../Resource/018_color2.png)

Hay que tener en cuenta que, en un `ZStack`, las vistas escritas más tarde suelen aparecer delante. Si `Text` se escribe antes que `Color`, la vista `Color` posterior puede cubrir `Text`.

## Controlar el brillo

Ahora podemos cambiar entre distintos colores, pero una luz de relleno tiene otra función importante: **ajustar el brillo**.

En SwiftUI, podemos usar el modificador `brightness` para ajustar el brillo de una vista.

Por ejemplo:

```swift
.brightness(1)
```

Podemos escribir:

```swift
colors[index]
    .brightness(0.5)
```

Esto hace que el color actual sea más brillante y se acerque más al efecto de una luz de relleno.

El rango de brillo es `0 - 1`. `0` significa mantener el color original, y cuanto más cerca esté el valor de `1`, más brillante se vuelve el color. `1` significa el resultado blanco más brillante.

Aunque podemos controlar `brightness` en el código, el usuario todavía no puede ajustarlo directamente.

Por eso necesitamos añadir un control que se pueda arrastrar: `Slider`.

## Vista `Slider`

En SwiftUI, `Slider` es un control que se usa para seleccionar un valor dentro de un rango. Apple lo describe como "un control para seleccionar un valor de un rango lineal acotado".

Uso básico:

```swift
Slider(value: $value, in: 0...1)
```

Explicación de los parámetros:

1. `value: $value`: `Slider` necesita estar vinculado a una variable.

    Cuando se arrastra el deslizador, el valor de la variable cambia al mismo tiempo. A la inversa, si la variable cambia, el deslizador también se actualiza.

    Esto es muy parecido al `TextField` que aprendimos antes. Ambos "vinculan un control con una variable".

    Una variable vinculada necesita el símbolo `$` delante para representar el binding.

2. `in: 0...1`: Este parámetro representa el rango de valores del deslizador.

    Aquí, `0...1` significa que el valor mínimo es `0` y el valor máximo es `1`.

    Cuando el deslizador se arrastra completamente a la izquierda, la variable vinculada está cerca de `0`; cuando se arrastra completamente a la derecha, está cerca de `1`.

Por ejemplo:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` está vinculado a la variable `value`. Cuando se arrastra el deslizador, el valor de `value` cambia al mismo tiempo.

Apariencia:

![Slider](../../Resource/018_slider.png)

Cuando el `Slider` se mueve hacia la izquierda, el valor vinculado `value` se convierte en `0`. Cuando se mueve hacia la derecha, se convierte en `1`.

### Rango de valores

El rango de valores de `Slider` no es fijo. También puede escribirse así:

```swift
0...100
```

o con otro rango.

Pero en esta aplicación fill light necesitamos controlar el brillo, así que `0...1` es la opción más adecuada.

## Usar `Slider` para controlar el brillo

Ahora necesitamos conectar `Slider` con `brightness`.

Primero, crea una variable para guardar el valor del brillo:

```swift
@State private var slider = 0.0
```

Aquí, `0.0` es un valor de tipo `Double`.

Como `Slider` suele vincularse a un tipo numérico, y aquí queremos que cambie de forma continua, `Double` es más adecuado. Además, `brightness` solo puede recibir un valor de tipo `Double`.

Después pasa este valor a `brightness`:

```swift
colors[index]
    .brightness(slider)
```

Cuando `slider == 0`, el color permanece en su estado predeterminado. Cuanto más cerca esté `slider` de `1`, más brillante se verá el color.

### Añadir el control `Slider`

A continuación, añade un control `Slider` para modificar esta variable:

```swift
Slider(value: $slider, in: 0...1)
```

Cuando cambia el deslizador, también cambia el valor de `slider`, y `brightness(slider)` actualiza el brillo al mismo tiempo.

Este es un ejemplo muy típico de cómo "las variables impulsan la vista" en SwiftUI.

### Ajustar la apariencia de `Slider`

De forma predeterminada, `Slider` usa el ancho disponible.

Podemos darle un ancho fijo:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Luego añadimos algunos modificadores más para que sea más fácil verlo:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Esto le da al deslizador un fondo blanco y esquinas redondeadas, haciendo que destaque más claramente sobre la vista `Color`.

Por último, colócalo en la parte inferior de la pantalla.

Como ya hemos usado `ZStack`, podemos poner dentro un `VStack` y usar `Spacer()` para empujar el `Slider` hacia abajo.

## Código completo

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Resultado:

![Color](../../Resource/018_color.png)

## Resumen

Usando el conocimiento que aprendimos antes junto con conceptos básicos como colores y arreglos, construimos una aplicación fill light muy interesante.

Con esta aplicación fill light, aprendimos a usar `brightness` para ajustar el brillo, `onTapGesture` para añadir acciones de toque a las vistas y el control `Slider`.

Añadimos `onTapGesture` a la vista `Color` para cambiar los colores. También usamos el control `Slider` para modificar una variable que gestiona `brightness`, lo cual es otro ejemplo de cómo "las variables impulsan la vista".

También repasamos el operador ternario, usamos `ZStack` para superponer vistas y usamos arreglos para gestionar un grupo de datos del mismo tipo. Esto ayuda a profundizar nuestra comprensión de los arreglos y los índices, incluido el problema práctico de evitar errores de índice fuera de rango.

Aunque este ejemplo no es complicado, conecta muchas de las ideas básicas que aprendimos antes. Cuando se combinan en un pequeño proyecto real, se vuelve más fácil entender para qué sirve cada concepto.

### Escenario de uso real

Imagina colocar un iPhone viejo sobre la mesa y usar la aplicación fill light que desarrollaste tú mismo para controlar el color de la luz. Sería una experiencia muy buena.

En App Store hay muchas aplicaciones de "fill light", y tampoco parecen muy complicadas.

![AppStore](../../Resource/018_appStore.PNG)

Podemos empezar desarrollando aplicaciones simples e intentar publicarlas en App Store. Esto no solo aumenta nuestro interés por el desarrollo, sino que también registra nuestro crecimiento.

### Práctica después de clase

Puedes seguir pensando en maneras de ampliar esta aplicación fill light, por ejemplo:

- Añadir más colores
- Mostrar el valor actual del brillo
- Mejorar el diseño del área inferior del deslizador

Cuando realmente pongas en práctica este conocimiento, descubrirás que cada concepto que aprendemos es en realidad una herramienta para crear aplicaciones.

Cuantas más herramientas dominemos, más funciones podremos crear.
