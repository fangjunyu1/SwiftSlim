# Colores personalizados

En esta lección, aprenderemos cómo personalizar colores en SwiftUI.

En las lecciones anteriores, ya hemos usado los colores predeterminados que proporciona SwiftUI, por ejemplo:

```swift
Color.blue
Color.red
Color.green
```

Estos colores son cómodos de usar, pero en el desarrollo real de una App, los colores predeterminados normalmente no son lo bastante precisos.

Por ejemplo, un diseño puede usar colores como estos:

```text
#2c54c2
#4875ed
#213e8d
```

Este tipo de color se llama color Hex.

En esta lección, primero haremos que SwiftUI admita colores Hex y luego usaremos `static` para organizar los colores de uso común.

Por último, aplicaremos colores personalizados a la vista de enciclopedia de animales y usaremos además un fondo degradado para que los botones parezcan tener más profundidad.

## ¿Por qué necesitamos colores personalizados?

En SwiftUI, podemos usar directamente los colores del sistema.

Por ejemplo:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Aquí, `.blue` significa azul. En realidad, es una forma abreviada de `Color.blue`.

La ventaja de los colores predeterminados es que son simples y cómodos, pero las opciones disponibles son limitadas.

Por ejemplo:

```swift
Color.blue
```

Esto solo puede representar el azul predeterminado que proporciona SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Sin embargo, en el desarrollo real, a menudo necesitamos colores más concretos.

Por ejemplo, aunque todos sean azules, puede haber diferentes efectos como azul claro, azul oscuro, azul grisáceo o azul brillante.

![More Blue](../../../Resource/031_color5.png)

En este caso, si solo usamos `Color.blue`, será difícil reproducir el efecto del diseño.

Por eso, necesitamos hacer que SwiftUI admita colores personalizados.

## ¿Qué es un color Hex?

Los colores en una pantalla suelen estar formados por tres canales: rojo, verde y azul. Esto es RGB.

RGB significa:

```text
Red     // Rojo
Green   // Verde
Blue    // Azul
```

Un color Hex es una forma de representar un color RGB.

Por ejemplo:

```swift
#5479FF
```

Este valor de color se puede entender de forma sencilla como tres partes:

```text
54  // Representa el canal rojo
79  // Representa el canal verde
FF  // Representa el canal azul
```

En esta lección, no necesitamos calcular estos valores ni comprender en profundidad las reglas hexadecimales.

Por ahora, solo necesitamos saber que `#5479FF` representa un color concreto.

Más adelante, cuando veamos escrituras como `#2c54c2` y `#4875ed`, primero podremos entenderlas como valores de color.

En herramientas de diseño como Sketch, Figma y Photoshop, también se suelen ver valores de color similares.

![color](../../../Resource/031_color.png)

Sin embargo, SwiftUI no permite escribir esto directamente de forma predeterminada:

```swift
Color(hex: "#5479FF")
```

Por eso, necesitamos extender nosotros mismos el tipo `Color` para que admita crear colores a partir de cadenas Hex.

## Crear el archivo Color+Hex.swift

Primero, creamos un nuevo archivo Swift.

El nombre del archivo puede ser:

```text
Color.swift
```

También se puede escribir de una forma más clara:

```text
Color+Hex.swift
```

Aquí, se recomienda más usar:

```text
Color+Hex.swift
```

En proyectos Swift, nombres de archivo como `Color+Hex.swift` son muy comunes.

Significa que este archivo es un archivo de extensión que añade capacidad Hex a `Color`.

El nombre del archivo no afecta directamente a la ejecución del código. Solo sirve para ayudarnos a entender más fácilmente el propósito del archivo.

## Añadir el código de Color(hex:)

En el archivo `Color+Hex.swift`, escribe el siguiente código:

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Este código usa `extension` para extender el tipo `Color` y añade a `Color` un nuevo inicializador:

```swift
init(hex: String)
```

Después de tener este inicializador, podemos pasar una cadena Hex a `Color` para crear un color personalizado:

```swift
Color(hex: "#5479FF")
```

Dentro de este código de extensión, la cadena Hex se convierte en un color RGB que SwiftUI puede reconocer.

En esta etapa, no necesitas comprender en profundidad la lógica de conversión de cada línea. Solo necesitas saber que el método añadido `Color(hex:)` nos permite crear colores personalizados mediante valores de color Hex.

## Usar colores personalizados

