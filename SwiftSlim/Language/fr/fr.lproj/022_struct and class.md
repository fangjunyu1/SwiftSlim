# struct et class

Dans la leçon précédente, nous venions tout juste de commencer à découvrir `struct`, nous avons défini une structure, et nous avons aussi élargi notre apprentissage à des notions comme les protocoles, `UUID` et d'autres points de connaissance.

Maintenant, nous avons déjà une compréhension initiale du mot-clé `struct`, mais on ne peut pas encore dire que nous le comprenons vraiment.

Dans cette leçon, nous allons continuer à prendre `struct` comme contenu central, et au passage nous allons aussi découvrir `class`. Grâce à cette leçon, vous saurez plus clairement : ce qu'est une instance, ce qu'est un constructeur, et pourquoi nous pouvons utiliser `struct` et `class` pour organiser des données.

## Système de gestion des étudiants

Par exemple, nous voulons maintenant développer un système de gestion des étudiants. Chaque étudiant possède des informations comme le nom, le sexe, le téléphone, l'âge, l'adresse du domicile, etc.

À ce moment-là, nous pouvons regrouper ces informations et les définir sous la forme d'une structure `Student` :

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Ici, nous utilisons `struct` pour définir un type d'étudiant.

Cette structure `Student` contient plusieurs propriétés :

- `id` : l'identifiant unique de l'étudiant
- `name` : le nom de l'étudiant
- `sex` : le sexe de l'étudiant
- `phone` : le téléphone de l'étudiant
- `age` : l'âge de l'étudiant
- `address` : l'adresse du domicile

De cette façon, plusieurs données qui étaient à l'origine dispersées sont regroupées en un « étudiant » complet.

Ici, `Student` respecte aussi le protocole `Identifiable` et définit un champ `id`, ce qui facilite ensuite l'affichage des données avec la boucle `ForEach`.

Ensuite, nous pouvons créer une instance d'étudiant :

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Ce code signifie qu'à partir de cette structure `Student`, on peut créer des données concrètes d'étudiant.

Ici, `Student` est le type, et `Student(...)` représente une instance créée.

Dans SwiftUI, nous pouvons attribuer cette instance à une variable, puis l'afficher.

Par exemple :

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

Ainsi, nous pouvons voir dans la vue le nom de cet étudiant : `Fang Junyu`.

Ici, nous avons d'abord créé une instance de `Student`, puis nous l'avons attribuée à la variable `student`, et enfin nous avons lu sa propriété via `student.name`.

## Qu'est-ce qu'une instance

Quand on commence à apprendre `struct`, il est possible que le mot « instance » paraisse très étranger.

Mais en réalité, nous utilisons des instances depuis le tout début, nous n'y faisions simplement pas particulièrement attention auparavant.

Par exemple :

```swift
let name = "Fang Junyu"
```

Ici, `"Fang Junyu"` est une valeur de chaîne de caractères, et en essence c'est une instance du type `String`.

Nous pouvons aussi l'écrire comme ceci :

```swift
let name = String("Fang Junyu")
```

Ces deux écritures expriment la même chose : créer une instance du type `String` et l'attribuer à la variable `name`.

De la même manière, c'est aussi le cas pour `Int` :

```swift
let num = 3
```

Ici, `3` est essentiellement une valeur du type `Int`, et on peut aussi le comprendre comme une instance de `Int`.

Ainsi, une instance n'est pas un concept spécial qui n'apparaît que dans `struct`.

Qu'il s'agisse de `String`, `Int`, `Double`, `Bool` ou du `Student` personnalisé, tous peuvent créer des instances.

Par conséquent, quand nous écrivons :

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

cela revient essentiellement à créer une instance de `String` ou de `Int`, sauf que `Student` est un type que nous avons défini nous-mêmes.

## Constructeur

Quand nous créons une instance :

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

en réalité, nous appelons la méthode d'initialisation de `Student`, c'est-à-dire `init`.

Vous pouvez comprendre le constructeur comme : **le point d'entrée chargé d'attribuer des valeurs aux propriétés lorsqu'une instance est créée.**

Autrement dit, avant qu'une instance ne soit réellement entièrement créée, elle doit généralement d'abord passer par `init`.

Par exemple, lorsque nous avons appris précédemment le cycle de vie des vues SwiftUI, nous avons écrit un code comme celui-ci :

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Ici, `init()` est exécuté lorsque l'instance `ContentView` est créée, tandis que `onAppear` n'est exécuté que lorsque la vue s'affiche réellement à l'écran. Cela veut dire que la création et l'affichage d'une vue ne se produisent pas au même moment.

De la même manière, lorsque nous créons `Student(...)`, nous appelons aussi le constructeur de `Student`.

### Constructeur généré automatiquement par le système

