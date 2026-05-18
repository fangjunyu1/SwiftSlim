# Encyclopédie des animaux 

Dans cette leçon, nous continuons à nous exercer avec les vues personnalisées et le passage de données.

Nous allons créer une vue simple d'encyclopédie des animaux. La page affichera cinq animaux. Lorsque l'utilisateur touche un animal, une vue de détail apparaîtra pour afficher l'image, la zone de répartition, l'habitat et la description de cet animal.

Résultat attendu :

![view](../../../Resource/029_view.png)

Avec cet exemple, nous pouvons nous entraîner à faire fonctionner ensemble une structure de données, l'affichage d'une liste, l'interaction au toucher et une vue contextuelle Sheet.

## Préparer les images

Tout d'abord, nous devons préparer cinq images d'animaux :

- Dauphin : `dolphin.jpg`
- Girafe : `giraffe.jpg`
- Lion : `lion.jpg`
- Panda : `panda.jpg`
- Ours polaire : `polarBear.jpg`

Vous pouvez utiliser les images suivantes :

[Dauphin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Girafe](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lion](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Ours polaire](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Après avoir téléchargé les images, faites-les glisser dans le dossier de ressources `Assets` du projet Xcode.

![assets](../../../Resource/029_assets.png)

Il faut noter que, lorsque vous utilisez une image dans le code, vous n'avez généralement pas besoin d'écrire le suffixe `.jpg`.

Par exemple, si le nom de la ressource image est `dolphin`, écrivez simplement ceci dans le code :

```swift
Image("dolphin")
```

Si le nom de l'image est mal écrit, l'image ne pourra pas s'afficher correctement.

Remarque : les images ci-dessus proviennent de projets Wikimedia. Lors de leur utilisation, il est recommandé de conserver les liens originaux et les informations de source.

## Créer la structure Animal

Dans cette page, chaque animal possède plusieurs informations :

- Nom de l'animal
- Image de l'animal
- Emoji de l'animal
- Zone de répartition
- Habitat
- Description de l'animal

Si nous séparons ces informations dans de nombreuses variables, le code deviendra plus confus. Nous pouvons donc créer une structure `Animal` pour regrouper les informations d'un animal.

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

Dans ce code :

- `id` : l'identifiant unique de l'animal.
- `name` : le nom de l'animal.
- `imageName` : le nom de l'image de l'animal.
- `avatarEmoji` : l'emoji de l'animal.
- `distributionArea` : la zone de répartition.
- `habitat` : l'habitat.
- `animalDescription` : la description de l'animal.

Ici :

```swift
let id = UUID()
```

`id` sert à identifier chaque animal. Plus tard, nous utiliserons `ForEach` pour afficher la liste des animaux, et nous utiliserons aussi `.sheet(item:)` pour afficher les détails selon l'animal sélectionné. Il faut donc que `Animal` adopte le protocole `Identifiable`.

Le rôle de `Identifiable` est d'indiquer à SwiftUI que chaque animal possède un `id` permettant de le distinguer.

## Créer les données des animaux

Ensuite, nous créons un tableau d'animaux dans `ContentView`.

Ce tableau contient cinq `Animal`, et chaque `Animal` représente un animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dauphin
        Animal(
            name: "Dauphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Océans chauds et tempérés du monde entier.",
            habitat: "Océans, eaux côtières et certaines grandes rivières.",
            animalDescription: "Les dauphins sont des mammifères marins intelligents. Ils vivent en groupes, communiquent par des sons et sont connus pour leur comportement joueur."
        ),
        // Girafe
        Animal(
            name: "Girafe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanes et boisements ouverts en Afrique.",
            habitat: "Prairies, savanes et forêts ouvertes.",
            animalDescription: "Les girafes sont les plus grands animaux terrestres. Elles ont un long cou, de longues pattes et se nourrissent généralement de feuilles dans les grands arbres."
        ),
        // Lion
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Principalement présent en Afrique subsaharienne, avec une petite population dans l'ouest de l'Inde.",
            habitat: "Prairies, savanes et boisements ouverts.",
            animalDescription: "Les lions sont de puissants grands félins. Ils vivent généralement en groupes appelés hardes et sont souvent connus comme les rois du monde animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Forêts de montagne du centre de la Chine.",
            habitat: "Forêts de bambous dans des zones montagneuses fraîches et humides.",
            animalDescription: "Les pandas sont des ours connus pour leur fourrure noire et blanche. Ils mangent principalement du bambou et font partie des animaux les plus reconnaissables au monde."
        ),
        // Ours polaire
        Animal(
            name: "Ours polaire",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Régions arctiques autour du pôle Nord.",
            habitat: "Banquise, zones côtières et environnements arctiques froids.",
            animalDescription: "Les ours polaires sont de grands ours adaptés aux environnements froids. Ce sont de bons nageurs et ils dépendent principalement de la banquise pour chasser les phoques."
        )
    ]

    var body: some View {
        Text("Encyclopédie des animaux")
    }
}
```

Ici, `animals` est un tableau :

```swift
let animals: [Animal]
```

`[Animal]` signifie que ce tableau contient plusieurs `Animal`.

Autrement dit, `animals` n'est pas un seul animal, mais un groupe d'animaux.

## Afficher la liste des animaux

Nous pouvons maintenant utiliser `ForEach` pour afficher la liste des animaux.

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

Résultat affiché :

![view](../../../Resource/029_view1.png)

Dans ce code :

```swift
ForEach(animals) { animal in
    ...
}
```

Cela signifie parcourir le tableau `animals`.

À chaque boucle, `animal` représente l'animal actuellement affiché.

Par exemple, lors de la première boucle, `animal` est le dauphin ; lors de la deuxième boucle, `animal` est la girafe.

Nous pouvons donc afficher les informations de l'animal actuel de la manière suivante :

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Ainsi, les cinq animaux peuvent être affichés.

## Rendre la liste des animaux cliquable

La liste est maintenant affichée, mais elle ne peut pas encore être touchée.

Si nous voulons afficher les détails après avoir touché un animal, nous devons d'abord enregistrer « l'animal actuellement sélectionné ».

Ajoutez donc une variable d'état dans `ContentView` :

```swift
@State private var selectedAnimal: Animal? = nil
```

Ici, `selectedAnimal` est une valeur optionnelle de type `Animal?`.

Cela signifie qu'elle peut contenir un animal, ou ne contenir aucun animal.

Sa valeur par défaut est `nil`, ce qui signifie qu'aucun animal n'est sélectionné au départ.

Ensuite, nous transformons chaque ligne d'animal en `Button` :

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

Le point important est cette ligne de code :

```swift
selectedAnimal = animal
```

Lorsque l'utilisateur touche un animal, nous enregistrons cet animal dans `selectedAnimal`.

Par exemple, si l'utilisateur touche le dauphin, `selectedAnimal` contient le dauphin.

Si l'utilisateur touche le panda, `selectedAnimal` contient le panda.

Autrement dit, `selectedAnimal` sert à enregistrer l'animal actuellement touché par l'utilisateur.

## Vue contextuelle Sheet

Nous pouvons maintenant enregistrer « l'animal actuellement touché » avec le bouton.

Ensuite, nous devons créer une vue contextuelle pour afficher les détails de l'animal.

![view](../../../Resource/029_view2.png)

Dans SwiftUI, vous pouvez utiliser `Sheet` pour réaliser cet effet d'apparition.

`Sheet` peut être compris comme une page temporaire qui apparaît. Elle s'affiche au-dessus de la page actuelle, et l'utilisateur peut la fermer en la faisant glisser vers le bas après avoir consulté son contenu.

## Exemple de Sheet

Avant d'afficher réellement les détails d'un animal, utilisons d'abord un exemple simple pour comprendre comment un `Sheet` apparaît.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Afficher le Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Vue Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Résultat affiché :

![view](../../../Resource/029_view3.png)

Dans ce code, nous créons une valeur booléenne :

```swift
@State private var showSheet = false
```

Par défaut, `showSheet` vaut `false`, ce qui signifie que le `Sheet` n'est pas affiché au départ.

Lorsque le bouton est touché :

```swift
showSheet.toggle()
```

`toggle()` signifie inverser la valeur booléenne.

Si la valeur d'origine est `false`, elle devient `true` après l'appel de `toggle()`.

Si la valeur d'origine est `true`, elle devient `false` après l'appel de `toggle()`.

Donc, après avoir touché le bouton, `showSheet` passe de `false` à `true`.

Lorsque `showSheet` devient `true`, le code suivant affiche le `Sheet` :

```swift
.sheet(isPresented: $showSheet) {
    Text("Vue Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ce code signifie : lorsque `showSheet` vaut `true`, afficher un `Sheet`, et afficher `Text("Vue Sheet")` dans ce `Sheet`.

Résultat affiché :

![view](../../../Resource/029_view4.png)

Cette écriture convient pour afficher un contenu fixe.

Par exemple, après avoir touché un bouton, afficher une page de réglages, une page d'explication, une page de message, etc.

### Emplacement de Sheet

Même si `Sheet` est une vue contextuelle, dans SwiftUI, elle ne s'écrit pas directement comme une vue indépendante telle que `Text()` ou `Image()`. Elle s'utilise comme un modificateur de vue.

Autrement dit, `.sheet(...)` est similaire à `.font()`, `.padding()` ou `.shadow()` : il doit être ajouté après une vue.

Par exemple :

```swift
Button("Afficher le Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vue Sheet")
}
```

Dans cet exemple, `.sheet` est ajouté après `Button`.

Lorsque `showSheet` devient `true`, SwiftUI affiche le `Sheet` et montre le contenu placé entre les accolades :

```swift
Text("Vue Sheet")
```

Cependant, dans un développement réel, si une page contient plusieurs boutons, on n'ajoute généralement pas un `.sheet` à chaque bouton.

La pratique la plus courante consiste à ajouter `.sheet` après la vue extérieure.

Par exemple :

```swift
VStack {
    Button("Afficher le Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Vue Sheet")
}
```

Le bouton est responsable de modifier `showSheet`, et la vue extérieure est responsable d'afficher le `Sheet` selon que `showSheet` vaut `true` ou non.

## Sheet lié à une valeur optionnelle

L'écriture que nous avons apprise précédemment est :

```swift
.sheet(isPresented: $showSheet) {
    Text("Vue Sheet")
}
```

Cette écriture convient pour contrôler l'affichage et la fermeture d'une page fixe.

Mais dans le cas de l'encyclopédie des animaux, nous ne voulons pas seulement savoir « faut-il afficher le `Sheet` », nous voulons aussi savoir « quel animal a été touché ».

Par exemple :

Si l'utilisateur touche le dauphin, le `Sheet` doit afficher les détails du dauphin.

Si l'utilisateur touche le panda, le `Sheet` doit afficher les détails du panda.

Il est donc plus adapté d'utiliser une autre écriture de Sheet :

```swift
.sheet(item: $selectedAnimal) { animal in
    // Contenu affiché dans le Sheet
}
```

Dans ce code, le `Sheet` est lié à une valeur optionnelle `selectedAnimal`.

Il faut noter que, après `item:`, on écrit `$selectedAnimal`, et non `selectedAnimal`.

En effet, `Sheet` ne se contente pas de lire la valeur de `selectedAnimal` ; il doit aussi décider s'il doit apparaître selon ses changements.

On peut comprendre ce code ainsi :

- Quand `selectedAnimal` vaut `nil`, le `Sheet` n'est pas affiché.
- Quand `selectedAnimal` possède une valeur, le `Sheet` est affiché.
- Quand le `Sheet` est fermé, SwiftUI remet automatiquement `selectedAnimal` à `nil`.

SwiftUI transmettra l'animal enregistré dans `selectedAnimal` au paramètre `animal` placé entre les accolades.

Autrement dit, `.sheet(item:)` ne sert pas seulement à contrôler l'apparition : il transmet aussi les données sélectionnées dans le `Sheet`.

## Utiliser Sheet pour afficher le nom de l'animal

Maintenant, ne créons pas tout de suite une vue de détail complexe.

Pour rendre le code plus facile à comprendre, affichons d'abord le nom de l'animal actuel dans le `Sheet`.

Ajoutez `.sheet(item:)` à l'extérieur du `VStack` :

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

Le plus important est ce code :

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Lorsque `selectedAnimal` possède une valeur, le `Sheet` apparaît.

Le `animal` entre les accolades est l'animal actuellement sélectionné.

Donc :

```swift
Text(animal.name)
```

affiche le nom de l'animal actuellement touché.

Par exemple, touchez `Dauphin` : le Sheet affiche `Dauphin`.

Touchez `Panda` : le `Sheet` affiche `Panda`.

Ainsi, nous obtenons l'effet suivant : toucher différents animaux affiche différents noms d'animaux dans le Sheet.

Afficher le nom de l'animal :

![view](../../../Resource/029_view5.png)

Cependant, les détails d'un animal ne doivent pas afficher seulement un nom. Ils doivent aussi afficher le nom, la zone de répartition, l'habitat et la description.

Si nous écrivons tout ce code dans `.sheet`, le code deviendra très long et difficile à lire.

Nous allons donc créer une nouvelle vue personnalisée, spécialement chargée d'afficher les détails d'un animal.

## Créer la vue de détail de l'animal

Ensuite, nous créons une nouvelle vue personnalisée `AnimalDetailView`.

Cette vue reçoit un `Animal` et affiche les détails de l'animal.

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
                    Text("**Zone de répartition** : \(animal.distributionArea)")

                    Divider()

                    Text("**Habitat** : \(animal.habitat)")

                    Divider()

                    Text("**Description de l'animal** : \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Résultat affiché :

![view](../../../Resource/029_view2.png)

Le point important ici est :

```swift
var animal: Animal
```

Cela signifie que `AnimalDetailView` doit recevoir un animal depuis l'extérieur.

Après avoir reçu l'animal, la vue de détail peut utiliser les différentes informations de cet animal :

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

Autrement dit, `AnimalDetailView` est uniquement responsable d'afficher l'animal qui lui est transmis.

### Texte en gras avec Markdown

Dans la vue de détail, nous avons écrit ce code :

```swift
Text("**Habitat:** \(animal.habitat)")
```

Il y a ici deux points à connaître.

Premièrement, `**Habitat:**` utilise la syntaxe `Markdown`. Le texte entouré de deux astérisques sera affiché en gras.

Deuxièmement, `\()` est une interpolation de chaîne. Elle permet d'afficher la valeur d'une variable dans un texte.

Ce code signifie : afficher d'abord `Habitat:` en gras, puis afficher l'habitat de cet animal.

## Afficher la vue de détail dans le Sheet

Après avoir créé `AnimalDetailView`, nous pouvons revenir à `ContentView` et remplacer la vue de nom initiale dans le `Sheet` par la vue de détail.

Au départ, nous avions :

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Nous la remplaçons maintenant par :

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Ici, `animal:` est le nom du paramètre de `AnimalDetailView`.

Le `animal` placé après est l'animal actuel transmis par `.sheet(item:)`.

Autrement dit, l'animal actuellement touché est transmis à `AnimalDetailView` pour être affiché.

Structure complète :

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

Lorsque l'utilisateur touche un animal :

```swift
selectedAnimal = animal
```

`selectedAnimal` passe de `nil` à un animal précis. Le `Sheet` détecte que `selectedAnimal` possède une valeur, puis affiche la vue.

Le `Sheet` transmet l'animal contenu dans `selectedAnimal` à la vue `AnimalDetailView`, et `AnimalDetailView` affiche les détails de l'animal.

Ainsi, nous avons réalisé la fonction suivante : toucher la liste des animaux affiche les détails de l'animal correspondant.

## Différence entre les deux écritures de Sheet

Maintenant, nous avons utilisé `.sheet(item:)` pour afficher la vue de détail de l'animal.

Nous pouvons simplement résumer les deux écritures courantes de `Sheet`.

### La première consiste à lier une valeur booléenne

```swift
@State private var showSheet = false

Button("Afficher le Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vue Sheet")
}
```

Cette écriture convient pour afficher un contenu fixe, par exemple une page de réglages, une page d'explication, une page de message, etc.

`showSheet` est une valeur booléenne, qui n'a que deux états : `true` et `false`.

Quand `showSheet` vaut `true`, le `Sheet` s'affiche.

Quand `showSheet` vaut `false`, le `Sheet` ne s'affiche pas.

### La deuxième consiste à lier une valeur optionnelle

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Cette écriture convient pour afficher des contenus différents selon les données sélectionnées.

Dans cette leçon, nous touchons différents animaux et devons afficher différents détails. L'utilisation de `.sheet(item:)` est donc plus adaptée.

## Code complet

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nom de l'animal
    let name: String
    
    // Image de l'animal
    let imageName: String
    
    // Emoji de l'animal
    let avatarEmoji: String
    
    // Zone de répartition
    let distributionArea: String
    
    // Habitat
    let habitat: String
    
    // Description de l'animal
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dauphin
        Animal(
            name: "Dauphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Océans chauds et tempérés du monde entier.",
            habitat: "Océans, eaux côtières et certaines grandes rivières.",
            animalDescription: "Les dauphins sont des mammifères marins intelligents. Ils vivent en groupes, communiquent par des sons et sont connus pour leur comportement joueur."
        ),
        // Girafe
        Animal(
            name: "Girafe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savanes et boisements ouverts en Afrique.",
            habitat: "Prairies, savanes et forêts ouvertes.",
            animalDescription: "Les girafes sont les plus grands animaux terrestres. Elles ont un long cou, de longues pattes et se nourrissent généralement de feuilles dans les grands arbres."
        ),
        // Lion
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Principalement présent en Afrique subsaharienne, avec une petite population dans l'ouest de l'Inde.",
            habitat: "Prairies, savanes et boisements ouverts.",
            animalDescription: "Les lions sont de puissants grands félins. Ils vivent généralement en groupes appelés hardes et sont souvent connus comme les rois du monde animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Forêts de montagne du centre de la Chine.",
            habitat: "Forêts de bambous dans des zones montagneuses fraîches et humides.",
            animalDescription: "Les pandas sont des ours connus pour leur fourrure noire et blanche. Ils mangent principalement du bambou et font partie des animaux les plus reconnaissables au monde."
        ),
        // Ours polaire
        Animal(
            name: "Ours polaire",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Régions arctiques autour du pôle Nord.",
            habitat: "Banquise, zones côtières et environnements arctiques froids.",
            animalDescription: "Les ours polaires sont de grands ours adaptés aux environnements froids. Ce sont de bons nageurs et ils dépendent principalement de la banquise pour chasser les phoques."
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
                    Text("**Zone de répartition** : \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat** : \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Description de l'animal** : \(animal.animalDescription)")
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

## Résumé

Dans cette leçon, nous avons créé une page simple d'encyclopédie des animaux.

Nous avons d'abord utilisé la structure `Animal` pour enregistrer les informations des animaux, puis un tableau pour enregistrer cinq animaux, et enfin `ForEach` pour afficher la liste des animaux.

Lorsque l'utilisateur touche un animal, nous enregistrons cet animal dans `selectedAnimal` :

```swift
selectedAnimal = animal
```

Lorsque `selectedAnimal` possède une valeur, `.sheet(item:)` affiche la vue de détail et transmet l'animal sélectionné à `AnimalDetailView`.

Le plus important dans cette leçon n'est pas le style de l'interface, mais la compréhension du parcours de transmission des données suivant :

```swift
Toucher un animal → selectedAnimal enregistre l'animal → le Sheet apparaît → AnimalDetailView affiche les détails
```

Après avoir compris ce parcours, vous pourrez créer davantage de fonctions similaires, par exemple des détails de produits, des détails de cours, des détails d'articles, des détails de contacts, etc.
