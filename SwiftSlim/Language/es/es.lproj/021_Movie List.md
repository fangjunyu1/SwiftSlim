# Lista de Películas

En esta lección, crearemos una lista de películas.

![movie](../../Resource/021_movie.png)

En la lista se mostrarán el póster, el nombre, el director y la puntuación de cada película.

En este ejemplo, aprenderemos un punto de conocimiento muy importante: la estructura `struct`. Puede ayudarnos a combinar varias informaciones de una película en un solo conjunto. Además de eso, también veremos `UUID()`, `ForEach`, la línea divisoria `Divider` y cómo usar objetos personalizados para gestionar datos.

Estos conocimientos son muy comunes en el desarrollo posterior con SwiftUI. Después de terminar esta lección, no solo podrás hacer una lista de películas, sino que también empezarás a entender "cómo mostrar un conjunto de datos como una interfaz".

## Una sola película

Podemos empezar primero por crear la interfaz de una sola película.

![movie](../../Resource/021_movie1.png)

La disposición de esta interfaz se compone principalmente de dos partes: a la izquierda está el póster de la película y a la derecha está la introducción de la película.

### Póster de la película

En la parte izquierda se muestra el póster de la película, y podemos usar `Image` para mostrar la imagen.

Por ejemplo:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Este código indica que se muestra una imagen llamada `"The Shawshank Redemption"`.

Aquí hay que tener en cuenta que el nombre de la imagen debe existir realmente en la carpeta de recursos `Assets`; de lo contrario, la interfaz no podrá mostrar correctamente esta imagen.

![movie](../../Resource/021_movie2.png)

Las funciones de estos modificadores son las siguientes:

- `resizable()` significa que el tamaño de la imagen puede ajustarse.
- `scaledToFit()` significa que se mantiene la proporción original al escalar, para evitar que la imagen se estire y se deforme.
- `frame(height: 180)` significa que la altura de la imagen se establece en 180.
- `cornerRadius(10)` significa que se aplica a la imagen un radio de esquina de 10.

De esta forma, podemos obtener una imagen de póster de película con un tamaño adecuado y esquinas redondeadas.

![movie](../../Resource/021_movie3.png)

### Introducción de la película

En la parte derecha se muestra la introducción de la película, incluyendo el nombre de la película, el director y la puntuación.

![movie](../../Resource/021_movie4.png)

Podemos usar `Text` para mostrar esta parte:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

En este código, `.font` representa el tamaño de la fuente y `.fontWeight` representa el grosor de la fuente.

Para que haya una separación más clara entre el "nombre de la película", la "información del director" y la "información de la puntuación", aquí usamos `VStack` en la capa más externa y establecemos:

```swift
spacing: 10
```

Esto significa que el espacio entre cada grupo de contenido dentro de este `VStack` es de 10.

La razón por la que el director y la puntuación están envueltos cada uno en otro `VStack` es que ambos pertenecen a una estructura de "título + contenido". Por eso, la jerarquía de la interfaz será más clara y también será más cómodo seguir ajustando el estilo más adelante.

Además, `VStack` está centrado por defecto. Para alinear todo el texto a la izquierda, establecemos:

```swift
alignment: .leading
```

Así, la parte de introducción de la película se ve más ordenada.

### Línea divisoria

Ahora, aunque el contenido de la introducción de la película ya está separado mediante `spacing`, la división entre los distintos contenidos todavía no es lo bastante evidente.

En este momento, podemos añadir una línea divisoria:

```swift
Divider()
```

Por ejemplo:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

De esta manera, la parte de introducción de la película tendrá un efecto de separación más evidente.

![movie](../../Resource/021_movie4.png)

`Divider` es una vista muy simple pero muy común, cuya función es separar contenidos diferentes.

En `VStack`, `Divider()` se muestra como una línea horizontal.

En `HStack`, `Divider()` se muestra como una línea vertical.

Además, también se puede modificar el estilo de `Divider` mediante `.frame`, `.background`, `.padding`, etc.

Por ejemplo:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Esto generará una línea divisoria azul, con grosor 2 y con relleno horizontal a ambos lados.

![divider](../../Resource/021_divider.png)

### Interfaz completa

Por último, podemos usar `HStack` para colocar el póster de la película y la introducción de la película uno al lado del otro.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Aquí, `HStack(spacing: 20)` significa que se deja un espacio de 20 entre las dos partes, izquierda y derecha.

