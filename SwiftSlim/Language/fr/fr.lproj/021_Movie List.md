# Liste de films

Dans cette leçon, nous allons créer une liste de films.

![movie](../../Resource/021_movie.png)

Dans la liste, l'affiche, le nom, le réalisateur et la note de chaque film seront affichés.

Dans cet exemple, nous allons apprendre un point très important : la structure `struct`. Elle peut nous aider à regrouper plusieurs informations d'un film en un seul ensemble. En plus de cela, nous allons aussi découvrir `UUID()`, `ForEach`, la ligne de séparation `Divider`, ainsi que la manière d'utiliser des objets personnalisés pour gérer les données.

Ces connaissances sont très courantes dans le développement SwiftUI par la suite. Après cette leçon, non seulement tu pourras créer une liste de films, mais tu commenceras aussi à comprendre « comment afficher un ensemble de données sous forme d'interface ».

## Un seul film

Nous pouvons commencer par créer l'interface d'un seul film.

![movie](../../Resource/021_movie1.png)

La disposition de cette interface se compose principalement de deux parties : à gauche se trouve l'affiche du film, et à droite se trouve la présentation du film.

### Affiche du film

À gauche s'affiche l'affiche du film, et nous pouvons utiliser `Image` pour afficher l'image.

Par exemple :

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

Ce code signifie qu'une image nommée `"The Shawshank Redemption"` est affichée.

Ici, il faut faire attention au fait que le nom de l'image doit réellement exister dans le dossier de ressources `Assets`, sinon l'interface ne pourra pas afficher correctement cette image.

![movie](../../Resource/021_movie2.png)

Les fonctions de ces modificateurs sont respectivement :

- `resizable()` signifie que la taille de l'image peut être ajustée.
- `scaledToFit()` signifie que les proportions d'origine sont conservées pendant le redimensionnement, afin d'éviter que l'image soit étirée et déformée.
- `frame(height: 180)` signifie que la hauteur de l'image est définie à 180.
- `cornerRadius(10)` signifie qu'un rayon d'angle de 10 est appliqué à l'image.

De cette manière, nous pouvons obtenir une image d'affiche de film avec une taille appropriée et des coins arrondis.

![movie](../../Resource/021_movie3.png)

### Présentation du film

À droite s'affiche la présentation du film, comprenant le nom du film, le réalisateur et la note.

![movie](../../Resource/021_movie4.png)

Nous pouvons utiliser `Text` pour afficher cette partie :

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

Dans ce code, `.font` représente la taille de la police, et `.fontWeight` représente l'épaisseur de la police.

Pour rendre plus clair l'espacement entre le « nom du film », les « informations sur le réalisateur » et les « informations sur la note », nous utilisons ici `VStack` sur la couche la plus externe, et nous définissons :

```swift
spacing: 10
```

Cela signifie que l'espacement entre chaque groupe de contenu à l'intérieur de ce `VStack` est de 10.

La raison pour laquelle le réalisateur et la note sont chacun enveloppés dans un autre `VStack` est qu'ils appartiennent tous deux à une structure de type « titre + contenu ». Ainsi, la hiérarchie de l'interface sera plus claire, et il sera également plus pratique pour nous de continuer à ajuster le style par la suite.

De plus, `VStack` est centré par défaut. Pour aligner tout le texte à gauche, nous définissons :

```swift
alignment: .leading
```

Ainsi, la partie de présentation du film paraît plus ordonnée.

### Ligne de séparation

Maintenant, même si le contenu de la présentation du film est espacé grâce à `spacing`, la séparation entre les différents contenus n'est toujours pas suffisamment évidente.

À ce moment-là, nous pouvons ajouter une ligne de séparation :

```swift
Divider()
```

Par exemple :

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

De cette façon, la partie de présentation du film aura un effet de séparation plus évident.

![movie](../../Resource/021_movie4.png)

`Divider` est une vue très simple mais très souvent utilisée, dont le rôle est de séparer des contenus différents.

Dans `VStack`, `Divider()` s'affiche comme une ligne horizontale.

Dans `HStack`, `Divider()` s'affiche comme une ligne verticale.

De plus, on peut aussi modifier le style de `Divider` au moyen de `.frame`, `.background`, `.padding`, etc.

Par exemple :

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

Cela générera une ligne de séparation bleue, d'une épaisseur de 2, avec un remplissage horizontal des deux côtés.

![divider](../../Resource/021_divider.png)

### Interface complète

Enfin, nous pouvons utiliser `HStack` pour placer l'affiche du film et la présentation du film côte à côte.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Ici, `HStack(spacing: 20)` signifie qu'un espace de 20 est laissé entre les parties gauche et droite.

