# Adaptación de apariencia

En esta lección, aprenderemos a adaptar una interfaz al modo claro y al modo oscuro.

En iPhone, iPad y Mac, los usuarios pueden elegir el modo claro o el modo oscuro.

Cuando el sistema cambia al modo oscuro, el fondo, el texto y los colores de los iconos de muchas apps también cambian en consecuencia.

Por ejemplo, la interfaz puede usar un fondo claro durante el día y cambiar a un fondo oscuro por la noche.

![view](../../../Resource/025_view9.png)

Esta capacidad de ajustar automáticamente la visualización de la interfaz según la apariencia del sistema se llama adaptación de apariencia.

## Previsualizar la adaptación de apariencia en Xcode

Antes de aprender la adaptación de apariencia, veamos primero cómo previsualizar el modo claro y el modo oscuro en Xcode.

En la parte inferior del área `Canvas`, haz clic en el botón `Device Settings` para abrir la ventana emergente `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

En la ventana emergente, puedes ver el ajuste `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Esto significa:

- `Light Appearance` significa modo claro.
- `Dark Appearance` significa modo oscuro.

Podemos cambiar aquí la apariencia de la vista previa y comprobar cómo se ve la interfaz actual en modo claro y en modo oscuro.

## Mostrar dos apariencias en paralelo

Si quieres ver el modo claro y el modo oscuro al mismo tiempo, puedes usar la función `Variants`.

En la parte inferior del área `Canvas`, haz clic en el botón `Variants` y elige `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Después de seleccionarlo, `Canvas` mostrará al mismo tiempo las vistas previas del modo claro y del modo oscuro.

![canvas3](../../../Resource/025_view3.png)

Esto facilita comparar las diferencias de la interfaz entre las dos apariencias.

En pocas palabras:

Si solo quieres cambiar temporalmente entre modo claro y modo oscuro, puedes usar `Canvas Device Settings`.

Si quieres ver ambas apariencias al mismo tiempo, puedes usar `Color Scheme Variants`.

## Las vistas se adaptan a la apariencia de forma predeterminada

En SwiftUI, muchas vistas del sistema se adaptan automáticamente al modo claro y al modo oscuro de forma predeterminada.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Claro")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("algo algo algo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultado de visualización:

![canvas](../../../Resource/025_view4.png)

Como puedes ver, en modo claro, los iconos y los títulos suelen mostrarse en color oscuro.

En modo oscuro, los iconos y los títulos se vuelven claros automáticamente.

Esto se debe a que las vistas de SwiftUI como `Text` e `Image` ajustan sus colores según la apariencia del sistema de forma predeterminada.

En otras palabras, si no especificamos manualmente un color fijo, SwiftUI se encargará de una parte de la adaptación de apariencia por nosotros.

## Los colores fijos no cambian automáticamente

Es importante tener en cuenta que si especificamos manualmente un color fijo, este no cambiará automáticamente entre el modo claro y el modo oscuro.

Por ejemplo:

```swift
Text("algo algo algo")
	.foregroundStyle(Color.gray)
```

El texto aquí está establecido como `Color.gray`, por lo que siempre se mostrará en gris.

Otro ejemplo:

```swift
Text("Título")
    .foregroundStyle(Color.white)
```

Este código mostrará texto blanco tanto en modo claro como en modo oscuro.

Si el fondo también es claro, el texto blanco puede ser difícil de leer.

Por eso, al adaptar una interfaz a distintas apariencias, intenta evitar escribir sin cuidado colores fijos como `Color.white` y `Color.black`.

En muchos casos, puedes dar prioridad a los estilos semánticos del sistema, por ejemplo:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Esto significa:

- `.primary` se suele usar para el contenido principal.
- `.secondary` se suele usar para el contenido secundario.

Estos estilos ajustan automáticamente su visualización según el modo claro y el modo oscuro.

## Mostrar contenido diferente según la apariencia

A veces, no solo queremos que cambien los colores, sino también que se muestre contenido diferente bajo distintas apariencias.

Por ejemplo:

- Mostrar un icono de bombilla normal en modo claro.
- Mostrar un icono de bombilla iluminada en modo oscuro.
- Mostrar `Claro` como título en modo claro.
- Mostrar `Oscuro` como título en modo oscuro.

En este caso, necesitamos determinar si el sistema actual está en modo claro o en modo oscuro.

En SwiftUI, podemos obtener el modo de apariencia actual mediante el valor de entorno `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Código completo:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Claro" : "Oscuro"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("algo algo algo")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Resultado de visualización:

![view](../../../Resource/025_view5.png)

A partir del resultado de la vista previa, puedes ver que una misma vista no muestra exactamente el mismo contenido en distintos modos de apariencia.

En modo claro, `Image` muestra el icono de bombilla normal y el título muestra `Claro`.

En modo oscuro, `Image` muestra el icono de bombilla iluminada y el título muestra `Oscuro`.

En otras palabras, el cambio aquí no es solo un cambio de color. El nombre del icono y el texto del título también han cambiado.

Esto se debe a que no escribimos directamente el icono y el título de forma fija dentro de `body`. En su lugar, calculamos contenido diferente según `colorScheme`.

En este código, usamos dos propiedades calculadas:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Claro" : "Oscuro"
}
```

Cuando `colorScheme` es `.light`, significa que el modo actual es el modo claro.

Cuando `colorScheme` es `.dark`, significa que el modo actual es el modo oscuro.

Por eso podemos devolver distintos nombres de icono y textos de título según los distintos modos de apariencia.

Este también es un uso común de las propiedades calculadas: calcular el contenido que una vista necesita mostrar según el estado actual.

## Comprender @Environment

Esta es la primera vez que encontramos `@Environment`.

`@Environment` puede entenderse como leer un valor desde el entorno de SwiftUI.

Cuando una app se ejecuta, el sistema proporciona muchos tipos de información de entorno, por ejemplo:

- Idioma actual
- Modo de apariencia actual
- Dirección de diseño actual
- Ajuste actual del tamaño de fuente

Cuando necesitamos obtener el modo de apariencia actual, podemos leer `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Aquí:

```swift
\.colorScheme
```

significa leer el valor `colorScheme` desde el entorno.

```swift
private var colorScheme
```

significa guardar el valor leído en la variable `colorScheme`.

Puedes decidir tú mismo el nombre de la variable. Por ejemplo, también puedes escribir:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Mientras el `\.colorScheme` anterior no cambie, significa que estás leyendo el modo de apariencia actual.

## Dos valores comunes de colorScheme

`colorScheme` suele tener dos valores:

```swift
.light
.dark
```

Significan:

- `.light`: modo claro
- `.dark`: modo oscuro

Por ejemplo:

```swift
private var titleName: String {
    colorScheme == .light ? "Claro" : "Oscuro"
}
```

Este código significa:

Si el modo actual es modo claro, `colorScheme == .light` es verdadero, por lo que devuelve `"Claro"`.

De lo contrario, devuelve `"Oscuro"`.

Por eso, en modo claro:

```swift
Text(titleName)
```

El texto mostrado es:

```swift
Claro
```

En modo oscuro, el texto mostrado es:

```swift
Oscuro
```

De esta manera, podemos mostrar contenido diferente según distintas apariencias.

## Ejemplo de adaptación de color

Además de texto e iconos, a veces también necesitamos gestionar nosotros mismos la adaptación de color.

Por ejemplo:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Texto")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Resultado de visualización:

![view](../../../Resource/025_view6.png)

En este código, el texto es blanco y el fondo es negro.

En modo claro, el fondo negro se ve bastante claro.

Sin embargo, en modo oscuro, si el fondo de toda la interfaz también es negro, este fondo negro se mezclará con el fondo del sistema y se verá menos claro.

En este punto, podemos cambiar el color del texto y el color de fondo según el modo de apariencia:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Texto")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Resultado de visualización:

![view](../../../Resource/025_view7.png)

Ahora, el modo claro usa un fondo negro con texto blanco.

El modo oscuro usa un fondo blanco con texto negro.

De esta forma, sin importar qué apariencia se use, el texto y el fondo tienen un contraste claro, y los usuarios pueden ver el contenido con claridad.

## Usar Assets para adaptar colores

Además de comprobar manualmente con `colorScheme`, también podemos usar colores de recursos de `Assets` para adaptarnos al modo claro y al modo oscuro.

Este método es más adecuado para gestionar colores comunes en una app.

En el proyecto de Xcode, busca la carpeta de recursos `Assets`.

![assets](../../../Resource/025_color.png)

Abre la carpeta `Assets`, haz clic derecho en un área vacía y elige `New Color Set` para crear un nuevo recurso de color.

![assets](../../../Resource/025_color1.png)

Aquí creamos un color y lo nombramos `redText`.

![assets](../../../Resource/025_color2.png)

Un recurso de color puede establecer colores por separado para el modo claro y el modo oscuro.

