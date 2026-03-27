# Commencer avec ContentView

## Préparation avant la leçon

Dans cette leçon, nous allons partir du fichier `ContentView.swift` pour découvrir de manière structurée la base de SwiftUI, notamment :

- les commentaires
- la structure `View`
- les mises en page `VStack` / `HStack` / `ZStack`
- les icônes `SF Symbols`
- les modificateurs de vue (`modifier`)
- le code d'aperçu `#Preview`

Tout d'abord, retrouvez le projet Xcode créé précédemment et double-cliquez sur le fichier `.xcodeproj`.

Dans la zone de navigation `Navigator` à gauche, sélectionnez le fichier `ContentView.swift`.

Remarque : chaque fois que vous ouvrez le projet, `Canvas` peut afficher `"Preview paused"`. Cliquez simplement sur le bouton d'actualisation pour rétablir l'aperçu.

![Swift](../../RESOURCE/002_view7.png)

## Découvrir ContentView

Code de `ContentView` :

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

Même si ce code est court, il contient la structure centrale de SwiftUI.

### 1. Les commentaires

En haut du fichier :

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

Il s'agit du commentaire de fichier, utilisé pour enregistrer des informations comme le nom du fichier, le nom du projet, l'auteur et la date de création.

En Swift, `//` sert à écrire un commentaire sur une seule ligne :

```swift
// Ceci est un commentaire
```

Les commentaires améliorent la lisibilité du code et aident les développeurs à comprendre la logique.

En développement réel, le code peut devenir difficile à relire. Sans commentaires, on finit parfois par ne plus comprendre son propre code quelques jours plus tard.

Prendre l'habitude d'ajouter des commentaires pendant l'écriture du code est donc une bonne pratique. Les commentaires servent à noter la logique du code et facilitent sa maintenance par la suite.

**Masquer temporairement du code**

Les commentaires peuvent aussi servir à désactiver temporairement du code pour rechercher un problème.

Par exemple :

```
A
B
C
```

`A`, `B` et `C` représentent trois blocs de code, dont l'un contient une erreur. Nous pouvons commenter temporairement du code pour localiser le problème.

Commençons par commenter `A` :

```
// A
B
C
```

Si le code redevient normal après avoir commenté `A`, cela signifie que l'erreur vient du bloc `A`.

Si le problème persiste, nous pouvons ensuite commenter `B`, et ainsi de suite, jusqu'à trouver la partie fautive.

Pendant le développement, on rencontre de nombreux problèmes, et cette méthode de commentaire temporaire est très utile pour localiser le code concerné et trouver un bug.

Dans Xcode, vous pouvez utiliser le raccourci clavier :

```
Command ⌘ + /
```

pour ajouter ou supprimer rapidement des commentaires.

### 2. Importer le framework SwiftUI

```swift
import SwiftUI
```

Cette ligne indique que nous importons le framework `SwiftUI`.

Les types `View`, `Text`, `Image`, `VStack`, etc. de SwiftUI proviennent tous de ce framework.

Si vous n'importez pas `SwiftUI`, Xcode affichera une erreur :

```
Cannot find type 'View' in scope
```

Cela signifie que le compilateur ne reconnaît pas le type `View`.

### 3. La structure `View`

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

La première fois que l'on voit cette structure `View`, elle peut sembler étrange, car elle contient des mots-clés comme `struct`, `View`, `var`, `body` et `some`.

Nous n'avons pas encore étudié ces mots-clés. Pour l'instant, il suffit de comprendre que ce code crée une vue appelée `ContentView`.

Vous pouvez considérer une `View` comme une toile sur laquelle on peut dessiner, et l'outil utilisé pour dessiner est SwiftUI.

Par exemple :

![Swift](../../RESOURCE/002_view.png)

L'image ci-dessus montre trois pages, qui sont en réalité trois `View`.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

Quand nous développons une app avec SwiftUI, chaque page est une `View`.

### 4. Le code SwiftUI

Dans la vue `View`, le code SwiftUI affiché est :

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ce code SwiftUI indique qu'il s'agit d'une mise en page verticale affichant une icône et un texte.

![Swift](../../RESOURCE/002_view1.png)

#### Mise en page `VStack`

```swift
VStack { }  // disposition verticale
```

`VStack` représente un conteneur de disposition verticale. Les vues internes y sont disposées de haut en bas.

![Swift](../../RESOURCE/002_view8.png)

Les trois mises en page les plus courantes dans SwiftUI sont :

- `VStack` —— disposition verticale
- `HStack` —— disposition horizontale
- `ZStack` —— empilement superposé (axe Z)

