# struct y class

En la lección anterior, acabábamos de empezar a entrar en contacto con `struct`, definimos una estructura y también ampliamos nuestro aprendizaje a temas como los protocolos, `UUID` y otros puntos de conocimiento.

Ahora ya tenemos una comprensión inicial de la palabra clave `struct`, pero todavía no se puede considerar que la entendamos de verdad.

En esta lección, seguiremos tomando `struct` como contenido principal y, de paso, también conoceremos `class`. A través de esta lección, entenderás con más claridad: qué es una instancia, qué es un constructor y por qué podemos usar `struct` y `class` para organizar datos.

## Sistema de gestión de estudiantes

Por ejemplo, ahora queremos desarrollar un sistema de gestión de estudiantes. Cada estudiante tiene información como nombre, sexo, teléfono, edad, dirección del hogar, etc.

En este momento, podemos reunir toda esta información y definirla como una estructura `Student`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Aquí usamos `struct` para definir un tipo de estudiante.

Esta estructura `Student` contiene varias propiedades:

- `id`: el identificador único del estudiante
- `name`: el nombre del estudiante
- `sex`: el sexo del estudiante
- `phone`: el teléfono del estudiante
- `age`: la edad del estudiante
- `address`: la dirección del hogar

De este modo, varios datos que originalmente estaban dispersos se combinan en un "estudiante" completo.

Aquí, `Student` también sigue el protocolo `Identifiable` y define un campo `id`, para facilitar más adelante la visualización de datos junto con el bucle `ForEach`.

Luego, podemos crear una instancia de estudiante:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Este código significa que, siguiendo la estructura `Student`, se pueden crear datos concretos de un estudiante.

Entre ellos, `Student` es el tipo, y `Student(...)` representa una instancia creada.

En SwiftUI, podemos asignar esta instancia a una variable y luego mostrarla.

Por ejemplo:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Así, podemos ver en la vista el nombre de este estudiante: `Fang Junyu`.

Aquí, primero creamos una instancia de `Student`, luego la asignamos a la variable `student`, y al final leemos su propiedad mediante `student.name`.

## Qué es una instancia

Cuando empezamos a aprender `struct`, es posible que la palabra "instancia" nos resulte muy desconocida.

Pero en realidad, hemos estado usando instancias desde el principio, solo que antes no les prestábamos especial atención.

Por ejemplo:

```swift
let name = "Fang Junyu"
```

Aquí, `"Fang Junyu"` es un valor de cadena, y en esencia es una instancia del tipo `String`.

También podemos escribirlo así:

```swift
let name = String("Fang Junyu")
```

Estas dos formas de escribirlo expresan lo mismo: crear una instancia del tipo `String` y asignarla a la variable `name`.

Del mismo modo, con `Int` sucede lo mismo:

```swift
let num = 3
```

Aquí, `3` es esencialmente un valor del tipo `Int`, y también puede entenderse como una instancia de `Int`.

Por lo tanto, una instancia no es un concepto especial que solo aparezca en `struct`.

Ya sea `String`, `Int`, `Double`, `Bool` o el `Student` personalizado, todos ellos pueden crear instancias.

Por eso, cuando escribimos:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

en esencia es lo mismo que crear una instancia de `String` o `Int`, solo que `Student` es un tipo definido por nosotros mismos.

## Constructor

Cuando creamos una instancia:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

en realidad estamos llamando al método de inicialización de `Student`, es decir, `init`.

Puedes entender el constructor como: **la entrada encargada de asignar valores a las propiedades cuando se crea una instancia.**

Es decir, antes de que una instancia quede realmente creada por completo, normalmente primero tiene que pasar por `init`.

Por ejemplo, cuando antes aprendimos el ciclo de vida de las vistas en SwiftUI, escribimos un código como este:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Aquí, `init()` se ejecuta cuando se crea la instancia `ContentView`, mientras que `onAppear` solo se ejecuta cuando la vista se muestra realmente en la interfaz. Es decir, la creación y la visualización de una vista no ocurren en el mismo momento.

Del mismo modo, cuando creamos `Student(...)`, también estamos llamando al constructor de `Student`.

### Constructor generado automáticamente por el sistema

