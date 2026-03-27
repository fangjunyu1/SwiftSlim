# Cycle de vie d'une vue SwiftUI

Dans la leçon précédente, nous avons appris que les variables `@State` suivent le cycle de vie de la vue, et nous avons également découvert l'usage de base de `onAppear`.

Dans cette leçon, nous allons approfondir notre compréhension du cycle de vie des vues SwiftUI : nous verrons comment une vue est créée et affichée, comment les variables de la vue sont créées et reconstruites, et nous étudierons aussi `onAppear`, `onDisappear` et le constructeur `init`.

À partir de ces connaissances, nous construirons une compréhension globale du processus de construction d'une vue SwiftUI.

## Ordre de démarrage de l'application

Lorsqu'on crée un projet iOS, Xcode génère par défaut deux fichiers :

```
ContentView.swift
NomDuProjet + App.swift
```

Parmi eux, `"nom du projet + App".swift` est le fichier d'entrée de l'application.

Par exemple :

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Processus d'exécution du code

Lorsque nous lançons l'application sur simulateur ou sur appareil réel, le système recherche le mot-clé `@main` :

```swift
@main
struct SwiftSlimTestApp: App {...}
```

Une fois le fichier d'entrée confirmé, l'exécution du code commence.

Le système entre d'abord dans la structure `App`, exécute le code contenu dans `body`, puis crée le `WindowGroup` et charge le `ContentView` qu'il contient.

### Rôle de `WindowGroup`

`WindowGroup` sert à gérer les fenêtres :

```swift
WindowGroup {
    ContentView()
}
```

Sur iPad et macOS, le système prend en charge plusieurs fenêtres ; sur iPhone, il n'y en a généralement qu'une seule.

Ainsi, sur iPhone, `WindowGroup` gère principalement le premier écran affiché.

### Processus de chargement de la vue

Lorsque le système trouve `ContentView` :

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}
```

SwiftUI exécute le code contenu dans `body`, puis construit l'interface à partir de la structure de vue renvoyée (comme `VStack`, `Text`, etc.), et l'affiche à l'écran.

Une fois ces étapes terminées, nous pouvons voir `ContentView` dans la vue.

![ContentView](../../Resource/016_view1.png)

Il faut noter que le rôle de `body` est de générer la vue, et non de la stocker.

Cela signifie qu'à chaque rafraîchissement de la vue, SwiftUI recalcule `body` et génère une nouvelle structure de vue.

### Logique de l'aperçu

L'aperçu Xcode (`Canvas`) et l'exécution réelle sont deux mécanismes différents.

Par exemple, si l'on ajoute une sortie de débogage dans le fichier d'entrée :

```swift
@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("Go to ContentView")
                }
        }
    }
}
```

Lorsque vous prévisualisez `ContentView` dans Xcode, l'exécution ne commence pas à partir de l'entrée `@main`, donc le `onAppear` du fichier d'entrée n'est pas déclenché.

En revanche, si vous exécutez l'application sur simulateur ou sur appareil physique, le système commence bien à `@main`, suit le flux complet de l'application, déclenche le `onAppear` de l'entrée et affiche les informations de débogage.

Le point essentiel est le suivant : l'aperçu Xcode n'est qu'un "rendu local", utilisé uniquement pour afficher la vue courante ; le simulateur et l'appareil réel fournissent un "environnement d'exécution complet" dans lequel toute l'application est exécutée.

Par conséquent, pour tester les fonctionnalités d'une application, il faut se baser sur le simulateur ou sur un appareil physique. L'aperçu Xcode ne peut pas fournir un environnement d'exécution complet.

## Cycle de vie d'une vue

À ce stade, tout notre code est concentré dans `ContentView`. Mais dans une application réelle, une app contient généralement plusieurs vues, entre lesquelles on navigue selon les scénarios.

Par exemple, dans la "tirelire" :

![PiggyBank](../../Resource/016_view.png)

Lorsque l'on clique sur "Enregistrer", la vue `SaveView` apparaît ; lorsque l'enregistrement est terminé ou que l'on ferme cette vue, `SaveView` est retirée.

Ce processus correspond justement au cycle de vie d'une vue : création, affichage, puis retrait de la vue.

### Fermer l'application

Quand l'application est fermée, toutes les vues sont retirées et tous les états associés disparaissent.

Ainsi, `ContentView` et les autres vues sont supprimées de la mémoire, et tout l'état d'exécution de l'application est effacé.

## Cycle de vie des variables dans une vue

Dans SwiftUI, le cycle de vie des variables est généralement lié à celui de la vue.

Par exemple :

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"
    var body: some View {
        var num = 10
        VStack {
            Text("num:\(num)")
            Text("name:\(name)")
        }
    }
}
```

### Variable `@State`

Une variable déclarée avec `@State` est liée au cycle de vie de la vue.

```swift
@State private var name = "FangJunyu"
```

Lorsque la vue est créée, `name` est lui aussi créé ; lorsque la vue est retirée, `name` est détruit.

