# Vista de inicio de sesión

En esta lección, aprenderemos un escenario muy práctico: la vista de inicio de sesión.

Ya sea un sitio web o una app, durante el uso muchas veces es necesario que el usuario inicie sesión en su cuenta e introduzca una contraseña.

Por ejemplo, la página de inicio de sesión de GitHub:

![WordPress](../../Resource/019_github.png)

En esta lección, crearemos una vista de inicio de sesión similar para que el usuario introduzca manualmente la cuenta y la contraseña, y comprobaremos si hay algún problema con el contenido introducido.

## Diseño superior

Escribiremos el código de la vista de inicio de sesión en el archivo `ContentView`.

Primero, escribamos el área de identificación en la parte superior de la vista de inicio de sesión. Puedes preparar antes una imagen de icono adecuada y colocarla en la carpeta `Assets`.

![icon](../../Resource/019_icon1.png)

Después, usa `Image` y modificadores para mostrar la imagen:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Estos modificadores significan:

- `resizable()`: permite cambiar el tamaño de la imagen.
- `scaledToFit()`: escala la imagen manteniendo su proporción original.
- `frame(width: 100)`: establece el ancho de visualización de la imagen en `100`.

A continuación, usa `Text` y modificadores para mostrar el título de inicio de sesión:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Luego, usa `VStack` para organizar la imagen y el texto de forma vertical:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Resultado:

![view](../../Resource/019_view.png)

Hasta aquí, hemos completado el área del título en la parte superior de la vista de inicio de sesión.

### Optimizar el diseño

Ahora mismo, la imagen y el título se encuentran por defecto en la zona central del diseño general.

Si queremos que se parezcan más a una "identificación de inicio de sesión en la parte superior de la página", podemos usar `Spacer()` para expandir el espacio restante y hacer que el contenido se muestre más cerca de la parte superior.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Resultado:

![view](../../Resource/019_view1.png)

Pero ahora `Image` y `Text` han quedado demasiado cerca de la parte superior de la pantalla, y se ve un poco apretado.

En este momento, podemos usar `padding` para añadir espacio superior a todo el `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Resultado:

![view](../../Resource/019_view2.png)

De esta manera, el área del título en la parte superior de la página se ve más adecuada.

## Nombre de usuario y contraseña

Una página de inicio de sesión normalmente requiere que el usuario introduzca un nombre de usuario y una contraseña.

En SwiftUI, podemos usar `TextField` para recibir el contenido que introduce el usuario.

Pero hay que tener en cuenta lo siguiente: `TextField` no guarda por sí mismo los datos introducidos a largo plazo, solo es un control de entrada. Quien realmente guarda ese contenido introducido son las variables que vinculamos a él.

Por lo tanto, primero necesitamos crear dos variables `@State` para guardar el nombre de usuario y la contraseña:

```swift
@State private var user = ""
@State private var password = ""
```

Cuando cambia el valor de una variable `@State`, SwiftUI actualiza automáticamente las vistas relacionadas.

A continuación, usa `TextField` para vincular estas dos variables:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Aquí, `$user` y `$password` representan "binding".

Es decir, cuando el usuario escribe texto en el cuadro de entrada, la variable cambia al mismo tiempo; y cuando la variable cambia, el contenido mostrado en el cuadro de entrada también cambia de forma sincronizada.

Esta relación en la que "la vista y los datos se sincronizan mutuamente" es precisamente el binding.

Ten en cuenta que aquí se debe usar la escritura con `$`:

```swift
$user
```

Porque `TextField` no necesita una cadena normal, sino un valor binding que "pueda modificar datos en ambas direcciones".

### Mostrar los cuadros de entrada

Pongámoslos dentro de `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Resultado de visualización:

![view](../../Resource/019_view3.png)

Como `user` y `password` ahora son cadenas vacías por defecto:

```swift
""
```

por eso el cuadro de entrada mostrará primero un texto de marcador de posición, por ejemplo:

```swift
input user
```

Este texto solo le indica al usuario "qué se debe introducir aquí", y no es el contenido real introducido.

### Optimizar los cuadros de entrada

Ahora los cuadros de entrada ya pueden usarse, pero el estilo por defecto es relativamente simple.

