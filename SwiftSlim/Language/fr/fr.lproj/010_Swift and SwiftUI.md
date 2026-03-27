# Swift et SwiftUI

Lorsqu'on apprend le développement sur les plateformes Apple, de nombreux tutoriels ont tendance à expliquer Swift et SwiftUI séparément. Cela peut facilement donner aux débutants l'impression qu'il s'agit de deux technologies totalement indépendantes.

En réalité, Swift et SwiftUI forment un ensemble étroitement intégré : Swift est le langage de programmation qui gère la logique et les données, tandis que SwiftUI est un framework d'interface utilisateur construit sur Swift, chargé du rendu des vues et des interactions.

Cette leçon va vous aider à construire un cadre de compréhension clair : ce qu'est Swift, ce qu'est SwiftUI, et comment ils collaborent dans le code.

## Qu'est-ce que Swift ?

Swift est un langage de programmation moderne lancé par Apple, utilisé pour développer des applications sur des plateformes comme iOS, macOS, watchOS et tvOS.

![swift](../../RESOURCE/010_swift.png)

Swift est un langage fortement typé et statique. Sa conception met davantage l'accent sur la sécurité et réduit de nombreuses erreurs courantes de programmation, comme les pointeurs nuls ou les dépassements d'indice. Il prend également en charge une intégration transparente avec C et Objective-C.

Dans le développement réel, Swift s'occupe surtout de la partie logique de l'application, par exemple le traitement des données, les requêtes réseau ou les opérations de stockage.

## Qu'est-ce que SwiftUI ?

SwiftUI est un nouveau framework de construction d'interfaces lancé par Apple en 2019. SwiftUI adopte un modèle de programmation déclarative, qui permet aux développeurs de décrire la structure de l'interface et les comportements interactifs avec un code plus concis.

![swiftui](../../RESOURCE/010_swiftui.png)

La programmation déclarative signifie que le développeur indique seulement au système ce qu'il souhaite afficher, et que le système rafraîchit automatiquement la vue en fonction des changements de données. Il n'est donc plus nécessaire de mettre à jour manuellement l'état de l'interface, ce qui simplifie fortement le développement UI.

Le cœur de SwiftUI repose sur des composants de vue comme `Text`, `Image`, `Button`, etc., ainsi que sur des conteneurs de mise en page comme `VStack`, `HStack` et `ZStack`. Ces composants interagissent grâce à la liaison de données et à la gestion d'état, ce qui permet à l'interface de réagir aux changements de données et de se mettre à jour automatiquement.

## Comment Swift et SwiftUI collaborent-ils ?

Le rôle de Swift et celui de SwiftUI peuvent être résumés comme suit :

**1. Swift : gérer la logique et les données**

Swift est principalement utilisé pour gérer les données, stocker l'état et exécuter la logique. Ce code n'affecte généralement pas directement le rendu de l'interface, mais se charge du traitement des données et du comportement.

Par exemple, traiter des données en Swift :

```swift
let markdown = try? String(contentsOf: url)
```

Ce genre de code implique des déclarations de variables, des constantes, des fonctions, du contrôle de flux, etc., sans influencer directement l'affichage de la vue.

**2. SwiftUI : déclarer et afficher l'interface**

SwiftUI, de son côté, sert à construire la disposition et le contenu de l'interface utilisateur. Il est principalement responsable du rendu visuel et des interactions.

Par exemple, créer une vue texte avec SwiftUI :

```swift
Text("SwiftSlim")
```

Tout cela relève du code utilisé pour construire et contrôler les éléments d'interface, donc du code directement lié à l'interface utilisateur.

### Exemple de base

Voici un exemple SwiftUI simple :

```swift
// ContentView.swift

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

Dans cet exemple :

**Code SwiftUI** : `VStack`, `Image`, `Text` et `padding` appartiennent tous à SwiftUI et sont responsables de l'affichage et de la mise en page de l'interface.

**Code Swift** : le commentaire `//` en haut du fichier et `import SwiftUI` appartiennent à la structure du code Swift ; `#Preview` en bas est une macro utilisée pour l'aperçu Xcode et ne participe pas au rendu réel de l'interface.

