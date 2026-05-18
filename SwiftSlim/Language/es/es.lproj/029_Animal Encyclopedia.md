# Enciclopedia de animales

En esta lección, seguiremos practicando vistas personalizadas y transmisión de datos.

Vamos a crear una vista sencilla de enciclopedia de animales. La página mostrará cinco animales; cuando el usuario toque uno de ellos, aparecerá una vista de detalle que mostrará su imagen, área de distribución, hábitat y descripción.

Resultado final:

![view](../../../Resource/029_view.png)

Con este caso, podemos practicar cómo funcionan juntas una estructura de datos, la visualización de listas, la interacción por toque y una vista emergente Sheet.

## Preparar los recursos de imagen

Primero, necesitamos preparar cinco imágenes de animales:

- Delfín: `dolphin.jpg`
- Jirafa: `giraffe.jpg`
- León: `lion.jpg`
- Panda: `panda.jpg`
- Oso polar: `polarBear.jpg`

Puedes usar los siguientes recursos de imagen:

[Delfín](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Jirafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [León](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Oso polar](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Después de descargar las imágenes, arrástralas a la carpeta de recursos `Assets` del proyecto de Xcode.

![assets](../../../Resource/029_assets.png)

Ten en cuenta que, al usar imágenes en el código, normalmente no necesitas escribir la extensión `.jpg`.

Por ejemplo, si el nombre del recurso de imagen es `dolphin`, escribe esto en el código:

```swift
Image("dolphin")
```

Si el nombre de la imagen está escrito incorrectamente, la imagen no se mostrará correctamente.

Nota: los recursos de imagen anteriores provienen de proyectos de Wikimedia. Al usarlos, se recomienda conservar los enlaces originales y la información de origen.

## Crear la estructura Animal

En esta página, cada animal tiene varias piezas de información:

- Nombre del animal
- Imagen del animal
- Emoji del animal
- Área de distribución
- Hábitat
- Descripción del animal

Si distribuimos esta información en muchas variables, el código se volverá confuso. Por eso, podemos crear una estructura `Animal` para agrupar la información de un animal.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

En este fragmento de código:

- `id`: identificador único del animal.
- `name`: nombre del animal.
- `imageName`: nombre de la imagen del animal.
- `avatarEmoji`: emoji del animal.
- `distributionArea`: área de distribución.
- `habitat`: hábitat.
- `animalDescription`: descripción del animal.

Entre ellos:

```swift
let id = UUID()
```

El `id` se usa para identificar a cada animal. Más adelante usaremos `ForEach` para mostrar la lista de animales y también usaremos `.sheet(item:)` para presentar detalles según el animal seleccionado, por lo que necesitamos que `Animal` cumpla el protocolo `Identifiable`.

La función de `Identifiable` es decirle a SwiftUI que cada animal tiene un `id` que permite distinguir su identidad.

## Crear los datos de los animales

A continuación, creamos un array de animales en `ContentView`.

El array guarda cinco valores `Animal`, y cada `Animal` representa un animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Delfín
        Animal(
            name: "Delfín",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Océanos cálidos y templados de todo el mundo.",
            habitat: "Océanos, aguas costeras y algunos ríos grandes.",
            animalDescription: "Los delfines son mamíferos marinos inteligentes. Viven en grupos, se comunican con sonidos y son conocidos por su comportamiento juguetón."
        ),
        // Jirafa
        Animal(
            name: "Jirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sabanas y bosques abiertos de África.",
            habitat: "Praderas, sabanas y bosques abiertos.",
            animalDescription: "Las jirafas son los animales terrestres más altos. Tienen cuellos largos, patas largas y suelen alimentarse de hojas de árboles altos."
        ),
        // León
        Animal(
            name: "León",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Se encuentran principalmente en el África subsahariana, con una pequeña población en el oeste de la India.",
            habitat: "Praderas, sabanas y bosques abiertos.",
            animalDescription: "Los leones son grandes felinos poderosos. Suelen vivir en grupos llamados manadas y a menudo se les conoce como los reyes del mundo animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bosques de montaña del centro de China.",
            habitat: "Bosques de bambú en zonas montañosas frescas y húmedas.",
            animalDescription: "Los pandas son osos conocidos por su pelaje blanco y negro. Se alimentan principalmente de bambú y son uno de los animales más reconocibles del mundo."
        ),
        // Oso polar
        Animal(
            name: "Oso polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiones árticas alrededor del Polo Norte.",
            habitat: "Hielo marino, zonas costeras y entornos árticos fríos.",
            animalDescription: "Los osos polares son grandes osos adaptados a entornos fríos. Son buenos nadadores y dependen principalmente del hielo marino para cazar focas."
        )
    ]

    var body: some View {
        Text("Enciclopedia de animales")
    }
}
```

Aquí, `animals` es un array:

```swift
let animals: [Animal]
```

`[Animal]` indica que este array guarda varios valores `Animal`.

Es decir, `animals` no es un solo animal, sino un grupo de animales.

## Mostrar la lista de animales

Ahora podemos usar `ForEach` para mostrar la lista de animales.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Resultado mostrado:

![view](../../../Resource/029_view1.png)

En este fragmento de código:

```swift
ForEach(animals) { animal in
    ...
}
```

Esto significa recorrer el array `animals`.

En cada iteración, `animal` representa el animal que se está mostrando en ese momento.

Por ejemplo, en la primera iteración, `animal` es el delfín; en la segunda iteración, `animal` es la jirafa.

Por eso, podemos mostrar la información del animal actual de la siguiente manera:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Así podemos mostrar los cinco animales.

## Hacer que la lista de animales se pueda tocar

Ahora la lista ya se muestra, pero todavía no se puede tocar.

Si queremos mostrar los detalles después de tocar un animal, primero debemos registrar el “animal seleccionado actualmente”.

Por lo tanto, agrega una variable de estado en `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Aquí, `selectedAnimal` es un valor opcional de tipo `Animal?`.

