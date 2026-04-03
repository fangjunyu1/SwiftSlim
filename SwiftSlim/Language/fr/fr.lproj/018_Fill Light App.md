# Application Fill Light

Dans cette leçon, nous allons créer une application fill light très intéressante. Quand la nuit tombe, nous pouvons faire afficher différentes couleurs à l'écran du téléphone et l'utiliser comme une simple lumière d'appoint.

Cette application fill light peut changer de couleur en touchant l'écran, et elle peut aussi ajuster la luminosité avec un curseur.

Dans cet exemple, nous allons apprendre à utiliser `brightness` pour ajuster la luminosité d'une vue, `onTapGesture` pour ajouter un geste de toucher à une vue, ainsi que le contrôle `Slider`.

Résultat :

![Color](../../Resource/018_color.png)

## Afficher une couleur

D'abord, faisons en sorte que la vue affiche une couleur.

Dans SwiftUI, `Color` ne représente pas seulement une couleur, il peut aussi être affiché comme une vue :

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

Ici, `Color.red` représente une vue rouge. `.ignoresSafeArea()` permet à la vue de couleur de remplir tout l'écran, ce qui donne un effet plus proche d'une vraie lumière d'appoint.

Résultat :

![Color](../../Resource/018_color1.png)

### Tableau de couleurs et index

Pour l'instant, une seule couleur est affichée. Mais une lumière d'appoint n'a généralement pas qu'une seule couleur. Elle peut aussi afficher du bleu, du jaune, du violet, du blanc, et d'autres couleurs.

Nous voulons pouvoir changer entre différentes couleurs quand l'écran est touché. Nous pouvons placer ces couleurs dans un tableau pour les gérer de manière unifiée :

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Un tableau convient bien pour stocker "un groupe de données du même type". Ici, chaque élément du tableau est un `Color`.

Si nous voulons afficher une couleur précise, nous pouvons utiliser un index :

```swift
colors[0]
```

Cela signifie lire la couleur à l'index `0` dans le tableau, c'est-à-dire la première couleur.

Maintenant, le code peut s'écrire comme ceci :

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

Ainsi, l'écran affiche la première couleur du tableau, c'est-à-dire le rouge.

### Utiliser l'index pour contrôler la couleur

Si nous devons passer d'une couleur à une autre, nous avons besoin d'une variable pour gérer l'index au lieu d'écrire l'index en dur.

Nous pouvons utiliser `@State` pour déclarer une variable qui stocke l'index :

```swift
@State private var index = 0
```

Ici, `index` représente l'index de la couleur actuelle.

Quand `index` change, SwiftUI recalcule l'interface et met à jour le contenu affiché.

Ensuite, nous remplaçons l'ancien `colors[0]` par :

```swift
colors[index]
```

De cette manière, la couleur affichée dans la vue est déterminée par `index`.

Le code devient alors :

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

Quand `index` change, `colors[index]` affiche également une autre couleur.

Par exemple :

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

Il faut noter que `index` ne peut pas dépasser l'index maximal du tableau, sinon une erreur d'index hors limites se produira.

## Geste de toucher

Maintenant, nous pouvons afficher différentes couleurs selon `index`, mais nous ne pouvons pas encore changer de couleur en touchant.

Dans la précédente leçon "Carrousel de citations", nous avons utilisé `Button` pour contrôler le changement de citation.

Mais cette fois, nous voulons "toucher toute la zone colorée" pour changer de couleur, donc `onTapGesture` est plus adapté.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

Quand nous touchons la vue de couleur, ce code est exécuté :

```swift
index += 1
```

Cela signifie augmenter `index` de `1`. Une fois l'index augmenté, `colors[index]` affichera la couleur suivante du tableau.

### `onTapGesture`

`onTapGesture` est un modificateur de geste qui ajoute une action de toucher à une vue.

Utilisation de base :

```swift
.onTapGesture {
    // code
}
```

Par exemple :

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

Quand cette vue rouge est touchée, le code entre accolades s'exécute, et ceci s'affiche dans la console :

```swift
Click color
```

Grâce à `onTapGesture`, nous pouvons définir ce qui se passe après qu'une vue a été touchée.

### Différence avec `Button`

Plus tôt, nous avons appris la vue `Button`. `Button` et `onTapGesture` peuvent tous les deux gérer les actions de toucher, mais leurs scénarios d'utilisation ne sont pas exactement les mêmes.

`onTapGesture` est plus adapté pour "ajouter une fonction de toucher à une vue existante", comme `Color`, `Image`, `Text` ou une autre vue ordinaire.

`Button` est plus adapté lorsqu'on veut représenter un bouton clair, comme "Confirmer", "Envoyer" ou "Supprimer".

Dans cette application fill light, nous voulons que la fonction de changement de couleur soit plus simple. Toucher toute la zone colorée pour changer la couleur rend `onTapGesture` bien adapté ici.

## Le problème de l'index

Maintenant, nous pouvons toucher l'écran pour passer entre différentes couleurs.

Mais il y a ici un problème important : **l'index peut dépasser la portée du tableau**.

Par exemple :

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

