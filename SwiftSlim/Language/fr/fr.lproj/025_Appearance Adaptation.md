# Adaptation de l’apparence

Dans cette leçon, nous allons apprendre à adapter une interface au mode clair et au mode sombre.

Sur iPhone, iPad et Mac, les utilisateurs peuvent choisir le mode clair ou le mode sombre.

Lorsque le système passe en mode sombre, les couleurs d’arrière-plan, de texte et d’icônes de nombreuses apps changent aussi en conséquence.

Par exemple, l’interface peut utiliser un arrière-plan clair pendant la journée et passer à un arrière-plan sombre la nuit.

![view](../../../Resource/025_view9.png)

Cette capacité à ajuster automatiquement l’affichage de l’interface selon l’apparence du système s’appelle l’adaptation de l’apparence.

## Prévisualiser l’adaptation de l’apparence dans Xcode

Avant d’apprendre l’adaptation de l’apparence, voyons d’abord comment prévisualiser le mode clair et le mode sombre dans Xcode.

En bas de la zone `Canvas`, cliquez sur le bouton `Device Settings` pour ouvrir la fenêtre contextuelle `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

Dans cette fenêtre, vous pouvez voir le réglage `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Cela signifie :

- `Light Appearance` signifie mode clair.
- `Dark Appearance` signifie mode sombre.

Nous pouvons changer l’apparence de prévisualisation ici et vérifier l’affichage de l’interface actuelle en mode clair et en mode sombre.

## Afficher deux apparences côte à côte

Si vous voulez voir le mode clair et le mode sombre en même temps, vous pouvez utiliser la fonction `Variants`.

En bas de la zone `Canvas`, cliquez sur le bouton `Variants`, puis choisissez `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Après la sélection, le `Canvas` affichera en même temps les aperçus du mode clair et du mode sombre.

![canvas3](../../../Resource/025_view3.png)

Cela permet de comparer plus facilement les différences d’interface entre les deux apparences.

En termes simples :

Si vous voulez seulement basculer temporairement entre le mode clair et le mode sombre, vous pouvez utiliser `Canvas Device Settings`.

Si vous voulez voir les deux apparences en même temps, vous pouvez utiliser `Color Scheme Variants`.

## Les vues s’adaptent par défaut à l’apparence

Dans SwiftUI, de nombreuses vues système s’adaptent automatiquement au mode clair et au mode sombre par défaut.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Clair")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("texte texte texte")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Résultat d’affichage :

![canvas](../../../Resource/025_view4.png)

Vous pouvez voir qu’en mode clair, les icônes et les titres s’affichent généralement en couleur sombre.

En mode sombre, les icônes et les titres deviennent automatiquement clairs.

C’est parce que les vues SwiftUI comme `Text` et `Image` ajustent leurs couleurs par défaut selon l’apparence du système.

Autrement dit, si nous ne définissons pas manuellement une couleur fixe, SwiftUI traite pour nous une partie de l’adaptation de l’apparence.

## Les couleurs fixes ne s’inversent pas automatiquement

Il faut noter que si nous définissons manuellement une couleur fixe, elle ne basculera pas automatiquement entre le mode clair et le mode sombre.

Par exemple :

```swift
Text("texte texte texte")
	.foregroundStyle(Color.gray)
```

Ici, le texte est défini sur `Color.gray`, donc il s’affichera toujours en gris.

Autre exemple :

```swift
Text("Titre")
    .foregroundStyle(Color.white)
```

Ce code affichera du texte blanc en mode clair comme en mode sombre.

Si l’arrière-plan est lui aussi clair, le texte blanc risque d’être difficile à lire.

Ainsi, lors de l’adaptation d’une interface à différentes apparences, essayez d’éviter d’écrire directement des couleurs fixes comme `Color.white` et `Color.black` sans raison précise.

Dans de nombreux cas, vous pouvez privilégier les styles sémantiques du système, par exemple :

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Cela signifie :

- `.primary` est généralement utilisé pour le contenu principal.
- `.secondary` est généralement utilisé pour le contenu secondaire.

Ils ajustent automatiquement leur affichage selon le mode clair et le mode sombre.

## Afficher un contenu différent selon l’apparence

Parfois, nous ne voulons pas seulement que les couleurs changent, mais aussi afficher un contenu différent selon l’apparence.

Par exemple :

- Afficher une icône d’ampoule normale en mode clair.
- Afficher une icône d’ampoule lumineuse en mode sombre.
- Afficher `Clair` comme titre en mode clair.
- Afficher `Sombre` comme titre en mode sombre.

Dans ce cas, nous devons déterminer si le système actuel est en mode clair ou en mode sombre.

Dans SwiftUI, nous pouvons obtenir le mode d’apparence actuel grâce à la valeur d’environnement `colorScheme` :

```swift
@Environment(\.colorScheme) private var colorScheme
```

Code complet :

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Clair" : "Sombre"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("texte texte texte")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Résultat d’affichage :

![view](../../../Resource/025_view5.png)

Dans le résultat de prévisualisation, vous pouvez voir que la même vue n’affiche pas exactement le même contenu selon le mode d’apparence.

En mode clair, `Image` affiche l’icône d’ampoule normale, et le titre affiche `Clair`.

En mode sombre, `Image` affiche l’icône d’ampoule lumineuse, et le titre affiche `Sombre`.

Autrement dit, le changement ici n’est pas seulement un changement de couleur. Le nom de l’icône et le texte du titre ont eux aussi changé.

C’est parce que nous n’avons pas écrit directement l’icône et le titre en dur dans `body`. Nous calculons plutôt un contenu différent selon `colorScheme`.

Dans ce code, nous utilisons deux propriétés calculées :

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Clair" : "Sombre"
}
```

