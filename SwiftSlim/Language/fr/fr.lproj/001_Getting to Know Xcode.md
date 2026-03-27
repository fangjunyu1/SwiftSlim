# Découvrir Xcode

## Qu'est-ce que Xcode

Xcode est l'environnement de développement intégré officiel d'Apple (IDE, Integrated Development Environment), utilisé pour développer des applications sur les plateformes Apple comme iOS, macOS, watchOS et tvOS.

![Swift](../../RESOURCE/001_xcode.png)

Pendant tout ce cours, nous utiliserons Xcode pour écrire du code et exécuter des programmes.

Dans cette leçon, nous allons apprendre à télécharger Xcode, créer notre première application iOS, et découvrir la structure générale de son interface.

## Télécharger Xcode

Actuellement, Xcode peut être installé de deux façons :

1、Téléchargement via le [Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)

2、Téléchargement via le [site officiel Apple Developer](https://developer.apple.com/xcode/)

Les deux méthodes permettent d'obtenir Xcode. La différence, c'est que le site Apple Developer permet non seulement de télécharger la version stable, mais aussi les versions [Beta](https://developer.apple.com/download/all/?q=Xcode) ou des versions plus anciennes.

Si vous apprenez simplement le développement, il est recommandé d'utiliser la version stable. Les versions Beta servent surtout à tester de nouvelles fonctionnalités et peuvent être instables.

## Créer le premier projet

Après avoir ouvert Xcode, vous verrez l'écran d'accueil.

![Swift](../../RESOURCE/001_xcode1.png)

La partie gauche contient trois options courantes :

- Create New Project —— créer un nouveau projet  
- Clone Git Repository —— cloner un dépôt Git  
- Open Existing Project —— ouvrir un projet existant

La partie droite affiche les projets Xcode récemment ouverts.

Nous choisissons l'option `"Create New Project"`.

### Choisir un modèle de projet

![Swift](../../RESOURCE/001_xcode2.png)

Vous arrivez alors sur l'écran de sélection du modèle de projet, qui affiche plusieurs plateformes (iOS, macOS, etc.) ainsi que différents types de modèles.

Explication des modèles courants :
- App —— le type d'application le plus basique (recommandé)
- Document App —— application basée sur des documents
- Game —— destiné au développement de jeux
- Framework —— module réutilisable

À ce stade d'initiation, nous choisissons uniquement le modèle `"iOS" - "App"`, car il s'agit du type d'application d'interface.

Cliquez ensuite sur `"Next"`.

### Remplir les informations du projet

Vous arrivez à l'écran de configuration des informations du projet, où il faut remplir les champs en fonction de leur type.

![Swift](../../RESOURCE/001_xcode3.png)

Signification des différents champs :

- Product Name —— nom du projet, par exemple : `SwiftSlimTest`
- Team —— équipe de développement ; si vous n'avez pas de compte Apple Developer payant, vous pouvez laisser vide
- Organization Identifier —— identifiant de l'organisation, généralement au format de domaine inversé, par exemple :
  - `com.yourname`
  - `com.yourcompany`
  - si vous n'avez pas de domaine, vous pouvez utiliser votre nom anglais comme identifiant
- Bundle Identifier —— identifiant unique de l'application, généré automatiquement à partir de `Organization Identifier` et `Product Name`
- Interface —— technologie d'interface, choisissez `SwiftUI`
- Language —— langage de développement, choisissez `Swift`
- Testing System —— crée par défaut une cible de test (`Unit Tests`), à ignorer au début
- Storage —— framework de persistance locale, qui peut intégrer automatiquement `SwiftData` ou `Core Data`, à ignorer également au début

Une fois les informations remplies, cliquez sur `"Next"`.

### Enregistrer le projet

![Swift](../../RESOURCE/001_xcode4.png)

Choisissez un dossier approprié pour enregistrer le projet.

Cliquez sur le bouton `"Create"` et Xcode générera automatiquement la structure du projet.

## Structure du projet Xcode

Après avoir enregistré le projet Xcode, vous pourrez voir le dossier généré dans le Finder.

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` —— dossier utilisé pour stocker les images, les icônes d'application et autres ressources

- `ContentView.swift` —— fichier SwiftUI généré par défaut, dans lequel nous écrirons plus tard le code d'interface

- `SwiftSlimTestApp.swift` —— fichier d'entrée de l'application (`App Entry Point`), responsable du lancement de l'app ; nous n'avons pas encore besoin de l'étudier

- `SwiftSlimTest.xcodeproj` —— fichier de projet Xcode ; un double-clic sur ce fichier permet d'ouvrir le projet

## Découvrir l'interface de Xcode

Double-cliquez sur le fichier `.xcodeproj` pour ouvrir le projet, puis sélectionnez `ContentView.swift` dans la zone `Navigator` à gauche.

L'interface de Xcode est principalement composée de cinq zones :

- Navigator —— zone de navigation, utilisée pour parcourir les fichiers et effectuer des recherches
- Editor —— zone d'édition, utilisée pour écrire du code Swift ou SwiftUI
- Canvas —— zone de canevas, utilisée pour l'aperçu SwiftUI
- Inspector —— zone d'inspection des propriétés, utilisée pour consulter et modifier les attributs du fichier
- Debug Area —— zone de débogage, utilisée pour afficher les journaux

![Swift](../../RESOURCE/001_xcode6.png)

Remarque : `Canvas` est principalement utilisé pour l'aperçu des vues SwiftUI. D'un point de vue architectural officiel, il s'agit d'un panneau d'aperçu auxiliaire de l'`Editor` (`Preview Pane`). Il ne peut être activé que lorsque vous ouvrez un fichier de vue SwiftUI ; les autres types de fichiers n'affichent pas cette fonction.

Dans les prochaines leçons, nous écrirons principalement du code Swift et SwiftUI dans la zone `Editor`.

Lors de la première ouverture d'un projet Xcode, les zones `Inspector` et `Debug Area` peuvent être masquées par défaut. Vous pouvez les afficher à l'aide des boutons situés en haut à droite et en bas à droite.

![Swift](../../RESOURCE/001_xcode7.png)

Astuce : la zone `Inspector` sert surtout à consulter et modifier les propriétés des fichiers. En pratique, on la masque souvent pour obtenir plus d'espace d'édition.

## Résumé

Dans cette leçon, nous avons appris à télécharger Xcode, à créer notre premier projet Xcode, ainsi qu'à reconnaître l'organisation de base de son interface.

Place maintenant à un petit temps d'exploration libre :
- vous pouvez essayer de créer ou supprimer des fichiers dans la zone `Navigator` ;  
- observer le code dans la zone `Editor` et regarder sa structure ;
- examiner les boutons de la zone `Canvas`, puis essayer de zoomer ou dézoomer l'aperçu.

Dans la prochaine leçon, nous commencerons à écrire un peu de code simple, ce qui nous aidera à mieux comprendre Xcode.  
