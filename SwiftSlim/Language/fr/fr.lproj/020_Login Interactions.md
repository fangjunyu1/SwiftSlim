# Interactions de connexion

Dans la leçon précédente, nous avons créé une vue de connexion et, grâce à des boutons et à une logique de vérification, nous avons réalisé une validation simple du contenu saisi.

Dans cette leçon, nous allons continuer à partir du code de la leçon précédente pour apprendre le champ de saisie de mot de passe `SecureField`, la boîte d’alerte `Alert`, ainsi que la manière de contrôler l’affichage de différentes vues selon les variables.

Grâce à cette leçon, tu pourras mieux comprendre le flux d’interaction de base d’une vue de connexion, qui constitue aussi une logique fondamentale utilisée dans de nombreuses applications.

## Champ de saisie du mot de passe

Lors de la leçon précédente, nous avons utilisé `TextField` pour saisir le mot de passe.

Mais dans une véritable interface de connexion, le mot de passe n’est généralement pas affiché directement. Il apparaît plutôt sous forme de points ou avec un autre effet de masquage, afin de protéger la confidentialité de l’utilisateur.

Dans SwiftUI, le contrôle spécialement destiné à la saisie du mot de passe est `SecureField`.

Par exemple :

```swift
SecureField("Password", text: $password)
```

Sa syntaxe ressemble beaucoup à celle de `TextField`. Il a également besoin d’un texte d’indication et d’une variable liée.

On peut simplement le comprendre ainsi : `SecureField` est aussi un champ de saisie, sauf qu’il masque le contenu saisi.

Nous pouvons directement remplacer le `TextField` utilisé à l’origine pour saisir le mot de passe par `SecureField` :

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Lorsque l’utilisateur saisit un mot de passe, son contenu n’est plus affiché directement dans l’interface.

Effet d’affichage :

![password](../../Resource/020_password.png)

Maintenant, nous pouvons saisir le nom d’utilisateur et le mot de passe, puis cliquer sur le bouton pour vérifier si la saisie est correcte.

### Afficher des messages de retour

Auparavant, nous avons toujours utilisé `print` pour afficher les résultats.

Le contenu de `print` n’apparaît que dans la console. Les développeurs peuvent le voir lorsqu’ils exécutent le programme dans Xcode, mais les utilisateurs ordinaires sur téléphone ne peuvent pas voir ces messages.

Autrement dit, même si le programme a déjà effectué la vérification, l’utilisateur ne sait pas si le contenu saisi est correct.

À ce moment-là, nous avons besoin d’un moyen d’afficher directement des messages dans l’interface.

## Boîte d’alerte Alert

Dans SwiftUI, nous pouvons utiliser `Alert` pour afficher une boîte de message contextuelle.

Utilisation de base :

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ce morceau de code semble un peu plus complexe que les contrôles précédents, mais nous pouvons le comprendre en le décomposant.

`Alert` contient principalement les parties suivantes :

- `"Title"` : le titre de la boîte d’alerte
- `isPresented` : une valeur booléenne liée servant à contrôler l’affichage de la boîte d’alerte
- `Button(...)` : le bouton de la boîte d’alerte
- `message:` : le contenu du message affiché dans la boîte d’alerte

On peut simplement le comprendre ainsi : lorsque la variable liée devient `true`, le système affiche cette boîte d’alerte.

Effet d’affichage :

![alert](../../Resource/020_alert3.png)

Structure correspondante :

![alert](../../Resource/020_alert.png)

### Alert est un modificateur

Comme beaucoup de modificateurs que nous avons appris auparavant, `Alert` s’ajoute également derrière une certaine vue.

Par exemple, il peut être attaché derrière un bouton :

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Il peut aussi être attaché derrière le `VStack` externe :

```swift
VStack {
    // ...
}
.alert() {...}
```

Autrement dit, `Alert` n’est pas une vue indépendante placée seule dans l’interface, mais un modificateur attaché à une certaine vue.

On peut simplement le comprendre ainsi : `Alert` s’écrit généralement après un bouton ou après la mise en page extérieure, afin d’afficher un message lorsqu’une certaine condition est remplie.

### Afficher Alert

Si nous voulons afficher un `Alert`, nous avons besoin d’une variable pour le contrôler.

Par exemple :