Hay que tener en cuenta que `Divider()`, al igual que `TextField` y `Slider` que vimos antes, por defecto intenta ocupar todo el espacio disponible posible.

Por eso, establecemos un ancho fijo para el `VStack` exterior de la parte descriptiva de la derecha:

```swift
.frame(width: 200)
```

Así, el ancho de la línea divisoria y del área de texto puede mantenerse igual, y el conjunto se verá más ordenado.

Hasta aquí, hemos completado la interfaz de visualización de "una sola película".

![movie](../../Resource/021_movie1.png)

## Guardar películas en un array

Si queremos mostrar varias películas una tras otra con el mismo estilo, eso significa que tendremos que escribir un código parecido para cada película.

Por ejemplo:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Aunque escribir el código de esta manera puede lograr el efecto, el código será cada vez más largo y además resultará muy molesto de mantener.

Por ejemplo, si hace falta cambiar el espacio de todas las películas de `20` a `15`, o cambiar el ancho de la parte derecha de `200` a
`220`, habrá que modificar manualmente cada bloque de código repetido.

Obviamente, este no es un método eficiente.

Antes aprendimos los arrays y también aprendimos a usar `ForEach` para mostrar vistas repetidamente según un array.

Por ejemplo:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Este método es muy adecuado para manejar casos en los que hay "solo un dato", como un grupo de nombres de imágenes.

Pero una película no tiene solo un valor. Al menos incluye:

1. el póster de la película
2. el nombre de la película
3. el director
4. la puntuación

Es decir, una película es en realidad un conjunto de datos relacionados y no una sola cadena.

Si solo usamos arrays, solo podremos guardar esta información por separado:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Al mostrarlos, tendremos que depender del mismo índice para hacer coincidir cada uno:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

El problema de esta forma de escribirlo es que el coste de mantenimiento es muy alto.

Porque los datos de una película quedan dispersos en varios arrays. Basta con que uno de los arrays tenga un elemento de más, uno de menos o un orden diferente para que el resultado mostrado sea incorrecto.

Especialmente al añadir o eliminar películas, tienes que modificar varios arrays al mismo tiempo, y es muy fácil pasar algo por alto.

Entonces, ¿cómo podemos combinar información como "nombre de la película, director y puntuación" en un solo conjunto?

Para ello, necesitamos usar `struct`.

## Definir una estructura struct

En Swift, `struct` es una "estructura".

Puedes entenderla como un "tipo de dato personalizado" que puede combinar varios campos relacionados en un solo conjunto.

Uso básico:

```swift
struct StructName {
	let name: String
}
```

En este código, `struct` es la palabra clave que indica que estamos definiendo una estructura. `StructName` es el nombre de la estructura.

El contenido dentro de las llaves son los campos que contiene esta estructura, y en cada campo deben quedar claramente escritos el nombre y el tipo.

Normalmente, el nombre de una `struct` empieza con mayúscula, por ejemplo `Movie`, `Student` o `UserInfo`. Esta es una convención de nombres común en Swift.

Puedes entender `struct` de forma simple como una caja vacía, donde cada campo es como un espacio vacío reservado dentro de la caja.

Cuando esos espacios todavía no se han llenado, solo es una caja vacía. Solo cuando todos los campos se completan con valores adecuados se convierte en una caja de regalo completa.

### Instancia de struct

Antes solo definimos la propia estructura, lo que equivale a preparar la forma de una caja.

Todavía necesitamos rellenarla con contenido concreto para obtener una verdadera "instancia" que se pueda usar.

Al crear una instancia, normalmente se añade `()` detrás del nombre de la estructura:

```swift
StructName(...)
```

Lo que se rellena dentro de los paréntesis es precisamente el contenido de los campos que necesita esta estructura.

Por ejemplo:

```swift
StructName(name: "Fang Junyu")
```

Este código significa: crear una nueva instancia según el formato de la estructura `StructName` y asignar al campo `name` el valor `"Fang Junyu"`.

Cuando completamos todos los contenidos necesarios de los campos, es como si llenáramos por completo esa caja.

En ese momento, obtenemos una instancia completa de la estructura.

### Acceder a propiedades de struct

Cuando ya hemos creado una instancia, podemos usar la "sintaxis de punto" para acceder a sus propiedades internas.