Ahora, podemos probar los colores personalizados en `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Efecto mostrado:

![color](../../../Resource/031_color1.png)

En este ejemplo, la primera línea usa un color del sistema:

```swift
.foregroundStyle(Color.blue)
```

Las siguientes tres líneas usan colores Hex personalizados:

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Al comparar, podemos ver que el azul del sistema solo tiene un efecto predeterminado.

En cambio, los colores Hex pueden representar variaciones de azul más detalladas.

Este es el valor de los colores personalizados: pueden hacer que los colores de la interfaz se acerquen más al diseño real y que nos resulte más fácil controlar el estilo visual de una App.

## Usar static para organizar colores

Ahora, ya podemos crear colores mediante cadenas Hex:

```swift
Color(hex: "#2c54c2")
```

Esta forma de escribir funciona correctamente, pero si el mismo color aparece repetidamente en varios lugares, el mantenimiento posterior no será muy cómodo.

Si este valor de color se escribe en 10 lugares diferentes, cuando queramos modificar este azul más adelante, tendremos que cambiarlo uno por uno.

En este caso, podemos usar `static` para organizar los colores de uso común en un solo lugar.

En la parte inferior del archivo `Color+Hex.swift`, continúa añadiendo el siguiente código:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Aquí, hemos añadido tres propiedades estáticas a `Color`: `animalBlue`, `animalLightBlue` y `animalDarkBlue`. Representan distintos tonos de azul.

Como estas propiedades usan `static`, pertenecen al propio tipo `Color`.

Al usarlas, podemos acceder directamente a ellas mediante `Color.`:

```swift
Color.animalBlue
```

Esta forma de escribir es más clara que escribir directamente una cadena Hex.

Cuando vemos `Color.animalBlue`, podemos saber que representa el azul usado en la enciclopedia de animales.

Pero cuando vemos `Color(hex: "#2c54c2")`, solo podemos saber que es un valor de color, y no es fácil identificar su propósito concreto.

Gestionar los colores en un solo lugar tiene otra ventaja: los cambios posteriores son más fáciles.

Si queremos ajustar el color principal de la enciclopedia de animales, solo necesitamos modificar la ubicación de la definición:

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Todos los lugares que usan este color se actualizarán juntos.

Este es el sentido de usar `static` para organizar colores: hace que los nombres de los colores sean más claros y que el mantenimiento posterior sea más cómodo.

## Aplicarlo a la enciclopedia de animales

Ahora, podemos aplicar colores personalizados a la vista anterior de la enciclopedia de animales.

Antes, el fondo del botón de animal era blanco:

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Ahora, podemos cambiarlo por un color personalizado:

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Aquí, `Color.animalBlue` es el color estático que acabamos de definir en `Color+Hex.swift`.

El texto del botón usa blanco:

```swift
.foregroundStyle(Color.white)
```

El fondo del emoji del animal usa blanco semitransparente:

```swift
.background(Color.white.opacity(0.15))
```

Así, el botón forma un estilo visual azul unificado.

El punto clave de este paso no es añadir código complejo, sino aplicar realmente a la interfaz los colores personalizados que aprendimos antes.

## Usar un fondo degradado

Además de usar un solo color, también podemos combinar varios colores para crear un efecto degradado.

Por ejemplo, antes definimos estos colores:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Estos colores no solo se pueden usar de forma individual, sino que también se pueden combinar en un fondo degradado.

En SwiftUI, podemos usar `LinearGradient` para crear un degradado lineal.

Por ejemplo:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Este código crea un fondo degradado de izquierda a derecha, con el color pasando gradualmente de `Color.animalBlue` a `Color.animalLightBlue`.

Aquí, `colors` se usa para establecer los colores que participan en el degradado, mientras que `startPoint` y `endPoint` se usan para controlar la dirección del degradado.

### Probar el efecto degradado

Podemos usar un Text sencillo para probar el fondo degradado.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Efecto mostrado:

![color](../../../Resource/031_color3.png)

En este ejemplo, el fondo de `Text` ya no es un solo color, sino un color degradado que cambia gradualmente de izquierda a derecha.

Comparado con un color de fondo normal, un fondo degradado tiene más capas y puede crear con más facilidad un foco visual en la interfaz.

## Usar un fondo degradado en la enciclopedia de animales

Ahora, podemos cambiar el color de fondo del botón de animal:

```swift
.background(Color.animalBlue)
```

Por un fondo degradado:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

El código completo es el siguiente:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Efecto mostrado:

![color](../../../Resource/031_color4.png)

Ahora, el botón de animal ya no es solo un color de fondo único, sino que tiene un efecto degradado de izquierda a derecha.

Comparado con un fondo de color único, un fondo degradado puede hacer que la interfaz parezca tener más capas y se acerque más al diseño visual de una App real.

## Diferencia entre fondo de color único y fondo degradado

Un fondo de color único solo usa un color.

Por ejemplo:

```swift
.background(Color.animalBlue)
```

Esta forma de escribir es simple y clara, y es adecuada para la mayoría de las interfaces básicas.

Un fondo degradado usa varios colores.

Por ejemplo:

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Esta forma de escribir puede hacer que la interfaz tenga más capas, pero también puede aumentar con más facilidad la complejidad visual.

Por eso, en el desarrollo real, podemos entenderlo así:

Los fondos de color único son adecuados para texto normal, botones normales, tarjetas normales y fondos de página normales.

Los fondos degradados son adecuados para botones importantes, zonas superiores, tarjetas de portada, entradas de funciones y otras posiciones que necesitan énfasis.

## Resumen

En esta lección, aprendimos cómo usar colores personalizados en SwiftUI.

Primero, conocimos los colores Hex.

Por ejemplo:

```text
#2c54c2
```

Representa un color concreto.

Después, usamos `extension Color` para extender el tipo `Color`.

Esto permite que SwiftUI cree colores de la siguiente forma:

```swift
Color(hex: "#2c54c2")
```

Luego, usamos `static` para organizar los colores de uso común:

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

De esta forma, podemos usarlo directamente en otras vistas:

```swift
Color.animalBlue
```

Comparado con escribir cadenas Hex cada vez, este método es más claro y también facilita modificar los colores de forma unificada más adelante.

Por último, aprendimos `LinearGradient` y combinamos colores personalizados en un fondo degradado:

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

A través de esta lección, completamos el proceso desde “crear colores personalizados” hasta “usar colores en una interfaz real”.

Más adelante, cuando un color deba usarse repetidamente en varios lugares, podemos considerar primero organizarlo en una extensión de `Color`.

Así el código será más claro y el estilo de la interfaz será más fácil de unificar.
