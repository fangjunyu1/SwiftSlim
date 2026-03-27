# Carrusel de cites

En aquesta lliçó, implementarem una funció de "carrusel de cites" i aprendrem més a fons conceptes bàsics de Swift com ara els arrays (Array) i les sentències de condició (if-else).

Veurem com desar diverses cites i com aconseguir-ne la rotació cíclica mitjançant la interacció amb un botó.

![alt text](../../RESOURCE/011_word.png)

## Mostrar una cita

Primer, necessitem mostrar una cita a SwiftUI.

La manera més senzilla és utilitzar la vista `Text`:

```swift
Text("Slow progress is still progress.")
```

Aquest codi només pot mostrar una cita fixa. Si volem mostrar-ne diverses i permetre el canvi entre elles, primer hem de desar-les.

Tanmateix, una variable de tipus cadena normal només pot desar una sola cita:

```swift
let sayings = "Slow progress is still progress."
```

Si volem desar diverses cites, ens caldria declarar una variable per a cadascuna:

```swift
let saying1 = "Slow progress is still progress."
let saying2 = "Difficult roads lead to beautiful destinations."
let saying3 = "Awake minds are the strongest."
let saying4 = "Long-term thinking wins over short-term tricks."
let saying5 = "Master one thing, and do it well."
```

Però en el desenvolupament real, aquesta manera no només és feixuga, sinó que, com que cada variable és independent, no podem aconseguir un canvi de cites flexible.

Per gestionar diverses cites amb comoditat, necessitem una estructura de dades que les emmagatzemi juntes: això és un array (Array).

Després d'utilitzar un array, el codi anterior es pot desar així:

```swift
let sayings = [
    "Slow progress is still progress.",
    "Difficult roads lead to beautiful destinations.",
    "Awake minds are the strongest.",
    "Long-term thinking wins over short-term tricks.",
    "Master one thing, and do it well."
    ]
```

**Consell: en les convencions de programació, els noms de variables que emmagatzemen múltiples elements solen fer-se servir en plural, com ara sayings, per reflectir que són una col·lecció.**

## Arrays

En Swift, un array és una col·lecció ordenada d'elements i es representa amb claudàtors `[]`.

```swift
[]
```

Dins d'un array hi pot haver diversos elements del mateix tipus, separats per comes angleses `,`.

Per exemple:

```swift
[101, 102, 103, 104, 105]
```

Podem entendre un array de manera senzilla com si fos un tren:

![Array](../../RESOURCE/011_array1.png)

Tot el tren representa aquest objecte array, i cada vagó està ordenat segons la seva posició.

### Índex i accés als elements

Com que els arrays són ordenats, el sistema pot localitzar un element concret segons la seva posició. Aquest mecanisme s'anomena índex (Index).

En Swift, i en la gran majoria de llenguatges de programació, els índexs dels arrays comencen a comptar des de 0, no des de 1. Això significa que el primer element té l'índex 0, el segon l'índex 1, i així successivament.

![Array](../../RESOURCE/011_array2.png)

Si volem accedir a un element concret de l'array, només cal afegir claudàtors després del nom de l'array i escriure-hi dins el valor de l'índex corresponent.

Per exemple:

```swift
sayings[0]   // 101
sayings[1]   // 102
```

Si intentem accedir a un índex que supera el rang vàlid de l'array, es produirà un problema d'"índex fora de rang" (Index Out of Range). Per això, quan accedim a arrays, hem d'assegurar-nos que l'índex sigui vàlid.

**Índex fora de rang**

Per exemple, quan un array només té 5 elements, l'interval legal d'índexs és de 0 a 4. Si intentem accedir a `sayings[5]`, el programa no podrà trobar el "vagó" corresponent i això provocarà un error d'índex fora de rang, fent que l'aplicació es tanqui inesperadament.

![Array](../../RESOURCE/011_array3.png)

### Operacions amb arrays

Els arrays no només permeten una definició estàtica, sinó també afegir, eliminar i modificar elements, així com obtenir-ne la longitud.

Consell: si necessites modificar un array, has d'utilitzar `var` per declarar la variable, i no `let`.

**1. Afegir elements**

Pots utilitzar el mètode `append` per afegir un element al final de l'array:

```swift
var num = [0, 1, 2]
num.append(3)   // [0, 1, 2, 3]
```

**2. Eliminar elements**

Amb el mètode `remove(at:)`, pots eliminar un element concret de l'array:

```swift
var num = [0, 1, 2]
num.remove(at: 0)   // [1, 2]
```

**3. Modificar elements**

