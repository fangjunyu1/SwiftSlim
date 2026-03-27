# Opérateurs

Dans cette leçon, nous allons apprendre les opérateurs (`Operators`) en Swift.

Lorsque nous faisons des calculs, des comparaisons ou des jugements logiques, nous avons besoin d'opérateurs. Ces opérations traversent toutes les étapes de l'exécution d'un programme et font partie des capacités les plus fondamentales en programmation.

```swift
let a = 100 * 8
```

Pendant l'apprentissage de la programmation, beaucoup de personnes remarquent qu'un certain sens des mathématiques aide souvent à mieux comprendre la logique des programmes. Cela vient du fait que la programmation repose fondamentalement sur le calcul et l'évaluation de règles, ce qui correspond précisément au rôle central des opérateurs.

Dans le développement réel, les opérateurs ne servent pas seulement à effectuer des calculs numériques simples. Ils sont aussi largement utilisés dans de nombreuses situations concrètes.

Par exemple, dans un jeu de blocs, lorsqu'un utilisateur déplace un bloc vers une position donnée, il faut calculer :

- la position du bloc
- les emplacements que le bloc peut remplir
- si la position cible est disponible

Tous ces processus de "calcul + jugement" reposent fondamentalement sur les opérateurs.

![Block](../../Resource/013_block.png)

Apprendre les opérateurs, ce n'est donc pas seulement apprendre à faire des calculs, c'est aussi poser les bases nécessaires pour la mise en page d'interface, le traitement des données et la logique d'interaction.

## Comment les calculs sont exécutés dans SwiftUI

Dans SwiftUI, la logique de calcul est généralement exécutée via un `Button`, qui déclenche une fonction dans laquelle le calcul est effectué.

Par exemple :

```swift
struct ContentView: View {
    func calculate() {
        let a = 10
        let b = 10
        let c = a + b
        print("c: \(c)")
    }
    var body: some View {
        VStack(spacing: 10) {
            Button("Button") {
                calculate()
            }
        }
    }
}
```

Quand on clique sur le bouton, la `Console` affiche :

```
c: 20
```

Dans cette leçon, nous écrirons systématiquement la logique de calcul dans des fonctions `func`, nous la déclencherons via des boutons, et nous utiliserons `print` pour afficher le résultat.

Dans les exemples suivants, afin de simplifier la présentation du code, nous indiquerons directement les résultats du calcul dans le code au lieu de répéter systématiquement une sortie `print`.

## Gestion de l'affichage dans la Console

Comme chaque clic produit une sortie, on peut cliquer sur le bouton de nettoyage situé en bas à droite de la zone `Console` afin d'effacer l'historique et de voir plus facilement le résultat courant.

![Console](../../Resource/013_console.png)

## Une autre écriture de `Button`

Quand un bouton ne fait qu'exécuter une seule fonction, on peut utiliser une écriture plus concise :

```swift
Button(action: ) {
    // View
}
```

Dans cette écriture, `action` indique la fonction à exécuter lors du clic (une fonction sans paramètre), et les accolades `{}` servent à définir la vue du bouton.

En reprenant la fonction `calculate` précédente, cela peut s'écrire ainsi :

```swift
Button(action: calculate) {
    Text("Button")
}
```

Quand on clique sur le bouton, la fonction `calculate` est exécutée directement.

Ainsi, lorsque la logique du bouton est simple et qu'il n'appelle qu'une seule fonction, l'écriture avec `action` est plus claire et correspond mieux aux conventions de code.

## Opérateurs arithmétiques

Les opérateurs arithmétiques (`Arithmetic Operators`) servent aux calculs numériques :

- `+` addition
- `-` soustraction
- `*` multiplication
- `/` division
- `%` reste de division

Exemple :

```swift
let a = 10 + 5  // 15
let b = 10 - 3  // 7
let c = 10 * 10 // 100
let d = 10 / 5  // 2
let e = 10 % 3  // 1
```

Il faut noter que Swift est un langage fortement typé et ne mélange pas automatiquement différents types de données :

```swift
let a = 10  // Int
let b = 5.0 // Double

let c = a + b   // Error
let d = Double(a) + b   // 15.0
```

Lorsque les types sont différents, il faut donc les convertir manuellement.

## Opérateurs de comparaison

Les opérateurs de comparaison (`Comparison Operators`) servent à juger la relation entre deux valeurs, et leur résultat est un `Bool` :

- `==` égal à
- `!=` différent de
- `>` supérieur à
- `<` inférieur à
- `>=` supérieur ou égal à
- `<=` inférieur ou égal à

Exemple :

```swift
let a = 5 == 3  // false
let b = 2 != 4  // true
let c = 4 > 2   // true
let d = 5 < 3   // false
let e = 4 >= 4  // true
let f = 10 <= 7 // false
```

