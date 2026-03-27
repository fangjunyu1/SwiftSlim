# Colores brillantes

En esta lección aprenderemos algunos modificadores visuales comunes de SwiftUI, incluyendo:

- Color
- Color de primer plano
- Color de fondo
- Desplazamiento
- Transparencia
- Desenfoque

También aprenderemos sobre la `Safe Area` (área segura).

Estos modificadores se utilizan para controlar la apariencia visual de las vistas y hacer que la interfaz sea más clara y con más capas.

## Color

En SwiftUI podemos establecer el color del texto.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` significa azul. En realidad es una forma abreviada de `Color.blue` gracias a la inferencia de tipos.

Algunos colores comunes incluyen:

```text
.black
.green
.yellow
.pink
.gray
...
```

Todos ellos son propiedades estáticas de `Color`.

![Color](../../RESOURCE/006_color.png)

Podemos entender `Color` como un tipo de color, y `.blue`, `.red` y otros como colores concretos de ese tipo.

### La vista Color

En SwiftUI, `Color` también puede mostrarse como una vista.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Este código genera un cuadrado rojo de `100 × 100`.

También podemos hacer que toda la interfaz se muestre con un color determinado:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Al ejecutarlo, veremos que el color rojo no cubre toda la pantalla. La parte superior e inferior del iPhone siguen siendo blancas. Aquí entra en juego la `Safe Area` (área segura).

## Safe Area (área segura)

La `Safe Area` es una zona reservada por el sistema para evitar que el contenido quede tapado. Incluye:

1. La barra de estado de la parte superior (hora, batería)
2. La barra indicadora de inicio de la parte inferior
3. La zona del notch o de la Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Por defecto, SwiftUI limita el contenido al área segura, así que la vista no se extiende hasta los bordes de la pantalla.

### Ignorar la Safe Area

Si queremos que el color cubra toda la pantalla, podemos usar `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

O usar `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Así la vista se extenderá por toda la pantalla.

Hay que tener en cuenta que `edgesIgnoringSafeArea` es una forma más antigua. Desde iOS 14, se recomienda usar `ignoresSafeArea`.

## Color de primer plano

### Modificador foregroundStyle

En lecciones anteriores ya aprendimos a usar `foregroundStyle` para establecer colores.

Por ejemplo:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` es un sistema de estilo más nuevo, que admite colores, degradados, materiales, etc.

![Color](../../RESOURCE/006_color2.png)

### Modificador foregroundColor

`foregroundColor` también puede establecer colores:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Se usa de forma muy parecida a `foregroundStyle`.

En las versiones más recientes de Xcode, Xcode advierte que `foregroundColor` puede quedar obsoleto en futuras versiones de iOS, por lo que se recomienda dar prioridad a `foregroundStyle`.

## Fondo

Si queremos añadir un color de fondo a una vista, podemos usar `background`:

```swift
background(.red)
```

Por ejemplo, añadir un fondo a un texto:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Al seleccionar texto en apps como Word o Chrome, podemos ver un efecto de fondo parecido.

![Color](../../RESOURCE/006_color16.png)

Si queremos ampliar el fondo, debemos combinarlo con `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Aquí hay una regla importante que debemos recordar:

En SwiftUI, los modificadores construyen la vista de arriba hacia abajo. Los modificadores escritos más abajo actúan sobre el resultado de los anteriores.

Por eso:

```swift
.padding()
.background()
```

significa que el fondo envolverá la vista después de que se haya añadido el margen interno.

Si invertimos el orden:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

El fondo no se ampliará, porque el fondo no envuelve el `padding` posterior.

## Ejemplo - tuerca de cuatro esquinas

Ahora vamos a crear una vista sencilla que se asemeje a una tuerca de cuatro esquinas.

![Color](../../RESOURCE/006_color8.png)

Primero creamos un cuadrado blanco de `50 × 50`:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Si queremos convertirlo en un círculo, podemos usar `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Cuando el radio de las esquinas es igual a la mitad del ancho y de la altura, la forma se convierte en un círculo.

Ahora añadimos un fondo azul:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

El nuevo `padding` amplía la zona exterior, y `background` dibuja el azul sobre esa zona exterior.

Con eso ya hemos creado el efecto de una tuerca de cuatro esquinas.

### Otra forma de pensarlo

Además de usar un color de fondo para crear la tuerca de cuatro esquinas, también podemos hacerlo con `ZStack`.

Antes aprendimos que `ZStack` puede superponer vistas. Una tuerca de cuatro esquinas también puede entenderse como la superposición de un círculo y un rectángulo.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` superpone las vistas en orden, y la vista añadida después aparece en la capa superior.

## Ejemplo - dos círculos superpuestos

Muchos iconos se construyen superponiendo formas simples, por ejemplo dos círculos parcialmente superpuestos.

![Color](../../RESOURCE/006_color14.png)

Primero, creamos dos círculos:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Como necesitamos que ambos círculos se muestren superpuestos, usamos `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

En este momento, los dos círculos del mismo tamaño se superponen por completo.

Necesitamos que se superpongan solo parcialmente, en lugar de cubrirse totalmente. Para eso podemos usar `offset`.

## Desplazamiento

`offset` solo cambia la posición de dibujo de una vista, pero no afecta al cálculo del layout de su vista padre.

Forma de uso:

```swift
.offset(x:y:)
```

`x` es el desplazamiento horizontal, e `y` el desplazamiento vertical.

Un valor positivo desplaza a la derecha o hacia abajo, y un valor negativo desplaza a la izquierda o hacia arriba.

Usamos `offset` para que los dos círculos se superpongan parcialmente:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

La posición del círculo rojo en el layout no ha cambiado, pero su posición de dibujo se ha desplazado `25` puntos hacia la izquierda. Por eso los dos círculos producen un efecto visual de superposición parcial.

## Transparencia

En SwiftUI, `opacity` se usa para establecer la transparencia de una vista.

Uso básico:

```swift
.opacity(0.5)
```

El parámetro de `opacity` va de `0.0` a `1.0`, donde:

- `0` significa completamente transparente
- `1` significa opaco

Podemos usar `opacity` para establecer la transparencia del círculo naranja:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Al establecer `opacity` del círculo naranja en `0.8`, su opacidad pasa a ser del `80%`. Cuando los dos círculos se superponen, la zona común produce un efecto de mezcla de colores.

## Desenfoque

En SwiftUI, se puede usar `blur` para crear un efecto de desenfoque:

```swift
.blur(radius:10)
```

`radius` define el radio del desenfoque. Cuanto mayor sea el valor, más evidente será el efecto.

Podemos añadir un efecto de desenfoque a los dos círculos:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Finalmente veremos dos círculos muy difuminados.

## Resumen

En esta lección nos centramos en modificadores visuales comunes de SwiftUI y aprendimos a controlar el color, la posición y los efectos visuales de una vista mediante modificadores.

A través de ejemplos concretos, pudimos ver el efecto real de distintos modificadores visuales dentro de la interfaz, y también entendimos el concepto de área segura.

Todos estos son modificadores muy básicos. Conviene practicarlos y usarlos con frecuencia, porque ayudan a controlar la interfaz con más claridad en el desarrollo real.

### Ejercicios después de clase

- Añadir efectos de transparencia y desenfoque a una imagen
- Configurar tres círculos superpuestos con distintas opacidades
- Crear una imagen de fondo que cubra toda la pantalla e ignore el área segura
- Usar `offset` para ajustar la posición de varias vistas

El objetivo de estos ejercicios no es memorizar la API, sino observar la relación entre los cambios visuales y el comportamiento del layout.
