# Enciclopèdia d’animals

En aquesta lliçó, continuarem practicant les vistes personalitzades i el pas de dades.

Crearem una vista senzilla d’enciclopèdia d’animals. La pàgina mostrarà cinc animals. Quan toquis un animal, apareixerà una vista de detall que mostrarà la imatge de l’animal, l’àrea de distribució, l’hàbitat i la descripció.

Resultat final:

![view](../../../Resource/029_view.png)

Amb aquest cas, podem practicar com treballen conjuntament les estructures de dades, la visualització de llistes, la interacció amb toc i la presentació amb Sheet.

## Preparar els recursos d’imatge

Primer, hem de preparar cinc imatges d’animals:

- Dofí: `dolphin.jpg`
- Girafa: `giraffe.jpg`
- Lleó: `lion.jpg`
- Panda: `panda.jpg`
- Ós polar: `polarBear.jpg`

Pots utilitzar els recursos d’imatge següents:

[Dofí](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Girafa](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lleó](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Ós polar](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

Després de descarregar les imatges, arrossega-les a la carpeta de recursos `Assets` del projecte de Xcode.

![assets](../../../Resource/029_assets.png)

Tingues en compte que, quan utilitzes imatges al codi, normalment no cal escriure l’extensió `.jpg`.

Per exemple, si el nom del recurs d’imatge és `dolphin`, escriu això al codi:

```swift
Image("dolphin")
```

Si el nom de la imatge està escrit incorrectament, la imatge no es mostrarà correctament.

Nota: els recursos d’imatge anteriors provenen de projectes de Wikimedia. Quan els utilitzis, es recomana conservar els enllaços originals i la informació de la font.

## Crear l’estructura Animal

En aquesta pàgina, cada animal té diverses dades:

- Nom de l’animal
- Imatge de l’animal
- Emoji de l’animal
- Àrea de distribució
- Hàbitat
- Descripció de l’animal

Si dividim aquesta informació en moltes variables separades, el codi es tornarà confús. Per això, podem crear una estructura `Animal` i mantenir junta la informació d’un animal.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

En aquest codi:

- `id`: l’identificador únic de l’animal.
- `name`: el nom de l’animal.
- `imageName`: el nom de la imatge de l’animal.
- `avatarEmoji`: l’emoji de l’animal.
- `distributionArea`: l’àrea de distribució.
- `habitat`: l’hàbitat.
- `animalDescription`: la descripció de l’animal.

Entre aquests valors:

```swift
let id = UUID()
```

`id` s’utilitza per identificar cada animal. Més endavant utilitzarem `ForEach` per mostrar la llista d’animals i `.sheet(item:)` per presentar els detalls segons l’animal seleccionat, per tant `Animal` ha de complir el protocol `Identifiable`.

La funció de `Identifiable` és indicar a SwiftUI que cada animal té un `id` que permet distingir-ne la identitat.

## Crear les dades dels animals

A continuació, creem un array d’animals a `ContentView`.

L’array desa cinc valors `Animal`, i cada `Animal` representa un animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dofí
        Animal(
            name: "Dofí",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceans càlids i temperats d’arreu del món.",
            habitat: "Oceans, aigües costaneres i alguns grans rius.",
            animalDescription: "Els dofins són mamífers marins intel·ligents. Viuen en grups, es comuniquen amb sons i són coneguts pel seu comportament juganer."
        ),
        // Girafa
        Animal(
            name: "Girafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sabanes i boscos oberts d’Àfrica.",
            habitat: "Praderies, sabanes i boscos oberts.",
            animalDescription: "Les girafes són els animals terrestres més alts. Tenen el coll llarg, les potes llargues i normalment s’alimenten de fulles d’arbres alts."
        ),
        // Lleó
        Animal(
            name: "Lleó",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Es troben principalment a l’Àfrica subsahariana, amb una petita població a l’oest de l’Índia.",
            habitat: "Praderies, sabanes i boscos oberts.",
            animalDescription: "Els lleons són grans felins poderosos. Normalment viuen en grups anomenats manades i sovint se’ls coneix com els reis del món animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Boscos de muntanya del centre de la Xina.",
            habitat: "Boscos de bambú en zones muntanyoses fresques i humides.",
            animalDescription: "Els pandes són óssos coneguts pel seu pelatge blanc i negre. Mengen principalment bambú i són un dels animals més reconeixibles del món."
        ),
        // Ós polar
        Animal(
            name: "Ós polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regions àrtiques al voltant del pol Nord.",
            habitat: "Gel marí, zones costaneres i entorns àrtics freds.",
            animalDescription: "Els óssos polars són grans óssos adaptats als entorns freds. Són bons nedadors i depenen sobretot del gel marí per caçar foques."
        )
    ]

    var body: some View {
        Text("Enciclopèdia d’animals")
    }
}
```

Aquí, `animals` és un array:

```swift
let animals: [Animal]
```

`[Animal]` indica que aquest array desa diversos valors `Animal`.

És a dir, `animals` no és un sol animal, sinó un grup d’animals.

## Mostrar la llista d’animals

Ara podem utilitzar `ForEach` per mostrar la llista d’animals.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Resultat mostrat:

![view](../../../Resource/029_view1.png)

En aquest codi:

```swift
ForEach(animals) { animal in
    ...
}
```

Això significa recórrer l’array `animals`.

En cada volta del bucle, `animal` representa l’animal que s’està mostrant en aquell moment.

Per exemple, en la primera volta del bucle, `animal` és el dofí; en la segona volta, `animal` és la girafa.

Per tant, podem mostrar la informació de l’animal actual de la manera següent:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

Així es mostren els cinc animals.

## Fer que la llista d’animals sigui tocable

Ara la llista ja es mostra, però encara no es pot tocar.

Si volem presentar els detalls després de tocar un animal, primer hem de registrar “l’animal seleccionat actualment”.

Per tant, afegeix una variable d’estat a `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Aquí, `selectedAnimal` és un valor opcional de tipus `Animal?`.

