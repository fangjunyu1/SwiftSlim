# Gestionar archivos de Xcode

En esta lección, aprenderemos las operaciones de archivos más comunes en Xcode.

En las lecciones anteriores, escribimos la mayor parte del código dentro de `ContentView`. Esto facilita observar el código y el resultado que se muestra.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Pero, en una App real, normalmente no se escribe todo el código en un solo archivo.

Cuando hay cada vez más pantallas, componentes y funciones, necesitamos separar las distintas vistas en diferentes archivos de SwiftUI.

Por ejemplo:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Esto permite que la estructura del código sea más clara y también facilita el mantenimiento y la modificación posteriores.

## Por qué gestionar archivos

En SwiftUI, una pantalla o un componente normalmente puede escribirse como un archivo de vista independiente.

Por ejemplo:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Aquí, `CardView` es una vista de SwiftUI.

Si todas las vistas se escriben dentro de `ContentView`, el código será cada vez más largo y también más difícil de leer.

Por eso, necesitamos aprender a crear, renombrar y eliminar archivos, así como a usar carpetas para gestionar distintos archivos de código.

## Crear un archivo de SwiftUI

En Xcode, hay dos formas comunes de crear un archivo de SwiftUI:

Una es crear un archivo vacío y luego escribir el código manualmente.

La otra es crear un archivo a partir de la plantilla de SwiftUI, y Xcode generará automáticamente el código básico.

Para principiantes, se recomienda más usar la plantilla de SwiftUI, porque genera automáticamente la estructura básica.

### Crear un archivo vacío

En el área Navigator de la izquierda de Xcode, haz clic derecho en un espacio vacío o en una carpeta y selecciona `New Empty File`.

La ubicación de la operación es la siguiente:

![xcode](../../../Resource/027_view1.png)

Después de crear un archivo vacío, Xcode normalmente genera un archivo Swift sin nombre, por ejemplo `Untitled.swift`.

Podemos renombrarlo como `TestView.swift`.

En un proyecto de SwiftUI, si este archivo se usa para mostrar una vista, normalmente se recomienda añadir `View` al final del nombre.

Por ejemplo:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Esto no es una regla obligatoria, pero nos permite ver de un vistazo que se trata de un archivo de vista.

Después de crear un archivo vacío, el archivo puede contener solo comentarios predeterminados o puede estar en blanco, según la versión de Xcode y la forma de creación.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

En este momento, necesitamos escribir manualmente el código de SwiftUI:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Así, se crea un archivo de vista SwiftUI sencillo.

### Renombrar un archivo

Si después de crear un archivo quieres modificar su nombre, puedes seleccionar el archivo en el área Navigator de la izquierda de Xcode y luego pulsar la tecla Intro `⏎`.

![xcode](../../../Resource/027_view2.png)

Así se puede modificar el nombre del archivo.

Es importante tener en cuenta que modificar el nombre del archivo no modificará automáticamente el nombre de la vista en el código.

Por ejemplo, después de cambiar el nombre del archivo a `ProfileView.swift`, en el código todavía podría aparecer `struct TestView: View`.

Aunque esto no necesariamente provocará un error, puede crear confusión.

Por eso, se recomienda mantener coherentes el nombre del archivo y el nombre de la vista. Por ejemplo, si el archivo se llama `ProfileView.swift`, el nombre de la vista también debería usar `ProfileView`.

## Crear un archivo de plantilla SwiftUI

Además de crear un archivo vacío, también podemos crear directamente un archivo de plantilla SwiftUI.

En el área Navigator de la izquierda de Xcode, haz clic derecho en un espacio vacío o en una carpeta y selecciona `New File from Template...`.

La ubicación de la operación es la siguiente:

![xcode](../../../Resource/027_view3.png)

En la ventana emergente, en la parte superior puedes elegir distintas plataformas, como `iOS`, `macOS`, etc.

Aquí basta con mantener seleccionada la plataforma correspondiente al proyecto actual. Por ejemplo, si estamos creando una App para iOS, elegimos `iOS`.

![xcode](../../../Resource/027_view4.png)

Luego selecciona `SwiftUI View` en la parte inferior.

![xcode](../../../Resource/027_view12.png)

Después haz clic en `Next`, introduce el nombre del archivo y guárdalo.

Por ejemplo, creamos un archivo `Test2View.swift`.

Xcode generará automáticamente un código similar al siguiente:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

En comparación con un archivo vacío, el archivo de plantilla incluye automáticamente `import SwiftUI`, `struct`, `body` y `#Preview`.

