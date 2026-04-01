# Boucles et listes

Dans cette leçon, nous allons apprendre la boucle `for` en Swift, ainsi que `ForEach` en SwiftUI.

Elles peuvent toutes les deux nous aider à lire, dans l’ordre, les éléments d’un tableau un par un. En développement réel, nous avons souvent besoin de sortir un groupe de données une par une, puis de les traiter ou de les afficher, et les boucles sont justement un outil important pour accomplir cela.

Quand nous naviguons sur le web ou utilisons une app, nous voyons souvent beaucoup de listes ou d’éléments. Ce type de contenu est généralement d’abord stocké dans un `tableau`, puis lu un par un grâce à une `boucle`, et enfin affiché dans l’interface.

Par exemple, la liste des résultats de recherche Google :

![Google](../../Resource/017_google.png)

Chaque élément de la liste des résultats de recherche correspond généralement à une donnée, puis est affiché un par un grâce à une boucle.

Ainsi, les `tableaux` et les `boucles` apparaissent souvent ensemble. Le `tableau` sert à stocker un groupe de données, et la `boucle` sert à sortir ces données dans l’ordre et à exécuter la même opération sur elles.

Ensuite, commençons par la boucle `for` la plus basique.

## Compte à rebours

Supposons que nous voulions simuler une fonction de compte à rebours et afficher successivement `« 5, 4, 3, 2, 1 »`.

La façon la plus directe de l’écrire est :

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Même si cette méthode permet de simuler un compte à rebours, si le contenu est important, cela devient très répétitif et peu pratique à modifier ensuite.

À ce moment-là, nous pouvons d’abord mettre les données dans un tableau, puis utiliser une boucle `for` pour les afficher une par une :

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Cette écriture est plus concise et aussi plus facile à étendre. Même s’il y a beaucoup de nombres dans le compte à rebours, nous n’avons pas besoin d’écrire `print` ligne par ligne ; il suffit de laisser la boucle traiter automatiquement chaque élément du tableau.

Nous pouvons mettre ce code dans un bouton pour le tester :

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

Quand on appuie sur le bouton, la boucle `for` prend chaque entier dans `countDown` selon l’ordre du tableau, puis l’affiche dans la console.

Voyons maintenant comment fonctionne la boucle `for`.

## Boucle for

La boucle `for` sert à traiter un groupe de données dans l’ordre. Les cas les plus fréquents sont les tableaux et les intervalles.

Écriture de base :

```swift
for element in tableauOuIntervalle {
    codeÀExécuter
}
```

Par exemple, le code du compte à rebours de tout à l’heure :

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Ici, `i` représente l’élément actuellement extrait, et après `in` se trouvent les données à parcourir, c’est-à-dire le tableau `countDown`.

Le sens de ce code est le suivant : le programme extrait chaque élément du tableau `countDown` dans l’ordre. À chaque fois qu’il extrait un élément, il utilise temporairement `i` pour le représenter, puis exécute le code à l’intérieur des accolades.

Le processus d’exécution peut être compris ainsi :

* Le premier élément extrait est `5`, donc à ce moment-là la valeur de `i` est `5`
* Exécuter `print(i)` affiche `5`
* Puis continuer en extrayant l’élément suivant `4`
* Exécuter encore `print(i)` affiche `4`

Les `3`, `2` et `1` suivants seront également exécutés un par un de la même manière.

![for](../../Resource/017_for.png)

Quand tous les éléments du tableau ont été traités, la boucle `for` se termine automatiquement.

Nous pouvons utiliser la boucle `for` pour obtenir chaque élément du tableau et réaliser des fonctions comme ce compte à rebours.

**Astuce** : `i` est un nom très courant dans une boucle for, utilisé pour représenter l’élément actuellement extrait, mais ce n’est pas une écriture obligatoire. On peut aussi utiliser d’autres noms anglais.

Par exemple, utiliser `num` pour représenter chaque élément extrait :

```swift
for num in countDown {
    print(num)
}
```

À l’intérieur des accolades, il faut également utiliser `num` pour représenter l’élément actuellement extrait.

### Parcourir un intervalle

La boucle `for` peut non seulement parcourir des tableaux, mais aussi des intervalles.

Par exemple, si nous devons calculer la somme des entiers positifs jusqu’à `50`, nous devons additionner un par un tous les entiers entre `1` et `50`.

L’écriture la plus directe pourrait être :

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

Le problème avec cette écriture, c’est que nous devons écrire chaque nombre à la main. C’est contraignant, et cela ne convient pas à un vrai contexte de développement.

À ce moment-là, nous pouvons utiliser l’opérateur d’intervalle avec la boucle `for` pour accomplir cela.

