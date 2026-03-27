# Empezar desde ContentView

## Preparación antes de la clase

En esta lección empezaremos desde el archivo `ContentView.swift` para conocer de forma sistemática la estructura básica de SwiftUI, incluyendo:

- Comentarios
- Estructura de `View`
- Diseños `VStack` / `HStack` / `ZStack`
- Iconos `SF Symbols`
- Modificadores de vista (`modifier`)
- Código de previsualización `#Preview`

Primero, busca el proyecto de Xcode que creaste antes y haz doble clic en el archivo `.xcodeproj`.

En la zona de navegación `Navigator` de la izquierda, selecciona el archivo `ContentView.swift`.

Nota: cada vez que abras el proyecto, `Canvas` puede mostrar `Preview paused`. Haz clic en el botón de actualizar para restaurar la vista previa.

![Swift](../../RESOURCE/002_view7.png)

## Conociendo ContentView

Código de `ContentView`:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Aunque hay poco código, contiene la estructura central de SwiftUI.

### 1. Comentarios

En la parte superior del archivo:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Este es un comentario de archivo, que sirve para registrar información del archivo, como el nombre, el proyecto, la persona que lo creó y la fecha de creación.

En Swift se usa `//` para comentarios de una sola línea:

```swift
// Esto es un comentario
```

Los comentarios pueden mejorar la legibilidad del código y ayudar a los desarrolladores a entender su lógica.

En el desarrollo real, el código a veces puede ser difícil de entender. Si no escribes comentarios, tres días después puede que ya no entiendas tu propio código.

Por eso, añadir comentarios activamente mientras escribes código es una buena práctica de desarrollo. Usar comentarios para registrar la lógica facilita el mantenimiento posterior.

**Desactivar código temporalmente**

Los comentarios también pueden servir para desactivar código temporalmente y ayudarnos a localizar problemas.

Por ejemplo:

```text
A
B
C
```

`A`, `B` y `C` son tres fragmentos de código, y uno de ellos contiene un error. Podemos comentarlos temporalmente para investigarlo.

Primero comentamos `A`:

```text
// A
B
C
```

Si al comentar `A` el código vuelve a funcionar con normalidad, significa que el problema estaba en `A`.

Si el problema continúa, podemos comentar después `B`, y así sucesivamente hasta encontrar el fragmento defectuoso.

Durante el desarrollo nos encontraremos con muchos problemas, y a menudo necesitaremos comentar código para investigar sus causas. Esto nos ayuda a localizar el código problemático y encontrar el `BUG`.

En Xcode puedes usar el atajo:

```text
Command ⌘ + /
```

para añadir o eliminar comentarios rápidamente.

### 2. Importar el framework SwiftUI

```swift
import SwiftUI
```

Esta línea significa que importamos el framework `SwiftUI`.

Los tipos `View`, `Text`, `Image`, `VStack` y otros de SwiftUI provienen de este framework.

Si no importas `SwiftUI`, Xcode mostrará un error:

```text
Cannot find type 'View' in scope
```

Eso significa que el compilador no puede reconocer el tipo `View`.

### 3. Estructura de View

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

La primera vez que veas esta estructura de `View`, puede que te resulte extraña, porque contiene palabras clave como `struct`, `View`, `var`, `body` y `some`.

Todavía no hemos aprendido estas palabras clave. Por ahora, solo necesitas saber que este código crea una vista llamada `ContentView`.

Puedes entender una `View` como un lienzo sobre el que podemos dibujar, y la herramienta para dibujar es SwiftUI.

Por ejemplo:

![Swift](../../RESOURCE/002_view.png)

La imagen de arriba muestra tres páginas, y en realidad son tres `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Cuando desarrollamos una app con SwiftUI, cada página es una `View`.

### 4. Código SwiftUI

Dentro de la `View` se muestra el código SwiftUI:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Este código representa un contenedor con orden vertical, dentro del cual se muestran un icono y un texto.

`Image` puede mostrar iconos de `SF Symbols`, y mediante modificadores se puede controlar su tamaño y su color.

La vista `Text` puede mostrar contenido textual.

`padding` es el margen, que añade un espacio transparente alrededor de la vista.

Por último, `#Preview` es la vista previa, que permite mostrar la vista en `Canvas`.