Es poden modificar directament els elements de l'array utilitzant el seu índex:

```swift
var num = [0, 1, 2]
num[1] = 4   // [0, 4, 2]
```

**4. Comptar la longitud de l'array**

Utilitza la propietat `count` per obtenir el nombre d'elements de l'array:

```swift
var num = [0, 1, 2]
num.count   // 3
```

### Utilitzar arrays per mostrar cites

Per mostrar diverses cites, podem desar-les en un array i, després, accedir-hi i mostrar-les mitjançant l'índex.

Primer, creem un array `sayings` a `ContentView` per emmagatzemar les cites. Després, dins de la vista `Text`, llegim i mostrem la cita corresponent a través de l'índex:

```swift
struct ContentView: View {
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[0])
        }
        .padding()
    }
}
```

Aquí, `sayings[0]` representa la primera cita de l'array.

Si vols mostrar una cita diferent, només cal modificar el valor de l'índex dins dels claudàtors:

```swift
Text(sayings[0]) // "Slow progress is still progress."
Text(sayings[1]) // "Difficult roads lead to beautiful destinations."
```

### Definir l'índex de la cita

Per aconseguir l'efecte de canvi dinàmic de cites, no podem deixar l'índex "fixat" directament dins de la vista `Text`.

Necessitem crear una variable per desar l'índex que s'està mostrant en aquell moment.

En SwiftUI, podem utilitzar `@State` per declarar un índex mutable:

```swift
@State private var index = 0
```

SwiftUI observarà les variables embolcallades amb `@State`. Quan `index` canviï, SwiftUI tornarà a renderitzar la vista i mostrarà la cita corresponent.

Després, utilitzem `sayings[index]` per obtenir dinàmicament la cita de l'array:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    
    var body: some View {
        VStack {
            Text(sayings[index])
        }
        .padding()
    }
}
```

Quan el valor d'`index` canviï, `Text` mostrarà una cita diferent.

### Utilitzar un botó per controlar l'índex

Per controlar el canvi de cites, podem utilitzar un `Button` per modificar el valor d'`index`. Cada vegada que es premi el botó, `index` augmentarà en 1:

```swift
Button("Next") {
    index += 1
}
```

Quan premem el botó, el valor d'`index` passa de 0 a 1, la vista es refresca i `Text(sayings[index])` llegeix la següent cita.

Tanmateix, aquí hi ha un problema potencial: si premem el botó repetidament, `index` pot augmentar fins a un valor que surti del rang de l'array. Això provocarà un error d'índex fora de rang. Per exemple, quan `index` arribi a 5 (mentre que l'interval vàlid és de 0 a 4), el programa fallarà.

Per evitar-ho, hem d'introduir un control de condició perquè `index` no superi el rang de l'array. Ho podem fer utilitzant una sentència `if-else` per comprovar si `index` és menor que la longitud de l'array.

## Control de condició: sentència if-else

La sentència `if-else` és una de les estructures condicionals més utilitzades en Swift. Serveix per comprovar si una condició és certa i, segons si ho és o no, executar blocs de codi diferents.

Estructura bàsica:

```swift
if condition {
    // Codi que s'executa quan condition és true
} else {
    // Codi que s'executa quan condition és false
}
```

En una sentència `if`, la condició `condition` és un valor booleà (`Bool`), que pot ser `true` o `false`. Si la condició és `true`, s'executa el codi de la part `if`; en cas contrari, s'executa la part `else`.

Per exemple:

```swift
let age = 25
if age > 18 {
    print("Big Boy")
} else {
    print("Little Body")
}
```

En aquest exemple, el valor d'`age` és 25. La sentència `if` comprova si `age > 18` és cert. Com que la condició es compleix, es mostra `"Big Boy"`.

Si no necessites la part `else`, la pots ometre:

```swift
if condition {
    // Codi que s'executa quan condition és true
}
```

### Utilitzar condicions per controlar el rang de l'índex

Per evitar que l'índex de l'array surti del rang, podem utilitzar una sentència `if` per assegurar-nos que `index` no superi el rang de l'array:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    }
}
```

Anàlisi de la lògica: el valor de `sayings.count` és 5, perquè hi ha 5 cites. Per tant, `sayings.count - 1` és 4, que també és l'últim índex vàlid de l'array.

Quan `index` és menor que 4, és segur augmentar-lo en 1 en prémer el botó. Un cop `index` arriba a 4, la condició ja no es compleix i prémer el botó no produirà cap canvi.

