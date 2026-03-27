# Swift y SwiftUI

Al aprender desarrollo para plataformas Apple, muchos tutoriales tienden a explicar Swift y SwiftUI por separado. Eso puede hacer que los principiantes sientan que están desconectados entre sí y que crean erróneamente que son dos tecnologías completamente independientes.

En realidad, Swift y SwiftUI forman un conjunto profundamente integrado: Swift es el lenguaje de programación y se encarga de la lógica y los datos; SwiftUI es el framework de interfaz de usuario construido sobre Swift y se ocupa del renderizado de vistas y de la interacción.

Esta lección te ayudará a construir un marco mental claro: qué es Swift, qué es SwiftUI y cómo colaboran ambos dentro del código.

## ¿Qué es Swift?

Swift es un lenguaje de programación moderno lanzado por Apple para desarrollar aplicaciones en plataformas como iOS, macOS, watchOS y tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift es un lenguaje estático y fuertemente tipado. En su diseño pone más énfasis en la seguridad, reduciendo muchos errores comunes de programación, como punteros nulos o accesos fuera de rango, y además permite integrarse sin fricciones con C y Objective-C.

En el desarrollo real, Swift suele encargarse más de la parte lógica de la aplicación, como el procesamiento de datos, las peticiones de red y las operaciones de almacenamiento.

## ¿Qué es SwiftUI?

SwiftUI es un nuevo framework de construcción de interfaces lanzado por Apple en 2019. SwiftUI adopta un modelo de programación declarativa, permitiendo a los desarrolladores describir la estructura de la interfaz y el comportamiento interactivo con un código más conciso.

![swiftui](../../RESOURCE/010_swiftui.png)

La programación declarativa significa que el desarrollador solo tiene que decirle al sistema qué quiere mostrar, y el sistema actualizará automáticamente la vista según los cambios en los datos. Ya no hace falta actualizar el estado de la interfaz manualmente, lo que simplifica mucho la complejidad del desarrollo de UI.

El núcleo de SwiftUI son los componentes de vista, como `Text`, `Image` o `Button`, y los contenedores de diseño, como `VStack`, `HStack` y `ZStack`. Estos componentes interactúan mediante data binding y state management, haciendo que la interfaz pueda responder a los cambios en los datos y refrescarse automáticamente.

## ¿Cómo colaboran Swift y SwiftUI?

Las responsabilidades de Swift y SwiftUI pueden resumirse así:

**1. Swift: procesar lógica y datos**

Swift se utiliza principalmente para gestionar datos, almacenar estado y ejecutar lógica. Este código normalmente no afecta directamente al renderizado de la interfaz, sino que se encarga del procesamiento de datos y comportamiento.

Por ejemplo, procesar datos en Swift:

```swift
let markdown = try? String(contentsOf: url)
```

Este tipo de código implica declaración de variables, definición de constantes, funciones, flujo de control, etc., y no afecta directamente a la visualización de la vista.

**2. SwiftUI: declarar y renderizar la interfaz**

SwiftUI, en cambio, se utiliza para construir el diseño y el contenido de la interfaz de usuario, y se encarga principalmente del renderizado y de la interacción con la vista.

Por ejemplo, crear una vista de texto con SwiftUI:

```swift
Text("SwiftSlim")
```

Todo esto es código destinado a construir y controlar elementos visuales, e interactúa directamente con la interfaz de usuario.

### Ejemplo básico

A continuación se muestra un ejemplo sencillo de SwiftUI:

```swift
// ContentView.swift

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

En este ejemplo:

**Código SwiftUI**: `VStack`, `Image`, `Text` y `padding` pertenecen a SwiftUI y se encargan de la presentación y el diseño de la interfaz.

**Código Swift**: los comentarios `//` en la parte superior y `import SwiftUI` pertenecen a la estructura del código Swift; `#Preview` al final es un macro para la vista previa de Xcode y no participa en el renderizado real de la interfaz.

### Ejemplo avanzado

En proyectos reales, Swift y SwiftUI suelen mezclarse para realizar las tareas en las que cada uno es más fuerte:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

En este ejemplo:

**Código SwiftUI**: `@State` es un property wrapper propio de SwiftUI y se usa para declarar el estado mutable de una vista; `Button` y `Text` son componentes visuales de SwiftUI responsables de mostrar la interfaz y manejar la interacción del usuario.

**Código Swift**: `private var name` y `func printName()` son código Swift que sirve para almacenar datos y ejecutar lógica, y no afecta directamente al renderizado de la vista.

Cuando el usuario pulsa el botón, SwiftUI dispara el código de operación del botón:

```swift
Button("Print") {
    printName()
}
```

Aquí, `Button` es un componente de SwiftUI, mientras que la función `printName()` que se ejecuta es código Swift responsable de la lógica concreta.

Esta colaboración permite que Swift y SwiftUI se combinen sin fricción: Swift se encarga de los datos y la lógica, y SwiftUI de la presentación de la interfaz de usuario.

## ¿Dónde se suele escribir el código Swift y SwiftUI?

En SwiftUI, la interfaz se construye a partir de la vista que devuelve la propiedad `body`. Por eso, todo el código que describe la interfaz suele escribirse dentro de `body`.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

En este ejemplo, `Text` es un componente visual de SwiftUI, por lo que debe escribirse dentro de `body`, ya que SwiftUI leerá `body` para generar la interfaz.