Les opérateurs de comparaison sont souvent utilisés dans les instructions conditionnelles. Par exemple, dans le "carrousel de citations", nous devons empêcher l'index de dépasser la taille du tableau :

```swift
if index < sayings.count - 1 {
    index += 1
}
```

Si `index` est inférieur à `sayings.count - 1`, le résultat de la comparaison est `true`, et le code de l'instruction `if` est exécuté. Si le résultat est `false`, le code suivant n'est pas exécuté.

## Opérateurs logiques

Les opérateurs logiques (`Logical Operators`) servent à combiner plusieurs conditions :

- `&&` et (`AND`)
- `||` ou (`OR`)
- `!` non (`NOT`)

### `&&` et

Quand plusieurs conditions doivent être satisfaites en même temps, on utilise `&&`.

Par exemple :

```swift
let age = 16
let legalAge = age >= 18 && age <= 100
```

Dans ce code, il y a deux conditions : `age >= 18` et `age <= 100`.

Ce n'est que lorsque ces deux conditions sont vraies que `legalAge` est `true`. Si l'une des deux conditions échoue, le résultat est `false`.

### `||` ou

Quand il suffit qu'une seule condition parmi plusieurs soit satisfaite, on utilise `||`.

Par exemple :

```swift
let money = 1000
let creditCard = 300
let payAllowed = money >= 50 || creditCard >= 50
```

Ce code signifie que tant que `money >= 50` ou `creditCard >= 50` est vrai, `payAllowed` vaut `true`.

Ce n'est que lorsque les deux conditions sont fausses que le résultat devient `false`.

Par exemple, dans un scénario de paiement, on peut payer soit en espèces, soit par carte bancaire. Si aucun des deux moyens n'est suffisant, le paiement échoue.

### `!` non

`!` est l'opérateur logique de négation (`NOT`), utilisé pour inverser une valeur `Bool`.

On peut le comprendre simplement ainsi : `!` transforme `true` en `false`, et `false` en `true`.

Par exemple :

```swift
let allowed = true
let result = !allowed   // false
```

Ici, `!allowed` signifie que l'on inverse la valeur de `allowed`.

Il faut noter que `!` et `!=` sont deux opérateurs différents : `!` inverse une valeur `Bool`, tandis que `!=` est un opérateur de comparaison qui retourne lui aussi un `Bool`.

## Opérateurs d'affectation

Les opérateurs d'affectation (`Assignment Operators`) servent à affecter une valeur ou à mettre à jour une variable :

- `=` affectation

Qu'il s'agisse de déclarer une variable ou d'enregistrer le résultat d'un calcul, on utilise l'affectation :

```swift
let a = 5
```

Ce code signifie que la valeur `5` est affectée à la variable `a`.

### Opérateurs d'affectation composée

Dans le développement réel, en plus de l'opérateur d'affectation de base, on utilise souvent les opérateurs d'affectation composée, qui permettent d'effectuer un calcul directement à partir de la valeur existante puis de la mettre à jour :

- `+=`
- `-=`
- `*=`
- `/=`

Dans la leçon précédente sur le compteur, nous avons déjà vu rapidement ces opérateurs.

Par exemple, si l'on veut augmenter automatiquement une variable lorsqu'on clique sur un bouton :

```swift
var num = 10
num += 5   // num = 15
```

Ce code signifie que `num` est additionné à `5`, puis que le résultat est réaffecté à `num`.

Il est donc équivalent à :

```swift
var num = 10
num = num + 5   // num = 15
```

## Opérateur ternaire

L'opérateur ternaire (`Ternary Operator`) en Swift permet de juger une condition et de retourner l'un de deux résultats possibles :

```swift
条件 ? 值1 : 值2
```

Sa logique d'exécution est la suivante : si la condition vaut `true`, il retourne "valeur 1" ; si la condition vaut `false`, il retourne "valeur 2".

Par exemple :

```swift
let showColor = true
let backgroundColor = showColor ? Color.blue : Color.clear
```

Ce code vérifie la valeur de `showColor` : si elle vaut `true`, il retourne `Color.blue`, et le fond est bleu ; si elle vaut `false`, il retourne `Color.clear`, donc aucun fond n'est affiché.

Astuce : `Color.clear` signifie une couleur transparente.

### Différence avec `if-else`

L'opérateur ternaire est logiquement équivalent à une instruction `if-else`.

Par exemple, le code ci-dessus peut s'écrire ainsi :

```swift
var backgroundColor: Color

if showColor {
    backgroundColor = Color.blue
} else {
    backgroundColor = Color.clear
}
```