Lorsque `colorScheme` vaut `.light`, cela signifie que le mode actuel est le mode clair.

Lorsque `colorScheme` vaut `.dark`, cela signifie que le mode actuel est le mode sombre.

Nous pouvons donc retourner différents noms d’icônes et différents textes de titre selon les modes d’apparence.

C’est aussi un usage courant des propriétés calculées : calculer le contenu qu’une vue doit afficher selon l’état actuel.

## Comprendre @Environment

C’est la première fois que nous rencontrons `@Environment`.

`@Environment` peut être compris comme la lecture d’une valeur depuis l’environnement de SwiftUI.

Lorsqu’une app s’exécute, le système fournit de nombreuses informations d’environnement, par exemple :

- Langue actuelle
- Mode d’apparence actuel
- Direction de mise en page actuelle
- Réglage actuel de la taille de police

Lorsque nous devons obtenir le mode d’apparence actuel, nous pouvons lire `colorScheme` :

```swift
@Environment(\.colorScheme) private var colorScheme
```

Ici :

```swift
\.colorScheme
```

signifie lire la valeur `colorScheme` depuis l’environnement.

```swift
private var colorScheme
```

signifie enregistrer la valeur lue dans la variable `colorScheme`.

Vous pouvez choisir vous-même le nom de la variable. Par exemple, vous pouvez aussi écrire :

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Tant que le `\.colorScheme` placé devant ne change pas, cela signifie que vous lisez le mode d’apparence actuel.

## Deux valeurs courantes de colorScheme

`colorScheme` a généralement deux valeurs :

```swift
.light
.dark
```

Elles signifient :

- `.light` : mode clair
- `.dark` : mode sombre

Par exemple :

```swift
private var titleName: String {
    colorScheme == .light ? "Clair" : "Sombre"
}
```

Ce code signifie :

Si le mode actuel est le mode clair, `colorScheme == .light` est vrai, donc il retourne `"Clair"`.

Sinon, il retourne `"Sombre"`.

Donc, en mode clair :

```swift
Text(titleName)
```

Le texte affiché est :

```swift
Clair
```

En mode sombre, le texte affiché est :

```swift
Sombre
```

De cette façon, nous pouvons afficher un contenu différent selon les différentes apparences.

## Exemple d’adaptation des couleurs

En plus du texte et des icônes, nous devons parfois gérer nous-mêmes l’adaptation des couleurs.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Texte")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Résultat d’affichage :

![view](../../../Resource/025_view6.png)

Dans ce code, le texte est blanc et l’arrière-plan est noir.

En mode clair, l’arrière-plan noir est assez visible.

Cependant, en mode sombre, si tout l’arrière-plan de l’interface est lui aussi noir, cet arrière-plan noir se fondra dans l’arrière-plan du système et paraîtra moins net.

À ce moment-là, nous pouvons changer la couleur du texte et la couleur d’arrière-plan selon le mode d’apparence :

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Texte")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Résultat d’affichage :

![view](../../../Resource/025_view7.png)

Maintenant, le mode clair utilise un arrière-plan noir avec du texte blanc.

Le mode sombre utilise un arrière-plan blanc avec du texte noir.

Ainsi, quelle que soit l’apparence utilisée, le texte et l’arrière-plan ont un contraste clair, et les utilisateurs peuvent voir le contenu clairement.

## Utiliser Assets pour adapter les couleurs

En plus de vérifier manuellement avec `colorScheme`, nous pouvons aussi utiliser les couleurs de ressource `Assets` pour nous adapter au mode clair et au mode sombre.

Cette approche convient mieux à la gestion des couleurs communes dans une app.

Dans le projet Xcode, trouvez le dossier de ressources `Assets`.

![assets](../../../Resource/025_color.png)

Ouvrez le dossier `Assets`, faites un clic droit sur une zone vide, puis choisissez `New Color Set` pour créer une nouvelle ressource de couleur.

![assets](../../../Resource/025_color1.png)

Ici, nous créons une couleur et nous la nommons `redText`.

![assets](../../../Resource/025_color2.png)

Une ressource de couleur peut définir séparément des couleurs pour le mode clair et le mode sombre.

![assets](../../../Resource/025_color3.png)

