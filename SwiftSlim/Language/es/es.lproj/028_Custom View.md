# Vista personalizada

En esta lección, aprenderemos una forma muy importante de escribir en SwiftUI: **View personalizada**.

Una View personalizada puede encapsular una parte de código View repetido y convertirla en una View que se puede reutilizar una y otra vez.

En el desarrollo real de una App, a menudo nos encontramos con esta situación: la estructura de muchas interfaces es la misma, pero el contenido que se muestra es diferente.

Por ejemplo, en la lista de publicaciones de un sitio de foro, cada publicación puede tener información como título, imagen y número de Me gusta.

![Reddit](../../../Resource/028_view1.png)

En la lista de productos de un sitio de compras, cada producto puede tener información como imagen, nombre y precio.

![Amazon](../../../Resource/028_view2.png)

La estructura de estos contenidos es similar; la diferencia está solo en los datos que se muestran.

Si escribimos manualmente el código de cada elemento, el código se volverá muy largo y no será cómodo modificarlo más adelante.

Por eso, podemos encapsular la estructura común en una View personalizada y pasar el contenido diferente como parámetros.

De esta manera, la misma View puede mostrar contenido diferente.

## Escenario de necesidad

Por ejemplo, ahora queremos crear una lista de ajustes.

Resultado mostrado:

![view](../../../Resource/028_view.png)

En esta lista de ajustes hay tres elementos de ajuste diferentes: `Ajustes`, `Carpeta` y `Música`.

Aunque sus iconos, colores y títulos son diferentes, la estructura general es la misma:

- Icono a la izquierda
- Color de fondo del icono
- Título en el centro
- Flecha a la derecha

Si no usamos una View personalizada, podríamos escribir así:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Ajustes")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Carpeta")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Música")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Este código puede mostrarse normalmente, pero el problema también es muy evidente: el código de los tres elementos de ajuste es casi completamente igual.

Solo cambian el icono, el color y el título:

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Ajustes")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Carpeta")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Música")
```

Es decir, la estructura de cada elemento de ajuste es fija; solo cambian el icono, el color y el título.

Esta situación es muy adecuada para usar una View personalizada.

### Sombra shadow

Aquí usamos un nuevo modifier, `.shadow(radius:)`:

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` puede añadir una sombra a una View.

`radius` indica el radio de desenfoque de la sombra. Cuanto mayor sea el valor, normalmente mayor será el área de difusión de la sombra y más suave se verá.

Aquí está configurado en `1`, lo que significa que solo se añade un efecto de sombra muy ligero.

## Encapsular la View del elemento de ajuste

A continuación, encapsulamos cada elemento de ajuste en una nueva View.

Podemos crear `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

En esta View, definimos tres propiedades:

```swift
let icon: String
let color: Color
let title: String
```

Entre ellas:

- `icon` representa el nombre del icono
- `color` representa el color de fondo del icono
- `title` representa el título del elemento de ajuste

Como estos tres contenidos son diferentes en distintos elementos de ajuste, los convertimos en parámetros que se pueden pasar desde fuera.

## Usar una View personalizada

Después de tener `SettingItemView`, ya no necesitamos escribir repetidamente un gran bloque de código `HStack`.

Ahora podemos usarla así:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")
```

Esta línea de código significa crear una View de elemento de ajuste y pasar tres parámetros:

```swift
icon: "gear"
color: Color.blue
title: "Ajustes"
```

Después de pasarlos, las propiedades dentro de `SettingItemView` obtendrán los valores correspondientes:

- el valor de `icon` es `gear`
- el valor de `color` es `Color.blue`
- el valor de `title` es `"Ajustes"`

Por lo tanto, dentro de la View, `Image(systemName: icon)` mostrará el icono de engranaje, `.background(color)` usará un fondo azul y `Text(title)` mostrará `Ajustes`.

Código completo:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Carpeta")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Música")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Resultado mostrado:

![view](../../../Resource/028_view.png)

Podemos ver que, después de encapsular, el resultado mostrado es el mismo que antes, pero el código se volvió más claro.

Antes, cada elemento de ajuste tenía que escribir una sección completa de `HStack`; ahora solo se necesita una línea de código:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")
```

Esta es la función de una View personalizada: **encapsular una estructura View repetida y pasar solo el contenido diferente como parámetros.**

## Por qué se pueden pasar parámetros

A continuación, entendamos de forma sencilla por qué una View personalizada puede recibir parámetros.

En SwiftUI, una View es esencialmente una estructura.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

Aquí `ContentView` es una estructura.

Cuando escribimos:

```swift
ContentView()
```

en realidad estamos creando una View `ContentView`.

Los `()` del final indican que se llama a su método de inicialización; también se puede entender como crear esta View.

Como esta `ContentView` no tiene propiedades que deban pasarse desde fuera, podemos escribir directamente:

```swift
ContentView()
```

Pero si una View tiene una propiedad sin valor, al crear la View debemos pasar el valor correspondiente.

Por ejemplo:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nombre: \(name)")
    }
}
```

Aquí `name` es una propiedad y no tiene valor predeterminado.

Por eso, al crear `ContentView`, debemos proporcionar un valor concreto para `name`:

```swift
ContentView(name: "Fang Junyu")
```

Así, la View puede usar este valor en su interior:

```swift
Text("nombre: \(name)")
```

