# Système de types

Dans les leçons précédentes, nous avons déjà appris ce qu'était une variable, et nous savons qu'une variable peut stocker différents types de données.

Par exemple :

```swift
var hello = "Hello, World"
```

Ici, `hello` contient un texte, donc son type est `String`.

Nous allons maintenant étudier plus systématiquement la notion de type (`Type`), ainsi que la déclaration explicite de type et l'inférence de type, afin de mieux comprendre la nature des variables.

## Qu'est-ce qu'un type

En Swift, chaque valeur a un type bien défini. Le type détermine ce qu'est cette valeur et ce qu'elle peut faire.

Par exemple :

- `42` est un `Int` (entier)
- `"Hello"` est un `String` (chaîne de caractères)
- `true` est un `Bool` (booléen)

Elles appartiennent à des types différents, et leurs usages sont eux aussi différents.

## Les types de base courants en Swift

Au début de l'apprentissage, les types les plus courants sont les suivants :

- `String` : chaîne de caractères (texte)
- `Int` : entier
- `Double` : nombre à virgule flottante (avec décimales, plus précis)
- `Bool` : booléen (`true`/`false`)

En plus de cela, il existe aussi `Float` (nombre flottant), mais sa précision est inférieure à celle de `Double`, donc il est en général moins utilisé ; on trouve aussi `Character` (caractère unique), comme `"A"` ou `"!"`.

### Déclaration de type (type explicite)

En Swift, on peut indiquer manuellement le type lors de la déclaration d'une variable :

```swift
var age: Int = 18
var price: Double = 9.9
var name: String = "FangJunyu"
var isLogin: Bool = false
```

On ajoute `: Type` après le nom de la variable pour déclarer son type.

Pour un tableau, l'écriture du type est `: [Type]` :

```swift
var scores: [Int] = [90, 85, 78]
var tags: [String] = ["Swift", "iOS"]
```

Dans ce code, le tableau `scores` ne peut contenir que des éléments de type `Int`, et `tags` uniquement des éléments de type `String`.

Déclarer explicitement le type permet de rendre l'intention du code plus claire, et d'éviter certaines erreurs d'inférence.

## Inférence de type

Dans de nombreux cas, il n'est pas nécessaire de déclarer explicitement le type :

```swift
var age = 18         // Int
var price = 9.9      // Double
var name = "Sam"    // String
var isLogin = false  // Bool
var scores= [90, 85, 78]	// [Int]
var tags = ["Swift", "iOS"]	// [String]
```

Cela s'explique par le fait que le compilateur Swift déduit automatiquement le type à partir de la valeur initiale.

## Déclaration explicite et inférence de type

Dans les leçons précédentes, nous n'avons pas introduit la déclaration explicite, comme par exemple :

```swift
var age: Int = 18
```

Nous avons plutôt privilégié l'inférence :

```swift
var age = 18
```

Dans cet exemple, ces deux écritures sont équivalentes : dans les deux cas, `age` sera déterminé comme étant de type `Int`. L'écriture par inférence est cependant plus concise.

La raison pour laquelle nous n'insistions pas sur la déclaration explicite au début, c'est que l'inférence de type réduit la quantité d'informations supplémentaires dans le code, ce qui diminue la charge de compréhension pour les débutants.

## Pourquoi a-t-on besoin des types

Swift est un langage fortement typé (`Strongly Typed Language`).

Cela signifie que, une fois le type d'une variable déterminé, il ne peut plus être changé librement.

Par exemple :

```swift
var age: Int = 18

age = 20	// Success
age = "20"    // Error, Cannot assign value of type 'String' to type 'Int'

var nums: [Int] = [1, 2, 3, "Hello"]  // Error
```

Le premier `20` est de type `Int`, il peut donc être affecté à `age`. Le second `"20"` est de type `String`, ce qui ne correspond pas à `Int`, donc une erreur apparaît.