Cuando definimos `Student`, no escribimos manualmente `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Sin embargo, aun así podemos crear una instancia directamente:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

¿Por qué se puede crear una instancia sin tener un constructor escrito?

Porque para `struct`, si no escribimos manualmente un constructor, el sistema normalmente genera automáticamente uno adecuado para nosotros.

En la etapa inicial del aprendizaje, puedes entenderlo de forma sencilla así: Swift completa automáticamente el código de inicialización por nosotros.

Se puede entender aproximadamente como que el sistema nos completa el siguiente código:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Aquí hay un detalle al que hay que prestar atención:

```swift
let id = UUID()
```

`id` ya tiene un valor predeterminado, por lo que al crear una instancia no necesitamos pasar `id` manualmente otra vez.

Es decir, las propiedades que no tienen valor predeterminado normalmente deben pasarse en el constructor; las propiedades que ya tienen un valor predeterminado normalmente pueden usar directamente ese valor original.

Por lo tanto, cuando creamos una instancia de `Student`, solo necesitamos pasar `name`, `sex`, `phone`, `age` y `address`.

### Sugerencias del compilador

Además, cuando escribimos `Student(...)` en Xcode, también podemos ver las sugerencias de parámetros dadas por el sistema.

![student](../../Resource/022_student.png)

Esto en realidad también muestra que el tipo actual realmente tiene un constructor generado automáticamente por el sistema.

### Escribir nosotros mismos el constructor

Aunque el sistema puede generar automáticamente el constructor, a veces esta forma de inicialización predeterminada no encaja por completo con nuestras necesidades.

Por ejemplo, tenemos una estructura `Movie`:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Según el constructor generado automáticamente por el sistema, al crear una instancia debemos pasar al mismo tiempo estos tres parámetros:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Pero si ahora queremos registrar un grupo de películas antiguas y solo conocemos el nombre de la película, pero no conocemos el director ni la puntuación, eso resulta un poco incómodo.

Porque entonces solo podemos escribirlo así:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Aunque funciona, repetir `--` cada vez no es muy cómodo.

En este momento, podemos escribir un constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

De este modo, al crear películas antiguas, solo necesitamos pasar `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

Este es uno de los significados de escribir nosotros mismos el constructor: **hacer que la forma de crear instancias se ajuste mejor a las necesidades reales.**

### Analizar un constructor personalizado

Veamos este constructor escrito a mano hace un momento:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Lo que significa este código es que, al crear una instancia de `Movie`, solo se requiere pasar un parámetro `name`.

Después, dentro del constructor, el `name` pasado se asignará al `name` de la propia instancia, y `director` y `rating` recibirán el valor predeterminado `--`.

Aquí, `self` significa "esta instancia actual en sí misma".

Por ejemplo:

```swift
self.name = name
```

El `self.name` de la izquierda representa la propiedad de la instancia; el `name` de la derecha representa el parámetro que hemos pasado.

Se puede entender de forma sencilla como guardar en la propiedad de la propia instancia el valor que llega desde fuera.

Cuando todas las propiedades ya han recibido un valor, la creación de esta instancia queda completada.

### Mecanismo del constructor

Cuando declaramos explícitamente un constructor, también se produce otro cambio:

el constructor que el sistema generaba automáticamente originalmente normalmente ya no puede usarse de forma directa.

Por ejemplo:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Ahora, si volvemos a escribir así:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

el compilador dará un error:

```swift
Extra arguments at positions #2, #3 in call
```

Eso significa: has pasado parámetros de más.

¿Por qué aparece este error?

Porque en la estructura `Movie` actual solo existe este tipo de constructor que declaraste manualmente:

```swift
init(name: String)
```

Solo acepta un parámetro `name`, y no acepta `director` ni `rating`.

Es decir, cuando añades manualmente tu propio constructor, la forma de inicialización que el sistema generaba automáticamente ya no puede usarse directamente.

Si queremos admitir tanto "pasar solo el nombre" como "pasar la información completa", entonces necesitamos añadir nosotros mismos otro constructor completo:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

De este modo, tenemos dos constructores diferentes.

Al crear una película antigua, podemos escribir así:

```swift
Movie(name: "The Night of the Hunter")
```

Al crear una película nueva con información completa, podemos escribir así:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Esta forma de escribir también muestra que un mismo tipo puede tener varios constructores, siempre que la forma de sus parámetros sea diferente.

## Qué es la sobrecarga

Aquí añadiremos otro punto de conocimiento necesario.

