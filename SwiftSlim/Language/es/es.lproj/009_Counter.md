# Contador

En las dos lecciones anteriores aprendimos variables, constantes, botones y métodos.

En esta lección combinaremos esos conocimientos para crear una aplicación sencilla de contador.

En este ejemplo aprenderemos cómo guardar y modificar variables, y cómo usar `@State` para gestionarlas.

## Implementar un contador

Los contadores suelen utilizarse para registrar cantidades que necesitan acumularse continuamente, como el número de saltos de cuerda o vueltas corriendo.

A continuación vamos a implementar un contador muy simple: mostrar un número y un botón, y hacer que el número aumente al pulsarlo.

![Num](../../RESOURCE/009_num.png)

### Mostrar el número

Primero usamos `Text` para mostrar el número.

```swift
Text("0")
```

Pero si el número necesita cambiar, no podemos escribir `"0"` de forma fija. Debemos usar una variable para guardarlo.

```swift
var num = 0
```

Y luego mostrar la variable dentro de `Text`:

```swift
Text("\(num)")
```

Aquí usamos interpolación de cadenas `\()` para convertir el número en una cadena y mostrarlo.

### Aumentar el número con un botón

A continuación, añadimos un botón.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Cuando se pulse el botón, queremos que el número aumente.

Por eso podemos modificar la variable dentro del botón:

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Este código significa: al pulsar el botón, se calcula `num + 1` y el resultado se asigna a `num`.

### Una forma más concisa

Swift ofrece una forma más breve de escribirlo:

```swift
num += 1
```

Equivale a:

```swift
num = num + 1
```

Esta forma se llama “operador de asignación compuesta”.

Los operadores de asignación compuesta más comunes en Swift son:

```text
+=   suma y asignación
-=   resta y asignación
*=   multiplicación y asignación
/=   división y asignación
%=   resto y asignación
```

Por ejemplo:

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Código completo

Ahora ya podemos escribir un contador simple:

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Sin embargo, este código todavía no puede funcionar correctamente.

### Aparece un error

Xcode mostrará:

```text
Cannot assign to property: 'self' is immutable
```

Eso significa que no se puede modificar la propiedad porque la vista es inmutable.

¿Por qué ocurre esto?

## Cómo funciona SwiftUI

En SwiftUI: **la interfaz está impulsada por los datos**. Esto significa que cuando los datos cambian, la interfaz se actualiza automáticamente.

Pero hay algo importante: SwiftUI solo supervisa los cambios y actualiza la vista cuando cambia un estado, como `@State` o `@Binding`.

Si usamos una variable normal, SwiftUI solo leerá su valor una vez al crear la vista. Después, aunque la variable cambie, la interfaz no se actualizará.

Por ejemplo:

```swift
var num = 0   // 0
num = 1   // 0
```

En el ejemplo anterior, `num` es una variable normal. Aunque su valor cambie, SwiftUI no actualizará la vista, así que la interfaz seguirá mostrando el `0` inicial.

![Num](../../RESOURCE/009_state.png)

Por eso, solo cuando los datos están marcados como estado, por ejemplo mediante `@State`, `@Binding` u otros property wrappers, SwiftUI supervisará sus cambios automáticamente y actualizará la vista.

## Property wrapper @State

En SwiftUI, si necesitamos modificar una variable y actualizar la vista, debemos usar `@State`.

```swift
@State var num = 0
```

`@State` hace que SwiftUI observe esa variable.

Cuando la variable cambia, SwiftUI recalcula la vista y la actualiza.

