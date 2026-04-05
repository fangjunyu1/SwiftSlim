# Vue de connexion

Dans cette leçon, nous allons apprendre un scénario très pratique : la vue de connexion.

Qu'il s'agisse d'un site web ou d'une application, pendant l'utilisation il est souvent nécessaire que l'utilisateur se connecte à son compte et saisisse un mot de passe.

Par exemple, la page de connexion de GitHub :

![WordPress](../../Resource/019_github.png)

Dans cette leçon, nous allons créer une vue de connexion similaire pour que l'utilisateur saisisse manuellement son compte et son mot de passe, puis nous vérifierons s'il y a un problème avec le contenu saisi.

## Mise en page du haut

Nous écrirons le code de la vue de connexion dans le fichier `ContentView`.

D'abord, écrivons la zone d'identification en haut de la vue de connexion. Vous pouvez d'abord préparer une image d'icône appropriée et la placer dans le dossier `Assets`.

![icon](../../Resource/019_icon1.png)

Ensuite, utilisez `Image` et des modificateurs pour afficher l'image :

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Ces modificateurs signifient :

- `resizable()`: permet à l'image de changer de taille.
- `scaledToFit()`: redimensionne l'image en conservant ses proportions d'origine.
- `frame(width: 100)`: définit la largeur d'affichage de l'image à `100`.

Ensuite, utilisez `Text` et des modificateurs pour afficher le titre de connexion :

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Puis, utilisez `VStack` pour disposer l'image et le texte verticalement :

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Résultat :

![view](../../Resource/019_view.png)

À ce stade, nous avons terminé la zone de titre en haut de la vue de connexion.

### Optimiser la mise en page

Actuellement, l'image et le titre se trouvent par défaut dans la zone centrale de la mise en page globale.

Si nous voulons qu'ils ressemblent davantage à une "identification de connexion en haut de la page", nous pouvons utiliser `Spacer()` pour étendre l'espace restant et faire apparaître le contenu plus près du haut.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Résultat :

![view](../../Resource/019_view1.png)

Mais maintenant, `Image` et `Text` sont trop proches du haut de l'écran, et l'ensemble semble un peu serré.

À ce moment-là, nous pouvons utiliser `padding` pour ajouter un espacement supérieur à tout le `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Résultat :

![view](../../Resource/019_view2.png)

Ainsi, la zone de titre en haut de la page paraît plus appropriée.

## Nom d'utilisateur et mot de passe

Une page de connexion demande généralement à l'utilisateur de saisir un nom d'utilisateur et un mot de passe.

Dans SwiftUI, nous pouvons utiliser `TextField` pour recevoir le contenu saisi par l'utilisateur.

Mais il faut faire attention : `TextField` ne conserve pas lui-même les données saisies à long terme, c'est seulement un contrôle de saisie. Ce qui stocke réellement ces données saisies, ce sont les variables que nous lui lions.

Nous devons donc d'abord créer deux variables `@State` pour stocker le nom d'utilisateur et le mot de passe :

```swift
@State private var user = ""
@State private var password = ""
```

Quand la valeur d'une variable `@State` change, SwiftUI actualise automatiquement les vues concernées.

Ensuite, utilisez `TextField` pour lier ces deux variables :

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Ici, `$user` et `$password` représentent un "binding".

Autrement dit, quand l'utilisateur saisit du texte dans le champ de saisie, la variable change en même temps ; et quand la variable change, le contenu affiché dans le champ de saisie change aussi en même temps.

Cette relation dans laquelle "la vue et les données restent synchronisées entre elles" s'appelle le binding.

Notez qu'ici, il faut utiliser l'écriture avec `$` :

```swift
$user
```

Parce que `TextField` n'a pas besoin d'une chaîne ordinaire, mais d'une valeur binding qui "peut modifier les données dans les deux sens".

### Afficher les champs de saisie

Plaçons-les dans `ContentView` :

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Effet d'affichage :

![view](../../Resource/019_view3.png)

Comme `user` et `password` sont tous les deux des chaînes vides par défaut en ce moment :

```swift
""
```

le champ de saisie affichera d'abord un texte d'espace réservé, par exemple :

```swift
input user
```

Ce texte indique seulement à l'utilisateur "ce qu'il faut saisir ici", et n'est pas le contenu réellement saisi.

### Optimiser les champs de saisie

Maintenant, les champs de saisie peuvent déjà être utilisés, mais leur style par défaut est relativement simple.

Pour rendre l'interface plus claire, nous pouvons ajouter un titre devant le champ de saisie et faire une petite optimisation de style sur le champ lui-même.

Par exemple, ajoutez d'abord un titre :

```swift
Text("Username")
    .fontWeight(.bold)
