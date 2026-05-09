# Propriétés calculées

Dans cette leçon, nous allons principalement apprendre les propriétés calculées.

Les propriétés calculées servent à calculer un nouveau résultat à partir de données existantes. Elles peuvent calculer des valeurs numériques, mais aussi du contenu qui doit être affiché dans des vues SwiftUI.

Par exemple:

```swift
let a = 10
let b = 20
let c = a + b
```

Ici, `c` représente le résultat de l'addition de `a` et `b`.

Dans du code ordinaire, cette façon d'écrire est très courante.

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c:\(c)")
}
```

Astuce: dans l'événement de toucher d'un `Button`, on peut exécuter du code Swift ordinaire.

Mais si nous écrivons du code similaire directement dans les propriétés d'une vue SwiftUI, nous rencontrerons un problème.

Par exemple:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
    var body: some View {
        VStack {
            Text("c:\(c)")
        }
        .padding(20)
    }
}
```

Ce code produira une erreur.

On dirait que `a` et `b` sont déjà écrits avant `c`, donc il semble possible de calculer la valeur de `c`.

Mais dans les déclarations de propriétés d'une structure, cette écriture ne peut pas être utilisée directement.

## Pourquoi c ne peut pas calculer directement a + b

Parce que `a`, `b` et `c` ne sont pas des constantes temporaires dans l'événement de toucher d'un bouton, mais des propriétés de la vue `ContentView`.

Dans l'événement de toucher d'un bouton, ce code peut s'exécuter normalement:

```swift
Button("a + b") {
    let a = 10
    let b = 20
    let c = a + b
    print("c: \(c)")
}
```

Parce qu'après le toucher du bouton, le code s'exécute dans l'ordre. Il crée d'abord `a`, puis crée `b`, et calcule enfin `c` avec `a + b`.

Mais lorsqu'on déclare des propriétés à l'intérieur d'une vue, la situation est différente:

```swift
struct ContentView: View {
    let a = 10
    let b = 20
    let c = a + b
}
```

Ici, `a`, `b` et `c` sont toutes des propriétés de la vue `ContentView`.

Lorsque la vue `ContentView` est créée, Swift doit d'abord préparer ces propriétés. Pour garantir la sécurité du processus de création, Swift n'autorise pas la valeur par défaut d'une propriété stockée d'instance à lire directement d'autres propriétés de la même instance.

Cette ligne produira donc une erreur:

```swift
let c = a + b
```

On peut le comprendre simplement ainsi: **lorsqu'on déclare des propriétés dans une vue, on ne peut pas utiliser directement une propriété ordinaire pour calculer une autre propriété ordinaire.**

Une propriété qui stocke directement une valeur s'appelle une « propriété stockée ». Pour faciliter la compréhension, on peut aussi la considérer temporairement comme une propriété ordinaire.

Par exemple:

```swift
let a = 10
```

`a` stocke `10`.

```swift
let b = 20
```

`b` stocke `20`.

Mais:

```swift
let c = a + b
```

Ici, `c` n'est pas une valeur écrite directement, mais une valeur que nous voulons calculer avec `a + b`.

Pour ce type de situation, où l'on « obtient un résultat à partir de données existantes », une propriété calculée est plus adaptée.

On peut modifier ainsi:

```swift
struct ContentView: View {
    let a = 10
    let b = 20

    var c: Int {
        return a + b
    }

    var body: some View {
        VStack {
            Text("c: \(c)")
        }
        .padding(20)
    }
}
```

Ici, `c` est une propriété calculée.

```swift
var c: Int {
    return a + b
}
```

Cela signifie: **lorsqu'il faut utiliser `c`, lire alors `a` et `b`, puis retourner le résultat de `a + b`.**

Par exemple:

```swift
Text("c: \(c)")
```

Lorsque `Text` affiche `c`, le calcul de `c` est déclenché à ce moment-là.

## Qu'est-ce qu'une propriété calculée?

Une propriété calculée ressemble à une variable, mais elle ne stocke pas elle-même de données.

Par exemple:

```swift
let a = 10
let b = 20
var c: Int {
    return a + b
}
```

Ici, `c` est une propriété calculée.

Elle ne stocke pas une valeur fixe comme une propriété ordinaire. Au lieu de cela, chaque fois que `c` est lue, elle réexécute le code dans `{}` et retourne le résultat du calcul.

On peut le comprendre ainsi:

```swift
var c: Int {
    return a + b
}
```

Quand nous devons utiliser `c`, nous calculons `a + b`.