Esto significa que puede contener un animal o no contener ninguno.

El valor predeterminado es `nil`, lo que indica que al principio no se ha seleccionado ningún animal.

Después, convertimos cada fila de animal en un `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

El punto clave es esta línea de código:

```swift
selectedAnimal = animal
```

Cuando el usuario toca un animal, guardamos ese animal en `selectedAnimal`.

Por ejemplo, si el usuario toca el delfín, `selectedAnimal` guardará el delfín.

Si el usuario toca el panda, `selectedAnimal` guardará el panda.

Es decir, `selectedAnimal` se usa para registrar qué animal ha tocado el usuario actualmente.

## Vista emergente Sheet

Ahora ya podemos registrar el “animal tocado actualmente” mediante el botón.

A continuación, necesitamos implementar una vista emergente para mostrar los detalles del animal.

![view](../../../Resource/029_view2.png)

En SwiftUI, podemos usar `Sheet` para implementar este efecto emergente.

`Sheet` puede entenderse como una página temporal que aparece sobre la página actual. Después de revisar el contenido, el usuario puede deslizar hacia abajo para cerrarla.

## Ejemplo de Sheet

Antes de mostrar realmente los detalles del animal, usemos un ejemplo sencillo para entender cómo aparece un `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Mostrar Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Vista Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Resultado mostrado:

![view](../../../Resource/029_view3.png)

En este código, creamos un valor booleano:

```swift
@State private var showSheet = false
```

`showSheet` es `false` de forma predeterminada, lo que indica que al principio no se muestra el `Sheet`.

Cuando se toca el botón:

```swift
showSheet.toggle()
```

`toggle()` significa cambiar el valor booleano.

Si originalmente era `false`, después de llamar a `toggle()` se convertirá en `true`.

Si originalmente era `true`, después de llamar a `toggle()` se convertirá en `false`.

Por eso, después de tocar el botón, `showSheet` pasará de `false` a `true`.