Això significa que pot contenir un animal o no contenir-ne cap.

El valor predeterminat és `nil`, cosa que significa que al començament no hi ha cap animal seleccionat.

Després, convertim cada fila d’animal en un `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

La línia clau és aquesta:

```swift
selectedAnimal = animal
```

Quan l’usuari toca un animal, desem aquest animal a `selectedAnimal`.

Per exemple, si l’usuari toca el dofí, `selectedAnimal` desa el dofí.

Si l’usuari toca el panda, `selectedAnimal` desa el panda.

És a dir, `selectedAnimal` registra quin animal acaba de tocar l’usuari.

## Presentar una vista Sheet

Ara podem utilitzar el botó per registrar “l’animal tocat actualment”.

A continuació, hem d’implementar una vista presentada per mostrar els detalls de l’animal.

![view](../../../Resource/029_view2.png)

A SwiftUI, podem utilitzar `Sheet` per implementar aquest efecte de presentació.

Un `Sheet` es pot entendre com una pàgina que es presenta temporalment. Apareix per sobre de la pàgina actual i, després de veure’n el contingut, l’usuari pot lliscar cap avall per tancar-la.

## Exemple de Sheet

Abans de mostrar els detalls de l’animal, utilitzem un exemple senzill per entendre com es presenta un `Sheet`.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Mostra el Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Vista Sheet")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Resultat mostrat:

![view](../../../Resource/029_view3.png)

En aquest codi, creem un valor booleà:

```swift
@State private var showSheet = false
```

`showSheet` és `false` de manera predeterminada, cosa que significa que el `Sheet` no es mostra al començament.

Quan es toca el botó:

```swift
showSheet.toggle()
```

`toggle()` significa canviar el valor booleà.

Si originalment era `false`, després de cridar `toggle()` es converteix en `true`.

Si originalment era `true`, després de cridar `toggle()` es converteix en `false`.

Per tant, després de tocar el botó, `showSheet` canvia de `false` a `true`.

Quan `showSheet` es converteix en `true`, el codi següent presenta el `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Aquest codi significa: quan `showSheet` és `true`, presenta un `Sheet` i mostra `Text("Vista Sheet")` dins del `Sheet`.

Resultat mostrat:

![view](../../../Resource/029_view4.png)

Aquesta forma és adequada per presentar contingut fix.

Per exemple, després de tocar un botó, pot presentar una pàgina de configuració, una pàgina d’instruccions, una pàgina d’avís, etc.

### On col·locar Sheet

Tot i que `Sheet` és una vista presentada, a SwiftUI no s’escriu directament com una vista independent com `Text()` o `Image()`. En canvi, s’utilitza com a modificador de vista.

És a dir, `.sheet(...)` és similar a modificadors com `.font()`, `.padding()` i `.shadow()`. S’ha d’afegir després d’una vista.

Per exemple:

```swift
Button("Mostra el Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

En aquest exemple, `.sheet` s’afegeix després del `Button`.

Quan `showSheet` es converteix en `true`, SwiftUI presenta el `Sheet` i mostra el contingut que hi ha dins de les claus:

```swift
Text("Vista Sheet")
```

Tanmateix, en el desenvolupament real, si una pàgina té diversos botons, normalment no afegim un `.sheet` a cada botó.

Un enfocament més habitual és afegir `.sheet` després de la vista exterior.

Per exemple:

```swift
VStack {
    Button("Mostra el Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

El botó s’encarrega de canviar `showSheet`, i la vista exterior s’encarrega de presentar el `Sheet` segons si `showSheet` és `true`.

## Vincular Sheet a un valor opcional

La forma que hem après abans era:

```swift
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Aquesta forma és adequada per controlar la visualització i l’ocultació d’una pàgina fixa.

Tanmateix, en el cas de l’enciclopèdia d’animals, no només hem de saber “si cal presentar el `Sheet`”, sinó també “quin animal s’ha tocat”.

Per exemple:

Si l’usuari toca el dofí, el `Sheet` hauria de mostrar els detalls del dofí.

Si l’usuari toca el panda, el `Sheet` hauria de mostrar els detalls del panda.

Per això, aquí és més adequada una altra forma d’escriure el Sheet:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Contingut que es mostra al Sheet
}
```

En aquest codi, `Sheet` està vinculat a un valor opcional, `selectedAnimal`.

Tingues en compte que després de `item:` escrivim `$selectedAnimal`, no `selectedAnimal`.

Això és perquè `Sheet` no només llegeix el valor de `selectedAnimal`; també ha de decidir si s’ha de presentar segons els seus canvis.

Pots entendre aquest codi així:

- Quan `selectedAnimal` és `nil`, el `Sheet` no es mostra.
- Quan `selectedAnimal` té un valor, el `Sheet` es mostra.
- Quan el `Sheet` es tanca, SwiftUI torna a canviar `selectedAnimal` a `nil`.

SwiftUI passa l’animal desat a `selectedAnimal` a l’`animal` que hi ha dins de les claus.

És a dir, `.sheet(item:)` no només controla la presentació, sinó que també passa les dades seleccionades al `Sheet`.

## Utilitzar Sheet per mostrar el nom de l’animal

Ara, no t’afanyis encara a crear una vista de detall complexa.

Per fer que el codi sigui més fàcil d’entendre, primer mostrarem el nom de l’animal actual al `Sheet`.

Afegeix `.sheet(item:)` fora del `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

La part més important aquí és aquest codi:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Quan `selectedAnimal` té un valor, el `Sheet` es presenta.

L’`animal` que hi ha dins de les claus és l’animal seleccionat actualment.

Per tant:

```swift
Text(animal.name)
```

Això mostra el nom de l’animal que s’ha tocat actualment.

Per exemple, toca `Dofí` i el Sheet mostrarà `Dofí`.

Toca `Panda` i el `Sheet` mostrarà `Panda`.

D’aquesta manera, hem implementat l’efecte de tocar animals diferents i presentar noms d’animals diferents.

Mostrar el nom de l’animal:

![view](../../../Resource/029_view5.png)

Tanmateix, els detalls de l’animal no haurien de mostrar només un nom. També haurien de mostrar el nom, l’àrea de distribució, l’hàbitat i la descripció.

Si escrivim tot aquest codi dins de `.sheet`, el codi es tornarà molt llarg i difícil de llegir.

Per això, a continuació crearem una nova vista personalitzada encarregada específicament de mostrar els detalls de l’animal.

## Crear la vista de detall de l’animal

A continuació, creem una nova vista personalitzada anomenada `AnimalDetailView`.

Aquesta vista rep un `Animal` i mostra els detalls de l’animal.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Àrea de distribució**: \(animal.distributionArea)")

                    Divider()

                    Text("**Hàbitat**: \(animal.habitat)")

                    Divider()

                    Text("**Descripció de l’animal**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Resultat mostrat:

![view](../../../Resource/029_view2.png)

El punt clau aquí és:

```swift
var animal: Animal
```

Això significa que `AnimalDetailView` ha de rebre un animal des de fora.

Després de rebre l’animal, la vista de detall pot utilitzar les diverses dades de l’animal:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

És a dir, `AnimalDetailView` només s’encarrega de mostrar l’animal que se li passa.

### Text en negreta amb Markdown

A la vista de detall, hem escrit un codi com aquest:

```swift
Text("**Hàbitat:** \(animal.habitat)")
```

Aquí hi ha dos punts que cal entendre.

Primer, `**Hàbitat:**` utilitza la sintaxi de `Markdown`. El text envoltat per dos asteriscs es mostrarà en negreta.

Segon, `\()` és interpolació de cadenes i pot mostrar el valor d’una variable dins del text.

Aquest codi mostra primer `Hàbitat:` en negreta i després mostra l’hàbitat de l’animal.

## Mostrar la vista de detall al Sheet

Després de crear `AnimalDetailView`, podem tornar a `ContentView` i substituir la vista de nom original del `Sheet` per la vista de detall.

Originalment era:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Ara canvia-ho per:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Aquí, `animal:` és el nom del paràmetre de `AnimalDetailView`.

L’`animal` que hi ha després és l’animal actual que passa `.sheet(item:)`.

És a dir, passa l’animal tocat actualment a `AnimalDetailView` perquè el mostri.

Estructura completa:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

Quan l’usuari toca un animal:

```swift
selectedAnimal = animal
```

`selectedAnimal` canvia de `nil` a un animal concret. Quan el `Sheet` detecta que `selectedAnimal` té un valor, presenta la vista.

El `Sheet` passa l’animal de `selectedAnimal` a la vista `AnimalDetailView`, i `AnimalDetailView` mostra els detalls de l’animal.

D’aquesta manera, hem implementat la funció de tocar la llista d’animals i presentar els detalls de l’animal corresponent.

## Diferències entre les dues formes de Sheet

Ara hem utilitzat `.sheet(item:)` per completar la visualització de la vista de detall de l’animal.

Aquí podem resumir breument les dues formes habituals de `Sheet`.

### La primera forma és vincular un valor booleà

```swift
@State private var showSheet = false

Button("Mostra el Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Vista Sheet")
}
```

Aquesta forma és adequada per presentar contingut fix, com ara una pàgina de configuració, una pàgina d’instruccions, una pàgina d’avís, etc.

`showSheet` és un valor booleà amb només dos estats: `true` i `false`.

Quan `showSheet` és `true`, el `Sheet` es mostra.

Quan `showSheet` és `false`, el `Sheet` no es mostra.

### La segona forma és vincular un valor opcional

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Aquesta forma és adequada per presentar contingut diferent segons les dades seleccionades.

En aquesta lliçó, toquem animals diferents i hem de mostrar detalls diferents, per això és més adequat utilitzar `.sheet(item:)`.

## Codi complet

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Nom de l’animal
    let name: String
    
    // Imatge de l’animal
    let imageName: String
    
    // Emoji de l’animal
    let avatarEmoji: String
    
    // Àrea de distribució
    let distributionArea: String
    
    // Hàbitat
    let habitat: String
    
    // Descripció de l’animal
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dofí
        Animal(
            name: "Dofí",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Oceans càlids i temperats d’arreu del món.",
            habitat: "Oceans, aigües costaneres i alguns grans rius.",
            animalDescription: "Els dofins són mamífers marins intel·ligents. Viuen en grups, es comuniquen amb sons i són coneguts pel seu comportament juganer."
        ),
        // Girafa
        Animal(
            name: "Girafa",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Sabanes i boscos oberts d’Àfrica.",
            habitat: "Praderies, sabanes i boscos oberts.",
            animalDescription: "Les girafes són els animals terrestres més alts. Tenen el coll llarg, les potes llargues i normalment s’alimenten de fulles d’arbres alts."
        ),
        // Lleó
        Animal(
            name: "Lleó",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Es troben principalment a l’Àfrica subsahariana, amb una petita població a l’oest de l’Índia.",
            habitat: "Praderies, sabanes i boscos oberts.",
            animalDescription: "Els lleons són grans felins poderosos. Normalment viuen en grups anomenats manades i sovint se’ls coneix com els reis del món animal."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Boscos de muntanya del centre de la Xina.",
            habitat: "Boscos de bambú en zones muntanyoses fresques i humides.",
            animalDescription: "Els pandes són óssos coneguts pel seu pelatge blanc i negre. Mengen principalment bambú i són un dels animals més reconeixibles del món."
        ),
        // Ós polar
        Animal(
            name: "Ós polar",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Regions àrtiques al voltant del pol Nord.",
            habitat: "Gel marí, zones costaneres i entorns àrtics freds.",
            animalDescription: "Els óssos polars són grans óssos adaptats als entorns freds. Són bons nedadors i depenen sobretot del gel marí per caçar foques."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Àrea de distribució**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Hàbitat**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Descripció de l’animal**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Resum

En aquesta lliçó, hem completat una pàgina senzilla d’enciclopèdia d’animals.

Primer hem utilitzat l’estructura `Animal` per desar la informació dels animals, després hem utilitzat un array per desar cinc animals i, finalment, hem utilitzat `ForEach` per mostrar la llista d’animals.

Quan l’usuari toca un animal, desem aquest animal a `selectedAnimal`:

```swift
selectedAnimal = animal
```

Quan `selectedAnimal` té un valor, `.sheet(item:)` presenta la vista de detall i passa l’animal seleccionat a `AnimalDetailView`.

La part més important d’aquesta lliçó no és l’estil de la interfície, sinó entendre aquesta ruta de pas de dades:

```swift
Tocar animal → selectedAnimal desa l’animal → es presenta Sheet → AnimalDetailView mostra els detalls
```

Després d’entendre aquesta ruta, més endavant podràs crear més funcions similars, com ara detalls de producte, detalls de curs, detalls d’article, detalls de contacte, etc.
