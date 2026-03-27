# Enregistrer le montant de la tirelire

Dans la leçon précédente, nous avons réalisé une petite "tirelire". Dans cette leçon, nous allons apprendre à sauvegarder son montant de manière persistante.

Cette leçon porte principalement sur `UserDefaults` et sur le wrapper de propriété `@AppStorage`. Nous en profiterons aussi pour approfondir le rôle de `onAppear` ainsi que l'utilisation des types optionnels (`nil`).

Il faut noter que cette leçon réutilise le code de la "tirelire" développé dans la leçon précédente.

## Le problème de la sauvegarde persistante

Actuellement, l'interface de la "tirelire" est très simple et assez pratique à utiliser.

![Piggy Bank](../../Resource/014_view.png)

Mais elle présente un problème évident : chaque fois que la vue est rafraîchie ou que l'application est fermée, le montant total de la tirelire revient à `0`, et tout l'argent enregistré auparavant disparaît.

Cela signifie que les données ne sont pas réellement sauvegardées. Autrement dit, la "tirelire" actuelle ne peut stocker que des données temporaires.

### Pourquoi la sauvegarde n'est-elle pas persistante ?

Cela vient du fait que nous utilisons une variable déclarée avec `@State` :

```swift
@State private var amount = 0
```

Une variable déclarée avec `@State` dépend entièrement du cycle de vie de la vue.

Lorsque la vue est créée, `amount` est initialisé à `0`. Lorsque la vue est détruite, `amount` est détruit lui aussi.

Les données de `amount` existent donc uniquement en mémoire, sans être enregistrées sur l'appareil.

Comme nous ne voulons pas que `amount` soit lié au cycle de vie de la vue, nous devons mettre en place une sauvegarde persistante, autrement dit enregistrer ces données sur l'appareil.

### Qu'est-ce que la "persistance des données" ?

La persistance des données peut se comprendre comme le passage des données de la "mémoire temporaire" vers le "stockage de l'appareil".

Ainsi, lorsque la vue est fermée ou que l'application est quittée, les données ne sont pas perdues.

En développement Swift, une persistance simple peut être réalisée avec `UserDefaults`. Pour des données plus complexes, on utilisera plutôt `SwiftData` ou `CoreData`.

Dans cette leçon, nous allons d'abord apprendre la solution la plus simple : `UserDefaults`.

## `UserDefaults`

`UserDefaults` sert à enregistrer des données légères sous forme de paires clé-valeur, généralement des types de base comme `String`, `Int`, `Double` ou `Bool`.

### Sauvegarder des données

`UserDefaults` enregistre des données avec la méthode `set` :

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Le premier paramètre de `UserDefaults` représente la donnée à enregistrer. Ici, on lui passe des types comme `String` ou `Int`.

Le second paramètre `forKey` joue un rôle semblable à un nom de variable et sert à identifier la donnée sauvegardée dans `UserDefaults`.

### Lire les données

`UserDefaults` lit les données avec des méthodes correspondantes :

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Lors de la lecture, il faut utiliser la méthode correspondant au bon type, sinon on risque une erreur ou une valeur incorrecte.

### Remarques sur `UserDefaults`

#### 1. Retourne un type optionnel

Lorsque l'on lit des données avec `UserDefaults`, certaines méthodes renvoient un type optionnel (`Optional`).

Par exemple :

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Le type renvoyé par `name` est :

```swift
String?
```

Cela signifie qu'il peut y avoir une valeur... ou pas.

**Pourquoi retourne-t-on un type optionnel ?**

Parce qu'une certaine clé dans `UserDefaults` ne possède pas forcément de donnée correspondante.

Par exemple :

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Si la clé `"City"` n'a jamais été sauvegardée auparavant, le résultat de lecture sera :

```swift
nil
```

Il faut insister sur le fait que `nil` signifie absence de donnée, et non pas chaîne vide.

Dans la leçon sur le "système de types", nous avons déjà rencontré une situation semblable : lorsqu'une conversion de type échoue, elle renvoie un type optionnel.

Dans ce cas, nous devons utiliser `??` pour fournir une valeur par défaut et déballer l'optionnel :

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Si `UserDefaults` lit une donnée, on utilise cette valeur ; si aucune valeur n'est trouvée (`nil`), on utilise la valeur par défaut.

#### 2. Retourne un type non optionnel

Lorsque `UserDefaults` lit des valeurs de type `Int`, `Double` ou `Bool`, il renvoie un type non optionnel.

