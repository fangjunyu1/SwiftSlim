# Comprendre les vues

Dans cette leçon, nous revenons au `ContentView` d'origine.

```swift
struct ContentView: View {
    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

Lorsque nous avons découvert SwiftUI pour la première fois, il y avait beaucoup de mots-clés dans `ContentView` que nous ne comprenions pas.

Par exemple `struct`, `View`, `var`, `body`, `some View` et d'autres mots-clés.

À ce moment-là, nous savions peut-être seulement ceci : **si nous écrivons du code dans `body`, le contenu apparaît à l'écran.**

Maintenant que nous avons appris `struct`, les variables, les méthodes et les protocoles, nous pouvons comprendre à nouveau ce code et l'utiliser pour comprendre la relation entre les vues SwiftUI.

## Revoir ContentView

Après la création d'un projet SwiftUI, Xcode génère par défaut un fichier `ContentView`.

Le code d'exemple est le suivant :

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Bonjour, le monde !")
        }
        .padding()
    }
}
```

Ce code peut être compris en le découpant en plusieurs parties.

D'abord :

```swift
import SwiftUI
```

Cette ligne importe le framework SwiftUI.

Après avoir importé SwiftUI, nous pouvons utiliser des vues SwiftUI comme `View`, `Text`, `Image`, `VStack` et `Button`.

## La structure ContentView

Cette ligne de code crée une structure :

```swift
struct ContentView: View
```

Parmi ces éléments :

```swift
struct ContentView
```

signifie que `ContentView` est une structure.

Dans la leçon précédente, nous avons appris `struct`. Il peut regrouper des champs liés entre eux, et il peut contenir des propriétés et des méthodes.

Par exemple :

```swift
struct ContentView: View {
    var name = "FangJunyu"

    func printName() {
        print(name)
    }

    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

Dans cet exemple, `ContentView` contient trois éléments : `name`, `printName` et `body`.

Autrement dit, `struct` peut regrouper des propriétés, des méthodes et du contenu de vue liés entre eux.

![contentView](../../Resource/023_contentVIew.png)

## View est un protocole

Continuons à regarder cette ligne de code :

```swift
struct ContentView: View 
```

Le `View` après les deux-points signifie que `ContentView` respecte le protocole `View`.

On peut le comprendre ainsi : si `ContentView` veut devenir une vue SwiftUI, il doit satisfaire les exigences du protocole `View`.

### Le protocole Identifiable

Lorsque nous avons appris la liste de films plus tôt, nous avons rencontré le protocole `Identifiable`.

À ce moment-là, nous devions parcourir un tableau `Movie` dans `ForEach`, mais la structure `Movie` n'avait pas d'identifiant unique, elle ne pouvait donc pas être utilisée directement avec `ForEach`.

Nous devions donc faire en sorte que la structure `Movie` respecte le protocole `Identifiable`, afin qu'elle réponde à l'exigence de `ForEach` concernant un identifiant unique.

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
}
```

Le protocole `Identifiable` exige : **ce type doit avoir un champ `id` qui l'identifie.**

Après que `Movie` fournit un champ `id`, il peut satisfaire les exigences de `Identifiable`.

Ainsi, lorsque nous l'utilisons dans `ForEach`, SwiftUI peut reconnaître chaque donnée.

```swift
ForEach(lists) { movie in
    // ...
}
```

### Le protocole View

Le protocole `View` fonctionne de la même manière.

Si un type veut devenir une vue SwiftUI, il doit respecter le protocole `View`.

L'exigence la plus importante du protocole `View` est de fournir un `body`.

