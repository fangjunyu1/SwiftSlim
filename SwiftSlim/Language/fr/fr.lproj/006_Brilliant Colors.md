# Des couleurs éclatantes

Dans cette leçon, nous allons apprendre plusieurs modificateurs visuels courants de SwiftUI, notamment :

- les couleurs
- la couleur de premier plan
- la couleur d'arrière-plan
- le décalage
- l'opacité
- le flou

Nous découvrirons également la `Safe Area` (zone de sécurité).

Ces modificateurs servent à contrôler l'apparence visuelle des vues afin de rendre l'interface plus claire et plus structurée.

## Couleurs

Dans SwiftUI, on peut définir la couleur du texte.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` représente le bleu. En réalité, il s'agit d'une écriture abrégée de `Color.blue` grâce à l'inférence de type.

Les couleurs courantes comprennent par exemple :

```
.black
.green
.yellow
.pink
.gray
...
```

Ce sont toutes des propriétés statiques de `Color`.

![Color](../../RESOURCE/006_color.png)

On peut considérer `Color` comme un type représentant une couleur, et `.blue`, `.red`, etc. comme ses couleurs concrètes.

### La vue `Color`

Dans SwiftUI, `Color` peut aussi être affiché directement comme une vue.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Ce code génère un carré rouge de `100 × 100`.

On peut aussi faire en sorte que toute l'interface prenne une certaine couleur :

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Après exécution, on remarque que le rouge ne remplit pas complètement l'écran : le haut et le bas de l'iPhone restent blancs. Cela est lié à la présence de la `Safe Area` (zone de sécurité).

## Safe Area (zone de sécurité)

La `Safe Area` est la zone réservée par le système pour éviter que le contenu soit masqué. Elle comprend :

1. la barre d'état en haut (heure, batterie)
2. l'indicateur Home en bas
3. la zone de l'encoche (`notch`) ou de la Dynamic Island

![Color](../../RESOURCE/006_color3.png)

Par défaut, SwiftUI limite le contenu à l'intérieur de cette zone, ce qui empêche la vue de s'étendre jusqu'aux bords de l'écran.

### Ignorer la Safe Area

Si vous souhaitez que la couleur recouvre tout l'écran, vous pouvez utiliser `ignoresSafeArea` :

```swift
Color.red
    .ignoresSafeArea()
```

ou utiliser `edgesIgnoringSafeArea` :

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Ainsi, la vue s'étendra à tout l'écran.

Il faut noter que `edgesIgnoringSafeArea` est l'ancienne écriture. Depuis iOS 14, il est recommandé d'utiliser `ignoresSafeArea`.

## Couleur de premier plan

### Le modificateur `foregroundStyle`

Dans les leçons précédentes, nous avons déjà appris à utiliser `foregroundStyle` pour définir une couleur.

Par exemple :

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` est le nouveau système de style, qui prend en charge les couleurs, les dégradés, les matériaux, etc.

![Color](../../RESOURCE/006_color2.png)

### Le modificateur `foregroundColor`

`foregroundColor` permet aussi de définir une couleur :

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Son usage est le même que celui de `foregroundStyle`.

Dans les dernières versions de Xcode, Xcode peut indiquer que `foregroundColor` pourrait être abandonné dans de futures versions d'iOS. Il est donc conseillé de privilégier `foregroundStyle`.

## Arrière-plan

Si vous voulez ajouter une couleur d'arrière-plan à une vue, vous pouvez utiliser `background` :

```swift
background(.red)
```

Par exemple, pour ajouter une couleur de fond derrière un texte :

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Lorsque nous sélectionnons du texte dans des applications comme Word ou Chrome, nous pouvons voir un effet d'arrière-plan similaire.

![Color](../../RESOURCE/006_color16.png)

Si vous souhaitez agrandir l'arrière-plan, il faut l'associer à `padding` :

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Il faut ici retenir une règle importante :

Dans SwiftUI, les modificateurs construisent la vue de haut en bas. Les modificateurs écrits ensuite s'appliquent au résultat précédent.

Ainsi :

```swift
.padding()
.background()
```

Cela signifie que l'arrière-plan englobe la vue après l'ajout de la marge interne.

Si l'ordre est inversé :

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

L'arrière-plan ne s'agrandira pas, car il n'englobe pas le `padding` écrit ensuite.

