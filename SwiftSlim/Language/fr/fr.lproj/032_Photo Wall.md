# Mur de photos

Dans cette leçon, nous allons créer une page de mur de photos.

![view](../../../Resource/032_view13.png)

Dans cet exemple, nous allons réviser `extension`, `self` et les instances, puis apprendre les formes `Shape` couramment utilisées dans SwiftUI.

Avec ces connaissances, nous pouvons rogner des images ordinaires en différents styles, comme un cercle, un rectangle arrondi, une capsule ou une ellipse, et ajouter des effets de bordure aux photos.

Cette leçon utilisera plusieurs nouvelles notions : `Shape`, `clipShape`, `strokeBorder` et `overlay`.

Parmi elles, `clipShape` sert à rogner la forme d’une vue, `strokeBorder` sert à dessiner la bordure d’une forme, et `overlay` sert à superposer une nouvelle vue au-dessus de la vue actuelle.

## Ressources d’images

Avant de commencer, nous devons préparer quelques images.

Vous pouvez utiliser vos propres photos ou les images d’exemple fournies dans cette leçon.

Les photos d’exemple de cette leçon proviennent du site [Pixabay](https://pixabay.com/) :

[Paysage](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [Renard](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [Bâtiment](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [Fleur](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [Cygne](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Après avoir téléchargé les images, ajoutez-les au dossier de ressources `Assets`, puis nommez-les dans l’ordre `1`, `2`, `3`, `4` et `5`.

![assets](../../../Resource/032_view17.png)

Ainsi, nous pouvons afficher les images dans SwiftUI avec `Image("1")`, `Image("2")`, etc.

## Afficher les photos

Tout d’abord, nous affichons 5 photos dans `ContentView` :

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Effet affiché :

![view](../../../Resource/032_view.png)

Dans ce code, nous utilisons `ScrollView` pour permettre le défilement de la liste de photos, et `VStack` pour disposer plusieurs images de haut en bas.

Chaque image utilise `.resizable()`, `.scaledToFit()` et `.frame(width: 300)` pour définir son affichage, afin que l’image puisse être redimensionnée, conserver ses proportions et être limitée en largeur.

Le `.padding(.vertical, 100)` sur `VStack` sert à augmenter l’espacement en haut et en bas, afin d’éviter que la première et la dernière photo soient trop proches des bords de l’écran.

Le dernier `.ignoresSafeArea()` signifie que la vue défilante ignore la zone sûre, ce qui permet aux photos de s’étendre jusqu’en haut et en bas de l’écran pendant le défilement, pour un affichage plus complet de la page.

Cependant, les 5 images utilisent actuellement les mêmes modificateurs :

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Quand nous voyons du code répété, nous pouvons envisager d’utiliser une `extension` pour l’organiser.

## Utiliser extension pour organiser le style des images

Nous pouvons ajouter à `Image` une méthode dédiée au mur de photos :

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Ici, nous ajoutons au type `Image` une méthode `photoGalleryStyle`.

Cette méthode contient les éléments répétés précédemment : `.resizable()`, `.scaledToFit()` et `.frame(width: 300)`. Autrement dit, elle regroupe le redimensionnement de l’image, l’affichage proportionnel et le réglage de la largeur.

Après avoir utilisé cette extension, le code d’image original :

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

peut être simplifié en :

```swift
Image("1")
    .photoGalleryStyle()
```

Ainsi, chaque image n’a besoin que d’appeler `.photoGalleryStyle()` pour appliquer le même style de mur de photos. Le code devient plus concis et sera aussi plus facile à modifier de manière uniforme par la suite.

## Comprendre self

Dans la méthode d’extension, nous avons écrit `self` :

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Ici, `self` représente l’instance d’image actuelle qui appelle cette méthode.

Par exemple :

```swift
Image("1")
    .photoGalleryStyle()
```

Dans ce code, `photoGalleryStyle()` est appelée par `Image("1")`, donc le `self` à l’intérieur de la méthode représente cette image `Image("1")`.

On peut le comprendre simplement ainsi : celui qui appelle cette méthode est ce que `self` représente.

Il faut noter que les modificateurs SwiftUI renvoient continuellement de nouveaux résultats de vue. Par conséquent, `photoGalleryStyle()` renvoie une vue modifiée, au lieu de simplement renvoyer l’`Image` d’origine elle-même.

## Formes de photos

Maintenant, les photos peuvent déjà s’afficher normalement. Cependant, ces photos sont rectangulaires par défaut, ce qui paraît assez ordinaire.

Si vous voulez seulement donner des coins arrondis aux photos, vous pouvez utiliser directement `.cornerRadius()` :

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Effet affiché :

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` signifie ajouter un rayon de coin de `20 pt` à l’image. Pour des images ordinaires à coins arrondis, cette écriture est déjà suffisante.

Cependant, `.cornerRadius()` ne peut traiter que l’effet de coins arrondis et convient aux images ordinaires à coins arrondis. Si nous voulons transformer les photos en davantage de formes différentes, ce modificateur seul ne suffit pas.

À ce moment-là, nous devons utiliser `Shape` dans SwiftUI. `Shape` peut représenter différentes formes graphiques, et avec `clipShape`, il permet de rogner une image selon la forme correspondante.

## Comprendre Shape

Dans SwiftUI, `Shape` représente une forme graphique. Comme `View`, c’est un type très couramment utilisé dans SwiftUI.

Les types `Shape` courants incluent le cercle, le rectangle, le rectangle arrondi, la capsule et l’ellipse. Pour observer plus intuitivement l’apparence des différentes formes, les exemples suivants définissent une couleur et une taille différentes pour chaque forme.

Dans ces exemples, `.fill()` sert à remplir la forme avec une couleur, et `.frame()` sert à définir la taille d’affichage de la forme. Les couleurs servent seulement à distinguer les différentes formes ; elles ne sont pas les couleurs fixes des formes elles-mêmes.

### Circle cercle

`Circle` représente un cercle. Il est souvent utilisé pour les avatars, les boutons circulaires, les images circulaires et d’autres effets d’interface.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle rectangle

`Rectangle` représente un rectangle. C’est l’une des formes les plus fondamentales, et il peut aussi servir à créer des arrière-plans, des zones de séparation ou des bordures ordinaires.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle rectangle arrondi

`RoundedRectangle` représente un rectangle arrondi. `cornerRadius` sert à définir la taille des coins arrondis.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule capsule

`Capsule` représente une forme de capsule. Ses deux extrémités sont arrondies, et elle est souvent utilisée pour les boutons capsules, les arrière-plans d’étiquettes et d’autres effets d’interface.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse ellipse

`Ellipse` représente une ellipse. Elle ressemble à `Circle`, mais lorsque la largeur et la hauteur sont différentes, elle s’affiche comme une ellipse.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Grâce à ces exemples, nous pouvons voir que `Shape` lui-même peut être affiché directement comme une forme graphique. Ensuite, nous utiliserons ces types `Shape` avec `clipShape` pour rogner les photos afin qu’elles apparaissent dans différentes formes.

## Utiliser clipShape pour rogner les photos

Maintenant, nous pouvons utiliser `clipShape` pour rogner les photos en différentes formes.

Par exemple, rogner la première photo en cercle :

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Ce code signifie : afficher d’abord une image, puis utiliser `Circle()` pour la rogner en cercle.

![view](../../../Resource/032_view2.png)

La syntaxe de base de `clipShape` est :

```swift
.clipShape(forme)
```

Ajoutez `.clipShape(...)` après la vue, puis indiquez entre parenthèses la forme graphique dans laquelle vous voulez la rogner.

Par exemple :

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Maintenant, nous rognons les 5 photos en différentes formes :

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Effet affiché :

![view](../../../Resource/032_view8.png)

Parmi elles, l’effet obtenu après un rognage avec `Rectangle()` est proche d’une photo rectangulaire ordinaire ; le changement visuel n’est donc pas évident. Il sert principalement à comparer avec les autres formes.

Maintenant, les photos ne sont plus seulement des rectangles ordinaires : elles possèdent différentes formes.

## Ajouter une bordure aux photos

Si nous voulons ajouter une bordure à une photo circulaire, nous pourrions penser à utiliser `border` :

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Cependant, le résultat obtenu n’est généralement pas une bordure circulaire, mais une bordure rectangulaire.

![view](../../../Resource/032_view9.png)

C’est parce que `border` ajoute une bordure selon la zone rectangulaire de la vue, et non selon la forme après le rognage par `clipShape`.

Donc, si nous voulons une bordure circulaire, nous ne pouvons pas utiliser directement `border`.

## Utiliser strokeBorder pour dessiner les bordures de formes

Dans SwiftUI, `strokeBorder` peut dessiner des bordures internes pour ces types `Shape` courants.

Par exemple, dessiner une bordure circulaire :

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Ce code signifie : dessiner une bordure marron pour `Circle`, avec une largeur de bordure de `10 pt`.

![view](../../../Resource/032_view12.png)

Il faut noter ici que `strokeBorder` n’ajoute pas directement une bordure à la photo, mais dessine une bordure pour la forme graphique `Circle()`.

Autrement dit, ce code ne produit qu’une bordure circulaire indépendante, qui n’a pas encore de relation avec la photo.

Si nous voulons que cette bordure circulaire s’affiche au-dessus de la photo, nous devons continuer à utiliser `overlay` pour superposer la bordure sur la photo.

## Utiliser overlay pour superposer une bordure

`overlay` est un modificateur de vue qui permet de superposer une nouvelle vue au-dessus de la vue actuelle.

Sa structure de base peut être comprise ainsi :

```swift
Vue actuelle
    .overlay {
        Vue superposée
    }
```

Dans cet exemple, la vue actuelle est la photo déjà rognée en cercle :

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

La nouvelle vue que nous voulons superposer est une bordure circulaire :

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Nous pouvons donc combiner la photo et la bordure :

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Ici, `overlay` signifie superposer une nouvelle vue au-dessus de la vue actuelle.

Dans `overlay`, la bordure se superpose en suivant la zone d’affichage de la photo actuelle ; il n’est donc pas nécessaire de définir un `frame` séparé. Tant que la forme de la bordure correspond à la forme de rognage, la bordure peut s’adapter à la photo.

![view](../../../Resource/032_view10.png)

L’effet final est qu’une bordure circulaire recouvre la photo circulaire.

Comparé à `ZStack`, `overlay` est plus adapté à ce type de scénario consistant à « ajouter une décoration à la vue actuelle ». La photo est l’élément principal, et la bordure n’est qu’un effet supplémentaire ; utiliser `overlay` est donc plus clair.

## Terminer le mur de photos

Maintenant, nous ajoutons à chaque photo la forme et la bordure correspondantes :

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Effet affiché :

![view](../../../Resource/032_view13.png)

Ainsi, une page de mur de photos de base est terminée.

Dans cette page, nous utilisons `ScrollView` pour réaliser l’affichage défilant, `Image` pour afficher les photos, `clipShape` pour rogner la forme des photos, puis `overlay` et `strokeBorder` pour ajouter les bordures.

## Code complet

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Résumé

Dans cette leçon, nous avons terminé une page de mur de photos.

![view](../../../Resource/032_view13.png)

Dans cet exemple, nous avons d’abord utilisé `Image` pour afficher les photos, puis nous avons ajouté à `Image`, grâce à `extension`, une méthode `photoGalleryStyle` pour organiser le code répété lié au style des images.

Ensuite, nous avons appris les types `Shape` courants dans SwiftUI, comme `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` et `Ellipse`. Ces formes peuvent non seulement être affichées directement, mais aussi être utilisées avec `clipShape` pour rogner des vues.

Par exemple :

```swift
.clipShape(Circle())
```

signifie rogner la vue en cercle.

Enfin, nous avons utilisé `overlay` et `strokeBorder` pour ajouter aux photos des bordures ayant les formes correspondantes. Il faut noter que `border` dessine généralement une bordure selon la zone rectangulaire de la vue. Si vous voulez que la bordure suive un cercle, une capsule ou une ellipse, il est plus adapté de superposer le même `Shape`.

Grâce à cette leçon, nous avons non seulement réalisé l’effet de mur de photos, mais aussi compris l’association courante de `Shape`, `clipShape`, `strokeBorder` et `overlay` dans une interface.

## Exercices après le cours

### 1. Ajouter un arrière-plan au mur de photos

Ajoutez une image d’arrière-plan plein écran à la page du mur de photos.

Exigence : l’image d’arrière-plan doit pouvoir remplir tout l’écran et ignorer la zone sûre.

### 2. Bordure en dégradé

Transformez les bordures monochromes existantes en bordures avec un dégradé linéaire.

Vous pouvez essayer d’utiliser `LinearGradient` pour créer des effets de bordure plus riches.

### 3. Simuler un cadre photo

Recherchez sur Internet quelques styles de vrais cadres photo, puis essayez d’utiliser `overlay` pour superposer des images de cadre afin que les photos ressemblent davantage à de vrais cadres.

Effet affiché de l’exercice :

![button](../../../Resource/032_view15.jpeg)

### 4. Réaliser une bordure de bouton arrondi

Dans le développement réel, les boutons utilisent souvent des bordures en rectangle arrondi.

Essayez de créer un bouton arrondi, puis utilisez `RoundedRectangle` et `strokeBorder` pour ajouter une bordure arrondie au bouton.

Effet affiché de l’exercice :

![button](../../../Resource/032_view14.png)

### Question de réflexion

Si vous ne voulez pas utiliser une bordure monochrome ni une bordure en dégradé, mais que vous voulez que la bordure présente un certain effet de motif, comment devriez-vous l’implémenter ?

Vous pouvez essayer de rechercher des informations pour comprendre les usages associés à `overlay`, `mask` ou `ImagePaint`.

Effet affiché de l’exercice :

![button](../../../Resource/032_view16.png)
