# Carte de cours

Cette leçon est une leçon de révision par étape. Nous allons réaliser une « carte de cours ».

Grâce à cet exercice, nous pouvons revoir `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` et d’autres contenus appris précédemment, et apprendre à combiner plusieurs petites vues en un module de vue complet.

Résultat de la carte de cours :

![view](../../../Resource/026_view.png)

Cette carte de cours contient principalement plusieurs parties :

- Niveau du cours : `Débutant`
- Contenu du cours : `20+ leçons`
- Titre du cours : `Tutoriel SwiftUI débutant`
- Description du cours
- Bouton : `Commencer`
- Arrière-plan du cours : icône Swift et arrière-plan indigo

Nous pouvons réaliser cette vue dans `ContentView`.

## Zone supérieure

Commençons par créer la zone supérieure de la carte de cours.

![view](../../../Resource/026_view1.png)

La partie gauche de la zone supérieure affiche le niveau du cours, et la partie droite affiche le contenu du cours.

Comme ces deux contenus sont disposés horizontalement, nous pouvons utiliser `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Débutant")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ leçons")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Ici, nous avons séparé la zone supérieure dans une propriété calculée :

```swift
var topView: some View
```

L’avantage est de rendre `body` plus clair.

La zone supérieure utilise principalement les éléments suivants :

- `HStack` : dispose deux textes horizontalement.
- `Text` : affiche du contenu textuel.
- `Spacer()` : pousse le texte de gauche vers la gauche et le texte de droite vers la droite.
- `.font(.footnote)` : définit un style de texte plus petit.
- `.fontWeight(.bold)` : met le texte en gras.
- `.foregroundStyle(Color.white)` : définit la couleur de premier plan en blanc.
- `.padding(.vertical, 10)` : définit l’espace intérieur vertical.
- `.padding(.horizontal, 16)` : définit l’espace intérieur horizontal.
- `.background(Color.white.opacity(0.15))` : définit un arrière-plan blanc translucide.
- `.cornerRadius(20)` : définit le rayon des coins.

Ici, `Débutant` utilise `.padding()` dans deux directions :

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Cela ajoute de l’espace au texte verticalement et horizontalement, ce qui le fait davantage ressembler à une étiquette.

`Color.white.opacity(0.15)` représente un blanc avec une opacité de `15%`, c’est-à-dire un blanc très léger.

### Ajouter l’arrière-plan de la carte

Précédemment, nous avons créé `topView`, mais le simple fait de créer une vue ne l’affiche pas automatiquement.

Dans SwiftUI, le contenu réellement affiché à l’écran doit être écrit dans `body`.

Nous pouvons donc d’abord placer `topView` dans `body` pour l’afficher :

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

À ce moment-là, vous verrez que la zone supérieure est déjà affichée :

![view](../../../Resource/026_view2.png)

Cependant, comme le texte de `topView` est blanc et que l’arrière-plan par défaut est également clair, il peut être difficile à voir clairement en mode clair.

Par conséquent, nous pouvons ajouter un `VStack` à l’extérieur, puis définir un espace intérieur, une couleur d’arrière-plan et un rayon de coins pour toute la zone :

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Résultat affiché :

![view](../../../Resource/026_view3.png)

Le `VStack` ici ne contient actuellement qu’un seul `topView`, il peut donc sembler inutile.

Mais ensuite, nous continuerons à ajouter le titre du cours, la description du cours et la zone du bouton. Tous ces contenus sont disposés verticalement, donc utiliser `VStack` ici à l’avance facilitera la combinaison des vues par la suite.

Il y a ici deux modificateurs `.padding()`, et leurs rôles sont différents.

Le premier `.padding(20)` est écrit avant `.background()` :

```swift
.padding(20)
.background(Color.indigo)
```

Il contrôle l’espace intérieur de la carte, c’est-à-dire la distance entre le contenu et le bord de l’arrière-plan.

Le second `.padding(30)` est écrit après `.background()` :

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Il contrôle l’espace extérieur de la carte, c’est-à-dire la distance entre toute la carte et le bord de l’écran.

![view](../../../Resource/026_view4.png)

Ainsi, même s’il s’agit dans les deux cas de `.padding()`, les placer à des positions différentes produit des effets différents.

## Zone de contenu

Ensuite, créons la zone de contenu de la carte de cours.

Résultat affiché :

![view](../../../Resource/026_view5.png)

La zone de contenu contient le titre du cours et la description du cours. Ils sont disposés verticalement, donc nous utilisons `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Tutoriel SwiftUI débutant")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Partez de zéro avec SwiftUI et apprenez systématiquement le développement déclaratif d’interfaces d’Apple. Grâce à des explications claires et des exemples pratiques, vous maîtriserez progressivement la mise en page, les interactions et la gestion de l’état pour créer de belles interfaces utiles.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Résultat affiché :

