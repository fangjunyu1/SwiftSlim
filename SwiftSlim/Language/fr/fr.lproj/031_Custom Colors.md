# Couleurs personnalisées

Dans cette leçon, nous allons apprendre à personnaliser les couleurs dans SwiftUI.

Dans les leçons précédentes, nous avons déjà utilisé les couleurs par défaut fournies par SwiftUI, par exemple :

```swift
Color.blue
Color.red
Color.green
```

Ces couleurs sont très pratiques à utiliser, mais dans le développement réel d’une app, les couleurs par défaut ne sont généralement pas assez précises.

Par exemple, une maquette de design peut utiliser des couleurs comme celles-ci :

```text
#2c54c2
#4875ed
#213e8d
```

Ce type de couleur est appelé couleur Hex.

Dans cette leçon, nous allons d’abord permettre à SwiftUI de prendre en charge les couleurs Hex, puis utiliser `static` pour organiser les couleurs courantes.

Enfin, nous appliquerons les couleurs personnalisées à la vue d’encyclopédie des animaux, puis nous utiliserons un arrière-plan dégradé pour donner plus de profondeur aux boutons.

## Pourquoi avons-nous besoin de couleurs personnalisées ?

Dans SwiftUI, nous pouvons utiliser directement les couleurs système.

Par exemple :

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

Ici, `.blue` représente le bleu. Il s’agit en fait d’une écriture simplifiée de `Color.blue`.

L’avantage des couleurs par défaut est qu’elles sont simples et pratiques, mais le choix des couleurs reste assez limité.

Par exemple :

```swift
Color.blue
```

Cela ne peut représenter que le bleu par défaut fourni par SwiftUI.

![Color.blue](../../../Resource/031_color6.png)

Mais dans le développement réel, nous avons souvent besoin de couleurs plus précises.

Par exemple, même pour du bleu, il peut y avoir du bleu clair, du bleu foncé, du bleu gris, du bleu vif et d’autres effets.

![More Blue](../../../Resource/031_color5.png)

Dans ce cas, si nous utilisons seulement `Color.blue`, il sera difficile de reproduire fidèlement l’effet du design.

Nous devons donc permettre à SwiftUI de prendre en charge les couleurs personnalisées.

## Qu’est-ce qu’une couleur Hex ?

Les couleurs affichées à l’écran sont généralement composées de trois canaux : rouge, vert et bleu, c’est-à-dire RGB.

RGB signifie respectivement :

```text
Red     // rouge
Green   // vert
Blue    // bleu
```

Une couleur Hex est une manière de représenter une couleur RGB.

Par exemple :

```swift
#5479FF
```

Cette valeur de couleur peut être simplement comprise en trois parties :

```text
54  // représente le canal rouge
79  // représente le canal vert
FF  // représente le canal bleu
```

Dans cette leçon, nous n’avons pas besoin de calculer ces valeurs ni de comprendre en détail les règles hexadécimales.

Pour l’instant, il suffit de savoir que `#5479FF` représente une couleur précise.

Plus tard, lorsque nous verrons des écritures comme `#2c54c2` ou `#4875ed`, nous pourrons d’abord les comprendre comme des valeurs de couleur.

Dans des outils de design comme Sketch, Figma ou Photoshop, on voit aussi souvent des valeurs de couleur similaires.

![color](../../../Resource/031_color.png)

Cependant, par défaut, SwiftUI ne permet pas d’écrire directement ceci :

```swift
Color(hex: "#5479FF")
```

Nous devons donc étendre nous-mêmes le type `Color` afin qu’il permette de créer une couleur à partir d’une chaîne Hex.

## Créer le fichier Color+Hex.swift

Tout d’abord, créons un nouveau fichier Swift.

Le nom du fichier peut être :

```text
Color.swift
```

Il peut aussi être écrit de manière plus claire :

```text
Color+Hex.swift
```

Ici, il est plutôt recommandé d’utiliser :

```text
Color+Hex.swift
```

Dans un projet Swift, les noms de fichiers comme `Color+Hex.swift` sont très courants.

Cela indique que ce fichier est un fichier d’extension qui ajoute à `Color` la capacité de gérer les couleurs Hex.

Le nom du fichier n’influence pas directement l’exécution du code ; il sert simplement à rendre l’usage du fichier plus facile à comprendre.

## Ajouter le code Color(hex:)