Si nous continuons à toucher l'écran, `index` finira par devenir `4`, et une erreur "index out of range" se produira alors.

Cela vient du fait que le tableau `colors` contient `4` éléments, mais que l'indexation commence à `0`, donc la plage d'index valide est `0 - 3`, et non `4`.

Si nous accédons à `colors[4]`, une erreur "index out of range" se produira.

Dans le code actuel, chaque toucher augmente automatiquement `index` de `1`. Si nous ne traitons pas cela, il dépassera forcément la plage valide à la fin.

Nous devons donc vérifier l'index quand l'écran est touché : si nous sommes déjà sur la dernière couleur, nous revenons à la première, sinon nous continuons d'ajouter `1`.

Nous pouvons utiliser une instruction `if` pour cela :

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

Dans ce code, `colors.count` représente le nombre d'éléments dans le tableau.

Il y a 4 couleurs dans le tableau actuel, donc :

```swift
colors.count // 4
```

Mais l'index maximal n'est pas `4`, c'est `3`, parce que l'indexation commence à `0`.

Donc le dernier index doit s'écrire :

```swift
colors.count - 1
```

C'est-à-dire :

```swift
4 - 1 = 3
```

Cette logique signifie : si l'index actuel correspond déjà à la dernière couleur, remets l'index à `0` ; sinon, augmente-le de `1`.

De cette façon, les couleurs peuvent changer en boucle.

### Optimiser la logique de l'index

Si nous voulons rendre le code plus concis, nous pouvons aussi utiliser l'opérateur ternaire :

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

Ce code signifie : si `index == colors.count - 1` est vrai, retourner `0`. Sinon, retourner `index + 1`.

Enfin, nous réassignons le résultat à `index`.

Maintenant, nous pouvons obtenir l'effet de changement de couleur.

Code complet :

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

Maintenant, nous pouvons toucher l'écran et changer entre différentes couleurs. Une application fill light de base est terminée.

## Afficher le nom de la couleur

Nous pouvons ajouter un autre groupe de textes correspondant aux couleurs, afin que lorsque la couleur change, le nom de la couleur actuelle s'affiche aussi à l'écran.

Par exemple :

- Rouge affiche `Red`
- Bleu affiche `Blue`
- Jaune affiche `Yellow`
- Violet affiche `Purple`

Ici aussi, nous pouvons utiliser un tableau pour stocker les noms des couleurs :

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

L'ordre des textes dans ce tableau doit correspondre exactement à l'ordre des couleurs dans le tableau de couleurs.

Ensuite, nous pouvons utiliser `Text` pour afficher le nom de la couleur correspondant à l'index actuel :

```swift
Text(colorsName[index])
```

`Text` affiche le nom de la couleur actuelle selon `index`.

Utilisons des modificateurs pour améliorer l'apparence de `Text` :

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

Cela permet à `Text` d'apparaître en blanc, avec une taille de titre et en gras.

Nous avons maintenant une vue `Color` en plein écran. Si nous voulons que `Text` apparaisse au-dessus de la vue `Color`, nous devons utiliser le conteneur de mise en page `ZStack` pour les superposer.

```swift
ZStack {
    Color
    Text
}
```

Le code devient alors :

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

De cette manière, l'arrière-plan est la vue de couleur, et une vue de texte est superposée par-dessus.

Résultat :

![Color](../../Resource/018_color2.png)

Il faut noter que dans un `ZStack`, les vues écrites plus tard apparaissent généralement devant. Si `Text` est écrit avant `Color`, la vue `Color` écrite ensuite peut recouvrir `Text`.

## Contrôler la luminosité

Maintenant, nous pouvons changer entre différentes couleurs, mais une lumière d'appoint a une autre fonction importante : **ajuster la luminosité**.

Dans SwiftUI, nous pouvons utiliser le modificateur `brightness` pour ajuster la luminosité d'une vue.

Par exemple :

```swift
.brightness(1)
```

Nous pouvons écrire :

```swift
colors[index]
    .brightness(0.5)
```

Cela rend la couleur actuelle plus lumineuse et plus proche de l'effet d'une lumière d'appoint.

La plage de luminosité est `0 - 1`. `0` signifie conserver la couleur d'origine, et plus la valeur se rapproche de `1`, plus la couleur devient lumineuse. `1` représente le résultat blanc le plus lumineux.

Même si nous pouvons contrôler `brightness` dans le code, l'utilisateur ne peut toujours pas l'ajuster lui-même directement.

Nous devons donc ajouter un contrôle que l'on peut faire glisser : `Slider`.

## Vue `Slider`

Dans SwiftUI, `Slider` est un contrôle utilisé pour sélectionner une valeur dans une plage. Apple le décrit comme "un contrôle permettant de sélectionner une valeur dans une plage linéaire bornée".

Utilisation de base :

```swift
Slider(value: $value, in: 0...1)
```

Explication des paramètres :

1. `value: $value` : `Slider` doit être lié à une variable.

    Quand le curseur est déplacé, la valeur de la variable change en même temps. À l'inverse, si la variable change, le curseur se met aussi à jour.

    Cela ressemble beaucoup à `TextField`, que nous avons appris auparavant. Les deux "lient un contrôle à une variable".

    Une variable liée doit avoir le symbole `$` devant elle pour représenter la liaison.