![assets](../../../Resource/025_color3.png)

Después de seleccionar el área de color correspondiente, puedes modificar el color en el inspector de la derecha.

Haz clic en el botón `Hide or show the Inspectors` de la esquina superior derecha para abrir el área de inspectores.

Luego elige `Show the Attributes inspector`, busca `Show Color Panel` en la parte inferior y abre el panel de color.

![assets](../../../Resource/025_color4.png)

Haz clic en un color del panel de color, y el área de color correspondiente de `redText` cambiará al mismo tiempo.

Aquí configuramos `redText` así:

- Mostrar rojo en modo claro
- Mostrar verde en modo oscuro

![assets](../../../Resource/025_color5.png)

De vuelta en el código SwiftUI, puedes usar este color así:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Aquí:

```swift
Color("redText")
```

significa leer desde `Assets` el recurso de color llamado `redText`.

Resultado de visualización:

![assets](../../../Resource/025_view8.png)

Puedes ver que el mismo `Color("redText")` muestra colores diferentes en modo claro y en modo oscuro.

Esto demuestra que los colores de `Assets` también admiten adaptación de apariencia.

## Diferencia entre colorScheme y Assets

Tanto `colorScheme` como `Assets` pueden implementar la adaptación de apariencia, pero son adecuados para escenarios diferentes.

Si solo necesitas cambiar el contenido del texto, los nombres de imagen o los nombres de `SF Symbols` según el modo claro y el modo oscuro, puedes usar `colorScheme`.

Por ejemplo:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Si el color se usa con frecuencia en la app, como un color de tema, un color de fondo de tarjeta o un color de texto, es más recomendable usar colores de `Assets`.

Esto se debe a que los colores de `Assets` pueden reutilizarse en varias vistas y son más fáciles de modificar más adelante.

Por ejemplo:

```swift
Color("redText")
```

De esta manera, solo necesitas modificar el color en `Assets`, y todos los lugares que usen este color cambiarán juntos.

## Resumen

En esta lección, aprendimos la adaptación de apariencia para el modo claro y el modo oscuro.

Primero, aprendimos cómo previsualizar diferentes apariencias en el `Canvas` de Xcode, y cómo usar `Color Scheme Variants` para ver el modo claro y el modo oscuro al mismo tiempo.

Luego, aprendimos que las vistas de SwiftUI como `Text` e `Image` adaptan automáticamente sus colores según la apariencia del sistema de forma predeterminada.

Sin embargo, si especificamos manualmente colores fijos como `Color.white` o `Color.black`, estos colores no cambiarán automáticamente.

Después, aprendimos `@Environment` y `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Mediante `colorScheme`, podemos determinar si el modo actual es modo claro o modo oscuro, y mostrar distintos iconos, textos o colores según distintas apariencias.

Finalmente, aprendimos sobre los colores de `Assets`.

Los colores de `Assets` pueden establecer colores por separado para el modo claro y el modo oscuro, por lo que son adecuados para gestionar recursos de color comunes en una app.

La adaptación de apariencia puede hacer que una app se vea mejor tanto de día como de noche, y también puede evitar problemas como texto ilegible o fondos poco claros.

En el desarrollo real, se recomienda dar prioridad al comportamiento de adaptación predeterminado de SwiftUI y a los colores de `Assets`.

Cuando necesites cambiar texto, iconos, imágenes o gestionar una pequeña cantidad de efectos de visualización especiales bajo distintas apariencias, entonces usa `colorScheme` para comprobarlo.

## Conocimiento ampliado: especificar el tamaño de fuente

Cuando aprendimos `font` anteriormente, usamos algunos estilos de fuente del sistema:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Además de usar estilos de fuente del sistema como `.largeTitle` y `.callout`, también puedes especificar manualmente el tamaño de fuente.

Por ejemplo:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Aquí:

```swift
.font(.system(size: 100))
```

significa establecer el tamaño de fuente en `100 pt`.

Para los iconos de `SF Symbols`, `font` también afecta al tamaño del icono.

Por eso, si quieres que un icono aparezca más grande, puedes especificar el tamaño con `.font(.system(size:))`.

Por ejemplo:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Es importante tener en cuenta que, aunque especificar manualmente el tamaño de fuente es más flexible, no se recomienda usar mucho tamaños de fuente fijos para texto normal.

Para texto normal, da prioridad a estilos de fuente del sistema como `.title`, `.headline`, `.body` y `.caption`.

Esto facilita la adaptación a distintos dispositivos y ajustes de fuente del usuario.