Une propriété calculée convient donc à cette situation: **un résultat n'a pas besoin d'être stocké séparément, car il peut être calculé à partir de données existantes.**

## Syntaxe de base

Une propriété calculée contient généralement trois parties:

```swift
var c: Int {
    return a + b
}
```

### 1. Déclarer avec `var`

```swift
var c
```

Une propriété calculée doit être déclarée avec `var`; on ne peut pas utiliser `let`.

Parce qu'une propriété calculée n'est pas une valeur stockée fixe, mais un résultat calculé dynamiquement chaque fois qu'elle est lue.

### 2. Indiquer le type de retour

```swift
var c: Int
```

Une propriété calculée doit indiquer son type de retour.

Ici, `c` retournera finalement un entier, donc le type est `Int`.

### 3. Utiliser {} pour écrire la logique de calcul

```swift
{
    return a + b
}
```

Le contenu dans `{}` est la logique de calcul; ici, elle retourne `a + b`.

## Le mot-clé return

Une propriété calculée doit retourner un résultat.

Par exemple:

```swift
var c: Int {
    return a + b
}
```

Ici, `return` signifie: retourner le résultat du calcul `a + b`.

Si la propriété calculée ne contient qu'une expression qui produit directement un résultat, `return` peut être omis:

```swift
var c: Int {
    a + b
}
```

Mais si la propriété calculée contient plusieurs lignes de code, il faut utiliser `return` pour retourner clairement le résultat.

Par exemple:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Ici, le processus de calcul est divisé en deux étapes.

Première étape, calculer d'abord le prix total:

```swift
let total = count * price
```

Deuxième étape, assembler le prix total en texte et le retourner:

```swift
return "Total: \(total) $"
```

Si on enlève `return`:

```swift
var totalPriceText: String {
    let total = count * price
    "Total: \(total) $"
}
```

Ce code produira une erreur.

La raison est: **cette propriété calculée contient déjà plusieurs lignes de code, et Swift ne peut plus déterminer automatiquement quelle ligne est le résultat final à retourner.**

Donc, lorsqu'une propriété calculée n'a qu'une seule ligne de résultat, `return` peut être omis.

```swift
var c: Int {
    a + b
}
```

Lorsque la propriété calculée contient plusieurs lignes de code, il est recommandé d'écrire clairement `return`.

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

## Différence entre propriétés calculées et propriétés ordinaires

Les propriétés ordinaires stockent des données.

```swift
var c = 30
```

Ici, `c` stocke une valeur concrète: `30`.

Les propriétés calculées ne stockent pas de données.

```swift
var c: Int {
    a + b
}
```

Ici, `c` ne stocke pas `30`. Elle fournit seulement une manière de calculer.

Lorsque `c` est lue, Swift exécute:

```swift
a + b
```

Puis il retourne le résultat du calcul.

Les propriétés calculées conviennent donc aux situations où un résultat est calculé à partir d'autres données.

## body est aussi une propriété calculée

Après avoir appris les propriétés calculées, nous pouvons comprendre à nouveau l'un des morceaux de code les plus courants dans SwiftUI:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Ici, `body` est aussi une propriété calculée.

Elle est déclarée avec `var`:

```swift
var body
```

Elle a un type de retour:

```swift
some View
```

Le contenu dans ses `{}` retourne du contenu de vue SwiftUI:

```swift
VStack(spacing: 20) {
    Image(systemName: "carrot")
        .font(.largeTitle)
}
```

On peut donc comprendre `body` ainsi: lorsque SwiftUI doit afficher cette vue, il lit `body` et génère l'interface selon le contenu retourné par `body`.

Si nous écrivons `return`, nous pouvons le comprendre ainsi:

```swift
var body: some View {
    return VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Cependant, dans SwiftUI, nous omettons généralement `return` et écrivons directement:

```swift
var body: some View {
    VStack(spacing: 20) {
        Image(systemName: "carrot")
            .font(.largeTitle)
    }
}
```

Lorsque les données `@State` changent, SwiftUI relit `body` et met à jour l'interface selon les nouvelles données.

Par exemple:

```swift
struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Text("nombre: \(count)")

            Button("+") {
                count += 1
            }
        }
    }
}
```

Après avoir touché le bouton, `count` change.

```swift
count += 1
```

Après le changement de `count`, SwiftUI recalcule `body`, donc le texte de l'interface est aussi mis à jour.

```swift
Text("nombre: \(count)")
```

C'est aussi la raison pour laquelle, dans SwiftUI, l'interface peut se rafraîchir automatiquement après un changement de données.

### Il n'est pas recommandé d'écrire des calculs complexes dans body

Puisque `body` est une propriété calculée, elle peut être lue et recalculée de nombreuses fois.

Par exemple:

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    var body: some View {
        let num = 10

        VStack {
            Text("nombre: \(num)")
            Text("nom: \(name)")
        }
    }
}
```

