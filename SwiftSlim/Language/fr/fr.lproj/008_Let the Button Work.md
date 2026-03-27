# Faire fonctionner le bouton

Dans cette leçon, nous allons principalement apprendre le bouton `Button`, l'affichage d'informations de débogage avec `print`, ainsi que les fonctions Swift.

Ces notions constituent la base de la programmation interactive en SwiftUI.

## Bouton

Le bouton est l'un des contrôles UI les plus courants. Lorsque nous devons télécharger, ouvrir ou quitter quelque chose, nous cliquons généralement sur un bouton.

Par exemple, dans l'App Store, on clique sur le bouton « Obtenir » pour télécharger une application.

![Button](../../RESOURCE/008_button.png)

Dans SwiftUI, un bouton s'écrit avec `Button`.

Utilisation de base :

```swift
Button("") {
    
}
```

La structure peut être divisée en deux parties :

```swift
Button("Texte du bouton") {
    Code exécuté lors du clic
}
```

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Après exécution, un bouton `Start` s'affiche.

![Button](../../RESOURCE/008_button1.png)

Quand l'utilisateur clique sur le bouton, le code situé dans `{}` est exécuté.

Il faut noter que `Button` fait partie des contrôles d'interface (`View`) de SwiftUI. Il doit donc être écrit dans `body`.

### Le modificateur `buttonStyle`

Dans SwiftUI, `Button` propose des styles de bouton intégrés au système, accessibles via le modificateur `buttonStyle`.

Par exemple :

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` applique un style de bouton fourni par le système.

Les options courantes incluent :

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

La différence entre ces styles réside principalement dans la présence d'une bordure, d'un fond, et dans le niveau d'accent visuel.

## Sortie `print`

En programmation, il est souvent nécessaire de vérifier si le programme est bien passé par un certain morceau de code.

Swift fournit la fonction `print` pour afficher des informations de débogage.

Écriture de base :

```swift
print("Hello")
```

Cette ligne affichera le texte dans la `Console`.

### Tester si le bouton fonctionne

Nous pouvons écrire `print` dans le bouton pour tester si le bouton a bien été cliqué.

```swift
Button("Start") {
    print("Test 123")
}
```

Quand on clique sur le bouton, la `Console` affiche :

```
Test 123
```

Cela signifie que le bouton a bien été déclenché.

![Button](../../RESOURCE/008_button3.png)

Remarque : `print` est du code Swift, ce n'est pas un contrôle d'interface. On ne peut donc pas le placer directement dans `body`, sinon cela provoquera une erreur.

Par exemple, ceci est incorrect :

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // erreur : body doit retourner une View
    }
}
```

Dans SwiftUI, `body` sert à décrire la structure de l'interface. Il ne peut contenir que des contrôles d'interface (`View`), comme `Text`, `Button`, `Image`, etc.

Le code ordinaire (`print`, logique de calcul, etc.) doit être placé dans un bouton, une fonction ou un autre gestionnaire d'événement.

### Console

Le contenu affiché par `print` apparaît dans la `Console` de Xcode.

Si vous ne voyez pas la `Console`, vous pouvez cliquer sur le bouton `Show the Debug Area` en bas à droite pour ouvrir la zone de débogage, puis sur `Show the Console` pour afficher la console.

![](../../RESOURCE/008_button4.png)

En bas à gauche de la `Console`, il y a deux onglets : `Executable` et `Previews`.

![](../../RESOURCE/008_button5.png)

Ces deux onglets correspondent à des environnements d'exécution différents : lorsque vous utilisez l'aperçu `Canvas`, la sortie de `print` apparaît sous l'onglet `Previews` ; si vous exécutez l'application sur simulateur ou sur appareil réel, elle apparaît sous l'onglet `Executable`.

Donc, si vous avez l'impression que `print` n'affiche rien, vérifiez d'abord que vous êtes sur le bon onglet.

## Exemple - art ASCII

Dans certains projets de code, on voit souvent de l'art ASCII.

L'art ASCII consiste à utiliser des caractères ordinaires pour composer un dessin. Par exemple :

![ASCII](../../RESOURCE/008_ascii.png)

Nous pouvons utiliser un bouton + `print` pour afficher un dessin ASCII.

Exemple de code :

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Quand on clique sur le bouton, la `Console` affiche :

```
 /\_/\
( o.o )
 > ^ <
```

Remarque : dans une chaîne, `\` doit être écrit `\\`, car l'antislash est un caractère d'échappement.

## Fonctions

Dans un bouton, nous pouvons écrire directement du code.

Par exemple :

```swift
Button("Start") {
    print("Hello")
}
```

Si le code est court, cela ne pose pas de problème. Mais dans un vrai projet, la logique déclenchée par un bouton peut devenir importante.

Par exemple :

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // il peut encore y avoir beaucoup de code
}
```

Si le code devient de plus en plus long, l'écrire directement dans le bouton rendra le code d'interface désordonné, difficile à lire et à maintenir.

