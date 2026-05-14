# View personnalisée

Dans cette leçon, nous allons apprendre une manière très importante d’écrire du SwiftUI : **la View personnalisée**.

Une View personnalisée peut encapsuler un morceau de code View répété et le transformer en une View réutilisable plusieurs fois.

Dans le développement réel d’une App, nous rencontrons souvent ce type de situation : la structure de nombreuses interfaces est la même, mais le contenu affiché est différent.

Par exemple, dans la liste de publications d’un site de forum, chaque publication peut contenir des informations comme un titre, une image et un nombre de likes.

![Reddit](../../../Resource/028_view1.png)

Dans la liste de produits d’un site de shopping, chaque produit peut contenir des informations comme une image, un nom et un prix.

![Amazon](../../../Resource/028_view2.png)

La structure de ces contenus est similaire ; la différence se trouve seulement dans les données affichées.

Si nous écrivons manuellement le code de chaque élément, le code deviendra très long, et il ne sera pas pratique à modifier par la suite.

Nous pouvons donc encapsuler la structure commune dans une View personnalisée, puis lui transmettre les contenus différents sous forme de paramètres.

Ainsi, la même View peut afficher des contenus différents.

## Scénario de besoin

Par exemple, nous voulons maintenant créer une liste de réglages.

Résultat affiché :

![view](../../../Resource/028_view.png)

Dans cette liste de réglages, il y a trois éléments de réglage différents : `Réglages`, `Dossier`, `Musique`.

Même si leurs icônes, leurs couleurs et leurs titres sont différents, leur structure générale est la même :

- Icône à gauche
- Couleur d’arrière-plan de l’icône
- Titre au centre
- Flèche à droite

Si nous n’utilisons pas de View personnalisée, nous pourrions écrire ainsi :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "gear")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .cornerRadius(10)

                Text("Réglages")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "folder")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.brown)
                    .cornerRadius(10)

                Text("Dossier")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }

            Divider()

            HStack(spacing: 10) {
                Image(systemName: "music.note")
                    .foregroundStyle(Color.white)
                    .frame(width: 32, height: 32)
                    .background(Color.purple)
                    .cornerRadius(10)

                Text("Musique")
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}
```

Ce code peut s’afficher normalement, mais le problème est aussi très évident : le code des trois éléments de réglage est presque entièrement identique.

Les seules différences sont l’icône, la couleur et le titre :

```swift
Image(systemName: "gear")
.background(Color.blue)
Text("Réglages")
```

```swift
Image(systemName: "folder")
.background(Color.brown)
Text("Dossier")
```

```swift
Image(systemName: "music.note")
.background(Color.purple)
Text("Musique")
```

Autrement dit, la structure de chaque élément de réglage est fixe ; seules l’icône, la couleur et le titre changent.

Cette situation est donc très adaptée à l’utilisation d’une View personnalisée.

### Ombre shadow

Ici, nous utilisons un nouveau modifier, `.shadow(radius:)` :

```swift
.shadow(radius: 1)
```

`.shadow(radius:)` permet d’ajouter une ombre à une View.

`radius` indique le rayon de flou de l’ombre. Plus la valeur est grande, plus la zone de diffusion de l’ombre est généralement large, et plus l’ombre paraît douce.

Ici, il est défini sur `1`, ce qui signifie que nous ajoutons seulement un effet d’ombre très léger.

## Encapsuler la View de l’élément de réglage

Ensuite, nous encapsulons chaque élément de réglage dans une nouvelle View.

Nous pouvons créer une `SettingItemView` :

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Dans cette View, nous définissons trois propriétés :

```swift
let icon: String
let color: Color
let title: String
```

Parmi elles :

- `icon` représente le nom de l’icône
- `color` représente la couleur d’arrière-plan de l’icône
- `title` représente le titre de l’élément de réglage

Comme ces trois contenus sont différents dans différents éléments de réglage, nous les transformons en paramètres pouvant être transmis depuis l’extérieur.

## Utiliser une View personnalisée

Une fois `SettingItemView` créée, nous n’avons plus besoin d’écrire plusieurs fois un grand bloc de code `HStack`.

Nous pouvons maintenant l’utiliser ainsi :

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")
```

Cette ligne de code signifie que nous créons une View d’élément de réglage et que nous transmettons trois paramètres :

```swift
icon: "gear"
color: Color.blue
title: "Réglages"
```

Après la transmission, les propriétés à l’intérieur de `SettingItemView` reçoivent les valeurs correspondantes :

- la valeur de `icon` est `gear`
- la valeur de `color` est `Color.blue`
- la valeur de `title` est `"Réglages"`

