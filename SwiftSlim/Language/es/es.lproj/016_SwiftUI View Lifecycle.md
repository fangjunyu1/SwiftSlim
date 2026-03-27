# Ciclo de vida de las vistas en SwiftUI

En la lección anterior entendimos que las variables `@State` siguen el ciclo de vida de la vista, y también aprendimos el uso básico de `onAppear`.

En esta lección profundizaremos en el ciclo de vida de las vistas en SwiftUI: veremos cómo se crean y se muestran las vistas, cómo se crean y se vuelven a crear las variables dentro de ellas, y también aprenderemos `onAppear`, `onDisappear` y el constructor `init`.

A partir de estos conocimientos construiremos una comprensión global del proceso completo de construcción de una vista SwiftUI.

## Orden de arranque de la aplicación

Cuando se crea un proyecto iOS, Xcode genera por defecto dos archivos:

```text
ContentView.swift
NombreDelProyecto + App.swift
```

Entre ellos, `"NombreDelProyecto + App".swift` es el archivo de entrada de toda la aplicación.

Por ejemplo:

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

### Flujo de ejecución del código

Cuando ejecutamos la app, ya sea en simulador o en dispositivo físico, el sistema buscará la palabra clave `@main`:

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Una vez confirmado el archivo de entrada, empieza la ejecución.

Primero entra en la estructura `App`, ejecuta el código dentro de `body`, crea un `WindowGroup` y carga dentro de él `ContentView`.

### Para qué sirve WindowGroup

`WindowGroup` se usa para gestionar ventanas:

```swift
WindowGroup {
    ContentView()
}
```

En iPad y macOS el sistema admite múltiples ventanas, mientras que en iPhone normalmente solo hay una.

Por eso, en iPhone `WindowGroup` se encarga sobre todo de gestionar la primera pantalla que se muestra.

### Proceso de carga de la vista

Después de encontrar `ContentView`:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI ejecutará el código dentro de `body`, luego construirá la interfaz a partir de la estructura de vistas devuelta, como `VStack` o `Text`, y finalmente la mostrará en pantalla.

Una vez completados estos pasos, podremos ver `ContentView` en la vista.

![ContentView](../../Resource/016_view1.png)

Hay que tener en cuenta que la función de `body` es generar vistas, no almacenarlas.

Eso significa que cada vez que la vista se refresca, SwiftUI vuelve a calcular `body` y genera una nueva estructura visual.

### Lógica de la vista previa

La vista previa de Xcode (`Canvas`) y la ejecución real son dos mecanismos diferentes.

Por ejemplo, si añadimos una salida de depuración en el archivo de entrada:

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Cuando previsualizas `ContentView` en Xcode, la ejecución no empieza desde `@main`, por lo que no se disparará el `onAppear` del archivo de entrada.

Sin embargo, si ejecutas la app en el simulador o en un dispositivo físico, el sistema sí empezará desde `@main`, recorrerá el flujo completo de la app y activará ese `onAppear`, mostrando también la salida de depuración.

La clave está en que la vista previa de Xcode es solo un “renderizado parcial”, que sirve únicamente para mostrar la vista actual; en cambio, el simulador y el dispositivo físico proporcionan un “entorno completo de ejecución” y ejecutan la app entera.

Por eso, cuando pruebes funciones reales de la app, debes tomar como referencia el simulador o el dispositivo físico. La vista previa de Xcode no puede ofrecer el entorno completo.

## El ciclo de vida de una vista

En esta etapa, casi todo nuestro código está concentrado dentro de `ContentView`. Pero en una app real, normalmente habrá varias vistas, y estas se irán cambiando según la situación.

Por ejemplo, en la “hucha”:

![PiggyBank](../../Resource/016_view.png)

Cuando se pulsa “guardar dinero”, aparece una vista `SaveView`; cuando termina el guardado o se cierra, `SaveView` desaparece.

Ese proceso es precisamente el ciclo de vida de una vista: crearla, mostrarla y finalmente retirarla.

### Cerrar la aplicación

Cuando la app se cierra, todas las vistas son eliminadas y el estado relacionado también desaparece.

Por eso, tanto `ContentView` como las demás vistas se eliminan de memoria, y todo el estado de ejecución de la app se limpia.

## Ciclo de vida de las variables dentro de la vista

En SwiftUI, el ciclo de vida de las variables suele estar ligado al de la propia vista.

Por ejemplo:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variables @State

Las variables declaradas con `@State` están ligadas al ciclo de vida de la vista.

```swift
@State private var name = "FangJunyu"
```