```swift
struct ContentView: View {
    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

On peut comprendre l'exigence du protocole `View` ainsi : **il accepte la vue SwiftUI renvoyée par `body`, et `ContentView` affiche des vues SwiftUI à travers `body`.**

### Que se passe-t-il si nous ne respectons pas View ?

Si nous écrivons ceci :

```swift
struct ContentView {
}
```

C'est seulement une structure ordinaire, pas une vue SwiftUI.

Elle ne provoque pas directement d'erreur, car une structure ordinaire est du code Swift valide.

Cependant, si nous la mettons dans une prévisualisation :

```swift
#Preview {
    ContentView()
}
```

une erreur apparaît.

La raison est : **une prévisualisation doit afficher une vue SwiftUI, mais ce `ContentView` ne respecte pas le protocole `View`.**

Donc, si nous voulons que `ContentView` puisse être affiché à l'écran, nous devons lui faire respecter le protocole `View` :

```swift
struct ContentView: View {
}
```

En même temps, nous devons fournir `body` comme l'exige le protocole `View`. S'il n'y a pas de `body`, le compilateur signalera encore une erreur.

La bonne manière :

```swift
struct ContentView: View {
    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

À ce moment-là, `ContentView` est une vraie vue SwiftUI qui peut être affichée.

## body est le point d'entrée pour afficher une vue

Dans SwiftUI, `body` est le point d'entrée du contenu d'une vue.

```swift
var body: some View {
    Text("Bonjour, le monde !")
}
```

On peut le découper en trois parties :

**1. var body**

```swift
var body
```

Cela définit une variable nommée `body`.

**2. some View**

```swift
: some View
```

Cela signifie que ce `body` renvoie une vue.

**3. { ... }**

```swift
{
    Text("Bonjour, le monde !")
}
```

Cela représente le contenu de vue affiché. Dans ce code, le contenu affiché est une vue `Text`.

Autrement dit, ce que nous écrivons dans `body` est ce qui apparaît à l'écran.

Par exemple :

```swift
var body: some View {
    VStack(alignment: .leading) {
        Text("Nom :")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
}
```

Ce code signifie : **l'écran affiche un contenu organisé verticalement, avec deux textes à l'intérieur.**

### Le nom body ne peut pas être changé librement

Il est important de noter que le nom `body` ne peut pas être changé librement.

Si nous écrivons :

```swift
struct ContentView: View {
    var content: some View {
        Text("Bonjour, le monde !")
    }
}
```

Ce `content` est aussi une propriété de vue, mais il ne peut pas remplacer `body`.

C'est parce que le nom exigé par le protocole `View` est `body`.

## Qu'est-ce que some View ?

Dans SwiftUI, `some View` signifie renvoyer une vue spécifique, mais sans écrire le type complet de cette vue.

```swift
var body: some View
```

Autrement dit, `some View` ne signifie pas qu'il n'y a pas de type. Le type réel existe toujours, et le compilateur connaît ce type, mais il peut être complexe, donc Swift nous permet de le masquer avec `some View`.

### Qu'est-ce que some ?

Dans Swift, `some` est un mot-clé utilisé pour déclarer un type opaque.

Un type opaque signifie : **la valeur de retour a un type concret, et le compilateur sait quel est ce type concret, mais nous n'écrivons pas directement ce type concret.**

Par exemple :

```swift
func makeView() -> some View {
    Text("Bonjour")
}
```

Cela signifie que `makeView` renvoie un type concret qui respecte le protocole `View`.

### Pourquoi avons-nous besoin de some ?

En apprenant les variables, nous avons appris que : **les valeurs dans Swift ont besoin soit d'une annotation de type explicite, soit d'une inférence automatique de type par le compilateur.**

Par exemple :

```swift
let a: Int = 10
```

Ici, la constante `a` est de type `Int`.

Les vues SwiftUI ne font pas exception. Lorsque nous utilisons `body` pour afficher une vue SwiftUI, `body` doit renvoyer le type SwiftUI correspondant.

Par exemple, si nous utilisons `body` pour afficher une vue `Text`, nous devons faire en sorte que `body` renvoie le type `Text` correspondant.

```swift
var body: Text {
    Text("Fang Junyu")
}
```

Dans cet exemple, la vue affichée dans `body` est une vue `Text`, et le type de retour est également `Text`.

Ce n'est que lorsque le type interne correspond au type déclaré que l'exigence de cohérence des types du compilateur est satisfaite.

**Problème d'incompatibilité de types**

Si nous définissons le type de `body` sur `Color`, mais que nous affichons `Text` :

```swift
var body: Color {
    Text("Fang Junyu")
}
```

le type de `body` et le type du code interne ne correspondent pas, ce qui provoque une erreur d'incompatibilité de types.

```swift
Cannot convert return expression of type 'Text' to return type 'Color'
```

À ce moment-là, nous devons modifier manuellement le type de retour de `body`.

**Types de vue complexes**

Dans le développement réel, une interface ne contient généralement pas seulement un `Text`.

Si nous devons afficher un `VStack` plus complexe, nous devrions écrire manuellement un type de retour complexe.

Par exemple :

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
        Text("Bonjour, le monde !")
    }
}
```

Ce code renvoie un `VStack`, et à l'intérieur du `VStack` se trouvent des vues de type `Image` et `Text`.

Le type de retour de `body` est :

```swift
VStack<TupleView<(Image,Text)>>
```

Comme on peut le voir, ce type de retour est très complexe, et il introduit aussi `TupleView`, que nous n'avions pas encore vu.

Ici, `TupleView` peut être compris comme : **emballer plusieurs vues enfants en une seule vue.**

**Types de vue encore plus complexes**

Si nous ajoutons des modificateurs à la vue :

```swift
var body: VStack<TupleView<(Image,Text)>> {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Bonjour, le monde !")
    }
    .padding()
}
```

alors le type de retour de cette vue devient très complexe et ne peut pas être décrit en détail ici.

Le type de retour existant `VStack<TupleView<(Image,Text)>>` ne peut plus décrire les modificateurs, donc une erreur se produit.

**some View simplifie le type de retour**

Pour cette situation, SwiftUI propose une solution concise : utiliser `some View` pour simplifier le code.

Lorsque nous changeons `body` au type `some View` :

```swift
var body: some View {
    VStack {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Bonjour, le monde !")
    }
    .padding()
}
```

nous n'avons plus besoin d'écrire le type de retour complet chaque fois que nous modifions le code de la vue.

C'est parce que `some View` signifie renvoyer une vue concrète qui respecte le protocole `View`.

Autrement dit, les vues SwiftUI comme `VStack` et `Image` respectent toutes le protocole `View`. Après l'ajout de modificateurs, le type de vue renvoyé respecte toujours le protocole `View`.

Elles peuvent donc toutes être renvoyées comme `some View`.

### some View ne peut pas renvoyer n'importe quelle vue librement

Même si `some View` peut masquer des types complexes, il n'est pas « sans type ».

Sa règle principale est : **le compilateur doit pouvoir déterminer un type de retour concret**.

Par exemple :

```swift
var title: some View {
    Text("Bonjour")
}
```

Cela renvoie une vue `Text`.

Cependant, si nous essayons de renvoyer deux vues, une erreur se produit :

```swift
var title: some View {
    Text("Bonjour")
    Image(systemName: "star")
}
```

C'est parce que `some View` doit finalement renvoyer une seule structure de vue, alors qu'ici nous essayons de renvoyer deux vues indépendantes.

### Solution

Il existe généralement deux solutions : un conteneur et `@ViewBuilder`.

**1. Envelopper avec un conteneur**

```swift
var title: some View {
    VStack {
        Text("Bonjour")
        Image(systemName: "star")
    }
}
```

Dans ce code, `title` renvoie un `VStack`, tandis que `Text` et `Image` sont des vues enfants à l'intérieur du `VStack`.

La structure de vue acceptée par `some View` est `VStack<...>`, ce qui satisfait l'exigence selon laquelle `some View` renvoie une seule structure de vue. 

C'est aussi pourquoi, dès le début de l'apprentissage de SwiftUI, nous recommandons d'envelopper le code de vue dans un conteneur externe `VStack`.

**2. Utiliser @ViewBuilder**

Nous pouvons aussi ajouter le modificateur `@ViewBuilder` avant `some View` :

```swift
@ViewBuilder
var title: some View {
    Text("Bonjour")
    Image(systemName: "star")
}
```

`@ViewBuilder` peut combiner plusieurs vues en un seul résultat de retour.

Son essence reste de fusionner plusieurs vues en une seule vue, afin de satisfaire l'exigence selon laquelle `some View` renvoie une seule structure de vue.

### Pourquoi body peut-il contenir directement plusieurs vues ?

Si nous écrivons plusieurs vues dans `var body`, par exemple :

```swift
var body: some View {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Bonjour, le monde !")
}
```

dans certains cas, ce `body` ne signalera pas d'erreur.

La raison est que `body` dans le protocole `View` prend en charge `@ViewBuilder` par défaut :

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

Dans le code source du protocole `View`, nous pouvons voir que `@ViewBuilder` modifie déjà la variable `body`.

Par conséquent, comparé à un `some View` ordinaire, `body` possède une couche supplémentaire de traitement spécial, et SwiftUI nous aide automatiquement à combiner plusieurs vues en une seule vue.

**Utiliser d'abord des conteneurs**

Pour faciliter la compréhension des débutants, il est recommandé d'utiliser d'abord des conteneurs comme `VStack`, `HStack`, `ZStack` et `Group` pour organiser plusieurs vues.

Par exemple :

```swift
var body: some View {
    VStack {
        Text("Bonjour")
        Image(systemName: "star")
    }
}
```

Cela rend le code plus intuitif : **la couche extérieure est un `VStack`, et à l'intérieur se trouvent deux vues enfants.**

## Diviser les vues

Si l'interface est simple, nous pouvons écrire tout le code dans `body`.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                Text("Bienvenue dans Qinote")
                Text("Bonjour")
            }
            HStack {
                Color.blue
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.red
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
                Color.green
                    .frame(width: 20, height: 10)
                    .cornerRadius(10)
            }
            Button("Cliquez-moi") {
                print("Cliquez-moi ")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(20)
    }
}
```

