# Tirelire

Dans cette leçon, nous allons développer un petit projet de "tirelire". Ses fonctionnalités sont simples, mais il inclut une logique d'interaction complète, ce qui le rend très adapté aux débutants.

À travers ce projet, nous allons apprendre `TextField` (champ de saisie), `border` (bordure) et la liaison de données (`$`).

L'objectif final est de réaliser un projet de "tirelire" dans lequel on peut saisir un montant, cliquer sur un bouton pour le sauvegarder, puis accumuler automatiquement la somme totale.

Résultat attendu :

![Piggy Bank](../../RESOURCE/014_view.png)

## Afficher le montant total

Commençons par afficher le montant total de la tirelire dans la vue.

Dans `ContentView`, déclarons une variable pour enregistrer le montant total de la tirelire.

```swift
@State private var amount = 0
```

Ensuite, affichons ce montant avec `Text` :

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Ici, `.font` et `.fontWeight` servent à régler la taille et l'épaisseur de la police.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

Lorsque `amount` change, le montant total affiché par `Text` se met lui aussi à jour automatiquement.

## Saisir un montant

La "tirelire" ne doit pas seulement afficher le montant total, elle doit aussi permettre à l'utilisateur de saisir un montant à déposer ou à retirer. Pour cela, nous devons utiliser le contrôle de vue `TextField` de SwiftUI.

### `TextField`

`TextField` est un contrôle SwiftUI utilisé pour saisir du contenu, généralement sur une seule ligne.

`TextField` propose principalement deux formats de liaison :

**1. Liaison à un type chaîne (`String`)**

```swift
TextField("Placeholder", text: $text)
```

Cela convient aux entrées textuelles comme un nom ou un titre.

