# Entender las vistas

En esta lección volvemos al `ContentView` original.

```swift
struct ContentView: View {
    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

Cuando entramos en contacto con SwiftUI por primera vez, había muchas palabras clave dentro de `ContentView` que no entendíamos.

Por ejemplo, `struct`, `View`, `var`, `body`, `some View` y otras palabras clave.

En ese momento quizá solo sabíamos esto: **si escribimos código dentro de `body`, el contenido aparecerá en la interfaz.**

Ahora ya hemos aprendido `struct`, variables, métodos y protocolos, así que podemos volver a entender este código y usarlo para comprender la relación entre las vistas de SwiftUI.

## Repasar ContentView

Después de crear un proyecto SwiftUI, Xcode genera por defecto un archivo `ContentView`.

El código de ejemplo es el siguiente:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("¡Hola, mundo!")
        }
        .padding()
    }
}
```

Este código se puede entender dividiéndolo en varias partes.

Primero:

```swift
import SwiftUI
```

Esta línea importa el framework SwiftUI.

Después de importar SwiftUI, podemos usar vistas de SwiftUI como `View`, `Text`, `Image`, `VStack` y `Button`.

## La estructura ContentView

Esta línea de código crea una estructura:

```swift
struct ContentView: View
```

Entre ellas:

```swift
struct ContentView
```

significa que `ContentView` es una estructura.

En la lección anterior aprendimos sobre `struct`. Puede agrupar campos relacionados y puede contener propiedades y métodos.

Por ejemplo:

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

En este ejemplo, `ContentView` contiene tres elementos: `name`, `printName` y `body`.

Es decir, `struct` puede agrupar propiedades, métodos y contenido de vista relacionados.

![contentView](../../Resource/023_contentVIew.png)

## View es un protocolo

Sigamos mirando esta línea de código:

```swift
struct ContentView: View 
```

El `View` después de los dos puntos significa que `ContentView` sigue el protocolo `View`.

Podemos entenderlo así: si `ContentView` quiere convertirse en una vista SwiftUI, debe cumplir los requisitos del protocolo `View`.

### El protocolo Identifiable

Cuando aprendimos la lista de películas anteriormente, nos encontramos con el protocolo `Identifiable`.

En ese momento necesitábamos recorrer un array `Movie` dentro de `ForEach`, pero la estructura `Movie` no tenía un identificador único, por lo que no se podía usar directamente con `ForEach`.

Entonces necesitábamos hacer que la estructura `Movie` siguiera el protocolo `Identifiable`, para que cumpliera el requisito de identificador único de `ForEach`.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

El protocolo `Identifiable` exige: **este tipo debe tener un campo `id` que lo identifique.**

Después de que `Movie` proporciona un campo `id`, puede cumplir los requisitos de `Identifiable`.

Así, cuando lo usamos en `ForEach`, SwiftUI puede reconocer cada dato.

```swift
ForEach(lists) { movie in
    // ...
}
```

### El protocolo View

El protocolo `View` funciona de la misma manera.

Si un tipo quiere convertirse en una vista SwiftUI, necesita seguir el protocolo `View`.

