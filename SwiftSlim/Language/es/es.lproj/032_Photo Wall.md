# Galería de fotos

En esta lección, crearemos una página de galería de fotos.

![view](../../../Resource/032_view13.png)

En este caso, repasaremos los conocimientos sobre `extension`, `self` e instancias, y aprenderemos los gráficos `Shape` que se usan con frecuencia en SwiftUI.

Con estos conocimientos, podemos recortar imágenes normales en diferentes estilos, como círculo, rectángulo redondeado, cápsula y elipse, y añadir efectos de borde a las fotos.

En esta lección usaremos varios conceptos nuevos: `Shape`, `clipShape`, `strokeBorder` y `overlay`.

Entre ellos, `clipShape` se usa para recortar la forma de una vista, `strokeBorder` se usa para dibujar el borde de una forma, y `overlay` se usa para superponer una nueva vista encima de la vista actual.

## Recursos de imagen

Antes de empezar, necesitamos preparar varias imágenes.

Puedes usar tus propias fotos, o también puedes usar las imágenes de ejemplo proporcionadas en esta lección.

Las fotos de ejemplo de esta lección provienen del sitio web [Pixabay](https://pixabay.com/):

[Paisaje](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Zorro](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Edificio](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Flor](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Cisne](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Después de descargar las imágenes, agrégalas a la carpeta de recursos `Assets` y nómbralas en orden como `1`, `2`, `3`, `4` y `5`.

![assets](../../../Resource/032_view17.png)

De esta manera, podemos mostrar las imágenes en SwiftUI mediante `Image("1")`, `Image("2")`, etc.

## Mostrar fotos

Primero, mostraremos 5 fotos en `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecto mostrado:

![view](../../../Resource/032_view.png)

En este código, usamos `ScrollView` para que la lista de fotos pueda desplazarse, y usamos `VStack` para organizar varias imágenes de arriba abajo.

Cada imagen usa `.resizable()`, `.scaledToFit()` y `.frame(width: 300)` para configurar su efecto de visualización, de modo que la imagen pueda escalarse, mantener su proporción completa y limitar su ancho.

El `.padding(.vertical, 100)` aplicado a `VStack` se usa para aumentar el espacio superior e inferior, y evitar que la primera y la última foto queden demasiado pegadas al borde de la pantalla.

El `.ignoresSafeArea()` final significa que la vista desplazable ignora el área segura, lo que permite que las fotos se extiendan hasta la parte superior e inferior de la pantalla al desplazarse, haciendo que la página se vea más completa.

Sin embargo, ahora las 5 imágenes usan los mismos modificadores:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Cuando vemos código repetido, podemos considerar usar `extension` para organizarlo.

## Usar extension para organizar el estilo de las imágenes

Podemos extender `Image` con un método específico para la galería de fotos:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aquí, hemos extendido el tipo `Image` con un método `photoGalleryStyle`.

Este método contiene los `.resizable()`, `.scaledToFit()` y `.frame(width: 300)` usados repetidamente antes. Es decir, reúne el código de escalado de la imagen, visualización proporcional y configuración del ancho.

Después de usar esta extensión, el código original de la imagen:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

se puede simplificar como:

```swift
Image("1")
    .photoGalleryStyle()
```

De esta manera, cada imagen solo necesita llamar a `.photoGalleryStyle()` para aplicar el mismo estilo de galería de fotos. El código será más limpio y también será más cómodo modificarlo de forma uniforme más adelante.

## Entender self

En el método de extensión, escribimos `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Aquí, `self` representa la instancia actual de la imagen que llama a este método.

Por ejemplo:

```swift
Image("1")
    .photoGalleryStyle()
```

En este código, `photoGalleryStyle()` es llamado por `Image("1")`, por lo que el `self` dentro del método representa esta imagen `Image("1")`.

Se puede entender de forma simple así: quien llama a este método es lo que representa `self`.

Hay que tener en cuenta que los modificadores de SwiftUI devuelven continuamente nuevos resultados de vista. Por lo tanto, `photoGalleryStyle()` devuelve una vista modificada, y no simplemente el `Image` original.

## Formas de las fotos

Ahora, las fotos ya se pueden mostrar normalmente. Sin embargo, estas fotos son rectangulares por defecto, por lo que se ven bastante comunes.

Si solo quieres que las fotos tengan esquinas redondeadas, puedes usar directamente `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Efecto mostrado:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` significa añadir a la imagen un radio de esquina de `20 pt`. Para imágenes normales con esquinas redondeadas, esta forma de escribirlo ya es suficiente.

Sin embargo, `.cornerRadius()` solo puede manejar el efecto de esquinas redondeadas, y es adecuado para crear imágenes normales con esquinas redondeadas. Si queremos convertir las fotos en más formas diferentes, este modificador por sí solo no es suficiente.

En este momento, necesitamos usar `Shape` en SwiftUI. `Shape` puede representar diferentes gráficos y, junto con `clipShape`, puede recortar la imagen con la forma correspondiente.

## Conocer Shape

En SwiftUI, `Shape` representa una figura gráfica. Al igual que `View`, es un tipo muy usado en SwiftUI.

Los `Shape` comunes incluyen círculo, rectángulo, rectángulo redondeado, cápsula y elipse. Para observar de forma más intuitiva el aspecto de diferentes figuras, los siguientes ejemplos establecen colores y tamaños distintos para cada figura.

En estos ejemplos, `.fill()` se usa para rellenar la figura con color, y `.frame()` se usa para establecer el tamaño de visualización de la figura. Los colores solo sirven para distinguir las diferentes figuras, y no son colores fijos propios de la figura.

### Circle círculo

`Circle` representa un círculo. Se usa a menudo para avatares, botones circulares, imágenes circulares y otros efectos de interfaz.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rectángulo

`Rectangle` representa un rectángulo. Es una de las figuras más básicas, y también se puede usar para crear fondos, dividir áreas o dibujar bordes normales.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle rectángulo redondeado

`RoundedRectangle` representa un rectángulo redondeado. `cornerRadius` se usa para establecer el tamaño de las esquinas redondeadas.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule forma de cápsula

`Capsule` representa una forma de cápsula. Sus dos extremos son arcos, y se usa a menudo para botones tipo cápsula, fondos de etiquetas y otros efectos de interfaz.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipse

`Ellipse` representa una elipse. Es similar a `Circle`, pero cuando el ancho y la altura no son iguales, se muestra como una elipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

A través de estos ejemplos, podemos ver que `Shape` puede mostrarse directamente como una figura. A continuación, usaremos estos `Shape` junto con `clipShape` para recortar fotos y hacer que se muestren con diferentes formas.

## Usar clipShape para recortar fotos

Ahora, podemos usar `clipShape` para recortar fotos con diferentes formas.

Por ejemplo, recortar la primera foto en forma circular:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Este código significa: primero mostrar una imagen y luego usar `Circle()` para recortarla en forma de círculo.

![view](../../../Resource/032_view2.png)

La sintaxis básica de `clipShape` es:

```swift
.clipShape(forma)
```

Añade `.clipShape(...)` detrás de la vista y escribe dentro de los paréntesis la figura a la que quieres recortarla.

Por ejemplo:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Ahora, recortamos las 5 fotos con formas diferentes:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecto mostrado:

![view](../../../Resource/032_view8.png)

Entre ellas, el efecto después de recortar con `Rectangle()` es parecido al de una foto rectangular normal, por lo que el cambio visual no es evidente. Se usa principalmente para compararlo con otras formas.

Ahora, las fotos ya no son solo rectángulos normales, sino que tienen diferentes formas.

## Añadir borde a las fotos

Si queremos añadir un borde a una foto circular, quizá pensemos en usar `border`:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Pero normalmente lo que obtenemos no es un borde circular, sino un borde rectangular.

![view](../../../Resource/032_view9.png)

Esto se debe a que `border` añade el borde según el área rectangular de la vista, y no según la forma obtenida después del recorte con `clipShape`.

Por lo tanto, si queremos un borde circular, no podemos usar directamente `border`.

## Usar strokeBorder para dibujar bordes de formas

En SwiftUI, `strokeBorder` puede dibujar bordes internos para estos `Shape` comunes.

Por ejemplo, dibujar un borde circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Este código significa: dibujar un borde marrón para `Circle`, con un ancho de borde de `10 pt`.

![view](../../../Resource/032_view12.png)

Aquí hay que tener en cuenta que `strokeBorder` no añade directamente un borde a la foto, sino que dibuja un borde para la figura `Circle()`.

Es decir, este código solo obtiene un borde circular independiente, que todavía no tiene relación con la foto.

Si queremos que este borde circular aparezca encima de la foto, necesitamos seguir usando `overlay` para superponer el borde sobre la foto.

## Usar overlay para superponer bordes

`overlay` es un modificador de vista que puede superponer una nueva vista encima de la vista actual.

Su estructura básica puede entenderse así:

```swift
Vista actual
    .overlay {
        Vista superpuesta
    }
```

En este caso, la vista actual es la foto que ya se ha recortado en forma circular:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

La nueva vista que queremos superponer es un borde circular:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Así que podemos combinar la foto y el borde:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Aquí, `overlay` significa superponer una nueva vista encima de la vista actual.

Dentro de `overlay`, el borde se superpone siguiendo el rango de visualización de la foto actual, por lo que no es necesario establecer otro `frame` por separado. Mientras la forma del borde y la forma del recorte sean iguales, el borde podrá ajustarse a la foto.

![view](../../../Resource/032_view10.png)

El efecto final es que un borde circular cubre la parte superior de la foto circular.

En comparación con `ZStack`, `overlay` es más adecuado para este tipo de escenario de “añadir una decoración a la vista actual”. La foto es el elemento principal y el borde solo es un efecto adicional, por lo que usar `overlay` resulta más claro.

## Completar la galería de fotos

Ahora, añadimos a cada foto su forma y borde correspondientes:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Efecto mostrado:

![view](../../../Resource/032_view13.png)

De esta manera, ya está terminada una página básica de galería de fotos.

En esta página, usamos `ScrollView` para implementar la visualización con desplazamiento, usamos `Image` para mostrar fotos, usamos `clipShape` para recortar la forma de las fotos, y usamos `overlay` y `strokeBorder` para añadir bordes.

## Código completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Resumen

En esta lección, completamos una página de galería de fotos.

![view](../../../Resource/032_view13.png)

En este caso, primero usamos `Image` para mostrar fotos, y luego extendimos `Image` con un método `photoGalleryStyle` mediante `extension`, para organizar el código repetido del estilo de las imágenes.

Después, aprendimos los `Shape` comunes en SwiftUI, como `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` y `Ellipse`. Estas figuras no solo pueden mostrarse directamente, sino que también pueden usarse junto con `clipShape` para recortar vistas.

Por ejemplo:

```swift
.clipShape(Circle())
```

significa recortar la vista en forma de círculo.

Por último, usamos `overlay` y `strokeBorder` para añadir a las fotos bordes con la forma correspondiente. Hay que tener en cuenta que `border` normalmente dibuja un borde según el área rectangular de la vista. Si quieres que el borde siga una forma circular, de cápsula o elíptica, es más adecuado superponer el mismo `Shape`.

A través de esta lección, no solo completamos el efecto de galería de fotos, sino que también entendimos la combinación habitual de `Shape`, `clipShape`, `strokeBorder` y `overlay` en la interfaz.

## Ejercicios después de clase

### 1. Añadir un fondo a la galería de fotos

Añade una imagen de fondo de pantalla completa a la página de galería de fotos.

Requisito: la imagen de fondo debe poder ocupar toda la pantalla e ignorar el área segura.

### 2. Borde con degradado

Cambia los bordes de color único existentes por bordes con degradado lineal.

Puedes intentar usar `LinearGradient` para lograr efectos de borde más ricos.

### 3. Borde de foto simulado

Busca en Internet algunos estilos reales de marcos de fotos e intenta usar `overlay` para superponer un marco de imagen, de modo que las fotos se vean más parecidas a un marco real.

Efecto mostrado del ejercicio:

![button](../../../Resource/032_view15.jpeg)

### 4. Implementar un borde de botón redondeado

En el desarrollo real, los botones suelen usar bordes de rectángulo redondeado.

Intenta crear un botón redondeado y usa `RoundedRectangle` y `strokeBorder` para añadirle un borde redondeado.

Efecto mostrado del ejercicio:

![button](../../../Resource/032_view14.png)

### Pregunta para pensar

Si no quieres usar un borde de color único ni un borde con degradado, sino que quieres que el borde presente algún tipo de efecto de patrón, ¿cómo deberías implementarlo?

Puedes intentar buscar información y conocer usos relacionados como `overlay`, `mask` o `ImagePaint`.

Efecto mostrado del ejercicio:

![button](../../../Resource/032_view16.png)