Dans la leçon précédente sur les « opérateurs », nous avons déjà appris l’opérateur d’intervalle :

```swift
1...3   // 1, 2, 3
```

Ici, `...` représente un intervalle fermé, c’est-à-dire qu’il inclut le point de départ et le point d’arrivée.

Ainsi, nous pouvons ici utiliser une boucle `for` sur l’intervalle d’entiers de `1` à `50` :

```swift
for i in 1...50 {
    
}
```

Nous devons additionner ces entiers, donc nous avons aussi besoin d’une variable pour stocker le total :

```swift
var count = 0
```

Ensuite, à chaque tour de boucle, on ajoute le nombre actuellement extrait à `count` :

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

Ce code signifie :

* `count` sert à stocker le total actuel
* La boucle `for` extrait un par un les entiers de `1` à `50`
* Chaque fois qu’un entier est extrait, `count += i` est exécuté
* Quand la boucle se termine, `count` contient le total final

De cette façon, nous pouvons obtenir la somme de tous les entiers positifs jusqu’à `50`.

De la même manière, si nous devons calculer la somme des entiers de `1` à `100`, il suffit de modifier l’intervalle :

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

La boucle `for` peut donc non seulement parcourir des tableaux, mais aussi parcourir un intervalle. Cette capacité à traiter des données de façon répétée et ordonnée est très courante en développement.

Elle peut nous aider à traiter automatiquement beaucoup de tâches répétitives, sans devoir écrire manuellement l’addition de chaque nombre, ou d’autres opérations répétitives similaires.

## Les boucles dans SwiftUI

La boucle `for` précédente appartient au langage Swift.

Mais dans SwiftUI, nous ne pouvons pas utiliser directement `for` dans la structure d’une vue pour générer des vues :

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

C’est parce que ce dont `VStack` a besoin à l’intérieur, ce sont des vues SwiftUI, alors qu’une boucle `for` ordinaire n’est pas elle-même une vue.

Si nous voulons générer de façon répétée une interface selon le contenu d’un tableau dans SwiftUI, nous devons utiliser `ForEach`.

Par exemple, si nous voulons afficher tous les noms des membres d’un groupe, nous pouvons écrire :

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Résultat affiché :

![for1](../../Resource/017_for1.png)

Ensuite, ajoutons les mêmes modificateurs à chaque `Text` :

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Maintenant, chaque `Text` s’affiche avec une police plus petite et plus épaisse.

Résultat affiché :

![](../../Resource/017_for2.png)

Même si les modificateurs rendent l’interface plus belle, ils rendent aussi le code plus long et plus répétitif.

Si le nombre de noms continue d’augmenter, ou si plus tard nous voulons modifier de façon uniforme la police, la couleur et d’autres styles, il faudra écrire et modifier beaucoup de code identique. Cela devient assez contraignant et peu pratique à maintenir.

À ce moment-là, nous pouvons d’abord mettre ces noms dans un tableau, puis utiliser `ForEach` dans SwiftUI pour générer de façon répétée des vues à partir des données du tableau :

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

Ce code est plus concis. `ForEach` lit chaque élément du tableau un par un, puis affiche le contenu correspondant dans l’interface.

Quand nous ajouterons plus tard de nouveaux noms, il suffira de modifier les noms dans le tableau `names`. Nous n’aurons pas besoin d’ajouter à chaque fois des `Text` et des modificateurs complexes.

## ForEach

`ForEach` est une structure de SwiftUI utilisée pour générer des vues de façon répétée. On peut la comprendre comme une structure dans SwiftUI semblable à une boucle `for`.

Utilisation de base :

```swift
ForEach(tableau, id: \.self) { element in
    code SwiftUI
}
```

Par exemple, les noms du groupe de tout à l’heure :

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Ce code signifie :

`names` est le tableau parcouru, c’est-à-dire les données à afficher.

`id:\.self` signifie qu’on utilise l’élément lui-même dans le tableau pour distinguer chaque élément.

Dans l’exemple actuel, le tableau contient des chaînes de caractères :

```swift
["Sam", "John", "Wathon", "Bob"]
```

SwiftUI va donc directement utiliser les chaînes elles-mêmes, comme "Sam", "John", "Wathon" et "Bob", pour distinguer les différents contenus.

Pour les tableaux simples courants au stade débutant, comme `String` et `Int`, nous pouvons généralement écrire d’abord :

```swift
id: \.self
```

Pour l’instant, il suffit de retenir cette seule forme. Il n’est pas nécessaire d’approfondir davantage les autres règles de `id`.

Le `item` dans `item in` représente l’élément actuellement extrait.

Par exemple, lors du premier passage, `item` vaut `"Sam"`, et lors du second passage, `item` vaut `"John"`.

Ainsi :

