# Gérer les fichiers Xcode

Dans ce cours, nous allons apprendre les opérations de fichiers courantes dans Xcode.

Dans les cours précédents, nous avons écrit la plupart du code dans `ContentView`. Cela permet d'observer facilement le code et le résultat affiché.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Mais dans une vraie App, on ne met généralement pas tout le code dans un seul fichier.

Lorsque les pages, les composants et les fonctionnalités deviennent de plus en plus nombreux, nous devons séparer les différentes vues dans différents fichiers SwiftUI.

Par exemple :

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

Cela rend la structure du code plus claire et facilite aussi la maintenance et les modifications ultérieures.

## Pourquoi gérer les fichiers

Dans SwiftUI, une page ou un composant peut généralement être écrit séparément comme un fichier de vue.

Par exemple :

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

Ici, `CardView` est une vue SwiftUI.

Si toutes les vues sont écrites dans `ContentView`, le code deviendra de plus en plus long et de plus en plus difficile à lire.

Nous devons donc apprendre à créer, renommer et supprimer des fichiers, ainsi qu'à utiliser des dossiers pour gérer différents fichiers de code.

## Créer un fichier SwiftUI

Dans Xcode, il existe généralement deux façons courantes de créer un fichier SwiftUI :

La première consiste à créer un fichier vide, puis à écrire le code soi-même.

La seconde consiste à créer un fichier modèle SwiftUI, avec du code de base généré automatiquement par Xcode.

Pour les débutants, il est davantage recommandé d'utiliser le fichier modèle SwiftUI, car il génère automatiquement la structure de base.

### Créer un fichier vide

Dans la zone Navigator située à gauche de Xcode, faites un clic droit sur une zone vide ou sur un dossier, puis choisissez `New Empty File`.

L'emplacement de l'opération est le suivant :

![xcode](../../../Resource/027_view1.png)

Après la création d'un fichier vide, Xcode génère généralement un fichier Swift sans nom, par exemple `Untitled.swift`.

Nous pouvons le renommer en `TestView.swift`.

Dans un projet SwiftUI, si ce fichier sert à afficher une vue, il est généralement conseillé d'ajouter `View` à la fin du nom.

Par exemple :

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

Ce n'est pas une règle obligatoire, mais cela permet de voir d'un coup d'œil qu'il s'agit d'un fichier de vue.

Après la création d'un fichier vide, il peut ne contenir que des commentaires par défaut, ou bien être vide, selon la version de Xcode et la méthode de création.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

À ce moment-là, nous devons écrire manuellement le code SwiftUI :

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

Ainsi, un simple fichier de vue SwiftUI est créé.

### Renommer un fichier

Si vous voulez modifier le nom d'un fichier après sa création, vous pouvez sélectionner le fichier dans la zone Navigator à gauche de Xcode, puis appuyer sur la touche Entrée `⏎`.

![xcode](../../../Resource/027_view2.png)

Vous pouvez alors modifier le nom du fichier.

Il faut noter que modifier le nom du fichier ne modifie pas automatiquement le nom de la vue dans le code.

Par exemple, après avoir changé le nom du fichier en `ProfileView.swift`, le code peut toujours contenir `struct TestView: View`.

Cela ne provoque pas forcément une erreur, mais cela peut facilement prêter à confusion.

Il est donc conseillé de garder le nom du fichier et le nom de la vue cohérents. Par exemple, si le nom du fichier est `ProfileView.swift`, le nom de la vue doit également utiliser `ProfileView`.

## Créer un fichier modèle SwiftUI

En plus de créer un fichier vide, nous pouvons aussi créer directement un fichier modèle SwiftUI.

Dans la zone Navigator située à gauche de Xcode, faites un clic droit sur une zone vide ou sur un dossier, puis choisissez `New File from Template...`.

L'emplacement de l'opération est le suivant :

![xcode](../../../Resource/027_view3.png)

Dans la fenêtre qui s'affiche, vous pouvez choisir différentes plateformes en haut, par exemple `iOS`, `macOS`, etc.

Ici, il suffit de conserver la plateforme correspondant au projet actuel. Par exemple, si nous créons une App iOS, nous choisissons `iOS`.

![xcode](../../../Resource/027_view4.png)

Ensuite, choisissez `SwiftUI View` dans la partie inférieure.

![xcode](../../../Resource/027_view12.png)

Cliquez ensuite sur `Next`, saisissez le nom du fichier et enregistrez.

Par exemple, nous créons un fichier `Test2View.swift`.

Xcode générera automatiquement un code semblable à celui-ci :

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

Comparé à un fichier vide, un fichier modèle contient automatiquement `import SwiftUI`, `struct`, `body` et `#Preview`.

Donc, pour les débutants, utiliser un fichier modèle SwiftUI est plus simple et permet aussi d'éviter plus facilement d'oublier du code.