Il faut noter que `Divider()`, tout comme `TextField` et `Slider` que nous avons vus plus haut, essaie par défaut d'occuper autant d'espace disponible que possible.

C'est pourquoi nous définissons une largeur fixe pour le `VStack` externe de la partie descriptive à droite :

```swift
.frame(width: 200)
```

Ainsi, la largeur de la ligne de séparation et de la zone de texte peut rester la même, et l'ensemble paraîtra plus ordonné.

Jusqu'ici, nous avons terminé l'interface d'affichage d'« un seul film ».

![movie](../../Resource/021_movie1.png)

## Stocker les films dans un tableau

Si nous voulons afficher plusieurs films à la suite avec le même style, cela signifie qu'il faut écrire un code similaire pour chaque film.

Par exemple :

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Même si un code écrit de cette manière permet d'obtenir le résultat, le code deviendra de plus en plus long, et il sera très difficile à maintenir.

Par exemple, s'il faut modifier l'espacement de tous les films de `20` à `15`, ou changer la largeur de la partie droite de `200` à
`220`, il faudra modifier manuellement chaque portion de code répétée.

Ce n'est évidemment pas une méthode efficace.

Nous avons déjà appris les tableaux, et nous avons aussi appris à utiliser `ForEach` pour afficher des vues de manière répétée à partir d'un tableau.

Par exemple :

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]

    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Cette méthode est très adaptée aux cas où il n'y a « qu'une seule donnée », comme un groupe de noms d'images.

Mais un film ne contient pas une seule valeur. Il contient au minimum :

1. l'affiche du film
2. le nom du film
3. le réalisateur
4. la note

Autrement dit, un film est en réalité un ensemble de données liées, et non une simple chaîne isolée.

Si nous utilisons seulement des tableaux, nous ne pourrons conserver ces informations qu'en les séparant :

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

Lors de l'affichage, nous devons alors nous appuyer sur le même index pour faire correspondre les éléments un à un :

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

Le problème de cette manière d'écrire est que le coût de maintenance est très élevé.

Comme les données d'un film sont dispersées dans plusieurs tableaux, il suffit qu'un tableau ait un élément en plus, un élément en moins ou un ordre différent pour que le résultat affiché soit faux.

En particulier lors de l'ajout ou de la suppression de films, tu dois modifier plusieurs tableaux en même temps, et il est très facile d'oublier quelque chose.

Alors, comment peut-on regrouper des informations comme « le nom du film, le réalisateur et la note » en un seul ensemble ?

Pour cela, il faut utiliser `struct`.

## Définir la structure struct

En Swift, `struct` signifie « structure ».

Tu peux la comprendre comme un « type de données personnalisé » qui peut regrouper plusieurs champs liés en un seul ensemble.

Utilisation de base :

```swift
struct StructName {
	let name: String
}
```

Dans ce code, `struct` est le mot-clé qui indique que nous définissons une structure. `StructName` est le nom de la structure.

Le contenu entre accolades correspond aux champs contenus dans cette structure, et chaque champ doit indiquer clairement son nom et son type.

En général, le nom d'une `struct` commence par une majuscule, par exemple `Movie`, `Student` ou `UserInfo`. C'est une convention de nommage courante en Swift.

Tu peux comprendre `struct` tout simplement comme une boîte vide, dans laquelle chaque champ correspond à un emplacement vide réservé.

Quand ces emplacements ne sont pas encore remplis, ce n'est qu'une boîte vide. Ce n'est que lorsque tous les champs sont remplis avec des valeurs appropriées qu'elle devient une boîte cadeau complète.

### Instance de struct

Tout à l'heure, nous n'avons défini que la structure elle-même, ce qui équivaut à préparer la forme d'une boîte.

Nous devons encore y mettre le contenu concret pour obtenir une véritable « instance » utilisable.

Lorsqu'on crée une instance, on ajoute généralement `()` après le nom de la structure :

```swift
StructName(...)
```

Ce qui est rempli entre les parenthèses correspond précisément au contenu des champs dont cette structure a besoin.

Par exemple :

```swift
StructName(name: "Fang Junyu")
```

Ce code signifie : créer une nouvelle instance selon le format de la structure `StructName`, et attribuer au champ `name` la valeur `"Fang Junyu"`.

Quand nous avons rempli tous les contenus de champs nécessaires, c'est comme si nous remplissions complètement cette boîte.

À ce moment-là, nous obtenons une instance complète de la structure.

### Accéder aux propriétés d'une struct

Lorsque nous avons créé une instance, nous pouvons utiliser la « syntaxe par point » pour accéder à ses propriétés internes.

Écriture de base :

```swift
instance.nomDeLaPropriete
```

Par exemple :

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Ici, `st` est une instance de structure, et `st.name` signifie lire la valeur `name` de cette instance.

