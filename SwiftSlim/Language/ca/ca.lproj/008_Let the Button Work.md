# Fer que el botó comenci a funcionar

En aquesta lliçó estudiarem principalment el botó `Button`, la sortida de depuració amb `print` i les funcions de Swift.

Aquests continguts són la base de la programació interactiva a SwiftUI.

## Botó

Els botons són un dels controls d'interfície més habituals. Quan necessitem descarregar, obrir o sortir d'alguna cosa, normalment fem clic en un botó.

Per exemple, a l'App Store, fem clic al botó `Get` per descarregar una app.

![Button](../../RESOURCE/008_button.png)

A SwiftUI, els botons es representen amb `Button`.

Ús bàsic:

```swift
Button("") {
    
}
```

L'estructura es pot dividir en dues parts:

```swift
Button("Text del botó") {
    Codi que s'executa quan es prem el botó
}
```

Per exemple:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Després d'executar-lo, es mostrarà un botó `Start`.

![Button](../../RESOURCE/008_button1.png)

Quan l'usuari fa clic al botó, s'executa el codi que hi ha dins de `{}`.

Cal tenir en compte que `Button` és un control d'interfície de SwiftUI (`View`), així que s'ha d'escriure obligatòriament dins de `body`.

### Modificador `buttonStyle`

A SwiftUI, `Button` ofereix estils de botó integrats del sistema, i es poden utilitzar mitjançant el modificador `buttonStyle`.

Per exemple:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

`buttonStyle` aplicarà un estil de botó proporcionat pel sistema.

Les opcions habituals inclouen:

- `.automatic`
- `.plain`
- `.bordered`
- `.borderedProminent`
- `.borderless`

![Button](../../RESOURCE/008_button7.png)

La diferència entre els diversos estils es reflecteix principalment en si el botó té vora, fons i en el seu grau d'èmfasi visual.

## Sortida amb `print`

En programació, sovint necessitem comprovar si el programa ha arribat a una determinada secció del codi.

Swift proporciona la funció `print` per mostrar informació de depuració.

Escriptura bàsica:

```swift
print("Hello")
```

Aquesta línia mostrarà el text a la `Console`.

### Provar si el botó funciona

Podem escriure `print` dins d'un botó per comprovar si realment s'està prement.

```swift
Button("Start") {
    print("Test 123")
}
```

Quan es prem el botó, la `Console` mostrarà:

```text
Test 123
```

Això indica que el botó ja s'ha activat correctament.

![Button](../../RESOURCE/008_button3.png)

Nota: `print` és codi Swift, no és un control d'interfície. No es pot posar directament dins de `body`, perquè causaria un error.

Per exemple, el codi següent és incorrecte:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Error: body ha de retornar una View
    }
}
```

A SwiftUI, `body` s'utilitza per descriure l'estructura de la interfície, així que només hi poden aparèixer controls visuals (`View`), com `Text`, `Button`, `Image`, etc.

El codi ordinari (lògica de càlcul, `print`, etc.) s'ha de posar dins de botons, funcions o altres controladors d'esdeveniments.

### `Console`

El contingut mostrat amb `print` apareix a la `Console` d'Xcode.

Si no veus la `Console`, pots fer clic al botó `Show the Debug Area` de la cantonada inferior dreta per obrir l'àrea de depuració, i després prémer `Show the Console` per mostrar la consola.

![](../../RESOURCE/008_button4.png)

A la part inferior esquerra de la `Console` hi ha dues pestanyes: `Executable` i `Previews`.

![](../../RESOURCE/008_button5.png)

Aquestes dues pestanyes corresponen a entorns d'execució diferents: quan fem preview d'una vista al `Canvas`, la sortida de `print` apareix a la pestanya `Previews`; si l'app s'executa al simulador o en un dispositiu real, la sortida apareix a `Executable`.

Per tant, si veus que `print` no mostra res, primer comprova que has seleccionat la pestanya correcta.

## Exemple - dibuix ASCII

En alguns projectes de codi és habitual veure dibuixos ASCII.

Un dibuix ASCII és una figura construïda amb caràcters normals. Per exemple:

![ASCII](../../RESOURCE/008_ascii.png)

Podem utilitzar un botó + `print` per mostrar un dibuix ASCII.

Codi d'exemple:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Quan es prem el botó, la `Console` mostrarà:

```text
 /\_/\
( o.o )
 > ^ <
```

Nota: dins d'una cadena, `\` s'ha d'escriure escapat, perquè la barra inversa és un caràcter d'escapament en les cadenes.

## Funcions

Dins d'un botó, podem escriure el codi directament.

Per exemple:

```swift
Button("Start") {
    print("Hello")
}
```

Si hi ha poc codi, aquesta manera d'escriure'l no és cap problema. Però en el desenvolupament real, la lògica que desencadena un botó pot ser molt més extensa.

Per exemple:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Potser hi ha molt més codi
}
```