Escritura básica:

```swift
instancia.nombreDeLaPropiedad
```

Por ejemplo:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Aquí, `st` es una instancia de estructura, y `st.name` significa leer el valor `name` de esa instancia.

Puedes entender esta forma de lectura así: cuando escribimos `st.name`, es como si leyéramos el contenido guardado en una determinada posición dentro de esa caja.

Esta forma de escribir será muy común en las interfaces de SwiftUI más adelante.

Por ejemplo, si tenemos una estructura de estudiante que contiene nombre, edad y clase, entonces al mostrarla en la interfaz podemos leer por separado:

```swift
student.name
student.age
student.className
```

La ventaja de hacer esto es que los datos quedan más claros y también son más fáciles de gestionar.

### Posición de struct

Para las personas principiantes, normalmente se puede escribir la estructura fuera de `ContentView`.

Por ejemplo:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

De esta forma, la estructura queda más clara y también resulta más fácil de leer.

Verás que `ContentView` en sí mismo también es en realidad una `struct`.

### Estructura Movie

Con la base anterior, ya podemos definir una estructura de película:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Esta es una estructura llamada `Movie`, formada por los tres campos `name`, `director` y `rating`, que representan respectivamente el nombre de la película, el director y la puntuación.

De esta forma, la información relacionada con una película ya no necesita dividirse en varios arrays, sino que puede combinarse directamente en un solo conjunto.

Por ejemplo, podemos crear una instancia de película así:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Esta instancia representa "un conjunto completo de datos de película".

### Guardar estructuras en un array

Antes dijimos que un array solo puede guardar un mismo tipo.

Ahora ya tenemos la estructura `Movie`, así que el array puede guardar múltiples `Movie`.

```swift
let lists: [Movie] = []
```

Por ejemplo:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

En este array `lists`, lo que se guarda no son cadenas, sino varias instancias de `Movie`.

Es decir, cada elemento del array es una película completa.

Así, cuando necesitemos mostrar la lista de películas, podemos usar `ForEach` para leer cada película una por una.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Aquí, `movie in` significa que en cada iteración se toma una película del array y se le pone temporalmente el nombre `movie`.

Después, podemos usar:

```swift
movie.name
movie.director
movie.rating
```

para leer respectivamente el nombre, el director y la puntuación de esa película, y mostrarlos en la interfaz.

## Error de ForEach

Hasta aquí, ya hemos completado la forma básica de escribir el array de películas y `ForEach`.

Sin embargo, si ejecutas directamente el siguiente código:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

aparecerá un error:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

El significado de este error es que, cuando escribes `id: \.self`, SwiftUI necesita tomar cada elemento del array como un "identificador único" para distinguirlos.

Esta forma de escribir es adecuada para tipos simples como `String` e `Int`, porque por sí mismos son más fáciles de distinguir.

Pero `Movie` es una estructura personalizada que nosotros definimos, y `ForEach` no sabe cómo usar la propia estructura como identificador único, por eso aparece el error.

La forma más común de resolver este problema es hacer que `Movie` siga el protocolo `Identifiable`.

## Protocolo

En Swift, un protocolo puede entenderse como una especie de "regla" o "requisito".

Puedes entenderlo como un acuerdo en una organización internacional: si un país quiere unirse a una determinada organización internacional, normalmente primero debe cumplir algunas reglas propuestas por esa organización, hacer públicos algunos datos y respetar algunas reglas comunes. Solo después de cumplir esas condiciones puede unirse o participar en ciertos asuntos.

Los protocolos funcionan de una manera similar.

Cuando un tipo quiere ajustarse a un determinado protocolo, necesita cumplir el contenido que exige ese protocolo. Solo después de cumplir esos requisitos, ese tipo puede usar la funcionalidad correspondiente.

Escritura básica:

```swift
struct Movie: Identifiable {
    // ...
}
```

Aquí, `: Identifiable` significa que `Movie` sigue el protocolo `Identifiable`.

Si un tipo sigue varios protocolos, pueden separarse con comas:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Para `Identifiable`, el requisito más importante es que el tipo necesita tener un `id` con el que pueda identificarse.

Por ejemplo:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Aquí, `id` es como un número de identificación y se usa para distinguir cada película.

Mientras el `id` de cada película sea diferente, SwiftUI podrá distinguir correctamente cada elemento del array.

