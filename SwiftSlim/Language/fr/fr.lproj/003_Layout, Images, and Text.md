# Disposition, images et texte

Dans la leçon précédente, nous avons étudié le code `ContentView` :

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Dans cette leçon, nous allons apprendre le mécanisme de disposition par défaut de SwiftUI, ainsi que la manière d'utiliser les images et le texte. En nous appuyant sur la leçon précédente, nous comprendrons plus en profondeur la structure des vues et leur mode d'affichage. Ces connaissances nous permettront de construire des interfaces de base.

## Le mécanisme de disposition par défaut de SwiftUI

Quand on prévisualise la vue `ContentView`, on remarque que l'icône et le texte sont centrés, au lieu d'être alignés depuis le haut.

![Swift](../../RESOURCE/003_view.png)

Par défaut, l'alignement du conteneur `Stack` est `.center`, donc les vues internes apparaissent généralement centrées.

### `Alignment` : le mode d'alignement

Il est évident que le centrage n'est qu'un type d'alignement parmi d'autres. Si nous voulons un alignement à gauche ou à droite, nous devons utiliser `alignment` pour contrôler l'alignement de la vue.

```swift
alignment
```

Dans SwiftUI, l'alignement apparaît généralement dans deux scénarios :

**1. Le paramètre d'alignement d'un conteneur `Stack`**

Par exemple, pour aligner à gauche l'icône et le texte dans `ContentView` :

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

L'`alignment` de `VStack` contrôle l'alignement dans le sens horizontal.

Modes d'alignement :

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` effectue un tri horizontal ; `alignment` y contrôle donc l'alignement vertical :

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` superpose les vues ; `alignment` peut donc y contrôler aussi bien l'alignement horizontal que vertical :

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Si `alignment` n'est pas spécifié explicitement, `VStack`, `HStack` et `ZStack` utilisent `.center` par défaut.

**2. L'alignement interne d'un `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Quand la taille fournie par `frame` est supérieure à la taille propre de la vue, `alignment` détermine la position de la vue à l'intérieur de ce `frame`. L'usage détaillé de `frame` sera expliqué plus tard ; ici, il suffit d'en avoir une première idée.

### `Spacer` et la répartition de l'espace

`alignment` permet d'ordonner les vues horizontalement ou verticalement. Mais lorsque nous voulons, par exemple, afficher du texte et une image aux deux extrémités, un simple alignement ne suffit plus.

Par exemple, si nous voulons reproduire la vue d'en-tête du site [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), avec le logo NHK à gauche et l'icône du menu à droite :

![Swift](../../RESOURCE/003_alignment3.png)

Si nous utilisons uniquement `alignment`, le logo NHK et l'icône du menu resteront du même côté. Il est donc impossible de les répartir à gauche et à droite ; c'est pourquoi nous avons besoin de `Spacer` pour distribuer l'espace restant.

`Spacer` est une vue flexible dédiée à la mise en page, capable de remplir automatiquement l'espace disponible.

Utilisation :

```swift
Spacer()
```

Par exemple :

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Quand nous ajoutons `Spacer` entre `Image` et `Text`, il remplit l'espace restant et pousse l'image et le texte vers les extrémités haute et basse.

![Swift](../../RESOURCE/003_view1.png)

S'il y a plusieurs `Spacer` :

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

L'espace restant sera réparti équitablement entre eux.

![Swift](../../RESOURCE/003_spacer.png)

## Affichage d'`Image` et contrôle de la taille

La vue `Image` sert principalement à afficher des images. Les icônes `SF Symbols` apprises dans la leçon précédente ne sont qu'un des usages possibles de `Image`.

Utilisation :

```swift
Image("imageName")
```

Le texte entre guillemets correspond au nom de l'image ; il n'est pas nécessaire d'écrire l'extension du fichier.

### Afficher une image

Commençons par préparer une image.

![Swift](../../RESOURCE/003_img.jpg)

Dans Xcode, sélectionnez le dossier de ressources `Assets` puis glissez-y l'image.

![Swift](../../RESOURCE/003_img1.png)

Dans `ContentView`, utilisez `Image` pour afficher l'image :

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Remarque : `Image` dans SwiftUI ne prend pas en charge la lecture des animations GIF ; elle n'affiche qu'une image statique.

### Contrôler la taille de l'image

Dans SwiftUI, `Image` s'affiche par défaut avec la taille d'origine de l'image. Si vous voulez modifier la taille affichée, il faut d'abord rendre l'image redimensionnable avec `resizable`, puis utiliser `frame` pour définir sa taille dans la mise en page.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Le modificateur `resizable`

Le modificateur `resizable` permet à l'image de participer au redimensionnement dans la mise en page, au lieu de garder systématiquement sa taille d'origine.

```swift
.resizable()
```

Ce n'est qu'après avoir ajouté `resizable()` que `frame` peut réellement changer la taille visible de l'image.

Si vous omettez `resizable` :

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` ne fournira qu'un espace de mise en page, mais la taille propre de l'image ne changera pas.