`nums` est un tableau de type `[Int]`. Il ne peut contenir que des entiers, pas de chaînes.

Les types permettent de contraindre l'utilisation des données et de détecter les incompatibilités dès la compilation. Cela réduit les bugs liés aux confusions de types et améliore la stabilité ainsi que la maintenabilité du code.

## Quand faut-il obligatoirement déclarer le type explicitement

Même si Swift sait déduire les types automatiquement, il existe certains cas où le compilateur ne peut pas les déterminer, ou risque de les déduire de manière incorrecte. Dans ce cas, il faut les déclarer manuellement.

**1. Tableau vide**

Lorsqu'on crée un tableau vide, il faut déclarer explicitement son type :

```swift
var nums: [Int] = []
```

Si on n'écrit pas le type :

```swift
var nums = []   // Error，Empty collection literal requires an explicit type
```

Le compilateur ne peut pas déduire le type des éléments à partir d'un tableau vide, ce qui provoque une erreur de compilation.

**2. Éviter une mauvaise inférence**

```swift
var value = 10   // Int
```

Dans cet exemple, `10` pourrait aussi représenter un nombre flottant (`Double`), mais comme il n'y a pas de point décimal, le compilateur le déduit par défaut comme `Int`.

Si vous voulez que `value` soit un nombre flottant, il faut déclarer explicitement le type :

```swift
var value: Double = 10   // Double
```

Quand le résultat de l'inférence ne correspond pas à ce que l'on souhaite, il faut corriger cela soit en déclarant explicitement le type, soit en modifiant la forme du littéral.

**3. Types personnalisés**

Plus tard, nous apprendrons aussi à définir nos propres types. Lorsqu'on utilise des types personnalisés, une déclaration explicite est aussi souvent nécessaire :

```swift
var info: GameInfo
var users: [User] = []
```

La raison est la même que pour un tableau vide : le compilateur ne peut pas déduire le type à partir d'une valeur vide.

## Conversion de types

En Swift, les conversions automatiques entre types différents ne sont pas autorisées : elles doivent être faites manuellement.

Par exemple, pour additionner deux nombres de types différents :

```swift
var a: Int = 10
var b: Double = 12.5

var result = a + b	// Error, Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
```

Dans ce code, `a` est un `Int` et `b` un `Double`. Comme les types sont différents, l'opération ne peut pas être effectuée directement.

Avant de faire le calcul, il faut convertir l'une des valeurs dans le même type que l'autre :

```swift
var result = Double(a) + b
```

Ce code signifie que `a`, qui est un `Int`, est d'abord converti en `Double`, puis additionné à `b`, et le résultat est affecté à `result`.

Il faut noter que la conversion de type ne modifie pas le type de la variable d'origine. Par exemple, `Double(a)` ne transforme pas `a` en `Double` ; cela crée simplement une nouvelle valeur `Double` utilisée dans l'opération.

D'autres types peuvent être convertis de manière similaire, en utilisant le type cible suivi de `()` et en lui passant la valeur à convertir. Par exemple :

```
Int()、Double()、String()
```

Exemple :

```swift
let score: Int = 95
let message = "Score: " + String(score)  // Int → String

let price: Double = 9.9
let intPrice = Int(price)  // Double → Int， 9
```

Il faut noter que toutes les conversions ne conservent pas exactement la valeur. Par exemple, lors d'une conversion de `Double` vers `Int`, la partie décimale est simplement tronquée, sans arrondi.

## Alias de type

En Swift, on peut aussi donner un autre nom à un type existant afin de rendre le code plus clair :

```swift
typealias UserID = Int
typealias Score = Double

var id: UserID = 1001
var grade: Score = 98.5
```

Ici, `UserID` reste fondamentalement un `Int`. Le type ne change pas, seul son nom devient plus parlant.

Dans les projets volumineux ou avec des types plus complexes, les alias de type peuvent améliorer la lisibilité du code.

## Exemple lié aux types