Ara el codi ja permet canviar de cita:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack {
            Text(sayings[index])
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                }
            }
        }
        .padding()
    }
}
```

### Cites en bucle

Si volem que, quan es mostri l'última cita, en prémer el botó es torni a mostrar la primera i així s'aconsegueixi una visualització cíclica, podem fer-ho amb la part `else`:

```swift
Button("Next") {
    if index < sayings.count - 1 {
        index += 1
    } else {
        index = 0
    }
}
```

Quan es premi el botó, si `index` ha arribat a l'últim element de l'array, es reiniciarà a 0 i les cites tornaran a començar des del principi.

## Optimitzar la vista de cites

Ara ja hem implementat la lògica del carrusel de cites, però encara podem millorar la interfície perquè sigui més agradable visualment.

Codi complet:

```swift
struct ContentView: View {
    @State private var index = 0
    let sayings = [
        "Slow progress is still progress.",
        "Difficult roads lead to beautiful destinations.",
        "Awake minds are the strongest.",
        "Long-term thinking wins over short-term tricks.",
        "Master one thing, and do it well."
    ]
    var body: some View {
        VStack(spacing: 10) {
            Text(sayings[index])
                .padding(20)
                .background(.white)
                .cornerRadius(10)
                .opacity(0.8)
            Button("Next") {
                if index < sayings.count - 1 {
                    index += 1
                } else {
                    index = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(
            Image("001")
        )
    }
}
```

En aquest exemple, la vista `Text` té un fons blanc semitransparent i cantonades arrodonides; el botó utilitza l'estil `.borderedProminent`; i `VStack` té una imatge de fons.

Punt de coneixement complementari: quan es fa servir el modificador `background()` per tractar una imatge de fons, el seu comportament per defecte és omplir tant com sigui possible l'àrea de disposició de la vista actual. En molts casos, s'estén de manera natural fins a cobrir la safe area.

Ara ja hem implementat la vista del carrusel de cites.

![SwiftUI View](../../RESOURCE/011_word.png)

## Resum

En aquesta lliçó hem après a utilitzar arrays per desar diverses cites i a fer-ne la rotació mitjançant sentències `if` i `if-else`.

També hem conegut les operacions bàsiques dels arrays, com afegir, eliminar i modificar elements, així com la manera d'evitar que els índexs surtin del rang.

Aquesta lliçó no només explica com implementar un carrusel de cites, sinó que també combina l'ús bàsic dels arrays i de les sentències condicionals per ajudar-nos a dominar la capacitat de gestionar dades i controlar el flux del programa.

## Coneixement ampliat - Múltiples condicions: sentència if-else if-else

En el desenvolupament real, sovint cal gestionar múltiples condicions. Per exemple, en un joc, quan la puntuació és igual a 1 es desencadena l'esdeveniment A, quan és igual a 2 es desencadena l'esdeveniment B, quan és igual a 3 es desencadena l'esdeveniment C, i així successivament.

Davant d'escenaris amb més de dues branques condicionals, necessitem utilitzar la sentència `if-else if-else` per fer comprovacions múltiples.

Sintaxi bàsica:

```swift
if conditionA {
    // Codi que s'executa quan conditionA és true
} else if conditionB {
    // Codi que s'executa quan conditionB és true
} else if conditionC {
    // Codi que s'executa quan conditionC és true
} else {
    // Codi que s'executa quan cap condició es compleix
}
```

En aquest cas, el programa comprova les condicions per ordre i executa la primera que es compleixi. Si no se'n compleix cap, s'executa el codi de l'`else`.

En el carrusel de cites, també podem utilitzar la sentència `if-else if-else` per fer múltiples comprovacions:

```swift
Button("Next") {
    if index == 0 {
        index += 1
    } else if index == 1 {
        index += 1
    } else if index == 2 {
        index += 1
    } else if index == 3 {
        index += 1
    } else if index == 4 {
        index = 0
    } else {
        index = 0
    }
}
```

Quan `index` és 0, 1, 2 o 3, cada vegada que es prem el botó s'executa `index += 1`; quan `index` és 4, és a dir, l'últim element, `index` es reinicia a 0 i així s'aconsegueix el bucle.

La branca `else` serveix com a protecció final per evitar valors invàlids, per exemple si `index` ha estat modificat incorrectament.

Cal tenir en compte que aquí `==` significa "és igual a". Si la sentència `if` comprova que `index` és igual a un nombre concret, el resultat serà `true` i s'executarà el bloc de codi següent. Si no és igual, es passarà a la comprovació següent.

Aquest tipus de comprovació múltiple és útil per executar codi diferent segons escenaris condicionals diferents.