Por ejemplo:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Luego usamos en `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Así, ya no habrá error.

Como `Movie` ya sigue `Identifiable`, una forma más común de escribirlo es omitir directamente `id:`:

```swift
ForEach(lists) { movie in
    // ...
}
```

Porque SwiftUI ya sabe que debe usar `movie.id` para distinguir cada elemento.

## El identificador de distinción de ForEach

A continuación, entenderemos con más profundidad el papel de `id` en `ForEach`.

Por ejemplo:

```swift
ForEach(lists, id: \.self)
```

Aquí significa: usar el propio elemento como identificador de distinción.

Y:

```swift
ForEach(lists, id: \.id)
```

significa: usar el campo `id` del elemento como identificador de distinción.

Si un determinado campo puede garantizar por sí mismo la unicidad, también puede usarse temporalmente.

Por ejemplo, si el nombre de cada película es diferente, entonces la siguiente forma de escribirlo también podría funcionar correctamente con los datos actuales:

```swift
ForEach(lists, id: \.name)
```

Pero aquí hay un problema oculto: `name` no es necesariamente único para siempre.

Supongamos que más adelante añades otra película con el mismo nombre; entonces `name` ya no podrá distinguir con precisión cada elemento.

En ese momento, aunque el código todavía pueda compilar, SwiftUI puede identificar mal los elementos durante la actualización, inserción o eliminación de vistas, provocando anomalías en la visualización.

Por eso, cuando necesitamos distinguir los datos de forma estable, sigue siendo mejor usar el campo realmente único, es decir, `id`.

## UUID

Aunque escribir manualmente `id: 1`, `id: 2` puede resolver el problema, todavía existe un riesgo: es posible que, sin querer, escribas un `id` repetido y entonces el identificador único perderá su validez.

Por ejemplo:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

De esta forma, aparecerán dos `id` iguales, y el identificador único perderá su validez.

Para evitar errores manuales, normalmente usamos `UUID()`.

En Swift, `UUID()` genera aleatoriamente un identificador de 128 bits. Normalmente se muestra como una larga cadena compuesta por letras y números.

Por ejemplo:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Aquí, `UUID()` en realidad crea una instancia del tipo `UUID`; puedes entenderlo como un "número único" generado automáticamente.

Por eso, los valores creados cada vez casi nunca se repiten, así que son muy adecuados para usarse como `id`.

Podemos modificar `Movie` así:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Este código significa que el campo `id` en la estructura `Movie` recibirá por defecto una nueva instancia de `UUID`.

Es decir, cada vez que creemos una nueva `Movie`, el sistema nos generará automáticamente primero un `id` único.

Como `id` ya tiene un valor por defecto, después ya no será necesario rellenar manualmente `id` al crear instancias de `Movie`.

Por ejemplo:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Aunque aquí no se escriba `id`, en realidad esta instancia de película sigue teniendo su propio `id`; simplemente ese valor ya ha sido generado automáticamente por `UUID()`.

Después de usar este método, ya no necesitamos rellenar manualmente `id` para cada película, lo que no solo reduce la cantidad de código, sino que también evita errores causados por valores de id duplicados.

Por último, solo necesitamos añadir una imagen `Banner` en la parte superior y usar `ScrollView` para que el contenido pueda desplazarse, y así completaremos toda la vista de la lista de películas.

## Resumen

En esta lección, aprendimos un punto de conocimiento muy importante: `struct`.

A través de `struct`, podemos combinar varios campos relacionados de una película en un solo conjunto, en lugar de dividir el nombre, el director y la puntuación en varios arrays.

Después de combinar los datos, podemos usar `ForEach` para mostrar una a una cada película del array en la vista.

Al mismo tiempo, también entendimos el papel del "identificador de distinción" en `ForEach`: SwiftUI debe saber cómo distinguir cada elemento del array para poder mostrar y actualizar la vista correctamente.

Por eso hicimos que `Movie` siguiera el protocolo `Identifiable` y le proporcionamos un `id` único.

Para evitar errores al rellenar manualmente `id`, también aprendimos `UUID()` para que el sistema genere automáticamente el identificador único.

Después de completar esta lección, no solo habrás terminado la lista de películas, sino que también empezarás a entrar en contacto con una idea importante en SwiftUI: **primero organiza los datos y luego genera la vista basándote en esos datos.**

## Código completo

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