El requisito más importante del protocolo `View` es proporcionar un `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

Podemos entender el requisito del protocolo `View` así: **acepta la vista SwiftUI que devuelve `body`, y `ContentView` muestra vistas SwiftUI a través de `body`.**

### ¿Qué pasa si no seguimos View?

Si escribimos esto:

```swift
struct ContentView {
}
```

Esto es solo una estructura normal, no una vista SwiftUI.

No dará error directamente, porque una estructura normal es código Swift válido.

Sin embargo, si la ponemos en una vista previa:

```swift
#Preview {
    ContentView()
}
```

aparecerá un error.

La razón es: **la vista previa necesita mostrar una vista SwiftUI, pero este `ContentView` no sigue el protocolo `View`.**

Por eso, si queremos que `ContentView` se pueda mostrar en la interfaz, necesitamos hacer que siga el protocolo `View`:

```swift
struct ContentView: View {
}
```

Al mismo tiempo, debemos proporcionar `body` como exige el protocolo `View`. Si no hay `body`, el compilador seguirá mostrando un error.

La forma correcta:

```swift
struct ContentView: View {
    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

En este momento, `ContentView` ya es una verdadera vista SwiftUI que se puede mostrar.

## body es la entrada para mostrar una vista

En SwiftUI, `body` es la entrada al contenido de una vista.

```swift
var body: some View {
    Text("¡Hola, mundo!")
}
```

Esto se puede dividir en tres partes:

**1. var body**

```swift
var body
```

Esto define una variable llamada `body`.

**2. some View**

```swift
: some View
```

Esto significa que este `body` devuelve una vista.

**3. { ... }**

```swift
{
    Text("¡Hola, mundo!")
}
```

Esto representa el contenido de vista que se muestra. En este código, el contenido mostrado es una vista `Text`.

En otras palabras, lo que escribamos dentro de `body` es lo que aparece en la interfaz.

Por ejemplo:

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nombre:")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Este código significa: **la interfaz muestra contenido organizado verticalmente, con dos textos dentro.**

### El nombre body no se puede cambiar libremente

Hay que tener en cuenta que el nombre `body` no se puede cambiar libremente.

Si escribimos:

```swift
struct ContentView: View {
    var content: some View {
        Text("¡Hola, mundo!")
    }
}
```

Este `content` también es una propiedad de vista, pero no puede reemplazar a `body`.

Esto se debe a que el nombre que exige el protocolo `View` es `body`.

## ¿Qué es some View?

En SwiftUI, `some View` significa devolver una vista concreta, pero sin escribir el tipo completo de esa vista.

```swift
var body: some View
```

Es decir, `some View` no significa que no haya tipo. El tipo real sigue existiendo y el compilador conoce ese tipo, pero puede ser complejo, así que Swift nos permite ocultarlo con `some View`.

### ¿Qué es some?

En Swift, `some` es una palabra clave usada para declarar un tipo opaco.

Un tipo opaco significa: **el valor de retorno tiene un tipo concreto, y el compilador sabe cuál es ese tipo concreto, pero nosotros no lo escribimos directamente.**

Por ejemplo:

```swift
func makeView() -> some View {
    Text("Hola")
}
```

Esto significa que `makeView` devuelve un tipo concreto que sigue el protocolo `View`.

### ¿Por qué necesitamos some?

Al aprender variables, aprendimos que: **los valores en Swift necesitan una anotación de tipo explícita, o el compilador debe inferir automáticamente su tipo.**

Por ejemplo:

```swift
let a: Int = 10
```

Aquí, la constante `a` es de tipo `Int`.

Las vistas SwiftUI no son una excepción. Cuando usamos `body` para mostrar una vista SwiftUI, `body` necesita devolver el tipo SwiftUI correspondiente.

Por ejemplo, si usamos `body` para mostrar una vista `Text`, necesitamos que `body` devuelva el tipo `Text` correspondiente.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

En este ejemplo, la vista que se muestra dentro de `body` es una vista `Text`, y el tipo de retorno también es `Text`.

Solo cuando el tipo interno coincide con el tipo declarado se cumple el requisito de coherencia de tipos del compilador.

**Problema de tipos no coincidentes**

Si establecemos el tipo de `body` como `Color`, pero mostramos `Text`:

```swift
var body: Color {
    Text("Fang Junyu")
}
```

el tipo de `body` y el tipo del código interno no coinciden, por lo que aparece un error de tipo no coincidente.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

En este momento, necesitamos cambiar manualmente el tipo de retorno de `body`.

**Tipos de vista complejos**

En el desarrollo real, una interfaz normalmente no contiene solo un `Text`.

Si necesitamos mostrar un `VStack` más complejo, tendríamos que escribir manualmente un tipo de retorno complejo.

Por ejemplo:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("¡Hola, mundo!")
    }
}
```

Este código devuelve un `VStack`, y dentro del `VStack` hay vistas de tipo `Image` y `Text`.

El tipo de retorno de `body` es:

```swift
VStack<TupleView<(Image,Text)>>
```

Como puedes ver, este tipo de retorno es muy complejo, y además introduce `TupleView`, que no habíamos visto antes.

Aquí, `TupleView` se puede entender como: **envolver varias vistas hijas en una sola vista.**

**Tipos de vista aún más complejos**

Si añadimos modificadores a la vista:

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("¡Hola, mundo!")
    }
    .padding()
}
```