Ainsi, dans la View, `Image(systemName: icon)` affiche l’icône d’engrenage, `.background(color)` utilise un arrière-plan bleu, et `Text(title)` affiche `Réglages`.

Code complet :

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")

            Divider()

            SettingItemView(icon: "folder", color: Color.brown, title: "Dossier")

            Divider()

            SettingItemView(icon: "music.note", color: Color.purple, title: "Musique")
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(20)
    }
}

struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Résultat affiché :

![view](../../../Resource/028_view.png)

On peut voir qu’après l’encapsulation, le résultat affiché reste identique à celui d’avant, mais le code est devenu plus clair.

Auparavant, chaque élément de réglage devait écrire tout un bloc `HStack`; maintenant, une seule ligne de code suffit :

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")
```

C’est le rôle d’une View personnalisée : **encapsuler une structure View répétée et transmettre uniquement le contenu différent sous forme de paramètres.**

## Pourquoi peut-on transmettre des paramètres

Ensuite, comprenons simplement pourquoi une View personnalisée peut recevoir des paramètres.

Dans SwiftUI, une View est essentiellement une structure.

Par exemple :

```swift
struct ContentView: View {
    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

Ici, `ContentView` est une structure.

Lorsque nous écrivons :

```swift
ContentView()
```

nous créons en réalité une View `ContentView`.

Les `()` à la fin indiquent l’appel de sa méthode d’initialisation ; on peut aussi comprendre cela comme la création de cette View.

Comme ce `ContentView` n’a aucune propriété à transmettre depuis l’extérieur, nous pouvons écrire directement :

```swift
ContentView()
```

Mais si une View contient une propriété sans valeur, il faut transmettre la valeur correspondante lors de la création de la View.

Par exemple :

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nom : \(name)")
    }
}
```

Ici, `name` est une propriété, et elle n’a pas de valeur par défaut.

Donc, lors de la création de `ContentView`, nous devons donner une valeur concrète à `name` :

```swift
ContentView(name: "Fang Junyu")
```

Ainsi, la View peut utiliser cette valeur en interne :

```swift
Text("nom : \(name)")
```

C’est aussi la raison pour laquelle nous devons transmettre des paramètres lors de la création de `SettingItemView` :

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")
```

Car `SettingItemView` possède trois propriétés sans valeur par défaut :

```swift
let icon: String
let color: Color
let title: String
```

Ainsi, lors de la création de cette View, nous devons les transmettre. Les paramètres transmis seront utilisés par Swift pour attribuer des valeurs aux propriétés internes de la View.

## Méthode d’initialisation

Ensuite, comprenons un peu plus profondément la méthode d’initialisation.

### Méthode d’initialisation par défaut

Lorsque nous définissons une View ordinaire :

```swift
struct ContentView: View {
    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

Dans ce code, nous n’avons pas écrit manuellement de méthode d’initialisation.

Mais lorsque nous utilisons cette View, nous pouvons écrire ainsi :

```swift
ContentView()
```

Ici, `()` signifie en réalité créer `ContentView` ; on peut aussi le comprendre comme l’appel de sa méthode d’initialisation.

### Pourquoi peut-on l’appeler même si aucune méthode d’initialisation n’est visible ?

Parce que le compilateur Swift génère automatiquement une méthode d’initialisation pour nous.

Il faut remarquer que : **cette méthode d’initialisation est générée automatiquement, et nous ne la voyons généralement pas directement dans le code.**

Autrement dit, même si nous n’avons pas écrit manuellement ceci dans `struct` :

```swift
init() {

}
```

le compilateur Swift génère en arrière-plan une méthode d’initialisation à peu près comme celle-ci :

```swift
struct ContentView: View {
    init() {

    }

    var body: some View {
        Text("Bonjour, le monde !")
    }
}
```

C’est pourquoi nous pouvons écrire directement :

```swift
ContentView()
```

Donc, dans le code réel, il n’est généralement pas nécessaire d’écrire manuellement la méthode d’initialisation.

Il suffit de comprendre un point : **lorsqu’une SwiftUI View est créée, la méthode d’initialisation de cette View est appelée. Même si nous n’écrivons pas manuellement cette méthode, Swift peut la générer automatiquement.**

### Méthode d’initialisation avec paramètres

Si une View contient une propriété sans valeur par défaut, par exemple :

```swift
struct ContentView: View {
    let name: String