Tu peux comprendre cette manière de lecture ainsi : quand nous écrivons `st.name`, c'est comme si nous lisions le contenu stocké à un certain emplacement dans cette boîte.

Cette manière d'écrire sera très fréquente dans les interfaces SwiftUI par la suite.

Par exemple, si nous avons une structure d'étudiant qui contient le nom, l'âge et la classe, alors lors de l'affichage dans l'interface, nous pouvons lire séparément :

```swift
student.name
student.age
student.className
```

L'avantage de cette méthode est que les données deviennent plus claires et aussi plus faciles à gérer.

### Position de struct

Pour les débutants, on peut généralement écrire la structure en dehors de `ContentView`.

Par exemple :

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

Ainsi, la structure est plus claire et plus facile à lire.

Tu remarqueras que `ContentView` lui-même est en réalité aussi une `struct`.

### Structure Movie

Avec les bases précédentes, nous pouvons définir une structure de film :

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

Il s'agit d'une structure nommée `Movie`, composée des trois champs `name`, `director` et `rating`, qui représentent respectivement le nom du film, le réalisateur et la note.

Ainsi, les informations liées à un film n'ont plus besoin d'être séparées dans plusieurs tableaux, mais peuvent être directement regroupées en un seul ensemble.

Par exemple, nous pouvons créer une instance de film comme celle-ci :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

Cette instance représente « un ensemble complet de données d'un film ».

### Stocker des structures dans un tableau

Nous avons dit plus tôt qu'un tableau ne peut stocker qu'un seul type.

Maintenant que nous avons déjà la structure `Movie`, le tableau peut stocker plusieurs `Movie`.

```swift
let lists: [Movie] = []
```

Par exemple :

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Dans ce tableau `lists`, ce ne sont pas des chaînes qui sont stockées, mais plusieurs instances de `Movie`.

Autrement dit, chaque élément du tableau est un film complet.

Ainsi, lorsque nous devons afficher la liste des films, nous pouvons utiliser `ForEach` pour lire chaque film un par un.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Ici, `movie in` signifie qu'à chaque boucle, un film est extrait du tableau et nommé temporairement `movie`.

Ensuite, nous pouvons utiliser :

```swift
movie.name
movie.director
movie.rating
```

pour lire respectivement le nom, le réalisateur et la note de ce film, puis les afficher dans l'interface.

## Erreur ForEach

Jusqu'ici, nous avons déjà terminé l'écriture de base du tableau de films et de `ForEach`.

Cependant, si tu exécutes directement le code suivant :

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

une erreur s'affichera :

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

Le sens de cette erreur est que, lorsque tu écris `id: \.self`, SwiftUI a besoin de considérer chaque élément du tableau lui-même comme un « identifiant unique » pour pouvoir les distinguer.

Cette écriture convient aux types simples comme `String` et `Int`, car ils sont eux-mêmes plus faciles à distinguer.

Mais `Movie` est une structure personnalisée que nous avons définie, et `ForEach` ne sait pas comment utiliser la structure elle-même comme identifiant unique ; c'est pourquoi l'erreur apparaît.

La manière la plus courante de résoudre ce problème consiste à faire en sorte que `Movie` respecte le protocole `Identifiable`.

## Protocole

En Swift, un protocole peut être compris comme une sorte de « règle » ou d'« exigence ».

Tu peux le comprendre comme un accord dans une organisation internationale : si un pays veut rejoindre une certaine organisation internationale, il doit généralement d'abord satisfaire à certaines règles proposées par cette organisation, rendre publiques certaines données et respecter certaines règles communes. Ce n'est qu'après avoir satisfait à ces conditions qu'il peut la rejoindre ou participer à certaines affaires.

Les protocoles fonctionnent de manière similaire.

Lorsqu'un type veut se conformer à un certain protocole, il doit satisfaire au contenu requis par ce protocole. Ce n'est qu'après avoir satisfait à ces exigences que ce type peut utiliser la fonctionnalité correspondante.

Écriture de base :

```swift
struct Movie: Identifiable {
    // ...
}
```

Ici, `: Identifiable` signifie que `Movie` respecte le protocole `Identifiable`.

Si un type respecte plusieurs protocoles, ils peuvent être séparés par des virgules :

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

Pour `Identifiable`, l'exigence la plus importante est que le type doit posséder un `id` qui lui permette de s'identifier.

Par exemple :

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Ici, `id` est comme un numéro d'identité, et sert à distinguer chaque film.

Tant que l'`id` de chaque film est différent, SwiftUI peut distinguer correctement chaque élément du tableau.

Par exemple :

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ensuite, on utilise dans `ForEach` :

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

Ainsi, il n'y aura plus d'erreur.

