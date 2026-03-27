# Carrousel de citations

Dans cette leçon, nous allons réaliser une fonctionnalité de "carrousel de citations" et approfondir quelques notions de base de Swift, comme les tableaux (`Array`) et les instructions conditionnelles (`if-else`).

Nous allons montrer comment enregistrer plusieurs citations, puis comment, grâce à l'interaction avec un bouton, les faire défiler en boucle.

![alt text](../../RESOURCE/011_word.png)

## Afficher une citation

Commençons par afficher une citation dans SwiftUI.

La manière la plus simple consiste à utiliser une vue `Text` :

```swift
Text("Slow progress is still progress.")
```

Ce code ne peut afficher qu'une citation fixe. Si nous voulons afficher plusieurs citations et permettre de passer de l'une à l'autre, nous devons les enregistrer.

Mais une variable de type chaîne classique ne peut enregistrer qu'une seule citation :

```swift
let sayings = "Slow progress is still progress."
```

Si nous voulons enregistrer plusieurs citations, il faut déclarer une variable pour chacune d'elles :

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Mais dans le développement réel, cette méthode est non seulement fastidieuse, mais elle ne permet pas non plus de faire un défilement souple, car chaque variable est indépendante.

Pour gérer plus facilement plusieurs citations, nous avons besoin d'une structure de données capable de les stocker ensemble : c'est précisément le rôle d'un tableau (`Array`).

En utilisant un tableau, le code ci-dessus peut être réécrit ainsi :

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Astuce : dans les conventions de programmation, le nom d'une variable tableau contenant plusieurs éléments est généralement mis au pluriel, comme `sayings`, afin de refléter son caractère de collection.**

## Les tableaux

En Swift, un tableau est une collection ordonnée d'éléments, représentée avec des crochets `[]`.

```swift
[]
```

L'intérieur d'un tableau peut contenir plusieurs éléments du même type, séparés par des virgules anglaises `,`.

Par exemple :

```swift
[101, 102, 103, 104, 105]
```

On peut comprendre un tableau comme un train :

![Array](../../RESOURCE/011_array1.png)

Le train entier représente l'objet tableau, et chaque wagon y est placé dans un ordre précis.

### Index et accès aux éléments

Comme le tableau est ordonné, le système peut localiser chacun de ses éléments en fonction de cet ordre. Ce mécanisme de positionnement s'appelle l'index (`Index`).

En Swift, comme dans la grande majorité des langages de programmation, l'index d'un tableau commence à `0` et non à `1`. Cela signifie que le premier élément a l'index `0`, le deuxième `1`, et ainsi de suite.

![Array](../../RESOURCE/011_array2.png)

Pour accéder à un élément spécifique du tableau, il suffit d'ajouter des crochets après le nom du tableau et d'y indiquer la valeur de l'index voulu.

Par exemple :

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Si vous essayez d'accéder à un index en dehors de la plage valide du tableau, une erreur d'index hors limites (`Index Out of Range`) se produira. Il faut donc être prudent et vérifier que l'index reste bien valide.

**Index hors limites**

Par exemple, si le tableau ne contient que 5 éléments, la plage d'index valide va de `0` à `4`. Si nous essayons d'accéder à `sayings[5]`, le programme ne trouvera pas le "wagon" correspondant, ce qui provoquera une erreur d'index hors limites et fera planter l'application.

![Array](../../RESOURCE/011_array3.png)

### Manipuler un tableau

Les tableaux ne servent pas seulement à une définition statique : ils permettent aussi d'ajouter, supprimer ou modifier des éléments, et d'obtenir la longueur du tableau.

Astuce : si vous devez modifier un tableau, il faut le déclarer avec `var`, et non avec la constante `let`.

**1. Ajouter un élément**

On peut utiliser la méthode `append` pour ajouter un élément à la fin du tableau :

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Supprimer un élément**

Avec la méthode `remove(at:)`, on peut supprimer un élément spécifique du tableau :

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modifier un élément**

On peut modifier directement un élément du tableau en utilisant son index :

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Compter la longueur du tableau**

La propriété `count` permet d'obtenir le nombre d'éléments du tableau :

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Utiliser un tableau pour afficher des citations

Pour afficher plusieurs citations, nous pouvons les enregistrer dans un tableau, puis les lire et les afficher grâce à un index.

Commençons par créer un tableau `sayings` dans `ContentView`, puis lisons et affichons la citation correspondante dans une vue `Text` en utilisant l'index :

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Ici, `sayings[0]` représente la première citation du tableau.

Si vous voulez afficher une autre citation, il suffit de modifier la valeur de l'index dans les crochets :

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Définir l'index de la citation

Pour réaliser un changement dynamique de citation, nous ne pouvons pas laisser l'index "écrit en dur" dans la vue `Text`.

Nous devons créer une variable qui enregistre séparément l'index actuellement affiché.

Dans SwiftUI, nous pouvons utiliser `@State` pour déclarer un index modifiable :

```swift
@State private var index = 0
```

SwiftUI surveille les variables encapsulées avec `@State`. Lorsque `index` change, SwiftUI recalcule la vue et affiche la citation correspondante.

Ensuite, nous utilisons `sayings[index]` pour récupérer dynamiquement la citation du tableau :

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Quand la valeur de `index` change, `Text` affiche une citation différente.

### Utiliser un bouton pour contrôler l'index

Pour contrôler le changement de citation, nous pouvons utiliser un `Button` pour modifier la valeur de `index`. À chaque clic, `index` augmente de `1` :

```swift
Button("Next") {
    index += 1
}
```

Quand nous cliquons sur le bouton, `index` passe de `0` à `1`, ce qui déclenche un rafraîchissement de la vue. `Text(sayings[index])` lit alors la citation suivante.