Para que la interfaz quede más clara, podemos añadir un título delante del cuadro de entrada y hacer una pequeña optimización de estilo al propio cuadro.

Por ejemplo, primero añade un título:

```swift
Text("Username")
    .fontWeight(.bold)
```

Luego, usa `HStack` para colocar el título y el cuadro de entrada en la misma línea:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Aquí usamos `HStack` porque queremos "mostrar el título a la izquierda y el cuadro de entrada a la derecha".

Hay que tener en cuenta que `TextField` ocupará por defecto el espacio disponible restante.

![color](../../Resource/019_view6.png)

Para que el tamaño de los dos cuadros de entrada sea más uniforme, podemos usar `frame(width:)` para establecer un ancho, de modo que los cuadros de entrada se vean más ordenados.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Después, añade también un borde para que el cuadro de entrada sea más visible:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ahora, añadamos tanto el nombre de usuario como la contraseña a la vista `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Resultado de visualización:

![view](../../Resource/019_view4.png)

Hasta este punto, el usuario ya puede introducir el nombre de usuario y la contraseña.

## Botón de inicio de sesión

A continuación, añadiremos un botón de inicio de sesión debajo de los cuadros de entrada.

```swift
Button("Sign in") {

}
```

Después, usa `buttonStyle` para dar al botón un estilo del sistema más visible:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Resultado de visualización:

![view](../../Resource/019_view5.png)

Para confirmar que el botón realmente responde al toque, primero podemos escribir un `print` dentro del botón para probar:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Cuando se toque el botón, la consola mostrará:

```swift
click Sign in
```

Esto demuestra que el botón ya ha respondido correctamente a la acción de toque.

## Lógica de inicio de sesión

Ahora añadiremos al botón de inicio de sesión la lógica de validación más básica: **comprobar si el usuario ha introducido nombre de usuario y contraseña**.

Queremos lograr las siguientes situaciones:

- Si el usuario no introduce nada, mostrar `Empty`
- Si el usuario solo introduce uno de los dos, indicar cuál falta
- Si tanto el nombre de usuario como la contraseña están introducidos, mostrar `Success`

### No se ha introducido ninguna información

Como `user` y `password` son cadenas vacías por defecto:

```swift
@State private var user = ""
@State private var password = ""
```

seguirán vacías cuando el usuario no introduzca nada.

En Swift, tipos como `String` pueden usar `isEmpty` para determinar si el contenido está vacío.

### Propiedad isEmpty

`isEmpty` suele usarse para comprobar si cadenas, arreglos y otros contenidos están vacíos.

Por ejemplo:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Si el contenido está vacío, `isEmpty` devuelve `true`; si el contenido no está vacío, devuelve `false`.

Por lo tanto, podemos usarlo para determinar si el nombre de usuario y la contraseña tienen contenido introducido.

### Usar isEmpty para comprobar variables

Si el usuario no ha introducido ninguna información, entonces:

```swift
user.isEmpty // true
password.isEmpty    // true
```

En ese momento, podemos escribir la condición así:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Este código significa: si `user` está vacío, y `password` también está vacío, entonces mostrar:

```swift
Empty
```

Aquí, `&&` es un operador lógico y significa "y".

Es decir, toda la condición solo es verdadera cuando la condición de la izquierda es verdadera y la de la derecha también lo es.

Por lo tanto, este código solo se ejecutará cuando tanto el nombre de usuario como la contraseña estén vacíos.

## El usuario solo ha completado una parte

A continuación, consideremos otra situación: el usuario solo ha completado el nombre de usuario, o solo la contraseña.

Por ejemplo:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

En este momento, el nombre de usuario no está vacío, pero la contraseña sí.

Podemos seguir usando `isEmpty` para comprobarlo:

### Situación en la que el usuario completó la cuenta o la contraseña

Si el usuario solo completó el nombre de usuario o la contraseña, debemos dar el aviso correspondiente sobre lo que falta.

Por ejemplo, si el usuario solo completó el nombre de usuario:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

La lógica de este código es: si el nombre de usuario está vacío, pide que se introduzca el nombre de usuario. De lo contrario, comprueba si la contraseña está vacía, y si está vacía, pide que se introduzca la contraseña.

### El usuario completó toda la información

Si tanto el nombre de usuario como la contraseña ya se han introducido, entonces `isEmpty` devolverá `false` para ambos.

En ese momento, podemos escribirlo así:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Aquí, `!` significa "negación".

Por ejemplo:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Es decir, `user.isEmpty` se usa para determinar "si el nombre de usuario está vacío", mientras que `!user.isEmpty` se usa para determinar "si el nombre de usuario no está vacío".

La contraseña sigue la misma lógica.

Así que el significado de este código es: el nombre de usuario no está vacío y la contraseña tampoco está vacía.

Cuando ambas condiciones son verdaderas, el resultado será:

```swift
Success
```

## Lógica de validación completa

Ahora, combinemos estas tres situaciones y escribámoslas dentro de `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