### Exemple plus avancé

Dans un projet réel, Swift et SwiftUI sont souvent utilisés ensemble pour remplir leurs rôles respectifs :

```swift
struct ContentView: View {
    @State private var name = "FangJunyu"

    func printName() {
        print("name: \(name)")
    }

    var body: some View {
        VStack {
            Text(name)
            Button("Print") {
                printName()
            }
        }
        .padding()
    }
}
```

Dans cet exemple :

**Code SwiftUI** : `@State` est un wrapper de propriété propre à SwiftUI, utilisé pour déclarer un état modifiable de la vue ; `Button` et `Text` sont des composants de vue SwiftUI chargés de l'affichage et de l'interaction.

**Code Swift** : `private var name` et `func printName()` sont du code Swift servant à stocker les données et exécuter la logique. Ils n'affectent pas directement le rendu de la vue.

Quand l'utilisateur clique sur le bouton, SwiftUI déclenche le code de l'action :

```swift
Button("Print") {
    printName()
}
```

Ici, `Button` est un composant SwiftUI, tandis que la fonction exécutée `printName()` est du code Swift chargé du traitement logique concret.

Cette collaboration permet à Swift et SwiftUI de s'intégrer de manière fluide : Swift gère les données et la logique, SwiftUI affiche l'interface utilisateur.

## Où écrit-on habituellement le code Swift et SwiftUI ?

Dans SwiftUI, l'interface est construite à partir de la vue renvoyée par la propriété `body`. Ainsi, tout le code servant à décrire l'interface est généralement écrit dans `body`.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}
```

Dans cet exemple, `Text` est un composant de vue SwiftUI ; il doit donc être écrit dans `body`, car SwiftUI lit `body` pour générer l'interface.

Le code qui n'est pas directement lié à l'interface, comme les variables, les fonctions ou la logique de traitement des données, est généralement écrit à l'extérieur de `body`. Par exemple :

```swift
struct ContentView: View {

    // Swift : données ou logique
    var name = "Fang"

    func printName() {
        print(name)
    }