2. `in: 0...1` : ce paramètre représente la plage de valeurs du curseur.

    Ici, `0...1` signifie que la valeur minimale est `0` et la valeur maximale est `1`.

    Quand le curseur est déplacé complètement à gauche, la variable liée est proche de `0` ; quand il est déplacé complètement à droite, elle est proche de `1`.

Par exemple :

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` est lié à la variable `value`. Quand le curseur est déplacé, la valeur de `value` change en même temps.

Apparence :

![Slider](../../Resource/018_slider.png)

Quand le `Slider` est déplacé vers la gauche, la valeur liée `value` devient `0`. Quand il est déplacé vers la droite, elle devient `1`.

### Plage de valeurs

La plage de valeurs de `Slider` n'est pas fixe. Elle peut aussi s'écrire :

```swift
0...100
```

ou avec une autre plage.

Mais dans cette application fill light, nous devons contrôler la luminosité, donc `0...1` est le choix le plus adapté.

## Utiliser `Slider` pour contrôler la luminosité

Maintenant, nous devons relier `Slider` et `brightness`.

D'abord, créons une variable pour stocker la valeur de luminosité :

```swift
@State private var slider = 0.0
```

Ici, `0.0` est une valeur de type `Double`.

Comme `Slider` est généralement lié à un type numérique, et qu'ici nous voulons qu'il change de façon continue, `Double` est plus adapté. De plus, `brightness` n'accepte qu'une valeur de type `Double`.

Ensuite, passons cette valeur à `brightness` :

```swift
colors[index]
    .brightness(slider)
```

Quand `slider == 0`, la couleur reste dans son état par défaut. Plus `slider` est proche de `1`, plus la couleur paraît lumineuse.

### Ajouter le contrôle `Slider`

Ensuite, ajoutons un contrôle `Slider` pour modifier cette variable :

```swift
Slider(value: $slider, in: 0...1)
```

Quand le curseur change, la valeur de `slider` change aussi, et `brightness(slider)` met à jour la luminosité en même temps.

C'est un exemple très typique du fait que "les variables pilotent la vue" dans SwiftUI.

### Ajuster l'apparence de `Slider`

Par défaut, `Slider` utilise toute la largeur disponible.

Nous pouvons lui donner une largeur fixe :

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

Puis ajoutons encore quelques modificateurs pour qu'il soit plus visible :

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

Cela donne au curseur un arrière-plan blanc et des coins arrondis, ce qui le fait ressortir plus clairement sur la vue `Color`.

Enfin, plaçons-le en bas de l'écran.

Comme nous utilisons déjà `ZStack`, nous pouvons y placer un `VStack` et utiliser `Spacer()` pour pousser le `Slider` vers le bas.

## Code complet

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

Résultat :

![Color](../../Resource/018_color.png)

## Résumé

En utilisant les connaissances que nous avons apprises auparavant, ainsi que des concepts de base comme les couleurs et les tableaux, nous avons construit une application fill light très intéressante.

Grâce à cette application fill light, nous avons appris à utiliser `brightness` pour ajuster la luminosité, `onTapGesture` pour ajouter des actions de toucher à des vues, et le contrôle `Slider`.

Nous avons ajouté `onTapGesture` à la vue `Color` pour changer les couleurs. Nous avons aussi utilisé le contrôle `Slider` pour modifier une variable qui gère `brightness`, ce qui est un autre exemple du fait que "les variables pilotent la vue".

Nous avons également revu l'opérateur ternaire, utilisé `ZStack` pour superposer des vues, et utilisé des tableaux pour gérer un groupe de données du même type. Cela aide à approfondir notre compréhension des tableaux et des index, y compris le problème pratique consistant à éviter les erreurs d'index hors limites.

Même si cet exemple n'est pas compliqué, il relie beaucoup des idées de base que nous avons apprises auparavant. Lorsqu'elles sont réunies dans un petit projet réel, il devient plus facile de comprendre à quoi sert chaque concept.

### Scénario d'utilisation réel

Imaginez poser un ancien iPhone sur le bureau et utiliser l'application fill light que vous avez développée vous-même pour contrôler la couleur de la lumière. Ce serait une très bonne expérience.

Il existe de nombreuses applications "fill light" sur l'App Store, et elles ne semblent pas très compliquées non plus.

![AppStore](../../Resource/018_appStore.PNG)

Nous pouvons commencer par développer des applications simples et essayer de les publier sur l'App Store. Cela augmente non seulement notre intérêt pour le développement, mais enregistre aussi notre progression.

### Exercice après le cours

Vous pouvez continuer à réfléchir à des moyens d'étendre cette application fill light, par exemple :

- Ajouter plus de couleurs
- Afficher la valeur actuelle de luminosité
- Améliorer le design de la zone inférieure du curseur

Quand vous commencerez vraiment à utiliser ces connaissances, vous découvrirez que chaque notion que nous apprenons est en réalité un outil pour créer des applications.

Plus nous maîtrisons d'outils, plus nous pouvons créer de fonctionnalités.