Quand nous avons défini `Student`, nous n'avons pas écrit `init` manuellement :

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Mais malgré cela, nous pouvons toujours créer directement une instance :

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Pourquoi peut-on créer une instance sans avoir écrit de constructeur ?

Parce que pour `struct`, si nous n'écrivons pas de constructeur manuellement, le système génère généralement automatiquement un constructeur approprié pour nous.

Au stade débutant, on peut le comprendre simplement ainsi : Swift complète automatiquement pour nous le code d'initialisation.

On peut comprendre approximativement que le système nous complète le code suivant :

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

Ici, il faut faire attention à un détail :

```swift
let id = UUID()
```

`id` a déjà une valeur par défaut, donc lors de la création d'une instance, nous n'avons pas besoin de repasser `id` manuellement.

Autrement dit, les propriétés qui n'ont pas de valeur par défaut doivent généralement être passées dans le constructeur ; les propriétés qui ont déjà une valeur par défaut peuvent généralement utiliser directement cette valeur d'origine.

Par conséquent, lorsque nous créons une instance de `Student`, nous avons seulement besoin de passer `name`, `sex`, `phone`, `age` et `address`.

### Indications du compilateur

De plus, lorsque nous saisissons `Student(...)` dans Xcode, nous pouvons aussi voir les suggestions de paramètres fournies par le système.

![student](../../Resource/022_student.png)

Cela montre aussi en réalité que le type actuel possède bien un constructeur généré automatiquement par le système.

### Écrire soi-même le constructeur

Bien que le système puisse générer automatiquement le constructeur, parfois cette méthode d'initialisation par défaut ne correspond pas complètement à nos besoins.

Par exemple, nous avons une structure `Movie` :

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

Selon le constructeur généré automatiquement par le système, lorsque nous créons une instance, nous devons passer ces trois paramètres en même temps :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Mais si maintenant nous voulons enregistrer un lot de vieux films et que nous connaissons seulement le nom du film, sans connaître le réalisateur ni la note, cela devient un peu gênant.

Parce que nous ne pouvons alors l'écrire que comme ceci :

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Même si cela fonctionne, écrire `--` à répétition à chaque fois n'est pas pratique.

À ce moment-là, nous pouvons écrire un constructeur :

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

De cette manière, lorsque nous créons de vieux films, nous n'avons besoin de passer que `name` :

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

C'est l'un des intérêts d'écrire soi-même un constructeur : **faire en sorte que la manière de créer les instances corresponde mieux aux besoins réels.**

### Analyser un constructeur personnalisé

Regardons ce constructeur écrit à la main juste avant :

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

Ce code signifie que, lors de la création d'une instance de `Movie`, il suffit de passer un seul paramètre `name`.

Ensuite, à l'intérieur du constructeur, le `name` transmis sera attribué au `name` de l'instance elle-même, et `director` ainsi que `rating` recevront une valeur par défaut `--`.

Ici, `self` signifie « cette instance actuelle elle-même ».

Par exemple :

```swift
self.name = name
```

Le `self.name` de gauche représente la propriété dans l'instance ; le `name` de droite représente le paramètre que nous avons transmis.

On peut simplement le comprendre comme le fait de stocker dans la propriété de l'instance la valeur transmise depuis l'extérieur.

Quand toutes les propriétés ont reçu une valeur, la création de cette instance est terminée.

### Mécanisme du constructeur

Lorsque nous déclarons explicitement un constructeur, cela entraîne aussi un autre changement :

le constructeur que le système générait automatiquement à l'origine ne peut généralement plus être utilisé directement.

Par exemple :

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Maintenant, si nous écrivons encore ceci :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

le compilateur signalera une erreur :

```swift
Extra arguments at positions #2, #3 in call
```

Cela signifie : vous avez passé des paramètres supplémentaires.

Pourquoi cette erreur apparaît-elle ?

Parce que dans la structure `Movie` actuelle, il n'existe que ce seul constructeur que vous avez déclaré manuellement :

```swift
init(name: String)
```

Il n'accepte qu'un seul paramètre `name`, et n'accepte pas `director` ni `rating`.

Autrement dit, lorsque vous ajoutez manuellement votre propre constructeur, la méthode d'initialisation générée automatiquement à l'origine ne peut plus être utilisée directement.

Si nous voulons prendre en charge à la fois « passer seulement le nom » et « passer les informations complètes », alors nous devons nous-mêmes ajouter un autre constructeur complet :

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Ainsi, nous avons deux constructeurs différents.

Lors de la création d'un vieux film, nous pouvons écrire ceci :

```swift
Movie(name: "The Night of the Hunter")
```

Lors de la création d'un nouveau film avec des informations complètes, nous pouvons écrire ceci :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Cette façon d'écrire montre aussi qu'un même type peut posséder plusieurs constructeurs, tant que la forme de leurs paramètres est différente.

## Qu'est-ce que la surcharge