```swift
HStack { }  // disposition horizontale
ZStack { }  // superposition
```

Schéma de tri de chaque disposition :

![Swift](../../RESOURCE/002_view2.png)

Par exemple, on peut utiliser `HStack` pour disposer des éléments horizontalement.

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

On voit alors que l'icône du globe et le texte sont affichés horizontalement.

![Swift](../../RESOURCE/002_view3.png)

Quand nous voulons une disposition horizontale, nous utilisons `HStack`. Quand nous avons besoin d'une disposition superposée, nous utilisons `ZStack`.

#### `Image` et `SF Symbols`

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

Ce code affiche une icône de globe provenant du système d'icônes `SF Symbols` d'Apple.

![Swift](../../RESOURCE/002_view9.png)

Ce code signifie : afficher une icône de globe, en grande taille, avec la couleur d'accentuation.

En plus du globe, nous pouvons afficher d'autres icônes.

Par exemple, pour afficher un sac à dos :

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**Comment afficher d'autres icônes ?**

Nous devons utiliser la bibliothèque officielle d'icônes système fournie par Apple : `SF Symbols`.

Ouvrez le site officiel Apple Developer et téléchargez [SF Symbols](https://developer.apple.com/sf-symbols/).

![Swift](../../RESOURCE/002_sf.png)

Ouvrez ensuite l'application `SF Symbols`.

![Swift](../../RESOURCE/002_sf1.png)

À gauche se trouvent les catégories de symboles, et à droite les icônes correspondantes.

Faites un clic droit sur une icône et choisissez "copier 1 nom" ; ce nom correspond à la chaîne de caractères utilisée par l'icône.

Par exemple :

```
"globe"
"backpack"
"heart"
```

Placez le nom copié de l'icône dans `Image(systemName:)` pour afficher différents symboles.

Remarque : chaque icône `SF Symbols` possède une version minimale du système prise en charge. Si la version du système est trop ancienne, l'icône peut ne pas s'afficher. Il faut vérifier sa compatibilité dans l'application `SF Symbols`.

#### Les modificateurs

Dans SwiftUI, un modificateur (`modifier`) est une méthode utilisée pour changer l'apparence ou le comportement d'une vue.

Vous pouvez imaginer les modificateurs comme des vêtements : selon la tenue portée, l'apparence affichée change elle aussi.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` et `foregroundStyle` sont justement des modificateurs de la vue `Image`. Ils modifient la vue sans changer son contenu.

**1. `imageScale`**

```swift
.imageScale(.large)
```

Il permet de contrôler la taille des icônes `SF Symbols` :

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

Vous pouvez essayer différentes options pour afficher le symbole `SF Symbols` à différentes tailles.

**2. `foregroundStyle`**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` permet de contrôler la couleur de premier plan.

`.tint` représente la couleur d'accentuation de l'environnement actuel. Par défaut, sur iOS, elle est bleue.

Si nous voulons changer la couleur de premier plan en rouge :

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### La vue `Text`

`Text` est une vue textuelle utilisée pour afficher une chaîne de caractères.

```swift
Text("Hello, world!")
```

Par exemple, pour afficher mon nom :

```swift
Text("FangJunyu")
```

Remarque : une chaîne de caractères doit être entourée de guillemets doubles `""`.

Vous pouvez essayer d'afficher votre nom, votre numéro de téléphone ou d'autres contenus.

#### `padding` : les marges internes

Dans SwiftUI, `padding` sert à ajouter un espace vide entre le contenu de la vue et ses bords. Cela correspond à une marge interne (`padding / content inset`).

```swift
HStack {
    ...
}
.padding()
```

Le code ci-dessus signifie que l'on ajoute à la vue `HStack` une marge interne par défaut du système.

**Qu'est-ce que `padding` ?**

`padding` désigne l'espace vide entre le contenu d'une vue et sa limite.

Dans l'image ci-dessous, après avoir ajouté `padding` au `HStack` bleu, la zone bleue se rétracte vers l'intérieur, ce qui donne l'impression qu'elle "rétrécit légèrement".

![Swift](../../RESOURCE/002_view6.png)

**Marge par défaut**

Le modificateur `padding()` utilise par défaut l'espacement standard recommandé par le système.

```swift
.padding()
```

Cette valeur peut varier selon la plateforme et le contexte, par exemple :

- sur iOS, elle est généralement d'environ `16 pt` ;
- sur macOS ou watchOS, l'espacement standard du système peut être différent, parfois plus grand ou plus petit, selon les règles de conception propres à chaque plateforme.

**Marges personnalisées**

On peut aussi définir des marges spécifiques pour une vue.

1. Définir une seule direction

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Explication des directions :

- `.top` : marge supérieure
- `.bottom` : marge inférieure
- `.leading` : marge du début de ligne
- `.trailing` : marge de fin de ligne

![Swift](../../RESOURCE/002_view12.png)

Remarque : `leading` et `trailing` s'adaptent automatiquement au sens de lecture. Par exemple, dans un environnement arabe (`RTL`), ils seront automatiquement inversés.

2. Définir plusieurs directions

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Vous pouvez indiquer plusieurs directions en même temps à l'aide d'un tableau. L'utilisation détaillée des tableaux sera expliquée plus tard ; ici, il suffit de connaître cette écriture.

3. Définir l'axe horizontal ou vertical

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

Équivalent à :

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Supprimer les marges**

Si vous ne voulez aucune marge, vous pouvez utiliser `.padding(0)` :

```swift
.padding(0)
```

ou supprimer directement le modificateur `padding` :

```swift
// .padding()
```

### 6. Le code d'aperçu `Preview`

```swift
#Preview {
    ContentView()
}
```

Ce code signifie que l'on génère un aperçu de la vue `ContentView` dans `Canvas`.

Remarque : `#Preview` est une nouvelle syntaxe introduite avec Swift 5.9 / Xcode 15. Avant cela, on utilisait la structure `PreviewProvider`.

