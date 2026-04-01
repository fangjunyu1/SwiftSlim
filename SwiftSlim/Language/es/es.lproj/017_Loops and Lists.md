# Bucles y listas

En esta lección, aprenderemos el bucle `for` en Swift y `ForEach` en SwiftUI.

Ambos pueden ayudarnos a leer en orden, uno por uno, los elementos de un array. En el desarrollo real, a menudo necesitamos sacar un grupo de datos uno por uno, y luego procesarlos o mostrarlos, y los bucles son precisamente una herramienta importante para lograrlo.

Cuando navegamos por páginas web o usamos una app, a menudo vemos muchas listas o elementos. Este tipo de contenido normalmente primero se almacena en un `array`, luego se lee uno por uno mediante un `bucle`, y finalmente se muestra en la interfaz.

Por ejemplo, la lista de resultados de búsqueda de Google:

![Google](../../Resource/017_google.png)

Cada elemento de la lista de resultados de búsqueda normalmente corresponde a un dato, y se muestra uno por uno mediante un bucle.

Por eso, `arrays` y `bucles` suelen aparecer juntos. El `array` se encarga de guardar un conjunto de datos, y el `bucle` se encarga de sacar esos datos en orden y ejecutar la misma operación sobre ellos.

A continuación, empecemos por el bucle `for` más básico.

## Cuenta regresiva

Supongamos que queremos simular una función de cuenta regresiva e imprimir en orden `“5, 4, 3, 2, 1”`.

La forma más directa de escribirlo es:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Aunque esta forma puede simular una cuenta regresiva, si el contenido es mucho, resultará muy repetitivo y tampoco será cómodo de modificar después.

En este momento, podemos poner primero los datos en un array y luego usar un bucle `for` para imprimirlos uno por uno:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Esta forma es más concisa y también más fácil de ampliar. Aunque haya muchos números en la cuenta regresiva, no necesitamos escribir `print` línea por línea, solo necesitamos dejar que el bucle procese automáticamente cada elemento del array.

Podemos poner este fragmento de código en un botón para probarlo:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Cuando se pulsa el botón, el bucle `for` tomará cada entero de `countDown` en el orden del array y lo imprimirá en la consola.

A continuación, veamos cómo funciona el bucle `for`.

## Bucle for

El bucle `for` se usa para procesar un conjunto de datos en orden. Los objetos más comunes son los arrays y los rangos.

Sintaxis básica:

```swift
for elemento in arrayORango {
    códigoAEjecutar
}
```

Por ejemplo, el código de cuenta regresiva de antes:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Aquí, `i` representa el elemento actual que se está sacando, y después de `in` está el dato que se va a recorrer, es decir, el array `countDown`.

El significado de este código es: el programa sacará en orden cada elemento del array `countDown`. Cada vez que saque un elemento, lo representará temporalmente con `i`, y luego ejecutará el código dentro de las llaves.

El proceso de ejecución puede entenderse así:

* El primer elemento que se saca es `5`, así que en este momento el valor de `i` es `5`
* Se ejecuta `print(i)` y se imprime `5`
* Luego se sigue sacando el siguiente elemento `4`
* Se ejecuta otra vez `print(i)` y se imprime `4`

Los siguientes `3`, `2` y `1` también se ejecutarán uno por uno de la misma manera.

![for](../../Resource/017_for.png)

Cuando todos los elementos del array hayan sido procesados, el bucle `for` terminará automáticamente.

Podemos apoyarnos en el bucle `for` para obtener cada elemento del array y completar funciones como esta cuenta regresiva.

**Consejo**: `i` es una forma de nombrar muy común en un bucle for y se usa para representar el elemento actual que se saca, pero no es una forma fija. También se pueden usar otros nombres en inglés.

Por ejemplo, usar `num` para representar cada elemento que se saca:

```swift
for num in countDown {
    print(num)
}
```

Dentro de las llaves, también hay que usar `num` para representar el elemento actual que se está sacando.

### Recorrer un rango

El bucle `for` no solo puede recorrer arrays, también puede recorrer rangos.

Por ejemplo, cuando necesitamos calcular la suma de los enteros positivos dentro de `50`, tenemos que sumar uno por uno todos los enteros entre `1` y `50`.

La forma más directa podría ser:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

El problema de esta forma es que necesitamos escribir manualmente cada número. Es engorroso y tampoco se adapta a escenarios reales de desarrollo.

En este momento, podemos usar el operador de rango junto con el bucle `for` para hacerlo.