Le style d'affichage de cette vue :

![view](../../Resource/023_view1.png)

Ce code peut fonctionner normalement, mais si le code de la vue devient très complexe, le code dans `body` devient de plus en plus long, ce qui rend sa lecture et sa modification de plus en plus difficiles.

À ce moment-là, nous pouvons diviser différentes zones en propriétés de vue indépendantes.

### Diviser la vue supérieure

Par exemple, séparons la zone supérieure :

```swift
var topHome: some View {
    HStack {
        Text("Accueil")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ici, `topHome` est une variable qui renvoie une vue.

Comme elle renvoie une vue, son type peut être écrit ainsi :

```swift
some View
```

C'est essentiellement le même usage que `body` :

```swift
var topHome: some View { }
var body: some View { }
```

Les deux utilisent des variables pour afficher des vues, et les deux ont le type de retour `some View`.

### Diviser d'autres vues

Ensuite, continuons à diviser d'autres parties :

```swift
var welcomeText: some View {
    VStack(spacing: 20) {
        Text("Bienvenue dans Qinote")
        Text("Bonjour")
    }
}

var colorList: some View {
    HStack {
        Color.blue
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.red
            .frame(width: 20, height: 10)
            .cornerRadius(10)
        Color.green
            .frame(width: 20, height: 10)
            .cornerRadius(10)
    }
}