Esta también es la razón por la que debemos pasar parámetros al crear `SettingItemView`:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")
```

Porque `SettingItemView` tiene tres propiedades sin valores predeterminados:

```swift
let icon: String
let color: Color
let title: String
```

Por eso, al crear esta View, debemos pasarlas hacia dentro. Swift usará los parámetros pasados para asignar valores a las propiedades dentro de la View.

## Método de inicialización

A continuación, entendamos un poco más el método de inicialización.

### Método de inicialización predeterminado

Cuando definimos una View común:

```swift
struct ContentView: View {
    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

En este código, no hemos escrito manualmente un método de inicialización.

Pero cuando usamos esta View, podemos escribir así:

```swift
ContentView()
```

Aquí `()` en realidad significa crear `ContentView`; también se puede entender como llamar a su método de inicialización.

### ¿Por qué se puede llamar aunque no veamos un método de inicialización?

Porque el compilador Swift genera automáticamente un método de inicialización para nosotros.

Hay que notar que: **este método de inicialización se genera automáticamente y normalmente no lo vemos directamente en el código.**

Es decir, aunque no hayamos escrito manualmente en `struct`:

```swift
init() {

}
```

el compilador Swift generará en segundo plano un método de inicialización aproximadamente así:

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("¡Hola, mundo!")
    }
}
```

Por eso podemos escribir directamente:

```swift
ContentView()
```

Por lo tanto, en el código real, normalmente no necesitamos escribir manualmente el método de inicialización.

Solo necesitamos entender una cosa: **cuando se crea una SwiftUI View, se llama al método de inicialización de esa View. Aunque no escribamos manualmente el método de inicialización, Swift puede generarlo automáticamente.**

### Método de inicialización con parámetros

Si una View tiene una propiedad sin valor predeterminado, por ejemplo:

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nombre: \(name)")
    }
}
```

el compilador Swift generará automáticamente un método de inicialización con parámetro según la propiedad.

Podemos entenderlo de forma sencilla así:

```swift
init(name: String) {
    self.name = name
}
```

Aquí:

```swift
init(name: String)
```

significa que, al crear `ContentView`, hay que pasar un parámetro `name` de tipo `String`.

Cuando escribimos:

```swift
ContentView(name: "Fang Junyu")
```

significa: pasar `"Fang Junyu"` como parámetro al método de inicialización.

Luego, dentro del método de inicialización, se ejecutará:

```swift
self.name = name
```

Esta línea de código significa: asignar el `name` pasado desde fuera a la propiedad propia `name` de la View actual.

Podemos entenderlo de forma sencilla así:

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nombre: \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Así, la View puede usar en su interior el valor pasado.

Este es el flujo de inicialización de una View con parámetros: **cuando una propiedad dentro de la View no tiene valor predeterminado, al crear la View se debe pasar el parámetro correspondiente, para que el método de inicialización complete la asignación de valor a la propiedad.**

## Caso en que una propiedad tiene valor predeterminado

Si una propiedad ya tiene un valor predeterminado, al crear la View podemos no pasar el parámetro.

Por ejemplo:

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nombre: \(name)")
    }
}
```

Aquí `name` ya tiene un valor predeterminado:

```swift
"Fang Junyu"
```

Por lo tanto, al crear `ContentView`, podemos escribir directamente:

```swift
ContentView()
```

En ese momento, `name` usará el valor predeterminado y la interfaz mostrará:

```swift
nombre: Fang Junyu
```

Por supuesto, al crear la View también podemos pasar un nuevo valor:

```swift
ContentView(name: "Sam")
```

En ese momento, la View usará `"Sam"` pasado desde fuera, en lugar del valor predeterminado, y la interfaz mostrará:

```swift
nombre: Sam
```

Para facilitar la comprensión, podemos imaginar de forma sencilla que el método de inicialización generado automáticamente por el compilador Swift es así:

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Aquí `name: String = "Fang Junyu"` significa: si al crear la View no se pasa `name`, usar el valor predeterminado `"Fang Junyu"`; si al crear la View se pasa un nuevo `name`, usar el valor pasado.

En otras palabras: **si no se pasa un parámetro desde fuera, se usa el valor predeterminado de la propiedad; si se pasa un parámetro desde fuera, se usa el valor pasado.**

## Volver a SettingItemView

Ahora volvamos a ver SettingItemView:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

La estructura de esta View es fija.

Las partes fijas incluyen:

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Las partes diferentes incluyen:

```swift
icon
color
title
```

Por eso, convertimos el contenido diferente en propiedades y lo pasamos como parámetros al crear la View.

Cuando creamos distintos elementos de ajuste, solo necesitamos pasar distintos parámetros:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")
SettingItemView(icon: "folder", color: Color.brown, title: "Carpeta")
SettingItemView(icon: "music.note", color: Color.purple, title: "Música")
```

Así, el mismo `SettingItemView` puede mostrar tres elementos de ajuste diferentes.

Esta es la forma más común de usar una View personalizada.

## Resumen

En esta lección, aprendimos la View personalizada.

La función principal de una View personalizada es: **encapsular código View repetido para que se pueda reutilizar.**

En este ejemplo, la estructura de los tres elementos de ajuste es la misma, y solo cambian el icono, el color y el título.

Por eso creamos `SettingItemView`:

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Luego, al usar esta View, pasamos diferentes parámetros:

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Ajustes")
```

Estos parámetros entran en `SettingItemView`.

Con este método, podemos usar menos código para crear Views con la misma estructura pero con contenido diferente.

Esta también es una forma de escritura muy común en el desarrollo SwiftUI.