```swift
Text(item)
```

devient successivement :

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

La fonction de ce code est donc : extraire chaque nom du tableau `names` un par un, puis générer une vue `Text` pour chaque nom.

### Processus d’exécution

Le processus d’exécution peut être compris ainsi :

* `ForEach` lit d’abord le premier élément `"Sam"` du tableau `names`
* `item` représente temporairement `"Sam"`
* `Text(item)` affiche `"Sam"`
* Ensuite, il continue à lire l’élément suivant `"John"`
* Puis il répète à nouveau le même code de vue

Au final, tous les noms du tableau seront affichés.

L’avantage de cette manière d’écrire est que, lorsque le nombre de noms augmente, nous n’avons pas besoin d’écrire beaucoup de `Text` de façon répétée ; il suffit de modifier le contenu du tableau.

### Parcourir des photos

`ForEach` peut non seulement afficher du texte, mais aussi des images, des couleurs ou d’autres vues SwiftUI.

Par exemple, préparons 4 images :

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Faites glisser ces quatre images dans le dossier Assets de Xcode.

![image](../../Resource/017_for3.png)

Si nous n’utilisons pas `ForEach`, nous devons écrire chaque image manuellement :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Résultat affiché :

![image](../../Resource/017_for4.png)

Même si cette écriture permet d’obtenir le résultat, le code devient relativement long.

Si le nombre d’images augmente, il faudra écrire de plus en plus de code `Image`.

Si plus tard nous voulons modifier de façon uniforme la taille des images, il faudra aussi les modifier une par une.

À ce moment-là, nous pouvons mettre les noms des images dans un tableau, puis utiliser `ForEach` pour générer de façon répétée des vues d’image :

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Ici, `images` est un tableau de chaînes de caractères, et chaque élément du tableau est un nom d’image.

`ForEach(images, id: \.self)` signifie lire un par un chaque élément du tableau `images`, utiliser l’élément lui-même pour distinguer chaque élément, puis générer la vue correspondante selon l’élément actuel.

Par exemple, si le premier élément lu est `"430F9BEF"`, alors :

```swift
Image(item)
```

équivaut à :

```swift
Image("430F9BEF")
```

Les images suivantes seront également affichées une par une de la même manière.

![image](../../Resource/017_for4.png)

Ici, nous utilisons toujours :

```swift
id: \.self
```

La raison est la même qu’avant : comme les éléments du tableau `images` sont aussi des chaînes de caractères simples, au stade débutant nous pouvons directement utiliser l’élément lui-même comme moyen de distinguer chaque élément.

On peut le comprendre simplement comme une formule fixe :

**Quand `ForEach` parcourt un tableau simple comme `String` ou `Int`, on écrit généralement `id: \.self`.**

### Ajouter des images

Si plus tard nous devons ajouter des images, il suffit de modifier le contenu du tableau :

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

Il n’est pas nécessaire de réécrire à nouveau du code `Image`.

S’il y a beaucoup d’images, on peut l’utiliser avec `ScrollView`. Sinon, lorsque le contenu dépasse l’écran, il ne sera pas possible de tout prévisualiser complètement.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modifier les images

Quand nous devons modifier de façon uniforme le style des images, il suffit de modifier le code à l’intérieur de `ForEach`.

Par exemple, changer la largeur à `80` :

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

Ainsi, toutes les images seront modifiées en même temps, sans devoir les changer une par une.

C’est un rôle important de `ForEach` :

**Quand plusieurs vues ont la même structure et que seul le contenu change, on peut n’écrire qu’une seule fois le code de la vue, puis laisser les données du tableau décider de ce qui sera affiché.**

## Résumé

Dans cette leçon, nous avons appris la boucle `for` et `ForEach`.

La boucle `for` sert à traiter dans l’ordre les éléments d’un tableau ou d’un intervalle, et elle est davantage orientée vers le traitement des données.

`ForEach` sert dans SwiftUI à générer de façon répétée des vues selon le contenu d’un tableau, et il est davantage orienté vers l’affichage de l’interface.

Au stade débutant actuel, la forme la plus courante de `ForEach` est :

```swift
ForEach(tableau, id: \.self) { element in
    code SwiftUI
}
```

Ici, `id: \.self` signifie utiliser l’élément lui-même pour distinguer chaque élément.

Quand le contenu du tableau est constitué de types simples comme `String` et `Int`, nous pouvons généralement commencer avec cette seule écriture.

Plus tard, quand vous naviguerez sur le web ou dans des apps et que vous verrez un groupe de textes répétés, d’images ou d’autres contenus de liste, vous pourrez penser qu’en SwiftUI, ce contenu est généralement d’abord placé dans un tableau, puis affiché un par un grâce à `ForEach`.
