# Tarjeta de curso

Esta lección es una lección de repaso por etapas. Completaremos una “tarjeta de curso”.

Con este ejercicio, podemos repasar `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` y otros contenidos aprendidos antes, y aprender cómo combinar varias vistas pequeñas en un módulo de vista completo.

Efecto de la tarjeta de curso:

![view](../../../Resource/026_view.png)

Esta tarjeta de curso contiene principalmente varias partes:

- Nivel del curso: `Principiante`
- Contenido del curso: `20+ lecciones`
- Título del curso: `Tutorial de SwiftUI para principiantes`
- Descripción del curso
- Botón: `Empezar a aprender`
- Fondo del curso: icono de Swift y fondo índigo

Podemos completar esta vista en `ContentView`.

## Área superior

Primero, crea el área superior de la tarjeta de curso.

![view](../../../Resource/026_view1.png)

El lado izquierdo del área superior muestra el nivel del curso, y el lado derecho muestra el contenido del curso.

Como estos dos contenidos se organizan horizontalmente, podemos usar `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Principiante")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ lecciones")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Aquí dividimos el área superior en una propiedad calculada:

```swift
var topView: some View
```

La ventaja de hacerlo así es que `body` queda más claro.

El área superior usa principalmente estos contenidos:

- `HStack`: organiza dos textos horizontalmente.
- `Text`: muestra contenido de texto.
- `Spacer()`: empuja el texto izquierdo hacia la izquierda y el texto derecho hacia la derecha.
- `.font(.footnote)`: establece un estilo de texto más pequeño.
- `.fontWeight(.bold)`: establece el texto en negrita.
- `.foregroundStyle(Color.white)`: establece el color frontal en blanco.
- `.padding(.vertical, 10)`: establece el relleno vertical.
- `.padding(.horizontal, 16)`: establece el relleno horizontal.
- `.background(Color.white.opacity(0.15))`: establece un fondo blanco translúcido.
- `.cornerRadius(20)`: establece el radio de las esquinas.

Aquí, `Principiante` usa `.padding()` en dos direcciones:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Esto da espacio al texto tanto en vertical como en horizontal, haciendo que parezca más una etiqueta.

`Color.white.opacity(0.15)` representa blanco con una opacidad del `15%`, es decir, un blanco muy suave.

### Añadir el fondo de la tarjeta

Antes creamos `topView`, pero crear una vista no hace que se muestre automáticamente.

En SwiftUI, el contenido que realmente se muestra en la interfaz debe escribirse dentro de `body`.

Por eso, primero podemos colocar `topView` dentro de `body` para mostrarlo:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

En este momento verás que el área superior ya se ha mostrado:

![view](../../../Resource/026_view2.png)

Sin embargo, como el texto de `topView` es blanco y el fondo predeterminado también es claro, en modo claro puede no verse con facilidad.

Por lo tanto, podemos añadir un `VStack` por fuera y luego configurar el relleno, el color de fondo y las esquinas redondeadas para toda el área:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Efecto mostrado:

![view](../../../Resource/026_view3.png)

Aquí, el `VStack` actualmente solo contiene un `topView`, por lo que puede parecer que no es necesario.

Pero más adelante seguiremos añadiendo el título del curso, la descripción del curso y el área del botón. Todos ellos son contenidos organizados verticalmente, así que usar `VStack` por adelantado facilita seguir combinando vistas después.

Aquí hay dos `.padding()`, y sus funciones son diferentes.

El primer `.padding(20)` está escrito antes de `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Controla el relleno interno de la tarjeta, es decir, la distancia entre el contenido y el borde del fondo.

El segundo `.padding(30)` está escrito después de `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Controla el relleno externo de la tarjeta, es decir, la distancia entre toda la tarjeta y el borde de la pantalla.

![view](../../../Resource/026_view4.png)

Por eso, aunque ambos son `.padding()`, al escribirlos en posiciones distintas, el efecto también será diferente.

## Área de contenido

A continuación, crea el área de contenido de la tarjeta de curso.

Efecto mostrado:

![view](../../../Resource/026_view5.png)

El área de contenido contiene el título del curso y la descripción del curso. Están organizados verticalmente, así que usamos `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutorial de SwiftUI para principiantes")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Empieza desde cero con SwiftUI y aprende sistemáticamente el desarrollo declarativo de interfaces de Apple. Con explicaciones claras y ejemplos prácticos, dominarás gradualmente el diseño, la interacción y la gestión de estado para crear interfaces de app bonitas y útiles.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Efecto mostrado:

![view](../../../Resource/026_view6.png)

En este `VStack` se usan dos parámetros:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` significa que las vistas dentro de `VStack` se alinean al borde inicial.

`spacing: 10` significa que las vistas dentro de `VStack` mantienen una separación de `10 pt` entre sí.

Por eso, el título y la descripción del curso empezarán desde el lado izquierdo, y entre ellos se mantendrá cierta distancia.

La descripción del curso es relativamente larga. Si se muestra completa, la tarjeta se volverá muy alta, así que aquí usamos `.lineLimit()` para limitar el número de líneas mostradas:

```swift
.lineLimit(3)
```

Esto significa que se muestran como máximo `3` líneas. Cuando el contenido supera ese límite, la parte sobrante se omitirá.

### Alinear la vista a la izquierda

Aquí todavía hay un punto que conviene tener en cuenta.

`VStack(alignment: .leading)` solo puede controlar la alineación de las vistas dentro de `VStack`. No controla directamente la posición del propio `VStack` dentro del contenedor externo.

Por ejemplo, si la descripción del curso es relativamente corta:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutorial de SwiftUI para principiantes")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Solo algo de contenido.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Efecto mostrado:

![view](../../../Resource/026_view7.png)

Se puede ver que, aunque el título y la descripción del curso están alineados a la izquierda dentro de `VStack`, todo el `VStack` no está pegado al lado izquierdo de la tarjeta.

Esto se debe a que, cuando el contenido es corto, el ancho de `VStack` también se vuelve relativamente estrecho. Al distribuir el contenido, el contenedor externo puede colocar este `VStack` más estrecho en el centro.

Puedes entenderlo así: `VStack(alignment: .leading)` se encarga de la alineación interna a la izquierda.
Pero no se encarga de empujar toda el área de contenido hasta el extremo izquierdo.

Si queremos que toda el área de contenido se alinee realmente a la izquierda, podemos envolverla con otro `HStack` y añadir `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutorial de SwiftUI para principiantes")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Solo algo de contenido.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Efecto mostrado:

![view](../../../Resource/026_view8.png)

Aquí, `HStack` es un diseño horizontal.

`Spacer()` ocupará el espacio restante de la derecha, empujando así el `VStack` de la izquierda hasta el extremo izquierdo.

Por lo tanto, `HStack + Spacer()` puede usarse para controlar la posición de toda el área de contenido.

En la tarjeta de curso real, la descripción del curso es relativamente larga y normalmente ocupa más ancho, así que este problema no siempre será evidente. Pero entender esta diferencia es importante, porque más adelante, al crear diseños con textos cortos, se encontrarán situaciones similares con frecuencia.

### Controlar la distancia entre vistas internas

Antes escribimos `spacing: 10` en `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` se usa para controlar la distancia entre las vistas internas.

Si no se configura `spacing`, `VStack` también tendrá una separación predeterminada, pero esa separación predeterminada no necesariamente coincide con el efecto que queremos.

Aquí, si el título y la descripción del curso quedan demasiado cerca, el diseño se verá apretado, así que usamos:

```swift
spacing: 10
```

Esto deja un poco de espacio entre ellos.

Efecto mostrado:

![view](../../../Resource/026_view9.png)

Del mismo modo, el área superior y el área de contenido también están organizadas verticalmente, así que también se puede usar `spacing` para controlar la distancia entre ellas.