Lorsque `name` change, SwiftUI recalcule `body`.

À ce moment-là, le code à l'intérieur de `body` est également réexécuté, et `num` est aussi recréé.

```swift
let num = 10
```

Le `num` de cet exemple est très simple, donc l'impact n'est pas important.

Mais si des calculs complexes sont exécutés dans `body`, comme filtrer beaucoup de données, trier, traiter des images, etc., cela peut affecter la fluidité de l'interface.

Donc dans SwiftUI, `body` devrait principalement être responsable de décrire la structure de l'interface.

Des données temporaires simples peuvent être écrites dans `body`.

Les calculs complexes peuvent être placés dans des propriétés calculées en dehors de `body`, dans des méthodes ou dans un traitement de données séparé.

## Exemple: quantité et prix total

Ensuite, nous comprendrons les propriétés calculées avec un exemple simple.

Supposons que le prix unitaire d'une carotte soit de 2 $, que l'utilisateur puisse toucher des boutons pour modifier la quantité achetée, et que l'interface doive afficher le prix total.

La méthode de calcul du prix total:

```
quantité * prix unitaire
```

Si nous utilisons une variable ordinaire pour stocker le prix total, cela devient un peu pénible.

Parce que chaque fois que la quantité change, nous devons mettre à jour manuellement le prix total.