Comme `Movie` respecte déjà `Identifiable`, une manière plus courante d'écrire consiste à omettre directement `id:` :

```swift
ForEach(lists) { movie in
    // ...
}
```

Parce que SwiftUI sait déjà qu'il faut utiliser `movie.id` pour distinguer chaque élément.

## L'identifiant de distinction de ForEach

Ensuite, nous allons comprendre plus en profondeur le rôle de `id` dans `ForEach`.

Par exemple :

```swift
ForEach(lists, id: \.self)
```

Ici, cela signifie : utiliser l'élément lui-même comme identifiant de distinction.

Et :

```swift
ForEach(lists, id: \.id)
```

signifie : utiliser le champ `id` de l'élément comme identifiant de distinction.

Si un certain champ peut lui-même garantir l'unicité, on peut aussi l'utiliser temporairement.

Par exemple, si le nom de chaque film est différent, alors l'écriture suivante peut également fonctionner correctement avec les données actuelles :

```swift
ForEach(lists, id: \.name)
```

Mais il y a ici un problème caché : `name` n'est pas forcément toujours unique.

Supposons que plus tard tu ajoutes un autre film portant le même nom ; alors `name` ne pourra plus distinguer correctement chaque élément.

À ce moment-là, même si le code peut encore être compilé, SwiftUI peut faire une mauvaise identification lors du rafraîchissement, de la mise à jour, de l'insertion ou de la suppression de vues, ce qui entraîne des anomalies d'affichage.

Par conséquent, lorsqu'il faut distinguer les données de manière stable, il est préférable d'utiliser le champ réellement unique, c'est-à-dire `id`.

## UUID

Même si écrire manuellement `id: 1`, `id: 2` peut résoudre le problème, il reste un risque : on peut écrire par erreur un `id` en double, et l'identifiant unique perd alors sa validité.

Par exemple :

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Ainsi, deux `id` identiques apparaîtront, et l'identifiant unique perdra sa validité.

Pour éviter les erreurs manuelles, nous utilisons généralement `UUID()`.

En Swift, `UUID()` génère aléatoirement un identifiant de 128 bits. Il s'affiche généralement comme une longue chaîne composée de lettres et de chiffres.

Par exemple :

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Ici, `UUID()` crée en réalité une instance du type `UUID` ; tu peux la comprendre comme un « numéro unique » généré automatiquement.

Par conséquent, les valeurs créées à chaque fois ne se répètent presque jamais, ce qui les rend très adaptées à une utilisation comme `id`.

Nous pouvons modifier `Movie` comme ceci :

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Ce code signifie que le champ `id` dans la structure `Movie` recevra par défaut une nouvelle instance de `UUID`.

Autrement dit, chaque fois que nous créons un nouveau `Movie`, le système nous générera automatiquement d'abord un `id` unique.

Comme `id` possède déjà une valeur par défaut, il n'est plus nécessaire de remplir manuellement `id` lors de la création ultérieure d'instances de `Movie`.

Par exemple :

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Même si `id` n'est pas écrit ici, cette instance de film possède tout de même son propre `id` ; c'est simplement que cette valeur a déjà été générée automatiquement par `UUID()`.

Après avoir utilisé cette méthode, nous n'avons plus besoin de remplir manuellement `id` pour chaque film, ce qui réduit non seulement la quantité de code, mais évite aussi les erreurs dues à des valeurs id répétées.

Enfin, il nous suffit d'ajouter une image `Banner` en haut et d'utiliser `ScrollView` pour permettre au contenu de défiler, et ainsi l'ensemble de la vue de la liste de films sera terminé.

## Résumé

Dans cette leçon, nous avons appris un point très important : `struct`.

Grâce à `struct`, nous pouvons regrouper plusieurs champs liés à un film en un seul ensemble, au lieu de séparer le nom, le réalisateur et la note dans plusieurs tableaux.

Une fois les données regroupées, nous pouvons utiliser `ForEach` pour afficher chaque film du tableau un par un dans la vue.

En même temps, nous avons aussi compris le rôle de « l'identifiant de distinction » dans `ForEach` : SwiftUI doit savoir comment distinguer chaque élément du tableau afin de pouvoir afficher et mettre à jour correctement la vue.

C'est pourquoi nous avons fait en sorte que `Movie` respecte le protocole `Identifiable` et nous lui avons fourni un `id` unique.

Afin d'éviter les erreurs lors du remplissage manuel de `id`, nous avons ensuite appris `UUID()` pour que le système génère automatiquement l'identifiant unique.

Après avoir terminé cette leçon, non seulement tu auras complété la liste de films, mais tu commenceras aussi à toucher à une idée importante dans SwiftUI : **organiser d'abord les données, puis générer la vue à partir des données.**

## Code complet

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
