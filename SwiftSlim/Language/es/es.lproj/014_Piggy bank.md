# Hucha

En esta lección desarrollaremos un proyecto sencillo de “hucha”. Tiene una funcionalidad simple, pero incluye una lógica completa de interacción, por lo que es muy adecuado para principiantes.

A través de este proyecto aprenderemos `TextField` (campo de entrada), `border` y el concepto de binding de datos (`$`).

El objetivo final es implementar un proyecto de “hucha” en el que el usuario pueda introducir una cantidad, pulsar un botón para guardarla y acumular el importe total.

Resultado final:

![Piggy Bank](../../RESOURCE/014_view.png)

## Mostrar el importe total

Primero, necesitamos mostrar en la vista la cantidad total de la “hucha”.

Dentro de `ContentView`, declaramos una variable para guardar el importe total:

```swift
@State private var amount = 0
```

Después usamos `Text` para mostrar esa cantidad:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Aquí usamos `.font` y `.fontWeight` para configurar el tamaño y el grosor de la fuente.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
```

Cuando `amount` cambia, el total mostrado por `Text` también se actualiza automáticamente.

## Introducir una cantidad

Además de mostrar el total, la “hucha” también necesita permitir al usuario introducir la cantidad que quiere guardar o sacar. Para eso necesitamos el control `TextField` de SwiftUI.

### TextField

`TextField` es el control de SwiftUI que se utiliza para introducir contenido, normalmente en una sola línea.

`TextField` ofrece principalmente dos formatos de binding:

**1. Binding a tipo `String`**

```swift
TextField("Placeholder", text: $text)
```

Adecuado para introducir texto como nombres o títulos.

**2. Binding a tipo numérico (`Int`/`Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Adecuado para introducir números como edad, salario o cantidad.

`format: .number` significa que este campo interpretará y mostrará el contenido en formato numérico.

#### Texto de marcador de posición

El primer parámetro de `TextField` es el placeholder, que sirve para indicar al usuario qué debe introducir:

```swift
TextField("input your name", text: $text)
```

Cuando el campo está vacío, se mostrará un texto gris como sugerencia.

![textfield](../../RESOURCE/014_textfield.png)

#### Binding de datos

`TextField` no guarda por sí mismo el contenido introducido; necesita una variable enlazada para gestionar los datos.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Lo que escribe el usuario se guarda directamente en la variable `text`. `TextField` solo se encarga de la parte visual de la entrada.

`$` significa binding:

```swift
$text
```

Esto no es una variable normal, sino un valor de tipo `Binding`.

Su función es establecer la conexión entre la vista y los datos:

Cuando el usuario escribe dentro de `TextField`, `text` se actualiza automáticamente; y cuando `text` cambia, `TextField` también se sincroniza.

Por ejemplo:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text("text:\(text)")
            TextField("input your name", text: $text)
                .frame(width: 150)
        }
    }
}
```

Cuando escribes en `TextField`, el `Text` de arriba mostrará el contenido en tiempo real.

![textField](../../RESOURCE/014_textfield1.png)

### Binding a tipo numérico

Cuando necesitamos introducir números, tenemos que enlazar una variable del tipo correspondiente:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Cuando el usuario introduce una cantidad, `TextField` interpreta automáticamente el contenido y actualiza el valor de `number`.

## Añadir el campo de entrada

Después de entender el uso básico de `TextField`, ahora lo aplicamos al proyecto de la “hucha”.

La “hucha” necesita introducir una “cantidad”, así que usamos el modo de binding numérico (`Int`/`Double`) y añadimos una nueva variable `number` para guardar la cantidad introducida por el usuario:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
        }
    }
}
```

Ahora `TextField` mostrará por defecto el valor de `number` (que inicialmente es `0`).

Cuando se borra el contenido, se mostrará el placeholder `"Amount"`.

Esto vuelve a demostrar que `TextField` muestra el valor de la variable enlazada, y no guarda por sí solo el contenido.

### Problema de tamaño del campo de entrada