var clickButton: some View {
    Button("Cliquez-moi") {
        print("Cliquez-moi")
    }
    .buttonStyle(.borderedProminent)
}
```

Après la division, nous pouvons placer les variables de vue dans `body` :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            topBar
            welcomeText
            colorList
            clickButton
            Spacer()
        }
        .padding(20)
    }

    var topBar: some View {
        HStack {
            Text("Accueil")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    }

    var welcomeText: some View {
        VStack(spacing: 20) {
            Text("Bienvenue dans Qinote")
            Text("Bonjour")
        }
    }

    var colorList: some View {
        HStack {
            Color.blue
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.red
                .frame(width: 20, height: 10)
                .cornerRadius(10)
            Color.green
                .frame(width: 20, height: 10)
                .cornerRadius(10)
        }
    }

    var clickButton: some View {
        Button("Cliquez-moi") {
            print("Cliquez-moi")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Maintenant, `body` est seulement chargé de décrire la structure de la page :

```swift
topBar
welcomeText
colorList
clickButton
```

L'implémentation précise de chaque partie est placée dans la propriété correspondante ci-dessous.

Cette façon de diviser les vues peut rendre la structure de la page plus claire. Chaque zone de vue a son propre nom, ce qui rend le code plus facile à lire.

Lorsque nous modifions une certaine partie du code, nous pouvons trouver directement la zone de vue correspondante au lieu de chercher dans beaucoup de code complexe.

### some View renvoie une seule vue

Dans cette vue divisée, si nous essayons de renvoyer plusieurs vues :

```swift
var topBar: some View {
    Text("Accueil")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

une erreur se produit, car `some View` ne peut renvoyer qu'une seule structure de vue.

Contrairement à `body`, les propriétés calculées ordinaires n'ont pas `@ViewBuilder` par défaut.

Par conséquent, si nous devons renvoyer plusieurs vues, nous pouvons utiliser un conteneur `VStack`, `HStack` ou `Group` pour combiner plusieurs vues en une seule.

```swift
var topBar: some View {
    VStack {
        Text("Accueil")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ou ajouter `@ViewBuilder` pour combiner les vues :

```swift
@ViewBuilder
var topBar: some View {
    Text("Accueil")
        .font(.largeTitle)
    Spacer()
    Image(systemName: "bell")
}
```

Cela nous permet de renvoyer plusieurs vues.

### if renvoie plusieurs vues

Par exemple :

```swift
var topHome: some View {
    if step == "Accueil" {
        HStack {
            Text("Accueil")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "bell")
        }
    } else {
        Text("Vide")
    }
}
```

Dans ce code, `topHome` renvoie soit `HStack`, soit `Text` selon le contenu de `step`, ce qui représente deux types de vue différents.

Comme `some View` exige un type de retour concret défini, les deux branches de `if` dans une propriété calculée ordinaire ne peuvent pas renvoyer directement des types de vue différents, donc une erreur se produit.

**La solution reste de les envelopper dans un conteneur ou d'utiliser `@ViewBuilder`.**

### Pourquoi les vues séparées n'utilisent pas de parenthèses

Lorsque nous utilisons des propriétés de vue extraites dans `body`, nous les écrivons directement :

```swift
topBar
welcomeText
colorList
clickButton
```

au lieu de :

```swift
topBar()
welcomeText()
colorList()
clickButton()
```

C'est parce que `topBar`, `welcomeText`, `colorList` et `clickButton` sont des variables. Plus précisément, ce sont des propriétés calculées, pas des méthodes.

**Les propriétés n'ont pas besoin de parenthèses.**

Si nous l'écrivons comme une méthode, nous pouvons obtenir un effet similaire :

```swift
func topBar() -> some View {
    HStack {
        Text("Accueil")
            .font(.largeTitle)
        Spacer()
        Image(systemName: "bell")
    }
}
```

Ce code peut aussi produire un effet similaire. Appeler cette méthode renvoie une vue.

Lorsque nous l'utilisons, nous devons écrire :

```swift
topBar()
```

Dans SwiftUI, si nous extrayons simplement une vue qui n'a pas besoin de paramètres, il est plus courant d'utiliser une propriété calculée.

```swift
var topBar: some View { ... }
```

## Vues imbriquées

En plus de diviser le code en propriétés, nous pouvons aussi créer de nouvelles structures de vue.

Par exemple :

```swift
struct PinkColorView: View {
    var body: some View {
        Color.pink
            .frame(width: 80, height: 40)
            .shadow(radius: 3)
    }
}
```

Ce `PinkColorView`, comme `ContentView`, est une vue SwiftUI indépendante.

Si nous devons l'afficher dans `ContentView`, nous pouvons ajouter `()` après le nom de la vue.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()
    }
}
```

