# Construire une page de CV personnel

Dans cette leçon, nous allons créer une vue simple de CV personnel et apprendre les notions suivantes :

- `cornerRadius`
- `spacing`
- `ScrollView`

Pendant la construction, nous réviserons aussi la mise en page, `Text` et `Image`, puis nous mettrons en place le contrôle des espacements et l'effet de défilement du contenu.

## CV personnel

Résultat visé :

![Swift](../../RESOURCE/004_img.png)

**Essayez d'abord de le réaliser par vous-même avant de continuer la lecture de l'explication ci-dessous.**

### Créer le projet

Créez un nouveau projet iOS, ou continuez à utiliser celui d'avant.

Code `ContentView` par défaut :

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
    }
}
```

Videz maintenant le code et commencez à écrire votre propre contenu :

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Structure générale

En développement réel, nous commençons généralement par concevoir la structure d'ensemble.

Notre page contient :

1. un titre
2. des informations personnelles
3. une présentation personnelle

Ajoutons d'abord un `VStack` tout à l'extérieur :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` permet de garantir un tri vertical des vues, tout en contrôlant leur ordre et leur espacement.

### Titre

Commençons par créer un `Text` pour afficher le titre.

Ici, j'utilise mon nom en anglais comme titre :

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

En général, le titre est plus grand et en gras. Ici, nous utilisons les modificateurs `font` et `fontWeight` :

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Mise en page

L'alignement par défaut de SwiftUI est `center`, donc le titre apparaît maintenant au milieu de `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Nous voulons afficher le titre en haut de la vue. Nous pouvons utiliser `Spacer` pour ajuster la disposition :

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` occupe l'espace restant et pousse `Text` vers le haut du conteneur.

![Swift](../../RESOURCE/004_img4.png)

### Espace vide

Si vous trouvez que le texte est trop proche du haut, vous pouvez utiliser `padding` ou `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Cela définit la marge supérieure du `VStack` à `20`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Vous pouvez aussi utiliser `Spacer` avec une hauteur définie via `frame` afin d'obtenir un espace vide d'une hauteur précise.

Résultat :

![Swift](../../RESOURCE/004_img5.png)

### Image

Préparez une photo de portrait et placez-la dans le dossier de ressources `Assets`.

![Swift](../../RESOURCE/004_img6.png)

Affichez ensuite l'image dans `ContentView` avec `Image` :

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Comme l'image d'origine est assez grande, nous devons utiliser `frame` pour contrôler sa taille d'affichage.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

À ce moment-là, on remarque un problème :

si le ratio largeur/hauteur de `frame` ne correspond pas aux proportions d'origine de l'image, l'image est déformée.

Par exemple :

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Pour éviter cette déformation, nous devons utiliser `scaledToFit` :

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` permet :

de redimensionner l'image selon ses proportions d'origine à l'intérieur du `frame` donné, tout en affichant l'image en entier.

Il n'étire pas l'image de force pour remplir tout le `frame`, mais conserve son ratio largeur/hauteur et la redimensionne proportionnellement jusqu'à ce qu'un côté touche exactement la limite.

Cela signifie :

- si la largeur du `frame` est plus petite, l'image sera redimensionnée en prenant la largeur comme référence ;
- si la hauteur du `frame` est plus petite, l'image sera redimensionnée en prenant la hauteur comme référence ;
- l'image garde toujours ses proportions d'origine et ne se déforme pas.

En général, il suffit souvent de définir la taille dans une seule direction. Par exemple :

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Le système calculera alors automatiquement la hauteur appropriée à partir de la largeur `140`, tout en conservant les proportions de l'image.

Si vous devez fixer le ratio visuel ou éviter que l'image soit compressée dans une mise en page complexe, vous pouvez aussi contraindre à la fois largeur et hauteur.

### Coins arrondis

Si vous voulez afficher l'image avec des coins arrondis, vous pouvez utiliser le modificateur `cornerRadius` :

```swift
.cornerRadius(10)
```

Par exemple :

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

On ajoute ici `cornerRadius(20)` après les modificateurs de `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` signifie que l'on découpe les bords de la vue en appliquant un rayon d'arrondi de `20`.

Après l'ajout des coins arrondis, les quatre coins de l'image deviennent incurvés, ce qui donne un rendu plus doux et plus moderne.

Ce style est très courant dans les interfaces actuelles. Par exemple, les icônes d'app iOS utilisent aussi une forme à coins arrondis, même si les icônes système emploient une superellipse à courbure continue plutôt qu'un simple arrondi.

### Informations personnelles

Nous allons maintenant réaliser la zone d'informations personnelles située à gauche de l'image. En observant la structure de l'interface, on voit que ces informations et l'image sont disposées horizontalement, il faut donc utiliser `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Le contenu des informations personnelles, lui, est disposé verticalement.

![Swift](../../RESOURCE/004_img11.png)