### Ejercicios después de clase

Para quienes están empezando, el contenido de esta lección puede resultar algo complejo. Podemos profundizar en lo aprendido mediante más práctica:

- Cambiar el nombre del icono de `SF Symbols`
- Cambiar el color de primer plano del icono a negro
- Sustituir `VStack` por `HStack`
- Comentar `Image` o `Text` y observar cómo cambia la vista previa

### Extra: autocompletado de código (Code Completion)

Al escribir código, si prestas atención quizá ya hayas notado que Xcode muestra automáticamente una lista de opciones disponibles.

Por ejemplo, cuando modificamos el modificador `imageScale`:

```swift
.imageScale(.)
```

Xcode mostrará las opciones disponibles:

![Swift](../../RESOURCE/002_view10.png)

Esto forma parte del mecanismo de autocompletado de código (`Code Completion`). Se basa en la inferencia de tipos y en sugerencias de miembros de enumeración, y puede mejorar la velocidad de escritura y reducir errores.

En lecciones posteriores presentaremos formalmente las enumeraciones (`enum`); por ahora basta con tener una idea básica.

Este código SwiftUI representa un diseño vertical que muestra un icono y un texto.

![Swift](../../RESOURCE/002_view1.png)

#### Diseño VStack

```swift
VStack { }  // Diseño vertical
```

`VStack` representa un contenedor de diseño vertical. Las vistas internas se colocan de arriba hacia abajo.

![Swift](../../RESOURCE/002_view8.png)

Los tres diseños más comunes en SwiftUI son:

- `VStack` — orden vertical
- `HStack` — orden horizontal
- `ZStack` — superposición (eje Z)

```swift
HStack { }  // Orden horizontal
ZStack { }  // Superposición
```

Diagrama de orden de cada diseño:

![Swift](../../RESOURCE/002_view2.png)

Por ejemplo, si usamos `HStack` para ordenar horizontalmente:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Podemos ver que el icono del globo y el texto se muestran en horizontal.

![Swift](../../RESOURCE/002_view3.png)

Cuando queramos ordenar elementos de forma horizontal, usamos `HStack`. Cuando necesitemos superponerlos, usamos `ZStack`.

#### Image y SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Este código muestra un icono de globo. Ese icono proviene del sistema de iconos `SF Symbols` de Apple.

![Swift](../../RESOURCE/002_view9.png)

El significado de este código es: mostrar un icono de globo, en tamaño grande y con el color de énfasis.

Además del globo, también podemos mostrar otros iconos.

Por ejemplo, una mochila:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**¿Cómo mostrar otros iconos?**

Necesitamos usar la biblioteca oficial de iconos del sistema que Apple proporciona: `SF Symbols`.