    var body: some View {
        Text("nom : \(name)")
    }
}
```

le compilateur Swift génère automatiquement, à partir de la propriété, une méthode d’initialisation avec paramètre.

On peut simplement la comprendre ainsi :

```swift
init(name: String) {
    self.name = name
}
```

Ici :

```swift
init(name: String)
```

signifie que, lors de la création de `ContentView`, il faut transmettre un paramètre `name` de type `String`.

Lorsque nous écrivons :

```swift
ContentView(name: "Fang Junyu")
```

cela signifie : transmettre `"Fang Junyu"` comme paramètre à la méthode d’initialisation.

Ensuite, à l’intérieur de la méthode d’initialisation, ceci sera exécuté :

```swift
self.name = name
```

Cette ligne de code signifie : attribuer le `name` transmis depuis l’extérieur à la propriété `name` de la View actuelle.

On peut simplement le comprendre ainsi :

```swift
struct ContentView: View {
    let name: String    // "Fang Junyu"

    var body: some View {
        Text("nom : \(name)")   // "Fang Junyu"
    }
}

ContentView(name: "Fang Junyu")
```

Ainsi, la View peut utiliser en interne la valeur transmise.

C’est le processus d’initialisation d’une View avec paramètres : **lorsqu’une propriété dans la View n’a pas de valeur par défaut, il faut transmettre le paramètre correspondant lors de la création de la View, afin que la méthode d’initialisation termine l’attribution de la valeur à la propriété.**

## Cas où une propriété possède une valeur par défaut

Si une propriété possède déjà une valeur par défaut, il n’est pas nécessaire de transmettre un paramètre lors de la création de la View.

Par exemple :

```swift
struct ContentView: View {
    var name: String = "Fang Junyu"

    var body: some View {
        Text("nom : \(name)")
    }
}
```

Ici, `name` possède déjà une valeur par défaut :

```swift
"Fang Junyu"
```

Donc, lors de la création de `ContentView`, nous pouvons écrire directement :

```swift
ContentView()
```

À ce moment-là, `name` utilise la valeur par défaut, et l’interface affiche :

```swift
nom : Fang Junyu
```

Bien sûr, nous pouvons aussi transmettre une nouvelle valeur lors de la création de la View :

```swift
ContentView(name: "Sam")
```

À ce moment-là, la View utilise `"Sam"` transmis depuis l’extérieur au lieu de la valeur par défaut, et l’interface affiche :

```swift
nom : Sam
```

Pour faciliter la compréhension, on peut considérer simplement que la méthode d’initialisation générée automatiquement par le compilateur Swift ressemble à ceci :

```swift
init(name: String = "Fang Junyu") {
    self.name = name
}
```

Ici, `name: String = "Fang Junyu"` signifie : si aucun `name` n’est transmis lors de la création de la View, utiliser la valeur par défaut `"Fang Junyu"` ; si un nouveau `name` est transmis lors de la création de la View, utiliser la valeur transmise.

Autrement dit : **si aucun paramètre n’est transmis depuis l’extérieur, la valeur par défaut de la propriété est utilisée ; si un paramètre est transmis depuis l’extérieur, la valeur transmise est utilisée.**

## Retour à SettingItemView

Revenons maintenant à SettingItemView :

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

La structure de cette View est fixe.

Les parties fixes incluent :

```swift
HStack(spacing: 10)
Spacer()
Image(systemName: "chevron.right")
```

Les parties différentes incluent :

```swift
icon
color
title
```

Nous transformons donc le contenu différent en propriétés, puis nous les transmettons comme paramètres lors de la création de la View.

Lorsque nous créons différents éléments de réglage, il suffit de transmettre différents paramètres :

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")
SettingItemView(icon: "folder", color: Color.brown, title: "Dossier")
SettingItemView(icon: "music.note", color: Color.purple, title: "Musique")
```

Ainsi, le même `SettingItemView` peut afficher trois éléments de réglage différents.

C’est la manière la plus courante d’utiliser une View personnalisée.

## Résumé

Dans cette leçon, nous avons appris la View personnalisée.

Le rôle principal d’une View personnalisée est : **encapsuler le code View répété afin de pouvoir le réutiliser.**

Dans cet exemple, la structure des trois éléments de réglage est la même ; seules l’icône, la couleur et le titre sont différents.

Nous avons donc créé une `SettingItemView` :

```swift
struct SettingItemView: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(Color.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(10)

            Text(title)
                .fontWeight(.bold)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray)
        }
    }
}
```

Ensuite, lorsque nous utilisons cette View, nous transmettons différents paramètres :

```swift
SettingItemView(icon: "gear", color: Color.blue, title: "Réglages")
```

Les paramètres ici entrent dans `SettingItemView`.

Avec cette méthode, nous pouvons utiliser moins de code pour créer des Views ayant la même structure, mais des contenus différents.

C’est aussi une manière d’écrire très courante dans le développement SwiftUI.