La logique d'exécution est exactement la même : si la condition vaut `true`, on prend le premier résultat ; si elle vaut `false`, on prend le second.

En pratique, l'opérateur ternaire est plus concis et convient mieux à l'expression d'un choix simple entre deux résultats, en particulier lorsqu'on veut retourner directement une valeur.

Dans la construction de vues SwiftUI, il est très courant, par exemple :

```swift
Text("Hello")
    .background(showColor ? Color.blue : Color.clear)
```

Cette écriture permet de modifier l'apparence d'une vue dynamiquement selon une condition, sur une seule ligne.

## Opérateurs de plage

Les opérateurs de plage (`Range Operators`) servent à représenter un intervalle :

- `...` intervalle fermé (inclut les deux bornes)
- `..<` intervalle semi-ouvert (n'inclut pas la borne de droite)

Par exemple :

```
1...3   // 1, 2, 3
5..<8   // 5, 6, 7
```

On peut comprendre cela ainsi : `1...3` représente les nombres de `1` à `3`, y compris `3`; tandis que `5..<8` représente les nombres de `5` à `8`, mais sans inclure `8`.

Formes étendues (simplement pour information) :

```
5...    // >= 5
...5    // <= 5
```

Cette écriture représente une plage à un seul côté, souvent utilisée dans des conditions ou dans des correspondances de motifs.

Les opérateurs de plage seront surtout utiles plus tard avec les boucles `for`. Pour l'instant, on peut simplement les comprendre comme un intervalle continu de valeurs.

## Exercices avec les opérateurs

Voyons maintenant quelques petits exemples concrets pour pratiquer le rôle des opérateurs dans une vue.

### 1. Calculer le nombre total de véhicules

Par exemple, supposons qu'un carrefour voie passer `500` véhicules par jour. Nous voulons calculer le nombre total de véhicules sur `30` jours.

Nous pouvons utiliser un opérateur de calcul :

```swift
let dayVehicles = 500
let totalVehicles = 500 * 30    // 15000
```

Le calcul est ici le suivant : `500` véhicules par jour multipliés par `30` jours donnent un total de `15000` véhicules.

### 2. Vérifier l'adhésion aux achats intégrés

Nous pouvons aussi déterminer si une personne est membre des achats intégrés. Si elle a soit un abonnement à vie, soit un abonnement classique, elle est considérée comme membre.

```swift
let lifeTime = false
let subscription = true
let isMember = lifeTime || subscription   // true
```

Dans ce code, nous utilisons l'opérateur `||` (`ou`) : `lifeTime = false` signifie qu'il n'y a pas d'abonnement à vie ; `subscription = true` signifie qu'un abonnement existe.

Comme il suffit qu'une seule condition soit satisfaite, `isMember` vaut `true`. Cette personne est donc membre.

## Résumé

En Swift, les opérateurs sont la base du calcul des données et du raisonnement logique. De la même manière que `Text` sert à afficher du contenu, les opérateurs servent à manipuler les données elles-mêmes.

Des calculs numériques les plus simples jusqu'aux jugements logiques plus complexes, en passant par le contrôle d'état des vues et les calculs de mise en page, les opérateurs sont partout.

En les pratiquant dans différents contextes, on peut progressivement se familiariser avec les différents types d'opérateurs présentés dans cette leçon. C'est une base importante pour la suite de l'apprentissage.

### Connaissance complémentaire - Opérateurs bit à bit

En plus de cela, Swift fournit aussi une catégorie d'opérateurs plus bas niveau : les opérateurs bit à bit (`Bitwise Operators`) :

- `&` (ET bit à bit)
- `|` (OU bit à bit)
- `^` (XOR bit à bit)
- `~` (NON bit à bit)
- `>>` (décalage à droite)
- `<<` (décalage à gauche)

Par exemple :

```swift
let a = 6  // binaire 110
let b = 3  // binaire 011

print(a & b) // 2 (binaire 010)
print(a | b) // 7 (binaire 111)
print(a ^ b) // 5 (binaire 101)
print(~a)    // -7 (inversion bit a bit)
```

En Swift, les entiers sont représentés en complément à deux en binaire, donc l'opération de négation bit à bit produit le résultat négatif correspondant.

Les opérateurs bit à bit agissent directement sur les données binaires, et sont généralement utilisés dans les traitements bas niveau ou dans les contextes d'optimisation de performance.

Pour les débutants, ces opérateurs sont moins fréquents, et ils sont rarement nécessaires dans le développement classique iOS ou SwiftUI. C'est pourquoi nous ne les approfondissons pas ici.

Si plus tard nous rencontrons des besoins liés à la logique bas niveau ou à l'optimisation des performances, nous pourrons alors les étudier plus en détail.