**Que se passe-t-il si l'on commente `Preview` ?**

Si nous commentons `Preview` :

```swift
// #Preview {
//    ContentView()
// }
```

`Canvas` n'affichera plus de contenu rendable.

![Swift](../../RESOURCE/002_xcode.png)

En d'autres termes, c'est `#Preview` qui contrôle l'affichage de la vue d'aperçu dans `Canvas`.

Quand nous avons besoin d'un aperçu SwiftUI dans Xcode, nous ajoutons le code `#Preview`. Si l'aperçu n'est pas nécessaire, nous pouvons commenter ou supprimer ce bloc.

## Résumé

Même si le fichier `ContentView.swift` ne contient pas beaucoup de code, il couvre en réalité plusieurs concepts centraux de SwiftUI. Pour un débutant, ce code peut sembler inhabituel, mais le fait de le décomposer aide à construire une première compréhension de SwiftUI.

Pour résumer cette leçon, nous avons d'abord appris le commentaire `//`, qui peut servir à expliquer la logique du code ou à masquer temporairement du code.

Nous avons ensuite compris qu'un fichier SwiftUI doit importer le framework `SwiftUI` :

```swift
import SwiftUI
```

Sans ce framework, le compilateur ne peut pas reconnaître des types comme `View`.

Ensuite, nous avons découvert la structure de base d'une vue SwiftUI :

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

Ici, `ContentView` est le nom de la vue.

Nous avons également étudié trois conteneurs de mise en page courants : `VStack` (vertical), `HStack` (horizontal) et `ZStack` (superposé).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Ce code signifie que l'on affiche un conteneur vertical contenant une icône et un texte.

`Image` peut afficher des icônes `SF Symbols`, et des modificateurs permettent d'en contrôler la taille et la couleur.

La vue `Text` sert à afficher du texte.

`padding` correspond à une marge interne, c'est-à-dire un espace transparent ajouté autour de la vue.

Enfin, `#Preview` permet d'afficher une vue d'aperçu dans `Canvas`.

### Exercices après la leçon

Pour un débutant, le contenu de cette leçon peut sembler assez dense. Vous pouvez approfondir votre compréhension avec quelques exercices supplémentaires :

- modifier le nom d'une icône `SF Symbols`
- changer la couleur de premier plan de l'icône en noir
- remplacer `VStack` par `HStack`
- commenter `Image` ou `Text` et observer les changements dans l'aperçu

### Bonus : la complétion de code (`Code Completion`)

Lorsque vous saisissez du code, vous avez peut-être déjà remarqué que Xcode affiche automatiquement une liste d'options disponibles.

Par exemple, lorsque nous modifions le modificateur `imageScale` :

```swift
.imageScale(.)
```

Xcode affiche alors les options utilisables :

![Swift](../../RESOURCE/002_view10.png)

Cela fait partie du mécanisme de complétion de code (`Code Completion`). Il repose sur l'inférence de type et les suggestions des membres d'énumération, ce qui améliore la vitesse de saisie et réduit les erreurs.

Dans les prochaines leçons, nous introduirons officiellement les énumérations (`enum`) ; pour l'instant, il suffit simplement d'en avoir un premier aperçu.