## Exemple - un écrou carré à quatre coins

Créons maintenant une vue simple représentant un écrou carré à quatre coins.

![Color](../../RESOURCE/006_color8.png)

Commençons par créer un carré blanc de `50 × 50` :

```swift
Color.white
    .frame(width: 50, height: 50)
```

Si nous voulons le transformer en cercle, nous pouvons utiliser `cornerRadius` :

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Quand le rayon d'arrondi est égal à la moitié de la largeur et de la hauteur, la forme devient circulaire.

Ajoutons maintenant un arrière-plan bleu :

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Le `padding` ajouté agrandit la zone externe, et `background` dessine le bleu sur cette zone externe.

Nous obtenons ainsi l'effet d'un écrou carré à quatre coins.

### Une autre idée

En plus de l'arrière-plan, on peut aussi utiliser `ZStack` pour obtenir le même effet.

Nous avons vu précédemment que `ZStack` permet d'empiler les vues. On peut considérer l'écrou comme la superposition d'un cercle et d'un rectangle.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` empile les vues dans l'ordre, et les vues ajoutées plus tard apparaissent au-dessus.

## Exemple - deux cercles qui se chevauchent

De nombreuses icônes sont composées par superposition de formes simples, par exemple deux cercles qui se chevauchent.

![Color](../../RESOURCE/006_color14.png)

Commençons par créer deux cercles :

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Comme nous voulons superposer les deux cercles, nous utilisons la mise en page `ZStack` :

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

À ce moment-là, les deux cercles de même taille se chevauchent complètement.

Nous voulons qu'ils ne se recouvrent que partiellement, au lieu d'être parfaitement l'un sur l'autre. Pour cela, on peut utiliser `offset` afin de créer un décalage.

## Décalage

`offset` ne modifie que la position de dessin de la vue, sans affecter le calcul de mise en page du parent.

Utilisation :

```swift
.offset(x:y:)
```

`x` correspond au décalage horizontal, et `y` au décalage vertical.

Une valeur positive déplace vers la droite / vers le bas, et une valeur négative vers la gauche / vers le haut.

Utilisons `offset` pour faire se chevaucher partiellement deux cercles :

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

La position du cercle rouge dans la mise en page n'a pas changé, mais sa position de dessin a été déplacée de `25 pt` vers la gauche. Ainsi, les deux cercles donnent l'impression de se chevaucher partiellement.

## Opacité

Dans SwiftUI, `opacity` est utilisé pour définir la transparence d'une vue.

Utilisation de base :

```swift
.opacity(0.5)
```

Le paramètre d'`opacity` varie de `0.0` à `1.0`, où :

- `0` signifie complètement transparent
- `1` signifie opaque

Nous pouvons utiliser `opacity` pour régler la transparence du cercle orange :

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Après avoir défini l'`opacity` du cercle orange à `0.8`, son opacité est de 80 %. Lorsque les deux cercles se chevauchent, la zone superposée produit un effet de mélange de couleurs.

## Flou

Dans SwiftUI, on peut utiliser `blur` pour appliquer un effet de flou :

```swift
.blur(radius:10)
```

`radius` définit le rayon du flou. Plus la valeur est grande, plus l'effet de flou est visible.

Nous pouvons ajouter un effet de flou aux deux cercles :

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Au final, nous voyons deux cercles très flous.

## Résumé

Cette leçon s'est concentrée sur plusieurs modificateurs visuels courants de SwiftUI, en apprenant comment contrôler la couleur, la position et les effets visuels d'une vue à l'aide de modificateurs.

À travers des exemples concrets, nous avons vu le rôle réel de différents modificateurs visuels dans l'interface, tout en découvrant aussi la notion de zone de sécurité.

Ce sont des modificateurs très fondamentaux. Les pratiquer davantage nous aidera à mieux contrôler les effets visuels de l'interface dans le développement réel.

### Exercices après la leçon

- ajouter des effets de transparence et de flou à une image
- créer trois cercles superposés avec des opacités différentes
- créer une image d'arrière-plan qui remplit tout l'écran en ignorant la zone de sécurité
- utiliser `offset` pour ajuster la position de plusieurs vues

L'objectif de ces exercices n'est pas de mémoriser les API, mais d'observer la relation entre les changements visuels et le comportement de la mise en page.