Justo ahora escribimos dos `init` para `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Esta forma de escribir, "el mismo nombre de función, pero parámetros diferentes", se llama "sobrecarga".

Aquí, ambas funciones se llaman `init`, pero como reciben parámetros distintos, Swift puede distinguir qué función estás llamando.

Por ejemplo:

```swift
Movie(name: "Days of Heaven")
```

llamará a:

```swift
init(name: String)
```

Mientras que:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

llamará a la otra versión completa del método de inicialización.

Por lo tanto, la función de la sobrecarga es: permitir que un mismo tipo ofrezca distintas formas de creación según diferentes situaciones.

## Conocer class

A continuación, conozcamos brevemente `class`.

Además del común `struct` en Swift, muchos lenguajes de programación usan `class` para crear instancias, como Java, C#, Kotlin y otros.

En Swift, la sintaxis de `class` es muy parecida a la de `struct`.

Por ejemplo:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Verás que, excepto porque la palabra clave cambia de `struct` a `class`, las demás partes parecen casi iguales.

La forma de crear una instancia también es muy parecida:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Por lo tanto, a nivel de sintaxis, `struct` y `class` realmente son muy parecidos.

### Diferencia entre Struct y Class

Aunque `struct` y `class` se parezcan mucho, no son exactamente lo mismo.

**1. La forma de inicialización es diferente**

Para `struct`, si no escribimos manualmente un constructor, el sistema normalmente genera automáticamente un método de inicialización adecuado.

Pero para `class`, si hay propiedades que todavía no tienen valores predeterminados, normalmente necesitamos escribir `init` manualmente; de lo contrario, aparecerá un error.

Por ejemplo:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Esta `class` produce un error porque no tiene constructor, así que sus propiedades no están inicializadas.

El compilador mostrará algo parecido a:

```swift
Class 'Movie' has no initializers
```

Por lo tanto, en este ejemplo, `class` debe tener obligatoriamente un constructor escrito manualmente.

**2. `struct` es un tipo por valor, `class` es un tipo por referencia**

`struct` es un tipo por valor, y `class` es un tipo por referencia.

En la etapa inicial del aprendizaje, no hace falta dominar completamente estos dos conceptos; basta con tener una comprensión sencilla de ellos.

Por ejemplo, `struct` se parece más a "copiar un valor nuevo".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Aquí, después de asignar `user1` a `user2`, es como si se hubiera copiado un nuevo conjunto de datos, por lo que modificar `user2` no afecta a `user1`.

En cambio, `class` se parece más a "apuntar juntos a la misma instancia".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Aquí, `user1` y `user2` apuntan a la misma instancia.

Ahora mismo no necesitamos entender por completo el mecanismo interno de los tipos por valor y los tipos por referencia; solo necesitamos saber que `struct` es más adecuado para guardar datos independientes, mientras que `class` es más adecuado cuando varios lugares necesitan compartir la misma instancia.

## Cómo elegir en la etapa inicial

En la etapa actual, para modelos de datos normales conviene pensar primero en `struct`; cuando se necesiten datos compartidos y cambios sincronizados, entonces conviene considerar `class`.

Esto no es una regla absoluta, pero para principiantes es una forma de juicio lo suficientemente práctica.

Especialmente en SwiftUI, muchas veces descubrirás que `struct` ya puede encargarse de la mayor parte del trabajo.

Además, en muchos materiales de programación, a lo que se crea con `class` también se le llama "objeto". En la etapa inicial, puedes entenderlo simplemente como una instancia, sin necesidad de distinguirlos deliberadamente.

## Resumen

En esta lección, estudiamos `struct` más a fondo y, de paso, también conocimos `class`; ambos pueden usarse para definir tipos.

Los tipos pueden crear instancias. Cuando se crea una instancia, se llama al constructor, es decir, `init`.

Para `struct`, si no escribimos manualmente un constructor, el sistema normalmente genera automáticamente un constructor adecuado. Si el constructor predeterminado no satisface nuestras necesidades, también podemos escribir uno nosotros mismos.

Además, también obtuvimos una comprensión inicial de la diferencia entre `struct` y `class`: `struct` es un tipo por valor, mientras que `class` es un tipo por referencia. En SwiftUI, en la etapa inicial, lo que normalmente encontrarás con más frecuencia es `struct`.

Más adelante, cuando aprendamos a pasar valores entre vistas, modelos de datos y gestión de estado, todo este contenido seguirá utilizándose.