Par exemple :

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Même si ces clés n'ont jamais été sauvegardées, les valeurs retournées ne seront pas `nil`.

À la place, elles prennent une valeur par défaut :

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Limite de volume des données

`UserDefaults` n'est adapté qu'à la sauvegarde de petites quantités de données, comme des réglages d'application ou des états simples.

Dans la pratique, il n'est pas adapté à de gros volumes de données ni à des lectures/écritures très fréquentes.

## Sauvegarder le montant de la "tirelire"

Nous pouvons maintenant utiliser `UserDefaults` pour mettre en place la logique de sauvegarde du montant total de la tirelire.

Quand l'utilisateur clique sur le bouton, le montant saisi est ajouté au total, puis le montant total est enregistré dans `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Nous avons ainsi mis en place la logique d'écriture des données.

## Explication de la logique de persistance

Même si nous avons déjà mis en place la logique d'écriture persistante, nous remarquons en pratique que chaque fois que la vue se recharge ou que l'application est relancée, la variable `amount` reste à `0`.

Cela vient du fait que :

```swift
@State private var amount = 0
```

Dans SwiftUI, une variable `@State` est réinitialisée à chaque création de vue.

Même si la valeur de `amount` a bien été enregistrée dans `UserDefaults`, elle revient à `0` lorsque la vue est rechargée.

Cela signifie qu'à ce stade nous avons seulement sauvegardé les données dans `UserDefaults`, mais nous ne les avons pas encore restaurées dans la vue.

Il faut donc, lors du chargement de la vue, relire les données depuis `UserDefaults` et les réaffecter à `amount`, afin de compléter toute la logique de persistance.

### Analogie logique

On peut comprendre ce processus en le comparant à un tableau de classe :

Pendant un cours, l'enseignant écrit le contenu au tableau. Cela correspond à l'état courant de la vue (`@State`).

Quand le cours se termine, le tableau est effacé pour préparer la séance suivante. Cela correspond à la destruction de la vue, et donc à l'effacement des données stockées dans `@State`.

Pour éviter de perdre le contenu, l'enseignant l'a sauvegardé à l'avance dans un support de cours. Ce support correspond aux données enregistrées dans `UserDefaults`.

Quand le cours suivant commence, le tableau est vide (`@State` est réinitialisé), et l'enseignant doit réécrire l'ancien contenu à partir du support (`UserDefaults`).

Il faut comprendre que le tableau ne restaure pas automatiquement son ancien contenu. Il faut nécessairement "relire le support", c'est-à-dire relire les données depuis `UserDefaults`.

## Lire les données avec `onAppear`

Lorsque la vue s'affiche, il faut lire manuellement la valeur enregistrée dans `UserDefaults` puis l'affecter à la variable `@State amount`, afin de réaliser une vraie persistance.

Dans SwiftUI, on peut utiliser `onAppear` pour exécuter une logique d'initialisation lorsque la vue apparaît :

```swift
.onAppear {}
```

Plaçons le code de lecture de `UserDefaults` dans `onAppear` :

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Quand la vue est créée, `amount` est initialisé à `0`. Quand la vue apparaît, `onAppear` est déclenché, lit la valeur depuis `UserDefaults` et la réaffecte à `amount`. Ainsi, la vue peut afficher le dernier montant total sauvegardé.

À présent, toute la logique de persistance de la "tirelire" est complète.

## Code complet

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Le wrapper de propriété `@AppStorage`

SwiftUI fournit le wrapper de propriété `@AppStorage`, qui permet de simplifier la logique de sauvegarde avec `UserDefaults`.

```
@AppStorage("amount") private var amount = 0
```

`@AppStorage` est un encapsulage de `UserDefaults`, et `"amount"` correspond à la clé dans `UserDefaults`.

Lorsque la vue est créée, les données sont lues depuis `UserDefaults` ; lorsque la variable change, elles sont automatiquement réécrites dans `UserDefaults`.

Il prend aussi en charge le mécanisme de mise à jour d'état de SwiftUI : comme `@State`, il rafraîchit la vue SwiftUI lorsqu'il change.

Autrement dit, `@AppStorage` permet à la fois la lecture et la sauvegarde des données, sans avoir à appeler manuellement `UserDefaults`, ni à utiliser `onAppear` pour relire les données.

Nous pouvons donc remplacer `UserDefaults` dans notre code par `@AppStorage` :

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Résumé

Cette leçon a principalement présenté les connaissances suivantes :