En la vista actual veremos que `TextField` no tiene borde, solo muestra un `0`, y el contenido parece alineado a la izquierda.

El efecto es el siguiente:

![textfield](../../RESOURCE/014_textfield2.png)

Esto ocurre porque, por defecto, `TextField` ocupa todo el ancho de su vista padre.

Podemos comprobarlo añadiendo un color de fondo:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

El efecto será:

![textfield](../../RESOURCE/014_textfield3.png)

Se puede ver que `TextField` en realidad ocupa toda la línea.

### Establecer un ancho fijo

Si queremos que el campo de entrada sea más compacto, podemos limitar su ancho con `frame`:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

El efecto es:

![textfield](../../RESOURCE/014_textfield4.png)

### Añadir borde y margen interno

Como `TextField` no tiene borde por defecto, podemos añadirle estilo manualmente:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Ahora el campo se verá más como un “campo de entrada estándar”.

![textfield](../../RESOURCE/014_textfield5.png)

## Borde

En SwiftUI, `border` se usa para añadir un borde a una vista.

Uso básico:

```swift
border(Color.black, width: 1)
```

Aquí `Color.black` representa el color del borde, y `width` el grosor.

En `TextField`, lo usamos así:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Esto significa que añadimos al campo de entrada un borde negro de `1 pt`.

También puedes probar otros colores, como `Color.blue` o `Color.green`, o hacer el borde más grueso con `width: 2`.

## Botón para guardar dinero

Ahora tenemos una variable `amount` para mostrar el total, un `TextField` para introducir una cantidad, y la variable `number` enlazada con ese campo.

El código actual es:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
        }
    }
}
```

### Añadir un botón

A continuación, necesitamos un botón que dispare la operación de guardar dinero.

```swift
Button("Save") {
    
}
```

### Implementar la lógica de guardar

Queremos que el usuario introduzca una cantidad y, al pulsar el botón, esa cantidad se sume automáticamente al total.

```swift
Button("Save") {
    amount += number
}
```

Aquí usamos un operador de asignación compuesta para sumar la cantidad introducida `number` al total `amount`.

### Reiniciar la cantidad introducida

Ahora aparece un problema: cada vez que se pulsa el botón, la cantidad del campo de entrada no se limpia.

Si el usuario introduce `10` y pulsa guardar, el campo seguirá mostrando `10`, lo que afecta a la siguiente operación.

Esto ocurre porque `TextField` está enlazado a `number`. Al pulsar el botón, solo cambiamos `amount`, pero `number` no cambia, así que el valor anterior sigue mostrándose.

Necesitamos añadir una lógica de limpieza: después de sumar la cantidad al total, reiniciar el valor introducido:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Ahora, cuando el usuario introduce una cantidad y pulsa el botón, el valor se suma al total y `number` vuelve a `0`, listo para la siguiente entrada.

Con esto ya hemos implementado toda la lógica básica de guardado de la “hucha”.

## Optimizar la vista

Después de completar la funcionalidad, podemos hacer una pequeña mejora visual, añadiendo una imagen de fondo y estilo al botón.

Añadir estilo al botón:

```swift
.buttonStyle(.borderedProminent)
```

Añadir una imagen de fondo:

```swift
.background {
    Image("1")
}
```

Con esto ya hemos terminado el desarrollo completo de la “hucha”.

## Código completo

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Resultado:

![Piggy Bank](../../RESOURCE/014_view.png)

Ahora podemos intentar guardar `100` o más dinero para comprobar si la lógica de la “hucha” funciona correctamente.

También podemos ejecutar la “hucha” en el simulador o en un dispositivo físico y experimentar con la app que acabamos de desarrollar.

### Salida de depuración

Para comprobar que la lógica es correcta, también podemos añadir lógica de depuración dentro del botón y verificar si la cantidad introducida se procesa correctamente:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Cada vez que guardemos dinero y pulsemos el botón, podremos ver la salida correspondiente en la `Console` para comprobar si existe algún problema lógico.

```text
---Saving---
amount:11
number:0
```