Après avoir sélectionné la zone de couleur correspondante, vous pouvez modifier la couleur dans l’inspecteur à droite.

Cliquez sur le bouton `Hide or show the Inspectors` en haut à droite pour ouvrir la zone des inspecteurs.

Choisissez ensuite `Show the Attributes inspector`, trouvez `Show Color Panel` en bas, puis ouvrez le panneau de couleurs.

![assets](../../../Resource/025_color4.png)

Cliquez sur une couleur dans le panneau de couleurs, et la zone de couleur correspondante de `redText` changera en même temps.

Ici, nous définissons `redText` ainsi :

- Afficher du rouge en mode clair
- Afficher du vert en mode sombre

![assets](../../../Resource/025_color5.png)

De retour dans le code SwiftUI, vous pouvez utiliser cette couleur comme ceci :

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Ici :

```swift
Color("redText")
```

signifie lire depuis `Assets` la ressource de couleur nommée `redText`.

Résultat d’affichage :

![assets](../../../Resource/025_view8.png)

Vous pouvez voir que le même `Color("redText")` affiche des couleurs différentes en mode clair et en mode sombre.

Cela montre que les couleurs `Assets` elles-mêmes prennent aussi en charge l’adaptation de l’apparence.

## Différence entre colorScheme et Assets

`colorScheme` et `Assets` peuvent tous deux réaliser l’adaptation de l’apparence, mais ils conviennent à des scénarios différents.

Si vous avez seulement besoin de changer le contenu du texte, les noms d’images ou les noms de `SF Symbols` selon le mode clair et le mode sombre, vous pouvez utiliser `colorScheme`.

Par exemple :

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Si la couleur est souvent utilisée dans l’app, par exemple une couleur de thème, une couleur d’arrière-plan de carte ou une couleur de texte, il est plus recommandé d’utiliser les couleurs `Assets`.

En effet, les couleurs `Assets` peuvent être réutilisées dans plusieurs vues et sont plus faciles à modifier par la suite.

Par exemple :

```swift
Color("redText")
```

De cette façon, il suffit de modifier la couleur dans `Assets`, et tous les endroits qui utilisent cette couleur changeront ensemble.

## Résumé

Dans cette leçon, nous avons appris l’adaptation de l’apparence pour le mode clair et le mode sombre.

D’abord, nous avons appris à prévisualiser différentes apparences dans le `Canvas` de Xcode, ainsi qu’à utiliser `Color Scheme Variants` pour voir le mode clair et le mode sombre en même temps.

Ensuite, nous avons appris que les vues SwiftUI comme `Text` et `Image` adaptent automatiquement leurs couleurs selon l’apparence du système par défaut.

Cependant, si nous définissons manuellement des couleurs fixes comme `Color.white` ou `Color.black`, ces couleurs ne basculeront pas automatiquement.

Puis, nous avons appris `@Environment` et `colorScheme` :

```swift
@Environment(\.colorScheme) private var colorScheme
```

Grâce à `colorScheme`, nous pouvons déterminer si le mode actuel est clair ou sombre, puis afficher différents icônes, textes ou couleurs selon les différentes apparences.

Enfin, nous avons découvert les couleurs `Assets`.

Les couleurs `Assets` peuvent définir séparément des couleurs pour le mode clair et le mode sombre, ce qui les rend adaptées à la gestion des ressources de couleur communes dans une app.

L’adaptation de l’apparence peut rendre une app plus agréable à afficher le jour comme la nuit, et peut aussi éviter des problèmes comme un texte illisible ou un arrière-plan peu visible.

Dans le développement réel, il est recommandé de privilégier le comportement d’adaptation par défaut de SwiftUI et les couleurs `Assets`.

Lorsque vous devez changer du texte, des icônes, des images, ou gérer un petit nombre d’effets d’affichage spéciaux selon différentes apparences, utilisez alors `colorScheme` pour effectuer le jugement.

## Connaissance complémentaire : spécifier la taille de police

Lorsque nous avons appris `font` auparavant, nous avons utilisé certains styles de police système :

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

En plus d’utiliser des styles de police système comme `.largeTitle` et `.callout`, vous pouvez aussi spécifier manuellement la taille de police.

Par exemple :

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Ici :

```swift
.font(.system(size: 100))
```

signifie définir la taille de police sur `100 pt`.

Pour les icônes `SF Symbols`, `font` influence aussi la taille de l’icône.

Donc, si vous voulez qu’une icône s’affiche plus grande, vous pouvez spécifier sa taille avec `.font(.system(size:))`.

Par exemple :

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Il faut noter que même si la spécification manuelle de la taille de police est plus flexible, il n’est pas recommandé d’utiliser massivement des tailles fixes pour le texte ordinaire.

Pour le texte ordinaire, privilégiez les styles de police système comme `.title`, `.headline`, `.body` et `.caption`.

Cela permet de mieux s’adapter aux différents appareils et aux réglages de taille de police des utilisateurs.