Por eso, para principiantes, usar la plantilla de SwiftUI es más sencillo y también evita con más facilidad olvidar escribir código.

**Consejo**: además de hacer clic derecho para crear un archivo, también puedes hacer clic en el botón de suma situado en la parte inferior del Navigator izquierdo de Xcode para crear un archivo o una carpeta.

![xcode](../../../Resource/027_view5.png)

## Crear una carpeta

Cuando hay cada vez más archivos, podemos usar carpetas para gestionarlos.

En el área Navigator de la izquierda de Xcode, haz clic derecho en un espacio vacío o en una carpeta y selecciona `New Folder`.

Después de crear la carpeta, puedes arrastrar los archivos relacionados dentro de ella.

![xcode](../../../Resource/027_view7.png)

Las carpetas se usan principalmente para organizar la estructura del proyecto y no cambian la forma de usar la propia vista.

Mientras el nombre de la vista sea correcto, en otros archivos todavía se puede usar mediante `TestView()`, `Test2View()` y formas similares.

## Eliminar un archivo o una carpeta

Si quieres eliminar un archivo o una carpeta, puedes seleccionar el archivo correspondiente en el área Navigator de la izquierda de Xcode, luego hacer clic derecho y seleccionar `Delete`.

También puedes seleccionar el archivo y luego pulsar la tecla Suprimir `⌫`.

Xcode mostrará una ventana de confirmación de eliminación.

![xcode](../../../Resource/027_view10.png)

Seleccionar `Move to Trash` significa mover el archivo a la Papelera.

Si ves `Remove Reference`, significa que solo se elimina la referencia del proyecto de Xcode, pero no se elimina el archivo original del disco.

Para principiantes, si solo estás eliminando un archivo normal que acabas de crear, normalmente basta con elegir `Move to Trash`.

## Mostrar varias vistas SwiftUI

Después de aprender a crear archivos, podemos separar distintas vistas en diferentes archivos.

Por ejemplo, creamos dos archivos SwiftUI:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` se usa para mostrar el nombre del autor:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` se usa para mostrar el fondo de la tarjeta:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Luego, podemos usar estas dos vistas dentro de `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Después de ejecutar, podemos ver que `CardView` y `AuthorView` se muestran combinadas:

![xcode](../../../Resource/027_view11.png)

En este resultado, `CardView` actúa como fondo y `AuthorView` se muestra encima, porque ambas están colocadas dentro de `ZStack`.

En `ContentView`, usamos estas dos vistas mediante `CardView()` y `AuthorView()`. Los `()` después del nombre indican que se crea y se usa esta vista.

Esta es una forma común de anidación de vistas en SwiftUI: dentro de una vista, se pueden seguir usando otras vistas.

## Archivo de entrada

Por último, repasemos desde dónde empieza la App a mostrar la interfaz.

En un proyecto de SwiftUI, normalmente hay un archivo de entrada:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Aquí, `@main` indica que esta es la ubicación de entrada de la App.

Dentro de `WindowGroup`, vemos:

```swift
ContentView()
```

Esto significa que, después de iniciar la App, primero se muestra `ContentView`.

Luego, dentro de `ContentView`, se muestra además:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Por tanto, la jerarquía de vistas puede entenderse así:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Si cambiamos la vista que se muestra en el archivo de entrada a `CardView`:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Entonces, después de iniciar la App, solo se mostrará `CardView`.

Es decir, el `WindowGroup` del código de entrada decide qué vista se muestra primero después de iniciar la App.

Y dentro de esa vista, se pueden seguir mostrando otras vistas.

## Resumen

En esta lección, aprendimos las operaciones comunes de gestión de archivos en Xcode.

Vimos cómo crear archivos SwiftUI, cómo renombrar archivos, cómo crear carpetas y cómo eliminar archivos.

Al mismo tiempo, también aprendimos un concepto importante: las vistas SwiftUI se pueden separar en distintos archivos y luego usarse dentro de otras vistas.

Por ejemplo:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Aquí, `CardView()` y `AuthorView()` son otras vistas usadas dentro de `ContentView`.

Por último, también repasamos la lógica de visualización del archivo de entrada.

Cuando la App se inicia, primero entra en el código de entrada marcado con `@main`, y luego muestra la vista dentro de `WindowGroup`.

Esto nos ayuda a entender que los distintos archivos SwiftUI no están aislados; pueden combinarse entre sí y finalmente formar una interfaz de App completa.