Cuando `showSheet` se convierte en `true`, el siguiente código mostrará el `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Este código significa: cuando `showSheet` es `true`, aparece un `Sheet` y dentro de ese `Sheet` se muestra `Text("Vista Sheet")`.

Resultado mostrado:

![view](../../../Resource/029_view4.png)

Esta forma de escribirlo es adecuada para presentar contenido fijo.

Por ejemplo, después de tocar un botón se puede mostrar una página de ajustes, una página de explicación o una página de aviso.

### Posición de Sheet

Aunque `Sheet` es una vista emergente, en SwiftUI no se escribe directamente como una vista independiente al estilo de `Text()` o `Image()`, sino que se usa como un modificador de vista.

Es decir, `.sheet(...)` es similar a modificadores como `.font()`, `.padding()` y `.shadow()`: todos deben añadirse después de alguna vista.

Por ejemplo:

```swift
Button("Mostrar Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

En este ejemplo, `.sheet` se añadió después de `Button`.

Cuando `showSheet` se convierte en `true`, SwiftUI mostrará el `Sheet` y presentará el contenido dentro de las llaves:

```swift
Text("Vista Sheet")
```

Sin embargo, en el desarrollo real, si una página tiene varios botones, normalmente no se añade un `.sheet` a cada botón.

Una práctica más común es añadir `.sheet` después de la vista externa.

Por ejemplo:

```swift
VStack {
    Button("Mostrar Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

El botón se encarga de modificar `showSheet`, y la vista externa se encarga de mostrar el `Sheet` según si `showSheet` es `true`.

## Vincular Sheet a un valor opcional

La forma que aprendimos antes era:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Esta forma de escribirlo es adecuada para controlar la visualización y ocultación de una página fija.

Pero en el caso de la enciclopedia de animales no solo necesitamos saber “si debe aparecer el `Sheet`”, sino también “qué animal se ha tocado”.

Por ejemplo:

Si el usuario toca el delfín, el `Sheet` debe mostrar los detalles del delfín.

Si el usuario toca el panda, el `Sheet` debe mostrar los detalles del panda.

Por eso, aquí es más adecuado usar otra forma de escribir Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Contenido mostrado en el Sheet
}
```

En este código, `Sheet` está vinculado a un valor opcional `selectedAnimal`.

Aquí debes tener en cuenta que después de `item:` se escribe `$selectedAnimal`, no `selectedAnimal`.

Esto se debe a que `Sheet` no solo lee el valor de `selectedAnimal`, sino que también necesita decidir si debe aparecer según sus cambios.

Este código puede entenderse así:

- Cuando `selectedAnimal` es `nil`, no se muestra el `Sheet`.
- Cuando `selectedAnimal` tiene un valor, se muestra el `Sheet`.
- Cuando el `Sheet` se cierra, SwiftUI vuelve a cambiar `selectedAnimal` a `nil`.

SwiftUI pasará el animal guardado en `selectedAnimal` al `animal` dentro de las llaves.

Es decir, `.sheet(item:)` no solo controla la presentación, sino que también pasa los datos seleccionados al `Sheet`.

## Usar Sheet para mostrar el nombre del animal

Ahora, no nos apresuremos a crear una vista de detalle compleja.

Para que el código sea más fácil de entender, primero mostraremos el nombre del animal actual en el `Sheet`.

Añade `.sheet(item:)` fuera de `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

Lo más importante aquí es este fragmento de código:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Cuando `selectedAnimal` tiene un valor, el `Sheet` aparece.

El `animal` dentro de las llaves es el animal seleccionado actualmente.

Por eso:

```swift
Text(animal.name)
```

mostrará el nombre del animal que se ha tocado actualmente.

Por ejemplo, si tocas `Delfín`, el Sheet mostrará `Delfín`.

Si tocas `Panda`, el `Sheet` mostrará `Panda`.

Así hemos logrado el efecto de tocar distintos animales y mostrar distintos nombres de animales.

Mostrar el nombre del animal:

![view](../../../Resource/029_view5.png)

Sin embargo, los detalles del animal no deberían mostrar solo un nombre; también deberían mostrar el nombre, el área de distribución, el hábitat y la descripción.

Si escribimos todo este código dentro de `.sheet`, el código se volverá muy largo y difícil de leer.

Por eso, a continuación crearemos una nueva vista personalizada dedicada a mostrar los detalles del animal.

## Crear la vista de detalle del animal

A continuación, creamos una nueva vista personalizada `AnimalDetailView`.

Esta vista recibe un `Animal` y muestra los detalles del animal.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Área de distribución**: \(animal.distributionArea)")

                    Divider()

                    Text("**Hábitat**: \(animal.habitat)")

                    Divider()

                    Text("**Descripción del animal**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Resultado mostrado:

![view](../../../Resource/029_view2.png)

El punto clave aquí es:

```swift
var animal: Animal
```

Esto indica que `AnimalDetailView` necesita recibir un animal desde el exterior.

Después de recibir el animal, la vista de detalle puede usar la información de ese animal:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Es decir, `AnimalDetailView` solo se encarga de mostrar el animal que se le pasa.

### Texto en negrita con Markdown

En la vista de detalle, escribimos este código:

```swift
Text("**Hábitat:** \(animal.habitat)")
```

Aquí hay dos puntos importantes.

Primero, `**Hábitat:**` usa la sintaxis de `Markdown`. El texto rodeado por dos asteriscos se mostrará en negrita.

Segundo, `\()` es interpolación de cadenas y permite mostrar el valor de una variable dentro del texto.

Este código significa que primero muestra `Hábitat:` en negrita y luego muestra el hábitat de este animal.

## Mostrar la vista de detalle en Sheet

Después de crear `AnimalDetailView`, podemos volver a `ContentView` y reemplazar la vista de nombre original del `Sheet` por la vista de detalle.

Antes era:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ahora cámbialo por:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Aquí, `animal:` es el nombre del parámetro de `AnimalDetailView`.

El `animal` posterior es el animal actual que pasa `.sheet(item:)`.

Es decir, pasa el animal tocado actualmente a `AnimalDetailView` para mostrarlo.

Estructura completa:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Cuando el usuario toca un animal:

```swift
selectedAnimal = animal
```

`selectedAnimal` cambia de `nil` a un animal concreto, y el `Sheet` detecta que `selectedAnimal` tiene un valor y presenta la vista.

El `Sheet` pasa el animal de `selectedAnimal` a la vista `AnimalDetailView`, y `AnimalDetailView` muestra los detalles del animal.

Así hemos implementado la función de tocar la lista de animales y mostrar los detalles correspondientes.

## Diferencia entre dos formas de escribir Sheet

Ahora ya hemos usado `.sheet(item:)` para completar la visualización de los detalles del animal.

Aquí podemos resumir brevemente dos formas comunes de escribir `Sheet`.

### La primera forma es vincular un valor booleano

```swift
@State private var showSheet = false

Button("Mostrar Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Esta forma de escribirlo es adecuada para presentar contenido fijo, como una página de ajustes, una página de explicación o una página de aviso.

`showSheet` es un valor booleano y solo tiene dos estados: `true` y `false`.

Cuando `showSheet` es `true`, se muestra el `Sheet`.

Cuando `showSheet` es `false`, no se muestra el `Sheet`.

### La segunda forma es vincular un valor opcional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Esta forma de escribirlo es adecuada para presentar contenido diferente según los datos seleccionados.

En esta lección, al tocar distintos animales necesitamos mostrar distintos detalles, por lo que usar `.sheet(item:)` es más adecuado.

## Código completo

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nombre del animal
    let name: String
    
    // Imagen del animal
    let imageName: String
    
    // Símbolo de etiqueta del animal
    let avatarEmoji: String
    
    // Área de distribución
    let distributionArea: String
    
    // Hábitat
    let habitat: String
    
    // Descripción del animal
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Delfín
        Animal(
            name: "Delfín",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Océanos cálidos y templados de todo el mundo.",
            habitat: "Océanos, aguas costeras y algunos ríos grandes.",
            animalDescription: "Los delfines son mamíferos marinos inteligentes. Viven en grupos, se comunican con sonidos y son conocidos por su comportamiento juguetón."
        ),
        // Jirafa
        Animal(
            name: "Jirafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sabanas y bosques abiertos de África.",
            habitat: "Praderas, sabanas y bosques abiertos.",
            animalDescription: "Las jirafas son los animales terrestres más altos. Tienen cuellos largos, patas largas y suelen alimentarse de hojas de árboles altos."
        ),
        // León
        Animal(
            name: "León",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Se encuentran principalmente en el África subsahariana, con una pequeña población en el oeste de la India.",
            habitat: "Praderas, sabanas y bosques abiertos.",
            animalDescription: "Los leones son grandes felinos poderosos. Suelen vivir en grupos llamados manadas y a menudo se les conoce como los reyes del mundo animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Bosques de montaña del centro de China.",
            habitat: "Bosques de bambú en zonas montañosas frescas y húmedas.",
            animalDescription: "Los pandas son osos conocidos por su pelaje blanco y negro. Se alimentan principalmente de bambú y son uno de los animales más reconocibles del mundo."
        ),
        // Oso polar
        Animal(
            name: "Oso polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regiones árticas alrededor del Polo Norte.",
            habitat: "Hielo marino, zonas costeras y entornos árticos fríos.",
            animalDescription: "Los osos polares son grandes osos adaptados a entornos fríos. Son buenos nadadores y dependen principalmente del hielo marino para cazar focas."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Área de distribución**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Hábitat**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Descripción del animal**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Resumen

En esta lección completamos una página sencilla de enciclopedia de animales.

Primero usamos la estructura `Animal` para guardar la información de los animales, después usamos un array para guardar cinco animales y luego usamos `ForEach` para mostrar la lista de animales.

Cuando el usuario toca un animal, guardamos ese animal en `selectedAnimal`:

```swift
selectedAnimal = animal
```

Cuando `selectedAnimal` tiene un valor, `.sheet(item:)` presenta la vista de detalle y pasa el animal seleccionado a `AnimalDetailView`.

Lo más importante de esta lección no es el estilo de la interfaz, sino entender esta ruta de transmisión de datos:

```swift
Tocar animal → selectedAnimal guarda el animal → aparece Sheet → AnimalDetailView muestra los detalles
```

Después de entender esta ruta, podrás crear más funciones similares, como detalles de productos, detalles de cursos, detalles de artículos o detalles de contactos.
