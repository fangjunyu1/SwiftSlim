# Diseño, imágenes y texto

En la lección anterior aprendimos el código de `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

En esta lección aprenderemos el mecanismo de diseño por defecto de SwiftUI, así como el uso de imágenes y texto. Sobre la base de la lección anterior, seguiremos profundizando en la estructura y la forma en que se muestran las vistas. Estos conocimientos nos ayudarán a construir interfaces básicas.

## Mecanismo de diseño predeterminado de SwiftUI

Al previsualizar `ContentView`, notaremos que el icono y el texto aparecen centrados, y no alineados desde la parte superior.

![Swift](../../RESOURCE/003_view.png)

De forma predeterminada, el contenedor `Stack` usa `.center` como alineación, por lo que las subviews suelen aparecer centradas.

### Alineación Alignment

Está claro que centrar es solo una de las formas de alineación. Si queremos alinear a la izquierda o a la derecha, necesitamos usar `alignment` para controlar la posición de la vista.

```swift
alignment
```

En SwiftUI, la alineación suele aparecer en dos escenarios:

**1. Parámetro de alineación del contenedor Stack**

Por ejemplo, para alinear a la izquierda el icono y el texto de `ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

En `VStack`, `alignment` controla la alineación en dirección horizontal.

Formas de alineación:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` ordena horizontalmente, así que `alignment` controla la alineación vertical:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` superpone vistas, así que `alignment` puede controlar tanto la alineación horizontal como la vertical:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Si no especificamos explícitamente `alignment`, `VStack`, `HStack` y `ZStack` usarán `.center` por defecto.

**2. Alignment dentro de frame**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Cuando el tamaño que ofrece `frame` es mayor que el tamaño propio de la vista, `alignment` decide la posición de la vista dentro de ese `frame`. El uso específico de `frame` se explicará más adelante; aquí solo lo conoceremos de forma básica.

### Spacer y el mecanismo de distribución del espacio

`alignment` puede hacer que las vistas se ordenen en horizontal o en vertical. Pero cuando queremos que un texto y una imagen aparezcan en extremos opuestos, una sola forma de alineación ya no basta.

Por ejemplo, si queremos crear la vista superior del sitio web de [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), con el logo de NHK a la izquierda y el icono del menú a la derecha:

![Swift](../../RESOURCE/003_alignment3.png)

Si solo usamos `alignment`, tanto el logo de NHK como el icono del menú aparecerán del mismo lado. No podremos distribuirlos a izquierda y derecha, así que necesitamos `Spacer` para repartir el espacio restante.

`Spacer` es una vista flexible de diseño que puede llenar automáticamente el espacio sobrante.

Forma de uso:

```swift
Spacer()
```

Por ejemplo:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Cuando añadimos `Spacer` entre `Image` y `Text`, `Spacer` llena el espacio restante y empuja `Image` y `Text` hacia los extremos superior e inferior.

![Swift](../../RESOURCE/003_view1.png)