Ici, ajoutons encore un point de connaissance nécessaire.

À l'instant, nous avons écrit deux `init` pour `Movie` :

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

Cette manière d'écrire, « le même nom de fonction mais des paramètres différents », s'appelle la « surcharge ».

Ici, les deux fonctions s'appellent `init`, mais comme elles reçoivent des paramètres différents, Swift peut distinguer laquelle vous appelez.

Par exemple :

```swift
Movie(name: "Days of Heaven")
```

appellera :

```swift
init(name: String)
```

Tandis que :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

appellera l'autre version complète de la méthode d'initialisation.

Donc, le rôle de la surcharge est : permettre à un même type de proposer différentes façons de se créer selon différentes situations.

## Découvrir class

Ensuite, découvrons brièvement `class`.

En plus du `struct` courant en Swift, de nombreux langages de programmation utilisent `class` pour créer des instances, comme Java, C#, Kotlin et d'autres.

En Swift, la syntaxe de `class` est très proche de celle de `struct`.

Par exemple :

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

Vous remarquerez qu'à part le fait que le mot-clé passe de `struct` à `class`, les autres parties paraissent presque identiques.

La manière de créer une instance est aussi très similaire :

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

Ainsi, au niveau de la syntaxe, `struct` et `class` se ressemblent vraiment beaucoup.

### Différence entre Struct et Class

Même si `struct` et `class` se ressemblent beaucoup, ils ne sont pas exactement identiques.

**1. La manière d'initialiser est différente**

Pour `struct`, si nous n'écrivons pas manuellement de constructeur, le système génère généralement automatiquement une méthode d'initialisation appropriée.

Mais pour `class`, s'il existe des propriétés qui n'ont pas encore de valeur par défaut, il faut généralement écrire `init` manuellement, sinon une erreur apparaîtra.

Par exemple :

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

Cette `class` provoque une erreur, parce qu'elle n'a pas de constructeur, donc ses propriétés ne sont pas initialisées.

Le compilateur affichera quelque chose comme :

```swift
Class 'Movie' has no initializers
```

Par conséquent, dans cet exemple, `class` doit obligatoirement avoir un constructeur écrit manuellement.

**2. `struct` est un type valeur, `class` est un type référence**

`struct` est un type valeur, et `class` est un type référence.

Au stade débutant, il n'est pas nécessaire de maîtriser complètement ces deux concepts ; il suffit d'en avoir une compréhension simple.

Par exemple, `struct` ressemble davantage au fait de « copier une nouvelle valeur ».

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Ici, après avoir attribué `user1` à `user2`, c'est comme si l'on copiait un nouvel ensemble de données, donc modifier `user2` n'affecte pas `user1`.

En revanche, `class` ressemble davantage au fait de « pointer ensemble vers la même instance ».

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Ici, `user1` et `user2` pointent vers la même instance.

Pour le moment, nous n'avons pas besoin de comprendre complètement le mécanisme interne des types valeur et des types référence ; il suffit simplement de savoir que `struct` convient mieux pour stocker des données indépendantes, tandis que `class` convient mieux lorsque plusieurs endroits doivent partager la même instance.

## Comment choisir au stade débutant

À l'étape actuelle, pour les modèles de données ordinaires, il vaut mieux penser d'abord à `struct` ; lorsque des données partagées et des modifications synchronisées sont nécessaires, on peut alors envisager `class`.

Ce n'est pas une règle absolue, mais pour les débutants, c'est une manière de juger suffisamment pratique.

En particulier dans SwiftUI, vous constaterez souvent que `struct` peut déjà accomplir la majeure partie du travail.

De plus, dans beaucoup de documents de programmation, ce qui est créé par `class` est aussi appelé un « objet ». Au stade débutant, vous pouvez simplement le comprendre comme une instance, sans avoir besoin de faire exprès de les distinguer.

## Résumé

Dans cette leçon, nous avons étudié `struct` plus en profondeur, et au passage nous avons aussi découvert `class` ; tous deux peuvent être utilisés pour définir des types.

Les types peuvent créer des instances. Lorsqu'une instance est créée, le constructeur, c'est-à-dire `init`, est appelé.

Pour `struct`, si nous n'écrivons pas manuellement de constructeur, le système génère généralement automatiquement un constructeur approprié. Si le constructeur par défaut ne répond pas aux besoins, nous pouvons aussi écrire nous-mêmes un constructeur.

De plus, nous avons aussi acquis une compréhension initiale de la différence entre `struct` et `class` : `struct` est un type valeur, tandis que `class` est un type référence. Dans SwiftUI, au stade débutant, ce que l'on rencontre le plus souvent est généralement `struct`.

Plus tard, lorsque nous apprendrons le passage de valeurs entre les vues, les modèles de données et la gestion d'état, tout ce contenu continuera à être utilisé.