entonces el tipo de retorno de esta vista se vuelve muy complejo y no se puede describir en detalle aquí.

El tipo de retorno existente `VStack<TupleView<(Image,Text)>>` ya no puede describir los modificadores, por lo que aparece un error.

**some View simplifica el tipo de retorno**

Para esta situación, SwiftUI ofrece una solución sencilla: usar `some View` para simplificar el código.

Cuando cambiamos `body` al tipo `some View`:

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("¡Hola, mundo!")
    }
    .padding()
}
```

ya no necesitamos escribir el tipo de retorno completo cada vez que modificamos el código de la vista.

Esto se debe a que `some View` significa devolver una vista concreta que sigue el protocolo `View`.

En otras palabras, vistas de SwiftUI como `VStack` e `Image` siguen el protocolo `View`. Después de añadir modificadores, el tipo de vista devuelto sigue conformando al protocolo `View`.

Por eso todas se pueden devolver como `some View`.

### some View no puede devolver cualquier vista libremente

Aunque `some View` puede ocultar tipos complejos, no es "sin tipo".

Su regla principal es: **el compilador debe poder determinar un tipo de retorno concreto**.

Por ejemplo:

```swift
var title: some View {
    Text("Hola")
}
```

Esto devuelve una vista `Text`.

Sin embargo, si intentamos devolver dos vistas, aparece un error:

```swift
var title: some View {
    Text("Hola")
    Image(systemName: "star")
}
```

Esto se debe a que `some View` finalmente necesita devolver una sola estructura de vista, pero aquí estamos intentando devolver dos vistas independientes.

### Solución

Normalmente hay dos soluciones: un contenedor y `@ViewBuilder`.

**1. Envolver con un contenedor**

```swift
var title: some View {
    VStack {
        Text("Hola")
        Image(systemName: "star")
    }
}
```

En este código, `title` devuelve un `VStack`, mientras que `Text` e `Image` son vistas hijas dentro del `VStack`.

La estructura de vista aceptada por `some View` es `VStack<...>`, lo que cumple el requisito de que `some View` devuelva una sola estructura de vista. 

Esta es también la razón por la que, desde el inicio del aprendizaje de SwiftUI, recomendamos envolver el código de vista en un contenedor exterior `VStack`.

**2. Usar @ViewBuilder**

También podemos añadir el modificador `@ViewBuilder` antes de `some View`:

```swift
@ViewBuilder
var title: some View {
    Text("Hola")
    Image(systemName: "star")
}
```

`@ViewBuilder` puede combinar varias vistas en un único resultado de retorno.

En esencia, sigue fusionando varias vistas en una sola vista, cumpliendo el requisito de que `some View` devuelva una sola estructura de vista.

### ¿Por qué body puede contener varias vistas directamente?

Si escribimos varias vistas dentro de `var body`, por ejemplo:

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("¡Hola, mundo!")
}
```

en algunos casos, este `body` no mostrará error.

La razón es que `body` en el protocolo `View` admite `@ViewBuilder` por defecto:

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

En el código fuente del protocolo `View`, podemos ver que `@ViewBuilder` ya modifica la variable `body`.