Ahora, coloca `topView` y `contentView` dentro de `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efecto mostrado:

![view](../../../Resource/026_view10.png)

Aquí, `VStack(spacing: 20)` controla la distancia entre `topView` y `contentView`.

Es decir:

```swift
VStack(alignment: .leading, spacing: 10)
```

Controla la distancia entre el título del curso y la descripción del curso.

```swift
VStack(spacing: 20)
```

Controla la distancia entre el área superior y el área de contenido.

Ambos son `spacing`, pero actúan sobre diferentes `VStack`, así que el rango afectado también es distinto.

Así, la vista del área de contenido queda terminada.

## Área del botón

A continuación, crea el área del botón inferior.

Efecto mostrado:

![view](../../../Resource/026_view11.png)

El área del botón se compone principalmente de un icono de reproducción y una parte de texto.

Podemos usar `Image` para mostrar el icono de reproducción y `Text` para mostrar el texto del botón.

Aquí primero creamos la apariencia de un botón:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("clic en el botón")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Empezar a aprender")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Efecto mostrado:

![view](../../../Resource/026_view12.png)

Aquí se usan dos `HStack`:

El `HStack` interno se usa para organizar horizontalmente el icono y el texto:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Empezar a aprender")
}
```

El `HStack` externo, junto con `Spacer()`, se usa para hacer que la apariencia del botón se alinee a la izquierda:

```swift
HStack {
    ...
    Spacer()
}
```

Al pulsar el botón, la consola mostrará `clic en el botón`.

## Tarjeta básica completada

Ahora, combina el área superior, el área de contenido y el área del botón:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efecto mostrado:

![view](../../../Resource/026_view13.png)

Hasta aquí, ya se ha completado una tarjeta de curso básica.

## Fondo con icono de Swift

Por último, añadimos a la tarjeta un fondo con un icono de Swift semitransparente.

![view](../../../Resource/026_view.png)

Antes usamos `Color.indigo` como color de fondo. En realidad, además de añadir un color, `.background()` también puede añadir una vista completa.

Por eso, primero podemos crear una vista de fondo dedicada:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

En esta vista de fondo usamos `VStack`, `HStack` y `Spacer()` para empujar el icono de Swift a la esquina inferior derecha.

Como el icono de Swift solo se usa como fondo decorativo, aquí usamos blanco semitransparente:

```swift
Color.white.opacity(0.15)
```

De esta forma, el icono no será demasiado llamativo y tampoco afectará al contenido de texto que está delante.

A continuación, añade `backgroundView` a la tarjeta:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Efecto final:

![view](../../../Resource/026_view14.png)

Aquí se usan dos `.background()` de forma consecutiva:

```swift
.background(backgroundView)
.background(Color.indigo)
```

El primer `.background()` se usa para añadir el fondo con el icono de Swift.
El segundo `.background()` se usa para añadir el fondo índigo.

Así, el icono de Swift se mostrará sobre el fondo índigo y aparecerá como parte del fondo de la tarjeta.

A partir de aquí podemos ver que `.background()` no solo puede añadir colores, sino también vistas personalizadas. También se pueden combinar varios `.background()` para lograr efectos de fondo más ricos.

Hasta aquí, una tarjeta de curso completa queda terminada.

## Resumen

En esta lección, mediante una tarjeta de curso, repasamos formas básicas de diseño comunes en SwiftUI.

Usamos `Text` para mostrar texto, `Image` para mostrar un icono del sistema, y `VStack`, `HStack` y `Spacer()` para controlar la disposición de las vistas.

Aprendimos `.lineLimit()`, que puede limitar el número máximo de líneas que muestra un texto. Cuando el contenido supera el límite, la parte sobrante se omite.

Al mismo tiempo, también repasamos modificadores comunes como `.padding()`, `.background()`, `.cornerRadius()` y `.foregroundStyle()`.

Después de completar esta lección, ya podemos combinar varias vistas pequeñas en un módulo de tarjeta completo.

Esta también es una forma de pensar muy común en el desarrollo con SwiftUI: primero dividir las vistas en partes pequeñas y luego combinarlas en una interfaz completa.

## Código completo

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Principiante")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ lecciones")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutorial de SwiftUI para principiantes")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Empieza desde cero con SwiftUI y aprende sistemáticamente el desarrollo declarativo de interfaces de Apple. Con explicaciones claras y ejemplos prácticos, dominarás gradualmente el diseño, la interacción y la gestión de estado para crear interfaces de app bonitas y útiles.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("clic en el botón")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Empezar a aprender")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