En la lección anterior de “Operadores”, ya aprendimos el operador de rango:

```swift
1...3   // 1, 2, 3
```

Aquí, `...` representa un rango cerrado, es decir, incluye tanto el punto inicial como el punto final.

Por lo tanto, aquí podemos usar un bucle `for` con el rango de enteros de `1` a `50`:

```swift
for i in 1...50 {
    
}
```

Necesitamos sumar esos enteros, así que también necesitamos una variable para guardar el total:

```swift
var count = 0
```

Luego, en cada vuelta del bucle, sumamos el número actual extraído a `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)    // 1275
```

Este código significa:

* `count` se usa para guardar la suma actual
* El bucle `for` sacará uno por uno los enteros del `1` al `50`
* Cada vez que se saca un entero, se ejecuta una vez `count += i`
* Cuando termina el bucle, `count` guarda la suma final

De este modo, podemos obtener la suma de todos los enteros positivos dentro de `50`.

Del mismo modo, si necesitamos calcular la suma de los enteros del `1` al `100`, solo tenemos que cambiar el rango:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)    // 5050
```

El bucle `for` no solo puede recorrer arrays, también puede recorrer un rango. Esta capacidad de procesar datos repetidamente en orden es muy común en el desarrollo.

Puede ayudarnos a manejar automáticamente muchas tareas repetitivas, sin necesidad de escribir manualmente la suma de cada número, u otras operaciones repetitivas similares.

## Bucles en SwiftUI

El bucle `for` anterior pertenece al propio lenguaje Swift.

Pero en SwiftUI no podemos usar directamente `for` dentro de una estructura de vista para generar vistas:

```swift
VStack {
    for i in 1...100 {    // Error
        count += i
    }
}
```

Esto se debe a que dentro de `VStack` lo que se necesita son vistas de SwiftUI, mientras que un bucle `for` normal no es en sí mismo una vista.

Si queremos generar repetidamente interfaz en SwiftUI según el contenido de un array, entonces necesitamos usar `ForEach`.

Por ejemplo, si queremos mostrar los nombres de todos los miembros de un grupo, podemos escribir:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Resultado de visualización:

![for1](../../Resource/017_for1.png)

Luego, añadimos los mismos modificadores a cada `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ahora, cada `Text` se muestra con una fuente más pequeña y más gruesa.

Resultado de visualización:

![](../../Resource/017_for2.png)

Aunque los modificadores hacen que la interfaz se vea mejor, también hacen que el código sea más largo y repetitivo.

Si siguen aumentando los nombres, o más adelante queremos modificar de forma unificada la fuente, el color y otros estilos, necesitaremos escribir y modificar repetidamente mucho código igual. Eso será bastante molesto y tampoco será fácil de mantener.

En este momento, podemos poner primero esos nombres en un array y luego usar `ForEach` en SwiftUI para generar vistas repetidamente según los datos del array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Este código es más conciso. `ForEach` leerá uno por uno cada elemento del array y mostrará el contenido correspondiente en la interfaz.

Cuando más adelante añadamos nombres nuevos, solo necesitaremos modificar los nombres dentro del array `names`, y no será necesario seguir añadiendo repetidamente `Text` y modificadores complejos.

## ForEach

`ForEach` es una estructura de SwiftUI que se usa para generar vistas repetidamente. Puedes entenderla como una estructura de SwiftUI similar a un bucle `for`.

Uso básico:

```swift
ForEach(array, id: \.self) { elemento in
    código SwiftUI
}
```

Por ejemplo, los nombres del grupo de antes:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Este código significa:

`names` es el array que se recorre, es decir, los datos que se van a mostrar.

`id:\.self` significa usar el propio elemento del array para distinguir cada elemento.

En el ejemplo actual, el array contiene cadenas de texto:

```swift
["Sam", "John", "Wathon", "Bob"]
```

Así que SwiftUI usará directamente esas cadenas, como "Sam", "John", "Wathon" y "Bob", para distinguir contenido diferente.

Para arrays simples comunes en la etapa inicial, como `String` e `Int`, normalmente podemos escribir primero:

```swift
id: \.self
```

Por ahora, solo necesitas recordar primero esta forma. No hace falta profundizar todavía en más reglas sobre `id`.

`item` en `item in` representa el elemento actual que se está sacando.

Por ejemplo, en la primera vuelta, `item` es `"Sam"`, y en la segunda vuelta, `item` es `"John"`.

Por lo tanto:

```swift
Text(item)
```

se convertirá sucesivamente en:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

Así que la función de este código es: sacar uno por uno cada nombre del array `names` y generar una vista `Text` para cada nombre.

### Proceso de ejecución

El proceso de ejecución puede entenderse así:

* `ForEach` primero lee el primer elemento `"Sam"` del array `names`
* `item` representa temporalmente `"Sam"`
* `Text(item)` muestra `"Sam"`
* Luego sigue leyendo el siguiente elemento `"John"`
* Y vuelve a ejecutar el mismo código de vista

Al final, todos los nombres del array se mostrarán.

La ventaja de escribirlo así es que, cuando haya más nombres, no necesitaremos escribir repetidamente muchos `Text`, solo necesitaremos modificar el contenido del array.

### Recorrer fotos

`ForEach` no solo puede mostrar texto, también puede mostrar imágenes, colores u otras vistas de SwiftUI.

Por ejemplo, preparamos 4 imágenes:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Arrastra estas cuatro imágenes a la carpeta Assets de Xcode.

![image](../../Resource/017_for3.png)

Si no usamos `ForEach`, tendremos que escribir cada imagen manualmente:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Resultado de visualización:

![image](../../Resource/017_for4.png)

Aunque esta forma puede lograr la función, el código será relativamente largo.

Si hay cada vez más imágenes, tendremos que seguir escribiendo cada vez más código `Image`.

Si más adelante queremos modificar de forma unificada el tamaño de las imágenes, también tendremos que cambiarlo una por una.

En este momento, podemos poner los nombres de las imágenes en un array y luego usar `ForEach` para generar repetidamente vistas de imágenes:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Aquí, `images` es un array de cadenas, y cada elemento del array es un nombre de imagen.

`ForEach(images, id: \.self)` significa leer uno por uno cada elemento del array `images`, usar el propio elemento para distinguir cada elemento y luego generar la vista correspondiente según el elemento actual.

Por ejemplo, si el primer elemento leído es `"430F9BEF"`, entonces:

```swift
Image(item)
```

equivale a:

```swift
Image("430F9BEF")
```

Las imágenes siguientes también se mostrarán una por una de la misma manera.

![image](../../Resource/017_for4.png)

Aquí seguimos usando:

```swift
id: \.self
```

La razón es la misma que antes: porque los elementos del array `images` también son del tipo cadena, que es un tipo simple, así que en la etapa inicial podemos usar directamente el propio elemento como forma de distinguir cada elemento.

Puedes entenderlo de forma sencilla como una fórmula fija:

**Cuando `ForEach` recorre un array simple como `String` o `Int`, normalmente se escribe `id: \.self`.**

### Añadir imágenes

Si más adelante necesitamos añadir imágenes, solo necesitamos modificar el contenido del array:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

No hace falta volver a escribir repetidamente nuevo código `Image`.

Si hay muchas imágenes, se puede usar junto con `ScrollView`. De lo contrario, cuando el contenido sobrepase la pantalla, no se podrá previsualizar por completo.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modificar imágenes

Cuando necesitemos modificar de forma unificada el estilo de las imágenes, solo necesitaremos modificar el código dentro de `ForEach`.

Por ejemplo, cambiar el ancho a `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

De este modo, todas las imágenes se modificarán a la vez y no hará falta cambiarlas una por una.

Esta es una función importante de `ForEach`:

**Cuando varias vistas tienen la misma estructura y solo cambia el contenido, se puede escribir una sola vez el código de la vista y dejar que los datos del array decidan qué se muestra.**

## Resumen

En esta lección, aprendimos el bucle `for` y `ForEach`.

El bucle `for` se usa para procesar en orden los elementos de un array o un rango, y está más orientado al procesamiento de datos.

`ForEach` se usa en SwiftUI para generar repetidamente vistas según el contenido de un array, y está más orientado a la visualización de vistas.

En la etapa inicial actual, la forma más común de `ForEach` es:

```swift
ForEach(array, id: \.self) { elemento in
    código SwiftUI
}
```

Aquí, `id: \.self` significa usar el propio elemento para distinguir cada elemento.

Cuando el contenido del array es de tipos simples como `String` o `Int`, normalmente podemos empezar usando esta forma.

En el futuro, cuando navegues por páginas web o apps, si ves un grupo de textos repetidos, imágenes u otro contenido de lista, puedes pensar que en SwiftUI este contenido normalmente primero se guarda en un array y luego se muestra uno por uno mediante `ForEach`.
