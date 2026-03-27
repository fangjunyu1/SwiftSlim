# Compteur

Dans les deux leçons précédentes, nous avons appris les variables, les constantes, les boutons et les fonctions.

Dans cette leçon, nous allons combiner ces connaissances pour créer une petite application de compteur.

Dans cet exemple, nous allons apprendre à enregistrer et modifier une variable, ainsi qu'à utiliser `@State` pour gérer cette variable.

## Réaliser un compteur

Un compteur sert généralement à enregistrer une quantité qui doit s'accumuler en permanence, par exemple le nombre de sauts à la corde ou le nombre de tours de course.

Nous allons maintenant réaliser un compteur simple : afficher un nombre et un bouton, puis augmenter le nombre lorsqu'on clique sur le bouton.

![Num](../../RESOURCE/009_num.png)

### Afficher le nombre

Commençons par afficher un nombre avec `Text`.

```swift
Text("0")
```

Mais si le nombre doit changer, nous ne pouvons pas laisser `"0"` en dur. Nous devons utiliser une variable pour enregistrer ce nombre.

```swift
var num = 0
```

Puis afficher la variable dans `Text` :

```swift
Text("\(num)")
```

Ici, nous utilisons l'interpolation de chaîne `\()` pour convertir le nombre en chaîne afin de l'afficher.

### Ajouter un bouton pour augmenter le nombre

Ensuite, ajoutons un bouton.

```swift
Button("+") {

}
.buttonStyle(.borderedProminent)
```

Quand le bouton est cliqué, nous voulons que le nombre augmente.

Nous pouvons donc modifier la variable dans le bouton :

```swift
Button("+") {
    num = num + 1
}
.buttonStyle(.borderedProminent)
```

Ce code signifie : lorsque l'on clique sur le bouton, on calcule `num + 1`, puis on réaffecte le résultat à `num`.

### Une écriture plus concise

Swift fournit une écriture plus concise :

```swift
num += 1
```

Elle est équivalente à :

```swift
num = num + 1
```

Cette écriture s'appelle un opérateur d'affectation composée.

Les opérateurs d'affectation composée courants en Swift sont :

```
+=   affectation par addition
-=   affectation par soustraction
*=   affectation par multiplication
/=   affectation par division
%=   affectation par modulo
```

Par exemple :

```swift
num -= 2   // num = num - 2
num *= 3   // num = num * 3
```

### Code complet

Nous pouvons maintenant écrire un compteur simple :

```swift
struct ContentView: View {
    var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Mais à ce stade, le code ne fonctionne pas correctement.

### Une erreur apparaît

Xcode affiche :

```
Cannot assign to property: 'self' is immutable
```

Cela signifie qu'il est impossible de modifier la propriété, car la vue est immuable.

Pourquoi cela se produit-il ?

## Le fonctionnement de SwiftUI

Dans SwiftUI, **l'interface est pilotée par les données**, ce qui signifie que lorsque les données changent, l'interface se rafraîchit automatiquement.

Mais il faut noter qu'en SwiftUI, ce n'est que lorsque l'état change, par exemple avec `@State` ou `@Binding`, que SwiftUI surveille la modification et rafraîchit la vue.

Si l'on utilise une variable ordinaire, SwiftUI ne lit sa valeur qu'une seule fois lors de la création de la vue. Ensuite, même si la variable change, l'interface ne se met pas à jour.

Par exemple :

```swift
var num = 0   // 0
num = 1   // 0
```

Dans l'exemple ci-dessus, `num` est une variable ordinaire. Même si sa valeur change, SwiftUI ne mettra pas à jour la vue, et l'interface affichera toujours le `0` initial.

![Num](../../RESOURCE/009_state.png)

Ainsi, ce n'est que lorsque les données sont marquées comme état, par exemple via des wrappers de propriété comme `@State` ou `@Binding`, que SwiftUI surveille automatiquement leurs changements et met à jour la vue.

## Le wrapper de propriété `@State`

Dans SwiftUI, si l'on veut modifier une variable et mettre à jour l'interface, il faut utiliser `@State`.

```swift
@State var num = 0
```

`@State` permet à SwiftUI de surveiller cette variable.

Lorsque la variable change, SwiftUI recalcule la vue et la met à jour.

Code complet :

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack {
			Text("\(num)")
        	Button("+") {
        	    num += 1
        	}
        	.buttonStyle(.borderedProminent)
		}
    }
}
```

Désormais, quand on clique sur le bouton :

```swift
num += 1
```

SwiftUI détecte que `num` a changé, puis met automatiquement la vue à jour.

![Num](../../RESOURCE/009_state1.png)

## Règles d'utilisation de `@State`

Dans le développement réel, `@State` suit généralement deux règles.

### 1. `@State` utilise généralement `private`

Les variables `@State` sont généralement utilisées uniquement dans le type courant, par exemple la structure `View` actuelle. C'est pourquoi on écrit souvent :

```swift
@State private var num = 0
```

Cela permet d'éviter que d'autres vues accèdent directement à cette variable ou la modifient.

Nous n'avons pas encore étudié `private`, mais vous pouvez simplement le comprendre ainsi :

**ce qui est marqué par `private` ne peut être utilisé que dans la vue actuelle ; les vues extérieures n'y ont pas accès.**

