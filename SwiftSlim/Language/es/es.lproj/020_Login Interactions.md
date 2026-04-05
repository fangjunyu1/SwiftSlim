# Interacciones de inicio de sesión

En la lección anterior, creamos una vista de inicio de sesión y, mediante botones y lógica de comprobación, implementamos una validación sencilla del contenido introducido.

En esta lección, seguiremos tomando como base el código de la lección anterior para aprender el campo de entrada de contraseña `SecureField`, el cuadro de advertencia `Alert` y cómo controlar la visualización de diferentes vistas según las variables.

A través de esta lección, podrás comprender mejor el flujo básico de interacción de una vista de inicio de sesión, que también es una lógica básica utilizada en muchas aplicaciones.

## Campo de entrada de contraseña

En la lección anterior, usamos `TextField` para introducir la contraseña.

Pero en una interfaz de inicio de sesión real, la contraseña normalmente no se muestra directamente, sino que aparece como puntos u otros efectos de ocultación, para proteger la privacidad del usuario.

En SwiftUI, el control usado específicamente para introducir contraseñas es `SecureField`.

Por ejemplo:

```swift
SecureField("Password", text: $password)
```

Su forma de escribirse es muy parecida a `TextField`: también necesita un texto de sugerencia y una variable enlazada.

Se puede entender de forma sencilla así: `SecureField` también es un campo de entrada, solo que oculta el contenido introducido.

Podemos cambiar directamente el `TextField` que usábamos originalmente para introducir la contraseña por `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Cuando el usuario introduce la contraseña, su contenido ya no se mostrará directamente en la interfaz.

Efecto de visualización:

![password](../../Resource/020_password.png)

Ahora podemos introducir el nombre de usuario y la contraseña, y después de pulsar el botón comprobar si la entrada es correcta.

### Mostrar mensajes de retroalimentación

Antes habíamos estado usando `print` para mostrar resultados.

El contenido de `print` solo aparece en la consola. Los desarrolladores pueden verlo al ejecutar el programa en Xcode, pero los usuarios normales no pueden ver esos mensajes en el teléfono.

Es decir, aunque el programa ya haya completado la comprobación, el usuario no sabe si el contenido introducido es correcto.

En este momento, necesitamos una forma de mostrar mensajes directamente en la interfaz.

## Cuadro de advertencia Alert

En SwiftUI, podemos usar `Alert` para mostrar un cuadro emergente de aviso.

Uso básico:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Este fragmento de código parece un poco más complejo que los controles anteriores, pero podemos entenderlo si lo desglosamos.

`Alert` contiene principalmente las siguientes partes:

- `"Title"`: el título del cuadro de advertencia
- `isPresented`: un valor booleano enlazado que se usa para controlar si el cuadro de advertencia se muestra
- `Button(...)`: el botón del cuadro de advertencia
- `message:`: el contenido del mensaje que se muestra dentro del cuadro de advertencia

Se puede entender de forma sencilla así: cuando la variable enlazada se convierte en `true`, el sistema mostrará este cuadro de aviso.

Efecto de visualización:

![alert](../../Resource/020_alert3.png)

Estructura correspondiente:

![alert](../../Resource/020_alert.png)

### Alert es un modificador

Igual que muchos de los modificadores que aprendimos antes, `Alert` también se añade detrás de una vista determinada.

Por ejemplo, se puede aplicar detrás de un botón:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

También se puede aplicar detrás del `VStack` exterior:

```swift
VStack {
    // ...
}
.alert() {...}
```

Es decir, `Alert` no es una vista independiente colocada por sí sola en la interfaz, sino un modificador adjunto a una vista concreta.

Se puede entender de forma sencilla así: `Alert` normalmente se escribe detrás del botón o del diseño exterior para mostrar un aviso cuando se cumple cierta condición.

### Mostrar Alert

Si queremos mostrar un `Alert`, necesitamos una variable para controlarlo.

Por ejemplo:

```swift
@State private var showAlert = false
```

Esta variable es de tipo `Bool`, es decir, solo tiene dos valores: `true` o `false`.

Luego la enlazamos al `isPresented` de `Alert`:

```swift
isPresented: $showAlert
```

Cuando `showAlert` es `false`, el cuadro de advertencia no se mostrará; cuando `showAlert` es `true`, el cuadro de advertencia aparecerá.

### Mostrar el cuadro de advertencia mediante el botón

Ahora, implementemos primero el escenario más sencillo:

Cuando el usuario no introduce nada y pulsa directamente el botón `Sign in`, aparece un cuadro de aviso para decirle: "Todavía no has introducido ningún contenido".

Primero, crea una variable para controlar este cuadro de aviso:

```swift
@State private var showEmpty = false
```

Luego, añade un `Alert` detrás de `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