Nous utilisons donc `HStack` à l'extérieur, `VStack` pour les informations personnelles, et `Text` pour les contenus textuels.

Structure de base :

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Mettre en gras les intitulés**

Pour distinguer le nom du champ et sa valeur, on peut appliquer `fontWeight` aux intitulés :

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Aligner le texte à gauche**

`VStack` est centré par défaut. Si vous voulez aligner tout le texte à gauche, il faut définir l'alignement :

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` signifie un alignement sur la gauche dans un environnement de lecture de gauche à droite.

![Swift](../../RESOURCE/004_img14.png)

### Espacement

Si vous souhaitez conserver un espacement fixe entre les informations personnelles et l'image, nous avons déjà appris à utiliser `Spacer` pour créer du vide :

```swift
Spacer()
    .frame(width: 10)
```

On peut aussi utiliser le paramètre `spacing` de `HStack` :

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` signifie qu'il y a `30 pt` d'espace entre les deux vues enfants.

![Swift](../../RESOURCE/004_img15.png)

**Qu'est-ce que `spacing` ?**

Dans `VStack`, `HStack` et `ZStack`, `spacing` permet de contrôler la distance entre les vues enfants.

Par exemple :

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

L'espacement entre les vues enfants du `VStack` sera défini à `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Il faut noter que `spacing` n'agit que sur les "vues enfants directes" et n'affecte pas la disposition à l'intérieur des conteneurs imbriqués.

**Contrôler l'espacement à l'intérieur d'une liste**

Si vous voulez augmenter l'espacement entre les champs, la solution la plus directe consiste à définir `spacing` sur le `VStack` :

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Ainsi, l'espacement entre toutes les vues enfants devient `10 pt`.

Mais si l'on observe l'interface, on remarque un problème :

il y a de l'espace entre les groupes de champs, mais aussi le même espace entre le nom du champ et sa valeur.

Cela s'explique par le fait que `spacing` s'applique à toutes les vues enfants directes du conteneur courant.

Dans cette structure, chaque `Text` est une vue enfant directe du `VStack` extérieur, donc l'espacement est uniforme.

Si vous souhaitez avoir un espace entre les groupes de champs, tout en gardant un espacement compact par défaut entre le nom du champ et sa valeur, vous pouvez considérer "nom du champ + valeur du champ" comme un ensemble logique, et l'envelopper dans un `VStack` distinct :

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

La structure devient alors : espacement entre les `VStack` du niveau extérieur, mais espacement compact par défaut à l'intérieur des `VStack` internes. Ainsi, aucun espace inutile n'apparaît entre le nom du champ et sa valeur.

![Swift](../../RESOURCE/004_img18.png)

### Présentation personnelle

Passons maintenant à la zone de présentation personnelle.

D'après la structure de l'interface, le contenu de présentation est composé de plusieurs lignes de texte disposées verticalement.

![Swift](../../RESOURCE/004_img19.png)

Nous pouvons donc utiliser `VStack` avec `Text` :

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Ajouter de l'espacement**

À ce stade, la zone d'informations personnelles et celle de présentation sont assez serrées, et le rendu n'est pas très agréable.

![Swift](../../RESOURCE/004_img20.png)

Comme elles se trouvent dans le même conteneur extérieur, nous pouvons contrôler l'espacement global au niveau de ce conteneur :

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Résultat :

![Swift](../../RESOURCE/004_img21.png)

**Espacement dans la liste**

Utilisez `spacing` pour régler l'espacement entre les lignes de présentation personnelle :

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Terminer le CV personnel

À présent, la structure de base de notre CV personnel est terminée.

![Swift](../../RESOURCE/004_img.png)

### Vue défilante

Actuellement, la structure de la page utilise `VStack`, ce qui fonctionne bien quand il y a peu de texte. Mais si vous augmentez le nombre de lignes à 20, 30 ou plus, la hauteur du contenu dépassera celle de l'écran.

Par exemple :

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Deux phénomènes apparaissent alors :

- le contenu du bas est coupé
- la page ne peut pas défiler

Ce n'est pas un problème de `VStack`. `VStack` n'est qu'un conteneur de mise en page ; il ne fournit pas automatiquement la capacité de défilement.

**Qu'est-ce que `ScrollView`**

`ScrollView` est un conteneur défilant, adapté aux contenus volumineux qui dépassent la taille de l'écran, par exemple des listes verticales ou horizontales.

Structure de base :

```swift
ScrollView {
    ...
}
```

Si vous voulez obtenir un effet de défilement, il faut envelopper tout le contenu de la page dans `ScrollView` :

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Ainsi, toute la page devient une zone défilante. Quand le contenu dépasse la hauteur de l'écran, on peut faire défiler naturellement.

Par défaut, `ScrollView` affiche un indicateur de défilement. Si vous voulez le masquer, vous pouvez écrire :

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Code complet

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```