C'est pour cette raison qu'il faut utiliser `UserDefaults` ou d'autres solutions pour mettre en place une persistance des données.

### Variables à l'intérieur de `body`

Une variable définie dans `body` :

```swift
var num = 10
```

voit son cycle de vie lié au processus d'exécution de `body`.

Lorsque l'état de SwiftUI change, par exemple :

```swift
@State private var name = "FangJunyu"
name = "Hu"
```

Quand `name` change, `@State` détecte cette modification et avertit SwiftUI de recalculer la vue ; `body` est donc recalculé.

Lorsque `body` est recalculé, tout le code qu'il contient est réexécuté, et les variables internes à `body` comme `num` sont recréées.

C'est aussi la raison pour laquelle il n'est pas recommandé de définir des variables complexes à l'intérieur de `body`.

En effet, à chaque rafraîchissement de la vue, ces variables seraient recréées, ce qui augmente le coût de calcul et peut nuire aux performances.

Dans SwiftUI, différents types de données doivent être gérés différemment : les données qui doivent suivre le cycle de vie de la vue peuvent être conservées avec `@State`, tandis que les données de calcul temporaire peuvent être placées dans `body`.

## `onAppear` et `onDisappear`

Dans la leçon précédente, nous avons déjà appris `onAppear`, qui est appelé lorsque la vue s'affiche.

```swift
.onAppear {}
```

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Dans l'aperçu Xcode ou lors de l'exécution, on peut voir la sortie de débogage située dans `onAppear`.

### `onDisappear`

Le pendant de `onAppear` est `onDisappear` :

```swift
.onDisappear {}
```

Lorsque la vue est fermée, `onDisappear` est appelé.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Quand la vue est retirée, le code dans `onDisappear` est exécuté.

Astuce : à ce stade, `ContentView` est la vue racine de l'application, elle ne peut donc pas être fermée ou retirée directement. On ne peut donc pas encore observer concrètement l'effet de `onDisappear`.

Ce n'est que plus tard, lorsqu'on apprendra la navigation entre pages et l'ouverture de nouvelles vues, que l'on pourra voir `onDisappear` être appelé.

## Logique de création et d'affichage

Il faut noter que la création d'une vue et son affichage sont deux étapes différentes.

Quand une vue est créée, le constructeur de la structure est appelé :

```swift
init() {}
```

Comme une vue SwiftUI est une structure :

```swift
struct ContentView: View { ... }
```

lorsqu'une instance de vue est créée, le constructeur `init` est exécuté. Ce n'est qu'au moment où la vue est affichée que `onAppear` est appelé.

Par exemple :

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
        .onDisappear {
            print("Close ContentView")
        }
    }
}
```

Lors de l'aperçu dans Xcode, on peut voir la sortie suivante :

```swift
Create ContentView
Show ContentView
```

Cela montre bien que `init` est exécuté en premier pour créer la vue, puis que le code de `body` est calculé, et enfin que la vue est affichée et que `onAppear` est appelé.

Il faut donc bien comprendre que les phases de création et d'affichage de la vue sont distinctes.

### Constructeur `init`

`init` est une syntaxe de base de Swift. Il peut être défini aussi bien dans une `struct` que dans une `class`, et sert à initialiser un objet.

```swift
init() {}
```

Dans SwiftUI, lorsque la vue est créée, le système appelle sa méthode `init`, qui peut servir à recevoir des paramètres ou à initialiser des données.

Si vous n'écrivez pas `init` manuellement, Swift génère automatiquement un constructeur par défaut pour la `struct`.

Pour les vues SwiftUI comme `ContentView`, le cycle est donc le suivant : lors de la création de la vue, `init` est exécuté ; lors de son affichage, `onAppear` est exécuté.

Ainsi, `init` est le constructeur exécuté au moment de la création de la vue. Il sera utile plus tard lorsqu'il faudra transmettre des paramètres ou initialiser des données.

## Résumé

Dans cette leçon, nous avons appris l'ordre de démarrage d'une application, depuis le fichier d'entrée jusqu'au flux d'exécution du fichier `ContentView`.

Nous avons compris le cycle de vie d'une vue SwiftUI : lors de la création de la vue, `init` est exécuté ; lorsqu'elle apparaît à l'écran, `onAppear` est exécuté ; lorsqu'elle est retirée ou fermée, `onDisappear` est exécuté.

Nous avons aussi étudié le mécanisme de mise à jour des vues : une vue est pilotée par son état ; quand `@State` ou un autre état change, SwiftUI rafraîchit la vue, recalcule `body`, et les variables à l'intérieur de `body` sont elles aussi recréées.

Le cycle de vie des variables est lié à celui de la vue, tandis que les variables temporaires à l'intérieur de `body` sont recréées à chaque rafraîchissement.

Comprendre ces cycles de vie et le comportement des variables nous aide à mieux organiser le code et à rendre la logique de l'application plus claire.