Ici :

```swift
PinkColorView()
```

signifie créer une instance de `PinkColorView`.

Comme `PinkColorView` respecte le protocole `View`, elle peut être placée dans d'autres vues et affichée, tout comme `Text`, `Image` et `Button`.

```swift
struct ContentView: View {
    var body: some View {
        PinkColorView()

        Text("PinkColorView")
    }
}
```

C'est l'imbrication de vues : une vue peut être affichée à l'intérieur d'une autre vue.

## Propriété de vue ou nouvelle vue ?

Lorsque le code de vue est simple, il n'est généralement pas nécessaire de le diviser. Ce n'est que lorsque le code devient plus complexe qu'il est recommandé de diviser les vues.

### Quand utiliser des propriétés de vue

S'il s'agit seulement d'un petit morceau de contenu dans la vue actuelle, nous pouvons utiliser une propriété de vue.

Par exemple :

```swift
var topBar: some View { ... }
var clickButton: some View { ... }
```

Ces contenus sont généralement utilisés uniquement dans la vue actuelle.

### Quand créer une nouvelle vue

Si le contenu est relativement indépendant, ou s'il peut être réutilisé sur plusieurs pages à l'avenir, il est plus adapté de créer une nouvelle vue.

Par exemple :

```swift
Text("Qinote")
    .padding()
    .background(.blue.opacity(0.1))
    .cornerRadius(12)
```