Dans le fichier `Color+Hex.swift`, écrivez le code suivant :

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
```

Ce code utilise `extension` pour étendre le type `Color` et ajoute une nouvelle méthode d’initialisation à `Color` :

```swift
init(hex: String)
```

Après avoir ajouté cette méthode d’initialisation, nous pouvons transmettre une chaîne Hex à `Color` afin de créer une couleur personnalisée :

```swift
Color(hex: "#5479FF")
```

À l’intérieur, ce code d’extension convertit la chaîne Hex en une couleur RGB que SwiftUI peut reconnaître.

À ce stade, il n’est pas nécessaire de comprendre en profondeur chaque ligne de la logique de conversion. Il suffit de savoir que la méthode `Color(hex:)` ajoutée nous permet de créer une couleur personnalisée à partir d’une valeur Hex.

## Utiliser une couleur personnalisée

Maintenant, nous pouvons tester les couleurs personnalisées dans `ContentView`.

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color.blue")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
            
            Text("#2c54c2")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#2c54c2"))
            
            Text("#4875ed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#4875ed"))
            
            Text("#213e8d")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "#213e8d"))
        }
        .padding()
    }
}
```

Effet affiché :

![color](../../../Resource/031_color1.png)

Dans cet exemple, la première ligne utilise une couleur système :

```swift
.foregroundStyle(Color.blue)
```

Les trois lignes suivantes utilisent des couleurs Hex personnalisées :

```swift
.foregroundStyle(Color(hex: "#2c54c2"))
.foregroundStyle(Color(hex: "#4875ed"))
.foregroundStyle(Color(hex: "#213e8d"))
```

Grâce à la comparaison, nous pouvons constater que le bleu système n’a qu’un seul effet par défaut.

En revanche, les couleurs Hex peuvent représenter des variations de bleu plus fines.

C’est la valeur des couleurs personnalisées : elles permettent aux couleurs de l’interface de se rapprocher davantage du design réel et nous aident aussi à mieux contrôler le style visuel de l’app.

## Utiliser static pour organiser les couleurs

Maintenant, nous pouvons déjà créer une couleur à partir d’une chaîne Hex :

```swift
Color(hex: "#2c54c2")
```

Cette écriture fonctionne correctement, mais si la même couleur apparaît à plusieurs endroits, sa maintenance devient moins pratique par la suite.

Si cette valeur de couleur est écrite à 10 endroits différents, il faudra les modifier un par un lorsque l’on voudra ajuster ce bleu.

Dans ce cas, nous pouvons utiliser `static` pour organiser les couleurs courantes de manière centralisée.

Au bas du fichier `Color+Hex.swift`, continuez en ajoutant le code suivant :

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Ici, nous avons ajouté trois propriétés statiques à `Color` : `animalBlue`, `animalLightBlue` et `animalDarkBlue`. Elles représentent respectivement différentes nuances de bleu.

Comme ces propriétés utilisent `static`, elles appartiennent au type `Color` lui-même.

Au moment de les utiliser, nous pouvons y accéder directement avec `Color.` :

```swift
Color.animalBlue
```

Cette écriture est plus claire que l’écriture directe d’une chaîne Hex.

Quand nous voyons `Color.animalBlue`, nous savons qu’il s’agit du bleu utilisé dans l’encyclopédie des animaux.

En revanche, quand nous voyons `Color(hex: "#2c54c2")`, nous savons seulement qu’il s’agit d’une valeur de couleur, mais il est plus difficile d’en comprendre l’usage précis.

La gestion centralisée des couleurs présente aussi un autre avantage : les modifications ultérieures sont plus simples.

Pour ajuster la couleur principale de l’encyclopédie des animaux, il suffit de modifier l’emplacement de définition :

```swift
static let animalBlue = Color(hex: "#1f5cff")
```

Tous les endroits qui utilisent cette couleur seront mis à jour en même temps.

C’est le sens de l’utilisation de `static` pour organiser les couleurs : rendre les noms de couleurs plus clairs et faciliter la maintenance ultérieure.

## Appliquer aux animaux de l’encyclopédie

Maintenant, nous pouvons appliquer les couleurs personnalisées à la vue d’encyclopédie des animaux précédente.

Auparavant, l’arrière-plan du bouton d’animal était blanc :

```swift
.background(Color.white)
```

![single white button](../../../Resource/031_color7.png)

Maintenant, nous pouvons le remplacer par une couleur personnalisée :

```swift
.background(Color.animalBlue)
```

![single blue button](../../../Resource/031_color8.png)

Ici, `Color.animalBlue` est précisément la couleur statique que nous venons de définir dans `Color+Hex.swift`.

Le texte du bouton utilise le blanc :

```swift
.foregroundStyle(Color.white)
```

L’arrière-plan de l’emoji de l’animal utilise du blanc semi-transparent :

```swift
.background(Color.white.opacity(0.15))
```

Ainsi, le bouton forme un style visuel bleu unifié.

L’objectif de cette étape n’est pas d’ajouter du code complexe, mais d’appliquer réellement à l’interface les couleurs personnalisées apprises précédemment.

## Utiliser un arrière-plan dégradé

En plus d’utiliser une couleur unique, nous pouvons aussi combiner plusieurs couleurs pour créer un effet de dégradé.