### 2. `@State` ne sert qu'à l'état propre à la vue courante

`@State` convient aux données gérées par la vue elle-même.

Par exemple, le contenu d'un champ de saisie ou l'état d'un interrupteur :

```swift
@State private var isOn = false
@State private var text = ""
```

Si les données doivent être partagées entre plusieurs vues, il faut utiliser d'autres types d'état, par exemple `@Binding` ou `@Observable`.

Nous verrons ces notions dans les leçons suivantes.

### Bouton de diminution

Un compteur ne doit pas seulement augmenter, il peut aussi diminuer.

Nous pouvons ajouter un bouton `-`.

```swift
Button("-") {
    num -= 1
}
.buttonStyle(.borderedProminent)
```

Puis utiliser `HStack` pour disposer les boutons horizontalement :

```swift
HStack {
    Button("+") {
        num += 1
    }
    .buttonStyle(.borderedProminent)
    Button("-") {
        num -= 1
    }
    .buttonStyle(.borderedProminent)
}
```

Résultat :

![Num](../../RESOURCE/009_num1.png)

Quand on clique sur le bouton `+`, le nombre augmente de `1` ; quand on clique sur le bouton `-`, il diminue de `1`.

### Bouton de réinitialisation

Nous pouvons également ajouter un bouton de réinitialisation pour remettre le nombre à `0`.

```swift
Button("0") {
    num = 0
}
.buttonStyle(.borderedProminent)
```

Quand on clique sur ce bouton, `num` reçoit la valeur `0`.

Résultat :

![Num](../../RESOURCE/009_num2.png)

En cliquant sur le bouton `0`, le nombre redevient `0`.

### Bouton personnalisé

Pour l'instant, nos boutons ne peuvent afficher que du texte :

```swift
Button("+") {

}
```

Avec cette écriture, le bouton ne peut afficher qu'un contenu textuel, comme `+` ou `-`.

Dans le développement réel, nous souhaitons souvent des boutons avec un rendu plus riche, par exemple des icônes ou d'autres vues.

SwiftUI nous permet de personnaliser le contenu affiché du bouton. Pour cela, on peut utiliser une autre écriture :

```swift
Button(action: {

}, label: {

})
```

Dans cette écriture, `action` représente le code exécuté au clic, et `label` représente la vue affichée par le bouton.

Par exemple, nous pouvons faire afficher au bouton une icône `SF Symbols` :

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
})
```

Ainsi, le bouton n'affiche plus du texte, mais une icône.

### Améliorer l'interface du compteur

Pour rendre l'interface du compteur plus claire, nous pouvons aussi ajuster le style d'affichage du nombre, par exemple en l'agrandissant :

```swift
Text("\(num)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Ensuite, nous remplaçons aussi le contenu affiché des boutons par des icônes, et nous agrandissons légèrement la taille de ces icônes :

```swift
Button(action: {
    num += 1
}, label: {
    Image(systemName: "plus.app")
        .imageScale(.large)
})
```

De la même manière, nous pouvons aussi transformer le bouton de diminution et le bouton de réinitialisation en boutons à icônes :

```swift
Button(action: {
    num -= 1
}, label: {
    Image(systemName: "minus.square")
        .imageScale(.large)
})

Button(action: {
    num = 0
}, label: {
    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
        .imageScale(.large)
})
```

Désormais, les boutons affichent des icônes `SF Symbols`, et l'interface devient plus intuitive.

![Num](../../RESOURCE/009_num3.png)

## Résumé

Dans cette leçon, nous avons mis en pratique de façon combinée les variables, `Text` et `Button` en réalisant un compteur simple. Nous avons utilisé une variable pour enregistrer le nombre, puis des boutons pour l'augmenter ou le diminuer, tout en apprenant les opérateurs d'affectation composée comme `num += 1` et `num -= 1`.

Pendant la réalisation, nous avons aussi compris le fonctionnement de SwiftUI : l'interface est pilotée par les données. Ce n'est que lorsque les données changent que l'interface se rafraîchit. Il faut donc utiliser `@State` pour enregistrer un état modifiable. Quand une variable `@State` change, SwiftUI met automatiquement la vue à jour.

Enfin, nous avons apporté quelques améliorations à l'interface, en ajustant le style du texte avec une police plus grande et en utilisant `Button(action:label:)` pour personnaliser le contenu des boutons, afin qu'ils puissent afficher des icônes. Le compteur devient ainsi plus clair et plus agréable visuellement.

À ce stade, nous avons déjà découvert la manière de base d'utiliser les vues SwiftUI. En SwiftUI, la majorité des interfaces sont pilotées par des variables. Quand ces variables changent, SwiftUI met automatiquement les vues à jour. Ainsi, dans le développement SwiftUI, nous devons souvent commencer par concevoir les données à enregistrer, puis construire l'interface et la logique d'interaction à partir de ces données.

## Code complet

```swift
struct ContentView: View {
    @State var num = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("\(num)")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack {
                Button(action: {
                    num += 1
                }, label: {
                    Image(systemName: "plus.app")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num -= 1
                }, label: {
                    Image(systemName: "minus.square")
                        .imageScale(.large)
                })
                
                Button(action: {
                    num = 0
                }, label: {
                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                        .imageScale(.large)
                })
            }
        }
    }
}
```