![view](../../../Resource/026_view6.png)

Deux paramètres sont utilisés dans ce `VStack` :

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` signifie que les vues à l’intérieur du `VStack` sont alignées sur le bord de début.

`spacing: 10` signifie que les vues à l’intérieur du `VStack` conservent un espacement de `10 pt` entre elles.

Ainsi, le titre du cours et la description du cours commencent depuis le côté gauche et conservent une certaine distance entre eux.

La description du cours est relativement longue. Si elle est entièrement affichée, la carte deviendra très haute. Nous utilisons donc ici `.lineLimit()` pour limiter le nombre de lignes affichées :

```swift
.lineLimit(3)
```

Cela signifie qu’au maximum `3` lignes seront affichées. Lorsque le contenu dépasse cette limite, la partie en trop sera omise.

### Aligner la vue à gauche

Il faut encore noter un point ici.

`VStack(alignment: .leading)` ne peut contrôler que l’alignement des vues à l’intérieur du `VStack`. Il ne contrôle pas directement la position du `VStack` lui-même dans le conteneur externe.

Par exemple, si la description du cours est relativement courte :

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tutoriel SwiftUI débutant")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Juste du contenu.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Résultat affiché :

![view](../../../Resource/026_view7.png)

On peut voir que, même si le titre du cours et la description du cours sont alignés à gauche à l’intérieur du `VStack`, le `VStack` entier n’est pas collé au bord gauche de la carte.

C’est parce que lorsque le contenu est court, la largeur du `VStack` devient aussi relativement étroite. Lorsque le conteneur extérieur effectue la mise en page, il peut placer ce `VStack` plus étroit au centre.

On peut le comprendre ainsi : `VStack(alignment: .leading)` est responsable de l’alignement interne à gauche.
Mais il n’est pas responsable de pousser toute la zone de contenu complètement vers la gauche.

Si nous voulons que toute la zone de contenu soit réellement alignée à gauche, nous pouvons l’envelopper dans un autre `HStack` et ajouter `Spacer()` :

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tutoriel SwiftUI débutant")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Juste du contenu.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Résultat affiché :

![view](../../../Resource/026_view8.png)

Le `HStack` ici est une disposition horizontale.

`Spacer()` occupe l’espace restant à droite, ce qui pousse le `VStack` de gauche complètement vers la gauche.

Par conséquent, `HStack + Spacer()` peut être utilisé pour contrôler la position de toute la zone de contenu.

Dans la carte de cours réelle, la description du cours est relativement longue et occupe généralement plus de largeur, donc ce problème n’est pas forcément évident. Mais il est important de comprendre cette différence, car des situations similaires apparaissent souvent ensuite lors de la création de mises en page avec des textes courts.

### Contrôler la distance entre les vues internes

Précédemment, nous avons écrit `spacing: 10` dans `VStack` :

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` sert à contrôler la distance entre les vues internes.

Si `spacing` n’est pas défini, `VStack` possède aussi un espacement par défaut, mais cet espacement par défaut ne correspond pas forcément à l’effet souhaité.

Ici, si le titre du cours et la description du cours sont trop proches, la mise en page paraîtra encombrée. Nous utilisons donc :

```swift
spacing: 10
```

Cela permet de conserver un peu d’espace entre eux.

Résultat affiché :

![view](../../../Resource/026_view9.png)

De même, la zone supérieure et la zone de contenu sont aussi disposées verticalement. `spacing` peut donc également être utilisé pour contrôler la distance entre elles.

Maintenant, plaçons `topView` et `contentView` dans `body` :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Résultat affiché :

![view](../../../Resource/026_view10.png)

Ici, `VStack(spacing: 20)` contrôle la distance entre `topView` et `contentView`.

Autrement dit :

```swift
VStack(alignment: .leading, spacing: 10)
```

Contrôle la distance entre le titre du cours et la description du cours.

```swift
VStack(spacing: 20)
```

Contrôle la distance entre la zone supérieure et la zone de contenu.