Por lo tanto, en comparación con un `some View` ordinario, `body` tiene una capa adicional de tratamiento especial, así que SwiftUI nos ayuda automáticamente a combinar varias vistas en una sola.

**Usar contenedores primero**

Para que sea más fácil de entender para principiantes, se recomienda usar primero contenedores como `VStack`, `HStack`, `ZStack` y `Group` para organizar varias vistas.

Por ejemplo:

```swift
var body: some View {
    VStack {
        Text("Hola")
        Image(systemName: "star")
    }
}
```

Esto hace que el código sea más intuitivo: **la capa exterior es un `VStack`, y dentro hay dos vistas hijas.**

## Dividir vistas

Si la interfaz es sencilla, podemos escribir todo el código dentro de `body`.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Bienvenido a Qinote")
                Text("Buenos días")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Haz clic") {
                print("Haz clic ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

El estilo de visualización de esta vista:

![view](../../Resource/023_view1.png)

Este código puede ejecutarse normalmente, pero si el código de la vista se vuelve muy complejo, el código dentro de `body` se hace cada vez más largo, lo que dificulta cada vez más leerlo y modificarlo.

En este punto, podemos dividir diferentes áreas en propiedades de vista independientes.

### Dividir la vista superior

Por ejemplo, dividimos el área superior:

```swift
var topHome: some View {
    HStack {
        Text("Inicio")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Aquí, `topHome` es una variable que devuelve una vista.

Como devuelve una vista, su tipo se puede escribir como:

```swift
some View
```

Esto es básicamente el mismo uso que `body`:

```swift
var topHome: some View { }
var body: some View { }
```

Ambas usan variables para mostrar vistas, y ambas tienen el tipo de retorno `some View`.

### Dividir otras vistas

Luego seguimos dividiendo otras partes:

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Bienvenido a Qinote")
        Text("Buenos días")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Haz clic") {
        print("Haz clic")
    }
    .buttonStyle(.borderedProminent)
}
```

Después de dividir, podemos colocar las variables de vista dentro de `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Inicio")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Bienvenido a Qinote")
            Text("Buenos días")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Haz clic") {
            print("Haz clic")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Ahora `body` solo se encarga de describir la estructura de la página:

```swift
topBar
welcomeText
colorList
clickButton
```

La implementación concreta de cada parte se coloca en la propiedad correspondiente de abajo.

Esta forma de dividir vistas puede hacer que la estructura de la página sea más clara. Cada área de vista tiene su propio nombre, lo que facilita la lectura del código.

Cuando modificamos cierta parte del código, podemos encontrar directamente el área de vista correspondiente, en lugar de buscar entre mucho código complejo.

### some View devuelve una sola vista

En esta vista dividida, si intentamos devolver varias vistas:

```swift
var topBar: some View {
    Text("Inicio")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

aparece un error, porque `some View` solo puede devolver una estructura de vista.

A diferencia de `body`, las propiedades calculadas ordinarias no tienen `@ViewBuilder` por defecto.

Por lo tanto, si necesitamos devolver varias vistas, podemos usar un contenedor `VStack`, `HStack` o `Group` para combinar varias vistas en una sola.

```swift
var topBar: some View {
    VStack {
        Text("Inicio")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

O añadir `@ViewBuilder` para combinar vistas:

```swift
@ViewBuilder
var topBar: some View {
    Text("Inicio")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Esto nos permite devolver varias vistas.

### if devuelve varias vistas

Por ejemplo:

```swift
var topHome: some View {
    if step == "Inicio" {
        HStack {
            Text("Inicio")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Vacío")
    }
}
```

En este código, `topHome` devuelve `HStack` o `Text` según el contenido de `step`, que son dos tipos de vista diferentes.

Como `some View` requiere un tipo de retorno concreto definido, las dos ramas de `if` en una propiedad calculada ordinaria no pueden devolver directamente tipos de vista diferentes, por lo que aparece un error.

**La solución sigue siendo envolverlas en un contenedor o usar `@ViewBuilder`.**

### Por qué las vistas divididas no usan paréntesis

Cuando usamos propiedades de vista separadas dentro de `body`, las escribimos directamente:

```swift
topBar
welcomeText
colorList
clickButton
```

en lugar de:

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

Esto se debe a que `topBar`, `welcomeText`, `colorList` y `clickButton` son variables. Más exactamente, son propiedades calculadas, no métodos.

**Las propiedades no necesitan paréntesis.**

Si lo escribimos como método, podemos lograr un efecto similar:

```swift
func topBar() -> some View {
    HStack {
        Text("Inicio")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Este código también puede lograr un efecto similar. Al llamar a este método, se devuelve una vista.

Al usarlo, debemos escribir:

```swift
topBar()
```

En SwiftUI, si solo estamos separando una vista que no necesita parámetros, es más común usar una propiedad calculada.

```swift
var topBar: some View { ... }
```

## Vistas anidadas

Además de dividir el código en propiedades, también podemos crear nuevas estructuras de vista.

Por ejemplo:

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Este `PinkColorView`, igual que `ContentView`, es una vista SwiftUI independiente.

Si necesitamos mostrarla en `ContentView`, podemos añadir `()` después del nombre de la vista.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Aquí:

```swift
PinkColorView()
```

significa crear una instancia de `PinkColorView`.

Como `PinkColorView` sigue el protocolo `View`, se puede colocar en otras vistas y mostrarse igual que `Text`, `Image` y `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

Esto es anidación de vistas: una vista puede mostrarse dentro de otra vista.

## ¿Propiedad de vista o nueva vista?

Cuando el código de vista es simple, normalmente no necesitamos dividirlo. Solo cuando el código se vuelve más complejo se recomienda dividir vistas.

### Cuándo usar propiedades de vista

Si es solo una pequeña parte del contenido de la vista actual, podemos usar una propiedad de vista.

Por ejemplo:

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Estas piezas de contenido normalmente solo se usan en la vista actual.

### Cuándo crear una nueva vista

Si el contenido es relativamente independiente, o puede reutilizarse en varias páginas en el futuro, es más adecuado crear una nueva vista.

Por ejemplo:

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

Esta es una vista de título. Si queremos usar esta vista como un componente reutilizable en otras vistas.

Podemos crear una nueva vista:

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Luego usarla en otros lugares:

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

En este momento, esta vista es un componente independiente reutilizable.

Podemos resumirlo de forma simple:

- Las áreas de contenido de la vista actual pueden usar `var xxx: some View`
- Los componentes independientes reutilizables pueden crearse como un nuevo `struct XxxView: View`
- Los componentes que necesitan recibir datos suelen ser más adecuados como nuevas vistas.

## Resumen

En esta lección volvimos a entender la estructura de vista más básica y más importante de SwiftUI.

`ContentView` es una estructura. Se define con `struct` y se usa para organizar el código relacionado con la página.

`View` es un protocolo. Si una estructura quiere convertirse en una vista SwiftUI, necesita seguir el protocolo `View`.

`body` es el contenido que el protocolo `View` nos exige proporcionar, y determina qué muestra esta vista.

`some View` significa devolver cierta vista concreta, sin necesidad de escribir su tipo completo y complejo.

Cuando el código de vista se vuelve largo, podemos usar `var xxx: some View` para dividir el código de vista en varias áreas pequeñas.

Cuando una parte del contenido es relativamente independiente o necesita reutilizarse, podemos crear una nueva estructura de vista y mostrarla en otras vistas con `XxxView()`.

En pocas palabras, las interfaces de SwiftUI están compuestas por vistas combinadas entre sí. Una página puede contener varias vistas pequeñas, y una vista pequeña también puede contener otras vistas.