Cependant, il y a ici un problème potentiel : si l'on clique plusieurs fois de suite, `index` finira par dépasser la plage valide du tableau, ce qui provoquera une erreur d'index hors limites. Par exemple, lorsque `index` atteint `5` alors que la plage valide va de `0` à `4`, le programme plantera.

Pour éviter cela, nous devons introduire une condition afin de vérifier que `index` ne dépasse pas la taille du tableau. Nous pouvons le faire avec une instruction `if-else`.

## Contrôle conditionnel : instruction `if-else`

L'instruction `if-else` est l'une des structures conditionnelles les plus courantes en Swift. Elle permet de vérifier si une condition est vraie et d'exécuter différents blocs de code selon le résultat.

Structure de base :

```swift
if condition {
    // Code exécuté si condition vaut true
} else {
    // Code exécuté si condition vaut false
}
```

Dans une instruction `if`, la `condition` est une valeur booléenne (`Bool`), c'est-à-dire `true` ou `false`. Si elle est vraie, le code du bloc `if` est exécuté ; sinon, c'est celui du bloc `else`.

Par exemple :

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

Dans cet exemple, la valeur de `age` est `25`. L'instruction `if` vérifie si `age > 18` est vrai. Comme c'est le cas, elle affiche `"Big Boy"`.

Si la partie `else` n'est pas nécessaire, elle peut être omise :

```swift
if condition {
    // Code exécuté si condition vaut true
}
```

### Utiliser une condition pour limiter la plage de l'index

Pour éviter que l'index du tableau ne dépasse sa plage, nous pouvons utiliser une instruction `if` afin de garantir que `index` reste dans les limites du tableau :

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Analyse logique : la valeur de `sayings.count` est `5`, puisqu'il y a 5 citations, donc `sayings.count - 1` vaut `4`, ce qui correspond au dernier index valide du tableau.

Tant que `index` est inférieur à `4`, cliquer sur le bouton et ajouter `1` est sûr. Dès que `index` atteint `4`, la condition n'est plus remplie, et cliquer sur le bouton ne produit plus aucun effet.

À ce stade, le code réalise déjà le changement de citation :

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Faire défiler les citations en boucle

Si nous voulons qu'après la dernière citation, un clic sur le bouton réaffiche la première citation, nous pouvons utiliser la partie `else` pour réaliser cette boucle :

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Quand le bouton est cliqué et que `index` atteint le dernier élément du tableau, `index` est réinitialisé à `0`, ce qui relance l'affichage depuis le début.

## Optimiser la vue du carrousel de citations

La logique du carrousel est maintenant en place, mais nous pouvons encore améliorer l'interface pour la rendre plus agréable visuellement.

Code complet :

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

Dans cet exemple, la vue `Text` reçoit un fond blanc semi-transparent avec des coins arrondis, le bouton utilise le style `.borderedProminent`, et le `VStack` reçoit une image de fond.

Complément de notion : lorsque le modificateur `background()` est utilisé pour gérer une image de fond, son comportement par défaut consiste à remplir autant que possible la zone de mise en page de la vue courante. Dans de nombreux cas, il peut aussi s'étendre naturellement jusqu'à couvrir la `Safe Area`.

Nous avons maintenant réalisé la vue du carrousel de citations.

![SwiftUI View](../../RESOURCE/011_word.png)

## Résumé

Grâce à cette leçon, nous avons appris à utiliser des tableaux pour stocker plusieurs citations, et à utiliser les instructions `if` et `if-else` pour mettre en place leur défilement.

Nous avons aussi découvert les opérations de base sur les tableaux, comme l'ajout, la suppression et la modification d'éléments, ainsi que la manière d'éviter les dépassements d'index.

Cette leçon n'a pas seulement expliqué la réalisation d'un carrousel de citations, elle a aussi combiné l'usage fondamental des tableaux et des conditions, ce qui nous aide à développer notre capacité à manipuler des données et à contrôler le déroulement d'un programme.

## Connaissance complémentaire - conditions multiples : `if-else if-else`

Dans le développement réel, il est fréquent de devoir traiter plusieurs conditions. Par exemple, dans un jeu, un événement A peut être déclenché lorsque le score vaut `1`, un événement B lorsqu'il vaut `2`, un événement C lorsqu'il vaut `3`, et ainsi de suite.

Quand il y a plus de deux branches possibles, nous avons besoin de la structure `if-else if-else` pour effectuer un test multiple.

Syntaxe de base :

```swift
if conditionA {
    // Code exécuté si conditionA vaut true
} else if conditionB {
    // Code exécuté si conditionB vaut true
} else if conditionC {
    // Code exécuté si conditionC vaut true
} else {
    // Code exécuté si aucune condition n'est satisfaite
}
```

Dans ce cas, le programme vérifie les conditions dans l'ordre et exécute la première qui est vraie. Si aucune n'est vraie, il exécute le code situé après `else`.

Dans le carrousel de citations, nous pourrions aussi utiliser `if-else if-else` de cette façon :

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Quand `index` vaut `0`, `1`, `2` ou `3`, chaque clic exécute `index += 1`. Quand `index` vaut `4`, c'est-à-dire le dernier élément, il est réinitialisé à `0` pour relancer la boucle.

La branche `else` sert ici de sécurité pour éviter une valeur invalide, par exemple si `index` a été modifié par erreur.

Il faut noter que `==` signifie ici "est égal à". Si l'instruction `if` teste si `index` est égal à un certain nombre, alors le résultat est `true` et le bloc de code correspondant est exécuté. Sinon, le programme continue vers la condition suivante.

Ce type de test multiple est utile lorsqu'il faut exécuter des codes différents selon des situations différentes.
