# Organizar los datos de animales

En la lección anterior, completamos un caso sencillo de enciclopedia de animales.

![view](../../../Resource/029_view.png)

Cuando el usuario toca un animal, la página muestra los detalles del animal mediante un `Sheet`.

Sin embargo, el código de la lección anterior tiene un problema: los datos de los animales están escritos directamente dentro de `ContentView`.

Por ejemplo:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Mostrar la lista de animales
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Este código puede ejecutarse correctamente, pero cuando los datos de animales aumentan, `ContentView` se volverá muy largo.

`ContentView` debería encargarse principalmente de mostrar la interfaz, pero ahora también guarda una gran cantidad de datos de animales. Esto afecta la legibilidad del código y también dificulta el mantenimiento posterior.

Por eso, en esta lección haremos una cosa:

Sacar los datos de animales de `ContentView`.

## ¿Por qué separar los datos?

En SwiftUI, el código de una vista suele encargarse de mostrar la interfaz.

Por ejemplo:

```swift
Text("Dolphin")
Image("dolphin")
```

Todo este código está relacionado con la visualización de la interfaz.

En cambio, los datos del animal, como el nombre, el nombre de la imagen, el área de distribución, el hábitat y el texto descriptivo, no forman parte de la estructura de la interfaz.

Se parecen más a un conjunto de información fija:

```swift
Animal(
    name: "Dolphin",
    imageName: "dolphin",
    avatarEmoji: "🐬",
    distributionArea: "Warm and temperate oceans around the world.",
    habitat: "Oceans, coastal waters, and some large rivers.",
    animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
),
// ...
```

Si escribimos juntos todo el código de la interfaz y el código de los datos, el código se volverá cada vez más desordenado.

Por eso, podemos colocar los datos de animales dentro del tipo `Animal`.

## Usar static para guardar datos fijos

Primero veamos la forma organizada:

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
    
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Aquí se añadió una nueva línea de código:

```swift
static let animals: [Animal] = [
    
]
```

`static` indica una propiedad estática.

Una propiedad estática pertenece al tipo en sí, no a una instancia concreta.

Esta frase es un poco abstracta, así que podemos entenderla con un ejemplo sencillo.

## Propiedades normales y propiedades estáticas

Por ejemplo, definimos un `Student`:

```swift
struct Student {
    let name: String
}
```

Aquí, `name` es una propiedad normal. Una propiedad normal pertenece a una instancia concreta.

Si queremos acceder a `name`, primero debemos crear un estudiante concreto:

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Aquí, `student` es una instancia. También puedes entenderlo primero como un dato concreto de estudiante.

Como cada estudiante puede tener un nombre diferente, `name` debe estar en un estudiante concreto.

Pero algunos datos no pertenecen a una instancia concreta.

Por ejemplo, queremos preparar un conjunto de datos de ejemplo para previsualización:

```swift
struct Student {
    let name: String
    
    static let previewStudents: [Student] = [
        Student(name: "Fang Junyu"),
        Student(name: "Sam"),
        Student(name: "Bob")
    ]
}
```

Aquí, `previewStudents` tiene `static` delante, por lo que es una propiedad estática.

Una propiedad estática no pertenece a un estudiante, sino al propio tipo `Student`.

Por lo tanto, no necesitamos crear primero un estudiante concreto. Podemos acceder directamente a ella mediante el nombre del tipo:

```swift
print(Student.previewStudents.count)    // 3
```

La forma de acceso aquí es:

```swift
NombreDelTipo.nombreDeLaPropiedadEstatica
```

Es decir:

```swift
Student.previewStudents
```

Del mismo modo, en la enciclopedia de animales, podemos acceder a los datos de animales así:

```swift
Animal.animals
```

## Volver a ContentView

Ahora, los datos de animales ya se han guardado en el tipo `Animal`.

Por eso, ya no necesitamos escribir un arreglo de animales muy largo dentro de `ContentView`.

Podemos cambiarlo a:

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Mostrar la lista de animales
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Esta línea de código significa:

```swift
let animals = Animal.animals
```

Tomar el conjunto de datos de animales `animals` desde el tipo `Animal` y guardarlo en la constante `animals` de la vista actual.

Después de escribirlo de esta manera, `ContentView` será más conciso.

`ContentView` se encarga de mostrar la interfaz, y `Animal.animals` se encarga de proporcionar los datos de animales.

## Separar Animal en un archivo independiente

En la lección anterior, para que el caso fuera más fácil de entender, escribimos `Animal` y `ContentView` en el mismo archivo.

Como en ese momento el código todavía era relativamente corto, escribirlo así no era un problema.

Pero ahora los datos de animales son cada vez más abundantes. Si seguimos escribiendo todo el código dentro de `ContentView.swift`, el archivo se volverá muy largo y también será más difícil de leer.

Por eso, podemos colocar `Animal` en un nuevo archivo Swift independiente.

En Xcode, puedes crear un nuevo archivo Swift, por ejemplo:

```swift
Animal.swift
```

Luego mueve la estructura `Animal` a este archivo:

```swift
import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String

    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Después de organizarlo así:

`ContentView.swift` se encarga de mostrar la interfaz.

`Animal.swift` se encarga de describir la estructura de los datos de animales.

Aunque estén en archivos diferentes, siempre que estén en el mismo proyecto, `ContentView` todavía puede usar `Animal` directamente.

Por ejemplo:

```swift
let animals = Animal.animals
```

Aquí no es necesario importar `Animal.swift` adicionalmente en `ContentView.swift`.

Swift reconoce automáticamente los archivos Swift del mismo proyecto.

## Usar extension para seguir organizando el código

Ahora, ya hemos movido los datos de animales desde `ContentView` hasta `Animal`.

Sin embargo, la estructura `Animal` todavía contiene dos tipos de código al mismo tiempo:

El primer tipo son las propiedades del propio modelo de animal:

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

El segundo tipo son los datos fijos de animales:

```swift
static let animals: [Animal] = [
    // ...
]
```

Para que la estructura del código sea más clara, podemos usar `extension` para separar estas dos partes.

`extension` significa extensión.

Permite seguir agregando código nuevo sobre la base de un tipo existente.

Por ejemplo:

```swift
extension Animal {
    
}
```

Esto indica que estamos extendiendo el tipo `Animal`.

## Colocar los datos de animales en una extension

Podemos cambiar `Animal` de esta manera:

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

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // ...
    ]
}
```

Después de organizarlo así, la estructura del código será más clara.

`struct Animal` se encarga de describir qué propiedades debe tener un animal.

`extension Animal` se encarga de guardar un conjunto de datos fijos de animales.

Ten en cuenta que, aunque `animals` se haya movido a `extension Animal`, la forma de usarlo no cambia.

Todavía podemos usarlo así:

```swift
let animals = Animal.animals
```

Esta también es una característica de `extension`: solo nos ayuda a organizar el código y no cambia la forma de llamarlo desde fuera.

## Cuando hay muchos datos, se puede crear otro archivo AnimalData

Ahora, ya hemos colocado `Animal` en el archivo independiente `Animal.swift`.

Si hay pocos datos de animales, puedes escribir `extension Animal` directamente en `Animal.swift`.

Pero si los datos de animales son cada vez más numerosos, también puedes crear otro archivo, por ejemplo:

```swift
AnimalData.swift
```

Luego coloca los datos fijos de animales dentro:

```swift
extension Animal {
    static let animals: [Animal] = [
        // Datos de animales
    ]
}
```

Después de hacerlo, la división de responsabilidades del código será más clara:

`Animal.swift` solo se encarga de definir el modelo de animal.

`AnimalData.swift` solo se encarga de guardar los datos de animales.

`ContentView.swift` solo se encarga de mostrar la interfaz.

La responsabilidad de cada archivo queda más clara.

Ten en cuenta que `AnimalData.swift` es solo el nombre del archivo, no un nuevo tipo de Swift. En este archivo todavía estamos usando `extension Animal` para agregar datos fijos a `Animal`.

## Código completo

A continuación se muestra el código organizado de `Animal.swift`:

```swift
import Foundation

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

Código organizado de `AnimalData.swift`:

```swift
import Foundation

extension Animal {
    static let animals: [Animal] = [
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
}
```

En `ContentView.swift`, se puede usar así:

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
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
```

Consejo: En los archivos `Animal.swift` y `AnimalData.swift`, la primera línea es:

```swift
import Foundation
```

Antes, cuando escribíamos interfaces SwiftUI, usábamos a menudo:

```swift
import SwiftUI
```

Esto se debe a que `ContentView`, `Text`, `Button` y `Color` están relacionados con la interfaz, por lo que al escribir archivos de interfaz normalmente necesitamos importar SwiftUI.

Pero aquí, `Animal.swift` y `AnimalData.swift` no son archivos de interfaz. Se usan principalmente para definir el modelo de animal y guardar los datos de animales.

En este código, `UUID()` necesita usar `Foundation`, por lo que basta con importar `Foundation`.

## Resumen

En esta lección hicimos principalmente una cosa: sacar los datos de animales de `ContentView`.

La forma original era escribir los datos de animales directamente dentro de `ContentView`. Así el código puede ejecutarse, pero cuando los datos aumentan, el archivo de la vista se vuelve cada vez más largo.

Después de organizarlo, `ContentView` solo se encarga de mostrar la interfaz, y `Animal.animals` se encarga de proporcionar los datos de animales.

En esta lección también aprendimos dos conocimientos nuevos.

El primero es `static`.

`static` indica una propiedad estática. Una propiedad estática pertenece al tipo en sí y se puede acceder directamente a ella mediante “NombreDelTipo.nombreDePropiedad”.

Por ejemplo:

```swift
Animal.animals
```

El segundo es `extension`.

`extension` significa extensión. Permite dividir el código de un mismo tipo en diferentes partes, haciendo que la estructura del código sea más clara.

En este caso, usamos `extension Animal` para guardar los datos de animales, lo que hace que la estructura `Animal` sea más concisa.

Además, `Animal` guarda principalmente un modelo de datos y no escribe directamente una interfaz SwiftUI, por lo que aquí usamos `import Foundation`.

El objetivo de esta lección no es hacer que el código sea más complejo, sino que sea más fácil de leer y mantener.