Si hay varios `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

El espacio restante se reparte de forma uniforme entre ellos.

![Swift](../../RESOURCE/003_spacer.png)

## Mostrar imágenes y controlar su tamaño

La vista `Image` se utiliza principalmente para mostrar imágenes. Los iconos `SF Symbols` que aprendimos en la lección anterior son solo uno de sus usos.

Forma de uso:

```swift
Image("imageName")
```

Dentro de las comillas se escribe el nombre de la imagen, sin necesidad de poner la extensión.

### Mostrar una imagen

Primero preparamos una imagen.

![Swift](../../RESOURCE/003_img.jpg)

En Xcode, selecciona la carpeta de recursos `Assets` y arrastra la imagen dentro.

![Swift](../../RESOURCE/003_img1.png)

En `ContentView`, usa `Image` para mostrar la imagen:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Nota: `Image` de SwiftUI no admite reproducir animaciones GIF, solo puede mostrar un fotograma estático.

### Controlar el tamaño de la imagen

En SwiftUI, `Image` se muestra por defecto con el tamaño original de la imagen. Si queremos ajustar su tamaño visible, primero debemos usar `resizable` para permitir que el contenido se escale, y después usar `frame` para especificar el tamaño del layout.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modificador resizable

El modificador `resizable` permite que la imagen participe en el escalado del layout en lugar de mantener siempre su tamaño original.

```swift
.resizable()
```

Solo después de añadir `resizable()`, `frame` podrá cambiar realmente el tamaño visible de la imagen.

Si omitimos `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` solo proporcionará espacio de layout a la imagen, pero el tamaño de la imagen en sí no cambiará.

### Modificador frame

`frame(width:height)` se usa para especificar el ancho y la altura de una vista.

Uso básico:

```swift
.frame(width: 10,height: 10)
```

Por ejemplo, para establecer una imagen como un rectángulo de ancho `300` y alto `100`:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

También podemos establecer solo el ancho o solo la altura:

```swift
.frame(width: 200)
.frame(height: 100)
```

La combinación `resizable + frame` permite controlar con flexibilidad el tamaño de la imagen dentro de la interfaz y mantener al mismo tiempo la capacidad de escalado.

### Proporción de escala: scaledToFit y scaledToFill

Cuando usamos `frame` con una proporción de ancho y alto distinta a la de la imagen original, esta puede deformarse.

Si queremos que la imagen se adapte al espacio disponible manteniendo su proporción, podemos usar `scaledToFit` o `scaledToFill`.

**scaledToFit**

`scaledToFit` mantiene la proporción original de la imagen y la escala para que encaje completamente en el espacio disponible, sin recortarla:

```swift
.scaledToFit()
```

o

```swift
.aspectRatio(contentMode: .fit)
```

Esta forma es adecuada cuando necesitamos mostrar la imagen completa y no queremos que se deforme.

Si a todas las imágenes les damos el mismo ancho y alto, es fácil que aparezca el problema de la deformación.

Por ejemplo:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Si no configuramos una proporción de escalado, la imagen no podrá mostrarse con su proporción original.

![Swift](../../RESOURCE/003_img4.png)

Usar `scaledToFit` permite mantener la proporción original.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` también mantiene la proporción de la imagen, pero llena todo el espacio disponible. Si la proporción no coincide, la parte que sobresale se recortará:

```swift
.scaledToFill()
```

o

```swift
.aspectRatio(contentMode: .fill)
```

Esta forma es adecuada cuando necesitamos que la imagen cubra por completo una zona, por ejemplo como imagen de fondo o banner.

**Diferencia entre ambos**

![Swift](../../RESOURCE/003_img6.png)

## Texto

En SwiftUI, `Text` se utiliza para mostrar texto.

Uso básico:

```swift
Text("FangJunyu")
```

Ya vimos `Text` en la lección anterior. En esta lección seguiremos aprendiendo a controlar el tamaño y el grosor de la fuente para que el texto tenga más expresividad dentro de la vista.

### Tamaño de fuente

El modificador `font` permite controlar el tamaño del texto:

```swift
.font(.title)
```

Por ejemplo:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Tamaños de fuente comunes (de mayor a menor):

```text
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Grosor de fuente

Si queremos que el texto se vea en negrita, podemos usar el modificador `fontWeight`:

```swift
.fontWeight(.bold)
```

Por ejemplo:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Grosor de fuente común (de fino a grueso):

```text
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` controla el tamaño de la fuente, y `fontWeight` controla su grosor. Se pueden combinar para enriquecer la presentación del texto.

## Resumen y práctica

Hasta este punto ya hemos aprendido contenidos básicos como el diseño predeterminado de SwiftUI, `Spacer`, `Image` y `Text`. Con esto ya basta para desarrollar algunas vistas sencillas.

Por ejemplo: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

La interfaz de Google es muy limpia. Contiene imágenes y texto, así que podemos intentar analizar su estructura desde la perspectiva de SwiftUI:

1. En conjunto se divide en tres partes: el logotipo de Google, el cuadro de búsqueda y el texto de ayuda. Se puede usar `VStack` para ordenarlas verticalmente.
2. El logotipo de Google es una imagen, así que se puede mostrar con `Image`.
3. El cuadro de búsqueda contiene un campo de entrada y un icono. Si ignoramos el campo de entrada por ahora, podemos usar `Image` para mostrar el icono de búsqueda.
4. El texto de ayuda se muestra con `Text`; para ordenar el texto horizontalmente se puede usar `HStack`, y para el color del texto se puede usar `foregroundStyle`.

Practicando estos conocimientos, podemos crear algunas vistas sencillas y profundizar en la comprensión y el uso de `Image`, `Text` y sus modificadores.