Voyons maintenant, avec un petit exemple, le rôle des types dans le développement concret.

### Créer une variable

Commençons par créer une variable `age` :

```swift
var age = 20
```

Comme nous devons afficher et modifier cette variable dans SwiftUI, nous devons la déclarer avec `@State` :

```swift
@State private var age = 20
```

Nous avons déjà mentionné `private` précédemment. Cela signifie que cette variable ne peut être utilisée que dans la vue actuelle. Nous y reviendrons plus tard plus en détail.

### Afficher les données dans SwiftUI

Affichons la variable `age` dans SwiftUI :

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
        }
    }
}
```

La vue affichera maintenant :

```swift
age: 20
```

### Modifier les données

Ensuite, ajoutons deux boutons pour modifier `age` :

```swift
Button("changeAge1") {
    age = 18
}
Button("changeAge2") {
    age = "18"
}
```

### Résultat de l'exécution

Lorsque l'on clique sur `changeAge1`, `age` reçoit la valeur `18` :

```swift
age = 18
```

Comme `18` est de type `Int`, donc du même type que `age`, l'affectation réussit.

`changeAge2`, en revanche, provoque une erreur :

```swift
age = "18"
```

Message d'erreur :

```
Cannot assign value of type 'String' to type 'Int'
```

Cela vient du fait que `"18"` est de type `String` (une chaîne doit être entourée de `""`), alors que `age` est de type `Int`. Les types sont donc incompatibles.

### Pourquoi cette erreur apparaît-elle ?

Le point clé se trouve dans cette ligne :

```swift
@State private var age = 20   // Int
```

Même si nous n'avons pas déclaré explicitement le type, la valeur initiale `20` est un `Int`, donc le compilateur déduit automatiquement que `age` est de type `Int`.

Une fois ce type déterminé, la variable ne peut plus recevoir une valeur d'un autre type.

De plus, le bouton `changeAge2` n'échoue pas "à l'exécution" : l'erreur apparaît déjà à la compilation, et le code ne peut donc pas être compilé.

C'est aussi l'un des avantages du typage fort de Swift : les problèmes de type peuvent être détectés dès l'écriture du code.

### Écriture correcte

Après avoir supprimé le code incorrect :

```swift
struct ContentView: View {
    @State private var age = 20
    var body: some View {
        VStack(spacing: 10) {
            Text("age: \(age)")
            Button("changeAge1") {
                age = 18
            }
        }
    }
}
```

Quand on clique sur le bouton `changeAge1`, la vue se met à jour en :

```
age: 18
```

### Déclaration explicite du type (optionnelle)

On peut aussi indiquer explicitement le type dès la définition :

```swift
@State private var age: Int = 20
```

Cette écriture rend le type plus visible, mais elle n'est pas indispensable dans les cas simples.

## Résumé

Cette leçon a principalement présenté le système de types de Swift et son rôle dans le développement concret.

En Swift, chaque valeur a un type bien défini, et ce type détermine le sens des données ainsi que les opérations auxquelles elles peuvent participer.

Swift est fortement typé : une fois le type d'une variable déterminé, on ne peut plus lui affecter une valeur d'un autre type. Cette contrainte permet de détecter les erreurs dès la compilation, de réduire les problèmes à l'exécution et d'améliorer la sécurité du code.

Le type d'une variable peut être déduit automatiquement à partir de sa valeur initiale, ou déclaré explicitement. Dans certains cas, comme les tableaux vides, les erreurs d'inférence ou les types personnalisés, la déclaration explicite est indispensable.

Les conversions entre types différents ne sont pas automatiques : il faut les effectuer explicitement avec des formes comme `Int()`, `Double()` ou `String()`.

Les types peuvent aussi recevoir des alias, ce qui est particulièrement utile dans les projets complexes pour améliorer la lisibilité.

Le type n'est pas seulement une étiquette de données, c'est aussi un mécanisme de contrainte qui permet de garantir une utilisation sûre, claire et maîtrisée des données.

## Connaissance complémentaire - Types optionnels

Lors de certaines conversions de type, l'opération peut échouer.

Par exemple, convertir une chaîne en `Double` :

```swift
let input = "3.14"
let pi = Double(input)  // Double?
```

Ici, `Double(input)` ne renvoie pas un `Double`, mais :

```
Double?
```

C'est ce qu'on appelle un type optionnel (`Optional`).

### Pourquoi renvoyer un type optionnel ?

Parce que le contenu d'une chaîne n'est pas garanti. `"3.14"` peut être converti en `Double`, mais `"Hello"` ne peut pas l'être.

Autrement dit, cette opération peut réussir ou échouer.

C'est pourquoi Swift utilise un type optionnel pour représenter cette incertitude.

### Qu'est-ce qu'un type optionnel ?

Un type optionnel signifie qu'une valeur peut exister ou ne pas exister.

Par exemple :

```
Double?
```

Ce type signifie que si la valeur existe, elle sera affichée sous la forme `Optional(...)` lors de l'impression ; si elle n'existe pas, le résultat sera `nil`.

Il faut noter que `nil` signifie "pas de valeur", et non pas `0` ni une chaîne vide.

### Exemple

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Sortie :

```
pi:Optional(3.14)
```

Cela signifie que la chaîne a été convertie avec succès en `Double`, donnant `3.14`, mais comme le type est `Double?`, la valeur est enveloppée dans `Optional`.

Si la conversion échoue :

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi)")
```