### Le modificateur `frame`

`frame(width:height)` sert à définir la largeur et la hauteur d'une vue.

Utilisation de base :

```swift
.frame(width: 10,height: 10)
```

Par exemple, pour définir l'image avec une largeur de `300` et une hauteur de `100` :

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

On peut aussi définir séparément la largeur ou la hauteur :

```swift
.frame(width: 200)
.frame(height: 100)
```

La combinaison `resizable + frame` permet de contrôler avec souplesse la taille d'affichage d'une image dans l'interface, tout en gardant la possibilité de la redimensionner.

### Proportion d'échelle : `scaledToFit` et `scaledToFill`

Lorsque le ratio largeur/hauteur défini dans `frame` ne correspond pas à celui de l'image, celle-ci peut être étirée et déformée.

Si nous voulons conserver les proportions de l'image tout en l'adaptant à l'espace disponible, nous pouvons utiliser `scaledToFit` ou `scaledToFill`.

**`scaledToFit`**

`scaledToFit` conserve le ratio largeur/hauteur d'origine et redimensionne l'image pour qu'elle s'adapte entièrement à l'espace disponible, sans recadrage :

```swift
.scaledToFit()
```

ou

```swift
.aspectRatio(contentMode: .fit)
```

Cette méthode convient aux cas où l'on souhaite afficher l'image en entier sans la déformer.

Si toutes les images sont forcées à la même largeur et hauteur, elles risquent forcément d'être étirées.

Par exemple :

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Sans réglage du mode d'échelle, l'image ne peut pas conserver ses dimensions d'origine.

![Swift](../../RESOURCE/003_img4.png)

En appliquant `scaledToFit`, l'image garde ses proportions d'origine.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` conserve aussi les proportions de l'image, mais remplit tout l'espace disponible. Si les proportions ne correspondent pas, la partie en trop sera recadrée :

```swift
.scaledToFill()
```

ou

```swift
.aspectRatio(contentMode: .fill)
```

Cette méthode convient aux cas où l'on souhaite que l'image couvre toute la zone, comme une image de fond ou une bannière. Elle est particulièrement adaptée aux images utilisées en arrière-plan.

**Différence entre les deux**

![Swift](../../RESOURCE/003_img6.png)

## Texte

Dans SwiftUI, `Text` sert à afficher du texte.

Utilisation de base :

```swift
Text("FangJunyu")
```

Nous avons déjà utilisé `Text` dans la leçon précédente. Dans cette leçon, nous allons aller un peu plus loin pour apprendre à contrôler la taille et l'épaisseur de la police afin de rendre le texte plus expressif dans une vue.

### Taille de police

Le modificateur `font` permet de contrôler la taille du texte :

```swift
.font(.title)
```

Par exemple :

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Tailles de police courantes (de la plus grande à la plus petite) :

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Graisse de la police

Si vous voulez mettre le texte en gras, vous pouvez utiliser le modificateur `fontWeight` :

```swift
.fontWeight(.bold)
```

Par exemple :

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Graisses courantes de police (de la plus fine à la plus épaisse) :

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` contrôle la taille de la police, `fontWeight` contrôle son épaisseur. Les deux peuvent être combinés pour enrichir l'expressivité du texte.

## Résumé et mise en pratique

Jusqu'ici, nous avons appris les bases de SwiftUI concernant la mise en page par défaut, `Spacer`, `Image` et `Text`. Ces connaissances suffisent déjà pour développer quelques vues simples.

Par exemple : [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

L'interface de Google est très épurée. Elle contient des images et du texte, et nous pouvons essayer de l'analyser du point de vue de SwiftUI :

1. L'ensemble se divise en trois parties : le logo Google, la zone de recherche et le texte d'indication. On peut utiliser `VStack` pour les empiler verticalement.
2. Le logo Google est une image, que l'on peut afficher avec `Image`.
3. La zone de recherche contient un champ de saisie et une icône. Si l'on ignore le champ de saisie pour le moment, on peut utiliser `Image` pour afficher l'icône de recherche.
4. Le texte d'aide peut être affiché avec `Text`. Sa disposition horizontale peut être réalisée avec `HStack`, et sa couleur avec `foregroundStyle`.

En pratiquant ces notions, nous pouvons créer quelques vues simples et approfondir notre compréhension de `Image`, `Text` et de leurs modificateurs.