Código completo:

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
            Text("\(num)")
            Button("+") {
                num += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
```

Ahora, cuando se pulse el botón:

```swift
num += 1
```

SwiftUI detectará que `num` ha cambiado y actualizará la vista automáticamente.

![Num](../../RESOURCE/009_state1.png)

## Reglas de uso de @State

En el desarrollo real, `@State` suele seguir dos reglas.

### 1. @State normalmente usa private

Las variables `@State` normalmente solo se usan dentro del tipo actual, por ejemplo dentro de la propia estructura `View`, así que normalmente se escriben así:

```swift
@State private var num = 0
```

De este modo evitamos que otras vistas accedan o modifiquen directamente esta variable.

Todavía no hemos estudiado `private`, pero por ahora puedes entenderlo así:

**El contenido marcado con `private` solo puede usarse dentro de la vista actual; las vistas externas no pueden usarlo.**

### 2. @State solo se usa para el estado de la vista actual

`@State` es adecuado para los datos que administra la propia `View`.

Por ejemplo, el contenido de un campo de entrada o el estado de un interruptor:

```swift
@State private var isOn = false
@State private var text = ""
```

Si los datos necesitan compartirse entre varias vistas, entonces hay que usar otros tipos de estado, como `@Binding` o `@Observable`.

Aprenderemos esos contenidos en lecciones posteriores.

### Botón para reducir

Además de aumentar, el contador también puede disminuir.

Podemos añadir un botón `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Después usamos `HStack` para ordenar los botones horizontalmente:

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Efecto:

![Num](../../RESOURCE/009_num1.png)

Al pulsar el botón `+`, el número aumenta en `1`; al pulsar el botón `-`, disminuye en `1`.

### Botón de reinicio

También podemos añadir un botón de reinicio para que el número vuelva a `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Cuando se pulsa el botón de reinicio, `num` se asigna a `0`.

Efecto:

![Num](../../RESOURCE/009_num2.png)

Al pulsar el botón `0`, el número se convierte en `0`.

### Botones personalizados

Actualmente nuestros botones solo pueden mostrar texto:

```swift
Button("+") {

}
```

Un botón escrito de esta forma solo puede mostrar contenido textual, como `+` o `-`.

En el desarrollo real, normalmente queremos que la apariencia del botón sea más rica, por ejemplo usando iconos u otras vistas.

SwiftUI permite personalizar el contenido que muestra un botón. En ese caso, podemos usar otra forma de escribirlo:

```swift
Button(action: {

}, label: {

})
```

En esta sintaxis, `action` indica el código que se ejecuta al pulsar el botón, y `label` es la vista que se mostrará dentro del botón.

Por ejemplo, podemos hacer que el botón muestre un icono de `SF Symbols`:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

De este modo, el botón ya no mostrará texto, sino un icono.

### Optimizar la interfaz del contador

Para que la interfaz del contador sea más clara, también podemos ajustar el estilo de visualización del número. Por ejemplo, agrandar el número:

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

A continuación, cambiamos también el contenido mostrado en los botones por iconos y aumentamos un poco su tamaño:

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

Del mismo modo, también podemos convertir el botón de reducir y el botón de reinicio en iconos:

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Ahora los botones muestran iconos de `SF Symbols`, y la interfaz se vuelve más intuitiva.

![Num](../../RESOURCE/009_num3.png)

## Resumen

En esta lección, al implementar un contador simple, practicamos de forma conjunta el uso de variables, `Text` y `Button`. Usamos una variable para guardar el número y controlamos su aumento o disminución con botones, al mismo tiempo que aprendimos operadores de asignación compuesta como `num += 1` y `num -= 1`.

Durante la implementación también entendimos mejor cómo funciona SwiftUI: la interfaz está impulsada por los datos. Solo cuando los datos cambian, la interfaz se actualiza. Por eso necesitamos usar `@State` para guardar estados modificables; cuando una variable `@State` cambia, SwiftUI actualiza la vista automáticamente.

Por último, hicimos una optimización sencilla de la interfaz, ajustando el estilo de fuente de `Text` y usando `Button(action:label:)` para personalizar el contenido del botón, de modo que pudiera mostrar iconos y hacer que la interfaz del contador fuera más clara y atractiva.

Ahora ya hemos entrado en contacto con el modo básico de uso de las vistas en SwiftUI. En SwiftUI, la mayor parte de la interfaz está impulsada por variables. Cuando una variable cambia, SwiftUI actualiza la vista automáticamente. Por eso, al desarrollar aplicaciones con SwiftUI, normalmente primero debemos diseñar bien qué datos hay que guardar y, a partir de ellos, construir la interfaz y la lógica de interacción.

## Código completo

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