Abre el sitio oficial de Apple Developer y descarga [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Abre la app `SF Symbols`.

![Swift](../../RESOURCE/002_sf1.png)

A la izquierda verás las categorías de símbolos y a la derecha los iconos correspondientes.

Haz clic derecho sobre un icono y elige “copiar 1 nombre”. Ese nombre es el contenido de texto correspondiente.

Por ejemplo:

```text
"globe"
"backpack"
"heart"
```

Coloca el nombre copiado dentro de `Image(systemName:)` y podrás mostrar distintos iconos.

Nota: cada icono de `SF Symbols` tiene una versión mínima del sistema compatible. Si la versión del sistema es demasiado baja, el icono puede no mostrarse. Debes revisar su compatibilidad dentro de la app `SF Symbols`.

#### Modificadores

En SwiftUI, un modificador (`modifier`) es una forma de cambiar la apariencia o el comportamiento de una vista.

Puedes entender un modificador como si fuera ropa: al ponerse ropa distinta, la apariencia también cambia.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` y `foregroundStyle` son modificadores de la vista `Image`. Modifican la vista sin cambiar el contenido del `Image`.

**1. imageScale**

```swift
.imageScale(.large)
```

Puede controlar el tamaño de los iconos `SF Symbols`:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Podemos cambiar estas opciones para que los símbolos de `SF Symbols` se muestren con tamaños diferentes.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` permite controlar el color del primer plano.

`.tint` representa el color de énfasis del entorno actual, que por defecto en iOS es azul.

Si queremos cambiar el color a rojo:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Vista Text

`Text` es la vista de texto y se utiliza para mostrar cadenas.

```swift
Text("Hello, world!")
```

Por ejemplo, para mostrar mi nombre:

```swift
Text("FangJunyu")
```

Nota: las cadenas deben estar entre comillas dobles `""`.

Puedes intentar mostrar tu nombre, tu número de teléfono u otros contenidos.

#### padding y márgenes

En SwiftUI, `padding` se usa para añadir espacio en blanco entre el contenido de una vista y su borde. Pertenece al concepto de margen interno (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Este código indica que se añade a la vista `HStack` un margen predeterminado del sistema.

**¿Qué es padding?**

`padding` representa “el espacio en blanco entre el contenido de una vista y su borde”.

En la imagen inferior, si el `HStack` azul tiene `padding`, la zona azul se contraerá hacia dentro y parecerá “un poco más pequeña”.

![Swift](../../RESOURCE/002_view6.png)

**Margen predeterminado**

El modificador `padding()` usa por defecto el espaciado estándar recomendado por el sistema.

```swift
.padding()
```

Este valor puede variar según la plataforma y el contexto. Por ejemplo:

- En iOS suele ser aproximadamente `16 pt`.
- En macOS o watchOS, el espaciado estándar puede ser mayor o menor según las reglas de diseño de cada plataforma.

**Margen personalizado**

También se puede definir un margen específico para una vista.

1. Configurar una sola dirección

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Explicación de las direcciones:

- `.top`: margen superior
- `.bottom`: margen inferior
- `.leading`: margen delantero
- `.trailing`: margen trasero

![Swift](../../RESOURCE/002_view12.png)

Nota: `leading` y `trailing` se adaptan automáticamente a la dirección del idioma. Por ejemplo, en un entorno árabe (`RTL`) se invertirán automáticamente.

2. Configurar varias direcciones

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Se pueden especificar varias direcciones al mismo tiempo mediante un array. El uso detallado de arrays se explicará en tutoriales posteriores; aquí basta con conocer esta forma de escritura.

3. Configurar la dirección horizontal o vertical

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Equivale a:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Eliminar márgenes**

Si no quieres ningún margen, puedes usar `.padding(0)` para quitarlo:

```swift
.padding(0)
```

O eliminar directamente el modificador `padding`:

```swift
// .padding()
```

### 6. Código de vista previa Preview

```swift
#Preview {
    ContentView()
}
```

Este fragmento indica que se debe generar en `Canvas` una vista previa de `ContentView`.

Nota: `#Preview` es una sintaxis nueva introducida en Swift 5.9 / Xcode 15. Antes de eso se usaba la estructura `PreviewProvider`.

**¿Qué pasa si comentamos Preview?**

Si comentamos `Preview`:

```swift
// #Preview {
//    ContentView()
// }
```

`Canvas` dejará de mostrar contenido renderizable.

![Swift](../../RESOURCE/002_xcode.png)

Esto se debe a que `#Preview` controla qué vista se muestra en `Canvas`.

Cuando necesitemos previsualizar una vista SwiftUI en Xcode, añadimos código `#Preview`. Si no hace falta la vista previa, podemos comentar o eliminar este bloque.

## Resumen

Aunque el archivo `ContentView.swift` no tiene mucho código, en realidad cubre varios conceptos centrales de SwiftUI. Para los principiantes puede parecer extraño al principio, pero al descomponer su estructura se puede construir una comprensión inicial de SwiftUI.

Repasando el contenido de esta lección, primero aprendimos el comentario `//`, que puede usarse para explicar la lógica del código o para desactivarlo temporalmente.

Después, entendimos que un archivo SwiftUI debe importar el framework `SwiftUI`:

```swift
import SwiftUI
```

Si no se importa, el compilador no podrá reconocer tipos como `View`.

Luego conocimos la estructura básica de una vista SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

En ella, `ContentView` es el nombre de la vista.

También aprendimos tres contenedores de diseño comunes: `VStack` (orden vertical), `HStack` (orden horizontal) y `ZStack` (superposición).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```