Cuando se crea la vista, también se crea `name`; cuando la vista se elimina, `name` también desaparece.

Esa es precisamente la razón por la que necesitamos usar métodos de persistencia como `UserDefaults`.

### Variables dentro de body

Las variables definidas dentro de `body`:

```swift
var num = 10
```

tienen un ciclo de vida ligado al proceso de ejecución de `body`.

Cuando cambia un estado de SwiftUI, por ejemplo:

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Al cambiar `name`, `@State` detecta la modificación y notifica a SwiftUI que debe recalcular la vista, por lo que `body` vuelve a evaluarse.

Cuando `body` se recalcula, todo el código que hay dentro de `body` se ejecuta otra vez, y también se vuelven a crear las variables internas, como `num`.

Por eso no se recomienda definir variables complejas dentro de `body`.

Como estas variables se vuelven a crear en cada refresco, aumentan el coste de cálculo y pueden afectar al rendimiento.

En SwiftUI, los distintos tipos de datos deberían gestionarse de distintas maneras: los datos que deben seguir el ciclo de vida de la vista pueden guardarse con `@State`; los datos de cálculo temporal pueden colocarse dentro de `body`.

## onAppear y onDisappear

En la lección anterior ya aprendimos `onAppear`: cuando la vista se muestra, se llama a `onAppear`.

```swift
.onAppear {}
```

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Tanto en la vista previa de Xcode como durante la ejecución, podremos ver la salida de depuración dentro de `onAppear`.

### onDisappear

La contraparte de `onAppear` es `onDisappear`:

```swift
.onDisappear {}
```

Cuando la vista se cierra o se elimina, se llama a `onDisappear`.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Cuando la vista es eliminada, se ejecuta el código dentro de `onDisappear`.

Consejo: en esta etapa, `ContentView` es la vista raíz de la aplicación, por lo que no puede cerrarse o retirarse directamente. Por eso todavía no podemos observar fácilmente el efecto de `onDisappear`.

Más adelante, cuando estudiemos navegación entre páginas y apertura de nuevas vistas, podremos ver con claridad cuándo se llama a `onDisappear`.

## Lógica de creación y visualización

Hay que tener en cuenta que crear una vista y mostrarla son dos fases distintas.

Cuando una vista se crea, se llama al constructor de la `struct`:

```swift
init() {}
```

Como las vistas de SwiftUI son estructuras:

```swift
struct ContentView: View { ... }
```

cuando se crea una instancia de la vista, se ejecuta el constructor `init`. Solo cuando la vista se muestra en pantalla se ejecuta `onAppear`.

Por ejemplo:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Si previsualizamos esta vista en Xcode, podremos ver esta salida de depuración:

```swift
Create ContentView
Show ContentView
```

Eso indica que primero se ejecuta `init` para crear la vista, luego se calcula el código dentro de `body`, y por último se muestra la vista y se ejecuta `onAppear`.

Por eso, es importante entender que la fase de creación y la fase de visualización están separadas.

### Constructor init

`init` es una sintaxis básica de Swift. Tanto `struct` como `class` pueden definirlo, y se usa para inicializar objetos.

```swift
init() {}
```

En SwiftUI, cuando se crea una vista, el sistema llama a su método `init`, que puede usarse para recibir parámetros o inicializar datos.

Si no escribimos `init` manualmente, Swift generará automáticamente un constructor por defecto para la `struct`.

En vistas de SwiftUI como `ContentView`, al crear la vista se ejecuta `init`, y al mostrarla se ejecuta `onAppear`.

Por eso, `init` es el constructor que se ejecuta cuando la vista es creada, y más adelante nos resultará útil al pasar parámetros o inicializar datos.

## Resumen

En esta lección aprendimos el orden de arranque de la aplicación, desde el archivo de entrada hasta el flujo de ejecución de `ContentView`.

Entendimos el ciclo de vida de las vistas SwiftUI: cuando una vista se crea, se ejecuta `init`; cuando se muestra en pantalla, se ejecuta `onAppear`; y cuando se elimina o se cierra, se ejecuta `onDisappear`.

También aprendimos el mecanismo de actualización de vistas: la interfaz está impulsada por el estado. Cuando cambian estados como `@State`, SwiftUI refresca la vista, vuelve a calcular `body`, y las variables temporales dentro de `body` también se recrean.

El ciclo de vida de las variables queda ligado al ciclo de vida de la vista, mientras que las variables temporales dentro de `body` se recrean en cada refresco.

Entender este comportamiento del ciclo de vida y de las variables nos ayuda a organizar mejor el código y a que la lógica de la aplicación sea más clara.