A continuación, realiza la comprobación dentro del código del clic del botón:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Si tanto `user` como `password` están vacíos, cambiaremos `showEmpty` a `true`.

Y como `Alert` está enlazado a esta variable, cuando se convierta en `true`, el sistema mostrará automáticamente el cuadro de aviso.

Efecto de visualización:

![alert](../../Resource/020_alert1.png)

De esta forma, después de pulsar el botón, el usuario podrá ver el mensaje de inmediato, y el desarrollador no tendrá que ir a la consola para revisar la salida de `print`.

### Perfeccionar el botón y el cuadro de advertencia

Antes, solo habíamos tratado la situación de “no se rellenó nada”.

También necesitamos tratar las siguientes situaciones:

- no se rellenó el nombre de usuario
- no se rellenó la contraseña
- se rellenaron el nombre de usuario y la contraseña, pero la entrada es incorrecta

Por lo tanto, también necesitamos preparar mensajes correspondientes para estos casos.

Primero, añade tres variables nuevas:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Después, sigue añadiendo los `Alert` correspondientes detrás del botón:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

A continuación, completa la lógica de comprobación dentro del botón:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Cuando el botón determina que el usuario no ha rellenado ninguna información, ha dejado una información sin completar o la validación de entrada ha fallado, cambiará la variable booleana correspondiente a `true`, y luego se mostrará el `Alert` correspondiente.

Aquí te recomiendo que pruebes por ti mismo varias situaciones:

- no rellenar nada
- rellenar solo el nombre de usuario
- rellenar solo la contraseña
- rellenar el nombre de usuario y la contraseña, pero con contenido incorrecto
- rellenar el nombre de usuario y la contraseña, y que el contenido sea correcto

Así podremos verificar si hay algún problema en nuestro código. Este también es un paso de “prueba” muy importante en el desarrollo de aplicaciones.

Si en algún escenario el programa no se comporta correctamente, eso significa que puede haber un problema en la lógica y que ha aparecido un `Bug` en el programa.

Lo que en desarrollo se suele llamar `Bug` se refiere a errores, fallos o comportamientos que no cumplen con lo esperado.

## Completar la vista de inicio de sesión

Los `Alert` que mencionamos antes trataban todos de cómo dar mensajes al usuario cuando “la entrada es incorrecta”.

Cuando el usuario introduce correctamente el nombre de usuario y la contraseña, normalmente no mostramos un “cuadro de advertencia”, sino que entramos directamente en la interfaz posterior al inicio de sesión.

Aquí interviene un punto de conocimiento muy importante: **mostrar diferentes vistas según el valor de una variable.**

Por ejemplo:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Aquí usamos el tipo `Bool` para gestionar la visualización de la vista:

- si `login` es `true`, significa que el inicio de sesión ya se realizó con éxito y se muestra el contenido posterior al inicio de sesión
- si `login` es `false`, significa que el inicio de sesión no tuvo éxito y la interfaz de inicio de sesión sigue mostrándose.

Aunque la sentencia `if` es una sentencia condicional de Swift, dentro del `body` de SwiftUI puede usarse para controlar la lógica de visualización de las vistas.

Es decir, SwiftUI decidirá qué vista debe mostrarse actualmente según el resultado de la condición.