El código no relacionado con la interfaz, como variables, funciones o lógica de procesamiento de datos, suele escribirse fuera de `body`. Por ejemplo:

```swift
struct ContentView: View {

    // Swift: datos o lógica
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI: interfaz
    var body: some View {
        Text(name)
    }
}
```

Hay que tener en cuenta que dentro de `body` también se puede usar sintaxis de Swift, como `if`, `for` y otras sentencias de control, pero su función es controlar la generación de vistas SwiftUI:

```swift
if isLogin {
    Text("Welcome")
}
```

Por eso, en desarrollo con SwiftUI puede entenderse de forma sencilla así: el código de vista (`Text`, `Image`, `Button`, etc.) suele escribirse dentro de `body`; los datos y la lógica (variables, funciones, etc.) suelen escribirse fuera de `body`.

## Archivos Swift

A medida que avancemos en el aprendizaje, también entraremos en contacto con la arquitectura MVVM. En ella, las capas `ViewModel` y `Model` suelen estar formadas por código Swift puro y separadas por completo de la capa de vistas (`SwiftUI`).

Por ejemplo, una clase para gestionar el estado de la aplicación:

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

O una estructura que describe los datos:

```swift
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

La responsabilidad de este tipo de archivos es gestionar y persistir datos, y no mostrarse directamente en la vista, por lo que pertenecen completamente a Swift.

## Contexto histórico

Para entender la relación entre Swift y SwiftUI, también conviene conocer la evolución de las tecnologías de desarrollo de Apple. Hasta 2026, este stack tecnológico ha pasado por varias iteraciones.

### Historia de Swift

Antes de la aparición de Swift, Objective-C era el principal lenguaje de programación de las plataformas Apple y permitía mezclarse con C. Su sintaxis era más larga y suponía una barrera mayor para los principiantes:

```Obj-c
// Forma de escribir en Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

En 2014, Apple lanzó Swift en la WWDC. Swift tiene una sintaxis más moderna y mayor seguridad de tipos, y poco a poco fue reemplazando a Objective-C como lenguaje principal:

```swift
// Forma de escribir en Swift
let name = "Fang"
print("Hello, \(name)")
```

Sin embargo, Objective-C no desapareció por completo. Sigue utilizándose ampliamente en muchos proyectos heredados y frameworks de bajo nivel. Conocer su sintaxis básica sigue siendo valioso para mantener proyectos antiguos y comprender mejor las capas internas del sistema.

### Historia de SwiftUI

Antes de SwiftUI, iOS usaba **UIKit** y macOS usaba **AppKit**. Estos frameworks seguían un modelo de programación “imperativo”. Los desarrolladores tenían que arrastrar controles con `Storyboard` o escribir código manualmente para controlar el estado de la vista, lo que generaba más código y un coste de mantenimiento mayor, especialmente cuando la lógica de la interfaz se volvía compleja.

![storyboard](../../RESOURCE/010_xcode.png)

En 2019, Apple presentó oficialmente SwiftUI en la WWDC. SwiftUI introdujo el paradigma de programación “declarativa”, simplificando mucho el flujo de desarrollo de UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Es importante notar que SwiftUI no es una implementación de bajo nivel totalmente independiente. En cada plataforma, en esencia colabora y se apoya en UIKit (iOS) o AppKit (macOS), y a nivel interno sigue dependiendo de ambos frameworks para funcionar.

### Relación entre Swift y UIKit/AppKit

Aunque Swift es un lenguaje de programación general que puede ejecutarse en distintas plataformas de Apple, no puede sustituir por completo a UIKit o AppKit. Para algunas necesidades complejas de interfaz, o para funciones que SwiftUI todavía no cubre, sigue siendo necesario apoyarse en UIKit o AppKit.

Por ejemplo, UIKit es muy maduro en aspectos como la gestión compleja de view controllers, animaciones o reconocimiento de gestos, y ha acumulado mucha experiencia validada en producción. Aunque SwiftUI sigue mejorando continuamente en estos aspectos, todavía puede presentar limitaciones en algunos casos más extremos.

Por eso, muchos desarrolladores combinan SwiftUI con UIKit o AppKit dentro de sus proyectos para aprovechar lo mejor de ambos.

Desde este punto de vista, SwiftUI puede entenderse como un encapsulado de más alto nivel sobre UIKit y AppKit. Al aprender SwiftUI, conocer también algunos conceptos básicos de UIKit y AppKit puede ayudarte a tomar decisiones técnicas más razonables cuando tengas que mantener proyectos antiguos o implementar funciones complejas.

## Resumen

**Swift**: se utiliza principalmente para escribir lógica, procesamiento de datos, flujo de control y otras partes no relacionadas con el diseño visual.

**SwiftUI**: se utiliza para construir interfaces de usuario de forma declarativa; el contenido de la vista y el código de diseño pertenecen a SwiftUI.

En el desarrollo real, Swift y SwiftUI normalmente se usan juntos: Swift se encarga de la lógica, y SwiftUI de la interfaz.

Desde Objective-C y UIKit hasta Swift y SwiftUI, el entorno de desarrollo de Apple ha ido avanzando hacia formas de programación más modernas y sencillas, aunque UIKit y AppKit siguen siendo importantes en muchos proyectos tradicionales.

Al entender la relación entre Swift y SwiftUI, podremos desarrollar para iOS y macOS con más eficiencia, y también tomar decisiones técnicas más razonables al mantener proyectos heredados.