C'est pourquoi nous regroupons généralement ce code dans une fonction, puis nous appelons cette fonction depuis le bouton.

### Qu'est-ce qu'une fonction

Une fonction est un morceau de code réutilisable.

Quand un certain code doit être exécuté, il suffit d'appeler cette fonction pour faire tourner le code qu'elle contient.

Cela rend la structure du code plus claire et facilite sa réutilisation.

### Écriture de base

En Swift, une fonction est définie avec le mot-clé **func** :

```swift
func randomInt() {
    // code
}
```

Ce code définit une fonction.

`randomInt` est le nom de la fonction, utilisé pour identifier ce morceau de code.

`()` représente l'emplacement des paramètres. On peut y recevoir des données externes. Si aucune donnée n'est nécessaire, on peut laisser vide.

Le bloc `{}` est la zone de code de la fonction, où l'on écrit tout ce qui doit être exécuté.

Par exemple :

```swift
func getName() {
    print("FangJunyu")
}
```

Cette fonction sert à afficher un texte.

### Appeler une fonction

Définir une fonction ne fait que créer ce morceau de code. Pour l'exécuter, il faut encore l'appeler.

L'appel s'écrit en ajoutant `()` après le nom de la fonction :

```swift
getName()
```

Quand le programme atteint cette ligne, il exécute le code contenu dans la fonction `getName`.

Exemple complet :

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Après exécution, la `Console` affichera :

```
FangJunyu
```

### Utiliser une fonction dans SwiftUI

Dans une vue SwiftUI, les fonctions sont généralement écrites à l'extérieur de `body`.

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Quand on clique sur le bouton, la fonction `getName()` est appelée.

Cela permet de garder le code d'interface simple, tandis que la logique détaillée est gérée dans une fonction.

### Paramètres de fonction

Parfois, une fonction doit effectuer des opérations différentes selon les données reçues.

Par exemple, nous voulons que la fonction puisse afficher différents noms, au lieu d'afficher toujours `"FangJunyu"`.

Dans ce cas, on peut utiliser des paramètres, c'est-à-dire des données transmises lors de l'appel de la fonction.

Par exemple :

```swift
func getName(name: String) {
    print(name)
}
```

Cette fonction possède maintenant un nouveau paramètre. `name` est le nom du paramètre, et `String` est son type.

Cela signifie que la fonction doit recevoir une donnée de type `String`.

Comme la fonction a maintenant besoin de données, il faut obligatoirement les fournir lors de l'appel.

```swift
getName(name: "Sam")
```

Quand on passe `"Sam"` lors de l'appel, la fonction utilise cette valeur pour l'affichage.

Résultat de l'exécution :

```
Sam
```

## Exemple - utiliser une fonction pour afficher un dessin ASCII

Dans l'exemple précédent, nous avons écrit `print` directement à l'intérieur du bouton.

Mais si le dessin ASCII est plus complexe, le code deviendra très long. Dans ce cas, on peut placer la logique dans une fonction, afin de rendre le code d'interface plus clair.

Exemple de code :

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Après exécution, quand on clique sur le bouton, la `Console` affiche :

```
 /\_/\
( o.o )
 > ^ <
```

Ici, deux choses se produisent lorsque l'utilisateur clique sur le bouton :

1. le bouton appelle la fonction `printCat()`
2. le code `print` contenu dans la fonction est exécuté

De cette manière, le code d'interface se limite à déclencher l'événement, tandis que la logique concrète est traitée dans une fonction.

Dans le développement réel, la majorité des actions de boutons sont mises en œuvre de cette façon.

## Résumé

Cette leçon a présenté trois éléments importants :

**1. Le bouton `Button`**

`Button` est le contrôle SwiftUI utilisé pour déclencher une action.

```swift
Button("Start") {

}
```

Quand l'utilisateur clique sur le bouton, le code entre accolades est exécuté.

**2. La sortie `print`**

`print` sert à afficher des informations de débogage dans la `Console`.

```swift
print("Hello")
```

Le développeur peut observer l'état d'exécution du programme grâce à la `Console`.

**3. Les fonctions**

Une fonction est un bloc de code réutilisable.

```swift
func sayHello() {
    print("Hello")
}
```

Appel d'une fonction :

```swift
sayHello()
```

Si une fonction a besoin de données, on peut utiliser des paramètres :

```swift
func sayHello(name: String) {
    print(name)
}
```

Dans les prochaines leçons, nous continuerons à apprendre d'autres contrôles SwiftUI, ainsi que la manière dont les données interagissent avec l'interface.

## Exercices

Essayez de réaliser les exercices suivants :

1. créer un bouton dont le texte est `"Hello"`
2. lorsqu'on clique sur le bouton, afficher `Hello Swift` dans la `Console`
3. placer le code d'affichage dans une fonction, puis appeler cette fonction depuis le bouton