El orden de ejecución de este código puede entenderse así:

Primero, comprobamos:

```swift
if user.isEmpty && password.isEmpty
```

Si tanto el nombre de usuario como la contraseña están vacíos, mostrará directamente `Empty`.

Si no están ambos vacíos, continuamos comprobando esta línea:

```swift
else if user.isEmpty || password.isEmpty
```

Aquí, `||` significa "o".

Es decir, siempre que una de las condiciones sea verdadera, toda la condición será verdadera.

Por lo tanto, mientras el nombre de usuario esté vacío, o la contraseña esté vacía, se ejecutará el bloque de código de `else if`.

Después de entrar en el bloque de código, comprobamos más a fondo cuál de los cuadros de entrada no fue completado:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Si ninguna de las dos condiciones anteriores es verdadera, eso significa que el nombre de usuario no está vacío y la contraseña tampoco.

Entonces el programa entra en el último `else`:

```swift
print("Success")
```

De esta manera, completamos la lógica de validación más básica para la entrada de inicio de sesión.

## Validación de nombre de usuario y contraseña

La lógica anterior solo comprueba "si se introdujo contenido o no".

Pero en una app real, simplemente introducir contenido no es suficiente. Normalmente, también necesitamos enviar el nombre de usuario y la contraseña al servidor para verificarlos.

Si el servidor confirma que el nombre de usuario existe y la contraseña es correcta, permitirá el inicio de sesión; de lo contrario, indicará que el inicio de sesión ha fallado.

Para practicar este proceso, primero podemos establecer una cuenta y una contraseña temporales en el código para simular "información de inicio de sesión correcta":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Cuando tanto el nombre de usuario como la contraseña no estén vacíos, entonces comparamos si son correctos:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Aquí, `==` significa "si es igual".

Por ejemplo:

```swift
user == userID
```

Significa si el nombre de usuario introducido por el usuario es exactamente igual al nombre de usuario correcto que hemos establecido. La comprobación de la contraseña sigue la misma lógica.

Por lo tanto, cuando el nombre de usuario y la contraseña introducidos sean iguales a los valores establecidos, mostrará `Success`; mientras uno de ellos no sea igual, mostrará `Input error`.

De esta manera, completamos una simple "verificación simulada de inicio de sesión".

Aunque todavía no es una función real de inicio de sesión conectada a un servidor, ya es suficiente para ayudarnos a entender: **después de tocar el botón, se puede ejecutar código diferente según distintas condiciones**.

## Resumen

En esta lección, completamos una vista básica de inicio de sesión y nos centramos en aprender "la lógica para juzgar el contenido introducido según condiciones".

El contenido central de esta lección es: usar `isEmpty` para determinar si una cadena está vacía, y usar sentencias `if` junto con operadores lógicos para manejar distintas situaciones.

Entre ellos, hay dos operadores lógicos muy importantes:

- `&&`: significa "y", deben cumplirse ambas condiciones
- `||`: significa "o", solo hace falta que se cumpla una condición

Cuando estas condiciones finalmente producen `true` o `false`, la sentencia `if` ejecutará código diferente según el resultado.

A través de esta vista de inicio de sesión, ya hemos empezado a entrar en contacto con una forma de desarrollo que combina "interfaz + datos + juicio lógico".

## Código completo

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