**Astuce** : en plus de créer un fichier avec un clic droit, vous pouvez aussi cliquer sur le bouton plus en bas de la zone Navigator à gauche de Xcode pour créer un fichier ou un dossier.

![xcode](../../../Resource/027_view5.png)

## Créer un dossier

Lorsque les fichiers deviennent de plus en plus nombreux, nous pouvons utiliser des dossiers pour les gérer.

Dans la zone Navigator située à gauche de Xcode, faites un clic droit sur une zone vide ou sur un dossier, puis choisissez `New Folder`.

Après avoir créé un dossier, vous pouvez faire glisser les fichiers associés dans ce dossier.

![xcode](../../../Resource/027_view7.png)

Les dossiers servent principalement à organiser la structure du projet et ne changent pas la façon d'utiliser la vue elle-même.

Tant que le nom de la vue est correct, elle peut toujours être utilisée dans d'autres fichiers avec des formes comme `TestView()` et `Test2View()`.

## Supprimer un fichier ou un dossier

Si vous voulez supprimer un fichier ou un dossier, vous pouvez sélectionner le fichier correspondant dans la zone Navigator à gauche de Xcode, puis faire un clic droit et choisir `Delete`.

Vous pouvez aussi sélectionner le fichier, puis appuyer sur la touche Supprimer `⌫`.

Xcode affichera une fenêtre de confirmation de suppression.

![xcode](../../../Resource/027_view10.png)

Choisir `Move to Trash` signifie déplacer le fichier dans la corbeille.

Si vous voyez `Remove Reference`, cela signifie supprimer uniquement la référence du projet Xcode, sans supprimer le fichier original sur le disque.

Pour les débutants, si vous supprimez simplement un fichier ordinaire que vous venez de créer, choisir `Move to Trash` suffit généralement.

## Afficher plusieurs vues SwiftUI

Après avoir appris à créer des fichiers, nous pouvons séparer différentes vues dans différents fichiers.

Par exemple, nous créons deux fichiers SwiftUI :

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` sert à afficher le nom de l'auteur :

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` sert à afficher l'arrière-plan de la carte :

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

Ensuite, nous pouvons utiliser ces deux vues dans `ContentView` :

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Après l'exécution, nous pouvons voir que `CardView` et `AuthorView` sont combinées et affichées ensemble :

![xcode](../../../Resource/027_view11.png)

Dans ce résultat, `CardView` sert d'arrière-plan, et `AuthorView` s'affiche au-dessus, parce qu'elles sont placées dans un `ZStack`.

Dans `ContentView`, nous utilisons ces deux vues avec `CardView()` et `AuthorView()`. Les `()` après le nom indiquent que l'on crée et utilise cette vue.

C'est l'imbrication de vues courante dans SwiftUI : dans une vue, on peut continuer à utiliser d'autres vues.

## Fichier d'entrée

Enfin, revenons sur l'endroit à partir duquel l'App commence à afficher l'interface.

Dans un projet SwiftUI, il existe généralement un fichier d'entrée :

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

Ici, `@main` indique qu'il s'agit du point d'entrée de l'App.

Dans `WindowGroup`, nous voyons :

```swift
ContentView()
```

Cela signifie qu'après le lancement de l'App, `ContentView` est d'abord affichée.

Ensuite, `ContentView` affiche aussi :

```swift
ZStack {
    CardView()
    AuthorView()
}
```

La hiérarchie des vues peut donc être comprise ainsi :

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

Si nous remplaçons la vue affichée dans le fichier d'entrée par `CardView` :

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

Alors, après le lancement de l'App, seule `CardView` sera affichée.

Autrement dit, le `WindowGroup` dans le code d'entrée détermine quelle vue s'affiche en premier après le lancement de l'App.

Et à l'intérieur de cette vue, on peut continuer à afficher d'autres vues.

## Résumé

Dans ce cours, nous avons appris les opérations courantes de gestion de fichiers dans Xcode.

Nous avons vu comment créer un fichier SwiftUI, comment renommer un fichier, comment créer un dossier et comment supprimer un fichier.

En même temps, nous avons aussi appris un concept important : les vues SwiftUI peuvent être séparées dans différents fichiers, puis utilisées dans d'autres vues.

Par exemple :

```swift
ZStack {
    CardView()
    AuthorView()
}
```

Ici, `CardView()` et `AuthorView()` sont des utilisations d'autres vues dans `ContentView`.

Enfin, nous avons également revu la logique d'affichage du fichier d'entrée.

Au lancement de l'App, celle-ci entre d'abord dans le code d'entrée marqué par `@main`, puis affiche la vue située dans `WindowGroup`.

Cela nous aide à comprendre que les différents fichiers SwiftUI ne sont pas isolés : ils peuvent se combiner entre eux et former au final une interface d'App complète.
