# Variables et constantes

Dans cette leçon, nous allons principalement apprendre les variables et les constantes en Swift, ainsi que quelques types de données courants et des opérateurs de base.

Ces notions font partie des connaissances les plus fondamentales en programmation, et constituent aussi une base importante pour la suite de l'apprentissage de SwiftUI.

## Variables et constantes dans la vie quotidienne

On peut comprendre les variables et les constantes à partir d'exemples de la vie courante.

Exemples de variables dans la vie quotidienne :

- le contenu diffusé par chaque émission de télévision est différent
- la météo change chaque jour
- une horloge change à chaque seconde

Le point commun entre ces choses est qu'elles changent.

Si la télévision affichait toujours la même image, si la météo était toujours ensoleillée, ou si les aiguilles de l'horloge ne bougeaient jamais, alors ces choses seraient des constantes.

L'une peut changer, l'autre non.

## Comprendre les variables et les constantes

Dans le développement d'applications, il est fréquent d'avoir besoin que l'utilisateur saisisse ou enregistre certaines informations.

Par exemple :

- le nom du compte
- la date de naissance
- les coordonnées
- l'adresse

Ces informations seront enregistrées puis affichées.

Par exemple, si l'utilisateur saisit un nom dans l'app :

```
FangJunyu
```

Nous devons enregistrer ce nom afin de pouvoir l'afficher dans l'application.

On peut imaginer ce processus très simplement comme le fait de ranger quelque chose dans un tiroir.

Quand nous sauvegardons un nom, c'est comme si nous le mettions dans un tiroir.

Comme il peut y avoir beaucoup d'éléments à sauvegarder, il peut aussi y avoir beaucoup de tiroirs. Pour savoir ce que contient chaque tiroir, nous devons lui donner un nom.

Par exemple :

```
name
```

Dans cet exemple, `name` est le nom du tiroir, et `FangJunyu` est l'information enregistrée.

![Var](../../RESOURCE/007_var.png)

**En Swift, si l'on veut enregistrer des données, il faut obligatoirement les déclarer avec une variable (`var`) ou une constante (`let`).**

Comme un nom peut généralement être modifié, nous devrions utiliser une variable.

```swift
var name = "FangJunyu"
```

Ici, nous déclarons une variable nommée `name`, de type `String`, avec la valeur `"FangJunyu"`.

### Différence entre variable et constante

Les variables sont déclarées avec `var` :

```swift
var
```

Les constantes sont déclarées avec `let` :

```swift
let
```

Par exemple :

```swift
var name = "FangJunyu"
let id = 123456
```

Si une valeur est déclarée comme variable, cela signifie qu'elle peut être modifiée. Si elle est déclarée comme constante, elle ne pourra plus être changée ensuite.

La différence principale entre les deux est donc la suivante : la valeur est-elle autorisée à changer ?

### Modifier une constante

Si le code essaie de modifier la valeur d'une constante :

```swift
let name = "Sam"
name = "Bob"
```

Swift indique que l'affectation est impossible, car il s'agit d'une constante.

```
Cannot assign to property: 'name' is a 'let' constant
```

Ce mécanisme aide les développeurs à éviter que certaines données importantes soient modifiées par erreur.

### Affichage dans SwiftUI

Ouvrez le fichier `ContentView.swift` et déclarez une variable à l'intérieur de la vue :

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Ici, nous déclarons une variable nommée `name`, puis nous l'affichons dans l'interface avec `Text`.

Si nous modifions le contenu de la variable :

```swift
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

Le texte affiché par `Text` changera lui aussi.

De cette manière, nous pouvons utiliser une variable pour contrôler le contenu affiché dans l'interface, sans avoir à modifier directement le texte à l'intérieur de `Text` à chaque fois.

Si une autre partie du programme a besoin de cette information, nous pouvons aussi transmettre la variable, comme si nous donnions à cet autre endroit le contenu du "tiroir".

### Position des variables et constantes dans SwiftUI

Dans SwiftUI, les variables et les constantes sont généralement écrites à l'extérieur de `body` :

```swift
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Bien sûr, on peut aussi écrire les variables et constantes à l'intérieur de `body` :