**2. Liaison à un type numérique (`Int`/`Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

Cela convient à des données comme l'âge, le salaire ou un montant.

`format: .number` signifie que le champ sera analysé et affiché au format numérique.

#### Texte d'espace réservé

Le premier paramètre de `TextField` est le texte d'espace réservé (`Placeholder`), qui sert à indiquer à l'utilisateur ce qu'il doit saisir :

```swift
TextField("input your name", text: $text)
```

Lorsque le champ de saisie est vide, un texte d'aide gris s'affiche.

![textfield](../../RESOURCE/014_textfield.png)

#### Liaison de données

`TextField` n'est pas responsable de la persistance des données saisies ; il faut gérer ces données via une variable liée.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Le contenu saisi par l'utilisateur est enregistré directement dans la variable `text`, tandis que `TextField` s'occupe seulement de l'interface de saisie.

`$` représente la liaison (`Binding`) :

```swift
$text
```

Ce n'est pas une variable ordinaire, mais une valeur de type `Binding`.

Son rôle est d'établir une connexion entre la vue et les données :

lorsque l'utilisateur saisit du contenu dans `TextField`, `text` se met à jour automatiquement ; et lorsque `text` change, `TextField` se met lui aussi à jour en conséquence.

Par exemple :

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

Quand on saisit du contenu dans `TextField`, le `Text` au-dessus s'affiche en temps réel.

![textField](../../RESOURCE/014_textfield1.png)

### Liaison à un type numérique

Lorsqu'on veut saisir un nombre, il faut lier le champ à une variable de type correspondant :

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Quand l'utilisateur saisit un montant, `TextField` analyse la valeur saisie et met automatiquement à jour `number`.

## Ajouter le champ de saisie

Une fois les bases de `TextField` comprises, appliquons-les au projet de tirelire.

La tirelire doit permettre de saisir un "montant", nous utilisons donc la liaison à un type numérique (`Int/Double`) et ajoutons une variable `number` pour enregistrer la valeur saisie par l'utilisateur :

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
		}
    }
}
```

Maintenant, `TextField` affiche par défaut la valeur de `number`, qui vaut initialement `0`.

Quand on efface le contenu du champ, le texte d'espace réservé `"Amount"` apparaît.

Cela montre une nouvelle fois que `TextField` affiche la valeur de la variable liée, et non un contenu qu'il enregistrerait lui-même.

### Problème de taille du champ

Dans la vue actuelle, on remarque que `TextField` n'a pas de bordure, affiche simplement un `0`, et que le contenu semble aligné à gauche.

Le résultat est le suivant :

![textfield](../../RESOURCE/014_textfield2.png)

Cela vient du fait que `TextField` occupe toute la largeur de sa vue parente par défaut.

Nous pouvons le vérifier en lui ajoutant une couleur d'arrière-plan :

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Le résultat est le suivant :

![textfield](../../RESOURCE/014_textfield3.png)

On voit que `TextField` remplit en réalité toute la largeur de la ligne.

### Définir une largeur fixe

Si nous voulons un champ de saisie plus compact, nous pouvons utiliser `frame` pour limiter sa largeur :

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Résultat :

![textfield](../../RESOURCE/014_textfield4.png)

### Ajouter une bordure et une marge interne

Comme `TextField` n'a pas de bordure par défaut, nous pouvons lui ajouter manuellement un style :

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Le champ de saisie ressemble maintenant davantage à un "champ standard".

![textfield](../../RESOURCE/014_textfield5.png)

## Bordure

Dans SwiftUI, `border` sert à ajouter une bordure à une vue.

Utilisation de base :

```swift
border(Color.black, width: 1)
```

Ici, `Color.black` représente la couleur de la bordure et `width` son épaisseur.

Dans le `TextField`, nous utilisons :

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Cela signifie que nous ajoutons au champ une bordure noire d'une largeur de `1 pt`.

Vous pouvez aussi essayer d'autres couleurs, comme `Color.blue`, `Color.green`, ou bien épaissir la bordure avec `width: 2`.

## Bouton de sauvegarde

Nous avons maintenant une variable `amount` pour afficher le montant total, un `TextField` pour saisir un montant, ainsi qu'une variable `number` liée à ce champ.

Le code actuel est le suivant :

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
		}
    }
}
```

### Ajouter un bouton

Nous devons maintenant ajouter un bouton qui déclenchera l'opération de sauvegarde.

```swift
Button("Save") {
    
}
```

### Mettre en place la logique de sauvegarde

Nous voulons permettre à l'utilisateur de saisir un montant, puis, lorsqu'il clique sur le bouton, d'ajouter automatiquement ce montant au total.

```swift
Button("Save") {
    amount += number
}
```

Ici, nous utilisons un opérateur d'affectation composée pour ajouter le montant saisi `number` au total `amount`.

### Réinitialiser le montant saisi

Il y a maintenant un problème : après avoir cliqué sur le bouton, le montant affiché dans le champ ne disparaît pas.

Si l'utilisateur saisit `10`, puis clique sur sauvegarder, le champ continue à afficher `10`, ce qui gêne la saisie du montant suivant.

Cela vient du fait que `TextField` est lié à `number`. Quand on clique sur le bouton, nous modifions seulement `amount`, mais `number` ne change pas, donc le champ affiche toujours l'ancienne valeur.

Nous devons donc ajouter une logique d'effacement : après avoir additionné le montant saisi, on réinitialise la valeur du champ :

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Désormais, lorsque l'utilisateur saisit un montant puis clique sur le bouton, le montant est ajouté au total, puis `number` est remis à `0`, ce qui facilite la saisie suivante.

Nous avons ainsi mis en place toute la logique de dépôt de notre "tirelire".

## Améliorer la vue

Une fois la fonctionnalité terminée, nous pouvons améliorer légèrement l'interface en ajoutant une image de fond et un style de bouton.

Ajouter un style de bouton :

```swift
.buttonStyle(.borderedProminent)
```

Ajouter une image de fond :

```swift
.background {
    Image("1")
}
```

Nous avons maintenant terminé tout le développement de la "tirelire".

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
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Résultat obtenu :

![Piggy Bank](../../RESOURCE/014_view.png)

Nous pouvons maintenant essayer de déposer `100` ou plus afin de vérifier si la logique de la "tirelire" comporte des problèmes.

Vous pouvez aussi exécuter la tirelire sur le simulateur ou sur un appareil réel afin de tester l'application que nous avons développée.

### Sortie de débogage

Pour vérifier si la logique est correcte, nous pouvons aussi ajouter un affichage de débogage dans le bouton, afin de valider le montant saisi :

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

À chaque dépôt et à chaque clic sur le bouton, nous pouvons voir la sortie correspondante dans la `Console` afin de vérifier si la logique comporte un problème.

```
---Saving---
amount:11
number:0
```