Une meilleure méthode est d'utiliser une propriété calculée:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if count > 1 {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("prix: \(price) $")
                Text("quantité: \(count)")
                Text("prix total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Résultat affiché:

![view](../../Resource/024_view.png)

Dans cet exemple:

```swift
@State private var count = 1
```

`count` représente la quantité de carottes. Lorsque le bouton est touché, `count` change.

```swift
private let price = 2
```

`price` représente le prix unitaire de la carotte. Ici, c'est une valeur fixe, donc on utilise `let`.

```swift
private var totalPrice: Int {
    count * price
}
```

`totalPrice` représente le prix total.

Il n'a pas besoin d'être stocké séparément, car le prix total peut toujours être calculé avec `count * price`.

Lorsque `count` vaut `1`:

```swift
totalPrice = 1 * 2
```

Le résultat affiché est:

```swift
prix total: 2 $
```

Après avoir touché le bouton `+`, `count` devient `2`.

À ce moment-là, lorsque `totalPrice` est relu, il est recalculé:

```swift
totalPrice = 2 * 2
```

Le résultat affiché est:

```swift
prix total: 4 $
```

C'est le rôle d'une propriété calculée: calculer dynamiquement un nouveau résultat à partir de données existantes.

## Les propriétés calculées peuvent servir aux vérifications

Les propriétés calculées peuvent non seulement calculer des valeurs numériques, mais aussi retourner des résultats de vérification.

Par exemple, lorsque nous voulons que la quantité minimale soit 1.

Lorsque la quantité est déjà 1, le bouton `-` ne devrait pas continuer à diminuer.

Nous pouvons ajouter une propriété calculée:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Code complet:

```swift
struct ContentView: View {
    @State private var count = 1
    private let price = 2
    
    private var totalPrice: Int {
        count * price
    }
    
    private var canDecrease: Bool {
        count > 1
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button("-") {
                    if canDecrease {
                        count -= 1
                    }
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
                .foregroundStyle(canDecrease ? Color.primary : Color.gray)
                .disabled(!canDecrease)

                Image(systemName: "carrot")
                    .font(.largeTitle)

                Button("+") {
                    count += 1
                }
                .font(.largeTitle)
                .buttonStyle(.plain)
            }

            VStack {
                Text("prix: \(price) $")
                Text("quantité: \(count)")
                Text("prix total: \(totalPrice) $")
            }
            .foregroundStyle(.gray)
        }
    }
}
```

Résultat affiché:

![view](../../Resource/024_view1.png)

Ici:

```swift
private var canDecrease: Bool {
    count > 1
}
```

Ce code indique s'il est actuellement possible de diminuer.

Lorsque `count` est supérieur à `1`:

```swift
canDecrease == true
```

cela signifie qu'il est possible de diminuer.

Lorsque `count` est égal à `1`:

```swift
canDecrease == false
```

cela signifie qu'on ne peut plus continuer à diminuer.

### Vérification conditionnelle dans le bouton

Dans le bouton, on utilise:

```swift
if canDecrease {
    count -= 1
}
```

Ce n'est que lorsque `canDecrease` vaut `true` que `count` peut être diminué.

### Contrôler la couleur de premier plan de la vue

On peut aussi utiliser `canDecrease` pour contrôler la couleur de premier plan du bouton:

```swift
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ici, on utilise l'opérateur ternaire:

```swift
canDecrease ? Color.primary : Color.gray
```

La signification de ce code est: si `canDecrease` vaut `true`, la couleur de premier plan utilise `Color.primary`; si `canDecrease` vaut `false`, la couleur de premier plan utilise `Color.gray`.

`Color.primary` est une couleur sémantique système fournie par SwiftUI. Elle représente la couleur principale du texte dans l'interface actuelle.

En mode clair, `Color.primary` est généralement proche du noir; en mode sombre, `Color.primary` est généralement proche du blanc.

L'avantage d'utiliser `Color.primary` est donc qu'elle s'adapte automatiquement au mode clair et au mode sombre.

### Contrôler l'état désactivé de la vue

`disabled` sert à contrôler si une vue est dans un état désactivé:

```swift
.disabled(!canDecrease)
```

Lorsque `disabled` vaut `false`, la vue peut être touchée.

Lorsque `disabled` vaut `true`, la vue est désactivée et ne peut pas être touchée.

Utiliser `canDecrease` comme condition ici rend le code plus facile à comprendre.

Quand on voit `canDecrease`, on sait que cela signifie « peut-on continuer à diminuer maintenant ».

### Remarque supplémentaire: pourquoi y a-t-il deux vérifications?

Dans le bouton `-`:

```swift
Button("-") {
    if canDecrease {
        count -= 1
    }
}
.font(.largeTitle)
.buttonStyle(.plain)
.foregroundStyle(canDecrease ? Color.primary : Color.gray)
.disabled(!canDecrease)
```

Ici, on utilise à la fois `.disabled(!canDecrease)` et `if canDecrease` à l'intérieur du bouton.

`.disabled(!canDecrease)` est chargé de désactiver le bouton dans l'interface, afin que l'utilisateur ne puisse pas le toucher.

`if canDecrease` est chargé de vérifier à nouveau avant l'exécution du code. Il n'exécute `count -= 1` que lorsque la diminution est autorisée.

C'est une double protection. Dans un vrai développement, si le bouton est déjà désactivé, la vérification interne peut être omise. Mais dans un exemple pédagogique, la garder rend le rôle de `canDecrease` plus clair.

## Résumé

Dans cette leçon, nous avons principalement appris les propriétés calculées.

Une propriété calculée ne stocke pas directement une valeur. Au lieu de cela, lorsqu'elle est lue, elle calcule un résultat à partir de données existantes.

Par exemple:

```swift
var c: Int {
    a + b
}
```

Ici, `c` n'a pas besoin d'être stockée séparément, car elle peut être calculée avec `a + b`.

Une propriété calculée doit être déclarée avec `var`, et elle doit indiquer un type de retour.

```swift
var canDecrease: Bool {
    count > 1
}
```

Les propriétés calculées peuvent retourner non seulement des valeurs numériques, mais aussi des résultats de vérification, du contenu textuel, et même du contenu de vues SwiftUI.

Dans cette leçon, nous avons aussi appris `return`.

`return` signifie retourner un résultat:

```swift
var totalPriceText: String {
    let total = count * price
    return "Total: \(total) $"
}
```

Si une propriété calculée ne contient qu'une expression qui produit directement un résultat, `return` peut être omis.

```swift
var totalPrice: Int {
    count * price
}
```

De plus, nous avons aussi découvert `Color.primary` et `disabled`.

`Color.primary` est une couleur sémantique système de SwiftUI. Elle ajuste automatiquement son affichage selon le mode clair et le mode sombre.

```swift
.foregroundStyle(Color.primary)
```

`disabled` sert à contrôler si une vue est désactivée.

```swift
.disabled(true)
```

Cela signifie désactivée, elle ne peut pas être touchée.

```swift
.disabled(false)
```

Cela signifie disponible, elle peut être touchée.

Les propriétés calculées sont donc très courantes dans SwiftUI. Elles peuvent nous aider à organiser plus clairement les résultats de calcul, les conditions de vérification et le contenu affiché.