```swift
@State private var showAlert = false
```

Cette variable est de type `Bool`, c’est-à-dire qu’elle n’a que deux valeurs : `true` ou `false`.

Ensuite, nous la lions à `isPresented` de `Alert` :

```swift
isPresented: $showAlert
```

Lorsque `showAlert` vaut `false`, la boîte d’alerte ne s’affiche pas ; lorsque `showAlert` vaut `true`, elle s’affiche.

### Afficher la boîte d’alerte via le bouton

Maintenant, commençons par mettre en œuvre le scénario le plus simple :

Lorsque l’utilisateur ne saisit rien du tout et clique directement sur le bouton `Sign in`, une boîte de message s’affiche pour lui dire : « Tu n’as encore saisi aucun contenu. »

Tout d’abord, crée une variable pour contrôler cette boîte de message :

```swift
@State private var showEmpty = false
```

Ensuite, ajoute un `Alert` derrière `Button` :

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Ensuite, effectue la vérification dans le code du clic sur le bouton :

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Si `user` et `password` sont tous les deux vides, nous changeons `showEmpty` en `true`.

Et comme `Alert` est lié à cette variable, lorsque celle-ci devient `true`, le système affichera automatiquement la boîte d’alerte.

Effet d’affichage :

![alert](../../Resource/020_alert1.png)

De cette façon, après avoir cliqué sur le bouton, l’utilisateur peut immédiatement voir le message, sans que le développeur ait besoin d’aller vérifier la sortie de `print` dans la console.

### Améliorer le bouton et la boîte d’alerte

Auparavant, nous n’avions traité que le cas où « rien n’a été rempli ».

Nous devons aussi traiter les situations suivantes :

- le nom d’utilisateur n’est pas renseigné
- le mot de passe n’est pas renseigné
- le nom d’utilisateur et le mot de passe sont renseignés, mais la saisie est incorrecte

Nous devons donc également préparer les messages correspondants pour ces cas.

Tout d’abord, ajoute trois nouvelles variables :

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Puis continue d’ajouter les `Alert` correspondants derrière le bouton :

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Ensuite, complète la logique de vérification dans le bouton :

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Lorsque le bouton détermine que l’utilisateur n’a rempli aucune information, qu’il en a oublié une, ou que la validation de la saisie a échoué, il modifie la variable booléenne correspondante en `true`, puis l’`Alert` correspondant s’affiche.

Ici, je te recommande de tester toi-même plusieurs situations :

- ne rien remplir
- ne remplir que le nom d’utilisateur
- ne remplir que le mot de passe
- remplir le nom d’utilisateur et le mot de passe, mais avec un contenu incorrect
- remplir le nom d’utilisateur et le mot de passe, avec un contenu correct

Cela permet de vérifier si notre code contient des problèmes. C’est aussi une étape de « test » très importante dans le développement d’applications.

Si, dans un certain scénario, le programme se comporte mal, cela signifie qu’il peut y avoir un problème dans la logique et qu’un `Bug` est apparu dans le programme.

Ce que l’on appelle souvent un `Bug` dans le développement désigne une erreur, une faille ou un comportement qui ne correspond pas aux attentes.

## Terminer la vue de connexion

Les `Alert` dont nous avons parlé plus haut servaient tous à indiquer à l’utilisateur comment recevoir un message lorsque « la saisie est incorrecte ».

Lorsque l’utilisateur saisit correctement le nom d’utilisateur et le mot de passe, nous n’affichons généralement pas de « boîte d’alerte », mais nous passons directement à l’interface après la connexion.

Cela touche à un point de connaissance très important : **afficher différentes vues en fonction de la valeur d’une variable.**

Par exemple :

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Ici, nous utilisons le type `Bool` pour gérer l’affichage de la vue :

- si `login` vaut `true`, cela signifie que la connexion a réussi, et le contenu après connexion s’affiche
- si `login` vaut `false`, cela signifie que la connexion n’a pas réussi, et l’interface de connexion continue de s’afficher.

Bien que l’instruction `if` soit une instruction conditionnelle de Swift, dans le `body` de SwiftUI, elle peut être utilisée pour contrôler la logique d’affichage des vues.

Autrement dit, SwiftUI déterminera quelle vue doit être affichée actuellement selon le résultat de la condition.