C'est une vue de titre. Si nous voulons utiliser cette vue comme composant réutilisable dans d'autres vues.

Nous pouvons créer une nouvelle vue :

```swift
struct CourseCardView: View {
    var body: some View {
        Text("Qinote")
            .padding()
            .background(.blue.opacity(0.1))
            .cornerRadius(12)
    }
}
```

Puis l'utiliser ailleurs :

```swift
struct SettingsView: View {
    var body: some View {
        CourseCardView()
    }
}
struct ContentView: View {
    var body: some View {
        CourseCardView()
    }
}
```

À ce moment-là, cette vue est un composant indépendant réutilisable.

Nous pouvons le résumer simplement :

- Les zones de contenu de la vue actuelle peuvent utiliser `var xxx: some View`
- Les composants indépendants réutilisables peuvent être créés comme un nouveau `struct XxxView: View`
- Les composants qui doivent recevoir des données sont généralement plus adaptés comme nouvelles vues.

## Résumé

Dans cette leçon, nous avons à nouveau compris la structure de vue la plus fondamentale et la plus importante de SwiftUI.

`ContentView` est une structure. Elle est définie avec `struct` et sert à organiser le code lié à la page.

`View` est un protocole. Si une structure veut devenir une vue SwiftUI, elle doit respecter le protocole `View`.

`body` est le contenu que le protocole `View` nous demande de fournir, et il détermine ce que cette vue affiche.

`some View` signifie renvoyer une certaine vue concrète, sans avoir besoin d'écrire son type complet et complexe.

Lorsque le code de vue devient long, nous pouvons utiliser `var xxx: some View` pour diviser le code de vue en plusieurs petites zones.

Lorsqu'un morceau de contenu est relativement indépendant ou doit être réutilisé, nous pouvons créer une nouvelle structure de vue et l'afficher dans d'autres vues avec `XxxView()`.

En termes simples, les interfaces SwiftUI sont composées de vues combinées entre elles. Une page peut contenir plusieurs petites vues, et une petite vue peut aussi contenir d'autres vues.