Tout d'abord, `UserDefaults` sert à sauvegarder des données légères. Nous l'avons utilisé pour enregistrer le montant total sur l'appareil. `UserDefaults` propose des méthodes de lecture et d'écriture, et il faut aussi savoir gérer des situations comme les types optionnels.

Ensuite, les variables `@State` servent uniquement à gérer l'état temporaire d'une vue, et leur cycle de vie est lié à celui de la vue. Quand la vue est recréée, `@State` est réinitialisé.

Pour restaurer les données de `UserDefaults`, nous avons appris à utiliser `onAppear`, afin de relire les données lors de l'affichage de la vue.

Enfin, nous avons remplacé `UserDefaults` par `@AppStorage`, ce qui permet de lire automatiquement les données au chargement de la vue et de les réécrire automatiquement lorsqu'elles changent, à la place d'un appel manuel à `UserDefaults` et de la logique `onAppear`.

Grâce à ces connaissances, nous pouvons mettre en place une sauvegarde de base des données d'une application, afin de rendre ces données persistantes.

## Exercices après la leçon

À présent, la "tirelire" permet de sauvegarder un montant, mais ses fonctionnalités restent incomplètes.

1. Si l'utilisateur veut retirer de l'argent, il faut concevoir une logique de retrait correspondante.
2. S'il souhaite remettre le montant à zéro, il faut aussi une logique de réinitialisation.
3. Si vous voulez ajouter un nom à la tirelire, il faut aussi introduire la sauvegarde de données de type `String`.

Vous pouvez enrichir ces fonctionnalités sur la base du projet actuel afin de rendre la "tirelire" plus complète.

## Connaissance complémentaire - Le problème de la valeur par défaut du champ de saisie

Nous pouvons encore améliorer l'interaction avec le champ de saisie pour rendre l'entrée plus pratique.

![textfield](../../Resource/015_view.png)

Dans l'implémentation actuelle, la valeur par défaut du champ est `0`. À chaque saisie, l'utilisateur doit d'abord supprimer ce `0`, puis entrer une nouvelle valeur. Cette interaction n'est pas idéale.

Nous devrions plutôt faire en sorte que le champ soit vide au départ, au lieu d'afficher `0`.

Cela vient du fait que `TextField` et `number` sont liés de manière bidirectionnelle :

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Lorsque `number` est initialisé à `0`, le champ affiche lui aussi `0`.

Nous devons donc modifier `number` pour qu'il soit vide, c'est-à-dire `nil`.

```swift
@State private var number = nil
```

À ce moment-là, une erreur apparaît :

```
Generic parameter 'Value' could not be inferred
```

C'est exactement le cas que nous avons vu dans la leçon sur le "système de types" : lorsqu'un type ne peut pas être déduit automatiquement, il faut le déclarer explicitement.

Comme nous avons défini `number` à `nil`, et que `nil` ne contient lui-même aucune information de type, le compilateur ne peut pas savoir si cette variable doit être un `String`, un `Int` ou autre chose. C'est pourquoi l'erreur apparaît.

Nous devons donc déclarer explicitement le type de `number` :

```swift
@State private var number:Int? = nil
```

Ici, `Int?` signifie type optionnel (`Optional`), ce qui veut dire que `number` peut être soit un `Int`, soit `nil`.

Ainsi, en l'initialisant à `nil`, le champ de saisie s'affichera vide au lieu d'afficher `0`.

### Déballer un type optionnel

Lorsque nous modifions `number` pour en faire un type optionnel, le code de calcul existant provoque une erreur :

```swift
amount += number
```

Message indiqué :

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Cela vient du fait que `number` peut maintenant être `nil`. Si nous l'utilisons directement dans un calcul, cela reviendrait à écrire :

```swift
amount += nil
```

Il est évident que `nil` ne peut pas être additionné à `amount`, ce n'est donc pas une opération valide.

C'est pourquoi, lorsqu'on utilise un type optionnel dans un calcul, il faut d'abord le déballer.

Ici, on peut utiliser `??` pour fournir une valeur par défaut :

```swift
amount += number ?? 0
```

Si `number` vaut `nil`, on utilise la valeur par défaut `0`; si `number` contient une valeur, on utilise la donnée effectivement saisie.

De cette manière, nous garantissons la justesse du calcul tout en obtenant un champ vide par défaut, ce qui évite à l'utilisateur de devoir supprimer manuellement le `0`.

## Code étendu

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
