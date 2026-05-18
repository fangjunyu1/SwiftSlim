# Organiser les données des animaux

Dans la leçon précédente, nous avons terminé un exemple simple d’encyclopédie des animaux.

![view](../../../Resource/029_view.png)

Quand l’utilisateur touche un animal, la page affiche les détails de l’animal avec un `Sheet`.

Cependant, le code de la leçon précédente présente un problème : les données des animaux sont écrites directement dans `ContentView`.

Par exemple :

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
            // Afficher la liste des animaux
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Ce code peut fonctionner normalement, mais quand les données des animaux deviennent de plus en plus nombreuses, `ContentView` devient très long.

`ContentView` devrait principalement être responsable de l’affichage de l’interface, mais il stocke maintenant aussi une grande quantité de données d’animaux. Cela affecte la lisibilité du code et rend la maintenance ultérieure moins pratique.

Par conséquent, dans cette leçon, nous allons faire une chose :

Déplacer les données des animaux hors de `ContentView`.

## Pourquoi séparer les données ?

Dans SwiftUI, le code de vue est généralement responsable de l’affichage de l’interface.

Par exemple :

```swift
Text("Dolphin")
Image("dolphin")
```

Ces morceaux de code sont tous liés à l’affichage de l’interface.

Les données des animaux elles-mêmes, comme le nom de l’animal, le nom de l’image, la zone de répartition, l’habitat et le texte de description, ne sont pas la structure de l’interface.

Elles ressemblent plutôt à un ensemble d’informations fixes :

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

Si le code de l’interface et le code des données sont tous écrits ensemble, le code devient de plus en plus désordonné.

Nous pouvons donc placer les données des animaux dans le type `Animal`.

## Utiliser static pour stocker des données fixes

Regardons d’abord l’écriture après organisation :

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

Ici, une nouvelle ligne de code a été ajoutée :

```swift
static let animals: [Animal] = [
    
]
```

`static` signifie propriété statique.

Une propriété statique appartient au type lui-même. Elle n’appartient pas à une instance précise.

Cette phrase est assez abstraite, nous pouvons donc la comprendre avec un exemple simple.

## Propriétés ordinaires et propriétés statiques

Par exemple, nous définissons un `Student` :

```swift
struct Student {
    let name: String
}
```

Ici, `name` est une propriété ordinaire. Une propriété ordinaire appartient à une instance précise.

Si nous voulons accéder à `name`, nous devons d’abord créer un étudiant précis :

```swift
let student = Student(name: "Fang Junyu")

print(student.name) // Fang Junyu
```

Ici, `student` est une instance. Pour l’instant, vous pouvez aussi le comprendre comme une donnée d’étudiant concrète.

Comme chaque étudiant peut avoir un nom différent, `name` doit être placé sur un étudiant précis.

Cependant, certaines données n’appartiennent pas à une instance précise.

Par exemple, nous voulons préparer un groupe de données d’exemple pour les aperçus :

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

Ici, `previewStudents` est précédé de `static`, donc c’est une propriété statique.

Une propriété statique n’appartient pas à un étudiant. Elle appartient au type `Student` lui-même.

Par conséquent, nous n’avons pas besoin de créer d’abord un étudiant. Nous pouvons y accéder directement avec le nom du type :

```swift
print(Student.previewStudents.count)    // 3
```

La méthode d’accès ici est :

```swift
NomDuType.nomDeLaProprieteStatique
```

C’est-à-dire :

```swift
Student.previewStudents
```

De la même manière, dans l’encyclopédie des animaux, nous pouvons accéder aux données des animaux ainsi :

```swift
Animal.animals
```

## Revenir à ContentView

Maintenant, les données des animaux ont été enregistrées dans le type `Animal`.

Donc, dans `ContentView`, nous n’avons plus besoin d’écrire un très long tableau d’animaux.

Nous pouvons le modifier ainsi :