Sortie :

```
pi: nil
```

Comme `"Hello"` ne peut pas être converti en `Double`, la conversion échoue et retourne `nil`.

### Que signifie `Optional(...)` ?

Quand nous affichons directement une valeur optionnelle :

```swift
let input = "3.14"
let pi = Double(input)
print("pi:\(pi)")
```

Swift affiche alors sa "description de débogage" :

```
Optional(3.14)
```

Ce n'est pas une partie des données réelles, mais une indication que la valeur actuelle est de type optionnel et qu'elle contient une valeur.

### Déballer un type optionnel

Dans le développement réel, nous avons généralement besoin d'extraire la valeur véritable d'un type optionnel. Ce processus s'appelle le déballage (`Unwrapping`).

Une manière courante de le faire consiste à utiliser `??` pour fournir une valeur par défaut :

```
??
```

Cela s'appelle l'opérateur de coalescence nulle (`Nil-Coalescing Operator`).

Par exemple :

```swift
name ?? "FangJunyu"
```

Ce code signifie que si `name` contient une valeur, on la retourne ; si `name` vaut `nil`, on utilise la valeur par défaut `"FangJunyu"`.

Il faut noter que la valeur par défaut doit être du même type que la valeur contenue dans l'optionnel.

### Utiliser `??` pour fournir une valeur par défaut

```swift
let input = "30"
let pi = Double(input)
print("pi:\(pi ?? 10)")	// 30
```

Sortie :

```
pi: 30
```

Quand `input` est converti en `Double`, la conversion réussit et la valeur est affichée. Si la conversion échouait, c'est la valeur par défaut fournie après `??` qui serait utilisée.

Si la conversion échoue :

```swift
let input = "Hello"
let pi = Double(input)

print("pi: \(pi ?? 10)")
```

Sortie :

```
pi: 10
```

Ici, lorsque `input` est converti en `Double`, la conversion échoue et renvoie `nil`. `??` fournit alors une valeur par défaut.

Le type optionnel sert donc à représenter une situation où une valeur peut exister ou non.

Dans les opérations susceptibles d'échouer, comme les conversions de type, Swift renvoie un type optionnel afin de garantir la sécurité du programme.

Lorsque nous avons besoin de la valeur qu'il contient, nous pouvons utiliser `??` pour fournir une valeur par défaut, ce qui permet d'obtenir un résultat raisonnable même en présence de `nil`.