Nous pouvons placer cette logique d’affichage dans le `ContentView` actuel :

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Ici, nous avons ajouté une nouvelle variable `login`, utilisée pour indiquer si l’utilisateur s’est déjà connecté avec succès.

Ensuite, nous avons placé derrière l’instruction `else` le code de la vue de connexion que nous avions déjà écrit auparavant.

Logique d’affichage de la vue :

- lorsque `login` vaut `false`, cela signifie que la connexion n’a pas encore réussi, donc la vue de connexion d’origine continue de s’afficher.
- lorsque `login` vaut `true`, cela signifie que la connexion a réussi ; à ce moment-là, la vue de connexion ne s’affiche plus, et c’est `Login successful` qui s’affiche.

Autrement dit, `ContentView` affichera un contenu de vue différent selon la valeur de `login`.

Ensuite, modifions la logique de réussite de la connexion dans le bouton :

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Lorsque le nom d’utilisateur et le mot de passe saisis par l’utilisateur sont tous les deux corrects, nous changeons `login` en `true`.

Dès que la valeur de `login` change, le résultat du test `if` dans `ContentView` change lui aussi, et l’interface passe de la vue de connexion d’origine à `Login successful`.

L’effet d’affichage est le suivant :

![view](../../Resource/020_view.png)

Maintenant, nous avons vraiment appliqué à cette page de connexion actuelle l’idée de « montrer différentes vues selon la condition ».

Dans les applications réelles, c’est généralement aussi ce mode de fonctionnement : différentes vues s’affichent selon une certaine valeur.

Par exemple, lorsque l’utilisateur n’est pas connecté, la page de connexion s’affiche ; lorsqu’il se connecte avec succès, une autre interface s’affiche.

L’idée centrale est : **contrôler le contenu affiché par l’interface grâce aux changements de variables.**

## Résumé

Dans cette leçon, nous avons appris trois points importants :

1. Utiliser `SecureField` pour saisir le mot de passe, afin que son contenu ne s’affiche pas directement dans l’interface.
2. Utiliser `Alert` pour montrer des messages à l’utilisateur, au lieu de les afficher seulement dans la console.
3. Utiliser des variables et des conditions `if` pour contrôler l’affichage de différentes vues et réaliser le passage entre l’interface avant et après la connexion.

Grâce à ces connaissances, nous sommes désormais capables de réaliser une vue de connexion avec des interactions de base, et de mieux comprendre l’idée de développement dans SwiftUI : « l’état change, l’interface se met à jour ».

## Code complet

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Connaissances étendues - Alert avec plusieurs boutons

Dans la partie précédente de cette leçon, nous avons utilisé le `Alert` le plus basique, qui ne contient qu’un seul bouton et sert principalement à avertir l’utilisateur.

En réalité, `Alert` peut aussi contenir plusieurs boutons, afin de permettre à l’utilisateur de faire différents choix.

Par exemple :

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Lorsque l’on clique sur le bouton, une boîte de message avec trois options s’affiche : `Ok`, `delete` et `cancel`.

Effet d’affichage :

![alert](../../Resource/020_alert2.png)

Cliquer sur différents boutons exécutera le code correspondant.

### La propriété role de Button

Ici, tu remarqueras que le `Button` à l’intérieur de `Alert` est un peu différent de la syntaxe du bouton classique que nous avons apprise auparavant :

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Ici, il y a un paramètre supplémentaire, `role`.

Dans SwiftUI, `role` est utilisé pour indiquer au système à quel type d’action appartient ce bouton.

Quelques rôles courants :

- `.cancel` : action d’annulation
- `.destructive` : action dangereuse, par exemple supprimer
- `nil` : action normale

Différentes valeurs de `role` entraînent généralement aussi des différences de style visuel dans l’interface.

Par exemple, les actions dangereuses sont souvent affichées avec un style plus voyant pour rappeler à l’utilisateur de cliquer avec prudence.

De plus, `role` fournit également des informations sémantiques supplémentaires pour le bouton, ce qui aide les lecteurs d’écran (comme VoiceOver sur les appareils Apple) à expliquer sa fonction à l’utilisateur.

Par conséquent, dans des situations appropriées, ajouter `role` à un bouton est une très bonne habitude.