```

Ensuite, utilisez `HStack` pour placer le titre et le champ de saisie sur la même ligne :

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Ici, nous utilisons `HStack` parce que nous voulons "afficher le titre à gauche et le champ de saisie à droite".

Il faut noter que `TextField` occupera par défaut l'espace disponible restant.

![color](../../Resource/019_view6.png)

Pour rendre la taille des deux champs de saisie plus uniforme, nous pouvons utiliser `frame(width:)` pour définir une largeur, afin que les champs paraissent plus ordonnés.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Ajoutez ensuite aussi une bordure pour rendre le champ de saisie plus visible :

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Ajoutons maintenant à la vue `ContentView` à la fois le nom d'utilisateur et le mot de passe :

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Effet d'affichage :

![view](../../Resource/019_view4.png)

À ce stade, l'utilisateur peut déjà saisir un nom d'utilisateur et un mot de passe.

## Bouton de connexion

Ensuite, nous allons ajouter un bouton de connexion sous les champs de saisie.

```swift
Button("Sign in") {

}
```

Ensuite, utilisez `buttonStyle` pour donner au bouton un style système plus visible :

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Effet d'affichage :

![view](../../Resource/019_view5.png)

Pour confirmer que le bouton réagit vraiment au toucher, nous pouvons d'abord écrire un `print` à l'intérieur du bouton pour faire un test :

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Quand on touche le bouton, la console affichera :

```swift
click Sign in
```

Cela montre que le bouton a déjà bien répondu à l'action de toucher.

## Logique de connexion

Maintenant, nous allons ajouter au bouton de connexion la logique de validation la plus basique : **vérifier si l'utilisateur a saisi un nom d'utilisateur et un mot de passe**.

Nous voulons obtenir les situations suivantes :

- Si l'utilisateur n'a rien saisi, afficher `Empty`
- Si l'utilisateur n'a saisi qu'un seul des deux, indiquer lequel manque
- Si le nom d'utilisateur et le mot de passe sont tous les deux saisis, afficher `Success`

### Aucune information saisie

Comme `user` et `password` sont tous deux des chaînes vides par défaut :

```swift
@State private var user = ""
@State private var password = ""
```

ils resteront vides lorsque l'utilisateur ne saisit rien.

En Swift, des types comme `String` peuvent utiliser `isEmpty` pour déterminer si le contenu est vide.

### Propriété isEmpty

`isEmpty` est souvent utilisé pour vérifier si des chaînes, des tableaux et d'autres contenus sont vides.

Par exemple :

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Si le contenu est vide, `isEmpty` renvoie `true` ; si le contenu n'est pas vide, il renvoie `false`.

Nous pouvons donc l'utiliser pour déterminer si le nom d'utilisateur et le mot de passe contiennent une saisie.

### Utiliser isEmpty pour vérifier les variables

Si l'utilisateur n'a saisi aucune information, alors :

```swift
user.isEmpty // true
password.isEmpty    // true
```

À ce moment-là, nous pouvons écrire la condition comme ceci :

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Ce code signifie : si `user` est vide et que `password` est également vide, alors afficher :

```swift
Empty
```

Ici, `&&` est un opérateur logique et signifie "et".

Autrement dit, toute la condition n'est vraie que lorsque la condition de gauche est vraie et que celle de droite est également vraie.

Par conséquent, ce code ne s'exécutera que lorsque le nom d'utilisateur et le mot de passe seront tous les deux vides.

## L'utilisateur n'a rempli qu'une partie

Ensuite, considérons une autre situation : l'utilisateur n'a rempli que le nom d'utilisateur, ou uniquement le mot de passe.

Par exemple :

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

À ce moment-là, le nom d'utilisateur n'est pas vide, mais le mot de passe est vide.

Nous pouvons continuer à utiliser `isEmpty` pour vérifier :

### Situation où l'utilisateur a rempli le compte ou le mot de passe

Si l'utilisateur n'a rempli que le nom d'utilisateur ou le mot de passe, nous devons donner l'indication correspondante sur ce qui manque.

Par exemple, si l'utilisateur n'a rempli que le nom d'utilisateur :

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

La logique de ce code est : si le nom d'utilisateur est vide, demander de saisir le nom d'utilisateur. Sinon, vérifier si le mot de passe est vide, et s'il l'est, demander de saisir le mot de passe.

### L'utilisateur a rempli toutes les informations

Si le nom d'utilisateur et le mot de passe ont déjà été saisis, alors `isEmpty` renverra `false` pour les deux.

À ce moment-là, nous pouvons l'écrire comme ceci :

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Ici, `!` signifie "négation".

Par exemple :

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Autrement dit, `user.isEmpty` est utilisé pour déterminer "si le nom d'utilisateur est vide", tandis que `!user.isEmpty` est utilisé pour déterminer "si le nom d'utilisateur n'est pas vide".

Le mot de passe suit la même logique.

Ainsi, le sens de ce code est : le nom d'utilisateur n'est pas vide, et le mot de passe non plus.

Lorsque ces deux conditions sont vraies, le résultat affiché est :

```swift
Success
```

## Logique de validation complète

Maintenant, combinons ces trois situations et écrivons-les dans `Button` :

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

L'ordre d'exécution de ce code peut se comprendre ainsi :

Première étape, nous vérifions d'abord :

```swift
if user.isEmpty && password.isEmpty
```

Si le nom d'utilisateur et le mot de passe sont tous les deux vides, il affiche directement `Empty`.

S'ils ne sont pas tous les deux vides, nous continuons en vérifiant cette ligne :

```swift
else if user.isEmpty || password.isEmpty
```

Ici, `||` signifie "ou".

Autrement dit, tant qu'une des conditions est vraie, la condition entière est vraie.

Par conséquent, tant que le nom d'utilisateur est vide, ou que le mot de passe est vide, le bloc de code `else if` s'exécute.

Après être entrés dans le bloc de code, nous vérifions plus précisément quel champ de saisie n'a pas été rempli :

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Si aucune des deux conditions précédentes n'est vraie, cela signifie que le nom d'utilisateur n'est pas vide, et que le mot de passe n'est pas vide non plus.

Alors le programme entre dans le dernier `else` :

```swift
print("Success")
```

De cette manière, nous terminons la logique de validation la plus basique pour la saisie de connexion.

## Validation du nom d'utilisateur et du mot de passe

La logique ci-dessus ne vérifie que "si du contenu a été saisi ou non".

Mais dans une vraie application, il ne suffit pas simplement de saisir du contenu. En général, il faut aussi envoyer le nom d'utilisateur et le mot de passe au serveur pour vérification.

Si le serveur confirme que le nom d'utilisateur existe et que le mot de passe est correct, il autorise la connexion ; sinon, il indique que la connexion a échoué.

Pour pratiquer ce processus, nous pouvons d'abord définir dans le code un compte et un mot de passe temporaires afin de simuler "des informations de connexion correctes" :

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Lorsque le nom d'utilisateur et le mot de passe ne sont pas vides, nous comparons ensuite s'ils sont corrects :

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Ici, `==` signifie "est-ce égal".

Par exemple :

```swift
user == userID
```

Cela signifie : est-ce que le nom d'utilisateur saisi par l'utilisateur est exactement le même que le nom d'utilisateur correct que nous avons défini ? La vérification du mot de passe suit la même logique.

Par conséquent, lorsque le nom d'utilisateur et le mot de passe saisis sont égaux aux valeurs définies, le résultat affiché est `Success` ; dès qu'un des deux n'est pas égal, le résultat affiché est `Input error`.

De cette manière, nous avons terminé une simple "simulation de vérification de connexion".

Même s'il ne s'agit pas encore d'une vraie fonctionnalité de connexion reliée à un serveur, cela suffit déjà à nous aider à comprendre : **après avoir touché le bouton, différents codes peuvent être exécutés selon différentes conditions**.

## Résumé

Dans cette leçon, nous avons terminé une vue de connexion de base et nous nous sommes concentrés sur "la logique pour juger le contenu saisi en fonction des conditions".

Le contenu essentiel de cette leçon est : utiliser `isEmpty` pour déterminer si une chaîne est vide, et utiliser les instructions `if` avec des opérateurs logiques pour gérer différentes situations.

Parmi eux, deux opérateurs logiques sont très importants :

- `&&` : signifie "et", les deux conditions doivent être satisfaites
- `||` : signifie "ou", une seule condition suffit

Lorsque ces conditions produisent finalement `true` ou `false`, l'instruction `if` exécute un code différent selon le résultat.

Grâce à cette vue de connexion, nous avons déjà commencé à entrer en contact avec une manière de développer qui combine "interface + données + jugement logique".

## Code complet

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