Par exemple, nous avons défini précédemment ces couleurs :

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
    static let animalLightBlue = Color(hex: "#4875ed")
    static let animalDarkBlue = Color(hex: "#213e8d")
}
```

Ces couleurs peuvent être utilisées séparément, mais elles peuvent aussi être combinées en arrière-plan dégradé.

Dans SwiftUI, on peut utiliser `LinearGradient` pour créer un dégradé linéaire.

Par exemple :

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Ce code crée un arrière-plan dégradé de gauche à droite, où la couleur passe progressivement de `Color.animalBlue` à `Color.animalLightBlue`.

Parmi ces paramètres, `colors` sert à définir les couleurs qui participent au dégradé, tandis que `startPoint` et `endPoint` servent à contrôler la direction du dégradé.

### Tester l’effet de dégradé

Nous pouvons utiliser un simple Text pour tester l’arrière-plan dégradé.

```swift
Text("Linear Gradient")
    .font(.title)
    .fontWeight(.bold)
    .padding()
    .foregroundStyle(Color.white)
    .background {
        LinearGradient(
            colors: [Color.animalBlue, Color.animalLightBlue],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    .cornerRadius(12)
```

Effet affiché :

![color](../../../Resource/031_color3.png)

Dans cet exemple, l’arrière-plan de `Text` n’est plus une couleur unique, mais une couleur dégradée qui change progressivement de gauche à droite.

Comparé à un arrière-plan ordinaire, un arrière-plan dégradé donne plus de profondeur et permet aussi de créer plus facilement un point d’attention visuel dans l’interface.

## Utiliser un arrière-plan dégradé dans l’encyclopédie des animaux

Maintenant, nous pouvons prendre la couleur d’arrière-plan du bouton d’animal :

```swift
.background(Color.animalBlue)
```

Et la remplacer par un arrière-plan dégradé :

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .leading,
        endPoint: .trailing
    )
}
```

Le code complet est le suivant :

```swift
import SwiftUI

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals = Animal.animals
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(20)
                        
                        Text(animal.name)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background {
                        LinearGradient(
                            colors: [Color.animalBlue, Color.animalLightBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}
```

Effet affiché :

![color](../../../Resource/031_color4.png)

Maintenant, le bouton d’animal n’a plus seulement une couleur d’arrière-plan unique : il possède un effet de dégradé de gauche à droite.

Comparé à un arrière-plan uni, un arrière-plan dégradé peut donner plus de profondeur à l’interface et se rapprocher davantage du design visuel d’une vraie app.

## Différence entre arrière-plan uni et arrière-plan dégradé

Un arrière-plan uni utilise une seule couleur.

Par exemple :

```swift
.background(Color.animalBlue)
```

Cette écriture est simple et claire, et convient à la plupart des interfaces de base.

Un arrière-plan dégradé utilise plusieurs couleurs.

Par exemple :

```swift
.background {
    LinearGradient(
        colors: [Color.animalBlue, Color.animalLightBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
```

Cette écriture peut donner plus de profondeur à l’interface, mais elle peut aussi augmenter plus facilement la complexité visuelle.

Dans le développement réel, on peut donc le comprendre ainsi :

Un arrière-plan uni convient aux textes ordinaires, aux boutons ordinaires, aux cartes ordinaires et aux arrière-plans de pages ordinaires.

Un arrière-plan dégradé convient aux boutons importants, aux zones supérieures, aux cartes de couverture, aux entrées de fonctionnalités et aux autres emplacements à mettre en évidence.

## Résumé

Dans cette leçon, nous avons appris à utiliser des couleurs personnalisées dans SwiftUI.

Tout d’abord, nous avons compris ce qu’est une couleur Hex.

Par exemple :

```text
#2c54c2
```

Elle représente une couleur précise.

Ensuite, nous avons utilisé `extension Color` pour étendre le type `Color`.

Cela permet à SwiftUI de créer des couleurs de la manière suivante :

```swift
Color(hex: "#2c54c2")
```

Ensuite, nous avons utilisé `static` pour organiser les couleurs courantes :

```swift
extension Color {
    static let animalBlue = Color(hex: "#2c54c2")
}
```

Ainsi, dans les autres vues, nous pouvons l’utiliser directement :

```swift
Color.animalBlue
```

Comparée à l’écriture répétée de chaînes Hex, cette méthode est plus claire et facilite aussi la modification centralisée des couleurs par la suite.

Enfin, nous avons appris `LinearGradient` et combiné des couleurs personnalisées pour créer un arrière-plan dégradé :

```swift
LinearGradient(
    colors: [Color.animalBlue, Color.animalLightBlue],
    startPoint: .leading,
    endPoint: .trailing
)
```

Grâce à cette leçon, nous avons terminé le processus allant de « créer une couleur personnalisée » à « utiliser la couleur dans une interface réelle ».

À l’avenir, lorsqu’une couleur devra être réutilisée à plusieurs endroits, nous pourrons envisager en priorité de l’organiser dans une extension de `Color`.

Ainsi, le code sera plus clair et le style de l’interface sera également plus facile à unifier.