Podemos colocar esta lógica de visualización en el `ContentView` actual:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Aquí añadimos una nueva variable, `login`, para indicar si el usuario ya ha iniciado sesión correctamente.

Luego colocamos detrás de la sentencia `else` el código de la vista de inicio de sesión que ya habíamos escrito antes.

Lógica de visualización de la vista:

- cuando `login` es `false`, significa que el inicio de sesión todavía no ha tenido éxito, por lo que se sigue mostrando la vista de inicio de sesión original.
- cuando `login` es `true`, significa que el inicio de sesión fue exitoso; en este momento ya no se muestra la vista de inicio de sesión, sino `Login successful`.

Es decir, `ContentView` mostrará contenido de vista diferente según el valor de `login`.

A continuación, modifiquemos la lógica de éxito del inicio de sesión dentro del botón:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Cuando el nombre de usuario y la contraseña introducidos por el usuario sean ambos correctos, cambiaremos `login` a `true`.

En cuanto cambie el valor de `login`, el resultado de la comprobación `if` dentro de `ContentView` también cambiará, y la interfaz cambiará de la vista de inicio de sesión original a `Login successful`.

El efecto de visualización es el siguiente:

![view](../../Resource/020_view.png)

Ahora sí hemos aplicado realmente a esta página de inicio de sesión actual el conocimiento de “mostrar diferentes vistas según la condición”.

En las aplicaciones reales, normalmente también se utiliza esta misma forma de decidir: mostrar diferentes vistas según un determinado valor.

Por ejemplo, cuando el usuario no ha iniciado sesión, se muestra la página de inicio de sesión; después de iniciar sesión correctamente, se muestra otra interfaz.

La idea central es: **controlar qué contenido muestra la interfaz a través de los cambios en las variables.**

## Resumen

En esta lección, aprendimos tres contenidos importantes:

1. Usar `SecureField` para introducir contraseñas, de modo que el contenido de la contraseña no se muestre directamente en la interfaz.
2. Usar `Alert` para mostrar mensajes al usuario en lugar de mostrarlos solo en la consola.
3. Usar variables y comprobaciones `if` para controlar la visualización de diferentes vistas e implementar el cambio entre la interfaz antes y después del inicio de sesión.

Mediante el aprendizaje de estos conocimientos, ya somos capaces de completar una vista de inicio de sesión con efectos básicos de interacción, y de comprender mejor la idea de desarrollo de SwiftUI: “cuando cambia el estado, la interfaz se actualiza”.

## Código completo

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Conocimientos ampliados - Alert con varios botones

En la parte anterior de esta lección, usamos el `Alert` más básico, que solo tiene un botón y se utiliza principalmente para avisar al usuario.

En realidad, `Alert` también puede incluir varios botones, para que el usuario pueda tomar distintas decisiones.

Por ejemplo:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Cuando se pulsa el botón, aparecerá un cuadro de aviso con tres opciones: `Ok`, `delete` y `cancel`.

Efecto de visualización:

![alert](../../Resource/020_alert2.png)

Al pulsar diferentes botones, se ejecutará el código correspondiente.

### La propiedad role de Button

Aquí notarás que el `Button` dentro de `Alert` es un poco diferente de la sintaxis del botón normal que aprendimos antes:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Aquí hay un parámetro adicional, `role`.

En SwiftUI, `role` se usa para indicar al sistema a qué tipo de acción pertenece este botón.

Algunos roles comunes son:

- `.cancel`: acción de cancelar
- `.destructive`: acción peligrosa, por ejemplo eliminar
- `nil`: acción normal

Los distintos valores de `role` también suelen producir diferencias en el estilo visual de la interfaz.

Por ejemplo, las acciones peligrosas suelen mostrarse con un estilo más llamativo para recordar al usuario que debe pulsar con cuidado.

Además, `role` también proporciona información semántica adicional al botón, lo que facilita que los lectores de pantalla (como VoiceOver en dispositivos Apple) expliquen al usuario la función del botón.

Por lo tanto, en situaciones adecuadas, añadir `role` a un botón es un muy buen hábito.