```swift
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Mais il existe une différence importante entre les deux :

- si une variable ou une constante est écrite à l'intérieur de `body`, elle sera recréée à chaque recalcul de la vue ;
- si elle est écrite à l'extérieur de `body`, elle existe comme propriété de la structure de vue, et l'organisation du code est plus claire.

Ainsi, dans le développement réel, on écrit généralement les variables et les constantes à l'extérieur de `body`.

## Types de données

Une variable peut enregistrer de nombreux types de données différents. Ces types sont appelés types de données.

Par exemple, nous avons déjà utilisé `Text` pour afficher du texte :

```swift
Text("Hello, World")
```

Ici, `"Hello, World"` appartient au type chaîne de caractères (`String`).

Une chaîne sert à représenter du texte, et en Swift elle doit être entourée de guillemets doubles `""`.

Par exemple :

```swift
var hello = "Hello, World"
```

En plus des chaînes, Swift comporte de nombreux autres types.

Au début, les quatre types les plus courants sont :

- `String`
- `Int`
- `Double`
- `Bool`

Ces quatre types suffisent à couvrir la majorité des traitements de données de base.

**String**

`String` représente du texte. Par exemple :

```swift
var name = "FangJunyu"
var city = "Rizhao"
```

Les chaînes sont généralement utilisées pour représenter : le nom d'utilisateur, un titre, ou un contenu textuel.

**Int**

`Int` représente un entier, c'est-à-dire un nombre entier sans décimales.

Par exemple :

```swift
var age = 26
var count = 100
```

Les entiers sont généralement utilisés pour représenter : l'âge, une quantité, un compteur.

**Double**

`Double` représente un nombre à virgule.

Par exemple :

```swift
var weight = 74.5
var height = 185.0
```

En Swift, les nombres décimaux utilisent généralement `Double` par défaut.

Il existe aussi un type similaire appelé `Float`, mais il a une plage de valeurs plus limitée. C'est pourquoi `Double` est plus courant dans le développement réel.

**Bool**

Le type `Bool` sert à représenter deux états : `true` et `false`.

Par exemple :

```swift
var isShowAlert = true
var isLogin = false
```

Le type `Bool` est souvent utilisé dans les conditions. Par exemple, pour savoir s'il faut afficher ou non une boîte de dialogue.

Lorsqu'il n'existe que deux résultats possibles, `Bool` est particulièrement adapté.

### Affichage dans SwiftUI

Lorsque nous affichons une valeur de type `String`, nous pouvons utiliser directement `Text` :

```swift
Text(name)
```

Mais des types comme `Int` ou `Double` ne sont pas des chaînes, donc ils ne peuvent pas être intégrés directement comme contenu textuel.

Si nous voulons afficher ces données dans `Text`, nous pouvons utiliser l'interpolation de chaîne (`String Interpolation`) :

```swift
\()
```

L'interpolation de chaîne s'écrit à l'intérieur d'une chaîne et il faut entourer la variable ou la constante avec `\()`.

Par exemple :

```swift
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

Dans le code ci-dessus, `""` représente une chaîne, et `\()` sert à insérer une variable ou une constante dans cette chaîne.

Par exemple :

```swift
"DoubleNum: \(num * 2)"
```

Le contenu affiché sera :

```swift
DoubleNum: 2
```

De cette manière, nous pouvons insérer une variable ou une constante dans une chaîne, puis utiliser `Text` pour l'afficher dans l'interface.

Astuce : `\()` ne peut être utilisé qu'à l'intérieur d'une chaîne `""`.

## Opérateurs

Lorsque nous déclarons une variable ou une constante, nous voyons souvent une écriture comme celle-ci :

```swift
var num = 1
```

Ici, `=` s'appelle l'opérateur d'affectation.

Son rôle est d'affecter la valeur de droite à la variable de gauche.

Dans cet exemple, `1` est affecté à la variable `num`.

En plus de l'opérateur d'affectation, il existe aussi plusieurs opérateurs numériques courants :

- `+`
- `-`
- `*`
- `/`

Lorsque nous faisons des calculs sur des nombres, par exemple avec des types `Int` ou `Double`, nous utilisons ces opérateurs.

Par exemple :

```swift
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Une fois le calcul terminé, le résultat est enregistré dans la variable.

## Résumé

Les variables, les constantes et les opérateurs sont parmi les concepts les plus fondamentaux en programmation.

Grâce aux variables et aux constantes, nous pouvons stocker toutes sortes de données dans un programme ; grâce aux types de données, nous pouvons préciser la nature de ces données ; grâce aux opérateurs, nous pouvons effectuer des calculs et des traitements sur elles.

Ces connaissances sont comme les outils de base du monde de la programmation. Les maîtriser permet de poser des fondations solides pour l'apprentissage futur de Swift et SwiftUI.