    // SwiftUI : interface
    var body: some View {
        Text(name)
    }
}
```

Il faut noter que l'on peut tout de même utiliser la syntaxe Swift à l'intérieur de `body`, par exemple des structures de contrôle comme `if` ou `for`. Elles servent simplement à contrôler la génération des vues SwiftUI :

```
if isLogin {
    Text("Welcome")
}
```

Ainsi, dans le développement SwiftUI, on peut comprendre les choses simplement comme ceci : le code de vue (`Text`, `Image`, `Button`, etc.) s'écrit généralement dans `body` ; les données et la logique (`variables`, `fonctions`, etc.) s'écrivent généralement à l'extérieur de `body`.

## Les fichiers Swift

Au fur et à mesure de votre progression, vous rencontrerez aussi l'architecture MVVM. Dans cette architecture, les couches `ViewModel` et `Model` sont généralement composées de code Swift pur, complètement séparé de la couche de vue SwiftUI.

Par exemple, une classe servant à gérer l'état de l'application :

```swift
class AppStorage: ObservableObject {
    static var shared = AppStorage()
    private var isLoading = false
}
```

Ou une structure décrivant des données :

```
struct SponsorStruct: Identifiable {
    var id:String
    var icon: String
}
```

Le rôle de ces fichiers est de gérer et de persister les données. Ils ne s'affichent pas directement dans la vue, ils relèvent donc entièrement de Swift.

## Contexte historique

Pour bien comprendre la relation entre Swift et SwiftUI, il est aussi utile de connaître l'évolution des technologies de développement chez Apple. En `2026`, cette pile technique a connu plusieurs itérations.

### Histoire de Swift

Avant l'apparition de Swift, Objective-C était le principal langage de programmation des plateformes Apple, avec un support du mélange avec le langage C. Sa syntaxe était relativement verbeuse, et la barrière d'entrée était assez élevée pour les débutants :

```Obj-c
// Écriture Objective-C
NSString *name = @"Fang";
NSLog(@"Hello，%@", name);
```

En `2014`, Apple a présenté Swift lors de la WWDC. Swift propose une syntaxe plus moderne, une meilleure sécurité de type, et a progressivement remplacé Objective-C comme langage de développement principal :

```swift
// Écriture Swift
let name = "Fang"
print("Hello, \(name)")
```

Cela ne signifie pas pour autant qu'Objective-C a disparu. Il reste encore largement utilisé dans de nombreux projets existants et dans des frameworks de bas niveau. Comprendre sa syntaxe de base reste donc utile pour maintenir d'anciens projets et mieux comprendre les fondations du système.

### Histoire de SwiftUI

Avant SwiftUI, iOS utilisait **UIKit** et macOS utilisait **AppKit**. Ces deux frameworks adoptaient une approche de programmation "impérative". Les développeurs devaient contrôler l'état des vues soit en manipulant des éléments dans `Storyboard`, soit en écrivant manuellement beaucoup de code, ce qui augmentait le volume de code et le coût de maintenance, en particulier lorsque la logique d'interface devenait complexe.

![storyboard](../../RESOURCE/010_xcode.png)

En `2019`, Apple a officiellement lancé SwiftUI lors de la WWDC. SwiftUI a introduit un paradigme de programmation "déclarative", simplifiant fortement le processus de développement UI.

![storyboard](../../RESOURCE/010_xcode1.png)

Il est important de noter que SwiftUI n'est pas une implémentation totalement indépendante au niveau bas. Sur chaque plateforme, il s'appuie en réalité sur UIKit (iOS) ou AppKit (macOS), avec lesquels il coopère au niveau de l'exécution.

### Relation entre Swift et UIKit/AppKit

Même si Swift est un langage généraliste pouvant fonctionner sur les différentes plateformes Apple, il ne peut pas remplacer complètement UIKit ou AppKit. Pour certaines exigences d'interface plus complexes, ou pour des fonctionnalités que SwiftUI ne couvre pas encore, il faut encore s'appuyer sur UIKit ou AppKit.

Par exemple, UIKit est déjà très mature pour la gestion complexe des contrôleurs de vue, les animations, la reconnaissance de gestes, etc., et a été validé par une grande quantité de pratiques en production. SwiftUI, bien que de plus en plus puissant, reste encore limité dans certains cas particuliers.

C'est pourquoi de nombreux développeurs utilisent SwiftUI et UIKit (ou AppKit) ensemble dans leurs projets, afin de profiter au mieux des avantages de chacun.

Dans cette perspective, on peut considérer SwiftUI comme une couche d'abstraction de haut niveau au-dessus de UIKit / AppKit. Apprendre SwiftUI tout en découvrant les notions de base de UIKit et AppKit peut aider à prendre de meilleures décisions techniques lorsqu'il faut maintenir d'anciens projets ou réaliser des fonctionnalités complexes.

## Résumé

**Swift** : principalement utilisé pour écrire la logique, le traitement des données, le contrôle de flux, etc., sans lien direct avec la mise en page des vues.

**SwiftUI** : utilisé pour construire l'interface utilisateur de manière déclarative ; le contenu des vues et la mise en page relèvent de SwiftUI.

Dans le développement réel, Swift et SwiftUI sont généralement utilisés ensemble : Swift gère la logique, SwiftUI gère l'interface.

D'Objective-C et UIKit à Swift et SwiftUI, l'environnement de développement Apple s'est progressivement orienté vers une approche plus moderne et plus concise. Cependant, UIKit et AppKit restent incontournables dans de nombreux projets traditionnels.

En comprenant la relation entre Swift et SwiftUI, nous pouvons développer plus efficacement des applications iOS/macOS et faire des choix techniques plus raisonnables lorsqu'il faut maintenir des projets plus anciens.