Ce sont tous les deux des `spacing`, mais ils agissent sur des conteneurs `VStack` différents, donc leur portée d’influence est également différente.

Ainsi, la vue de la zone de contenu est terminée.

## Zone du bouton

Ensuite, créons la zone du bouton en bas.

Résultat affiché :

![view](../../../Resource/026_view11.png)

La zone du bouton se compose principalement d’une icône de lecture et d’un texte.

Nous pouvons utiliser `Image` pour afficher l’icône de lecture et `Text` pour afficher le texte du bouton.

Ici, créons d’abord l’apparence du bouton :

```swift
var buttonView: some View {
    HStack {
        Button {
            print("bouton cliqué")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Commencer")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Résultat affiché :

![view](../../../Resource/026_view12.png)

Deux conteneurs `HStack` sont utilisés ici :

Le `HStack` interne sert à disposer l’icône et le texte horizontalement :

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Commencer")
}
```

Le `HStack` externe, avec `Spacer()`, sert à aligner l’apparence du bouton à gauche :

```swift
HStack {
    ...
    Spacer()
}
```

Lorsque l’on touche le bouton, la console affiche `bouton cliqué`.

## Carte de base terminée

Maintenant, combinons la zone supérieure, la zone de contenu et la zone du bouton :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Résultat affiché :

![view](../../../Resource/026_view13.png)

À ce stade, une carte de cours de base est terminée.

## Arrière-plan avec icône Swift

Enfin, ajoutons à la carte une icône Swift translucide en arrière-plan.

![view](../../../Resource/026_view.png)

Précédemment, nous avons utilisé `Color.indigo` comme couleur d’arrière-plan. En fait, en plus d’ajouter une couleur, `.background()` peut aussi ajouter une vue complète.

Nous pouvons donc d’abord créer une vue d’arrière-plan dédiée :

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Dans cette vue d’arrière-plan, nous utilisons `VStack`, `HStack` et `Spacer()` pour pousser l’icône Swift vers le coin inférieur droit.

Comme l’icône Swift sert uniquement de décoration d’arrière-plan, nous utilisons ici un blanc translucide :

```swift
Color.white.opacity(0.15)
```

Ainsi, l’icône ne sera pas trop visible et n’affectera pas le contenu textuel au premier plan.

Ensuite, ajoutons `backgroundView` à la carte :

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Résultat final :

![view](../../../Resource/026_view14.png)

Ici, deux modificateurs `.background()` sont utilisés à la suite :

```swift
.background(backgroundView)
.background(Color.indigo)
```

Le premier `.background()` sert à ajouter l’arrière-plan avec l’icône Swift.
Le second `.background()` sert à ajouter l’arrière-plan indigo.

Ainsi, l’icône Swift s’affiche au-dessus de l’arrière-plan indigo et apparaît comme une partie de l’arrière-plan de la carte.

À partir de là, nous pouvons voir que `.background()` peut non seulement ajouter des couleurs, mais aussi des vues personnalisées. Plusieurs `.background()` peuvent également être combinés pour créer des effets d’arrière-plan plus riches.

À ce stade, une carte de cours complète est terminée.

## Résumé

Dans cette leçon, nous avons revu les méthodes de mise en page de base courantes dans SwiftUI à travers une carte de cours.

Nous avons utilisé `Text` pour afficher du texte, `Image` pour afficher une icône système, et `VStack`, `HStack` ainsi que `Spacer()` pour contrôler l’agencement des vues.

Nous avons appris `.lineLimit()`, qui permet de limiter le nombre maximal de lignes affichées par un texte. Lorsque le contenu dépasse cette limite, la partie en trop est omise.

En même temps, nous avons également revu des modificateurs courants comme `.padding()`, `.background()`, `.cornerRadius()` et `.foregroundStyle()`.

Après cette leçon, nous pouvons déjà combiner plusieurs petites vues en un module de carte complet.

C’est aussi une approche très courante dans le développement SwiftUI : commencer par diviser les vues en petites parties, puis les combiner en une interface complète.

## Code complet

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Débutant")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ leçons")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Tutoriel SwiftUI débutant")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Partez de zéro avec SwiftUI et apprenez systématiquement le développement déclaratif d’interfaces d’Apple. Grâce à des explications claires et des exemples pratiques, vous maîtriserez progressivement la mise en page, les interactions et la gestion de l’état pour créer de belles interfaces utiles.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("bouton cliqué")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Commencer")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