Si el codi continua creixent, escriure'l directament dins del botó farà que el codi de la interfície sigui caòtic i també dificultarà la lectura i el manteniment.

Per això, normalment organitzem aquest codi dins d'una funció i després cridem aquesta funció des del botó.

### Què és una funció

Una funció és un bloc de codi reutilitzable.

Quan cal executar un cert codi, només hem de cridar la funció, i el codi que hi ha dins s'executarà.

Això ajuda a fer l'estructura del codi més clara i també facilita la reutilització.

### Escriptura bàsica

A Swift, les funcions es defineixen amb la paraula clau `func`:

```swift
func randomInt() {
    // code
}
```

Aquest codi defineix una funció.

`randomInt` és el nom de la funció i serveix per identificar aquest bloc de codi.

`()` indica la posició dels paràmetres, on podem rebre dades que ens arribin de fora. Si no en necessitem, ho podem deixar buit.

L'interior de `{}` és la zona de codi de la funció, i tot allò que s'hagi d'executar s'escriu aquí.

Per exemple:

```swift
func getName() {
    print("FangJunyu")
}
```

La funció d'aquest codi és mostrar un text.

### Cridar una funció

Definir una funció només crea aquest bloc de codi. Si volem executar-la, encara l'hem de cridar.

La manera de cridar-la és afegir `()` darrere del nom:

```swift
getName()
```

Quan el programa arriba a aquesta línia, executa el codi de la funció `getName`.

Exemple complet:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Després d'executar-ho, la `Console` mostrarà:

```text
FangJunyu
```

### Utilitzar funcions a SwiftUI

En una vista SwiftUI, les funcions normalment s'escriuen fora de `body`.

Per exemple:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Quan es prem el botó, es crida la funció `getName()`.

D'aquesta manera, el codi de la interfície es manté net i la lògica concreta es tracta dins de la funció.

### Paràmetres de funció

De vegades, una funció necessita dur a terme operacions diferents segons les dades que rep.

Per exemple, potser volem que la funció mostri noms diferents, i no sempre el mateix `"FangJunyu"`.

En aquest cas podem utilitzar paràmetres, que es poden entendre com les dades passades en el moment de cridar la funció.

Per exemple:

```swift
func getName(name: String) {
    print(name)
}
```

Aquesta funció afegeix un paràmetre nou. `name` és el nom del paràmetre i `String` n'és el tipus.

Això vol dir que la funció necessita rebre una dada de tipus `String`.

Com que la funció ara necessita dades, quan la cridem hem de proporcionar-les obligatòriament.

```swift
getName(name: "Sam")
```

Quan es passa `"Sam"` en la crida, la funció utilitzarà aquest valor per mostrar-lo.

Resultat de l'execució:

```text
Sam
```

## Exemple - utilitzar una funció per mostrar un dibuix ASCII

En els exemples anteriors, escrivíem `print` directament dins del botó.

Però si el dibuix és més complex, el codi es farà molt llarg. En aquest cas, podem posar la lògica dins d'una funció i fer que el codi de la interfície sigui més clar.

Codi d'exemple:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Després d'executar-ho, en prémer el botó, la `Console` mostrarà:

```text
 /\_/\
( o.o )
 > ^ <
```

Aquí passen dues coses quan l'usuari prem el botó:

1. el botó crida la funció `printCat()`
2. s'executa el codi `print` que hi ha dins de la funció

D'aquesta manera, el codi de la interfície només s'encarrega d'activ ar l'esdeveniment, i la lògica concreta es tracta dins de la funció.

En el desenvolupament real, la major part de les operacions dels botons es duen a terme mitjançant funcions.

## Resum

En aquesta lliçó hem après tres continguts importants:

**1. Botó `Button`**

`Button` és el control de SwiftUI que s'utilitza per desencadenar accions.

```swift
Button("Start") {

}
```

Quan l'usuari fa clic al botó, s'executa el codi que hi ha dins de les claus.

**2. Sortida amb `print`**

`print` serveix per mostrar informació de depuració a la `Console`.

```swift
print("Hello")
```

El desenvolupador pot utilitzar la `Console` per observar l'estat d'execució del programa.

**3. Funcions**

Una funció és un bloc de codi reutilitzable.

```swift
func sayHello() {
    print("Hello")
}
```

Cridar una funció:

```swift
sayHello()
```

Si la funció necessita dades, podem utilitzar paràmetres:

```swift
func sayHello(name: String) {
    print(name)
}
```

En les següents lliçons continuarem aprenent més controls de SwiftUI i també veurem com les dades interactuen amb la interfície.

## Exercicis

Intenta completar els exercicis següents:

1. crea un botó amb el text `"Hello"`
2. quan es premi el botó, mostra `Hello Swift` a la `Console`
3. escriu el codi de sortida dins d'una funció i després crida aquesta funció des del botó