```swift
struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Afficher la liste des animaux
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Cette ligne de code signifie :

```swift
let animals = Animal.animals
```

Prendre depuis le type `Animal` ce groupe de données animales `animals`, puis l’enregistrer dans la constante `animals` de la vue actuelle.

Après cette écriture, `ContentView` devient plus concis.

`ContentView` est responsable de l’affichage de l’interface, et `Animal.animals` est responsable de fournir les données des animaux.

## Déplacer Animal dans un fichier séparé

Dans la leçon précédente, pour rendre l’exemple plus facile à comprendre, nous avons écrit `Animal` et `ContentView` dans le même fichier.

Comme le code était encore relativement court à ce moment-là, cette écriture ne posait pas de problème.

Mais maintenant, les données des animaux deviennent de plus en plus nombreuses. Si nous continuons à mettre tout le code dans `ContentView.swift`, le fichier deviendra très long et moins facile à lire.

Nous pouvons donc placer `Animal` seul dans un nouveau fichier Swift.

Dans Xcode, vous pouvez créer un nouveau fichier Swift, par exemple :

```swift
Animal.swift
```

Puis déplacer la structure `Animal` dans ce fichier :

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

Après cette organisation :

`ContentView.swift` est responsable de l’affichage de l’interface.

`Animal.swift` est responsable de décrire la structure des données d’un animal.

Même s’ils sont placés dans des fichiers différents, tant qu’ils sont dans le même projet, `ContentView` peut toujours utiliser directement `Animal`.

Par exemple :

```swift
let animals = Animal.animals
```

Ici, il n’est pas nécessaire d’importer en plus `Animal.swift` dans `ContentView.swift`.

Swift reconnaît automatiquement les fichiers Swift du même projet.

## Utiliser extension pour continuer à organiser le code

Maintenant, nous avons déplacé les données des animaux de `ContentView` vers `Animal`.

Cependant, la structure `Animal` contient encore simultanément deux types de code :

Le premier type correspond aux propriétés du modèle animal lui-même :

```swift
let id = UUID()
let name: String
let imageName: String
let avatarEmoji: String
let distributionArea: String
let habitat: String
let animalDescription: String
```

Le second type correspond aux données fixes des animaux :

```swift
static let animals: [Animal] = [
    // ...
]
```

Pour rendre la structure du code plus claire, nous pouvons utiliser `extension` pour séparer ces deux parties.

`extension` signifie extension.

Elle permet d’ajouter du nouveau code sur la base d’un type existant.

Par exemple :

```swift
extension Animal {
    
}
```

Cela signifie que nous sommes en train d’étendre le type `Animal`.

## Placer les données des animaux dans une extension

Nous pouvons modifier `Animal` ainsi :

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

Après cette organisation, la structure du code devient plus claire.

`struct Animal` est responsable de décrire quelles propriétés un animal doit avoir.

`extension Animal` est responsable de stocker un ensemble de données fixes d’animaux.

Attention : même si `animals` a été déplacé dans `extension Animal`, la manière de l’utiliser ne change pas.

Nous pouvons toujours l’utiliser ainsi :

```swift
let animals = Animal.animals
```

C’est aussi une caractéristique de `extension` : elle nous aide seulement à organiser le code et ne change pas la manière d’appeler le code depuis l’extérieur.

## Quand les données sont nombreuses, vous pouvez créer un autre fichier AnimalData

Maintenant, nous avons placé `Animal` dans un fichier séparé `Animal.swift`.

Si les données des animaux sont peu nombreuses, vous pouvez écrire directement `extension Animal` dans `Animal.swift`.

Mais si les données des animaux deviennent de plus en plus nombreuses, vous pouvez aussi créer un autre fichier, par exemple :

```swift
AnimalData.swift
```

Puis y placer les données fixes des animaux :

```swift
extension Animal {
    static let animals: [Animal] = [
        // Données des animaux
    ]
}
```

Après cela, la répartition des responsabilités du code devient plus claire :

`Animal.swift` est seulement responsable de définir le modèle animal.

`AnimalData.swift` est seulement responsable de stocker les données des animaux.

`ContentView.swift` est seulement responsable de l’affichage de l’interface.

La responsabilité de chaque fichier est plus claire.

Attention : `AnimalData.swift` est seulement un nom de fichier, ce n’est pas un nouveau type Swift. Dans ce fichier, nous utilisons toujours `extension Animal` pour ajouter des données fixes à `Animal`.

## Code complet

Voici le code `Animal.swift` après organisation :

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

Code `AnimalData.swift` après organisation :

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

Dans `ContentView.swift`, vous pouvez l’utiliser ainsi :

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

Astuce : dans les fichiers `Animal.swift` et `AnimalData.swift`, la première ligne est :

```swift
import Foundation
```

Auparavant, lorsque nous écrivions des interfaces SwiftUI, nous utilisions souvent :

```swift
import SwiftUI
```

C’est parce que `ContentView`, `Text`, `Button` et `Color` sont tous liés à l’interface. Lorsque nous écrivons des fichiers d’interface, nous devons donc généralement importer SwiftUI.

Mais ici, `Animal.swift` et `AnimalData.swift` ne sont pas des fichiers d’interface. Ils servent principalement à définir le modèle animal et à stocker les données des animaux.

Dans ce code, `UUID()` a besoin de `Foundation`, donc importer `Foundation` suffit.

## Résumé

Dans cette leçon, nous avons principalement fait une chose : déplacer les données des animaux hors de `ContentView`.

L’écriture originale consistait à écrire directement les données des animaux dans `ContentView`. Ce code peut fonctionner, mais quand les données deviennent plus nombreuses, le fichier de vue devient de plus en plus long.

Après organisation, `ContentView` est seulement responsable de l’affichage de l’interface, et `Animal.animals` est responsable de fournir les données des animaux.

Cette leçon a aussi présenté deux nouvelles connaissances.

La première est `static`.

`static` signifie propriété statique. Une propriété statique appartient au type lui-même et peut être consultée directement avec la forme « NomDuType.nomDeLaPropriete ».

Par exemple :

```swift
Animal.animals
```

La seconde est `extension`.

`extension` signifie extension. Elle permet de séparer le code d’un même type en plusieurs parties, ce qui rend la structure du code plus claire.

Dans cet exemple, nous utilisons `extension Animal` pour stocker les données des animaux, ce qui rend la structure `Animal` elle-même plus concise.

De plus, `Animal` stocke principalement un modèle de données et n’écrit pas directement une interface SwiftUI. Nous utilisons donc ici `import Foundation`.

Le point essentiel de cette leçon n’est pas de rendre le code plus compliqué, mais de rendre le code plus facile à lire et à maintenir.
